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
//void printk(const char *format, ...);



void initSeg(void);
void loadUMain(void);
void enterUserSpace(uint32_t entry);


#endif
