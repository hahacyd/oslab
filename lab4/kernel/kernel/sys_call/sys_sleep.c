#include "x86.h"
#include "device.h"

int32_t sys_sleep(TrapFrame *tf){
    put_into_block(getpid(), tf);
    //LOG("%d ==> sleep\n", getpid());

    int32_t x = get_from_runnable();

    put_into_running(x, tf);
    return 1;
}