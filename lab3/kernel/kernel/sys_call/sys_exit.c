#include "x86.h"
#include "device.h"

int32_t sys_exit(struct TrapFrame* tf){

    int32_t x = get_from_runnable();

    put_into_running(x, (TrapFrame2 *)tf);


    
    return 1;
}