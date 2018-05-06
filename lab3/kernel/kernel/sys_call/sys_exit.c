#include "x86.h"
#include "device.h"

int32_t sys_exit(TrapFrame* tf){

#ifdef DEBUG
    printk("come to exit\n");

#endif
    put_into_empty(getpid());

    int32_t x = get_from_runnable();

    put_into_running(x, tf);


    
    return 1;
}