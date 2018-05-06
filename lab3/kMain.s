
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 15 15 00 00       	call   101520 <initTimer>
  10000b:	e8 1c 10 00 00       	call   10102c <init_pcb>
  100010:	e8 5b 10 00 00       	call   101070 <init_kernel_pcb>
  100015:	e8 46 08 00 00       	call   100860 <initSerial>
  10001a:	e8 11 11 00 00       	call   101130 <initIdt>
  10001f:	e8 a4 14 00 00       	call   1014c8 <initIntr>
  100024:	e8 4f 02 00 00       	call   100278 <initSeg>
  100029:	fb                   	sti    
  10002a:	e8 a1 04 00 00       	call   1004d0 <loadUMain>
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
  10005f:	66 c7 05 40 7d 13 01 	movw   $0xffff,0x1137d40
  100066:	ff ff 
  100068:	66 a3 42 7d 13 01    	mov    %ax,0x1137d42
  10006e:	89 c2                	mov    %eax,%edx
  100070:	c1 ea 10             	shr    $0x10,%edx
  100073:	88 15 44 7d 13 01    	mov    %dl,0x1137d44
  100079:	c6 05 45 7d 13 01 f2 	movb   $0xf2,0x1137d45
  100080:	c6 05 46 7d 13 01 cf 	movb   $0xcf,0x1137d46
  100087:	c1 e8 18             	shr    $0x18,%eax
  10008a:	a2 47 7d 13 01       	mov    %al,0x1137d47
  10008f:	66 c7 05 80 34 10 00 	movw   $0x4f,0x103480
  100096:	4f 00 
  100098:	b8 20 7d 13 01       	mov    $0x1137d20,%eax
  10009d:	66 a3 82 34 10 00    	mov    %ax,0x103482
  1000a3:	c1 e8 10             	shr    $0x10,%eax
  1000a6:	66 a3 84 34 10 00    	mov    %ax,0x103484
  1000ac:	b8 80 34 10 00       	mov    $0x103480,%eax
  1000b1:	0f 01 10             	lgdtl  (%eax)
  1000b4:	b8 01 00 00 00       	mov    $0x1,%eax
  1000b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000bc:	c9                   	leave  
  1000bd:	c3                   	ret    
  1000be:	66 90                	xchg   %ax,%ax
  1000c0:	66 c7 05 38 7d 13 01 	movw   $0xffff,0x1137d38
  1000c7:	ff ff 
  1000c9:	66 a3 3a 7d 13 01    	mov    %ax,0x1137d3a
  1000cf:	89 c2                	mov    %eax,%edx
  1000d1:	c1 ea 10             	shr    $0x10,%edx
  1000d4:	88 15 3c 7d 13 01    	mov    %dl,0x1137d3c
  1000da:	c6 05 3d 7d 13 01 fa 	movb   $0xfa,0x1137d3d
  1000e1:	c6 05 3e 7d 13 01 cf 	movb   $0xcf,0x1137d3e
  1000e8:	c1 e8 18             	shr    $0x18,%eax
  1000eb:	a2 3f 7d 13 01       	mov    %al,0x1137d3f
  1000f0:	eb 9d                	jmp    10008f <change_gdt+0x5b>
  1000f2:	66 90                	xchg   %ax,%ax
  1000f4:	83 fb 01             	cmp    $0x1,%ebx
  1000f7:	75 37                	jne    100130 <change_gdt+0xfc>
  1000f9:	66 c7 05 28 7d 13 01 	movw   $0xffff,0x1137d28
  100100:	ff ff 
  100102:	66 a3 2a 7d 13 01    	mov    %ax,0x1137d2a
  100108:	89 c2                	mov    %eax,%edx
  10010a:	c1 ea 10             	shr    $0x10,%edx
  10010d:	88 15 2c 7d 13 01    	mov    %dl,0x1137d2c
  100113:	c6 05 2d 7d 13 01 9a 	movb   $0x9a,0x1137d2d
  10011a:	c6 05 2e 7d 13 01 cf 	movb   $0xcf,0x1137d2e
  100121:	c1 e8 18             	shr    $0x18,%eax
  100124:	a2 2f 7d 13 01       	mov    %al,0x1137d2f
  100129:	e9 61 ff ff ff       	jmp    10008f <change_gdt+0x5b>
  10012e:	66 90                	xchg   %ax,%ax
  100130:	83 ec 0c             	sub    $0xc,%esp
  100133:	68 88 18 10 00       	push   $0x101888
  100138:	e8 0b 15 00 00       	call   101648 <printk>
  10013d:	89 1c 24             	mov    %ebx,(%esp)
  100140:	68 c8 18 10 00       	push   $0x1018c8
  100145:	6a 18                	push   $0x18
  100147:	68 8e 18 10 00       	push   $0x10188e
  10014c:	68 9b 18 10 00       	push   $0x10189b
  100151:	e8 f2 14 00 00       	call   101648 <printk>
  100156:	83 c4 14             	add    $0x14,%esp
  100159:	68 b7 18 10 00       	push   $0x1018b7
  10015e:	e8 e5 14 00 00       	call   101648 <printk>
  100163:	58                   	pop    %eax
  100164:	5a                   	pop    %edx
  100165:	6a 19                	push   $0x19
  100167:	68 8e 18 10 00       	push   $0x10188e
  10016c:	e8 4b 16 00 00       	call   1017bc <abort>
  100171:	83 c4 10             	add    $0x10,%esp
  100174:	e9 16 ff ff ff       	jmp    10008f <change_gdt+0x5b>
  100179:	8d 76 00             	lea    0x0(%esi),%esi
  10017c:	66 c7 05 30 7d 13 01 	movw   $0xffff,0x1137d30
  100183:	ff ff 
  100185:	66 a3 32 7d 13 01    	mov    %ax,0x1137d32
  10018b:	89 c2                	mov    %eax,%edx
  10018d:	c1 ea 10             	shr    $0x10,%edx
  100190:	88 15 34 7d 13 01    	mov    %dl,0x1137d34
  100196:	c6 05 35 7d 13 01 92 	movb   $0x92,0x1137d35
  10019d:	c6 05 36 7d 13 01 cf 	movb   $0xcf,0x1137d36
  1001a4:	c1 e8 18             	shr    $0x18,%eax
  1001a7:	a2 37 7d 13 01       	mov    %al,0x1137d37
  1001ac:	e9 de fe ff ff       	jmp    10008f <change_gdt+0x5b>
  1001b1:	8d 76 00             	lea    0x0(%esi),%esi

001001b4 <change_tss>:
  1001b4:	55                   	push   %ebp
  1001b5:	89 e5                	mov    %esp,%ebp
  1001b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1001ba:	a3 88 7d 13 01       	mov    %eax,0x1137d88
  1001bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1001c2:	a3 84 7d 13 01       	mov    %eax,0x1137d84
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
  1001d8:	be 80 7d 13 01       	mov    $0x1137d80,%esi
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
  10027b:	b9 20 7d 13 01       	mov    $0x1137d20,%ecx
  100280:	66 c7 05 28 7d 13 01 	movw   $0xffff,0x1137d28
  100287:	ff ff 
  100289:	66 c7 05 2a 7d 13 01 	movw   $0x0,0x1137d2a
  100290:	00 00 
  100292:	c6 05 2c 7d 13 01 00 	movb   $0x0,0x1137d2c
  100299:	c6 05 2d 7d 13 01 9a 	movb   $0x9a,0x1137d2d
  1002a0:	c6 05 2e 7d 13 01 cf 	movb   $0xcf,0x1137d2e
  1002a7:	c6 05 2f 7d 13 01 00 	movb   $0x0,0x1137d2f
  1002ae:	66 c7 05 30 7d 13 01 	movw   $0xffff,0x1137d30
  1002b5:	ff ff 
  1002b7:	66 c7 05 32 7d 13 01 	movw   $0x0,0x1137d32
  1002be:	00 00 
  1002c0:	c6 05 34 7d 13 01 00 	movb   $0x0,0x1137d34
  1002c7:	c6 05 35 7d 13 01 92 	movb   $0x92,0x1137d35
  1002ce:	c6 05 36 7d 13 01 cf 	movb   $0xcf,0x1137d36
  1002d5:	c6 05 37 7d 13 01 00 	movb   $0x0,0x1137d37
  1002dc:	66 c7 05 38 7d 13 01 	movw   $0xffff,0x1137d38
  1002e3:	ff ff 
  1002e5:	66 c7 05 3a 7d 13 01 	movw   $0x0,0x1137d3a
  1002ec:	00 00 
  1002ee:	c6 05 3c 7d 13 01 00 	movb   $0x0,0x1137d3c
  1002f5:	c6 05 3d 7d 13 01 fa 	movb   $0xfa,0x1137d3d
  1002fc:	c6 05 3e 7d 13 01 cf 	movb   $0xcf,0x1137d3e
  100303:	c6 05 3f 7d 13 01 00 	movb   $0x0,0x1137d3f
  10030a:	66 c7 05 40 7d 13 01 	movw   $0xffff,0x1137d40
  100311:	ff ff 
  100313:	66 c7 05 42 7d 13 01 	movw   $0x0,0x1137d42
  10031a:	00 00 
  10031c:	c6 05 44 7d 13 01 00 	movb   $0x0,0x1137d44
  100323:	c6 05 45 7d 13 01 f2 	movb   $0xf2,0x1137d45
  10032a:	c6 05 46 7d 13 01 cf 	movb   $0xcf,0x1137d46
  100331:	c6 05 47 7d 13 01 00 	movb   $0x0,0x1137d47
  100338:	66 c7 05 48 7d 13 01 	movw   $0x63,0x1137d48
  10033f:	63 00 
  100341:	b8 80 7d 13 01       	mov    $0x1137d80,%eax
  100346:	66 a3 4a 7d 13 01    	mov    %ax,0x1137d4a
  10034c:	89 c2                	mov    %eax,%edx
  10034e:	c1 ea 10             	shr    $0x10,%edx
  100351:	88 15 4c 7d 13 01    	mov    %dl,0x1137d4c
  100357:	c6 05 4d 7d 13 01 89 	movb   $0x89,0x1137d4d
  10035e:	c6 05 4e 7d 13 01 40 	movb   $0x40,0x1137d4e
  100365:	c1 e8 18             	shr    $0x18,%eax
  100368:	a2 4f 7d 13 01       	mov    %al,0x1137d4f
  10036d:	a1 c0 18 10 00       	mov    0x1018c0,%eax
  100372:	8b 15 c4 18 10 00    	mov    0x1018c4,%edx
  100378:	a3 50 7d 13 01       	mov    %eax,0x1137d50
  10037d:	89 15 54 7d 13 01    	mov    %edx,0x1137d54
  100383:	66 c7 05 60 7d 13 01 	movw   $0xffff,0x1137d60
  10038a:	ff ff 
  10038c:	66 c7 05 62 7d 13 01 	movw   $0x0,0x1137d62
  100393:	00 00 
  100395:	c6 05 64 7d 13 01 00 	movb   $0x0,0x1137d64
  10039c:	c6 05 65 7d 13 01 f2 	movb   $0xf2,0x1137d65
  1003a3:	c6 05 66 7d 13 01 cf 	movb   $0xcf,0x1137d66
  1003aa:	c6 05 67 7d 13 01 00 	movb   $0x0,0x1137d67
  1003b1:	66 c7 05 80 34 10 00 	movw   $0x4f,0x103480
  1003b8:	4f 00 
  1003ba:	66 89 0d 82 34 10 00 	mov    %cx,0x103482
  1003c1:	c1 e9 10             	shr    $0x10,%ecx
  1003c4:	66 89 0d 84 34 10 00 	mov    %cx,0x103484
  1003cb:	b8 80 34 10 00       	mov    $0x103480,%eax
  1003d0:	0f 01 10             	lgdtl  (%eax)
  1003d3:	a1 68 5d 10 00       	mov    0x105d68,%eax
  1003d8:	a3 88 7d 13 01       	mov    %eax,0x1137d88
  1003dd:	c7 05 84 7d 13 01 1c 	movl   $0x105d1c,0x1137d84
  1003e4:	5d 10 00 
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
  100431:	8d 04 c5 20 3d 10 00 	lea    0x103d20(,%eax,8),%eax
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
  10045b:	83 ec 10             	sub    $0x10,%esp
  10045e:	c7 05 04 3d 10 00 01 	movl   $0x1,0x103d04
  100465:	00 00 00 
  100468:	c7 05 d0 7d 10 00 23 	movl   $0x23,0x107dd0
  10046f:	00 00 00 
  100472:	c7 05 c4 7d 10 00 1b 	movl   $0x1b,0x107dc4
  100479:	00 00 00 
  10047c:	c7 05 94 7d 10 00 23 	movl   $0x23,0x107d94
  100483:	00 00 00 
  100486:	c7 05 90 7d 10 00 23 	movl   $0x23,0x107d90
  10048d:	00 00 00 
  100490:	c7 05 8c 7d 10 00 23 	movl   $0x23,0x107d8c
  100497:	00 00 00 
  10049a:	c7 05 cc 7d 10 00 00 	movl   $0x400000,0x107dcc
  1004a1:	00 40 00 
  1004a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1004a7:	a3 c0 7d 10 00       	mov    %eax,0x107dc0
  1004ac:	c7 05 d8 7d 10 00 0a 	movl   $0xa,0x107dd8
  1004b3:	00 00 00 
  1004b6:	6a 00                	push   $0x0
  1004b8:	6a 01                	push   $0x1
  1004ba:	e8 d1 05 00 00       	call   100a90 <put_into_runnable>
  1004bf:	83 c4 10             	add    $0x10,%esp
  1004c2:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  1004c9:	c9                   	leave  
  1004ca:	e9 41 ff ff ff       	jmp    100410 <enterUserSpace_pcb>
  1004cf:	90                   	nop

001004d0 <loadUMain>:
  1004d0:	55                   	push   %ebp
  1004d1:	89 e5                	mov    %esp,%ebp
  1004d3:	57                   	push   %edi
  1004d4:	56                   	push   %esi
  1004d5:	53                   	push   %ebx
  1004d6:	83 ec 0c             	sub    $0xc,%esp
  1004d9:	bb c9 00 00 00       	mov    $0xc9,%ebx
  1004de:	be 00 00 03 00       	mov    $0x30000,%esi
  1004e3:	90                   	nop
  1004e4:	53                   	push   %ebx
  1004e5:	56                   	push   %esi
  1004e6:	e8 15 fd ff ff       	call   100200 <readSect>
  1004eb:	81 c6 00 02 00 00    	add    $0x200,%esi
  1004f1:	43                   	inc    %ebx
  1004f2:	58                   	pop    %eax
  1004f3:	5a                   	pop    %edx
  1004f4:	81 fb 91 01 00 00    	cmp    $0x191,%ebx
  1004fa:	75 e8                	jne    1004e4 <loadUMain+0x14>
  1004fc:	a1 1c 00 03 00       	mov    0x3001c,%eax
  100501:	8d 90 00 00 03 00    	lea    0x30000(%eax),%edx
  100507:	0f b7 35 2c 00 03 00 	movzwl 0x3002c,%esi
  10050e:	c1 e6 05             	shl    $0x5,%esi
  100511:	01 d6                	add    %edx,%esi
  100513:	39 f2                	cmp    %esi,%edx
  100515:	72 0c                	jb     100523 <loadUMain+0x53>
  100517:	eb 53                	jmp    10056c <loadUMain+0x9c>
  100519:	8d 76 00             	lea    0x0(%esi),%esi
  10051c:	83 c2 20             	add    $0x20,%edx
  10051f:	39 d6                	cmp    %edx,%esi
  100521:	76 49                	jbe    10056c <loadUMain+0x9c>
  100523:	83 3a 01             	cmpl   $0x1,(%edx)
  100526:	75 f4                	jne    10051c <loadUMain+0x4c>
  100528:	8b 42 08             	mov    0x8(%edx),%eax
  10052b:	8b 7a 10             	mov    0x10(%edx),%edi
  10052e:	8b 5a 04             	mov    0x4(%edx),%ebx
  100531:	29 c3                	sub    %eax,%ebx
  100533:	31 c9                	xor    %ecx,%ecx
  100535:	85 ff                	test   %edi,%edi
  100537:	74 16                	je     10054f <loadUMain+0x7f>
  100539:	8d 76 00             	lea    0x0(%esi),%esi
  10053c:	8a 8c 03 00 00 03 00 	mov    0x30000(%ebx,%eax,1),%cl
  100543:	88 08                	mov    %cl,(%eax)
  100545:	40                   	inc    %eax
  100546:	89 c1                	mov    %eax,%ecx
  100548:	2b 4a 08             	sub    0x8(%edx),%ecx
  10054b:	39 cf                	cmp    %ecx,%edi
  10054d:	77 ed                	ja     10053c <loadUMain+0x6c>
  10054f:	8b 5a 14             	mov    0x14(%edx),%ebx
  100552:	39 cb                	cmp    %ecx,%ebx
  100554:	76 c6                	jbe    10051c <loadUMain+0x4c>
  100556:	66 90                	xchg   %ax,%ax
  100558:	c6 00 00             	movb   $0x0,(%eax)
  10055b:	40                   	inc    %eax
  10055c:	89 c1                	mov    %eax,%ecx
  10055e:	2b 4a 08             	sub    0x8(%edx),%ecx
  100561:	39 cb                	cmp    %ecx,%ebx
  100563:	77 f3                	ja     100558 <loadUMain+0x88>
  100565:	83 c2 20             	add    $0x20,%edx
  100568:	39 d6                	cmp    %edx,%esi
  10056a:	77 b7                	ja     100523 <loadUMain+0x53>
  10056c:	31 c0                	xor    %eax,%eax
  10056e:	66 90                	xchg   %ax,%ax
  100570:	8a 90 00 00 20 00    	mov    0x200000(%eax),%dl
  100576:	88 90 00 00 21 00    	mov    %dl,0x210000(%eax)
  10057c:	88 90 00 00 22 00    	mov    %dl,0x220000(%eax)
  100582:	40                   	inc    %eax
  100583:	3d 00 00 01 00       	cmp    $0x10000,%eax
  100588:	75 e6                	jne    100570 <loadUMain+0xa0>
  10058a:	83 ec 0c             	sub    $0xc,%esp
  10058d:	ff 35 18 00 03 00    	pushl  0x30018
  100593:	e8 c0 fe ff ff       	call   100458 <enterUserSpace>
  100598:	83 c4 10             	add    $0x10,%esp
  10059b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10059e:	5b                   	pop    %ebx
  10059f:	5e                   	pop    %esi
  1005a0:	5f                   	pop    %edi
  1005a1:	5d                   	pop    %ebp
  1005a2:	c3                   	ret    
  1005a3:	90                   	nop

001005a4 <sys_exit>:
  1005a4:	55                   	push   %ebp
  1005a5:	89 e5                	mov    %esp,%ebp
  1005a7:	83 ec 14             	sub    $0x14,%esp
  1005aa:	68 d3 18 10 00       	push   $0x1018d3
  1005af:	e8 94 10 00 00       	call   101648 <printk>
  1005b4:	e8 17 04 00 00       	call   1009d0 <get_from_runnable>
  1005b9:	5a                   	pop    %edx
  1005ba:	59                   	pop    %ecx
  1005bb:	ff 75 08             	pushl  0x8(%ebp)
  1005be:	50                   	push   %eax
  1005bf:	e8 a4 03 00 00       	call   100968 <put_into_running>
  1005c4:	b8 01 00 00 00       	mov    $0x1,%eax
  1005c9:	c9                   	leave  
  1005ca:	c3                   	ret    
  1005cb:	90                   	nop

001005cc <sys_getpid>:
  1005cc:	55                   	push   %ebp
  1005cd:	89 e5                	mov    %esp,%ebp
  1005cf:	5d                   	pop    %ebp
  1005d0:	e9 cb 03 00 00       	jmp    1009a0 <getpid>
  1005d5:	66 90                	xchg   %ax,%ax
  1005d7:	90                   	nop

001005d8 <sys_sleep>:
  1005d8:	55                   	push   %ebp
  1005d9:	89 e5                	mov    %esp,%ebp
  1005db:	56                   	push   %esi
  1005dc:	53                   	push   %ebx
  1005dd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1005e0:	e8 bb 03 00 00       	call   1009a0 <getpid>
  1005e5:	83 ec 08             	sub    $0x8,%esp
  1005e8:	53                   	push   %ebx
  1005e9:	50                   	push   %eax
  1005ea:	e8 d1 05 00 00       	call   100bc0 <put_into_block>
  1005ef:	c7 04 24 88 18 10 00 	movl   $0x101888,(%esp)
  1005f6:	e8 4d 10 00 00       	call   101648 <printk>
  1005fb:	e8 a0 03 00 00       	call   1009a0 <getpid>
  100600:	89 c2                	mov    %eax,%edx
  100602:	c1 e2 07             	shl    $0x7,%edx
  100605:	01 c2                	add    %eax,%edx
  100607:	01 d2                	add    %edx,%edx
  100609:	01 c2                	add    %eax,%edx
  10060b:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10060e:	8b 34 c5 74 5d 10 00 	mov    0x105d74(,%eax,8),%esi
  100615:	e8 86 03 00 00       	call   1009a0 <getpid>
  10061a:	5a                   	pop    %edx
  10061b:	59                   	pop    %ecx
  10061c:	56                   	push   %esi
  10061d:	50                   	push   %eax
  10061e:	68 24 19 10 00       	push   $0x101924
  100623:	6a 09                	push   $0x9
  100625:	68 e1 18 10 00       	push   $0x1018e1
  10062a:	68 00 19 10 00       	push   $0x101900
  10062f:	e8 14 10 00 00       	call   101648 <printk>
  100634:	83 c4 14             	add    $0x14,%esp
  100637:	68 b7 18 10 00       	push   $0x1018b7
  10063c:	e8 07 10 00 00       	call   101648 <printk>
  100641:	e8 8a 03 00 00       	call   1009d0 <get_from_runnable>
  100646:	5e                   	pop    %esi
  100647:	5a                   	pop    %edx
  100648:	53                   	push   %ebx
  100649:	50                   	push   %eax
  10064a:	e8 19 03 00 00       	call   100968 <put_into_running>
  10064f:	b8 01 00 00 00       	mov    $0x1,%eax
  100654:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100657:	5b                   	pop    %ebx
  100658:	5e                   	pop    %esi
  100659:	5d                   	pop    %ebp
  10065a:	c3                   	ret    
  10065b:	90                   	nop

0010065c <sys_fork>:
  10065c:	55                   	push   %ebp
  10065d:	89 e5                	mov    %esp,%ebp
  10065f:	57                   	push   %edi
  100660:	56                   	push   %esi
  100661:	53                   	push   %ebx
  100662:	83 ec 18             	sub    $0x18,%esp
  100665:	8b 75 08             	mov    0x8(%ebp),%esi
  100668:	68 2e 19 10 00       	push   $0x10192e
  10066d:	e8 d6 0f 00 00       	call   101648 <printk>
  100672:	83 c4 10             	add    $0x10,%esp
  100675:	31 db                	xor    %ebx,%ebx
  100677:	90                   	nop
  100678:	e8 23 03 00 00       	call   1009a0 <getpid>
  10067d:	89 c2                	mov    %eax,%edx
  10067f:	c1 e2 07             	shl    $0x7,%edx
  100682:	01 c2                	add    %eax,%edx
  100684:	01 d2                	add    %edx,%edx
  100686:	01 c2                	add    %eax,%edx
  100688:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10068b:	01 c0                	add    %eax,%eax
  10068d:	01 d8                	add    %ebx,%eax
  10068f:	8b 04 85 20 3d 10 00 	mov    0x103d20(,%eax,4),%eax
  100696:	89 04 9d f0 7d 10 00 	mov    %eax,0x107df0(,%ebx,4)
  10069d:	43                   	inc    %ebx
  10069e:	81 fb 00 08 00 00    	cmp    $0x800,%ebx
  1006a4:	75 d2                	jne    100678 <sys_fork+0x1c>
  1006a6:	e8 f5 02 00 00       	call   1009a0 <getpid>
  1006ab:	8d 50 40             	lea    0x40(%eax),%edx
  1006ae:	c1 e2 10             	shl    $0x10,%edx
  1006b1:	b8 00 00 01 00       	mov    $0x10000,%eax
  1006b6:	66 90                	xchg   %ax,%ax
  1006b8:	8a 8c 10 00 00 ff ff 	mov    -0x10000(%eax,%edx,1),%cl
  1006bf:	88 88 00 00 41 00    	mov    %cl,0x410000(%eax)
  1006c5:	48                   	dec    %eax
  1006c6:	75 f0                	jne    1006b8 <sys_fork+0x5c>
  1006c8:	b8 f0 9d 10 00       	mov    $0x109df0,%eax
  1006cd:	b9 13 00 00 00       	mov    $0x13,%ecx
  1006d2:	89 c7                	mov    %eax,%edi
  1006d4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1006d6:	c7 05 1c 9e 10 00 00 	movl   $0x0,0x109e1c
  1006dd:	00 00 00 
  1006e0:	83 ec 08             	sub    $0x8,%esp
  1006e3:	50                   	push   %eax
  1006e4:	6a 02                	push   $0x2
  1006e6:	e8 a5 03 00 00       	call   100a90 <put_into_runnable>
  1006eb:	b8 02 00 00 00       	mov    $0x2,%eax
  1006f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1006f3:	5b                   	pop    %ebx
  1006f4:	5e                   	pop    %esi
  1006f5:	5f                   	pop    %edi
  1006f6:	5d                   	pop    %ebp
  1006f7:	c3                   	ret    

001006f8 <display>:
  1006f8:	55                   	push   %ebp
  1006f9:	89 e5                	mov    %esp,%ebp
  1006fb:	57                   	push   %edi
  1006fc:	53                   	push   %ebx
  1006fd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100700:	80 fb 0a             	cmp    $0xa,%bl
  100703:	74 5b                	je     100760 <display+0x68>
  100705:	8b 15 88 34 10 00    	mov    0x103488,%edx
  10070b:	8b 0d 8c 34 10 00    	mov    0x10348c,%ecx
  100711:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  100714:	c1 e0 04             	shl    $0x4,%eax
  100717:	01 d0                	add    %edx,%eax
  100719:	01 c0                	add    %eax,%eax
  10071b:	89 c7                	mov    %eax,%edi
  10071d:	0f be db             	movsbl %bl,%ebx
  100720:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
  100726:	66 89 d8             	mov    %bx,%ax
  100729:	65 66 89 07          	mov    %ax,%gs:(%edi)
  10072d:	42                   	inc    %edx
  10072e:	83 fa 50             	cmp    $0x50,%edx
  100731:	75 1d                	jne    100750 <display+0x58>
  100733:	c7 05 88 34 10 00 00 	movl   $0x0,0x103488
  10073a:	00 00 00 
  10073d:	41                   	inc    %ecx
  10073e:	89 0d 8c 34 10 00    	mov    %ecx,0x10348c
  100744:	b8 01 00 00 00       	mov    $0x1,%eax
  100749:	5b                   	pop    %ebx
  10074a:	5f                   	pop    %edi
  10074b:	5d                   	pop    %ebp
  10074c:	c3                   	ret    
  10074d:	8d 76 00             	lea    0x0(%esi),%esi
  100750:	89 15 88 34 10 00    	mov    %edx,0x103488
  100756:	b8 01 00 00 00       	mov    $0x1,%eax
  10075b:	5b                   	pop    %ebx
  10075c:	5f                   	pop    %edi
  10075d:	5d                   	pop    %ebp
  10075e:	c3                   	ret    
  10075f:	90                   	nop
  100760:	c7 05 88 34 10 00 00 	movl   $0x0,0x103488
  100767:	00 00 00 
  10076a:	ff 05 8c 34 10 00    	incl   0x10348c
  100770:	b8 01 00 00 00       	mov    $0x1,%eax
  100775:	5b                   	pop    %ebx
  100776:	5f                   	pop    %edi
  100777:	5d                   	pop    %ebp
  100778:	c3                   	ret    
  100779:	8d 76 00             	lea    0x0(%esi),%esi

0010077c <printkernel>:
  10077c:	55                   	push   %ebp
  10077d:	89 e5                	mov    %esp,%ebp
  10077f:	56                   	push   %esi
  100780:	53                   	push   %ebx
  100781:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100784:	8b 75 0c             	mov    0xc(%ebp),%esi
  100787:	85 f6                	test   %esi,%esi
  100789:	7e 30                	jle    1007bb <printkernel+0x3f>
  10078b:	0f be 03             	movsbl (%ebx),%eax
  10078e:	84 c0                	test   %al,%al
  100790:	74 29                	je     1007bb <printkernel+0x3f>
  100792:	01 de                	add    %ebx,%esi
  100794:	eb 09                	jmp    10079f <printkernel+0x23>
  100796:	66 90                	xchg   %ax,%ax
  100798:	0f be 03             	movsbl (%ebx),%eax
  10079b:	84 c0                	test   %al,%al
  10079d:	74 1c                	je     1007bb <printkernel+0x3f>
  10079f:	83 ec 0c             	sub    $0xc,%esp
  1007a2:	50                   	push   %eax
  1007a3:	e8 f8 00 00 00       	call   1008a0 <putChar>
  1007a8:	0f be 03             	movsbl (%ebx),%eax
  1007ab:	89 04 24             	mov    %eax,(%esp)
  1007ae:	e8 45 ff ff ff       	call   1006f8 <display>
  1007b3:	43                   	inc    %ebx
  1007b4:	83 c4 10             	add    $0x10,%esp
  1007b7:	39 de                	cmp    %ebx,%esi
  1007b9:	75 dd                	jne    100798 <printkernel+0x1c>
  1007bb:	b8 01 00 00 00       	mov    $0x1,%eax
  1007c0:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1007c3:	5b                   	pop    %ebx
  1007c4:	5e                   	pop    %esi
  1007c5:	5d                   	pop    %ebp
  1007c6:	c3                   	ret    
  1007c7:	90                   	nop

001007c8 <fs_write>:
  1007c8:	55                   	push   %ebp
  1007c9:	89 e5                	mov    %esp,%ebp
  1007cb:	53                   	push   %ebx
  1007cc:	50                   	push   %eax
  1007cd:	8b 5d 10             	mov    0x10(%ebp),%ebx
  1007d0:	ba 30 00 00 00       	mov    $0x30,%edx
  1007d5:	89 d0                	mov    %edx,%eax
  1007d7:	8e e8                	mov    %eax,%gs
  1007d9:	8b 45 08             	mov    0x8(%ebp),%eax
  1007dc:	48                   	dec    %eax
  1007dd:	83 f8 01             	cmp    $0x1,%eax
  1007e0:	76 12                	jbe    1007f4 <fs_write+0x2c>
  1007e2:	83 ec 08             	sub    $0x8,%esp
  1007e5:	6a 28                	push   $0x28
  1007e7:	68 4a 19 10 00       	push   $0x10194a
  1007ec:	e8 cb 0f 00 00       	call   1017bc <abort>
  1007f1:	83 c4 10             	add    $0x10,%esp
  1007f4:	83 ec 08             	sub    $0x8,%esp
  1007f7:	53                   	push   %ebx
  1007f8:	ff 75 0c             	pushl  0xc(%ebp)
  1007fb:	e8 7c ff ff ff       	call   10077c <printkernel>
  100800:	89 d8                	mov    %ebx,%eax
  100802:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100805:	c9                   	leave  
  100806:	c3                   	ret    
  100807:	90                   	nop

00100808 <sys_write>:
  100808:	55                   	push   %ebp
  100809:	89 e5                	mov    %esp,%ebp
  10080b:	56                   	push   %esi
  10080c:	53                   	push   %ebx
  10080d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100810:	8b 73 24             	mov    0x24(%ebx),%esi
  100813:	e8 88 01 00 00       	call   1009a0 <getpid>
  100818:	52                   	push   %edx
  100819:	56                   	push   %esi
  10081a:	c1 e0 10             	shl    $0x10,%eax
  10081d:	03 43 28             	add    0x28(%ebx),%eax
  100820:	50                   	push   %eax
  100821:	ff 73 20             	pushl  0x20(%ebx)
  100824:	e8 9f ff ff ff       	call   1007c8 <fs_write>
  100829:	89 43 2c             	mov    %eax,0x2c(%ebx)
  10082c:	83 c4 10             	add    $0x10,%esp
  10082f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100832:	5b                   	pop    %ebx
  100833:	5e                   	pop    %esi
  100834:	5d                   	pop    %ebp
  100835:	c3                   	ret    
  100836:	66 90                	xchg   %ax,%ax

00100838 <print_char>:
  100838:	55                   	push   %ebp
  100839:	89 e5                	mov    %esp,%ebp
  10083b:	57                   	push   %edi
  10083c:	8b 45 08             	mov    0x8(%ebp),%eax
  10083f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100842:	c1 e0 04             	shl    $0x4,%eax
  100845:	03 45 0c             	add    0xc(%ebp),%eax
  100848:	01 c0                	add    %eax,%eax
  10084a:	89 c7                	mov    %eax,%edi
  10084c:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  100850:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  100856:	66 89 d0             	mov    %dx,%ax
  100859:	65 66 89 07          	mov    %ax,%gs:(%edi)
  10085d:	5f                   	pop    %edi
  10085e:	5d                   	pop    %ebp
  10085f:	c3                   	ret    

00100860 <initSerial>:
  100860:	55                   	push   %ebp
  100861:	89 e5                	mov    %esp,%ebp
  100863:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100868:	31 c0                	xor    %eax,%eax
  10086a:	ee                   	out    %al,(%dx)
  10086b:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100870:	b0 80                	mov    $0x80,%al
  100872:	ee                   	out    %al,(%dx)
  100873:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100878:	b0 01                	mov    $0x1,%al
  10087a:	ee                   	out    %al,(%dx)
  10087b:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100880:	31 c0                	xor    %eax,%eax
  100882:	ee                   	out    %al,(%dx)
  100883:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100888:	b0 03                	mov    $0x3,%al
  10088a:	ee                   	out    %al,(%dx)
  10088b:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100890:	b0 c7                	mov    $0xc7,%al
  100892:	ee                   	out    %al,(%dx)
  100893:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100898:	b0 0b                	mov    $0xb,%al
  10089a:	ee                   	out    %al,(%dx)
  10089b:	5d                   	pop    %ebp
  10089c:	c3                   	ret    
  10089d:	8d 76 00             	lea    0x0(%esi),%esi

001008a0 <putChar>:
  1008a0:	55                   	push   %ebp
  1008a1:	89 e5                	mov    %esp,%ebp
  1008a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1008a6:	ba fd 03 00 00       	mov    $0x3fd,%edx
  1008ab:	90                   	nop
  1008ac:	ec                   	in     (%dx),%al
  1008ad:	a8 20                	test   $0x20,%al
  1008af:	74 fb                	je     1008ac <putChar+0xc>
  1008b1:	ba f8 03 00 00       	mov    $0x3f8,%edx
  1008b6:	88 c8                	mov    %cl,%al
  1008b8:	ee                   	out    %al,(%dx)
  1008b9:	5d                   	pop    %ebp
  1008ba:	c3                   	ret    
  1008bb:	90                   	nop

001008bc <IDLE>:
  1008bc:	55                   	push   %ebp
  1008bd:	89 e5                	mov    %esp,%ebp
  1008bf:	90                   	nop
  1008c0:	f4                   	hlt    
  1008c1:	eb fd                	jmp    1008c0 <IDLE+0x4>
  1008c3:	90                   	nop

001008c4 <put_into_running.part.0>:
  1008c4:	55                   	push   %ebp
  1008c5:	89 e5                	mov    %esp,%ebp
  1008c7:	53                   	push   %ebx
  1008c8:	83 ec 7c             	sub    $0x7c,%esp
  1008cb:	89 c3                	mov    %eax,%ebx
  1008cd:	a3 00 3d 10 00       	mov    %eax,0x103d00
  1008d2:	c1 e0 07             	shl    $0x7,%eax
  1008d5:	01 d8                	add    %ebx,%eax
  1008d7:	01 c0                	add    %eax,%eax
  1008d9:	01 d8                	add    %ebx,%eax
  1008db:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1008de:	8d 04 c5 1c 5d 10 00 	lea    0x105d1c(,%eax,8),%eax
  1008e5:	50                   	push   %eax
  1008e6:	6a 10                	push   $0x10
  1008e8:	e8 c7 f8 ff ff       	call   1001b4 <change_tss>
  1008ed:	8d 45 94             	lea    -0x6c(%ebp),%eax
  1008f0:	89 04 24             	mov    %eax,(%esp)
  1008f3:	e8 d8 f8 ff ff       	call   1001d0 <get_tss>
  1008f8:	8b 15 00 3d 10 00    	mov    0x103d00,%edx
  1008fe:	89 d0                	mov    %edx,%eax
  100900:	c1 e0 07             	shl    $0x7,%eax
  100903:	01 d0                	add    %edx,%eax
  100905:	01 c0                	add    %eax,%eax
  100907:	01 d0                	add    %edx,%eax
  100909:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10090c:	8d 04 c5 1c 5d 10 00 	lea    0x105d1c(,%eax,8),%eax
  100913:	83 c4 0c             	add    $0xc,%esp
  100916:	39 45 98             	cmp    %eax,-0x68(%ebp)
  100919:	74 12                	je     10092d <put_into_running.part.0+0x69>
  10091b:	83 ec 08             	sub    $0x8,%esp
  10091e:	6a 10                	push   $0x10
  100920:	68 66 19 10 00       	push   $0x101966
  100925:	e8 92 0e 00 00       	call   1017bc <abort>
  10092a:	83 c4 10             	add    $0x10,%esp
  10092d:	83 ec 0c             	sub    $0xc,%esp
  100930:	68 88 18 10 00       	push   $0x101888
  100935:	e8 0e 0d 00 00       	call   101648 <printk>
  10093a:	89 1c 24             	mov    %ebx,(%esp)
  10093d:	68 5c 1a 10 00       	push   $0x101a5c
  100942:	6a 12                	push   $0x12
  100944:	68 66 19 10 00       	push   $0x101966
  100949:	68 74 19 10 00       	push   $0x101974
  10094e:	e8 f5 0c 00 00       	call   101648 <printk>
  100953:	83 c4 14             	add    $0x14,%esp
  100956:	68 b7 18 10 00       	push   $0x1018b7
  10095b:	e8 e8 0c 00 00       	call   101648 <printk>
  100960:	83 c4 10             	add    $0x10,%esp
  100963:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100966:	c9                   	leave  
  100967:	c3                   	ret    

00100968 <put_into_running>:
  100968:	55                   	push   %ebp
  100969:	89 e5                	mov    %esp,%ebp
  10096b:	83 ec 08             	sub    $0x8,%esp
  10096e:	8b 45 08             	mov    0x8(%ebp),%eax
  100971:	39 05 00 3d 10 00    	cmp    %eax,0x103d00
  100977:	74 05                	je     10097e <put_into_running+0x16>
  100979:	e8 46 ff ff ff       	call   1008c4 <put_into_running.part.0>
  10097e:	b8 01 00 00 00       	mov    $0x1,%eax
  100983:	c9                   	leave  
  100984:	c3                   	ret    
  100985:	8d 76 00             	lea    0x0(%esi),%esi

00100988 <update_block>:
  100988:	55                   	push   %ebp
  100989:	89 e5                	mov    %esp,%ebp
  10098b:	b8 01 00 00 00       	mov    $0x1,%eax
  100990:	5d                   	pop    %ebp
  100991:	c3                   	ret    
  100992:	66 90                	xchg   %ax,%ax

00100994 <apply_new_pid>:
  100994:	55                   	push   %ebp
  100995:	89 e5                	mov    %esp,%ebp
  100997:	b8 02 00 00 00       	mov    $0x2,%eax
  10099c:	5d                   	pop    %ebp
  10099d:	c3                   	ret    
  10099e:	66 90                	xchg   %ax,%ax

001009a0 <getpid>:
  1009a0:	55                   	push   %ebp
  1009a1:	89 e5                	mov    %esp,%ebp
  1009a3:	a1 00 3d 10 00       	mov    0x103d00,%eax
  1009a8:	5d                   	pop    %ebp
  1009a9:	c3                   	ret    
  1009aa:	66 90                	xchg   %ax,%ax

001009ac <getrunnable>:
  1009ac:	55                   	push   %ebp
  1009ad:	89 e5                	mov    %esp,%ebp
  1009af:	a1 64 33 10 00       	mov    0x103364,%eax
  1009b4:	5d                   	pop    %ebp
  1009b5:	c3                   	ret    
  1009b6:	66 90                	xchg   %ax,%ax

001009b8 <getblocked>:
  1009b8:	55                   	push   %ebp
  1009b9:	89 e5                	mov    %esp,%ebp
  1009bb:	a1 60 33 10 00       	mov    0x103360,%eax
  1009c0:	5d                   	pop    %ebp
  1009c1:	c3                   	ret    
  1009c2:	66 90                	xchg   %ax,%ax

001009c4 <transfer_pid_mode>:
  1009c4:	55                   	push   %ebp
  1009c5:	89 e5                	mov    %esp,%ebp
  1009c7:	b8 01 00 00 00       	mov    $0x1,%eax
  1009cc:	5d                   	pop    %ebp
  1009cd:	c3                   	ret    
  1009ce:	66 90                	xchg   %ax,%ax

001009d0 <get_from_runnable>:
  1009d0:	55                   	push   %ebp
  1009d1:	89 e5                	mov    %esp,%ebp
  1009d3:	53                   	push   %ebx
  1009d4:	51                   	push   %ecx
  1009d5:	8b 1d 64 33 10 00    	mov    0x103364,%ebx
  1009db:	83 fb ff             	cmp    $0xffffffff,%ebx
  1009de:	0f 84 a4 00 00 00    	je     100a88 <get_from_runnable+0xb8>
  1009e4:	89 d8                	mov    %ebx,%eax
  1009e6:	c1 e0 07             	shl    $0x7,%eax
  1009e9:	01 d8                	add    %ebx,%eax
  1009eb:	01 c0                	add    %eax,%eax
  1009ed:	01 d8                	add    %ebx,%eax
  1009ef:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1009f2:	8d 04 c5 20 3d 10 00 	lea    0x103d20(,%eax,8),%eax
  1009f9:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  1009ff:	39 da                	cmp    %ebx,%edx
  100a01:	74 79                	je     100a7c <get_from_runnable+0xac>
  100a03:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100a09:	89 c8                	mov    %ecx,%eax
  100a0b:	c1 e0 07             	shl    $0x7,%eax
  100a0e:	01 c8                	add    %ecx,%eax
  100a10:	01 c0                	add    %eax,%eax
  100a12:	01 c8                	add    %ecx,%eax
  100a14:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100a17:	89 14 c5 80 5d 10 00 	mov    %edx,0x105d80(,%eax,8)
  100a1e:	89 d0                	mov    %edx,%eax
  100a20:	c1 e0 07             	shl    $0x7,%eax
  100a23:	01 d0                	add    %edx,%eax
  100a25:	01 c0                	add    %eax,%eax
  100a27:	01 d0                	add    %edx,%eax
  100a29:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100a2c:	89 0c c5 7c 5d 10 00 	mov    %ecx,0x105d7c(,%eax,8)
  100a33:	89 15 64 33 10 00    	mov    %edx,0x103364
  100a39:	83 ec 0c             	sub    $0xc,%esp
  100a3c:	68 88 18 10 00       	push   $0x101888
  100a41:	e8 02 0c 00 00       	call   101648 <printk>
  100a46:	58                   	pop    %eax
  100a47:	5a                   	pop    %edx
  100a48:	ff 35 64 33 10 00    	pushl  0x103364
  100a4e:	53                   	push   %ebx
  100a4f:	68 38 1a 10 00       	push   $0x101a38
  100a54:	6a 61                	push   $0x61
  100a56:	68 66 19 10 00       	push   $0x101966
  100a5b:	68 94 19 10 00       	push   $0x101994
  100a60:	e8 e3 0b 00 00       	call   101648 <printk>
  100a65:	83 c4 14             	add    $0x14,%esp
  100a68:	68 b7 18 10 00       	push   $0x1018b7
  100a6d:	e8 d6 0b 00 00       	call   101648 <printk>
  100a72:	83 c4 10             	add    $0x10,%esp
  100a75:	89 d8                	mov    %ebx,%eax
  100a77:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100a7a:	c9                   	leave  
  100a7b:	c3                   	ret    
  100a7c:	c7 05 64 33 10 00 ff 	movl   $0xffffffff,0x103364
  100a83:	ff ff ff 
  100a86:	eb b1                	jmp    100a39 <get_from_runnable+0x69>
  100a88:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100a8d:	eb e8                	jmp    100a77 <get_from_runnable+0xa7>
  100a8f:	90                   	nop

00100a90 <put_into_runnable>:
  100a90:	55                   	push   %ebp
  100a91:	89 e5                	mov    %esp,%ebp
  100a93:	56                   	push   %esi
  100a94:	53                   	push   %ebx
  100a95:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100a98:	8b 15 64 33 10 00    	mov    0x103364,%edx
  100a9e:	83 fa ff             	cmp    $0xffffffff,%edx
  100aa1:	0f 84 ed 00 00 00    	je     100b94 <put_into_runnable+0x104>
  100aa7:	89 d0                	mov    %edx,%eax
  100aa9:	c1 e0 07             	shl    $0x7,%eax
  100aac:	01 d0                	add    %edx,%eax
  100aae:	01 c0                	add    %eax,%eax
  100ab0:	01 d0                	add    %edx,%eax
  100ab2:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100ab5:	8d 34 c5 20 3d 10 00 	lea    0x103d20(,%eax,8),%esi
  100abc:	8b 8e 5c 20 00 00    	mov    0x205c(%esi),%ecx
  100ac2:	89 c8                	mov    %ecx,%eax
  100ac4:	c1 e0 07             	shl    $0x7,%eax
  100ac7:	01 c8                	add    %ecx,%eax
  100ac9:	01 c0                	add    %eax,%eax
  100acb:	01 c8                	add    %ecx,%eax
  100acd:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100ad0:	89 1c c5 80 5d 10 00 	mov    %ebx,0x105d80(,%eax,8)
  100ad7:	89 d8                	mov    %ebx,%eax
  100ad9:	c1 e0 07             	shl    $0x7,%eax
  100adc:	01 d8                	add    %ebx,%eax
  100ade:	01 c0                	add    %eax,%eax
  100ae0:	01 d8                	add    %ebx,%eax
  100ae2:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100ae5:	8d 04 c5 20 3d 10 00 	lea    0x103d20(,%eax,8),%eax
  100aec:	89 88 5c 20 00 00    	mov    %ecx,0x205c(%eax)
  100af2:	89 90 60 20 00 00    	mov    %edx,0x2060(%eax)
  100af8:	89 9e 5c 20 00 00    	mov    %ebx,0x205c(%esi)
  100afe:	89 d8                	mov    %ebx,%eax
  100b00:	c1 e0 07             	shl    $0x7,%eax
  100b03:	01 d8                	add    %ebx,%eax
  100b05:	01 c0                	add    %eax,%eax
  100b07:	01 d8                	add    %ebx,%eax
  100b09:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b0c:	c7 04 c5 6c 5d 10 00 	movl   $0x1,0x105d6c(,%eax,8)
  100b13:	01 00 00 00 
  100b17:	85 db                	test   %ebx,%ebx
  100b19:	75 0a                	jne    100b25 <put_into_runnable+0x95>
  100b1b:	c7 05 58 5d 10 00 bc 	movl   $0x1008bc,0x105d58
  100b22:	08 10 00 
  100b25:	83 ec 0c             	sub    $0xc,%esp
  100b28:	68 88 18 10 00       	push   $0x101888
  100b2d:	e8 16 0b 00 00       	call   101648 <printk>
  100b32:	58                   	pop    %eax
  100b33:	5a                   	pop    %edx
  100b34:	53                   	push   %ebx
  100b35:	ff 35 64 33 10 00    	pushl  0x103364
  100b3b:	68 24 1a 10 00       	push   $0x101a24
  100b40:	6a 7d                	push   $0x7d
  100b42:	68 66 19 10 00       	push   $0x101966
  100b47:	68 c8 19 10 00       	push   $0x1019c8
  100b4c:	e8 f7 0a 00 00       	call   101648 <printk>
  100b51:	83 c4 14             	add    $0x14,%esp
  100b54:	68 b7 18 10 00       	push   $0x1018b7
  100b59:	e8 ea 0a 00 00       	call   101648 <printk>
  100b5e:	89 d8                	mov    %ebx,%eax
  100b60:	c1 e0 07             	shl    $0x7,%eax
  100b63:	01 d8                	add    %ebx,%eax
  100b65:	01 c0                	add    %eax,%eax
  100b67:	01 d8                	add    %ebx,%eax
  100b69:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b6c:	8d 04 c5 20 3d 10 00 	lea    0x103d20(,%eax,8),%eax
  100b73:	8b 15 08 3d 10 00    	mov    0x103d08,%edx
  100b79:	89 90 50 20 00 00    	mov    %edx,0x2050(%eax)
  100b7f:	8b 55 0c             	mov    0xc(%ebp),%edx
  100b82:	89 90 64 20 00 00    	mov    %edx,0x2064(%eax)
  100b88:	b8 01 00 00 00       	mov    $0x1,%eax
  100b8d:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100b90:	5b                   	pop    %ebx
  100b91:	5e                   	pop    %esi
  100b92:	5d                   	pop    %ebp
  100b93:	c3                   	ret    
  100b94:	89 1d 64 33 10 00    	mov    %ebx,0x103364
  100b9a:	89 d8                	mov    %ebx,%eax
  100b9c:	c1 e0 07             	shl    $0x7,%eax
  100b9f:	01 d8                	add    %ebx,%eax
  100ba1:	01 c0                	add    %eax,%eax
  100ba3:	01 d8                	add    %ebx,%eax
  100ba5:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100ba8:	8d 04 c5 20 3d 10 00 	lea    0x103d20(,%eax,8),%eax
  100baf:	89 98 5c 20 00 00    	mov    %ebx,0x205c(%eax)
  100bb5:	89 98 60 20 00 00    	mov    %ebx,0x2060(%eax)
  100bbb:	e9 3e ff ff ff       	jmp    100afe <put_into_runnable+0x6e>

00100bc0 <put_into_block>:
  100bc0:	55                   	push   %ebp
  100bc1:	89 e5                	mov    %esp,%ebp
  100bc3:	57                   	push   %edi
  100bc4:	56                   	push   %esi
  100bc5:	53                   	push   %ebx
  100bc6:	8b 45 08             	mov    0x8(%ebp),%eax
  100bc9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100bcc:	8b 0d 60 33 10 00    	mov    0x103360,%ecx
  100bd2:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100bd5:	0f 84 99 00 00 00    	je     100c74 <put_into_block+0xb4>
  100bdb:	89 ca                	mov    %ecx,%edx
  100bdd:	c1 e2 07             	shl    $0x7,%edx
  100be0:	01 ca                	add    %ecx,%edx
  100be2:	01 d2                	add    %edx,%edx
  100be4:	01 ca                	add    %ecx,%edx
  100be6:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100be9:	8d 3c d5 20 3d 10 00 	lea    0x103d20(,%edx,8),%edi
  100bf0:	8b b7 5c 20 00 00    	mov    0x205c(%edi),%esi
  100bf6:	89 f2                	mov    %esi,%edx
  100bf8:	c1 e2 07             	shl    $0x7,%edx
  100bfb:	01 f2                	add    %esi,%edx
  100bfd:	01 d2                	add    %edx,%edx
  100bff:	01 f2                	add    %esi,%edx
  100c01:	8d 14 96             	lea    (%esi,%edx,4),%edx
  100c04:	89 04 d5 80 5d 10 00 	mov    %eax,0x105d80(,%edx,8)
  100c0b:	89 c2                	mov    %eax,%edx
  100c0d:	c1 e2 07             	shl    $0x7,%edx
  100c10:	01 c2                	add    %eax,%edx
  100c12:	01 d2                	add    %edx,%edx
  100c14:	01 c2                	add    %eax,%edx
  100c16:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c19:	8d 14 d5 20 3d 10 00 	lea    0x103d20(,%edx,8),%edx
  100c20:	89 b2 5c 20 00 00    	mov    %esi,0x205c(%edx)
  100c26:	89 8a 60 20 00 00    	mov    %ecx,0x2060(%edx)
  100c2c:	89 87 5c 20 00 00    	mov    %eax,0x205c(%edi)
  100c32:	89 c2                	mov    %eax,%edx
  100c34:	c1 e2 07             	shl    $0x7,%edx
  100c37:	01 c2                	add    %eax,%edx
  100c39:	01 d2                	add    %edx,%edx
  100c3b:	01 c2                	add    %eax,%edx
  100c3d:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c40:	c1 e2 03             	shl    $0x3,%edx
  100c43:	8d 82 20 5d 10 00    	lea    0x105d20(%edx),%eax
  100c49:	b9 13 00 00 00       	mov    $0x13,%ecx
  100c4e:	89 c7                	mov    %eax,%edi
  100c50:	89 de                	mov    %ebx,%esi
  100c52:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100c54:	8b 43 20             	mov    0x20(%ebx),%eax
  100c57:	89 82 74 5d 10 00    	mov    %eax,0x105d74(%edx)
  100c5d:	c7 82 6c 5d 10 00 00 	movl   $0x0,0x105d6c(%edx)
  100c64:	00 00 00 
  100c67:	b8 01 00 00 00       	mov    $0x1,%eax
  100c6c:	5b                   	pop    %ebx
  100c6d:	5e                   	pop    %esi
  100c6e:	5f                   	pop    %edi
  100c6f:	5d                   	pop    %ebp
  100c70:	c3                   	ret    
  100c71:	8d 76 00             	lea    0x0(%esi),%esi
  100c74:	a3 60 33 10 00       	mov    %eax,0x103360
  100c79:	89 c2                	mov    %eax,%edx
  100c7b:	c1 e2 07             	shl    $0x7,%edx
  100c7e:	01 c2                	add    %eax,%edx
  100c80:	01 d2                	add    %edx,%edx
  100c82:	01 c2                	add    %eax,%edx
  100c84:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c87:	8d 14 d5 20 3d 10 00 	lea    0x103d20(,%edx,8),%edx
  100c8e:	89 82 60 20 00 00    	mov    %eax,0x2060(%edx)
  100c94:	89 82 5c 20 00 00    	mov    %eax,0x205c(%edx)
  100c9a:	eb 96                	jmp    100c32 <put_into_block+0x72>

00100c9c <get_from>:
  100c9c:	55                   	push   %ebp
  100c9d:	89 e5                	mov    %esp,%ebp
  100c9f:	56                   	push   %esi
  100ca0:	53                   	push   %ebx
  100ca1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100ca4:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ca7:	85 db                	test   %ebx,%ebx
  100ca9:	0f 8e 01 01 00 00    	jle    100db0 <get_from+0x114>
  100caf:	39 c3                	cmp    %eax,%ebx
  100cb1:	74 42                	je     100cf5 <get_from+0x59>
  100cb3:	89 da                	mov    %ebx,%edx
  100cb5:	c1 e2 07             	shl    $0x7,%edx
  100cb8:	01 da                	add    %ebx,%edx
  100cba:	01 d2                	add    %edx,%edx
  100cbc:	01 da                	add    %ebx,%edx
  100cbe:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100cc1:	8b 0c d5 80 5d 10 00 	mov    0x105d80(,%edx,8),%ecx
  100cc8:	39 cb                	cmp    %ecx,%ebx
  100cca:	75 25                	jne    100cf1 <get_from+0x55>
  100ccc:	e9 df 00 00 00       	jmp    100db0 <get_from+0x114>
  100cd1:	8d 76 00             	lea    0x0(%esi),%esi
  100cd4:	89 ca                	mov    %ecx,%edx
  100cd6:	c1 e2 07             	shl    $0x7,%edx
  100cd9:	01 ca                	add    %ecx,%edx
  100cdb:	01 d2                	add    %edx,%edx
  100cdd:	01 ca                	add    %ecx,%edx
  100cdf:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100ce2:	8b 0c d5 80 5d 10 00 	mov    0x105d80(,%edx,8),%ecx
  100ce9:	39 cb                	cmp    %ecx,%ebx
  100ceb:	0f 84 bf 00 00 00    	je     100db0 <get_from+0x114>
  100cf1:	39 c1                	cmp    %eax,%ecx
  100cf3:	75 df                	jne    100cd4 <get_from+0x38>
  100cf5:	89 c2                	mov    %eax,%edx
  100cf7:	c1 e2 07             	shl    $0x7,%edx
  100cfa:	01 c2                	add    %eax,%edx
  100cfc:	01 d2                	add    %edx,%edx
  100cfe:	01 c2                	add    %eax,%edx
  100d00:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100d03:	8b 04 c5 6c 5d 10 00 	mov    0x105d6c(,%eax,8),%eax
  100d0a:	85 c0                	test   %eax,%eax
  100d0c:	0f 84 c2 00 00 00    	je     100dd4 <get_from+0x138>
  100d12:	48                   	dec    %eax
  100d13:	75 7f                	jne    100d94 <get_from+0xf8>
  100d15:	be 64 33 10 00       	mov    $0x103364,%esi
  100d1a:	3b 1e                	cmp    (%esi),%ebx
  100d1c:	74 15                	je     100d33 <get_from+0x97>
  100d1e:	83 ec 08             	sub    $0x8,%esp
  100d21:	68 bf 00 00 00       	push   $0xbf
  100d26:	68 66 19 10 00       	push   $0x101966
  100d2b:	e8 8c 0a 00 00       	call   1017bc <abort>
  100d30:	83 c4 10             	add    $0x10,%esp
  100d33:	89 d8                	mov    %ebx,%eax
  100d35:	c1 e0 07             	shl    $0x7,%eax
  100d38:	01 d8                	add    %ebx,%eax
  100d3a:	01 c0                	add    %eax,%eax
  100d3c:	01 d8                	add    %ebx,%eax
  100d3e:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100d41:	8d 04 c5 20 3d 10 00 	lea    0x103d20(,%eax,8),%eax
  100d48:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100d4e:	39 da                	cmp    %ebx,%edx
  100d50:	0f 84 8a 00 00 00    	je     100de0 <get_from+0x144>
  100d56:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100d5c:	89 c8                	mov    %ecx,%eax
  100d5e:	c1 e0 07             	shl    $0x7,%eax
  100d61:	01 c8                	add    %ecx,%eax
  100d63:	01 c0                	add    %eax,%eax
  100d65:	01 c8                	add    %ecx,%eax
  100d67:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100d6a:	89 14 c5 80 5d 10 00 	mov    %edx,0x105d80(,%eax,8)
  100d71:	89 d0                	mov    %edx,%eax
  100d73:	c1 e0 07             	shl    $0x7,%eax
  100d76:	01 d0                	add    %edx,%eax
  100d78:	01 c0                	add    %eax,%eax
  100d7a:	01 d0                	add    %edx,%eax
  100d7c:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100d7f:	89 0c c5 7c 5d 10 00 	mov    %ecx,0x105d7c(,%eax,8)
  100d86:	89 16                	mov    %edx,(%esi)
  100d88:	89 d8                	mov    %ebx,%eax
  100d8a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d8d:	5b                   	pop    %ebx
  100d8e:	5e                   	pop    %esi
  100d8f:	5d                   	pop    %ebp
  100d90:	c3                   	ret    
  100d91:	8d 76 00             	lea    0x0(%esi),%esi
  100d94:	83 ec 08             	sub    $0x8,%esp
  100d97:	68 bb 00 00 00       	push   $0xbb
  100d9c:	68 66 19 10 00       	push   $0x101966
  100da1:	e8 16 0a 00 00       	call   1017bc <abort>
  100da6:	a1 00 00 00 00       	mov    0x0,%eax
  100dab:	0f 0b                	ud2    
  100dad:	8d 76 00             	lea    0x0(%esi),%esi
  100db0:	83 ec 08             	sub    $0x8,%esp
  100db3:	68 ac 00 00 00       	push   $0xac
  100db8:	68 66 19 10 00       	push   $0x101966
  100dbd:	e8 fa 09 00 00       	call   1017bc <abort>
  100dc2:	83 c4 10             	add    $0x10,%esp
  100dc5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100dca:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100dcd:	5b                   	pop    %ebx
  100dce:	5e                   	pop    %esi
  100dcf:	5d                   	pop    %ebp
  100dd0:	c3                   	ret    
  100dd1:	8d 76 00             	lea    0x0(%esi),%esi
  100dd4:	be 60 33 10 00       	mov    $0x103360,%esi
  100dd9:	e9 3c ff ff ff       	jmp    100d1a <get_from+0x7e>
  100dde:	66 90                	xchg   %ax,%ax
  100de0:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100de6:	89 d8                	mov    %ebx,%eax
  100de8:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100deb:	5b                   	pop    %ebx
  100dec:	5e                   	pop    %esi
  100ded:	5d                   	pop    %ebp
  100dee:	c3                   	ret    
  100def:	90                   	nop

00100df0 <get_from_block>:
  100df0:	55                   	push   %ebp
  100df1:	89 e5                	mov    %esp,%ebp
  100df3:	83 ec 10             	sub    $0x10,%esp
  100df6:	ff 75 08             	pushl  0x8(%ebp)
  100df9:	ff 35 60 33 10 00    	pushl  0x103360
  100dff:	e8 98 fe ff ff       	call   100c9c <get_from>
  100e04:	83 c4 10             	add    $0x10,%esp
  100e07:	40                   	inc    %eax
  100e08:	74 0a                	je     100e14 <get_from_block+0x24>
  100e0a:	b8 01 00 00 00       	mov    $0x1,%eax
  100e0f:	c9                   	leave  
  100e10:	c3                   	ret    
  100e11:	8d 76 00             	lea    0x0(%esi),%esi
  100e14:	83 ec 08             	sub    $0x8,%esp
  100e17:	68 f6 00 00 00       	push   $0xf6
  100e1c:	68 66 19 10 00       	push   $0x101966
  100e21:	e8 96 09 00 00       	call   1017bc <abort>
  100e26:	83 c4 10             	add    $0x10,%esp
  100e29:	b8 01 00 00 00       	mov    $0x1,%eax
  100e2e:	c9                   	leave  
  100e2f:	c3                   	ret    

00100e30 <check_block>:
  100e30:	55                   	push   %ebp
  100e31:	89 e5                	mov    %esp,%ebp
  100e33:	57                   	push   %edi
  100e34:	56                   	push   %esi
  100e35:	53                   	push   %ebx
  100e36:	83 ec 0c             	sub    $0xc,%esp
  100e39:	a1 60 33 10 00       	mov    0x103360,%eax
  100e3e:	89 c6                	mov    %eax,%esi
  100e40:	83 f8 ff             	cmp    $0xffffffff,%eax
  100e43:	74 58                	je     100e9d <check_block+0x6d>
  100e45:	89 c2                	mov    %eax,%edx
  100e47:	c1 e2 07             	shl    $0x7,%edx
  100e4a:	01 c2                	add    %eax,%edx
  100e4c:	01 d2                	add    %edx,%edx
  100e4e:	01 c2                	add    %eax,%edx
  100e50:	8d 3c 90             	lea    (%eax,%edx,4),%edi
  100e53:	eb 0c                	jmp    100e61 <check_block+0x31>
  100e55:	8d 76 00             	lea    0x0(%esi),%esi
  100e58:	39 c6                	cmp    %eax,%esi
  100e5a:	74 3c                	je     100e98 <check_block+0x68>
  100e5c:	83 f8 ff             	cmp    $0xffffffff,%eax
  100e5f:	74 37                	je     100e98 <check_block+0x68>
  100e61:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
  100e68:	8b 8b 74 5d 10 00    	mov    0x105d74(%ebx),%ecx
  100e6e:	85 c9                	test   %ecx,%ecx
  100e70:	7f e6                	jg     100e58 <check_block+0x28>
  100e72:	83 ec 0c             	sub    $0xc,%esp
  100e75:	56                   	push   %esi
  100e76:	e8 75 ff ff ff       	call   100df0 <get_from_block>
  100e7b:	58                   	pop    %eax
  100e7c:	5a                   	pop    %edx
  100e7d:	81 c3 20 5d 10 00    	add    $0x105d20,%ebx
  100e83:	53                   	push   %ebx
  100e84:	56                   	push   %esi
  100e85:	e8 06 fc ff ff       	call   100a90 <put_into_runnable>
  100e8a:	83 c4 10             	add    $0x10,%esp
  100e8d:	a1 60 33 10 00       	mov    0x103360,%eax
  100e92:	39 c6                	cmp    %eax,%esi
  100e94:	75 c6                	jne    100e5c <check_block+0x2c>
  100e96:	66 90                	xchg   %ax,%ax
  100e98:	be 01 00 00 00       	mov    $0x1,%esi
  100e9d:	89 f0                	mov    %esi,%eax
  100e9f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100ea2:	5b                   	pop    %ebx
  100ea3:	5e                   	pop    %esi
  100ea4:	5f                   	pop    %edi
  100ea5:	5d                   	pop    %ebp
  100ea6:	c3                   	ret    
  100ea7:	90                   	nop

00100ea8 <checkTimeCount>:
  100ea8:	a1 04 3d 10 00       	mov    0x103d04,%eax
  100ead:	85 c0                	test   %eax,%eax
  100eaf:	0f 84 cb 00 00 00    	je     100f80 <checkTimeCount+0xd8>
  100eb5:	55                   	push   %ebp
  100eb6:	89 e5                	mov    %esp,%ebp
  100eb8:	57                   	push   %edi
  100eb9:	56                   	push   %esi
  100eba:	83 ec 0c             	sub    $0xc,%esp
  100ebd:	68 88 18 10 00       	push   $0x101888
  100ec2:	e8 81 07 00 00       	call   101648 <printk>
  100ec7:	8b 15 00 3d 10 00    	mov    0x103d00,%edx
  100ecd:	58                   	pop    %eax
  100ece:	59                   	pop    %ecx
  100ecf:	89 d0                	mov    %edx,%eax
  100ed1:	c1 e0 07             	shl    $0x7,%eax
  100ed4:	01 d0                	add    %edx,%eax
  100ed6:	01 c0                	add    %eax,%eax
  100ed8:	01 d0                	add    %edx,%eax
  100eda:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100edd:	ff 34 c5 70 5d 10 00 	pushl  0x105d70(,%eax,8)
  100ee4:	52                   	push   %edx
  100ee5:	68 4c 1a 10 00       	push   $0x101a4c
  100eea:	6a 1f                	push   $0x1f
  100eec:	68 66 19 10 00       	push   $0x101966
  100ef1:	68 f8 19 10 00       	push   $0x1019f8
  100ef6:	e8 4d 07 00 00       	call   101648 <printk>
  100efb:	83 c4 14             	add    $0x14,%esp
  100efe:	68 b7 18 10 00       	push   $0x1018b7
  100f03:	e8 40 07 00 00       	call   101648 <printk>
  100f08:	e8 23 ff ff ff       	call   100e30 <check_block>
  100f0d:	8b 15 00 3d 10 00    	mov    0x103d00,%edx
  100f13:	89 d0                	mov    %edx,%eax
  100f15:	c1 e0 07             	shl    $0x7,%eax
  100f18:	01 d0                	add    %edx,%eax
  100f1a:	01 c0                	add    %eax,%eax
  100f1c:	01 d0                	add    %edx,%eax
  100f1e:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100f21:	c1 e0 03             	shl    $0x3,%eax
  100f24:	83 c4 10             	add    $0x10,%esp
  100f27:	8b b0 70 5d 10 00    	mov    0x105d70(%eax),%esi
  100f2d:	85 f6                	test   %esi,%esi
  100f2f:	7e 0f                	jle    100f40 <checkTimeCount+0x98>
  100f31:	b8 01 00 00 00       	mov    $0x1,%eax
  100f36:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100f39:	5e                   	pop    %esi
  100f3a:	5f                   	pop    %edi
  100f3b:	5d                   	pop    %ebp
  100f3c:	c3                   	ret    
  100f3d:	8d 76 00             	lea    0x0(%esi),%esi
  100f40:	05 20 5d 10 00       	add    $0x105d20,%eax
  100f45:	b9 13 00 00 00       	mov    $0x13,%ecx
  100f4a:	89 c7                	mov    %eax,%edi
  100f4c:	8b 75 08             	mov    0x8(%ebp),%esi
  100f4f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100f51:	83 ec 08             	sub    $0x8,%esp
  100f54:	ff 75 08             	pushl  0x8(%ebp)
  100f57:	52                   	push   %edx
  100f58:	e8 33 fb ff ff       	call   100a90 <put_into_runnable>
  100f5d:	e8 6e fa ff ff       	call   1009d0 <get_from_runnable>
  100f62:	83 c4 10             	add    $0x10,%esp
  100f65:	3b 05 00 3d 10 00    	cmp    0x103d00,%eax
  100f6b:	74 c4                	je     100f31 <checkTimeCount+0x89>
  100f6d:	e8 52 f9 ff ff       	call   1008c4 <put_into_running.part.0>
  100f72:	b8 01 00 00 00       	mov    $0x1,%eax
  100f77:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100f7a:	5e                   	pop    %esi
  100f7b:	5f                   	pop    %edi
  100f7c:	5d                   	pop    %ebp
  100f7d:	c3                   	ret    
  100f7e:	66 90                	xchg   %ax,%ax
  100f80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100f85:	c3                   	ret    
  100f86:	66 90                	xchg   %ax,%ax

00100f88 <check_is_in>:
  100f88:	55                   	push   %ebp
  100f89:	89 e5                	mov    %esp,%ebp
  100f8b:	53                   	push   %ebx
  100f8c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100f8f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100f92:	85 c9                	test   %ecx,%ecx
  100f94:	7e 4a                	jle    100fe0 <check_is_in+0x58>
  100f96:	39 d9                	cmp    %ebx,%ecx
  100f98:	74 3b                	je     100fd5 <check_is_in+0x4d>
  100f9a:	89 c8                	mov    %ecx,%eax
  100f9c:	c1 e0 07             	shl    $0x7,%eax
  100f9f:	01 c8                	add    %ecx,%eax
  100fa1:	01 c0                	add    %eax,%eax
  100fa3:	01 c8                	add    %ecx,%eax
  100fa5:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100fa8:	8b 14 c5 80 5d 10 00 	mov    0x105d80(,%eax,8),%edx
  100faf:	39 d1                	cmp    %edx,%ecx
  100fb1:	75 1e                	jne    100fd1 <check_is_in+0x49>
  100fb3:	eb 2b                	jmp    100fe0 <check_is_in+0x58>
  100fb5:	8d 76 00             	lea    0x0(%esi),%esi
  100fb8:	89 d0                	mov    %edx,%eax
  100fba:	c1 e0 07             	shl    $0x7,%eax
  100fbd:	01 d0                	add    %edx,%eax
  100fbf:	01 c0                	add    %eax,%eax
  100fc1:	01 d0                	add    %edx,%eax
  100fc3:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100fc6:	8b 14 c5 80 5d 10 00 	mov    0x105d80(,%eax,8),%edx
  100fcd:	39 d1                	cmp    %edx,%ecx
  100fcf:	74 0f                	je     100fe0 <check_is_in+0x58>
  100fd1:	39 d3                	cmp    %edx,%ebx
  100fd3:	75 e3                	jne    100fb8 <check_is_in+0x30>
  100fd5:	b8 01 00 00 00       	mov    $0x1,%eax
  100fda:	5b                   	pop    %ebx
  100fdb:	5d                   	pop    %ebp
  100fdc:	c3                   	ret    
  100fdd:	8d 76 00             	lea    0x0(%esi),%esi
  100fe0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100fe5:	5b                   	pop    %ebx
  100fe6:	5d                   	pop    %ebp
  100fe7:	c3                   	ret    

00100fe8 <block_decrease>:
  100fe8:	55                   	push   %ebp
  100fe9:	89 e5                	mov    %esp,%ebp
  100feb:	8b 0d 60 33 10 00    	mov    0x103360,%ecx
  100ff1:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100ff4:	74 2e                	je     101024 <block_decrease+0x3c>
  100ff6:	89 ca                	mov    %ecx,%edx
  100ff8:	89 d0                	mov    %edx,%eax
  100ffa:	c1 e0 07             	shl    $0x7,%eax
  100ffd:	01 d0                	add    %edx,%eax
  100fff:	01 c0                	add    %eax,%eax
  101001:	01 d0                	add    %edx,%eax
  101003:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101006:	8d 04 c5 20 3d 10 00 	lea    0x103d20(,%eax,8),%eax
  10100d:	ff 88 54 20 00 00    	decl   0x2054(%eax)
  101013:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  101019:	39 d1                	cmp    %edx,%ecx
  10101b:	75 db                	jne    100ff8 <block_decrease+0x10>
  10101d:	b8 01 00 00 00       	mov    $0x1,%eax
  101022:	5d                   	pop    %ebp
  101023:	c3                   	ret    
  101024:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101029:	5d                   	pop    %ebp
  10102a:	c3                   	ret    
  10102b:	90                   	nop

0010102c <init_pcb>:
  10102c:	55                   	push   %ebp
  10102d:	89 e5                	mov    %esp,%ebp
  10102f:	c7 05 08 3d 10 00 05 	movl   $0x5,0x103d08
  101036:	00 00 00 
  101039:	ba 78 5d 10 00       	mov    $0x105d78,%edx
  10103e:	31 c0                	xor    %eax,%eax
  101040:	89 02                	mov    %eax,(%edx)
  101042:	8d 48 ff             	lea    -0x1(%eax),%ecx
  101045:	89 4a 04             	mov    %ecx,0x4(%edx)
  101048:	40                   	inc    %eax
  101049:	89 42 08             	mov    %eax,0x8(%edx)
  10104c:	81 c2 68 20 00 00    	add    $0x2068,%edx
  101052:	3d 00 08 00 00       	cmp    $0x800,%eax
  101057:	75 e7                	jne    101040 <init_pcb+0x14>
  101059:	c7 05 7c 5d 10 00 ff 	movl   $0x7ff,0x105d7c
  101060:	07 00 00 
  101063:	c7 05 18 7d 13 01 00 	movl   $0x0,0x1137d18
  10106a:	00 00 00 
  10106d:	5d                   	pop    %ebp
  10106e:	c3                   	ret    
  10106f:	90                   	nop

00101070 <init_kernel_pcb>:
  101070:	55                   	push   %ebp
  101071:	89 e5                	mov    %esp,%ebp
  101073:	c7 05 68 5d 10 00 10 	movl   $0x10,0x105d68
  10107a:	00 00 00 
  10107d:	c7 05 5c 5d 10 00 08 	movl   $0x8,0x105d5c
  101084:	00 00 00 
  101087:	c7 05 2c 5d 10 00 10 	movl   $0x10,0x105d2c
  10108e:	00 00 00 
  101091:	c7 05 28 5d 10 00 10 	movl   $0x10,0x105d28
  101098:	00 00 00 
  10109b:	c7 05 58 5d 10 00 bc 	movl   $0x1008bc,0x105d58
  1010a2:	08 10 00 
  1010a5:	c7 05 64 5d 10 00 00 	movl   $0x400000,0x105d64
  1010ac:	00 40 00 
  1010af:	c7 05 6c 5d 10 00 01 	movl   $0x1,0x105d6c
  1010b6:	00 00 00 
  1010b9:	c7 05 70 5d 10 00 04 	movl   $0x4,0x105d70
  1010c0:	00 00 00 
  1010c3:	b8 01 00 00 00       	mov    $0x1,%eax
  1010c8:	5d                   	pop    %ebp
  1010c9:	c3                   	ret    
  1010ca:	66 90                	xchg   %ax,%ax

001010cc <transfer_pid_state>:
  1010cc:	55                   	push   %ebp
  1010cd:	89 e5                	mov    %esp,%ebp
  1010cf:	b8 01 00 00 00       	mov    $0x1,%eax
  1010d4:	5d                   	pop    %ebp
  1010d5:	c3                   	ret    
  1010d6:	66 90                	xchg   %ax,%ax

001010d8 <make_pcb>:
  1010d8:	55                   	push   %ebp
  1010d9:	89 e5                	mov    %esp,%ebp
  1010db:	57                   	push   %edi
  1010dc:	56                   	push   %esi
  1010dd:	8b 55 08             	mov    0x8(%ebp),%edx
  1010e0:	89 d0                	mov    %edx,%eax
  1010e2:	c1 e0 07             	shl    $0x7,%eax
  1010e5:	01 d0                	add    %edx,%eax
  1010e7:	01 c0                	add    %eax,%eax
  1010e9:	01 d0                	add    %edx,%eax
  1010eb:	8d 14 82             	lea    (%edx,%eax,4),%edx
  1010ee:	c1 e2 03             	shl    $0x3,%edx
  1010f1:	8d 82 20 5d 10 00    	lea    0x105d20(%edx),%eax
  1010f7:	b9 13 00 00 00       	mov    $0x13,%ecx
  1010fc:	89 c7                	mov    %eax,%edi
  1010fe:	8b 75 0c             	mov    0xc(%ebp),%esi
  101101:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101103:	8b 45 10             	mov    0x10(%ebp),%eax
  101106:	89 82 6c 5d 10 00    	mov    %eax,0x105d6c(%edx)
  10110c:	8b 45 14             	mov    0x14(%ebp),%eax
  10110f:	89 82 70 5d 10 00    	mov    %eax,0x105d70(%edx)
  101115:	8b 45 18             	mov    0x18(%ebp),%eax
  101118:	89 82 74 5d 10 00    	mov    %eax,0x105d74(%edx)
  10111e:	8b 45 0c             	mov    0xc(%ebp),%eax
  101121:	89 82 84 5d 10 00    	mov    %eax,0x105d84(%edx)
  101127:	b8 01 00 00 00       	mov    $0x1,%eax
  10112c:	5e                   	pop    %esi
  10112d:	5f                   	pop    %edi
  10112e:	5d                   	pop    %ebp
  10112f:	c3                   	ret    

00101130 <initIdt>:
  101130:	55                   	push   %ebp
  101131:	89 e5                	mov    %esp,%ebp
  101133:	53                   	push   %ebx
  101134:	ba 53 18 10 00       	mov    $0x101853,%edx
  101139:	89 d3                	mov    %edx,%ebx
  10113b:	c1 ea 10             	shr    $0x10,%edx
  10113e:	b9 00 86 13 01       	mov    $0x1138600,%ecx
  101143:	b8 00 7e 13 01       	mov    $0x1137e00,%eax
  101148:	66 89 18             	mov    %bx,(%eax)
  10114b:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  101151:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  101155:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  101159:	66 89 50 06          	mov    %dx,0x6(%eax)
  10115d:	83 c0 08             	add    $0x8,%eax
  101160:	39 c1                	cmp    %eax,%ecx
  101162:	75 e4                	jne    101148 <initIdt+0x18>
  101164:	b8 59 18 10 00       	mov    $0x101859,%eax
  101169:	66 a3 68 7e 13 01    	mov    %ax,0x1137e68
  10116f:	66 c7 05 6a 7e 13 01 	movw   $0x8,0x1137e6a
  101176:	08 00 
  101178:	c6 05 6c 7e 13 01 00 	movb   $0x0,0x1137e6c
  10117f:	c6 05 6d 7e 13 01 8f 	movb   $0x8f,0x1137e6d
  101186:	c1 e8 10             	shr    $0x10,%eax
  101189:	66 a3 6e 7e 13 01    	mov    %ax,0x1137e6e
  10118f:	b8 5d 18 10 00       	mov    $0x10185d,%eax
  101194:	66 a3 00 82 13 01    	mov    %ax,0x1138200
  10119a:	66 c7 05 02 82 13 01 	movw   $0x8,0x1138202
  1011a1:	08 00 
  1011a3:	c6 05 04 82 13 01 00 	movb   $0x0,0x1138204
  1011aa:	c6 05 05 82 13 01 ee 	movb   $0xee,0x1138205
  1011b1:	c1 e8 10             	shr    $0x10,%eax
  1011b4:	66 a3 06 82 13 01    	mov    %ax,0x1138206
  1011ba:	b8 66 18 10 00       	mov    $0x101866,%eax
  1011bf:	66 a3 00 7f 13 01    	mov    %ax,0x1137f00
  1011c5:	66 c7 05 02 7f 13 01 	movw   $0x8,0x1137f02
  1011cc:	08 00 
  1011ce:	c6 05 04 7f 13 01 00 	movb   $0x0,0x1137f04
  1011d5:	c6 05 05 7f 13 01 8e 	movb   $0x8e,0x1137f05
  1011dc:	c1 e8 10             	shr    $0x10,%eax
  1011df:	66 a3 06 7f 13 01    	mov    %ax,0x1137f06
  1011e5:	66 c7 05 90 34 10 00 	movw   $0x7ff,0x103490
  1011ec:	ff 07 
  1011ee:	b8 00 7e 13 01       	mov    $0x1137e00,%eax
  1011f3:	66 a3 92 34 10 00    	mov    %ax,0x103492
  1011f9:	c1 e8 10             	shr    $0x10,%eax
  1011fc:	66 a3 94 34 10 00    	mov    %ax,0x103494
  101202:	b8 90 34 10 00       	mov    $0x103490,%eax
  101207:	0f 01 18             	lidtl  (%eax)
  10120a:	5b                   	pop    %ebx
  10120b:	5d                   	pop    %ebp
  10120c:	c3                   	ret    
  10120d:	66 90                	xchg   %ax,%ax
  10120f:	90                   	nop

00101210 <syscallHandle>:
  101210:	55                   	push   %ebp
  101211:	89 e5                	mov    %esp,%ebp
  101213:	53                   	push   %ebx
  101214:	50                   	push   %eax
  101215:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101218:	8b 43 2c             	mov    0x2c(%ebx),%eax
  10121b:	83 f8 04             	cmp    $0x4,%eax
  10121e:	74 58                	je     101278 <syscallHandle+0x68>
  101220:	77 1e                	ja     101240 <syscallHandle+0x30>
  101222:	83 f8 01             	cmp    $0x1,%eax
  101225:	74 45                	je     10126c <syscallHandle+0x5c>
  101227:	83 f8 02             	cmp    $0x2,%eax
  10122a:	75 0f                	jne    10123b <syscallHandle+0x2b>
  10122c:	83 ec 0c             	sub    $0xc,%esp
  10122f:	53                   	push   %ebx
  101230:	e8 27 f4 ff ff       	call   10065c <sys_fork>
  101235:	89 43 2c             	mov    %eax,0x2c(%ebx)
  101238:	83 c4 10             	add    $0x10,%esp
  10123b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10123e:	c9                   	leave  
  10123f:	c3                   	ret    
  101240:	83 f8 07             	cmp    $0x7,%eax
  101243:	74 13                	je     101258 <syscallHandle+0x48>
  101245:	3d e6 00 00 00       	cmp    $0xe6,%eax
  10124a:	75 ef                	jne    10123b <syscallHandle+0x2b>
  10124c:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10124f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101252:	c9                   	leave  
  101253:	e9 80 f3 ff ff       	jmp    1005d8 <sys_sleep>
  101258:	83 ec 0c             	sub    $0xc,%esp
  10125b:	53                   	push   %ebx
  10125c:	e8 6b f3 ff ff       	call   1005cc <sys_getpid>
  101261:	89 43 2c             	mov    %eax,0x2c(%ebx)
  101264:	83 c4 10             	add    $0x10,%esp
  101267:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10126a:	c9                   	leave  
  10126b:	c3                   	ret    
  10126c:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10126f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101272:	c9                   	leave  
  101273:	e9 2c f3 ff ff       	jmp    1005a4 <sys_exit>
  101278:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10127b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10127e:	c9                   	leave  
  10127f:	e9 84 f5 ff ff       	jmp    100808 <sys_write>

00101284 <GProtectFaultHandle>:
  101284:	55                   	push   %ebp
  101285:	89 e5                	mov    %esp,%ebp
  101287:	83 ec 14             	sub    $0x14,%esp
  10128a:	68 88 18 10 00       	push   $0x101888
  10128f:	e8 b4 03 00 00       	call   101648 <printk>
  101294:	58                   	pop    %eax
  101295:	8b 45 08             	mov    0x8(%ebp),%eax
  101298:	ff 70 30             	pushl  0x30(%eax)
  10129b:	68 e0 1a 10 00       	push   $0x101ae0
  1012a0:	6a 6b                	push   $0x6b
  1012a2:	68 6d 1a 10 00       	push   $0x101a6d
  1012a7:	68 80 1a 10 00       	push   $0x101a80
  1012ac:	e8 97 03 00 00       	call   101648 <printk>
  1012b1:	83 c4 14             	add    $0x14,%esp
  1012b4:	68 b7 18 10 00       	push   $0x1018b7
  1012b9:	e8 8a 03 00 00       	call   101648 <printk>
  1012be:	5a                   	pop    %edx
  1012bf:	59                   	pop    %ecx
  1012c0:	6a 6c                	push   $0x6c
  1012c2:	68 6d 1a 10 00       	push   $0x101a6d
  1012c7:	e8 f0 04 00 00       	call   1017bc <abort>
  1012cc:	83 c4 10             	add    $0x10,%esp
  1012cf:	c9                   	leave  
  1012d0:	c3                   	ret    
  1012d1:	8d 76 00             	lea    0x0(%esi),%esi

001012d4 <timeHandle>:
  1012d4:	55                   	push   %ebp
  1012d5:	89 e5                	mov    %esp,%ebp
  1012d7:	53                   	push   %ebx
  1012d8:	83 ec 10             	sub    $0x10,%esp
  1012db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1012de:	6a 41                	push   $0x41
  1012e0:	e8 bb f5 ff ff       	call   1008a0 <putChar>
  1012e5:	e8 b6 f6 ff ff       	call   1009a0 <getpid>
  1012ea:	89 c2                	mov    %eax,%edx
  1012ec:	c1 e2 07             	shl    $0x7,%edx
  1012ef:	01 c2                	add    %eax,%edx
  1012f1:	01 d2                	add    %edx,%edx
  1012f3:	01 c2                	add    %eax,%edx
  1012f5:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1012f8:	ff 0c c5 70 5d 10 00 	decl   0x105d70(,%eax,8)
  1012ff:	e8 e4 fc ff ff       	call   100fe8 <block_decrease>
  101304:	89 1c 24             	mov    %ebx,(%esp)
  101307:	e8 9c fb ff ff       	call   100ea8 <checkTimeCount>
  10130c:	83 c4 10             	add    $0x10,%esp
  10130f:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  101316:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101319:	c9                   	leave  
  10131a:	e9 81 f5 ff ff       	jmp    1008a0 <putChar>
  10131f:	90                   	nop

00101320 <irqHandle>:
  101320:	55                   	push   %ebp
  101321:	89 e5                	mov    %esp,%ebp
  101323:	57                   	push   %edi
  101324:	56                   	push   %esi
  101325:	53                   	push   %ebx
  101326:	83 ec 0c             	sub    $0xc,%esp
  101329:	8b 7d 08             	mov    0x8(%ebp),%edi
  10132c:	b8 10 00 00 00       	mov    $0x10,%eax
  101331:	89 c0                	mov    %eax,%eax
  101333:	8e d8                	mov    %eax,%ds
  101335:	8e e0                	mov    %eax,%fs
  101337:	8e c0                	mov    %eax,%es
  101339:	b8 30 00 00 00       	mov    $0x30,%eax
  10133e:	89 c0                	mov    %eax,%eax
  101340:	8e e8                	mov    %eax,%gs
  101342:	89 ee                	mov    %ebp,%esi
  101344:	3b 7e 08             	cmp    0x8(%esi),%edi
  101347:	74 12                	je     10135b <irqHandle+0x3b>
  101349:	83 ec 08             	sub    $0x8,%esp
  10134c:	6a 20                	push   $0x20
  10134e:	68 6d 1a 10 00       	push   $0x101a6d
  101353:	e8 64 04 00 00       	call   1017bc <abort>
  101358:	83 c4 10             	add    $0x10,%esp
  10135b:	8b 1d 00 3d 10 00    	mov    0x103d00,%ebx
  101361:	fa                   	cli    
  101362:	8b 47 30             	mov    0x30(%edi),%eax
  101365:	83 f8 0d             	cmp    $0xd,%eax
  101368:	0f 84 46 01 00 00    	je     1014b4 <irqHandle+0x194>
  10136e:	0f 8e e8 00 00 00    	jle    10145c <irqHandle+0x13c>
  101374:	83 f8 20             	cmp    $0x20,%eax
  101377:	74 2f                	je     1013a8 <irqHandle+0x88>
  101379:	83 c0 80             	add    $0xffffff80,%eax
  10137c:	0f 85 e1 00 00 00    	jne    101463 <irqHandle+0x143>
  101382:	83 ec 0c             	sub    $0xc,%esp
  101385:	57                   	push   %edi
  101386:	e8 85 fe ff ff       	call   101210 <syscallHandle>
  10138b:	8b 47 30             	mov    0x30(%edi),%eax
  10138e:	83 c4 10             	add    $0x10,%esp
  101391:	3d 80 00 00 00       	cmp    $0x80,%eax
  101396:	74 28                	je     1013c0 <irqHandle+0xa0>
  101398:	83 f8 20             	cmp    $0x20,%eax
  10139b:	74 23                	je     1013c0 <irqHandle+0xa0>
  10139d:	fb                   	sti    
  10139e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1013a1:	5b                   	pop    %ebx
  1013a2:	5e                   	pop    %esi
  1013a3:	5f                   	pop    %edi
  1013a4:	5d                   	pop    %ebp
  1013a5:	c3                   	ret    
  1013a6:	66 90                	xchg   %ax,%ax
  1013a8:	83 ec 0c             	sub    $0xc,%esp
  1013ab:	57                   	push   %edi
  1013ac:	e8 23 ff ff ff       	call   1012d4 <timeHandle>
  1013b1:	8b 47 30             	mov    0x30(%edi),%eax
  1013b4:	83 c4 10             	add    $0x10,%esp
  1013b7:	3d 80 00 00 00       	cmp    $0x80,%eax
  1013bc:	75 da                	jne    101398 <irqHandle+0x78>
  1013be:	66 90                	xchg   %ax,%ax
  1013c0:	8b 15 00 3d 10 00    	mov    0x103d00,%edx
  1013c6:	39 d3                	cmp    %edx,%ebx
  1013c8:	74 d3                	je     10139d <irqHandle+0x7d>
  1013ca:	89 d0                	mov    %edx,%eax
  1013cc:	c1 e0 07             	shl    $0x7,%eax
  1013cf:	01 d0                	add    %edx,%eax
  1013d1:	01 c0                	add    %eax,%eax
  1013d3:	01 d0                	add    %edx,%eax
  1013d5:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1013d8:	8d 04 c5 d0 5c 10 00 	lea    0x105cd0(,%eax,8),%eax
  1013df:	89 46 08             	mov    %eax,0x8(%esi)
  1013e2:	8b 0d 00 3d 10 00    	mov    0x103d00,%ecx
  1013e8:	89 ca                	mov    %ecx,%edx
  1013ea:	c1 e2 07             	shl    $0x7,%edx
  1013ed:	01 ca                	add    %ecx,%edx
  1013ef:	01 d2                	add    %edx,%edx
  1013f1:	01 ca                	add    %ecx,%edx
  1013f3:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  1013f6:	8d 34 d5 20 5d 10 00 	lea    0x105d20(,%edx,8),%esi
  1013fd:	b9 13 00 00 00       	mov    $0x13,%ecx
  101402:	89 c7                	mov    %eax,%edi
  101404:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101406:	83 ec 0c             	sub    $0xc,%esp
  101409:	68 88 18 10 00       	push   $0x101888
  10140e:	e8 35 02 00 00       	call   101648 <printk>
  101413:	58                   	pop    %eax
  101414:	5a                   	pop    %edx
  101415:	ff 35 00 3d 10 00    	pushl  0x103d00
  10141b:	53                   	push   %ebx
  10141c:	68 f4 1a 10 00       	push   $0x101af4
  101421:	6a 42                	push   $0x42
  101423:	68 6d 1a 10 00       	push   $0x101a6d
  101428:	68 c0 1a 10 00       	push   $0x101ac0
  10142d:	e8 16 02 00 00       	call   101648 <printk>
  101432:	83 c4 14             	add    $0x14,%esp
  101435:	68 b7 18 10 00       	push   $0x1018b7
  10143a:	e8 09 02 00 00       	call   101648 <printk>
  10143f:	59                   	pop    %ecx
  101440:	5b                   	pop    %ebx
  101441:	a1 00 3d 10 00       	mov    0x103d00,%eax
  101446:	c1 e0 10             	shl    $0x10,%eax
  101449:	50                   	push   %eax
  10144a:	6a 23                	push   $0x23
  10144c:	e8 e3 eb ff ff       	call   100034 <change_gdt>
  101451:	83 c4 10             	add    $0x10,%esp
  101454:	e9 44 ff ff ff       	jmp    10139d <irqHandle+0x7d>
  101459:	8d 76 00             	lea    0x0(%esi),%esi
  10145c:	40                   	inc    %eax
  10145d:	0f 84 3a ff ff ff    	je     10139d <irqHandle+0x7d>
  101463:	83 ec 0c             	sub    $0xc,%esp
  101466:	68 88 18 10 00       	push   $0x101888
  10146b:	e8 d8 01 00 00       	call   101648 <printk>
  101470:	58                   	pop    %eax
  101471:	5a                   	pop    %edx
  101472:	ff 77 38             	pushl  0x38(%edi)
  101475:	ff 77 30             	pushl  0x30(%edi)
  101478:	68 f4 1a 10 00       	push   $0x101af4
  10147d:	6a 36                	push   $0x36
  10147f:	68 6d 1a 10 00       	push   $0x101a6d
  101484:	68 98 1a 10 00       	push   $0x101a98
  101489:	e8 ba 01 00 00       	call   101648 <printk>
  10148e:	83 c4 14             	add    $0x14,%esp
  101491:	68 b7 18 10 00       	push   $0x1018b7
  101496:	e8 ad 01 00 00       	call   101648 <printk>
  10149b:	59                   	pop    %ecx
  10149c:	58                   	pop    %eax
  10149d:	6a 37                	push   $0x37
  10149f:	68 6d 1a 10 00       	push   $0x101a6d
  1014a4:	e8 13 03 00 00       	call   1017bc <abort>
  1014a9:	8b 47 30             	mov    0x30(%edi),%eax
  1014ac:	83 c4 10             	add    $0x10,%esp
  1014af:	e9 dd fe ff ff       	jmp    101391 <irqHandle+0x71>
  1014b4:	83 ec 0c             	sub    $0xc,%esp
  1014b7:	57                   	push   %edi
  1014b8:	e8 c7 fd ff ff       	call   101284 <GProtectFaultHandle>
  1014bd:	8b 47 30             	mov    0x30(%edi),%eax
  1014c0:	83 c4 10             	add    $0x10,%esp
  1014c3:	e9 c9 fe ff ff       	jmp    101391 <irqHandle+0x71>

001014c8 <initIntr>:
  1014c8:	55                   	push   %ebp
  1014c9:	89 e5                	mov    %esp,%ebp
  1014cb:	ba 21 00 00 00       	mov    $0x21,%edx
  1014d0:	b0 ff                	mov    $0xff,%al
  1014d2:	ee                   	out    %al,(%dx)
  1014d3:	ba a1 00 00 00       	mov    $0xa1,%edx
  1014d8:	ee                   	out    %al,(%dx)
  1014d9:	ba 20 00 00 00       	mov    $0x20,%edx
  1014de:	b0 11                	mov    $0x11,%al
  1014e0:	ee                   	out    %al,(%dx)
  1014e1:	ba 21 00 00 00       	mov    $0x21,%edx
  1014e6:	b0 20                	mov    $0x20,%al
  1014e8:	ee                   	out    %al,(%dx)
  1014e9:	b0 04                	mov    $0x4,%al
  1014eb:	ee                   	out    %al,(%dx)
  1014ec:	b0 03                	mov    $0x3,%al
  1014ee:	ee                   	out    %al,(%dx)
  1014ef:	ba a0 00 00 00       	mov    $0xa0,%edx
  1014f4:	b0 11                	mov    $0x11,%al
  1014f6:	ee                   	out    %al,(%dx)
  1014f7:	ba a1 00 00 00       	mov    $0xa1,%edx
  1014fc:	b0 28                	mov    $0x28,%al
  1014fe:	ee                   	out    %al,(%dx)
  1014ff:	b0 02                	mov    $0x2,%al
  101501:	ee                   	out    %al,(%dx)
  101502:	b0 03                	mov    $0x3,%al
  101504:	ee                   	out    %al,(%dx)
  101505:	ba 20 00 00 00       	mov    $0x20,%edx
  10150a:	b0 68                	mov    $0x68,%al
  10150c:	ee                   	out    %al,(%dx)
  10150d:	b0 0a                	mov    $0xa,%al
  10150f:	ee                   	out    %al,(%dx)
  101510:	ba a0 00 00 00       	mov    $0xa0,%edx
  101515:	b0 68                	mov    $0x68,%al
  101517:	ee                   	out    %al,(%dx)
  101518:	b0 0a                	mov    $0xa,%al
  10151a:	ee                   	out    %al,(%dx)
  10151b:	5d                   	pop    %ebp
  10151c:	c3                   	ret    
  10151d:	8d 76 00             	lea    0x0(%esi),%esi

00101520 <initTimer>:
  101520:	55                   	push   %ebp
  101521:	89 e5                	mov    %esp,%ebp
  101523:	ba 43 00 00 00       	mov    $0x43,%edx
  101528:	b0 34                	mov    $0x34,%al
  10152a:	ee                   	out    %al,(%dx)
  10152b:	ba 40 00 00 00       	mov    $0x40,%edx
  101530:	b0 9b                	mov    $0x9b,%al
  101532:	ee                   	out    %al,(%dx)
  101533:	b0 2e                	mov    $0x2e,%al
  101535:	ee                   	out    %al,(%dx)
  101536:	5d                   	pop    %ebp
  101537:	c3                   	ret    

00101538 <i2A>:
  101538:	55                   	push   %ebp
  101539:	89 e5                	mov    %esp,%ebp
  10153b:	57                   	push   %edi
  10153c:	56                   	push   %esi
  10153d:	53                   	push   %ebx
  10153e:	51                   	push   %ecx
  10153f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101542:	85 c9                	test   %ecx,%ecx
  101544:	78 6e                	js     1015b4 <i2A+0x7c>
  101546:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  10154a:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  10154e:	bb de 34 10 00       	mov    $0x1034de,%ebx
  101553:	31 ff                	xor    %edi,%edi
  101555:	eb 03                	jmp    10155a <i2A+0x22>
  101557:	90                   	nop
  101558:	89 f7                	mov    %esi,%edi
  10155a:	4b                   	dec    %ebx
  10155b:	89 c8                	mov    %ecx,%eax
  10155d:	be 0a 00 00 00       	mov    $0xa,%esi
  101562:	99                   	cltd   
  101563:	f7 fe                	idiv   %esi
  101565:	83 c2 30             	add    $0x30,%edx
  101568:	88 13                	mov    %dl,(%ebx)
  10156a:	8d 77 01             	lea    0x1(%edi),%esi
  10156d:	b8 67 66 66 66       	mov    $0x66666667,%eax
  101572:	f7 e9                	imul   %ecx
  101574:	89 d0                	mov    %edx,%eax
  101576:	c1 f8 02             	sar    $0x2,%eax
  101579:	c1 f9 1f             	sar    $0x1f,%ecx
  10157c:	29 c8                	sub    %ecx,%eax
  10157e:	89 c1                	mov    %eax,%ecx
  101580:	75 d6                	jne    101558 <i2A+0x20>
  101582:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  101586:	74 20                	je     1015a8 <i2A+0x70>
  101588:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  10158c:	75 06                	jne    101594 <i2A+0x5c>
  10158e:	fe 05 dd 34 10 00    	incb   0x1034dd
  101594:	c6 05 de 34 10 00 00 	movb   $0x0,0x1034de
  10159b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10159e:	89 18                	mov    %ebx,(%eax)
  1015a0:	89 f0                	mov    %esi,%eax
  1015a2:	5a                   	pop    %edx
  1015a3:	5b                   	pop    %ebx
  1015a4:	5e                   	pop    %esi
  1015a5:	5f                   	pop    %edi
  1015a6:	5d                   	pop    %ebp
  1015a7:	c3                   	ret    
  1015a8:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  1015ac:	8d 77 02             	lea    0x2(%edi),%esi
  1015af:	4b                   	dec    %ebx
  1015b0:	eb d6                	jmp    101588 <i2A+0x50>
  1015b2:	66 90                	xchg   %ax,%ax
  1015b4:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  1015ba:	74 0c                	je     1015c8 <i2A+0x90>
  1015bc:	f7 d9                	neg    %ecx
  1015be:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  1015c2:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  1015c6:	eb 86                	jmp    10154e <i2A+0x16>
  1015c8:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  1015cd:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  1015d1:	eb ef                	jmp    1015c2 <i2A+0x8a>
  1015d3:	90                   	nop

001015d4 <i2X>:
  1015d4:	55                   	push   %ebp
  1015d5:	89 e5                	mov    %esp,%ebp
  1015d7:	57                   	push   %edi
  1015d8:	56                   	push   %esi
  1015d9:	53                   	push   %ebx
  1015da:	8b 55 08             	mov    0x8(%ebp),%edx
  1015dd:	b9 bd 34 10 00       	mov    $0x1034bd,%ecx
  1015e2:	31 c0                	xor    %eax,%eax
  1015e4:	40                   	inc    %eax
  1015e5:	89 d6                	mov    %edx,%esi
  1015e7:	83 e6 0f             	and    $0xf,%esi
  1015ea:	8d 5e f6             	lea    -0xa(%esi),%ebx
  1015ed:	89 cf                	mov    %ecx,%edi
  1015ef:	83 fb 05             	cmp    $0x5,%ebx
  1015f2:	77 4c                	ja     101640 <i2X+0x6c>
  1015f4:	ff 24 9d 00 1b 10 00 	jmp    *0x101b00(,%ebx,4)
  1015fb:	90                   	nop
  1015fc:	c6 01 65             	movb   $0x65,(%ecx)
  1015ff:	90                   	nop
  101600:	49                   	dec    %ecx
  101601:	c1 ea 04             	shr    $0x4,%edx
  101604:	75 de                	jne    1015e4 <i2X+0x10>
  101606:	c6 05 be 34 10 00 00 	movb   $0x0,0x1034be
  10160d:	8b 55 0c             	mov    0xc(%ebp),%edx
  101610:	89 3a                	mov    %edi,(%edx)
  101612:	5b                   	pop    %ebx
  101613:	5e                   	pop    %esi
  101614:	5f                   	pop    %edi
  101615:	5d                   	pop    %ebp
  101616:	c3                   	ret    
  101617:	90                   	nop
  101618:	c6 01 64             	movb   $0x64,(%ecx)
  10161b:	eb e3                	jmp    101600 <i2X+0x2c>
  10161d:	8d 76 00             	lea    0x0(%esi),%esi
  101620:	c6 01 63             	movb   $0x63,(%ecx)
  101623:	eb db                	jmp    101600 <i2X+0x2c>
  101625:	8d 76 00             	lea    0x0(%esi),%esi
  101628:	c6 01 62             	movb   $0x62,(%ecx)
  10162b:	eb d3                	jmp    101600 <i2X+0x2c>
  10162d:	8d 76 00             	lea    0x0(%esi),%esi
  101630:	c6 01 61             	movb   $0x61,(%ecx)
  101633:	eb cb                	jmp    101600 <i2X+0x2c>
  101635:	8d 76 00             	lea    0x0(%esi),%esi
  101638:	c6 01 66             	movb   $0x66,(%ecx)
  10163b:	eb c3                	jmp    101600 <i2X+0x2c>
  10163d:	8d 76 00             	lea    0x0(%esi),%esi
  101640:	8d 5e 30             	lea    0x30(%esi),%ebx
  101643:	88 19                	mov    %bl,(%ecx)
  101645:	eb b9                	jmp    101600 <i2X+0x2c>
  101647:	90                   	nop

00101648 <printk>:
  101648:	55                   	push   %ebp
  101649:	89 e5                	mov    %esp,%ebp
  10164b:	57                   	push   %edi
  10164c:	56                   	push   %esi
  10164d:	53                   	push   %ebx
  10164e:	83 ec 2c             	sub    $0x2c,%esp
  101651:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101654:	8a 11                	mov    (%ecx),%dl
  101656:	84 d2                	test   %dl,%dl
  101658:	0f 84 54 01 00 00    	je     1017b2 <printk+0x16a>
  10165e:	8d 45 0c             	lea    0xc(%ebp),%eax
  101661:	31 ff                	xor    %edi,%edi
  101663:	eb 18                	jmp    10167d <printk+0x35>
  101665:	8d 76 00             	lea    0x0(%esi),%esi
  101668:	8a 11                	mov    (%ecx),%dl
  10166a:	89 cb                	mov    %ecx,%ebx
  10166c:	88 97 e0 34 10 00    	mov    %dl,0x1034e0(%edi)
  101672:	47                   	inc    %edi
  101673:	8d 4b 01             	lea    0x1(%ebx),%ecx
  101676:	8a 53 01             	mov    0x1(%ebx),%dl
  101679:	84 d2                	test   %dl,%dl
  10167b:	74 72                	je     1016ef <printk+0xa7>
  10167d:	80 fa 25             	cmp    $0x25,%dl
  101680:	75 e6                	jne    101668 <printk+0x20>
  101682:	8d 59 01             	lea    0x1(%ecx),%ebx
  101685:	8a 51 01             	mov    0x1(%ecx),%dl
  101688:	80 fa 64             	cmp    $0x64,%dl
  10168b:	0f 84 bf 00 00 00    	je     101750 <printk+0x108>
  101691:	0f 8e 01 01 00 00    	jle    101798 <printk+0x150>
  101697:	80 fa 73             	cmp    $0x73,%dl
  10169a:	0f 84 84 00 00 00    	je     101724 <printk+0xdc>
  1016a0:	80 fa 78             	cmp    $0x78,%dl
  1016a3:	75 c7                	jne    10166c <printk+0x24>
  1016a5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1016ac:	8d 70 04             	lea    0x4(%eax),%esi
  1016af:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1016b2:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  1016b5:	56                   	push   %esi
  1016b6:	ff 30                	pushl  (%eax)
  1016b8:	e8 17 ff ff ff       	call   1015d4 <i2X>
  1016bd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1016c0:	8d b7 e0 34 10 00    	lea    0x1034e0(%edi),%esi
  1016c6:	8a 11                	mov    (%ecx),%dl
  1016c8:	83 c4 08             	add    $0x8,%esp
  1016cb:	31 c0                	xor    %eax,%eax
  1016cd:	84 d2                	test   %dl,%dl
  1016cf:	74 0f                	je     1016e0 <printk+0x98>
  1016d1:	8d 76 00             	lea    0x0(%esi),%esi
  1016d4:	40                   	inc    %eax
  1016d5:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1016d9:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  1016dc:	84 d2                	test   %dl,%dl
  1016de:	75 f4                	jne    1016d4 <printk+0x8c>
  1016e0:	01 c7                	add    %eax,%edi
  1016e2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1016e5:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1016e8:	8a 53 01             	mov    0x1(%ebx),%dl
  1016eb:	84 d2                	test   %dl,%dl
  1016ed:	75 8e                	jne    10167d <printk+0x35>
  1016ef:	c6 87 e0 34 10 00 00 	movb   $0x0,0x1034e0(%edi)
  1016f6:	0f be 05 e0 34 10 00 	movsbl 0x1034e0,%eax
  1016fd:	bb e0 34 10 00       	mov    $0x1034e0,%ebx
  101702:	84 c0                	test   %al,%al
  101704:	74 16                	je     10171c <printk+0xd4>
  101706:	66 90                	xchg   %ax,%ax
  101708:	83 ec 0c             	sub    $0xc,%esp
  10170b:	50                   	push   %eax
  10170c:	e8 8f f1 ff ff       	call   1008a0 <putChar>
  101711:	43                   	inc    %ebx
  101712:	0f be 03             	movsbl (%ebx),%eax
  101715:	83 c4 10             	add    $0x10,%esp
  101718:	84 c0                	test   %al,%al
  10171a:	75 ec                	jne    101708 <printk+0xc0>
  10171c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10171f:	5b                   	pop    %ebx
  101720:	5e                   	pop    %esi
  101721:	5f                   	pop    %edi
  101722:	5d                   	pop    %ebp
  101723:	c3                   	ret    
  101724:	8d 70 04             	lea    0x4(%eax),%esi
  101727:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10172a:	8b 08                	mov    (%eax),%ecx
  10172c:	8d b7 e0 34 10 00    	lea    0x1034e0(%edi),%esi
  101732:	8a 11                	mov    (%ecx),%dl
  101734:	31 c0                	xor    %eax,%eax
  101736:	84 d2                	test   %dl,%dl
  101738:	74 a6                	je     1016e0 <printk+0x98>
  10173a:	66 90                	xchg   %ax,%ax
  10173c:	40                   	inc    %eax
  10173d:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101741:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  101744:	84 d2                	test   %dl,%dl
  101746:	75 f4                	jne    10173c <printk+0xf4>
  101748:	01 c7                	add    %eax,%edi
  10174a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10174d:	eb 96                	jmp    1016e5 <printk+0x9d>
  10174f:	90                   	nop
  101750:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  101757:	8d 70 04             	lea    0x4(%eax),%esi
  10175a:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10175d:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101760:	56                   	push   %esi
  101761:	ff 30                	pushl  (%eax)
  101763:	e8 d0 fd ff ff       	call   101538 <i2A>
  101768:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  10176b:	8d b7 e0 34 10 00    	lea    0x1034e0(%edi),%esi
  101771:	8a 11                	mov    (%ecx),%dl
  101773:	83 c4 08             	add    $0x8,%esp
  101776:	31 c0                	xor    %eax,%eax
  101778:	84 d2                	test   %dl,%dl
  10177a:	0f 84 60 ff ff ff    	je     1016e0 <printk+0x98>
  101780:	40                   	inc    %eax
  101781:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101785:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  101788:	84 d2                	test   %dl,%dl
  10178a:	75 f4                	jne    101780 <printk+0x138>
  10178c:	01 c7                	add    %eax,%edi
  10178e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101791:	e9 4f ff ff ff       	jmp    1016e5 <printk+0x9d>
  101796:	66 90                	xchg   %ax,%ax
  101798:	80 fa 63             	cmp    $0x63,%dl
  10179b:	0f 85 cb fe ff ff    	jne    10166c <printk+0x24>
  1017a1:	8b 10                	mov    (%eax),%edx
  1017a3:	88 97 e0 34 10 00    	mov    %dl,0x1034e0(%edi)
  1017a9:	83 c0 04             	add    $0x4,%eax
  1017ac:	47                   	inc    %edi
  1017ad:	e9 c1 fe ff ff       	jmp    101673 <printk+0x2b>
  1017b2:	31 ff                	xor    %edi,%edi
  1017b4:	e9 36 ff ff ff       	jmp    1016ef <printk+0xa7>
  1017b9:	66 90                	xchg   %ax,%ax
  1017bb:	90                   	nop

001017bc <abort>:
  1017bc:	55                   	push   %ebp
  1017bd:	89 e5                	mov    %esp,%ebp
  1017bf:	57                   	push   %edi
  1017c0:	56                   	push   %esi
  1017c1:	53                   	push   %ebx
  1017c2:	83 ec 1c             	sub    $0x1c,%esp
  1017c5:	8b 55 08             	mov    0x8(%ebp),%edx
  1017c8:	fa                   	cli    
  1017c9:	8a 02                	mov    (%edx),%al
  1017cb:	b9 92 33 10 00       	mov    $0x103392,%ecx
  1017d0:	84 c0                	test   %al,%al
  1017d2:	74 0b                	je     1017df <abort+0x23>
  1017d4:	41                   	inc    %ecx
  1017d5:	42                   	inc    %edx
  1017d6:	88 41 ff             	mov    %al,-0x1(%ecx)
  1017d9:	8a 02                	mov    (%edx),%al
  1017db:	84 c0                	test   %al,%al
  1017dd:	75 f5                	jne    1017d4 <abort+0x18>
  1017df:	c6 01 3a             	movb   $0x3a,(%ecx)
  1017e2:	bb fd 3c 10 00       	mov    $0x103cfd,%ebx
  1017e7:	be 0a 00 00 00       	mov    $0xa,%esi
  1017ec:	bf 67 66 66 66       	mov    $0x66666667,%edi
  1017f1:	4b                   	dec    %ebx
  1017f2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1017f5:	99                   	cltd   
  1017f6:	f7 fe                	idiv   %esi
  1017f8:	8d 42 30             	lea    0x30(%edx),%eax
  1017fb:	88 45 e7             	mov    %al,-0x19(%ebp)
  1017fe:	88 03                	mov    %al,(%ebx)
  101800:	89 f8                	mov    %edi,%eax
  101802:	f7 6d 0c             	imull  0xc(%ebp)
  101805:	c1 fa 02             	sar    $0x2,%edx
  101808:	8b 45 0c             	mov    0xc(%ebp),%eax
  10180b:	c1 f8 1f             	sar    $0x1f,%eax
  10180e:	29 c2                	sub    %eax,%edx
  101810:	89 55 0c             	mov    %edx,0xc(%ebp)
  101813:	75 dc                	jne    1017f1 <abort+0x35>
  101815:	41                   	inc    %ecx
  101816:	41                   	inc    %ecx
  101817:	43                   	inc    %ebx
  101818:	8a 45 e7             	mov    -0x19(%ebp),%al
  10181b:	88 41 ff             	mov    %al,-0x1(%ecx)
  10181e:	8a 03                	mov    (%ebx),%al
  101820:	88 45 e7             	mov    %al,-0x19(%ebp)
  101823:	84 c0                	test   %al,%al
  101825:	75 ef                	jne    101816 <abort+0x5a>
  101827:	c6 01 0a             	movb   $0xa,(%ecx)
  10182a:	0f be 05 80 33 10 00 	movsbl 0x103380,%eax
  101831:	84 c0                	test   %al,%al
  101833:	74 1b                	je     101850 <abort+0x94>
  101835:	bb 80 33 10 00       	mov    $0x103380,%ebx
  10183a:	83 ec 0c             	sub    $0xc,%esp
  10183d:	50                   	push   %eax
  10183e:	e8 5d f0 ff ff       	call   1008a0 <putChar>
  101843:	43                   	inc    %ebx
  101844:	0f be 03             	movsbl (%ebx),%eax
  101847:	83 c4 10             	add    $0x10,%esp
  10184a:	84 c0                	test   %al,%al
  10184c:	75 ec                	jne    10183a <abort+0x7e>
  10184e:	66 90                	xchg   %ax,%ax
  101850:	f4                   	hlt    
  101851:	eb fd                	jmp    101850 <abort+0x94>

00101853 <irqEmpty>:
  101853:	6a 00                	push   $0x0
  101855:	6a ff                	push   $0xffffffff
  101857:	eb 13                	jmp    10186c <asmDoIrq>

00101859 <irqGProtectFault>:
  101859:	6a 0d                	push   $0xd
  10185b:	eb 0f                	jmp    10186c <asmDoIrq>

0010185d <irqSyscall>:
  10185d:	6a 00                	push   $0x0
  10185f:	68 80 00 00 00       	push   $0x80
  101864:	eb 06                	jmp    10186c <asmDoIrq>

00101866 <irqTime>:
  101866:	6a 00                	push   $0x0
  101868:	6a 20                	push   $0x20
  10186a:	eb 00                	jmp    10186c <asmDoIrq>

0010186c <asmDoIrq>:
  10186c:	60                   	pusha  
  10186d:	1e                   	push   %ds
  10186e:	06                   	push   %es
  10186f:	0f a0                	push   %fs
  101871:	0f a8                	push   %gs
  101873:	54                   	push   %esp
  101874:	e8 a7 fa ff ff       	call   101320 <irqHandle>
  101879:	5c                   	pop    %esp
  10187a:	0f a9                	pop    %gs
  10187c:	0f a1                	pop    %fs
  10187e:	07                   	pop    %es
  10187f:	1f                   	pop    %ds
  101880:	61                   	popa   
  101881:	83 c4 04             	add    $0x4,%esp
  101884:	83 c4 04             	add    $0x4,%esp
  101887:	cf                   	iret   
