#include"x86.h"
Semaphore Sem[32];
void P(Semaphore *s)
{
    s->value -= 1;
    if(s->value < 0){
        
    }
}
void V(Semaphore *s){
    s->value += 1;
    if(s->value <= 0){
        
    }/**/
}
int sys_sem_init(TrapFrame *tf){
    uint32_t *t = (void*)tf->ebx + USER_OFFSET;
    *t = 0;
    Sem[0].value = tf->ecx;
    return 1;
}
int sys_sem_post(TrapFrame *tf){
    uint32_t *sem = (void *)tf->ebx;

    P(&Sem[*sem]);
    return 1;
}

int sys_sem_wait(TrapFrame *tf){
    uint32_t *sem = (void *)tf->ebx;
    V(&Sem[*sem]);

    return 1;
}
int sys_sem_destroy(TrapFrame *tf){
    //Semaphore *sem = (void *)tf->ebx;

    return 1;
}