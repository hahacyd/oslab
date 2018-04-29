#ifndef __SCHE_H__
#define __SCHE_H__

#define DEBUG
//#include"memory.h"
#ifdef DEBUG

int32_t loaded;
//loaded = 0;
#endif
typedef struct TrapFrame2
{
    //uint32_t gs, fs, es, ds;
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

#define GET_PCB(no) pcb[no]
#define GET_CUR_PID current_running_pid
int32_t current_running_pid;
//const int32_t initTimeCount = 10;
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
ProcessTable pcb[MAX_PCB_NUM];

typedef struct Pcb_ptr
{
    ProcessTable *pcb_pre, *pcb_next;
    uint32_t pcb_no;
} Pcb_ptr;

int32_t put_into_running(int32_t pid);
int32_t put_into_runnable(int32_t pid);
int32_t put_into_block(int32_t pid);
int32_t put_into_dead(int32_t pid);

int32_t get_from_runnable();
int32_t transfer_pid_state(int32_t pid_src, int32_t mode_src, int32_t mode_dst);
int32_t getpid();
void init_pcb();

int32_t init_kernel_pcb(uint32_t ss0, uint32_t esp0);

int32_t apply_new_pid();
int32_t checkTimeCount();
void enterUserSpace_pcb(int32_t pid);
#endif