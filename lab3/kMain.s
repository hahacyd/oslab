
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 0d 15 00 00       	call   101518 <initTimer>
  10000b:	e8 94 10 00 00       	call   1010a4 <init_pcb>
  100010:	e8 d3 10 00 00       	call   1010e8 <init_kernel_pcb>
  100015:	e8 ca 07 00 00       	call   1007e4 <initSerial>
  10001a:	e8 75 11 00 00       	call   101194 <initIdt>
  10001f:	e8 9c 14 00 00       	call   1014c0 <initIntr>
  100024:	e8 4f 02 00 00       	call   100278 <initSeg>
  100029:	fb                   	sti    
  10002a:	e8 5d 04 00 00       	call   10048c <loadUMain>
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
  10008f:	66 c7 05 40 34 10 00 	movw   $0x37,0x103440
  100096:	37 00 
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
  100133:	68 80 18 10 00       	push   $0x101880
  100138:	e8 03 15 00 00       	call   101640 <printk>
  10013d:	89 1c 24             	mov    %ebx,(%esp)
  100140:	68 c0 18 10 00       	push   $0x1018c0
  100145:	6a 18                	push   $0x18
  100147:	68 86 18 10 00       	push   $0x101886
  10014c:	68 93 18 10 00       	push   $0x101893
  100151:	e8 ea 14 00 00       	call   101640 <printk>
  100156:	83 c4 14             	add    $0x14,%esp
  100159:	68 af 18 10 00       	push   $0x1018af
  10015e:	e8 dd 14 00 00       	call   101640 <printk>
  100163:	58                   	pop    %eax
  100164:	5a                   	pop    %edx
  100165:	6a 19                	push   $0x19
  100167:	68 86 18 10 00       	push   $0x101886
  10016c:	e8 43 16 00 00       	call   1017b4 <abort>
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
  1001ba:	a3 28 7d 13 01       	mov    %eax,0x1137d28
  1001bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1001c2:	a3 24 7d 13 01       	mov    %eax,0x1137d24
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
  1001d8:	be 20 7d 13 01       	mov    $0x1137d20,%esi
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
  100341:	b8 20 7d 13 01       	mov    $0x1137d20,%eax
  100346:	66 a3 0a 7d 13 01    	mov    %ax,0x1137d0a
  10034c:	89 c2                	mov    %eax,%edx
  10034e:	c1 ea 10             	shr    $0x10,%edx
  100351:	88 15 0c 7d 13 01    	mov    %dl,0x1137d0c
  100357:	c6 05 0d 7d 13 01 89 	movb   $0x89,0x1137d0d
  10035e:	c6 05 0e 7d 13 01 40 	movb   $0x40,0x1137d0e
  100365:	c1 e8 18             	shr    $0x18,%eax
  100368:	a2 0f 7d 13 01       	mov    %al,0x1137d0f
  10036d:	a1 b8 18 10 00       	mov    0x1018b8,%eax
  100372:	8b 15 bc 18 10 00    	mov    0x1018bc,%edx
  100378:	a3 10 7d 13 01       	mov    %eax,0x1137d10
  10037d:	89 15 14 7d 13 01    	mov    %edx,0x1137d14
  100383:	66 c7 05 40 34 10 00 	movw   $0x37,0x103440
  10038a:	37 00 
  10038c:	66 89 0d 42 34 10 00 	mov    %cx,0x103442
  100393:	c1 e9 10             	shr    $0x10,%ecx
  100396:	66 89 0d 44 34 10 00 	mov    %cx,0x103444
  10039d:	b8 40 34 10 00       	mov    $0x103440,%eax
  1003a2:	0f 01 10             	lgdtl  (%eax)
  1003a5:	a1 28 5d 10 00       	mov    0x105d28,%eax
  1003aa:	a3 28 7d 13 01       	mov    %eax,0x1137d28
  1003af:	c7 05 24 7d 13 01 dc 	movl   $0x105cdc,0x1137d24
  1003b6:	5c 10 00 
  1003b9:	b8 28 00 00 00       	mov    $0x28,%eax
  1003be:	0f 00 d8             	ltr    %ax
  1003c1:	b8 10 00 00 00       	mov    $0x10,%eax
  1003c6:	89 c0                	mov    %eax,%eax
  1003c8:	8e d8                	mov    %eax,%ds
  1003ca:	8e e0                	mov    %eax,%fs
  1003cc:	8e c0                	mov    %eax,%es
  1003ce:	8e d0                	mov    %eax,%ss
  1003d0:	b8 30 00 00 00       	mov    $0x30,%eax
  1003d5:	89 c0                	mov    %eax,%eax
  1003d7:	8e e8                	mov    %eax,%gs
  1003d9:	31 c0                	xor    %eax,%eax
  1003db:	0f 00 d0             	lldt   %ax
  1003de:	5d                   	pop    %ebp
  1003df:	c3                   	ret    

001003e0 <enterUserSpace_pcb>:
  1003e0:	55                   	push   %ebp
  1003e1:	89 e5                	mov    %esp,%ebp
  1003e3:	8b 55 08             	mov    0x8(%ebp),%edx
  1003e6:	89 d0                	mov    %edx,%eax
  1003e8:	c1 e0 07             	shl    $0x7,%eax
  1003eb:	01 d0                	add    %edx,%eax
  1003ed:	01 c0                	add    %eax,%eax
  1003ef:	01 d0                	add    %edx,%eax
  1003f1:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1003f4:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  1003fb:	8b 90 48 20 00 00    	mov    0x2048(%eax),%edx
  100401:	52                   	push   %edx
  100402:	8b 90 44 20 00 00    	mov    0x2044(%eax),%edx
  100408:	52                   	push   %edx
  100409:	9c                   	pushf  
  10040a:	8b 90 3c 20 00 00    	mov    0x203c(%eax),%edx
  100410:	52                   	push   %edx
  100411:	8b 80 38 20 00 00    	mov    0x2038(%eax),%eax
  100417:	50                   	push   %eax
  100418:	cf                   	iret   
  100419:	5d                   	pop    %ebp
  10041a:	c3                   	ret    
  10041b:	90                   	nop

0010041c <enterUserSpace>:
  10041c:	55                   	push   %ebp
  10041d:	89 e5                	mov    %esp,%ebp
  10041f:	83 ec 10             	sub    $0x10,%esp
  100422:	c7 05 c4 3c 10 00 01 	movl   $0x1,0x103cc4
  100429:	00 00 00 
  10042c:	c7 05 90 7d 10 00 23 	movl   $0x23,0x107d90
  100433:	00 00 00 
  100436:	c7 05 8c 7d 10 00 00 	movl   $0x500000,0x107d8c
  10043d:	00 50 00 
  100440:	c7 05 84 7d 10 00 1b 	movl   $0x1b,0x107d84
  100447:	00 00 00 
  10044a:	8b 45 08             	mov    0x8(%ebp),%eax
  10044d:	a3 80 7d 10 00       	mov    %eax,0x107d80
  100452:	c7 05 98 7d 10 00 0a 	movl   $0xa,0x107d98
  100459:	00 00 00 
  10045c:	6a 00                	push   $0x0
  10045e:	6a 01                	push   $0x1
  100460:	e8 6f 06 00 00       	call   100ad4 <put_into_runnable>
  100465:	bc 00 30 00 00       	mov    $0x3000,%esp
  10046a:	a1 28 5d 10 00       	mov    0x105d28,%eax
  10046f:	50                   	push   %eax
  100470:	a1 24 5d 10 00       	mov    0x105d24,%eax
  100475:	50                   	push   %eax
  100476:	9c                   	pushf  
  100477:	a1 1c 5d 10 00       	mov    0x105d1c,%eax
  10047c:	50                   	push   %eax
  10047d:	a1 18 5d 10 00       	mov    0x105d18,%eax
  100482:	50                   	push   %eax
  100483:	cf                   	iret   
  100484:	83 c4 10             	add    $0x10,%esp
  100487:	c9                   	leave  
  100488:	c3                   	ret    
  100489:	8d 76 00             	lea    0x0(%esi),%esi

0010048c <loadUMain>:
  10048c:	55                   	push   %ebp
  10048d:	89 e5                	mov    %esp,%ebp
  10048f:	57                   	push   %edi
  100490:	56                   	push   %esi
  100491:	53                   	push   %ebx
  100492:	83 ec 0c             	sub    $0xc,%esp
  100495:	bb c9 00 00 00       	mov    $0xc9,%ebx
  10049a:	be 00 00 03 00       	mov    $0x30000,%esi
  10049f:	90                   	nop
  1004a0:	53                   	push   %ebx
  1004a1:	56                   	push   %esi
  1004a2:	e8 59 fd ff ff       	call   100200 <readSect>
  1004a7:	81 c6 00 02 00 00    	add    $0x200,%esi
  1004ad:	43                   	inc    %ebx
  1004ae:	58                   	pop    %eax
  1004af:	5a                   	pop    %edx
  1004b0:	81 fb 91 01 00 00    	cmp    $0x191,%ebx
  1004b6:	75 e8                	jne    1004a0 <loadUMain+0x14>
  1004b8:	a1 1c 00 03 00       	mov    0x3001c,%eax
  1004bd:	8d 90 00 00 03 00    	lea    0x30000(%eax),%edx
  1004c3:	0f b7 35 2c 00 03 00 	movzwl 0x3002c,%esi
  1004ca:	c1 e6 05             	shl    $0x5,%esi
  1004cd:	01 d6                	add    %edx,%esi
  1004cf:	39 f2                	cmp    %esi,%edx
  1004d1:	72 0c                	jb     1004df <loadUMain+0x53>
  1004d3:	eb 53                	jmp    100528 <loadUMain+0x9c>
  1004d5:	8d 76 00             	lea    0x0(%esi),%esi
  1004d8:	83 c2 20             	add    $0x20,%edx
  1004db:	39 d6                	cmp    %edx,%esi
  1004dd:	76 49                	jbe    100528 <loadUMain+0x9c>
  1004df:	83 3a 01             	cmpl   $0x1,(%edx)
  1004e2:	75 f4                	jne    1004d8 <loadUMain+0x4c>
  1004e4:	8b 42 08             	mov    0x8(%edx),%eax
  1004e7:	8b 7a 10             	mov    0x10(%edx),%edi
  1004ea:	8b 5a 04             	mov    0x4(%edx),%ebx
  1004ed:	29 c3                	sub    %eax,%ebx
  1004ef:	31 c9                	xor    %ecx,%ecx
  1004f1:	85 ff                	test   %edi,%edi
  1004f3:	74 16                	je     10050b <loadUMain+0x7f>
  1004f5:	8d 76 00             	lea    0x0(%esi),%esi
  1004f8:	8a 8c 03 00 00 03 00 	mov    0x30000(%ebx,%eax,1),%cl
  1004ff:	88 08                	mov    %cl,(%eax)
  100501:	40                   	inc    %eax
  100502:	89 c1                	mov    %eax,%ecx
  100504:	2b 4a 08             	sub    0x8(%edx),%ecx
  100507:	39 cf                	cmp    %ecx,%edi
  100509:	77 ed                	ja     1004f8 <loadUMain+0x6c>
  10050b:	8b 5a 14             	mov    0x14(%edx),%ebx
  10050e:	39 cb                	cmp    %ecx,%ebx
  100510:	76 c6                	jbe    1004d8 <loadUMain+0x4c>
  100512:	66 90                	xchg   %ax,%ax
  100514:	c6 00 00             	movb   $0x0,(%eax)
  100517:	40                   	inc    %eax
  100518:	89 c1                	mov    %eax,%ecx
  10051a:	2b 4a 08             	sub    0x8(%edx),%ecx
  10051d:	39 cb                	cmp    %ecx,%ebx
  10051f:	77 f3                	ja     100514 <loadUMain+0x88>
  100521:	83 c2 20             	add    $0x20,%edx
  100524:	39 d6                	cmp    %edx,%esi
  100526:	77 b7                	ja     1004df <loadUMain+0x53>
  100528:	83 ec 0c             	sub    $0xc,%esp
  10052b:	ff 35 18 00 03 00    	pushl  0x30018
  100531:	e8 e6 fe ff ff       	call   10041c <enterUserSpace>
  100536:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100539:	5b                   	pop    %ebx
  10053a:	5e                   	pop    %esi
  10053b:	5f                   	pop    %edi
  10053c:	5d                   	pop    %ebp
  10053d:	c3                   	ret    
  10053e:	66 90                	xchg   %ax,%ax

00100540 <sys_exit>:
  100540:	55                   	push   %ebp
  100541:	89 e5                	mov    %esp,%ebp
  100543:	83 ec 14             	sub    $0x14,%esp
  100546:	68 cb 18 10 00       	push   $0x1018cb
  10054b:	e8 f0 10 00 00       	call   101640 <printk>
  100550:	e8 bf 04 00 00       	call   100a14 <get_from_runnable>
  100555:	5a                   	pop    %edx
  100556:	59                   	pop    %ecx
  100557:	ff 75 08             	pushl  0x8(%ebp)
  10055a:	50                   	push   %eax
  10055b:	e8 e8 02 00 00       	call   100848 <put_into_running>
  100560:	b8 01 00 00 00       	mov    $0x1,%eax
  100565:	c9                   	leave  
  100566:	c3                   	ret    
  100567:	90                   	nop

00100568 <sys_sleep>:
  100568:	55                   	push   %ebp
  100569:	89 e5                	mov    %esp,%ebp
  10056b:	56                   	push   %esi
  10056c:	53                   	push   %ebx
  10056d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100570:	e8 6f 04 00 00       	call   1009e4 <getpid>
  100575:	83 ec 08             	sub    $0x8,%esp
  100578:	53                   	push   %ebx
  100579:	50                   	push   %eax
  10057a:	e8 89 06 00 00       	call   100c08 <put_into_block>
  10057f:	c7 04 24 80 18 10 00 	movl   $0x101880,(%esp)
  100586:	e8 b5 10 00 00       	call   101640 <printk>
  10058b:	e8 54 04 00 00       	call   1009e4 <getpid>
  100590:	89 c2                	mov    %eax,%edx
  100592:	c1 e2 07             	shl    $0x7,%edx
  100595:	01 c2                	add    %eax,%edx
  100597:	01 d2                	add    %edx,%edx
  100599:	01 c2                	add    %eax,%edx
  10059b:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10059e:	8b 34 c5 34 5d 10 00 	mov    0x105d34(,%eax,8),%esi
  1005a5:	e8 3a 04 00 00       	call   1009e4 <getpid>
  1005aa:	5a                   	pop    %edx
  1005ab:	59                   	pop    %ecx
  1005ac:	56                   	push   %esi
  1005ad:	50                   	push   %eax
  1005ae:	68 1c 19 10 00       	push   $0x10191c
  1005b3:	6a 09                	push   $0x9
  1005b5:	68 d9 18 10 00       	push   $0x1018d9
  1005ba:	68 f8 18 10 00       	push   $0x1018f8
  1005bf:	e8 7c 10 00 00       	call   101640 <printk>
  1005c4:	83 c4 14             	add    $0x14,%esp
  1005c7:	68 af 18 10 00       	push   $0x1018af
  1005cc:	e8 6f 10 00 00       	call   101640 <printk>
  1005d1:	e8 3e 04 00 00       	call   100a14 <get_from_runnable>
  1005d6:	5e                   	pop    %esi
  1005d7:	5a                   	pop    %edx
  1005d8:	53                   	push   %ebx
  1005d9:	50                   	push   %eax
  1005da:	e8 69 02 00 00       	call   100848 <put_into_running>
  1005df:	b8 01 00 00 00       	mov    $0x1,%eax
  1005e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1005e7:	5b                   	pop    %ebx
  1005e8:	5e                   	pop    %esi
  1005e9:	5d                   	pop    %ebp
  1005ea:	c3                   	ret    
  1005eb:	90                   	nop

001005ec <sys_fork>:
  1005ec:	55                   	push   %ebp
  1005ed:	89 e5                	mov    %esp,%ebp
  1005ef:	57                   	push   %edi
  1005f0:	56                   	push   %esi
  1005f1:	53                   	push   %ebx
  1005f2:	83 ec 18             	sub    $0x18,%esp
  1005f5:	8b 75 08             	mov    0x8(%ebp),%esi
  1005f8:	68 26 19 10 00       	push   $0x101926
  1005fd:	e8 3e 10 00 00       	call   101640 <printk>
  100602:	83 c4 10             	add    $0x10,%esp
  100605:	31 db                	xor    %ebx,%ebx
  100607:	90                   	nop
  100608:	e8 d7 03 00 00       	call   1009e4 <getpid>
  10060d:	89 c2                	mov    %eax,%edx
  10060f:	c1 e2 07             	shl    $0x7,%edx
  100612:	01 c2                	add    %eax,%edx
  100614:	01 d2                	add    %edx,%edx
  100616:	01 c2                	add    %eax,%edx
  100618:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10061b:	01 c0                	add    %eax,%eax
  10061d:	01 d8                	add    %ebx,%eax
  10061f:	8b 04 85 e0 3c 10 00 	mov    0x103ce0(,%eax,4),%eax
  100626:	89 04 9d b0 7d 10 00 	mov    %eax,0x107db0(,%ebx,4)
  10062d:	43                   	inc    %ebx
  10062e:	81 fb 00 08 00 00    	cmp    $0x800,%ebx
  100634:	75 d2                	jne    100608 <sys_fork+0x1c>
  100636:	e8 a9 03 00 00       	call   1009e4 <getpid>
  10063b:	8d 04 80             	lea    (%eax,%eax,4),%eax
  10063e:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100641:	8d 14 80             	lea    (%eax,%eax,4),%edx
  100644:	c1 e2 03             	shl    $0x3,%edx
  100647:	31 c0                	xor    %eax,%eax
  100649:	8d 76 00             	lea    0x0(%esi),%esi
  10064c:	8a 8c 10 00 00 40 00 	mov    0x400000(%eax,%edx,1),%cl
  100653:	88 88 d0 07 40 00    	mov    %cl,0x4007d0(%eax)
  100659:	40                   	inc    %eax
  10065a:	3d e8 03 00 00       	cmp    $0x3e8,%eax
  10065f:	75 eb                	jne    10064c <sys_fork+0x60>
  100661:	b8 b0 9d 10 00       	mov    $0x109db0,%eax
  100666:	b9 13 00 00 00       	mov    $0x13,%ecx
  10066b:	89 c7                	mov    %eax,%edi
  10066d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10066f:	c7 05 dc 9d 10 00 00 	movl   $0x0,0x109ddc
  100676:	00 00 00 
  100679:	c7 05 f4 9d 10 00 00 	movl   $0x600000,0x109df4
  100680:	00 60 00 
  100683:	83 ec 08             	sub    $0x8,%esp
  100686:	50                   	push   %eax
  100687:	6a 02                	push   $0x2
  100689:	e8 46 04 00 00       	call   100ad4 <put_into_runnable>
  10068e:	b8 02 00 00 00       	mov    $0x2,%eax
  100693:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100696:	5b                   	pop    %ebx
  100697:	5e                   	pop    %esi
  100698:	5f                   	pop    %edi
  100699:	5d                   	pop    %ebp
  10069a:	c3                   	ret    
  10069b:	90                   	nop

0010069c <display>:
  10069c:	55                   	push   %ebp
  10069d:	89 e5                	mov    %esp,%ebp
  10069f:	57                   	push   %edi
  1006a0:	53                   	push   %ebx
  1006a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1006a4:	80 fb 0a             	cmp    $0xa,%bl
  1006a7:	74 5b                	je     100704 <display+0x68>
  1006a9:	8b 15 48 34 10 00    	mov    0x103448,%edx
  1006af:	8b 0d 4c 34 10 00    	mov    0x10344c,%ecx
  1006b5:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  1006b8:	c1 e0 04             	shl    $0x4,%eax
  1006bb:	01 d0                	add    %edx,%eax
  1006bd:	01 c0                	add    %eax,%eax
  1006bf:	89 c7                	mov    %eax,%edi
  1006c1:	0f be db             	movsbl %bl,%ebx
  1006c4:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
  1006ca:	66 89 d8             	mov    %bx,%ax
  1006cd:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1006d1:	42                   	inc    %edx
  1006d2:	83 fa 50             	cmp    $0x50,%edx
  1006d5:	75 1d                	jne    1006f4 <display+0x58>
  1006d7:	c7 05 48 34 10 00 00 	movl   $0x0,0x103448
  1006de:	00 00 00 
  1006e1:	41                   	inc    %ecx
  1006e2:	89 0d 4c 34 10 00    	mov    %ecx,0x10344c
  1006e8:	b8 01 00 00 00       	mov    $0x1,%eax
  1006ed:	5b                   	pop    %ebx
  1006ee:	5f                   	pop    %edi
  1006ef:	5d                   	pop    %ebp
  1006f0:	c3                   	ret    
  1006f1:	8d 76 00             	lea    0x0(%esi),%esi
  1006f4:	89 15 48 34 10 00    	mov    %edx,0x103448
  1006fa:	b8 01 00 00 00       	mov    $0x1,%eax
  1006ff:	5b                   	pop    %ebx
  100700:	5f                   	pop    %edi
  100701:	5d                   	pop    %ebp
  100702:	c3                   	ret    
  100703:	90                   	nop
  100704:	c7 05 48 34 10 00 00 	movl   $0x0,0x103448
  10070b:	00 00 00 
  10070e:	ff 05 4c 34 10 00    	incl   0x10344c
  100714:	b8 01 00 00 00       	mov    $0x1,%eax
  100719:	5b                   	pop    %ebx
  10071a:	5f                   	pop    %edi
  10071b:	5d                   	pop    %ebp
  10071c:	c3                   	ret    
  10071d:	8d 76 00             	lea    0x0(%esi),%esi

00100720 <printkernel>:
  100720:	55                   	push   %ebp
  100721:	89 e5                	mov    %esp,%ebp
  100723:	53                   	push   %ebx
  100724:	50                   	push   %eax
  100725:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100728:	0f be 03             	movsbl (%ebx),%eax
  10072b:	84 c0                	test   %al,%al
  10072d:	74 20                	je     10074f <printkernel+0x2f>
  10072f:	90                   	nop
  100730:	83 ec 0c             	sub    $0xc,%esp
  100733:	50                   	push   %eax
  100734:	e8 eb 00 00 00       	call   100824 <putChar>
  100739:	0f be 03             	movsbl (%ebx),%eax
  10073c:	89 04 24             	mov    %eax,(%esp)
  10073f:	e8 58 ff ff ff       	call   10069c <display>
  100744:	43                   	inc    %ebx
  100745:	0f be 03             	movsbl (%ebx),%eax
  100748:	83 c4 10             	add    $0x10,%esp
  10074b:	84 c0                	test   %al,%al
  10074d:	75 e1                	jne    100730 <printkernel+0x10>
  10074f:	b8 01 00 00 00       	mov    $0x1,%eax
  100754:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100757:	c9                   	leave  
  100758:	c3                   	ret    
  100759:	8d 76 00             	lea    0x0(%esi),%esi

0010075c <fs_write>:
  10075c:	55                   	push   %ebp
  10075d:	89 e5                	mov    %esp,%ebp
  10075f:	53                   	push   %ebx
  100760:	50                   	push   %eax
  100761:	8b 5d 10             	mov    0x10(%ebp),%ebx
  100764:	ba 30 00 00 00       	mov    $0x30,%edx
  100769:	89 d0                	mov    %edx,%eax
  10076b:	8e e8                	mov    %eax,%gs
  10076d:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  100771:	74 12                	je     100785 <fs_write+0x29>
  100773:	83 ec 08             	sub    $0x8,%esp
  100776:	6a 27                	push   $0x27
  100778:	68 42 19 10 00       	push   $0x101942
  10077d:	e8 32 10 00 00       	call   1017b4 <abort>
  100782:	83 c4 10             	add    $0x10,%esp
  100785:	83 ec 08             	sub    $0x8,%esp
  100788:	53                   	push   %ebx
  100789:	ff 75 0c             	pushl  0xc(%ebp)
  10078c:	e8 8f ff ff ff       	call   100720 <printkernel>
  100791:	89 d8                	mov    %ebx,%eax
  100793:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100796:	c9                   	leave  
  100797:	c3                   	ret    

00100798 <sys_write>:
  100798:	55                   	push   %ebp
  100799:	89 e5                	mov    %esp,%ebp
  10079b:	53                   	push   %ebx
  10079c:	83 ec 08             	sub    $0x8,%esp
  10079f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1007a2:	ff 73 24             	pushl  0x24(%ebx)
  1007a5:	ff 73 28             	pushl  0x28(%ebx)
  1007a8:	ff 73 20             	pushl  0x20(%ebx)
  1007ab:	e8 ac ff ff ff       	call   10075c <fs_write>
  1007b0:	89 43 2c             	mov    %eax,0x2c(%ebx)
  1007b3:	83 c4 10             	add    $0x10,%esp
  1007b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1007b9:	c9                   	leave  
  1007ba:	c3                   	ret    
  1007bb:	90                   	nop

001007bc <print_char>:
  1007bc:	55                   	push   %ebp
  1007bd:	89 e5                	mov    %esp,%ebp
  1007bf:	57                   	push   %edi
  1007c0:	8b 45 08             	mov    0x8(%ebp),%eax
  1007c3:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1007c6:	c1 e0 04             	shl    $0x4,%eax
  1007c9:	03 45 0c             	add    0xc(%ebp),%eax
  1007cc:	01 c0                	add    %eax,%eax
  1007ce:	89 c7                	mov    %eax,%edi
  1007d0:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  1007d4:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  1007da:	66 89 d0             	mov    %dx,%ax
  1007dd:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1007e1:	5f                   	pop    %edi
  1007e2:	5d                   	pop    %ebp
  1007e3:	c3                   	ret    

001007e4 <initSerial>:
  1007e4:	55                   	push   %ebp
  1007e5:	89 e5                	mov    %esp,%ebp
  1007e7:	ba f9 03 00 00       	mov    $0x3f9,%edx
  1007ec:	31 c0                	xor    %eax,%eax
  1007ee:	ee                   	out    %al,(%dx)
  1007ef:	ba fb 03 00 00       	mov    $0x3fb,%edx
  1007f4:	b0 80                	mov    $0x80,%al
  1007f6:	ee                   	out    %al,(%dx)
  1007f7:	ba f8 03 00 00       	mov    $0x3f8,%edx
  1007fc:	b0 01                	mov    $0x1,%al
  1007fe:	ee                   	out    %al,(%dx)
  1007ff:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100804:	31 c0                	xor    %eax,%eax
  100806:	ee                   	out    %al,(%dx)
  100807:	ba fb 03 00 00       	mov    $0x3fb,%edx
  10080c:	b0 03                	mov    $0x3,%al
  10080e:	ee                   	out    %al,(%dx)
  10080f:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100814:	b0 c7                	mov    $0xc7,%al
  100816:	ee                   	out    %al,(%dx)
  100817:	ba fc 03 00 00       	mov    $0x3fc,%edx
  10081c:	b0 0b                	mov    $0xb,%al
  10081e:	ee                   	out    %al,(%dx)
  10081f:	5d                   	pop    %ebp
  100820:	c3                   	ret    
  100821:	8d 76 00             	lea    0x0(%esi),%esi

00100824 <putChar>:
  100824:	55                   	push   %ebp
  100825:	89 e5                	mov    %esp,%ebp
  100827:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10082a:	ba fd 03 00 00       	mov    $0x3fd,%edx
  10082f:	90                   	nop
  100830:	ec                   	in     (%dx),%al
  100831:	a8 20                	test   $0x20,%al
  100833:	74 fb                	je     100830 <putChar+0xc>
  100835:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10083a:	88 c8                	mov    %cl,%al
  10083c:	ee                   	out    %al,(%dx)
  10083d:	5d                   	pop    %ebp
  10083e:	c3                   	ret    
  10083f:	90                   	nop

00100840 <IDLE>:
  100840:	55                   	push   %ebp
  100841:	89 e5                	mov    %esp,%ebp
  100843:	90                   	nop
  100844:	f4                   	hlt    
  100845:	eb fd                	jmp    100844 <IDLE+0x4>
  100847:	90                   	nop

00100848 <put_into_running>:
  100848:	55                   	push   %ebp
  100849:	89 e5                	mov    %esp,%ebp
  10084b:	53                   	push   %ebx
  10084c:	81 ec d4 00 00 00    	sub    $0xd4,%esp
  100852:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100855:	39 1d c0 3c 10 00    	cmp    %ebx,0x103cc0
  10085b:	0f 84 a9 00 00 00    	je     10090a <put_into_running+0xc2>
  100861:	89 1d c0 3c 10 00    	mov    %ebx,0x103cc0
  100867:	85 db                	test   %ebx,%ebx
  100869:	0f 84 a5 00 00 00    	je     100914 <put_into_running+0xcc>
  10086f:	83 fb 02             	cmp    $0x2,%ebx
  100872:	0f 84 08 01 00 00    	je     100980 <put_into_running+0x138>
  100878:	89 da                	mov    %ebx,%edx
  10087a:	83 ec 08             	sub    $0x8,%esp
  10087d:	89 d0                	mov    %edx,%eax
  10087f:	c1 e0 07             	shl    $0x7,%eax
  100882:	01 d0                	add    %edx,%eax
  100884:	01 c0                	add    %eax,%eax
  100886:	01 d0                	add    %edx,%eax
  100888:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10088b:	8d 04 c5 dc 5c 10 00 	lea    0x105cdc(,%eax,8),%eax
  100892:	50                   	push   %eax
  100893:	6a 10                	push   $0x10
  100895:	e8 1a f9 ff ff       	call   1001b4 <change_tss>
  10089a:	8d 45 94             	lea    -0x6c(%ebp),%eax
  10089d:	89 04 24             	mov    %eax,(%esp)
  1008a0:	e8 2b f9 ff ff       	call   1001d0 <get_tss>
  1008a5:	89 d8                	mov    %ebx,%eax
  1008a7:	c1 e0 07             	shl    $0x7,%eax
  1008aa:	01 d8                	add    %ebx,%eax
  1008ac:	01 c0                	add    %eax,%eax
  1008ae:	01 d8                	add    %ebx,%eax
  1008b0:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1008b3:	8d 04 c5 dc 5c 10 00 	lea    0x105cdc(,%eax,8),%eax
  1008ba:	83 c4 0c             	add    $0xc,%esp
  1008bd:	39 45 98             	cmp    %eax,-0x68(%ebp)
  1008c0:	74 12                	je     1008d4 <put_into_running+0x8c>
  1008c2:	83 ec 08             	sub    $0x8,%esp
  1008c5:	6a 27                	push   $0x27
  1008c7:	68 5e 19 10 00       	push   $0x10195e
  1008cc:	e8 e3 0e 00 00       	call   1017b4 <abort>
  1008d1:	83 c4 10             	add    $0x10,%esp
  1008d4:	83 ec 0c             	sub    $0xc,%esp
  1008d7:	68 80 18 10 00       	push   $0x101880
  1008dc:	e8 5f 0d 00 00       	call   101640 <printk>
  1008e1:	89 1c 24             	mov    %ebx,(%esp)
  1008e4:	68 90 1a 10 00       	push   $0x101a90
  1008e9:	6a 2a                	push   $0x2a
  1008eb:	68 5e 19 10 00       	push   $0x10195e
  1008f0:	68 6c 19 10 00       	push   $0x10196c
  1008f5:	e8 46 0d 00 00       	call   101640 <printk>
  1008fa:	83 c4 14             	add    $0x14,%esp
  1008fd:	68 af 18 10 00       	push   $0x1018af
  100902:	e8 39 0d 00 00       	call   101640 <printk>
  100907:	83 c4 10             	add    $0x10,%esp
  10090a:	b8 01 00 00 00       	mov    $0x1,%eax
  10090f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100912:	c9                   	leave  
  100913:	c3                   	ret    
  100914:	83 ec 08             	sub    $0x8,%esp
  100917:	6a 00                	push   $0x0
  100919:	6a 10                	push   $0x10
  10091b:	e8 14 f7 ff ff       	call   100034 <change_gdt>
  100920:	59                   	pop    %ecx
  100921:	58                   	pop    %eax
  100922:	8b 15 c0 3c 10 00    	mov    0x103cc0,%edx
  100928:	89 d0                	mov    %edx,%eax
  10092a:	c1 e0 07             	shl    $0x7,%eax
  10092d:	01 d0                	add    %edx,%eax
  10092f:	01 c0                	add    %eax,%eax
  100931:	01 d0                	add    %edx,%eax
  100933:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100936:	8d 04 c5 dc 5c 10 00 	lea    0x105cdc(,%eax,8),%eax
  10093d:	50                   	push   %eax
  10093e:	6a 10                	push   $0x10
  100940:	e8 6f f8 ff ff       	call   1001b4 <change_tss>
  100945:	8d 85 30 ff ff ff    	lea    -0xd0(%ebp),%eax
  10094b:	89 04 24             	mov    %eax,(%esp)
  10094e:	e8 7d f8 ff ff       	call   1001d0 <get_tss>
  100953:	83 c4 0c             	add    $0xc,%esp
  100956:	81 bd 34 ff ff ff dc 	cmpl   $0x105cdc,-0xcc(%ebp)
  10095d:	5c 10 00 
  100960:	0f 84 6e ff ff ff    	je     1008d4 <put_into_running+0x8c>
  100966:	83 ec 08             	sub    $0x8,%esp
  100969:	6a 1a                	push   $0x1a
  10096b:	68 5e 19 10 00       	push   $0x10195e
  100970:	e8 3f 0e 00 00       	call   1017b4 <abort>
  100975:	83 c4 10             	add    $0x10,%esp
  100978:	e9 57 ff ff ff       	jmp    1008d4 <put_into_running+0x8c>
  10097d:	8d 76 00             	lea    0x0(%esi),%esi
  100980:	83 ec 0c             	sub    $0xc,%esp
  100983:	68 80 18 10 00       	push   $0x101880
  100988:	e8 b3 0c 00 00       	call   101640 <printk>
  10098d:	58                   	pop    %eax
  10098e:	5a                   	pop    %edx
  10098f:	ff 35 90 7d 10 00    	pushl  0x107d90
  100995:	ff 35 8c 7d 10 00    	pushl  0x107d8c
  10099b:	68 90 1a 10 00       	push   $0x101a90
  1009a0:	6a 22                	push   $0x22
  1009a2:	68 5e 19 10 00       	push   $0x10195e
  1009a7:	68 a4 19 10 00       	push   $0x1019a4
  1009ac:	e8 8f 0c 00 00       	call   101640 <printk>
  1009b1:	83 c4 14             	add    $0x14,%esp
  1009b4:	68 af 18 10 00       	push   $0x1018af
  1009b9:	e8 82 0c 00 00       	call   101640 <printk>
  1009be:	8b 15 c0 3c 10 00    	mov    0x103cc0,%edx
  1009c4:	83 c4 10             	add    $0x10,%esp
  1009c7:	e9 ae fe ff ff       	jmp    10087a <put_into_running+0x32>

001009cc <update_block>:
  1009cc:	55                   	push   %ebp
  1009cd:	89 e5                	mov    %esp,%ebp
  1009cf:	b8 01 00 00 00       	mov    $0x1,%eax
  1009d4:	5d                   	pop    %ebp
  1009d5:	c3                   	ret    
  1009d6:	66 90                	xchg   %ax,%ax

001009d8 <apply_new_pid>:
  1009d8:	55                   	push   %ebp
  1009d9:	89 e5                	mov    %esp,%ebp
  1009db:	b8 02 00 00 00       	mov    $0x2,%eax
  1009e0:	5d                   	pop    %ebp
  1009e1:	c3                   	ret    
  1009e2:	66 90                	xchg   %ax,%ax

001009e4 <getpid>:
  1009e4:	55                   	push   %ebp
  1009e5:	89 e5                	mov    %esp,%ebp
  1009e7:	a1 c0 3c 10 00       	mov    0x103cc0,%eax
  1009ec:	5d                   	pop    %ebp
  1009ed:	c3                   	ret    
  1009ee:	66 90                	xchg   %ax,%ax

001009f0 <getrunnable>:
  1009f0:	55                   	push   %ebp
  1009f1:	89 e5                	mov    %esp,%ebp
  1009f3:	a1 24 33 10 00       	mov    0x103324,%eax
  1009f8:	5d                   	pop    %ebp
  1009f9:	c3                   	ret    
  1009fa:	66 90                	xchg   %ax,%ax

001009fc <getblocked>:
  1009fc:	55                   	push   %ebp
  1009fd:	89 e5                	mov    %esp,%ebp
  1009ff:	a1 20 33 10 00       	mov    0x103320,%eax
  100a04:	5d                   	pop    %ebp
  100a05:	c3                   	ret    
  100a06:	66 90                	xchg   %ax,%ax

00100a08 <transfer_pid_mode>:
  100a08:	55                   	push   %ebp
  100a09:	89 e5                	mov    %esp,%ebp
  100a0b:	b8 01 00 00 00       	mov    $0x1,%eax
  100a10:	5d                   	pop    %ebp
  100a11:	c3                   	ret    
  100a12:	66 90                	xchg   %ax,%ax

00100a14 <get_from_runnable>:
  100a14:	55                   	push   %ebp
  100a15:	89 e5                	mov    %esp,%ebp
  100a17:	53                   	push   %ebx
  100a18:	51                   	push   %ecx
  100a19:	8b 1d 24 33 10 00    	mov    0x103324,%ebx
  100a1f:	83 fb ff             	cmp    $0xffffffff,%ebx
  100a22:	0f 84 a4 00 00 00    	je     100acc <get_from_runnable+0xb8>
  100a28:	89 d8                	mov    %ebx,%eax
  100a2a:	c1 e0 07             	shl    $0x7,%eax
  100a2d:	01 d8                	add    %ebx,%eax
  100a2f:	01 c0                	add    %eax,%eax
  100a31:	01 d8                	add    %ebx,%eax
  100a33:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100a36:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100a3d:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100a43:	39 da                	cmp    %ebx,%edx
  100a45:	74 79                	je     100ac0 <get_from_runnable+0xac>
  100a47:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100a4d:	89 c8                	mov    %ecx,%eax
  100a4f:	c1 e0 07             	shl    $0x7,%eax
  100a52:	01 c8                	add    %ecx,%eax
  100a54:	01 c0                	add    %eax,%eax
  100a56:	01 c8                	add    %ecx,%eax
  100a58:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100a5b:	89 14 c5 40 5d 10 00 	mov    %edx,0x105d40(,%eax,8)
  100a62:	89 d0                	mov    %edx,%eax
  100a64:	c1 e0 07             	shl    $0x7,%eax
  100a67:	01 d0                	add    %edx,%eax
  100a69:	01 c0                	add    %eax,%eax
  100a6b:	01 d0                	add    %edx,%eax
  100a6d:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100a70:	89 0c c5 3c 5d 10 00 	mov    %ecx,0x105d3c(,%eax,8)
  100a77:	89 15 24 33 10 00    	mov    %edx,0x103324
  100a7d:	83 ec 0c             	sub    $0xc,%esp
  100a80:	68 80 18 10 00       	push   $0x101880
  100a85:	e8 b6 0b 00 00       	call   101640 <printk>
  100a8a:	58                   	pop    %eax
  100a8b:	5a                   	pop    %edx
  100a8c:	ff 35 24 33 10 00    	pushl  0x103324
  100a92:	53                   	push   %ebx
  100a93:	68 6c 1a 10 00       	push   $0x101a6c
  100a98:	6a 7a                	push   $0x7a
  100a9a:	68 5e 19 10 00       	push   $0x10195e
  100a9f:	68 d4 19 10 00       	push   $0x1019d4
  100aa4:	e8 97 0b 00 00       	call   101640 <printk>
  100aa9:	83 c4 14             	add    $0x14,%esp
  100aac:	68 af 18 10 00       	push   $0x1018af
  100ab1:	e8 8a 0b 00 00       	call   101640 <printk>
  100ab6:	83 c4 10             	add    $0x10,%esp
  100ab9:	89 d8                	mov    %ebx,%eax
  100abb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100abe:	c9                   	leave  
  100abf:	c3                   	ret    
  100ac0:	c7 05 24 33 10 00 ff 	movl   $0xffffffff,0x103324
  100ac7:	ff ff ff 
  100aca:	eb b1                	jmp    100a7d <get_from_runnable+0x69>
  100acc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100ad1:	eb e8                	jmp    100abb <get_from_runnable+0xa7>
  100ad3:	90                   	nop

00100ad4 <put_into_runnable>:
  100ad4:	55                   	push   %ebp
  100ad5:	89 e5                	mov    %esp,%ebp
  100ad7:	56                   	push   %esi
  100ad8:	53                   	push   %ebx
  100ad9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100adc:	8b 15 24 33 10 00    	mov    0x103324,%edx
  100ae2:	83 fa ff             	cmp    $0xffffffff,%edx
  100ae5:	0f 84 f1 00 00 00    	je     100bdc <put_into_runnable+0x108>
  100aeb:	89 d0                	mov    %edx,%eax
  100aed:	c1 e0 07             	shl    $0x7,%eax
  100af0:	01 d0                	add    %edx,%eax
  100af2:	01 c0                	add    %eax,%eax
  100af4:	01 d0                	add    %edx,%eax
  100af6:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100af9:	8d 34 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%esi
  100b00:	8b 8e 5c 20 00 00    	mov    0x205c(%esi),%ecx
  100b06:	89 c8                	mov    %ecx,%eax
  100b08:	c1 e0 07             	shl    $0x7,%eax
  100b0b:	01 c8                	add    %ecx,%eax
  100b0d:	01 c0                	add    %eax,%eax
  100b0f:	01 c8                	add    %ecx,%eax
  100b11:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100b14:	89 1c c5 40 5d 10 00 	mov    %ebx,0x105d40(,%eax,8)
  100b1b:	89 d8                	mov    %ebx,%eax
  100b1d:	c1 e0 07             	shl    $0x7,%eax
  100b20:	01 d8                	add    %ebx,%eax
  100b22:	01 c0                	add    %eax,%eax
  100b24:	01 d8                	add    %ebx,%eax
  100b26:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b29:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100b30:	89 88 5c 20 00 00    	mov    %ecx,0x205c(%eax)
  100b36:	89 90 60 20 00 00    	mov    %edx,0x2060(%eax)
  100b3c:	89 9e 5c 20 00 00    	mov    %ebx,0x205c(%esi)
  100b42:	89 d8                	mov    %ebx,%eax
  100b44:	c1 e0 07             	shl    $0x7,%eax
  100b47:	01 d8                	add    %ebx,%eax
  100b49:	01 c0                	add    %eax,%eax
  100b4b:	01 d8                	add    %ebx,%eax
  100b4d:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b50:	c7 04 c5 2c 5d 10 00 	movl   $0x1,0x105d2c(,%eax,8)
  100b57:	01 00 00 00 
  100b5b:	85 db                	test   %ebx,%ebx
  100b5d:	75 0a                	jne    100b69 <put_into_runnable+0x95>
  100b5f:	c7 05 18 5d 10 00 40 	movl   $0x100840,0x105d18
  100b66:	08 10 00 
  100b69:	83 ec 0c             	sub    $0xc,%esp
  100b6c:	68 80 18 10 00       	push   $0x101880
  100b71:	e8 ca 0a 00 00       	call   101640 <printk>
  100b76:	58                   	pop    %eax
  100b77:	5a                   	pop    %edx
  100b78:	53                   	push   %ebx
  100b79:	ff 35 24 33 10 00    	pushl  0x103324
  100b7f:	68 58 1a 10 00       	push   $0x101a58
  100b84:	68 96 00 00 00       	push   $0x96
  100b89:	68 5e 19 10 00       	push   $0x10195e
  100b8e:	68 08 1a 10 00       	push   $0x101a08
  100b93:	e8 a8 0a 00 00       	call   101640 <printk>
  100b98:	83 c4 14             	add    $0x14,%esp
  100b9b:	68 af 18 10 00       	push   $0x1018af
  100ba0:	e8 9b 0a 00 00       	call   101640 <printk>
  100ba5:	89 d8                	mov    %ebx,%eax
  100ba7:	c1 e0 07             	shl    $0x7,%eax
  100baa:	01 d8                	add    %ebx,%eax
  100bac:	01 c0                	add    %eax,%eax
  100bae:	01 d8                	add    %ebx,%eax
  100bb0:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100bb3:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100bba:	8b 15 c8 3c 10 00    	mov    0x103cc8,%edx
  100bc0:	89 90 50 20 00 00    	mov    %edx,0x2050(%eax)
  100bc6:	8b 55 0c             	mov    0xc(%ebp),%edx
  100bc9:	89 90 64 20 00 00    	mov    %edx,0x2064(%eax)
  100bcf:	b8 01 00 00 00       	mov    $0x1,%eax
  100bd4:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100bd7:	5b                   	pop    %ebx
  100bd8:	5e                   	pop    %esi
  100bd9:	5d                   	pop    %ebp
  100bda:	c3                   	ret    
  100bdb:	90                   	nop
  100bdc:	89 1d 24 33 10 00    	mov    %ebx,0x103324
  100be2:	89 d8                	mov    %ebx,%eax
  100be4:	c1 e0 07             	shl    $0x7,%eax
  100be7:	01 d8                	add    %ebx,%eax
  100be9:	01 c0                	add    %eax,%eax
  100beb:	01 d8                	add    %ebx,%eax
  100bed:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100bf0:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100bf7:	89 98 5c 20 00 00    	mov    %ebx,0x205c(%eax)
  100bfd:	89 98 60 20 00 00    	mov    %ebx,0x2060(%eax)
  100c03:	e9 3a ff ff ff       	jmp    100b42 <put_into_runnable+0x6e>

00100c08 <put_into_block>:
  100c08:	55                   	push   %ebp
  100c09:	89 e5                	mov    %esp,%ebp
  100c0b:	57                   	push   %edi
  100c0c:	56                   	push   %esi
  100c0d:	53                   	push   %ebx
  100c0e:	8b 45 08             	mov    0x8(%ebp),%eax
  100c11:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100c14:	8b 0d 20 33 10 00    	mov    0x103320,%ecx
  100c1a:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100c1d:	0f 84 99 00 00 00    	je     100cbc <put_into_block+0xb4>
  100c23:	89 ca                	mov    %ecx,%edx
  100c25:	c1 e2 07             	shl    $0x7,%edx
  100c28:	01 ca                	add    %ecx,%edx
  100c2a:	01 d2                	add    %edx,%edx
  100c2c:	01 ca                	add    %ecx,%edx
  100c2e:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100c31:	8d 3c d5 e0 3c 10 00 	lea    0x103ce0(,%edx,8),%edi
  100c38:	8b b7 5c 20 00 00    	mov    0x205c(%edi),%esi
  100c3e:	89 f2                	mov    %esi,%edx
  100c40:	c1 e2 07             	shl    $0x7,%edx
  100c43:	01 f2                	add    %esi,%edx
  100c45:	01 d2                	add    %edx,%edx
  100c47:	01 f2                	add    %esi,%edx
  100c49:	8d 14 96             	lea    (%esi,%edx,4),%edx
  100c4c:	89 04 d5 40 5d 10 00 	mov    %eax,0x105d40(,%edx,8)
  100c53:	89 c2                	mov    %eax,%edx
  100c55:	c1 e2 07             	shl    $0x7,%edx
  100c58:	01 c2                	add    %eax,%edx
  100c5a:	01 d2                	add    %edx,%edx
  100c5c:	01 c2                	add    %eax,%edx
  100c5e:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c61:	8d 14 d5 e0 3c 10 00 	lea    0x103ce0(,%edx,8),%edx
  100c68:	89 b2 5c 20 00 00    	mov    %esi,0x205c(%edx)
  100c6e:	89 8a 60 20 00 00    	mov    %ecx,0x2060(%edx)
  100c74:	89 87 5c 20 00 00    	mov    %eax,0x205c(%edi)
  100c7a:	89 c2                	mov    %eax,%edx
  100c7c:	c1 e2 07             	shl    $0x7,%edx
  100c7f:	01 c2                	add    %eax,%edx
  100c81:	01 d2                	add    %edx,%edx
  100c83:	01 c2                	add    %eax,%edx
  100c85:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c88:	c1 e2 03             	shl    $0x3,%edx
  100c8b:	8d 82 e0 5c 10 00    	lea    0x105ce0(%edx),%eax
  100c91:	b9 13 00 00 00       	mov    $0x13,%ecx
  100c96:	89 c7                	mov    %eax,%edi
  100c98:	89 de                	mov    %ebx,%esi
  100c9a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100c9c:	8b 43 20             	mov    0x20(%ebx),%eax
  100c9f:	89 82 34 5d 10 00    	mov    %eax,0x105d34(%edx)
  100ca5:	c7 82 2c 5d 10 00 00 	movl   $0x0,0x105d2c(%edx)
  100cac:	00 00 00 
  100caf:	b8 01 00 00 00       	mov    $0x1,%eax
  100cb4:	5b                   	pop    %ebx
  100cb5:	5e                   	pop    %esi
  100cb6:	5f                   	pop    %edi
  100cb7:	5d                   	pop    %ebp
  100cb8:	c3                   	ret    
  100cb9:	8d 76 00             	lea    0x0(%esi),%esi
  100cbc:	a3 20 33 10 00       	mov    %eax,0x103320
  100cc1:	89 c2                	mov    %eax,%edx
  100cc3:	c1 e2 07             	shl    $0x7,%edx
  100cc6:	01 c2                	add    %eax,%edx
  100cc8:	01 d2                	add    %edx,%edx
  100cca:	01 c2                	add    %eax,%edx
  100ccc:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100ccf:	8d 14 d5 e0 3c 10 00 	lea    0x103ce0(,%edx,8),%edx
  100cd6:	89 82 60 20 00 00    	mov    %eax,0x2060(%edx)
  100cdc:	89 82 5c 20 00 00    	mov    %eax,0x205c(%edx)
  100ce2:	eb 96                	jmp    100c7a <put_into_block+0x72>

00100ce4 <get_from>:
  100ce4:	55                   	push   %ebp
  100ce5:	89 e5                	mov    %esp,%ebp
  100ce7:	56                   	push   %esi
  100ce8:	53                   	push   %ebx
  100ce9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100cec:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cef:	85 db                	test   %ebx,%ebx
  100cf1:	0f 8e 01 01 00 00    	jle    100df8 <get_from+0x114>
  100cf7:	39 c3                	cmp    %eax,%ebx
  100cf9:	74 42                	je     100d3d <get_from+0x59>
  100cfb:	89 da                	mov    %ebx,%edx
  100cfd:	c1 e2 07             	shl    $0x7,%edx
  100d00:	01 da                	add    %ebx,%edx
  100d02:	01 d2                	add    %edx,%edx
  100d04:	01 da                	add    %ebx,%edx
  100d06:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100d09:	8b 0c d5 40 5d 10 00 	mov    0x105d40(,%edx,8),%ecx
  100d10:	39 cb                	cmp    %ecx,%ebx
  100d12:	75 25                	jne    100d39 <get_from+0x55>
  100d14:	e9 df 00 00 00       	jmp    100df8 <get_from+0x114>
  100d19:	8d 76 00             	lea    0x0(%esi),%esi
  100d1c:	89 ca                	mov    %ecx,%edx
  100d1e:	c1 e2 07             	shl    $0x7,%edx
  100d21:	01 ca                	add    %ecx,%edx
  100d23:	01 d2                	add    %edx,%edx
  100d25:	01 ca                	add    %ecx,%edx
  100d27:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100d2a:	8b 0c d5 40 5d 10 00 	mov    0x105d40(,%edx,8),%ecx
  100d31:	39 cb                	cmp    %ecx,%ebx
  100d33:	0f 84 bf 00 00 00    	je     100df8 <get_from+0x114>
  100d39:	39 c1                	cmp    %eax,%ecx
  100d3b:	75 df                	jne    100d1c <get_from+0x38>
  100d3d:	89 c2                	mov    %eax,%edx
  100d3f:	c1 e2 07             	shl    $0x7,%edx
  100d42:	01 c2                	add    %eax,%edx
  100d44:	01 d2                	add    %edx,%edx
  100d46:	01 c2                	add    %eax,%edx
  100d48:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100d4b:	8b 04 c5 2c 5d 10 00 	mov    0x105d2c(,%eax,8),%eax
  100d52:	85 c0                	test   %eax,%eax
  100d54:	0f 84 c2 00 00 00    	je     100e1c <get_from+0x138>
  100d5a:	48                   	dec    %eax
  100d5b:	75 7f                	jne    100ddc <get_from+0xf8>
  100d5d:	be 24 33 10 00       	mov    $0x103324,%esi
  100d62:	3b 1e                	cmp    (%esi),%ebx
  100d64:	74 15                	je     100d7b <get_from+0x97>
  100d66:	83 ec 08             	sub    $0x8,%esp
  100d69:	68 d8 00 00 00       	push   $0xd8
  100d6e:	68 5e 19 10 00       	push   $0x10195e
  100d73:	e8 3c 0a 00 00       	call   1017b4 <abort>
  100d78:	83 c4 10             	add    $0x10,%esp
  100d7b:	89 d8                	mov    %ebx,%eax
  100d7d:	c1 e0 07             	shl    $0x7,%eax
  100d80:	01 d8                	add    %ebx,%eax
  100d82:	01 c0                	add    %eax,%eax
  100d84:	01 d8                	add    %ebx,%eax
  100d86:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100d89:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100d90:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100d96:	39 da                	cmp    %ebx,%edx
  100d98:	0f 84 8a 00 00 00    	je     100e28 <get_from+0x144>
  100d9e:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100da4:	89 c8                	mov    %ecx,%eax
  100da6:	c1 e0 07             	shl    $0x7,%eax
  100da9:	01 c8                	add    %ecx,%eax
  100dab:	01 c0                	add    %eax,%eax
  100dad:	01 c8                	add    %ecx,%eax
  100daf:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100db2:	89 14 c5 40 5d 10 00 	mov    %edx,0x105d40(,%eax,8)
  100db9:	89 d0                	mov    %edx,%eax
  100dbb:	c1 e0 07             	shl    $0x7,%eax
  100dbe:	01 d0                	add    %edx,%eax
  100dc0:	01 c0                	add    %eax,%eax
  100dc2:	01 d0                	add    %edx,%eax
  100dc4:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100dc7:	89 0c c5 3c 5d 10 00 	mov    %ecx,0x105d3c(,%eax,8)
  100dce:	89 16                	mov    %edx,(%esi)
  100dd0:	89 d8                	mov    %ebx,%eax
  100dd2:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100dd5:	5b                   	pop    %ebx
  100dd6:	5e                   	pop    %esi
  100dd7:	5d                   	pop    %ebp
  100dd8:	c3                   	ret    
  100dd9:	8d 76 00             	lea    0x0(%esi),%esi
  100ddc:	83 ec 08             	sub    $0x8,%esp
  100ddf:	68 d4 00 00 00       	push   $0xd4
  100de4:	68 5e 19 10 00       	push   $0x10195e
  100de9:	e8 c6 09 00 00       	call   1017b4 <abort>
  100dee:	a1 00 00 00 00       	mov    0x0,%eax
  100df3:	0f 0b                	ud2    
  100df5:	8d 76 00             	lea    0x0(%esi),%esi
  100df8:	83 ec 08             	sub    $0x8,%esp
  100dfb:	68 c5 00 00 00       	push   $0xc5
  100e00:	68 5e 19 10 00       	push   $0x10195e
  100e05:	e8 aa 09 00 00       	call   1017b4 <abort>
  100e0a:	83 c4 10             	add    $0x10,%esp
  100e0d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e12:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e15:	5b                   	pop    %ebx
  100e16:	5e                   	pop    %esi
  100e17:	5d                   	pop    %ebp
  100e18:	c3                   	ret    
  100e19:	8d 76 00             	lea    0x0(%esi),%esi
  100e1c:	be 20 33 10 00       	mov    $0x103320,%esi
  100e21:	e9 3c ff ff ff       	jmp    100d62 <get_from+0x7e>
  100e26:	66 90                	xchg   %ax,%ax
  100e28:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100e2e:	89 d8                	mov    %ebx,%eax
  100e30:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e33:	5b                   	pop    %ebx
  100e34:	5e                   	pop    %esi
  100e35:	5d                   	pop    %ebp
  100e36:	c3                   	ret    
  100e37:	90                   	nop

00100e38 <get_from_block>:
  100e38:	55                   	push   %ebp
  100e39:	89 e5                	mov    %esp,%ebp
  100e3b:	83 ec 10             	sub    $0x10,%esp
  100e3e:	ff 75 08             	pushl  0x8(%ebp)
  100e41:	ff 35 20 33 10 00    	pushl  0x103320
  100e47:	e8 98 fe ff ff       	call   100ce4 <get_from>
  100e4c:	83 c4 10             	add    $0x10,%esp
  100e4f:	40                   	inc    %eax
  100e50:	74 0a                	je     100e5c <get_from_block+0x24>
  100e52:	b8 01 00 00 00       	mov    $0x1,%eax
  100e57:	c9                   	leave  
  100e58:	c3                   	ret    
  100e59:	8d 76 00             	lea    0x0(%esi),%esi
  100e5c:	83 ec 08             	sub    $0x8,%esp
  100e5f:	68 0f 01 00 00       	push   $0x10f
  100e64:	68 5e 19 10 00       	push   $0x10195e
  100e69:	e8 46 09 00 00       	call   1017b4 <abort>
  100e6e:	83 c4 10             	add    $0x10,%esp
  100e71:	b8 01 00 00 00       	mov    $0x1,%eax
  100e76:	c9                   	leave  
  100e77:	c3                   	ret    

00100e78 <check_block>:
  100e78:	55                   	push   %ebp
  100e79:	89 e5                	mov    %esp,%ebp
  100e7b:	57                   	push   %edi
  100e7c:	56                   	push   %esi
  100e7d:	53                   	push   %ebx
  100e7e:	83 ec 0c             	sub    $0xc,%esp
  100e81:	a1 20 33 10 00       	mov    0x103320,%eax
  100e86:	89 c6                	mov    %eax,%esi
  100e88:	83 f8 ff             	cmp    $0xffffffff,%eax
  100e8b:	74 58                	je     100ee5 <check_block+0x6d>
  100e8d:	89 c2                	mov    %eax,%edx
  100e8f:	c1 e2 07             	shl    $0x7,%edx
  100e92:	01 c2                	add    %eax,%edx
  100e94:	01 d2                	add    %edx,%edx
  100e96:	01 c2                	add    %eax,%edx
  100e98:	8d 3c 90             	lea    (%eax,%edx,4),%edi
  100e9b:	eb 0c                	jmp    100ea9 <check_block+0x31>
  100e9d:	8d 76 00             	lea    0x0(%esi),%esi
  100ea0:	39 c6                	cmp    %eax,%esi
  100ea2:	74 3c                	je     100ee0 <check_block+0x68>
  100ea4:	83 f8 ff             	cmp    $0xffffffff,%eax
  100ea7:	74 37                	je     100ee0 <check_block+0x68>
  100ea9:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
  100eb0:	8b 8b 34 5d 10 00    	mov    0x105d34(%ebx),%ecx
  100eb6:	85 c9                	test   %ecx,%ecx
  100eb8:	7f e6                	jg     100ea0 <check_block+0x28>
  100eba:	83 ec 0c             	sub    $0xc,%esp
  100ebd:	56                   	push   %esi
  100ebe:	e8 75 ff ff ff       	call   100e38 <get_from_block>
  100ec3:	58                   	pop    %eax
  100ec4:	5a                   	pop    %edx
  100ec5:	81 c3 e0 5c 10 00    	add    $0x105ce0,%ebx
  100ecb:	53                   	push   %ebx
  100ecc:	56                   	push   %esi
  100ecd:	e8 02 fc ff ff       	call   100ad4 <put_into_runnable>
  100ed2:	83 c4 10             	add    $0x10,%esp
  100ed5:	a1 20 33 10 00       	mov    0x103320,%eax
  100eda:	39 c6                	cmp    %eax,%esi
  100edc:	75 c6                	jne    100ea4 <check_block+0x2c>
  100ede:	66 90                	xchg   %ax,%ax
  100ee0:	be 01 00 00 00       	mov    $0x1,%esi
  100ee5:	89 f0                	mov    %esi,%eax
  100ee7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100eea:	5b                   	pop    %ebx
  100eeb:	5e                   	pop    %esi
  100eec:	5f                   	pop    %edi
  100eed:	5d                   	pop    %ebp
  100eee:	c3                   	ret    
  100eef:	90                   	nop

00100ef0 <checkTimeCount>:
  100ef0:	a1 c4 3c 10 00       	mov    0x103cc4,%eax
  100ef5:	85 c0                	test   %eax,%eax
  100ef7:	0f 84 fb 00 00 00    	je     100ff8 <checkTimeCount+0x108>
  100efd:	55                   	push   %ebp
  100efe:	89 e5                	mov    %esp,%ebp
  100f00:	57                   	push   %edi
  100f01:	56                   	push   %esi
  100f02:	83 ec 0c             	sub    $0xc,%esp
  100f05:	68 80 18 10 00       	push   $0x101880
  100f0a:	e8 31 07 00 00       	call   101640 <printk>
  100f0f:	5e                   	pop    %esi
  100f10:	ff 35 c0 3c 10 00    	pushl  0x103cc0
  100f16:	68 80 1a 10 00       	push   $0x101a80
  100f1b:	6a 37                	push   $0x37
  100f1d:	68 5e 19 10 00       	push   $0x10195e
  100f22:	68 8a 19 10 00       	push   $0x10198a
  100f27:	e8 14 07 00 00       	call   101640 <printk>
  100f2c:	83 c4 14             	add    $0x14,%esp
  100f2f:	68 af 18 10 00       	push   $0x1018af
  100f34:	e8 07 07 00 00       	call   101640 <printk>
  100f39:	c7 04 24 80 18 10 00 	movl   $0x101880,(%esp)
  100f40:	e8 fb 06 00 00       	call   101640 <printk>
  100f45:	5f                   	pop    %edi
  100f46:	8b 15 c0 3c 10 00    	mov    0x103cc0,%edx
  100f4c:	89 d0                	mov    %edx,%eax
  100f4e:	c1 e0 07             	shl    $0x7,%eax
  100f51:	01 d0                	add    %edx,%eax
  100f53:	01 c0                	add    %eax,%eax
  100f55:	01 d0                	add    %edx,%eax
  100f57:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100f5a:	ff 34 c5 30 5d 10 00 	pushl  0x105d30(,%eax,8)
  100f61:	68 80 1a 10 00       	push   $0x101a80
  100f66:	6a 38                	push   $0x38
  100f68:	68 5e 19 10 00       	push   $0x10195e
  100f6d:	68 38 1a 10 00       	push   $0x101a38
  100f72:	e8 c9 06 00 00       	call   101640 <printk>
  100f77:	83 c4 14             	add    $0x14,%esp
  100f7a:	68 af 18 10 00       	push   $0x1018af
  100f7f:	e8 bc 06 00 00       	call   101640 <printk>
  100f84:	e8 ef fe ff ff       	call   100e78 <check_block>
  100f89:	8b 15 c0 3c 10 00    	mov    0x103cc0,%edx
  100f8f:	89 d0                	mov    %edx,%eax
  100f91:	c1 e0 07             	shl    $0x7,%eax
  100f94:	01 d0                	add    %edx,%eax
  100f96:	01 c0                	add    %eax,%eax
  100f98:	01 d0                	add    %edx,%eax
  100f9a:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100f9d:	c1 e0 03             	shl    $0x3,%eax
  100fa0:	83 c4 10             	add    $0x10,%esp
  100fa3:	8b 88 30 5d 10 00    	mov    0x105d30(%eax),%ecx
  100fa9:	85 c9                	test   %ecx,%ecx
  100fab:	7e 0f                	jle    100fbc <checkTimeCount+0xcc>
  100fad:	b8 01 00 00 00       	mov    $0x1,%eax
  100fb2:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100fb5:	5e                   	pop    %esi
  100fb6:	5f                   	pop    %edi
  100fb7:	5d                   	pop    %ebp
  100fb8:	c3                   	ret    
  100fb9:	8d 76 00             	lea    0x0(%esi),%esi
  100fbc:	05 e0 5c 10 00       	add    $0x105ce0,%eax
  100fc1:	b9 13 00 00 00       	mov    $0x13,%ecx
  100fc6:	89 c7                	mov    %eax,%edi
  100fc8:	8b 75 08             	mov    0x8(%ebp),%esi
  100fcb:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100fcd:	83 ec 08             	sub    $0x8,%esp
  100fd0:	ff 75 08             	pushl  0x8(%ebp)
  100fd3:	52                   	push   %edx
  100fd4:	e8 fb fa ff ff       	call   100ad4 <put_into_runnable>
  100fd9:	e8 36 fa ff ff       	call   100a14 <get_from_runnable>
  100fde:	5a                   	pop    %edx
  100fdf:	59                   	pop    %ecx
  100fe0:	ff 75 08             	pushl  0x8(%ebp)
  100fe3:	50                   	push   %eax
  100fe4:	e8 5f f8 ff ff       	call   100848 <put_into_running>
  100fe9:	83 c4 10             	add    $0x10,%esp
  100fec:	b8 01 00 00 00       	mov    $0x1,%eax
  100ff1:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100ff4:	5e                   	pop    %esi
  100ff5:	5f                   	pop    %edi
  100ff6:	5d                   	pop    %ebp
  100ff7:	c3                   	ret    
  100ff8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100ffd:	c3                   	ret    
  100ffe:	66 90                	xchg   %ax,%ax

00101000 <check_is_in>:
  101000:	55                   	push   %ebp
  101001:	89 e5                	mov    %esp,%ebp
  101003:	53                   	push   %ebx
  101004:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101007:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  10100a:	85 c9                	test   %ecx,%ecx
  10100c:	7e 4a                	jle    101058 <check_is_in+0x58>
  10100e:	39 d9                	cmp    %ebx,%ecx
  101010:	74 3b                	je     10104d <check_is_in+0x4d>
  101012:	89 c8                	mov    %ecx,%eax
  101014:	c1 e0 07             	shl    $0x7,%eax
  101017:	01 c8                	add    %ecx,%eax
  101019:	01 c0                	add    %eax,%eax
  10101b:	01 c8                	add    %ecx,%eax
  10101d:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  101020:	8b 14 c5 40 5d 10 00 	mov    0x105d40(,%eax,8),%edx
  101027:	39 d1                	cmp    %edx,%ecx
  101029:	75 1e                	jne    101049 <check_is_in+0x49>
  10102b:	eb 2b                	jmp    101058 <check_is_in+0x58>
  10102d:	8d 76 00             	lea    0x0(%esi),%esi
  101030:	89 d0                	mov    %edx,%eax
  101032:	c1 e0 07             	shl    $0x7,%eax
  101035:	01 d0                	add    %edx,%eax
  101037:	01 c0                	add    %eax,%eax
  101039:	01 d0                	add    %edx,%eax
  10103b:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10103e:	8b 14 c5 40 5d 10 00 	mov    0x105d40(,%eax,8),%edx
  101045:	39 d1                	cmp    %edx,%ecx
  101047:	74 0f                	je     101058 <check_is_in+0x58>
  101049:	39 d3                	cmp    %edx,%ebx
  10104b:	75 e3                	jne    101030 <check_is_in+0x30>
  10104d:	b8 01 00 00 00       	mov    $0x1,%eax
  101052:	5b                   	pop    %ebx
  101053:	5d                   	pop    %ebp
  101054:	c3                   	ret    
  101055:	8d 76 00             	lea    0x0(%esi),%esi
  101058:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10105d:	5b                   	pop    %ebx
  10105e:	5d                   	pop    %ebp
  10105f:	c3                   	ret    

00101060 <block_decrease>:
  101060:	55                   	push   %ebp
  101061:	89 e5                	mov    %esp,%ebp
  101063:	8b 0d 20 33 10 00    	mov    0x103320,%ecx
  101069:	83 f9 ff             	cmp    $0xffffffff,%ecx
  10106c:	74 2e                	je     10109c <block_decrease+0x3c>
  10106e:	89 ca                	mov    %ecx,%edx
  101070:	89 d0                	mov    %edx,%eax
  101072:	c1 e0 07             	shl    $0x7,%eax
  101075:	01 d0                	add    %edx,%eax
  101077:	01 c0                	add    %eax,%eax
  101079:	01 d0                	add    %edx,%eax
  10107b:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10107e:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  101085:	ff 88 54 20 00 00    	decl   0x2054(%eax)
  10108b:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  101091:	39 d1                	cmp    %edx,%ecx
  101093:	75 db                	jne    101070 <block_decrease+0x10>
  101095:	b8 01 00 00 00       	mov    $0x1,%eax
  10109a:	5d                   	pop    %ebp
  10109b:	c3                   	ret    
  10109c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1010a1:	5d                   	pop    %ebp
  1010a2:	c3                   	ret    
  1010a3:	90                   	nop

001010a4 <init_pcb>:
  1010a4:	55                   	push   %ebp
  1010a5:	89 e5                	mov    %esp,%ebp
  1010a7:	c7 05 c8 3c 10 00 05 	movl   $0x5,0x103cc8
  1010ae:	00 00 00 
  1010b1:	ba 38 5d 10 00       	mov    $0x105d38,%edx
  1010b6:	31 c0                	xor    %eax,%eax
  1010b8:	89 02                	mov    %eax,(%edx)
  1010ba:	8d 48 ff             	lea    -0x1(%eax),%ecx
  1010bd:	89 4a 04             	mov    %ecx,0x4(%edx)
  1010c0:	40                   	inc    %eax
  1010c1:	89 42 08             	mov    %eax,0x8(%edx)
  1010c4:	81 c2 68 20 00 00    	add    $0x2068,%edx
  1010ca:	3d 00 08 00 00       	cmp    $0x800,%eax
  1010cf:	75 e7                	jne    1010b8 <init_pcb+0x14>
  1010d1:	c7 05 3c 5d 10 00 ff 	movl   $0x7ff,0x105d3c
  1010d8:	07 00 00 
  1010db:	c7 05 d8 7c 13 01 00 	movl   $0x0,0x1137cd8
  1010e2:	00 00 00 
  1010e5:	5d                   	pop    %ebp
  1010e6:	c3                   	ret    
  1010e7:	90                   	nop

001010e8 <init_kernel_pcb>:
  1010e8:	55                   	push   %ebp
  1010e9:	89 e5                	mov    %esp,%ebp
  1010eb:	c7 05 28 5d 10 00 10 	movl   $0x10,0x105d28
  1010f2:	00 00 00 
  1010f5:	c7 05 1c 5d 10 00 08 	movl   $0x8,0x105d1c
  1010fc:	00 00 00 
  1010ff:	c7 05 18 5d 10 00 40 	movl   $0x100840,0x105d18
  101106:	08 10 00 
  101109:	c7 05 24 5d 10 00 00 	movl   $0x7f00000,0x105d24
  101110:	00 f0 07 
  101113:	c7 05 2c 5d 10 00 01 	movl   $0x1,0x105d2c
  10111a:	00 00 00 
  10111d:	c7 05 30 5d 10 00 04 	movl   $0x4,0x105d30
  101124:	00 00 00 
  101127:	b8 01 00 00 00       	mov    $0x1,%eax
  10112c:	5d                   	pop    %ebp
  10112d:	c3                   	ret    
  10112e:	66 90                	xchg   %ax,%ax

00101130 <transfer_pid_state>:
  101130:	55                   	push   %ebp
  101131:	89 e5                	mov    %esp,%ebp
  101133:	b8 01 00 00 00       	mov    $0x1,%eax
  101138:	5d                   	pop    %ebp
  101139:	c3                   	ret    
  10113a:	66 90                	xchg   %ax,%ax

0010113c <make_pcb>:
  10113c:	55                   	push   %ebp
  10113d:	89 e5                	mov    %esp,%ebp
  10113f:	57                   	push   %edi
  101140:	56                   	push   %esi
  101141:	8b 55 08             	mov    0x8(%ebp),%edx
  101144:	89 d0                	mov    %edx,%eax
  101146:	c1 e0 07             	shl    $0x7,%eax
  101149:	01 d0                	add    %edx,%eax
  10114b:	01 c0                	add    %eax,%eax
  10114d:	01 d0                	add    %edx,%eax
  10114f:	8d 14 82             	lea    (%edx,%eax,4),%edx
  101152:	c1 e2 03             	shl    $0x3,%edx
  101155:	8d 82 e0 5c 10 00    	lea    0x105ce0(%edx),%eax
  10115b:	b9 13 00 00 00       	mov    $0x13,%ecx
  101160:	89 c7                	mov    %eax,%edi
  101162:	8b 75 0c             	mov    0xc(%ebp),%esi
  101165:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101167:	8b 45 10             	mov    0x10(%ebp),%eax
  10116a:	89 82 2c 5d 10 00    	mov    %eax,0x105d2c(%edx)
  101170:	8b 45 14             	mov    0x14(%ebp),%eax
  101173:	89 82 30 5d 10 00    	mov    %eax,0x105d30(%edx)
  101179:	8b 45 18             	mov    0x18(%ebp),%eax
  10117c:	89 82 34 5d 10 00    	mov    %eax,0x105d34(%edx)
  101182:	8b 45 0c             	mov    0xc(%ebp),%eax
  101185:	89 82 44 5d 10 00    	mov    %eax,0x105d44(%edx)
  10118b:	b8 01 00 00 00       	mov    $0x1,%eax
  101190:	5e                   	pop    %esi
  101191:	5f                   	pop    %edi
  101192:	5d                   	pop    %ebp
  101193:	c3                   	ret    

00101194 <initIdt>:
  101194:	55                   	push   %ebp
  101195:	89 e5                	mov    %esp,%ebp
  101197:	53                   	push   %ebx
  101198:	ba 4b 18 10 00       	mov    $0x10184b,%edx
  10119d:	89 d3                	mov    %edx,%ebx
  10119f:	c1 ea 10             	shr    $0x10,%edx
  1011a2:	b9 a0 85 13 01       	mov    $0x11385a0,%ecx
  1011a7:	b8 a0 7d 13 01       	mov    $0x1137da0,%eax
  1011ac:	66 89 18             	mov    %bx,(%eax)
  1011af:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  1011b5:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  1011b9:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  1011bd:	66 89 50 06          	mov    %dx,0x6(%eax)
  1011c1:	83 c0 08             	add    $0x8,%eax
  1011c4:	39 c1                	cmp    %eax,%ecx
  1011c6:	75 e4                	jne    1011ac <initIdt+0x18>
  1011c8:	b8 51 18 10 00       	mov    $0x101851,%eax
  1011cd:	66 a3 08 7e 13 01    	mov    %ax,0x1137e08
  1011d3:	66 c7 05 0a 7e 13 01 	movw   $0x8,0x1137e0a
  1011da:	08 00 
  1011dc:	c6 05 0c 7e 13 01 00 	movb   $0x0,0x1137e0c
  1011e3:	c6 05 0d 7e 13 01 8f 	movb   $0x8f,0x1137e0d
  1011ea:	c1 e8 10             	shr    $0x10,%eax
  1011ed:	66 a3 0e 7e 13 01    	mov    %ax,0x1137e0e
  1011f3:	b8 55 18 10 00       	mov    $0x101855,%eax
  1011f8:	66 a3 a0 81 13 01    	mov    %ax,0x11381a0
  1011fe:	66 c7 05 a2 81 13 01 	movw   $0x8,0x11381a2
  101205:	08 00 
  101207:	c6 05 a4 81 13 01 00 	movb   $0x0,0x11381a4
  10120e:	c6 05 a5 81 13 01 ee 	movb   $0xee,0x11381a5
  101215:	c1 e8 10             	shr    $0x10,%eax
  101218:	66 a3 a6 81 13 01    	mov    %ax,0x11381a6
  10121e:	b8 5e 18 10 00       	mov    $0x10185e,%eax
  101223:	66 a3 a0 7e 13 01    	mov    %ax,0x1137ea0
  101229:	66 c7 05 a2 7e 13 01 	movw   $0x8,0x1137ea2
  101230:	08 00 
  101232:	c6 05 a4 7e 13 01 00 	movb   $0x0,0x1137ea4
  101239:	c6 05 a5 7e 13 01 8e 	movb   $0x8e,0x1137ea5
  101240:	c1 e8 10             	shr    $0x10,%eax
  101243:	66 a3 a6 7e 13 01    	mov    %ax,0x1137ea6
  101249:	66 c7 05 50 34 10 00 	movw   $0x7ff,0x103450
  101250:	ff 07 
  101252:	b8 a0 7d 13 01       	mov    $0x1137da0,%eax
  101257:	66 a3 52 34 10 00    	mov    %ax,0x103452
  10125d:	c1 e8 10             	shr    $0x10,%eax
  101260:	66 a3 54 34 10 00    	mov    %ax,0x103454
  101266:	b8 50 34 10 00       	mov    $0x103450,%eax
  10126b:	0f 01 18             	lidtl  (%eax)
  10126e:	5b                   	pop    %ebx
  10126f:	5d                   	pop    %ebp
  101270:	c3                   	ret    
  101271:	66 90                	xchg   %ax,%ax
  101273:	90                   	nop

00101274 <syscallHandle>:
  101274:	55                   	push   %ebp
  101275:	89 e5                	mov    %esp,%ebp
  101277:	53                   	push   %ebx
  101278:	50                   	push   %eax
  101279:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10127c:	8b 43 2c             	mov    0x2c(%ebx),%eax
  10127f:	83 f8 02             	cmp    $0x2,%eax
  101282:	74 28                	je     1012ac <syscallHandle+0x38>
  101284:	76 3a                	jbe    1012c0 <syscallHandle+0x4c>
  101286:	83 f8 04             	cmp    $0x4,%eax
  101289:	74 15                	je     1012a0 <syscallHandle+0x2c>
  10128b:	3d e6 00 00 00       	cmp    $0xe6,%eax
  101290:	75 29                	jne    1012bb <syscallHandle+0x47>
  101292:	89 5d 08             	mov    %ebx,0x8(%ebp)
  101295:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101298:	c9                   	leave  
  101299:	e9 ca f2 ff ff       	jmp    100568 <sys_sleep>
  10129e:	66 90                	xchg   %ax,%ax
  1012a0:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1012a3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012a6:	c9                   	leave  
  1012a7:	e9 ec f4 ff ff       	jmp    100798 <sys_write>
  1012ac:	83 ec 0c             	sub    $0xc,%esp
  1012af:	53                   	push   %ebx
  1012b0:	e8 37 f3 ff ff       	call   1005ec <sys_fork>
  1012b5:	89 43 2c             	mov    %eax,0x2c(%ebx)
  1012b8:	83 c4 10             	add    $0x10,%esp
  1012bb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012be:	c9                   	leave  
  1012bf:	c3                   	ret    
  1012c0:	48                   	dec    %eax
  1012c1:	75 f8                	jne    1012bb <syscallHandle+0x47>
  1012c3:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1012c6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012c9:	c9                   	leave  
  1012ca:	e9 71 f2 ff ff       	jmp    100540 <sys_exit>
  1012cf:	90                   	nop

001012d0 <GProtectFaultHandle>:
  1012d0:	55                   	push   %ebp
  1012d1:	89 e5                	mov    %esp,%ebp
  1012d3:	83 ec 14             	sub    $0x14,%esp
  1012d6:	68 80 18 10 00       	push   $0x101880
  1012db:	e8 60 03 00 00       	call   101640 <printk>
  1012e0:	58                   	pop    %eax
  1012e1:	8b 45 08             	mov    0x8(%ebp),%eax
  1012e4:	ff 70 30             	pushl  0x30(%eax)
  1012e7:	68 f4 1a 10 00       	push   $0x101af4
  1012ec:	6a 73                	push   $0x73
  1012ee:	68 a1 1a 10 00       	push   $0x101aa1
  1012f3:	68 b4 1a 10 00       	push   $0x101ab4
  1012f8:	e8 43 03 00 00       	call   101640 <printk>
  1012fd:	83 c4 14             	add    $0x14,%esp
  101300:	68 af 18 10 00       	push   $0x1018af
  101305:	e8 36 03 00 00       	call   101640 <printk>
  10130a:	5a                   	pop    %edx
  10130b:	59                   	pop    %ecx
  10130c:	6a 74                	push   $0x74
  10130e:	68 a1 1a 10 00       	push   $0x101aa1
  101313:	e8 9c 04 00 00       	call   1017b4 <abort>
  101318:	83 c4 10             	add    $0x10,%esp
  10131b:	c9                   	leave  
  10131c:	c3                   	ret    
  10131d:	8d 76 00             	lea    0x0(%esi),%esi

00101320 <timeHandle>:
  101320:	55                   	push   %ebp
  101321:	89 e5                	mov    %esp,%ebp
  101323:	53                   	push   %ebx
  101324:	83 ec 10             	sub    $0x10,%esp
  101327:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10132a:	6a 41                	push   $0x41
  10132c:	e8 f3 f4 ff ff       	call   100824 <putChar>
  101331:	e8 ae f6 ff ff       	call   1009e4 <getpid>
  101336:	89 c2                	mov    %eax,%edx
  101338:	c1 e2 07             	shl    $0x7,%edx
  10133b:	01 c2                	add    %eax,%edx
  10133d:	01 d2                	add    %edx,%edx
  10133f:	01 c2                	add    %eax,%edx
  101341:	8d 04 90             	lea    (%eax,%edx,4),%eax
  101344:	ff 0c c5 30 5d 10 00 	decl   0x105d30(,%eax,8)
  10134b:	e8 10 fd ff ff       	call   101060 <block_decrease>
  101350:	89 1c 24             	mov    %ebx,(%esp)
  101353:	e8 98 fb ff ff       	call   100ef0 <checkTimeCount>
  101358:	83 c4 10             	add    $0x10,%esp
  10135b:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  101362:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101365:	c9                   	leave  
  101366:	e9 b9 f4 ff ff       	jmp    100824 <putChar>
  10136b:	90                   	nop

0010136c <irqHandle>:
  10136c:	55                   	push   %ebp
  10136d:	89 e5                	mov    %esp,%ebp
  10136f:	57                   	push   %edi
  101370:	56                   	push   %esi
  101371:	53                   	push   %ebx
  101372:	83 ec 0c             	sub    $0xc,%esp
  101375:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101378:	b8 10 00 00 00       	mov    $0x10,%eax
  10137d:	89 c0                	mov    %eax,%eax
  10137f:	8e d8                	mov    %eax,%ds
  101381:	8e e0                	mov    %eax,%fs
  101383:	8e c0                	mov    %eax,%es
  101385:	b8 30 00 00 00       	mov    $0x30,%eax
  10138a:	89 c0                	mov    %eax,%eax
  10138c:	8e e8                	mov    %eax,%gs
  10138e:	89 ee                	mov    %ebp,%esi
  101390:	3b 5e 08             	cmp    0x8(%esi),%ebx
  101393:	74 12                	je     1013a7 <irqHandle+0x3b>
  101395:	83 ec 08             	sub    $0x8,%esp
  101398:	6a 1f                	push   $0x1f
  10139a:	68 a1 1a 10 00       	push   $0x101aa1
  10139f:	e8 10 04 00 00       	call   1017b4 <abort>
  1013a4:	83 c4 10             	add    $0x10,%esp
  1013a7:	e8 38 f6 ff ff       	call   1009e4 <getpid>
  1013ac:	89 c7                	mov    %eax,%edi
  1013ae:	fa                   	cli    
  1013af:	8b 43 30             	mov    0x30(%ebx),%eax
  1013b2:	83 f8 0d             	cmp    $0xd,%eax
  1013b5:	0f 84 f1 00 00 00    	je     1014ac <irqHandle+0x140>
  1013bb:	0f 8e 97 00 00 00    	jle    101458 <irqHandle+0xec>
  1013c1:	83 f8 20             	cmp    $0x20,%eax
  1013c4:	74 2e                	je     1013f4 <irqHandle+0x88>
  1013c6:	83 c0 80             	add    $0xffffff80,%eax
  1013c9:	0f 85 8c 00 00 00    	jne    10145b <irqHandle+0xef>
  1013cf:	83 ec 0c             	sub    $0xc,%esp
  1013d2:	53                   	push   %ebx
  1013d3:	e8 9c fe ff ff       	call   101274 <syscallHandle>
  1013d8:	8b 43 30             	mov    0x30(%ebx),%eax
  1013db:	83 c4 10             	add    $0x10,%esp
  1013de:	3d 80 00 00 00       	cmp    $0x80,%eax
  1013e3:	74 27                	je     10140c <irqHandle+0xa0>
  1013e5:	83 f8 20             	cmp    $0x20,%eax
  1013e8:	74 22                	je     10140c <irqHandle+0xa0>
  1013ea:	fb                   	sti    
  1013eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1013ee:	5b                   	pop    %ebx
  1013ef:	5e                   	pop    %esi
  1013f0:	5f                   	pop    %edi
  1013f1:	5d                   	pop    %ebp
  1013f2:	c3                   	ret    
  1013f3:	90                   	nop
  1013f4:	83 ec 0c             	sub    $0xc,%esp
  1013f7:	53                   	push   %ebx
  1013f8:	e8 23 ff ff ff       	call   101320 <timeHandle>
  1013fd:	8b 43 30             	mov    0x30(%ebx),%eax
  101400:	83 c4 10             	add    $0x10,%esp
  101403:	3d 80 00 00 00       	cmp    $0x80,%eax
  101408:	75 db                	jne    1013e5 <irqHandle+0x79>
  10140a:	66 90                	xchg   %ax,%ax
  10140c:	e8 d3 f5 ff ff       	call   1009e4 <getpid>
  101411:	39 c7                	cmp    %eax,%edi
  101413:	74 d5                	je     1013ea <irqHandle+0x7e>
  101415:	e8 ca f5 ff ff       	call   1009e4 <getpid>
  10141a:	89 c2                	mov    %eax,%edx
  10141c:	c1 e2 07             	shl    $0x7,%edx
  10141f:	01 c2                	add    %eax,%edx
  101421:	01 d2                	add    %edx,%edx
  101423:	01 c2                	add    %eax,%edx
  101425:	8d 04 90             	lea    (%eax,%edx,4),%eax
  101428:	8d 1c c5 90 5c 10 00 	lea    0x105c90(,%eax,8),%ebx
  10142f:	89 5e 08             	mov    %ebx,0x8(%esi)
  101432:	e8 ad f5 ff ff       	call   1009e4 <getpid>
  101437:	89 c2                	mov    %eax,%edx
  101439:	c1 e2 07             	shl    $0x7,%edx
  10143c:	01 c2                	add    %eax,%edx
  10143e:	01 d2                	add    %edx,%edx
  101440:	01 c2                	add    %eax,%edx
  101442:	8d 04 90             	lea    (%eax,%edx,4),%eax
  101445:	8d 34 c5 e0 5c 10 00 	lea    0x105ce0(,%eax,8),%esi
  10144c:	b9 13 00 00 00       	mov    $0x13,%ecx
  101451:	89 df                	mov    %ebx,%edi
  101453:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101455:	eb 93                	jmp    1013ea <irqHandle+0x7e>
  101457:	90                   	nop
  101458:	40                   	inc    %eax
  101459:	74 8f                	je     1013ea <irqHandle+0x7e>
  10145b:	83 ec 0c             	sub    $0xc,%esp
  10145e:	68 80 18 10 00       	push   $0x101880
  101463:	e8 d8 01 00 00       	call   101640 <printk>
  101468:	58                   	pop    %eax
  101469:	5a                   	pop    %edx
  10146a:	ff 73 38             	pushl  0x38(%ebx)
  10146d:	ff 73 30             	pushl  0x30(%ebx)
  101470:	68 08 1b 10 00       	push   $0x101b08
  101475:	6a 36                	push   $0x36
  101477:	68 a1 1a 10 00       	push   $0x101aa1
  10147c:	68 cc 1a 10 00       	push   $0x101acc
  101481:	e8 ba 01 00 00       	call   101640 <printk>
  101486:	83 c4 14             	add    $0x14,%esp
  101489:	68 af 18 10 00       	push   $0x1018af
  10148e:	e8 ad 01 00 00       	call   101640 <printk>
  101493:	59                   	pop    %ecx
  101494:	58                   	pop    %eax
  101495:	6a 37                	push   $0x37
  101497:	68 a1 1a 10 00       	push   $0x101aa1
  10149c:	e8 13 03 00 00       	call   1017b4 <abort>
  1014a1:	8b 43 30             	mov    0x30(%ebx),%eax
  1014a4:	83 c4 10             	add    $0x10,%esp
  1014a7:	e9 32 ff ff ff       	jmp    1013de <irqHandle+0x72>
  1014ac:	83 ec 0c             	sub    $0xc,%esp
  1014af:	53                   	push   %ebx
  1014b0:	e8 1b fe ff ff       	call   1012d0 <GProtectFaultHandle>
  1014b5:	8b 43 30             	mov    0x30(%ebx),%eax
  1014b8:	83 c4 10             	add    $0x10,%esp
  1014bb:	e9 1e ff ff ff       	jmp    1013de <irqHandle+0x72>

001014c0 <initIntr>:
  1014c0:	55                   	push   %ebp
  1014c1:	89 e5                	mov    %esp,%ebp
  1014c3:	ba 21 00 00 00       	mov    $0x21,%edx
  1014c8:	b0 ff                	mov    $0xff,%al
  1014ca:	ee                   	out    %al,(%dx)
  1014cb:	ba a1 00 00 00       	mov    $0xa1,%edx
  1014d0:	ee                   	out    %al,(%dx)
  1014d1:	ba 20 00 00 00       	mov    $0x20,%edx
  1014d6:	b0 11                	mov    $0x11,%al
  1014d8:	ee                   	out    %al,(%dx)
  1014d9:	ba 21 00 00 00       	mov    $0x21,%edx
  1014de:	b0 20                	mov    $0x20,%al
  1014e0:	ee                   	out    %al,(%dx)
  1014e1:	b0 04                	mov    $0x4,%al
  1014e3:	ee                   	out    %al,(%dx)
  1014e4:	b0 03                	mov    $0x3,%al
  1014e6:	ee                   	out    %al,(%dx)
  1014e7:	ba a0 00 00 00       	mov    $0xa0,%edx
  1014ec:	b0 11                	mov    $0x11,%al
  1014ee:	ee                   	out    %al,(%dx)
  1014ef:	ba a1 00 00 00       	mov    $0xa1,%edx
  1014f4:	b0 28                	mov    $0x28,%al
  1014f6:	ee                   	out    %al,(%dx)
  1014f7:	b0 02                	mov    $0x2,%al
  1014f9:	ee                   	out    %al,(%dx)
  1014fa:	b0 03                	mov    $0x3,%al
  1014fc:	ee                   	out    %al,(%dx)
  1014fd:	ba 20 00 00 00       	mov    $0x20,%edx
  101502:	b0 68                	mov    $0x68,%al
  101504:	ee                   	out    %al,(%dx)
  101505:	b0 0a                	mov    $0xa,%al
  101507:	ee                   	out    %al,(%dx)
  101508:	ba a0 00 00 00       	mov    $0xa0,%edx
  10150d:	b0 68                	mov    $0x68,%al
  10150f:	ee                   	out    %al,(%dx)
  101510:	b0 0a                	mov    $0xa,%al
  101512:	ee                   	out    %al,(%dx)
  101513:	5d                   	pop    %ebp
  101514:	c3                   	ret    
  101515:	8d 76 00             	lea    0x0(%esi),%esi

00101518 <initTimer>:
  101518:	55                   	push   %ebp
  101519:	89 e5                	mov    %esp,%ebp
  10151b:	ba 43 00 00 00       	mov    $0x43,%edx
  101520:	b0 34                	mov    $0x34,%al
  101522:	ee                   	out    %al,(%dx)
  101523:	ba 40 00 00 00       	mov    $0x40,%edx
  101528:	b0 9b                	mov    $0x9b,%al
  10152a:	ee                   	out    %al,(%dx)
  10152b:	b0 2e                	mov    $0x2e,%al
  10152d:	ee                   	out    %al,(%dx)
  10152e:	5d                   	pop    %ebp
  10152f:	c3                   	ret    

00101530 <i2A>:
  101530:	55                   	push   %ebp
  101531:	89 e5                	mov    %esp,%ebp
  101533:	57                   	push   %edi
  101534:	56                   	push   %esi
  101535:	53                   	push   %ebx
  101536:	51                   	push   %ecx
  101537:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10153a:	85 c9                	test   %ecx,%ecx
  10153c:	78 6e                	js     1015ac <i2A+0x7c>
  10153e:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  101542:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  101546:	bb 9e 34 10 00       	mov    $0x10349e,%ebx
  10154b:	31 ff                	xor    %edi,%edi
  10154d:	eb 03                	jmp    101552 <i2A+0x22>
  10154f:	90                   	nop
  101550:	89 f7                	mov    %esi,%edi
  101552:	4b                   	dec    %ebx
  101553:	89 c8                	mov    %ecx,%eax
  101555:	be 0a 00 00 00       	mov    $0xa,%esi
  10155a:	99                   	cltd   
  10155b:	f7 fe                	idiv   %esi
  10155d:	83 c2 30             	add    $0x30,%edx
  101560:	88 13                	mov    %dl,(%ebx)
  101562:	8d 77 01             	lea    0x1(%edi),%esi
  101565:	b8 67 66 66 66       	mov    $0x66666667,%eax
  10156a:	f7 e9                	imul   %ecx
  10156c:	89 d0                	mov    %edx,%eax
  10156e:	c1 f8 02             	sar    $0x2,%eax
  101571:	c1 f9 1f             	sar    $0x1f,%ecx
  101574:	29 c8                	sub    %ecx,%eax
  101576:	89 c1                	mov    %eax,%ecx
  101578:	75 d6                	jne    101550 <i2A+0x20>
  10157a:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  10157e:	74 20                	je     1015a0 <i2A+0x70>
  101580:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  101584:	75 06                	jne    10158c <i2A+0x5c>
  101586:	fe 05 9d 34 10 00    	incb   0x10349d
  10158c:	c6 05 9e 34 10 00 00 	movb   $0x0,0x10349e
  101593:	8b 45 0c             	mov    0xc(%ebp),%eax
  101596:	89 18                	mov    %ebx,(%eax)
  101598:	89 f0                	mov    %esi,%eax
  10159a:	5a                   	pop    %edx
  10159b:	5b                   	pop    %ebx
  10159c:	5e                   	pop    %esi
  10159d:	5f                   	pop    %edi
  10159e:	5d                   	pop    %ebp
  10159f:	c3                   	ret    
  1015a0:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  1015a4:	8d 77 02             	lea    0x2(%edi),%esi
  1015a7:	4b                   	dec    %ebx
  1015a8:	eb d6                	jmp    101580 <i2A+0x50>
  1015aa:	66 90                	xchg   %ax,%ax
  1015ac:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  1015b2:	74 0c                	je     1015c0 <i2A+0x90>
  1015b4:	f7 d9                	neg    %ecx
  1015b6:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  1015ba:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  1015be:	eb 86                	jmp    101546 <i2A+0x16>
  1015c0:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  1015c5:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  1015c9:	eb ef                	jmp    1015ba <i2A+0x8a>
  1015cb:	90                   	nop

001015cc <i2X>:
  1015cc:	55                   	push   %ebp
  1015cd:	89 e5                	mov    %esp,%ebp
  1015cf:	57                   	push   %edi
  1015d0:	56                   	push   %esi
  1015d1:	53                   	push   %ebx
  1015d2:	8b 55 08             	mov    0x8(%ebp),%edx
  1015d5:	b9 7d 34 10 00       	mov    $0x10347d,%ecx
  1015da:	31 c0                	xor    %eax,%eax
  1015dc:	40                   	inc    %eax
  1015dd:	89 d6                	mov    %edx,%esi
  1015df:	83 e6 0f             	and    $0xf,%esi
  1015e2:	8d 5e f6             	lea    -0xa(%esi),%ebx
  1015e5:	89 cf                	mov    %ecx,%edi
  1015e7:	83 fb 05             	cmp    $0x5,%ebx
  1015ea:	77 4c                	ja     101638 <i2X+0x6c>
  1015ec:	ff 24 9d 14 1b 10 00 	jmp    *0x101b14(,%ebx,4)
  1015f3:	90                   	nop
  1015f4:	c6 01 65             	movb   $0x65,(%ecx)
  1015f7:	90                   	nop
  1015f8:	49                   	dec    %ecx
  1015f9:	c1 ea 04             	shr    $0x4,%edx
  1015fc:	75 de                	jne    1015dc <i2X+0x10>
  1015fe:	c6 05 7e 34 10 00 00 	movb   $0x0,0x10347e
  101605:	8b 55 0c             	mov    0xc(%ebp),%edx
  101608:	89 3a                	mov    %edi,(%edx)
  10160a:	5b                   	pop    %ebx
  10160b:	5e                   	pop    %esi
  10160c:	5f                   	pop    %edi
  10160d:	5d                   	pop    %ebp
  10160e:	c3                   	ret    
  10160f:	90                   	nop
  101610:	c6 01 64             	movb   $0x64,(%ecx)
  101613:	eb e3                	jmp    1015f8 <i2X+0x2c>
  101615:	8d 76 00             	lea    0x0(%esi),%esi
  101618:	c6 01 63             	movb   $0x63,(%ecx)
  10161b:	eb db                	jmp    1015f8 <i2X+0x2c>
  10161d:	8d 76 00             	lea    0x0(%esi),%esi
  101620:	c6 01 62             	movb   $0x62,(%ecx)
  101623:	eb d3                	jmp    1015f8 <i2X+0x2c>
  101625:	8d 76 00             	lea    0x0(%esi),%esi
  101628:	c6 01 61             	movb   $0x61,(%ecx)
  10162b:	eb cb                	jmp    1015f8 <i2X+0x2c>
  10162d:	8d 76 00             	lea    0x0(%esi),%esi
  101630:	c6 01 66             	movb   $0x66,(%ecx)
  101633:	eb c3                	jmp    1015f8 <i2X+0x2c>
  101635:	8d 76 00             	lea    0x0(%esi),%esi
  101638:	8d 5e 30             	lea    0x30(%esi),%ebx
  10163b:	88 19                	mov    %bl,(%ecx)
  10163d:	eb b9                	jmp    1015f8 <i2X+0x2c>
  10163f:	90                   	nop

00101640 <printk>:
  101640:	55                   	push   %ebp
  101641:	89 e5                	mov    %esp,%ebp
  101643:	57                   	push   %edi
  101644:	56                   	push   %esi
  101645:	53                   	push   %ebx
  101646:	83 ec 2c             	sub    $0x2c,%esp
  101649:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10164c:	8a 11                	mov    (%ecx),%dl
  10164e:	84 d2                	test   %dl,%dl
  101650:	0f 84 54 01 00 00    	je     1017aa <printk+0x16a>
  101656:	8d 45 0c             	lea    0xc(%ebp),%eax
  101659:	31 ff                	xor    %edi,%edi
  10165b:	eb 18                	jmp    101675 <printk+0x35>
  10165d:	8d 76 00             	lea    0x0(%esi),%esi
  101660:	8a 11                	mov    (%ecx),%dl
  101662:	89 cb                	mov    %ecx,%ebx
  101664:	88 97 a0 34 10 00    	mov    %dl,0x1034a0(%edi)
  10166a:	47                   	inc    %edi
  10166b:	8d 4b 01             	lea    0x1(%ebx),%ecx
  10166e:	8a 53 01             	mov    0x1(%ebx),%dl
  101671:	84 d2                	test   %dl,%dl
  101673:	74 72                	je     1016e7 <printk+0xa7>
  101675:	80 fa 25             	cmp    $0x25,%dl
  101678:	75 e6                	jne    101660 <printk+0x20>
  10167a:	8d 59 01             	lea    0x1(%ecx),%ebx
  10167d:	8a 51 01             	mov    0x1(%ecx),%dl
  101680:	80 fa 64             	cmp    $0x64,%dl
  101683:	0f 84 bf 00 00 00    	je     101748 <printk+0x108>
  101689:	0f 8e 01 01 00 00    	jle    101790 <printk+0x150>
  10168f:	80 fa 73             	cmp    $0x73,%dl
  101692:	0f 84 84 00 00 00    	je     10171c <printk+0xdc>
  101698:	80 fa 78             	cmp    $0x78,%dl
  10169b:	75 c7                	jne    101664 <printk+0x24>
  10169d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1016a4:	8d 70 04             	lea    0x4(%eax),%esi
  1016a7:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1016aa:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  1016ad:	56                   	push   %esi
  1016ae:	ff 30                	pushl  (%eax)
  1016b0:	e8 17 ff ff ff       	call   1015cc <i2X>
  1016b5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1016b8:	8d b7 a0 34 10 00    	lea    0x1034a0(%edi),%esi
  1016be:	8a 11                	mov    (%ecx),%dl
  1016c0:	83 c4 08             	add    $0x8,%esp
  1016c3:	31 c0                	xor    %eax,%eax
  1016c5:	84 d2                	test   %dl,%dl
  1016c7:	74 0f                	je     1016d8 <printk+0x98>
  1016c9:	8d 76 00             	lea    0x0(%esi),%esi
  1016cc:	40                   	inc    %eax
  1016cd:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1016d1:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  1016d4:	84 d2                	test   %dl,%dl
  1016d6:	75 f4                	jne    1016cc <printk+0x8c>
  1016d8:	01 c7                	add    %eax,%edi
  1016da:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1016dd:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1016e0:	8a 53 01             	mov    0x1(%ebx),%dl
  1016e3:	84 d2                	test   %dl,%dl
  1016e5:	75 8e                	jne    101675 <printk+0x35>
  1016e7:	c6 87 a0 34 10 00 00 	movb   $0x0,0x1034a0(%edi)
  1016ee:	0f be 05 a0 34 10 00 	movsbl 0x1034a0,%eax
  1016f5:	bb a0 34 10 00       	mov    $0x1034a0,%ebx
  1016fa:	84 c0                	test   %al,%al
  1016fc:	74 16                	je     101714 <printk+0xd4>
  1016fe:	66 90                	xchg   %ax,%ax
  101700:	83 ec 0c             	sub    $0xc,%esp
  101703:	50                   	push   %eax
  101704:	e8 1b f1 ff ff       	call   100824 <putChar>
  101709:	43                   	inc    %ebx
  10170a:	0f be 03             	movsbl (%ebx),%eax
  10170d:	83 c4 10             	add    $0x10,%esp
  101710:	84 c0                	test   %al,%al
  101712:	75 ec                	jne    101700 <printk+0xc0>
  101714:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101717:	5b                   	pop    %ebx
  101718:	5e                   	pop    %esi
  101719:	5f                   	pop    %edi
  10171a:	5d                   	pop    %ebp
  10171b:	c3                   	ret    
  10171c:	8d 70 04             	lea    0x4(%eax),%esi
  10171f:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101722:	8b 08                	mov    (%eax),%ecx
  101724:	8d b7 a0 34 10 00    	lea    0x1034a0(%edi),%esi
  10172a:	8a 11                	mov    (%ecx),%dl
  10172c:	31 c0                	xor    %eax,%eax
  10172e:	84 d2                	test   %dl,%dl
  101730:	74 a6                	je     1016d8 <printk+0x98>
  101732:	66 90                	xchg   %ax,%ax
  101734:	40                   	inc    %eax
  101735:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101739:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  10173c:	84 d2                	test   %dl,%dl
  10173e:	75 f4                	jne    101734 <printk+0xf4>
  101740:	01 c7                	add    %eax,%edi
  101742:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101745:	eb 96                	jmp    1016dd <printk+0x9d>
  101747:	90                   	nop
  101748:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10174f:	8d 70 04             	lea    0x4(%eax),%esi
  101752:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101755:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101758:	56                   	push   %esi
  101759:	ff 30                	pushl  (%eax)
  10175b:	e8 d0 fd ff ff       	call   101530 <i2A>
  101760:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  101763:	8d b7 a0 34 10 00    	lea    0x1034a0(%edi),%esi
  101769:	8a 11                	mov    (%ecx),%dl
  10176b:	83 c4 08             	add    $0x8,%esp
  10176e:	31 c0                	xor    %eax,%eax
  101770:	84 d2                	test   %dl,%dl
  101772:	0f 84 60 ff ff ff    	je     1016d8 <printk+0x98>
  101778:	40                   	inc    %eax
  101779:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  10177d:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  101780:	84 d2                	test   %dl,%dl
  101782:	75 f4                	jne    101778 <printk+0x138>
  101784:	01 c7                	add    %eax,%edi
  101786:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101789:	e9 4f ff ff ff       	jmp    1016dd <printk+0x9d>
  10178e:	66 90                	xchg   %ax,%ax
  101790:	80 fa 63             	cmp    $0x63,%dl
  101793:	0f 85 cb fe ff ff    	jne    101664 <printk+0x24>
  101799:	8b 10                	mov    (%eax),%edx
  10179b:	88 97 a0 34 10 00    	mov    %dl,0x1034a0(%edi)
  1017a1:	83 c0 04             	add    $0x4,%eax
  1017a4:	47                   	inc    %edi
  1017a5:	e9 c1 fe ff ff       	jmp    10166b <printk+0x2b>
  1017aa:	31 ff                	xor    %edi,%edi
  1017ac:	e9 36 ff ff ff       	jmp    1016e7 <printk+0xa7>
  1017b1:	66 90                	xchg   %ax,%ax
  1017b3:	90                   	nop

001017b4 <abort>:
  1017b4:	55                   	push   %ebp
  1017b5:	89 e5                	mov    %esp,%ebp
  1017b7:	57                   	push   %edi
  1017b8:	56                   	push   %esi
  1017b9:	53                   	push   %ebx
  1017ba:	83 ec 1c             	sub    $0x1c,%esp
  1017bd:	8b 55 08             	mov    0x8(%ebp),%edx
  1017c0:	fa                   	cli    
  1017c1:	8a 02                	mov    (%edx),%al
  1017c3:	b9 52 33 10 00       	mov    $0x103352,%ecx
  1017c8:	84 c0                	test   %al,%al
  1017ca:	74 0b                	je     1017d7 <abort+0x23>
  1017cc:	41                   	inc    %ecx
  1017cd:	42                   	inc    %edx
  1017ce:	88 41 ff             	mov    %al,-0x1(%ecx)
  1017d1:	8a 02                	mov    (%edx),%al
  1017d3:	84 c0                	test   %al,%al
  1017d5:	75 f5                	jne    1017cc <abort+0x18>
  1017d7:	c6 01 3a             	movb   $0x3a,(%ecx)
  1017da:	bb bd 3c 10 00       	mov    $0x103cbd,%ebx
  1017df:	be 0a 00 00 00       	mov    $0xa,%esi
  1017e4:	bf 67 66 66 66       	mov    $0x66666667,%edi
  1017e9:	4b                   	dec    %ebx
  1017ea:	8b 45 0c             	mov    0xc(%ebp),%eax
  1017ed:	99                   	cltd   
  1017ee:	f7 fe                	idiv   %esi
  1017f0:	8d 42 30             	lea    0x30(%edx),%eax
  1017f3:	88 45 e7             	mov    %al,-0x19(%ebp)
  1017f6:	88 03                	mov    %al,(%ebx)
  1017f8:	89 f8                	mov    %edi,%eax
  1017fa:	f7 6d 0c             	imull  0xc(%ebp)
  1017fd:	c1 fa 02             	sar    $0x2,%edx
  101800:	8b 45 0c             	mov    0xc(%ebp),%eax
  101803:	c1 f8 1f             	sar    $0x1f,%eax
  101806:	29 c2                	sub    %eax,%edx
  101808:	89 55 0c             	mov    %edx,0xc(%ebp)
  10180b:	75 dc                	jne    1017e9 <abort+0x35>
  10180d:	41                   	inc    %ecx
  10180e:	41                   	inc    %ecx
  10180f:	43                   	inc    %ebx
  101810:	8a 45 e7             	mov    -0x19(%ebp),%al
  101813:	88 41 ff             	mov    %al,-0x1(%ecx)
  101816:	8a 03                	mov    (%ebx),%al
  101818:	88 45 e7             	mov    %al,-0x19(%ebp)
  10181b:	84 c0                	test   %al,%al
  10181d:	75 ef                	jne    10180e <abort+0x5a>
  10181f:	c6 01 0a             	movb   $0xa,(%ecx)
  101822:	0f be 05 40 33 10 00 	movsbl 0x103340,%eax
  101829:	84 c0                	test   %al,%al
  10182b:	74 1b                	je     101848 <abort+0x94>
  10182d:	bb 40 33 10 00       	mov    $0x103340,%ebx
  101832:	83 ec 0c             	sub    $0xc,%esp
  101835:	50                   	push   %eax
  101836:	e8 e9 ef ff ff       	call   100824 <putChar>
  10183b:	43                   	inc    %ebx
  10183c:	0f be 03             	movsbl (%ebx),%eax
  10183f:	83 c4 10             	add    $0x10,%esp
  101842:	84 c0                	test   %al,%al
  101844:	75 ec                	jne    101832 <abort+0x7e>
  101846:	66 90                	xchg   %ax,%ax
  101848:	f4                   	hlt    
  101849:	eb fd                	jmp    101848 <abort+0x94>

0010184b <irqEmpty>:
  10184b:	6a 00                	push   $0x0
  10184d:	6a ff                	push   $0xffffffff
  10184f:	eb 13                	jmp    101864 <asmDoIrq>

00101851 <irqGProtectFault>:
  101851:	6a 0d                	push   $0xd
  101853:	eb 0f                	jmp    101864 <asmDoIrq>

00101855 <irqSyscall>:
  101855:	6a 00                	push   $0x0
  101857:	68 80 00 00 00       	push   $0x80
  10185c:	eb 06                	jmp    101864 <asmDoIrq>

0010185e <irqTime>:
  10185e:	6a 00                	push   $0x0
  101860:	6a 20                	push   $0x20
  101862:	eb 00                	jmp    101864 <asmDoIrq>

00101864 <asmDoIrq>:
  101864:	60                   	pusha  
  101865:	1e                   	push   %ds
  101866:	06                   	push   %es
  101867:	0f a0                	push   %fs
  101869:	0f a8                	push   %gs
  10186b:	54                   	push   %esp
  10186c:	e8 fb fa ff ff       	call   10136c <irqHandle>
  101871:	5c                   	pop    %esp
  101872:	0f a9                	pop    %gs
  101874:	0f a1                	pop    %fs
  101876:	07                   	pop    %es
  101877:	1f                   	pop    %ds
  101878:	61                   	popa   
  101879:	83 c4 04             	add    $0x4,%esp
  10187c:	83 c4 04             	add    $0x4,%esp
  10187f:	cf                   	iret   
