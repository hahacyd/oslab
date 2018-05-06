
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 49 15 00 00       	call   101554 <initTimer>
  10000b:	e8 28 10 00 00       	call   101038 <init_pcb>
  100010:	e8 6f 10 00 00       	call   101084 <init_kernel_pcb>
  100015:	e8 b6 08 00 00       	call   1008d0 <initSerial>
  10001a:	e8 45 11 00 00       	call   101164 <initIdt>
  10001f:	e8 d8 14 00 00       	call   1014fc <initIntr>
  100024:	e8 4f 02 00 00       	call   100278 <initSeg>
  100029:	fb                   	sti    
  10002a:	e8 dd 04 00 00       	call   10050c <loadUMain>
  10002f:	eb fe                	jmp    10002f <kEntry+0x2f>
  100031:	66 90                	xchg   %ax,%ax
  100033:	90                   	nop

00100034 <change_gdt>:
  100034:	55                   	push   %ebp
  100035:	89 e5                	mov    %esp,%ebp
  100037:	53                   	push   %ebx
  100038:	51                   	push   %ecx
  100039:	8b 45 0c             	mov    0xc(%ebp),%eax
  10003c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10003f:	c1 eb 03             	shr    $0x3,%ebx
  100042:	83 fb 02             	cmp    $0x2,%ebx
  100045:	0f 84 31 01 00 00    	je     10017c <change_gdt+0x148>
  10004b:	0f 86 a3 00 00 00    	jbe    1000f4 <change_gdt+0xc0>
  100051:	83 fb 03             	cmp    $0x3,%ebx
  100054:	74 6a                	je     1000c0 <change_gdt+0x8c>
  100056:	83 fb 04             	cmp    $0x4,%ebx
  100059:	0f 85 d1 00 00 00    	jne    100130 <change_gdt+0xfc>
  10005f:	66 c7 05 00 7d 13 01 	movw   $0xffff,0x1137d00
  100066:	ff ff 
  100068:	66 a3 02 7d 13 01    	mov    %ax,0x1137d02
  10006e:	89 c2                	mov    %eax,%edx
  100070:	c1 ea 10             	shr    $0x10,%edx
  100073:	88 15 04 7d 13 01    	mov    %dl,0x1137d04
  100079:	c6 05 05 7d 13 01 f2 	movb   $0xf2,0x1137d05
  100080:	c6 05 06 7d 13 01 cf 	movb   $0xcf,0x1137d06
  100087:	c1 e8 18             	shr    $0x18,%eax
  10008a:	a2 07 7d 13 01       	mov    %al,0x1137d07
  10008f:	66 c7 05 40 34 10 00 	movw   $0x4f,0x103440
  100096:	4f 00 
  100098:	b8 e0 7c 13 01       	mov    $0x1137ce0,%eax
  10009d:	66 a3 42 34 10 00    	mov    %ax,0x103442
  1000a3:	c1 e8 10             	shr    $0x10,%eax
  1000a6:	66 a3 44 34 10 00    	mov    %ax,0x103444
  1000ac:	b8 40 34 10 00       	mov    $0x103440,%eax
  1000b1:	0f 01 10             	lgdtl  (%eax)
  1000b4:	b8 01 00 00 00       	mov    $0x1,%eax
  1000b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000bc:	c9                   	leave  
  1000bd:	c3                   	ret    
  1000be:	66 90                	xchg   %ax,%ax
  1000c0:	66 c7 05 f8 7c 13 01 	movw   $0xffff,0x1137cf8
  1000c7:	ff ff 
  1000c9:	66 a3 fa 7c 13 01    	mov    %ax,0x1137cfa
  1000cf:	89 c2                	mov    %eax,%edx
  1000d1:	c1 ea 10             	shr    $0x10,%edx
  1000d4:	88 15 fc 7c 13 01    	mov    %dl,0x1137cfc
  1000da:	c6 05 fd 7c 13 01 fa 	movb   $0xfa,0x1137cfd
  1000e1:	c6 05 fe 7c 13 01 cf 	movb   $0xcf,0x1137cfe
  1000e8:	c1 e8 18             	shr    $0x18,%eax
  1000eb:	a2 ff 7c 13 01       	mov    %al,0x1137cff
  1000f0:	eb 9d                	jmp    10008f <change_gdt+0x5b>
  1000f2:	66 90                	xchg   %ax,%ax
  1000f4:	83 fb 01             	cmp    $0x1,%ebx
  1000f7:	75 37                	jne    100130 <change_gdt+0xfc>
  1000f9:	66 c7 05 e8 7c 13 01 	movw   $0xffff,0x1137ce8
  100100:	ff ff 
  100102:	66 a3 ea 7c 13 01    	mov    %ax,0x1137cea
  100108:	89 c2                	mov    %eax,%edx
  10010a:	c1 ea 10             	shr    $0x10,%edx
  10010d:	88 15 ec 7c 13 01    	mov    %dl,0x1137cec
  100113:	c6 05 ed 7c 13 01 9a 	movb   $0x9a,0x1137ced
  10011a:	c6 05 ee 7c 13 01 cf 	movb   $0xcf,0x1137cee
  100121:	c1 e8 18             	shr    $0x18,%eax
  100124:	a2 ef 7c 13 01       	mov    %al,0x1137cef
  100129:	e9 61 ff ff ff       	jmp    10008f <change_gdt+0x5b>
  10012e:	66 90                	xchg   %ax,%ax
  100130:	83 ec 0c             	sub    $0xc,%esp
  100133:	68 bc 18 10 00       	push   $0x1018bc
  100138:	e8 3f 15 00 00       	call   10167c <printk>
  10013d:	89 1c 24             	mov    %ebx,(%esp)
  100140:	68 fc 18 10 00       	push   $0x1018fc
  100145:	6a 18                	push   $0x18
  100147:	68 c2 18 10 00       	push   $0x1018c2
  10014c:	68 cf 18 10 00       	push   $0x1018cf
  100151:	e8 26 15 00 00       	call   10167c <printk>
  100156:	83 c4 14             	add    $0x14,%esp
  100159:	68 eb 18 10 00       	push   $0x1018eb
  10015e:	e8 19 15 00 00       	call   10167c <printk>
  100163:	58                   	pop    %eax
  100164:	5a                   	pop    %edx
  100165:	6a 19                	push   $0x19
  100167:	68 c2 18 10 00       	push   $0x1018c2
  10016c:	e8 7f 16 00 00       	call   1017f0 <abort>
  100171:	83 c4 10             	add    $0x10,%esp
  100174:	e9 16 ff ff ff       	jmp    10008f <change_gdt+0x5b>
  100179:	8d 76 00             	lea    0x0(%esi),%esi
  10017c:	66 c7 05 f0 7c 13 01 	movw   $0xffff,0x1137cf0
  100183:	ff ff 
  100185:	66 a3 f2 7c 13 01    	mov    %ax,0x1137cf2
  10018b:	89 c2                	mov    %eax,%edx
  10018d:	c1 ea 10             	shr    $0x10,%edx
  100190:	88 15 f4 7c 13 01    	mov    %dl,0x1137cf4
  100196:	c6 05 f5 7c 13 01 92 	movb   $0x92,0x1137cf5
  10019d:	c6 05 f6 7c 13 01 cf 	movb   $0xcf,0x1137cf6
  1001a4:	c1 e8 18             	shr    $0x18,%eax
  1001a7:	a2 f7 7c 13 01       	mov    %al,0x1137cf7
  1001ac:	e9 de fe ff ff       	jmp    10008f <change_gdt+0x5b>
  1001b1:	8d 76 00             	lea    0x0(%esi),%esi

001001b4 <change_tss>:
  1001b4:	55                   	push   %ebp
  1001b5:	89 e5                	mov    %esp,%ebp
  1001b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1001ba:	a3 48 7d 13 01       	mov    %eax,0x1137d48
  1001bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1001c2:	a3 44 7d 13 01       	mov    %eax,0x1137d44
  1001c7:	b8 01 00 00 00       	mov    $0x1,%eax
  1001cc:	5d                   	pop    %ebp
  1001cd:	c3                   	ret    
  1001ce:	66 90                	xchg   %ax,%ax

001001d0 <get_tss>:
  1001d0:	55                   	push   %ebp
  1001d1:	89 e5                	mov    %esp,%ebp
  1001d3:	57                   	push   %edi
  1001d4:	56                   	push   %esi
  1001d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1001d8:	be 40 7d 13 01       	mov    $0x1137d40,%esi
  1001dd:	b9 19 00 00 00       	mov    $0x19,%ecx
  1001e2:	89 c7                	mov    %eax,%edi
  1001e4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1001e6:	5e                   	pop    %esi
  1001e7:	5f                   	pop    %edi
  1001e8:	5d                   	pop    %ebp
  1001e9:	c2 04 00             	ret    $0x4

001001ec <waitDisk>:
  1001ec:	55                   	push   %ebp
  1001ed:	89 e5                	mov    %esp,%ebp
  1001ef:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1001f4:	ec                   	in     (%dx),%al
  1001f5:	83 e0 c0             	and    $0xffffffc0,%eax
  1001f8:	3c 40                	cmp    $0x40,%al
  1001fa:	75 f8                	jne    1001f4 <waitDisk+0x8>
  1001fc:	5d                   	pop    %ebp
  1001fd:	c3                   	ret    
  1001fe:	66 90                	xchg   %ax,%ax

00100200 <readSect>:
  100200:	55                   	push   %ebp
  100201:	89 e5                	mov    %esp,%ebp
  100203:	53                   	push   %ebx
  100204:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100207:	ba f7 01 00 00       	mov    $0x1f7,%edx
  10020c:	ec                   	in     (%dx),%al
  10020d:	83 e0 c0             	and    $0xffffffc0,%eax
  100210:	3c 40                	cmp    $0x40,%al
  100212:	75 f8                	jne    10020c <readSect+0xc>
  100214:	ba f2 01 00 00       	mov    $0x1f2,%edx
  100219:	b0 01                	mov    $0x1,%al
  10021b:	ee                   	out    %al,(%dx)
  10021c:	ba f3 01 00 00       	mov    $0x1f3,%edx
  100221:	88 c8                	mov    %cl,%al
  100223:	ee                   	out    %al,(%dx)
  100224:	89 c8                	mov    %ecx,%eax
  100226:	c1 f8 08             	sar    $0x8,%eax
  100229:	ba f4 01 00 00       	mov    $0x1f4,%edx
  10022e:	ee                   	out    %al,(%dx)
  10022f:	89 c8                	mov    %ecx,%eax
  100231:	c1 f8 10             	sar    $0x10,%eax
  100234:	ba f5 01 00 00       	mov    $0x1f5,%edx
  100239:	ee                   	out    %al,(%dx)
  10023a:	89 c8                	mov    %ecx,%eax
  10023c:	c1 f8 18             	sar    $0x18,%eax
  10023f:	83 c8 e0             	or     $0xffffffe0,%eax
  100242:	ba f6 01 00 00       	mov    $0x1f6,%edx
  100247:	ee                   	out    %al,(%dx)
  100248:	ba f7 01 00 00       	mov    $0x1f7,%edx
  10024d:	b0 20                	mov    $0x20,%al
  10024f:	ee                   	out    %al,(%dx)
  100250:	ec                   	in     (%dx),%al
  100251:	83 e0 c0             	and    $0xffffffc0,%eax
  100254:	3c 40                	cmp    $0x40,%al
  100256:	75 f8                	jne    100250 <readSect+0x50>
  100258:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10025b:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  100261:	ba f0 01 00 00       	mov    $0x1f0,%edx
  100266:	66 90                	xchg   %ax,%ax
  100268:	ed                   	in     (%dx),%eax
  100269:	89 01                	mov    %eax,(%ecx)
  10026b:	83 c1 04             	add    $0x4,%ecx
  10026e:	39 d9                	cmp    %ebx,%ecx
  100270:	75 f6                	jne    100268 <readSect+0x68>
  100272:	5b                   	pop    %ebx
  100273:	5d                   	pop    %ebp
  100274:	c3                   	ret    
  100275:	8d 76 00             	lea    0x0(%esi),%esi

00100278 <initSeg>:
  100278:	55                   	push   %ebp
  100279:	89 e5                	mov    %esp,%ebp
  10027b:	b9 e0 7c 13 01       	mov    $0x1137ce0,%ecx
  100280:	66 c7 05 e8 7c 13 01 	movw   $0xffff,0x1137ce8
  100287:	ff ff 
  100289:	66 c7 05 ea 7c 13 01 	movw   $0x0,0x1137cea
  100290:	00 00 
  100292:	c6 05 ec 7c 13 01 00 	movb   $0x0,0x1137cec
  100299:	c6 05 ed 7c 13 01 9a 	movb   $0x9a,0x1137ced
  1002a0:	c6 05 ee 7c 13 01 cf 	movb   $0xcf,0x1137cee
  1002a7:	c6 05 ef 7c 13 01 00 	movb   $0x0,0x1137cef
  1002ae:	66 c7 05 f0 7c 13 01 	movw   $0xffff,0x1137cf0
  1002b5:	ff ff 
  1002b7:	66 c7 05 f2 7c 13 01 	movw   $0x0,0x1137cf2
  1002be:	00 00 
  1002c0:	c6 05 f4 7c 13 01 00 	movb   $0x0,0x1137cf4
  1002c7:	c6 05 f5 7c 13 01 92 	movb   $0x92,0x1137cf5
  1002ce:	c6 05 f6 7c 13 01 cf 	movb   $0xcf,0x1137cf6
  1002d5:	c6 05 f7 7c 13 01 00 	movb   $0x0,0x1137cf7
  1002dc:	66 c7 05 f8 7c 13 01 	movw   $0xffff,0x1137cf8
  1002e3:	ff ff 
  1002e5:	66 c7 05 fa 7c 13 01 	movw   $0x0,0x1137cfa
  1002ec:	00 00 
  1002ee:	c6 05 fc 7c 13 01 00 	movb   $0x0,0x1137cfc
  1002f5:	c6 05 fd 7c 13 01 fa 	movb   $0xfa,0x1137cfd
  1002fc:	c6 05 fe 7c 13 01 cf 	movb   $0xcf,0x1137cfe
  100303:	c6 05 ff 7c 13 01 00 	movb   $0x0,0x1137cff
  10030a:	66 c7 05 00 7d 13 01 	movw   $0xffff,0x1137d00
  100311:	ff ff 
  100313:	66 c7 05 02 7d 13 01 	movw   $0x0,0x1137d02
  10031a:	00 00 
  10031c:	c6 05 04 7d 13 01 00 	movb   $0x0,0x1137d04
  100323:	c6 05 05 7d 13 01 f2 	movb   $0xf2,0x1137d05
  10032a:	c6 05 06 7d 13 01 cf 	movb   $0xcf,0x1137d06
  100331:	c6 05 07 7d 13 01 00 	movb   $0x0,0x1137d07
  100338:	66 c7 05 08 7d 13 01 	movw   $0x63,0x1137d08
  10033f:	63 00 
  100341:	b8 40 7d 13 01       	mov    $0x1137d40,%eax
  100346:	66 a3 0a 7d 13 01    	mov    %ax,0x1137d0a
  10034c:	89 c2                	mov    %eax,%edx
  10034e:	c1 ea 10             	shr    $0x10,%edx
  100351:	88 15 0c 7d 13 01    	mov    %dl,0x1137d0c
  100357:	c6 05 0d 7d 13 01 89 	movb   $0x89,0x1137d0d
  10035e:	c6 05 0e 7d 13 01 40 	movb   $0x40,0x1137d0e
  100365:	c1 e8 18             	shr    $0x18,%eax
  100368:	a2 0f 7d 13 01       	mov    %al,0x1137d0f
  10036d:	a1 f4 18 10 00       	mov    0x1018f4,%eax
  100372:	8b 15 f8 18 10 00    	mov    0x1018f8,%edx
  100378:	a3 10 7d 13 01       	mov    %eax,0x1137d10
  10037d:	89 15 14 7d 13 01    	mov    %edx,0x1137d14
  100383:	66 c7 05 20 7d 13 01 	movw   $0xffff,0x1137d20
  10038a:	ff ff 
  10038c:	66 c7 05 22 7d 13 01 	movw   $0x0,0x1137d22
  100393:	00 00 
  100395:	c6 05 24 7d 13 01 00 	movb   $0x0,0x1137d24
  10039c:	c6 05 25 7d 13 01 f2 	movb   $0xf2,0x1137d25
  1003a3:	c6 05 26 7d 13 01 cf 	movb   $0xcf,0x1137d26
  1003aa:	c6 05 27 7d 13 01 00 	movb   $0x0,0x1137d27
  1003b1:	66 c7 05 40 34 10 00 	movw   $0x4f,0x103440
  1003b8:	4f 00 
  1003ba:	66 89 0d 42 34 10 00 	mov    %cx,0x103442
  1003c1:	c1 e9 10             	shr    $0x10,%ecx
  1003c4:	66 89 0d 44 34 10 00 	mov    %cx,0x103444
  1003cb:	b8 40 34 10 00       	mov    $0x103440,%eax
  1003d0:	0f 01 10             	lgdtl  (%eax)
  1003d3:	a1 28 5d 10 00       	mov    0x105d28,%eax
  1003d8:	a3 48 7d 13 01       	mov    %eax,0x1137d48
  1003dd:	c7 05 44 7d 13 01 dc 	movl   $0x105cdc,0x1137d44
  1003e4:	5c 10 00 
  1003e7:	b8 28 00 00 00       	mov    $0x28,%eax
  1003ec:	0f 00 d8             	ltr    %ax
  1003ef:	b8 10 00 00 00       	mov    $0x10,%eax
  1003f4:	89 c0                	mov    %eax,%eax
  1003f6:	8e d8                	mov    %eax,%ds
  1003f8:	8e e0                	mov    %eax,%fs
  1003fa:	8e c0                	mov    %eax,%es
  1003fc:	8e d0                	mov    %eax,%ss
  1003fe:	b8 30 00 00 00       	mov    $0x30,%eax
  100403:	89 c0                	mov    %eax,%eax
  100405:	8e e8                	mov    %eax,%gs
  100407:	31 c0                	xor    %eax,%eax
  100409:	0f 00 d0             	lldt   %ax
  10040c:	5d                   	pop    %ebp
  10040d:	c3                   	ret    
  10040e:	66 90                	xchg   %ax,%ax

00100410 <enterUserSpace_pcb>:
  100410:	55                   	push   %ebp
  100411:	89 e5                	mov    %esp,%ebp
  100413:	8b 55 08             	mov    0x8(%ebp),%edx
  100416:	b8 10 00 00 00       	mov    $0x10,%eax
  10041b:	89 c0                	mov    %eax,%eax
  10041d:	8e d8                	mov    %eax,%ds
  10041f:	8e e0                	mov    %eax,%fs
  100421:	8e c0                	mov    %eax,%es
  100423:	89 d0                	mov    %edx,%eax
  100425:	c1 e0 07             	shl    $0x7,%eax
  100428:	01 d0                	add    %edx,%eax
  10042a:	01 c0                	add    %eax,%eax
  10042c:	01 d0                	add    %edx,%eax
  10042e:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100431:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100438:	8b 90 48 20 00 00    	mov    0x2048(%eax),%edx
  10043e:	52                   	push   %edx
  10043f:	8b 90 44 20 00 00    	mov    0x2044(%eax),%edx
  100445:	52                   	push   %edx
  100446:	9c                   	pushf  
  100447:	8b 90 3c 20 00 00    	mov    0x203c(%eax),%edx
  10044d:	52                   	push   %edx
  10044e:	8b 80 38 20 00 00    	mov    0x2038(%eax),%eax
  100454:	50                   	push   %eax
  100455:	cf                   	iret   
  100456:	5d                   	pop    %ebp
  100457:	c3                   	ret    

00100458 <enterUserSpace>:
  100458:	55                   	push   %ebp
  100459:	89 e5                	mov    %esp,%ebp
  10045b:	56                   	push   %esi
  10045c:	53                   	push   %ebx
  10045d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100460:	c7 05 c4 3c 10 00 01 	movl   $0x1,0x103cc4
  100467:	00 00 00 
  10046a:	e8 39 09 00 00       	call   100da8 <apply_new_pid>
  10046f:	89 c6                	mov    %eax,%esi
  100471:	48                   	dec    %eax
  100472:	74 15                	je     100489 <enterUserSpace+0x31>
  100474:	83 ec 08             	sub    $0x8,%esp
  100477:	68 9e 00 00 00       	push   $0x9e
  10047c:	68 c2 18 10 00       	push   $0x1018c2
  100481:	e8 6a 13 00 00       	call   1017f0 <abort>
  100486:	83 c4 10             	add    $0x10,%esp
  100489:	89 f0                	mov    %esi,%eax
  10048b:	c1 e0 07             	shl    $0x7,%eax
  10048e:	01 f0                	add    %esi,%eax
  100490:	01 c0                	add    %eax,%eax
  100492:	01 f0                	add    %esi,%eax
  100494:	8d 14 86             	lea    (%esi,%eax,4),%edx
  100497:	c1 e2 03             	shl    $0x3,%edx
  10049a:	c7 82 28 5d 10 00 23 	movl   $0x23,0x105d28(%edx)
  1004a1:	00 00 00 
  1004a4:	c7 82 1c 5d 10 00 1b 	movl   $0x1b,0x105d1c(%edx)
  1004ab:	00 00 00 
  1004ae:	c7 82 ec 5c 10 00 23 	movl   $0x23,0x105cec(%edx)
  1004b5:	00 00 00 
  1004b8:	c7 82 e8 5c 10 00 23 	movl   $0x23,0x105ce8(%edx)
  1004bf:	00 00 00 
  1004c2:	c7 82 e4 5c 10 00 23 	movl   $0x23,0x105ce4(%edx)
  1004c9:	00 00 00 
  1004cc:	c7 82 24 5d 10 00 00 	movl   $0x400000,0x105d24(%edx)
  1004d3:	00 40 00 
  1004d6:	89 9a 18 5d 10 00    	mov    %ebx,0x105d18(%edx)
  1004dc:	c7 82 30 5d 10 00 0a 	movl   $0xa,0x105d30(%edx)
  1004e3:	00 00 00 
  1004e6:	83 ec 08             	sub    $0x8,%esp
  1004e9:	81 c2 e0 5c 10 00    	add    $0x105ce0,%edx
  1004ef:	52                   	push   %edx
  1004f0:	56                   	push   %esi
  1004f1:	e8 be 05 00 00       	call   100ab4 <put_into_runnable>
  1004f6:	83 c4 10             	add    $0x10,%esp
  1004f9:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  100500:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100503:	5b                   	pop    %ebx
  100504:	5e                   	pop    %esi
  100505:	5d                   	pop    %ebp
  100506:	e9 05 ff ff ff       	jmp    100410 <enterUserSpace_pcb>
  10050b:	90                   	nop

0010050c <loadUMain>:
  10050c:	55                   	push   %ebp
  10050d:	89 e5                	mov    %esp,%ebp
  10050f:	57                   	push   %edi
  100510:	56                   	push   %esi
  100511:	53                   	push   %ebx
  100512:	83 ec 0c             	sub    $0xc,%esp
  100515:	bb c9 00 00 00       	mov    $0xc9,%ebx
  10051a:	be 00 00 03 00       	mov    $0x30000,%esi
  10051f:	90                   	nop
  100520:	53                   	push   %ebx
  100521:	56                   	push   %esi
  100522:	e8 d9 fc ff ff       	call   100200 <readSect>
  100527:	81 c6 00 02 00 00    	add    $0x200,%esi
  10052d:	43                   	inc    %ebx
  10052e:	58                   	pop    %eax
  10052f:	5a                   	pop    %edx
  100530:	81 fb 91 01 00 00    	cmp    $0x191,%ebx
  100536:	75 e8                	jne    100520 <loadUMain+0x14>
  100538:	a1 1c 00 03 00       	mov    0x3001c,%eax
  10053d:	8d 90 00 00 03 00    	lea    0x30000(%eax),%edx
  100543:	0f b7 35 2c 00 03 00 	movzwl 0x3002c,%esi
  10054a:	c1 e6 05             	shl    $0x5,%esi
  10054d:	01 d6                	add    %edx,%esi
  10054f:	39 f2                	cmp    %esi,%edx
  100551:	72 0c                	jb     10055f <loadUMain+0x53>
  100553:	eb 53                	jmp    1005a8 <loadUMain+0x9c>
  100555:	8d 76 00             	lea    0x0(%esi),%esi
  100558:	83 c2 20             	add    $0x20,%edx
  10055b:	39 d6                	cmp    %edx,%esi
  10055d:	76 49                	jbe    1005a8 <loadUMain+0x9c>
  10055f:	83 3a 01             	cmpl   $0x1,(%edx)
  100562:	75 f4                	jne    100558 <loadUMain+0x4c>
  100564:	8b 42 08             	mov    0x8(%edx),%eax
  100567:	8b 7a 10             	mov    0x10(%edx),%edi
  10056a:	8b 5a 04             	mov    0x4(%edx),%ebx
  10056d:	29 c3                	sub    %eax,%ebx
  10056f:	31 c9                	xor    %ecx,%ecx
  100571:	85 ff                	test   %edi,%edi
  100573:	74 16                	je     10058b <loadUMain+0x7f>
  100575:	8d 76 00             	lea    0x0(%esi),%esi
  100578:	8a 8c 03 00 00 03 00 	mov    0x30000(%ebx,%eax,1),%cl
  10057f:	88 08                	mov    %cl,(%eax)
  100581:	40                   	inc    %eax
  100582:	89 c1                	mov    %eax,%ecx
  100584:	2b 4a 08             	sub    0x8(%edx),%ecx
  100587:	39 cf                	cmp    %ecx,%edi
  100589:	77 ed                	ja     100578 <loadUMain+0x6c>
  10058b:	8b 5a 14             	mov    0x14(%edx),%ebx
  10058e:	39 cb                	cmp    %ecx,%ebx
  100590:	76 c6                	jbe    100558 <loadUMain+0x4c>
  100592:	66 90                	xchg   %ax,%ax
  100594:	c6 00 00             	movb   $0x0,(%eax)
  100597:	40                   	inc    %eax
  100598:	89 c1                	mov    %eax,%ecx
  10059a:	2b 4a 08             	sub    0x8(%edx),%ecx
  10059d:	39 cb                	cmp    %ecx,%ebx
  10059f:	77 f3                	ja     100594 <loadUMain+0x88>
  1005a1:	83 c2 20             	add    $0x20,%edx
  1005a4:	39 d6                	cmp    %edx,%esi
  1005a6:	77 b7                	ja     10055f <loadUMain+0x53>
  1005a8:	31 c0                	xor    %eax,%eax
  1005aa:	66 90                	xchg   %ax,%ax
  1005ac:	8a 90 00 00 20 00    	mov    0x200000(%eax),%dl
  1005b2:	88 90 00 00 21 00    	mov    %dl,0x210000(%eax)
  1005b8:	88 90 00 00 22 00    	mov    %dl,0x220000(%eax)
  1005be:	40                   	inc    %eax
  1005bf:	3d 00 00 01 00       	cmp    $0x10000,%eax
  1005c4:	75 e6                	jne    1005ac <loadUMain+0xa0>
  1005c6:	83 ec 0c             	sub    $0xc,%esp
  1005c9:	ff 35 18 00 03 00    	pushl  0x30018
  1005cf:	e8 84 fe ff ff       	call   100458 <enterUserSpace>
  1005d4:	83 c4 10             	add    $0x10,%esp
  1005d7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1005da:	5b                   	pop    %ebx
  1005db:	5e                   	pop    %esi
  1005dc:	5f                   	pop    %edi
  1005dd:	5d                   	pop    %ebp
  1005de:	c3                   	ret    
  1005df:	90                   	nop

001005e0 <sys_exit>:
  1005e0:	55                   	push   %ebp
  1005e1:	89 e5                	mov    %esp,%ebp
  1005e3:	83 ec 14             	sub    $0x14,%esp
  1005e6:	68 07 19 10 00       	push   $0x101907
  1005eb:	e8 8c 10 00 00       	call   10167c <printk>
  1005f0:	e8 83 03 00 00       	call   100978 <getpid>
  1005f5:	89 04 24             	mov    %eax,(%esp)
  1005f8:	e8 a3 04 00 00       	call   100aa0 <put_into_empty>
  1005fd:	e8 ba 07 00 00       	call   100dbc <get_from_runnable>
  100602:	5a                   	pop    %edx
  100603:	59                   	pop    %ecx
  100604:	ff 75 08             	pushl  0x8(%ebp)
  100607:	50                   	push   %eax
  100608:	e8 27 03 00 00       	call   100934 <put_into_running>
  10060d:	b8 01 00 00 00       	mov    $0x1,%eax
  100612:	c9                   	leave  
  100613:	c3                   	ret    

00100614 <sys_getpid>:
  100614:	55                   	push   %ebp
  100615:	89 e5                	mov    %esp,%ebp
  100617:	5d                   	pop    %ebp
  100618:	e9 5b 03 00 00       	jmp    100978 <getpid>
  10061d:	66 90                	xchg   %ax,%ax
  10061f:	90                   	nop

00100620 <sys_sleep>:
  100620:	55                   	push   %ebp
  100621:	89 e5                	mov    %esp,%ebp
  100623:	56                   	push   %esi
  100624:	53                   	push   %ebx
  100625:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100628:	e8 4b 03 00 00       	call   100978 <getpid>
  10062d:	83 ec 08             	sub    $0x8,%esp
  100630:	53                   	push   %ebx
  100631:	50                   	push   %eax
  100632:	e8 35 05 00 00       	call   100b6c <put_into_block>
  100637:	c7 04 24 bc 18 10 00 	movl   $0x1018bc,(%esp)
  10063e:	e8 39 10 00 00       	call   10167c <printk>
  100643:	e8 30 03 00 00       	call   100978 <getpid>
  100648:	89 c2                	mov    %eax,%edx
  10064a:	c1 e2 07             	shl    $0x7,%edx
  10064d:	01 c2                	add    %eax,%edx
  10064f:	01 d2                	add    %edx,%edx
  100651:	01 c2                	add    %eax,%edx
  100653:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100656:	8b 34 c5 34 5d 10 00 	mov    0x105d34(,%eax,8),%esi
  10065d:	e8 16 03 00 00       	call   100978 <getpid>
  100662:	5a                   	pop    %edx
  100663:	59                   	pop    %ecx
  100664:	56                   	push   %esi
  100665:	50                   	push   %eax
  100666:	68 58 19 10 00       	push   $0x101958
  10066b:	6a 09                	push   $0x9
  10066d:	68 15 19 10 00       	push   $0x101915
  100672:	68 34 19 10 00       	push   $0x101934
  100677:	e8 00 10 00 00       	call   10167c <printk>
  10067c:	83 c4 14             	add    $0x14,%esp
  10067f:	68 eb 18 10 00       	push   $0x1018eb
  100684:	e8 f3 0f 00 00       	call   10167c <printk>
  100689:	e8 2e 07 00 00       	call   100dbc <get_from_runnable>
  10068e:	5e                   	pop    %esi
  10068f:	5a                   	pop    %edx
  100690:	53                   	push   %ebx
  100691:	50                   	push   %eax
  100692:	e8 9d 02 00 00       	call   100934 <put_into_running>
  100697:	b8 01 00 00 00       	mov    $0x1,%eax
  10069c:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10069f:	5b                   	pop    %ebx
  1006a0:	5e                   	pop    %esi
  1006a1:	5d                   	pop    %ebp
  1006a2:	c3                   	ret    
  1006a3:	90                   	nop

001006a4 <sys_fork>:
  1006a4:	55                   	push   %ebp
  1006a5:	89 e5                	mov    %esp,%ebp
  1006a7:	57                   	push   %edi
  1006a8:	56                   	push   %esi
  1006a9:	53                   	push   %ebx
  1006aa:	83 ec 1c             	sub    $0x1c,%esp
  1006ad:	e8 f6 06 00 00       	call   100da8 <apply_new_pid>
  1006b2:	89 c7                	mov    %eax,%edi
  1006b4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1006b7:	c1 e0 07             	shl    $0x7,%eax
  1006ba:	01 f8                	add    %edi,%eax
  1006bc:	01 c0                	add    %eax,%eax
  1006be:	01 f8                	add    %edi,%eax
  1006c0:	8d 3c 87             	lea    (%edi,%eax,4),%edi
  1006c3:	c1 e7 03             	shl    $0x3,%edi
  1006c6:	31 f6                	xor    %esi,%esi
  1006c8:	e8 ab 02 00 00       	call   100978 <getpid>
  1006cd:	89 c2                	mov    %eax,%edx
  1006cf:	c1 e2 07             	shl    $0x7,%edx
  1006d2:	01 c2                	add    %eax,%edx
  1006d4:	01 d2                	add    %edx,%edx
  1006d6:	01 c2                	add    %eax,%edx
  1006d8:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1006db:	01 c0                	add    %eax,%eax
  1006dd:	01 f0                	add    %esi,%eax
  1006df:	8b 04 85 e0 3c 10 00 	mov    0x103ce0(,%eax,4),%eax
  1006e6:	89 84 b7 e0 3c 10 00 	mov    %eax,0x103ce0(%edi,%esi,4)
  1006ed:	46                   	inc    %esi
  1006ee:	81 fe 00 08 00 00    	cmp    $0x800,%esi
  1006f4:	75 d2                	jne    1006c8 <sys_fork+0x24>
  1006f6:	e8 7d 02 00 00       	call   100978 <getpid>
  1006fb:	8d 50 40             	lea    0x40(%eax),%edx
  1006fe:	c1 e2 10             	shl    $0x10,%edx
  100701:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100704:	8d 48 40             	lea    0x40(%eax),%ecx
  100707:	c1 e1 10             	shl    $0x10,%ecx
  10070a:	b8 00 00 01 00       	mov    $0x10000,%eax
  10070f:	90                   	nop
  100710:	8a 9c 10 00 00 ff ff 	mov    -0x10000(%eax,%edx,1),%bl
  100717:	88 9c 08 00 00 ff ff 	mov    %bl,-0x10000(%eax,%ecx,1)
  10071e:	48                   	dec    %eax
  10071f:	75 ef                	jne    100710 <sys_fork+0x6c>
  100721:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
  100724:	89 d8                	mov    %ebx,%eax
  100726:	c1 e0 07             	shl    $0x7,%eax
  100729:	01 d8                	add    %ebx,%eax
  10072b:	01 c0                	add    %eax,%eax
  10072d:	01 d8                	add    %ebx,%eax
  10072f:	8d 14 83             	lea    (%ebx,%eax,4),%edx
  100732:	c1 e2 03             	shl    $0x3,%edx
  100735:	8d 82 e0 5c 10 00    	lea    0x105ce0(%edx),%eax
  10073b:	b9 13 00 00 00       	mov    $0x13,%ecx
  100740:	89 c7                	mov    %eax,%edi
  100742:	8b 75 08             	mov    0x8(%ebp),%esi
  100745:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100747:	c7 82 0c 5d 10 00 00 	movl   $0x0,0x105d0c(%edx)
  10074e:	00 00 00 
  100751:	83 ec 08             	sub    $0x8,%esp
  100754:	50                   	push   %eax
  100755:	53                   	push   %ebx
  100756:	e8 59 03 00 00       	call   100ab4 <put_into_runnable>
  10075b:	89 d8                	mov    %ebx,%eax
  10075d:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100760:	5b                   	pop    %ebx
  100761:	5e                   	pop    %esi
  100762:	5f                   	pop    %edi
  100763:	5d                   	pop    %ebp
  100764:	c3                   	ret    
  100765:	66 90                	xchg   %ax,%ax
  100767:	90                   	nop

00100768 <display>:
  100768:	55                   	push   %ebp
  100769:	89 e5                	mov    %esp,%ebp
  10076b:	57                   	push   %edi
  10076c:	53                   	push   %ebx
  10076d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100770:	80 fb 0a             	cmp    $0xa,%bl
  100773:	74 5b                	je     1007d0 <display+0x68>
  100775:	8b 15 48 34 10 00    	mov    0x103448,%edx
  10077b:	8b 0d 4c 34 10 00    	mov    0x10344c,%ecx
  100781:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  100784:	c1 e0 04             	shl    $0x4,%eax
  100787:	01 d0                	add    %edx,%eax
  100789:	01 c0                	add    %eax,%eax
  10078b:	89 c7                	mov    %eax,%edi
  10078d:	0f be db             	movsbl %bl,%ebx
  100790:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
  100796:	66 89 d8             	mov    %bx,%ax
  100799:	65 66 89 07          	mov    %ax,%gs:(%edi)
  10079d:	42                   	inc    %edx
  10079e:	83 fa 50             	cmp    $0x50,%edx
  1007a1:	75 1d                	jne    1007c0 <display+0x58>
  1007a3:	c7 05 48 34 10 00 00 	movl   $0x0,0x103448
  1007aa:	00 00 00 
  1007ad:	41                   	inc    %ecx
  1007ae:	89 0d 4c 34 10 00    	mov    %ecx,0x10344c
  1007b4:	b8 01 00 00 00       	mov    $0x1,%eax
  1007b9:	5b                   	pop    %ebx
  1007ba:	5f                   	pop    %edi
  1007bb:	5d                   	pop    %ebp
  1007bc:	c3                   	ret    
  1007bd:	8d 76 00             	lea    0x0(%esi),%esi
  1007c0:	89 15 48 34 10 00    	mov    %edx,0x103448
  1007c6:	b8 01 00 00 00       	mov    $0x1,%eax
  1007cb:	5b                   	pop    %ebx
  1007cc:	5f                   	pop    %edi
  1007cd:	5d                   	pop    %ebp
  1007ce:	c3                   	ret    
  1007cf:	90                   	nop
  1007d0:	c7 05 48 34 10 00 00 	movl   $0x0,0x103448
  1007d7:	00 00 00 
  1007da:	ff 05 4c 34 10 00    	incl   0x10344c
  1007e0:	b8 01 00 00 00       	mov    $0x1,%eax
  1007e5:	5b                   	pop    %ebx
  1007e6:	5f                   	pop    %edi
  1007e7:	5d                   	pop    %ebp
  1007e8:	c3                   	ret    
  1007e9:	8d 76 00             	lea    0x0(%esi),%esi

001007ec <printkernel>:
  1007ec:	55                   	push   %ebp
  1007ed:	89 e5                	mov    %esp,%ebp
  1007ef:	56                   	push   %esi
  1007f0:	53                   	push   %ebx
  1007f1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1007f4:	8b 75 0c             	mov    0xc(%ebp),%esi
  1007f7:	85 f6                	test   %esi,%esi
  1007f9:	7e 30                	jle    10082b <printkernel+0x3f>
  1007fb:	0f be 03             	movsbl (%ebx),%eax
  1007fe:	84 c0                	test   %al,%al
  100800:	74 29                	je     10082b <printkernel+0x3f>
  100802:	01 de                	add    %ebx,%esi
  100804:	eb 09                	jmp    10080f <printkernel+0x23>
  100806:	66 90                	xchg   %ax,%ax
  100808:	0f be 03             	movsbl (%ebx),%eax
  10080b:	84 c0                	test   %al,%al
  10080d:	74 1c                	je     10082b <printkernel+0x3f>
  10080f:	83 ec 0c             	sub    $0xc,%esp
  100812:	50                   	push   %eax
  100813:	e8 f8 00 00 00       	call   100910 <putChar>
  100818:	0f be 03             	movsbl (%ebx),%eax
  10081b:	89 04 24             	mov    %eax,(%esp)
  10081e:	e8 45 ff ff ff       	call   100768 <display>
  100823:	43                   	inc    %ebx
  100824:	83 c4 10             	add    $0x10,%esp
  100827:	39 de                	cmp    %ebx,%esi
  100829:	75 dd                	jne    100808 <printkernel+0x1c>
  10082b:	b8 01 00 00 00       	mov    $0x1,%eax
  100830:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100833:	5b                   	pop    %ebx
  100834:	5e                   	pop    %esi
  100835:	5d                   	pop    %ebp
  100836:	c3                   	ret    
  100837:	90                   	nop

00100838 <fs_write>:
  100838:	55                   	push   %ebp
  100839:	89 e5                	mov    %esp,%ebp
  10083b:	53                   	push   %ebx
  10083c:	50                   	push   %eax
  10083d:	8b 5d 10             	mov    0x10(%ebp),%ebx
  100840:	ba 30 00 00 00       	mov    $0x30,%edx
  100845:	89 d0                	mov    %edx,%eax
  100847:	8e e8                	mov    %eax,%gs
  100849:	8b 45 08             	mov    0x8(%ebp),%eax
  10084c:	48                   	dec    %eax
  10084d:	83 f8 01             	cmp    $0x1,%eax
  100850:	76 12                	jbe    100864 <fs_write+0x2c>
  100852:	83 ec 08             	sub    $0x8,%esp
  100855:	6a 28                	push   $0x28
  100857:	68 62 19 10 00       	push   $0x101962
  10085c:	e8 8f 0f 00 00       	call   1017f0 <abort>
  100861:	83 c4 10             	add    $0x10,%esp
  100864:	83 ec 08             	sub    $0x8,%esp
  100867:	53                   	push   %ebx
  100868:	ff 75 0c             	pushl  0xc(%ebp)
  10086b:	e8 7c ff ff ff       	call   1007ec <printkernel>
  100870:	89 d8                	mov    %ebx,%eax
  100872:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100875:	c9                   	leave  
  100876:	c3                   	ret    
  100877:	90                   	nop

00100878 <sys_write>:
  100878:	55                   	push   %ebp
  100879:	89 e5                	mov    %esp,%ebp
  10087b:	56                   	push   %esi
  10087c:	53                   	push   %ebx
  10087d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100880:	8b 73 24             	mov    0x24(%ebx),%esi
  100883:	e8 f0 00 00 00       	call   100978 <getpid>
  100888:	52                   	push   %edx
  100889:	56                   	push   %esi
  10088a:	c1 e0 10             	shl    $0x10,%eax
  10088d:	03 43 28             	add    0x28(%ebx),%eax
  100890:	50                   	push   %eax
  100891:	ff 73 20             	pushl  0x20(%ebx)
  100894:	e8 9f ff ff ff       	call   100838 <fs_write>
  100899:	89 43 2c             	mov    %eax,0x2c(%ebx)
  10089c:	83 c4 10             	add    $0x10,%esp
  10089f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1008a2:	5b                   	pop    %ebx
  1008a3:	5e                   	pop    %esi
  1008a4:	5d                   	pop    %ebp
  1008a5:	c3                   	ret    
  1008a6:	66 90                	xchg   %ax,%ax

001008a8 <print_char>:
  1008a8:	55                   	push   %ebp
  1008a9:	89 e5                	mov    %esp,%ebp
  1008ab:	57                   	push   %edi
  1008ac:	8b 45 08             	mov    0x8(%ebp),%eax
  1008af:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1008b2:	c1 e0 04             	shl    $0x4,%eax
  1008b5:	03 45 0c             	add    0xc(%ebp),%eax
  1008b8:	01 c0                	add    %eax,%eax
  1008ba:	89 c7                	mov    %eax,%edi
  1008bc:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  1008c0:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  1008c6:	66 89 d0             	mov    %dx,%ax
  1008c9:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1008cd:	5f                   	pop    %edi
  1008ce:	5d                   	pop    %ebp
  1008cf:	c3                   	ret    

001008d0 <initSerial>:
  1008d0:	55                   	push   %ebp
  1008d1:	89 e5                	mov    %esp,%ebp
  1008d3:	ba f9 03 00 00       	mov    $0x3f9,%edx
  1008d8:	31 c0                	xor    %eax,%eax
  1008da:	ee                   	out    %al,(%dx)
  1008db:	ba fb 03 00 00       	mov    $0x3fb,%edx
  1008e0:	b0 80                	mov    $0x80,%al
  1008e2:	ee                   	out    %al,(%dx)
  1008e3:	ba f8 03 00 00       	mov    $0x3f8,%edx
  1008e8:	b0 01                	mov    $0x1,%al
  1008ea:	ee                   	out    %al,(%dx)
  1008eb:	ba f9 03 00 00       	mov    $0x3f9,%edx
  1008f0:	31 c0                	xor    %eax,%eax
  1008f2:	ee                   	out    %al,(%dx)
  1008f3:	ba fb 03 00 00       	mov    $0x3fb,%edx
  1008f8:	b0 03                	mov    $0x3,%al
  1008fa:	ee                   	out    %al,(%dx)
  1008fb:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100900:	b0 c7                	mov    $0xc7,%al
  100902:	ee                   	out    %al,(%dx)
  100903:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100908:	b0 0b                	mov    $0xb,%al
  10090a:	ee                   	out    %al,(%dx)
  10090b:	5d                   	pop    %ebp
  10090c:	c3                   	ret    
  10090d:	8d 76 00             	lea    0x0(%esi),%esi

00100910 <putChar>:
  100910:	55                   	push   %ebp
  100911:	89 e5                	mov    %esp,%ebp
  100913:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100916:	ba fd 03 00 00       	mov    $0x3fd,%edx
  10091b:	90                   	nop
  10091c:	ec                   	in     (%dx),%al
  10091d:	a8 20                	test   $0x20,%al
  10091f:	74 fb                	je     10091c <putChar+0xc>
  100921:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100926:	88 c8                	mov    %cl,%al
  100928:	ee                   	out    %al,(%dx)
  100929:	5d                   	pop    %ebp
  10092a:	c3                   	ret    
  10092b:	90                   	nop

0010092c <IDLE>:
  10092c:	55                   	push   %ebp
  10092d:	89 e5                	mov    %esp,%ebp
  10092f:	90                   	nop
  100930:	f4                   	hlt    
  100931:	eb fd                	jmp    100930 <IDLE+0x4>
  100933:	90                   	nop

00100934 <put_into_running>:
  100934:	55                   	push   %ebp
  100935:	89 e5                	mov    %esp,%ebp
  100937:	83 ec 08             	sub    $0x8,%esp
  10093a:	8b 55 08             	mov    0x8(%ebp),%edx
  10093d:	39 15 c0 3c 10 00    	cmp    %edx,0x103cc0
  100943:	74 29                	je     10096e <put_into_running+0x3a>
  100945:	89 15 c0 3c 10 00    	mov    %edx,0x103cc0
  10094b:	83 ec 08             	sub    $0x8,%esp
  10094e:	89 d0                	mov    %edx,%eax
  100950:	c1 e0 07             	shl    $0x7,%eax
  100953:	01 d0                	add    %edx,%eax
  100955:	01 c0                	add    %eax,%eax
  100957:	01 d0                	add    %edx,%eax
  100959:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10095c:	8d 04 c5 dc 5c 10 00 	lea    0x105cdc(,%eax,8),%eax
  100963:	50                   	push   %eax
  100964:	6a 10                	push   $0x10
  100966:	e8 49 f8 ff ff       	call   1001b4 <change_tss>
  10096b:	83 c4 10             	add    $0x10,%esp
  10096e:	b8 01 00 00 00       	mov    $0x1,%eax
  100973:	c9                   	leave  
  100974:	c3                   	ret    
  100975:	8d 76 00             	lea    0x0(%esi),%esi

00100978 <getpid>:
  100978:	55                   	push   %ebp
  100979:	89 e5                	mov    %esp,%ebp
  10097b:	a1 c0 3c 10 00       	mov    0x103cc0,%eax
  100980:	5d                   	pop    %ebp
  100981:	c3                   	ret    
  100982:	66 90                	xchg   %ax,%ax

00100984 <getrunnable>:
  100984:	55                   	push   %ebp
  100985:	89 e5                	mov    %esp,%ebp
  100987:	a1 24 33 10 00       	mov    0x103324,%eax
  10098c:	5d                   	pop    %ebp
  10098d:	c3                   	ret    
  10098e:	66 90                	xchg   %ax,%ax

00100990 <getblocked>:
  100990:	55                   	push   %ebp
  100991:	89 e5                	mov    %esp,%ebp
  100993:	a1 20 33 10 00       	mov    0x103320,%eax
  100998:	5d                   	pop    %ebp
  100999:	c3                   	ret    
  10099a:	66 90                	xchg   %ax,%ax

0010099c <put_into>:
  10099c:	55                   	push   %ebp
  10099d:	89 e5                	mov    %esp,%ebp
  10099f:	56                   	push   %esi
  1009a0:	53                   	push   %ebx
  1009a1:	8b 55 08             	mov    0x8(%ebp),%edx
  1009a4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1009a7:	83 fa 01             	cmp    $0x1,%edx
  1009aa:	0f 84 e0 00 00 00    	je     100a90 <put_into+0xf4>
  1009b0:	83 fa 03             	cmp    $0x3,%edx
  1009b3:	0f 84 97 00 00 00    	je     100a50 <put_into+0xb4>
  1009b9:	85 d2                	test   %edx,%edx
  1009bb:	74 1f                	je     1009dc <put_into+0x40>
  1009bd:	83 ec 08             	sub    $0x8,%esp
  1009c0:	6a 79                	push   $0x79
  1009c2:	68 7e 19 10 00       	push   $0x10197e
  1009c7:	e8 24 0e 00 00       	call   1017f0 <abort>
  1009cc:	83 c4 10             	add    $0x10,%esp
  1009cf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1009d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1009d7:	5b                   	pop    %ebx
  1009d8:	5e                   	pop    %esi
  1009d9:	5d                   	pop    %ebp
  1009da:	c3                   	ret    
  1009db:	90                   	nop
  1009dc:	8b 0d 20 33 10 00    	mov    0x103320,%ecx
  1009e2:	ba 20 33 10 00       	mov    $0x103320,%edx
  1009e7:	83 f9 ff             	cmp    $0xffffffff,%ecx
  1009ea:	74 74                	je     100a60 <put_into+0xc4>
  1009ec:	89 ca                	mov    %ecx,%edx
  1009ee:	c1 e2 07             	shl    $0x7,%edx
  1009f1:	01 ca                	add    %ecx,%edx
  1009f3:	01 d2                	add    %edx,%edx
  1009f5:	01 ca                	add    %ecx,%edx
  1009f7:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  1009fa:	8d 34 d5 e0 3c 10 00 	lea    0x103ce0(,%edx,8),%esi
  100a01:	8b 9e 5c 20 00 00    	mov    0x205c(%esi),%ebx
  100a07:	89 da                	mov    %ebx,%edx
  100a09:	c1 e2 07             	shl    $0x7,%edx
  100a0c:	01 da                	add    %ebx,%edx
  100a0e:	01 d2                	add    %edx,%edx
  100a10:	01 da                	add    %ebx,%edx
  100a12:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100a15:	89 04 d5 40 5d 10 00 	mov    %eax,0x105d40(,%edx,8)
  100a1c:	89 c2                	mov    %eax,%edx
  100a1e:	c1 e2 07             	shl    $0x7,%edx
  100a21:	01 c2                	add    %eax,%edx
  100a23:	01 d2                	add    %edx,%edx
  100a25:	01 c2                	add    %eax,%edx
  100a27:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100a2a:	8d 14 d5 e0 3c 10 00 	lea    0x103ce0(,%edx,8),%edx
  100a31:	89 9a 5c 20 00 00    	mov    %ebx,0x205c(%edx)
  100a37:	89 8a 60 20 00 00    	mov    %ecx,0x2060(%edx)
  100a3d:	89 86 5c 20 00 00    	mov    %eax,0x205c(%esi)
  100a43:	b8 01 00 00 00       	mov    $0x1,%eax
  100a48:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100a4b:	5b                   	pop    %ebx
  100a4c:	5e                   	pop    %esi
  100a4d:	5d                   	pop    %ebp
  100a4e:	c3                   	ret    
  100a4f:	90                   	nop
  100a50:	8b 0d 50 34 10 00    	mov    0x103450,%ecx
  100a56:	ba 50 34 10 00       	mov    $0x103450,%edx
  100a5b:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100a5e:	75 8c                	jne    1009ec <put_into+0x50>
  100a60:	89 02                	mov    %eax,(%edx)
  100a62:	89 c2                	mov    %eax,%edx
  100a64:	c1 e2 07             	shl    $0x7,%edx
  100a67:	01 c2                	add    %eax,%edx
  100a69:	01 d2                	add    %edx,%edx
  100a6b:	01 c2                	add    %eax,%edx
  100a6d:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100a70:	8d 14 d5 e0 3c 10 00 	lea    0x103ce0(,%edx,8),%edx
  100a77:	89 82 60 20 00 00    	mov    %eax,0x2060(%edx)
  100a7d:	89 82 5c 20 00 00    	mov    %eax,0x205c(%edx)
  100a83:	b8 01 00 00 00       	mov    $0x1,%eax
  100a88:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100a8b:	5b                   	pop    %ebx
  100a8c:	5e                   	pop    %esi
  100a8d:	5d                   	pop    %ebp
  100a8e:	c3                   	ret    
  100a8f:	90                   	nop
  100a90:	8b 0d 24 33 10 00    	mov    0x103324,%ecx
  100a96:	ba 24 33 10 00       	mov    $0x103324,%edx
  100a9b:	e9 47 ff ff ff       	jmp    1009e7 <put_into+0x4b>

00100aa0 <put_into_empty>:
  100aa0:	55                   	push   %ebp
  100aa1:	89 e5                	mov    %esp,%ebp
  100aa3:	83 ec 10             	sub    $0x10,%esp
  100aa6:	ff 75 08             	pushl  0x8(%ebp)
  100aa9:	6a 03                	push   $0x3
  100aab:	e8 ec fe ff ff       	call   10099c <put_into>
  100ab0:	c9                   	leave  
  100ab1:	c3                   	ret    
  100ab2:	66 90                	xchg   %ax,%ax

00100ab4 <put_into_runnable>:
  100ab4:	55                   	push   %ebp
  100ab5:	89 e5                	mov    %esp,%ebp
  100ab7:	57                   	push   %edi
  100ab8:	56                   	push   %esi
  100ab9:	53                   	push   %ebx
  100aba:	83 ec 18             	sub    $0x18,%esp
  100abd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100ac0:	8b 75 0c             	mov    0xc(%ebp),%esi
  100ac3:	68 bc 18 10 00       	push   $0x1018bc
  100ac8:	e8 af 0b 00 00       	call   10167c <printk>
  100acd:	58                   	pop    %eax
  100ace:	5a                   	pop    %edx
  100acf:	53                   	push   %ebx
  100ad0:	ff 35 24 33 10 00    	pushl  0x103324
  100ad6:	68 40 1a 10 00       	push   $0x101a40
  100adb:	6a 41                	push   $0x41
  100add:	68 7e 19 10 00       	push   $0x10197e
  100ae2:	68 8c 19 10 00       	push   $0x10198c
  100ae7:	e8 90 0b 00 00       	call   10167c <printk>
  100aec:	83 c4 14             	add    $0x14,%esp
  100aef:	68 eb 18 10 00       	push   $0x1018eb
  100af4:	e8 83 0b 00 00       	call   10167c <printk>
  100af9:	89 d8                	mov    %ebx,%eax
  100afb:	c1 e0 07             	shl    $0x7,%eax
  100afe:	01 d8                	add    %ebx,%eax
  100b00:	01 c0                	add    %eax,%eax
  100b02:	01 d8                	add    %ebx,%eax
  100b04:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b07:	8d 04 c5 e0 5c 10 00 	lea    0x105ce0(,%eax,8),%eax
  100b0e:	b9 13 00 00 00       	mov    $0x13,%ecx
  100b13:	89 c7                	mov    %eax,%edi
  100b15:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100b17:	83 c4 10             	add    $0x10,%esp
  100b1a:	85 db                	test   %ebx,%ebx
  100b1c:	75 0a                	jne    100b28 <put_into_runnable+0x74>
  100b1e:	c7 05 18 5d 10 00 2c 	movl   $0x10092c,0x105d18
  100b25:	09 10 00 
  100b28:	89 d8                	mov    %ebx,%eax
  100b2a:	c1 e0 07             	shl    $0x7,%eax
  100b2d:	01 d8                	add    %ebx,%eax
  100b2f:	01 c0                	add    %eax,%eax
  100b31:	01 d8                	add    %ebx,%eax
  100b33:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b36:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100b3d:	8b 15 c8 3c 10 00    	mov    0x103cc8,%edx
  100b43:	89 90 50 20 00 00    	mov    %edx,0x2050(%eax)
  100b49:	c7 80 4c 20 00 00 01 	movl   $0x1,0x204c(%eax)
  100b50:	00 00 00 
  100b53:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  100b56:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
  100b5d:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100b60:	5b                   	pop    %ebx
  100b61:	5e                   	pop    %esi
  100b62:	5f                   	pop    %edi
  100b63:	5d                   	pop    %ebp
  100b64:	e9 33 fe ff ff       	jmp    10099c <put_into>
  100b69:	8d 76 00             	lea    0x0(%esi),%esi

00100b6c <put_into_block>:
  100b6c:	55                   	push   %ebp
  100b6d:	89 e5                	mov    %esp,%ebp
  100b6f:	57                   	push   %edi
  100b70:	56                   	push   %esi
  100b71:	53                   	push   %ebx
  100b72:	8b 55 08             	mov    0x8(%ebp),%edx
  100b75:	89 d0                	mov    %edx,%eax
  100b77:	c1 e0 07             	shl    $0x7,%eax
  100b7a:	01 d0                	add    %edx,%eax
  100b7c:	01 c0                	add    %eax,%eax
  100b7e:	01 d0                	add    %edx,%eax
  100b80:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
  100b83:	c1 e3 03             	shl    $0x3,%ebx
  100b86:	8d 83 e0 5c 10 00    	lea    0x105ce0(%ebx),%eax
  100b8c:	b9 13 00 00 00       	mov    $0x13,%ecx
  100b91:	89 c7                	mov    %eax,%edi
  100b93:	8b 75 0c             	mov    0xc(%ebp),%esi
  100b96:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100b98:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b9b:	8b 40 20             	mov    0x20(%eax),%eax
  100b9e:	89 83 34 5d 10 00    	mov    %eax,0x105d34(%ebx)
  100ba4:	c7 83 2c 5d 10 00 00 	movl   $0x0,0x105d2c(%ebx)
  100bab:	00 00 00 
  100bae:	89 55 0c             	mov    %edx,0xc(%ebp)
  100bb1:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  100bb8:	5b                   	pop    %ebx
  100bb9:	5e                   	pop    %esi
  100bba:	5f                   	pop    %edi
  100bbb:	5d                   	pop    %ebp
  100bbc:	e9 db fd ff ff       	jmp    10099c <put_into>
  100bc1:	8d 76 00             	lea    0x0(%esi),%esi

00100bc4 <get_from>:
  100bc4:	55                   	push   %ebp
  100bc5:	89 e5                	mov    %esp,%ebp
  100bc7:	56                   	push   %esi
  100bc8:	53                   	push   %ebx
  100bc9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100bcc:	8b 75 0c             	mov    0xc(%ebp),%esi
  100bcf:	39 f3                	cmp    %esi,%ebx
  100bd1:	74 42                	je     100c15 <get_from+0x51>
  100bd3:	89 d8                	mov    %ebx,%eax
  100bd5:	c1 e0 07             	shl    $0x7,%eax
  100bd8:	01 d8                	add    %ebx,%eax
  100bda:	01 c0                	add    %eax,%eax
  100bdc:	01 d8                	add    %ebx,%eax
  100bde:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100be1:	8b 0c c5 40 5d 10 00 	mov    0x105d40(,%eax,8),%ecx
  100be8:	39 cb                	cmp    %ecx,%ebx
  100bea:	75 25                	jne    100c11 <get_from+0x4d>
  100bec:	e9 37 01 00 00       	jmp    100d28 <get_from+0x164>
  100bf1:	8d 76 00             	lea    0x0(%esi),%esi
  100bf4:	89 ca                	mov    %ecx,%edx
  100bf6:	c1 e2 07             	shl    $0x7,%edx
  100bf9:	01 ca                	add    %ecx,%edx
  100bfb:	01 d2                	add    %edx,%edx
  100bfd:	01 ca                	add    %ecx,%edx
  100bff:	8d 04 91             	lea    (%ecx,%edx,4),%eax
  100c02:	8b 0c c5 40 5d 10 00 	mov    0x105d40(,%eax,8),%ecx
  100c09:	39 cb                	cmp    %ecx,%ebx
  100c0b:	0f 84 17 01 00 00    	je     100d28 <get_from+0x164>
  100c11:	39 ce                	cmp    %ecx,%esi
  100c13:	75 df                	jne    100bf4 <get_from+0x30>
  100c15:	89 f0                	mov    %esi,%eax
  100c17:	c1 e0 07             	shl    $0x7,%eax
  100c1a:	01 f0                	add    %esi,%eax
  100c1c:	01 c0                	add    %eax,%eax
  100c1e:	01 f0                	add    %esi,%eax
  100c20:	8d 04 86             	lea    (%esi,%eax,4),%eax
  100c23:	8b 04 c5 2c 5d 10 00 	mov    0x105d2c(,%eax,8),%eax
  100c2a:	83 f8 01             	cmp    $0x1,%eax
  100c2d:	0f 84 59 01 00 00    	je     100d8c <get_from+0x1c8>
  100c33:	83 f8 03             	cmp    $0x3,%eax
  100c36:	74 30                	je     100c68 <get_from+0xa4>
  100c38:	85 c0                	test   %eax,%eax
  100c3a:	0f 84 40 01 00 00    	je     100d80 <get_from+0x1bc>
  100c40:	83 ec 08             	sub    $0x8,%esp
  100c43:	68 ac 00 00 00       	push   $0xac
  100c48:	68 7e 19 10 00       	push   $0x10197e
  100c4d:	e8 9e 0b 00 00       	call   1017f0 <abort>
  100c52:	c7 04 24 bc 18 10 00 	movl   $0x1018bc,(%esp)
  100c59:	e8 1e 0a 00 00       	call   10167c <printk>
  100c5e:	a1 00 00 00 00       	mov    0x0,%eax
  100c63:	0f 0b                	ud2    
  100c65:	8d 76 00             	lea    0x0(%esi),%esi
  100c68:	be 50 34 10 00       	mov    $0x103450,%esi
  100c6d:	83 ec 0c             	sub    $0xc,%esp
  100c70:	68 bc 18 10 00       	push   $0x1018bc
  100c75:	e8 02 0a 00 00       	call   10167c <printk>
  100c7a:	58                   	pop    %eax
  100c7b:	5a                   	pop    %edx
  100c7c:	ff 36                	pushl  (%esi)
  100c7e:	53                   	push   %ebx
  100c7f:	68 34 1a 10 00       	push   $0x101a34
  100c84:	68 b0 00 00 00       	push   $0xb0
  100c89:	68 7e 19 10 00       	push   $0x10197e
  100c8e:	68 bc 19 10 00       	push   $0x1019bc
  100c93:	e8 e4 09 00 00       	call   10167c <printk>
  100c98:	83 c4 14             	add    $0x14,%esp
  100c9b:	68 eb 18 10 00       	push   $0x1018eb
  100ca0:	e8 d7 09 00 00       	call   10167c <printk>
  100ca5:	83 c4 10             	add    $0x10,%esp
  100ca8:	3b 1e                	cmp    (%esi),%ebx
  100caa:	74 15                	je     100cc1 <get_from+0xfd>
  100cac:	83 ec 08             	sub    $0x8,%esp
  100caf:	68 b1 00 00 00       	push   $0xb1
  100cb4:	68 7e 19 10 00       	push   $0x10197e
  100cb9:	e8 32 0b 00 00       	call   1017f0 <abort>
  100cbe:	83 c4 10             	add    $0x10,%esp
  100cc1:	83 fb ff             	cmp    $0xffffffff,%ebx
  100cc4:	0f 84 a9 00 00 00    	je     100d73 <get_from+0x1af>
  100cca:	89 d8                	mov    %ebx,%eax
  100ccc:	c1 e0 07             	shl    $0x7,%eax
  100ccf:	01 d8                	add    %ebx,%eax
  100cd1:	01 c0                	add    %eax,%eax
  100cd3:	01 d8                	add    %ebx,%eax
  100cd5:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100cd8:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100cdf:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100ce5:	39 da                	cmp    %ebx,%edx
  100ce7:	0f 84 ab 00 00 00    	je     100d98 <get_from+0x1d4>
  100ced:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100cf3:	89 c8                	mov    %ecx,%eax
  100cf5:	c1 e0 07             	shl    $0x7,%eax
  100cf8:	01 c8                	add    %ecx,%eax
  100cfa:	01 c0                	add    %eax,%eax
  100cfc:	01 c8                	add    %ecx,%eax
  100cfe:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100d01:	89 14 c5 40 5d 10 00 	mov    %edx,0x105d40(,%eax,8)
  100d08:	89 d0                	mov    %edx,%eax
  100d0a:	c1 e0 07             	shl    $0x7,%eax
  100d0d:	01 d0                	add    %edx,%eax
  100d0f:	01 c0                	add    %eax,%eax
  100d11:	01 d0                	add    %edx,%eax
  100d13:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100d16:	89 0c c5 3c 5d 10 00 	mov    %ecx,0x105d3c(,%eax,8)
  100d1d:	89 16                	mov    %edx,(%esi)
  100d1f:	89 d8                	mov    %ebx,%eax
  100d21:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d24:	5b                   	pop    %ebx
  100d25:	5e                   	pop    %esi
  100d26:	5d                   	pop    %ebp
  100d27:	c3                   	ret    
  100d28:	83 ec 0c             	sub    $0xc,%esp
  100d2b:	68 bc 18 10 00       	push   $0x1018bc
  100d30:	e8 47 09 00 00       	call   10167c <printk>
  100d35:	58                   	pop    %eax
  100d36:	5a                   	pop    %edx
  100d37:	56                   	push   %esi
  100d38:	53                   	push   %ebx
  100d39:	68 34 1a 10 00       	push   $0x101a34
  100d3e:	68 99 00 00 00       	push   $0x99
  100d43:	68 7e 19 10 00       	push   $0x10197e
  100d48:	68 e4 19 10 00       	push   $0x1019e4
  100d4d:	e8 2a 09 00 00       	call   10167c <printk>
  100d52:	83 c4 14             	add    $0x14,%esp
  100d55:	68 eb 18 10 00       	push   $0x1018eb
  100d5a:	e8 1d 09 00 00       	call   10167c <printk>
  100d5f:	59                   	pop    %ecx
  100d60:	5b                   	pop    %ebx
  100d61:	68 9a 00 00 00       	push   $0x9a
  100d66:	68 7e 19 10 00       	push   $0x10197e
  100d6b:	e8 80 0a 00 00       	call   1017f0 <abort>
  100d70:	83 c4 10             	add    $0x10,%esp
  100d73:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100d78:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d7b:	5b                   	pop    %ebx
  100d7c:	5e                   	pop    %esi
  100d7d:	5d                   	pop    %ebp
  100d7e:	c3                   	ret    
  100d7f:	90                   	nop
  100d80:	be 20 33 10 00       	mov    $0x103320,%esi
  100d85:	e9 e3 fe ff ff       	jmp    100c6d <get_from+0xa9>
  100d8a:	66 90                	xchg   %ax,%ax
  100d8c:	be 24 33 10 00       	mov    $0x103324,%esi
  100d91:	e9 d7 fe ff ff       	jmp    100c6d <get_from+0xa9>
  100d96:	66 90                	xchg   %ax,%ax
  100d98:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100d9e:	89 d8                	mov    %ebx,%eax
  100da0:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100da3:	5b                   	pop    %ebx
  100da4:	5e                   	pop    %esi
  100da5:	5d                   	pop    %ebp
  100da6:	c3                   	ret    
  100da7:	90                   	nop

00100da8 <apply_new_pid>:
  100da8:	55                   	push   %ebp
  100da9:	89 e5                	mov    %esp,%ebp
  100dab:	83 ec 10             	sub    $0x10,%esp
  100dae:	a1 50 34 10 00       	mov    0x103450,%eax
  100db3:	50                   	push   %eax
  100db4:	50                   	push   %eax
  100db5:	e8 0a fe ff ff       	call   100bc4 <get_from>
  100dba:	c9                   	leave  
  100dbb:	c3                   	ret    

00100dbc <get_from_runnable>:
  100dbc:	55                   	push   %ebp
  100dbd:	89 e5                	mov    %esp,%ebp
  100dbf:	83 ec 10             	sub    $0x10,%esp
  100dc2:	a1 24 33 10 00       	mov    0x103324,%eax
  100dc7:	50                   	push   %eax
  100dc8:	50                   	push   %eax
  100dc9:	e8 f6 fd ff ff       	call   100bc4 <get_from>
  100dce:	c9                   	leave  
  100dcf:	c3                   	ret    

00100dd0 <get_from_block>:
  100dd0:	55                   	push   %ebp
  100dd1:	89 e5                	mov    %esp,%ebp
  100dd3:	83 ec 10             	sub    $0x10,%esp
  100dd6:	ff 75 08             	pushl  0x8(%ebp)
  100dd9:	ff 35 20 33 10 00    	pushl  0x103320
  100ddf:	e8 e0 fd ff ff       	call   100bc4 <get_from>
  100de4:	83 c4 10             	add    $0x10,%esp
  100de7:	40                   	inc    %eax
  100de8:	74 0a                	je     100df4 <get_from_block+0x24>
  100dea:	b8 01 00 00 00       	mov    $0x1,%eax
  100def:	c9                   	leave  
  100df0:	c3                   	ret    
  100df1:	8d 76 00             	lea    0x0(%esi),%esi
  100df4:	83 ec 08             	sub    $0x8,%esp
  100df7:	68 c8 00 00 00       	push   $0xc8
  100dfc:	68 7e 19 10 00       	push   $0x10197e
  100e01:	e8 ea 09 00 00       	call   1017f0 <abort>
  100e06:	83 c4 10             	add    $0x10,%esp
  100e09:	b8 01 00 00 00       	mov    $0x1,%eax
  100e0e:	c9                   	leave  
  100e0f:	c3                   	ret    

00100e10 <check_block>:
  100e10:	8b 15 20 33 10 00    	mov    0x103320,%edx
  100e16:	83 fa ff             	cmp    $0xffffffff,%edx
  100e19:	0f 84 9d 00 00 00    	je     100ebc <check_block+0xac>
  100e1f:	55                   	push   %ebp
  100e20:	89 e5                	mov    %esp,%ebp
  100e22:	57                   	push   %edi
  100e23:	56                   	push   %esi
  100e24:	53                   	push   %ebx
  100e25:	83 ec 0c             	sub    $0xc,%esp
  100e28:	89 d3                	mov    %edx,%ebx
  100e2a:	eb 1e                	jmp    100e4a <check_block+0x3a>
  100e2c:	89 d8                	mov    %ebx,%eax
  100e2e:	c1 e0 07             	shl    $0x7,%eax
  100e31:	01 d8                	add    %ebx,%eax
  100e33:	01 c0                	add    %eax,%eax
  100e35:	01 d8                	add    %ebx,%eax
  100e37:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100e3a:	8b 1c c5 40 5d 10 00 	mov    0x105d40(,%eax,8),%ebx
  100e41:	39 d3                	cmp    %edx,%ebx
  100e43:	74 6a                	je     100eaf <check_block+0x9f>
  100e45:	83 fa ff             	cmp    $0xffffffff,%edx
  100e48:	74 65                	je     100eaf <check_block+0x9f>
  100e4a:	89 d8                	mov    %ebx,%eax
  100e4c:	c1 e0 07             	shl    $0x7,%eax
  100e4f:	01 d8                	add    %ebx,%eax
  100e51:	01 c0                	add    %eax,%eax
  100e53:	01 d8                	add    %ebx,%eax
  100e55:	8d 34 83             	lea    (%ebx,%eax,4),%esi
  100e58:	c1 e6 03             	shl    $0x3,%esi
  100e5b:	8b be 2c 5d 10 00    	mov    0x105d2c(%esi),%edi
  100e61:	85 ff                	test   %edi,%edi
  100e63:	75 c7                	jne    100e2c <check_block+0x1c>
  100e65:	8b 8e 34 5d 10 00    	mov    0x105d34(%esi),%ecx
  100e6b:	85 c9                	test   %ecx,%ecx
  100e6d:	7f bd                	jg     100e2c <check_block+0x1c>
  100e6f:	8b be 40 5d 10 00    	mov    0x105d40(%esi),%edi
  100e75:	83 ec 0c             	sub    $0xc,%esp
  100e78:	53                   	push   %ebx
  100e79:	e8 52 ff ff ff       	call   100dd0 <get_from_block>
  100e7e:	58                   	pop    %eax
  100e7f:	5a                   	pop    %edx
  100e80:	81 c6 e0 5c 10 00    	add    $0x105ce0,%esi
  100e86:	56                   	push   %esi
  100e87:	53                   	push   %ebx
  100e88:	e8 27 fc ff ff       	call   100ab4 <put_into_runnable>
  100e8d:	89 f8                	mov    %edi,%eax
  100e8f:	c1 e0 07             	shl    $0x7,%eax
  100e92:	01 f8                	add    %edi,%eax
  100e94:	01 c0                	add    %eax,%eax
  100e96:	01 f8                	add    %edi,%eax
  100e98:	8d 04 87             	lea    (%edi,%eax,4),%eax
  100e9b:	8b 1c c5 40 5d 10 00 	mov    0x105d40(,%eax,8),%ebx
  100ea2:	83 c4 10             	add    $0x10,%esp
  100ea5:	8b 15 20 33 10 00    	mov    0x103320,%edx
  100eab:	39 d3                	cmp    %edx,%ebx
  100ead:	75 96                	jne    100e45 <check_block+0x35>
  100eaf:	b8 01 00 00 00       	mov    $0x1,%eax
  100eb4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100eb7:	5b                   	pop    %ebx
  100eb8:	5e                   	pop    %esi
  100eb9:	5f                   	pop    %edi
  100eba:	5d                   	pop    %ebp
  100ebb:	c3                   	ret    
  100ebc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100ec1:	c3                   	ret    
  100ec2:	66 90                	xchg   %ax,%ax

00100ec4 <checkTimeCount>:
  100ec4:	55                   	push   %ebp
  100ec5:	89 e5                	mov    %esp,%ebp
  100ec7:	83 ec 14             	sub    $0x14,%esp
  100eca:	68 bc 18 10 00       	push   $0x1018bc
  100ecf:	e8 a8 07 00 00       	call   10167c <printk>
  100ed4:	8b 15 c0 3c 10 00    	mov    0x103cc0,%edx
  100eda:	58                   	pop    %eax
  100edb:	59                   	pop    %ecx
  100edc:	89 d0                	mov    %edx,%eax
  100ede:	c1 e0 07             	shl    $0x7,%eax
  100ee1:	01 d0                	add    %edx,%eax
  100ee3:	01 c0                	add    %eax,%eax
  100ee5:	01 d0                	add    %edx,%eax
  100ee7:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100eea:	ff 34 c5 30 5d 10 00 	pushl  0x105d30(,%eax,8)
  100ef1:	52                   	push   %edx
  100ef2:	68 54 1a 10 00       	push   $0x101a54
  100ef7:	6a 17                	push   $0x17
  100ef9:	68 7e 19 10 00       	push   $0x10197e
  100efe:	68 08 1a 10 00       	push   $0x101a08
  100f03:	e8 74 07 00 00       	call   10167c <printk>
  100f08:	83 c4 14             	add    $0x14,%esp
  100f0b:	68 eb 18 10 00       	push   $0x1018eb
  100f10:	e8 67 07 00 00       	call   10167c <printk>
  100f15:	e8 f6 fe ff ff       	call   100e10 <check_block>
  100f1a:	8b 15 c0 3c 10 00    	mov    0x103cc0,%edx
  100f20:	89 d0                	mov    %edx,%eax
  100f22:	c1 e0 07             	shl    $0x7,%eax
  100f25:	01 d0                	add    %edx,%eax
  100f27:	01 c0                	add    %eax,%eax
  100f29:	01 d0                	add    %edx,%eax
  100f2b:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100f2e:	83 c4 10             	add    $0x10,%esp
  100f31:	8b 04 c5 30 5d 10 00 	mov    0x105d30(,%eax,8),%eax
  100f38:	85 c0                	test   %eax,%eax
  100f3a:	7e 08                	jle    100f44 <checkTimeCount+0x80>
  100f3c:	b8 01 00 00 00       	mov    $0x1,%eax
  100f41:	c9                   	leave  
  100f42:	c3                   	ret    
  100f43:	90                   	nop
  100f44:	83 ec 08             	sub    $0x8,%esp
  100f47:	ff 75 08             	pushl  0x8(%ebp)
  100f4a:	52                   	push   %edx
  100f4b:	e8 64 fb ff ff       	call   100ab4 <put_into_runnable>
  100f50:	a1 24 33 10 00       	mov    0x103324,%eax
  100f55:	5a                   	pop    %edx
  100f56:	59                   	pop    %ecx
  100f57:	50                   	push   %eax
  100f58:	50                   	push   %eax
  100f59:	e8 66 fc ff ff       	call   100bc4 <get_from>
  100f5e:	83 c4 10             	add    $0x10,%esp
  100f61:	39 05 c0 3c 10 00    	cmp    %eax,0x103cc0
  100f67:	74 d3                	je     100f3c <checkTimeCount+0x78>
  100f69:	a3 c0 3c 10 00       	mov    %eax,0x103cc0
  100f6e:	83 ec 08             	sub    $0x8,%esp
  100f71:	89 c2                	mov    %eax,%edx
  100f73:	c1 e2 07             	shl    $0x7,%edx
  100f76:	01 c2                	add    %eax,%edx
  100f78:	01 d2                	add    %edx,%edx
  100f7a:	01 c2                	add    %eax,%edx
  100f7c:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100f7f:	8d 04 c5 dc 5c 10 00 	lea    0x105cdc(,%eax,8),%eax
  100f86:	50                   	push   %eax
  100f87:	6a 10                	push   $0x10
  100f89:	e8 26 f2 ff ff       	call   1001b4 <change_tss>
  100f8e:	83 c4 10             	add    $0x10,%esp
  100f91:	b8 01 00 00 00       	mov    $0x1,%eax
  100f96:	c9                   	leave  
  100f97:	c3                   	ret    

00100f98 <check_is_in>:
  100f98:	55                   	push   %ebp
  100f99:	89 e5                	mov    %esp,%ebp
  100f9b:	53                   	push   %ebx
  100f9c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100f9f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100fa2:	39 d9                	cmp    %ebx,%ecx
  100fa4:	74 3b                	je     100fe1 <check_is_in+0x49>
  100fa6:	89 c8                	mov    %ecx,%eax
  100fa8:	c1 e0 07             	shl    $0x7,%eax
  100fab:	01 c8                	add    %ecx,%eax
  100fad:	01 c0                	add    %eax,%eax
  100faf:	01 c8                	add    %ecx,%eax
  100fb1:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100fb4:	8b 14 c5 40 5d 10 00 	mov    0x105d40(,%eax,8),%edx
  100fbb:	39 d1                	cmp    %edx,%ecx
  100fbd:	75 1e                	jne    100fdd <check_is_in+0x45>
  100fbf:	eb 2b                	jmp    100fec <check_is_in+0x54>
  100fc1:	8d 76 00             	lea    0x0(%esi),%esi
  100fc4:	89 d0                	mov    %edx,%eax
  100fc6:	c1 e0 07             	shl    $0x7,%eax
  100fc9:	01 d0                	add    %edx,%eax
  100fcb:	01 c0                	add    %eax,%eax
  100fcd:	01 d0                	add    %edx,%eax
  100fcf:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100fd2:	8b 14 c5 40 5d 10 00 	mov    0x105d40(,%eax,8),%edx
  100fd9:	39 d1                	cmp    %edx,%ecx
  100fdb:	74 0f                	je     100fec <check_is_in+0x54>
  100fdd:	39 d3                	cmp    %edx,%ebx
  100fdf:	75 e3                	jne    100fc4 <check_is_in+0x2c>
  100fe1:	b8 01 00 00 00       	mov    $0x1,%eax
  100fe6:	5b                   	pop    %ebx
  100fe7:	5d                   	pop    %ebp
  100fe8:	c3                   	ret    
  100fe9:	8d 76 00             	lea    0x0(%esi),%esi
  100fec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100ff1:	5b                   	pop    %ebx
  100ff2:	5d                   	pop    %ebp
  100ff3:	c3                   	ret    

00100ff4 <block_decrease>:
  100ff4:	55                   	push   %ebp
  100ff5:	89 e5                	mov    %esp,%ebp
  100ff7:	8b 0d 20 33 10 00    	mov    0x103320,%ecx
  100ffd:	83 f9 ff             	cmp    $0xffffffff,%ecx
  101000:	74 2e                	je     101030 <block_decrease+0x3c>
  101002:	89 ca                	mov    %ecx,%edx
  101004:	89 d0                	mov    %edx,%eax
  101006:	c1 e0 07             	shl    $0x7,%eax
  101009:	01 d0                	add    %edx,%eax
  10100b:	01 c0                	add    %eax,%eax
  10100d:	01 d0                	add    %edx,%eax
  10100f:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101012:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  101019:	ff 88 54 20 00 00    	decl   0x2054(%eax)
  10101f:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  101025:	39 d1                	cmp    %edx,%ecx
  101027:	75 db                	jne    101004 <block_decrease+0x10>
  101029:	b8 01 00 00 00       	mov    $0x1,%eax
  10102e:	5d                   	pop    %ebp
  10102f:	c3                   	ret    
  101030:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101035:	5d                   	pop    %ebp
  101036:	c3                   	ret    
  101037:	90                   	nop

00101038 <init_pcb>:
  101038:	55                   	push   %ebp
  101039:	89 e5                	mov    %esp,%ebp
  10103b:	c7 05 c8 3c 10 00 05 	movl   $0x5,0x103cc8
  101042:	00 00 00 
  101045:	ba 38 5d 10 00       	mov    $0x105d38,%edx
  10104a:	31 c0                	xor    %eax,%eax
  10104c:	89 02                	mov    %eax,(%edx)
  10104e:	8d 48 ff             	lea    -0x1(%eax),%ecx
  101051:	89 4a 04             	mov    %ecx,0x4(%edx)
  101054:	40                   	inc    %eax
  101055:	89 42 08             	mov    %eax,0x8(%edx)
  101058:	c7 42 f4 03 00 00 00 	movl   $0x3,-0xc(%edx)
  10105f:	81 c2 68 20 00 00    	add    $0x2068,%edx
  101065:	3d 00 08 00 00       	cmp    $0x800,%eax
  10106a:	75 e0                	jne    10104c <init_pcb+0x14>
  10106c:	c7 05 3c 5d 10 00 ff 	movl   $0x7ff,0x105d3c
  101073:	07 00 00 
  101076:	c7 05 d8 7c 13 01 00 	movl   $0x0,0x1137cd8
  10107d:	00 00 00 
  101080:	5d                   	pop    %ebp
  101081:	c3                   	ret    
  101082:	66 90                	xchg   %ax,%ax

00101084 <init_kernel_pcb>:
  101084:	55                   	push   %ebp
  101085:	89 e5                	mov    %esp,%ebp
  101087:	83 ec 10             	sub    $0x10,%esp
  10108a:	a1 50 34 10 00       	mov    0x103450,%eax
  10108f:	50                   	push   %eax
  101090:	50                   	push   %eax
  101091:	e8 2e fb ff ff       	call   100bc4 <get_from>
  101096:	83 c4 10             	add    $0x10,%esp
  101099:	85 c0                	test   %eax,%eax
  10109b:	74 15                	je     1010b2 <init_kernel_pcb+0x2e>
  10109d:	83 ec 08             	sub    $0x8,%esp
  1010a0:	68 fb 00 00 00       	push   $0xfb
  1010a5:	68 7e 19 10 00       	push   $0x10197e
  1010aa:	e8 41 07 00 00       	call   1017f0 <abort>
  1010af:	83 c4 10             	add    $0x10,%esp
  1010b2:	c7 05 28 5d 10 00 10 	movl   $0x10,0x105d28
  1010b9:	00 00 00 
  1010bc:	c7 05 1c 5d 10 00 08 	movl   $0x8,0x105d1c
  1010c3:	00 00 00 
  1010c6:	c7 05 ec 5c 10 00 10 	movl   $0x10,0x105cec
  1010cd:	00 00 00 
  1010d0:	c7 05 e8 5c 10 00 10 	movl   $0x10,0x105ce8
  1010d7:	00 00 00 
  1010da:	c7 05 18 5d 10 00 2c 	movl   $0x10092c,0x105d18
  1010e1:	09 10 00 
  1010e4:	c7 05 24 5d 10 00 00 	movl   $0x400000,0x105d24
  1010eb:	00 40 00 
  1010ee:	c7 05 2c 5d 10 00 01 	movl   $0x1,0x105d2c
  1010f5:	00 00 00 
  1010f8:	c7 05 30 5d 10 00 04 	movl   $0x4,0x105d30
  1010ff:	00 00 00 
  101102:	b8 01 00 00 00       	mov    $0x1,%eax
  101107:	c9                   	leave  
  101108:	c3                   	ret    
  101109:	8d 76 00             	lea    0x0(%esi),%esi

0010110c <make_pcb>:
  10110c:	55                   	push   %ebp
  10110d:	89 e5                	mov    %esp,%ebp
  10110f:	57                   	push   %edi
  101110:	56                   	push   %esi
  101111:	8b 55 08             	mov    0x8(%ebp),%edx
  101114:	89 d0                	mov    %edx,%eax
  101116:	c1 e0 07             	shl    $0x7,%eax
  101119:	01 d0                	add    %edx,%eax
  10111b:	01 c0                	add    %eax,%eax
  10111d:	01 d0                	add    %edx,%eax
  10111f:	8d 14 82             	lea    (%edx,%eax,4),%edx
  101122:	c1 e2 03             	shl    $0x3,%edx
  101125:	8d 82 e0 5c 10 00    	lea    0x105ce0(%edx),%eax
  10112b:	b9 13 00 00 00       	mov    $0x13,%ecx
  101130:	89 c7                	mov    %eax,%edi
  101132:	8b 75 0c             	mov    0xc(%ebp),%esi
  101135:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101137:	8b 45 10             	mov    0x10(%ebp),%eax
  10113a:	89 82 2c 5d 10 00    	mov    %eax,0x105d2c(%edx)
  101140:	8b 45 14             	mov    0x14(%ebp),%eax
  101143:	89 82 30 5d 10 00    	mov    %eax,0x105d30(%edx)
  101149:	8b 45 18             	mov    0x18(%ebp),%eax
  10114c:	89 82 34 5d 10 00    	mov    %eax,0x105d34(%edx)
  101152:	8b 45 0c             	mov    0xc(%ebp),%eax
  101155:	89 82 44 5d 10 00    	mov    %eax,0x105d44(%edx)
  10115b:	b8 01 00 00 00       	mov    $0x1,%eax
  101160:	5e                   	pop    %esi
  101161:	5f                   	pop    %edi
  101162:	5d                   	pop    %ebp
  101163:	c3                   	ret    

00101164 <initIdt>:
  101164:	55                   	push   %ebp
  101165:	89 e5                	mov    %esp,%ebp
  101167:	53                   	push   %ebx
  101168:	ba 87 18 10 00       	mov    $0x101887,%edx
  10116d:	89 d3                	mov    %edx,%ebx
  10116f:	c1 ea 10             	shr    $0x10,%edx
  101172:	b9 c0 85 13 01       	mov    $0x11385c0,%ecx
  101177:	b8 c0 7d 13 01       	mov    $0x1137dc0,%eax
  10117c:	66 89 18             	mov    %bx,(%eax)
  10117f:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  101185:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  101189:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  10118d:	66 89 50 06          	mov    %dx,0x6(%eax)
  101191:	83 c0 08             	add    $0x8,%eax
  101194:	39 c1                	cmp    %eax,%ecx
  101196:	75 e4                	jne    10117c <initIdt+0x18>
  101198:	b8 8d 18 10 00       	mov    $0x10188d,%eax
  10119d:	66 a3 28 7e 13 01    	mov    %ax,0x1137e28
  1011a3:	66 c7 05 2a 7e 13 01 	movw   $0x8,0x1137e2a
  1011aa:	08 00 
  1011ac:	c6 05 2c 7e 13 01 00 	movb   $0x0,0x1137e2c
  1011b3:	c6 05 2d 7e 13 01 8f 	movb   $0x8f,0x1137e2d
  1011ba:	c1 e8 10             	shr    $0x10,%eax
  1011bd:	66 a3 2e 7e 13 01    	mov    %ax,0x1137e2e
  1011c3:	b8 91 18 10 00       	mov    $0x101891,%eax
  1011c8:	66 a3 c0 81 13 01    	mov    %ax,0x11381c0
  1011ce:	66 c7 05 c2 81 13 01 	movw   $0x8,0x11381c2
  1011d5:	08 00 
  1011d7:	c6 05 c4 81 13 01 00 	movb   $0x0,0x11381c4
  1011de:	c6 05 c5 81 13 01 ee 	movb   $0xee,0x11381c5
  1011e5:	c1 e8 10             	shr    $0x10,%eax
  1011e8:	66 a3 c6 81 13 01    	mov    %ax,0x11381c6
  1011ee:	b8 9a 18 10 00       	mov    $0x10189a,%eax
  1011f3:	66 a3 c0 7e 13 01    	mov    %ax,0x1137ec0
  1011f9:	66 c7 05 c2 7e 13 01 	movw   $0x8,0x1137ec2
  101200:	08 00 
  101202:	c6 05 c4 7e 13 01 00 	movb   $0x0,0x1137ec4
  101209:	c6 05 c5 7e 13 01 8e 	movb   $0x8e,0x1137ec5
  101210:	c1 e8 10             	shr    $0x10,%eax
  101213:	66 a3 c6 7e 13 01    	mov    %ax,0x1137ec6
  101219:	66 c7 05 54 34 10 00 	movw   $0x7ff,0x103454
  101220:	ff 07 
  101222:	b8 c0 7d 13 01       	mov    $0x1137dc0,%eax
  101227:	66 a3 56 34 10 00    	mov    %ax,0x103456
  10122d:	c1 e8 10             	shr    $0x10,%eax
  101230:	66 a3 58 34 10 00    	mov    %ax,0x103458
  101236:	b8 54 34 10 00       	mov    $0x103454,%eax
  10123b:	0f 01 18             	lidtl  (%eax)
  10123e:	5b                   	pop    %ebx
  10123f:	5d                   	pop    %ebp
  101240:	c3                   	ret    
  101241:	66 90                	xchg   %ax,%ax
  101243:	90                   	nop

00101244 <syscallHandle>:
  101244:	55                   	push   %ebp
  101245:	89 e5                	mov    %esp,%ebp
  101247:	53                   	push   %ebx
  101248:	50                   	push   %eax
  101249:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10124c:	8b 43 2c             	mov    0x2c(%ebx),%eax
  10124f:	83 f8 04             	cmp    $0x4,%eax
  101252:	74 58                	je     1012ac <syscallHandle+0x68>
  101254:	77 1e                	ja     101274 <syscallHandle+0x30>
  101256:	83 f8 01             	cmp    $0x1,%eax
  101259:	74 45                	je     1012a0 <syscallHandle+0x5c>
  10125b:	83 f8 02             	cmp    $0x2,%eax
  10125e:	75 0f                	jne    10126f <syscallHandle+0x2b>
  101260:	83 ec 0c             	sub    $0xc,%esp
  101263:	53                   	push   %ebx
  101264:	e8 3b f4 ff ff       	call   1006a4 <sys_fork>
  101269:	89 43 2c             	mov    %eax,0x2c(%ebx)
  10126c:	83 c4 10             	add    $0x10,%esp
  10126f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101272:	c9                   	leave  
  101273:	c3                   	ret    
  101274:	83 f8 07             	cmp    $0x7,%eax
  101277:	74 13                	je     10128c <syscallHandle+0x48>
  101279:	3d e6 00 00 00       	cmp    $0xe6,%eax
  10127e:	75 ef                	jne    10126f <syscallHandle+0x2b>
  101280:	89 5d 08             	mov    %ebx,0x8(%ebp)
  101283:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101286:	c9                   	leave  
  101287:	e9 94 f3 ff ff       	jmp    100620 <sys_sleep>
  10128c:	83 ec 0c             	sub    $0xc,%esp
  10128f:	53                   	push   %ebx
  101290:	e8 7f f3 ff ff       	call   100614 <sys_getpid>
  101295:	89 43 2c             	mov    %eax,0x2c(%ebx)
  101298:	83 c4 10             	add    $0x10,%esp
  10129b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10129e:	c9                   	leave  
  10129f:	c3                   	ret    
  1012a0:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1012a3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012a6:	c9                   	leave  
  1012a7:	e9 34 f3 ff ff       	jmp    1005e0 <sys_exit>
  1012ac:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1012af:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012b2:	c9                   	leave  
  1012b3:	e9 c0 f5 ff ff       	jmp    100878 <sys_write>

001012b8 <GProtectFaultHandle>:
  1012b8:	55                   	push   %ebp
  1012b9:	89 e5                	mov    %esp,%ebp
  1012bb:	83 ec 14             	sub    $0x14,%esp
  1012be:	68 bc 18 10 00       	push   $0x1018bc
  1012c3:	e8 b4 03 00 00       	call   10167c <printk>
  1012c8:	58                   	pop    %eax
  1012c9:	8b 45 08             	mov    0x8(%ebp),%eax
  1012cc:	ff 70 30             	pushl  0x30(%eax)
  1012cf:	68 d4 1a 10 00       	push   $0x101ad4
  1012d4:	6a 6b                	push   $0x6b
  1012d6:	68 63 1a 10 00       	push   $0x101a63
  1012db:	68 76 1a 10 00       	push   $0x101a76
  1012e0:	e8 97 03 00 00       	call   10167c <printk>
  1012e5:	83 c4 14             	add    $0x14,%esp
  1012e8:	68 eb 18 10 00       	push   $0x1018eb
  1012ed:	e8 8a 03 00 00       	call   10167c <printk>
  1012f2:	5a                   	pop    %edx
  1012f3:	59                   	pop    %ecx
  1012f4:	6a 6c                	push   $0x6c
  1012f6:	68 63 1a 10 00       	push   $0x101a63
  1012fb:	e8 f0 04 00 00       	call   1017f0 <abort>
  101300:	83 c4 10             	add    $0x10,%esp
  101303:	c9                   	leave  
  101304:	c3                   	ret    
  101305:	8d 76 00             	lea    0x0(%esi),%esi

00101308 <timeHandle>:
  101308:	55                   	push   %ebp
  101309:	89 e5                	mov    %esp,%ebp
  10130b:	53                   	push   %ebx
  10130c:	83 ec 10             	sub    $0x10,%esp
  10130f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101312:	6a 41                	push   $0x41
  101314:	e8 f7 f5 ff ff       	call   100910 <putChar>
  101319:	e8 5a f6 ff ff       	call   100978 <getpid>
  10131e:	89 c2                	mov    %eax,%edx
  101320:	c1 e2 07             	shl    $0x7,%edx
  101323:	01 c2                	add    %eax,%edx
  101325:	01 d2                	add    %edx,%edx
  101327:	01 c2                	add    %eax,%edx
  101329:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10132c:	ff 0c c5 30 5d 10 00 	decl   0x105d30(,%eax,8)
  101333:	e8 bc fc ff ff       	call   100ff4 <block_decrease>
  101338:	89 1c 24             	mov    %ebx,(%esp)
  10133b:	e8 84 fb ff ff       	call   100ec4 <checkTimeCount>
  101340:	83 c4 10             	add    $0x10,%esp
  101343:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  10134a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10134d:	c9                   	leave  
  10134e:	e9 bd f5 ff ff       	jmp    100910 <putChar>
  101353:	90                   	nop

00101354 <irqHandle>:
  101354:	55                   	push   %ebp
  101355:	89 e5                	mov    %esp,%ebp
  101357:	57                   	push   %edi
  101358:	56                   	push   %esi
  101359:	53                   	push   %ebx
  10135a:	83 ec 0c             	sub    $0xc,%esp
  10135d:	8b 7d 08             	mov    0x8(%ebp),%edi
  101360:	b8 10 00 00 00       	mov    $0x10,%eax
  101365:	89 c0                	mov    %eax,%eax
  101367:	8e d8                	mov    %eax,%ds
  101369:	8e e0                	mov    %eax,%fs
  10136b:	8e c0                	mov    %eax,%es
  10136d:	b8 30 00 00 00       	mov    $0x30,%eax
  101372:	89 c0                	mov    %eax,%eax
  101374:	8e e8                	mov    %eax,%gs
  101376:	89 ee                	mov    %ebp,%esi
  101378:	3b 7e 08             	cmp    0x8(%esi),%edi
  10137b:	74 12                	je     10138f <irqHandle+0x3b>
  10137d:	83 ec 08             	sub    $0x8,%esp
  101380:	6a 20                	push   $0x20
  101382:	68 63 1a 10 00       	push   $0x101a63
  101387:	e8 64 04 00 00       	call   1017f0 <abort>
  10138c:	83 c4 10             	add    $0x10,%esp
  10138f:	8b 1d c0 3c 10 00    	mov    0x103cc0,%ebx
  101395:	fa                   	cli    
  101396:	8b 47 30             	mov    0x30(%edi),%eax
  101399:	83 f8 0d             	cmp    $0xd,%eax
  10139c:	0f 84 46 01 00 00    	je     1014e8 <irqHandle+0x194>
  1013a2:	0f 8e e8 00 00 00    	jle    101490 <irqHandle+0x13c>
  1013a8:	83 f8 20             	cmp    $0x20,%eax
  1013ab:	74 2f                	je     1013dc <irqHandle+0x88>
  1013ad:	83 c0 80             	add    $0xffffff80,%eax
  1013b0:	0f 85 e1 00 00 00    	jne    101497 <irqHandle+0x143>
  1013b6:	83 ec 0c             	sub    $0xc,%esp
  1013b9:	57                   	push   %edi
  1013ba:	e8 85 fe ff ff       	call   101244 <syscallHandle>
  1013bf:	8b 47 30             	mov    0x30(%edi),%eax
  1013c2:	83 c4 10             	add    $0x10,%esp
  1013c5:	3d 80 00 00 00       	cmp    $0x80,%eax
  1013ca:	74 28                	je     1013f4 <irqHandle+0xa0>
  1013cc:	83 f8 20             	cmp    $0x20,%eax
  1013cf:	74 23                	je     1013f4 <irqHandle+0xa0>
  1013d1:	fb                   	sti    
  1013d2:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1013d5:	5b                   	pop    %ebx
  1013d6:	5e                   	pop    %esi
  1013d7:	5f                   	pop    %edi
  1013d8:	5d                   	pop    %ebp
  1013d9:	c3                   	ret    
  1013da:	66 90                	xchg   %ax,%ax
  1013dc:	83 ec 0c             	sub    $0xc,%esp
  1013df:	57                   	push   %edi
  1013e0:	e8 23 ff ff ff       	call   101308 <timeHandle>
  1013e5:	8b 47 30             	mov    0x30(%edi),%eax
  1013e8:	83 c4 10             	add    $0x10,%esp
  1013eb:	3d 80 00 00 00       	cmp    $0x80,%eax
  1013f0:	75 da                	jne    1013cc <irqHandle+0x78>
  1013f2:	66 90                	xchg   %ax,%ax
  1013f4:	8b 15 c0 3c 10 00    	mov    0x103cc0,%edx
  1013fa:	39 d3                	cmp    %edx,%ebx
  1013fc:	74 d3                	je     1013d1 <irqHandle+0x7d>
  1013fe:	89 d0                	mov    %edx,%eax
  101400:	c1 e0 07             	shl    $0x7,%eax
  101403:	01 d0                	add    %edx,%eax
  101405:	01 c0                	add    %eax,%eax
  101407:	01 d0                	add    %edx,%eax
  101409:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10140c:	8d 04 c5 90 5c 10 00 	lea    0x105c90(,%eax,8),%eax
  101413:	89 46 08             	mov    %eax,0x8(%esi)
  101416:	8b 0d c0 3c 10 00    	mov    0x103cc0,%ecx
  10141c:	89 ca                	mov    %ecx,%edx
  10141e:	c1 e2 07             	shl    $0x7,%edx
  101421:	01 ca                	add    %ecx,%edx
  101423:	01 d2                	add    %edx,%edx
  101425:	01 ca                	add    %ecx,%edx
  101427:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  10142a:	8d 34 d5 e0 5c 10 00 	lea    0x105ce0(,%edx,8),%esi
  101431:	b9 13 00 00 00       	mov    $0x13,%ecx
  101436:	89 c7                	mov    %eax,%edi
  101438:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10143a:	83 ec 0c             	sub    $0xc,%esp
  10143d:	68 bc 18 10 00       	push   $0x1018bc
  101442:	e8 35 02 00 00       	call   10167c <printk>
  101447:	58                   	pop    %eax
  101448:	5a                   	pop    %edx
  101449:	ff 35 c0 3c 10 00    	pushl  0x103cc0
  10144f:	53                   	push   %ebx
  101450:	68 e8 1a 10 00       	push   $0x101ae8
  101455:	6a 42                	push   $0x42
  101457:	68 63 1a 10 00       	push   $0x101a63
  10145c:	68 b4 1a 10 00       	push   $0x101ab4
  101461:	e8 16 02 00 00       	call   10167c <printk>
  101466:	83 c4 14             	add    $0x14,%esp
  101469:	68 eb 18 10 00       	push   $0x1018eb
  10146e:	e8 09 02 00 00       	call   10167c <printk>
  101473:	59                   	pop    %ecx
  101474:	5b                   	pop    %ebx
  101475:	a1 c0 3c 10 00       	mov    0x103cc0,%eax
  10147a:	c1 e0 10             	shl    $0x10,%eax
  10147d:	50                   	push   %eax
  10147e:	6a 23                	push   $0x23
  101480:	e8 af eb ff ff       	call   100034 <change_gdt>
  101485:	83 c4 10             	add    $0x10,%esp
  101488:	e9 44 ff ff ff       	jmp    1013d1 <irqHandle+0x7d>
  10148d:	8d 76 00             	lea    0x0(%esi),%esi
  101490:	40                   	inc    %eax
  101491:	0f 84 3a ff ff ff    	je     1013d1 <irqHandle+0x7d>
  101497:	83 ec 0c             	sub    $0xc,%esp
  10149a:	68 bc 18 10 00       	push   $0x1018bc
  10149f:	e8 d8 01 00 00       	call   10167c <printk>
  1014a4:	58                   	pop    %eax
  1014a5:	5a                   	pop    %edx
  1014a6:	ff 77 38             	pushl  0x38(%edi)
  1014a9:	ff 77 30             	pushl  0x30(%edi)
  1014ac:	68 e8 1a 10 00       	push   $0x101ae8
  1014b1:	6a 36                	push   $0x36
  1014b3:	68 63 1a 10 00       	push   $0x101a63
  1014b8:	68 8c 1a 10 00       	push   $0x101a8c
  1014bd:	e8 ba 01 00 00       	call   10167c <printk>
  1014c2:	83 c4 14             	add    $0x14,%esp
  1014c5:	68 eb 18 10 00       	push   $0x1018eb
  1014ca:	e8 ad 01 00 00       	call   10167c <printk>
  1014cf:	59                   	pop    %ecx
  1014d0:	58                   	pop    %eax
  1014d1:	6a 37                	push   $0x37
  1014d3:	68 63 1a 10 00       	push   $0x101a63
  1014d8:	e8 13 03 00 00       	call   1017f0 <abort>
  1014dd:	8b 47 30             	mov    0x30(%edi),%eax
  1014e0:	83 c4 10             	add    $0x10,%esp
  1014e3:	e9 dd fe ff ff       	jmp    1013c5 <irqHandle+0x71>
  1014e8:	83 ec 0c             	sub    $0xc,%esp
  1014eb:	57                   	push   %edi
  1014ec:	e8 c7 fd ff ff       	call   1012b8 <GProtectFaultHandle>
  1014f1:	8b 47 30             	mov    0x30(%edi),%eax
  1014f4:	83 c4 10             	add    $0x10,%esp
  1014f7:	e9 c9 fe ff ff       	jmp    1013c5 <irqHandle+0x71>

001014fc <initIntr>:
  1014fc:	55                   	push   %ebp
  1014fd:	89 e5                	mov    %esp,%ebp
  1014ff:	ba 21 00 00 00       	mov    $0x21,%edx
  101504:	b0 ff                	mov    $0xff,%al
  101506:	ee                   	out    %al,(%dx)
  101507:	ba a1 00 00 00       	mov    $0xa1,%edx
  10150c:	ee                   	out    %al,(%dx)
  10150d:	ba 20 00 00 00       	mov    $0x20,%edx
  101512:	b0 11                	mov    $0x11,%al
  101514:	ee                   	out    %al,(%dx)
  101515:	ba 21 00 00 00       	mov    $0x21,%edx
  10151a:	b0 20                	mov    $0x20,%al
  10151c:	ee                   	out    %al,(%dx)
  10151d:	b0 04                	mov    $0x4,%al
  10151f:	ee                   	out    %al,(%dx)
  101520:	b0 03                	mov    $0x3,%al
  101522:	ee                   	out    %al,(%dx)
  101523:	ba a0 00 00 00       	mov    $0xa0,%edx
  101528:	b0 11                	mov    $0x11,%al
  10152a:	ee                   	out    %al,(%dx)
  10152b:	ba a1 00 00 00       	mov    $0xa1,%edx
  101530:	b0 28                	mov    $0x28,%al
  101532:	ee                   	out    %al,(%dx)
  101533:	b0 02                	mov    $0x2,%al
  101535:	ee                   	out    %al,(%dx)
  101536:	b0 03                	mov    $0x3,%al
  101538:	ee                   	out    %al,(%dx)
  101539:	ba 20 00 00 00       	mov    $0x20,%edx
  10153e:	b0 68                	mov    $0x68,%al
  101540:	ee                   	out    %al,(%dx)
  101541:	b0 0a                	mov    $0xa,%al
  101543:	ee                   	out    %al,(%dx)
  101544:	ba a0 00 00 00       	mov    $0xa0,%edx
  101549:	b0 68                	mov    $0x68,%al
  10154b:	ee                   	out    %al,(%dx)
  10154c:	b0 0a                	mov    $0xa,%al
  10154e:	ee                   	out    %al,(%dx)
  10154f:	5d                   	pop    %ebp
  101550:	c3                   	ret    
  101551:	8d 76 00             	lea    0x0(%esi),%esi

00101554 <initTimer>:
  101554:	55                   	push   %ebp
  101555:	89 e5                	mov    %esp,%ebp
  101557:	ba 43 00 00 00       	mov    $0x43,%edx
  10155c:	b0 34                	mov    $0x34,%al
  10155e:	ee                   	out    %al,(%dx)
  10155f:	ba 40 00 00 00       	mov    $0x40,%edx
  101564:	b0 9b                	mov    $0x9b,%al
  101566:	ee                   	out    %al,(%dx)
  101567:	b0 2e                	mov    $0x2e,%al
  101569:	ee                   	out    %al,(%dx)
  10156a:	5d                   	pop    %ebp
  10156b:	c3                   	ret    

0010156c <i2A>:
  10156c:	55                   	push   %ebp
  10156d:	89 e5                	mov    %esp,%ebp
  10156f:	57                   	push   %edi
  101570:	56                   	push   %esi
  101571:	53                   	push   %ebx
  101572:	51                   	push   %ecx
  101573:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101576:	85 c9                	test   %ecx,%ecx
  101578:	78 6e                	js     1015e8 <i2A+0x7c>
  10157a:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  10157e:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  101582:	bb 9e 34 10 00       	mov    $0x10349e,%ebx
  101587:	31 ff                	xor    %edi,%edi
  101589:	eb 03                	jmp    10158e <i2A+0x22>
  10158b:	90                   	nop
  10158c:	89 f7                	mov    %esi,%edi
  10158e:	4b                   	dec    %ebx
  10158f:	89 c8                	mov    %ecx,%eax
  101591:	be 0a 00 00 00       	mov    $0xa,%esi
  101596:	99                   	cltd   
  101597:	f7 fe                	idiv   %esi
  101599:	83 c2 30             	add    $0x30,%edx
  10159c:	88 13                	mov    %dl,(%ebx)
  10159e:	8d 77 01             	lea    0x1(%edi),%esi
  1015a1:	b8 67 66 66 66       	mov    $0x66666667,%eax
  1015a6:	f7 e9                	imul   %ecx
  1015a8:	89 d0                	mov    %edx,%eax
  1015aa:	c1 f8 02             	sar    $0x2,%eax
  1015ad:	c1 f9 1f             	sar    $0x1f,%ecx
  1015b0:	29 c8                	sub    %ecx,%eax
  1015b2:	89 c1                	mov    %eax,%ecx
  1015b4:	75 d6                	jne    10158c <i2A+0x20>
  1015b6:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  1015ba:	74 20                	je     1015dc <i2A+0x70>
  1015bc:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  1015c0:	75 06                	jne    1015c8 <i2A+0x5c>
  1015c2:	fe 05 9d 34 10 00    	incb   0x10349d
  1015c8:	c6 05 9e 34 10 00 00 	movb   $0x0,0x10349e
  1015cf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1015d2:	89 18                	mov    %ebx,(%eax)
  1015d4:	89 f0                	mov    %esi,%eax
  1015d6:	5a                   	pop    %edx
  1015d7:	5b                   	pop    %ebx
  1015d8:	5e                   	pop    %esi
  1015d9:	5f                   	pop    %edi
  1015da:	5d                   	pop    %ebp
  1015db:	c3                   	ret    
  1015dc:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  1015e0:	8d 77 02             	lea    0x2(%edi),%esi
  1015e3:	4b                   	dec    %ebx
  1015e4:	eb d6                	jmp    1015bc <i2A+0x50>
  1015e6:	66 90                	xchg   %ax,%ax
  1015e8:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  1015ee:	74 0c                	je     1015fc <i2A+0x90>
  1015f0:	f7 d9                	neg    %ecx
  1015f2:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  1015f6:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  1015fa:	eb 86                	jmp    101582 <i2A+0x16>
  1015fc:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  101601:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101605:	eb ef                	jmp    1015f6 <i2A+0x8a>
  101607:	90                   	nop

00101608 <i2X>:
  101608:	55                   	push   %ebp
  101609:	89 e5                	mov    %esp,%ebp
  10160b:	57                   	push   %edi
  10160c:	56                   	push   %esi
  10160d:	53                   	push   %ebx
  10160e:	8b 55 08             	mov    0x8(%ebp),%edx
  101611:	b9 7d 34 10 00       	mov    $0x10347d,%ecx
  101616:	31 c0                	xor    %eax,%eax
  101618:	40                   	inc    %eax
  101619:	89 d6                	mov    %edx,%esi
  10161b:	83 e6 0f             	and    $0xf,%esi
  10161e:	8d 5e f6             	lea    -0xa(%esi),%ebx
  101621:	89 cf                	mov    %ecx,%edi
  101623:	83 fb 05             	cmp    $0x5,%ebx
  101626:	77 4c                	ja     101674 <i2X+0x6c>
  101628:	ff 24 9d f4 1a 10 00 	jmp    *0x101af4(,%ebx,4)
  10162f:	90                   	nop
  101630:	c6 01 65             	movb   $0x65,(%ecx)
  101633:	90                   	nop
  101634:	49                   	dec    %ecx
  101635:	c1 ea 04             	shr    $0x4,%edx
  101638:	75 de                	jne    101618 <i2X+0x10>
  10163a:	c6 05 7e 34 10 00 00 	movb   $0x0,0x10347e
  101641:	8b 55 0c             	mov    0xc(%ebp),%edx
  101644:	89 3a                	mov    %edi,(%edx)
  101646:	5b                   	pop    %ebx
  101647:	5e                   	pop    %esi
  101648:	5f                   	pop    %edi
  101649:	5d                   	pop    %ebp
  10164a:	c3                   	ret    
  10164b:	90                   	nop
  10164c:	c6 01 64             	movb   $0x64,(%ecx)
  10164f:	eb e3                	jmp    101634 <i2X+0x2c>
  101651:	8d 76 00             	lea    0x0(%esi),%esi
  101654:	c6 01 63             	movb   $0x63,(%ecx)
  101657:	eb db                	jmp    101634 <i2X+0x2c>
  101659:	8d 76 00             	lea    0x0(%esi),%esi
  10165c:	c6 01 62             	movb   $0x62,(%ecx)
  10165f:	eb d3                	jmp    101634 <i2X+0x2c>
  101661:	8d 76 00             	lea    0x0(%esi),%esi
  101664:	c6 01 61             	movb   $0x61,(%ecx)
  101667:	eb cb                	jmp    101634 <i2X+0x2c>
  101669:	8d 76 00             	lea    0x0(%esi),%esi
  10166c:	c6 01 66             	movb   $0x66,(%ecx)
  10166f:	eb c3                	jmp    101634 <i2X+0x2c>
  101671:	8d 76 00             	lea    0x0(%esi),%esi
  101674:	8d 5e 30             	lea    0x30(%esi),%ebx
  101677:	88 19                	mov    %bl,(%ecx)
  101679:	eb b9                	jmp    101634 <i2X+0x2c>
  10167b:	90                   	nop

0010167c <printk>:
  10167c:	55                   	push   %ebp
  10167d:	89 e5                	mov    %esp,%ebp
  10167f:	57                   	push   %edi
  101680:	56                   	push   %esi
  101681:	53                   	push   %ebx
  101682:	83 ec 2c             	sub    $0x2c,%esp
  101685:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101688:	8a 11                	mov    (%ecx),%dl
  10168a:	84 d2                	test   %dl,%dl
  10168c:	0f 84 54 01 00 00    	je     1017e6 <printk+0x16a>
  101692:	8d 45 0c             	lea    0xc(%ebp),%eax
  101695:	31 ff                	xor    %edi,%edi
  101697:	eb 18                	jmp    1016b1 <printk+0x35>
  101699:	8d 76 00             	lea    0x0(%esi),%esi
  10169c:	8a 11                	mov    (%ecx),%dl
  10169e:	89 cb                	mov    %ecx,%ebx
  1016a0:	88 97 a0 34 10 00    	mov    %dl,0x1034a0(%edi)
  1016a6:	47                   	inc    %edi
  1016a7:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1016aa:	8a 53 01             	mov    0x1(%ebx),%dl
  1016ad:	84 d2                	test   %dl,%dl
  1016af:	74 72                	je     101723 <printk+0xa7>
  1016b1:	80 fa 25             	cmp    $0x25,%dl
  1016b4:	75 e6                	jne    10169c <printk+0x20>
  1016b6:	8d 59 01             	lea    0x1(%ecx),%ebx
  1016b9:	8a 51 01             	mov    0x1(%ecx),%dl
  1016bc:	80 fa 64             	cmp    $0x64,%dl
  1016bf:	0f 84 bf 00 00 00    	je     101784 <printk+0x108>
  1016c5:	0f 8e 01 01 00 00    	jle    1017cc <printk+0x150>
  1016cb:	80 fa 73             	cmp    $0x73,%dl
  1016ce:	0f 84 84 00 00 00    	je     101758 <printk+0xdc>
  1016d4:	80 fa 78             	cmp    $0x78,%dl
  1016d7:	75 c7                	jne    1016a0 <printk+0x24>
  1016d9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1016e0:	8d 70 04             	lea    0x4(%eax),%esi
  1016e3:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1016e6:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  1016e9:	56                   	push   %esi
  1016ea:	ff 30                	pushl  (%eax)
  1016ec:	e8 17 ff ff ff       	call   101608 <i2X>
  1016f1:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1016f4:	8d b7 a0 34 10 00    	lea    0x1034a0(%edi),%esi
  1016fa:	8a 11                	mov    (%ecx),%dl
  1016fc:	83 c4 08             	add    $0x8,%esp
  1016ff:	31 c0                	xor    %eax,%eax
  101701:	84 d2                	test   %dl,%dl
  101703:	74 0f                	je     101714 <printk+0x98>
  101705:	8d 76 00             	lea    0x0(%esi),%esi
  101708:	40                   	inc    %eax
  101709:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  10170d:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  101710:	84 d2                	test   %dl,%dl
  101712:	75 f4                	jne    101708 <printk+0x8c>
  101714:	01 c7                	add    %eax,%edi
  101716:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101719:	8d 4b 01             	lea    0x1(%ebx),%ecx
  10171c:	8a 53 01             	mov    0x1(%ebx),%dl
  10171f:	84 d2                	test   %dl,%dl
  101721:	75 8e                	jne    1016b1 <printk+0x35>
  101723:	c6 87 a0 34 10 00 00 	movb   $0x0,0x1034a0(%edi)
  10172a:	0f be 05 a0 34 10 00 	movsbl 0x1034a0,%eax
  101731:	bb a0 34 10 00       	mov    $0x1034a0,%ebx
  101736:	84 c0                	test   %al,%al
  101738:	74 16                	je     101750 <printk+0xd4>
  10173a:	66 90                	xchg   %ax,%ax
  10173c:	83 ec 0c             	sub    $0xc,%esp
  10173f:	50                   	push   %eax
  101740:	e8 cb f1 ff ff       	call   100910 <putChar>
  101745:	43                   	inc    %ebx
  101746:	0f be 03             	movsbl (%ebx),%eax
  101749:	83 c4 10             	add    $0x10,%esp
  10174c:	84 c0                	test   %al,%al
  10174e:	75 ec                	jne    10173c <printk+0xc0>
  101750:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101753:	5b                   	pop    %ebx
  101754:	5e                   	pop    %esi
  101755:	5f                   	pop    %edi
  101756:	5d                   	pop    %ebp
  101757:	c3                   	ret    
  101758:	8d 70 04             	lea    0x4(%eax),%esi
  10175b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10175e:	8b 08                	mov    (%eax),%ecx
  101760:	8d b7 a0 34 10 00    	lea    0x1034a0(%edi),%esi
  101766:	8a 11                	mov    (%ecx),%dl
  101768:	31 c0                	xor    %eax,%eax
  10176a:	84 d2                	test   %dl,%dl
  10176c:	74 a6                	je     101714 <printk+0x98>
  10176e:	66 90                	xchg   %ax,%ax
  101770:	40                   	inc    %eax
  101771:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101775:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  101778:	84 d2                	test   %dl,%dl
  10177a:	75 f4                	jne    101770 <printk+0xf4>
  10177c:	01 c7                	add    %eax,%edi
  10177e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101781:	eb 96                	jmp    101719 <printk+0x9d>
  101783:	90                   	nop
  101784:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10178b:	8d 70 04             	lea    0x4(%eax),%esi
  10178e:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101791:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101794:	56                   	push   %esi
  101795:	ff 30                	pushl  (%eax)
  101797:	e8 d0 fd ff ff       	call   10156c <i2A>
  10179c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  10179f:	8d b7 a0 34 10 00    	lea    0x1034a0(%edi),%esi
  1017a5:	8a 11                	mov    (%ecx),%dl
  1017a7:	83 c4 08             	add    $0x8,%esp
  1017aa:	31 c0                	xor    %eax,%eax
  1017ac:	84 d2                	test   %dl,%dl
  1017ae:	0f 84 60 ff ff ff    	je     101714 <printk+0x98>
  1017b4:	40                   	inc    %eax
  1017b5:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1017b9:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  1017bc:	84 d2                	test   %dl,%dl
  1017be:	75 f4                	jne    1017b4 <printk+0x138>
  1017c0:	01 c7                	add    %eax,%edi
  1017c2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1017c5:	e9 4f ff ff ff       	jmp    101719 <printk+0x9d>
  1017ca:	66 90                	xchg   %ax,%ax
  1017cc:	80 fa 63             	cmp    $0x63,%dl
  1017cf:	0f 85 cb fe ff ff    	jne    1016a0 <printk+0x24>
  1017d5:	8b 10                	mov    (%eax),%edx
  1017d7:	88 97 a0 34 10 00    	mov    %dl,0x1034a0(%edi)
  1017dd:	83 c0 04             	add    $0x4,%eax
  1017e0:	47                   	inc    %edi
  1017e1:	e9 c1 fe ff ff       	jmp    1016a7 <printk+0x2b>
  1017e6:	31 ff                	xor    %edi,%edi
  1017e8:	e9 36 ff ff ff       	jmp    101723 <printk+0xa7>
  1017ed:	66 90                	xchg   %ax,%ax
  1017ef:	90                   	nop

001017f0 <abort>:
  1017f0:	55                   	push   %ebp
  1017f1:	89 e5                	mov    %esp,%ebp
  1017f3:	57                   	push   %edi
  1017f4:	56                   	push   %esi
  1017f5:	53                   	push   %ebx
  1017f6:	83 ec 1c             	sub    $0x1c,%esp
  1017f9:	8b 55 08             	mov    0x8(%ebp),%edx
  1017fc:	fa                   	cli    
  1017fd:	8a 02                	mov    (%edx),%al
  1017ff:	b9 52 33 10 00       	mov    $0x103352,%ecx
  101804:	84 c0                	test   %al,%al
  101806:	74 0b                	je     101813 <abort+0x23>
  101808:	41                   	inc    %ecx
  101809:	42                   	inc    %edx
  10180a:	88 41 ff             	mov    %al,-0x1(%ecx)
  10180d:	8a 02                	mov    (%edx),%al
  10180f:	84 c0                	test   %al,%al
  101811:	75 f5                	jne    101808 <abort+0x18>
  101813:	c6 01 3a             	movb   $0x3a,(%ecx)
  101816:	bb bd 3c 10 00       	mov    $0x103cbd,%ebx
  10181b:	be 0a 00 00 00       	mov    $0xa,%esi
  101820:	bf 67 66 66 66       	mov    $0x66666667,%edi
  101825:	4b                   	dec    %ebx
  101826:	8b 45 0c             	mov    0xc(%ebp),%eax
  101829:	99                   	cltd   
  10182a:	f7 fe                	idiv   %esi
  10182c:	8d 42 30             	lea    0x30(%edx),%eax
  10182f:	88 45 e7             	mov    %al,-0x19(%ebp)
  101832:	88 03                	mov    %al,(%ebx)
  101834:	89 f8                	mov    %edi,%eax
  101836:	f7 6d 0c             	imull  0xc(%ebp)
  101839:	c1 fa 02             	sar    $0x2,%edx
  10183c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10183f:	c1 f8 1f             	sar    $0x1f,%eax
  101842:	29 c2                	sub    %eax,%edx
  101844:	89 55 0c             	mov    %edx,0xc(%ebp)
  101847:	75 dc                	jne    101825 <abort+0x35>
  101849:	41                   	inc    %ecx
  10184a:	41                   	inc    %ecx
  10184b:	43                   	inc    %ebx
  10184c:	8a 45 e7             	mov    -0x19(%ebp),%al
  10184f:	88 41 ff             	mov    %al,-0x1(%ecx)
  101852:	8a 03                	mov    (%ebx),%al
  101854:	88 45 e7             	mov    %al,-0x19(%ebp)
  101857:	84 c0                	test   %al,%al
  101859:	75 ef                	jne    10184a <abort+0x5a>
  10185b:	c6 01 0a             	movb   $0xa,(%ecx)
  10185e:	0f be 05 40 33 10 00 	movsbl 0x103340,%eax
  101865:	84 c0                	test   %al,%al
  101867:	74 1b                	je     101884 <abort+0x94>
  101869:	bb 40 33 10 00       	mov    $0x103340,%ebx
  10186e:	83 ec 0c             	sub    $0xc,%esp
  101871:	50                   	push   %eax
  101872:	e8 99 f0 ff ff       	call   100910 <putChar>
  101877:	43                   	inc    %ebx
  101878:	0f be 03             	movsbl (%ebx),%eax
  10187b:	83 c4 10             	add    $0x10,%esp
  10187e:	84 c0                	test   %al,%al
  101880:	75 ec                	jne    10186e <abort+0x7e>
  101882:	66 90                	xchg   %ax,%ax
  101884:	f4                   	hlt    
  101885:	eb fd                	jmp    101884 <abort+0x94>

00101887 <irqEmpty>:
  101887:	6a 00                	push   $0x0
  101889:	6a ff                	push   $0xffffffff
  10188b:	eb 13                	jmp    1018a0 <asmDoIrq>

0010188d <irqGProtectFault>:
  10188d:	6a 0d                	push   $0xd
  10188f:	eb 0f                	jmp    1018a0 <asmDoIrq>

00101891 <irqSyscall>:
  101891:	6a 00                	push   $0x0
  101893:	68 80 00 00 00       	push   $0x80
  101898:	eb 06                	jmp    1018a0 <asmDoIrq>

0010189a <irqTime>:
  10189a:	6a 00                	push   $0x0
  10189c:	6a 20                	push   $0x20
  10189e:	eb 00                	jmp    1018a0 <asmDoIrq>

001018a0 <asmDoIrq>:
  1018a0:	60                   	pusha  
  1018a1:	1e                   	push   %ds
  1018a2:	06                   	push   %es
  1018a3:	0f a0                	push   %fs
  1018a5:	0f a8                	push   %gs
  1018a7:	54                   	push   %esp
  1018a8:	e8 a7 fa ff ff       	call   101354 <irqHandle>
  1018ad:	5c                   	pop    %esp
  1018ae:	0f a9                	pop    %gs
  1018b0:	0f a1                	pop    %fs
  1018b2:	07                   	pop    %es
  1018b3:	1f                   	pop    %ds
  1018b4:	61                   	popa   
  1018b5:	83 c4 04             	add    $0x4,%esp
  1018b8:	83 c4 04             	add    $0x4,%esp
  1018bb:	cf                   	iret   
