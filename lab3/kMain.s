
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 89 13 00 00       	call   101394 <initTimer>
  10000b:	e8 28 0e 00 00       	call   100e38 <init_pcb>
  100010:	e8 6f 0e 00 00       	call   100e84 <init_kernel_pcb>
  100015:	e8 36 08 00 00       	call   100850 <initSerial>
  10001a:	e8 45 0f 00 00       	call   100f64 <initIdt>
  10001f:	e8 18 13 00 00       	call   10133c <initIntr>
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
  10005f:	66 c7 05 e0 69 13 01 	movw   $0xffff,0x11369e0
  100066:	ff ff 
  100068:	66 a3 e2 69 13 01    	mov    %ax,0x11369e2
  10006e:	89 c2                	mov    %eax,%edx
  100070:	c1 ea 10             	shr    $0x10,%edx
  100073:	88 15 e4 69 13 01    	mov    %dl,0x11369e4
  100079:	c6 05 e5 69 13 01 f2 	movb   $0xf2,0x11369e5
  100080:	c6 05 e6 69 13 01 cf 	movb   $0xcf,0x11369e6
  100087:	c1 e8 18             	shr    $0x18,%eax
  10008a:	a2 e7 69 13 01       	mov    %al,0x11369e7
  10008f:	66 c7 05 20 21 10 00 	movw   $0x4f,0x102120
  100096:	4f 00 
  100098:	b8 c0 69 13 01       	mov    $0x11369c0,%eax
  10009d:	66 a3 22 21 10 00    	mov    %ax,0x102122
  1000a3:	c1 e8 10             	shr    $0x10,%eax
  1000a6:	66 a3 24 21 10 00    	mov    %ax,0x102124
  1000ac:	b8 20 21 10 00       	mov    $0x102120,%eax
  1000b1:	0f 01 10             	lgdtl  (%eax)
  1000b4:	b8 01 00 00 00       	mov    $0x1,%eax
  1000b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000bc:	c9                   	leave  
  1000bd:	c3                   	ret    
  1000be:	66 90                	xchg   %ax,%ax
  1000c0:	66 c7 05 d8 69 13 01 	movw   $0xffff,0x11369d8
  1000c7:	ff ff 
  1000c9:	66 a3 da 69 13 01    	mov    %ax,0x11369da
  1000cf:	89 c2                	mov    %eax,%edx
  1000d1:	c1 ea 10             	shr    $0x10,%edx
  1000d4:	88 15 dc 69 13 01    	mov    %dl,0x11369dc
  1000da:	c6 05 dd 69 13 01 fa 	movb   $0xfa,0x11369dd
  1000e1:	c6 05 de 69 13 01 cf 	movb   $0xcf,0x11369de
  1000e8:	c1 e8 18             	shr    $0x18,%eax
  1000eb:	a2 df 69 13 01       	mov    %al,0x11369df
  1000f0:	eb 9d                	jmp    10008f <change_gdt+0x5b>
  1000f2:	66 90                	xchg   %ax,%ax
  1000f4:	83 fb 01             	cmp    $0x1,%ebx
  1000f7:	75 37                	jne    100130 <change_gdt+0xfc>
  1000f9:	66 c7 05 c8 69 13 01 	movw   $0xffff,0x11369c8
  100100:	ff ff 
  100102:	66 a3 ca 69 13 01    	mov    %ax,0x11369ca
  100108:	89 c2                	mov    %eax,%edx
  10010a:	c1 ea 10             	shr    $0x10,%edx
  10010d:	88 15 cc 69 13 01    	mov    %dl,0x11369cc
  100113:	c6 05 cd 69 13 01 9a 	movb   $0x9a,0x11369cd
  10011a:	c6 05 ce 69 13 01 cf 	movb   $0xcf,0x11369ce
  100121:	c1 e8 18             	shr    $0x18,%eax
  100124:	a2 cf 69 13 01       	mov    %al,0x11369cf
  100129:	e9 61 ff ff ff       	jmp    10008f <change_gdt+0x5b>
  10012e:	66 90                	xchg   %ax,%ax
  100130:	83 ec 0c             	sub    $0xc,%esp
  100133:	68 fc 16 10 00       	push   $0x1016fc
  100138:	e8 7f 13 00 00       	call   1014bc <printk>
  10013d:	89 1c 24             	mov    %ebx,(%esp)
  100140:	68 3c 17 10 00       	push   $0x10173c
  100145:	6a 17                	push   $0x17
  100147:	68 02 17 10 00       	push   $0x101702
  10014c:	68 0f 17 10 00       	push   $0x10170f
  100151:	e8 66 13 00 00       	call   1014bc <printk>
  100156:	83 c4 14             	add    $0x14,%esp
  100159:	68 2b 17 10 00       	push   $0x10172b
  10015e:	e8 59 13 00 00       	call   1014bc <printk>
  100163:	58                   	pop    %eax
  100164:	5a                   	pop    %edx
  100165:	6a 18                	push   $0x18
  100167:	68 02 17 10 00       	push   $0x101702
  10016c:	e8 bf 14 00 00       	call   101630 <abort>
  100171:	83 c4 10             	add    $0x10,%esp
  100174:	e9 16 ff ff ff       	jmp    10008f <change_gdt+0x5b>
  100179:	8d 76 00             	lea    0x0(%esi),%esi
  10017c:	66 c7 05 d0 69 13 01 	movw   $0xffff,0x11369d0
  100183:	ff ff 
  100185:	66 a3 d2 69 13 01    	mov    %ax,0x11369d2
  10018b:	89 c2                	mov    %eax,%edx
  10018d:	c1 ea 10             	shr    $0x10,%edx
  100190:	88 15 d4 69 13 01    	mov    %dl,0x11369d4
  100196:	c6 05 d5 69 13 01 92 	movb   $0x92,0x11369d5
  10019d:	c6 05 d6 69 13 01 cf 	movb   $0xcf,0x11369d6
  1001a4:	c1 e8 18             	shr    $0x18,%eax
  1001a7:	a2 d7 69 13 01       	mov    %al,0x11369d7
  1001ac:	e9 de fe ff ff       	jmp    10008f <change_gdt+0x5b>
  1001b1:	8d 76 00             	lea    0x0(%esi),%esi

001001b4 <change_tss>:
  1001b4:	55                   	push   %ebp
  1001b5:	89 e5                	mov    %esp,%ebp
  1001b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1001ba:	a3 28 6a 13 01       	mov    %eax,0x1136a28
  1001bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1001c2:	a3 24 6a 13 01       	mov    %eax,0x1136a24
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
  1001d8:	be 20 6a 13 01       	mov    $0x1136a20,%esi
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
  10027b:	b9 c0 69 13 01       	mov    $0x11369c0,%ecx
  100280:	66 c7 05 c8 69 13 01 	movw   $0xffff,0x11369c8
  100287:	ff ff 
  100289:	66 c7 05 ca 69 13 01 	movw   $0x0,0x11369ca
  100290:	00 00 
  100292:	c6 05 cc 69 13 01 00 	movb   $0x0,0x11369cc
  100299:	c6 05 cd 69 13 01 9a 	movb   $0x9a,0x11369cd
  1002a0:	c6 05 ce 69 13 01 cf 	movb   $0xcf,0x11369ce
  1002a7:	c6 05 cf 69 13 01 00 	movb   $0x0,0x11369cf
  1002ae:	66 c7 05 d0 69 13 01 	movw   $0xffff,0x11369d0
  1002b5:	ff ff 
  1002b7:	66 c7 05 d2 69 13 01 	movw   $0x0,0x11369d2
  1002be:	00 00 
  1002c0:	c6 05 d4 69 13 01 00 	movb   $0x0,0x11369d4
  1002c7:	c6 05 d5 69 13 01 92 	movb   $0x92,0x11369d5
  1002ce:	c6 05 d6 69 13 01 cf 	movb   $0xcf,0x11369d6
  1002d5:	c6 05 d7 69 13 01 00 	movb   $0x0,0x11369d7
  1002dc:	66 c7 05 d8 69 13 01 	movw   $0xffff,0x11369d8
  1002e3:	ff ff 
  1002e5:	66 c7 05 da 69 13 01 	movw   $0x0,0x11369da
  1002ec:	00 00 
  1002ee:	c6 05 dc 69 13 01 00 	movb   $0x0,0x11369dc
  1002f5:	c6 05 dd 69 13 01 fa 	movb   $0xfa,0x11369dd
  1002fc:	c6 05 de 69 13 01 cf 	movb   $0xcf,0x11369de
  100303:	c6 05 df 69 13 01 00 	movb   $0x0,0x11369df
  10030a:	66 c7 05 e0 69 13 01 	movw   $0xffff,0x11369e0
  100311:	ff ff 
  100313:	66 c7 05 e2 69 13 01 	movw   $0x0,0x11369e2
  10031a:	00 00 
  10031c:	c6 05 e4 69 13 01 00 	movb   $0x0,0x11369e4
  100323:	c6 05 e5 69 13 01 f2 	movb   $0xf2,0x11369e5
  10032a:	c6 05 e6 69 13 01 cf 	movb   $0xcf,0x11369e6
  100331:	c6 05 e7 69 13 01 00 	movb   $0x0,0x11369e7
  100338:	66 c7 05 e8 69 13 01 	movw   $0x63,0x11369e8
  10033f:	63 00 
  100341:	b8 20 6a 13 01       	mov    $0x1136a20,%eax
  100346:	66 a3 ea 69 13 01    	mov    %ax,0x11369ea
  10034c:	89 c2                	mov    %eax,%edx
  10034e:	c1 ea 10             	shr    $0x10,%edx
  100351:	88 15 ec 69 13 01    	mov    %dl,0x11369ec
  100357:	c6 05 ed 69 13 01 89 	movb   $0x89,0x11369ed
  10035e:	c6 05 ee 69 13 01 40 	movb   $0x40,0x11369ee
  100365:	c1 e8 18             	shr    $0x18,%eax
  100368:	a2 ef 69 13 01       	mov    %al,0x11369ef
  10036d:	a1 34 17 10 00       	mov    0x101734,%eax
  100372:	8b 15 38 17 10 00    	mov    0x101738,%edx
  100378:	a3 f0 69 13 01       	mov    %eax,0x11369f0
  10037d:	89 15 f4 69 13 01    	mov    %edx,0x11369f4
  100383:	66 c7 05 00 6a 13 01 	movw   $0xffff,0x1136a00
  10038a:	ff ff 
  10038c:	66 c7 05 02 6a 13 01 	movw   $0x0,0x1136a02
  100393:	00 00 
  100395:	c6 05 04 6a 13 01 00 	movb   $0x0,0x1136a04
  10039c:	c6 05 05 6a 13 01 f2 	movb   $0xf2,0x1136a05
  1003a3:	c6 05 06 6a 13 01 cf 	movb   $0xcf,0x1136a06
  1003aa:	c6 05 07 6a 13 01 00 	movb   $0x0,0x1136a07
  1003b1:	66 c7 05 20 21 10 00 	movw   $0x4f,0x102120
  1003b8:	4f 00 
  1003ba:	66 89 0d 22 21 10 00 	mov    %cx,0x102122
  1003c1:	c1 e9 10             	shr    $0x10,%ecx
  1003c4:	66 89 0d 24 21 10 00 	mov    %cx,0x102124
  1003cb:	b8 20 21 10 00       	mov    $0x102120,%eax
  1003d0:	0f 01 10             	lgdtl  (%eax)
  1003d3:	a1 08 4a 10 00       	mov    0x104a08,%eax
  1003d8:	a3 28 6a 13 01       	mov    %eax,0x1136a28
  1003dd:	c7 05 24 6a 13 01 bc 	movl   $0x1049bc,0x1136a24
  1003e4:	49 10 00 
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
  100431:	8d 04 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%eax
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
  100460:	c7 05 a4 29 10 00 01 	movl   $0x1,0x1029a4
  100467:	00 00 00 
  10046a:	e8 0d 08 00 00       	call   100c7c <apply_new_pid>
  10046f:	89 c6                	mov    %eax,%esi
  100471:	48                   	dec    %eax
  100472:	74 15                	je     100489 <enterUserSpace+0x31>
  100474:	83 ec 08             	sub    $0x8,%esp
  100477:	68 87 00 00 00       	push   $0x87
  10047c:	68 02 17 10 00       	push   $0x101702
  100481:	e8 aa 11 00 00       	call   101630 <abort>
  100486:	83 c4 10             	add    $0x10,%esp
  100489:	89 f0                	mov    %esi,%eax
  10048b:	c1 e0 07             	shl    $0x7,%eax
  10048e:	01 f0                	add    %esi,%eax
  100490:	01 c0                	add    %eax,%eax
  100492:	01 f0                	add    %esi,%eax
  100494:	8d 14 86             	lea    (%esi,%eax,4),%edx
  100497:	c1 e2 03             	shl    $0x3,%edx
  10049a:	c7 82 08 4a 10 00 23 	movl   $0x23,0x104a08(%edx)
  1004a1:	00 00 00 
  1004a4:	c7 82 fc 49 10 00 1b 	movl   $0x1b,0x1049fc(%edx)
  1004ab:	00 00 00 
  1004ae:	c7 82 cc 49 10 00 23 	movl   $0x23,0x1049cc(%edx)
  1004b5:	00 00 00 
  1004b8:	c7 82 c8 49 10 00 23 	movl   $0x23,0x1049c8(%edx)
  1004bf:	00 00 00 
  1004c2:	c7 82 c4 49 10 00 23 	movl   $0x23,0x1049c4(%edx)
  1004c9:	00 00 00 
  1004cc:	c7 82 04 4a 10 00 00 	movl   $0x400000,0x104a04(%edx)
  1004d3:	00 40 00 
  1004d6:	89 9a f8 49 10 00    	mov    %ebx,0x1049f8(%edx)
  1004dc:	c7 82 10 4a 10 00 0a 	movl   $0xa,0x104a10(%edx)
  1004e3:	00 00 00 
  1004e6:	83 ec 08             	sub    $0x8,%esp
  1004e9:	81 c2 c0 49 10 00    	add    $0x1049c0,%edx
  1004ef:	52                   	push   %edx
  1004f0:	56                   	push   %esi
  1004f1:	e8 3e 05 00 00       	call   100a34 <put_into_runnable>
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
  1005b8:	40                   	inc    %eax
  1005b9:	3d 00 00 01 00       	cmp    $0x10000,%eax
  1005be:	75 ec                	jne    1005ac <loadUMain+0xa0>
  1005c0:	83 ec 0c             	sub    $0xc,%esp
  1005c3:	ff 35 18 00 03 00    	pushl  0x30018
  1005c9:	e8 8a fe ff ff       	call   100458 <enterUserSpace>
  1005ce:	83 c4 10             	add    $0x10,%esp
  1005d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1005d4:	5b                   	pop    %ebx
  1005d5:	5e                   	pop    %esi
  1005d6:	5f                   	pop    %edi
  1005d7:	5d                   	pop    %ebp
  1005d8:	c3                   	ret    
  1005d9:	66 90                	xchg   %ax,%ax
  1005db:	90                   	nop

001005dc <sys_exit>:
  1005dc:	55                   	push   %ebp
  1005dd:	89 e5                	mov    %esp,%ebp
  1005df:	83 ec 08             	sub    $0x8,%esp
  1005e2:	e8 11 03 00 00       	call   1008f8 <getpid>
  1005e7:	83 ec 0c             	sub    $0xc,%esp
  1005ea:	50                   	push   %eax
  1005eb:	e8 30 04 00 00       	call   100a20 <put_into_empty>
  1005f0:	e8 9b 06 00 00       	call   100c90 <get_from_runnable>
  1005f5:	5a                   	pop    %edx
  1005f6:	59                   	pop    %ecx
  1005f7:	ff 75 08             	pushl  0x8(%ebp)
  1005fa:	50                   	push   %eax
  1005fb:	e8 b4 02 00 00       	call   1008b4 <put_into_running>
  100600:	b8 01 00 00 00       	mov    $0x1,%eax
  100605:	c9                   	leave  
  100606:	c3                   	ret    
  100607:	90                   	nop

00100608 <sys_getpid>:
  100608:	55                   	push   %ebp
  100609:	89 e5                	mov    %esp,%ebp
  10060b:	5d                   	pop    %ebp
  10060c:	e9 e7 02 00 00       	jmp    1008f8 <getpid>
  100611:	66 90                	xchg   %ax,%ax
  100613:	90                   	nop

00100614 <sys_sleep>:
  100614:	55                   	push   %ebp
  100615:	89 e5                	mov    %esp,%ebp
  100617:	53                   	push   %ebx
  100618:	50                   	push   %eax
  100619:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10061c:	e8 d7 02 00 00       	call   1008f8 <getpid>
  100621:	83 ec 08             	sub    $0x8,%esp
  100624:	53                   	push   %ebx
  100625:	50                   	push   %eax
  100626:	e8 5d 04 00 00       	call   100a88 <put_into_block>
  10062b:	e8 60 06 00 00       	call   100c90 <get_from_runnable>
  100630:	5a                   	pop    %edx
  100631:	59                   	pop    %ecx
  100632:	53                   	push   %ebx
  100633:	50                   	push   %eax
  100634:	e8 7b 02 00 00       	call   1008b4 <put_into_running>
  100639:	b8 01 00 00 00       	mov    $0x1,%eax
  10063e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100641:	c9                   	leave  
  100642:	c3                   	ret    
  100643:	90                   	nop

00100644 <sys_fork>:
  100644:	55                   	push   %ebp
  100645:	89 e5                	mov    %esp,%ebp
  100647:	57                   	push   %edi
  100648:	56                   	push   %esi
  100649:	53                   	push   %ebx
  10064a:	83 ec 1c             	sub    $0x1c,%esp
  10064d:	8b 75 08             	mov    0x8(%ebp),%esi
  100650:	e8 27 06 00 00       	call   100c7c <apply_new_pid>
  100655:	89 c3                	mov    %eax,%ebx
  100657:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10065a:	c1 e0 07             	shl    $0x7,%eax
  10065d:	01 d8                	add    %ebx,%eax
  10065f:	01 c0                	add    %eax,%eax
  100661:	01 d8                	add    %ebx,%eax
  100663:	8d 1c 83             	lea    (%ebx,%eax,4),%ebx
  100666:	c1 e3 03             	shl    $0x3,%ebx
  100669:	31 ff                	xor    %edi,%edi
  10066b:	90                   	nop
  10066c:	e8 87 02 00 00       	call   1008f8 <getpid>
  100671:	89 c2                	mov    %eax,%edx
  100673:	c1 e2 07             	shl    $0x7,%edx
  100676:	01 c2                	add    %eax,%edx
  100678:	01 d2                	add    %edx,%edx
  10067a:	01 c2                	add    %eax,%edx
  10067c:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10067f:	01 c0                	add    %eax,%eax
  100681:	01 f8                	add    %edi,%eax
  100683:	8b 04 85 c0 29 10 00 	mov    0x1029c0(,%eax,4),%eax
  10068a:	89 84 bb c0 29 10 00 	mov    %eax,0x1029c0(%ebx,%edi,4)
  100691:	47                   	inc    %edi
  100692:	81 ff 00 08 00 00    	cmp    $0x800,%edi
  100698:	75 d2                	jne    10066c <sys_fork+0x28>
  10069a:	e8 59 02 00 00       	call   1008f8 <getpid>
  10069f:	8d 50 40             	lea    0x40(%eax),%edx
  1006a2:	c1 e2 10             	shl    $0x10,%edx
  1006a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a8:	8d 58 40             	lea    0x40(%eax),%ebx
  1006ab:	c1 e3 10             	shl    $0x10,%ebx
  1006ae:	b8 00 00 01 00       	mov    $0x10000,%eax
  1006b3:	90                   	nop
  1006b4:	8a 8c 10 00 00 ff ff 	mov    -0x10000(%eax,%edx,1),%cl
  1006bb:	88 8c 18 00 00 ff ff 	mov    %cl,-0x10000(%eax,%ebx,1)
  1006c2:	48                   	dec    %eax
  1006c3:	75 ef                	jne    1006b4 <sys_fork+0x70>
  1006c5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1006c8:	89 c8                	mov    %ecx,%eax
  1006ca:	c1 e0 07             	shl    $0x7,%eax
  1006cd:	01 c8                	add    %ecx,%eax
  1006cf:	01 c0                	add    %eax,%eax
  1006d1:	01 c8                	add    %ecx,%eax
  1006d3:	8d 14 81             	lea    (%ecx,%eax,4),%edx
  1006d6:	c1 e2 03             	shl    $0x3,%edx
  1006d9:	8d 82 c0 49 10 00    	lea    0x1049c0(%edx),%eax
  1006df:	b9 13 00 00 00       	mov    $0x13,%ecx
  1006e4:	89 c7                	mov    %eax,%edi
  1006e6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1006e8:	c7 82 ec 49 10 00 00 	movl   $0x0,0x1049ec(%edx)
  1006ef:	00 00 00 
  1006f2:	e8 01 02 00 00       	call   1008f8 <getpid>
  1006f7:	8d 50 20             	lea    0x20(%eax),%edx
  1006fa:	c1 e2 10             	shl    $0x10,%edx
  1006fd:	81 eb 00 00 20 00    	sub    $0x200000,%ebx
  100703:	31 c0                	xor    %eax,%eax
  100705:	8d 76 00             	lea    0x0(%esi),%esi
  100708:	8a 0c 10             	mov    (%eax,%edx,1),%cl
  10070b:	88 0c 18             	mov    %cl,(%eax,%ebx,1)
  10070e:	40                   	inc    %eax
  10070f:	3d 00 00 01 00       	cmp    $0x10000,%eax
  100714:	75 f2                	jne    100708 <sys_fork+0xc4>
  100716:	83 ec 08             	sub    $0x8,%esp
  100719:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  10071c:	89 f0                	mov    %esi,%eax
  10071e:	c1 e0 07             	shl    $0x7,%eax
  100721:	01 f0                	add    %esi,%eax
  100723:	01 c0                	add    %eax,%eax
  100725:	01 f0                	add    %esi,%eax
  100727:	8d 04 86             	lea    (%esi,%eax,4),%eax
  10072a:	8d 04 c5 c0 49 10 00 	lea    0x1049c0(,%eax,8),%eax
  100731:	50                   	push   %eax
  100732:	56                   	push   %esi
  100733:	e8 fc 02 00 00       	call   100a34 <put_into_runnable>
  100738:	89 f0                	mov    %esi,%eax
  10073a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10073d:	5b                   	pop    %ebx
  10073e:	5e                   	pop    %esi
  10073f:	5f                   	pop    %edi
  100740:	5d                   	pop    %ebp
  100741:	c3                   	ret    
  100742:	66 90                	xchg   %ax,%ax

00100744 <printkernel>:
  100744:	55                   	push   %ebp
  100745:	89 e5                	mov    %esp,%ebp
  100747:	57                   	push   %edi
  100748:	56                   	push   %esi
  100749:	53                   	push   %ebx
  10074a:	83 ec 08             	sub    $0x8,%esp
  10074d:	8b 55 08             	mov    0x8(%ebp),%edx
  100750:	8b 75 0c             	mov    0xc(%ebp),%esi
  100753:	85 f6                	test   %esi,%esi
  100755:	7e 6a                	jle    1007c1 <printkernel+0x7d>
  100757:	0f be 02             	movsbl (%edx),%eax
  10075a:	84 c0                	test   %al,%al
  10075c:	74 63                	je     1007c1 <printkernel+0x7d>
  10075e:	8b 0d 28 21 10 00    	mov    0x102128,%ecx
  100764:	8b 1d 2c 21 10 00    	mov    0x10212c,%ebx
  10076a:	8d 3c 32             	lea    (%edx,%esi,1),%edi
  10076d:	89 7d f0             	mov    %edi,-0x10(%ebp)
  100770:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
  100774:	eb 2e                	jmp    1007a4 <printkernel+0x60>
  100776:	66 90                	xchg   %ax,%ax
  100778:	8d 34 9b             	lea    (%ebx,%ebx,4),%esi
  10077b:	c1 e6 04             	shl    $0x4,%esi
  10077e:	01 ce                	add    %ecx,%esi
  100780:	01 f6                	add    %esi,%esi
  100782:	89 f7                	mov    %esi,%edi
  100784:	8d b0 00 0c 00 00    	lea    0xc00(%eax),%esi
  10078a:	66 89 f0             	mov    %si,%ax
  10078d:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100791:	41                   	inc    %ecx
  100792:	83 f9 50             	cmp    $0x50,%ecx
  100795:	74 11                	je     1007a8 <printkernel+0x64>
  100797:	42                   	inc    %edx
  100798:	39 55 f0             	cmp    %edx,-0x10(%ebp)
  10079b:	74 18                	je     1007b5 <printkernel+0x71>
  10079d:	0f be 02             	movsbl (%edx),%eax
  1007a0:	84 c0                	test   %al,%al
  1007a2:	74 11                	je     1007b5 <printkernel+0x71>
  1007a4:	3c 0a                	cmp    $0xa,%al
  1007a6:	75 d0                	jne    100778 <printkernel+0x34>
  1007a8:	43                   	inc    %ebx
  1007a9:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
  1007ad:	31 c9                	xor    %ecx,%ecx
  1007af:	42                   	inc    %edx
  1007b0:	39 55 f0             	cmp    %edx,-0x10(%ebp)
  1007b3:	75 e8                	jne    10079d <printkernel+0x59>
  1007b5:	89 0d 28 21 10 00    	mov    %ecx,0x102128
  1007bb:	80 7d ef 00          	cmpb   $0x0,-0x11(%ebp)
  1007bf:	75 0d                	jne    1007ce <printkernel+0x8a>
  1007c1:	b8 01 00 00 00       	mov    $0x1,%eax
  1007c6:	83 c4 08             	add    $0x8,%esp
  1007c9:	5b                   	pop    %ebx
  1007ca:	5e                   	pop    %esi
  1007cb:	5f                   	pop    %edi
  1007cc:	5d                   	pop    %ebp
  1007cd:	c3                   	ret    
  1007ce:	89 1d 2c 21 10 00    	mov    %ebx,0x10212c
  1007d4:	eb eb                	jmp    1007c1 <printkernel+0x7d>
  1007d6:	66 90                	xchg   %ax,%ax

001007d8 <sys_write>:
  1007d8:	55                   	push   %ebp
  1007d9:	89 e5                	mov    %esp,%ebp
  1007db:	56                   	push   %esi
  1007dc:	53                   	push   %ebx
  1007dd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1007e0:	ba 30 00 00 00       	mov    $0x30,%edx
  1007e5:	89 d0                	mov    %edx,%eax
  1007e7:	8e e8                	mov    %eax,%gs
  1007e9:	8b 43 20             	mov    0x20(%ebx),%eax
  1007ec:	48                   	dec    %eax
  1007ed:	83 f8 01             	cmp    $0x1,%eax
  1007f0:	76 12                	jbe    100804 <sys_write+0x2c>
  1007f2:	83 ec 08             	sub    $0x8,%esp
  1007f5:	6a 23                	push   $0x23
  1007f7:	68 47 17 10 00       	push   $0x101747
  1007fc:	e8 2f 0e 00 00       	call   101630 <abort>
  100801:	83 c4 10             	add    $0x10,%esp
  100804:	8b 73 24             	mov    0x24(%ebx),%esi
  100807:	e8 ec 00 00 00       	call   1008f8 <getpid>
  10080c:	83 ec 08             	sub    $0x8,%esp
  10080f:	56                   	push   %esi
  100810:	c1 e0 10             	shl    $0x10,%eax
  100813:	03 43 28             	add    0x28(%ebx),%eax
  100816:	50                   	push   %eax
  100817:	e8 28 ff ff ff       	call   100744 <printkernel>
  10081c:	83 c4 10             	add    $0x10,%esp
  10081f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100822:	5b                   	pop    %ebx
  100823:	5e                   	pop    %esi
  100824:	5d                   	pop    %ebp
  100825:	c3                   	ret    
  100826:	66 90                	xchg   %ax,%ax

00100828 <print_char>:
  100828:	55                   	push   %ebp
  100829:	89 e5                	mov    %esp,%ebp
  10082b:	57                   	push   %edi
  10082c:	8b 45 08             	mov    0x8(%ebp),%eax
  10082f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100832:	c1 e0 04             	shl    $0x4,%eax
  100835:	03 45 0c             	add    0xc(%ebp),%eax
  100838:	01 c0                	add    %eax,%eax
  10083a:	89 c7                	mov    %eax,%edi
  10083c:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  100840:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  100846:	66 89 d0             	mov    %dx,%ax
  100849:	65 66 89 07          	mov    %ax,%gs:(%edi)
  10084d:	5f                   	pop    %edi
  10084e:	5d                   	pop    %ebp
  10084f:	c3                   	ret    

00100850 <initSerial>:
  100850:	55                   	push   %ebp
  100851:	89 e5                	mov    %esp,%ebp
  100853:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100858:	31 c0                	xor    %eax,%eax
  10085a:	ee                   	out    %al,(%dx)
  10085b:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100860:	b0 80                	mov    $0x80,%al
  100862:	ee                   	out    %al,(%dx)
  100863:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100868:	b0 01                	mov    $0x1,%al
  10086a:	ee                   	out    %al,(%dx)
  10086b:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100870:	31 c0                	xor    %eax,%eax
  100872:	ee                   	out    %al,(%dx)
  100873:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100878:	b0 03                	mov    $0x3,%al
  10087a:	ee                   	out    %al,(%dx)
  10087b:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100880:	b0 c7                	mov    $0xc7,%al
  100882:	ee                   	out    %al,(%dx)
  100883:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100888:	b0 0b                	mov    $0xb,%al
  10088a:	ee                   	out    %al,(%dx)
  10088b:	5d                   	pop    %ebp
  10088c:	c3                   	ret    
  10088d:	8d 76 00             	lea    0x0(%esi),%esi

00100890 <putChar>:
  100890:	55                   	push   %ebp
  100891:	89 e5                	mov    %esp,%ebp
  100893:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100896:	ba fd 03 00 00       	mov    $0x3fd,%edx
  10089b:	90                   	nop
  10089c:	ec                   	in     (%dx),%al
  10089d:	a8 20                	test   $0x20,%al
  10089f:	74 fb                	je     10089c <putChar+0xc>
  1008a1:	ba f8 03 00 00       	mov    $0x3f8,%edx
  1008a6:	88 c8                	mov    %cl,%al
  1008a8:	ee                   	out    %al,(%dx)
  1008a9:	5d                   	pop    %ebp
  1008aa:	c3                   	ret    
  1008ab:	90                   	nop

001008ac <IDLE>:
  1008ac:	55                   	push   %ebp
  1008ad:	89 e5                	mov    %esp,%ebp
  1008af:	90                   	nop
  1008b0:	f4                   	hlt    
  1008b1:	eb fd                	jmp    1008b0 <IDLE+0x4>
  1008b3:	90                   	nop

001008b4 <put_into_running>:
  1008b4:	55                   	push   %ebp
  1008b5:	89 e5                	mov    %esp,%ebp
  1008b7:	83 ec 08             	sub    $0x8,%esp
  1008ba:	8b 55 08             	mov    0x8(%ebp),%edx
  1008bd:	39 15 a0 29 10 00    	cmp    %edx,0x1029a0
  1008c3:	74 29                	je     1008ee <put_into_running+0x3a>
  1008c5:	89 15 a0 29 10 00    	mov    %edx,0x1029a0
  1008cb:	83 ec 08             	sub    $0x8,%esp
  1008ce:	89 d0                	mov    %edx,%eax
  1008d0:	c1 e0 07             	shl    $0x7,%eax
  1008d3:	01 d0                	add    %edx,%eax
  1008d5:	01 c0                	add    %eax,%eax
  1008d7:	01 d0                	add    %edx,%eax
  1008d9:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1008dc:	8d 04 c5 bc 49 10 00 	lea    0x1049bc(,%eax,8),%eax
  1008e3:	50                   	push   %eax
  1008e4:	6a 10                	push   $0x10
  1008e6:	e8 c9 f8 ff ff       	call   1001b4 <change_tss>
  1008eb:	83 c4 10             	add    $0x10,%esp
  1008ee:	b8 01 00 00 00       	mov    $0x1,%eax
  1008f3:	c9                   	leave  
  1008f4:	c3                   	ret    
  1008f5:	8d 76 00             	lea    0x0(%esi),%esi

001008f8 <getpid>:
  1008f8:	55                   	push   %ebp
  1008f9:	89 e5                	mov    %esp,%ebp
  1008fb:	a1 a0 29 10 00       	mov    0x1029a0,%eax
  100900:	5d                   	pop    %ebp
  100901:	c3                   	ret    
  100902:	66 90                	xchg   %ax,%ax

00100904 <getrunnable>:
  100904:	55                   	push   %ebp
  100905:	89 e5                	mov    %esp,%ebp
  100907:	a1 04 20 10 00       	mov    0x102004,%eax
  10090c:	5d                   	pop    %ebp
  10090d:	c3                   	ret    
  10090e:	66 90                	xchg   %ax,%ax

00100910 <getblocked>:
  100910:	55                   	push   %ebp
  100911:	89 e5                	mov    %esp,%ebp
  100913:	a1 00 20 10 00       	mov    0x102000,%eax
  100918:	5d                   	pop    %ebp
  100919:	c3                   	ret    
  10091a:	66 90                	xchg   %ax,%ax

0010091c <put_into>:
  10091c:	55                   	push   %ebp
  10091d:	89 e5                	mov    %esp,%ebp
  10091f:	56                   	push   %esi
  100920:	53                   	push   %ebx
  100921:	8b 55 08             	mov    0x8(%ebp),%edx
  100924:	8b 45 0c             	mov    0xc(%ebp),%eax
  100927:	83 fa 01             	cmp    $0x1,%edx
  10092a:	0f 84 e0 00 00 00    	je     100a10 <put_into+0xf4>
  100930:	83 fa 03             	cmp    $0x3,%edx
  100933:	0f 84 97 00 00 00    	je     1009d0 <put_into+0xb4>
  100939:	85 d2                	test   %edx,%edx
  10093b:	74 1f                	je     10095c <put_into+0x40>
  10093d:	83 ec 08             	sub    $0x8,%esp
  100940:	6a 5f                	push   $0x5f
  100942:	68 63 17 10 00       	push   $0x101763
  100947:	e8 e4 0c 00 00       	call   101630 <abort>
  10094c:	83 c4 10             	add    $0x10,%esp
  10094f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100954:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100957:	5b                   	pop    %ebx
  100958:	5e                   	pop    %esi
  100959:	5d                   	pop    %ebp
  10095a:	c3                   	ret    
  10095b:	90                   	nop
  10095c:	8b 0d 00 20 10 00    	mov    0x102000,%ecx
  100962:	ba 00 20 10 00       	mov    $0x102000,%edx
  100967:	83 f9 ff             	cmp    $0xffffffff,%ecx
  10096a:	74 74                	je     1009e0 <put_into+0xc4>
  10096c:	89 ca                	mov    %ecx,%edx
  10096e:	c1 e2 07             	shl    $0x7,%edx
  100971:	01 ca                	add    %ecx,%edx
  100973:	01 d2                	add    %edx,%edx
  100975:	01 ca                	add    %ecx,%edx
  100977:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  10097a:	8d 34 d5 c0 29 10 00 	lea    0x1029c0(,%edx,8),%esi
  100981:	8b 9e 5c 20 00 00    	mov    0x205c(%esi),%ebx
  100987:	89 da                	mov    %ebx,%edx
  100989:	c1 e2 07             	shl    $0x7,%edx
  10098c:	01 da                	add    %ebx,%edx
  10098e:	01 d2                	add    %edx,%edx
  100990:	01 da                	add    %ebx,%edx
  100992:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100995:	89 04 d5 20 4a 10 00 	mov    %eax,0x104a20(,%edx,8)
  10099c:	89 c2                	mov    %eax,%edx
  10099e:	c1 e2 07             	shl    $0x7,%edx
  1009a1:	01 c2                	add    %eax,%edx
  1009a3:	01 d2                	add    %edx,%edx
  1009a5:	01 c2                	add    %eax,%edx
  1009a7:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1009aa:	8d 14 d5 c0 29 10 00 	lea    0x1029c0(,%edx,8),%edx
  1009b1:	89 9a 5c 20 00 00    	mov    %ebx,0x205c(%edx)
  1009b7:	89 8a 60 20 00 00    	mov    %ecx,0x2060(%edx)
  1009bd:	89 86 5c 20 00 00    	mov    %eax,0x205c(%esi)
  1009c3:	b8 01 00 00 00       	mov    $0x1,%eax
  1009c8:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1009cb:	5b                   	pop    %ebx
  1009cc:	5e                   	pop    %esi
  1009cd:	5d                   	pop    %ebp
  1009ce:	c3                   	ret    
  1009cf:	90                   	nop
  1009d0:	8b 0d 30 21 10 00    	mov    0x102130,%ecx
  1009d6:	ba 30 21 10 00       	mov    $0x102130,%edx
  1009db:	83 f9 ff             	cmp    $0xffffffff,%ecx
  1009de:	75 8c                	jne    10096c <put_into+0x50>
  1009e0:	89 02                	mov    %eax,(%edx)
  1009e2:	89 c2                	mov    %eax,%edx
  1009e4:	c1 e2 07             	shl    $0x7,%edx
  1009e7:	01 c2                	add    %eax,%edx
  1009e9:	01 d2                	add    %edx,%edx
  1009eb:	01 c2                	add    %eax,%edx
  1009ed:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1009f0:	8d 14 d5 c0 29 10 00 	lea    0x1029c0(,%edx,8),%edx
  1009f7:	89 82 60 20 00 00    	mov    %eax,0x2060(%edx)
  1009fd:	89 82 5c 20 00 00    	mov    %eax,0x205c(%edx)
  100a03:	b8 01 00 00 00       	mov    $0x1,%eax
  100a08:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100a0b:	5b                   	pop    %ebx
  100a0c:	5e                   	pop    %esi
  100a0d:	5d                   	pop    %ebp
  100a0e:	c3                   	ret    
  100a0f:	90                   	nop
  100a10:	8b 0d 04 20 10 00    	mov    0x102004,%ecx
  100a16:	ba 04 20 10 00       	mov    $0x102004,%edx
  100a1b:	e9 47 ff ff ff       	jmp    100967 <put_into+0x4b>

00100a20 <put_into_empty>:
  100a20:	55                   	push   %ebp
  100a21:	89 e5                	mov    %esp,%ebp
  100a23:	83 ec 10             	sub    $0x10,%esp
  100a26:	ff 75 08             	pushl  0x8(%ebp)
  100a29:	6a 03                	push   $0x3
  100a2b:	e8 ec fe ff ff       	call   10091c <put_into>
  100a30:	c9                   	leave  
  100a31:	c3                   	ret    
  100a32:	66 90                	xchg   %ax,%ax

00100a34 <put_into_runnable>:
  100a34:	55                   	push   %ebp
  100a35:	89 e5                	mov    %esp,%ebp
  100a37:	57                   	push   %edi
  100a38:	56                   	push   %esi
  100a39:	53                   	push   %ebx
  100a3a:	8b 55 08             	mov    0x8(%ebp),%edx
  100a3d:	8b 75 0c             	mov    0xc(%ebp),%esi
  100a40:	89 d0                	mov    %edx,%eax
  100a42:	c1 e0 07             	shl    $0x7,%eax
  100a45:	01 d0                	add    %edx,%eax
  100a47:	01 c0                	add    %eax,%eax
  100a49:	01 d0                	add    %edx,%eax
  100a4b:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
  100a4e:	c1 e3 03             	shl    $0x3,%ebx
  100a51:	8d 83 c0 49 10 00    	lea    0x1049c0(%ebx),%eax
  100a57:	b9 13 00 00 00       	mov    $0x13,%ecx
  100a5c:	89 c7                	mov    %eax,%edi
  100a5e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100a60:	a1 a8 29 10 00       	mov    0x1029a8,%eax
  100a65:	89 83 10 4a 10 00    	mov    %eax,0x104a10(%ebx)
  100a6b:	c7 83 0c 4a 10 00 01 	movl   $0x1,0x104a0c(%ebx)
  100a72:	00 00 00 
  100a75:	89 55 0c             	mov    %edx,0xc(%ebp)
  100a78:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
  100a7f:	5b                   	pop    %ebx
  100a80:	5e                   	pop    %esi
  100a81:	5f                   	pop    %edi
  100a82:	5d                   	pop    %ebp
  100a83:	e9 94 fe ff ff       	jmp    10091c <put_into>

00100a88 <put_into_block>:
  100a88:	55                   	push   %ebp
  100a89:	89 e5                	mov    %esp,%ebp
  100a8b:	57                   	push   %edi
  100a8c:	56                   	push   %esi
  100a8d:	53                   	push   %ebx
  100a8e:	8b 55 08             	mov    0x8(%ebp),%edx
  100a91:	89 d0                	mov    %edx,%eax
  100a93:	c1 e0 07             	shl    $0x7,%eax
  100a96:	01 d0                	add    %edx,%eax
  100a98:	01 c0                	add    %eax,%eax
  100a9a:	01 d0                	add    %edx,%eax
  100a9c:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
  100a9f:	c1 e3 03             	shl    $0x3,%ebx
  100aa2:	8d 83 c0 49 10 00    	lea    0x1049c0(%ebx),%eax
  100aa8:	b9 13 00 00 00       	mov    $0x13,%ecx
  100aad:	89 c7                	mov    %eax,%edi
  100aaf:	8b 75 0c             	mov    0xc(%ebp),%esi
  100ab2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100ab4:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ab7:	8b 40 20             	mov    0x20(%eax),%eax
  100aba:	89 83 14 4a 10 00    	mov    %eax,0x104a14(%ebx)
  100ac0:	c7 83 0c 4a 10 00 00 	movl   $0x0,0x104a0c(%ebx)
  100ac7:	00 00 00 
  100aca:	89 55 0c             	mov    %edx,0xc(%ebp)
  100acd:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  100ad4:	5b                   	pop    %ebx
  100ad5:	5e                   	pop    %esi
  100ad6:	5f                   	pop    %edi
  100ad7:	5d                   	pop    %ebp
  100ad8:	e9 3f fe ff ff       	jmp    10091c <put_into>
  100add:	8d 76 00             	lea    0x0(%esi),%esi

00100ae0 <get_from>:
  100ae0:	55                   	push   %ebp
  100ae1:	89 e5                	mov    %esp,%ebp
  100ae3:	56                   	push   %esi
  100ae4:	53                   	push   %ebx
  100ae5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100ae8:	8b 75 0c             	mov    0xc(%ebp),%esi
  100aeb:	39 f3                	cmp    %esi,%ebx
  100aed:	74 42                	je     100b31 <get_from+0x51>
  100aef:	89 d8                	mov    %ebx,%eax
  100af1:	c1 e0 07             	shl    $0x7,%eax
  100af4:	01 d8                	add    %ebx,%eax
  100af6:	01 c0                	add    %eax,%eax
  100af8:	01 d8                	add    %ebx,%eax
  100afa:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100afd:	8b 0c c5 20 4a 10 00 	mov    0x104a20(,%eax,8),%ecx
  100b04:	39 cb                	cmp    %ecx,%ebx
  100b06:	75 25                	jne    100b2d <get_from+0x4d>
  100b08:	e9 f3 00 00 00       	jmp    100c00 <get_from+0x120>
  100b0d:	8d 76 00             	lea    0x0(%esi),%esi
  100b10:	89 ca                	mov    %ecx,%edx
  100b12:	c1 e2 07             	shl    $0x7,%edx
  100b15:	01 ca                	add    %ecx,%edx
  100b17:	01 d2                	add    %edx,%edx
  100b19:	01 ca                	add    %ecx,%edx
  100b1b:	8d 04 91             	lea    (%ecx,%edx,4),%eax
  100b1e:	8b 0c c5 20 4a 10 00 	mov    0x104a20(,%eax,8),%ecx
  100b25:	39 cb                	cmp    %ecx,%ebx
  100b27:	0f 84 d3 00 00 00    	je     100c00 <get_from+0x120>
  100b2d:	39 ce                	cmp    %ecx,%esi
  100b2f:	75 df                	jne    100b10 <get_from+0x30>
  100b31:	89 f0                	mov    %esi,%eax
  100b33:	c1 e0 07             	shl    $0x7,%eax
  100b36:	01 f0                	add    %esi,%eax
  100b38:	01 c0                	add    %eax,%eax
  100b3a:	01 f0                	add    %esi,%eax
  100b3c:	8d 04 86             	lea    (%esi,%eax,4),%eax
  100b3f:	8b 04 c5 0c 4a 10 00 	mov    0x104a0c(,%eax,8),%eax
  100b46:	83 f8 01             	cmp    $0x1,%eax
  100b49:	0f 84 11 01 00 00    	je     100c60 <get_from+0x180>
  100b4f:	83 f8 03             	cmp    $0x3,%eax
  100b52:	74 24                	je     100b78 <get_from+0x98>
  100b54:	85 c0                	test   %eax,%eax
  100b56:	0f 84 f8 00 00 00    	je     100c54 <get_from+0x174>
  100b5c:	83 ec 08             	sub    $0x8,%esp
  100b5f:	68 92 00 00 00       	push   $0x92
  100b64:	68 63 17 10 00       	push   $0x101763
  100b69:	e8 c2 0a 00 00       	call   101630 <abort>
  100b6e:	a1 00 00 00 00       	mov    0x0,%eax
  100b73:	0f 0b                	ud2    
  100b75:	8d 76 00             	lea    0x0(%esi),%esi
  100b78:	be 30 21 10 00       	mov    $0x102130,%esi
  100b7d:	3b 1e                	cmp    (%esi),%ebx
  100b7f:	74 15                	je     100b96 <get_from+0xb6>
  100b81:	83 ec 08             	sub    $0x8,%esp
  100b84:	68 97 00 00 00       	push   $0x97
  100b89:	68 63 17 10 00       	push   $0x101763
  100b8e:	e8 9d 0a 00 00       	call   101630 <abort>
  100b93:	83 c4 10             	add    $0x10,%esp
  100b96:	83 fb ff             	cmp    $0xffffffff,%ebx
  100b99:	0f 84 a9 00 00 00    	je     100c48 <get_from+0x168>
  100b9f:	89 d8                	mov    %ebx,%eax
  100ba1:	c1 e0 07             	shl    $0x7,%eax
  100ba4:	01 d8                	add    %ebx,%eax
  100ba6:	01 c0                	add    %eax,%eax
  100ba8:	01 d8                	add    %ebx,%eax
  100baa:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100bad:	8d 04 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%eax
  100bb4:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100bba:	39 da                	cmp    %ebx,%edx
  100bbc:	0f 84 aa 00 00 00    	je     100c6c <get_from+0x18c>
  100bc2:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100bc8:	89 c8                	mov    %ecx,%eax
  100bca:	c1 e0 07             	shl    $0x7,%eax
  100bcd:	01 c8                	add    %ecx,%eax
  100bcf:	01 c0                	add    %eax,%eax
  100bd1:	01 c8                	add    %ecx,%eax
  100bd3:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100bd6:	89 14 c5 20 4a 10 00 	mov    %edx,0x104a20(,%eax,8)
  100bdd:	89 d0                	mov    %edx,%eax
  100bdf:	c1 e0 07             	shl    $0x7,%eax
  100be2:	01 d0                	add    %edx,%eax
  100be4:	01 c0                	add    %eax,%eax
  100be6:	01 d0                	add    %edx,%eax
  100be8:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100beb:	89 0c c5 1c 4a 10 00 	mov    %ecx,0x104a1c(,%eax,8)
  100bf2:	89 16                	mov    %edx,(%esi)
  100bf4:	89 d8                	mov    %ebx,%eax
  100bf6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100bf9:	5b                   	pop    %ebx
  100bfa:	5e                   	pop    %esi
  100bfb:	5d                   	pop    %ebp
  100bfc:	c3                   	ret    
  100bfd:	8d 76 00             	lea    0x0(%esi),%esi
  100c00:	83 ec 0c             	sub    $0xc,%esp
  100c03:	68 fc 16 10 00       	push   $0x1016fc
  100c08:	e8 af 08 00 00       	call   1014bc <printk>
  100c0d:	58                   	pop    %eax
  100c0e:	5a                   	pop    %edx
  100c0f:	56                   	push   %esi
  100c10:	53                   	push   %ebx
  100c11:	68 98 17 10 00       	push   $0x101798
  100c16:	6a 7f                	push   $0x7f
  100c18:	68 63 17 10 00       	push   $0x101763
  100c1d:	68 74 17 10 00       	push   $0x101774
  100c22:	e8 95 08 00 00       	call   1014bc <printk>
  100c27:	83 c4 14             	add    $0x14,%esp
  100c2a:	68 2b 17 10 00       	push   $0x10172b
  100c2f:	e8 88 08 00 00       	call   1014bc <printk>
  100c34:	59                   	pop    %ecx
  100c35:	5b                   	pop    %ebx
  100c36:	68 80 00 00 00       	push   $0x80
  100c3b:	68 63 17 10 00       	push   $0x101763
  100c40:	e8 eb 09 00 00       	call   101630 <abort>
  100c45:	83 c4 10             	add    $0x10,%esp
  100c48:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100c4d:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100c50:	5b                   	pop    %ebx
  100c51:	5e                   	pop    %esi
  100c52:	5d                   	pop    %ebp
  100c53:	c3                   	ret    
  100c54:	be 00 20 10 00       	mov    $0x102000,%esi
  100c59:	e9 1f ff ff ff       	jmp    100b7d <get_from+0x9d>
  100c5e:	66 90                	xchg   %ax,%ax
  100c60:	be 04 20 10 00       	mov    $0x102004,%esi
  100c65:	e9 13 ff ff ff       	jmp    100b7d <get_from+0x9d>
  100c6a:	66 90                	xchg   %ax,%ax
  100c6c:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100c72:	89 d8                	mov    %ebx,%eax
  100c74:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100c77:	5b                   	pop    %ebx
  100c78:	5e                   	pop    %esi
  100c79:	5d                   	pop    %ebp
  100c7a:	c3                   	ret    
  100c7b:	90                   	nop

00100c7c <apply_new_pid>:
  100c7c:	55                   	push   %ebp
  100c7d:	89 e5                	mov    %esp,%ebp
  100c7f:	83 ec 10             	sub    $0x10,%esp
  100c82:	a1 30 21 10 00       	mov    0x102130,%eax
  100c87:	50                   	push   %eax
  100c88:	50                   	push   %eax
  100c89:	e8 52 fe ff ff       	call   100ae0 <get_from>
  100c8e:	c9                   	leave  
  100c8f:	c3                   	ret    

00100c90 <get_from_runnable>:
  100c90:	55                   	push   %ebp
  100c91:	89 e5                	mov    %esp,%ebp
  100c93:	83 ec 10             	sub    $0x10,%esp
  100c96:	a1 04 20 10 00       	mov    0x102004,%eax
  100c9b:	50                   	push   %eax
  100c9c:	50                   	push   %eax
  100c9d:	e8 3e fe ff ff       	call   100ae0 <get_from>
  100ca2:	c9                   	leave  
  100ca3:	c3                   	ret    

00100ca4 <get_from_block>:
  100ca4:	55                   	push   %ebp
  100ca5:	89 e5                	mov    %esp,%ebp
  100ca7:	83 ec 10             	sub    $0x10,%esp
  100caa:	ff 75 08             	pushl  0x8(%ebp)
  100cad:	ff 35 00 20 10 00    	pushl  0x102000
  100cb3:	e8 28 fe ff ff       	call   100ae0 <get_from>
  100cb8:	83 c4 10             	add    $0x10,%esp
  100cbb:	40                   	inc    %eax
  100cbc:	74 0a                	je     100cc8 <get_from_block+0x24>
  100cbe:	b8 01 00 00 00       	mov    $0x1,%eax
  100cc3:	c9                   	leave  
  100cc4:	c3                   	ret    
  100cc5:	8d 76 00             	lea    0x0(%esi),%esi
  100cc8:	83 ec 08             	sub    $0x8,%esp
  100ccb:	68 ae 00 00 00       	push   $0xae
  100cd0:	68 63 17 10 00       	push   $0x101763
  100cd5:	e8 56 09 00 00       	call   101630 <abort>
  100cda:	83 c4 10             	add    $0x10,%esp
  100cdd:	b8 01 00 00 00       	mov    $0x1,%eax
  100ce2:	c9                   	leave  
  100ce3:	c3                   	ret    

00100ce4 <check_block>:
  100ce4:	8b 15 00 20 10 00    	mov    0x102000,%edx
  100cea:	83 fa ff             	cmp    $0xffffffff,%edx
  100ced:	0f 84 9d 00 00 00    	je     100d90 <check_block+0xac>
  100cf3:	55                   	push   %ebp
  100cf4:	89 e5                	mov    %esp,%ebp
  100cf6:	57                   	push   %edi
  100cf7:	56                   	push   %esi
  100cf8:	53                   	push   %ebx
  100cf9:	83 ec 0c             	sub    $0xc,%esp
  100cfc:	89 d3                	mov    %edx,%ebx
  100cfe:	eb 1e                	jmp    100d1e <check_block+0x3a>
  100d00:	89 d8                	mov    %ebx,%eax
  100d02:	c1 e0 07             	shl    $0x7,%eax
  100d05:	01 d8                	add    %ebx,%eax
  100d07:	01 c0                	add    %eax,%eax
  100d09:	01 d8                	add    %ebx,%eax
  100d0b:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100d0e:	8b 1c c5 20 4a 10 00 	mov    0x104a20(,%eax,8),%ebx
  100d15:	39 d3                	cmp    %edx,%ebx
  100d17:	74 6a                	je     100d83 <check_block+0x9f>
  100d19:	83 fa ff             	cmp    $0xffffffff,%edx
  100d1c:	74 65                	je     100d83 <check_block+0x9f>
  100d1e:	89 d8                	mov    %ebx,%eax
  100d20:	c1 e0 07             	shl    $0x7,%eax
  100d23:	01 d8                	add    %ebx,%eax
  100d25:	01 c0                	add    %eax,%eax
  100d27:	01 d8                	add    %ebx,%eax
  100d29:	8d 34 83             	lea    (%ebx,%eax,4),%esi
  100d2c:	c1 e6 03             	shl    $0x3,%esi
  100d2f:	8b be 0c 4a 10 00    	mov    0x104a0c(%esi),%edi
  100d35:	85 ff                	test   %edi,%edi
  100d37:	75 c7                	jne    100d00 <check_block+0x1c>
  100d39:	8b 8e 14 4a 10 00    	mov    0x104a14(%esi),%ecx
  100d3f:	85 c9                	test   %ecx,%ecx
  100d41:	7f bd                	jg     100d00 <check_block+0x1c>
  100d43:	8b be 20 4a 10 00    	mov    0x104a20(%esi),%edi
  100d49:	83 ec 0c             	sub    $0xc,%esp
  100d4c:	53                   	push   %ebx
  100d4d:	e8 52 ff ff ff       	call   100ca4 <get_from_block>
  100d52:	58                   	pop    %eax
  100d53:	5a                   	pop    %edx
  100d54:	81 c6 c0 49 10 00    	add    $0x1049c0,%esi
  100d5a:	56                   	push   %esi
  100d5b:	53                   	push   %ebx
  100d5c:	e8 d3 fc ff ff       	call   100a34 <put_into_runnable>
  100d61:	89 f8                	mov    %edi,%eax
  100d63:	c1 e0 07             	shl    $0x7,%eax
  100d66:	01 f8                	add    %edi,%eax
  100d68:	01 c0                	add    %eax,%eax
  100d6a:	01 f8                	add    %edi,%eax
  100d6c:	8d 04 87             	lea    (%edi,%eax,4),%eax
  100d6f:	8b 1c c5 20 4a 10 00 	mov    0x104a20(,%eax,8),%ebx
  100d76:	83 c4 10             	add    $0x10,%esp
  100d79:	8b 15 00 20 10 00    	mov    0x102000,%edx
  100d7f:	39 d3                	cmp    %edx,%ebx
  100d81:	75 96                	jne    100d19 <check_block+0x35>
  100d83:	b8 01 00 00 00       	mov    $0x1,%eax
  100d88:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100d8b:	5b                   	pop    %ebx
  100d8c:	5e                   	pop    %esi
  100d8d:	5f                   	pop    %edi
  100d8e:	5d                   	pop    %ebp
  100d8f:	c3                   	ret    
  100d90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100d95:	c3                   	ret    
  100d96:	66 90                	xchg   %ax,%ax

00100d98 <check_is_in>:
  100d98:	55                   	push   %ebp
  100d99:	89 e5                	mov    %esp,%ebp
  100d9b:	53                   	push   %ebx
  100d9c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100d9f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100da2:	39 d9                	cmp    %ebx,%ecx
  100da4:	74 3b                	je     100de1 <check_is_in+0x49>
  100da6:	89 c8                	mov    %ecx,%eax
  100da8:	c1 e0 07             	shl    $0x7,%eax
  100dab:	01 c8                	add    %ecx,%eax
  100dad:	01 c0                	add    %eax,%eax
  100daf:	01 c8                	add    %ecx,%eax
  100db1:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100db4:	8b 14 c5 20 4a 10 00 	mov    0x104a20(,%eax,8),%edx
  100dbb:	39 d1                	cmp    %edx,%ecx
  100dbd:	75 1e                	jne    100ddd <check_is_in+0x45>
  100dbf:	eb 2b                	jmp    100dec <check_is_in+0x54>
  100dc1:	8d 76 00             	lea    0x0(%esi),%esi
  100dc4:	89 d0                	mov    %edx,%eax
  100dc6:	c1 e0 07             	shl    $0x7,%eax
  100dc9:	01 d0                	add    %edx,%eax
  100dcb:	01 c0                	add    %eax,%eax
  100dcd:	01 d0                	add    %edx,%eax
  100dcf:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100dd2:	8b 14 c5 20 4a 10 00 	mov    0x104a20(,%eax,8),%edx
  100dd9:	39 d1                	cmp    %edx,%ecx
  100ddb:	74 0f                	je     100dec <check_is_in+0x54>
  100ddd:	39 d3                	cmp    %edx,%ebx
  100ddf:	75 e3                	jne    100dc4 <check_is_in+0x2c>
  100de1:	b8 01 00 00 00       	mov    $0x1,%eax
  100de6:	5b                   	pop    %ebx
  100de7:	5d                   	pop    %ebp
  100de8:	c3                   	ret    
  100de9:	8d 76 00             	lea    0x0(%esi),%esi
  100dec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100df1:	5b                   	pop    %ebx
  100df2:	5d                   	pop    %ebp
  100df3:	c3                   	ret    

00100df4 <block_decrease>:
  100df4:	55                   	push   %ebp
  100df5:	89 e5                	mov    %esp,%ebp
  100df7:	8b 0d 00 20 10 00    	mov    0x102000,%ecx
  100dfd:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100e00:	74 2e                	je     100e30 <block_decrease+0x3c>
  100e02:	89 ca                	mov    %ecx,%edx
  100e04:	89 d0                	mov    %edx,%eax
  100e06:	c1 e0 07             	shl    $0x7,%eax
  100e09:	01 d0                	add    %edx,%eax
  100e0b:	01 c0                	add    %eax,%eax
  100e0d:	01 d0                	add    %edx,%eax
  100e0f:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100e12:	8d 04 c5 c0 29 10 00 	lea    0x1029c0(,%eax,8),%eax
  100e19:	ff 88 54 20 00 00    	decl   0x2054(%eax)
  100e1f:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100e25:	39 d1                	cmp    %edx,%ecx
  100e27:	75 db                	jne    100e04 <block_decrease+0x10>
  100e29:	b8 01 00 00 00       	mov    $0x1,%eax
  100e2e:	5d                   	pop    %ebp
  100e2f:	c3                   	ret    
  100e30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e35:	5d                   	pop    %ebp
  100e36:	c3                   	ret    
  100e37:	90                   	nop

00100e38 <init_pcb>:
  100e38:	55                   	push   %ebp
  100e39:	89 e5                	mov    %esp,%ebp
  100e3b:	c7 05 a8 29 10 00 05 	movl   $0x5,0x1029a8
  100e42:	00 00 00 
  100e45:	ba 18 4a 10 00       	mov    $0x104a18,%edx
  100e4a:	31 c0                	xor    %eax,%eax
  100e4c:	89 02                	mov    %eax,(%edx)
  100e4e:	8d 48 ff             	lea    -0x1(%eax),%ecx
  100e51:	89 4a 04             	mov    %ecx,0x4(%edx)
  100e54:	40                   	inc    %eax
  100e55:	89 42 08             	mov    %eax,0x8(%edx)
  100e58:	c7 42 f4 03 00 00 00 	movl   $0x3,-0xc(%edx)
  100e5f:	81 c2 68 20 00 00    	add    $0x2068,%edx
  100e65:	3d 00 08 00 00       	cmp    $0x800,%eax
  100e6a:	75 e0                	jne    100e4c <init_pcb+0x14>
  100e6c:	c7 05 1c 4a 10 00 ff 	movl   $0x7ff,0x104a1c
  100e73:	07 00 00 
  100e76:	c7 05 b8 69 13 01 00 	movl   $0x0,0x11369b8
  100e7d:	00 00 00 
  100e80:	5d                   	pop    %ebp
  100e81:	c3                   	ret    
  100e82:	66 90                	xchg   %ax,%ax

00100e84 <init_kernel_pcb>:
  100e84:	55                   	push   %ebp
  100e85:	89 e5                	mov    %esp,%ebp
  100e87:	83 ec 10             	sub    $0x10,%esp
  100e8a:	a1 30 21 10 00       	mov    0x102130,%eax
  100e8f:	50                   	push   %eax
  100e90:	50                   	push   %eax
  100e91:	e8 4a fc ff ff       	call   100ae0 <get_from>
  100e96:	83 c4 10             	add    $0x10,%esp
  100e99:	85 c0                	test   %eax,%eax
  100e9b:	74 15                	je     100eb2 <init_kernel_pcb+0x2e>
  100e9d:	83 ec 08             	sub    $0x8,%esp
  100ea0:	68 e1 00 00 00       	push   $0xe1
  100ea5:	68 63 17 10 00       	push   $0x101763
  100eaa:	e8 81 07 00 00       	call   101630 <abort>
  100eaf:	83 c4 10             	add    $0x10,%esp
  100eb2:	c7 05 08 4a 10 00 10 	movl   $0x10,0x104a08
  100eb9:	00 00 00 
  100ebc:	c7 05 fc 49 10 00 08 	movl   $0x8,0x1049fc
  100ec3:	00 00 00 
  100ec6:	c7 05 cc 49 10 00 10 	movl   $0x10,0x1049cc
  100ecd:	00 00 00 
  100ed0:	c7 05 c8 49 10 00 10 	movl   $0x10,0x1049c8
  100ed7:	00 00 00 
  100eda:	c7 05 f8 49 10 00 ac 	movl   $0x1008ac,0x1049f8
  100ee1:	08 10 00 
  100ee4:	c7 05 04 4a 10 00 00 	movl   $0x400000,0x104a04
  100eeb:	00 40 00 
  100eee:	c7 05 0c 4a 10 00 01 	movl   $0x1,0x104a0c
  100ef5:	00 00 00 
  100ef8:	c7 05 10 4a 10 00 04 	movl   $0x4,0x104a10
  100eff:	00 00 00 
  100f02:	b8 01 00 00 00       	mov    $0x1,%eax
  100f07:	c9                   	leave  
  100f08:	c3                   	ret    
  100f09:	8d 76 00             	lea    0x0(%esi),%esi

00100f0c <make_pcb>:
  100f0c:	55                   	push   %ebp
  100f0d:	89 e5                	mov    %esp,%ebp
  100f0f:	57                   	push   %edi
  100f10:	56                   	push   %esi
  100f11:	8b 55 08             	mov    0x8(%ebp),%edx
  100f14:	89 d0                	mov    %edx,%eax
  100f16:	c1 e0 07             	shl    $0x7,%eax
  100f19:	01 d0                	add    %edx,%eax
  100f1b:	01 c0                	add    %eax,%eax
  100f1d:	01 d0                	add    %edx,%eax
  100f1f:	8d 14 82             	lea    (%edx,%eax,4),%edx
  100f22:	c1 e2 03             	shl    $0x3,%edx
  100f25:	8d 82 c0 49 10 00    	lea    0x1049c0(%edx),%eax
  100f2b:	b9 13 00 00 00       	mov    $0x13,%ecx
  100f30:	89 c7                	mov    %eax,%edi
  100f32:	8b 75 0c             	mov    0xc(%ebp),%esi
  100f35:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100f37:	8b 45 10             	mov    0x10(%ebp),%eax
  100f3a:	89 82 0c 4a 10 00    	mov    %eax,0x104a0c(%edx)
  100f40:	8b 45 14             	mov    0x14(%ebp),%eax
  100f43:	89 82 10 4a 10 00    	mov    %eax,0x104a10(%edx)
  100f49:	8b 45 18             	mov    0x18(%ebp),%eax
  100f4c:	89 82 14 4a 10 00    	mov    %eax,0x104a14(%edx)
  100f52:	8b 45 0c             	mov    0xc(%ebp),%eax
  100f55:	89 82 24 4a 10 00    	mov    %eax,0x104a24(%edx)
  100f5b:	b8 01 00 00 00       	mov    $0x1,%eax
  100f60:	5e                   	pop    %esi
  100f61:	5f                   	pop    %edi
  100f62:	5d                   	pop    %ebp
  100f63:	c3                   	ret    

00100f64 <initIdt>:
  100f64:	55                   	push   %ebp
  100f65:	89 e5                	mov    %esp,%ebp
  100f67:	53                   	push   %ebx
  100f68:	ba c7 16 10 00       	mov    $0x1016c7,%edx
  100f6d:	89 d3                	mov    %edx,%ebx
  100f6f:	c1 ea 10             	shr    $0x10,%edx
  100f72:	b9 a0 72 13 01       	mov    $0x11372a0,%ecx
  100f77:	b8 a0 6a 13 01       	mov    $0x1136aa0,%eax
  100f7c:	66 89 18             	mov    %bx,(%eax)
  100f7f:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100f85:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100f89:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100f8d:	66 89 50 06          	mov    %dx,0x6(%eax)
  100f91:	83 c0 08             	add    $0x8,%eax
  100f94:	39 c1                	cmp    %eax,%ecx
  100f96:	75 e4                	jne    100f7c <initIdt+0x18>
  100f98:	b8 cd 16 10 00       	mov    $0x1016cd,%eax
  100f9d:	66 a3 08 6b 13 01    	mov    %ax,0x1136b08
  100fa3:	66 c7 05 0a 6b 13 01 	movw   $0x8,0x1136b0a
  100faa:	08 00 
  100fac:	c6 05 0c 6b 13 01 00 	movb   $0x0,0x1136b0c
  100fb3:	c6 05 0d 6b 13 01 8f 	movb   $0x8f,0x1136b0d
  100fba:	c1 e8 10             	shr    $0x10,%eax
  100fbd:	66 a3 0e 6b 13 01    	mov    %ax,0x1136b0e
  100fc3:	b8 d1 16 10 00       	mov    $0x1016d1,%eax
  100fc8:	66 a3 a0 6e 13 01    	mov    %ax,0x1136ea0
  100fce:	66 c7 05 a2 6e 13 01 	movw   $0x8,0x1136ea2
  100fd5:	08 00 
  100fd7:	c6 05 a4 6e 13 01 00 	movb   $0x0,0x1136ea4
  100fde:	c6 05 a5 6e 13 01 ee 	movb   $0xee,0x1136ea5
  100fe5:	c1 e8 10             	shr    $0x10,%eax
  100fe8:	66 a3 a6 6e 13 01    	mov    %ax,0x1136ea6
  100fee:	b8 da 16 10 00       	mov    $0x1016da,%eax
  100ff3:	66 a3 a0 6b 13 01    	mov    %ax,0x1136ba0
  100ff9:	66 c7 05 a2 6b 13 01 	movw   $0x8,0x1136ba2
  101000:	08 00 
  101002:	c6 05 a4 6b 13 01 00 	movb   $0x0,0x1136ba4
  101009:	c6 05 a5 6b 13 01 8e 	movb   $0x8e,0x1136ba5
  101010:	c1 e8 10             	shr    $0x10,%eax
  101013:	66 a3 a6 6b 13 01    	mov    %ax,0x1136ba6
  101019:	66 c7 05 34 21 10 00 	movw   $0x7ff,0x102134
  101020:	ff 07 
  101022:	b8 a0 6a 13 01       	mov    $0x1136aa0,%eax
  101027:	66 a3 36 21 10 00    	mov    %ax,0x102136
  10102d:	c1 e8 10             	shr    $0x10,%eax
  101030:	66 a3 38 21 10 00    	mov    %ax,0x102138
  101036:	b8 34 21 10 00       	mov    $0x102134,%eax
  10103b:	0f 01 18             	lidtl  (%eax)
  10103e:	5b                   	pop    %ebx
  10103f:	5d                   	pop    %ebp
  101040:	c3                   	ret    
  101041:	66 90                	xchg   %ax,%ax
  101043:	90                   	nop

00101044 <syscallHandle>:
  101044:	55                   	push   %ebp
  101045:	89 e5                	mov    %esp,%ebp
  101047:	53                   	push   %ebx
  101048:	50                   	push   %eax
  101049:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10104c:	8b 43 2c             	mov    0x2c(%ebx),%eax
  10104f:	83 f8 04             	cmp    $0x4,%eax
  101052:	74 58                	je     1010ac <syscallHandle+0x68>
  101054:	77 1e                	ja     101074 <syscallHandle+0x30>
  101056:	83 f8 01             	cmp    $0x1,%eax
  101059:	74 45                	je     1010a0 <syscallHandle+0x5c>
  10105b:	83 f8 02             	cmp    $0x2,%eax
  10105e:	75 0f                	jne    10106f <syscallHandle+0x2b>
  101060:	83 ec 0c             	sub    $0xc,%esp
  101063:	53                   	push   %ebx
  101064:	e8 db f5 ff ff       	call   100644 <sys_fork>
  101069:	89 43 2c             	mov    %eax,0x2c(%ebx)
  10106c:	83 c4 10             	add    $0x10,%esp
  10106f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101072:	c9                   	leave  
  101073:	c3                   	ret    
  101074:	83 f8 07             	cmp    $0x7,%eax
  101077:	74 13                	je     10108c <syscallHandle+0x48>
  101079:	3d e6 00 00 00       	cmp    $0xe6,%eax
  10107e:	75 ef                	jne    10106f <syscallHandle+0x2b>
  101080:	89 5d 08             	mov    %ebx,0x8(%ebp)
  101083:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101086:	c9                   	leave  
  101087:	e9 88 f5 ff ff       	jmp    100614 <sys_sleep>
  10108c:	83 ec 0c             	sub    $0xc,%esp
  10108f:	53                   	push   %ebx
  101090:	e8 73 f5 ff ff       	call   100608 <sys_getpid>
  101095:	89 43 2c             	mov    %eax,0x2c(%ebx)
  101098:	83 c4 10             	add    $0x10,%esp
  10109b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10109e:	c9                   	leave  
  10109f:	c3                   	ret    
  1010a0:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1010a3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1010a6:	c9                   	leave  
  1010a7:	e9 30 f5 ff ff       	jmp    1005dc <sys_exit>
  1010ac:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1010af:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1010b2:	c9                   	leave  
  1010b3:	e9 20 f7 ff ff       	jmp    1007d8 <sys_write>

001010b8 <GProtectFaultHandle>:
  1010b8:	55                   	push   %ebp
  1010b9:	89 e5                	mov    %esp,%ebp
  1010bb:	83 ec 14             	sub    $0x14,%esp
  1010be:	68 fc 16 10 00       	push   $0x1016fc
  1010c3:	e8 f4 03 00 00       	call   1014bc <printk>
  1010c8:	58                   	pop    %eax
  1010c9:	8b 45 08             	mov    0x8(%ebp),%eax
  1010cc:	ff 70 30             	pushl  0x30(%eax)
  1010cf:	68 f4 17 10 00       	push   $0x1017f4
  1010d4:	6a 64                	push   $0x64
  1010d6:	68 a1 17 10 00       	push   $0x1017a1
  1010db:	68 b4 17 10 00       	push   $0x1017b4
  1010e0:	e8 d7 03 00 00       	call   1014bc <printk>
  1010e5:	83 c4 14             	add    $0x14,%esp
  1010e8:	68 2b 17 10 00       	push   $0x10172b
  1010ed:	e8 ca 03 00 00       	call   1014bc <printk>
  1010f2:	5a                   	pop    %edx
  1010f3:	59                   	pop    %ecx
  1010f4:	6a 65                	push   $0x65
  1010f6:	68 a1 17 10 00       	push   $0x1017a1
  1010fb:	e8 30 05 00 00       	call   101630 <abort>
  101100:	83 c4 10             	add    $0x10,%esp
  101103:	c9                   	leave  
  101104:	c3                   	ret    
  101105:	8d 76 00             	lea    0x0(%esi),%esi

00101108 <timeHandle>:
  101108:	55                   	push   %ebp
  101109:	89 e5                	mov    %esp,%ebp
  10110b:	53                   	push   %ebx
  10110c:	53                   	push   %ebx
  10110d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101110:	8b 15 a0 29 10 00    	mov    0x1029a0,%edx
  101116:	89 d0                	mov    %edx,%eax
  101118:	c1 e0 07             	shl    $0x7,%eax
  10111b:	01 d0                	add    %edx,%eax
  10111d:	01 c0                	add    %eax,%eax
  10111f:	01 d0                	add    %edx,%eax
  101121:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101124:	ff 0c c5 10 4a 10 00 	decl   0x104a10(,%eax,8)
  10112b:	e8 c4 fc ff ff       	call   100df4 <block_decrease>
  101130:	e8 af fb ff ff       	call   100ce4 <check_block>
  101135:	8b 15 a0 29 10 00    	mov    0x1029a0,%edx
  10113b:	89 d0                	mov    %edx,%eax
  10113d:	c1 e0 07             	shl    $0x7,%eax
  101140:	01 d0                	add    %edx,%eax
  101142:	01 c0                	add    %eax,%eax
  101144:	01 d0                	add    %edx,%eax
  101146:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101149:	8b 04 c5 10 4a 10 00 	mov    0x104a10(,%eax,8),%eax
  101150:	85 c0                	test   %eax,%eax
  101152:	7e 34                	jle    101188 <timeHandle+0x80>
  101154:	e8 9f f7 ff ff       	call   1008f8 <getpid>
  101159:	85 c0                	test   %eax,%eax
  10115b:	74 1b                	je     101178 <timeHandle+0x70>
  10115d:	e8 96 f7 ff ff       	call   1008f8 <getpid>
  101162:	83 ec 08             	sub    $0x8,%esp
  101165:	50                   	push   %eax
  101166:	68 28 17 10 00       	push   $0x101728
  10116b:	e8 4c 03 00 00       	call   1014bc <printk>
  101170:	83 c4 10             	add    $0x10,%esp
  101173:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101176:	c9                   	leave  
  101177:	c3                   	ret    
  101178:	c7 45 08 ca 17 10 00 	movl   $0x1017ca,0x8(%ebp)
  10117f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101182:	c9                   	leave  
  101183:	e9 34 03 00 00       	jmp    1014bc <printk>
  101188:	83 ec 08             	sub    $0x8,%esp
  10118b:	53                   	push   %ebx
  10118c:	52                   	push   %edx
  10118d:	e8 a2 f8 ff ff       	call   100a34 <put_into_runnable>
  101192:	e8 f9 fa ff ff       	call   100c90 <get_from_runnable>
  101197:	5a                   	pop    %edx
  101198:	59                   	pop    %ecx
  101199:	53                   	push   %ebx
  10119a:	50                   	push   %eax
  10119b:	e8 14 f7 ff ff       	call   1008b4 <put_into_running>
  1011a0:	83 c4 10             	add    $0x10,%esp
  1011a3:	eb af                	jmp    101154 <timeHandle+0x4c>
  1011a5:	8d 76 00             	lea    0x0(%esi),%esi

001011a8 <irqHandle>:
  1011a8:	55                   	push   %ebp
  1011a9:	89 e5                	mov    %esp,%ebp
  1011ab:	57                   	push   %edi
  1011ac:	56                   	push   %esi
  1011ad:	53                   	push   %ebx
  1011ae:	83 ec 0c             	sub    $0xc,%esp
  1011b1:	8b 75 08             	mov    0x8(%ebp),%esi
  1011b4:	b8 10 00 00 00       	mov    $0x10,%eax
  1011b9:	89 c0                	mov    %eax,%eax
  1011bb:	8e d8                	mov    %eax,%ds
  1011bd:	8e e0                	mov    %eax,%fs
  1011bf:	8e c0                	mov    %eax,%es
  1011c1:	b8 30 00 00 00       	mov    $0x30,%eax
  1011c6:	89 c0                	mov    %eax,%eax
  1011c8:	8e e8                	mov    %eax,%gs
  1011ca:	89 ef                	mov    %ebp,%edi
  1011cc:	3b 77 08             	cmp    0x8(%edi),%esi
  1011cf:	0f 84 e7 00 00 00    	je     1012bc <irqHandle+0x114>
  1011d5:	83 ec 08             	sub    $0x8,%esp
  1011d8:	6a 1e                	push   $0x1e
  1011da:	68 a1 17 10 00       	push   $0x1017a1
  1011df:	e8 4c 04 00 00       	call   101630 <abort>
  1011e4:	8b 1d a0 29 10 00    	mov    0x1029a0,%ebx
  1011ea:	8b 46 30             	mov    0x30(%esi),%eax
  1011ed:	83 c4 10             	add    $0x10,%esp
  1011f0:	83 f8 0d             	cmp    $0xd,%eax
  1011f3:	0f 84 d5 00 00 00    	je     1012ce <irqHandle+0x126>
  1011f9:	0f 8e e5 00 00 00    	jle    1012e4 <irqHandle+0x13c>
  1011ff:	83 f8 20             	cmp    $0x20,%eax
  101202:	74 30                	je     101234 <irqHandle+0x8c>
  101204:	83 c0 80             	add    $0xffffff80,%eax
  101207:	0f 85 de 00 00 00    	jne    1012eb <irqHandle+0x143>
  10120d:	fa                   	cli    
  10120e:	83 ec 0c             	sub    $0xc,%esp
  101211:	56                   	push   %esi
  101212:	e8 2d fe ff ff       	call   101044 <syscallHandle>
  101217:	8b 46 30             	mov    0x30(%esi),%eax
  10121a:	83 c4 10             	add    $0x10,%esp
  10121d:	3d 80 00 00 00       	cmp    $0x80,%eax
  101222:	74 28                	je     10124c <irqHandle+0xa4>
  101224:	83 f8 20             	cmp    $0x20,%eax
  101227:	74 23                	je     10124c <irqHandle+0xa4>
  101229:	fb                   	sti    
  10122a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10122d:	5b                   	pop    %ebx
  10122e:	5e                   	pop    %esi
  10122f:	5f                   	pop    %edi
  101230:	5d                   	pop    %ebp
  101231:	c3                   	ret    
  101232:	66 90                	xchg   %ax,%ax
  101234:	83 ec 0c             	sub    $0xc,%esp
  101237:	56                   	push   %esi
  101238:	e8 cb fe ff ff       	call   101108 <timeHandle>
  10123d:	8b 46 30             	mov    0x30(%esi),%eax
  101240:	83 c4 10             	add    $0x10,%esp
  101243:	3d 80 00 00 00       	cmp    $0x80,%eax
  101248:	75 da                	jne    101224 <irqHandle+0x7c>
  10124a:	66 90                	xchg   %ax,%ax
  10124c:	8b 15 a0 29 10 00    	mov    0x1029a0,%edx
  101252:	39 da                	cmp    %ebx,%edx
  101254:	74 d3                	je     101229 <irqHandle+0x81>
  101256:	89 d0                	mov    %edx,%eax
  101258:	c1 e0 07             	shl    $0x7,%eax
  10125b:	01 d0                	add    %edx,%eax
  10125d:	01 c0                	add    %eax,%eax
  10125f:	01 d0                	add    %edx,%eax
  101261:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101264:	8d 04 c5 70 49 10 00 	lea    0x104970(,%eax,8),%eax
  10126b:	89 47 08             	mov    %eax,0x8(%edi)
  10126e:	8b 15 a0 29 10 00    	mov    0x1029a0,%edx
  101274:	89 d1                	mov    %edx,%ecx
  101276:	c1 e1 07             	shl    $0x7,%ecx
  101279:	01 d1                	add    %edx,%ecx
  10127b:	01 c9                	add    %ecx,%ecx
  10127d:	01 d1                	add    %edx,%ecx
  10127f:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  101282:	8d 34 cd c0 49 10 00 	lea    0x1049c0(,%ecx,8),%esi
  101289:	b9 13 00 00 00       	mov    $0x13,%ecx
  10128e:	89 c7                	mov    %eax,%edi
  101290:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101292:	83 ec 08             	sub    $0x8,%esp
  101295:	c1 e2 10             	shl    $0x10,%edx
  101298:	52                   	push   %edx
  101299:	6a 23                	push   $0x23
  10129b:	e8 94 ed ff ff       	call   100034 <change_gdt>
  1012a0:	58                   	pop    %eax
  1012a1:	5a                   	pop    %edx
  1012a2:	a1 a0 29 10 00       	mov    0x1029a0,%eax
  1012a7:	c1 e0 10             	shl    $0x10,%eax
  1012aa:	50                   	push   %eax
  1012ab:	6a 1b                	push   $0x1b
  1012ad:	e8 82 ed ff ff       	call   100034 <change_gdt>
  1012b2:	83 c4 10             	add    $0x10,%esp
  1012b5:	e9 6f ff ff ff       	jmp    101229 <irqHandle+0x81>
  1012ba:	66 90                	xchg   %ax,%ax
  1012bc:	8b 1d a0 29 10 00    	mov    0x1029a0,%ebx
  1012c2:	8b 46 30             	mov    0x30(%esi),%eax
  1012c5:	83 f8 0d             	cmp    $0xd,%eax
  1012c8:	0f 85 2b ff ff ff    	jne    1011f9 <irqHandle+0x51>
  1012ce:	83 ec 0c             	sub    $0xc,%esp
  1012d1:	56                   	push   %esi
  1012d2:	e8 e1 fd ff ff       	call   1010b8 <GProtectFaultHandle>
  1012d7:	8b 46 30             	mov    0x30(%esi),%eax
  1012da:	83 c4 10             	add    $0x10,%esp
  1012dd:	e9 3b ff ff ff       	jmp    10121d <irqHandle+0x75>
  1012e2:	66 90                	xchg   %ax,%ax
  1012e4:	40                   	inc    %eax
  1012e5:	0f 84 3e ff ff ff    	je     101229 <irqHandle+0x81>
  1012eb:	83 ec 0c             	sub    $0xc,%esp
  1012ee:	68 fc 16 10 00       	push   $0x1016fc
  1012f3:	e8 c4 01 00 00       	call   1014bc <printk>
  1012f8:	59                   	pop    %ecx
  1012f9:	58                   	pop    %eax
  1012fa:	ff 76 38             	pushl  0x38(%esi)
  1012fd:	ff 76 30             	pushl  0x30(%esi)
  101300:	68 08 18 10 00       	push   $0x101808
  101305:	6a 35                	push   $0x35
  101307:	68 a1 17 10 00       	push   $0x1017a1
  10130c:	68 cc 17 10 00       	push   $0x1017cc
  101311:	e8 a6 01 00 00       	call   1014bc <printk>
  101316:	83 c4 14             	add    $0x14,%esp
  101319:	68 2b 17 10 00       	push   $0x10172b
  10131e:	e8 99 01 00 00       	call   1014bc <printk>
  101323:	58                   	pop    %eax
  101324:	5a                   	pop    %edx
  101325:	6a 36                	push   $0x36
  101327:	68 a1 17 10 00       	push   $0x1017a1
  10132c:	e8 ff 02 00 00       	call   101630 <abort>
  101331:	8b 46 30             	mov    0x30(%esi),%eax
  101334:	83 c4 10             	add    $0x10,%esp
  101337:	e9 e1 fe ff ff       	jmp    10121d <irqHandle+0x75>

0010133c <initIntr>:
  10133c:	55                   	push   %ebp
  10133d:	89 e5                	mov    %esp,%ebp
  10133f:	ba 21 00 00 00       	mov    $0x21,%edx
  101344:	b0 ff                	mov    $0xff,%al
  101346:	ee                   	out    %al,(%dx)
  101347:	ba a1 00 00 00       	mov    $0xa1,%edx
  10134c:	ee                   	out    %al,(%dx)
  10134d:	ba 20 00 00 00       	mov    $0x20,%edx
  101352:	b0 11                	mov    $0x11,%al
  101354:	ee                   	out    %al,(%dx)
  101355:	ba 21 00 00 00       	mov    $0x21,%edx
  10135a:	b0 20                	mov    $0x20,%al
  10135c:	ee                   	out    %al,(%dx)
  10135d:	b0 04                	mov    $0x4,%al
  10135f:	ee                   	out    %al,(%dx)
  101360:	b0 03                	mov    $0x3,%al
  101362:	ee                   	out    %al,(%dx)
  101363:	ba a0 00 00 00       	mov    $0xa0,%edx
  101368:	b0 11                	mov    $0x11,%al
  10136a:	ee                   	out    %al,(%dx)
  10136b:	ba a1 00 00 00       	mov    $0xa1,%edx
  101370:	b0 28                	mov    $0x28,%al
  101372:	ee                   	out    %al,(%dx)
  101373:	b0 02                	mov    $0x2,%al
  101375:	ee                   	out    %al,(%dx)
  101376:	b0 03                	mov    $0x3,%al
  101378:	ee                   	out    %al,(%dx)
  101379:	ba 20 00 00 00       	mov    $0x20,%edx
  10137e:	b0 68                	mov    $0x68,%al
  101380:	ee                   	out    %al,(%dx)
  101381:	b0 0a                	mov    $0xa,%al
  101383:	ee                   	out    %al,(%dx)
  101384:	ba a0 00 00 00       	mov    $0xa0,%edx
  101389:	b0 68                	mov    $0x68,%al
  10138b:	ee                   	out    %al,(%dx)
  10138c:	b0 0a                	mov    $0xa,%al
  10138e:	ee                   	out    %al,(%dx)
  10138f:	5d                   	pop    %ebp
  101390:	c3                   	ret    
  101391:	8d 76 00             	lea    0x0(%esi),%esi

00101394 <initTimer>:
  101394:	55                   	push   %ebp
  101395:	89 e5                	mov    %esp,%ebp
  101397:	ba 43 00 00 00       	mov    $0x43,%edx
  10139c:	b0 34                	mov    $0x34,%al
  10139e:	ee                   	out    %al,(%dx)
  10139f:	ba 40 00 00 00       	mov    $0x40,%edx
  1013a4:	b0 9b                	mov    $0x9b,%al
  1013a6:	ee                   	out    %al,(%dx)
  1013a7:	b0 2e                	mov    $0x2e,%al
  1013a9:	ee                   	out    %al,(%dx)
  1013aa:	5d                   	pop    %ebp
  1013ab:	c3                   	ret    

001013ac <i2A>:
  1013ac:	55                   	push   %ebp
  1013ad:	89 e5                	mov    %esp,%ebp
  1013af:	57                   	push   %edi
  1013b0:	56                   	push   %esi
  1013b1:	53                   	push   %ebx
  1013b2:	51                   	push   %ecx
  1013b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1013b6:	85 c9                	test   %ecx,%ecx
  1013b8:	78 6e                	js     101428 <i2A+0x7c>
  1013ba:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  1013be:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  1013c2:	bb 7e 21 10 00       	mov    $0x10217e,%ebx
  1013c7:	31 ff                	xor    %edi,%edi
  1013c9:	eb 03                	jmp    1013ce <i2A+0x22>
  1013cb:	90                   	nop
  1013cc:	89 f7                	mov    %esi,%edi
  1013ce:	4b                   	dec    %ebx
  1013cf:	89 c8                	mov    %ecx,%eax
  1013d1:	be 0a 00 00 00       	mov    $0xa,%esi
  1013d6:	99                   	cltd   
  1013d7:	f7 fe                	idiv   %esi
  1013d9:	83 c2 30             	add    $0x30,%edx
  1013dc:	88 13                	mov    %dl,(%ebx)
  1013de:	8d 77 01             	lea    0x1(%edi),%esi
  1013e1:	b8 67 66 66 66       	mov    $0x66666667,%eax
  1013e6:	f7 e9                	imul   %ecx
  1013e8:	89 d0                	mov    %edx,%eax
  1013ea:	c1 f8 02             	sar    $0x2,%eax
  1013ed:	c1 f9 1f             	sar    $0x1f,%ecx
  1013f0:	29 c8                	sub    %ecx,%eax
  1013f2:	89 c1                	mov    %eax,%ecx
  1013f4:	75 d6                	jne    1013cc <i2A+0x20>
  1013f6:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  1013fa:	74 20                	je     10141c <i2A+0x70>
  1013fc:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  101400:	75 06                	jne    101408 <i2A+0x5c>
  101402:	fe 05 7d 21 10 00    	incb   0x10217d
  101408:	c6 05 7e 21 10 00 00 	movb   $0x0,0x10217e
  10140f:	8b 45 0c             	mov    0xc(%ebp),%eax
  101412:	89 18                	mov    %ebx,(%eax)
  101414:	89 f0                	mov    %esi,%eax
  101416:	5a                   	pop    %edx
  101417:	5b                   	pop    %ebx
  101418:	5e                   	pop    %esi
  101419:	5f                   	pop    %edi
  10141a:	5d                   	pop    %ebp
  10141b:	c3                   	ret    
  10141c:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  101420:	8d 77 02             	lea    0x2(%edi),%esi
  101423:	4b                   	dec    %ebx
  101424:	eb d6                	jmp    1013fc <i2A+0x50>
  101426:	66 90                	xchg   %ax,%ax
  101428:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  10142e:	74 0c                	je     10143c <i2A+0x90>
  101430:	f7 d9                	neg    %ecx
  101432:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  101436:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  10143a:	eb 86                	jmp    1013c2 <i2A+0x16>
  10143c:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  101441:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101445:	eb ef                	jmp    101436 <i2A+0x8a>
  101447:	90                   	nop

00101448 <i2X>:
  101448:	55                   	push   %ebp
  101449:	89 e5                	mov    %esp,%ebp
  10144b:	57                   	push   %edi
  10144c:	56                   	push   %esi
  10144d:	53                   	push   %ebx
  10144e:	8b 55 08             	mov    0x8(%ebp),%edx
  101451:	b9 5d 21 10 00       	mov    $0x10215d,%ecx
  101456:	31 c0                	xor    %eax,%eax
  101458:	40                   	inc    %eax
  101459:	89 d6                	mov    %edx,%esi
  10145b:	83 e6 0f             	and    $0xf,%esi
  10145e:	8d 5e f6             	lea    -0xa(%esi),%ebx
  101461:	89 cf                	mov    %ecx,%edi
  101463:	83 fb 05             	cmp    $0x5,%ebx
  101466:	77 4c                	ja     1014b4 <i2X+0x6c>
  101468:	ff 24 9d 14 18 10 00 	jmp    *0x101814(,%ebx,4)
  10146f:	90                   	nop
  101470:	c6 01 65             	movb   $0x65,(%ecx)
  101473:	90                   	nop
  101474:	49                   	dec    %ecx
  101475:	c1 ea 04             	shr    $0x4,%edx
  101478:	75 de                	jne    101458 <i2X+0x10>
  10147a:	c6 05 5e 21 10 00 00 	movb   $0x0,0x10215e
  101481:	8b 55 0c             	mov    0xc(%ebp),%edx
  101484:	89 3a                	mov    %edi,(%edx)
  101486:	5b                   	pop    %ebx
  101487:	5e                   	pop    %esi
  101488:	5f                   	pop    %edi
  101489:	5d                   	pop    %ebp
  10148a:	c3                   	ret    
  10148b:	90                   	nop
  10148c:	c6 01 64             	movb   $0x64,(%ecx)
  10148f:	eb e3                	jmp    101474 <i2X+0x2c>
  101491:	8d 76 00             	lea    0x0(%esi),%esi
  101494:	c6 01 63             	movb   $0x63,(%ecx)
  101497:	eb db                	jmp    101474 <i2X+0x2c>
  101499:	8d 76 00             	lea    0x0(%esi),%esi
  10149c:	c6 01 62             	movb   $0x62,(%ecx)
  10149f:	eb d3                	jmp    101474 <i2X+0x2c>
  1014a1:	8d 76 00             	lea    0x0(%esi),%esi
  1014a4:	c6 01 61             	movb   $0x61,(%ecx)
  1014a7:	eb cb                	jmp    101474 <i2X+0x2c>
  1014a9:	8d 76 00             	lea    0x0(%esi),%esi
  1014ac:	c6 01 66             	movb   $0x66,(%ecx)
  1014af:	eb c3                	jmp    101474 <i2X+0x2c>
  1014b1:	8d 76 00             	lea    0x0(%esi),%esi
  1014b4:	8d 5e 30             	lea    0x30(%esi),%ebx
  1014b7:	88 19                	mov    %bl,(%ecx)
  1014b9:	eb b9                	jmp    101474 <i2X+0x2c>
  1014bb:	90                   	nop

001014bc <printk>:
  1014bc:	55                   	push   %ebp
  1014bd:	89 e5                	mov    %esp,%ebp
  1014bf:	57                   	push   %edi
  1014c0:	56                   	push   %esi
  1014c1:	53                   	push   %ebx
  1014c2:	83 ec 2c             	sub    $0x2c,%esp
  1014c5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1014c8:	8a 11                	mov    (%ecx),%dl
  1014ca:	84 d2                	test   %dl,%dl
  1014cc:	0f 84 54 01 00 00    	je     101626 <printk+0x16a>
  1014d2:	8d 45 0c             	lea    0xc(%ebp),%eax
  1014d5:	31 ff                	xor    %edi,%edi
  1014d7:	eb 18                	jmp    1014f1 <printk+0x35>
  1014d9:	8d 76 00             	lea    0x0(%esi),%esi
  1014dc:	8a 11                	mov    (%ecx),%dl
  1014de:	89 cb                	mov    %ecx,%ebx
  1014e0:	88 97 80 21 10 00    	mov    %dl,0x102180(%edi)
  1014e6:	47                   	inc    %edi
  1014e7:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1014ea:	8a 53 01             	mov    0x1(%ebx),%dl
  1014ed:	84 d2                	test   %dl,%dl
  1014ef:	74 72                	je     101563 <printk+0xa7>
  1014f1:	80 fa 25             	cmp    $0x25,%dl
  1014f4:	75 e6                	jne    1014dc <printk+0x20>
  1014f6:	8d 59 01             	lea    0x1(%ecx),%ebx
  1014f9:	8a 51 01             	mov    0x1(%ecx),%dl
  1014fc:	80 fa 64             	cmp    $0x64,%dl
  1014ff:	0f 84 bf 00 00 00    	je     1015c4 <printk+0x108>
  101505:	0f 8e 01 01 00 00    	jle    10160c <printk+0x150>
  10150b:	80 fa 73             	cmp    $0x73,%dl
  10150e:	0f 84 84 00 00 00    	je     101598 <printk+0xdc>
  101514:	80 fa 78             	cmp    $0x78,%dl
  101517:	75 c7                	jne    1014e0 <printk+0x24>
  101519:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  101520:	8d 70 04             	lea    0x4(%eax),%esi
  101523:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101526:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101529:	56                   	push   %esi
  10152a:	ff 30                	pushl  (%eax)
  10152c:	e8 17 ff ff ff       	call   101448 <i2X>
  101531:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  101534:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  10153a:	8a 11                	mov    (%ecx),%dl
  10153c:	83 c4 08             	add    $0x8,%esp
  10153f:	31 c0                	xor    %eax,%eax
  101541:	84 d2                	test   %dl,%dl
  101543:	74 0f                	je     101554 <printk+0x98>
  101545:	8d 76 00             	lea    0x0(%esi),%esi
  101548:	40                   	inc    %eax
  101549:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  10154d:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  101550:	84 d2                	test   %dl,%dl
  101552:	75 f4                	jne    101548 <printk+0x8c>
  101554:	01 c7                	add    %eax,%edi
  101556:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101559:	8d 4b 01             	lea    0x1(%ebx),%ecx
  10155c:	8a 53 01             	mov    0x1(%ebx),%dl
  10155f:	84 d2                	test   %dl,%dl
  101561:	75 8e                	jne    1014f1 <printk+0x35>
  101563:	c6 87 80 21 10 00 00 	movb   $0x0,0x102180(%edi)
  10156a:	0f be 05 80 21 10 00 	movsbl 0x102180,%eax
  101571:	bb 80 21 10 00       	mov    $0x102180,%ebx
  101576:	84 c0                	test   %al,%al
  101578:	74 16                	je     101590 <printk+0xd4>
  10157a:	66 90                	xchg   %ax,%ax
  10157c:	83 ec 0c             	sub    $0xc,%esp
  10157f:	50                   	push   %eax
  101580:	e8 0b f3 ff ff       	call   100890 <putChar>
  101585:	43                   	inc    %ebx
  101586:	0f be 03             	movsbl (%ebx),%eax
  101589:	83 c4 10             	add    $0x10,%esp
  10158c:	84 c0                	test   %al,%al
  10158e:	75 ec                	jne    10157c <printk+0xc0>
  101590:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101593:	5b                   	pop    %ebx
  101594:	5e                   	pop    %esi
  101595:	5f                   	pop    %edi
  101596:	5d                   	pop    %ebp
  101597:	c3                   	ret    
  101598:	8d 70 04             	lea    0x4(%eax),%esi
  10159b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10159e:	8b 08                	mov    (%eax),%ecx
  1015a0:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  1015a6:	8a 11                	mov    (%ecx),%dl
  1015a8:	31 c0                	xor    %eax,%eax
  1015aa:	84 d2                	test   %dl,%dl
  1015ac:	74 a6                	je     101554 <printk+0x98>
  1015ae:	66 90                	xchg   %ax,%ax
  1015b0:	40                   	inc    %eax
  1015b1:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1015b5:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  1015b8:	84 d2                	test   %dl,%dl
  1015ba:	75 f4                	jne    1015b0 <printk+0xf4>
  1015bc:	01 c7                	add    %eax,%edi
  1015be:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1015c1:	eb 96                	jmp    101559 <printk+0x9d>
  1015c3:	90                   	nop
  1015c4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1015cb:	8d 70 04             	lea    0x4(%eax),%esi
  1015ce:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1015d1:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  1015d4:	56                   	push   %esi
  1015d5:	ff 30                	pushl  (%eax)
  1015d7:	e8 d0 fd ff ff       	call   1013ac <i2A>
  1015dc:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1015df:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  1015e5:	8a 11                	mov    (%ecx),%dl
  1015e7:	83 c4 08             	add    $0x8,%esp
  1015ea:	31 c0                	xor    %eax,%eax
  1015ec:	84 d2                	test   %dl,%dl
  1015ee:	0f 84 60 ff ff ff    	je     101554 <printk+0x98>
  1015f4:	40                   	inc    %eax
  1015f5:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1015f9:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  1015fc:	84 d2                	test   %dl,%dl
  1015fe:	75 f4                	jne    1015f4 <printk+0x138>
  101600:	01 c7                	add    %eax,%edi
  101602:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101605:	e9 4f ff ff ff       	jmp    101559 <printk+0x9d>
  10160a:	66 90                	xchg   %ax,%ax
  10160c:	80 fa 63             	cmp    $0x63,%dl
  10160f:	0f 85 cb fe ff ff    	jne    1014e0 <printk+0x24>
  101615:	8b 10                	mov    (%eax),%edx
  101617:	88 97 80 21 10 00    	mov    %dl,0x102180(%edi)
  10161d:	83 c0 04             	add    $0x4,%eax
  101620:	47                   	inc    %edi
  101621:	e9 c1 fe ff ff       	jmp    1014e7 <printk+0x2b>
  101626:	31 ff                	xor    %edi,%edi
  101628:	e9 36 ff ff ff       	jmp    101563 <printk+0xa7>
  10162d:	66 90                	xchg   %ax,%ax
  10162f:	90                   	nop

00101630 <abort>:
  101630:	55                   	push   %ebp
  101631:	89 e5                	mov    %esp,%ebp
  101633:	57                   	push   %edi
  101634:	56                   	push   %esi
  101635:	53                   	push   %ebx
  101636:	83 ec 1c             	sub    $0x1c,%esp
  101639:	8b 55 08             	mov    0x8(%ebp),%edx
  10163c:	fa                   	cli    
  10163d:	8a 02                	mov    (%edx),%al
  10163f:	b9 32 20 10 00       	mov    $0x102032,%ecx
  101644:	84 c0                	test   %al,%al
  101646:	74 0b                	je     101653 <abort+0x23>
  101648:	41                   	inc    %ecx
  101649:	42                   	inc    %edx
  10164a:	88 41 ff             	mov    %al,-0x1(%ecx)
  10164d:	8a 02                	mov    (%edx),%al
  10164f:	84 c0                	test   %al,%al
  101651:	75 f5                	jne    101648 <abort+0x18>
  101653:	c6 01 3a             	movb   $0x3a,(%ecx)
  101656:	bb 9d 29 10 00       	mov    $0x10299d,%ebx
  10165b:	be 0a 00 00 00       	mov    $0xa,%esi
  101660:	bf 67 66 66 66       	mov    $0x66666667,%edi
  101665:	4b                   	dec    %ebx
  101666:	8b 45 0c             	mov    0xc(%ebp),%eax
  101669:	99                   	cltd   
  10166a:	f7 fe                	idiv   %esi
  10166c:	8d 42 30             	lea    0x30(%edx),%eax
  10166f:	88 45 e7             	mov    %al,-0x19(%ebp)
  101672:	88 03                	mov    %al,(%ebx)
  101674:	89 f8                	mov    %edi,%eax
  101676:	f7 6d 0c             	imull  0xc(%ebp)
  101679:	c1 fa 02             	sar    $0x2,%edx
  10167c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10167f:	c1 f8 1f             	sar    $0x1f,%eax
  101682:	29 c2                	sub    %eax,%edx
  101684:	89 55 0c             	mov    %edx,0xc(%ebp)
  101687:	75 dc                	jne    101665 <abort+0x35>
  101689:	41                   	inc    %ecx
  10168a:	41                   	inc    %ecx
  10168b:	43                   	inc    %ebx
  10168c:	8a 45 e7             	mov    -0x19(%ebp),%al
  10168f:	88 41 ff             	mov    %al,-0x1(%ecx)
  101692:	8a 03                	mov    (%ebx),%al
  101694:	88 45 e7             	mov    %al,-0x19(%ebp)
  101697:	84 c0                	test   %al,%al
  101699:	75 ef                	jne    10168a <abort+0x5a>
  10169b:	c6 01 0a             	movb   $0xa,(%ecx)
  10169e:	0f be 05 20 20 10 00 	movsbl 0x102020,%eax
  1016a5:	84 c0                	test   %al,%al
  1016a7:	74 1b                	je     1016c4 <abort+0x94>
  1016a9:	bb 20 20 10 00       	mov    $0x102020,%ebx
  1016ae:	83 ec 0c             	sub    $0xc,%esp
  1016b1:	50                   	push   %eax
  1016b2:	e8 d9 f1 ff ff       	call   100890 <putChar>
  1016b7:	43                   	inc    %ebx
  1016b8:	0f be 03             	movsbl (%ebx),%eax
  1016bb:	83 c4 10             	add    $0x10,%esp
  1016be:	84 c0                	test   %al,%al
  1016c0:	75 ec                	jne    1016ae <abort+0x7e>
  1016c2:	66 90                	xchg   %ax,%ax
  1016c4:	f4                   	hlt    
  1016c5:	eb fd                	jmp    1016c4 <abort+0x94>

001016c7 <irqEmpty>:
  1016c7:	6a 00                	push   $0x0
  1016c9:	6a ff                	push   $0xffffffff
  1016cb:	eb 13                	jmp    1016e0 <asmDoIrq>

001016cd <irqGProtectFault>:
  1016cd:	6a 0d                	push   $0xd
  1016cf:	eb 0f                	jmp    1016e0 <asmDoIrq>

001016d1 <irqSyscall>:
  1016d1:	6a 00                	push   $0x0
  1016d3:	68 80 00 00 00       	push   $0x80
  1016d8:	eb 06                	jmp    1016e0 <asmDoIrq>

001016da <irqTime>:
  1016da:	6a 00                	push   $0x0
  1016dc:	6a 20                	push   $0x20
  1016de:	eb 00                	jmp    1016e0 <asmDoIrq>

001016e0 <asmDoIrq>:
  1016e0:	60                   	pusha  
  1016e1:	1e                   	push   %ds
  1016e2:	06                   	push   %es
  1016e3:	0f a0                	push   %fs
  1016e5:	0f a8                	push   %gs
  1016e7:	54                   	push   %esp
  1016e8:	e8 bb fa ff ff       	call   1011a8 <irqHandle>
  1016ed:	5c                   	pop    %esp
  1016ee:	0f a9                	pop    %gs
  1016f0:	0f a1                	pop    %fs
  1016f2:	07                   	pop    %es
  1016f3:	1f                   	pop    %ds
  1016f4:	61                   	popa   
  1016f5:	83 c4 04             	add    $0x4,%esp
  1016f8:	83 c4 04             	add    $0x4,%esp
  1016fb:	cf                   	iret   
