
boot.o:     file format elf32-i386


Disassembly of section .text:

00000000 <bootMain>:
   0:	83 ec 0c             	sub    $0xc,%esp
   3:	b8 00 00 00 00       	mov    $0x0,%eax
   8:	ff d0                	call   *%eax
   a:	83 c4 0c             	add    $0xc,%esp
   d:	c3                   	ret    

0000000e <waitDisk>:
   e:	ba f7 01 00 00       	mov    $0x1f7,%edx
  13:	ec                   	in     (%dx),%al
  14:	25 c0 00 00 00       	and    $0xc0,%eax
  19:	83 f8 40             	cmp    $0x40,%eax
  1c:	75 f5                	jne    13 <waitDisk+0x5>
  1e:	f3 c3                	repz ret 

00000020 <readSect>:
  20:	56                   	push   %esi
  21:	53                   	push   %ebx
  22:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
  26:	8b 74 24 10          	mov    0x10(%esp),%esi
  2a:	e8 fc ff ff ff       	call   2b <readSect+0xb>
  2f:	ba f2 01 00 00       	mov    $0x1f2,%edx
  34:	b8 01 00 00 00       	mov    $0x1,%eax
  39:	ee                   	out    %al,(%dx)
  3a:	ba f3 01 00 00       	mov    $0x1f3,%edx
  3f:	89 f0                	mov    %esi,%eax
  41:	ee                   	out    %al,(%dx)
  42:	89 f0                	mov    %esi,%eax
  44:	c1 f8 08             	sar    $0x8,%eax
  47:	ba f4 01 00 00       	mov    $0x1f4,%edx
  4c:	ee                   	out    %al,(%dx)
  4d:	89 f0                	mov    %esi,%eax
  4f:	c1 f8 10             	sar    $0x10,%eax
  52:	ba f5 01 00 00       	mov    $0x1f5,%edx
  57:	ee                   	out    %al,(%dx)
  58:	89 f0                	mov    %esi,%eax
  5a:	c1 f8 18             	sar    $0x18,%eax
  5d:	83 c8 e0             	or     $0xffffffe0,%eax
  60:	ba f6 01 00 00       	mov    $0x1f6,%edx
  65:	ee                   	out    %al,(%dx)
  66:	ba f7 01 00 00       	mov    $0x1f7,%edx
  6b:	b8 20 00 00 00       	mov    $0x20,%eax
  70:	ee                   	out    %al,(%dx)
  71:	e8 fc ff ff ff       	call   72 <readSect+0x52>
  76:	89 d9                	mov    %ebx,%ecx
  78:	81 c3 00 02 00 00    	add    $0x200,%ebx
  7e:	ba f0 01 00 00       	mov    $0x1f0,%edx
  83:	ed                   	in     (%dx),%eax
  84:	89 01                	mov    %eax,(%ecx)
  86:	83 c1 04             	add    $0x4,%ecx
  89:	39 d9                	cmp    %ebx,%ecx
  8b:	75 f6                	jne    83 <readSect+0x63>
  8d:	5b                   	pop    %ebx
  8e:	5e                   	pop    %esi
  8f:	c3                   	ret    
