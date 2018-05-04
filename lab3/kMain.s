
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 05 15 00 00       	call   101510 <initTimer>
  10000b:	e8 84 10 00 00       	call   101094 <init_pcb>
  100010:	e8 c3 10 00 00       	call   1010d8 <init_kernel_pcb>
  100015:	e8 e6 07 00 00       	call   100800 <initSerial>
  10001a:	e8 6d 11 00 00       	call   10118c <initIdt>
  10001f:	e8 94 14 00 00       	call   1014b8 <initIntr>
  100024:	e8 4f 02 00 00       	call   100278 <initSeg>
  100029:	fb                   	sti    
  10002a:	e8 79 04 00 00       	call   1004a8 <loadUMain>
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
  100436:	c7 05 84 7d 10 00 1b 	movl   $0x1b,0x107d84
  10043d:	00 00 00 
  100440:	c7 05 54 7d 10 00 23 	movl   $0x23,0x107d54
  100447:	00 00 00 
  10044a:	c7 05 50 7d 10 00 23 	movl   $0x23,0x107d50
  100451:	00 00 00 
  100454:	c7 05 4c 7d 10 00 23 	movl   $0x23,0x107d4c
  10045b:	00 00 00 
  10045e:	c7 05 8c 7d 10 00 00 	movl   $0x400000,0x107d8c
  100465:	00 40 00 
  100468:	8b 45 08             	mov    0x8(%ebp),%eax
  10046b:	a3 80 7d 10 00       	mov    %eax,0x107d80
  100470:	c7 05 98 7d 10 00 0a 	movl   $0xa,0x107d98
  100477:	00 00 00 
  10047a:	6a 00                	push   $0x0
  10047c:	6a 01                	push   $0x1
  10047e:	e8 41 06 00 00       	call   100ac4 <put_into_runnable>
  100483:	bc 00 30 00 00       	mov    $0x3000,%esp
  100488:	a1 28 5d 10 00       	mov    0x105d28,%eax
  10048d:	50                   	push   %eax
  10048e:	a1 24 5d 10 00       	mov    0x105d24,%eax
  100493:	50                   	push   %eax
  100494:	9c                   	pushf  
  100495:	a1 1c 5d 10 00       	mov    0x105d1c,%eax
  10049a:	50                   	push   %eax
  10049b:	a1 18 5d 10 00       	mov    0x105d18,%eax
  1004a0:	50                   	push   %eax
  1004a1:	cf                   	iret   
  1004a2:	83 c4 10             	add    $0x10,%esp
  1004a5:	c9                   	leave  
  1004a6:	c3                   	ret    
  1004a7:	90                   	nop

001004a8 <loadUMain>:
  1004a8:	55                   	push   %ebp
  1004a9:	89 e5                	mov    %esp,%ebp
  1004ab:	57                   	push   %edi
  1004ac:	56                   	push   %esi
  1004ad:	53                   	push   %ebx
  1004ae:	83 ec 0c             	sub    $0xc,%esp
  1004b1:	bb c9 00 00 00       	mov    $0xc9,%ebx
  1004b6:	be 00 00 03 00       	mov    $0x30000,%esi
  1004bb:	90                   	nop
  1004bc:	53                   	push   %ebx
  1004bd:	56                   	push   %esi
  1004be:	e8 3d fd ff ff       	call   100200 <readSect>
  1004c3:	81 c6 00 02 00 00    	add    $0x200,%esi
  1004c9:	43                   	inc    %ebx
  1004ca:	58                   	pop    %eax
  1004cb:	5a                   	pop    %edx
  1004cc:	81 fb 91 01 00 00    	cmp    $0x191,%ebx
  1004d2:	75 e8                	jne    1004bc <loadUMain+0x14>
  1004d4:	a1 1c 00 03 00       	mov    0x3001c,%eax
  1004d9:	8d 90 00 00 03 00    	lea    0x30000(%eax),%edx
  1004df:	0f b7 35 2c 00 03 00 	movzwl 0x3002c,%esi
  1004e6:	c1 e6 05             	shl    $0x5,%esi
  1004e9:	01 d6                	add    %edx,%esi
  1004eb:	39 f2                	cmp    %esi,%edx
  1004ed:	72 0c                	jb     1004fb <loadUMain+0x53>
  1004ef:	eb 53                	jmp    100544 <loadUMain+0x9c>
  1004f1:	8d 76 00             	lea    0x0(%esi),%esi
  1004f4:	83 c2 20             	add    $0x20,%edx
  1004f7:	39 d6                	cmp    %edx,%esi
  1004f9:	76 49                	jbe    100544 <loadUMain+0x9c>
  1004fb:	83 3a 01             	cmpl   $0x1,(%edx)
  1004fe:	75 f4                	jne    1004f4 <loadUMain+0x4c>
  100500:	8b 42 08             	mov    0x8(%edx),%eax
  100503:	8b 7a 10             	mov    0x10(%edx),%edi
  100506:	8b 5a 04             	mov    0x4(%edx),%ebx
  100509:	29 c3                	sub    %eax,%ebx
  10050b:	31 c9                	xor    %ecx,%ecx
  10050d:	85 ff                	test   %edi,%edi
  10050f:	74 16                	je     100527 <loadUMain+0x7f>
  100511:	8d 76 00             	lea    0x0(%esi),%esi
  100514:	8a 8c 03 00 00 03 00 	mov    0x30000(%ebx,%eax,1),%cl
  10051b:	88 08                	mov    %cl,(%eax)
  10051d:	40                   	inc    %eax
  10051e:	89 c1                	mov    %eax,%ecx
  100520:	2b 4a 08             	sub    0x8(%edx),%ecx
  100523:	39 cf                	cmp    %ecx,%edi
  100525:	77 ed                	ja     100514 <loadUMain+0x6c>
  100527:	8b 5a 14             	mov    0x14(%edx),%ebx
  10052a:	39 cb                	cmp    %ecx,%ebx
  10052c:	76 c6                	jbe    1004f4 <loadUMain+0x4c>
  10052e:	66 90                	xchg   %ax,%ax
  100530:	c6 00 00             	movb   $0x0,(%eax)
  100533:	40                   	inc    %eax
  100534:	89 c1                	mov    %eax,%ecx
  100536:	2b 4a 08             	sub    0x8(%edx),%ecx
  100539:	39 cb                	cmp    %ecx,%ebx
  10053b:	77 f3                	ja     100530 <loadUMain+0x88>
  10053d:	83 c2 20             	add    $0x20,%edx
  100540:	39 d6                	cmp    %edx,%esi
  100542:	77 b7                	ja     1004fb <loadUMain+0x53>
  100544:	83 ec 0c             	sub    $0xc,%esp
  100547:	ff 35 18 00 03 00    	pushl  0x30018
  10054d:	e8 ca fe ff ff       	call   10041c <enterUserSpace>
  100552:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100555:	5b                   	pop    %ebx
  100556:	5e                   	pop    %esi
  100557:	5f                   	pop    %edi
  100558:	5d                   	pop    %ebp
  100559:	c3                   	ret    
  10055a:	66 90                	xchg   %ax,%ax

0010055c <sys_exit>:
  10055c:	55                   	push   %ebp
  10055d:	89 e5                	mov    %esp,%ebp
  10055f:	83 ec 14             	sub    $0x14,%esp
  100562:	68 c3 18 10 00       	push   $0x1018c3
  100567:	e8 cc 10 00 00       	call   101638 <printk>
  10056c:	e8 93 04 00 00       	call   100a04 <get_from_runnable>
  100571:	5a                   	pop    %edx
  100572:	59                   	pop    %ecx
  100573:	ff 75 08             	pushl  0x8(%ebp)
  100576:	50                   	push   %eax
  100577:	e8 e8 02 00 00       	call   100864 <put_into_running>
  10057c:	b8 01 00 00 00       	mov    $0x1,%eax
  100581:	c9                   	leave  
  100582:	c3                   	ret    
  100583:	90                   	nop

00100584 <sys_sleep>:
  100584:	55                   	push   %ebp
  100585:	89 e5                	mov    %esp,%ebp
  100587:	56                   	push   %esi
  100588:	53                   	push   %ebx
  100589:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10058c:	e8 43 04 00 00       	call   1009d4 <getpid>
  100591:	83 ec 08             	sub    $0x8,%esp
  100594:	53                   	push   %ebx
  100595:	50                   	push   %eax
  100596:	e8 5d 06 00 00       	call   100bf8 <put_into_block>
  10059b:	c7 04 24 78 18 10 00 	movl   $0x101878,(%esp)
  1005a2:	e8 91 10 00 00       	call   101638 <printk>
  1005a7:	e8 28 04 00 00       	call   1009d4 <getpid>
  1005ac:	89 c2                	mov    %eax,%edx
  1005ae:	c1 e2 07             	shl    $0x7,%edx
  1005b1:	01 c2                	add    %eax,%edx
  1005b3:	01 d2                	add    %edx,%edx
  1005b5:	01 c2                	add    %eax,%edx
  1005b7:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1005ba:	8b 34 c5 34 5d 10 00 	mov    0x105d34(,%eax,8),%esi
  1005c1:	e8 0e 04 00 00       	call   1009d4 <getpid>
  1005c6:	5a                   	pop    %edx
  1005c7:	59                   	pop    %ecx
  1005c8:	56                   	push   %esi
  1005c9:	50                   	push   %eax
  1005ca:	68 14 19 10 00       	push   $0x101914
  1005cf:	6a 09                	push   $0x9
  1005d1:	68 d1 18 10 00       	push   $0x1018d1
  1005d6:	68 f0 18 10 00       	push   $0x1018f0
  1005db:	e8 58 10 00 00       	call   101638 <printk>
  1005e0:	83 c4 14             	add    $0x14,%esp
  1005e3:	68 a7 18 10 00       	push   $0x1018a7
  1005e8:	e8 4b 10 00 00       	call   101638 <printk>
  1005ed:	e8 12 04 00 00       	call   100a04 <get_from_runnable>
  1005f2:	5e                   	pop    %esi
  1005f3:	5a                   	pop    %edx
  1005f4:	53                   	push   %ebx
  1005f5:	50                   	push   %eax
  1005f6:	e8 69 02 00 00       	call   100864 <put_into_running>
  1005fb:	b8 01 00 00 00       	mov    $0x1,%eax
  100600:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100603:	5b                   	pop    %ebx
  100604:	5e                   	pop    %esi
  100605:	5d                   	pop    %ebp
  100606:	c3                   	ret    
  100607:	90                   	nop

00100608 <sys_fork>:
  100608:	55                   	push   %ebp
  100609:	89 e5                	mov    %esp,%ebp
  10060b:	57                   	push   %edi
  10060c:	56                   	push   %esi
  10060d:	53                   	push   %ebx
  10060e:	83 ec 18             	sub    $0x18,%esp
  100611:	8b 75 08             	mov    0x8(%ebp),%esi
  100614:	68 1e 19 10 00       	push   $0x10191e
  100619:	e8 1a 10 00 00       	call   101638 <printk>
  10061e:	83 c4 10             	add    $0x10,%esp
  100621:	31 db                	xor    %ebx,%ebx
  100623:	90                   	nop
  100624:	e8 ab 03 00 00       	call   1009d4 <getpid>
  100629:	89 c2                	mov    %eax,%edx
  10062b:	c1 e2 07             	shl    $0x7,%edx
  10062e:	01 c2                	add    %eax,%edx
  100630:	01 d2                	add    %edx,%edx
  100632:	01 c2                	add    %eax,%edx
  100634:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100637:	01 c0                	add    %eax,%eax
  100639:	01 d8                	add    %ebx,%eax
  10063b:	8b 04 85 e0 3c 10 00 	mov    0x103ce0(,%eax,4),%eax
  100642:	89 04 9d b0 7d 10 00 	mov    %eax,0x107db0(,%ebx,4)
  100649:	43                   	inc    %ebx
  10064a:	81 fb 00 08 00 00    	cmp    $0x800,%ebx
  100650:	75 d2                	jne    100624 <sys_fork+0x1c>
  100652:	e8 7d 03 00 00       	call   1009d4 <getpid>
  100657:	8d 04 80             	lea    (%eax,%eax,4),%eax
  10065a:	8d 04 80             	lea    (%eax,%eax,4),%eax
  10065d:	8d 14 80             	lea    (%eax,%eax,4),%edx
  100660:	c1 e2 03             	shl    $0x3,%edx
  100663:	31 c0                	xor    %eax,%eax
  100665:	8d 76 00             	lea    0x0(%esi),%esi
  100668:	8a 8c 10 00 00 40 00 	mov    0x400000(%eax,%edx,1),%cl
  10066f:	88 88 d0 07 40 00    	mov    %cl,0x4007d0(%eax)
  100675:	40                   	inc    %eax
  100676:	3d e8 03 00 00       	cmp    $0x3e8,%eax
  10067b:	75 eb                	jne    100668 <sys_fork+0x60>
  10067d:	b8 b0 9d 10 00       	mov    $0x109db0,%eax
  100682:	b9 13 00 00 00       	mov    $0x13,%ecx
  100687:	89 c7                	mov    %eax,%edi
  100689:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10068b:	c7 05 dc 9d 10 00 00 	movl   $0x0,0x109ddc
  100692:	00 00 00 
  100695:	c7 05 f4 9d 10 00 00 	movl   $0x600000,0x109df4
  10069c:	00 60 00 
  10069f:	83 ec 08             	sub    $0x8,%esp
  1006a2:	50                   	push   %eax
  1006a3:	6a 02                	push   $0x2
  1006a5:	e8 1a 04 00 00       	call   100ac4 <put_into_runnable>
  1006aa:	b8 02 00 00 00       	mov    $0x2,%eax
  1006af:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1006b2:	5b                   	pop    %ebx
  1006b3:	5e                   	pop    %esi
  1006b4:	5f                   	pop    %edi
  1006b5:	5d                   	pop    %ebp
  1006b6:	c3                   	ret    
  1006b7:	90                   	nop

001006b8 <display>:
  1006b8:	55                   	push   %ebp
  1006b9:	89 e5                	mov    %esp,%ebp
  1006bb:	57                   	push   %edi
  1006bc:	53                   	push   %ebx
  1006bd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1006c0:	80 fb 0a             	cmp    $0xa,%bl
  1006c3:	74 5b                	je     100720 <display+0x68>
  1006c5:	8b 15 48 34 10 00    	mov    0x103448,%edx
  1006cb:	8b 0d 4c 34 10 00    	mov    0x10344c,%ecx
  1006d1:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  1006d4:	c1 e0 04             	shl    $0x4,%eax
  1006d7:	01 d0                	add    %edx,%eax
  1006d9:	01 c0                	add    %eax,%eax
  1006db:	89 c7                	mov    %eax,%edi
  1006dd:	0f be db             	movsbl %bl,%ebx
  1006e0:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
  1006e6:	66 89 d8             	mov    %bx,%ax
  1006e9:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1006ed:	42                   	inc    %edx
  1006ee:	83 fa 50             	cmp    $0x50,%edx
  1006f1:	75 1d                	jne    100710 <display+0x58>
  1006f3:	c7 05 48 34 10 00 00 	movl   $0x0,0x103448
  1006fa:	00 00 00 
  1006fd:	41                   	inc    %ecx
  1006fe:	89 0d 4c 34 10 00    	mov    %ecx,0x10344c
  100704:	b8 01 00 00 00       	mov    $0x1,%eax
  100709:	5b                   	pop    %ebx
  10070a:	5f                   	pop    %edi
  10070b:	5d                   	pop    %ebp
  10070c:	c3                   	ret    
  10070d:	8d 76 00             	lea    0x0(%esi),%esi
  100710:	89 15 48 34 10 00    	mov    %edx,0x103448
  100716:	b8 01 00 00 00       	mov    $0x1,%eax
  10071b:	5b                   	pop    %ebx
  10071c:	5f                   	pop    %edi
  10071d:	5d                   	pop    %ebp
  10071e:	c3                   	ret    
  10071f:	90                   	nop
  100720:	c7 05 48 34 10 00 00 	movl   $0x0,0x103448
  100727:	00 00 00 
  10072a:	ff 05 4c 34 10 00    	incl   0x10344c
  100730:	b8 01 00 00 00       	mov    $0x1,%eax
  100735:	5b                   	pop    %ebx
  100736:	5f                   	pop    %edi
  100737:	5d                   	pop    %ebp
  100738:	c3                   	ret    
  100739:	8d 76 00             	lea    0x0(%esi),%esi

0010073c <printkernel>:
  10073c:	55                   	push   %ebp
  10073d:	89 e5                	mov    %esp,%ebp
  10073f:	53                   	push   %ebx
  100740:	50                   	push   %eax
  100741:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100744:	0f be 03             	movsbl (%ebx),%eax
  100747:	84 c0                	test   %al,%al
  100749:	74 20                	je     10076b <printkernel+0x2f>
  10074b:	90                   	nop
  10074c:	83 ec 0c             	sub    $0xc,%esp
  10074f:	50                   	push   %eax
  100750:	e8 eb 00 00 00       	call   100840 <putChar>
  100755:	0f be 03             	movsbl (%ebx),%eax
  100758:	89 04 24             	mov    %eax,(%esp)
  10075b:	e8 58 ff ff ff       	call   1006b8 <display>
  100760:	43                   	inc    %ebx
  100761:	0f be 03             	movsbl (%ebx),%eax
  100764:	83 c4 10             	add    $0x10,%esp
  100767:	84 c0                	test   %al,%al
  100769:	75 e1                	jne    10074c <printkernel+0x10>
  10076b:	b8 01 00 00 00       	mov    $0x1,%eax
  100770:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100773:	c9                   	leave  
  100774:	c3                   	ret    
  100775:	8d 76 00             	lea    0x0(%esi),%esi

00100778 <fs_write>:
  100778:	55                   	push   %ebp
  100779:	89 e5                	mov    %esp,%ebp
  10077b:	53                   	push   %ebx
  10077c:	50                   	push   %eax
  10077d:	8b 5d 10             	mov    0x10(%ebp),%ebx
  100780:	ba 30 00 00 00       	mov    $0x30,%edx
  100785:	89 d0                	mov    %edx,%eax
  100787:	8e e8                	mov    %eax,%gs
  100789:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  10078d:	74 12                	je     1007a1 <fs_write+0x29>
  10078f:	83 ec 08             	sub    $0x8,%esp
  100792:	6a 27                	push   $0x27
  100794:	68 3a 19 10 00       	push   $0x10193a
  100799:	e8 0e 10 00 00       	call   1017ac <abort>
  10079e:	83 c4 10             	add    $0x10,%esp
  1007a1:	83 ec 08             	sub    $0x8,%esp
  1007a4:	53                   	push   %ebx
  1007a5:	ff 75 0c             	pushl  0xc(%ebp)
  1007a8:	e8 8f ff ff ff       	call   10073c <printkernel>
  1007ad:	89 d8                	mov    %ebx,%eax
  1007af:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1007b2:	c9                   	leave  
  1007b3:	c3                   	ret    

001007b4 <sys_write>:
  1007b4:	55                   	push   %ebp
  1007b5:	89 e5                	mov    %esp,%ebp
  1007b7:	53                   	push   %ebx
  1007b8:	83 ec 08             	sub    $0x8,%esp
  1007bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1007be:	ff 73 24             	pushl  0x24(%ebx)
  1007c1:	ff 73 28             	pushl  0x28(%ebx)
  1007c4:	ff 73 20             	pushl  0x20(%ebx)
  1007c7:	e8 ac ff ff ff       	call   100778 <fs_write>
  1007cc:	89 43 2c             	mov    %eax,0x2c(%ebx)
  1007cf:	83 c4 10             	add    $0x10,%esp
  1007d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1007d5:	c9                   	leave  
  1007d6:	c3                   	ret    
  1007d7:	90                   	nop

001007d8 <print_char>:
  1007d8:	55                   	push   %ebp
  1007d9:	89 e5                	mov    %esp,%ebp
  1007db:	57                   	push   %edi
  1007dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1007df:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1007e2:	c1 e0 04             	shl    $0x4,%eax
  1007e5:	03 45 0c             	add    0xc(%ebp),%eax
  1007e8:	01 c0                	add    %eax,%eax
  1007ea:	89 c7                	mov    %eax,%edi
  1007ec:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  1007f0:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  1007f6:	66 89 d0             	mov    %dx,%ax
  1007f9:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1007fd:	5f                   	pop    %edi
  1007fe:	5d                   	pop    %ebp
  1007ff:	c3                   	ret    

00100800 <initSerial>:
  100800:	55                   	push   %ebp
  100801:	89 e5                	mov    %esp,%ebp
  100803:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100808:	31 c0                	xor    %eax,%eax
  10080a:	ee                   	out    %al,(%dx)
  10080b:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100810:	b0 80                	mov    $0x80,%al
  100812:	ee                   	out    %al,(%dx)
  100813:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100818:	b0 01                	mov    $0x1,%al
  10081a:	ee                   	out    %al,(%dx)
  10081b:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100820:	31 c0                	xor    %eax,%eax
  100822:	ee                   	out    %al,(%dx)
  100823:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100828:	b0 03                	mov    $0x3,%al
  10082a:	ee                   	out    %al,(%dx)
  10082b:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100830:	b0 c7                	mov    $0xc7,%al
  100832:	ee                   	out    %al,(%dx)
  100833:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100838:	b0 0b                	mov    $0xb,%al
  10083a:	ee                   	out    %al,(%dx)
  10083b:	5d                   	pop    %ebp
  10083c:	c3                   	ret    
  10083d:	8d 76 00             	lea    0x0(%esi),%esi

00100840 <putChar>:
  100840:	55                   	push   %ebp
  100841:	89 e5                	mov    %esp,%ebp
  100843:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100846:	ba fd 03 00 00       	mov    $0x3fd,%edx
  10084b:	90                   	nop
  10084c:	ec                   	in     (%dx),%al
  10084d:	a8 20                	test   $0x20,%al
  10084f:	74 fb                	je     10084c <putChar+0xc>
  100851:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100856:	88 c8                	mov    %cl,%al
  100858:	ee                   	out    %al,(%dx)
  100859:	5d                   	pop    %ebp
  10085a:	c3                   	ret    
  10085b:	90                   	nop

0010085c <IDLE>:
  10085c:	55                   	push   %ebp
  10085d:	89 e5                	mov    %esp,%ebp
  10085f:	90                   	nop
  100860:	f4                   	hlt    
  100861:	eb fd                	jmp    100860 <IDLE+0x4>
  100863:	90                   	nop

00100864 <put_into_running>:
  100864:	55                   	push   %ebp
  100865:	89 e5                	mov    %esp,%ebp
  100867:	53                   	push   %ebx
  100868:	81 ec d4 00 00 00    	sub    $0xd4,%esp
  10086e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100871:	39 1d c0 3c 10 00    	cmp    %ebx,0x103cc0
  100877:	0f 84 a9 00 00 00    	je     100926 <put_into_running+0xc2>
  10087d:	89 1d c0 3c 10 00    	mov    %ebx,0x103cc0
  100883:	85 db                	test   %ebx,%ebx
  100885:	0f 84 a5 00 00 00    	je     100930 <put_into_running+0xcc>
  10088b:	83 fb 02             	cmp    $0x2,%ebx
  10088e:	0f 84 dc 00 00 00    	je     100970 <put_into_running+0x10c>
  100894:	89 da                	mov    %ebx,%edx
  100896:	83 ec 08             	sub    $0x8,%esp
  100899:	89 d0                	mov    %edx,%eax
  10089b:	c1 e0 07             	shl    $0x7,%eax
  10089e:	01 d0                	add    %edx,%eax
  1008a0:	01 c0                	add    %eax,%eax
  1008a2:	01 d0                	add    %edx,%eax
  1008a4:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1008a7:	8d 04 c5 dc 5c 10 00 	lea    0x105cdc(,%eax,8),%eax
  1008ae:	50                   	push   %eax
  1008af:	6a 10                	push   $0x10
  1008b1:	e8 fe f8 ff ff       	call   1001b4 <change_tss>
  1008b6:	8d 45 94             	lea    -0x6c(%ebp),%eax
  1008b9:	89 04 24             	mov    %eax,(%esp)
  1008bc:	e8 0f f9 ff ff       	call   1001d0 <get_tss>
  1008c1:	89 d8                	mov    %ebx,%eax
  1008c3:	c1 e0 07             	shl    $0x7,%eax
  1008c6:	01 d8                	add    %ebx,%eax
  1008c8:	01 c0                	add    %eax,%eax
  1008ca:	01 d8                	add    %ebx,%eax
  1008cc:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1008cf:	8d 04 c5 dc 5c 10 00 	lea    0x105cdc(,%eax,8),%eax
  1008d6:	83 c4 0c             	add    $0xc,%esp
  1008d9:	39 45 98             	cmp    %eax,-0x68(%ebp)
  1008dc:	74 12                	je     1008f0 <put_into_running+0x8c>
  1008de:	83 ec 08             	sub    $0x8,%esp
  1008e1:	6a 21                	push   $0x21
  1008e3:	68 56 19 10 00       	push   $0x101956
  1008e8:	e8 bf 0e 00 00       	call   1017ac <abort>
  1008ed:	83 c4 10             	add    $0x10,%esp
  1008f0:	83 ec 0c             	sub    $0xc,%esp
  1008f3:	68 78 18 10 00       	push   $0x101878
  1008f8:	e8 3b 0d 00 00       	call   101638 <printk>
  1008fd:	89 1c 24             	mov    %ebx,(%esp)
  100900:	68 88 1a 10 00       	push   $0x101a88
  100905:	6a 24                	push   $0x24
  100907:	68 56 19 10 00       	push   $0x101956
  10090c:	68 64 19 10 00       	push   $0x101964
  100911:	e8 22 0d 00 00       	call   101638 <printk>
  100916:	83 c4 14             	add    $0x14,%esp
  100919:	68 a7 18 10 00       	push   $0x1018a7
  10091e:	e8 15 0d 00 00       	call   101638 <printk>
  100923:	83 c4 10             	add    $0x10,%esp
  100926:	b8 01 00 00 00       	mov    $0x1,%eax
  10092b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10092e:	c9                   	leave  
  10092f:	c3                   	ret    
  100930:	83 ec 08             	sub    $0x8,%esp
  100933:	68 dc 5c 10 00       	push   $0x105cdc
  100938:	6a 10                	push   $0x10
  10093a:	e8 75 f8 ff ff       	call   1001b4 <change_tss>
  10093f:	8d 85 30 ff ff ff    	lea    -0xd0(%ebp),%eax
  100945:	89 04 24             	mov    %eax,(%esp)
  100948:	e8 83 f8 ff ff       	call   1001d0 <get_tss>
  10094d:	83 c4 0c             	add    $0xc,%esp
  100950:	81 bd 34 ff ff ff dc 	cmpl   $0x105cdc,-0xcc(%ebp)
  100957:	5c 10 00 
  10095a:	74 94                	je     1008f0 <put_into_running+0x8c>
  10095c:	83 ec 08             	sub    $0x8,%esp
  10095f:	6a 14                	push   $0x14
  100961:	68 56 19 10 00       	push   $0x101956
  100966:	e8 41 0e 00 00       	call   1017ac <abort>
  10096b:	83 c4 10             	add    $0x10,%esp
  10096e:	eb 80                	jmp    1008f0 <put_into_running+0x8c>
  100970:	83 ec 0c             	sub    $0xc,%esp
  100973:	68 78 18 10 00       	push   $0x101878
  100978:	e8 bb 0c 00 00       	call   101638 <printk>
  10097d:	58                   	pop    %eax
  10097e:	5a                   	pop    %edx
  10097f:	ff 35 90 7d 10 00    	pushl  0x107d90
  100985:	ff 35 8c 7d 10 00    	pushl  0x107d8c
  10098b:	68 88 1a 10 00       	push   $0x101a88
  100990:	6a 1c                	push   $0x1c
  100992:	68 56 19 10 00       	push   $0x101956
  100997:	68 9c 19 10 00       	push   $0x10199c
  10099c:	e8 97 0c 00 00       	call   101638 <printk>
  1009a1:	83 c4 14             	add    $0x14,%esp
  1009a4:	68 a7 18 10 00       	push   $0x1018a7
  1009a9:	e8 8a 0c 00 00       	call   101638 <printk>
  1009ae:	8b 15 c0 3c 10 00    	mov    0x103cc0,%edx
  1009b4:	83 c4 10             	add    $0x10,%esp
  1009b7:	e9 da fe ff ff       	jmp    100896 <put_into_running+0x32>

001009bc <update_block>:
  1009bc:	55                   	push   %ebp
  1009bd:	89 e5                	mov    %esp,%ebp
  1009bf:	b8 01 00 00 00       	mov    $0x1,%eax
  1009c4:	5d                   	pop    %ebp
  1009c5:	c3                   	ret    
  1009c6:	66 90                	xchg   %ax,%ax

001009c8 <apply_new_pid>:
  1009c8:	55                   	push   %ebp
  1009c9:	89 e5                	mov    %esp,%ebp
  1009cb:	b8 02 00 00 00       	mov    $0x2,%eax
  1009d0:	5d                   	pop    %ebp
  1009d1:	c3                   	ret    
  1009d2:	66 90                	xchg   %ax,%ax

001009d4 <getpid>:
  1009d4:	55                   	push   %ebp
  1009d5:	89 e5                	mov    %esp,%ebp
  1009d7:	a1 c0 3c 10 00       	mov    0x103cc0,%eax
  1009dc:	5d                   	pop    %ebp
  1009dd:	c3                   	ret    
  1009de:	66 90                	xchg   %ax,%ax

001009e0 <getrunnable>:
  1009e0:	55                   	push   %ebp
  1009e1:	89 e5                	mov    %esp,%ebp
  1009e3:	a1 24 33 10 00       	mov    0x103324,%eax
  1009e8:	5d                   	pop    %ebp
  1009e9:	c3                   	ret    
  1009ea:	66 90                	xchg   %ax,%ax

001009ec <getblocked>:
  1009ec:	55                   	push   %ebp
  1009ed:	89 e5                	mov    %esp,%ebp
  1009ef:	a1 20 33 10 00       	mov    0x103320,%eax
  1009f4:	5d                   	pop    %ebp
  1009f5:	c3                   	ret    
  1009f6:	66 90                	xchg   %ax,%ax

001009f8 <transfer_pid_mode>:
  1009f8:	55                   	push   %ebp
  1009f9:	89 e5                	mov    %esp,%ebp
  1009fb:	b8 01 00 00 00       	mov    $0x1,%eax
  100a00:	5d                   	pop    %ebp
  100a01:	c3                   	ret    
  100a02:	66 90                	xchg   %ax,%ax

00100a04 <get_from_runnable>:
  100a04:	55                   	push   %ebp
  100a05:	89 e5                	mov    %esp,%ebp
  100a07:	53                   	push   %ebx
  100a08:	51                   	push   %ecx
  100a09:	8b 1d 24 33 10 00    	mov    0x103324,%ebx
  100a0f:	83 fb ff             	cmp    $0xffffffff,%ebx
  100a12:	0f 84 a4 00 00 00    	je     100abc <get_from_runnable+0xb8>
  100a18:	89 d8                	mov    %ebx,%eax
  100a1a:	c1 e0 07             	shl    $0x7,%eax
  100a1d:	01 d8                	add    %ebx,%eax
  100a1f:	01 c0                	add    %eax,%eax
  100a21:	01 d8                	add    %ebx,%eax
  100a23:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100a26:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100a2d:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100a33:	39 da                	cmp    %ebx,%edx
  100a35:	74 79                	je     100ab0 <get_from_runnable+0xac>
  100a37:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100a3d:	89 c8                	mov    %ecx,%eax
  100a3f:	c1 e0 07             	shl    $0x7,%eax
  100a42:	01 c8                	add    %ecx,%eax
  100a44:	01 c0                	add    %eax,%eax
  100a46:	01 c8                	add    %ecx,%eax
  100a48:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100a4b:	89 14 c5 40 5d 10 00 	mov    %edx,0x105d40(,%eax,8)
  100a52:	89 d0                	mov    %edx,%eax
  100a54:	c1 e0 07             	shl    $0x7,%eax
  100a57:	01 d0                	add    %edx,%eax
  100a59:	01 c0                	add    %eax,%eax
  100a5b:	01 d0                	add    %edx,%eax
  100a5d:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100a60:	89 0c c5 3c 5d 10 00 	mov    %ecx,0x105d3c(,%eax,8)
  100a67:	89 15 24 33 10 00    	mov    %edx,0x103324
  100a6d:	83 ec 0c             	sub    $0xc,%esp
  100a70:	68 78 18 10 00       	push   $0x101878
  100a75:	e8 be 0b 00 00       	call   101638 <printk>
  100a7a:	58                   	pop    %eax
  100a7b:	5a                   	pop    %edx
  100a7c:	ff 35 24 33 10 00    	pushl  0x103324
  100a82:	53                   	push   %ebx
  100a83:	68 64 1a 10 00       	push   $0x101a64
  100a88:	6a 74                	push   $0x74
  100a8a:	68 56 19 10 00       	push   $0x101956
  100a8f:	68 cc 19 10 00       	push   $0x1019cc
  100a94:	e8 9f 0b 00 00       	call   101638 <printk>
  100a99:	83 c4 14             	add    $0x14,%esp
  100a9c:	68 a7 18 10 00       	push   $0x1018a7
  100aa1:	e8 92 0b 00 00       	call   101638 <printk>
  100aa6:	83 c4 10             	add    $0x10,%esp
  100aa9:	89 d8                	mov    %ebx,%eax
  100aab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100aae:	c9                   	leave  
  100aaf:	c3                   	ret    
  100ab0:	c7 05 24 33 10 00 ff 	movl   $0xffffffff,0x103324
  100ab7:	ff ff ff 
  100aba:	eb b1                	jmp    100a6d <get_from_runnable+0x69>
  100abc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100ac1:	eb e8                	jmp    100aab <get_from_runnable+0xa7>
  100ac3:	90                   	nop

00100ac4 <put_into_runnable>:
  100ac4:	55                   	push   %ebp
  100ac5:	89 e5                	mov    %esp,%ebp
  100ac7:	56                   	push   %esi
  100ac8:	53                   	push   %ebx
  100ac9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100acc:	8b 15 24 33 10 00    	mov    0x103324,%edx
  100ad2:	83 fa ff             	cmp    $0xffffffff,%edx
  100ad5:	0f 84 f1 00 00 00    	je     100bcc <put_into_runnable+0x108>
  100adb:	89 d0                	mov    %edx,%eax
  100add:	c1 e0 07             	shl    $0x7,%eax
  100ae0:	01 d0                	add    %edx,%eax
  100ae2:	01 c0                	add    %eax,%eax
  100ae4:	01 d0                	add    %edx,%eax
  100ae6:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100ae9:	8d 34 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%esi
  100af0:	8b 8e 5c 20 00 00    	mov    0x205c(%esi),%ecx
  100af6:	89 c8                	mov    %ecx,%eax
  100af8:	c1 e0 07             	shl    $0x7,%eax
  100afb:	01 c8                	add    %ecx,%eax
  100afd:	01 c0                	add    %eax,%eax
  100aff:	01 c8                	add    %ecx,%eax
  100b01:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100b04:	89 1c c5 40 5d 10 00 	mov    %ebx,0x105d40(,%eax,8)
  100b0b:	89 d8                	mov    %ebx,%eax
  100b0d:	c1 e0 07             	shl    $0x7,%eax
  100b10:	01 d8                	add    %ebx,%eax
  100b12:	01 c0                	add    %eax,%eax
  100b14:	01 d8                	add    %ebx,%eax
  100b16:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b19:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100b20:	89 88 5c 20 00 00    	mov    %ecx,0x205c(%eax)
  100b26:	89 90 60 20 00 00    	mov    %edx,0x2060(%eax)
  100b2c:	89 9e 5c 20 00 00    	mov    %ebx,0x205c(%esi)
  100b32:	89 d8                	mov    %ebx,%eax
  100b34:	c1 e0 07             	shl    $0x7,%eax
  100b37:	01 d8                	add    %ebx,%eax
  100b39:	01 c0                	add    %eax,%eax
  100b3b:	01 d8                	add    %ebx,%eax
  100b3d:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b40:	c7 04 c5 2c 5d 10 00 	movl   $0x1,0x105d2c(,%eax,8)
  100b47:	01 00 00 00 
  100b4b:	85 db                	test   %ebx,%ebx
  100b4d:	75 0a                	jne    100b59 <put_into_runnable+0x95>
  100b4f:	c7 05 18 5d 10 00 5c 	movl   $0x10085c,0x105d18
  100b56:	08 10 00 
  100b59:	83 ec 0c             	sub    $0xc,%esp
  100b5c:	68 78 18 10 00       	push   $0x101878
  100b61:	e8 d2 0a 00 00       	call   101638 <printk>
  100b66:	58                   	pop    %eax
  100b67:	5a                   	pop    %edx
  100b68:	53                   	push   %ebx
  100b69:	ff 35 24 33 10 00    	pushl  0x103324
  100b6f:	68 50 1a 10 00       	push   $0x101a50
  100b74:	68 90 00 00 00       	push   $0x90
  100b79:	68 56 19 10 00       	push   $0x101956
  100b7e:	68 00 1a 10 00       	push   $0x101a00
  100b83:	e8 b0 0a 00 00       	call   101638 <printk>
  100b88:	83 c4 14             	add    $0x14,%esp
  100b8b:	68 a7 18 10 00       	push   $0x1018a7
  100b90:	e8 a3 0a 00 00       	call   101638 <printk>
  100b95:	89 d8                	mov    %ebx,%eax
  100b97:	c1 e0 07             	shl    $0x7,%eax
  100b9a:	01 d8                	add    %ebx,%eax
  100b9c:	01 c0                	add    %eax,%eax
  100b9e:	01 d8                	add    %ebx,%eax
  100ba0:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100ba3:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100baa:	8b 15 c8 3c 10 00    	mov    0x103cc8,%edx
  100bb0:	89 90 50 20 00 00    	mov    %edx,0x2050(%eax)
  100bb6:	8b 55 0c             	mov    0xc(%ebp),%edx
  100bb9:	89 90 64 20 00 00    	mov    %edx,0x2064(%eax)
  100bbf:	b8 01 00 00 00       	mov    $0x1,%eax
  100bc4:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100bc7:	5b                   	pop    %ebx
  100bc8:	5e                   	pop    %esi
  100bc9:	5d                   	pop    %ebp
  100bca:	c3                   	ret    
  100bcb:	90                   	nop
  100bcc:	89 1d 24 33 10 00    	mov    %ebx,0x103324
  100bd2:	89 d8                	mov    %ebx,%eax
  100bd4:	c1 e0 07             	shl    $0x7,%eax
  100bd7:	01 d8                	add    %ebx,%eax
  100bd9:	01 c0                	add    %eax,%eax
  100bdb:	01 d8                	add    %ebx,%eax
  100bdd:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100be0:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100be7:	89 98 5c 20 00 00    	mov    %ebx,0x205c(%eax)
  100bed:	89 98 60 20 00 00    	mov    %ebx,0x2060(%eax)
  100bf3:	e9 3a ff ff ff       	jmp    100b32 <put_into_runnable+0x6e>

00100bf8 <put_into_block>:
  100bf8:	55                   	push   %ebp
  100bf9:	89 e5                	mov    %esp,%ebp
  100bfb:	57                   	push   %edi
  100bfc:	56                   	push   %esi
  100bfd:	53                   	push   %ebx
  100bfe:	8b 45 08             	mov    0x8(%ebp),%eax
  100c01:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100c04:	8b 0d 20 33 10 00    	mov    0x103320,%ecx
  100c0a:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100c0d:	0f 84 99 00 00 00    	je     100cac <put_into_block+0xb4>
  100c13:	89 ca                	mov    %ecx,%edx
  100c15:	c1 e2 07             	shl    $0x7,%edx
  100c18:	01 ca                	add    %ecx,%edx
  100c1a:	01 d2                	add    %edx,%edx
  100c1c:	01 ca                	add    %ecx,%edx
  100c1e:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100c21:	8d 3c d5 e0 3c 10 00 	lea    0x103ce0(,%edx,8),%edi
  100c28:	8b b7 5c 20 00 00    	mov    0x205c(%edi),%esi
  100c2e:	89 f2                	mov    %esi,%edx
  100c30:	c1 e2 07             	shl    $0x7,%edx
  100c33:	01 f2                	add    %esi,%edx
  100c35:	01 d2                	add    %edx,%edx
  100c37:	01 f2                	add    %esi,%edx
  100c39:	8d 14 96             	lea    (%esi,%edx,4),%edx
  100c3c:	89 04 d5 40 5d 10 00 	mov    %eax,0x105d40(,%edx,8)
  100c43:	89 c2                	mov    %eax,%edx
  100c45:	c1 e2 07             	shl    $0x7,%edx
  100c48:	01 c2                	add    %eax,%edx
  100c4a:	01 d2                	add    %edx,%edx
  100c4c:	01 c2                	add    %eax,%edx
  100c4e:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c51:	8d 14 d5 e0 3c 10 00 	lea    0x103ce0(,%edx,8),%edx
  100c58:	89 b2 5c 20 00 00    	mov    %esi,0x205c(%edx)
  100c5e:	89 8a 60 20 00 00    	mov    %ecx,0x2060(%edx)
  100c64:	89 87 5c 20 00 00    	mov    %eax,0x205c(%edi)
  100c6a:	89 c2                	mov    %eax,%edx
  100c6c:	c1 e2 07             	shl    $0x7,%edx
  100c6f:	01 c2                	add    %eax,%edx
  100c71:	01 d2                	add    %edx,%edx
  100c73:	01 c2                	add    %eax,%edx
  100c75:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c78:	c1 e2 03             	shl    $0x3,%edx
  100c7b:	8d 82 e0 5c 10 00    	lea    0x105ce0(%edx),%eax
  100c81:	b9 13 00 00 00       	mov    $0x13,%ecx
  100c86:	89 c7                	mov    %eax,%edi
  100c88:	89 de                	mov    %ebx,%esi
  100c8a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100c8c:	8b 43 20             	mov    0x20(%ebx),%eax
  100c8f:	89 82 34 5d 10 00    	mov    %eax,0x105d34(%edx)
  100c95:	c7 82 2c 5d 10 00 00 	movl   $0x0,0x105d2c(%edx)
  100c9c:	00 00 00 
  100c9f:	b8 01 00 00 00       	mov    $0x1,%eax
  100ca4:	5b                   	pop    %ebx
  100ca5:	5e                   	pop    %esi
  100ca6:	5f                   	pop    %edi
  100ca7:	5d                   	pop    %ebp
  100ca8:	c3                   	ret    
  100ca9:	8d 76 00             	lea    0x0(%esi),%esi
  100cac:	a3 20 33 10 00       	mov    %eax,0x103320
  100cb1:	89 c2                	mov    %eax,%edx
  100cb3:	c1 e2 07             	shl    $0x7,%edx
  100cb6:	01 c2                	add    %eax,%edx
  100cb8:	01 d2                	add    %edx,%edx
  100cba:	01 c2                	add    %eax,%edx
  100cbc:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100cbf:	8d 14 d5 e0 3c 10 00 	lea    0x103ce0(,%edx,8),%edx
  100cc6:	89 82 60 20 00 00    	mov    %eax,0x2060(%edx)
  100ccc:	89 82 5c 20 00 00    	mov    %eax,0x205c(%edx)
  100cd2:	eb 96                	jmp    100c6a <put_into_block+0x72>

00100cd4 <get_from>:
  100cd4:	55                   	push   %ebp
  100cd5:	89 e5                	mov    %esp,%ebp
  100cd7:	56                   	push   %esi
  100cd8:	53                   	push   %ebx
  100cd9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100cdc:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cdf:	85 db                	test   %ebx,%ebx
  100ce1:	0f 8e 01 01 00 00    	jle    100de8 <get_from+0x114>
  100ce7:	39 c3                	cmp    %eax,%ebx
  100ce9:	74 42                	je     100d2d <get_from+0x59>
  100ceb:	89 da                	mov    %ebx,%edx
  100ced:	c1 e2 07             	shl    $0x7,%edx
  100cf0:	01 da                	add    %ebx,%edx
  100cf2:	01 d2                	add    %edx,%edx
  100cf4:	01 da                	add    %ebx,%edx
  100cf6:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100cf9:	8b 0c d5 40 5d 10 00 	mov    0x105d40(,%edx,8),%ecx
  100d00:	39 cb                	cmp    %ecx,%ebx
  100d02:	75 25                	jne    100d29 <get_from+0x55>
  100d04:	e9 df 00 00 00       	jmp    100de8 <get_from+0x114>
  100d09:	8d 76 00             	lea    0x0(%esi),%esi
  100d0c:	89 ca                	mov    %ecx,%edx
  100d0e:	c1 e2 07             	shl    $0x7,%edx
  100d11:	01 ca                	add    %ecx,%edx
  100d13:	01 d2                	add    %edx,%edx
  100d15:	01 ca                	add    %ecx,%edx
  100d17:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100d1a:	8b 0c d5 40 5d 10 00 	mov    0x105d40(,%edx,8),%ecx
  100d21:	39 cb                	cmp    %ecx,%ebx
  100d23:	0f 84 bf 00 00 00    	je     100de8 <get_from+0x114>
  100d29:	39 c1                	cmp    %eax,%ecx
  100d2b:	75 df                	jne    100d0c <get_from+0x38>
  100d2d:	89 c2                	mov    %eax,%edx
  100d2f:	c1 e2 07             	shl    $0x7,%edx
  100d32:	01 c2                	add    %eax,%edx
  100d34:	01 d2                	add    %edx,%edx
  100d36:	01 c2                	add    %eax,%edx
  100d38:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100d3b:	8b 04 c5 2c 5d 10 00 	mov    0x105d2c(,%eax,8),%eax
  100d42:	85 c0                	test   %eax,%eax
  100d44:	0f 84 c2 00 00 00    	je     100e0c <get_from+0x138>
  100d4a:	48                   	dec    %eax
  100d4b:	75 7f                	jne    100dcc <get_from+0xf8>
  100d4d:	be 24 33 10 00       	mov    $0x103324,%esi
  100d52:	3b 1e                	cmp    (%esi),%ebx
  100d54:	74 15                	je     100d6b <get_from+0x97>
  100d56:	83 ec 08             	sub    $0x8,%esp
  100d59:	68 d2 00 00 00       	push   $0xd2
  100d5e:	68 56 19 10 00       	push   $0x101956
  100d63:	e8 44 0a 00 00       	call   1017ac <abort>
  100d68:	83 c4 10             	add    $0x10,%esp
  100d6b:	89 d8                	mov    %ebx,%eax
  100d6d:	c1 e0 07             	shl    $0x7,%eax
  100d70:	01 d8                	add    %ebx,%eax
  100d72:	01 c0                	add    %eax,%eax
  100d74:	01 d8                	add    %ebx,%eax
  100d76:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100d79:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  100d80:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100d86:	39 da                	cmp    %ebx,%edx
  100d88:	0f 84 8a 00 00 00    	je     100e18 <get_from+0x144>
  100d8e:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100d94:	89 c8                	mov    %ecx,%eax
  100d96:	c1 e0 07             	shl    $0x7,%eax
  100d99:	01 c8                	add    %ecx,%eax
  100d9b:	01 c0                	add    %eax,%eax
  100d9d:	01 c8                	add    %ecx,%eax
  100d9f:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100da2:	89 14 c5 40 5d 10 00 	mov    %edx,0x105d40(,%eax,8)
  100da9:	89 d0                	mov    %edx,%eax
  100dab:	c1 e0 07             	shl    $0x7,%eax
  100dae:	01 d0                	add    %edx,%eax
  100db0:	01 c0                	add    %eax,%eax
  100db2:	01 d0                	add    %edx,%eax
  100db4:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100db7:	89 0c c5 3c 5d 10 00 	mov    %ecx,0x105d3c(,%eax,8)
  100dbe:	89 16                	mov    %edx,(%esi)
  100dc0:	89 d8                	mov    %ebx,%eax
  100dc2:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100dc5:	5b                   	pop    %ebx
  100dc6:	5e                   	pop    %esi
  100dc7:	5d                   	pop    %ebp
  100dc8:	c3                   	ret    
  100dc9:	8d 76 00             	lea    0x0(%esi),%esi
  100dcc:	83 ec 08             	sub    $0x8,%esp
  100dcf:	68 ce 00 00 00       	push   $0xce
  100dd4:	68 56 19 10 00       	push   $0x101956
  100dd9:	e8 ce 09 00 00       	call   1017ac <abort>
  100dde:	a1 00 00 00 00       	mov    0x0,%eax
  100de3:	0f 0b                	ud2    
  100de5:	8d 76 00             	lea    0x0(%esi),%esi
  100de8:	83 ec 08             	sub    $0x8,%esp
  100deb:	68 bf 00 00 00       	push   $0xbf
  100df0:	68 56 19 10 00       	push   $0x101956
  100df5:	e8 b2 09 00 00       	call   1017ac <abort>
  100dfa:	83 c4 10             	add    $0x10,%esp
  100dfd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e02:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e05:	5b                   	pop    %ebx
  100e06:	5e                   	pop    %esi
  100e07:	5d                   	pop    %ebp
  100e08:	c3                   	ret    
  100e09:	8d 76 00             	lea    0x0(%esi),%esi
  100e0c:	be 20 33 10 00       	mov    $0x103320,%esi
  100e11:	e9 3c ff ff ff       	jmp    100d52 <get_from+0x7e>
  100e16:	66 90                	xchg   %ax,%ax
  100e18:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100e1e:	89 d8                	mov    %ebx,%eax
  100e20:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e23:	5b                   	pop    %ebx
  100e24:	5e                   	pop    %esi
  100e25:	5d                   	pop    %ebp
  100e26:	c3                   	ret    
  100e27:	90                   	nop

00100e28 <get_from_block>:
  100e28:	55                   	push   %ebp
  100e29:	89 e5                	mov    %esp,%ebp
  100e2b:	83 ec 10             	sub    $0x10,%esp
  100e2e:	ff 75 08             	pushl  0x8(%ebp)
  100e31:	ff 35 20 33 10 00    	pushl  0x103320
  100e37:	e8 98 fe ff ff       	call   100cd4 <get_from>
  100e3c:	83 c4 10             	add    $0x10,%esp
  100e3f:	40                   	inc    %eax
  100e40:	74 0a                	je     100e4c <get_from_block+0x24>
  100e42:	b8 01 00 00 00       	mov    $0x1,%eax
  100e47:	c9                   	leave  
  100e48:	c3                   	ret    
  100e49:	8d 76 00             	lea    0x0(%esi),%esi
  100e4c:	83 ec 08             	sub    $0x8,%esp
  100e4f:	68 09 01 00 00       	push   $0x109
  100e54:	68 56 19 10 00       	push   $0x101956
  100e59:	e8 4e 09 00 00       	call   1017ac <abort>
  100e5e:	83 c4 10             	add    $0x10,%esp
  100e61:	b8 01 00 00 00       	mov    $0x1,%eax
  100e66:	c9                   	leave  
  100e67:	c3                   	ret    

00100e68 <check_block>:
  100e68:	55                   	push   %ebp
  100e69:	89 e5                	mov    %esp,%ebp
  100e6b:	57                   	push   %edi
  100e6c:	56                   	push   %esi
  100e6d:	53                   	push   %ebx
  100e6e:	83 ec 0c             	sub    $0xc,%esp
  100e71:	a1 20 33 10 00       	mov    0x103320,%eax
  100e76:	89 c6                	mov    %eax,%esi
  100e78:	83 f8 ff             	cmp    $0xffffffff,%eax
  100e7b:	74 58                	je     100ed5 <check_block+0x6d>
  100e7d:	89 c2                	mov    %eax,%edx
  100e7f:	c1 e2 07             	shl    $0x7,%edx
  100e82:	01 c2                	add    %eax,%edx
  100e84:	01 d2                	add    %edx,%edx
  100e86:	01 c2                	add    %eax,%edx
  100e88:	8d 3c 90             	lea    (%eax,%edx,4),%edi
  100e8b:	eb 0c                	jmp    100e99 <check_block+0x31>
  100e8d:	8d 76 00             	lea    0x0(%esi),%esi
  100e90:	39 c6                	cmp    %eax,%esi
  100e92:	74 3c                	je     100ed0 <check_block+0x68>
  100e94:	83 f8 ff             	cmp    $0xffffffff,%eax
  100e97:	74 37                	je     100ed0 <check_block+0x68>
  100e99:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
  100ea0:	8b 8b 34 5d 10 00    	mov    0x105d34(%ebx),%ecx
  100ea6:	85 c9                	test   %ecx,%ecx
  100ea8:	7f e6                	jg     100e90 <check_block+0x28>
  100eaa:	83 ec 0c             	sub    $0xc,%esp
  100ead:	56                   	push   %esi
  100eae:	e8 75 ff ff ff       	call   100e28 <get_from_block>
  100eb3:	58                   	pop    %eax
  100eb4:	5a                   	pop    %edx
  100eb5:	81 c3 e0 5c 10 00    	add    $0x105ce0,%ebx
  100ebb:	53                   	push   %ebx
  100ebc:	56                   	push   %esi
  100ebd:	e8 02 fc ff ff       	call   100ac4 <put_into_runnable>
  100ec2:	83 c4 10             	add    $0x10,%esp
  100ec5:	a1 20 33 10 00       	mov    0x103320,%eax
  100eca:	39 c6                	cmp    %eax,%esi
  100ecc:	75 c6                	jne    100e94 <check_block+0x2c>
  100ece:	66 90                	xchg   %ax,%ax
  100ed0:	be 01 00 00 00       	mov    $0x1,%esi
  100ed5:	89 f0                	mov    %esi,%eax
  100ed7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100eda:	5b                   	pop    %ebx
  100edb:	5e                   	pop    %esi
  100edc:	5f                   	pop    %edi
  100edd:	5d                   	pop    %ebp
  100ede:	c3                   	ret    
  100edf:	90                   	nop

00100ee0 <checkTimeCount>:
  100ee0:	a1 c4 3c 10 00       	mov    0x103cc4,%eax
  100ee5:	85 c0                	test   %eax,%eax
  100ee7:	0f 84 fb 00 00 00    	je     100fe8 <checkTimeCount+0x108>
  100eed:	55                   	push   %ebp
  100eee:	89 e5                	mov    %esp,%ebp
  100ef0:	57                   	push   %edi
  100ef1:	56                   	push   %esi
  100ef2:	83 ec 0c             	sub    $0xc,%esp
  100ef5:	68 78 18 10 00       	push   $0x101878
  100efa:	e8 39 07 00 00       	call   101638 <printk>
  100eff:	5e                   	pop    %esi
  100f00:	ff 35 c0 3c 10 00    	pushl  0x103cc0
  100f06:	68 78 1a 10 00       	push   $0x101a78
  100f0b:	6a 31                	push   $0x31
  100f0d:	68 56 19 10 00       	push   $0x101956
  100f12:	68 82 19 10 00       	push   $0x101982
  100f17:	e8 1c 07 00 00       	call   101638 <printk>
  100f1c:	83 c4 14             	add    $0x14,%esp
  100f1f:	68 a7 18 10 00       	push   $0x1018a7
  100f24:	e8 0f 07 00 00       	call   101638 <printk>
  100f29:	c7 04 24 78 18 10 00 	movl   $0x101878,(%esp)
  100f30:	e8 03 07 00 00       	call   101638 <printk>
  100f35:	5f                   	pop    %edi
  100f36:	8b 15 c0 3c 10 00    	mov    0x103cc0,%edx
  100f3c:	89 d0                	mov    %edx,%eax
  100f3e:	c1 e0 07             	shl    $0x7,%eax
  100f41:	01 d0                	add    %edx,%eax
  100f43:	01 c0                	add    %eax,%eax
  100f45:	01 d0                	add    %edx,%eax
  100f47:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100f4a:	ff 34 c5 30 5d 10 00 	pushl  0x105d30(,%eax,8)
  100f51:	68 78 1a 10 00       	push   $0x101a78
  100f56:	6a 32                	push   $0x32
  100f58:	68 56 19 10 00       	push   $0x101956
  100f5d:	68 30 1a 10 00       	push   $0x101a30
  100f62:	e8 d1 06 00 00       	call   101638 <printk>
  100f67:	83 c4 14             	add    $0x14,%esp
  100f6a:	68 a7 18 10 00       	push   $0x1018a7
  100f6f:	e8 c4 06 00 00       	call   101638 <printk>
  100f74:	e8 ef fe ff ff       	call   100e68 <check_block>
  100f79:	8b 15 c0 3c 10 00    	mov    0x103cc0,%edx
  100f7f:	89 d0                	mov    %edx,%eax
  100f81:	c1 e0 07             	shl    $0x7,%eax
  100f84:	01 d0                	add    %edx,%eax
  100f86:	01 c0                	add    %eax,%eax
  100f88:	01 d0                	add    %edx,%eax
  100f8a:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100f8d:	c1 e0 03             	shl    $0x3,%eax
  100f90:	83 c4 10             	add    $0x10,%esp
  100f93:	8b 88 30 5d 10 00    	mov    0x105d30(%eax),%ecx
  100f99:	85 c9                	test   %ecx,%ecx
  100f9b:	7e 0f                	jle    100fac <checkTimeCount+0xcc>
  100f9d:	b8 01 00 00 00       	mov    $0x1,%eax
  100fa2:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100fa5:	5e                   	pop    %esi
  100fa6:	5f                   	pop    %edi
  100fa7:	5d                   	pop    %ebp
  100fa8:	c3                   	ret    
  100fa9:	8d 76 00             	lea    0x0(%esi),%esi
  100fac:	05 e0 5c 10 00       	add    $0x105ce0,%eax
  100fb1:	b9 13 00 00 00       	mov    $0x13,%ecx
  100fb6:	89 c7                	mov    %eax,%edi
  100fb8:	8b 75 08             	mov    0x8(%ebp),%esi
  100fbb:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100fbd:	83 ec 08             	sub    $0x8,%esp
  100fc0:	ff 75 08             	pushl  0x8(%ebp)
  100fc3:	52                   	push   %edx
  100fc4:	e8 fb fa ff ff       	call   100ac4 <put_into_runnable>
  100fc9:	e8 36 fa ff ff       	call   100a04 <get_from_runnable>
  100fce:	5a                   	pop    %edx
  100fcf:	59                   	pop    %ecx
  100fd0:	ff 75 08             	pushl  0x8(%ebp)
  100fd3:	50                   	push   %eax
  100fd4:	e8 8b f8 ff ff       	call   100864 <put_into_running>
  100fd9:	83 c4 10             	add    $0x10,%esp
  100fdc:	b8 01 00 00 00       	mov    $0x1,%eax
  100fe1:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100fe4:	5e                   	pop    %esi
  100fe5:	5f                   	pop    %edi
  100fe6:	5d                   	pop    %ebp
  100fe7:	c3                   	ret    
  100fe8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100fed:	c3                   	ret    
  100fee:	66 90                	xchg   %ax,%ax

00100ff0 <check_is_in>:
  100ff0:	55                   	push   %ebp
  100ff1:	89 e5                	mov    %esp,%ebp
  100ff3:	53                   	push   %ebx
  100ff4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100ff7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100ffa:	85 c9                	test   %ecx,%ecx
  100ffc:	7e 4a                	jle    101048 <check_is_in+0x58>
  100ffe:	39 d9                	cmp    %ebx,%ecx
  101000:	74 3b                	je     10103d <check_is_in+0x4d>
  101002:	89 c8                	mov    %ecx,%eax
  101004:	c1 e0 07             	shl    $0x7,%eax
  101007:	01 c8                	add    %ecx,%eax
  101009:	01 c0                	add    %eax,%eax
  10100b:	01 c8                	add    %ecx,%eax
  10100d:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  101010:	8b 14 c5 40 5d 10 00 	mov    0x105d40(,%eax,8),%edx
  101017:	39 d1                	cmp    %edx,%ecx
  101019:	75 1e                	jne    101039 <check_is_in+0x49>
  10101b:	eb 2b                	jmp    101048 <check_is_in+0x58>
  10101d:	8d 76 00             	lea    0x0(%esi),%esi
  101020:	89 d0                	mov    %edx,%eax
  101022:	c1 e0 07             	shl    $0x7,%eax
  101025:	01 d0                	add    %edx,%eax
  101027:	01 c0                	add    %eax,%eax
  101029:	01 d0                	add    %edx,%eax
  10102b:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10102e:	8b 14 c5 40 5d 10 00 	mov    0x105d40(,%eax,8),%edx
  101035:	39 d1                	cmp    %edx,%ecx
  101037:	74 0f                	je     101048 <check_is_in+0x58>
  101039:	39 d3                	cmp    %edx,%ebx
  10103b:	75 e3                	jne    101020 <check_is_in+0x30>
  10103d:	b8 01 00 00 00       	mov    $0x1,%eax
  101042:	5b                   	pop    %ebx
  101043:	5d                   	pop    %ebp
  101044:	c3                   	ret    
  101045:	8d 76 00             	lea    0x0(%esi),%esi
  101048:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10104d:	5b                   	pop    %ebx
  10104e:	5d                   	pop    %ebp
  10104f:	c3                   	ret    

00101050 <block_decrease>:
  101050:	55                   	push   %ebp
  101051:	89 e5                	mov    %esp,%ebp
  101053:	8b 0d 20 33 10 00    	mov    0x103320,%ecx
  101059:	83 f9 ff             	cmp    $0xffffffff,%ecx
  10105c:	74 2e                	je     10108c <block_decrease+0x3c>
  10105e:	89 ca                	mov    %ecx,%edx
  101060:	89 d0                	mov    %edx,%eax
  101062:	c1 e0 07             	shl    $0x7,%eax
  101065:	01 d0                	add    %edx,%eax
  101067:	01 c0                	add    %eax,%eax
  101069:	01 d0                	add    %edx,%eax
  10106b:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10106e:	8d 04 c5 e0 3c 10 00 	lea    0x103ce0(,%eax,8),%eax
  101075:	ff 88 54 20 00 00    	decl   0x2054(%eax)
  10107b:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  101081:	39 d1                	cmp    %edx,%ecx
  101083:	75 db                	jne    101060 <block_decrease+0x10>
  101085:	b8 01 00 00 00       	mov    $0x1,%eax
  10108a:	5d                   	pop    %ebp
  10108b:	c3                   	ret    
  10108c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101091:	5d                   	pop    %ebp
  101092:	c3                   	ret    
  101093:	90                   	nop

00101094 <init_pcb>:
  101094:	55                   	push   %ebp
  101095:	89 e5                	mov    %esp,%ebp
  101097:	c7 05 c8 3c 10 00 05 	movl   $0x5,0x103cc8
  10109e:	00 00 00 
  1010a1:	ba 38 5d 10 00       	mov    $0x105d38,%edx
  1010a6:	31 c0                	xor    %eax,%eax
  1010a8:	89 02                	mov    %eax,(%edx)
  1010aa:	8d 48 ff             	lea    -0x1(%eax),%ecx
  1010ad:	89 4a 04             	mov    %ecx,0x4(%edx)
  1010b0:	40                   	inc    %eax
  1010b1:	89 42 08             	mov    %eax,0x8(%edx)
  1010b4:	81 c2 68 20 00 00    	add    $0x2068,%edx
  1010ba:	3d 00 08 00 00       	cmp    $0x800,%eax
  1010bf:	75 e7                	jne    1010a8 <init_pcb+0x14>
  1010c1:	c7 05 3c 5d 10 00 ff 	movl   $0x7ff,0x105d3c
  1010c8:	07 00 00 
  1010cb:	c7 05 d8 7c 13 01 00 	movl   $0x0,0x1137cd8
  1010d2:	00 00 00 
  1010d5:	5d                   	pop    %ebp
  1010d6:	c3                   	ret    
  1010d7:	90                   	nop

001010d8 <init_kernel_pcb>:
  1010d8:	55                   	push   %ebp
  1010d9:	89 e5                	mov    %esp,%ebp
  1010db:	c7 05 28 5d 10 00 10 	movl   $0x10,0x105d28
  1010e2:	00 00 00 
  1010e5:	c7 05 1c 5d 10 00 08 	movl   $0x8,0x105d1c
  1010ec:	00 00 00 
  1010ef:	c7 05 ec 5c 10 00 10 	movl   $0x10,0x105cec
  1010f6:	00 00 00 
  1010f9:	c7 05 18 5d 10 00 5c 	movl   $0x10085c,0x105d18
  101100:	08 10 00 
  101103:	c7 05 24 5d 10 00 00 	movl   $0x7f00000,0x105d24
  10110a:	00 f0 07 
  10110d:	c7 05 2c 5d 10 00 01 	movl   $0x1,0x105d2c
  101114:	00 00 00 
  101117:	c7 05 30 5d 10 00 04 	movl   $0x4,0x105d30
  10111e:	00 00 00 
  101121:	b8 01 00 00 00       	mov    $0x1,%eax
  101126:	5d                   	pop    %ebp
  101127:	c3                   	ret    

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
  101291:	e9 ee f2 ff ff       	jmp    100584 <sys_sleep>
  101296:	66 90                	xchg   %ax,%ax
  101298:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10129b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10129e:	c9                   	leave  
  10129f:	e9 10 f5 ff ff       	jmp    1007b4 <sys_write>
  1012a4:	83 ec 0c             	sub    $0xc,%esp
  1012a7:	53                   	push   %ebx
  1012a8:	e8 5b f3 ff ff       	call   100608 <sys_fork>
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
  1012c2:	e9 95 f2 ff ff       	jmp    10055c <sys_exit>
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
  1012e4:	6a 73                	push   $0x73
  1012e6:	68 99 1a 10 00       	push   $0x101a99
  1012eb:	68 ac 1a 10 00       	push   $0x101aac
  1012f0:	e8 43 03 00 00       	call   101638 <printk>
  1012f5:	83 c4 14             	add    $0x14,%esp
  1012f8:	68 a7 18 10 00       	push   $0x1018a7
  1012fd:	e8 36 03 00 00       	call   101638 <printk>
  101302:	5a                   	pop    %edx
  101303:	59                   	pop    %ecx
  101304:	6a 74                	push   $0x74
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
  101324:	e8 17 f5 ff ff       	call   100840 <putChar>
  101329:	e8 a6 f6 ff ff       	call   1009d4 <getpid>
  10132e:	89 c2                	mov    %eax,%edx
  101330:	c1 e2 07             	shl    $0x7,%edx
  101333:	01 c2                	add    %eax,%edx
  101335:	01 d2                	add    %edx,%edx
  101337:	01 c2                	add    %eax,%edx
  101339:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10133c:	ff 0c c5 30 5d 10 00 	decl   0x105d30(,%eax,8)
  101343:	e8 08 fd ff ff       	call   101050 <block_decrease>
  101348:	89 1c 24             	mov    %ebx,(%esp)
  10134b:	e8 90 fb ff ff       	call   100ee0 <checkTimeCount>
  101350:	83 c4 10             	add    $0x10,%esp
  101353:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  10135a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10135d:	c9                   	leave  
  10135e:	e9 dd f4 ff ff       	jmp    100840 <putChar>
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
  10139f:	e8 30 f6 ff ff       	call   1009d4 <getpid>
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
  101404:	e8 cb f5 ff ff       	call   1009d4 <getpid>
  101409:	39 c7                	cmp    %eax,%edi
  10140b:	74 d5                	je     1013e2 <irqHandle+0x7e>
  10140d:	e8 c2 f5 ff ff       	call   1009d4 <getpid>
  101412:	89 c2                	mov    %eax,%edx
  101414:	c1 e2 07             	shl    $0x7,%edx
  101417:	01 c2                	add    %eax,%edx
  101419:	01 d2                	add    %edx,%edx
  10141b:	01 c2                	add    %eax,%edx
  10141d:	8d 04 90             	lea    (%eax,%edx,4),%eax
  101420:	8d 1c c5 90 5c 10 00 	lea    0x105c90(,%eax,8),%ebx
  101427:	89 5e 08             	mov    %ebx,0x8(%esi)
  10142a:	e8 a5 f5 ff ff       	call   1009d4 <getpid>
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
  1016fc:	e8 3f f1 ff ff       	call   100840 <putChar>
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
  10182e:	e8 0d f0 ff ff       	call   100840 <putChar>
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
