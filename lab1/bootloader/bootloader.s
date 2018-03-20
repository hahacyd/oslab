
bootloader.elf:     file format elf32-i386


Disassembly of section .text:

00007c00 <start>:
    7c00:	b8 13 7c 89 c5       	mov    $0xc5897c13,%eax
    7c05:	b9 18 00 b8 01       	mov    $0x1b80018,%ecx
    7c0a:	13 bb 0c 00 ba 00    	adc    0xba000c(%ebx),%edi
    7c10:	08 cd                	or     %cl,%ch
    7c12:	10                   	.byte 0x10

00007c13 <message>:
    7c13:	48                   	dec    %eax
    7c14:	65 6c                	gs insb (%dx),%es:(%edi)
    7c16:	6c                   	insb   (%dx),%es:(%edi)
    7c17:	6f                   	outsl  %ds:(%esi),(%dx)
    7c18:	2c 20                	sub    $0x20,%al
    7c1a:	57                   	push   %edi
    7c1b:	6f                   	outsl  %ds:(%esi),(%dx)
    7c1c:	72 6c                	jb     7c8a <gdt+0x1e>
    7c1e:	64 21 20             	and    %esp,%fs:(%eax)
    7c21:	57                   	push   %edi
    7c22:	65 6c                	gs insb (%dx),%es:(%edi)
    7c24:	63 6f 6d             	arpl   %bp,0x6d(%edi)
    7c27:	65 20 21             	and    %ah,%gs:(%ecx)
    7c2a:	0a 00                	or     (%eax),%al
    7c2c:	fa                   	cli    
    7c2d:	e4 92                	in     $0x92,%al
    7c2f:	0c 02                	or     $0x2,%al
    7c31:	e6 92                	out    %al,$0x92
    7c33:	67 66 0f 01 15       	lgdtw  (%di)
    7c38:	8c 7c 00 00          	mov    %?,0x0(%eax,%eax,1)
    7c3c:	0f 20 c0             	mov    %cr0,%eax
    7c3f:	0c 01                	or     $0x1,%al
    7c41:	0f 22 c0             	mov    %eax,%cr0
    7c44:	66 ea 4c 7c 00 00    	ljmpw  $0x0,$0x7c4c
    7c4a:	08 00                	or     %al,(%eax)

00007c4c <start32>:
    7c4c:	66 b8 00 00          	mov    $0x0,%ax
    7c50:	8e d8                	mov    %eax,%ds
    7c52:	8e c0                	mov    %eax,%es
    7c54:	8e e0                	mov    %eax,%fs
    7c56:	8e e8                	mov    %eax,%gs
    7c58:	8e d0                	mov    %eax,%ss
    7c5a:	bd 00 00 00 00       	mov    $0x0,%ebp
    7c5f:	bc 00 00 00 08       	mov    $0x8000000,%esp
    7c64:	e9 29 00 00 00       	jmp    7c92 <bootMain>
    7c69:	8d 76 00             	lea    0x0(%esi),%esi

00007c6c <gdt>:
	...
    7c74:	ff                   	(bad)  
    7c75:	ff 00                	incl   (%eax)
    7c77:	00 00                	add    %al,(%eax)
    7c79:	9a cf 00 ff ff 00 00 	lcall  $0x0,$0xffff00cf
    7c80:	00 92 cf 00 ff ff    	add    %dl,-0xff31(%edx)
    7c86:	00 80 0b 92 cf 00    	add    %al,0xcf920b(%eax)

00007c8c <gdtDesc>:
    7c8c:	1f                   	pop    %ds
    7c8d:	00 6c 7c 00          	add    %ch,0x0(%esp,%edi,2)
	...

00007c92 <bootMain>:
    7c92:	83 ec 0c             	sub    $0xc,%esp
    7c95:	b8 00 00 00 00       	mov    $0x0,%eax
    7c9a:	ff d0                	call   *%eax
    7c9c:	83 c4 0c             	add    $0xc,%esp
    7c9f:	c3                   	ret    

00007ca0 <waitDisk>:
    7ca0:	ba f7 01 00 00       	mov    $0x1f7,%edx
    7ca5:	ec                   	in     (%dx),%al
    7ca6:	25 c0 00 00 00       	and    $0xc0,%eax
    7cab:	83 f8 40             	cmp    $0x40,%eax
    7cae:	75 f5                	jne    7ca5 <waitDisk+0x5>
    7cb0:	f3 c3                	repz ret 

00007cb2 <readSect>:
    7cb2:	56                   	push   %esi
    7cb3:	53                   	push   %ebx
    7cb4:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
    7cb8:	8b 74 24 10          	mov    0x10(%esp),%esi
    7cbc:	e8 df ff ff ff       	call   7ca0 <waitDisk>
    7cc1:	ba f2 01 00 00       	mov    $0x1f2,%edx
    7cc6:	b8 01 00 00 00       	mov    $0x1,%eax
    7ccb:	ee                   	out    %al,(%dx)
    7ccc:	ba f3 01 00 00       	mov    $0x1f3,%edx
    7cd1:	89 f0                	mov    %esi,%eax
    7cd3:	ee                   	out    %al,(%dx)
    7cd4:	89 f0                	mov    %esi,%eax
    7cd6:	c1 f8 08             	sar    $0x8,%eax
    7cd9:	ba f4 01 00 00       	mov    $0x1f4,%edx
    7cde:	ee                   	out    %al,(%dx)
    7cdf:	89 f0                	mov    %esi,%eax
    7ce1:	c1 f8 10             	sar    $0x10,%eax
    7ce4:	ba f5 01 00 00       	mov    $0x1f5,%edx
    7ce9:	ee                   	out    %al,(%dx)
    7cea:	89 f0                	mov    %esi,%eax
    7cec:	c1 f8 18             	sar    $0x18,%eax
    7cef:	83 c8 e0             	or     $0xffffffe0,%eax
    7cf2:	ba f6 01 00 00       	mov    $0x1f6,%edx
    7cf7:	ee                   	out    %al,(%dx)
    7cf8:	ba f7 01 00 00       	mov    $0x1f7,%edx
    7cfd:	b8 20 00 00 00       	mov    $0x20,%eax
    7d02:	ee                   	out    %al,(%dx)
    7d03:	e8 98 ff ff ff       	call   7ca0 <waitDisk>
    7d08:	89 d9                	mov    %ebx,%ecx
    7d0a:	81 c3 00 02 00 00    	add    $0x200,%ebx
    7d10:	ba f0 01 00 00       	mov    $0x1f0,%edx
    7d15:	ed                   	in     (%dx),%eax
    7d16:	89 01                	mov    %eax,(%ecx)
    7d18:	83 c1 04             	add    $0x4,%ecx
    7d1b:	39 d9                	cmp    %ebx,%ecx
    7d1d:	75 f6                	jne    7d15 <readSect+0x63>
    7d1f:	5b                   	pop    %ebx
    7d20:	5e                   	pop    %esi
    7d21:	c3                   	ret    
