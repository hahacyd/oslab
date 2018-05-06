
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 99 13 00 00       	call   1013a4 <initTimer>
  10000b:	e8 64 0e 00 00       	call   100e74 <init_pcb>
  100010:	e8 ab 0e 00 00       	call   100ec0 <init_kernel_pcb>
  100015:	e8 72 08 00 00       	call   10088c <initSerial>
  10001a:	e8 81 0f 00 00       	call   100fa0 <initIdt>
  10001f:	e8 28 13 00 00       	call   10134c <initIntr>
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
  10005f:	66 c7 05 20 7a 13 01 	movw   $0xffff,0x1137a20
  100066:	ff ff 
  100068:	66 a3 22 7a 13 01    	mov    %ax,0x1137a22
  10006e:	89 c2                	mov    %eax,%edx
  100070:	c1 ea 10             	shr    $0x10,%edx
  100073:	88 15 24 7a 13 01    	mov    %dl,0x1137a24
  100079:	c6 05 25 7a 13 01 f2 	movb   $0xf2,0x1137a25
  100080:	c6 05 26 7a 13 01 cf 	movb   $0xcf,0x1137a26
  100087:	c1 e8 18             	shr    $0x18,%eax
  10008a:	a2 27 7a 13 01       	mov    %al,0x1137a27
  10008f:	66 c7 05 60 31 10 00 	movw   $0x4f,0x103160
  100096:	4f 00 
  100098:	b8 00 7a 13 01       	mov    $0x1137a00,%eax
  10009d:	66 a3 62 31 10 00    	mov    %ax,0x103162
  1000a3:	c1 e8 10             	shr    $0x10,%eax
  1000a6:	66 a3 64 31 10 00    	mov    %ax,0x103164
  1000ac:	b8 60 31 10 00       	mov    $0x103160,%eax
  1000b1:	0f 01 10             	lgdtl  (%eax)
  1000b4:	b8 01 00 00 00       	mov    $0x1,%eax
  1000b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000bc:	c9                   	leave  
  1000bd:	c3                   	ret    
  1000be:	66 90                	xchg   %ax,%ax
  1000c0:	66 c7 05 18 7a 13 01 	movw   $0xffff,0x1137a18
  1000c7:	ff ff 
  1000c9:	66 a3 1a 7a 13 01    	mov    %ax,0x1137a1a
  1000cf:	89 c2                	mov    %eax,%edx
  1000d1:	c1 ea 10             	shr    $0x10,%edx
  1000d4:	88 15 1c 7a 13 01    	mov    %dl,0x1137a1c
  1000da:	c6 05 1d 7a 13 01 fa 	movb   $0xfa,0x1137a1d
  1000e1:	c6 05 1e 7a 13 01 cf 	movb   $0xcf,0x1137a1e
  1000e8:	c1 e8 18             	shr    $0x18,%eax
  1000eb:	a2 1f 7a 13 01       	mov    %al,0x1137a1f
  1000f0:	eb 9d                	jmp    10008f <change_gdt+0x5b>
  1000f2:	66 90                	xchg   %ax,%ax
  1000f4:	83 fb 01             	cmp    $0x1,%ebx
  1000f7:	75 37                	jne    100130 <change_gdt+0xfc>
  1000f9:	66 c7 05 08 7a 13 01 	movw   $0xffff,0x1137a08
  100100:	ff ff 
  100102:	66 a3 0a 7a 13 01    	mov    %ax,0x1137a0a
  100108:	89 c2                	mov    %eax,%edx
  10010a:	c1 ea 10             	shr    $0x10,%edx
  10010d:	88 15 0c 7a 13 01    	mov    %dl,0x1137a0c
  100113:	c6 05 0d 7a 13 01 9a 	movb   $0x9a,0x1137a0d
  10011a:	c6 05 0e 7a 13 01 cf 	movb   $0xcf,0x1137a0e
  100121:	c1 e8 18             	shr    $0x18,%eax
  100124:	a2 0f 7a 13 01       	mov    %al,0x1137a0f
  100129:	e9 61 ff ff ff       	jmp    10008f <change_gdt+0x5b>
  10012e:	66 90                	xchg   %ax,%ax
  100130:	83 ec 0c             	sub    $0xc,%esp
  100133:	68 0c 17 10 00       	push   $0x10170c
  100138:	e8 8f 13 00 00       	call   1014cc <printk>
  10013d:	89 1c 24             	mov    %ebx,(%esp)
  100140:	68 4c 17 10 00       	push   $0x10174c
  100145:	6a 17                	push   $0x17
  100147:	68 12 17 10 00       	push   $0x101712
  10014c:	68 1f 17 10 00       	push   $0x10171f
  100151:	e8 76 13 00 00       	call   1014cc <printk>
  100156:	83 c4 14             	add    $0x14,%esp
  100159:	68 3b 17 10 00       	push   $0x10173b
  10015e:	e8 69 13 00 00       	call   1014cc <printk>
  100163:	58                   	pop    %eax
  100164:	5a                   	pop    %edx
  100165:	6a 18                	push   $0x18
  100167:	68 12 17 10 00       	push   $0x101712
  10016c:	e8 cf 14 00 00       	call   101640 <abort>
  100171:	83 c4 10             	add    $0x10,%esp
  100174:	e9 16 ff ff ff       	jmp    10008f <change_gdt+0x5b>
  100179:	8d 76 00             	lea    0x0(%esi),%esi
  10017c:	66 c7 05 10 7a 13 01 	movw   $0xffff,0x1137a10
  100183:	ff ff 
  100185:	66 a3 12 7a 13 01    	mov    %ax,0x1137a12
  10018b:	89 c2                	mov    %eax,%edx
  10018d:	c1 ea 10             	shr    $0x10,%edx
  100190:	88 15 14 7a 13 01    	mov    %dl,0x1137a14
  100196:	c6 05 15 7a 13 01 92 	movb   $0x92,0x1137a15
  10019d:	c6 05 16 7a 13 01 cf 	movb   $0xcf,0x1137a16
  1001a4:	c1 e8 18             	shr    $0x18,%eax
  1001a7:	a2 17 7a 13 01       	mov    %al,0x1137a17
  1001ac:	e9 de fe ff ff       	jmp    10008f <change_gdt+0x5b>
  1001b1:	8d 76 00             	lea    0x0(%esi),%esi

001001b4 <change_tss>:
  1001b4:	55                   	push   %ebp
  1001b5:	89 e5                	mov    %esp,%ebp
  1001b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1001ba:	a3 68 7a 13 01       	mov    %eax,0x1137a68
  1001bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1001c2:	a3 64 7a 13 01       	mov    %eax,0x1137a64
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
  1001d8:	be 60 7a 13 01       	mov    $0x1137a60,%esi
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
  10027b:	b9 00 7a 13 01       	mov    $0x1137a00,%ecx
  100280:	66 c7 05 08 7a 13 01 	movw   $0xffff,0x1137a08
  100287:	ff ff 
  100289:	66 c7 05 0a 7a 13 01 	movw   $0x0,0x1137a0a
  100290:	00 00 
  100292:	c6 05 0c 7a 13 01 00 	movb   $0x0,0x1137a0c
  100299:	c6 05 0d 7a 13 01 9a 	movb   $0x9a,0x1137a0d
  1002a0:	c6 05 0e 7a 13 01 cf 	movb   $0xcf,0x1137a0e
  1002a7:	c6 05 0f 7a 13 01 00 	movb   $0x0,0x1137a0f
  1002ae:	66 c7 05 10 7a 13 01 	movw   $0xffff,0x1137a10
  1002b5:	ff ff 
  1002b7:	66 c7 05 12 7a 13 01 	movw   $0x0,0x1137a12
  1002be:	00 00 
  1002c0:	c6 05 14 7a 13 01 00 	movb   $0x0,0x1137a14
  1002c7:	c6 05 15 7a 13 01 92 	movb   $0x92,0x1137a15
  1002ce:	c6 05 16 7a 13 01 cf 	movb   $0xcf,0x1137a16
  1002d5:	c6 05 17 7a 13 01 00 	movb   $0x0,0x1137a17
  1002dc:	66 c7 05 18 7a 13 01 	movw   $0xffff,0x1137a18
  1002e3:	ff ff 
  1002e5:	66 c7 05 1a 7a 13 01 	movw   $0x0,0x1137a1a
  1002ec:	00 00 
  1002ee:	c6 05 1c 7a 13 01 00 	movb   $0x0,0x1137a1c
  1002f5:	c6 05 1d 7a 13 01 fa 	movb   $0xfa,0x1137a1d
  1002fc:	c6 05 1e 7a 13 01 cf 	movb   $0xcf,0x1137a1e
  100303:	c6 05 1f 7a 13 01 00 	movb   $0x0,0x1137a1f
  10030a:	66 c7 05 20 7a 13 01 	movw   $0xffff,0x1137a20
  100311:	ff ff 
  100313:	66 c7 05 22 7a 13 01 	movw   $0x0,0x1137a22
  10031a:	00 00 
  10031c:	c6 05 24 7a 13 01 00 	movb   $0x0,0x1137a24
  100323:	c6 05 25 7a 13 01 f2 	movb   $0xf2,0x1137a25
  10032a:	c6 05 26 7a 13 01 cf 	movb   $0xcf,0x1137a26
  100331:	c6 05 27 7a 13 01 00 	movb   $0x0,0x1137a27
  100338:	66 c7 05 28 7a 13 01 	movw   $0x63,0x1137a28
  10033f:	63 00 
  100341:	b8 60 7a 13 01       	mov    $0x1137a60,%eax
  100346:	66 a3 2a 7a 13 01    	mov    %ax,0x1137a2a
  10034c:	89 c2                	mov    %eax,%edx
  10034e:	c1 ea 10             	shr    $0x10,%edx
  100351:	88 15 2c 7a 13 01    	mov    %dl,0x1137a2c
  100357:	c6 05 2d 7a 13 01 89 	movb   $0x89,0x1137a2d
  10035e:	c6 05 2e 7a 13 01 40 	movb   $0x40,0x1137a2e
  100365:	c1 e8 18             	shr    $0x18,%eax
  100368:	a2 2f 7a 13 01       	mov    %al,0x1137a2f
  10036d:	a1 44 17 10 00       	mov    0x101744,%eax
  100372:	8b 15 48 17 10 00    	mov    0x101748,%edx
  100378:	a3 30 7a 13 01       	mov    %eax,0x1137a30
  10037d:	89 15 34 7a 13 01    	mov    %edx,0x1137a34
  100383:	66 c7 05 40 7a 13 01 	movw   $0xffff,0x1137a40
  10038a:	ff ff 
  10038c:	66 c7 05 42 7a 13 01 	movw   $0x0,0x1137a42
  100393:	00 00 
  100395:	c6 05 44 7a 13 01 00 	movb   $0x0,0x1137a44
  10039c:	c6 05 45 7a 13 01 f2 	movb   $0xf2,0x1137a45
  1003a3:	c6 05 46 7a 13 01 cf 	movb   $0xcf,0x1137a46
  1003aa:	c6 05 47 7a 13 01 00 	movb   $0x0,0x1137a47
  1003b1:	66 c7 05 60 31 10 00 	movw   $0x4f,0x103160
  1003b8:	4f 00 
  1003ba:	66 89 0d 62 31 10 00 	mov    %cx,0x103162
  1003c1:	c1 e9 10             	shr    $0x10,%ecx
  1003c4:	66 89 0d 64 31 10 00 	mov    %cx,0x103164
  1003cb:	b8 60 31 10 00       	mov    $0x103160,%eax
  1003d0:	0f 01 10             	lgdtl  (%eax)
  1003d3:	a1 48 5a 10 00       	mov    0x105a48,%eax
  1003d8:	a3 68 7a 13 01       	mov    %eax,0x1137a68
  1003dd:	c7 05 64 7a 13 01 fc 	movl   $0x1059fc,0x1137a64
  1003e4:	59 10 00 
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
  100431:	8d 04 c5 00 3a 10 00 	lea    0x103a00(,%eax,8),%eax
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
  100460:	c7 05 e4 39 10 00 01 	movl   $0x1,0x1039e4
  100467:	00 00 00 
  10046a:	e8 49 08 00 00       	call   100cb8 <apply_new_pid>
  10046f:	89 c6                	mov    %eax,%esi
  100471:	48                   	dec    %eax
  100472:	74 15                	je     100489 <enterUserSpace+0x31>
  100474:	83 ec 08             	sub    $0x8,%esp
  100477:	68 87 00 00 00       	push   $0x87
  10047c:	68 12 17 10 00       	push   $0x101712
  100481:	e8 ba 11 00 00       	call   101640 <abort>
  100486:	83 c4 10             	add    $0x10,%esp
  100489:	89 f0                	mov    %esi,%eax
  10048b:	c1 e0 07             	shl    $0x7,%eax
  10048e:	01 f0                	add    %esi,%eax
  100490:	01 c0                	add    %eax,%eax
  100492:	01 f0                	add    %esi,%eax
  100494:	8d 14 86             	lea    (%esi,%eax,4),%edx
  100497:	c1 e2 03             	shl    $0x3,%edx
  10049a:	c7 82 48 5a 10 00 23 	movl   $0x23,0x105a48(%edx)
  1004a1:	00 00 00 
  1004a4:	c7 82 3c 5a 10 00 1b 	movl   $0x1b,0x105a3c(%edx)
  1004ab:	00 00 00 
  1004ae:	c7 82 0c 5a 10 00 23 	movl   $0x23,0x105a0c(%edx)
  1004b5:	00 00 00 
  1004b8:	c7 82 08 5a 10 00 23 	movl   $0x23,0x105a08(%edx)
  1004bf:	00 00 00 
  1004c2:	c7 82 04 5a 10 00 23 	movl   $0x23,0x105a04(%edx)
  1004c9:	00 00 00 
  1004cc:	c7 82 44 5a 10 00 00 	movl   $0x400000,0x105a44(%edx)
  1004d3:	00 40 00 
  1004d6:	89 9a 38 5a 10 00    	mov    %ebx,0x105a38(%edx)
  1004dc:	c7 82 50 5a 10 00 0a 	movl   $0xa,0x105a50(%edx)
  1004e3:	00 00 00 
  1004e6:	83 ec 08             	sub    $0x8,%esp
  1004e9:	81 c2 00 5a 10 00    	add    $0x105a00,%edx
  1004ef:	52                   	push   %edx
  1004f0:	56                   	push   %esi
  1004f1:	e8 7a 05 00 00       	call   100a70 <put_into_runnable>
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
  1005e3:	83 ec 08             	sub    $0x8,%esp
  1005e6:	e8 49 03 00 00       	call   100934 <getpid>
  1005eb:	83 ec 0c             	sub    $0xc,%esp
  1005ee:	50                   	push   %eax
  1005ef:	e8 68 04 00 00       	call   100a5c <put_into_empty>
  1005f4:	e8 d3 06 00 00       	call   100ccc <get_from_runnable>
  1005f9:	5a                   	pop    %edx
  1005fa:	59                   	pop    %ecx
  1005fb:	ff 75 08             	pushl  0x8(%ebp)
  1005fe:	50                   	push   %eax
  1005ff:	e8 ec 02 00 00       	call   1008f0 <put_into_running>
  100604:	b8 01 00 00 00       	mov    $0x1,%eax
  100609:	c9                   	leave  
  10060a:	c3                   	ret    
  10060b:	90                   	nop

0010060c <sys_getpid>:
  10060c:	55                   	push   %ebp
  10060d:	89 e5                	mov    %esp,%ebp
  10060f:	5d                   	pop    %ebp
  100610:	e9 1f 03 00 00       	jmp    100934 <getpid>
  100615:	66 90                	xchg   %ax,%ax
  100617:	90                   	nop

00100618 <sys_sleep>:
  100618:	55                   	push   %ebp
  100619:	89 e5                	mov    %esp,%ebp
  10061b:	53                   	push   %ebx
  10061c:	50                   	push   %eax
  10061d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100620:	e8 0f 03 00 00       	call   100934 <getpid>
  100625:	83 ec 08             	sub    $0x8,%esp
  100628:	53                   	push   %ebx
  100629:	50                   	push   %eax
  10062a:	e8 95 04 00 00       	call   100ac4 <put_into_block>
  10062f:	e8 98 06 00 00       	call   100ccc <get_from_runnable>
  100634:	5a                   	pop    %edx
  100635:	59                   	pop    %ecx
  100636:	53                   	push   %ebx
  100637:	50                   	push   %eax
  100638:	e8 b3 02 00 00       	call   1008f0 <put_into_running>
  10063d:	b8 01 00 00 00       	mov    $0x1,%eax
  100642:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100645:	c9                   	leave  
  100646:	c3                   	ret    
  100647:	90                   	nop

00100648 <sys_fork>:
  100648:	55                   	push   %ebp
  100649:	89 e5                	mov    %esp,%ebp
  10064b:	57                   	push   %edi
  10064c:	56                   	push   %esi
  10064d:	53                   	push   %ebx
  10064e:	83 ec 1c             	sub    $0x1c,%esp
  100651:	e8 62 06 00 00       	call   100cb8 <apply_new_pid>
  100656:	89 c7                	mov    %eax,%edi
  100658:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10065b:	c1 e0 07             	shl    $0x7,%eax
  10065e:	01 f8                	add    %edi,%eax
  100660:	01 c0                	add    %eax,%eax
  100662:	01 f8                	add    %edi,%eax
  100664:	8d 3c 87             	lea    (%edi,%eax,4),%edi
  100667:	c1 e7 03             	shl    $0x3,%edi
  10066a:	31 f6                	xor    %esi,%esi
  10066c:	e8 c3 02 00 00       	call   100934 <getpid>
  100671:	89 c2                	mov    %eax,%edx
  100673:	c1 e2 07             	shl    $0x7,%edx
  100676:	01 c2                	add    %eax,%edx
  100678:	01 d2                	add    %edx,%edx
  10067a:	01 c2                	add    %eax,%edx
  10067c:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10067f:	01 c0                	add    %eax,%eax
  100681:	01 f0                	add    %esi,%eax
  100683:	8b 04 85 00 3a 10 00 	mov    0x103a00(,%eax,4),%eax
  10068a:	89 84 b7 00 3a 10 00 	mov    %eax,0x103a00(%edi,%esi,4)
  100691:	46                   	inc    %esi
  100692:	81 fe 00 08 00 00    	cmp    $0x800,%esi
  100698:	75 d2                	jne    10066c <sys_fork+0x24>
  10069a:	e8 95 02 00 00       	call   100934 <getpid>
  10069f:	8d 50 40             	lea    0x40(%eax),%edx
  1006a2:	c1 e2 10             	shl    $0x10,%edx
  1006a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a8:	8d 48 40             	lea    0x40(%eax),%ecx
  1006ab:	c1 e1 10             	shl    $0x10,%ecx
  1006ae:	b8 00 00 01 00       	mov    $0x10000,%eax
  1006b3:	90                   	nop
  1006b4:	8a 9c 10 00 00 ff ff 	mov    -0x10000(%eax,%edx,1),%bl
  1006bb:	88 9c 08 00 00 ff ff 	mov    %bl,-0x10000(%eax,%ecx,1)
  1006c2:	48                   	dec    %eax
  1006c3:	75 ef                	jne    1006b4 <sys_fork+0x6c>
  1006c5:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
  1006c8:	89 d8                	mov    %ebx,%eax
  1006ca:	c1 e0 07             	shl    $0x7,%eax
  1006cd:	01 d8                	add    %ebx,%eax
  1006cf:	01 c0                	add    %eax,%eax
  1006d1:	01 d8                	add    %ebx,%eax
  1006d3:	8d 14 83             	lea    (%ebx,%eax,4),%edx
  1006d6:	c1 e2 03             	shl    $0x3,%edx
  1006d9:	8d 82 00 5a 10 00    	lea    0x105a00(%edx),%eax
  1006df:	b9 13 00 00 00       	mov    $0x13,%ecx
  1006e4:	89 c7                	mov    %eax,%edi
  1006e6:	8b 75 08             	mov    0x8(%ebp),%esi
  1006e9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1006eb:	c7 82 2c 5a 10 00 00 	movl   $0x0,0x105a2c(%edx)
  1006f2:	00 00 00 
  1006f5:	83 ec 08             	sub    $0x8,%esp
  1006f8:	50                   	push   %eax
  1006f9:	53                   	push   %ebx
  1006fa:	e8 71 03 00 00       	call   100a70 <put_into_runnable>
  1006ff:	89 d8                	mov    %ebx,%eax
  100701:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100704:	5b                   	pop    %ebx
  100705:	5e                   	pop    %esi
  100706:	5f                   	pop    %edi
  100707:	5d                   	pop    %ebp
  100708:	c3                   	ret    
  100709:	66 90                	xchg   %ax,%ax
  10070b:	90                   	nop

0010070c <display>:
  10070c:	55                   	push   %ebp
  10070d:	89 e5                	mov    %esp,%ebp
  10070f:	57                   	push   %edi
  100710:	53                   	push   %ebx
  100711:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100714:	80 fb 0a             	cmp    $0xa,%bl
  100717:	74 5b                	je     100774 <display+0x68>
  100719:	8b 15 68 31 10 00    	mov    0x103168,%edx
  10071f:	8b 0d 6c 31 10 00    	mov    0x10316c,%ecx
  100725:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  100728:	c1 e0 04             	shl    $0x4,%eax
  10072b:	01 d0                	add    %edx,%eax
  10072d:	01 c0                	add    %eax,%eax
  10072f:	89 c7                	mov    %eax,%edi
  100731:	0f be db             	movsbl %bl,%ebx
  100734:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
  10073a:	66 89 d8             	mov    %bx,%ax
  10073d:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100741:	42                   	inc    %edx
  100742:	83 fa 50             	cmp    $0x50,%edx
  100745:	75 1d                	jne    100764 <display+0x58>
  100747:	c7 05 68 31 10 00 00 	movl   $0x0,0x103168
  10074e:	00 00 00 
  100751:	41                   	inc    %ecx
  100752:	89 0d 6c 31 10 00    	mov    %ecx,0x10316c
  100758:	b8 01 00 00 00       	mov    $0x1,%eax
  10075d:	5b                   	pop    %ebx
  10075e:	5f                   	pop    %edi
  10075f:	5d                   	pop    %ebp
  100760:	c3                   	ret    
  100761:	8d 76 00             	lea    0x0(%esi),%esi
  100764:	89 15 68 31 10 00    	mov    %edx,0x103168
  10076a:	b8 01 00 00 00       	mov    $0x1,%eax
  10076f:	5b                   	pop    %ebx
  100770:	5f                   	pop    %edi
  100771:	5d                   	pop    %ebp
  100772:	c3                   	ret    
  100773:	90                   	nop
  100774:	c7 05 68 31 10 00 00 	movl   $0x0,0x103168
  10077b:	00 00 00 
  10077e:	ff 05 6c 31 10 00    	incl   0x10316c
  100784:	b8 01 00 00 00       	mov    $0x1,%eax
  100789:	5b                   	pop    %ebx
  10078a:	5f                   	pop    %edi
  10078b:	5d                   	pop    %ebp
  10078c:	c3                   	ret    
  10078d:	8d 76 00             	lea    0x0(%esi),%esi

00100790 <printkernel>:
  100790:	55                   	push   %ebp
  100791:	89 e5                	mov    %esp,%ebp
  100793:	56                   	push   %esi
  100794:	53                   	push   %ebx
  100795:	8b 75 08             	mov    0x8(%ebp),%esi
  100798:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  10079b:	85 db                	test   %ebx,%ebx
  10079d:	7e 20                	jle    1007bf <printkernel+0x2f>
  10079f:	0f be 06             	movsbl (%esi),%eax
  1007a2:	84 c0                	test   %al,%al
  1007a4:	74 19                	je     1007bf <printkernel+0x2f>
  1007a6:	01 f3                	add    %esi,%ebx
  1007a8:	eb 09                	jmp    1007b3 <printkernel+0x23>
  1007aa:	66 90                	xchg   %ax,%ax
  1007ac:	0f be 06             	movsbl (%esi),%eax
  1007af:	84 c0                	test   %al,%al
  1007b1:	74 0c                	je     1007bf <printkernel+0x2f>
  1007b3:	50                   	push   %eax
  1007b4:	e8 53 ff ff ff       	call   10070c <display>
  1007b9:	46                   	inc    %esi
  1007ba:	58                   	pop    %eax
  1007bb:	39 f3                	cmp    %esi,%ebx
  1007bd:	75 ed                	jne    1007ac <printkernel+0x1c>
  1007bf:	b8 01 00 00 00       	mov    $0x1,%eax
  1007c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1007c7:	5b                   	pop    %ebx
  1007c8:	5e                   	pop    %esi
  1007c9:	5d                   	pop    %ebp
  1007ca:	c3                   	ret    
  1007cb:	90                   	nop

001007cc <fs_write>:
  1007cc:	55                   	push   %ebp
  1007cd:	89 e5                	mov    %esp,%ebp
  1007cf:	57                   	push   %edi
  1007d0:	56                   	push   %esi
  1007d1:	53                   	push   %ebx
  1007d2:	83 ec 0c             	sub    $0xc,%esp
  1007d5:	8b 7d 0c             	mov    0xc(%ebp),%edi
  1007d8:	8b 75 10             	mov    0x10(%ebp),%esi
  1007db:	ba 30 00 00 00       	mov    $0x30,%edx
  1007e0:	89 d0                	mov    %edx,%eax
  1007e2:	8e e8                	mov    %eax,%gs
  1007e4:	8b 45 08             	mov    0x8(%ebp),%eax
  1007e7:	48                   	dec    %eax
  1007e8:	83 f8 01             	cmp    $0x1,%eax
  1007eb:	76 12                	jbe    1007ff <fs_write+0x33>
  1007ed:	83 ec 08             	sub    $0x8,%esp
  1007f0:	6a 27                	push   $0x27
  1007f2:	68 57 17 10 00       	push   $0x101757
  1007f7:	e8 44 0e 00 00       	call   101640 <abort>
  1007fc:	83 c4 10             	add    $0x10,%esp
  1007ff:	85 f6                	test   %esi,%esi
  100801:	7e 25                	jle    100828 <fs_write+0x5c>
  100803:	0f be 07             	movsbl (%edi),%eax
  100806:	84 c0                	test   %al,%al
  100808:	74 1e                	je     100828 <fs_write+0x5c>
  10080a:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
  10080d:	eb 08                	jmp    100817 <fs_write+0x4b>
  10080f:	90                   	nop
  100810:	0f be 07             	movsbl (%edi),%eax
  100813:	84 c0                	test   %al,%al
  100815:	74 11                	je     100828 <fs_write+0x5c>
  100817:	83 ec 0c             	sub    $0xc,%esp
  10081a:	50                   	push   %eax
  10081b:	e8 ec fe ff ff       	call   10070c <display>
  100820:	47                   	inc    %edi
  100821:	83 c4 10             	add    $0x10,%esp
  100824:	39 fb                	cmp    %edi,%ebx
  100826:	75 e8                	jne    100810 <fs_write+0x44>
  100828:	89 f0                	mov    %esi,%eax
  10082a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10082d:	5b                   	pop    %ebx
  10082e:	5e                   	pop    %esi
  10082f:	5f                   	pop    %edi
  100830:	5d                   	pop    %ebp
  100831:	c3                   	ret    
  100832:	66 90                	xchg   %ax,%ax

00100834 <sys_write>:
  100834:	55                   	push   %ebp
  100835:	89 e5                	mov    %esp,%ebp
  100837:	56                   	push   %esi
  100838:	53                   	push   %ebx
  100839:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10083c:	8b 73 24             	mov    0x24(%ebx),%esi
  10083f:	e8 f0 00 00 00       	call   100934 <getpid>
  100844:	52                   	push   %edx
  100845:	56                   	push   %esi
  100846:	c1 e0 10             	shl    $0x10,%eax
  100849:	03 43 28             	add    0x28(%ebx),%eax
  10084c:	50                   	push   %eax
  10084d:	ff 73 20             	pushl  0x20(%ebx)
  100850:	e8 77 ff ff ff       	call   1007cc <fs_write>
  100855:	89 43 2c             	mov    %eax,0x2c(%ebx)
  100858:	83 c4 10             	add    $0x10,%esp
  10085b:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10085e:	5b                   	pop    %ebx
  10085f:	5e                   	pop    %esi
  100860:	5d                   	pop    %ebp
  100861:	c3                   	ret    
  100862:	66 90                	xchg   %ax,%ax

00100864 <print_char>:
  100864:	55                   	push   %ebp
  100865:	89 e5                	mov    %esp,%ebp
  100867:	57                   	push   %edi
  100868:	8b 45 08             	mov    0x8(%ebp),%eax
  10086b:	8d 04 80             	lea    (%eax,%eax,4),%eax
  10086e:	c1 e0 04             	shl    $0x4,%eax
  100871:	03 45 0c             	add    0xc(%ebp),%eax
  100874:	01 c0                	add    %eax,%eax
  100876:	89 c7                	mov    %eax,%edi
  100878:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  10087c:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  100882:	66 89 d0             	mov    %dx,%ax
  100885:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100889:	5f                   	pop    %edi
  10088a:	5d                   	pop    %ebp
  10088b:	c3                   	ret    

0010088c <initSerial>:
  10088c:	55                   	push   %ebp
  10088d:	89 e5                	mov    %esp,%ebp
  10088f:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100894:	31 c0                	xor    %eax,%eax
  100896:	ee                   	out    %al,(%dx)
  100897:	ba fb 03 00 00       	mov    $0x3fb,%edx
  10089c:	b0 80                	mov    $0x80,%al
  10089e:	ee                   	out    %al,(%dx)
  10089f:	ba f8 03 00 00       	mov    $0x3f8,%edx
  1008a4:	b0 01                	mov    $0x1,%al
  1008a6:	ee                   	out    %al,(%dx)
  1008a7:	ba f9 03 00 00       	mov    $0x3f9,%edx
  1008ac:	31 c0                	xor    %eax,%eax
  1008ae:	ee                   	out    %al,(%dx)
  1008af:	ba fb 03 00 00       	mov    $0x3fb,%edx
  1008b4:	b0 03                	mov    $0x3,%al
  1008b6:	ee                   	out    %al,(%dx)
  1008b7:	ba fa 03 00 00       	mov    $0x3fa,%edx
  1008bc:	b0 c7                	mov    $0xc7,%al
  1008be:	ee                   	out    %al,(%dx)
  1008bf:	ba fc 03 00 00       	mov    $0x3fc,%edx
  1008c4:	b0 0b                	mov    $0xb,%al
  1008c6:	ee                   	out    %al,(%dx)
  1008c7:	5d                   	pop    %ebp
  1008c8:	c3                   	ret    
  1008c9:	8d 76 00             	lea    0x0(%esi),%esi

001008cc <putChar>:
  1008cc:	55                   	push   %ebp
  1008cd:	89 e5                	mov    %esp,%ebp
  1008cf:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1008d2:	ba fd 03 00 00       	mov    $0x3fd,%edx
  1008d7:	90                   	nop
  1008d8:	ec                   	in     (%dx),%al
  1008d9:	a8 20                	test   $0x20,%al
  1008db:	74 fb                	je     1008d8 <putChar+0xc>
  1008dd:	ba f8 03 00 00       	mov    $0x3f8,%edx
  1008e2:	88 c8                	mov    %cl,%al
  1008e4:	ee                   	out    %al,(%dx)
  1008e5:	5d                   	pop    %ebp
  1008e6:	c3                   	ret    
  1008e7:	90                   	nop

001008e8 <IDLE>:
  1008e8:	55                   	push   %ebp
  1008e9:	89 e5                	mov    %esp,%ebp
  1008eb:	90                   	nop
  1008ec:	f4                   	hlt    
  1008ed:	eb fd                	jmp    1008ec <IDLE+0x4>
  1008ef:	90                   	nop

001008f0 <put_into_running>:
  1008f0:	55                   	push   %ebp
  1008f1:	89 e5                	mov    %esp,%ebp
  1008f3:	83 ec 08             	sub    $0x8,%esp
  1008f6:	8b 55 08             	mov    0x8(%ebp),%edx
  1008f9:	39 15 e0 39 10 00    	cmp    %edx,0x1039e0
  1008ff:	74 29                	je     10092a <put_into_running+0x3a>
  100901:	89 15 e0 39 10 00    	mov    %edx,0x1039e0
  100907:	83 ec 08             	sub    $0x8,%esp
  10090a:	89 d0                	mov    %edx,%eax
  10090c:	c1 e0 07             	shl    $0x7,%eax
  10090f:	01 d0                	add    %edx,%eax
  100911:	01 c0                	add    %eax,%eax
  100913:	01 d0                	add    %edx,%eax
  100915:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100918:	8d 04 c5 fc 59 10 00 	lea    0x1059fc(,%eax,8),%eax
  10091f:	50                   	push   %eax
  100920:	6a 10                	push   $0x10
  100922:	e8 8d f8 ff ff       	call   1001b4 <change_tss>
  100927:	83 c4 10             	add    $0x10,%esp
  10092a:	b8 01 00 00 00       	mov    $0x1,%eax
  10092f:	c9                   	leave  
  100930:	c3                   	ret    
  100931:	8d 76 00             	lea    0x0(%esi),%esi

00100934 <getpid>:
  100934:	55                   	push   %ebp
  100935:	89 e5                	mov    %esp,%ebp
  100937:	a1 e0 39 10 00       	mov    0x1039e0,%eax
  10093c:	5d                   	pop    %ebp
  10093d:	c3                   	ret    
  10093e:	66 90                	xchg   %ax,%ax

00100940 <getrunnable>:
  100940:	55                   	push   %ebp
  100941:	89 e5                	mov    %esp,%ebp
  100943:	a1 44 30 10 00       	mov    0x103044,%eax
  100948:	5d                   	pop    %ebp
  100949:	c3                   	ret    
  10094a:	66 90                	xchg   %ax,%ax

0010094c <getblocked>:
  10094c:	55                   	push   %ebp
  10094d:	89 e5                	mov    %esp,%ebp
  10094f:	a1 40 30 10 00       	mov    0x103040,%eax
  100954:	5d                   	pop    %ebp
  100955:	c3                   	ret    
  100956:	66 90                	xchg   %ax,%ax

00100958 <put_into>:
  100958:	55                   	push   %ebp
  100959:	89 e5                	mov    %esp,%ebp
  10095b:	56                   	push   %esi
  10095c:	53                   	push   %ebx
  10095d:	8b 55 08             	mov    0x8(%ebp),%edx
  100960:	8b 45 0c             	mov    0xc(%ebp),%eax
  100963:	83 fa 01             	cmp    $0x1,%edx
  100966:	0f 84 e0 00 00 00    	je     100a4c <put_into+0xf4>
  10096c:	83 fa 03             	cmp    $0x3,%edx
  10096f:	0f 84 97 00 00 00    	je     100a0c <put_into+0xb4>
  100975:	85 d2                	test   %edx,%edx
  100977:	74 1f                	je     100998 <put_into+0x40>
  100979:	83 ec 08             	sub    $0x8,%esp
  10097c:	6a 5f                	push   $0x5f
  10097e:	68 73 17 10 00       	push   $0x101773
  100983:	e8 b8 0c 00 00       	call   101640 <abort>
  100988:	83 c4 10             	add    $0x10,%esp
  10098b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100990:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100993:	5b                   	pop    %ebx
  100994:	5e                   	pop    %esi
  100995:	5d                   	pop    %ebp
  100996:	c3                   	ret    
  100997:	90                   	nop
  100998:	8b 0d 40 30 10 00    	mov    0x103040,%ecx
  10099e:	ba 40 30 10 00       	mov    $0x103040,%edx
  1009a3:	83 f9 ff             	cmp    $0xffffffff,%ecx
  1009a6:	74 74                	je     100a1c <put_into+0xc4>
  1009a8:	89 ca                	mov    %ecx,%edx
  1009aa:	c1 e2 07             	shl    $0x7,%edx
  1009ad:	01 ca                	add    %ecx,%edx
  1009af:	01 d2                	add    %edx,%edx
  1009b1:	01 ca                	add    %ecx,%edx
  1009b3:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  1009b6:	8d 34 d5 00 3a 10 00 	lea    0x103a00(,%edx,8),%esi
  1009bd:	8b 9e 5c 20 00 00    	mov    0x205c(%esi),%ebx
  1009c3:	89 da                	mov    %ebx,%edx
  1009c5:	c1 e2 07             	shl    $0x7,%edx
  1009c8:	01 da                	add    %ebx,%edx
  1009ca:	01 d2                	add    %edx,%edx
  1009cc:	01 da                	add    %ebx,%edx
  1009ce:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  1009d1:	89 04 d5 60 5a 10 00 	mov    %eax,0x105a60(,%edx,8)
  1009d8:	89 c2                	mov    %eax,%edx
  1009da:	c1 e2 07             	shl    $0x7,%edx
  1009dd:	01 c2                	add    %eax,%edx
  1009df:	01 d2                	add    %edx,%edx
  1009e1:	01 c2                	add    %eax,%edx
  1009e3:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1009e6:	8d 14 d5 00 3a 10 00 	lea    0x103a00(,%edx,8),%edx
  1009ed:	89 9a 5c 20 00 00    	mov    %ebx,0x205c(%edx)
  1009f3:	89 8a 60 20 00 00    	mov    %ecx,0x2060(%edx)
  1009f9:	89 86 5c 20 00 00    	mov    %eax,0x205c(%esi)
  1009ff:	b8 01 00 00 00       	mov    $0x1,%eax
  100a04:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100a07:	5b                   	pop    %ebx
  100a08:	5e                   	pop    %esi
  100a09:	5d                   	pop    %ebp
  100a0a:	c3                   	ret    
  100a0b:	90                   	nop
  100a0c:	8b 0d 70 31 10 00    	mov    0x103170,%ecx
  100a12:	ba 70 31 10 00       	mov    $0x103170,%edx
  100a17:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100a1a:	75 8c                	jne    1009a8 <put_into+0x50>
  100a1c:	89 02                	mov    %eax,(%edx)
  100a1e:	89 c2                	mov    %eax,%edx
  100a20:	c1 e2 07             	shl    $0x7,%edx
  100a23:	01 c2                	add    %eax,%edx
  100a25:	01 d2                	add    %edx,%edx
  100a27:	01 c2                	add    %eax,%edx
  100a29:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100a2c:	8d 14 d5 00 3a 10 00 	lea    0x103a00(,%edx,8),%edx
  100a33:	89 82 60 20 00 00    	mov    %eax,0x2060(%edx)
  100a39:	89 82 5c 20 00 00    	mov    %eax,0x205c(%edx)
  100a3f:	b8 01 00 00 00       	mov    $0x1,%eax
  100a44:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100a47:	5b                   	pop    %ebx
  100a48:	5e                   	pop    %esi
  100a49:	5d                   	pop    %ebp
  100a4a:	c3                   	ret    
  100a4b:	90                   	nop
  100a4c:	8b 0d 44 30 10 00    	mov    0x103044,%ecx
  100a52:	ba 44 30 10 00       	mov    $0x103044,%edx
  100a57:	e9 47 ff ff ff       	jmp    1009a3 <put_into+0x4b>

00100a5c <put_into_empty>:
  100a5c:	55                   	push   %ebp
  100a5d:	89 e5                	mov    %esp,%ebp
  100a5f:	83 ec 10             	sub    $0x10,%esp
  100a62:	ff 75 08             	pushl  0x8(%ebp)
  100a65:	6a 03                	push   $0x3
  100a67:	e8 ec fe ff ff       	call   100958 <put_into>
  100a6c:	c9                   	leave  
  100a6d:	c3                   	ret    
  100a6e:	66 90                	xchg   %ax,%ax

00100a70 <put_into_runnable>:
  100a70:	55                   	push   %ebp
  100a71:	89 e5                	mov    %esp,%ebp
  100a73:	57                   	push   %edi
  100a74:	56                   	push   %esi
  100a75:	53                   	push   %ebx
  100a76:	8b 55 08             	mov    0x8(%ebp),%edx
  100a79:	8b 75 0c             	mov    0xc(%ebp),%esi
  100a7c:	89 d0                	mov    %edx,%eax
  100a7e:	c1 e0 07             	shl    $0x7,%eax
  100a81:	01 d0                	add    %edx,%eax
  100a83:	01 c0                	add    %eax,%eax
  100a85:	01 d0                	add    %edx,%eax
  100a87:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
  100a8a:	c1 e3 03             	shl    $0x3,%ebx
  100a8d:	8d 83 00 5a 10 00    	lea    0x105a00(%ebx),%eax
  100a93:	b9 13 00 00 00       	mov    $0x13,%ecx
  100a98:	89 c7                	mov    %eax,%edi
  100a9a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100a9c:	a1 e8 39 10 00       	mov    0x1039e8,%eax
  100aa1:	89 83 50 5a 10 00    	mov    %eax,0x105a50(%ebx)
  100aa7:	c7 83 4c 5a 10 00 01 	movl   $0x1,0x105a4c(%ebx)
  100aae:	00 00 00 
  100ab1:	89 55 0c             	mov    %edx,0xc(%ebp)
  100ab4:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
  100abb:	5b                   	pop    %ebx
  100abc:	5e                   	pop    %esi
  100abd:	5f                   	pop    %edi
  100abe:	5d                   	pop    %ebp
  100abf:	e9 94 fe ff ff       	jmp    100958 <put_into>

00100ac4 <put_into_block>:
  100ac4:	55                   	push   %ebp
  100ac5:	89 e5                	mov    %esp,%ebp
  100ac7:	57                   	push   %edi
  100ac8:	56                   	push   %esi
  100ac9:	53                   	push   %ebx
  100aca:	8b 55 08             	mov    0x8(%ebp),%edx
  100acd:	89 d0                	mov    %edx,%eax
  100acf:	c1 e0 07             	shl    $0x7,%eax
  100ad2:	01 d0                	add    %edx,%eax
  100ad4:	01 c0                	add    %eax,%eax
  100ad6:	01 d0                	add    %edx,%eax
  100ad8:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
  100adb:	c1 e3 03             	shl    $0x3,%ebx
  100ade:	8d 83 00 5a 10 00    	lea    0x105a00(%ebx),%eax
  100ae4:	b9 13 00 00 00       	mov    $0x13,%ecx
  100ae9:	89 c7                	mov    %eax,%edi
  100aeb:	8b 75 0c             	mov    0xc(%ebp),%esi
  100aee:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100af0:	8b 45 0c             	mov    0xc(%ebp),%eax
  100af3:	8b 40 20             	mov    0x20(%eax),%eax
  100af6:	89 83 54 5a 10 00    	mov    %eax,0x105a54(%ebx)
  100afc:	c7 83 4c 5a 10 00 00 	movl   $0x0,0x105a4c(%ebx)
  100b03:	00 00 00 
  100b06:	89 55 0c             	mov    %edx,0xc(%ebp)
  100b09:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  100b10:	5b                   	pop    %ebx
  100b11:	5e                   	pop    %esi
  100b12:	5f                   	pop    %edi
  100b13:	5d                   	pop    %ebp
  100b14:	e9 3f fe ff ff       	jmp    100958 <put_into>
  100b19:	8d 76 00             	lea    0x0(%esi),%esi

00100b1c <get_from>:
  100b1c:	55                   	push   %ebp
  100b1d:	89 e5                	mov    %esp,%ebp
  100b1f:	56                   	push   %esi
  100b20:	53                   	push   %ebx
  100b21:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100b24:	8b 75 0c             	mov    0xc(%ebp),%esi
  100b27:	39 f3                	cmp    %esi,%ebx
  100b29:	74 42                	je     100b6d <get_from+0x51>
  100b2b:	89 d8                	mov    %ebx,%eax
  100b2d:	c1 e0 07             	shl    $0x7,%eax
  100b30:	01 d8                	add    %ebx,%eax
  100b32:	01 c0                	add    %eax,%eax
  100b34:	01 d8                	add    %ebx,%eax
  100b36:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b39:	8b 0c c5 60 5a 10 00 	mov    0x105a60(,%eax,8),%ecx
  100b40:	39 cb                	cmp    %ecx,%ebx
  100b42:	75 25                	jne    100b69 <get_from+0x4d>
  100b44:	e9 f3 00 00 00       	jmp    100c3c <get_from+0x120>
  100b49:	8d 76 00             	lea    0x0(%esi),%esi
  100b4c:	89 ca                	mov    %ecx,%edx
  100b4e:	c1 e2 07             	shl    $0x7,%edx
  100b51:	01 ca                	add    %ecx,%edx
  100b53:	01 d2                	add    %edx,%edx
  100b55:	01 ca                	add    %ecx,%edx
  100b57:	8d 04 91             	lea    (%ecx,%edx,4),%eax
  100b5a:	8b 0c c5 60 5a 10 00 	mov    0x105a60(,%eax,8),%ecx
  100b61:	39 cb                	cmp    %ecx,%ebx
  100b63:	0f 84 d3 00 00 00    	je     100c3c <get_from+0x120>
  100b69:	39 ce                	cmp    %ecx,%esi
  100b6b:	75 df                	jne    100b4c <get_from+0x30>
  100b6d:	89 f0                	mov    %esi,%eax
  100b6f:	c1 e0 07             	shl    $0x7,%eax
  100b72:	01 f0                	add    %esi,%eax
  100b74:	01 c0                	add    %eax,%eax
  100b76:	01 f0                	add    %esi,%eax
  100b78:	8d 04 86             	lea    (%esi,%eax,4),%eax
  100b7b:	8b 04 c5 4c 5a 10 00 	mov    0x105a4c(,%eax,8),%eax
  100b82:	83 f8 01             	cmp    $0x1,%eax
  100b85:	0f 84 11 01 00 00    	je     100c9c <get_from+0x180>
  100b8b:	83 f8 03             	cmp    $0x3,%eax
  100b8e:	74 24                	je     100bb4 <get_from+0x98>
  100b90:	85 c0                	test   %eax,%eax
  100b92:	0f 84 f8 00 00 00    	je     100c90 <get_from+0x174>
  100b98:	83 ec 08             	sub    $0x8,%esp
  100b9b:	68 92 00 00 00       	push   $0x92
  100ba0:	68 73 17 10 00       	push   $0x101773
  100ba5:	e8 96 0a 00 00       	call   101640 <abort>
  100baa:	a1 00 00 00 00       	mov    0x0,%eax
  100baf:	0f 0b                	ud2    
  100bb1:	8d 76 00             	lea    0x0(%esi),%esi
  100bb4:	be 70 31 10 00       	mov    $0x103170,%esi
  100bb9:	3b 1e                	cmp    (%esi),%ebx
  100bbb:	74 15                	je     100bd2 <get_from+0xb6>
  100bbd:	83 ec 08             	sub    $0x8,%esp
  100bc0:	68 97 00 00 00       	push   $0x97
  100bc5:	68 73 17 10 00       	push   $0x101773
  100bca:	e8 71 0a 00 00       	call   101640 <abort>
  100bcf:	83 c4 10             	add    $0x10,%esp
  100bd2:	83 fb ff             	cmp    $0xffffffff,%ebx
  100bd5:	0f 84 a9 00 00 00    	je     100c84 <get_from+0x168>
  100bdb:	89 d8                	mov    %ebx,%eax
  100bdd:	c1 e0 07             	shl    $0x7,%eax
  100be0:	01 d8                	add    %ebx,%eax
  100be2:	01 c0                	add    %eax,%eax
  100be4:	01 d8                	add    %ebx,%eax
  100be6:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100be9:	8d 04 c5 00 3a 10 00 	lea    0x103a00(,%eax,8),%eax
  100bf0:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100bf6:	39 da                	cmp    %ebx,%edx
  100bf8:	0f 84 aa 00 00 00    	je     100ca8 <get_from+0x18c>
  100bfe:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100c04:	89 c8                	mov    %ecx,%eax
  100c06:	c1 e0 07             	shl    $0x7,%eax
  100c09:	01 c8                	add    %ecx,%eax
  100c0b:	01 c0                	add    %eax,%eax
  100c0d:	01 c8                	add    %ecx,%eax
  100c0f:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100c12:	89 14 c5 60 5a 10 00 	mov    %edx,0x105a60(,%eax,8)
  100c19:	89 d0                	mov    %edx,%eax
  100c1b:	c1 e0 07             	shl    $0x7,%eax
  100c1e:	01 d0                	add    %edx,%eax
  100c20:	01 c0                	add    %eax,%eax
  100c22:	01 d0                	add    %edx,%eax
  100c24:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100c27:	89 0c c5 5c 5a 10 00 	mov    %ecx,0x105a5c(,%eax,8)
  100c2e:	89 16                	mov    %edx,(%esi)
  100c30:	89 d8                	mov    %ebx,%eax
  100c32:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100c35:	5b                   	pop    %ebx
  100c36:	5e                   	pop    %esi
  100c37:	5d                   	pop    %ebp
  100c38:	c3                   	ret    
  100c39:	8d 76 00             	lea    0x0(%esi),%esi
  100c3c:	83 ec 0c             	sub    $0xc,%esp
  100c3f:	68 0c 17 10 00       	push   $0x10170c
  100c44:	e8 83 08 00 00       	call   1014cc <printk>
  100c49:	58                   	pop    %eax
  100c4a:	5a                   	pop    %edx
  100c4b:	56                   	push   %esi
  100c4c:	53                   	push   %ebx
  100c4d:	68 a8 17 10 00       	push   $0x1017a8
  100c52:	6a 7f                	push   $0x7f
  100c54:	68 73 17 10 00       	push   $0x101773
  100c59:	68 84 17 10 00       	push   $0x101784
  100c5e:	e8 69 08 00 00       	call   1014cc <printk>
  100c63:	83 c4 14             	add    $0x14,%esp
  100c66:	68 3b 17 10 00       	push   $0x10173b
  100c6b:	e8 5c 08 00 00       	call   1014cc <printk>
  100c70:	59                   	pop    %ecx
  100c71:	5b                   	pop    %ebx
  100c72:	68 80 00 00 00       	push   $0x80
  100c77:	68 73 17 10 00       	push   $0x101773
  100c7c:	e8 bf 09 00 00       	call   101640 <abort>
  100c81:	83 c4 10             	add    $0x10,%esp
  100c84:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100c89:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100c8c:	5b                   	pop    %ebx
  100c8d:	5e                   	pop    %esi
  100c8e:	5d                   	pop    %ebp
  100c8f:	c3                   	ret    
  100c90:	be 40 30 10 00       	mov    $0x103040,%esi
  100c95:	e9 1f ff ff ff       	jmp    100bb9 <get_from+0x9d>
  100c9a:	66 90                	xchg   %ax,%ax
  100c9c:	be 44 30 10 00       	mov    $0x103044,%esi
  100ca1:	e9 13 ff ff ff       	jmp    100bb9 <get_from+0x9d>
  100ca6:	66 90                	xchg   %ax,%ax
  100ca8:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100cae:	89 d8                	mov    %ebx,%eax
  100cb0:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100cb3:	5b                   	pop    %ebx
  100cb4:	5e                   	pop    %esi
  100cb5:	5d                   	pop    %ebp
  100cb6:	c3                   	ret    
  100cb7:	90                   	nop

00100cb8 <apply_new_pid>:
  100cb8:	55                   	push   %ebp
  100cb9:	89 e5                	mov    %esp,%ebp
  100cbb:	83 ec 10             	sub    $0x10,%esp
  100cbe:	a1 70 31 10 00       	mov    0x103170,%eax
  100cc3:	50                   	push   %eax
  100cc4:	50                   	push   %eax
  100cc5:	e8 52 fe ff ff       	call   100b1c <get_from>
  100cca:	c9                   	leave  
  100ccb:	c3                   	ret    

00100ccc <get_from_runnable>:
  100ccc:	55                   	push   %ebp
  100ccd:	89 e5                	mov    %esp,%ebp
  100ccf:	83 ec 10             	sub    $0x10,%esp
  100cd2:	a1 44 30 10 00       	mov    0x103044,%eax
  100cd7:	50                   	push   %eax
  100cd8:	50                   	push   %eax
  100cd9:	e8 3e fe ff ff       	call   100b1c <get_from>
  100cde:	c9                   	leave  
  100cdf:	c3                   	ret    

00100ce0 <get_from_block>:
  100ce0:	55                   	push   %ebp
  100ce1:	89 e5                	mov    %esp,%ebp
  100ce3:	83 ec 10             	sub    $0x10,%esp
  100ce6:	ff 75 08             	pushl  0x8(%ebp)
  100ce9:	ff 35 40 30 10 00    	pushl  0x103040
  100cef:	e8 28 fe ff ff       	call   100b1c <get_from>
  100cf4:	83 c4 10             	add    $0x10,%esp
  100cf7:	40                   	inc    %eax
  100cf8:	74 0a                	je     100d04 <get_from_block+0x24>
  100cfa:	b8 01 00 00 00       	mov    $0x1,%eax
  100cff:	c9                   	leave  
  100d00:	c3                   	ret    
  100d01:	8d 76 00             	lea    0x0(%esi),%esi
  100d04:	83 ec 08             	sub    $0x8,%esp
  100d07:	68 ae 00 00 00       	push   $0xae
  100d0c:	68 73 17 10 00       	push   $0x101773
  100d11:	e8 2a 09 00 00       	call   101640 <abort>
  100d16:	83 c4 10             	add    $0x10,%esp
  100d19:	b8 01 00 00 00       	mov    $0x1,%eax
  100d1e:	c9                   	leave  
  100d1f:	c3                   	ret    

00100d20 <check_block>:
  100d20:	8b 15 40 30 10 00    	mov    0x103040,%edx
  100d26:	83 fa ff             	cmp    $0xffffffff,%edx
  100d29:	0f 84 9d 00 00 00    	je     100dcc <check_block+0xac>
  100d2f:	55                   	push   %ebp
  100d30:	89 e5                	mov    %esp,%ebp
  100d32:	57                   	push   %edi
  100d33:	56                   	push   %esi
  100d34:	53                   	push   %ebx
  100d35:	83 ec 0c             	sub    $0xc,%esp
  100d38:	89 d3                	mov    %edx,%ebx
  100d3a:	eb 1e                	jmp    100d5a <check_block+0x3a>
  100d3c:	89 d8                	mov    %ebx,%eax
  100d3e:	c1 e0 07             	shl    $0x7,%eax
  100d41:	01 d8                	add    %ebx,%eax
  100d43:	01 c0                	add    %eax,%eax
  100d45:	01 d8                	add    %ebx,%eax
  100d47:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100d4a:	8b 1c c5 60 5a 10 00 	mov    0x105a60(,%eax,8),%ebx
  100d51:	39 d3                	cmp    %edx,%ebx
  100d53:	74 6a                	je     100dbf <check_block+0x9f>
  100d55:	83 fa ff             	cmp    $0xffffffff,%edx
  100d58:	74 65                	je     100dbf <check_block+0x9f>
  100d5a:	89 d8                	mov    %ebx,%eax
  100d5c:	c1 e0 07             	shl    $0x7,%eax
  100d5f:	01 d8                	add    %ebx,%eax
  100d61:	01 c0                	add    %eax,%eax
  100d63:	01 d8                	add    %ebx,%eax
  100d65:	8d 34 83             	lea    (%ebx,%eax,4),%esi
  100d68:	c1 e6 03             	shl    $0x3,%esi
  100d6b:	8b be 4c 5a 10 00    	mov    0x105a4c(%esi),%edi
  100d71:	85 ff                	test   %edi,%edi
  100d73:	75 c7                	jne    100d3c <check_block+0x1c>
  100d75:	8b 8e 54 5a 10 00    	mov    0x105a54(%esi),%ecx
  100d7b:	85 c9                	test   %ecx,%ecx
  100d7d:	7f bd                	jg     100d3c <check_block+0x1c>
  100d7f:	8b be 60 5a 10 00    	mov    0x105a60(%esi),%edi
  100d85:	83 ec 0c             	sub    $0xc,%esp
  100d88:	53                   	push   %ebx
  100d89:	e8 52 ff ff ff       	call   100ce0 <get_from_block>
  100d8e:	58                   	pop    %eax
  100d8f:	5a                   	pop    %edx
  100d90:	81 c6 00 5a 10 00    	add    $0x105a00,%esi
  100d96:	56                   	push   %esi
  100d97:	53                   	push   %ebx
  100d98:	e8 d3 fc ff ff       	call   100a70 <put_into_runnable>
  100d9d:	89 f8                	mov    %edi,%eax
  100d9f:	c1 e0 07             	shl    $0x7,%eax
  100da2:	01 f8                	add    %edi,%eax
  100da4:	01 c0                	add    %eax,%eax
  100da6:	01 f8                	add    %edi,%eax
  100da8:	8d 04 87             	lea    (%edi,%eax,4),%eax
  100dab:	8b 1c c5 60 5a 10 00 	mov    0x105a60(,%eax,8),%ebx
  100db2:	83 c4 10             	add    $0x10,%esp
  100db5:	8b 15 40 30 10 00    	mov    0x103040,%edx
  100dbb:	39 d3                	cmp    %edx,%ebx
  100dbd:	75 96                	jne    100d55 <check_block+0x35>
  100dbf:	b8 01 00 00 00       	mov    $0x1,%eax
  100dc4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100dc7:	5b                   	pop    %ebx
  100dc8:	5e                   	pop    %esi
  100dc9:	5f                   	pop    %edi
  100dca:	5d                   	pop    %ebp
  100dcb:	c3                   	ret    
  100dcc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100dd1:	c3                   	ret    
  100dd2:	66 90                	xchg   %ax,%ax

00100dd4 <check_is_in>:
  100dd4:	55                   	push   %ebp
  100dd5:	89 e5                	mov    %esp,%ebp
  100dd7:	53                   	push   %ebx
  100dd8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100ddb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100dde:	39 d9                	cmp    %ebx,%ecx
  100de0:	74 3b                	je     100e1d <check_is_in+0x49>
  100de2:	89 c8                	mov    %ecx,%eax
  100de4:	c1 e0 07             	shl    $0x7,%eax
  100de7:	01 c8                	add    %ecx,%eax
  100de9:	01 c0                	add    %eax,%eax
  100deb:	01 c8                	add    %ecx,%eax
  100ded:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100df0:	8b 14 c5 60 5a 10 00 	mov    0x105a60(,%eax,8),%edx
  100df7:	39 d1                	cmp    %edx,%ecx
  100df9:	75 1e                	jne    100e19 <check_is_in+0x45>
  100dfb:	eb 2b                	jmp    100e28 <check_is_in+0x54>
  100dfd:	8d 76 00             	lea    0x0(%esi),%esi
  100e00:	89 d0                	mov    %edx,%eax
  100e02:	c1 e0 07             	shl    $0x7,%eax
  100e05:	01 d0                	add    %edx,%eax
  100e07:	01 c0                	add    %eax,%eax
  100e09:	01 d0                	add    %edx,%eax
  100e0b:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100e0e:	8b 14 c5 60 5a 10 00 	mov    0x105a60(,%eax,8),%edx
  100e15:	39 d1                	cmp    %edx,%ecx
  100e17:	74 0f                	je     100e28 <check_is_in+0x54>
  100e19:	39 d3                	cmp    %edx,%ebx
  100e1b:	75 e3                	jne    100e00 <check_is_in+0x2c>
  100e1d:	b8 01 00 00 00       	mov    $0x1,%eax
  100e22:	5b                   	pop    %ebx
  100e23:	5d                   	pop    %ebp
  100e24:	c3                   	ret    
  100e25:	8d 76 00             	lea    0x0(%esi),%esi
  100e28:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e2d:	5b                   	pop    %ebx
  100e2e:	5d                   	pop    %ebp
  100e2f:	c3                   	ret    

00100e30 <block_decrease>:
  100e30:	55                   	push   %ebp
  100e31:	89 e5                	mov    %esp,%ebp
  100e33:	8b 0d 40 30 10 00    	mov    0x103040,%ecx
  100e39:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100e3c:	74 2e                	je     100e6c <block_decrease+0x3c>
  100e3e:	89 ca                	mov    %ecx,%edx
  100e40:	89 d0                	mov    %edx,%eax
  100e42:	c1 e0 07             	shl    $0x7,%eax
  100e45:	01 d0                	add    %edx,%eax
  100e47:	01 c0                	add    %eax,%eax
  100e49:	01 d0                	add    %edx,%eax
  100e4b:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100e4e:	8d 04 c5 00 3a 10 00 	lea    0x103a00(,%eax,8),%eax
  100e55:	ff 88 54 20 00 00    	decl   0x2054(%eax)
  100e5b:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100e61:	39 d1                	cmp    %edx,%ecx
  100e63:	75 db                	jne    100e40 <block_decrease+0x10>
  100e65:	b8 01 00 00 00       	mov    $0x1,%eax
  100e6a:	5d                   	pop    %ebp
  100e6b:	c3                   	ret    
  100e6c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e71:	5d                   	pop    %ebp
  100e72:	c3                   	ret    
  100e73:	90                   	nop

00100e74 <init_pcb>:
  100e74:	55                   	push   %ebp
  100e75:	89 e5                	mov    %esp,%ebp
  100e77:	c7 05 e8 39 10 00 05 	movl   $0x5,0x1039e8
  100e7e:	00 00 00 
  100e81:	ba 58 5a 10 00       	mov    $0x105a58,%edx
  100e86:	31 c0                	xor    %eax,%eax
  100e88:	89 02                	mov    %eax,(%edx)
  100e8a:	8d 48 ff             	lea    -0x1(%eax),%ecx
  100e8d:	89 4a 04             	mov    %ecx,0x4(%edx)
  100e90:	40                   	inc    %eax
  100e91:	89 42 08             	mov    %eax,0x8(%edx)
  100e94:	c7 42 f4 03 00 00 00 	movl   $0x3,-0xc(%edx)
  100e9b:	81 c2 68 20 00 00    	add    $0x2068,%edx
  100ea1:	3d 00 08 00 00       	cmp    $0x800,%eax
  100ea6:	75 e0                	jne    100e88 <init_pcb+0x14>
  100ea8:	c7 05 5c 5a 10 00 ff 	movl   $0x7ff,0x105a5c
  100eaf:	07 00 00 
  100eb2:	c7 05 f8 79 13 01 00 	movl   $0x0,0x11379f8
  100eb9:	00 00 00 
  100ebc:	5d                   	pop    %ebp
  100ebd:	c3                   	ret    
  100ebe:	66 90                	xchg   %ax,%ax

00100ec0 <init_kernel_pcb>:
  100ec0:	55                   	push   %ebp
  100ec1:	89 e5                	mov    %esp,%ebp
  100ec3:	83 ec 10             	sub    $0x10,%esp
  100ec6:	a1 70 31 10 00       	mov    0x103170,%eax
  100ecb:	50                   	push   %eax
  100ecc:	50                   	push   %eax
  100ecd:	e8 4a fc ff ff       	call   100b1c <get_from>
  100ed2:	83 c4 10             	add    $0x10,%esp
  100ed5:	85 c0                	test   %eax,%eax
  100ed7:	74 15                	je     100eee <init_kernel_pcb+0x2e>
  100ed9:	83 ec 08             	sub    $0x8,%esp
  100edc:	68 e1 00 00 00       	push   $0xe1
  100ee1:	68 73 17 10 00       	push   $0x101773
  100ee6:	e8 55 07 00 00       	call   101640 <abort>
  100eeb:	83 c4 10             	add    $0x10,%esp
  100eee:	c7 05 48 5a 10 00 10 	movl   $0x10,0x105a48
  100ef5:	00 00 00 
  100ef8:	c7 05 3c 5a 10 00 08 	movl   $0x8,0x105a3c
  100eff:	00 00 00 
  100f02:	c7 05 0c 5a 10 00 10 	movl   $0x10,0x105a0c
  100f09:	00 00 00 
  100f0c:	c7 05 08 5a 10 00 10 	movl   $0x10,0x105a08
  100f13:	00 00 00 
  100f16:	c7 05 38 5a 10 00 e8 	movl   $0x1008e8,0x105a38
  100f1d:	08 10 00 
  100f20:	c7 05 44 5a 10 00 00 	movl   $0x400000,0x105a44
  100f27:	00 40 00 
  100f2a:	c7 05 4c 5a 10 00 01 	movl   $0x1,0x105a4c
  100f31:	00 00 00 
  100f34:	c7 05 50 5a 10 00 04 	movl   $0x4,0x105a50
  100f3b:	00 00 00 
  100f3e:	b8 01 00 00 00       	mov    $0x1,%eax
  100f43:	c9                   	leave  
  100f44:	c3                   	ret    
  100f45:	8d 76 00             	lea    0x0(%esi),%esi

00100f48 <make_pcb>:
  100f48:	55                   	push   %ebp
  100f49:	89 e5                	mov    %esp,%ebp
  100f4b:	57                   	push   %edi
  100f4c:	56                   	push   %esi
  100f4d:	8b 55 08             	mov    0x8(%ebp),%edx
  100f50:	89 d0                	mov    %edx,%eax
  100f52:	c1 e0 07             	shl    $0x7,%eax
  100f55:	01 d0                	add    %edx,%eax
  100f57:	01 c0                	add    %eax,%eax
  100f59:	01 d0                	add    %edx,%eax
  100f5b:	8d 14 82             	lea    (%edx,%eax,4),%edx
  100f5e:	c1 e2 03             	shl    $0x3,%edx
  100f61:	8d 82 00 5a 10 00    	lea    0x105a00(%edx),%eax
  100f67:	b9 13 00 00 00       	mov    $0x13,%ecx
  100f6c:	89 c7                	mov    %eax,%edi
  100f6e:	8b 75 0c             	mov    0xc(%ebp),%esi
  100f71:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100f73:	8b 45 10             	mov    0x10(%ebp),%eax
  100f76:	89 82 4c 5a 10 00    	mov    %eax,0x105a4c(%edx)
  100f7c:	8b 45 14             	mov    0x14(%ebp),%eax
  100f7f:	89 82 50 5a 10 00    	mov    %eax,0x105a50(%edx)
  100f85:	8b 45 18             	mov    0x18(%ebp),%eax
  100f88:	89 82 54 5a 10 00    	mov    %eax,0x105a54(%edx)
  100f8e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100f91:	89 82 64 5a 10 00    	mov    %eax,0x105a64(%edx)
  100f97:	b8 01 00 00 00       	mov    $0x1,%eax
  100f9c:	5e                   	pop    %esi
  100f9d:	5f                   	pop    %edi
  100f9e:	5d                   	pop    %ebp
  100f9f:	c3                   	ret    

00100fa0 <initIdt>:
  100fa0:	55                   	push   %ebp
  100fa1:	89 e5                	mov    %esp,%ebp
  100fa3:	53                   	push   %ebx
  100fa4:	ba d7 16 10 00       	mov    $0x1016d7,%edx
  100fa9:	89 d3                	mov    %edx,%ebx
  100fab:	c1 ea 10             	shr    $0x10,%edx
  100fae:	b9 e0 82 13 01       	mov    $0x11382e0,%ecx
  100fb3:	b8 e0 7a 13 01       	mov    $0x1137ae0,%eax
  100fb8:	66 89 18             	mov    %bx,(%eax)
  100fbb:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100fc1:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100fc5:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100fc9:	66 89 50 06          	mov    %dx,0x6(%eax)
  100fcd:	83 c0 08             	add    $0x8,%eax
  100fd0:	39 c1                	cmp    %eax,%ecx
  100fd2:	75 e4                	jne    100fb8 <initIdt+0x18>
  100fd4:	b8 dd 16 10 00       	mov    $0x1016dd,%eax
  100fd9:	66 a3 48 7b 13 01    	mov    %ax,0x1137b48
  100fdf:	66 c7 05 4a 7b 13 01 	movw   $0x8,0x1137b4a
  100fe6:	08 00 
  100fe8:	c6 05 4c 7b 13 01 00 	movb   $0x0,0x1137b4c
  100fef:	c6 05 4d 7b 13 01 8f 	movb   $0x8f,0x1137b4d
  100ff6:	c1 e8 10             	shr    $0x10,%eax
  100ff9:	66 a3 4e 7b 13 01    	mov    %ax,0x1137b4e
  100fff:	b8 e1 16 10 00       	mov    $0x1016e1,%eax
  101004:	66 a3 e0 7e 13 01    	mov    %ax,0x1137ee0
  10100a:	66 c7 05 e2 7e 13 01 	movw   $0x8,0x1137ee2
  101011:	08 00 
  101013:	c6 05 e4 7e 13 01 00 	movb   $0x0,0x1137ee4
  10101a:	c6 05 e5 7e 13 01 ee 	movb   $0xee,0x1137ee5
  101021:	c1 e8 10             	shr    $0x10,%eax
  101024:	66 a3 e6 7e 13 01    	mov    %ax,0x1137ee6
  10102a:	b8 ea 16 10 00       	mov    $0x1016ea,%eax
  10102f:	66 a3 e0 7b 13 01    	mov    %ax,0x1137be0
  101035:	66 c7 05 e2 7b 13 01 	movw   $0x8,0x1137be2
  10103c:	08 00 
  10103e:	c6 05 e4 7b 13 01 00 	movb   $0x0,0x1137be4
  101045:	c6 05 e5 7b 13 01 8e 	movb   $0x8e,0x1137be5
  10104c:	c1 e8 10             	shr    $0x10,%eax
  10104f:	66 a3 e6 7b 13 01    	mov    %ax,0x1137be6
  101055:	66 c7 05 74 31 10 00 	movw   $0x7ff,0x103174
  10105c:	ff 07 
  10105e:	b8 e0 7a 13 01       	mov    $0x1137ae0,%eax
  101063:	66 a3 76 31 10 00    	mov    %ax,0x103176
  101069:	c1 e8 10             	shr    $0x10,%eax
  10106c:	66 a3 78 31 10 00    	mov    %ax,0x103178
  101072:	b8 74 31 10 00       	mov    $0x103174,%eax
  101077:	0f 01 18             	lidtl  (%eax)
  10107a:	5b                   	pop    %ebx
  10107b:	5d                   	pop    %ebp
  10107c:	c3                   	ret    
  10107d:	66 90                	xchg   %ax,%ax
  10107f:	90                   	nop

00101080 <syscallHandle>:
  101080:	55                   	push   %ebp
  101081:	89 e5                	mov    %esp,%ebp
  101083:	53                   	push   %ebx
  101084:	50                   	push   %eax
  101085:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101088:	8b 43 2c             	mov    0x2c(%ebx),%eax
  10108b:	83 f8 04             	cmp    $0x4,%eax
  10108e:	74 58                	je     1010e8 <syscallHandle+0x68>
  101090:	77 1e                	ja     1010b0 <syscallHandle+0x30>
  101092:	83 f8 01             	cmp    $0x1,%eax
  101095:	74 45                	je     1010dc <syscallHandle+0x5c>
  101097:	83 f8 02             	cmp    $0x2,%eax
  10109a:	75 0f                	jne    1010ab <syscallHandle+0x2b>
  10109c:	83 ec 0c             	sub    $0xc,%esp
  10109f:	53                   	push   %ebx
  1010a0:	e8 a3 f5 ff ff       	call   100648 <sys_fork>
  1010a5:	89 43 2c             	mov    %eax,0x2c(%ebx)
  1010a8:	83 c4 10             	add    $0x10,%esp
  1010ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1010ae:	c9                   	leave  
  1010af:	c3                   	ret    
  1010b0:	83 f8 07             	cmp    $0x7,%eax
  1010b3:	74 13                	je     1010c8 <syscallHandle+0x48>
  1010b5:	3d e6 00 00 00       	cmp    $0xe6,%eax
  1010ba:	75 ef                	jne    1010ab <syscallHandle+0x2b>
  1010bc:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1010bf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1010c2:	c9                   	leave  
  1010c3:	e9 50 f5 ff ff       	jmp    100618 <sys_sleep>
  1010c8:	83 ec 0c             	sub    $0xc,%esp
  1010cb:	53                   	push   %ebx
  1010cc:	e8 3b f5 ff ff       	call   10060c <sys_getpid>
  1010d1:	89 43 2c             	mov    %eax,0x2c(%ebx)
  1010d4:	83 c4 10             	add    $0x10,%esp
  1010d7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1010da:	c9                   	leave  
  1010db:	c3                   	ret    
  1010dc:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1010df:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1010e2:	c9                   	leave  
  1010e3:	e9 f8 f4 ff ff       	jmp    1005e0 <sys_exit>
  1010e8:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1010eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1010ee:	c9                   	leave  
  1010ef:	e9 40 f7 ff ff       	jmp    100834 <sys_write>

001010f4 <GProtectFaultHandle>:
  1010f4:	55                   	push   %ebp
  1010f5:	89 e5                	mov    %esp,%ebp
  1010f7:	83 ec 14             	sub    $0x14,%esp
  1010fa:	68 0c 17 10 00       	push   $0x10170c
  1010ff:	e8 c8 03 00 00       	call   1014cc <printk>
  101104:	58                   	pop    %eax
  101105:	8b 45 08             	mov    0x8(%ebp),%eax
  101108:	ff 70 30             	pushl  0x30(%eax)
  10110b:	68 04 18 10 00       	push   $0x101804
  101110:	6a 65                	push   $0x65
  101112:	68 b1 17 10 00       	push   $0x1017b1
  101117:	68 c4 17 10 00       	push   $0x1017c4
  10111c:	e8 ab 03 00 00       	call   1014cc <printk>
  101121:	83 c4 14             	add    $0x14,%esp
  101124:	68 3b 17 10 00       	push   $0x10173b
  101129:	e8 9e 03 00 00       	call   1014cc <printk>
  10112e:	5a                   	pop    %edx
  10112f:	59                   	pop    %ecx
  101130:	6a 66                	push   $0x66
  101132:	68 b1 17 10 00       	push   $0x1017b1
  101137:	e8 04 05 00 00       	call   101640 <abort>
  10113c:	83 c4 10             	add    $0x10,%esp
  10113f:	c9                   	leave  
  101140:	c3                   	ret    
  101141:	8d 76 00             	lea    0x0(%esi),%esi

00101144 <timeHandle>:
  101144:	55                   	push   %ebp
  101145:	89 e5                	mov    %esp,%ebp
  101147:	53                   	push   %ebx
  101148:	53                   	push   %ebx
  101149:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10114c:	8b 15 e0 39 10 00    	mov    0x1039e0,%edx
  101152:	89 d0                	mov    %edx,%eax
  101154:	c1 e0 07             	shl    $0x7,%eax
  101157:	01 d0                	add    %edx,%eax
  101159:	01 c0                	add    %eax,%eax
  10115b:	01 d0                	add    %edx,%eax
  10115d:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101160:	ff 0c c5 50 5a 10 00 	decl   0x105a50(,%eax,8)
  101167:	e8 c4 fc ff ff       	call   100e30 <block_decrease>
  10116c:	e8 af fb ff ff       	call   100d20 <check_block>
  101171:	8b 15 e0 39 10 00    	mov    0x1039e0,%edx
  101177:	89 d0                	mov    %edx,%eax
  101179:	c1 e0 07             	shl    $0x7,%eax
  10117c:	01 d0                	add    %edx,%eax
  10117e:	01 c0                	add    %eax,%eax
  101180:	01 d0                	add    %edx,%eax
  101182:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101185:	8b 04 c5 50 5a 10 00 	mov    0x105a50(,%eax,8),%eax
  10118c:	85 c0                	test   %eax,%eax
  10118e:	7e 34                	jle    1011c4 <timeHandle+0x80>
  101190:	e8 9f f7 ff ff       	call   100934 <getpid>
  101195:	85 c0                	test   %eax,%eax
  101197:	74 1b                	je     1011b4 <timeHandle+0x70>
  101199:	e8 96 f7 ff ff       	call   100934 <getpid>
  10119e:	83 ec 08             	sub    $0x8,%esp
  1011a1:	50                   	push   %eax
  1011a2:	68 38 17 10 00       	push   $0x101738
  1011a7:	e8 20 03 00 00       	call   1014cc <printk>
  1011ac:	83 c4 10             	add    $0x10,%esp
  1011af:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1011b2:	c9                   	leave  
  1011b3:	c3                   	ret    
  1011b4:	c7 45 08 da 17 10 00 	movl   $0x1017da,0x8(%ebp)
  1011bb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1011be:	c9                   	leave  
  1011bf:	e9 08 03 00 00       	jmp    1014cc <printk>
  1011c4:	83 ec 08             	sub    $0x8,%esp
  1011c7:	53                   	push   %ebx
  1011c8:	52                   	push   %edx
  1011c9:	e8 a2 f8 ff ff       	call   100a70 <put_into_runnable>
  1011ce:	e8 f9 fa ff ff       	call   100ccc <get_from_runnable>
  1011d3:	5a                   	pop    %edx
  1011d4:	59                   	pop    %ecx
  1011d5:	53                   	push   %ebx
  1011d6:	50                   	push   %eax
  1011d7:	e8 14 f7 ff ff       	call   1008f0 <put_into_running>
  1011dc:	83 c4 10             	add    $0x10,%esp
  1011df:	eb af                	jmp    101190 <timeHandle+0x4c>
  1011e1:	8d 76 00             	lea    0x0(%esi),%esi

001011e4 <irqHandle>:
  1011e4:	55                   	push   %ebp
  1011e5:	89 e5                	mov    %esp,%ebp
  1011e7:	57                   	push   %edi
  1011e8:	56                   	push   %esi
  1011e9:	53                   	push   %ebx
  1011ea:	83 ec 0c             	sub    $0xc,%esp
  1011ed:	8b 75 08             	mov    0x8(%ebp),%esi
  1011f0:	b8 10 00 00 00       	mov    $0x10,%eax
  1011f5:	89 c0                	mov    %eax,%eax
  1011f7:	8e d8                	mov    %eax,%ds
  1011f9:	8e e0                	mov    %eax,%fs
  1011fb:	8e c0                	mov    %eax,%es
  1011fd:	b8 30 00 00 00       	mov    $0x30,%eax
  101202:	89 c0                	mov    %eax,%eax
  101204:	8e e8                	mov    %eax,%gs
  101206:	89 ef                	mov    %ebp,%edi
  101208:	3b 77 08             	cmp    0x8(%edi),%esi
  10120b:	74 12                	je     10121f <irqHandle+0x3b>
  10120d:	83 ec 08             	sub    $0x8,%esp
  101210:	6a 1e                	push   $0x1e
  101212:	68 b1 17 10 00       	push   $0x1017b1
  101217:	e8 24 04 00 00       	call   101640 <abort>
  10121c:	83 c4 10             	add    $0x10,%esp
  10121f:	8b 1d e0 39 10 00    	mov    0x1039e0,%ebx
  101225:	fa                   	cli    
  101226:	8b 46 30             	mov    0x30(%esi),%eax
  101229:	83 f8 0d             	cmp    $0xd,%eax
  10122c:	0f 84 06 01 00 00    	je     101338 <irqHandle+0x154>
  101232:	0f 8e a8 00 00 00    	jle    1012e0 <irqHandle+0xfc>
  101238:	83 f8 20             	cmp    $0x20,%eax
  10123b:	74 2f                	je     10126c <irqHandle+0x88>
  10123d:	83 c0 80             	add    $0xffffff80,%eax
  101240:	0f 85 a1 00 00 00    	jne    1012e7 <irqHandle+0x103>
  101246:	83 ec 0c             	sub    $0xc,%esp
  101249:	56                   	push   %esi
  10124a:	e8 31 fe ff ff       	call   101080 <syscallHandle>
  10124f:	8b 46 30             	mov    0x30(%esi),%eax
  101252:	83 c4 10             	add    $0x10,%esp
  101255:	3d 80 00 00 00       	cmp    $0x80,%eax
  10125a:	74 28                	je     101284 <irqHandle+0xa0>
  10125c:	83 f8 20             	cmp    $0x20,%eax
  10125f:	74 23                	je     101284 <irqHandle+0xa0>
  101261:	fb                   	sti    
  101262:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101265:	5b                   	pop    %ebx
  101266:	5e                   	pop    %esi
  101267:	5f                   	pop    %edi
  101268:	5d                   	pop    %ebp
  101269:	c3                   	ret    
  10126a:	66 90                	xchg   %ax,%ax
  10126c:	83 ec 0c             	sub    $0xc,%esp
  10126f:	56                   	push   %esi
  101270:	e8 cf fe ff ff       	call   101144 <timeHandle>
  101275:	8b 46 30             	mov    0x30(%esi),%eax
  101278:	83 c4 10             	add    $0x10,%esp
  10127b:	3d 80 00 00 00       	cmp    $0x80,%eax
  101280:	75 da                	jne    10125c <irqHandle+0x78>
  101282:	66 90                	xchg   %ax,%ax
  101284:	8b 15 e0 39 10 00    	mov    0x1039e0,%edx
  10128a:	39 d3                	cmp    %edx,%ebx
  10128c:	74 d3                	je     101261 <irqHandle+0x7d>
  10128e:	89 d0                	mov    %edx,%eax
  101290:	c1 e0 07             	shl    $0x7,%eax
  101293:	01 d0                	add    %edx,%eax
  101295:	01 c0                	add    %eax,%eax
  101297:	01 d0                	add    %edx,%eax
  101299:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10129c:	8d 04 c5 b0 59 10 00 	lea    0x1059b0(,%eax,8),%eax
  1012a3:	89 47 08             	mov    %eax,0x8(%edi)
  1012a6:	8b 15 e0 39 10 00    	mov    0x1039e0,%edx
  1012ac:	89 d1                	mov    %edx,%ecx
  1012ae:	c1 e1 07             	shl    $0x7,%ecx
  1012b1:	01 d1                	add    %edx,%ecx
  1012b3:	01 c9                	add    %ecx,%ecx
  1012b5:	01 d1                	add    %edx,%ecx
  1012b7:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  1012ba:	8d 34 cd 00 5a 10 00 	lea    0x105a00(,%ecx,8),%esi
  1012c1:	b9 13 00 00 00       	mov    $0x13,%ecx
  1012c6:	89 c7                	mov    %eax,%edi
  1012c8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1012ca:	83 ec 08             	sub    $0x8,%esp
  1012cd:	c1 e2 10             	shl    $0x10,%edx
  1012d0:	52                   	push   %edx
  1012d1:	6a 23                	push   $0x23
  1012d3:	e8 5c ed ff ff       	call   100034 <change_gdt>
  1012d8:	83 c4 10             	add    $0x10,%esp
  1012db:	eb 84                	jmp    101261 <irqHandle+0x7d>
  1012dd:	8d 76 00             	lea    0x0(%esi),%esi
  1012e0:	40                   	inc    %eax
  1012e1:	0f 84 7a ff ff ff    	je     101261 <irqHandle+0x7d>
  1012e7:	83 ec 0c             	sub    $0xc,%esp
  1012ea:	68 0c 17 10 00       	push   $0x10170c
  1012ef:	e8 d8 01 00 00       	call   1014cc <printk>
  1012f4:	58                   	pop    %eax
  1012f5:	5a                   	pop    %edx
  1012f6:	ff 76 38             	pushl  0x38(%esi)
  1012f9:	ff 76 30             	pushl  0x30(%esi)
  1012fc:	68 18 18 10 00       	push   $0x101818
  101301:	6a 34                	push   $0x34
  101303:	68 b1 17 10 00       	push   $0x1017b1
  101308:	68 dc 17 10 00       	push   $0x1017dc
  10130d:	e8 ba 01 00 00       	call   1014cc <printk>
  101312:	83 c4 14             	add    $0x14,%esp
  101315:	68 3b 17 10 00       	push   $0x10173b
  10131a:	e8 ad 01 00 00       	call   1014cc <printk>
  10131f:	59                   	pop    %ecx
  101320:	58                   	pop    %eax
  101321:	6a 35                	push   $0x35
  101323:	68 b1 17 10 00       	push   $0x1017b1
  101328:	e8 13 03 00 00       	call   101640 <abort>
  10132d:	8b 46 30             	mov    0x30(%esi),%eax
  101330:	83 c4 10             	add    $0x10,%esp
  101333:	e9 1d ff ff ff       	jmp    101255 <irqHandle+0x71>
  101338:	83 ec 0c             	sub    $0xc,%esp
  10133b:	56                   	push   %esi
  10133c:	e8 b3 fd ff ff       	call   1010f4 <GProtectFaultHandle>
  101341:	8b 46 30             	mov    0x30(%esi),%eax
  101344:	83 c4 10             	add    $0x10,%esp
  101347:	e9 09 ff ff ff       	jmp    101255 <irqHandle+0x71>

0010134c <initIntr>:
  10134c:	55                   	push   %ebp
  10134d:	89 e5                	mov    %esp,%ebp
  10134f:	ba 21 00 00 00       	mov    $0x21,%edx
  101354:	b0 ff                	mov    $0xff,%al
  101356:	ee                   	out    %al,(%dx)
  101357:	ba a1 00 00 00       	mov    $0xa1,%edx
  10135c:	ee                   	out    %al,(%dx)
  10135d:	ba 20 00 00 00       	mov    $0x20,%edx
  101362:	b0 11                	mov    $0x11,%al
  101364:	ee                   	out    %al,(%dx)
  101365:	ba 21 00 00 00       	mov    $0x21,%edx
  10136a:	b0 20                	mov    $0x20,%al
  10136c:	ee                   	out    %al,(%dx)
  10136d:	b0 04                	mov    $0x4,%al
  10136f:	ee                   	out    %al,(%dx)
  101370:	b0 03                	mov    $0x3,%al
  101372:	ee                   	out    %al,(%dx)
  101373:	ba a0 00 00 00       	mov    $0xa0,%edx
  101378:	b0 11                	mov    $0x11,%al
  10137a:	ee                   	out    %al,(%dx)
  10137b:	ba a1 00 00 00       	mov    $0xa1,%edx
  101380:	b0 28                	mov    $0x28,%al
  101382:	ee                   	out    %al,(%dx)
  101383:	b0 02                	mov    $0x2,%al
  101385:	ee                   	out    %al,(%dx)
  101386:	b0 03                	mov    $0x3,%al
  101388:	ee                   	out    %al,(%dx)
  101389:	ba 20 00 00 00       	mov    $0x20,%edx
  10138e:	b0 68                	mov    $0x68,%al
  101390:	ee                   	out    %al,(%dx)
  101391:	b0 0a                	mov    $0xa,%al
  101393:	ee                   	out    %al,(%dx)
  101394:	ba a0 00 00 00       	mov    $0xa0,%edx
  101399:	b0 68                	mov    $0x68,%al
  10139b:	ee                   	out    %al,(%dx)
  10139c:	b0 0a                	mov    $0xa,%al
  10139e:	ee                   	out    %al,(%dx)
  10139f:	5d                   	pop    %ebp
  1013a0:	c3                   	ret    
  1013a1:	8d 76 00             	lea    0x0(%esi),%esi

001013a4 <initTimer>:
  1013a4:	55                   	push   %ebp
  1013a5:	89 e5                	mov    %esp,%ebp
  1013a7:	ba 43 00 00 00       	mov    $0x43,%edx
  1013ac:	b0 34                	mov    $0x34,%al
  1013ae:	ee                   	out    %al,(%dx)
  1013af:	ba 40 00 00 00       	mov    $0x40,%edx
  1013b4:	b0 9b                	mov    $0x9b,%al
  1013b6:	ee                   	out    %al,(%dx)
  1013b7:	b0 2e                	mov    $0x2e,%al
  1013b9:	ee                   	out    %al,(%dx)
  1013ba:	5d                   	pop    %ebp
  1013bb:	c3                   	ret    

001013bc <i2A>:
  1013bc:	55                   	push   %ebp
  1013bd:	89 e5                	mov    %esp,%ebp
  1013bf:	57                   	push   %edi
  1013c0:	56                   	push   %esi
  1013c1:	53                   	push   %ebx
  1013c2:	51                   	push   %ecx
  1013c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1013c6:	85 c9                	test   %ecx,%ecx
  1013c8:	78 6e                	js     101438 <i2A+0x7c>
  1013ca:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  1013ce:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  1013d2:	bb be 31 10 00       	mov    $0x1031be,%ebx
  1013d7:	31 ff                	xor    %edi,%edi
  1013d9:	eb 03                	jmp    1013de <i2A+0x22>
  1013db:	90                   	nop
  1013dc:	89 f7                	mov    %esi,%edi
  1013de:	4b                   	dec    %ebx
  1013df:	89 c8                	mov    %ecx,%eax
  1013e1:	be 0a 00 00 00       	mov    $0xa,%esi
  1013e6:	99                   	cltd   
  1013e7:	f7 fe                	idiv   %esi
  1013e9:	83 c2 30             	add    $0x30,%edx
  1013ec:	88 13                	mov    %dl,(%ebx)
  1013ee:	8d 77 01             	lea    0x1(%edi),%esi
  1013f1:	b8 67 66 66 66       	mov    $0x66666667,%eax
  1013f6:	f7 e9                	imul   %ecx
  1013f8:	89 d0                	mov    %edx,%eax
  1013fa:	c1 f8 02             	sar    $0x2,%eax
  1013fd:	c1 f9 1f             	sar    $0x1f,%ecx
  101400:	29 c8                	sub    %ecx,%eax
  101402:	89 c1                	mov    %eax,%ecx
  101404:	75 d6                	jne    1013dc <i2A+0x20>
  101406:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  10140a:	74 20                	je     10142c <i2A+0x70>
  10140c:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  101410:	75 06                	jne    101418 <i2A+0x5c>
  101412:	fe 05 bd 31 10 00    	incb   0x1031bd
  101418:	c6 05 be 31 10 00 00 	movb   $0x0,0x1031be
  10141f:	8b 45 0c             	mov    0xc(%ebp),%eax
  101422:	89 18                	mov    %ebx,(%eax)
  101424:	89 f0                	mov    %esi,%eax
  101426:	5a                   	pop    %edx
  101427:	5b                   	pop    %ebx
  101428:	5e                   	pop    %esi
  101429:	5f                   	pop    %edi
  10142a:	5d                   	pop    %ebp
  10142b:	c3                   	ret    
  10142c:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  101430:	8d 77 02             	lea    0x2(%edi),%esi
  101433:	4b                   	dec    %ebx
  101434:	eb d6                	jmp    10140c <i2A+0x50>
  101436:	66 90                	xchg   %ax,%ax
  101438:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  10143e:	74 0c                	je     10144c <i2A+0x90>
  101440:	f7 d9                	neg    %ecx
  101442:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  101446:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  10144a:	eb 86                	jmp    1013d2 <i2A+0x16>
  10144c:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  101451:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101455:	eb ef                	jmp    101446 <i2A+0x8a>
  101457:	90                   	nop

00101458 <i2X>:
  101458:	55                   	push   %ebp
  101459:	89 e5                	mov    %esp,%ebp
  10145b:	57                   	push   %edi
  10145c:	56                   	push   %esi
  10145d:	53                   	push   %ebx
  10145e:	8b 55 08             	mov    0x8(%ebp),%edx
  101461:	b9 9d 31 10 00       	mov    $0x10319d,%ecx
  101466:	31 c0                	xor    %eax,%eax
  101468:	40                   	inc    %eax
  101469:	89 d6                	mov    %edx,%esi
  10146b:	83 e6 0f             	and    $0xf,%esi
  10146e:	8d 5e f6             	lea    -0xa(%esi),%ebx
  101471:	89 cf                	mov    %ecx,%edi
  101473:	83 fb 05             	cmp    $0x5,%ebx
  101476:	77 4c                	ja     1014c4 <i2X+0x6c>
  101478:	ff 24 9d 24 18 10 00 	jmp    *0x101824(,%ebx,4)
  10147f:	90                   	nop
  101480:	c6 01 65             	movb   $0x65,(%ecx)
  101483:	90                   	nop
  101484:	49                   	dec    %ecx
  101485:	c1 ea 04             	shr    $0x4,%edx
  101488:	75 de                	jne    101468 <i2X+0x10>
  10148a:	c6 05 9e 31 10 00 00 	movb   $0x0,0x10319e
  101491:	8b 55 0c             	mov    0xc(%ebp),%edx
  101494:	89 3a                	mov    %edi,(%edx)
  101496:	5b                   	pop    %ebx
  101497:	5e                   	pop    %esi
  101498:	5f                   	pop    %edi
  101499:	5d                   	pop    %ebp
  10149a:	c3                   	ret    
  10149b:	90                   	nop
  10149c:	c6 01 64             	movb   $0x64,(%ecx)
  10149f:	eb e3                	jmp    101484 <i2X+0x2c>
  1014a1:	8d 76 00             	lea    0x0(%esi),%esi
  1014a4:	c6 01 63             	movb   $0x63,(%ecx)
  1014a7:	eb db                	jmp    101484 <i2X+0x2c>
  1014a9:	8d 76 00             	lea    0x0(%esi),%esi
  1014ac:	c6 01 62             	movb   $0x62,(%ecx)
  1014af:	eb d3                	jmp    101484 <i2X+0x2c>
  1014b1:	8d 76 00             	lea    0x0(%esi),%esi
  1014b4:	c6 01 61             	movb   $0x61,(%ecx)
  1014b7:	eb cb                	jmp    101484 <i2X+0x2c>
  1014b9:	8d 76 00             	lea    0x0(%esi),%esi
  1014bc:	c6 01 66             	movb   $0x66,(%ecx)
  1014bf:	eb c3                	jmp    101484 <i2X+0x2c>
  1014c1:	8d 76 00             	lea    0x0(%esi),%esi
  1014c4:	8d 5e 30             	lea    0x30(%esi),%ebx
  1014c7:	88 19                	mov    %bl,(%ecx)
  1014c9:	eb b9                	jmp    101484 <i2X+0x2c>
  1014cb:	90                   	nop

001014cc <printk>:
  1014cc:	55                   	push   %ebp
  1014cd:	89 e5                	mov    %esp,%ebp
  1014cf:	57                   	push   %edi
  1014d0:	56                   	push   %esi
  1014d1:	53                   	push   %ebx
  1014d2:	83 ec 2c             	sub    $0x2c,%esp
  1014d5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1014d8:	8a 11                	mov    (%ecx),%dl
  1014da:	84 d2                	test   %dl,%dl
  1014dc:	0f 84 54 01 00 00    	je     101636 <printk+0x16a>
  1014e2:	8d 45 0c             	lea    0xc(%ebp),%eax
  1014e5:	31 ff                	xor    %edi,%edi
  1014e7:	eb 18                	jmp    101501 <printk+0x35>
  1014e9:	8d 76 00             	lea    0x0(%esi),%esi
  1014ec:	8a 11                	mov    (%ecx),%dl
  1014ee:	89 cb                	mov    %ecx,%ebx
  1014f0:	88 97 c0 31 10 00    	mov    %dl,0x1031c0(%edi)
  1014f6:	47                   	inc    %edi
  1014f7:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1014fa:	8a 53 01             	mov    0x1(%ebx),%dl
  1014fd:	84 d2                	test   %dl,%dl
  1014ff:	74 72                	je     101573 <printk+0xa7>
  101501:	80 fa 25             	cmp    $0x25,%dl
  101504:	75 e6                	jne    1014ec <printk+0x20>
  101506:	8d 59 01             	lea    0x1(%ecx),%ebx
  101509:	8a 51 01             	mov    0x1(%ecx),%dl
  10150c:	80 fa 64             	cmp    $0x64,%dl
  10150f:	0f 84 bf 00 00 00    	je     1015d4 <printk+0x108>
  101515:	0f 8e 01 01 00 00    	jle    10161c <printk+0x150>
  10151b:	80 fa 73             	cmp    $0x73,%dl
  10151e:	0f 84 84 00 00 00    	je     1015a8 <printk+0xdc>
  101524:	80 fa 78             	cmp    $0x78,%dl
  101527:	75 c7                	jne    1014f0 <printk+0x24>
  101529:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  101530:	8d 70 04             	lea    0x4(%eax),%esi
  101533:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101536:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101539:	56                   	push   %esi
  10153a:	ff 30                	pushl  (%eax)
  10153c:	e8 17 ff ff ff       	call   101458 <i2X>
  101541:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  101544:	8d b7 c0 31 10 00    	lea    0x1031c0(%edi),%esi
  10154a:	8a 11                	mov    (%ecx),%dl
  10154c:	83 c4 08             	add    $0x8,%esp
  10154f:	31 c0                	xor    %eax,%eax
  101551:	84 d2                	test   %dl,%dl
  101553:	74 0f                	je     101564 <printk+0x98>
  101555:	8d 76 00             	lea    0x0(%esi),%esi
  101558:	40                   	inc    %eax
  101559:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  10155d:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  101560:	84 d2                	test   %dl,%dl
  101562:	75 f4                	jne    101558 <printk+0x8c>
  101564:	01 c7                	add    %eax,%edi
  101566:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101569:	8d 4b 01             	lea    0x1(%ebx),%ecx
  10156c:	8a 53 01             	mov    0x1(%ebx),%dl
  10156f:	84 d2                	test   %dl,%dl
  101571:	75 8e                	jne    101501 <printk+0x35>
  101573:	c6 87 c0 31 10 00 00 	movb   $0x0,0x1031c0(%edi)
  10157a:	0f be 05 c0 31 10 00 	movsbl 0x1031c0,%eax
  101581:	bb c0 31 10 00       	mov    $0x1031c0,%ebx
  101586:	84 c0                	test   %al,%al
  101588:	74 16                	je     1015a0 <printk+0xd4>
  10158a:	66 90                	xchg   %ax,%ax
  10158c:	83 ec 0c             	sub    $0xc,%esp
  10158f:	50                   	push   %eax
  101590:	e8 37 f3 ff ff       	call   1008cc <putChar>
  101595:	43                   	inc    %ebx
  101596:	0f be 03             	movsbl (%ebx),%eax
  101599:	83 c4 10             	add    $0x10,%esp
  10159c:	84 c0                	test   %al,%al
  10159e:	75 ec                	jne    10158c <printk+0xc0>
  1015a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1015a3:	5b                   	pop    %ebx
  1015a4:	5e                   	pop    %esi
  1015a5:	5f                   	pop    %edi
  1015a6:	5d                   	pop    %ebp
  1015a7:	c3                   	ret    
  1015a8:	8d 70 04             	lea    0x4(%eax),%esi
  1015ab:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1015ae:	8b 08                	mov    (%eax),%ecx
  1015b0:	8d b7 c0 31 10 00    	lea    0x1031c0(%edi),%esi
  1015b6:	8a 11                	mov    (%ecx),%dl
  1015b8:	31 c0                	xor    %eax,%eax
  1015ba:	84 d2                	test   %dl,%dl
  1015bc:	74 a6                	je     101564 <printk+0x98>
  1015be:	66 90                	xchg   %ax,%ax
  1015c0:	40                   	inc    %eax
  1015c1:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1015c5:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  1015c8:	84 d2                	test   %dl,%dl
  1015ca:	75 f4                	jne    1015c0 <printk+0xf4>
  1015cc:	01 c7                	add    %eax,%edi
  1015ce:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1015d1:	eb 96                	jmp    101569 <printk+0x9d>
  1015d3:	90                   	nop
  1015d4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1015db:	8d 70 04             	lea    0x4(%eax),%esi
  1015de:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1015e1:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  1015e4:	56                   	push   %esi
  1015e5:	ff 30                	pushl  (%eax)
  1015e7:	e8 d0 fd ff ff       	call   1013bc <i2A>
  1015ec:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1015ef:	8d b7 c0 31 10 00    	lea    0x1031c0(%edi),%esi
  1015f5:	8a 11                	mov    (%ecx),%dl
  1015f7:	83 c4 08             	add    $0x8,%esp
  1015fa:	31 c0                	xor    %eax,%eax
  1015fc:	84 d2                	test   %dl,%dl
  1015fe:	0f 84 60 ff ff ff    	je     101564 <printk+0x98>
  101604:	40                   	inc    %eax
  101605:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101609:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  10160c:	84 d2                	test   %dl,%dl
  10160e:	75 f4                	jne    101604 <printk+0x138>
  101610:	01 c7                	add    %eax,%edi
  101612:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101615:	e9 4f ff ff ff       	jmp    101569 <printk+0x9d>
  10161a:	66 90                	xchg   %ax,%ax
  10161c:	80 fa 63             	cmp    $0x63,%dl
  10161f:	0f 85 cb fe ff ff    	jne    1014f0 <printk+0x24>
  101625:	8b 10                	mov    (%eax),%edx
  101627:	88 97 c0 31 10 00    	mov    %dl,0x1031c0(%edi)
  10162d:	83 c0 04             	add    $0x4,%eax
  101630:	47                   	inc    %edi
  101631:	e9 c1 fe ff ff       	jmp    1014f7 <printk+0x2b>
  101636:	31 ff                	xor    %edi,%edi
  101638:	e9 36 ff ff ff       	jmp    101573 <printk+0xa7>
  10163d:	66 90                	xchg   %ax,%ax
  10163f:	90                   	nop

00101640 <abort>:
  101640:	55                   	push   %ebp
  101641:	89 e5                	mov    %esp,%ebp
  101643:	57                   	push   %edi
  101644:	56                   	push   %esi
  101645:	53                   	push   %ebx
  101646:	83 ec 1c             	sub    $0x1c,%esp
  101649:	8b 55 08             	mov    0x8(%ebp),%edx
  10164c:	fa                   	cli    
  10164d:	8a 02                	mov    (%edx),%al
  10164f:	b9 72 30 10 00       	mov    $0x103072,%ecx
  101654:	84 c0                	test   %al,%al
  101656:	74 0b                	je     101663 <abort+0x23>
  101658:	41                   	inc    %ecx
  101659:	42                   	inc    %edx
  10165a:	88 41 ff             	mov    %al,-0x1(%ecx)
  10165d:	8a 02                	mov    (%edx),%al
  10165f:	84 c0                	test   %al,%al
  101661:	75 f5                	jne    101658 <abort+0x18>
  101663:	c6 01 3a             	movb   $0x3a,(%ecx)
  101666:	bb dd 39 10 00       	mov    $0x1039dd,%ebx
  10166b:	be 0a 00 00 00       	mov    $0xa,%esi
  101670:	bf 67 66 66 66       	mov    $0x66666667,%edi
  101675:	4b                   	dec    %ebx
  101676:	8b 45 0c             	mov    0xc(%ebp),%eax
  101679:	99                   	cltd   
  10167a:	f7 fe                	idiv   %esi
  10167c:	8d 42 30             	lea    0x30(%edx),%eax
  10167f:	88 45 e7             	mov    %al,-0x19(%ebp)
  101682:	88 03                	mov    %al,(%ebx)
  101684:	89 f8                	mov    %edi,%eax
  101686:	f7 6d 0c             	imull  0xc(%ebp)
  101689:	c1 fa 02             	sar    $0x2,%edx
  10168c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10168f:	c1 f8 1f             	sar    $0x1f,%eax
  101692:	29 c2                	sub    %eax,%edx
  101694:	89 55 0c             	mov    %edx,0xc(%ebp)
  101697:	75 dc                	jne    101675 <abort+0x35>
  101699:	41                   	inc    %ecx
  10169a:	41                   	inc    %ecx
  10169b:	43                   	inc    %ebx
  10169c:	8a 45 e7             	mov    -0x19(%ebp),%al
  10169f:	88 41 ff             	mov    %al,-0x1(%ecx)
  1016a2:	8a 03                	mov    (%ebx),%al
  1016a4:	88 45 e7             	mov    %al,-0x19(%ebp)
  1016a7:	84 c0                	test   %al,%al
  1016a9:	75 ef                	jne    10169a <abort+0x5a>
  1016ab:	c6 01 0a             	movb   $0xa,(%ecx)
  1016ae:	0f be 05 60 30 10 00 	movsbl 0x103060,%eax
  1016b5:	84 c0                	test   %al,%al
  1016b7:	74 1b                	je     1016d4 <abort+0x94>
  1016b9:	bb 60 30 10 00       	mov    $0x103060,%ebx
  1016be:	83 ec 0c             	sub    $0xc,%esp
  1016c1:	50                   	push   %eax
  1016c2:	e8 05 f2 ff ff       	call   1008cc <putChar>
  1016c7:	43                   	inc    %ebx
  1016c8:	0f be 03             	movsbl (%ebx),%eax
  1016cb:	83 c4 10             	add    $0x10,%esp
  1016ce:	84 c0                	test   %al,%al
  1016d0:	75 ec                	jne    1016be <abort+0x7e>
  1016d2:	66 90                	xchg   %ax,%ax
  1016d4:	f4                   	hlt    
  1016d5:	eb fd                	jmp    1016d4 <abort+0x94>

001016d7 <irqEmpty>:
  1016d7:	6a 00                	push   $0x0
  1016d9:	6a ff                	push   $0xffffffff
  1016db:	eb 13                	jmp    1016f0 <asmDoIrq>

001016dd <irqGProtectFault>:
  1016dd:	6a 0d                	push   $0xd
  1016df:	eb 0f                	jmp    1016f0 <asmDoIrq>

001016e1 <irqSyscall>:
  1016e1:	6a 00                	push   $0x0
  1016e3:	68 80 00 00 00       	push   $0x80
  1016e8:	eb 06                	jmp    1016f0 <asmDoIrq>

001016ea <irqTime>:
  1016ea:	6a 00                	push   $0x0
  1016ec:	6a 20                	push   $0x20
  1016ee:	eb 00                	jmp    1016f0 <asmDoIrq>

001016f0 <asmDoIrq>:
  1016f0:	60                   	pusha  
  1016f1:	1e                   	push   %ds
  1016f2:	06                   	push   %es
  1016f3:	0f a0                	push   %fs
  1016f5:	0f a8                	push   %gs
  1016f7:	54                   	push   %esp
  1016f8:	e8 e7 fa ff ff       	call   1011e4 <irqHandle>
  1016fd:	5c                   	pop    %esp
  1016fe:	0f a9                	pop    %gs
  101700:	0f a1                	pop    %fs
  101702:	07                   	pop    %es
  101703:	1f                   	pop    %ds
  101704:	61                   	popa   
  101705:	83 c4 04             	add    $0x4,%esp
  101708:	83 c4 04             	add    $0x4,%esp
  10170b:	cf                   	iret   
