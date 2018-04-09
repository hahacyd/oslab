
bootloader.elf:     file format elf32-i386


Disassembly of section .text:

00007c00 <start>:
    7c00:	fa                   	cli    
    7c01:	e4 92                	in     $0x92,%al
    7c03:	0c 02                	or     $0x2,%al
    7c05:	e6 92                	out    %al,$0x92
    7c07:	67 66 0f 01 15       	lgdtw  (%di)
    7c0c:	44                   	inc    %esp
    7c0d:	7c 00                	jl     7c0f <start+0xf>
    7c0f:	00 0f                	add    %cl,(%edi)
    7c11:	20 c0                	and    %al,%al
    7c13:	0c 01                	or     $0x1,%al
    7c15:	0f 22 c0             	mov    %eax,%cr0
    7c18:	66 ea 20 7c 00 00    	ljmpw  $0x0,$0x7c20
    7c1e:	08 00                	or     %al,(%eax)

00007c20 <start32>:
    7c20:	66 b8 10 00          	mov    $0x10,%ax
    7c24:	8e d0                	mov    %eax,%ss
    7c26:	e9 9b 00 00 00       	jmp    7cc6 <bootMain>
    7c2b:	90                   	nop

00007c2c <gdt>:
	...
    7c34:	ff                   	(bad)  
    7c35:	ff 00                	incl   (%eax)
    7c37:	00 00                	add    %al,(%eax)
    7c39:	9a cf 00 ff ff 00 00 	lcall  $0x0,$0xffff00cf
    7c40:	00                   	.byte 0x0
    7c41:	92                   	xchg   %eax,%edx
    7c42:	cf                   	iret   
	...

00007c44 <gdtDesc>:
    7c44:	17                   	pop    %ss
    7c45:	00 2c 7c             	add    %ch,(%esp,%edi,2)
	...

00007c4a <waitDisk>:
    7c4a:	55                   	push   %ebp
    7c4b:	89 e5                	mov    %esp,%ebp
    7c4d:	ba f7 01 00 00       	mov    $0x1f7,%edx
    7c52:	ec                   	in     (%dx),%al
    7c53:	25 c0 00 00 00       	and    $0xc0,%eax
    7c58:	83 f8 40             	cmp    $0x40,%eax
    7c5b:	75 f5                	jne    7c52 <waitDisk+0x8>
    7c5d:	5d                   	pop    %ebp
    7c5e:	c3                   	ret    

00007c5f <readSect>:
    7c5f:	55                   	push   %ebp
    7c60:	89 e5                	mov    %esp,%ebp
    7c62:	53                   	push   %ebx
    7c63:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    7c66:	e8 df ff ff ff       	call   7c4a <waitDisk>
    7c6b:	ba f2 01 00 00       	mov    $0x1f2,%edx
    7c70:	b0 01                	mov    $0x1,%al
    7c72:	ee                   	out    %al,(%dx)
    7c73:	ba f3 01 00 00       	mov    $0x1f3,%edx
    7c78:	88 c8                	mov    %cl,%al
    7c7a:	ee                   	out    %al,(%dx)
    7c7b:	89 c8                	mov    %ecx,%eax
    7c7d:	c1 f8 08             	sar    $0x8,%eax
    7c80:	ba f4 01 00 00       	mov    $0x1f4,%edx
    7c85:	ee                   	out    %al,(%dx)
    7c86:	89 c8                	mov    %ecx,%eax
    7c88:	c1 f8 10             	sar    $0x10,%eax
    7c8b:	ba f5 01 00 00       	mov    $0x1f5,%edx
    7c90:	ee                   	out    %al,(%dx)
    7c91:	89 c8                	mov    %ecx,%eax
    7c93:	c1 f8 18             	sar    $0x18,%eax
    7c96:	83 c8 e0             	or     $0xffffffe0,%eax
    7c99:	ba f6 01 00 00       	mov    $0x1f6,%edx
    7c9e:	ee                   	out    %al,(%dx)
    7c9f:	ba f7 01 00 00       	mov    $0x1f7,%edx
    7ca4:	b0 20                	mov    $0x20,%al
    7ca6:	ee                   	out    %al,(%dx)
    7ca7:	e8 9e ff ff ff       	call   7c4a <waitDisk>
    7cac:	31 c9                	xor    %ecx,%ecx
    7cae:	ba f0 01 00 00       	mov    $0x1f0,%edx
    7cb3:	ed                   	in     (%dx),%eax
    7cb4:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7cb7:	89 04 8b             	mov    %eax,(%ebx,%ecx,4)
    7cba:	41                   	inc    %ecx
    7cbb:	81 f9 80 00 00 00    	cmp    $0x80,%ecx
    7cc1:	75 f0                	jne    7cb3 <readSect+0x54>
    7cc3:	5b                   	pop    %ebx
    7cc4:	5d                   	pop    %ebp
    7cc5:	c3                   	ret    

00007cc6 <bootMain>:
    7cc6:	55                   	push   %ebp
    7cc7:	89 e5                	mov    %esp,%ebp
    7cc9:	53                   	push   %ebx
    7cca:	51                   	push   %ecx
    7ccb:	bb 01 00 00 00       	mov    $0x1,%ebx
    7cd0:	53                   	push   %ebx
    7cd1:	8d 83 ff 7f 01 00    	lea    0x17fff(%ebx),%eax
    7cd7:	c1 e0 09             	shl    $0x9,%eax
    7cda:	50                   	push   %eax
    7cdb:	e8 7f ff ff ff       	call   7c5f <readSect>
    7ce0:	43                   	inc    %ebx
    7ce1:	58                   	pop    %eax
    7ce2:	5a                   	pop    %edx
    7ce3:	81 fb c9 00 00 00    	cmp    $0xc9,%ebx
    7ce9:	75 e5                	jne    7cd0 <bootMain+0xa>
    7ceb:	a1 1c 00 00 03       	mov    0x300001c,%eax
    7cf0:	05 00 00 00 03       	add    $0x3000000,%eax
    7cf5:	66 83 3d 2c 00 00 03 	cmpw   $0x0,0x300002c
    7cfc:	00 
    7cfd:	74 35                	je     7d34 <bootMain+0x6e>
    7cff:	83 38 01             	cmpl   $0x1,(%eax)
    7d02:	74 05                	je     7d09 <bootMain+0x43>
    7d04:	83 c0 20             	add    $0x20,%eax
    7d07:	eb ec                	jmp    7cf5 <bootMain+0x2f>
    7d09:	8b 50 08             	mov    0x8(%eax),%edx
    7d0c:	8b 58 04             	mov    0x4(%eax),%ebx
    7d0f:	81 c3 00 00 00 03    	add    $0x3000000,%ebx
    7d15:	8b 48 10             	mov    0x10(%eax),%ecx
    7d18:	03 48 08             	add    0x8(%eax),%ecx
    7d1b:	39 ca                	cmp    %ecx,%edx
    7d1d:	73 06                	jae    7d25 <bootMain+0x5f>
    7d1f:	8a 0b                	mov    (%ebx),%cl
    7d21:	88 0a                	mov    %cl,(%edx)
    7d23:	eb f0                	jmp    7d15 <bootMain+0x4f>
    7d25:	8b 48 14             	mov    0x14(%eax),%ecx
    7d28:	03 48 08             	add    0x8(%eax),%ecx
    7d2b:	39 ca                	cmp    %ecx,%edx
    7d2d:	73 d5                	jae    7d04 <bootMain+0x3e>
    7d2f:	c6 02 00             	movb   $0x0,(%edx)
    7d32:	eb f1                	jmp    7d25 <bootMain+0x5f>
    7d34:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    7d37:	c9                   	leave  
    7d38:	ff 25 18 00 00 03    	jmp    *0x3000018
