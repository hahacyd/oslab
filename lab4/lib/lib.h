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

#define __NR_sem_init 21
#define __NR_sem_wait 22
#define __NR_sem_post 23
#define __NR_sem_destroy 24



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

typedef unsigned int sem_t;
int sem_init(sem_t *sem, uint32_t value);
int sem_post(sem_t *sem);

int sem_wait(sem_t *sem);
int sem_destroy(sem_t *sem);

#define LOG(format, ...)                                                                                   \
    printf("\033[34m");                                                                                    \
    printf("[File:%s, Line:%d,function:%s] > \n" format, __FILE__, __LINE__, __FUNCTION__, ##__VA_ARGS__); \
    printf("\033[0m\n");
#endif
typedef struct TrapFrame
{
    uint32_t gs, fs, es, ds;
    uint32_t edi, esi, ebp, xxx, ebx, edx, ecx, eax;
    int32_t irq;    //interrupt no
	uint32_t error_code, eip, cs, eflags;
    uint32_t esp, ss; // exists only when CPL changes
} TrapFrame;
#define MAX_STACK_SIZE 2048
typedef struct ProcessTable
{
    uint32_t stack[MAX_STACK_SIZE]; //kernel core stack;
    TrapFrame tf;
    int state;
    int timeCount;
    int sleeptime;
//
    uint32_t pid;
    uint32_t pre_pid,next_pid;
    uint32_t core_esp;
} ProcessTable;