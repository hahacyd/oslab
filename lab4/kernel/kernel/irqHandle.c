#include "x86.h"
#include "device.h"

void syscallHandle(TrapFrame *tf);
void timeHandle(TrapFrame *tf);
void GProtectFaultHandle(TrapFrame *tf);
//static void print_char(int row, int col, char c);
extern int32_t current_running_pid;
int32_t (*sys_call_handle[145])(TrapFrame *);
int32_t add_sys_handler(int index, int32_t (*hander)(TrapFrame *))
{
	//if(NULL == sys_call_handle[index]){
	sys_call_handle[index] = hander;
	//}
	return 1;
}
void irqHandle(TrapFrame *tf)
{
	/*
	 * 中断处理程序
	 */
	/* Reassign segment register */
	asm volatile("movl %0, %%eax" ::"r"(KSEL(SEG_KDATA)));
	asm volatile("movw %ax, %ds");
	asm volatile("movw %ax, %fs");
	asm volatile("movw %ax, %es");

	//asm volatile("movl %0, %%eax" ::"r"(KSEL(SEG_KCODE)));
	//asm volatile("movw %ax, %cs");

	asm volatile("movl %0, %%eax" ::"r"(KSEL(SEG_VIDEO)));
	asm volatile("movw %ax, %gs");

	uint32_t ebp = 0;
	asm volatile("movl %%ebp,%0"
				 : "=r"(ebp));

	uint32_t *esp = (void *)ebp + 8;
	//现在只要修改*esp的值就可以改变 esp寄存器指向的内核地址了，

	assert(*esp == (uint32_t)tf);
	int32_t x = GET_CUR_PID;
	//asm volatile("movl %0,%%ebp" ::"m"(esp));
	//asm volatile("movl %0,%%")
	//disableInterrupt(); //when cpu is handling interrupt,ignore other interrupt;
	disableInterrupt();
	switch (tf->irq)
	{
	case -1:
		//putChar('h');
		break;
	case 0xd:
		GProtectFaultHandle(tf);
		break;
	case 0x80:
		syscallHandle(tf);
		break;
	case 0x20:

		timeHandle(tf);

		break;
	default:
		LOG("irq = %d eip = 0x%x", tf->irq, tf->eip);
		assert(0);
	}
	if ((0x80 == tf->irq || 0x20 == tf->irq) && GET_CUR_PID != x) //说明切进程了
	{
		//进入这个函数说明已经切换进程了，且内核栈已经切换了
		//这有一个不好理解的地方是，esp是栈帧后的一个地址，在asmDoIrq里我把add 4 %esp 改成了popl %esp,这样esp会被定位到新进程的内核栈，
		*esp = (uint32_t)(pcb[GET_CUR_PID].stack + MAX_STACK_SIZE - 1) - 0x3c - 0x10; //直接定位到内核栈的栈帧部分，

		TrapFrame *temp = (void *)(*esp);
		*temp = pcb[GET_CUR_PID].tf; //实际上这个的实际作用是某个进程被第一次加载是把tf的内容复制到内核栈，在以后切换此进程是不需要的，

		change_gdt(USEL(SEG_UDATA), GET_CUR_PID * PROC_MEMSZ);
		change_gdt(USEL(SEG_UCODE), GET_CUR_PID * PROC_MEMSZ);

		if (1 <= GET_CUR_PID)
		{
			//LOG("eip = %x\n", pcb[1].tf.eip);
			assert(0x200000 <= tf->eip);
		}
	}
	//assert(pcb[0].tf.cs == SEG_KCODE);
	enableInterrupt();
	return;
}

void syscallHandle(TrapFrame *tf)
{
	/* 
	* sys_call_handle是函数指针数组，tf->eax作为索引可以
	* 快速的获得对应的,处理函数，加快处理速度；
	* 当然是通过add_sys_handler来提前注册好处理函数了
	*/
	tf->eax = sys_call_handle[tf->eax](tf);
	return;
}
void GProtectFaultHandle(TrapFrame *tf)
{
	LOG("%d \n", tf->irq);
	assert(0);
	return;
}

#define SELECTOR(ss) (ss >> 3)

void timeHandle(TrapFrame *tf)
{
	//putChar('A');
	//printk("%d", getpid());
	pcb[GET_CUR_PID].timeCount -= 1;

	block_decrease();

	check_block();

	if (pcb[GET_CUR_PID].timeCount <= 0)
	{
		put_into_runnable(GET_CUR_PID, tf);

		int32_t x = get_from_runnable();
		//#ifdef DEBUG
		//LOG("\n==> %d\n", x);
		//#endif
		put_into_running(x, tf);
	}
	if (0 == getpid())
	{
		printk("~");
	}
	else
	{
		printk("%d", getpid());
	}
	//putChar('E');
}
void initSyscallHander()
{
	add_sys_handler(__NR_exit, sys_exit);
	add_sys_handler(__NR_fork, sys_fork);
	add_sys_handler(__NR_read, sys_read);
	add_sys_handler(__NR_write, sys_write);

	add_sys_handler(__NR_getpid, sys_getpid);
	add_sys_handler(__NR_clock_nanosleep, sys_sleep);

	add_sys_handler(__NR_sem_init, sys_sem_init);
	add_sys_handler(__NR_sem_wait, sys_sem_wait);
	add_sys_handler(__NR_sem_post, sys_sem_post);
	add_sys_handler(__NR_sem_destroy, sys_sem_destroy);
}