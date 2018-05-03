
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 fd 11 00 00       	call   101208 <initTimer>
  10000b:	e8 58 0e 00 00       	call   100e68 <init_pcb>
  100010:	e8 8f 0e 00 00       	call   100ea4 <init_kernel_pcb>
  100015:	e8 da 05 00 00       	call   1005f4 <initSerial>
  10001a:	e8 31 0f 00 00       	call   100f50 <initIdt>
  10001f:	e8 8c 11 00 00       	call   1011b0 <initIntr>
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
  1001ed:	a1 64 15 10 00       	mov    0x101564,%eax
  1001f2:	8b 15 68 15 10 00    	mov    0x101568,%edx
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
  10029f:	83 ec 14             	sub    $0x14,%esp
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
  1002dc:	6a 01                	push   $0x1
  1002de:	e8 d5 05 00 00       	call   1008b8 <put_into_runnable>
  1002e3:	a1 f8 49 10 00       	mov    0x1049f8,%eax
  1002e8:	50                   	push   %eax
  1002e9:	a1 f4 49 10 00       	mov    0x1049f4,%eax
  1002ee:	50                   	push   %eax
  1002ef:	9c                   	pushf  
  1002f0:	a1 ec 49 10 00       	mov    0x1049ec,%eax
  1002f5:	50                   	push   %eax
  1002f6:	a1 e8 49 10 00       	mov    0x1049e8,%eax
  1002fb:	50                   	push   %eax
  1002fc:	cf                   	iret   
  1002fd:	83 c4 10             	add    $0x10,%esp
  100300:	c9                   	leave  
  100301:	c3                   	ret    
  100302:	66 90                	xchg   %ax,%ax

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
  1003be:	e8 31 04 00 00       	call   1007f4 <get_from_runnable>
  1003c3:	83 ec 08             	sub    $0x8,%esp
  1003c6:	ff 75 08             	pushl  0x8(%ebp)
  1003c9:	50                   	push   %eax
  1003ca:	e8 bd 03 00 00       	call   10078c <put_into_running>
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
  1003e0:	e8 df 03 00 00       	call   1007c4 <getpid>
  1003e5:	83 ec 08             	sub    $0x8,%esp
  1003e8:	53                   	push   %ebx
  1003e9:	50                   	push   %eax
  1003ea:	e8 ed 05 00 00       	call   1009dc <put_into_block>
  1003ef:	c7 04 24 6c 15 10 00 	movl   $0x10156c,(%esp)
  1003f6:	e8 35 0f 00 00       	call   101330 <printk>
  1003fb:	e8 c4 03 00 00       	call   1007c4 <getpid>
  100400:	89 c2                	mov    %eax,%edx
  100402:	c1 e2 07             	shl    $0x7,%edx
  100405:	01 c2                	add    %eax,%edx
  100407:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10040a:	01 d2                	add    %edx,%edx
  10040c:	01 d0                	add    %edx,%eax
  10040e:	8b 34 c5 04 4a 10 00 	mov    0x104a04(,%eax,8),%esi
  100415:	e8 aa 03 00 00       	call   1007c4 <getpid>
  10041a:	5a                   	pop    %edx
  10041b:	59                   	pop    %ecx
  10041c:	56                   	push   %esi
  10041d:	50                   	push   %eax
  10041e:	68 b8 15 10 00       	push   $0x1015b8
  100423:	6a 09                	push   $0x9
  100425:	68 72 15 10 00       	push   $0x101572
  10042a:	68 94 15 10 00       	push   $0x101594
  10042f:	e8 fc 0e 00 00       	call   101330 <printk>
  100434:	83 c4 14             	add    $0x14,%esp
  100437:	68 8e 15 10 00       	push   $0x10158e
  10043c:	e8 ef 0e 00 00       	call   101330 <printk>
  100441:	e8 ae 03 00 00       	call   1007f4 <get_from_runnable>
  100446:	5e                   	pop    %esi
  100447:	5a                   	pop    %edx
  100448:	53                   	push   %ebx
  100449:	50                   	push   %eax
  10044a:	e8 3d 03 00 00       	call   10078c <put_into_running>
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
  100467:	68 c2 15 10 00       	push   $0x1015c2
  10046c:	e8 bf 0e 00 00       	call   101330 <printk>
  100471:	b8 70 8a 10 00       	mov    $0x108a70,%eax
  100476:	b9 0f 00 00 00       	mov    $0xf,%ecx
  10047b:	89 c7                	mov    %eax,%edi
  10047d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10047f:	c7 05 8c 8a 10 00 00 	movl   $0x0,0x108a8c
  100486:	00 00 00 
  100489:	c7 05 a4 8a 10 00 00 	movl   $0x7e00000,0x108aa4
  100490:	00 e0 07 
  100493:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  10049a:	e8 19 04 00 00       	call   1008b8 <put_into_runnable>
  10049f:	b8 02 00 00 00       	mov    $0x2,%eax
  1004a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1004a7:	5e                   	pop    %esi
  1004a8:	5f                   	pop    %edi
  1004a9:	5d                   	pop    %ebp
  1004aa:	c3                   	ret    
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
  100588:	68 de 15 10 00       	push   $0x1015de
  10058d:	e8 12 0f 00 00       	call   1014a4 <abort>
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

00100658 <put_into_running.part.0>:
  100658:	55                   	push   %ebp
  100659:	89 e5                	mov    %esp,%ebp
  10065b:	57                   	push   %edi
  10065c:	56                   	push   %esi
  10065d:	53                   	push   %ebx
  10065e:	81 ec e8 00 00 00    	sub    $0xe8,%esp
  100664:	89 c3                	mov    %eax,%ebx
  100666:	a3 a0 29 10 00       	mov    %eax,0x1029a0
  10066b:	c1 e0 07             	shl    $0x7,%eax
  10066e:	01 d8                	add    %ebx,%eax
  100670:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100673:	01 c0                	add    %eax,%eax
  100675:	01 d8                	add    %ebx,%eax
  100677:	8d 34 c5 c0 49 10 00 	lea    0x1049c0(,%eax,8),%esi
  10067e:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100683:	89 d7                	mov    %edx,%edi
  100685:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100687:	68 6c 15 10 00       	push   $0x10156c
  10068c:	e8 9f 0c 00 00       	call   101330 <printk>
  100691:	8d 45 84             	lea    -0x7c(%ebp),%eax
  100694:	89 04 24             	mov    %eax,(%esp)
  100697:	e8 b4 f9 ff ff       	call   100050 <get_tss>
  10069c:	ff 75 88             	pushl  -0x78(%ebp)
  10069f:	68 1c 17 10 00       	push   $0x10171c
  1006a4:	6a 13                	push   $0x13
  1006a6:	68 fa 15 10 00       	push   $0x1015fa
  1006ab:	68 40 16 10 00       	push   $0x101640
  1006b0:	e8 7b 0c 00 00       	call   101330 <printk>
  1006b5:	83 c4 14             	add    $0x14,%esp
  1006b8:	68 8e 15 10 00       	push   $0x10158e
  1006bd:	e8 6e 0c 00 00       	call   101330 <printk>
  1006c2:	83 c4 10             	add    $0x10,%esp
  1006c5:	85 db                	test   %ebx,%ebx
  1006c7:	0f 85 93 00 00 00    	jne    100760 <put_into_running.part.0+0x108>
  1006cd:	83 ec 08             	sub    $0x8,%esp
  1006d0:	a1 a0 29 10 00       	mov    0x1029a0,%eax
  1006d5:	89 c2                	mov    %eax,%edx
  1006d7:	c1 e2 07             	shl    $0x7,%edx
  1006da:	01 c2                	add    %eax,%edx
  1006dc:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1006df:	01 d2                	add    %edx,%edx
  1006e1:	01 d0                	add    %edx,%eax
  1006e3:	8d 04 c5 bc 49 10 00 	lea    0x1049bc(,%eax,8),%eax
  1006ea:	50                   	push   %eax
  1006eb:	6a 10                	push   $0x10
  1006ed:	e8 42 f9 ff ff       	call   100034 <change_tss>
  1006f2:	8d 85 20 ff ff ff    	lea    -0xe0(%ebp),%eax
  1006f8:	89 04 24             	mov    %eax,(%esp)
  1006fb:	e8 50 f9 ff ff       	call   100050 <get_tss>
  100700:	83 c4 0c             	add    $0xc,%esp
  100703:	81 bd 24 ff ff ff bc 	cmpl   $0x1049bc,-0xdc(%ebp)
  10070a:	49 10 00 
  10070d:	74 12                	je     100721 <put_into_running.part.0+0xc9>
  10070f:	83 ec 08             	sub    $0x8,%esp
  100712:	6a 18                	push   $0x18
  100714:	68 fa 15 10 00       	push   $0x1015fa
  100719:	e8 86 0d 00 00       	call   1014a4 <abort>
  10071e:	83 c4 10             	add    $0x10,%esp
  100721:	83 ec 0c             	sub    $0xc,%esp
  100724:	68 6c 15 10 00       	push   $0x10156c
  100729:	e8 02 0c 00 00       	call   101330 <printk>
  10072e:	89 1c 24             	mov    %ebx,(%esp)
  100731:	68 1c 17 10 00       	push   $0x10171c
  100736:	6a 21                	push   $0x21
  100738:	68 fa 15 10 00       	push   $0x1015fa
  10073d:	68 08 16 10 00       	push   $0x101608
  100742:	e8 e9 0b 00 00       	call   101330 <printk>
  100747:	83 c4 14             	add    $0x14,%esp
  10074a:	68 8e 15 10 00       	push   $0x10158e
  10074f:	e8 dc 0b 00 00       	call   101330 <printk>
  100754:	83 c4 10             	add    $0x10,%esp
  100757:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10075a:	5b                   	pop    %ebx
  10075b:	5e                   	pop    %esi
  10075c:	5f                   	pop    %edi
  10075d:	5d                   	pop    %ebp
  10075e:	c3                   	ret    
  10075f:	90                   	nop
  100760:	83 ec 08             	sub    $0x8,%esp
  100763:	a1 a0 29 10 00       	mov    0x1029a0,%eax
  100768:	89 c2                	mov    %eax,%edx
  10076a:	c1 e2 07             	shl    $0x7,%edx
  10076d:	01 c2                	add    %eax,%edx
  10076f:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100772:	01 d2                	add    %edx,%edx
  100774:	01 d0                	add    %edx,%eax
  100776:	8d 04 c5 bc 49 10 00 	lea    0x1049bc(,%eax,8),%eax
  10077d:	50                   	push   %eax
  10077e:	6a 10                	push   $0x10
  100780:	e8 af f8 ff ff       	call   100034 <change_tss>
  100785:	83 c4 10             	add    $0x10,%esp
  100788:	eb 97                	jmp    100721 <put_into_running.part.0+0xc9>
  10078a:	66 90                	xchg   %ax,%ax

0010078c <put_into_running>:
  10078c:	55                   	push   %ebp
  10078d:	89 e5                	mov    %esp,%ebp
  10078f:	83 ec 08             	sub    $0x8,%esp
  100792:	8b 45 08             	mov    0x8(%ebp),%eax
  100795:	39 05 a0 29 10 00    	cmp    %eax,0x1029a0
  10079b:	74 08                	je     1007a5 <put_into_running+0x19>
  10079d:	8b 55 0c             	mov    0xc(%ebp),%edx
  1007a0:	e8 b3 fe ff ff       	call   100658 <put_into_running.part.0>
  1007a5:	b8 01 00 00 00       	mov    $0x1,%eax
  1007aa:	c9                   	leave  
  1007ab:	c3                   	ret    

001007ac <update_block>:
  1007ac:	55                   	push   %ebp
  1007ad:	89 e5                	mov    %esp,%ebp
  1007af:	b8 01 00 00 00       	mov    $0x1,%eax
  1007b4:	5d                   	pop    %ebp
  1007b5:	c3                   	ret    
  1007b6:	66 90                	xchg   %ax,%ax

001007b8 <apply_new_pid>:
  1007b8:	55                   	push   %ebp
  1007b9:	89 e5                	mov    %esp,%ebp
  1007bb:	b8 02 00 00 00       	mov    $0x2,%eax
  1007c0:	5d                   	pop    %ebp
  1007c1:	c3                   	ret    
  1007c2:	66 90                	xchg   %ax,%ax

001007c4 <getpid>:
  1007c4:	55                   	push   %ebp
  1007c5:	89 e5                	mov    %esp,%ebp
  1007c7:	a1 a0 29 10 00       	mov    0x1029a0,%eax
  1007cc:	5d                   	pop    %ebp
  1007cd:	c3                   	ret    
  1007ce:	66 90                	xchg   %ax,%ax

001007d0 <getrunnable>:
  1007d0:	55                   	push   %ebp
  1007d1:	89 e5                	mov    %esp,%ebp
  1007d3:	a1 04 20 10 00       	mov    0x102004,%eax
  1007d8:	5d                   	pop    %ebp
  1007d9:	c3                   	ret    
  1007da:	66 90                	xchg   %ax,%ax

001007dc <getblocked>:
  1007dc:	55                   	push   %ebp
  1007dd:	89 e5                	mov    %esp,%ebp
  1007df:	a1 00 20 10 00       	mov    0x102000,%eax
  1007e4:	5d                   	pop    %ebp
  1007e5:	c3                   	ret    
  1007e6:	66 90                	xchg   %ax,%ax

001007e8 <transfer_pid_mode>:
  1007e8:	55                   	push   %ebp
  1007e9:	89 e5                	mov    %esp,%ebp
  1007eb:	b8 01 00 00 00       	mov    $0x1,%eax
  1007f0:	5d                   	pop    %ebp
  1007f1:	c3                   	ret    
  1007f2:	66 90                	xchg   %ax,%ax

001007f4 <get_from_runnable>:
  1007f4:	55                   	push   %ebp
  1007f5:	89 e5                	mov    %esp,%ebp
  1007f7:	53                   	push   %ebx
  1007f8:	51                   	push   %ecx
  1007f9:	8b 1d 04 20 10 00    	mov    0x102004,%ebx
  1007ff:	83 fb ff             	cmp    $0xffffffff,%ebx
  100802:	0f 84 a8 00 00 00    	je     1008b0 <get_from_runnable+0xbc>
  100808:	89 d8                	mov    %ebx,%eax
  10080a:	c1 e0 07             	shl    $0x7,%eax
  10080d:	01 d8                	add    %ebx,%eax
  10080f:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100812:	01 c0                	add    %eax,%eax
  100814:	01 d8                	add    %ebx,%eax
  100816:	8d 14 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%edx
  10081d:	8b 82 50 20 00 00    	mov    0x2050(%edx),%eax
  100823:	39 d8                	cmp    %ebx,%eax
  100825:	74 7d                	je     1008a4 <get_from_runnable+0xb0>
  100827:	8b 8a 4c 20 00 00    	mov    0x204c(%edx),%ecx
  10082d:	89 ca                	mov    %ecx,%edx
  10082f:	c1 e2 07             	shl    $0x7,%edx
  100832:	01 ca                	add    %ecx,%edx
  100834:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100837:	01 d2                	add    %edx,%edx
  100839:	01 ca                	add    %ecx,%edx
  10083b:	89 04 d5 10 4a 10 00 	mov    %eax,0x104a10(,%edx,8)
  100842:	89 c2                	mov    %eax,%edx
  100844:	c1 e2 07             	shl    $0x7,%edx
  100847:	01 c2                	add    %eax,%edx
  100849:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10084c:	01 d2                	add    %edx,%edx
  10084e:	01 c2                	add    %eax,%edx
  100850:	89 0c d5 0c 4a 10 00 	mov    %ecx,0x104a0c(,%edx,8)
  100857:	a3 04 20 10 00       	mov    %eax,0x102004
  10085c:	83 ec 0c             	sub    $0xc,%esp
  10085f:	68 6c 15 10 00       	push   $0x10156c
  100864:	e8 c7 0a 00 00       	call   101330 <printk>
  100869:	58                   	pop    %eax
  10086a:	5a                   	pop    %edx
  10086b:	ff 35 04 20 10 00    	pushl  0x102004
  100871:	53                   	push   %ebx
  100872:	68 f8 16 10 00       	push   $0x1016f8
  100877:	68 80 00 00 00       	push   $0x80
  10087c:	68 fa 15 10 00       	push   $0x1015fa
  100881:	68 60 16 10 00       	push   $0x101660
  100886:	e8 a5 0a 00 00       	call   101330 <printk>
  10088b:	83 c4 14             	add    $0x14,%esp
  10088e:	68 8e 15 10 00       	push   $0x10158e
  100893:	e8 98 0a 00 00       	call   101330 <printk>
  100898:	83 c4 10             	add    $0x10,%esp
  10089b:	89 d8                	mov    %ebx,%eax
  10089d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1008a0:	c9                   	leave  
  1008a1:	c3                   	ret    
  1008a2:	66 90                	xchg   %ax,%ax
  1008a4:	c7 05 04 20 10 00 ff 	movl   $0xffffffff,0x102004
  1008ab:	ff ff ff 
  1008ae:	eb ac                	jmp    10085c <get_from_runnable+0x68>
  1008b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1008b5:	eb e6                	jmp    10089d <get_from_runnable+0xa9>
  1008b7:	90                   	nop

001008b8 <put_into_runnable>:
  1008b8:	55                   	push   %ebp
  1008b9:	89 e5                	mov    %esp,%ebp
  1008bb:	56                   	push   %esi
  1008bc:	53                   	push   %ebx
  1008bd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1008c0:	a1 04 20 10 00       	mov    0x102004,%eax
  1008c5:	83 f8 ff             	cmp    $0xffffffff,%eax
  1008c8:	0f 84 e2 00 00 00    	je     1009b0 <put_into_runnable+0xf8>
  1008ce:	89 c2                	mov    %eax,%edx
  1008d0:	c1 e2 07             	shl    $0x7,%edx
  1008d3:	01 c2                	add    %eax,%edx
  1008d5:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1008d8:	01 d2                	add    %edx,%edx
  1008da:	01 c2                	add    %eax,%edx
  1008dc:	8d 34 d5 c0 29 10 00 	lea    0x1029c0(,%edx,8),%esi
  1008e3:	8b 8e 4c 20 00 00    	mov    0x204c(%esi),%ecx
  1008e9:	89 ca                	mov    %ecx,%edx
  1008eb:	c1 e2 07             	shl    $0x7,%edx
  1008ee:	01 ca                	add    %ecx,%edx
  1008f0:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  1008f3:	01 d2                	add    %edx,%edx
  1008f5:	01 ca                	add    %ecx,%edx
  1008f7:	89 1c d5 10 4a 10 00 	mov    %ebx,0x104a10(,%edx,8)
  1008fe:	89 da                	mov    %ebx,%edx
  100900:	c1 e2 07             	shl    $0x7,%edx
  100903:	01 da                	add    %ebx,%edx
  100905:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100908:	01 d2                	add    %edx,%edx
  10090a:	01 da                	add    %ebx,%edx
  10090c:	8d 14 d5 c0 29 10 00 	lea    0x1029c0(,%edx,8),%edx
  100913:	89 8a 4c 20 00 00    	mov    %ecx,0x204c(%edx)
  100919:	89 82 50 20 00 00    	mov    %eax,0x2050(%edx)
  10091f:	89 9e 4c 20 00 00    	mov    %ebx,0x204c(%esi)
  100925:	89 d8                	mov    %ebx,%eax
  100927:	c1 e0 07             	shl    $0x7,%eax
  10092a:	01 d8                	add    %ebx,%eax
  10092c:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10092f:	01 c0                	add    %eax,%eax
  100931:	01 d8                	add    %ebx,%eax
  100933:	c7 04 c5 fc 49 10 00 	movl   $0x1,0x1049fc(,%eax,8)
  10093a:	01 00 00 00 
  10093e:	85 db                	test   %ebx,%ebx
  100940:	75 0a                	jne    10094c <put_into_runnable+0x94>
  100942:	c7 05 e8 49 10 00 50 	movl   $0x100650,0x1049e8
  100949:	06 10 00 
  10094c:	83 ec 0c             	sub    $0xc,%esp
  10094f:	68 6c 15 10 00       	push   $0x10156c
  100954:	e8 d7 09 00 00       	call   101330 <printk>
  100959:	58                   	pop    %eax
  10095a:	5a                   	pop    %edx
  10095b:	53                   	push   %ebx
  10095c:	ff 35 04 20 10 00    	pushl  0x102004
  100962:	68 e4 16 10 00       	push   $0x1016e4
  100967:	68 9e 00 00 00       	push   $0x9e
  10096c:	68 fa 15 10 00       	push   $0x1015fa
  100971:	68 94 16 10 00       	push   $0x101694
  100976:	e8 b5 09 00 00       	call   101330 <printk>
  10097b:	83 c4 14             	add    $0x14,%esp
  10097e:	68 8e 15 10 00       	push   $0x10158e
  100983:	e8 a8 09 00 00       	call   101330 <printk>
  100988:	89 d8                	mov    %ebx,%eax
  10098a:	c1 e0 07             	shl    $0x7,%eax
  10098d:	01 d8                	add    %ebx,%eax
  10098f:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100992:	01 c0                	add    %eax,%eax
  100994:	01 c3                	add    %eax,%ebx
  100996:	c7 04 dd 00 4a 10 00 	movl   $0xa,0x104a00(,%ebx,8)
  10099d:	0a 00 00 00 
  1009a1:	b8 01 00 00 00       	mov    $0x1,%eax
  1009a6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1009a9:	5b                   	pop    %ebx
  1009aa:	5e                   	pop    %esi
  1009ab:	5d                   	pop    %ebp
  1009ac:	c3                   	ret    
  1009ad:	8d 76 00             	lea    0x0(%esi),%esi
  1009b0:	89 1d 04 20 10 00    	mov    %ebx,0x102004
  1009b6:	89 d8                	mov    %ebx,%eax
  1009b8:	c1 e0 07             	shl    $0x7,%eax
  1009bb:	01 d8                	add    %ebx,%eax
  1009bd:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1009c0:	01 c0                	add    %eax,%eax
  1009c2:	01 d8                	add    %ebx,%eax
  1009c4:	8d 04 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%eax
  1009cb:	89 98 4c 20 00 00    	mov    %ebx,0x204c(%eax)
  1009d1:	89 98 50 20 00 00    	mov    %ebx,0x2050(%eax)
  1009d7:	e9 49 ff ff ff       	jmp    100925 <put_into_runnable+0x6d>

001009dc <put_into_block>:
  1009dc:	55                   	push   %ebp
  1009dd:	89 e5                	mov    %esp,%ebp
  1009df:	57                   	push   %edi
  1009e0:	56                   	push   %esi
  1009e1:	53                   	push   %ebx
  1009e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1009e5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  1009e8:	8b 15 00 20 10 00    	mov    0x102000,%edx
  1009ee:	83 fa ff             	cmp    $0xffffffff,%edx
  1009f1:	0f 84 99 00 00 00    	je     100a90 <put_into_block+0xb4>
  1009f7:	89 d1                	mov    %edx,%ecx
  1009f9:	c1 e1 07             	shl    $0x7,%ecx
  1009fc:	01 d1                	add    %edx,%ecx
  1009fe:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100a01:	01 c9                	add    %ecx,%ecx
  100a03:	01 d1                	add    %edx,%ecx
  100a05:	8d 3c cd c0 29 10 00 	lea    0x1029c0(,%ecx,8),%edi
  100a0c:	8b b7 4c 20 00 00    	mov    0x204c(%edi),%esi
  100a12:	89 f1                	mov    %esi,%ecx
  100a14:	c1 e1 07             	shl    $0x7,%ecx
  100a17:	01 f1                	add    %esi,%ecx
  100a19:	8d 0c 8e             	lea    (%esi,%ecx,4),%ecx
  100a1c:	01 c9                	add    %ecx,%ecx
  100a1e:	01 f1                	add    %esi,%ecx
  100a20:	89 04 cd 10 4a 10 00 	mov    %eax,0x104a10(,%ecx,8)
  100a27:	89 c1                	mov    %eax,%ecx
  100a29:	c1 e1 07             	shl    $0x7,%ecx
  100a2c:	01 c1                	add    %eax,%ecx
  100a2e:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  100a31:	01 c9                	add    %ecx,%ecx
  100a33:	01 c1                	add    %eax,%ecx
  100a35:	8d 0c cd c0 29 10 00 	lea    0x1029c0(,%ecx,8),%ecx
  100a3c:	89 b1 4c 20 00 00    	mov    %esi,0x204c(%ecx)
  100a42:	89 91 50 20 00 00    	mov    %edx,0x2050(%ecx)
  100a48:	89 87 4c 20 00 00    	mov    %eax,0x204c(%edi)
  100a4e:	89 c2                	mov    %eax,%edx
  100a50:	c1 e2 07             	shl    $0x7,%edx
  100a53:	01 c2                	add    %eax,%edx
  100a55:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100a58:	01 d2                	add    %edx,%edx
  100a5a:	01 c2                	add    %eax,%edx
  100a5c:	c1 e2 03             	shl    $0x3,%edx
  100a5f:	8d 82 c0 49 10 00    	lea    0x1049c0(%edx),%eax
  100a65:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100a6a:	89 c7                	mov    %eax,%edi
  100a6c:	89 de                	mov    %ebx,%esi
  100a6e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100a70:	8b 43 10             	mov    0x10(%ebx),%eax
  100a73:	89 82 04 4a 10 00    	mov    %eax,0x104a04(%edx)
  100a79:	c7 82 fc 49 10 00 00 	movl   $0x0,0x1049fc(%edx)
  100a80:	00 00 00 
  100a83:	b8 01 00 00 00       	mov    $0x1,%eax
  100a88:	5b                   	pop    %ebx
  100a89:	5e                   	pop    %esi
  100a8a:	5f                   	pop    %edi
  100a8b:	5d                   	pop    %ebp
  100a8c:	c3                   	ret    
  100a8d:	8d 76 00             	lea    0x0(%esi),%esi
  100a90:	a3 00 20 10 00       	mov    %eax,0x102000
  100a95:	89 c2                	mov    %eax,%edx
  100a97:	c1 e2 07             	shl    $0x7,%edx
  100a9a:	01 c2                	add    %eax,%edx
  100a9c:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100a9f:	01 d2                	add    %edx,%edx
  100aa1:	01 c2                	add    %eax,%edx
  100aa3:	8d 14 d5 c0 29 10 00 	lea    0x1029c0(,%edx,8),%edx
  100aaa:	89 82 50 20 00 00    	mov    %eax,0x2050(%edx)
  100ab0:	89 82 4c 20 00 00    	mov    %eax,0x204c(%edx)
  100ab6:	eb 96                	jmp    100a4e <put_into_block+0x72>

00100ab8 <get_from>:
  100ab8:	55                   	push   %ebp
  100ab9:	89 e5                	mov    %esp,%ebp
  100abb:	56                   	push   %esi
  100abc:	53                   	push   %ebx
  100abd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100ac0:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ac3:	85 db                	test   %ebx,%ebx
  100ac5:	0f 8e 01 01 00 00    	jle    100bcc <get_from+0x114>
  100acb:	39 c3                	cmp    %eax,%ebx
  100acd:	74 42                	je     100b11 <get_from+0x59>
  100acf:	89 da                	mov    %ebx,%edx
  100ad1:	c1 e2 07             	shl    $0x7,%edx
  100ad4:	01 da                	add    %ebx,%edx
  100ad6:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100ad9:	01 d2                	add    %edx,%edx
  100adb:	01 da                	add    %ebx,%edx
  100add:	8b 14 d5 10 4a 10 00 	mov    0x104a10(,%edx,8),%edx
  100ae4:	39 d3                	cmp    %edx,%ebx
  100ae6:	75 25                	jne    100b0d <get_from+0x55>
  100ae8:	e9 df 00 00 00       	jmp    100bcc <get_from+0x114>
  100aed:	8d 76 00             	lea    0x0(%esi),%esi
  100af0:	89 d1                	mov    %edx,%ecx
  100af2:	c1 e1 07             	shl    $0x7,%ecx
  100af5:	01 d1                	add    %edx,%ecx
  100af7:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100afa:	01 c9                	add    %ecx,%ecx
  100afc:	01 ca                	add    %ecx,%edx
  100afe:	8b 14 d5 10 4a 10 00 	mov    0x104a10(,%edx,8),%edx
  100b05:	39 d3                	cmp    %edx,%ebx
  100b07:	0f 84 bf 00 00 00    	je     100bcc <get_from+0x114>
  100b0d:	39 c2                	cmp    %eax,%edx
  100b0f:	75 df                	jne    100af0 <get_from+0x38>
  100b11:	89 c2                	mov    %eax,%edx
  100b13:	c1 e2 07             	shl    $0x7,%edx
  100b16:	01 c2                	add    %eax,%edx
  100b18:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100b1b:	01 d2                	add    %edx,%edx
  100b1d:	01 d0                	add    %edx,%eax
  100b1f:	8b 04 c5 fc 49 10 00 	mov    0x1049fc(,%eax,8),%eax
  100b26:	85 c0                	test   %eax,%eax
  100b28:	0f 84 c2 00 00 00    	je     100bf0 <get_from+0x138>
  100b2e:	48                   	dec    %eax
  100b2f:	75 7f                	jne    100bb0 <get_from+0xf8>
  100b31:	be 04 20 10 00       	mov    $0x102004,%esi
  100b36:	3b 1e                	cmp    (%esi),%ebx
  100b38:	74 15                	je     100b4f <get_from+0x97>
  100b3a:	83 ec 08             	sub    $0x8,%esp
  100b3d:	68 df 00 00 00       	push   $0xdf
  100b42:	68 fa 15 10 00       	push   $0x1015fa
  100b47:	e8 58 09 00 00       	call   1014a4 <abort>
  100b4c:	83 c4 10             	add    $0x10,%esp
  100b4f:	89 d8                	mov    %ebx,%eax
  100b51:	c1 e0 07             	shl    $0x7,%eax
  100b54:	01 d8                	add    %ebx,%eax
  100b56:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b59:	01 c0                	add    %eax,%eax
  100b5b:	01 d8                	add    %ebx,%eax
  100b5d:	8d 14 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%edx
  100b64:	8b 82 50 20 00 00    	mov    0x2050(%edx),%eax
  100b6a:	39 d8                	cmp    %ebx,%eax
  100b6c:	0f 84 8a 00 00 00    	je     100bfc <get_from+0x144>
  100b72:	8b 8a 4c 20 00 00    	mov    0x204c(%edx),%ecx
  100b78:	89 ca                	mov    %ecx,%edx
  100b7a:	c1 e2 07             	shl    $0x7,%edx
  100b7d:	01 ca                	add    %ecx,%edx
  100b7f:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100b82:	01 d2                	add    %edx,%edx
  100b84:	01 ca                	add    %ecx,%edx
  100b86:	89 04 d5 10 4a 10 00 	mov    %eax,0x104a10(,%edx,8)
  100b8d:	89 c2                	mov    %eax,%edx
  100b8f:	c1 e2 07             	shl    $0x7,%edx
  100b92:	01 c2                	add    %eax,%edx
  100b94:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100b97:	01 d2                	add    %edx,%edx
  100b99:	01 c2                	add    %eax,%edx
  100b9b:	89 0c d5 0c 4a 10 00 	mov    %ecx,0x104a0c(,%edx,8)
  100ba2:	89 06                	mov    %eax,(%esi)
  100ba4:	89 d8                	mov    %ebx,%eax
  100ba6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100ba9:	5b                   	pop    %ebx
  100baa:	5e                   	pop    %esi
  100bab:	5d                   	pop    %ebp
  100bac:	c3                   	ret    
  100bad:	8d 76 00             	lea    0x0(%esi),%esi
  100bb0:	83 ec 08             	sub    $0x8,%esp
  100bb3:	68 db 00 00 00       	push   $0xdb
  100bb8:	68 fa 15 10 00       	push   $0x1015fa
  100bbd:	e8 e2 08 00 00       	call   1014a4 <abort>
  100bc2:	a1 00 00 00 00       	mov    0x0,%eax
  100bc7:	0f 0b                	ud2    
  100bc9:	8d 76 00             	lea    0x0(%esi),%esi
  100bcc:	83 ec 08             	sub    $0x8,%esp
  100bcf:	68 cc 00 00 00       	push   $0xcc
  100bd4:	68 fa 15 10 00       	push   $0x1015fa
  100bd9:	e8 c6 08 00 00       	call   1014a4 <abort>
  100bde:	83 c4 10             	add    $0x10,%esp
  100be1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100be6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100be9:	5b                   	pop    %ebx
  100bea:	5e                   	pop    %esi
  100beb:	5d                   	pop    %ebp
  100bec:	c3                   	ret    
  100bed:	8d 76 00             	lea    0x0(%esi),%esi
  100bf0:	be 00 20 10 00       	mov    $0x102000,%esi
  100bf5:	e9 3c ff ff ff       	jmp    100b36 <get_from+0x7e>
  100bfa:	66 90                	xchg   %ax,%ax
  100bfc:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100c02:	89 d8                	mov    %ebx,%eax
  100c04:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100c07:	5b                   	pop    %ebx
  100c08:	5e                   	pop    %esi
  100c09:	5d                   	pop    %ebp
  100c0a:	c3                   	ret    
  100c0b:	90                   	nop

00100c0c <get_from_block>:
  100c0c:	55                   	push   %ebp
  100c0d:	89 e5                	mov    %esp,%ebp
  100c0f:	83 ec 10             	sub    $0x10,%esp
  100c12:	ff 75 08             	pushl  0x8(%ebp)
  100c15:	ff 35 00 20 10 00    	pushl  0x102000
  100c1b:	e8 98 fe ff ff       	call   100ab8 <get_from>
  100c20:	83 c4 10             	add    $0x10,%esp
  100c23:	40                   	inc    %eax
  100c24:	74 0a                	je     100c30 <get_from_block+0x24>
  100c26:	b8 01 00 00 00       	mov    $0x1,%eax
  100c2b:	c9                   	leave  
  100c2c:	c3                   	ret    
  100c2d:	8d 76 00             	lea    0x0(%esi),%esi
  100c30:	83 ec 08             	sub    $0x8,%esp
  100c33:	68 16 01 00 00       	push   $0x116
  100c38:	68 fa 15 10 00       	push   $0x1015fa
  100c3d:	e8 62 08 00 00       	call   1014a4 <abort>
  100c42:	83 c4 10             	add    $0x10,%esp
  100c45:	b8 01 00 00 00       	mov    $0x1,%eax
  100c4a:	c9                   	leave  
  100c4b:	c3                   	ret    

00100c4c <check_block>:
  100c4c:	55                   	push   %ebp
  100c4d:	89 e5                	mov    %esp,%ebp
  100c4f:	56                   	push   %esi
  100c50:	53                   	push   %ebx
  100c51:	a1 00 20 10 00       	mov    0x102000,%eax
  100c56:	89 c3                	mov    %eax,%ebx
  100c58:	83 f8 ff             	cmp    $0xffffffff,%eax
  100c5b:	74 4c                	je     100ca9 <check_block+0x5d>
  100c5d:	89 c2                	mov    %eax,%edx
  100c5f:	c1 e2 07             	shl    $0x7,%edx
  100c62:	01 c2                	add    %eax,%edx
  100c64:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c67:	01 d2                	add    %edx,%edx
  100c69:	01 c2                	add    %eax,%edx
  100c6b:	8d 34 d5 c0 29 10 00 	lea    0x1029c0(,%edx,8),%esi
  100c72:	eb 09                	jmp    100c7d <check_block+0x31>
  100c74:	39 c3                	cmp    %eax,%ebx
  100c76:	74 2c                	je     100ca4 <check_block+0x58>
  100c78:	83 f8 ff             	cmp    $0xffffffff,%eax
  100c7b:	74 27                	je     100ca4 <check_block+0x58>
  100c7d:	8b 96 44 20 00 00    	mov    0x2044(%esi),%edx
  100c83:	85 d2                	test   %edx,%edx
  100c85:	7f ed                	jg     100c74 <check_block+0x28>
  100c87:	83 ec 0c             	sub    $0xc,%esp
  100c8a:	53                   	push   %ebx
  100c8b:	e8 7c ff ff ff       	call   100c0c <get_from_block>
  100c90:	89 1c 24             	mov    %ebx,(%esp)
  100c93:	e8 20 fc ff ff       	call   1008b8 <put_into_runnable>
  100c98:	83 c4 10             	add    $0x10,%esp
  100c9b:	a1 00 20 10 00       	mov    0x102000,%eax
  100ca0:	39 c3                	cmp    %eax,%ebx
  100ca2:	75 d4                	jne    100c78 <check_block+0x2c>
  100ca4:	bb 01 00 00 00       	mov    $0x1,%ebx
  100ca9:	89 d8                	mov    %ebx,%eax
  100cab:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100cae:	5b                   	pop    %ebx
  100caf:	5e                   	pop    %esi
  100cb0:	5d                   	pop    %ebp
  100cb1:	c3                   	ret    
  100cb2:	66 90                	xchg   %ax,%ax

00100cb4 <checkTimeCount>:
  100cb4:	a1 a4 29 10 00       	mov    0x1029a4,%eax
  100cb9:	85 c0                	test   %eax,%eax
  100cbb:	0f 84 fb 00 00 00    	je     100dbc <checkTimeCount+0x108>
  100cc1:	55                   	push   %ebp
  100cc2:	89 e5                	mov    %esp,%ebp
  100cc4:	57                   	push   %edi
  100cc5:	56                   	push   %esi
  100cc6:	83 ec 0c             	sub    $0xc,%esp
  100cc9:	68 6c 15 10 00       	push   $0x10156c
  100cce:	e8 5d 06 00 00       	call   101330 <printk>
  100cd3:	58                   	pop    %eax
  100cd4:	ff 35 a0 29 10 00    	pushl  0x1029a0
  100cda:	68 0c 17 10 00       	push   $0x10170c
  100cdf:	6a 2e                	push   $0x2e
  100ce1:	68 fa 15 10 00       	push   $0x1015fa
  100ce6:	68 26 16 10 00       	push   $0x101626
  100ceb:	e8 40 06 00 00       	call   101330 <printk>
  100cf0:	83 c4 14             	add    $0x14,%esp
  100cf3:	68 8e 15 10 00       	push   $0x10158e
  100cf8:	e8 33 06 00 00       	call   101330 <printk>
  100cfd:	c7 04 24 6c 15 10 00 	movl   $0x10156c,(%esp)
  100d04:	e8 27 06 00 00       	call   101330 <printk>
  100d09:	5a                   	pop    %edx
  100d0a:	a1 a0 29 10 00       	mov    0x1029a0,%eax
  100d0f:	89 c2                	mov    %eax,%edx
  100d11:	c1 e2 07             	shl    $0x7,%edx
  100d14:	01 c2                	add    %eax,%edx
  100d16:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100d19:	01 d2                	add    %edx,%edx
  100d1b:	01 d0                	add    %edx,%eax
  100d1d:	ff 34 c5 00 4a 10 00 	pushl  0x104a00(,%eax,8)
  100d24:	68 0c 17 10 00       	push   $0x10170c
  100d29:	6a 2f                	push   $0x2f
  100d2b:	68 fa 15 10 00       	push   $0x1015fa
  100d30:	68 c4 16 10 00       	push   $0x1016c4
  100d35:	e8 f6 05 00 00       	call   101330 <printk>
  100d3a:	83 c4 14             	add    $0x14,%esp
  100d3d:	68 8e 15 10 00       	push   $0x10158e
  100d42:	e8 e9 05 00 00       	call   101330 <printk>
  100d47:	e8 00 ff ff ff       	call   100c4c <check_block>
  100d4c:	8b 15 a0 29 10 00    	mov    0x1029a0,%edx
  100d52:	89 d0                	mov    %edx,%eax
  100d54:	c1 e0 07             	shl    $0x7,%eax
  100d57:	01 d0                	add    %edx,%eax
  100d59:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100d5c:	01 c0                	add    %eax,%eax
  100d5e:	01 d0                	add    %edx,%eax
  100d60:	c1 e0 03             	shl    $0x3,%eax
  100d63:	83 c4 10             	add    $0x10,%esp
  100d66:	8b 88 00 4a 10 00    	mov    0x104a00(%eax),%ecx
  100d6c:	85 c9                	test   %ecx,%ecx
  100d6e:	7e 0c                	jle    100d7c <checkTimeCount+0xc8>
  100d70:	b8 01 00 00 00       	mov    $0x1,%eax
  100d75:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d78:	5e                   	pop    %esi
  100d79:	5f                   	pop    %edi
  100d7a:	5d                   	pop    %ebp
  100d7b:	c3                   	ret    
  100d7c:	05 c0 49 10 00       	add    $0x1049c0,%eax
  100d81:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100d86:	89 c7                	mov    %eax,%edi
  100d88:	8b 75 08             	mov    0x8(%ebp),%esi
  100d8b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100d8d:	83 ec 0c             	sub    $0xc,%esp
  100d90:	52                   	push   %edx
  100d91:	e8 22 fb ff ff       	call   1008b8 <put_into_runnable>
  100d96:	e8 59 fa ff ff       	call   1007f4 <get_from_runnable>
  100d9b:	83 c4 10             	add    $0x10,%esp
  100d9e:	3b 05 a0 29 10 00    	cmp    0x1029a0,%eax
  100da4:	74 ca                	je     100d70 <checkTimeCount+0xbc>
  100da6:	8b 55 08             	mov    0x8(%ebp),%edx
  100da9:	e8 aa f8 ff ff       	call   100658 <put_into_running.part.0>
  100dae:	b8 01 00 00 00       	mov    $0x1,%eax
  100db3:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100db6:	5e                   	pop    %esi
  100db7:	5f                   	pop    %edi
  100db8:	5d                   	pop    %ebp
  100db9:	c3                   	ret    
  100dba:	66 90                	xchg   %ax,%ax
  100dbc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100dc1:	c3                   	ret    
  100dc2:	66 90                	xchg   %ax,%ax

00100dc4 <check_is_in>:
  100dc4:	55                   	push   %ebp
  100dc5:	89 e5                	mov    %esp,%ebp
  100dc7:	53                   	push   %ebx
  100dc8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100dcb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100dce:	85 c9                	test   %ecx,%ecx
  100dd0:	7e 4a                	jle    100e1c <check_is_in+0x58>
  100dd2:	39 d9                	cmp    %ebx,%ecx
  100dd4:	74 3b                	je     100e11 <check_is_in+0x4d>
  100dd6:	89 c8                	mov    %ecx,%eax
  100dd8:	c1 e0 07             	shl    $0x7,%eax
  100ddb:	01 c8                	add    %ecx,%eax
  100ddd:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100de0:	01 c0                	add    %eax,%eax
  100de2:	01 c8                	add    %ecx,%eax
  100de4:	8b 04 c5 10 4a 10 00 	mov    0x104a10(,%eax,8),%eax
  100deb:	39 c1                	cmp    %eax,%ecx
  100ded:	75 1e                	jne    100e0d <check_is_in+0x49>
  100def:	eb 2b                	jmp    100e1c <check_is_in+0x58>
  100df1:	8d 76 00             	lea    0x0(%esi),%esi
  100df4:	89 c2                	mov    %eax,%edx
  100df6:	c1 e2 07             	shl    $0x7,%edx
  100df9:	01 c2                	add    %eax,%edx
  100dfb:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100dfe:	01 d2                	add    %edx,%edx
  100e00:	01 d0                	add    %edx,%eax
  100e02:	8b 04 c5 10 4a 10 00 	mov    0x104a10(,%eax,8),%eax
  100e09:	39 c1                	cmp    %eax,%ecx
  100e0b:	74 0f                	je     100e1c <check_is_in+0x58>
  100e0d:	39 c3                	cmp    %eax,%ebx
  100e0f:	75 e3                	jne    100df4 <check_is_in+0x30>
  100e11:	b8 01 00 00 00       	mov    $0x1,%eax
  100e16:	5b                   	pop    %ebx
  100e17:	5d                   	pop    %ebp
  100e18:	c3                   	ret    
  100e19:	8d 76 00             	lea    0x0(%esi),%esi
  100e1c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e21:	5b                   	pop    %ebx
  100e22:	5d                   	pop    %ebp
  100e23:	c3                   	ret    

00100e24 <block_decrease>:
  100e24:	55                   	push   %ebp
  100e25:	89 e5                	mov    %esp,%ebp
  100e27:	8b 0d 00 20 10 00    	mov    0x102000,%ecx
  100e2d:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100e30:	74 2e                	je     100e60 <block_decrease+0x3c>
  100e32:	89 c8                	mov    %ecx,%eax
  100e34:	89 c2                	mov    %eax,%edx
  100e36:	c1 e2 07             	shl    $0x7,%edx
  100e39:	01 c2                	add    %eax,%edx
  100e3b:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100e3e:	01 d2                	add    %edx,%edx
  100e40:	01 d0                	add    %edx,%eax
  100e42:	8d 04 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%eax
  100e49:	ff 88 44 20 00 00    	decl   0x2044(%eax)
  100e4f:	8b 80 50 20 00 00    	mov    0x2050(%eax),%eax
  100e55:	39 c1                	cmp    %eax,%ecx
  100e57:	75 db                	jne    100e34 <block_decrease+0x10>
  100e59:	b8 01 00 00 00       	mov    $0x1,%eax
  100e5e:	5d                   	pop    %ebp
  100e5f:	c3                   	ret    
  100e60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e65:	5d                   	pop    %ebp
  100e66:	c3                   	ret    
  100e67:	90                   	nop

00100e68 <init_pcb>:
  100e68:	55                   	push   %ebp
  100e69:	89 e5                	mov    %esp,%ebp
  100e6b:	ba 08 4a 10 00       	mov    $0x104a08,%edx
  100e70:	31 c0                	xor    %eax,%eax
  100e72:	66 90                	xchg   %ax,%ax
  100e74:	89 02                	mov    %eax,(%edx)
  100e76:	8d 48 ff             	lea    -0x1(%eax),%ecx
  100e79:	89 4a 04             	mov    %ecx,0x4(%edx)
  100e7c:	40                   	inc    %eax
  100e7d:	89 42 08             	mov    %eax,0x8(%edx)
  100e80:	81 c2 58 20 00 00    	add    $0x2058,%edx
  100e86:	3d 00 08 00 00       	cmp    $0x800,%eax
  100e8b:	75 e7                	jne    100e74 <init_pcb+0xc>
  100e8d:	c7 05 0c 4a 10 00 ff 	movl   $0x7ff,0x104a0c
  100e94:	07 00 00 
  100e97:	c7 05 b8 e9 12 01 00 	movl   $0x0,0x112e9b8
  100e9e:	00 00 00 
  100ea1:	5d                   	pop    %ebp
  100ea2:	c3                   	ret    
  100ea3:	90                   	nop

00100ea4 <init_kernel_pcb>:
  100ea4:	55                   	push   %ebp
  100ea5:	89 e5                	mov    %esp,%ebp
  100ea7:	c7 05 f8 49 10 00 10 	movl   $0x10,0x1049f8
  100eae:	00 00 00 
  100eb1:	c7 05 ec 49 10 00 08 	movl   $0x8,0x1049ec
  100eb8:	00 00 00 
  100ebb:	c7 05 e8 49 10 00 50 	movl   $0x100650,0x1049e8
  100ec2:	06 10 00 
  100ec5:	c7 05 f4 49 10 00 00 	movl   $0x7f00000,0x1049f4
  100ecc:	00 f0 07 
  100ecf:	c7 05 fc 49 10 00 01 	movl   $0x1,0x1049fc
  100ed6:	00 00 00 
  100ed9:	c7 05 00 4a 10 00 04 	movl   $0x4,0x104a00
  100ee0:	00 00 00 
  100ee3:	b8 01 00 00 00       	mov    $0x1,%eax
  100ee8:	5d                   	pop    %ebp
  100ee9:	c3                   	ret    
  100eea:	66 90                	xchg   %ax,%ax

00100eec <transfer_pid_state>:
  100eec:	55                   	push   %ebp
  100eed:	89 e5                	mov    %esp,%ebp
  100eef:	b8 01 00 00 00       	mov    $0x1,%eax
  100ef4:	5d                   	pop    %ebp
  100ef5:	c3                   	ret    
  100ef6:	66 90                	xchg   %ax,%ax

00100ef8 <make_pcb>:
  100ef8:	55                   	push   %ebp
  100ef9:	89 e5                	mov    %esp,%ebp
  100efb:	57                   	push   %edi
  100efc:	56                   	push   %esi
  100efd:	8b 45 08             	mov    0x8(%ebp),%eax
  100f00:	89 c2                	mov    %eax,%edx
  100f02:	c1 e2 07             	shl    $0x7,%edx
  100f05:	01 c2                	add    %eax,%edx
  100f07:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100f0a:	01 d2                	add    %edx,%edx
  100f0c:	01 c2                	add    %eax,%edx
  100f0e:	c1 e2 03             	shl    $0x3,%edx
  100f11:	8d 82 c0 49 10 00    	lea    0x1049c0(%edx),%eax
  100f17:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100f1c:	89 c7                	mov    %eax,%edi
  100f1e:	8b 75 0c             	mov    0xc(%ebp),%esi
  100f21:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100f23:	8b 45 10             	mov    0x10(%ebp),%eax
  100f26:	89 82 fc 49 10 00    	mov    %eax,0x1049fc(%edx)
  100f2c:	8b 45 14             	mov    0x14(%ebp),%eax
  100f2f:	89 82 00 4a 10 00    	mov    %eax,0x104a00(%edx)
  100f35:	8b 45 18             	mov    0x18(%ebp),%eax
  100f38:	89 82 04 4a 10 00    	mov    %eax,0x104a04(%edx)
  100f3e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100f41:	89 82 14 4a 10 00    	mov    %eax,0x104a14(%edx)
  100f47:	b8 01 00 00 00       	mov    $0x1,%eax
  100f4c:	5e                   	pop    %esi
  100f4d:	5f                   	pop    %edi
  100f4e:	5d                   	pop    %ebp
  100f4f:	c3                   	ret    

00100f50 <initIdt>:
  100f50:	55                   	push   %ebp
  100f51:	89 e5                	mov    %esp,%ebp
  100f53:	53                   	push   %ebx
  100f54:	ba 3b 15 10 00       	mov    $0x10153b,%edx
  100f59:	89 d3                	mov    %edx,%ebx
  100f5b:	c1 ea 10             	shr    $0x10,%edx
  100f5e:	b9 80 f2 12 01       	mov    $0x112f280,%ecx
  100f63:	b8 80 ea 12 01       	mov    $0x112ea80,%eax
  100f68:	66 89 18             	mov    %bx,(%eax)
  100f6b:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100f71:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100f75:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100f79:	66 89 50 06          	mov    %dx,0x6(%eax)
  100f7d:	83 c0 08             	add    $0x8,%eax
  100f80:	39 c1                	cmp    %eax,%ecx
  100f82:	75 e4                	jne    100f68 <initIdt+0x18>
  100f84:	b8 41 15 10 00       	mov    $0x101541,%eax
  100f89:	66 a3 e8 ea 12 01    	mov    %ax,0x112eae8
  100f8f:	66 c7 05 ea ea 12 01 	movw   $0x8,0x112eaea
  100f96:	08 00 
  100f98:	c6 05 ec ea 12 01 00 	movb   $0x0,0x112eaec
  100f9f:	c6 05 ed ea 12 01 8f 	movb   $0x8f,0x112eaed
  100fa6:	c1 e8 10             	shr    $0x10,%eax
  100fa9:	66 a3 ee ea 12 01    	mov    %ax,0x112eaee
  100faf:	b8 45 15 10 00       	mov    $0x101545,%eax
  100fb4:	66 a3 80 ee 12 01    	mov    %ax,0x112ee80
  100fba:	66 c7 05 82 ee 12 01 	movw   $0x8,0x112ee82
  100fc1:	08 00 
  100fc3:	c6 05 84 ee 12 01 00 	movb   $0x0,0x112ee84
  100fca:	c6 05 85 ee 12 01 ee 	movb   $0xee,0x112ee85
  100fd1:	c1 e8 10             	shr    $0x10,%eax
  100fd4:	66 a3 86 ee 12 01    	mov    %ax,0x112ee86
  100fda:	b8 4e 15 10 00       	mov    $0x10154e,%eax
  100fdf:	66 a3 80 eb 12 01    	mov    %ax,0x112eb80
  100fe5:	66 c7 05 82 eb 12 01 	movw   $0x8,0x112eb82
  100fec:	08 00 
  100fee:	c6 05 84 eb 12 01 00 	movb   $0x0,0x112eb84
  100ff5:	c6 05 85 eb 12 01 8e 	movb   $0x8e,0x112eb85
  100ffc:	c1 e8 10             	shr    $0x10,%eax
  100fff:	66 a3 86 eb 12 01    	mov    %ax,0x112eb86
  101005:	66 c7 05 30 21 10 00 	movw   $0x7ff,0x102130
  10100c:	ff 07 
  10100e:	b8 80 ea 12 01       	mov    $0x112ea80,%eax
  101013:	66 a3 32 21 10 00    	mov    %ax,0x102132
  101019:	c1 e8 10             	shr    $0x10,%eax
  10101c:	66 a3 34 21 10 00    	mov    %ax,0x102134
  101022:	b8 30 21 10 00       	mov    $0x102130,%eax
  101027:	0f 01 18             	lidtl  (%eax)
  10102a:	5b                   	pop    %ebx
  10102b:	5d                   	pop    %ebp
  10102c:	c3                   	ret    
  10102d:	66 90                	xchg   %ax,%ax
  10102f:	90                   	nop

00101030 <syscallHandle>:
  101030:	55                   	push   %ebp
  101031:	89 e5                	mov    %esp,%ebp
  101033:	53                   	push   %ebx
  101034:	50                   	push   %eax
  101035:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101038:	8b 43 1c             	mov    0x1c(%ebx),%eax
  10103b:	83 f8 02             	cmp    $0x2,%eax
  10103e:	74 28                	je     101068 <syscallHandle+0x38>
  101040:	76 3a                	jbe    10107c <syscallHandle+0x4c>
  101042:	83 f8 04             	cmp    $0x4,%eax
  101045:	74 15                	je     10105c <syscallHandle+0x2c>
  101047:	3d e6 00 00 00       	cmp    $0xe6,%eax
  10104c:	75 29                	jne    101077 <syscallHandle+0x47>
  10104e:	89 5d 08             	mov    %ebx,0x8(%ebp)
  101051:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101054:	c9                   	leave  
  101055:	e9 7e f3 ff ff       	jmp    1003d8 <sys_sleep>
  10105a:	66 90                	xchg   %ax,%ax
  10105c:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10105f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101062:	c9                   	leave  
  101063:	e9 40 f5 ff ff       	jmp    1005a8 <sys_write>
  101068:	83 ec 0c             	sub    $0xc,%esp
  10106b:	53                   	push   %ebx
  10106c:	e8 eb f3 ff ff       	call   10045c <sys_fork>
  101071:	89 43 1c             	mov    %eax,0x1c(%ebx)
  101074:	83 c4 10             	add    $0x10,%esp
  101077:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10107a:	c9                   	leave  
  10107b:	c3                   	ret    
  10107c:	48                   	dec    %eax
  10107d:	75 f8                	jne    101077 <syscallHandle+0x47>
  10107f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  101082:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101085:	c9                   	leave  
  101086:	e9 2d f3 ff ff       	jmp    1003b8 <sys_exit>
  10108b:	90                   	nop

0010108c <GProtectFaultHandle>:
  10108c:	55                   	push   %ebp
  10108d:	89 e5                	mov    %esp,%ebp
  10108f:	83 ec 14             	sub    $0x14,%esp
  101092:	68 6c 15 10 00       	push   $0x10156c
  101097:	e8 94 02 00 00       	call   101330 <printk>
  10109c:	58                   	pop    %eax
  10109d:	8b 45 08             	mov    0x8(%ebp),%eax
  1010a0:	ff 70 20             	pushl  0x20(%eax)
  1010a3:	68 58 17 10 00       	push   $0x101758
  1010a8:	6a 54                	push   $0x54
  1010aa:	68 2d 17 10 00       	push   $0x10172d
  1010af:	68 40 17 10 00       	push   $0x101740
  1010b4:	e8 77 02 00 00       	call   101330 <printk>
  1010b9:	83 c4 14             	add    $0x14,%esp
  1010bc:	68 8e 15 10 00       	push   $0x10158e
  1010c1:	e8 6a 02 00 00       	call   101330 <printk>
  1010c6:	5a                   	pop    %edx
  1010c7:	59                   	pop    %ecx
  1010c8:	6a 55                	push   $0x55
  1010ca:	68 2d 17 10 00       	push   $0x10172d
  1010cf:	e8 d0 03 00 00       	call   1014a4 <abort>
  1010d4:	83 c4 10             	add    $0x10,%esp
  1010d7:	c9                   	leave  
  1010d8:	c3                   	ret    
  1010d9:	8d 76 00             	lea    0x0(%esi),%esi

001010dc <timeHandle>:
  1010dc:	55                   	push   %ebp
  1010dd:	89 e5                	mov    %esp,%ebp
  1010df:	53                   	push   %ebx
  1010e0:	83 ec 10             	sub    $0x10,%esp
  1010e3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1010e6:	6a 41                	push   $0x41
  1010e8:	e8 47 f5 ff ff       	call   100634 <putChar>
  1010ed:	e8 d2 f6 ff ff       	call   1007c4 <getpid>
  1010f2:	89 c2                	mov    %eax,%edx
  1010f4:	c1 e2 07             	shl    $0x7,%edx
  1010f7:	01 c2                	add    %eax,%edx
  1010f9:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1010fc:	01 d2                	add    %edx,%edx
  1010fe:	01 d0                	add    %edx,%eax
  101100:	ff 0c c5 00 4a 10 00 	decl   0x104a00(,%eax,8)
  101107:	e8 18 fd ff ff       	call   100e24 <block_decrease>
  10110c:	89 1c 24             	mov    %ebx,(%esp)
  10110f:	e8 a0 fb ff ff       	call   100cb4 <checkTimeCount>
  101114:	83 c4 10             	add    $0x10,%esp
  101117:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  10111e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101121:	c9                   	leave  
  101122:	e9 0d f5 ff ff       	jmp    100634 <putChar>
  101127:	90                   	nop

00101128 <irqHandle>:
  101128:	55                   	push   %ebp
  101129:	89 e5                	mov    %esp,%ebp
  10112b:	53                   	push   %ebx
  10112c:	83 ec 14             	sub    $0x14,%esp
  10112f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101132:	89 6d f4             	mov    %ebp,-0xc(%ebp)
  101135:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101138:	3b 58 08             	cmp    0x8(%eax),%ebx
  10113b:	74 12                	je     10114f <irqHandle+0x27>
  10113d:	83 ec 08             	sub    $0x8,%esp
  101140:	6a 1b                	push   $0x1b
  101142:	68 2d 17 10 00       	push   $0x10172d
  101147:	e8 58 03 00 00       	call   1014a4 <abort>
  10114c:	83 c4 10             	add    $0x10,%esp
  10114f:	fa                   	cli    
  101150:	8b 43 20             	mov    0x20(%ebx),%eax
  101153:	83 f8 0d             	cmp    $0xd,%eax
  101156:	74 48                	je     1011a0 <irqHandle+0x78>
  101158:	7e 2e                	jle    101188 <irqHandle+0x60>
  10115a:	83 f8 20             	cmp    $0x20,%eax
  10115d:	74 19                	je     101178 <irqHandle+0x50>
  10115f:	83 c0 80             	add    $0xffffff80,%eax
  101162:	75 27                	jne    10118b <irqHandle+0x63>
  101164:	83 ec 0c             	sub    $0xc,%esp
  101167:	53                   	push   %ebx
  101168:	e8 c3 fe ff ff       	call   101030 <syscallHandle>
  10116d:	83 c4 10             	add    $0x10,%esp
  101170:	fb                   	sti    
  101171:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101174:	c9                   	leave  
  101175:	c3                   	ret    
  101176:	66 90                	xchg   %ax,%ax
  101178:	83 ec 0c             	sub    $0xc,%esp
  10117b:	53                   	push   %ebx
  10117c:	e8 5b ff ff ff       	call   1010dc <timeHandle>
  101181:	83 c4 10             	add    $0x10,%esp
  101184:	eb ea                	jmp    101170 <irqHandle+0x48>
  101186:	66 90                	xchg   %ax,%ax
  101188:	40                   	inc    %eax
  101189:	74 e5                	je     101170 <irqHandle+0x48>
  10118b:	83 ec 08             	sub    $0x8,%esp
  10118e:	6a 2f                	push   $0x2f
  101190:	68 2d 17 10 00       	push   $0x10172d
  101195:	e8 0a 03 00 00       	call   1014a4 <abort>
  10119a:	83 c4 10             	add    $0x10,%esp
  10119d:	eb d1                	jmp    101170 <irqHandle+0x48>
  10119f:	90                   	nop
  1011a0:	83 ec 0c             	sub    $0xc,%esp
  1011a3:	53                   	push   %ebx
  1011a4:	e8 e3 fe ff ff       	call   10108c <GProtectFaultHandle>
  1011a9:	83 c4 10             	add    $0x10,%esp
  1011ac:	eb c2                	jmp    101170 <irqHandle+0x48>
  1011ae:	66 90                	xchg   %ax,%ax

001011b0 <initIntr>:
  1011b0:	55                   	push   %ebp
  1011b1:	89 e5                	mov    %esp,%ebp
  1011b3:	ba 21 00 00 00       	mov    $0x21,%edx
  1011b8:	b0 ff                	mov    $0xff,%al
  1011ba:	ee                   	out    %al,(%dx)
  1011bb:	ba a1 00 00 00       	mov    $0xa1,%edx
  1011c0:	ee                   	out    %al,(%dx)
  1011c1:	ba 20 00 00 00       	mov    $0x20,%edx
  1011c6:	b0 11                	mov    $0x11,%al
  1011c8:	ee                   	out    %al,(%dx)
  1011c9:	ba 21 00 00 00       	mov    $0x21,%edx
  1011ce:	b0 20                	mov    $0x20,%al
  1011d0:	ee                   	out    %al,(%dx)
  1011d1:	b0 04                	mov    $0x4,%al
  1011d3:	ee                   	out    %al,(%dx)
  1011d4:	b0 03                	mov    $0x3,%al
  1011d6:	ee                   	out    %al,(%dx)
  1011d7:	ba a0 00 00 00       	mov    $0xa0,%edx
  1011dc:	b0 11                	mov    $0x11,%al
  1011de:	ee                   	out    %al,(%dx)
  1011df:	ba a1 00 00 00       	mov    $0xa1,%edx
  1011e4:	b0 28                	mov    $0x28,%al
  1011e6:	ee                   	out    %al,(%dx)
  1011e7:	b0 02                	mov    $0x2,%al
  1011e9:	ee                   	out    %al,(%dx)
  1011ea:	b0 03                	mov    $0x3,%al
  1011ec:	ee                   	out    %al,(%dx)
  1011ed:	ba 20 00 00 00       	mov    $0x20,%edx
  1011f2:	b0 68                	mov    $0x68,%al
  1011f4:	ee                   	out    %al,(%dx)
  1011f5:	b0 0a                	mov    $0xa,%al
  1011f7:	ee                   	out    %al,(%dx)
  1011f8:	ba a0 00 00 00       	mov    $0xa0,%edx
  1011fd:	b0 68                	mov    $0x68,%al
  1011ff:	ee                   	out    %al,(%dx)
  101200:	b0 0a                	mov    $0xa,%al
  101202:	ee                   	out    %al,(%dx)
  101203:	5d                   	pop    %ebp
  101204:	c3                   	ret    
  101205:	8d 76 00             	lea    0x0(%esi),%esi

00101208 <initTimer>:
  101208:	55                   	push   %ebp
  101209:	89 e5                	mov    %esp,%ebp
  10120b:	ba 43 00 00 00       	mov    $0x43,%edx
  101210:	b0 34                	mov    $0x34,%al
  101212:	ee                   	out    %al,(%dx)
  101213:	ba 40 00 00 00       	mov    $0x40,%edx
  101218:	b0 9b                	mov    $0x9b,%al
  10121a:	ee                   	out    %al,(%dx)
  10121b:	b0 2e                	mov    $0x2e,%al
  10121d:	ee                   	out    %al,(%dx)
  10121e:	5d                   	pop    %ebp
  10121f:	c3                   	ret    

00101220 <i2A>:
  101220:	55                   	push   %ebp
  101221:	89 e5                	mov    %esp,%ebp
  101223:	57                   	push   %edi
  101224:	56                   	push   %esi
  101225:	53                   	push   %ebx
  101226:	51                   	push   %ecx
  101227:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10122a:	85 c9                	test   %ecx,%ecx
  10122c:	78 6e                	js     10129c <i2A+0x7c>
  10122e:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  101232:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  101236:	bb 7e 21 10 00       	mov    $0x10217e,%ebx
  10123b:	31 ff                	xor    %edi,%edi
  10123d:	eb 03                	jmp    101242 <i2A+0x22>
  10123f:	90                   	nop
  101240:	89 f7                	mov    %esi,%edi
  101242:	4b                   	dec    %ebx
  101243:	89 c8                	mov    %ecx,%eax
  101245:	be 0a 00 00 00       	mov    $0xa,%esi
  10124a:	99                   	cltd   
  10124b:	f7 fe                	idiv   %esi
  10124d:	83 c2 30             	add    $0x30,%edx
  101250:	88 13                	mov    %dl,(%ebx)
  101252:	8d 77 01             	lea    0x1(%edi),%esi
  101255:	b8 67 66 66 66       	mov    $0x66666667,%eax
  10125a:	f7 e9                	imul   %ecx
  10125c:	89 d0                	mov    %edx,%eax
  10125e:	c1 f8 02             	sar    $0x2,%eax
  101261:	c1 f9 1f             	sar    $0x1f,%ecx
  101264:	29 c8                	sub    %ecx,%eax
  101266:	89 c1                	mov    %eax,%ecx
  101268:	75 d6                	jne    101240 <i2A+0x20>
  10126a:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  10126e:	74 20                	je     101290 <i2A+0x70>
  101270:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  101274:	75 06                	jne    10127c <i2A+0x5c>
  101276:	fe 05 7d 21 10 00    	incb   0x10217d
  10127c:	c6 05 7e 21 10 00 00 	movb   $0x0,0x10217e
  101283:	8b 45 0c             	mov    0xc(%ebp),%eax
  101286:	89 18                	mov    %ebx,(%eax)
  101288:	89 f0                	mov    %esi,%eax
  10128a:	5a                   	pop    %edx
  10128b:	5b                   	pop    %ebx
  10128c:	5e                   	pop    %esi
  10128d:	5f                   	pop    %edi
  10128e:	5d                   	pop    %ebp
  10128f:	c3                   	ret    
  101290:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  101294:	8d 77 02             	lea    0x2(%edi),%esi
  101297:	4b                   	dec    %ebx
  101298:	eb d6                	jmp    101270 <i2A+0x50>
  10129a:	66 90                	xchg   %ax,%ax
  10129c:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  1012a2:	74 0c                	je     1012b0 <i2A+0x90>
  1012a4:	f7 d9                	neg    %ecx
  1012a6:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  1012aa:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  1012ae:	eb 86                	jmp    101236 <i2A+0x16>
  1012b0:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  1012b5:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  1012b9:	eb ef                	jmp    1012aa <i2A+0x8a>
  1012bb:	90                   	nop

001012bc <i2X>:
  1012bc:	55                   	push   %ebp
  1012bd:	89 e5                	mov    %esp,%ebp
  1012bf:	57                   	push   %edi
  1012c0:	56                   	push   %esi
  1012c1:	53                   	push   %ebx
  1012c2:	8b 55 08             	mov    0x8(%ebp),%edx
  1012c5:	b9 5d 21 10 00       	mov    $0x10215d,%ecx
  1012ca:	31 c0                	xor    %eax,%eax
  1012cc:	40                   	inc    %eax
  1012cd:	89 d6                	mov    %edx,%esi
  1012cf:	83 e6 0f             	and    $0xf,%esi
  1012d2:	8d 5e f6             	lea    -0xa(%esi),%ebx
  1012d5:	89 cf                	mov    %ecx,%edi
  1012d7:	83 fb 05             	cmp    $0x5,%ebx
  1012da:	77 4c                	ja     101328 <i2X+0x6c>
  1012dc:	ff 24 9d 6c 17 10 00 	jmp    *0x10176c(,%ebx,4)
  1012e3:	90                   	nop
  1012e4:	c6 01 65             	movb   $0x65,(%ecx)
  1012e7:	90                   	nop
  1012e8:	49                   	dec    %ecx
  1012e9:	c1 ea 04             	shr    $0x4,%edx
  1012ec:	75 de                	jne    1012cc <i2X+0x10>
  1012ee:	c6 05 5e 21 10 00 00 	movb   $0x0,0x10215e
  1012f5:	8b 55 0c             	mov    0xc(%ebp),%edx
  1012f8:	89 3a                	mov    %edi,(%edx)
  1012fa:	5b                   	pop    %ebx
  1012fb:	5e                   	pop    %esi
  1012fc:	5f                   	pop    %edi
  1012fd:	5d                   	pop    %ebp
  1012fe:	c3                   	ret    
  1012ff:	90                   	nop
  101300:	c6 01 64             	movb   $0x64,(%ecx)
  101303:	eb e3                	jmp    1012e8 <i2X+0x2c>
  101305:	8d 76 00             	lea    0x0(%esi),%esi
  101308:	c6 01 63             	movb   $0x63,(%ecx)
  10130b:	eb db                	jmp    1012e8 <i2X+0x2c>
  10130d:	8d 76 00             	lea    0x0(%esi),%esi
  101310:	c6 01 62             	movb   $0x62,(%ecx)
  101313:	eb d3                	jmp    1012e8 <i2X+0x2c>
  101315:	8d 76 00             	lea    0x0(%esi),%esi
  101318:	c6 01 61             	movb   $0x61,(%ecx)
  10131b:	eb cb                	jmp    1012e8 <i2X+0x2c>
  10131d:	8d 76 00             	lea    0x0(%esi),%esi
  101320:	c6 01 66             	movb   $0x66,(%ecx)
  101323:	eb c3                	jmp    1012e8 <i2X+0x2c>
  101325:	8d 76 00             	lea    0x0(%esi),%esi
  101328:	8d 5e 30             	lea    0x30(%esi),%ebx
  10132b:	88 19                	mov    %bl,(%ecx)
  10132d:	eb b9                	jmp    1012e8 <i2X+0x2c>
  10132f:	90                   	nop

00101330 <printk>:
  101330:	55                   	push   %ebp
  101331:	89 e5                	mov    %esp,%ebp
  101333:	57                   	push   %edi
  101334:	56                   	push   %esi
  101335:	53                   	push   %ebx
  101336:	83 ec 2c             	sub    $0x2c,%esp
  101339:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10133c:	8a 11                	mov    (%ecx),%dl
  10133e:	84 d2                	test   %dl,%dl
  101340:	0f 84 54 01 00 00    	je     10149a <printk+0x16a>
  101346:	8d 45 0c             	lea    0xc(%ebp),%eax
  101349:	31 ff                	xor    %edi,%edi
  10134b:	eb 18                	jmp    101365 <printk+0x35>
  10134d:	8d 76 00             	lea    0x0(%esi),%esi
  101350:	8a 11                	mov    (%ecx),%dl
  101352:	89 cb                	mov    %ecx,%ebx
  101354:	88 97 80 21 10 00    	mov    %dl,0x102180(%edi)
  10135a:	47                   	inc    %edi
  10135b:	8d 4b 01             	lea    0x1(%ebx),%ecx
  10135e:	8a 53 01             	mov    0x1(%ebx),%dl
  101361:	84 d2                	test   %dl,%dl
  101363:	74 72                	je     1013d7 <printk+0xa7>
  101365:	80 fa 25             	cmp    $0x25,%dl
  101368:	75 e6                	jne    101350 <printk+0x20>
  10136a:	8d 59 01             	lea    0x1(%ecx),%ebx
  10136d:	8a 51 01             	mov    0x1(%ecx),%dl
  101370:	80 fa 64             	cmp    $0x64,%dl
  101373:	0f 84 bf 00 00 00    	je     101438 <printk+0x108>
  101379:	0f 8e 01 01 00 00    	jle    101480 <printk+0x150>
  10137f:	80 fa 73             	cmp    $0x73,%dl
  101382:	0f 84 84 00 00 00    	je     10140c <printk+0xdc>
  101388:	80 fa 78             	cmp    $0x78,%dl
  10138b:	75 c7                	jne    101354 <printk+0x24>
  10138d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  101394:	8d 70 04             	lea    0x4(%eax),%esi
  101397:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10139a:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  10139d:	56                   	push   %esi
  10139e:	ff 30                	pushl  (%eax)
  1013a0:	e8 17 ff ff ff       	call   1012bc <i2X>
  1013a5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1013a8:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  1013ae:	8a 11                	mov    (%ecx),%dl
  1013b0:	83 c4 08             	add    $0x8,%esp
  1013b3:	31 c0                	xor    %eax,%eax
  1013b5:	84 d2                	test   %dl,%dl
  1013b7:	74 0f                	je     1013c8 <printk+0x98>
  1013b9:	8d 76 00             	lea    0x0(%esi),%esi
  1013bc:	40                   	inc    %eax
  1013bd:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1013c1:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  1013c4:	84 d2                	test   %dl,%dl
  1013c6:	75 f4                	jne    1013bc <printk+0x8c>
  1013c8:	01 c7                	add    %eax,%edi
  1013ca:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1013cd:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1013d0:	8a 53 01             	mov    0x1(%ebx),%dl
  1013d3:	84 d2                	test   %dl,%dl
  1013d5:	75 8e                	jne    101365 <printk+0x35>
  1013d7:	c6 87 80 21 10 00 00 	movb   $0x0,0x102180(%edi)
  1013de:	0f be 05 80 21 10 00 	movsbl 0x102180,%eax
  1013e5:	bb 80 21 10 00       	mov    $0x102180,%ebx
  1013ea:	84 c0                	test   %al,%al
  1013ec:	74 16                	je     101404 <printk+0xd4>
  1013ee:	66 90                	xchg   %ax,%ax
  1013f0:	83 ec 0c             	sub    $0xc,%esp
  1013f3:	50                   	push   %eax
  1013f4:	e8 3b f2 ff ff       	call   100634 <putChar>
  1013f9:	43                   	inc    %ebx
  1013fa:	0f be 03             	movsbl (%ebx),%eax
  1013fd:	83 c4 10             	add    $0x10,%esp
  101400:	84 c0                	test   %al,%al
  101402:	75 ec                	jne    1013f0 <printk+0xc0>
  101404:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101407:	5b                   	pop    %ebx
  101408:	5e                   	pop    %esi
  101409:	5f                   	pop    %edi
  10140a:	5d                   	pop    %ebp
  10140b:	c3                   	ret    
  10140c:	8d 70 04             	lea    0x4(%eax),%esi
  10140f:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101412:	8b 08                	mov    (%eax),%ecx
  101414:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  10141a:	8a 11                	mov    (%ecx),%dl
  10141c:	31 c0                	xor    %eax,%eax
  10141e:	84 d2                	test   %dl,%dl
  101420:	74 a6                	je     1013c8 <printk+0x98>
  101422:	66 90                	xchg   %ax,%ax
  101424:	40                   	inc    %eax
  101425:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101429:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  10142c:	84 d2                	test   %dl,%dl
  10142e:	75 f4                	jne    101424 <printk+0xf4>
  101430:	01 c7                	add    %eax,%edi
  101432:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101435:	eb 96                	jmp    1013cd <printk+0x9d>
  101437:	90                   	nop
  101438:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10143f:	8d 70 04             	lea    0x4(%eax),%esi
  101442:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101445:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101448:	56                   	push   %esi
  101449:	ff 30                	pushl  (%eax)
  10144b:	e8 d0 fd ff ff       	call   101220 <i2A>
  101450:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  101453:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  101459:	8a 11                	mov    (%ecx),%dl
  10145b:	83 c4 08             	add    $0x8,%esp
  10145e:	31 c0                	xor    %eax,%eax
  101460:	84 d2                	test   %dl,%dl
  101462:	0f 84 60 ff ff ff    	je     1013c8 <printk+0x98>
  101468:	40                   	inc    %eax
  101469:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  10146d:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  101470:	84 d2                	test   %dl,%dl
  101472:	75 f4                	jne    101468 <printk+0x138>
  101474:	01 c7                	add    %eax,%edi
  101476:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101479:	e9 4f ff ff ff       	jmp    1013cd <printk+0x9d>
  10147e:	66 90                	xchg   %ax,%ax
  101480:	80 fa 63             	cmp    $0x63,%dl
  101483:	0f 85 cb fe ff ff    	jne    101354 <printk+0x24>
  101489:	8b 10                	mov    (%eax),%edx
  10148b:	88 97 80 21 10 00    	mov    %dl,0x102180(%edi)
  101491:	83 c0 04             	add    $0x4,%eax
  101494:	47                   	inc    %edi
  101495:	e9 c1 fe ff ff       	jmp    10135b <printk+0x2b>
  10149a:	31 ff                	xor    %edi,%edi
  10149c:	e9 36 ff ff ff       	jmp    1013d7 <printk+0xa7>
  1014a1:	66 90                	xchg   %ax,%ax
  1014a3:	90                   	nop

001014a4 <abort>:
  1014a4:	55                   	push   %ebp
  1014a5:	89 e5                	mov    %esp,%ebp
  1014a7:	57                   	push   %edi
  1014a8:	56                   	push   %esi
  1014a9:	53                   	push   %ebx
  1014aa:	83 ec 1c             	sub    $0x1c,%esp
  1014ad:	8b 55 08             	mov    0x8(%ebp),%edx
  1014b0:	fa                   	cli    
  1014b1:	8a 02                	mov    (%edx),%al
  1014b3:	b9 32 20 10 00       	mov    $0x102032,%ecx
  1014b8:	84 c0                	test   %al,%al
  1014ba:	74 0b                	je     1014c7 <abort+0x23>
  1014bc:	41                   	inc    %ecx
  1014bd:	42                   	inc    %edx
  1014be:	88 41 ff             	mov    %al,-0x1(%ecx)
  1014c1:	8a 02                	mov    (%edx),%al
  1014c3:	84 c0                	test   %al,%al
  1014c5:	75 f5                	jne    1014bc <abort+0x18>
  1014c7:	c6 01 3a             	movb   $0x3a,(%ecx)
  1014ca:	bb 9d 29 10 00       	mov    $0x10299d,%ebx
  1014cf:	be 0a 00 00 00       	mov    $0xa,%esi
  1014d4:	bf 67 66 66 66       	mov    $0x66666667,%edi
  1014d9:	4b                   	dec    %ebx
  1014da:	8b 45 0c             	mov    0xc(%ebp),%eax
  1014dd:	99                   	cltd   
  1014de:	f7 fe                	idiv   %esi
  1014e0:	8d 42 30             	lea    0x30(%edx),%eax
  1014e3:	88 45 e7             	mov    %al,-0x19(%ebp)
  1014e6:	88 03                	mov    %al,(%ebx)
  1014e8:	89 f8                	mov    %edi,%eax
  1014ea:	f7 6d 0c             	imull  0xc(%ebp)
  1014ed:	c1 fa 02             	sar    $0x2,%edx
  1014f0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1014f3:	c1 f8 1f             	sar    $0x1f,%eax
  1014f6:	29 c2                	sub    %eax,%edx
  1014f8:	89 55 0c             	mov    %edx,0xc(%ebp)
  1014fb:	75 dc                	jne    1014d9 <abort+0x35>
  1014fd:	41                   	inc    %ecx
  1014fe:	41                   	inc    %ecx
  1014ff:	43                   	inc    %ebx
  101500:	8a 45 e7             	mov    -0x19(%ebp),%al
  101503:	88 41 ff             	mov    %al,-0x1(%ecx)
  101506:	8a 03                	mov    (%ebx),%al
  101508:	88 45 e7             	mov    %al,-0x19(%ebp)
  10150b:	84 c0                	test   %al,%al
  10150d:	75 ef                	jne    1014fe <abort+0x5a>
  10150f:	c6 01 0a             	movb   $0xa,(%ecx)
  101512:	0f be 05 20 20 10 00 	movsbl 0x102020,%eax
  101519:	84 c0                	test   %al,%al
  10151b:	74 1b                	je     101538 <abort+0x94>
  10151d:	bb 20 20 10 00       	mov    $0x102020,%ebx
  101522:	83 ec 0c             	sub    $0xc,%esp
  101525:	50                   	push   %eax
  101526:	e8 09 f1 ff ff       	call   100634 <putChar>
  10152b:	43                   	inc    %ebx
  10152c:	0f be 03             	movsbl (%ebx),%eax
  10152f:	83 c4 10             	add    $0x10,%esp
  101532:	84 c0                	test   %al,%al
  101534:	75 ec                	jne    101522 <abort+0x7e>
  101536:	66 90                	xchg   %ax,%ax
  101538:	f4                   	hlt    
  101539:	eb fd                	jmp    101538 <abort+0x94>

0010153b <irqEmpty>:
  10153b:	6a 00                	push   $0x0
  10153d:	6a ff                	push   $0xffffffff
  10153f:	eb 13                	jmp    101554 <asmDoIrq>

00101541 <irqGProtectFault>:
  101541:	6a 0d                	push   $0xd
  101543:	eb 0f                	jmp    101554 <asmDoIrq>

00101545 <irqSyscall>:
  101545:	6a 00                	push   $0x0
  101547:	68 80 00 00 00       	push   $0x80
  10154c:	eb 06                	jmp    101554 <asmDoIrq>

0010154e <irqTime>:
  10154e:	6a 00                	push   $0x0
  101550:	6a 20                	push   $0x20
  101552:	eb 00                	jmp    101554 <asmDoIrq>

00101554 <asmDoIrq>:
  101554:	60                   	pusha  
  101555:	54                   	push   %esp
  101556:	e8 cd fb ff ff       	call   101128 <irqHandle>
  10155b:	5c                   	pop    %esp
  10155c:	61                   	popa   
  10155d:	83 c4 04             	add    $0x4,%esp
  101560:	83 c4 04             	add    $0x4,%esp
  101563:	cf                   	iret   
