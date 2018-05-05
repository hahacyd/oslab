
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	53                   	push   %ebx
  200004:	83 ec 10             	sub    $0x10,%esp
  200007:	6a 63                	push   $0x63
  200009:	e8 2e 02 00 00       	call   20023c <printc>
  20000e:	e8 b5 00 00 00       	call   2000c8 <exit>
  200013:	e8 78 00 00 00       	call   200090 <fork>
  200018:	89 c3                	mov    %eax,%ebx
  20001a:	83 c4 10             	add    $0x10,%esp
  20001d:	85 c0                	test   %eax,%eax
  20001f:	75 39                	jne    20005a <uEntry+0x5a>
  200021:	83 ec 0c             	sub    $0xc,%esp
  200024:	68 82 03 20 00       	push   $0x200382
  200029:	e8 5e 02 00 00       	call   20028c <printf>
  20002e:	83 c4 10             	add    $0x10,%esp
  200031:	83 ec 08             	sub    $0x8,%esp
  200034:	53                   	push   %ebx
  200035:	68 9b 03 20 00       	push   $0x20039b
  20003a:	e8 4d 02 00 00       	call   20028c <printf>
  20003f:	e8 84 00 00 00       	call   2000c8 <exit>
  200044:	83 c4 10             	add    $0x10,%esp
  200047:	90                   	nop
  200048:	83 ec 0c             	sub    $0xc,%esp
  20004b:	68 a5 03 20 00       	push   $0x2003a5
  200050:	e8 37 02 00 00       	call   20028c <printf>
  200055:	83 c4 10             	add    $0x10,%esp
  200058:	eb ee                	jmp    200048 <uEntry+0x48>
  20005a:	83 ec 0c             	sub    $0xc,%esp
  20005d:	6a 25                	push   $0x25
  20005f:	e8 4c 00 00 00       	call   2000b0 <sleep>
  200064:	c7 04 24 8e 03 20 00 	movl   $0x20038e,(%esp)
  20006b:	e8 1c 02 00 00       	call   20028c <printf>
  200070:	83 c4 10             	add    $0x10,%esp
  200073:	eb bc                	jmp    200031 <uEntry+0x31>
  200075:	66 90                	xchg   %ax,%ax
  200077:	90                   	nop

00200078 <syscall>:
  200078:	55                   	push   %ebp
  200079:	89 e5                	mov    %esp,%ebp
  20007b:	53                   	push   %ebx
  20007c:	8b 55 14             	mov    0x14(%ebp),%edx
  20007f:	8b 4d 10             	mov    0x10(%ebp),%ecx
  200082:	8b 45 08             	mov    0x8(%ebp),%eax
  200085:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  200088:	cd 80                	int    $0x80
  20008a:	5b                   	pop    %ebx
  20008b:	5d                   	pop    %ebp
  20008c:	c3                   	ret    
  20008d:	8d 76 00             	lea    0x0(%esi),%esi

00200090 <fork>:
  200090:	55                   	push   %ebp
  200091:	89 e5                	mov    %esp,%ebp
  200093:	53                   	push   %ebx
  200094:	ba 0d 00 00 00       	mov    $0xd,%edx
  200099:	b9 b4 03 20 00       	mov    $0x2003b4,%ecx
  20009e:	bb 01 00 00 00       	mov    $0x1,%ebx
  2000a3:	b8 02 00 00 00       	mov    $0x2,%eax
  2000a8:	cd 80                	int    $0x80
  2000aa:	5b                   	pop    %ebx
  2000ab:	5d                   	pop    %ebp
  2000ac:	c3                   	ret    
  2000ad:	8d 76 00             	lea    0x0(%esi),%esi

002000b0 <sleep>:
  2000b0:	55                   	push   %ebp
  2000b1:	89 e5                	mov    %esp,%ebp
  2000b3:	53                   	push   %ebx
  2000b4:	31 c9                	xor    %ecx,%ecx
  2000b6:	b8 e6 00 00 00       	mov    $0xe6,%eax
  2000bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  2000be:	89 ca                	mov    %ecx,%edx
  2000c0:	cd 80                	int    $0x80
  2000c2:	31 c0                	xor    %eax,%eax
  2000c4:	5b                   	pop    %ebx
  2000c5:	5d                   	pop    %ebp
  2000c6:	c3                   	ret    
  2000c7:	90                   	nop

002000c8 <exit>:
  2000c8:	55                   	push   %ebp
  2000c9:	89 e5                	mov    %esp,%ebp
  2000cb:	53                   	push   %ebx
  2000cc:	31 d2                	xor    %edx,%edx
  2000ce:	b8 01 00 00 00       	mov    $0x1,%eax
  2000d3:	89 d3                	mov    %edx,%ebx
  2000d5:	89 d1                	mov    %edx,%ecx
  2000d7:	cd 80                	int    $0x80
  2000d9:	31 c0                	xor    %eax,%eax
  2000db:	5b                   	pop    %ebx
  2000dc:	5d                   	pop    %ebp
  2000dd:	c3                   	ret    
  2000de:	66 90                	xchg   %ax,%ax

002000e0 <putchar_user>:
  2000e0:	55                   	push   %ebp
  2000e1:	89 e5                	mov    %esp,%ebp
  2000e3:	53                   	push   %ebx
  2000e4:	83 ec 10             	sub    $0x10,%esp
  2000e7:	bb 01 00 00 00       	mov    $0x1,%ebx
  2000ec:	8d 4d fb             	lea    -0x5(%ebp),%ecx
  2000ef:	b8 04 00 00 00       	mov    $0x4,%eax
  2000f4:	89 da                	mov    %ebx,%edx
  2000f6:	cd 80                	int    $0x80
  2000f8:	83 c4 10             	add    $0x10,%esp
  2000fb:	5b                   	pop    %ebx
  2000fc:	5d                   	pop    %ebp
  2000fd:	c3                   	ret    
  2000fe:	66 90                	xchg   %ax,%ax

00200100 <printd>:
  200100:	55                   	push   %ebp
  200101:	89 e5                	mov    %esp,%ebp
  200103:	57                   	push   %edi
  200104:	56                   	push   %esi
  200105:	53                   	push   %ebx
  200106:	83 ec 24             	sub    $0x24,%esp
  200109:	8b 5d 08             	mov    0x8(%ebp),%ebx
  20010c:	85 db                	test   %ebx,%ebx
  20010e:	0f 88 80 00 00 00    	js     200194 <printd+0x94>
  200114:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
  200118:	c6 45 d3 00          	movb   $0x0,-0x2d(%ebp)
  20011c:	8d 4d f3             	lea    -0xd(%ebp),%ecx
  20011f:	be 0a 00 00 00       	mov    $0xa,%esi
  200124:	bf 67 66 66 66       	mov    $0x66666667,%edi
  200129:	8d 76 00             	lea    0x0(%esi),%esi
  20012c:	49                   	dec    %ecx
  20012d:	89 d8                	mov    %ebx,%eax
  20012f:	99                   	cltd   
  200130:	f7 fe                	idiv   %esi
  200132:	83 c2 30             	add    $0x30,%edx
  200135:	88 11                	mov    %dl,(%ecx)
  200137:	89 d8                	mov    %ebx,%eax
  200139:	f7 ef                	imul   %edi
  20013b:	89 d0                	mov    %edx,%eax
  20013d:	c1 f8 02             	sar    $0x2,%eax
  200140:	c1 fb 1f             	sar    $0x1f,%ebx
  200143:	29 d8                	sub    %ebx,%eax
  200145:	89 c3                	mov    %eax,%ebx
  200147:	75 e3                	jne    20012c <printd+0x2c>
  200149:	80 7d d3 01          	cmpb   $0x1,-0x2d(%ebp)
  20014d:	74 35                	je     200184 <printd+0x84>
  20014f:	80 7d d2 01          	cmpb   $0x1,-0x2e(%ebp)
  200153:	74 3a                	je     20018f <printd+0x8f>
  200155:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  200159:	80 39 00             	cmpb   $0x0,(%ecx)
  20015c:	74 58                	je     2001b6 <printd+0xb6>
  20015e:	31 c0                	xor    %eax,%eax
  200160:	40                   	inc    %eax
  200161:	89 c2                	mov    %eax,%edx
  200163:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  200167:	75 f7                	jne    200160 <printd+0x60>
  200169:	81 e9 00 00 01 00    	sub    $0x10000,%ecx
  20016f:	bb 01 00 00 00       	mov    $0x1,%ebx
  200174:	b8 04 00 00 00       	mov    $0x4,%eax
  200179:	cd 80                	int    $0x80
  20017b:	83 c4 24             	add    $0x24,%esp
  20017e:	5b                   	pop    %ebx
  20017f:	5e                   	pop    %esi
  200180:	5f                   	pop    %edi
  200181:	5d                   	pop    %ebp
  200182:	c3                   	ret    
  200183:	90                   	nop
  200184:	c6 41 ff 2d          	movb   $0x2d,-0x1(%ecx)
  200188:	49                   	dec    %ecx
  200189:	80 7d d2 01          	cmpb   $0x1,-0x2e(%ebp)
  20018d:	75 c6                	jne    200155 <printd+0x55>
  20018f:	fe 45 f2             	incb   -0xe(%ebp)
  200192:	eb c1                	jmp    200155 <printd+0x55>
  200194:	81 fb 00 00 00 80    	cmp    $0x80000000,%ebx
  20019a:	74 0f                	je     2001ab <printd+0xab>
  20019c:	f7 db                	neg    %ebx
  20019e:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
  2001a2:	c6 45 d3 01          	movb   $0x1,-0x2d(%ebp)
  2001a6:	e9 71 ff ff ff       	jmp    20011c <printd+0x1c>
  2001ab:	bb ff ff ff 7f       	mov    $0x7fffffff,%ebx
  2001b0:	c6 45 d2 01          	movb   $0x1,-0x2e(%ebp)
  2001b4:	eb ec                	jmp    2001a2 <printd+0xa2>
  2001b6:	31 d2                	xor    %edx,%edx
  2001b8:	eb af                	jmp    200169 <printd+0x69>
  2001ba:	66 90                	xchg   %ax,%ax

002001bc <printx>:
  2001bc:	55                   	push   %ebp
  2001bd:	89 e5                	mov    %esp,%ebp
  2001bf:	53                   	push   %ebx
  2001c0:	83 ec 20             	sub    $0x20,%esp
  2001c3:	8b 45 08             	mov    0x8(%ebp),%eax
  2001c6:	8d 5d fa             	lea    -0x6(%ebp),%ebx
  2001c9:	eb 12                	jmp    2001dd <printx+0x21>
  2001cb:	90                   	nop
  2001cc:	83 c2 57             	add    $0x57,%edx
  2001cf:	88 13                	mov    %dl,(%ebx)
  2001d1:	85 c0                	test   %eax,%eax
  2001d3:	78 22                	js     2001f7 <printx+0x3b>
  2001d5:	c1 f8 04             	sar    $0x4,%eax
  2001d8:	4b                   	dec    %ebx
  2001d9:	85 c0                	test   %eax,%eax
  2001db:	74 25                	je     200202 <printx+0x46>
  2001dd:	89 c2                	mov    %eax,%edx
  2001df:	81 e2 0f 00 00 80    	and    $0x8000000f,%edx
  2001e5:	78 49                	js     200230 <printx+0x74>
  2001e7:	89 d9                	mov    %ebx,%ecx
  2001e9:	83 fa 09             	cmp    $0x9,%edx
  2001ec:	7f de                	jg     2001cc <printx+0x10>
  2001ee:	83 c2 30             	add    $0x30,%edx
  2001f1:	88 13                	mov    %dl,(%ebx)
  2001f3:	85 c0                	test   %eax,%eax
  2001f5:	79 de                	jns    2001d5 <printx+0x19>
  2001f7:	83 c0 0f             	add    $0xf,%eax
  2001fa:	c1 f8 04             	sar    $0x4,%eax
  2001fd:	4b                   	dec    %ebx
  2001fe:	85 c0                	test   %eax,%eax
  200200:	75 db                	jne    2001dd <printx+0x21>
  200202:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
  200206:	80 39 00             	cmpb   $0x0,(%ecx)
  200209:	74 2c                	je     200237 <printx+0x7b>
  20020b:	90                   	nop
  20020c:	40                   	inc    %eax
  20020d:	89 c2                	mov    %eax,%edx
  20020f:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  200213:	75 f7                	jne    20020c <printx+0x50>
  200215:	81 e9 00 00 01 00    	sub    $0x10000,%ecx
  20021b:	bb 01 00 00 00       	mov    $0x1,%ebx
  200220:	b8 04 00 00 00       	mov    $0x4,%eax
  200225:	cd 80                	int    $0x80
  200227:	83 c4 20             	add    $0x20,%esp
  20022a:	5b                   	pop    %ebx
  20022b:	5d                   	pop    %ebp
  20022c:	c3                   	ret    
  20022d:	8d 76 00             	lea    0x0(%esi),%esi
  200230:	4a                   	dec    %edx
  200231:	83 ca f0             	or     $0xfffffff0,%edx
  200234:	42                   	inc    %edx
  200235:	eb b0                	jmp    2001e7 <printx+0x2b>
  200237:	31 d2                	xor    %edx,%edx
  200239:	eb da                	jmp    200215 <printx+0x59>
  20023b:	90                   	nop

0020023c <printc>:
  20023c:	55                   	push   %ebp
  20023d:	89 e5                	mov    %esp,%ebp
  20023f:	53                   	push   %ebx
  200240:	50                   	push   %eax
  200241:	bb 01 00 00 00       	mov    $0x1,%ebx
  200246:	8d 4d f8             	lea    -0x8(%ebp),%ecx
  200249:	b8 04 00 00 00       	mov    $0x4,%eax
  20024e:	89 da                	mov    %ebx,%edx
  200250:	cd 80                	int    $0x80
  200252:	5a                   	pop    %edx
  200253:	5b                   	pop    %ebx
  200254:	5d                   	pop    %ebp
  200255:	c3                   	ret    
  200256:	66 90                	xchg   %ax,%ax

00200258 <prints>:
  200258:	55                   	push   %ebp
  200259:	89 e5                	mov    %esp,%ebp
  20025b:	53                   	push   %ebx
  20025c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  20025f:	80 39 00             	cmpb   $0x0,(%ecx)
  200262:	74 22                	je     200286 <prints+0x2e>
  200264:	31 c0                	xor    %eax,%eax
  200266:	66 90                	xchg   %ax,%ax
  200268:	40                   	inc    %eax
  200269:	89 c2                	mov    %eax,%edx
  20026b:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  20026f:	75 f7                	jne    200268 <prints+0x10>
  200271:	81 e9 00 00 01 00    	sub    $0x10000,%ecx
  200277:	bb 01 00 00 00       	mov    $0x1,%ebx
  20027c:	b8 04 00 00 00       	mov    $0x4,%eax
  200281:	cd 80                	int    $0x80
  200283:	5b                   	pop    %ebx
  200284:	5d                   	pop    %ebp
  200285:	c3                   	ret    
  200286:	31 d2                	xor    %edx,%edx
  200288:	eb e7                	jmp    200271 <prints+0x19>
  20028a:	66 90                	xchg   %ax,%ax

0020028c <printf>:
  20028c:	55                   	push   %ebp
  20028d:	89 e5                	mov    %esp,%ebp
  20028f:	57                   	push   %edi
  200290:	56                   	push   %esi
  200291:	53                   	push   %ebx
  200292:	83 ec 14             	sub    $0x14,%esp
  200295:	8b 7d 08             	mov    0x8(%ebp),%edi
  200298:	8a 07                	mov    (%edi),%al
  20029a:	8d 9d 0c 00 01 00    	lea    0x1000c(%ebp),%ebx
  2002a0:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  2002a3:	84 c0                	test   %al,%al
  2002a5:	75 25                	jne    2002cc <printf+0x40>
  2002a7:	eb 5a                	jmp    200303 <printf+0x77>
  2002a9:	8d 76 00             	lea    0x0(%esi),%esi
  2002ac:	88 45 f3             	mov    %al,-0xd(%ebp)
  2002af:	ba 01 00 00 00       	mov    $0x1,%edx
  2002b4:	b8 04 00 00 00       	mov    $0x4,%eax
  2002b9:	89 d3                	mov    %edx,%ebx
  2002bb:	8d 4d f3             	lea    -0xd(%ebp),%ecx
  2002be:	cd 80                	int    $0x80
  2002c0:	89 fe                	mov    %edi,%esi
  2002c2:	8d 7e 01             	lea    0x1(%esi),%edi
  2002c5:	8a 46 01             	mov    0x1(%esi),%al
  2002c8:	84 c0                	test   %al,%al
  2002ca:	74 37                	je     200303 <printf+0x77>
  2002cc:	3c 25                	cmp    $0x25,%al
  2002ce:	75 dc                	jne    2002ac <printf+0x20>
  2002d0:	8d 77 01             	lea    0x1(%edi),%esi
  2002d3:	8a 47 01             	mov    0x1(%edi),%al
  2002d6:	3c 64                	cmp    $0x64,%al
  2002d8:	0f 84 8a 00 00 00    	je     200368 <printf+0xdc>
  2002de:	7e 2c                	jle    20030c <printf+0x80>
  2002e0:	3c 73                	cmp    $0x73,%al
  2002e2:	74 50                	je     200334 <printf+0xa8>
  2002e4:	3c 78                	cmp    $0x78,%al
  2002e6:	75 da                	jne    2002c2 <printf+0x36>
  2002e8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  2002eb:	8d 58 04             	lea    0x4(%eax),%ebx
  2002ee:	ff 30                	pushl  (%eax)
  2002f0:	e8 c7 fe ff ff       	call   2001bc <printx>
  2002f5:	58                   	pop    %eax
  2002f6:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  2002f9:	8d 7e 01             	lea    0x1(%esi),%edi
  2002fc:	8a 46 01             	mov    0x1(%esi),%al
  2002ff:	84 c0                	test   %al,%al
  200301:	75 c9                	jne    2002cc <printf+0x40>
  200303:	8d 65 f4             	lea    -0xc(%ebp),%esp
  200306:	5b                   	pop    %ebx
  200307:	5e                   	pop    %esi
  200308:	5f                   	pop    %edi
  200309:	5d                   	pop    %ebp
  20030a:	c3                   	ret    
  20030b:	90                   	nop
  20030c:	3c 63                	cmp    $0x63,%al
  20030e:	75 b2                	jne    2002c2 <printf+0x36>
  200310:	8b 45 e0             	mov    -0x20(%ebp),%eax
  200313:	8d 78 04             	lea    0x4(%eax),%edi
  200316:	8b 00                	mov    (%eax),%eax
  200318:	88 45 f2             	mov    %al,-0xe(%ebp)
  20031b:	ba 01 00 00 00       	mov    $0x1,%edx
  200320:	b8 04 00 00 00       	mov    $0x4,%eax
  200325:	89 d3                	mov    %edx,%ebx
  200327:	8d 4d f2             	lea    -0xe(%ebp),%ecx
  20032a:	cd 80                	int    $0x80
  20032c:	89 7d e0             	mov    %edi,-0x20(%ebp)
  20032f:	eb 91                	jmp    2002c2 <printf+0x36>
  200331:	8d 76 00             	lea    0x0(%esi),%esi
  200334:	8b 45 e0             	mov    -0x20(%ebp),%eax
  200337:	8d 78 04             	lea    0x4(%eax),%edi
  20033a:	8b 08                	mov    (%eax),%ecx
  20033c:	80 39 00             	cmpb   $0x0,(%ecx)
  20033f:	74 3d                	je     20037e <printf+0xf2>
  200341:	31 c0                	xor    %eax,%eax
  200343:	90                   	nop
  200344:	40                   	inc    %eax
  200345:	89 c2                	mov    %eax,%edx
  200347:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
  20034b:	75 f7                	jne    200344 <printf+0xb8>
  20034d:	81 e9 00 00 01 00    	sub    $0x10000,%ecx
  200353:	bb 01 00 00 00       	mov    $0x1,%ebx
  200358:	b8 04 00 00 00       	mov    $0x4,%eax
  20035d:	cd 80                	int    $0x80
  20035f:	89 7d e0             	mov    %edi,-0x20(%ebp)
  200362:	e9 5b ff ff ff       	jmp    2002c2 <printf+0x36>
  200367:	90                   	nop
  200368:	8b 45 e0             	mov    -0x20(%ebp),%eax
  20036b:	8d 58 04             	lea    0x4(%eax),%ebx
  20036e:	ff 30                	pushl  (%eax)
  200370:	e8 8b fd ff ff       	call   200100 <printd>
  200375:	5a                   	pop    %edx
  200376:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  200379:	e9 44 ff ff ff       	jmp    2002c2 <printf+0x36>
  20037e:	31 d2                	xor    %edx,%edx
  200380:	eb cb                	jmp    20034d <printf+0xc1>
