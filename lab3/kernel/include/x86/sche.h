#ifndef __LINUX_SCHE_H__
#define __LINUX_SCHE_H__


//#include"memory.h"
typedef struct TrapFrame2
{
    uint32_t gs, fs, es, ds;
    uint32_t edi, esi, ebp, xxx, ebx, edx, ecx, eax;
    int32_t irq;    //interrupt no
    uint32_t error; //error code
    uint32_t eip, cs, eflags, esp, ss;
} TrapFrame2;
//below defines is for Process state
#define RUNNABLE 1
#define RUNNING 2
#define BLOCKED 0
#define DEAD -1

#define MAX_STACK_SIZE 2048
#define MAX_PCB_NUM 2048
typedef struct ProcessTable
{
    uint32_t stack[MAX_STACK_SIZE]; //kernel core stack;
    TrapFrame2 tf;
    int state;
    int timeCount;
    int sleeptime;

    uint32_t pid;
    uint32_t pre_pid,next_pid;
} ProcessTable;
//static uint32_t current_num_pid = 0;

typedef struct Pcb_ptr
{
    ProcessTable *pcb_pre, *pcb_next;
    uint32_t pcb_no;
} Pcb_ptr;
ProcessTable pcb[MAX_PCB_NUM];
int32_t put_into_running();
int32_t put_into_runnable();
int32_t put_into_dead();

void init_pcb();

int32_t init_kernel_pcb(uint32_t ss0, uint32_t esp0);
#endif