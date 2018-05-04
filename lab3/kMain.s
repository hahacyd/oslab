
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 4d 12 00 00       	call   101258 <initTimer>
  10000b:	e8 20 0e 00 00       	call   100e30 <init_pcb>
  100010:	e8 57 0e 00 00       	call   100e6c <init_kernel_pcb>
  100015:	e8 ea 05 00 00       	call   100604 <initSerial>
  10001a:	e8 f9 0e 00 00       	call   100f18 <initIdt>
  10001f:	e8 dc 11 00 00       	call   101200 <initIntr>
  100024:	e8 cf 00 00 00       	call   1000f8 <initSeg>
  100029:	fb                   	sti    
  10002a:	e8 dd 02 00 00       	call   10030c <loadUMain>
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

00100050 <get_tss>:
  100050:	55                   	push   %ebp
  100051:	89 e5                	mov    %esp,%ebp
  100053:	57                   	push   %edi
  100054:	56                   	push   %esi
  100055:	8b 45 08             	mov    0x8(%ebp),%eax
  100058:	be 00 ea 12 01       	mov    $0x112ea00,%esi
  10005d:	b9 19 00 00 00       	mov    $0x19,%ecx
  100062:	89 c7                	mov    %eax,%edi
  100064:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100066:	5e                   	pop    %esi
  100067:	5f                   	pop    %edi
  100068:	5d                   	pop    %ebp
  100069:	c2 04 00             	ret    $0x4

0010006c <waitDisk>:
  10006c:	55                   	push   %ebp
  10006d:	89 e5                	mov    %esp,%ebp
  10006f:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100074:	ec                   	in     (%dx),%al
  100075:	83 e0 c0             	and    $0xffffffc0,%eax
  100078:	3c 40                	cmp    $0x40,%al
  10007a:	75 f8                	jne    100074 <waitDisk+0x8>
  10007c:	5d                   	pop    %ebp
  10007d:	c3                   	ret    
  10007e:	66 90                	xchg   %ax,%ax

00100080 <readSect>:
  100080:	55                   	push   %ebp
  100081:	89 e5                	mov    %esp,%ebp
  100083:	53                   	push   %ebx
  100084:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100087:	ba f7 01 00 00       	mov    $0x1f7,%edx
  10008c:	ec                   	in     (%dx),%al
  10008d:	83 e0 c0             	and    $0xffffffc0,%eax
  100090:	3c 40                	cmp    $0x40,%al
  100092:	75 f8                	jne    10008c <readSect+0xc>
  100094:	ba f2 01 00 00       	mov    $0x1f2,%edx
  100099:	b0 01                	mov    $0x1,%al
  10009b:	ee                   	out    %al,(%dx)
  10009c:	ba f3 01 00 00       	mov    $0x1f3,%edx
  1000a1:	88 c8                	mov    %cl,%al
  1000a3:	ee                   	out    %al,(%dx)
  1000a4:	89 c8                	mov    %ecx,%eax
  1000a6:	c1 f8 08             	sar    $0x8,%eax
  1000a9:	ba f4 01 00 00       	mov    $0x1f4,%edx
  1000ae:	ee                   	out    %al,(%dx)
  1000af:	89 c8                	mov    %ecx,%eax
  1000b1:	c1 f8 10             	sar    $0x10,%eax
  1000b4:	ba f5 01 00 00       	mov    $0x1f5,%edx
  1000b9:	ee                   	out    %al,(%dx)
  1000ba:	89 c8                	mov    %ecx,%eax
  1000bc:	c1 f8 18             	sar    $0x18,%eax
  1000bf:	83 c8 e0             	or     $0xffffffe0,%eax
  1000c2:	ba f6 01 00 00       	mov    $0x1f6,%edx
  1000c7:	ee                   	out    %al,(%dx)
  1000c8:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1000cd:	b0 20                	mov    $0x20,%al
  1000cf:	ee                   	out    %al,(%dx)
  1000d0:	ec                   	in     (%dx),%al
  1000d1:	83 e0 c0             	and    $0xffffffc0,%eax
  1000d4:	3c 40                	cmp    $0x40,%al
  1000d6:	75 f8                	jne    1000d0 <readSect+0x50>
  1000d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1000db:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  1000e1:	ba f0 01 00 00       	mov    $0x1f0,%edx
  1000e6:	66 90                	xchg   %ax,%ax
  1000e8:	ed                   	in     (%dx),%eax
  1000e9:	89 01                	mov    %eax,(%ecx)
  1000eb:	83 c1 04             	add    $0x4,%ecx
  1000ee:	39 d9                	cmp    %ebx,%ecx
  1000f0:	75 f6                	jne    1000e8 <readSect+0x68>
  1000f2:	5b                   	pop    %ebx
  1000f3:	5d                   	pop    %ebp
  1000f4:	c3                   	ret    
  1000f5:	8d 76 00             	lea    0x0(%esi),%esi

001000f8 <initSeg>:
  1000f8:	55                   	push   %ebp
  1000f9:	89 e5                	mov    %esp,%ebp
  1000fb:	b9 c0 e9 12 01       	mov    $0x112e9c0,%ecx
  100100:	66 c7 05 c8 e9 12 01 	movw   $0xffff,0x112e9c8
  100107:	ff ff 
  100109:	66 c7 05 ca e9 12 01 	movw   $0x0,0x112e9ca
  100110:	00 00 
  100112:	c6 05 cc e9 12 01 00 	movb   $0x0,0x112e9cc
  100119:	c6 05 cd e9 12 01 9a 	movb   $0x9a,0x112e9cd
  100120:	c6 05 ce e9 12 01 cf 	movb   $0xcf,0x112e9ce
  100127:	c6 05 cf e9 12 01 00 	movb   $0x0,0x112e9cf
  10012e:	66 c7 05 d0 e9 12 01 	movw   $0xffff,0x112e9d0
  100135:	ff ff 
  100137:	66 c7 05 d2 e9 12 01 	movw   $0x0,0x112e9d2
  10013e:	00 00 
  100140:	c6 05 d4 e9 12 01 00 	movb   $0x0,0x112e9d4
  100147:	c6 05 d5 e9 12 01 92 	movb   $0x92,0x112e9d5
  10014e:	c6 05 d6 e9 12 01 cf 	movb   $0xcf,0x112e9d6
  100155:	c6 05 d7 e9 12 01 00 	movb   $0x0,0x112e9d7
  10015c:	66 c7 05 d8 e9 12 01 	movw   $0xffff,0x112e9d8
  100163:	ff ff 
  100165:	66 c7 05 da e9 12 01 	movw   $0x0,0x112e9da
  10016c:	00 00 
  10016e:	c6 05 dc e9 12 01 00 	movb   $0x0,0x112e9dc
  100175:	c6 05 dd e9 12 01 fa 	movb   $0xfa,0x112e9dd
  10017c:	c6 05 de e9 12 01 cf 	movb   $0xcf,0x112e9de
  100183:	c6 05 df e9 12 01 00 	movb   $0x0,0x112e9df
  10018a:	66 c7 05 e0 e9 12 01 	movw   $0xffff,0x112e9e0
  100191:	ff ff 
  100193:	66 c7 05 e2 e9 12 01 	movw   $0x0,0x112e9e2
  10019a:	00 00 
  10019c:	c6 05 e4 e9 12 01 00 	movb   $0x0,0x112e9e4
  1001a3:	c6 05 e5 e9 12 01 f2 	movb   $0xf2,0x112e9e5
  1001aa:	c6 05 e6 e9 12 01 cf 	movb   $0xcf,0x112e9e6
  1001b1:	c6 05 e7 e9 12 01 00 	movb   $0x0,0x112e9e7
  1001b8:	66 c7 05 e8 e9 12 01 	movw   $0x63,0x112e9e8
  1001bf:	63 00 
  1001c1:	b8 00 ea 12 01       	mov    $0x112ea00,%eax
  1001c6:	66 a3 ea e9 12 01    	mov    %ax,0x112e9ea
  1001cc:	89 c2                	mov    %eax,%edx
  1001ce:	c1 ea 10             	shr    $0x10,%edx
  1001d1:	88 15 ec e9 12 01    	mov    %dl,0x112e9ec
  1001d7:	c6 05 ed e9 12 01 89 	movb   $0x89,0x112e9ed
  1001de:	c6 05 ee e9 12 01 40 	movb   $0x40,0x112e9ee
  1001e5:	c1 e8 18             	shr    $0x18,%eax
  1001e8:	a2 ef e9 12 01       	mov    %al,0x112e9ef
  1001ed:	a1 b4 15 10 00       	mov    0x1015b4,%eax
  1001f2:	8b 15 b8 15 10 00    	mov    0x1015b8,%edx
  1001f8:	a3 f0 e9 12 01       	mov    %eax,0x112e9f0
  1001fd:	89 15 f4 e9 12 01    	mov    %edx,0x112e9f4
  100203:	66 c7 05 20 21 10 00 	movw   $0x37,0x102120
  10020a:	37 00 
  10020c:	66 89 0d 22 21 10 00 	mov    %cx,0x102122
  100213:	c1 e9 10             	shr    $0x10,%ecx
  100216:	66 89 0d 24 21 10 00 	mov    %cx,0x102124
  10021d:	b8 20 21 10 00       	mov    $0x102120,%eax
  100222:	0f 01 10             	lgdtl  (%eax)
  100225:	a1 f8 49 10 00       	mov    0x1049f8,%eax
  10022a:	a3 08 ea 12 01       	mov    %eax,0x112ea08
  10022f:	c7 05 04 ea 12 01 bc 	movl   $0x1049bc,0x112ea04
  100236:	49 10 00 
  100239:	b8 28 00 00 00       	mov    $0x28,%eax
  10023e:	0f 00 d8             	ltr    %ax
  100241:	b8 10 00 00 00       	mov    $0x10,%eax
  100246:	89 c0                	mov    %eax,%eax
  100248:	8e d8                	mov    %eax,%ds
  10024a:	8e e0                	mov    %eax,%fs
  10024c:	8e c0                	mov    %eax,%es
  10024e:	8e d0                	mov    %eax,%ss
  100250:	b8 30 00 00 00       	mov    $0x30,%eax
  100255:	89 c0                	mov    %eax,%eax
  100257:	8e e8                	mov    %eax,%gs
  100259:	31 c0                	xor    %eax,%eax
  10025b:	0f 00 d0             	lldt   %ax
  10025e:	5d                   	pop    %ebp
  10025f:	c3                   	ret    

00100260 <enterUserSpace_pcb>:
  100260:	55                   	push   %ebp
  100261:	89 e5                	mov    %esp,%ebp
  100263:	8b 45 08             	mov    0x8(%ebp),%eax
  100266:	89 c2                	mov    %eax,%edx
  100268:	c1 e2 07             	shl    $0x7,%edx
  10026b:	01 c2                	add    %eax,%edx
  10026d:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100270:	01 d2                	add    %edx,%edx
  100272:	01 d0                	add    %edx,%eax
  100274:	8d 04 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%eax
  10027b:	8b 90 38 20 00 00    	mov    0x2038(%eax),%edx
  100281:	52                   	push   %edx
  100282:	8b 90 34 20 00 00    	mov    0x2034(%eax),%edx
  100288:	52                   	push   %edx
  100289:	9c                   	pushf  
  10028a:	8b 90 2c 20 00 00    	mov    0x202c(%eax),%edx
  100290:	52                   	push   %edx
  100291:	8b 80 28 20 00 00    	mov    0x2028(%eax),%eax
  100297:	50                   	push   %eax
  100298:	cf                   	iret   
  100299:	5d                   	pop    %ebp
  10029a:	c3                   	ret    
  10029b:	90                   	nop

0010029c <enterUserSpace>:
  10029c:	55                   	push   %ebp
  10029d:	89 e5                	mov    %esp,%ebp
  10029f:	83 ec 10             	sub    $0x10,%esp
  1002a2:	c7 05 a4 29 10 00 01 	movl   $0x1,0x1029a4
  1002a9:	00 00 00 
  1002ac:	c7 05 50 6a 10 00 23 	movl   $0x23,0x106a50
  1002b3:	00 00 00 
  1002b6:	c7 05 4c 6a 10 00 00 	movl   $0x8000000,0x106a4c
  1002bd:	00 00 08 
  1002c0:	c7 05 44 6a 10 00 1b 	movl   $0x1b,0x106a44
  1002c7:	00 00 00 
  1002ca:	8b 45 08             	mov    0x8(%ebp),%eax
  1002cd:	a3 40 6a 10 00       	mov    %eax,0x106a40
  1002d2:	c7 05 58 6a 10 00 0a 	movl   $0xa,0x106a58
  1002d9:	00 00 00 
  1002dc:	6a 00                	push   $0x0
  1002de:	6a 01                	push   $0x1
  1002e0:	e8 83 05 00 00       	call   100868 <put_into_runnable>
  1002e5:	bc 00 30 00 00       	mov    $0x3000,%esp
  1002ea:	a1 f8 49 10 00       	mov    0x1049f8,%eax
  1002ef:	50                   	push   %eax
  1002f0:	a1 f4 49 10 00       	mov    0x1049f4,%eax
  1002f5:	50                   	push   %eax
  1002f6:	9c                   	pushf  
  1002f7:	a1 ec 49 10 00       	mov    0x1049ec,%eax
  1002fc:	50                   	push   %eax
  1002fd:	a1 e8 49 10 00       	mov    0x1049e8,%eax
  100302:	50                   	push   %eax
  100303:	cf                   	iret   
  100304:	83 c4 10             	add    $0x10,%esp
  100307:	c9                   	leave  
  100308:	c3                   	ret    
  100309:	8d 76 00             	lea    0x0(%esi),%esi

0010030c <loadUMain>:
  10030c:	55                   	push   %ebp
  10030d:	89 e5                	mov    %esp,%ebp
  10030f:	57                   	push   %edi
  100310:	56                   	push   %esi
  100311:	53                   	push   %ebx
  100312:	83 ec 0c             	sub    $0xc,%esp
  100315:	bb c9 00 00 00       	mov    $0xc9,%ebx
  10031a:	be 00 00 00 03       	mov    $0x3000000,%esi
  10031f:	90                   	nop
  100320:	53                   	push   %ebx
  100321:	56                   	push   %esi
  100322:	e8 59 fd ff ff       	call   100080 <readSect>
  100327:	81 c6 00 02 00 00    	add    $0x200,%esi
  10032d:	43                   	inc    %ebx
  10032e:	58                   	pop    %eax
  10032f:	5a                   	pop    %edx
  100330:	81 fb 91 01 00 00    	cmp    $0x191,%ebx
  100336:	75 e8                	jne    100320 <loadUMain+0x14>
  100338:	a1 1c 00 00 03       	mov    0x300001c,%eax
  10033d:	8d 90 00 00 00 03    	lea    0x3000000(%eax),%edx
  100343:	0f b7 35 2c 00 00 03 	movzwl 0x300002c,%esi
  10034a:	c1 e6 05             	shl    $0x5,%esi
  10034d:	01 d6                	add    %edx,%esi
  10034f:	39 f2                	cmp    %esi,%edx
  100351:	72 0c                	jb     10035f <loadUMain+0x53>
  100353:	eb 53                	jmp    1003a8 <loadUMain+0x9c>
  100355:	8d 76 00             	lea    0x0(%esi),%esi
  100358:	83 c2 20             	add    $0x20,%edx
  10035b:	39 d6                	cmp    %edx,%esi
  10035d:	76 49                	jbe    1003a8 <loadUMain+0x9c>
  10035f:	83 3a 01             	cmpl   $0x1,(%edx)
  100362:	75 f4                	jne    100358 <loadUMain+0x4c>
  100364:	8b 42 08             	mov    0x8(%edx),%eax
  100367:	8b 7a 10             	mov    0x10(%edx),%edi
  10036a:	8b 5a 04             	mov    0x4(%edx),%ebx
  10036d:	29 c3                	sub    %eax,%ebx
  10036f:	31 c9                	xor    %ecx,%ecx
  100371:	85 ff                	test   %edi,%edi
  100373:	74 16                	je     10038b <loadUMain+0x7f>
  100375:	8d 76 00             	lea    0x0(%esi),%esi
  100378:	8a 8c 03 00 00 00 03 	mov    0x3000000(%ebx,%eax,1),%cl
  10037f:	88 08                	mov    %cl,(%eax)
  100381:	40                   	inc    %eax
  100382:	89 c1                	mov    %eax,%ecx
  100384:	2b 4a 08             	sub    0x8(%edx),%ecx
  100387:	39 cf                	cmp    %ecx,%edi
  100389:	77 ed                	ja     100378 <loadUMain+0x6c>
  10038b:	8b 5a 14             	mov    0x14(%edx),%ebx
  10038e:	39 cb                	cmp    %ecx,%ebx
  100390:	76 c6                	jbe    100358 <loadUMain+0x4c>
  100392:	66 90                	xchg   %ax,%ax
  100394:	c6 00 00             	movb   $0x0,(%eax)
  100397:	40                   	inc    %eax
  100398:	89 c1                	mov    %eax,%ecx
  10039a:	2b 4a 08             	sub    0x8(%edx),%ecx
  10039d:	39 cb                	cmp    %ecx,%ebx
  10039f:	77 f3                	ja     100394 <loadUMain+0x88>
  1003a1:	83 c2 20             	add    $0x20,%edx
  1003a4:	39 d6                	cmp    %edx,%esi
  1003a6:	77 b7                	ja     10035f <loadUMain+0x53>
  1003a8:	83 ec 0c             	sub    $0xc,%esp
  1003ab:	ff 35 18 00 00 03    	pushl  0x3000018
  1003b1:	e8 e6 fe ff ff       	call   10029c <enterUserSpace>
  1003b6:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1003b9:	5b                   	pop    %ebx
  1003ba:	5e                   	pop    %esi
  1003bb:	5f                   	pop    %edi
  1003bc:	5d                   	pop    %ebp
  1003bd:	c3                   	ret    
  1003be:	66 90                	xchg   %ax,%ax

001003c0 <sys_exit>:
  1003c0:	55                   	push   %ebp
  1003c1:	89 e5                	mov    %esp,%ebp
  1003c3:	83 ec 14             	sub    $0x14,%esp
  1003c6:	68 bc 15 10 00       	push   $0x1015bc
  1003cb:	e8 b0 0f 00 00       	call   101380 <printk>
  1003d0:	e8 cf 03 00 00       	call   1007a4 <get_from_runnable>
  1003d5:	5a                   	pop    %edx
  1003d6:	59                   	pop    %ecx
  1003d7:	ff 75 08             	pushl  0x8(%ebp)
  1003da:	50                   	push   %eax
  1003db:	e8 88 02 00 00       	call   100668 <put_into_running>
  1003e0:	b8 01 00 00 00       	mov    $0x1,%eax
  1003e5:	c9                   	leave  
  1003e6:	c3                   	ret    
  1003e7:	90                   	nop

001003e8 <sys_sleep>:
  1003e8:	55                   	push   %ebp
  1003e9:	89 e5                	mov    %esp,%ebp
  1003eb:	56                   	push   %esi
  1003ec:	53                   	push   %ebx
  1003ed:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1003f0:	e8 7f 03 00 00       	call   100774 <getpid>
  1003f5:	83 ec 08             	sub    $0x8,%esp
  1003f8:	53                   	push   %ebx
  1003f9:	50                   	push   %eax
  1003fa:	e8 99 05 00 00       	call   100998 <put_into_block>
  1003ff:	c7 04 24 ca 15 10 00 	movl   $0x1015ca,(%esp)
  100406:	e8 75 0f 00 00       	call   101380 <printk>
  10040b:	e8 64 03 00 00       	call   100774 <getpid>
  100410:	89 c2                	mov    %eax,%edx
  100412:	c1 e2 07             	shl    $0x7,%edx
  100415:	01 c2                	add    %eax,%edx
  100417:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10041a:	01 d2                	add    %edx,%edx
  10041c:	01 d0                	add    %edx,%eax
  10041e:	8b 34 c5 04 4a 10 00 	mov    0x104a04(,%eax,8),%esi
  100425:	e8 4a 03 00 00       	call   100774 <getpid>
  10042a:	5a                   	pop    %edx
  10042b:	59                   	pop    %ecx
  10042c:	56                   	push   %esi
  10042d:	50                   	push   %eax
  10042e:	68 18 16 10 00       	push   $0x101618
  100433:	6a 09                	push   $0x9
  100435:	68 d0 15 10 00       	push   $0x1015d0
  10043a:	68 f4 15 10 00       	push   $0x1015f4
  10043f:	e8 3c 0f 00 00       	call   101380 <printk>
  100444:	83 c4 14             	add    $0x14,%esp
  100447:	68 ec 15 10 00       	push   $0x1015ec
  10044c:	e8 2f 0f 00 00       	call   101380 <printk>
  100451:	e8 4e 03 00 00       	call   1007a4 <get_from_runnable>
  100456:	5e                   	pop    %esi
  100457:	5a                   	pop    %edx
  100458:	53                   	push   %ebx
  100459:	50                   	push   %eax
  10045a:	e8 09 02 00 00       	call   100668 <put_into_running>
  10045f:	b8 01 00 00 00       	mov    $0x1,%eax
  100464:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100467:	5b                   	pop    %ebx
  100468:	5e                   	pop    %esi
  100469:	5d                   	pop    %ebp
  10046a:	c3                   	ret    
  10046b:	90                   	nop

0010046c <sys_fork>:
  10046c:	55                   	push   %ebp
  10046d:	89 e5                	mov    %esp,%ebp
  10046f:	57                   	push   %edi
  100470:	56                   	push   %esi
  100471:	8b 75 08             	mov    0x8(%ebp),%esi
  100474:	83 ec 0c             	sub    $0xc,%esp
  100477:	68 22 16 10 00       	push   $0x101622
  10047c:	e8 ff 0e 00 00       	call   101380 <printk>
  100481:	b8 70 8a 10 00       	mov    $0x108a70,%eax
  100486:	b9 0f 00 00 00       	mov    $0xf,%ecx
  10048b:	89 c7                	mov    %eax,%edi
  10048d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10048f:	c7 05 8c 8a 10 00 00 	movl   $0x0,0x108a8c
  100496:	00 00 00 
  100499:	c7 05 a4 8a 10 00 00 	movl   $0x7e00000,0x108aa4
  1004a0:	00 e0 07 
  1004a3:	5a                   	pop    %edx
  1004a4:	59                   	pop    %ecx
  1004a5:	50                   	push   %eax
  1004a6:	6a 02                	push   $0x2
  1004a8:	e8 bb 03 00 00       	call   100868 <put_into_runnable>
  1004ad:	b8 02 00 00 00       	mov    $0x2,%eax
  1004b2:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1004b5:	5e                   	pop    %esi
  1004b6:	5f                   	pop    %edi
  1004b7:	5d                   	pop    %ebp
  1004b8:	c3                   	ret    
  1004b9:	66 90                	xchg   %ax,%ax
  1004bb:	90                   	nop

001004bc <display>:
  1004bc:	55                   	push   %ebp
  1004bd:	89 e5                	mov    %esp,%ebp
  1004bf:	57                   	push   %edi
  1004c0:	53                   	push   %ebx
  1004c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1004c4:	80 fb 0a             	cmp    $0xa,%bl
  1004c7:	74 5b                	je     100524 <display+0x68>
  1004c9:	8b 15 28 21 10 00    	mov    0x102128,%edx
  1004cf:	8b 0d 2c 21 10 00    	mov    0x10212c,%ecx
  1004d5:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  1004d8:	c1 e0 04             	shl    $0x4,%eax
  1004db:	01 d0                	add    %edx,%eax
  1004dd:	01 c0                	add    %eax,%eax
  1004df:	89 c7                	mov    %eax,%edi
  1004e1:	0f be db             	movsbl %bl,%ebx
  1004e4:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
  1004ea:	66 89 d8             	mov    %bx,%ax
  1004ed:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1004f1:	42                   	inc    %edx
  1004f2:	83 fa 50             	cmp    $0x50,%edx
  1004f5:	75 1d                	jne    100514 <display+0x58>
  1004f7:	c7 05 28 21 10 00 00 	movl   $0x0,0x102128
  1004fe:	00 00 00 
  100501:	41                   	inc    %ecx
  100502:	89 0d 2c 21 10 00    	mov    %ecx,0x10212c
  100508:	b8 01 00 00 00       	mov    $0x1,%eax
  10050d:	5b                   	pop    %ebx
  10050e:	5f                   	pop    %edi
  10050f:	5d                   	pop    %ebp
  100510:	c3                   	ret    
  100511:	8d 76 00             	lea    0x0(%esi),%esi
  100514:	89 15 28 21 10 00    	mov    %edx,0x102128
  10051a:	b8 01 00 00 00       	mov    $0x1,%eax
  10051f:	5b                   	pop    %ebx
  100520:	5f                   	pop    %edi
  100521:	5d                   	pop    %ebp
  100522:	c3                   	ret    
  100523:	90                   	nop
  100524:	c7 05 28 21 10 00 00 	movl   $0x0,0x102128
  10052b:	00 00 00 
  10052e:	ff 05 2c 21 10 00    	incl   0x10212c
  100534:	b8 01 00 00 00       	mov    $0x1,%eax
  100539:	5b                   	pop    %ebx
  10053a:	5f                   	pop    %edi
  10053b:	5d                   	pop    %ebp
  10053c:	c3                   	ret    
  10053d:	8d 76 00             	lea    0x0(%esi),%esi

00100540 <printkernel>:
  100540:	55                   	push   %ebp
  100541:	89 e5                	mov    %esp,%ebp
  100543:	53                   	push   %ebx
  100544:	50                   	push   %eax
  100545:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100548:	0f be 03             	movsbl (%ebx),%eax
  10054b:	84 c0                	test   %al,%al
  10054d:	74 20                	je     10056f <printkernel+0x2f>
  10054f:	90                   	nop
  100550:	83 ec 0c             	sub    $0xc,%esp
  100553:	50                   	push   %eax
  100554:	e8 eb 00 00 00       	call   100644 <putChar>
  100559:	0f be 03             	movsbl (%ebx),%eax
  10055c:	89 04 24             	mov    %eax,(%esp)
  10055f:	e8 58 ff ff ff       	call   1004bc <display>
  100564:	43                   	inc    %ebx
  100565:	0f be 03             	movsbl (%ebx),%eax
  100568:	83 c4 10             	add    $0x10,%esp
  10056b:	84 c0                	test   %al,%al
  10056d:	75 e1                	jne    100550 <printkernel+0x10>
  10056f:	b8 01 00 00 00       	mov    $0x1,%eax
  100574:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100577:	c9                   	leave  
  100578:	c3                   	ret    
  100579:	8d 76 00             	lea    0x0(%esi),%esi

0010057c <fs_write>:
  10057c:	55                   	push   %ebp
  10057d:	89 e5                	mov    %esp,%ebp
  10057f:	53                   	push   %ebx
  100580:	50                   	push   %eax
  100581:	8b 5d 10             	mov    0x10(%ebp),%ebx
  100584:	ba 30 00 00 00       	mov    $0x30,%edx
  100589:	89 d0                	mov    %edx,%eax
  10058b:	8e e8                	mov    %eax,%gs
  10058d:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  100591:	74 12                	je     1005a5 <fs_write+0x29>
  100593:	83 ec 08             	sub    $0x8,%esp
  100596:	6a 27                	push   $0x27
  100598:	68 3e 16 10 00       	push   $0x10163e
  10059d:	e8 52 0f 00 00       	call   1014f4 <abort>
  1005a2:	83 c4 10             	add    $0x10,%esp
  1005a5:	83 ec 08             	sub    $0x8,%esp
  1005a8:	53                   	push   %ebx
  1005a9:	ff 75 0c             	pushl  0xc(%ebp)
  1005ac:	e8 8f ff ff ff       	call   100540 <printkernel>
  1005b1:	89 d8                	mov    %ebx,%eax
  1005b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005b6:	c9                   	leave  
  1005b7:	c3                   	ret    

001005b8 <sys_write>:
  1005b8:	55                   	push   %ebp
  1005b9:	89 e5                	mov    %esp,%ebp
  1005bb:	53                   	push   %ebx
  1005bc:	83 ec 08             	sub    $0x8,%esp
  1005bf:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1005c2:	ff 73 14             	pushl  0x14(%ebx)
  1005c5:	ff 73 18             	pushl  0x18(%ebx)
  1005c8:	ff 73 10             	pushl  0x10(%ebx)
  1005cb:	e8 ac ff ff ff       	call   10057c <fs_write>
  1005d0:	89 43 1c             	mov    %eax,0x1c(%ebx)
  1005d3:	83 c4 10             	add    $0x10,%esp
  1005d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005d9:	c9                   	leave  
  1005da:	c3                   	ret    
  1005db:	90                   	nop

001005dc <print_char>:
  1005dc:	55                   	push   %ebp
  1005dd:	89 e5                	mov    %esp,%ebp
  1005df:	57                   	push   %edi
  1005e0:	8b 45 08             	mov    0x8(%ebp),%eax
  1005e3:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1005e6:	c1 e0 04             	shl    $0x4,%eax
  1005e9:	03 45 0c             	add    0xc(%ebp),%eax
  1005ec:	01 c0                	add    %eax,%eax
  1005ee:	89 c7                	mov    %eax,%edi
  1005f0:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  1005f4:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  1005fa:	66 89 d0             	mov    %dx,%ax
  1005fd:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100601:	5f                   	pop    %edi
  100602:	5d                   	pop    %ebp
  100603:	c3                   	ret    

00100604 <initSerial>:
  100604:	55                   	push   %ebp
  100605:	89 e5                	mov    %esp,%ebp
  100607:	ba f9 03 00 00       	mov    $0x3f9,%edx
  10060c:	31 c0                	xor    %eax,%eax
  10060e:	ee                   	out    %al,(%dx)
  10060f:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100614:	b0 80                	mov    $0x80,%al
  100616:	ee                   	out    %al,(%dx)
  100617:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10061c:	b0 01                	mov    $0x1,%al
  10061e:	ee                   	out    %al,(%dx)
  10061f:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100624:	31 c0                	xor    %eax,%eax
  100626:	ee                   	out    %al,(%dx)
  100627:	ba fb 03 00 00       	mov    $0x3fb,%edx
  10062c:	b0 03                	mov    $0x3,%al
  10062e:	ee                   	out    %al,(%dx)
  10062f:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100634:	b0 c7                	mov    $0xc7,%al
  100636:	ee                   	out    %al,(%dx)
  100637:	ba fc 03 00 00       	mov    $0x3fc,%edx
  10063c:	b0 0b                	mov    $0xb,%al
  10063e:	ee                   	out    %al,(%dx)
  10063f:	5d                   	pop    %ebp
  100640:	c3                   	ret    
  100641:	8d 76 00             	lea    0x0(%esi),%esi

00100644 <putChar>:
  100644:	55                   	push   %ebp
  100645:	89 e5                	mov    %esp,%ebp
  100647:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10064a:	ba fd 03 00 00       	mov    $0x3fd,%edx
  10064f:	90                   	nop
  100650:	ec                   	in     (%dx),%al
  100651:	a8 20                	test   $0x20,%al
  100653:	74 fb                	je     100650 <putChar+0xc>
  100655:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10065a:	88 c8                	mov    %cl,%al
  10065c:	ee                   	out    %al,(%dx)
  10065d:	5d                   	pop    %ebp
  10065e:	c3                   	ret    
  10065f:	90                   	nop

00100660 <IDLE>:
  100660:	55                   	push   %ebp
  100661:	89 e5                	mov    %esp,%ebp
  100663:	90                   	nop
  100664:	f4                   	hlt    
  100665:	eb fd                	jmp    100664 <IDLE+0x4>
  100667:	90                   	nop

00100668 <put_into_running>:
  100668:	55                   	push   %ebp
  100669:	89 e5                	mov    %esp,%ebp
  10066b:	56                   	push   %esi
  10066c:	53                   	push   %ebx
  10066d:	81 ec d0 00 00 00    	sub    $0xd0,%esp
  100673:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100676:	39 1d a0 29 10 00    	cmp    %ebx,0x1029a0
  10067c:	0f 84 89 00 00 00    	je     10070b <put_into_running+0xa3>
  100682:	89 1d a0 29 10 00    	mov    %ebx,0x1029a0
  100688:	85 db                	test   %ebx,%ebx
  10068a:	0f 84 88 00 00 00    	je     100718 <put_into_running+0xb0>
  100690:	89 d8                	mov    %ebx,%eax
  100692:	c1 e0 07             	shl    $0x7,%eax
  100695:	01 d8                	add    %ebx,%eax
  100697:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10069a:	01 c0                	add    %eax,%eax
  10069c:	01 d8                	add    %ebx,%eax
  10069e:	8d 34 c5 bc 49 10 00 	lea    0x1049bc(,%eax,8),%esi
  1006a5:	83 ec 08             	sub    $0x8,%esp
  1006a8:	56                   	push   %esi
  1006a9:	6a 10                	push   $0x10
  1006ab:	e8 84 f9 ff ff       	call   100034 <change_tss>
  1006b0:	8d 45 94             	lea    -0x6c(%ebp),%eax
  1006b3:	89 04 24             	mov    %eax,(%esp)
  1006b6:	e8 95 f9 ff ff       	call   100050 <get_tss>
  1006bb:	83 c4 0c             	add    $0xc,%esp
  1006be:	3b 75 98             	cmp    -0x68(%ebp),%esi
  1006c1:	74 12                	je     1006d5 <put_into_running+0x6d>
  1006c3:	83 ec 08             	sub    $0x8,%esp
  1006c6:	6a 20                	push   $0x20
  1006c8:	68 5a 16 10 00       	push   $0x10165a
  1006cd:	e8 22 0e 00 00       	call   1014f4 <abort>
  1006d2:	83 c4 10             	add    $0x10,%esp
  1006d5:	83 ec 0c             	sub    $0xc,%esp
  1006d8:	68 ca 15 10 00       	push   $0x1015ca
  1006dd:	e8 9e 0c 00 00       	call   101380 <printk>
  1006e2:	89 1c 24             	mov    %ebx,(%esp)
  1006e5:	68 5c 17 10 00       	push   $0x10175c
  1006ea:	6a 23                	push   $0x23
  1006ec:	68 5a 16 10 00       	push   $0x10165a
  1006f1:	68 68 16 10 00       	push   $0x101668
  1006f6:	e8 85 0c 00 00       	call   101380 <printk>
  1006fb:	83 c4 14             	add    $0x14,%esp
  1006fe:	68 ec 15 10 00       	push   $0x1015ec
  100703:	e8 78 0c 00 00       	call   101380 <printk>
  100708:	83 c4 10             	add    $0x10,%esp
  10070b:	b8 01 00 00 00       	mov    $0x1,%eax
  100710:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100713:	5b                   	pop    %ebx
  100714:	5e                   	pop    %esi
  100715:	5d                   	pop    %ebp
  100716:	c3                   	ret    
  100717:	90                   	nop
  100718:	83 ec 08             	sub    $0x8,%esp
  10071b:	68 bc 49 10 00       	push   $0x1049bc
  100720:	6a 10                	push   $0x10
  100722:	e8 0d f9 ff ff       	call   100034 <change_tss>
  100727:	8d 85 30 ff ff ff    	lea    -0xd0(%ebp),%eax
  10072d:	89 04 24             	mov    %eax,(%esp)
  100730:	e8 1b f9 ff ff       	call   100050 <get_tss>
  100735:	83 c4 0c             	add    $0xc,%esp
  100738:	81 bd 34 ff ff ff bc 	cmpl   $0x1049bc,-0xcc(%ebp)
  10073f:	49 10 00 
  100742:	74 91                	je     1006d5 <put_into_running+0x6d>
  100744:	83 ec 08             	sub    $0x8,%esp
  100747:	6a 19                	push   $0x19
  100749:	68 5a 16 10 00       	push   $0x10165a
  10074e:	e8 a1 0d 00 00       	call   1014f4 <abort>
  100753:	83 c4 10             	add    $0x10,%esp
  100756:	e9 7a ff ff ff       	jmp    1006d5 <put_into_running+0x6d>
  10075b:	90                   	nop

0010075c <update_block>:
  10075c:	55                   	push   %ebp
  10075d:	89 e5                	mov    %esp,%ebp
  10075f:	b8 01 00 00 00       	mov    $0x1,%eax
  100764:	5d                   	pop    %ebp
  100765:	c3                   	ret    
  100766:	66 90                	xchg   %ax,%ax

00100768 <apply_new_pid>:
  100768:	55                   	push   %ebp
  100769:	89 e5                	mov    %esp,%ebp
  10076b:	b8 02 00 00 00       	mov    $0x2,%eax
  100770:	5d                   	pop    %ebp
  100771:	c3                   	ret    
  100772:	66 90                	xchg   %ax,%ax

00100774 <getpid>:
  100774:	55                   	push   %ebp
  100775:	89 e5                	mov    %esp,%ebp
  100777:	a1 a0 29 10 00       	mov    0x1029a0,%eax
  10077c:	5d                   	pop    %ebp
  10077d:	c3                   	ret    
  10077e:	66 90                	xchg   %ax,%ax

00100780 <getrunnable>:
  100780:	55                   	push   %ebp
  100781:	89 e5                	mov    %esp,%ebp
  100783:	a1 04 20 10 00       	mov    0x102004,%eax
  100788:	5d                   	pop    %ebp
  100789:	c3                   	ret    
  10078a:	66 90                	xchg   %ax,%ax

0010078c <getblocked>:
  10078c:	55                   	push   %ebp
  10078d:	89 e5                	mov    %esp,%ebp
  10078f:	a1 00 20 10 00       	mov    0x102000,%eax
  100794:	5d                   	pop    %ebp
  100795:	c3                   	ret    
  100796:	66 90                	xchg   %ax,%ax

00100798 <transfer_pid_mode>:
  100798:	55                   	push   %ebp
  100799:	89 e5                	mov    %esp,%ebp
  10079b:	b8 01 00 00 00       	mov    $0x1,%eax
  1007a0:	5d                   	pop    %ebp
  1007a1:	c3                   	ret    
  1007a2:	66 90                	xchg   %ax,%ax

001007a4 <get_from_runnable>:
  1007a4:	55                   	push   %ebp
  1007a5:	89 e5                	mov    %esp,%ebp
  1007a7:	53                   	push   %ebx
  1007a8:	51                   	push   %ecx
  1007a9:	8b 1d 04 20 10 00    	mov    0x102004,%ebx
  1007af:	83 fb ff             	cmp    $0xffffffff,%ebx
  1007b2:	0f 84 a8 00 00 00    	je     100860 <get_from_runnable+0xbc>
  1007b8:	89 d8                	mov    %ebx,%eax
  1007ba:	c1 e0 07             	shl    $0x7,%eax
  1007bd:	01 d8                	add    %ebx,%eax
  1007bf:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1007c2:	01 c0                	add    %eax,%eax
  1007c4:	01 d8                	add    %ebx,%eax
  1007c6:	8d 14 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%edx
  1007cd:	8b 82 50 20 00 00    	mov    0x2050(%edx),%eax
  1007d3:	39 d8                	cmp    %ebx,%eax
  1007d5:	74 7d                	je     100854 <get_from_runnable+0xb0>
  1007d7:	8b 8a 4c 20 00 00    	mov    0x204c(%edx),%ecx
  1007dd:	89 ca                	mov    %ecx,%edx
  1007df:	c1 e2 07             	shl    $0x7,%edx
  1007e2:	01 ca                	add    %ecx,%edx
  1007e4:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  1007e7:	01 d2                	add    %edx,%edx
  1007e9:	01 ca                	add    %ecx,%edx
  1007eb:	89 04 d5 10 4a 10 00 	mov    %eax,0x104a10(,%edx,8)
  1007f2:	89 c2                	mov    %eax,%edx
  1007f4:	c1 e2 07             	shl    $0x7,%edx
  1007f7:	01 c2                	add    %eax,%edx
  1007f9:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1007fc:	01 d2                	add    %edx,%edx
  1007fe:	01 c2                	add    %eax,%edx
  100800:	89 0c d5 0c 4a 10 00 	mov    %ecx,0x104a0c(,%edx,8)
  100807:	a3 04 20 10 00       	mov    %eax,0x102004
  10080c:	83 ec 0c             	sub    $0xc,%esp
  10080f:	68 ca 15 10 00       	push   $0x1015ca
  100814:	e8 67 0b 00 00       	call   101380 <printk>
  100819:	58                   	pop    %eax
  10081a:	5a                   	pop    %edx
  10081b:	ff 35 04 20 10 00    	pushl  0x102004
  100821:	53                   	push   %ebx
  100822:	68 38 17 10 00       	push   $0x101738
  100827:	68 82 00 00 00       	push   $0x82
  10082c:	68 5a 16 10 00       	push   $0x10165a
  100831:	68 a0 16 10 00       	push   $0x1016a0
  100836:	e8 45 0b 00 00       	call   101380 <printk>
  10083b:	83 c4 14             	add    $0x14,%esp
  10083e:	68 ec 15 10 00       	push   $0x1015ec
  100843:	e8 38 0b 00 00       	call   101380 <printk>
  100848:	83 c4 10             	add    $0x10,%esp
  10084b:	89 d8                	mov    %ebx,%eax
  10084d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100850:	c9                   	leave  
  100851:	c3                   	ret    
  100852:	66 90                	xchg   %ax,%ax
  100854:	c7 05 04 20 10 00 ff 	movl   $0xffffffff,0x102004
  10085b:	ff ff ff 
  10085e:	eb ac                	jmp    10080c <get_from_runnable+0x68>
  100860:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100865:	eb e6                	jmp    10084d <get_from_runnable+0xa9>
  100867:	90                   	nop

00100868 <put_into_runnable>:
  100868:	55                   	push   %ebp
  100869:	89 e5                	mov    %esp,%ebp
  10086b:	56                   	push   %esi
  10086c:	53                   	push   %ebx
  10086d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100870:	a1 04 20 10 00       	mov    0x102004,%eax
  100875:	83 f8 ff             	cmp    $0xffffffff,%eax
  100878:	0f 84 ee 00 00 00    	je     10096c <put_into_runnable+0x104>
  10087e:	89 c2                	mov    %eax,%edx
  100880:	c1 e2 07             	shl    $0x7,%edx
  100883:	01 c2                	add    %eax,%edx
  100885:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100888:	01 d2                	add    %edx,%edx
  10088a:	01 c2                	add    %eax,%edx
  10088c:	8d 34 d5 c0 29 10 00 	lea    0x1029c0(,%edx,8),%esi
  100893:	8b 8e 4c 20 00 00    	mov    0x204c(%esi),%ecx
  100899:	89 ca                	mov    %ecx,%edx
  10089b:	c1 e2 07             	shl    $0x7,%edx
  10089e:	01 ca                	add    %ecx,%edx
  1008a0:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  1008a3:	01 d2                	add    %edx,%edx
  1008a5:	01 ca                	add    %ecx,%edx
  1008a7:	89 1c d5 10 4a 10 00 	mov    %ebx,0x104a10(,%edx,8)
  1008ae:	89 da                	mov    %ebx,%edx
  1008b0:	c1 e2 07             	shl    $0x7,%edx
  1008b3:	01 da                	add    %ebx,%edx
  1008b5:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  1008b8:	01 d2                	add    %edx,%edx
  1008ba:	01 da                	add    %ebx,%edx
  1008bc:	8d 14 d5 c0 29 10 00 	lea    0x1029c0(,%edx,8),%edx
  1008c3:	89 8a 4c 20 00 00    	mov    %ecx,0x204c(%edx)
  1008c9:	89 82 50 20 00 00    	mov    %eax,0x2050(%edx)
  1008cf:	89 9e 4c 20 00 00    	mov    %ebx,0x204c(%esi)
  1008d5:	89 d8                	mov    %ebx,%eax
  1008d7:	c1 e0 07             	shl    $0x7,%eax
  1008da:	01 d8                	add    %ebx,%eax
  1008dc:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1008df:	01 c0                	add    %eax,%eax
  1008e1:	01 d8                	add    %ebx,%eax
  1008e3:	c7 04 c5 fc 49 10 00 	movl   $0x1,0x1049fc(,%eax,8)
  1008ea:	01 00 00 00 
  1008ee:	85 db                	test   %ebx,%ebx
  1008f0:	75 0a                	jne    1008fc <put_into_runnable+0x94>
  1008f2:	c7 05 e8 49 10 00 60 	movl   $0x100660,0x1049e8
  1008f9:	06 10 00 
  1008fc:	83 ec 0c             	sub    $0xc,%esp
  1008ff:	68 ca 15 10 00       	push   $0x1015ca
  100904:	e8 77 0a 00 00       	call   101380 <printk>
  100909:	58                   	pop    %eax
  10090a:	5a                   	pop    %edx
  10090b:	53                   	push   %ebx
  10090c:	ff 35 04 20 10 00    	pushl  0x102004
  100912:	68 24 17 10 00       	push   $0x101724
  100917:	68 a0 00 00 00       	push   $0xa0
  10091c:	68 5a 16 10 00       	push   $0x10165a
  100921:	68 d4 16 10 00       	push   $0x1016d4
  100926:	e8 55 0a 00 00       	call   101380 <printk>
  10092b:	83 c4 14             	add    $0x14,%esp
  10092e:	68 ec 15 10 00       	push   $0x1015ec
  100933:	e8 48 0a 00 00       	call   101380 <printk>
  100938:	89 d8                	mov    %ebx,%eax
  10093a:	c1 e0 07             	shl    $0x7,%eax
  10093d:	01 d8                	add    %ebx,%eax
  10093f:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100942:	01 c0                	add    %eax,%eax
  100944:	01 c3                	add    %eax,%ebx
  100946:	8d 04 dd c0 29 10 00 	lea    0x1029c0(,%ebx,8),%eax
  10094d:	8b 55 0c             	mov    0xc(%ebp),%edx
  100950:	89 90 54 20 00 00    	mov    %edx,0x2054(%eax)
  100956:	c7 80 40 20 00 00 0a 	movl   $0xa,0x2040(%eax)
  10095d:	00 00 00 
  100960:	b8 01 00 00 00       	mov    $0x1,%eax
  100965:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100968:	5b                   	pop    %ebx
  100969:	5e                   	pop    %esi
  10096a:	5d                   	pop    %ebp
  10096b:	c3                   	ret    
  10096c:	89 1d 04 20 10 00    	mov    %ebx,0x102004
  100972:	89 d8                	mov    %ebx,%eax
  100974:	c1 e0 07             	shl    $0x7,%eax
  100977:	01 d8                	add    %ebx,%eax
  100979:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10097c:	01 c0                	add    %eax,%eax
  10097e:	01 d8                	add    %ebx,%eax
  100980:	8d 04 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%eax
  100987:	89 98 4c 20 00 00    	mov    %ebx,0x204c(%eax)
  10098d:	89 98 50 20 00 00    	mov    %ebx,0x2050(%eax)
  100993:	e9 3d ff ff ff       	jmp    1008d5 <put_into_runnable+0x6d>

00100998 <put_into_block>:
  100998:	55                   	push   %ebp
  100999:	89 e5                	mov    %esp,%ebp
  10099b:	57                   	push   %edi
  10099c:	56                   	push   %esi
  10099d:	53                   	push   %ebx
  10099e:	8b 45 08             	mov    0x8(%ebp),%eax
  1009a1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  1009a4:	8b 15 00 20 10 00    	mov    0x102000,%edx
  1009aa:	83 fa ff             	cmp    $0xffffffff,%edx
  1009ad:	0f 84 99 00 00 00    	je     100a4c <put_into_block+0xb4>
  1009b3:	89 d1                	mov    %edx,%ecx
  1009b5:	c1 e1 07             	shl    $0x7,%ecx
  1009b8:	01 d1                	add    %edx,%ecx
  1009ba:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  1009bd:	01 c9                	add    %ecx,%ecx
  1009bf:	01 d1                	add    %edx,%ecx
  1009c1:	8d 3c cd c0 29 10 00 	lea    0x1029c0(,%ecx,8),%edi
  1009c8:	8b b7 4c 20 00 00    	mov    0x204c(%edi),%esi
  1009ce:	89 f1                	mov    %esi,%ecx
  1009d0:	c1 e1 07             	shl    $0x7,%ecx
  1009d3:	01 f1                	add    %esi,%ecx
  1009d5:	8d 0c 8e             	lea    (%esi,%ecx,4),%ecx
  1009d8:	01 c9                	add    %ecx,%ecx
  1009da:	01 f1                	add    %esi,%ecx
  1009dc:	89 04 cd 10 4a 10 00 	mov    %eax,0x104a10(,%ecx,8)
  1009e3:	89 c1                	mov    %eax,%ecx
  1009e5:	c1 e1 07             	shl    $0x7,%ecx
  1009e8:	01 c1                	add    %eax,%ecx
  1009ea:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  1009ed:	01 c9                	add    %ecx,%ecx
  1009ef:	01 c1                	add    %eax,%ecx
  1009f1:	8d 0c cd c0 29 10 00 	lea    0x1029c0(,%ecx,8),%ecx
  1009f8:	89 b1 4c 20 00 00    	mov    %esi,0x204c(%ecx)
  1009fe:	89 91 50 20 00 00    	mov    %edx,0x2050(%ecx)
  100a04:	89 87 4c 20 00 00    	mov    %eax,0x204c(%edi)
  100a0a:	89 c2                	mov    %eax,%edx
  100a0c:	c1 e2 07             	shl    $0x7,%edx
  100a0f:	01 c2                	add    %eax,%edx
  100a11:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100a14:	01 d2                	add    %edx,%edx
  100a16:	01 c2                	add    %eax,%edx
  100a18:	c1 e2 03             	shl    $0x3,%edx
  100a1b:	8d 82 c0 49 10 00    	lea    0x1049c0(%edx),%eax
  100a21:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100a26:	89 c7                	mov    %eax,%edi
  100a28:	89 de                	mov    %ebx,%esi
  100a2a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100a2c:	8b 43 10             	mov    0x10(%ebx),%eax
  100a2f:	89 82 04 4a 10 00    	mov    %eax,0x104a04(%edx)
  100a35:	c7 82 fc 49 10 00 00 	movl   $0x0,0x1049fc(%edx)
  100a3c:	00 00 00 
  100a3f:	b8 01 00 00 00       	mov    $0x1,%eax
  100a44:	5b                   	pop    %ebx
  100a45:	5e                   	pop    %esi
  100a46:	5f                   	pop    %edi
  100a47:	5d                   	pop    %ebp
  100a48:	c3                   	ret    
  100a49:	8d 76 00             	lea    0x0(%esi),%esi
  100a4c:	a3 00 20 10 00       	mov    %eax,0x102000
  100a51:	89 c2                	mov    %eax,%edx
  100a53:	c1 e2 07             	shl    $0x7,%edx
  100a56:	01 c2                	add    %eax,%edx
  100a58:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100a5b:	01 d2                	add    %edx,%edx
  100a5d:	01 c2                	add    %eax,%edx
  100a5f:	8d 14 d5 c0 29 10 00 	lea    0x1029c0(,%edx,8),%edx
  100a66:	89 82 50 20 00 00    	mov    %eax,0x2050(%edx)
  100a6c:	89 82 4c 20 00 00    	mov    %eax,0x204c(%edx)
  100a72:	eb 96                	jmp    100a0a <put_into_block+0x72>

00100a74 <get_from>:
  100a74:	55                   	push   %ebp
  100a75:	89 e5                	mov    %esp,%ebp
  100a77:	56                   	push   %esi
  100a78:	53                   	push   %ebx
  100a79:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100a7c:	8b 45 0c             	mov    0xc(%ebp),%eax
  100a7f:	85 db                	test   %ebx,%ebx
  100a81:	0f 8e 01 01 00 00    	jle    100b88 <get_from+0x114>
  100a87:	39 c3                	cmp    %eax,%ebx
  100a89:	74 42                	je     100acd <get_from+0x59>
  100a8b:	89 da                	mov    %ebx,%edx
  100a8d:	c1 e2 07             	shl    $0x7,%edx
  100a90:	01 da                	add    %ebx,%edx
  100a92:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100a95:	01 d2                	add    %edx,%edx
  100a97:	01 da                	add    %ebx,%edx
  100a99:	8b 14 d5 10 4a 10 00 	mov    0x104a10(,%edx,8),%edx
  100aa0:	39 d3                	cmp    %edx,%ebx
  100aa2:	75 25                	jne    100ac9 <get_from+0x55>
  100aa4:	e9 df 00 00 00       	jmp    100b88 <get_from+0x114>
  100aa9:	8d 76 00             	lea    0x0(%esi),%esi
  100aac:	89 d1                	mov    %edx,%ecx
  100aae:	c1 e1 07             	shl    $0x7,%ecx
  100ab1:	01 d1                	add    %edx,%ecx
  100ab3:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100ab6:	01 c9                	add    %ecx,%ecx
  100ab8:	01 ca                	add    %ecx,%edx
  100aba:	8b 14 d5 10 4a 10 00 	mov    0x104a10(,%edx,8),%edx
  100ac1:	39 d3                	cmp    %edx,%ebx
  100ac3:	0f 84 bf 00 00 00    	je     100b88 <get_from+0x114>
  100ac9:	39 c2                	cmp    %eax,%edx
  100acb:	75 df                	jne    100aac <get_from+0x38>
  100acd:	89 c2                	mov    %eax,%edx
  100acf:	c1 e2 07             	shl    $0x7,%edx
  100ad2:	01 c2                	add    %eax,%edx
  100ad4:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100ad7:	01 d2                	add    %edx,%edx
  100ad9:	01 d0                	add    %edx,%eax
  100adb:	8b 04 c5 fc 49 10 00 	mov    0x1049fc(,%eax,8),%eax
  100ae2:	85 c0                	test   %eax,%eax
  100ae4:	0f 84 c2 00 00 00    	je     100bac <get_from+0x138>
  100aea:	48                   	dec    %eax
  100aeb:	75 7f                	jne    100b6c <get_from+0xf8>
  100aed:	be 04 20 10 00       	mov    $0x102004,%esi
  100af2:	3b 1e                	cmp    (%esi),%ebx
  100af4:	74 15                	je     100b0b <get_from+0x97>
  100af6:	83 ec 08             	sub    $0x8,%esp
  100af9:	68 e2 00 00 00       	push   $0xe2
  100afe:	68 5a 16 10 00       	push   $0x10165a
  100b03:	e8 ec 09 00 00       	call   1014f4 <abort>
  100b08:	83 c4 10             	add    $0x10,%esp
  100b0b:	89 d8                	mov    %ebx,%eax
  100b0d:	c1 e0 07             	shl    $0x7,%eax
  100b10:	01 d8                	add    %ebx,%eax
  100b12:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b15:	01 c0                	add    %eax,%eax
  100b17:	01 d8                	add    %ebx,%eax
  100b19:	8d 14 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%edx
  100b20:	8b 82 50 20 00 00    	mov    0x2050(%edx),%eax
  100b26:	39 d8                	cmp    %ebx,%eax
  100b28:	0f 84 8a 00 00 00    	je     100bb8 <get_from+0x144>
  100b2e:	8b 8a 4c 20 00 00    	mov    0x204c(%edx),%ecx
  100b34:	89 ca                	mov    %ecx,%edx
  100b36:	c1 e2 07             	shl    $0x7,%edx
  100b39:	01 ca                	add    %ecx,%edx
  100b3b:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100b3e:	01 d2                	add    %edx,%edx
  100b40:	01 ca                	add    %ecx,%edx
  100b42:	89 04 d5 10 4a 10 00 	mov    %eax,0x104a10(,%edx,8)
  100b49:	89 c2                	mov    %eax,%edx
  100b4b:	c1 e2 07             	shl    $0x7,%edx
  100b4e:	01 c2                	add    %eax,%edx
  100b50:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100b53:	01 d2                	add    %edx,%edx
  100b55:	01 c2                	add    %eax,%edx
  100b57:	89 0c d5 0c 4a 10 00 	mov    %ecx,0x104a0c(,%edx,8)
  100b5e:	89 06                	mov    %eax,(%esi)
  100b60:	89 d8                	mov    %ebx,%eax
  100b62:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100b65:	5b                   	pop    %ebx
  100b66:	5e                   	pop    %esi
  100b67:	5d                   	pop    %ebp
  100b68:	c3                   	ret    
  100b69:	8d 76 00             	lea    0x0(%esi),%esi
  100b6c:	83 ec 08             	sub    $0x8,%esp
  100b6f:	68 de 00 00 00       	push   $0xde
  100b74:	68 5a 16 10 00       	push   $0x10165a
  100b79:	e8 76 09 00 00       	call   1014f4 <abort>
  100b7e:	a1 00 00 00 00       	mov    0x0,%eax
  100b83:	0f 0b                	ud2    
  100b85:	8d 76 00             	lea    0x0(%esi),%esi
  100b88:	83 ec 08             	sub    $0x8,%esp
  100b8b:	68 cf 00 00 00       	push   $0xcf
  100b90:	68 5a 16 10 00       	push   $0x10165a
  100b95:	e8 5a 09 00 00       	call   1014f4 <abort>
  100b9a:	83 c4 10             	add    $0x10,%esp
  100b9d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100ba2:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100ba5:	5b                   	pop    %ebx
  100ba6:	5e                   	pop    %esi
  100ba7:	5d                   	pop    %ebp
  100ba8:	c3                   	ret    
  100ba9:	8d 76 00             	lea    0x0(%esi),%esi
  100bac:	be 00 20 10 00       	mov    $0x102000,%esi
  100bb1:	e9 3c ff ff ff       	jmp    100af2 <get_from+0x7e>
  100bb6:	66 90                	xchg   %ax,%ax
  100bb8:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100bbe:	89 d8                	mov    %ebx,%eax
  100bc0:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100bc3:	5b                   	pop    %ebx
  100bc4:	5e                   	pop    %esi
  100bc5:	5d                   	pop    %ebp
  100bc6:	c3                   	ret    
  100bc7:	90                   	nop

00100bc8 <get_from_block>:
  100bc8:	55                   	push   %ebp
  100bc9:	89 e5                	mov    %esp,%ebp
  100bcb:	83 ec 10             	sub    $0x10,%esp
  100bce:	ff 75 08             	pushl  0x8(%ebp)
  100bd1:	ff 35 00 20 10 00    	pushl  0x102000
  100bd7:	e8 98 fe ff ff       	call   100a74 <get_from>
  100bdc:	83 c4 10             	add    $0x10,%esp
  100bdf:	40                   	inc    %eax
  100be0:	74 0a                	je     100bec <get_from_block+0x24>
  100be2:	b8 01 00 00 00       	mov    $0x1,%eax
  100be7:	c9                   	leave  
  100be8:	c3                   	ret    
  100be9:	8d 76 00             	lea    0x0(%esi),%esi
  100bec:	83 ec 08             	sub    $0x8,%esp
  100bef:	68 19 01 00 00       	push   $0x119
  100bf4:	68 5a 16 10 00       	push   $0x10165a
  100bf9:	e8 f6 08 00 00       	call   1014f4 <abort>
  100bfe:	83 c4 10             	add    $0x10,%esp
  100c01:	b8 01 00 00 00       	mov    $0x1,%eax
  100c06:	c9                   	leave  
  100c07:	c3                   	ret    

00100c08 <check_block>:
  100c08:	55                   	push   %ebp
  100c09:	89 e5                	mov    %esp,%ebp
  100c0b:	57                   	push   %edi
  100c0c:	56                   	push   %esi
  100c0d:	53                   	push   %ebx
  100c0e:	83 ec 0c             	sub    $0xc,%esp
  100c11:	a1 00 20 10 00       	mov    0x102000,%eax
  100c16:	89 c6                	mov    %eax,%esi
  100c18:	83 f8 ff             	cmp    $0xffffffff,%eax
  100c1b:	74 58                	je     100c75 <check_block+0x6d>
  100c1d:	89 c2                	mov    %eax,%edx
  100c1f:	c1 e2 07             	shl    $0x7,%edx
  100c22:	01 c2                	add    %eax,%edx
  100c24:	8d 3c 90             	lea    (%eax,%edx,4),%edi
  100c27:	01 ff                	add    %edi,%edi
  100c29:	01 c7                	add    %eax,%edi
  100c2b:	eb 0c                	jmp    100c39 <check_block+0x31>
  100c2d:	8d 76 00             	lea    0x0(%esi),%esi
  100c30:	39 c6                	cmp    %eax,%esi
  100c32:	74 3c                	je     100c70 <check_block+0x68>
  100c34:	83 f8 ff             	cmp    $0xffffffff,%eax
  100c37:	74 37                	je     100c70 <check_block+0x68>
  100c39:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
  100c40:	8b 8b 04 4a 10 00    	mov    0x104a04(%ebx),%ecx
  100c46:	85 c9                	test   %ecx,%ecx
  100c48:	7f e6                	jg     100c30 <check_block+0x28>
  100c4a:	83 ec 0c             	sub    $0xc,%esp
  100c4d:	56                   	push   %esi
  100c4e:	e8 75 ff ff ff       	call   100bc8 <get_from_block>
  100c53:	58                   	pop    %eax
  100c54:	5a                   	pop    %edx
  100c55:	81 c3 c0 49 10 00    	add    $0x1049c0,%ebx
  100c5b:	53                   	push   %ebx
  100c5c:	56                   	push   %esi
  100c5d:	e8 06 fc ff ff       	call   100868 <put_into_runnable>
  100c62:	83 c4 10             	add    $0x10,%esp
  100c65:	a1 00 20 10 00       	mov    0x102000,%eax
  100c6a:	39 c6                	cmp    %eax,%esi
  100c6c:	75 c6                	jne    100c34 <check_block+0x2c>
  100c6e:	66 90                	xchg   %ax,%ax
  100c70:	be 01 00 00 00       	mov    $0x1,%esi
  100c75:	89 f0                	mov    %esi,%eax
  100c77:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100c7a:	5b                   	pop    %ebx
  100c7b:	5e                   	pop    %esi
  100c7c:	5f                   	pop    %edi
  100c7d:	5d                   	pop    %ebp
  100c7e:	c3                   	ret    
  100c7f:	90                   	nop

00100c80 <checkTimeCount>:
  100c80:	a1 a4 29 10 00       	mov    0x1029a4,%eax
  100c85:	85 c0                	test   %eax,%eax
  100c87:	0f 84 f7 00 00 00    	je     100d84 <checkTimeCount+0x104>
  100c8d:	55                   	push   %ebp
  100c8e:	89 e5                	mov    %esp,%ebp
  100c90:	57                   	push   %edi
  100c91:	56                   	push   %esi
  100c92:	83 ec 0c             	sub    $0xc,%esp
  100c95:	68 ca 15 10 00       	push   $0x1015ca
  100c9a:	e8 e1 06 00 00       	call   101380 <printk>
  100c9f:	5e                   	pop    %esi
  100ca0:	ff 35 a0 29 10 00    	pushl  0x1029a0
  100ca6:	68 4c 17 10 00       	push   $0x10174c
  100cab:	6a 30                	push   $0x30
  100cad:	68 5a 16 10 00       	push   $0x10165a
  100cb2:	68 86 16 10 00       	push   $0x101686
  100cb7:	e8 c4 06 00 00       	call   101380 <printk>
  100cbc:	83 c4 14             	add    $0x14,%esp
  100cbf:	68 ec 15 10 00       	push   $0x1015ec
  100cc4:	e8 b7 06 00 00       	call   101380 <printk>
  100cc9:	c7 04 24 ca 15 10 00 	movl   $0x1015ca,(%esp)
  100cd0:	e8 ab 06 00 00       	call   101380 <printk>
  100cd5:	5f                   	pop    %edi
  100cd6:	a1 a0 29 10 00       	mov    0x1029a0,%eax
  100cdb:	89 c2                	mov    %eax,%edx
  100cdd:	c1 e2 07             	shl    $0x7,%edx
  100ce0:	01 c2                	add    %eax,%edx
  100ce2:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100ce5:	01 d2                	add    %edx,%edx
  100ce7:	01 d0                	add    %edx,%eax
  100ce9:	ff 34 c5 00 4a 10 00 	pushl  0x104a00(,%eax,8)
  100cf0:	68 4c 17 10 00       	push   $0x10174c
  100cf5:	6a 31                	push   $0x31
  100cf7:	68 5a 16 10 00       	push   $0x10165a
  100cfc:	68 04 17 10 00       	push   $0x101704
  100d01:	e8 7a 06 00 00       	call   101380 <printk>
  100d06:	83 c4 14             	add    $0x14,%esp
  100d09:	68 ec 15 10 00       	push   $0x1015ec
  100d0e:	e8 6d 06 00 00       	call   101380 <printk>
  100d13:	e8 f0 fe ff ff       	call   100c08 <check_block>
  100d18:	8b 15 a0 29 10 00    	mov    0x1029a0,%edx
  100d1e:	89 d0                	mov    %edx,%eax
  100d20:	c1 e0 07             	shl    $0x7,%eax
  100d23:	01 d0                	add    %edx,%eax
  100d25:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100d28:	01 c0                	add    %eax,%eax
  100d2a:	01 d0                	add    %edx,%eax
  100d2c:	c1 e0 03             	shl    $0x3,%eax
  100d2f:	83 c4 10             	add    $0x10,%esp
  100d32:	8b 88 00 4a 10 00    	mov    0x104a00(%eax),%ecx
  100d38:	85 c9                	test   %ecx,%ecx
  100d3a:	7e 0c                	jle    100d48 <checkTimeCount+0xc8>
  100d3c:	b8 01 00 00 00       	mov    $0x1,%eax
  100d41:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d44:	5e                   	pop    %esi
  100d45:	5f                   	pop    %edi
  100d46:	5d                   	pop    %ebp
  100d47:	c3                   	ret    
  100d48:	05 c0 49 10 00       	add    $0x1049c0,%eax
  100d4d:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100d52:	89 c7                	mov    %eax,%edi
  100d54:	8b 75 08             	mov    0x8(%ebp),%esi
  100d57:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100d59:	83 ec 08             	sub    $0x8,%esp
  100d5c:	ff 75 08             	pushl  0x8(%ebp)
  100d5f:	52                   	push   %edx
  100d60:	e8 03 fb ff ff       	call   100868 <put_into_runnable>
  100d65:	e8 3a fa ff ff       	call   1007a4 <get_from_runnable>
  100d6a:	5a                   	pop    %edx
  100d6b:	59                   	pop    %ecx
  100d6c:	ff 75 08             	pushl  0x8(%ebp)
  100d6f:	50                   	push   %eax
  100d70:	e8 f3 f8 ff ff       	call   100668 <put_into_running>
  100d75:	83 c4 10             	add    $0x10,%esp
  100d78:	b8 01 00 00 00       	mov    $0x1,%eax
  100d7d:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d80:	5e                   	pop    %esi
  100d81:	5f                   	pop    %edi
  100d82:	5d                   	pop    %ebp
  100d83:	c3                   	ret    
  100d84:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100d89:	c3                   	ret    
  100d8a:	66 90                	xchg   %ax,%ax

00100d8c <check_is_in>:
  100d8c:	55                   	push   %ebp
  100d8d:	89 e5                	mov    %esp,%ebp
  100d8f:	53                   	push   %ebx
  100d90:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100d93:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100d96:	85 c9                	test   %ecx,%ecx
  100d98:	7e 4a                	jle    100de4 <check_is_in+0x58>
  100d9a:	39 d9                	cmp    %ebx,%ecx
  100d9c:	74 3b                	je     100dd9 <check_is_in+0x4d>
  100d9e:	89 c8                	mov    %ecx,%eax
  100da0:	c1 e0 07             	shl    $0x7,%eax
  100da3:	01 c8                	add    %ecx,%eax
  100da5:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100da8:	01 c0                	add    %eax,%eax
  100daa:	01 c8                	add    %ecx,%eax
  100dac:	8b 04 c5 10 4a 10 00 	mov    0x104a10(,%eax,8),%eax
  100db3:	39 c1                	cmp    %eax,%ecx
  100db5:	75 1e                	jne    100dd5 <check_is_in+0x49>
  100db7:	eb 2b                	jmp    100de4 <check_is_in+0x58>
  100db9:	8d 76 00             	lea    0x0(%esi),%esi
  100dbc:	89 c2                	mov    %eax,%edx
  100dbe:	c1 e2 07             	shl    $0x7,%edx
  100dc1:	01 c2                	add    %eax,%edx
  100dc3:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100dc6:	01 d2                	add    %edx,%edx
  100dc8:	01 d0                	add    %edx,%eax
  100dca:	8b 04 c5 10 4a 10 00 	mov    0x104a10(,%eax,8),%eax
  100dd1:	39 c1                	cmp    %eax,%ecx
  100dd3:	74 0f                	je     100de4 <check_is_in+0x58>
  100dd5:	39 c3                	cmp    %eax,%ebx
  100dd7:	75 e3                	jne    100dbc <check_is_in+0x30>
  100dd9:	b8 01 00 00 00       	mov    $0x1,%eax
  100dde:	5b                   	pop    %ebx
  100ddf:	5d                   	pop    %ebp
  100de0:	c3                   	ret    
  100de1:	8d 76 00             	lea    0x0(%esi),%esi
  100de4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100de9:	5b                   	pop    %ebx
  100dea:	5d                   	pop    %ebp
  100deb:	c3                   	ret    

00100dec <block_decrease>:
  100dec:	55                   	push   %ebp
  100ded:	89 e5                	mov    %esp,%ebp
  100def:	8b 0d 00 20 10 00    	mov    0x102000,%ecx
  100df5:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100df8:	74 2e                	je     100e28 <block_decrease+0x3c>
  100dfa:	89 c8                	mov    %ecx,%eax
  100dfc:	89 c2                	mov    %eax,%edx
  100dfe:	c1 e2 07             	shl    $0x7,%edx
  100e01:	01 c2                	add    %eax,%edx
  100e03:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100e06:	01 d2                	add    %edx,%edx
  100e08:	01 d0                	add    %edx,%eax
  100e0a:	8d 04 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%eax
  100e11:	ff 88 44 20 00 00    	decl   0x2044(%eax)
  100e17:	8b 80 50 20 00 00    	mov    0x2050(%eax),%eax
  100e1d:	39 c1                	cmp    %eax,%ecx
  100e1f:	75 db                	jne    100dfc <block_decrease+0x10>
  100e21:	b8 01 00 00 00       	mov    $0x1,%eax
  100e26:	5d                   	pop    %ebp
  100e27:	c3                   	ret    
  100e28:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e2d:	5d                   	pop    %ebp
  100e2e:	c3                   	ret    
  100e2f:	90                   	nop

00100e30 <init_pcb>:
  100e30:	55                   	push   %ebp
  100e31:	89 e5                	mov    %esp,%ebp
  100e33:	ba 08 4a 10 00       	mov    $0x104a08,%edx
  100e38:	31 c0                	xor    %eax,%eax
  100e3a:	66 90                	xchg   %ax,%ax
  100e3c:	89 02                	mov    %eax,(%edx)
  100e3e:	8d 48 ff             	lea    -0x1(%eax),%ecx
  100e41:	89 4a 04             	mov    %ecx,0x4(%edx)
  100e44:	40                   	inc    %eax
  100e45:	89 42 08             	mov    %eax,0x8(%edx)
  100e48:	81 c2 58 20 00 00    	add    $0x2058,%edx
  100e4e:	3d 00 08 00 00       	cmp    $0x800,%eax
  100e53:	75 e7                	jne    100e3c <init_pcb+0xc>
  100e55:	c7 05 0c 4a 10 00 ff 	movl   $0x7ff,0x104a0c
  100e5c:	07 00 00 
  100e5f:	c7 05 b8 e9 12 01 00 	movl   $0x0,0x112e9b8
  100e66:	00 00 00 
  100e69:	5d                   	pop    %ebp
  100e6a:	c3                   	ret    
  100e6b:	90                   	nop

00100e6c <init_kernel_pcb>:
  100e6c:	55                   	push   %ebp
  100e6d:	89 e5                	mov    %esp,%ebp
  100e6f:	c7 05 f8 49 10 00 10 	movl   $0x10,0x1049f8
  100e76:	00 00 00 
  100e79:	c7 05 ec 49 10 00 08 	movl   $0x8,0x1049ec
  100e80:	00 00 00 
  100e83:	c7 05 e8 49 10 00 60 	movl   $0x100660,0x1049e8
  100e8a:	06 10 00 
  100e8d:	c7 05 f4 49 10 00 00 	movl   $0x7f00000,0x1049f4
  100e94:	00 f0 07 
  100e97:	c7 05 fc 49 10 00 01 	movl   $0x1,0x1049fc
  100e9e:	00 00 00 
  100ea1:	c7 05 00 4a 10 00 04 	movl   $0x4,0x104a00
  100ea8:	00 00 00 
  100eab:	b8 01 00 00 00       	mov    $0x1,%eax
  100eb0:	5d                   	pop    %ebp
  100eb1:	c3                   	ret    
  100eb2:	66 90                	xchg   %ax,%ax

00100eb4 <transfer_pid_state>:
  100eb4:	55                   	push   %ebp
  100eb5:	89 e5                	mov    %esp,%ebp
  100eb7:	b8 01 00 00 00       	mov    $0x1,%eax
  100ebc:	5d                   	pop    %ebp
  100ebd:	c3                   	ret    
  100ebe:	66 90                	xchg   %ax,%ax

00100ec0 <make_pcb>:
  100ec0:	55                   	push   %ebp
  100ec1:	89 e5                	mov    %esp,%ebp
  100ec3:	57                   	push   %edi
  100ec4:	56                   	push   %esi
  100ec5:	8b 45 08             	mov    0x8(%ebp),%eax
  100ec8:	89 c2                	mov    %eax,%edx
  100eca:	c1 e2 07             	shl    $0x7,%edx
  100ecd:	01 c2                	add    %eax,%edx
  100ecf:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100ed2:	01 d2                	add    %edx,%edx
  100ed4:	01 c2                	add    %eax,%edx
  100ed6:	c1 e2 03             	shl    $0x3,%edx
  100ed9:	8d 82 c0 49 10 00    	lea    0x1049c0(%edx),%eax
  100edf:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100ee4:	89 c7                	mov    %eax,%edi
  100ee6:	8b 75 0c             	mov    0xc(%ebp),%esi
  100ee9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100eeb:	8b 45 10             	mov    0x10(%ebp),%eax
  100eee:	89 82 fc 49 10 00    	mov    %eax,0x1049fc(%edx)
  100ef4:	8b 45 14             	mov    0x14(%ebp),%eax
  100ef7:	89 82 00 4a 10 00    	mov    %eax,0x104a00(%edx)
  100efd:	8b 45 18             	mov    0x18(%ebp),%eax
  100f00:	89 82 04 4a 10 00    	mov    %eax,0x104a04(%edx)
  100f06:	8b 45 0c             	mov    0xc(%ebp),%eax
  100f09:	89 82 14 4a 10 00    	mov    %eax,0x104a14(%edx)
  100f0f:	b8 01 00 00 00       	mov    $0x1,%eax
  100f14:	5e                   	pop    %esi
  100f15:	5f                   	pop    %edi
  100f16:	5d                   	pop    %ebp
  100f17:	c3                   	ret    

00100f18 <initIdt>:
  100f18:	55                   	push   %ebp
  100f19:	89 e5                	mov    %esp,%ebp
  100f1b:	53                   	push   %ebx
  100f1c:	ba 8b 15 10 00       	mov    $0x10158b,%edx
  100f21:	89 d3                	mov    %edx,%ebx
  100f23:	c1 ea 10             	shr    $0x10,%edx
  100f26:	b9 80 f2 12 01       	mov    $0x112f280,%ecx
  100f2b:	b8 80 ea 12 01       	mov    $0x112ea80,%eax
  100f30:	66 89 18             	mov    %bx,(%eax)
  100f33:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100f39:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100f3d:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100f41:	66 89 50 06          	mov    %dx,0x6(%eax)
  100f45:	83 c0 08             	add    $0x8,%eax
  100f48:	39 c1                	cmp    %eax,%ecx
  100f4a:	75 e4                	jne    100f30 <initIdt+0x18>
  100f4c:	b8 91 15 10 00       	mov    $0x101591,%eax
  100f51:	66 a3 e8 ea 12 01    	mov    %ax,0x112eae8
  100f57:	66 c7 05 ea ea 12 01 	movw   $0x8,0x112eaea
  100f5e:	08 00 
  100f60:	c6 05 ec ea 12 01 00 	movb   $0x0,0x112eaec
  100f67:	c6 05 ed ea 12 01 8f 	movb   $0x8f,0x112eaed
  100f6e:	c1 e8 10             	shr    $0x10,%eax
  100f71:	66 a3 ee ea 12 01    	mov    %ax,0x112eaee
  100f77:	b8 95 15 10 00       	mov    $0x101595,%eax
  100f7c:	66 a3 80 ee 12 01    	mov    %ax,0x112ee80
  100f82:	66 c7 05 82 ee 12 01 	movw   $0x8,0x112ee82
  100f89:	08 00 
  100f8b:	c6 05 84 ee 12 01 00 	movb   $0x0,0x112ee84
  100f92:	c6 05 85 ee 12 01 ee 	movb   $0xee,0x112ee85
  100f99:	c1 e8 10             	shr    $0x10,%eax
  100f9c:	66 a3 86 ee 12 01    	mov    %ax,0x112ee86
  100fa2:	b8 9e 15 10 00       	mov    $0x10159e,%eax
  100fa7:	66 a3 80 eb 12 01    	mov    %ax,0x112eb80
  100fad:	66 c7 05 82 eb 12 01 	movw   $0x8,0x112eb82
  100fb4:	08 00 
  100fb6:	c6 05 84 eb 12 01 00 	movb   $0x0,0x112eb84
  100fbd:	c6 05 85 eb 12 01 8e 	movb   $0x8e,0x112eb85
  100fc4:	c1 e8 10             	shr    $0x10,%eax
  100fc7:	66 a3 86 eb 12 01    	mov    %ax,0x112eb86
  100fcd:	66 c7 05 30 21 10 00 	movw   $0x7ff,0x102130
  100fd4:	ff 07 
  100fd6:	b8 80 ea 12 01       	mov    $0x112ea80,%eax
  100fdb:	66 a3 32 21 10 00    	mov    %ax,0x102132
  100fe1:	c1 e8 10             	shr    $0x10,%eax
  100fe4:	66 a3 34 21 10 00    	mov    %ax,0x102134
  100fea:	b8 30 21 10 00       	mov    $0x102130,%eax
  100fef:	0f 01 18             	lidtl  (%eax)
  100ff2:	5b                   	pop    %ebx
  100ff3:	5d                   	pop    %ebp
  100ff4:	c3                   	ret    
  100ff5:	66 90                	xchg   %ax,%ax
  100ff7:	90                   	nop

00100ff8 <syscallHandle>:
  100ff8:	55                   	push   %ebp
  100ff9:	89 e5                	mov    %esp,%ebp
  100ffb:	53                   	push   %ebx
  100ffc:	50                   	push   %eax
  100ffd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101000:	8b 43 1c             	mov    0x1c(%ebx),%eax
  101003:	83 f8 02             	cmp    $0x2,%eax
  101006:	74 28                	je     101030 <syscallHandle+0x38>
  101008:	76 3a                	jbe    101044 <syscallHandle+0x4c>
  10100a:	83 f8 04             	cmp    $0x4,%eax
  10100d:	74 15                	je     101024 <syscallHandle+0x2c>
  10100f:	3d e6 00 00 00       	cmp    $0xe6,%eax
  101014:	75 29                	jne    10103f <syscallHandle+0x47>
  101016:	89 5d 08             	mov    %ebx,0x8(%ebp)
  101019:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10101c:	c9                   	leave  
  10101d:	e9 c6 f3 ff ff       	jmp    1003e8 <sys_sleep>
  101022:	66 90                	xchg   %ax,%ax
  101024:	89 5d 08             	mov    %ebx,0x8(%ebp)
  101027:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10102a:	c9                   	leave  
  10102b:	e9 88 f5 ff ff       	jmp    1005b8 <sys_write>
  101030:	83 ec 0c             	sub    $0xc,%esp
  101033:	53                   	push   %ebx
  101034:	e8 33 f4 ff ff       	call   10046c <sys_fork>
  101039:	89 43 1c             	mov    %eax,0x1c(%ebx)
  10103c:	83 c4 10             	add    $0x10,%esp
  10103f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101042:	c9                   	leave  
  101043:	c3                   	ret    
  101044:	48                   	dec    %eax
  101045:	75 f8                	jne    10103f <syscallHandle+0x47>
  101047:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10104a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10104d:	c9                   	leave  
  10104e:	e9 6d f3 ff ff       	jmp    1003c0 <sys_exit>
  101053:	90                   	nop

00101054 <GProtectFaultHandle>:
  101054:	55                   	push   %ebp
  101055:	89 e5                	mov    %esp,%ebp
  101057:	83 ec 14             	sub    $0x14,%esp
  10105a:	68 ca 15 10 00       	push   $0x1015ca
  10105f:	e8 1c 03 00 00       	call   101380 <printk>
  101064:	58                   	pop    %eax
  101065:	8b 45 08             	mov    0x8(%ebp),%eax
  101068:	ff 70 20             	pushl  0x20(%eax)
  10106b:	68 98 17 10 00       	push   $0x101798
  101070:	6a 65                	push   $0x65
  101072:	68 6d 17 10 00       	push   $0x10176d
  101077:	68 80 17 10 00       	push   $0x101780
  10107c:	e8 ff 02 00 00       	call   101380 <printk>
  101081:	83 c4 14             	add    $0x14,%esp
  101084:	68 ec 15 10 00       	push   $0x1015ec
  101089:	e8 f2 02 00 00       	call   101380 <printk>
  10108e:	5a                   	pop    %edx
  10108f:	59                   	pop    %ecx
  101090:	6a 66                	push   $0x66
  101092:	68 6d 17 10 00       	push   $0x10176d
  101097:	e8 58 04 00 00       	call   1014f4 <abort>
  10109c:	83 c4 10             	add    $0x10,%esp
  10109f:	c9                   	leave  
  1010a0:	c3                   	ret    
  1010a1:	8d 76 00             	lea    0x0(%esi),%esi

001010a4 <timeHandle>:
  1010a4:	55                   	push   %ebp
  1010a5:	89 e5                	mov    %esp,%ebp
  1010a7:	53                   	push   %ebx
  1010a8:	83 ec 10             	sub    $0x10,%esp
  1010ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1010ae:	6a 41                	push   $0x41
  1010b0:	e8 8f f5 ff ff       	call   100644 <putChar>
  1010b5:	e8 ba f6 ff ff       	call   100774 <getpid>
  1010ba:	89 c2                	mov    %eax,%edx
  1010bc:	c1 e2 07             	shl    $0x7,%edx
  1010bf:	01 c2                	add    %eax,%edx
  1010c1:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1010c4:	01 d2                	add    %edx,%edx
  1010c6:	01 d0                	add    %edx,%eax
  1010c8:	ff 0c c5 00 4a 10 00 	decl   0x104a00(,%eax,8)
  1010cf:	e8 18 fd ff ff       	call   100dec <block_decrease>
  1010d4:	89 1c 24             	mov    %ebx,(%esp)
  1010d7:	e8 a4 fb ff ff       	call   100c80 <checkTimeCount>
  1010dc:	83 c4 10             	add    $0x10,%esp
  1010df:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  1010e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1010e9:	c9                   	leave  
  1010ea:	e9 55 f5 ff ff       	jmp    100644 <putChar>
  1010ef:	90                   	nop

001010f0 <irqHandle>:
  1010f0:	55                   	push   %ebp
  1010f1:	89 e5                	mov    %esp,%ebp
  1010f3:	57                   	push   %edi
  1010f4:	56                   	push   %esi
  1010f5:	53                   	push   %ebx
  1010f6:	83 ec 1c             	sub    $0x1c,%esp
  1010f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1010fc:	89 6d e4             	mov    %ebp,-0x1c(%ebp)
  1010ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  101102:	8d 78 08             	lea    0x8(%eax),%edi
  101105:	3b 58 08             	cmp    0x8(%eax),%ebx
  101108:	74 12                	je     10111c <irqHandle+0x2c>
  10110a:	83 ec 08             	sub    $0x8,%esp
  10110d:	6a 1c                	push   $0x1c
  10110f:	68 6d 17 10 00       	push   $0x10176d
  101114:	e8 db 03 00 00       	call   1014f4 <abort>
  101119:	83 c4 10             	add    $0x10,%esp
  10111c:	e8 53 f6 ff ff       	call   100774 <getpid>
  101121:	89 c6                	mov    %eax,%esi
  101123:	fa                   	cli    
  101124:	8b 43 20             	mov    0x20(%ebx),%eax
  101127:	83 f8 0d             	cmp    $0xd,%eax
  10112a:	0f 84 bc 00 00 00    	je     1011ec <irqHandle+0xfc>
  101130:	0f 8e 96 00 00 00    	jle    1011cc <irqHandle+0xdc>
  101136:	83 f8 20             	cmp    $0x20,%eax
  101139:	74 2d                	je     101168 <irqHandle+0x78>
  10113b:	83 c0 80             	add    $0xffffff80,%eax
  10113e:	0f 85 8b 00 00 00    	jne    1011cf <irqHandle+0xdf>
  101144:	83 ec 0c             	sub    $0xc,%esp
  101147:	53                   	push   %ebx
  101148:	e8 ab fe ff ff       	call   100ff8 <syscallHandle>
  10114d:	8b 43 20             	mov    0x20(%ebx),%eax
  101150:	83 c4 10             	add    $0x10,%esp
  101153:	3d 80 00 00 00       	cmp    $0x80,%eax
  101158:	74 26                	je     101180 <irqHandle+0x90>
  10115a:	83 f8 20             	cmp    $0x20,%eax
  10115d:	74 21                	je     101180 <irqHandle+0x90>
  10115f:	fb                   	sti    
  101160:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101163:	5b                   	pop    %ebx
  101164:	5e                   	pop    %esi
  101165:	5f                   	pop    %edi
  101166:	5d                   	pop    %ebp
  101167:	c3                   	ret    
  101168:	83 ec 0c             	sub    $0xc,%esp
  10116b:	53                   	push   %ebx
  10116c:	e8 33 ff ff ff       	call   1010a4 <timeHandle>
  101171:	8b 43 20             	mov    0x20(%ebx),%eax
  101174:	83 c4 10             	add    $0x10,%esp
  101177:	3d 80 00 00 00       	cmp    $0x80,%eax
  10117c:	75 dc                	jne    10115a <irqHandle+0x6a>
  10117e:	66 90                	xchg   %ax,%ax
  101180:	e8 ef f5 ff ff       	call   100774 <getpid>
  101185:	39 c6                	cmp    %eax,%esi
  101187:	74 d6                	je     10115f <irqHandle+0x6f>
  101189:	e8 e6 f5 ff ff       	call   100774 <getpid>
  10118e:	89 c2                	mov    %eax,%edx
  101190:	c1 e2 07             	shl    $0x7,%edx
  101193:	01 c2                	add    %eax,%edx
  101195:	8d 14 90             	lea    (%eax,%edx,4),%edx
  101198:	01 d2                	add    %edx,%edx
  10119a:	01 d0                	add    %edx,%eax
  10119c:	8d 1c c5 80 49 10 00 	lea    0x104980(,%eax,8),%ebx
  1011a3:	89 1f                	mov    %ebx,(%edi)
  1011a5:	e8 ca f5 ff ff       	call   100774 <getpid>
  1011aa:	89 c2                	mov    %eax,%edx
  1011ac:	c1 e2 07             	shl    $0x7,%edx
  1011af:	01 c2                	add    %eax,%edx
  1011b1:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1011b4:	01 d2                	add    %edx,%edx
  1011b6:	01 d0                	add    %edx,%eax
  1011b8:	8d 34 c5 c0 49 10 00 	lea    0x1049c0(,%eax,8),%esi
  1011bf:	b9 0f 00 00 00       	mov    $0xf,%ecx
  1011c4:	89 df                	mov    %ebx,%edi
  1011c6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1011c8:	eb 95                	jmp    10115f <irqHandle+0x6f>
  1011ca:	66 90                	xchg   %ax,%ax
  1011cc:	40                   	inc    %eax
  1011cd:	74 90                	je     10115f <irqHandle+0x6f>
  1011cf:	83 ec 08             	sub    $0x8,%esp
  1011d2:	6a 33                	push   $0x33
  1011d4:	68 6d 17 10 00       	push   $0x10176d
  1011d9:	e8 16 03 00 00       	call   1014f4 <abort>
  1011de:	8b 43 20             	mov    0x20(%ebx),%eax
  1011e1:	83 c4 10             	add    $0x10,%esp
  1011e4:	e9 6a ff ff ff       	jmp    101153 <irqHandle+0x63>
  1011e9:	8d 76 00             	lea    0x0(%esi),%esi
  1011ec:	83 ec 0c             	sub    $0xc,%esp
  1011ef:	53                   	push   %ebx
  1011f0:	e8 5f fe ff ff       	call   101054 <GProtectFaultHandle>
  1011f5:	8b 43 20             	mov    0x20(%ebx),%eax
  1011f8:	83 c4 10             	add    $0x10,%esp
  1011fb:	e9 53 ff ff ff       	jmp    101153 <irqHandle+0x63>

00101200 <initIntr>:
  101200:	55                   	push   %ebp
  101201:	89 e5                	mov    %esp,%ebp
  101203:	ba 21 00 00 00       	mov    $0x21,%edx
  101208:	b0 ff                	mov    $0xff,%al
  10120a:	ee                   	out    %al,(%dx)
  10120b:	ba a1 00 00 00       	mov    $0xa1,%edx
  101210:	ee                   	out    %al,(%dx)
  101211:	ba 20 00 00 00       	mov    $0x20,%edx
  101216:	b0 11                	mov    $0x11,%al
  101218:	ee                   	out    %al,(%dx)
  101219:	ba 21 00 00 00       	mov    $0x21,%edx
  10121e:	b0 20                	mov    $0x20,%al
  101220:	ee                   	out    %al,(%dx)
  101221:	b0 04                	mov    $0x4,%al
  101223:	ee                   	out    %al,(%dx)
  101224:	b0 03                	mov    $0x3,%al
  101226:	ee                   	out    %al,(%dx)
  101227:	ba a0 00 00 00       	mov    $0xa0,%edx
  10122c:	b0 11                	mov    $0x11,%al
  10122e:	ee                   	out    %al,(%dx)
  10122f:	ba a1 00 00 00       	mov    $0xa1,%edx
  101234:	b0 28                	mov    $0x28,%al
  101236:	ee                   	out    %al,(%dx)
  101237:	b0 02                	mov    $0x2,%al
  101239:	ee                   	out    %al,(%dx)
  10123a:	b0 03                	mov    $0x3,%al
  10123c:	ee                   	out    %al,(%dx)
  10123d:	ba 20 00 00 00       	mov    $0x20,%edx
  101242:	b0 68                	mov    $0x68,%al
  101244:	ee                   	out    %al,(%dx)
  101245:	b0 0a                	mov    $0xa,%al
  101247:	ee                   	out    %al,(%dx)
  101248:	ba a0 00 00 00       	mov    $0xa0,%edx
  10124d:	b0 68                	mov    $0x68,%al
  10124f:	ee                   	out    %al,(%dx)
  101250:	b0 0a                	mov    $0xa,%al
  101252:	ee                   	out    %al,(%dx)
  101253:	5d                   	pop    %ebp
  101254:	c3                   	ret    
  101255:	8d 76 00             	lea    0x0(%esi),%esi

00101258 <initTimer>:
  101258:	55                   	push   %ebp
  101259:	89 e5                	mov    %esp,%ebp
  10125b:	ba 43 00 00 00       	mov    $0x43,%edx
  101260:	b0 34                	mov    $0x34,%al
  101262:	ee                   	out    %al,(%dx)
  101263:	ba 40 00 00 00       	mov    $0x40,%edx
  101268:	b0 9b                	mov    $0x9b,%al
  10126a:	ee                   	out    %al,(%dx)
  10126b:	b0 2e                	mov    $0x2e,%al
  10126d:	ee                   	out    %al,(%dx)
  10126e:	5d                   	pop    %ebp
  10126f:	c3                   	ret    

00101270 <i2A>:
  101270:	55                   	push   %ebp
  101271:	89 e5                	mov    %esp,%ebp
  101273:	57                   	push   %edi
  101274:	56                   	push   %esi
  101275:	53                   	push   %ebx
  101276:	51                   	push   %ecx
  101277:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10127a:	85 c9                	test   %ecx,%ecx
  10127c:	78 6e                	js     1012ec <i2A+0x7c>
  10127e:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  101282:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  101286:	bb 7e 21 10 00       	mov    $0x10217e,%ebx
  10128b:	31 ff                	xor    %edi,%edi
  10128d:	eb 03                	jmp    101292 <i2A+0x22>
  10128f:	90                   	nop
  101290:	89 f7                	mov    %esi,%edi
  101292:	4b                   	dec    %ebx
  101293:	89 c8                	mov    %ecx,%eax
  101295:	be 0a 00 00 00       	mov    $0xa,%esi
  10129a:	99                   	cltd   
  10129b:	f7 fe                	idiv   %esi
  10129d:	83 c2 30             	add    $0x30,%edx
  1012a0:	88 13                	mov    %dl,(%ebx)
  1012a2:	8d 77 01             	lea    0x1(%edi),%esi
  1012a5:	b8 67 66 66 66       	mov    $0x66666667,%eax
  1012aa:	f7 e9                	imul   %ecx
  1012ac:	89 d0                	mov    %edx,%eax
  1012ae:	c1 f8 02             	sar    $0x2,%eax
  1012b1:	c1 f9 1f             	sar    $0x1f,%ecx
  1012b4:	29 c8                	sub    %ecx,%eax
  1012b6:	89 c1                	mov    %eax,%ecx
  1012b8:	75 d6                	jne    101290 <i2A+0x20>
  1012ba:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  1012be:	74 20                	je     1012e0 <i2A+0x70>
  1012c0:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  1012c4:	75 06                	jne    1012cc <i2A+0x5c>
  1012c6:	fe 05 7d 21 10 00    	incb   0x10217d
  1012cc:	c6 05 7e 21 10 00 00 	movb   $0x0,0x10217e
  1012d3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1012d6:	89 18                	mov    %ebx,(%eax)
  1012d8:	89 f0                	mov    %esi,%eax
  1012da:	5a                   	pop    %edx
  1012db:	5b                   	pop    %ebx
  1012dc:	5e                   	pop    %esi
  1012dd:	5f                   	pop    %edi
  1012de:	5d                   	pop    %ebp
  1012df:	c3                   	ret    
  1012e0:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  1012e4:	8d 77 02             	lea    0x2(%edi),%esi
  1012e7:	4b                   	dec    %ebx
  1012e8:	eb d6                	jmp    1012c0 <i2A+0x50>
  1012ea:	66 90                	xchg   %ax,%ax
  1012ec:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  1012f2:	74 0c                	je     101300 <i2A+0x90>
  1012f4:	f7 d9                	neg    %ecx
  1012f6:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  1012fa:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  1012fe:	eb 86                	jmp    101286 <i2A+0x16>
  101300:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  101305:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101309:	eb ef                	jmp    1012fa <i2A+0x8a>
  10130b:	90                   	nop

0010130c <i2X>:
  10130c:	55                   	push   %ebp
  10130d:	89 e5                	mov    %esp,%ebp
  10130f:	57                   	push   %edi
  101310:	56                   	push   %esi
  101311:	53                   	push   %ebx
  101312:	8b 55 08             	mov    0x8(%ebp),%edx
  101315:	b9 5d 21 10 00       	mov    $0x10215d,%ecx
  10131a:	31 c0                	xor    %eax,%eax
  10131c:	40                   	inc    %eax
  10131d:	89 d6                	mov    %edx,%esi
  10131f:	83 e6 0f             	and    $0xf,%esi
  101322:	8d 5e f6             	lea    -0xa(%esi),%ebx
  101325:	89 cf                	mov    %ecx,%edi
  101327:	83 fb 05             	cmp    $0x5,%ebx
  10132a:	77 4c                	ja     101378 <i2X+0x6c>
  10132c:	ff 24 9d ac 17 10 00 	jmp    *0x1017ac(,%ebx,4)
  101333:	90                   	nop
  101334:	c6 01 65             	movb   $0x65,(%ecx)
  101337:	90                   	nop
  101338:	49                   	dec    %ecx
  101339:	c1 ea 04             	shr    $0x4,%edx
  10133c:	75 de                	jne    10131c <i2X+0x10>
  10133e:	c6 05 5e 21 10 00 00 	movb   $0x0,0x10215e
  101345:	8b 55 0c             	mov    0xc(%ebp),%edx
  101348:	89 3a                	mov    %edi,(%edx)
  10134a:	5b                   	pop    %ebx
  10134b:	5e                   	pop    %esi
  10134c:	5f                   	pop    %edi
  10134d:	5d                   	pop    %ebp
  10134e:	c3                   	ret    
  10134f:	90                   	nop
  101350:	c6 01 64             	movb   $0x64,(%ecx)
  101353:	eb e3                	jmp    101338 <i2X+0x2c>
  101355:	8d 76 00             	lea    0x0(%esi),%esi
  101358:	c6 01 63             	movb   $0x63,(%ecx)
  10135b:	eb db                	jmp    101338 <i2X+0x2c>
  10135d:	8d 76 00             	lea    0x0(%esi),%esi
  101360:	c6 01 62             	movb   $0x62,(%ecx)
  101363:	eb d3                	jmp    101338 <i2X+0x2c>
  101365:	8d 76 00             	lea    0x0(%esi),%esi
  101368:	c6 01 61             	movb   $0x61,(%ecx)
  10136b:	eb cb                	jmp    101338 <i2X+0x2c>
  10136d:	8d 76 00             	lea    0x0(%esi),%esi
  101370:	c6 01 66             	movb   $0x66,(%ecx)
  101373:	eb c3                	jmp    101338 <i2X+0x2c>
  101375:	8d 76 00             	lea    0x0(%esi),%esi
  101378:	8d 5e 30             	lea    0x30(%esi),%ebx
  10137b:	88 19                	mov    %bl,(%ecx)
  10137d:	eb b9                	jmp    101338 <i2X+0x2c>
  10137f:	90                   	nop

00101380 <printk>:
  101380:	55                   	push   %ebp
  101381:	89 e5                	mov    %esp,%ebp
  101383:	57                   	push   %edi
  101384:	56                   	push   %esi
  101385:	53                   	push   %ebx
  101386:	83 ec 2c             	sub    $0x2c,%esp
  101389:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10138c:	8a 11                	mov    (%ecx),%dl
  10138e:	84 d2                	test   %dl,%dl
  101390:	0f 84 54 01 00 00    	je     1014ea <printk+0x16a>
  101396:	8d 45 0c             	lea    0xc(%ebp),%eax
  101399:	31 ff                	xor    %edi,%edi
  10139b:	eb 18                	jmp    1013b5 <printk+0x35>
  10139d:	8d 76 00             	lea    0x0(%esi),%esi
  1013a0:	8a 11                	mov    (%ecx),%dl
  1013a2:	89 cb                	mov    %ecx,%ebx
  1013a4:	88 97 80 21 10 00    	mov    %dl,0x102180(%edi)
  1013aa:	47                   	inc    %edi
  1013ab:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1013ae:	8a 53 01             	mov    0x1(%ebx),%dl
  1013b1:	84 d2                	test   %dl,%dl
  1013b3:	74 72                	je     101427 <printk+0xa7>
  1013b5:	80 fa 25             	cmp    $0x25,%dl
  1013b8:	75 e6                	jne    1013a0 <printk+0x20>
  1013ba:	8d 59 01             	lea    0x1(%ecx),%ebx
  1013bd:	8a 51 01             	mov    0x1(%ecx),%dl
  1013c0:	80 fa 64             	cmp    $0x64,%dl
  1013c3:	0f 84 bf 00 00 00    	je     101488 <printk+0x108>
  1013c9:	0f 8e 01 01 00 00    	jle    1014d0 <printk+0x150>
  1013cf:	80 fa 73             	cmp    $0x73,%dl
  1013d2:	0f 84 84 00 00 00    	je     10145c <printk+0xdc>
  1013d8:	80 fa 78             	cmp    $0x78,%dl
  1013db:	75 c7                	jne    1013a4 <printk+0x24>
  1013dd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1013e4:	8d 70 04             	lea    0x4(%eax),%esi
  1013e7:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1013ea:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  1013ed:	56                   	push   %esi
  1013ee:	ff 30                	pushl  (%eax)
  1013f0:	e8 17 ff ff ff       	call   10130c <i2X>
  1013f5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1013f8:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  1013fe:	8a 11                	mov    (%ecx),%dl
  101400:	83 c4 08             	add    $0x8,%esp
  101403:	31 c0                	xor    %eax,%eax
  101405:	84 d2                	test   %dl,%dl
  101407:	74 0f                	je     101418 <printk+0x98>
  101409:	8d 76 00             	lea    0x0(%esi),%esi
  10140c:	40                   	inc    %eax
  10140d:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101411:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  101414:	84 d2                	test   %dl,%dl
  101416:	75 f4                	jne    10140c <printk+0x8c>
  101418:	01 c7                	add    %eax,%edi
  10141a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10141d:	8d 4b 01             	lea    0x1(%ebx),%ecx
  101420:	8a 53 01             	mov    0x1(%ebx),%dl
  101423:	84 d2                	test   %dl,%dl
  101425:	75 8e                	jne    1013b5 <printk+0x35>
  101427:	c6 87 80 21 10 00 00 	movb   $0x0,0x102180(%edi)
  10142e:	0f be 05 80 21 10 00 	movsbl 0x102180,%eax
  101435:	bb 80 21 10 00       	mov    $0x102180,%ebx
  10143a:	84 c0                	test   %al,%al
  10143c:	74 16                	je     101454 <printk+0xd4>
  10143e:	66 90                	xchg   %ax,%ax
  101440:	83 ec 0c             	sub    $0xc,%esp
  101443:	50                   	push   %eax
  101444:	e8 fb f1 ff ff       	call   100644 <putChar>
  101449:	43                   	inc    %ebx
  10144a:	0f be 03             	movsbl (%ebx),%eax
  10144d:	83 c4 10             	add    $0x10,%esp
  101450:	84 c0                	test   %al,%al
  101452:	75 ec                	jne    101440 <printk+0xc0>
  101454:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101457:	5b                   	pop    %ebx
  101458:	5e                   	pop    %esi
  101459:	5f                   	pop    %edi
  10145a:	5d                   	pop    %ebp
  10145b:	c3                   	ret    
  10145c:	8d 70 04             	lea    0x4(%eax),%esi
  10145f:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101462:	8b 08                	mov    (%eax),%ecx
  101464:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  10146a:	8a 11                	mov    (%ecx),%dl
  10146c:	31 c0                	xor    %eax,%eax
  10146e:	84 d2                	test   %dl,%dl
  101470:	74 a6                	je     101418 <printk+0x98>
  101472:	66 90                	xchg   %ax,%ax
  101474:	40                   	inc    %eax
  101475:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101479:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  10147c:	84 d2                	test   %dl,%dl
  10147e:	75 f4                	jne    101474 <printk+0xf4>
  101480:	01 c7                	add    %eax,%edi
  101482:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101485:	eb 96                	jmp    10141d <printk+0x9d>
  101487:	90                   	nop
  101488:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10148f:	8d 70 04             	lea    0x4(%eax),%esi
  101492:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101495:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101498:	56                   	push   %esi
  101499:	ff 30                	pushl  (%eax)
  10149b:	e8 d0 fd ff ff       	call   101270 <i2A>
  1014a0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1014a3:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  1014a9:	8a 11                	mov    (%ecx),%dl
  1014ab:	83 c4 08             	add    $0x8,%esp
  1014ae:	31 c0                	xor    %eax,%eax
  1014b0:	84 d2                	test   %dl,%dl
  1014b2:	0f 84 60 ff ff ff    	je     101418 <printk+0x98>
  1014b8:	40                   	inc    %eax
  1014b9:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1014bd:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  1014c0:	84 d2                	test   %dl,%dl
  1014c2:	75 f4                	jne    1014b8 <printk+0x138>
  1014c4:	01 c7                	add    %eax,%edi
  1014c6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1014c9:	e9 4f ff ff ff       	jmp    10141d <printk+0x9d>
  1014ce:	66 90                	xchg   %ax,%ax
  1014d0:	80 fa 63             	cmp    $0x63,%dl
  1014d3:	0f 85 cb fe ff ff    	jne    1013a4 <printk+0x24>
  1014d9:	8b 10                	mov    (%eax),%edx
  1014db:	88 97 80 21 10 00    	mov    %dl,0x102180(%edi)
  1014e1:	83 c0 04             	add    $0x4,%eax
  1014e4:	47                   	inc    %edi
  1014e5:	e9 c1 fe ff ff       	jmp    1013ab <printk+0x2b>
  1014ea:	31 ff                	xor    %edi,%edi
  1014ec:	e9 36 ff ff ff       	jmp    101427 <printk+0xa7>
  1014f1:	66 90                	xchg   %ax,%ax
  1014f3:	90                   	nop

001014f4 <abort>:
  1014f4:	55                   	push   %ebp
  1014f5:	89 e5                	mov    %esp,%ebp
  1014f7:	57                   	push   %edi
  1014f8:	56                   	push   %esi
  1014f9:	53                   	push   %ebx
  1014fa:	83 ec 1c             	sub    $0x1c,%esp
  1014fd:	8b 55 08             	mov    0x8(%ebp),%edx
  101500:	fa                   	cli    
  101501:	8a 02                	mov    (%edx),%al
  101503:	b9 32 20 10 00       	mov    $0x102032,%ecx
  101508:	84 c0                	test   %al,%al
  10150a:	74 0b                	je     101517 <abort+0x23>
  10150c:	41                   	inc    %ecx
  10150d:	42                   	inc    %edx
  10150e:	88 41 ff             	mov    %al,-0x1(%ecx)
  101511:	8a 02                	mov    (%edx),%al
  101513:	84 c0                	test   %al,%al
  101515:	75 f5                	jne    10150c <abort+0x18>
  101517:	c6 01 3a             	movb   $0x3a,(%ecx)
  10151a:	bb 9d 29 10 00       	mov    $0x10299d,%ebx
  10151f:	be 0a 00 00 00       	mov    $0xa,%esi
  101524:	bf 67 66 66 66       	mov    $0x66666667,%edi
  101529:	4b                   	dec    %ebx
  10152a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10152d:	99                   	cltd   
  10152e:	f7 fe                	idiv   %esi
  101530:	8d 42 30             	lea    0x30(%edx),%eax
  101533:	88 45 e7             	mov    %al,-0x19(%ebp)
  101536:	88 03                	mov    %al,(%ebx)
  101538:	89 f8                	mov    %edi,%eax
  10153a:	f7 6d 0c             	imull  0xc(%ebp)
  10153d:	c1 fa 02             	sar    $0x2,%edx
  101540:	8b 45 0c             	mov    0xc(%ebp),%eax
  101543:	c1 f8 1f             	sar    $0x1f,%eax
  101546:	29 c2                	sub    %eax,%edx
  101548:	89 55 0c             	mov    %edx,0xc(%ebp)
  10154b:	75 dc                	jne    101529 <abort+0x35>
  10154d:	41                   	inc    %ecx
  10154e:	41                   	inc    %ecx
  10154f:	43                   	inc    %ebx
  101550:	8a 45 e7             	mov    -0x19(%ebp),%al
  101553:	88 41 ff             	mov    %al,-0x1(%ecx)
  101556:	8a 03                	mov    (%ebx),%al
  101558:	88 45 e7             	mov    %al,-0x19(%ebp)
  10155b:	84 c0                	test   %al,%al
  10155d:	75 ef                	jne    10154e <abort+0x5a>
  10155f:	c6 01 0a             	movb   $0xa,(%ecx)
  101562:	0f be 05 20 20 10 00 	movsbl 0x102020,%eax
  101569:	84 c0                	test   %al,%al
  10156b:	74 1b                	je     101588 <abort+0x94>
  10156d:	bb 20 20 10 00       	mov    $0x102020,%ebx
  101572:	83 ec 0c             	sub    $0xc,%esp
  101575:	50                   	push   %eax
  101576:	e8 c9 f0 ff ff       	call   100644 <putChar>
  10157b:	43                   	inc    %ebx
  10157c:	0f be 03             	movsbl (%ebx),%eax
  10157f:	83 c4 10             	add    $0x10,%esp
  101582:	84 c0                	test   %al,%al
  101584:	75 ec                	jne    101572 <abort+0x7e>
  101586:	66 90                	xchg   %ax,%ax
  101588:	f4                   	hlt    
  101589:	eb fd                	jmp    101588 <abort+0x94>

0010158b <irqEmpty>:
  10158b:	6a 00                	push   $0x0
  10158d:	6a ff                	push   $0xffffffff
  10158f:	eb 13                	jmp    1015a4 <asmDoIrq>

00101591 <irqGProtectFault>:
  101591:	6a 0d                	push   $0xd
  101593:	eb 0f                	jmp    1015a4 <asmDoIrq>

00101595 <irqSyscall>:
  101595:	6a 00                	push   $0x0
  101597:	68 80 00 00 00       	push   $0x80
  10159c:	eb 06                	jmp    1015a4 <asmDoIrq>

0010159e <irqTime>:
  10159e:	6a 00                	push   $0x0
  1015a0:	6a 20                	push   $0x20
  1015a2:	eb 00                	jmp    1015a4 <asmDoIrq>

001015a4 <asmDoIrq>:
  1015a4:	60                   	pusha  
  1015a5:	54                   	push   %esp
  1015a6:	e8 45 fb ff ff       	call   1010f0 <irqHandle>
  1015ab:	5c                   	pop    %esp
  1015ac:	61                   	popa   
  1015ad:	83 c4 04             	add    $0x4,%esp
  1015b0:	83 c4 04             	add    $0x4,%esp
  1015b3:	cf                   	iret   
