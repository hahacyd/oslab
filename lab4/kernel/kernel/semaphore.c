#include "x86.h"
Semaphore Sem[32];
//used to blocked a process;
void W(Semaphore *s)
{
    pcb[getpid()].next_pcb = s->list;

    s->list = &pcb[getpid()];

    int pid = get_from_runnable();
    //LOG("blocked pid = %d\n", s->list->pid);
    assert(2 == getpid());
    put_into_running(pid, NULL);
}
//used to release a process!
void R(Semaphore *s)
{
    int pid = s->list->pid;
    s->list = s->list->next_pcb;

    put_into_runnable(pid, &pcb[pid].tf);
    assert(1 == getpid());
    //LOG("release pid = %d\n",pid);
}
void P(Semaphore *s)
{
    s->value -= 1;
    //LOG("s->value = %d\n", s->value);
    if (s->value < 0)
    {
        W(s);
    }
}
void V(Semaphore *s)
{
    s->value += 1;
    //LOG("s->value = %d\n", s->value);

    if (s->value <= 0)
    {
        R(s);
    }
}
int sys_sem_init(TrapFrame *tf)
{
    uint32_t *t = (void *)CHANGE_2_USER_ADDR(tf->ebx);
    *t = 0;
    Sem[0].value = tf->ecx;
    Sem[0].list = NULL;
    return 0;
}
int sys_sem_post(TrapFrame *tf)   //father process!
{
    uint32_t *sem = (void *)CHANGE_2_USER_ADDR(tf->ebx);
    //LOG("pid = %d *sem = %d\n",getpid(), *sem);

    V(&Sem[*sem]);
    //LOG("end\n");
    return 1;
}
int sys_sem_wait(TrapFrame *tf)   //child process!
{
    uint32_t *sem = (void *)CHANGE_2_USER_ADDR(tf->ebx);
    //LOG("*sem = %d\n", *sem);
    P(&Sem[*sem]);
    return 1;
}
int sys_sem_destroy(TrapFrame *tf)
{
    //Semaphore *sem = (void *)tf->ebx;
   // uint32_t *t = (void *)CHANGE_2_USER_ADDR(tf->ebx);
    //*t = -1;
   // Sem[0].value = -1;
    return 1;
}