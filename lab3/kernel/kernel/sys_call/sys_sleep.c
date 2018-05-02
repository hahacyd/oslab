#include "x86.h"
#include "device.h"

int32_t sys_sleep(struct TrapFrame *tf){
    //pcb[getpid()].sleeptime = tf->ebx;
    put_into_block(getpid(), (TrapFrame2*)tf);

#ifdef DEBUG
    LOG("pid:%d sleep %d ms", getpid(), pcb[getpid()].sleeptime);
    //assert(0);
#endif
    int32_t x = get_from_runnable();

    put_into_running(x, (TrapFrame2*)tf);
    return 1;
}