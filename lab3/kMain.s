
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 05 15 00 00       	call   101510 <initTimer>
  10000b:	e8 78 10 00 00       	call   101088 <init_pcb>
  100010:	e8 b7 10 00 00       	call   1010cc <init_kernel_pcb>
  100015:	e8 da 07 00 00       	call   1007f4 <initSerial>
  10001a:	e8 6d 11 00 00       	call   10118c <initIdt>
  10001f:	e8 94 14 00 00       	call   1014b8 <initIntr>
  100024:	e8 4f 02 00 00       	call   100278 <initSeg>
  100029:	fb                   	sti    
  10002a:	e8 71 04 00 00       	call   1004a0 <loadUMain>
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
  100133:	68 78 18 10 00       	push   $0x101878
  100138:	e8 fb 14 00 00       	call   101638 <printk>
  10013d:	89 1c 24             	mov    %ebx,(%esp)
  100140:	68 b8 18 10 00       	push   $0x1018b8
  100145:	6a 18                	push   $0x18
  100147:	68 7e 18 10 00       	push   $0x10187e
  10014c:	68 8b 18 10 00       	push   $0x10188b
  100151:	e8 e2 14 00 00       	call   101638 <printk>
  100156:	83 c4 14             	add    $0x14,%esp
  100159:	68 a7 18 10 00       	push   $0x1018a7
  10015e:	e8 d5 14 00 00       	call   101638 <printk>
  100163:	58                   	pop    %eax
  100164:	5a                   	pop    %edx
  100165:	6a 19                	push   $0x19
  100167:	68 7e 18 10 00       	push   $0x10187e
  10016c:	e8 3b 16 00 00       	call   1017ac <abort>
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
  10036d:	a1 b0 18 10 00       	mov    0x1018b0,%eax
  100372:	8b 15 b4 18 10 00    	mov    0x1018b4,%edx
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
  10046a:	c7 05 8c 7d 10 00 00 	movl   $0x401000,0x107d8c
  100471:	10 40 00 
  100474:	8b 45 08             	mov    0x8(%ebp),%eax
  100477:	a3 80 7d 10 00       	mov    %eax,0x107d80
  10047c:	c7 05 98 7d 10 00 0a 	movl   $0xa,0x107d98
  100483:	00 00 00 
  100486:	6a 00                	push   $0x0
  100488:	6a 01                	push   $0x1
  10048a:	e8 29 06 00 00       	call   100ab8 <put_into_runnable>
  10048f:	83 c4 10             	add    $0x10,%esp
  100492:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  100499:	c9                   	leave  
  10049a:	e9 41 ff ff ff       	jmp    1003e0 <enterUserSpace_pcb>
  10049f:	90                   	nop

001004a0 <loadUMain>:
  1004a0:	55                   	push   %ebp
  1004a1:	89 e5                	mov    %esp,%ebp
  1004a3:	57                   	push   %edi
  1004a4:	56                   	push   %esi
  1004a5:	53                   	push   %ebx
  1004a6:	83 ec 0c             	sub    $0xc,%esp
  1004a9:	bb c9 00 00 00       	mov    $0xc9,%ebx
  1004ae:	be 00 00 03 00       	mov    $0x30000,%esi
  1004b3:	90                   	nop
  1004b4:	53                   	push   %ebx
  1004b5:	56                   	push   %esi
  1004b6:	e8 45 fd ff ff       	call   100200 <readSect>
  1004bb:	81 c6 00 02 00 00    	add    $0x200,%esi
  1004c1:	43                   	inc    %ebx
  1004c2:	58                   	pop    %eax
  1004c3:	5a                   	pop    %edx
  1004c4:	81 fb 91 01 00 00    	cmp    $0x191,%ebx
  1004ca:	75 e8                	jne    1004b4 <loadUMain+0x14>
  1004cc:	a1 1c 00 03 00       	mov    0x3001c,%eax
  1004d1:	8d 90 00 00 03 00    	lea    0x30000(%eax),%edx
  1004d7:	0f b7 35 2c 00 03 00 	movzwl 0x3002c,%esi
  1004de:	c1 e6 05             	shl    $0x5,%esi
  1004e1:	01 d6                	add    %edx,%esi
  1004e3:	39 f2                	cmp    %esi,%edx
  1004e5:	72 0c                	jb     1004f3 <loadUMain+0x53>
  1004e7:	eb 53                	jmp    10053c <loadUMain+0x9c>
  1004e9:	8d 76 00             	lea    0x0(%esi),%esi
  1004ec:	83 c2 20             	add    $0x20,%edx
  1004ef:	39 d6                	cmp    %edx,%esi
  1004f1:	76 49                	jbe    10053c <loadUMain+0x9c>
  1004f3:	83 3a 01             	cmpl   $0x1,(%edx)
  1004f6:	75 f4                	jne    1004ec <loadUMain+0x4c>
  1004f8:	8b 42 08             	mov    0x8(%edx),%eax
  1004fb:	8b 7a 10             	mov    0x10(%edx),%edi
  1004fe:	8b 5a 04             	mov    0x4(%edx),%ebx
  100501:	29 c3                	sub    %eax,%ebx
  100503:	31 c9                	xor    %ecx,%ecx
  100505:	85 ff                	test   %edi,%edi
  100507:	74 16                	je     10051f <loadUMain+0x7f>
  100509:	8d 76 00             	lea    0x0(%esi),%esi
  10050c:	8a 8c 03 00 00 03 00 	mov    0x30000(%ebx,%eax,1),%cl
  100513:	88 08                	mov    %cl,(%eax)
  100515:	40                   	inc    %eax
  100516:	89 c1                	mov    %eax,%ecx
  100518:	2b 4a 08             	sub    0x8(%edx),%ecx
  10051b:	39 cf                	cmp    %ecx,%edi
  10051d:	77 ed                	ja     10050c <loadUMain+0x6c>
  10051f:	8b 5a 14             	mov    0x14(%edx),%ebx
  100522:	39 cb                	cmp    %ecx,%ebx
  100524:	76 c6                	jbe    1004ec <loadUMain+0x4c>
  100526:	66 90                	xchg   %ax,%ax
  100528:	c6 00 00             	movb   $0x0,(%eax)
  10052b:	40                   	inc    %eax
  10052c:	89 c1                	mov    %eax,%ecx
  10052e:	2b 4a 08             	sub    0x8(%edx),%ecx
  100531:	39 cb                	cmp    %ecx,%ebx
  100533:	77 f3                	ja     100528 <loadUMain+0x88>
  100535:	83 c2 20             	add    $0x20,%edx
  100538:	39 d6                	cmp    %edx,%esi
  10053a:	77 b7                	ja     1004f3 <loadUMain+0x53>
  10053c:	83 ec 0c             	sub    $0xc,%esp
  10053f:	ff 35 18 00 03 00    	pushl  0x30018
  100545:	e8 de fe ff ff       	call   100428 <enterUserSpace>
  10054a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10054d:	5b                   	pop    %ebx
  10054e:	5e                   	pop    %esi
  10054f:	5f                   	pop    %edi
  100550:	5d                   	pop    %ebp
  100551:	c3                   	ret    
  100552:	66 90                	xchg   %ax,%ax

00100554 <sys_exit>:
  100554:	55                   	push   %ebp
  100555:	89 e5                	mov    %esp,%ebp
  100557:	83 ec 14             	sub    $0x14,%esp
  10055a:	68 c3 18 10 00       	push   $0x1018c3
  10055f:	e8 d4 10 00 00       	call   101638 <printk>
  100564:	e8 8f 04 00 00       	call   1009f8 <get_from_runnable>
  100569:	5a                   	pop    %edx
  10056a:	59                   	pop    %ecx
  10056b:	ff 75 08             	pushl  0x8(%ebp)
  10056e:	50                   	push   %eax
  10056f:	e8 e4 02 00 00       	call   100858 <put_into_running>
  100574:	b8 01 00 00 00       	mov    $0x1,%eax
  100579:	c9                   	leave  
  10057a:	c3                   	ret    
  10057b:	90                   	nop

0010057c <sys_sleep>:
  10057c:	55                   	push   %ebp
  10057d:	89 e5                	mov    %esp,%ebp
  10057f:	56                   	push   %esi
  100580:	53                   	push   %ebx
  100581:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100584:	e8 3f 04 00 00       	call   1009c8 <getpid>
  100589:	83 ec 08             	sub    $0x8,%esp
  10058c:	53                   	push   %ebx
  10058d:	50                   	push   %eax
  10058e:	e8 59 06 00 00       	call   100bec <put_into_block>
  100593:	c7 04 24 78 18 10 00 	movl   $0x101878,(%esp)
  10059a:	e8 99 10 00 00       	call   101638 <printk>
  10059f:	e8 24 04 00 00       	call   1009c8 <getpid>
  1005a4:	89 c2                	mov    %eax,%edx
  1005a6:	c1 e2 07             	shl    $0x7,%edx
  1005a9:	01 c2                	add    %eax,%edx
  1005ab:	01 d2                	add    %edx,%edx
  1005ad:	01 c2                	add    %eax,%edx
  1005af:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1005b2:	8b 34 c5 34 5d 10 00 	mov    0x105d34(,%eax,8),%esi
  1005b9:	e8 0a 04 00 00       	call   1009c8 <getpid>
  1005be:	5a                   	pop    %edx
  1005bf:	59                   	pop    %ecx
  1005c0:	56                   	push   %esi
  1005c1:	50                   	push   %eax
  1005c2:	68 14 19 10 00       	push   $0x101914
  1005c7:	6a 09                	push   $0x9
  1005c9:	68 d1 18 10 00       	push   $0x1018d1
  1005ce:	68 f0 18 10 00       	push   $0x1018f0
  1005d3:	e8 60 10 00 00       	call   101638 <printk>
  1005d8:	83 c4 14             	add    $0x14,%esp
  1005db:	68 a7 18 10 00       	push   $0x1018a7
  1005e0:	e8 53 10 00 00       	call   101638 <printk>
  1005e5:	e8 0e 04 00 00       	call   1009f8 <get_from_runnable>
  1005ea:	5e                   	pop    %esi
  1005eb:	5a                   	pop    %edx
  1005ec:	53                   	push   %ebx
  1005ed:	50                   	push   %eax
  1005ee:	e8 65 02 00 00       	call   100858 <put_into_running>
  1005f3:	b8 01 00 00 00       	mov    $0x1,%eax
  1005f8:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1005fb:	5b                   	pop    %ebx
  1005fc:	5e                   	pop    %esi
  1005fd:	5d                   	pop    %ebp
  1005fe:	c3                   	ret    
  1005ff:	90                   	nop

00100600 <sys_fork>:
  100600:	55                   	push   %ebp
  100601:	89 e5                	mov    %esp,%ebp
  100603:	57                   	push   %edi
  100604:	56                   	push   %esi
  100605:	53                   	push   %ebx
  100606:	83 ec 18             	sub    $0x18,%esp
  100609:	8b 75 08             	mov    0x8(%ebp),%esi
  10060c:	68 1e 19 10 00       	push   $0x10191e
  100611:	e8 22 10 00 00       	call   101638 <printk>
  100616:	83 c4 10             	add    $0x10,%esp
  100619:	31 db                	xor    %ebx,%ebx
  10061b:	90                   	nop
  10061c:	e8 a7 03 00 00       	call   1009c8 <getpid>
  100621:	89 c2                	mov    %eax,%edx
  100623:	c1 e2 07             	shl    $0x7,%edx
  100626:	01 c2                	add    %eax,%edx
  100628:	01 d2                	add    %edx,%edx
  10062a:	01 c2                	add    %eax,%edx
  10062c:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10062f:	01 c0                	add    %eax,%eax
  100631:	01 d8                	add    %ebx,%eax
  100633:	8b 04 85 e0 3c 10 00 	mov    0x103ce0(,%eax,4),%eax
  10063a:	89 04 9d b0 7d 10 00 	mov    %eax,0x107db0(,%ebx,4)
  100641:	43                   	inc    %ebx
  100642:	81 fb 00 08 00 00    	cmp    $0x800,%ebx
  100648:	75 d2                	jne    10061c <sys_fork+0x1c>
  10064a:	e8 79 03 00 00       	call   1009c8 <getpid>
  10064f:	8d 90 00 04 00 00    	lea    0x400(%eax),%edx
  100655:	c1 e2 0c             	shl    $0xc,%edx
  100658:	b8 00 10 00 00       	mov    $0x1000,%eax
  10065d:	8d 76 00             	lea    0x0(%esi),%esi
  100660:	8a 8c 10 00 f0 ff ff 	mov    -0x1000(%eax,%edx,1),%cl
  100667:	88 88 00 10 40 00    	mov    %cl,0x401000(%eax)
  10066d:	48                   	dec    %eax
  10066e:	75 f0                	jne    100660 <sys_fork+0x60>
  100670:	b8 b0 9d 10 00       	mov    $0x109db0,%eax
  100675:	b9 13 00 00 00       	mov    $0x13,%ecx
  10067a:	89 c7                	mov    %eax,%edi
  10067c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10067e:	c7 05 dc 9d 10 00 00 	movl   $0x0,0x109ddc
  100685:	00 00 00 
  100688:	c7 05 f4 9d 10 00 00 	movl   $0x402000,0x109df4
  10068f:	20 40 00 
  100692:	83 ec 08             	sub    $0x8,%esp
  100695:	50                   	push   %eax
  100696:	6a 02                	push   $0x2
  100698:	e8 1b 04 00 00       	call   100ab8 <put_into_runnable>
  10069d:	b8 02 00 00 00       	mov    $0x2,%eax
  1006a2:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1006a5:	5b                   	pop    %ebx
  1006a6:	5e                   	pop    %esi
  1006a7:	5f                   	pop    %edi
  1006a8:	5d                   	pop    %ebp
  1006a9:	c3                   	ret    
  1006aa:	66 90                	xchg   %ax,%ax

001006ac <display>:
  1006ac:	55                   	push   %ebp
  1006ad:	89 e5                	mov    %esp,%ebp
  1006af:	57                   	push   %edi
  1006b0:	53                   	push   %ebx
  1006b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1006b4:	80 fb 0a             	cmp    $0xa,%bl
  1006b7:	74 5b                	je     100714 <display+0x68>
  1006b9:	8b 15 48 34 10 00    	mov    0x103448,%edx
  1006bf:	8b 0d 4c 34 10 00    	mov    0x10344c,%ecx
  1006c5:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  1006c8:	c1 e0 04             	shl    $0x4,%eax
  1006cb:	01 d0                	add    %edx,%eax
  1006cd:	01 c0                	add    %eax,%eax
  1006cf:	89 c7                	mov    %eax,%edi
  1006d1:	0f be db             	movsbl %bl,%ebx
  1006d4:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
  1006da:	66 89 d8             	mov    %bx,%ax
  1006dd:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1006e1:	42                   	inc    %edx
  1006e2:	83 fa 50             	cmp    $0x50,%edx
  1006e5:	75 1d                	jne    100704 <display+0x58>
  1006e7:	c7 05 48 34 10 00 00 	movl   $0x0,0x103448
  1006ee:	00 00 00 
  1006f1:	41                   	inc    %ecx
  1006f2:	89 0d 4c 34 10 00    	mov    %ecx,0x10344c
  1006f8:	b8 01 00 00 00       	mov    $0x1,%eax
  1006fd:	5b                   	pop    %ebx
  1006fe:	5f                   	pop    %edi
  1006ff:	5d                   	pop    %ebp
  100700:	c3                   	ret    
  100701:	8d 76 00             	lea    0x0(%esi),%esi
  100704:	89 15 48 34 10 00    	mov    %edx,0x103448
  10070a:	b8 01 00 00 00       	mov    $0x1,%eax
  10070f:	5b                   	pop    %ebx
  100710:	5f                   	pop    %edi
  100711:	5d                   	pop    %ebp
  100712:	c3                   	ret    
  100713:	90                   	nop
  100714:	c7 05 48 34 10 00 00 	movl   $0x0,0x103448
  10071b:	00 00 00 
  10071e:	ff 05 4c 34 10 00    	incl   0x10344c
  100724:	b8 01 00 00 00       	mov    $0x1,%eax
  100729:	5b                   	pop    %ebx
  10072a:	5f                   	pop    %edi
  10072b:	5d                   	pop    %ebp
  10072c:	c3                   	ret    
  10072d:	8d 76 00             	lea    0x0(%esi),%esi

00100730 <printkernel>:
  100730:	55                   	push   %ebp
  100731:	89 e5                	mov    %esp,%ebp
  100733:	53                   	push   %ebx
  100734:	50                   	push   %eax
  100735:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100738:	0f be 03             	movsbl (%ebx),%eax
  10073b:	84 c0                	test   %al,%al
  10073d:	74 20                	je     10075f <printkernel+0x2f>
  10073f:	90                   	nop
  100740:	83 ec 0c             	sub    $0xc,%esp
  100743:	50                   	push   %eax
  100744:	e8 eb 00 00 00       	call   100834 <putChar>
  100749:	0f be 03             	movsbl (%ebx),%eax
  10074c:	89 04 24             	mov    %eax,(%esp)
  10074f:	e8 58 ff ff ff       	call   1006ac <display>
  100754:	43                   	inc    %ebx
  100755:	0f be 03             	movsbl (%ebx),%eax
  100758:	83 c4 10             	add    $0x10,%esp
  10075b:	84 c0                	test   %al,%al
  10075d:	75 e1                	jne    100740 <printkernel+0x10>
  10075f:	b8 01 00 00 00       	mov    $0x1,%eax
  100764:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100767:	c9                   	leave  
  100768:	c3                   	ret    
  100769:	8d 76 00             	lea    0x0(%esi),%esi

0010076c <fs_write>:
  10076c:	55                   	push   %ebp
  10076d:	89 e5                	mov    %esp,%ebp
  10076f:	53                   	push   %ebx
  100770:	50                   	push   %eax
  100771:	8b 5d 10             	mov    0x10(%ebp),%ebx
  100774:	ba 30 00 00 00       	mov    $0x30,%edx
  100779:	89 d0                	mov    %edx,%eax
  10077b:	8e e8                	mov    %eax,%gs
  10077d:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  100781:	74 12                	je     100795 <fs_write+0x29>
  100783:	83 ec 08             	sub    $0x8,%esp
  100786:	6a 27                	push   $0x27
  100788:	68 3a 19 10 00       	push   $0x10193a
  10078d:	e8 1a 10 00 00       	call   1017ac <abort>
  100792:	83 c4 10             	add    $0x10,%esp
  100795:	83 ec 08             	sub    $0x8,%esp
  100798:	53                   	push   %ebx
  100799:	ff 75 0c             	pushl  0xc(%ebp)
  10079c:	e8 8f ff ff ff       	call   100730 <printkernel>
  1007a1:	89 d8                	mov    %ebx,%eax
  1007a3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1007a6:	c9                   	leave  
  1007a7:	c3                   	ret    

001007a8 <sys_write>:
  1007a8:	55                   	push   %ebp
  1007a9:	89 e5                	mov    %esp,%ebp
  1007ab:	53                   	push   %ebx
  1007ac:	83 ec 08             	sub    $0x8,%esp
  1007af:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1007b2:	ff 73 24             	pushl  0x24(%ebx)
  1007b5:	ff 73 28             	pushl  0x28(%ebx)
  1007b8:	ff 73 20             	pushl  0x20(%ebx)
  1007bb:	e8 ac ff ff ff       	call   10076c <fs_write>
  1007c0:	89 43 2c             	mov    %eax,0x2c(%ebx)
  1007c3:	83 c4 10             	add    $0x10,%esp
  1007c6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1007c9:	c9                   	leave  
  1007ca:	c3                   	ret    
  1007cb:	90                   	nop

001007cc <print_char>:
  1007cc:	55                   	push   %ebp
  1007cd:	89 e5                	mov    %esp,%ebp
  1007cf:	57                   	push   %edi
  1007d0:	8b 45 08             	mov    0x8(%ebp),%eax
  1007d3:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1007d6:	c1 e0 04             	shl    $0x4,%eax
  1007d9:	03 45 0c             	add    0xc(%ebp),%eax
  1007dc:	01 c0                	add    %eax,%eax
  1007de:	89 c7                	mov    %eax,%edi
  1007e0:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  1007e4:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  1007ea:	66 89 d0             	mov    %dx,%ax
  1007ed:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1007f1:	5f                   	pop    %edi
  1007f2:	5d                   	pop    %ebp
  1007f3:	c3                   	ret    

001007f4 <initSerial>:
  1007f4:	55                   	push   %ebp
  1007f5:	89 e5                	mov    %esp,%ebp
  1007f7:	ba f9 03 00 00       	mov    $0x3f9,%edx
  1007fc:	31 c0                	xor    %eax,%eax
  1007fe:	ee                   	out    %al,(%dx)
  1007ff:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100804:	b0 80                	mov    $0x80,%al
  100806:	ee                   	out    %al,(%dx)
  100807:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10080c:	b0 01                	mov    $0x1,%al
  10080e:	ee                   	out    %al,(%dx)
  10080f:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100814:	31 c0                	xor    %eax,%eax
  100816:	ee                   	out    %al,(%dx)
  100817:	ba fb 03 00 00       	mov    $0x3fb,%edx
  10081c:	b0 03                	mov    $0x3,%al
  10081e:	ee                   	out    %al,(%dx)
  10081f:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100824:	b0 c7                	mov    $0xc7,%al
  100826:	ee                   	out    %al,(%dx)
  100827:	ba fc 03 00 00       	mov    $0x3fc,%edx
  10082c:	b0 0b                	mov    $0xb,%al
  10082e:	ee                   	out    %al,(%dx)
  10082f:	5d                   	pop    %ebp
  100830:	c3                   	ret    
  100831:	8d 76 00             	lea    0x0(%esi),%esi

00100834 <putChar>:
  100834:	55                   	push   %ebp
  100835:	89 e5                	mov    %esp,%ebp
  100837:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10083a:	ba fd 03 00 00       	mov    $0x3fd,%edx
  10083f:	90                   	nop
  100840:	ec                   	in     (%dx),%al
  100841:	a8 20                	test   $0x20,%al
  100843:	74 fb                	je     100840 <putChar+0xc>
  100845:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10084a:	88 c8                	mov    %cl,%al
  10084c:	ee                   	out    %al,(%dx)
  10084d:	5d                   	pop    %ebp
  10084e:	c3                   	ret    
  10084f:	90                   	nop

00100850 <IDLE>:
  100850:	55                   	push   %ebp
  100851:	89 e5                	mov    %esp,%ebp
  100853:	90                   	nop
  100854:	f4                   	hlt    
  100855:	eb fd                	jmp    100854 <IDLE+0x4>
  100857:	90                   	nop

00100858 <put_into_running>:
  100858:	55                   	push   %ebp
  100859:	89 e5                	mov    %esp,%ebp
  10085b:	53                   	push   %ebx
  10085c:	81 ec d4 00 00 00    	sub    $0xd4,%esp
  100862:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100865:	39 1d c0 3c 10 00    	cmp    %ebx,0x103cc0
  10086b:	0f 84 a9 00 00 00    	je     10091a <put_into_running+0xc2>
  100871:	89 1d c0 3c 10 00    	mov    %ebx,0x103cc0
  100877:	85 db                	test   %ebx,%ebx
  100879:	0f 84 a5 00 00 00    	je     100924 <put_into_running+0xcc>
  10087f:	83 fb 02             	cmp    $0x2,%ebx
  100882:	0f 84 dc 00 00 00    	je     100964 <put_into_running+0x10c>
  100888:	89 da                	mov    %ebx,%edx
  10088a:	83 ec 08             	sub    $0x8,%esp
  10088d:	89 d0                	mov    %edx,%eax
  10088f:	c1 e0 07             	shl    $0x7,%eax
  100892:	01 d0                	add    %edx,%eax
  100894:	01 c0                	add    %eax,%eax
  100896:	01 d0                	add    %edx,%eax
  100898:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10089b:	8d 04 c5 dc 5c 10 00 	lea    0x105cdc(,%eax,8),%eax
  1008a2:	50                   	push   %eax
  1008a3:	6a 10                	push   $0x10
  1008a5:	e8 0a f9 ff ff       	call   1001b4 <change_tss>
  1008aa:	8d 45 94             	lea    -0x6c(%ebp),%eax
  1008ad:	89 04 24             	mov    %eax,(%esp)
  1008b0:	e8 1b f9 ff ff       	call   1001d0 <get_tss>
  1008b5:	89 d8                	mov    %ebx,%eax
  1008b7:	c1 e0 07             	shl    $0x7,%eax
  1008ba:	01 d8                	add    %ebx,%eax
  1008bc:	01 c0                	add    %eax,%eax
  1008be:	01 d8                	add    %ebx,%eax
  1008c0:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1008c3:	8d 04 c5 dc 5c 10 00 	lea    0x105cdc(,%eax,8),%eax
  1008ca:	83 c4 0c             	add    $0xc,%esp
  1008cd:	39 45 98             	cmp    %eax,-0x68(%ebp)
  1008d0:	74 12                	je     1008e4 <put_into_running+0x8c>
  1008d2:	83 ec 08             	sub    $0x8,%esp
  1008d5:	6a 21                	push   $0x21
  1008d7:	68 56 19 10 00       	push   $0x101956
  1008dc:	e8 cb 0e 00 00       	call   1017ac <abort>
  1008e1:	83 c4 10             	add    $0x10,%esp
  1008e4:	83 ec 0c             	sub    $0xc,%esp
  1008e7:	68 78 18 10 00       	push   $0x101878
  1008ec:	e8 47 0d 00 00       	call   101638 <printk>
  1008f1:	89 1c 24             	mov    %ebx,(%esp)
  1008f4:	68 88 1a 10 00       	push   $0x101a88
  1008f9:	6a 24                	push   $0x24
  1008fb:	68 56 19 10 00       	push   $0x101956
  100900:	68 64 19 10 00       	push   $0x101964
  100905:	e8 2e 0d 00 00       	call   101638 <printk>
  10090a:	83 c4 14             	add    $0x14,%esp
  10090d:	68 a7 18 10 00       	push   $0x1018a7
  100912:	e8 21 0d 00 00       	call   101638 <printk>
  100917:	83 c4 10             	add    $0x10,%esp
  10091a:	b8 01 00 00 00       	mov    $0x1,%eax
  10091f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100922:	c9                   	leave  
  100923:	c3                   	ret    
  100924:	83 ec 08             	sub    $0x8,%esp
  100927:	68 dc 5c 10 00       	push   $0x105cdc
  10092c:	6a 10                	push   $0x10
  10092e:	e8 81 f8 ff ff       	call   1001b4 <change_tss>
  100933:	8d 85 30 ff ff ff    	lea    -0xd0(%ebp),%eax
  100939:	89 04 24             	mov    %eax,(%esp)
  10093c:	e8 8f f8 ff ff       	call   1001d0 <get_tss>
  100941:	83 c4 0c             	add    $0xc,%esp
  100944:	81 bd 34 ff ff ff dc 	cmpl   $0x105cdc,-0xcc(%ebp)
  10094b:	5c 10 00 
  10094e:	74 94                	je     1008e4 <put_into_running+0x8c>
  100950:	83 ec 08             	sub    $0x8,%esp
  100953:	6a 14                	push   $0x14
  100955:	68 56 19 10 00       	push   $0x101956
  10095a:	e8 4d 0e 00 00       	call   1017ac <abort>
  10095f:	83 c4 10             	add    $0x10,%esp
  100962:	eb 80                	jmp    1008e4 <put_into_running+0x8c>
  100964:	83 ec 0c             	sub    $0xc,%esp
  100967:	68 78 18 10 00       	push   $0x101878
  10096c:	e8 c7 0c 00 00       	call   101638 <printk>
  100971:	58                   	pop    %eax
  100972:	5a                   	pop    %edx
  100973:	ff 35 90 7d 10 00    	pushl  0x107d90
  100979:	ff 35 8c 7d 10 00    	pushl  0x107d8c
  10097f:	68 88 1a 10 00       	push   $0x101a88
  100984:	6a 1c                	push   $0x1c
  100986:	68 56 19 10 00       	push   $0x101956
  10098b:	68 9c 19 10 00       	push   $0x10199c
  100990:	e8 a3 0c 00 00       	call   101638 <printk>
  100995:	83 c4 14             	add    $0x14,%esp
  100998:	68 a7 18 10 00       	push   $0x1018a7
  10099d:	e8 96 0c 00 00       	call   101638 <printk>
  1009a2:	8b 15 c0 3c 10 00    	mov    0x103cc0,%edx
  1009a8:	83 c4 10             	add    $0x10,%esp
  1009ab:	e9 da fe ff ff       	jmp    10088a <put_into_running+0x32>

001009b0 <update_block>:
  1009b0:	55                   	push   %ebp
  1009b1:	89 e5                	mov    %esp,%ebp
  1009b3:	b8 01 00 00 00       	mov    $0x1,%eax
  1009b8:	5d                   	pop    %ebp
  1009b9:	c3                   	ret    
  1009ba:	66 90                	xchg   %ax,%ax

001009bc <apply_new_pid>:
  1009bc:	55                   	push   %ebp
  1009bd:	89 e5                	mov    %esp,%ebp
  1009bf:	b8 02 00 00 00       	mov    $0x2,%eax
  1009c4:	5d                   	pop    %ebp
  1009c5:	c3                   	ret    
  1009c6:	66 90                	xchg   %ax,%ax

001009c8 <getpid>:
  1009c8:	55                   	push   %ebp
  1009c9:	89 e5                	mov    %esp,%ebp
  1009cb:	a1 c0 3c 10 00       	mov    0x103cc0,%eax
  1009d0:	5d                   	pop    %ebp
  1009d1:	c3                   	ret    
  1009d2:	66 90                	xchg   %ax,%ax

001009d4 <getrunnable>:
  1009d4:	55                   	push   %ebp
  1009d5:	89 e5                	mov    %esp,%ebp
  1009d7:	a1 24 33 10 00       	mov    0x103324,%eax
  1009dc:	5d                   	pop    %ebp
  1009dd:	c3                   	ret    
  1009de:	66 90                	xchg   %ax,%ax

001009e0 <getblocked>:
  1009e0:	55                   	push   %ebp
  1009e1:	89 e5                	mov    %esp,%ebp
  1009e3:	a1 20 33 10 00       	mov    0x103320,%eax
  1009e8:	5d                   	pop    %ebp
  1009e9:	c3                   	ret    
  1009ea:	66 90                	xchg   %ax,%ax

001009ec <transfer_pid_mode>:
  1009ec:	55                   	push   %ebp
  1009ed:	89 e5                	mov    %esp,%ebp
  1009ef:	b8 01 00 00 00       	mov    $0x1,%eax
  1009f4:	5d                   	pop    %ebp
  1009f5:	c3                   	ret    
  1009f6:	66 90                	xchg   %ax,%ax

001009f8 <get_from_runnable>:
  1009f8:	55                   	push   %ebp
  1009f9:	89 e5                	mov    %esp,%ebp
  1009fb:	53                   	push   %ebx
  1009fc:	51                   	push   %ecx
  1009fd:	8b 1d 24 33 10 00    	mov    0x103324,%ebx
  100a03:	83 fb ff             	cmp    $0xffffffff,%ebx
  100a06:	0f 84 a4 00 00 00    	je     100ab0 <get_from_runnable+0xb8>
  100a0c:	89 d8                	mov    %ebx,%eax
  100a0e:	c1 e0 07             	shl    $0x7,%eax
  100a11:	01 d8                	add    %ebx,%eax
  100a13:	01 c0                	add    %eax,%eax
  100a15:	01 d8                	add    %ebx,%eax
  100a17:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100a1a:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100a21:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100a27:	39 da                	cmp    %ebx,%edx
  100a29:	74 79                	je     100aa4 <get_from_runnable+0xac>
  100a2b:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100a31:	89 c8                	mov    %ecx,%eax
  100a33:	c1 e0 07             	shl    $0x7,%eax
  100a36:	01 c8                	add    %ecx,%eax
  100a38:	01 c0                	add    %eax,%eax
  100a3a:	01 c8                	add    %ecx,%eax
  100a3c:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100a3f:	89 14 c5 40 5d 10 00 	mov    %edx,0x105d40(,%eax,8)
  100a46:	89 d0                	mov    %edx,%eax
  100a48:	c1 e0 07             	shl    $0x7,%eax
  100a4b:	01 d0                	add    %edx,%eax
  100a4d:	01 c0                	add    %eax,%eax
  100a4f:	01 d0                	add    %edx,%eax
  100a51:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100a54:	89 0c c5 3c 5d 10 00 	mov    %ecx,0x105d3c(,%eax,8)
  100a5b:	89 15 24 33 10 00    	mov    %edx,0x103324
  100a61:	83 ec 0c             	sub    $0xc,%esp
  100a64:	68 78 18 10 00       	push   $0x101878
  100a69:	e8 ca 0b 00 00       	call   101638 <printk>
  100a6e:	58                   	pop    %eax
  100a6f:	5a                   	pop    %edx
  100a70:	ff 35 24 33 10 00    	pushl  0x103324
  100a76:	53                   	push   %ebx
  100a77:	68 64 1a 10 00       	push   $0x101a64
  100a7c:	6a 74                	push   $0x74
  100a7e:	68 56 19 10 00       	push   $0x101956
  100a83:	68 cc 19 10 00       	push   $0x1019cc
  100a88:	e8 ab 0b 00 00       	call   101638 <printk>
  100a8d:	83 c4 14             	add    $0x14,%esp
  100a90:	68 a7 18 10 00       	push   $0x1018a7
  100a95:	e8 9e 0b 00 00       	call   101638 <printk>
  100a9a:	83 c4 10             	add    $0x10,%esp
  100a9d:	89 d8                	mov    %ebx,%eax
  100a9f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100aa2:	c9                   	leave  
  100aa3:	c3                   	ret    
  100aa4:	c7 05 24 33 10 00 ff 	movl   $0xffffffff,0x103324
  100aab:	ff ff ff 
  100aae:	eb b1                	jmp    100a61 <get_from_runnable+0x69>
  100ab0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100ab5:	eb e8                	jmp    100a9f <get_from_runnable+0xa7>
  100ab7:	90                   	nop

00100ab8 <put_into_runnable>:
  100ab8:	55                   	push   %ebp
  100ab9:	89 e5                	mov    %esp,%ebp
  100abb:	56                   	push   %esi
  100abc:	53                   	push   %ebx
  100abd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100ac0:	8b 15 24 33 10 00    	mov    0x103324,%edx
  100ac6:	83 fa ff             	cmp    $0xffffffff,%edx
  100ac9:	0f 84 f1 00 00 00    	je     100bc0 <put_into_runnable+0x108>
  100acf:	89 d0                	mov    %edx,%eax
  100ad1:	c1 e0 07             	shl    $0x7,%eax
  100ad4:	01 d0                	add    %edx,%eax
  100ad6:	01 c0                	add    %eax,%eax
  100ad8:	01 d0                	add    %edx,%eax
  100ada:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100add:	8d 34 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%esi
  100ae4:	8b 8e 5c 20 00 00    	mov    0x205c(%esi),%ecx
  100aea:	89 c8                	mov    %ecx,%eax
  100aec:	c1 e0 07             	shl    $0x7,%eax
  100aef:	01 c8                	add    %ecx,%eax
  100af1:	01 c0                	add    %eax,%eax
  100af3:	01 c8                	add    %ecx,%eax
  100af5:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100af8:	89 1c c5 40 5d 10 00 	mov    %ebx,0x105d40(,%eax,8)
  100aff:	89 d8                	mov    %ebx,%eax
  100b01:	c1 e0 07             	shl    $0x7,%eax
  100b04:	01 d8                	add    %ebx,%eax
  100b06:	01 c0                	add    %eax,%eax
  100b08:	01 d8                	add    %ebx,%eax
  100b0a:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b0d:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100b14:	89 88 5c 20 00 00    	mov    %ecx,0x205c(%eax)
  100b1a:	89 90 60 20 00 00    	mov    %edx,0x2060(%eax)
  100b20:	89 9e 5c 20 00 00    	mov    %ebx,0x205c(%esi)
  100b26:	89 d8                	mov    %ebx,%eax
  100b28:	c1 e0 07             	shl    $0x7,%eax
  100b2b:	01 d8                	add    %ebx,%eax
  100b2d:	01 c0                	add    %eax,%eax
  100b2f:	01 d8                	add    %ebx,%eax
  100b31:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b34:	c7 04 c5 2c 5d 10 00 	movl   $0x1,0x105d2c(,%eax,8)
  100b3b:	01 00 00 00 
  100b3f:	85 db                	test   %ebx,%ebx
  100b41:	75 0a                	jne    100b4d <put_into_runnable+0x95>
  100b43:	c7 05 18 5d 10 00 50 	movl   $0x100850,0x105d18
  100b4a:	08 10 00 
  100b4d:	83 ec 0c             	sub    $0xc,%esp
  100b50:	68 78 18 10 00       	push   $0x101878
  100b55:	e8 de 0a 00 00       	call   101638 <printk>
  100b5a:	58                   	pop    %eax
  100b5b:	5a                   	pop    %edx
  100b5c:	53                   	push   %ebx
  100b5d:	ff 35 24 33 10 00    	pushl  0x103324
  100b63:	68 50 1a 10 00       	push   $0x101a50
  100b68:	68 90 00 00 00       	push   $0x90
  100b6d:	68 56 19 10 00       	push   $0x101956
  100b72:	68 00 1a 10 00       	push   $0x101a00
  100b77:	e8 bc 0a 00 00       	call   101638 <printk>
  100b7c:	83 c4 14             	add    $0x14,%esp
  100b7f:	68 a7 18 10 00       	push   $0x1018a7
  100b84:	e8 af 0a 00 00       	call   101638 <printk>
  100b89:	89 d8                	mov    %ebx,%eax
  100b8b:	c1 e0 07             	shl    $0x7,%eax
  100b8e:	01 d8                	add    %ebx,%eax
  100b90:	01 c0                	add    %eax,%eax
  100b92:	01 d8                	add    %ebx,%eax
  100b94:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b97:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100b9e:	8b 15 c8 3c 10 00    	mov    0x103cc8,%edx
  100ba4:	89 90 50 20 00 00    	mov    %edx,0x2050(%eax)
  100baa:	8b 55 0c             	mov    0xc(%ebp),%edx
  100bad:	89 90 64 20 00 00    	mov    %edx,0x2064(%eax)
  100bb3:	b8 01 00 00 00       	mov    $0x1,%eax
  100bb8:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100bbb:	5b                   	pop    %ebx
  100bbc:	5e                   	pop    %esi
  100bbd:	5d                   	pop    %ebp
  100bbe:	c3                   	ret    
  100bbf:	90                   	nop
  100bc0:	89 1d 24 33 10 00    	mov    %ebx,0x103324
  100bc6:	89 d8                	mov    %ebx,%eax
  100bc8:	c1 e0 07             	shl    $0x7,%eax
  100bcb:	01 d8                	add    %ebx,%eax
  100bcd:	01 c0                	add    %eax,%eax
  100bcf:	01 d8                	add    %ebx,%eax
  100bd1:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100bd4:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100bdb:	89 98 5c 20 00 00    	mov    %ebx,0x205c(%eax)
  100be1:	89 98 60 20 00 00    	mov    %ebx,0x2060(%eax)
  100be7:	e9 3a ff ff ff       	jmp    100b26 <put_into_runnable+0x6e>

00100bec <put_into_block>:
  100bec:	55                   	push   %ebp
  100bed:	89 e5                	mov    %esp,%ebp
  100bef:	57                   	push   %edi
  100bf0:	56                   	push   %esi
  100bf1:	53                   	push   %ebx
  100bf2:	8b 45 08             	mov    0x8(%ebp),%eax
  100bf5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100bf8:	8b 0d 20 33 10 00    	mov    0x103320,%ecx
  100bfe:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100c01:	0f 84 99 00 00 00    	je     100ca0 <put_into_block+0xb4>
  100c07:	89 ca                	mov    %ecx,%edx
  100c09:	c1 e2 07             	shl    $0x7,%edx
  100c0c:	01 ca                	add    %ecx,%edx
  100c0e:	01 d2                	add    %edx,%edx
  100c10:	01 ca                	add    %ecx,%edx
  100c12:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100c15:	8d 3c d5 e0 3c 10 00 	lea    0x103ce0(,%edx,8),%edi
  100c1c:	8b b7 5c 20 00 00    	mov    0x205c(%edi),%esi
  100c22:	89 f2                	mov    %esi,%edx
  100c24:	c1 e2 07             	shl    $0x7,%edx
  100c27:	01 f2                	add    %esi,%edx
  100c29:	01 d2                	add    %edx,%edx
  100c2b:	01 f2                	add    %esi,%edx
  100c2d:	8d 14 96             	lea    (%esi,%edx,4),%edx
  100c30:	89 04 d5 40 5d 10 00 	mov    %eax,0x105d40(,%edx,8)
  100c37:	89 c2                	mov    %eax,%edx
  100c39:	c1 e2 07             	shl    $0x7,%edx
  100c3c:	01 c2                	add    %eax,%edx
  100c3e:	01 d2                	add    %edx,%edx
  100c40:	01 c2                	add    %eax,%edx
  100c42:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c45:	8d 14 d5 e0 3c 10 00 	lea    0x103ce0(,%edx,8),%edx
  100c4c:	89 b2 5c 20 00 00    	mov    %esi,0x205c(%edx)
  100c52:	89 8a 60 20 00 00    	mov    %ecx,0x2060(%edx)
  100c58:	89 87 5c 20 00 00    	mov    %eax,0x205c(%edi)
  100c5e:	89 c2                	mov    %eax,%edx
  100c60:	c1 e2 07             	shl    $0x7,%edx
  100c63:	01 c2                	add    %eax,%edx
  100c65:	01 d2                	add    %edx,%edx
  100c67:	01 c2                	add    %eax,%edx
  100c69:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c6c:	c1 e2 03             	shl    $0x3,%edx
  100c6f:	8d 82 e0 5c 10 00    	lea    0x105ce0(%edx),%eax
  100c75:	b9 13 00 00 00       	mov    $0x13,%ecx
  100c7a:	89 c7                	mov    %eax,%edi
  100c7c:	89 de                	mov    %ebx,%esi
  100c7e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100c80:	8b 43 20             	mov    0x20(%ebx),%eax
  100c83:	89 82 34 5d 10 00    	mov    %eax,0x105d34(%edx)
  100c89:	c7 82 2c 5d 10 00 00 	movl   $0x0,0x105d2c(%edx)
  100c90:	00 00 00 
  100c93:	b8 01 00 00 00       	mov    $0x1,%eax
  100c98:	5b                   	pop    %ebx
  100c99:	5e                   	pop    %esi
  100c9a:	5f                   	pop    %edi
  100c9b:	5d                   	pop    %ebp
  100c9c:	c3                   	ret    
  100c9d:	8d 76 00             	lea    0x0(%esi),%esi
  100ca0:	a3 20 33 10 00       	mov    %eax,0x103320
  100ca5:	89 c2                	mov    %eax,%edx
  100ca7:	c1 e2 07             	shl    $0x7,%edx
  100caa:	01 c2                	add    %eax,%edx
  100cac:	01 d2                	add    %edx,%edx
  100cae:	01 c2                	add    %eax,%edx
  100cb0:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100cb3:	8d 14 d5 e0 3c 10 00 	lea    0x103ce0(,%edx,8),%edx
  100cba:	89 82 60 20 00 00    	mov    %eax,0x2060(%edx)
  100cc0:	89 82 5c 20 00 00    	mov    %eax,0x205c(%edx)
  100cc6:	eb 96                	jmp    100c5e <put_into_block+0x72>

00100cc8 <get_from>:
  100cc8:	55                   	push   %ebp
  100cc9:	89 e5                	mov    %esp,%ebp
  100ccb:	56                   	push   %esi
  100ccc:	53                   	push   %ebx
  100ccd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100cd0:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cd3:	85 db                	test   %ebx,%ebx
  100cd5:	0f 8e 01 01 00 00    	jle    100ddc <get_from+0x114>
  100cdb:	39 c3                	cmp    %eax,%ebx
  100cdd:	74 42                	je     100d21 <get_from+0x59>
  100cdf:	89 da                	mov    %ebx,%edx
  100ce1:	c1 e2 07             	shl    $0x7,%edx
  100ce4:	01 da                	add    %ebx,%edx
  100ce6:	01 d2                	add    %edx,%edx
  100ce8:	01 da                	add    %ebx,%edx
  100cea:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100ced:	8b 0c d5 40 5d 10 00 	mov    0x105d40(,%edx,8),%ecx
  100cf4:	39 cb                	cmp    %ecx,%ebx
  100cf6:	75 25                	jne    100d1d <get_from+0x55>
  100cf8:	e9 df 00 00 00       	jmp    100ddc <get_from+0x114>
  100cfd:	8d 76 00             	lea    0x0(%esi),%esi
  100d00:	89 ca                	mov    %ecx,%edx
  100d02:	c1 e2 07             	shl    $0x7,%edx
  100d05:	01 ca                	add    %ecx,%edx
  100d07:	01 d2                	add    %edx,%edx
  100d09:	01 ca                	add    %ecx,%edx
  100d0b:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100d0e:	8b 0c d5 40 5d 10 00 	mov    0x105d40(,%edx,8),%ecx
  100d15:	39 cb                	cmp    %ecx,%ebx
  100d17:	0f 84 bf 00 00 00    	je     100ddc <get_from+0x114>
  100d1d:	39 c1                	cmp    %eax,%ecx
  100d1f:	75 df                	jne    100d00 <get_from+0x38>
  100d21:	89 c2                	mov    %eax,%edx
  100d23:	c1 e2 07             	shl    $0x7,%edx
  100d26:	01 c2                	add    %eax,%edx
  100d28:	01 d2                	add    %edx,%edx
  100d2a:	01 c2                	add    %eax,%edx
  100d2c:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100d2f:	8b 04 c5 2c 5d 10 00 	mov    0x105d2c(,%eax,8),%eax
  100d36:	85 c0                	test   %eax,%eax
  100d38:	0f 84 c2 00 00 00    	je     100e00 <get_from+0x138>
  100d3e:	48                   	dec    %eax
  100d3f:	75 7f                	jne    100dc0 <get_from+0xf8>
  100d41:	be 24 33 10 00       	mov    $0x103324,%esi
  100d46:	3b 1e                	cmp    (%esi),%ebx
  100d48:	74 15                	je     100d5f <get_from+0x97>
  100d4a:	83 ec 08             	sub    $0x8,%esp
  100d4d:	68 d2 00 00 00       	push   $0xd2
  100d52:	68 56 19 10 00       	push   $0x101956
  100d57:	e8 50 0a 00 00       	call   1017ac <abort>
  100d5c:	83 c4 10             	add    $0x10,%esp
  100d5f:	89 d8                	mov    %ebx,%eax
  100d61:	c1 e0 07             	shl    $0x7,%eax
  100d64:	01 d8                	add    %ebx,%eax
  100d66:	01 c0                	add    %eax,%eax
  100d68:	01 d8                	add    %ebx,%eax
  100d6a:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100d6d:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100d74:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100d7a:	39 da                	cmp    %ebx,%edx
  100d7c:	0f 84 8a 00 00 00    	je     100e0c <get_from+0x144>
  100d82:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100d88:	89 c8                	mov    %ecx,%eax
  100d8a:	c1 e0 07             	shl    $0x7,%eax
  100d8d:	01 c8                	add    %ecx,%eax
  100d8f:	01 c0                	add    %eax,%eax
  100d91:	01 c8                	add    %ecx,%eax
  100d93:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100d96:	89 14 c5 40 5d 10 00 	mov    %edx,0x105d40(,%eax,8)
  100d9d:	89 d0                	mov    %edx,%eax
  100d9f:	c1 e0 07             	shl    $0x7,%eax
  100da2:	01 d0                	add    %edx,%eax
  100da4:	01 c0                	add    %eax,%eax
  100da6:	01 d0                	add    %edx,%eax
  100da8:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100dab:	89 0c c5 3c 5d 10 00 	mov    %ecx,0x105d3c(,%eax,8)
  100db2:	89 16                	mov    %edx,(%esi)
  100db4:	89 d8                	mov    %ebx,%eax
  100db6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100db9:	5b                   	pop    %ebx
  100dba:	5e                   	pop    %esi
  100dbb:	5d                   	pop    %ebp
  100dbc:	c3                   	ret    
  100dbd:	8d 76 00             	lea    0x0(%esi),%esi
  100dc0:	83 ec 08             	sub    $0x8,%esp
  100dc3:	68 ce 00 00 00       	push   $0xce
  100dc8:	68 56 19 10 00       	push   $0x101956
  100dcd:	e8 da 09 00 00       	call   1017ac <abort>
  100dd2:	a1 00 00 00 00       	mov    0x0,%eax
  100dd7:	0f 0b                	ud2    
  100dd9:	8d 76 00             	lea    0x0(%esi),%esi
  100ddc:	83 ec 08             	sub    $0x8,%esp
  100ddf:	68 bf 00 00 00       	push   $0xbf
  100de4:	68 56 19 10 00       	push   $0x101956
  100de9:	e8 be 09 00 00       	call   1017ac <abort>
  100dee:	83 c4 10             	add    $0x10,%esp
  100df1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100df6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100df9:	5b                   	pop    %ebx
  100dfa:	5e                   	pop    %esi
  100dfb:	5d                   	pop    %ebp
  100dfc:	c3                   	ret    
  100dfd:	8d 76 00             	lea    0x0(%esi),%esi
  100e00:	be 20 33 10 00       	mov    $0x103320,%esi
  100e05:	e9 3c ff ff ff       	jmp    100d46 <get_from+0x7e>
  100e0a:	66 90                	xchg   %ax,%ax
  100e0c:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100e12:	89 d8                	mov    %ebx,%eax
  100e14:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e17:	5b                   	pop    %ebx
  100e18:	5e                   	pop    %esi
  100e19:	5d                   	pop    %ebp
  100e1a:	c3                   	ret    
  100e1b:	90                   	nop

00100e1c <get_from_block>:
  100e1c:	55                   	push   %ebp
  100e1d:	89 e5                	mov    %esp,%ebp
  100e1f:	83 ec 10             	sub    $0x10,%esp
  100e22:	ff 75 08             	pushl  0x8(%ebp)
  100e25:	ff 35 20 33 10 00    	pushl  0x103320
  100e2b:	e8 98 fe ff ff       	call   100cc8 <get_from>
  100e30:	83 c4 10             	add    $0x10,%esp
  100e33:	40                   	inc    %eax
  100e34:	74 0a                	je     100e40 <get_from_block+0x24>
  100e36:	b8 01 00 00 00       	mov    $0x1,%eax
  100e3b:	c9                   	leave  
  100e3c:	c3                   	ret    
  100e3d:	8d 76 00             	lea    0x0(%esi),%esi
  100e40:	83 ec 08             	sub    $0x8,%esp
  100e43:	68 09 01 00 00       	push   $0x109
  100e48:	68 56 19 10 00       	push   $0x101956
  100e4d:	e8 5a 09 00 00       	call   1017ac <abort>
  100e52:	83 c4 10             	add    $0x10,%esp
  100e55:	b8 01 00 00 00       	mov    $0x1,%eax
  100e5a:	c9                   	leave  
  100e5b:	c3                   	ret    

00100e5c <check_block>:
  100e5c:	55                   	push   %ebp
  100e5d:	89 e5                	mov    %esp,%ebp
  100e5f:	57                   	push   %edi
  100e60:	56                   	push   %esi
  100e61:	53                   	push   %ebx
  100e62:	83 ec 0c             	sub    $0xc,%esp
  100e65:	a1 20 33 10 00       	mov    0x103320,%eax
  100e6a:	89 c6                	mov    %eax,%esi
  100e6c:	83 f8 ff             	cmp    $0xffffffff,%eax
  100e6f:	74 58                	je     100ec9 <check_block+0x6d>
  100e71:	89 c2                	mov    %eax,%edx
  100e73:	c1 e2 07             	shl    $0x7,%edx
  100e76:	01 c2                	add    %eax,%edx
  100e78:	01 d2                	add    %edx,%edx
  100e7a:	01 c2                	add    %eax,%edx
  100e7c:	8d 3c 90             	lea    (%eax,%edx,4),%edi
  100e7f:	eb 0c                	jmp    100e8d <check_block+0x31>
  100e81:	8d 76 00             	lea    0x0(%esi),%esi
  100e84:	39 c6                	cmp    %eax,%esi
  100e86:	74 3c                	je     100ec4 <check_block+0x68>
  100e88:	83 f8 ff             	cmp    $0xffffffff,%eax
  100e8b:	74 37                	je     100ec4 <check_block+0x68>
  100e8d:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
  100e94:	8b 8b 34 5d 10 00    	mov    0x105d34(%ebx),%ecx
  100e9a:	85 c9                	test   %ecx,%ecx
  100e9c:	7f e6                	jg     100e84 <check_block+0x28>
  100e9e:	83 ec 0c             	sub    $0xc,%esp
  100ea1:	56                   	push   %esi
  100ea2:	e8 75 ff ff ff       	call   100e1c <get_from_block>
  100ea7:	58                   	pop    %eax
  100ea8:	5a                   	pop    %edx
  100ea9:	81 c3 e0 5c 10 00    	add    $0x105ce0,%ebx
  100eaf:	53                   	push   %ebx
  100eb0:	56                   	push   %esi
  100eb1:	e8 02 fc ff ff       	call   100ab8 <put_into_runnable>
  100eb6:	83 c4 10             	add    $0x10,%esp
  100eb9:	a1 20 33 10 00       	mov    0x103320,%eax
  100ebe:	39 c6                	cmp    %eax,%esi
  100ec0:	75 c6                	jne    100e88 <check_block+0x2c>
  100ec2:	66 90                	xchg   %ax,%ax
  100ec4:	be 01 00 00 00       	mov    $0x1,%esi
  100ec9:	89 f0                	mov    %esi,%eax
  100ecb:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100ece:	5b                   	pop    %ebx
  100ecf:	5e                   	pop    %esi
  100ed0:	5f                   	pop    %edi
  100ed1:	5d                   	pop    %ebp
  100ed2:	c3                   	ret    
  100ed3:	90                   	nop

00100ed4 <checkTimeCount>:
  100ed4:	a1 c4 3c 10 00       	mov    0x103cc4,%eax
  100ed9:	85 c0                	test   %eax,%eax
  100edb:	0f 84 fb 00 00 00    	je     100fdc <checkTimeCount+0x108>
  100ee1:	55                   	push   %ebp
  100ee2:	89 e5                	mov    %esp,%ebp
  100ee4:	57                   	push   %edi
  100ee5:	56                   	push   %esi
  100ee6:	83 ec 0c             	sub    $0xc,%esp
  100ee9:	68 78 18 10 00       	push   $0x101878
  100eee:	e8 45 07 00 00       	call   101638 <printk>
  100ef3:	5e                   	pop    %esi
  100ef4:	ff 35 c0 3c 10 00    	pushl  0x103cc0
  100efa:	68 78 1a 10 00       	push   $0x101a78
  100eff:	6a 31                	push   $0x31
  100f01:	68 56 19 10 00       	push   $0x101956
  100f06:	68 82 19 10 00       	push   $0x101982
  100f0b:	e8 28 07 00 00       	call   101638 <printk>
  100f10:	83 c4 14             	add    $0x14,%esp
  100f13:	68 a7 18 10 00       	push   $0x1018a7
  100f18:	e8 1b 07 00 00       	call   101638 <printk>
  100f1d:	c7 04 24 78 18 10 00 	movl   $0x101878,(%esp)
  100f24:	e8 0f 07 00 00       	call   101638 <printk>
  100f29:	5f                   	pop    %edi
  100f2a:	8b 15 c0 3c 10 00    	mov    0x103cc0,%edx
  100f30:	89 d0                	mov    %edx,%eax
  100f32:	c1 e0 07             	shl    $0x7,%eax
  100f35:	01 d0                	add    %edx,%eax
  100f37:	01 c0                	add    %eax,%eax
  100f39:	01 d0                	add    %edx,%eax
  100f3b:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100f3e:	ff 34 c5 30 5d 10 00 	pushl  0x105d30(,%eax,8)
  100f45:	68 78 1a 10 00       	push   $0x101a78
  100f4a:	6a 32                	push   $0x32
  100f4c:	68 56 19 10 00       	push   $0x101956
  100f51:	68 30 1a 10 00       	push   $0x101a30
  100f56:	e8 dd 06 00 00       	call   101638 <printk>
  100f5b:	83 c4 14             	add    $0x14,%esp
  100f5e:	68 a7 18 10 00       	push   $0x1018a7
  100f63:	e8 d0 06 00 00       	call   101638 <printk>
  100f68:	e8 ef fe ff ff       	call   100e5c <check_block>
  100f6d:	8b 15 c0 3c 10 00    	mov    0x103cc0,%edx
  100f73:	89 d0                	mov    %edx,%eax
  100f75:	c1 e0 07             	shl    $0x7,%eax
  100f78:	01 d0                	add    %edx,%eax
  100f7a:	01 c0                	add    %eax,%eax
  100f7c:	01 d0                	add    %edx,%eax
  100f7e:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100f81:	c1 e0 03             	shl    $0x3,%eax
  100f84:	83 c4 10             	add    $0x10,%esp
  100f87:	8b 88 30 5d 10 00    	mov    0x105d30(%eax),%ecx
  100f8d:	85 c9                	test   %ecx,%ecx
  100f8f:	7e 0f                	jle    100fa0 <checkTimeCount+0xcc>
  100f91:	b8 01 00 00 00       	mov    $0x1,%eax
  100f96:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100f99:	5e                   	pop    %esi
  100f9a:	5f                   	pop    %edi
  100f9b:	5d                   	pop    %ebp
  100f9c:	c3                   	ret    
  100f9d:	8d 76 00             	lea    0x0(%esi),%esi
  100fa0:	05 e0 5c 10 00       	add    $0x105ce0,%eax
  100fa5:	b9 13 00 00 00       	mov    $0x13,%ecx
  100faa:	89 c7                	mov    %eax,%edi
  100fac:	8b 75 08             	mov    0x8(%ebp),%esi
  100faf:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100fb1:	83 ec 08             	sub    $0x8,%esp
  100fb4:	ff 75 08             	pushl  0x8(%ebp)
  100fb7:	52                   	push   %edx
  100fb8:	e8 fb fa ff ff       	call   100ab8 <put_into_runnable>
  100fbd:	e8 36 fa ff ff       	call   1009f8 <get_from_runnable>
  100fc2:	5a                   	pop    %edx
  100fc3:	59                   	pop    %ecx
  100fc4:	ff 75 08             	pushl  0x8(%ebp)
  100fc7:	50                   	push   %eax
  100fc8:	e8 8b f8 ff ff       	call   100858 <put_into_running>
  100fcd:	83 c4 10             	add    $0x10,%esp
  100fd0:	b8 01 00 00 00       	mov    $0x1,%eax
  100fd5:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100fd8:	5e                   	pop    %esi
  100fd9:	5f                   	pop    %edi
  100fda:	5d                   	pop    %ebp
  100fdb:	c3                   	ret    
  100fdc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100fe1:	c3                   	ret    
  100fe2:	66 90                	xchg   %ax,%ax

00100fe4 <check_is_in>:
  100fe4:	55                   	push   %ebp
  100fe5:	89 e5                	mov    %esp,%ebp
  100fe7:	53                   	push   %ebx
  100fe8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100feb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100fee:	85 c9                	test   %ecx,%ecx
  100ff0:	7e 4a                	jle    10103c <check_is_in+0x58>
  100ff2:	39 d9                	cmp    %ebx,%ecx
  100ff4:	74 3b                	je     101031 <check_is_in+0x4d>
  100ff6:	89 c8                	mov    %ecx,%eax
  100ff8:	c1 e0 07             	shl    $0x7,%eax
  100ffb:	01 c8                	add    %ecx,%eax
  100ffd:	01 c0                	add    %eax,%eax
  100fff:	01 c8                	add    %ecx,%eax
  101001:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  101004:	8b 14 c5 40 5d 10 00 	mov    0x105d40(,%eax,8),%edx
  10100b:	39 d1                	cmp    %edx,%ecx
  10100d:	75 1e                	jne    10102d <check_is_in+0x49>
  10100f:	eb 2b                	jmp    10103c <check_is_in+0x58>
  101011:	8d 76 00             	lea    0x0(%esi),%esi
  101014:	89 d0                	mov    %edx,%eax
  101016:	c1 e0 07             	shl    $0x7,%eax
  101019:	01 d0                	add    %edx,%eax
  10101b:	01 c0                	add    %eax,%eax
  10101d:	01 d0                	add    %edx,%eax
  10101f:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101022:	8b 14 c5 40 5d 10 00 	mov    0x105d40(,%eax,8),%edx
  101029:	39 d1                	cmp    %edx,%ecx
  10102b:	74 0f                	je     10103c <check_is_in+0x58>
  10102d:	39 d3                	cmp    %edx,%ebx
  10102f:	75 e3                	jne    101014 <check_is_in+0x30>
  101031:	b8 01 00 00 00       	mov    $0x1,%eax
  101036:	5b                   	pop    %ebx
  101037:	5d                   	pop    %ebp
  101038:	c3                   	ret    
  101039:	8d 76 00             	lea    0x0(%esi),%esi
  10103c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101041:	5b                   	pop    %ebx
  101042:	5d                   	pop    %ebp
  101043:	c3                   	ret    

00101044 <block_decrease>:
  101044:	55                   	push   %ebp
  101045:	89 e5                	mov    %esp,%ebp
  101047:	8b 0d 20 33 10 00    	mov    0x103320,%ecx
  10104d:	83 f9 ff             	cmp    $0xffffffff,%ecx
  101050:	74 2e                	je     101080 <block_decrease+0x3c>
  101052:	89 ca                	mov    %ecx,%edx
  101054:	89 d0                	mov    %edx,%eax
  101056:	c1 e0 07             	shl    $0x7,%eax
  101059:	01 d0                	add    %edx,%eax
  10105b:	01 c0                	add    %eax,%eax
  10105d:	01 d0                	add    %edx,%eax
  10105f:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101062:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  101069:	ff 88 54 20 00 00    	decl   0x2054(%eax)
  10106f:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  101075:	39 d1                	cmp    %edx,%ecx
  101077:	75 db                	jne    101054 <block_decrease+0x10>
  101079:	b8 01 00 00 00       	mov    $0x1,%eax
  10107e:	5d                   	pop    %ebp
  10107f:	c3                   	ret    
  101080:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101085:	5d                   	pop    %ebp
  101086:	c3                   	ret    
  101087:	90                   	nop

00101088 <init_pcb>:
  101088:	55                   	push   %ebp
  101089:	89 e5                	mov    %esp,%ebp
  10108b:	c7 05 c8 3c 10 00 05 	movl   $0x5,0x103cc8
  101092:	00 00 00 
  101095:	ba 38 5d 10 00       	mov    $0x105d38,%edx
  10109a:	31 c0                	xor    %eax,%eax
  10109c:	89 02                	mov    %eax,(%edx)
  10109e:	8d 48 ff             	lea    -0x1(%eax),%ecx
  1010a1:	89 4a 04             	mov    %ecx,0x4(%edx)
  1010a4:	40                   	inc    %eax
  1010a5:	89 42 08             	mov    %eax,0x8(%edx)
  1010a8:	81 c2 68 20 00 00    	add    $0x2068,%edx
  1010ae:	3d 00 08 00 00       	cmp    $0x800,%eax
  1010b3:	75 e7                	jne    10109c <init_pcb+0x14>
  1010b5:	c7 05 3c 5d 10 00 ff 	movl   $0x7ff,0x105d3c
  1010bc:	07 00 00 
  1010bf:	c7 05 d8 7c 13 01 00 	movl   $0x0,0x1137cd8
  1010c6:	00 00 00 
  1010c9:	5d                   	pop    %ebp
  1010ca:	c3                   	ret    
  1010cb:	90                   	nop

001010cc <init_kernel_pcb>:
  1010cc:	55                   	push   %ebp
  1010cd:	89 e5                	mov    %esp,%ebp
  1010cf:	c7 05 28 5d 10 00 10 	movl   $0x10,0x105d28
  1010d6:	00 00 00 
  1010d9:	c7 05 1c 5d 10 00 08 	movl   $0x8,0x105d1c
  1010e0:	00 00 00 
  1010e3:	c7 05 ec 5c 10 00 10 	movl   $0x10,0x105cec
  1010ea:	00 00 00 
  1010ed:	c7 05 e8 5c 10 00 10 	movl   $0x10,0x105ce8
  1010f4:	00 00 00 
  1010f7:	c7 05 18 5d 10 00 50 	movl   $0x100850,0x105d18
  1010fe:	08 10 00 
  101101:	c7 05 24 5d 10 00 00 	movl   $0x400000,0x105d24
  101108:	00 40 00 
  10110b:	c7 05 2c 5d 10 00 01 	movl   $0x1,0x105d2c
  101112:	00 00 00 
  101115:	c7 05 30 5d 10 00 04 	movl   $0x4,0x105d30
  10111c:	00 00 00 
  10111f:	b8 01 00 00 00       	mov    $0x1,%eax
  101124:	5d                   	pop    %ebp
  101125:	c3                   	ret    
  101126:	66 90                	xchg   %ax,%ax

00101128 <transfer_pid_state>:
  101128:	55                   	push   %ebp
  101129:	89 e5                	mov    %esp,%ebp
  10112b:	b8 01 00 00 00       	mov    $0x1,%eax
  101130:	5d                   	pop    %ebp
  101131:	c3                   	ret    
  101132:	66 90                	xchg   %ax,%ax

00101134 <make_pcb>:
  101134:	55                   	push   %ebp
  101135:	89 e5                	mov    %esp,%ebp
  101137:	57                   	push   %edi
  101138:	56                   	push   %esi
  101139:	8b 55 08             	mov    0x8(%ebp),%edx
  10113c:	89 d0                	mov    %edx,%eax
  10113e:	c1 e0 07             	shl    $0x7,%eax
  101141:	01 d0                	add    %edx,%eax
  101143:	01 c0                	add    %eax,%eax
  101145:	01 d0                	add    %edx,%eax
  101147:	8d 14 82             	lea    (%edx,%eax,4),%edx
  10114a:	c1 e2 03             	shl    $0x3,%edx
  10114d:	8d 82 e0 5c 10 00    	lea    0x105ce0(%edx),%eax
  101153:	b9 13 00 00 00       	mov    $0x13,%ecx
  101158:	89 c7                	mov    %eax,%edi
  10115a:	8b 75 0c             	mov    0xc(%ebp),%esi
  10115d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10115f:	8b 45 10             	mov    0x10(%ebp),%eax
  101162:	89 82 2c 5d 10 00    	mov    %eax,0x105d2c(%edx)
  101168:	8b 45 14             	mov    0x14(%ebp),%eax
  10116b:	89 82 30 5d 10 00    	mov    %eax,0x105d30(%edx)
  101171:	8b 45 18             	mov    0x18(%ebp),%eax
  101174:	89 82 34 5d 10 00    	mov    %eax,0x105d34(%edx)
  10117a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10117d:	89 82 44 5d 10 00    	mov    %eax,0x105d44(%edx)
  101183:	b8 01 00 00 00       	mov    $0x1,%eax
  101188:	5e                   	pop    %esi
  101189:	5f                   	pop    %edi
  10118a:	5d                   	pop    %ebp
  10118b:	c3                   	ret    

0010118c <initIdt>:
  10118c:	55                   	push   %ebp
  10118d:	89 e5                	mov    %esp,%ebp
  10118f:	53                   	push   %ebx
  101190:	ba 43 18 10 00       	mov    $0x101843,%edx
  101195:	89 d3                	mov    %edx,%ebx
  101197:	c1 ea 10             	shr    $0x10,%edx
  10119a:	b9 a0 85 13 01       	mov    $0x11385a0,%ecx
  10119f:	b8 a0 7d 13 01       	mov    $0x1137da0,%eax
  1011a4:	66 89 18             	mov    %bx,(%eax)
  1011a7:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  1011ad:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  1011b1:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  1011b5:	66 89 50 06          	mov    %dx,0x6(%eax)
  1011b9:	83 c0 08             	add    $0x8,%eax
  1011bc:	39 c1                	cmp    %eax,%ecx
  1011be:	75 e4                	jne    1011a4 <initIdt+0x18>
  1011c0:	b8 49 18 10 00       	mov    $0x101849,%eax
  1011c5:	66 a3 08 7e 13 01    	mov    %ax,0x1137e08
  1011cb:	66 c7 05 0a 7e 13 01 	movw   $0x8,0x1137e0a
  1011d2:	08 00 
  1011d4:	c6 05 0c 7e 13 01 00 	movb   $0x0,0x1137e0c
  1011db:	c6 05 0d 7e 13 01 8f 	movb   $0x8f,0x1137e0d
  1011e2:	c1 e8 10             	shr    $0x10,%eax
  1011e5:	66 a3 0e 7e 13 01    	mov    %ax,0x1137e0e
  1011eb:	b8 4d 18 10 00       	mov    $0x10184d,%eax
  1011f0:	66 a3 a0 81 13 01    	mov    %ax,0x11381a0
  1011f6:	66 c7 05 a2 81 13 01 	movw   $0x8,0x11381a2
  1011fd:	08 00 
  1011ff:	c6 05 a4 81 13 01 00 	movb   $0x0,0x11381a4
  101206:	c6 05 a5 81 13 01 ee 	movb   $0xee,0x11381a5
  10120d:	c1 e8 10             	shr    $0x10,%eax
  101210:	66 a3 a6 81 13 01    	mov    %ax,0x11381a6
  101216:	b8 56 18 10 00       	mov    $0x101856,%eax
  10121b:	66 a3 a0 7e 13 01    	mov    %ax,0x1137ea0
  101221:	66 c7 05 a2 7e 13 01 	movw   $0x8,0x1137ea2
  101228:	08 00 
  10122a:	c6 05 a4 7e 13 01 00 	movb   $0x0,0x1137ea4
  101231:	c6 05 a5 7e 13 01 8e 	movb   $0x8e,0x1137ea5
  101238:	c1 e8 10             	shr    $0x10,%eax
  10123b:	66 a3 a6 7e 13 01    	mov    %ax,0x1137ea6
  101241:	66 c7 05 50 34 10 00 	movw   $0x7ff,0x103450
  101248:	ff 07 
  10124a:	b8 a0 7d 13 01       	mov    $0x1137da0,%eax
  10124f:	66 a3 52 34 10 00    	mov    %ax,0x103452
  101255:	c1 e8 10             	shr    $0x10,%eax
  101258:	66 a3 54 34 10 00    	mov    %ax,0x103454
  10125e:	b8 50 34 10 00       	mov    $0x103450,%eax
  101263:	0f 01 18             	lidtl  (%eax)
  101266:	5b                   	pop    %ebx
  101267:	5d                   	pop    %ebp
  101268:	c3                   	ret    
  101269:	66 90                	xchg   %ax,%ax
  10126b:	90                   	nop

0010126c <syscallHandle>:
  10126c:	55                   	push   %ebp
  10126d:	89 e5                	mov    %esp,%ebp
  10126f:	53                   	push   %ebx
  101270:	50                   	push   %eax
  101271:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101274:	8b 43 2c             	mov    0x2c(%ebx),%eax
  101277:	83 f8 02             	cmp    $0x2,%eax
  10127a:	74 28                	je     1012a4 <syscallHandle+0x38>
  10127c:	76 3a                	jbe    1012b8 <syscallHandle+0x4c>
  10127e:	83 f8 04             	cmp    $0x4,%eax
  101281:	74 15                	je     101298 <syscallHandle+0x2c>
  101283:	3d e6 00 00 00       	cmp    $0xe6,%eax
  101288:	75 29                	jne    1012b3 <syscallHandle+0x47>
  10128a:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10128d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101290:	c9                   	leave  
  101291:	e9 e6 f2 ff ff       	jmp    10057c <sys_sleep>
  101296:	66 90                	xchg   %ax,%ax
  101298:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10129b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10129e:	c9                   	leave  
  10129f:	e9 04 f5 ff ff       	jmp    1007a8 <sys_write>
  1012a4:	83 ec 0c             	sub    $0xc,%esp
  1012a7:	53                   	push   %ebx
  1012a8:	e8 53 f3 ff ff       	call   100600 <sys_fork>
  1012ad:	89 43 2c             	mov    %eax,0x2c(%ebx)
  1012b0:	83 c4 10             	add    $0x10,%esp
  1012b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012b6:	c9                   	leave  
  1012b7:	c3                   	ret    
  1012b8:	48                   	dec    %eax
  1012b9:	75 f8                	jne    1012b3 <syscallHandle+0x47>
  1012bb:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1012be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012c1:	c9                   	leave  
  1012c2:	e9 8d f2 ff ff       	jmp    100554 <sys_exit>
  1012c7:	90                   	nop

001012c8 <GProtectFaultHandle>:
  1012c8:	55                   	push   %ebp
  1012c9:	89 e5                	mov    %esp,%ebp
  1012cb:	83 ec 14             	sub    $0x14,%esp
  1012ce:	68 78 18 10 00       	push   $0x101878
  1012d3:	e8 60 03 00 00       	call   101638 <printk>
  1012d8:	58                   	pop    %eax
  1012d9:	8b 45 08             	mov    0x8(%ebp),%eax
  1012dc:	ff 70 30             	pushl  0x30(%eax)
  1012df:	68 ec 1a 10 00       	push   $0x101aec
  1012e4:	6a 76                	push   $0x76
  1012e6:	68 99 1a 10 00       	push   $0x101a99
  1012eb:	68 ac 1a 10 00       	push   $0x101aac
  1012f0:	e8 43 03 00 00       	call   101638 <printk>
  1012f5:	83 c4 14             	add    $0x14,%esp
  1012f8:	68 a7 18 10 00       	push   $0x1018a7
  1012fd:	e8 36 03 00 00       	call   101638 <printk>
  101302:	5a                   	pop    %edx
  101303:	59                   	pop    %ecx
  101304:	6a 77                	push   $0x77
  101306:	68 99 1a 10 00       	push   $0x101a99
  10130b:	e8 9c 04 00 00       	call   1017ac <abort>
  101310:	83 c4 10             	add    $0x10,%esp
  101313:	c9                   	leave  
  101314:	c3                   	ret    
  101315:	8d 76 00             	lea    0x0(%esi),%esi

00101318 <timeHandle>:
  101318:	55                   	push   %ebp
  101319:	89 e5                	mov    %esp,%ebp
  10131b:	53                   	push   %ebx
  10131c:	83 ec 10             	sub    $0x10,%esp
  10131f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101322:	6a 41                	push   $0x41
  101324:	e8 0b f5 ff ff       	call   100834 <putChar>
  101329:	e8 9a f6 ff ff       	call   1009c8 <getpid>
  10132e:	89 c2                	mov    %eax,%edx
  101330:	c1 e2 07             	shl    $0x7,%edx
  101333:	01 c2                	add    %eax,%edx
  101335:	01 d2                	add    %edx,%edx
  101337:	01 c2                	add    %eax,%edx
  101339:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10133c:	ff 0c c5 30 5d 10 00 	decl   0x105d30(,%eax,8)
  101343:	e8 fc fc ff ff       	call   101044 <block_decrease>
  101348:	89 1c 24             	mov    %ebx,(%esp)
  10134b:	e8 84 fb ff ff       	call   100ed4 <checkTimeCount>
  101350:	83 c4 10             	add    $0x10,%esp
  101353:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  10135a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10135d:	c9                   	leave  
  10135e:	e9 d1 f4 ff ff       	jmp    100834 <putChar>
  101363:	90                   	nop

00101364 <irqHandle>:
  101364:	55                   	push   %ebp
  101365:	89 e5                	mov    %esp,%ebp
  101367:	57                   	push   %edi
  101368:	56                   	push   %esi
  101369:	53                   	push   %ebx
  10136a:	83 ec 0c             	sub    $0xc,%esp
  10136d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101370:	b8 10 00 00 00       	mov    $0x10,%eax
  101375:	89 c0                	mov    %eax,%eax
  101377:	8e d8                	mov    %eax,%ds
  101379:	8e e0                	mov    %eax,%fs
  10137b:	8e c0                	mov    %eax,%es
  10137d:	b8 30 00 00 00       	mov    $0x30,%eax
  101382:	89 c0                	mov    %eax,%eax
  101384:	8e e8                	mov    %eax,%gs
  101386:	89 ee                	mov    %ebp,%esi
  101388:	3b 5e 08             	cmp    0x8(%esi),%ebx
  10138b:	74 12                	je     10139f <irqHandle+0x3b>
  10138d:	83 ec 08             	sub    $0x8,%esp
  101390:	6a 1f                	push   $0x1f
  101392:	68 99 1a 10 00       	push   $0x101a99
  101397:	e8 10 04 00 00       	call   1017ac <abort>
  10139c:	83 c4 10             	add    $0x10,%esp
  10139f:	e8 24 f6 ff ff       	call   1009c8 <getpid>
  1013a4:	89 c7                	mov    %eax,%edi
  1013a6:	fa                   	cli    
  1013a7:	8b 43 30             	mov    0x30(%ebx),%eax
  1013aa:	83 f8 0d             	cmp    $0xd,%eax
  1013ad:	0f 84 f1 00 00 00    	je     1014a4 <irqHandle+0x140>
  1013b3:	0f 8e 97 00 00 00    	jle    101450 <irqHandle+0xec>
  1013b9:	83 f8 20             	cmp    $0x20,%eax
  1013bc:	74 2e                	je     1013ec <irqHandle+0x88>
  1013be:	83 c0 80             	add    $0xffffff80,%eax
  1013c1:	0f 85 8c 00 00 00    	jne    101453 <irqHandle+0xef>
  1013c7:	83 ec 0c             	sub    $0xc,%esp
  1013ca:	53                   	push   %ebx
  1013cb:	e8 9c fe ff ff       	call   10126c <syscallHandle>
  1013d0:	8b 43 30             	mov    0x30(%ebx),%eax
  1013d3:	83 c4 10             	add    $0x10,%esp
  1013d6:	3d 80 00 00 00       	cmp    $0x80,%eax
  1013db:	74 27                	je     101404 <irqHandle+0xa0>
  1013dd:	83 f8 20             	cmp    $0x20,%eax
  1013e0:	74 22                	je     101404 <irqHandle+0xa0>
  1013e2:	fb                   	sti    
  1013e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1013e6:	5b                   	pop    %ebx
  1013e7:	5e                   	pop    %esi
  1013e8:	5f                   	pop    %edi
  1013e9:	5d                   	pop    %ebp
  1013ea:	c3                   	ret    
  1013eb:	90                   	nop
  1013ec:	83 ec 0c             	sub    $0xc,%esp
  1013ef:	53                   	push   %ebx
  1013f0:	e8 23 ff ff ff       	call   101318 <timeHandle>
  1013f5:	8b 43 30             	mov    0x30(%ebx),%eax
  1013f8:	83 c4 10             	add    $0x10,%esp
  1013fb:	3d 80 00 00 00       	cmp    $0x80,%eax
  101400:	75 db                	jne    1013dd <irqHandle+0x79>
  101402:	66 90                	xchg   %ax,%ax
  101404:	e8 bf f5 ff ff       	call   1009c8 <getpid>
  101409:	39 c7                	cmp    %eax,%edi
  10140b:	74 d5                	je     1013e2 <irqHandle+0x7e>
  10140d:	e8 b6 f5 ff ff       	call   1009c8 <getpid>
  101412:	89 c2                	mov    %eax,%edx
  101414:	c1 e2 07             	shl    $0x7,%edx
  101417:	01 c2                	add    %eax,%edx
  101419:	01 d2                	add    %edx,%edx
  10141b:	01 c2                	add    %eax,%edx
  10141d:	8d 04 90             	lea    (%eax,%edx,4),%eax
  101420:	8d 1c c5 90 5c 10 00 	lea    0x105c90(,%eax,8),%ebx
  101427:	89 5e 08             	mov    %ebx,0x8(%esi)
  10142a:	e8 99 f5 ff ff       	call   1009c8 <getpid>
  10142f:	89 c2                	mov    %eax,%edx
  101431:	c1 e2 07             	shl    $0x7,%edx
  101434:	01 c2                	add    %eax,%edx
  101436:	01 d2                	add    %edx,%edx
  101438:	01 c2                	add    %eax,%edx
  10143a:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10143d:	8d 34 c5 e0 5c 10 00 	lea    0x105ce0(,%eax,8),%esi
  101444:	b9 13 00 00 00       	mov    $0x13,%ecx
  101449:	89 df                	mov    %ebx,%edi
  10144b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10144d:	eb 93                	jmp    1013e2 <irqHandle+0x7e>
  10144f:	90                   	nop
  101450:	40                   	inc    %eax
  101451:	74 8f                	je     1013e2 <irqHandle+0x7e>
  101453:	83 ec 0c             	sub    $0xc,%esp
  101456:	68 78 18 10 00       	push   $0x101878
  10145b:	e8 d8 01 00 00       	call   101638 <printk>
  101460:	58                   	pop    %eax
  101461:	5a                   	pop    %edx
  101462:	ff 73 38             	pushl  0x38(%ebx)
  101465:	ff 73 30             	pushl  0x30(%ebx)
  101468:	68 00 1b 10 00       	push   $0x101b00
  10146d:	6a 36                	push   $0x36
  10146f:	68 99 1a 10 00       	push   $0x101a99
  101474:	68 c4 1a 10 00       	push   $0x101ac4
  101479:	e8 ba 01 00 00       	call   101638 <printk>
  10147e:	83 c4 14             	add    $0x14,%esp
  101481:	68 a7 18 10 00       	push   $0x1018a7
  101486:	e8 ad 01 00 00       	call   101638 <printk>
  10148b:	59                   	pop    %ecx
  10148c:	58                   	pop    %eax
  10148d:	6a 37                	push   $0x37
  10148f:	68 99 1a 10 00       	push   $0x101a99
  101494:	e8 13 03 00 00       	call   1017ac <abort>
  101499:	8b 43 30             	mov    0x30(%ebx),%eax
  10149c:	83 c4 10             	add    $0x10,%esp
  10149f:	e9 32 ff ff ff       	jmp    1013d6 <irqHandle+0x72>
  1014a4:	83 ec 0c             	sub    $0xc,%esp
  1014a7:	53                   	push   %ebx
  1014a8:	e8 1b fe ff ff       	call   1012c8 <GProtectFaultHandle>
  1014ad:	8b 43 30             	mov    0x30(%ebx),%eax
  1014b0:	83 c4 10             	add    $0x10,%esp
  1014b3:	e9 1e ff ff ff       	jmp    1013d6 <irqHandle+0x72>

001014b8 <initIntr>:
  1014b8:	55                   	push   %ebp
  1014b9:	89 e5                	mov    %esp,%ebp
  1014bb:	ba 21 00 00 00       	mov    $0x21,%edx
  1014c0:	b0 ff                	mov    $0xff,%al
  1014c2:	ee                   	out    %al,(%dx)
  1014c3:	ba a1 00 00 00       	mov    $0xa1,%edx
  1014c8:	ee                   	out    %al,(%dx)
  1014c9:	ba 20 00 00 00       	mov    $0x20,%edx
  1014ce:	b0 11                	mov    $0x11,%al
  1014d0:	ee                   	out    %al,(%dx)
  1014d1:	ba 21 00 00 00       	mov    $0x21,%edx
  1014d6:	b0 20                	mov    $0x20,%al
  1014d8:	ee                   	out    %al,(%dx)
  1014d9:	b0 04                	mov    $0x4,%al
  1014db:	ee                   	out    %al,(%dx)
  1014dc:	b0 03                	mov    $0x3,%al
  1014de:	ee                   	out    %al,(%dx)
  1014df:	ba a0 00 00 00       	mov    $0xa0,%edx
  1014e4:	b0 11                	mov    $0x11,%al
  1014e6:	ee                   	out    %al,(%dx)
  1014e7:	ba a1 00 00 00       	mov    $0xa1,%edx
  1014ec:	b0 28                	mov    $0x28,%al
  1014ee:	ee                   	out    %al,(%dx)
  1014ef:	b0 02                	mov    $0x2,%al
  1014f1:	ee                   	out    %al,(%dx)
  1014f2:	b0 03                	mov    $0x3,%al
  1014f4:	ee                   	out    %al,(%dx)
  1014f5:	ba 20 00 00 00       	mov    $0x20,%edx
  1014fa:	b0 68                	mov    $0x68,%al
  1014fc:	ee                   	out    %al,(%dx)
  1014fd:	b0 0a                	mov    $0xa,%al
  1014ff:	ee                   	out    %al,(%dx)
  101500:	ba a0 00 00 00       	mov    $0xa0,%edx
  101505:	b0 68                	mov    $0x68,%al
  101507:	ee                   	out    %al,(%dx)
  101508:	b0 0a                	mov    $0xa,%al
  10150a:	ee                   	out    %al,(%dx)
  10150b:	5d                   	pop    %ebp
  10150c:	c3                   	ret    
  10150d:	8d 76 00             	lea    0x0(%esi),%esi

00101510 <initTimer>:
  101510:	55                   	push   %ebp
  101511:	89 e5                	mov    %esp,%ebp
  101513:	ba 43 00 00 00       	mov    $0x43,%edx
  101518:	b0 34                	mov    $0x34,%al
  10151a:	ee                   	out    %al,(%dx)
  10151b:	ba 40 00 00 00       	mov    $0x40,%edx
  101520:	b0 9b                	mov    $0x9b,%al
  101522:	ee                   	out    %al,(%dx)
  101523:	b0 2e                	mov    $0x2e,%al
  101525:	ee                   	out    %al,(%dx)
  101526:	5d                   	pop    %ebp
  101527:	c3                   	ret    

00101528 <i2A>:
  101528:	55                   	push   %ebp
  101529:	89 e5                	mov    %esp,%ebp
  10152b:	57                   	push   %edi
  10152c:	56                   	push   %esi
  10152d:	53                   	push   %ebx
  10152e:	51                   	push   %ecx
  10152f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101532:	85 c9                	test   %ecx,%ecx
  101534:	78 6e                	js     1015a4 <i2A+0x7c>
  101536:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  10153a:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  10153e:	bb 9e 34 10 00       	mov    $0x10349e,%ebx
  101543:	31 ff                	xor    %edi,%edi
  101545:	eb 03                	jmp    10154a <i2A+0x22>
  101547:	90                   	nop
  101548:	89 f7                	mov    %esi,%edi
  10154a:	4b                   	dec    %ebx
  10154b:	89 c8                	mov    %ecx,%eax
  10154d:	be 0a 00 00 00       	mov    $0xa,%esi
  101552:	99                   	cltd   
  101553:	f7 fe                	idiv   %esi
  101555:	83 c2 30             	add    $0x30,%edx
  101558:	88 13                	mov    %dl,(%ebx)
  10155a:	8d 77 01             	lea    0x1(%edi),%esi
  10155d:	b8 67 66 66 66       	mov    $0x66666667,%eax
  101562:	f7 e9                	imul   %ecx
  101564:	89 d0                	mov    %edx,%eax
  101566:	c1 f8 02             	sar    $0x2,%eax
  101569:	c1 f9 1f             	sar    $0x1f,%ecx
  10156c:	29 c8                	sub    %ecx,%eax
  10156e:	89 c1                	mov    %eax,%ecx
  101570:	75 d6                	jne    101548 <i2A+0x20>
  101572:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  101576:	74 20                	je     101598 <i2A+0x70>
  101578:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  10157c:	75 06                	jne    101584 <i2A+0x5c>
  10157e:	fe 05 9d 34 10 00    	incb   0x10349d
  101584:	c6 05 9e 34 10 00 00 	movb   $0x0,0x10349e
  10158b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10158e:	89 18                	mov    %ebx,(%eax)
  101590:	89 f0                	mov    %esi,%eax
  101592:	5a                   	pop    %edx
  101593:	5b                   	pop    %ebx
  101594:	5e                   	pop    %esi
  101595:	5f                   	pop    %edi
  101596:	5d                   	pop    %ebp
  101597:	c3                   	ret    
  101598:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  10159c:	8d 77 02             	lea    0x2(%edi),%esi
  10159f:	4b                   	dec    %ebx
  1015a0:	eb d6                	jmp    101578 <i2A+0x50>
  1015a2:	66 90                	xchg   %ax,%ax
  1015a4:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  1015aa:	74 0c                	je     1015b8 <i2A+0x90>
  1015ac:	f7 d9                	neg    %ecx
  1015ae:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  1015b2:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  1015b6:	eb 86                	jmp    10153e <i2A+0x16>
  1015b8:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  1015bd:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  1015c1:	eb ef                	jmp    1015b2 <i2A+0x8a>
  1015c3:	90                   	nop

001015c4 <i2X>:
  1015c4:	55                   	push   %ebp
  1015c5:	89 e5                	mov    %esp,%ebp
  1015c7:	57                   	push   %edi
  1015c8:	56                   	push   %esi
  1015c9:	53                   	push   %ebx
  1015ca:	8b 55 08             	mov    0x8(%ebp),%edx
  1015cd:	b9 7d 34 10 00       	mov    $0x10347d,%ecx
  1015d2:	31 c0                	xor    %eax,%eax
  1015d4:	40                   	inc    %eax
  1015d5:	89 d6                	mov    %edx,%esi
  1015d7:	83 e6 0f             	and    $0xf,%esi
  1015da:	8d 5e f6             	lea    -0xa(%esi),%ebx
  1015dd:	89 cf                	mov    %ecx,%edi
  1015df:	83 fb 05             	cmp    $0x5,%ebx
  1015e2:	77 4c                	ja     101630 <i2X+0x6c>
  1015e4:	ff 24 9d 0c 1b 10 00 	jmp    *0x101b0c(,%ebx,4)
  1015eb:	90                   	nop
  1015ec:	c6 01 65             	movb   $0x65,(%ecx)
  1015ef:	90                   	nop
  1015f0:	49                   	dec    %ecx
  1015f1:	c1 ea 04             	shr    $0x4,%edx
  1015f4:	75 de                	jne    1015d4 <i2X+0x10>
  1015f6:	c6 05 7e 34 10 00 00 	movb   $0x0,0x10347e
  1015fd:	8b 55 0c             	mov    0xc(%ebp),%edx
  101600:	89 3a                	mov    %edi,(%edx)
  101602:	5b                   	pop    %ebx
  101603:	5e                   	pop    %esi
  101604:	5f                   	pop    %edi
  101605:	5d                   	pop    %ebp
  101606:	c3                   	ret    
  101607:	90                   	nop
  101608:	c6 01 64             	movb   $0x64,(%ecx)
  10160b:	eb e3                	jmp    1015f0 <i2X+0x2c>
  10160d:	8d 76 00             	lea    0x0(%esi),%esi
  101610:	c6 01 63             	movb   $0x63,(%ecx)
  101613:	eb db                	jmp    1015f0 <i2X+0x2c>
  101615:	8d 76 00             	lea    0x0(%esi),%esi
  101618:	c6 01 62             	movb   $0x62,(%ecx)
  10161b:	eb d3                	jmp    1015f0 <i2X+0x2c>
  10161d:	8d 76 00             	lea    0x0(%esi),%esi
  101620:	c6 01 61             	movb   $0x61,(%ecx)
  101623:	eb cb                	jmp    1015f0 <i2X+0x2c>
  101625:	8d 76 00             	lea    0x0(%esi),%esi
  101628:	c6 01 66             	movb   $0x66,(%ecx)
  10162b:	eb c3                	jmp    1015f0 <i2X+0x2c>
  10162d:	8d 76 00             	lea    0x0(%esi),%esi
  101630:	8d 5e 30             	lea    0x30(%esi),%ebx
  101633:	88 19                	mov    %bl,(%ecx)
  101635:	eb b9                	jmp    1015f0 <i2X+0x2c>
  101637:	90                   	nop

00101638 <printk>:
  101638:	55                   	push   %ebp
  101639:	89 e5                	mov    %esp,%ebp
  10163b:	57                   	push   %edi
  10163c:	56                   	push   %esi
  10163d:	53                   	push   %ebx
  10163e:	83 ec 2c             	sub    $0x2c,%esp
  101641:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101644:	8a 11                	mov    (%ecx),%dl
  101646:	84 d2                	test   %dl,%dl
  101648:	0f 84 54 01 00 00    	je     1017a2 <printk+0x16a>
  10164e:	8d 45 0c             	lea    0xc(%ebp),%eax
  101651:	31 ff                	xor    %edi,%edi
  101653:	eb 18                	jmp    10166d <printk+0x35>
  101655:	8d 76 00             	lea    0x0(%esi),%esi
  101658:	8a 11                	mov    (%ecx),%dl
  10165a:	89 cb                	mov    %ecx,%ebx
  10165c:	88 97 a0 34 10 00    	mov    %dl,0x1034a0(%edi)
  101662:	47                   	inc    %edi
  101663:	8d 4b 01             	lea    0x1(%ebx),%ecx
  101666:	8a 53 01             	mov    0x1(%ebx),%dl
  101669:	84 d2                	test   %dl,%dl
  10166b:	74 72                	je     1016df <printk+0xa7>
  10166d:	80 fa 25             	cmp    $0x25,%dl
  101670:	75 e6                	jne    101658 <printk+0x20>
  101672:	8d 59 01             	lea    0x1(%ecx),%ebx
  101675:	8a 51 01             	mov    0x1(%ecx),%dl
  101678:	80 fa 64             	cmp    $0x64,%dl
  10167b:	0f 84 bf 00 00 00    	je     101740 <printk+0x108>
  101681:	0f 8e 01 01 00 00    	jle    101788 <printk+0x150>
  101687:	80 fa 73             	cmp    $0x73,%dl
  10168a:	0f 84 84 00 00 00    	je     101714 <printk+0xdc>
  101690:	80 fa 78             	cmp    $0x78,%dl
  101693:	75 c7                	jne    10165c <printk+0x24>
  101695:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10169c:	8d 70 04             	lea    0x4(%eax),%esi
  10169f:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1016a2:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  1016a5:	56                   	push   %esi
  1016a6:	ff 30                	pushl  (%eax)
  1016a8:	e8 17 ff ff ff       	call   1015c4 <i2X>
  1016ad:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1016b0:	8d b7 a0 34 10 00    	lea    0x1034a0(%edi),%esi
  1016b6:	8a 11                	mov    (%ecx),%dl
  1016b8:	83 c4 08             	add    $0x8,%esp
  1016bb:	31 c0                	xor    %eax,%eax
  1016bd:	84 d2                	test   %dl,%dl
  1016bf:	74 0f                	je     1016d0 <printk+0x98>
  1016c1:	8d 76 00             	lea    0x0(%esi),%esi
  1016c4:	40                   	inc    %eax
  1016c5:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1016c9:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  1016cc:	84 d2                	test   %dl,%dl
  1016ce:	75 f4                	jne    1016c4 <printk+0x8c>
  1016d0:	01 c7                	add    %eax,%edi
  1016d2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1016d5:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1016d8:	8a 53 01             	mov    0x1(%ebx),%dl
  1016db:	84 d2                	test   %dl,%dl
  1016dd:	75 8e                	jne    10166d <printk+0x35>
  1016df:	c6 87 a0 34 10 00 00 	movb   $0x0,0x1034a0(%edi)
  1016e6:	0f be 05 a0 34 10 00 	movsbl 0x1034a0,%eax
  1016ed:	bb a0 34 10 00       	mov    $0x1034a0,%ebx
  1016f2:	84 c0                	test   %al,%al
  1016f4:	74 16                	je     10170c <printk+0xd4>
  1016f6:	66 90                	xchg   %ax,%ax
  1016f8:	83 ec 0c             	sub    $0xc,%esp
  1016fb:	50                   	push   %eax
  1016fc:	e8 33 f1 ff ff       	call   100834 <putChar>
  101701:	43                   	inc    %ebx
  101702:	0f be 03             	movsbl (%ebx),%eax
  101705:	83 c4 10             	add    $0x10,%esp
  101708:	84 c0                	test   %al,%al
  10170a:	75 ec                	jne    1016f8 <printk+0xc0>
  10170c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10170f:	5b                   	pop    %ebx
  101710:	5e                   	pop    %esi
  101711:	5f                   	pop    %edi
  101712:	5d                   	pop    %ebp
  101713:	c3                   	ret    
  101714:	8d 70 04             	lea    0x4(%eax),%esi
  101717:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10171a:	8b 08                	mov    (%eax),%ecx
  10171c:	8d b7 a0 34 10 00    	lea    0x1034a0(%edi),%esi
  101722:	8a 11                	mov    (%ecx),%dl
  101724:	31 c0                	xor    %eax,%eax
  101726:	84 d2                	test   %dl,%dl
  101728:	74 a6                	je     1016d0 <printk+0x98>
  10172a:	66 90                	xchg   %ax,%ax
  10172c:	40                   	inc    %eax
  10172d:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101731:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  101734:	84 d2                	test   %dl,%dl
  101736:	75 f4                	jne    10172c <printk+0xf4>
  101738:	01 c7                	add    %eax,%edi
  10173a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10173d:	eb 96                	jmp    1016d5 <printk+0x9d>
  10173f:	90                   	nop
  101740:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  101747:	8d 70 04             	lea    0x4(%eax),%esi
  10174a:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10174d:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101750:	56                   	push   %esi
  101751:	ff 30                	pushl  (%eax)
  101753:	e8 d0 fd ff ff       	call   101528 <i2A>
  101758:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  10175b:	8d b7 a0 34 10 00    	lea    0x1034a0(%edi),%esi
  101761:	8a 11                	mov    (%ecx),%dl
  101763:	83 c4 08             	add    $0x8,%esp
  101766:	31 c0                	xor    %eax,%eax
  101768:	84 d2                	test   %dl,%dl
  10176a:	0f 84 60 ff ff ff    	je     1016d0 <printk+0x98>
  101770:	40                   	inc    %eax
  101771:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101775:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  101778:	84 d2                	test   %dl,%dl
  10177a:	75 f4                	jne    101770 <printk+0x138>
  10177c:	01 c7                	add    %eax,%edi
  10177e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101781:	e9 4f ff ff ff       	jmp    1016d5 <printk+0x9d>
  101786:	66 90                	xchg   %ax,%ax
  101788:	80 fa 63             	cmp    $0x63,%dl
  10178b:	0f 85 cb fe ff ff    	jne    10165c <printk+0x24>
  101791:	8b 10                	mov    (%eax),%edx
  101793:	88 97 a0 34 10 00    	mov    %dl,0x1034a0(%edi)
  101799:	83 c0 04             	add    $0x4,%eax
  10179c:	47                   	inc    %edi
  10179d:	e9 c1 fe ff ff       	jmp    101663 <printk+0x2b>
  1017a2:	31 ff                	xor    %edi,%edi
  1017a4:	e9 36 ff ff ff       	jmp    1016df <printk+0xa7>
  1017a9:	66 90                	xchg   %ax,%ax
  1017ab:	90                   	nop

001017ac <abort>:
  1017ac:	55                   	push   %ebp
  1017ad:	89 e5                	mov    %esp,%ebp
  1017af:	57                   	push   %edi
  1017b0:	56                   	push   %esi
  1017b1:	53                   	push   %ebx
  1017b2:	83 ec 1c             	sub    $0x1c,%esp
  1017b5:	8b 55 08             	mov    0x8(%ebp),%edx
  1017b8:	fa                   	cli    
  1017b9:	8a 02                	mov    (%edx),%al
  1017bb:	b9 52 33 10 00       	mov    $0x103352,%ecx
  1017c0:	84 c0                	test   %al,%al
  1017c2:	74 0b                	je     1017cf <abort+0x23>
  1017c4:	41                   	inc    %ecx
  1017c5:	42                   	inc    %edx
  1017c6:	88 41 ff             	mov    %al,-0x1(%ecx)
  1017c9:	8a 02                	mov    (%edx),%al
  1017cb:	84 c0                	test   %al,%al
  1017cd:	75 f5                	jne    1017c4 <abort+0x18>
  1017cf:	c6 01 3a             	movb   $0x3a,(%ecx)
  1017d2:	bb bd 3c 10 00       	mov    $0x103cbd,%ebx
  1017d7:	be 0a 00 00 00       	mov    $0xa,%esi
  1017dc:	bf 67 66 66 66       	mov    $0x66666667,%edi
  1017e1:	4b                   	dec    %ebx
  1017e2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1017e5:	99                   	cltd   
  1017e6:	f7 fe                	idiv   %esi
  1017e8:	8d 42 30             	lea    0x30(%edx),%eax
  1017eb:	88 45 e7             	mov    %al,-0x19(%ebp)
  1017ee:	88 03                	mov    %al,(%ebx)
  1017f0:	89 f8                	mov    %edi,%eax
  1017f2:	f7 6d 0c             	imull  0xc(%ebp)
  1017f5:	c1 fa 02             	sar    $0x2,%edx
  1017f8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1017fb:	c1 f8 1f             	sar    $0x1f,%eax
  1017fe:	29 c2                	sub    %eax,%edx
  101800:	89 55 0c             	mov    %edx,0xc(%ebp)
  101803:	75 dc                	jne    1017e1 <abort+0x35>
  101805:	41                   	inc    %ecx
  101806:	41                   	inc    %ecx
  101807:	43                   	inc    %ebx
  101808:	8a 45 e7             	mov    -0x19(%ebp),%al
  10180b:	88 41 ff             	mov    %al,-0x1(%ecx)
  10180e:	8a 03                	mov    (%ebx),%al
  101810:	88 45 e7             	mov    %al,-0x19(%ebp)
  101813:	84 c0                	test   %al,%al
  101815:	75 ef                	jne    101806 <abort+0x5a>
  101817:	c6 01 0a             	movb   $0xa,(%ecx)
  10181a:	0f be 05 40 33 10 00 	movsbl 0x103340,%eax
  101821:	84 c0                	test   %al,%al
  101823:	74 1b                	je     101840 <abort+0x94>
  101825:	bb 40 33 10 00       	mov    $0x103340,%ebx
  10182a:	83 ec 0c             	sub    $0xc,%esp
  10182d:	50                   	push   %eax
  10182e:	e8 01 f0 ff ff       	call   100834 <putChar>
  101833:	43                   	inc    %ebx
  101834:	0f be 03             	movsbl (%ebx),%eax
  101837:	83 c4 10             	add    $0x10,%esp
  10183a:	84 c0                	test   %al,%al
  10183c:	75 ec                	jne    10182a <abort+0x7e>
  10183e:	66 90                	xchg   %ax,%ax
  101840:	f4                   	hlt    
  101841:	eb fd                	jmp    101840 <abort+0x94>

00101843 <irqEmpty>:
  101843:	6a 00                	push   $0x0
  101845:	6a ff                	push   $0xffffffff
  101847:	eb 13                	jmp    10185c <asmDoIrq>

00101849 <irqGProtectFault>:
  101849:	6a 0d                	push   $0xd
  10184b:	eb 0f                	jmp    10185c <asmDoIrq>

0010184d <irqSyscall>:
  10184d:	6a 00                	push   $0x0
  10184f:	68 80 00 00 00       	push   $0x80
  101854:	eb 06                	jmp    10185c <asmDoIrq>

00101856 <irqTime>:
  101856:	6a 00                	push   $0x0
  101858:	6a 20                	push   $0x20
  10185a:	eb 00                	jmp    10185c <asmDoIrq>

0010185c <asmDoIrq>:
  10185c:	60                   	pusha  
  10185d:	1e                   	push   %ds
  10185e:	06                   	push   %es
  10185f:	0f a0                	push   %fs
  101861:	0f a8                	push   %gs
  101863:	54                   	push   %esp
  101864:	e8 fb fa ff ff       	call   101364 <irqHandle>
  101869:	5c                   	pop    %esp
  10186a:	0f a9                	pop    %gs
  10186c:	0f a1                	pop    %fs
  10186e:	07                   	pop    %es
  10186f:	1f                   	pop    %ds
  101870:	61                   	popa   
  101871:	83 c4 04             	add    $0x4,%esp
  101874:	83 c4 04             	add    $0x4,%esp
  101877:	cf                   	iret   
