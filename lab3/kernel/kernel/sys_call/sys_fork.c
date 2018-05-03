#include "x86.h"
#include "device.h"

int32_t sys_fork(struct TrapFrame *tf){
    printk("this is fork function,haha\n");
    //int32_t childpid = apply_new_pid();

    int32_t childpid = 2;
    //GET_PCB(childpid).tf = GET_PCB(GET_CUR_PID).tf;
    //int32_t childpid =  
    GET_PCB(childpid).tf = *(TrapFrame2 *)tf; //GET_PCB(1).tf;

    GET_PCB(childpid).tf.eax = 0;
    GET_PCB(childpid).tf.esp = 126 << 20;
#ifdef DEBUG
    //LOG("interupt eip = 0x%x",GET_PCB(childpid).tf.eip);
    //LOG("interupt cs = 0x%x",GET_PCB(childpid).tf.cs);
#endif
    //assert(GET_PCB(childpid).tf.cs == USEL(SEG_UCODE));
    //assert(GET_PCB(childpid).tf.ss == USEL(SEG_UDATA));

    //assert(1 == GET_CUR_PID);
    assert(2 == childpid);

    put_into_runnable(childpid,&GET_PCB(childpid).tf);

    return childpid;
}