#include "x86.h"
#include "device.h"
//#include"common.h"
static uint32_t runnable_query = 1,
                empty_query = 1,
                running_query = 1,
                block_query = 1;
int32_t current_running_pid = 1;
//static Pcb_ptr *empty_link, *running_link, *runnable_link, *dead_link;
int32_t put_into_running(int32_t pid)
{
    if (pid == current_running_pid)
        return 1;
    
}
int32_t getpid(){
    return current_running_pid;
}
int32_t transfer_pid_mode(int32_t src_mode,int32_t dst_mode){
    /*switch(src_mode){
        case RUNNABLE:
    }*/
}
int32_t put_into_runnable(int32_t pid){
    pcb[pid].pre_pid = pcb[runnable_query].pre_pid;
    pcb[pid].next_pid = runnable_query;
    pcb[runnable_query].pre_pid = pid;
    pcb[pid].state = RUNNABLE;
}
int32_t put_into_dead();


void init_pcb()
{
    for(int i = 0;i < MAX_PCB_NUM;i++){
        pcb[i].pid = i;
        pcb[i].pre_pid = i - 1;
        pcb[i].next_pid = i + 1;
    }
    pcb[0].pre_pid = MAX_PCB_NUM - 1;
    pcb[MAX_PCB_NUM - 1].next_pid = 0;

    runnable_query = 0;
    empty_query = 0;
    block_query = 0;
    running_query = 0;
}

// kernel_pcb always is  0
int32_t init_kernel_pcb(uint32_t ss0,uint32_t esp0){
    //pcb[0].tf.eip;
    pcb[0].tf.ss = ss0;
    pcb[0].tf.esp = esp0;
    pcb[0].state = RUNNING;
    return 1;
}
