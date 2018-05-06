
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 85 15 00 00       	call   101590 <initTimer>
  10000b:	e8 8c 10 00 00       	call   10109c <init_pcb>
  100010:	e8 cb 10 00 00       	call   1010e0 <init_kernel_pcb>
  100015:	e8 46 08 00 00       	call   100860 <initSerial>
  10001a:	e8 81 11 00 00       	call   1011a0 <initIdt>
  10001f:	e8 14 15 00 00       	call   101538 <initIntr>
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
  10005f:	66 c7 05 e0 7d 13 01 	movw   $0xffff,0x1137de0
  100066:	ff ff 
  100068:	66 a3 e2 7d 13 01    	mov    %ax,0x1137de2
  10006e:	89 c2                	mov    %eax,%edx
  100070:	c1 ea 10             	shr    $0x10,%edx
  100073:	88 15 e4 7d 13 01    	mov    %dl,0x1137de4
  100079:	c6 05 e5 7d 13 01 f2 	movb   $0xf2,0x1137de5
  100080:	c6 05 e6 7d 13 01 cf 	movb   $0xcf,0x1137de6
  100087:	c1 e8 18             	shr    $0x18,%eax
  10008a:	a2 e7 7d 13 01       	mov    %al,0x1137de7
  10008f:	66 c7 05 20 35 10 00 	movw   $0x4f,0x103520
  100096:	4f 00 
  100098:	b8 c0 7d 13 01       	mov    $0x1137dc0,%eax
  10009d:	66 a3 22 35 10 00    	mov    %ax,0x103522
  1000a3:	c1 e8 10             	shr    $0x10,%eax
  1000a6:	66 a3 24 35 10 00    	mov    %ax,0x103524
  1000ac:	b8 20 35 10 00       	mov    $0x103520,%eax
  1000b1:	0f 01 10             	lgdtl  (%eax)
  1000b4:	b8 01 00 00 00       	mov    $0x1,%eax
  1000b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000bc:	c9                   	leave  
  1000bd:	c3                   	ret    
  1000be:	66 90                	xchg   %ax,%ax
  1000c0:	66 c7 05 d8 7d 13 01 	movw   $0xffff,0x1137dd8
  1000c7:	ff ff 
  1000c9:	66 a3 da 7d 13 01    	mov    %ax,0x1137dda
  1000cf:	89 c2                	mov    %eax,%edx
  1000d1:	c1 ea 10             	shr    $0x10,%edx
  1000d4:	88 15 dc 7d 13 01    	mov    %dl,0x1137ddc
  1000da:	c6 05 dd 7d 13 01 fa 	movb   $0xfa,0x1137ddd
  1000e1:	c6 05 de 7d 13 01 cf 	movb   $0xcf,0x1137dde
  1000e8:	c1 e8 18             	shr    $0x18,%eax
  1000eb:	a2 df 7d 13 01       	mov    %al,0x1137ddf
  1000f0:	eb 9d                	jmp    10008f <change_gdt+0x5b>
  1000f2:	66 90                	xchg   %ax,%ax
  1000f4:	83 fb 01             	cmp    $0x1,%ebx
  1000f7:	75 37                	jne    100130 <change_gdt+0xfc>
  1000f9:	66 c7 05 c8 7d 13 01 	movw   $0xffff,0x1137dc8
  100100:	ff ff 
  100102:	66 a3 ca 7d 13 01    	mov    %ax,0x1137dca
  100108:	89 c2                	mov    %eax,%edx
  10010a:	c1 ea 10             	shr    $0x10,%edx
  10010d:	88 15 cc 7d 13 01    	mov    %dl,0x1137dcc
  100113:	c6 05 cd 7d 13 01 9a 	movb   $0x9a,0x1137dcd
  10011a:	c6 05 ce 7d 13 01 cf 	movb   $0xcf,0x1137dce
  100121:	c1 e8 18             	shr    $0x18,%eax
  100124:	a2 cf 7d 13 01       	mov    %al,0x1137dcf
  100129:	e9 61 ff ff ff       	jmp    10008f <change_gdt+0x5b>
  10012e:	66 90                	xchg   %ax,%ax
  100130:	83 ec 0c             	sub    $0xc,%esp
  100133:	68 f8 18 10 00       	push   $0x1018f8
  100138:	e8 7b 15 00 00       	call   1016b8 <printk>
  10013d:	89 1c 24             	mov    %ebx,(%esp)
  100140:	68 38 19 10 00       	push   $0x101938
  100145:	6a 18                	push   $0x18
  100147:	68 fe 18 10 00       	push   $0x1018fe
  10014c:	68 0b 19 10 00       	push   $0x10190b
  100151:	e8 62 15 00 00       	call   1016b8 <printk>
  100156:	83 c4 14             	add    $0x14,%esp
  100159:	68 27 19 10 00       	push   $0x101927
  10015e:	e8 55 15 00 00       	call   1016b8 <printk>
  100163:	58                   	pop    %eax
  100164:	5a                   	pop    %edx
  100165:	6a 19                	push   $0x19
  100167:	68 fe 18 10 00       	push   $0x1018fe
  10016c:	e8 bb 16 00 00       	call   10182c <abort>
  100171:	83 c4 10             	add    $0x10,%esp
  100174:	e9 16 ff ff ff       	jmp    10008f <change_gdt+0x5b>
  100179:	8d 76 00             	lea    0x0(%esi),%esi
  10017c:	66 c7 05 d0 7d 13 01 	movw   $0xffff,0x1137dd0
  100183:	ff ff 
  100185:	66 a3 d2 7d 13 01    	mov    %ax,0x1137dd2
  10018b:	89 c2                	mov    %eax,%edx
  10018d:	c1 ea 10             	shr    $0x10,%edx
  100190:	88 15 d4 7d 13 01    	mov    %dl,0x1137dd4
  100196:	c6 05 d5 7d 13 01 92 	movb   $0x92,0x1137dd5
  10019d:	c6 05 d6 7d 13 01 cf 	movb   $0xcf,0x1137dd6
  1001a4:	c1 e8 18             	shr    $0x18,%eax
  1001a7:	a2 d7 7d 13 01       	mov    %al,0x1137dd7
  1001ac:	e9 de fe ff ff       	jmp    10008f <change_gdt+0x5b>
  1001b1:	8d 76 00             	lea    0x0(%esi),%esi

001001b4 <change_tss>:
  1001b4:	55                   	push   %ebp
  1001b5:	89 e5                	mov    %esp,%ebp
  1001b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1001ba:	a3 28 7e 13 01       	mov    %eax,0x1137e28
  1001bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1001c2:	a3 24 7e 13 01       	mov    %eax,0x1137e24
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
  1001d8:	be 20 7e 13 01       	mov    $0x1137e20,%esi
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
  10027b:	b9 c0 7d 13 01       	mov    $0x1137dc0,%ecx
  100280:	66 c7 05 c8 7d 13 01 	movw   $0xffff,0x1137dc8
  100287:	ff ff 
  100289:	66 c7 05 ca 7d 13 01 	movw   $0x0,0x1137dca
  100290:	00 00 
  100292:	c6 05 cc 7d 13 01 00 	movb   $0x0,0x1137dcc
  100299:	c6 05 cd 7d 13 01 9a 	movb   $0x9a,0x1137dcd
  1002a0:	c6 05 ce 7d 13 01 cf 	movb   $0xcf,0x1137dce
  1002a7:	c6 05 cf 7d 13 01 00 	movb   $0x0,0x1137dcf
  1002ae:	66 c7 05 d0 7d 13 01 	movw   $0xffff,0x1137dd0
  1002b5:	ff ff 
  1002b7:	66 c7 05 d2 7d 13 01 	movw   $0x0,0x1137dd2
  1002be:	00 00 
  1002c0:	c6 05 d4 7d 13 01 00 	movb   $0x0,0x1137dd4
  1002c7:	c6 05 d5 7d 13 01 92 	movb   $0x92,0x1137dd5
  1002ce:	c6 05 d6 7d 13 01 cf 	movb   $0xcf,0x1137dd6
  1002d5:	c6 05 d7 7d 13 01 00 	movb   $0x0,0x1137dd7
  1002dc:	66 c7 05 d8 7d 13 01 	movw   $0xffff,0x1137dd8
  1002e3:	ff ff 
  1002e5:	66 c7 05 da 7d 13 01 	movw   $0x0,0x1137dda
  1002ec:	00 00 
  1002ee:	c6 05 dc 7d 13 01 00 	movb   $0x0,0x1137ddc
  1002f5:	c6 05 dd 7d 13 01 fa 	movb   $0xfa,0x1137ddd
  1002fc:	c6 05 de 7d 13 01 cf 	movb   $0xcf,0x1137dde
  100303:	c6 05 df 7d 13 01 00 	movb   $0x0,0x1137ddf
  10030a:	66 c7 05 e0 7d 13 01 	movw   $0xffff,0x1137de0
  100311:	ff ff 
  100313:	66 c7 05 e2 7d 13 01 	movw   $0x0,0x1137de2
  10031a:	00 00 
  10031c:	c6 05 e4 7d 13 01 00 	movb   $0x0,0x1137de4
  100323:	c6 05 e5 7d 13 01 f2 	movb   $0xf2,0x1137de5
  10032a:	c6 05 e6 7d 13 01 cf 	movb   $0xcf,0x1137de6
  100331:	c6 05 e7 7d 13 01 00 	movb   $0x0,0x1137de7
  100338:	66 c7 05 e8 7d 13 01 	movw   $0x63,0x1137de8
  10033f:	63 00 
  100341:	b8 20 7e 13 01       	mov    $0x1137e20,%eax
  100346:	66 a3 ea 7d 13 01    	mov    %ax,0x1137dea
  10034c:	89 c2                	mov    %eax,%edx
  10034e:	c1 ea 10             	shr    $0x10,%edx
  100351:	88 15 ec 7d 13 01    	mov    %dl,0x1137dec
  100357:	c6 05 ed 7d 13 01 89 	movb   $0x89,0x1137ded
  10035e:	c6 05 ee 7d 13 01 40 	movb   $0x40,0x1137dee
  100365:	c1 e8 18             	shr    $0x18,%eax
  100368:	a2 ef 7d 13 01       	mov    %al,0x1137def
  10036d:	a1 30 19 10 00       	mov    0x101930,%eax
  100372:	8b 15 34 19 10 00    	mov    0x101934,%edx
  100378:	a3 f0 7d 13 01       	mov    %eax,0x1137df0
  10037d:	89 15 f4 7d 13 01    	mov    %edx,0x1137df4
  100383:	66 c7 05 00 7e 13 01 	movw   $0xffff,0x1137e00
  10038a:	ff ff 
  10038c:	66 c7 05 02 7e 13 01 	movw   $0x0,0x1137e02
  100393:	00 00 
  100395:	c6 05 04 7e 13 01 00 	movb   $0x0,0x1137e04
  10039c:	c6 05 05 7e 13 01 f2 	movb   $0xf2,0x1137e05
  1003a3:	c6 05 06 7e 13 01 cf 	movb   $0xcf,0x1137e06
  1003aa:	c6 05 07 7e 13 01 00 	movb   $0x0,0x1137e07
  1003b1:	66 c7 05 20 35 10 00 	movw   $0x4f,0x103520
  1003b8:	4f 00 
  1003ba:	66 89 0d 22 35 10 00 	mov    %cx,0x103522
  1003c1:	c1 e9 10             	shr    $0x10,%ecx
  1003c4:	66 89 0d 24 35 10 00 	mov    %cx,0x103524
  1003cb:	b8 20 35 10 00       	mov    $0x103520,%eax
  1003d0:	0f 01 10             	lgdtl  (%eax)
  1003d3:	a1 08 5e 10 00       	mov    0x105e08,%eax
  1003d8:	a3 28 7e 13 01       	mov    %eax,0x1137e28
  1003dd:	c7 05 24 7e 13 01 bc 	movl   $0x105dbc,0x1137e24
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
  100431:	8d 04 c5 c0 3d 10 00 	lea    0x103dc0(,%eax,8),%eax
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
  10045e:	c7 05 a4 3d 10 00 01 	movl   $0x1,0x103da4
  100465:	00 00 00 
  100468:	c7 05 70 7e 10 00 23 	movl   $0x23,0x107e70
  10046f:	00 00 00 
  100472:	c7 05 64 7e 10 00 1b 	movl   $0x1b,0x107e64
  100479:	00 00 00 
  10047c:	c7 05 34 7e 10 00 23 	movl   $0x23,0x107e34
  100483:	00 00 00 
  100486:	c7 05 30 7e 10 00 23 	movl   $0x23,0x107e30
  10048d:	00 00 00 
  100490:	c7 05 2c 7e 10 00 23 	movl   $0x23,0x107e2c
  100497:	00 00 00 
  10049a:	c7 05 6c 7e 10 00 00 	movl   $0x400000,0x107e6c
  1004a1:	00 40 00 
  1004a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1004a7:	a3 60 7e 10 00       	mov    %eax,0x107e60
  1004ac:	c7 05 78 7e 10 00 0a 	movl   $0xa,0x107e78
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
  1005aa:	68 43 19 10 00       	push   $0x101943
  1005af:	e8 04 11 00 00       	call   1016b8 <printk>
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
  1005ef:	c7 04 24 f8 18 10 00 	movl   $0x1018f8,(%esp)
  1005f6:	e8 bd 10 00 00       	call   1016b8 <printk>
  1005fb:	e8 a0 03 00 00       	call   1009a0 <getpid>
  100600:	89 c2                	mov    %eax,%edx
  100602:	c1 e2 07             	shl    $0x7,%edx
  100605:	01 c2                	add    %eax,%edx
  100607:	01 d2                	add    %edx,%edx
  100609:	01 c2                	add    %eax,%edx
  10060b:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10060e:	8b 34 c5 14 5e 10 00 	mov    0x105e14(,%eax,8),%esi
  100615:	e8 86 03 00 00       	call   1009a0 <getpid>
  10061a:	5a                   	pop    %edx
  10061b:	59                   	pop    %ecx
  10061c:	56                   	push   %esi
  10061d:	50                   	push   %eax
  10061e:	68 94 19 10 00       	push   $0x101994
  100623:	6a 09                	push   $0x9
  100625:	68 51 19 10 00       	push   $0x101951
  10062a:	68 70 19 10 00       	push   $0x101970
  10062f:	e8 84 10 00 00       	call   1016b8 <printk>
  100634:	83 c4 14             	add    $0x14,%esp
  100637:	68 27 19 10 00       	push   $0x101927
  10063c:	e8 77 10 00 00       	call   1016b8 <printk>
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
  100668:	68 9e 19 10 00       	push   $0x10199e
  10066d:	e8 46 10 00 00       	call   1016b8 <printk>
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
  10068f:	8b 04 85 c0 3d 10 00 	mov    0x103dc0(,%eax,4),%eax
  100696:	89 04 9d 90 7e 10 00 	mov    %eax,0x107e90(,%ebx,4)
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
  1006c8:	b8 90 9e 10 00       	mov    $0x109e90,%eax
  1006cd:	b9 13 00 00 00       	mov    $0x13,%ecx
  1006d2:	89 c7                	mov    %eax,%edi
  1006d4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1006d6:	c7 05 bc 9e 10 00 00 	movl   $0x0,0x109ebc
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
  100705:	8b 15 28 35 10 00    	mov    0x103528,%edx
  10070b:	8b 0d 2c 35 10 00    	mov    0x10352c,%ecx
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
  100733:	c7 05 28 35 10 00 00 	movl   $0x0,0x103528
  10073a:	00 00 00 
  10073d:	41                   	inc    %ecx
  10073e:	89 0d 2c 35 10 00    	mov    %ecx,0x10352c
  100744:	b8 01 00 00 00       	mov    $0x1,%eax
  100749:	5b                   	pop    %ebx
  10074a:	5f                   	pop    %edi
  10074b:	5d                   	pop    %ebp
  10074c:	c3                   	ret    
  10074d:	8d 76 00             	lea    0x0(%esi),%esi
  100750:	89 15 28 35 10 00    	mov    %edx,0x103528
  100756:	b8 01 00 00 00       	mov    $0x1,%eax
  10075b:	5b                   	pop    %ebx
  10075c:	5f                   	pop    %edi
  10075d:	5d                   	pop    %ebp
  10075e:	c3                   	ret    
  10075f:	90                   	nop
  100760:	c7 05 28 35 10 00 00 	movl   $0x0,0x103528
  100767:	00 00 00 
  10076a:	ff 05 2c 35 10 00    	incl   0x10352c
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
  1007e7:	68 ba 19 10 00       	push   $0x1019ba
  1007ec:	e8 3b 10 00 00       	call   10182c <abort>
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
  1008cd:	a3 a0 3d 10 00       	mov    %eax,0x103da0
  1008d2:	c1 e0 07             	shl    $0x7,%eax
  1008d5:	01 d8                	add    %ebx,%eax
  1008d7:	01 c0                	add    %eax,%eax
  1008d9:	01 d8                	add    %ebx,%eax
  1008db:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1008de:	8d 04 c5 bc 5d 10 00 	lea    0x105dbc(,%eax,8),%eax
  1008e5:	50                   	push   %eax
  1008e6:	6a 10                	push   $0x10
  1008e8:	e8 c7 f8 ff ff       	call   1001b4 <change_tss>
  1008ed:	8d 45 94             	lea    -0x6c(%ebp),%eax
  1008f0:	89 04 24             	mov    %eax,(%esp)
  1008f3:	e8 d8 f8 ff ff       	call   1001d0 <get_tss>
  1008f8:	8b 15 a0 3d 10 00    	mov    0x103da0,%edx
  1008fe:	89 d0                	mov    %edx,%eax
  100900:	c1 e0 07             	shl    $0x7,%eax
  100903:	01 d0                	add    %edx,%eax
  100905:	01 c0                	add    %eax,%eax
  100907:	01 d0                	add    %edx,%eax
  100909:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10090c:	8d 04 c5 bc 5d 10 00 	lea    0x105dbc(,%eax,8),%eax
  100913:	83 c4 0c             	add    $0xc,%esp
  100916:	39 45 98             	cmp    %eax,-0x68(%ebp)
  100919:	74 12                	je     10092d <put_into_running.part.0+0x69>
  10091b:	83 ec 08             	sub    $0x8,%esp
  10091e:	6a 10                	push   $0x10
  100920:	68 d6 19 10 00       	push   $0x1019d6
  100925:	e8 02 0f 00 00       	call   10182c <abort>
  10092a:	83 c4 10             	add    $0x10,%esp
  10092d:	83 ec 0c             	sub    $0xc,%esp
  100930:	68 f8 18 10 00       	push   $0x1018f8
  100935:	e8 7e 0d 00 00       	call   1016b8 <printk>
  10093a:	89 1c 24             	mov    %ebx,(%esp)
  10093d:	68 fc 1a 10 00       	push   $0x101afc
  100942:	6a 12                	push   $0x12
  100944:	68 d6 19 10 00       	push   $0x1019d6
  100949:	68 e4 19 10 00       	push   $0x1019e4
  10094e:	e8 65 0d 00 00       	call   1016b8 <printk>
  100953:	83 c4 14             	add    $0x14,%esp
  100956:	68 27 19 10 00       	push   $0x101927
  10095b:	e8 58 0d 00 00       	call   1016b8 <printk>
  100960:	83 c4 10             	add    $0x10,%esp
  100963:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100966:	c9                   	leave  
  100967:	c3                   	ret    

00100968 <put_into_running>:
  100968:	55                   	push   %ebp
  100969:	89 e5                	mov    %esp,%ebp
  10096b:	83 ec 08             	sub    $0x8,%esp
  10096e:	8b 45 08             	mov    0x8(%ebp),%eax
  100971:	39 05 a0 3d 10 00    	cmp    %eax,0x103da0
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
  1009a3:	a1 a0 3d 10 00       	mov    0x103da0,%eax
  1009a8:	5d                   	pop    %ebp
  1009a9:	c3                   	ret    
  1009aa:	66 90                	xchg   %ax,%ax

001009ac <getrunnable>:
  1009ac:	55                   	push   %ebp
  1009ad:	89 e5                	mov    %esp,%ebp
  1009af:	a1 04 34 10 00       	mov    0x103404,%eax
  1009b4:	5d                   	pop    %ebp
  1009b5:	c3                   	ret    
  1009b6:	66 90                	xchg   %ax,%ax

001009b8 <getblocked>:
  1009b8:	55                   	push   %ebp
  1009b9:	89 e5                	mov    %esp,%ebp
  1009bb:	a1 00 34 10 00       	mov    0x103400,%eax
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
  1009d5:	8b 1d 04 34 10 00    	mov    0x103404,%ebx
  1009db:	83 fb ff             	cmp    $0xffffffff,%ebx
  1009de:	0f 84 a4 00 00 00    	je     100a88 <get_from_runnable+0xb8>
  1009e4:	89 d8                	mov    %ebx,%eax
  1009e6:	c1 e0 07             	shl    $0x7,%eax
  1009e9:	01 d8                	add    %ebx,%eax
  1009eb:	01 c0                	add    %eax,%eax
  1009ed:	01 d8                	add    %ebx,%eax
  1009ef:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1009f2:	8d 04 c5 c0 3d 10 00 	lea    0x103dc0(,%eax,8),%eax
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
  100a17:	89 14 c5 20 5e 10 00 	mov    %edx,0x105e20(,%eax,8)
  100a1e:	89 d0                	mov    %edx,%eax
  100a20:	c1 e0 07             	shl    $0x7,%eax
  100a23:	01 d0                	add    %edx,%eax
  100a25:	01 c0                	add    %eax,%eax
  100a27:	01 d0                	add    %edx,%eax
  100a29:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100a2c:	89 0c c5 1c 5e 10 00 	mov    %ecx,0x105e1c(,%eax,8)
  100a33:	89 15 04 34 10 00    	mov    %edx,0x103404
  100a39:	83 ec 0c             	sub    $0xc,%esp
  100a3c:	68 f8 18 10 00       	push   $0x1018f8
  100a41:	e8 72 0c 00 00       	call   1016b8 <printk>
  100a46:	58                   	pop    %eax
  100a47:	5a                   	pop    %edx
  100a48:	ff 35 04 34 10 00    	pushl  0x103404
  100a4e:	53                   	push   %ebx
  100a4f:	68 d8 1a 10 00       	push   $0x101ad8
  100a54:	6a 61                	push   $0x61
  100a56:	68 d6 19 10 00       	push   $0x1019d6
  100a5b:	68 04 1a 10 00       	push   $0x101a04
  100a60:	e8 53 0c 00 00       	call   1016b8 <printk>
  100a65:	83 c4 14             	add    $0x14,%esp
  100a68:	68 27 19 10 00       	push   $0x101927
  100a6d:	e8 46 0c 00 00       	call   1016b8 <printk>
  100a72:	83 c4 10             	add    $0x10,%esp
  100a75:	89 d8                	mov    %ebx,%eax
  100a77:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100a7a:	c9                   	leave  
  100a7b:	c3                   	ret    
  100a7c:	c7 05 04 34 10 00 ff 	movl   $0xffffffff,0x103404
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
  100a98:	8b 15 04 34 10 00    	mov    0x103404,%edx
  100a9e:	83 fa ff             	cmp    $0xffffffff,%edx
  100aa1:	0f 84 ed 00 00 00    	je     100b94 <put_into_runnable+0x104>
  100aa7:	89 d0                	mov    %edx,%eax
  100aa9:	c1 e0 07             	shl    $0x7,%eax
  100aac:	01 d0                	add    %edx,%eax
  100aae:	01 c0                	add    %eax,%eax
  100ab0:	01 d0                	add    %edx,%eax
  100ab2:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100ab5:	8d 34 c5 c0 3d 10 00 	lea    0x103dc0(,%eax,8),%esi
  100abc:	8b 8e 5c 20 00 00    	mov    0x205c(%esi),%ecx
  100ac2:	89 c8                	mov    %ecx,%eax
  100ac4:	c1 e0 07             	shl    $0x7,%eax
  100ac7:	01 c8                	add    %ecx,%eax
  100ac9:	01 c0                	add    %eax,%eax
  100acb:	01 c8                	add    %ecx,%eax
  100acd:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100ad0:	89 1c c5 20 5e 10 00 	mov    %ebx,0x105e20(,%eax,8)
  100ad7:	89 d8                	mov    %ebx,%eax
  100ad9:	c1 e0 07             	shl    $0x7,%eax
  100adc:	01 d8                	add    %ebx,%eax
  100ade:	01 c0                	add    %eax,%eax
  100ae0:	01 d8                	add    %ebx,%eax
  100ae2:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100ae5:	8d 04 c5 c0 3d 10 00 	lea    0x103dc0(,%eax,8),%eax
  100aec:	89 88 5c 20 00 00    	mov    %ecx,0x205c(%eax)
  100af2:	89 90 60 20 00 00    	mov    %edx,0x2060(%eax)
  100af8:	89 9e 5c 20 00 00    	mov    %ebx,0x205c(%esi)
  100afe:	89 d8                	mov    %ebx,%eax
  100b00:	c1 e0 07             	shl    $0x7,%eax
  100b03:	01 d8                	add    %ebx,%eax
  100b05:	01 c0                	add    %eax,%eax
  100b07:	01 d8                	add    %ebx,%eax
  100b09:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b0c:	c7 04 c5 0c 5e 10 00 	movl   $0x1,0x105e0c(,%eax,8)
  100b13:	01 00 00 00 
  100b17:	85 db                	test   %ebx,%ebx
  100b19:	75 0a                	jne    100b25 <put_into_runnable+0x95>
  100b1b:	c7 05 f8 5d 10 00 bc 	movl   $0x1008bc,0x105df8
  100b22:	08 10 00 
  100b25:	83 ec 0c             	sub    $0xc,%esp
  100b28:	68 f8 18 10 00       	push   $0x1018f8
  100b2d:	e8 86 0b 00 00       	call   1016b8 <printk>
  100b32:	58                   	pop    %eax
  100b33:	5a                   	pop    %edx
  100b34:	53                   	push   %ebx
  100b35:	ff 35 04 34 10 00    	pushl  0x103404
  100b3b:	68 c4 1a 10 00       	push   $0x101ac4
  100b40:	6a 7d                	push   $0x7d
  100b42:	68 d6 19 10 00       	push   $0x1019d6
  100b47:	68 38 1a 10 00       	push   $0x101a38
  100b4c:	e8 67 0b 00 00       	call   1016b8 <printk>
  100b51:	83 c4 14             	add    $0x14,%esp
  100b54:	68 27 19 10 00       	push   $0x101927
  100b59:	e8 5a 0b 00 00       	call   1016b8 <printk>
  100b5e:	89 d8                	mov    %ebx,%eax
  100b60:	c1 e0 07             	shl    $0x7,%eax
  100b63:	01 d8                	add    %ebx,%eax
  100b65:	01 c0                	add    %eax,%eax
  100b67:	01 d8                	add    %ebx,%eax
  100b69:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b6c:	8d 04 c5 c0 3d 10 00 	lea    0x103dc0(,%eax,8),%eax
  100b73:	8b 15 a8 3d 10 00    	mov    0x103da8,%edx
  100b79:	89 90 50 20 00 00    	mov    %edx,0x2050(%eax)
  100b7f:	8b 55 0c             	mov    0xc(%ebp),%edx
  100b82:	89 90 64 20 00 00    	mov    %edx,0x2064(%eax)
  100b88:	b8 01 00 00 00       	mov    $0x1,%eax
  100b8d:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100b90:	5b                   	pop    %ebx
  100b91:	5e                   	pop    %esi
  100b92:	5d                   	pop    %ebp
  100b93:	c3                   	ret    
  100b94:	89 1d 04 34 10 00    	mov    %ebx,0x103404
  100b9a:	89 d8                	mov    %ebx,%eax
  100b9c:	c1 e0 07             	shl    $0x7,%eax
  100b9f:	01 d8                	add    %ebx,%eax
  100ba1:	01 c0                	add    %eax,%eax
  100ba3:	01 d8                	add    %ebx,%eax
  100ba5:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100ba8:	8d 04 c5 c0 3d 10 00 	lea    0x103dc0(,%eax,8),%eax
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
  100bcc:	8b 0d 00 34 10 00    	mov    0x103400,%ecx
  100bd2:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100bd5:	0f 84 99 00 00 00    	je     100c74 <put_into_block+0xb4>
  100bdb:	89 ca                	mov    %ecx,%edx
  100bdd:	c1 e2 07             	shl    $0x7,%edx
  100be0:	01 ca                	add    %ecx,%edx
  100be2:	01 d2                	add    %edx,%edx
  100be4:	01 ca                	add    %ecx,%edx
  100be6:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100be9:	8d 3c d5 c0 3d 10 00 	lea    0x103dc0(,%edx,8),%edi
  100bf0:	8b b7 5c 20 00 00    	mov    0x205c(%edi),%esi
  100bf6:	89 f2                	mov    %esi,%edx
  100bf8:	c1 e2 07             	shl    $0x7,%edx
  100bfb:	01 f2                	add    %esi,%edx
  100bfd:	01 d2                	add    %edx,%edx
  100bff:	01 f2                	add    %esi,%edx
  100c01:	8d 14 96             	lea    (%esi,%edx,4),%edx
  100c04:	89 04 d5 20 5e 10 00 	mov    %eax,0x105e20(,%edx,8)
  100c0b:	89 c2                	mov    %eax,%edx
  100c0d:	c1 e2 07             	shl    $0x7,%edx
  100c10:	01 c2                	add    %eax,%edx
  100c12:	01 d2                	add    %edx,%edx
  100c14:	01 c2                	add    %eax,%edx
  100c16:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c19:	8d 14 d5 c0 3d 10 00 	lea    0x103dc0(,%edx,8),%edx
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
  100c43:	8d 82 c0 5d 10 00    	lea    0x105dc0(%edx),%eax
  100c49:	b9 13 00 00 00       	mov    $0x13,%ecx
  100c4e:	89 c7                	mov    %eax,%edi
  100c50:	89 de                	mov    %ebx,%esi
  100c52:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100c54:	8b 43 20             	mov    0x20(%ebx),%eax
  100c57:	89 82 14 5e 10 00    	mov    %eax,0x105e14(%edx)
  100c5d:	c7 82 0c 5e 10 00 00 	movl   $0x0,0x105e0c(%edx)
  100c64:	00 00 00 
  100c67:	b8 01 00 00 00       	mov    $0x1,%eax
  100c6c:	5b                   	pop    %ebx
  100c6d:	5e                   	pop    %esi
  100c6e:	5f                   	pop    %edi
  100c6f:	5d                   	pop    %ebp
  100c70:	c3                   	ret    
  100c71:	8d 76 00             	lea    0x0(%esi),%esi
  100c74:	a3 00 34 10 00       	mov    %eax,0x103400
  100c79:	89 c2                	mov    %eax,%edx
  100c7b:	c1 e2 07             	shl    $0x7,%edx
  100c7e:	01 c2                	add    %eax,%edx
  100c80:	01 d2                	add    %edx,%edx
  100c82:	01 c2                	add    %eax,%edx
  100c84:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c87:	8d 14 d5 c0 3d 10 00 	lea    0x103dc0(,%edx,8),%edx
  100c8e:	89 82 60 20 00 00    	mov    %eax,0x2060(%edx)
  100c94:	89 82 5c 20 00 00    	mov    %eax,0x205c(%edx)
  100c9a:	eb 96                	jmp    100c32 <put_into_block+0x72>

00100c9c <get_from>:
  100c9c:	55                   	push   %ebp
  100c9d:	89 e5                	mov    %esp,%ebp
  100c9f:	56                   	push   %esi
  100ca0:	53                   	push   %ebx
  100ca1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100ca4:	8b 75 0c             	mov    0xc(%ebp),%esi
  100ca7:	85 db                	test   %ebx,%ebx
  100ca9:	0f 8e 01 01 00 00    	jle    100db0 <get_from+0x114>
  100caf:	39 f3                	cmp    %esi,%ebx
  100cb1:	74 42                	je     100cf5 <get_from+0x59>
  100cb3:	89 d8                	mov    %ebx,%eax
  100cb5:	c1 e0 07             	shl    $0x7,%eax
  100cb8:	01 d8                	add    %ebx,%eax
  100cba:	01 c0                	add    %eax,%eax
  100cbc:	01 d8                	add    %ebx,%eax
  100cbe:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100cc1:	8b 0c c5 20 5e 10 00 	mov    0x105e20(,%eax,8),%ecx
  100cc8:	39 cb                	cmp    %ecx,%ebx
  100cca:	75 25                	jne    100cf1 <get_from+0x55>
  100ccc:	e9 df 00 00 00       	jmp    100db0 <get_from+0x114>
  100cd1:	8d 76 00             	lea    0x0(%esi),%esi
  100cd4:	89 ca                	mov    %ecx,%edx
  100cd6:	c1 e2 07             	shl    $0x7,%edx
  100cd9:	01 ca                	add    %ecx,%edx
  100cdb:	01 d2                	add    %edx,%edx
  100cdd:	01 ca                	add    %ecx,%edx
  100cdf:	8d 04 91             	lea    (%ecx,%edx,4),%eax
  100ce2:	8b 0c c5 20 5e 10 00 	mov    0x105e20(,%eax,8),%ecx
  100ce9:	39 cb                	cmp    %ecx,%ebx
  100ceb:	0f 84 bf 00 00 00    	je     100db0 <get_from+0x114>
  100cf1:	39 ce                	cmp    %ecx,%esi
  100cf3:	75 df                	jne    100cd4 <get_from+0x38>
  100cf5:	89 f0                	mov    %esi,%eax
  100cf7:	c1 e0 07             	shl    $0x7,%eax
  100cfa:	01 f0                	add    %esi,%eax
  100cfc:	01 c0                	add    %eax,%eax
  100cfe:	01 f0                	add    %esi,%eax
  100d00:	8d 04 86             	lea    (%esi,%eax,4),%eax
  100d03:	8b 04 c5 0c 5e 10 00 	mov    0x105e0c(,%eax,8),%eax
  100d0a:	85 c0                	test   %eax,%eax
  100d0c:	0f 84 f6 00 00 00    	je     100e08 <get_from+0x16c>
  100d12:	48                   	dec    %eax
  100d13:	75 7f                	jne    100d94 <get_from+0xf8>
  100d15:	be 04 34 10 00       	mov    $0x103404,%esi
  100d1a:	3b 1e                	cmp    (%esi),%ebx
  100d1c:	74 15                	je     100d33 <get_from+0x97>
  100d1e:	83 ec 08             	sub    $0x8,%esp
  100d21:	68 c9 00 00 00       	push   $0xc9
  100d26:	68 d6 19 10 00       	push   $0x1019d6
  100d2b:	e8 fc 0a 00 00       	call   10182c <abort>
  100d30:	83 c4 10             	add    $0x10,%esp
  100d33:	89 d8                	mov    %ebx,%eax
  100d35:	c1 e0 07             	shl    $0x7,%eax
  100d38:	01 d8                	add    %ebx,%eax
  100d3a:	01 c0                	add    %eax,%eax
  100d3c:	01 d8                	add    %ebx,%eax
  100d3e:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100d41:	8d 04 c5 c0 3d 10 00 	lea    0x103dc0(,%eax,8),%eax
  100d48:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100d4e:	39 da                	cmp    %ebx,%edx
  100d50:	0f 84 be 00 00 00    	je     100e14 <get_from+0x178>
  100d56:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100d5c:	89 c8                	mov    %ecx,%eax
  100d5e:	c1 e0 07             	shl    $0x7,%eax
  100d61:	01 c8                	add    %ecx,%eax
  100d63:	01 c0                	add    %eax,%eax
  100d65:	01 c8                	add    %ecx,%eax
  100d67:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100d6a:	89 14 c5 20 5e 10 00 	mov    %edx,0x105e20(,%eax,8)
  100d71:	89 d0                	mov    %edx,%eax
  100d73:	c1 e0 07             	shl    $0x7,%eax
  100d76:	01 d0                	add    %edx,%eax
  100d78:	01 c0                	add    %eax,%eax
  100d7a:	01 d0                	add    %edx,%eax
  100d7c:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100d7f:	89 0c c5 1c 5e 10 00 	mov    %ecx,0x105e1c(,%eax,8)
  100d86:	89 16                	mov    %edx,(%esi)
  100d88:	89 d8                	mov    %ebx,%eax
  100d8a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d8d:	5b                   	pop    %ebx
  100d8e:	5e                   	pop    %esi
  100d8f:	5d                   	pop    %ebp
  100d90:	c3                   	ret    
  100d91:	8d 76 00             	lea    0x0(%esi),%esi
  100d94:	83 ec 08             	sub    $0x8,%esp
  100d97:	68 c5 00 00 00       	push   $0xc5
  100d9c:	68 d6 19 10 00       	push   $0x1019d6
  100da1:	e8 86 0a 00 00       	call   10182c <abort>
  100da6:	a1 00 00 00 00       	mov    0x0,%eax
  100dab:	0f 0b                	ud2    
  100dad:	8d 76 00             	lea    0x0(%esi),%esi
  100db0:	83 ec 0c             	sub    $0xc,%esp
  100db3:	68 f8 18 10 00       	push   $0x1018f8
  100db8:	e8 fb 08 00 00       	call   1016b8 <printk>
  100dbd:	58                   	pop    %eax
  100dbe:	5a                   	pop    %edx
  100dbf:	56                   	push   %esi
  100dc0:	53                   	push   %ebx
  100dc1:	68 b8 1a 10 00       	push   $0x101ab8
  100dc6:	68 b5 00 00 00       	push   $0xb5
  100dcb:	68 d6 19 10 00       	push   $0x1019d6
  100dd0:	68 68 1a 10 00       	push   $0x101a68
  100dd5:	e8 de 08 00 00       	call   1016b8 <printk>
  100dda:	83 c4 14             	add    $0x14,%esp
  100ddd:	68 27 19 10 00       	push   $0x101927
  100de2:	e8 d1 08 00 00       	call   1016b8 <printk>
  100de7:	59                   	pop    %ecx
  100de8:	5b                   	pop    %ebx
  100de9:	68 b6 00 00 00       	push   $0xb6
  100dee:	68 d6 19 10 00       	push   $0x1019d6
  100df3:	e8 34 0a 00 00       	call   10182c <abort>
  100df8:	83 c4 10             	add    $0x10,%esp
  100dfb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e00:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e03:	5b                   	pop    %ebx
  100e04:	5e                   	pop    %esi
  100e05:	5d                   	pop    %ebp
  100e06:	c3                   	ret    
  100e07:	90                   	nop
  100e08:	be 00 34 10 00       	mov    $0x103400,%esi
  100e0d:	e9 08 ff ff ff       	jmp    100d1a <get_from+0x7e>
  100e12:	66 90                	xchg   %ax,%ax
  100e14:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100e1a:	89 d8                	mov    %ebx,%eax
  100e1c:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e1f:	5b                   	pop    %ebx
  100e20:	5e                   	pop    %esi
  100e21:	5d                   	pop    %ebp
  100e22:	c3                   	ret    
  100e23:	90                   	nop

00100e24 <get_from_block>:
  100e24:	55                   	push   %ebp
  100e25:	89 e5                	mov    %esp,%ebp
  100e27:	83 ec 10             	sub    $0x10,%esp
  100e2a:	ff 75 08             	pushl  0x8(%ebp)
  100e2d:	ff 35 00 34 10 00    	pushl  0x103400
  100e33:	e8 64 fe ff ff       	call   100c9c <get_from>
  100e38:	83 c4 10             	add    $0x10,%esp
  100e3b:	40                   	inc    %eax
  100e3c:	74 0a                	je     100e48 <get_from_block+0x24>
  100e3e:	b8 01 00 00 00       	mov    $0x1,%eax
  100e43:	c9                   	leave  
  100e44:	c3                   	ret    
  100e45:	8d 76 00             	lea    0x0(%esi),%esi
  100e48:	83 ec 08             	sub    $0x8,%esp
  100e4b:	68 fc 00 00 00       	push   $0xfc
  100e50:	68 d6 19 10 00       	push   $0x1019d6
  100e55:	e8 d2 09 00 00       	call   10182c <abort>
  100e5a:	83 c4 10             	add    $0x10,%esp
  100e5d:	b8 01 00 00 00       	mov    $0x1,%eax
  100e62:	c9                   	leave  
  100e63:	c3                   	ret    

00100e64 <check_block>:
  100e64:	8b 15 00 34 10 00    	mov    0x103400,%edx
  100e6a:	83 fa ff             	cmp    $0xffffffff,%edx
  100e6d:	0f 84 9d 00 00 00    	je     100f10 <check_block+0xac>
  100e73:	55                   	push   %ebp
  100e74:	89 e5                	mov    %esp,%ebp
  100e76:	57                   	push   %edi
  100e77:	56                   	push   %esi
  100e78:	53                   	push   %ebx
  100e79:	83 ec 0c             	sub    $0xc,%esp
  100e7c:	89 d3                	mov    %edx,%ebx
  100e7e:	eb 1e                	jmp    100e9e <check_block+0x3a>
  100e80:	89 d8                	mov    %ebx,%eax
  100e82:	c1 e0 07             	shl    $0x7,%eax
  100e85:	01 d8                	add    %ebx,%eax
  100e87:	01 c0                	add    %eax,%eax
  100e89:	01 d8                	add    %ebx,%eax
  100e8b:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100e8e:	8b 1c c5 20 5e 10 00 	mov    0x105e20(,%eax,8),%ebx
  100e95:	39 d3                	cmp    %edx,%ebx
  100e97:	74 6a                	je     100f03 <check_block+0x9f>
  100e99:	83 fa ff             	cmp    $0xffffffff,%edx
  100e9c:	74 65                	je     100f03 <check_block+0x9f>
  100e9e:	89 d8                	mov    %ebx,%eax
  100ea0:	c1 e0 07             	shl    $0x7,%eax
  100ea3:	01 d8                	add    %ebx,%eax
  100ea5:	01 c0                	add    %eax,%eax
  100ea7:	01 d8                	add    %ebx,%eax
  100ea9:	8d 34 83             	lea    (%ebx,%eax,4),%esi
  100eac:	c1 e6 03             	shl    $0x3,%esi
  100eaf:	8b be 0c 5e 10 00    	mov    0x105e0c(%esi),%edi
  100eb5:	85 ff                	test   %edi,%edi
  100eb7:	75 c7                	jne    100e80 <check_block+0x1c>
  100eb9:	8b 8e 14 5e 10 00    	mov    0x105e14(%esi),%ecx
  100ebf:	85 c9                	test   %ecx,%ecx
  100ec1:	7f bd                	jg     100e80 <check_block+0x1c>
  100ec3:	8b be 20 5e 10 00    	mov    0x105e20(%esi),%edi
  100ec9:	83 ec 0c             	sub    $0xc,%esp
  100ecc:	53                   	push   %ebx
  100ecd:	e8 52 ff ff ff       	call   100e24 <get_from_block>
  100ed2:	58                   	pop    %eax
  100ed3:	5a                   	pop    %edx
  100ed4:	81 c6 c0 5d 10 00    	add    $0x105dc0,%esi
  100eda:	56                   	push   %esi
  100edb:	53                   	push   %ebx
  100edc:	e8 af fb ff ff       	call   100a90 <put_into_runnable>
  100ee1:	89 f8                	mov    %edi,%eax
  100ee3:	c1 e0 07             	shl    $0x7,%eax
  100ee6:	01 f8                	add    %edi,%eax
  100ee8:	01 c0                	add    %eax,%eax
  100eea:	01 f8                	add    %edi,%eax
  100eec:	8d 04 87             	lea    (%edi,%eax,4),%eax
  100eef:	8b 1c c5 20 5e 10 00 	mov    0x105e20(,%eax,8),%ebx
  100ef6:	83 c4 10             	add    $0x10,%esp
  100ef9:	8b 15 00 34 10 00    	mov    0x103400,%edx
  100eff:	39 d3                	cmp    %edx,%ebx
  100f01:	75 96                	jne    100e99 <check_block+0x35>
  100f03:	b8 01 00 00 00       	mov    $0x1,%eax
  100f08:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100f0b:	5b                   	pop    %ebx
  100f0c:	5e                   	pop    %esi
  100f0d:	5f                   	pop    %edi
  100f0e:	5d                   	pop    %ebp
  100f0f:	c3                   	ret    
  100f10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100f15:	c3                   	ret    
  100f16:	66 90                	xchg   %ax,%ax

00100f18 <checkTimeCount>:
  100f18:	a1 a4 3d 10 00       	mov    0x103da4,%eax
  100f1d:	85 c0                	test   %eax,%eax
  100f1f:	0f 84 cb 00 00 00    	je     100ff0 <checkTimeCount+0xd8>
  100f25:	55                   	push   %ebp
  100f26:	89 e5                	mov    %esp,%ebp
  100f28:	57                   	push   %edi
  100f29:	56                   	push   %esi
  100f2a:	83 ec 0c             	sub    $0xc,%esp
  100f2d:	68 f8 18 10 00       	push   $0x1018f8
  100f32:	e8 81 07 00 00       	call   1016b8 <printk>
  100f37:	8b 15 a0 3d 10 00    	mov    0x103da0,%edx
  100f3d:	58                   	pop    %eax
  100f3e:	59                   	pop    %ecx
  100f3f:	89 d0                	mov    %edx,%eax
  100f41:	c1 e0 07             	shl    $0x7,%eax
  100f44:	01 d0                	add    %edx,%eax
  100f46:	01 c0                	add    %eax,%eax
  100f48:	01 d0                	add    %edx,%eax
  100f4a:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100f4d:	ff 34 c5 10 5e 10 00 	pushl  0x105e10(,%eax,8)
  100f54:	52                   	push   %edx
  100f55:	68 ec 1a 10 00       	push   $0x101aec
  100f5a:	6a 1f                	push   $0x1f
  100f5c:	68 d6 19 10 00       	push   $0x1019d6
  100f61:	68 8c 1a 10 00       	push   $0x101a8c
  100f66:	e8 4d 07 00 00       	call   1016b8 <printk>
  100f6b:	83 c4 14             	add    $0x14,%esp
  100f6e:	68 27 19 10 00       	push   $0x101927
  100f73:	e8 40 07 00 00       	call   1016b8 <printk>
  100f78:	e8 e7 fe ff ff       	call   100e64 <check_block>
  100f7d:	8b 15 a0 3d 10 00    	mov    0x103da0,%edx
  100f83:	89 d0                	mov    %edx,%eax
  100f85:	c1 e0 07             	shl    $0x7,%eax
  100f88:	01 d0                	add    %edx,%eax
  100f8a:	01 c0                	add    %eax,%eax
  100f8c:	01 d0                	add    %edx,%eax
  100f8e:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100f91:	c1 e0 03             	shl    $0x3,%eax
  100f94:	83 c4 10             	add    $0x10,%esp
  100f97:	8b b0 10 5e 10 00    	mov    0x105e10(%eax),%esi
  100f9d:	85 f6                	test   %esi,%esi
  100f9f:	7e 0f                	jle    100fb0 <checkTimeCount+0x98>
  100fa1:	b8 01 00 00 00       	mov    $0x1,%eax
  100fa6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100fa9:	5e                   	pop    %esi
  100faa:	5f                   	pop    %edi
  100fab:	5d                   	pop    %ebp
  100fac:	c3                   	ret    
  100fad:	8d 76 00             	lea    0x0(%esi),%esi
  100fb0:	05 c0 5d 10 00       	add    $0x105dc0,%eax
  100fb5:	b9 13 00 00 00       	mov    $0x13,%ecx
  100fba:	89 c7                	mov    %eax,%edi
  100fbc:	8b 75 08             	mov    0x8(%ebp),%esi
  100fbf:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100fc1:	83 ec 08             	sub    $0x8,%esp
  100fc4:	ff 75 08             	pushl  0x8(%ebp)
  100fc7:	52                   	push   %edx
  100fc8:	e8 c3 fa ff ff       	call   100a90 <put_into_runnable>
  100fcd:	e8 fe f9 ff ff       	call   1009d0 <get_from_runnable>
  100fd2:	83 c4 10             	add    $0x10,%esp
  100fd5:	3b 05 a0 3d 10 00    	cmp    0x103da0,%eax
  100fdb:	74 c4                	je     100fa1 <checkTimeCount+0x89>
  100fdd:	e8 e2 f8 ff ff       	call   1008c4 <put_into_running.part.0>
  100fe2:	b8 01 00 00 00       	mov    $0x1,%eax
  100fe7:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100fea:	5e                   	pop    %esi
  100feb:	5f                   	pop    %edi
  100fec:	5d                   	pop    %ebp
  100fed:	c3                   	ret    
  100fee:	66 90                	xchg   %ax,%ax
  100ff0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100ff5:	c3                   	ret    
  100ff6:	66 90                	xchg   %ax,%ax

00100ff8 <check_is_in>:
  100ff8:	55                   	push   %ebp
  100ff9:	89 e5                	mov    %esp,%ebp
  100ffb:	53                   	push   %ebx
  100ffc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100fff:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  101002:	85 c9                	test   %ecx,%ecx
  101004:	7e 4a                	jle    101050 <check_is_in+0x58>
  101006:	39 d9                	cmp    %ebx,%ecx
  101008:	74 3b                	je     101045 <check_is_in+0x4d>
  10100a:	89 c8                	mov    %ecx,%eax
  10100c:	c1 e0 07             	shl    $0x7,%eax
  10100f:	01 c8                	add    %ecx,%eax
  101011:	01 c0                	add    %eax,%eax
  101013:	01 c8                	add    %ecx,%eax
  101015:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  101018:	8b 14 c5 20 5e 10 00 	mov    0x105e20(,%eax,8),%edx
  10101f:	39 d1                	cmp    %edx,%ecx
  101021:	75 1e                	jne    101041 <check_is_in+0x49>
  101023:	eb 2b                	jmp    101050 <check_is_in+0x58>
  101025:	8d 76 00             	lea    0x0(%esi),%esi
  101028:	89 d0                	mov    %edx,%eax
  10102a:	c1 e0 07             	shl    $0x7,%eax
  10102d:	01 d0                	add    %edx,%eax
  10102f:	01 c0                	add    %eax,%eax
  101031:	01 d0                	add    %edx,%eax
  101033:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101036:	8b 14 c5 20 5e 10 00 	mov    0x105e20(,%eax,8),%edx
  10103d:	39 d1                	cmp    %edx,%ecx
  10103f:	74 0f                	je     101050 <check_is_in+0x58>
  101041:	39 d3                	cmp    %edx,%ebx
  101043:	75 e3                	jne    101028 <check_is_in+0x30>
  101045:	b8 01 00 00 00       	mov    $0x1,%eax
  10104a:	5b                   	pop    %ebx
  10104b:	5d                   	pop    %ebp
  10104c:	c3                   	ret    
  10104d:	8d 76 00             	lea    0x0(%esi),%esi
  101050:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101055:	5b                   	pop    %ebx
  101056:	5d                   	pop    %ebp
  101057:	c3                   	ret    

00101058 <block_decrease>:
  101058:	55                   	push   %ebp
  101059:	89 e5                	mov    %esp,%ebp
  10105b:	8b 0d 00 34 10 00    	mov    0x103400,%ecx
  101061:	83 f9 ff             	cmp    $0xffffffff,%ecx
  101064:	74 2e                	je     101094 <block_decrease+0x3c>
  101066:	89 ca                	mov    %ecx,%edx
  101068:	89 d0                	mov    %edx,%eax
  10106a:	c1 e0 07             	shl    $0x7,%eax
  10106d:	01 d0                	add    %edx,%eax
  10106f:	01 c0                	add    %eax,%eax
  101071:	01 d0                	add    %edx,%eax
  101073:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101076:	8d 04 c5 c0 3d 10 00 	lea    0x103dc0(,%eax,8),%eax
  10107d:	ff 88 54 20 00 00    	decl   0x2054(%eax)
  101083:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  101089:	39 d1                	cmp    %edx,%ecx
  10108b:	75 db                	jne    101068 <block_decrease+0x10>
  10108d:	b8 01 00 00 00       	mov    $0x1,%eax
  101092:	5d                   	pop    %ebp
  101093:	c3                   	ret    
  101094:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101099:	5d                   	pop    %ebp
  10109a:	c3                   	ret    
  10109b:	90                   	nop

0010109c <init_pcb>:
  10109c:	55                   	push   %ebp
  10109d:	89 e5                	mov    %esp,%ebp
  10109f:	c7 05 a8 3d 10 00 05 	movl   $0x5,0x103da8
  1010a6:	00 00 00 
  1010a9:	ba 18 5e 10 00       	mov    $0x105e18,%edx
  1010ae:	31 c0                	xor    %eax,%eax
  1010b0:	89 02                	mov    %eax,(%edx)
  1010b2:	8d 48 ff             	lea    -0x1(%eax),%ecx
  1010b5:	89 4a 04             	mov    %ecx,0x4(%edx)
  1010b8:	40                   	inc    %eax
  1010b9:	89 42 08             	mov    %eax,0x8(%edx)
  1010bc:	81 c2 68 20 00 00    	add    $0x2068,%edx
  1010c2:	3d 00 08 00 00       	cmp    $0x800,%eax
  1010c7:	75 e7                	jne    1010b0 <init_pcb+0x14>
  1010c9:	c7 05 1c 5e 10 00 ff 	movl   $0x7ff,0x105e1c
  1010d0:	07 00 00 
  1010d3:	c7 05 b8 7d 13 01 00 	movl   $0x0,0x1137db8
  1010da:	00 00 00 
  1010dd:	5d                   	pop    %ebp
  1010de:	c3                   	ret    
  1010df:	90                   	nop

001010e0 <init_kernel_pcb>:
  1010e0:	55                   	push   %ebp
  1010e1:	89 e5                	mov    %esp,%ebp
  1010e3:	c7 05 08 5e 10 00 10 	movl   $0x10,0x105e08
  1010ea:	00 00 00 
  1010ed:	c7 05 fc 5d 10 00 08 	movl   $0x8,0x105dfc
  1010f4:	00 00 00 
  1010f7:	c7 05 cc 5d 10 00 10 	movl   $0x10,0x105dcc
  1010fe:	00 00 00 
  101101:	c7 05 c8 5d 10 00 10 	movl   $0x10,0x105dc8
  101108:	00 00 00 
  10110b:	c7 05 f8 5d 10 00 bc 	movl   $0x1008bc,0x105df8
  101112:	08 10 00 
  101115:	c7 05 04 5e 10 00 00 	movl   $0x400000,0x105e04
  10111c:	00 40 00 
  10111f:	c7 05 0c 5e 10 00 01 	movl   $0x1,0x105e0c
  101126:	00 00 00 
  101129:	c7 05 10 5e 10 00 04 	movl   $0x4,0x105e10
  101130:	00 00 00 
  101133:	b8 01 00 00 00       	mov    $0x1,%eax
  101138:	5d                   	pop    %ebp
  101139:	c3                   	ret    
  10113a:	66 90                	xchg   %ax,%ax

0010113c <transfer_pid_state>:
  10113c:	55                   	push   %ebp
  10113d:	89 e5                	mov    %esp,%ebp
  10113f:	b8 01 00 00 00       	mov    $0x1,%eax
  101144:	5d                   	pop    %ebp
  101145:	c3                   	ret    
  101146:	66 90                	xchg   %ax,%ax

00101148 <make_pcb>:
  101148:	55                   	push   %ebp
  101149:	89 e5                	mov    %esp,%ebp
  10114b:	57                   	push   %edi
  10114c:	56                   	push   %esi
  10114d:	8b 55 08             	mov    0x8(%ebp),%edx
  101150:	89 d0                	mov    %edx,%eax
  101152:	c1 e0 07             	shl    $0x7,%eax
  101155:	01 d0                	add    %edx,%eax
  101157:	01 c0                	add    %eax,%eax
  101159:	01 d0                	add    %edx,%eax
  10115b:	8d 14 82             	lea    (%edx,%eax,4),%edx
  10115e:	c1 e2 03             	shl    $0x3,%edx
  101161:	8d 82 c0 5d 10 00    	lea    0x105dc0(%edx),%eax
  101167:	b9 13 00 00 00       	mov    $0x13,%ecx
  10116c:	89 c7                	mov    %eax,%edi
  10116e:	8b 75 0c             	mov    0xc(%ebp),%esi
  101171:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101173:	8b 45 10             	mov    0x10(%ebp),%eax
  101176:	89 82 0c 5e 10 00    	mov    %eax,0x105e0c(%edx)
  10117c:	8b 45 14             	mov    0x14(%ebp),%eax
  10117f:	89 82 10 5e 10 00    	mov    %eax,0x105e10(%edx)
  101185:	8b 45 18             	mov    0x18(%ebp),%eax
  101188:	89 82 14 5e 10 00    	mov    %eax,0x105e14(%edx)
  10118e:	8b 45 0c             	mov    0xc(%ebp),%eax
  101191:	89 82 24 5e 10 00    	mov    %eax,0x105e24(%edx)
  101197:	b8 01 00 00 00       	mov    $0x1,%eax
  10119c:	5e                   	pop    %esi
  10119d:	5f                   	pop    %edi
  10119e:	5d                   	pop    %ebp
  10119f:	c3                   	ret    

001011a0 <initIdt>:
  1011a0:	55                   	push   %ebp
  1011a1:	89 e5                	mov    %esp,%ebp
  1011a3:	53                   	push   %ebx
  1011a4:	ba c3 18 10 00       	mov    $0x1018c3,%edx
  1011a9:	89 d3                	mov    %edx,%ebx
  1011ab:	c1 ea 10             	shr    $0x10,%edx
  1011ae:	b9 a0 86 13 01       	mov    $0x11386a0,%ecx
  1011b3:	b8 a0 7e 13 01       	mov    $0x1137ea0,%eax
  1011b8:	66 89 18             	mov    %bx,(%eax)
  1011bb:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  1011c1:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  1011c5:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  1011c9:	66 89 50 06          	mov    %dx,0x6(%eax)
  1011cd:	83 c0 08             	add    $0x8,%eax
  1011d0:	39 c1                	cmp    %eax,%ecx
  1011d2:	75 e4                	jne    1011b8 <initIdt+0x18>
  1011d4:	b8 c9 18 10 00       	mov    $0x1018c9,%eax
  1011d9:	66 a3 08 7f 13 01    	mov    %ax,0x1137f08
  1011df:	66 c7 05 0a 7f 13 01 	movw   $0x8,0x1137f0a
  1011e6:	08 00 
  1011e8:	c6 05 0c 7f 13 01 00 	movb   $0x0,0x1137f0c
  1011ef:	c6 05 0d 7f 13 01 8f 	movb   $0x8f,0x1137f0d
  1011f6:	c1 e8 10             	shr    $0x10,%eax
  1011f9:	66 a3 0e 7f 13 01    	mov    %ax,0x1137f0e
  1011ff:	b8 cd 18 10 00       	mov    $0x1018cd,%eax
  101204:	66 a3 a0 82 13 01    	mov    %ax,0x11382a0
  10120a:	66 c7 05 a2 82 13 01 	movw   $0x8,0x11382a2
  101211:	08 00 
  101213:	c6 05 a4 82 13 01 00 	movb   $0x0,0x11382a4
  10121a:	c6 05 a5 82 13 01 ee 	movb   $0xee,0x11382a5
  101221:	c1 e8 10             	shr    $0x10,%eax
  101224:	66 a3 a6 82 13 01    	mov    %ax,0x11382a6
  10122a:	b8 d6 18 10 00       	mov    $0x1018d6,%eax
  10122f:	66 a3 a0 7f 13 01    	mov    %ax,0x1137fa0
  101235:	66 c7 05 a2 7f 13 01 	movw   $0x8,0x1137fa2
  10123c:	08 00 
  10123e:	c6 05 a4 7f 13 01 00 	movb   $0x0,0x1137fa4
  101245:	c6 05 a5 7f 13 01 8e 	movb   $0x8e,0x1137fa5
  10124c:	c1 e8 10             	shr    $0x10,%eax
  10124f:	66 a3 a6 7f 13 01    	mov    %ax,0x1137fa6
  101255:	66 c7 05 30 35 10 00 	movw   $0x7ff,0x103530
  10125c:	ff 07 
  10125e:	b8 a0 7e 13 01       	mov    $0x1137ea0,%eax
  101263:	66 a3 32 35 10 00    	mov    %ax,0x103532
  101269:	c1 e8 10             	shr    $0x10,%eax
  10126c:	66 a3 34 35 10 00    	mov    %ax,0x103534
  101272:	b8 30 35 10 00       	mov    $0x103530,%eax
  101277:	0f 01 18             	lidtl  (%eax)
  10127a:	5b                   	pop    %ebx
  10127b:	5d                   	pop    %ebp
  10127c:	c3                   	ret    
  10127d:	66 90                	xchg   %ax,%ax
  10127f:	90                   	nop

00101280 <syscallHandle>:
  101280:	55                   	push   %ebp
  101281:	89 e5                	mov    %esp,%ebp
  101283:	53                   	push   %ebx
  101284:	50                   	push   %eax
  101285:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101288:	8b 43 2c             	mov    0x2c(%ebx),%eax
  10128b:	83 f8 04             	cmp    $0x4,%eax
  10128e:	74 58                	je     1012e8 <syscallHandle+0x68>
  101290:	77 1e                	ja     1012b0 <syscallHandle+0x30>
  101292:	83 f8 01             	cmp    $0x1,%eax
  101295:	74 45                	je     1012dc <syscallHandle+0x5c>
  101297:	83 f8 02             	cmp    $0x2,%eax
  10129a:	75 0f                	jne    1012ab <syscallHandle+0x2b>
  10129c:	83 ec 0c             	sub    $0xc,%esp
  10129f:	53                   	push   %ebx
  1012a0:	e8 b7 f3 ff ff       	call   10065c <sys_fork>
  1012a5:	89 43 2c             	mov    %eax,0x2c(%ebx)
  1012a8:	83 c4 10             	add    $0x10,%esp
  1012ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012ae:	c9                   	leave  
  1012af:	c3                   	ret    
  1012b0:	83 f8 07             	cmp    $0x7,%eax
  1012b3:	74 13                	je     1012c8 <syscallHandle+0x48>
  1012b5:	3d e6 00 00 00       	cmp    $0xe6,%eax
  1012ba:	75 ef                	jne    1012ab <syscallHandle+0x2b>
  1012bc:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1012bf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012c2:	c9                   	leave  
  1012c3:	e9 10 f3 ff ff       	jmp    1005d8 <sys_sleep>
  1012c8:	83 ec 0c             	sub    $0xc,%esp
  1012cb:	53                   	push   %ebx
  1012cc:	e8 fb f2 ff ff       	call   1005cc <sys_getpid>
  1012d1:	89 43 2c             	mov    %eax,0x2c(%ebx)
  1012d4:	83 c4 10             	add    $0x10,%esp
  1012d7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012da:	c9                   	leave  
  1012db:	c3                   	ret    
  1012dc:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1012df:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012e2:	c9                   	leave  
  1012e3:	e9 bc f2 ff ff       	jmp    1005a4 <sys_exit>
  1012e8:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1012eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012ee:	c9                   	leave  
  1012ef:	e9 14 f5 ff ff       	jmp    100808 <sys_write>

001012f4 <GProtectFaultHandle>:
  1012f4:	55                   	push   %ebp
  1012f5:	89 e5                	mov    %esp,%ebp
  1012f7:	83 ec 14             	sub    $0x14,%esp
  1012fa:	68 f8 18 10 00       	push   $0x1018f8
  1012ff:	e8 b4 03 00 00       	call   1016b8 <printk>
  101304:	58                   	pop    %eax
  101305:	8b 45 08             	mov    0x8(%ebp),%eax
  101308:	ff 70 30             	pushl  0x30(%eax)
  10130b:	68 80 1b 10 00       	push   $0x101b80
  101310:	6a 6b                	push   $0x6b
  101312:	68 0d 1b 10 00       	push   $0x101b0d
  101317:	68 20 1b 10 00       	push   $0x101b20
  10131c:	e8 97 03 00 00       	call   1016b8 <printk>
  101321:	83 c4 14             	add    $0x14,%esp
  101324:	68 27 19 10 00       	push   $0x101927
  101329:	e8 8a 03 00 00       	call   1016b8 <printk>
  10132e:	5a                   	pop    %edx
  10132f:	59                   	pop    %ecx
  101330:	6a 6c                	push   $0x6c
  101332:	68 0d 1b 10 00       	push   $0x101b0d
  101337:	e8 f0 04 00 00       	call   10182c <abort>
  10133c:	83 c4 10             	add    $0x10,%esp
  10133f:	c9                   	leave  
  101340:	c3                   	ret    
  101341:	8d 76 00             	lea    0x0(%esi),%esi

00101344 <timeHandle>:
  101344:	55                   	push   %ebp
  101345:	89 e5                	mov    %esp,%ebp
  101347:	53                   	push   %ebx
  101348:	83 ec 10             	sub    $0x10,%esp
  10134b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10134e:	6a 41                	push   $0x41
  101350:	e8 4b f5 ff ff       	call   1008a0 <putChar>
  101355:	e8 46 f6 ff ff       	call   1009a0 <getpid>
  10135a:	89 c2                	mov    %eax,%edx
  10135c:	c1 e2 07             	shl    $0x7,%edx
  10135f:	01 c2                	add    %eax,%edx
  101361:	01 d2                	add    %edx,%edx
  101363:	01 c2                	add    %eax,%edx
  101365:	8d 04 90             	lea    (%eax,%edx,4),%eax
  101368:	ff 0c c5 10 5e 10 00 	decl   0x105e10(,%eax,8)
  10136f:	e8 e4 fc ff ff       	call   101058 <block_decrease>
  101374:	89 1c 24             	mov    %ebx,(%esp)
  101377:	e8 9c fb ff ff       	call   100f18 <checkTimeCount>
  10137c:	83 c4 10             	add    $0x10,%esp
  10137f:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  101386:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101389:	c9                   	leave  
  10138a:	e9 11 f5 ff ff       	jmp    1008a0 <putChar>
  10138f:	90                   	nop

00101390 <irqHandle>:
  101390:	55                   	push   %ebp
  101391:	89 e5                	mov    %esp,%ebp
  101393:	57                   	push   %edi
  101394:	56                   	push   %esi
  101395:	53                   	push   %ebx
  101396:	83 ec 0c             	sub    $0xc,%esp
  101399:	8b 7d 08             	mov    0x8(%ebp),%edi
  10139c:	b8 10 00 00 00       	mov    $0x10,%eax
  1013a1:	89 c0                	mov    %eax,%eax
  1013a3:	8e d8                	mov    %eax,%ds
  1013a5:	8e e0                	mov    %eax,%fs
  1013a7:	8e c0                	mov    %eax,%es
  1013a9:	b8 30 00 00 00       	mov    $0x30,%eax
  1013ae:	89 c0                	mov    %eax,%eax
  1013b0:	8e e8                	mov    %eax,%gs
  1013b2:	89 ee                	mov    %ebp,%esi
  1013b4:	3b 7e 08             	cmp    0x8(%esi),%edi
  1013b7:	74 12                	je     1013cb <irqHandle+0x3b>
  1013b9:	83 ec 08             	sub    $0x8,%esp
  1013bc:	6a 20                	push   $0x20
  1013be:	68 0d 1b 10 00       	push   $0x101b0d
  1013c3:	e8 64 04 00 00       	call   10182c <abort>
  1013c8:	83 c4 10             	add    $0x10,%esp
  1013cb:	8b 1d a0 3d 10 00    	mov    0x103da0,%ebx
  1013d1:	fa                   	cli    
  1013d2:	8b 47 30             	mov    0x30(%edi),%eax
  1013d5:	83 f8 0d             	cmp    $0xd,%eax
  1013d8:	0f 84 46 01 00 00    	je     101524 <irqHandle+0x194>
  1013de:	0f 8e e8 00 00 00    	jle    1014cc <irqHandle+0x13c>
  1013e4:	83 f8 20             	cmp    $0x20,%eax
  1013e7:	74 2f                	je     101418 <irqHandle+0x88>
  1013e9:	83 c0 80             	add    $0xffffff80,%eax
  1013ec:	0f 85 e1 00 00 00    	jne    1014d3 <irqHandle+0x143>
  1013f2:	83 ec 0c             	sub    $0xc,%esp
  1013f5:	57                   	push   %edi
  1013f6:	e8 85 fe ff ff       	call   101280 <syscallHandle>
  1013fb:	8b 47 30             	mov    0x30(%edi),%eax
  1013fe:	83 c4 10             	add    $0x10,%esp
  101401:	3d 80 00 00 00       	cmp    $0x80,%eax
  101406:	74 28                	je     101430 <irqHandle+0xa0>
  101408:	83 f8 20             	cmp    $0x20,%eax
  10140b:	74 23                	je     101430 <irqHandle+0xa0>
  10140d:	fb                   	sti    
  10140e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101411:	5b                   	pop    %ebx
  101412:	5e                   	pop    %esi
  101413:	5f                   	pop    %edi
  101414:	5d                   	pop    %ebp
  101415:	c3                   	ret    
  101416:	66 90                	xchg   %ax,%ax
  101418:	83 ec 0c             	sub    $0xc,%esp
  10141b:	57                   	push   %edi
  10141c:	e8 23 ff ff ff       	call   101344 <timeHandle>
  101421:	8b 47 30             	mov    0x30(%edi),%eax
  101424:	83 c4 10             	add    $0x10,%esp
  101427:	3d 80 00 00 00       	cmp    $0x80,%eax
  10142c:	75 da                	jne    101408 <irqHandle+0x78>
  10142e:	66 90                	xchg   %ax,%ax
  101430:	8b 15 a0 3d 10 00    	mov    0x103da0,%edx
  101436:	39 d3                	cmp    %edx,%ebx
  101438:	74 d3                	je     10140d <irqHandle+0x7d>
  10143a:	89 d0                	mov    %edx,%eax
  10143c:	c1 e0 07             	shl    $0x7,%eax
  10143f:	01 d0                	add    %edx,%eax
  101441:	01 c0                	add    %eax,%eax
  101443:	01 d0                	add    %edx,%eax
  101445:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101448:	8d 04 c5 70 5d 10 00 	lea    0x105d70(,%eax,8),%eax
  10144f:	89 46 08             	mov    %eax,0x8(%esi)
  101452:	8b 0d a0 3d 10 00    	mov    0x103da0,%ecx
  101458:	89 ca                	mov    %ecx,%edx
  10145a:	c1 e2 07             	shl    $0x7,%edx
  10145d:	01 ca                	add    %ecx,%edx
  10145f:	01 d2                	add    %edx,%edx
  101461:	01 ca                	add    %ecx,%edx
  101463:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  101466:	8d 34 d5 c0 5d 10 00 	lea    0x105dc0(,%edx,8),%esi
  10146d:	b9 13 00 00 00       	mov    $0x13,%ecx
  101472:	89 c7                	mov    %eax,%edi
  101474:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101476:	83 ec 0c             	sub    $0xc,%esp
  101479:	68 f8 18 10 00       	push   $0x1018f8
  10147e:	e8 35 02 00 00       	call   1016b8 <printk>
  101483:	58                   	pop    %eax
  101484:	5a                   	pop    %edx
  101485:	ff 35 a0 3d 10 00    	pushl  0x103da0
  10148b:	53                   	push   %ebx
  10148c:	68 94 1b 10 00       	push   $0x101b94
  101491:	6a 42                	push   $0x42
  101493:	68 0d 1b 10 00       	push   $0x101b0d
  101498:	68 60 1b 10 00       	push   $0x101b60
  10149d:	e8 16 02 00 00       	call   1016b8 <printk>
  1014a2:	83 c4 14             	add    $0x14,%esp
  1014a5:	68 27 19 10 00       	push   $0x101927
  1014aa:	e8 09 02 00 00       	call   1016b8 <printk>
  1014af:	59                   	pop    %ecx
  1014b0:	5b                   	pop    %ebx
  1014b1:	a1 a0 3d 10 00       	mov    0x103da0,%eax
  1014b6:	c1 e0 10             	shl    $0x10,%eax
  1014b9:	50                   	push   %eax
  1014ba:	6a 23                	push   $0x23
  1014bc:	e8 73 eb ff ff       	call   100034 <change_gdt>
  1014c1:	83 c4 10             	add    $0x10,%esp
  1014c4:	e9 44 ff ff ff       	jmp    10140d <irqHandle+0x7d>
  1014c9:	8d 76 00             	lea    0x0(%esi),%esi
  1014cc:	40                   	inc    %eax
  1014cd:	0f 84 3a ff ff ff    	je     10140d <irqHandle+0x7d>
  1014d3:	83 ec 0c             	sub    $0xc,%esp
  1014d6:	68 f8 18 10 00       	push   $0x1018f8
  1014db:	e8 d8 01 00 00       	call   1016b8 <printk>
  1014e0:	58                   	pop    %eax
  1014e1:	5a                   	pop    %edx
  1014e2:	ff 77 38             	pushl  0x38(%edi)
  1014e5:	ff 77 30             	pushl  0x30(%edi)
  1014e8:	68 94 1b 10 00       	push   $0x101b94
  1014ed:	6a 36                	push   $0x36
  1014ef:	68 0d 1b 10 00       	push   $0x101b0d
  1014f4:	68 38 1b 10 00       	push   $0x101b38
  1014f9:	e8 ba 01 00 00       	call   1016b8 <printk>
  1014fe:	83 c4 14             	add    $0x14,%esp
  101501:	68 27 19 10 00       	push   $0x101927
  101506:	e8 ad 01 00 00       	call   1016b8 <printk>
  10150b:	59                   	pop    %ecx
  10150c:	58                   	pop    %eax
  10150d:	6a 37                	push   $0x37
  10150f:	68 0d 1b 10 00       	push   $0x101b0d
  101514:	e8 13 03 00 00       	call   10182c <abort>
  101519:	8b 47 30             	mov    0x30(%edi),%eax
  10151c:	83 c4 10             	add    $0x10,%esp
  10151f:	e9 dd fe ff ff       	jmp    101401 <irqHandle+0x71>
  101524:	83 ec 0c             	sub    $0xc,%esp
  101527:	57                   	push   %edi
  101528:	e8 c7 fd ff ff       	call   1012f4 <GProtectFaultHandle>
  10152d:	8b 47 30             	mov    0x30(%edi),%eax
  101530:	83 c4 10             	add    $0x10,%esp
  101533:	e9 c9 fe ff ff       	jmp    101401 <irqHandle+0x71>

00101538 <initIntr>:
  101538:	55                   	push   %ebp
  101539:	89 e5                	mov    %esp,%ebp
  10153b:	ba 21 00 00 00       	mov    $0x21,%edx
  101540:	b0 ff                	mov    $0xff,%al
  101542:	ee                   	out    %al,(%dx)
  101543:	ba a1 00 00 00       	mov    $0xa1,%edx
  101548:	ee                   	out    %al,(%dx)
  101549:	ba 20 00 00 00       	mov    $0x20,%edx
  10154e:	b0 11                	mov    $0x11,%al
  101550:	ee                   	out    %al,(%dx)
  101551:	ba 21 00 00 00       	mov    $0x21,%edx
  101556:	b0 20                	mov    $0x20,%al
  101558:	ee                   	out    %al,(%dx)
  101559:	b0 04                	mov    $0x4,%al
  10155b:	ee                   	out    %al,(%dx)
  10155c:	b0 03                	mov    $0x3,%al
  10155e:	ee                   	out    %al,(%dx)
  10155f:	ba a0 00 00 00       	mov    $0xa0,%edx
  101564:	b0 11                	mov    $0x11,%al
  101566:	ee                   	out    %al,(%dx)
  101567:	ba a1 00 00 00       	mov    $0xa1,%edx
  10156c:	b0 28                	mov    $0x28,%al
  10156e:	ee                   	out    %al,(%dx)
  10156f:	b0 02                	mov    $0x2,%al
  101571:	ee                   	out    %al,(%dx)
  101572:	b0 03                	mov    $0x3,%al
  101574:	ee                   	out    %al,(%dx)
  101575:	ba 20 00 00 00       	mov    $0x20,%edx
  10157a:	b0 68                	mov    $0x68,%al
  10157c:	ee                   	out    %al,(%dx)
  10157d:	b0 0a                	mov    $0xa,%al
  10157f:	ee                   	out    %al,(%dx)
  101580:	ba a0 00 00 00       	mov    $0xa0,%edx
  101585:	b0 68                	mov    $0x68,%al
  101587:	ee                   	out    %al,(%dx)
  101588:	b0 0a                	mov    $0xa,%al
  10158a:	ee                   	out    %al,(%dx)
  10158b:	5d                   	pop    %ebp
  10158c:	c3                   	ret    
  10158d:	8d 76 00             	lea    0x0(%esi),%esi

00101590 <initTimer>:
  101590:	55                   	push   %ebp
  101591:	89 e5                	mov    %esp,%ebp
  101593:	ba 43 00 00 00       	mov    $0x43,%edx
  101598:	b0 34                	mov    $0x34,%al
  10159a:	ee                   	out    %al,(%dx)
  10159b:	ba 40 00 00 00       	mov    $0x40,%edx
  1015a0:	b0 9b                	mov    $0x9b,%al
  1015a2:	ee                   	out    %al,(%dx)
  1015a3:	b0 2e                	mov    $0x2e,%al
  1015a5:	ee                   	out    %al,(%dx)
  1015a6:	5d                   	pop    %ebp
  1015a7:	c3                   	ret    

001015a8 <i2A>:
  1015a8:	55                   	push   %ebp
  1015a9:	89 e5                	mov    %esp,%ebp
  1015ab:	57                   	push   %edi
  1015ac:	56                   	push   %esi
  1015ad:	53                   	push   %ebx
  1015ae:	51                   	push   %ecx
  1015af:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1015b2:	85 c9                	test   %ecx,%ecx
  1015b4:	78 6e                	js     101624 <i2A+0x7c>
  1015b6:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  1015ba:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  1015be:	bb 7e 35 10 00       	mov    $0x10357e,%ebx
  1015c3:	31 ff                	xor    %edi,%edi
  1015c5:	eb 03                	jmp    1015ca <i2A+0x22>
  1015c7:	90                   	nop
  1015c8:	89 f7                	mov    %esi,%edi
  1015ca:	4b                   	dec    %ebx
  1015cb:	89 c8                	mov    %ecx,%eax
  1015cd:	be 0a 00 00 00       	mov    $0xa,%esi
  1015d2:	99                   	cltd   
  1015d3:	f7 fe                	idiv   %esi
  1015d5:	83 c2 30             	add    $0x30,%edx
  1015d8:	88 13                	mov    %dl,(%ebx)
  1015da:	8d 77 01             	lea    0x1(%edi),%esi
  1015dd:	b8 67 66 66 66       	mov    $0x66666667,%eax
  1015e2:	f7 e9                	imul   %ecx
  1015e4:	89 d0                	mov    %edx,%eax
  1015e6:	c1 f8 02             	sar    $0x2,%eax
  1015e9:	c1 f9 1f             	sar    $0x1f,%ecx
  1015ec:	29 c8                	sub    %ecx,%eax
  1015ee:	89 c1                	mov    %eax,%ecx
  1015f0:	75 d6                	jne    1015c8 <i2A+0x20>
  1015f2:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  1015f6:	74 20                	je     101618 <i2A+0x70>
  1015f8:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  1015fc:	75 06                	jne    101604 <i2A+0x5c>
  1015fe:	fe 05 7d 35 10 00    	incb   0x10357d
  101604:	c6 05 7e 35 10 00 00 	movb   $0x0,0x10357e
  10160b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10160e:	89 18                	mov    %ebx,(%eax)
  101610:	89 f0                	mov    %esi,%eax
  101612:	5a                   	pop    %edx
  101613:	5b                   	pop    %ebx
  101614:	5e                   	pop    %esi
  101615:	5f                   	pop    %edi
  101616:	5d                   	pop    %ebp
  101617:	c3                   	ret    
  101618:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  10161c:	8d 77 02             	lea    0x2(%edi),%esi
  10161f:	4b                   	dec    %ebx
  101620:	eb d6                	jmp    1015f8 <i2A+0x50>
  101622:	66 90                	xchg   %ax,%ax
  101624:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  10162a:	74 0c                	je     101638 <i2A+0x90>
  10162c:	f7 d9                	neg    %ecx
  10162e:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  101632:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  101636:	eb 86                	jmp    1015be <i2A+0x16>
  101638:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  10163d:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101641:	eb ef                	jmp    101632 <i2A+0x8a>
  101643:	90                   	nop

00101644 <i2X>:
  101644:	55                   	push   %ebp
  101645:	89 e5                	mov    %esp,%ebp
  101647:	57                   	push   %edi
  101648:	56                   	push   %esi
  101649:	53                   	push   %ebx
  10164a:	8b 55 08             	mov    0x8(%ebp),%edx
  10164d:	b9 5d 35 10 00       	mov    $0x10355d,%ecx
  101652:	31 c0                	xor    %eax,%eax
  101654:	40                   	inc    %eax
  101655:	89 d6                	mov    %edx,%esi
  101657:	83 e6 0f             	and    $0xf,%esi
  10165a:	8d 5e f6             	lea    -0xa(%esi),%ebx
  10165d:	89 cf                	mov    %ecx,%edi
  10165f:	83 fb 05             	cmp    $0x5,%ebx
  101662:	77 4c                	ja     1016b0 <i2X+0x6c>
  101664:	ff 24 9d a0 1b 10 00 	jmp    *0x101ba0(,%ebx,4)
  10166b:	90                   	nop
  10166c:	c6 01 65             	movb   $0x65,(%ecx)
  10166f:	90                   	nop
  101670:	49                   	dec    %ecx
  101671:	c1 ea 04             	shr    $0x4,%edx
  101674:	75 de                	jne    101654 <i2X+0x10>
  101676:	c6 05 5e 35 10 00 00 	movb   $0x0,0x10355e
  10167d:	8b 55 0c             	mov    0xc(%ebp),%edx
  101680:	89 3a                	mov    %edi,(%edx)
  101682:	5b                   	pop    %ebx
  101683:	5e                   	pop    %esi
  101684:	5f                   	pop    %edi
  101685:	5d                   	pop    %ebp
  101686:	c3                   	ret    
  101687:	90                   	nop
  101688:	c6 01 64             	movb   $0x64,(%ecx)
  10168b:	eb e3                	jmp    101670 <i2X+0x2c>
  10168d:	8d 76 00             	lea    0x0(%esi),%esi
  101690:	c6 01 63             	movb   $0x63,(%ecx)
  101693:	eb db                	jmp    101670 <i2X+0x2c>
  101695:	8d 76 00             	lea    0x0(%esi),%esi
  101698:	c6 01 62             	movb   $0x62,(%ecx)
  10169b:	eb d3                	jmp    101670 <i2X+0x2c>
  10169d:	8d 76 00             	lea    0x0(%esi),%esi
  1016a0:	c6 01 61             	movb   $0x61,(%ecx)
  1016a3:	eb cb                	jmp    101670 <i2X+0x2c>
  1016a5:	8d 76 00             	lea    0x0(%esi),%esi
  1016a8:	c6 01 66             	movb   $0x66,(%ecx)
  1016ab:	eb c3                	jmp    101670 <i2X+0x2c>
  1016ad:	8d 76 00             	lea    0x0(%esi),%esi
  1016b0:	8d 5e 30             	lea    0x30(%esi),%ebx
  1016b3:	88 19                	mov    %bl,(%ecx)
  1016b5:	eb b9                	jmp    101670 <i2X+0x2c>
  1016b7:	90                   	nop

001016b8 <printk>:
  1016b8:	55                   	push   %ebp
  1016b9:	89 e5                	mov    %esp,%ebp
  1016bb:	57                   	push   %edi
  1016bc:	56                   	push   %esi
  1016bd:	53                   	push   %ebx
  1016be:	83 ec 2c             	sub    $0x2c,%esp
  1016c1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1016c4:	8a 11                	mov    (%ecx),%dl
  1016c6:	84 d2                	test   %dl,%dl
  1016c8:	0f 84 54 01 00 00    	je     101822 <printk+0x16a>
  1016ce:	8d 45 0c             	lea    0xc(%ebp),%eax
  1016d1:	31 ff                	xor    %edi,%edi
  1016d3:	eb 18                	jmp    1016ed <printk+0x35>
  1016d5:	8d 76 00             	lea    0x0(%esi),%esi
  1016d8:	8a 11                	mov    (%ecx),%dl
  1016da:	89 cb                	mov    %ecx,%ebx
  1016dc:	88 97 80 35 10 00    	mov    %dl,0x103580(%edi)
  1016e2:	47                   	inc    %edi
  1016e3:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1016e6:	8a 53 01             	mov    0x1(%ebx),%dl
  1016e9:	84 d2                	test   %dl,%dl
  1016eb:	74 72                	je     10175f <printk+0xa7>
  1016ed:	80 fa 25             	cmp    $0x25,%dl
  1016f0:	75 e6                	jne    1016d8 <printk+0x20>
  1016f2:	8d 59 01             	lea    0x1(%ecx),%ebx
  1016f5:	8a 51 01             	mov    0x1(%ecx),%dl
  1016f8:	80 fa 64             	cmp    $0x64,%dl
  1016fb:	0f 84 bf 00 00 00    	je     1017c0 <printk+0x108>
  101701:	0f 8e 01 01 00 00    	jle    101808 <printk+0x150>
  101707:	80 fa 73             	cmp    $0x73,%dl
  10170a:	0f 84 84 00 00 00    	je     101794 <printk+0xdc>
  101710:	80 fa 78             	cmp    $0x78,%dl
  101713:	75 c7                	jne    1016dc <printk+0x24>
  101715:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10171c:	8d 70 04             	lea    0x4(%eax),%esi
  10171f:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101722:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101725:	56                   	push   %esi
  101726:	ff 30                	pushl  (%eax)
  101728:	e8 17 ff ff ff       	call   101644 <i2X>
  10172d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  101730:	8d b7 80 35 10 00    	lea    0x103580(%edi),%esi
  101736:	8a 11                	mov    (%ecx),%dl
  101738:	83 c4 08             	add    $0x8,%esp
  10173b:	31 c0                	xor    %eax,%eax
  10173d:	84 d2                	test   %dl,%dl
  10173f:	74 0f                	je     101750 <printk+0x98>
  101741:	8d 76 00             	lea    0x0(%esi),%esi
  101744:	40                   	inc    %eax
  101745:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101749:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  10174c:	84 d2                	test   %dl,%dl
  10174e:	75 f4                	jne    101744 <printk+0x8c>
  101750:	01 c7                	add    %eax,%edi
  101752:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101755:	8d 4b 01             	lea    0x1(%ebx),%ecx
  101758:	8a 53 01             	mov    0x1(%ebx),%dl
  10175b:	84 d2                	test   %dl,%dl
  10175d:	75 8e                	jne    1016ed <printk+0x35>
  10175f:	c6 87 80 35 10 00 00 	movb   $0x0,0x103580(%edi)
  101766:	0f be 05 80 35 10 00 	movsbl 0x103580,%eax
  10176d:	bb 80 35 10 00       	mov    $0x103580,%ebx
  101772:	84 c0                	test   %al,%al
  101774:	74 16                	je     10178c <printk+0xd4>
  101776:	66 90                	xchg   %ax,%ax
  101778:	83 ec 0c             	sub    $0xc,%esp
  10177b:	50                   	push   %eax
  10177c:	e8 1f f1 ff ff       	call   1008a0 <putChar>
  101781:	43                   	inc    %ebx
  101782:	0f be 03             	movsbl (%ebx),%eax
  101785:	83 c4 10             	add    $0x10,%esp
  101788:	84 c0                	test   %al,%al
  10178a:	75 ec                	jne    101778 <printk+0xc0>
  10178c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10178f:	5b                   	pop    %ebx
  101790:	5e                   	pop    %esi
  101791:	5f                   	pop    %edi
  101792:	5d                   	pop    %ebp
  101793:	c3                   	ret    
  101794:	8d 70 04             	lea    0x4(%eax),%esi
  101797:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10179a:	8b 08                	mov    (%eax),%ecx
  10179c:	8d b7 80 35 10 00    	lea    0x103580(%edi),%esi
  1017a2:	8a 11                	mov    (%ecx),%dl
  1017a4:	31 c0                	xor    %eax,%eax
  1017a6:	84 d2                	test   %dl,%dl
  1017a8:	74 a6                	je     101750 <printk+0x98>
  1017aa:	66 90                	xchg   %ax,%ax
  1017ac:	40                   	inc    %eax
  1017ad:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1017b1:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  1017b4:	84 d2                	test   %dl,%dl
  1017b6:	75 f4                	jne    1017ac <printk+0xf4>
  1017b8:	01 c7                	add    %eax,%edi
  1017ba:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1017bd:	eb 96                	jmp    101755 <printk+0x9d>
  1017bf:	90                   	nop
  1017c0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1017c7:	8d 70 04             	lea    0x4(%eax),%esi
  1017ca:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1017cd:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  1017d0:	56                   	push   %esi
  1017d1:	ff 30                	pushl  (%eax)
  1017d3:	e8 d0 fd ff ff       	call   1015a8 <i2A>
  1017d8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1017db:	8d b7 80 35 10 00    	lea    0x103580(%edi),%esi
  1017e1:	8a 11                	mov    (%ecx),%dl
  1017e3:	83 c4 08             	add    $0x8,%esp
  1017e6:	31 c0                	xor    %eax,%eax
  1017e8:	84 d2                	test   %dl,%dl
  1017ea:	0f 84 60 ff ff ff    	je     101750 <printk+0x98>
  1017f0:	40                   	inc    %eax
  1017f1:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1017f5:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  1017f8:	84 d2                	test   %dl,%dl
  1017fa:	75 f4                	jne    1017f0 <printk+0x138>
  1017fc:	01 c7                	add    %eax,%edi
  1017fe:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101801:	e9 4f ff ff ff       	jmp    101755 <printk+0x9d>
  101806:	66 90                	xchg   %ax,%ax
  101808:	80 fa 63             	cmp    $0x63,%dl
  10180b:	0f 85 cb fe ff ff    	jne    1016dc <printk+0x24>
  101811:	8b 10                	mov    (%eax),%edx
  101813:	88 97 80 35 10 00    	mov    %dl,0x103580(%edi)
  101819:	83 c0 04             	add    $0x4,%eax
  10181c:	47                   	inc    %edi
  10181d:	e9 c1 fe ff ff       	jmp    1016e3 <printk+0x2b>
  101822:	31 ff                	xor    %edi,%edi
  101824:	e9 36 ff ff ff       	jmp    10175f <printk+0xa7>
  101829:	66 90                	xchg   %ax,%ax
  10182b:	90                   	nop

0010182c <abort>:
  10182c:	55                   	push   %ebp
  10182d:	89 e5                	mov    %esp,%ebp
  10182f:	57                   	push   %edi
  101830:	56                   	push   %esi
  101831:	53                   	push   %ebx
  101832:	83 ec 1c             	sub    $0x1c,%esp
  101835:	8b 55 08             	mov    0x8(%ebp),%edx
  101838:	fa                   	cli    
  101839:	8a 02                	mov    (%edx),%al
  10183b:	b9 32 34 10 00       	mov    $0x103432,%ecx
  101840:	84 c0                	test   %al,%al
  101842:	74 0b                	je     10184f <abort+0x23>
  101844:	41                   	inc    %ecx
  101845:	42                   	inc    %edx
  101846:	88 41 ff             	mov    %al,-0x1(%ecx)
  101849:	8a 02                	mov    (%edx),%al
  10184b:	84 c0                	test   %al,%al
  10184d:	75 f5                	jne    101844 <abort+0x18>
  10184f:	c6 01 3a             	movb   $0x3a,(%ecx)
  101852:	bb 9d 3d 10 00       	mov    $0x103d9d,%ebx
  101857:	be 0a 00 00 00       	mov    $0xa,%esi
  10185c:	bf 67 66 66 66       	mov    $0x66666667,%edi
  101861:	4b                   	dec    %ebx
  101862:	8b 45 0c             	mov    0xc(%ebp),%eax
  101865:	99                   	cltd   
  101866:	f7 fe                	idiv   %esi
  101868:	8d 42 30             	lea    0x30(%edx),%eax
  10186b:	88 45 e7             	mov    %al,-0x19(%ebp)
  10186e:	88 03                	mov    %al,(%ebx)
  101870:	89 f8                	mov    %edi,%eax
  101872:	f7 6d 0c             	imull  0xc(%ebp)
  101875:	c1 fa 02             	sar    $0x2,%edx
  101878:	8b 45 0c             	mov    0xc(%ebp),%eax
  10187b:	c1 f8 1f             	sar    $0x1f,%eax
  10187e:	29 c2                	sub    %eax,%edx
  101880:	89 55 0c             	mov    %edx,0xc(%ebp)
  101883:	75 dc                	jne    101861 <abort+0x35>
  101885:	41                   	inc    %ecx
  101886:	41                   	inc    %ecx
  101887:	43                   	inc    %ebx
  101888:	8a 45 e7             	mov    -0x19(%ebp),%al
  10188b:	88 41 ff             	mov    %al,-0x1(%ecx)
  10188e:	8a 03                	mov    (%ebx),%al
  101890:	88 45 e7             	mov    %al,-0x19(%ebp)
  101893:	84 c0                	test   %al,%al
  101895:	75 ef                	jne    101886 <abort+0x5a>
  101897:	c6 01 0a             	movb   $0xa,(%ecx)
  10189a:	0f be 05 20 34 10 00 	movsbl 0x103420,%eax
  1018a1:	84 c0                	test   %al,%al
  1018a3:	74 1b                	je     1018c0 <abort+0x94>
  1018a5:	bb 20 34 10 00       	mov    $0x103420,%ebx
  1018aa:	83 ec 0c             	sub    $0xc,%esp
  1018ad:	50                   	push   %eax
  1018ae:	e8 ed ef ff ff       	call   1008a0 <putChar>
  1018b3:	43                   	inc    %ebx
  1018b4:	0f be 03             	movsbl (%ebx),%eax
  1018b7:	83 c4 10             	add    $0x10,%esp
  1018ba:	84 c0                	test   %al,%al
  1018bc:	75 ec                	jne    1018aa <abort+0x7e>
  1018be:	66 90                	xchg   %ax,%ax
  1018c0:	f4                   	hlt    
  1018c1:	eb fd                	jmp    1018c0 <abort+0x94>

001018c3 <irqEmpty>:
  1018c3:	6a 00                	push   $0x0
  1018c5:	6a ff                	push   $0xffffffff
  1018c7:	eb 13                	jmp    1018dc <asmDoIrq>

001018c9 <irqGProtectFault>:
  1018c9:	6a 0d                	push   $0xd
  1018cb:	eb 0f                	jmp    1018dc <asmDoIrq>

001018cd <irqSyscall>:
  1018cd:	6a 00                	push   $0x0
  1018cf:	68 80 00 00 00       	push   $0x80
  1018d4:	eb 06                	jmp    1018dc <asmDoIrq>

001018d6 <irqTime>:
  1018d6:	6a 00                	push   $0x0
  1018d8:	6a 20                	push   $0x20
  1018da:	eb 00                	jmp    1018dc <asmDoIrq>

001018dc <asmDoIrq>:
  1018dc:	60                   	pusha  
  1018dd:	1e                   	push   %ds
  1018de:	06                   	push   %es
  1018df:	0f a0                	push   %fs
  1018e1:	0f a8                	push   %gs
  1018e3:	54                   	push   %esp
  1018e4:	e8 a7 fa ff ff       	call   101390 <irqHandle>
  1018e9:	5c                   	pop    %esp
  1018ea:	0f a9                	pop    %gs
  1018ec:	0f a1                	pop    %fs
  1018ee:	07                   	pop    %es
  1018ef:	1f                   	pop    %ds
  1018f0:	61                   	popa   
  1018f1:	83 c4 04             	add    $0x4,%esp
  1018f4:	83 c4 04             	add    $0x4,%esp
  1018f7:	cf                   	iret   
