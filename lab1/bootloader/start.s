.code16

.global start
start:
	movw $message, %ax
	movw %ax, %bp
	movw $23, %cx
	movw $0x1301, %ax
	movw $0x000c, %bx
	movw $0x0900, %dx     #print at 8s rows and 0s lines
	int $0x10

message:
	.string "Hello World! Let`s go:"

	/*movl $((80 * 5 + 0) * 2), %edi
	movb $0x0c, %ah
	movb $72, %al          #72 is 'H' `s ascii encode,
	movw %ax, %gs:(%edi)           #write graph memory
	*/

	cli            #close interrupt
	inb $0x92, %al   #launch A20 bus
	orb $0x02, %al
	outb %al, $0x92

	data32 addr32 lgdt gdtDesc   #loac GDTR
	
	movl %cr0, %eax
	orb $0x01, %al
	movl %eax, %cr0

	data32 ljmp $0x08, $start32   #jmp to protect mode
.code32
start32:
	
	movw $0, %eax

	movw %ax, %ds
	movw %ax, %es
	movw %ax, %fs
	movw %ax, %gs
	movw %ax, %ss

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
