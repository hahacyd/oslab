#include "x86.h"
#include "device.h"

int32_t sys_fork(TrapFrame2 *tf){
    printk("this is fork function,haha\n");
    //int32_t childpid = apply_new_pid();

    int32_t childpid = 2;

    //copy kernel stack
    for (int i = 0; i < MAX_STACK_SIZE;i++){
        pcb[childpid].stack[i] = pcb[getpid()].stack[i];
    }
    //copy user stack
    uint32_t src = APP_STACK_START + getpid() * 1000;
    uint32_t dst = APP_STACK_START + childpid * 1000;
    for (int i = 0; i < 1000;i++){
        *(uint8_t *)(dst - i) = *(uint8_t *)(src - i);
    }

    GET_PCB(childpid).tf = *(TrapFrame2 *)tf; //GET_PCB(1).tf;

    GET_PCB(childpid).tf.eax = 0;
    GET_PCB(childpid).tf.esp = 6 << 20;
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