#ifndef __SYS_WRITE_H__
#define __SYS_WRITE_H__

#define COL_SIZE 80
int display(char x);
void sys_write(struct TrapFrame *tf);
//static int count = 0;
int printkernel(char *buf, int len);
void print_char(int row, int col, char c);
#endif