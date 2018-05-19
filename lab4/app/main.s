
main.o:     file format elf32-i386


Disassembly of section .text:

00000000 <uEntry>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
   6:	e8 fc ff ff ff       	call   7 <uEntry+0x7>
   b:	31 c0                	xor    %eax,%eax
   d:	c9                   	leave  
   e:	c3                   	ret    
