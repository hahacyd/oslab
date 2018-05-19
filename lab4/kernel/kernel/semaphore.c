#include"x86.h"

void P(Semaphore *s){
    s->value -= 1;
    if(s->value < 0){
        
    }
}
void V(Semaphore *s){
    s->value += 1;
    if(s->value <= 0){
        
    }
}
int sem_init(TrapFrame *tf){
    Semaphore *sem = (void *)tf->ebx;
    if(NULL == sem){
        return -1;
    }
    sem->value = tf->ecx;
    return 1;
}
int sem_post(TrapFrame *tf){
    Semaphore *sem = (void *)tf->ebx;
    P(sem);
    return 1;
}

int sem_wait(TrapFrame *tf){
    Semaphore *sem = (void *)tf->ebx;
    V(sem);
}
int sem_destroy(TrapFrame *tf){
    Semaphore *sem = (void *)tf->ebx;
    
}