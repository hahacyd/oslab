#ifndef __SCHE_H__
#define __SCHE_H__

#define DEBUG
//#include"memory.h"
#ifdef DEBUG

int32_t loaded;
//loaded = 0;
#endif
/*
struct TrapFrame {
	uint32_t edi, esi, ebp, xxx, ebx, edx, ecx, eax;
	int32_t irq;
};
*/
#define APP_STACK_START (4 << 20)
#define PROC_MEMSZ (1 << 16)
typedef struct TrapFrame2
{
    uint32_t gs, fs, es, ds;
    uint32_t edi, esi, ebp, xxx, ebx, edx, ecx, eax;
    int32_t irq;    //interrupt no
	uint32_t error_code, eip, cs, eflags;
    uint32_t esp, ss; // exists only when CPL changes
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
int32_t initTimeCount;
typedef struct ProcessTable
{
    uint32_t stack[MAX_STACK_SIZE]; //kernel core stack;
    TrapFrame2 tf;
    int state;
    int timeCount;
    int sleeptime;
//
    uint32_t pid;
    uint32_t pre_pid,next_pid;
    uint32_t core_esp;
} ProcessTable;
//static uint32_t current_num_pid = 0;
ProcessTable pcb[MAX_PCB_NUM];

typedef struct Pcb_ptr
{
    ProcessTable *pcb_pre, *pcb_next;
    uint32_t pcb_no;
} Pcb_ptr;

int32_t put_into_running(int32_t pid,TrapFrame2* tf);
int32_t put_into_runnable(int32_t pid,TrapFrame2* tf);
int32_t put_into_block(int32_t pid,TrapFrame2 *tf);
int32_t put_into_dead(int32_t pid);

int32_t get_from_runnable();
int32_t transfer_pid_state(int32_t pid_src, int32_t mode_src, int32_t mode_dst);
int32_t getpid();
void init_pcb();

int32_t init_kernel_pcb();

int32_t apply_new_pid();
int32_t checkTimeCount();

int32_t block_decrease();
int32_t check_is_in(int32_t mode, int32_t pid);
int32_t get_from_block(int32_t pid);
int32_t get_from(int32_t mode, int32_t pid);
int32_t check_block();
int32_t getrunnable();
int32_t getblocked();
int32_t make_pcb(int32_t pid, TrapFrame2 *tf, uint32_t state, uint32_t timeCount, uint32_t sleeptime);
void enterUserSpace_pcb(int32_t pid);





#endif