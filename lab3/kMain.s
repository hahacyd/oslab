
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 dd 0d 00 00       	call   100de8 <initTimer>
  10000b:	e8 e0 0a 00 00       	call   100af0 <init_pcb>
  100010:	e8 17 0b 00 00       	call   100b2c <init_kernel_pcb>
  100015:	e8 d2 05 00 00       	call   1005ec <initSerial>
  10001a:	e8 61 0b 00 00       	call   100b80 <initIdt>
  10001f:	e8 6c 0d 00 00       	call   100d90 <initIntr>
  100024:	e8 b3 00 00 00       	call   1000dc <initSeg>
  100029:	fb                   	sti    
  10002a:	e8 b9 02 00 00       	call   1002e8 <loadUMain>
  10002f:	eb fe                	jmp    10002f <kEntry+0x2f>
  100031:	66 90                	xchg   %ax,%ax
  100033:	90                   	nop

00100034 <change_tss>:
  100034:	55                   	push   %ebp
  100035:	89 e5                	mov    %esp,%ebp
  100037:	8b 45 08             	mov    0x8(%ebp),%eax
  10003a:	a3 e8 d3 12 01       	mov    %eax,0x112d3e8
  10003f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100042:	a3 e4 d3 12 01       	mov    %eax,0x112d3e4
  100047:	b8 01 00 00 00       	mov    $0x1,%eax
  10004c:	5d                   	pop    %ebp
  10004d:	c3                   	ret    
  10004e:	66 90                	xchg   %ax,%ax

00100050 <waitDisk>:
  100050:	55                   	push   %ebp
  100051:	89 e5                	mov    %esp,%ebp
  100053:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100058:	ec                   	in     (%dx),%al
  100059:	83 e0 c0             	and    $0xffffffc0,%eax
  10005c:	3c 40                	cmp    $0x40,%al
  10005e:	75 f8                	jne    100058 <waitDisk+0x8>
  100060:	5d                   	pop    %ebp
  100061:	c3                   	ret    
  100062:	66 90                	xchg   %ax,%ax

00100064 <readSect>:
  100064:	55                   	push   %ebp
  100065:	89 e5                	mov    %esp,%ebp
  100067:	53                   	push   %ebx
  100068:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10006b:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100070:	ec                   	in     (%dx),%al
  100071:	83 e0 c0             	and    $0xffffffc0,%eax
  100074:	3c 40                	cmp    $0x40,%al
  100076:	75 f8                	jne    100070 <readSect+0xc>
  100078:	ba f2 01 00 00       	mov    $0x1f2,%edx
  10007d:	b0 01                	mov    $0x1,%al
  10007f:	ee                   	out    %al,(%dx)
  100080:	ba f3 01 00 00       	mov    $0x1f3,%edx
  100085:	88 c8                	mov    %cl,%al
  100087:	ee                   	out    %al,(%dx)
  100088:	89 c8                	mov    %ecx,%eax
  10008a:	c1 f8 08             	sar    $0x8,%eax
  10008d:	ba f4 01 00 00       	mov    $0x1f4,%edx
  100092:	ee                   	out    %al,(%dx)
  100093:	89 c8                	mov    %ecx,%eax
  100095:	c1 f8 10             	sar    $0x10,%eax
  100098:	ba f5 01 00 00       	mov    $0x1f5,%edx
  10009d:	ee                   	out    %al,(%dx)
  10009e:	89 c8                	mov    %ecx,%eax
  1000a0:	c1 f8 18             	sar    $0x18,%eax
  1000a3:	83 c8 e0             	or     $0xffffffe0,%eax
  1000a6:	ba f6 01 00 00       	mov    $0x1f6,%edx
  1000ab:	ee                   	out    %al,(%dx)
  1000ac:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1000b1:	b0 20                	mov    $0x20,%al
  1000b3:	ee                   	out    %al,(%dx)
  1000b4:	ec                   	in     (%dx),%al
  1000b5:	83 e0 c0             	and    $0xffffffc0,%eax
  1000b8:	3c 40                	cmp    $0x40,%al
  1000ba:	75 f8                	jne    1000b4 <readSect+0x50>
  1000bc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1000bf:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  1000c5:	ba f0 01 00 00       	mov    $0x1f0,%edx
  1000ca:	66 90                	xchg   %ax,%ax
  1000cc:	ed                   	in     (%dx),%eax
  1000cd:	89 01                	mov    %eax,(%ecx)
  1000cf:	83 c1 04             	add    $0x4,%ecx
  1000d2:	39 d9                	cmp    %ebx,%ecx
  1000d4:	75 f6                	jne    1000cc <readSect+0x68>
  1000d6:	5b                   	pop    %ebx
  1000d7:	5d                   	pop    %ebp
  1000d8:	c3                   	ret    
  1000d9:	8d 76 00             	lea    0x0(%esi),%esi

001000dc <initSeg>:
  1000dc:	55                   	push   %ebp
  1000dd:	89 e5                	mov    %esp,%ebp
  1000df:	b9 a0 d3 12 01       	mov    $0x112d3a0,%ecx
  1000e4:	66 c7 05 a8 d3 12 01 	movw   $0xffff,0x112d3a8
  1000eb:	ff ff 
  1000ed:	66 c7 05 aa d3 12 01 	movw   $0x0,0x112d3aa
  1000f4:	00 00 
  1000f6:	c6 05 ac d3 12 01 00 	movb   $0x0,0x112d3ac
  1000fd:	c6 05 ad d3 12 01 9a 	movb   $0x9a,0x112d3ad
  100104:	c6 05 ae d3 12 01 cf 	movb   $0xcf,0x112d3ae
  10010b:	c6 05 af d3 12 01 00 	movb   $0x0,0x112d3af
  100112:	66 c7 05 b0 d3 12 01 	movw   $0xffff,0x112d3b0
  100119:	ff ff 
  10011b:	66 c7 05 b2 d3 12 01 	movw   $0x0,0x112d3b2
  100122:	00 00 
  100124:	c6 05 b4 d3 12 01 00 	movb   $0x0,0x112d3b4
  10012b:	c6 05 b5 d3 12 01 92 	movb   $0x92,0x112d3b5
  100132:	c6 05 b6 d3 12 01 cf 	movb   $0xcf,0x112d3b6
  100139:	c6 05 b7 d3 12 01 00 	movb   $0x0,0x112d3b7
  100140:	66 c7 05 b8 d3 12 01 	movw   $0xffff,0x112d3b8
  100147:	ff ff 
  100149:	66 c7 05 ba d3 12 01 	movw   $0x0,0x112d3ba
  100150:	00 00 
  100152:	c6 05 bc d3 12 01 00 	movb   $0x0,0x112d3bc
  100159:	c6 05 bd d3 12 01 fa 	movb   $0xfa,0x112d3bd
  100160:	c6 05 be d3 12 01 cf 	movb   $0xcf,0x112d3be
  100167:	c6 05 bf d3 12 01 00 	movb   $0x0,0x112d3bf
  10016e:	66 c7 05 c0 d3 12 01 	movw   $0xffff,0x112d3c0
  100175:	ff ff 
  100177:	66 c7 05 c2 d3 12 01 	movw   $0x0,0x112d3c2
  10017e:	00 00 
  100180:	c6 05 c4 d3 12 01 00 	movb   $0x0,0x112d3c4
  100187:	c6 05 c5 d3 12 01 f2 	movb   $0xf2,0x112d3c5
  10018e:	c6 05 c6 d3 12 01 cf 	movb   $0xcf,0x112d3c6
  100195:	c6 05 c7 d3 12 01 00 	movb   $0x0,0x112d3c7
  10019c:	66 c7 05 c8 d3 12 01 	movw   $0x63,0x112d3c8
  1001a3:	63 00 
  1001a5:	b8 e0 d3 12 01       	mov    $0x112d3e0,%eax
  1001aa:	66 a3 ca d3 12 01    	mov    %ax,0x112d3ca
  1001b0:	89 c2                	mov    %eax,%edx
  1001b2:	c1 ea 10             	shr    $0x10,%edx
  1001b5:	88 15 cc d3 12 01    	mov    %dl,0x112d3cc
  1001bb:	c6 05 cd d3 12 01 89 	movb   $0x89,0x112d3cd
  1001c2:	c6 05 ce d3 12 01 40 	movb   $0x40,0x112d3ce
  1001c9:	c1 e8 18             	shr    $0x18,%eax
  1001cc:	a2 cf d3 12 01       	mov    %al,0x112d3cf
  1001d1:	a1 48 11 10 00       	mov    0x101148,%eax
  1001d6:	8b 15 4c 11 10 00    	mov    0x10114c,%edx
  1001dc:	a3 d0 d3 12 01       	mov    %eax,0x112d3d0
  1001e1:	89 15 d4 d3 12 01    	mov    %edx,0x112d3d4
  1001e7:	66 c7 05 00 2b 10 00 	movw   $0x37,0x102b00
  1001ee:	37 00 
  1001f0:	66 89 0d 02 2b 10 00 	mov    %cx,0x102b02
  1001f7:	c1 e9 10             	shr    $0x10,%ecx
  1001fa:	66 89 0d 04 2b 10 00 	mov    %cx,0x102b04
  100201:	b8 00 2b 10 00       	mov    $0x102b00,%eax
  100206:	0f 01 10             	lgdtl  (%eax)
  100209:	a1 d8 53 10 00       	mov    0x1053d8,%eax
  10020e:	a3 e8 d3 12 01       	mov    %eax,0x112d3e8
  100213:	c7 05 e4 d3 12 01 9f 	movl   $0x103b9f,0x112d3e4
  10021a:	3b 10 00 
  10021d:	b8 28 00 00 00       	mov    $0x28,%eax
  100222:	0f 00 d8             	ltr    %ax
  100225:	b8 10 00 00 00       	mov    $0x10,%eax
  10022a:	89 c0                	mov    %eax,%eax
  10022c:	8e d8                	mov    %eax,%ds
  10022e:	8e e0                	mov    %eax,%fs
  100230:	8e c0                	mov    %eax,%es
  100232:	8e d0                	mov    %eax,%ss
  100234:	b8 30 00 00 00       	mov    $0x30,%eax
  100239:	89 c0                	mov    %eax,%eax
  10023b:	8e e8                	mov    %eax,%gs
  10023d:	31 c0                	xor    %eax,%eax
  10023f:	0f 00 d0             	lldt   %ax
  100242:	5d                   	pop    %ebp
  100243:	c3                   	ret    

00100244 <enterUserSpace_pcb>:
  100244:	55                   	push   %ebp
  100245:	89 e5                	mov    %esp,%ebp
  100247:	8b 45 08             	mov    0x8(%ebp),%eax
  10024a:	89 c2                	mov    %eax,%edx
  10024c:	c1 e2 07             	shl    $0x7,%edx
  10024f:	01 c2                	add    %eax,%edx
  100251:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100254:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100257:	8d 04 85 a0 33 10 00 	lea    0x1033a0(,%eax,4),%eax
  10025e:	8b 90 38 20 00 00    	mov    0x2038(%eax),%edx
  100264:	52                   	push   %edx
  100265:	8b 90 34 20 00 00    	mov    0x2034(%eax),%edx
  10026b:	52                   	push   %edx
  10026c:	9c                   	pushf  
  10026d:	8b 90 2c 20 00 00    	mov    0x202c(%eax),%edx
  100273:	52                   	push   %edx
  100274:	8b 80 28 20 00 00    	mov    0x2028(%eax),%eax
  10027a:	50                   	push   %eax
  10027b:	cf                   	iret   
  10027c:	5d                   	pop    %ebp
  10027d:	c3                   	ret    
  10027e:	66 90                	xchg   %ax,%ax

00100280 <enterUserSpace>:
  100280:	55                   	push   %ebp
  100281:	89 e5                	mov    %esp,%ebp
  100283:	83 ec 14             	sub    $0x14,%esp
  100286:	c7 05 84 33 10 00 01 	movl   $0x1,0x103384
  10028d:	00 00 00 
  100290:	c7 05 2c 74 10 00 23 	movl   $0x23,0x10742c
  100297:	00 00 00 
  10029a:	c7 05 28 74 10 00 00 	movl   $0x8000000,0x107428
  1002a1:	00 00 08 
  1002a4:	c7 05 20 74 10 00 1b 	movl   $0x1b,0x107420
  1002ab:	00 00 00 
  1002ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1002b1:	a3 1c 74 10 00       	mov    %eax,0x10741c
  1002b6:	c7 05 34 74 10 00 0a 	movl   $0xa,0x107434
  1002bd:	00 00 00 
  1002c0:	6a 01                	push   $0x1
  1002c2:	e8 fd 04 00 00       	call   1007c4 <put_into_runnable>
  1002c7:	a1 d8 53 10 00       	mov    0x1053d8,%eax
  1002cc:	50                   	push   %eax
  1002cd:	a1 d4 53 10 00       	mov    0x1053d4,%eax
  1002d2:	50                   	push   %eax
  1002d3:	9c                   	pushf  
  1002d4:	a1 cc 53 10 00       	mov    0x1053cc,%eax
  1002d9:	50                   	push   %eax
  1002da:	a1 c8 53 10 00       	mov    0x1053c8,%eax
  1002df:	50                   	push   %eax
  1002e0:	cf                   	iret   
  1002e1:	83 c4 10             	add    $0x10,%esp
  1002e4:	c9                   	leave  
  1002e5:	c3                   	ret    
  1002e6:	66 90                	xchg   %ax,%ax

001002e8 <loadUMain>:
  1002e8:	55                   	push   %ebp
  1002e9:	89 e5                	mov    %esp,%ebp
  1002eb:	57                   	push   %edi
  1002ec:	56                   	push   %esi
  1002ed:	53                   	push   %ebx
  1002ee:	83 ec 0c             	sub    $0xc,%esp
  1002f1:	bb c9 00 00 00       	mov    $0xc9,%ebx
  1002f6:	be 00 00 00 03       	mov    $0x3000000,%esi
  1002fb:	90                   	nop
  1002fc:	53                   	push   %ebx
  1002fd:	56                   	push   %esi
  1002fe:	e8 61 fd ff ff       	call   100064 <readSect>
  100303:	81 c6 00 02 00 00    	add    $0x200,%esi
  100309:	43                   	inc    %ebx
  10030a:	58                   	pop    %eax
  10030b:	5a                   	pop    %edx
  10030c:	81 fb 91 01 00 00    	cmp    $0x191,%ebx
  100312:	75 e8                	jne    1002fc <loadUMain+0x14>
  100314:	a1 1c 00 00 03       	mov    0x300001c,%eax
  100319:	8d 90 00 00 00 03    	lea    0x3000000(%eax),%edx
  10031f:	0f b7 35 2c 00 00 03 	movzwl 0x300002c,%esi
  100326:	c1 e6 05             	shl    $0x5,%esi
  100329:	01 d6                	add    %edx,%esi
  10032b:	39 f2                	cmp    %esi,%edx
  10032d:	72 0c                	jb     10033b <loadUMain+0x53>
  10032f:	eb 53                	jmp    100384 <loadUMain+0x9c>
  100331:	8d 76 00             	lea    0x0(%esi),%esi
  100334:	83 c2 20             	add    $0x20,%edx
  100337:	39 d6                	cmp    %edx,%esi
  100339:	76 49                	jbe    100384 <loadUMain+0x9c>
  10033b:	83 3a 01             	cmpl   $0x1,(%edx)
  10033e:	75 f4                	jne    100334 <loadUMain+0x4c>
  100340:	8b 42 08             	mov    0x8(%edx),%eax
  100343:	8b 7a 10             	mov    0x10(%edx),%edi
  100346:	8b 5a 04             	mov    0x4(%edx),%ebx
  100349:	29 c3                	sub    %eax,%ebx
  10034b:	31 c9                	xor    %ecx,%ecx
  10034d:	85 ff                	test   %edi,%edi
  10034f:	74 16                	je     100367 <loadUMain+0x7f>
  100351:	8d 76 00             	lea    0x0(%esi),%esi
  100354:	8a 8c 03 00 00 00 03 	mov    0x3000000(%ebx,%eax,1),%cl
  10035b:	88 08                	mov    %cl,(%eax)
  10035d:	40                   	inc    %eax
  10035e:	89 c1                	mov    %eax,%ecx
  100360:	2b 4a 08             	sub    0x8(%edx),%ecx
  100363:	39 cf                	cmp    %ecx,%edi
  100365:	77 ed                	ja     100354 <loadUMain+0x6c>
  100367:	8b 5a 14             	mov    0x14(%edx),%ebx
  10036a:	39 cb                	cmp    %ecx,%ebx
  10036c:	76 c6                	jbe    100334 <loadUMain+0x4c>
  10036e:	66 90                	xchg   %ax,%ax
  100370:	c6 00 00             	movb   $0x0,(%eax)
  100373:	40                   	inc    %eax
  100374:	89 c1                	mov    %eax,%ecx
  100376:	2b 4a 08             	sub    0x8(%edx),%ecx
  100379:	39 cb                	cmp    %ecx,%ebx
  10037b:	77 f3                	ja     100370 <loadUMain+0x88>
  10037d:	83 c2 20             	add    $0x20,%edx
  100380:	39 d6                	cmp    %edx,%esi
  100382:	77 b7                	ja     10033b <loadUMain+0x53>
  100384:	83 ec 0c             	sub    $0xc,%esp
  100387:	ff 35 18 00 00 03    	pushl  0x3000018
  10038d:	e8 ee fe ff ff       	call   100280 <enterUserSpace>
  100392:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100395:	5b                   	pop    %ebx
  100396:	5e                   	pop    %esi
  100397:	5f                   	pop    %edi
  100398:	5d                   	pop    %ebp
  100399:	c3                   	ret    
  10039a:	66 90                	xchg   %ax,%ax

0010039c <sys_exit>:
  10039c:	55                   	push   %ebp
  10039d:	89 e5                	mov    %esp,%ebp
  10039f:	83 ec 08             	sub    $0x8,%esp
  1003a2:	e8 61 03 00 00       	call   100708 <get_from_runnable>
  1003a7:	83 ec 08             	sub    $0x8,%esp
  1003aa:	ff 75 08             	pushl  0x8(%ebp)
  1003ad:	50                   	push   %eax
  1003ae:	e8 05 03 00 00       	call   1006b8 <put_into_running>
  1003b3:	b8 01 00 00 00       	mov    $0x1,%eax
  1003b8:	c9                   	leave  
  1003b9:	c3                   	ret    
  1003ba:	66 90                	xchg   %ax,%ax

001003bc <sys_sleep>:
  1003bc:	55                   	push   %ebp
  1003bd:	89 e5                	mov    %esp,%ebp
  1003bf:	83 ec 08             	sub    $0x8,%esp
  1003c2:	e8 29 03 00 00       	call   1006f0 <getpid>
  1003c7:	89 c2                	mov    %eax,%edx
  1003c9:	c1 e2 07             	shl    $0x7,%edx
  1003cc:	01 c2                	add    %eax,%edx
  1003ce:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1003d1:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1003d4:	8b 55 08             	mov    0x8(%ebp),%edx
  1003d7:	8b 52 10             	mov    0x10(%edx),%edx
  1003da:	89 14 85 e4 53 10 00 	mov    %edx,0x1053e4(,%eax,4)
  1003e1:	b8 01 00 00 00       	mov    $0x1,%eax
  1003e6:	c9                   	leave  
  1003e7:	c3                   	ret    

001003e8 <sys_fork>:
  1003e8:	55                   	push   %ebp
  1003e9:	89 e5                	mov    %esp,%ebp
  1003eb:	57                   	push   %edi
  1003ec:	56                   	push   %esi
  1003ed:	8b 75 08             	mov    0x8(%ebp),%esi
  1003f0:	83 ec 0c             	sub    $0xc,%esp
  1003f3:	68 50 11 10 00       	push   $0x101150
  1003f8:	e8 13 0b 00 00       	call   100f10 <printk>
  1003fd:	b8 48 94 10 00       	mov    $0x109448,%eax
  100402:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100407:	89 c7                	mov    %eax,%edi
  100409:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10040b:	c7 05 64 94 10 00 00 	movl   $0x0,0x109464
  100412:	00 00 00 
  100415:	c7 05 7c 94 10 00 00 	movl   $0x7e00000,0x10947c
  10041c:	00 e0 07 
  10041f:	c7 04 24 6c 11 10 00 	movl   $0x10116c,(%esp)
  100426:	e8 e5 0a 00 00       	call   100f10 <printk>
  10042b:	58                   	pop    %eax
  10042c:	ff 35 70 94 10 00    	pushl  0x109470
  100432:	68 e0 11 10 00       	push   $0x1011e0
  100437:	6a 10                	push   $0x10
  100439:	68 72 11 10 00       	push   $0x101172
  10043e:	68 94 11 10 00       	push   $0x101194
  100443:	e8 c8 0a 00 00       	call   100f10 <printk>
  100448:	83 c4 14             	add    $0x14,%esp
  10044b:	68 8d 11 10 00       	push   $0x10118d
  100450:	e8 bb 0a 00 00       	call   100f10 <printk>
  100455:	c7 04 24 6c 11 10 00 	movl   $0x10116c,(%esp)
  10045c:	e8 af 0a 00 00       	call   100f10 <printk>
  100461:	5a                   	pop    %edx
  100462:	ff 35 74 94 10 00    	pushl  0x109474
  100468:	68 e0 11 10 00       	push   $0x1011e0
  10046d:	6a 11                	push   $0x11
  10046f:	68 72 11 10 00       	push   $0x101172
  100474:	68 bc 11 10 00       	push   $0x1011bc
  100479:	e8 92 0a 00 00       	call   100f10 <printk>
  10047e:	83 c4 14             	add    $0x14,%esp
  100481:	68 8d 11 10 00       	push   $0x10118d
  100486:	e8 85 0a 00 00       	call   100f10 <printk>
  10048b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  100492:	e8 2d 03 00 00       	call   1007c4 <put_into_runnable>
  100497:	b8 02 00 00 00       	mov    $0x2,%eax
  10049c:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10049f:	5e                   	pop    %esi
  1004a0:	5f                   	pop    %edi
  1004a1:	5d                   	pop    %ebp
  1004a2:	c3                   	ret    
  1004a3:	90                   	nop

001004a4 <display>:
  1004a4:	55                   	push   %ebp
  1004a5:	89 e5                	mov    %esp,%ebp
  1004a7:	57                   	push   %edi
  1004a8:	53                   	push   %ebx
  1004a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1004ac:	80 fb 0a             	cmp    $0xa,%bl
  1004af:	74 5b                	je     10050c <display+0x68>
  1004b1:	8b 15 08 2b 10 00    	mov    0x102b08,%edx
  1004b7:	8b 0d 0c 2b 10 00    	mov    0x102b0c,%ecx
  1004bd:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  1004c0:	c1 e0 04             	shl    $0x4,%eax
  1004c3:	01 d0                	add    %edx,%eax
  1004c5:	01 c0                	add    %eax,%eax
  1004c7:	89 c7                	mov    %eax,%edi
  1004c9:	0f be db             	movsbl %bl,%ebx
  1004cc:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
  1004d2:	66 89 d8             	mov    %bx,%ax
  1004d5:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1004d9:	42                   	inc    %edx
  1004da:	83 fa 50             	cmp    $0x50,%edx
  1004dd:	75 1d                	jne    1004fc <display+0x58>
  1004df:	c7 05 08 2b 10 00 00 	movl   $0x0,0x102b08
  1004e6:	00 00 00 
  1004e9:	41                   	inc    %ecx
  1004ea:	89 0d 0c 2b 10 00    	mov    %ecx,0x102b0c
  1004f0:	b8 01 00 00 00       	mov    $0x1,%eax
  1004f5:	5b                   	pop    %ebx
  1004f6:	5f                   	pop    %edi
  1004f7:	5d                   	pop    %ebp
  1004f8:	c3                   	ret    
  1004f9:	8d 76 00             	lea    0x0(%esi),%esi
  1004fc:	89 15 08 2b 10 00    	mov    %edx,0x102b08
  100502:	b8 01 00 00 00       	mov    $0x1,%eax
  100507:	5b                   	pop    %ebx
  100508:	5f                   	pop    %edi
  100509:	5d                   	pop    %ebp
  10050a:	c3                   	ret    
  10050b:	90                   	nop
  10050c:	c7 05 08 2b 10 00 00 	movl   $0x0,0x102b08
  100513:	00 00 00 
  100516:	ff 05 0c 2b 10 00    	incl   0x102b0c
  10051c:	b8 01 00 00 00       	mov    $0x1,%eax
  100521:	5b                   	pop    %ebx
  100522:	5f                   	pop    %edi
  100523:	5d                   	pop    %ebp
  100524:	c3                   	ret    
  100525:	8d 76 00             	lea    0x0(%esi),%esi

00100528 <printkernel>:
  100528:	55                   	push   %ebp
  100529:	89 e5                	mov    %esp,%ebp
  10052b:	53                   	push   %ebx
  10052c:	50                   	push   %eax
  10052d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100530:	0f be 03             	movsbl (%ebx),%eax
  100533:	84 c0                	test   %al,%al
  100535:	74 20                	je     100557 <printkernel+0x2f>
  100537:	90                   	nop
  100538:	83 ec 0c             	sub    $0xc,%esp
  10053b:	50                   	push   %eax
  10053c:	e8 eb 00 00 00       	call   10062c <putChar>
  100541:	0f be 03             	movsbl (%ebx),%eax
  100544:	89 04 24             	mov    %eax,(%esp)
  100547:	e8 58 ff ff ff       	call   1004a4 <display>
  10054c:	43                   	inc    %ebx
  10054d:	0f be 03             	movsbl (%ebx),%eax
  100550:	83 c4 10             	add    $0x10,%esp
  100553:	84 c0                	test   %al,%al
  100555:	75 e1                	jne    100538 <printkernel+0x10>
  100557:	b8 01 00 00 00       	mov    $0x1,%eax
  10055c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10055f:	c9                   	leave  
  100560:	c3                   	ret    
  100561:	8d 76 00             	lea    0x0(%esi),%esi

00100564 <fs_write>:
  100564:	55                   	push   %ebp
  100565:	89 e5                	mov    %esp,%ebp
  100567:	53                   	push   %ebx
  100568:	50                   	push   %eax
  100569:	8b 5d 10             	mov    0x10(%ebp),%ebx
  10056c:	ba 30 00 00 00       	mov    $0x30,%edx
  100571:	89 d0                	mov    %edx,%eax
  100573:	8e e8                	mov    %eax,%gs
  100575:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  100579:	74 12                	je     10058d <fs_write+0x29>
  10057b:	83 ec 08             	sub    $0x8,%esp
  10057e:	6a 27                	push   $0x27
  100580:	68 e9 11 10 00       	push   $0x1011e9
  100585:	e8 fa 0a 00 00       	call   101084 <abort>
  10058a:	83 c4 10             	add    $0x10,%esp
  10058d:	83 ec 08             	sub    $0x8,%esp
  100590:	53                   	push   %ebx
  100591:	ff 75 0c             	pushl  0xc(%ebp)
  100594:	e8 8f ff ff ff       	call   100528 <printkernel>
  100599:	89 d8                	mov    %ebx,%eax
  10059b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10059e:	c9                   	leave  
  10059f:	c3                   	ret    

001005a0 <sys_write>:
  1005a0:	55                   	push   %ebp
  1005a1:	89 e5                	mov    %esp,%ebp
  1005a3:	53                   	push   %ebx
  1005a4:	83 ec 08             	sub    $0x8,%esp
  1005a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1005aa:	ff 73 14             	pushl  0x14(%ebx)
  1005ad:	ff 73 18             	pushl  0x18(%ebx)
  1005b0:	ff 73 10             	pushl  0x10(%ebx)
  1005b3:	e8 ac ff ff ff       	call   100564 <fs_write>
  1005b8:	89 43 1c             	mov    %eax,0x1c(%ebx)
  1005bb:	83 c4 10             	add    $0x10,%esp
  1005be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005c1:	c9                   	leave  
  1005c2:	c3                   	ret    
  1005c3:	90                   	nop

001005c4 <print_char>:
  1005c4:	55                   	push   %ebp
  1005c5:	89 e5                	mov    %esp,%ebp
  1005c7:	57                   	push   %edi
  1005c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1005cb:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1005ce:	c1 e0 04             	shl    $0x4,%eax
  1005d1:	03 45 0c             	add    0xc(%ebp),%eax
  1005d4:	01 c0                	add    %eax,%eax
  1005d6:	89 c7                	mov    %eax,%edi
  1005d8:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  1005dc:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  1005e2:	66 89 d0             	mov    %dx,%ax
  1005e5:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1005e9:	5f                   	pop    %edi
  1005ea:	5d                   	pop    %ebp
  1005eb:	c3                   	ret    

001005ec <initSerial>:
  1005ec:	55                   	push   %ebp
  1005ed:	89 e5                	mov    %esp,%ebp
  1005ef:	ba f9 03 00 00       	mov    $0x3f9,%edx
  1005f4:	31 c0                	xor    %eax,%eax
  1005f6:	ee                   	out    %al,(%dx)
  1005f7:	ba fb 03 00 00       	mov    $0x3fb,%edx
  1005fc:	b0 80                	mov    $0x80,%al
  1005fe:	ee                   	out    %al,(%dx)
  1005ff:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100604:	b0 01                	mov    $0x1,%al
  100606:	ee                   	out    %al,(%dx)
  100607:	ba f9 03 00 00       	mov    $0x3f9,%edx
  10060c:	31 c0                	xor    %eax,%eax
  10060e:	ee                   	out    %al,(%dx)
  10060f:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100614:	b0 03                	mov    $0x3,%al
  100616:	ee                   	out    %al,(%dx)
  100617:	ba fa 03 00 00       	mov    $0x3fa,%edx
  10061c:	b0 c7                	mov    $0xc7,%al
  10061e:	ee                   	out    %al,(%dx)
  10061f:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100624:	b0 0b                	mov    $0xb,%al
  100626:	ee                   	out    %al,(%dx)
  100627:	5d                   	pop    %ebp
  100628:	c3                   	ret    
  100629:	8d 76 00             	lea    0x0(%esi),%esi

0010062c <putChar>:
  10062c:	55                   	push   %ebp
  10062d:	89 e5                	mov    %esp,%ebp
  10062f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100632:	ba fd 03 00 00       	mov    $0x3fd,%edx
  100637:	90                   	nop
  100638:	ec                   	in     (%dx),%al
  100639:	a8 20                	test   $0x20,%al
  10063b:	74 fb                	je     100638 <putChar+0xc>
  10063d:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100642:	88 c8                	mov    %cl,%al
  100644:	ee                   	out    %al,(%dx)
  100645:	5d                   	pop    %ebp
  100646:	c3                   	ret    
  100647:	90                   	nop

00100648 <IDLE>:
  100648:	55                   	push   %ebp
  100649:	89 e5                	mov    %esp,%ebp
  10064b:	90                   	nop
  10064c:	f4                   	hlt    
  10064d:	eb fd                	jmp    10064c <IDLE+0x4>
  10064f:	90                   	nop

00100650 <put_into_running.part.0>:
  100650:	55                   	push   %ebp
  100651:	89 e5                	mov    %esp,%ebp
  100653:	57                   	push   %edi
  100654:	56                   	push   %esi
  100655:	53                   	push   %ebx
  100656:	83 ec 18             	sub    $0x18,%esp
  100659:	89 c3                	mov    %eax,%ebx
  10065b:	a3 80 33 10 00       	mov    %eax,0x103380
  100660:	c1 e0 07             	shl    $0x7,%eax
  100663:	01 d8                	add    %ebx,%eax
  100665:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100668:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10066b:	8d 34 85 a0 53 10 00 	lea    0x1053a0(,%eax,4),%esi
  100672:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100677:	89 d7                	mov    %edx,%edi
  100679:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10067b:	68 6c 11 10 00       	push   $0x10116c
  100680:	e8 8b 08 00 00       	call   100f10 <printk>
  100685:	89 1c 24             	mov    %ebx,(%esp)
  100688:	68 08 13 10 00       	push   $0x101308
  10068d:	6a 12                	push   $0x12
  10068f:	68 05 12 10 00       	push   $0x101205
  100694:	68 13 12 10 00       	push   $0x101213
  100699:	e8 72 08 00 00       	call   100f10 <printk>
  10069e:	83 c4 14             	add    $0x14,%esp
  1006a1:	68 8d 11 10 00       	push   $0x10118d
  1006a6:	e8 65 08 00 00       	call   100f10 <printk>
  1006ab:	83 c4 10             	add    $0x10,%esp
  1006ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1006b1:	5b                   	pop    %ebx
  1006b2:	5e                   	pop    %esi
  1006b3:	5f                   	pop    %edi
  1006b4:	5d                   	pop    %ebp
  1006b5:	c3                   	ret    
  1006b6:	66 90                	xchg   %ax,%ax

001006b8 <put_into_running>:
  1006b8:	55                   	push   %ebp
  1006b9:	89 e5                	mov    %esp,%ebp
  1006bb:	83 ec 08             	sub    $0x8,%esp
  1006be:	8b 45 08             	mov    0x8(%ebp),%eax
  1006c1:	39 05 80 33 10 00    	cmp    %eax,0x103380
  1006c7:	74 08                	je     1006d1 <put_into_running+0x19>
  1006c9:	8b 55 0c             	mov    0xc(%ebp),%edx
  1006cc:	e8 7f ff ff ff       	call   100650 <put_into_running.part.0>
  1006d1:	b8 01 00 00 00       	mov    $0x1,%eax
  1006d6:	c9                   	leave  
  1006d7:	c3                   	ret    

001006d8 <update_block>:
  1006d8:	55                   	push   %ebp
  1006d9:	89 e5                	mov    %esp,%ebp
  1006db:	b8 01 00 00 00       	mov    $0x1,%eax
  1006e0:	5d                   	pop    %ebp
  1006e1:	c3                   	ret    
  1006e2:	66 90                	xchg   %ax,%ax

001006e4 <apply_new_pid>:
  1006e4:	55                   	push   %ebp
  1006e5:	89 e5                	mov    %esp,%ebp
  1006e7:	b8 02 00 00 00       	mov    $0x2,%eax
  1006ec:	5d                   	pop    %ebp
  1006ed:	c3                   	ret    
  1006ee:	66 90                	xchg   %ax,%ax

001006f0 <getpid>:
  1006f0:	55                   	push   %ebp
  1006f1:	89 e5                	mov    %esp,%ebp
  1006f3:	a1 80 33 10 00       	mov    0x103380,%eax
  1006f8:	5d                   	pop    %ebp
  1006f9:	c3                   	ret    
  1006fa:	66 90                	xchg   %ax,%ax

001006fc <transfer_pid_mode>:
  1006fc:	55                   	push   %ebp
  1006fd:	89 e5                	mov    %esp,%ebp
  1006ff:	b8 01 00 00 00       	mov    $0x1,%eax
  100704:	5d                   	pop    %ebp
  100705:	c3                   	ret    
  100706:	66 90                	xchg   %ax,%ax

00100708 <get_from_runnable>:
  100708:	55                   	push   %ebp
  100709:	89 e5                	mov    %esp,%ebp
  10070b:	53                   	push   %ebx
  10070c:	51                   	push   %ecx
  10070d:	8b 1d e4 29 10 00    	mov    0x1029e4,%ebx
  100713:	83 fb ff             	cmp    $0xffffffff,%ebx
  100716:	0f 84 a0 00 00 00    	je     1007bc <get_from_runnable+0xb4>
  10071c:	89 d8                	mov    %ebx,%eax
  10071e:	c1 e0 07             	shl    $0x7,%eax
  100721:	01 d8                	add    %ebx,%eax
  100723:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100726:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100729:	8d 14 85 a0 33 10 00 	lea    0x1033a0(,%eax,4),%edx
  100730:	8b 82 50 20 00 00    	mov    0x2050(%edx),%eax
  100736:	39 c3                	cmp    %eax,%ebx
  100738:	74 76                	je     1007b0 <get_from_runnable+0xa8>
  10073a:	8b 92 4c 20 00 00    	mov    0x204c(%edx),%edx
  100740:	89 d1                	mov    %edx,%ecx
  100742:	c1 e1 07             	shl    $0x7,%ecx
  100745:	01 d1                	add    %edx,%ecx
  100747:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  10074a:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  10074d:	89 04 8d f0 53 10 00 	mov    %eax,0x1053f0(,%ecx,4)
  100754:	89 c1                	mov    %eax,%ecx
  100756:	c1 e1 07             	shl    $0x7,%ecx
  100759:	01 c1                	add    %eax,%ecx
  10075b:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  10075e:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  100761:	89 14 8d ec 53 10 00 	mov    %edx,0x1053ec(,%ecx,4)
  100768:	a3 e4 29 10 00       	mov    %eax,0x1029e4
  10076d:	83 ec 0c             	sub    $0xc,%esp
  100770:	68 6c 11 10 00       	push   $0x10116c
  100775:	e8 96 07 00 00       	call   100f10 <printk>
  10077a:	58                   	pop    %eax
  10077b:	5a                   	pop    %edx
  10077c:	ff 35 e4 29 10 00    	pushl  0x1029e4
  100782:	53                   	push   %ebx
  100783:	68 e4 12 10 00       	push   $0x1012e4
  100788:	6a 6b                	push   $0x6b
  10078a:	68 05 12 10 00       	push   $0x101205
  10078f:	68 4c 12 10 00       	push   $0x10124c
  100794:	e8 77 07 00 00       	call   100f10 <printk>
  100799:	83 c4 14             	add    $0x14,%esp
  10079c:	68 8d 11 10 00       	push   $0x10118d
  1007a1:	e8 6a 07 00 00       	call   100f10 <printk>
  1007a6:	83 c4 10             	add    $0x10,%esp
  1007a9:	89 d8                	mov    %ebx,%eax
  1007ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1007ae:	c9                   	leave  
  1007af:	c3                   	ret    
  1007b0:	c7 05 e4 29 10 00 ff 	movl   $0xffffffff,0x1029e4
  1007b7:	ff ff ff 
  1007ba:	eb b1                	jmp    10076d <get_from_runnable+0x65>
  1007bc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007c1:	eb e8                	jmp    1007ab <get_from_runnable+0xa3>
  1007c3:	90                   	nop

001007c4 <put_into_runnable>:
  1007c4:	55                   	push   %ebp
  1007c5:	89 e5                	mov    %esp,%ebp
  1007c7:	56                   	push   %esi
  1007c8:	53                   	push   %ebx
  1007c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1007cc:	a1 e4 29 10 00       	mov    0x1029e4,%eax
  1007d1:	83 f8 ff             	cmp    $0xffffffff,%eax
  1007d4:	0f 84 da 00 00 00    	je     1008b4 <put_into_runnable+0xf0>
  1007da:	89 c2                	mov    %eax,%edx
  1007dc:	c1 e2 07             	shl    $0x7,%edx
  1007df:	01 c2                	add    %eax,%edx
  1007e1:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1007e4:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1007e7:	8d 34 95 a0 33 10 00 	lea    0x1033a0(,%edx,4),%esi
  1007ee:	8b 96 4c 20 00 00    	mov    0x204c(%esi),%edx
  1007f4:	89 d1                	mov    %edx,%ecx
  1007f6:	c1 e1 07             	shl    $0x7,%ecx
  1007f9:	01 d1                	add    %edx,%ecx
  1007fb:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  1007fe:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100801:	89 1c 8d f0 53 10 00 	mov    %ebx,0x1053f0(,%ecx,4)
  100808:	89 d9                	mov    %ebx,%ecx
  10080a:	c1 e1 07             	shl    $0x7,%ecx
  10080d:	01 d9                	add    %ebx,%ecx
  10080f:	8d 0c 8b             	lea    (%ebx,%ecx,4),%ecx
  100812:	8d 0c 8b             	lea    (%ebx,%ecx,4),%ecx
  100815:	8d 0c 8d a0 33 10 00 	lea    0x1033a0(,%ecx,4),%ecx
  10081c:	89 91 4c 20 00 00    	mov    %edx,0x204c(%ecx)
  100822:	89 81 50 20 00 00    	mov    %eax,0x2050(%ecx)
  100828:	89 9e 4c 20 00 00    	mov    %ebx,0x204c(%esi)
  10082e:	89 d8                	mov    %ebx,%eax
  100830:	c1 e0 07             	shl    $0x7,%eax
  100833:	01 d8                	add    %ebx,%eax
  100835:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100838:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10083b:	c7 04 85 dc 53 10 00 	movl   $0x1,0x1053dc(,%eax,4)
  100842:	01 00 00 00 
  100846:	85 db                	test   %ebx,%ebx
  100848:	75 0a                	jne    100854 <put_into_runnable+0x90>
  10084a:	c7 05 c8 53 10 00 48 	movl   $0x100648,0x1053c8
  100851:	06 10 00 
  100854:	83 ec 0c             	sub    $0xc,%esp
  100857:	68 6c 11 10 00       	push   $0x10116c
  10085c:	e8 af 06 00 00       	call   100f10 <printk>
  100861:	58                   	pop    %eax
  100862:	5a                   	pop    %edx
  100863:	53                   	push   %ebx
  100864:	ff 35 e4 29 10 00    	pushl  0x1029e4
  10086a:	68 d0 12 10 00       	push   $0x1012d0
  10086f:	68 88 00 00 00       	push   $0x88
  100874:	68 05 12 10 00       	push   $0x101205
  100879:	68 80 12 10 00       	push   $0x101280
  10087e:	e8 8d 06 00 00       	call   100f10 <printk>
  100883:	83 c4 14             	add    $0x14,%esp
  100886:	68 8d 11 10 00       	push   $0x10118d
  10088b:	e8 80 06 00 00       	call   100f10 <printk>
  100890:	89 d8                	mov    %ebx,%eax
  100892:	c1 e0 07             	shl    $0x7,%eax
  100895:	01 d8                	add    %ebx,%eax
  100897:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10089a:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10089d:	c7 04 85 e0 53 10 00 	movl   $0xa,0x1053e0(,%eax,4)
  1008a4:	0a 00 00 00 
  1008a8:	b8 01 00 00 00       	mov    $0x1,%eax
  1008ad:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1008b0:	5b                   	pop    %ebx
  1008b1:	5e                   	pop    %esi
  1008b2:	5d                   	pop    %ebp
  1008b3:	c3                   	ret    
  1008b4:	89 1d e4 29 10 00    	mov    %ebx,0x1029e4
  1008ba:	89 d8                	mov    %ebx,%eax
  1008bc:	c1 e0 07             	shl    $0x7,%eax
  1008bf:	01 d8                	add    %ebx,%eax
  1008c1:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1008c4:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1008c7:	8d 04 85 a0 33 10 00 	lea    0x1033a0(,%eax,4),%eax
  1008ce:	89 98 4c 20 00 00    	mov    %ebx,0x204c(%eax)
  1008d4:	89 98 50 20 00 00    	mov    %ebx,0x2050(%eax)
  1008da:	e9 4f ff ff ff       	jmp    10082e <put_into_runnable+0x6a>
  1008df:	90                   	nop

001008e0 <checkTimeCount>:
  1008e0:	8b 0d 84 33 10 00    	mov    0x103384,%ecx
  1008e6:	85 c9                	test   %ecx,%ecx
  1008e8:	0f 84 0e 01 00 00    	je     1009fc <checkTimeCount+0x11c>
  1008ee:	55                   	push   %ebp
  1008ef:	89 e5                	mov    %esp,%ebp
  1008f1:	57                   	push   %edi
  1008f2:	56                   	push   %esi
  1008f3:	83 ec 0c             	sub    $0xc,%esp
  1008f6:	68 6c 11 10 00       	push   $0x10116c
  1008fb:	e8 10 06 00 00       	call   100f10 <printk>
  100900:	58                   	pop    %eax
  100901:	ff 35 80 33 10 00    	pushl  0x103380
  100907:	68 f8 12 10 00       	push   $0x1012f8
  10090c:	6a 22                	push   $0x22
  10090e:	68 05 12 10 00       	push   $0x101205
  100913:	68 31 12 10 00       	push   $0x101231
  100918:	e8 f3 05 00 00       	call   100f10 <printk>
  10091d:	83 c4 14             	add    $0x14,%esp
  100920:	68 8d 11 10 00       	push   $0x10118d
  100925:	e8 e6 05 00 00       	call   100f10 <printk>
  10092a:	c7 04 24 6c 11 10 00 	movl   $0x10116c,(%esp)
  100931:	e8 da 05 00 00       	call   100f10 <printk>
  100936:	5a                   	pop    %edx
  100937:	a1 80 33 10 00       	mov    0x103380,%eax
  10093c:	89 c2                	mov    %eax,%edx
  10093e:	c1 e2 07             	shl    $0x7,%edx
  100941:	01 c2                	add    %eax,%edx
  100943:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100946:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100949:	ff 34 85 e0 53 10 00 	pushl  0x1053e0(,%eax,4)
  100950:	68 f8 12 10 00       	push   $0x1012f8
  100955:	6a 23                	push   $0x23
  100957:	68 05 12 10 00       	push   $0x101205
  10095c:	68 b0 12 10 00       	push   $0x1012b0
  100961:	e8 aa 05 00 00       	call   100f10 <printk>
  100966:	83 c4 14             	add    $0x14,%esp
  100969:	68 8d 11 10 00       	push   $0x10118d
  10096e:	e8 9d 05 00 00       	call   100f10 <printk>
  100973:	8b 15 80 33 10 00    	mov    0x103380,%edx
  100979:	89 d0                	mov    %edx,%eax
  10097b:	c1 e0 07             	shl    $0x7,%eax
  10097e:	01 d0                	add    %edx,%eax
  100980:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100983:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100986:	c1 e0 02             	shl    $0x2,%eax
  100989:	8b 88 e0 53 10 00    	mov    0x1053e0(%eax),%ecx
  10098f:	83 c4 10             	add    $0x10,%esp
  100992:	85 c9                	test   %ecx,%ecx
  100994:	7e 22                	jle    1009b8 <checkTimeCount+0xd8>
  100996:	89 d0                	mov    %edx,%eax
  100998:	c1 e0 07             	shl    $0x7,%eax
  10099b:	01 d0                	add    %edx,%eax
  10099d:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1009a0:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1009a3:	49                   	dec    %ecx
  1009a4:	89 0c 85 e0 53 10 00 	mov    %ecx,0x1053e0(,%eax,4)
  1009ab:	b8 01 00 00 00       	mov    $0x1,%eax
  1009b0:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1009b3:	5e                   	pop    %esi
  1009b4:	5f                   	pop    %edi
  1009b5:	5d                   	pop    %ebp
  1009b6:	c3                   	ret    
  1009b7:	90                   	nop
  1009b8:	05 a0 53 10 00       	add    $0x1053a0,%eax
  1009bd:	b9 0f 00 00 00       	mov    $0xf,%ecx
  1009c2:	89 c7                	mov    %eax,%edi
  1009c4:	8b 75 08             	mov    0x8(%ebp),%esi
  1009c7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1009c9:	83 ec 0c             	sub    $0xc,%esp
  1009cc:	52                   	push   %edx
  1009cd:	e8 f2 fd ff ff       	call   1007c4 <put_into_runnable>
  1009d2:	e8 31 fd ff ff       	call   100708 <get_from_runnable>
  1009d7:	83 c4 10             	add    $0x10,%esp
  1009da:	3b 05 80 33 10 00    	cmp    0x103380,%eax
  1009e0:	75 22                	jne    100a04 <checkTimeCount+0x124>
  1009e2:	89 c2                	mov    %eax,%edx
  1009e4:	c1 e2 07             	shl    $0x7,%edx
  1009e7:	01 c2                	add    %eax,%edx
  1009e9:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1009ec:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1009ef:	8b 0c 95 e0 53 10 00 	mov    0x1053e0(,%edx,4),%ecx
  1009f6:	89 c2                	mov    %eax,%edx
  1009f8:	eb 9c                	jmp    100996 <checkTimeCount+0xb6>
  1009fa:	66 90                	xchg   %ax,%ax
  1009fc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100a01:	c3                   	ret    
  100a02:	66 90                	xchg   %ax,%ax
  100a04:	8b 55 08             	mov    0x8(%ebp),%edx
  100a07:	e8 44 fc ff ff       	call   100650 <put_into_running.part.0>
  100a0c:	8b 15 80 33 10 00    	mov    0x103380,%edx
  100a12:	89 d0                	mov    %edx,%eax
  100a14:	c1 e0 07             	shl    $0x7,%eax
  100a17:	01 d0                	add    %edx,%eax
  100a19:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100a1c:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100a1f:	8b 0c 85 e0 53 10 00 	mov    0x1053e0(,%eax,4),%ecx
  100a26:	e9 6b ff ff ff       	jmp    100996 <checkTimeCount+0xb6>
  100a2b:	90                   	nop

00100a2c <put_into_block>:
  100a2c:	55                   	push   %ebp
  100a2d:	89 e5                	mov    %esp,%ebp
  100a2f:	56                   	push   %esi
  100a30:	53                   	push   %ebx
  100a31:	8b 45 08             	mov    0x8(%ebp),%eax
  100a34:	8b 15 e0 29 10 00    	mov    0x1029e0,%edx
  100a3a:	83 fa ff             	cmp    $0xffffffff,%edx
  100a3d:	0f 84 85 00 00 00    	je     100ac8 <put_into_block+0x9c>
  100a43:	89 d1                	mov    %edx,%ecx
  100a45:	c1 e1 07             	shl    $0x7,%ecx
  100a48:	01 d1                	add    %edx,%ecx
  100a4a:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100a4d:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100a50:	8d 34 8d a0 33 10 00 	lea    0x1033a0(,%ecx,4),%esi
  100a57:	8b 8e 4c 20 00 00    	mov    0x204c(%esi),%ecx
  100a5d:	89 cb                	mov    %ecx,%ebx
  100a5f:	c1 e3 07             	shl    $0x7,%ebx
  100a62:	01 cb                	add    %ecx,%ebx
  100a64:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx
  100a67:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx
  100a6a:	89 04 9d f0 53 10 00 	mov    %eax,0x1053f0(,%ebx,4)
  100a71:	89 c3                	mov    %eax,%ebx
  100a73:	c1 e3 07             	shl    $0x7,%ebx
  100a76:	01 c3                	add    %eax,%ebx
  100a78:	8d 1c 98             	lea    (%eax,%ebx,4),%ebx
  100a7b:	8d 1c 98             	lea    (%eax,%ebx,4),%ebx
  100a7e:	8d 1c 9d a0 33 10 00 	lea    0x1033a0(,%ebx,4),%ebx
  100a85:	89 8b 4c 20 00 00    	mov    %ecx,0x204c(%ebx)
  100a8b:	89 93 50 20 00 00    	mov    %edx,0x2050(%ebx)
  100a91:	89 86 4c 20 00 00    	mov    %eax,0x204c(%esi)
  100a97:	89 c2                	mov    %eax,%edx
  100a99:	c1 e2 07             	shl    $0x7,%edx
  100a9c:	01 c2                	add    %eax,%edx
  100a9e:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100aa1:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100aa4:	8d 04 85 a0 33 10 00 	lea    0x1033a0(,%eax,4),%eax
  100aab:	8b 55 0c             	mov    0xc(%ebp),%edx
  100aae:	89 90 44 20 00 00    	mov    %edx,0x2044(%eax)
  100ab4:	c7 80 3c 20 00 00 00 	movl   $0x0,0x203c(%eax)
  100abb:	00 00 00 
  100abe:	b8 01 00 00 00       	mov    $0x1,%eax
  100ac3:	5b                   	pop    %ebx
  100ac4:	5e                   	pop    %esi
  100ac5:	5d                   	pop    %ebp
  100ac6:	c3                   	ret    
  100ac7:	90                   	nop
  100ac8:	a3 e0 29 10 00       	mov    %eax,0x1029e0
  100acd:	89 c2                	mov    %eax,%edx
  100acf:	c1 e2 07             	shl    $0x7,%edx
  100ad2:	01 c2                	add    %eax,%edx
  100ad4:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100ad7:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100ada:	8d 14 95 a0 33 10 00 	lea    0x1033a0(,%edx,4),%edx
  100ae1:	89 82 50 20 00 00    	mov    %eax,0x2050(%edx)
  100ae7:	89 82 4c 20 00 00    	mov    %eax,0x204c(%edx)
  100aed:	eb a8                	jmp    100a97 <put_into_block+0x6b>
  100aef:	90                   	nop

00100af0 <init_pcb>:
  100af0:	55                   	push   %ebp
  100af1:	89 e5                	mov    %esp,%ebp
  100af3:	ba e8 53 10 00       	mov    $0x1053e8,%edx
  100af8:	31 c0                	xor    %eax,%eax
  100afa:	66 90                	xchg   %ax,%ax
  100afc:	89 02                	mov    %eax,(%edx)
  100afe:	8d 48 ff             	lea    -0x1(%eax),%ecx
  100b01:	89 4a 04             	mov    %ecx,0x4(%edx)
  100b04:	40                   	inc    %eax
  100b05:	89 42 08             	mov    %eax,0x8(%edx)
  100b08:	81 c2 54 20 00 00    	add    $0x2054,%edx
  100b0e:	3d 00 08 00 00       	cmp    $0x800,%eax
  100b13:	75 e7                	jne    100afc <init_pcb+0xc>
  100b15:	c7 05 ec 53 10 00 ff 	movl   $0x7ff,0x1053ec
  100b1c:	07 00 00 
  100b1f:	c7 05 9c d3 12 01 00 	movl   $0x0,0x112d39c
  100b26:	00 00 00 
  100b29:	5d                   	pop    %ebp
  100b2a:	c3                   	ret    
  100b2b:	90                   	nop

00100b2c <init_kernel_pcb>:
  100b2c:	55                   	push   %ebp
  100b2d:	89 e5                	mov    %esp,%ebp
  100b2f:	c7 05 d8 53 10 00 10 	movl   $0x10,0x1053d8
  100b36:	00 00 00 
  100b39:	c7 05 cc 53 10 00 08 	movl   $0x8,0x1053cc
  100b40:	00 00 00 
  100b43:	c7 05 c8 53 10 00 48 	movl   $0x100648,0x1053c8
  100b4a:	06 10 00 
  100b4d:	c7 05 d4 53 10 00 00 	movl   $0x7f00000,0x1053d4
  100b54:	00 f0 07 
  100b57:	c7 05 dc 53 10 00 01 	movl   $0x1,0x1053dc
  100b5e:	00 00 00 
  100b61:	c7 05 e0 53 10 00 04 	movl   $0x4,0x1053e0
  100b68:	00 00 00 
  100b6b:	b8 01 00 00 00       	mov    $0x1,%eax
  100b70:	5d                   	pop    %ebp
  100b71:	c3                   	ret    
  100b72:	66 90                	xchg   %ax,%ax

00100b74 <transfer_pid_state>:
  100b74:	55                   	push   %ebp
  100b75:	89 e5                	mov    %esp,%ebp
  100b77:	b8 01 00 00 00       	mov    $0x1,%eax
  100b7c:	5d                   	pop    %ebp
  100b7d:	c3                   	ret    
  100b7e:	66 90                	xchg   %ax,%ax

00100b80 <initIdt>:
  100b80:	55                   	push   %ebp
  100b81:	89 e5                	mov    %esp,%ebp
  100b83:	53                   	push   %ebx
  100b84:	ba 1b 11 10 00       	mov    $0x10111b,%edx
  100b89:	89 d3                	mov    %edx,%ebx
  100b8b:	c1 ea 10             	shr    $0x10,%edx
  100b8e:	b9 60 dc 12 01       	mov    $0x112dc60,%ecx
  100b93:	b8 60 d4 12 01       	mov    $0x112d460,%eax
  100b98:	66 89 18             	mov    %bx,(%eax)
  100b9b:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100ba1:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100ba5:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100ba9:	66 89 50 06          	mov    %dx,0x6(%eax)
  100bad:	83 c0 08             	add    $0x8,%eax
  100bb0:	39 c1                	cmp    %eax,%ecx
  100bb2:	75 e4                	jne    100b98 <initIdt+0x18>
  100bb4:	b8 21 11 10 00       	mov    $0x101121,%eax
  100bb9:	66 a3 c8 d4 12 01    	mov    %ax,0x112d4c8
  100bbf:	66 c7 05 ca d4 12 01 	movw   $0x8,0x112d4ca
  100bc6:	08 00 
  100bc8:	c6 05 cc d4 12 01 00 	movb   $0x0,0x112d4cc
  100bcf:	c6 05 cd d4 12 01 8f 	movb   $0x8f,0x112d4cd
  100bd6:	c1 e8 10             	shr    $0x10,%eax
  100bd9:	66 a3 ce d4 12 01    	mov    %ax,0x112d4ce
  100bdf:	b8 25 11 10 00       	mov    $0x101125,%eax
  100be4:	66 a3 60 d8 12 01    	mov    %ax,0x112d860
  100bea:	66 c7 05 62 d8 12 01 	movw   $0x8,0x112d862
  100bf1:	08 00 
  100bf3:	c6 05 64 d8 12 01 00 	movb   $0x0,0x112d864
  100bfa:	c6 05 65 d8 12 01 ee 	movb   $0xee,0x112d865
  100c01:	c1 e8 10             	shr    $0x10,%eax
  100c04:	66 a3 66 d8 12 01    	mov    %ax,0x112d866
  100c0a:	b8 2e 11 10 00       	mov    $0x10112e,%eax
  100c0f:	66 a3 60 d5 12 01    	mov    %ax,0x112d560
  100c15:	66 c7 05 62 d5 12 01 	movw   $0x8,0x112d562
  100c1c:	08 00 
  100c1e:	c6 05 64 d5 12 01 00 	movb   $0x0,0x112d564
  100c25:	c6 05 65 d5 12 01 8e 	movb   $0x8e,0x112d565
  100c2c:	c1 e8 10             	shr    $0x10,%eax
  100c2f:	66 a3 66 d5 12 01    	mov    %ax,0x112d566
  100c35:	66 c7 05 10 2b 10 00 	movw   $0x7ff,0x102b10
  100c3c:	ff 07 
  100c3e:	b8 60 d4 12 01       	mov    $0x112d460,%eax
  100c43:	66 a3 12 2b 10 00    	mov    %ax,0x102b12
  100c49:	c1 e8 10             	shr    $0x10,%eax
  100c4c:	66 a3 14 2b 10 00    	mov    %ax,0x102b14
  100c52:	b8 10 2b 10 00       	mov    $0x102b10,%eax
  100c57:	0f 01 18             	lidtl  (%eax)
  100c5a:	5b                   	pop    %ebx
  100c5b:	5d                   	pop    %ebp
  100c5c:	c3                   	ret    
  100c5d:	66 90                	xchg   %ax,%ax
  100c5f:	90                   	nop

00100c60 <syscallHandle>:
  100c60:	55                   	push   %ebp
  100c61:	89 e5                	mov    %esp,%ebp
  100c63:	53                   	push   %ebx
  100c64:	50                   	push   %eax
  100c65:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100c68:	8b 43 1c             	mov    0x1c(%ebx),%eax
  100c6b:	83 f8 02             	cmp    $0x2,%eax
  100c6e:	74 28                	je     100c98 <syscallHandle+0x38>
  100c70:	83 f8 04             	cmp    $0x4,%eax
  100c73:	74 17                	je     100c8c <syscallHandle+0x2c>
  100c75:	48                   	dec    %eax
  100c76:	74 08                	je     100c80 <syscallHandle+0x20>
  100c78:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100c7b:	c9                   	leave  
  100c7c:	c3                   	ret    
  100c7d:	8d 76 00             	lea    0x0(%esi),%esi
  100c80:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100c83:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100c86:	c9                   	leave  
  100c87:	e9 10 f7 ff ff       	jmp    10039c <sys_exit>
  100c8c:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100c8f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100c92:	c9                   	leave  
  100c93:	e9 08 f9 ff ff       	jmp    1005a0 <sys_write>
  100c98:	83 ec 0c             	sub    $0xc,%esp
  100c9b:	53                   	push   %ebx
  100c9c:	e8 47 f7 ff ff       	call   1003e8 <sys_fork>
  100ca1:	89 43 1c             	mov    %eax,0x1c(%ebx)
  100ca4:	83 c4 10             	add    $0x10,%esp
  100ca7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100caa:	c9                   	leave  
  100cab:	c3                   	ret    

00100cac <GProtectFaultHandle>:
  100cac:	55                   	push   %ebp
  100cad:	89 e5                	mov    %esp,%ebp
  100caf:	83 ec 14             	sub    $0x14,%esp
  100cb2:	68 6c 11 10 00       	push   $0x10116c
  100cb7:	e8 54 02 00 00       	call   100f10 <printk>
  100cbc:	58                   	pop    %eax
  100cbd:	8b 45 08             	mov    0x8(%ebp),%eax
  100cc0:	ff 70 20             	pushl  0x20(%eax)
  100cc3:	68 44 13 10 00       	push   $0x101344
  100cc8:	6a 49                	push   $0x49
  100cca:	68 19 13 10 00       	push   $0x101319
  100ccf:	68 2c 13 10 00       	push   $0x10132c
  100cd4:	e8 37 02 00 00       	call   100f10 <printk>
  100cd9:	83 c4 14             	add    $0x14,%esp
  100cdc:	68 8d 11 10 00       	push   $0x10118d
  100ce1:	e8 2a 02 00 00       	call   100f10 <printk>
  100ce6:	5a                   	pop    %edx
  100ce7:	59                   	pop    %ecx
  100ce8:	6a 4a                	push   $0x4a
  100cea:	68 19 13 10 00       	push   $0x101319
  100cef:	e8 90 03 00 00       	call   101084 <abort>
  100cf4:	83 c4 10             	add    $0x10,%esp
  100cf7:	c9                   	leave  
  100cf8:	c3                   	ret    
  100cf9:	8d 76 00             	lea    0x0(%esi),%esi

00100cfc <timeHandle>:
  100cfc:	55                   	push   %ebp
  100cfd:	89 e5                	mov    %esp,%ebp
  100cff:	53                   	push   %ebx
  100d00:	83 ec 10             	sub    $0x10,%esp
  100d03:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100d06:	6a 41                	push   $0x41
  100d08:	e8 1f f9 ff ff       	call   10062c <putChar>
  100d0d:	89 1c 24             	mov    %ebx,(%esp)
  100d10:	e8 cb fb ff ff       	call   1008e0 <checkTimeCount>
  100d15:	83 c4 10             	add    $0x10,%esp
  100d18:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  100d1f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100d22:	c9                   	leave  
  100d23:	e9 04 f9 ff ff       	jmp    10062c <putChar>

00100d28 <irqHandle>:
  100d28:	55                   	push   %ebp
  100d29:	89 e5                	mov    %esp,%ebp
  100d2b:	83 ec 08             	sub    $0x8,%esp
  100d2e:	8b 55 08             	mov    0x8(%ebp),%edx
  100d31:	fa                   	cli    
  100d32:	8b 42 20             	mov    0x20(%edx),%eax
  100d35:	83 f8 0d             	cmp    $0xd,%eax
  100d38:	74 46                	je     100d80 <irqHandle+0x58>
  100d3a:	7e 2c                	jle    100d68 <irqHandle+0x40>
  100d3c:	83 f8 20             	cmp    $0x20,%eax
  100d3f:	74 17                	je     100d58 <irqHandle+0x30>
  100d41:	83 c0 80             	add    $0xffffff80,%eax
  100d44:	75 25                	jne    100d6b <irqHandle+0x43>
  100d46:	83 ec 0c             	sub    $0xc,%esp
  100d49:	52                   	push   %edx
  100d4a:	e8 11 ff ff ff       	call   100c60 <syscallHandle>
  100d4f:	83 c4 10             	add    $0x10,%esp
  100d52:	fb                   	sti    
  100d53:	c9                   	leave  
  100d54:	c3                   	ret    
  100d55:	8d 76 00             	lea    0x0(%esi),%esi
  100d58:	83 ec 0c             	sub    $0xc,%esp
  100d5b:	52                   	push   %edx
  100d5c:	e8 9b ff ff ff       	call   100cfc <timeHandle>
  100d61:	83 c4 10             	add    $0x10,%esp
  100d64:	eb ec                	jmp    100d52 <irqHandle+0x2a>
  100d66:	66 90                	xchg   %ax,%ax
  100d68:	40                   	inc    %eax
  100d69:	74 e7                	je     100d52 <irqHandle+0x2a>
  100d6b:	83 ec 08             	sub    $0x8,%esp
  100d6e:	6a 24                	push   $0x24
  100d70:	68 19 13 10 00       	push   $0x101319
  100d75:	e8 0a 03 00 00       	call   101084 <abort>
  100d7a:	83 c4 10             	add    $0x10,%esp
  100d7d:	eb d3                	jmp    100d52 <irqHandle+0x2a>
  100d7f:	90                   	nop
  100d80:	83 ec 0c             	sub    $0xc,%esp
  100d83:	52                   	push   %edx
  100d84:	e8 23 ff ff ff       	call   100cac <GProtectFaultHandle>
  100d89:	83 c4 10             	add    $0x10,%esp
  100d8c:	eb c4                	jmp    100d52 <irqHandle+0x2a>
  100d8e:	66 90                	xchg   %ax,%ax

00100d90 <initIntr>:
  100d90:	55                   	push   %ebp
  100d91:	89 e5                	mov    %esp,%ebp
  100d93:	ba 21 00 00 00       	mov    $0x21,%edx
  100d98:	b0 ff                	mov    $0xff,%al
  100d9a:	ee                   	out    %al,(%dx)
  100d9b:	ba a1 00 00 00       	mov    $0xa1,%edx
  100da0:	ee                   	out    %al,(%dx)
  100da1:	ba 20 00 00 00       	mov    $0x20,%edx
  100da6:	b0 11                	mov    $0x11,%al
  100da8:	ee                   	out    %al,(%dx)
  100da9:	ba 21 00 00 00       	mov    $0x21,%edx
  100dae:	b0 20                	mov    $0x20,%al
  100db0:	ee                   	out    %al,(%dx)
  100db1:	b0 04                	mov    $0x4,%al
  100db3:	ee                   	out    %al,(%dx)
  100db4:	b0 03                	mov    $0x3,%al
  100db6:	ee                   	out    %al,(%dx)
  100db7:	ba a0 00 00 00       	mov    $0xa0,%edx
  100dbc:	b0 11                	mov    $0x11,%al
  100dbe:	ee                   	out    %al,(%dx)
  100dbf:	ba a1 00 00 00       	mov    $0xa1,%edx
  100dc4:	b0 28                	mov    $0x28,%al
  100dc6:	ee                   	out    %al,(%dx)
  100dc7:	b0 02                	mov    $0x2,%al
  100dc9:	ee                   	out    %al,(%dx)
  100dca:	b0 03                	mov    $0x3,%al
  100dcc:	ee                   	out    %al,(%dx)
  100dcd:	ba 20 00 00 00       	mov    $0x20,%edx
  100dd2:	b0 68                	mov    $0x68,%al
  100dd4:	ee                   	out    %al,(%dx)
  100dd5:	b0 0a                	mov    $0xa,%al
  100dd7:	ee                   	out    %al,(%dx)
  100dd8:	ba a0 00 00 00       	mov    $0xa0,%edx
  100ddd:	b0 68                	mov    $0x68,%al
  100ddf:	ee                   	out    %al,(%dx)
  100de0:	b0 0a                	mov    $0xa,%al
  100de2:	ee                   	out    %al,(%dx)
  100de3:	5d                   	pop    %ebp
  100de4:	c3                   	ret    
  100de5:	8d 76 00             	lea    0x0(%esi),%esi

00100de8 <initTimer>:
  100de8:	55                   	push   %ebp
  100de9:	89 e5                	mov    %esp,%ebp
  100deb:	ba 43 00 00 00       	mov    $0x43,%edx
  100df0:	b0 34                	mov    $0x34,%al
  100df2:	ee                   	out    %al,(%dx)
  100df3:	ba 40 00 00 00       	mov    $0x40,%edx
  100df8:	b0 9b                	mov    $0x9b,%al
  100dfa:	ee                   	out    %al,(%dx)
  100dfb:	b0 2e                	mov    $0x2e,%al
  100dfd:	ee                   	out    %al,(%dx)
  100dfe:	5d                   	pop    %ebp
  100dff:	c3                   	ret    

00100e00 <i2A>:
  100e00:	55                   	push   %ebp
  100e01:	89 e5                	mov    %esp,%ebp
  100e03:	57                   	push   %edi
  100e04:	56                   	push   %esi
  100e05:	53                   	push   %ebx
  100e06:	51                   	push   %ecx
  100e07:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100e0a:	85 c9                	test   %ecx,%ecx
  100e0c:	78 6e                	js     100e7c <i2A+0x7c>
  100e0e:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  100e12:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  100e16:	bb 5e 2b 10 00       	mov    $0x102b5e,%ebx
  100e1b:	31 ff                	xor    %edi,%edi
  100e1d:	eb 03                	jmp    100e22 <i2A+0x22>
  100e1f:	90                   	nop
  100e20:	89 f7                	mov    %esi,%edi
  100e22:	4b                   	dec    %ebx
  100e23:	89 c8                	mov    %ecx,%eax
  100e25:	be 0a 00 00 00       	mov    $0xa,%esi
  100e2a:	99                   	cltd   
  100e2b:	f7 fe                	idiv   %esi
  100e2d:	83 c2 30             	add    $0x30,%edx
  100e30:	88 13                	mov    %dl,(%ebx)
  100e32:	8d 77 01             	lea    0x1(%edi),%esi
  100e35:	b8 67 66 66 66       	mov    $0x66666667,%eax
  100e3a:	f7 e9                	imul   %ecx
  100e3c:	89 d0                	mov    %edx,%eax
  100e3e:	c1 f8 02             	sar    $0x2,%eax
  100e41:	c1 f9 1f             	sar    $0x1f,%ecx
  100e44:	29 c8                	sub    %ecx,%eax
  100e46:	89 c1                	mov    %eax,%ecx
  100e48:	75 d6                	jne    100e20 <i2A+0x20>
  100e4a:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  100e4e:	74 20                	je     100e70 <i2A+0x70>
  100e50:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  100e54:	75 06                	jne    100e5c <i2A+0x5c>
  100e56:	fe 05 5d 2b 10 00    	incb   0x102b5d
  100e5c:	c6 05 5e 2b 10 00 00 	movb   $0x0,0x102b5e
  100e63:	8b 45 0c             	mov    0xc(%ebp),%eax
  100e66:	89 18                	mov    %ebx,(%eax)
  100e68:	89 f0                	mov    %esi,%eax
  100e6a:	5a                   	pop    %edx
  100e6b:	5b                   	pop    %ebx
  100e6c:	5e                   	pop    %esi
  100e6d:	5f                   	pop    %edi
  100e6e:	5d                   	pop    %ebp
  100e6f:	c3                   	ret    
  100e70:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  100e74:	8d 77 02             	lea    0x2(%edi),%esi
  100e77:	4b                   	dec    %ebx
  100e78:	eb d6                	jmp    100e50 <i2A+0x50>
  100e7a:	66 90                	xchg   %ax,%ax
  100e7c:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  100e82:	74 0c                	je     100e90 <i2A+0x90>
  100e84:	f7 d9                	neg    %ecx
  100e86:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  100e8a:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  100e8e:	eb 86                	jmp    100e16 <i2A+0x16>
  100e90:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  100e95:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  100e99:	eb ef                	jmp    100e8a <i2A+0x8a>
  100e9b:	90                   	nop

00100e9c <i2X>:
  100e9c:	55                   	push   %ebp
  100e9d:	89 e5                	mov    %esp,%ebp
  100e9f:	57                   	push   %edi
  100ea0:	56                   	push   %esi
  100ea1:	53                   	push   %ebx
  100ea2:	8b 55 08             	mov    0x8(%ebp),%edx
  100ea5:	b9 3d 2b 10 00       	mov    $0x102b3d,%ecx
  100eaa:	31 c0                	xor    %eax,%eax
  100eac:	40                   	inc    %eax
  100ead:	89 d6                	mov    %edx,%esi
  100eaf:	83 e6 0f             	and    $0xf,%esi
  100eb2:	8d 5e f6             	lea    -0xa(%esi),%ebx
  100eb5:	89 cf                	mov    %ecx,%edi
  100eb7:	83 fb 05             	cmp    $0x5,%ebx
  100eba:	77 4c                	ja     100f08 <i2X+0x6c>
  100ebc:	ff 24 9d 58 13 10 00 	jmp    *0x101358(,%ebx,4)
  100ec3:	90                   	nop
  100ec4:	c6 01 65             	movb   $0x65,(%ecx)
  100ec7:	90                   	nop
  100ec8:	49                   	dec    %ecx
  100ec9:	c1 ea 04             	shr    $0x4,%edx
  100ecc:	75 de                	jne    100eac <i2X+0x10>
  100ece:	c6 05 3e 2b 10 00 00 	movb   $0x0,0x102b3e
  100ed5:	8b 55 0c             	mov    0xc(%ebp),%edx
  100ed8:	89 3a                	mov    %edi,(%edx)
  100eda:	5b                   	pop    %ebx
  100edb:	5e                   	pop    %esi
  100edc:	5f                   	pop    %edi
  100edd:	5d                   	pop    %ebp
  100ede:	c3                   	ret    
  100edf:	90                   	nop
  100ee0:	c6 01 64             	movb   $0x64,(%ecx)
  100ee3:	eb e3                	jmp    100ec8 <i2X+0x2c>
  100ee5:	8d 76 00             	lea    0x0(%esi),%esi
  100ee8:	c6 01 63             	movb   $0x63,(%ecx)
  100eeb:	eb db                	jmp    100ec8 <i2X+0x2c>
  100eed:	8d 76 00             	lea    0x0(%esi),%esi
  100ef0:	c6 01 62             	movb   $0x62,(%ecx)
  100ef3:	eb d3                	jmp    100ec8 <i2X+0x2c>
  100ef5:	8d 76 00             	lea    0x0(%esi),%esi
  100ef8:	c6 01 61             	movb   $0x61,(%ecx)
  100efb:	eb cb                	jmp    100ec8 <i2X+0x2c>
  100efd:	8d 76 00             	lea    0x0(%esi),%esi
  100f00:	c6 01 66             	movb   $0x66,(%ecx)
  100f03:	eb c3                	jmp    100ec8 <i2X+0x2c>
  100f05:	8d 76 00             	lea    0x0(%esi),%esi
  100f08:	8d 5e 30             	lea    0x30(%esi),%ebx
  100f0b:	88 19                	mov    %bl,(%ecx)
  100f0d:	eb b9                	jmp    100ec8 <i2X+0x2c>
  100f0f:	90                   	nop

00100f10 <printk>:
  100f10:	55                   	push   %ebp
  100f11:	89 e5                	mov    %esp,%ebp
  100f13:	57                   	push   %edi
  100f14:	56                   	push   %esi
  100f15:	53                   	push   %ebx
  100f16:	83 ec 2c             	sub    $0x2c,%esp
  100f19:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100f1c:	8a 11                	mov    (%ecx),%dl
  100f1e:	84 d2                	test   %dl,%dl
  100f20:	0f 84 54 01 00 00    	je     10107a <printk+0x16a>
  100f26:	8d 45 0c             	lea    0xc(%ebp),%eax
  100f29:	31 ff                	xor    %edi,%edi
  100f2b:	eb 18                	jmp    100f45 <printk+0x35>
  100f2d:	8d 76 00             	lea    0x0(%esi),%esi
  100f30:	8a 11                	mov    (%ecx),%dl
  100f32:	89 cb                	mov    %ecx,%ebx
  100f34:	88 97 60 2b 10 00    	mov    %dl,0x102b60(%edi)
  100f3a:	47                   	inc    %edi
  100f3b:	8d 4b 01             	lea    0x1(%ebx),%ecx
  100f3e:	8a 53 01             	mov    0x1(%ebx),%dl
  100f41:	84 d2                	test   %dl,%dl
  100f43:	74 72                	je     100fb7 <printk+0xa7>
  100f45:	80 fa 25             	cmp    $0x25,%dl
  100f48:	75 e6                	jne    100f30 <printk+0x20>
  100f4a:	8d 59 01             	lea    0x1(%ecx),%ebx
  100f4d:	8a 51 01             	mov    0x1(%ecx),%dl
  100f50:	80 fa 64             	cmp    $0x64,%dl
  100f53:	0f 84 bf 00 00 00    	je     101018 <printk+0x108>
  100f59:	0f 8e 01 01 00 00    	jle    101060 <printk+0x150>
  100f5f:	80 fa 73             	cmp    $0x73,%dl
  100f62:	0f 84 84 00 00 00    	je     100fec <printk+0xdc>
  100f68:	80 fa 78             	cmp    $0x78,%dl
  100f6b:	75 c7                	jne    100f34 <printk+0x24>
  100f6d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100f74:	8d 70 04             	lea    0x4(%eax),%esi
  100f77:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  100f7a:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  100f7d:	56                   	push   %esi
  100f7e:	ff 30                	pushl  (%eax)
  100f80:	e8 17 ff ff ff       	call   100e9c <i2X>
  100f85:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  100f88:	8d b7 60 2b 10 00    	lea    0x102b60(%edi),%esi
  100f8e:	8a 11                	mov    (%ecx),%dl
  100f90:	83 c4 08             	add    $0x8,%esp
  100f93:	31 c0                	xor    %eax,%eax
  100f95:	84 d2                	test   %dl,%dl
  100f97:	74 0f                	je     100fa8 <printk+0x98>
  100f99:	8d 76 00             	lea    0x0(%esi),%esi
  100f9c:	40                   	inc    %eax
  100f9d:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  100fa1:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  100fa4:	84 d2                	test   %dl,%dl
  100fa6:	75 f4                	jne    100f9c <printk+0x8c>
  100fa8:	01 c7                	add    %eax,%edi
  100faa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100fad:	8d 4b 01             	lea    0x1(%ebx),%ecx
  100fb0:	8a 53 01             	mov    0x1(%ebx),%dl
  100fb3:	84 d2                	test   %dl,%dl
  100fb5:	75 8e                	jne    100f45 <printk+0x35>
  100fb7:	c6 87 60 2b 10 00 00 	movb   $0x0,0x102b60(%edi)
  100fbe:	0f be 05 60 2b 10 00 	movsbl 0x102b60,%eax
  100fc5:	bb 60 2b 10 00       	mov    $0x102b60,%ebx
  100fca:	84 c0                	test   %al,%al
  100fcc:	74 16                	je     100fe4 <printk+0xd4>
  100fce:	66 90                	xchg   %ax,%ax
  100fd0:	83 ec 0c             	sub    $0xc,%esp
  100fd3:	50                   	push   %eax
  100fd4:	e8 53 f6 ff ff       	call   10062c <putChar>
  100fd9:	43                   	inc    %ebx
  100fda:	0f be 03             	movsbl (%ebx),%eax
  100fdd:	83 c4 10             	add    $0x10,%esp
  100fe0:	84 c0                	test   %al,%al
  100fe2:	75 ec                	jne    100fd0 <printk+0xc0>
  100fe4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100fe7:	5b                   	pop    %ebx
  100fe8:	5e                   	pop    %esi
  100fe9:	5f                   	pop    %edi
  100fea:	5d                   	pop    %ebp
  100feb:	c3                   	ret    
  100fec:	8d 70 04             	lea    0x4(%eax),%esi
  100fef:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  100ff2:	8b 08                	mov    (%eax),%ecx
  100ff4:	8d b7 60 2b 10 00    	lea    0x102b60(%edi),%esi
  100ffa:	8a 11                	mov    (%ecx),%dl
  100ffc:	31 c0                	xor    %eax,%eax
  100ffe:	84 d2                	test   %dl,%dl
  101000:	74 a6                	je     100fa8 <printk+0x98>
  101002:	66 90                	xchg   %ax,%ax
  101004:	40                   	inc    %eax
  101005:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101009:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  10100c:	84 d2                	test   %dl,%dl
  10100e:	75 f4                	jne    101004 <printk+0xf4>
  101010:	01 c7                	add    %eax,%edi
  101012:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101015:	eb 96                	jmp    100fad <printk+0x9d>
  101017:	90                   	nop
  101018:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10101f:	8d 70 04             	lea    0x4(%eax),%esi
  101022:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101025:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101028:	56                   	push   %esi
  101029:	ff 30                	pushl  (%eax)
  10102b:	e8 d0 fd ff ff       	call   100e00 <i2A>
  101030:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  101033:	8d b7 60 2b 10 00    	lea    0x102b60(%edi),%esi
  101039:	8a 11                	mov    (%ecx),%dl
  10103b:	83 c4 08             	add    $0x8,%esp
  10103e:	31 c0                	xor    %eax,%eax
  101040:	84 d2                	test   %dl,%dl
  101042:	0f 84 60 ff ff ff    	je     100fa8 <printk+0x98>
  101048:	40                   	inc    %eax
  101049:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  10104d:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  101050:	84 d2                	test   %dl,%dl
  101052:	75 f4                	jne    101048 <printk+0x138>
  101054:	01 c7                	add    %eax,%edi
  101056:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101059:	e9 4f ff ff ff       	jmp    100fad <printk+0x9d>
  10105e:	66 90                	xchg   %ax,%ax
  101060:	80 fa 63             	cmp    $0x63,%dl
  101063:	0f 85 cb fe ff ff    	jne    100f34 <printk+0x24>
  101069:	8b 10                	mov    (%eax),%edx
  10106b:	88 97 60 2b 10 00    	mov    %dl,0x102b60(%edi)
  101071:	83 c0 04             	add    $0x4,%eax
  101074:	47                   	inc    %edi
  101075:	e9 c1 fe ff ff       	jmp    100f3b <printk+0x2b>
  10107a:	31 ff                	xor    %edi,%edi
  10107c:	e9 36 ff ff ff       	jmp    100fb7 <printk+0xa7>
  101081:	66 90                	xchg   %ax,%ax
  101083:	90                   	nop

00101084 <abort>:
  101084:	55                   	push   %ebp
  101085:	89 e5                	mov    %esp,%ebp
  101087:	57                   	push   %edi
  101088:	56                   	push   %esi
  101089:	53                   	push   %ebx
  10108a:	83 ec 1c             	sub    $0x1c,%esp
  10108d:	8b 55 08             	mov    0x8(%ebp),%edx
  101090:	fa                   	cli    
  101091:	8a 02                	mov    (%edx),%al
  101093:	b9 12 2a 10 00       	mov    $0x102a12,%ecx
  101098:	84 c0                	test   %al,%al
  10109a:	74 0b                	je     1010a7 <abort+0x23>
  10109c:	41                   	inc    %ecx
  10109d:	42                   	inc    %edx
  10109e:	88 41 ff             	mov    %al,-0x1(%ecx)
  1010a1:	8a 02                	mov    (%edx),%al
  1010a3:	84 c0                	test   %al,%al
  1010a5:	75 f5                	jne    10109c <abort+0x18>
  1010a7:	c6 01 3a             	movb   $0x3a,(%ecx)
  1010aa:	bb 7d 33 10 00       	mov    $0x10337d,%ebx
  1010af:	be 0a 00 00 00       	mov    $0xa,%esi
  1010b4:	bf 67 66 66 66       	mov    $0x66666667,%edi
  1010b9:	4b                   	dec    %ebx
  1010ba:	8b 45 0c             	mov    0xc(%ebp),%eax
  1010bd:	99                   	cltd   
  1010be:	f7 fe                	idiv   %esi
  1010c0:	8d 42 30             	lea    0x30(%edx),%eax
  1010c3:	88 45 e7             	mov    %al,-0x19(%ebp)
  1010c6:	88 03                	mov    %al,(%ebx)
  1010c8:	89 f8                	mov    %edi,%eax
  1010ca:	f7 6d 0c             	imull  0xc(%ebp)
  1010cd:	c1 fa 02             	sar    $0x2,%edx
  1010d0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1010d3:	c1 f8 1f             	sar    $0x1f,%eax
  1010d6:	29 c2                	sub    %eax,%edx
  1010d8:	89 55 0c             	mov    %edx,0xc(%ebp)
  1010db:	75 dc                	jne    1010b9 <abort+0x35>
  1010dd:	41                   	inc    %ecx
  1010de:	41                   	inc    %ecx
  1010df:	43                   	inc    %ebx
  1010e0:	8a 45 e7             	mov    -0x19(%ebp),%al
  1010e3:	88 41 ff             	mov    %al,-0x1(%ecx)
  1010e6:	8a 03                	mov    (%ebx),%al
  1010e8:	88 45 e7             	mov    %al,-0x19(%ebp)
  1010eb:	84 c0                	test   %al,%al
  1010ed:	75 ef                	jne    1010de <abort+0x5a>
  1010ef:	c6 01 0a             	movb   $0xa,(%ecx)
  1010f2:	0f be 05 00 2a 10 00 	movsbl 0x102a00,%eax
  1010f9:	84 c0                	test   %al,%al
  1010fb:	74 1b                	je     101118 <abort+0x94>
  1010fd:	bb 00 2a 10 00       	mov    $0x102a00,%ebx
  101102:	83 ec 0c             	sub    $0xc,%esp
  101105:	50                   	push   %eax
  101106:	e8 21 f5 ff ff       	call   10062c <putChar>
  10110b:	43                   	inc    %ebx
  10110c:	0f be 03             	movsbl (%ebx),%eax
  10110f:	83 c4 10             	add    $0x10,%esp
  101112:	84 c0                	test   %al,%al
  101114:	75 ec                	jne    101102 <abort+0x7e>
  101116:	66 90                	xchg   %ax,%ax
  101118:	f4                   	hlt    
  101119:	eb fd                	jmp    101118 <abort+0x94>

0010111b <irqEmpty>:
  10111b:	6a 00                	push   $0x0
  10111d:	6a ff                	push   $0xffffffff
  10111f:	eb 13                	jmp    101134 <asmDoIrq>

00101121 <irqGProtectFault>:
  101121:	6a 0d                	push   $0xd
  101123:	eb 0f                	jmp    101134 <asmDoIrq>

00101125 <irqSyscall>:
  101125:	6a 00                	push   $0x0
  101127:	68 80 00 00 00       	push   $0x80
  10112c:	eb 06                	jmp    101134 <asmDoIrq>

0010112e <irqTime>:
  10112e:	6a 00                	push   $0x0
  101130:	6a 20                	push   $0x20
  101132:	eb 00                	jmp    101134 <asmDoIrq>

00101134 <asmDoIrq>:
  101134:	60                   	pusha  
  101135:	54                   	push   %esp
  101136:	e8 ed fb ff ff       	call   100d28 <irqHandle>
  10113b:	83 c4 04             	add    $0x4,%esp
  10113e:	61                   	popa   
  10113f:	83 c4 04             	add    $0x4,%esp
  101142:	83 c4 04             	add    $0x4,%esp
  101145:	cf                   	iret   
