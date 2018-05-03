#include "x86.h"
#include "device.h"
//#include"common.h"
static int32_t runnable_query = -1,
                //empty_query = 1,
    //running_query = 1,
    block_query = -1; /* */

int32_t put_into_running(int32_t pid, TrapFrame2 *tf)
{
    if (pid == current_running_pid)
        return 1;

    GET_CUR_PID = pid;

    *tf = pcb[GET_CUR_PID].tf;
#ifdef DEBUG
    LOG("new pid = %d", pid);
#endif
    return 1;
}
int32_t update_block()
{
    return 1;
}
int32_t checkTimeCount(TrapFrame2 *tf)
{
#ifdef DEBUG
    if (0 == loaded)
        return -1;
    LOG("pid = %d", GET_CUR_PID);
    LOG("timecount = %d", pcb[GET_CUR_PID].timeCount);
#endif
    //current_running_pid
    check_block();

    //LOG("%d and %d", pcb[GET_CUR_PID].state, RUNNING);
    //assert(RUNNING == pcb[GET_CUR_PID].state);
    if (pcb[GET_CUR_PID].timeCount <= 0)
    {
        pcb[GET_CUR_PID].tf = *tf; //save pcb context;

        put_into_runnable(GET_CUR_PID);

        int32_t x = get_from_runnable();

        put_into_running(x, tf);

        //GET_CUR_PID = 2;
        //LOG("%d", runnable_query);
        //assert(2 == runnable_query);

        //runnable_query = pcb[runnable_query].next_pid;

        //*tf = pcb[2].tf;
        //pcb[GET_CUR_PID].tf.eip = (int32_t)(0x200088);
        //enterUserSpace_pcb(GET_CUR_PID);
    }

    return 1;
}

int32_t apply_new_pid()
{
    int32_t res = 2; //empty_query;

    return res;
}
int32_t getpid()
{
    return current_running_pid;
}
int32_t getrunnable(){
    return runnable_query;
}
int32_t getblocked(){
    return block_query;
}
int32_t transfer_pid_mode(int32_t src_mode, int32_t dst_mode)
{
    /*switch(src_mode){
        case RUNNABLE:
    }*/
    return 1;
}
int32_t get_from_runnable()
{
    int32_t res = runnable_query;
    if (-1 == runnable_query)
    {
        return -1;
    }
    else if (runnable_query == pcb[runnable_query].next_pid)
    {
        //int32_t res = runnable_query;
        runnable_query = -1;
        //return res;
    }
    else
    {
        //int32_t res = runnable_query;
        int32_t pre = pcb[runnable_query].pre_pid;
        int32_t next = pcb[runnable_query].next_pid;

        pcb[pre].next_pid = next;
        pcb[next].pre_pid = pre;
        runnable_query = next;

        //return res;
        //pcb[runnable_query].next_pid == pcb[runnable_query].next_pid;
    }
#ifdef DEBUG
    LOG("put out pid = %d,left pid = %d ", res, runnable_query);

#endif
    return res;
}
int32_t put_into_runnable(int32_t pid)
{

    //LOG("%d\n", pid);
    if (-1 == runnable_query)
    {
        runnable_query = pid;
        pcb[pid].pre_pid = pid;
        pcb[pid].next_pid = pid;
    }
    else
    {
        pcb[pcb[runnable_query].pre_pid].next_pid = pid;
        pcb[pid].pre_pid = pcb[runnable_query].pre_pid;
        pcb[pid].next_pid = runnable_query;
        pcb[runnable_query].pre_pid = pid;
    }

    pcb[pid].state = RUNNABLE;
    if (0 == pid)
    {
        pcb[pid].tf.eip = (uint32_t)IDLE;
    }
        //LOG("left pid = %d put in pid = %d,",runnable_query,)
#ifdef DEBUG
    LOG("left pid = %d put in pid = %d,", runnable_query, pid);
#endif
    //pcb[pid].timeCount = initTimeCount;
    pcb[pid].timeCount = 10;
    return 1;
}
int32_t check_block(){
    if(-1 == block_query)
        return -1;
    int32_t pivot = block_query;
    do
    {
        if(pcb[pivot].sleeptime <= 0){
            get_from_block(pivot);

            put_into_runnable(pivot);
        }
    } while (pivot != block_query && block_query != -1);
    return 1;
}
int32_t put_into_block(int32_t pid, TrapFrame2*tf)
{
    if (-1 == block_query)
    {
        block_query = pid;
        pcb[block_query].next_pid = block_query;
        pcb[block_query].pre_pid = block_query;
    }
    else
    {
        pcb[pcb[block_query].pre_pid].next_pid = pid;
        pcb[pid].pre_pid = pcb[block_query].pre_pid;
        pcb[pid].next_pid = block_query;
        pcb[block_query].pre_pid = pid;
    }
    pcb[pid].tf = *tf;
    pcb[pid].sleeptime = tf->ebx;
    pcb[pid].state = BLOCKED;

    return 1;
}

int32_t get_from(int32_t mode, int32_t pid)
{
    if (check_is_in(mode, pid) != 1)
    {
        assert(0);
        //never come here;
        return -1;
    }

    int32_t *power = NULL;
    switch (pcb[pid].state)
    {
    case RUNNABLE:
        power = &runnable_query;
        break;
    case BLOCKED:
        power = &block_query;
        break;
    default:
        assert(0);
    }
    int32_t res = mode;

    assert(res == *power);

    if (-1 == res)
    {
        return -1;
    }
    else if (res == pcb[res].next_pid)
    {
        *power = -1;
        //int32_t res = runnable_query;
    }
    else
    {
        //int32_t res = runnable_query;
        int32_t pre = pcb[res].pre_pid;
        int32_t next = pcb[res].next_pid;

        pcb[pre].next_pid = next;
        pcb[next].pre_pid = pre;
        *power = next;
        //return res;
        //pcb[runnable_query].next_pid == pcb[runnable_query].next_pid;
    }
    return res;

/*
    int32_t res = runnable_query;
    if (-1 == runnable_query)
    {
        return -1;
    }
    else if (runnable_query == pcb[runnable_query].next_pid)
    {
        //int32_t res = runnable_query;
        runnable_query = -1;
        //return res;
    }
    else
    {
        //int32_t res = runnable_query;
        int32_t pre = pcb[runnable_query].pre_pid;
        int32_t next = pcb[runnable_query].next_pid;

        pcb[pre].next_pid = next;
        pcb[next].pre_pid = pre;
        runnable_query = next;

        //return res;
        //pcb[runnable_query].next_pid == pcb[runnable_query].next_pid;
    }

*/
}
int32_t get_from_block(int32_t pid)
{
    assert(-1 != get_from(block_query, pid));

    return 1;
}
int32_t check_is_in(int32_t mode, int32_t pid)
{
    int32_t ptr = mode;
    if (mode <= 0)
        return -1;
    do
    {
        if (ptr == pid)
            return 1;
        ptr = pcb[ptr].next_pid;
    } while (ptr != mode);

    return -1;
}
int32_t block_decrease()
{
    int32_t pivot = block_query;
    if (-1 == pivot)
        return -1;
    do
    {
        pcb[pivot].sleeptime -= 1;
        pivot = pcb[pivot].next_pid;

    } while (pivot != block_query);

    return 1;
}
int32_t put_into_dead();

void init_pcb()
{
    for (int i = 0; i < MAX_PCB_NUM; i++)
    {
        pcb[i].pid = i;
        pcb[i].pre_pid = i - 1;
        pcb[i].next_pid = i + 1;
    }
    pcb[0].pre_pid = MAX_PCB_NUM - 1;
    pcb[MAX_PCB_NUM - 1].next_pid = 0;
}

// kernel_pcb always is  0
int32_t init_kernel_pcb()
{
    //pcb[0].tf.eip;
    pcb[0].tf.ss = KSEL(SEG_KDATA);
    pcb[0].tf.cs = KSEL(SEG_KCODE);
    pcb[0].tf.eip = (uint32_t)IDLE;
    pcb[0].tf.esp = 127 << 20;

    pcb[0].state = RUNNABLE;
    pcb[0].timeCount = 4;
    return 1;
}
int32_t transfer_pid_state(int32_t pid_src, int32_t mode_src, int32_t mode_dst)
{

    return 1;
}
int32_t make_pcb(int32_t pid,TrapFrame2 *tf,uint32_t state,uint32_t timeCount,uint32_t sleeptime)
{
    pcb[pid].tf = *tf;
    pcb[pid].state = state;
    pcb[pid].timeCount = timeCount;
    pcb[pid].sleeptime = sleeptime;

    pcb[pid].core_esp = (uint32_t)tf;
    return 1;
}