
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 65 12 00 00       	call   101270 <initTimer>
  10000b:	e8 c0 0e 00 00       	call   100ed0 <init_pcb>
  100010:	e8 f7 0e 00 00       	call   100f0c <init_kernel_pcb>
  100015:	e8 da 05 00 00       	call   1005f4 <initSerial>
  10001a:	e8 99 0f 00 00       	call   100fb8 <initIdt>
  10001f:	e8 f4 11 00 00       	call   101218 <initIntr>
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
  1001ed:	a1 cc 15 10 00       	mov    0x1015cc,%eax
  1001f2:	8b 15 d0 15 10 00    	mov    0x1015d0,%edx
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
  1002e0:	e8 23 06 00 00       	call   100908 <put_into_runnable>
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
  1003be:	e8 81 04 00 00       	call   100844 <get_from_runnable>
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
  1003e0:	e8 2f 04 00 00       	call   100814 <getpid>
  1003e5:	83 ec 08             	sub    $0x8,%esp
  1003e8:	53                   	push   %ebx
  1003e9:	50                   	push   %eax
  1003ea:	e8 49 06 00 00       	call   100a38 <put_into_block>
  1003ef:	c7 04 24 d4 15 10 00 	movl   $0x1015d4,(%esp)
  1003f6:	e8 9d 0f 00 00       	call   101398 <printk>
  1003fb:	e8 14 04 00 00       	call   100814 <getpid>
  100400:	89 c2                	mov    %eax,%edx
  100402:	c1 e2 07             	shl    $0x7,%edx
  100405:	01 c2                	add    %eax,%edx
  100407:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10040a:	01 d2                	add    %edx,%edx
  10040c:	01 d0                	add    %edx,%eax
  10040e:	8b 34 c5 04 4a 10 00 	mov    0x104a04(,%eax,8),%esi
  100415:	e8 fa 03 00 00       	call   100814 <getpid>
  10041a:	5a                   	pop    %edx
  10041b:	59                   	pop    %ecx
  10041c:	56                   	push   %esi
  10041d:	50                   	push   %eax
  10041e:	68 20 16 10 00       	push   $0x101620
  100423:	6a 09                	push   $0x9
  100425:	68 da 15 10 00       	push   $0x1015da
  10042a:	68 fc 15 10 00       	push   $0x1015fc
  10042f:	e8 64 0f 00 00       	call   101398 <printk>
  100434:	83 c4 14             	add    $0x14,%esp
  100437:	68 f6 15 10 00       	push   $0x1015f6
  10043c:	e8 57 0f 00 00       	call   101398 <printk>
  100441:	e8 fe 03 00 00       	call   100844 <get_from_runnable>
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
  100467:	68 2a 16 10 00       	push   $0x10162a
  10046c:	e8 27 0f 00 00       	call   101398 <printk>
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
  100498:	e8 6b 04 00 00       	call   100908 <put_into_runnable>
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
  100588:	68 46 16 10 00       	push   $0x101646
  10058d:	e8 7a 0f 00 00       	call   10150c <abort>
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
  10066d:	0f 84 79 01 00 00    	je     1007ec <put_into_running+0x194>
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
  10069c:	0f 85 de 00 00 00    	jne    100780 <put_into_running+0x128>
  1006a2:	83 ec 08             	sub    $0x8,%esp
  1006a5:	68 bc 49 10 00       	push   $0x1049bc
  1006aa:	6a 10                	push   $0x10
  1006ac:	e8 83 f9 ff ff       	call   100034 <change_tss>
  1006b1:	8d 85 20 ff ff ff    	lea    -0xe0(%ebp),%eax
  1006b7:	89 04 24             	mov    %eax,(%esp)
  1006ba:	e8 91 f9 ff ff       	call   100050 <get_tss>
  1006bf:	83 c4 0c             	add    $0xc,%esp
  1006c2:	81 bd 24 ff ff ff bc 	cmpl   $0x1049bc,-0xdc(%ebp)
  1006c9:	49 10 00 
  1006cc:	74 12                	je     1006e0 <put_into_running+0x88>
  1006ce:	83 ec 08             	sub    $0x8,%esp
  1006d1:	6a 19                	push   $0x19
  1006d3:	68 62 16 10 00       	push   $0x101662
  1006d8:	e8 2f 0e 00 00       	call   10150c <abort>
  1006dd:	83 c4 10             	add    $0x10,%esp
  1006e0:	83 ec 0c             	sub    $0xc,%esp
  1006e3:	68 d4 15 10 00       	push   $0x1015d4
  1006e8:	e8 ab 0c 00 00       	call   101398 <printk>
  1006ed:	a1 a0 29 10 00       	mov    0x1029a0,%eax
  1006f2:	89 c2                	mov    %eax,%edx
  1006f4:	c1 e2 07             	shl    $0x7,%edx
  1006f7:	01 c2                	add    %eax,%edx
  1006f9:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1006fc:	01 d2                	add    %edx,%edx
  1006fe:	01 d0                	add    %edx,%eax
  100700:	8d 04 c5 bc 49 10 00 	lea    0x1049bc(,%eax,8),%eax
  100707:	83 c4 0c             	add    $0xc,%esp
  10070a:	89 c2                	mov    %eax,%edx
  10070c:	2b 55 0c             	sub    0xc(%ebp),%edx
  10070f:	52                   	push   %edx
  100710:	ff 75 0c             	pushl  0xc(%ebp)
  100713:	50                   	push   %eax
  100714:	68 cc 17 10 00       	push   $0x1017cc
  100719:	6a 1a                	push   $0x1a
  10071b:	68 62 16 10 00       	push   $0x101662
  100720:	68 a8 16 10 00       	push   $0x1016a8
  100725:	e8 6e 0c 00 00       	call   101398 <printk>
  10072a:	83 c4 14             	add    $0x14,%esp
  10072d:	68 f6 15 10 00       	push   $0x1015f6
  100732:	e8 61 0c 00 00       	call   101398 <printk>
  100737:	c7 04 24 d4 15 10 00 	movl   $0x1015d4,(%esp)
  10073e:	e8 55 0c 00 00       	call   101398 <printk>
  100743:	c7 04 24 bc 49 10 00 	movl   $0x1049bc,(%esp)
  10074a:	68 cc 17 10 00       	push   $0x1017cc
  10074f:	6a 1b                	push   $0x1b
  100751:	68 62 16 10 00       	push   $0x101662
  100756:	68 e4 16 10 00       	push   $0x1016e4
  10075b:	e8 38 0c 00 00       	call   101398 <printk>
  100760:	83 c4 14             	add    $0x14,%esp
  100763:	68 f6 15 10 00       	push   $0x1015f6
  100768:	e8 2b 0c 00 00       	call   101398 <printk>
  10076d:	58                   	pop    %eax
  10076e:	5a                   	pop    %edx
  10076f:	6a 1c                	push   $0x1c
  100771:	68 62 16 10 00       	push   $0x101662
  100776:	e8 91 0d 00 00       	call   10150c <abort>
  10077b:	83 c4 10             	add    $0x10,%esp
  10077e:	eb 36                	jmp    1007b6 <put_into_running+0x15e>
  100780:	8d b0 bc 49 10 00    	lea    0x1049bc(%eax),%esi
  100786:	83 ec 08             	sub    $0x8,%esp
  100789:	56                   	push   %esi
  10078a:	6a 10                	push   $0x10
  10078c:	e8 a3 f8 ff ff       	call   100034 <change_tss>
  100791:	8d 45 84             	lea    -0x7c(%ebp),%eax
  100794:	89 04 24             	mov    %eax,(%esp)
  100797:	e8 b4 f8 ff ff       	call   100050 <get_tss>
  10079c:	83 c4 0c             	add    $0xc,%esp
  10079f:	3b 75 88             	cmp    -0x78(%ebp),%esi
  1007a2:	74 12                	je     1007b6 <put_into_running+0x15e>
  1007a4:	83 ec 08             	sub    $0x8,%esp
  1007a7:	6a 20                	push   $0x20
  1007a9:	68 62 16 10 00       	push   $0x101662
  1007ae:	e8 59 0d 00 00       	call   10150c <abort>
  1007b3:	83 c4 10             	add    $0x10,%esp
  1007b6:	83 ec 0c             	sub    $0xc,%esp
  1007b9:	68 d4 15 10 00       	push   $0x1015d4
  1007be:	e8 d5 0b 00 00       	call   101398 <printk>
  1007c3:	89 1c 24             	mov    %ebx,(%esp)
  1007c6:	68 cc 17 10 00       	push   $0x1017cc
  1007cb:	6a 23                	push   $0x23
  1007cd:	68 62 16 10 00       	push   $0x101662
  1007d2:	68 70 16 10 00       	push   $0x101670
  1007d7:	e8 bc 0b 00 00       	call   101398 <printk>
  1007dc:	83 c4 14             	add    $0x14,%esp
  1007df:	68 f6 15 10 00       	push   $0x1015f6
  1007e4:	e8 af 0b 00 00       	call   101398 <printk>
  1007e9:	83 c4 10             	add    $0x10,%esp
  1007ec:	b8 01 00 00 00       	mov    $0x1,%eax
  1007f1:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1007f4:	5b                   	pop    %ebx
  1007f5:	5e                   	pop    %esi
  1007f6:	5f                   	pop    %edi
  1007f7:	5d                   	pop    %ebp
  1007f8:	c3                   	ret    
  1007f9:	8d 76 00             	lea    0x0(%esi),%esi

001007fc <update_block>:
  1007fc:	55                   	push   %ebp
  1007fd:	89 e5                	mov    %esp,%ebp
  1007ff:	b8 01 00 00 00       	mov    $0x1,%eax
  100804:	5d                   	pop    %ebp
  100805:	c3                   	ret    
  100806:	66 90                	xchg   %ax,%ax

00100808 <apply_new_pid>:
  100808:	55                   	push   %ebp
  100809:	89 e5                	mov    %esp,%ebp
  10080b:	b8 02 00 00 00       	mov    $0x2,%eax
  100810:	5d                   	pop    %ebp
  100811:	c3                   	ret    
  100812:	66 90                	xchg   %ax,%ax

00100814 <getpid>:
  100814:	55                   	push   %ebp
  100815:	89 e5                	mov    %esp,%ebp
  100817:	a1 a0 29 10 00       	mov    0x1029a0,%eax
  10081c:	5d                   	pop    %ebp
  10081d:	c3                   	ret    
  10081e:	66 90                	xchg   %ax,%ax

00100820 <getrunnable>:
  100820:	55                   	push   %ebp
  100821:	89 e5                	mov    %esp,%ebp
  100823:	a1 04 20 10 00       	mov    0x102004,%eax
  100828:	5d                   	pop    %ebp
  100829:	c3                   	ret    
  10082a:	66 90                	xchg   %ax,%ax

0010082c <getblocked>:
  10082c:	55                   	push   %ebp
  10082d:	89 e5                	mov    %esp,%ebp
  10082f:	a1 00 20 10 00       	mov    0x102000,%eax
  100834:	5d                   	pop    %ebp
  100835:	c3                   	ret    
  100836:	66 90                	xchg   %ax,%ax

00100838 <transfer_pid_mode>:
  100838:	55                   	push   %ebp
  100839:	89 e5                	mov    %esp,%ebp
  10083b:	b8 01 00 00 00       	mov    $0x1,%eax
  100840:	5d                   	pop    %ebp
  100841:	c3                   	ret    
  100842:	66 90                	xchg   %ax,%ax

00100844 <get_from_runnable>:
  100844:	55                   	push   %ebp
  100845:	89 e5                	mov    %esp,%ebp
  100847:	53                   	push   %ebx
  100848:	51                   	push   %ecx
  100849:	8b 1d 04 20 10 00    	mov    0x102004,%ebx
  10084f:	83 fb ff             	cmp    $0xffffffff,%ebx
  100852:	0f 84 a8 00 00 00    	je     100900 <get_from_runnable+0xbc>
  100858:	89 d8                	mov    %ebx,%eax
  10085a:	c1 e0 07             	shl    $0x7,%eax
  10085d:	01 d8                	add    %ebx,%eax
  10085f:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100862:	01 c0                	add    %eax,%eax
  100864:	01 d8                	add    %ebx,%eax
  100866:	8d 14 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%edx
  10086d:	8b 82 50 20 00 00    	mov    0x2050(%edx),%eax
  100873:	39 d8                	cmp    %ebx,%eax
  100875:	74 7d                	je     1008f4 <get_from_runnable+0xb0>
  100877:	8b 8a 4c 20 00 00    	mov    0x204c(%edx),%ecx
  10087d:	89 ca                	mov    %ecx,%edx
  10087f:	c1 e2 07             	shl    $0x7,%edx
  100882:	01 ca                	add    %ecx,%edx
  100884:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100887:	01 d2                	add    %edx,%edx
  100889:	01 ca                	add    %ecx,%edx
  10088b:	89 04 d5 10 4a 10 00 	mov    %eax,0x104a10(,%edx,8)
  100892:	89 c2                	mov    %eax,%edx
  100894:	c1 e2 07             	shl    $0x7,%edx
  100897:	01 c2                	add    %eax,%edx
  100899:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10089c:	01 d2                	add    %edx,%edx
  10089e:	01 c2                	add    %eax,%edx
  1008a0:	89 0c d5 0c 4a 10 00 	mov    %ecx,0x104a0c(,%edx,8)
  1008a7:	a3 04 20 10 00       	mov    %eax,0x102004
  1008ac:	83 ec 0c             	sub    $0xc,%esp
  1008af:	68 d4 15 10 00       	push   $0x1015d4
  1008b4:	e8 df 0a 00 00       	call   101398 <printk>
  1008b9:	58                   	pop    %eax
  1008ba:	5a                   	pop    %edx
  1008bb:	ff 35 04 20 10 00    	pushl  0x102004
  1008c1:	53                   	push   %ebx
  1008c2:	68 a8 17 10 00       	push   $0x1017a8
  1008c7:	68 82 00 00 00       	push   $0x82
  1008cc:	68 62 16 10 00       	push   $0x101662
  1008d1:	68 10 17 10 00       	push   $0x101710
  1008d6:	e8 bd 0a 00 00       	call   101398 <printk>
  1008db:	83 c4 14             	add    $0x14,%esp
  1008de:	68 f6 15 10 00       	push   $0x1015f6
  1008e3:	e8 b0 0a 00 00       	call   101398 <printk>
  1008e8:	83 c4 10             	add    $0x10,%esp
  1008eb:	89 d8                	mov    %ebx,%eax
  1008ed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1008f0:	c9                   	leave  
  1008f1:	c3                   	ret    
  1008f2:	66 90                	xchg   %ax,%ax
  1008f4:	c7 05 04 20 10 00 ff 	movl   $0xffffffff,0x102004
  1008fb:	ff ff ff 
  1008fe:	eb ac                	jmp    1008ac <get_from_runnable+0x68>
  100900:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100905:	eb e6                	jmp    1008ed <get_from_runnable+0xa9>
  100907:	90                   	nop

00100908 <put_into_runnable>:
  100908:	55                   	push   %ebp
  100909:	89 e5                	mov    %esp,%ebp
  10090b:	56                   	push   %esi
  10090c:	53                   	push   %ebx
  10090d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100910:	a1 04 20 10 00       	mov    0x102004,%eax
  100915:	83 f8 ff             	cmp    $0xffffffff,%eax
  100918:	0f 84 ee 00 00 00    	je     100a0c <put_into_runnable+0x104>
  10091e:	89 c2                	mov    %eax,%edx
  100920:	c1 e2 07             	shl    $0x7,%edx
  100923:	01 c2                	add    %eax,%edx
  100925:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100928:	01 d2                	add    %edx,%edx
  10092a:	01 c2                	add    %eax,%edx
  10092c:	8d 34 d5 c0 29 10 00 	lea    0x1029c0(,%edx,8),%esi
  100933:	8b 8e 4c 20 00 00    	mov    0x204c(%esi),%ecx
  100939:	89 ca                	mov    %ecx,%edx
  10093b:	c1 e2 07             	shl    $0x7,%edx
  10093e:	01 ca                	add    %ecx,%edx
  100940:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100943:	01 d2                	add    %edx,%edx
  100945:	01 ca                	add    %ecx,%edx
  100947:	89 1c d5 10 4a 10 00 	mov    %ebx,0x104a10(,%edx,8)
  10094e:	89 da                	mov    %ebx,%edx
  100950:	c1 e2 07             	shl    $0x7,%edx
  100953:	01 da                	add    %ebx,%edx
  100955:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100958:	01 d2                	add    %edx,%edx
  10095a:	01 da                	add    %ebx,%edx
  10095c:	8d 14 d5 c0 29 10 00 	lea    0x1029c0(,%edx,8),%edx
  100963:	89 8a 4c 20 00 00    	mov    %ecx,0x204c(%edx)
  100969:	89 82 50 20 00 00    	mov    %eax,0x2050(%edx)
  10096f:	89 9e 4c 20 00 00    	mov    %ebx,0x204c(%esi)
  100975:	89 d8                	mov    %ebx,%eax
  100977:	c1 e0 07             	shl    $0x7,%eax
  10097a:	01 d8                	add    %ebx,%eax
  10097c:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10097f:	01 c0                	add    %eax,%eax
  100981:	01 d8                	add    %ebx,%eax
  100983:	c7 04 c5 fc 49 10 00 	movl   $0x1,0x1049fc(,%eax,8)
  10098a:	01 00 00 00 
  10098e:	85 db                	test   %ebx,%ebx
  100990:	75 0a                	jne    10099c <put_into_runnable+0x94>
  100992:	c7 05 e8 49 10 00 50 	movl   $0x100650,0x1049e8
  100999:	06 10 00 
  10099c:	83 ec 0c             	sub    $0xc,%esp
  10099f:	68 d4 15 10 00       	push   $0x1015d4
  1009a4:	e8 ef 09 00 00       	call   101398 <printk>
  1009a9:	58                   	pop    %eax
  1009aa:	5a                   	pop    %edx
  1009ab:	53                   	push   %ebx
  1009ac:	ff 35 04 20 10 00    	pushl  0x102004
  1009b2:	68 94 17 10 00       	push   $0x101794
  1009b7:	68 a0 00 00 00       	push   $0xa0
  1009bc:	68 62 16 10 00       	push   $0x101662
  1009c1:	68 44 17 10 00       	push   $0x101744
  1009c6:	e8 cd 09 00 00       	call   101398 <printk>
  1009cb:	83 c4 14             	add    $0x14,%esp
  1009ce:	68 f6 15 10 00       	push   $0x1015f6
  1009d3:	e8 c0 09 00 00       	call   101398 <printk>
  1009d8:	89 d8                	mov    %ebx,%eax
  1009da:	c1 e0 07             	shl    $0x7,%eax
  1009dd:	01 d8                	add    %ebx,%eax
  1009df:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1009e2:	01 c0                	add    %eax,%eax
  1009e4:	01 c3                	add    %eax,%ebx
  1009e6:	8d 04 dd c0 29 10 00 	lea    0x1029c0(,%ebx,8),%eax
  1009ed:	8b 55 0c             	mov    0xc(%ebp),%edx
  1009f0:	89 90 54 20 00 00    	mov    %edx,0x2054(%eax)
  1009f6:	c7 80 40 20 00 00 0a 	movl   $0xa,0x2040(%eax)
  1009fd:	00 00 00 
  100a00:	b8 01 00 00 00       	mov    $0x1,%eax
  100a05:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100a08:	5b                   	pop    %ebx
  100a09:	5e                   	pop    %esi
  100a0a:	5d                   	pop    %ebp
  100a0b:	c3                   	ret    
  100a0c:	89 1d 04 20 10 00    	mov    %ebx,0x102004
  100a12:	89 d8                	mov    %ebx,%eax
  100a14:	c1 e0 07             	shl    $0x7,%eax
  100a17:	01 d8                	add    %ebx,%eax
  100a19:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100a1c:	01 c0                	add    %eax,%eax
  100a1e:	01 d8                	add    %ebx,%eax
  100a20:	8d 04 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%eax
  100a27:	89 98 4c 20 00 00    	mov    %ebx,0x204c(%eax)
  100a2d:	89 98 50 20 00 00    	mov    %ebx,0x2050(%eax)
  100a33:	e9 3d ff ff ff       	jmp    100975 <put_into_runnable+0x6d>

00100a38 <put_into_block>:
  100a38:	55                   	push   %ebp
  100a39:	89 e5                	mov    %esp,%ebp
  100a3b:	57                   	push   %edi
  100a3c:	56                   	push   %esi
  100a3d:	53                   	push   %ebx
  100a3e:	8b 45 08             	mov    0x8(%ebp),%eax
  100a41:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100a44:	8b 15 00 20 10 00    	mov    0x102000,%edx
  100a4a:	83 fa ff             	cmp    $0xffffffff,%edx
  100a4d:	0f 84 99 00 00 00    	je     100aec <put_into_block+0xb4>
  100a53:	89 d1                	mov    %edx,%ecx
  100a55:	c1 e1 07             	shl    $0x7,%ecx
  100a58:	01 d1                	add    %edx,%ecx
  100a5a:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100a5d:	01 c9                	add    %ecx,%ecx
  100a5f:	01 d1                	add    %edx,%ecx
  100a61:	8d 3c cd c0 29 10 00 	lea    0x1029c0(,%ecx,8),%edi
  100a68:	8b b7 4c 20 00 00    	mov    0x204c(%edi),%esi
  100a6e:	89 f1                	mov    %esi,%ecx
  100a70:	c1 e1 07             	shl    $0x7,%ecx
  100a73:	01 f1                	add    %esi,%ecx
  100a75:	8d 0c 8e             	lea    (%esi,%ecx,4),%ecx
  100a78:	01 c9                	add    %ecx,%ecx
  100a7a:	01 f1                	add    %esi,%ecx
  100a7c:	89 04 cd 10 4a 10 00 	mov    %eax,0x104a10(,%ecx,8)
  100a83:	89 c1                	mov    %eax,%ecx
  100a85:	c1 e1 07             	shl    $0x7,%ecx
  100a88:	01 c1                	add    %eax,%ecx
  100a8a:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  100a8d:	01 c9                	add    %ecx,%ecx
  100a8f:	01 c1                	add    %eax,%ecx
  100a91:	8d 0c cd c0 29 10 00 	lea    0x1029c0(,%ecx,8),%ecx
  100a98:	89 b1 4c 20 00 00    	mov    %esi,0x204c(%ecx)
  100a9e:	89 91 50 20 00 00    	mov    %edx,0x2050(%ecx)
  100aa4:	89 87 4c 20 00 00    	mov    %eax,0x204c(%edi)
  100aaa:	89 c2                	mov    %eax,%edx
  100aac:	c1 e2 07             	shl    $0x7,%edx
  100aaf:	01 c2                	add    %eax,%edx
  100ab1:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100ab4:	01 d2                	add    %edx,%edx
  100ab6:	01 c2                	add    %eax,%edx
  100ab8:	c1 e2 03             	shl    $0x3,%edx
  100abb:	8d 82 c0 49 10 00    	lea    0x1049c0(%edx),%eax
  100ac1:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100ac6:	89 c7                	mov    %eax,%edi
  100ac8:	89 de                	mov    %ebx,%esi
  100aca:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100acc:	8b 43 10             	mov    0x10(%ebx),%eax
  100acf:	89 82 04 4a 10 00    	mov    %eax,0x104a04(%edx)
  100ad5:	c7 82 fc 49 10 00 00 	movl   $0x0,0x1049fc(%edx)
  100adc:	00 00 00 
  100adf:	b8 01 00 00 00       	mov    $0x1,%eax
  100ae4:	5b                   	pop    %ebx
  100ae5:	5e                   	pop    %esi
  100ae6:	5f                   	pop    %edi
  100ae7:	5d                   	pop    %ebp
  100ae8:	c3                   	ret    
  100ae9:	8d 76 00             	lea    0x0(%esi),%esi
  100aec:	a3 00 20 10 00       	mov    %eax,0x102000
  100af1:	89 c2                	mov    %eax,%edx
  100af3:	c1 e2 07             	shl    $0x7,%edx
  100af6:	01 c2                	add    %eax,%edx
  100af8:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100afb:	01 d2                	add    %edx,%edx
  100afd:	01 c2                	add    %eax,%edx
  100aff:	8d 14 d5 c0 29 10 00 	lea    0x1029c0(,%edx,8),%edx
  100b06:	89 82 50 20 00 00    	mov    %eax,0x2050(%edx)
  100b0c:	89 82 4c 20 00 00    	mov    %eax,0x204c(%edx)
  100b12:	eb 96                	jmp    100aaa <put_into_block+0x72>

00100b14 <get_from>:
  100b14:	55                   	push   %ebp
  100b15:	89 e5                	mov    %esp,%ebp
  100b17:	56                   	push   %esi
  100b18:	53                   	push   %ebx
  100b19:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100b1c:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b1f:	85 db                	test   %ebx,%ebx
  100b21:	0f 8e 01 01 00 00    	jle    100c28 <get_from+0x114>
  100b27:	39 c3                	cmp    %eax,%ebx
  100b29:	74 42                	je     100b6d <get_from+0x59>
  100b2b:	89 da                	mov    %ebx,%edx
  100b2d:	c1 e2 07             	shl    $0x7,%edx
  100b30:	01 da                	add    %ebx,%edx
  100b32:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100b35:	01 d2                	add    %edx,%edx
  100b37:	01 da                	add    %ebx,%edx
  100b39:	8b 14 d5 10 4a 10 00 	mov    0x104a10(,%edx,8),%edx
  100b40:	39 d3                	cmp    %edx,%ebx
  100b42:	75 25                	jne    100b69 <get_from+0x55>
  100b44:	e9 df 00 00 00       	jmp    100c28 <get_from+0x114>
  100b49:	8d 76 00             	lea    0x0(%esi),%esi
  100b4c:	89 d1                	mov    %edx,%ecx
  100b4e:	c1 e1 07             	shl    $0x7,%ecx
  100b51:	01 d1                	add    %edx,%ecx
  100b53:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100b56:	01 c9                	add    %ecx,%ecx
  100b58:	01 ca                	add    %ecx,%edx
  100b5a:	8b 14 d5 10 4a 10 00 	mov    0x104a10(,%edx,8),%edx
  100b61:	39 d3                	cmp    %edx,%ebx
  100b63:	0f 84 bf 00 00 00    	je     100c28 <get_from+0x114>
  100b69:	39 c2                	cmp    %eax,%edx
  100b6b:	75 df                	jne    100b4c <get_from+0x38>
  100b6d:	89 c2                	mov    %eax,%edx
  100b6f:	c1 e2 07             	shl    $0x7,%edx
  100b72:	01 c2                	add    %eax,%edx
  100b74:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100b77:	01 d2                	add    %edx,%edx
  100b79:	01 d0                	add    %edx,%eax
  100b7b:	8b 04 c5 fc 49 10 00 	mov    0x1049fc(,%eax,8),%eax
  100b82:	85 c0                	test   %eax,%eax
  100b84:	0f 84 c2 00 00 00    	je     100c4c <get_from+0x138>
  100b8a:	48                   	dec    %eax
  100b8b:	75 7f                	jne    100c0c <get_from+0xf8>
  100b8d:	be 04 20 10 00       	mov    $0x102004,%esi
  100b92:	3b 1e                	cmp    (%esi),%ebx
  100b94:	74 15                	je     100bab <get_from+0x97>
  100b96:	83 ec 08             	sub    $0x8,%esp
  100b99:	68 e2 00 00 00       	push   $0xe2
  100b9e:	68 62 16 10 00       	push   $0x101662
  100ba3:	e8 64 09 00 00       	call   10150c <abort>
  100ba8:	83 c4 10             	add    $0x10,%esp
  100bab:	89 d8                	mov    %ebx,%eax
  100bad:	c1 e0 07             	shl    $0x7,%eax
  100bb0:	01 d8                	add    %ebx,%eax
  100bb2:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100bb5:	01 c0                	add    %eax,%eax
  100bb7:	01 d8                	add    %ebx,%eax
  100bb9:	8d 14 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%edx
  100bc0:	8b 82 50 20 00 00    	mov    0x2050(%edx),%eax
  100bc6:	39 d8                	cmp    %ebx,%eax
  100bc8:	0f 84 8a 00 00 00    	je     100c58 <get_from+0x144>
  100bce:	8b 8a 4c 20 00 00    	mov    0x204c(%edx),%ecx
  100bd4:	89 ca                	mov    %ecx,%edx
  100bd6:	c1 e2 07             	shl    $0x7,%edx
  100bd9:	01 ca                	add    %ecx,%edx
  100bdb:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100bde:	01 d2                	add    %edx,%edx
  100be0:	01 ca                	add    %ecx,%edx
  100be2:	89 04 d5 10 4a 10 00 	mov    %eax,0x104a10(,%edx,8)
  100be9:	89 c2                	mov    %eax,%edx
  100beb:	c1 e2 07             	shl    $0x7,%edx
  100bee:	01 c2                	add    %eax,%edx
  100bf0:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100bf3:	01 d2                	add    %edx,%edx
  100bf5:	01 c2                	add    %eax,%edx
  100bf7:	89 0c d5 0c 4a 10 00 	mov    %ecx,0x104a0c(,%edx,8)
  100bfe:	89 06                	mov    %eax,(%esi)
  100c00:	89 d8                	mov    %ebx,%eax
  100c02:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100c05:	5b                   	pop    %ebx
  100c06:	5e                   	pop    %esi
  100c07:	5d                   	pop    %ebp
  100c08:	c3                   	ret    
  100c09:	8d 76 00             	lea    0x0(%esi),%esi
  100c0c:	83 ec 08             	sub    $0x8,%esp
  100c0f:	68 de 00 00 00       	push   $0xde
  100c14:	68 62 16 10 00       	push   $0x101662
  100c19:	e8 ee 08 00 00       	call   10150c <abort>
  100c1e:	a1 00 00 00 00       	mov    0x0,%eax
  100c23:	0f 0b                	ud2    
  100c25:	8d 76 00             	lea    0x0(%esi),%esi
  100c28:	83 ec 08             	sub    $0x8,%esp
  100c2b:	68 cf 00 00 00       	push   $0xcf
  100c30:	68 62 16 10 00       	push   $0x101662
  100c35:	e8 d2 08 00 00       	call   10150c <abort>
  100c3a:	83 c4 10             	add    $0x10,%esp
  100c3d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100c42:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100c45:	5b                   	pop    %ebx
  100c46:	5e                   	pop    %esi
  100c47:	5d                   	pop    %ebp
  100c48:	c3                   	ret    
  100c49:	8d 76 00             	lea    0x0(%esi),%esi
  100c4c:	be 00 20 10 00       	mov    $0x102000,%esi
  100c51:	e9 3c ff ff ff       	jmp    100b92 <get_from+0x7e>
  100c56:	66 90                	xchg   %ax,%ax
  100c58:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100c5e:	89 d8                	mov    %ebx,%eax
  100c60:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100c63:	5b                   	pop    %ebx
  100c64:	5e                   	pop    %esi
  100c65:	5d                   	pop    %ebp
  100c66:	c3                   	ret    
  100c67:	90                   	nop

00100c68 <get_from_block>:
  100c68:	55                   	push   %ebp
  100c69:	89 e5                	mov    %esp,%ebp
  100c6b:	83 ec 10             	sub    $0x10,%esp
  100c6e:	ff 75 08             	pushl  0x8(%ebp)
  100c71:	ff 35 00 20 10 00    	pushl  0x102000
  100c77:	e8 98 fe ff ff       	call   100b14 <get_from>
  100c7c:	83 c4 10             	add    $0x10,%esp
  100c7f:	40                   	inc    %eax
  100c80:	74 0a                	je     100c8c <get_from_block+0x24>
  100c82:	b8 01 00 00 00       	mov    $0x1,%eax
  100c87:	c9                   	leave  
  100c88:	c3                   	ret    
  100c89:	8d 76 00             	lea    0x0(%esi),%esi
  100c8c:	83 ec 08             	sub    $0x8,%esp
  100c8f:	68 19 01 00 00       	push   $0x119
  100c94:	68 62 16 10 00       	push   $0x101662
  100c99:	e8 6e 08 00 00       	call   10150c <abort>
  100c9e:	83 c4 10             	add    $0x10,%esp
  100ca1:	b8 01 00 00 00       	mov    $0x1,%eax
  100ca6:	c9                   	leave  
  100ca7:	c3                   	ret    

00100ca8 <check_block>:
  100ca8:	55                   	push   %ebp
  100ca9:	89 e5                	mov    %esp,%ebp
  100cab:	57                   	push   %edi
  100cac:	56                   	push   %esi
  100cad:	53                   	push   %ebx
  100cae:	83 ec 0c             	sub    $0xc,%esp
  100cb1:	a1 00 20 10 00       	mov    0x102000,%eax
  100cb6:	89 c6                	mov    %eax,%esi
  100cb8:	83 f8 ff             	cmp    $0xffffffff,%eax
  100cbb:	74 58                	je     100d15 <check_block+0x6d>
  100cbd:	89 c2                	mov    %eax,%edx
  100cbf:	c1 e2 07             	shl    $0x7,%edx
  100cc2:	01 c2                	add    %eax,%edx
  100cc4:	8d 3c 90             	lea    (%eax,%edx,4),%edi
  100cc7:	01 ff                	add    %edi,%edi
  100cc9:	01 c7                	add    %eax,%edi
  100ccb:	eb 0c                	jmp    100cd9 <check_block+0x31>
  100ccd:	8d 76 00             	lea    0x0(%esi),%esi
  100cd0:	39 c6                	cmp    %eax,%esi
  100cd2:	74 3c                	je     100d10 <check_block+0x68>
  100cd4:	83 f8 ff             	cmp    $0xffffffff,%eax
  100cd7:	74 37                	je     100d10 <check_block+0x68>
  100cd9:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
  100ce0:	8b 8b 04 4a 10 00    	mov    0x104a04(%ebx),%ecx
  100ce6:	85 c9                	test   %ecx,%ecx
  100ce8:	7f e6                	jg     100cd0 <check_block+0x28>
  100cea:	83 ec 0c             	sub    $0xc,%esp
  100ced:	56                   	push   %esi
  100cee:	e8 75 ff ff ff       	call   100c68 <get_from_block>
  100cf3:	58                   	pop    %eax
  100cf4:	5a                   	pop    %edx
  100cf5:	81 c3 c0 49 10 00    	add    $0x1049c0,%ebx
  100cfb:	53                   	push   %ebx
  100cfc:	56                   	push   %esi
  100cfd:	e8 06 fc ff ff       	call   100908 <put_into_runnable>
  100d02:	83 c4 10             	add    $0x10,%esp
  100d05:	a1 00 20 10 00       	mov    0x102000,%eax
  100d0a:	39 c6                	cmp    %eax,%esi
  100d0c:	75 c6                	jne    100cd4 <check_block+0x2c>
  100d0e:	66 90                	xchg   %ax,%ax
  100d10:	be 01 00 00 00       	mov    $0x1,%esi
  100d15:	89 f0                	mov    %esi,%eax
  100d17:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100d1a:	5b                   	pop    %ebx
  100d1b:	5e                   	pop    %esi
  100d1c:	5f                   	pop    %edi
  100d1d:	5d                   	pop    %ebp
  100d1e:	c3                   	ret    
  100d1f:	90                   	nop

00100d20 <checkTimeCount>:
  100d20:	a1 a4 29 10 00       	mov    0x1029a4,%eax
  100d25:	85 c0                	test   %eax,%eax
  100d27:	0f 84 f7 00 00 00    	je     100e24 <checkTimeCount+0x104>
  100d2d:	55                   	push   %ebp
  100d2e:	89 e5                	mov    %esp,%ebp
  100d30:	57                   	push   %edi
  100d31:	56                   	push   %esi
  100d32:	83 ec 0c             	sub    $0xc,%esp
  100d35:	68 d4 15 10 00       	push   $0x1015d4
  100d3a:	e8 59 06 00 00       	call   101398 <printk>
  100d3f:	5e                   	pop    %esi
  100d40:	ff 35 a0 29 10 00    	pushl  0x1029a0
  100d46:	68 bc 17 10 00       	push   $0x1017bc
  100d4b:	6a 30                	push   $0x30
  100d4d:	68 62 16 10 00       	push   $0x101662
  100d52:	68 8e 16 10 00       	push   $0x10168e
  100d57:	e8 3c 06 00 00       	call   101398 <printk>
  100d5c:	83 c4 14             	add    $0x14,%esp
  100d5f:	68 f6 15 10 00       	push   $0x1015f6
  100d64:	e8 2f 06 00 00       	call   101398 <printk>
  100d69:	c7 04 24 d4 15 10 00 	movl   $0x1015d4,(%esp)
  100d70:	e8 23 06 00 00       	call   101398 <printk>
  100d75:	5f                   	pop    %edi
  100d76:	a1 a0 29 10 00       	mov    0x1029a0,%eax
  100d7b:	89 c2                	mov    %eax,%edx
  100d7d:	c1 e2 07             	shl    $0x7,%edx
  100d80:	01 c2                	add    %eax,%edx
  100d82:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100d85:	01 d2                	add    %edx,%edx
  100d87:	01 d0                	add    %edx,%eax
  100d89:	ff 34 c5 00 4a 10 00 	pushl  0x104a00(,%eax,8)
  100d90:	68 bc 17 10 00       	push   $0x1017bc
  100d95:	6a 31                	push   $0x31
  100d97:	68 62 16 10 00       	push   $0x101662
  100d9c:	68 74 17 10 00       	push   $0x101774
  100da1:	e8 f2 05 00 00       	call   101398 <printk>
  100da6:	83 c4 14             	add    $0x14,%esp
  100da9:	68 f6 15 10 00       	push   $0x1015f6
  100dae:	e8 e5 05 00 00       	call   101398 <printk>
  100db3:	e8 f0 fe ff ff       	call   100ca8 <check_block>
  100db8:	8b 15 a0 29 10 00    	mov    0x1029a0,%edx
  100dbe:	89 d0                	mov    %edx,%eax
  100dc0:	c1 e0 07             	shl    $0x7,%eax
  100dc3:	01 d0                	add    %edx,%eax
  100dc5:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100dc8:	01 c0                	add    %eax,%eax
  100dca:	01 d0                	add    %edx,%eax
  100dcc:	c1 e0 03             	shl    $0x3,%eax
  100dcf:	83 c4 10             	add    $0x10,%esp
  100dd2:	8b 88 00 4a 10 00    	mov    0x104a00(%eax),%ecx
  100dd8:	85 c9                	test   %ecx,%ecx
  100dda:	7e 0c                	jle    100de8 <checkTimeCount+0xc8>
  100ddc:	b8 01 00 00 00       	mov    $0x1,%eax
  100de1:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100de4:	5e                   	pop    %esi
  100de5:	5f                   	pop    %edi
  100de6:	5d                   	pop    %ebp
  100de7:	c3                   	ret    
  100de8:	05 c0 49 10 00       	add    $0x1049c0,%eax
  100ded:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100df2:	89 c7                	mov    %eax,%edi
  100df4:	8b 75 08             	mov    0x8(%ebp),%esi
  100df7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100df9:	83 ec 08             	sub    $0x8,%esp
  100dfc:	ff 75 08             	pushl  0x8(%ebp)
  100dff:	52                   	push   %edx
  100e00:	e8 03 fb ff ff       	call   100908 <put_into_runnable>
  100e05:	e8 3a fa ff ff       	call   100844 <get_from_runnable>
  100e0a:	5a                   	pop    %edx
  100e0b:	59                   	pop    %ecx
  100e0c:	ff 75 08             	pushl  0x8(%ebp)
  100e0f:	50                   	push   %eax
  100e10:	e8 43 f8 ff ff       	call   100658 <put_into_running>
  100e15:	83 c4 10             	add    $0x10,%esp
  100e18:	b8 01 00 00 00       	mov    $0x1,%eax
  100e1d:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e20:	5e                   	pop    %esi
  100e21:	5f                   	pop    %edi
  100e22:	5d                   	pop    %ebp
  100e23:	c3                   	ret    
  100e24:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e29:	c3                   	ret    
  100e2a:	66 90                	xchg   %ax,%ax

00100e2c <check_is_in>:
  100e2c:	55                   	push   %ebp
  100e2d:	89 e5                	mov    %esp,%ebp
  100e2f:	53                   	push   %ebx
  100e30:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100e33:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100e36:	85 c9                	test   %ecx,%ecx
  100e38:	7e 4a                	jle    100e84 <check_is_in+0x58>
  100e3a:	39 d9                	cmp    %ebx,%ecx
  100e3c:	74 3b                	je     100e79 <check_is_in+0x4d>
  100e3e:	89 c8                	mov    %ecx,%eax
  100e40:	c1 e0 07             	shl    $0x7,%eax
  100e43:	01 c8                	add    %ecx,%eax
  100e45:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100e48:	01 c0                	add    %eax,%eax
  100e4a:	01 c8                	add    %ecx,%eax
  100e4c:	8b 04 c5 10 4a 10 00 	mov    0x104a10(,%eax,8),%eax
  100e53:	39 c1                	cmp    %eax,%ecx
  100e55:	75 1e                	jne    100e75 <check_is_in+0x49>
  100e57:	eb 2b                	jmp    100e84 <check_is_in+0x58>
  100e59:	8d 76 00             	lea    0x0(%esi),%esi
  100e5c:	89 c2                	mov    %eax,%edx
  100e5e:	c1 e2 07             	shl    $0x7,%edx
  100e61:	01 c2                	add    %eax,%edx
  100e63:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100e66:	01 d2                	add    %edx,%edx
  100e68:	01 d0                	add    %edx,%eax
  100e6a:	8b 04 c5 10 4a 10 00 	mov    0x104a10(,%eax,8),%eax
  100e71:	39 c1                	cmp    %eax,%ecx
  100e73:	74 0f                	je     100e84 <check_is_in+0x58>
  100e75:	39 c3                	cmp    %eax,%ebx
  100e77:	75 e3                	jne    100e5c <check_is_in+0x30>
  100e79:	b8 01 00 00 00       	mov    $0x1,%eax
  100e7e:	5b                   	pop    %ebx
  100e7f:	5d                   	pop    %ebp
  100e80:	c3                   	ret    
  100e81:	8d 76 00             	lea    0x0(%esi),%esi
  100e84:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e89:	5b                   	pop    %ebx
  100e8a:	5d                   	pop    %ebp
  100e8b:	c3                   	ret    

00100e8c <block_decrease>:
  100e8c:	55                   	push   %ebp
  100e8d:	89 e5                	mov    %esp,%ebp
  100e8f:	8b 0d 00 20 10 00    	mov    0x102000,%ecx
  100e95:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100e98:	74 2e                	je     100ec8 <block_decrease+0x3c>
  100e9a:	89 c8                	mov    %ecx,%eax
  100e9c:	89 c2                	mov    %eax,%edx
  100e9e:	c1 e2 07             	shl    $0x7,%edx
  100ea1:	01 c2                	add    %eax,%edx
  100ea3:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100ea6:	01 d2                	add    %edx,%edx
  100ea8:	01 d0                	add    %edx,%eax
  100eaa:	8d 04 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%eax
  100eb1:	ff 88 44 20 00 00    	decl   0x2044(%eax)
  100eb7:	8b 80 50 20 00 00    	mov    0x2050(%eax),%eax
  100ebd:	39 c1                	cmp    %eax,%ecx
  100ebf:	75 db                	jne    100e9c <block_decrease+0x10>
  100ec1:	b8 01 00 00 00       	mov    $0x1,%eax
  100ec6:	5d                   	pop    %ebp
  100ec7:	c3                   	ret    
  100ec8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100ecd:	5d                   	pop    %ebp
  100ece:	c3                   	ret    
  100ecf:	90                   	nop

00100ed0 <init_pcb>:
  100ed0:	55                   	push   %ebp
  100ed1:	89 e5                	mov    %esp,%ebp
  100ed3:	ba 08 4a 10 00       	mov    $0x104a08,%edx
  100ed8:	31 c0                	xor    %eax,%eax
  100eda:	66 90                	xchg   %ax,%ax
  100edc:	89 02                	mov    %eax,(%edx)
  100ede:	8d 48 ff             	lea    -0x1(%eax),%ecx
  100ee1:	89 4a 04             	mov    %ecx,0x4(%edx)
  100ee4:	40                   	inc    %eax
  100ee5:	89 42 08             	mov    %eax,0x8(%edx)
  100ee8:	81 c2 58 20 00 00    	add    $0x2058,%edx
  100eee:	3d 00 08 00 00       	cmp    $0x800,%eax
  100ef3:	75 e7                	jne    100edc <init_pcb+0xc>
  100ef5:	c7 05 0c 4a 10 00 ff 	movl   $0x7ff,0x104a0c
  100efc:	07 00 00 
  100eff:	c7 05 b8 e9 12 01 00 	movl   $0x0,0x112e9b8
  100f06:	00 00 00 
  100f09:	5d                   	pop    %ebp
  100f0a:	c3                   	ret    
  100f0b:	90                   	nop

00100f0c <init_kernel_pcb>:
  100f0c:	55                   	push   %ebp
  100f0d:	89 e5                	mov    %esp,%ebp
  100f0f:	c7 05 f8 49 10 00 10 	movl   $0x10,0x1049f8
  100f16:	00 00 00 
  100f19:	c7 05 ec 49 10 00 08 	movl   $0x8,0x1049ec
  100f20:	00 00 00 
  100f23:	c7 05 e8 49 10 00 50 	movl   $0x100650,0x1049e8
  100f2a:	06 10 00 
  100f2d:	c7 05 f4 49 10 00 00 	movl   $0x7f00000,0x1049f4
  100f34:	00 f0 07 
  100f37:	c7 05 fc 49 10 00 01 	movl   $0x1,0x1049fc
  100f3e:	00 00 00 
  100f41:	c7 05 00 4a 10 00 04 	movl   $0x4,0x104a00
  100f48:	00 00 00 
  100f4b:	b8 01 00 00 00       	mov    $0x1,%eax
  100f50:	5d                   	pop    %ebp
  100f51:	c3                   	ret    
  100f52:	66 90                	xchg   %ax,%ax

00100f54 <transfer_pid_state>:
  100f54:	55                   	push   %ebp
  100f55:	89 e5                	mov    %esp,%ebp
  100f57:	b8 01 00 00 00       	mov    $0x1,%eax
  100f5c:	5d                   	pop    %ebp
  100f5d:	c3                   	ret    
  100f5e:	66 90                	xchg   %ax,%ax

00100f60 <make_pcb>:
  100f60:	55                   	push   %ebp
  100f61:	89 e5                	mov    %esp,%ebp
  100f63:	57                   	push   %edi
  100f64:	56                   	push   %esi
  100f65:	8b 45 08             	mov    0x8(%ebp),%eax
  100f68:	89 c2                	mov    %eax,%edx
  100f6a:	c1 e2 07             	shl    $0x7,%edx
  100f6d:	01 c2                	add    %eax,%edx
  100f6f:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100f72:	01 d2                	add    %edx,%edx
  100f74:	01 c2                	add    %eax,%edx
  100f76:	c1 e2 03             	shl    $0x3,%edx
  100f79:	8d 82 c0 49 10 00    	lea    0x1049c0(%edx),%eax
  100f7f:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100f84:	89 c7                	mov    %eax,%edi
  100f86:	8b 75 0c             	mov    0xc(%ebp),%esi
  100f89:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100f8b:	8b 45 10             	mov    0x10(%ebp),%eax
  100f8e:	89 82 fc 49 10 00    	mov    %eax,0x1049fc(%edx)
  100f94:	8b 45 14             	mov    0x14(%ebp),%eax
  100f97:	89 82 00 4a 10 00    	mov    %eax,0x104a00(%edx)
  100f9d:	8b 45 18             	mov    0x18(%ebp),%eax
  100fa0:	89 82 04 4a 10 00    	mov    %eax,0x104a04(%edx)
  100fa6:	8b 45 0c             	mov    0xc(%ebp),%eax
  100fa9:	89 82 14 4a 10 00    	mov    %eax,0x104a14(%edx)
  100faf:	b8 01 00 00 00       	mov    $0x1,%eax
  100fb4:	5e                   	pop    %esi
  100fb5:	5f                   	pop    %edi
  100fb6:	5d                   	pop    %ebp
  100fb7:	c3                   	ret    

00100fb8 <initIdt>:
  100fb8:	55                   	push   %ebp
  100fb9:	89 e5                	mov    %esp,%ebp
  100fbb:	53                   	push   %ebx
  100fbc:	ba a3 15 10 00       	mov    $0x1015a3,%edx
  100fc1:	89 d3                	mov    %edx,%ebx
  100fc3:	c1 ea 10             	shr    $0x10,%edx
  100fc6:	b9 80 f2 12 01       	mov    $0x112f280,%ecx
  100fcb:	b8 80 ea 12 01       	mov    $0x112ea80,%eax
  100fd0:	66 89 18             	mov    %bx,(%eax)
  100fd3:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100fd9:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100fdd:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100fe1:	66 89 50 06          	mov    %dx,0x6(%eax)
  100fe5:	83 c0 08             	add    $0x8,%eax
  100fe8:	39 c1                	cmp    %eax,%ecx
  100fea:	75 e4                	jne    100fd0 <initIdt+0x18>
  100fec:	b8 a9 15 10 00       	mov    $0x1015a9,%eax
  100ff1:	66 a3 e8 ea 12 01    	mov    %ax,0x112eae8
  100ff7:	66 c7 05 ea ea 12 01 	movw   $0x8,0x112eaea
  100ffe:	08 00 
  101000:	c6 05 ec ea 12 01 00 	movb   $0x0,0x112eaec
  101007:	c6 05 ed ea 12 01 8f 	movb   $0x8f,0x112eaed
  10100e:	c1 e8 10             	shr    $0x10,%eax
  101011:	66 a3 ee ea 12 01    	mov    %ax,0x112eaee
  101017:	b8 ad 15 10 00       	mov    $0x1015ad,%eax
  10101c:	66 a3 80 ee 12 01    	mov    %ax,0x112ee80
  101022:	66 c7 05 82 ee 12 01 	movw   $0x8,0x112ee82
  101029:	08 00 
  10102b:	c6 05 84 ee 12 01 00 	movb   $0x0,0x112ee84
  101032:	c6 05 85 ee 12 01 ee 	movb   $0xee,0x112ee85
  101039:	c1 e8 10             	shr    $0x10,%eax
  10103c:	66 a3 86 ee 12 01    	mov    %ax,0x112ee86
  101042:	b8 b6 15 10 00       	mov    $0x1015b6,%eax
  101047:	66 a3 80 eb 12 01    	mov    %ax,0x112eb80
  10104d:	66 c7 05 82 eb 12 01 	movw   $0x8,0x112eb82
  101054:	08 00 
  101056:	c6 05 84 eb 12 01 00 	movb   $0x0,0x112eb84
  10105d:	c6 05 85 eb 12 01 8e 	movb   $0x8e,0x112eb85
  101064:	c1 e8 10             	shr    $0x10,%eax
  101067:	66 a3 86 eb 12 01    	mov    %ax,0x112eb86
  10106d:	66 c7 05 30 21 10 00 	movw   $0x7ff,0x102130
  101074:	ff 07 
  101076:	b8 80 ea 12 01       	mov    $0x112ea80,%eax
  10107b:	66 a3 32 21 10 00    	mov    %ax,0x102132
  101081:	c1 e8 10             	shr    $0x10,%eax
  101084:	66 a3 34 21 10 00    	mov    %ax,0x102134
  10108a:	b8 30 21 10 00       	mov    $0x102130,%eax
  10108f:	0f 01 18             	lidtl  (%eax)
  101092:	5b                   	pop    %ebx
  101093:	5d                   	pop    %ebp
  101094:	c3                   	ret    
  101095:	66 90                	xchg   %ax,%ax
  101097:	90                   	nop

00101098 <syscallHandle>:
  101098:	55                   	push   %ebp
  101099:	89 e5                	mov    %esp,%ebp
  10109b:	53                   	push   %ebx
  10109c:	50                   	push   %eax
  10109d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1010a0:	8b 43 1c             	mov    0x1c(%ebx),%eax
  1010a3:	83 f8 02             	cmp    $0x2,%eax
  1010a6:	74 28                	je     1010d0 <syscallHandle+0x38>
  1010a8:	76 3a                	jbe    1010e4 <syscallHandle+0x4c>
  1010aa:	83 f8 04             	cmp    $0x4,%eax
  1010ad:	74 15                	je     1010c4 <syscallHandle+0x2c>
  1010af:	3d e6 00 00 00       	cmp    $0xe6,%eax
  1010b4:	75 29                	jne    1010df <syscallHandle+0x47>
  1010b6:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1010b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1010bc:	c9                   	leave  
  1010bd:	e9 16 f3 ff ff       	jmp    1003d8 <sys_sleep>
  1010c2:	66 90                	xchg   %ax,%ax
  1010c4:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1010c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1010ca:	c9                   	leave  
  1010cb:	e9 d8 f4 ff ff       	jmp    1005a8 <sys_write>
  1010d0:	83 ec 0c             	sub    $0xc,%esp
  1010d3:	53                   	push   %ebx
  1010d4:	e8 83 f3 ff ff       	call   10045c <sys_fork>
  1010d9:	89 43 1c             	mov    %eax,0x1c(%ebx)
  1010dc:	83 c4 10             	add    $0x10,%esp
  1010df:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1010e2:	c9                   	leave  
  1010e3:	c3                   	ret    
  1010e4:	48                   	dec    %eax
  1010e5:	75 f8                	jne    1010df <syscallHandle+0x47>
  1010e7:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1010ea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1010ed:	c9                   	leave  
  1010ee:	e9 c5 f2 ff ff       	jmp    1003b8 <sys_exit>
  1010f3:	90                   	nop

001010f4 <GProtectFaultHandle>:
  1010f4:	55                   	push   %ebp
  1010f5:	89 e5                	mov    %esp,%ebp
  1010f7:	83 ec 14             	sub    $0x14,%esp
  1010fa:	68 d4 15 10 00       	push   $0x1015d4
  1010ff:	e8 94 02 00 00       	call   101398 <printk>
  101104:	58                   	pop    %eax
  101105:	8b 45 08             	mov    0x8(%ebp),%eax
  101108:	ff 70 20             	pushl  0x20(%eax)
  10110b:	68 08 18 10 00       	push   $0x101808
  101110:	6a 57                	push   $0x57
  101112:	68 dd 17 10 00       	push   $0x1017dd
  101117:	68 f0 17 10 00       	push   $0x1017f0
  10111c:	e8 77 02 00 00       	call   101398 <printk>
  101121:	83 c4 14             	add    $0x14,%esp
  101124:	68 f6 15 10 00       	push   $0x1015f6
  101129:	e8 6a 02 00 00       	call   101398 <printk>
  10112e:	5a                   	pop    %edx
  10112f:	59                   	pop    %ecx
  101130:	6a 58                	push   $0x58
  101132:	68 dd 17 10 00       	push   $0x1017dd
  101137:	e8 d0 03 00 00       	call   10150c <abort>
  10113c:	83 c4 10             	add    $0x10,%esp
  10113f:	c9                   	leave  
  101140:	c3                   	ret    
  101141:	8d 76 00             	lea    0x0(%esi),%esi

00101144 <timeHandle>:
  101144:	55                   	push   %ebp
  101145:	89 e5                	mov    %esp,%ebp
  101147:	53                   	push   %ebx
  101148:	83 ec 10             	sub    $0x10,%esp
  10114b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10114e:	6a 41                	push   $0x41
  101150:	e8 df f4 ff ff       	call   100634 <putChar>
  101155:	e8 ba f6 ff ff       	call   100814 <getpid>
  10115a:	89 c2                	mov    %eax,%edx
  10115c:	c1 e2 07             	shl    $0x7,%edx
  10115f:	01 c2                	add    %eax,%edx
  101161:	8d 14 90             	lea    (%eax,%edx,4),%edx
  101164:	01 d2                	add    %edx,%edx
  101166:	01 d0                	add    %edx,%eax
  101168:	ff 0c c5 00 4a 10 00 	decl   0x104a00(,%eax,8)
  10116f:	e8 18 fd ff ff       	call   100e8c <block_decrease>
  101174:	89 1c 24             	mov    %ebx,(%esp)
  101177:	e8 a4 fb ff ff       	call   100d20 <checkTimeCount>
  10117c:	83 c4 10             	add    $0x10,%esp
  10117f:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  101186:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101189:	c9                   	leave  
  10118a:	e9 a5 f4 ff ff       	jmp    100634 <putChar>
  10118f:	90                   	nop

00101190 <irqHandle>:
  101190:	55                   	push   %ebp
  101191:	89 e5                	mov    %esp,%ebp
  101193:	53                   	push   %ebx
  101194:	83 ec 14             	sub    $0x14,%esp
  101197:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10119a:	89 6d f4             	mov    %ebp,-0xc(%ebp)
  10119d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1011a0:	3b 58 08             	cmp    0x8(%eax),%ebx
  1011a3:	74 12                	je     1011b7 <irqHandle+0x27>
  1011a5:	83 ec 08             	sub    $0x8,%esp
  1011a8:	6a 1c                	push   $0x1c
  1011aa:	68 dd 17 10 00       	push   $0x1017dd
  1011af:	e8 58 03 00 00       	call   10150c <abort>
  1011b4:	83 c4 10             	add    $0x10,%esp
  1011b7:	fa                   	cli    
  1011b8:	8b 43 20             	mov    0x20(%ebx),%eax
  1011bb:	83 f8 0d             	cmp    $0xd,%eax
  1011be:	74 48                	je     101208 <irqHandle+0x78>
  1011c0:	7e 2e                	jle    1011f0 <irqHandle+0x60>
  1011c2:	83 f8 20             	cmp    $0x20,%eax
  1011c5:	74 19                	je     1011e0 <irqHandle+0x50>
  1011c7:	83 c0 80             	add    $0xffffff80,%eax
  1011ca:	75 27                	jne    1011f3 <irqHandle+0x63>
  1011cc:	83 ec 0c             	sub    $0xc,%esp
  1011cf:	53                   	push   %ebx
  1011d0:	e8 c3 fe ff ff       	call   101098 <syscallHandle>
  1011d5:	83 c4 10             	add    $0x10,%esp
  1011d8:	fb                   	sti    
  1011d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1011dc:	c9                   	leave  
  1011dd:	c3                   	ret    
  1011de:	66 90                	xchg   %ax,%ax
  1011e0:	83 ec 0c             	sub    $0xc,%esp
  1011e3:	53                   	push   %ebx
  1011e4:	e8 5b ff ff ff       	call   101144 <timeHandle>
  1011e9:	83 c4 10             	add    $0x10,%esp
  1011ec:	eb ea                	jmp    1011d8 <irqHandle+0x48>
  1011ee:	66 90                	xchg   %ax,%ax
  1011f0:	40                   	inc    %eax
  1011f1:	74 e5                	je     1011d8 <irqHandle+0x48>
  1011f3:	83 ec 08             	sub    $0x8,%esp
  1011f6:	6a 30                	push   $0x30
  1011f8:	68 dd 17 10 00       	push   $0x1017dd
  1011fd:	e8 0a 03 00 00       	call   10150c <abort>
  101202:	83 c4 10             	add    $0x10,%esp
  101205:	eb d1                	jmp    1011d8 <irqHandle+0x48>
  101207:	90                   	nop
  101208:	83 ec 0c             	sub    $0xc,%esp
  10120b:	53                   	push   %ebx
  10120c:	e8 e3 fe ff ff       	call   1010f4 <GProtectFaultHandle>
  101211:	83 c4 10             	add    $0x10,%esp
  101214:	eb c2                	jmp    1011d8 <irqHandle+0x48>
  101216:	66 90                	xchg   %ax,%ax

00101218 <initIntr>:
  101218:	55                   	push   %ebp
  101219:	89 e5                	mov    %esp,%ebp
  10121b:	ba 21 00 00 00       	mov    $0x21,%edx
  101220:	b0 ff                	mov    $0xff,%al
  101222:	ee                   	out    %al,(%dx)
  101223:	ba a1 00 00 00       	mov    $0xa1,%edx
  101228:	ee                   	out    %al,(%dx)
  101229:	ba 20 00 00 00       	mov    $0x20,%edx
  10122e:	b0 11                	mov    $0x11,%al
  101230:	ee                   	out    %al,(%dx)
  101231:	ba 21 00 00 00       	mov    $0x21,%edx
  101236:	b0 20                	mov    $0x20,%al
  101238:	ee                   	out    %al,(%dx)
  101239:	b0 04                	mov    $0x4,%al
  10123b:	ee                   	out    %al,(%dx)
  10123c:	b0 03                	mov    $0x3,%al
  10123e:	ee                   	out    %al,(%dx)
  10123f:	ba a0 00 00 00       	mov    $0xa0,%edx
  101244:	b0 11                	mov    $0x11,%al
  101246:	ee                   	out    %al,(%dx)
  101247:	ba a1 00 00 00       	mov    $0xa1,%edx
  10124c:	b0 28                	mov    $0x28,%al
  10124e:	ee                   	out    %al,(%dx)
  10124f:	b0 02                	mov    $0x2,%al
  101251:	ee                   	out    %al,(%dx)
  101252:	b0 03                	mov    $0x3,%al
  101254:	ee                   	out    %al,(%dx)
  101255:	ba 20 00 00 00       	mov    $0x20,%edx
  10125a:	b0 68                	mov    $0x68,%al
  10125c:	ee                   	out    %al,(%dx)
  10125d:	b0 0a                	mov    $0xa,%al
  10125f:	ee                   	out    %al,(%dx)
  101260:	ba a0 00 00 00       	mov    $0xa0,%edx
  101265:	b0 68                	mov    $0x68,%al
  101267:	ee                   	out    %al,(%dx)
  101268:	b0 0a                	mov    $0xa,%al
  10126a:	ee                   	out    %al,(%dx)
  10126b:	5d                   	pop    %ebp
  10126c:	c3                   	ret    
  10126d:	8d 76 00             	lea    0x0(%esi),%esi

00101270 <initTimer>:
  101270:	55                   	push   %ebp
  101271:	89 e5                	mov    %esp,%ebp
  101273:	ba 43 00 00 00       	mov    $0x43,%edx
  101278:	b0 34                	mov    $0x34,%al
  10127a:	ee                   	out    %al,(%dx)
  10127b:	ba 40 00 00 00       	mov    $0x40,%edx
  101280:	b0 9b                	mov    $0x9b,%al
  101282:	ee                   	out    %al,(%dx)
  101283:	b0 2e                	mov    $0x2e,%al
  101285:	ee                   	out    %al,(%dx)
  101286:	5d                   	pop    %ebp
  101287:	c3                   	ret    

00101288 <i2A>:
  101288:	55                   	push   %ebp
  101289:	89 e5                	mov    %esp,%ebp
  10128b:	57                   	push   %edi
  10128c:	56                   	push   %esi
  10128d:	53                   	push   %ebx
  10128e:	51                   	push   %ecx
  10128f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101292:	85 c9                	test   %ecx,%ecx
  101294:	78 6e                	js     101304 <i2A+0x7c>
  101296:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  10129a:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  10129e:	bb 7e 21 10 00       	mov    $0x10217e,%ebx
  1012a3:	31 ff                	xor    %edi,%edi
  1012a5:	eb 03                	jmp    1012aa <i2A+0x22>
  1012a7:	90                   	nop
  1012a8:	89 f7                	mov    %esi,%edi
  1012aa:	4b                   	dec    %ebx
  1012ab:	89 c8                	mov    %ecx,%eax
  1012ad:	be 0a 00 00 00       	mov    $0xa,%esi
  1012b2:	99                   	cltd   
  1012b3:	f7 fe                	idiv   %esi
  1012b5:	83 c2 30             	add    $0x30,%edx
  1012b8:	88 13                	mov    %dl,(%ebx)
  1012ba:	8d 77 01             	lea    0x1(%edi),%esi
  1012bd:	b8 67 66 66 66       	mov    $0x66666667,%eax
  1012c2:	f7 e9                	imul   %ecx
  1012c4:	89 d0                	mov    %edx,%eax
  1012c6:	c1 f8 02             	sar    $0x2,%eax
  1012c9:	c1 f9 1f             	sar    $0x1f,%ecx
  1012cc:	29 c8                	sub    %ecx,%eax
  1012ce:	89 c1                	mov    %eax,%ecx
  1012d0:	75 d6                	jne    1012a8 <i2A+0x20>
  1012d2:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  1012d6:	74 20                	je     1012f8 <i2A+0x70>
  1012d8:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  1012dc:	75 06                	jne    1012e4 <i2A+0x5c>
  1012de:	fe 05 7d 21 10 00    	incb   0x10217d
  1012e4:	c6 05 7e 21 10 00 00 	movb   $0x0,0x10217e
  1012eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1012ee:	89 18                	mov    %ebx,(%eax)
  1012f0:	89 f0                	mov    %esi,%eax
  1012f2:	5a                   	pop    %edx
  1012f3:	5b                   	pop    %ebx
  1012f4:	5e                   	pop    %esi
  1012f5:	5f                   	pop    %edi
  1012f6:	5d                   	pop    %ebp
  1012f7:	c3                   	ret    
  1012f8:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  1012fc:	8d 77 02             	lea    0x2(%edi),%esi
  1012ff:	4b                   	dec    %ebx
  101300:	eb d6                	jmp    1012d8 <i2A+0x50>
  101302:	66 90                	xchg   %ax,%ax
  101304:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  10130a:	74 0c                	je     101318 <i2A+0x90>
  10130c:	f7 d9                	neg    %ecx
  10130e:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  101312:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  101316:	eb 86                	jmp    10129e <i2A+0x16>
  101318:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  10131d:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101321:	eb ef                	jmp    101312 <i2A+0x8a>
  101323:	90                   	nop

00101324 <i2X>:
  101324:	55                   	push   %ebp
  101325:	89 e5                	mov    %esp,%ebp
  101327:	57                   	push   %edi
  101328:	56                   	push   %esi
  101329:	53                   	push   %ebx
  10132a:	8b 55 08             	mov    0x8(%ebp),%edx
  10132d:	b9 5d 21 10 00       	mov    $0x10215d,%ecx
  101332:	31 c0                	xor    %eax,%eax
  101334:	40                   	inc    %eax
  101335:	89 d6                	mov    %edx,%esi
  101337:	83 e6 0f             	and    $0xf,%esi
  10133a:	8d 5e f6             	lea    -0xa(%esi),%ebx
  10133d:	89 cf                	mov    %ecx,%edi
  10133f:	83 fb 05             	cmp    $0x5,%ebx
  101342:	77 4c                	ja     101390 <i2X+0x6c>
  101344:	ff 24 9d 1c 18 10 00 	jmp    *0x10181c(,%ebx,4)
  10134b:	90                   	nop
  10134c:	c6 01 65             	movb   $0x65,(%ecx)
  10134f:	90                   	nop
  101350:	49                   	dec    %ecx
  101351:	c1 ea 04             	shr    $0x4,%edx
  101354:	75 de                	jne    101334 <i2X+0x10>
  101356:	c6 05 5e 21 10 00 00 	movb   $0x0,0x10215e
  10135d:	8b 55 0c             	mov    0xc(%ebp),%edx
  101360:	89 3a                	mov    %edi,(%edx)
  101362:	5b                   	pop    %ebx
  101363:	5e                   	pop    %esi
  101364:	5f                   	pop    %edi
  101365:	5d                   	pop    %ebp
  101366:	c3                   	ret    
  101367:	90                   	nop
  101368:	c6 01 64             	movb   $0x64,(%ecx)
  10136b:	eb e3                	jmp    101350 <i2X+0x2c>
  10136d:	8d 76 00             	lea    0x0(%esi),%esi
  101370:	c6 01 63             	movb   $0x63,(%ecx)
  101373:	eb db                	jmp    101350 <i2X+0x2c>
  101375:	8d 76 00             	lea    0x0(%esi),%esi
  101378:	c6 01 62             	movb   $0x62,(%ecx)
  10137b:	eb d3                	jmp    101350 <i2X+0x2c>
  10137d:	8d 76 00             	lea    0x0(%esi),%esi
  101380:	c6 01 61             	movb   $0x61,(%ecx)
  101383:	eb cb                	jmp    101350 <i2X+0x2c>
  101385:	8d 76 00             	lea    0x0(%esi),%esi
  101388:	c6 01 66             	movb   $0x66,(%ecx)
  10138b:	eb c3                	jmp    101350 <i2X+0x2c>
  10138d:	8d 76 00             	lea    0x0(%esi),%esi
  101390:	8d 5e 30             	lea    0x30(%esi),%ebx
  101393:	88 19                	mov    %bl,(%ecx)
  101395:	eb b9                	jmp    101350 <i2X+0x2c>
  101397:	90                   	nop

00101398 <printk>:
  101398:	55                   	push   %ebp
  101399:	89 e5                	mov    %esp,%ebp
  10139b:	57                   	push   %edi
  10139c:	56                   	push   %esi
  10139d:	53                   	push   %ebx
  10139e:	83 ec 2c             	sub    $0x2c,%esp
  1013a1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1013a4:	8a 11                	mov    (%ecx),%dl
  1013a6:	84 d2                	test   %dl,%dl
  1013a8:	0f 84 54 01 00 00    	je     101502 <printk+0x16a>
  1013ae:	8d 45 0c             	lea    0xc(%ebp),%eax
  1013b1:	31 ff                	xor    %edi,%edi
  1013b3:	eb 18                	jmp    1013cd <printk+0x35>
  1013b5:	8d 76 00             	lea    0x0(%esi),%esi
  1013b8:	8a 11                	mov    (%ecx),%dl
  1013ba:	89 cb                	mov    %ecx,%ebx
  1013bc:	88 97 80 21 10 00    	mov    %dl,0x102180(%edi)
  1013c2:	47                   	inc    %edi
  1013c3:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1013c6:	8a 53 01             	mov    0x1(%ebx),%dl
  1013c9:	84 d2                	test   %dl,%dl
  1013cb:	74 72                	je     10143f <printk+0xa7>
  1013cd:	80 fa 25             	cmp    $0x25,%dl
  1013d0:	75 e6                	jne    1013b8 <printk+0x20>
  1013d2:	8d 59 01             	lea    0x1(%ecx),%ebx
  1013d5:	8a 51 01             	mov    0x1(%ecx),%dl
  1013d8:	80 fa 64             	cmp    $0x64,%dl
  1013db:	0f 84 bf 00 00 00    	je     1014a0 <printk+0x108>
  1013e1:	0f 8e 01 01 00 00    	jle    1014e8 <printk+0x150>
  1013e7:	80 fa 73             	cmp    $0x73,%dl
  1013ea:	0f 84 84 00 00 00    	je     101474 <printk+0xdc>
  1013f0:	80 fa 78             	cmp    $0x78,%dl
  1013f3:	75 c7                	jne    1013bc <printk+0x24>
  1013f5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1013fc:	8d 70 04             	lea    0x4(%eax),%esi
  1013ff:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101402:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101405:	56                   	push   %esi
  101406:	ff 30                	pushl  (%eax)
  101408:	e8 17 ff ff ff       	call   101324 <i2X>
  10140d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  101410:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  101416:	8a 11                	mov    (%ecx),%dl
  101418:	83 c4 08             	add    $0x8,%esp
  10141b:	31 c0                	xor    %eax,%eax
  10141d:	84 d2                	test   %dl,%dl
  10141f:	74 0f                	je     101430 <printk+0x98>
  101421:	8d 76 00             	lea    0x0(%esi),%esi
  101424:	40                   	inc    %eax
  101425:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101429:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  10142c:	84 d2                	test   %dl,%dl
  10142e:	75 f4                	jne    101424 <printk+0x8c>
  101430:	01 c7                	add    %eax,%edi
  101432:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101435:	8d 4b 01             	lea    0x1(%ebx),%ecx
  101438:	8a 53 01             	mov    0x1(%ebx),%dl
  10143b:	84 d2                	test   %dl,%dl
  10143d:	75 8e                	jne    1013cd <printk+0x35>
  10143f:	c6 87 80 21 10 00 00 	movb   $0x0,0x102180(%edi)
  101446:	0f be 05 80 21 10 00 	movsbl 0x102180,%eax
  10144d:	bb 80 21 10 00       	mov    $0x102180,%ebx
  101452:	84 c0                	test   %al,%al
  101454:	74 16                	je     10146c <printk+0xd4>
  101456:	66 90                	xchg   %ax,%ax
  101458:	83 ec 0c             	sub    $0xc,%esp
  10145b:	50                   	push   %eax
  10145c:	e8 d3 f1 ff ff       	call   100634 <putChar>
  101461:	43                   	inc    %ebx
  101462:	0f be 03             	movsbl (%ebx),%eax
  101465:	83 c4 10             	add    $0x10,%esp
  101468:	84 c0                	test   %al,%al
  10146a:	75 ec                	jne    101458 <printk+0xc0>
  10146c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10146f:	5b                   	pop    %ebx
  101470:	5e                   	pop    %esi
  101471:	5f                   	pop    %edi
  101472:	5d                   	pop    %ebp
  101473:	c3                   	ret    
  101474:	8d 70 04             	lea    0x4(%eax),%esi
  101477:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10147a:	8b 08                	mov    (%eax),%ecx
  10147c:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  101482:	8a 11                	mov    (%ecx),%dl
  101484:	31 c0                	xor    %eax,%eax
  101486:	84 d2                	test   %dl,%dl
  101488:	74 a6                	je     101430 <printk+0x98>
  10148a:	66 90                	xchg   %ax,%ax
  10148c:	40                   	inc    %eax
  10148d:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101491:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  101494:	84 d2                	test   %dl,%dl
  101496:	75 f4                	jne    10148c <printk+0xf4>
  101498:	01 c7                	add    %eax,%edi
  10149a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10149d:	eb 96                	jmp    101435 <printk+0x9d>
  10149f:	90                   	nop
  1014a0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1014a7:	8d 70 04             	lea    0x4(%eax),%esi
  1014aa:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1014ad:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  1014b0:	56                   	push   %esi
  1014b1:	ff 30                	pushl  (%eax)
  1014b3:	e8 d0 fd ff ff       	call   101288 <i2A>
  1014b8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1014bb:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  1014c1:	8a 11                	mov    (%ecx),%dl
  1014c3:	83 c4 08             	add    $0x8,%esp
  1014c6:	31 c0                	xor    %eax,%eax
  1014c8:	84 d2                	test   %dl,%dl
  1014ca:	0f 84 60 ff ff ff    	je     101430 <printk+0x98>
  1014d0:	40                   	inc    %eax
  1014d1:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1014d5:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  1014d8:	84 d2                	test   %dl,%dl
  1014da:	75 f4                	jne    1014d0 <printk+0x138>
  1014dc:	01 c7                	add    %eax,%edi
  1014de:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1014e1:	e9 4f ff ff ff       	jmp    101435 <printk+0x9d>
  1014e6:	66 90                	xchg   %ax,%ax
  1014e8:	80 fa 63             	cmp    $0x63,%dl
  1014eb:	0f 85 cb fe ff ff    	jne    1013bc <printk+0x24>
  1014f1:	8b 10                	mov    (%eax),%edx
  1014f3:	88 97 80 21 10 00    	mov    %dl,0x102180(%edi)
  1014f9:	83 c0 04             	add    $0x4,%eax
  1014fc:	47                   	inc    %edi
  1014fd:	e9 c1 fe ff ff       	jmp    1013c3 <printk+0x2b>
  101502:	31 ff                	xor    %edi,%edi
  101504:	e9 36 ff ff ff       	jmp    10143f <printk+0xa7>
  101509:	66 90                	xchg   %ax,%ax
  10150b:	90                   	nop

0010150c <abort>:
  10150c:	55                   	push   %ebp
  10150d:	89 e5                	mov    %esp,%ebp
  10150f:	57                   	push   %edi
  101510:	56                   	push   %esi
  101511:	53                   	push   %ebx
  101512:	83 ec 1c             	sub    $0x1c,%esp
  101515:	8b 55 08             	mov    0x8(%ebp),%edx
  101518:	fa                   	cli    
  101519:	8a 02                	mov    (%edx),%al
  10151b:	b9 32 20 10 00       	mov    $0x102032,%ecx
  101520:	84 c0                	test   %al,%al
  101522:	74 0b                	je     10152f <abort+0x23>
  101524:	41                   	inc    %ecx
  101525:	42                   	inc    %edx
  101526:	88 41 ff             	mov    %al,-0x1(%ecx)
  101529:	8a 02                	mov    (%edx),%al
  10152b:	84 c0                	test   %al,%al
  10152d:	75 f5                	jne    101524 <abort+0x18>
  10152f:	c6 01 3a             	movb   $0x3a,(%ecx)
  101532:	bb 9d 29 10 00       	mov    $0x10299d,%ebx
  101537:	be 0a 00 00 00       	mov    $0xa,%esi
  10153c:	bf 67 66 66 66       	mov    $0x66666667,%edi
  101541:	4b                   	dec    %ebx
  101542:	8b 45 0c             	mov    0xc(%ebp),%eax
  101545:	99                   	cltd   
  101546:	f7 fe                	idiv   %esi
  101548:	8d 42 30             	lea    0x30(%edx),%eax
  10154b:	88 45 e7             	mov    %al,-0x19(%ebp)
  10154e:	88 03                	mov    %al,(%ebx)
  101550:	89 f8                	mov    %edi,%eax
  101552:	f7 6d 0c             	imull  0xc(%ebp)
  101555:	c1 fa 02             	sar    $0x2,%edx
  101558:	8b 45 0c             	mov    0xc(%ebp),%eax
  10155b:	c1 f8 1f             	sar    $0x1f,%eax
  10155e:	29 c2                	sub    %eax,%edx
  101560:	89 55 0c             	mov    %edx,0xc(%ebp)
  101563:	75 dc                	jne    101541 <abort+0x35>
  101565:	41                   	inc    %ecx
  101566:	41                   	inc    %ecx
  101567:	43                   	inc    %ebx
  101568:	8a 45 e7             	mov    -0x19(%ebp),%al
  10156b:	88 41 ff             	mov    %al,-0x1(%ecx)
  10156e:	8a 03                	mov    (%ebx),%al
  101570:	88 45 e7             	mov    %al,-0x19(%ebp)
  101573:	84 c0                	test   %al,%al
  101575:	75 ef                	jne    101566 <abort+0x5a>
  101577:	c6 01 0a             	movb   $0xa,(%ecx)
  10157a:	0f be 05 20 20 10 00 	movsbl 0x102020,%eax
  101581:	84 c0                	test   %al,%al
  101583:	74 1b                	je     1015a0 <abort+0x94>
  101585:	bb 20 20 10 00       	mov    $0x102020,%ebx
  10158a:	83 ec 0c             	sub    $0xc,%esp
  10158d:	50                   	push   %eax
  10158e:	e8 a1 f0 ff ff       	call   100634 <putChar>
  101593:	43                   	inc    %ebx
  101594:	0f be 03             	movsbl (%ebx),%eax
  101597:	83 c4 10             	add    $0x10,%esp
  10159a:	84 c0                	test   %al,%al
  10159c:	75 ec                	jne    10158a <abort+0x7e>
  10159e:	66 90                	xchg   %ax,%ax
  1015a0:	f4                   	hlt    
  1015a1:	eb fd                	jmp    1015a0 <abort+0x94>

001015a3 <irqEmpty>:
  1015a3:	6a 00                	push   $0x0
  1015a5:	6a ff                	push   $0xffffffff
  1015a7:	eb 13                	jmp    1015bc <asmDoIrq>

001015a9 <irqGProtectFault>:
  1015a9:	6a 0d                	push   $0xd
  1015ab:	eb 0f                	jmp    1015bc <asmDoIrq>

001015ad <irqSyscall>:
  1015ad:	6a 00                	push   $0x0
  1015af:	68 80 00 00 00       	push   $0x80
  1015b4:	eb 06                	jmp    1015bc <asmDoIrq>

001015b6 <irqTime>:
  1015b6:	6a 00                	push   $0x0
  1015b8:	6a 20                	push   $0x20
  1015ba:	eb 00                	jmp    1015bc <asmDoIrq>

001015bc <asmDoIrq>:
  1015bc:	60                   	pusha  
  1015bd:	54                   	push   %esp
  1015be:	e8 cd fb ff ff       	call   101190 <irqHandle>
  1015c3:	5c                   	pop    %esp
  1015c4:	61                   	popa   
  1015c5:	83 c4 04             	add    $0x4,%esp
  1015c8:	83 c4 04             	add    $0x4,%esp
  1015cb:	cf                   	iret   
