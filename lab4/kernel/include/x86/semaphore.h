#ifndef __SEMAPHORE_H__
#define __SEMAPHORE_H__


typedef struct Semaphore{
    int value;
    ProcessTable *next;
} Semaphore;
typedef Semaphore sem_t;
void P(Semaphore *s);
void V(Semaphore *s);
#endif
