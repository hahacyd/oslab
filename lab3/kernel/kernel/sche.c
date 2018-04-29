#include "x86.h"
#include "device.h"
//#include"common.h"
/*static uint32_t runnable_query = 1,
                empty_query = 1,
                running_query = 1,
                block_query = 1;*/
//static Pcb_ptr *empty_link, *running_link, *runnable_link, *dead_link;
static uint32_t runnable_query = -1,
                empty_query = 1,
                running_query = 1,
                block_query = 1; /* */

int32_t put_into_running(int32_t pid)
{
    if (pid == current_running_pid)
        return 1;

    return 1;
}
int32_t update_block(){

    return 1;
}
int32_t checkTimeCount(TrapFrame2* tf)
{
#ifdef DEBUG
    if (0 == loaded)
        return -1;

#endif
    //current_running_pid
    LOG("pid = %d", GET_CUR_PID);
    LOG("timecount = %d", pcb[GET_CUR_PID].timeCount);
    //LOG("%d and %d", pcb[GET_CUR_PID].state, RUNNING);
    //assert(RUNNING == pcb[GET_CUR_PID].state);
    if (pcb[GET_CUR_PID].timeCount <= 0)
    {
        pcb[GET_CUR_PID].tf = *tf; //save pcb context;

        //runnable_query = 2;
        put_into_runnable(GET_CUR_PID);
        assert(1 == GET_CUR_PID);
        LOG("start change pcb from %d", GET_CUR_PID);

        LOG("eip = %x", pcb[GET_CUR_PID].tf.eip);
        GET_CUR_PID = get_from_runnable();
        LOG("to %d", GET_CUR_PID);
        assert(2 == GET_CUR_PID);

        //GET_CUR_PID = 2;
        //LOG("%d", runnable_query);
        //assert(2 == runnable_query);

        //runnable_query = pcb[runnable_query].next_pid;

        //*tf = pcb[2].tf;
        //pcb[GET_CUR_PID].tf.eip = (int32_t)(0x200088);
        enterUserSpace_pcb(GET_CUR_PID);
    }

    pcb[GET_CUR_PID].timeCount = pcb[GET_CUR_PID].timeCount - 1;
    return 1;
}
int32_t transfer_pid_state(int32_t pid_src, int32_t mode_src, int32_t mode_dst){

    return 1;
}
int32_t apply_new_pid(){
    int32_t res = 2;//empty_query;

    return res;

}
int32_t getpid(){
    return current_running_pid;
}
int32_t transfer_pid_mode(int32_t src_mode,int32_t dst_mode){
    /*switch(src_mode){
        case RUNNABLE:
    }*/
    return 1;
}
int32_t get_from_runnable(){
    int32_t res = runnable_query;
    if(-1 == runnable_query){
        return -1;
    }
    else if(runnable_query == pcb[runnable_query].next_pid){
        //int32_t res = runnable_query;
        runnable_query = -1;
        //return res;
    }
    else{
        //int32_t res = runnable_query;
        int32_t pre = pcb[runnable_query].pre_pid;
        int32_t next = pcb[runnable_query].next_pid;

        pcb[pre].next_pid = next;
        pcb[next].pre_pid = pre;
        runnable_query = next;

        //return res;
        //pcb[runnable_query].next_pid == pcb[runnable_query].next_pid;
    }
    return res;
}
int32_t put_into_runnable(int32_t pid){
    //LOG("%d\n", pid);
    if (-1 == runnable_query)
    {
        runnable_query = pid;
        pcb[pid].pre_pid = pid;
        pcb[pid].next_pid = pid;
    }
    else{
        pcb[pid].pre_pid = pcb[runnable_query].pre_pid;
        pcb[pid].next_pid = runnable_query;
        pcb[runnable_query].pre_pid = pid;
    }

    pcb[pid].state = RUNNABLE;

    //pcb[pid].timeCount = initTimeCount;
    pcb[pid].timeCount = 10;
    return 1;
}
int32_t put_into_block(int32_t pid){
    pcb[pid].pre_pid = pcb[block_query].pre_pid;
    pcb[pid].next_pid = block_query;
    pcb[block_query].pre_pid = pid;
    pcb[pid].state = BLOCKED;

    return 1;
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

    runnable_query = -1;
    empty_query = 1;
    block_query = 0;
    running_query = 0;

    current_running_pid = 1;

    /*pcb[0].timeCount = 10;
    pcb[0].tf.esp = pcb[0].stack;
    pcb[0].tf.eip = (uint32_t)IDLE;

    GET_PCB(1).tf.ss = USEL(SEG_KDATA);
    GET_PCB(1).tf.cs = USEL(SEG_KCODE);
    GET_PCB(1).state = RUNNABLE;
    put_into_runnable(0);*/
}

// kernel_pcb always is  0
int32_t init_kernel_pcb(uint32_t ss0,uint32_t esp0){
    //pcb[0].tf.eip;
    pcb[0].tf.ss = ss0;
    pcb[0].tf.esp = esp0;
    pcb[0].state = RUNNING;
    pcb[0].tf.eip = (uint32_t)IDLE;
    return 1;
}
