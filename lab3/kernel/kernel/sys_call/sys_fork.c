#include "x86.h"
#include "device.h"

int32_t sys_fork(TrapFrame *tf){
    int32_t childpid = apply_new_pid();

    //copy kernel stack
    for (int i = 0; i < MAX_STACK_SIZE;i++){
        pcb[childpid].stack[i] = pcb[getpid()].stack[i];
    }

    //copy user stack
    uint32_t src = APP_STACK_START + getpid() * PROC_MEMSZ;
    uint32_t dst = APP_STACK_START + childpid * PROC_MEMSZ;
    for (int i = 0; i < PROC_MEMSZ;i++){
        *((uint8_t *)dst - i) = *((uint8_t *)src - i);
    }

    GET_PCB(childpid).tf = *tf; //GET_PCB(1).tf;

    GET_PCB(childpid).tf.eax = 0;

    //将子进程放入可运行队列
    put_into_runnable(childpid,&GET_PCB(childpid).tf); 

    return childpid;
}