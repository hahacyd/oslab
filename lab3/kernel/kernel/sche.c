#include "x86.h"
#include "device.h"

ProcessTable pcb[MAX_PCB_NUM];
uint32_t current_running_pcb = 1;
//static Pcb_ptr *empty_link, *running_link, *runnable_link, *dead_link;
int put_into_running(ProcessTable *x);
int put_into_runnable();
int put_into_dead();

/*int init(){
    empty_link = malloc()
}
int insert_Pcb_ptr(Pcb_ptr* cur,uint32_t pcb_no){

}*/
