#include "x86.h"
#include "device.h"

//static char *i2A(int a);
void syscallHandle(struct TrapFrame *tf);

void GProtectFaultHandle(struct TrapFrame *tf);

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
typedef enum {
	str = 0,
	dec = 1,
	oct = 2,
	null=88
} Types;
int printkernel(char *buf, int len)
{
	for(;*buf != '\0';buf++){
		putChar(*buf);
	}
	return 1;
}
int fs_write(int fd,char* buf,int len){
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
	switch(tf->eax){
		case 4 : sys_write(tf);
		break;
		default:{
			return;
		}/**/
	}
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