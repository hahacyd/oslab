
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 c5 11 00 00       	call   1011d0 <initTimer>
  10000b:	e8 20 0e 00 00       	call   100e30 <init_pcb>
  100010:	e8 57 0e 00 00       	call   100e6c <init_kernel_pcb>
  100015:	e8 da 05 00 00       	call   1005f4 <initSerial>
  10001a:	e8 f9 0e 00 00       	call   100f18 <initIdt>
  10001f:	e8 54 11 00 00       	call   101178 <initIntr>
  100024:	e8 cf 00 00 00       	call   1000f8 <initSeg>
  100029:	fb                   	sti    
  10002a:	e8 d5 02 00 00       	call   100304 <loadUMain>
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
  1001ed:	a1 2c 15 10 00       	mov    0x10152c,%eax
  1001f2:	8b 15 30 15 10 00    	mov    0x101530,%edx
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
  1002e5:	a1 f8 49 10 00       	mov    0x1049f8,%eax
  1002ea:	50                   	push   %eax
  1002eb:	a1 f4 49 10 00       	mov    0x1049f4,%eax
  1002f0:	50                   	push   %eax
  1002f1:	9c                   	pushf  
  1002f2:	a1 ec 49 10 00       	mov    0x1049ec,%eax
  1002f7:	50                   	push   %eax
  1002f8:	a1 e8 49 10 00       	mov    0x1049e8,%eax
  1002fd:	50                   	push   %eax
  1002fe:	cf                   	iret   
  1002ff:	83 c4 10             	add    $0x10,%esp
  100302:	c9                   	leave  
  100303:	c3                   	ret    

00100304 <loadUMain>:
  100304:	55                   	push   %ebp
  100305:	89 e5                	mov    %esp,%ebp
  100307:	57                   	push   %edi
  100308:	56                   	push   %esi
  100309:	53                   	push   %ebx
  10030a:	83 ec 0c             	sub    $0xc,%esp
  10030d:	bb c9 00 00 00       	mov    $0xc9,%ebx
  100312:	be 00 00 00 03       	mov    $0x3000000,%esi
  100317:	90                   	nop
  100318:	53                   	push   %ebx
  100319:	56                   	push   %esi
  10031a:	e8 61 fd ff ff       	call   100080 <readSect>
  10031f:	81 c6 00 02 00 00    	add    $0x200,%esi
  100325:	43                   	inc    %ebx
  100326:	58                   	pop    %eax
  100327:	5a                   	pop    %edx
  100328:	81 fb 91 01 00 00    	cmp    $0x191,%ebx
  10032e:	75 e8                	jne    100318 <loadUMain+0x14>
  100330:	a1 1c 00 00 03       	mov    0x300001c,%eax
  100335:	8d 90 00 00 00 03    	lea    0x3000000(%eax),%edx
  10033b:	0f b7 35 2c 00 00 03 	movzwl 0x300002c,%esi
  100342:	c1 e6 05             	shl    $0x5,%esi
  100345:	01 d6                	add    %edx,%esi
  100347:	39 f2                	cmp    %esi,%edx
  100349:	72 0c                	jb     100357 <loadUMain+0x53>
  10034b:	eb 53                	jmp    1003a0 <loadUMain+0x9c>
  10034d:	8d 76 00             	lea    0x0(%esi),%esi
  100350:	83 c2 20             	add    $0x20,%edx
  100353:	39 d6                	cmp    %edx,%esi
  100355:	76 49                	jbe    1003a0 <loadUMain+0x9c>
  100357:	83 3a 01             	cmpl   $0x1,(%edx)
  10035a:	75 f4                	jne    100350 <loadUMain+0x4c>
  10035c:	8b 42 08             	mov    0x8(%edx),%eax
  10035f:	8b 7a 10             	mov    0x10(%edx),%edi
  100362:	8b 5a 04             	mov    0x4(%edx),%ebx
  100365:	29 c3                	sub    %eax,%ebx
  100367:	31 c9                	xor    %ecx,%ecx
  100369:	85 ff                	test   %edi,%edi
  10036b:	74 16                	je     100383 <loadUMain+0x7f>
  10036d:	8d 76 00             	lea    0x0(%esi),%esi
  100370:	8a 8c 03 00 00 00 03 	mov    0x3000000(%ebx,%eax,1),%cl
  100377:	88 08                	mov    %cl,(%eax)
  100379:	40                   	inc    %eax
  10037a:	89 c1                	mov    %eax,%ecx
  10037c:	2b 4a 08             	sub    0x8(%edx),%ecx
  10037f:	39 cf                	cmp    %ecx,%edi
  100381:	77 ed                	ja     100370 <loadUMain+0x6c>
  100383:	8b 5a 14             	mov    0x14(%edx),%ebx
  100386:	39 cb                	cmp    %ecx,%ebx
  100388:	76 c6                	jbe    100350 <loadUMain+0x4c>
  10038a:	66 90                	xchg   %ax,%ax
  10038c:	c6 00 00             	movb   $0x0,(%eax)
  10038f:	40                   	inc    %eax
  100390:	89 c1                	mov    %eax,%ecx
  100392:	2b 4a 08             	sub    0x8(%edx),%ecx
  100395:	39 cb                	cmp    %ecx,%ebx
  100397:	77 f3                	ja     10038c <loadUMain+0x88>
  100399:	83 c2 20             	add    $0x20,%edx
  10039c:	39 d6                	cmp    %edx,%esi
  10039e:	77 b7                	ja     100357 <loadUMain+0x53>
  1003a0:	83 ec 0c             	sub    $0xc,%esp
  1003a3:	ff 35 18 00 00 03    	pushl  0x3000018
  1003a9:	e8 ee fe ff ff       	call   10029c <enterUserSpace>
  1003ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1003b1:	5b                   	pop    %ebx
  1003b2:	5e                   	pop    %esi
  1003b3:	5f                   	pop    %edi
  1003b4:	5d                   	pop    %ebp
  1003b5:	c3                   	ret    
  1003b6:	66 90                	xchg   %ax,%ax

001003b8 <sys_exit>:
  1003b8:	55                   	push   %ebp
  1003b9:	89 e5                	mov    %esp,%ebp
  1003bb:	83 ec 08             	sub    $0x8,%esp
  1003be:	e8 e1 03 00 00       	call   1007a4 <get_from_runnable>
  1003c3:	83 ec 08             	sub    $0x8,%esp
  1003c6:	ff 75 08             	pushl  0x8(%ebp)
  1003c9:	50                   	push   %eax
  1003ca:	e8 89 02 00 00       	call   100658 <put_into_running>
  1003cf:	b8 01 00 00 00       	mov    $0x1,%eax
  1003d4:	c9                   	leave  
  1003d5:	c3                   	ret    
  1003d6:	66 90                	xchg   %ax,%ax

001003d8 <sys_sleep>:
  1003d8:	55                   	push   %ebp
  1003d9:	89 e5                	mov    %esp,%ebp
  1003db:	56                   	push   %esi
  1003dc:	53                   	push   %ebx
  1003dd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1003e0:	e8 8f 03 00 00       	call   100774 <getpid>
  1003e5:	83 ec 08             	sub    $0x8,%esp
  1003e8:	53                   	push   %ebx
  1003e9:	50                   	push   %eax
  1003ea:	e8 a9 05 00 00       	call   100998 <put_into_block>
  1003ef:	c7 04 24 34 15 10 00 	movl   $0x101534,(%esp)
  1003f6:	e8 fd 0e 00 00       	call   1012f8 <printk>
  1003fb:	e8 74 03 00 00       	call   100774 <getpid>
  100400:	89 c2                	mov    %eax,%edx
  100402:	c1 e2 07             	shl    $0x7,%edx
  100405:	01 c2                	add    %eax,%edx
  100407:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10040a:	01 d2                	add    %edx,%edx
  10040c:	01 d0                	add    %edx,%eax
  10040e:	8b 34 c5 04 4a 10 00 	mov    0x104a04(,%eax,8),%esi
  100415:	e8 5a 03 00 00       	call   100774 <getpid>
  10041a:	5a                   	pop    %edx
  10041b:	59                   	pop    %ecx
  10041c:	56                   	push   %esi
  10041d:	50                   	push   %eax
  10041e:	68 80 15 10 00       	push   $0x101580
  100423:	6a 09                	push   $0x9
  100425:	68 3a 15 10 00       	push   $0x10153a
  10042a:	68 5c 15 10 00       	push   $0x10155c
  10042f:	e8 c4 0e 00 00       	call   1012f8 <printk>
  100434:	83 c4 14             	add    $0x14,%esp
  100437:	68 56 15 10 00       	push   $0x101556
  10043c:	e8 b7 0e 00 00       	call   1012f8 <printk>
  100441:	e8 5e 03 00 00       	call   1007a4 <get_from_runnable>
  100446:	5e                   	pop    %esi
  100447:	5a                   	pop    %edx
  100448:	53                   	push   %ebx
  100449:	50                   	push   %eax
  10044a:	e8 09 02 00 00       	call   100658 <put_into_running>
  10044f:	b8 01 00 00 00       	mov    $0x1,%eax
  100454:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100457:	5b                   	pop    %ebx
  100458:	5e                   	pop    %esi
  100459:	5d                   	pop    %ebp
  10045a:	c3                   	ret    
  10045b:	90                   	nop

0010045c <sys_fork>:
  10045c:	55                   	push   %ebp
  10045d:	89 e5                	mov    %esp,%ebp
  10045f:	57                   	push   %edi
  100460:	56                   	push   %esi
  100461:	8b 75 08             	mov    0x8(%ebp),%esi
  100464:	83 ec 0c             	sub    $0xc,%esp
  100467:	68 8a 15 10 00       	push   $0x10158a
  10046c:	e8 87 0e 00 00       	call   1012f8 <printk>
  100471:	b8 70 8a 10 00       	mov    $0x108a70,%eax
  100476:	b9 0f 00 00 00       	mov    $0xf,%ecx
  10047b:	89 c7                	mov    %eax,%edi
  10047d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10047f:	c7 05 8c 8a 10 00 00 	movl   $0x0,0x108a8c
  100486:	00 00 00 
  100489:	c7 05 a4 8a 10 00 00 	movl   $0x7e00000,0x108aa4
  100490:	00 e0 07 
  100493:	5a                   	pop    %edx
  100494:	59                   	pop    %ecx
  100495:	50                   	push   %eax
  100496:	6a 02                	push   $0x2
  100498:	e8 cb 03 00 00       	call   100868 <put_into_runnable>
  10049d:	b8 02 00 00 00       	mov    $0x2,%eax
  1004a2:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1004a5:	5e                   	pop    %esi
  1004a6:	5f                   	pop    %edi
  1004a7:	5d                   	pop    %ebp
  1004a8:	c3                   	ret    
  1004a9:	66 90                	xchg   %ax,%ax
  1004ab:	90                   	nop

001004ac <display>:
  1004ac:	55                   	push   %ebp
  1004ad:	89 e5                	mov    %esp,%ebp
  1004af:	57                   	push   %edi
  1004b0:	53                   	push   %ebx
  1004b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1004b4:	80 fb 0a             	cmp    $0xa,%bl
  1004b7:	74 5b                	je     100514 <display+0x68>
  1004b9:	8b 15 28 21 10 00    	mov    0x102128,%edx
  1004bf:	8b 0d 2c 21 10 00    	mov    0x10212c,%ecx
  1004c5:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  1004c8:	c1 e0 04             	shl    $0x4,%eax
  1004cb:	01 d0                	add    %edx,%eax
  1004cd:	01 c0                	add    %eax,%eax
  1004cf:	89 c7                	mov    %eax,%edi
  1004d1:	0f be db             	movsbl %bl,%ebx
  1004d4:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
  1004da:	66 89 d8             	mov    %bx,%ax
  1004dd:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1004e1:	42                   	inc    %edx
  1004e2:	83 fa 50             	cmp    $0x50,%edx
  1004e5:	75 1d                	jne    100504 <display+0x58>
  1004e7:	c7 05 28 21 10 00 00 	movl   $0x0,0x102128
  1004ee:	00 00 00 
  1004f1:	41                   	inc    %ecx
  1004f2:	89 0d 2c 21 10 00    	mov    %ecx,0x10212c
  1004f8:	b8 01 00 00 00       	mov    $0x1,%eax
  1004fd:	5b                   	pop    %ebx
  1004fe:	5f                   	pop    %edi
  1004ff:	5d                   	pop    %ebp
  100500:	c3                   	ret    
  100501:	8d 76 00             	lea    0x0(%esi),%esi
  100504:	89 15 28 21 10 00    	mov    %edx,0x102128
  10050a:	b8 01 00 00 00       	mov    $0x1,%eax
  10050f:	5b                   	pop    %ebx
  100510:	5f                   	pop    %edi
  100511:	5d                   	pop    %ebp
  100512:	c3                   	ret    
  100513:	90                   	nop
  100514:	c7 05 28 21 10 00 00 	movl   $0x0,0x102128
  10051b:	00 00 00 
  10051e:	ff 05 2c 21 10 00    	incl   0x10212c
  100524:	b8 01 00 00 00       	mov    $0x1,%eax
  100529:	5b                   	pop    %ebx
  10052a:	5f                   	pop    %edi
  10052b:	5d                   	pop    %ebp
  10052c:	c3                   	ret    
  10052d:	8d 76 00             	lea    0x0(%esi),%esi

00100530 <printkernel>:
  100530:	55                   	push   %ebp
  100531:	89 e5                	mov    %esp,%ebp
  100533:	53                   	push   %ebx
  100534:	50                   	push   %eax
  100535:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100538:	0f be 03             	movsbl (%ebx),%eax
  10053b:	84 c0                	test   %al,%al
  10053d:	74 20                	je     10055f <printkernel+0x2f>
  10053f:	90                   	nop
  100540:	83 ec 0c             	sub    $0xc,%esp
  100543:	50                   	push   %eax
  100544:	e8 eb 00 00 00       	call   100634 <putChar>
  100549:	0f be 03             	movsbl (%ebx),%eax
  10054c:	89 04 24             	mov    %eax,(%esp)
  10054f:	e8 58 ff ff ff       	call   1004ac <display>
  100554:	43                   	inc    %ebx
  100555:	0f be 03             	movsbl (%ebx),%eax
  100558:	83 c4 10             	add    $0x10,%esp
  10055b:	84 c0                	test   %al,%al
  10055d:	75 e1                	jne    100540 <printkernel+0x10>
  10055f:	b8 01 00 00 00       	mov    $0x1,%eax
  100564:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100567:	c9                   	leave  
  100568:	c3                   	ret    
  100569:	8d 76 00             	lea    0x0(%esi),%esi

0010056c <fs_write>:
  10056c:	55                   	push   %ebp
  10056d:	89 e5                	mov    %esp,%ebp
  10056f:	53                   	push   %ebx
  100570:	50                   	push   %eax
  100571:	8b 5d 10             	mov    0x10(%ebp),%ebx
  100574:	ba 30 00 00 00       	mov    $0x30,%edx
  100579:	89 d0                	mov    %edx,%eax
  10057b:	8e e8                	mov    %eax,%gs
  10057d:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  100581:	74 12                	je     100595 <fs_write+0x29>
  100583:	83 ec 08             	sub    $0x8,%esp
  100586:	6a 27                	push   $0x27
  100588:	68 a6 15 10 00       	push   $0x1015a6
  10058d:	e8 da 0e 00 00       	call   10146c <abort>
  100592:	83 c4 10             	add    $0x10,%esp
  100595:	83 ec 08             	sub    $0x8,%esp
  100598:	53                   	push   %ebx
  100599:	ff 75 0c             	pushl  0xc(%ebp)
  10059c:	e8 8f ff ff ff       	call   100530 <printkernel>
  1005a1:	89 d8                	mov    %ebx,%eax
  1005a3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005a6:	c9                   	leave  
  1005a7:	c3                   	ret    

001005a8 <sys_write>:
  1005a8:	55                   	push   %ebp
  1005a9:	89 e5                	mov    %esp,%ebp
  1005ab:	53                   	push   %ebx
  1005ac:	83 ec 08             	sub    $0x8,%esp
  1005af:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1005b2:	ff 73 14             	pushl  0x14(%ebx)
  1005b5:	ff 73 18             	pushl  0x18(%ebx)
  1005b8:	ff 73 10             	pushl  0x10(%ebx)
  1005bb:	e8 ac ff ff ff       	call   10056c <fs_write>
  1005c0:	89 43 1c             	mov    %eax,0x1c(%ebx)
  1005c3:	83 c4 10             	add    $0x10,%esp
  1005c6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005c9:	c9                   	leave  
  1005ca:	c3                   	ret    
  1005cb:	90                   	nop

001005cc <print_char>:
  1005cc:	55                   	push   %ebp
  1005cd:	89 e5                	mov    %esp,%ebp
  1005cf:	57                   	push   %edi
  1005d0:	8b 45 08             	mov    0x8(%ebp),%eax
  1005d3:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1005d6:	c1 e0 04             	shl    $0x4,%eax
  1005d9:	03 45 0c             	add    0xc(%ebp),%eax
  1005dc:	01 c0                	add    %eax,%eax
  1005de:	89 c7                	mov    %eax,%edi
  1005e0:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  1005e4:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  1005ea:	66 89 d0             	mov    %dx,%ax
  1005ed:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1005f1:	5f                   	pop    %edi
  1005f2:	5d                   	pop    %ebp
  1005f3:	c3                   	ret    

001005f4 <initSerial>:
  1005f4:	55                   	push   %ebp
  1005f5:	89 e5                	mov    %esp,%ebp
  1005f7:	ba f9 03 00 00       	mov    $0x3f9,%edx
  1005fc:	31 c0                	xor    %eax,%eax
  1005fe:	ee                   	out    %al,(%dx)
  1005ff:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100604:	b0 80                	mov    $0x80,%al
  100606:	ee                   	out    %al,(%dx)
  100607:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10060c:	b0 01                	mov    $0x1,%al
  10060e:	ee                   	out    %al,(%dx)
  10060f:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100614:	31 c0                	xor    %eax,%eax
  100616:	ee                   	out    %al,(%dx)
  100617:	ba fb 03 00 00       	mov    $0x3fb,%edx
  10061c:	b0 03                	mov    $0x3,%al
  10061e:	ee                   	out    %al,(%dx)
  10061f:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100624:	b0 c7                	mov    $0xc7,%al
  100626:	ee                   	out    %al,(%dx)
  100627:	ba fc 03 00 00       	mov    $0x3fc,%edx
  10062c:	b0 0b                	mov    $0xb,%al
  10062e:	ee                   	out    %al,(%dx)
  10062f:	5d                   	pop    %ebp
  100630:	c3                   	ret    
  100631:	8d 76 00             	lea    0x0(%esi),%esi

00100634 <putChar>:
  100634:	55                   	push   %ebp
  100635:	89 e5                	mov    %esp,%ebp
  100637:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10063a:	ba fd 03 00 00       	mov    $0x3fd,%edx
  10063f:	90                   	nop
  100640:	ec                   	in     (%dx),%al
  100641:	a8 20                	test   $0x20,%al
  100643:	74 fb                	je     100640 <putChar+0xc>
  100645:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10064a:	88 c8                	mov    %cl,%al
  10064c:	ee                   	out    %al,(%dx)
  10064d:	5d                   	pop    %ebp
  10064e:	c3                   	ret    
  10064f:	90                   	nop

00100650 <IDLE>:
  100650:	55                   	push   %ebp
  100651:	89 e5                	mov    %esp,%ebp
  100653:	90                   	nop
  100654:	f4                   	hlt    
  100655:	eb fd                	jmp    100654 <IDLE+0x4>
  100657:	90                   	nop

00100658 <put_into_running>:
  100658:	55                   	push   %ebp
  100659:	89 e5                	mov    %esp,%ebp
  10065b:	57                   	push   %edi
  10065c:	56                   	push   %esi
  10065d:	53                   	push   %ebx
  10065e:	81 ec dc 00 00 00    	sub    $0xdc,%esp
  100664:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100667:	39 1d a0 29 10 00    	cmp    %ebx,0x1029a0
  10066d:	0f 84 97 00 00 00    	je     10070a <put_into_running+0xb2>
  100673:	89 1d a0 29 10 00    	mov    %ebx,0x1029a0
  100679:	89 d8                	mov    %ebx,%eax
  10067b:	c1 e0 07             	shl    $0x7,%eax
  10067e:	01 d8                	add    %ebx,%eax
  100680:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100683:	01 c0                	add    %eax,%eax
  100685:	01 d8                	add    %ebx,%eax
  100687:	c1 e0 03             	shl    $0x3,%eax
  10068a:	8d b0 c0 49 10 00    	lea    0x1049c0(%eax),%esi
  100690:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100695:	8b 7d 0c             	mov    0xc(%ebp),%edi
  100698:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10069a:	85 db                	test   %ebx,%ebx
  10069c:	74 7a                	je     100718 <put_into_running+0xc0>
  10069e:	8d b0 bc 49 10 00    	lea    0x1049bc(%eax),%esi
  1006a4:	83 ec 08             	sub    $0x8,%esp
  1006a7:	56                   	push   %esi
  1006a8:	6a 10                	push   $0x10
  1006aa:	e8 85 f9 ff ff       	call   100034 <change_tss>
  1006af:	8d 45 84             	lea    -0x7c(%ebp),%eax
  1006b2:	89 04 24             	mov    %eax,(%esp)
  1006b5:	e8 96 f9 ff ff       	call   100050 <get_tss>
  1006ba:	83 c4 0c             	add    $0xc,%esp
  1006bd:	3b 75 88             	cmp    -0x78(%ebp),%esi
  1006c0:	74 12                	je     1006d4 <put_into_running+0x7c>
  1006c2:	83 ec 08             	sub    $0x8,%esp
  1006c5:	6a 1e                	push   $0x1e
  1006c7:	68 c2 15 10 00       	push   $0x1015c2
  1006cc:	e8 9b 0d 00 00       	call   10146c <abort>
  1006d1:	83 c4 10             	add    $0x10,%esp
  1006d4:	83 ec 0c             	sub    $0xc,%esp
  1006d7:	68 34 15 10 00       	push   $0x101534
  1006dc:	e8 17 0c 00 00       	call   1012f8 <printk>
  1006e1:	89 1c 24             	mov    %ebx,(%esp)
  1006e4:	68 c4 16 10 00       	push   $0x1016c4
  1006e9:	6a 21                	push   $0x21
  1006eb:	68 c2 15 10 00       	push   $0x1015c2
  1006f0:	68 d0 15 10 00       	push   $0x1015d0
  1006f5:	e8 fe 0b 00 00       	call   1012f8 <printk>
  1006fa:	83 c4 14             	add    $0x14,%esp
  1006fd:	68 56 15 10 00       	push   $0x101556
  100702:	e8 f1 0b 00 00       	call   1012f8 <printk>
  100707:	83 c4 10             	add    $0x10,%esp
  10070a:	b8 01 00 00 00       	mov    $0x1,%eax
  10070f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100712:	5b                   	pop    %ebx
  100713:	5e                   	pop    %esi
  100714:	5f                   	pop    %edi
  100715:	5d                   	pop    %ebp
  100716:	c3                   	ret    
  100717:	90                   	nop
  100718:	83 ec 08             	sub    $0x8,%esp
  10071b:	68 bc 49 10 00       	push   $0x1049bc
  100720:	6a 10                	push   $0x10
  100722:	e8 0d f9 ff ff       	call   100034 <change_tss>
  100727:	8d 85 20 ff ff ff    	lea    -0xe0(%ebp),%eax
  10072d:	89 04 24             	mov    %eax,(%esp)
  100730:	e8 1b f9 ff ff       	call   100050 <get_tss>
  100735:	83 c4 0c             	add    $0xc,%esp
  100738:	81 bd 24 ff ff ff bc 	cmpl   $0x1049bc,-0xdc(%ebp)
  10073f:	49 10 00 
  100742:	74 90                	je     1006d4 <put_into_running+0x7c>
  100744:	83 ec 08             	sub    $0x8,%esp
  100747:	6a 19                	push   $0x19
  100749:	68 c2 15 10 00       	push   $0x1015c2
  10074e:	e8 19 0d 00 00       	call   10146c <abort>
  100753:	83 c4 10             	add    $0x10,%esp
  100756:	e9 79 ff ff ff       	jmp    1006d4 <put_into_running+0x7c>
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
  10080f:	68 34 15 10 00       	push   $0x101534
  100814:	e8 df 0a 00 00       	call   1012f8 <printk>
  100819:	58                   	pop    %eax
  10081a:	5a                   	pop    %edx
  10081b:	ff 35 04 20 10 00    	pushl  0x102004
  100821:	53                   	push   %ebx
  100822:	68 a0 16 10 00       	push   $0x1016a0
  100827:	68 80 00 00 00       	push   $0x80
  10082c:	68 c2 15 10 00       	push   $0x1015c2
  100831:	68 08 16 10 00       	push   $0x101608
  100836:	e8 bd 0a 00 00       	call   1012f8 <printk>
  10083b:	83 c4 14             	add    $0x14,%esp
  10083e:	68 56 15 10 00       	push   $0x101556
  100843:	e8 b0 0a 00 00       	call   1012f8 <printk>
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
  1008f2:	c7 05 e8 49 10 00 50 	movl   $0x100650,0x1049e8
  1008f9:	06 10 00 
  1008fc:	83 ec 0c             	sub    $0xc,%esp
  1008ff:	68 34 15 10 00       	push   $0x101534
  100904:	e8 ef 09 00 00       	call   1012f8 <printk>
  100909:	58                   	pop    %eax
  10090a:	5a                   	pop    %edx
  10090b:	53                   	push   %ebx
  10090c:	ff 35 04 20 10 00    	pushl  0x102004
  100912:	68 8c 16 10 00       	push   $0x10168c
  100917:	68 9e 00 00 00       	push   $0x9e
  10091c:	68 c2 15 10 00       	push   $0x1015c2
  100921:	68 3c 16 10 00       	push   $0x10163c
  100926:	e8 cd 09 00 00       	call   1012f8 <printk>
  10092b:	83 c4 14             	add    $0x14,%esp
  10092e:	68 56 15 10 00       	push   $0x101556
  100933:	e8 c0 09 00 00       	call   1012f8 <printk>
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
  100af9:	68 e0 00 00 00       	push   $0xe0
  100afe:	68 c2 15 10 00       	push   $0x1015c2
  100b03:	e8 64 09 00 00       	call   10146c <abort>
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
  100b6f:	68 dc 00 00 00       	push   $0xdc
  100b74:	68 c2 15 10 00       	push   $0x1015c2
  100b79:	e8 ee 08 00 00       	call   10146c <abort>
  100b7e:	a1 00 00 00 00       	mov    0x0,%eax
  100b83:	0f 0b                	ud2    
  100b85:	8d 76 00             	lea    0x0(%esi),%esi
  100b88:	83 ec 08             	sub    $0x8,%esp
  100b8b:	68 cd 00 00 00       	push   $0xcd
  100b90:	68 c2 15 10 00       	push   $0x1015c2
  100b95:	e8 d2 08 00 00       	call   10146c <abort>
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
  100bef:	68 17 01 00 00       	push   $0x117
  100bf4:	68 c2 15 10 00       	push   $0x1015c2
  100bf9:	e8 6e 08 00 00       	call   10146c <abort>
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
  100c95:	68 34 15 10 00       	push   $0x101534
  100c9a:	e8 59 06 00 00       	call   1012f8 <printk>
  100c9f:	5e                   	pop    %esi
  100ca0:	ff 35 a0 29 10 00    	pushl  0x1029a0
  100ca6:	68 b4 16 10 00       	push   $0x1016b4
  100cab:	6a 2e                	push   $0x2e
  100cad:	68 c2 15 10 00       	push   $0x1015c2
  100cb2:	68 ee 15 10 00       	push   $0x1015ee
  100cb7:	e8 3c 06 00 00       	call   1012f8 <printk>
  100cbc:	83 c4 14             	add    $0x14,%esp
  100cbf:	68 56 15 10 00       	push   $0x101556
  100cc4:	e8 2f 06 00 00       	call   1012f8 <printk>
  100cc9:	c7 04 24 34 15 10 00 	movl   $0x101534,(%esp)
  100cd0:	e8 23 06 00 00       	call   1012f8 <printk>
  100cd5:	5f                   	pop    %edi
  100cd6:	a1 a0 29 10 00       	mov    0x1029a0,%eax
  100cdb:	89 c2                	mov    %eax,%edx
  100cdd:	c1 e2 07             	shl    $0x7,%edx
  100ce0:	01 c2                	add    %eax,%edx
  100ce2:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100ce5:	01 d2                	add    %edx,%edx
  100ce7:	01 d0                	add    %edx,%eax
  100ce9:	ff 34 c5 00 4a 10 00 	pushl  0x104a00(,%eax,8)
  100cf0:	68 b4 16 10 00       	push   $0x1016b4
  100cf5:	6a 2f                	push   $0x2f
  100cf7:	68 c2 15 10 00       	push   $0x1015c2
  100cfc:	68 6c 16 10 00       	push   $0x10166c
  100d01:	e8 f2 05 00 00       	call   1012f8 <printk>
  100d06:	83 c4 14             	add    $0x14,%esp
  100d09:	68 56 15 10 00       	push   $0x101556
  100d0e:	e8 e5 05 00 00       	call   1012f8 <printk>
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
  100d70:	e8 e3 f8 ff ff       	call   100658 <put_into_running>
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
  100e83:	c7 05 e8 49 10 00 50 	movl   $0x100650,0x1049e8
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
  100f1c:	ba 03 15 10 00       	mov    $0x101503,%edx
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
  100f4c:	b8 09 15 10 00       	mov    $0x101509,%eax
  100f51:	66 a3 e8 ea 12 01    	mov    %ax,0x112eae8
  100f57:	66 c7 05 ea ea 12 01 	movw   $0x8,0x112eaea
  100f5e:	08 00 
  100f60:	c6 05 ec ea 12 01 00 	movb   $0x0,0x112eaec
  100f67:	c6 05 ed ea 12 01 8f 	movb   $0x8f,0x112eaed
  100f6e:	c1 e8 10             	shr    $0x10,%eax
  100f71:	66 a3 ee ea 12 01    	mov    %ax,0x112eaee
  100f77:	b8 0d 15 10 00       	mov    $0x10150d,%eax
  100f7c:	66 a3 80 ee 12 01    	mov    %ax,0x112ee80
  100f82:	66 c7 05 82 ee 12 01 	movw   $0x8,0x112ee82
  100f89:	08 00 
  100f8b:	c6 05 84 ee 12 01 00 	movb   $0x0,0x112ee84
  100f92:	c6 05 85 ee 12 01 ee 	movb   $0xee,0x112ee85
  100f99:	c1 e8 10             	shr    $0x10,%eax
  100f9c:	66 a3 86 ee 12 01    	mov    %ax,0x112ee86
  100fa2:	b8 16 15 10 00       	mov    $0x101516,%eax
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
  10101d:	e9 b6 f3 ff ff       	jmp    1003d8 <sys_sleep>
  101022:	66 90                	xchg   %ax,%ax
  101024:	89 5d 08             	mov    %ebx,0x8(%ebp)
  101027:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10102a:	c9                   	leave  
  10102b:	e9 78 f5 ff ff       	jmp    1005a8 <sys_write>
  101030:	83 ec 0c             	sub    $0xc,%esp
  101033:	53                   	push   %ebx
  101034:	e8 23 f4 ff ff       	call   10045c <sys_fork>
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
  10104e:	e9 65 f3 ff ff       	jmp    1003b8 <sys_exit>
  101053:	90                   	nop

00101054 <GProtectFaultHandle>:
  101054:	55                   	push   %ebp
  101055:	89 e5                	mov    %esp,%ebp
  101057:	83 ec 14             	sub    $0x14,%esp
  10105a:	68 34 15 10 00       	push   $0x101534
  10105f:	e8 94 02 00 00       	call   1012f8 <printk>
  101064:	58                   	pop    %eax
  101065:	8b 45 08             	mov    0x8(%ebp),%eax
  101068:	ff 70 20             	pushl  0x20(%eax)
  10106b:	68 00 17 10 00       	push   $0x101700
  101070:	6a 56                	push   $0x56
  101072:	68 d5 16 10 00       	push   $0x1016d5
  101077:	68 e8 16 10 00       	push   $0x1016e8
  10107c:	e8 77 02 00 00       	call   1012f8 <printk>
  101081:	83 c4 14             	add    $0x14,%esp
  101084:	68 56 15 10 00       	push   $0x101556
  101089:	e8 6a 02 00 00       	call   1012f8 <printk>
  10108e:	5a                   	pop    %edx
  10108f:	59                   	pop    %ecx
  101090:	6a 57                	push   $0x57
  101092:	68 d5 16 10 00       	push   $0x1016d5
  101097:	e8 d0 03 00 00       	call   10146c <abort>
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
  1010b0:	e8 7f f5 ff ff       	call   100634 <putChar>
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
  1010ea:	e9 45 f5 ff ff       	jmp    100634 <putChar>
  1010ef:	90                   	nop

001010f0 <irqHandle>:
  1010f0:	55                   	push   %ebp
  1010f1:	89 e5                	mov    %esp,%ebp
  1010f3:	53                   	push   %ebx
  1010f4:	83 ec 14             	sub    $0x14,%esp
  1010f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1010fa:	89 6d f4             	mov    %ebp,-0xc(%ebp)
  1010fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101100:	3b 58 08             	cmp    0x8(%eax),%ebx
  101103:	74 12                	je     101117 <irqHandle+0x27>
  101105:	83 ec 08             	sub    $0x8,%esp
  101108:	6a 1b                	push   $0x1b
  10110a:	68 d5 16 10 00       	push   $0x1016d5
  10110f:	e8 58 03 00 00       	call   10146c <abort>
  101114:	83 c4 10             	add    $0x10,%esp
  101117:	fa                   	cli    
  101118:	8b 43 20             	mov    0x20(%ebx),%eax
  10111b:	83 f8 0d             	cmp    $0xd,%eax
  10111e:	74 48                	je     101168 <irqHandle+0x78>
  101120:	7e 2e                	jle    101150 <irqHandle+0x60>
  101122:	83 f8 20             	cmp    $0x20,%eax
  101125:	74 19                	je     101140 <irqHandle+0x50>
  101127:	83 c0 80             	add    $0xffffff80,%eax
  10112a:	75 27                	jne    101153 <irqHandle+0x63>
  10112c:	83 ec 0c             	sub    $0xc,%esp
  10112f:	53                   	push   %ebx
  101130:	e8 c3 fe ff ff       	call   100ff8 <syscallHandle>
  101135:	83 c4 10             	add    $0x10,%esp
  101138:	fb                   	sti    
  101139:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10113c:	c9                   	leave  
  10113d:	c3                   	ret    
  10113e:	66 90                	xchg   %ax,%ax
  101140:	83 ec 0c             	sub    $0xc,%esp
  101143:	53                   	push   %ebx
  101144:	e8 5b ff ff ff       	call   1010a4 <timeHandle>
  101149:	83 c4 10             	add    $0x10,%esp
  10114c:	eb ea                	jmp    101138 <irqHandle+0x48>
  10114e:	66 90                	xchg   %ax,%ax
  101150:	40                   	inc    %eax
  101151:	74 e5                	je     101138 <irqHandle+0x48>
  101153:	83 ec 08             	sub    $0x8,%esp
  101156:	6a 2f                	push   $0x2f
  101158:	68 d5 16 10 00       	push   $0x1016d5
  10115d:	e8 0a 03 00 00       	call   10146c <abort>
  101162:	83 c4 10             	add    $0x10,%esp
  101165:	eb d1                	jmp    101138 <irqHandle+0x48>
  101167:	90                   	nop
  101168:	83 ec 0c             	sub    $0xc,%esp
  10116b:	53                   	push   %ebx
  10116c:	e8 e3 fe ff ff       	call   101054 <GProtectFaultHandle>
  101171:	83 c4 10             	add    $0x10,%esp
  101174:	eb c2                	jmp    101138 <irqHandle+0x48>
  101176:	66 90                	xchg   %ax,%ax

00101178 <initIntr>:
  101178:	55                   	push   %ebp
  101179:	89 e5                	mov    %esp,%ebp
  10117b:	ba 21 00 00 00       	mov    $0x21,%edx
  101180:	b0 ff                	mov    $0xff,%al
  101182:	ee                   	out    %al,(%dx)
  101183:	ba a1 00 00 00       	mov    $0xa1,%edx
  101188:	ee                   	out    %al,(%dx)
  101189:	ba 20 00 00 00       	mov    $0x20,%edx
  10118e:	b0 11                	mov    $0x11,%al
  101190:	ee                   	out    %al,(%dx)
  101191:	ba 21 00 00 00       	mov    $0x21,%edx
  101196:	b0 20                	mov    $0x20,%al
  101198:	ee                   	out    %al,(%dx)
  101199:	b0 04                	mov    $0x4,%al
  10119b:	ee                   	out    %al,(%dx)
  10119c:	b0 03                	mov    $0x3,%al
  10119e:	ee                   	out    %al,(%dx)
  10119f:	ba a0 00 00 00       	mov    $0xa0,%edx
  1011a4:	b0 11                	mov    $0x11,%al
  1011a6:	ee                   	out    %al,(%dx)
  1011a7:	ba a1 00 00 00       	mov    $0xa1,%edx
  1011ac:	b0 28                	mov    $0x28,%al
  1011ae:	ee                   	out    %al,(%dx)
  1011af:	b0 02                	mov    $0x2,%al
  1011b1:	ee                   	out    %al,(%dx)
  1011b2:	b0 03                	mov    $0x3,%al
  1011b4:	ee                   	out    %al,(%dx)
  1011b5:	ba 20 00 00 00       	mov    $0x20,%edx
  1011ba:	b0 68                	mov    $0x68,%al
  1011bc:	ee                   	out    %al,(%dx)
  1011bd:	b0 0a                	mov    $0xa,%al
  1011bf:	ee                   	out    %al,(%dx)
  1011c0:	ba a0 00 00 00       	mov    $0xa0,%edx
  1011c5:	b0 68                	mov    $0x68,%al
  1011c7:	ee                   	out    %al,(%dx)
  1011c8:	b0 0a                	mov    $0xa,%al
  1011ca:	ee                   	out    %al,(%dx)
  1011cb:	5d                   	pop    %ebp
  1011cc:	c3                   	ret    
  1011cd:	8d 76 00             	lea    0x0(%esi),%esi

001011d0 <initTimer>:
  1011d0:	55                   	push   %ebp
  1011d1:	89 e5                	mov    %esp,%ebp
  1011d3:	ba 43 00 00 00       	mov    $0x43,%edx
  1011d8:	b0 34                	mov    $0x34,%al
  1011da:	ee                   	out    %al,(%dx)
  1011db:	ba 40 00 00 00       	mov    $0x40,%edx
  1011e0:	b0 9b                	mov    $0x9b,%al
  1011e2:	ee                   	out    %al,(%dx)
  1011e3:	b0 2e                	mov    $0x2e,%al
  1011e5:	ee                   	out    %al,(%dx)
  1011e6:	5d                   	pop    %ebp
  1011e7:	c3                   	ret    

001011e8 <i2A>:
  1011e8:	55                   	push   %ebp
  1011e9:	89 e5                	mov    %esp,%ebp
  1011eb:	57                   	push   %edi
  1011ec:	56                   	push   %esi
  1011ed:	53                   	push   %ebx
  1011ee:	51                   	push   %ecx
  1011ef:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1011f2:	85 c9                	test   %ecx,%ecx
  1011f4:	78 6e                	js     101264 <i2A+0x7c>
  1011f6:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  1011fa:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  1011fe:	bb 7e 21 10 00       	mov    $0x10217e,%ebx
  101203:	31 ff                	xor    %edi,%edi
  101205:	eb 03                	jmp    10120a <i2A+0x22>
  101207:	90                   	nop
  101208:	89 f7                	mov    %esi,%edi
  10120a:	4b                   	dec    %ebx
  10120b:	89 c8                	mov    %ecx,%eax
  10120d:	be 0a 00 00 00       	mov    $0xa,%esi
  101212:	99                   	cltd   
  101213:	f7 fe                	idiv   %esi
  101215:	83 c2 30             	add    $0x30,%edx
  101218:	88 13                	mov    %dl,(%ebx)
  10121a:	8d 77 01             	lea    0x1(%edi),%esi
  10121d:	b8 67 66 66 66       	mov    $0x66666667,%eax
  101222:	f7 e9                	imul   %ecx
  101224:	89 d0                	mov    %edx,%eax
  101226:	c1 f8 02             	sar    $0x2,%eax
  101229:	c1 f9 1f             	sar    $0x1f,%ecx
  10122c:	29 c8                	sub    %ecx,%eax
  10122e:	89 c1                	mov    %eax,%ecx
  101230:	75 d6                	jne    101208 <i2A+0x20>
  101232:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  101236:	74 20                	je     101258 <i2A+0x70>
  101238:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  10123c:	75 06                	jne    101244 <i2A+0x5c>
  10123e:	fe 05 7d 21 10 00    	incb   0x10217d
  101244:	c6 05 7e 21 10 00 00 	movb   $0x0,0x10217e
  10124b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10124e:	89 18                	mov    %ebx,(%eax)
  101250:	89 f0                	mov    %esi,%eax
  101252:	5a                   	pop    %edx
  101253:	5b                   	pop    %ebx
  101254:	5e                   	pop    %esi
  101255:	5f                   	pop    %edi
  101256:	5d                   	pop    %ebp
  101257:	c3                   	ret    
  101258:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  10125c:	8d 77 02             	lea    0x2(%edi),%esi
  10125f:	4b                   	dec    %ebx
  101260:	eb d6                	jmp    101238 <i2A+0x50>
  101262:	66 90                	xchg   %ax,%ax
  101264:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  10126a:	74 0c                	je     101278 <i2A+0x90>
  10126c:	f7 d9                	neg    %ecx
  10126e:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  101272:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  101276:	eb 86                	jmp    1011fe <i2A+0x16>
  101278:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  10127d:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101281:	eb ef                	jmp    101272 <i2A+0x8a>
  101283:	90                   	nop

00101284 <i2X>:
  101284:	55                   	push   %ebp
  101285:	89 e5                	mov    %esp,%ebp
  101287:	57                   	push   %edi
  101288:	56                   	push   %esi
  101289:	53                   	push   %ebx
  10128a:	8b 55 08             	mov    0x8(%ebp),%edx
  10128d:	b9 5d 21 10 00       	mov    $0x10215d,%ecx
  101292:	31 c0                	xor    %eax,%eax
  101294:	40                   	inc    %eax
  101295:	89 d6                	mov    %edx,%esi
  101297:	83 e6 0f             	and    $0xf,%esi
  10129a:	8d 5e f6             	lea    -0xa(%esi),%ebx
  10129d:	89 cf                	mov    %ecx,%edi
  10129f:	83 fb 05             	cmp    $0x5,%ebx
  1012a2:	77 4c                	ja     1012f0 <i2X+0x6c>
  1012a4:	ff 24 9d 14 17 10 00 	jmp    *0x101714(,%ebx,4)
  1012ab:	90                   	nop
  1012ac:	c6 01 65             	movb   $0x65,(%ecx)
  1012af:	90                   	nop
  1012b0:	49                   	dec    %ecx
  1012b1:	c1 ea 04             	shr    $0x4,%edx
  1012b4:	75 de                	jne    101294 <i2X+0x10>
  1012b6:	c6 05 5e 21 10 00 00 	movb   $0x0,0x10215e
  1012bd:	8b 55 0c             	mov    0xc(%ebp),%edx
  1012c0:	89 3a                	mov    %edi,(%edx)
  1012c2:	5b                   	pop    %ebx
  1012c3:	5e                   	pop    %esi
  1012c4:	5f                   	pop    %edi
  1012c5:	5d                   	pop    %ebp
  1012c6:	c3                   	ret    
  1012c7:	90                   	nop
  1012c8:	c6 01 64             	movb   $0x64,(%ecx)
  1012cb:	eb e3                	jmp    1012b0 <i2X+0x2c>
  1012cd:	8d 76 00             	lea    0x0(%esi),%esi
  1012d0:	c6 01 63             	movb   $0x63,(%ecx)
  1012d3:	eb db                	jmp    1012b0 <i2X+0x2c>
  1012d5:	8d 76 00             	lea    0x0(%esi),%esi
  1012d8:	c6 01 62             	movb   $0x62,(%ecx)
  1012db:	eb d3                	jmp    1012b0 <i2X+0x2c>
  1012dd:	8d 76 00             	lea    0x0(%esi),%esi
  1012e0:	c6 01 61             	movb   $0x61,(%ecx)
  1012e3:	eb cb                	jmp    1012b0 <i2X+0x2c>
  1012e5:	8d 76 00             	lea    0x0(%esi),%esi
  1012e8:	c6 01 66             	movb   $0x66,(%ecx)
  1012eb:	eb c3                	jmp    1012b0 <i2X+0x2c>
  1012ed:	8d 76 00             	lea    0x0(%esi),%esi
  1012f0:	8d 5e 30             	lea    0x30(%esi),%ebx
  1012f3:	88 19                	mov    %bl,(%ecx)
  1012f5:	eb b9                	jmp    1012b0 <i2X+0x2c>
  1012f7:	90                   	nop

001012f8 <printk>:
  1012f8:	55                   	push   %ebp
  1012f9:	89 e5                	mov    %esp,%ebp
  1012fb:	57                   	push   %edi
  1012fc:	56                   	push   %esi
  1012fd:	53                   	push   %ebx
  1012fe:	83 ec 2c             	sub    $0x2c,%esp
  101301:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101304:	8a 11                	mov    (%ecx),%dl
  101306:	84 d2                	test   %dl,%dl
  101308:	0f 84 54 01 00 00    	je     101462 <printk+0x16a>
  10130e:	8d 45 0c             	lea    0xc(%ebp),%eax
  101311:	31 ff                	xor    %edi,%edi
  101313:	eb 18                	jmp    10132d <printk+0x35>
  101315:	8d 76 00             	lea    0x0(%esi),%esi
  101318:	8a 11                	mov    (%ecx),%dl
  10131a:	89 cb                	mov    %ecx,%ebx
  10131c:	88 97 80 21 10 00    	mov    %dl,0x102180(%edi)
  101322:	47                   	inc    %edi
  101323:	8d 4b 01             	lea    0x1(%ebx),%ecx
  101326:	8a 53 01             	mov    0x1(%ebx),%dl
  101329:	84 d2                	test   %dl,%dl
  10132b:	74 72                	je     10139f <printk+0xa7>
  10132d:	80 fa 25             	cmp    $0x25,%dl
  101330:	75 e6                	jne    101318 <printk+0x20>
  101332:	8d 59 01             	lea    0x1(%ecx),%ebx
  101335:	8a 51 01             	mov    0x1(%ecx),%dl
  101338:	80 fa 64             	cmp    $0x64,%dl
  10133b:	0f 84 bf 00 00 00    	je     101400 <printk+0x108>
  101341:	0f 8e 01 01 00 00    	jle    101448 <printk+0x150>
  101347:	80 fa 73             	cmp    $0x73,%dl
  10134a:	0f 84 84 00 00 00    	je     1013d4 <printk+0xdc>
  101350:	80 fa 78             	cmp    $0x78,%dl
  101353:	75 c7                	jne    10131c <printk+0x24>
  101355:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10135c:	8d 70 04             	lea    0x4(%eax),%esi
  10135f:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101362:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101365:	56                   	push   %esi
  101366:	ff 30                	pushl  (%eax)
  101368:	e8 17 ff ff ff       	call   101284 <i2X>
  10136d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  101370:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  101376:	8a 11                	mov    (%ecx),%dl
  101378:	83 c4 08             	add    $0x8,%esp
  10137b:	31 c0                	xor    %eax,%eax
  10137d:	84 d2                	test   %dl,%dl
  10137f:	74 0f                	je     101390 <printk+0x98>
  101381:	8d 76 00             	lea    0x0(%esi),%esi
  101384:	40                   	inc    %eax
  101385:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101389:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  10138c:	84 d2                	test   %dl,%dl
  10138e:	75 f4                	jne    101384 <printk+0x8c>
  101390:	01 c7                	add    %eax,%edi
  101392:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101395:	8d 4b 01             	lea    0x1(%ebx),%ecx
  101398:	8a 53 01             	mov    0x1(%ebx),%dl
  10139b:	84 d2                	test   %dl,%dl
  10139d:	75 8e                	jne    10132d <printk+0x35>
  10139f:	c6 87 80 21 10 00 00 	movb   $0x0,0x102180(%edi)
  1013a6:	0f be 05 80 21 10 00 	movsbl 0x102180,%eax
  1013ad:	bb 80 21 10 00       	mov    $0x102180,%ebx
  1013b2:	84 c0                	test   %al,%al
  1013b4:	74 16                	je     1013cc <printk+0xd4>
  1013b6:	66 90                	xchg   %ax,%ax
  1013b8:	83 ec 0c             	sub    $0xc,%esp
  1013bb:	50                   	push   %eax
  1013bc:	e8 73 f2 ff ff       	call   100634 <putChar>
  1013c1:	43                   	inc    %ebx
  1013c2:	0f be 03             	movsbl (%ebx),%eax
  1013c5:	83 c4 10             	add    $0x10,%esp
  1013c8:	84 c0                	test   %al,%al
  1013ca:	75 ec                	jne    1013b8 <printk+0xc0>
  1013cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1013cf:	5b                   	pop    %ebx
  1013d0:	5e                   	pop    %esi
  1013d1:	5f                   	pop    %edi
  1013d2:	5d                   	pop    %ebp
  1013d3:	c3                   	ret    
  1013d4:	8d 70 04             	lea    0x4(%eax),%esi
  1013d7:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1013da:	8b 08                	mov    (%eax),%ecx
  1013dc:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  1013e2:	8a 11                	mov    (%ecx),%dl
  1013e4:	31 c0                	xor    %eax,%eax
  1013e6:	84 d2                	test   %dl,%dl
  1013e8:	74 a6                	je     101390 <printk+0x98>
  1013ea:	66 90                	xchg   %ax,%ax
  1013ec:	40                   	inc    %eax
  1013ed:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1013f1:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  1013f4:	84 d2                	test   %dl,%dl
  1013f6:	75 f4                	jne    1013ec <printk+0xf4>
  1013f8:	01 c7                	add    %eax,%edi
  1013fa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1013fd:	eb 96                	jmp    101395 <printk+0x9d>
  1013ff:	90                   	nop
  101400:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  101407:	8d 70 04             	lea    0x4(%eax),%esi
  10140a:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10140d:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101410:	56                   	push   %esi
  101411:	ff 30                	pushl  (%eax)
  101413:	e8 d0 fd ff ff       	call   1011e8 <i2A>
  101418:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  10141b:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  101421:	8a 11                	mov    (%ecx),%dl
  101423:	83 c4 08             	add    $0x8,%esp
  101426:	31 c0                	xor    %eax,%eax
  101428:	84 d2                	test   %dl,%dl
  10142a:	0f 84 60 ff ff ff    	je     101390 <printk+0x98>
  101430:	40                   	inc    %eax
  101431:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101435:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  101438:	84 d2                	test   %dl,%dl
  10143a:	75 f4                	jne    101430 <printk+0x138>
  10143c:	01 c7                	add    %eax,%edi
  10143e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101441:	e9 4f ff ff ff       	jmp    101395 <printk+0x9d>
  101446:	66 90                	xchg   %ax,%ax
  101448:	80 fa 63             	cmp    $0x63,%dl
  10144b:	0f 85 cb fe ff ff    	jne    10131c <printk+0x24>
  101451:	8b 10                	mov    (%eax),%edx
  101453:	88 97 80 21 10 00    	mov    %dl,0x102180(%edi)
  101459:	83 c0 04             	add    $0x4,%eax
  10145c:	47                   	inc    %edi
  10145d:	e9 c1 fe ff ff       	jmp    101323 <printk+0x2b>
  101462:	31 ff                	xor    %edi,%edi
  101464:	e9 36 ff ff ff       	jmp    10139f <printk+0xa7>
  101469:	66 90                	xchg   %ax,%ax
  10146b:	90                   	nop

0010146c <abort>:
  10146c:	55                   	push   %ebp
  10146d:	89 e5                	mov    %esp,%ebp
  10146f:	57                   	push   %edi
  101470:	56                   	push   %esi
  101471:	53                   	push   %ebx
  101472:	83 ec 1c             	sub    $0x1c,%esp
  101475:	8b 55 08             	mov    0x8(%ebp),%edx
  101478:	fa                   	cli    
  101479:	8a 02                	mov    (%edx),%al
  10147b:	b9 32 20 10 00       	mov    $0x102032,%ecx
  101480:	84 c0                	test   %al,%al
  101482:	74 0b                	je     10148f <abort+0x23>
  101484:	41                   	inc    %ecx
  101485:	42                   	inc    %edx
  101486:	88 41 ff             	mov    %al,-0x1(%ecx)
  101489:	8a 02                	mov    (%edx),%al
  10148b:	84 c0                	test   %al,%al
  10148d:	75 f5                	jne    101484 <abort+0x18>
  10148f:	c6 01 3a             	movb   $0x3a,(%ecx)
  101492:	bb 9d 29 10 00       	mov    $0x10299d,%ebx
  101497:	be 0a 00 00 00       	mov    $0xa,%esi
  10149c:	bf 67 66 66 66       	mov    $0x66666667,%edi
  1014a1:	4b                   	dec    %ebx
  1014a2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1014a5:	99                   	cltd   
  1014a6:	f7 fe                	idiv   %esi
  1014a8:	8d 42 30             	lea    0x30(%edx),%eax
  1014ab:	88 45 e7             	mov    %al,-0x19(%ebp)
  1014ae:	88 03                	mov    %al,(%ebx)
  1014b0:	89 f8                	mov    %edi,%eax
  1014b2:	f7 6d 0c             	imull  0xc(%ebp)
  1014b5:	c1 fa 02             	sar    $0x2,%edx
  1014b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1014bb:	c1 f8 1f             	sar    $0x1f,%eax
  1014be:	29 c2                	sub    %eax,%edx
  1014c0:	89 55 0c             	mov    %edx,0xc(%ebp)
  1014c3:	75 dc                	jne    1014a1 <abort+0x35>
  1014c5:	41                   	inc    %ecx
  1014c6:	41                   	inc    %ecx
  1014c7:	43                   	inc    %ebx
  1014c8:	8a 45 e7             	mov    -0x19(%ebp),%al
  1014cb:	88 41 ff             	mov    %al,-0x1(%ecx)
  1014ce:	8a 03                	mov    (%ebx),%al
  1014d0:	88 45 e7             	mov    %al,-0x19(%ebp)
  1014d3:	84 c0                	test   %al,%al
  1014d5:	75 ef                	jne    1014c6 <abort+0x5a>
  1014d7:	c6 01 0a             	movb   $0xa,(%ecx)
  1014da:	0f be 05 20 20 10 00 	movsbl 0x102020,%eax
  1014e1:	84 c0                	test   %al,%al
  1014e3:	74 1b                	je     101500 <abort+0x94>
  1014e5:	bb 20 20 10 00       	mov    $0x102020,%ebx
  1014ea:	83 ec 0c             	sub    $0xc,%esp
  1014ed:	50                   	push   %eax
  1014ee:	e8 41 f1 ff ff       	call   100634 <putChar>
  1014f3:	43                   	inc    %ebx
  1014f4:	0f be 03             	movsbl (%ebx),%eax
  1014f7:	83 c4 10             	add    $0x10,%esp
  1014fa:	84 c0                	test   %al,%al
  1014fc:	75 ec                	jne    1014ea <abort+0x7e>
  1014fe:	66 90                	xchg   %ax,%ax
  101500:	f4                   	hlt    
  101501:	eb fd                	jmp    101500 <abort+0x94>

00101503 <irqEmpty>:
  101503:	6a 00                	push   $0x0
  101505:	6a ff                	push   $0xffffffff
  101507:	eb 13                	jmp    10151c <asmDoIrq>

00101509 <irqGProtectFault>:
  101509:	6a 0d                	push   $0xd
  10150b:	eb 0f                	jmp    10151c <asmDoIrq>

0010150d <irqSyscall>:
  10150d:	6a 00                	push   $0x0
  10150f:	68 80 00 00 00       	push   $0x80
  101514:	eb 06                	jmp    10151c <asmDoIrq>

00101516 <irqTime>:
  101516:	6a 00                	push   $0x0
  101518:	6a 20                	push   $0x20
  10151a:	eb 00                	jmp    10151c <asmDoIrq>

0010151c <asmDoIrq>:
  10151c:	60                   	pusha  
  10151d:	54                   	push   %esp
  10151e:	e8 cd fb ff ff       	call   1010f0 <irqHandle>
  101523:	5c                   	pop    %esp
  101524:	61                   	popa   
  101525:	83 c4 04             	add    $0x4,%esp
  101528:	83 c4 04             	add    $0x4,%esp
  10152b:	cf                   	iret   
