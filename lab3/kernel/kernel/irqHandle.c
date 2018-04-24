#include "x86.h"
#include "device.h"
//ProcessTable pcb[MAX_PCB_NUM];
//static char *i2A(int a);

void syscallHandle(struct TrapFrame *tf);
void timeHandle(struct TrapFrame *tf);
void GProtectFaultHandle(struct TrapFrame *tf);
//static void print_char(int row, int col, char c);

void irqHandle(struct TrapFrame *tf)
{
	/*
	 * 中断处理程序
	 */
	/* Reassign segment register */
	//putChar('x');
	disableInterrupt();   //when cpu is handling interrupt,ignore other interrupt;
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
}

void syscallHandle(struct TrapFrame *tf)
{
	/* 实现系统调用*/
	//asm volatile("int $0x20");
	//asm volatile("mov %0,%%gs:" ::"a"(6 << 3));
	switch (tf->eax)
	{
	case 4:
		sys_write(tf);
		break;
	default:
	{
		return;
	} /**/
	}
	//enterUserSpace(1);
}

void GProtectFaultHandle(struct TrapFrame *tf)
{
	assert(0);
	return;
}
/*static char *i2A(int a) {
	static char buf[30];
	char *p = buf + sizeof(buf) - 1;
	do {
		*--p = '0' + a % 10;
	} while (a /= 10);
	return p;
}*/
#define SELECTOR(ss) (ss >> 3)

/*void start_into_kernel(uint16_t irq)
{
	//uint16_t old_cs = 0,old_ss = 0;
	//uint32_t old_eip = 0, old_esp = 0;
	//uint16_t target_cs = IDT[irq].; 
}*/
void timeHandle(struct TrapFrame *tf)
{
	
	putChar('x');
}