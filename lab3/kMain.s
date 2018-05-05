
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 f9 14 00 00       	call   101504 <initTimer>
  10000b:	e8 fc 0f 00 00       	call   10100c <init_pcb>
  100010:	e8 3b 10 00 00       	call   101050 <init_kernel_pcb>
  100015:	e8 26 08 00 00       	call   100840 <initSerial>
  10001a:	e8 f1 10 00 00       	call   101110 <initIdt>
  10001f:	e8 88 14 00 00       	call   1014ac <initIntr>
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
  10005f:	66 c7 05 20 7d 13 01 	movw   $0xffff,0x1137d20
  100066:	ff ff 
  100068:	66 a3 22 7d 13 01    	mov    %ax,0x1137d22
  10006e:	89 c2                	mov    %eax,%edx
  100070:	c1 ea 10             	shr    $0x10,%edx
  100073:	88 15 24 7d 13 01    	mov    %dl,0x1137d24
  100079:	c6 05 25 7d 13 01 f2 	movb   $0xf2,0x1137d25
  100080:	c6 05 26 7d 13 01 cf 	movb   $0xcf,0x1137d26
  100087:	c1 e8 18             	shr    $0x18,%eax
  10008a:	a2 27 7d 13 01       	mov    %al,0x1137d27
  10008f:	66 c7 05 60 34 10 00 	movw   $0x4f,0x103460
  100096:	4f 00 
  100098:	b8 00 7d 13 01       	mov    $0x1137d00,%eax
  10009d:	66 a3 62 34 10 00    	mov    %ax,0x103462
  1000a3:	c1 e8 10             	shr    $0x10,%eax
  1000a6:	66 a3 64 34 10 00    	mov    %ax,0x103464
  1000ac:	b8 60 34 10 00       	mov    $0x103460,%eax
  1000b1:	0f 01 10             	lgdtl  (%eax)
  1000b4:	b8 01 00 00 00       	mov    $0x1,%eax
  1000b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000bc:	c9                   	leave  
  1000bd:	c3                   	ret    
  1000be:	66 90                	xchg   %ax,%ax
  1000c0:	66 c7 05 18 7d 13 01 	movw   $0xffff,0x1137d18
  1000c7:	ff ff 
  1000c9:	66 a3 1a 7d 13 01    	mov    %ax,0x1137d1a
  1000cf:	89 c2                	mov    %eax,%edx
  1000d1:	c1 ea 10             	shr    $0x10,%edx
  1000d4:	88 15 1c 7d 13 01    	mov    %dl,0x1137d1c
  1000da:	c6 05 1d 7d 13 01 fa 	movb   $0xfa,0x1137d1d
  1000e1:	c6 05 1e 7d 13 01 cf 	movb   $0xcf,0x1137d1e
  1000e8:	c1 e8 18             	shr    $0x18,%eax
  1000eb:	a2 1f 7d 13 01       	mov    %al,0x1137d1f
  1000f0:	eb 9d                	jmp    10008f <change_gdt+0x5b>
  1000f2:	66 90                	xchg   %ax,%ax
  1000f4:	83 fb 01             	cmp    $0x1,%ebx
  1000f7:	75 37                	jne    100130 <change_gdt+0xfc>
  1000f9:	66 c7 05 08 7d 13 01 	movw   $0xffff,0x1137d08
  100100:	ff ff 
  100102:	66 a3 0a 7d 13 01    	mov    %ax,0x1137d0a
  100108:	89 c2                	mov    %eax,%edx
  10010a:	c1 ea 10             	shr    $0x10,%edx
  10010d:	88 15 0c 7d 13 01    	mov    %dl,0x1137d0c
  100113:	c6 05 0d 7d 13 01 9a 	movb   $0x9a,0x1137d0d
  10011a:	c6 05 0e 7d 13 01 cf 	movb   $0xcf,0x1137d0e
  100121:	c1 e8 18             	shr    $0x18,%eax
  100124:	a2 0f 7d 13 01       	mov    %al,0x1137d0f
  100129:	e9 61 ff ff ff       	jmp    10008f <change_gdt+0x5b>
  10012e:	66 90                	xchg   %ax,%ax
  100130:	83 ec 0c             	sub    $0xc,%esp
  100133:	68 6c 18 10 00       	push   $0x10186c
  100138:	e8 ef 14 00 00       	call   10162c <printk>
  10013d:	89 1c 24             	mov    %ebx,(%esp)
  100140:	68 ac 18 10 00       	push   $0x1018ac
  100145:	6a 18                	push   $0x18
  100147:	68 72 18 10 00       	push   $0x101872
  10014c:	68 7f 18 10 00       	push   $0x10187f
  100151:	e8 d6 14 00 00       	call   10162c <printk>
  100156:	83 c4 14             	add    $0x14,%esp
  100159:	68 9b 18 10 00       	push   $0x10189b
  10015e:	e8 c9 14 00 00       	call   10162c <printk>
  100163:	58                   	pop    %eax
  100164:	5a                   	pop    %edx
  100165:	6a 19                	push   $0x19
  100167:	68 72 18 10 00       	push   $0x101872
  10016c:	e8 2f 16 00 00       	call   1017a0 <abort>
  100171:	83 c4 10             	add    $0x10,%esp
  100174:	e9 16 ff ff ff       	jmp    10008f <change_gdt+0x5b>
  100179:	8d 76 00             	lea    0x0(%esi),%esi
  10017c:	66 c7 05 10 7d 13 01 	movw   $0xffff,0x1137d10
  100183:	ff ff 
  100185:	66 a3 12 7d 13 01    	mov    %ax,0x1137d12
  10018b:	89 c2                	mov    %eax,%edx
  10018d:	c1 ea 10             	shr    $0x10,%edx
  100190:	88 15 14 7d 13 01    	mov    %dl,0x1137d14
  100196:	c6 05 15 7d 13 01 92 	movb   $0x92,0x1137d15
  10019d:	c6 05 16 7d 13 01 cf 	movb   $0xcf,0x1137d16
  1001a4:	c1 e8 18             	shr    $0x18,%eax
  1001a7:	a2 17 7d 13 01       	mov    %al,0x1137d17
  1001ac:	e9 de fe ff ff       	jmp    10008f <change_gdt+0x5b>
  1001b1:	8d 76 00             	lea    0x0(%esi),%esi

001001b4 <change_tss>:
  1001b4:	55                   	push   %ebp
  1001b5:	89 e5                	mov    %esp,%ebp
  1001b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1001ba:	a3 68 7d 13 01       	mov    %eax,0x1137d68
  1001bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1001c2:	a3 64 7d 13 01       	mov    %eax,0x1137d64
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
  1001d8:	be 60 7d 13 01       	mov    $0x1137d60,%esi
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
  10027b:	b9 00 7d 13 01       	mov    $0x1137d00,%ecx
  100280:	66 c7 05 08 7d 13 01 	movw   $0xffff,0x1137d08
  100287:	ff ff 
  100289:	66 c7 05 0a 7d 13 01 	movw   $0x0,0x1137d0a
  100290:	00 00 
  100292:	c6 05 0c 7d 13 01 00 	movb   $0x0,0x1137d0c
  100299:	c6 05 0d 7d 13 01 9a 	movb   $0x9a,0x1137d0d
  1002a0:	c6 05 0e 7d 13 01 cf 	movb   $0xcf,0x1137d0e
  1002a7:	c6 05 0f 7d 13 01 00 	movb   $0x0,0x1137d0f
  1002ae:	66 c7 05 10 7d 13 01 	movw   $0xffff,0x1137d10
  1002b5:	ff ff 
  1002b7:	66 c7 05 12 7d 13 01 	movw   $0x0,0x1137d12
  1002be:	00 00 
  1002c0:	c6 05 14 7d 13 01 00 	movb   $0x0,0x1137d14
  1002c7:	c6 05 15 7d 13 01 92 	movb   $0x92,0x1137d15
  1002ce:	c6 05 16 7d 13 01 cf 	movb   $0xcf,0x1137d16
  1002d5:	c6 05 17 7d 13 01 00 	movb   $0x0,0x1137d17
  1002dc:	66 c7 05 18 7d 13 01 	movw   $0xffff,0x1137d18
  1002e3:	ff ff 
  1002e5:	66 c7 05 1a 7d 13 01 	movw   $0x0,0x1137d1a
  1002ec:	00 00 
  1002ee:	c6 05 1c 7d 13 01 00 	movb   $0x0,0x1137d1c
  1002f5:	c6 05 1d 7d 13 01 fa 	movb   $0xfa,0x1137d1d
  1002fc:	c6 05 1e 7d 13 01 cf 	movb   $0xcf,0x1137d1e
  100303:	c6 05 1f 7d 13 01 00 	movb   $0x0,0x1137d1f
  10030a:	66 c7 05 20 7d 13 01 	movw   $0xffff,0x1137d20
  100311:	ff ff 
  100313:	66 c7 05 22 7d 13 01 	movw   $0x0,0x1137d22
  10031a:	00 00 
  10031c:	c6 05 24 7d 13 01 00 	movb   $0x0,0x1137d24
  100323:	c6 05 25 7d 13 01 f2 	movb   $0xf2,0x1137d25
  10032a:	c6 05 26 7d 13 01 cf 	movb   $0xcf,0x1137d26
  100331:	c6 05 27 7d 13 01 00 	movb   $0x0,0x1137d27
  100338:	66 c7 05 28 7d 13 01 	movw   $0x63,0x1137d28
  10033f:	63 00 
  100341:	b8 60 7d 13 01       	mov    $0x1137d60,%eax
  100346:	66 a3 2a 7d 13 01    	mov    %ax,0x1137d2a
  10034c:	89 c2                	mov    %eax,%edx
  10034e:	c1 ea 10             	shr    $0x10,%edx
  100351:	88 15 2c 7d 13 01    	mov    %dl,0x1137d2c
  100357:	c6 05 2d 7d 13 01 89 	movb   $0x89,0x1137d2d
  10035e:	c6 05 2e 7d 13 01 40 	movb   $0x40,0x1137d2e
  100365:	c1 e8 18             	shr    $0x18,%eax
  100368:	a2 2f 7d 13 01       	mov    %al,0x1137d2f
  10036d:	a1 a4 18 10 00       	mov    0x1018a4,%eax
  100372:	8b 15 a8 18 10 00    	mov    0x1018a8,%edx
  100378:	a3 30 7d 13 01       	mov    %eax,0x1137d30
  10037d:	89 15 34 7d 13 01    	mov    %edx,0x1137d34
  100383:	66 c7 05 40 7d 13 01 	movw   $0xffff,0x1137d40
  10038a:	ff ff 
  10038c:	66 c7 05 42 7d 13 01 	movw   $0x0,0x1137d42
  100393:	00 00 
  100395:	c6 05 44 7d 13 01 00 	movb   $0x0,0x1137d44
  10039c:	c6 05 45 7d 13 01 f2 	movb   $0xf2,0x1137d45
  1003a3:	c6 05 46 7d 13 01 cf 	movb   $0xcf,0x1137d46
  1003aa:	c6 05 47 7d 13 01 00 	movb   $0x0,0x1137d47
  1003b1:	66 c7 05 60 34 10 00 	movw   $0x4f,0x103460
  1003b8:	4f 00 
  1003ba:	66 89 0d 62 34 10 00 	mov    %cx,0x103462
  1003c1:	c1 e9 10             	shr    $0x10,%ecx
  1003c4:	66 89 0d 64 34 10 00 	mov    %cx,0x103464
  1003cb:	b8 60 34 10 00       	mov    $0x103460,%eax
  1003d0:	0f 01 10             	lgdtl  (%eax)
  1003d3:	a1 48 5d 10 00       	mov    0x105d48,%eax
  1003d8:	a3 68 7d 13 01       	mov    %eax,0x1137d68
  1003dd:	c7 05 64 7d 13 01 fc 	movl   $0x105cfc,0x1137d64
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
  100416:	b8 23 00 00 00       	mov    $0x23,%eax
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
  100431:	8d 04 c5 00 3d 10 00 	lea    0x103d00(,%eax,8),%eax
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
  10045e:	c7 05 e4 3c 10 00 01 	movl   $0x1,0x103ce4
  100465:	00 00 00 
  100468:	c7 05 b0 7d 10 00 23 	movl   $0x23,0x107db0
  10046f:	00 00 00 
  100472:	c7 05 a4 7d 10 00 1b 	movl   $0x1b,0x107da4
  100479:	00 00 00 
  10047c:	c7 05 74 7d 10 00 43 	movl   $0x43,0x107d74
  100483:	00 00 00 
  100486:	c7 05 70 7d 10 00 43 	movl   $0x43,0x107d70
  10048d:	00 00 00 
  100490:	c7 05 6c 7d 10 00 43 	movl   $0x43,0x107d6c
  100497:	00 00 00 
  10049a:	c7 05 ac 7d 10 00 00 	movl   $0x400000,0x107dac
  1004a1:	00 40 00 
  1004a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1004a7:	a3 a0 7d 10 00       	mov    %eax,0x107da0
  1004ac:	c7 05 b8 7d 10 00 0a 	movl   $0xa,0x107db8
  1004b3:	00 00 00 
  1004b6:	6a 00                	push   $0x0
  1004b8:	6a 01                	push   $0x1
  1004ba:	e8 b1 05 00 00       	call   100a70 <put_into_runnable>
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
  10056c:	83 ec 0c             	sub    $0xc,%esp
  10056f:	ff 35 18 00 03 00    	pushl  0x30018
  100575:	e8 de fe ff ff       	call   100458 <enterUserSpace>
  10057a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10057d:	5b                   	pop    %ebx
  10057e:	5e                   	pop    %esi
  10057f:	5f                   	pop    %edi
  100580:	5d                   	pop    %ebp
  100581:	c3                   	ret    
  100582:	66 90                	xchg   %ax,%ax

00100584 <sys_exit>:
  100584:	55                   	push   %ebp
  100585:	89 e5                	mov    %esp,%ebp
  100587:	83 ec 14             	sub    $0x14,%esp
  10058a:	68 b7 18 10 00       	push   $0x1018b7
  10058f:	e8 98 10 00 00       	call   10162c <printk>
  100594:	e8 17 04 00 00       	call   1009b0 <get_from_runnable>
  100599:	5a                   	pop    %edx
  10059a:	59                   	pop    %ecx
  10059b:	ff 75 08             	pushl  0x8(%ebp)
  10059e:	50                   	push   %eax
  10059f:	e8 a4 03 00 00       	call   100948 <put_into_running>
  1005a4:	b8 01 00 00 00       	mov    $0x1,%eax
  1005a9:	c9                   	leave  
  1005aa:	c3                   	ret    
  1005ab:	90                   	nop

001005ac <sys_getpid>:
  1005ac:	55                   	push   %ebp
  1005ad:	89 e5                	mov    %esp,%ebp
  1005af:	5d                   	pop    %ebp
  1005b0:	e9 cb 03 00 00       	jmp    100980 <getpid>
  1005b5:	66 90                	xchg   %ax,%ax
  1005b7:	90                   	nop

001005b8 <sys_sleep>:
  1005b8:	55                   	push   %ebp
  1005b9:	89 e5                	mov    %esp,%ebp
  1005bb:	56                   	push   %esi
  1005bc:	53                   	push   %ebx
  1005bd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1005c0:	e8 bb 03 00 00       	call   100980 <getpid>
  1005c5:	83 ec 08             	sub    $0x8,%esp
  1005c8:	53                   	push   %ebx
  1005c9:	50                   	push   %eax
  1005ca:	e8 d1 05 00 00       	call   100ba0 <put_into_block>
  1005cf:	c7 04 24 6c 18 10 00 	movl   $0x10186c,(%esp)
  1005d6:	e8 51 10 00 00       	call   10162c <printk>
  1005db:	e8 a0 03 00 00       	call   100980 <getpid>
  1005e0:	89 c2                	mov    %eax,%edx
  1005e2:	c1 e2 07             	shl    $0x7,%edx
  1005e5:	01 c2                	add    %eax,%edx
  1005e7:	01 d2                	add    %edx,%edx
  1005e9:	01 c2                	add    %eax,%edx
  1005eb:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1005ee:	8b 34 c5 54 5d 10 00 	mov    0x105d54(,%eax,8),%esi
  1005f5:	e8 86 03 00 00       	call   100980 <getpid>
  1005fa:	5a                   	pop    %edx
  1005fb:	59                   	pop    %ecx
  1005fc:	56                   	push   %esi
  1005fd:	50                   	push   %eax
  1005fe:	68 08 19 10 00       	push   $0x101908
  100603:	6a 09                	push   $0x9
  100605:	68 c5 18 10 00       	push   $0x1018c5
  10060a:	68 e4 18 10 00       	push   $0x1018e4
  10060f:	e8 18 10 00 00       	call   10162c <printk>
  100614:	83 c4 14             	add    $0x14,%esp
  100617:	68 9b 18 10 00       	push   $0x10189b
  10061c:	e8 0b 10 00 00       	call   10162c <printk>
  100621:	e8 8a 03 00 00       	call   1009b0 <get_from_runnable>
  100626:	5e                   	pop    %esi
  100627:	5a                   	pop    %edx
  100628:	53                   	push   %ebx
  100629:	50                   	push   %eax
  10062a:	e8 19 03 00 00       	call   100948 <put_into_running>
  10062f:	b8 01 00 00 00       	mov    $0x1,%eax
  100634:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100637:	5b                   	pop    %ebx
  100638:	5e                   	pop    %esi
  100639:	5d                   	pop    %ebp
  10063a:	c3                   	ret    
  10063b:	90                   	nop

0010063c <sys_fork>:
  10063c:	55                   	push   %ebp
  10063d:	89 e5                	mov    %esp,%ebp
  10063f:	57                   	push   %edi
  100640:	56                   	push   %esi
  100641:	53                   	push   %ebx
  100642:	83 ec 18             	sub    $0x18,%esp
  100645:	8b 75 08             	mov    0x8(%ebp),%esi
  100648:	68 12 19 10 00       	push   $0x101912
  10064d:	e8 da 0f 00 00       	call   10162c <printk>
  100652:	83 c4 10             	add    $0x10,%esp
  100655:	31 db                	xor    %ebx,%ebx
  100657:	90                   	nop
  100658:	e8 23 03 00 00       	call   100980 <getpid>
  10065d:	89 c2                	mov    %eax,%edx
  10065f:	c1 e2 07             	shl    $0x7,%edx
  100662:	01 c2                	add    %eax,%edx
  100664:	01 d2                	add    %edx,%edx
  100666:	01 c2                	add    %eax,%edx
  100668:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10066b:	01 c0                	add    %eax,%eax
  10066d:	01 d8                	add    %ebx,%eax
  10066f:	8b 04 85 00 3d 10 00 	mov    0x103d00(,%eax,4),%eax
  100676:	89 04 9d d0 7d 10 00 	mov    %eax,0x107dd0(,%ebx,4)
  10067d:	43                   	inc    %ebx
  10067e:	81 fb 00 08 00 00    	cmp    $0x800,%ebx
  100684:	75 d2                	jne    100658 <sys_fork+0x1c>
  100686:	e8 f5 02 00 00       	call   100980 <getpid>
  10068b:	8d 50 40             	lea    0x40(%eax),%edx
  10068e:	c1 e2 10             	shl    $0x10,%edx
  100691:	b8 00 00 01 00       	mov    $0x10000,%eax
  100696:	66 90                	xchg   %ax,%ax
  100698:	8a 8c 10 00 00 ff ff 	mov    -0x10000(%eax,%edx,1),%cl
  10069f:	88 88 00 00 41 00    	mov    %cl,0x410000(%eax)
  1006a5:	48                   	dec    %eax
  1006a6:	75 f0                	jne    100698 <sys_fork+0x5c>
  1006a8:	b8 d0 9d 10 00       	mov    $0x109dd0,%eax
  1006ad:	b9 13 00 00 00       	mov    $0x13,%ecx
  1006b2:	89 c7                	mov    %eax,%edi
  1006b4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1006b6:	c7 05 fc 9d 10 00 00 	movl   $0x0,0x109dfc
  1006bd:	00 00 00 
  1006c0:	83 ec 08             	sub    $0x8,%esp
  1006c3:	50                   	push   %eax
  1006c4:	6a 02                	push   $0x2
  1006c6:	e8 a5 03 00 00       	call   100a70 <put_into_runnable>
  1006cb:	b8 02 00 00 00       	mov    $0x2,%eax
  1006d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1006d3:	5b                   	pop    %ebx
  1006d4:	5e                   	pop    %esi
  1006d5:	5f                   	pop    %edi
  1006d6:	5d                   	pop    %ebp
  1006d7:	c3                   	ret    

001006d8 <display>:
  1006d8:	55                   	push   %ebp
  1006d9:	89 e5                	mov    %esp,%ebp
  1006db:	57                   	push   %edi
  1006dc:	53                   	push   %ebx
  1006dd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1006e0:	80 fb 0a             	cmp    $0xa,%bl
  1006e3:	74 5b                	je     100740 <display+0x68>
  1006e5:	8b 15 68 34 10 00    	mov    0x103468,%edx
  1006eb:	8b 0d 6c 34 10 00    	mov    0x10346c,%ecx
  1006f1:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  1006f4:	c1 e0 04             	shl    $0x4,%eax
  1006f7:	01 d0                	add    %edx,%eax
  1006f9:	01 c0                	add    %eax,%eax
  1006fb:	89 c7                	mov    %eax,%edi
  1006fd:	0f be db             	movsbl %bl,%ebx
  100700:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
  100706:	66 89 d8             	mov    %bx,%ax
  100709:	65 66 89 07          	mov    %ax,%gs:(%edi)
  10070d:	42                   	inc    %edx
  10070e:	83 fa 50             	cmp    $0x50,%edx
  100711:	75 1d                	jne    100730 <display+0x58>
  100713:	c7 05 68 34 10 00 00 	movl   $0x0,0x103468
  10071a:	00 00 00 
  10071d:	41                   	inc    %ecx
  10071e:	89 0d 6c 34 10 00    	mov    %ecx,0x10346c
  100724:	b8 01 00 00 00       	mov    $0x1,%eax
  100729:	5b                   	pop    %ebx
  10072a:	5f                   	pop    %edi
  10072b:	5d                   	pop    %ebp
  10072c:	c3                   	ret    
  10072d:	8d 76 00             	lea    0x0(%esi),%esi
  100730:	89 15 68 34 10 00    	mov    %edx,0x103468
  100736:	b8 01 00 00 00       	mov    $0x1,%eax
  10073b:	5b                   	pop    %ebx
  10073c:	5f                   	pop    %edi
  10073d:	5d                   	pop    %ebp
  10073e:	c3                   	ret    
  10073f:	90                   	nop
  100740:	c7 05 68 34 10 00 00 	movl   $0x0,0x103468
  100747:	00 00 00 
  10074a:	ff 05 6c 34 10 00    	incl   0x10346c
  100750:	b8 01 00 00 00       	mov    $0x1,%eax
  100755:	5b                   	pop    %ebx
  100756:	5f                   	pop    %edi
  100757:	5d                   	pop    %ebp
  100758:	c3                   	ret    
  100759:	8d 76 00             	lea    0x0(%esi),%esi

0010075c <printkernel>:
  10075c:	55                   	push   %ebp
  10075d:	89 e5                	mov    %esp,%ebp
  10075f:	56                   	push   %esi
  100760:	53                   	push   %ebx
  100761:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100764:	8b 75 0c             	mov    0xc(%ebp),%esi
  100767:	85 f6                	test   %esi,%esi
  100769:	7e 30                	jle    10079b <printkernel+0x3f>
  10076b:	0f be 03             	movsbl (%ebx),%eax
  10076e:	84 c0                	test   %al,%al
  100770:	74 29                	je     10079b <printkernel+0x3f>
  100772:	01 de                	add    %ebx,%esi
  100774:	eb 09                	jmp    10077f <printkernel+0x23>
  100776:	66 90                	xchg   %ax,%ax
  100778:	0f be 03             	movsbl (%ebx),%eax
  10077b:	84 c0                	test   %al,%al
  10077d:	74 1c                	je     10079b <printkernel+0x3f>
  10077f:	83 ec 0c             	sub    $0xc,%esp
  100782:	50                   	push   %eax
  100783:	e8 f8 00 00 00       	call   100880 <putChar>
  100788:	0f be 03             	movsbl (%ebx),%eax
  10078b:	89 04 24             	mov    %eax,(%esp)
  10078e:	e8 45 ff ff ff       	call   1006d8 <display>
  100793:	43                   	inc    %ebx
  100794:	83 c4 10             	add    $0x10,%esp
  100797:	39 de                	cmp    %ebx,%esi
  100799:	75 dd                	jne    100778 <printkernel+0x1c>
  10079b:	b8 01 00 00 00       	mov    $0x1,%eax
  1007a0:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1007a3:	5b                   	pop    %ebx
  1007a4:	5e                   	pop    %esi
  1007a5:	5d                   	pop    %ebp
  1007a6:	c3                   	ret    
  1007a7:	90                   	nop

001007a8 <fs_write>:
  1007a8:	55                   	push   %ebp
  1007a9:	89 e5                	mov    %esp,%ebp
  1007ab:	53                   	push   %ebx
  1007ac:	50                   	push   %eax
  1007ad:	8b 5d 10             	mov    0x10(%ebp),%ebx
  1007b0:	ba 30 00 00 00       	mov    $0x30,%edx
  1007b5:	89 d0                	mov    %edx,%eax
  1007b7:	8e e8                	mov    %eax,%gs
  1007b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1007bc:	48                   	dec    %eax
  1007bd:	83 f8 01             	cmp    $0x1,%eax
  1007c0:	76 12                	jbe    1007d4 <fs_write+0x2c>
  1007c2:	83 ec 08             	sub    $0x8,%esp
  1007c5:	6a 28                	push   $0x28
  1007c7:	68 2e 19 10 00       	push   $0x10192e
  1007cc:	e8 cf 0f 00 00       	call   1017a0 <abort>
  1007d1:	83 c4 10             	add    $0x10,%esp
  1007d4:	83 ec 08             	sub    $0x8,%esp
  1007d7:	53                   	push   %ebx
  1007d8:	ff 75 0c             	pushl  0xc(%ebp)
  1007db:	e8 7c ff ff ff       	call   10075c <printkernel>
  1007e0:	89 d8                	mov    %ebx,%eax
  1007e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1007e5:	c9                   	leave  
  1007e6:	c3                   	ret    
  1007e7:	90                   	nop

001007e8 <sys_write>:
  1007e8:	55                   	push   %ebp
  1007e9:	89 e5                	mov    %esp,%ebp
  1007eb:	56                   	push   %esi
  1007ec:	53                   	push   %ebx
  1007ed:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1007f0:	8b 73 24             	mov    0x24(%ebx),%esi
  1007f3:	e8 88 01 00 00       	call   100980 <getpid>
  1007f8:	52                   	push   %edx
  1007f9:	56                   	push   %esi
  1007fa:	c1 e0 10             	shl    $0x10,%eax
  1007fd:	03 43 28             	add    0x28(%ebx),%eax
  100800:	50                   	push   %eax
  100801:	ff 73 20             	pushl  0x20(%ebx)
  100804:	e8 9f ff ff ff       	call   1007a8 <fs_write>
  100809:	89 43 2c             	mov    %eax,0x2c(%ebx)
  10080c:	83 c4 10             	add    $0x10,%esp
  10080f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100812:	5b                   	pop    %ebx
  100813:	5e                   	pop    %esi
  100814:	5d                   	pop    %ebp
  100815:	c3                   	ret    
  100816:	66 90                	xchg   %ax,%ax

00100818 <print_char>:
  100818:	55                   	push   %ebp
  100819:	89 e5                	mov    %esp,%ebp
  10081b:	57                   	push   %edi
  10081c:	8b 45 08             	mov    0x8(%ebp),%eax
  10081f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100822:	c1 e0 04             	shl    $0x4,%eax
  100825:	03 45 0c             	add    0xc(%ebp),%eax
  100828:	01 c0                	add    %eax,%eax
  10082a:	89 c7                	mov    %eax,%edi
  10082c:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  100830:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  100836:	66 89 d0             	mov    %dx,%ax
  100839:	65 66 89 07          	mov    %ax,%gs:(%edi)
  10083d:	5f                   	pop    %edi
  10083e:	5d                   	pop    %ebp
  10083f:	c3                   	ret    

00100840 <initSerial>:
  100840:	55                   	push   %ebp
  100841:	89 e5                	mov    %esp,%ebp
  100843:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100848:	31 c0                	xor    %eax,%eax
  10084a:	ee                   	out    %al,(%dx)
  10084b:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100850:	b0 80                	mov    $0x80,%al
  100852:	ee                   	out    %al,(%dx)
  100853:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100858:	b0 01                	mov    $0x1,%al
  10085a:	ee                   	out    %al,(%dx)
  10085b:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100860:	31 c0                	xor    %eax,%eax
  100862:	ee                   	out    %al,(%dx)
  100863:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100868:	b0 03                	mov    $0x3,%al
  10086a:	ee                   	out    %al,(%dx)
  10086b:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100870:	b0 c7                	mov    $0xc7,%al
  100872:	ee                   	out    %al,(%dx)
  100873:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100878:	b0 0b                	mov    $0xb,%al
  10087a:	ee                   	out    %al,(%dx)
  10087b:	5d                   	pop    %ebp
  10087c:	c3                   	ret    
  10087d:	8d 76 00             	lea    0x0(%esi),%esi

00100880 <putChar>:
  100880:	55                   	push   %ebp
  100881:	89 e5                	mov    %esp,%ebp
  100883:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100886:	ba fd 03 00 00       	mov    $0x3fd,%edx
  10088b:	90                   	nop
  10088c:	ec                   	in     (%dx),%al
  10088d:	a8 20                	test   $0x20,%al
  10088f:	74 fb                	je     10088c <putChar+0xc>
  100891:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100896:	88 c8                	mov    %cl,%al
  100898:	ee                   	out    %al,(%dx)
  100899:	5d                   	pop    %ebp
  10089a:	c3                   	ret    
  10089b:	90                   	nop

0010089c <IDLE>:
  10089c:	55                   	push   %ebp
  10089d:	89 e5                	mov    %esp,%ebp
  10089f:	90                   	nop
  1008a0:	f4                   	hlt    
  1008a1:	eb fd                	jmp    1008a0 <IDLE+0x4>
  1008a3:	90                   	nop

001008a4 <put_into_running.part.0>:
  1008a4:	55                   	push   %ebp
  1008a5:	89 e5                	mov    %esp,%ebp
  1008a7:	53                   	push   %ebx
  1008a8:	83 ec 7c             	sub    $0x7c,%esp
  1008ab:	89 c3                	mov    %eax,%ebx
  1008ad:	a3 e0 3c 10 00       	mov    %eax,0x103ce0
  1008b2:	c1 e0 07             	shl    $0x7,%eax
  1008b5:	01 d8                	add    %ebx,%eax
  1008b7:	01 c0                	add    %eax,%eax
  1008b9:	01 d8                	add    %ebx,%eax
  1008bb:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1008be:	8d 04 c5 fc 5c 10 00 	lea    0x105cfc(,%eax,8),%eax
  1008c5:	50                   	push   %eax
  1008c6:	6a 10                	push   $0x10
  1008c8:	e8 e7 f8 ff ff       	call   1001b4 <change_tss>
  1008cd:	8d 45 94             	lea    -0x6c(%ebp),%eax
  1008d0:	89 04 24             	mov    %eax,(%esp)
  1008d3:	e8 f8 f8 ff ff       	call   1001d0 <get_tss>
  1008d8:	8b 15 e0 3c 10 00    	mov    0x103ce0,%edx
  1008de:	89 d0                	mov    %edx,%eax
  1008e0:	c1 e0 07             	shl    $0x7,%eax
  1008e3:	01 d0                	add    %edx,%eax
  1008e5:	01 c0                	add    %eax,%eax
  1008e7:	01 d0                	add    %edx,%eax
  1008e9:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1008ec:	8d 04 c5 fc 5c 10 00 	lea    0x105cfc(,%eax,8),%eax
  1008f3:	83 c4 0c             	add    $0xc,%esp
  1008f6:	39 45 98             	cmp    %eax,-0x68(%ebp)
  1008f9:	74 12                	je     10090d <put_into_running.part.0+0x69>
  1008fb:	83 ec 08             	sub    $0x8,%esp
  1008fe:	6a 10                	push   $0x10
  100900:	68 4a 19 10 00       	push   $0x10194a
  100905:	e8 96 0e 00 00       	call   1017a0 <abort>
  10090a:	83 c4 10             	add    $0x10,%esp
  10090d:	83 ec 0c             	sub    $0xc,%esp
  100910:	68 6c 18 10 00       	push   $0x10186c
  100915:	e8 12 0d 00 00       	call   10162c <printk>
  10091a:	89 1c 24             	mov    %ebx,(%esp)
  10091d:	68 40 1a 10 00       	push   $0x101a40
  100922:	6a 12                	push   $0x12
  100924:	68 4a 19 10 00       	push   $0x10194a
  100929:	68 58 19 10 00       	push   $0x101958
  10092e:	e8 f9 0c 00 00       	call   10162c <printk>
  100933:	83 c4 14             	add    $0x14,%esp
  100936:	68 9b 18 10 00       	push   $0x10189b
  10093b:	e8 ec 0c 00 00       	call   10162c <printk>
  100940:	83 c4 10             	add    $0x10,%esp
  100943:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100946:	c9                   	leave  
  100947:	c3                   	ret    

00100948 <put_into_running>:
  100948:	55                   	push   %ebp
  100949:	89 e5                	mov    %esp,%ebp
  10094b:	83 ec 08             	sub    $0x8,%esp
  10094e:	8b 45 08             	mov    0x8(%ebp),%eax
  100951:	39 05 e0 3c 10 00    	cmp    %eax,0x103ce0
  100957:	74 05                	je     10095e <put_into_running+0x16>
  100959:	e8 46 ff ff ff       	call   1008a4 <put_into_running.part.0>
  10095e:	b8 01 00 00 00       	mov    $0x1,%eax
  100963:	c9                   	leave  
  100964:	c3                   	ret    
  100965:	8d 76 00             	lea    0x0(%esi),%esi

00100968 <update_block>:
  100968:	55                   	push   %ebp
  100969:	89 e5                	mov    %esp,%ebp
  10096b:	b8 01 00 00 00       	mov    $0x1,%eax
  100970:	5d                   	pop    %ebp
  100971:	c3                   	ret    
  100972:	66 90                	xchg   %ax,%ax

00100974 <apply_new_pid>:
  100974:	55                   	push   %ebp
  100975:	89 e5                	mov    %esp,%ebp
  100977:	b8 02 00 00 00       	mov    $0x2,%eax
  10097c:	5d                   	pop    %ebp
  10097d:	c3                   	ret    
  10097e:	66 90                	xchg   %ax,%ax

00100980 <getpid>:
  100980:	55                   	push   %ebp
  100981:	89 e5                	mov    %esp,%ebp
  100983:	a1 e0 3c 10 00       	mov    0x103ce0,%eax
  100988:	5d                   	pop    %ebp
  100989:	c3                   	ret    
  10098a:	66 90                	xchg   %ax,%ax

0010098c <getrunnable>:
  10098c:	55                   	push   %ebp
  10098d:	89 e5                	mov    %esp,%ebp
  10098f:	a1 44 33 10 00       	mov    0x103344,%eax
  100994:	5d                   	pop    %ebp
  100995:	c3                   	ret    
  100996:	66 90                	xchg   %ax,%ax

00100998 <getblocked>:
  100998:	55                   	push   %ebp
  100999:	89 e5                	mov    %esp,%ebp
  10099b:	a1 40 33 10 00       	mov    0x103340,%eax
  1009a0:	5d                   	pop    %ebp
  1009a1:	c3                   	ret    
  1009a2:	66 90                	xchg   %ax,%ax

001009a4 <transfer_pid_mode>:
  1009a4:	55                   	push   %ebp
  1009a5:	89 e5                	mov    %esp,%ebp
  1009a7:	b8 01 00 00 00       	mov    $0x1,%eax
  1009ac:	5d                   	pop    %ebp
  1009ad:	c3                   	ret    
  1009ae:	66 90                	xchg   %ax,%ax

001009b0 <get_from_runnable>:
  1009b0:	55                   	push   %ebp
  1009b1:	89 e5                	mov    %esp,%ebp
  1009b3:	53                   	push   %ebx
  1009b4:	51                   	push   %ecx
  1009b5:	8b 1d 44 33 10 00    	mov    0x103344,%ebx
  1009bb:	83 fb ff             	cmp    $0xffffffff,%ebx
  1009be:	0f 84 a4 00 00 00    	je     100a68 <get_from_runnable+0xb8>
  1009c4:	89 d8                	mov    %ebx,%eax
  1009c6:	c1 e0 07             	shl    $0x7,%eax
  1009c9:	01 d8                	add    %ebx,%eax
  1009cb:	01 c0                	add    %eax,%eax
  1009cd:	01 d8                	add    %ebx,%eax
  1009cf:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1009d2:	8d 04 c5 00 3d 10 00 	lea    0x103d00(,%eax,8),%eax
  1009d9:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  1009df:	39 da                	cmp    %ebx,%edx
  1009e1:	74 79                	je     100a5c <get_from_runnable+0xac>
  1009e3:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  1009e9:	89 c8                	mov    %ecx,%eax
  1009eb:	c1 e0 07             	shl    $0x7,%eax
  1009ee:	01 c8                	add    %ecx,%eax
  1009f0:	01 c0                	add    %eax,%eax
  1009f2:	01 c8                	add    %ecx,%eax
  1009f4:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  1009f7:	89 14 c5 60 5d 10 00 	mov    %edx,0x105d60(,%eax,8)
  1009fe:	89 d0                	mov    %edx,%eax
  100a00:	c1 e0 07             	shl    $0x7,%eax
  100a03:	01 d0                	add    %edx,%eax
  100a05:	01 c0                	add    %eax,%eax
  100a07:	01 d0                	add    %edx,%eax
  100a09:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100a0c:	89 0c c5 5c 5d 10 00 	mov    %ecx,0x105d5c(,%eax,8)
  100a13:	89 15 44 33 10 00    	mov    %edx,0x103344
  100a19:	83 ec 0c             	sub    $0xc,%esp
  100a1c:	68 6c 18 10 00       	push   $0x10186c
  100a21:	e8 06 0c 00 00       	call   10162c <printk>
  100a26:	58                   	pop    %eax
  100a27:	5a                   	pop    %edx
  100a28:	ff 35 44 33 10 00    	pushl  0x103344
  100a2e:	53                   	push   %ebx
  100a2f:	68 1c 1a 10 00       	push   $0x101a1c
  100a34:	6a 61                	push   $0x61
  100a36:	68 4a 19 10 00       	push   $0x10194a
  100a3b:	68 78 19 10 00       	push   $0x101978
  100a40:	e8 e7 0b 00 00       	call   10162c <printk>
  100a45:	83 c4 14             	add    $0x14,%esp
  100a48:	68 9b 18 10 00       	push   $0x10189b
  100a4d:	e8 da 0b 00 00       	call   10162c <printk>
  100a52:	83 c4 10             	add    $0x10,%esp
  100a55:	89 d8                	mov    %ebx,%eax
  100a57:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100a5a:	c9                   	leave  
  100a5b:	c3                   	ret    
  100a5c:	c7 05 44 33 10 00 ff 	movl   $0xffffffff,0x103344
  100a63:	ff ff ff 
  100a66:	eb b1                	jmp    100a19 <get_from_runnable+0x69>
  100a68:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100a6d:	eb e8                	jmp    100a57 <get_from_runnable+0xa7>
  100a6f:	90                   	nop

00100a70 <put_into_runnable>:
  100a70:	55                   	push   %ebp
  100a71:	89 e5                	mov    %esp,%ebp
  100a73:	56                   	push   %esi
  100a74:	53                   	push   %ebx
  100a75:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100a78:	8b 15 44 33 10 00    	mov    0x103344,%edx
  100a7e:	83 fa ff             	cmp    $0xffffffff,%edx
  100a81:	0f 84 ed 00 00 00    	je     100b74 <put_into_runnable+0x104>
  100a87:	89 d0                	mov    %edx,%eax
  100a89:	c1 e0 07             	shl    $0x7,%eax
  100a8c:	01 d0                	add    %edx,%eax
  100a8e:	01 c0                	add    %eax,%eax
  100a90:	01 d0                	add    %edx,%eax
  100a92:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100a95:	8d 34 c5 00 3d 10 00 	lea    0x103d00(,%eax,8),%esi
  100a9c:	8b 8e 5c 20 00 00    	mov    0x205c(%esi),%ecx
  100aa2:	89 c8                	mov    %ecx,%eax
  100aa4:	c1 e0 07             	shl    $0x7,%eax
  100aa7:	01 c8                	add    %ecx,%eax
  100aa9:	01 c0                	add    %eax,%eax
  100aab:	01 c8                	add    %ecx,%eax
  100aad:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100ab0:	89 1c c5 60 5d 10 00 	mov    %ebx,0x105d60(,%eax,8)
  100ab7:	89 d8                	mov    %ebx,%eax
  100ab9:	c1 e0 07             	shl    $0x7,%eax
  100abc:	01 d8                	add    %ebx,%eax
  100abe:	01 c0                	add    %eax,%eax
  100ac0:	01 d8                	add    %ebx,%eax
  100ac2:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100ac5:	8d 04 c5 00 3d 10 00 	lea    0x103d00(,%eax,8),%eax
  100acc:	89 88 5c 20 00 00    	mov    %ecx,0x205c(%eax)
  100ad2:	89 90 60 20 00 00    	mov    %edx,0x2060(%eax)
  100ad8:	89 9e 5c 20 00 00    	mov    %ebx,0x205c(%esi)
  100ade:	89 d8                	mov    %ebx,%eax
  100ae0:	c1 e0 07             	shl    $0x7,%eax
  100ae3:	01 d8                	add    %ebx,%eax
  100ae5:	01 c0                	add    %eax,%eax
  100ae7:	01 d8                	add    %ebx,%eax
  100ae9:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100aec:	c7 04 c5 4c 5d 10 00 	movl   $0x1,0x105d4c(,%eax,8)
  100af3:	01 00 00 00 
  100af7:	85 db                	test   %ebx,%ebx
  100af9:	75 0a                	jne    100b05 <put_into_runnable+0x95>
  100afb:	c7 05 38 5d 10 00 9c 	movl   $0x10089c,0x105d38
  100b02:	08 10 00 
  100b05:	83 ec 0c             	sub    $0xc,%esp
  100b08:	68 6c 18 10 00       	push   $0x10186c
  100b0d:	e8 1a 0b 00 00       	call   10162c <printk>
  100b12:	58                   	pop    %eax
  100b13:	5a                   	pop    %edx
  100b14:	53                   	push   %ebx
  100b15:	ff 35 44 33 10 00    	pushl  0x103344
  100b1b:	68 08 1a 10 00       	push   $0x101a08
  100b20:	6a 7d                	push   $0x7d
  100b22:	68 4a 19 10 00       	push   $0x10194a
  100b27:	68 ac 19 10 00       	push   $0x1019ac
  100b2c:	e8 fb 0a 00 00       	call   10162c <printk>
  100b31:	83 c4 14             	add    $0x14,%esp
  100b34:	68 9b 18 10 00       	push   $0x10189b
  100b39:	e8 ee 0a 00 00       	call   10162c <printk>
  100b3e:	89 d8                	mov    %ebx,%eax
  100b40:	c1 e0 07             	shl    $0x7,%eax
  100b43:	01 d8                	add    %ebx,%eax
  100b45:	01 c0                	add    %eax,%eax
  100b47:	01 d8                	add    %ebx,%eax
  100b49:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b4c:	8d 04 c5 00 3d 10 00 	lea    0x103d00(,%eax,8),%eax
  100b53:	8b 15 e8 3c 10 00    	mov    0x103ce8,%edx
  100b59:	89 90 50 20 00 00    	mov    %edx,0x2050(%eax)
  100b5f:	8b 55 0c             	mov    0xc(%ebp),%edx
  100b62:	89 90 64 20 00 00    	mov    %edx,0x2064(%eax)
  100b68:	b8 01 00 00 00       	mov    $0x1,%eax
  100b6d:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100b70:	5b                   	pop    %ebx
  100b71:	5e                   	pop    %esi
  100b72:	5d                   	pop    %ebp
  100b73:	c3                   	ret    
  100b74:	89 1d 44 33 10 00    	mov    %ebx,0x103344
  100b7a:	89 d8                	mov    %ebx,%eax
  100b7c:	c1 e0 07             	shl    $0x7,%eax
  100b7f:	01 d8                	add    %ebx,%eax
  100b81:	01 c0                	add    %eax,%eax
  100b83:	01 d8                	add    %ebx,%eax
  100b85:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b88:	8d 04 c5 00 3d 10 00 	lea    0x103d00(,%eax,8),%eax
  100b8f:	89 98 5c 20 00 00    	mov    %ebx,0x205c(%eax)
  100b95:	89 98 60 20 00 00    	mov    %ebx,0x2060(%eax)
  100b9b:	e9 3e ff ff ff       	jmp    100ade <put_into_runnable+0x6e>

00100ba0 <put_into_block>:
  100ba0:	55                   	push   %ebp
  100ba1:	89 e5                	mov    %esp,%ebp
  100ba3:	57                   	push   %edi
  100ba4:	56                   	push   %esi
  100ba5:	53                   	push   %ebx
  100ba6:	8b 45 08             	mov    0x8(%ebp),%eax
  100ba9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100bac:	8b 0d 40 33 10 00    	mov    0x103340,%ecx
  100bb2:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100bb5:	0f 84 99 00 00 00    	je     100c54 <put_into_block+0xb4>
  100bbb:	89 ca                	mov    %ecx,%edx
  100bbd:	c1 e2 07             	shl    $0x7,%edx
  100bc0:	01 ca                	add    %ecx,%edx
  100bc2:	01 d2                	add    %edx,%edx
  100bc4:	01 ca                	add    %ecx,%edx
  100bc6:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100bc9:	8d 3c d5 00 3d 10 00 	lea    0x103d00(,%edx,8),%edi
  100bd0:	8b b7 5c 20 00 00    	mov    0x205c(%edi),%esi
  100bd6:	89 f2                	mov    %esi,%edx
  100bd8:	c1 e2 07             	shl    $0x7,%edx
  100bdb:	01 f2                	add    %esi,%edx
  100bdd:	01 d2                	add    %edx,%edx
  100bdf:	01 f2                	add    %esi,%edx
  100be1:	8d 14 96             	lea    (%esi,%edx,4),%edx
  100be4:	89 04 d5 60 5d 10 00 	mov    %eax,0x105d60(,%edx,8)
  100beb:	89 c2                	mov    %eax,%edx
  100bed:	c1 e2 07             	shl    $0x7,%edx
  100bf0:	01 c2                	add    %eax,%edx
  100bf2:	01 d2                	add    %edx,%edx
  100bf4:	01 c2                	add    %eax,%edx
  100bf6:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100bf9:	8d 14 d5 00 3d 10 00 	lea    0x103d00(,%edx,8),%edx
  100c00:	89 b2 5c 20 00 00    	mov    %esi,0x205c(%edx)
  100c06:	89 8a 60 20 00 00    	mov    %ecx,0x2060(%edx)
  100c0c:	89 87 5c 20 00 00    	mov    %eax,0x205c(%edi)
  100c12:	89 c2                	mov    %eax,%edx
  100c14:	c1 e2 07             	shl    $0x7,%edx
  100c17:	01 c2                	add    %eax,%edx
  100c19:	01 d2                	add    %edx,%edx
  100c1b:	01 c2                	add    %eax,%edx
  100c1d:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c20:	c1 e2 03             	shl    $0x3,%edx
  100c23:	8d 82 00 5d 10 00    	lea    0x105d00(%edx),%eax
  100c29:	b9 13 00 00 00       	mov    $0x13,%ecx
  100c2e:	89 c7                	mov    %eax,%edi
  100c30:	89 de                	mov    %ebx,%esi
  100c32:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100c34:	8b 43 20             	mov    0x20(%ebx),%eax
  100c37:	89 82 54 5d 10 00    	mov    %eax,0x105d54(%edx)
  100c3d:	c7 82 4c 5d 10 00 00 	movl   $0x0,0x105d4c(%edx)
  100c44:	00 00 00 
  100c47:	b8 01 00 00 00       	mov    $0x1,%eax
  100c4c:	5b                   	pop    %ebx
  100c4d:	5e                   	pop    %esi
  100c4e:	5f                   	pop    %edi
  100c4f:	5d                   	pop    %ebp
  100c50:	c3                   	ret    
  100c51:	8d 76 00             	lea    0x0(%esi),%esi
  100c54:	a3 40 33 10 00       	mov    %eax,0x103340
  100c59:	89 c2                	mov    %eax,%edx
  100c5b:	c1 e2 07             	shl    $0x7,%edx
  100c5e:	01 c2                	add    %eax,%edx
  100c60:	01 d2                	add    %edx,%edx
  100c62:	01 c2                	add    %eax,%edx
  100c64:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c67:	8d 14 d5 00 3d 10 00 	lea    0x103d00(,%edx,8),%edx
  100c6e:	89 82 60 20 00 00    	mov    %eax,0x2060(%edx)
  100c74:	89 82 5c 20 00 00    	mov    %eax,0x205c(%edx)
  100c7a:	eb 96                	jmp    100c12 <put_into_block+0x72>

00100c7c <get_from>:
  100c7c:	55                   	push   %ebp
  100c7d:	89 e5                	mov    %esp,%ebp
  100c7f:	56                   	push   %esi
  100c80:	53                   	push   %ebx
  100c81:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100c84:	8b 45 0c             	mov    0xc(%ebp),%eax
  100c87:	85 db                	test   %ebx,%ebx
  100c89:	0f 8e 01 01 00 00    	jle    100d90 <get_from+0x114>
  100c8f:	39 c3                	cmp    %eax,%ebx
  100c91:	74 42                	je     100cd5 <get_from+0x59>
  100c93:	89 da                	mov    %ebx,%edx
  100c95:	c1 e2 07             	shl    $0x7,%edx
  100c98:	01 da                	add    %ebx,%edx
  100c9a:	01 d2                	add    %edx,%edx
  100c9c:	01 da                	add    %ebx,%edx
  100c9e:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100ca1:	8b 0c d5 60 5d 10 00 	mov    0x105d60(,%edx,8),%ecx
  100ca8:	39 cb                	cmp    %ecx,%ebx
  100caa:	75 25                	jne    100cd1 <get_from+0x55>
  100cac:	e9 df 00 00 00       	jmp    100d90 <get_from+0x114>
  100cb1:	8d 76 00             	lea    0x0(%esi),%esi
  100cb4:	89 ca                	mov    %ecx,%edx
  100cb6:	c1 e2 07             	shl    $0x7,%edx
  100cb9:	01 ca                	add    %ecx,%edx
  100cbb:	01 d2                	add    %edx,%edx
  100cbd:	01 ca                	add    %ecx,%edx
  100cbf:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100cc2:	8b 0c d5 60 5d 10 00 	mov    0x105d60(,%edx,8),%ecx
  100cc9:	39 cb                	cmp    %ecx,%ebx
  100ccb:	0f 84 bf 00 00 00    	je     100d90 <get_from+0x114>
  100cd1:	39 c1                	cmp    %eax,%ecx
  100cd3:	75 df                	jne    100cb4 <get_from+0x38>
  100cd5:	89 c2                	mov    %eax,%edx
  100cd7:	c1 e2 07             	shl    $0x7,%edx
  100cda:	01 c2                	add    %eax,%edx
  100cdc:	01 d2                	add    %edx,%edx
  100cde:	01 c2                	add    %eax,%edx
  100ce0:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100ce3:	8b 04 c5 4c 5d 10 00 	mov    0x105d4c(,%eax,8),%eax
  100cea:	85 c0                	test   %eax,%eax
  100cec:	0f 84 c2 00 00 00    	je     100db4 <get_from+0x138>
  100cf2:	48                   	dec    %eax
  100cf3:	75 7f                	jne    100d74 <get_from+0xf8>
  100cf5:	be 44 33 10 00       	mov    $0x103344,%esi
  100cfa:	3b 1e                	cmp    (%esi),%ebx
  100cfc:	74 15                	je     100d13 <get_from+0x97>
  100cfe:	83 ec 08             	sub    $0x8,%esp
  100d01:	68 bf 00 00 00       	push   $0xbf
  100d06:	68 4a 19 10 00       	push   $0x10194a
  100d0b:	e8 90 0a 00 00       	call   1017a0 <abort>
  100d10:	83 c4 10             	add    $0x10,%esp
  100d13:	89 d8                	mov    %ebx,%eax
  100d15:	c1 e0 07             	shl    $0x7,%eax
  100d18:	01 d8                	add    %ebx,%eax
  100d1a:	01 c0                	add    %eax,%eax
  100d1c:	01 d8                	add    %ebx,%eax
  100d1e:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100d21:	8d 04 c5 00 3d 10 00 	lea    0x103d00(,%eax,8),%eax
  100d28:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100d2e:	39 da                	cmp    %ebx,%edx
  100d30:	0f 84 8a 00 00 00    	je     100dc0 <get_from+0x144>
  100d36:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100d3c:	89 c8                	mov    %ecx,%eax
  100d3e:	c1 e0 07             	shl    $0x7,%eax
  100d41:	01 c8                	add    %ecx,%eax
  100d43:	01 c0                	add    %eax,%eax
  100d45:	01 c8                	add    %ecx,%eax
  100d47:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100d4a:	89 14 c5 60 5d 10 00 	mov    %edx,0x105d60(,%eax,8)
  100d51:	89 d0                	mov    %edx,%eax
  100d53:	c1 e0 07             	shl    $0x7,%eax
  100d56:	01 d0                	add    %edx,%eax
  100d58:	01 c0                	add    %eax,%eax
  100d5a:	01 d0                	add    %edx,%eax
  100d5c:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100d5f:	89 0c c5 5c 5d 10 00 	mov    %ecx,0x105d5c(,%eax,8)
  100d66:	89 16                	mov    %edx,(%esi)
  100d68:	89 d8                	mov    %ebx,%eax
  100d6a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d6d:	5b                   	pop    %ebx
  100d6e:	5e                   	pop    %esi
  100d6f:	5d                   	pop    %ebp
  100d70:	c3                   	ret    
  100d71:	8d 76 00             	lea    0x0(%esi),%esi
  100d74:	83 ec 08             	sub    $0x8,%esp
  100d77:	68 bb 00 00 00       	push   $0xbb
  100d7c:	68 4a 19 10 00       	push   $0x10194a
  100d81:	e8 1a 0a 00 00       	call   1017a0 <abort>
  100d86:	a1 00 00 00 00       	mov    0x0,%eax
  100d8b:	0f 0b                	ud2    
  100d8d:	8d 76 00             	lea    0x0(%esi),%esi
  100d90:	83 ec 08             	sub    $0x8,%esp
  100d93:	68 ac 00 00 00       	push   $0xac
  100d98:	68 4a 19 10 00       	push   $0x10194a
  100d9d:	e8 fe 09 00 00       	call   1017a0 <abort>
  100da2:	83 c4 10             	add    $0x10,%esp
  100da5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100daa:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100dad:	5b                   	pop    %ebx
  100dae:	5e                   	pop    %esi
  100daf:	5d                   	pop    %ebp
  100db0:	c3                   	ret    
  100db1:	8d 76 00             	lea    0x0(%esi),%esi
  100db4:	be 40 33 10 00       	mov    $0x103340,%esi
  100db9:	e9 3c ff ff ff       	jmp    100cfa <get_from+0x7e>
  100dbe:	66 90                	xchg   %ax,%ax
  100dc0:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100dc6:	89 d8                	mov    %ebx,%eax
  100dc8:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100dcb:	5b                   	pop    %ebx
  100dcc:	5e                   	pop    %esi
  100dcd:	5d                   	pop    %ebp
  100dce:	c3                   	ret    
  100dcf:	90                   	nop

00100dd0 <get_from_block>:
  100dd0:	55                   	push   %ebp
  100dd1:	89 e5                	mov    %esp,%ebp
  100dd3:	83 ec 10             	sub    $0x10,%esp
  100dd6:	ff 75 08             	pushl  0x8(%ebp)
  100dd9:	ff 35 40 33 10 00    	pushl  0x103340
  100ddf:	e8 98 fe ff ff       	call   100c7c <get_from>
  100de4:	83 c4 10             	add    $0x10,%esp
  100de7:	40                   	inc    %eax
  100de8:	74 0a                	je     100df4 <get_from_block+0x24>
  100dea:	b8 01 00 00 00       	mov    $0x1,%eax
  100def:	c9                   	leave  
  100df0:	c3                   	ret    
  100df1:	8d 76 00             	lea    0x0(%esi),%esi
  100df4:	83 ec 08             	sub    $0x8,%esp
  100df7:	68 f6 00 00 00       	push   $0xf6
  100dfc:	68 4a 19 10 00       	push   $0x10194a
  100e01:	e8 9a 09 00 00       	call   1017a0 <abort>
  100e06:	83 c4 10             	add    $0x10,%esp
  100e09:	b8 01 00 00 00       	mov    $0x1,%eax
  100e0e:	c9                   	leave  
  100e0f:	c3                   	ret    

00100e10 <check_block>:
  100e10:	55                   	push   %ebp
  100e11:	89 e5                	mov    %esp,%ebp
  100e13:	57                   	push   %edi
  100e14:	56                   	push   %esi
  100e15:	53                   	push   %ebx
  100e16:	83 ec 0c             	sub    $0xc,%esp
  100e19:	a1 40 33 10 00       	mov    0x103340,%eax
  100e1e:	89 c6                	mov    %eax,%esi
  100e20:	83 f8 ff             	cmp    $0xffffffff,%eax
  100e23:	74 58                	je     100e7d <check_block+0x6d>
  100e25:	89 c2                	mov    %eax,%edx
  100e27:	c1 e2 07             	shl    $0x7,%edx
  100e2a:	01 c2                	add    %eax,%edx
  100e2c:	01 d2                	add    %edx,%edx
  100e2e:	01 c2                	add    %eax,%edx
  100e30:	8d 3c 90             	lea    (%eax,%edx,4),%edi
  100e33:	eb 0c                	jmp    100e41 <check_block+0x31>
  100e35:	8d 76 00             	lea    0x0(%esi),%esi
  100e38:	39 c6                	cmp    %eax,%esi
  100e3a:	74 3c                	je     100e78 <check_block+0x68>
  100e3c:	83 f8 ff             	cmp    $0xffffffff,%eax
  100e3f:	74 37                	je     100e78 <check_block+0x68>
  100e41:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
  100e48:	8b 8b 54 5d 10 00    	mov    0x105d54(%ebx),%ecx
  100e4e:	85 c9                	test   %ecx,%ecx
  100e50:	7f e6                	jg     100e38 <check_block+0x28>
  100e52:	83 ec 0c             	sub    $0xc,%esp
  100e55:	56                   	push   %esi
  100e56:	e8 75 ff ff ff       	call   100dd0 <get_from_block>
  100e5b:	58                   	pop    %eax
  100e5c:	5a                   	pop    %edx
  100e5d:	81 c3 00 5d 10 00    	add    $0x105d00,%ebx
  100e63:	53                   	push   %ebx
  100e64:	56                   	push   %esi
  100e65:	e8 06 fc ff ff       	call   100a70 <put_into_runnable>
  100e6a:	83 c4 10             	add    $0x10,%esp
  100e6d:	a1 40 33 10 00       	mov    0x103340,%eax
  100e72:	39 c6                	cmp    %eax,%esi
  100e74:	75 c6                	jne    100e3c <check_block+0x2c>
  100e76:	66 90                	xchg   %ax,%ax
  100e78:	be 01 00 00 00       	mov    $0x1,%esi
  100e7d:	89 f0                	mov    %esi,%eax
  100e7f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100e82:	5b                   	pop    %ebx
  100e83:	5e                   	pop    %esi
  100e84:	5f                   	pop    %edi
  100e85:	5d                   	pop    %ebp
  100e86:	c3                   	ret    
  100e87:	90                   	nop

00100e88 <checkTimeCount>:
  100e88:	a1 e4 3c 10 00       	mov    0x103ce4,%eax
  100e8d:	85 c0                	test   %eax,%eax
  100e8f:	0f 84 cb 00 00 00    	je     100f60 <checkTimeCount+0xd8>
  100e95:	55                   	push   %ebp
  100e96:	89 e5                	mov    %esp,%ebp
  100e98:	57                   	push   %edi
  100e99:	56                   	push   %esi
  100e9a:	83 ec 0c             	sub    $0xc,%esp
  100e9d:	68 6c 18 10 00       	push   $0x10186c
  100ea2:	e8 85 07 00 00       	call   10162c <printk>
  100ea7:	8b 15 e0 3c 10 00    	mov    0x103ce0,%edx
  100ead:	58                   	pop    %eax
  100eae:	59                   	pop    %ecx
  100eaf:	89 d0                	mov    %edx,%eax
  100eb1:	c1 e0 07             	shl    $0x7,%eax
  100eb4:	01 d0                	add    %edx,%eax
  100eb6:	01 c0                	add    %eax,%eax
  100eb8:	01 d0                	add    %edx,%eax
  100eba:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100ebd:	ff 34 c5 50 5d 10 00 	pushl  0x105d50(,%eax,8)
  100ec4:	52                   	push   %edx
  100ec5:	68 30 1a 10 00       	push   $0x101a30
  100eca:	6a 1f                	push   $0x1f
  100ecc:	68 4a 19 10 00       	push   $0x10194a
  100ed1:	68 dc 19 10 00       	push   $0x1019dc
  100ed6:	e8 51 07 00 00       	call   10162c <printk>
  100edb:	83 c4 14             	add    $0x14,%esp
  100ede:	68 9b 18 10 00       	push   $0x10189b
  100ee3:	e8 44 07 00 00       	call   10162c <printk>
  100ee8:	e8 23 ff ff ff       	call   100e10 <check_block>
  100eed:	8b 15 e0 3c 10 00    	mov    0x103ce0,%edx
  100ef3:	89 d0                	mov    %edx,%eax
  100ef5:	c1 e0 07             	shl    $0x7,%eax
  100ef8:	01 d0                	add    %edx,%eax
  100efa:	01 c0                	add    %eax,%eax
  100efc:	01 d0                	add    %edx,%eax
  100efe:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100f01:	c1 e0 03             	shl    $0x3,%eax
  100f04:	83 c4 10             	add    $0x10,%esp
  100f07:	8b b0 50 5d 10 00    	mov    0x105d50(%eax),%esi
  100f0d:	85 f6                	test   %esi,%esi
  100f0f:	7e 0f                	jle    100f20 <checkTimeCount+0x98>
  100f11:	b8 01 00 00 00       	mov    $0x1,%eax
  100f16:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100f19:	5e                   	pop    %esi
  100f1a:	5f                   	pop    %edi
  100f1b:	5d                   	pop    %ebp
  100f1c:	c3                   	ret    
  100f1d:	8d 76 00             	lea    0x0(%esi),%esi
  100f20:	05 00 5d 10 00       	add    $0x105d00,%eax
  100f25:	b9 13 00 00 00       	mov    $0x13,%ecx
  100f2a:	89 c7                	mov    %eax,%edi
  100f2c:	8b 75 08             	mov    0x8(%ebp),%esi
  100f2f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100f31:	83 ec 08             	sub    $0x8,%esp
  100f34:	ff 75 08             	pushl  0x8(%ebp)
  100f37:	52                   	push   %edx
  100f38:	e8 33 fb ff ff       	call   100a70 <put_into_runnable>
  100f3d:	e8 6e fa ff ff       	call   1009b0 <get_from_runnable>
  100f42:	83 c4 10             	add    $0x10,%esp
  100f45:	3b 05 e0 3c 10 00    	cmp    0x103ce0,%eax
  100f4b:	74 c4                	je     100f11 <checkTimeCount+0x89>
  100f4d:	e8 52 f9 ff ff       	call   1008a4 <put_into_running.part.0>
  100f52:	b8 01 00 00 00       	mov    $0x1,%eax
  100f57:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100f5a:	5e                   	pop    %esi
  100f5b:	5f                   	pop    %edi
  100f5c:	5d                   	pop    %ebp
  100f5d:	c3                   	ret    
  100f5e:	66 90                	xchg   %ax,%ax
  100f60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100f65:	c3                   	ret    
  100f66:	66 90                	xchg   %ax,%ax

00100f68 <check_is_in>:
  100f68:	55                   	push   %ebp
  100f69:	89 e5                	mov    %esp,%ebp
  100f6b:	53                   	push   %ebx
  100f6c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100f6f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100f72:	85 c9                	test   %ecx,%ecx
  100f74:	7e 4a                	jle    100fc0 <check_is_in+0x58>
  100f76:	39 d9                	cmp    %ebx,%ecx
  100f78:	74 3b                	je     100fb5 <check_is_in+0x4d>
  100f7a:	89 c8                	mov    %ecx,%eax
  100f7c:	c1 e0 07             	shl    $0x7,%eax
  100f7f:	01 c8                	add    %ecx,%eax
  100f81:	01 c0                	add    %eax,%eax
  100f83:	01 c8                	add    %ecx,%eax
  100f85:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100f88:	8b 14 c5 60 5d 10 00 	mov    0x105d60(,%eax,8),%edx
  100f8f:	39 d1                	cmp    %edx,%ecx
  100f91:	75 1e                	jne    100fb1 <check_is_in+0x49>
  100f93:	eb 2b                	jmp    100fc0 <check_is_in+0x58>
  100f95:	8d 76 00             	lea    0x0(%esi),%esi
  100f98:	89 d0                	mov    %edx,%eax
  100f9a:	c1 e0 07             	shl    $0x7,%eax
  100f9d:	01 d0                	add    %edx,%eax
  100f9f:	01 c0                	add    %eax,%eax
  100fa1:	01 d0                	add    %edx,%eax
  100fa3:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100fa6:	8b 14 c5 60 5d 10 00 	mov    0x105d60(,%eax,8),%edx
  100fad:	39 d1                	cmp    %edx,%ecx
  100faf:	74 0f                	je     100fc0 <check_is_in+0x58>
  100fb1:	39 d3                	cmp    %edx,%ebx
  100fb3:	75 e3                	jne    100f98 <check_is_in+0x30>
  100fb5:	b8 01 00 00 00       	mov    $0x1,%eax
  100fba:	5b                   	pop    %ebx
  100fbb:	5d                   	pop    %ebp
  100fbc:	c3                   	ret    
  100fbd:	8d 76 00             	lea    0x0(%esi),%esi
  100fc0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100fc5:	5b                   	pop    %ebx
  100fc6:	5d                   	pop    %ebp
  100fc7:	c3                   	ret    

00100fc8 <block_decrease>:
  100fc8:	55                   	push   %ebp
  100fc9:	89 e5                	mov    %esp,%ebp
  100fcb:	8b 0d 40 33 10 00    	mov    0x103340,%ecx
  100fd1:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100fd4:	74 2e                	je     101004 <block_decrease+0x3c>
  100fd6:	89 ca                	mov    %ecx,%edx
  100fd8:	89 d0                	mov    %edx,%eax
  100fda:	c1 e0 07             	shl    $0x7,%eax
  100fdd:	01 d0                	add    %edx,%eax
  100fdf:	01 c0                	add    %eax,%eax
  100fe1:	01 d0                	add    %edx,%eax
  100fe3:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100fe6:	8d 04 c5 00 3d 10 00 	lea    0x103d00(,%eax,8),%eax
  100fed:	ff 88 54 20 00 00    	decl   0x2054(%eax)
  100ff3:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100ff9:	39 d1                	cmp    %edx,%ecx
  100ffb:	75 db                	jne    100fd8 <block_decrease+0x10>
  100ffd:	b8 01 00 00 00       	mov    $0x1,%eax
  101002:	5d                   	pop    %ebp
  101003:	c3                   	ret    
  101004:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101009:	5d                   	pop    %ebp
  10100a:	c3                   	ret    
  10100b:	90                   	nop

0010100c <init_pcb>:
  10100c:	55                   	push   %ebp
  10100d:	89 e5                	mov    %esp,%ebp
  10100f:	c7 05 e8 3c 10 00 05 	movl   $0x5,0x103ce8
  101016:	00 00 00 
  101019:	ba 58 5d 10 00       	mov    $0x105d58,%edx
  10101e:	31 c0                	xor    %eax,%eax
  101020:	89 02                	mov    %eax,(%edx)
  101022:	8d 48 ff             	lea    -0x1(%eax),%ecx
  101025:	89 4a 04             	mov    %ecx,0x4(%edx)
  101028:	40                   	inc    %eax
  101029:	89 42 08             	mov    %eax,0x8(%edx)
  10102c:	81 c2 68 20 00 00    	add    $0x2068,%edx
  101032:	3d 00 08 00 00       	cmp    $0x800,%eax
  101037:	75 e7                	jne    101020 <init_pcb+0x14>
  101039:	c7 05 5c 5d 10 00 ff 	movl   $0x7ff,0x105d5c
  101040:	07 00 00 
  101043:	c7 05 f8 7c 13 01 00 	movl   $0x0,0x1137cf8
  10104a:	00 00 00 
  10104d:	5d                   	pop    %ebp
  10104e:	c3                   	ret    
  10104f:	90                   	nop

00101050 <init_kernel_pcb>:
  101050:	55                   	push   %ebp
  101051:	89 e5                	mov    %esp,%ebp
  101053:	c7 05 48 5d 10 00 10 	movl   $0x10,0x105d48
  10105a:	00 00 00 
  10105d:	c7 05 3c 5d 10 00 08 	movl   $0x8,0x105d3c
  101064:	00 00 00 
  101067:	c7 05 0c 5d 10 00 10 	movl   $0x10,0x105d0c
  10106e:	00 00 00 
  101071:	c7 05 08 5d 10 00 10 	movl   $0x10,0x105d08
  101078:	00 00 00 
  10107b:	c7 05 38 5d 10 00 9c 	movl   $0x10089c,0x105d38
  101082:	08 10 00 
  101085:	c7 05 44 5d 10 00 00 	movl   $0x400000,0x105d44
  10108c:	00 40 00 
  10108f:	c7 05 4c 5d 10 00 01 	movl   $0x1,0x105d4c
  101096:	00 00 00 
  101099:	c7 05 50 5d 10 00 04 	movl   $0x4,0x105d50
  1010a0:	00 00 00 
  1010a3:	b8 01 00 00 00       	mov    $0x1,%eax
  1010a8:	5d                   	pop    %ebp
  1010a9:	c3                   	ret    
  1010aa:	66 90                	xchg   %ax,%ax

001010ac <transfer_pid_state>:
  1010ac:	55                   	push   %ebp
  1010ad:	89 e5                	mov    %esp,%ebp
  1010af:	b8 01 00 00 00       	mov    $0x1,%eax
  1010b4:	5d                   	pop    %ebp
  1010b5:	c3                   	ret    
  1010b6:	66 90                	xchg   %ax,%ax

001010b8 <make_pcb>:
  1010b8:	55                   	push   %ebp
  1010b9:	89 e5                	mov    %esp,%ebp
  1010bb:	57                   	push   %edi
  1010bc:	56                   	push   %esi
  1010bd:	8b 55 08             	mov    0x8(%ebp),%edx
  1010c0:	89 d0                	mov    %edx,%eax
  1010c2:	c1 e0 07             	shl    $0x7,%eax
  1010c5:	01 d0                	add    %edx,%eax
  1010c7:	01 c0                	add    %eax,%eax
  1010c9:	01 d0                	add    %edx,%eax
  1010cb:	8d 14 82             	lea    (%edx,%eax,4),%edx
  1010ce:	c1 e2 03             	shl    $0x3,%edx
  1010d1:	8d 82 00 5d 10 00    	lea    0x105d00(%edx),%eax
  1010d7:	b9 13 00 00 00       	mov    $0x13,%ecx
  1010dc:	89 c7                	mov    %eax,%edi
  1010de:	8b 75 0c             	mov    0xc(%ebp),%esi
  1010e1:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1010e3:	8b 45 10             	mov    0x10(%ebp),%eax
  1010e6:	89 82 4c 5d 10 00    	mov    %eax,0x105d4c(%edx)
  1010ec:	8b 45 14             	mov    0x14(%ebp),%eax
  1010ef:	89 82 50 5d 10 00    	mov    %eax,0x105d50(%edx)
  1010f5:	8b 45 18             	mov    0x18(%ebp),%eax
  1010f8:	89 82 54 5d 10 00    	mov    %eax,0x105d54(%edx)
  1010fe:	8b 45 0c             	mov    0xc(%ebp),%eax
  101101:	89 82 64 5d 10 00    	mov    %eax,0x105d64(%edx)
  101107:	b8 01 00 00 00       	mov    $0x1,%eax
  10110c:	5e                   	pop    %esi
  10110d:	5f                   	pop    %edi
  10110e:	5d                   	pop    %ebp
  10110f:	c3                   	ret    

00101110 <initIdt>:
  101110:	55                   	push   %ebp
  101111:	89 e5                	mov    %esp,%ebp
  101113:	53                   	push   %ebx
  101114:	ba 37 18 10 00       	mov    $0x101837,%edx
  101119:	89 d3                	mov    %edx,%ebx
  10111b:	c1 ea 10             	shr    $0x10,%edx
  10111e:	b9 e0 85 13 01       	mov    $0x11385e0,%ecx
  101123:	b8 e0 7d 13 01       	mov    $0x1137de0,%eax
  101128:	66 89 18             	mov    %bx,(%eax)
  10112b:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  101131:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  101135:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  101139:	66 89 50 06          	mov    %dx,0x6(%eax)
  10113d:	83 c0 08             	add    $0x8,%eax
  101140:	39 c1                	cmp    %eax,%ecx
  101142:	75 e4                	jne    101128 <initIdt+0x18>
  101144:	b8 3d 18 10 00       	mov    $0x10183d,%eax
  101149:	66 a3 48 7e 13 01    	mov    %ax,0x1137e48
  10114f:	66 c7 05 4a 7e 13 01 	movw   $0x8,0x1137e4a
  101156:	08 00 
  101158:	c6 05 4c 7e 13 01 00 	movb   $0x0,0x1137e4c
  10115f:	c6 05 4d 7e 13 01 8f 	movb   $0x8f,0x1137e4d
  101166:	c1 e8 10             	shr    $0x10,%eax
  101169:	66 a3 4e 7e 13 01    	mov    %ax,0x1137e4e
  10116f:	b8 41 18 10 00       	mov    $0x101841,%eax
  101174:	66 a3 e0 81 13 01    	mov    %ax,0x11381e0
  10117a:	66 c7 05 e2 81 13 01 	movw   $0x8,0x11381e2
  101181:	08 00 
  101183:	c6 05 e4 81 13 01 00 	movb   $0x0,0x11381e4
  10118a:	c6 05 e5 81 13 01 ee 	movb   $0xee,0x11381e5
  101191:	c1 e8 10             	shr    $0x10,%eax
  101194:	66 a3 e6 81 13 01    	mov    %ax,0x11381e6
  10119a:	b8 4a 18 10 00       	mov    $0x10184a,%eax
  10119f:	66 a3 e0 7e 13 01    	mov    %ax,0x1137ee0
  1011a5:	66 c7 05 e2 7e 13 01 	movw   $0x8,0x1137ee2
  1011ac:	08 00 
  1011ae:	c6 05 e4 7e 13 01 00 	movb   $0x0,0x1137ee4
  1011b5:	c6 05 e5 7e 13 01 8e 	movb   $0x8e,0x1137ee5
  1011bc:	c1 e8 10             	shr    $0x10,%eax
  1011bf:	66 a3 e6 7e 13 01    	mov    %ax,0x1137ee6
  1011c5:	66 c7 05 70 34 10 00 	movw   $0x7ff,0x103470
  1011cc:	ff 07 
  1011ce:	b8 e0 7d 13 01       	mov    $0x1137de0,%eax
  1011d3:	66 a3 72 34 10 00    	mov    %ax,0x103472
  1011d9:	c1 e8 10             	shr    $0x10,%eax
  1011dc:	66 a3 74 34 10 00    	mov    %ax,0x103474
  1011e2:	b8 70 34 10 00       	mov    $0x103470,%eax
  1011e7:	0f 01 18             	lidtl  (%eax)
  1011ea:	5b                   	pop    %ebx
  1011eb:	5d                   	pop    %ebp
  1011ec:	c3                   	ret    
  1011ed:	66 90                	xchg   %ax,%ax
  1011ef:	90                   	nop

001011f0 <syscallHandle>:
  1011f0:	55                   	push   %ebp
  1011f1:	89 e5                	mov    %esp,%ebp
  1011f3:	53                   	push   %ebx
  1011f4:	50                   	push   %eax
  1011f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1011f8:	8b 43 2c             	mov    0x2c(%ebx),%eax
  1011fb:	83 f8 04             	cmp    $0x4,%eax
  1011fe:	74 58                	je     101258 <syscallHandle+0x68>
  101200:	77 1e                	ja     101220 <syscallHandle+0x30>
  101202:	83 f8 01             	cmp    $0x1,%eax
  101205:	74 45                	je     10124c <syscallHandle+0x5c>
  101207:	83 f8 02             	cmp    $0x2,%eax
  10120a:	75 0f                	jne    10121b <syscallHandle+0x2b>
  10120c:	83 ec 0c             	sub    $0xc,%esp
  10120f:	53                   	push   %ebx
  101210:	e8 27 f4 ff ff       	call   10063c <sys_fork>
  101215:	89 43 2c             	mov    %eax,0x2c(%ebx)
  101218:	83 c4 10             	add    $0x10,%esp
  10121b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10121e:	c9                   	leave  
  10121f:	c3                   	ret    
  101220:	83 f8 07             	cmp    $0x7,%eax
  101223:	74 13                	je     101238 <syscallHandle+0x48>
  101225:	3d e6 00 00 00       	cmp    $0xe6,%eax
  10122a:	75 ef                	jne    10121b <syscallHandle+0x2b>
  10122c:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10122f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101232:	c9                   	leave  
  101233:	e9 80 f3 ff ff       	jmp    1005b8 <sys_sleep>
  101238:	83 ec 0c             	sub    $0xc,%esp
  10123b:	53                   	push   %ebx
  10123c:	e8 6b f3 ff ff       	call   1005ac <sys_getpid>
  101241:	89 43 2c             	mov    %eax,0x2c(%ebx)
  101244:	83 c4 10             	add    $0x10,%esp
  101247:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10124a:	c9                   	leave  
  10124b:	c3                   	ret    
  10124c:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10124f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101252:	c9                   	leave  
  101253:	e9 2c f3 ff ff       	jmp    100584 <sys_exit>
  101258:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10125b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10125e:	c9                   	leave  
  10125f:	e9 84 f5 ff ff       	jmp    1007e8 <sys_write>

00101264 <GProtectFaultHandle>:
  101264:	55                   	push   %ebp
  101265:	89 e5                	mov    %esp,%ebp
  101267:	83 ec 14             	sub    $0x14,%esp
  10126a:	68 6c 18 10 00       	push   $0x10186c
  10126f:	e8 b8 03 00 00       	call   10162c <printk>
  101274:	58                   	pop    %eax
  101275:	8b 45 08             	mov    0x8(%ebp),%eax
  101278:	ff 70 30             	pushl  0x30(%eax)
  10127b:	68 c4 1a 10 00       	push   $0x101ac4
  101280:	6a 6c                	push   $0x6c
  101282:	68 51 1a 10 00       	push   $0x101a51
  101287:	68 64 1a 10 00       	push   $0x101a64
  10128c:	e8 9b 03 00 00       	call   10162c <printk>
  101291:	83 c4 14             	add    $0x14,%esp
  101294:	68 9b 18 10 00       	push   $0x10189b
  101299:	e8 8e 03 00 00       	call   10162c <printk>
  10129e:	5a                   	pop    %edx
  10129f:	59                   	pop    %ecx
  1012a0:	6a 6d                	push   $0x6d
  1012a2:	68 51 1a 10 00       	push   $0x101a51
  1012a7:	e8 f4 04 00 00       	call   1017a0 <abort>
  1012ac:	83 c4 10             	add    $0x10,%esp
  1012af:	c9                   	leave  
  1012b0:	c3                   	ret    
  1012b1:	8d 76 00             	lea    0x0(%esi),%esi

001012b4 <timeHandle>:
  1012b4:	55                   	push   %ebp
  1012b5:	89 e5                	mov    %esp,%ebp
  1012b7:	53                   	push   %ebx
  1012b8:	83 ec 10             	sub    $0x10,%esp
  1012bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1012be:	6a 41                	push   $0x41
  1012c0:	e8 bb f5 ff ff       	call   100880 <putChar>
  1012c5:	e8 b6 f6 ff ff       	call   100980 <getpid>
  1012ca:	89 c2                	mov    %eax,%edx
  1012cc:	c1 e2 07             	shl    $0x7,%edx
  1012cf:	01 c2                	add    %eax,%edx
  1012d1:	01 d2                	add    %edx,%edx
  1012d3:	01 c2                	add    %eax,%edx
  1012d5:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1012d8:	ff 0c c5 50 5d 10 00 	decl   0x105d50(,%eax,8)
  1012df:	e8 e4 fc ff ff       	call   100fc8 <block_decrease>
  1012e4:	89 1c 24             	mov    %ebx,(%esp)
  1012e7:	e8 9c fb ff ff       	call   100e88 <checkTimeCount>
  1012ec:	83 c4 10             	add    $0x10,%esp
  1012ef:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  1012f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012f9:	c9                   	leave  
  1012fa:	e9 81 f5 ff ff       	jmp    100880 <putChar>
  1012ff:	90                   	nop

00101300 <irqHandle>:
  101300:	55                   	push   %ebp
  101301:	89 e5                	mov    %esp,%ebp
  101303:	57                   	push   %edi
  101304:	56                   	push   %esi
  101305:	53                   	push   %ebx
  101306:	83 ec 0c             	sub    $0xc,%esp
  101309:	8b 7d 08             	mov    0x8(%ebp),%edi
  10130c:	b8 10 00 00 00       	mov    $0x10,%eax
  101311:	89 c0                	mov    %eax,%eax
  101313:	8e d8                	mov    %eax,%ds
  101315:	8e e0                	mov    %eax,%fs
  101317:	8e c0                	mov    %eax,%es
  101319:	8e d0                	mov    %eax,%ss
  10131b:	b8 30 00 00 00       	mov    $0x30,%eax
  101320:	89 c0                	mov    %eax,%eax
  101322:	8e e8                	mov    %eax,%gs
  101324:	89 ee                	mov    %ebp,%esi
  101326:	3b 7e 08             	cmp    0x8(%esi),%edi
  101329:	74 12                	je     10133d <irqHandle+0x3d>
  10132b:	83 ec 08             	sub    $0x8,%esp
  10132e:	6a 21                	push   $0x21
  101330:	68 51 1a 10 00       	push   $0x101a51
  101335:	e8 66 04 00 00       	call   1017a0 <abort>
  10133a:	83 c4 10             	add    $0x10,%esp
  10133d:	8b 1d e0 3c 10 00    	mov    0x103ce0,%ebx
  101343:	fa                   	cli    
  101344:	8b 47 30             	mov    0x30(%edi),%eax
  101347:	83 f8 0d             	cmp    $0xd,%eax
  10134a:	0f 84 48 01 00 00    	je     101498 <irqHandle+0x198>
  101350:	0f 8e ea 00 00 00    	jle    101440 <irqHandle+0x140>
  101356:	83 f8 20             	cmp    $0x20,%eax
  101359:	74 2d                	je     101388 <irqHandle+0x88>
  10135b:	83 c0 80             	add    $0xffffff80,%eax
  10135e:	0f 85 e3 00 00 00    	jne    101447 <irqHandle+0x147>
  101364:	83 ec 0c             	sub    $0xc,%esp
  101367:	57                   	push   %edi
  101368:	e8 83 fe ff ff       	call   1011f0 <syscallHandle>
  10136d:	8b 47 30             	mov    0x30(%edi),%eax
  101370:	83 c4 10             	add    $0x10,%esp
  101373:	3d 80 00 00 00       	cmp    $0x80,%eax
  101378:	74 26                	je     1013a0 <irqHandle+0xa0>
  10137a:	83 f8 20             	cmp    $0x20,%eax
  10137d:	74 21                	je     1013a0 <irqHandle+0xa0>
  10137f:	fb                   	sti    
  101380:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101383:	5b                   	pop    %ebx
  101384:	5e                   	pop    %esi
  101385:	5f                   	pop    %edi
  101386:	5d                   	pop    %ebp
  101387:	c3                   	ret    
  101388:	83 ec 0c             	sub    $0xc,%esp
  10138b:	57                   	push   %edi
  10138c:	e8 23 ff ff ff       	call   1012b4 <timeHandle>
  101391:	8b 47 30             	mov    0x30(%edi),%eax
  101394:	83 c4 10             	add    $0x10,%esp
  101397:	3d 80 00 00 00       	cmp    $0x80,%eax
  10139c:	75 dc                	jne    10137a <irqHandle+0x7a>
  10139e:	66 90                	xchg   %ax,%ax
  1013a0:	8b 15 e0 3c 10 00    	mov    0x103ce0,%edx
  1013a6:	39 d3                	cmp    %edx,%ebx
  1013a8:	74 d5                	je     10137f <irqHandle+0x7f>
  1013aa:	89 d0                	mov    %edx,%eax
  1013ac:	c1 e0 07             	shl    $0x7,%eax
  1013af:	01 d0                	add    %edx,%eax
  1013b1:	01 c0                	add    %eax,%eax
  1013b3:	01 d0                	add    %edx,%eax
  1013b5:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1013b8:	8d 04 c5 b0 5c 10 00 	lea    0x105cb0(,%eax,8),%eax
  1013bf:	89 46 08             	mov    %eax,0x8(%esi)
  1013c2:	8b 15 e0 3c 10 00    	mov    0x103ce0,%edx
  1013c8:	89 d1                	mov    %edx,%ecx
  1013ca:	c1 e1 07             	shl    $0x7,%ecx
  1013cd:	01 d1                	add    %edx,%ecx
  1013cf:	01 c9                	add    %ecx,%ecx
  1013d1:	01 d1                	add    %edx,%ecx
  1013d3:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  1013d6:	8d 34 cd 00 5d 10 00 	lea    0x105d00(,%ecx,8),%esi
  1013dd:	b9 13 00 00 00       	mov    $0x13,%ecx
  1013e2:	89 c7                	mov    %eax,%edi
  1013e4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1013e6:	85 d2                	test   %edx,%edx
  1013e8:	74 95                	je     10137f <irqHandle+0x7f>
  1013ea:	83 ec 0c             	sub    $0xc,%esp
  1013ed:	68 6c 18 10 00       	push   $0x10186c
  1013f2:	e8 35 02 00 00       	call   10162c <printk>
  1013f7:	58                   	pop    %eax
  1013f8:	5a                   	pop    %edx
  1013f9:	ff 35 e0 3c 10 00    	pushl  0x103ce0
  1013ff:	53                   	push   %ebx
  101400:	68 d8 1a 10 00       	push   $0x101ad8
  101405:	6a 43                	push   $0x43
  101407:	68 51 1a 10 00       	push   $0x101a51
  10140c:	68 a4 1a 10 00       	push   $0x101aa4
  101411:	e8 16 02 00 00       	call   10162c <printk>
  101416:	83 c4 14             	add    $0x14,%esp
  101419:	68 9b 18 10 00       	push   $0x10189b
  10141e:	e8 09 02 00 00       	call   10162c <printk>
  101423:	59                   	pop    %ecx
  101424:	5b                   	pop    %ebx
  101425:	a1 e0 3c 10 00       	mov    0x103ce0,%eax
  10142a:	c1 e0 10             	shl    $0x10,%eax
  10142d:	50                   	push   %eax
  10142e:	6a 23                	push   $0x23
  101430:	e8 ff eb ff ff       	call   100034 <change_gdt>
  101435:	83 c4 10             	add    $0x10,%esp
  101438:	e9 42 ff ff ff       	jmp    10137f <irqHandle+0x7f>
  10143d:	8d 76 00             	lea    0x0(%esi),%esi
  101440:	40                   	inc    %eax
  101441:	0f 84 38 ff ff ff    	je     10137f <irqHandle+0x7f>
  101447:	83 ec 0c             	sub    $0xc,%esp
  10144a:	68 6c 18 10 00       	push   $0x10186c
  10144f:	e8 d8 01 00 00       	call   10162c <printk>
  101454:	58                   	pop    %eax
  101455:	5a                   	pop    %edx
  101456:	ff 77 38             	pushl  0x38(%edi)
  101459:	ff 77 30             	pushl  0x30(%edi)
  10145c:	68 d8 1a 10 00       	push   $0x101ad8
  101461:	6a 37                	push   $0x37
  101463:	68 51 1a 10 00       	push   $0x101a51
  101468:	68 7c 1a 10 00       	push   $0x101a7c
  10146d:	e8 ba 01 00 00       	call   10162c <printk>
  101472:	83 c4 14             	add    $0x14,%esp
  101475:	68 9b 18 10 00       	push   $0x10189b
  10147a:	e8 ad 01 00 00       	call   10162c <printk>
  10147f:	59                   	pop    %ecx
  101480:	58                   	pop    %eax
  101481:	6a 38                	push   $0x38
  101483:	68 51 1a 10 00       	push   $0x101a51
  101488:	e8 13 03 00 00       	call   1017a0 <abort>
  10148d:	8b 47 30             	mov    0x30(%edi),%eax
  101490:	83 c4 10             	add    $0x10,%esp
  101493:	e9 db fe ff ff       	jmp    101373 <irqHandle+0x73>
  101498:	83 ec 0c             	sub    $0xc,%esp
  10149b:	57                   	push   %edi
  10149c:	e8 c3 fd ff ff       	call   101264 <GProtectFaultHandle>
  1014a1:	8b 47 30             	mov    0x30(%edi),%eax
  1014a4:	83 c4 10             	add    $0x10,%esp
  1014a7:	e9 c7 fe ff ff       	jmp    101373 <irqHandle+0x73>

001014ac <initIntr>:
  1014ac:	55                   	push   %ebp
  1014ad:	89 e5                	mov    %esp,%ebp
  1014af:	ba 21 00 00 00       	mov    $0x21,%edx
  1014b4:	b0 ff                	mov    $0xff,%al
  1014b6:	ee                   	out    %al,(%dx)
  1014b7:	ba a1 00 00 00       	mov    $0xa1,%edx
  1014bc:	ee                   	out    %al,(%dx)
  1014bd:	ba 20 00 00 00       	mov    $0x20,%edx
  1014c2:	b0 11                	mov    $0x11,%al
  1014c4:	ee                   	out    %al,(%dx)
  1014c5:	ba 21 00 00 00       	mov    $0x21,%edx
  1014ca:	b0 20                	mov    $0x20,%al
  1014cc:	ee                   	out    %al,(%dx)
  1014cd:	b0 04                	mov    $0x4,%al
  1014cf:	ee                   	out    %al,(%dx)
  1014d0:	b0 03                	mov    $0x3,%al
  1014d2:	ee                   	out    %al,(%dx)
  1014d3:	ba a0 00 00 00       	mov    $0xa0,%edx
  1014d8:	b0 11                	mov    $0x11,%al
  1014da:	ee                   	out    %al,(%dx)
  1014db:	ba a1 00 00 00       	mov    $0xa1,%edx
  1014e0:	b0 28                	mov    $0x28,%al
  1014e2:	ee                   	out    %al,(%dx)
  1014e3:	b0 02                	mov    $0x2,%al
  1014e5:	ee                   	out    %al,(%dx)
  1014e6:	b0 03                	mov    $0x3,%al
  1014e8:	ee                   	out    %al,(%dx)
  1014e9:	ba 20 00 00 00       	mov    $0x20,%edx
  1014ee:	b0 68                	mov    $0x68,%al
  1014f0:	ee                   	out    %al,(%dx)
  1014f1:	b0 0a                	mov    $0xa,%al
  1014f3:	ee                   	out    %al,(%dx)
  1014f4:	ba a0 00 00 00       	mov    $0xa0,%edx
  1014f9:	b0 68                	mov    $0x68,%al
  1014fb:	ee                   	out    %al,(%dx)
  1014fc:	b0 0a                	mov    $0xa,%al
  1014fe:	ee                   	out    %al,(%dx)
  1014ff:	5d                   	pop    %ebp
  101500:	c3                   	ret    
  101501:	8d 76 00             	lea    0x0(%esi),%esi

00101504 <initTimer>:
  101504:	55                   	push   %ebp
  101505:	89 e5                	mov    %esp,%ebp
  101507:	ba 43 00 00 00       	mov    $0x43,%edx
  10150c:	b0 34                	mov    $0x34,%al
  10150e:	ee                   	out    %al,(%dx)
  10150f:	ba 40 00 00 00       	mov    $0x40,%edx
  101514:	b0 9b                	mov    $0x9b,%al
  101516:	ee                   	out    %al,(%dx)
  101517:	b0 2e                	mov    $0x2e,%al
  101519:	ee                   	out    %al,(%dx)
  10151a:	5d                   	pop    %ebp
  10151b:	c3                   	ret    

0010151c <i2A>:
  10151c:	55                   	push   %ebp
  10151d:	89 e5                	mov    %esp,%ebp
  10151f:	57                   	push   %edi
  101520:	56                   	push   %esi
  101521:	53                   	push   %ebx
  101522:	51                   	push   %ecx
  101523:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101526:	85 c9                	test   %ecx,%ecx
  101528:	78 6e                	js     101598 <i2A+0x7c>
  10152a:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  10152e:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  101532:	bb be 34 10 00       	mov    $0x1034be,%ebx
  101537:	31 ff                	xor    %edi,%edi
  101539:	eb 03                	jmp    10153e <i2A+0x22>
  10153b:	90                   	nop
  10153c:	89 f7                	mov    %esi,%edi
  10153e:	4b                   	dec    %ebx
  10153f:	89 c8                	mov    %ecx,%eax
  101541:	be 0a 00 00 00       	mov    $0xa,%esi
  101546:	99                   	cltd   
  101547:	f7 fe                	idiv   %esi
  101549:	83 c2 30             	add    $0x30,%edx
  10154c:	88 13                	mov    %dl,(%ebx)
  10154e:	8d 77 01             	lea    0x1(%edi),%esi
  101551:	b8 67 66 66 66       	mov    $0x66666667,%eax
  101556:	f7 e9                	imul   %ecx
  101558:	89 d0                	mov    %edx,%eax
  10155a:	c1 f8 02             	sar    $0x2,%eax
  10155d:	c1 f9 1f             	sar    $0x1f,%ecx
  101560:	29 c8                	sub    %ecx,%eax
  101562:	89 c1                	mov    %eax,%ecx
  101564:	75 d6                	jne    10153c <i2A+0x20>
  101566:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  10156a:	74 20                	je     10158c <i2A+0x70>
  10156c:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  101570:	75 06                	jne    101578 <i2A+0x5c>
  101572:	fe 05 bd 34 10 00    	incb   0x1034bd
  101578:	c6 05 be 34 10 00 00 	movb   $0x0,0x1034be
  10157f:	8b 45 0c             	mov    0xc(%ebp),%eax
  101582:	89 18                	mov    %ebx,(%eax)
  101584:	89 f0                	mov    %esi,%eax
  101586:	5a                   	pop    %edx
  101587:	5b                   	pop    %ebx
  101588:	5e                   	pop    %esi
  101589:	5f                   	pop    %edi
  10158a:	5d                   	pop    %ebp
  10158b:	c3                   	ret    
  10158c:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  101590:	8d 77 02             	lea    0x2(%edi),%esi
  101593:	4b                   	dec    %ebx
  101594:	eb d6                	jmp    10156c <i2A+0x50>
  101596:	66 90                	xchg   %ax,%ax
  101598:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  10159e:	74 0c                	je     1015ac <i2A+0x90>
  1015a0:	f7 d9                	neg    %ecx
  1015a2:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  1015a6:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  1015aa:	eb 86                	jmp    101532 <i2A+0x16>
  1015ac:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  1015b1:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  1015b5:	eb ef                	jmp    1015a6 <i2A+0x8a>
  1015b7:	90                   	nop

001015b8 <i2X>:
  1015b8:	55                   	push   %ebp
  1015b9:	89 e5                	mov    %esp,%ebp
  1015bb:	57                   	push   %edi
  1015bc:	56                   	push   %esi
  1015bd:	53                   	push   %ebx
  1015be:	8b 55 08             	mov    0x8(%ebp),%edx
  1015c1:	b9 9d 34 10 00       	mov    $0x10349d,%ecx
  1015c6:	31 c0                	xor    %eax,%eax
  1015c8:	40                   	inc    %eax
  1015c9:	89 d6                	mov    %edx,%esi
  1015cb:	83 e6 0f             	and    $0xf,%esi
  1015ce:	8d 5e f6             	lea    -0xa(%esi),%ebx
  1015d1:	89 cf                	mov    %ecx,%edi
  1015d3:	83 fb 05             	cmp    $0x5,%ebx
  1015d6:	77 4c                	ja     101624 <i2X+0x6c>
  1015d8:	ff 24 9d e4 1a 10 00 	jmp    *0x101ae4(,%ebx,4)
  1015df:	90                   	nop
  1015e0:	c6 01 65             	movb   $0x65,(%ecx)
  1015e3:	90                   	nop
  1015e4:	49                   	dec    %ecx
  1015e5:	c1 ea 04             	shr    $0x4,%edx
  1015e8:	75 de                	jne    1015c8 <i2X+0x10>
  1015ea:	c6 05 9e 34 10 00 00 	movb   $0x0,0x10349e
  1015f1:	8b 55 0c             	mov    0xc(%ebp),%edx
  1015f4:	89 3a                	mov    %edi,(%edx)
  1015f6:	5b                   	pop    %ebx
  1015f7:	5e                   	pop    %esi
  1015f8:	5f                   	pop    %edi
  1015f9:	5d                   	pop    %ebp
  1015fa:	c3                   	ret    
  1015fb:	90                   	nop
  1015fc:	c6 01 64             	movb   $0x64,(%ecx)
  1015ff:	eb e3                	jmp    1015e4 <i2X+0x2c>
  101601:	8d 76 00             	lea    0x0(%esi),%esi
  101604:	c6 01 63             	movb   $0x63,(%ecx)
  101607:	eb db                	jmp    1015e4 <i2X+0x2c>
  101609:	8d 76 00             	lea    0x0(%esi),%esi
  10160c:	c6 01 62             	movb   $0x62,(%ecx)
  10160f:	eb d3                	jmp    1015e4 <i2X+0x2c>
  101611:	8d 76 00             	lea    0x0(%esi),%esi
  101614:	c6 01 61             	movb   $0x61,(%ecx)
  101617:	eb cb                	jmp    1015e4 <i2X+0x2c>
  101619:	8d 76 00             	lea    0x0(%esi),%esi
  10161c:	c6 01 66             	movb   $0x66,(%ecx)
  10161f:	eb c3                	jmp    1015e4 <i2X+0x2c>
  101621:	8d 76 00             	lea    0x0(%esi),%esi
  101624:	8d 5e 30             	lea    0x30(%esi),%ebx
  101627:	88 19                	mov    %bl,(%ecx)
  101629:	eb b9                	jmp    1015e4 <i2X+0x2c>
  10162b:	90                   	nop

0010162c <printk>:
  10162c:	55                   	push   %ebp
  10162d:	89 e5                	mov    %esp,%ebp
  10162f:	57                   	push   %edi
  101630:	56                   	push   %esi
  101631:	53                   	push   %ebx
  101632:	83 ec 2c             	sub    $0x2c,%esp
  101635:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101638:	8a 11                	mov    (%ecx),%dl
  10163a:	84 d2                	test   %dl,%dl
  10163c:	0f 84 54 01 00 00    	je     101796 <printk+0x16a>
  101642:	8d 45 0c             	lea    0xc(%ebp),%eax
  101645:	31 ff                	xor    %edi,%edi
  101647:	eb 18                	jmp    101661 <printk+0x35>
  101649:	8d 76 00             	lea    0x0(%esi),%esi
  10164c:	8a 11                	mov    (%ecx),%dl
  10164e:	89 cb                	mov    %ecx,%ebx
  101650:	88 97 c0 34 10 00    	mov    %dl,0x1034c0(%edi)
  101656:	47                   	inc    %edi
  101657:	8d 4b 01             	lea    0x1(%ebx),%ecx
  10165a:	8a 53 01             	mov    0x1(%ebx),%dl
  10165d:	84 d2                	test   %dl,%dl
  10165f:	74 72                	je     1016d3 <printk+0xa7>
  101661:	80 fa 25             	cmp    $0x25,%dl
  101664:	75 e6                	jne    10164c <printk+0x20>
  101666:	8d 59 01             	lea    0x1(%ecx),%ebx
  101669:	8a 51 01             	mov    0x1(%ecx),%dl
  10166c:	80 fa 64             	cmp    $0x64,%dl
  10166f:	0f 84 bf 00 00 00    	je     101734 <printk+0x108>
  101675:	0f 8e 01 01 00 00    	jle    10177c <printk+0x150>
  10167b:	80 fa 73             	cmp    $0x73,%dl
  10167e:	0f 84 84 00 00 00    	je     101708 <printk+0xdc>
  101684:	80 fa 78             	cmp    $0x78,%dl
  101687:	75 c7                	jne    101650 <printk+0x24>
  101689:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  101690:	8d 70 04             	lea    0x4(%eax),%esi
  101693:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101696:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101699:	56                   	push   %esi
  10169a:	ff 30                	pushl  (%eax)
  10169c:	e8 17 ff ff ff       	call   1015b8 <i2X>
  1016a1:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1016a4:	8d b7 c0 34 10 00    	lea    0x1034c0(%edi),%esi
  1016aa:	8a 11                	mov    (%ecx),%dl
  1016ac:	83 c4 08             	add    $0x8,%esp
  1016af:	31 c0                	xor    %eax,%eax
  1016b1:	84 d2                	test   %dl,%dl
  1016b3:	74 0f                	je     1016c4 <printk+0x98>
  1016b5:	8d 76 00             	lea    0x0(%esi),%esi
  1016b8:	40                   	inc    %eax
  1016b9:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1016bd:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  1016c0:	84 d2                	test   %dl,%dl
  1016c2:	75 f4                	jne    1016b8 <printk+0x8c>
  1016c4:	01 c7                	add    %eax,%edi
  1016c6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1016c9:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1016cc:	8a 53 01             	mov    0x1(%ebx),%dl
  1016cf:	84 d2                	test   %dl,%dl
  1016d1:	75 8e                	jne    101661 <printk+0x35>
  1016d3:	c6 87 c0 34 10 00 00 	movb   $0x0,0x1034c0(%edi)
  1016da:	0f be 05 c0 34 10 00 	movsbl 0x1034c0,%eax
  1016e1:	bb c0 34 10 00       	mov    $0x1034c0,%ebx
  1016e6:	84 c0                	test   %al,%al
  1016e8:	74 16                	je     101700 <printk+0xd4>
  1016ea:	66 90                	xchg   %ax,%ax
  1016ec:	83 ec 0c             	sub    $0xc,%esp
  1016ef:	50                   	push   %eax
  1016f0:	e8 8b f1 ff ff       	call   100880 <putChar>
  1016f5:	43                   	inc    %ebx
  1016f6:	0f be 03             	movsbl (%ebx),%eax
  1016f9:	83 c4 10             	add    $0x10,%esp
  1016fc:	84 c0                	test   %al,%al
  1016fe:	75 ec                	jne    1016ec <printk+0xc0>
  101700:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101703:	5b                   	pop    %ebx
  101704:	5e                   	pop    %esi
  101705:	5f                   	pop    %edi
  101706:	5d                   	pop    %ebp
  101707:	c3                   	ret    
  101708:	8d 70 04             	lea    0x4(%eax),%esi
  10170b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10170e:	8b 08                	mov    (%eax),%ecx
  101710:	8d b7 c0 34 10 00    	lea    0x1034c0(%edi),%esi
  101716:	8a 11                	mov    (%ecx),%dl
  101718:	31 c0                	xor    %eax,%eax
  10171a:	84 d2                	test   %dl,%dl
  10171c:	74 a6                	je     1016c4 <printk+0x98>
  10171e:	66 90                	xchg   %ax,%ax
  101720:	40                   	inc    %eax
  101721:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101725:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  101728:	84 d2                	test   %dl,%dl
  10172a:	75 f4                	jne    101720 <printk+0xf4>
  10172c:	01 c7                	add    %eax,%edi
  10172e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101731:	eb 96                	jmp    1016c9 <printk+0x9d>
  101733:	90                   	nop
  101734:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10173b:	8d 70 04             	lea    0x4(%eax),%esi
  10173e:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101741:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101744:	56                   	push   %esi
  101745:	ff 30                	pushl  (%eax)
  101747:	e8 d0 fd ff ff       	call   10151c <i2A>
  10174c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  10174f:	8d b7 c0 34 10 00    	lea    0x1034c0(%edi),%esi
  101755:	8a 11                	mov    (%ecx),%dl
  101757:	83 c4 08             	add    $0x8,%esp
  10175a:	31 c0                	xor    %eax,%eax
  10175c:	84 d2                	test   %dl,%dl
  10175e:	0f 84 60 ff ff ff    	je     1016c4 <printk+0x98>
  101764:	40                   	inc    %eax
  101765:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101769:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  10176c:	84 d2                	test   %dl,%dl
  10176e:	75 f4                	jne    101764 <printk+0x138>
  101770:	01 c7                	add    %eax,%edi
  101772:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101775:	e9 4f ff ff ff       	jmp    1016c9 <printk+0x9d>
  10177a:	66 90                	xchg   %ax,%ax
  10177c:	80 fa 63             	cmp    $0x63,%dl
  10177f:	0f 85 cb fe ff ff    	jne    101650 <printk+0x24>
  101785:	8b 10                	mov    (%eax),%edx
  101787:	88 97 c0 34 10 00    	mov    %dl,0x1034c0(%edi)
  10178d:	83 c0 04             	add    $0x4,%eax
  101790:	47                   	inc    %edi
  101791:	e9 c1 fe ff ff       	jmp    101657 <printk+0x2b>
  101796:	31 ff                	xor    %edi,%edi
  101798:	e9 36 ff ff ff       	jmp    1016d3 <printk+0xa7>
  10179d:	66 90                	xchg   %ax,%ax
  10179f:	90                   	nop

001017a0 <abort>:
  1017a0:	55                   	push   %ebp
  1017a1:	89 e5                	mov    %esp,%ebp
  1017a3:	57                   	push   %edi
  1017a4:	56                   	push   %esi
  1017a5:	53                   	push   %ebx
  1017a6:	83 ec 1c             	sub    $0x1c,%esp
  1017a9:	8b 55 08             	mov    0x8(%ebp),%edx
  1017ac:	fa                   	cli    
  1017ad:	8a 02                	mov    (%edx),%al
  1017af:	b9 72 33 10 00       	mov    $0x103372,%ecx
  1017b4:	84 c0                	test   %al,%al
  1017b6:	74 0b                	je     1017c3 <abort+0x23>
  1017b8:	41                   	inc    %ecx
  1017b9:	42                   	inc    %edx
  1017ba:	88 41 ff             	mov    %al,-0x1(%ecx)
  1017bd:	8a 02                	mov    (%edx),%al
  1017bf:	84 c0                	test   %al,%al
  1017c1:	75 f5                	jne    1017b8 <abort+0x18>
  1017c3:	c6 01 3a             	movb   $0x3a,(%ecx)
  1017c6:	bb dd 3c 10 00       	mov    $0x103cdd,%ebx
  1017cb:	be 0a 00 00 00       	mov    $0xa,%esi
  1017d0:	bf 67 66 66 66       	mov    $0x66666667,%edi
  1017d5:	4b                   	dec    %ebx
  1017d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1017d9:	99                   	cltd   
  1017da:	f7 fe                	idiv   %esi
  1017dc:	8d 42 30             	lea    0x30(%edx),%eax
  1017df:	88 45 e7             	mov    %al,-0x19(%ebp)
  1017e2:	88 03                	mov    %al,(%ebx)
  1017e4:	89 f8                	mov    %edi,%eax
  1017e6:	f7 6d 0c             	imull  0xc(%ebp)
  1017e9:	c1 fa 02             	sar    $0x2,%edx
  1017ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  1017ef:	c1 f8 1f             	sar    $0x1f,%eax
  1017f2:	29 c2                	sub    %eax,%edx
  1017f4:	89 55 0c             	mov    %edx,0xc(%ebp)
  1017f7:	75 dc                	jne    1017d5 <abort+0x35>
  1017f9:	41                   	inc    %ecx
  1017fa:	41                   	inc    %ecx
  1017fb:	43                   	inc    %ebx
  1017fc:	8a 45 e7             	mov    -0x19(%ebp),%al
  1017ff:	88 41 ff             	mov    %al,-0x1(%ecx)
  101802:	8a 03                	mov    (%ebx),%al
  101804:	88 45 e7             	mov    %al,-0x19(%ebp)
  101807:	84 c0                	test   %al,%al
  101809:	75 ef                	jne    1017fa <abort+0x5a>
  10180b:	c6 01 0a             	movb   $0xa,(%ecx)
  10180e:	0f be 05 60 33 10 00 	movsbl 0x103360,%eax
  101815:	84 c0                	test   %al,%al
  101817:	74 1b                	je     101834 <abort+0x94>
  101819:	bb 60 33 10 00       	mov    $0x103360,%ebx
  10181e:	83 ec 0c             	sub    $0xc,%esp
  101821:	50                   	push   %eax
  101822:	e8 59 f0 ff ff       	call   100880 <putChar>
  101827:	43                   	inc    %ebx
  101828:	0f be 03             	movsbl (%ebx),%eax
  10182b:	83 c4 10             	add    $0x10,%esp
  10182e:	84 c0                	test   %al,%al
  101830:	75 ec                	jne    10181e <abort+0x7e>
  101832:	66 90                	xchg   %ax,%ax
  101834:	f4                   	hlt    
  101835:	eb fd                	jmp    101834 <abort+0x94>

00101837 <irqEmpty>:
  101837:	6a 00                	push   $0x0
  101839:	6a ff                	push   $0xffffffff
  10183b:	eb 13                	jmp    101850 <asmDoIrq>

0010183d <irqGProtectFault>:
  10183d:	6a 0d                	push   $0xd
  10183f:	eb 0f                	jmp    101850 <asmDoIrq>

00101841 <irqSyscall>:
  101841:	6a 00                	push   $0x0
  101843:	68 80 00 00 00       	push   $0x80
  101848:	eb 06                	jmp    101850 <asmDoIrq>

0010184a <irqTime>:
  10184a:	6a 00                	push   $0x0
  10184c:	6a 20                	push   $0x20
  10184e:	eb 00                	jmp    101850 <asmDoIrq>

00101850 <asmDoIrq>:
  101850:	60                   	pusha  
  101851:	1e                   	push   %ds
  101852:	06                   	push   %es
  101853:	0f a0                	push   %fs
  101855:	0f a8                	push   %gs
  101857:	54                   	push   %esp
  101858:	e8 a3 fa ff ff       	call   101300 <irqHandle>
  10185d:	5c                   	pop    %esp
  10185e:	0f a9                	pop    %gs
  101860:	0f a1                	pop    %fs
  101862:	07                   	pop    %es
  101863:	1f                   	pop    %ds
  101864:	61                   	popa   
  101865:	83 c4 04             	add    $0x4,%esp
  101868:	83 c4 04             	add    $0x4,%esp
  10186b:	cf                   	iret   
