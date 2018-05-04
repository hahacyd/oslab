
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 09 15 00 00       	call   101514 <initTimer>
  10000b:	e8 7c 10 00 00       	call   10108c <init_pcb>
  100010:	e8 bb 10 00 00       	call   1010d0 <init_kernel_pcb>
  100015:	e8 de 07 00 00       	call   1007f8 <initSerial>
  10001a:	e8 71 11 00 00       	call   101190 <initIdt>
  10001f:	e8 98 14 00 00       	call   1014bc <initIntr>
  100024:	e8 4f 02 00 00       	call   100278 <initSeg>
  100029:	fb                   	sti    
  10002a:	e8 75 04 00 00       	call   1004a4 <loadUMain>
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
  100133:	68 7c 18 10 00       	push   $0x10187c
  100138:	e8 ff 14 00 00       	call   10163c <printk>
  10013d:	89 1c 24             	mov    %ebx,(%esp)
  100140:	68 bc 18 10 00       	push   $0x1018bc
  100145:	6a 18                	push   $0x18
  100147:	68 82 18 10 00       	push   $0x101882
  10014c:	68 8f 18 10 00       	push   $0x10188f
  100151:	e8 e6 14 00 00       	call   10163c <printk>
  100156:	83 c4 14             	add    $0x14,%esp
  100159:	68 ab 18 10 00       	push   $0x1018ab
  10015e:	e8 d9 14 00 00       	call   10163c <printk>
  100163:	58                   	pop    %eax
  100164:	5a                   	pop    %edx
  100165:	6a 19                	push   $0x19
  100167:	68 82 18 10 00       	push   $0x101882
  10016c:	e8 3f 16 00 00       	call   1017b0 <abort>
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
  10036d:	a1 b4 18 10 00       	mov    0x1018b4,%eax
  100372:	8b 15 b8 18 10 00    	mov    0x1018b8,%edx
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
  1003e6:	b8 23 00 00 00       	mov    $0x23,%eax
  1003eb:	89 c0                	mov    %eax,%eax
  1003ed:	8e d8                	mov    %eax,%ds
  1003ef:	8e e0                	mov    %eax,%fs
  1003f1:	8e c0                	mov    %eax,%es
  1003f3:	89 d0                	mov    %edx,%eax
  1003f5:	c1 e0 07             	shl    $0x7,%eax
  1003f8:	01 d0                	add    %edx,%eax
  1003fa:	01 c0                	add    %eax,%eax
  1003fc:	01 d0                	add    %edx,%eax
  1003fe:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100401:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100408:	8b 90 48 20 00 00    	mov    0x2048(%eax),%edx
  10040e:	52                   	push   %edx
  10040f:	8b 90 44 20 00 00    	mov    0x2044(%eax),%edx
  100415:	52                   	push   %edx
  100416:	9c                   	pushf  
  100417:	8b 90 3c 20 00 00    	mov    0x203c(%eax),%edx
  10041d:	52                   	push   %edx
  10041e:	8b 80 38 20 00 00    	mov    0x2038(%eax),%eax
  100424:	50                   	push   %eax
  100425:	cf                   	iret   
  100426:	5d                   	pop    %ebp
  100427:	c3                   	ret    

00100428 <enterUserSpace>:
  100428:	55                   	push   %ebp
  100429:	89 e5                	mov    %esp,%ebp
  10042b:	83 ec 10             	sub    $0x10,%esp
  10042e:	c7 05 c4 3c 10 00 01 	movl   $0x1,0x103cc4
  100435:	00 00 00 
  100438:	c7 05 90 7d 10 00 23 	movl   $0x23,0x107d90
  10043f:	00 00 00 
  100442:	c7 05 84 7d 10 00 1b 	movl   $0x1b,0x107d84
  100449:	00 00 00 
  10044c:	c7 05 54 7d 10 00 23 	movl   $0x23,0x107d54
  100453:	00 00 00 
  100456:	c7 05 50 7d 10 00 23 	movl   $0x23,0x107d50
  10045d:	00 00 00 
  100460:	c7 05 4c 7d 10 00 23 	movl   $0x23,0x107d4c
  100467:	00 00 00 
  10046a:	c7 05 8c 7d 10 00 00 	movl   $0x400000,0x107d8c
  100471:	00 40 00 
  100474:	8b 45 08             	mov    0x8(%ebp),%eax
  100477:	a3 80 7d 10 00       	mov    %eax,0x107d80
  10047c:	c7 05 98 7d 10 00 0a 	movl   $0xa,0x107d98
  100483:	00 00 00 
  100486:	6a 00                	push   $0x0
  100488:	6a 01                	push   $0x1
  10048a:	e8 2d 06 00 00       	call   100abc <put_into_runnable>
  10048f:	bc 00 30 00 00       	mov    $0x3000,%esp
  100494:	83 c4 10             	add    $0x10,%esp
  100497:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  10049e:	c9                   	leave  
  10049f:	e9 3c ff ff ff       	jmp    1003e0 <enterUserSpace_pcb>

001004a4 <loadUMain>:
  1004a4:	55                   	push   %ebp
  1004a5:	89 e5                	mov    %esp,%ebp
  1004a7:	57                   	push   %edi
  1004a8:	56                   	push   %esi
  1004a9:	53                   	push   %ebx
  1004aa:	83 ec 0c             	sub    $0xc,%esp
  1004ad:	bb c9 00 00 00       	mov    $0xc9,%ebx
  1004b2:	be 00 00 03 00       	mov    $0x30000,%esi
  1004b7:	90                   	nop
  1004b8:	53                   	push   %ebx
  1004b9:	56                   	push   %esi
  1004ba:	e8 41 fd ff ff       	call   100200 <readSect>
  1004bf:	81 c6 00 02 00 00    	add    $0x200,%esi
  1004c5:	43                   	inc    %ebx
  1004c6:	58                   	pop    %eax
  1004c7:	5a                   	pop    %edx
  1004c8:	81 fb 91 01 00 00    	cmp    $0x191,%ebx
  1004ce:	75 e8                	jne    1004b8 <loadUMain+0x14>
  1004d0:	a1 1c 00 03 00       	mov    0x3001c,%eax
  1004d5:	8d 90 00 00 03 00    	lea    0x30000(%eax),%edx
  1004db:	0f b7 35 2c 00 03 00 	movzwl 0x3002c,%esi
  1004e2:	c1 e6 05             	shl    $0x5,%esi
  1004e5:	01 d6                	add    %edx,%esi
  1004e7:	39 f2                	cmp    %esi,%edx
  1004e9:	72 0c                	jb     1004f7 <loadUMain+0x53>
  1004eb:	eb 53                	jmp    100540 <loadUMain+0x9c>
  1004ed:	8d 76 00             	lea    0x0(%esi),%esi
  1004f0:	83 c2 20             	add    $0x20,%edx
  1004f3:	39 d6                	cmp    %edx,%esi
  1004f5:	76 49                	jbe    100540 <loadUMain+0x9c>
  1004f7:	83 3a 01             	cmpl   $0x1,(%edx)
  1004fa:	75 f4                	jne    1004f0 <loadUMain+0x4c>
  1004fc:	8b 42 08             	mov    0x8(%edx),%eax
  1004ff:	8b 7a 10             	mov    0x10(%edx),%edi
  100502:	8b 5a 04             	mov    0x4(%edx),%ebx
  100505:	29 c3                	sub    %eax,%ebx
  100507:	31 c9                	xor    %ecx,%ecx
  100509:	85 ff                	test   %edi,%edi
  10050b:	74 16                	je     100523 <loadUMain+0x7f>
  10050d:	8d 76 00             	lea    0x0(%esi),%esi
  100510:	8a 8c 03 00 00 03 00 	mov    0x30000(%ebx,%eax,1),%cl
  100517:	88 08                	mov    %cl,(%eax)
  100519:	40                   	inc    %eax
  10051a:	89 c1                	mov    %eax,%ecx
  10051c:	2b 4a 08             	sub    0x8(%edx),%ecx
  10051f:	39 cf                	cmp    %ecx,%edi
  100521:	77 ed                	ja     100510 <loadUMain+0x6c>
  100523:	8b 5a 14             	mov    0x14(%edx),%ebx
  100526:	39 cb                	cmp    %ecx,%ebx
  100528:	76 c6                	jbe    1004f0 <loadUMain+0x4c>
  10052a:	66 90                	xchg   %ax,%ax
  10052c:	c6 00 00             	movb   $0x0,(%eax)
  10052f:	40                   	inc    %eax
  100530:	89 c1                	mov    %eax,%ecx
  100532:	2b 4a 08             	sub    0x8(%edx),%ecx
  100535:	39 cb                	cmp    %ecx,%ebx
  100537:	77 f3                	ja     10052c <loadUMain+0x88>
  100539:	83 c2 20             	add    $0x20,%edx
  10053c:	39 d6                	cmp    %edx,%esi
  10053e:	77 b7                	ja     1004f7 <loadUMain+0x53>
  100540:	83 ec 0c             	sub    $0xc,%esp
  100543:	ff 35 18 00 03 00    	pushl  0x30018
  100549:	e8 da fe ff ff       	call   100428 <enterUserSpace>
  10054e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100551:	5b                   	pop    %ebx
  100552:	5e                   	pop    %esi
  100553:	5f                   	pop    %edi
  100554:	5d                   	pop    %ebp
  100555:	c3                   	ret    
  100556:	66 90                	xchg   %ax,%ax

00100558 <sys_exit>:
  100558:	55                   	push   %ebp
  100559:	89 e5                	mov    %esp,%ebp
  10055b:	83 ec 14             	sub    $0x14,%esp
  10055e:	68 c7 18 10 00       	push   $0x1018c7
  100563:	e8 d4 10 00 00       	call   10163c <printk>
  100568:	e8 8f 04 00 00       	call   1009fc <get_from_runnable>
  10056d:	5a                   	pop    %edx
  10056e:	59                   	pop    %ecx
  10056f:	ff 75 08             	pushl  0x8(%ebp)
  100572:	50                   	push   %eax
  100573:	e8 e4 02 00 00       	call   10085c <put_into_running>
  100578:	b8 01 00 00 00       	mov    $0x1,%eax
  10057d:	c9                   	leave  
  10057e:	c3                   	ret    
  10057f:	90                   	nop

00100580 <sys_sleep>:
  100580:	55                   	push   %ebp
  100581:	89 e5                	mov    %esp,%ebp
  100583:	56                   	push   %esi
  100584:	53                   	push   %ebx
  100585:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100588:	e8 3f 04 00 00       	call   1009cc <getpid>
  10058d:	83 ec 08             	sub    $0x8,%esp
  100590:	53                   	push   %ebx
  100591:	50                   	push   %eax
  100592:	e8 59 06 00 00       	call   100bf0 <put_into_block>
  100597:	c7 04 24 7c 18 10 00 	movl   $0x10187c,(%esp)
  10059e:	e8 99 10 00 00       	call   10163c <printk>
  1005a3:	e8 24 04 00 00       	call   1009cc <getpid>
  1005a8:	89 c2                	mov    %eax,%edx
  1005aa:	c1 e2 07             	shl    $0x7,%edx
  1005ad:	01 c2                	add    %eax,%edx
  1005af:	01 d2                	add    %edx,%edx
  1005b1:	01 c2                	add    %eax,%edx
  1005b3:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1005b6:	8b 34 c5 34 5d 10 00 	mov    0x105d34(,%eax,8),%esi
  1005bd:	e8 0a 04 00 00       	call   1009cc <getpid>
  1005c2:	5a                   	pop    %edx
  1005c3:	59                   	pop    %ecx
  1005c4:	56                   	push   %esi
  1005c5:	50                   	push   %eax
  1005c6:	68 18 19 10 00       	push   $0x101918
  1005cb:	6a 09                	push   $0x9
  1005cd:	68 d5 18 10 00       	push   $0x1018d5
  1005d2:	68 f4 18 10 00       	push   $0x1018f4
  1005d7:	e8 60 10 00 00       	call   10163c <printk>
  1005dc:	83 c4 14             	add    $0x14,%esp
  1005df:	68 ab 18 10 00       	push   $0x1018ab
  1005e4:	e8 53 10 00 00       	call   10163c <printk>
  1005e9:	e8 0e 04 00 00       	call   1009fc <get_from_runnable>
  1005ee:	5e                   	pop    %esi
  1005ef:	5a                   	pop    %edx
  1005f0:	53                   	push   %ebx
  1005f1:	50                   	push   %eax
  1005f2:	e8 65 02 00 00       	call   10085c <put_into_running>
  1005f7:	b8 01 00 00 00       	mov    $0x1,%eax
  1005fc:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1005ff:	5b                   	pop    %ebx
  100600:	5e                   	pop    %esi
  100601:	5d                   	pop    %ebp
  100602:	c3                   	ret    
  100603:	90                   	nop

00100604 <sys_fork>:
  100604:	55                   	push   %ebp
  100605:	89 e5                	mov    %esp,%ebp
  100607:	57                   	push   %edi
  100608:	56                   	push   %esi
  100609:	53                   	push   %ebx
  10060a:	83 ec 18             	sub    $0x18,%esp
  10060d:	8b 75 08             	mov    0x8(%ebp),%esi
  100610:	68 22 19 10 00       	push   $0x101922
  100615:	e8 22 10 00 00       	call   10163c <printk>
  10061a:	83 c4 10             	add    $0x10,%esp
  10061d:	31 db                	xor    %ebx,%ebx
  10061f:	90                   	nop
  100620:	e8 a7 03 00 00       	call   1009cc <getpid>
  100625:	89 c2                	mov    %eax,%edx
  100627:	c1 e2 07             	shl    $0x7,%edx
  10062a:	01 c2                	add    %eax,%edx
  10062c:	01 d2                	add    %edx,%edx
  10062e:	01 c2                	add    %eax,%edx
  100630:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100633:	01 c0                	add    %eax,%eax
  100635:	01 d8                	add    %ebx,%eax
  100637:	8b 04 85 e0 3c 10 00 	mov    0x103ce0(,%eax,4),%eax
  10063e:	89 04 9d b0 7d 10 00 	mov    %eax,0x107db0(,%ebx,4)
  100645:	43                   	inc    %ebx
  100646:	81 fb 00 08 00 00    	cmp    $0x800,%ebx
  10064c:	75 d2                	jne    100620 <sys_fork+0x1c>
  10064e:	e8 79 03 00 00       	call   1009cc <getpid>
  100653:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100656:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100659:	8d 14 80             	lea    (%eax,%eax,4),%edx
  10065c:	c1 e2 03             	shl    $0x3,%edx
  10065f:	b8 e8 03 00 00       	mov    $0x3e8,%eax
  100664:	8a 8c 10 18 fc 3f 00 	mov    0x3ffc18(%eax,%edx,1),%cl
  10066b:	88 88 e8 03 40 00    	mov    %cl,0x4003e8(%eax)
  100671:	48                   	dec    %eax
  100672:	75 f0                	jne    100664 <sys_fork+0x60>
  100674:	b8 b0 9d 10 00       	mov    $0x109db0,%eax
  100679:	b9 13 00 00 00       	mov    $0x13,%ecx
  10067e:	89 c7                	mov    %eax,%edi
  100680:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100682:	c7 05 dc 9d 10 00 00 	movl   $0x0,0x109ddc
  100689:	00 00 00 
  10068c:	c7 05 f4 9d 10 00 00 	movl   $0x600000,0x109df4
  100693:	00 60 00 
  100696:	83 ec 08             	sub    $0x8,%esp
  100699:	50                   	push   %eax
  10069a:	6a 02                	push   $0x2
  10069c:	e8 1b 04 00 00       	call   100abc <put_into_runnable>
  1006a1:	b8 02 00 00 00       	mov    $0x2,%eax
  1006a6:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1006a9:	5b                   	pop    %ebx
  1006aa:	5e                   	pop    %esi
  1006ab:	5f                   	pop    %edi
  1006ac:	5d                   	pop    %ebp
  1006ad:	c3                   	ret    
  1006ae:	66 90                	xchg   %ax,%ax

001006b0 <display>:
  1006b0:	55                   	push   %ebp
  1006b1:	89 e5                	mov    %esp,%ebp
  1006b3:	57                   	push   %edi
  1006b4:	53                   	push   %ebx
  1006b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1006b8:	80 fb 0a             	cmp    $0xa,%bl
  1006bb:	74 5b                	je     100718 <display+0x68>
  1006bd:	8b 15 48 34 10 00    	mov    0x103448,%edx
  1006c3:	8b 0d 4c 34 10 00    	mov    0x10344c,%ecx
  1006c9:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  1006cc:	c1 e0 04             	shl    $0x4,%eax
  1006cf:	01 d0                	add    %edx,%eax
  1006d1:	01 c0                	add    %eax,%eax
  1006d3:	89 c7                	mov    %eax,%edi
  1006d5:	0f be db             	movsbl %bl,%ebx
  1006d8:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
  1006de:	66 89 d8             	mov    %bx,%ax
  1006e1:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1006e5:	42                   	inc    %edx
  1006e6:	83 fa 50             	cmp    $0x50,%edx
  1006e9:	75 1d                	jne    100708 <display+0x58>
  1006eb:	c7 05 48 34 10 00 00 	movl   $0x0,0x103448
  1006f2:	00 00 00 
  1006f5:	41                   	inc    %ecx
  1006f6:	89 0d 4c 34 10 00    	mov    %ecx,0x10344c
  1006fc:	b8 01 00 00 00       	mov    $0x1,%eax
  100701:	5b                   	pop    %ebx
  100702:	5f                   	pop    %edi
  100703:	5d                   	pop    %ebp
  100704:	c3                   	ret    
  100705:	8d 76 00             	lea    0x0(%esi),%esi
  100708:	89 15 48 34 10 00    	mov    %edx,0x103448
  10070e:	b8 01 00 00 00       	mov    $0x1,%eax
  100713:	5b                   	pop    %ebx
  100714:	5f                   	pop    %edi
  100715:	5d                   	pop    %ebp
  100716:	c3                   	ret    
  100717:	90                   	nop
  100718:	c7 05 48 34 10 00 00 	movl   $0x0,0x103448
  10071f:	00 00 00 
  100722:	ff 05 4c 34 10 00    	incl   0x10344c
  100728:	b8 01 00 00 00       	mov    $0x1,%eax
  10072d:	5b                   	pop    %ebx
  10072e:	5f                   	pop    %edi
  10072f:	5d                   	pop    %ebp
  100730:	c3                   	ret    
  100731:	8d 76 00             	lea    0x0(%esi),%esi

00100734 <printkernel>:
  100734:	55                   	push   %ebp
  100735:	89 e5                	mov    %esp,%ebp
  100737:	53                   	push   %ebx
  100738:	50                   	push   %eax
  100739:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10073c:	0f be 03             	movsbl (%ebx),%eax
  10073f:	84 c0                	test   %al,%al
  100741:	74 20                	je     100763 <printkernel+0x2f>
  100743:	90                   	nop
  100744:	83 ec 0c             	sub    $0xc,%esp
  100747:	50                   	push   %eax
  100748:	e8 eb 00 00 00       	call   100838 <putChar>
  10074d:	0f be 03             	movsbl (%ebx),%eax
  100750:	89 04 24             	mov    %eax,(%esp)
  100753:	e8 58 ff ff ff       	call   1006b0 <display>
  100758:	43                   	inc    %ebx
  100759:	0f be 03             	movsbl (%ebx),%eax
  10075c:	83 c4 10             	add    $0x10,%esp
  10075f:	84 c0                	test   %al,%al
  100761:	75 e1                	jne    100744 <printkernel+0x10>
  100763:	b8 01 00 00 00       	mov    $0x1,%eax
  100768:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10076b:	c9                   	leave  
  10076c:	c3                   	ret    
  10076d:	8d 76 00             	lea    0x0(%esi),%esi

00100770 <fs_write>:
  100770:	55                   	push   %ebp
  100771:	89 e5                	mov    %esp,%ebp
  100773:	53                   	push   %ebx
  100774:	50                   	push   %eax
  100775:	8b 5d 10             	mov    0x10(%ebp),%ebx
  100778:	ba 30 00 00 00       	mov    $0x30,%edx
  10077d:	89 d0                	mov    %edx,%eax
  10077f:	8e e8                	mov    %eax,%gs
  100781:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  100785:	74 12                	je     100799 <fs_write+0x29>
  100787:	83 ec 08             	sub    $0x8,%esp
  10078a:	6a 27                	push   $0x27
  10078c:	68 3e 19 10 00       	push   $0x10193e
  100791:	e8 1a 10 00 00       	call   1017b0 <abort>
  100796:	83 c4 10             	add    $0x10,%esp
  100799:	83 ec 08             	sub    $0x8,%esp
  10079c:	53                   	push   %ebx
  10079d:	ff 75 0c             	pushl  0xc(%ebp)
  1007a0:	e8 8f ff ff ff       	call   100734 <printkernel>
  1007a5:	89 d8                	mov    %ebx,%eax
  1007a7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1007aa:	c9                   	leave  
  1007ab:	c3                   	ret    

001007ac <sys_write>:
  1007ac:	55                   	push   %ebp
  1007ad:	89 e5                	mov    %esp,%ebp
  1007af:	53                   	push   %ebx
  1007b0:	83 ec 08             	sub    $0x8,%esp
  1007b3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1007b6:	ff 73 24             	pushl  0x24(%ebx)
  1007b9:	ff 73 28             	pushl  0x28(%ebx)
  1007bc:	ff 73 20             	pushl  0x20(%ebx)
  1007bf:	e8 ac ff ff ff       	call   100770 <fs_write>
  1007c4:	89 43 2c             	mov    %eax,0x2c(%ebx)
  1007c7:	83 c4 10             	add    $0x10,%esp
  1007ca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1007cd:	c9                   	leave  
  1007ce:	c3                   	ret    
  1007cf:	90                   	nop

001007d0 <print_char>:
  1007d0:	55                   	push   %ebp
  1007d1:	89 e5                	mov    %esp,%ebp
  1007d3:	57                   	push   %edi
  1007d4:	8b 45 08             	mov    0x8(%ebp),%eax
  1007d7:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1007da:	c1 e0 04             	shl    $0x4,%eax
  1007dd:	03 45 0c             	add    0xc(%ebp),%eax
  1007e0:	01 c0                	add    %eax,%eax
  1007e2:	89 c7                	mov    %eax,%edi
  1007e4:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  1007e8:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  1007ee:	66 89 d0             	mov    %dx,%ax
  1007f1:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1007f5:	5f                   	pop    %edi
  1007f6:	5d                   	pop    %ebp
  1007f7:	c3                   	ret    

001007f8 <initSerial>:
  1007f8:	55                   	push   %ebp
  1007f9:	89 e5                	mov    %esp,%ebp
  1007fb:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100800:	31 c0                	xor    %eax,%eax
  100802:	ee                   	out    %al,(%dx)
  100803:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100808:	b0 80                	mov    $0x80,%al
  10080a:	ee                   	out    %al,(%dx)
  10080b:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100810:	b0 01                	mov    $0x1,%al
  100812:	ee                   	out    %al,(%dx)
  100813:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100818:	31 c0                	xor    %eax,%eax
  10081a:	ee                   	out    %al,(%dx)
  10081b:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100820:	b0 03                	mov    $0x3,%al
  100822:	ee                   	out    %al,(%dx)
  100823:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100828:	b0 c7                	mov    $0xc7,%al
  10082a:	ee                   	out    %al,(%dx)
  10082b:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100830:	b0 0b                	mov    $0xb,%al
  100832:	ee                   	out    %al,(%dx)
  100833:	5d                   	pop    %ebp
  100834:	c3                   	ret    
  100835:	8d 76 00             	lea    0x0(%esi),%esi

00100838 <putChar>:
  100838:	55                   	push   %ebp
  100839:	89 e5                	mov    %esp,%ebp
  10083b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10083e:	ba fd 03 00 00       	mov    $0x3fd,%edx
  100843:	90                   	nop
  100844:	ec                   	in     (%dx),%al
  100845:	a8 20                	test   $0x20,%al
  100847:	74 fb                	je     100844 <putChar+0xc>
  100849:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10084e:	88 c8                	mov    %cl,%al
  100850:	ee                   	out    %al,(%dx)
  100851:	5d                   	pop    %ebp
  100852:	c3                   	ret    
  100853:	90                   	nop

00100854 <IDLE>:
  100854:	55                   	push   %ebp
  100855:	89 e5                	mov    %esp,%ebp
  100857:	90                   	nop
  100858:	f4                   	hlt    
  100859:	eb fd                	jmp    100858 <IDLE+0x4>
  10085b:	90                   	nop

0010085c <put_into_running>:
  10085c:	55                   	push   %ebp
  10085d:	89 e5                	mov    %esp,%ebp
  10085f:	53                   	push   %ebx
  100860:	81 ec d4 00 00 00    	sub    $0xd4,%esp
  100866:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100869:	39 1d c0 3c 10 00    	cmp    %ebx,0x103cc0
  10086f:	0f 84 a9 00 00 00    	je     10091e <put_into_running+0xc2>
  100875:	89 1d c0 3c 10 00    	mov    %ebx,0x103cc0
  10087b:	85 db                	test   %ebx,%ebx
  10087d:	0f 84 a5 00 00 00    	je     100928 <put_into_running+0xcc>
  100883:	83 fb 02             	cmp    $0x2,%ebx
  100886:	0f 84 dc 00 00 00    	je     100968 <put_into_running+0x10c>
  10088c:	89 da                	mov    %ebx,%edx
  10088e:	83 ec 08             	sub    $0x8,%esp
  100891:	89 d0                	mov    %edx,%eax
  100893:	c1 e0 07             	shl    $0x7,%eax
  100896:	01 d0                	add    %edx,%eax
  100898:	01 c0                	add    %eax,%eax
  10089a:	01 d0                	add    %edx,%eax
  10089c:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10089f:	8d 04 c5 dc 5c 10 00 	lea    0x105cdc(,%eax,8),%eax
  1008a6:	50                   	push   %eax
  1008a7:	6a 10                	push   $0x10
  1008a9:	e8 06 f9 ff ff       	call   1001b4 <change_tss>
  1008ae:	8d 45 94             	lea    -0x6c(%ebp),%eax
  1008b1:	89 04 24             	mov    %eax,(%esp)
  1008b4:	e8 17 f9 ff ff       	call   1001d0 <get_tss>
  1008b9:	89 d8                	mov    %ebx,%eax
  1008bb:	c1 e0 07             	shl    $0x7,%eax
  1008be:	01 d8                	add    %ebx,%eax
  1008c0:	01 c0                	add    %eax,%eax
  1008c2:	01 d8                	add    %ebx,%eax
  1008c4:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1008c7:	8d 04 c5 dc 5c 10 00 	lea    0x105cdc(,%eax,8),%eax
  1008ce:	83 c4 0c             	add    $0xc,%esp
  1008d1:	39 45 98             	cmp    %eax,-0x68(%ebp)
  1008d4:	74 12                	je     1008e8 <put_into_running+0x8c>
  1008d6:	83 ec 08             	sub    $0x8,%esp
  1008d9:	6a 21                	push   $0x21
  1008db:	68 5a 19 10 00       	push   $0x10195a
  1008e0:	e8 cb 0e 00 00       	call   1017b0 <abort>
  1008e5:	83 c4 10             	add    $0x10,%esp
  1008e8:	83 ec 0c             	sub    $0xc,%esp
  1008eb:	68 7c 18 10 00       	push   $0x10187c
  1008f0:	e8 47 0d 00 00       	call   10163c <printk>
  1008f5:	89 1c 24             	mov    %ebx,(%esp)
  1008f8:	68 8c 1a 10 00       	push   $0x101a8c
  1008fd:	6a 24                	push   $0x24
  1008ff:	68 5a 19 10 00       	push   $0x10195a
  100904:	68 68 19 10 00       	push   $0x101968
  100909:	e8 2e 0d 00 00       	call   10163c <printk>
  10090e:	83 c4 14             	add    $0x14,%esp
  100911:	68 ab 18 10 00       	push   $0x1018ab
  100916:	e8 21 0d 00 00       	call   10163c <printk>
  10091b:	83 c4 10             	add    $0x10,%esp
  10091e:	b8 01 00 00 00       	mov    $0x1,%eax
  100923:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100926:	c9                   	leave  
  100927:	c3                   	ret    
  100928:	83 ec 08             	sub    $0x8,%esp
  10092b:	68 dc 5c 10 00       	push   $0x105cdc
  100930:	6a 10                	push   $0x10
  100932:	e8 7d f8 ff ff       	call   1001b4 <change_tss>
  100937:	8d 85 30 ff ff ff    	lea    -0xd0(%ebp),%eax
  10093d:	89 04 24             	mov    %eax,(%esp)
  100940:	e8 8b f8 ff ff       	call   1001d0 <get_tss>
  100945:	83 c4 0c             	add    $0xc,%esp
  100948:	81 bd 34 ff ff ff dc 	cmpl   $0x105cdc,-0xcc(%ebp)
  10094f:	5c 10 00 
  100952:	74 94                	je     1008e8 <put_into_running+0x8c>
  100954:	83 ec 08             	sub    $0x8,%esp
  100957:	6a 14                	push   $0x14
  100959:	68 5a 19 10 00       	push   $0x10195a
  10095e:	e8 4d 0e 00 00       	call   1017b0 <abort>
  100963:	83 c4 10             	add    $0x10,%esp
  100966:	eb 80                	jmp    1008e8 <put_into_running+0x8c>
  100968:	83 ec 0c             	sub    $0xc,%esp
  10096b:	68 7c 18 10 00       	push   $0x10187c
  100970:	e8 c7 0c 00 00       	call   10163c <printk>
  100975:	58                   	pop    %eax
  100976:	5a                   	pop    %edx
  100977:	ff 35 90 7d 10 00    	pushl  0x107d90
  10097d:	ff 35 8c 7d 10 00    	pushl  0x107d8c
  100983:	68 8c 1a 10 00       	push   $0x101a8c
  100988:	6a 1c                	push   $0x1c
  10098a:	68 5a 19 10 00       	push   $0x10195a
  10098f:	68 a0 19 10 00       	push   $0x1019a0
  100994:	e8 a3 0c 00 00       	call   10163c <printk>
  100999:	83 c4 14             	add    $0x14,%esp
  10099c:	68 ab 18 10 00       	push   $0x1018ab
  1009a1:	e8 96 0c 00 00       	call   10163c <printk>
  1009a6:	8b 15 c0 3c 10 00    	mov    0x103cc0,%edx
  1009ac:	83 c4 10             	add    $0x10,%esp
  1009af:	e9 da fe ff ff       	jmp    10088e <put_into_running+0x32>

001009b4 <update_block>:
  1009b4:	55                   	push   %ebp
  1009b5:	89 e5                	mov    %esp,%ebp
  1009b7:	b8 01 00 00 00       	mov    $0x1,%eax
  1009bc:	5d                   	pop    %ebp
  1009bd:	c3                   	ret    
  1009be:	66 90                	xchg   %ax,%ax

001009c0 <apply_new_pid>:
  1009c0:	55                   	push   %ebp
  1009c1:	89 e5                	mov    %esp,%ebp
  1009c3:	b8 02 00 00 00       	mov    $0x2,%eax
  1009c8:	5d                   	pop    %ebp
  1009c9:	c3                   	ret    
  1009ca:	66 90                	xchg   %ax,%ax

001009cc <getpid>:
  1009cc:	55                   	push   %ebp
  1009cd:	89 e5                	mov    %esp,%ebp
  1009cf:	a1 c0 3c 10 00       	mov    0x103cc0,%eax
  1009d4:	5d                   	pop    %ebp
  1009d5:	c3                   	ret    
  1009d6:	66 90                	xchg   %ax,%ax

001009d8 <getrunnable>:
  1009d8:	55                   	push   %ebp
  1009d9:	89 e5                	mov    %esp,%ebp
  1009db:	a1 24 33 10 00       	mov    0x103324,%eax
  1009e0:	5d                   	pop    %ebp
  1009e1:	c3                   	ret    
  1009e2:	66 90                	xchg   %ax,%ax

001009e4 <getblocked>:
  1009e4:	55                   	push   %ebp
  1009e5:	89 e5                	mov    %esp,%ebp
  1009e7:	a1 20 33 10 00       	mov    0x103320,%eax
  1009ec:	5d                   	pop    %ebp
  1009ed:	c3                   	ret    
  1009ee:	66 90                	xchg   %ax,%ax

001009f0 <transfer_pid_mode>:
  1009f0:	55                   	push   %ebp
  1009f1:	89 e5                	mov    %esp,%ebp
  1009f3:	b8 01 00 00 00       	mov    $0x1,%eax
  1009f8:	5d                   	pop    %ebp
  1009f9:	c3                   	ret    
  1009fa:	66 90                	xchg   %ax,%ax

001009fc <get_from_runnable>:
  1009fc:	55                   	push   %ebp
  1009fd:	89 e5                	mov    %esp,%ebp
  1009ff:	53                   	push   %ebx
  100a00:	51                   	push   %ecx
  100a01:	8b 1d 24 33 10 00    	mov    0x103324,%ebx
  100a07:	83 fb ff             	cmp    $0xffffffff,%ebx
  100a0a:	0f 84 a4 00 00 00    	je     100ab4 <get_from_runnable+0xb8>
  100a10:	89 d8                	mov    %ebx,%eax
  100a12:	c1 e0 07             	shl    $0x7,%eax
  100a15:	01 d8                	add    %ebx,%eax
  100a17:	01 c0                	add    %eax,%eax
  100a19:	01 d8                	add    %ebx,%eax
  100a1b:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100a1e:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100a25:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100a2b:	39 da                	cmp    %ebx,%edx
  100a2d:	74 79                	je     100aa8 <get_from_runnable+0xac>
  100a2f:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100a35:	89 c8                	mov    %ecx,%eax
  100a37:	c1 e0 07             	shl    $0x7,%eax
  100a3a:	01 c8                	add    %ecx,%eax
  100a3c:	01 c0                	add    %eax,%eax
  100a3e:	01 c8                	add    %ecx,%eax
  100a40:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100a43:	89 14 c5 40 5d 10 00 	mov    %edx,0x105d40(,%eax,8)
  100a4a:	89 d0                	mov    %edx,%eax
  100a4c:	c1 e0 07             	shl    $0x7,%eax
  100a4f:	01 d0                	add    %edx,%eax
  100a51:	01 c0                	add    %eax,%eax
  100a53:	01 d0                	add    %edx,%eax
  100a55:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100a58:	89 0c c5 3c 5d 10 00 	mov    %ecx,0x105d3c(,%eax,8)
  100a5f:	89 15 24 33 10 00    	mov    %edx,0x103324
  100a65:	83 ec 0c             	sub    $0xc,%esp
  100a68:	68 7c 18 10 00       	push   $0x10187c
  100a6d:	e8 ca 0b 00 00       	call   10163c <printk>
  100a72:	58                   	pop    %eax
  100a73:	5a                   	pop    %edx
  100a74:	ff 35 24 33 10 00    	pushl  0x103324
  100a7a:	53                   	push   %ebx
  100a7b:	68 68 1a 10 00       	push   $0x101a68
  100a80:	6a 74                	push   $0x74
  100a82:	68 5a 19 10 00       	push   $0x10195a
  100a87:	68 d0 19 10 00       	push   $0x1019d0
  100a8c:	e8 ab 0b 00 00       	call   10163c <printk>
  100a91:	83 c4 14             	add    $0x14,%esp
  100a94:	68 ab 18 10 00       	push   $0x1018ab
  100a99:	e8 9e 0b 00 00       	call   10163c <printk>
  100a9e:	83 c4 10             	add    $0x10,%esp
  100aa1:	89 d8                	mov    %ebx,%eax
  100aa3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100aa6:	c9                   	leave  
  100aa7:	c3                   	ret    
  100aa8:	c7 05 24 33 10 00 ff 	movl   $0xffffffff,0x103324
  100aaf:	ff ff ff 
  100ab2:	eb b1                	jmp    100a65 <get_from_runnable+0x69>
  100ab4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100ab9:	eb e8                	jmp    100aa3 <get_from_runnable+0xa7>
  100abb:	90                   	nop

00100abc <put_into_runnable>:
  100abc:	55                   	push   %ebp
  100abd:	89 e5                	mov    %esp,%ebp
  100abf:	56                   	push   %esi
  100ac0:	53                   	push   %ebx
  100ac1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100ac4:	8b 15 24 33 10 00    	mov    0x103324,%edx
  100aca:	83 fa ff             	cmp    $0xffffffff,%edx
  100acd:	0f 84 f1 00 00 00    	je     100bc4 <put_into_runnable+0x108>
  100ad3:	89 d0                	mov    %edx,%eax
  100ad5:	c1 e0 07             	shl    $0x7,%eax
  100ad8:	01 d0                	add    %edx,%eax
  100ada:	01 c0                	add    %eax,%eax
  100adc:	01 d0                	add    %edx,%eax
  100ade:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100ae1:	8d 34 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%esi
  100ae8:	8b 8e 5c 20 00 00    	mov    0x205c(%esi),%ecx
  100aee:	89 c8                	mov    %ecx,%eax
  100af0:	c1 e0 07             	shl    $0x7,%eax
  100af3:	01 c8                	add    %ecx,%eax
  100af5:	01 c0                	add    %eax,%eax
  100af7:	01 c8                	add    %ecx,%eax
  100af9:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100afc:	89 1c c5 40 5d 10 00 	mov    %ebx,0x105d40(,%eax,8)
  100b03:	89 d8                	mov    %ebx,%eax
  100b05:	c1 e0 07             	shl    $0x7,%eax
  100b08:	01 d8                	add    %ebx,%eax
  100b0a:	01 c0                	add    %eax,%eax
  100b0c:	01 d8                	add    %ebx,%eax
  100b0e:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b11:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100b18:	89 88 5c 20 00 00    	mov    %ecx,0x205c(%eax)
  100b1e:	89 90 60 20 00 00    	mov    %edx,0x2060(%eax)
  100b24:	89 9e 5c 20 00 00    	mov    %ebx,0x205c(%esi)
  100b2a:	89 d8                	mov    %ebx,%eax
  100b2c:	c1 e0 07             	shl    $0x7,%eax
  100b2f:	01 d8                	add    %ebx,%eax
  100b31:	01 c0                	add    %eax,%eax
  100b33:	01 d8                	add    %ebx,%eax
  100b35:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b38:	c7 04 c5 2c 5d 10 00 	movl   $0x1,0x105d2c(,%eax,8)
  100b3f:	01 00 00 00 
  100b43:	85 db                	test   %ebx,%ebx
  100b45:	75 0a                	jne    100b51 <put_into_runnable+0x95>
  100b47:	c7 05 18 5d 10 00 54 	movl   $0x100854,0x105d18
  100b4e:	08 10 00 
  100b51:	83 ec 0c             	sub    $0xc,%esp
  100b54:	68 7c 18 10 00       	push   $0x10187c
  100b59:	e8 de 0a 00 00       	call   10163c <printk>
  100b5e:	58                   	pop    %eax
  100b5f:	5a                   	pop    %edx
  100b60:	53                   	push   %ebx
  100b61:	ff 35 24 33 10 00    	pushl  0x103324
  100b67:	68 54 1a 10 00       	push   $0x101a54
  100b6c:	68 90 00 00 00       	push   $0x90
  100b71:	68 5a 19 10 00       	push   $0x10195a
  100b76:	68 04 1a 10 00       	push   $0x101a04
  100b7b:	e8 bc 0a 00 00       	call   10163c <printk>
  100b80:	83 c4 14             	add    $0x14,%esp
  100b83:	68 ab 18 10 00       	push   $0x1018ab
  100b88:	e8 af 0a 00 00       	call   10163c <printk>
  100b8d:	89 d8                	mov    %ebx,%eax
  100b8f:	c1 e0 07             	shl    $0x7,%eax
  100b92:	01 d8                	add    %ebx,%eax
  100b94:	01 c0                	add    %eax,%eax
  100b96:	01 d8                	add    %ebx,%eax
  100b98:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b9b:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100ba2:	8b 15 c8 3c 10 00    	mov    0x103cc8,%edx
  100ba8:	89 90 50 20 00 00    	mov    %edx,0x2050(%eax)
  100bae:	8b 55 0c             	mov    0xc(%ebp),%edx
  100bb1:	89 90 64 20 00 00    	mov    %edx,0x2064(%eax)
  100bb7:	b8 01 00 00 00       	mov    $0x1,%eax
  100bbc:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100bbf:	5b                   	pop    %ebx
  100bc0:	5e                   	pop    %esi
  100bc1:	5d                   	pop    %ebp
  100bc2:	c3                   	ret    
  100bc3:	90                   	nop
  100bc4:	89 1d 24 33 10 00    	mov    %ebx,0x103324
  100bca:	89 d8                	mov    %ebx,%eax
  100bcc:	c1 e0 07             	shl    $0x7,%eax
  100bcf:	01 d8                	add    %ebx,%eax
  100bd1:	01 c0                	add    %eax,%eax
  100bd3:	01 d8                	add    %ebx,%eax
  100bd5:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100bd8:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100bdf:	89 98 5c 20 00 00    	mov    %ebx,0x205c(%eax)
  100be5:	89 98 60 20 00 00    	mov    %ebx,0x2060(%eax)
  100beb:	e9 3a ff ff ff       	jmp    100b2a <put_into_runnable+0x6e>

00100bf0 <put_into_block>:
  100bf0:	55                   	push   %ebp
  100bf1:	89 e5                	mov    %esp,%ebp
  100bf3:	57                   	push   %edi
  100bf4:	56                   	push   %esi
  100bf5:	53                   	push   %ebx
  100bf6:	8b 45 08             	mov    0x8(%ebp),%eax
  100bf9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100bfc:	8b 0d 20 33 10 00    	mov    0x103320,%ecx
  100c02:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100c05:	0f 84 99 00 00 00    	je     100ca4 <put_into_block+0xb4>
  100c0b:	89 ca                	mov    %ecx,%edx
  100c0d:	c1 e2 07             	shl    $0x7,%edx
  100c10:	01 ca                	add    %ecx,%edx
  100c12:	01 d2                	add    %edx,%edx
  100c14:	01 ca                	add    %ecx,%edx
  100c16:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100c19:	8d 3c d5 e0 3c 10 00 	lea    0x103ce0(,%edx,8),%edi
  100c20:	8b b7 5c 20 00 00    	mov    0x205c(%edi),%esi
  100c26:	89 f2                	mov    %esi,%edx
  100c28:	c1 e2 07             	shl    $0x7,%edx
  100c2b:	01 f2                	add    %esi,%edx
  100c2d:	01 d2                	add    %edx,%edx
  100c2f:	01 f2                	add    %esi,%edx
  100c31:	8d 14 96             	lea    (%esi,%edx,4),%edx
  100c34:	89 04 d5 40 5d 10 00 	mov    %eax,0x105d40(,%edx,8)
  100c3b:	89 c2                	mov    %eax,%edx
  100c3d:	c1 e2 07             	shl    $0x7,%edx
  100c40:	01 c2                	add    %eax,%edx
  100c42:	01 d2                	add    %edx,%edx
  100c44:	01 c2                	add    %eax,%edx
  100c46:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c49:	8d 14 d5 e0 3c 10 00 	lea    0x103ce0(,%edx,8),%edx
  100c50:	89 b2 5c 20 00 00    	mov    %esi,0x205c(%edx)
  100c56:	89 8a 60 20 00 00    	mov    %ecx,0x2060(%edx)
  100c5c:	89 87 5c 20 00 00    	mov    %eax,0x205c(%edi)
  100c62:	89 c2                	mov    %eax,%edx
  100c64:	c1 e2 07             	shl    $0x7,%edx
  100c67:	01 c2                	add    %eax,%edx
  100c69:	01 d2                	add    %edx,%edx
  100c6b:	01 c2                	add    %eax,%edx
  100c6d:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c70:	c1 e2 03             	shl    $0x3,%edx
  100c73:	8d 82 e0 5c 10 00    	lea    0x105ce0(%edx),%eax
  100c79:	b9 13 00 00 00       	mov    $0x13,%ecx
  100c7e:	89 c7                	mov    %eax,%edi
  100c80:	89 de                	mov    %ebx,%esi
  100c82:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100c84:	8b 43 20             	mov    0x20(%ebx),%eax
  100c87:	89 82 34 5d 10 00    	mov    %eax,0x105d34(%edx)
  100c8d:	c7 82 2c 5d 10 00 00 	movl   $0x0,0x105d2c(%edx)
  100c94:	00 00 00 
  100c97:	b8 01 00 00 00       	mov    $0x1,%eax
  100c9c:	5b                   	pop    %ebx
  100c9d:	5e                   	pop    %esi
  100c9e:	5f                   	pop    %edi
  100c9f:	5d                   	pop    %ebp
  100ca0:	c3                   	ret    
  100ca1:	8d 76 00             	lea    0x0(%esi),%esi
  100ca4:	a3 20 33 10 00       	mov    %eax,0x103320
  100ca9:	89 c2                	mov    %eax,%edx
  100cab:	c1 e2 07             	shl    $0x7,%edx
  100cae:	01 c2                	add    %eax,%edx
  100cb0:	01 d2                	add    %edx,%edx
  100cb2:	01 c2                	add    %eax,%edx
  100cb4:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100cb7:	8d 14 d5 e0 3c 10 00 	lea    0x103ce0(,%edx,8),%edx
  100cbe:	89 82 60 20 00 00    	mov    %eax,0x2060(%edx)
  100cc4:	89 82 5c 20 00 00    	mov    %eax,0x205c(%edx)
  100cca:	eb 96                	jmp    100c62 <put_into_block+0x72>

00100ccc <get_from>:
  100ccc:	55                   	push   %ebp
  100ccd:	89 e5                	mov    %esp,%ebp
  100ccf:	56                   	push   %esi
  100cd0:	53                   	push   %ebx
  100cd1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100cd4:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cd7:	85 db                	test   %ebx,%ebx
  100cd9:	0f 8e 01 01 00 00    	jle    100de0 <get_from+0x114>
  100cdf:	39 c3                	cmp    %eax,%ebx
  100ce1:	74 42                	je     100d25 <get_from+0x59>
  100ce3:	89 da                	mov    %ebx,%edx
  100ce5:	c1 e2 07             	shl    $0x7,%edx
  100ce8:	01 da                	add    %ebx,%edx
  100cea:	01 d2                	add    %edx,%edx
  100cec:	01 da                	add    %ebx,%edx
  100cee:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100cf1:	8b 0c d5 40 5d 10 00 	mov    0x105d40(,%edx,8),%ecx
  100cf8:	39 cb                	cmp    %ecx,%ebx
  100cfa:	75 25                	jne    100d21 <get_from+0x55>
  100cfc:	e9 df 00 00 00       	jmp    100de0 <get_from+0x114>
  100d01:	8d 76 00             	lea    0x0(%esi),%esi
  100d04:	89 ca                	mov    %ecx,%edx
  100d06:	c1 e2 07             	shl    $0x7,%edx
  100d09:	01 ca                	add    %ecx,%edx
  100d0b:	01 d2                	add    %edx,%edx
  100d0d:	01 ca                	add    %ecx,%edx
  100d0f:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100d12:	8b 0c d5 40 5d 10 00 	mov    0x105d40(,%edx,8),%ecx
  100d19:	39 cb                	cmp    %ecx,%ebx
  100d1b:	0f 84 bf 00 00 00    	je     100de0 <get_from+0x114>
  100d21:	39 c1                	cmp    %eax,%ecx
  100d23:	75 df                	jne    100d04 <get_from+0x38>
  100d25:	89 c2                	mov    %eax,%edx
  100d27:	c1 e2 07             	shl    $0x7,%edx
  100d2a:	01 c2                	add    %eax,%edx
  100d2c:	01 d2                	add    %edx,%edx
  100d2e:	01 c2                	add    %eax,%edx
  100d30:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100d33:	8b 04 c5 2c 5d 10 00 	mov    0x105d2c(,%eax,8),%eax
  100d3a:	85 c0                	test   %eax,%eax
  100d3c:	0f 84 c2 00 00 00    	je     100e04 <get_from+0x138>
  100d42:	48                   	dec    %eax
  100d43:	75 7f                	jne    100dc4 <get_from+0xf8>
  100d45:	be 24 33 10 00       	mov    $0x103324,%esi
  100d4a:	3b 1e                	cmp    (%esi),%ebx
  100d4c:	74 15                	je     100d63 <get_from+0x97>
  100d4e:	83 ec 08             	sub    $0x8,%esp
  100d51:	68 d2 00 00 00       	push   $0xd2
  100d56:	68 5a 19 10 00       	push   $0x10195a
  100d5b:	e8 50 0a 00 00       	call   1017b0 <abort>
  100d60:	83 c4 10             	add    $0x10,%esp
  100d63:	89 d8                	mov    %ebx,%eax
  100d65:	c1 e0 07             	shl    $0x7,%eax
  100d68:	01 d8                	add    %ebx,%eax
  100d6a:	01 c0                	add    %eax,%eax
  100d6c:	01 d8                	add    %ebx,%eax
  100d6e:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100d71:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100d78:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100d7e:	39 da                	cmp    %ebx,%edx
  100d80:	0f 84 8a 00 00 00    	je     100e10 <get_from+0x144>
  100d86:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100d8c:	89 c8                	mov    %ecx,%eax
  100d8e:	c1 e0 07             	shl    $0x7,%eax
  100d91:	01 c8                	add    %ecx,%eax
  100d93:	01 c0                	add    %eax,%eax
  100d95:	01 c8                	add    %ecx,%eax
  100d97:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100d9a:	89 14 c5 40 5d 10 00 	mov    %edx,0x105d40(,%eax,8)
  100da1:	89 d0                	mov    %edx,%eax
  100da3:	c1 e0 07             	shl    $0x7,%eax
  100da6:	01 d0                	add    %edx,%eax
  100da8:	01 c0                	add    %eax,%eax
  100daa:	01 d0                	add    %edx,%eax
  100dac:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100daf:	89 0c c5 3c 5d 10 00 	mov    %ecx,0x105d3c(,%eax,8)
  100db6:	89 16                	mov    %edx,(%esi)
  100db8:	89 d8                	mov    %ebx,%eax
  100dba:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100dbd:	5b                   	pop    %ebx
  100dbe:	5e                   	pop    %esi
  100dbf:	5d                   	pop    %ebp
  100dc0:	c3                   	ret    
  100dc1:	8d 76 00             	lea    0x0(%esi),%esi
  100dc4:	83 ec 08             	sub    $0x8,%esp
  100dc7:	68 ce 00 00 00       	push   $0xce
  100dcc:	68 5a 19 10 00       	push   $0x10195a
  100dd1:	e8 da 09 00 00       	call   1017b0 <abort>
  100dd6:	a1 00 00 00 00       	mov    0x0,%eax
  100ddb:	0f 0b                	ud2    
  100ddd:	8d 76 00             	lea    0x0(%esi),%esi
  100de0:	83 ec 08             	sub    $0x8,%esp
  100de3:	68 bf 00 00 00       	push   $0xbf
  100de8:	68 5a 19 10 00       	push   $0x10195a
  100ded:	e8 be 09 00 00       	call   1017b0 <abort>
  100df2:	83 c4 10             	add    $0x10,%esp
  100df5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100dfa:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100dfd:	5b                   	pop    %ebx
  100dfe:	5e                   	pop    %esi
  100dff:	5d                   	pop    %ebp
  100e00:	c3                   	ret    
  100e01:	8d 76 00             	lea    0x0(%esi),%esi
  100e04:	be 20 33 10 00       	mov    $0x103320,%esi
  100e09:	e9 3c ff ff ff       	jmp    100d4a <get_from+0x7e>
  100e0e:	66 90                	xchg   %ax,%ax
  100e10:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100e16:	89 d8                	mov    %ebx,%eax
  100e18:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e1b:	5b                   	pop    %ebx
  100e1c:	5e                   	pop    %esi
  100e1d:	5d                   	pop    %ebp
  100e1e:	c3                   	ret    
  100e1f:	90                   	nop

00100e20 <get_from_block>:
  100e20:	55                   	push   %ebp
  100e21:	89 e5                	mov    %esp,%ebp
  100e23:	83 ec 10             	sub    $0x10,%esp
  100e26:	ff 75 08             	pushl  0x8(%ebp)
  100e29:	ff 35 20 33 10 00    	pushl  0x103320
  100e2f:	e8 98 fe ff ff       	call   100ccc <get_from>
  100e34:	83 c4 10             	add    $0x10,%esp
  100e37:	40                   	inc    %eax
  100e38:	74 0a                	je     100e44 <get_from_block+0x24>
  100e3a:	b8 01 00 00 00       	mov    $0x1,%eax
  100e3f:	c9                   	leave  
  100e40:	c3                   	ret    
  100e41:	8d 76 00             	lea    0x0(%esi),%esi
  100e44:	83 ec 08             	sub    $0x8,%esp
  100e47:	68 09 01 00 00       	push   $0x109
  100e4c:	68 5a 19 10 00       	push   $0x10195a
  100e51:	e8 5a 09 00 00       	call   1017b0 <abort>
  100e56:	83 c4 10             	add    $0x10,%esp
  100e59:	b8 01 00 00 00       	mov    $0x1,%eax
  100e5e:	c9                   	leave  
  100e5f:	c3                   	ret    

00100e60 <check_block>:
  100e60:	55                   	push   %ebp
  100e61:	89 e5                	mov    %esp,%ebp
  100e63:	57                   	push   %edi
  100e64:	56                   	push   %esi
  100e65:	53                   	push   %ebx
  100e66:	83 ec 0c             	sub    $0xc,%esp
  100e69:	a1 20 33 10 00       	mov    0x103320,%eax
  100e6e:	89 c6                	mov    %eax,%esi
  100e70:	83 f8 ff             	cmp    $0xffffffff,%eax
  100e73:	74 58                	je     100ecd <check_block+0x6d>
  100e75:	89 c2                	mov    %eax,%edx
  100e77:	c1 e2 07             	shl    $0x7,%edx
  100e7a:	01 c2                	add    %eax,%edx
  100e7c:	01 d2                	add    %edx,%edx
  100e7e:	01 c2                	add    %eax,%edx
  100e80:	8d 3c 90             	lea    (%eax,%edx,4),%edi
  100e83:	eb 0c                	jmp    100e91 <check_block+0x31>
  100e85:	8d 76 00             	lea    0x0(%esi),%esi
  100e88:	39 c6                	cmp    %eax,%esi
  100e8a:	74 3c                	je     100ec8 <check_block+0x68>
  100e8c:	83 f8 ff             	cmp    $0xffffffff,%eax
  100e8f:	74 37                	je     100ec8 <check_block+0x68>
  100e91:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
  100e98:	8b 8b 34 5d 10 00    	mov    0x105d34(%ebx),%ecx
  100e9e:	85 c9                	test   %ecx,%ecx
  100ea0:	7f e6                	jg     100e88 <check_block+0x28>
  100ea2:	83 ec 0c             	sub    $0xc,%esp
  100ea5:	56                   	push   %esi
  100ea6:	e8 75 ff ff ff       	call   100e20 <get_from_block>
  100eab:	58                   	pop    %eax
  100eac:	5a                   	pop    %edx
  100ead:	81 c3 e0 5c 10 00    	add    $0x105ce0,%ebx
  100eb3:	53                   	push   %ebx
  100eb4:	56                   	push   %esi
  100eb5:	e8 02 fc ff ff       	call   100abc <put_into_runnable>
  100eba:	83 c4 10             	add    $0x10,%esp
  100ebd:	a1 20 33 10 00       	mov    0x103320,%eax
  100ec2:	39 c6                	cmp    %eax,%esi
  100ec4:	75 c6                	jne    100e8c <check_block+0x2c>
  100ec6:	66 90                	xchg   %ax,%ax
  100ec8:	be 01 00 00 00       	mov    $0x1,%esi
  100ecd:	89 f0                	mov    %esi,%eax
  100ecf:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100ed2:	5b                   	pop    %ebx
  100ed3:	5e                   	pop    %esi
  100ed4:	5f                   	pop    %edi
  100ed5:	5d                   	pop    %ebp
  100ed6:	c3                   	ret    
  100ed7:	90                   	nop

00100ed8 <checkTimeCount>:
  100ed8:	a1 c4 3c 10 00       	mov    0x103cc4,%eax
  100edd:	85 c0                	test   %eax,%eax
  100edf:	0f 84 fb 00 00 00    	je     100fe0 <checkTimeCount+0x108>
  100ee5:	55                   	push   %ebp
  100ee6:	89 e5                	mov    %esp,%ebp
  100ee8:	57                   	push   %edi
  100ee9:	56                   	push   %esi
  100eea:	83 ec 0c             	sub    $0xc,%esp
  100eed:	68 7c 18 10 00       	push   $0x10187c
  100ef2:	e8 45 07 00 00       	call   10163c <printk>
  100ef7:	5e                   	pop    %esi
  100ef8:	ff 35 c0 3c 10 00    	pushl  0x103cc0
  100efe:	68 7c 1a 10 00       	push   $0x101a7c
  100f03:	6a 31                	push   $0x31
  100f05:	68 5a 19 10 00       	push   $0x10195a
  100f0a:	68 86 19 10 00       	push   $0x101986
  100f0f:	e8 28 07 00 00       	call   10163c <printk>
  100f14:	83 c4 14             	add    $0x14,%esp
  100f17:	68 ab 18 10 00       	push   $0x1018ab
  100f1c:	e8 1b 07 00 00       	call   10163c <printk>
  100f21:	c7 04 24 7c 18 10 00 	movl   $0x10187c,(%esp)
  100f28:	e8 0f 07 00 00       	call   10163c <printk>
  100f2d:	5f                   	pop    %edi
  100f2e:	8b 15 c0 3c 10 00    	mov    0x103cc0,%edx
  100f34:	89 d0                	mov    %edx,%eax
  100f36:	c1 e0 07             	shl    $0x7,%eax
  100f39:	01 d0                	add    %edx,%eax
  100f3b:	01 c0                	add    %eax,%eax
  100f3d:	01 d0                	add    %edx,%eax
  100f3f:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100f42:	ff 34 c5 30 5d 10 00 	pushl  0x105d30(,%eax,8)
  100f49:	68 7c 1a 10 00       	push   $0x101a7c
  100f4e:	6a 32                	push   $0x32
  100f50:	68 5a 19 10 00       	push   $0x10195a
  100f55:	68 34 1a 10 00       	push   $0x101a34
  100f5a:	e8 dd 06 00 00       	call   10163c <printk>
  100f5f:	83 c4 14             	add    $0x14,%esp
  100f62:	68 ab 18 10 00       	push   $0x1018ab
  100f67:	e8 d0 06 00 00       	call   10163c <printk>
  100f6c:	e8 ef fe ff ff       	call   100e60 <check_block>
  100f71:	8b 15 c0 3c 10 00    	mov    0x103cc0,%edx
  100f77:	89 d0                	mov    %edx,%eax
  100f79:	c1 e0 07             	shl    $0x7,%eax
  100f7c:	01 d0                	add    %edx,%eax
  100f7e:	01 c0                	add    %eax,%eax
  100f80:	01 d0                	add    %edx,%eax
  100f82:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100f85:	c1 e0 03             	shl    $0x3,%eax
  100f88:	83 c4 10             	add    $0x10,%esp
  100f8b:	8b 88 30 5d 10 00    	mov    0x105d30(%eax),%ecx
  100f91:	85 c9                	test   %ecx,%ecx
  100f93:	7e 0f                	jle    100fa4 <checkTimeCount+0xcc>
  100f95:	b8 01 00 00 00       	mov    $0x1,%eax
  100f9a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100f9d:	5e                   	pop    %esi
  100f9e:	5f                   	pop    %edi
  100f9f:	5d                   	pop    %ebp
  100fa0:	c3                   	ret    
  100fa1:	8d 76 00             	lea    0x0(%esi),%esi
  100fa4:	05 e0 5c 10 00       	add    $0x105ce0,%eax
  100fa9:	b9 13 00 00 00       	mov    $0x13,%ecx
  100fae:	89 c7                	mov    %eax,%edi
  100fb0:	8b 75 08             	mov    0x8(%ebp),%esi
  100fb3:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100fb5:	83 ec 08             	sub    $0x8,%esp
  100fb8:	ff 75 08             	pushl  0x8(%ebp)
  100fbb:	52                   	push   %edx
  100fbc:	e8 fb fa ff ff       	call   100abc <put_into_runnable>
  100fc1:	e8 36 fa ff ff       	call   1009fc <get_from_runnable>
  100fc6:	5a                   	pop    %edx
  100fc7:	59                   	pop    %ecx
  100fc8:	ff 75 08             	pushl  0x8(%ebp)
  100fcb:	50                   	push   %eax
  100fcc:	e8 8b f8 ff ff       	call   10085c <put_into_running>
  100fd1:	83 c4 10             	add    $0x10,%esp
  100fd4:	b8 01 00 00 00       	mov    $0x1,%eax
  100fd9:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100fdc:	5e                   	pop    %esi
  100fdd:	5f                   	pop    %edi
  100fde:	5d                   	pop    %ebp
  100fdf:	c3                   	ret    
  100fe0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100fe5:	c3                   	ret    
  100fe6:	66 90                	xchg   %ax,%ax

00100fe8 <check_is_in>:
  100fe8:	55                   	push   %ebp
  100fe9:	89 e5                	mov    %esp,%ebp
  100feb:	53                   	push   %ebx
  100fec:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100fef:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100ff2:	85 c9                	test   %ecx,%ecx
  100ff4:	7e 4a                	jle    101040 <check_is_in+0x58>
  100ff6:	39 d9                	cmp    %ebx,%ecx
  100ff8:	74 3b                	je     101035 <check_is_in+0x4d>
  100ffa:	89 c8                	mov    %ecx,%eax
  100ffc:	c1 e0 07             	shl    $0x7,%eax
  100fff:	01 c8                	add    %ecx,%eax
  101001:	01 c0                	add    %eax,%eax
  101003:	01 c8                	add    %ecx,%eax
  101005:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  101008:	8b 14 c5 40 5d 10 00 	mov    0x105d40(,%eax,8),%edx
  10100f:	39 d1                	cmp    %edx,%ecx
  101011:	75 1e                	jne    101031 <check_is_in+0x49>
  101013:	eb 2b                	jmp    101040 <check_is_in+0x58>
  101015:	8d 76 00             	lea    0x0(%esi),%esi
  101018:	89 d0                	mov    %edx,%eax
  10101a:	c1 e0 07             	shl    $0x7,%eax
  10101d:	01 d0                	add    %edx,%eax
  10101f:	01 c0                	add    %eax,%eax
  101021:	01 d0                	add    %edx,%eax
  101023:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101026:	8b 14 c5 40 5d 10 00 	mov    0x105d40(,%eax,8),%edx
  10102d:	39 d1                	cmp    %edx,%ecx
  10102f:	74 0f                	je     101040 <check_is_in+0x58>
  101031:	39 d3                	cmp    %edx,%ebx
  101033:	75 e3                	jne    101018 <check_is_in+0x30>
  101035:	b8 01 00 00 00       	mov    $0x1,%eax
  10103a:	5b                   	pop    %ebx
  10103b:	5d                   	pop    %ebp
  10103c:	c3                   	ret    
  10103d:	8d 76 00             	lea    0x0(%esi),%esi
  101040:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101045:	5b                   	pop    %ebx
  101046:	5d                   	pop    %ebp
  101047:	c3                   	ret    

00101048 <block_decrease>:
  101048:	55                   	push   %ebp
  101049:	89 e5                	mov    %esp,%ebp
  10104b:	8b 0d 20 33 10 00    	mov    0x103320,%ecx
  101051:	83 f9 ff             	cmp    $0xffffffff,%ecx
  101054:	74 2e                	je     101084 <block_decrease+0x3c>
  101056:	89 ca                	mov    %ecx,%edx
  101058:	89 d0                	mov    %edx,%eax
  10105a:	c1 e0 07             	shl    $0x7,%eax
  10105d:	01 d0                	add    %edx,%eax
  10105f:	01 c0                	add    %eax,%eax
  101061:	01 d0                	add    %edx,%eax
  101063:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101066:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  10106d:	ff 88 54 20 00 00    	decl   0x2054(%eax)
  101073:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  101079:	39 d1                	cmp    %edx,%ecx
  10107b:	75 db                	jne    101058 <block_decrease+0x10>
  10107d:	b8 01 00 00 00       	mov    $0x1,%eax
  101082:	5d                   	pop    %ebp
  101083:	c3                   	ret    
  101084:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101089:	5d                   	pop    %ebp
  10108a:	c3                   	ret    
  10108b:	90                   	nop

0010108c <init_pcb>:
  10108c:	55                   	push   %ebp
  10108d:	89 e5                	mov    %esp,%ebp
  10108f:	c7 05 c8 3c 10 00 05 	movl   $0x5,0x103cc8
  101096:	00 00 00 
  101099:	ba 38 5d 10 00       	mov    $0x105d38,%edx
  10109e:	31 c0                	xor    %eax,%eax
  1010a0:	89 02                	mov    %eax,(%edx)
  1010a2:	8d 48 ff             	lea    -0x1(%eax),%ecx
  1010a5:	89 4a 04             	mov    %ecx,0x4(%edx)
  1010a8:	40                   	inc    %eax
  1010a9:	89 42 08             	mov    %eax,0x8(%edx)
  1010ac:	81 c2 68 20 00 00    	add    $0x2068,%edx
  1010b2:	3d 00 08 00 00       	cmp    $0x800,%eax
  1010b7:	75 e7                	jne    1010a0 <init_pcb+0x14>
  1010b9:	c7 05 3c 5d 10 00 ff 	movl   $0x7ff,0x105d3c
  1010c0:	07 00 00 
  1010c3:	c7 05 d8 7c 13 01 00 	movl   $0x0,0x1137cd8
  1010ca:	00 00 00 
  1010cd:	5d                   	pop    %ebp
  1010ce:	c3                   	ret    
  1010cf:	90                   	nop

001010d0 <init_kernel_pcb>:
  1010d0:	55                   	push   %ebp
  1010d1:	89 e5                	mov    %esp,%ebp
  1010d3:	c7 05 28 5d 10 00 10 	movl   $0x10,0x105d28
  1010da:	00 00 00 
  1010dd:	c7 05 1c 5d 10 00 08 	movl   $0x8,0x105d1c
  1010e4:	00 00 00 
  1010e7:	c7 05 ec 5c 10 00 10 	movl   $0x10,0x105cec
  1010ee:	00 00 00 
  1010f1:	c7 05 e8 5c 10 00 10 	movl   $0x10,0x105ce8
  1010f8:	00 00 00 
  1010fb:	c7 05 18 5d 10 00 54 	movl   $0x100854,0x105d18
  101102:	08 10 00 
  101105:	c7 05 24 5d 10 00 00 	movl   $0x400000,0x105d24
  10110c:	00 40 00 
  10110f:	c7 05 2c 5d 10 00 01 	movl   $0x1,0x105d2c
  101116:	00 00 00 
  101119:	c7 05 30 5d 10 00 04 	movl   $0x4,0x105d30
  101120:	00 00 00 
  101123:	b8 01 00 00 00       	mov    $0x1,%eax
  101128:	5d                   	pop    %ebp
  101129:	c3                   	ret    
  10112a:	66 90                	xchg   %ax,%ax

0010112c <transfer_pid_state>:
  10112c:	55                   	push   %ebp
  10112d:	89 e5                	mov    %esp,%ebp
  10112f:	b8 01 00 00 00       	mov    $0x1,%eax
  101134:	5d                   	pop    %ebp
  101135:	c3                   	ret    
  101136:	66 90                	xchg   %ax,%ax

00101138 <make_pcb>:
  101138:	55                   	push   %ebp
  101139:	89 e5                	mov    %esp,%ebp
  10113b:	57                   	push   %edi
  10113c:	56                   	push   %esi
  10113d:	8b 55 08             	mov    0x8(%ebp),%edx
  101140:	89 d0                	mov    %edx,%eax
  101142:	c1 e0 07             	shl    $0x7,%eax
  101145:	01 d0                	add    %edx,%eax
  101147:	01 c0                	add    %eax,%eax
  101149:	01 d0                	add    %edx,%eax
  10114b:	8d 14 82             	lea    (%edx,%eax,4),%edx
  10114e:	c1 e2 03             	shl    $0x3,%edx
  101151:	8d 82 e0 5c 10 00    	lea    0x105ce0(%edx),%eax
  101157:	b9 13 00 00 00       	mov    $0x13,%ecx
  10115c:	89 c7                	mov    %eax,%edi
  10115e:	8b 75 0c             	mov    0xc(%ebp),%esi
  101161:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101163:	8b 45 10             	mov    0x10(%ebp),%eax
  101166:	89 82 2c 5d 10 00    	mov    %eax,0x105d2c(%edx)
  10116c:	8b 45 14             	mov    0x14(%ebp),%eax
  10116f:	89 82 30 5d 10 00    	mov    %eax,0x105d30(%edx)
  101175:	8b 45 18             	mov    0x18(%ebp),%eax
  101178:	89 82 34 5d 10 00    	mov    %eax,0x105d34(%edx)
  10117e:	8b 45 0c             	mov    0xc(%ebp),%eax
  101181:	89 82 44 5d 10 00    	mov    %eax,0x105d44(%edx)
  101187:	b8 01 00 00 00       	mov    $0x1,%eax
  10118c:	5e                   	pop    %esi
  10118d:	5f                   	pop    %edi
  10118e:	5d                   	pop    %ebp
  10118f:	c3                   	ret    

00101190 <initIdt>:
  101190:	55                   	push   %ebp
  101191:	89 e5                	mov    %esp,%ebp
  101193:	53                   	push   %ebx
  101194:	ba 47 18 10 00       	mov    $0x101847,%edx
  101199:	89 d3                	mov    %edx,%ebx
  10119b:	c1 ea 10             	shr    $0x10,%edx
  10119e:	b9 a0 85 13 01       	mov    $0x11385a0,%ecx
  1011a3:	b8 a0 7d 13 01       	mov    $0x1137da0,%eax
  1011a8:	66 89 18             	mov    %bx,(%eax)
  1011ab:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  1011b1:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  1011b5:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  1011b9:	66 89 50 06          	mov    %dx,0x6(%eax)
  1011bd:	83 c0 08             	add    $0x8,%eax
  1011c0:	39 c1                	cmp    %eax,%ecx
  1011c2:	75 e4                	jne    1011a8 <initIdt+0x18>
  1011c4:	b8 4d 18 10 00       	mov    $0x10184d,%eax
  1011c9:	66 a3 08 7e 13 01    	mov    %ax,0x1137e08
  1011cf:	66 c7 05 0a 7e 13 01 	movw   $0x8,0x1137e0a
  1011d6:	08 00 
  1011d8:	c6 05 0c 7e 13 01 00 	movb   $0x0,0x1137e0c
  1011df:	c6 05 0d 7e 13 01 8f 	movb   $0x8f,0x1137e0d
  1011e6:	c1 e8 10             	shr    $0x10,%eax
  1011e9:	66 a3 0e 7e 13 01    	mov    %ax,0x1137e0e
  1011ef:	b8 51 18 10 00       	mov    $0x101851,%eax
  1011f4:	66 a3 a0 81 13 01    	mov    %ax,0x11381a0
  1011fa:	66 c7 05 a2 81 13 01 	movw   $0x8,0x11381a2
  101201:	08 00 
  101203:	c6 05 a4 81 13 01 00 	movb   $0x0,0x11381a4
  10120a:	c6 05 a5 81 13 01 ee 	movb   $0xee,0x11381a5
  101211:	c1 e8 10             	shr    $0x10,%eax
  101214:	66 a3 a6 81 13 01    	mov    %ax,0x11381a6
  10121a:	b8 5a 18 10 00       	mov    $0x10185a,%eax
  10121f:	66 a3 a0 7e 13 01    	mov    %ax,0x1137ea0
  101225:	66 c7 05 a2 7e 13 01 	movw   $0x8,0x1137ea2
  10122c:	08 00 
  10122e:	c6 05 a4 7e 13 01 00 	movb   $0x0,0x1137ea4
  101235:	c6 05 a5 7e 13 01 8e 	movb   $0x8e,0x1137ea5
  10123c:	c1 e8 10             	shr    $0x10,%eax
  10123f:	66 a3 a6 7e 13 01    	mov    %ax,0x1137ea6
  101245:	66 c7 05 50 34 10 00 	movw   $0x7ff,0x103450
  10124c:	ff 07 
  10124e:	b8 a0 7d 13 01       	mov    $0x1137da0,%eax
  101253:	66 a3 52 34 10 00    	mov    %ax,0x103452
  101259:	c1 e8 10             	shr    $0x10,%eax
  10125c:	66 a3 54 34 10 00    	mov    %ax,0x103454
  101262:	b8 50 34 10 00       	mov    $0x103450,%eax
  101267:	0f 01 18             	lidtl  (%eax)
  10126a:	5b                   	pop    %ebx
  10126b:	5d                   	pop    %ebp
  10126c:	c3                   	ret    
  10126d:	66 90                	xchg   %ax,%ax
  10126f:	90                   	nop

00101270 <syscallHandle>:
  101270:	55                   	push   %ebp
  101271:	89 e5                	mov    %esp,%ebp
  101273:	53                   	push   %ebx
  101274:	50                   	push   %eax
  101275:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101278:	8b 43 2c             	mov    0x2c(%ebx),%eax
  10127b:	83 f8 02             	cmp    $0x2,%eax
  10127e:	74 28                	je     1012a8 <syscallHandle+0x38>
  101280:	76 3a                	jbe    1012bc <syscallHandle+0x4c>
  101282:	83 f8 04             	cmp    $0x4,%eax
  101285:	74 15                	je     10129c <syscallHandle+0x2c>
  101287:	3d e6 00 00 00       	cmp    $0xe6,%eax
  10128c:	75 29                	jne    1012b7 <syscallHandle+0x47>
  10128e:	89 5d 08             	mov    %ebx,0x8(%ebp)
  101291:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101294:	c9                   	leave  
  101295:	e9 e6 f2 ff ff       	jmp    100580 <sys_sleep>
  10129a:	66 90                	xchg   %ax,%ax
  10129c:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10129f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012a2:	c9                   	leave  
  1012a3:	e9 04 f5 ff ff       	jmp    1007ac <sys_write>
  1012a8:	83 ec 0c             	sub    $0xc,%esp
  1012ab:	53                   	push   %ebx
  1012ac:	e8 53 f3 ff ff       	call   100604 <sys_fork>
  1012b1:	89 43 2c             	mov    %eax,0x2c(%ebx)
  1012b4:	83 c4 10             	add    $0x10,%esp
  1012b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012ba:	c9                   	leave  
  1012bb:	c3                   	ret    
  1012bc:	48                   	dec    %eax
  1012bd:	75 f8                	jne    1012b7 <syscallHandle+0x47>
  1012bf:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1012c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012c5:	c9                   	leave  
  1012c6:	e9 8d f2 ff ff       	jmp    100558 <sys_exit>
  1012cb:	90                   	nop

001012cc <GProtectFaultHandle>:
  1012cc:	55                   	push   %ebp
  1012cd:	89 e5                	mov    %esp,%ebp
  1012cf:	83 ec 14             	sub    $0x14,%esp
  1012d2:	68 7c 18 10 00       	push   $0x10187c
  1012d7:	e8 60 03 00 00       	call   10163c <printk>
  1012dc:	58                   	pop    %eax
  1012dd:	8b 45 08             	mov    0x8(%ebp),%eax
  1012e0:	ff 70 30             	pushl  0x30(%eax)
  1012e3:	68 f0 1a 10 00       	push   $0x101af0
  1012e8:	6a 73                	push   $0x73
  1012ea:	68 9d 1a 10 00       	push   $0x101a9d
  1012ef:	68 b0 1a 10 00       	push   $0x101ab0
  1012f4:	e8 43 03 00 00       	call   10163c <printk>
  1012f9:	83 c4 14             	add    $0x14,%esp
  1012fc:	68 ab 18 10 00       	push   $0x1018ab
  101301:	e8 36 03 00 00       	call   10163c <printk>
  101306:	5a                   	pop    %edx
  101307:	59                   	pop    %ecx
  101308:	6a 74                	push   $0x74
  10130a:	68 9d 1a 10 00       	push   $0x101a9d
  10130f:	e8 9c 04 00 00       	call   1017b0 <abort>
  101314:	83 c4 10             	add    $0x10,%esp
  101317:	c9                   	leave  
  101318:	c3                   	ret    
  101319:	8d 76 00             	lea    0x0(%esi),%esi

0010131c <timeHandle>:
  10131c:	55                   	push   %ebp
  10131d:	89 e5                	mov    %esp,%ebp
  10131f:	53                   	push   %ebx
  101320:	83 ec 10             	sub    $0x10,%esp
  101323:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101326:	6a 41                	push   $0x41
  101328:	e8 0b f5 ff ff       	call   100838 <putChar>
  10132d:	e8 9a f6 ff ff       	call   1009cc <getpid>
  101332:	89 c2                	mov    %eax,%edx
  101334:	c1 e2 07             	shl    $0x7,%edx
  101337:	01 c2                	add    %eax,%edx
  101339:	01 d2                	add    %edx,%edx
  10133b:	01 c2                	add    %eax,%edx
  10133d:	8d 04 90             	lea    (%eax,%edx,4),%eax
  101340:	ff 0c c5 30 5d 10 00 	decl   0x105d30(,%eax,8)
  101347:	e8 fc fc ff ff       	call   101048 <block_decrease>
  10134c:	89 1c 24             	mov    %ebx,(%esp)
  10134f:	e8 84 fb ff ff       	call   100ed8 <checkTimeCount>
  101354:	83 c4 10             	add    $0x10,%esp
  101357:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  10135e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101361:	c9                   	leave  
  101362:	e9 d1 f4 ff ff       	jmp    100838 <putChar>
  101367:	90                   	nop

00101368 <irqHandle>:
  101368:	55                   	push   %ebp
  101369:	89 e5                	mov    %esp,%ebp
  10136b:	57                   	push   %edi
  10136c:	56                   	push   %esi
  10136d:	53                   	push   %ebx
  10136e:	83 ec 0c             	sub    $0xc,%esp
  101371:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101374:	b8 10 00 00 00       	mov    $0x10,%eax
  101379:	89 c0                	mov    %eax,%eax
  10137b:	8e d8                	mov    %eax,%ds
  10137d:	8e e0                	mov    %eax,%fs
  10137f:	8e c0                	mov    %eax,%es
  101381:	b8 30 00 00 00       	mov    $0x30,%eax
  101386:	89 c0                	mov    %eax,%eax
  101388:	8e e8                	mov    %eax,%gs
  10138a:	89 ee                	mov    %ebp,%esi
  10138c:	3b 5e 08             	cmp    0x8(%esi),%ebx
  10138f:	74 12                	je     1013a3 <irqHandle+0x3b>
  101391:	83 ec 08             	sub    $0x8,%esp
  101394:	6a 1f                	push   $0x1f
  101396:	68 9d 1a 10 00       	push   $0x101a9d
  10139b:	e8 10 04 00 00       	call   1017b0 <abort>
  1013a0:	83 c4 10             	add    $0x10,%esp
  1013a3:	e8 24 f6 ff ff       	call   1009cc <getpid>
  1013a8:	89 c7                	mov    %eax,%edi
  1013aa:	fa                   	cli    
  1013ab:	8b 43 30             	mov    0x30(%ebx),%eax
  1013ae:	83 f8 0d             	cmp    $0xd,%eax
  1013b1:	0f 84 f1 00 00 00    	je     1014a8 <irqHandle+0x140>
  1013b7:	0f 8e 97 00 00 00    	jle    101454 <irqHandle+0xec>
  1013bd:	83 f8 20             	cmp    $0x20,%eax
  1013c0:	74 2e                	je     1013f0 <irqHandle+0x88>
  1013c2:	83 c0 80             	add    $0xffffff80,%eax
  1013c5:	0f 85 8c 00 00 00    	jne    101457 <irqHandle+0xef>
  1013cb:	83 ec 0c             	sub    $0xc,%esp
  1013ce:	53                   	push   %ebx
  1013cf:	e8 9c fe ff ff       	call   101270 <syscallHandle>
  1013d4:	8b 43 30             	mov    0x30(%ebx),%eax
  1013d7:	83 c4 10             	add    $0x10,%esp
  1013da:	3d 80 00 00 00       	cmp    $0x80,%eax
  1013df:	74 27                	je     101408 <irqHandle+0xa0>
  1013e1:	83 f8 20             	cmp    $0x20,%eax
  1013e4:	74 22                	je     101408 <irqHandle+0xa0>
  1013e6:	fb                   	sti    
  1013e7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1013ea:	5b                   	pop    %ebx
  1013eb:	5e                   	pop    %esi
  1013ec:	5f                   	pop    %edi
  1013ed:	5d                   	pop    %ebp
  1013ee:	c3                   	ret    
  1013ef:	90                   	nop
  1013f0:	83 ec 0c             	sub    $0xc,%esp
  1013f3:	53                   	push   %ebx
  1013f4:	e8 23 ff ff ff       	call   10131c <timeHandle>
  1013f9:	8b 43 30             	mov    0x30(%ebx),%eax
  1013fc:	83 c4 10             	add    $0x10,%esp
  1013ff:	3d 80 00 00 00       	cmp    $0x80,%eax
  101404:	75 db                	jne    1013e1 <irqHandle+0x79>
  101406:	66 90                	xchg   %ax,%ax
  101408:	e8 bf f5 ff ff       	call   1009cc <getpid>
  10140d:	39 c7                	cmp    %eax,%edi
  10140f:	74 d5                	je     1013e6 <irqHandle+0x7e>
  101411:	e8 b6 f5 ff ff       	call   1009cc <getpid>
  101416:	89 c2                	mov    %eax,%edx
  101418:	c1 e2 07             	shl    $0x7,%edx
  10141b:	01 c2                	add    %eax,%edx
  10141d:	01 d2                	add    %edx,%edx
  10141f:	01 c2                	add    %eax,%edx
  101421:	8d 04 90             	lea    (%eax,%edx,4),%eax
  101424:	8d 1c c5 90 5c 10 00 	lea    0x105c90(,%eax,8),%ebx
  10142b:	89 5e 08             	mov    %ebx,0x8(%esi)
  10142e:	e8 99 f5 ff ff       	call   1009cc <getpid>
  101433:	89 c2                	mov    %eax,%edx
  101435:	c1 e2 07             	shl    $0x7,%edx
  101438:	01 c2                	add    %eax,%edx
  10143a:	01 d2                	add    %edx,%edx
  10143c:	01 c2                	add    %eax,%edx
  10143e:	8d 04 90             	lea    (%eax,%edx,4),%eax
  101441:	8d 34 c5 e0 5c 10 00 	lea    0x105ce0(,%eax,8),%esi
  101448:	b9 13 00 00 00       	mov    $0x13,%ecx
  10144d:	89 df                	mov    %ebx,%edi
  10144f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101451:	eb 93                	jmp    1013e6 <irqHandle+0x7e>
  101453:	90                   	nop
  101454:	40                   	inc    %eax
  101455:	74 8f                	je     1013e6 <irqHandle+0x7e>
  101457:	83 ec 0c             	sub    $0xc,%esp
  10145a:	68 7c 18 10 00       	push   $0x10187c
  10145f:	e8 d8 01 00 00       	call   10163c <printk>
  101464:	58                   	pop    %eax
  101465:	5a                   	pop    %edx
  101466:	ff 73 38             	pushl  0x38(%ebx)
  101469:	ff 73 30             	pushl  0x30(%ebx)
  10146c:	68 04 1b 10 00       	push   $0x101b04
  101471:	6a 36                	push   $0x36
  101473:	68 9d 1a 10 00       	push   $0x101a9d
  101478:	68 c8 1a 10 00       	push   $0x101ac8
  10147d:	e8 ba 01 00 00       	call   10163c <printk>
  101482:	83 c4 14             	add    $0x14,%esp
  101485:	68 ab 18 10 00       	push   $0x1018ab
  10148a:	e8 ad 01 00 00       	call   10163c <printk>
  10148f:	59                   	pop    %ecx
  101490:	58                   	pop    %eax
  101491:	6a 37                	push   $0x37
  101493:	68 9d 1a 10 00       	push   $0x101a9d
  101498:	e8 13 03 00 00       	call   1017b0 <abort>
  10149d:	8b 43 30             	mov    0x30(%ebx),%eax
  1014a0:	83 c4 10             	add    $0x10,%esp
  1014a3:	e9 32 ff ff ff       	jmp    1013da <irqHandle+0x72>
  1014a8:	83 ec 0c             	sub    $0xc,%esp
  1014ab:	53                   	push   %ebx
  1014ac:	e8 1b fe ff ff       	call   1012cc <GProtectFaultHandle>
  1014b1:	8b 43 30             	mov    0x30(%ebx),%eax
  1014b4:	83 c4 10             	add    $0x10,%esp
  1014b7:	e9 1e ff ff ff       	jmp    1013da <irqHandle+0x72>

001014bc <initIntr>:
  1014bc:	55                   	push   %ebp
  1014bd:	89 e5                	mov    %esp,%ebp
  1014bf:	ba 21 00 00 00       	mov    $0x21,%edx
  1014c4:	b0 ff                	mov    $0xff,%al
  1014c6:	ee                   	out    %al,(%dx)
  1014c7:	ba a1 00 00 00       	mov    $0xa1,%edx
  1014cc:	ee                   	out    %al,(%dx)
  1014cd:	ba 20 00 00 00       	mov    $0x20,%edx
  1014d2:	b0 11                	mov    $0x11,%al
  1014d4:	ee                   	out    %al,(%dx)
  1014d5:	ba 21 00 00 00       	mov    $0x21,%edx
  1014da:	b0 20                	mov    $0x20,%al
  1014dc:	ee                   	out    %al,(%dx)
  1014dd:	b0 04                	mov    $0x4,%al
  1014df:	ee                   	out    %al,(%dx)
  1014e0:	b0 03                	mov    $0x3,%al
  1014e2:	ee                   	out    %al,(%dx)
  1014e3:	ba a0 00 00 00       	mov    $0xa0,%edx
  1014e8:	b0 11                	mov    $0x11,%al
  1014ea:	ee                   	out    %al,(%dx)
  1014eb:	ba a1 00 00 00       	mov    $0xa1,%edx
  1014f0:	b0 28                	mov    $0x28,%al
  1014f2:	ee                   	out    %al,(%dx)
  1014f3:	b0 02                	mov    $0x2,%al
  1014f5:	ee                   	out    %al,(%dx)
  1014f6:	b0 03                	mov    $0x3,%al
  1014f8:	ee                   	out    %al,(%dx)
  1014f9:	ba 20 00 00 00       	mov    $0x20,%edx
  1014fe:	b0 68                	mov    $0x68,%al
  101500:	ee                   	out    %al,(%dx)
  101501:	b0 0a                	mov    $0xa,%al
  101503:	ee                   	out    %al,(%dx)
  101504:	ba a0 00 00 00       	mov    $0xa0,%edx
  101509:	b0 68                	mov    $0x68,%al
  10150b:	ee                   	out    %al,(%dx)
  10150c:	b0 0a                	mov    $0xa,%al
  10150e:	ee                   	out    %al,(%dx)
  10150f:	5d                   	pop    %ebp
  101510:	c3                   	ret    
  101511:	8d 76 00             	lea    0x0(%esi),%esi

00101514 <initTimer>:
  101514:	55                   	push   %ebp
  101515:	89 e5                	mov    %esp,%ebp
  101517:	ba 43 00 00 00       	mov    $0x43,%edx
  10151c:	b0 34                	mov    $0x34,%al
  10151e:	ee                   	out    %al,(%dx)
  10151f:	ba 40 00 00 00       	mov    $0x40,%edx
  101524:	b0 9b                	mov    $0x9b,%al
  101526:	ee                   	out    %al,(%dx)
  101527:	b0 2e                	mov    $0x2e,%al
  101529:	ee                   	out    %al,(%dx)
  10152a:	5d                   	pop    %ebp
  10152b:	c3                   	ret    

0010152c <i2A>:
  10152c:	55                   	push   %ebp
  10152d:	89 e5                	mov    %esp,%ebp
  10152f:	57                   	push   %edi
  101530:	56                   	push   %esi
  101531:	53                   	push   %ebx
  101532:	51                   	push   %ecx
  101533:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101536:	85 c9                	test   %ecx,%ecx
  101538:	78 6e                	js     1015a8 <i2A+0x7c>
  10153a:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  10153e:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  101542:	bb 9e 34 10 00       	mov    $0x10349e,%ebx
  101547:	31 ff                	xor    %edi,%edi
  101549:	eb 03                	jmp    10154e <i2A+0x22>
  10154b:	90                   	nop
  10154c:	89 f7                	mov    %esi,%edi
  10154e:	4b                   	dec    %ebx
  10154f:	89 c8                	mov    %ecx,%eax
  101551:	be 0a 00 00 00       	mov    $0xa,%esi
  101556:	99                   	cltd   
  101557:	f7 fe                	idiv   %esi
  101559:	83 c2 30             	add    $0x30,%edx
  10155c:	88 13                	mov    %dl,(%ebx)
  10155e:	8d 77 01             	lea    0x1(%edi),%esi
  101561:	b8 67 66 66 66       	mov    $0x66666667,%eax
  101566:	f7 e9                	imul   %ecx
  101568:	89 d0                	mov    %edx,%eax
  10156a:	c1 f8 02             	sar    $0x2,%eax
  10156d:	c1 f9 1f             	sar    $0x1f,%ecx
  101570:	29 c8                	sub    %ecx,%eax
  101572:	89 c1                	mov    %eax,%ecx
  101574:	75 d6                	jne    10154c <i2A+0x20>
  101576:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  10157a:	74 20                	je     10159c <i2A+0x70>
  10157c:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  101580:	75 06                	jne    101588 <i2A+0x5c>
  101582:	fe 05 9d 34 10 00    	incb   0x10349d
  101588:	c6 05 9e 34 10 00 00 	movb   $0x0,0x10349e
  10158f:	8b 45 0c             	mov    0xc(%ebp),%eax
  101592:	89 18                	mov    %ebx,(%eax)
  101594:	89 f0                	mov    %esi,%eax
  101596:	5a                   	pop    %edx
  101597:	5b                   	pop    %ebx
  101598:	5e                   	pop    %esi
  101599:	5f                   	pop    %edi
  10159a:	5d                   	pop    %ebp
  10159b:	c3                   	ret    
  10159c:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  1015a0:	8d 77 02             	lea    0x2(%edi),%esi
  1015a3:	4b                   	dec    %ebx
  1015a4:	eb d6                	jmp    10157c <i2A+0x50>
  1015a6:	66 90                	xchg   %ax,%ax
  1015a8:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  1015ae:	74 0c                	je     1015bc <i2A+0x90>
  1015b0:	f7 d9                	neg    %ecx
  1015b2:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  1015b6:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  1015ba:	eb 86                	jmp    101542 <i2A+0x16>
  1015bc:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  1015c1:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  1015c5:	eb ef                	jmp    1015b6 <i2A+0x8a>
  1015c7:	90                   	nop

001015c8 <i2X>:
  1015c8:	55                   	push   %ebp
  1015c9:	89 e5                	mov    %esp,%ebp
  1015cb:	57                   	push   %edi
  1015cc:	56                   	push   %esi
  1015cd:	53                   	push   %ebx
  1015ce:	8b 55 08             	mov    0x8(%ebp),%edx
  1015d1:	b9 7d 34 10 00       	mov    $0x10347d,%ecx
  1015d6:	31 c0                	xor    %eax,%eax
  1015d8:	40                   	inc    %eax
  1015d9:	89 d6                	mov    %edx,%esi
  1015db:	83 e6 0f             	and    $0xf,%esi
  1015de:	8d 5e f6             	lea    -0xa(%esi),%ebx
  1015e1:	89 cf                	mov    %ecx,%edi
  1015e3:	83 fb 05             	cmp    $0x5,%ebx
  1015e6:	77 4c                	ja     101634 <i2X+0x6c>
  1015e8:	ff 24 9d 10 1b 10 00 	jmp    *0x101b10(,%ebx,4)
  1015ef:	90                   	nop
  1015f0:	c6 01 65             	movb   $0x65,(%ecx)
  1015f3:	90                   	nop
  1015f4:	49                   	dec    %ecx
  1015f5:	c1 ea 04             	shr    $0x4,%edx
  1015f8:	75 de                	jne    1015d8 <i2X+0x10>
  1015fa:	c6 05 7e 34 10 00 00 	movb   $0x0,0x10347e
  101601:	8b 55 0c             	mov    0xc(%ebp),%edx
  101604:	89 3a                	mov    %edi,(%edx)
  101606:	5b                   	pop    %ebx
  101607:	5e                   	pop    %esi
  101608:	5f                   	pop    %edi
  101609:	5d                   	pop    %ebp
  10160a:	c3                   	ret    
  10160b:	90                   	nop
  10160c:	c6 01 64             	movb   $0x64,(%ecx)
  10160f:	eb e3                	jmp    1015f4 <i2X+0x2c>
  101611:	8d 76 00             	lea    0x0(%esi),%esi
  101614:	c6 01 63             	movb   $0x63,(%ecx)
  101617:	eb db                	jmp    1015f4 <i2X+0x2c>
  101619:	8d 76 00             	lea    0x0(%esi),%esi
  10161c:	c6 01 62             	movb   $0x62,(%ecx)
  10161f:	eb d3                	jmp    1015f4 <i2X+0x2c>
  101621:	8d 76 00             	lea    0x0(%esi),%esi
  101624:	c6 01 61             	movb   $0x61,(%ecx)
  101627:	eb cb                	jmp    1015f4 <i2X+0x2c>
  101629:	8d 76 00             	lea    0x0(%esi),%esi
  10162c:	c6 01 66             	movb   $0x66,(%ecx)
  10162f:	eb c3                	jmp    1015f4 <i2X+0x2c>
  101631:	8d 76 00             	lea    0x0(%esi),%esi
  101634:	8d 5e 30             	lea    0x30(%esi),%ebx
  101637:	88 19                	mov    %bl,(%ecx)
  101639:	eb b9                	jmp    1015f4 <i2X+0x2c>
  10163b:	90                   	nop

0010163c <printk>:
  10163c:	55                   	push   %ebp
  10163d:	89 e5                	mov    %esp,%ebp
  10163f:	57                   	push   %edi
  101640:	56                   	push   %esi
  101641:	53                   	push   %ebx
  101642:	83 ec 2c             	sub    $0x2c,%esp
  101645:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101648:	8a 11                	mov    (%ecx),%dl
  10164a:	84 d2                	test   %dl,%dl
  10164c:	0f 84 54 01 00 00    	je     1017a6 <printk+0x16a>
  101652:	8d 45 0c             	lea    0xc(%ebp),%eax
  101655:	31 ff                	xor    %edi,%edi
  101657:	eb 18                	jmp    101671 <printk+0x35>
  101659:	8d 76 00             	lea    0x0(%esi),%esi
  10165c:	8a 11                	mov    (%ecx),%dl
  10165e:	89 cb                	mov    %ecx,%ebx
  101660:	88 97 a0 34 10 00    	mov    %dl,0x1034a0(%edi)
  101666:	47                   	inc    %edi
  101667:	8d 4b 01             	lea    0x1(%ebx),%ecx
  10166a:	8a 53 01             	mov    0x1(%ebx),%dl
  10166d:	84 d2                	test   %dl,%dl
  10166f:	74 72                	je     1016e3 <printk+0xa7>
  101671:	80 fa 25             	cmp    $0x25,%dl
  101674:	75 e6                	jne    10165c <printk+0x20>
  101676:	8d 59 01             	lea    0x1(%ecx),%ebx
  101679:	8a 51 01             	mov    0x1(%ecx),%dl
  10167c:	80 fa 64             	cmp    $0x64,%dl
  10167f:	0f 84 bf 00 00 00    	je     101744 <printk+0x108>
  101685:	0f 8e 01 01 00 00    	jle    10178c <printk+0x150>
  10168b:	80 fa 73             	cmp    $0x73,%dl
  10168e:	0f 84 84 00 00 00    	je     101718 <printk+0xdc>
  101694:	80 fa 78             	cmp    $0x78,%dl
  101697:	75 c7                	jne    101660 <printk+0x24>
  101699:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1016a0:	8d 70 04             	lea    0x4(%eax),%esi
  1016a3:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1016a6:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  1016a9:	56                   	push   %esi
  1016aa:	ff 30                	pushl  (%eax)
  1016ac:	e8 17 ff ff ff       	call   1015c8 <i2X>
  1016b1:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1016b4:	8d b7 a0 34 10 00    	lea    0x1034a0(%edi),%esi
  1016ba:	8a 11                	mov    (%ecx),%dl
  1016bc:	83 c4 08             	add    $0x8,%esp
  1016bf:	31 c0                	xor    %eax,%eax
  1016c1:	84 d2                	test   %dl,%dl
  1016c3:	74 0f                	je     1016d4 <printk+0x98>
  1016c5:	8d 76 00             	lea    0x0(%esi),%esi
  1016c8:	40                   	inc    %eax
  1016c9:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1016cd:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  1016d0:	84 d2                	test   %dl,%dl
  1016d2:	75 f4                	jne    1016c8 <printk+0x8c>
  1016d4:	01 c7                	add    %eax,%edi
  1016d6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1016d9:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1016dc:	8a 53 01             	mov    0x1(%ebx),%dl
  1016df:	84 d2                	test   %dl,%dl
  1016e1:	75 8e                	jne    101671 <printk+0x35>
  1016e3:	c6 87 a0 34 10 00 00 	movb   $0x0,0x1034a0(%edi)
  1016ea:	0f be 05 a0 34 10 00 	movsbl 0x1034a0,%eax
  1016f1:	bb a0 34 10 00       	mov    $0x1034a0,%ebx
  1016f6:	84 c0                	test   %al,%al
  1016f8:	74 16                	je     101710 <printk+0xd4>
  1016fa:	66 90                	xchg   %ax,%ax
  1016fc:	83 ec 0c             	sub    $0xc,%esp
  1016ff:	50                   	push   %eax
  101700:	e8 33 f1 ff ff       	call   100838 <putChar>
  101705:	43                   	inc    %ebx
  101706:	0f be 03             	movsbl (%ebx),%eax
  101709:	83 c4 10             	add    $0x10,%esp
  10170c:	84 c0                	test   %al,%al
  10170e:	75 ec                	jne    1016fc <printk+0xc0>
  101710:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101713:	5b                   	pop    %ebx
  101714:	5e                   	pop    %esi
  101715:	5f                   	pop    %edi
  101716:	5d                   	pop    %ebp
  101717:	c3                   	ret    
  101718:	8d 70 04             	lea    0x4(%eax),%esi
  10171b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10171e:	8b 08                	mov    (%eax),%ecx
  101720:	8d b7 a0 34 10 00    	lea    0x1034a0(%edi),%esi
  101726:	8a 11                	mov    (%ecx),%dl
  101728:	31 c0                	xor    %eax,%eax
  10172a:	84 d2                	test   %dl,%dl
  10172c:	74 a6                	je     1016d4 <printk+0x98>
  10172e:	66 90                	xchg   %ax,%ax
  101730:	40                   	inc    %eax
  101731:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101735:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  101738:	84 d2                	test   %dl,%dl
  10173a:	75 f4                	jne    101730 <printk+0xf4>
  10173c:	01 c7                	add    %eax,%edi
  10173e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101741:	eb 96                	jmp    1016d9 <printk+0x9d>
  101743:	90                   	nop
  101744:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10174b:	8d 70 04             	lea    0x4(%eax),%esi
  10174e:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101751:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101754:	56                   	push   %esi
  101755:	ff 30                	pushl  (%eax)
  101757:	e8 d0 fd ff ff       	call   10152c <i2A>
  10175c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  10175f:	8d b7 a0 34 10 00    	lea    0x1034a0(%edi),%esi
  101765:	8a 11                	mov    (%ecx),%dl
  101767:	83 c4 08             	add    $0x8,%esp
  10176a:	31 c0                	xor    %eax,%eax
  10176c:	84 d2                	test   %dl,%dl
  10176e:	0f 84 60 ff ff ff    	je     1016d4 <printk+0x98>
  101774:	40                   	inc    %eax
  101775:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101779:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  10177c:	84 d2                	test   %dl,%dl
  10177e:	75 f4                	jne    101774 <printk+0x138>
  101780:	01 c7                	add    %eax,%edi
  101782:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101785:	e9 4f ff ff ff       	jmp    1016d9 <printk+0x9d>
  10178a:	66 90                	xchg   %ax,%ax
  10178c:	80 fa 63             	cmp    $0x63,%dl
  10178f:	0f 85 cb fe ff ff    	jne    101660 <printk+0x24>
  101795:	8b 10                	mov    (%eax),%edx
  101797:	88 97 a0 34 10 00    	mov    %dl,0x1034a0(%edi)
  10179d:	83 c0 04             	add    $0x4,%eax
  1017a0:	47                   	inc    %edi
  1017a1:	e9 c1 fe ff ff       	jmp    101667 <printk+0x2b>
  1017a6:	31 ff                	xor    %edi,%edi
  1017a8:	e9 36 ff ff ff       	jmp    1016e3 <printk+0xa7>
  1017ad:	66 90                	xchg   %ax,%ax
  1017af:	90                   	nop

001017b0 <abort>:
  1017b0:	55                   	push   %ebp
  1017b1:	89 e5                	mov    %esp,%ebp
  1017b3:	57                   	push   %edi
  1017b4:	56                   	push   %esi
  1017b5:	53                   	push   %ebx
  1017b6:	83 ec 1c             	sub    $0x1c,%esp
  1017b9:	8b 55 08             	mov    0x8(%ebp),%edx
  1017bc:	fa                   	cli    
  1017bd:	8a 02                	mov    (%edx),%al
  1017bf:	b9 52 33 10 00       	mov    $0x103352,%ecx
  1017c4:	84 c0                	test   %al,%al
  1017c6:	74 0b                	je     1017d3 <abort+0x23>
  1017c8:	41                   	inc    %ecx
  1017c9:	42                   	inc    %edx
  1017ca:	88 41 ff             	mov    %al,-0x1(%ecx)
  1017cd:	8a 02                	mov    (%edx),%al
  1017cf:	84 c0                	test   %al,%al
  1017d1:	75 f5                	jne    1017c8 <abort+0x18>
  1017d3:	c6 01 3a             	movb   $0x3a,(%ecx)
  1017d6:	bb bd 3c 10 00       	mov    $0x103cbd,%ebx
  1017db:	be 0a 00 00 00       	mov    $0xa,%esi
  1017e0:	bf 67 66 66 66       	mov    $0x66666667,%edi
  1017e5:	4b                   	dec    %ebx
  1017e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1017e9:	99                   	cltd   
  1017ea:	f7 fe                	idiv   %esi
  1017ec:	8d 42 30             	lea    0x30(%edx),%eax
  1017ef:	88 45 e7             	mov    %al,-0x19(%ebp)
  1017f2:	88 03                	mov    %al,(%ebx)
  1017f4:	89 f8                	mov    %edi,%eax
  1017f6:	f7 6d 0c             	imull  0xc(%ebp)
  1017f9:	c1 fa 02             	sar    $0x2,%edx
  1017fc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1017ff:	c1 f8 1f             	sar    $0x1f,%eax
  101802:	29 c2                	sub    %eax,%edx
  101804:	89 55 0c             	mov    %edx,0xc(%ebp)
  101807:	75 dc                	jne    1017e5 <abort+0x35>
  101809:	41                   	inc    %ecx
  10180a:	41                   	inc    %ecx
  10180b:	43                   	inc    %ebx
  10180c:	8a 45 e7             	mov    -0x19(%ebp),%al
  10180f:	88 41 ff             	mov    %al,-0x1(%ecx)
  101812:	8a 03                	mov    (%ebx),%al
  101814:	88 45 e7             	mov    %al,-0x19(%ebp)
  101817:	84 c0                	test   %al,%al
  101819:	75 ef                	jne    10180a <abort+0x5a>
  10181b:	c6 01 0a             	movb   $0xa,(%ecx)
  10181e:	0f be 05 40 33 10 00 	movsbl 0x103340,%eax
  101825:	84 c0                	test   %al,%al
  101827:	74 1b                	je     101844 <abort+0x94>
  101829:	bb 40 33 10 00       	mov    $0x103340,%ebx
  10182e:	83 ec 0c             	sub    $0xc,%esp
  101831:	50                   	push   %eax
  101832:	e8 01 f0 ff ff       	call   100838 <putChar>
  101837:	43                   	inc    %ebx
  101838:	0f be 03             	movsbl (%ebx),%eax
  10183b:	83 c4 10             	add    $0x10,%esp
  10183e:	84 c0                	test   %al,%al
  101840:	75 ec                	jne    10182e <abort+0x7e>
  101842:	66 90                	xchg   %ax,%ax
  101844:	f4                   	hlt    
  101845:	eb fd                	jmp    101844 <abort+0x94>

00101847 <irqEmpty>:
  101847:	6a 00                	push   $0x0
  101849:	6a ff                	push   $0xffffffff
  10184b:	eb 13                	jmp    101860 <asmDoIrq>

0010184d <irqGProtectFault>:
  10184d:	6a 0d                	push   $0xd
  10184f:	eb 0f                	jmp    101860 <asmDoIrq>

00101851 <irqSyscall>:
  101851:	6a 00                	push   $0x0
  101853:	68 80 00 00 00       	push   $0x80
  101858:	eb 06                	jmp    101860 <asmDoIrq>

0010185a <irqTime>:
  10185a:	6a 00                	push   $0x0
  10185c:	6a 20                	push   $0x20
  10185e:	eb 00                	jmp    101860 <asmDoIrq>

00101860 <asmDoIrq>:
  101860:	60                   	pusha  
  101861:	1e                   	push   %ds
  101862:	06                   	push   %es
  101863:	0f a0                	push   %fs
  101865:	0f a8                	push   %gs
  101867:	54                   	push   %esp
  101868:	e8 fb fa ff ff       	call   101368 <irqHandle>
  10186d:	5c                   	pop    %esp
  10186e:	0f a9                	pop    %gs
  101870:	0f a1                	pop    %fs
  101872:	07                   	pop    %es
  101873:	1f                   	pop    %ds
  101874:	61                   	popa   
  101875:	83 c4 04             	add    $0x4,%esp
  101878:	83 c4 04             	add    $0x4,%esp
  10187b:	cf                   	iret   
