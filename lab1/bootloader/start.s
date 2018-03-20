.code16

.global start
start:
	cli            #close interrupt
	inb $0x92, %al   #launch A20 bus
	orb $0x02, %al
	outb $al, $0x92

	data32 addr32 lgdt gdtDesc   #loac GDTR
	
	movl %cr0, %eax
	orb $0x01, %al
	movl %eax, %cr0

	data32 ljmp $0x08, $start32   #jmp to protect mode
.code32
start32:
	
	movw $0, %eax

	movw %eax, %ds
	movw %eax, %es
	movw %eax, %fs
	movw %eax, %gs
	movw %eax, %ss

	jmp bootMain      #jmp to bootMain function,defined by boot.c
.p2align 2
gdt:
	.word 0,0 # empty entry
	.byte 0,0,0,0

	.word 0xffff, 0     #code sreg descriptor
	.byte 0,0x9a,0xcf,0

	.word 0xffff, 0     #data sreg descriptor
	.byte 0,0x92,0xcf,0

	.word 0xffff, 0x8000   #video sreg descriptor
	.byte 0x0b,0x92,0xcf,0

gdtDesc:
	.word (gdtDesc - gdt -1)
	.long gdt
