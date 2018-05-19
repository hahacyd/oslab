
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 6d 15 00 00       	call   101578 <initTimer>
  10000b:	e8 f4 0f 00 00       	call   101004 <init_pcb>
  100010:	e8 3b 10 00 00       	call   101050 <init_kernel_pcb>
  100015:	e8 02 0a 00 00       	call   100a1c <initSerial>
  10001a:	e8 11 11 00 00       	call   101130 <initIdt>
  10001f:	e8 fc 14 00 00       	call   101520 <initIntr>
  100024:	e8 4f 02 00 00       	call   100278 <initSeg>
  100029:	fb                   	sti    
  10002a:	e8 c1 04 00 00       	call   1004f0 <loadUMain>
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
  10005f:	66 c7 05 80 7c 13 01 	movw   $0xffff,0x1137c80
  100066:	ff ff 
  100068:	66 a3 82 7c 13 01    	mov    %ax,0x1137c82
  10006e:	89 c2                	mov    %eax,%edx
  100070:	c1 ea 10             	shr    $0x10,%edx
  100073:	88 15 84 7c 13 01    	mov    %dl,0x1137c84
  100079:	c6 05 85 7c 13 01 f2 	movb   $0xf2,0x1137c85
  100080:	c6 05 86 7c 13 01 cf 	movb   $0xcf,0x1137c86
  100087:	c1 e8 18             	shr    $0x18,%eax
  10008a:	a2 87 7c 13 01       	mov    %al,0x1137c87
  10008f:	66 c7 05 c0 33 10 00 	movw   $0x4f,0x1033c0
  100096:	4f 00 
  100098:	b8 60 7c 13 01       	mov    $0x1137c60,%eax
  10009d:	66 a3 c2 33 10 00    	mov    %ax,0x1033c2
  1000a3:	c1 e8 10             	shr    $0x10,%eax
  1000a6:	66 a3 c4 33 10 00    	mov    %ax,0x1033c4
  1000ac:	b8 c0 33 10 00       	mov    $0x1033c0,%eax
  1000b1:	0f 01 10             	lgdtl  (%eax)
  1000b4:	b8 01 00 00 00       	mov    $0x1,%eax
  1000b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000bc:	c9                   	leave  
  1000bd:	c3                   	ret    
  1000be:	66 90                	xchg   %ax,%ax
  1000c0:	66 c7 05 78 7c 13 01 	movw   $0xffff,0x1137c78
  1000c7:	ff ff 
  1000c9:	66 a3 7a 7c 13 01    	mov    %ax,0x1137c7a
  1000cf:	89 c2                	mov    %eax,%edx
  1000d1:	c1 ea 10             	shr    $0x10,%edx
  1000d4:	88 15 7c 7c 13 01    	mov    %dl,0x1137c7c
  1000da:	c6 05 7d 7c 13 01 fa 	movb   $0xfa,0x1137c7d
  1000e1:	c6 05 7e 7c 13 01 cf 	movb   $0xcf,0x1137c7e
  1000e8:	c1 e8 18             	shr    $0x18,%eax
  1000eb:	a2 7f 7c 13 01       	mov    %al,0x1137c7f
  1000f0:	eb 9d                	jmp    10008f <change_gdt+0x5b>
  1000f2:	66 90                	xchg   %ax,%ax
  1000f4:	83 fb 01             	cmp    $0x1,%ebx
  1000f7:	75 37                	jne    100130 <change_gdt+0xfc>
  1000f9:	66 c7 05 68 7c 13 01 	movw   $0xffff,0x1137c68
  100100:	ff ff 
  100102:	66 a3 6a 7c 13 01    	mov    %ax,0x1137c6a
  100108:	89 c2                	mov    %eax,%edx
  10010a:	c1 ea 10             	shr    $0x10,%edx
  10010d:	88 15 6c 7c 13 01    	mov    %dl,0x1137c6c
  100113:	c6 05 6d 7c 13 01 9a 	movb   $0x9a,0x1137c6d
  10011a:	c6 05 6e 7c 13 01 cf 	movb   $0xcf,0x1137c6e
  100121:	c1 e8 18             	shr    $0x18,%eax
  100124:	a2 6f 7c 13 01       	mov    %al,0x1137c6f
  100129:	e9 61 ff ff ff       	jmp    10008f <change_gdt+0x5b>
  10012e:	66 90                	xchg   %ax,%ax
  100130:	83 ec 0c             	sub    $0xc,%esp
  100133:	68 04 19 10 00       	push   $0x101904
  100138:	e8 87 15 00 00       	call   1016c4 <printk>
  10013d:	89 1c 24             	mov    %ebx,(%esp)
  100140:	68 44 19 10 00       	push   $0x101944
  100145:	6a 17                	push   $0x17
  100147:	68 0a 19 10 00       	push   $0x10190a
  10014c:	68 17 19 10 00       	push   $0x101917
  100151:	e8 6e 15 00 00       	call   1016c4 <printk>
  100156:	83 c4 14             	add    $0x14,%esp
  100159:	68 33 19 10 00       	push   $0x101933
  10015e:	e8 61 15 00 00       	call   1016c4 <printk>
  100163:	58                   	pop    %eax
  100164:	5a                   	pop    %edx
  100165:	6a 18                	push   $0x18
  100167:	68 0a 19 10 00       	push   $0x10190a
  10016c:	e8 c7 16 00 00       	call   101838 <abort>
  100171:	83 c4 10             	add    $0x10,%esp
  100174:	e9 16 ff ff ff       	jmp    10008f <change_gdt+0x5b>
  100179:	8d 76 00             	lea    0x0(%esi),%esi
  10017c:	66 c7 05 70 7c 13 01 	movw   $0xffff,0x1137c70
  100183:	ff ff 
  100185:	66 a3 72 7c 13 01    	mov    %ax,0x1137c72
  10018b:	89 c2                	mov    %eax,%edx
  10018d:	c1 ea 10             	shr    $0x10,%edx
  100190:	88 15 74 7c 13 01    	mov    %dl,0x1137c74
  100196:	c6 05 75 7c 13 01 92 	movb   $0x92,0x1137c75
  10019d:	c6 05 76 7c 13 01 cf 	movb   $0xcf,0x1137c76
  1001a4:	c1 e8 18             	shr    $0x18,%eax
  1001a7:	a2 77 7c 13 01       	mov    %al,0x1137c77
  1001ac:	e9 de fe ff ff       	jmp    10008f <change_gdt+0x5b>
  1001b1:	8d 76 00             	lea    0x0(%esi),%esi

001001b4 <change_tss>:
  1001b4:	55                   	push   %ebp
  1001b5:	89 e5                	mov    %esp,%ebp
  1001b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1001ba:	a3 c8 7c 13 01       	mov    %eax,0x1137cc8
  1001bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1001c2:	a3 c4 7c 13 01       	mov    %eax,0x1137cc4
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
  1001d8:	be c0 7c 13 01       	mov    $0x1137cc0,%esi
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
  10027b:	b9 60 7c 13 01       	mov    $0x1137c60,%ecx
  100280:	66 c7 05 68 7c 13 01 	movw   $0xffff,0x1137c68
  100287:	ff ff 
  100289:	66 c7 05 6a 7c 13 01 	movw   $0x0,0x1137c6a
  100290:	00 00 
  100292:	c6 05 6c 7c 13 01 00 	movb   $0x0,0x1137c6c
  100299:	c6 05 6d 7c 13 01 9a 	movb   $0x9a,0x1137c6d
  1002a0:	c6 05 6e 7c 13 01 cf 	movb   $0xcf,0x1137c6e
  1002a7:	c6 05 6f 7c 13 01 00 	movb   $0x0,0x1137c6f
  1002ae:	66 c7 05 70 7c 13 01 	movw   $0xffff,0x1137c70
  1002b5:	ff ff 
  1002b7:	66 c7 05 72 7c 13 01 	movw   $0x0,0x1137c72
  1002be:	00 00 
  1002c0:	c6 05 74 7c 13 01 00 	movb   $0x0,0x1137c74
  1002c7:	c6 05 75 7c 13 01 92 	movb   $0x92,0x1137c75
  1002ce:	c6 05 76 7c 13 01 cf 	movb   $0xcf,0x1137c76
  1002d5:	c6 05 77 7c 13 01 00 	movb   $0x0,0x1137c77
  1002dc:	66 c7 05 78 7c 13 01 	movw   $0xffff,0x1137c78
  1002e3:	ff ff 
  1002e5:	66 c7 05 7a 7c 13 01 	movw   $0x0,0x1137c7a
  1002ec:	00 00 
  1002ee:	c6 05 7c 7c 13 01 00 	movb   $0x0,0x1137c7c
  1002f5:	c6 05 7d 7c 13 01 fa 	movb   $0xfa,0x1137c7d
  1002fc:	c6 05 7e 7c 13 01 cf 	movb   $0xcf,0x1137c7e
  100303:	c6 05 7f 7c 13 01 00 	movb   $0x0,0x1137c7f
  10030a:	66 c7 05 80 7c 13 01 	movw   $0xffff,0x1137c80
  100311:	ff ff 
  100313:	66 c7 05 82 7c 13 01 	movw   $0x0,0x1137c82
  10031a:	00 00 
  10031c:	c6 05 84 7c 13 01 00 	movb   $0x0,0x1137c84
  100323:	c6 05 85 7c 13 01 f2 	movb   $0xf2,0x1137c85
  10032a:	c6 05 86 7c 13 01 cf 	movb   $0xcf,0x1137c86
  100331:	c6 05 87 7c 13 01 00 	movb   $0x0,0x1137c87
  100338:	66 c7 05 88 7c 13 01 	movw   $0x63,0x1137c88
  10033f:	63 00 
  100341:	b8 c0 7c 13 01       	mov    $0x1137cc0,%eax
  100346:	66 a3 8a 7c 13 01    	mov    %ax,0x1137c8a
  10034c:	89 c2                	mov    %eax,%edx
  10034e:	c1 ea 10             	shr    $0x10,%edx
  100351:	88 15 8c 7c 13 01    	mov    %dl,0x1137c8c
  100357:	c6 05 8d 7c 13 01 89 	movb   $0x89,0x1137c8d
  10035e:	c6 05 8e 7c 13 01 40 	movb   $0x40,0x1137c8e
  100365:	c1 e8 18             	shr    $0x18,%eax
  100368:	a2 8f 7c 13 01       	mov    %al,0x1137c8f
  10036d:	a1 3c 19 10 00       	mov    0x10193c,%eax
  100372:	8b 15 40 19 10 00    	mov    0x101940,%edx
  100378:	a3 90 7c 13 01       	mov    %eax,0x1137c90
  10037d:	89 15 94 7c 13 01    	mov    %edx,0x1137c94
  100383:	66 c7 05 a0 7c 13 01 	movw   $0xffff,0x1137ca0
  10038a:	ff ff 
  10038c:	66 c7 05 a2 7c 13 01 	movw   $0x0,0x1137ca2
  100393:	00 00 
  100395:	c6 05 a4 7c 13 01 00 	movb   $0x0,0x1137ca4
  10039c:	c6 05 a5 7c 13 01 f2 	movb   $0xf2,0x1137ca5
  1003a3:	c6 05 a6 7c 13 01 cf 	movb   $0xcf,0x1137ca6
  1003aa:	c6 05 a7 7c 13 01 00 	movb   $0x0,0x1137ca7
  1003b1:	66 c7 05 c0 33 10 00 	movw   $0x4f,0x1033c0
  1003b8:	4f 00 
  1003ba:	66 89 0d c2 33 10 00 	mov    %cx,0x1033c2
  1003c1:	c1 e9 10             	shr    $0x10,%ecx
  1003c4:	66 89 0d c4 33 10 00 	mov    %cx,0x1033c4
  1003cb:	b8 c0 33 10 00       	mov    $0x1033c0,%eax
  1003d0:	0f 01 10             	lgdtl  (%eax)
  1003d3:	a1 a8 5c 10 00       	mov    0x105ca8,%eax
  1003d8:	a3 c8 7c 13 01       	mov    %eax,0x1137cc8
  1003dd:	c7 05 c4 7c 13 01 5c 	movl   $0x105c5c,0x1137cc4
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
  100431:	8d 04 c5 60 3c 10 00 	lea    0x103c60(,%eax,8),%eax
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
  10045b:	53                   	push   %ebx
  10045c:	50                   	push   %eax
  10045d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100460:	c7 05 44 3c 10 00 01 	movl   $0x1,0x103c44
  100467:	00 00 00 
  10046a:	e8 d9 09 00 00       	call   100e48 <apply_new_pid>
  10046f:	89 c2                	mov    %eax,%edx
  100471:	c1 e2 07             	shl    $0x7,%edx
  100474:	01 c2                	add    %eax,%edx
  100476:	01 d2                	add    %edx,%edx
  100478:	01 c2                	add    %eax,%edx
  10047a:	8d 0c 90             	lea    (%eax,%edx,4),%ecx
  10047d:	c1 e1 03             	shl    $0x3,%ecx
  100480:	c7 81 a8 5c 10 00 23 	movl   $0x23,0x105ca8(%ecx)
  100487:	00 00 00 
  10048a:	c7 81 9c 5c 10 00 1b 	movl   $0x1b,0x105c9c(%ecx)
  100491:	00 00 00 
  100494:	c7 81 6c 5c 10 00 23 	movl   $0x23,0x105c6c(%ecx)
  10049b:	00 00 00 
  10049e:	c7 81 68 5c 10 00 23 	movl   $0x23,0x105c68(%ecx)
  1004a5:	00 00 00 
  1004a8:	c7 81 64 5c 10 00 23 	movl   $0x23,0x105c64(%ecx)
  1004af:	00 00 00 
  1004b2:	c7 81 a4 5c 10 00 00 	movl   $0x400000,0x105ca4(%ecx)
  1004b9:	00 40 00 
  1004bc:	89 99 98 5c 10 00    	mov    %ebx,0x105c98(%ecx)
  1004c2:	c7 81 b0 5c 10 00 0a 	movl   $0xa,0x105cb0(%ecx)
  1004c9:	00 00 00 
  1004cc:	83 ec 08             	sub    $0x8,%esp
  1004cf:	81 c1 60 5c 10 00    	add    $0x105c60,%ecx
  1004d5:	51                   	push   %ecx
  1004d6:	50                   	push   %eax
  1004d7:	e8 24 07 00 00       	call   100c00 <put_into_runnable>
  1004dc:	83 c4 10             	add    $0x10,%esp
  1004df:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  1004e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1004e9:	c9                   	leave  
  1004ea:	e9 21 ff ff ff       	jmp    100410 <enterUserSpace_pcb>
  1004ef:	90                   	nop

001004f0 <loadUMain>:
  1004f0:	55                   	push   %ebp
  1004f1:	89 e5                	mov    %esp,%ebp
  1004f3:	57                   	push   %edi
  1004f4:	56                   	push   %esi
  1004f5:	53                   	push   %ebx
  1004f6:	83 ec 0c             	sub    $0xc,%esp
  1004f9:	bb c9 00 00 00       	mov    $0xc9,%ebx
  1004fe:	be 00 00 03 00       	mov    $0x30000,%esi
  100503:	90                   	nop
  100504:	53                   	push   %ebx
  100505:	56                   	push   %esi
  100506:	e8 f5 fc ff ff       	call   100200 <readSect>
  10050b:	81 c6 00 02 00 00    	add    $0x200,%esi
  100511:	43                   	inc    %ebx
  100512:	58                   	pop    %eax
  100513:	5a                   	pop    %edx
  100514:	81 fb 91 01 00 00    	cmp    $0x191,%ebx
  10051a:	75 e8                	jne    100504 <loadUMain+0x14>
  10051c:	a1 1c 00 03 00       	mov    0x3001c,%eax
  100521:	8d 90 00 00 03 00    	lea    0x30000(%eax),%edx
  100527:	0f b7 35 2c 00 03 00 	movzwl 0x3002c,%esi
  10052e:	c1 e6 05             	shl    $0x5,%esi
  100531:	01 d6                	add    %edx,%esi
  100533:	39 f2                	cmp    %esi,%edx
  100535:	72 0c                	jb     100543 <loadUMain+0x53>
  100537:	eb 53                	jmp    10058c <loadUMain+0x9c>
  100539:	8d 76 00             	lea    0x0(%esi),%esi
  10053c:	83 c2 20             	add    $0x20,%edx
  10053f:	39 d6                	cmp    %edx,%esi
  100541:	76 49                	jbe    10058c <loadUMain+0x9c>
  100543:	83 3a 01             	cmpl   $0x1,(%edx)
  100546:	75 f4                	jne    10053c <loadUMain+0x4c>
  100548:	8b 42 08             	mov    0x8(%edx),%eax
  10054b:	8b 7a 10             	mov    0x10(%edx),%edi
  10054e:	8b 5a 04             	mov    0x4(%edx),%ebx
  100551:	29 c3                	sub    %eax,%ebx
  100553:	31 c9                	xor    %ecx,%ecx
  100555:	85 ff                	test   %edi,%edi
  100557:	74 16                	je     10056f <loadUMain+0x7f>
  100559:	8d 76 00             	lea    0x0(%esi),%esi
  10055c:	8a 8c 03 00 00 03 00 	mov    0x30000(%ebx,%eax,1),%cl
  100563:	88 08                	mov    %cl,(%eax)
  100565:	40                   	inc    %eax
  100566:	89 c1                	mov    %eax,%ecx
  100568:	2b 4a 08             	sub    0x8(%edx),%ecx
  10056b:	39 cf                	cmp    %ecx,%edi
  10056d:	77 ed                	ja     10055c <loadUMain+0x6c>
  10056f:	8b 5a 14             	mov    0x14(%edx),%ebx
  100572:	39 cb                	cmp    %ecx,%ebx
  100574:	76 c6                	jbe    10053c <loadUMain+0x4c>
  100576:	66 90                	xchg   %ax,%ax
  100578:	c6 00 00             	movb   $0x0,(%eax)
  10057b:	40                   	inc    %eax
  10057c:	89 c1                	mov    %eax,%ecx
  10057e:	2b 4a 08             	sub    0x8(%edx),%ecx
  100581:	39 cb                	cmp    %ecx,%ebx
  100583:	77 f3                	ja     100578 <loadUMain+0x88>
  100585:	83 c2 20             	add    $0x20,%edx
  100588:	39 d6                	cmp    %edx,%esi
  10058a:	77 b7                	ja     100543 <loadUMain+0x53>
  10058c:	31 c0                	xor    %eax,%eax
  10058e:	66 90                	xchg   %ax,%ax
  100590:	8a 90 00 00 20 00    	mov    0x200000(%eax),%dl
  100596:	88 90 00 00 21 00    	mov    %dl,0x210000(%eax)
  10059c:	40                   	inc    %eax
  10059d:	3d 00 00 01 00       	cmp    $0x10000,%eax
  1005a2:	75 ec                	jne    100590 <loadUMain+0xa0>
  1005a4:	83 ec 0c             	sub    $0xc,%esp
  1005a7:	ff 35 18 00 03 00    	pushl  0x30018
  1005ad:	e8 a6 fe ff ff       	call   100458 <enterUserSpace>
  1005b2:	83 c4 10             	add    $0x10,%esp
  1005b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1005b8:	5b                   	pop    %ebx
  1005b9:	5e                   	pop    %esi
  1005ba:	5f                   	pop    %edi
  1005bb:	5d                   	pop    %ebp
  1005bc:	c3                   	ret    
  1005bd:	66 90                	xchg   %ax,%ax
  1005bf:	90                   	nop

001005c0 <sys_exit>:
  1005c0:	55                   	push   %ebp
  1005c1:	89 e5                	mov    %esp,%ebp
  1005c3:	83 ec 08             	sub    $0x8,%esp
  1005c6:	e8 f9 04 00 00       	call   100ac4 <getpid>
  1005cb:	83 ec 0c             	sub    $0xc,%esp
  1005ce:	50                   	push   %eax
  1005cf:	e8 18 06 00 00       	call   100bec <put_into_empty>
  1005d4:	e8 83 08 00 00       	call   100e5c <get_from_runnable>
  1005d9:	5a                   	pop    %edx
  1005da:	59                   	pop    %ecx
  1005db:	ff 75 08             	pushl  0x8(%ebp)
  1005de:	50                   	push   %eax
  1005df:	e8 9c 04 00 00       	call   100a80 <put_into_running>
  1005e4:	b8 01 00 00 00       	mov    $0x1,%eax
  1005e9:	c9                   	leave  
  1005ea:	c3                   	ret    
  1005eb:	90                   	nop

001005ec <sys_getpid>:
  1005ec:	55                   	push   %ebp
  1005ed:	89 e5                	mov    %esp,%ebp
  1005ef:	5d                   	pop    %ebp
  1005f0:	e9 cf 04 00 00       	jmp    100ac4 <getpid>
  1005f5:	66 90                	xchg   %ax,%ax
  1005f7:	90                   	nop

001005f8 <sys_sleep>:
  1005f8:	55                   	push   %ebp
  1005f9:	89 e5                	mov    %esp,%ebp
  1005fb:	53                   	push   %ebx
  1005fc:	50                   	push   %eax
  1005fd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100600:	e8 bf 04 00 00       	call   100ac4 <getpid>
  100605:	83 ec 08             	sub    $0x8,%esp
  100608:	53                   	push   %ebx
  100609:	50                   	push   %eax
  10060a:	e8 45 06 00 00       	call   100c54 <put_into_block>
  10060f:	e8 48 08 00 00       	call   100e5c <get_from_runnable>
  100614:	5a                   	pop    %edx
  100615:	59                   	pop    %ecx
  100616:	53                   	push   %ebx
  100617:	50                   	push   %eax
  100618:	e8 63 04 00 00       	call   100a80 <put_into_running>
  10061d:	b8 01 00 00 00       	mov    $0x1,%eax
  100622:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100625:	c9                   	leave  
  100626:	c3                   	ret    
  100627:	90                   	nop

00100628 <sys_fork>:
  100628:	55                   	push   %ebp
  100629:	89 e5                	mov    %esp,%ebp
  10062b:	57                   	push   %edi
  10062c:	56                   	push   %esi
  10062d:	53                   	push   %ebx
  10062e:	83 ec 1c             	sub    $0x1c,%esp
  100631:	8b 75 08             	mov    0x8(%ebp),%esi
  100634:	e8 0f 08 00 00       	call   100e48 <apply_new_pid>
  100639:	89 c3                	mov    %eax,%ebx
  10063b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10063e:	c1 e0 07             	shl    $0x7,%eax
  100641:	01 d8                	add    %ebx,%eax
  100643:	01 c0                	add    %eax,%eax
  100645:	01 d8                	add    %ebx,%eax
  100647:	8d 1c 83             	lea    (%ebx,%eax,4),%ebx
  10064a:	c1 e3 03             	shl    $0x3,%ebx
  10064d:	31 ff                	xor    %edi,%edi
  10064f:	90                   	nop
  100650:	e8 6f 04 00 00       	call   100ac4 <getpid>
  100655:	89 c2                	mov    %eax,%edx
  100657:	c1 e2 07             	shl    $0x7,%edx
  10065a:	01 c2                	add    %eax,%edx
  10065c:	01 d2                	add    %edx,%edx
  10065e:	01 c2                	add    %eax,%edx
  100660:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100663:	01 c0                	add    %eax,%eax
  100665:	01 f8                	add    %edi,%eax
  100667:	8b 04 85 60 3c 10 00 	mov    0x103c60(,%eax,4),%eax
  10066e:	89 84 bb 60 3c 10 00 	mov    %eax,0x103c60(%ebx,%edi,4)
  100675:	47                   	inc    %edi
  100676:	81 ff 00 08 00 00    	cmp    $0x800,%edi
  10067c:	75 d2                	jne    100650 <sys_fork+0x28>
  10067e:	e8 41 04 00 00       	call   100ac4 <getpid>
  100683:	8d 50 40             	lea    0x40(%eax),%edx
  100686:	c1 e2 10             	shl    $0x10,%edx
  100689:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10068c:	8d 58 40             	lea    0x40(%eax),%ebx
  10068f:	c1 e3 10             	shl    $0x10,%ebx
  100692:	b8 00 00 01 00       	mov    $0x10000,%eax
  100697:	90                   	nop
  100698:	8a 8c 10 00 00 ff ff 	mov    -0x10000(%eax,%edx,1),%cl
  10069f:	88 8c 18 00 00 ff ff 	mov    %cl,-0x10000(%eax,%ebx,1)
  1006a6:	48                   	dec    %eax
  1006a7:	75 ef                	jne    100698 <sys_fork+0x70>
  1006a9:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1006ac:	89 c8                	mov    %ecx,%eax
  1006ae:	c1 e0 07             	shl    $0x7,%eax
  1006b1:	01 c8                	add    %ecx,%eax
  1006b3:	01 c0                	add    %eax,%eax
  1006b5:	01 c8                	add    %ecx,%eax
  1006b7:	8d 14 81             	lea    (%ecx,%eax,4),%edx
  1006ba:	c1 e2 03             	shl    $0x3,%edx
  1006bd:	8d 82 60 5c 10 00    	lea    0x105c60(%edx),%eax
  1006c3:	b9 13 00 00 00       	mov    $0x13,%ecx
  1006c8:	89 c7                	mov    %eax,%edi
  1006ca:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1006cc:	c7 82 8c 5c 10 00 00 	movl   $0x0,0x105c8c(%edx)
  1006d3:	00 00 00 
  1006d6:	e8 e9 03 00 00       	call   100ac4 <getpid>
  1006db:	8d 50 20             	lea    0x20(%eax),%edx
  1006de:	c1 e2 10             	shl    $0x10,%edx
  1006e1:	81 eb 00 00 20 00    	sub    $0x200000,%ebx
  1006e7:	31 c0                	xor    %eax,%eax
  1006e9:	8d 76 00             	lea    0x0(%esi),%esi
  1006ec:	8a 0c 10             	mov    (%eax,%edx,1),%cl
  1006ef:	88 0c 18             	mov    %cl,(%eax,%ebx,1)
  1006f2:	40                   	inc    %eax
  1006f3:	3d 00 00 01 00       	cmp    $0x10000,%eax
  1006f8:	75 f2                	jne    1006ec <sys_fork+0xc4>
  1006fa:	83 ec 08             	sub    $0x8,%esp
  1006fd:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  100700:	89 f0                	mov    %esi,%eax
  100702:	c1 e0 07             	shl    $0x7,%eax
  100705:	01 f0                	add    %esi,%eax
  100707:	01 c0                	add    %eax,%eax
  100709:	01 f0                	add    %esi,%eax
  10070b:	8d 04 86             	lea    (%esi,%eax,4),%eax
  10070e:	8d 04 c5 60 5c 10 00 	lea    0x105c60(,%eax,8),%eax
  100715:	50                   	push   %eax
  100716:	56                   	push   %esi
  100717:	e8 e4 04 00 00       	call   100c00 <put_into_runnable>
  10071c:	89 f0                	mov    %esi,%eax
  10071e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100721:	5b                   	pop    %ebx
  100722:	5e                   	pop    %esi
  100723:	5f                   	pop    %edi
  100724:	5d                   	pop    %ebp
  100725:	c3                   	ret    
  100726:	66 90                	xchg   %ax,%ax

00100728 <update_cursor>:
  100728:	55                   	push   %ebp
  100729:	89 e5                	mov    %esp,%ebp
  10072b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10072e:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
  100731:	c1 e1 04             	shl    $0x4,%ecx
  100734:	03 4d 0c             	add    0xc(%ebp),%ecx
  100737:	ba d4 03 00 00       	mov    $0x3d4,%edx
  10073c:	b0 0f                	mov    $0xf,%al
  10073e:	ee                   	out    %al,(%dx)
  10073f:	ba d5 03 00 00       	mov    $0x3d5,%edx
  100744:	88 c8                	mov    %cl,%al
  100746:	ee                   	out    %al,(%dx)
  100747:	ba d4 03 00 00       	mov    $0x3d4,%edx
  10074c:	b0 0e                	mov    $0xe,%al
  10074e:	ee                   	out    %al,(%dx)
  10074f:	89 c8                	mov    %ecx,%eax
  100751:	66 c1 e8 08          	shr    $0x8,%ax
  100755:	ba d5 03 00 00       	mov    $0x3d5,%edx
  10075a:	ee                   	out    %al,(%dx)
  10075b:	5d                   	pop    %ebp
  10075c:	c3                   	ret    
  10075d:	8d 76 00             	lea    0x0(%esi),%esi

00100760 <scrollScreen>:
  100760:	55                   	push   %ebp
  100761:	89 e5                	mov    %esp,%ebp
  100763:	57                   	push   %edi
  100764:	56                   	push   %esi
  100765:	53                   	push   %ebx
  100766:	83 ec 1c             	sub    $0x1c,%esp
  100769:	8b 35 cc 33 10 00    	mov    0x1033cc,%esi
  10076f:	85 f6                	test   %esi,%esi
  100771:	7e 64                	jle    1007d7 <scrollScreen+0x77>
  100773:	a1 c8 33 10 00       	mov    0x1033c8,%eax
  100778:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10077b:	31 d2                	xor    %edx,%edx
  10077d:	bb 01 00 00 00       	mov    $0x1,%ebx
  100782:	66 90                	xchg   %ax,%ax
  100784:	8d 42 50             	lea    0x50(%edx),%eax
  100787:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10078a:	01 d2                	add    %edx,%edx
  10078c:	31 c9                	xor    %ecx,%ecx
  10078e:	eb 26                	jmp    1007b6 <scrollScreen+0x56>
  100790:	8d 82 a0 00 00 00    	lea    0xa0(%edx),%eax
  100796:	89 c7                	mov    %eax,%edi
  100798:	65 8a 07             	mov    %gs:(%edi),%al
  10079b:	89 d7                	mov    %edx,%edi
  10079d:	0f b6 f8             	movzbl %al,%edi
  1007a0:	81 c7 00 0c 00 00    	add    $0xc00,%edi
  1007a6:	66 89 f8             	mov    %di,%ax
  1007a9:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1007ad:	41                   	inc    %ecx
  1007ae:	83 c2 02             	add    $0x2,%edx
  1007b1:	83 f9 51             	cmp    $0x51,%ecx
  1007b4:	74 09                	je     1007bf <scrollScreen+0x5f>
  1007b6:	39 f3                	cmp    %esi,%ebx
  1007b8:	75 d6                	jne    100790 <scrollScreen+0x30>
  1007ba:	39 4d e4             	cmp    %ecx,-0x1c(%ebp)
  1007bd:	7f d1                	jg     100790 <scrollScreen+0x30>
  1007bf:	43                   	inc    %ebx
  1007c0:	8b 55 e0             	mov    -0x20(%ebp),%edx
  1007c3:	39 f3                	cmp    %esi,%ebx
  1007c5:	7e bd                	jle    100784 <scrollScreen+0x24>
  1007c7:	8d 46 ff             	lea    -0x1(%esi),%eax
  1007ca:	a3 cc 33 10 00       	mov    %eax,0x1033cc
  1007cf:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1007d2:	5b                   	pop    %ebx
  1007d3:	5e                   	pop    %esi
  1007d4:	5f                   	pop    %edi
  1007d5:	5d                   	pop    %ebp
  1007d6:	c3                   	ret    
  1007d7:	83 ec 08             	sub    $0x8,%esp
  1007da:	6a 38                	push   $0x38
  1007dc:	68 4f 19 10 00       	push   $0x10194f
  1007e1:	e8 52 10 00 00       	call   101838 <abort>
  1007e6:	8b 35 cc 33 10 00    	mov    0x1033cc,%esi
  1007ec:	83 c4 10             	add    $0x10,%esp
  1007ef:	85 f6                	test   %esi,%esi
  1007f1:	7f 80                	jg     100773 <scrollScreen+0x13>
  1007f3:	8d 46 ff             	lea    -0x1(%esi),%eax
  1007f6:	a3 cc 33 10 00       	mov    %eax,0x1033cc
  1007fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1007fe:	5b                   	pop    %ebx
  1007ff:	5e                   	pop    %esi
  100800:	5f                   	pop    %edi
  100801:	5d                   	pop    %ebp
  100802:	c3                   	ret    
  100803:	90                   	nop

00100804 <printkernel>:
  100804:	55                   	push   %ebp
  100805:	89 e5                	mov    %esp,%ebp
  100807:	57                   	push   %edi
  100808:	56                   	push   %esi
  100809:	53                   	push   %ebx
  10080a:	83 ec 1c             	sub    $0x1c,%esp
  10080d:	8b 55 0c             	mov    0xc(%ebp),%edx
  100810:	85 d2                	test   %edx,%edx
  100812:	0f 8e f2 00 00 00    	jle    10090a <printkernel+0x106>
  100818:	8b 45 08             	mov    0x8(%ebp),%eax
  10081b:	0f be 00             	movsbl (%eax),%eax
  10081e:	84 c0                	test   %al,%al
  100820:	0f 84 e4 00 00 00    	je     10090a <printkernel+0x106>
  100826:	03 55 08             	add    0x8(%ebp),%edx
  100829:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  10082c:	eb 1f                	jmp    10084d <printkernel+0x49>
  10082e:	66 90                	xchg   %ax,%ax
  100830:	ff 45 08             	incl   0x8(%ebp)
  100833:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100836:	39 45 08             	cmp    %eax,0x8(%ebp)
  100839:	0f 84 cb 00 00 00    	je     10090a <printkernel+0x106>
  10083f:	8b 45 08             	mov    0x8(%ebp),%eax
  100842:	0f be 00             	movsbl (%eax),%eax
  100845:	84 c0                	test   %al,%al
  100847:	0f 84 bd 00 00 00    	je     10090a <printkernel+0x106>
  10084d:	3c 0a                	cmp    $0xa,%al
  10084f:	0f 84 d7 00 00 00    	je     10092c <printkernel+0x128>
  100855:	8b 35 c8 33 10 00    	mov    0x1033c8,%esi
  10085b:	8b 0d cc 33 10 00    	mov    0x1033cc,%ecx
  100861:	8d 14 89             	lea    (%ecx,%ecx,4),%edx
  100864:	c1 e2 04             	shl    $0x4,%edx
  100867:	01 f2                	add    %esi,%edx
  100869:	01 d2                	add    %edx,%edx
  10086b:	89 d7                	mov    %edx,%edi
  10086d:	8d 90 00 0c 00 00    	lea    0xc00(%eax),%edx
  100873:	66 89 d0             	mov    %dx,%ax
  100876:	65 66 89 07          	mov    %ax,%gs:(%edi)
  10087a:	46                   	inc    %esi
  10087b:	8d 1c 89             	lea    (%ecx,%ecx,4),%ebx
  10087e:	c1 e3 04             	shl    $0x4,%ebx
  100881:	01 f3                	add    %esi,%ebx
  100883:	b0 0f                	mov    $0xf,%al
  100885:	ba d4 03 00 00       	mov    $0x3d4,%edx
  10088a:	ee                   	out    %al,(%dx)
  10088b:	bf d5 03 00 00       	mov    $0x3d5,%edi
  100890:	88 d8                	mov    %bl,%al
  100892:	89 fa                	mov    %edi,%edx
  100894:	ee                   	out    %al,(%dx)
  100895:	b0 0e                	mov    $0xe,%al
  100897:	ba d4 03 00 00       	mov    $0x3d4,%edx
  10089c:	ee                   	out    %al,(%dx)
  10089d:	89 d8                	mov    %ebx,%eax
  10089f:	66 c1 e8 08          	shr    $0x8,%ax
  1008a3:	89 fa                	mov    %edi,%edx
  1008a5:	ee                   	out    %al,(%dx)
  1008a6:	83 fe 50             	cmp    $0x50,%esi
  1008a9:	74 6d                	je     100918 <printkernel+0x114>
  1008ab:	89 35 c8 33 10 00    	mov    %esi,0x1033c8
  1008b1:	83 f9 14             	cmp    $0x14,%ecx
  1008b4:	0f 8e 76 ff ff ff    	jle    100830 <printkernel+0x2c>
  1008ba:	83 ec 0c             	sub    $0xc,%esp
  1008bd:	51                   	push   %ecx
  1008be:	e8 9d fe ff ff       	call   100760 <scrollScreen>
  1008c3:	8b 0d cc 33 10 00    	mov    0x1033cc,%ecx
  1008c9:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
  1008cc:	c1 e1 04             	shl    $0x4,%ecx
  1008cf:	03 0d c8 33 10 00    	add    0x1033c8,%ecx
  1008d5:	b0 0f                	mov    $0xf,%al
  1008d7:	ba d4 03 00 00       	mov    $0x3d4,%edx
  1008dc:	ee                   	out    %al,(%dx)
  1008dd:	bb d5 03 00 00       	mov    $0x3d5,%ebx
  1008e2:	88 c8                	mov    %cl,%al
  1008e4:	89 da                	mov    %ebx,%edx
  1008e6:	ee                   	out    %al,(%dx)
  1008e7:	b0 0e                	mov    $0xe,%al
  1008e9:	ba d4 03 00 00       	mov    $0x3d4,%edx
  1008ee:	ee                   	out    %al,(%dx)
  1008ef:	89 c8                	mov    %ecx,%eax
  1008f1:	66 c1 e8 08          	shr    $0x8,%ax
  1008f5:	89 da                	mov    %ebx,%edx
  1008f7:	ee                   	out    %al,(%dx)
  1008f8:	83 c4 10             	add    $0x10,%esp
  1008fb:	ff 45 08             	incl   0x8(%ebp)
  1008fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100901:	39 45 08             	cmp    %eax,0x8(%ebp)
  100904:	0f 85 35 ff ff ff    	jne    10083f <printkernel+0x3b>
  10090a:	b8 01 00 00 00       	mov    $0x1,%eax
  10090f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100912:	5b                   	pop    %ebx
  100913:	5e                   	pop    %esi
  100914:	5f                   	pop    %edi
  100915:	5d                   	pop    %ebp
  100916:	c3                   	ret    
  100917:	90                   	nop
  100918:	c7 05 c8 33 10 00 00 	movl   $0x0,0x1033c8
  10091f:	00 00 00 
  100922:	41                   	inc    %ecx
  100923:	89 0d cc 33 10 00    	mov    %ecx,0x1033cc
  100929:	eb 86                	jmp    1008b1 <printkernel+0xad>
  10092b:	90                   	nop
  10092c:	8b 15 c8 33 10 00    	mov    0x1033c8,%edx
  100932:	8b 0d cc 33 10 00    	mov    0x1033cc,%ecx
  100938:	83 fa 50             	cmp    $0x50,%edx
  10093b:	7f 27                	jg     100964 <printkernel+0x160>
  10093d:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  100940:	c1 e0 04             	shl    $0x4,%eax
  100943:	01 c2                	add    %eax,%edx
  100945:	01 d2                	add    %edx,%edx
  100947:	8d b4 00 a2 00 00 00 	lea    0xa2(%eax,%eax,1),%esi
  10094e:	bb 20 0c 00 00       	mov    $0xc20,%ebx
  100953:	90                   	nop
  100954:	89 d7                	mov    %edx,%edi
  100956:	66 89 d8             	mov    %bx,%ax
  100959:	65 66 89 07          	mov    %ax,%gs:(%edi)
  10095d:	83 c2 02             	add    $0x2,%edx
  100960:	39 d6                	cmp    %edx,%esi
  100962:	75 f0                	jne    100954 <printkernel+0x150>
  100964:	c7 05 c8 33 10 00 00 	movl   $0x0,0x1033c8
  10096b:	00 00 00 
  10096e:	41                   	inc    %ecx
  10096f:	89 0d cc 33 10 00    	mov    %ecx,0x1033cc
  100975:	8d 1c 89             	lea    (%ecx,%ecx,4),%ebx
  100978:	c1 e3 04             	shl    $0x4,%ebx
  10097b:	b0 0f                	mov    $0xf,%al
  10097d:	ba d4 03 00 00       	mov    $0x3d4,%edx
  100982:	ee                   	out    %al,(%dx)
  100983:	be d5 03 00 00       	mov    $0x3d5,%esi
  100988:	88 d8                	mov    %bl,%al
  10098a:	89 f2                	mov    %esi,%edx
  10098c:	ee                   	out    %al,(%dx)
  10098d:	b0 0e                	mov    $0xe,%al
  10098f:	ba d4 03 00 00       	mov    $0x3d4,%edx
  100994:	ee                   	out    %al,(%dx)
  100995:	89 d8                	mov    %ebx,%eax
  100997:	66 c1 e8 08          	shr    $0x8,%ax
  10099b:	89 f2                	mov    %esi,%edx
  10099d:	ee                   	out    %al,(%dx)
  10099e:	e9 0e ff ff ff       	jmp    1008b1 <printkernel+0xad>
  1009a3:	90                   	nop

001009a4 <sys_write>:
  1009a4:	55                   	push   %ebp
  1009a5:	89 e5                	mov    %esp,%ebp
  1009a7:	56                   	push   %esi
  1009a8:	53                   	push   %ebx
  1009a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1009ac:	ba 30 00 00 00       	mov    $0x30,%edx
  1009b1:	89 d0                	mov    %edx,%eax
  1009b3:	8e e8                	mov    %eax,%gs
  1009b5:	8b 43 20             	mov    0x20(%ebx),%eax
  1009b8:	48                   	dec    %eax
  1009b9:	83 f8 01             	cmp    $0x1,%eax
  1009bc:	76 12                	jbe    1009d0 <sys_write+0x2c>
  1009be:	83 ec 08             	sub    $0x8,%esp
  1009c1:	6a 5c                	push   $0x5c
  1009c3:	68 4f 19 10 00       	push   $0x10194f
  1009c8:	e8 6b 0e 00 00       	call   101838 <abort>
  1009cd:	83 c4 10             	add    $0x10,%esp
  1009d0:	8b 73 24             	mov    0x24(%ebx),%esi
  1009d3:	e8 ec 00 00 00       	call   100ac4 <getpid>
  1009d8:	83 ec 08             	sub    $0x8,%esp
  1009db:	56                   	push   %esi
  1009dc:	c1 e0 10             	shl    $0x10,%eax
  1009df:	03 43 28             	add    0x28(%ebx),%eax
  1009e2:	50                   	push   %eax
  1009e3:	e8 1c fe ff ff       	call   100804 <printkernel>
  1009e8:	83 c4 10             	add    $0x10,%esp
  1009eb:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1009ee:	5b                   	pop    %ebx
  1009ef:	5e                   	pop    %esi
  1009f0:	5d                   	pop    %ebp
  1009f1:	c3                   	ret    
  1009f2:	66 90                	xchg   %ax,%ax

001009f4 <print_char>:
  1009f4:	55                   	push   %ebp
  1009f5:	89 e5                	mov    %esp,%ebp
  1009f7:	57                   	push   %edi
  1009f8:	8b 45 08             	mov    0x8(%ebp),%eax
  1009fb:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1009fe:	c1 e0 04             	shl    $0x4,%eax
  100a01:	03 45 0c             	add    0xc(%ebp),%eax
  100a04:	01 c0                	add    %eax,%eax
  100a06:	89 c7                	mov    %eax,%edi
  100a08:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  100a0c:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  100a12:	66 89 d0             	mov    %dx,%ax
  100a15:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100a19:	5f                   	pop    %edi
  100a1a:	5d                   	pop    %ebp
  100a1b:	c3                   	ret    

00100a1c <initSerial>:
  100a1c:	55                   	push   %ebp
  100a1d:	89 e5                	mov    %esp,%ebp
  100a1f:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100a24:	31 c0                	xor    %eax,%eax
  100a26:	ee                   	out    %al,(%dx)
  100a27:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100a2c:	b0 80                	mov    $0x80,%al
  100a2e:	ee                   	out    %al,(%dx)
  100a2f:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100a34:	b0 01                	mov    $0x1,%al
  100a36:	ee                   	out    %al,(%dx)
  100a37:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100a3c:	31 c0                	xor    %eax,%eax
  100a3e:	ee                   	out    %al,(%dx)
  100a3f:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100a44:	b0 03                	mov    $0x3,%al
  100a46:	ee                   	out    %al,(%dx)
  100a47:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100a4c:	b0 c7                	mov    $0xc7,%al
  100a4e:	ee                   	out    %al,(%dx)
  100a4f:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100a54:	b0 0b                	mov    $0xb,%al
  100a56:	ee                   	out    %al,(%dx)
  100a57:	5d                   	pop    %ebp
  100a58:	c3                   	ret    
  100a59:	8d 76 00             	lea    0x0(%esi),%esi

00100a5c <putChar>:
  100a5c:	55                   	push   %ebp
  100a5d:	89 e5                	mov    %esp,%ebp
  100a5f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100a62:	ba fd 03 00 00       	mov    $0x3fd,%edx
  100a67:	90                   	nop
  100a68:	ec                   	in     (%dx),%al
  100a69:	a8 20                	test   $0x20,%al
  100a6b:	74 fb                	je     100a68 <putChar+0xc>
  100a6d:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100a72:	88 c8                	mov    %cl,%al
  100a74:	ee                   	out    %al,(%dx)
  100a75:	5d                   	pop    %ebp
  100a76:	c3                   	ret    
  100a77:	90                   	nop

00100a78 <IDLE>:
  100a78:	55                   	push   %ebp
  100a79:	89 e5                	mov    %esp,%ebp
  100a7b:	90                   	nop
  100a7c:	f4                   	hlt    
  100a7d:	eb fd                	jmp    100a7c <IDLE+0x4>
  100a7f:	90                   	nop

00100a80 <put_into_running>:
  100a80:	55                   	push   %ebp
  100a81:	89 e5                	mov    %esp,%ebp
  100a83:	83 ec 08             	sub    $0x8,%esp
  100a86:	8b 55 08             	mov    0x8(%ebp),%edx
  100a89:	39 15 40 3c 10 00    	cmp    %edx,0x103c40
  100a8f:	74 29                	je     100aba <put_into_running+0x3a>
  100a91:	89 15 40 3c 10 00    	mov    %edx,0x103c40
  100a97:	83 ec 08             	sub    $0x8,%esp
  100a9a:	89 d0                	mov    %edx,%eax
  100a9c:	c1 e0 07             	shl    $0x7,%eax
  100a9f:	01 d0                	add    %edx,%eax
  100aa1:	01 c0                	add    %eax,%eax
  100aa3:	01 d0                	add    %edx,%eax
  100aa5:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100aa8:	8d 04 c5 5c 5c 10 00 	lea    0x105c5c(,%eax,8),%eax
  100aaf:	50                   	push   %eax
  100ab0:	6a 10                	push   $0x10
  100ab2:	e8 fd f6 ff ff       	call   1001b4 <change_tss>
  100ab7:	83 c4 10             	add    $0x10,%esp
  100aba:	b8 01 00 00 00       	mov    $0x1,%eax
  100abf:	c9                   	leave  
  100ac0:	c3                   	ret    
  100ac1:	8d 76 00             	lea    0x0(%esi),%esi

00100ac4 <getpid>:
  100ac4:	55                   	push   %ebp
  100ac5:	89 e5                	mov    %esp,%ebp
  100ac7:	a1 40 3c 10 00       	mov    0x103c40,%eax
  100acc:	5d                   	pop    %ebp
  100acd:	c3                   	ret    
  100ace:	66 90                	xchg   %ax,%ax

00100ad0 <getrunnable>:
  100ad0:	55                   	push   %ebp
  100ad1:	89 e5                	mov    %esp,%ebp
  100ad3:	a1 a4 32 10 00       	mov    0x1032a4,%eax
  100ad8:	5d                   	pop    %ebp
  100ad9:	c3                   	ret    
  100ada:	66 90                	xchg   %ax,%ax

00100adc <getblocked>:
  100adc:	55                   	push   %ebp
  100add:	89 e5                	mov    %esp,%ebp
  100adf:	a1 a0 32 10 00       	mov    0x1032a0,%eax
  100ae4:	5d                   	pop    %ebp
  100ae5:	c3                   	ret    
  100ae6:	66 90                	xchg   %ax,%ax

00100ae8 <put_into>:
  100ae8:	55                   	push   %ebp
  100ae9:	89 e5                	mov    %esp,%ebp
  100aeb:	56                   	push   %esi
  100aec:	53                   	push   %ebx
  100aed:	8b 55 08             	mov    0x8(%ebp),%edx
  100af0:	8b 45 0c             	mov    0xc(%ebp),%eax
  100af3:	83 fa 01             	cmp    $0x1,%edx
  100af6:	0f 84 e0 00 00 00    	je     100bdc <put_into+0xf4>
  100afc:	83 fa 03             	cmp    $0x3,%edx
  100aff:	0f 84 97 00 00 00    	je     100b9c <put_into+0xb4>
  100b05:	85 d2                	test   %edx,%edx
  100b07:	74 1f                	je     100b28 <put_into+0x40>
  100b09:	83 ec 08             	sub    $0x8,%esp
  100b0c:	6a 5f                	push   $0x5f
  100b0e:	68 6b 19 10 00       	push   $0x10196b
  100b13:	e8 20 0d 00 00       	call   101838 <abort>
  100b18:	83 c4 10             	add    $0x10,%esp
  100b1b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100b20:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100b23:	5b                   	pop    %ebx
  100b24:	5e                   	pop    %esi
  100b25:	5d                   	pop    %ebp
  100b26:	c3                   	ret    
  100b27:	90                   	nop
  100b28:	8b 0d a0 32 10 00    	mov    0x1032a0,%ecx
  100b2e:	ba a0 32 10 00       	mov    $0x1032a0,%edx
  100b33:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100b36:	74 74                	je     100bac <put_into+0xc4>
  100b38:	89 ca                	mov    %ecx,%edx
  100b3a:	c1 e2 07             	shl    $0x7,%edx
  100b3d:	01 ca                	add    %ecx,%edx
  100b3f:	01 d2                	add    %edx,%edx
  100b41:	01 ca                	add    %ecx,%edx
  100b43:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100b46:	8d 34 d5 60 3c 10 00 	lea    0x103c60(,%edx,8),%esi
  100b4d:	8b 9e 5c 20 00 00    	mov    0x205c(%esi),%ebx
  100b53:	89 da                	mov    %ebx,%edx
  100b55:	c1 e2 07             	shl    $0x7,%edx
  100b58:	01 da                	add    %ebx,%edx
  100b5a:	01 d2                	add    %edx,%edx
  100b5c:	01 da                	add    %ebx,%edx
  100b5e:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100b61:	89 04 d5 c0 5c 10 00 	mov    %eax,0x105cc0(,%edx,8)
  100b68:	89 c2                	mov    %eax,%edx
  100b6a:	c1 e2 07             	shl    $0x7,%edx
  100b6d:	01 c2                	add    %eax,%edx
  100b6f:	01 d2                	add    %edx,%edx
  100b71:	01 c2                	add    %eax,%edx
  100b73:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100b76:	8d 14 d5 60 3c 10 00 	lea    0x103c60(,%edx,8),%edx
  100b7d:	89 9a 5c 20 00 00    	mov    %ebx,0x205c(%edx)
  100b83:	89 8a 60 20 00 00    	mov    %ecx,0x2060(%edx)
  100b89:	89 86 5c 20 00 00    	mov    %eax,0x205c(%esi)
  100b8f:	b8 01 00 00 00       	mov    $0x1,%eax
  100b94:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100b97:	5b                   	pop    %ebx
  100b98:	5e                   	pop    %esi
  100b99:	5d                   	pop    %ebp
  100b9a:	c3                   	ret    
  100b9b:	90                   	nop
  100b9c:	8b 0d d0 33 10 00    	mov    0x1033d0,%ecx
  100ba2:	ba d0 33 10 00       	mov    $0x1033d0,%edx
  100ba7:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100baa:	75 8c                	jne    100b38 <put_into+0x50>
  100bac:	89 02                	mov    %eax,(%edx)
  100bae:	89 c2                	mov    %eax,%edx
  100bb0:	c1 e2 07             	shl    $0x7,%edx
  100bb3:	01 c2                	add    %eax,%edx
  100bb5:	01 d2                	add    %edx,%edx
  100bb7:	01 c2                	add    %eax,%edx
  100bb9:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100bbc:	8d 14 d5 60 3c 10 00 	lea    0x103c60(,%edx,8),%edx
  100bc3:	89 82 60 20 00 00    	mov    %eax,0x2060(%edx)
  100bc9:	89 82 5c 20 00 00    	mov    %eax,0x205c(%edx)
  100bcf:	b8 01 00 00 00       	mov    $0x1,%eax
  100bd4:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100bd7:	5b                   	pop    %ebx
  100bd8:	5e                   	pop    %esi
  100bd9:	5d                   	pop    %ebp
  100bda:	c3                   	ret    
  100bdb:	90                   	nop
  100bdc:	8b 0d a4 32 10 00    	mov    0x1032a4,%ecx
  100be2:	ba a4 32 10 00       	mov    $0x1032a4,%edx
  100be7:	e9 47 ff ff ff       	jmp    100b33 <put_into+0x4b>

00100bec <put_into_empty>:
  100bec:	55                   	push   %ebp
  100bed:	89 e5                	mov    %esp,%ebp
  100bef:	83 ec 10             	sub    $0x10,%esp
  100bf2:	ff 75 08             	pushl  0x8(%ebp)
  100bf5:	6a 03                	push   $0x3
  100bf7:	e8 ec fe ff ff       	call   100ae8 <put_into>
  100bfc:	c9                   	leave  
  100bfd:	c3                   	ret    
  100bfe:	66 90                	xchg   %ax,%ax

00100c00 <put_into_runnable>:
  100c00:	55                   	push   %ebp
  100c01:	89 e5                	mov    %esp,%ebp
  100c03:	57                   	push   %edi
  100c04:	56                   	push   %esi
  100c05:	53                   	push   %ebx
  100c06:	8b 55 08             	mov    0x8(%ebp),%edx
  100c09:	8b 75 0c             	mov    0xc(%ebp),%esi
  100c0c:	89 d0                	mov    %edx,%eax
  100c0e:	c1 e0 07             	shl    $0x7,%eax
  100c11:	01 d0                	add    %edx,%eax
  100c13:	01 c0                	add    %eax,%eax
  100c15:	01 d0                	add    %edx,%eax
  100c17:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
  100c1a:	c1 e3 03             	shl    $0x3,%ebx
  100c1d:	8d 83 60 5c 10 00    	lea    0x105c60(%ebx),%eax
  100c23:	b9 13 00 00 00       	mov    $0x13,%ecx
  100c28:	89 c7                	mov    %eax,%edi
  100c2a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100c2c:	a1 48 3c 10 00       	mov    0x103c48,%eax
  100c31:	89 83 b0 5c 10 00    	mov    %eax,0x105cb0(%ebx)
  100c37:	c7 83 ac 5c 10 00 01 	movl   $0x1,0x105cac(%ebx)
  100c3e:	00 00 00 
  100c41:	89 55 0c             	mov    %edx,0xc(%ebp)
  100c44:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
  100c4b:	5b                   	pop    %ebx
  100c4c:	5e                   	pop    %esi
  100c4d:	5f                   	pop    %edi
  100c4e:	5d                   	pop    %ebp
  100c4f:	e9 94 fe ff ff       	jmp    100ae8 <put_into>

00100c54 <put_into_block>:
  100c54:	55                   	push   %ebp
  100c55:	89 e5                	mov    %esp,%ebp
  100c57:	57                   	push   %edi
  100c58:	56                   	push   %esi
  100c59:	53                   	push   %ebx
  100c5a:	8b 55 08             	mov    0x8(%ebp),%edx
  100c5d:	89 d0                	mov    %edx,%eax
  100c5f:	c1 e0 07             	shl    $0x7,%eax
  100c62:	01 d0                	add    %edx,%eax
  100c64:	01 c0                	add    %eax,%eax
  100c66:	01 d0                	add    %edx,%eax
  100c68:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
  100c6b:	c1 e3 03             	shl    $0x3,%ebx
  100c6e:	8d 83 60 5c 10 00    	lea    0x105c60(%ebx),%eax
  100c74:	b9 13 00 00 00       	mov    $0x13,%ecx
  100c79:	89 c7                	mov    %eax,%edi
  100c7b:	8b 75 0c             	mov    0xc(%ebp),%esi
  100c7e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100c80:	8b 45 0c             	mov    0xc(%ebp),%eax
  100c83:	8b 40 20             	mov    0x20(%eax),%eax
  100c86:	89 83 b4 5c 10 00    	mov    %eax,0x105cb4(%ebx)
  100c8c:	c7 83 ac 5c 10 00 00 	movl   $0x0,0x105cac(%ebx)
  100c93:	00 00 00 
  100c96:	89 55 0c             	mov    %edx,0xc(%ebp)
  100c99:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  100ca0:	5b                   	pop    %ebx
  100ca1:	5e                   	pop    %esi
  100ca2:	5f                   	pop    %edi
  100ca3:	5d                   	pop    %ebp
  100ca4:	e9 3f fe ff ff       	jmp    100ae8 <put_into>
  100ca9:	8d 76 00             	lea    0x0(%esi),%esi

00100cac <get_from>:
  100cac:	55                   	push   %ebp
  100cad:	89 e5                	mov    %esp,%ebp
  100caf:	56                   	push   %esi
  100cb0:	53                   	push   %ebx
  100cb1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100cb4:	8b 75 0c             	mov    0xc(%ebp),%esi
  100cb7:	39 f3                	cmp    %esi,%ebx
  100cb9:	74 42                	je     100cfd <get_from+0x51>
  100cbb:	89 d8                	mov    %ebx,%eax
  100cbd:	c1 e0 07             	shl    $0x7,%eax
  100cc0:	01 d8                	add    %ebx,%eax
  100cc2:	01 c0                	add    %eax,%eax
  100cc4:	01 d8                	add    %ebx,%eax
  100cc6:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100cc9:	8b 0c c5 c0 5c 10 00 	mov    0x105cc0(,%eax,8),%ecx
  100cd0:	39 cb                	cmp    %ecx,%ebx
  100cd2:	75 25                	jne    100cf9 <get_from+0x4d>
  100cd4:	e9 f3 00 00 00       	jmp    100dcc <get_from+0x120>
  100cd9:	8d 76 00             	lea    0x0(%esi),%esi
  100cdc:	89 ca                	mov    %ecx,%edx
  100cde:	c1 e2 07             	shl    $0x7,%edx
  100ce1:	01 ca                	add    %ecx,%edx
  100ce3:	01 d2                	add    %edx,%edx
  100ce5:	01 ca                	add    %ecx,%edx
  100ce7:	8d 04 91             	lea    (%ecx,%edx,4),%eax
  100cea:	8b 0c c5 c0 5c 10 00 	mov    0x105cc0(,%eax,8),%ecx
  100cf1:	39 cb                	cmp    %ecx,%ebx
  100cf3:	0f 84 d3 00 00 00    	je     100dcc <get_from+0x120>
  100cf9:	39 ce                	cmp    %ecx,%esi
  100cfb:	75 df                	jne    100cdc <get_from+0x30>
  100cfd:	89 f0                	mov    %esi,%eax
  100cff:	c1 e0 07             	shl    $0x7,%eax
  100d02:	01 f0                	add    %esi,%eax
  100d04:	01 c0                	add    %eax,%eax
  100d06:	01 f0                	add    %esi,%eax
  100d08:	8d 04 86             	lea    (%esi,%eax,4),%eax
  100d0b:	8b 04 c5 ac 5c 10 00 	mov    0x105cac(,%eax,8),%eax
  100d12:	83 f8 01             	cmp    $0x1,%eax
  100d15:	0f 84 11 01 00 00    	je     100e2c <get_from+0x180>
  100d1b:	83 f8 03             	cmp    $0x3,%eax
  100d1e:	74 24                	je     100d44 <get_from+0x98>
  100d20:	85 c0                	test   %eax,%eax
  100d22:	0f 84 f8 00 00 00    	je     100e20 <get_from+0x174>
  100d28:	83 ec 08             	sub    $0x8,%esp
  100d2b:	68 92 00 00 00       	push   $0x92
  100d30:	68 6b 19 10 00       	push   $0x10196b
  100d35:	e8 fe 0a 00 00       	call   101838 <abort>
  100d3a:	a1 00 00 00 00       	mov    0x0,%eax
  100d3f:	0f 0b                	ud2    
  100d41:	8d 76 00             	lea    0x0(%esi),%esi
  100d44:	be d0 33 10 00       	mov    $0x1033d0,%esi
  100d49:	3b 1e                	cmp    (%esi),%ebx
  100d4b:	74 15                	je     100d62 <get_from+0xb6>
  100d4d:	83 ec 08             	sub    $0x8,%esp
  100d50:	68 97 00 00 00       	push   $0x97
  100d55:	68 6b 19 10 00       	push   $0x10196b
  100d5a:	e8 d9 0a 00 00       	call   101838 <abort>
  100d5f:	83 c4 10             	add    $0x10,%esp
  100d62:	83 fb ff             	cmp    $0xffffffff,%ebx
  100d65:	0f 84 a9 00 00 00    	je     100e14 <get_from+0x168>
  100d6b:	89 d8                	mov    %ebx,%eax
  100d6d:	c1 e0 07             	shl    $0x7,%eax
  100d70:	01 d8                	add    %ebx,%eax
  100d72:	01 c0                	add    %eax,%eax
  100d74:	01 d8                	add    %ebx,%eax
  100d76:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100d79:	8d 04 c5 60 3c 10 00 	lea    0x103c60(,%eax,8),%eax
  100d80:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100d86:	39 da                	cmp    %ebx,%edx
  100d88:	0f 84 aa 00 00 00    	je     100e38 <get_from+0x18c>
  100d8e:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100d94:	89 c8                	mov    %ecx,%eax
  100d96:	c1 e0 07             	shl    $0x7,%eax
  100d99:	01 c8                	add    %ecx,%eax
  100d9b:	01 c0                	add    %eax,%eax
  100d9d:	01 c8                	add    %ecx,%eax
  100d9f:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100da2:	89 14 c5 c0 5c 10 00 	mov    %edx,0x105cc0(,%eax,8)
  100da9:	89 d0                	mov    %edx,%eax
  100dab:	c1 e0 07             	shl    $0x7,%eax
  100dae:	01 d0                	add    %edx,%eax
  100db0:	01 c0                	add    %eax,%eax
  100db2:	01 d0                	add    %edx,%eax
  100db4:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100db7:	89 0c c5 bc 5c 10 00 	mov    %ecx,0x105cbc(,%eax,8)
  100dbe:	89 16                	mov    %edx,(%esi)
  100dc0:	89 d8                	mov    %ebx,%eax
  100dc2:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100dc5:	5b                   	pop    %ebx
  100dc6:	5e                   	pop    %esi
  100dc7:	5d                   	pop    %ebp
  100dc8:	c3                   	ret    
  100dc9:	8d 76 00             	lea    0x0(%esi),%esi
  100dcc:	83 ec 0c             	sub    $0xc,%esp
  100dcf:	68 04 19 10 00       	push   $0x101904
  100dd4:	e8 eb 08 00 00       	call   1016c4 <printk>
  100dd9:	58                   	pop    %eax
  100dda:	5a                   	pop    %edx
  100ddb:	56                   	push   %esi
  100ddc:	53                   	push   %ebx
  100ddd:	68 a0 19 10 00       	push   $0x1019a0
  100de2:	6a 7f                	push   $0x7f
  100de4:	68 6b 19 10 00       	push   $0x10196b
  100de9:	68 7c 19 10 00       	push   $0x10197c
  100dee:	e8 d1 08 00 00       	call   1016c4 <printk>
  100df3:	83 c4 14             	add    $0x14,%esp
  100df6:	68 33 19 10 00       	push   $0x101933
  100dfb:	e8 c4 08 00 00       	call   1016c4 <printk>
  100e00:	59                   	pop    %ecx
  100e01:	5b                   	pop    %ebx
  100e02:	68 80 00 00 00       	push   $0x80
  100e07:	68 6b 19 10 00       	push   $0x10196b
  100e0c:	e8 27 0a 00 00       	call   101838 <abort>
  100e11:	83 c4 10             	add    $0x10,%esp
  100e14:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e19:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e1c:	5b                   	pop    %ebx
  100e1d:	5e                   	pop    %esi
  100e1e:	5d                   	pop    %ebp
  100e1f:	c3                   	ret    
  100e20:	be a0 32 10 00       	mov    $0x1032a0,%esi
  100e25:	e9 1f ff ff ff       	jmp    100d49 <get_from+0x9d>
  100e2a:	66 90                	xchg   %ax,%ax
  100e2c:	be a4 32 10 00       	mov    $0x1032a4,%esi
  100e31:	e9 13 ff ff ff       	jmp    100d49 <get_from+0x9d>
  100e36:	66 90                	xchg   %ax,%ax
  100e38:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100e3e:	89 d8                	mov    %ebx,%eax
  100e40:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e43:	5b                   	pop    %ebx
  100e44:	5e                   	pop    %esi
  100e45:	5d                   	pop    %ebp
  100e46:	c3                   	ret    
  100e47:	90                   	nop

00100e48 <apply_new_pid>:
  100e48:	55                   	push   %ebp
  100e49:	89 e5                	mov    %esp,%ebp
  100e4b:	83 ec 10             	sub    $0x10,%esp
  100e4e:	a1 d0 33 10 00       	mov    0x1033d0,%eax
  100e53:	50                   	push   %eax
  100e54:	50                   	push   %eax
  100e55:	e8 52 fe ff ff       	call   100cac <get_from>
  100e5a:	c9                   	leave  
  100e5b:	c3                   	ret    

00100e5c <get_from_runnable>:
  100e5c:	55                   	push   %ebp
  100e5d:	89 e5                	mov    %esp,%ebp
  100e5f:	83 ec 10             	sub    $0x10,%esp
  100e62:	a1 a4 32 10 00       	mov    0x1032a4,%eax
  100e67:	50                   	push   %eax
  100e68:	50                   	push   %eax
  100e69:	e8 3e fe ff ff       	call   100cac <get_from>
  100e6e:	c9                   	leave  
  100e6f:	c3                   	ret    

00100e70 <get_from_block>:
  100e70:	55                   	push   %ebp
  100e71:	89 e5                	mov    %esp,%ebp
  100e73:	83 ec 10             	sub    $0x10,%esp
  100e76:	ff 75 08             	pushl  0x8(%ebp)
  100e79:	ff 35 a0 32 10 00    	pushl  0x1032a0
  100e7f:	e8 28 fe ff ff       	call   100cac <get_from>
  100e84:	83 c4 10             	add    $0x10,%esp
  100e87:	40                   	inc    %eax
  100e88:	74 0a                	je     100e94 <get_from_block+0x24>
  100e8a:	b8 01 00 00 00       	mov    $0x1,%eax
  100e8f:	c9                   	leave  
  100e90:	c3                   	ret    
  100e91:	8d 76 00             	lea    0x0(%esi),%esi
  100e94:	83 ec 08             	sub    $0x8,%esp
  100e97:	68 ae 00 00 00       	push   $0xae
  100e9c:	68 6b 19 10 00       	push   $0x10196b
  100ea1:	e8 92 09 00 00       	call   101838 <abort>
  100ea6:	83 c4 10             	add    $0x10,%esp
  100ea9:	b8 01 00 00 00       	mov    $0x1,%eax
  100eae:	c9                   	leave  
  100eaf:	c3                   	ret    

00100eb0 <check_block>:
  100eb0:	8b 15 a0 32 10 00    	mov    0x1032a0,%edx
  100eb6:	83 fa ff             	cmp    $0xffffffff,%edx
  100eb9:	0f 84 9d 00 00 00    	je     100f5c <check_block+0xac>
  100ebf:	55                   	push   %ebp
  100ec0:	89 e5                	mov    %esp,%ebp
  100ec2:	57                   	push   %edi
  100ec3:	56                   	push   %esi
  100ec4:	53                   	push   %ebx
  100ec5:	83 ec 0c             	sub    $0xc,%esp
  100ec8:	89 d3                	mov    %edx,%ebx
  100eca:	eb 1e                	jmp    100eea <check_block+0x3a>
  100ecc:	89 d8                	mov    %ebx,%eax
  100ece:	c1 e0 07             	shl    $0x7,%eax
  100ed1:	01 d8                	add    %ebx,%eax
  100ed3:	01 c0                	add    %eax,%eax
  100ed5:	01 d8                	add    %ebx,%eax
  100ed7:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100eda:	8b 1c c5 c0 5c 10 00 	mov    0x105cc0(,%eax,8),%ebx
  100ee1:	39 d3                	cmp    %edx,%ebx
  100ee3:	74 6a                	je     100f4f <check_block+0x9f>
  100ee5:	83 fa ff             	cmp    $0xffffffff,%edx
  100ee8:	74 65                	je     100f4f <check_block+0x9f>
  100eea:	89 d8                	mov    %ebx,%eax
  100eec:	c1 e0 07             	shl    $0x7,%eax
  100eef:	01 d8                	add    %ebx,%eax
  100ef1:	01 c0                	add    %eax,%eax
  100ef3:	01 d8                	add    %ebx,%eax
  100ef5:	8d 34 83             	lea    (%ebx,%eax,4),%esi
  100ef8:	c1 e6 03             	shl    $0x3,%esi
  100efb:	8b be ac 5c 10 00    	mov    0x105cac(%esi),%edi
  100f01:	85 ff                	test   %edi,%edi
  100f03:	75 c7                	jne    100ecc <check_block+0x1c>
  100f05:	8b 8e b4 5c 10 00    	mov    0x105cb4(%esi),%ecx
  100f0b:	85 c9                	test   %ecx,%ecx
  100f0d:	7f bd                	jg     100ecc <check_block+0x1c>
  100f0f:	8b be c0 5c 10 00    	mov    0x105cc0(%esi),%edi
  100f15:	83 ec 0c             	sub    $0xc,%esp
  100f18:	53                   	push   %ebx
  100f19:	e8 52 ff ff ff       	call   100e70 <get_from_block>
  100f1e:	58                   	pop    %eax
  100f1f:	5a                   	pop    %edx
  100f20:	81 c6 60 5c 10 00    	add    $0x105c60,%esi
  100f26:	56                   	push   %esi
  100f27:	53                   	push   %ebx
  100f28:	e8 d3 fc ff ff       	call   100c00 <put_into_runnable>
  100f2d:	89 f8                	mov    %edi,%eax
  100f2f:	c1 e0 07             	shl    $0x7,%eax
  100f32:	01 f8                	add    %edi,%eax
  100f34:	01 c0                	add    %eax,%eax
  100f36:	01 f8                	add    %edi,%eax
  100f38:	8d 04 87             	lea    (%edi,%eax,4),%eax
  100f3b:	8b 1c c5 c0 5c 10 00 	mov    0x105cc0(,%eax,8),%ebx
  100f42:	83 c4 10             	add    $0x10,%esp
  100f45:	8b 15 a0 32 10 00    	mov    0x1032a0,%edx
  100f4b:	39 d3                	cmp    %edx,%ebx
  100f4d:	75 96                	jne    100ee5 <check_block+0x35>
  100f4f:	b8 01 00 00 00       	mov    $0x1,%eax
  100f54:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100f57:	5b                   	pop    %ebx
  100f58:	5e                   	pop    %esi
  100f59:	5f                   	pop    %edi
  100f5a:	5d                   	pop    %ebp
  100f5b:	c3                   	ret    
  100f5c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100f61:	c3                   	ret    
  100f62:	66 90                	xchg   %ax,%ax

00100f64 <check_is_in>:
  100f64:	55                   	push   %ebp
  100f65:	89 e5                	mov    %esp,%ebp
  100f67:	53                   	push   %ebx
  100f68:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100f6b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100f6e:	39 d9                	cmp    %ebx,%ecx
  100f70:	74 3b                	je     100fad <check_is_in+0x49>
  100f72:	89 c8                	mov    %ecx,%eax
  100f74:	c1 e0 07             	shl    $0x7,%eax
  100f77:	01 c8                	add    %ecx,%eax
  100f79:	01 c0                	add    %eax,%eax
  100f7b:	01 c8                	add    %ecx,%eax
  100f7d:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100f80:	8b 14 c5 c0 5c 10 00 	mov    0x105cc0(,%eax,8),%edx
  100f87:	39 d1                	cmp    %edx,%ecx
  100f89:	75 1e                	jne    100fa9 <check_is_in+0x45>
  100f8b:	eb 2b                	jmp    100fb8 <check_is_in+0x54>
  100f8d:	8d 76 00             	lea    0x0(%esi),%esi
  100f90:	89 d0                	mov    %edx,%eax
  100f92:	c1 e0 07             	shl    $0x7,%eax
  100f95:	01 d0                	add    %edx,%eax
  100f97:	01 c0                	add    %eax,%eax
  100f99:	01 d0                	add    %edx,%eax
  100f9b:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100f9e:	8b 14 c5 c0 5c 10 00 	mov    0x105cc0(,%eax,8),%edx
  100fa5:	39 d1                	cmp    %edx,%ecx
  100fa7:	74 0f                	je     100fb8 <check_is_in+0x54>
  100fa9:	39 d3                	cmp    %edx,%ebx
  100fab:	75 e3                	jne    100f90 <check_is_in+0x2c>
  100fad:	b8 01 00 00 00       	mov    $0x1,%eax
  100fb2:	5b                   	pop    %ebx
  100fb3:	5d                   	pop    %ebp
  100fb4:	c3                   	ret    
  100fb5:	8d 76 00             	lea    0x0(%esi),%esi
  100fb8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100fbd:	5b                   	pop    %ebx
  100fbe:	5d                   	pop    %ebp
  100fbf:	c3                   	ret    

00100fc0 <block_decrease>:
  100fc0:	55                   	push   %ebp
  100fc1:	89 e5                	mov    %esp,%ebp
  100fc3:	8b 0d a0 32 10 00    	mov    0x1032a0,%ecx
  100fc9:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100fcc:	74 2e                	je     100ffc <block_decrease+0x3c>
  100fce:	89 ca                	mov    %ecx,%edx
  100fd0:	89 d0                	mov    %edx,%eax
  100fd2:	c1 e0 07             	shl    $0x7,%eax
  100fd5:	01 d0                	add    %edx,%eax
  100fd7:	01 c0                	add    %eax,%eax
  100fd9:	01 d0                	add    %edx,%eax
  100fdb:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100fde:	8d 04 c5 60 3c 10 00 	lea    0x103c60(,%eax,8),%eax
  100fe5:	ff 88 54 20 00 00    	decl   0x2054(%eax)
  100feb:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100ff1:	39 d1                	cmp    %edx,%ecx
  100ff3:	75 db                	jne    100fd0 <block_decrease+0x10>
  100ff5:	b8 01 00 00 00       	mov    $0x1,%eax
  100ffa:	5d                   	pop    %ebp
  100ffb:	c3                   	ret    
  100ffc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101001:	5d                   	pop    %ebp
  101002:	c3                   	ret    
  101003:	90                   	nop

00101004 <init_pcb>:
  101004:	55                   	push   %ebp
  101005:	89 e5                	mov    %esp,%ebp
  101007:	c7 05 48 3c 10 00 05 	movl   $0x5,0x103c48
  10100e:	00 00 00 
  101011:	ba b8 5c 10 00       	mov    $0x105cb8,%edx
  101016:	31 c0                	xor    %eax,%eax
  101018:	89 02                	mov    %eax,(%edx)
  10101a:	8d 48 ff             	lea    -0x1(%eax),%ecx
  10101d:	89 4a 04             	mov    %ecx,0x4(%edx)
  101020:	40                   	inc    %eax
  101021:	89 42 08             	mov    %eax,0x8(%edx)
  101024:	c7 42 f4 03 00 00 00 	movl   $0x3,-0xc(%edx)
  10102b:	81 c2 68 20 00 00    	add    $0x2068,%edx
  101031:	3d 00 08 00 00       	cmp    $0x800,%eax
  101036:	75 e0                	jne    101018 <init_pcb+0x14>
  101038:	c7 05 bc 5c 10 00 ff 	movl   $0x7ff,0x105cbc
  10103f:	07 00 00 
  101042:	c7 05 58 7c 13 01 00 	movl   $0x0,0x1137c58
  101049:	00 00 00 
  10104c:	5d                   	pop    %ebp
  10104d:	c3                   	ret    
  10104e:	66 90                	xchg   %ax,%ax

00101050 <init_kernel_pcb>:
  101050:	55                   	push   %ebp
  101051:	89 e5                	mov    %esp,%ebp
  101053:	83 ec 10             	sub    $0x10,%esp
  101056:	a1 d0 33 10 00       	mov    0x1033d0,%eax
  10105b:	50                   	push   %eax
  10105c:	50                   	push   %eax
  10105d:	e8 4a fc ff ff       	call   100cac <get_from>
  101062:	83 c4 10             	add    $0x10,%esp
  101065:	85 c0                	test   %eax,%eax
  101067:	74 15                	je     10107e <init_kernel_pcb+0x2e>
  101069:	83 ec 08             	sub    $0x8,%esp
  10106c:	68 e1 00 00 00       	push   $0xe1
  101071:	68 6b 19 10 00       	push   $0x10196b
  101076:	e8 bd 07 00 00       	call   101838 <abort>
  10107b:	83 c4 10             	add    $0x10,%esp
  10107e:	c7 05 a8 5c 10 00 10 	movl   $0x10,0x105ca8
  101085:	00 00 00 
  101088:	c7 05 9c 5c 10 00 08 	movl   $0x8,0x105c9c
  10108f:	00 00 00 
  101092:	c7 05 6c 5c 10 00 10 	movl   $0x10,0x105c6c
  101099:	00 00 00 
  10109c:	c7 05 68 5c 10 00 10 	movl   $0x10,0x105c68
  1010a3:	00 00 00 
  1010a6:	c7 05 98 5c 10 00 78 	movl   $0x100a78,0x105c98
  1010ad:	0a 10 00 
  1010b0:	c7 05 a4 5c 10 00 00 	movl   $0x400000,0x105ca4
  1010b7:	00 40 00 
  1010ba:	c7 05 ac 5c 10 00 01 	movl   $0x1,0x105cac
  1010c1:	00 00 00 
  1010c4:	c7 05 b0 5c 10 00 04 	movl   $0x4,0x105cb0
  1010cb:	00 00 00 
  1010ce:	b8 01 00 00 00       	mov    $0x1,%eax
  1010d3:	c9                   	leave  
  1010d4:	c3                   	ret    
  1010d5:	8d 76 00             	lea    0x0(%esi),%esi

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
  1010f1:	8d 82 60 5c 10 00    	lea    0x105c60(%edx),%eax
  1010f7:	b9 13 00 00 00       	mov    $0x13,%ecx
  1010fc:	89 c7                	mov    %eax,%edi
  1010fe:	8b 75 0c             	mov    0xc(%ebp),%esi
  101101:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101103:	8b 45 10             	mov    0x10(%ebp),%eax
  101106:	89 82 ac 5c 10 00    	mov    %eax,0x105cac(%edx)
  10110c:	8b 45 14             	mov    0x14(%ebp),%eax
  10110f:	89 82 b0 5c 10 00    	mov    %eax,0x105cb0(%edx)
  101115:	8b 45 18             	mov    0x18(%ebp),%eax
  101118:	89 82 b4 5c 10 00    	mov    %eax,0x105cb4(%edx)
  10111e:	8b 45 0c             	mov    0xc(%ebp),%eax
  101121:	89 82 c4 5c 10 00    	mov    %eax,0x105cc4(%edx)
  101127:	b8 01 00 00 00       	mov    $0x1,%eax
  10112c:	5e                   	pop    %esi
  10112d:	5f                   	pop    %edi
  10112e:	5d                   	pop    %ebp
  10112f:	c3                   	ret    

00101130 <initIdt>:
  101130:	55                   	push   %ebp
  101131:	89 e5                	mov    %esp,%ebp
  101133:	53                   	push   %ebx
  101134:	ba cf 18 10 00       	mov    $0x1018cf,%edx
  101139:	89 d3                	mov    %edx,%ebx
  10113b:	c1 ea 10             	shr    $0x10,%edx
  10113e:	b9 40 85 13 01       	mov    $0x1138540,%ecx
  101143:	b8 40 7d 13 01       	mov    $0x1137d40,%eax
  101148:	66 89 18             	mov    %bx,(%eax)
  10114b:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  101151:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  101155:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  101159:	66 89 50 06          	mov    %dx,0x6(%eax)
  10115d:	83 c0 08             	add    $0x8,%eax
  101160:	39 c1                	cmp    %eax,%ecx
  101162:	75 e4                	jne    101148 <initIdt+0x18>
  101164:	b8 d5 18 10 00       	mov    $0x1018d5,%eax
  101169:	66 a3 a8 7d 13 01    	mov    %ax,0x1137da8
  10116f:	66 c7 05 aa 7d 13 01 	movw   $0x8,0x1137daa
  101176:	08 00 
  101178:	c6 05 ac 7d 13 01 00 	movb   $0x0,0x1137dac
  10117f:	c6 05 ad 7d 13 01 8f 	movb   $0x8f,0x1137dad
  101186:	c1 e8 10             	shr    $0x10,%eax
  101189:	66 a3 ae 7d 13 01    	mov    %ax,0x1137dae
  10118f:	b8 d9 18 10 00       	mov    $0x1018d9,%eax
  101194:	66 a3 40 81 13 01    	mov    %ax,0x1138140
  10119a:	66 c7 05 42 81 13 01 	movw   $0x8,0x1138142
  1011a1:	08 00 
  1011a3:	c6 05 44 81 13 01 00 	movb   $0x0,0x1138144
  1011aa:	c6 05 45 81 13 01 ee 	movb   $0xee,0x1138145
  1011b1:	c1 e8 10             	shr    $0x10,%eax
  1011b4:	66 a3 46 81 13 01    	mov    %ax,0x1138146
  1011ba:	b8 e2 18 10 00       	mov    $0x1018e2,%eax
  1011bf:	66 a3 40 7e 13 01    	mov    %ax,0x1137e40
  1011c5:	66 c7 05 42 7e 13 01 	movw   $0x8,0x1137e42
  1011cc:	08 00 
  1011ce:	c6 05 44 7e 13 01 00 	movb   $0x0,0x1137e44
  1011d5:	c6 05 45 7e 13 01 8e 	movb   $0x8e,0x1137e45
  1011dc:	c1 e8 10             	shr    $0x10,%eax
  1011df:	66 a3 46 7e 13 01    	mov    %ax,0x1137e46
  1011e5:	66 c7 05 d4 33 10 00 	movw   $0x7ff,0x1033d4
  1011ec:	ff 07 
  1011ee:	b8 40 7d 13 01       	mov    $0x1137d40,%eax
  1011f3:	66 a3 d6 33 10 00    	mov    %ax,0x1033d6
  1011f9:	c1 e8 10             	shr    $0x10,%eax
  1011fc:	66 a3 d8 33 10 00    	mov    %ax,0x1033d8
  101202:	b8 d4 33 10 00       	mov    $0x1033d4,%eax
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
  101230:	e8 f3 f3 ff ff       	call   100628 <sys_fork>
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
  101253:	e9 a0 f3 ff ff       	jmp    1005f8 <sys_sleep>
  101258:	83 ec 0c             	sub    $0xc,%esp
  10125b:	53                   	push   %ebx
  10125c:	e8 8b f3 ff ff       	call   1005ec <sys_getpid>
  101261:	89 43 2c             	mov    %eax,0x2c(%ebx)
  101264:	83 c4 10             	add    $0x10,%esp
  101267:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10126a:	c9                   	leave  
  10126b:	c3                   	ret    
  10126c:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10126f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101272:	c9                   	leave  
  101273:	e9 48 f3 ff ff       	jmp    1005c0 <sys_exit>
  101278:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10127b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10127e:	c9                   	leave  
  10127f:	e9 20 f7 ff ff       	jmp    1009a4 <sys_write>

00101284 <GProtectFaultHandle>:
  101284:	55                   	push   %ebp
  101285:	89 e5                	mov    %esp,%ebp
  101287:	83 ec 14             	sub    $0x14,%esp
  10128a:	68 04 19 10 00       	push   $0x101904
  10128f:	e8 30 04 00 00       	call   1016c4 <printk>
  101294:	58                   	pop    %eax
  101295:	8b 45 08             	mov    0x8(%ebp),%eax
  101298:	ff 70 30             	pushl  0x30(%eax)
  10129b:	68 fc 19 10 00       	push   $0x1019fc
  1012a0:	6a 64                	push   $0x64
  1012a2:	68 a9 19 10 00       	push   $0x1019a9
  1012a7:	68 bc 19 10 00       	push   $0x1019bc
  1012ac:	e8 13 04 00 00       	call   1016c4 <printk>
  1012b1:	83 c4 14             	add    $0x14,%esp
  1012b4:	68 33 19 10 00       	push   $0x101933
  1012b9:	e8 06 04 00 00       	call   1016c4 <printk>
  1012be:	5a                   	pop    %edx
  1012bf:	59                   	pop    %ecx
  1012c0:	6a 65                	push   $0x65
  1012c2:	68 a9 19 10 00       	push   $0x1019a9
  1012c7:	e8 6c 05 00 00       	call   101838 <abort>
  1012cc:	83 c4 10             	add    $0x10,%esp
  1012cf:	c9                   	leave  
  1012d0:	c3                   	ret    
  1012d1:	8d 76 00             	lea    0x0(%esi),%esi

001012d4 <timeHandle>:
  1012d4:	55                   	push   %ebp
  1012d5:	89 e5                	mov    %esp,%ebp
  1012d7:	53                   	push   %ebx
  1012d8:	53                   	push   %ebx
  1012d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1012dc:	8b 15 40 3c 10 00    	mov    0x103c40,%edx
  1012e2:	89 d0                	mov    %edx,%eax
  1012e4:	c1 e0 07             	shl    $0x7,%eax
  1012e7:	01 d0                	add    %edx,%eax
  1012e9:	01 c0                	add    %eax,%eax
  1012eb:	01 d0                	add    %edx,%eax
  1012ed:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1012f0:	ff 0c c5 b0 5c 10 00 	decl   0x105cb0(,%eax,8)
  1012f7:	e8 c4 fc ff ff       	call   100fc0 <block_decrease>
  1012fc:	e8 af fb ff ff       	call   100eb0 <check_block>
  101301:	8b 15 40 3c 10 00    	mov    0x103c40,%edx
  101307:	89 d0                	mov    %edx,%eax
  101309:	c1 e0 07             	shl    $0x7,%eax
  10130c:	01 d0                	add    %edx,%eax
  10130e:	01 c0                	add    %eax,%eax
  101310:	01 d0                	add    %edx,%eax
  101312:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101315:	8b 04 c5 b0 5c 10 00 	mov    0x105cb0(,%eax,8),%eax
  10131c:	85 c0                	test   %eax,%eax
  10131e:	7e 34                	jle    101354 <timeHandle+0x80>
  101320:	e8 9f f7 ff ff       	call   100ac4 <getpid>
  101325:	85 c0                	test   %eax,%eax
  101327:	74 1b                	je     101344 <timeHandle+0x70>
  101329:	e8 96 f7 ff ff       	call   100ac4 <getpid>
  10132e:	83 ec 08             	sub    $0x8,%esp
  101331:	50                   	push   %eax
  101332:	68 30 19 10 00       	push   $0x101930
  101337:	e8 88 03 00 00       	call   1016c4 <printk>
  10133c:	83 c4 10             	add    $0x10,%esp
  10133f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101342:	c9                   	leave  
  101343:	c3                   	ret    
  101344:	c7 45 08 d2 19 10 00 	movl   $0x1019d2,0x8(%ebp)
  10134b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10134e:	c9                   	leave  
  10134f:	e9 70 03 00 00       	jmp    1016c4 <printk>
  101354:	83 ec 08             	sub    $0x8,%esp
  101357:	53                   	push   %ebx
  101358:	52                   	push   %edx
  101359:	e8 a2 f8 ff ff       	call   100c00 <put_into_runnable>
  10135e:	e8 f9 fa ff ff       	call   100e5c <get_from_runnable>
  101363:	5a                   	pop    %edx
  101364:	59                   	pop    %ecx
  101365:	53                   	push   %ebx
  101366:	50                   	push   %eax
  101367:	e8 14 f7 ff ff       	call   100a80 <put_into_running>
  10136c:	83 c4 10             	add    $0x10,%esp
  10136f:	eb af                	jmp    101320 <timeHandle+0x4c>
  101371:	8d 76 00             	lea    0x0(%esi),%esi

00101374 <irqHandle>:
  101374:	55                   	push   %ebp
  101375:	89 e5                	mov    %esp,%ebp
  101377:	57                   	push   %edi
  101378:	56                   	push   %esi
  101379:	53                   	push   %ebx
  10137a:	83 ec 0c             	sub    $0xc,%esp
  10137d:	8b 75 08             	mov    0x8(%ebp),%esi
  101380:	b8 10 00 00 00       	mov    $0x10,%eax
  101385:	89 c0                	mov    %eax,%eax
  101387:	8e d8                	mov    %eax,%ds
  101389:	8e e0                	mov    %eax,%fs
  10138b:	8e c0                	mov    %eax,%es
  10138d:	b8 30 00 00 00       	mov    $0x30,%eax
  101392:	89 c0                	mov    %eax,%eax
  101394:	8e e8                	mov    %eax,%gs
  101396:	89 ef                	mov    %ebp,%edi
  101398:	3b 77 08             	cmp    0x8(%edi),%esi
  10139b:	0f 84 e7 00 00 00    	je     101488 <irqHandle+0x114>
  1013a1:	83 ec 08             	sub    $0x8,%esp
  1013a4:	6a 1e                	push   $0x1e
  1013a6:	68 a9 19 10 00       	push   $0x1019a9
  1013ab:	e8 88 04 00 00       	call   101838 <abort>
  1013b0:	8b 1d 40 3c 10 00    	mov    0x103c40,%ebx
  1013b6:	8b 46 30             	mov    0x30(%esi),%eax
  1013b9:	83 c4 10             	add    $0x10,%esp
  1013bc:	83 f8 0d             	cmp    $0xd,%eax
  1013bf:	0f 84 d5 00 00 00    	je     10149a <irqHandle+0x126>
  1013c5:	0f 8e e5 00 00 00    	jle    1014b0 <irqHandle+0x13c>
  1013cb:	83 f8 20             	cmp    $0x20,%eax
  1013ce:	74 30                	je     101400 <irqHandle+0x8c>
  1013d0:	83 c0 80             	add    $0xffffff80,%eax
  1013d3:	0f 85 de 00 00 00    	jne    1014b7 <irqHandle+0x143>
  1013d9:	fa                   	cli    
  1013da:	83 ec 0c             	sub    $0xc,%esp
  1013dd:	56                   	push   %esi
  1013de:	e8 2d fe ff ff       	call   101210 <syscallHandle>
  1013e3:	8b 46 30             	mov    0x30(%esi),%eax
  1013e6:	83 c4 10             	add    $0x10,%esp
  1013e9:	3d 80 00 00 00       	cmp    $0x80,%eax
  1013ee:	74 28                	je     101418 <irqHandle+0xa4>
  1013f0:	83 f8 20             	cmp    $0x20,%eax
  1013f3:	74 23                	je     101418 <irqHandle+0xa4>
  1013f5:	fb                   	sti    
  1013f6:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1013f9:	5b                   	pop    %ebx
  1013fa:	5e                   	pop    %esi
  1013fb:	5f                   	pop    %edi
  1013fc:	5d                   	pop    %ebp
  1013fd:	c3                   	ret    
  1013fe:	66 90                	xchg   %ax,%ax
  101400:	83 ec 0c             	sub    $0xc,%esp
  101403:	56                   	push   %esi
  101404:	e8 cb fe ff ff       	call   1012d4 <timeHandle>
  101409:	8b 46 30             	mov    0x30(%esi),%eax
  10140c:	83 c4 10             	add    $0x10,%esp
  10140f:	3d 80 00 00 00       	cmp    $0x80,%eax
  101414:	75 da                	jne    1013f0 <irqHandle+0x7c>
  101416:	66 90                	xchg   %ax,%ax
  101418:	8b 15 40 3c 10 00    	mov    0x103c40,%edx
  10141e:	39 da                	cmp    %ebx,%edx
  101420:	74 d3                	je     1013f5 <irqHandle+0x81>
  101422:	89 d0                	mov    %edx,%eax
  101424:	c1 e0 07             	shl    $0x7,%eax
  101427:	01 d0                	add    %edx,%eax
  101429:	01 c0                	add    %eax,%eax
  10142b:	01 d0                	add    %edx,%eax
  10142d:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101430:	8d 04 c5 10 5c 10 00 	lea    0x105c10(,%eax,8),%eax
  101437:	89 47 08             	mov    %eax,0x8(%edi)
  10143a:	8b 15 40 3c 10 00    	mov    0x103c40,%edx
  101440:	89 d1                	mov    %edx,%ecx
  101442:	c1 e1 07             	shl    $0x7,%ecx
  101445:	01 d1                	add    %edx,%ecx
  101447:	01 c9                	add    %ecx,%ecx
  101449:	01 d1                	add    %edx,%ecx
  10144b:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  10144e:	8d 34 cd 60 5c 10 00 	lea    0x105c60(,%ecx,8),%esi
  101455:	b9 13 00 00 00       	mov    $0x13,%ecx
  10145a:	89 c7                	mov    %eax,%edi
  10145c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10145e:	83 ec 08             	sub    $0x8,%esp
  101461:	c1 e2 10             	shl    $0x10,%edx
  101464:	52                   	push   %edx
  101465:	6a 23                	push   $0x23
  101467:	e8 c8 eb ff ff       	call   100034 <change_gdt>
  10146c:	58                   	pop    %eax
  10146d:	5a                   	pop    %edx
  10146e:	a1 40 3c 10 00       	mov    0x103c40,%eax
  101473:	c1 e0 10             	shl    $0x10,%eax
  101476:	50                   	push   %eax
  101477:	6a 1b                	push   $0x1b
  101479:	e8 b6 eb ff ff       	call   100034 <change_gdt>
  10147e:	83 c4 10             	add    $0x10,%esp
  101481:	e9 6f ff ff ff       	jmp    1013f5 <irqHandle+0x81>
  101486:	66 90                	xchg   %ax,%ax
  101488:	8b 1d 40 3c 10 00    	mov    0x103c40,%ebx
  10148e:	8b 46 30             	mov    0x30(%esi),%eax
  101491:	83 f8 0d             	cmp    $0xd,%eax
  101494:	0f 85 2b ff ff ff    	jne    1013c5 <irqHandle+0x51>
  10149a:	83 ec 0c             	sub    $0xc,%esp
  10149d:	56                   	push   %esi
  10149e:	e8 e1 fd ff ff       	call   101284 <GProtectFaultHandle>
  1014a3:	8b 46 30             	mov    0x30(%esi),%eax
  1014a6:	83 c4 10             	add    $0x10,%esp
  1014a9:	e9 3b ff ff ff       	jmp    1013e9 <irqHandle+0x75>
  1014ae:	66 90                	xchg   %ax,%ax
  1014b0:	40                   	inc    %eax
  1014b1:	0f 84 3e ff ff ff    	je     1013f5 <irqHandle+0x81>
  1014b7:	83 ec 0c             	sub    $0xc,%esp
  1014ba:	68 04 19 10 00       	push   $0x101904
  1014bf:	e8 00 02 00 00       	call   1016c4 <printk>
  1014c4:	59                   	pop    %ecx
  1014c5:	58                   	pop    %eax
  1014c6:	ff 76 38             	pushl  0x38(%esi)
  1014c9:	ff 76 30             	pushl  0x30(%esi)
  1014cc:	68 10 1a 10 00       	push   $0x101a10
  1014d1:	6a 35                	push   $0x35
  1014d3:	68 a9 19 10 00       	push   $0x1019a9
  1014d8:	68 d4 19 10 00       	push   $0x1019d4
  1014dd:	e8 e2 01 00 00       	call   1016c4 <printk>
  1014e2:	83 c4 14             	add    $0x14,%esp
  1014e5:	68 33 19 10 00       	push   $0x101933
  1014ea:	e8 d5 01 00 00       	call   1016c4 <printk>
  1014ef:	58                   	pop    %eax
  1014f0:	5a                   	pop    %edx
  1014f1:	6a 36                	push   $0x36
  1014f3:	68 a9 19 10 00       	push   $0x1019a9
  1014f8:	e8 3b 03 00 00       	call   101838 <abort>
  1014fd:	8b 46 30             	mov    0x30(%esi),%eax
  101500:	83 c4 10             	add    $0x10,%esp
  101503:	e9 e1 fe ff ff       	jmp    1013e9 <irqHandle+0x75>

00101508 <P>:
  101508:	55                   	push   %ebp
  101509:	89 e5                	mov    %esp,%ebp
  10150b:	8b 45 08             	mov    0x8(%ebp),%eax
  10150e:	ff 08                	decl   (%eax)
  101510:	5d                   	pop    %ebp
  101511:	c3                   	ret    
  101512:	66 90                	xchg   %ax,%ax

00101514 <V>:
  101514:	55                   	push   %ebp
  101515:	89 e5                	mov    %esp,%ebp
  101517:	8b 45 08             	mov    0x8(%ebp),%eax
  10151a:	ff 00                	incl   (%eax)
  10151c:	5d                   	pop    %ebp
  10151d:	c3                   	ret    
  10151e:	66 90                	xchg   %ax,%ax

00101520 <initIntr>:
  101520:	55                   	push   %ebp
  101521:	89 e5                	mov    %esp,%ebp
  101523:	ba 21 00 00 00       	mov    $0x21,%edx
  101528:	b0 ff                	mov    $0xff,%al
  10152a:	ee                   	out    %al,(%dx)
  10152b:	ba a1 00 00 00       	mov    $0xa1,%edx
  101530:	ee                   	out    %al,(%dx)
  101531:	ba 20 00 00 00       	mov    $0x20,%edx
  101536:	b0 11                	mov    $0x11,%al
  101538:	ee                   	out    %al,(%dx)
  101539:	ba 21 00 00 00       	mov    $0x21,%edx
  10153e:	b0 20                	mov    $0x20,%al
  101540:	ee                   	out    %al,(%dx)
  101541:	b0 04                	mov    $0x4,%al
  101543:	ee                   	out    %al,(%dx)
  101544:	b0 03                	mov    $0x3,%al
  101546:	ee                   	out    %al,(%dx)
  101547:	ba a0 00 00 00       	mov    $0xa0,%edx
  10154c:	b0 11                	mov    $0x11,%al
  10154e:	ee                   	out    %al,(%dx)
  10154f:	ba a1 00 00 00       	mov    $0xa1,%edx
  101554:	b0 28                	mov    $0x28,%al
  101556:	ee                   	out    %al,(%dx)
  101557:	b0 02                	mov    $0x2,%al
  101559:	ee                   	out    %al,(%dx)
  10155a:	b0 03                	mov    $0x3,%al
  10155c:	ee                   	out    %al,(%dx)
  10155d:	ba 20 00 00 00       	mov    $0x20,%edx
  101562:	b0 68                	mov    $0x68,%al
  101564:	ee                   	out    %al,(%dx)
  101565:	b0 0a                	mov    $0xa,%al
  101567:	ee                   	out    %al,(%dx)
  101568:	ba a0 00 00 00       	mov    $0xa0,%edx
  10156d:	b0 68                	mov    $0x68,%al
  10156f:	ee                   	out    %al,(%dx)
  101570:	b0 0a                	mov    $0xa,%al
  101572:	ee                   	out    %al,(%dx)
  101573:	5d                   	pop    %ebp
  101574:	c3                   	ret    
  101575:	8d 76 00             	lea    0x0(%esi),%esi

00101578 <initTimer>:
  101578:	55                   	push   %ebp
  101579:	89 e5                	mov    %esp,%ebp
  10157b:	ba 43 00 00 00       	mov    $0x43,%edx
  101580:	b0 34                	mov    $0x34,%al
  101582:	ee                   	out    %al,(%dx)
  101583:	ba 40 00 00 00       	mov    $0x40,%edx
  101588:	b0 9b                	mov    $0x9b,%al
  10158a:	ee                   	out    %al,(%dx)
  10158b:	b0 2e                	mov    $0x2e,%al
  10158d:	ee                   	out    %al,(%dx)
  10158e:	5d                   	pop    %ebp
  10158f:	c3                   	ret    

00101590 <getKeyCode>:
  101590:	55                   	push   %ebp
  101591:	89 e5                	mov    %esp,%ebp
  101593:	53                   	push   %ebx
  101594:	ba 60 00 00 00       	mov    $0x60,%edx
  101599:	ec                   	in     (%dx),%al
  10159a:	88 c1                	mov    %al,%cl
  10159c:	ba 61 00 00 00       	mov    $0x61,%edx
  1015a1:	ec                   	in     (%dx),%al
  1015a2:	88 c3                	mov    %al,%bl
  1015a4:	83 c8 80             	or     $0xffffff80,%eax
  1015a7:	ee                   	out    %al,(%dx)
  1015a8:	88 d8                	mov    %bl,%al
  1015aa:	ee                   	out    %al,(%dx)
  1015ab:	0f b6 c1             	movzbl %cl,%eax
  1015ae:	5b                   	pop    %ebx
  1015af:	5d                   	pop    %ebp
  1015b0:	c3                   	ret    
  1015b1:	66 90                	xchg   %ax,%ax
  1015b3:	90                   	nop

001015b4 <i2A>:
  1015b4:	55                   	push   %ebp
  1015b5:	89 e5                	mov    %esp,%ebp
  1015b7:	57                   	push   %edi
  1015b8:	56                   	push   %esi
  1015b9:	53                   	push   %ebx
  1015ba:	51                   	push   %ecx
  1015bb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1015be:	85 c9                	test   %ecx,%ecx
  1015c0:	78 6e                	js     101630 <i2A+0x7c>
  1015c2:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  1015c6:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  1015ca:	bb 1e 34 10 00       	mov    $0x10341e,%ebx
  1015cf:	31 ff                	xor    %edi,%edi
  1015d1:	eb 03                	jmp    1015d6 <i2A+0x22>
  1015d3:	90                   	nop
  1015d4:	89 f7                	mov    %esi,%edi
  1015d6:	4b                   	dec    %ebx
  1015d7:	89 c8                	mov    %ecx,%eax
  1015d9:	be 0a 00 00 00       	mov    $0xa,%esi
  1015de:	99                   	cltd   
  1015df:	f7 fe                	idiv   %esi
  1015e1:	83 c2 30             	add    $0x30,%edx
  1015e4:	88 13                	mov    %dl,(%ebx)
  1015e6:	8d 77 01             	lea    0x1(%edi),%esi
  1015e9:	b8 67 66 66 66       	mov    $0x66666667,%eax
  1015ee:	f7 e9                	imul   %ecx
  1015f0:	89 d0                	mov    %edx,%eax
  1015f2:	c1 f8 02             	sar    $0x2,%eax
  1015f5:	c1 f9 1f             	sar    $0x1f,%ecx
  1015f8:	29 c8                	sub    %ecx,%eax
  1015fa:	89 c1                	mov    %eax,%ecx
  1015fc:	75 d6                	jne    1015d4 <i2A+0x20>
  1015fe:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  101602:	74 20                	je     101624 <i2A+0x70>
  101604:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  101608:	75 06                	jne    101610 <i2A+0x5c>
  10160a:	fe 05 1d 34 10 00    	incb   0x10341d
  101610:	c6 05 1e 34 10 00 00 	movb   $0x0,0x10341e
  101617:	8b 45 0c             	mov    0xc(%ebp),%eax
  10161a:	89 18                	mov    %ebx,(%eax)
  10161c:	89 f0                	mov    %esi,%eax
  10161e:	5a                   	pop    %edx
  10161f:	5b                   	pop    %ebx
  101620:	5e                   	pop    %esi
  101621:	5f                   	pop    %edi
  101622:	5d                   	pop    %ebp
  101623:	c3                   	ret    
  101624:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  101628:	8d 77 02             	lea    0x2(%edi),%esi
  10162b:	4b                   	dec    %ebx
  10162c:	eb d6                	jmp    101604 <i2A+0x50>
  10162e:	66 90                	xchg   %ax,%ax
  101630:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  101636:	74 0c                	je     101644 <i2A+0x90>
  101638:	f7 d9                	neg    %ecx
  10163a:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  10163e:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  101642:	eb 86                	jmp    1015ca <i2A+0x16>
  101644:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  101649:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  10164d:	eb ef                	jmp    10163e <i2A+0x8a>
  10164f:	90                   	nop

00101650 <i2X>:
  101650:	55                   	push   %ebp
  101651:	89 e5                	mov    %esp,%ebp
  101653:	57                   	push   %edi
  101654:	56                   	push   %esi
  101655:	53                   	push   %ebx
  101656:	8b 55 08             	mov    0x8(%ebp),%edx
  101659:	b9 fd 33 10 00       	mov    $0x1033fd,%ecx
  10165e:	31 c0                	xor    %eax,%eax
  101660:	40                   	inc    %eax
  101661:	89 d6                	mov    %edx,%esi
  101663:	83 e6 0f             	and    $0xf,%esi
  101666:	8d 5e f6             	lea    -0xa(%esi),%ebx
  101669:	89 cf                	mov    %ecx,%edi
  10166b:	83 fb 05             	cmp    $0x5,%ebx
  10166e:	77 4c                	ja     1016bc <i2X+0x6c>
  101670:	ff 24 9d 1c 1a 10 00 	jmp    *0x101a1c(,%ebx,4)
  101677:	90                   	nop
  101678:	c6 01 65             	movb   $0x65,(%ecx)
  10167b:	90                   	nop
  10167c:	49                   	dec    %ecx
  10167d:	c1 ea 04             	shr    $0x4,%edx
  101680:	75 de                	jne    101660 <i2X+0x10>
  101682:	c6 05 fe 33 10 00 00 	movb   $0x0,0x1033fe
  101689:	8b 55 0c             	mov    0xc(%ebp),%edx
  10168c:	89 3a                	mov    %edi,(%edx)
  10168e:	5b                   	pop    %ebx
  10168f:	5e                   	pop    %esi
  101690:	5f                   	pop    %edi
  101691:	5d                   	pop    %ebp
  101692:	c3                   	ret    
  101693:	90                   	nop
  101694:	c6 01 64             	movb   $0x64,(%ecx)
  101697:	eb e3                	jmp    10167c <i2X+0x2c>
  101699:	8d 76 00             	lea    0x0(%esi),%esi
  10169c:	c6 01 63             	movb   $0x63,(%ecx)
  10169f:	eb db                	jmp    10167c <i2X+0x2c>
  1016a1:	8d 76 00             	lea    0x0(%esi),%esi
  1016a4:	c6 01 62             	movb   $0x62,(%ecx)
  1016a7:	eb d3                	jmp    10167c <i2X+0x2c>
  1016a9:	8d 76 00             	lea    0x0(%esi),%esi
  1016ac:	c6 01 61             	movb   $0x61,(%ecx)
  1016af:	eb cb                	jmp    10167c <i2X+0x2c>
  1016b1:	8d 76 00             	lea    0x0(%esi),%esi
  1016b4:	c6 01 66             	movb   $0x66,(%ecx)
  1016b7:	eb c3                	jmp    10167c <i2X+0x2c>
  1016b9:	8d 76 00             	lea    0x0(%esi),%esi
  1016bc:	8d 5e 30             	lea    0x30(%esi),%ebx
  1016bf:	88 19                	mov    %bl,(%ecx)
  1016c1:	eb b9                	jmp    10167c <i2X+0x2c>
  1016c3:	90                   	nop

001016c4 <printk>:
  1016c4:	55                   	push   %ebp
  1016c5:	89 e5                	mov    %esp,%ebp
  1016c7:	57                   	push   %edi
  1016c8:	56                   	push   %esi
  1016c9:	53                   	push   %ebx
  1016ca:	83 ec 2c             	sub    $0x2c,%esp
  1016cd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1016d0:	8a 11                	mov    (%ecx),%dl
  1016d2:	84 d2                	test   %dl,%dl
  1016d4:	0f 84 54 01 00 00    	je     10182e <printk+0x16a>
  1016da:	8d 45 0c             	lea    0xc(%ebp),%eax
  1016dd:	31 ff                	xor    %edi,%edi
  1016df:	eb 18                	jmp    1016f9 <printk+0x35>
  1016e1:	8d 76 00             	lea    0x0(%esi),%esi
  1016e4:	8a 11                	mov    (%ecx),%dl
  1016e6:	89 cb                	mov    %ecx,%ebx
  1016e8:	88 97 20 34 10 00    	mov    %dl,0x103420(%edi)
  1016ee:	47                   	inc    %edi
  1016ef:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1016f2:	8a 53 01             	mov    0x1(%ebx),%dl
  1016f5:	84 d2                	test   %dl,%dl
  1016f7:	74 72                	je     10176b <printk+0xa7>
  1016f9:	80 fa 25             	cmp    $0x25,%dl
  1016fc:	75 e6                	jne    1016e4 <printk+0x20>
  1016fe:	8d 59 01             	lea    0x1(%ecx),%ebx
  101701:	8a 51 01             	mov    0x1(%ecx),%dl
  101704:	80 fa 64             	cmp    $0x64,%dl
  101707:	0f 84 bf 00 00 00    	je     1017cc <printk+0x108>
  10170d:	0f 8e 01 01 00 00    	jle    101814 <printk+0x150>
  101713:	80 fa 73             	cmp    $0x73,%dl
  101716:	0f 84 84 00 00 00    	je     1017a0 <printk+0xdc>
  10171c:	80 fa 78             	cmp    $0x78,%dl
  10171f:	75 c7                	jne    1016e8 <printk+0x24>
  101721:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  101728:	8d 70 04             	lea    0x4(%eax),%esi
  10172b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10172e:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101731:	56                   	push   %esi
  101732:	ff 30                	pushl  (%eax)
  101734:	e8 17 ff ff ff       	call   101650 <i2X>
  101739:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  10173c:	8d b7 20 34 10 00    	lea    0x103420(%edi),%esi
  101742:	8a 11                	mov    (%ecx),%dl
  101744:	83 c4 08             	add    $0x8,%esp
  101747:	31 c0                	xor    %eax,%eax
  101749:	84 d2                	test   %dl,%dl
  10174b:	74 0f                	je     10175c <printk+0x98>
  10174d:	8d 76 00             	lea    0x0(%esi),%esi
  101750:	40                   	inc    %eax
  101751:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101755:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  101758:	84 d2                	test   %dl,%dl
  10175a:	75 f4                	jne    101750 <printk+0x8c>
  10175c:	01 c7                	add    %eax,%edi
  10175e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101761:	8d 4b 01             	lea    0x1(%ebx),%ecx
  101764:	8a 53 01             	mov    0x1(%ebx),%dl
  101767:	84 d2                	test   %dl,%dl
  101769:	75 8e                	jne    1016f9 <printk+0x35>
  10176b:	c6 87 20 34 10 00 00 	movb   $0x0,0x103420(%edi)
  101772:	0f be 05 20 34 10 00 	movsbl 0x103420,%eax
  101779:	bb 20 34 10 00       	mov    $0x103420,%ebx
  10177e:	84 c0                	test   %al,%al
  101780:	74 16                	je     101798 <printk+0xd4>
  101782:	66 90                	xchg   %ax,%ax
  101784:	83 ec 0c             	sub    $0xc,%esp
  101787:	50                   	push   %eax
  101788:	e8 cf f2 ff ff       	call   100a5c <putChar>
  10178d:	43                   	inc    %ebx
  10178e:	0f be 03             	movsbl (%ebx),%eax
  101791:	83 c4 10             	add    $0x10,%esp
  101794:	84 c0                	test   %al,%al
  101796:	75 ec                	jne    101784 <printk+0xc0>
  101798:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10179b:	5b                   	pop    %ebx
  10179c:	5e                   	pop    %esi
  10179d:	5f                   	pop    %edi
  10179e:	5d                   	pop    %ebp
  10179f:	c3                   	ret    
  1017a0:	8d 70 04             	lea    0x4(%eax),%esi
  1017a3:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1017a6:	8b 08                	mov    (%eax),%ecx
  1017a8:	8d b7 20 34 10 00    	lea    0x103420(%edi),%esi
  1017ae:	8a 11                	mov    (%ecx),%dl
  1017b0:	31 c0                	xor    %eax,%eax
  1017b2:	84 d2                	test   %dl,%dl
  1017b4:	74 a6                	je     10175c <printk+0x98>
  1017b6:	66 90                	xchg   %ax,%ax
  1017b8:	40                   	inc    %eax
  1017b9:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1017bd:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  1017c0:	84 d2                	test   %dl,%dl
  1017c2:	75 f4                	jne    1017b8 <printk+0xf4>
  1017c4:	01 c7                	add    %eax,%edi
  1017c6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1017c9:	eb 96                	jmp    101761 <printk+0x9d>
  1017cb:	90                   	nop
  1017cc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1017d3:	8d 70 04             	lea    0x4(%eax),%esi
  1017d6:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1017d9:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  1017dc:	56                   	push   %esi
  1017dd:	ff 30                	pushl  (%eax)
  1017df:	e8 d0 fd ff ff       	call   1015b4 <i2A>
  1017e4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1017e7:	8d b7 20 34 10 00    	lea    0x103420(%edi),%esi
  1017ed:	8a 11                	mov    (%ecx),%dl
  1017ef:	83 c4 08             	add    $0x8,%esp
  1017f2:	31 c0                	xor    %eax,%eax
  1017f4:	84 d2                	test   %dl,%dl
  1017f6:	0f 84 60 ff ff ff    	je     10175c <printk+0x98>
  1017fc:	40                   	inc    %eax
  1017fd:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101801:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  101804:	84 d2                	test   %dl,%dl
  101806:	75 f4                	jne    1017fc <printk+0x138>
  101808:	01 c7                	add    %eax,%edi
  10180a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10180d:	e9 4f ff ff ff       	jmp    101761 <printk+0x9d>
  101812:	66 90                	xchg   %ax,%ax
  101814:	80 fa 63             	cmp    $0x63,%dl
  101817:	0f 85 cb fe ff ff    	jne    1016e8 <printk+0x24>
  10181d:	8b 10                	mov    (%eax),%edx
  10181f:	88 97 20 34 10 00    	mov    %dl,0x103420(%edi)
  101825:	83 c0 04             	add    $0x4,%eax
  101828:	47                   	inc    %edi
  101829:	e9 c1 fe ff ff       	jmp    1016ef <printk+0x2b>
  10182e:	31 ff                	xor    %edi,%edi
  101830:	e9 36 ff ff ff       	jmp    10176b <printk+0xa7>
  101835:	66 90                	xchg   %ax,%ax
  101837:	90                   	nop

00101838 <abort>:
  101838:	55                   	push   %ebp
  101839:	89 e5                	mov    %esp,%ebp
  10183b:	57                   	push   %edi
  10183c:	56                   	push   %esi
  10183d:	53                   	push   %ebx
  10183e:	83 ec 1c             	sub    $0x1c,%esp
  101841:	8b 55 08             	mov    0x8(%ebp),%edx
  101844:	fa                   	cli    
  101845:	8a 02                	mov    (%edx),%al
  101847:	b9 d2 32 10 00       	mov    $0x1032d2,%ecx
  10184c:	84 c0                	test   %al,%al
  10184e:	74 0b                	je     10185b <abort+0x23>
  101850:	41                   	inc    %ecx
  101851:	42                   	inc    %edx
  101852:	88 41 ff             	mov    %al,-0x1(%ecx)
  101855:	8a 02                	mov    (%edx),%al
  101857:	84 c0                	test   %al,%al
  101859:	75 f5                	jne    101850 <abort+0x18>
  10185b:	c6 01 3a             	movb   $0x3a,(%ecx)
  10185e:	bb 3d 3c 10 00       	mov    $0x103c3d,%ebx
  101863:	be 0a 00 00 00       	mov    $0xa,%esi
  101868:	bf 67 66 66 66       	mov    $0x66666667,%edi
  10186d:	4b                   	dec    %ebx
  10186e:	8b 45 0c             	mov    0xc(%ebp),%eax
  101871:	99                   	cltd   
  101872:	f7 fe                	idiv   %esi
  101874:	8d 42 30             	lea    0x30(%edx),%eax
  101877:	88 45 e7             	mov    %al,-0x19(%ebp)
  10187a:	88 03                	mov    %al,(%ebx)
  10187c:	89 f8                	mov    %edi,%eax
  10187e:	f7 6d 0c             	imull  0xc(%ebp)
  101881:	c1 fa 02             	sar    $0x2,%edx
  101884:	8b 45 0c             	mov    0xc(%ebp),%eax
  101887:	c1 f8 1f             	sar    $0x1f,%eax
  10188a:	29 c2                	sub    %eax,%edx
  10188c:	89 55 0c             	mov    %edx,0xc(%ebp)
  10188f:	75 dc                	jne    10186d <abort+0x35>
  101891:	41                   	inc    %ecx
  101892:	41                   	inc    %ecx
  101893:	43                   	inc    %ebx
  101894:	8a 45 e7             	mov    -0x19(%ebp),%al
  101897:	88 41 ff             	mov    %al,-0x1(%ecx)
  10189a:	8a 03                	mov    (%ebx),%al
  10189c:	88 45 e7             	mov    %al,-0x19(%ebp)
  10189f:	84 c0                	test   %al,%al
  1018a1:	75 ef                	jne    101892 <abort+0x5a>
  1018a3:	c6 01 0a             	movb   $0xa,(%ecx)
  1018a6:	0f be 05 c0 32 10 00 	movsbl 0x1032c0,%eax
  1018ad:	84 c0                	test   %al,%al
  1018af:	74 1b                	je     1018cc <abort+0x94>
  1018b1:	bb c0 32 10 00       	mov    $0x1032c0,%ebx
  1018b6:	83 ec 0c             	sub    $0xc,%esp
  1018b9:	50                   	push   %eax
  1018ba:	e8 9d f1 ff ff       	call   100a5c <putChar>
  1018bf:	43                   	inc    %ebx
  1018c0:	0f be 03             	movsbl (%ebx),%eax
  1018c3:	83 c4 10             	add    $0x10,%esp
  1018c6:	84 c0                	test   %al,%al
  1018c8:	75 ec                	jne    1018b6 <abort+0x7e>
  1018ca:	66 90                	xchg   %ax,%ax
  1018cc:	f4                   	hlt    
  1018cd:	eb fd                	jmp    1018cc <abort+0x94>

001018cf <irqEmpty>:
  1018cf:	6a 00                	push   $0x0
  1018d1:	6a ff                	push   $0xffffffff
  1018d3:	eb 13                	jmp    1018e8 <asmDoIrq>

001018d5 <irqGProtectFault>:
  1018d5:	6a 0d                	push   $0xd
  1018d7:	eb 0f                	jmp    1018e8 <asmDoIrq>

001018d9 <irqSyscall>:
  1018d9:	6a 00                	push   $0x0
  1018db:	68 80 00 00 00       	push   $0x80
  1018e0:	eb 06                	jmp    1018e8 <asmDoIrq>

001018e2 <irqTime>:
  1018e2:	6a 00                	push   $0x0
  1018e4:	6a 20                	push   $0x20
  1018e6:	eb 00                	jmp    1018e8 <asmDoIrq>

001018e8 <asmDoIrq>:
  1018e8:	60                   	pusha  
  1018e9:	1e                   	push   %ds
  1018ea:	06                   	push   %es
  1018eb:	0f a0                	push   %fs
  1018ed:	0f a8                	push   %gs
  1018ef:	54                   	push   %esp
  1018f0:	e8 7f fa ff ff       	call   101374 <irqHandle>
  1018f5:	5c                   	pop    %esp
  1018f6:	0f a9                	pop    %gs
  1018f8:	0f a1                	pop    %fs
  1018fa:	07                   	pop    %es
  1018fb:	1f                   	pop    %ds
  1018fc:	61                   	popa   
  1018fd:	83 c4 04             	add    $0x4,%esp
  101900:	83 c4 04             	add    $0x4,%esp
  101903:	cf                   	iret   
