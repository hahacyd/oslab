#include "x86.h"
#include "device.h"

//static char *i2A(int a);
#define COL_SIZE 80
void syscallHandle(struct TrapFrame *tf);

void GProtectFaultHandle(struct TrapFrame *tf);
static void print_char(int row, int col, char c);
static int display(char x);
//static int count = 0;
static int sys_row = 0,sys_col = 0;
void irqHandle(struct TrapFrame *tf) {
	/*
	 * 中断处理程序
	 */
	/* Reassign segment register */
	//putChar('x');
	switch(tf->irq) {
		case -1:
			break;
		case 0xd:
			GProtectFaultHandle(tf);
			break;
		case 0x80:
			syscallHandle(tf);
			break;
		default:assert(0);
	}
}
int printkernel(char *buf, int len)
{
	for(;*buf != '\0';buf++){
		putChar(*buf);
		display(*buf);
	}
	return 1;
}
static int display(char x){

	if(x == '\n'){
		sys_col = 0;
		sys_row += 1;
	}
	else{
		print_char(sys_row,sys_col,x);
		sys_col += 1;
	}
	if(COL_SIZE == sys_col){
		sys_col = 0;
		sys_row += 1;
	}
	return 1;
}
int fs_write(int fd,char* buf,int len){
	asm volatile("movl %0, %%eax":: "r"(KSEL(SEG_VEDIO)):"eax");
	asm volatile("movw %ax, %gs");
	assert(fd == 1);
	printkernel(buf,len);
	//putChar(*buf);
	//printkernel(buf, len);
	//putChar('c');
	//putChar('y');
	//if (1 == fd)
	//{
	/*for(int i = 0;i < len;i++){
			putChar(buf[i]);
		}*/
	//}
	return len;
}
static void sys_write(struct TrapFrame *tf){
	tf->eax = fs_write(tf->ebx,(void*)tf->ecx,tf->edx);
}
void syscallHandle(struct TrapFrame *tf) {
	/* 实现系统调用*/

	//asm volatile("mov %0,%%gs:" ::"a"(6 << 3));
	switch (tf->eax)
	{
	case 4:
		sys_write(tf);
		break;
		default:{
			return;
		}/**/
	}
	//enterUserSpace(1);
}

void GProtectFaultHandle(struct TrapFrame *tf){
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
#define SELECTOR(ss) (ss>>3)
static void print_char(int row, int col, char c) {
	asm ("movl %0, %%edi;"::"r"(((80 * row + col) * 2)):"%edi");
	asm ("movw %0, %%eax;"::"r"(0x0c00 + c) :"%eax");
	asm ("movw %%ax, %%gs:(%%edi);":::"%edi");
}
void start_into_kernel(uint16_t irq){
	//uint16_t old_cs = 0,old_ss = 0;
	//uint32_t old_eip = 0, old_esp = 0;
	//uint16_t target_cs = IDT[irq].; /**/
}