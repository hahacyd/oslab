#include "x86.h"
#include "device.h"

int32_t sys_sleep(struct TrapFrame *tf){
    pcb[getpid()].sleeptime = tf->ebx;

    return 1;
}