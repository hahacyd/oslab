#include "x86.h"
#include "device.h"
//ProcessTable pcb[MAX_PCB_NUM];
//static char *i2A(int a);

void syscallHandle(TrapFrame *tf);
void timeHandle(TrapFrame *tf);
void GProtectFaultHandle(TrapFrame *tf);
//static void print_char(int row, int col, char c);
extern int32_t current_running_pid;
void irqHandle(struct TrapFrame *tf)
{
	/*
	 * 中断处理程序
	 */
	/* Reassign segment register */
	asm volatile("movl %0, %%eax" ::"r"(KSEL(SEG_KDATA)));
    asm volatile("movw %ax, %ds");
    asm volatile("movw %ax, %fs");
    asm volatile("movw %ax, %es");

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
	disableInterrupt(); //when cpu is handling interrupt,ignore other interrupt;
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
		LOG("irq = %d eip = 0x%x", tf->irq,tf->eip);
		assert(0);
	}
	if ((0x80 == tf->irq || 0x20 == tf->irq) && GET_CUR_PID != x) //说明切进程了
	{	//进入这个函数说明已经切换进程了，且内核栈已经切换了
		//这有一个不好理解的地方是，esp是栈帧后的一个地址，在asmDoIrq里我把add 4 %esp 改成了popl %esp,这样esp会被定位到新进程的内核栈，
		*esp = (uint32_t)(pcb[GET_CUR_PID].stack + MAX_STACK_SIZE - 1) - 0x3c - 0x10;   //直接定位到内核栈的栈帧部分，

		TrapFrame *temp = (void *)(*esp);
		*temp = pcb[GET_CUR_PID].tf;   //实际上这个的实际作用是某个进程被第一次加载是把tf的内容复制到内核栈，在以后切换此进程是不需要的，
		
		//if(0 != GET_CUR_PID){
			LOG("pid: %d => %d", x, GET_CUR_PID);
			change_gdt(USEL(SEG_UDATA), GET_CUR_PID * PROC_MEMSZ);
		//}
	}

	enableInterrupt();

	return;
}

void syscallHandle(TrapFrame *tf)
{
	/* 实现系统调用*/
	switch (tf->eax)
	{
	case __NR_write:
		
		sys_write(tf);
		break;
	case __NR_clock_nanosleep:
		sys_sleep(tf);
		break;
	case __NR_exit:
		sys_exit(tf);
		break;
	case __NR_fork:
		tf->eax = sys_fork(tf);
		break;
	case __NR_getpid:
		tf->eax = sys_getpid(tf);
	default:
		return; /**/
	}
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
	putChar('A');
	pcb[getpid()].timeCount -= 1;

	block_decrease();
	checkTimeCount(tf);
	putChar('E');
}