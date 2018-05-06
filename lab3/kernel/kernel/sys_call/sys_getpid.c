#include "x86.h"
#include "device.h"

int32_t sys_getpid(TrapFrame* tf){
    return getpid();
}