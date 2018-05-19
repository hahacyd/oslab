#ifndef __SYS_WRITE_H__
#define __SYS_WRITE_H__

#define COL_SIZE 80

//static int count = 0;
int printkernel(char *buf, int len);
void print_char(int row, int col, char c);

void update_cursor(int r, int c);
void scrollScreen();
#endif