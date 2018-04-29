#include "x86.h"
#include "device.h"

int32_t sys_fork(struct TrapFrame *tf){
    printk("this is fork function,haha\n");
    //int32_t childpid = apply_new_pid();

    int32_t childpid = 2;
    //GET_PCB(childpid).tf = GET_PCB(GET_CUR_PID).tf;
    GET_PCB(childpid).tf = GET_PCB(1).tf;

    GET_PCB(childpid).tf.eax = 0;
    GET_PCB(childpid).tf.esp = 127 << 20;

    //assert(1 == GET_CUR_PID);
    assert(2 == childpid);

    put_into_runnable(childpid);

    return childpid;
}