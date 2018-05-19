#ifndef __X86_H__
#define __X86_H__

#include "x86/cpu.h"
#include "x86/memory.h"
#include "x86/io.h"
#include "x86/irq.h"

#include "sys_call/syscall_table.h"
#include "sys_call/sys_write.h"
#include "sys_call/sys_fork.h"
#include "sys_call/sys_exit.h"
#include "sys_call/sys_sleep.h"

#include "x86/sche.h"
#include "x86/debug.h"

#include"x86/semaphore.h"
//void printk(const char *format, ...);



void initSeg(void);
void loadUMain(void);
void enterUserSpace(uint32_t entry);

int32_t sys_fork(TrapFrame *tf);
int32_t sys_exit(TrapFrame *tf);
int32_t sys_sleep(TrapFrame * tf);
int32_t sys_getpid(TrapFrame *tf);
void sys_write(TrapFrame *tf);

int sem_init(TrapFrame *tf);
int sem_post(TrapFrame *tf);

int sem_wait(TrapFrame *tf);
int sem_destroy(TrapFrame *tf);
#endif
