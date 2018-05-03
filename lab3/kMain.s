
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 61 12 00 00       	call   10126c <initTimer>
  10000b:	e8 bc 0e 00 00       	call   100ecc <init_pcb>
  100010:	e8 f3 0e 00 00       	call   100f08 <init_kernel_pcb>
  100015:	e8 e2 05 00 00       	call   1005fc <initSerial>
  10001a:	e8 95 0f 00 00       	call   100fb4 <initIdt>
  10001f:	e8 f0 11 00 00       	call   101214 <initIntr>
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
  1001ed:	a1 c8 15 10 00       	mov    0x1015c8,%eax
  1001f2:	8b 15 cc 15 10 00    	mov    0x1015cc,%edx
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
  1002e0:	e8 1f 06 00 00       	call   100904 <put_into_runnable>
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
  1003c3:	83 ec 08             	sub    $0x8,%esp
  1003c6:	e8 75 04 00 00       	call   100840 <get_from_runnable>
  1003cb:	83 ec 08             	sub    $0x8,%esp
  1003ce:	ff 75 08             	pushl  0x8(%ebp)
  1003d1:	50                   	push   %eax
  1003d2:	e8 89 02 00 00       	call   100660 <put_into_running>
  1003d7:	b8 01 00 00 00       	mov    $0x1,%eax
  1003dc:	c9                   	leave  
  1003dd:	c3                   	ret    
  1003de:	66 90                	xchg   %ax,%ax

001003e0 <sys_sleep>:
  1003e0:	55                   	push   %ebp
  1003e1:	89 e5                	mov    %esp,%ebp
  1003e3:	56                   	push   %esi
  1003e4:	53                   	push   %ebx
  1003e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1003e8:	e8 23 04 00 00       	call   100810 <getpid>
  1003ed:	83 ec 08             	sub    $0x8,%esp
  1003f0:	53                   	push   %ebx
  1003f1:	50                   	push   %eax
  1003f2:	e8 3d 06 00 00       	call   100a34 <put_into_block>
  1003f7:	c7 04 24 d0 15 10 00 	movl   $0x1015d0,(%esp)
  1003fe:	e8 91 0f 00 00       	call   101394 <printk>
  100403:	e8 08 04 00 00       	call   100810 <getpid>
  100408:	89 c2                	mov    %eax,%edx
  10040a:	c1 e2 07             	shl    $0x7,%edx
  10040d:	01 c2                	add    %eax,%edx
  10040f:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100412:	01 d2                	add    %edx,%edx
  100414:	01 d0                	add    %edx,%eax
  100416:	8b 34 c5 04 4a 10 00 	mov    0x104a04(,%eax,8),%esi
  10041d:	e8 ee 03 00 00       	call   100810 <getpid>
  100422:	5a                   	pop    %edx
  100423:	59                   	pop    %ecx
  100424:	56                   	push   %esi
  100425:	50                   	push   %eax
  100426:	68 1c 16 10 00       	push   $0x10161c
  10042b:	6a 09                	push   $0x9
  10042d:	68 d6 15 10 00       	push   $0x1015d6
  100432:	68 f8 15 10 00       	push   $0x1015f8
  100437:	e8 58 0f 00 00       	call   101394 <printk>
  10043c:	83 c4 14             	add    $0x14,%esp
  10043f:	68 f2 15 10 00       	push   $0x1015f2
  100444:	e8 4b 0f 00 00       	call   101394 <printk>
  100449:	e8 f2 03 00 00       	call   100840 <get_from_runnable>
  10044e:	5e                   	pop    %esi
  10044f:	5a                   	pop    %edx
  100450:	53                   	push   %ebx
  100451:	50                   	push   %eax
  100452:	e8 09 02 00 00       	call   100660 <put_into_running>
  100457:	b8 01 00 00 00       	mov    $0x1,%eax
  10045c:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10045f:	5b                   	pop    %ebx
  100460:	5e                   	pop    %esi
  100461:	5d                   	pop    %ebp
  100462:	c3                   	ret    
  100463:	90                   	nop

00100464 <sys_fork>:
  100464:	55                   	push   %ebp
  100465:	89 e5                	mov    %esp,%ebp
  100467:	57                   	push   %edi
  100468:	56                   	push   %esi
  100469:	8b 75 08             	mov    0x8(%ebp),%esi
  10046c:	83 ec 0c             	sub    $0xc,%esp
  10046f:	68 26 16 10 00       	push   $0x101626
  100474:	e8 1b 0f 00 00       	call   101394 <printk>
  100479:	b8 70 8a 10 00       	mov    $0x108a70,%eax
  10047e:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100483:	89 c7                	mov    %eax,%edi
  100485:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100487:	c7 05 8c 8a 10 00 00 	movl   $0x0,0x108a8c
  10048e:	00 00 00 
  100491:	c7 05 a4 8a 10 00 00 	movl   $0x7e00000,0x108aa4
  100498:	00 e0 07 
  10049b:	5a                   	pop    %edx
  10049c:	59                   	pop    %ecx
  10049d:	50                   	push   %eax
  10049e:	6a 02                	push   $0x2
  1004a0:	e8 5f 04 00 00       	call   100904 <put_into_runnable>
  1004a5:	b8 02 00 00 00       	mov    $0x2,%eax
  1004aa:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1004ad:	5e                   	pop    %esi
  1004ae:	5f                   	pop    %edi
  1004af:	5d                   	pop    %ebp
  1004b0:	c3                   	ret    
  1004b1:	66 90                	xchg   %ax,%ax
  1004b3:	90                   	nop

001004b4 <display>:
  1004b4:	55                   	push   %ebp
  1004b5:	89 e5                	mov    %esp,%ebp
  1004b7:	57                   	push   %edi
  1004b8:	53                   	push   %ebx
  1004b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1004bc:	80 fb 0a             	cmp    $0xa,%bl
  1004bf:	74 5b                	je     10051c <display+0x68>
  1004c1:	8b 15 28 21 10 00    	mov    0x102128,%edx
  1004c7:	8b 0d 2c 21 10 00    	mov    0x10212c,%ecx
  1004cd:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  1004d0:	c1 e0 04             	shl    $0x4,%eax
  1004d3:	01 d0                	add    %edx,%eax
  1004d5:	01 c0                	add    %eax,%eax
  1004d7:	89 c7                	mov    %eax,%edi
  1004d9:	0f be db             	movsbl %bl,%ebx
  1004dc:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
  1004e2:	66 89 d8             	mov    %bx,%ax
  1004e5:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1004e9:	42                   	inc    %edx
  1004ea:	83 fa 50             	cmp    $0x50,%edx
  1004ed:	75 1d                	jne    10050c <display+0x58>
  1004ef:	c7 05 28 21 10 00 00 	movl   $0x0,0x102128
  1004f6:	00 00 00 
  1004f9:	41                   	inc    %ecx
  1004fa:	89 0d 2c 21 10 00    	mov    %ecx,0x10212c
  100500:	b8 01 00 00 00       	mov    $0x1,%eax
  100505:	5b                   	pop    %ebx
  100506:	5f                   	pop    %edi
  100507:	5d                   	pop    %ebp
  100508:	c3                   	ret    
  100509:	8d 76 00             	lea    0x0(%esi),%esi
  10050c:	89 15 28 21 10 00    	mov    %edx,0x102128
  100512:	b8 01 00 00 00       	mov    $0x1,%eax
  100517:	5b                   	pop    %ebx
  100518:	5f                   	pop    %edi
  100519:	5d                   	pop    %ebp
  10051a:	c3                   	ret    
  10051b:	90                   	nop
  10051c:	c7 05 28 21 10 00 00 	movl   $0x0,0x102128
  100523:	00 00 00 
  100526:	ff 05 2c 21 10 00    	incl   0x10212c
  10052c:	b8 01 00 00 00       	mov    $0x1,%eax
  100531:	5b                   	pop    %ebx
  100532:	5f                   	pop    %edi
  100533:	5d                   	pop    %ebp
  100534:	c3                   	ret    
  100535:	8d 76 00             	lea    0x0(%esi),%esi

00100538 <printkernel>:
  100538:	55                   	push   %ebp
  100539:	89 e5                	mov    %esp,%ebp
  10053b:	53                   	push   %ebx
  10053c:	50                   	push   %eax
  10053d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100540:	0f be 03             	movsbl (%ebx),%eax
  100543:	84 c0                	test   %al,%al
  100545:	74 20                	je     100567 <printkernel+0x2f>
  100547:	90                   	nop
  100548:	83 ec 0c             	sub    $0xc,%esp
  10054b:	50                   	push   %eax
  10054c:	e8 eb 00 00 00       	call   10063c <putChar>
  100551:	0f be 03             	movsbl (%ebx),%eax
  100554:	89 04 24             	mov    %eax,(%esp)
  100557:	e8 58 ff ff ff       	call   1004b4 <display>
  10055c:	43                   	inc    %ebx
  10055d:	0f be 03             	movsbl (%ebx),%eax
  100560:	83 c4 10             	add    $0x10,%esp
  100563:	84 c0                	test   %al,%al
  100565:	75 e1                	jne    100548 <printkernel+0x10>
  100567:	b8 01 00 00 00       	mov    $0x1,%eax
  10056c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10056f:	c9                   	leave  
  100570:	c3                   	ret    
  100571:	8d 76 00             	lea    0x0(%esi),%esi

00100574 <fs_write>:
  100574:	55                   	push   %ebp
  100575:	89 e5                	mov    %esp,%ebp
  100577:	53                   	push   %ebx
  100578:	50                   	push   %eax
  100579:	8b 5d 10             	mov    0x10(%ebp),%ebx
  10057c:	ba 30 00 00 00       	mov    $0x30,%edx
  100581:	89 d0                	mov    %edx,%eax
  100583:	8e e8                	mov    %eax,%gs
  100585:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  100589:	74 12                	je     10059d <fs_write+0x29>
  10058b:	83 ec 08             	sub    $0x8,%esp
  10058e:	6a 27                	push   $0x27
  100590:	68 42 16 10 00       	push   $0x101642
  100595:	e8 6e 0f 00 00       	call   101508 <abort>
  10059a:	83 c4 10             	add    $0x10,%esp
  10059d:	83 ec 08             	sub    $0x8,%esp
  1005a0:	53                   	push   %ebx
  1005a1:	ff 75 0c             	pushl  0xc(%ebp)
  1005a4:	e8 8f ff ff ff       	call   100538 <printkernel>
  1005a9:	89 d8                	mov    %ebx,%eax
  1005ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005ae:	c9                   	leave  
  1005af:	c3                   	ret    

001005b0 <sys_write>:
  1005b0:	55                   	push   %ebp
  1005b1:	89 e5                	mov    %esp,%ebp
  1005b3:	53                   	push   %ebx
  1005b4:	83 ec 08             	sub    $0x8,%esp
  1005b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1005ba:	ff 73 14             	pushl  0x14(%ebx)
  1005bd:	ff 73 18             	pushl  0x18(%ebx)
  1005c0:	ff 73 10             	pushl  0x10(%ebx)
  1005c3:	e8 ac ff ff ff       	call   100574 <fs_write>
  1005c8:	89 43 1c             	mov    %eax,0x1c(%ebx)
  1005cb:	83 c4 10             	add    $0x10,%esp
  1005ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005d1:	c9                   	leave  
  1005d2:	c3                   	ret    
  1005d3:	90                   	nop

001005d4 <print_char>:
  1005d4:	55                   	push   %ebp
  1005d5:	89 e5                	mov    %esp,%ebp
  1005d7:	57                   	push   %edi
  1005d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1005db:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1005de:	c1 e0 04             	shl    $0x4,%eax
  1005e1:	03 45 0c             	add    0xc(%ebp),%eax
  1005e4:	01 c0                	add    %eax,%eax
  1005e6:	89 c7                	mov    %eax,%edi
  1005e8:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  1005ec:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  1005f2:	66 89 d0             	mov    %dx,%ax
  1005f5:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1005f9:	5f                   	pop    %edi
  1005fa:	5d                   	pop    %ebp
  1005fb:	c3                   	ret    

001005fc <initSerial>:
  1005fc:	55                   	push   %ebp
  1005fd:	89 e5                	mov    %esp,%ebp
  1005ff:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100604:	31 c0                	xor    %eax,%eax
  100606:	ee                   	out    %al,(%dx)
  100607:	ba fb 03 00 00       	mov    $0x3fb,%edx
  10060c:	b0 80                	mov    $0x80,%al
  10060e:	ee                   	out    %al,(%dx)
  10060f:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100614:	b0 01                	mov    $0x1,%al
  100616:	ee                   	out    %al,(%dx)
  100617:	ba f9 03 00 00       	mov    $0x3f9,%edx
  10061c:	31 c0                	xor    %eax,%eax
  10061e:	ee                   	out    %al,(%dx)
  10061f:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100624:	b0 03                	mov    $0x3,%al
  100626:	ee                   	out    %al,(%dx)
  100627:	ba fa 03 00 00       	mov    $0x3fa,%edx
  10062c:	b0 c7                	mov    $0xc7,%al
  10062e:	ee                   	out    %al,(%dx)
  10062f:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100634:	b0 0b                	mov    $0xb,%al
  100636:	ee                   	out    %al,(%dx)
  100637:	5d                   	pop    %ebp
  100638:	c3                   	ret    
  100639:	8d 76 00             	lea    0x0(%esi),%esi

0010063c <putChar>:
  10063c:	55                   	push   %ebp
  10063d:	89 e5                	mov    %esp,%ebp
  10063f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100642:	ba fd 03 00 00       	mov    $0x3fd,%edx
  100647:	90                   	nop
  100648:	ec                   	in     (%dx),%al
  100649:	a8 20                	test   $0x20,%al
  10064b:	74 fb                	je     100648 <putChar+0xc>
  10064d:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100652:	88 c8                	mov    %cl,%al
  100654:	ee                   	out    %al,(%dx)
  100655:	5d                   	pop    %ebp
  100656:	c3                   	ret    
  100657:	90                   	nop

00100658 <IDLE>:
  100658:	55                   	push   %ebp
  100659:	89 e5                	mov    %esp,%ebp
  10065b:	90                   	nop
  10065c:	f4                   	hlt    
  10065d:	eb fd                	jmp    10065c <IDLE+0x4>
  10065f:	90                   	nop

00100660 <put_into_running>:
  100660:	55                   	push   %ebp
  100661:	89 e5                	mov    %esp,%ebp
  100663:	57                   	push   %edi
  100664:	56                   	push   %esi
  100665:	53                   	push   %ebx
  100666:	81 ec dc 00 00 00    	sub    $0xdc,%esp
  10066c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10066f:	39 1d a0 29 10 00    	cmp    %ebx,0x1029a0
  100675:	0f 84 6d 01 00 00    	je     1007e8 <put_into_running+0x188>
  10067b:	89 1d a0 29 10 00    	mov    %ebx,0x1029a0
  100681:	89 d8                	mov    %ebx,%eax
  100683:	c1 e0 07             	shl    $0x7,%eax
  100686:	01 d8                	add    %ebx,%eax
  100688:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10068b:	01 c0                	add    %eax,%eax
  10068d:	01 d8                	add    %ebx,%eax
  10068f:	c1 e0 03             	shl    $0x3,%eax
  100692:	8d b0 c0 49 10 00    	lea    0x1049c0(%eax),%esi
  100698:	b9 0f 00 00 00       	mov    $0xf,%ecx
  10069d:	8b 7d 0c             	mov    0xc(%ebp),%edi
  1006a0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1006a2:	85 db                	test   %ebx,%ebx
  1006a4:	0f 85 d2 00 00 00    	jne    10077c <put_into_running+0x11c>
  1006aa:	83 ec 08             	sub    $0x8,%esp
  1006ad:	68 bc 49 10 00       	push   $0x1049bc
  1006b2:	6a 10                	push   $0x10
  1006b4:	e8 7b f9 ff ff       	call   100034 <change_tss>
  1006b9:	8d 85 20 ff ff ff    	lea    -0xe0(%ebp),%eax
  1006bf:	89 04 24             	mov    %eax,(%esp)
  1006c2:	e8 89 f9 ff ff       	call   100050 <get_tss>
  1006c7:	83 c4 0c             	add    $0xc,%esp
  1006ca:	81 bd 24 ff ff ff bc 	cmpl   $0x1049bc,-0xdc(%ebp)
  1006d1:	49 10 00 
  1006d4:	74 12                	je     1006e8 <put_into_running+0x88>
  1006d6:	83 ec 08             	sub    $0x8,%esp
  1006d9:	6a 19                	push   $0x19
  1006db:	68 5e 16 10 00       	push   $0x10165e
  1006e0:	e8 23 0e 00 00       	call   101508 <abort>
  1006e5:	83 c4 10             	add    $0x10,%esp
  1006e8:	83 ec 0c             	sub    $0xc,%esp
  1006eb:	68 d0 15 10 00       	push   $0x1015d0
  1006f0:	e8 9f 0c 00 00       	call   101394 <printk>
  1006f5:	a1 a0 29 10 00       	mov    0x1029a0,%eax
  1006fa:	89 c2                	mov    %eax,%edx
  1006fc:	c1 e2 07             	shl    $0x7,%edx
  1006ff:	01 c2                	add    %eax,%edx
  100701:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100704:	01 d2                	add    %edx,%edx
  100706:	01 d0                	add    %edx,%eax
  100708:	8d 04 c5 bc 49 10 00 	lea    0x1049bc(,%eax,8),%eax
  10070f:	83 c4 0c             	add    $0xc,%esp
  100712:	89 c2                	mov    %eax,%edx
  100714:	2b 55 0c             	sub    0xc(%ebp),%edx
  100717:	52                   	push   %edx
  100718:	ff 75 0c             	pushl  0xc(%ebp)
  10071b:	50                   	push   %eax
  10071c:	68 c8 17 10 00       	push   $0x1017c8
  100721:	6a 1a                	push   $0x1a
  100723:	68 5e 16 10 00       	push   $0x10165e
  100728:	68 a4 16 10 00       	push   $0x1016a4
  10072d:	e8 62 0c 00 00       	call   101394 <printk>
  100732:	83 c4 14             	add    $0x14,%esp
  100735:	68 f2 15 10 00       	push   $0x1015f2
  10073a:	e8 55 0c 00 00       	call   101394 <printk>
  10073f:	c7 04 24 d0 15 10 00 	movl   $0x1015d0,(%esp)
  100746:	e8 49 0c 00 00       	call   101394 <printk>
  10074b:	c7 04 24 bc 49 10 00 	movl   $0x1049bc,(%esp)
  100752:	68 c8 17 10 00       	push   $0x1017c8
  100757:	6a 1b                	push   $0x1b
  100759:	68 5e 16 10 00       	push   $0x10165e
  10075e:	68 e0 16 10 00       	push   $0x1016e0
  100763:	e8 2c 0c 00 00       	call   101394 <printk>
  100768:	83 c4 14             	add    $0x14,%esp
  10076b:	68 f2 15 10 00       	push   $0x1015f2
  100770:	e8 1f 0c 00 00       	call   101394 <printk>
  100775:	83 c4 10             	add    $0x10,%esp
  100778:	eb 38                	jmp    1007b2 <put_into_running+0x152>
  10077a:	66 90                	xchg   %ax,%ax
  10077c:	8d b0 bc 49 10 00    	lea    0x1049bc(%eax),%esi
  100782:	83 ec 08             	sub    $0x8,%esp
  100785:	56                   	push   %esi
  100786:	6a 10                	push   $0x10
  100788:	e8 a7 f8 ff ff       	call   100034 <change_tss>
  10078d:	8d 45 84             	lea    -0x7c(%ebp),%eax
  100790:	89 04 24             	mov    %eax,(%esp)
  100793:	e8 b8 f8 ff ff       	call   100050 <get_tss>
  100798:	83 c4 0c             	add    $0xc,%esp
  10079b:	3b 75 88             	cmp    -0x78(%ebp),%esi
  10079e:	74 12                	je     1007b2 <put_into_running+0x152>
  1007a0:	83 ec 08             	sub    $0x8,%esp
  1007a3:	6a 20                	push   $0x20
  1007a5:	68 5e 16 10 00       	push   $0x10165e
  1007aa:	e8 59 0d 00 00       	call   101508 <abort>
  1007af:	83 c4 10             	add    $0x10,%esp
  1007b2:	83 ec 0c             	sub    $0xc,%esp
  1007b5:	68 d0 15 10 00       	push   $0x1015d0
  1007ba:	e8 d5 0b 00 00       	call   101394 <printk>
  1007bf:	89 1c 24             	mov    %ebx,(%esp)
  1007c2:	68 c8 17 10 00       	push   $0x1017c8
  1007c7:	6a 23                	push   $0x23
  1007c9:	68 5e 16 10 00       	push   $0x10165e
  1007ce:	68 6c 16 10 00       	push   $0x10166c
  1007d3:	e8 bc 0b 00 00       	call   101394 <printk>
  1007d8:	83 c4 14             	add    $0x14,%esp
  1007db:	68 f2 15 10 00       	push   $0x1015f2
  1007e0:	e8 af 0b 00 00       	call   101394 <printk>
  1007e5:	83 c4 10             	add    $0x10,%esp
  1007e8:	b8 01 00 00 00       	mov    $0x1,%eax
  1007ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1007f0:	5b                   	pop    %ebx
  1007f1:	5e                   	pop    %esi
  1007f2:	5f                   	pop    %edi
  1007f3:	5d                   	pop    %ebp
  1007f4:	c3                   	ret    
  1007f5:	8d 76 00             	lea    0x0(%esi),%esi

001007f8 <update_block>:
  1007f8:	55                   	push   %ebp
  1007f9:	89 e5                	mov    %esp,%ebp
  1007fb:	b8 01 00 00 00       	mov    $0x1,%eax
  100800:	5d                   	pop    %ebp
  100801:	c3                   	ret    
  100802:	66 90                	xchg   %ax,%ax

00100804 <apply_new_pid>:
  100804:	55                   	push   %ebp
  100805:	89 e5                	mov    %esp,%ebp
  100807:	b8 02 00 00 00       	mov    $0x2,%eax
  10080c:	5d                   	pop    %ebp
  10080d:	c3                   	ret    
  10080e:	66 90                	xchg   %ax,%ax

00100810 <getpid>:
  100810:	55                   	push   %ebp
  100811:	89 e5                	mov    %esp,%ebp
  100813:	a1 a0 29 10 00       	mov    0x1029a0,%eax
  100818:	5d                   	pop    %ebp
  100819:	c3                   	ret    
  10081a:	66 90                	xchg   %ax,%ax

0010081c <getrunnable>:
  10081c:	55                   	push   %ebp
  10081d:	89 e5                	mov    %esp,%ebp
  10081f:	a1 04 20 10 00       	mov    0x102004,%eax
  100824:	5d                   	pop    %ebp
  100825:	c3                   	ret    
  100826:	66 90                	xchg   %ax,%ax

00100828 <getblocked>:
  100828:	55                   	push   %ebp
  100829:	89 e5                	mov    %esp,%ebp
  10082b:	a1 00 20 10 00       	mov    0x102000,%eax
  100830:	5d                   	pop    %ebp
  100831:	c3                   	ret    
  100832:	66 90                	xchg   %ax,%ax

00100834 <transfer_pid_mode>:
  100834:	55                   	push   %ebp
  100835:	89 e5                	mov    %esp,%ebp
  100837:	b8 01 00 00 00       	mov    $0x1,%eax
  10083c:	5d                   	pop    %ebp
  10083d:	c3                   	ret    
  10083e:	66 90                	xchg   %ax,%ax

00100840 <get_from_runnable>:
  100840:	55                   	push   %ebp
  100841:	89 e5                	mov    %esp,%ebp
  100843:	53                   	push   %ebx
  100844:	51                   	push   %ecx
  100845:	8b 1d 04 20 10 00    	mov    0x102004,%ebx
  10084b:	83 fb ff             	cmp    $0xffffffff,%ebx
  10084e:	0f 84 a8 00 00 00    	je     1008fc <get_from_runnable+0xbc>
  100854:	89 d8                	mov    %ebx,%eax
  100856:	c1 e0 07             	shl    $0x7,%eax
  100859:	01 d8                	add    %ebx,%eax
  10085b:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10085e:	01 c0                	add    %eax,%eax
  100860:	01 d8                	add    %ebx,%eax
  100862:	8d 14 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%edx
  100869:	8b 82 50 20 00 00    	mov    0x2050(%edx),%eax
  10086f:	39 d8                	cmp    %ebx,%eax
  100871:	74 7d                	je     1008f0 <get_from_runnable+0xb0>
  100873:	8b 8a 4c 20 00 00    	mov    0x204c(%edx),%ecx
  100879:	89 ca                	mov    %ecx,%edx
  10087b:	c1 e2 07             	shl    $0x7,%edx
  10087e:	01 ca                	add    %ecx,%edx
  100880:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100883:	01 d2                	add    %edx,%edx
  100885:	01 ca                	add    %ecx,%edx
  100887:	89 04 d5 10 4a 10 00 	mov    %eax,0x104a10(,%edx,8)
  10088e:	89 c2                	mov    %eax,%edx
  100890:	c1 e2 07             	shl    $0x7,%edx
  100893:	01 c2                	add    %eax,%edx
  100895:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100898:	01 d2                	add    %edx,%edx
  10089a:	01 c2                	add    %eax,%edx
  10089c:	89 0c d5 0c 4a 10 00 	mov    %ecx,0x104a0c(,%edx,8)
  1008a3:	a3 04 20 10 00       	mov    %eax,0x102004
  1008a8:	83 ec 0c             	sub    $0xc,%esp
  1008ab:	68 d0 15 10 00       	push   $0x1015d0
  1008b0:	e8 df 0a 00 00       	call   101394 <printk>
  1008b5:	58                   	pop    %eax
  1008b6:	5a                   	pop    %edx
  1008b7:	ff 35 04 20 10 00    	pushl  0x102004
  1008bd:	53                   	push   %ebx
  1008be:	68 a4 17 10 00       	push   $0x1017a4
  1008c3:	68 82 00 00 00       	push   $0x82
  1008c8:	68 5e 16 10 00       	push   $0x10165e
  1008cd:	68 0c 17 10 00       	push   $0x10170c
  1008d2:	e8 bd 0a 00 00       	call   101394 <printk>
  1008d7:	83 c4 14             	add    $0x14,%esp
  1008da:	68 f2 15 10 00       	push   $0x1015f2
  1008df:	e8 b0 0a 00 00       	call   101394 <printk>
  1008e4:	83 c4 10             	add    $0x10,%esp
  1008e7:	89 d8                	mov    %ebx,%eax
  1008e9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1008ec:	c9                   	leave  
  1008ed:	c3                   	ret    
  1008ee:	66 90                	xchg   %ax,%ax
  1008f0:	c7 05 04 20 10 00 ff 	movl   $0xffffffff,0x102004
  1008f7:	ff ff ff 
  1008fa:	eb ac                	jmp    1008a8 <get_from_runnable+0x68>
  1008fc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100901:	eb e6                	jmp    1008e9 <get_from_runnable+0xa9>
  100903:	90                   	nop

00100904 <put_into_runnable>:
  100904:	55                   	push   %ebp
  100905:	89 e5                	mov    %esp,%ebp
  100907:	56                   	push   %esi
  100908:	53                   	push   %ebx
  100909:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10090c:	a1 04 20 10 00       	mov    0x102004,%eax
  100911:	83 f8 ff             	cmp    $0xffffffff,%eax
  100914:	0f 84 ee 00 00 00    	je     100a08 <put_into_runnable+0x104>
  10091a:	89 c2                	mov    %eax,%edx
  10091c:	c1 e2 07             	shl    $0x7,%edx
  10091f:	01 c2                	add    %eax,%edx
  100921:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100924:	01 d2                	add    %edx,%edx
  100926:	01 c2                	add    %eax,%edx
  100928:	8d 34 d5 c0 29 10 00 	lea    0x1029c0(,%edx,8),%esi
  10092f:	8b 8e 4c 20 00 00    	mov    0x204c(%esi),%ecx
  100935:	89 ca                	mov    %ecx,%edx
  100937:	c1 e2 07             	shl    $0x7,%edx
  10093a:	01 ca                	add    %ecx,%edx
  10093c:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  10093f:	01 d2                	add    %edx,%edx
  100941:	01 ca                	add    %ecx,%edx
  100943:	89 1c d5 10 4a 10 00 	mov    %ebx,0x104a10(,%edx,8)
  10094a:	89 da                	mov    %ebx,%edx
  10094c:	c1 e2 07             	shl    $0x7,%edx
  10094f:	01 da                	add    %ebx,%edx
  100951:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100954:	01 d2                	add    %edx,%edx
  100956:	01 da                	add    %ebx,%edx
  100958:	8d 14 d5 c0 29 10 00 	lea    0x1029c0(,%edx,8),%edx
  10095f:	89 8a 4c 20 00 00    	mov    %ecx,0x204c(%edx)
  100965:	89 82 50 20 00 00    	mov    %eax,0x2050(%edx)
  10096b:	89 9e 4c 20 00 00    	mov    %ebx,0x204c(%esi)
  100971:	89 d8                	mov    %ebx,%eax
  100973:	c1 e0 07             	shl    $0x7,%eax
  100976:	01 d8                	add    %ebx,%eax
  100978:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10097b:	01 c0                	add    %eax,%eax
  10097d:	01 d8                	add    %ebx,%eax
  10097f:	c7 04 c5 fc 49 10 00 	movl   $0x1,0x1049fc(,%eax,8)
  100986:	01 00 00 00 
  10098a:	85 db                	test   %ebx,%ebx
  10098c:	75 0a                	jne    100998 <put_into_runnable+0x94>
  10098e:	c7 05 e8 49 10 00 58 	movl   $0x100658,0x1049e8
  100995:	06 10 00 
  100998:	83 ec 0c             	sub    $0xc,%esp
  10099b:	68 d0 15 10 00       	push   $0x1015d0
  1009a0:	e8 ef 09 00 00       	call   101394 <printk>
  1009a5:	58                   	pop    %eax
  1009a6:	5a                   	pop    %edx
  1009a7:	53                   	push   %ebx
  1009a8:	ff 35 04 20 10 00    	pushl  0x102004
  1009ae:	68 90 17 10 00       	push   $0x101790
  1009b3:	68 a0 00 00 00       	push   $0xa0
  1009b8:	68 5e 16 10 00       	push   $0x10165e
  1009bd:	68 40 17 10 00       	push   $0x101740
  1009c2:	e8 cd 09 00 00       	call   101394 <printk>
  1009c7:	83 c4 14             	add    $0x14,%esp
  1009ca:	68 f2 15 10 00       	push   $0x1015f2
  1009cf:	e8 c0 09 00 00       	call   101394 <printk>
  1009d4:	89 d8                	mov    %ebx,%eax
  1009d6:	c1 e0 07             	shl    $0x7,%eax
  1009d9:	01 d8                	add    %ebx,%eax
  1009db:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1009de:	01 c0                	add    %eax,%eax
  1009e0:	01 c3                	add    %eax,%ebx
  1009e2:	8d 04 dd c0 29 10 00 	lea    0x1029c0(,%ebx,8),%eax
  1009e9:	8b 55 0c             	mov    0xc(%ebp),%edx
  1009ec:	89 90 54 20 00 00    	mov    %edx,0x2054(%eax)
  1009f2:	c7 80 40 20 00 00 0a 	movl   $0xa,0x2040(%eax)
  1009f9:	00 00 00 
  1009fc:	b8 01 00 00 00       	mov    $0x1,%eax
  100a01:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100a04:	5b                   	pop    %ebx
  100a05:	5e                   	pop    %esi
  100a06:	5d                   	pop    %ebp
  100a07:	c3                   	ret    
  100a08:	89 1d 04 20 10 00    	mov    %ebx,0x102004
  100a0e:	89 d8                	mov    %ebx,%eax
  100a10:	c1 e0 07             	shl    $0x7,%eax
  100a13:	01 d8                	add    %ebx,%eax
  100a15:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100a18:	01 c0                	add    %eax,%eax
  100a1a:	01 d8                	add    %ebx,%eax
  100a1c:	8d 04 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%eax
  100a23:	89 98 4c 20 00 00    	mov    %ebx,0x204c(%eax)
  100a29:	89 98 50 20 00 00    	mov    %ebx,0x2050(%eax)
  100a2f:	e9 3d ff ff ff       	jmp    100971 <put_into_runnable+0x6d>

00100a34 <put_into_block>:
  100a34:	55                   	push   %ebp
  100a35:	89 e5                	mov    %esp,%ebp
  100a37:	57                   	push   %edi
  100a38:	56                   	push   %esi
  100a39:	53                   	push   %ebx
  100a3a:	8b 45 08             	mov    0x8(%ebp),%eax
  100a3d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100a40:	8b 15 00 20 10 00    	mov    0x102000,%edx
  100a46:	83 fa ff             	cmp    $0xffffffff,%edx
  100a49:	0f 84 99 00 00 00    	je     100ae8 <put_into_block+0xb4>
  100a4f:	89 d1                	mov    %edx,%ecx
  100a51:	c1 e1 07             	shl    $0x7,%ecx
  100a54:	01 d1                	add    %edx,%ecx
  100a56:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100a59:	01 c9                	add    %ecx,%ecx
  100a5b:	01 d1                	add    %edx,%ecx
  100a5d:	8d 3c cd c0 29 10 00 	lea    0x1029c0(,%ecx,8),%edi
  100a64:	8b b7 4c 20 00 00    	mov    0x204c(%edi),%esi
  100a6a:	89 f1                	mov    %esi,%ecx
  100a6c:	c1 e1 07             	shl    $0x7,%ecx
  100a6f:	01 f1                	add    %esi,%ecx
  100a71:	8d 0c 8e             	lea    (%esi,%ecx,4),%ecx
  100a74:	01 c9                	add    %ecx,%ecx
  100a76:	01 f1                	add    %esi,%ecx
  100a78:	89 04 cd 10 4a 10 00 	mov    %eax,0x104a10(,%ecx,8)
  100a7f:	89 c1                	mov    %eax,%ecx
  100a81:	c1 e1 07             	shl    $0x7,%ecx
  100a84:	01 c1                	add    %eax,%ecx
  100a86:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  100a89:	01 c9                	add    %ecx,%ecx
  100a8b:	01 c1                	add    %eax,%ecx
  100a8d:	8d 0c cd c0 29 10 00 	lea    0x1029c0(,%ecx,8),%ecx
  100a94:	89 b1 4c 20 00 00    	mov    %esi,0x204c(%ecx)
  100a9a:	89 91 50 20 00 00    	mov    %edx,0x2050(%ecx)
  100aa0:	89 87 4c 20 00 00    	mov    %eax,0x204c(%edi)
  100aa6:	89 c2                	mov    %eax,%edx
  100aa8:	c1 e2 07             	shl    $0x7,%edx
  100aab:	01 c2                	add    %eax,%edx
  100aad:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100ab0:	01 d2                	add    %edx,%edx
  100ab2:	01 c2                	add    %eax,%edx
  100ab4:	c1 e2 03             	shl    $0x3,%edx
  100ab7:	8d 82 c0 49 10 00    	lea    0x1049c0(%edx),%eax
  100abd:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100ac2:	89 c7                	mov    %eax,%edi
  100ac4:	89 de                	mov    %ebx,%esi
  100ac6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100ac8:	8b 43 10             	mov    0x10(%ebx),%eax
  100acb:	89 82 04 4a 10 00    	mov    %eax,0x104a04(%edx)
  100ad1:	c7 82 fc 49 10 00 00 	movl   $0x0,0x1049fc(%edx)
  100ad8:	00 00 00 
  100adb:	b8 01 00 00 00       	mov    $0x1,%eax
  100ae0:	5b                   	pop    %ebx
  100ae1:	5e                   	pop    %esi
  100ae2:	5f                   	pop    %edi
  100ae3:	5d                   	pop    %ebp
  100ae4:	c3                   	ret    
  100ae5:	8d 76 00             	lea    0x0(%esi),%esi
  100ae8:	a3 00 20 10 00       	mov    %eax,0x102000
  100aed:	89 c2                	mov    %eax,%edx
  100aef:	c1 e2 07             	shl    $0x7,%edx
  100af2:	01 c2                	add    %eax,%edx
  100af4:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100af7:	01 d2                	add    %edx,%edx
  100af9:	01 c2                	add    %eax,%edx
  100afb:	8d 14 d5 c0 29 10 00 	lea    0x1029c0(,%edx,8),%edx
  100b02:	89 82 50 20 00 00    	mov    %eax,0x2050(%edx)
  100b08:	89 82 4c 20 00 00    	mov    %eax,0x204c(%edx)
  100b0e:	eb 96                	jmp    100aa6 <put_into_block+0x72>

00100b10 <get_from>:
  100b10:	55                   	push   %ebp
  100b11:	89 e5                	mov    %esp,%ebp
  100b13:	56                   	push   %esi
  100b14:	53                   	push   %ebx
  100b15:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100b18:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b1b:	85 db                	test   %ebx,%ebx
  100b1d:	0f 8e 01 01 00 00    	jle    100c24 <get_from+0x114>
  100b23:	39 c3                	cmp    %eax,%ebx
  100b25:	74 42                	je     100b69 <get_from+0x59>
  100b27:	89 da                	mov    %ebx,%edx
  100b29:	c1 e2 07             	shl    $0x7,%edx
  100b2c:	01 da                	add    %ebx,%edx
  100b2e:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100b31:	01 d2                	add    %edx,%edx
  100b33:	01 da                	add    %ebx,%edx
  100b35:	8b 14 d5 10 4a 10 00 	mov    0x104a10(,%edx,8),%edx
  100b3c:	39 d3                	cmp    %edx,%ebx
  100b3e:	75 25                	jne    100b65 <get_from+0x55>
  100b40:	e9 df 00 00 00       	jmp    100c24 <get_from+0x114>
  100b45:	8d 76 00             	lea    0x0(%esi),%esi
  100b48:	89 d1                	mov    %edx,%ecx
  100b4a:	c1 e1 07             	shl    $0x7,%ecx
  100b4d:	01 d1                	add    %edx,%ecx
  100b4f:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100b52:	01 c9                	add    %ecx,%ecx
  100b54:	01 ca                	add    %ecx,%edx
  100b56:	8b 14 d5 10 4a 10 00 	mov    0x104a10(,%edx,8),%edx
  100b5d:	39 d3                	cmp    %edx,%ebx
  100b5f:	0f 84 bf 00 00 00    	je     100c24 <get_from+0x114>
  100b65:	39 c2                	cmp    %eax,%edx
  100b67:	75 df                	jne    100b48 <get_from+0x38>
  100b69:	89 c2                	mov    %eax,%edx
  100b6b:	c1 e2 07             	shl    $0x7,%edx
  100b6e:	01 c2                	add    %eax,%edx
  100b70:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100b73:	01 d2                	add    %edx,%edx
  100b75:	01 d0                	add    %edx,%eax
  100b77:	8b 04 c5 fc 49 10 00 	mov    0x1049fc(,%eax,8),%eax
  100b7e:	85 c0                	test   %eax,%eax
  100b80:	0f 84 c2 00 00 00    	je     100c48 <get_from+0x138>
  100b86:	48                   	dec    %eax
  100b87:	75 7f                	jne    100c08 <get_from+0xf8>
  100b89:	be 04 20 10 00       	mov    $0x102004,%esi
  100b8e:	3b 1e                	cmp    (%esi),%ebx
  100b90:	74 15                	je     100ba7 <get_from+0x97>
  100b92:	83 ec 08             	sub    $0x8,%esp
  100b95:	68 e2 00 00 00       	push   $0xe2
  100b9a:	68 5e 16 10 00       	push   $0x10165e
  100b9f:	e8 64 09 00 00       	call   101508 <abort>
  100ba4:	83 c4 10             	add    $0x10,%esp
  100ba7:	89 d8                	mov    %ebx,%eax
  100ba9:	c1 e0 07             	shl    $0x7,%eax
  100bac:	01 d8                	add    %ebx,%eax
  100bae:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100bb1:	01 c0                	add    %eax,%eax
  100bb3:	01 d8                	add    %ebx,%eax
  100bb5:	8d 14 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%edx
  100bbc:	8b 82 50 20 00 00    	mov    0x2050(%edx),%eax
  100bc2:	39 d8                	cmp    %ebx,%eax
  100bc4:	0f 84 8a 00 00 00    	je     100c54 <get_from+0x144>
  100bca:	8b 8a 4c 20 00 00    	mov    0x204c(%edx),%ecx
  100bd0:	89 ca                	mov    %ecx,%edx
  100bd2:	c1 e2 07             	shl    $0x7,%edx
  100bd5:	01 ca                	add    %ecx,%edx
  100bd7:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100bda:	01 d2                	add    %edx,%edx
  100bdc:	01 ca                	add    %ecx,%edx
  100bde:	89 04 d5 10 4a 10 00 	mov    %eax,0x104a10(,%edx,8)
  100be5:	89 c2                	mov    %eax,%edx
  100be7:	c1 e2 07             	shl    $0x7,%edx
  100bea:	01 c2                	add    %eax,%edx
  100bec:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100bef:	01 d2                	add    %edx,%edx
  100bf1:	01 c2                	add    %eax,%edx
  100bf3:	89 0c d5 0c 4a 10 00 	mov    %ecx,0x104a0c(,%edx,8)
  100bfa:	89 06                	mov    %eax,(%esi)
  100bfc:	89 d8                	mov    %ebx,%eax
  100bfe:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100c01:	5b                   	pop    %ebx
  100c02:	5e                   	pop    %esi
  100c03:	5d                   	pop    %ebp
  100c04:	c3                   	ret    
  100c05:	8d 76 00             	lea    0x0(%esi),%esi
  100c08:	83 ec 08             	sub    $0x8,%esp
  100c0b:	68 de 00 00 00       	push   $0xde
  100c10:	68 5e 16 10 00       	push   $0x10165e
  100c15:	e8 ee 08 00 00       	call   101508 <abort>
  100c1a:	a1 00 00 00 00       	mov    0x0,%eax
  100c1f:	0f 0b                	ud2    
  100c21:	8d 76 00             	lea    0x0(%esi),%esi
  100c24:	83 ec 08             	sub    $0x8,%esp
  100c27:	68 cf 00 00 00       	push   $0xcf
  100c2c:	68 5e 16 10 00       	push   $0x10165e
  100c31:	e8 d2 08 00 00       	call   101508 <abort>
  100c36:	83 c4 10             	add    $0x10,%esp
  100c39:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100c3e:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100c41:	5b                   	pop    %ebx
  100c42:	5e                   	pop    %esi
  100c43:	5d                   	pop    %ebp
  100c44:	c3                   	ret    
  100c45:	8d 76 00             	lea    0x0(%esi),%esi
  100c48:	be 00 20 10 00       	mov    $0x102000,%esi
  100c4d:	e9 3c ff ff ff       	jmp    100b8e <get_from+0x7e>
  100c52:	66 90                	xchg   %ax,%ax
  100c54:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100c5a:	89 d8                	mov    %ebx,%eax
  100c5c:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100c5f:	5b                   	pop    %ebx
  100c60:	5e                   	pop    %esi
  100c61:	5d                   	pop    %ebp
  100c62:	c3                   	ret    
  100c63:	90                   	nop

00100c64 <get_from_block>:
  100c64:	55                   	push   %ebp
  100c65:	89 e5                	mov    %esp,%ebp
  100c67:	83 ec 10             	sub    $0x10,%esp
  100c6a:	ff 75 08             	pushl  0x8(%ebp)
  100c6d:	ff 35 00 20 10 00    	pushl  0x102000
  100c73:	e8 98 fe ff ff       	call   100b10 <get_from>
  100c78:	83 c4 10             	add    $0x10,%esp
  100c7b:	40                   	inc    %eax
  100c7c:	74 0a                	je     100c88 <get_from_block+0x24>
  100c7e:	b8 01 00 00 00       	mov    $0x1,%eax
  100c83:	c9                   	leave  
  100c84:	c3                   	ret    
  100c85:	8d 76 00             	lea    0x0(%esi),%esi
  100c88:	83 ec 08             	sub    $0x8,%esp
  100c8b:	68 19 01 00 00       	push   $0x119
  100c90:	68 5e 16 10 00       	push   $0x10165e
  100c95:	e8 6e 08 00 00       	call   101508 <abort>
  100c9a:	83 c4 10             	add    $0x10,%esp
  100c9d:	b8 01 00 00 00       	mov    $0x1,%eax
  100ca2:	c9                   	leave  
  100ca3:	c3                   	ret    

00100ca4 <check_block>:
  100ca4:	55                   	push   %ebp
  100ca5:	89 e5                	mov    %esp,%ebp
  100ca7:	57                   	push   %edi
  100ca8:	56                   	push   %esi
  100ca9:	53                   	push   %ebx
  100caa:	83 ec 0c             	sub    $0xc,%esp
  100cad:	a1 00 20 10 00       	mov    0x102000,%eax
  100cb2:	89 c6                	mov    %eax,%esi
  100cb4:	83 f8 ff             	cmp    $0xffffffff,%eax
  100cb7:	74 58                	je     100d11 <check_block+0x6d>
  100cb9:	89 c2                	mov    %eax,%edx
  100cbb:	c1 e2 07             	shl    $0x7,%edx
  100cbe:	01 c2                	add    %eax,%edx
  100cc0:	8d 3c 90             	lea    (%eax,%edx,4),%edi
  100cc3:	01 ff                	add    %edi,%edi
  100cc5:	01 c7                	add    %eax,%edi
  100cc7:	eb 0c                	jmp    100cd5 <check_block+0x31>
  100cc9:	8d 76 00             	lea    0x0(%esi),%esi
  100ccc:	39 c6                	cmp    %eax,%esi
  100cce:	74 3c                	je     100d0c <check_block+0x68>
  100cd0:	83 f8 ff             	cmp    $0xffffffff,%eax
  100cd3:	74 37                	je     100d0c <check_block+0x68>
  100cd5:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
  100cdc:	8b 8b 04 4a 10 00    	mov    0x104a04(%ebx),%ecx
  100ce2:	85 c9                	test   %ecx,%ecx
  100ce4:	7f e6                	jg     100ccc <check_block+0x28>
  100ce6:	83 ec 0c             	sub    $0xc,%esp
  100ce9:	56                   	push   %esi
  100cea:	e8 75 ff ff ff       	call   100c64 <get_from_block>
  100cef:	58                   	pop    %eax
  100cf0:	5a                   	pop    %edx
  100cf1:	81 c3 c0 49 10 00    	add    $0x1049c0,%ebx
  100cf7:	53                   	push   %ebx
  100cf8:	56                   	push   %esi
  100cf9:	e8 06 fc ff ff       	call   100904 <put_into_runnable>
  100cfe:	83 c4 10             	add    $0x10,%esp
  100d01:	a1 00 20 10 00       	mov    0x102000,%eax
  100d06:	39 c6                	cmp    %eax,%esi
  100d08:	75 c6                	jne    100cd0 <check_block+0x2c>
  100d0a:	66 90                	xchg   %ax,%ax
  100d0c:	be 01 00 00 00       	mov    $0x1,%esi
  100d11:	89 f0                	mov    %esi,%eax
  100d13:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100d16:	5b                   	pop    %ebx
  100d17:	5e                   	pop    %esi
  100d18:	5f                   	pop    %edi
  100d19:	5d                   	pop    %ebp
  100d1a:	c3                   	ret    
  100d1b:	90                   	nop

00100d1c <checkTimeCount>:
  100d1c:	a1 a4 29 10 00       	mov    0x1029a4,%eax
  100d21:	85 c0                	test   %eax,%eax
  100d23:	0f 84 f7 00 00 00    	je     100e20 <checkTimeCount+0x104>
  100d29:	55                   	push   %ebp
  100d2a:	89 e5                	mov    %esp,%ebp
  100d2c:	57                   	push   %edi
  100d2d:	56                   	push   %esi
  100d2e:	83 ec 0c             	sub    $0xc,%esp
  100d31:	68 d0 15 10 00       	push   $0x1015d0
  100d36:	e8 59 06 00 00       	call   101394 <printk>
  100d3b:	5e                   	pop    %esi
  100d3c:	ff 35 a0 29 10 00    	pushl  0x1029a0
  100d42:	68 b8 17 10 00       	push   $0x1017b8
  100d47:	6a 30                	push   $0x30
  100d49:	68 5e 16 10 00       	push   $0x10165e
  100d4e:	68 8a 16 10 00       	push   $0x10168a
  100d53:	e8 3c 06 00 00       	call   101394 <printk>
  100d58:	83 c4 14             	add    $0x14,%esp
  100d5b:	68 f2 15 10 00       	push   $0x1015f2
  100d60:	e8 2f 06 00 00       	call   101394 <printk>
  100d65:	c7 04 24 d0 15 10 00 	movl   $0x1015d0,(%esp)
  100d6c:	e8 23 06 00 00       	call   101394 <printk>
  100d71:	5f                   	pop    %edi
  100d72:	a1 a0 29 10 00       	mov    0x1029a0,%eax
  100d77:	89 c2                	mov    %eax,%edx
  100d79:	c1 e2 07             	shl    $0x7,%edx
  100d7c:	01 c2                	add    %eax,%edx
  100d7e:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100d81:	01 d2                	add    %edx,%edx
  100d83:	01 d0                	add    %edx,%eax
  100d85:	ff 34 c5 00 4a 10 00 	pushl  0x104a00(,%eax,8)
  100d8c:	68 b8 17 10 00       	push   $0x1017b8
  100d91:	6a 31                	push   $0x31
  100d93:	68 5e 16 10 00       	push   $0x10165e
  100d98:	68 70 17 10 00       	push   $0x101770
  100d9d:	e8 f2 05 00 00       	call   101394 <printk>
  100da2:	83 c4 14             	add    $0x14,%esp
  100da5:	68 f2 15 10 00       	push   $0x1015f2
  100daa:	e8 e5 05 00 00       	call   101394 <printk>
  100daf:	e8 f0 fe ff ff       	call   100ca4 <check_block>
  100db4:	8b 15 a0 29 10 00    	mov    0x1029a0,%edx
  100dba:	89 d0                	mov    %edx,%eax
  100dbc:	c1 e0 07             	shl    $0x7,%eax
  100dbf:	01 d0                	add    %edx,%eax
  100dc1:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100dc4:	01 c0                	add    %eax,%eax
  100dc6:	01 d0                	add    %edx,%eax
  100dc8:	c1 e0 03             	shl    $0x3,%eax
  100dcb:	83 c4 10             	add    $0x10,%esp
  100dce:	8b 88 00 4a 10 00    	mov    0x104a00(%eax),%ecx
  100dd4:	85 c9                	test   %ecx,%ecx
  100dd6:	7e 0c                	jle    100de4 <checkTimeCount+0xc8>
  100dd8:	b8 01 00 00 00       	mov    $0x1,%eax
  100ddd:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100de0:	5e                   	pop    %esi
  100de1:	5f                   	pop    %edi
  100de2:	5d                   	pop    %ebp
  100de3:	c3                   	ret    
  100de4:	05 c0 49 10 00       	add    $0x1049c0,%eax
  100de9:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100dee:	89 c7                	mov    %eax,%edi
  100df0:	8b 75 08             	mov    0x8(%ebp),%esi
  100df3:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100df5:	83 ec 08             	sub    $0x8,%esp
  100df8:	ff 75 08             	pushl  0x8(%ebp)
  100dfb:	52                   	push   %edx
  100dfc:	e8 03 fb ff ff       	call   100904 <put_into_runnable>
  100e01:	e8 3a fa ff ff       	call   100840 <get_from_runnable>
  100e06:	5a                   	pop    %edx
  100e07:	59                   	pop    %ecx
  100e08:	ff 75 08             	pushl  0x8(%ebp)
  100e0b:	50                   	push   %eax
  100e0c:	e8 4f f8 ff ff       	call   100660 <put_into_running>
  100e11:	83 c4 10             	add    $0x10,%esp
  100e14:	b8 01 00 00 00       	mov    $0x1,%eax
  100e19:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e1c:	5e                   	pop    %esi
  100e1d:	5f                   	pop    %edi
  100e1e:	5d                   	pop    %ebp
  100e1f:	c3                   	ret    
  100e20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e25:	c3                   	ret    
  100e26:	66 90                	xchg   %ax,%ax

00100e28 <check_is_in>:
  100e28:	55                   	push   %ebp
  100e29:	89 e5                	mov    %esp,%ebp
  100e2b:	53                   	push   %ebx
  100e2c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100e2f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100e32:	85 c9                	test   %ecx,%ecx
  100e34:	7e 4a                	jle    100e80 <check_is_in+0x58>
  100e36:	39 d9                	cmp    %ebx,%ecx
  100e38:	74 3b                	je     100e75 <check_is_in+0x4d>
  100e3a:	89 c8                	mov    %ecx,%eax
  100e3c:	c1 e0 07             	shl    $0x7,%eax
  100e3f:	01 c8                	add    %ecx,%eax
  100e41:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100e44:	01 c0                	add    %eax,%eax
  100e46:	01 c8                	add    %ecx,%eax
  100e48:	8b 04 c5 10 4a 10 00 	mov    0x104a10(,%eax,8),%eax
  100e4f:	39 c1                	cmp    %eax,%ecx
  100e51:	75 1e                	jne    100e71 <check_is_in+0x49>
  100e53:	eb 2b                	jmp    100e80 <check_is_in+0x58>
  100e55:	8d 76 00             	lea    0x0(%esi),%esi
  100e58:	89 c2                	mov    %eax,%edx
  100e5a:	c1 e2 07             	shl    $0x7,%edx
  100e5d:	01 c2                	add    %eax,%edx
  100e5f:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100e62:	01 d2                	add    %edx,%edx
  100e64:	01 d0                	add    %edx,%eax
  100e66:	8b 04 c5 10 4a 10 00 	mov    0x104a10(,%eax,8),%eax
  100e6d:	39 c1                	cmp    %eax,%ecx
  100e6f:	74 0f                	je     100e80 <check_is_in+0x58>
  100e71:	39 c3                	cmp    %eax,%ebx
  100e73:	75 e3                	jne    100e58 <check_is_in+0x30>
  100e75:	b8 01 00 00 00       	mov    $0x1,%eax
  100e7a:	5b                   	pop    %ebx
  100e7b:	5d                   	pop    %ebp
  100e7c:	c3                   	ret    
  100e7d:	8d 76 00             	lea    0x0(%esi),%esi
  100e80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e85:	5b                   	pop    %ebx
  100e86:	5d                   	pop    %ebp
  100e87:	c3                   	ret    

00100e88 <block_decrease>:
  100e88:	55                   	push   %ebp
  100e89:	89 e5                	mov    %esp,%ebp
  100e8b:	8b 0d 00 20 10 00    	mov    0x102000,%ecx
  100e91:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100e94:	74 2e                	je     100ec4 <block_decrease+0x3c>
  100e96:	89 c8                	mov    %ecx,%eax
  100e98:	89 c2                	mov    %eax,%edx
  100e9a:	c1 e2 07             	shl    $0x7,%edx
  100e9d:	01 c2                	add    %eax,%edx
  100e9f:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100ea2:	01 d2                	add    %edx,%edx
  100ea4:	01 d0                	add    %edx,%eax
  100ea6:	8d 04 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%eax
  100ead:	ff 88 44 20 00 00    	decl   0x2044(%eax)
  100eb3:	8b 80 50 20 00 00    	mov    0x2050(%eax),%eax
  100eb9:	39 c1                	cmp    %eax,%ecx
  100ebb:	75 db                	jne    100e98 <block_decrease+0x10>
  100ebd:	b8 01 00 00 00       	mov    $0x1,%eax
  100ec2:	5d                   	pop    %ebp
  100ec3:	c3                   	ret    
  100ec4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100ec9:	5d                   	pop    %ebp
  100eca:	c3                   	ret    
  100ecb:	90                   	nop

00100ecc <init_pcb>:
  100ecc:	55                   	push   %ebp
  100ecd:	89 e5                	mov    %esp,%ebp
  100ecf:	ba 08 4a 10 00       	mov    $0x104a08,%edx
  100ed4:	31 c0                	xor    %eax,%eax
  100ed6:	66 90                	xchg   %ax,%ax
  100ed8:	89 02                	mov    %eax,(%edx)
  100eda:	8d 48 ff             	lea    -0x1(%eax),%ecx
  100edd:	89 4a 04             	mov    %ecx,0x4(%edx)
  100ee0:	40                   	inc    %eax
  100ee1:	89 42 08             	mov    %eax,0x8(%edx)
  100ee4:	81 c2 58 20 00 00    	add    $0x2058,%edx
  100eea:	3d 00 08 00 00       	cmp    $0x800,%eax
  100eef:	75 e7                	jne    100ed8 <init_pcb+0xc>
  100ef1:	c7 05 0c 4a 10 00 ff 	movl   $0x7ff,0x104a0c
  100ef8:	07 00 00 
  100efb:	c7 05 b8 e9 12 01 00 	movl   $0x0,0x112e9b8
  100f02:	00 00 00 
  100f05:	5d                   	pop    %ebp
  100f06:	c3                   	ret    
  100f07:	90                   	nop

00100f08 <init_kernel_pcb>:
  100f08:	55                   	push   %ebp
  100f09:	89 e5                	mov    %esp,%ebp
  100f0b:	c7 05 f8 49 10 00 10 	movl   $0x10,0x1049f8
  100f12:	00 00 00 
  100f15:	c7 05 ec 49 10 00 08 	movl   $0x8,0x1049ec
  100f1c:	00 00 00 
  100f1f:	c7 05 e8 49 10 00 58 	movl   $0x100658,0x1049e8
  100f26:	06 10 00 
  100f29:	c7 05 f4 49 10 00 00 	movl   $0x7f00000,0x1049f4
  100f30:	00 f0 07 
  100f33:	c7 05 fc 49 10 00 01 	movl   $0x1,0x1049fc
  100f3a:	00 00 00 
  100f3d:	c7 05 00 4a 10 00 04 	movl   $0x4,0x104a00
  100f44:	00 00 00 
  100f47:	b8 01 00 00 00       	mov    $0x1,%eax
  100f4c:	5d                   	pop    %ebp
  100f4d:	c3                   	ret    
  100f4e:	66 90                	xchg   %ax,%ax

00100f50 <transfer_pid_state>:
  100f50:	55                   	push   %ebp
  100f51:	89 e5                	mov    %esp,%ebp
  100f53:	b8 01 00 00 00       	mov    $0x1,%eax
  100f58:	5d                   	pop    %ebp
  100f59:	c3                   	ret    
  100f5a:	66 90                	xchg   %ax,%ax

00100f5c <make_pcb>:
  100f5c:	55                   	push   %ebp
  100f5d:	89 e5                	mov    %esp,%ebp
  100f5f:	57                   	push   %edi
  100f60:	56                   	push   %esi
  100f61:	8b 45 08             	mov    0x8(%ebp),%eax
  100f64:	89 c2                	mov    %eax,%edx
  100f66:	c1 e2 07             	shl    $0x7,%edx
  100f69:	01 c2                	add    %eax,%edx
  100f6b:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100f6e:	01 d2                	add    %edx,%edx
  100f70:	01 c2                	add    %eax,%edx
  100f72:	c1 e2 03             	shl    $0x3,%edx
  100f75:	8d 82 c0 49 10 00    	lea    0x1049c0(%edx),%eax
  100f7b:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100f80:	89 c7                	mov    %eax,%edi
  100f82:	8b 75 0c             	mov    0xc(%ebp),%esi
  100f85:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100f87:	8b 45 10             	mov    0x10(%ebp),%eax
  100f8a:	89 82 fc 49 10 00    	mov    %eax,0x1049fc(%edx)
  100f90:	8b 45 14             	mov    0x14(%ebp),%eax
  100f93:	89 82 00 4a 10 00    	mov    %eax,0x104a00(%edx)
  100f99:	8b 45 18             	mov    0x18(%ebp),%eax
  100f9c:	89 82 04 4a 10 00    	mov    %eax,0x104a04(%edx)
  100fa2:	8b 45 0c             	mov    0xc(%ebp),%eax
  100fa5:	89 82 14 4a 10 00    	mov    %eax,0x104a14(%edx)
  100fab:	b8 01 00 00 00       	mov    $0x1,%eax
  100fb0:	5e                   	pop    %esi
  100fb1:	5f                   	pop    %edi
  100fb2:	5d                   	pop    %ebp
  100fb3:	c3                   	ret    

00100fb4 <initIdt>:
  100fb4:	55                   	push   %ebp
  100fb5:	89 e5                	mov    %esp,%ebp
  100fb7:	53                   	push   %ebx
  100fb8:	ba 9f 15 10 00       	mov    $0x10159f,%edx
  100fbd:	89 d3                	mov    %edx,%ebx
  100fbf:	c1 ea 10             	shr    $0x10,%edx
  100fc2:	b9 80 f2 12 01       	mov    $0x112f280,%ecx
  100fc7:	b8 80 ea 12 01       	mov    $0x112ea80,%eax
  100fcc:	66 89 18             	mov    %bx,(%eax)
  100fcf:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100fd5:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100fd9:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100fdd:	66 89 50 06          	mov    %dx,0x6(%eax)
  100fe1:	83 c0 08             	add    $0x8,%eax
  100fe4:	39 c1                	cmp    %eax,%ecx
  100fe6:	75 e4                	jne    100fcc <initIdt+0x18>
  100fe8:	b8 a5 15 10 00       	mov    $0x1015a5,%eax
  100fed:	66 a3 e8 ea 12 01    	mov    %ax,0x112eae8
  100ff3:	66 c7 05 ea ea 12 01 	movw   $0x8,0x112eaea
  100ffa:	08 00 
  100ffc:	c6 05 ec ea 12 01 00 	movb   $0x0,0x112eaec
  101003:	c6 05 ed ea 12 01 8f 	movb   $0x8f,0x112eaed
  10100a:	c1 e8 10             	shr    $0x10,%eax
  10100d:	66 a3 ee ea 12 01    	mov    %ax,0x112eaee
  101013:	b8 a9 15 10 00       	mov    $0x1015a9,%eax
  101018:	66 a3 80 ee 12 01    	mov    %ax,0x112ee80
  10101e:	66 c7 05 82 ee 12 01 	movw   $0x8,0x112ee82
  101025:	08 00 
  101027:	c6 05 84 ee 12 01 00 	movb   $0x0,0x112ee84
  10102e:	c6 05 85 ee 12 01 ee 	movb   $0xee,0x112ee85
  101035:	c1 e8 10             	shr    $0x10,%eax
  101038:	66 a3 86 ee 12 01    	mov    %ax,0x112ee86
  10103e:	b8 b2 15 10 00       	mov    $0x1015b2,%eax
  101043:	66 a3 80 eb 12 01    	mov    %ax,0x112eb80
  101049:	66 c7 05 82 eb 12 01 	movw   $0x8,0x112eb82
  101050:	08 00 
  101052:	c6 05 84 eb 12 01 00 	movb   $0x0,0x112eb84
  101059:	c6 05 85 eb 12 01 8e 	movb   $0x8e,0x112eb85
  101060:	c1 e8 10             	shr    $0x10,%eax
  101063:	66 a3 86 eb 12 01    	mov    %ax,0x112eb86
  101069:	66 c7 05 30 21 10 00 	movw   $0x7ff,0x102130
  101070:	ff 07 
  101072:	b8 80 ea 12 01       	mov    $0x112ea80,%eax
  101077:	66 a3 32 21 10 00    	mov    %ax,0x102132
  10107d:	c1 e8 10             	shr    $0x10,%eax
  101080:	66 a3 34 21 10 00    	mov    %ax,0x102134
  101086:	b8 30 21 10 00       	mov    $0x102130,%eax
  10108b:	0f 01 18             	lidtl  (%eax)
  10108e:	5b                   	pop    %ebx
  10108f:	5d                   	pop    %ebp
  101090:	c3                   	ret    
  101091:	66 90                	xchg   %ax,%ax
  101093:	90                   	nop

00101094 <syscallHandle>:
  101094:	55                   	push   %ebp
  101095:	89 e5                	mov    %esp,%ebp
  101097:	53                   	push   %ebx
  101098:	50                   	push   %eax
  101099:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10109c:	8b 43 1c             	mov    0x1c(%ebx),%eax
  10109f:	83 f8 02             	cmp    $0x2,%eax
  1010a2:	74 28                	je     1010cc <syscallHandle+0x38>
  1010a4:	76 3a                	jbe    1010e0 <syscallHandle+0x4c>
  1010a6:	83 f8 04             	cmp    $0x4,%eax
  1010a9:	74 15                	je     1010c0 <syscallHandle+0x2c>
  1010ab:	3d e6 00 00 00       	cmp    $0xe6,%eax
  1010b0:	75 29                	jne    1010db <syscallHandle+0x47>
  1010b2:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1010b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1010b8:	c9                   	leave  
  1010b9:	e9 22 f3 ff ff       	jmp    1003e0 <sys_sleep>
  1010be:	66 90                	xchg   %ax,%ax
  1010c0:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1010c3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1010c6:	c9                   	leave  
  1010c7:	e9 e4 f4 ff ff       	jmp    1005b0 <sys_write>
  1010cc:	83 ec 0c             	sub    $0xc,%esp
  1010cf:	53                   	push   %ebx
  1010d0:	e8 8f f3 ff ff       	call   100464 <sys_fork>
  1010d5:	89 43 1c             	mov    %eax,0x1c(%ebx)
  1010d8:	83 c4 10             	add    $0x10,%esp
  1010db:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1010de:	c9                   	leave  
  1010df:	c3                   	ret    
  1010e0:	48                   	dec    %eax
  1010e1:	75 f8                	jne    1010db <syscallHandle+0x47>
  1010e3:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1010e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1010e9:	c9                   	leave  
  1010ea:	e9 d1 f2 ff ff       	jmp    1003c0 <sys_exit>
  1010ef:	90                   	nop

001010f0 <GProtectFaultHandle>:
  1010f0:	55                   	push   %ebp
  1010f1:	89 e5                	mov    %esp,%ebp
  1010f3:	83 ec 14             	sub    $0x14,%esp
  1010f6:	68 d0 15 10 00       	push   $0x1015d0
  1010fb:	e8 94 02 00 00       	call   101394 <printk>
  101100:	58                   	pop    %eax
  101101:	8b 45 08             	mov    0x8(%ebp),%eax
  101104:	ff 70 20             	pushl  0x20(%eax)
  101107:	68 04 18 10 00       	push   $0x101804
  10110c:	6a 57                	push   $0x57
  10110e:	68 d9 17 10 00       	push   $0x1017d9
  101113:	68 ec 17 10 00       	push   $0x1017ec
  101118:	e8 77 02 00 00       	call   101394 <printk>
  10111d:	83 c4 14             	add    $0x14,%esp
  101120:	68 f2 15 10 00       	push   $0x1015f2
  101125:	e8 6a 02 00 00       	call   101394 <printk>
  10112a:	5a                   	pop    %edx
  10112b:	59                   	pop    %ecx
  10112c:	6a 58                	push   $0x58
  10112e:	68 d9 17 10 00       	push   $0x1017d9
  101133:	e8 d0 03 00 00       	call   101508 <abort>
  101138:	83 c4 10             	add    $0x10,%esp
  10113b:	c9                   	leave  
  10113c:	c3                   	ret    
  10113d:	8d 76 00             	lea    0x0(%esi),%esi

00101140 <timeHandle>:
  101140:	55                   	push   %ebp
  101141:	89 e5                	mov    %esp,%ebp
  101143:	53                   	push   %ebx
  101144:	83 ec 10             	sub    $0x10,%esp
  101147:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10114a:	6a 41                	push   $0x41
  10114c:	e8 eb f4 ff ff       	call   10063c <putChar>
  101151:	e8 ba f6 ff ff       	call   100810 <getpid>
  101156:	89 c2                	mov    %eax,%edx
  101158:	c1 e2 07             	shl    $0x7,%edx
  10115b:	01 c2                	add    %eax,%edx
  10115d:	8d 14 90             	lea    (%eax,%edx,4),%edx
  101160:	01 d2                	add    %edx,%edx
  101162:	01 d0                	add    %edx,%eax
  101164:	ff 0c c5 00 4a 10 00 	decl   0x104a00(,%eax,8)
  10116b:	e8 18 fd ff ff       	call   100e88 <block_decrease>
  101170:	89 1c 24             	mov    %ebx,(%esp)
  101173:	e8 a4 fb ff ff       	call   100d1c <checkTimeCount>
  101178:	83 c4 10             	add    $0x10,%esp
  10117b:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  101182:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101185:	c9                   	leave  
  101186:	e9 b1 f4 ff ff       	jmp    10063c <putChar>
  10118b:	90                   	nop

0010118c <irqHandle>:
  10118c:	55                   	push   %ebp
  10118d:	89 e5                	mov    %esp,%ebp
  10118f:	53                   	push   %ebx
  101190:	83 ec 14             	sub    $0x14,%esp
  101193:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101196:	89 6d f4             	mov    %ebp,-0xc(%ebp)
  101199:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10119c:	3b 58 08             	cmp    0x8(%eax),%ebx
  10119f:	74 12                	je     1011b3 <irqHandle+0x27>
  1011a1:	83 ec 08             	sub    $0x8,%esp
  1011a4:	6a 1c                	push   $0x1c
  1011a6:	68 d9 17 10 00       	push   $0x1017d9
  1011ab:	e8 58 03 00 00       	call   101508 <abort>
  1011b0:	83 c4 10             	add    $0x10,%esp
  1011b3:	fa                   	cli    
  1011b4:	8b 43 20             	mov    0x20(%ebx),%eax
  1011b7:	83 f8 0d             	cmp    $0xd,%eax
  1011ba:	74 48                	je     101204 <irqHandle+0x78>
  1011bc:	7e 2e                	jle    1011ec <irqHandle+0x60>
  1011be:	83 f8 20             	cmp    $0x20,%eax
  1011c1:	74 19                	je     1011dc <irqHandle+0x50>
  1011c3:	83 c0 80             	add    $0xffffff80,%eax
  1011c6:	75 27                	jne    1011ef <irqHandle+0x63>
  1011c8:	83 ec 0c             	sub    $0xc,%esp
  1011cb:	53                   	push   %ebx
  1011cc:	e8 c3 fe ff ff       	call   101094 <syscallHandle>
  1011d1:	83 c4 10             	add    $0x10,%esp
  1011d4:	fb                   	sti    
  1011d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1011d8:	c9                   	leave  
  1011d9:	c3                   	ret    
  1011da:	66 90                	xchg   %ax,%ax
  1011dc:	83 ec 0c             	sub    $0xc,%esp
  1011df:	53                   	push   %ebx
  1011e0:	e8 5b ff ff ff       	call   101140 <timeHandle>
  1011e5:	83 c4 10             	add    $0x10,%esp
  1011e8:	eb ea                	jmp    1011d4 <irqHandle+0x48>
  1011ea:	66 90                	xchg   %ax,%ax
  1011ec:	40                   	inc    %eax
  1011ed:	74 e5                	je     1011d4 <irqHandle+0x48>
  1011ef:	83 ec 08             	sub    $0x8,%esp
  1011f2:	6a 30                	push   $0x30
  1011f4:	68 d9 17 10 00       	push   $0x1017d9
  1011f9:	e8 0a 03 00 00       	call   101508 <abort>
  1011fe:	83 c4 10             	add    $0x10,%esp
  101201:	eb d1                	jmp    1011d4 <irqHandle+0x48>
  101203:	90                   	nop
  101204:	83 ec 0c             	sub    $0xc,%esp
  101207:	53                   	push   %ebx
  101208:	e8 e3 fe ff ff       	call   1010f0 <GProtectFaultHandle>
  10120d:	83 c4 10             	add    $0x10,%esp
  101210:	eb c2                	jmp    1011d4 <irqHandle+0x48>
  101212:	66 90                	xchg   %ax,%ax

00101214 <initIntr>:
  101214:	55                   	push   %ebp
  101215:	89 e5                	mov    %esp,%ebp
  101217:	ba 21 00 00 00       	mov    $0x21,%edx
  10121c:	b0 ff                	mov    $0xff,%al
  10121e:	ee                   	out    %al,(%dx)
  10121f:	ba a1 00 00 00       	mov    $0xa1,%edx
  101224:	ee                   	out    %al,(%dx)
  101225:	ba 20 00 00 00       	mov    $0x20,%edx
  10122a:	b0 11                	mov    $0x11,%al
  10122c:	ee                   	out    %al,(%dx)
  10122d:	ba 21 00 00 00       	mov    $0x21,%edx
  101232:	b0 20                	mov    $0x20,%al
  101234:	ee                   	out    %al,(%dx)
  101235:	b0 04                	mov    $0x4,%al
  101237:	ee                   	out    %al,(%dx)
  101238:	b0 03                	mov    $0x3,%al
  10123a:	ee                   	out    %al,(%dx)
  10123b:	ba a0 00 00 00       	mov    $0xa0,%edx
  101240:	b0 11                	mov    $0x11,%al
  101242:	ee                   	out    %al,(%dx)
  101243:	ba a1 00 00 00       	mov    $0xa1,%edx
  101248:	b0 28                	mov    $0x28,%al
  10124a:	ee                   	out    %al,(%dx)
  10124b:	b0 02                	mov    $0x2,%al
  10124d:	ee                   	out    %al,(%dx)
  10124e:	b0 03                	mov    $0x3,%al
  101250:	ee                   	out    %al,(%dx)
  101251:	ba 20 00 00 00       	mov    $0x20,%edx
  101256:	b0 68                	mov    $0x68,%al
  101258:	ee                   	out    %al,(%dx)
  101259:	b0 0a                	mov    $0xa,%al
  10125b:	ee                   	out    %al,(%dx)
  10125c:	ba a0 00 00 00       	mov    $0xa0,%edx
  101261:	b0 68                	mov    $0x68,%al
  101263:	ee                   	out    %al,(%dx)
  101264:	b0 0a                	mov    $0xa,%al
  101266:	ee                   	out    %al,(%dx)
  101267:	5d                   	pop    %ebp
  101268:	c3                   	ret    
  101269:	8d 76 00             	lea    0x0(%esi),%esi

0010126c <initTimer>:
  10126c:	55                   	push   %ebp
  10126d:	89 e5                	mov    %esp,%ebp
  10126f:	ba 43 00 00 00       	mov    $0x43,%edx
  101274:	b0 34                	mov    $0x34,%al
  101276:	ee                   	out    %al,(%dx)
  101277:	ba 40 00 00 00       	mov    $0x40,%edx
  10127c:	b0 9b                	mov    $0x9b,%al
  10127e:	ee                   	out    %al,(%dx)
  10127f:	b0 2e                	mov    $0x2e,%al
  101281:	ee                   	out    %al,(%dx)
  101282:	5d                   	pop    %ebp
  101283:	c3                   	ret    

00101284 <i2A>:
  101284:	55                   	push   %ebp
  101285:	89 e5                	mov    %esp,%ebp
  101287:	57                   	push   %edi
  101288:	56                   	push   %esi
  101289:	53                   	push   %ebx
  10128a:	51                   	push   %ecx
  10128b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10128e:	85 c9                	test   %ecx,%ecx
  101290:	78 6e                	js     101300 <i2A+0x7c>
  101292:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  101296:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  10129a:	bb 7e 21 10 00       	mov    $0x10217e,%ebx
  10129f:	31 ff                	xor    %edi,%edi
  1012a1:	eb 03                	jmp    1012a6 <i2A+0x22>
  1012a3:	90                   	nop
  1012a4:	89 f7                	mov    %esi,%edi
  1012a6:	4b                   	dec    %ebx
  1012a7:	89 c8                	mov    %ecx,%eax
  1012a9:	be 0a 00 00 00       	mov    $0xa,%esi
  1012ae:	99                   	cltd   
  1012af:	f7 fe                	idiv   %esi
  1012b1:	83 c2 30             	add    $0x30,%edx
  1012b4:	88 13                	mov    %dl,(%ebx)
  1012b6:	8d 77 01             	lea    0x1(%edi),%esi
  1012b9:	b8 67 66 66 66       	mov    $0x66666667,%eax
  1012be:	f7 e9                	imul   %ecx
  1012c0:	89 d0                	mov    %edx,%eax
  1012c2:	c1 f8 02             	sar    $0x2,%eax
  1012c5:	c1 f9 1f             	sar    $0x1f,%ecx
  1012c8:	29 c8                	sub    %ecx,%eax
  1012ca:	89 c1                	mov    %eax,%ecx
  1012cc:	75 d6                	jne    1012a4 <i2A+0x20>
  1012ce:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  1012d2:	74 20                	je     1012f4 <i2A+0x70>
  1012d4:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  1012d8:	75 06                	jne    1012e0 <i2A+0x5c>
  1012da:	fe 05 7d 21 10 00    	incb   0x10217d
  1012e0:	c6 05 7e 21 10 00 00 	movb   $0x0,0x10217e
  1012e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1012ea:	89 18                	mov    %ebx,(%eax)
  1012ec:	89 f0                	mov    %esi,%eax
  1012ee:	5a                   	pop    %edx
  1012ef:	5b                   	pop    %ebx
  1012f0:	5e                   	pop    %esi
  1012f1:	5f                   	pop    %edi
  1012f2:	5d                   	pop    %ebp
  1012f3:	c3                   	ret    
  1012f4:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  1012f8:	8d 77 02             	lea    0x2(%edi),%esi
  1012fb:	4b                   	dec    %ebx
  1012fc:	eb d6                	jmp    1012d4 <i2A+0x50>
  1012fe:	66 90                	xchg   %ax,%ax
  101300:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  101306:	74 0c                	je     101314 <i2A+0x90>
  101308:	f7 d9                	neg    %ecx
  10130a:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  10130e:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  101312:	eb 86                	jmp    10129a <i2A+0x16>
  101314:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  101319:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  10131d:	eb ef                	jmp    10130e <i2A+0x8a>
  10131f:	90                   	nop

00101320 <i2X>:
  101320:	55                   	push   %ebp
  101321:	89 e5                	mov    %esp,%ebp
  101323:	57                   	push   %edi
  101324:	56                   	push   %esi
  101325:	53                   	push   %ebx
  101326:	8b 55 08             	mov    0x8(%ebp),%edx
  101329:	b9 5d 21 10 00       	mov    $0x10215d,%ecx
  10132e:	31 c0                	xor    %eax,%eax
  101330:	40                   	inc    %eax
  101331:	89 d6                	mov    %edx,%esi
  101333:	83 e6 0f             	and    $0xf,%esi
  101336:	8d 5e f6             	lea    -0xa(%esi),%ebx
  101339:	89 cf                	mov    %ecx,%edi
  10133b:	83 fb 05             	cmp    $0x5,%ebx
  10133e:	77 4c                	ja     10138c <i2X+0x6c>
  101340:	ff 24 9d 18 18 10 00 	jmp    *0x101818(,%ebx,4)
  101347:	90                   	nop
  101348:	c6 01 65             	movb   $0x65,(%ecx)
  10134b:	90                   	nop
  10134c:	49                   	dec    %ecx
  10134d:	c1 ea 04             	shr    $0x4,%edx
  101350:	75 de                	jne    101330 <i2X+0x10>
  101352:	c6 05 5e 21 10 00 00 	movb   $0x0,0x10215e
  101359:	8b 55 0c             	mov    0xc(%ebp),%edx
  10135c:	89 3a                	mov    %edi,(%edx)
  10135e:	5b                   	pop    %ebx
  10135f:	5e                   	pop    %esi
  101360:	5f                   	pop    %edi
  101361:	5d                   	pop    %ebp
  101362:	c3                   	ret    
  101363:	90                   	nop
  101364:	c6 01 64             	movb   $0x64,(%ecx)
  101367:	eb e3                	jmp    10134c <i2X+0x2c>
  101369:	8d 76 00             	lea    0x0(%esi),%esi
  10136c:	c6 01 63             	movb   $0x63,(%ecx)
  10136f:	eb db                	jmp    10134c <i2X+0x2c>
  101371:	8d 76 00             	lea    0x0(%esi),%esi
  101374:	c6 01 62             	movb   $0x62,(%ecx)
  101377:	eb d3                	jmp    10134c <i2X+0x2c>
  101379:	8d 76 00             	lea    0x0(%esi),%esi
  10137c:	c6 01 61             	movb   $0x61,(%ecx)
  10137f:	eb cb                	jmp    10134c <i2X+0x2c>
  101381:	8d 76 00             	lea    0x0(%esi),%esi
  101384:	c6 01 66             	movb   $0x66,(%ecx)
  101387:	eb c3                	jmp    10134c <i2X+0x2c>
  101389:	8d 76 00             	lea    0x0(%esi),%esi
  10138c:	8d 5e 30             	lea    0x30(%esi),%ebx
  10138f:	88 19                	mov    %bl,(%ecx)
  101391:	eb b9                	jmp    10134c <i2X+0x2c>
  101393:	90                   	nop

00101394 <printk>:
  101394:	55                   	push   %ebp
  101395:	89 e5                	mov    %esp,%ebp
  101397:	57                   	push   %edi
  101398:	56                   	push   %esi
  101399:	53                   	push   %ebx
  10139a:	83 ec 2c             	sub    $0x2c,%esp
  10139d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1013a0:	8a 11                	mov    (%ecx),%dl
  1013a2:	84 d2                	test   %dl,%dl
  1013a4:	0f 84 54 01 00 00    	je     1014fe <printk+0x16a>
  1013aa:	8d 45 0c             	lea    0xc(%ebp),%eax
  1013ad:	31 ff                	xor    %edi,%edi
  1013af:	eb 18                	jmp    1013c9 <printk+0x35>
  1013b1:	8d 76 00             	lea    0x0(%esi),%esi
  1013b4:	8a 11                	mov    (%ecx),%dl
  1013b6:	89 cb                	mov    %ecx,%ebx
  1013b8:	88 97 80 21 10 00    	mov    %dl,0x102180(%edi)
  1013be:	47                   	inc    %edi
  1013bf:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1013c2:	8a 53 01             	mov    0x1(%ebx),%dl
  1013c5:	84 d2                	test   %dl,%dl
  1013c7:	74 72                	je     10143b <printk+0xa7>
  1013c9:	80 fa 25             	cmp    $0x25,%dl
  1013cc:	75 e6                	jne    1013b4 <printk+0x20>
  1013ce:	8d 59 01             	lea    0x1(%ecx),%ebx
  1013d1:	8a 51 01             	mov    0x1(%ecx),%dl
  1013d4:	80 fa 64             	cmp    $0x64,%dl
  1013d7:	0f 84 bf 00 00 00    	je     10149c <printk+0x108>
  1013dd:	0f 8e 01 01 00 00    	jle    1014e4 <printk+0x150>
  1013e3:	80 fa 73             	cmp    $0x73,%dl
  1013e6:	0f 84 84 00 00 00    	je     101470 <printk+0xdc>
  1013ec:	80 fa 78             	cmp    $0x78,%dl
  1013ef:	75 c7                	jne    1013b8 <printk+0x24>
  1013f1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1013f8:	8d 70 04             	lea    0x4(%eax),%esi
  1013fb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1013fe:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101401:	56                   	push   %esi
  101402:	ff 30                	pushl  (%eax)
  101404:	e8 17 ff ff ff       	call   101320 <i2X>
  101409:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  10140c:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  101412:	8a 11                	mov    (%ecx),%dl
  101414:	83 c4 08             	add    $0x8,%esp
  101417:	31 c0                	xor    %eax,%eax
  101419:	84 d2                	test   %dl,%dl
  10141b:	74 0f                	je     10142c <printk+0x98>
  10141d:	8d 76 00             	lea    0x0(%esi),%esi
  101420:	40                   	inc    %eax
  101421:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101425:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  101428:	84 d2                	test   %dl,%dl
  10142a:	75 f4                	jne    101420 <printk+0x8c>
  10142c:	01 c7                	add    %eax,%edi
  10142e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101431:	8d 4b 01             	lea    0x1(%ebx),%ecx
  101434:	8a 53 01             	mov    0x1(%ebx),%dl
  101437:	84 d2                	test   %dl,%dl
  101439:	75 8e                	jne    1013c9 <printk+0x35>
  10143b:	c6 87 80 21 10 00 00 	movb   $0x0,0x102180(%edi)
  101442:	0f be 05 80 21 10 00 	movsbl 0x102180,%eax
  101449:	bb 80 21 10 00       	mov    $0x102180,%ebx
  10144e:	84 c0                	test   %al,%al
  101450:	74 16                	je     101468 <printk+0xd4>
  101452:	66 90                	xchg   %ax,%ax
  101454:	83 ec 0c             	sub    $0xc,%esp
  101457:	50                   	push   %eax
  101458:	e8 df f1 ff ff       	call   10063c <putChar>
  10145d:	43                   	inc    %ebx
  10145e:	0f be 03             	movsbl (%ebx),%eax
  101461:	83 c4 10             	add    $0x10,%esp
  101464:	84 c0                	test   %al,%al
  101466:	75 ec                	jne    101454 <printk+0xc0>
  101468:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10146b:	5b                   	pop    %ebx
  10146c:	5e                   	pop    %esi
  10146d:	5f                   	pop    %edi
  10146e:	5d                   	pop    %ebp
  10146f:	c3                   	ret    
  101470:	8d 70 04             	lea    0x4(%eax),%esi
  101473:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101476:	8b 08                	mov    (%eax),%ecx
  101478:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  10147e:	8a 11                	mov    (%ecx),%dl
  101480:	31 c0                	xor    %eax,%eax
  101482:	84 d2                	test   %dl,%dl
  101484:	74 a6                	je     10142c <printk+0x98>
  101486:	66 90                	xchg   %ax,%ax
  101488:	40                   	inc    %eax
  101489:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  10148d:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  101490:	84 d2                	test   %dl,%dl
  101492:	75 f4                	jne    101488 <printk+0xf4>
  101494:	01 c7                	add    %eax,%edi
  101496:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101499:	eb 96                	jmp    101431 <printk+0x9d>
  10149b:	90                   	nop
  10149c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1014a3:	8d 70 04             	lea    0x4(%eax),%esi
  1014a6:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1014a9:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  1014ac:	56                   	push   %esi
  1014ad:	ff 30                	pushl  (%eax)
  1014af:	e8 d0 fd ff ff       	call   101284 <i2A>
  1014b4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1014b7:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  1014bd:	8a 11                	mov    (%ecx),%dl
  1014bf:	83 c4 08             	add    $0x8,%esp
  1014c2:	31 c0                	xor    %eax,%eax
  1014c4:	84 d2                	test   %dl,%dl
  1014c6:	0f 84 60 ff ff ff    	je     10142c <printk+0x98>
  1014cc:	40                   	inc    %eax
  1014cd:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1014d1:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  1014d4:	84 d2                	test   %dl,%dl
  1014d6:	75 f4                	jne    1014cc <printk+0x138>
  1014d8:	01 c7                	add    %eax,%edi
  1014da:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1014dd:	e9 4f ff ff ff       	jmp    101431 <printk+0x9d>
  1014e2:	66 90                	xchg   %ax,%ax
  1014e4:	80 fa 63             	cmp    $0x63,%dl
  1014e7:	0f 85 cb fe ff ff    	jne    1013b8 <printk+0x24>
  1014ed:	8b 10                	mov    (%eax),%edx
  1014ef:	88 97 80 21 10 00    	mov    %dl,0x102180(%edi)
  1014f5:	83 c0 04             	add    $0x4,%eax
  1014f8:	47                   	inc    %edi
  1014f9:	e9 c1 fe ff ff       	jmp    1013bf <printk+0x2b>
  1014fe:	31 ff                	xor    %edi,%edi
  101500:	e9 36 ff ff ff       	jmp    10143b <printk+0xa7>
  101505:	66 90                	xchg   %ax,%ax
  101507:	90                   	nop

00101508 <abort>:
  101508:	55                   	push   %ebp
  101509:	89 e5                	mov    %esp,%ebp
  10150b:	57                   	push   %edi
  10150c:	56                   	push   %esi
  10150d:	53                   	push   %ebx
  10150e:	83 ec 1c             	sub    $0x1c,%esp
  101511:	8b 55 08             	mov    0x8(%ebp),%edx
  101514:	fa                   	cli    
  101515:	8a 02                	mov    (%edx),%al
  101517:	b9 32 20 10 00       	mov    $0x102032,%ecx
  10151c:	84 c0                	test   %al,%al
  10151e:	74 0b                	je     10152b <abort+0x23>
  101520:	41                   	inc    %ecx
  101521:	42                   	inc    %edx
  101522:	88 41 ff             	mov    %al,-0x1(%ecx)
  101525:	8a 02                	mov    (%edx),%al
  101527:	84 c0                	test   %al,%al
  101529:	75 f5                	jne    101520 <abort+0x18>
  10152b:	c6 01 3a             	movb   $0x3a,(%ecx)
  10152e:	bb 9d 29 10 00       	mov    $0x10299d,%ebx
  101533:	be 0a 00 00 00       	mov    $0xa,%esi
  101538:	bf 67 66 66 66       	mov    $0x66666667,%edi
  10153d:	4b                   	dec    %ebx
  10153e:	8b 45 0c             	mov    0xc(%ebp),%eax
  101541:	99                   	cltd   
  101542:	f7 fe                	idiv   %esi
  101544:	8d 42 30             	lea    0x30(%edx),%eax
  101547:	88 45 e7             	mov    %al,-0x19(%ebp)
  10154a:	88 03                	mov    %al,(%ebx)
  10154c:	89 f8                	mov    %edi,%eax
  10154e:	f7 6d 0c             	imull  0xc(%ebp)
  101551:	c1 fa 02             	sar    $0x2,%edx
  101554:	8b 45 0c             	mov    0xc(%ebp),%eax
  101557:	c1 f8 1f             	sar    $0x1f,%eax
  10155a:	29 c2                	sub    %eax,%edx
  10155c:	89 55 0c             	mov    %edx,0xc(%ebp)
  10155f:	75 dc                	jne    10153d <abort+0x35>
  101561:	41                   	inc    %ecx
  101562:	41                   	inc    %ecx
  101563:	43                   	inc    %ebx
  101564:	8a 45 e7             	mov    -0x19(%ebp),%al
  101567:	88 41 ff             	mov    %al,-0x1(%ecx)
  10156a:	8a 03                	mov    (%ebx),%al
  10156c:	88 45 e7             	mov    %al,-0x19(%ebp)
  10156f:	84 c0                	test   %al,%al
  101571:	75 ef                	jne    101562 <abort+0x5a>
  101573:	c6 01 0a             	movb   $0xa,(%ecx)
  101576:	0f be 05 20 20 10 00 	movsbl 0x102020,%eax
  10157d:	84 c0                	test   %al,%al
  10157f:	74 1b                	je     10159c <abort+0x94>
  101581:	bb 20 20 10 00       	mov    $0x102020,%ebx
  101586:	83 ec 0c             	sub    $0xc,%esp
  101589:	50                   	push   %eax
  10158a:	e8 ad f0 ff ff       	call   10063c <putChar>
  10158f:	43                   	inc    %ebx
  101590:	0f be 03             	movsbl (%ebx),%eax
  101593:	83 c4 10             	add    $0x10,%esp
  101596:	84 c0                	test   %al,%al
  101598:	75 ec                	jne    101586 <abort+0x7e>
  10159a:	66 90                	xchg   %ax,%ax
  10159c:	f4                   	hlt    
  10159d:	eb fd                	jmp    10159c <abort+0x94>

0010159f <irqEmpty>:
  10159f:	6a 00                	push   $0x0
  1015a1:	6a ff                	push   $0xffffffff
  1015a3:	eb 13                	jmp    1015b8 <asmDoIrq>

001015a5 <irqGProtectFault>:
  1015a5:	6a 0d                	push   $0xd
  1015a7:	eb 0f                	jmp    1015b8 <asmDoIrq>

001015a9 <irqSyscall>:
  1015a9:	6a 00                	push   $0x0
  1015ab:	68 80 00 00 00       	push   $0x80
  1015b0:	eb 06                	jmp    1015b8 <asmDoIrq>

001015b2 <irqTime>:
  1015b2:	6a 00                	push   $0x0
  1015b4:	6a 20                	push   $0x20
  1015b6:	eb 00                	jmp    1015b8 <asmDoIrq>

001015b8 <asmDoIrq>:
  1015b8:	60                   	pusha  
  1015b9:	54                   	push   %esp
  1015ba:	e8 cd fb ff ff       	call   10118c <irqHandle>
  1015bf:	5c                   	pop    %esp
  1015c0:	61                   	popa   
  1015c1:	83 c4 04             	add    $0x4,%esp
  1015c4:	83 c4 04             	add    $0x4,%esp
  1015c7:	cf                   	iret   
