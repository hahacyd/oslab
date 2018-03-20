.code32
.global start
start:
movl $((80*5 + 0)*2),%edi
movb $0x0c,%ah
movb $72,%al
movw %ax,%gs:(%edi)
/*loop:
	jmp loop*/
