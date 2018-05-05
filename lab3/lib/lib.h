#ifndef __lib_h__
#define __lib_h__
#include"types.h"

#define __NR_exit 1
#define __NR_fork 2
#define __NR_read 3
#define __NR_write 4
#define __NR_open 5
#define __NR_close 6
#define __NR_getpid 7

#define PROC_MEMSZ (1 << 16)

#define __NR_clock_nanosleep 230
int32_t syscall(uint32_t eax, uint32_t ebx, uint32_t ecx,uint32_t edx);
void printf(const char *format,...);

void printd(int a);
void printc(char c);
void prints(const char *s);
void printx(int n);

int fork();
int sleep();
int exit();
int getpid();
#define LOG(format, ...)                                                                                   \
    printf("\033[34m");                                                                                    \
    printf("[File:%s, Line:%d,function:%s] > \n" format, __FILE__, __LINE__, __FUNCTION__, ##__VA_ARGS__); \
    printf("\033[0m\n");
#endif
