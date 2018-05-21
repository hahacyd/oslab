#include"x86.h"
Semaphore Sem[32];
void P(Semaphore *s)
{
    s->value -= 1;
    if(s->value < 0){
        
    }
}
void V(Semaphore *s){
    /*s->value += 1;
    if(s->value <= 0){
        
    }*/
}
int sys_sem_init(TrapFrame *tf){
    uint32_t *t = (uint32_t*)tf->ebx;
    LOG("t = %d\n", (uint32_t)t);
    *t = 1;
    //*t = 888;
    LOG("t = %d\n", *t);

    Sem[1].value = tf->ecx;
    LOG("value = %d\n", Sem[1].value);
    return 1;
}
int sys_sem_post(TrapFrame *tf){
    Semaphore *sem = (void *)tf->ebx;
    P(sem);
    return 1;
}

int sys_sem_wait(TrapFrame *tf){
    Semaphore *sem = (void *)tf->ebx;
    V(sem);

    return 1;
}
int sys_sem_destroy(TrapFrame *tf){
    //Semaphore *sem = (void *)tf->ebx;

    return 1;
}