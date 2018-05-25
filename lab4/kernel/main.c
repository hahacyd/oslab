#include "common.h"
#include "x86.h"
#include "device.h"


void kEntry(void) {
	update_cursor(0, 0);

	initTimer();
	init_pcb();
	init_kernel_pcb();
	
	initSerial(); // initialize serial port
	initIdt(); // initialize idt
	initIntr(); // iniialize 8259a
	initSeg(); // initialize gdt, tss

/* start time interrupt */

	enableInterrupt();
	loadUMain(); // load user program, enter user space

	while(1);
	assert(0);
}
