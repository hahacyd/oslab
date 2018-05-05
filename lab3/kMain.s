
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 ad 14 00 00       	call   1014b8 <initTimer>
  10000b:	e8 b4 0f 00 00       	call   100fc4 <init_pcb>
  100010:	e8 f3 0f 00 00       	call   101008 <init_kernel_pcb>
  100015:	e8 de 07 00 00       	call   1007f8 <initSerial>
  10001a:	e8 a9 10 00 00       	call   1010c8 <initIdt>
  10001f:	e8 3c 14 00 00       	call   101460 <initIntr>
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
  10005f:	66 c7 05 a0 7c 13 01 	movw   $0xffff,0x1137ca0
  100066:	ff ff 
  100068:	66 a3 a2 7c 13 01    	mov    %ax,0x1137ca2
  10006e:	89 c2                	mov    %eax,%edx
  100070:	c1 ea 10             	shr    $0x10,%edx
  100073:	88 15 a4 7c 13 01    	mov    %dl,0x1137ca4
  100079:	c6 05 a5 7c 13 01 f2 	movb   $0xf2,0x1137ca5
  100080:	c6 05 a6 7c 13 01 cf 	movb   $0xcf,0x1137ca6
  100087:	c1 e8 18             	shr    $0x18,%eax
  10008a:	a2 a7 7c 13 01       	mov    %al,0x1137ca7
  10008f:	66 c7 05 e0 33 10 00 	movw   $0x37,0x1033e0
  100096:	37 00 
  100098:	b8 80 7c 13 01       	mov    $0x1137c80,%eax
  10009d:	66 a3 e2 33 10 00    	mov    %ax,0x1033e2
  1000a3:	c1 e8 10             	shr    $0x10,%eax
  1000a6:	66 a3 e4 33 10 00    	mov    %ax,0x1033e4
  1000ac:	b8 e0 33 10 00       	mov    $0x1033e0,%eax
  1000b1:	0f 01 10             	lgdtl  (%eax)
  1000b4:	b8 01 00 00 00       	mov    $0x1,%eax
  1000b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000bc:	c9                   	leave  
  1000bd:	c3                   	ret    
  1000be:	66 90                	xchg   %ax,%ax
  1000c0:	66 c7 05 98 7c 13 01 	movw   $0xffff,0x1137c98
  1000c7:	ff ff 
  1000c9:	66 a3 9a 7c 13 01    	mov    %ax,0x1137c9a
  1000cf:	89 c2                	mov    %eax,%edx
  1000d1:	c1 ea 10             	shr    $0x10,%edx
  1000d4:	88 15 9c 7c 13 01    	mov    %dl,0x1137c9c
  1000da:	c6 05 9d 7c 13 01 fa 	movb   $0xfa,0x1137c9d
  1000e1:	c6 05 9e 7c 13 01 cf 	movb   $0xcf,0x1137c9e
  1000e8:	c1 e8 18             	shr    $0x18,%eax
  1000eb:	a2 9f 7c 13 01       	mov    %al,0x1137c9f
  1000f0:	eb 9d                	jmp    10008f <change_gdt+0x5b>
  1000f2:	66 90                	xchg   %ax,%ax
  1000f4:	83 fb 01             	cmp    $0x1,%ebx
  1000f7:	75 37                	jne    100130 <change_gdt+0xfc>
  1000f9:	66 c7 05 88 7c 13 01 	movw   $0xffff,0x1137c88
  100100:	ff ff 
  100102:	66 a3 8a 7c 13 01    	mov    %ax,0x1137c8a
  100108:	89 c2                	mov    %eax,%edx
  10010a:	c1 ea 10             	shr    $0x10,%edx
  10010d:	88 15 8c 7c 13 01    	mov    %dl,0x1137c8c
  100113:	c6 05 8d 7c 13 01 9a 	movb   $0x9a,0x1137c8d
  10011a:	c6 05 8e 7c 13 01 cf 	movb   $0xcf,0x1137c8e
  100121:	c1 e8 18             	shr    $0x18,%eax
  100124:	a2 8f 7c 13 01       	mov    %al,0x1137c8f
  100129:	e9 61 ff ff ff       	jmp    10008f <change_gdt+0x5b>
  10012e:	66 90                	xchg   %ax,%ax
  100130:	83 ec 0c             	sub    $0xc,%esp
  100133:	68 20 18 10 00       	push   $0x101820
  100138:	e8 a3 14 00 00       	call   1015e0 <printk>
  10013d:	89 1c 24             	mov    %ebx,(%esp)
  100140:	68 60 18 10 00       	push   $0x101860
  100145:	6a 18                	push   $0x18
  100147:	68 26 18 10 00       	push   $0x101826
  10014c:	68 33 18 10 00       	push   $0x101833
  100151:	e8 8a 14 00 00       	call   1015e0 <printk>
  100156:	83 c4 14             	add    $0x14,%esp
  100159:	68 4f 18 10 00       	push   $0x10184f
  10015e:	e8 7d 14 00 00       	call   1015e0 <printk>
  100163:	58                   	pop    %eax
  100164:	5a                   	pop    %edx
  100165:	6a 19                	push   $0x19
  100167:	68 26 18 10 00       	push   $0x101826
  10016c:	e8 e3 15 00 00       	call   101754 <abort>
  100171:	83 c4 10             	add    $0x10,%esp
  100174:	e9 16 ff ff ff       	jmp    10008f <change_gdt+0x5b>
  100179:	8d 76 00             	lea    0x0(%esi),%esi
  10017c:	66 c7 05 90 7c 13 01 	movw   $0xffff,0x1137c90
  100183:	ff ff 
  100185:	66 a3 92 7c 13 01    	mov    %ax,0x1137c92
  10018b:	89 c2                	mov    %eax,%edx
  10018d:	c1 ea 10             	shr    $0x10,%edx
  100190:	88 15 94 7c 13 01    	mov    %dl,0x1137c94
  100196:	c6 05 95 7c 13 01 92 	movb   $0x92,0x1137c95
  10019d:	c6 05 96 7c 13 01 cf 	movb   $0xcf,0x1137c96
  1001a4:	c1 e8 18             	shr    $0x18,%eax
  1001a7:	a2 97 7c 13 01       	mov    %al,0x1137c97
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
  10027b:	b9 80 7c 13 01       	mov    $0x1137c80,%ecx
  100280:	66 c7 05 88 7c 13 01 	movw   $0xffff,0x1137c88
  100287:	ff ff 
  100289:	66 c7 05 8a 7c 13 01 	movw   $0x0,0x1137c8a
  100290:	00 00 
  100292:	c6 05 8c 7c 13 01 00 	movb   $0x0,0x1137c8c
  100299:	c6 05 8d 7c 13 01 9a 	movb   $0x9a,0x1137c8d
  1002a0:	c6 05 8e 7c 13 01 cf 	movb   $0xcf,0x1137c8e
  1002a7:	c6 05 8f 7c 13 01 00 	movb   $0x0,0x1137c8f
  1002ae:	66 c7 05 90 7c 13 01 	movw   $0xffff,0x1137c90
  1002b5:	ff ff 
  1002b7:	66 c7 05 92 7c 13 01 	movw   $0x0,0x1137c92
  1002be:	00 00 
  1002c0:	c6 05 94 7c 13 01 00 	movb   $0x0,0x1137c94
  1002c7:	c6 05 95 7c 13 01 92 	movb   $0x92,0x1137c95
  1002ce:	c6 05 96 7c 13 01 cf 	movb   $0xcf,0x1137c96
  1002d5:	c6 05 97 7c 13 01 00 	movb   $0x0,0x1137c97
  1002dc:	66 c7 05 98 7c 13 01 	movw   $0xffff,0x1137c98
  1002e3:	ff ff 
  1002e5:	66 c7 05 9a 7c 13 01 	movw   $0x0,0x1137c9a
  1002ec:	00 00 
  1002ee:	c6 05 9c 7c 13 01 00 	movb   $0x0,0x1137c9c
  1002f5:	c6 05 9d 7c 13 01 fa 	movb   $0xfa,0x1137c9d
  1002fc:	c6 05 9e 7c 13 01 cf 	movb   $0xcf,0x1137c9e
  100303:	c6 05 9f 7c 13 01 00 	movb   $0x0,0x1137c9f
  10030a:	66 c7 05 a0 7c 13 01 	movw   $0xffff,0x1137ca0
  100311:	ff ff 
  100313:	66 c7 05 a2 7c 13 01 	movw   $0x0,0x1137ca2
  10031a:	00 00 
  10031c:	c6 05 a4 7c 13 01 00 	movb   $0x0,0x1137ca4
  100323:	c6 05 a5 7c 13 01 f2 	movb   $0xf2,0x1137ca5
  10032a:	c6 05 a6 7c 13 01 cf 	movb   $0xcf,0x1137ca6
  100331:	c6 05 a7 7c 13 01 00 	movb   $0x0,0x1137ca7
  100338:	66 c7 05 a8 7c 13 01 	movw   $0x63,0x1137ca8
  10033f:	63 00 
  100341:	b8 c0 7c 13 01       	mov    $0x1137cc0,%eax
  100346:	66 a3 aa 7c 13 01    	mov    %ax,0x1137caa
  10034c:	89 c2                	mov    %eax,%edx
  10034e:	c1 ea 10             	shr    $0x10,%edx
  100351:	88 15 ac 7c 13 01    	mov    %dl,0x1137cac
  100357:	c6 05 ad 7c 13 01 89 	movb   $0x89,0x1137cad
  10035e:	c6 05 ae 7c 13 01 40 	movb   $0x40,0x1137cae
  100365:	c1 e8 18             	shr    $0x18,%eax
  100368:	a2 af 7c 13 01       	mov    %al,0x1137caf
  10036d:	a1 58 18 10 00       	mov    0x101858,%eax
  100372:	8b 15 5c 18 10 00    	mov    0x10185c,%edx
  100378:	a3 b0 7c 13 01       	mov    %eax,0x1137cb0
  10037d:	89 15 b4 7c 13 01    	mov    %edx,0x1137cb4
  100383:	66 c7 05 e0 33 10 00 	movw   $0x37,0x1033e0
  10038a:	37 00 
  10038c:	66 89 0d e2 33 10 00 	mov    %cx,0x1033e2
  100393:	c1 e9 10             	shr    $0x10,%ecx
  100396:	66 89 0d e4 33 10 00 	mov    %cx,0x1033e4
  10039d:	b8 e0 33 10 00       	mov    $0x1033e0,%eax
  1003a2:	0f 01 10             	lgdtl  (%eax)
  1003a5:	a1 c8 5c 10 00       	mov    0x105cc8,%eax
  1003aa:	a3 c8 7c 13 01       	mov    %eax,0x1137cc8
  1003af:	c7 05 c4 7c 13 01 7c 	movl   $0x105c7c,0x1137cc4
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
  100401:	8d 04 c5 80 3c 10 00 	lea    0x103c80(,%eax,8),%eax
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
  10042e:	c7 05 64 3c 10 00 01 	movl   $0x1,0x103c64
  100435:	00 00 00 
  100438:	c7 05 30 7d 10 00 23 	movl   $0x23,0x107d30
  10043f:	00 00 00 
  100442:	c7 05 24 7d 10 00 1b 	movl   $0x1b,0x107d24
  100449:	00 00 00 
  10044c:	c7 05 f4 7c 10 00 23 	movl   $0x23,0x107cf4
  100453:	00 00 00 
  100456:	c7 05 f0 7c 10 00 23 	movl   $0x23,0x107cf0
  10045d:	00 00 00 
  100460:	c7 05 ec 7c 10 00 23 	movl   $0x23,0x107cec
  100467:	00 00 00 
  10046a:	c7 05 2c 7d 10 00 00 	movl   $0x400000,0x107d2c
  100471:	00 40 00 
  100474:	8b 45 08             	mov    0x8(%ebp),%eax
  100477:	a3 20 7d 10 00       	mov    %eax,0x107d20
  10047c:	c7 05 38 7d 10 00 0a 	movl   $0xa,0x107d38
  100483:	00 00 00 
  100486:	6a 00                	push   $0x0
  100488:	6a 01                	push   $0x1
  10048a:	e8 99 05 00 00       	call   100a28 <put_into_runnable>
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
  10055a:	68 6b 18 10 00       	push   $0x10186b
  10055f:	e8 7c 10 00 00       	call   1015e0 <printk>
  100564:	e8 ff 03 00 00       	call   100968 <get_from_runnable>
  100569:	5a                   	pop    %edx
  10056a:	59                   	pop    %ecx
  10056b:	ff 75 08             	pushl  0x8(%ebp)
  10056e:	50                   	push   %eax
  10056f:	e8 8c 03 00 00       	call   100900 <put_into_running>
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
  100584:	e8 af 03 00 00       	call   100938 <getpid>
  100589:	83 ec 08             	sub    $0x8,%esp
  10058c:	53                   	push   %ebx
  10058d:	50                   	push   %eax
  10058e:	e8 c5 05 00 00       	call   100b58 <put_into_block>
  100593:	c7 04 24 20 18 10 00 	movl   $0x101820,(%esp)
  10059a:	e8 41 10 00 00       	call   1015e0 <printk>
  10059f:	e8 94 03 00 00       	call   100938 <getpid>
  1005a4:	89 c2                	mov    %eax,%edx
  1005a6:	c1 e2 07             	shl    $0x7,%edx
  1005a9:	01 c2                	add    %eax,%edx
  1005ab:	01 d2                	add    %edx,%edx
  1005ad:	01 c2                	add    %eax,%edx
  1005af:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1005b2:	8b 34 c5 d4 5c 10 00 	mov    0x105cd4(,%eax,8),%esi
  1005b9:	e8 7a 03 00 00       	call   100938 <getpid>
  1005be:	5a                   	pop    %edx
  1005bf:	59                   	pop    %ecx
  1005c0:	56                   	push   %esi
  1005c1:	50                   	push   %eax
  1005c2:	68 bc 18 10 00       	push   $0x1018bc
  1005c7:	6a 09                	push   $0x9
  1005c9:	68 79 18 10 00       	push   $0x101879
  1005ce:	68 98 18 10 00       	push   $0x101898
  1005d3:	e8 08 10 00 00       	call   1015e0 <printk>
  1005d8:	83 c4 14             	add    $0x14,%esp
  1005db:	68 4f 18 10 00       	push   $0x10184f
  1005e0:	e8 fb 0f 00 00       	call   1015e0 <printk>
  1005e5:	e8 7e 03 00 00       	call   100968 <get_from_runnable>
  1005ea:	5e                   	pop    %esi
  1005eb:	5a                   	pop    %edx
  1005ec:	53                   	push   %ebx
  1005ed:	50                   	push   %eax
  1005ee:	e8 0d 03 00 00       	call   100900 <put_into_running>
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
  10060c:	68 c6 18 10 00       	push   $0x1018c6
  100611:	e8 ca 0f 00 00       	call   1015e0 <printk>
  100616:	83 c4 10             	add    $0x10,%esp
  100619:	31 db                	xor    %ebx,%ebx
  10061b:	90                   	nop
  10061c:	e8 17 03 00 00       	call   100938 <getpid>
  100621:	89 c2                	mov    %eax,%edx
  100623:	c1 e2 07             	shl    $0x7,%edx
  100626:	01 c2                	add    %eax,%edx
  100628:	01 d2                	add    %edx,%edx
  10062a:	01 c2                	add    %eax,%edx
  10062c:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10062f:	01 c0                	add    %eax,%eax
  100631:	01 d8                	add    %ebx,%eax
  100633:	8b 04 85 80 3c 10 00 	mov    0x103c80(,%eax,4),%eax
  10063a:	89 04 9d 50 7d 10 00 	mov    %eax,0x107d50(,%ebx,4)
  100641:	43                   	inc    %ebx
  100642:	81 fb 00 08 00 00    	cmp    $0x800,%ebx
  100648:	75 d2                	jne    10061c <sys_fork+0x1c>
  10064a:	e8 e9 02 00 00       	call   100938 <getpid>
  10064f:	8d 90 00 04 00 00    	lea    0x400(%eax),%edx
  100655:	c1 e2 0c             	shl    $0xc,%edx
  100658:	b8 00 10 00 00       	mov    $0x1000,%eax
  10065d:	8d 76 00             	lea    0x0(%esi),%esi
  100660:	8a 8c 10 00 f0 ff ff 	mov    -0x1000(%eax,%edx,1),%cl
  100667:	88 88 00 10 40 00    	mov    %cl,0x401000(%eax)
  10066d:	48                   	dec    %eax
  10066e:	75 f0                	jne    100660 <sys_fork+0x60>
  100670:	b8 50 9d 10 00       	mov    $0x109d50,%eax
  100675:	b9 13 00 00 00       	mov    $0x13,%ecx
  10067a:	89 c7                	mov    %eax,%edi
  10067c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10067e:	c7 05 7c 9d 10 00 00 	movl   $0x0,0x109d7c
  100685:	00 00 00 
  100688:	83 ec 08             	sub    $0x8,%esp
  10068b:	50                   	push   %eax
  10068c:	6a 02                	push   $0x2
  10068e:	e8 95 03 00 00       	call   100a28 <put_into_runnable>
  100693:	b8 02 00 00 00       	mov    $0x2,%eax
  100698:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10069b:	5b                   	pop    %ebx
  10069c:	5e                   	pop    %esi
  10069d:	5f                   	pop    %edi
  10069e:	5d                   	pop    %ebp
  10069f:	c3                   	ret    

001006a0 <display>:
  1006a0:	55                   	push   %ebp
  1006a1:	89 e5                	mov    %esp,%ebp
  1006a3:	57                   	push   %edi
  1006a4:	53                   	push   %ebx
  1006a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1006a8:	80 fb 0a             	cmp    $0xa,%bl
  1006ab:	74 5b                	je     100708 <display+0x68>
  1006ad:	8b 15 e8 33 10 00    	mov    0x1033e8,%edx
  1006b3:	8b 0d ec 33 10 00    	mov    0x1033ec,%ecx
  1006b9:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  1006bc:	c1 e0 04             	shl    $0x4,%eax
  1006bf:	01 d0                	add    %edx,%eax
  1006c1:	01 c0                	add    %eax,%eax
  1006c3:	89 c7                	mov    %eax,%edi
  1006c5:	0f be db             	movsbl %bl,%ebx
  1006c8:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
  1006ce:	66 89 d8             	mov    %bx,%ax
  1006d1:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1006d5:	42                   	inc    %edx
  1006d6:	83 fa 50             	cmp    $0x50,%edx
  1006d9:	75 1d                	jne    1006f8 <display+0x58>
  1006db:	c7 05 e8 33 10 00 00 	movl   $0x0,0x1033e8
  1006e2:	00 00 00 
  1006e5:	41                   	inc    %ecx
  1006e6:	89 0d ec 33 10 00    	mov    %ecx,0x1033ec
  1006ec:	b8 01 00 00 00       	mov    $0x1,%eax
  1006f1:	5b                   	pop    %ebx
  1006f2:	5f                   	pop    %edi
  1006f3:	5d                   	pop    %ebp
  1006f4:	c3                   	ret    
  1006f5:	8d 76 00             	lea    0x0(%esi),%esi
  1006f8:	89 15 e8 33 10 00    	mov    %edx,0x1033e8
  1006fe:	b8 01 00 00 00       	mov    $0x1,%eax
  100703:	5b                   	pop    %ebx
  100704:	5f                   	pop    %edi
  100705:	5d                   	pop    %ebp
  100706:	c3                   	ret    
  100707:	90                   	nop
  100708:	c7 05 e8 33 10 00 00 	movl   $0x0,0x1033e8
  10070f:	00 00 00 
  100712:	ff 05 ec 33 10 00    	incl   0x1033ec
  100718:	b8 01 00 00 00       	mov    $0x1,%eax
  10071d:	5b                   	pop    %ebx
  10071e:	5f                   	pop    %edi
  10071f:	5d                   	pop    %ebp
  100720:	c3                   	ret    
  100721:	8d 76 00             	lea    0x0(%esi),%esi

00100724 <printkernel>:
  100724:	55                   	push   %ebp
  100725:	89 e5                	mov    %esp,%ebp
  100727:	53                   	push   %ebx
  100728:	50                   	push   %eax
  100729:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10072c:	0f be 03             	movsbl (%ebx),%eax
  10072f:	84 c0                	test   %al,%al
  100731:	74 20                	je     100753 <printkernel+0x2f>
  100733:	90                   	nop
  100734:	83 ec 0c             	sub    $0xc,%esp
  100737:	50                   	push   %eax
  100738:	e8 fb 00 00 00       	call   100838 <putChar>
  10073d:	0f be 03             	movsbl (%ebx),%eax
  100740:	89 04 24             	mov    %eax,(%esp)
  100743:	e8 58 ff ff ff       	call   1006a0 <display>
  100748:	43                   	inc    %ebx
  100749:	0f be 03             	movsbl (%ebx),%eax
  10074c:	83 c4 10             	add    $0x10,%esp
  10074f:	84 c0                	test   %al,%al
  100751:	75 e1                	jne    100734 <printkernel+0x10>
  100753:	b8 01 00 00 00       	mov    $0x1,%eax
  100758:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10075b:	c9                   	leave  
  10075c:	c3                   	ret    
  10075d:	8d 76 00             	lea    0x0(%esi),%esi

00100760 <fs_write>:
  100760:	55                   	push   %ebp
  100761:	89 e5                	mov    %esp,%ebp
  100763:	53                   	push   %ebx
  100764:	50                   	push   %eax
  100765:	8b 5d 10             	mov    0x10(%ebp),%ebx
  100768:	ba 30 00 00 00       	mov    $0x30,%edx
  10076d:	89 d0                	mov    %edx,%eax
  10076f:	8e e8                	mov    %eax,%gs
  100771:	8b 45 08             	mov    0x8(%ebp),%eax
  100774:	48                   	dec    %eax
  100775:	83 f8 01             	cmp    $0x1,%eax
  100778:	76 12                	jbe    10078c <fs_write+0x2c>
  10077a:	83 ec 08             	sub    $0x8,%esp
  10077d:	6a 27                	push   $0x27
  10077f:	68 e2 18 10 00       	push   $0x1018e2
  100784:	e8 cb 0f 00 00       	call   101754 <abort>
  100789:	83 c4 10             	add    $0x10,%esp
  10078c:	83 ec 08             	sub    $0x8,%esp
  10078f:	53                   	push   %ebx
  100790:	ff 75 0c             	pushl  0xc(%ebp)
  100793:	e8 8c ff ff ff       	call   100724 <printkernel>
  100798:	89 d8                	mov    %ebx,%eax
  10079a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10079d:	c9                   	leave  
  10079e:	c3                   	ret    
  10079f:	90                   	nop

001007a0 <sys_write>:
  1007a0:	55                   	push   %ebp
  1007a1:	89 e5                	mov    %esp,%ebp
  1007a3:	56                   	push   %esi
  1007a4:	53                   	push   %ebx
  1007a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1007a8:	8b 73 24             	mov    0x24(%ebx),%esi
  1007ab:	e8 88 01 00 00       	call   100938 <getpid>
  1007b0:	52                   	push   %edx
  1007b1:	56                   	push   %esi
  1007b2:	c1 e0 0c             	shl    $0xc,%eax
  1007b5:	03 43 28             	add    0x28(%ebx),%eax
  1007b8:	50                   	push   %eax
  1007b9:	ff 73 20             	pushl  0x20(%ebx)
  1007bc:	e8 9f ff ff ff       	call   100760 <fs_write>
  1007c1:	89 43 2c             	mov    %eax,0x2c(%ebx)
  1007c4:	83 c4 10             	add    $0x10,%esp
  1007c7:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1007ca:	5b                   	pop    %ebx
  1007cb:	5e                   	pop    %esi
  1007cc:	5d                   	pop    %ebp
  1007cd:	c3                   	ret    
  1007ce:	66 90                	xchg   %ax,%ax

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

0010085c <put_into_running.part.0>:
  10085c:	55                   	push   %ebp
  10085d:	89 e5                	mov    %esp,%ebp
  10085f:	53                   	push   %ebx
  100860:	83 ec 7c             	sub    $0x7c,%esp
  100863:	89 c3                	mov    %eax,%ebx
  100865:	a3 60 3c 10 00       	mov    %eax,0x103c60
  10086a:	c1 e0 07             	shl    $0x7,%eax
  10086d:	01 d8                	add    %ebx,%eax
  10086f:	01 c0                	add    %eax,%eax
  100871:	01 d8                	add    %ebx,%eax
  100873:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100876:	8d 04 c5 7c 5c 10 00 	lea    0x105c7c(,%eax,8),%eax
  10087d:	50                   	push   %eax
  10087e:	6a 10                	push   $0x10
  100880:	e8 2f f9 ff ff       	call   1001b4 <change_tss>
  100885:	8d 45 94             	lea    -0x6c(%ebp),%eax
  100888:	89 04 24             	mov    %eax,(%esp)
  10088b:	e8 40 f9 ff ff       	call   1001d0 <get_tss>
  100890:	8b 15 60 3c 10 00    	mov    0x103c60,%edx
  100896:	89 d0                	mov    %edx,%eax
  100898:	c1 e0 07             	shl    $0x7,%eax
  10089b:	01 d0                	add    %edx,%eax
  10089d:	01 c0                	add    %eax,%eax
  10089f:	01 d0                	add    %edx,%eax
  1008a1:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1008a4:	8d 04 c5 7c 5c 10 00 	lea    0x105c7c(,%eax,8),%eax
  1008ab:	83 c4 0c             	add    $0xc,%esp
  1008ae:	39 45 98             	cmp    %eax,-0x68(%ebp)
  1008b1:	74 12                	je     1008c5 <put_into_running.part.0+0x69>
  1008b3:	83 ec 08             	sub    $0x8,%esp
  1008b6:	6a 10                	push   $0x10
  1008b8:	68 fe 18 10 00       	push   $0x1018fe
  1008bd:	e8 92 0e 00 00       	call   101754 <abort>
  1008c2:	83 c4 10             	add    $0x10,%esp
  1008c5:	83 ec 0c             	sub    $0xc,%esp
  1008c8:	68 20 18 10 00       	push   $0x101820
  1008cd:	e8 0e 0d 00 00       	call   1015e0 <printk>
  1008d2:	89 1c 24             	mov    %ebx,(%esp)
  1008d5:	68 f4 19 10 00       	push   $0x1019f4
  1008da:	6a 12                	push   $0x12
  1008dc:	68 fe 18 10 00       	push   $0x1018fe
  1008e1:	68 0c 19 10 00       	push   $0x10190c
  1008e6:	e8 f5 0c 00 00       	call   1015e0 <printk>
  1008eb:	83 c4 14             	add    $0x14,%esp
  1008ee:	68 4f 18 10 00       	push   $0x10184f
  1008f3:	e8 e8 0c 00 00       	call   1015e0 <printk>
  1008f8:	83 c4 10             	add    $0x10,%esp
  1008fb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1008fe:	c9                   	leave  
  1008ff:	c3                   	ret    

00100900 <put_into_running>:
  100900:	55                   	push   %ebp
  100901:	89 e5                	mov    %esp,%ebp
  100903:	83 ec 08             	sub    $0x8,%esp
  100906:	8b 45 08             	mov    0x8(%ebp),%eax
  100909:	39 05 60 3c 10 00    	cmp    %eax,0x103c60
  10090f:	74 05                	je     100916 <put_into_running+0x16>
  100911:	e8 46 ff ff ff       	call   10085c <put_into_running.part.0>
  100916:	b8 01 00 00 00       	mov    $0x1,%eax
  10091b:	c9                   	leave  
  10091c:	c3                   	ret    
  10091d:	8d 76 00             	lea    0x0(%esi),%esi

00100920 <update_block>:
  100920:	55                   	push   %ebp
  100921:	89 e5                	mov    %esp,%ebp
  100923:	b8 01 00 00 00       	mov    $0x1,%eax
  100928:	5d                   	pop    %ebp
  100929:	c3                   	ret    
  10092a:	66 90                	xchg   %ax,%ax

0010092c <apply_new_pid>:
  10092c:	55                   	push   %ebp
  10092d:	89 e5                	mov    %esp,%ebp
  10092f:	b8 02 00 00 00       	mov    $0x2,%eax
  100934:	5d                   	pop    %ebp
  100935:	c3                   	ret    
  100936:	66 90                	xchg   %ax,%ax

00100938 <getpid>:
  100938:	55                   	push   %ebp
  100939:	89 e5                	mov    %esp,%ebp
  10093b:	a1 60 3c 10 00       	mov    0x103c60,%eax
  100940:	5d                   	pop    %ebp
  100941:	c3                   	ret    
  100942:	66 90                	xchg   %ax,%ax

00100944 <getrunnable>:
  100944:	55                   	push   %ebp
  100945:	89 e5                	mov    %esp,%ebp
  100947:	a1 c4 32 10 00       	mov    0x1032c4,%eax
  10094c:	5d                   	pop    %ebp
  10094d:	c3                   	ret    
  10094e:	66 90                	xchg   %ax,%ax

00100950 <getblocked>:
  100950:	55                   	push   %ebp
  100951:	89 e5                	mov    %esp,%ebp
  100953:	a1 c0 32 10 00       	mov    0x1032c0,%eax
  100958:	5d                   	pop    %ebp
  100959:	c3                   	ret    
  10095a:	66 90                	xchg   %ax,%ax

0010095c <transfer_pid_mode>:
  10095c:	55                   	push   %ebp
  10095d:	89 e5                	mov    %esp,%ebp
  10095f:	b8 01 00 00 00       	mov    $0x1,%eax
  100964:	5d                   	pop    %ebp
  100965:	c3                   	ret    
  100966:	66 90                	xchg   %ax,%ax

00100968 <get_from_runnable>:
  100968:	55                   	push   %ebp
  100969:	89 e5                	mov    %esp,%ebp
  10096b:	53                   	push   %ebx
  10096c:	51                   	push   %ecx
  10096d:	8b 1d c4 32 10 00    	mov    0x1032c4,%ebx
  100973:	83 fb ff             	cmp    $0xffffffff,%ebx
  100976:	0f 84 a4 00 00 00    	je     100a20 <get_from_runnable+0xb8>
  10097c:	89 d8                	mov    %ebx,%eax
  10097e:	c1 e0 07             	shl    $0x7,%eax
  100981:	01 d8                	add    %ebx,%eax
  100983:	01 c0                	add    %eax,%eax
  100985:	01 d8                	add    %ebx,%eax
  100987:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10098a:	8d 04 c5 80 3c 10 00 	lea    0x103c80(,%eax,8),%eax
  100991:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100997:	39 da                	cmp    %ebx,%edx
  100999:	74 79                	je     100a14 <get_from_runnable+0xac>
  10099b:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  1009a1:	89 c8                	mov    %ecx,%eax
  1009a3:	c1 e0 07             	shl    $0x7,%eax
  1009a6:	01 c8                	add    %ecx,%eax
  1009a8:	01 c0                	add    %eax,%eax
  1009aa:	01 c8                	add    %ecx,%eax
  1009ac:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  1009af:	89 14 c5 e0 5c 10 00 	mov    %edx,0x105ce0(,%eax,8)
  1009b6:	89 d0                	mov    %edx,%eax
  1009b8:	c1 e0 07             	shl    $0x7,%eax
  1009bb:	01 d0                	add    %edx,%eax
  1009bd:	01 c0                	add    %eax,%eax
  1009bf:	01 d0                	add    %edx,%eax
  1009c1:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1009c4:	89 0c c5 dc 5c 10 00 	mov    %ecx,0x105cdc(,%eax,8)
  1009cb:	89 15 c4 32 10 00    	mov    %edx,0x1032c4
  1009d1:	83 ec 0c             	sub    $0xc,%esp
  1009d4:	68 20 18 10 00       	push   $0x101820
  1009d9:	e8 02 0c 00 00       	call   1015e0 <printk>
  1009de:	58                   	pop    %eax
  1009df:	5a                   	pop    %edx
  1009e0:	ff 35 c4 32 10 00    	pushl  0x1032c4
  1009e6:	53                   	push   %ebx
  1009e7:	68 d0 19 10 00       	push   $0x1019d0
  1009ec:	6a 61                	push   $0x61
  1009ee:	68 fe 18 10 00       	push   $0x1018fe
  1009f3:	68 2c 19 10 00       	push   $0x10192c
  1009f8:	e8 e3 0b 00 00       	call   1015e0 <printk>
  1009fd:	83 c4 14             	add    $0x14,%esp
  100a00:	68 4f 18 10 00       	push   $0x10184f
  100a05:	e8 d6 0b 00 00       	call   1015e0 <printk>
  100a0a:	83 c4 10             	add    $0x10,%esp
  100a0d:	89 d8                	mov    %ebx,%eax
  100a0f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100a12:	c9                   	leave  
  100a13:	c3                   	ret    
  100a14:	c7 05 c4 32 10 00 ff 	movl   $0xffffffff,0x1032c4
  100a1b:	ff ff ff 
  100a1e:	eb b1                	jmp    1009d1 <get_from_runnable+0x69>
  100a20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100a25:	eb e8                	jmp    100a0f <get_from_runnable+0xa7>
  100a27:	90                   	nop

00100a28 <put_into_runnable>:
  100a28:	55                   	push   %ebp
  100a29:	89 e5                	mov    %esp,%ebp
  100a2b:	56                   	push   %esi
  100a2c:	53                   	push   %ebx
  100a2d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100a30:	8b 15 c4 32 10 00    	mov    0x1032c4,%edx
  100a36:	83 fa ff             	cmp    $0xffffffff,%edx
  100a39:	0f 84 ed 00 00 00    	je     100b2c <put_into_runnable+0x104>
  100a3f:	89 d0                	mov    %edx,%eax
  100a41:	c1 e0 07             	shl    $0x7,%eax
  100a44:	01 d0                	add    %edx,%eax
  100a46:	01 c0                	add    %eax,%eax
  100a48:	01 d0                	add    %edx,%eax
  100a4a:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100a4d:	8d 34 c5 80 3c 10 00 	lea    0x103c80(,%eax,8),%esi
  100a54:	8b 8e 5c 20 00 00    	mov    0x205c(%esi),%ecx
  100a5a:	89 c8                	mov    %ecx,%eax
  100a5c:	c1 e0 07             	shl    $0x7,%eax
  100a5f:	01 c8                	add    %ecx,%eax
  100a61:	01 c0                	add    %eax,%eax
  100a63:	01 c8                	add    %ecx,%eax
  100a65:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100a68:	89 1c c5 e0 5c 10 00 	mov    %ebx,0x105ce0(,%eax,8)
  100a6f:	89 d8                	mov    %ebx,%eax
  100a71:	c1 e0 07             	shl    $0x7,%eax
  100a74:	01 d8                	add    %ebx,%eax
  100a76:	01 c0                	add    %eax,%eax
  100a78:	01 d8                	add    %ebx,%eax
  100a7a:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100a7d:	8d 04 c5 80 3c 10 00 	lea    0x103c80(,%eax,8),%eax
  100a84:	89 88 5c 20 00 00    	mov    %ecx,0x205c(%eax)
  100a8a:	89 90 60 20 00 00    	mov    %edx,0x2060(%eax)
  100a90:	89 9e 5c 20 00 00    	mov    %ebx,0x205c(%esi)
  100a96:	89 d8                	mov    %ebx,%eax
  100a98:	c1 e0 07             	shl    $0x7,%eax
  100a9b:	01 d8                	add    %ebx,%eax
  100a9d:	01 c0                	add    %eax,%eax
  100a9f:	01 d8                	add    %ebx,%eax
  100aa1:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100aa4:	c7 04 c5 cc 5c 10 00 	movl   $0x1,0x105ccc(,%eax,8)
  100aab:	01 00 00 00 
  100aaf:	85 db                	test   %ebx,%ebx
  100ab1:	75 0a                	jne    100abd <put_into_runnable+0x95>
  100ab3:	c7 05 b8 5c 10 00 54 	movl   $0x100854,0x105cb8
  100aba:	08 10 00 
  100abd:	83 ec 0c             	sub    $0xc,%esp
  100ac0:	68 20 18 10 00       	push   $0x101820
  100ac5:	e8 16 0b 00 00       	call   1015e0 <printk>
  100aca:	58                   	pop    %eax
  100acb:	5a                   	pop    %edx
  100acc:	53                   	push   %ebx
  100acd:	ff 35 c4 32 10 00    	pushl  0x1032c4
  100ad3:	68 bc 19 10 00       	push   $0x1019bc
  100ad8:	6a 7d                	push   $0x7d
  100ada:	68 fe 18 10 00       	push   $0x1018fe
  100adf:	68 60 19 10 00       	push   $0x101960
  100ae4:	e8 f7 0a 00 00       	call   1015e0 <printk>
  100ae9:	83 c4 14             	add    $0x14,%esp
  100aec:	68 4f 18 10 00       	push   $0x10184f
  100af1:	e8 ea 0a 00 00       	call   1015e0 <printk>
  100af6:	89 d8                	mov    %ebx,%eax
  100af8:	c1 e0 07             	shl    $0x7,%eax
  100afb:	01 d8                	add    %ebx,%eax
  100afd:	01 c0                	add    %eax,%eax
  100aff:	01 d8                	add    %ebx,%eax
  100b01:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b04:	8d 04 c5 80 3c 10 00 	lea    0x103c80(,%eax,8),%eax
  100b0b:	8b 15 68 3c 10 00    	mov    0x103c68,%edx
  100b11:	89 90 50 20 00 00    	mov    %edx,0x2050(%eax)
  100b17:	8b 55 0c             	mov    0xc(%ebp),%edx
  100b1a:	89 90 64 20 00 00    	mov    %edx,0x2064(%eax)
  100b20:	b8 01 00 00 00       	mov    $0x1,%eax
  100b25:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100b28:	5b                   	pop    %ebx
  100b29:	5e                   	pop    %esi
  100b2a:	5d                   	pop    %ebp
  100b2b:	c3                   	ret    
  100b2c:	89 1d c4 32 10 00    	mov    %ebx,0x1032c4
  100b32:	89 d8                	mov    %ebx,%eax
  100b34:	c1 e0 07             	shl    $0x7,%eax
  100b37:	01 d8                	add    %ebx,%eax
  100b39:	01 c0                	add    %eax,%eax
  100b3b:	01 d8                	add    %ebx,%eax
  100b3d:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b40:	8d 04 c5 80 3c 10 00 	lea    0x103c80(,%eax,8),%eax
  100b47:	89 98 5c 20 00 00    	mov    %ebx,0x205c(%eax)
  100b4d:	89 98 60 20 00 00    	mov    %ebx,0x2060(%eax)
  100b53:	e9 3e ff ff ff       	jmp    100a96 <put_into_runnable+0x6e>

00100b58 <put_into_block>:
  100b58:	55                   	push   %ebp
  100b59:	89 e5                	mov    %esp,%ebp
  100b5b:	57                   	push   %edi
  100b5c:	56                   	push   %esi
  100b5d:	53                   	push   %ebx
  100b5e:	8b 45 08             	mov    0x8(%ebp),%eax
  100b61:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100b64:	8b 0d c0 32 10 00    	mov    0x1032c0,%ecx
  100b6a:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100b6d:	0f 84 99 00 00 00    	je     100c0c <put_into_block+0xb4>
  100b73:	89 ca                	mov    %ecx,%edx
  100b75:	c1 e2 07             	shl    $0x7,%edx
  100b78:	01 ca                	add    %ecx,%edx
  100b7a:	01 d2                	add    %edx,%edx
  100b7c:	01 ca                	add    %ecx,%edx
  100b7e:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100b81:	8d 3c d5 80 3c 10 00 	lea    0x103c80(,%edx,8),%edi
  100b88:	8b b7 5c 20 00 00    	mov    0x205c(%edi),%esi
  100b8e:	89 f2                	mov    %esi,%edx
  100b90:	c1 e2 07             	shl    $0x7,%edx
  100b93:	01 f2                	add    %esi,%edx
  100b95:	01 d2                	add    %edx,%edx
  100b97:	01 f2                	add    %esi,%edx
  100b99:	8d 14 96             	lea    (%esi,%edx,4),%edx
  100b9c:	89 04 d5 e0 5c 10 00 	mov    %eax,0x105ce0(,%edx,8)
  100ba3:	89 c2                	mov    %eax,%edx
  100ba5:	c1 e2 07             	shl    $0x7,%edx
  100ba8:	01 c2                	add    %eax,%edx
  100baa:	01 d2                	add    %edx,%edx
  100bac:	01 c2                	add    %eax,%edx
  100bae:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100bb1:	8d 14 d5 80 3c 10 00 	lea    0x103c80(,%edx,8),%edx
  100bb8:	89 b2 5c 20 00 00    	mov    %esi,0x205c(%edx)
  100bbe:	89 8a 60 20 00 00    	mov    %ecx,0x2060(%edx)
  100bc4:	89 87 5c 20 00 00    	mov    %eax,0x205c(%edi)
  100bca:	89 c2                	mov    %eax,%edx
  100bcc:	c1 e2 07             	shl    $0x7,%edx
  100bcf:	01 c2                	add    %eax,%edx
  100bd1:	01 d2                	add    %edx,%edx
  100bd3:	01 c2                	add    %eax,%edx
  100bd5:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100bd8:	c1 e2 03             	shl    $0x3,%edx
  100bdb:	8d 82 80 5c 10 00    	lea    0x105c80(%edx),%eax
  100be1:	b9 13 00 00 00       	mov    $0x13,%ecx
  100be6:	89 c7                	mov    %eax,%edi
  100be8:	89 de                	mov    %ebx,%esi
  100bea:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100bec:	8b 43 20             	mov    0x20(%ebx),%eax
  100bef:	89 82 d4 5c 10 00    	mov    %eax,0x105cd4(%edx)
  100bf5:	c7 82 cc 5c 10 00 00 	movl   $0x0,0x105ccc(%edx)
  100bfc:	00 00 00 
  100bff:	b8 01 00 00 00       	mov    $0x1,%eax
  100c04:	5b                   	pop    %ebx
  100c05:	5e                   	pop    %esi
  100c06:	5f                   	pop    %edi
  100c07:	5d                   	pop    %ebp
  100c08:	c3                   	ret    
  100c09:	8d 76 00             	lea    0x0(%esi),%esi
  100c0c:	a3 c0 32 10 00       	mov    %eax,0x1032c0
  100c11:	89 c2                	mov    %eax,%edx
  100c13:	c1 e2 07             	shl    $0x7,%edx
  100c16:	01 c2                	add    %eax,%edx
  100c18:	01 d2                	add    %edx,%edx
  100c1a:	01 c2                	add    %eax,%edx
  100c1c:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c1f:	8d 14 d5 80 3c 10 00 	lea    0x103c80(,%edx,8),%edx
  100c26:	89 82 60 20 00 00    	mov    %eax,0x2060(%edx)
  100c2c:	89 82 5c 20 00 00    	mov    %eax,0x205c(%edx)
  100c32:	eb 96                	jmp    100bca <put_into_block+0x72>

00100c34 <get_from>:
  100c34:	55                   	push   %ebp
  100c35:	89 e5                	mov    %esp,%ebp
  100c37:	56                   	push   %esi
  100c38:	53                   	push   %ebx
  100c39:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100c3c:	8b 45 0c             	mov    0xc(%ebp),%eax
  100c3f:	85 db                	test   %ebx,%ebx
  100c41:	0f 8e 01 01 00 00    	jle    100d48 <get_from+0x114>
  100c47:	39 c3                	cmp    %eax,%ebx
  100c49:	74 42                	je     100c8d <get_from+0x59>
  100c4b:	89 da                	mov    %ebx,%edx
  100c4d:	c1 e2 07             	shl    $0x7,%edx
  100c50:	01 da                	add    %ebx,%edx
  100c52:	01 d2                	add    %edx,%edx
  100c54:	01 da                	add    %ebx,%edx
  100c56:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100c59:	8b 0c d5 e0 5c 10 00 	mov    0x105ce0(,%edx,8),%ecx
  100c60:	39 cb                	cmp    %ecx,%ebx
  100c62:	75 25                	jne    100c89 <get_from+0x55>
  100c64:	e9 df 00 00 00       	jmp    100d48 <get_from+0x114>
  100c69:	8d 76 00             	lea    0x0(%esi),%esi
  100c6c:	89 ca                	mov    %ecx,%edx
  100c6e:	c1 e2 07             	shl    $0x7,%edx
  100c71:	01 ca                	add    %ecx,%edx
  100c73:	01 d2                	add    %edx,%edx
  100c75:	01 ca                	add    %ecx,%edx
  100c77:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100c7a:	8b 0c d5 e0 5c 10 00 	mov    0x105ce0(,%edx,8),%ecx
  100c81:	39 cb                	cmp    %ecx,%ebx
  100c83:	0f 84 bf 00 00 00    	je     100d48 <get_from+0x114>
  100c89:	39 c1                	cmp    %eax,%ecx
  100c8b:	75 df                	jne    100c6c <get_from+0x38>
  100c8d:	89 c2                	mov    %eax,%edx
  100c8f:	c1 e2 07             	shl    $0x7,%edx
  100c92:	01 c2                	add    %eax,%edx
  100c94:	01 d2                	add    %edx,%edx
  100c96:	01 c2                	add    %eax,%edx
  100c98:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100c9b:	8b 04 c5 cc 5c 10 00 	mov    0x105ccc(,%eax,8),%eax
  100ca2:	85 c0                	test   %eax,%eax
  100ca4:	0f 84 c2 00 00 00    	je     100d6c <get_from+0x138>
  100caa:	48                   	dec    %eax
  100cab:	75 7f                	jne    100d2c <get_from+0xf8>
  100cad:	be c4 32 10 00       	mov    $0x1032c4,%esi
  100cb2:	3b 1e                	cmp    (%esi),%ebx
  100cb4:	74 15                	je     100ccb <get_from+0x97>
  100cb6:	83 ec 08             	sub    $0x8,%esp
  100cb9:	68 bf 00 00 00       	push   $0xbf
  100cbe:	68 fe 18 10 00       	push   $0x1018fe
  100cc3:	e8 8c 0a 00 00       	call   101754 <abort>
  100cc8:	83 c4 10             	add    $0x10,%esp
  100ccb:	89 d8                	mov    %ebx,%eax
  100ccd:	c1 e0 07             	shl    $0x7,%eax
  100cd0:	01 d8                	add    %ebx,%eax
  100cd2:	01 c0                	add    %eax,%eax
  100cd4:	01 d8                	add    %ebx,%eax
  100cd6:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100cd9:	8d 04 c5 80 3c 10 00 	lea    0x103c80(,%eax,8),%eax
  100ce0:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100ce6:	39 da                	cmp    %ebx,%edx
  100ce8:	0f 84 8a 00 00 00    	je     100d78 <get_from+0x144>
  100cee:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100cf4:	89 c8                	mov    %ecx,%eax
  100cf6:	c1 e0 07             	shl    $0x7,%eax
  100cf9:	01 c8                	add    %ecx,%eax
  100cfb:	01 c0                	add    %eax,%eax
  100cfd:	01 c8                	add    %ecx,%eax
  100cff:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100d02:	89 14 c5 e0 5c 10 00 	mov    %edx,0x105ce0(,%eax,8)
  100d09:	89 d0                	mov    %edx,%eax
  100d0b:	c1 e0 07             	shl    $0x7,%eax
  100d0e:	01 d0                	add    %edx,%eax
  100d10:	01 c0                	add    %eax,%eax
  100d12:	01 d0                	add    %edx,%eax
  100d14:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100d17:	89 0c c5 dc 5c 10 00 	mov    %ecx,0x105cdc(,%eax,8)
  100d1e:	89 16                	mov    %edx,(%esi)
  100d20:	89 d8                	mov    %ebx,%eax
  100d22:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d25:	5b                   	pop    %ebx
  100d26:	5e                   	pop    %esi
  100d27:	5d                   	pop    %ebp
  100d28:	c3                   	ret    
  100d29:	8d 76 00             	lea    0x0(%esi),%esi
  100d2c:	83 ec 08             	sub    $0x8,%esp
  100d2f:	68 bb 00 00 00       	push   $0xbb
  100d34:	68 fe 18 10 00       	push   $0x1018fe
  100d39:	e8 16 0a 00 00       	call   101754 <abort>
  100d3e:	a1 00 00 00 00       	mov    0x0,%eax
  100d43:	0f 0b                	ud2    
  100d45:	8d 76 00             	lea    0x0(%esi),%esi
  100d48:	83 ec 08             	sub    $0x8,%esp
  100d4b:	68 ac 00 00 00       	push   $0xac
  100d50:	68 fe 18 10 00       	push   $0x1018fe
  100d55:	e8 fa 09 00 00       	call   101754 <abort>
  100d5a:	83 c4 10             	add    $0x10,%esp
  100d5d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100d62:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d65:	5b                   	pop    %ebx
  100d66:	5e                   	pop    %esi
  100d67:	5d                   	pop    %ebp
  100d68:	c3                   	ret    
  100d69:	8d 76 00             	lea    0x0(%esi),%esi
  100d6c:	be c0 32 10 00       	mov    $0x1032c0,%esi
  100d71:	e9 3c ff ff ff       	jmp    100cb2 <get_from+0x7e>
  100d76:	66 90                	xchg   %ax,%ax
  100d78:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100d7e:	89 d8                	mov    %ebx,%eax
  100d80:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d83:	5b                   	pop    %ebx
  100d84:	5e                   	pop    %esi
  100d85:	5d                   	pop    %ebp
  100d86:	c3                   	ret    
  100d87:	90                   	nop

00100d88 <get_from_block>:
  100d88:	55                   	push   %ebp
  100d89:	89 e5                	mov    %esp,%ebp
  100d8b:	83 ec 10             	sub    $0x10,%esp
  100d8e:	ff 75 08             	pushl  0x8(%ebp)
  100d91:	ff 35 c0 32 10 00    	pushl  0x1032c0
  100d97:	e8 98 fe ff ff       	call   100c34 <get_from>
  100d9c:	83 c4 10             	add    $0x10,%esp
  100d9f:	40                   	inc    %eax
  100da0:	74 0a                	je     100dac <get_from_block+0x24>
  100da2:	b8 01 00 00 00       	mov    $0x1,%eax
  100da7:	c9                   	leave  
  100da8:	c3                   	ret    
  100da9:	8d 76 00             	lea    0x0(%esi),%esi
  100dac:	83 ec 08             	sub    $0x8,%esp
  100daf:	68 f6 00 00 00       	push   $0xf6
  100db4:	68 fe 18 10 00       	push   $0x1018fe
  100db9:	e8 96 09 00 00       	call   101754 <abort>
  100dbe:	83 c4 10             	add    $0x10,%esp
  100dc1:	b8 01 00 00 00       	mov    $0x1,%eax
  100dc6:	c9                   	leave  
  100dc7:	c3                   	ret    

00100dc8 <check_block>:
  100dc8:	55                   	push   %ebp
  100dc9:	89 e5                	mov    %esp,%ebp
  100dcb:	57                   	push   %edi
  100dcc:	56                   	push   %esi
  100dcd:	53                   	push   %ebx
  100dce:	83 ec 0c             	sub    $0xc,%esp
  100dd1:	a1 c0 32 10 00       	mov    0x1032c0,%eax
  100dd6:	89 c6                	mov    %eax,%esi
  100dd8:	83 f8 ff             	cmp    $0xffffffff,%eax
  100ddb:	74 58                	je     100e35 <check_block+0x6d>
  100ddd:	89 c2                	mov    %eax,%edx
  100ddf:	c1 e2 07             	shl    $0x7,%edx
  100de2:	01 c2                	add    %eax,%edx
  100de4:	01 d2                	add    %edx,%edx
  100de6:	01 c2                	add    %eax,%edx
  100de8:	8d 3c 90             	lea    (%eax,%edx,4),%edi
  100deb:	eb 0c                	jmp    100df9 <check_block+0x31>
  100ded:	8d 76 00             	lea    0x0(%esi),%esi
  100df0:	39 c6                	cmp    %eax,%esi
  100df2:	74 3c                	je     100e30 <check_block+0x68>
  100df4:	83 f8 ff             	cmp    $0xffffffff,%eax
  100df7:	74 37                	je     100e30 <check_block+0x68>
  100df9:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
  100e00:	8b 8b d4 5c 10 00    	mov    0x105cd4(%ebx),%ecx
  100e06:	85 c9                	test   %ecx,%ecx
  100e08:	7f e6                	jg     100df0 <check_block+0x28>
  100e0a:	83 ec 0c             	sub    $0xc,%esp
  100e0d:	56                   	push   %esi
  100e0e:	e8 75 ff ff ff       	call   100d88 <get_from_block>
  100e13:	58                   	pop    %eax
  100e14:	5a                   	pop    %edx
  100e15:	81 c3 80 5c 10 00    	add    $0x105c80,%ebx
  100e1b:	53                   	push   %ebx
  100e1c:	56                   	push   %esi
  100e1d:	e8 06 fc ff ff       	call   100a28 <put_into_runnable>
  100e22:	83 c4 10             	add    $0x10,%esp
  100e25:	a1 c0 32 10 00       	mov    0x1032c0,%eax
  100e2a:	39 c6                	cmp    %eax,%esi
  100e2c:	75 c6                	jne    100df4 <check_block+0x2c>
  100e2e:	66 90                	xchg   %ax,%ax
  100e30:	be 01 00 00 00       	mov    $0x1,%esi
  100e35:	89 f0                	mov    %esi,%eax
  100e37:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100e3a:	5b                   	pop    %ebx
  100e3b:	5e                   	pop    %esi
  100e3c:	5f                   	pop    %edi
  100e3d:	5d                   	pop    %ebp
  100e3e:	c3                   	ret    
  100e3f:	90                   	nop

00100e40 <checkTimeCount>:
  100e40:	a1 64 3c 10 00       	mov    0x103c64,%eax
  100e45:	85 c0                	test   %eax,%eax
  100e47:	0f 84 cb 00 00 00    	je     100f18 <checkTimeCount+0xd8>
  100e4d:	55                   	push   %ebp
  100e4e:	89 e5                	mov    %esp,%ebp
  100e50:	57                   	push   %edi
  100e51:	56                   	push   %esi
  100e52:	83 ec 0c             	sub    $0xc,%esp
  100e55:	68 20 18 10 00       	push   $0x101820
  100e5a:	e8 81 07 00 00       	call   1015e0 <printk>
  100e5f:	8b 15 60 3c 10 00    	mov    0x103c60,%edx
  100e65:	58                   	pop    %eax
  100e66:	59                   	pop    %ecx
  100e67:	89 d0                	mov    %edx,%eax
  100e69:	c1 e0 07             	shl    $0x7,%eax
  100e6c:	01 d0                	add    %edx,%eax
  100e6e:	01 c0                	add    %eax,%eax
  100e70:	01 d0                	add    %edx,%eax
  100e72:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100e75:	ff 34 c5 d0 5c 10 00 	pushl  0x105cd0(,%eax,8)
  100e7c:	52                   	push   %edx
  100e7d:	68 e4 19 10 00       	push   $0x1019e4
  100e82:	6a 1f                	push   $0x1f
  100e84:	68 fe 18 10 00       	push   $0x1018fe
  100e89:	68 90 19 10 00       	push   $0x101990
  100e8e:	e8 4d 07 00 00       	call   1015e0 <printk>
  100e93:	83 c4 14             	add    $0x14,%esp
  100e96:	68 4f 18 10 00       	push   $0x10184f
  100e9b:	e8 40 07 00 00       	call   1015e0 <printk>
  100ea0:	e8 23 ff ff ff       	call   100dc8 <check_block>
  100ea5:	8b 15 60 3c 10 00    	mov    0x103c60,%edx
  100eab:	89 d0                	mov    %edx,%eax
  100ead:	c1 e0 07             	shl    $0x7,%eax
  100eb0:	01 d0                	add    %edx,%eax
  100eb2:	01 c0                	add    %eax,%eax
  100eb4:	01 d0                	add    %edx,%eax
  100eb6:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100eb9:	c1 e0 03             	shl    $0x3,%eax
  100ebc:	83 c4 10             	add    $0x10,%esp
  100ebf:	8b b0 d0 5c 10 00    	mov    0x105cd0(%eax),%esi
  100ec5:	85 f6                	test   %esi,%esi
  100ec7:	7e 0f                	jle    100ed8 <checkTimeCount+0x98>
  100ec9:	b8 01 00 00 00       	mov    $0x1,%eax
  100ece:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100ed1:	5e                   	pop    %esi
  100ed2:	5f                   	pop    %edi
  100ed3:	5d                   	pop    %ebp
  100ed4:	c3                   	ret    
  100ed5:	8d 76 00             	lea    0x0(%esi),%esi
  100ed8:	05 80 5c 10 00       	add    $0x105c80,%eax
  100edd:	b9 13 00 00 00       	mov    $0x13,%ecx
  100ee2:	89 c7                	mov    %eax,%edi
  100ee4:	8b 75 08             	mov    0x8(%ebp),%esi
  100ee7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100ee9:	83 ec 08             	sub    $0x8,%esp
  100eec:	ff 75 08             	pushl  0x8(%ebp)
  100eef:	52                   	push   %edx
  100ef0:	e8 33 fb ff ff       	call   100a28 <put_into_runnable>
  100ef5:	e8 6e fa ff ff       	call   100968 <get_from_runnable>
  100efa:	83 c4 10             	add    $0x10,%esp
  100efd:	3b 05 60 3c 10 00    	cmp    0x103c60,%eax
  100f03:	74 c4                	je     100ec9 <checkTimeCount+0x89>
  100f05:	e8 52 f9 ff ff       	call   10085c <put_into_running.part.0>
  100f0a:	b8 01 00 00 00       	mov    $0x1,%eax
  100f0f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100f12:	5e                   	pop    %esi
  100f13:	5f                   	pop    %edi
  100f14:	5d                   	pop    %ebp
  100f15:	c3                   	ret    
  100f16:	66 90                	xchg   %ax,%ax
  100f18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100f1d:	c3                   	ret    
  100f1e:	66 90                	xchg   %ax,%ax

00100f20 <check_is_in>:
  100f20:	55                   	push   %ebp
  100f21:	89 e5                	mov    %esp,%ebp
  100f23:	53                   	push   %ebx
  100f24:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100f27:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100f2a:	85 c9                	test   %ecx,%ecx
  100f2c:	7e 4a                	jle    100f78 <check_is_in+0x58>
  100f2e:	39 d9                	cmp    %ebx,%ecx
  100f30:	74 3b                	je     100f6d <check_is_in+0x4d>
  100f32:	89 c8                	mov    %ecx,%eax
  100f34:	c1 e0 07             	shl    $0x7,%eax
  100f37:	01 c8                	add    %ecx,%eax
  100f39:	01 c0                	add    %eax,%eax
  100f3b:	01 c8                	add    %ecx,%eax
  100f3d:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100f40:	8b 14 c5 e0 5c 10 00 	mov    0x105ce0(,%eax,8),%edx
  100f47:	39 d1                	cmp    %edx,%ecx
  100f49:	75 1e                	jne    100f69 <check_is_in+0x49>
  100f4b:	eb 2b                	jmp    100f78 <check_is_in+0x58>
  100f4d:	8d 76 00             	lea    0x0(%esi),%esi
  100f50:	89 d0                	mov    %edx,%eax
  100f52:	c1 e0 07             	shl    $0x7,%eax
  100f55:	01 d0                	add    %edx,%eax
  100f57:	01 c0                	add    %eax,%eax
  100f59:	01 d0                	add    %edx,%eax
  100f5b:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100f5e:	8b 14 c5 e0 5c 10 00 	mov    0x105ce0(,%eax,8),%edx
  100f65:	39 d1                	cmp    %edx,%ecx
  100f67:	74 0f                	je     100f78 <check_is_in+0x58>
  100f69:	39 d3                	cmp    %edx,%ebx
  100f6b:	75 e3                	jne    100f50 <check_is_in+0x30>
  100f6d:	b8 01 00 00 00       	mov    $0x1,%eax
  100f72:	5b                   	pop    %ebx
  100f73:	5d                   	pop    %ebp
  100f74:	c3                   	ret    
  100f75:	8d 76 00             	lea    0x0(%esi),%esi
  100f78:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100f7d:	5b                   	pop    %ebx
  100f7e:	5d                   	pop    %ebp
  100f7f:	c3                   	ret    

00100f80 <block_decrease>:
  100f80:	55                   	push   %ebp
  100f81:	89 e5                	mov    %esp,%ebp
  100f83:	8b 0d c0 32 10 00    	mov    0x1032c0,%ecx
  100f89:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100f8c:	74 2e                	je     100fbc <block_decrease+0x3c>
  100f8e:	89 ca                	mov    %ecx,%edx
  100f90:	89 d0                	mov    %edx,%eax
  100f92:	c1 e0 07             	shl    $0x7,%eax
  100f95:	01 d0                	add    %edx,%eax
  100f97:	01 c0                	add    %eax,%eax
  100f99:	01 d0                	add    %edx,%eax
  100f9b:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100f9e:	8d 04 c5 80 3c 10 00 	lea    0x103c80(,%eax,8),%eax
  100fa5:	ff 88 54 20 00 00    	decl   0x2054(%eax)
  100fab:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100fb1:	39 d1                	cmp    %edx,%ecx
  100fb3:	75 db                	jne    100f90 <block_decrease+0x10>
  100fb5:	b8 01 00 00 00       	mov    $0x1,%eax
  100fba:	5d                   	pop    %ebp
  100fbb:	c3                   	ret    
  100fbc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100fc1:	5d                   	pop    %ebp
  100fc2:	c3                   	ret    
  100fc3:	90                   	nop

00100fc4 <init_pcb>:
  100fc4:	55                   	push   %ebp
  100fc5:	89 e5                	mov    %esp,%ebp
  100fc7:	c7 05 68 3c 10 00 05 	movl   $0x5,0x103c68
  100fce:	00 00 00 
  100fd1:	ba d8 5c 10 00       	mov    $0x105cd8,%edx
  100fd6:	31 c0                	xor    %eax,%eax
  100fd8:	89 02                	mov    %eax,(%edx)
  100fda:	8d 48 ff             	lea    -0x1(%eax),%ecx
  100fdd:	89 4a 04             	mov    %ecx,0x4(%edx)
  100fe0:	40                   	inc    %eax
  100fe1:	89 42 08             	mov    %eax,0x8(%edx)
  100fe4:	81 c2 68 20 00 00    	add    $0x2068,%edx
  100fea:	3d 00 08 00 00       	cmp    $0x800,%eax
  100fef:	75 e7                	jne    100fd8 <init_pcb+0x14>
  100ff1:	c7 05 dc 5c 10 00 ff 	movl   $0x7ff,0x105cdc
  100ff8:	07 00 00 
  100ffb:	c7 05 78 7c 13 01 00 	movl   $0x0,0x1137c78
  101002:	00 00 00 
  101005:	5d                   	pop    %ebp
  101006:	c3                   	ret    
  101007:	90                   	nop

00101008 <init_kernel_pcb>:
  101008:	55                   	push   %ebp
  101009:	89 e5                	mov    %esp,%ebp
  10100b:	c7 05 c8 5c 10 00 10 	movl   $0x10,0x105cc8
  101012:	00 00 00 
  101015:	c7 05 bc 5c 10 00 08 	movl   $0x8,0x105cbc
  10101c:	00 00 00 
  10101f:	c7 05 8c 5c 10 00 10 	movl   $0x10,0x105c8c
  101026:	00 00 00 
  101029:	c7 05 88 5c 10 00 10 	movl   $0x10,0x105c88
  101030:	00 00 00 
  101033:	c7 05 b8 5c 10 00 54 	movl   $0x100854,0x105cb8
  10103a:	08 10 00 
  10103d:	c7 05 c4 5c 10 00 00 	movl   $0x400000,0x105cc4
  101044:	00 40 00 
  101047:	c7 05 cc 5c 10 00 01 	movl   $0x1,0x105ccc
  10104e:	00 00 00 
  101051:	c7 05 d0 5c 10 00 04 	movl   $0x4,0x105cd0
  101058:	00 00 00 
  10105b:	b8 01 00 00 00       	mov    $0x1,%eax
  101060:	5d                   	pop    %ebp
  101061:	c3                   	ret    
  101062:	66 90                	xchg   %ax,%ax

00101064 <transfer_pid_state>:
  101064:	55                   	push   %ebp
  101065:	89 e5                	mov    %esp,%ebp
  101067:	b8 01 00 00 00       	mov    $0x1,%eax
  10106c:	5d                   	pop    %ebp
  10106d:	c3                   	ret    
  10106e:	66 90                	xchg   %ax,%ax

00101070 <make_pcb>:
  101070:	55                   	push   %ebp
  101071:	89 e5                	mov    %esp,%ebp
  101073:	57                   	push   %edi
  101074:	56                   	push   %esi
  101075:	8b 55 08             	mov    0x8(%ebp),%edx
  101078:	89 d0                	mov    %edx,%eax
  10107a:	c1 e0 07             	shl    $0x7,%eax
  10107d:	01 d0                	add    %edx,%eax
  10107f:	01 c0                	add    %eax,%eax
  101081:	01 d0                	add    %edx,%eax
  101083:	8d 14 82             	lea    (%edx,%eax,4),%edx
  101086:	c1 e2 03             	shl    $0x3,%edx
  101089:	8d 82 80 5c 10 00    	lea    0x105c80(%edx),%eax
  10108f:	b9 13 00 00 00       	mov    $0x13,%ecx
  101094:	89 c7                	mov    %eax,%edi
  101096:	8b 75 0c             	mov    0xc(%ebp),%esi
  101099:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10109b:	8b 45 10             	mov    0x10(%ebp),%eax
  10109e:	89 82 cc 5c 10 00    	mov    %eax,0x105ccc(%edx)
  1010a4:	8b 45 14             	mov    0x14(%ebp),%eax
  1010a7:	89 82 d0 5c 10 00    	mov    %eax,0x105cd0(%edx)
  1010ad:	8b 45 18             	mov    0x18(%ebp),%eax
  1010b0:	89 82 d4 5c 10 00    	mov    %eax,0x105cd4(%edx)
  1010b6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1010b9:	89 82 e4 5c 10 00    	mov    %eax,0x105ce4(%edx)
  1010bf:	b8 01 00 00 00       	mov    $0x1,%eax
  1010c4:	5e                   	pop    %esi
  1010c5:	5f                   	pop    %edi
  1010c6:	5d                   	pop    %ebp
  1010c7:	c3                   	ret    

001010c8 <initIdt>:
  1010c8:	55                   	push   %ebp
  1010c9:	89 e5                	mov    %esp,%ebp
  1010cb:	53                   	push   %ebx
  1010cc:	ba eb 17 10 00       	mov    $0x1017eb,%edx
  1010d1:	89 d3                	mov    %edx,%ebx
  1010d3:	c1 ea 10             	shr    $0x10,%edx
  1010d6:	b9 40 85 13 01       	mov    $0x1138540,%ecx
  1010db:	b8 40 7d 13 01       	mov    $0x1137d40,%eax
  1010e0:	66 89 18             	mov    %bx,(%eax)
  1010e3:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  1010e9:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  1010ed:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  1010f1:	66 89 50 06          	mov    %dx,0x6(%eax)
  1010f5:	83 c0 08             	add    $0x8,%eax
  1010f8:	39 c1                	cmp    %eax,%ecx
  1010fa:	75 e4                	jne    1010e0 <initIdt+0x18>
  1010fc:	b8 f1 17 10 00       	mov    $0x1017f1,%eax
  101101:	66 a3 a8 7d 13 01    	mov    %ax,0x1137da8
  101107:	66 c7 05 aa 7d 13 01 	movw   $0x8,0x1137daa
  10110e:	08 00 
  101110:	c6 05 ac 7d 13 01 00 	movb   $0x0,0x1137dac
  101117:	c6 05 ad 7d 13 01 8f 	movb   $0x8f,0x1137dad
  10111e:	c1 e8 10             	shr    $0x10,%eax
  101121:	66 a3 ae 7d 13 01    	mov    %ax,0x1137dae
  101127:	b8 f5 17 10 00       	mov    $0x1017f5,%eax
  10112c:	66 a3 40 81 13 01    	mov    %ax,0x1138140
  101132:	66 c7 05 42 81 13 01 	movw   $0x8,0x1138142
  101139:	08 00 
  10113b:	c6 05 44 81 13 01 00 	movb   $0x0,0x1138144
  101142:	c6 05 45 81 13 01 ee 	movb   $0xee,0x1138145
  101149:	c1 e8 10             	shr    $0x10,%eax
  10114c:	66 a3 46 81 13 01    	mov    %ax,0x1138146
  101152:	b8 fe 17 10 00       	mov    $0x1017fe,%eax
  101157:	66 a3 40 7e 13 01    	mov    %ax,0x1137e40
  10115d:	66 c7 05 42 7e 13 01 	movw   $0x8,0x1137e42
  101164:	08 00 
  101166:	c6 05 44 7e 13 01 00 	movb   $0x0,0x1137e44
  10116d:	c6 05 45 7e 13 01 8e 	movb   $0x8e,0x1137e45
  101174:	c1 e8 10             	shr    $0x10,%eax
  101177:	66 a3 46 7e 13 01    	mov    %ax,0x1137e46
  10117d:	66 c7 05 f0 33 10 00 	movw   $0x7ff,0x1033f0
  101184:	ff 07 
  101186:	b8 40 7d 13 01       	mov    $0x1137d40,%eax
  10118b:	66 a3 f2 33 10 00    	mov    %ax,0x1033f2
  101191:	c1 e8 10             	shr    $0x10,%eax
  101194:	66 a3 f4 33 10 00    	mov    %ax,0x1033f4
  10119a:	b8 f0 33 10 00       	mov    $0x1033f0,%eax
  10119f:	0f 01 18             	lidtl  (%eax)
  1011a2:	5b                   	pop    %ebx
  1011a3:	5d                   	pop    %ebp
  1011a4:	c3                   	ret    
  1011a5:	66 90                	xchg   %ax,%ax
  1011a7:	90                   	nop

001011a8 <syscallHandle>:
  1011a8:	55                   	push   %ebp
  1011a9:	89 e5                	mov    %esp,%ebp
  1011ab:	53                   	push   %ebx
  1011ac:	50                   	push   %eax
  1011ad:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1011b0:	8b 43 2c             	mov    0x2c(%ebx),%eax
  1011b3:	83 f8 02             	cmp    $0x2,%eax
  1011b6:	74 28                	je     1011e0 <syscallHandle+0x38>
  1011b8:	76 3a                	jbe    1011f4 <syscallHandle+0x4c>
  1011ba:	83 f8 04             	cmp    $0x4,%eax
  1011bd:	74 15                	je     1011d4 <syscallHandle+0x2c>
  1011bf:	3d e6 00 00 00       	cmp    $0xe6,%eax
  1011c4:	75 29                	jne    1011ef <syscallHandle+0x47>
  1011c6:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1011c9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1011cc:	c9                   	leave  
  1011cd:	e9 aa f3 ff ff       	jmp    10057c <sys_sleep>
  1011d2:	66 90                	xchg   %ax,%ax
  1011d4:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1011d7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1011da:	c9                   	leave  
  1011db:	e9 c0 f5 ff ff       	jmp    1007a0 <sys_write>
  1011e0:	83 ec 0c             	sub    $0xc,%esp
  1011e3:	53                   	push   %ebx
  1011e4:	e8 17 f4 ff ff       	call   100600 <sys_fork>
  1011e9:	89 43 2c             	mov    %eax,0x2c(%ebx)
  1011ec:	83 c4 10             	add    $0x10,%esp
  1011ef:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1011f2:	c9                   	leave  
  1011f3:	c3                   	ret    
  1011f4:	48                   	dec    %eax
  1011f5:	75 f8                	jne    1011ef <syscallHandle+0x47>
  1011f7:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1011fa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1011fd:	c9                   	leave  
  1011fe:	e9 51 f3 ff ff       	jmp    100554 <sys_exit>
  101203:	90                   	nop

00101204 <GProtectFaultHandle>:
  101204:	55                   	push   %ebp
  101205:	89 e5                	mov    %esp,%ebp
  101207:	83 ec 14             	sub    $0x14,%esp
  10120a:	68 20 18 10 00       	push   $0x101820
  10120f:	e8 cc 03 00 00       	call   1015e0 <printk>
  101214:	58                   	pop    %eax
  101215:	8b 45 08             	mov    0x8(%ebp),%eax
  101218:	ff 70 30             	pushl  0x30(%eax)
  10121b:	68 78 1a 10 00       	push   $0x101a78
  101220:	6a 78                	push   $0x78
  101222:	68 05 1a 10 00       	push   $0x101a05
  101227:	68 18 1a 10 00       	push   $0x101a18
  10122c:	e8 af 03 00 00       	call   1015e0 <printk>
  101231:	83 c4 14             	add    $0x14,%esp
  101234:	68 4f 18 10 00       	push   $0x10184f
  101239:	e8 a2 03 00 00       	call   1015e0 <printk>
  10123e:	5a                   	pop    %edx
  10123f:	59                   	pop    %ecx
  101240:	6a 79                	push   $0x79
  101242:	68 05 1a 10 00       	push   $0x101a05
  101247:	e8 08 05 00 00       	call   101754 <abort>
  10124c:	83 c4 10             	add    $0x10,%esp
  10124f:	c9                   	leave  
  101250:	c3                   	ret    
  101251:	8d 76 00             	lea    0x0(%esi),%esi

00101254 <timeHandle>:
  101254:	55                   	push   %ebp
  101255:	89 e5                	mov    %esp,%ebp
  101257:	53                   	push   %ebx
  101258:	83 ec 10             	sub    $0x10,%esp
  10125b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10125e:	6a 41                	push   $0x41
  101260:	e8 d3 f5 ff ff       	call   100838 <putChar>
  101265:	e8 ce f6 ff ff       	call   100938 <getpid>
  10126a:	89 c2                	mov    %eax,%edx
  10126c:	c1 e2 07             	shl    $0x7,%edx
  10126f:	01 c2                	add    %eax,%edx
  101271:	01 d2                	add    %edx,%edx
  101273:	01 c2                	add    %eax,%edx
  101275:	8d 04 90             	lea    (%eax,%edx,4),%eax
  101278:	ff 0c c5 d0 5c 10 00 	decl   0x105cd0(,%eax,8)
  10127f:	e8 fc fc ff ff       	call   100f80 <block_decrease>
  101284:	89 1c 24             	mov    %ebx,(%esp)
  101287:	e8 b4 fb ff ff       	call   100e40 <checkTimeCount>
  10128c:	83 c4 10             	add    $0x10,%esp
  10128f:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  101296:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101299:	c9                   	leave  
  10129a:	e9 99 f5 ff ff       	jmp    100838 <putChar>
  10129f:	90                   	nop

001012a0 <irqHandle>:
  1012a0:	55                   	push   %ebp
  1012a1:	89 e5                	mov    %esp,%ebp
  1012a3:	57                   	push   %edi
  1012a4:	56                   	push   %esi
  1012a5:	53                   	push   %ebx
  1012a6:	83 ec 1c             	sub    $0x1c,%esp
  1012a9:	8b 7d 08             	mov    0x8(%ebp),%edi
  1012ac:	b8 10 00 00 00       	mov    $0x10,%eax
  1012b1:	89 c0                	mov    %eax,%eax
  1012b3:	8e d8                	mov    %eax,%ds
  1012b5:	8e e0                	mov    %eax,%fs
  1012b7:	8e c0                	mov    %eax,%es
  1012b9:	8e d0                	mov    %eax,%ss
  1012bb:	b8 30 00 00 00       	mov    $0x30,%eax
  1012c0:	89 c0                	mov    %eax,%eax
  1012c2:	8e e8                	mov    %eax,%gs
  1012c4:	89 ee                	mov    %ebp,%esi
  1012c6:	3b 7e 08             	cmp    0x8(%esi),%edi
  1012c9:	74 12                	je     1012dd <irqHandle+0x3d>
  1012cb:	83 ec 08             	sub    $0x8,%esp
  1012ce:	6a 21                	push   $0x21
  1012d0:	68 05 1a 10 00       	push   $0x101a05
  1012d5:	e8 7a 04 00 00       	call   101754 <abort>
  1012da:	83 c4 10             	add    $0x10,%esp
  1012dd:	e8 56 f6 ff ff       	call   100938 <getpid>
  1012e2:	89 c3                	mov    %eax,%ebx
  1012e4:	e8 4f f6 ff ff       	call   100938 <getpid>
  1012e9:	fa                   	cli    
  1012ea:	8b 47 30             	mov    0x30(%edi),%eax
  1012ed:	83 f8 0d             	cmp    $0xd,%eax
  1012f0:	0f 84 56 01 00 00    	je     10144c <irqHandle+0x1ac>
  1012f6:	0f 8e f8 00 00 00    	jle    1013f4 <irqHandle+0x154>
  1012fc:	83 f8 20             	cmp    $0x20,%eax
  1012ff:	74 2f                	je     101330 <irqHandle+0x90>
  101301:	83 c0 80             	add    $0xffffff80,%eax
  101304:	0f 85 f1 00 00 00    	jne    1013fb <irqHandle+0x15b>
  10130a:	83 ec 0c             	sub    $0xc,%esp
  10130d:	57                   	push   %edi
  10130e:	e8 95 fe ff ff       	call   1011a8 <syscallHandle>
  101313:	8b 47 30             	mov    0x30(%edi),%eax
  101316:	83 c4 10             	add    $0x10,%esp
  101319:	3d 80 00 00 00       	cmp    $0x80,%eax
  10131e:	74 28                	je     101348 <irqHandle+0xa8>
  101320:	83 f8 20             	cmp    $0x20,%eax
  101323:	74 23                	je     101348 <irqHandle+0xa8>
  101325:	fb                   	sti    
  101326:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101329:	5b                   	pop    %ebx
  10132a:	5e                   	pop    %esi
  10132b:	5f                   	pop    %edi
  10132c:	5d                   	pop    %ebp
  10132d:	c3                   	ret    
  10132e:	66 90                	xchg   %ax,%ax
  101330:	83 ec 0c             	sub    $0xc,%esp
  101333:	57                   	push   %edi
  101334:	e8 1b ff ff ff       	call   101254 <timeHandle>
  101339:	8b 47 30             	mov    0x30(%edi),%eax
  10133c:	83 c4 10             	add    $0x10,%esp
  10133f:	3d 80 00 00 00       	cmp    $0x80,%eax
  101344:	75 da                	jne    101320 <irqHandle+0x80>
  101346:	66 90                	xchg   %ax,%ax
  101348:	e8 eb f5 ff ff       	call   100938 <getpid>
  10134d:	39 c3                	cmp    %eax,%ebx
  10134f:	74 d4                	je     101325 <irqHandle+0x85>
  101351:	e8 e2 f5 ff ff       	call   100938 <getpid>
  101356:	89 c2                	mov    %eax,%edx
  101358:	c1 e2 07             	shl    $0x7,%edx
  10135b:	01 c2                	add    %eax,%edx
  10135d:	01 d2                	add    %edx,%edx
  10135f:	01 c2                	add    %eax,%edx
  101361:	8d 04 90             	lea    (%eax,%edx,4),%eax
  101364:	8d 14 c5 30 5c 10 00 	lea    0x105c30(,%eax,8),%edx
  10136b:	89 56 08             	mov    %edx,0x8(%esi)
  10136e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  101371:	e8 c2 f5 ff ff       	call   100938 <getpid>
  101376:	89 c1                	mov    %eax,%ecx
  101378:	c1 e1 07             	shl    $0x7,%ecx
  10137b:	01 c1                	add    %eax,%ecx
  10137d:	01 c9                	add    %ecx,%ecx
  10137f:	01 c1                	add    %eax,%ecx
  101381:	8d 04 88             	lea    (%eax,%ecx,4),%eax
  101384:	8d 34 c5 80 5c 10 00 	lea    0x105c80(,%eax,8),%esi
  10138b:	b9 13 00 00 00       	mov    $0x13,%ecx
  101390:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  101393:	89 d7                	mov    %edx,%edi
  101395:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101397:	e8 9c f5 ff ff       	call   100938 <getpid>
  10139c:	85 c0                	test   %eax,%eax
  10139e:	74 85                	je     101325 <irqHandle+0x85>
  1013a0:	83 ec 0c             	sub    $0xc,%esp
  1013a3:	68 20 18 10 00       	push   $0x101820
  1013a8:	e8 33 02 00 00       	call   1015e0 <printk>
  1013ad:	e8 86 f5 ff ff       	call   100938 <getpid>
  1013b2:	5a                   	pop    %edx
  1013b3:	59                   	pop    %ecx
  1013b4:	50                   	push   %eax
  1013b5:	53                   	push   %ebx
  1013b6:	68 8c 1a 10 00       	push   $0x101a8c
  1013bb:	6a 4b                	push   $0x4b
  1013bd:	68 05 1a 10 00       	push   $0x101a05
  1013c2:	68 58 1a 10 00       	push   $0x101a58
  1013c7:	e8 14 02 00 00       	call   1015e0 <printk>
  1013cc:	83 c4 14             	add    $0x14,%esp
  1013cf:	68 4f 18 10 00       	push   $0x10184f
  1013d4:	e8 07 02 00 00       	call   1015e0 <printk>
  1013d9:	e8 5a f5 ff ff       	call   100938 <getpid>
  1013de:	5b                   	pop    %ebx
  1013df:	5e                   	pop    %esi
  1013e0:	c1 e0 0c             	shl    $0xc,%eax
  1013e3:	50                   	push   %eax
  1013e4:	6a 23                	push   $0x23
  1013e6:	e8 49 ec ff ff       	call   100034 <change_gdt>
  1013eb:	83 c4 10             	add    $0x10,%esp
  1013ee:	e9 32 ff ff ff       	jmp    101325 <irqHandle+0x85>
  1013f3:	90                   	nop
  1013f4:	40                   	inc    %eax
  1013f5:	0f 84 2a ff ff ff    	je     101325 <irqHandle+0x85>
  1013fb:	83 ec 0c             	sub    $0xc,%esp
  1013fe:	68 20 18 10 00       	push   $0x101820
  101403:	e8 d8 01 00 00       	call   1015e0 <printk>
  101408:	58                   	pop    %eax
  101409:	5a                   	pop    %edx
  10140a:	ff 77 38             	pushl  0x38(%edi)
  10140d:	ff 77 30             	pushl  0x30(%edi)
  101410:	68 8c 1a 10 00       	push   $0x101a8c
  101415:	6a 3b                	push   $0x3b
  101417:	68 05 1a 10 00       	push   $0x101a05
  10141c:	68 30 1a 10 00       	push   $0x101a30
  101421:	e8 ba 01 00 00       	call   1015e0 <printk>
  101426:	83 c4 14             	add    $0x14,%esp
  101429:	68 4f 18 10 00       	push   $0x10184f
  10142e:	e8 ad 01 00 00       	call   1015e0 <printk>
  101433:	59                   	pop    %ecx
  101434:	58                   	pop    %eax
  101435:	6a 3c                	push   $0x3c
  101437:	68 05 1a 10 00       	push   $0x101a05
  10143c:	e8 13 03 00 00       	call   101754 <abort>
  101441:	8b 47 30             	mov    0x30(%edi),%eax
  101444:	83 c4 10             	add    $0x10,%esp
  101447:	e9 cd fe ff ff       	jmp    101319 <irqHandle+0x79>
  10144c:	83 ec 0c             	sub    $0xc,%esp
  10144f:	57                   	push   %edi
  101450:	e8 af fd ff ff       	call   101204 <GProtectFaultHandle>
  101455:	8b 47 30             	mov    0x30(%edi),%eax
  101458:	83 c4 10             	add    $0x10,%esp
  10145b:	e9 b9 fe ff ff       	jmp    101319 <irqHandle+0x79>

00101460 <initIntr>:
  101460:	55                   	push   %ebp
  101461:	89 e5                	mov    %esp,%ebp
  101463:	ba 21 00 00 00       	mov    $0x21,%edx
  101468:	b0 ff                	mov    $0xff,%al
  10146a:	ee                   	out    %al,(%dx)
  10146b:	ba a1 00 00 00       	mov    $0xa1,%edx
  101470:	ee                   	out    %al,(%dx)
  101471:	ba 20 00 00 00       	mov    $0x20,%edx
  101476:	b0 11                	mov    $0x11,%al
  101478:	ee                   	out    %al,(%dx)
  101479:	ba 21 00 00 00       	mov    $0x21,%edx
  10147e:	b0 20                	mov    $0x20,%al
  101480:	ee                   	out    %al,(%dx)
  101481:	b0 04                	mov    $0x4,%al
  101483:	ee                   	out    %al,(%dx)
  101484:	b0 03                	mov    $0x3,%al
  101486:	ee                   	out    %al,(%dx)
  101487:	ba a0 00 00 00       	mov    $0xa0,%edx
  10148c:	b0 11                	mov    $0x11,%al
  10148e:	ee                   	out    %al,(%dx)
  10148f:	ba a1 00 00 00       	mov    $0xa1,%edx
  101494:	b0 28                	mov    $0x28,%al
  101496:	ee                   	out    %al,(%dx)
  101497:	b0 02                	mov    $0x2,%al
  101499:	ee                   	out    %al,(%dx)
  10149a:	b0 03                	mov    $0x3,%al
  10149c:	ee                   	out    %al,(%dx)
  10149d:	ba 20 00 00 00       	mov    $0x20,%edx
  1014a2:	b0 68                	mov    $0x68,%al
  1014a4:	ee                   	out    %al,(%dx)
  1014a5:	b0 0a                	mov    $0xa,%al
  1014a7:	ee                   	out    %al,(%dx)
  1014a8:	ba a0 00 00 00       	mov    $0xa0,%edx
  1014ad:	b0 68                	mov    $0x68,%al
  1014af:	ee                   	out    %al,(%dx)
  1014b0:	b0 0a                	mov    $0xa,%al
  1014b2:	ee                   	out    %al,(%dx)
  1014b3:	5d                   	pop    %ebp
  1014b4:	c3                   	ret    
  1014b5:	8d 76 00             	lea    0x0(%esi),%esi

001014b8 <initTimer>:
  1014b8:	55                   	push   %ebp
  1014b9:	89 e5                	mov    %esp,%ebp
  1014bb:	ba 43 00 00 00       	mov    $0x43,%edx
  1014c0:	b0 34                	mov    $0x34,%al
  1014c2:	ee                   	out    %al,(%dx)
  1014c3:	ba 40 00 00 00       	mov    $0x40,%edx
  1014c8:	b0 9b                	mov    $0x9b,%al
  1014ca:	ee                   	out    %al,(%dx)
  1014cb:	b0 2e                	mov    $0x2e,%al
  1014cd:	ee                   	out    %al,(%dx)
  1014ce:	5d                   	pop    %ebp
  1014cf:	c3                   	ret    

001014d0 <i2A>:
  1014d0:	55                   	push   %ebp
  1014d1:	89 e5                	mov    %esp,%ebp
  1014d3:	57                   	push   %edi
  1014d4:	56                   	push   %esi
  1014d5:	53                   	push   %ebx
  1014d6:	51                   	push   %ecx
  1014d7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1014da:	85 c9                	test   %ecx,%ecx
  1014dc:	78 6e                	js     10154c <i2A+0x7c>
  1014de:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  1014e2:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  1014e6:	bb 3e 34 10 00       	mov    $0x10343e,%ebx
  1014eb:	31 ff                	xor    %edi,%edi
  1014ed:	eb 03                	jmp    1014f2 <i2A+0x22>
  1014ef:	90                   	nop
  1014f0:	89 f7                	mov    %esi,%edi
  1014f2:	4b                   	dec    %ebx
  1014f3:	89 c8                	mov    %ecx,%eax
  1014f5:	be 0a 00 00 00       	mov    $0xa,%esi
  1014fa:	99                   	cltd   
  1014fb:	f7 fe                	idiv   %esi
  1014fd:	83 c2 30             	add    $0x30,%edx
  101500:	88 13                	mov    %dl,(%ebx)
  101502:	8d 77 01             	lea    0x1(%edi),%esi
  101505:	b8 67 66 66 66       	mov    $0x66666667,%eax
  10150a:	f7 e9                	imul   %ecx
  10150c:	89 d0                	mov    %edx,%eax
  10150e:	c1 f8 02             	sar    $0x2,%eax
  101511:	c1 f9 1f             	sar    $0x1f,%ecx
  101514:	29 c8                	sub    %ecx,%eax
  101516:	89 c1                	mov    %eax,%ecx
  101518:	75 d6                	jne    1014f0 <i2A+0x20>
  10151a:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  10151e:	74 20                	je     101540 <i2A+0x70>
  101520:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  101524:	75 06                	jne    10152c <i2A+0x5c>
  101526:	fe 05 3d 34 10 00    	incb   0x10343d
  10152c:	c6 05 3e 34 10 00 00 	movb   $0x0,0x10343e
  101533:	8b 45 0c             	mov    0xc(%ebp),%eax
  101536:	89 18                	mov    %ebx,(%eax)
  101538:	89 f0                	mov    %esi,%eax
  10153a:	5a                   	pop    %edx
  10153b:	5b                   	pop    %ebx
  10153c:	5e                   	pop    %esi
  10153d:	5f                   	pop    %edi
  10153e:	5d                   	pop    %ebp
  10153f:	c3                   	ret    
  101540:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  101544:	8d 77 02             	lea    0x2(%edi),%esi
  101547:	4b                   	dec    %ebx
  101548:	eb d6                	jmp    101520 <i2A+0x50>
  10154a:	66 90                	xchg   %ax,%ax
  10154c:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  101552:	74 0c                	je     101560 <i2A+0x90>
  101554:	f7 d9                	neg    %ecx
  101556:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  10155a:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  10155e:	eb 86                	jmp    1014e6 <i2A+0x16>
  101560:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  101565:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101569:	eb ef                	jmp    10155a <i2A+0x8a>
  10156b:	90                   	nop

0010156c <i2X>:
  10156c:	55                   	push   %ebp
  10156d:	89 e5                	mov    %esp,%ebp
  10156f:	57                   	push   %edi
  101570:	56                   	push   %esi
  101571:	53                   	push   %ebx
  101572:	8b 55 08             	mov    0x8(%ebp),%edx
  101575:	b9 1d 34 10 00       	mov    $0x10341d,%ecx
  10157a:	31 c0                	xor    %eax,%eax
  10157c:	40                   	inc    %eax
  10157d:	89 d6                	mov    %edx,%esi
  10157f:	83 e6 0f             	and    $0xf,%esi
  101582:	8d 5e f6             	lea    -0xa(%esi),%ebx
  101585:	89 cf                	mov    %ecx,%edi
  101587:	83 fb 05             	cmp    $0x5,%ebx
  10158a:	77 4c                	ja     1015d8 <i2X+0x6c>
  10158c:	ff 24 9d 98 1a 10 00 	jmp    *0x101a98(,%ebx,4)
  101593:	90                   	nop
  101594:	c6 01 65             	movb   $0x65,(%ecx)
  101597:	90                   	nop
  101598:	49                   	dec    %ecx
  101599:	c1 ea 04             	shr    $0x4,%edx
  10159c:	75 de                	jne    10157c <i2X+0x10>
  10159e:	c6 05 1e 34 10 00 00 	movb   $0x0,0x10341e
  1015a5:	8b 55 0c             	mov    0xc(%ebp),%edx
  1015a8:	89 3a                	mov    %edi,(%edx)
  1015aa:	5b                   	pop    %ebx
  1015ab:	5e                   	pop    %esi
  1015ac:	5f                   	pop    %edi
  1015ad:	5d                   	pop    %ebp
  1015ae:	c3                   	ret    
  1015af:	90                   	nop
  1015b0:	c6 01 64             	movb   $0x64,(%ecx)
  1015b3:	eb e3                	jmp    101598 <i2X+0x2c>
  1015b5:	8d 76 00             	lea    0x0(%esi),%esi
  1015b8:	c6 01 63             	movb   $0x63,(%ecx)
  1015bb:	eb db                	jmp    101598 <i2X+0x2c>
  1015bd:	8d 76 00             	lea    0x0(%esi),%esi
  1015c0:	c6 01 62             	movb   $0x62,(%ecx)
  1015c3:	eb d3                	jmp    101598 <i2X+0x2c>
  1015c5:	8d 76 00             	lea    0x0(%esi),%esi
  1015c8:	c6 01 61             	movb   $0x61,(%ecx)
  1015cb:	eb cb                	jmp    101598 <i2X+0x2c>
  1015cd:	8d 76 00             	lea    0x0(%esi),%esi
  1015d0:	c6 01 66             	movb   $0x66,(%ecx)
  1015d3:	eb c3                	jmp    101598 <i2X+0x2c>
  1015d5:	8d 76 00             	lea    0x0(%esi),%esi
  1015d8:	8d 5e 30             	lea    0x30(%esi),%ebx
  1015db:	88 19                	mov    %bl,(%ecx)
  1015dd:	eb b9                	jmp    101598 <i2X+0x2c>
  1015df:	90                   	nop

001015e0 <printk>:
  1015e0:	55                   	push   %ebp
  1015e1:	89 e5                	mov    %esp,%ebp
  1015e3:	57                   	push   %edi
  1015e4:	56                   	push   %esi
  1015e5:	53                   	push   %ebx
  1015e6:	83 ec 2c             	sub    $0x2c,%esp
  1015e9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1015ec:	8a 11                	mov    (%ecx),%dl
  1015ee:	84 d2                	test   %dl,%dl
  1015f0:	0f 84 54 01 00 00    	je     10174a <printk+0x16a>
  1015f6:	8d 45 0c             	lea    0xc(%ebp),%eax
  1015f9:	31 ff                	xor    %edi,%edi
  1015fb:	eb 18                	jmp    101615 <printk+0x35>
  1015fd:	8d 76 00             	lea    0x0(%esi),%esi
  101600:	8a 11                	mov    (%ecx),%dl
  101602:	89 cb                	mov    %ecx,%ebx
  101604:	88 97 40 34 10 00    	mov    %dl,0x103440(%edi)
  10160a:	47                   	inc    %edi
  10160b:	8d 4b 01             	lea    0x1(%ebx),%ecx
  10160e:	8a 53 01             	mov    0x1(%ebx),%dl
  101611:	84 d2                	test   %dl,%dl
  101613:	74 72                	je     101687 <printk+0xa7>
  101615:	80 fa 25             	cmp    $0x25,%dl
  101618:	75 e6                	jne    101600 <printk+0x20>
  10161a:	8d 59 01             	lea    0x1(%ecx),%ebx
  10161d:	8a 51 01             	mov    0x1(%ecx),%dl
  101620:	80 fa 64             	cmp    $0x64,%dl
  101623:	0f 84 bf 00 00 00    	je     1016e8 <printk+0x108>
  101629:	0f 8e 01 01 00 00    	jle    101730 <printk+0x150>
  10162f:	80 fa 73             	cmp    $0x73,%dl
  101632:	0f 84 84 00 00 00    	je     1016bc <printk+0xdc>
  101638:	80 fa 78             	cmp    $0x78,%dl
  10163b:	75 c7                	jne    101604 <printk+0x24>
  10163d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  101644:	8d 70 04             	lea    0x4(%eax),%esi
  101647:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10164a:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  10164d:	56                   	push   %esi
  10164e:	ff 30                	pushl  (%eax)
  101650:	e8 17 ff ff ff       	call   10156c <i2X>
  101655:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  101658:	8d b7 40 34 10 00    	lea    0x103440(%edi),%esi
  10165e:	8a 11                	mov    (%ecx),%dl
  101660:	83 c4 08             	add    $0x8,%esp
  101663:	31 c0                	xor    %eax,%eax
  101665:	84 d2                	test   %dl,%dl
  101667:	74 0f                	je     101678 <printk+0x98>
  101669:	8d 76 00             	lea    0x0(%esi),%esi
  10166c:	40                   	inc    %eax
  10166d:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101671:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  101674:	84 d2                	test   %dl,%dl
  101676:	75 f4                	jne    10166c <printk+0x8c>
  101678:	01 c7                	add    %eax,%edi
  10167a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10167d:	8d 4b 01             	lea    0x1(%ebx),%ecx
  101680:	8a 53 01             	mov    0x1(%ebx),%dl
  101683:	84 d2                	test   %dl,%dl
  101685:	75 8e                	jne    101615 <printk+0x35>
  101687:	c6 87 40 34 10 00 00 	movb   $0x0,0x103440(%edi)
  10168e:	0f be 05 40 34 10 00 	movsbl 0x103440,%eax
  101695:	bb 40 34 10 00       	mov    $0x103440,%ebx
  10169a:	84 c0                	test   %al,%al
  10169c:	74 16                	je     1016b4 <printk+0xd4>
  10169e:	66 90                	xchg   %ax,%ax
  1016a0:	83 ec 0c             	sub    $0xc,%esp
  1016a3:	50                   	push   %eax
  1016a4:	e8 8f f1 ff ff       	call   100838 <putChar>
  1016a9:	43                   	inc    %ebx
  1016aa:	0f be 03             	movsbl (%ebx),%eax
  1016ad:	83 c4 10             	add    $0x10,%esp
  1016b0:	84 c0                	test   %al,%al
  1016b2:	75 ec                	jne    1016a0 <printk+0xc0>
  1016b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1016b7:	5b                   	pop    %ebx
  1016b8:	5e                   	pop    %esi
  1016b9:	5f                   	pop    %edi
  1016ba:	5d                   	pop    %ebp
  1016bb:	c3                   	ret    
  1016bc:	8d 70 04             	lea    0x4(%eax),%esi
  1016bf:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1016c2:	8b 08                	mov    (%eax),%ecx
  1016c4:	8d b7 40 34 10 00    	lea    0x103440(%edi),%esi
  1016ca:	8a 11                	mov    (%ecx),%dl
  1016cc:	31 c0                	xor    %eax,%eax
  1016ce:	84 d2                	test   %dl,%dl
  1016d0:	74 a6                	je     101678 <printk+0x98>
  1016d2:	66 90                	xchg   %ax,%ax
  1016d4:	40                   	inc    %eax
  1016d5:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1016d9:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  1016dc:	84 d2                	test   %dl,%dl
  1016de:	75 f4                	jne    1016d4 <printk+0xf4>
  1016e0:	01 c7                	add    %eax,%edi
  1016e2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1016e5:	eb 96                	jmp    10167d <printk+0x9d>
  1016e7:	90                   	nop
  1016e8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1016ef:	8d 70 04             	lea    0x4(%eax),%esi
  1016f2:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1016f5:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  1016f8:	56                   	push   %esi
  1016f9:	ff 30                	pushl  (%eax)
  1016fb:	e8 d0 fd ff ff       	call   1014d0 <i2A>
  101700:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  101703:	8d b7 40 34 10 00    	lea    0x103440(%edi),%esi
  101709:	8a 11                	mov    (%ecx),%dl
  10170b:	83 c4 08             	add    $0x8,%esp
  10170e:	31 c0                	xor    %eax,%eax
  101710:	84 d2                	test   %dl,%dl
  101712:	0f 84 60 ff ff ff    	je     101678 <printk+0x98>
  101718:	40                   	inc    %eax
  101719:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  10171d:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  101720:	84 d2                	test   %dl,%dl
  101722:	75 f4                	jne    101718 <printk+0x138>
  101724:	01 c7                	add    %eax,%edi
  101726:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101729:	e9 4f ff ff ff       	jmp    10167d <printk+0x9d>
  10172e:	66 90                	xchg   %ax,%ax
  101730:	80 fa 63             	cmp    $0x63,%dl
  101733:	0f 85 cb fe ff ff    	jne    101604 <printk+0x24>
  101739:	8b 10                	mov    (%eax),%edx
  10173b:	88 97 40 34 10 00    	mov    %dl,0x103440(%edi)
  101741:	83 c0 04             	add    $0x4,%eax
  101744:	47                   	inc    %edi
  101745:	e9 c1 fe ff ff       	jmp    10160b <printk+0x2b>
  10174a:	31 ff                	xor    %edi,%edi
  10174c:	e9 36 ff ff ff       	jmp    101687 <printk+0xa7>
  101751:	66 90                	xchg   %ax,%ax
  101753:	90                   	nop

00101754 <abort>:
  101754:	55                   	push   %ebp
  101755:	89 e5                	mov    %esp,%ebp
  101757:	57                   	push   %edi
  101758:	56                   	push   %esi
  101759:	53                   	push   %ebx
  10175a:	83 ec 1c             	sub    $0x1c,%esp
  10175d:	8b 55 08             	mov    0x8(%ebp),%edx
  101760:	fa                   	cli    
  101761:	8a 02                	mov    (%edx),%al
  101763:	b9 f2 32 10 00       	mov    $0x1032f2,%ecx
  101768:	84 c0                	test   %al,%al
  10176a:	74 0b                	je     101777 <abort+0x23>
  10176c:	41                   	inc    %ecx
  10176d:	42                   	inc    %edx
  10176e:	88 41 ff             	mov    %al,-0x1(%ecx)
  101771:	8a 02                	mov    (%edx),%al
  101773:	84 c0                	test   %al,%al
  101775:	75 f5                	jne    10176c <abort+0x18>
  101777:	c6 01 3a             	movb   $0x3a,(%ecx)
  10177a:	bb 5d 3c 10 00       	mov    $0x103c5d,%ebx
  10177f:	be 0a 00 00 00       	mov    $0xa,%esi
  101784:	bf 67 66 66 66       	mov    $0x66666667,%edi
  101789:	4b                   	dec    %ebx
  10178a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10178d:	99                   	cltd   
  10178e:	f7 fe                	idiv   %esi
  101790:	8d 42 30             	lea    0x30(%edx),%eax
  101793:	88 45 e7             	mov    %al,-0x19(%ebp)
  101796:	88 03                	mov    %al,(%ebx)
  101798:	89 f8                	mov    %edi,%eax
  10179a:	f7 6d 0c             	imull  0xc(%ebp)
  10179d:	c1 fa 02             	sar    $0x2,%edx
  1017a0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1017a3:	c1 f8 1f             	sar    $0x1f,%eax
  1017a6:	29 c2                	sub    %eax,%edx
  1017a8:	89 55 0c             	mov    %edx,0xc(%ebp)
  1017ab:	75 dc                	jne    101789 <abort+0x35>
  1017ad:	41                   	inc    %ecx
  1017ae:	41                   	inc    %ecx
  1017af:	43                   	inc    %ebx
  1017b0:	8a 45 e7             	mov    -0x19(%ebp),%al
  1017b3:	88 41 ff             	mov    %al,-0x1(%ecx)
  1017b6:	8a 03                	mov    (%ebx),%al
  1017b8:	88 45 e7             	mov    %al,-0x19(%ebp)
  1017bb:	84 c0                	test   %al,%al
  1017bd:	75 ef                	jne    1017ae <abort+0x5a>
  1017bf:	c6 01 0a             	movb   $0xa,(%ecx)
  1017c2:	0f be 05 e0 32 10 00 	movsbl 0x1032e0,%eax
  1017c9:	84 c0                	test   %al,%al
  1017cb:	74 1b                	je     1017e8 <abort+0x94>
  1017cd:	bb e0 32 10 00       	mov    $0x1032e0,%ebx
  1017d2:	83 ec 0c             	sub    $0xc,%esp
  1017d5:	50                   	push   %eax
  1017d6:	e8 5d f0 ff ff       	call   100838 <putChar>
  1017db:	43                   	inc    %ebx
  1017dc:	0f be 03             	movsbl (%ebx),%eax
  1017df:	83 c4 10             	add    $0x10,%esp
  1017e2:	84 c0                	test   %al,%al
  1017e4:	75 ec                	jne    1017d2 <abort+0x7e>
  1017e6:	66 90                	xchg   %ax,%ax
  1017e8:	f4                   	hlt    
  1017e9:	eb fd                	jmp    1017e8 <abort+0x94>

001017eb <irqEmpty>:
  1017eb:	6a 00                	push   $0x0
  1017ed:	6a ff                	push   $0xffffffff
  1017ef:	eb 13                	jmp    101804 <asmDoIrq>

001017f1 <irqGProtectFault>:
  1017f1:	6a 0d                	push   $0xd
  1017f3:	eb 0f                	jmp    101804 <asmDoIrq>

001017f5 <irqSyscall>:
  1017f5:	6a 00                	push   $0x0
  1017f7:	68 80 00 00 00       	push   $0x80
  1017fc:	eb 06                	jmp    101804 <asmDoIrq>

001017fe <irqTime>:
  1017fe:	6a 00                	push   $0x0
  101800:	6a 20                	push   $0x20
  101802:	eb 00                	jmp    101804 <asmDoIrq>

00101804 <asmDoIrq>:
  101804:	60                   	pusha  
  101805:	1e                   	push   %ds
  101806:	06                   	push   %es
  101807:	0f a0                	push   %fs
  101809:	0f a8                	push   %gs
  10180b:	54                   	push   %esp
  10180c:	e8 8f fa ff ff       	call   1012a0 <irqHandle>
  101811:	5c                   	pop    %esp
  101812:	0f a9                	pop    %gs
  101814:	0f a1                	pop    %fs
  101816:	07                   	pop    %es
  101817:	1f                   	pop    %ds
  101818:	61                   	popa   
  101819:	83 c4 04             	add    $0x4,%esp
  10181c:	83 c4 04             	add    $0x4,%esp
  10181f:	cf                   	iret   
