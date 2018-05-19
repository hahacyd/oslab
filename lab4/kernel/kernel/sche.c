#include "x86.h"
#include "device.h"
//#include"common.h"
static int32_t runnable_query = -1,
               empty_query = 0,
               //running_query = 1,
    block_query = -1; /* */

int32_t put_into_running(int32_t pid, TrapFrame *tf)
{
    if (pid == current_running_pid)
        return 1;

    GET_CUR_PID = pid;
    change_tss(KSEL(SEG_KDATA), (uint32_t) & (pcb[getpid()].stack[MAX_STACK_SIZE - 1]));

    return 1;
}

int32_t apply_new_pid()
{
    int32_t res = get_from(empty_query, empty_query);
    return res;
}
int32_t put_into_empty(int32_t pid){
    return put_into(EMPTY, pid);
}
int32_t getpid()
{
    return current_running_pid;
}
int32_t getrunnable()
{
    return runnable_query;
}
int32_t getblocked()
{
    return block_query;
}

int32_t get_from_runnable()
{
    return get_from(runnable_query, runnable_query);
}
int32_t put_into_runnable(int32_t pid, TrapFrame *tf)
{
    pcb[pid].tf = *tf;
    pcb[pid].timeCount = initTimeCount;
    pcb[pid].state = RUNNABLE;

    return put_into(RUNNABLE, pid);
}
int32_t check_block()
{
    if (-1 == block_query)
        return -1;
    int32_t pivot = block_query;
    int32_t tmp = 0;
    do
    {
        if (BLOCKED == pcb[pivot].state && pcb[pivot].sleeptime <= 0)
        {
            tmp = pcb[pivot].next_pid;

            get_from_block(pivot);

            put_into_runnable(pivot, &pcb[pivot].tf);

            pivot = pcb[tmp].next_pid;
        }
        else
        {
            pivot = pcb[pivot].next_pid;
        }

    } while (pivot != block_query && block_query != -1);
    return 1;
}
//向 mode队列里加入pid进程，mode 有empty_query,runnable_query,blocked_query;
int32_t put_into(int32_t mode, int32_t pid)
{
    int32_t *power = NULL;
    switch (mode)
    {
    case EMPTY:
        power = &empty_query;
        break;
    case RUNNABLE:
        power = &runnable_query;
        break;
    case BLOCKED:
        power = &block_query;
        break;
    default:
        assert(0);
        return -1;
    }

    if (-1 == *power)
    {
        *power = pid;
        pcb[*power].next_pid = *power;
        pcb[*power].pre_pid = *power;
    }
    else
    {
        pcb[pcb[*power].pre_pid].next_pid = pid;
        pcb[pid].pre_pid = pcb[*power].pre_pid;
        pcb[pid].next_pid = *power;
        pcb[*power].pre_pid = pid;
    }
    return 1;
}
int32_t put_into_block(int32_t pid, TrapFrame *tf)
{
    pcb[pid].tf = *tf;
    pcb[pid].sleeptime = tf->ebx;
    pcb[pid].state = BLOCKED;

    return put_into(BLOCKED, pid);
}

int32_t get_from(int32_t mode, int32_t pid)
{
    if (check_is_in(mode, pid) != 1)
    {
        LOG("mode = %d pid = %d", mode, pid);
        assert(0);
        //never come here;
        return -1;
    }

    int32_t *power = NULL;
    switch (pcb[pid].state)
    {
    case EMPTY:
        power = &empty_query;
        break;
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

    //LOG("res = %d *power = %d", res, *power);
    assert(res == *power);

    if (-1 == res)
    {
        return -1;
    }
    else if (res == pcb[res].next_pid)
    {
        *power = -1;
    }
    else
    {
        int32_t pre = pcb[res].pre_pid;
        int32_t next = pcb[res].next_pid;

        pcb[pre].next_pid = next;
        pcb[next].pre_pid = pre;
        *power = next;
    }
    return res;
}
int32_t get_from_block(int32_t pid)
{
    assert(-1 != get_from(block_query, pid));

    return 1;
}
int32_t check_is_in(int32_t mode, int32_t pid)
{
    int32_t ptr = mode;
    //if (mode <= 0)
    //    return -1;
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

void init_pcb()
{
    initTimeCount = 5;
    for (int i = 0; i < MAX_PCB_NUM; i++)
    {
        pcb[i].pid = i;
        pcb[i].pre_pid = i - 1;
        pcb[i].next_pid = i + 1;

        pcb[i].state = EMPTY;
    }
    pcb[0].pre_pid = MAX_PCB_NUM - 1;
    pcb[MAX_PCB_NUM - 1].next_pid = 0;
}

// kernel_pcb always is  0
int32_t init_kernel_pcb()
{
    assert(0 == apply_new_pid());

    //pcb[0].tf.eip;
    pcb[0].tf.ss = KSEL(SEG_KDATA);
    pcb[0].tf.cs = KSEL(SEG_KCODE);
    pcb[0].tf.ds = KSEL(SEG_KDATA);
    pcb[0].tf.es = KSEL(SEG_KDATA);

    pcb[0].tf.eip = (uint32_t)IDLE;
    pcb[0].tf.esp = APP_STACK_START;

    pcb[0].state = RUNNABLE;
    pcb[0].timeCount = 4;

    return 1;
}

int32_t make_pcb(int32_t pid, TrapFrame *tf, uint32_t state, uint32_t timeCount, uint32_t sleeptime)
{
    pcb[pid].tf = *tf;
    pcb[pid].state = state;
    pcb[pid].timeCount = timeCount;
    pcb[pid].sleeptime = sleeptime;

    pcb[pid].core_esp = (uint32_t)tf;
    return 1;
}