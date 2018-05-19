.code32

.global irqEmpty
irqEmpty:
	pushl $0 // push dummy error code
	pushl $-1 // push interrupt vector into kernel
	jmp asmDoIrq

.global irqGProtectFault
irqGProtectFault:
	pushl $0xd
	jmp asmDoIrq

.global irqSyscall
irqSyscall:
	pushl $0 // push dummy error code
	pushl $0x80 // push interrupt vector into kernel stack
	jmp asmDoIrq

.global irqTime
irqTime:
	pushl $0 // push dummy error code
	pushl $0x20 // push interrupt vector into kernel stack
	jmp asmDoIrq

.global asmDoIrq
asmDoIrq:
#	call disableInterrupt
	pushal // push process state into kernel stack
	pushl %ds
	pushl %es
	pushl %fs
	pushl %gs

	pushl %esp

	call irqHandle

	popl %esp

	popl %gs
	popl %fs
	popl %es
	popl %ds
#	addl $4, %esp
	popal
	addl $4, %esp //interrupt vector is on top of kernel stack
	addl $4, %esp //error code is on top of kernel stack
	iret
