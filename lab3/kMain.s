
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 f1 10 00 00       	call   1010fc <initTimer>
  10000b:	e8 6c 0d 00 00       	call   100d7c <init_pcb>
  100010:	e8 a3 0d 00 00       	call   100db8 <init_kernel_pcb>
  100015:	e8 be 05 00 00       	call   1005d8 <initSerial>
  10001a:	e8 45 0e 00 00       	call   100e64 <initIdt>
  10001f:	e8 80 10 00 00       	call   1010a4 <initIntr>
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
  10003a:	a3 08 ea 12 01       	mov    %eax,0x112ea08
  10003f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100042:	a3 04 ea 12 01       	mov    %eax,0x112ea04
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
  1000df:	b9 c0 e9 12 01       	mov    $0x112e9c0,%ecx
  1000e4:	66 c7 05 c8 e9 12 01 	movw   $0xffff,0x112e9c8
  1000eb:	ff ff 
  1000ed:	66 c7 05 ca e9 12 01 	movw   $0x0,0x112e9ca
  1000f4:	00 00 
  1000f6:	c6 05 cc e9 12 01 00 	movb   $0x0,0x112e9cc
  1000fd:	c6 05 cd e9 12 01 9a 	movb   $0x9a,0x112e9cd
  100104:	c6 05 ce e9 12 01 cf 	movb   $0xcf,0x112e9ce
  10010b:	c6 05 cf e9 12 01 00 	movb   $0x0,0x112e9cf
  100112:	66 c7 05 d0 e9 12 01 	movw   $0xffff,0x112e9d0
  100119:	ff ff 
  10011b:	66 c7 05 d2 e9 12 01 	movw   $0x0,0x112e9d2
  100122:	00 00 
  100124:	c6 05 d4 e9 12 01 00 	movb   $0x0,0x112e9d4
  10012b:	c6 05 d5 e9 12 01 92 	movb   $0x92,0x112e9d5
  100132:	c6 05 d6 e9 12 01 cf 	movb   $0xcf,0x112e9d6
  100139:	c6 05 d7 e9 12 01 00 	movb   $0x0,0x112e9d7
  100140:	66 c7 05 d8 e9 12 01 	movw   $0xffff,0x112e9d8
  100147:	ff ff 
  100149:	66 c7 05 da e9 12 01 	movw   $0x0,0x112e9da
  100150:	00 00 
  100152:	c6 05 dc e9 12 01 00 	movb   $0x0,0x112e9dc
  100159:	c6 05 dd e9 12 01 fa 	movb   $0xfa,0x112e9dd
  100160:	c6 05 de e9 12 01 cf 	movb   $0xcf,0x112e9de
  100167:	c6 05 df e9 12 01 00 	movb   $0x0,0x112e9df
  10016e:	66 c7 05 e0 e9 12 01 	movw   $0xffff,0x112e9e0
  100175:	ff ff 
  100177:	66 c7 05 e2 e9 12 01 	movw   $0x0,0x112e9e2
  10017e:	00 00 
  100180:	c6 05 e4 e9 12 01 00 	movb   $0x0,0x112e9e4
  100187:	c6 05 e5 e9 12 01 f2 	movb   $0xf2,0x112e9e5
  10018e:	c6 05 e6 e9 12 01 cf 	movb   $0xcf,0x112e9e6
  100195:	c6 05 e7 e9 12 01 00 	movb   $0x0,0x112e9e7
  10019c:	66 c7 05 e8 e9 12 01 	movw   $0x63,0x112e9e8
  1001a3:	63 00 
  1001a5:	b8 00 ea 12 01       	mov    $0x112ea00,%eax
  1001aa:	66 a3 ea e9 12 01    	mov    %ax,0x112e9ea
  1001b0:	89 c2                	mov    %eax,%edx
  1001b2:	c1 ea 10             	shr    $0x10,%edx
  1001b5:	88 15 ec e9 12 01    	mov    %dl,0x112e9ec
  1001bb:	c6 05 ed e9 12 01 89 	movb   $0x89,0x112e9ed
  1001c2:	c6 05 ee e9 12 01 40 	movb   $0x40,0x112e9ee
  1001c9:	c1 e8 18             	shr    $0x18,%eax
  1001cc:	a2 ef e9 12 01       	mov    %al,0x112e9ef
  1001d1:	a1 5c 14 10 00       	mov    0x10145c,%eax
  1001d6:	8b 15 60 14 10 00    	mov    0x101460,%edx
  1001dc:	a3 f0 e9 12 01       	mov    %eax,0x112e9f0
  1001e1:	89 15 f4 e9 12 01    	mov    %edx,0x112e9f4
  1001e7:	66 c7 05 20 21 10 00 	movw   $0x37,0x102120
  1001ee:	37 00 
  1001f0:	66 89 0d 22 21 10 00 	mov    %cx,0x102122
  1001f7:	c1 e9 10             	shr    $0x10,%ecx
  1001fa:	66 89 0d 24 21 10 00 	mov    %cx,0x102124
  100201:	b8 20 21 10 00       	mov    $0x102120,%eax
  100206:	0f 01 10             	lgdtl  (%eax)
  100209:	a1 f8 49 10 00       	mov    0x1049f8,%eax
  10020e:	a3 08 ea 12 01       	mov    %eax,0x112ea08
  100213:	c7 05 04 ea 12 01 bf 	movl   $0x1031bf,0x112ea04
  10021a:	31 10 00 
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
  100254:	01 d2                	add    %edx,%edx
  100256:	01 d0                	add    %edx,%eax
  100258:	8d 04 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%eax
  10025f:	8b 90 38 20 00 00    	mov    0x2038(%eax),%edx
  100265:	52                   	push   %edx
  100266:	8b 90 34 20 00 00    	mov    0x2034(%eax),%edx
  10026c:	52                   	push   %edx
  10026d:	9c                   	pushf  
  10026e:	8b 90 2c 20 00 00    	mov    0x202c(%eax),%edx
  100274:	52                   	push   %edx
  100275:	8b 80 28 20 00 00    	mov    0x2028(%eax),%eax
  10027b:	50                   	push   %eax
  10027c:	cf                   	iret   
  10027d:	5d                   	pop    %ebp
  10027e:	c3                   	ret    
  10027f:	90                   	nop

00100280 <enterUserSpace>:
  100280:	55                   	push   %ebp
  100281:	89 e5                	mov    %esp,%ebp
  100283:	83 ec 14             	sub    $0x14,%esp
  100286:	c7 05 a4 29 10 00 01 	movl   $0x1,0x1029a4
  10028d:	00 00 00 
  100290:	c7 05 50 6a 10 00 23 	movl   $0x23,0x106a50
  100297:	00 00 00 
  10029a:	c7 05 4c 6a 10 00 00 	movl   $0x8000000,0x106a4c
  1002a1:	00 00 08 
  1002a4:	c7 05 44 6a 10 00 1b 	movl   $0x1b,0x106a44
  1002ab:	00 00 00 
  1002ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1002b1:	a3 40 6a 10 00       	mov    %eax,0x106a40
  1002b6:	c7 05 58 6a 10 00 0a 	movl   $0xa,0x106a58
  1002bd:	00 00 00 
  1002c0:	6a 01                	push   $0x1
  1002c2:	e8 05 05 00 00       	call   1007cc <put_into_runnable>
  1002c7:	a1 f8 49 10 00       	mov    0x1049f8,%eax
  1002cc:	50                   	push   %eax
  1002cd:	a1 f4 49 10 00       	mov    0x1049f4,%eax
  1002d2:	50                   	push   %eax
  1002d3:	9c                   	pushf  
  1002d4:	a1 ec 49 10 00       	mov    0x1049ec,%eax
  1002d9:	50                   	push   %eax
  1002da:	a1 e8 49 10 00       	mov    0x1049e8,%eax
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
  1003a2:	e8 65 03 00 00       	call   10070c <get_from_runnable>
  1003a7:	83 ec 08             	sub    $0x8,%esp
  1003aa:	ff 75 08             	pushl  0x8(%ebp)
  1003ad:	50                   	push   %eax
  1003ae:	e8 f1 02 00 00       	call   1006a4 <put_into_running>
  1003b3:	b8 01 00 00 00       	mov    $0x1,%eax
  1003b8:	c9                   	leave  
  1003b9:	c3                   	ret    
  1003ba:	66 90                	xchg   %ax,%ax

001003bc <sys_sleep>:
  1003bc:	55                   	push   %ebp
  1003bd:	89 e5                	mov    %esp,%ebp
  1003bf:	56                   	push   %esi
  1003c0:	53                   	push   %ebx
  1003c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1003c4:	e8 13 03 00 00       	call   1006dc <getpid>
  1003c9:	83 ec 08             	sub    $0x8,%esp
  1003cc:	53                   	push   %ebx
  1003cd:	50                   	push   %eax
  1003ce:	e8 1d 05 00 00       	call   1008f0 <put_into_block>
  1003d3:	c7 04 24 64 14 10 00 	movl   $0x101464,(%esp)
  1003da:	e8 45 0e 00 00       	call   101224 <printk>
  1003df:	e8 f8 02 00 00       	call   1006dc <getpid>
  1003e4:	89 c2                	mov    %eax,%edx
  1003e6:	c1 e2 07             	shl    $0x7,%edx
  1003e9:	01 c2                	add    %eax,%edx
  1003eb:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1003ee:	01 d2                	add    %edx,%edx
  1003f0:	01 d0                	add    %edx,%eax
  1003f2:	8b 34 c5 04 4a 10 00 	mov    0x104a04(,%eax,8),%esi
  1003f9:	e8 de 02 00 00       	call   1006dc <getpid>
  1003fe:	5a                   	pop    %edx
  1003ff:	59                   	pop    %ecx
  100400:	56                   	push   %esi
  100401:	50                   	push   %eax
  100402:	68 b0 14 10 00       	push   $0x1014b0
  100407:	6a 09                	push   $0x9
  100409:	68 6a 14 10 00       	push   $0x10146a
  10040e:	68 8c 14 10 00       	push   $0x10148c
  100413:	e8 0c 0e 00 00       	call   101224 <printk>
  100418:	83 c4 14             	add    $0x14,%esp
  10041b:	68 86 14 10 00       	push   $0x101486
  100420:	e8 ff 0d 00 00       	call   101224 <printk>
  100425:	e8 e2 02 00 00       	call   10070c <get_from_runnable>
  10042a:	5e                   	pop    %esi
  10042b:	5a                   	pop    %edx
  10042c:	53                   	push   %ebx
  10042d:	50                   	push   %eax
  10042e:	e8 71 02 00 00       	call   1006a4 <put_into_running>
  100433:	b8 01 00 00 00       	mov    $0x1,%eax
  100438:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10043b:	5b                   	pop    %ebx
  10043c:	5e                   	pop    %esi
  10043d:	5d                   	pop    %ebp
  10043e:	c3                   	ret    
  10043f:	90                   	nop

00100440 <sys_fork>:
  100440:	55                   	push   %ebp
  100441:	89 e5                	mov    %esp,%ebp
  100443:	57                   	push   %edi
  100444:	56                   	push   %esi
  100445:	8b 75 08             	mov    0x8(%ebp),%esi
  100448:	83 ec 0c             	sub    $0xc,%esp
  10044b:	68 ba 14 10 00       	push   $0x1014ba
  100450:	e8 cf 0d 00 00       	call   101224 <printk>
  100455:	b8 70 8a 10 00       	mov    $0x108a70,%eax
  10045a:	b9 0f 00 00 00       	mov    $0xf,%ecx
  10045f:	89 c7                	mov    %eax,%edi
  100461:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100463:	c7 05 8c 8a 10 00 00 	movl   $0x0,0x108a8c
  10046a:	00 00 00 
  10046d:	c7 05 a4 8a 10 00 00 	movl   $0x7e00000,0x108aa4
  100474:	00 e0 07 
  100477:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  10047e:	e8 49 03 00 00       	call   1007cc <put_into_runnable>
  100483:	b8 02 00 00 00       	mov    $0x2,%eax
  100488:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10048b:	5e                   	pop    %esi
  10048c:	5f                   	pop    %edi
  10048d:	5d                   	pop    %ebp
  10048e:	c3                   	ret    
  10048f:	90                   	nop

00100490 <display>:
  100490:	55                   	push   %ebp
  100491:	89 e5                	mov    %esp,%ebp
  100493:	57                   	push   %edi
  100494:	53                   	push   %ebx
  100495:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100498:	80 fb 0a             	cmp    $0xa,%bl
  10049b:	74 5b                	je     1004f8 <display+0x68>
  10049d:	8b 15 28 21 10 00    	mov    0x102128,%edx
  1004a3:	8b 0d 2c 21 10 00    	mov    0x10212c,%ecx
  1004a9:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  1004ac:	c1 e0 04             	shl    $0x4,%eax
  1004af:	01 d0                	add    %edx,%eax
  1004b1:	01 c0                	add    %eax,%eax
  1004b3:	89 c7                	mov    %eax,%edi
  1004b5:	0f be db             	movsbl %bl,%ebx
  1004b8:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
  1004be:	66 89 d8             	mov    %bx,%ax
  1004c1:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1004c5:	42                   	inc    %edx
  1004c6:	83 fa 50             	cmp    $0x50,%edx
  1004c9:	75 1d                	jne    1004e8 <display+0x58>
  1004cb:	c7 05 28 21 10 00 00 	movl   $0x0,0x102128
  1004d2:	00 00 00 
  1004d5:	41                   	inc    %ecx
  1004d6:	89 0d 2c 21 10 00    	mov    %ecx,0x10212c
  1004dc:	b8 01 00 00 00       	mov    $0x1,%eax
  1004e1:	5b                   	pop    %ebx
  1004e2:	5f                   	pop    %edi
  1004e3:	5d                   	pop    %ebp
  1004e4:	c3                   	ret    
  1004e5:	8d 76 00             	lea    0x0(%esi),%esi
  1004e8:	89 15 28 21 10 00    	mov    %edx,0x102128
  1004ee:	b8 01 00 00 00       	mov    $0x1,%eax
  1004f3:	5b                   	pop    %ebx
  1004f4:	5f                   	pop    %edi
  1004f5:	5d                   	pop    %ebp
  1004f6:	c3                   	ret    
  1004f7:	90                   	nop
  1004f8:	c7 05 28 21 10 00 00 	movl   $0x0,0x102128
  1004ff:	00 00 00 
  100502:	ff 05 2c 21 10 00    	incl   0x10212c
  100508:	b8 01 00 00 00       	mov    $0x1,%eax
  10050d:	5b                   	pop    %ebx
  10050e:	5f                   	pop    %edi
  10050f:	5d                   	pop    %ebp
  100510:	c3                   	ret    
  100511:	8d 76 00             	lea    0x0(%esi),%esi

00100514 <printkernel>:
  100514:	55                   	push   %ebp
  100515:	89 e5                	mov    %esp,%ebp
  100517:	53                   	push   %ebx
  100518:	50                   	push   %eax
  100519:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10051c:	0f be 03             	movsbl (%ebx),%eax
  10051f:	84 c0                	test   %al,%al
  100521:	74 20                	je     100543 <printkernel+0x2f>
  100523:	90                   	nop
  100524:	83 ec 0c             	sub    $0xc,%esp
  100527:	50                   	push   %eax
  100528:	e8 eb 00 00 00       	call   100618 <putChar>
  10052d:	0f be 03             	movsbl (%ebx),%eax
  100530:	89 04 24             	mov    %eax,(%esp)
  100533:	e8 58 ff ff ff       	call   100490 <display>
  100538:	43                   	inc    %ebx
  100539:	0f be 03             	movsbl (%ebx),%eax
  10053c:	83 c4 10             	add    $0x10,%esp
  10053f:	84 c0                	test   %al,%al
  100541:	75 e1                	jne    100524 <printkernel+0x10>
  100543:	b8 01 00 00 00       	mov    $0x1,%eax
  100548:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10054b:	c9                   	leave  
  10054c:	c3                   	ret    
  10054d:	8d 76 00             	lea    0x0(%esi),%esi

00100550 <fs_write>:
  100550:	55                   	push   %ebp
  100551:	89 e5                	mov    %esp,%ebp
  100553:	53                   	push   %ebx
  100554:	50                   	push   %eax
  100555:	8b 5d 10             	mov    0x10(%ebp),%ebx
  100558:	ba 30 00 00 00       	mov    $0x30,%edx
  10055d:	89 d0                	mov    %edx,%eax
  10055f:	8e e8                	mov    %eax,%gs
  100561:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  100565:	74 12                	je     100579 <fs_write+0x29>
  100567:	83 ec 08             	sub    $0x8,%esp
  10056a:	6a 27                	push   $0x27
  10056c:	68 d6 14 10 00       	push   $0x1014d6
  100571:	e8 22 0e 00 00       	call   101398 <abort>
  100576:	83 c4 10             	add    $0x10,%esp
  100579:	83 ec 08             	sub    $0x8,%esp
  10057c:	53                   	push   %ebx
  10057d:	ff 75 0c             	pushl  0xc(%ebp)
  100580:	e8 8f ff ff ff       	call   100514 <printkernel>
  100585:	89 d8                	mov    %ebx,%eax
  100587:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10058a:	c9                   	leave  
  10058b:	c3                   	ret    

0010058c <sys_write>:
  10058c:	55                   	push   %ebp
  10058d:	89 e5                	mov    %esp,%ebp
  10058f:	53                   	push   %ebx
  100590:	83 ec 08             	sub    $0x8,%esp
  100593:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100596:	ff 73 14             	pushl  0x14(%ebx)
  100599:	ff 73 18             	pushl  0x18(%ebx)
  10059c:	ff 73 10             	pushl  0x10(%ebx)
  10059f:	e8 ac ff ff ff       	call   100550 <fs_write>
  1005a4:	89 43 1c             	mov    %eax,0x1c(%ebx)
  1005a7:	83 c4 10             	add    $0x10,%esp
  1005aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005ad:	c9                   	leave  
  1005ae:	c3                   	ret    
  1005af:	90                   	nop

001005b0 <print_char>:
  1005b0:	55                   	push   %ebp
  1005b1:	89 e5                	mov    %esp,%ebp
  1005b3:	57                   	push   %edi
  1005b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1005b7:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1005ba:	c1 e0 04             	shl    $0x4,%eax
  1005bd:	03 45 0c             	add    0xc(%ebp),%eax
  1005c0:	01 c0                	add    %eax,%eax
  1005c2:	89 c7                	mov    %eax,%edi
  1005c4:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  1005c8:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  1005ce:	66 89 d0             	mov    %dx,%ax
  1005d1:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1005d5:	5f                   	pop    %edi
  1005d6:	5d                   	pop    %ebp
  1005d7:	c3                   	ret    

001005d8 <initSerial>:
  1005d8:	55                   	push   %ebp
  1005d9:	89 e5                	mov    %esp,%ebp
  1005db:	ba f9 03 00 00       	mov    $0x3f9,%edx
  1005e0:	31 c0                	xor    %eax,%eax
  1005e2:	ee                   	out    %al,(%dx)
  1005e3:	ba fb 03 00 00       	mov    $0x3fb,%edx
  1005e8:	b0 80                	mov    $0x80,%al
  1005ea:	ee                   	out    %al,(%dx)
  1005eb:	ba f8 03 00 00       	mov    $0x3f8,%edx
  1005f0:	b0 01                	mov    $0x1,%al
  1005f2:	ee                   	out    %al,(%dx)
  1005f3:	ba f9 03 00 00       	mov    $0x3f9,%edx
  1005f8:	31 c0                	xor    %eax,%eax
  1005fa:	ee                   	out    %al,(%dx)
  1005fb:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100600:	b0 03                	mov    $0x3,%al
  100602:	ee                   	out    %al,(%dx)
  100603:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100608:	b0 c7                	mov    $0xc7,%al
  10060a:	ee                   	out    %al,(%dx)
  10060b:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100610:	b0 0b                	mov    $0xb,%al
  100612:	ee                   	out    %al,(%dx)
  100613:	5d                   	pop    %ebp
  100614:	c3                   	ret    
  100615:	8d 76 00             	lea    0x0(%esi),%esi

00100618 <putChar>:
  100618:	55                   	push   %ebp
  100619:	89 e5                	mov    %esp,%ebp
  10061b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10061e:	ba fd 03 00 00       	mov    $0x3fd,%edx
  100623:	90                   	nop
  100624:	ec                   	in     (%dx),%al
  100625:	a8 20                	test   $0x20,%al
  100627:	74 fb                	je     100624 <putChar+0xc>
  100629:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10062e:	88 c8                	mov    %cl,%al
  100630:	ee                   	out    %al,(%dx)
  100631:	5d                   	pop    %ebp
  100632:	c3                   	ret    
  100633:	90                   	nop

00100634 <IDLE>:
  100634:	55                   	push   %ebp
  100635:	89 e5                	mov    %esp,%ebp
  100637:	90                   	nop
  100638:	f4                   	hlt    
  100639:	eb fd                	jmp    100638 <IDLE+0x4>
  10063b:	90                   	nop

0010063c <put_into_running.part.0>:
  10063c:	55                   	push   %ebp
  10063d:	89 e5                	mov    %esp,%ebp
  10063f:	57                   	push   %edi
  100640:	56                   	push   %esi
  100641:	53                   	push   %ebx
  100642:	83 ec 18             	sub    $0x18,%esp
  100645:	89 c3                	mov    %eax,%ebx
  100647:	a3 a0 29 10 00       	mov    %eax,0x1029a0
  10064c:	c1 e0 07             	shl    $0x7,%eax
  10064f:	01 d8                	add    %ebx,%eax
  100651:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100654:	01 c0                	add    %eax,%eax
  100656:	01 d8                	add    %ebx,%eax
  100658:	8d 34 c5 c0 49 10 00 	lea    0x1049c0(,%eax,8),%esi
  10065f:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100664:	89 d7                	mov    %edx,%edi
  100666:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100668:	68 64 14 10 00       	push   $0x101464
  10066d:	e8 b2 0b 00 00       	call   101224 <printk>
  100672:	89 1c 24             	mov    %ebx,(%esp)
  100675:	68 f4 15 10 00       	push   $0x1015f4
  10067a:	6a 12                	push   $0x12
  10067c:	68 f2 14 10 00       	push   $0x1014f2
  100681:	68 00 15 10 00       	push   $0x101500
  100686:	e8 99 0b 00 00       	call   101224 <printk>
  10068b:	83 c4 14             	add    $0x14,%esp
  10068e:	68 86 14 10 00       	push   $0x101486
  100693:	e8 8c 0b 00 00       	call   101224 <printk>
  100698:	83 c4 10             	add    $0x10,%esp
  10069b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10069e:	5b                   	pop    %ebx
  10069f:	5e                   	pop    %esi
  1006a0:	5f                   	pop    %edi
  1006a1:	5d                   	pop    %ebp
  1006a2:	c3                   	ret    
  1006a3:	90                   	nop

001006a4 <put_into_running>:
  1006a4:	55                   	push   %ebp
  1006a5:	89 e5                	mov    %esp,%ebp
  1006a7:	83 ec 08             	sub    $0x8,%esp
  1006aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1006ad:	39 05 a0 29 10 00    	cmp    %eax,0x1029a0
  1006b3:	74 08                	je     1006bd <put_into_running+0x19>
  1006b5:	8b 55 0c             	mov    0xc(%ebp),%edx
  1006b8:	e8 7f ff ff ff       	call   10063c <put_into_running.part.0>
  1006bd:	b8 01 00 00 00       	mov    $0x1,%eax
  1006c2:	c9                   	leave  
  1006c3:	c3                   	ret    

001006c4 <update_block>:
  1006c4:	55                   	push   %ebp
  1006c5:	89 e5                	mov    %esp,%ebp
  1006c7:	b8 01 00 00 00       	mov    $0x1,%eax
  1006cc:	5d                   	pop    %ebp
  1006cd:	c3                   	ret    
  1006ce:	66 90                	xchg   %ax,%ax

001006d0 <apply_new_pid>:
  1006d0:	55                   	push   %ebp
  1006d1:	89 e5                	mov    %esp,%ebp
  1006d3:	b8 02 00 00 00       	mov    $0x2,%eax
  1006d8:	5d                   	pop    %ebp
  1006d9:	c3                   	ret    
  1006da:	66 90                	xchg   %ax,%ax

001006dc <getpid>:
  1006dc:	55                   	push   %ebp
  1006dd:	89 e5                	mov    %esp,%ebp
  1006df:	a1 a0 29 10 00       	mov    0x1029a0,%eax
  1006e4:	5d                   	pop    %ebp
  1006e5:	c3                   	ret    
  1006e6:	66 90                	xchg   %ax,%ax

001006e8 <getrunnable>:
  1006e8:	55                   	push   %ebp
  1006e9:	89 e5                	mov    %esp,%ebp
  1006eb:	a1 04 20 10 00       	mov    0x102004,%eax
  1006f0:	5d                   	pop    %ebp
  1006f1:	c3                   	ret    
  1006f2:	66 90                	xchg   %ax,%ax

001006f4 <getblocked>:
  1006f4:	55                   	push   %ebp
  1006f5:	89 e5                	mov    %esp,%ebp
  1006f7:	a1 00 20 10 00       	mov    0x102000,%eax
  1006fc:	5d                   	pop    %ebp
  1006fd:	c3                   	ret    
  1006fe:	66 90                	xchg   %ax,%ax

00100700 <transfer_pid_mode>:
  100700:	55                   	push   %ebp
  100701:	89 e5                	mov    %esp,%ebp
  100703:	b8 01 00 00 00       	mov    $0x1,%eax
  100708:	5d                   	pop    %ebp
  100709:	c3                   	ret    
  10070a:	66 90                	xchg   %ax,%ax

0010070c <get_from_runnable>:
  10070c:	55                   	push   %ebp
  10070d:	89 e5                	mov    %esp,%ebp
  10070f:	53                   	push   %ebx
  100710:	51                   	push   %ecx
  100711:	8b 1d 04 20 10 00    	mov    0x102004,%ebx
  100717:	83 fb ff             	cmp    $0xffffffff,%ebx
  10071a:	0f 84 a4 00 00 00    	je     1007c4 <get_from_runnable+0xb8>
  100720:	89 d8                	mov    %ebx,%eax
  100722:	c1 e0 07             	shl    $0x7,%eax
  100725:	01 d8                	add    %ebx,%eax
  100727:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10072a:	01 c0                	add    %eax,%eax
  10072c:	01 d8                	add    %ebx,%eax
  10072e:	8d 14 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%edx
  100735:	8b 82 50 20 00 00    	mov    0x2050(%edx),%eax
  10073b:	39 d8                	cmp    %ebx,%eax
  10073d:	74 79                	je     1007b8 <get_from_runnable+0xac>
  10073f:	8b 8a 4c 20 00 00    	mov    0x204c(%edx),%ecx
  100745:	89 ca                	mov    %ecx,%edx
  100747:	c1 e2 07             	shl    $0x7,%edx
  10074a:	01 ca                	add    %ecx,%edx
  10074c:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  10074f:	01 d2                	add    %edx,%edx
  100751:	01 ca                	add    %ecx,%edx
  100753:	89 04 d5 10 4a 10 00 	mov    %eax,0x104a10(,%edx,8)
  10075a:	89 c2                	mov    %eax,%edx
  10075c:	c1 e2 07             	shl    $0x7,%edx
  10075f:	01 c2                	add    %eax,%edx
  100761:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100764:	01 d2                	add    %edx,%edx
  100766:	01 c2                	add    %eax,%edx
  100768:	89 0c d5 0c 4a 10 00 	mov    %ecx,0x104a0c(,%edx,8)
  10076f:	a3 04 20 10 00       	mov    %eax,0x102004
  100774:	83 ec 0c             	sub    $0xc,%esp
  100777:	68 64 14 10 00       	push   $0x101464
  10077c:	e8 a3 0a 00 00       	call   101224 <printk>
  100781:	58                   	pop    %eax
  100782:	5a                   	pop    %edx
  100783:	ff 35 04 20 10 00    	pushl  0x102004
  100789:	53                   	push   %ebx
  10078a:	68 d0 15 10 00       	push   $0x1015d0
  10078f:	6a 71                	push   $0x71
  100791:	68 f2 14 10 00       	push   $0x1014f2
  100796:	68 38 15 10 00       	push   $0x101538
  10079b:	e8 84 0a 00 00       	call   101224 <printk>
  1007a0:	83 c4 14             	add    $0x14,%esp
  1007a3:	68 86 14 10 00       	push   $0x101486
  1007a8:	e8 77 0a 00 00       	call   101224 <printk>
  1007ad:	83 c4 10             	add    $0x10,%esp
  1007b0:	89 d8                	mov    %ebx,%eax
  1007b2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1007b5:	c9                   	leave  
  1007b6:	c3                   	ret    
  1007b7:	90                   	nop
  1007b8:	c7 05 04 20 10 00 ff 	movl   $0xffffffff,0x102004
  1007bf:	ff ff ff 
  1007c2:	eb b0                	jmp    100774 <get_from_runnable+0x68>
  1007c4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007c9:	eb e7                	jmp    1007b2 <get_from_runnable+0xa6>
  1007cb:	90                   	nop

001007cc <put_into_runnable>:
  1007cc:	55                   	push   %ebp
  1007cd:	89 e5                	mov    %esp,%ebp
  1007cf:	56                   	push   %esi
  1007d0:	53                   	push   %ebx
  1007d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1007d4:	a1 04 20 10 00       	mov    0x102004,%eax
  1007d9:	83 f8 ff             	cmp    $0xffffffff,%eax
  1007dc:	0f 84 e2 00 00 00    	je     1008c4 <put_into_runnable+0xf8>
  1007e2:	89 c2                	mov    %eax,%edx
  1007e4:	c1 e2 07             	shl    $0x7,%edx
  1007e7:	01 c2                	add    %eax,%edx
  1007e9:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1007ec:	01 d2                	add    %edx,%edx
  1007ee:	01 c2                	add    %eax,%edx
  1007f0:	8d 34 d5 c0 29 10 00 	lea    0x1029c0(,%edx,8),%esi
  1007f7:	8b 8e 4c 20 00 00    	mov    0x204c(%esi),%ecx
  1007fd:	89 ca                	mov    %ecx,%edx
  1007ff:	c1 e2 07             	shl    $0x7,%edx
  100802:	01 ca                	add    %ecx,%edx
  100804:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100807:	01 d2                	add    %edx,%edx
  100809:	01 ca                	add    %ecx,%edx
  10080b:	89 1c d5 10 4a 10 00 	mov    %ebx,0x104a10(,%edx,8)
  100812:	89 da                	mov    %ebx,%edx
  100814:	c1 e2 07             	shl    $0x7,%edx
  100817:	01 da                	add    %ebx,%edx
  100819:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  10081c:	01 d2                	add    %edx,%edx
  10081e:	01 da                	add    %ebx,%edx
  100820:	8d 14 d5 c0 29 10 00 	lea    0x1029c0(,%edx,8),%edx
  100827:	89 8a 4c 20 00 00    	mov    %ecx,0x204c(%edx)
  10082d:	89 82 50 20 00 00    	mov    %eax,0x2050(%edx)
  100833:	89 9e 4c 20 00 00    	mov    %ebx,0x204c(%esi)
  100839:	89 d8                	mov    %ebx,%eax
  10083b:	c1 e0 07             	shl    $0x7,%eax
  10083e:	01 d8                	add    %ebx,%eax
  100840:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100843:	01 c0                	add    %eax,%eax
  100845:	01 d8                	add    %ebx,%eax
  100847:	c7 04 c5 fc 49 10 00 	movl   $0x1,0x1049fc(,%eax,8)
  10084e:	01 00 00 00 
  100852:	85 db                	test   %ebx,%ebx
  100854:	75 0a                	jne    100860 <put_into_runnable+0x94>
  100856:	c7 05 e8 49 10 00 34 	movl   $0x100634,0x1049e8
  10085d:	06 10 00 
  100860:	83 ec 0c             	sub    $0xc,%esp
  100863:	68 64 14 10 00       	push   $0x101464
  100868:	e8 b7 09 00 00       	call   101224 <printk>
  10086d:	58                   	pop    %eax
  10086e:	5a                   	pop    %edx
  10086f:	53                   	push   %ebx
  100870:	ff 35 04 20 10 00    	pushl  0x102004
  100876:	68 bc 15 10 00       	push   $0x1015bc
  10087b:	68 8f 00 00 00       	push   $0x8f
  100880:	68 f2 14 10 00       	push   $0x1014f2
  100885:	68 6c 15 10 00       	push   $0x10156c
  10088a:	e8 95 09 00 00       	call   101224 <printk>
  10088f:	83 c4 14             	add    $0x14,%esp
  100892:	68 86 14 10 00       	push   $0x101486
  100897:	e8 88 09 00 00       	call   101224 <printk>
  10089c:	89 d8                	mov    %ebx,%eax
  10089e:	c1 e0 07             	shl    $0x7,%eax
  1008a1:	01 d8                	add    %ebx,%eax
  1008a3:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1008a6:	01 c0                	add    %eax,%eax
  1008a8:	01 c3                	add    %eax,%ebx
  1008aa:	c7 04 dd 00 4a 10 00 	movl   $0xa,0x104a00(,%ebx,8)
  1008b1:	0a 00 00 00 
  1008b5:	b8 01 00 00 00       	mov    $0x1,%eax
  1008ba:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1008bd:	5b                   	pop    %ebx
  1008be:	5e                   	pop    %esi
  1008bf:	5d                   	pop    %ebp
  1008c0:	c3                   	ret    
  1008c1:	8d 76 00             	lea    0x0(%esi),%esi
  1008c4:	89 1d 04 20 10 00    	mov    %ebx,0x102004
  1008ca:	89 d8                	mov    %ebx,%eax
  1008cc:	c1 e0 07             	shl    $0x7,%eax
  1008cf:	01 d8                	add    %ebx,%eax
  1008d1:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1008d4:	01 c0                	add    %eax,%eax
  1008d6:	01 d8                	add    %ebx,%eax
  1008d8:	8d 04 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%eax
  1008df:	89 98 4c 20 00 00    	mov    %ebx,0x204c(%eax)
  1008e5:	89 98 50 20 00 00    	mov    %ebx,0x2050(%eax)
  1008eb:	e9 49 ff ff ff       	jmp    100839 <put_into_runnable+0x6d>

001008f0 <put_into_block>:
  1008f0:	55                   	push   %ebp
  1008f1:	89 e5                	mov    %esp,%ebp
  1008f3:	57                   	push   %edi
  1008f4:	56                   	push   %esi
  1008f5:	53                   	push   %ebx
  1008f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1008f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  1008fc:	8b 15 00 20 10 00    	mov    0x102000,%edx
  100902:	83 fa ff             	cmp    $0xffffffff,%edx
  100905:	0f 84 99 00 00 00    	je     1009a4 <put_into_block+0xb4>
  10090b:	89 d1                	mov    %edx,%ecx
  10090d:	c1 e1 07             	shl    $0x7,%ecx
  100910:	01 d1                	add    %edx,%ecx
  100912:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100915:	01 c9                	add    %ecx,%ecx
  100917:	01 d1                	add    %edx,%ecx
  100919:	8d 3c cd c0 29 10 00 	lea    0x1029c0(,%ecx,8),%edi
  100920:	8b b7 4c 20 00 00    	mov    0x204c(%edi),%esi
  100926:	89 f1                	mov    %esi,%ecx
  100928:	c1 e1 07             	shl    $0x7,%ecx
  10092b:	01 f1                	add    %esi,%ecx
  10092d:	8d 0c 8e             	lea    (%esi,%ecx,4),%ecx
  100930:	01 c9                	add    %ecx,%ecx
  100932:	01 f1                	add    %esi,%ecx
  100934:	89 04 cd 10 4a 10 00 	mov    %eax,0x104a10(,%ecx,8)
  10093b:	89 c1                	mov    %eax,%ecx
  10093d:	c1 e1 07             	shl    $0x7,%ecx
  100940:	01 c1                	add    %eax,%ecx
  100942:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  100945:	01 c9                	add    %ecx,%ecx
  100947:	01 c1                	add    %eax,%ecx
  100949:	8d 0c cd c0 29 10 00 	lea    0x1029c0(,%ecx,8),%ecx
  100950:	89 b1 4c 20 00 00    	mov    %esi,0x204c(%ecx)
  100956:	89 91 50 20 00 00    	mov    %edx,0x2050(%ecx)
  10095c:	89 87 4c 20 00 00    	mov    %eax,0x204c(%edi)
  100962:	89 c2                	mov    %eax,%edx
  100964:	c1 e2 07             	shl    $0x7,%edx
  100967:	01 c2                	add    %eax,%edx
  100969:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10096c:	01 d2                	add    %edx,%edx
  10096e:	01 c2                	add    %eax,%edx
  100970:	c1 e2 03             	shl    $0x3,%edx
  100973:	8d 82 c0 49 10 00    	lea    0x1049c0(%edx),%eax
  100979:	b9 0f 00 00 00       	mov    $0xf,%ecx
  10097e:	89 c7                	mov    %eax,%edi
  100980:	89 de                	mov    %ebx,%esi
  100982:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100984:	8b 43 10             	mov    0x10(%ebx),%eax
  100987:	89 82 04 4a 10 00    	mov    %eax,0x104a04(%edx)
  10098d:	c7 82 fc 49 10 00 00 	movl   $0x0,0x1049fc(%edx)
  100994:	00 00 00 
  100997:	b8 01 00 00 00       	mov    $0x1,%eax
  10099c:	5b                   	pop    %ebx
  10099d:	5e                   	pop    %esi
  10099e:	5f                   	pop    %edi
  10099f:	5d                   	pop    %ebp
  1009a0:	c3                   	ret    
  1009a1:	8d 76 00             	lea    0x0(%esi),%esi
  1009a4:	a3 00 20 10 00       	mov    %eax,0x102000
  1009a9:	89 c2                	mov    %eax,%edx
  1009ab:	c1 e2 07             	shl    $0x7,%edx
  1009ae:	01 c2                	add    %eax,%edx
  1009b0:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1009b3:	01 d2                	add    %edx,%edx
  1009b5:	01 c2                	add    %eax,%edx
  1009b7:	8d 14 d5 c0 29 10 00 	lea    0x1029c0(,%edx,8),%edx
  1009be:	89 82 50 20 00 00    	mov    %eax,0x2050(%edx)
  1009c4:	89 82 4c 20 00 00    	mov    %eax,0x204c(%edx)
  1009ca:	eb 96                	jmp    100962 <put_into_block+0x72>

001009cc <get_from>:
  1009cc:	55                   	push   %ebp
  1009cd:	89 e5                	mov    %esp,%ebp
  1009cf:	56                   	push   %esi
  1009d0:	53                   	push   %ebx
  1009d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1009d4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1009d7:	85 db                	test   %ebx,%ebx
  1009d9:	0f 8e 01 01 00 00    	jle    100ae0 <get_from+0x114>
  1009df:	39 c3                	cmp    %eax,%ebx
  1009e1:	74 42                	je     100a25 <get_from+0x59>
  1009e3:	89 da                	mov    %ebx,%edx
  1009e5:	c1 e2 07             	shl    $0x7,%edx
  1009e8:	01 da                	add    %ebx,%edx
  1009ea:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  1009ed:	01 d2                	add    %edx,%edx
  1009ef:	01 da                	add    %ebx,%edx
  1009f1:	8b 14 d5 10 4a 10 00 	mov    0x104a10(,%edx,8),%edx
  1009f8:	39 d3                	cmp    %edx,%ebx
  1009fa:	75 25                	jne    100a21 <get_from+0x55>
  1009fc:	e9 df 00 00 00       	jmp    100ae0 <get_from+0x114>
  100a01:	8d 76 00             	lea    0x0(%esi),%esi
  100a04:	89 d1                	mov    %edx,%ecx
  100a06:	c1 e1 07             	shl    $0x7,%ecx
  100a09:	01 d1                	add    %edx,%ecx
  100a0b:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100a0e:	01 c9                	add    %ecx,%ecx
  100a10:	01 ca                	add    %ecx,%edx
  100a12:	8b 14 d5 10 4a 10 00 	mov    0x104a10(,%edx,8),%edx
  100a19:	39 d3                	cmp    %edx,%ebx
  100a1b:	0f 84 bf 00 00 00    	je     100ae0 <get_from+0x114>
  100a21:	39 c2                	cmp    %eax,%edx
  100a23:	75 df                	jne    100a04 <get_from+0x38>
  100a25:	89 c2                	mov    %eax,%edx
  100a27:	c1 e2 07             	shl    $0x7,%edx
  100a2a:	01 c2                	add    %eax,%edx
  100a2c:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100a2f:	01 d2                	add    %edx,%edx
  100a31:	01 d0                	add    %edx,%eax
  100a33:	8b 04 c5 fc 49 10 00 	mov    0x1049fc(,%eax,8),%eax
  100a3a:	85 c0                	test   %eax,%eax
  100a3c:	0f 84 c2 00 00 00    	je     100b04 <get_from+0x138>
  100a42:	48                   	dec    %eax
  100a43:	75 7f                	jne    100ac4 <get_from+0xf8>
  100a45:	be 04 20 10 00       	mov    $0x102004,%esi
  100a4a:	3b 1e                	cmp    (%esi),%ebx
  100a4c:	74 15                	je     100a63 <get_from+0x97>
  100a4e:	83 ec 08             	sub    $0x8,%esp
  100a51:	68 d0 00 00 00       	push   $0xd0
  100a56:	68 f2 14 10 00       	push   $0x1014f2
  100a5b:	e8 38 09 00 00       	call   101398 <abort>
  100a60:	83 c4 10             	add    $0x10,%esp
  100a63:	89 d8                	mov    %ebx,%eax
  100a65:	c1 e0 07             	shl    $0x7,%eax
  100a68:	01 d8                	add    %ebx,%eax
  100a6a:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100a6d:	01 c0                	add    %eax,%eax
  100a6f:	01 d8                	add    %ebx,%eax
  100a71:	8d 14 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%edx
  100a78:	8b 82 50 20 00 00    	mov    0x2050(%edx),%eax
  100a7e:	39 d8                	cmp    %ebx,%eax
  100a80:	0f 84 8a 00 00 00    	je     100b10 <get_from+0x144>
  100a86:	8b 8a 4c 20 00 00    	mov    0x204c(%edx),%ecx
  100a8c:	89 ca                	mov    %ecx,%edx
  100a8e:	c1 e2 07             	shl    $0x7,%edx
  100a91:	01 ca                	add    %ecx,%edx
  100a93:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100a96:	01 d2                	add    %edx,%edx
  100a98:	01 ca                	add    %ecx,%edx
  100a9a:	89 04 d5 10 4a 10 00 	mov    %eax,0x104a10(,%edx,8)
  100aa1:	89 c2                	mov    %eax,%edx
  100aa3:	c1 e2 07             	shl    $0x7,%edx
  100aa6:	01 c2                	add    %eax,%edx
  100aa8:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100aab:	01 d2                	add    %edx,%edx
  100aad:	01 c2                	add    %eax,%edx
  100aaf:	89 0c d5 0c 4a 10 00 	mov    %ecx,0x104a0c(,%edx,8)
  100ab6:	89 06                	mov    %eax,(%esi)
  100ab8:	89 d8                	mov    %ebx,%eax
  100aba:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100abd:	5b                   	pop    %ebx
  100abe:	5e                   	pop    %esi
  100abf:	5d                   	pop    %ebp
  100ac0:	c3                   	ret    
  100ac1:	8d 76 00             	lea    0x0(%esi),%esi
  100ac4:	83 ec 08             	sub    $0x8,%esp
  100ac7:	68 cc 00 00 00       	push   $0xcc
  100acc:	68 f2 14 10 00       	push   $0x1014f2
  100ad1:	e8 c2 08 00 00       	call   101398 <abort>
  100ad6:	a1 00 00 00 00       	mov    0x0,%eax
  100adb:	0f 0b                	ud2    
  100add:	8d 76 00             	lea    0x0(%esi),%esi
  100ae0:	83 ec 08             	sub    $0x8,%esp
  100ae3:	68 bd 00 00 00       	push   $0xbd
  100ae8:	68 f2 14 10 00       	push   $0x1014f2
  100aed:	e8 a6 08 00 00       	call   101398 <abort>
  100af2:	83 c4 10             	add    $0x10,%esp
  100af5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100afa:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100afd:	5b                   	pop    %ebx
  100afe:	5e                   	pop    %esi
  100aff:	5d                   	pop    %ebp
  100b00:	c3                   	ret    
  100b01:	8d 76 00             	lea    0x0(%esi),%esi
  100b04:	be 00 20 10 00       	mov    $0x102000,%esi
  100b09:	e9 3c ff ff ff       	jmp    100a4a <get_from+0x7e>
  100b0e:	66 90                	xchg   %ax,%ax
  100b10:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100b16:	89 d8                	mov    %ebx,%eax
  100b18:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100b1b:	5b                   	pop    %ebx
  100b1c:	5e                   	pop    %esi
  100b1d:	5d                   	pop    %ebp
  100b1e:	c3                   	ret    
  100b1f:	90                   	nop

00100b20 <get_from_block>:
  100b20:	55                   	push   %ebp
  100b21:	89 e5                	mov    %esp,%ebp
  100b23:	83 ec 10             	sub    $0x10,%esp
  100b26:	ff 75 08             	pushl  0x8(%ebp)
  100b29:	ff 35 00 20 10 00    	pushl  0x102000
  100b2f:	e8 98 fe ff ff       	call   1009cc <get_from>
  100b34:	83 c4 10             	add    $0x10,%esp
  100b37:	40                   	inc    %eax
  100b38:	74 0a                	je     100b44 <get_from_block+0x24>
  100b3a:	b8 01 00 00 00       	mov    $0x1,%eax
  100b3f:	c9                   	leave  
  100b40:	c3                   	ret    
  100b41:	8d 76 00             	lea    0x0(%esi),%esi
  100b44:	83 ec 08             	sub    $0x8,%esp
  100b47:	68 07 01 00 00       	push   $0x107
  100b4c:	68 f2 14 10 00       	push   $0x1014f2
  100b51:	e8 42 08 00 00       	call   101398 <abort>
  100b56:	83 c4 10             	add    $0x10,%esp
  100b59:	b8 01 00 00 00       	mov    $0x1,%eax
  100b5e:	c9                   	leave  
  100b5f:	c3                   	ret    

00100b60 <check_block>:
  100b60:	55                   	push   %ebp
  100b61:	89 e5                	mov    %esp,%ebp
  100b63:	56                   	push   %esi
  100b64:	53                   	push   %ebx
  100b65:	a1 00 20 10 00       	mov    0x102000,%eax
  100b6a:	89 c3                	mov    %eax,%ebx
  100b6c:	83 f8 ff             	cmp    $0xffffffff,%eax
  100b6f:	74 4c                	je     100bbd <check_block+0x5d>
  100b71:	89 c2                	mov    %eax,%edx
  100b73:	c1 e2 07             	shl    $0x7,%edx
  100b76:	01 c2                	add    %eax,%edx
  100b78:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100b7b:	01 d2                	add    %edx,%edx
  100b7d:	01 c2                	add    %eax,%edx
  100b7f:	8d 34 d5 c0 29 10 00 	lea    0x1029c0(,%edx,8),%esi
  100b86:	eb 09                	jmp    100b91 <check_block+0x31>
  100b88:	39 c3                	cmp    %eax,%ebx
  100b8a:	74 2c                	je     100bb8 <check_block+0x58>
  100b8c:	83 f8 ff             	cmp    $0xffffffff,%eax
  100b8f:	74 27                	je     100bb8 <check_block+0x58>
  100b91:	8b 96 44 20 00 00    	mov    0x2044(%esi),%edx
  100b97:	85 d2                	test   %edx,%edx
  100b99:	7f ed                	jg     100b88 <check_block+0x28>
  100b9b:	83 ec 0c             	sub    $0xc,%esp
  100b9e:	53                   	push   %ebx
  100b9f:	e8 7c ff ff ff       	call   100b20 <get_from_block>
  100ba4:	89 1c 24             	mov    %ebx,(%esp)
  100ba7:	e8 20 fc ff ff       	call   1007cc <put_into_runnable>
  100bac:	83 c4 10             	add    $0x10,%esp
  100baf:	a1 00 20 10 00       	mov    0x102000,%eax
  100bb4:	39 c3                	cmp    %eax,%ebx
  100bb6:	75 d4                	jne    100b8c <check_block+0x2c>
  100bb8:	bb 01 00 00 00       	mov    $0x1,%ebx
  100bbd:	89 d8                	mov    %ebx,%eax
  100bbf:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100bc2:	5b                   	pop    %ebx
  100bc3:	5e                   	pop    %esi
  100bc4:	5d                   	pop    %ebp
  100bc5:	c3                   	ret    
  100bc6:	66 90                	xchg   %ax,%ax

00100bc8 <checkTimeCount>:
  100bc8:	a1 a4 29 10 00       	mov    0x1029a4,%eax
  100bcd:	85 c0                	test   %eax,%eax
  100bcf:	0f 84 fb 00 00 00    	je     100cd0 <checkTimeCount+0x108>
  100bd5:	55                   	push   %ebp
  100bd6:	89 e5                	mov    %esp,%ebp
  100bd8:	57                   	push   %edi
  100bd9:	56                   	push   %esi
  100bda:	83 ec 0c             	sub    $0xc,%esp
  100bdd:	68 64 14 10 00       	push   $0x101464
  100be2:	e8 3d 06 00 00       	call   101224 <printk>
  100be7:	58                   	pop    %eax
  100be8:	ff 35 a0 29 10 00    	pushl  0x1029a0
  100bee:	68 e4 15 10 00       	push   $0x1015e4
  100bf3:	6a 1f                	push   $0x1f
  100bf5:	68 f2 14 10 00       	push   $0x1014f2
  100bfa:	68 1e 15 10 00       	push   $0x10151e
  100bff:	e8 20 06 00 00       	call   101224 <printk>
  100c04:	83 c4 14             	add    $0x14,%esp
  100c07:	68 86 14 10 00       	push   $0x101486
  100c0c:	e8 13 06 00 00       	call   101224 <printk>
  100c11:	c7 04 24 64 14 10 00 	movl   $0x101464,(%esp)
  100c18:	e8 07 06 00 00       	call   101224 <printk>
  100c1d:	5a                   	pop    %edx
  100c1e:	a1 a0 29 10 00       	mov    0x1029a0,%eax
  100c23:	89 c2                	mov    %eax,%edx
  100c25:	c1 e2 07             	shl    $0x7,%edx
  100c28:	01 c2                	add    %eax,%edx
  100c2a:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c2d:	01 d2                	add    %edx,%edx
  100c2f:	01 d0                	add    %edx,%eax
  100c31:	ff 34 c5 00 4a 10 00 	pushl  0x104a00(,%eax,8)
  100c38:	68 e4 15 10 00       	push   $0x1015e4
  100c3d:	6a 20                	push   $0x20
  100c3f:	68 f2 14 10 00       	push   $0x1014f2
  100c44:	68 9c 15 10 00       	push   $0x10159c
  100c49:	e8 d6 05 00 00       	call   101224 <printk>
  100c4e:	83 c4 14             	add    $0x14,%esp
  100c51:	68 86 14 10 00       	push   $0x101486
  100c56:	e8 c9 05 00 00       	call   101224 <printk>
  100c5b:	e8 00 ff ff ff       	call   100b60 <check_block>
  100c60:	8b 15 a0 29 10 00    	mov    0x1029a0,%edx
  100c66:	89 d0                	mov    %edx,%eax
  100c68:	c1 e0 07             	shl    $0x7,%eax
  100c6b:	01 d0                	add    %edx,%eax
  100c6d:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100c70:	01 c0                	add    %eax,%eax
  100c72:	01 d0                	add    %edx,%eax
  100c74:	c1 e0 03             	shl    $0x3,%eax
  100c77:	83 c4 10             	add    $0x10,%esp
  100c7a:	8b 88 00 4a 10 00    	mov    0x104a00(%eax),%ecx
  100c80:	85 c9                	test   %ecx,%ecx
  100c82:	7e 0c                	jle    100c90 <checkTimeCount+0xc8>
  100c84:	b8 01 00 00 00       	mov    $0x1,%eax
  100c89:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100c8c:	5e                   	pop    %esi
  100c8d:	5f                   	pop    %edi
  100c8e:	5d                   	pop    %ebp
  100c8f:	c3                   	ret    
  100c90:	05 c0 49 10 00       	add    $0x1049c0,%eax
  100c95:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100c9a:	89 c7                	mov    %eax,%edi
  100c9c:	8b 75 08             	mov    0x8(%ebp),%esi
  100c9f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100ca1:	83 ec 0c             	sub    $0xc,%esp
  100ca4:	52                   	push   %edx
  100ca5:	e8 22 fb ff ff       	call   1007cc <put_into_runnable>
  100caa:	e8 5d fa ff ff       	call   10070c <get_from_runnable>
  100caf:	83 c4 10             	add    $0x10,%esp
  100cb2:	3b 05 a0 29 10 00    	cmp    0x1029a0,%eax
  100cb8:	74 ca                	je     100c84 <checkTimeCount+0xbc>
  100cba:	8b 55 08             	mov    0x8(%ebp),%edx
  100cbd:	e8 7a f9 ff ff       	call   10063c <put_into_running.part.0>
  100cc2:	b8 01 00 00 00       	mov    $0x1,%eax
  100cc7:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100cca:	5e                   	pop    %esi
  100ccb:	5f                   	pop    %edi
  100ccc:	5d                   	pop    %ebp
  100ccd:	c3                   	ret    
  100cce:	66 90                	xchg   %ax,%ax
  100cd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100cd5:	c3                   	ret    
  100cd6:	66 90                	xchg   %ax,%ax

00100cd8 <check_is_in>:
  100cd8:	55                   	push   %ebp
  100cd9:	89 e5                	mov    %esp,%ebp
  100cdb:	53                   	push   %ebx
  100cdc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100cdf:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100ce2:	85 c9                	test   %ecx,%ecx
  100ce4:	7e 4a                	jle    100d30 <check_is_in+0x58>
  100ce6:	39 d9                	cmp    %ebx,%ecx
  100ce8:	74 3b                	je     100d25 <check_is_in+0x4d>
  100cea:	89 c8                	mov    %ecx,%eax
  100cec:	c1 e0 07             	shl    $0x7,%eax
  100cef:	01 c8                	add    %ecx,%eax
  100cf1:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100cf4:	01 c0                	add    %eax,%eax
  100cf6:	01 c8                	add    %ecx,%eax
  100cf8:	8b 04 c5 10 4a 10 00 	mov    0x104a10(,%eax,8),%eax
  100cff:	39 c1                	cmp    %eax,%ecx
  100d01:	75 1e                	jne    100d21 <check_is_in+0x49>
  100d03:	eb 2b                	jmp    100d30 <check_is_in+0x58>
  100d05:	8d 76 00             	lea    0x0(%esi),%esi
  100d08:	89 c2                	mov    %eax,%edx
  100d0a:	c1 e2 07             	shl    $0x7,%edx
  100d0d:	01 c2                	add    %eax,%edx
  100d0f:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100d12:	01 d2                	add    %edx,%edx
  100d14:	01 d0                	add    %edx,%eax
  100d16:	8b 04 c5 10 4a 10 00 	mov    0x104a10(,%eax,8),%eax
  100d1d:	39 c1                	cmp    %eax,%ecx
  100d1f:	74 0f                	je     100d30 <check_is_in+0x58>
  100d21:	39 c3                	cmp    %eax,%ebx
  100d23:	75 e3                	jne    100d08 <check_is_in+0x30>
  100d25:	b8 01 00 00 00       	mov    $0x1,%eax
  100d2a:	5b                   	pop    %ebx
  100d2b:	5d                   	pop    %ebp
  100d2c:	c3                   	ret    
  100d2d:	8d 76 00             	lea    0x0(%esi),%esi
  100d30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100d35:	5b                   	pop    %ebx
  100d36:	5d                   	pop    %ebp
  100d37:	c3                   	ret    

00100d38 <block_decrease>:
  100d38:	55                   	push   %ebp
  100d39:	89 e5                	mov    %esp,%ebp
  100d3b:	8b 0d 00 20 10 00    	mov    0x102000,%ecx
  100d41:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100d44:	74 2e                	je     100d74 <block_decrease+0x3c>
  100d46:	89 c8                	mov    %ecx,%eax
  100d48:	89 c2                	mov    %eax,%edx
  100d4a:	c1 e2 07             	shl    $0x7,%edx
  100d4d:	01 c2                	add    %eax,%edx
  100d4f:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100d52:	01 d2                	add    %edx,%edx
  100d54:	01 d0                	add    %edx,%eax
  100d56:	8d 04 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%eax
  100d5d:	ff 88 44 20 00 00    	decl   0x2044(%eax)
  100d63:	8b 80 50 20 00 00    	mov    0x2050(%eax),%eax
  100d69:	39 c1                	cmp    %eax,%ecx
  100d6b:	75 db                	jne    100d48 <block_decrease+0x10>
  100d6d:	b8 01 00 00 00       	mov    $0x1,%eax
  100d72:	5d                   	pop    %ebp
  100d73:	c3                   	ret    
  100d74:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100d79:	5d                   	pop    %ebp
  100d7a:	c3                   	ret    
  100d7b:	90                   	nop

00100d7c <init_pcb>:
  100d7c:	55                   	push   %ebp
  100d7d:	89 e5                	mov    %esp,%ebp
  100d7f:	ba 08 4a 10 00       	mov    $0x104a08,%edx
  100d84:	31 c0                	xor    %eax,%eax
  100d86:	66 90                	xchg   %ax,%ax
  100d88:	89 02                	mov    %eax,(%edx)
  100d8a:	8d 48 ff             	lea    -0x1(%eax),%ecx
  100d8d:	89 4a 04             	mov    %ecx,0x4(%edx)
  100d90:	40                   	inc    %eax
  100d91:	89 42 08             	mov    %eax,0x8(%edx)
  100d94:	81 c2 58 20 00 00    	add    $0x2058,%edx
  100d9a:	3d 00 08 00 00       	cmp    $0x800,%eax
  100d9f:	75 e7                	jne    100d88 <init_pcb+0xc>
  100da1:	c7 05 0c 4a 10 00 ff 	movl   $0x7ff,0x104a0c
  100da8:	07 00 00 
  100dab:	c7 05 b8 e9 12 01 00 	movl   $0x0,0x112e9b8
  100db2:	00 00 00 
  100db5:	5d                   	pop    %ebp
  100db6:	c3                   	ret    
  100db7:	90                   	nop

00100db8 <init_kernel_pcb>:
  100db8:	55                   	push   %ebp
  100db9:	89 e5                	mov    %esp,%ebp
  100dbb:	c7 05 f8 49 10 00 10 	movl   $0x10,0x1049f8
  100dc2:	00 00 00 
  100dc5:	c7 05 ec 49 10 00 08 	movl   $0x8,0x1049ec
  100dcc:	00 00 00 
  100dcf:	c7 05 e8 49 10 00 34 	movl   $0x100634,0x1049e8
  100dd6:	06 10 00 
  100dd9:	c7 05 f4 49 10 00 00 	movl   $0x7f00000,0x1049f4
  100de0:	00 f0 07 
  100de3:	c7 05 fc 49 10 00 01 	movl   $0x1,0x1049fc
  100dea:	00 00 00 
  100ded:	c7 05 00 4a 10 00 04 	movl   $0x4,0x104a00
  100df4:	00 00 00 
  100df7:	b8 01 00 00 00       	mov    $0x1,%eax
  100dfc:	5d                   	pop    %ebp
  100dfd:	c3                   	ret    
  100dfe:	66 90                	xchg   %ax,%ax

00100e00 <transfer_pid_state>:
  100e00:	55                   	push   %ebp
  100e01:	89 e5                	mov    %esp,%ebp
  100e03:	b8 01 00 00 00       	mov    $0x1,%eax
  100e08:	5d                   	pop    %ebp
  100e09:	c3                   	ret    
  100e0a:	66 90                	xchg   %ax,%ax

00100e0c <make_pcb>:
  100e0c:	55                   	push   %ebp
  100e0d:	89 e5                	mov    %esp,%ebp
  100e0f:	57                   	push   %edi
  100e10:	56                   	push   %esi
  100e11:	8b 45 08             	mov    0x8(%ebp),%eax
  100e14:	89 c2                	mov    %eax,%edx
  100e16:	c1 e2 07             	shl    $0x7,%edx
  100e19:	01 c2                	add    %eax,%edx
  100e1b:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100e1e:	01 d2                	add    %edx,%edx
  100e20:	01 c2                	add    %eax,%edx
  100e22:	c1 e2 03             	shl    $0x3,%edx
  100e25:	8d 82 c0 49 10 00    	lea    0x1049c0(%edx),%eax
  100e2b:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100e30:	89 c7                	mov    %eax,%edi
  100e32:	8b 75 0c             	mov    0xc(%ebp),%esi
  100e35:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100e37:	8b 45 10             	mov    0x10(%ebp),%eax
  100e3a:	89 82 fc 49 10 00    	mov    %eax,0x1049fc(%edx)
  100e40:	8b 45 14             	mov    0x14(%ebp),%eax
  100e43:	89 82 00 4a 10 00    	mov    %eax,0x104a00(%edx)
  100e49:	8b 45 18             	mov    0x18(%ebp),%eax
  100e4c:	89 82 04 4a 10 00    	mov    %eax,0x104a04(%edx)
  100e52:	8b 45 0c             	mov    0xc(%ebp),%eax
  100e55:	89 82 14 4a 10 00    	mov    %eax,0x104a14(%edx)
  100e5b:	b8 01 00 00 00       	mov    $0x1,%eax
  100e60:	5e                   	pop    %esi
  100e61:	5f                   	pop    %edi
  100e62:	5d                   	pop    %ebp
  100e63:	c3                   	ret    

00100e64 <initIdt>:
  100e64:	55                   	push   %ebp
  100e65:	89 e5                	mov    %esp,%ebp
  100e67:	53                   	push   %ebx
  100e68:	ba 2f 14 10 00       	mov    $0x10142f,%edx
  100e6d:	89 d3                	mov    %edx,%ebx
  100e6f:	c1 ea 10             	shr    $0x10,%edx
  100e72:	b9 80 f2 12 01       	mov    $0x112f280,%ecx
  100e77:	b8 80 ea 12 01       	mov    $0x112ea80,%eax
  100e7c:	66 89 18             	mov    %bx,(%eax)
  100e7f:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100e85:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100e89:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100e8d:	66 89 50 06          	mov    %dx,0x6(%eax)
  100e91:	83 c0 08             	add    $0x8,%eax
  100e94:	39 c1                	cmp    %eax,%ecx
  100e96:	75 e4                	jne    100e7c <initIdt+0x18>
  100e98:	b8 35 14 10 00       	mov    $0x101435,%eax
  100e9d:	66 a3 e8 ea 12 01    	mov    %ax,0x112eae8
  100ea3:	66 c7 05 ea ea 12 01 	movw   $0x8,0x112eaea
  100eaa:	08 00 
  100eac:	c6 05 ec ea 12 01 00 	movb   $0x0,0x112eaec
  100eb3:	c6 05 ed ea 12 01 8f 	movb   $0x8f,0x112eaed
  100eba:	c1 e8 10             	shr    $0x10,%eax
  100ebd:	66 a3 ee ea 12 01    	mov    %ax,0x112eaee
  100ec3:	b8 39 14 10 00       	mov    $0x101439,%eax
  100ec8:	66 a3 80 ee 12 01    	mov    %ax,0x112ee80
  100ece:	66 c7 05 82 ee 12 01 	movw   $0x8,0x112ee82
  100ed5:	08 00 
  100ed7:	c6 05 84 ee 12 01 00 	movb   $0x0,0x112ee84
  100ede:	c6 05 85 ee 12 01 ee 	movb   $0xee,0x112ee85
  100ee5:	c1 e8 10             	shr    $0x10,%eax
  100ee8:	66 a3 86 ee 12 01    	mov    %ax,0x112ee86
  100eee:	b8 42 14 10 00       	mov    $0x101442,%eax
  100ef3:	66 a3 80 eb 12 01    	mov    %ax,0x112eb80
  100ef9:	66 c7 05 82 eb 12 01 	movw   $0x8,0x112eb82
  100f00:	08 00 
  100f02:	c6 05 84 eb 12 01 00 	movb   $0x0,0x112eb84
  100f09:	c6 05 85 eb 12 01 8e 	movb   $0x8e,0x112eb85
  100f10:	c1 e8 10             	shr    $0x10,%eax
  100f13:	66 a3 86 eb 12 01    	mov    %ax,0x112eb86
  100f19:	66 c7 05 30 21 10 00 	movw   $0x7ff,0x102130
  100f20:	ff 07 
  100f22:	b8 80 ea 12 01       	mov    $0x112ea80,%eax
  100f27:	66 a3 32 21 10 00    	mov    %ax,0x102132
  100f2d:	c1 e8 10             	shr    $0x10,%eax
  100f30:	66 a3 34 21 10 00    	mov    %ax,0x102134
  100f36:	b8 30 21 10 00       	mov    $0x102130,%eax
  100f3b:	0f 01 18             	lidtl  (%eax)
  100f3e:	5b                   	pop    %ebx
  100f3f:	5d                   	pop    %ebp
  100f40:	c3                   	ret    
  100f41:	66 90                	xchg   %ax,%ax
  100f43:	90                   	nop

00100f44 <syscallHandle>:
  100f44:	55                   	push   %ebp
  100f45:	89 e5                	mov    %esp,%ebp
  100f47:	53                   	push   %ebx
  100f48:	50                   	push   %eax
  100f49:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100f4c:	8b 43 1c             	mov    0x1c(%ebx),%eax
  100f4f:	83 f8 02             	cmp    $0x2,%eax
  100f52:	74 28                	je     100f7c <syscallHandle+0x38>
  100f54:	76 3a                	jbe    100f90 <syscallHandle+0x4c>
  100f56:	83 f8 04             	cmp    $0x4,%eax
  100f59:	74 15                	je     100f70 <syscallHandle+0x2c>
  100f5b:	3d e6 00 00 00       	cmp    $0xe6,%eax
  100f60:	75 29                	jne    100f8b <syscallHandle+0x47>
  100f62:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100f65:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100f68:	c9                   	leave  
  100f69:	e9 4e f4 ff ff       	jmp    1003bc <sys_sleep>
  100f6e:	66 90                	xchg   %ax,%ax
  100f70:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100f73:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100f76:	c9                   	leave  
  100f77:	e9 10 f6 ff ff       	jmp    10058c <sys_write>
  100f7c:	83 ec 0c             	sub    $0xc,%esp
  100f7f:	53                   	push   %ebx
  100f80:	e8 bb f4 ff ff       	call   100440 <sys_fork>
  100f85:	89 43 1c             	mov    %eax,0x1c(%ebx)
  100f88:	83 c4 10             	add    $0x10,%esp
  100f8b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100f8e:	c9                   	leave  
  100f8f:	c3                   	ret    
  100f90:	48                   	dec    %eax
  100f91:	75 f8                	jne    100f8b <syscallHandle+0x47>
  100f93:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100f96:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100f99:	c9                   	leave  
  100f9a:	e9 fd f3 ff ff       	jmp    10039c <sys_exit>
  100f9f:	90                   	nop

00100fa0 <GProtectFaultHandle>:
  100fa0:	55                   	push   %ebp
  100fa1:	89 e5                	mov    %esp,%ebp
  100fa3:	83 ec 14             	sub    $0x14,%esp
  100fa6:	68 64 14 10 00       	push   $0x101464
  100fab:	e8 74 02 00 00       	call   101224 <printk>
  100fb0:	58                   	pop    %eax
  100fb1:	8b 45 08             	mov    0x8(%ebp),%eax
  100fb4:	ff 70 20             	pushl  0x20(%eax)
  100fb7:	68 30 16 10 00       	push   $0x101630
  100fbc:	6a 49                	push   $0x49
  100fbe:	68 05 16 10 00       	push   $0x101605
  100fc3:	68 18 16 10 00       	push   $0x101618
  100fc8:	e8 57 02 00 00       	call   101224 <printk>
  100fcd:	83 c4 14             	add    $0x14,%esp
  100fd0:	68 86 14 10 00       	push   $0x101486
  100fd5:	e8 4a 02 00 00       	call   101224 <printk>
  100fda:	5a                   	pop    %edx
  100fdb:	59                   	pop    %ecx
  100fdc:	6a 4a                	push   $0x4a
  100fde:	68 05 16 10 00       	push   $0x101605
  100fe3:	e8 b0 03 00 00       	call   101398 <abort>
  100fe8:	83 c4 10             	add    $0x10,%esp
  100feb:	c9                   	leave  
  100fec:	c3                   	ret    
  100fed:	8d 76 00             	lea    0x0(%esi),%esi

00100ff0 <timeHandle>:
  100ff0:	55                   	push   %ebp
  100ff1:	89 e5                	mov    %esp,%ebp
  100ff3:	53                   	push   %ebx
  100ff4:	83 ec 10             	sub    $0x10,%esp
  100ff7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100ffa:	6a 41                	push   $0x41
  100ffc:	e8 17 f6 ff ff       	call   100618 <putChar>
  101001:	e8 d6 f6 ff ff       	call   1006dc <getpid>
  101006:	89 c2                	mov    %eax,%edx
  101008:	c1 e2 07             	shl    $0x7,%edx
  10100b:	01 c2                	add    %eax,%edx
  10100d:	8d 14 90             	lea    (%eax,%edx,4),%edx
  101010:	01 d2                	add    %edx,%edx
  101012:	01 d0                	add    %edx,%eax
  101014:	ff 0c c5 00 4a 10 00 	decl   0x104a00(,%eax,8)
  10101b:	e8 18 fd ff ff       	call   100d38 <block_decrease>
  101020:	89 1c 24             	mov    %ebx,(%esp)
  101023:	e8 a0 fb ff ff       	call   100bc8 <checkTimeCount>
  101028:	83 c4 10             	add    $0x10,%esp
  10102b:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  101032:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101035:	c9                   	leave  
  101036:	e9 dd f5 ff ff       	jmp    100618 <putChar>
  10103b:	90                   	nop

0010103c <irqHandle>:
  10103c:	55                   	push   %ebp
  10103d:	89 e5                	mov    %esp,%ebp
  10103f:	83 ec 08             	sub    $0x8,%esp
  101042:	8b 55 08             	mov    0x8(%ebp),%edx
  101045:	fa                   	cli    
  101046:	8b 42 20             	mov    0x20(%edx),%eax
  101049:	83 f8 0d             	cmp    $0xd,%eax
  10104c:	74 46                	je     101094 <irqHandle+0x58>
  10104e:	7e 2c                	jle    10107c <irqHandle+0x40>
  101050:	83 f8 20             	cmp    $0x20,%eax
  101053:	74 17                	je     10106c <irqHandle+0x30>
  101055:	83 c0 80             	add    $0xffffff80,%eax
  101058:	75 25                	jne    10107f <irqHandle+0x43>
  10105a:	83 ec 0c             	sub    $0xc,%esp
  10105d:	52                   	push   %edx
  10105e:	e8 e1 fe ff ff       	call   100f44 <syscallHandle>
  101063:	83 c4 10             	add    $0x10,%esp
  101066:	fb                   	sti    
  101067:	c9                   	leave  
  101068:	c3                   	ret    
  101069:	8d 76 00             	lea    0x0(%esi),%esi
  10106c:	83 ec 0c             	sub    $0xc,%esp
  10106f:	52                   	push   %edx
  101070:	e8 7b ff ff ff       	call   100ff0 <timeHandle>
  101075:	83 c4 10             	add    $0x10,%esp
  101078:	eb ec                	jmp    101066 <irqHandle+0x2a>
  10107a:	66 90                	xchg   %ax,%ax
  10107c:	40                   	inc    %eax
  10107d:	74 e7                	je     101066 <irqHandle+0x2a>
  10107f:	83 ec 08             	sub    $0x8,%esp
  101082:	6a 24                	push   $0x24
  101084:	68 05 16 10 00       	push   $0x101605
  101089:	e8 0a 03 00 00       	call   101398 <abort>
  10108e:	83 c4 10             	add    $0x10,%esp
  101091:	eb d3                	jmp    101066 <irqHandle+0x2a>
  101093:	90                   	nop
  101094:	83 ec 0c             	sub    $0xc,%esp
  101097:	52                   	push   %edx
  101098:	e8 03 ff ff ff       	call   100fa0 <GProtectFaultHandle>
  10109d:	83 c4 10             	add    $0x10,%esp
  1010a0:	eb c4                	jmp    101066 <irqHandle+0x2a>
  1010a2:	66 90                	xchg   %ax,%ax

001010a4 <initIntr>:
  1010a4:	55                   	push   %ebp
  1010a5:	89 e5                	mov    %esp,%ebp
  1010a7:	ba 21 00 00 00       	mov    $0x21,%edx
  1010ac:	b0 ff                	mov    $0xff,%al
  1010ae:	ee                   	out    %al,(%dx)
  1010af:	ba a1 00 00 00       	mov    $0xa1,%edx
  1010b4:	ee                   	out    %al,(%dx)
  1010b5:	ba 20 00 00 00       	mov    $0x20,%edx
  1010ba:	b0 11                	mov    $0x11,%al
  1010bc:	ee                   	out    %al,(%dx)
  1010bd:	ba 21 00 00 00       	mov    $0x21,%edx
  1010c2:	b0 20                	mov    $0x20,%al
  1010c4:	ee                   	out    %al,(%dx)
  1010c5:	b0 04                	mov    $0x4,%al
  1010c7:	ee                   	out    %al,(%dx)
  1010c8:	b0 03                	mov    $0x3,%al
  1010ca:	ee                   	out    %al,(%dx)
  1010cb:	ba a0 00 00 00       	mov    $0xa0,%edx
  1010d0:	b0 11                	mov    $0x11,%al
  1010d2:	ee                   	out    %al,(%dx)
  1010d3:	ba a1 00 00 00       	mov    $0xa1,%edx
  1010d8:	b0 28                	mov    $0x28,%al
  1010da:	ee                   	out    %al,(%dx)
  1010db:	b0 02                	mov    $0x2,%al
  1010dd:	ee                   	out    %al,(%dx)
  1010de:	b0 03                	mov    $0x3,%al
  1010e0:	ee                   	out    %al,(%dx)
  1010e1:	ba 20 00 00 00       	mov    $0x20,%edx
  1010e6:	b0 68                	mov    $0x68,%al
  1010e8:	ee                   	out    %al,(%dx)
  1010e9:	b0 0a                	mov    $0xa,%al
  1010eb:	ee                   	out    %al,(%dx)
  1010ec:	ba a0 00 00 00       	mov    $0xa0,%edx
  1010f1:	b0 68                	mov    $0x68,%al
  1010f3:	ee                   	out    %al,(%dx)
  1010f4:	b0 0a                	mov    $0xa,%al
  1010f6:	ee                   	out    %al,(%dx)
  1010f7:	5d                   	pop    %ebp
  1010f8:	c3                   	ret    
  1010f9:	8d 76 00             	lea    0x0(%esi),%esi

001010fc <initTimer>:
  1010fc:	55                   	push   %ebp
  1010fd:	89 e5                	mov    %esp,%ebp
  1010ff:	ba 43 00 00 00       	mov    $0x43,%edx
  101104:	b0 34                	mov    $0x34,%al
  101106:	ee                   	out    %al,(%dx)
  101107:	ba 40 00 00 00       	mov    $0x40,%edx
  10110c:	b0 9b                	mov    $0x9b,%al
  10110e:	ee                   	out    %al,(%dx)
  10110f:	b0 2e                	mov    $0x2e,%al
  101111:	ee                   	out    %al,(%dx)
  101112:	5d                   	pop    %ebp
  101113:	c3                   	ret    

00101114 <i2A>:
  101114:	55                   	push   %ebp
  101115:	89 e5                	mov    %esp,%ebp
  101117:	57                   	push   %edi
  101118:	56                   	push   %esi
  101119:	53                   	push   %ebx
  10111a:	51                   	push   %ecx
  10111b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10111e:	85 c9                	test   %ecx,%ecx
  101120:	78 6e                	js     101190 <i2A+0x7c>
  101122:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  101126:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  10112a:	bb 7e 21 10 00       	mov    $0x10217e,%ebx
  10112f:	31 ff                	xor    %edi,%edi
  101131:	eb 03                	jmp    101136 <i2A+0x22>
  101133:	90                   	nop
  101134:	89 f7                	mov    %esi,%edi
  101136:	4b                   	dec    %ebx
  101137:	89 c8                	mov    %ecx,%eax
  101139:	be 0a 00 00 00       	mov    $0xa,%esi
  10113e:	99                   	cltd   
  10113f:	f7 fe                	idiv   %esi
  101141:	83 c2 30             	add    $0x30,%edx
  101144:	88 13                	mov    %dl,(%ebx)
  101146:	8d 77 01             	lea    0x1(%edi),%esi
  101149:	b8 67 66 66 66       	mov    $0x66666667,%eax
  10114e:	f7 e9                	imul   %ecx
  101150:	89 d0                	mov    %edx,%eax
  101152:	c1 f8 02             	sar    $0x2,%eax
  101155:	c1 f9 1f             	sar    $0x1f,%ecx
  101158:	29 c8                	sub    %ecx,%eax
  10115a:	89 c1                	mov    %eax,%ecx
  10115c:	75 d6                	jne    101134 <i2A+0x20>
  10115e:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  101162:	74 20                	je     101184 <i2A+0x70>
  101164:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  101168:	75 06                	jne    101170 <i2A+0x5c>
  10116a:	fe 05 7d 21 10 00    	incb   0x10217d
  101170:	c6 05 7e 21 10 00 00 	movb   $0x0,0x10217e
  101177:	8b 45 0c             	mov    0xc(%ebp),%eax
  10117a:	89 18                	mov    %ebx,(%eax)
  10117c:	89 f0                	mov    %esi,%eax
  10117e:	5a                   	pop    %edx
  10117f:	5b                   	pop    %ebx
  101180:	5e                   	pop    %esi
  101181:	5f                   	pop    %edi
  101182:	5d                   	pop    %ebp
  101183:	c3                   	ret    
  101184:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  101188:	8d 77 02             	lea    0x2(%edi),%esi
  10118b:	4b                   	dec    %ebx
  10118c:	eb d6                	jmp    101164 <i2A+0x50>
  10118e:	66 90                	xchg   %ax,%ax
  101190:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  101196:	74 0c                	je     1011a4 <i2A+0x90>
  101198:	f7 d9                	neg    %ecx
  10119a:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  10119e:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  1011a2:	eb 86                	jmp    10112a <i2A+0x16>
  1011a4:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  1011a9:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  1011ad:	eb ef                	jmp    10119e <i2A+0x8a>
  1011af:	90                   	nop

001011b0 <i2X>:
  1011b0:	55                   	push   %ebp
  1011b1:	89 e5                	mov    %esp,%ebp
  1011b3:	57                   	push   %edi
  1011b4:	56                   	push   %esi
  1011b5:	53                   	push   %ebx
  1011b6:	8b 55 08             	mov    0x8(%ebp),%edx
  1011b9:	b9 5d 21 10 00       	mov    $0x10215d,%ecx
  1011be:	31 c0                	xor    %eax,%eax
  1011c0:	40                   	inc    %eax
  1011c1:	89 d6                	mov    %edx,%esi
  1011c3:	83 e6 0f             	and    $0xf,%esi
  1011c6:	8d 5e f6             	lea    -0xa(%esi),%ebx
  1011c9:	89 cf                	mov    %ecx,%edi
  1011cb:	83 fb 05             	cmp    $0x5,%ebx
  1011ce:	77 4c                	ja     10121c <i2X+0x6c>
  1011d0:	ff 24 9d 44 16 10 00 	jmp    *0x101644(,%ebx,4)
  1011d7:	90                   	nop
  1011d8:	c6 01 65             	movb   $0x65,(%ecx)
  1011db:	90                   	nop
  1011dc:	49                   	dec    %ecx
  1011dd:	c1 ea 04             	shr    $0x4,%edx
  1011e0:	75 de                	jne    1011c0 <i2X+0x10>
  1011e2:	c6 05 5e 21 10 00 00 	movb   $0x0,0x10215e
  1011e9:	8b 55 0c             	mov    0xc(%ebp),%edx
  1011ec:	89 3a                	mov    %edi,(%edx)
  1011ee:	5b                   	pop    %ebx
  1011ef:	5e                   	pop    %esi
  1011f0:	5f                   	pop    %edi
  1011f1:	5d                   	pop    %ebp
  1011f2:	c3                   	ret    
  1011f3:	90                   	nop
  1011f4:	c6 01 64             	movb   $0x64,(%ecx)
  1011f7:	eb e3                	jmp    1011dc <i2X+0x2c>
  1011f9:	8d 76 00             	lea    0x0(%esi),%esi
  1011fc:	c6 01 63             	movb   $0x63,(%ecx)
  1011ff:	eb db                	jmp    1011dc <i2X+0x2c>
  101201:	8d 76 00             	lea    0x0(%esi),%esi
  101204:	c6 01 62             	movb   $0x62,(%ecx)
  101207:	eb d3                	jmp    1011dc <i2X+0x2c>
  101209:	8d 76 00             	lea    0x0(%esi),%esi
  10120c:	c6 01 61             	movb   $0x61,(%ecx)
  10120f:	eb cb                	jmp    1011dc <i2X+0x2c>
  101211:	8d 76 00             	lea    0x0(%esi),%esi
  101214:	c6 01 66             	movb   $0x66,(%ecx)
  101217:	eb c3                	jmp    1011dc <i2X+0x2c>
  101219:	8d 76 00             	lea    0x0(%esi),%esi
  10121c:	8d 5e 30             	lea    0x30(%esi),%ebx
  10121f:	88 19                	mov    %bl,(%ecx)
  101221:	eb b9                	jmp    1011dc <i2X+0x2c>
  101223:	90                   	nop

00101224 <printk>:
  101224:	55                   	push   %ebp
  101225:	89 e5                	mov    %esp,%ebp
  101227:	57                   	push   %edi
  101228:	56                   	push   %esi
  101229:	53                   	push   %ebx
  10122a:	83 ec 2c             	sub    $0x2c,%esp
  10122d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101230:	8a 11                	mov    (%ecx),%dl
  101232:	84 d2                	test   %dl,%dl
  101234:	0f 84 54 01 00 00    	je     10138e <printk+0x16a>
  10123a:	8d 45 0c             	lea    0xc(%ebp),%eax
  10123d:	31 ff                	xor    %edi,%edi
  10123f:	eb 18                	jmp    101259 <printk+0x35>
  101241:	8d 76 00             	lea    0x0(%esi),%esi
  101244:	8a 11                	mov    (%ecx),%dl
  101246:	89 cb                	mov    %ecx,%ebx
  101248:	88 97 80 21 10 00    	mov    %dl,0x102180(%edi)
  10124e:	47                   	inc    %edi
  10124f:	8d 4b 01             	lea    0x1(%ebx),%ecx
  101252:	8a 53 01             	mov    0x1(%ebx),%dl
  101255:	84 d2                	test   %dl,%dl
  101257:	74 72                	je     1012cb <printk+0xa7>
  101259:	80 fa 25             	cmp    $0x25,%dl
  10125c:	75 e6                	jne    101244 <printk+0x20>
  10125e:	8d 59 01             	lea    0x1(%ecx),%ebx
  101261:	8a 51 01             	mov    0x1(%ecx),%dl
  101264:	80 fa 64             	cmp    $0x64,%dl
  101267:	0f 84 bf 00 00 00    	je     10132c <printk+0x108>
  10126d:	0f 8e 01 01 00 00    	jle    101374 <printk+0x150>
  101273:	80 fa 73             	cmp    $0x73,%dl
  101276:	0f 84 84 00 00 00    	je     101300 <printk+0xdc>
  10127c:	80 fa 78             	cmp    $0x78,%dl
  10127f:	75 c7                	jne    101248 <printk+0x24>
  101281:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  101288:	8d 70 04             	lea    0x4(%eax),%esi
  10128b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10128e:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101291:	56                   	push   %esi
  101292:	ff 30                	pushl  (%eax)
  101294:	e8 17 ff ff ff       	call   1011b0 <i2X>
  101299:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  10129c:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  1012a2:	8a 11                	mov    (%ecx),%dl
  1012a4:	83 c4 08             	add    $0x8,%esp
  1012a7:	31 c0                	xor    %eax,%eax
  1012a9:	84 d2                	test   %dl,%dl
  1012ab:	74 0f                	je     1012bc <printk+0x98>
  1012ad:	8d 76 00             	lea    0x0(%esi),%esi
  1012b0:	40                   	inc    %eax
  1012b1:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1012b5:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  1012b8:	84 d2                	test   %dl,%dl
  1012ba:	75 f4                	jne    1012b0 <printk+0x8c>
  1012bc:	01 c7                	add    %eax,%edi
  1012be:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1012c1:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1012c4:	8a 53 01             	mov    0x1(%ebx),%dl
  1012c7:	84 d2                	test   %dl,%dl
  1012c9:	75 8e                	jne    101259 <printk+0x35>
  1012cb:	c6 87 80 21 10 00 00 	movb   $0x0,0x102180(%edi)
  1012d2:	0f be 05 80 21 10 00 	movsbl 0x102180,%eax
  1012d9:	bb 80 21 10 00       	mov    $0x102180,%ebx
  1012de:	84 c0                	test   %al,%al
  1012e0:	74 16                	je     1012f8 <printk+0xd4>
  1012e2:	66 90                	xchg   %ax,%ax
  1012e4:	83 ec 0c             	sub    $0xc,%esp
  1012e7:	50                   	push   %eax
  1012e8:	e8 2b f3 ff ff       	call   100618 <putChar>
  1012ed:	43                   	inc    %ebx
  1012ee:	0f be 03             	movsbl (%ebx),%eax
  1012f1:	83 c4 10             	add    $0x10,%esp
  1012f4:	84 c0                	test   %al,%al
  1012f6:	75 ec                	jne    1012e4 <printk+0xc0>
  1012f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1012fb:	5b                   	pop    %ebx
  1012fc:	5e                   	pop    %esi
  1012fd:	5f                   	pop    %edi
  1012fe:	5d                   	pop    %ebp
  1012ff:	c3                   	ret    
  101300:	8d 70 04             	lea    0x4(%eax),%esi
  101303:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101306:	8b 08                	mov    (%eax),%ecx
  101308:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  10130e:	8a 11                	mov    (%ecx),%dl
  101310:	31 c0                	xor    %eax,%eax
  101312:	84 d2                	test   %dl,%dl
  101314:	74 a6                	je     1012bc <printk+0x98>
  101316:	66 90                	xchg   %ax,%ax
  101318:	40                   	inc    %eax
  101319:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  10131d:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  101320:	84 d2                	test   %dl,%dl
  101322:	75 f4                	jne    101318 <printk+0xf4>
  101324:	01 c7                	add    %eax,%edi
  101326:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101329:	eb 96                	jmp    1012c1 <printk+0x9d>
  10132b:	90                   	nop
  10132c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  101333:	8d 70 04             	lea    0x4(%eax),%esi
  101336:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101339:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  10133c:	56                   	push   %esi
  10133d:	ff 30                	pushl  (%eax)
  10133f:	e8 d0 fd ff ff       	call   101114 <i2A>
  101344:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  101347:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  10134d:	8a 11                	mov    (%ecx),%dl
  10134f:	83 c4 08             	add    $0x8,%esp
  101352:	31 c0                	xor    %eax,%eax
  101354:	84 d2                	test   %dl,%dl
  101356:	0f 84 60 ff ff ff    	je     1012bc <printk+0x98>
  10135c:	40                   	inc    %eax
  10135d:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101361:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  101364:	84 d2                	test   %dl,%dl
  101366:	75 f4                	jne    10135c <printk+0x138>
  101368:	01 c7                	add    %eax,%edi
  10136a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10136d:	e9 4f ff ff ff       	jmp    1012c1 <printk+0x9d>
  101372:	66 90                	xchg   %ax,%ax
  101374:	80 fa 63             	cmp    $0x63,%dl
  101377:	0f 85 cb fe ff ff    	jne    101248 <printk+0x24>
  10137d:	8b 10                	mov    (%eax),%edx
  10137f:	88 97 80 21 10 00    	mov    %dl,0x102180(%edi)
  101385:	83 c0 04             	add    $0x4,%eax
  101388:	47                   	inc    %edi
  101389:	e9 c1 fe ff ff       	jmp    10124f <printk+0x2b>
  10138e:	31 ff                	xor    %edi,%edi
  101390:	e9 36 ff ff ff       	jmp    1012cb <printk+0xa7>
  101395:	66 90                	xchg   %ax,%ax
  101397:	90                   	nop

00101398 <abort>:
  101398:	55                   	push   %ebp
  101399:	89 e5                	mov    %esp,%ebp
  10139b:	57                   	push   %edi
  10139c:	56                   	push   %esi
  10139d:	53                   	push   %ebx
  10139e:	83 ec 1c             	sub    $0x1c,%esp
  1013a1:	8b 55 08             	mov    0x8(%ebp),%edx
  1013a4:	fa                   	cli    
  1013a5:	8a 02                	mov    (%edx),%al
  1013a7:	b9 32 20 10 00       	mov    $0x102032,%ecx
  1013ac:	84 c0                	test   %al,%al
  1013ae:	74 0b                	je     1013bb <abort+0x23>
  1013b0:	41                   	inc    %ecx
  1013b1:	42                   	inc    %edx
  1013b2:	88 41 ff             	mov    %al,-0x1(%ecx)
  1013b5:	8a 02                	mov    (%edx),%al
  1013b7:	84 c0                	test   %al,%al
  1013b9:	75 f5                	jne    1013b0 <abort+0x18>
  1013bb:	c6 01 3a             	movb   $0x3a,(%ecx)
  1013be:	bb 9d 29 10 00       	mov    $0x10299d,%ebx
  1013c3:	be 0a 00 00 00       	mov    $0xa,%esi
  1013c8:	bf 67 66 66 66       	mov    $0x66666667,%edi
  1013cd:	4b                   	dec    %ebx
  1013ce:	8b 45 0c             	mov    0xc(%ebp),%eax
  1013d1:	99                   	cltd   
  1013d2:	f7 fe                	idiv   %esi
  1013d4:	8d 42 30             	lea    0x30(%edx),%eax
  1013d7:	88 45 e7             	mov    %al,-0x19(%ebp)
  1013da:	88 03                	mov    %al,(%ebx)
  1013dc:	89 f8                	mov    %edi,%eax
  1013de:	f7 6d 0c             	imull  0xc(%ebp)
  1013e1:	c1 fa 02             	sar    $0x2,%edx
  1013e4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1013e7:	c1 f8 1f             	sar    $0x1f,%eax
  1013ea:	29 c2                	sub    %eax,%edx
  1013ec:	89 55 0c             	mov    %edx,0xc(%ebp)
  1013ef:	75 dc                	jne    1013cd <abort+0x35>
  1013f1:	41                   	inc    %ecx
  1013f2:	41                   	inc    %ecx
  1013f3:	43                   	inc    %ebx
  1013f4:	8a 45 e7             	mov    -0x19(%ebp),%al
  1013f7:	88 41 ff             	mov    %al,-0x1(%ecx)
  1013fa:	8a 03                	mov    (%ebx),%al
  1013fc:	88 45 e7             	mov    %al,-0x19(%ebp)
  1013ff:	84 c0                	test   %al,%al
  101401:	75 ef                	jne    1013f2 <abort+0x5a>
  101403:	c6 01 0a             	movb   $0xa,(%ecx)
  101406:	0f be 05 20 20 10 00 	movsbl 0x102020,%eax
  10140d:	84 c0                	test   %al,%al
  10140f:	74 1b                	je     10142c <abort+0x94>
  101411:	bb 20 20 10 00       	mov    $0x102020,%ebx
  101416:	83 ec 0c             	sub    $0xc,%esp
  101419:	50                   	push   %eax
  10141a:	e8 f9 f1 ff ff       	call   100618 <putChar>
  10141f:	43                   	inc    %ebx
  101420:	0f be 03             	movsbl (%ebx),%eax
  101423:	83 c4 10             	add    $0x10,%esp
  101426:	84 c0                	test   %al,%al
  101428:	75 ec                	jne    101416 <abort+0x7e>
  10142a:	66 90                	xchg   %ax,%ax
  10142c:	f4                   	hlt    
  10142d:	eb fd                	jmp    10142c <abort+0x94>

0010142f <irqEmpty>:
  10142f:	6a 00                	push   $0x0
  101431:	6a ff                	push   $0xffffffff
  101433:	eb 13                	jmp    101448 <asmDoIrq>

00101435 <irqGProtectFault>:
  101435:	6a 0d                	push   $0xd
  101437:	eb 0f                	jmp    101448 <asmDoIrq>

00101439 <irqSyscall>:
  101439:	6a 00                	push   $0x0
  10143b:	68 80 00 00 00       	push   $0x80
  101440:	eb 06                	jmp    101448 <asmDoIrq>

00101442 <irqTime>:
  101442:	6a 00                	push   $0x0
  101444:	6a 20                	push   $0x20
  101446:	eb 00                	jmp    101448 <asmDoIrq>

00101448 <asmDoIrq>:
  101448:	60                   	pusha  
  101449:	54                   	push   %esp
  10144a:	e8 ed fb ff ff       	call   10103c <irqHandle>
  10144f:	83 c4 04             	add    $0x4,%esp
  101452:	61                   	popa   
  101453:	83 c4 04             	add    $0x4,%esp
  101456:	83 c4 04             	add    $0x4,%esp
  101459:	cf                   	iret   
