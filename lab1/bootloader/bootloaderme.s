
bootloader.elf:     file format elf32-i386


Disassembly of section .text:

00007c00 <start>:
    7c00:	fa                   	cli    
    7c01:	e4 92                	in     $0x92,%al
    7c03:	0c 02                	or     $0x2,%al
    7c05:	e6 92                	out    %al,$0x92
    7c07:	67 66 0f 01 15       	lgdtw  (%di)
    7c0c:	5c                   	pop    %esp
    7c0d:	7c 00                	jl     7c0f <start+0xf>
    7c0f:	00 0f                	add    %cl,(%edi)
    7c11:	20 c0                	and    %al,%al
    7c13:	0c 01                	or     $0x1,%al
    7c15:	0f 22 c0             	mov    %eax,%cr0
    7c18:	66 ea 20 7c 00 00    	ljmpw  $0x0,$0x7c20
    7c1e:	08 00                	or     %al,(%eax)

00007c20 <start32>:
    7c20:	66 b8 10 00          	mov    $0x10,%ax
    7c24:	8e d8                	mov    %eax,%ds
    7c26:	66 b8 10 00          	mov    $0x10,%ax
    7c2a:	8e c0                	mov    %eax,%es
    7c2c:	8e d0                	mov    %eax,%ss
    7c2e:	8e e0                	mov    %eax,%fs
    7c30:	66 b8 18 00          	mov    $0x18,%ax
    7c34:	8e e8                	mov    %eax,%gs
    7c36:	e9 a9 00 00 00       	jmp    7ce4 <bootMain>
    7c3b:	90                   	nop

00007c3c <gdt>:
	...
    7c44:	ff                   	(bad)  
    7c45:	ff 00                	incl   (%eax)
    7c47:	00 00                	add    %al,(%eax)
    7c49:	9a cf 00 ff ff 00 00 	lcall  $0x0,$0xffff00cf
    7c50:	00 92 cf 00 ff ff    	add    %dl,-0xff31(%edx)
    7c56:	00 80 0b 92 cf 00    	add    %al,0xcf920b(%eax)

00007c5c <gdtDesc>:
    7c5c:	1f                   	pop    %ds
    7c5d:	00 3c 7c             	add    %bh,(%esp,%edi,2)
	...

00007c62 <waitDisk>:
    7c62:	ba f7 01 00 00       	mov    $0x1f7,%edx
    7c67:	ec                   	in     (%dx),%al
    7c68:	25 c0 00 00 00       	and    $0xc0,%eax
    7c6d:	83 f8 40             	cmp    $0x40,%eax
    7c70:	75 f5                	jne    7c67 <waitDisk+0x5>
    7c72:	f3 c3                	repz ret 

00007c74 <readSect>:
    7c74:	56                   	push   %esi
    7c75:	53                   	push   %ebx
    7c76:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
    7c7a:	8b 74 24 10          	mov    0x10(%esp),%esi
    7c7e:	e8 df ff ff ff       	call   7c62 <waitDisk>
    7c83:	ba f2 01 00 00       	mov    $0x1f2,%edx
    7c88:	b8 01 00 00 00       	mov    $0x1,%eax
    7c8d:	ee                   	out    %al,(%dx)
    7c8e:	ba f3 01 00 00       	mov    $0x1f3,%edx
    7c93:	89 f0                	mov    %esi,%eax
    7c95:	ee                   	out    %al,(%dx)
    7c96:	89 f0                	mov    %esi,%eax
    7c98:	c1 f8 08             	sar    $0x8,%eax
    7c9b:	ba f4 01 00 00       	mov    $0x1f4,%edx
    7ca0:	ee                   	out    %al,(%dx)
    7ca1:	89 f0                	mov    %esi,%eax
    7ca3:	c1 f8 10             	sar    $0x10,%eax
    7ca6:	ba f5 01 00 00       	mov    $0x1f5,%edx
    7cab:	ee                   	out    %al,(%dx)
    7cac:	89 f0                	mov    %esi,%eax
    7cae:	c1 f8 18             	sar    $0x18,%eax
    7cb1:	83 c8 e0             	or     $0xffffffe0,%eax
    7cb4:	ba f6 01 00 00       	mov    $0x1f6,%edx
    7cb9:	ee                   	out    %al,(%dx)
    7cba:	ba f7 01 00 00       	mov    $0x1f7,%edx
    7cbf:	b8 20 00 00 00       	mov    $0x20,%eax
    7cc4:	ee                   	out    %al,(%dx)
    7cc5:	e8 98 ff ff ff       	call   7c62 <waitDisk>
    7cca:	89 d9                	mov    %ebx,%ecx
    7ccc:	81 c3 00 02 00 00    	add    $0x200,%ebx
    7cd2:	ba f0 01 00 00       	mov    $0x1f0,%edx
    7cd7:	ed                   	in     (%dx),%eax
    7cd8:	89 01                	mov    %eax,(%ecx)
    7cda:	83 c1 04             	add    $0x4,%ecx
    7cdd:	39 d9                	cmp    %ebx,%ecx
    7cdf:	75 f6                	jne    7cd7 <readSect+0x63>
    7ce1:	5b                   	pop    %ebx
    7ce2:	5e                   	pop    %esi
    7ce3:	c3                   	ret    

00007ce4 <bootMain>:
    7ce4:	83 ec 0c             	sub    $0xc,%esp
    7ce7:	6a 01                	push   $0x1
    7ce9:	68 00 8c 00 00       	push   $0x8c00
    7cee:	e8 81 ff ff ff       	call   7c74 <readSect>
    7cf3:	83 c4 08             	add    $0x8,%esp
    7cf6:	b8 00 8c 00 00       	mov    $0x8c00,%eax
    7cfb:	ff d0                	call   *%eax
    7cfd:	83 c4 0c             	add    $0xc,%esp
    7d00:	c3                   	ret    
