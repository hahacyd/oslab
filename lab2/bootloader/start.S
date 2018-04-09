.code16
.global start
start:
	cli                             #close interrupt
	inb $0x92, %al				    #launch A20 bus
	orb $0x02, %al
	outb %al, $0x92

	data32 addr32 lgdt gdtDesc      #load GDTR
	
	movl %cr0, %eax                 #tell cpu we wanna be protected mode,
	orb $0x01, %al
	movl %eax, %cr0

	data32 ljmp $0x08, $start32     #jmp to protect mode,cs already been set
.code32
start32:
	                                #from pa: kernel/start/start.S
	movw $(2 << 3), %ax
#	movw %ax, %ds                   #data sreg <= ax
	
#	movw $(2 << 3), %ax
#	movw %ax, %es                   #Extend segement sreg <= ax
	
	movw %ax, %ss		            #stack sreg <= ax

#	movw %ax, %fs

	movw $(3 << 3), %ax
	movw %ax, %gs

#	#Set up a stack for C code

	#movl $0, %ebp
	#movl $(128 << 20), %esp
	jmp bootMain                #jmp to bootMain function,defined by boot.c
.p2align 2
gdt: # 8 bytes for each table entry, at least 1 entry
	.word 0,0 # empty entry
	.byte 0,0,0,0

	.word 0xffff, 0             #code sreg descriptor
	.byte 0,0x9a,0xcf,0

	.word 0xffff, 0             #data sreg descriptor
	.byte 0,0x92,0xcf,0

	.word 0xffff, 0x8000        #video sreg descriptor
	.byte 0x0b,0x92,0xcf,0
gdtDesc: # 6 bytes in total
	.word (gdtDesc - gdt -1)
	.long gdt