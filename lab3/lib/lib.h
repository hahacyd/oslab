#ifndef __lib_h__
#define __lib_h__
#include"types.h"

#define __NR_exit 1
#define __NR_fork 2
#define __NR_read 3
#define __NR_write 4
#define __NR_open 5
#define __NR_close 6
#define __NR_waitpid 7

#define __NR_clock_nanosleep 230
int32_t syscall(int num, uint32_t a1, uint32_t a2,
				uint32_t a3, uint32_t a4, uint32_t a5);
void printf(const char *format,...);
void printd(int a);
void printc(char *c);
void prints(char *s);
void printx(int a);

void fs_write(int fd, const char *address, int length);
int fork();
int sleep();
int exit();




#define LOG(format,...) \
    printf("\033[34m");\
    printf("[File:%s, Line:%d,function:%s] > \n"format, __FILE__,__LINE__,__FUNCTION__, ##__VA_ARGS__);\
    printf("\033[0m\n");
#endif
