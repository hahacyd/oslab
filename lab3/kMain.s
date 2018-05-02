
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 75 10 00 00       	call   101080 <initTimer>
  10000b:	e8 48 0d 00 00       	call   100d58 <init_pcb>
  100010:	e8 7f 0d 00 00       	call   100d94 <init_kernel_pcb>
  100015:	e8 be 05 00 00       	call   1005d8 <initSerial>
  10001a:	e8 c9 0d 00 00       	call   100de8 <initIdt>
  10001f:	e8 04 10 00 00       	call   101028 <initIntr>
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
  10003a:	a3 88 d7 12 01       	mov    %eax,0x112d788
  10003f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100042:	a3 84 d7 12 01       	mov    %eax,0x112d784
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
  1000df:	b9 40 d7 12 01       	mov    $0x112d740,%ecx
  1000e4:	66 c7 05 48 d7 12 01 	movw   $0xffff,0x112d748
  1000eb:	ff ff 
  1000ed:	66 c7 05 4a d7 12 01 	movw   $0x0,0x112d74a
  1000f4:	00 00 
  1000f6:	c6 05 4c d7 12 01 00 	movb   $0x0,0x112d74c
  1000fd:	c6 05 4d d7 12 01 9a 	movb   $0x9a,0x112d74d
  100104:	c6 05 4e d7 12 01 cf 	movb   $0xcf,0x112d74e
  10010b:	c6 05 4f d7 12 01 00 	movb   $0x0,0x112d74f
  100112:	66 c7 05 50 d7 12 01 	movw   $0xffff,0x112d750
  100119:	ff ff 
  10011b:	66 c7 05 52 d7 12 01 	movw   $0x0,0x112d752
  100122:	00 00 
  100124:	c6 05 54 d7 12 01 00 	movb   $0x0,0x112d754
  10012b:	c6 05 55 d7 12 01 92 	movb   $0x92,0x112d755
  100132:	c6 05 56 d7 12 01 cf 	movb   $0xcf,0x112d756
  100139:	c6 05 57 d7 12 01 00 	movb   $0x0,0x112d757
  100140:	66 c7 05 58 d7 12 01 	movw   $0xffff,0x112d758
  100147:	ff ff 
  100149:	66 c7 05 5a d7 12 01 	movw   $0x0,0x112d75a
  100150:	00 00 
  100152:	c6 05 5c d7 12 01 00 	movb   $0x0,0x112d75c
  100159:	c6 05 5d d7 12 01 fa 	movb   $0xfa,0x112d75d
  100160:	c6 05 5e d7 12 01 cf 	movb   $0xcf,0x112d75e
  100167:	c6 05 5f d7 12 01 00 	movb   $0x0,0x112d75f
  10016e:	66 c7 05 60 d7 12 01 	movw   $0xffff,0x112d760
  100175:	ff ff 
  100177:	66 c7 05 62 d7 12 01 	movw   $0x0,0x112d762
  10017e:	00 00 
  100180:	c6 05 64 d7 12 01 00 	movb   $0x0,0x112d764
  100187:	c6 05 65 d7 12 01 f2 	movb   $0xf2,0x112d765
  10018e:	c6 05 66 d7 12 01 cf 	movb   $0xcf,0x112d766
  100195:	c6 05 67 d7 12 01 00 	movb   $0x0,0x112d767
  10019c:	66 c7 05 68 d7 12 01 	movw   $0x63,0x112d768
  1001a3:	63 00 
  1001a5:	b8 80 d7 12 01       	mov    $0x112d780,%eax
  1001aa:	66 a3 6a d7 12 01    	mov    %ax,0x112d76a
  1001b0:	89 c2                	mov    %eax,%edx
  1001b2:	c1 ea 10             	shr    $0x10,%edx
  1001b5:	88 15 6c d7 12 01    	mov    %dl,0x112d76c
  1001bb:	c6 05 6d d7 12 01 89 	movb   $0x89,0x112d76d
  1001c2:	c6 05 6e d7 12 01 40 	movb   $0x40,0x112d76e
  1001c9:	c1 e8 18             	shr    $0x18,%eax
  1001cc:	a2 6f d7 12 01       	mov    %al,0x112d76f
  1001d1:	a1 e0 13 10 00       	mov    0x1013e0,%eax
  1001d6:	8b 15 e4 13 10 00    	mov    0x1013e4,%edx
  1001dc:	a3 70 d7 12 01       	mov    %eax,0x112d770
  1001e1:	89 15 74 d7 12 01    	mov    %edx,0x112d774
  1001e7:	66 c7 05 a0 2e 10 00 	movw   $0x37,0x102ea0
  1001ee:	37 00 
  1001f0:	66 89 0d a2 2e 10 00 	mov    %cx,0x102ea2
  1001f7:	c1 e9 10             	shr    $0x10,%ecx
  1001fa:	66 89 0d a4 2e 10 00 	mov    %cx,0x102ea4
  100201:	b8 a0 2e 10 00       	mov    $0x102ea0,%eax
  100206:	0f 01 10             	lgdtl  (%eax)
  100209:	a1 78 57 10 00       	mov    0x105778,%eax
  10020e:	a3 88 d7 12 01       	mov    %eax,0x112d788
  100213:	c7 05 84 d7 12 01 3f 	movl   $0x103f3f,0x112d784
  10021a:	3f 10 00 
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
  100257:	8d 04 85 40 37 10 00 	lea    0x103740(,%eax,4),%eax
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
  100286:	c7 05 24 37 10 00 01 	movl   $0x1,0x103724
  10028d:	00 00 00 
  100290:	c7 05 cc 77 10 00 23 	movl   $0x23,0x1077cc
  100297:	00 00 00 
  10029a:	c7 05 c8 77 10 00 00 	movl   $0x8000000,0x1077c8
  1002a1:	00 00 08 
  1002a4:	c7 05 c0 77 10 00 1b 	movl   $0x1b,0x1077c0
  1002ab:	00 00 00 
  1002ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1002b1:	a3 bc 77 10 00       	mov    %eax,0x1077bc
  1002b6:	c7 05 d4 77 10 00 0a 	movl   $0xa,0x1077d4
  1002bd:	00 00 00 
  1002c0:	6a 01                	push   $0x1
  1002c2:	e8 01 05 00 00       	call   1007c8 <put_into_runnable>
  1002c7:	a1 78 57 10 00       	mov    0x105778,%eax
  1002cc:	50                   	push   %eax
  1002cd:	a1 74 57 10 00       	mov    0x105774,%eax
  1002d2:	50                   	push   %eax
  1002d3:	9c                   	pushf  
  1002d4:	a1 6c 57 10 00       	mov    0x10576c,%eax
  1002d9:	50                   	push   %eax
  1002da:	a1 68 57 10 00       	mov    0x105768,%eax
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
  1003ce:	e8 11 05 00 00       	call   1008e4 <put_into_block>
  1003d3:	c7 04 24 e8 13 10 00 	movl   $0x1013e8,(%esp)
  1003da:	e8 c9 0d 00 00       	call   1011a8 <printk>
  1003df:	e8 f8 02 00 00       	call   1006dc <getpid>
  1003e4:	89 c2                	mov    %eax,%edx
  1003e6:	c1 e2 07             	shl    $0x7,%edx
  1003e9:	01 c2                	add    %eax,%edx
  1003eb:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1003ee:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1003f1:	8b 34 85 84 57 10 00 	mov    0x105784(,%eax,4),%esi
  1003f8:	e8 df 02 00 00       	call   1006dc <getpid>
  1003fd:	5a                   	pop    %edx
  1003fe:	59                   	pop    %ecx
  1003ff:	56                   	push   %esi
  100400:	50                   	push   %eax
  100401:	68 34 14 10 00       	push   $0x101434
  100406:	6a 09                	push   $0x9
  100408:	68 ee 13 10 00       	push   $0x1013ee
  10040d:	68 10 14 10 00       	push   $0x101410
  100412:	e8 91 0d 00 00       	call   1011a8 <printk>
  100417:	83 c4 14             	add    $0x14,%esp
  10041a:	68 0a 14 10 00       	push   $0x10140a
  10041f:	e8 84 0d 00 00       	call   1011a8 <printk>
  100424:	e8 e3 02 00 00       	call   10070c <get_from_runnable>
  100429:	5e                   	pop    %esi
  10042a:	5a                   	pop    %edx
  10042b:	53                   	push   %ebx
  10042c:	50                   	push   %eax
  10042d:	e8 72 02 00 00       	call   1006a4 <put_into_running>
  100432:	b8 01 00 00 00       	mov    $0x1,%eax
  100437:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10043a:	5b                   	pop    %ebx
  10043b:	5e                   	pop    %esi
  10043c:	5d                   	pop    %ebp
  10043d:	c3                   	ret    
  10043e:	66 90                	xchg   %ax,%ax

00100440 <sys_fork>:
  100440:	55                   	push   %ebp
  100441:	89 e5                	mov    %esp,%ebp
  100443:	57                   	push   %edi
  100444:	56                   	push   %esi
  100445:	8b 75 08             	mov    0x8(%ebp),%esi
  100448:	83 ec 0c             	sub    $0xc,%esp
  10044b:	68 3e 14 10 00       	push   $0x10143e
  100450:	e8 53 0d 00 00       	call   1011a8 <printk>
  100455:	b8 e8 97 10 00       	mov    $0x1097e8,%eax
  10045a:	b9 0f 00 00 00       	mov    $0xf,%ecx
  10045f:	89 c7                	mov    %eax,%edi
  100461:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100463:	c7 05 04 98 10 00 00 	movl   $0x0,0x109804
  10046a:	00 00 00 
  10046d:	c7 05 1c 98 10 00 00 	movl   $0x7e00000,0x10981c
  100474:	00 e0 07 
  100477:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  10047e:	e8 45 03 00 00       	call   1007c8 <put_into_runnable>
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
  10049d:	8b 15 a8 2e 10 00    	mov    0x102ea8,%edx
  1004a3:	8b 0d ac 2e 10 00    	mov    0x102eac,%ecx
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
  1004cb:	c7 05 a8 2e 10 00 00 	movl   $0x0,0x102ea8
  1004d2:	00 00 00 
  1004d5:	41                   	inc    %ecx
  1004d6:	89 0d ac 2e 10 00    	mov    %ecx,0x102eac
  1004dc:	b8 01 00 00 00       	mov    $0x1,%eax
  1004e1:	5b                   	pop    %ebx
  1004e2:	5f                   	pop    %edi
  1004e3:	5d                   	pop    %ebp
  1004e4:	c3                   	ret    
  1004e5:	8d 76 00             	lea    0x0(%esi),%esi
  1004e8:	89 15 a8 2e 10 00    	mov    %edx,0x102ea8
  1004ee:	b8 01 00 00 00       	mov    $0x1,%eax
  1004f3:	5b                   	pop    %ebx
  1004f4:	5f                   	pop    %edi
  1004f5:	5d                   	pop    %ebp
  1004f6:	c3                   	ret    
  1004f7:	90                   	nop
  1004f8:	c7 05 a8 2e 10 00 00 	movl   $0x0,0x102ea8
  1004ff:	00 00 00 
  100502:	ff 05 ac 2e 10 00    	incl   0x102eac
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
  10056c:	68 5a 14 10 00       	push   $0x10145a
  100571:	e8 a6 0d 00 00       	call   10131c <abort>
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
  100647:	a3 20 37 10 00       	mov    %eax,0x103720
  10064c:	c1 e0 07             	shl    $0x7,%eax
  10064f:	01 d8                	add    %ebx,%eax
  100651:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100654:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100657:	8d 34 85 40 57 10 00 	lea    0x105740(,%eax,4),%esi
  10065e:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100663:	89 d7                	mov    %edx,%edi
  100665:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100667:	68 e8 13 10 00       	push   $0x1013e8
  10066c:	e8 37 0b 00 00       	call   1011a8 <printk>
  100671:	89 1c 24             	mov    %ebx,(%esp)
  100674:	68 78 15 10 00       	push   $0x101578
  100679:	6a 12                	push   $0x12
  10067b:	68 76 14 10 00       	push   $0x101476
  100680:	68 84 14 10 00       	push   $0x101484
  100685:	e8 1e 0b 00 00       	call   1011a8 <printk>
  10068a:	83 c4 14             	add    $0x14,%esp
  10068d:	68 0a 14 10 00       	push   $0x10140a
  100692:	e8 11 0b 00 00       	call   1011a8 <printk>
  100697:	83 c4 10             	add    $0x10,%esp
  10069a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10069d:	5b                   	pop    %ebx
  10069e:	5e                   	pop    %esi
  10069f:	5f                   	pop    %edi
  1006a0:	5d                   	pop    %ebp
  1006a1:	c3                   	ret    
  1006a2:	66 90                	xchg   %ax,%ax

001006a4 <put_into_running>:
  1006a4:	55                   	push   %ebp
  1006a5:	89 e5                	mov    %esp,%ebp
  1006a7:	83 ec 08             	sub    $0x8,%esp
  1006aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1006ad:	39 05 20 37 10 00    	cmp    %eax,0x103720
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
  1006df:	a1 20 37 10 00       	mov    0x103720,%eax
  1006e4:	5d                   	pop    %ebp
  1006e5:	c3                   	ret    
  1006e6:	66 90                	xchg   %ax,%ax

001006e8 <getrunnable>:
  1006e8:	55                   	push   %ebp
  1006e9:	89 e5                	mov    %esp,%ebp
  1006eb:	a1 84 2d 10 00       	mov    0x102d84,%eax
  1006f0:	5d                   	pop    %ebp
  1006f1:	c3                   	ret    
  1006f2:	66 90                	xchg   %ax,%ax

001006f4 <getblocked>:
  1006f4:	55                   	push   %ebp
  1006f5:	89 e5                	mov    %esp,%ebp
  1006f7:	a1 80 2d 10 00       	mov    0x102d80,%eax
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
  100711:	8b 1d 84 2d 10 00    	mov    0x102d84,%ebx
  100717:	83 fb ff             	cmp    $0xffffffff,%ebx
  10071a:	0f 84 a0 00 00 00    	je     1007c0 <get_from_runnable+0xb4>
  100720:	89 d8                	mov    %ebx,%eax
  100722:	c1 e0 07             	shl    $0x7,%eax
  100725:	01 d8                	add    %ebx,%eax
  100727:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10072a:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10072d:	8d 14 85 40 37 10 00 	lea    0x103740(,%eax,4),%edx
  100734:	8b 82 50 20 00 00    	mov    0x2050(%edx),%eax
  10073a:	39 d8                	cmp    %ebx,%eax
  10073c:	74 76                	je     1007b4 <get_from_runnable+0xa8>
  10073e:	8b 92 4c 20 00 00    	mov    0x204c(%edx),%edx
  100744:	89 d1                	mov    %edx,%ecx
  100746:	c1 e1 07             	shl    $0x7,%ecx
  100749:	01 d1                	add    %edx,%ecx
  10074b:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  10074e:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100751:	89 04 8d 90 57 10 00 	mov    %eax,0x105790(,%ecx,4)
  100758:	89 c1                	mov    %eax,%ecx
  10075a:	c1 e1 07             	shl    $0x7,%ecx
  10075d:	01 c1                	add    %eax,%ecx
  10075f:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  100762:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  100765:	89 14 8d 8c 57 10 00 	mov    %edx,0x10578c(,%ecx,4)
  10076c:	a3 84 2d 10 00       	mov    %eax,0x102d84
  100771:	83 ec 0c             	sub    $0xc,%esp
  100774:	68 e8 13 10 00       	push   $0x1013e8
  100779:	e8 2a 0a 00 00       	call   1011a8 <printk>
  10077e:	58                   	pop    %eax
  10077f:	5a                   	pop    %edx
  100780:	ff 35 84 2d 10 00    	pushl  0x102d84
  100786:	53                   	push   %ebx
  100787:	68 54 15 10 00       	push   $0x101554
  10078c:	6a 71                	push   $0x71
  10078e:	68 76 14 10 00       	push   $0x101476
  100793:	68 bc 14 10 00       	push   $0x1014bc
  100798:	e8 0b 0a 00 00       	call   1011a8 <printk>
  10079d:	83 c4 14             	add    $0x14,%esp
  1007a0:	68 0a 14 10 00       	push   $0x10140a
  1007a5:	e8 fe 09 00 00       	call   1011a8 <printk>
  1007aa:	83 c4 10             	add    $0x10,%esp
  1007ad:	89 d8                	mov    %ebx,%eax
  1007af:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1007b2:	c9                   	leave  
  1007b3:	c3                   	ret    
  1007b4:	c7 05 84 2d 10 00 ff 	movl   $0xffffffff,0x102d84
  1007bb:	ff ff ff 
  1007be:	eb b1                	jmp    100771 <get_from_runnable+0x65>
  1007c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007c5:	eb e8                	jmp    1007af <get_from_runnable+0xa3>
  1007c7:	90                   	nop

001007c8 <put_into_runnable>:
  1007c8:	55                   	push   %ebp
  1007c9:	89 e5                	mov    %esp,%ebp
  1007cb:	56                   	push   %esi
  1007cc:	53                   	push   %ebx
  1007cd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1007d0:	a1 84 2d 10 00       	mov    0x102d84,%eax
  1007d5:	83 f8 ff             	cmp    $0xffffffff,%eax
  1007d8:	0f 84 da 00 00 00    	je     1008b8 <put_into_runnable+0xf0>
  1007de:	89 c2                	mov    %eax,%edx
  1007e0:	c1 e2 07             	shl    $0x7,%edx
  1007e3:	01 c2                	add    %eax,%edx
  1007e5:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1007e8:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1007eb:	8d 34 95 40 37 10 00 	lea    0x103740(,%edx,4),%esi
  1007f2:	8b 96 4c 20 00 00    	mov    0x204c(%esi),%edx
  1007f8:	89 d1                	mov    %edx,%ecx
  1007fa:	c1 e1 07             	shl    $0x7,%ecx
  1007fd:	01 d1                	add    %edx,%ecx
  1007ff:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100802:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100805:	89 1c 8d 90 57 10 00 	mov    %ebx,0x105790(,%ecx,4)
  10080c:	89 d9                	mov    %ebx,%ecx
  10080e:	c1 e1 07             	shl    $0x7,%ecx
  100811:	01 d9                	add    %ebx,%ecx
  100813:	8d 0c 8b             	lea    (%ebx,%ecx,4),%ecx
  100816:	8d 0c 8b             	lea    (%ebx,%ecx,4),%ecx
  100819:	8d 0c 8d 40 37 10 00 	lea    0x103740(,%ecx,4),%ecx
  100820:	89 91 4c 20 00 00    	mov    %edx,0x204c(%ecx)
  100826:	89 81 50 20 00 00    	mov    %eax,0x2050(%ecx)
  10082c:	89 9e 4c 20 00 00    	mov    %ebx,0x204c(%esi)
  100832:	89 d8                	mov    %ebx,%eax
  100834:	c1 e0 07             	shl    $0x7,%eax
  100837:	01 d8                	add    %ebx,%eax
  100839:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10083c:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10083f:	c7 04 85 7c 57 10 00 	movl   $0x1,0x10577c(,%eax,4)
  100846:	01 00 00 00 
  10084a:	85 db                	test   %ebx,%ebx
  10084c:	75 0a                	jne    100858 <put_into_runnable+0x90>
  10084e:	c7 05 68 57 10 00 34 	movl   $0x100634,0x105768
  100855:	06 10 00 
  100858:	83 ec 0c             	sub    $0xc,%esp
  10085b:	68 e8 13 10 00       	push   $0x1013e8
  100860:	e8 43 09 00 00       	call   1011a8 <printk>
  100865:	58                   	pop    %eax
  100866:	5a                   	pop    %edx
  100867:	53                   	push   %ebx
  100868:	ff 35 84 2d 10 00    	pushl  0x102d84
  10086e:	68 40 15 10 00       	push   $0x101540
  100873:	68 8f 00 00 00       	push   $0x8f
  100878:	68 76 14 10 00       	push   $0x101476
  10087d:	68 f0 14 10 00       	push   $0x1014f0
  100882:	e8 21 09 00 00       	call   1011a8 <printk>
  100887:	83 c4 14             	add    $0x14,%esp
  10088a:	68 0a 14 10 00       	push   $0x10140a
  10088f:	e8 14 09 00 00       	call   1011a8 <printk>
  100894:	89 d8                	mov    %ebx,%eax
  100896:	c1 e0 07             	shl    $0x7,%eax
  100899:	01 d8                	add    %ebx,%eax
  10089b:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10089e:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1008a1:	c7 04 85 80 57 10 00 	movl   $0xa,0x105780(,%eax,4)
  1008a8:	0a 00 00 00 
  1008ac:	b8 01 00 00 00       	mov    $0x1,%eax
  1008b1:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1008b4:	5b                   	pop    %ebx
  1008b5:	5e                   	pop    %esi
  1008b6:	5d                   	pop    %ebp
  1008b7:	c3                   	ret    
  1008b8:	89 1d 84 2d 10 00    	mov    %ebx,0x102d84
  1008be:	89 d8                	mov    %ebx,%eax
  1008c0:	c1 e0 07             	shl    $0x7,%eax
  1008c3:	01 d8                	add    %ebx,%eax
  1008c5:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1008c8:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1008cb:	8d 04 85 40 37 10 00 	lea    0x103740(,%eax,4),%eax
  1008d2:	89 98 4c 20 00 00    	mov    %ebx,0x204c(%eax)
  1008d8:	89 98 50 20 00 00    	mov    %ebx,0x2050(%eax)
  1008de:	e9 4f ff ff ff       	jmp    100832 <put_into_runnable+0x6a>
  1008e3:	90                   	nop

001008e4 <put_into_block>:
  1008e4:	55                   	push   %ebp
  1008e5:	89 e5                	mov    %esp,%ebp
  1008e7:	57                   	push   %edi
  1008e8:	56                   	push   %esi
  1008e9:	53                   	push   %ebx
  1008ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1008ed:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  1008f0:	8b 15 80 2d 10 00    	mov    0x102d80,%edx
  1008f6:	83 fa ff             	cmp    $0xffffffff,%edx
  1008f9:	0f 84 95 00 00 00    	je     100994 <put_into_block+0xb0>
  1008ff:	89 d1                	mov    %edx,%ecx
  100901:	c1 e1 07             	shl    $0x7,%ecx
  100904:	01 d1                	add    %edx,%ecx
  100906:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100909:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  10090c:	8d 3c 8d 40 37 10 00 	lea    0x103740(,%ecx,4),%edi
  100913:	8b 8f 4c 20 00 00    	mov    0x204c(%edi),%ecx
  100919:	89 ce                	mov    %ecx,%esi
  10091b:	c1 e6 07             	shl    $0x7,%esi
  10091e:	01 ce                	add    %ecx,%esi
  100920:	8d 34 b1             	lea    (%ecx,%esi,4),%esi
  100923:	8d 34 b1             	lea    (%ecx,%esi,4),%esi
  100926:	89 04 b5 90 57 10 00 	mov    %eax,0x105790(,%esi,4)
  10092d:	89 c6                	mov    %eax,%esi
  10092f:	c1 e6 07             	shl    $0x7,%esi
  100932:	01 c6                	add    %eax,%esi
  100934:	8d 34 b0             	lea    (%eax,%esi,4),%esi
  100937:	8d 34 b0             	lea    (%eax,%esi,4),%esi
  10093a:	8d 34 b5 40 37 10 00 	lea    0x103740(,%esi,4),%esi
  100941:	89 8e 4c 20 00 00    	mov    %ecx,0x204c(%esi)
  100947:	89 96 50 20 00 00    	mov    %edx,0x2050(%esi)
  10094d:	89 87 4c 20 00 00    	mov    %eax,0x204c(%edi)
  100953:	89 c2                	mov    %eax,%edx
  100955:	c1 e2 07             	shl    $0x7,%edx
  100958:	01 c2                	add    %eax,%edx
  10095a:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10095d:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100960:	c1 e2 02             	shl    $0x2,%edx
  100963:	8d 82 40 57 10 00    	lea    0x105740(%edx),%eax
  100969:	b9 0f 00 00 00       	mov    $0xf,%ecx
  10096e:	89 c7                	mov    %eax,%edi
  100970:	89 de                	mov    %ebx,%esi
  100972:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100974:	8b 43 10             	mov    0x10(%ebx),%eax
  100977:	89 82 84 57 10 00    	mov    %eax,0x105784(%edx)
  10097d:	c7 82 7c 57 10 00 00 	movl   $0x0,0x10577c(%edx)
  100984:	00 00 00 
  100987:	b8 01 00 00 00       	mov    $0x1,%eax
  10098c:	5b                   	pop    %ebx
  10098d:	5e                   	pop    %esi
  10098e:	5f                   	pop    %edi
  10098f:	5d                   	pop    %ebp
  100990:	c3                   	ret    
  100991:	8d 76 00             	lea    0x0(%esi),%esi
  100994:	a3 80 2d 10 00       	mov    %eax,0x102d80
  100999:	89 c2                	mov    %eax,%edx
  10099b:	c1 e2 07             	shl    $0x7,%edx
  10099e:	01 c2                	add    %eax,%edx
  1009a0:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1009a3:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1009a6:	8d 14 95 40 37 10 00 	lea    0x103740(,%edx,4),%edx
  1009ad:	89 82 50 20 00 00    	mov    %eax,0x2050(%edx)
  1009b3:	89 82 4c 20 00 00    	mov    %eax,0x204c(%edx)
  1009b9:	eb 98                	jmp    100953 <put_into_block+0x6f>
  1009bb:	90                   	nop

001009bc <get_from>:
  1009bc:	55                   	push   %ebp
  1009bd:	89 e5                	mov    %esp,%ebp
  1009bf:	56                   	push   %esi
  1009c0:	53                   	push   %ebx
  1009c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1009c4:	8b 75 0c             	mov    0xc(%ebp),%esi
  1009c7:	85 db                	test   %ebx,%ebx
  1009c9:	0f 8e f5 00 00 00    	jle    100ac4 <get_from+0x108>
  1009cf:	39 f3                	cmp    %esi,%ebx
  1009d1:	74 3d                	je     100a10 <get_from+0x54>
  1009d3:	89 d8                	mov    %ebx,%eax
  1009d5:	c1 e0 07             	shl    $0x7,%eax
  1009d8:	01 d8                	add    %ebx,%eax
  1009da:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1009dd:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1009e0:	8b 14 85 90 57 10 00 	mov    0x105790(,%eax,4),%edx
  1009e7:	39 d3                	cmp    %edx,%ebx
  1009e9:	75 21                	jne    100a0c <get_from+0x50>
  1009eb:	e9 d4 00 00 00       	jmp    100ac4 <get_from+0x108>
  1009f0:	89 d1                	mov    %edx,%ecx
  1009f2:	c1 e1 07             	shl    $0x7,%ecx
  1009f5:	01 d1                	add    %edx,%ecx
  1009f7:	8d 04 8a             	lea    (%edx,%ecx,4),%eax
  1009fa:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1009fd:	8b 14 85 90 57 10 00 	mov    0x105790(,%eax,4),%edx
  100a04:	39 d3                	cmp    %edx,%ebx
  100a06:	0f 84 b8 00 00 00    	je     100ac4 <get_from+0x108>
  100a0c:	39 f2                	cmp    %esi,%edx
  100a0e:	75 e0                	jne    1009f0 <get_from+0x34>
  100a10:	89 f0                	mov    %esi,%eax
  100a12:	c1 e0 07             	shl    $0x7,%eax
  100a15:	01 f0                	add    %esi,%eax
  100a17:	8d 04 86             	lea    (%esi,%eax,4),%eax
  100a1a:	8d 04 86             	lea    (%esi,%eax,4),%eax
  100a1d:	8b 04 85 7c 57 10 00 	mov    0x10577c(,%eax,4),%eax
  100a24:	85 c0                	test   %eax,%eax
  100a26:	0f 84 bc 00 00 00    	je     100ae8 <get_from+0x12c>
  100a2c:	48                   	dec    %eax
  100a2d:	75 79                	jne    100aa8 <get_from+0xec>
  100a2f:	be 84 2d 10 00       	mov    $0x102d84,%esi
  100a34:	3b 1e                	cmp    (%esi),%ebx
  100a36:	74 15                	je     100a4d <get_from+0x91>
  100a38:	83 ec 08             	sub    $0x8,%esp
  100a3b:	68 d0 00 00 00       	push   $0xd0
  100a40:	68 76 14 10 00       	push   $0x101476
  100a45:	e8 d2 08 00 00       	call   10131c <abort>
  100a4a:	83 c4 10             	add    $0x10,%esp
  100a4d:	89 d8                	mov    %ebx,%eax
  100a4f:	c1 e0 07             	shl    $0x7,%eax
  100a52:	01 d8                	add    %ebx,%eax
  100a54:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100a57:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100a5a:	8d 14 85 40 37 10 00 	lea    0x103740(,%eax,4),%edx
  100a61:	8b 82 50 20 00 00    	mov    0x2050(%edx),%eax
  100a67:	39 d8                	cmp    %ebx,%eax
  100a69:	0f 84 85 00 00 00    	je     100af4 <get_from+0x138>
  100a6f:	8b 92 4c 20 00 00    	mov    0x204c(%edx),%edx
  100a75:	89 d1                	mov    %edx,%ecx
  100a77:	c1 e1 07             	shl    $0x7,%ecx
  100a7a:	01 d1                	add    %edx,%ecx
  100a7c:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100a7f:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100a82:	89 04 8d 90 57 10 00 	mov    %eax,0x105790(,%ecx,4)
  100a89:	89 c1                	mov    %eax,%ecx
  100a8b:	c1 e1 07             	shl    $0x7,%ecx
  100a8e:	01 c1                	add    %eax,%ecx
  100a90:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  100a93:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  100a96:	89 14 8d 8c 57 10 00 	mov    %edx,0x10578c(,%ecx,4)
  100a9d:	89 06                	mov    %eax,(%esi)
  100a9f:	89 d8                	mov    %ebx,%eax
  100aa1:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100aa4:	5b                   	pop    %ebx
  100aa5:	5e                   	pop    %esi
  100aa6:	5d                   	pop    %ebp
  100aa7:	c3                   	ret    
  100aa8:	83 ec 08             	sub    $0x8,%esp
  100aab:	68 cc 00 00 00       	push   $0xcc
  100ab0:	68 76 14 10 00       	push   $0x101476
  100ab5:	e8 62 08 00 00       	call   10131c <abort>
  100aba:	a1 00 00 00 00       	mov    0x0,%eax
  100abf:	0f 0b                	ud2    
  100ac1:	8d 76 00             	lea    0x0(%esi),%esi
  100ac4:	83 ec 08             	sub    $0x8,%esp
  100ac7:	68 bd 00 00 00       	push   $0xbd
  100acc:	68 76 14 10 00       	push   $0x101476
  100ad1:	e8 46 08 00 00       	call   10131c <abort>
  100ad6:	83 c4 10             	add    $0x10,%esp
  100ad9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100ade:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100ae1:	5b                   	pop    %ebx
  100ae2:	5e                   	pop    %esi
  100ae3:	5d                   	pop    %ebp
  100ae4:	c3                   	ret    
  100ae5:	8d 76 00             	lea    0x0(%esi),%esi
  100ae8:	be 80 2d 10 00       	mov    $0x102d80,%esi
  100aed:	e9 42 ff ff ff       	jmp    100a34 <get_from+0x78>
  100af2:	66 90                	xchg   %ax,%ax
  100af4:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100afa:	89 d8                	mov    %ebx,%eax
  100afc:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100aff:	5b                   	pop    %ebx
  100b00:	5e                   	pop    %esi
  100b01:	5d                   	pop    %ebp
  100b02:	c3                   	ret    
  100b03:	90                   	nop

00100b04 <get_from_block>:
  100b04:	55                   	push   %ebp
  100b05:	89 e5                	mov    %esp,%ebp
  100b07:	83 ec 10             	sub    $0x10,%esp
  100b0a:	ff 75 08             	pushl  0x8(%ebp)
  100b0d:	ff 35 80 2d 10 00    	pushl  0x102d80
  100b13:	e8 a4 fe ff ff       	call   1009bc <get_from>
  100b18:	83 c4 10             	add    $0x10,%esp
  100b1b:	40                   	inc    %eax
  100b1c:	74 0a                	je     100b28 <get_from_block+0x24>
  100b1e:	b8 01 00 00 00       	mov    $0x1,%eax
  100b23:	c9                   	leave  
  100b24:	c3                   	ret    
  100b25:	8d 76 00             	lea    0x0(%esi),%esi
  100b28:	83 ec 08             	sub    $0x8,%esp
  100b2b:	68 07 01 00 00       	push   $0x107
  100b30:	68 76 14 10 00       	push   $0x101476
  100b35:	e8 e2 07 00 00       	call   10131c <abort>
  100b3a:	83 c4 10             	add    $0x10,%esp
  100b3d:	b8 01 00 00 00       	mov    $0x1,%eax
  100b42:	c9                   	leave  
  100b43:	c3                   	ret    

00100b44 <check_block>:
  100b44:	55                   	push   %ebp
  100b45:	89 e5                	mov    %esp,%ebp
  100b47:	56                   	push   %esi
  100b48:	53                   	push   %ebx
  100b49:	a1 80 2d 10 00       	mov    0x102d80,%eax
  100b4e:	89 c3                	mov    %eax,%ebx
  100b50:	83 f8 ff             	cmp    $0xffffffff,%eax
  100b53:	74 4c                	je     100ba1 <check_block+0x5d>
  100b55:	89 c2                	mov    %eax,%edx
  100b57:	c1 e2 07             	shl    $0x7,%edx
  100b5a:	01 c2                	add    %eax,%edx
  100b5c:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100b5f:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100b62:	8d 34 95 40 37 10 00 	lea    0x103740(,%edx,4),%esi
  100b69:	eb 0a                	jmp    100b75 <check_block+0x31>
  100b6b:	90                   	nop
  100b6c:	39 c3                	cmp    %eax,%ebx
  100b6e:	74 2c                	je     100b9c <check_block+0x58>
  100b70:	83 f8 ff             	cmp    $0xffffffff,%eax
  100b73:	74 27                	je     100b9c <check_block+0x58>
  100b75:	8b 96 44 20 00 00    	mov    0x2044(%esi),%edx
  100b7b:	85 d2                	test   %edx,%edx
  100b7d:	7f ed                	jg     100b6c <check_block+0x28>
  100b7f:	83 ec 0c             	sub    $0xc,%esp
  100b82:	53                   	push   %ebx
  100b83:	e8 7c ff ff ff       	call   100b04 <get_from_block>
  100b88:	89 1c 24             	mov    %ebx,(%esp)
  100b8b:	e8 38 fc ff ff       	call   1007c8 <put_into_runnable>
  100b90:	83 c4 10             	add    $0x10,%esp
  100b93:	a1 80 2d 10 00       	mov    0x102d80,%eax
  100b98:	39 c3                	cmp    %eax,%ebx
  100b9a:	75 d4                	jne    100b70 <check_block+0x2c>
  100b9c:	bb 01 00 00 00       	mov    $0x1,%ebx
  100ba1:	89 d8                	mov    %ebx,%eax
  100ba3:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100ba6:	5b                   	pop    %ebx
  100ba7:	5e                   	pop    %esi
  100ba8:	5d                   	pop    %ebp
  100ba9:	c3                   	ret    
  100baa:	66 90                	xchg   %ax,%ax

00100bac <checkTimeCount>:
  100bac:	a1 24 37 10 00       	mov    0x103724,%eax
  100bb1:	85 c0                	test   %eax,%eax
  100bb3:	0f 84 fb 00 00 00    	je     100cb4 <checkTimeCount+0x108>
  100bb9:	55                   	push   %ebp
  100bba:	89 e5                	mov    %esp,%ebp
  100bbc:	57                   	push   %edi
  100bbd:	56                   	push   %esi
  100bbe:	83 ec 0c             	sub    $0xc,%esp
  100bc1:	68 e8 13 10 00       	push   $0x1013e8
  100bc6:	e8 dd 05 00 00       	call   1011a8 <printk>
  100bcb:	58                   	pop    %eax
  100bcc:	ff 35 20 37 10 00    	pushl  0x103720
  100bd2:	68 68 15 10 00       	push   $0x101568
  100bd7:	6a 1f                	push   $0x1f
  100bd9:	68 76 14 10 00       	push   $0x101476
  100bde:	68 a2 14 10 00       	push   $0x1014a2
  100be3:	e8 c0 05 00 00       	call   1011a8 <printk>
  100be8:	83 c4 14             	add    $0x14,%esp
  100beb:	68 0a 14 10 00       	push   $0x10140a
  100bf0:	e8 b3 05 00 00       	call   1011a8 <printk>
  100bf5:	c7 04 24 e8 13 10 00 	movl   $0x1013e8,(%esp)
  100bfc:	e8 a7 05 00 00       	call   1011a8 <printk>
  100c01:	5a                   	pop    %edx
  100c02:	a1 20 37 10 00       	mov    0x103720,%eax
  100c07:	89 c2                	mov    %eax,%edx
  100c09:	c1 e2 07             	shl    $0x7,%edx
  100c0c:	01 c2                	add    %eax,%edx
  100c0e:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c11:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100c14:	ff 34 85 80 57 10 00 	pushl  0x105780(,%eax,4)
  100c1b:	68 68 15 10 00       	push   $0x101568
  100c20:	6a 20                	push   $0x20
  100c22:	68 76 14 10 00       	push   $0x101476
  100c27:	68 20 15 10 00       	push   $0x101520
  100c2c:	e8 77 05 00 00       	call   1011a8 <printk>
  100c31:	83 c4 14             	add    $0x14,%esp
  100c34:	68 0a 14 10 00       	push   $0x10140a
  100c39:	e8 6a 05 00 00       	call   1011a8 <printk>
  100c3e:	e8 01 ff ff ff       	call   100b44 <check_block>
  100c43:	8b 15 20 37 10 00    	mov    0x103720,%edx
  100c49:	89 d0                	mov    %edx,%eax
  100c4b:	c1 e0 07             	shl    $0x7,%eax
  100c4e:	01 d0                	add    %edx,%eax
  100c50:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100c53:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100c56:	c1 e0 02             	shl    $0x2,%eax
  100c59:	83 c4 10             	add    $0x10,%esp
  100c5c:	8b 88 80 57 10 00    	mov    0x105780(%eax),%ecx
  100c62:	85 c9                	test   %ecx,%ecx
  100c64:	7e 0e                	jle    100c74 <checkTimeCount+0xc8>
  100c66:	b8 01 00 00 00       	mov    $0x1,%eax
  100c6b:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100c6e:	5e                   	pop    %esi
  100c6f:	5f                   	pop    %edi
  100c70:	5d                   	pop    %ebp
  100c71:	c3                   	ret    
  100c72:	66 90                	xchg   %ax,%ax
  100c74:	05 40 57 10 00       	add    $0x105740,%eax
  100c79:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100c7e:	89 c7                	mov    %eax,%edi
  100c80:	8b 75 08             	mov    0x8(%ebp),%esi
  100c83:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100c85:	83 ec 0c             	sub    $0xc,%esp
  100c88:	52                   	push   %edx
  100c89:	e8 3a fb ff ff       	call   1007c8 <put_into_runnable>
  100c8e:	e8 79 fa ff ff       	call   10070c <get_from_runnable>
  100c93:	83 c4 10             	add    $0x10,%esp
  100c96:	3b 05 20 37 10 00    	cmp    0x103720,%eax
  100c9c:	74 c8                	je     100c66 <checkTimeCount+0xba>
  100c9e:	8b 55 08             	mov    0x8(%ebp),%edx
  100ca1:	e8 96 f9 ff ff       	call   10063c <put_into_running.part.0>
  100ca6:	b8 01 00 00 00       	mov    $0x1,%eax
  100cab:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100cae:	5e                   	pop    %esi
  100caf:	5f                   	pop    %edi
  100cb0:	5d                   	pop    %ebp
  100cb1:	c3                   	ret    
  100cb2:	66 90                	xchg   %ax,%ax
  100cb4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100cb9:	c3                   	ret    
  100cba:	66 90                	xchg   %ax,%ax

00100cbc <check_is_in>:
  100cbc:	55                   	push   %ebp
  100cbd:	89 e5                	mov    %esp,%ebp
  100cbf:	53                   	push   %ebx
  100cc0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100cc3:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100cc6:	85 c9                	test   %ecx,%ecx
  100cc8:	7e 42                	jle    100d0c <check_is_in+0x50>
  100cca:	39 d9                	cmp    %ebx,%ecx
  100ccc:	74 36                	je     100d04 <check_is_in+0x48>
  100cce:	89 c8                	mov    %ecx,%eax
  100cd0:	c1 e0 07             	shl    $0x7,%eax
  100cd3:	01 c8                	add    %ecx,%eax
  100cd5:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100cd8:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100cdb:	8b 04 85 90 57 10 00 	mov    0x105790(,%eax,4),%eax
  100ce2:	39 c1                	cmp    %eax,%ecx
  100ce4:	75 1a                	jne    100d00 <check_is_in+0x44>
  100ce6:	eb 24                	jmp    100d0c <check_is_in+0x50>
  100ce8:	89 c2                	mov    %eax,%edx
  100cea:	c1 e2 07             	shl    $0x7,%edx
  100ced:	01 c2                	add    %eax,%edx
  100cef:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100cf2:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100cf5:	8b 04 85 90 57 10 00 	mov    0x105790(,%eax,4),%eax
  100cfc:	39 c1                	cmp    %eax,%ecx
  100cfe:	74 0c                	je     100d0c <check_is_in+0x50>
  100d00:	39 c3                	cmp    %eax,%ebx
  100d02:	75 e4                	jne    100ce8 <check_is_in+0x2c>
  100d04:	b8 01 00 00 00       	mov    $0x1,%eax
  100d09:	5b                   	pop    %ebx
  100d0a:	5d                   	pop    %ebp
  100d0b:	c3                   	ret    
  100d0c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100d11:	5b                   	pop    %ebx
  100d12:	5d                   	pop    %ebp
  100d13:	c3                   	ret    

00100d14 <block_decrease>:
  100d14:	55                   	push   %ebp
  100d15:	89 e5                	mov    %esp,%ebp
  100d17:	8b 0d 80 2d 10 00    	mov    0x102d80,%ecx
  100d1d:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100d20:	74 2d                	je     100d4f <block_decrease+0x3b>
  100d22:	89 c8                	mov    %ecx,%eax
  100d24:	89 c2                	mov    %eax,%edx
  100d26:	c1 e2 07             	shl    $0x7,%edx
  100d29:	01 c2                	add    %eax,%edx
  100d2b:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100d2e:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100d31:	8d 04 85 40 37 10 00 	lea    0x103740(,%eax,4),%eax
  100d38:	ff 88 44 20 00 00    	decl   0x2044(%eax)
  100d3e:	8b 80 50 20 00 00    	mov    0x2050(%eax),%eax
  100d44:	39 c1                	cmp    %eax,%ecx
  100d46:	75 dc                	jne    100d24 <block_decrease+0x10>
  100d48:	b8 01 00 00 00       	mov    $0x1,%eax
  100d4d:	5d                   	pop    %ebp
  100d4e:	c3                   	ret    
  100d4f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100d54:	5d                   	pop    %ebp
  100d55:	c3                   	ret    
  100d56:	66 90                	xchg   %ax,%ax

00100d58 <init_pcb>:
  100d58:	55                   	push   %ebp
  100d59:	89 e5                	mov    %esp,%ebp
  100d5b:	ba 88 57 10 00       	mov    $0x105788,%edx
  100d60:	31 c0                	xor    %eax,%eax
  100d62:	66 90                	xchg   %ax,%ax
  100d64:	89 02                	mov    %eax,(%edx)
  100d66:	8d 48 ff             	lea    -0x1(%eax),%ecx
  100d69:	89 4a 04             	mov    %ecx,0x4(%edx)
  100d6c:	40                   	inc    %eax
  100d6d:	89 42 08             	mov    %eax,0x8(%edx)
  100d70:	81 c2 54 20 00 00    	add    $0x2054,%edx
  100d76:	3d 00 08 00 00       	cmp    $0x800,%eax
  100d7b:	75 e7                	jne    100d64 <init_pcb+0xc>
  100d7d:	c7 05 8c 57 10 00 ff 	movl   $0x7ff,0x10578c
  100d84:	07 00 00 
  100d87:	c7 05 3c d7 12 01 00 	movl   $0x0,0x112d73c
  100d8e:	00 00 00 
  100d91:	5d                   	pop    %ebp
  100d92:	c3                   	ret    
  100d93:	90                   	nop

00100d94 <init_kernel_pcb>:
  100d94:	55                   	push   %ebp
  100d95:	89 e5                	mov    %esp,%ebp
  100d97:	c7 05 78 57 10 00 10 	movl   $0x10,0x105778
  100d9e:	00 00 00 
  100da1:	c7 05 6c 57 10 00 08 	movl   $0x8,0x10576c
  100da8:	00 00 00 
  100dab:	c7 05 68 57 10 00 34 	movl   $0x100634,0x105768
  100db2:	06 10 00 
  100db5:	c7 05 74 57 10 00 00 	movl   $0x7f00000,0x105774
  100dbc:	00 f0 07 
  100dbf:	c7 05 7c 57 10 00 01 	movl   $0x1,0x10577c
  100dc6:	00 00 00 
  100dc9:	c7 05 80 57 10 00 04 	movl   $0x4,0x105780
  100dd0:	00 00 00 
  100dd3:	b8 01 00 00 00       	mov    $0x1,%eax
  100dd8:	5d                   	pop    %ebp
  100dd9:	c3                   	ret    
  100dda:	66 90                	xchg   %ax,%ax

00100ddc <transfer_pid_state>:
  100ddc:	55                   	push   %ebp
  100ddd:	89 e5                	mov    %esp,%ebp
  100ddf:	b8 01 00 00 00       	mov    $0x1,%eax
  100de4:	5d                   	pop    %ebp
  100de5:	c3                   	ret    
  100de6:	66 90                	xchg   %ax,%ax

00100de8 <initIdt>:
  100de8:	55                   	push   %ebp
  100de9:	89 e5                	mov    %esp,%ebp
  100deb:	53                   	push   %ebx
  100dec:	ba b3 13 10 00       	mov    $0x1013b3,%edx
  100df1:	89 d3                	mov    %edx,%ebx
  100df3:	c1 ea 10             	shr    $0x10,%edx
  100df6:	b9 00 e0 12 01       	mov    $0x112e000,%ecx
  100dfb:	b8 00 d8 12 01       	mov    $0x112d800,%eax
  100e00:	66 89 18             	mov    %bx,(%eax)
  100e03:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100e09:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100e0d:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100e11:	66 89 50 06          	mov    %dx,0x6(%eax)
  100e15:	83 c0 08             	add    $0x8,%eax
  100e18:	39 c1                	cmp    %eax,%ecx
  100e1a:	75 e4                	jne    100e00 <initIdt+0x18>
  100e1c:	b8 b9 13 10 00       	mov    $0x1013b9,%eax
  100e21:	66 a3 68 d8 12 01    	mov    %ax,0x112d868
  100e27:	66 c7 05 6a d8 12 01 	movw   $0x8,0x112d86a
  100e2e:	08 00 
  100e30:	c6 05 6c d8 12 01 00 	movb   $0x0,0x112d86c
  100e37:	c6 05 6d d8 12 01 8f 	movb   $0x8f,0x112d86d
  100e3e:	c1 e8 10             	shr    $0x10,%eax
  100e41:	66 a3 6e d8 12 01    	mov    %ax,0x112d86e
  100e47:	b8 bd 13 10 00       	mov    $0x1013bd,%eax
  100e4c:	66 a3 00 dc 12 01    	mov    %ax,0x112dc00
  100e52:	66 c7 05 02 dc 12 01 	movw   $0x8,0x112dc02
  100e59:	08 00 
  100e5b:	c6 05 04 dc 12 01 00 	movb   $0x0,0x112dc04
  100e62:	c6 05 05 dc 12 01 ee 	movb   $0xee,0x112dc05
  100e69:	c1 e8 10             	shr    $0x10,%eax
  100e6c:	66 a3 06 dc 12 01    	mov    %ax,0x112dc06
  100e72:	b8 c6 13 10 00       	mov    $0x1013c6,%eax
  100e77:	66 a3 00 d9 12 01    	mov    %ax,0x112d900
  100e7d:	66 c7 05 02 d9 12 01 	movw   $0x8,0x112d902
  100e84:	08 00 
  100e86:	c6 05 04 d9 12 01 00 	movb   $0x0,0x112d904
  100e8d:	c6 05 05 d9 12 01 8e 	movb   $0x8e,0x112d905
  100e94:	c1 e8 10             	shr    $0x10,%eax
  100e97:	66 a3 06 d9 12 01    	mov    %ax,0x112d906
  100e9d:	66 c7 05 b0 2e 10 00 	movw   $0x7ff,0x102eb0
  100ea4:	ff 07 
  100ea6:	b8 00 d8 12 01       	mov    $0x112d800,%eax
  100eab:	66 a3 b2 2e 10 00    	mov    %ax,0x102eb2
  100eb1:	c1 e8 10             	shr    $0x10,%eax
  100eb4:	66 a3 b4 2e 10 00    	mov    %ax,0x102eb4
  100eba:	b8 b0 2e 10 00       	mov    $0x102eb0,%eax
  100ebf:	0f 01 18             	lidtl  (%eax)
  100ec2:	5b                   	pop    %ebx
  100ec3:	5d                   	pop    %ebp
  100ec4:	c3                   	ret    
  100ec5:	66 90                	xchg   %ax,%ax
  100ec7:	90                   	nop

00100ec8 <syscallHandle>:
  100ec8:	55                   	push   %ebp
  100ec9:	89 e5                	mov    %esp,%ebp
  100ecb:	53                   	push   %ebx
  100ecc:	50                   	push   %eax
  100ecd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100ed0:	8b 43 1c             	mov    0x1c(%ebx),%eax
  100ed3:	83 f8 02             	cmp    $0x2,%eax
  100ed6:	74 28                	je     100f00 <syscallHandle+0x38>
  100ed8:	76 3a                	jbe    100f14 <syscallHandle+0x4c>
  100eda:	83 f8 04             	cmp    $0x4,%eax
  100edd:	74 15                	je     100ef4 <syscallHandle+0x2c>
  100edf:	3d e6 00 00 00       	cmp    $0xe6,%eax
  100ee4:	75 29                	jne    100f0f <syscallHandle+0x47>
  100ee6:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100ee9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100eec:	c9                   	leave  
  100eed:	e9 ca f4 ff ff       	jmp    1003bc <sys_sleep>
  100ef2:	66 90                	xchg   %ax,%ax
  100ef4:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100ef7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100efa:	c9                   	leave  
  100efb:	e9 8c f6 ff ff       	jmp    10058c <sys_write>
  100f00:	83 ec 0c             	sub    $0xc,%esp
  100f03:	53                   	push   %ebx
  100f04:	e8 37 f5 ff ff       	call   100440 <sys_fork>
  100f09:	89 43 1c             	mov    %eax,0x1c(%ebx)
  100f0c:	83 c4 10             	add    $0x10,%esp
  100f0f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100f12:	c9                   	leave  
  100f13:	c3                   	ret    
  100f14:	48                   	dec    %eax
  100f15:	75 f8                	jne    100f0f <syscallHandle+0x47>
  100f17:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100f1a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100f1d:	c9                   	leave  
  100f1e:	e9 79 f4 ff ff       	jmp    10039c <sys_exit>
  100f23:	90                   	nop

00100f24 <GProtectFaultHandle>:
  100f24:	55                   	push   %ebp
  100f25:	89 e5                	mov    %esp,%ebp
  100f27:	83 ec 14             	sub    $0x14,%esp
  100f2a:	68 e8 13 10 00       	push   $0x1013e8
  100f2f:	e8 74 02 00 00       	call   1011a8 <printk>
  100f34:	58                   	pop    %eax
  100f35:	8b 45 08             	mov    0x8(%ebp),%eax
  100f38:	ff 70 20             	pushl  0x20(%eax)
  100f3b:	68 b4 15 10 00       	push   $0x1015b4
  100f40:	6a 49                	push   $0x49
  100f42:	68 89 15 10 00       	push   $0x101589
  100f47:	68 9c 15 10 00       	push   $0x10159c
  100f4c:	e8 57 02 00 00       	call   1011a8 <printk>
  100f51:	83 c4 14             	add    $0x14,%esp
  100f54:	68 0a 14 10 00       	push   $0x10140a
  100f59:	e8 4a 02 00 00       	call   1011a8 <printk>
  100f5e:	5a                   	pop    %edx
  100f5f:	59                   	pop    %ecx
  100f60:	6a 4a                	push   $0x4a
  100f62:	68 89 15 10 00       	push   $0x101589
  100f67:	e8 b0 03 00 00       	call   10131c <abort>
  100f6c:	83 c4 10             	add    $0x10,%esp
  100f6f:	c9                   	leave  
  100f70:	c3                   	ret    
  100f71:	8d 76 00             	lea    0x0(%esi),%esi

00100f74 <timeHandle>:
  100f74:	55                   	push   %ebp
  100f75:	89 e5                	mov    %esp,%ebp
  100f77:	53                   	push   %ebx
  100f78:	83 ec 10             	sub    $0x10,%esp
  100f7b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100f7e:	6a 41                	push   $0x41
  100f80:	e8 93 f6 ff ff       	call   100618 <putChar>
  100f85:	e8 52 f7 ff ff       	call   1006dc <getpid>
  100f8a:	89 c2                	mov    %eax,%edx
  100f8c:	c1 e2 07             	shl    $0x7,%edx
  100f8f:	01 c2                	add    %eax,%edx
  100f91:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100f94:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100f97:	ff 0c 85 80 57 10 00 	decl   0x105780(,%eax,4)
  100f9e:	e8 71 fd ff ff       	call   100d14 <block_decrease>
  100fa3:	89 1c 24             	mov    %ebx,(%esp)
  100fa6:	e8 01 fc ff ff       	call   100bac <checkTimeCount>
  100fab:	83 c4 10             	add    $0x10,%esp
  100fae:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  100fb5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100fb8:	c9                   	leave  
  100fb9:	e9 5a f6 ff ff       	jmp    100618 <putChar>
  100fbe:	66 90                	xchg   %ax,%ax

00100fc0 <irqHandle>:
  100fc0:	55                   	push   %ebp
  100fc1:	89 e5                	mov    %esp,%ebp
  100fc3:	83 ec 08             	sub    $0x8,%esp
  100fc6:	8b 55 08             	mov    0x8(%ebp),%edx
  100fc9:	fa                   	cli    
  100fca:	8b 42 20             	mov    0x20(%edx),%eax
  100fcd:	83 f8 0d             	cmp    $0xd,%eax
  100fd0:	74 46                	je     101018 <irqHandle+0x58>
  100fd2:	7e 2c                	jle    101000 <irqHandle+0x40>
  100fd4:	83 f8 20             	cmp    $0x20,%eax
  100fd7:	74 17                	je     100ff0 <irqHandle+0x30>
  100fd9:	83 c0 80             	add    $0xffffff80,%eax
  100fdc:	75 25                	jne    101003 <irqHandle+0x43>
  100fde:	83 ec 0c             	sub    $0xc,%esp
  100fe1:	52                   	push   %edx
  100fe2:	e8 e1 fe ff ff       	call   100ec8 <syscallHandle>
  100fe7:	83 c4 10             	add    $0x10,%esp
  100fea:	fb                   	sti    
  100feb:	c9                   	leave  
  100fec:	c3                   	ret    
  100fed:	8d 76 00             	lea    0x0(%esi),%esi
  100ff0:	83 ec 0c             	sub    $0xc,%esp
  100ff3:	52                   	push   %edx
  100ff4:	e8 7b ff ff ff       	call   100f74 <timeHandle>
  100ff9:	83 c4 10             	add    $0x10,%esp
  100ffc:	eb ec                	jmp    100fea <irqHandle+0x2a>
  100ffe:	66 90                	xchg   %ax,%ax
  101000:	40                   	inc    %eax
  101001:	74 e7                	je     100fea <irqHandle+0x2a>
  101003:	83 ec 08             	sub    $0x8,%esp
  101006:	6a 24                	push   $0x24
  101008:	68 89 15 10 00       	push   $0x101589
  10100d:	e8 0a 03 00 00       	call   10131c <abort>
  101012:	83 c4 10             	add    $0x10,%esp
  101015:	eb d3                	jmp    100fea <irqHandle+0x2a>
  101017:	90                   	nop
  101018:	83 ec 0c             	sub    $0xc,%esp
  10101b:	52                   	push   %edx
  10101c:	e8 03 ff ff ff       	call   100f24 <GProtectFaultHandle>
  101021:	83 c4 10             	add    $0x10,%esp
  101024:	eb c4                	jmp    100fea <irqHandle+0x2a>
  101026:	66 90                	xchg   %ax,%ax

00101028 <initIntr>:
  101028:	55                   	push   %ebp
  101029:	89 e5                	mov    %esp,%ebp
  10102b:	ba 21 00 00 00       	mov    $0x21,%edx
  101030:	b0 ff                	mov    $0xff,%al
  101032:	ee                   	out    %al,(%dx)
  101033:	ba a1 00 00 00       	mov    $0xa1,%edx
  101038:	ee                   	out    %al,(%dx)
  101039:	ba 20 00 00 00       	mov    $0x20,%edx
  10103e:	b0 11                	mov    $0x11,%al
  101040:	ee                   	out    %al,(%dx)
  101041:	ba 21 00 00 00       	mov    $0x21,%edx
  101046:	b0 20                	mov    $0x20,%al
  101048:	ee                   	out    %al,(%dx)
  101049:	b0 04                	mov    $0x4,%al
  10104b:	ee                   	out    %al,(%dx)
  10104c:	b0 03                	mov    $0x3,%al
  10104e:	ee                   	out    %al,(%dx)
  10104f:	ba a0 00 00 00       	mov    $0xa0,%edx
  101054:	b0 11                	mov    $0x11,%al
  101056:	ee                   	out    %al,(%dx)
  101057:	ba a1 00 00 00       	mov    $0xa1,%edx
  10105c:	b0 28                	mov    $0x28,%al
  10105e:	ee                   	out    %al,(%dx)
  10105f:	b0 02                	mov    $0x2,%al
  101061:	ee                   	out    %al,(%dx)
  101062:	b0 03                	mov    $0x3,%al
  101064:	ee                   	out    %al,(%dx)
  101065:	ba 20 00 00 00       	mov    $0x20,%edx
  10106a:	b0 68                	mov    $0x68,%al
  10106c:	ee                   	out    %al,(%dx)
  10106d:	b0 0a                	mov    $0xa,%al
  10106f:	ee                   	out    %al,(%dx)
  101070:	ba a0 00 00 00       	mov    $0xa0,%edx
  101075:	b0 68                	mov    $0x68,%al
  101077:	ee                   	out    %al,(%dx)
  101078:	b0 0a                	mov    $0xa,%al
  10107a:	ee                   	out    %al,(%dx)
  10107b:	5d                   	pop    %ebp
  10107c:	c3                   	ret    
  10107d:	8d 76 00             	lea    0x0(%esi),%esi

00101080 <initTimer>:
  101080:	55                   	push   %ebp
  101081:	89 e5                	mov    %esp,%ebp
  101083:	ba 43 00 00 00       	mov    $0x43,%edx
  101088:	b0 34                	mov    $0x34,%al
  10108a:	ee                   	out    %al,(%dx)
  10108b:	ba 40 00 00 00       	mov    $0x40,%edx
  101090:	b0 9b                	mov    $0x9b,%al
  101092:	ee                   	out    %al,(%dx)
  101093:	b0 2e                	mov    $0x2e,%al
  101095:	ee                   	out    %al,(%dx)
  101096:	5d                   	pop    %ebp
  101097:	c3                   	ret    

00101098 <i2A>:
  101098:	55                   	push   %ebp
  101099:	89 e5                	mov    %esp,%ebp
  10109b:	57                   	push   %edi
  10109c:	56                   	push   %esi
  10109d:	53                   	push   %ebx
  10109e:	51                   	push   %ecx
  10109f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1010a2:	85 c9                	test   %ecx,%ecx
  1010a4:	78 6e                	js     101114 <i2A+0x7c>
  1010a6:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  1010aa:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  1010ae:	bb fe 2e 10 00       	mov    $0x102efe,%ebx
  1010b3:	31 ff                	xor    %edi,%edi
  1010b5:	eb 03                	jmp    1010ba <i2A+0x22>
  1010b7:	90                   	nop
  1010b8:	89 f7                	mov    %esi,%edi
  1010ba:	4b                   	dec    %ebx
  1010bb:	89 c8                	mov    %ecx,%eax
  1010bd:	be 0a 00 00 00       	mov    $0xa,%esi
  1010c2:	99                   	cltd   
  1010c3:	f7 fe                	idiv   %esi
  1010c5:	83 c2 30             	add    $0x30,%edx
  1010c8:	88 13                	mov    %dl,(%ebx)
  1010ca:	8d 77 01             	lea    0x1(%edi),%esi
  1010cd:	b8 67 66 66 66       	mov    $0x66666667,%eax
  1010d2:	f7 e9                	imul   %ecx
  1010d4:	89 d0                	mov    %edx,%eax
  1010d6:	c1 f8 02             	sar    $0x2,%eax
  1010d9:	c1 f9 1f             	sar    $0x1f,%ecx
  1010dc:	29 c8                	sub    %ecx,%eax
  1010de:	89 c1                	mov    %eax,%ecx
  1010e0:	75 d6                	jne    1010b8 <i2A+0x20>
  1010e2:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  1010e6:	74 20                	je     101108 <i2A+0x70>
  1010e8:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  1010ec:	75 06                	jne    1010f4 <i2A+0x5c>
  1010ee:	fe 05 fd 2e 10 00    	incb   0x102efd
  1010f4:	c6 05 fe 2e 10 00 00 	movb   $0x0,0x102efe
  1010fb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1010fe:	89 18                	mov    %ebx,(%eax)
  101100:	89 f0                	mov    %esi,%eax
  101102:	5a                   	pop    %edx
  101103:	5b                   	pop    %ebx
  101104:	5e                   	pop    %esi
  101105:	5f                   	pop    %edi
  101106:	5d                   	pop    %ebp
  101107:	c3                   	ret    
  101108:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  10110c:	8d 77 02             	lea    0x2(%edi),%esi
  10110f:	4b                   	dec    %ebx
  101110:	eb d6                	jmp    1010e8 <i2A+0x50>
  101112:	66 90                	xchg   %ax,%ax
  101114:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  10111a:	74 0c                	je     101128 <i2A+0x90>
  10111c:	f7 d9                	neg    %ecx
  10111e:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  101122:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  101126:	eb 86                	jmp    1010ae <i2A+0x16>
  101128:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  10112d:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101131:	eb ef                	jmp    101122 <i2A+0x8a>
  101133:	90                   	nop

00101134 <i2X>:
  101134:	55                   	push   %ebp
  101135:	89 e5                	mov    %esp,%ebp
  101137:	57                   	push   %edi
  101138:	56                   	push   %esi
  101139:	53                   	push   %ebx
  10113a:	8b 55 08             	mov    0x8(%ebp),%edx
  10113d:	b9 dd 2e 10 00       	mov    $0x102edd,%ecx
  101142:	31 c0                	xor    %eax,%eax
  101144:	40                   	inc    %eax
  101145:	89 d6                	mov    %edx,%esi
  101147:	83 e6 0f             	and    $0xf,%esi
  10114a:	8d 5e f6             	lea    -0xa(%esi),%ebx
  10114d:	89 cf                	mov    %ecx,%edi
  10114f:	83 fb 05             	cmp    $0x5,%ebx
  101152:	77 4c                	ja     1011a0 <i2X+0x6c>
  101154:	ff 24 9d c8 15 10 00 	jmp    *0x1015c8(,%ebx,4)
  10115b:	90                   	nop
  10115c:	c6 01 65             	movb   $0x65,(%ecx)
  10115f:	90                   	nop
  101160:	49                   	dec    %ecx
  101161:	c1 ea 04             	shr    $0x4,%edx
  101164:	75 de                	jne    101144 <i2X+0x10>
  101166:	c6 05 de 2e 10 00 00 	movb   $0x0,0x102ede
  10116d:	8b 55 0c             	mov    0xc(%ebp),%edx
  101170:	89 3a                	mov    %edi,(%edx)
  101172:	5b                   	pop    %ebx
  101173:	5e                   	pop    %esi
  101174:	5f                   	pop    %edi
  101175:	5d                   	pop    %ebp
  101176:	c3                   	ret    
  101177:	90                   	nop
  101178:	c6 01 64             	movb   $0x64,(%ecx)
  10117b:	eb e3                	jmp    101160 <i2X+0x2c>
  10117d:	8d 76 00             	lea    0x0(%esi),%esi
  101180:	c6 01 63             	movb   $0x63,(%ecx)
  101183:	eb db                	jmp    101160 <i2X+0x2c>
  101185:	8d 76 00             	lea    0x0(%esi),%esi
  101188:	c6 01 62             	movb   $0x62,(%ecx)
  10118b:	eb d3                	jmp    101160 <i2X+0x2c>
  10118d:	8d 76 00             	lea    0x0(%esi),%esi
  101190:	c6 01 61             	movb   $0x61,(%ecx)
  101193:	eb cb                	jmp    101160 <i2X+0x2c>
  101195:	8d 76 00             	lea    0x0(%esi),%esi
  101198:	c6 01 66             	movb   $0x66,(%ecx)
  10119b:	eb c3                	jmp    101160 <i2X+0x2c>
  10119d:	8d 76 00             	lea    0x0(%esi),%esi
  1011a0:	8d 5e 30             	lea    0x30(%esi),%ebx
  1011a3:	88 19                	mov    %bl,(%ecx)
  1011a5:	eb b9                	jmp    101160 <i2X+0x2c>
  1011a7:	90                   	nop

001011a8 <printk>:
  1011a8:	55                   	push   %ebp
  1011a9:	89 e5                	mov    %esp,%ebp
  1011ab:	57                   	push   %edi
  1011ac:	56                   	push   %esi
  1011ad:	53                   	push   %ebx
  1011ae:	83 ec 2c             	sub    $0x2c,%esp
  1011b1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1011b4:	8a 11                	mov    (%ecx),%dl
  1011b6:	84 d2                	test   %dl,%dl
  1011b8:	0f 84 54 01 00 00    	je     101312 <printk+0x16a>
  1011be:	8d 45 0c             	lea    0xc(%ebp),%eax
  1011c1:	31 ff                	xor    %edi,%edi
  1011c3:	eb 18                	jmp    1011dd <printk+0x35>
  1011c5:	8d 76 00             	lea    0x0(%esi),%esi
  1011c8:	8a 11                	mov    (%ecx),%dl
  1011ca:	89 cb                	mov    %ecx,%ebx
  1011cc:	88 97 00 2f 10 00    	mov    %dl,0x102f00(%edi)
  1011d2:	47                   	inc    %edi
  1011d3:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1011d6:	8a 53 01             	mov    0x1(%ebx),%dl
  1011d9:	84 d2                	test   %dl,%dl
  1011db:	74 72                	je     10124f <printk+0xa7>
  1011dd:	80 fa 25             	cmp    $0x25,%dl
  1011e0:	75 e6                	jne    1011c8 <printk+0x20>
  1011e2:	8d 59 01             	lea    0x1(%ecx),%ebx
  1011e5:	8a 51 01             	mov    0x1(%ecx),%dl
  1011e8:	80 fa 64             	cmp    $0x64,%dl
  1011eb:	0f 84 bf 00 00 00    	je     1012b0 <printk+0x108>
  1011f1:	0f 8e 01 01 00 00    	jle    1012f8 <printk+0x150>
  1011f7:	80 fa 73             	cmp    $0x73,%dl
  1011fa:	0f 84 84 00 00 00    	je     101284 <printk+0xdc>
  101200:	80 fa 78             	cmp    $0x78,%dl
  101203:	75 c7                	jne    1011cc <printk+0x24>
  101205:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10120c:	8d 70 04             	lea    0x4(%eax),%esi
  10120f:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101212:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101215:	56                   	push   %esi
  101216:	ff 30                	pushl  (%eax)
  101218:	e8 17 ff ff ff       	call   101134 <i2X>
  10121d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  101220:	8d b7 00 2f 10 00    	lea    0x102f00(%edi),%esi
  101226:	8a 11                	mov    (%ecx),%dl
  101228:	83 c4 08             	add    $0x8,%esp
  10122b:	31 c0                	xor    %eax,%eax
  10122d:	84 d2                	test   %dl,%dl
  10122f:	74 0f                	je     101240 <printk+0x98>
  101231:	8d 76 00             	lea    0x0(%esi),%esi
  101234:	40                   	inc    %eax
  101235:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101239:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  10123c:	84 d2                	test   %dl,%dl
  10123e:	75 f4                	jne    101234 <printk+0x8c>
  101240:	01 c7                	add    %eax,%edi
  101242:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101245:	8d 4b 01             	lea    0x1(%ebx),%ecx
  101248:	8a 53 01             	mov    0x1(%ebx),%dl
  10124b:	84 d2                	test   %dl,%dl
  10124d:	75 8e                	jne    1011dd <printk+0x35>
  10124f:	c6 87 00 2f 10 00 00 	movb   $0x0,0x102f00(%edi)
  101256:	0f be 05 00 2f 10 00 	movsbl 0x102f00,%eax
  10125d:	bb 00 2f 10 00       	mov    $0x102f00,%ebx
  101262:	84 c0                	test   %al,%al
  101264:	74 16                	je     10127c <printk+0xd4>
  101266:	66 90                	xchg   %ax,%ax
  101268:	83 ec 0c             	sub    $0xc,%esp
  10126b:	50                   	push   %eax
  10126c:	e8 a7 f3 ff ff       	call   100618 <putChar>
  101271:	43                   	inc    %ebx
  101272:	0f be 03             	movsbl (%ebx),%eax
  101275:	83 c4 10             	add    $0x10,%esp
  101278:	84 c0                	test   %al,%al
  10127a:	75 ec                	jne    101268 <printk+0xc0>
  10127c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10127f:	5b                   	pop    %ebx
  101280:	5e                   	pop    %esi
  101281:	5f                   	pop    %edi
  101282:	5d                   	pop    %ebp
  101283:	c3                   	ret    
  101284:	8d 70 04             	lea    0x4(%eax),%esi
  101287:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10128a:	8b 08                	mov    (%eax),%ecx
  10128c:	8d b7 00 2f 10 00    	lea    0x102f00(%edi),%esi
  101292:	8a 11                	mov    (%ecx),%dl
  101294:	31 c0                	xor    %eax,%eax
  101296:	84 d2                	test   %dl,%dl
  101298:	74 a6                	je     101240 <printk+0x98>
  10129a:	66 90                	xchg   %ax,%ax
  10129c:	40                   	inc    %eax
  10129d:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1012a1:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  1012a4:	84 d2                	test   %dl,%dl
  1012a6:	75 f4                	jne    10129c <printk+0xf4>
  1012a8:	01 c7                	add    %eax,%edi
  1012aa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1012ad:	eb 96                	jmp    101245 <printk+0x9d>
  1012af:	90                   	nop
  1012b0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1012b7:	8d 70 04             	lea    0x4(%eax),%esi
  1012ba:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1012bd:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  1012c0:	56                   	push   %esi
  1012c1:	ff 30                	pushl  (%eax)
  1012c3:	e8 d0 fd ff ff       	call   101098 <i2A>
  1012c8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1012cb:	8d b7 00 2f 10 00    	lea    0x102f00(%edi),%esi
  1012d1:	8a 11                	mov    (%ecx),%dl
  1012d3:	83 c4 08             	add    $0x8,%esp
  1012d6:	31 c0                	xor    %eax,%eax
  1012d8:	84 d2                	test   %dl,%dl
  1012da:	0f 84 60 ff ff ff    	je     101240 <printk+0x98>
  1012e0:	40                   	inc    %eax
  1012e1:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1012e5:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  1012e8:	84 d2                	test   %dl,%dl
  1012ea:	75 f4                	jne    1012e0 <printk+0x138>
  1012ec:	01 c7                	add    %eax,%edi
  1012ee:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1012f1:	e9 4f ff ff ff       	jmp    101245 <printk+0x9d>
  1012f6:	66 90                	xchg   %ax,%ax
  1012f8:	80 fa 63             	cmp    $0x63,%dl
  1012fb:	0f 85 cb fe ff ff    	jne    1011cc <printk+0x24>
  101301:	8b 10                	mov    (%eax),%edx
  101303:	88 97 00 2f 10 00    	mov    %dl,0x102f00(%edi)
  101309:	83 c0 04             	add    $0x4,%eax
  10130c:	47                   	inc    %edi
  10130d:	e9 c1 fe ff ff       	jmp    1011d3 <printk+0x2b>
  101312:	31 ff                	xor    %edi,%edi
  101314:	e9 36 ff ff ff       	jmp    10124f <printk+0xa7>
  101319:	66 90                	xchg   %ax,%ax
  10131b:	90                   	nop

0010131c <abort>:
  10131c:	55                   	push   %ebp
  10131d:	89 e5                	mov    %esp,%ebp
  10131f:	57                   	push   %edi
  101320:	56                   	push   %esi
  101321:	53                   	push   %ebx
  101322:	83 ec 1c             	sub    $0x1c,%esp
  101325:	8b 55 08             	mov    0x8(%ebp),%edx
  101328:	fa                   	cli    
  101329:	8a 02                	mov    (%edx),%al
  10132b:	b9 b2 2d 10 00       	mov    $0x102db2,%ecx
  101330:	84 c0                	test   %al,%al
  101332:	74 0b                	je     10133f <abort+0x23>
  101334:	41                   	inc    %ecx
  101335:	42                   	inc    %edx
  101336:	88 41 ff             	mov    %al,-0x1(%ecx)
  101339:	8a 02                	mov    (%edx),%al
  10133b:	84 c0                	test   %al,%al
  10133d:	75 f5                	jne    101334 <abort+0x18>
  10133f:	c6 01 3a             	movb   $0x3a,(%ecx)
  101342:	bb 1d 37 10 00       	mov    $0x10371d,%ebx
  101347:	be 0a 00 00 00       	mov    $0xa,%esi
  10134c:	bf 67 66 66 66       	mov    $0x66666667,%edi
  101351:	4b                   	dec    %ebx
  101352:	8b 45 0c             	mov    0xc(%ebp),%eax
  101355:	99                   	cltd   
  101356:	f7 fe                	idiv   %esi
  101358:	8d 42 30             	lea    0x30(%edx),%eax
  10135b:	88 45 e7             	mov    %al,-0x19(%ebp)
  10135e:	88 03                	mov    %al,(%ebx)
  101360:	89 f8                	mov    %edi,%eax
  101362:	f7 6d 0c             	imull  0xc(%ebp)
  101365:	c1 fa 02             	sar    $0x2,%edx
  101368:	8b 45 0c             	mov    0xc(%ebp),%eax
  10136b:	c1 f8 1f             	sar    $0x1f,%eax
  10136e:	29 c2                	sub    %eax,%edx
  101370:	89 55 0c             	mov    %edx,0xc(%ebp)
  101373:	75 dc                	jne    101351 <abort+0x35>
  101375:	41                   	inc    %ecx
  101376:	41                   	inc    %ecx
  101377:	43                   	inc    %ebx
  101378:	8a 45 e7             	mov    -0x19(%ebp),%al
  10137b:	88 41 ff             	mov    %al,-0x1(%ecx)
  10137e:	8a 03                	mov    (%ebx),%al
  101380:	88 45 e7             	mov    %al,-0x19(%ebp)
  101383:	84 c0                	test   %al,%al
  101385:	75 ef                	jne    101376 <abort+0x5a>
  101387:	c6 01 0a             	movb   $0xa,(%ecx)
  10138a:	0f be 05 a0 2d 10 00 	movsbl 0x102da0,%eax
  101391:	84 c0                	test   %al,%al
  101393:	74 1b                	je     1013b0 <abort+0x94>
  101395:	bb a0 2d 10 00       	mov    $0x102da0,%ebx
  10139a:	83 ec 0c             	sub    $0xc,%esp
  10139d:	50                   	push   %eax
  10139e:	e8 75 f2 ff ff       	call   100618 <putChar>
  1013a3:	43                   	inc    %ebx
  1013a4:	0f be 03             	movsbl (%ebx),%eax
  1013a7:	83 c4 10             	add    $0x10,%esp
  1013aa:	84 c0                	test   %al,%al
  1013ac:	75 ec                	jne    10139a <abort+0x7e>
  1013ae:	66 90                	xchg   %ax,%ax
  1013b0:	f4                   	hlt    
  1013b1:	eb fd                	jmp    1013b0 <abort+0x94>

001013b3 <irqEmpty>:
  1013b3:	6a 00                	push   $0x0
  1013b5:	6a ff                	push   $0xffffffff
  1013b7:	eb 13                	jmp    1013cc <asmDoIrq>

001013b9 <irqGProtectFault>:
  1013b9:	6a 0d                	push   $0xd
  1013bb:	eb 0f                	jmp    1013cc <asmDoIrq>

001013bd <irqSyscall>:
  1013bd:	6a 00                	push   $0x0
  1013bf:	68 80 00 00 00       	push   $0x80
  1013c4:	eb 06                	jmp    1013cc <asmDoIrq>

001013c6 <irqTime>:
  1013c6:	6a 00                	push   $0x0
  1013c8:	6a 20                	push   $0x20
  1013ca:	eb 00                	jmp    1013cc <asmDoIrq>

001013cc <asmDoIrq>:
  1013cc:	60                   	pusha  
  1013cd:	54                   	push   %esp
  1013ce:	e8 ed fb ff ff       	call   100fc0 <irqHandle>
  1013d3:	83 c4 04             	add    $0x4,%esp
  1013d6:	61                   	popa   
  1013d7:	83 c4 04             	add    $0x4,%esp
  1013da:	83 c4 04             	add    $0x4,%esp
  1013dd:	cf                   	iret   
