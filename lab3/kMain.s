
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 41 15 00 00       	call   10154c <initTimer>
  10000b:	e8 88 10 00 00       	call   101098 <init_pcb>
  100010:	e8 c7 10 00 00       	call   1010dc <init_kernel_pcb>
  100015:	e8 ea 07 00 00       	call   100804 <initSerial>
  10001a:	e8 7d 11 00 00       	call   10119c <initIdt>
  10001f:	e8 d0 14 00 00       	call   1014f4 <initIntr>
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
  10008f:	66 c7 05 80 34 10 00 	movw   $0x37,0x103480
  100096:	37 00 
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
  100133:	68 b4 18 10 00       	push   $0x1018b4
  100138:	e8 37 15 00 00       	call   101674 <printk>
  10013d:	89 1c 24             	mov    %ebx,(%esp)
  100140:	68 f4 18 10 00       	push   $0x1018f4
  100145:	6a 18                	push   $0x18
  100147:	68 ba 18 10 00       	push   $0x1018ba
  10014c:	68 c7 18 10 00       	push   $0x1018c7
  100151:	e8 1e 15 00 00       	call   101674 <printk>
  100156:	83 c4 14             	add    $0x14,%esp
  100159:	68 e3 18 10 00       	push   $0x1018e3
  10015e:	e8 11 15 00 00       	call   101674 <printk>
  100163:	58                   	pop    %eax
  100164:	5a                   	pop    %edx
  100165:	6a 19                	push   $0x19
  100167:	68 ba 18 10 00       	push   $0x1018ba
  10016c:	e8 77 16 00 00       	call   1017e8 <abort>
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
  100341:	b8 60 7d 13 01       	mov    $0x1137d60,%eax
  100346:	66 a3 4a 7d 13 01    	mov    %ax,0x1137d4a
  10034c:	89 c2                	mov    %eax,%edx
  10034e:	c1 ea 10             	shr    $0x10,%edx
  100351:	88 15 4c 7d 13 01    	mov    %dl,0x1137d4c
  100357:	c6 05 4d 7d 13 01 89 	movb   $0x89,0x1137d4d
  10035e:	c6 05 4e 7d 13 01 40 	movb   $0x40,0x1137d4e
  100365:	c1 e8 18             	shr    $0x18,%eax
  100368:	a2 4f 7d 13 01       	mov    %al,0x1137d4f
  10036d:	a1 ec 18 10 00       	mov    0x1018ec,%eax
  100372:	8b 15 f0 18 10 00    	mov    0x1018f0,%edx
  100378:	a3 50 7d 13 01       	mov    %eax,0x1137d50
  10037d:	89 15 54 7d 13 01    	mov    %edx,0x1137d54
  100383:	66 c7 05 80 34 10 00 	movw   $0x37,0x103480
  10038a:	37 00 
  10038c:	66 89 0d 82 34 10 00 	mov    %cx,0x103482
  100393:	c1 e9 10             	shr    $0x10,%ecx
  100396:	66 89 0d 84 34 10 00 	mov    %cx,0x103484
  10039d:	b8 80 34 10 00       	mov    $0x103480,%eax
  1003a2:	0f 01 10             	lgdtl  (%eax)
  1003a5:	a1 68 5d 10 00       	mov    0x105d68,%eax
  1003aa:	a3 68 7d 13 01       	mov    %eax,0x1137d68
  1003af:	c7 05 64 7d 13 01 1c 	movl   $0x105d1c,0x1137d64
  1003b6:	5d 10 00 
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
  100401:	8d 04 c5 20 3d 10 00 	lea    0x103d20(,%eax,8),%eax
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
  10042e:	c7 05 04 3d 10 00 01 	movl   $0x1,0x103d04
  100435:	00 00 00 
  100438:	c7 05 d0 7d 10 00 23 	movl   $0x23,0x107dd0
  10043f:	00 00 00 
  100442:	c7 05 c4 7d 10 00 1b 	movl   $0x1b,0x107dc4
  100449:	00 00 00 
  10044c:	c7 05 94 7d 10 00 23 	movl   $0x23,0x107d94
  100453:	00 00 00 
  100456:	c7 05 90 7d 10 00 23 	movl   $0x23,0x107d90
  10045d:	00 00 00 
  100460:	c7 05 8c 7d 10 00 23 	movl   $0x23,0x107d8c
  100467:	00 00 00 
  10046a:	c7 05 cc 7d 10 00 00 	movl   $0x401000,0x107dcc
  100471:	10 40 00 
  100474:	8b 45 08             	mov    0x8(%ebp),%eax
  100477:	a3 c0 7d 10 00       	mov    %eax,0x107dc0
  10047c:	c7 05 d8 7d 10 00 0a 	movl   $0xa,0x107dd8
  100483:	00 00 00 
  100486:	6a 00                	push   $0x0
  100488:	6a 01                	push   $0x1
  10048a:	e8 39 06 00 00       	call   100ac8 <put_into_runnable>
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
  10055a:	68 ff 18 10 00       	push   $0x1018ff
  10055f:	e8 10 11 00 00       	call   101674 <printk>
  100564:	e8 9f 04 00 00       	call   100a08 <get_from_runnable>
  100569:	5a                   	pop    %edx
  10056a:	59                   	pop    %ecx
  10056b:	ff 75 08             	pushl  0x8(%ebp)
  10056e:	50                   	push   %eax
  10056f:	e8 f4 02 00 00       	call   100868 <put_into_running>
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
  100584:	e8 4f 04 00 00       	call   1009d8 <getpid>
  100589:	83 ec 08             	sub    $0x8,%esp
  10058c:	53                   	push   %ebx
  10058d:	50                   	push   %eax
  10058e:	e8 69 06 00 00       	call   100bfc <put_into_block>
  100593:	c7 04 24 b4 18 10 00 	movl   $0x1018b4,(%esp)
  10059a:	e8 d5 10 00 00       	call   101674 <printk>
  10059f:	e8 34 04 00 00       	call   1009d8 <getpid>
  1005a4:	89 c2                	mov    %eax,%edx
  1005a6:	c1 e2 07             	shl    $0x7,%edx
  1005a9:	01 c2                	add    %eax,%edx
  1005ab:	01 d2                	add    %edx,%edx
  1005ad:	01 c2                	add    %eax,%edx
  1005af:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1005b2:	8b 34 c5 74 5d 10 00 	mov    0x105d74(,%eax,8),%esi
  1005b9:	e8 1a 04 00 00       	call   1009d8 <getpid>
  1005be:	5a                   	pop    %edx
  1005bf:	59                   	pop    %ecx
  1005c0:	56                   	push   %esi
  1005c1:	50                   	push   %eax
  1005c2:	68 50 19 10 00       	push   $0x101950
  1005c7:	6a 09                	push   $0x9
  1005c9:	68 0d 19 10 00       	push   $0x10190d
  1005ce:	68 2c 19 10 00       	push   $0x10192c
  1005d3:	e8 9c 10 00 00       	call   101674 <printk>
  1005d8:	83 c4 14             	add    $0x14,%esp
  1005db:	68 e3 18 10 00       	push   $0x1018e3
  1005e0:	e8 8f 10 00 00       	call   101674 <printk>
  1005e5:	e8 1e 04 00 00       	call   100a08 <get_from_runnable>
  1005ea:	5e                   	pop    %esi
  1005eb:	5a                   	pop    %edx
  1005ec:	53                   	push   %ebx
  1005ed:	50                   	push   %eax
  1005ee:	e8 75 02 00 00       	call   100868 <put_into_running>
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
  10060c:	68 5a 19 10 00       	push   $0x10195a
  100611:	e8 5e 10 00 00       	call   101674 <printk>
  100616:	83 c4 10             	add    $0x10,%esp
  100619:	31 db                	xor    %ebx,%ebx
  10061b:	90                   	nop
  10061c:	e8 b7 03 00 00       	call   1009d8 <getpid>
  100621:	89 c2                	mov    %eax,%edx
  100623:	c1 e2 07             	shl    $0x7,%edx
  100626:	01 c2                	add    %eax,%edx
  100628:	01 d2                	add    %edx,%edx
  10062a:	01 c2                	add    %eax,%edx
  10062c:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10062f:	01 c0                	add    %eax,%eax
  100631:	01 d8                	add    %ebx,%eax
  100633:	8b 04 85 20 3d 10 00 	mov    0x103d20(,%eax,4),%eax
  10063a:	89 04 9d f0 7d 10 00 	mov    %eax,0x107df0(,%ebx,4)
  100641:	43                   	inc    %ebx
  100642:	81 fb 00 08 00 00    	cmp    $0x800,%ebx
  100648:	75 d2                	jne    10061c <sys_fork+0x1c>
  10064a:	e8 89 03 00 00       	call   1009d8 <getpid>
  10064f:	8d 90 00 04 00 00    	lea    0x400(%eax),%edx
  100655:	c1 e2 0c             	shl    $0xc,%edx
  100658:	b8 00 10 00 00       	mov    $0x1000,%eax
  10065d:	8d 76 00             	lea    0x0(%esi),%esi
  100660:	8a 8c 10 00 f0 ff ff 	mov    -0x1000(%eax,%edx,1),%cl
  100667:	88 88 00 10 40 00    	mov    %cl,0x401000(%eax)
  10066d:	48                   	dec    %eax
  10066e:	75 f0                	jne    100660 <sys_fork+0x60>
  100670:	b8 f0 9d 10 00       	mov    $0x109df0,%eax
  100675:	b9 13 00 00 00       	mov    $0x13,%ecx
  10067a:	89 c7                	mov    %eax,%edi
  10067c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10067e:	c7 05 1c 9e 10 00 00 	movl   $0x0,0x109e1c
  100685:	00 00 00 
  100688:	c7 05 34 9e 10 00 00 	movl   $0x402000,0x109e34
  10068f:	20 40 00 
  100692:	83 ec 08             	sub    $0x8,%esp
  100695:	50                   	push   %eax
  100696:	6a 02                	push   $0x2
  100698:	e8 2b 04 00 00       	call   100ac8 <put_into_runnable>
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
  1006b9:	8b 15 88 34 10 00    	mov    0x103488,%edx
  1006bf:	8b 0d 8c 34 10 00    	mov    0x10348c,%ecx
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
  1006e7:	c7 05 88 34 10 00 00 	movl   $0x0,0x103488
  1006ee:	00 00 00 
  1006f1:	41                   	inc    %ecx
  1006f2:	89 0d 8c 34 10 00    	mov    %ecx,0x10348c
  1006f8:	b8 01 00 00 00       	mov    $0x1,%eax
  1006fd:	5b                   	pop    %ebx
  1006fe:	5f                   	pop    %edi
  1006ff:	5d                   	pop    %ebp
  100700:	c3                   	ret    
  100701:	8d 76 00             	lea    0x0(%esi),%esi
  100704:	89 15 88 34 10 00    	mov    %edx,0x103488
  10070a:	b8 01 00 00 00       	mov    $0x1,%eax
  10070f:	5b                   	pop    %ebx
  100710:	5f                   	pop    %edi
  100711:	5d                   	pop    %ebp
  100712:	c3                   	ret    
  100713:	90                   	nop
  100714:	c7 05 88 34 10 00 00 	movl   $0x0,0x103488
  10071b:	00 00 00 
  10071e:	ff 05 8c 34 10 00    	incl   0x10348c
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
  100744:	e8 fb 00 00 00       	call   100844 <putChar>
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
  10077d:	8b 45 08             	mov    0x8(%ebp),%eax
  100780:	48                   	dec    %eax
  100781:	83 f8 01             	cmp    $0x1,%eax
  100784:	76 12                	jbe    100798 <fs_write+0x2c>
  100786:	83 ec 08             	sub    $0x8,%esp
  100789:	6a 27                	push   $0x27
  10078b:	68 76 19 10 00       	push   $0x101976
  100790:	e8 53 10 00 00       	call   1017e8 <abort>
  100795:	83 c4 10             	add    $0x10,%esp
  100798:	83 ec 08             	sub    $0x8,%esp
  10079b:	53                   	push   %ebx
  10079c:	ff 75 0c             	pushl  0xc(%ebp)
  10079f:	e8 8c ff ff ff       	call   100730 <printkernel>
  1007a4:	89 d8                	mov    %ebx,%eax
  1007a6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1007a9:	c9                   	leave  
  1007aa:	c3                   	ret    
  1007ab:	90                   	nop

001007ac <sys_write>:
  1007ac:	55                   	push   %ebp
  1007ad:	89 e5                	mov    %esp,%ebp
  1007af:	56                   	push   %esi
  1007b0:	53                   	push   %ebx
  1007b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1007b4:	8b 73 24             	mov    0x24(%ebx),%esi
  1007b7:	e8 1c 02 00 00       	call   1009d8 <getpid>
  1007bc:	52                   	push   %edx
  1007bd:	56                   	push   %esi
  1007be:	c1 e0 0c             	shl    $0xc,%eax
  1007c1:	03 43 28             	add    0x28(%ebx),%eax
  1007c4:	50                   	push   %eax
  1007c5:	ff 73 20             	pushl  0x20(%ebx)
  1007c8:	e8 9f ff ff ff       	call   10076c <fs_write>
  1007cd:	89 43 2c             	mov    %eax,0x2c(%ebx)
  1007d0:	83 c4 10             	add    $0x10,%esp
  1007d3:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1007d6:	5b                   	pop    %ebx
  1007d7:	5e                   	pop    %esi
  1007d8:	5d                   	pop    %ebp
  1007d9:	c3                   	ret    
  1007da:	66 90                	xchg   %ax,%ax

001007dc <print_char>:
  1007dc:	55                   	push   %ebp
  1007dd:	89 e5                	mov    %esp,%ebp
  1007df:	57                   	push   %edi
  1007e0:	8b 45 08             	mov    0x8(%ebp),%eax
  1007e3:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1007e6:	c1 e0 04             	shl    $0x4,%eax
  1007e9:	03 45 0c             	add    0xc(%ebp),%eax
  1007ec:	01 c0                	add    %eax,%eax
  1007ee:	89 c7                	mov    %eax,%edi
  1007f0:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  1007f4:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  1007fa:	66 89 d0             	mov    %dx,%ax
  1007fd:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100801:	5f                   	pop    %edi
  100802:	5d                   	pop    %ebp
  100803:	c3                   	ret    

00100804 <initSerial>:
  100804:	55                   	push   %ebp
  100805:	89 e5                	mov    %esp,%ebp
  100807:	ba f9 03 00 00       	mov    $0x3f9,%edx
  10080c:	31 c0                	xor    %eax,%eax
  10080e:	ee                   	out    %al,(%dx)
  10080f:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100814:	b0 80                	mov    $0x80,%al
  100816:	ee                   	out    %al,(%dx)
  100817:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10081c:	b0 01                	mov    $0x1,%al
  10081e:	ee                   	out    %al,(%dx)
  10081f:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100824:	31 c0                	xor    %eax,%eax
  100826:	ee                   	out    %al,(%dx)
  100827:	ba fb 03 00 00       	mov    $0x3fb,%edx
  10082c:	b0 03                	mov    $0x3,%al
  10082e:	ee                   	out    %al,(%dx)
  10082f:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100834:	b0 c7                	mov    $0xc7,%al
  100836:	ee                   	out    %al,(%dx)
  100837:	ba fc 03 00 00       	mov    $0x3fc,%edx
  10083c:	b0 0b                	mov    $0xb,%al
  10083e:	ee                   	out    %al,(%dx)
  10083f:	5d                   	pop    %ebp
  100840:	c3                   	ret    
  100841:	8d 76 00             	lea    0x0(%esi),%esi

00100844 <putChar>:
  100844:	55                   	push   %ebp
  100845:	89 e5                	mov    %esp,%ebp
  100847:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10084a:	ba fd 03 00 00       	mov    $0x3fd,%edx
  10084f:	90                   	nop
  100850:	ec                   	in     (%dx),%al
  100851:	a8 20                	test   $0x20,%al
  100853:	74 fb                	je     100850 <putChar+0xc>
  100855:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10085a:	88 c8                	mov    %cl,%al
  10085c:	ee                   	out    %al,(%dx)
  10085d:	5d                   	pop    %ebp
  10085e:	c3                   	ret    
  10085f:	90                   	nop

00100860 <IDLE>:
  100860:	55                   	push   %ebp
  100861:	89 e5                	mov    %esp,%ebp
  100863:	90                   	nop
  100864:	f4                   	hlt    
  100865:	eb fd                	jmp    100864 <IDLE+0x4>
  100867:	90                   	nop

00100868 <put_into_running>:
  100868:	55                   	push   %ebp
  100869:	89 e5                	mov    %esp,%ebp
  10086b:	53                   	push   %ebx
  10086c:	81 ec d4 00 00 00    	sub    $0xd4,%esp
  100872:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100875:	39 1d 00 3d 10 00    	cmp    %ebx,0x103d00
  10087b:	0f 84 a9 00 00 00    	je     10092a <put_into_running+0xc2>
  100881:	89 1d 00 3d 10 00    	mov    %ebx,0x103d00
  100887:	85 db                	test   %ebx,%ebx
  100889:	0f 84 a5 00 00 00    	je     100934 <put_into_running+0xcc>
  10088f:	83 fb 02             	cmp    $0x2,%ebx
  100892:	0f 84 dc 00 00 00    	je     100974 <put_into_running+0x10c>
  100898:	89 da                	mov    %ebx,%edx
  10089a:	83 ec 08             	sub    $0x8,%esp
  10089d:	89 d0                	mov    %edx,%eax
  10089f:	c1 e0 07             	shl    $0x7,%eax
  1008a2:	01 d0                	add    %edx,%eax
  1008a4:	01 c0                	add    %eax,%eax
  1008a6:	01 d0                	add    %edx,%eax
  1008a8:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1008ab:	8d 04 c5 1c 5d 10 00 	lea    0x105d1c(,%eax,8),%eax
  1008b2:	50                   	push   %eax
  1008b3:	6a 10                	push   $0x10
  1008b5:	e8 fa f8 ff ff       	call   1001b4 <change_tss>
  1008ba:	8d 45 94             	lea    -0x6c(%ebp),%eax
  1008bd:	89 04 24             	mov    %eax,(%esp)
  1008c0:	e8 0b f9 ff ff       	call   1001d0 <get_tss>
  1008c5:	89 d8                	mov    %ebx,%eax
  1008c7:	c1 e0 07             	shl    $0x7,%eax
  1008ca:	01 d8                	add    %ebx,%eax
  1008cc:	01 c0                	add    %eax,%eax
  1008ce:	01 d8                	add    %ebx,%eax
  1008d0:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1008d3:	8d 04 c5 1c 5d 10 00 	lea    0x105d1c(,%eax,8),%eax
  1008da:	83 c4 0c             	add    $0xc,%esp
  1008dd:	39 45 98             	cmp    %eax,-0x68(%ebp)
  1008e0:	74 12                	je     1008f4 <put_into_running+0x8c>
  1008e2:	83 ec 08             	sub    $0x8,%esp
  1008e5:	6a 21                	push   $0x21
  1008e7:	68 92 19 10 00       	push   $0x101992
  1008ec:	e8 f7 0e 00 00       	call   1017e8 <abort>
  1008f1:	83 c4 10             	add    $0x10,%esp
  1008f4:	83 ec 0c             	sub    $0xc,%esp
  1008f7:	68 b4 18 10 00       	push   $0x1018b4
  1008fc:	e8 73 0d 00 00       	call   101674 <printk>
  100901:	89 1c 24             	mov    %ebx,(%esp)
  100904:	68 c4 1a 10 00       	push   $0x101ac4
  100909:	6a 24                	push   $0x24
  10090b:	68 92 19 10 00       	push   $0x101992
  100910:	68 a0 19 10 00       	push   $0x1019a0
  100915:	e8 5a 0d 00 00       	call   101674 <printk>
  10091a:	83 c4 14             	add    $0x14,%esp
  10091d:	68 e3 18 10 00       	push   $0x1018e3
  100922:	e8 4d 0d 00 00       	call   101674 <printk>
  100927:	83 c4 10             	add    $0x10,%esp
  10092a:	b8 01 00 00 00       	mov    $0x1,%eax
  10092f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100932:	c9                   	leave  
  100933:	c3                   	ret    
  100934:	83 ec 08             	sub    $0x8,%esp
  100937:	68 1c 5d 10 00       	push   $0x105d1c
  10093c:	6a 10                	push   $0x10
  10093e:	e8 71 f8 ff ff       	call   1001b4 <change_tss>
  100943:	8d 85 30 ff ff ff    	lea    -0xd0(%ebp),%eax
  100949:	89 04 24             	mov    %eax,(%esp)
  10094c:	e8 7f f8 ff ff       	call   1001d0 <get_tss>
  100951:	83 c4 0c             	add    $0xc,%esp
  100954:	81 bd 34 ff ff ff 1c 	cmpl   $0x105d1c,-0xcc(%ebp)
  10095b:	5d 10 00 
  10095e:	74 94                	je     1008f4 <put_into_running+0x8c>
  100960:	83 ec 08             	sub    $0x8,%esp
  100963:	6a 14                	push   $0x14
  100965:	68 92 19 10 00       	push   $0x101992
  10096a:	e8 79 0e 00 00       	call   1017e8 <abort>
  10096f:	83 c4 10             	add    $0x10,%esp
  100972:	eb 80                	jmp    1008f4 <put_into_running+0x8c>
  100974:	83 ec 0c             	sub    $0xc,%esp
  100977:	68 b4 18 10 00       	push   $0x1018b4
  10097c:	e8 f3 0c 00 00       	call   101674 <printk>
  100981:	58                   	pop    %eax
  100982:	5a                   	pop    %edx
  100983:	ff 35 d0 7d 10 00    	pushl  0x107dd0
  100989:	ff 35 cc 7d 10 00    	pushl  0x107dcc
  10098f:	68 c4 1a 10 00       	push   $0x101ac4
  100994:	6a 1c                	push   $0x1c
  100996:	68 92 19 10 00       	push   $0x101992
  10099b:	68 d8 19 10 00       	push   $0x1019d8
  1009a0:	e8 cf 0c 00 00       	call   101674 <printk>
  1009a5:	83 c4 14             	add    $0x14,%esp
  1009a8:	68 e3 18 10 00       	push   $0x1018e3
  1009ad:	e8 c2 0c 00 00       	call   101674 <printk>
  1009b2:	8b 15 00 3d 10 00    	mov    0x103d00,%edx
  1009b8:	83 c4 10             	add    $0x10,%esp
  1009bb:	e9 da fe ff ff       	jmp    10089a <put_into_running+0x32>

001009c0 <update_block>:
  1009c0:	55                   	push   %ebp
  1009c1:	89 e5                	mov    %esp,%ebp
  1009c3:	b8 01 00 00 00       	mov    $0x1,%eax
  1009c8:	5d                   	pop    %ebp
  1009c9:	c3                   	ret    
  1009ca:	66 90                	xchg   %ax,%ax

001009cc <apply_new_pid>:
  1009cc:	55                   	push   %ebp
  1009cd:	89 e5                	mov    %esp,%ebp
  1009cf:	b8 02 00 00 00       	mov    $0x2,%eax
  1009d4:	5d                   	pop    %ebp
  1009d5:	c3                   	ret    
  1009d6:	66 90                	xchg   %ax,%ax

001009d8 <getpid>:
  1009d8:	55                   	push   %ebp
  1009d9:	89 e5                	mov    %esp,%ebp
  1009db:	a1 00 3d 10 00       	mov    0x103d00,%eax
  1009e0:	5d                   	pop    %ebp
  1009e1:	c3                   	ret    
  1009e2:	66 90                	xchg   %ax,%ax

001009e4 <getrunnable>:
  1009e4:	55                   	push   %ebp
  1009e5:	89 e5                	mov    %esp,%ebp
  1009e7:	a1 64 33 10 00       	mov    0x103364,%eax
  1009ec:	5d                   	pop    %ebp
  1009ed:	c3                   	ret    
  1009ee:	66 90                	xchg   %ax,%ax

001009f0 <getblocked>:
  1009f0:	55                   	push   %ebp
  1009f1:	89 e5                	mov    %esp,%ebp
  1009f3:	a1 60 33 10 00       	mov    0x103360,%eax
  1009f8:	5d                   	pop    %ebp
  1009f9:	c3                   	ret    
  1009fa:	66 90                	xchg   %ax,%ax

001009fc <transfer_pid_mode>:
  1009fc:	55                   	push   %ebp
  1009fd:	89 e5                	mov    %esp,%ebp
  1009ff:	b8 01 00 00 00       	mov    $0x1,%eax
  100a04:	5d                   	pop    %ebp
  100a05:	c3                   	ret    
  100a06:	66 90                	xchg   %ax,%ax

00100a08 <get_from_runnable>:
  100a08:	55                   	push   %ebp
  100a09:	89 e5                	mov    %esp,%ebp
  100a0b:	53                   	push   %ebx
  100a0c:	51                   	push   %ecx
  100a0d:	8b 1d 64 33 10 00    	mov    0x103364,%ebx
  100a13:	83 fb ff             	cmp    $0xffffffff,%ebx
  100a16:	0f 84 a4 00 00 00    	je     100ac0 <get_from_runnable+0xb8>
  100a1c:	89 d8                	mov    %ebx,%eax
  100a1e:	c1 e0 07             	shl    $0x7,%eax
  100a21:	01 d8                	add    %ebx,%eax
  100a23:	01 c0                	add    %eax,%eax
  100a25:	01 d8                	add    %ebx,%eax
  100a27:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100a2a:	8d 04 c5 20 3d 10 00 	lea    0x103d20(,%eax,8),%eax
  100a31:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100a37:	39 da                	cmp    %ebx,%edx
  100a39:	74 79                	je     100ab4 <get_from_runnable+0xac>
  100a3b:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100a41:	89 c8                	mov    %ecx,%eax
  100a43:	c1 e0 07             	shl    $0x7,%eax
  100a46:	01 c8                	add    %ecx,%eax
  100a48:	01 c0                	add    %eax,%eax
  100a4a:	01 c8                	add    %ecx,%eax
  100a4c:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100a4f:	89 14 c5 80 5d 10 00 	mov    %edx,0x105d80(,%eax,8)
  100a56:	89 d0                	mov    %edx,%eax
  100a58:	c1 e0 07             	shl    $0x7,%eax
  100a5b:	01 d0                	add    %edx,%eax
  100a5d:	01 c0                	add    %eax,%eax
  100a5f:	01 d0                	add    %edx,%eax
  100a61:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100a64:	89 0c c5 7c 5d 10 00 	mov    %ecx,0x105d7c(,%eax,8)
  100a6b:	89 15 64 33 10 00    	mov    %edx,0x103364
  100a71:	83 ec 0c             	sub    $0xc,%esp
  100a74:	68 b4 18 10 00       	push   $0x1018b4
  100a79:	e8 f6 0b 00 00       	call   101674 <printk>
  100a7e:	58                   	pop    %eax
  100a7f:	5a                   	pop    %edx
  100a80:	ff 35 64 33 10 00    	pushl  0x103364
  100a86:	53                   	push   %ebx
  100a87:	68 a0 1a 10 00       	push   $0x101aa0
  100a8c:	6a 74                	push   $0x74
  100a8e:	68 92 19 10 00       	push   $0x101992
  100a93:	68 08 1a 10 00       	push   $0x101a08
  100a98:	e8 d7 0b 00 00       	call   101674 <printk>
  100a9d:	83 c4 14             	add    $0x14,%esp
  100aa0:	68 e3 18 10 00       	push   $0x1018e3
  100aa5:	e8 ca 0b 00 00       	call   101674 <printk>
  100aaa:	83 c4 10             	add    $0x10,%esp
  100aad:	89 d8                	mov    %ebx,%eax
  100aaf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100ab2:	c9                   	leave  
  100ab3:	c3                   	ret    
  100ab4:	c7 05 64 33 10 00 ff 	movl   $0xffffffff,0x103364
  100abb:	ff ff ff 
  100abe:	eb b1                	jmp    100a71 <get_from_runnable+0x69>
  100ac0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100ac5:	eb e8                	jmp    100aaf <get_from_runnable+0xa7>
  100ac7:	90                   	nop

00100ac8 <put_into_runnable>:
  100ac8:	55                   	push   %ebp
  100ac9:	89 e5                	mov    %esp,%ebp
  100acb:	56                   	push   %esi
  100acc:	53                   	push   %ebx
  100acd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100ad0:	8b 15 64 33 10 00    	mov    0x103364,%edx
  100ad6:	83 fa ff             	cmp    $0xffffffff,%edx
  100ad9:	0f 84 f1 00 00 00    	je     100bd0 <put_into_runnable+0x108>
  100adf:	89 d0                	mov    %edx,%eax
  100ae1:	c1 e0 07             	shl    $0x7,%eax
  100ae4:	01 d0                	add    %edx,%eax
  100ae6:	01 c0                	add    %eax,%eax
  100ae8:	01 d0                	add    %edx,%eax
  100aea:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100aed:	8d 34 c5 20 3d 10 00 	lea    0x103d20(,%eax,8),%esi
  100af4:	8b 8e 5c 20 00 00    	mov    0x205c(%esi),%ecx
  100afa:	89 c8                	mov    %ecx,%eax
  100afc:	c1 e0 07             	shl    $0x7,%eax
  100aff:	01 c8                	add    %ecx,%eax
  100b01:	01 c0                	add    %eax,%eax
  100b03:	01 c8                	add    %ecx,%eax
  100b05:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100b08:	89 1c c5 80 5d 10 00 	mov    %ebx,0x105d80(,%eax,8)
  100b0f:	89 d8                	mov    %ebx,%eax
  100b11:	c1 e0 07             	shl    $0x7,%eax
  100b14:	01 d8                	add    %ebx,%eax
  100b16:	01 c0                	add    %eax,%eax
  100b18:	01 d8                	add    %ebx,%eax
  100b1a:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b1d:	8d 04 c5 20 3d 10 00 	lea    0x103d20(,%eax,8),%eax
  100b24:	89 88 5c 20 00 00    	mov    %ecx,0x205c(%eax)
  100b2a:	89 90 60 20 00 00    	mov    %edx,0x2060(%eax)
  100b30:	89 9e 5c 20 00 00    	mov    %ebx,0x205c(%esi)
  100b36:	89 d8                	mov    %ebx,%eax
  100b38:	c1 e0 07             	shl    $0x7,%eax
  100b3b:	01 d8                	add    %ebx,%eax
  100b3d:	01 c0                	add    %eax,%eax
  100b3f:	01 d8                	add    %ebx,%eax
  100b41:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b44:	c7 04 c5 6c 5d 10 00 	movl   $0x1,0x105d6c(,%eax,8)
  100b4b:	01 00 00 00 
  100b4f:	85 db                	test   %ebx,%ebx
  100b51:	75 0a                	jne    100b5d <put_into_runnable+0x95>
  100b53:	c7 05 58 5d 10 00 60 	movl   $0x100860,0x105d58
  100b5a:	08 10 00 
  100b5d:	83 ec 0c             	sub    $0xc,%esp
  100b60:	68 b4 18 10 00       	push   $0x1018b4
  100b65:	e8 0a 0b 00 00       	call   101674 <printk>
  100b6a:	58                   	pop    %eax
  100b6b:	5a                   	pop    %edx
  100b6c:	53                   	push   %ebx
  100b6d:	ff 35 64 33 10 00    	pushl  0x103364
  100b73:	68 8c 1a 10 00       	push   $0x101a8c
  100b78:	68 90 00 00 00       	push   $0x90
  100b7d:	68 92 19 10 00       	push   $0x101992
  100b82:	68 3c 1a 10 00       	push   $0x101a3c
  100b87:	e8 e8 0a 00 00       	call   101674 <printk>
  100b8c:	83 c4 14             	add    $0x14,%esp
  100b8f:	68 e3 18 10 00       	push   $0x1018e3
  100b94:	e8 db 0a 00 00       	call   101674 <printk>
  100b99:	89 d8                	mov    %ebx,%eax
  100b9b:	c1 e0 07             	shl    $0x7,%eax
  100b9e:	01 d8                	add    %ebx,%eax
  100ba0:	01 c0                	add    %eax,%eax
  100ba2:	01 d8                	add    %ebx,%eax
  100ba4:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100ba7:	8d 04 c5 20 3d 10 00 	lea    0x103d20(,%eax,8),%eax
  100bae:	8b 15 08 3d 10 00    	mov    0x103d08,%edx
  100bb4:	89 90 50 20 00 00    	mov    %edx,0x2050(%eax)
  100bba:	8b 55 0c             	mov    0xc(%ebp),%edx
  100bbd:	89 90 64 20 00 00    	mov    %edx,0x2064(%eax)
  100bc3:	b8 01 00 00 00       	mov    $0x1,%eax
  100bc8:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100bcb:	5b                   	pop    %ebx
  100bcc:	5e                   	pop    %esi
  100bcd:	5d                   	pop    %ebp
  100bce:	c3                   	ret    
  100bcf:	90                   	nop
  100bd0:	89 1d 64 33 10 00    	mov    %ebx,0x103364
  100bd6:	89 d8                	mov    %ebx,%eax
  100bd8:	c1 e0 07             	shl    $0x7,%eax
  100bdb:	01 d8                	add    %ebx,%eax
  100bdd:	01 c0                	add    %eax,%eax
  100bdf:	01 d8                	add    %ebx,%eax
  100be1:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100be4:	8d 04 c5 20 3d 10 00 	lea    0x103d20(,%eax,8),%eax
  100beb:	89 98 5c 20 00 00    	mov    %ebx,0x205c(%eax)
  100bf1:	89 98 60 20 00 00    	mov    %ebx,0x2060(%eax)
  100bf7:	e9 3a ff ff ff       	jmp    100b36 <put_into_runnable+0x6e>

00100bfc <put_into_block>:
  100bfc:	55                   	push   %ebp
  100bfd:	89 e5                	mov    %esp,%ebp
  100bff:	57                   	push   %edi
  100c00:	56                   	push   %esi
  100c01:	53                   	push   %ebx
  100c02:	8b 45 08             	mov    0x8(%ebp),%eax
  100c05:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100c08:	8b 0d 60 33 10 00    	mov    0x103360,%ecx
  100c0e:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100c11:	0f 84 99 00 00 00    	je     100cb0 <put_into_block+0xb4>
  100c17:	89 ca                	mov    %ecx,%edx
  100c19:	c1 e2 07             	shl    $0x7,%edx
  100c1c:	01 ca                	add    %ecx,%edx
  100c1e:	01 d2                	add    %edx,%edx
  100c20:	01 ca                	add    %ecx,%edx
  100c22:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100c25:	8d 3c d5 20 3d 10 00 	lea    0x103d20(,%edx,8),%edi
  100c2c:	8b b7 5c 20 00 00    	mov    0x205c(%edi),%esi
  100c32:	89 f2                	mov    %esi,%edx
  100c34:	c1 e2 07             	shl    $0x7,%edx
  100c37:	01 f2                	add    %esi,%edx
  100c39:	01 d2                	add    %edx,%edx
  100c3b:	01 f2                	add    %esi,%edx
  100c3d:	8d 14 96             	lea    (%esi,%edx,4),%edx
  100c40:	89 04 d5 80 5d 10 00 	mov    %eax,0x105d80(,%edx,8)
  100c47:	89 c2                	mov    %eax,%edx
  100c49:	c1 e2 07             	shl    $0x7,%edx
  100c4c:	01 c2                	add    %eax,%edx
  100c4e:	01 d2                	add    %edx,%edx
  100c50:	01 c2                	add    %eax,%edx
  100c52:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c55:	8d 14 d5 20 3d 10 00 	lea    0x103d20(,%edx,8),%edx
  100c5c:	89 b2 5c 20 00 00    	mov    %esi,0x205c(%edx)
  100c62:	89 8a 60 20 00 00    	mov    %ecx,0x2060(%edx)
  100c68:	89 87 5c 20 00 00    	mov    %eax,0x205c(%edi)
  100c6e:	89 c2                	mov    %eax,%edx
  100c70:	c1 e2 07             	shl    $0x7,%edx
  100c73:	01 c2                	add    %eax,%edx
  100c75:	01 d2                	add    %edx,%edx
  100c77:	01 c2                	add    %eax,%edx
  100c79:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c7c:	c1 e2 03             	shl    $0x3,%edx
  100c7f:	8d 82 20 5d 10 00    	lea    0x105d20(%edx),%eax
  100c85:	b9 13 00 00 00       	mov    $0x13,%ecx
  100c8a:	89 c7                	mov    %eax,%edi
  100c8c:	89 de                	mov    %ebx,%esi
  100c8e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100c90:	8b 43 20             	mov    0x20(%ebx),%eax
  100c93:	89 82 74 5d 10 00    	mov    %eax,0x105d74(%edx)
  100c99:	c7 82 6c 5d 10 00 00 	movl   $0x0,0x105d6c(%edx)
  100ca0:	00 00 00 
  100ca3:	b8 01 00 00 00       	mov    $0x1,%eax
  100ca8:	5b                   	pop    %ebx
  100ca9:	5e                   	pop    %esi
  100caa:	5f                   	pop    %edi
  100cab:	5d                   	pop    %ebp
  100cac:	c3                   	ret    
  100cad:	8d 76 00             	lea    0x0(%esi),%esi
  100cb0:	a3 60 33 10 00       	mov    %eax,0x103360
  100cb5:	89 c2                	mov    %eax,%edx
  100cb7:	c1 e2 07             	shl    $0x7,%edx
  100cba:	01 c2                	add    %eax,%edx
  100cbc:	01 d2                	add    %edx,%edx
  100cbe:	01 c2                	add    %eax,%edx
  100cc0:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100cc3:	8d 14 d5 20 3d 10 00 	lea    0x103d20(,%edx,8),%edx
  100cca:	89 82 60 20 00 00    	mov    %eax,0x2060(%edx)
  100cd0:	89 82 5c 20 00 00    	mov    %eax,0x205c(%edx)
  100cd6:	eb 96                	jmp    100c6e <put_into_block+0x72>

00100cd8 <get_from>:
  100cd8:	55                   	push   %ebp
  100cd9:	89 e5                	mov    %esp,%ebp
  100cdb:	56                   	push   %esi
  100cdc:	53                   	push   %ebx
  100cdd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100ce0:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ce3:	85 db                	test   %ebx,%ebx
  100ce5:	0f 8e 01 01 00 00    	jle    100dec <get_from+0x114>
  100ceb:	39 c3                	cmp    %eax,%ebx
  100ced:	74 42                	je     100d31 <get_from+0x59>
  100cef:	89 da                	mov    %ebx,%edx
  100cf1:	c1 e2 07             	shl    $0x7,%edx
  100cf4:	01 da                	add    %ebx,%edx
  100cf6:	01 d2                	add    %edx,%edx
  100cf8:	01 da                	add    %ebx,%edx
  100cfa:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100cfd:	8b 0c d5 80 5d 10 00 	mov    0x105d80(,%edx,8),%ecx
  100d04:	39 cb                	cmp    %ecx,%ebx
  100d06:	75 25                	jne    100d2d <get_from+0x55>
  100d08:	e9 df 00 00 00       	jmp    100dec <get_from+0x114>
  100d0d:	8d 76 00             	lea    0x0(%esi),%esi
  100d10:	89 ca                	mov    %ecx,%edx
  100d12:	c1 e2 07             	shl    $0x7,%edx
  100d15:	01 ca                	add    %ecx,%edx
  100d17:	01 d2                	add    %edx,%edx
  100d19:	01 ca                	add    %ecx,%edx
  100d1b:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100d1e:	8b 0c d5 80 5d 10 00 	mov    0x105d80(,%edx,8),%ecx
  100d25:	39 cb                	cmp    %ecx,%ebx
  100d27:	0f 84 bf 00 00 00    	je     100dec <get_from+0x114>
  100d2d:	39 c1                	cmp    %eax,%ecx
  100d2f:	75 df                	jne    100d10 <get_from+0x38>
  100d31:	89 c2                	mov    %eax,%edx
  100d33:	c1 e2 07             	shl    $0x7,%edx
  100d36:	01 c2                	add    %eax,%edx
  100d38:	01 d2                	add    %edx,%edx
  100d3a:	01 c2                	add    %eax,%edx
  100d3c:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100d3f:	8b 04 c5 6c 5d 10 00 	mov    0x105d6c(,%eax,8),%eax
  100d46:	85 c0                	test   %eax,%eax
  100d48:	0f 84 c2 00 00 00    	je     100e10 <get_from+0x138>
  100d4e:	48                   	dec    %eax
  100d4f:	75 7f                	jne    100dd0 <get_from+0xf8>
  100d51:	be 64 33 10 00       	mov    $0x103364,%esi
  100d56:	3b 1e                	cmp    (%esi),%ebx
  100d58:	74 15                	je     100d6f <get_from+0x97>
  100d5a:	83 ec 08             	sub    $0x8,%esp
  100d5d:	68 d2 00 00 00       	push   $0xd2
  100d62:	68 92 19 10 00       	push   $0x101992
  100d67:	e8 7c 0a 00 00       	call   1017e8 <abort>
  100d6c:	83 c4 10             	add    $0x10,%esp
  100d6f:	89 d8                	mov    %ebx,%eax
  100d71:	c1 e0 07             	shl    $0x7,%eax
  100d74:	01 d8                	add    %ebx,%eax
  100d76:	01 c0                	add    %eax,%eax
  100d78:	01 d8                	add    %ebx,%eax
  100d7a:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100d7d:	8d 04 c5 20 3d 10 00 	lea    0x103d20(,%eax,8),%eax
  100d84:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100d8a:	39 da                	cmp    %ebx,%edx
  100d8c:	0f 84 8a 00 00 00    	je     100e1c <get_from+0x144>
  100d92:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100d98:	89 c8                	mov    %ecx,%eax
  100d9a:	c1 e0 07             	shl    $0x7,%eax
  100d9d:	01 c8                	add    %ecx,%eax
  100d9f:	01 c0                	add    %eax,%eax
  100da1:	01 c8                	add    %ecx,%eax
  100da3:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100da6:	89 14 c5 80 5d 10 00 	mov    %edx,0x105d80(,%eax,8)
  100dad:	89 d0                	mov    %edx,%eax
  100daf:	c1 e0 07             	shl    $0x7,%eax
  100db2:	01 d0                	add    %edx,%eax
  100db4:	01 c0                	add    %eax,%eax
  100db6:	01 d0                	add    %edx,%eax
  100db8:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100dbb:	89 0c c5 7c 5d 10 00 	mov    %ecx,0x105d7c(,%eax,8)
  100dc2:	89 16                	mov    %edx,(%esi)
  100dc4:	89 d8                	mov    %ebx,%eax
  100dc6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100dc9:	5b                   	pop    %ebx
  100dca:	5e                   	pop    %esi
  100dcb:	5d                   	pop    %ebp
  100dcc:	c3                   	ret    
  100dcd:	8d 76 00             	lea    0x0(%esi),%esi
  100dd0:	83 ec 08             	sub    $0x8,%esp
  100dd3:	68 ce 00 00 00       	push   $0xce
  100dd8:	68 92 19 10 00       	push   $0x101992
  100ddd:	e8 06 0a 00 00       	call   1017e8 <abort>
  100de2:	a1 00 00 00 00       	mov    0x0,%eax
  100de7:	0f 0b                	ud2    
  100de9:	8d 76 00             	lea    0x0(%esi),%esi
  100dec:	83 ec 08             	sub    $0x8,%esp
  100def:	68 bf 00 00 00       	push   $0xbf
  100df4:	68 92 19 10 00       	push   $0x101992
  100df9:	e8 ea 09 00 00       	call   1017e8 <abort>
  100dfe:	83 c4 10             	add    $0x10,%esp
  100e01:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e06:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e09:	5b                   	pop    %ebx
  100e0a:	5e                   	pop    %esi
  100e0b:	5d                   	pop    %ebp
  100e0c:	c3                   	ret    
  100e0d:	8d 76 00             	lea    0x0(%esi),%esi
  100e10:	be 60 33 10 00       	mov    $0x103360,%esi
  100e15:	e9 3c ff ff ff       	jmp    100d56 <get_from+0x7e>
  100e1a:	66 90                	xchg   %ax,%ax
  100e1c:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100e22:	89 d8                	mov    %ebx,%eax
  100e24:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e27:	5b                   	pop    %ebx
  100e28:	5e                   	pop    %esi
  100e29:	5d                   	pop    %ebp
  100e2a:	c3                   	ret    
  100e2b:	90                   	nop

00100e2c <get_from_block>:
  100e2c:	55                   	push   %ebp
  100e2d:	89 e5                	mov    %esp,%ebp
  100e2f:	83 ec 10             	sub    $0x10,%esp
  100e32:	ff 75 08             	pushl  0x8(%ebp)
  100e35:	ff 35 60 33 10 00    	pushl  0x103360
  100e3b:	e8 98 fe ff ff       	call   100cd8 <get_from>
  100e40:	83 c4 10             	add    $0x10,%esp
  100e43:	40                   	inc    %eax
  100e44:	74 0a                	je     100e50 <get_from_block+0x24>
  100e46:	b8 01 00 00 00       	mov    $0x1,%eax
  100e4b:	c9                   	leave  
  100e4c:	c3                   	ret    
  100e4d:	8d 76 00             	lea    0x0(%esi),%esi
  100e50:	83 ec 08             	sub    $0x8,%esp
  100e53:	68 09 01 00 00       	push   $0x109
  100e58:	68 92 19 10 00       	push   $0x101992
  100e5d:	e8 86 09 00 00       	call   1017e8 <abort>
  100e62:	83 c4 10             	add    $0x10,%esp
  100e65:	b8 01 00 00 00       	mov    $0x1,%eax
  100e6a:	c9                   	leave  
  100e6b:	c3                   	ret    

00100e6c <check_block>:
  100e6c:	55                   	push   %ebp
  100e6d:	89 e5                	mov    %esp,%ebp
  100e6f:	57                   	push   %edi
  100e70:	56                   	push   %esi
  100e71:	53                   	push   %ebx
  100e72:	83 ec 0c             	sub    $0xc,%esp
  100e75:	a1 60 33 10 00       	mov    0x103360,%eax
  100e7a:	89 c6                	mov    %eax,%esi
  100e7c:	83 f8 ff             	cmp    $0xffffffff,%eax
  100e7f:	74 58                	je     100ed9 <check_block+0x6d>
  100e81:	89 c2                	mov    %eax,%edx
  100e83:	c1 e2 07             	shl    $0x7,%edx
  100e86:	01 c2                	add    %eax,%edx
  100e88:	01 d2                	add    %edx,%edx
  100e8a:	01 c2                	add    %eax,%edx
  100e8c:	8d 3c 90             	lea    (%eax,%edx,4),%edi
  100e8f:	eb 0c                	jmp    100e9d <check_block+0x31>
  100e91:	8d 76 00             	lea    0x0(%esi),%esi
  100e94:	39 c6                	cmp    %eax,%esi
  100e96:	74 3c                	je     100ed4 <check_block+0x68>
  100e98:	83 f8 ff             	cmp    $0xffffffff,%eax
  100e9b:	74 37                	je     100ed4 <check_block+0x68>
  100e9d:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
  100ea4:	8b 8b 74 5d 10 00    	mov    0x105d74(%ebx),%ecx
  100eaa:	85 c9                	test   %ecx,%ecx
  100eac:	7f e6                	jg     100e94 <check_block+0x28>
  100eae:	83 ec 0c             	sub    $0xc,%esp
  100eb1:	56                   	push   %esi
  100eb2:	e8 75 ff ff ff       	call   100e2c <get_from_block>
  100eb7:	58                   	pop    %eax
  100eb8:	5a                   	pop    %edx
  100eb9:	81 c3 20 5d 10 00    	add    $0x105d20,%ebx
  100ebf:	53                   	push   %ebx
  100ec0:	56                   	push   %esi
  100ec1:	e8 02 fc ff ff       	call   100ac8 <put_into_runnable>
  100ec6:	83 c4 10             	add    $0x10,%esp
  100ec9:	a1 60 33 10 00       	mov    0x103360,%eax
  100ece:	39 c6                	cmp    %eax,%esi
  100ed0:	75 c6                	jne    100e98 <check_block+0x2c>
  100ed2:	66 90                	xchg   %ax,%ax
  100ed4:	be 01 00 00 00       	mov    $0x1,%esi
  100ed9:	89 f0                	mov    %esi,%eax
  100edb:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100ede:	5b                   	pop    %ebx
  100edf:	5e                   	pop    %esi
  100ee0:	5f                   	pop    %edi
  100ee1:	5d                   	pop    %ebp
  100ee2:	c3                   	ret    
  100ee3:	90                   	nop

00100ee4 <checkTimeCount>:
  100ee4:	a1 04 3d 10 00       	mov    0x103d04,%eax
  100ee9:	85 c0                	test   %eax,%eax
  100eeb:	0f 84 fb 00 00 00    	je     100fec <checkTimeCount+0x108>
  100ef1:	55                   	push   %ebp
  100ef2:	89 e5                	mov    %esp,%ebp
  100ef4:	57                   	push   %edi
  100ef5:	56                   	push   %esi
  100ef6:	83 ec 0c             	sub    $0xc,%esp
  100ef9:	68 b4 18 10 00       	push   $0x1018b4
  100efe:	e8 71 07 00 00       	call   101674 <printk>
  100f03:	5e                   	pop    %esi
  100f04:	ff 35 00 3d 10 00    	pushl  0x103d00
  100f0a:	68 b4 1a 10 00       	push   $0x101ab4
  100f0f:	6a 31                	push   $0x31
  100f11:	68 92 19 10 00       	push   $0x101992
  100f16:	68 be 19 10 00       	push   $0x1019be
  100f1b:	e8 54 07 00 00       	call   101674 <printk>
  100f20:	83 c4 14             	add    $0x14,%esp
  100f23:	68 e3 18 10 00       	push   $0x1018e3
  100f28:	e8 47 07 00 00       	call   101674 <printk>
  100f2d:	c7 04 24 b4 18 10 00 	movl   $0x1018b4,(%esp)
  100f34:	e8 3b 07 00 00       	call   101674 <printk>
  100f39:	5f                   	pop    %edi
  100f3a:	8b 15 00 3d 10 00    	mov    0x103d00,%edx
  100f40:	89 d0                	mov    %edx,%eax
  100f42:	c1 e0 07             	shl    $0x7,%eax
  100f45:	01 d0                	add    %edx,%eax
  100f47:	01 c0                	add    %eax,%eax
  100f49:	01 d0                	add    %edx,%eax
  100f4b:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100f4e:	ff 34 c5 70 5d 10 00 	pushl  0x105d70(,%eax,8)
  100f55:	68 b4 1a 10 00       	push   $0x101ab4
  100f5a:	6a 32                	push   $0x32
  100f5c:	68 92 19 10 00       	push   $0x101992
  100f61:	68 6c 1a 10 00       	push   $0x101a6c
  100f66:	e8 09 07 00 00       	call   101674 <printk>
  100f6b:	83 c4 14             	add    $0x14,%esp
  100f6e:	68 e3 18 10 00       	push   $0x1018e3
  100f73:	e8 fc 06 00 00       	call   101674 <printk>
  100f78:	e8 ef fe ff ff       	call   100e6c <check_block>
  100f7d:	8b 15 00 3d 10 00    	mov    0x103d00,%edx
  100f83:	89 d0                	mov    %edx,%eax
  100f85:	c1 e0 07             	shl    $0x7,%eax
  100f88:	01 d0                	add    %edx,%eax
  100f8a:	01 c0                	add    %eax,%eax
  100f8c:	01 d0                	add    %edx,%eax
  100f8e:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100f91:	c1 e0 03             	shl    $0x3,%eax
  100f94:	83 c4 10             	add    $0x10,%esp
  100f97:	8b 88 70 5d 10 00    	mov    0x105d70(%eax),%ecx
  100f9d:	85 c9                	test   %ecx,%ecx
  100f9f:	7e 0f                	jle    100fb0 <checkTimeCount+0xcc>
  100fa1:	b8 01 00 00 00       	mov    $0x1,%eax
  100fa6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100fa9:	5e                   	pop    %esi
  100faa:	5f                   	pop    %edi
  100fab:	5d                   	pop    %ebp
  100fac:	c3                   	ret    
  100fad:	8d 76 00             	lea    0x0(%esi),%esi
  100fb0:	05 20 5d 10 00       	add    $0x105d20,%eax
  100fb5:	b9 13 00 00 00       	mov    $0x13,%ecx
  100fba:	89 c7                	mov    %eax,%edi
  100fbc:	8b 75 08             	mov    0x8(%ebp),%esi
  100fbf:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100fc1:	83 ec 08             	sub    $0x8,%esp
  100fc4:	ff 75 08             	pushl  0x8(%ebp)
  100fc7:	52                   	push   %edx
  100fc8:	e8 fb fa ff ff       	call   100ac8 <put_into_runnable>
  100fcd:	e8 36 fa ff ff       	call   100a08 <get_from_runnable>
  100fd2:	5a                   	pop    %edx
  100fd3:	59                   	pop    %ecx
  100fd4:	ff 75 08             	pushl  0x8(%ebp)
  100fd7:	50                   	push   %eax
  100fd8:	e8 8b f8 ff ff       	call   100868 <put_into_running>
  100fdd:	83 c4 10             	add    $0x10,%esp
  100fe0:	b8 01 00 00 00       	mov    $0x1,%eax
  100fe5:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100fe8:	5e                   	pop    %esi
  100fe9:	5f                   	pop    %edi
  100fea:	5d                   	pop    %ebp
  100feb:	c3                   	ret    
  100fec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100ff1:	c3                   	ret    
  100ff2:	66 90                	xchg   %ax,%ax

00100ff4 <check_is_in>:
  100ff4:	55                   	push   %ebp
  100ff5:	89 e5                	mov    %esp,%ebp
  100ff7:	53                   	push   %ebx
  100ff8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100ffb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100ffe:	85 c9                	test   %ecx,%ecx
  101000:	7e 4a                	jle    10104c <check_is_in+0x58>
  101002:	39 d9                	cmp    %ebx,%ecx
  101004:	74 3b                	je     101041 <check_is_in+0x4d>
  101006:	89 c8                	mov    %ecx,%eax
  101008:	c1 e0 07             	shl    $0x7,%eax
  10100b:	01 c8                	add    %ecx,%eax
  10100d:	01 c0                	add    %eax,%eax
  10100f:	01 c8                	add    %ecx,%eax
  101011:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  101014:	8b 14 c5 80 5d 10 00 	mov    0x105d80(,%eax,8),%edx
  10101b:	39 d1                	cmp    %edx,%ecx
  10101d:	75 1e                	jne    10103d <check_is_in+0x49>
  10101f:	eb 2b                	jmp    10104c <check_is_in+0x58>
  101021:	8d 76 00             	lea    0x0(%esi),%esi
  101024:	89 d0                	mov    %edx,%eax
  101026:	c1 e0 07             	shl    $0x7,%eax
  101029:	01 d0                	add    %edx,%eax
  10102b:	01 c0                	add    %eax,%eax
  10102d:	01 d0                	add    %edx,%eax
  10102f:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101032:	8b 14 c5 80 5d 10 00 	mov    0x105d80(,%eax,8),%edx
  101039:	39 d1                	cmp    %edx,%ecx
  10103b:	74 0f                	je     10104c <check_is_in+0x58>
  10103d:	39 d3                	cmp    %edx,%ebx
  10103f:	75 e3                	jne    101024 <check_is_in+0x30>
  101041:	b8 01 00 00 00       	mov    $0x1,%eax
  101046:	5b                   	pop    %ebx
  101047:	5d                   	pop    %ebp
  101048:	c3                   	ret    
  101049:	8d 76 00             	lea    0x0(%esi),%esi
  10104c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101051:	5b                   	pop    %ebx
  101052:	5d                   	pop    %ebp
  101053:	c3                   	ret    

00101054 <block_decrease>:
  101054:	55                   	push   %ebp
  101055:	89 e5                	mov    %esp,%ebp
  101057:	8b 0d 60 33 10 00    	mov    0x103360,%ecx
  10105d:	83 f9 ff             	cmp    $0xffffffff,%ecx
  101060:	74 2e                	je     101090 <block_decrease+0x3c>
  101062:	89 ca                	mov    %ecx,%edx
  101064:	89 d0                	mov    %edx,%eax
  101066:	c1 e0 07             	shl    $0x7,%eax
  101069:	01 d0                	add    %edx,%eax
  10106b:	01 c0                	add    %eax,%eax
  10106d:	01 d0                	add    %edx,%eax
  10106f:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101072:	8d 04 c5 20 3d 10 00 	lea    0x103d20(,%eax,8),%eax
  101079:	ff 88 54 20 00 00    	decl   0x2054(%eax)
  10107f:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  101085:	39 d1                	cmp    %edx,%ecx
  101087:	75 db                	jne    101064 <block_decrease+0x10>
  101089:	b8 01 00 00 00       	mov    $0x1,%eax
  10108e:	5d                   	pop    %ebp
  10108f:	c3                   	ret    
  101090:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101095:	5d                   	pop    %ebp
  101096:	c3                   	ret    
  101097:	90                   	nop

00101098 <init_pcb>:
  101098:	55                   	push   %ebp
  101099:	89 e5                	mov    %esp,%ebp
  10109b:	c7 05 08 3d 10 00 05 	movl   $0x5,0x103d08
  1010a2:	00 00 00 
  1010a5:	ba 78 5d 10 00       	mov    $0x105d78,%edx
  1010aa:	31 c0                	xor    %eax,%eax
  1010ac:	89 02                	mov    %eax,(%edx)
  1010ae:	8d 48 ff             	lea    -0x1(%eax),%ecx
  1010b1:	89 4a 04             	mov    %ecx,0x4(%edx)
  1010b4:	40                   	inc    %eax
  1010b5:	89 42 08             	mov    %eax,0x8(%edx)
  1010b8:	81 c2 68 20 00 00    	add    $0x2068,%edx
  1010be:	3d 00 08 00 00       	cmp    $0x800,%eax
  1010c3:	75 e7                	jne    1010ac <init_pcb+0x14>
  1010c5:	c7 05 7c 5d 10 00 ff 	movl   $0x7ff,0x105d7c
  1010cc:	07 00 00 
  1010cf:	c7 05 18 7d 13 01 00 	movl   $0x0,0x1137d18
  1010d6:	00 00 00 
  1010d9:	5d                   	pop    %ebp
  1010da:	c3                   	ret    
  1010db:	90                   	nop

001010dc <init_kernel_pcb>:
  1010dc:	55                   	push   %ebp
  1010dd:	89 e5                	mov    %esp,%ebp
  1010df:	c7 05 68 5d 10 00 10 	movl   $0x10,0x105d68
  1010e6:	00 00 00 
  1010e9:	c7 05 5c 5d 10 00 08 	movl   $0x8,0x105d5c
  1010f0:	00 00 00 
  1010f3:	c7 05 2c 5d 10 00 10 	movl   $0x10,0x105d2c
  1010fa:	00 00 00 
  1010fd:	c7 05 28 5d 10 00 10 	movl   $0x10,0x105d28
  101104:	00 00 00 
  101107:	c7 05 58 5d 10 00 60 	movl   $0x100860,0x105d58
  10110e:	08 10 00 
  101111:	c7 05 64 5d 10 00 00 	movl   $0x400000,0x105d64
  101118:	00 40 00 
  10111b:	c7 05 6c 5d 10 00 01 	movl   $0x1,0x105d6c
  101122:	00 00 00 
  101125:	c7 05 70 5d 10 00 04 	movl   $0x4,0x105d70
  10112c:	00 00 00 
  10112f:	b8 01 00 00 00       	mov    $0x1,%eax
  101134:	5d                   	pop    %ebp
  101135:	c3                   	ret    
  101136:	66 90                	xchg   %ax,%ax

00101138 <transfer_pid_state>:
  101138:	55                   	push   %ebp
  101139:	89 e5                	mov    %esp,%ebp
  10113b:	b8 01 00 00 00       	mov    $0x1,%eax
  101140:	5d                   	pop    %ebp
  101141:	c3                   	ret    
  101142:	66 90                	xchg   %ax,%ax

00101144 <make_pcb>:
  101144:	55                   	push   %ebp
  101145:	89 e5                	mov    %esp,%ebp
  101147:	57                   	push   %edi
  101148:	56                   	push   %esi
  101149:	8b 55 08             	mov    0x8(%ebp),%edx
  10114c:	89 d0                	mov    %edx,%eax
  10114e:	c1 e0 07             	shl    $0x7,%eax
  101151:	01 d0                	add    %edx,%eax
  101153:	01 c0                	add    %eax,%eax
  101155:	01 d0                	add    %edx,%eax
  101157:	8d 14 82             	lea    (%edx,%eax,4),%edx
  10115a:	c1 e2 03             	shl    $0x3,%edx
  10115d:	8d 82 20 5d 10 00    	lea    0x105d20(%edx),%eax
  101163:	b9 13 00 00 00       	mov    $0x13,%ecx
  101168:	89 c7                	mov    %eax,%edi
  10116a:	8b 75 0c             	mov    0xc(%ebp),%esi
  10116d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10116f:	8b 45 10             	mov    0x10(%ebp),%eax
  101172:	89 82 6c 5d 10 00    	mov    %eax,0x105d6c(%edx)
  101178:	8b 45 14             	mov    0x14(%ebp),%eax
  10117b:	89 82 70 5d 10 00    	mov    %eax,0x105d70(%edx)
  101181:	8b 45 18             	mov    0x18(%ebp),%eax
  101184:	89 82 74 5d 10 00    	mov    %eax,0x105d74(%edx)
  10118a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10118d:	89 82 84 5d 10 00    	mov    %eax,0x105d84(%edx)
  101193:	b8 01 00 00 00       	mov    $0x1,%eax
  101198:	5e                   	pop    %esi
  101199:	5f                   	pop    %edi
  10119a:	5d                   	pop    %ebp
  10119b:	c3                   	ret    

0010119c <initIdt>:
  10119c:	55                   	push   %ebp
  10119d:	89 e5                	mov    %esp,%ebp
  10119f:	53                   	push   %ebx
  1011a0:	ba 7f 18 10 00       	mov    $0x10187f,%edx
  1011a5:	89 d3                	mov    %edx,%ebx
  1011a7:	c1 ea 10             	shr    $0x10,%edx
  1011aa:	b9 e0 85 13 01       	mov    $0x11385e0,%ecx
  1011af:	b8 e0 7d 13 01       	mov    $0x1137de0,%eax
  1011b4:	66 89 18             	mov    %bx,(%eax)
  1011b7:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  1011bd:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  1011c1:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  1011c5:	66 89 50 06          	mov    %dx,0x6(%eax)
  1011c9:	83 c0 08             	add    $0x8,%eax
  1011cc:	39 c1                	cmp    %eax,%ecx
  1011ce:	75 e4                	jne    1011b4 <initIdt+0x18>
  1011d0:	b8 85 18 10 00       	mov    $0x101885,%eax
  1011d5:	66 a3 48 7e 13 01    	mov    %ax,0x1137e48
  1011db:	66 c7 05 4a 7e 13 01 	movw   $0x8,0x1137e4a
  1011e2:	08 00 
  1011e4:	c6 05 4c 7e 13 01 00 	movb   $0x0,0x1137e4c
  1011eb:	c6 05 4d 7e 13 01 8f 	movb   $0x8f,0x1137e4d
  1011f2:	c1 e8 10             	shr    $0x10,%eax
  1011f5:	66 a3 4e 7e 13 01    	mov    %ax,0x1137e4e
  1011fb:	b8 89 18 10 00       	mov    $0x101889,%eax
  101200:	66 a3 e0 81 13 01    	mov    %ax,0x11381e0
  101206:	66 c7 05 e2 81 13 01 	movw   $0x8,0x11381e2
  10120d:	08 00 
  10120f:	c6 05 e4 81 13 01 00 	movb   $0x0,0x11381e4
  101216:	c6 05 e5 81 13 01 ee 	movb   $0xee,0x11381e5
  10121d:	c1 e8 10             	shr    $0x10,%eax
  101220:	66 a3 e6 81 13 01    	mov    %ax,0x11381e6
  101226:	b8 92 18 10 00       	mov    $0x101892,%eax
  10122b:	66 a3 e0 7e 13 01    	mov    %ax,0x1137ee0
  101231:	66 c7 05 e2 7e 13 01 	movw   $0x8,0x1137ee2
  101238:	08 00 
  10123a:	c6 05 e4 7e 13 01 00 	movb   $0x0,0x1137ee4
  101241:	c6 05 e5 7e 13 01 8e 	movb   $0x8e,0x1137ee5
  101248:	c1 e8 10             	shr    $0x10,%eax
  10124b:	66 a3 e6 7e 13 01    	mov    %ax,0x1137ee6
  101251:	66 c7 05 90 34 10 00 	movw   $0x7ff,0x103490
  101258:	ff 07 
  10125a:	b8 e0 7d 13 01       	mov    $0x1137de0,%eax
  10125f:	66 a3 92 34 10 00    	mov    %ax,0x103492
  101265:	c1 e8 10             	shr    $0x10,%eax
  101268:	66 a3 94 34 10 00    	mov    %ax,0x103494
  10126e:	b8 90 34 10 00       	mov    $0x103490,%eax
  101273:	0f 01 18             	lidtl  (%eax)
  101276:	5b                   	pop    %ebx
  101277:	5d                   	pop    %ebp
  101278:	c3                   	ret    
  101279:	66 90                	xchg   %ax,%ax
  10127b:	90                   	nop

0010127c <syscallHandle>:
  10127c:	55                   	push   %ebp
  10127d:	89 e5                	mov    %esp,%ebp
  10127f:	53                   	push   %ebx
  101280:	50                   	push   %eax
  101281:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101284:	8b 43 2c             	mov    0x2c(%ebx),%eax
  101287:	83 f8 02             	cmp    $0x2,%eax
  10128a:	74 28                	je     1012b4 <syscallHandle+0x38>
  10128c:	76 3a                	jbe    1012c8 <syscallHandle+0x4c>
  10128e:	83 f8 04             	cmp    $0x4,%eax
  101291:	74 15                	je     1012a8 <syscallHandle+0x2c>
  101293:	3d e6 00 00 00       	cmp    $0xe6,%eax
  101298:	75 29                	jne    1012c3 <syscallHandle+0x47>
  10129a:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10129d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012a0:	c9                   	leave  
  1012a1:	e9 d6 f2 ff ff       	jmp    10057c <sys_sleep>
  1012a6:	66 90                	xchg   %ax,%ax
  1012a8:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1012ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012ae:	c9                   	leave  
  1012af:	e9 f8 f4 ff ff       	jmp    1007ac <sys_write>
  1012b4:	83 ec 0c             	sub    $0xc,%esp
  1012b7:	53                   	push   %ebx
  1012b8:	e8 43 f3 ff ff       	call   100600 <sys_fork>
  1012bd:	89 43 2c             	mov    %eax,0x2c(%ebx)
  1012c0:	83 c4 10             	add    $0x10,%esp
  1012c3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012c6:	c9                   	leave  
  1012c7:	c3                   	ret    
  1012c8:	48                   	dec    %eax
  1012c9:	75 f8                	jne    1012c3 <syscallHandle+0x47>
  1012cb:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1012ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012d1:	c9                   	leave  
  1012d2:	e9 7d f2 ff ff       	jmp    100554 <sys_exit>
  1012d7:	90                   	nop

001012d8 <GProtectFaultHandle>:
  1012d8:	55                   	push   %ebp
  1012d9:	89 e5                	mov    %esp,%ebp
  1012db:	83 ec 14             	sub    $0x14,%esp
  1012de:	68 b4 18 10 00       	push   $0x1018b4
  1012e3:	e8 8c 03 00 00       	call   101674 <printk>
  1012e8:	58                   	pop    %eax
  1012e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1012ec:	ff 70 30             	pushl  0x30(%eax)
  1012ef:	68 28 1b 10 00       	push   $0x101b28
  1012f4:	6a 79                	push   $0x79
  1012f6:	68 d5 1a 10 00       	push   $0x101ad5
  1012fb:	68 e8 1a 10 00       	push   $0x101ae8
  101300:	e8 6f 03 00 00       	call   101674 <printk>
  101305:	83 c4 14             	add    $0x14,%esp
  101308:	68 e3 18 10 00       	push   $0x1018e3
  10130d:	e8 62 03 00 00       	call   101674 <printk>
  101312:	5a                   	pop    %edx
  101313:	59                   	pop    %ecx
  101314:	6a 7a                	push   $0x7a
  101316:	68 d5 1a 10 00       	push   $0x101ad5
  10131b:	e8 c8 04 00 00       	call   1017e8 <abort>
  101320:	83 c4 10             	add    $0x10,%esp
  101323:	c9                   	leave  
  101324:	c3                   	ret    
  101325:	8d 76 00             	lea    0x0(%esi),%esi

00101328 <timeHandle>:
  101328:	55                   	push   %ebp
  101329:	89 e5                	mov    %esp,%ebp
  10132b:	53                   	push   %ebx
  10132c:	83 ec 10             	sub    $0x10,%esp
  10132f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101332:	6a 41                	push   $0x41
  101334:	e8 0b f5 ff ff       	call   100844 <putChar>
  101339:	e8 9a f6 ff ff       	call   1009d8 <getpid>
  10133e:	89 c2                	mov    %eax,%edx
  101340:	c1 e2 07             	shl    $0x7,%edx
  101343:	01 c2                	add    %eax,%edx
  101345:	01 d2                	add    %edx,%edx
  101347:	01 c2                	add    %eax,%edx
  101349:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10134c:	ff 0c c5 70 5d 10 00 	decl   0x105d70(,%eax,8)
  101353:	e8 fc fc ff ff       	call   101054 <block_decrease>
  101358:	89 1c 24             	mov    %ebx,(%esp)
  10135b:	e8 84 fb ff ff       	call   100ee4 <checkTimeCount>
  101360:	83 c4 10             	add    $0x10,%esp
  101363:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  10136a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10136d:	c9                   	leave  
  10136e:	e9 d1 f4 ff ff       	jmp    100844 <putChar>
  101373:	90                   	nop

00101374 <irqHandle>:
  101374:	55                   	push   %ebp
  101375:	89 e5                	mov    %esp,%ebp
  101377:	57                   	push   %edi
  101378:	56                   	push   %esi
  101379:	53                   	push   %ebx
  10137a:	83 ec 0c             	sub    $0xc,%esp
  10137d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101380:	b8 10 00 00 00       	mov    $0x10,%eax
  101385:	89 c0                	mov    %eax,%eax
  101387:	8e d8                	mov    %eax,%ds
  101389:	8e e0                	mov    %eax,%fs
  10138b:	8e c0                	mov    %eax,%es
  10138d:	b8 30 00 00 00       	mov    $0x30,%eax
  101392:	89 c0                	mov    %eax,%eax
  101394:	8e e8                	mov    %eax,%gs
  101396:	89 ee                	mov    %ebp,%esi
  101398:	3b 5e 08             	cmp    0x8(%esi),%ebx
  10139b:	74 12                	je     1013af <irqHandle+0x3b>
  10139d:	83 ec 08             	sub    $0x8,%esp
  1013a0:	6a 1f                	push   $0x1f
  1013a2:	68 d5 1a 10 00       	push   $0x101ad5
  1013a7:	e8 3c 04 00 00       	call   1017e8 <abort>
  1013ac:	83 c4 10             	add    $0x10,%esp
  1013af:	e8 24 f6 ff ff       	call   1009d8 <getpid>
  1013b4:	89 c7                	mov    %eax,%edi
  1013b6:	e8 1d f6 ff ff       	call   1009d8 <getpid>
  1013bb:	fa                   	cli    
  1013bc:	8b 43 30             	mov    0x30(%ebx),%eax
  1013bf:	83 f8 0d             	cmp    $0xd,%eax
  1013c2:	0f 84 18 01 00 00    	je     1014e0 <irqHandle+0x16c>
  1013c8:	0f 8e ba 00 00 00    	jle    101488 <irqHandle+0x114>
  1013ce:	83 f8 20             	cmp    $0x20,%eax
  1013d1:	74 2d                	je     101400 <irqHandle+0x8c>
  1013d3:	83 c0 80             	add    $0xffffff80,%eax
  1013d6:	0f 85 b3 00 00 00    	jne    10148f <irqHandle+0x11b>
  1013dc:	83 ec 0c             	sub    $0xc,%esp
  1013df:	53                   	push   %ebx
  1013e0:	e8 97 fe ff ff       	call   10127c <syscallHandle>
  1013e5:	8b 43 30             	mov    0x30(%ebx),%eax
  1013e8:	83 c4 10             	add    $0x10,%esp
  1013eb:	3d 80 00 00 00       	cmp    $0x80,%eax
  1013f0:	74 26                	je     101418 <irqHandle+0xa4>
  1013f2:	83 f8 20             	cmp    $0x20,%eax
  1013f5:	74 21                	je     101418 <irqHandle+0xa4>
  1013f7:	fb                   	sti    
  1013f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1013fb:	5b                   	pop    %ebx
  1013fc:	5e                   	pop    %esi
  1013fd:	5f                   	pop    %edi
  1013fe:	5d                   	pop    %ebp
  1013ff:	c3                   	ret    
  101400:	83 ec 0c             	sub    $0xc,%esp
  101403:	53                   	push   %ebx
  101404:	e8 1f ff ff ff       	call   101328 <timeHandle>
  101409:	8b 43 30             	mov    0x30(%ebx),%eax
  10140c:	83 c4 10             	add    $0x10,%esp
  10140f:	3d 80 00 00 00       	cmp    $0x80,%eax
  101414:	75 dc                	jne    1013f2 <irqHandle+0x7e>
  101416:	66 90                	xchg   %ax,%ax
  101418:	e8 bb f5 ff ff       	call   1009d8 <getpid>
  10141d:	39 c7                	cmp    %eax,%edi
  10141f:	74 d6                	je     1013f7 <irqHandle+0x83>
  101421:	e8 b2 f5 ff ff       	call   1009d8 <getpid>
  101426:	89 c2                	mov    %eax,%edx
  101428:	c1 e2 07             	shl    $0x7,%edx
  10142b:	01 c2                	add    %eax,%edx
  10142d:	01 d2                	add    %edx,%edx
  10142f:	01 c2                	add    %eax,%edx
  101431:	8d 04 90             	lea    (%eax,%edx,4),%eax
  101434:	8d 1c c5 d0 5c 10 00 	lea    0x105cd0(,%eax,8),%ebx
  10143b:	89 5e 08             	mov    %ebx,0x8(%esi)
  10143e:	e8 95 f5 ff ff       	call   1009d8 <getpid>
  101443:	89 c2                	mov    %eax,%edx
  101445:	c1 e2 07             	shl    $0x7,%edx
  101448:	01 c2                	add    %eax,%edx
  10144a:	01 d2                	add    %edx,%edx
  10144c:	01 c2                	add    %eax,%edx
  10144e:	8d 04 90             	lea    (%eax,%edx,4),%eax
  101451:	8d 34 c5 20 5d 10 00 	lea    0x105d20(,%eax,8),%esi
  101458:	b9 13 00 00 00       	mov    $0x13,%ecx
  10145d:	89 df                	mov    %ebx,%edi
  10145f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101461:	e8 72 f5 ff ff       	call   1009d8 <getpid>
  101466:	85 c0                	test   %eax,%eax
  101468:	74 8d                	je     1013f7 <irqHandle+0x83>
  10146a:	e8 69 f5 ff ff       	call   1009d8 <getpid>
  10146f:	83 ec 08             	sub    $0x8,%esp
  101472:	c1 e0 0c             	shl    $0xc,%eax
  101475:	50                   	push   %eax
  101476:	6a 23                	push   $0x23
  101478:	e8 b7 eb ff ff       	call   100034 <change_gdt>
  10147d:	83 c4 10             	add    $0x10,%esp
  101480:	e9 72 ff ff ff       	jmp    1013f7 <irqHandle+0x83>
  101485:	8d 76 00             	lea    0x0(%esi),%esi
  101488:	40                   	inc    %eax
  101489:	0f 84 68 ff ff ff    	je     1013f7 <irqHandle+0x83>
  10148f:	83 ec 0c             	sub    $0xc,%esp
  101492:	68 b4 18 10 00       	push   $0x1018b4
  101497:	e8 d8 01 00 00       	call   101674 <printk>
  10149c:	58                   	pop    %eax
  10149d:	5a                   	pop    %edx
  10149e:	ff 73 38             	pushl  0x38(%ebx)
  1014a1:	ff 73 30             	pushl  0x30(%ebx)
  1014a4:	68 3c 1b 10 00       	push   $0x101b3c
  1014a9:	6a 39                	push   $0x39
  1014ab:	68 d5 1a 10 00       	push   $0x101ad5
  1014b0:	68 00 1b 10 00       	push   $0x101b00
  1014b5:	e8 ba 01 00 00       	call   101674 <printk>
  1014ba:	83 c4 14             	add    $0x14,%esp
  1014bd:	68 e3 18 10 00       	push   $0x1018e3
  1014c2:	e8 ad 01 00 00       	call   101674 <printk>
  1014c7:	59                   	pop    %ecx
  1014c8:	58                   	pop    %eax
  1014c9:	6a 3a                	push   $0x3a
  1014cb:	68 d5 1a 10 00       	push   $0x101ad5
  1014d0:	e8 13 03 00 00       	call   1017e8 <abort>
  1014d5:	8b 43 30             	mov    0x30(%ebx),%eax
  1014d8:	83 c4 10             	add    $0x10,%esp
  1014db:	e9 0b ff ff ff       	jmp    1013eb <irqHandle+0x77>
  1014e0:	83 ec 0c             	sub    $0xc,%esp
  1014e3:	53                   	push   %ebx
  1014e4:	e8 ef fd ff ff       	call   1012d8 <GProtectFaultHandle>
  1014e9:	8b 43 30             	mov    0x30(%ebx),%eax
  1014ec:	83 c4 10             	add    $0x10,%esp
  1014ef:	e9 f7 fe ff ff       	jmp    1013eb <irqHandle+0x77>

001014f4 <initIntr>:
  1014f4:	55                   	push   %ebp
  1014f5:	89 e5                	mov    %esp,%ebp
  1014f7:	ba 21 00 00 00       	mov    $0x21,%edx
  1014fc:	b0 ff                	mov    $0xff,%al
  1014fe:	ee                   	out    %al,(%dx)
  1014ff:	ba a1 00 00 00       	mov    $0xa1,%edx
  101504:	ee                   	out    %al,(%dx)
  101505:	ba 20 00 00 00       	mov    $0x20,%edx
  10150a:	b0 11                	mov    $0x11,%al
  10150c:	ee                   	out    %al,(%dx)
  10150d:	ba 21 00 00 00       	mov    $0x21,%edx
  101512:	b0 20                	mov    $0x20,%al
  101514:	ee                   	out    %al,(%dx)
  101515:	b0 04                	mov    $0x4,%al
  101517:	ee                   	out    %al,(%dx)
  101518:	b0 03                	mov    $0x3,%al
  10151a:	ee                   	out    %al,(%dx)
  10151b:	ba a0 00 00 00       	mov    $0xa0,%edx
  101520:	b0 11                	mov    $0x11,%al
  101522:	ee                   	out    %al,(%dx)
  101523:	ba a1 00 00 00       	mov    $0xa1,%edx
  101528:	b0 28                	mov    $0x28,%al
  10152a:	ee                   	out    %al,(%dx)
  10152b:	b0 02                	mov    $0x2,%al
  10152d:	ee                   	out    %al,(%dx)
  10152e:	b0 03                	mov    $0x3,%al
  101530:	ee                   	out    %al,(%dx)
  101531:	ba 20 00 00 00       	mov    $0x20,%edx
  101536:	b0 68                	mov    $0x68,%al
  101538:	ee                   	out    %al,(%dx)
  101539:	b0 0a                	mov    $0xa,%al
  10153b:	ee                   	out    %al,(%dx)
  10153c:	ba a0 00 00 00       	mov    $0xa0,%edx
  101541:	b0 68                	mov    $0x68,%al
  101543:	ee                   	out    %al,(%dx)
  101544:	b0 0a                	mov    $0xa,%al
  101546:	ee                   	out    %al,(%dx)
  101547:	5d                   	pop    %ebp
  101548:	c3                   	ret    
  101549:	8d 76 00             	lea    0x0(%esi),%esi

0010154c <initTimer>:
  10154c:	55                   	push   %ebp
  10154d:	89 e5                	mov    %esp,%ebp
  10154f:	ba 43 00 00 00       	mov    $0x43,%edx
  101554:	b0 34                	mov    $0x34,%al
  101556:	ee                   	out    %al,(%dx)
  101557:	ba 40 00 00 00       	mov    $0x40,%edx
  10155c:	b0 9b                	mov    $0x9b,%al
  10155e:	ee                   	out    %al,(%dx)
  10155f:	b0 2e                	mov    $0x2e,%al
  101561:	ee                   	out    %al,(%dx)
  101562:	5d                   	pop    %ebp
  101563:	c3                   	ret    

00101564 <i2A>:
  101564:	55                   	push   %ebp
  101565:	89 e5                	mov    %esp,%ebp
  101567:	57                   	push   %edi
  101568:	56                   	push   %esi
  101569:	53                   	push   %ebx
  10156a:	51                   	push   %ecx
  10156b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10156e:	85 c9                	test   %ecx,%ecx
  101570:	78 6e                	js     1015e0 <i2A+0x7c>
  101572:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  101576:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  10157a:	bb de 34 10 00       	mov    $0x1034de,%ebx
  10157f:	31 ff                	xor    %edi,%edi
  101581:	eb 03                	jmp    101586 <i2A+0x22>
  101583:	90                   	nop
  101584:	89 f7                	mov    %esi,%edi
  101586:	4b                   	dec    %ebx
  101587:	89 c8                	mov    %ecx,%eax
  101589:	be 0a 00 00 00       	mov    $0xa,%esi
  10158e:	99                   	cltd   
  10158f:	f7 fe                	idiv   %esi
  101591:	83 c2 30             	add    $0x30,%edx
  101594:	88 13                	mov    %dl,(%ebx)
  101596:	8d 77 01             	lea    0x1(%edi),%esi
  101599:	b8 67 66 66 66       	mov    $0x66666667,%eax
  10159e:	f7 e9                	imul   %ecx
  1015a0:	89 d0                	mov    %edx,%eax
  1015a2:	c1 f8 02             	sar    $0x2,%eax
  1015a5:	c1 f9 1f             	sar    $0x1f,%ecx
  1015a8:	29 c8                	sub    %ecx,%eax
  1015aa:	89 c1                	mov    %eax,%ecx
  1015ac:	75 d6                	jne    101584 <i2A+0x20>
  1015ae:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  1015b2:	74 20                	je     1015d4 <i2A+0x70>
  1015b4:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  1015b8:	75 06                	jne    1015c0 <i2A+0x5c>
  1015ba:	fe 05 dd 34 10 00    	incb   0x1034dd
  1015c0:	c6 05 de 34 10 00 00 	movb   $0x0,0x1034de
  1015c7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1015ca:	89 18                	mov    %ebx,(%eax)
  1015cc:	89 f0                	mov    %esi,%eax
  1015ce:	5a                   	pop    %edx
  1015cf:	5b                   	pop    %ebx
  1015d0:	5e                   	pop    %esi
  1015d1:	5f                   	pop    %edi
  1015d2:	5d                   	pop    %ebp
  1015d3:	c3                   	ret    
  1015d4:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  1015d8:	8d 77 02             	lea    0x2(%edi),%esi
  1015db:	4b                   	dec    %ebx
  1015dc:	eb d6                	jmp    1015b4 <i2A+0x50>
  1015de:	66 90                	xchg   %ax,%ax
  1015e0:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  1015e6:	74 0c                	je     1015f4 <i2A+0x90>
  1015e8:	f7 d9                	neg    %ecx
  1015ea:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  1015ee:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  1015f2:	eb 86                	jmp    10157a <i2A+0x16>
  1015f4:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  1015f9:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  1015fd:	eb ef                	jmp    1015ee <i2A+0x8a>
  1015ff:	90                   	nop

00101600 <i2X>:
  101600:	55                   	push   %ebp
  101601:	89 e5                	mov    %esp,%ebp
  101603:	57                   	push   %edi
  101604:	56                   	push   %esi
  101605:	53                   	push   %ebx
  101606:	8b 55 08             	mov    0x8(%ebp),%edx
  101609:	b9 bd 34 10 00       	mov    $0x1034bd,%ecx
  10160e:	31 c0                	xor    %eax,%eax
  101610:	40                   	inc    %eax
  101611:	89 d6                	mov    %edx,%esi
  101613:	83 e6 0f             	and    $0xf,%esi
  101616:	8d 5e f6             	lea    -0xa(%esi),%ebx
  101619:	89 cf                	mov    %ecx,%edi
  10161b:	83 fb 05             	cmp    $0x5,%ebx
  10161e:	77 4c                	ja     10166c <i2X+0x6c>
  101620:	ff 24 9d 48 1b 10 00 	jmp    *0x101b48(,%ebx,4)
  101627:	90                   	nop
  101628:	c6 01 65             	movb   $0x65,(%ecx)
  10162b:	90                   	nop
  10162c:	49                   	dec    %ecx
  10162d:	c1 ea 04             	shr    $0x4,%edx
  101630:	75 de                	jne    101610 <i2X+0x10>
  101632:	c6 05 be 34 10 00 00 	movb   $0x0,0x1034be
  101639:	8b 55 0c             	mov    0xc(%ebp),%edx
  10163c:	89 3a                	mov    %edi,(%edx)
  10163e:	5b                   	pop    %ebx
  10163f:	5e                   	pop    %esi
  101640:	5f                   	pop    %edi
  101641:	5d                   	pop    %ebp
  101642:	c3                   	ret    
  101643:	90                   	nop
  101644:	c6 01 64             	movb   $0x64,(%ecx)
  101647:	eb e3                	jmp    10162c <i2X+0x2c>
  101649:	8d 76 00             	lea    0x0(%esi),%esi
  10164c:	c6 01 63             	movb   $0x63,(%ecx)
  10164f:	eb db                	jmp    10162c <i2X+0x2c>
  101651:	8d 76 00             	lea    0x0(%esi),%esi
  101654:	c6 01 62             	movb   $0x62,(%ecx)
  101657:	eb d3                	jmp    10162c <i2X+0x2c>
  101659:	8d 76 00             	lea    0x0(%esi),%esi
  10165c:	c6 01 61             	movb   $0x61,(%ecx)
  10165f:	eb cb                	jmp    10162c <i2X+0x2c>
  101661:	8d 76 00             	lea    0x0(%esi),%esi
  101664:	c6 01 66             	movb   $0x66,(%ecx)
  101667:	eb c3                	jmp    10162c <i2X+0x2c>
  101669:	8d 76 00             	lea    0x0(%esi),%esi
  10166c:	8d 5e 30             	lea    0x30(%esi),%ebx
  10166f:	88 19                	mov    %bl,(%ecx)
  101671:	eb b9                	jmp    10162c <i2X+0x2c>
  101673:	90                   	nop

00101674 <printk>:
  101674:	55                   	push   %ebp
  101675:	89 e5                	mov    %esp,%ebp
  101677:	57                   	push   %edi
  101678:	56                   	push   %esi
  101679:	53                   	push   %ebx
  10167a:	83 ec 2c             	sub    $0x2c,%esp
  10167d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101680:	8a 11                	mov    (%ecx),%dl
  101682:	84 d2                	test   %dl,%dl
  101684:	0f 84 54 01 00 00    	je     1017de <printk+0x16a>
  10168a:	8d 45 0c             	lea    0xc(%ebp),%eax
  10168d:	31 ff                	xor    %edi,%edi
  10168f:	eb 18                	jmp    1016a9 <printk+0x35>
  101691:	8d 76 00             	lea    0x0(%esi),%esi
  101694:	8a 11                	mov    (%ecx),%dl
  101696:	89 cb                	mov    %ecx,%ebx
  101698:	88 97 e0 34 10 00    	mov    %dl,0x1034e0(%edi)
  10169e:	47                   	inc    %edi
  10169f:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1016a2:	8a 53 01             	mov    0x1(%ebx),%dl
  1016a5:	84 d2                	test   %dl,%dl
  1016a7:	74 72                	je     10171b <printk+0xa7>
  1016a9:	80 fa 25             	cmp    $0x25,%dl
  1016ac:	75 e6                	jne    101694 <printk+0x20>
  1016ae:	8d 59 01             	lea    0x1(%ecx),%ebx
  1016b1:	8a 51 01             	mov    0x1(%ecx),%dl
  1016b4:	80 fa 64             	cmp    $0x64,%dl
  1016b7:	0f 84 bf 00 00 00    	je     10177c <printk+0x108>
  1016bd:	0f 8e 01 01 00 00    	jle    1017c4 <printk+0x150>
  1016c3:	80 fa 73             	cmp    $0x73,%dl
  1016c6:	0f 84 84 00 00 00    	je     101750 <printk+0xdc>
  1016cc:	80 fa 78             	cmp    $0x78,%dl
  1016cf:	75 c7                	jne    101698 <printk+0x24>
  1016d1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1016d8:	8d 70 04             	lea    0x4(%eax),%esi
  1016db:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1016de:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  1016e1:	56                   	push   %esi
  1016e2:	ff 30                	pushl  (%eax)
  1016e4:	e8 17 ff ff ff       	call   101600 <i2X>
  1016e9:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1016ec:	8d b7 e0 34 10 00    	lea    0x1034e0(%edi),%esi
  1016f2:	8a 11                	mov    (%ecx),%dl
  1016f4:	83 c4 08             	add    $0x8,%esp
  1016f7:	31 c0                	xor    %eax,%eax
  1016f9:	84 d2                	test   %dl,%dl
  1016fb:	74 0f                	je     10170c <printk+0x98>
  1016fd:	8d 76 00             	lea    0x0(%esi),%esi
  101700:	40                   	inc    %eax
  101701:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101705:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  101708:	84 d2                	test   %dl,%dl
  10170a:	75 f4                	jne    101700 <printk+0x8c>
  10170c:	01 c7                	add    %eax,%edi
  10170e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101711:	8d 4b 01             	lea    0x1(%ebx),%ecx
  101714:	8a 53 01             	mov    0x1(%ebx),%dl
  101717:	84 d2                	test   %dl,%dl
  101719:	75 8e                	jne    1016a9 <printk+0x35>
  10171b:	c6 87 e0 34 10 00 00 	movb   $0x0,0x1034e0(%edi)
  101722:	0f be 05 e0 34 10 00 	movsbl 0x1034e0,%eax
  101729:	bb e0 34 10 00       	mov    $0x1034e0,%ebx
  10172e:	84 c0                	test   %al,%al
  101730:	74 16                	je     101748 <printk+0xd4>
  101732:	66 90                	xchg   %ax,%ax
  101734:	83 ec 0c             	sub    $0xc,%esp
  101737:	50                   	push   %eax
  101738:	e8 07 f1 ff ff       	call   100844 <putChar>
  10173d:	43                   	inc    %ebx
  10173e:	0f be 03             	movsbl (%ebx),%eax
  101741:	83 c4 10             	add    $0x10,%esp
  101744:	84 c0                	test   %al,%al
  101746:	75 ec                	jne    101734 <printk+0xc0>
  101748:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10174b:	5b                   	pop    %ebx
  10174c:	5e                   	pop    %esi
  10174d:	5f                   	pop    %edi
  10174e:	5d                   	pop    %ebp
  10174f:	c3                   	ret    
  101750:	8d 70 04             	lea    0x4(%eax),%esi
  101753:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101756:	8b 08                	mov    (%eax),%ecx
  101758:	8d b7 e0 34 10 00    	lea    0x1034e0(%edi),%esi
  10175e:	8a 11                	mov    (%ecx),%dl
  101760:	31 c0                	xor    %eax,%eax
  101762:	84 d2                	test   %dl,%dl
  101764:	74 a6                	je     10170c <printk+0x98>
  101766:	66 90                	xchg   %ax,%ax
  101768:	40                   	inc    %eax
  101769:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  10176d:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  101770:	84 d2                	test   %dl,%dl
  101772:	75 f4                	jne    101768 <printk+0xf4>
  101774:	01 c7                	add    %eax,%edi
  101776:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101779:	eb 96                	jmp    101711 <printk+0x9d>
  10177b:	90                   	nop
  10177c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  101783:	8d 70 04             	lea    0x4(%eax),%esi
  101786:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101789:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  10178c:	56                   	push   %esi
  10178d:	ff 30                	pushl  (%eax)
  10178f:	e8 d0 fd ff ff       	call   101564 <i2A>
  101794:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  101797:	8d b7 e0 34 10 00    	lea    0x1034e0(%edi),%esi
  10179d:	8a 11                	mov    (%ecx),%dl
  10179f:	83 c4 08             	add    $0x8,%esp
  1017a2:	31 c0                	xor    %eax,%eax
  1017a4:	84 d2                	test   %dl,%dl
  1017a6:	0f 84 60 ff ff ff    	je     10170c <printk+0x98>
  1017ac:	40                   	inc    %eax
  1017ad:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1017b1:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  1017b4:	84 d2                	test   %dl,%dl
  1017b6:	75 f4                	jne    1017ac <printk+0x138>
  1017b8:	01 c7                	add    %eax,%edi
  1017ba:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1017bd:	e9 4f ff ff ff       	jmp    101711 <printk+0x9d>
  1017c2:	66 90                	xchg   %ax,%ax
  1017c4:	80 fa 63             	cmp    $0x63,%dl
  1017c7:	0f 85 cb fe ff ff    	jne    101698 <printk+0x24>
  1017cd:	8b 10                	mov    (%eax),%edx
  1017cf:	88 97 e0 34 10 00    	mov    %dl,0x1034e0(%edi)
  1017d5:	83 c0 04             	add    $0x4,%eax
  1017d8:	47                   	inc    %edi
  1017d9:	e9 c1 fe ff ff       	jmp    10169f <printk+0x2b>
  1017de:	31 ff                	xor    %edi,%edi
  1017e0:	e9 36 ff ff ff       	jmp    10171b <printk+0xa7>
  1017e5:	66 90                	xchg   %ax,%ax
  1017e7:	90                   	nop

001017e8 <abort>:
  1017e8:	55                   	push   %ebp
  1017e9:	89 e5                	mov    %esp,%ebp
  1017eb:	57                   	push   %edi
  1017ec:	56                   	push   %esi
  1017ed:	53                   	push   %ebx
  1017ee:	83 ec 1c             	sub    $0x1c,%esp
  1017f1:	8b 55 08             	mov    0x8(%ebp),%edx
  1017f4:	fa                   	cli    
  1017f5:	8a 02                	mov    (%edx),%al
  1017f7:	b9 92 33 10 00       	mov    $0x103392,%ecx
  1017fc:	84 c0                	test   %al,%al
  1017fe:	74 0b                	je     10180b <abort+0x23>
  101800:	41                   	inc    %ecx
  101801:	42                   	inc    %edx
  101802:	88 41 ff             	mov    %al,-0x1(%ecx)
  101805:	8a 02                	mov    (%edx),%al
  101807:	84 c0                	test   %al,%al
  101809:	75 f5                	jne    101800 <abort+0x18>
  10180b:	c6 01 3a             	movb   $0x3a,(%ecx)
  10180e:	bb fd 3c 10 00       	mov    $0x103cfd,%ebx
  101813:	be 0a 00 00 00       	mov    $0xa,%esi
  101818:	bf 67 66 66 66       	mov    $0x66666667,%edi
  10181d:	4b                   	dec    %ebx
  10181e:	8b 45 0c             	mov    0xc(%ebp),%eax
  101821:	99                   	cltd   
  101822:	f7 fe                	idiv   %esi
  101824:	8d 42 30             	lea    0x30(%edx),%eax
  101827:	88 45 e7             	mov    %al,-0x19(%ebp)
  10182a:	88 03                	mov    %al,(%ebx)
  10182c:	89 f8                	mov    %edi,%eax
  10182e:	f7 6d 0c             	imull  0xc(%ebp)
  101831:	c1 fa 02             	sar    $0x2,%edx
  101834:	8b 45 0c             	mov    0xc(%ebp),%eax
  101837:	c1 f8 1f             	sar    $0x1f,%eax
  10183a:	29 c2                	sub    %eax,%edx
  10183c:	89 55 0c             	mov    %edx,0xc(%ebp)
  10183f:	75 dc                	jne    10181d <abort+0x35>
  101841:	41                   	inc    %ecx
  101842:	41                   	inc    %ecx
  101843:	43                   	inc    %ebx
  101844:	8a 45 e7             	mov    -0x19(%ebp),%al
  101847:	88 41 ff             	mov    %al,-0x1(%ecx)
  10184a:	8a 03                	mov    (%ebx),%al
  10184c:	88 45 e7             	mov    %al,-0x19(%ebp)
  10184f:	84 c0                	test   %al,%al
  101851:	75 ef                	jne    101842 <abort+0x5a>
  101853:	c6 01 0a             	movb   $0xa,(%ecx)
  101856:	0f be 05 80 33 10 00 	movsbl 0x103380,%eax
  10185d:	84 c0                	test   %al,%al
  10185f:	74 1b                	je     10187c <abort+0x94>
  101861:	bb 80 33 10 00       	mov    $0x103380,%ebx
  101866:	83 ec 0c             	sub    $0xc,%esp
  101869:	50                   	push   %eax
  10186a:	e8 d5 ef ff ff       	call   100844 <putChar>
  10186f:	43                   	inc    %ebx
  101870:	0f be 03             	movsbl (%ebx),%eax
  101873:	83 c4 10             	add    $0x10,%esp
  101876:	84 c0                	test   %al,%al
  101878:	75 ec                	jne    101866 <abort+0x7e>
  10187a:	66 90                	xchg   %ax,%ax
  10187c:	f4                   	hlt    
  10187d:	eb fd                	jmp    10187c <abort+0x94>

0010187f <irqEmpty>:
  10187f:	6a 00                	push   $0x0
  101881:	6a ff                	push   $0xffffffff
  101883:	eb 13                	jmp    101898 <asmDoIrq>

00101885 <irqGProtectFault>:
  101885:	6a 0d                	push   $0xd
  101887:	eb 0f                	jmp    101898 <asmDoIrq>

00101889 <irqSyscall>:
  101889:	6a 00                	push   $0x0
  10188b:	68 80 00 00 00       	push   $0x80
  101890:	eb 06                	jmp    101898 <asmDoIrq>

00101892 <irqTime>:
  101892:	6a 00                	push   $0x0
  101894:	6a 20                	push   $0x20
  101896:	eb 00                	jmp    101898 <asmDoIrq>

00101898 <asmDoIrq>:
  101898:	60                   	pusha  
  101899:	1e                   	push   %ds
  10189a:	06                   	push   %es
  10189b:	0f a0                	push   %fs
  10189d:	0f a8                	push   %gs
  10189f:	54                   	push   %esp
  1018a0:	e8 cf fa ff ff       	call   101374 <irqHandle>
  1018a5:	5c                   	pop    %esp
  1018a6:	0f a9                	pop    %gs
  1018a8:	0f a1                	pop    %fs
  1018aa:	07                   	pop    %es
  1018ab:	1f                   	pop    %ds
  1018ac:	61                   	popa   
  1018ad:	83 c4 04             	add    $0x4,%esp
  1018b0:	83 c4 04             	add    $0x4,%esp
  1018b3:	cf                   	iret   
