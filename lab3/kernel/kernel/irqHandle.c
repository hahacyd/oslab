#include "x86.h"
#include "device.h"
//ProcessTable pcb[MAX_PCB_NUM];
//static char *i2A(int a);

void syscallHandle(struct TrapFrame *tf);
void timeHandle(struct TrapFrame *tf);
void GProtectFaultHandle(struct TrapFrame *tf);
//static void print_char(int row, int col, char c);
extern int32_t current_running_pid;
void irqHandle(struct TrapFrame *tf)
{
	/*
	 * 中断处理程序
	 */
	/* Reassign segment register */
	//putChar('x');
	//pcb[current_running_pid].tf = *(TrapFrame2 *)tf;
//LOG("tf = %x", (uint32_t)tf);
	//assert(0);
	//tf = (void*)1;
	uint32_t ebp = 0;
	asm volatile("movl %%ebp,%0"
				 : "=m"(ebp));
		
	uint32_t *esp = (void *)ebp + 8;
	//现在只要修改*esp的值就可以改变 esp寄存器指向的内核地址了，
	assert(*esp == (uint32_t)tf);

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
		assert(0);
	}
	//printk("core_esp = %x", pcb[getpid()].core_esp);
	//*esp = pcb[getpid()].core_esp;
	enableInterrupt();
	return;
	//this will screctly change process context by change current_running_pid;
	//*(TrapFrame2 *)tf = pcb[current_running_pid].tf;
}

void syscallHandle(struct TrapFrame *tf)
{
	/* 实现系统调用*/
	//asm volatile("int $0x20");
	//asm volatile("mov %0,%%gs:" ::"a"(6 << 3));
	//LOG("irq = 0x%x\n",tf->irq);
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
	default:
			return;/**/
	}
	return;
	//enterUserSpace(1);
}
void GProtectFaultHandle(struct TrapFrame *tf)
{
	//printk("%d \n", tf->irq);
	LOG("%d \n",tf->irq);
	assert(0);
	return;
}

#define SELECTOR(ss) (ss >> 3)

void timeHandle(struct TrapFrame *tf)
{
	putChar('A');
	 //GET_PCB(GET_CUR_PID).tf = *(TrapFrame2*)tf;
	//assert(1 == GET_CUR_PID);

	//LOG("tf->eip = 0x%x", ((TrapFrame2 *)tf)->eip);
	pcb[getpid()].timeCount -= 1;
	
	block_decrease();
	checkTimeCount(tf);
	putChar('E');
}