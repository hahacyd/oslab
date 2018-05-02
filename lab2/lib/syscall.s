
syscall.o:     file format elf32-i386


Disassembly of section .text:

00000000 <syscall>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	8b 45 08             	mov    0x8(%ebp),%eax
   6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
   9:	8b 4d 10             	mov    0x10(%ebp),%ecx
   c:	8b 55 14             	mov    0x14(%ebp),%edx
   f:	8b 7d 18             	mov    0x18(%ebp),%edi
  12:	8b 75 1c             	mov    0x1c(%ebp),%esi
  15:	31 c0                	xor    %eax,%eax
  17:	5d                   	pop    %ebp
  18:	c3                   	ret    
  19:	8d 76 00             	lea    0x0(%esi),%esi

0000001c <printf>:
  1c:	55                   	push   %ebp
  1d:	89 e5                	mov    %esp,%ebp
  1f:	5d                   	pop    %ebp
  20:	c3                   	ret    
