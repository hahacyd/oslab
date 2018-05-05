
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 95 14 00 00       	call   1014a0 <initTimer>
  10000b:	e8 b0 0f 00 00       	call   100fc0 <init_pcb>
  100010:	e8 ef 0f 00 00       	call   101004 <init_kernel_pcb>
  100015:	e8 da 07 00 00       	call   1007f4 <initSerial>
  10001a:	e8 a5 10 00 00       	call   1010c4 <initIdt>
  10001f:	e8 24 14 00 00       	call   101448 <initIntr>
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
  100133:	68 08 18 10 00       	push   $0x101808
  100138:	e8 8b 14 00 00       	call   1015c8 <printk>
  10013d:	89 1c 24             	mov    %ebx,(%esp)
  100140:	68 48 18 10 00       	push   $0x101848
  100145:	6a 18                	push   $0x18
  100147:	68 0e 18 10 00       	push   $0x10180e
  10014c:	68 1b 18 10 00       	push   $0x10181b
  100151:	e8 72 14 00 00       	call   1015c8 <printk>
  100156:	83 c4 14             	add    $0x14,%esp
  100159:	68 37 18 10 00       	push   $0x101837
  10015e:	e8 65 14 00 00       	call   1015c8 <printk>
  100163:	58                   	pop    %eax
  100164:	5a                   	pop    %edx
  100165:	6a 19                	push   $0x19
  100167:	68 0e 18 10 00       	push   $0x10180e
  10016c:	e8 cb 15 00 00       	call   10173c <abort>
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
  10036d:	a1 40 18 10 00       	mov    0x101840,%eax
  100372:	8b 15 44 18 10 00    	mov    0x101844,%edx
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
  10048a:	e8 95 05 00 00       	call   100a24 <put_into_runnable>
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
  10055a:	68 53 18 10 00       	push   $0x101853
  10055f:	e8 64 10 00 00       	call   1015c8 <printk>
  100564:	e8 fb 03 00 00       	call   100964 <get_from_runnable>
  100569:	5a                   	pop    %edx
  10056a:	59                   	pop    %ecx
  10056b:	ff 75 08             	pushl  0x8(%ebp)
  10056e:	50                   	push   %eax
  10056f:	e8 88 03 00 00       	call   1008fc <put_into_running>
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
  100584:	e8 ab 03 00 00       	call   100934 <getpid>
  100589:	83 ec 08             	sub    $0x8,%esp
  10058c:	53                   	push   %ebx
  10058d:	50                   	push   %eax
  10058e:	e8 c1 05 00 00       	call   100b54 <put_into_block>
  100593:	c7 04 24 08 18 10 00 	movl   $0x101808,(%esp)
  10059a:	e8 29 10 00 00       	call   1015c8 <printk>
  10059f:	e8 90 03 00 00       	call   100934 <getpid>
  1005a4:	89 c2                	mov    %eax,%edx
  1005a6:	c1 e2 07             	shl    $0x7,%edx
  1005a9:	01 c2                	add    %eax,%edx
  1005ab:	01 d2                	add    %edx,%edx
  1005ad:	01 c2                	add    %eax,%edx
  1005af:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1005b2:	8b 34 c5 d4 5c 10 00 	mov    0x105cd4(,%eax,8),%esi
  1005b9:	e8 76 03 00 00       	call   100934 <getpid>
  1005be:	5a                   	pop    %edx
  1005bf:	59                   	pop    %ecx
  1005c0:	56                   	push   %esi
  1005c1:	50                   	push   %eax
  1005c2:	68 a4 18 10 00       	push   $0x1018a4
  1005c7:	6a 09                	push   $0x9
  1005c9:	68 61 18 10 00       	push   $0x101861
  1005ce:	68 80 18 10 00       	push   $0x101880
  1005d3:	e8 f0 0f 00 00       	call   1015c8 <printk>
  1005d8:	83 c4 14             	add    $0x14,%esp
  1005db:	68 37 18 10 00       	push   $0x101837
  1005e0:	e8 e3 0f 00 00       	call   1015c8 <printk>
  1005e5:	e8 7a 03 00 00       	call   100964 <get_from_runnable>
  1005ea:	5e                   	pop    %esi
  1005eb:	5a                   	pop    %edx
  1005ec:	53                   	push   %ebx
  1005ed:	50                   	push   %eax
  1005ee:	e8 09 03 00 00       	call   1008fc <put_into_running>
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
  10060c:	68 ae 18 10 00       	push   $0x1018ae
  100611:	e8 b2 0f 00 00       	call   1015c8 <printk>
  100616:	83 c4 10             	add    $0x10,%esp
  100619:	31 db                	xor    %ebx,%ebx
  10061b:	90                   	nop
  10061c:	e8 13 03 00 00       	call   100934 <getpid>
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
  10064a:	e8 e5 02 00 00       	call   100934 <getpid>
  10064f:	8d 50 40             	lea    0x40(%eax),%edx
  100652:	c1 e2 10             	shl    $0x10,%edx
  100655:	b8 00 00 01 00       	mov    $0x10000,%eax
  10065a:	66 90                	xchg   %ax,%ax
  10065c:	8a 8c 10 00 00 ff ff 	mov    -0x10000(%eax,%edx,1),%cl
  100663:	88 88 00 00 41 00    	mov    %cl,0x410000(%eax)
  100669:	48                   	dec    %eax
  10066a:	75 f0                	jne    10065c <sys_fork+0x5c>
  10066c:	b8 50 9d 10 00       	mov    $0x109d50,%eax
  100671:	b9 13 00 00 00       	mov    $0x13,%ecx
  100676:	89 c7                	mov    %eax,%edi
  100678:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10067a:	c7 05 7c 9d 10 00 00 	movl   $0x0,0x109d7c
  100681:	00 00 00 
  100684:	83 ec 08             	sub    $0x8,%esp
  100687:	50                   	push   %eax
  100688:	6a 02                	push   $0x2
  10068a:	e8 95 03 00 00       	call   100a24 <put_into_runnable>
  10068f:	b8 02 00 00 00       	mov    $0x2,%eax
  100694:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100697:	5b                   	pop    %ebx
  100698:	5e                   	pop    %esi
  100699:	5f                   	pop    %edi
  10069a:	5d                   	pop    %ebp
  10069b:	c3                   	ret    

0010069c <display>:
  10069c:	55                   	push   %ebp
  10069d:	89 e5                	mov    %esp,%ebp
  10069f:	57                   	push   %edi
  1006a0:	53                   	push   %ebx
  1006a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1006a4:	80 fb 0a             	cmp    $0xa,%bl
  1006a7:	74 5b                	je     100704 <display+0x68>
  1006a9:	8b 15 e8 33 10 00    	mov    0x1033e8,%edx
  1006af:	8b 0d ec 33 10 00    	mov    0x1033ec,%ecx
  1006b5:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  1006b8:	c1 e0 04             	shl    $0x4,%eax
  1006bb:	01 d0                	add    %edx,%eax
  1006bd:	01 c0                	add    %eax,%eax
  1006bf:	89 c7                	mov    %eax,%edi
  1006c1:	0f be db             	movsbl %bl,%ebx
  1006c4:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
  1006ca:	66 89 d8             	mov    %bx,%ax
  1006cd:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1006d1:	42                   	inc    %edx
  1006d2:	83 fa 50             	cmp    $0x50,%edx
  1006d5:	75 1d                	jne    1006f4 <display+0x58>
  1006d7:	c7 05 e8 33 10 00 00 	movl   $0x0,0x1033e8
  1006de:	00 00 00 
  1006e1:	41                   	inc    %ecx
  1006e2:	89 0d ec 33 10 00    	mov    %ecx,0x1033ec
  1006e8:	b8 01 00 00 00       	mov    $0x1,%eax
  1006ed:	5b                   	pop    %ebx
  1006ee:	5f                   	pop    %edi
  1006ef:	5d                   	pop    %ebp
  1006f0:	c3                   	ret    
  1006f1:	8d 76 00             	lea    0x0(%esi),%esi
  1006f4:	89 15 e8 33 10 00    	mov    %edx,0x1033e8
  1006fa:	b8 01 00 00 00       	mov    $0x1,%eax
  1006ff:	5b                   	pop    %ebx
  100700:	5f                   	pop    %edi
  100701:	5d                   	pop    %ebp
  100702:	c3                   	ret    
  100703:	90                   	nop
  100704:	c7 05 e8 33 10 00 00 	movl   $0x0,0x1033e8
  10070b:	00 00 00 
  10070e:	ff 05 ec 33 10 00    	incl   0x1033ec
  100714:	b8 01 00 00 00       	mov    $0x1,%eax
  100719:	5b                   	pop    %ebx
  10071a:	5f                   	pop    %edi
  10071b:	5d                   	pop    %ebp
  10071c:	c3                   	ret    
  10071d:	8d 76 00             	lea    0x0(%esi),%esi

00100720 <printkernel>:
  100720:	55                   	push   %ebp
  100721:	89 e5                	mov    %esp,%ebp
  100723:	53                   	push   %ebx
  100724:	50                   	push   %eax
  100725:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100728:	0f be 03             	movsbl (%ebx),%eax
  10072b:	84 c0                	test   %al,%al
  10072d:	74 20                	je     10074f <printkernel+0x2f>
  10072f:	90                   	nop
  100730:	83 ec 0c             	sub    $0xc,%esp
  100733:	50                   	push   %eax
  100734:	e8 fb 00 00 00       	call   100834 <putChar>
  100739:	0f be 03             	movsbl (%ebx),%eax
  10073c:	89 04 24             	mov    %eax,(%esp)
  10073f:	e8 58 ff ff ff       	call   10069c <display>
  100744:	43                   	inc    %ebx
  100745:	0f be 03             	movsbl (%ebx),%eax
  100748:	83 c4 10             	add    $0x10,%esp
  10074b:	84 c0                	test   %al,%al
  10074d:	75 e1                	jne    100730 <printkernel+0x10>
  10074f:	b8 01 00 00 00       	mov    $0x1,%eax
  100754:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100757:	c9                   	leave  
  100758:	c3                   	ret    
  100759:	8d 76 00             	lea    0x0(%esi),%esi

0010075c <fs_write>:
  10075c:	55                   	push   %ebp
  10075d:	89 e5                	mov    %esp,%ebp
  10075f:	53                   	push   %ebx
  100760:	50                   	push   %eax
  100761:	8b 5d 10             	mov    0x10(%ebp),%ebx
  100764:	ba 30 00 00 00       	mov    $0x30,%edx
  100769:	89 d0                	mov    %edx,%eax
  10076b:	8e e8                	mov    %eax,%gs
  10076d:	8b 45 08             	mov    0x8(%ebp),%eax
  100770:	48                   	dec    %eax
  100771:	83 f8 01             	cmp    $0x1,%eax
  100774:	76 12                	jbe    100788 <fs_write+0x2c>
  100776:	83 ec 08             	sub    $0x8,%esp
  100779:	6a 27                	push   $0x27
  10077b:	68 ca 18 10 00       	push   $0x1018ca
  100780:	e8 b7 0f 00 00       	call   10173c <abort>
  100785:	83 c4 10             	add    $0x10,%esp
  100788:	83 ec 08             	sub    $0x8,%esp
  10078b:	53                   	push   %ebx
  10078c:	ff 75 0c             	pushl  0xc(%ebp)
  10078f:	e8 8c ff ff ff       	call   100720 <printkernel>
  100794:	89 d8                	mov    %ebx,%eax
  100796:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100799:	c9                   	leave  
  10079a:	c3                   	ret    
  10079b:	90                   	nop

0010079c <sys_write>:
  10079c:	55                   	push   %ebp
  10079d:	89 e5                	mov    %esp,%ebp
  10079f:	56                   	push   %esi
  1007a0:	53                   	push   %ebx
  1007a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1007a4:	8b 73 24             	mov    0x24(%ebx),%esi
  1007a7:	e8 88 01 00 00       	call   100934 <getpid>
  1007ac:	52                   	push   %edx
  1007ad:	56                   	push   %esi
  1007ae:	c1 e0 10             	shl    $0x10,%eax
  1007b1:	03 43 28             	add    0x28(%ebx),%eax
  1007b4:	50                   	push   %eax
  1007b5:	ff 73 20             	pushl  0x20(%ebx)
  1007b8:	e8 9f ff ff ff       	call   10075c <fs_write>
  1007bd:	89 43 2c             	mov    %eax,0x2c(%ebx)
  1007c0:	83 c4 10             	add    $0x10,%esp
  1007c3:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1007c6:	5b                   	pop    %ebx
  1007c7:	5e                   	pop    %esi
  1007c8:	5d                   	pop    %ebp
  1007c9:	c3                   	ret    
  1007ca:	66 90                	xchg   %ax,%ax

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

00100858 <put_into_running.part.0>:
  100858:	55                   	push   %ebp
  100859:	89 e5                	mov    %esp,%ebp
  10085b:	53                   	push   %ebx
  10085c:	83 ec 7c             	sub    $0x7c,%esp
  10085f:	89 c3                	mov    %eax,%ebx
  100861:	a3 60 3c 10 00       	mov    %eax,0x103c60
  100866:	c1 e0 07             	shl    $0x7,%eax
  100869:	01 d8                	add    %ebx,%eax
  10086b:	01 c0                	add    %eax,%eax
  10086d:	01 d8                	add    %ebx,%eax
  10086f:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100872:	8d 04 c5 7c 5c 10 00 	lea    0x105c7c(,%eax,8),%eax
  100879:	50                   	push   %eax
  10087a:	6a 10                	push   $0x10
  10087c:	e8 33 f9 ff ff       	call   1001b4 <change_tss>
  100881:	8d 45 94             	lea    -0x6c(%ebp),%eax
  100884:	89 04 24             	mov    %eax,(%esp)
  100887:	e8 44 f9 ff ff       	call   1001d0 <get_tss>
  10088c:	8b 15 60 3c 10 00    	mov    0x103c60,%edx
  100892:	89 d0                	mov    %edx,%eax
  100894:	c1 e0 07             	shl    $0x7,%eax
  100897:	01 d0                	add    %edx,%eax
  100899:	01 c0                	add    %eax,%eax
  10089b:	01 d0                	add    %edx,%eax
  10089d:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1008a0:	8d 04 c5 7c 5c 10 00 	lea    0x105c7c(,%eax,8),%eax
  1008a7:	83 c4 0c             	add    $0xc,%esp
  1008aa:	39 45 98             	cmp    %eax,-0x68(%ebp)
  1008ad:	74 12                	je     1008c1 <put_into_running.part.0+0x69>
  1008af:	83 ec 08             	sub    $0x8,%esp
  1008b2:	6a 10                	push   $0x10
  1008b4:	68 e6 18 10 00       	push   $0x1018e6
  1008b9:	e8 7e 0e 00 00       	call   10173c <abort>
  1008be:	83 c4 10             	add    $0x10,%esp
  1008c1:	83 ec 0c             	sub    $0xc,%esp
  1008c4:	68 08 18 10 00       	push   $0x101808
  1008c9:	e8 fa 0c 00 00       	call   1015c8 <printk>
  1008ce:	89 1c 24             	mov    %ebx,(%esp)
  1008d1:	68 dc 19 10 00       	push   $0x1019dc
  1008d6:	6a 12                	push   $0x12
  1008d8:	68 e6 18 10 00       	push   $0x1018e6
  1008dd:	68 f4 18 10 00       	push   $0x1018f4
  1008e2:	e8 e1 0c 00 00       	call   1015c8 <printk>
  1008e7:	83 c4 14             	add    $0x14,%esp
  1008ea:	68 37 18 10 00       	push   $0x101837
  1008ef:	e8 d4 0c 00 00       	call   1015c8 <printk>
  1008f4:	83 c4 10             	add    $0x10,%esp
  1008f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1008fa:	c9                   	leave  
  1008fb:	c3                   	ret    

001008fc <put_into_running>:
  1008fc:	55                   	push   %ebp
  1008fd:	89 e5                	mov    %esp,%ebp
  1008ff:	83 ec 08             	sub    $0x8,%esp
  100902:	8b 45 08             	mov    0x8(%ebp),%eax
  100905:	39 05 60 3c 10 00    	cmp    %eax,0x103c60
  10090b:	74 05                	je     100912 <put_into_running+0x16>
  10090d:	e8 46 ff ff ff       	call   100858 <put_into_running.part.0>
  100912:	b8 01 00 00 00       	mov    $0x1,%eax
  100917:	c9                   	leave  
  100918:	c3                   	ret    
  100919:	8d 76 00             	lea    0x0(%esi),%esi

0010091c <update_block>:
  10091c:	55                   	push   %ebp
  10091d:	89 e5                	mov    %esp,%ebp
  10091f:	b8 01 00 00 00       	mov    $0x1,%eax
  100924:	5d                   	pop    %ebp
  100925:	c3                   	ret    
  100926:	66 90                	xchg   %ax,%ax

00100928 <apply_new_pid>:
  100928:	55                   	push   %ebp
  100929:	89 e5                	mov    %esp,%ebp
  10092b:	b8 02 00 00 00       	mov    $0x2,%eax
  100930:	5d                   	pop    %ebp
  100931:	c3                   	ret    
  100932:	66 90                	xchg   %ax,%ax

00100934 <getpid>:
  100934:	55                   	push   %ebp
  100935:	89 e5                	mov    %esp,%ebp
  100937:	a1 60 3c 10 00       	mov    0x103c60,%eax
  10093c:	5d                   	pop    %ebp
  10093d:	c3                   	ret    
  10093e:	66 90                	xchg   %ax,%ax

00100940 <getrunnable>:
  100940:	55                   	push   %ebp
  100941:	89 e5                	mov    %esp,%ebp
  100943:	a1 c4 32 10 00       	mov    0x1032c4,%eax
  100948:	5d                   	pop    %ebp
  100949:	c3                   	ret    
  10094a:	66 90                	xchg   %ax,%ax

0010094c <getblocked>:
  10094c:	55                   	push   %ebp
  10094d:	89 e5                	mov    %esp,%ebp
  10094f:	a1 c0 32 10 00       	mov    0x1032c0,%eax
  100954:	5d                   	pop    %ebp
  100955:	c3                   	ret    
  100956:	66 90                	xchg   %ax,%ax

00100958 <transfer_pid_mode>:
  100958:	55                   	push   %ebp
  100959:	89 e5                	mov    %esp,%ebp
  10095b:	b8 01 00 00 00       	mov    $0x1,%eax
  100960:	5d                   	pop    %ebp
  100961:	c3                   	ret    
  100962:	66 90                	xchg   %ax,%ax

00100964 <get_from_runnable>:
  100964:	55                   	push   %ebp
  100965:	89 e5                	mov    %esp,%ebp
  100967:	53                   	push   %ebx
  100968:	51                   	push   %ecx
  100969:	8b 1d c4 32 10 00    	mov    0x1032c4,%ebx
  10096f:	83 fb ff             	cmp    $0xffffffff,%ebx
  100972:	0f 84 a4 00 00 00    	je     100a1c <get_from_runnable+0xb8>
  100978:	89 d8                	mov    %ebx,%eax
  10097a:	c1 e0 07             	shl    $0x7,%eax
  10097d:	01 d8                	add    %ebx,%eax
  10097f:	01 c0                	add    %eax,%eax
  100981:	01 d8                	add    %ebx,%eax
  100983:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100986:	8d 04 c5 80 3c 10 00 	lea    0x103c80(,%eax,8),%eax
  10098d:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100993:	39 da                	cmp    %ebx,%edx
  100995:	74 79                	je     100a10 <get_from_runnable+0xac>
  100997:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  10099d:	89 c8                	mov    %ecx,%eax
  10099f:	c1 e0 07             	shl    $0x7,%eax
  1009a2:	01 c8                	add    %ecx,%eax
  1009a4:	01 c0                	add    %eax,%eax
  1009a6:	01 c8                	add    %ecx,%eax
  1009a8:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  1009ab:	89 14 c5 e0 5c 10 00 	mov    %edx,0x105ce0(,%eax,8)
  1009b2:	89 d0                	mov    %edx,%eax
  1009b4:	c1 e0 07             	shl    $0x7,%eax
  1009b7:	01 d0                	add    %edx,%eax
  1009b9:	01 c0                	add    %eax,%eax
  1009bb:	01 d0                	add    %edx,%eax
  1009bd:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1009c0:	89 0c c5 dc 5c 10 00 	mov    %ecx,0x105cdc(,%eax,8)
  1009c7:	89 15 c4 32 10 00    	mov    %edx,0x1032c4
  1009cd:	83 ec 0c             	sub    $0xc,%esp
  1009d0:	68 08 18 10 00       	push   $0x101808
  1009d5:	e8 ee 0b 00 00       	call   1015c8 <printk>
  1009da:	58                   	pop    %eax
  1009db:	5a                   	pop    %edx
  1009dc:	ff 35 c4 32 10 00    	pushl  0x1032c4
  1009e2:	53                   	push   %ebx
  1009e3:	68 b8 19 10 00       	push   $0x1019b8
  1009e8:	6a 61                	push   $0x61
  1009ea:	68 e6 18 10 00       	push   $0x1018e6
  1009ef:	68 14 19 10 00       	push   $0x101914
  1009f4:	e8 cf 0b 00 00       	call   1015c8 <printk>
  1009f9:	83 c4 14             	add    $0x14,%esp
  1009fc:	68 37 18 10 00       	push   $0x101837
  100a01:	e8 c2 0b 00 00       	call   1015c8 <printk>
  100a06:	83 c4 10             	add    $0x10,%esp
  100a09:	89 d8                	mov    %ebx,%eax
  100a0b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100a0e:	c9                   	leave  
  100a0f:	c3                   	ret    
  100a10:	c7 05 c4 32 10 00 ff 	movl   $0xffffffff,0x1032c4
  100a17:	ff ff ff 
  100a1a:	eb b1                	jmp    1009cd <get_from_runnable+0x69>
  100a1c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100a21:	eb e8                	jmp    100a0b <get_from_runnable+0xa7>
  100a23:	90                   	nop

00100a24 <put_into_runnable>:
  100a24:	55                   	push   %ebp
  100a25:	89 e5                	mov    %esp,%ebp
  100a27:	56                   	push   %esi
  100a28:	53                   	push   %ebx
  100a29:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100a2c:	8b 15 c4 32 10 00    	mov    0x1032c4,%edx
  100a32:	83 fa ff             	cmp    $0xffffffff,%edx
  100a35:	0f 84 ed 00 00 00    	je     100b28 <put_into_runnable+0x104>
  100a3b:	89 d0                	mov    %edx,%eax
  100a3d:	c1 e0 07             	shl    $0x7,%eax
  100a40:	01 d0                	add    %edx,%eax
  100a42:	01 c0                	add    %eax,%eax
  100a44:	01 d0                	add    %edx,%eax
  100a46:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100a49:	8d 34 c5 80 3c 10 00 	lea    0x103c80(,%eax,8),%esi
  100a50:	8b 8e 5c 20 00 00    	mov    0x205c(%esi),%ecx
  100a56:	89 c8                	mov    %ecx,%eax
  100a58:	c1 e0 07             	shl    $0x7,%eax
  100a5b:	01 c8                	add    %ecx,%eax
  100a5d:	01 c0                	add    %eax,%eax
  100a5f:	01 c8                	add    %ecx,%eax
  100a61:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100a64:	89 1c c5 e0 5c 10 00 	mov    %ebx,0x105ce0(,%eax,8)
  100a6b:	89 d8                	mov    %ebx,%eax
  100a6d:	c1 e0 07             	shl    $0x7,%eax
  100a70:	01 d8                	add    %ebx,%eax
  100a72:	01 c0                	add    %eax,%eax
  100a74:	01 d8                	add    %ebx,%eax
  100a76:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100a79:	8d 04 c5 80 3c 10 00 	lea    0x103c80(,%eax,8),%eax
  100a80:	89 88 5c 20 00 00    	mov    %ecx,0x205c(%eax)
  100a86:	89 90 60 20 00 00    	mov    %edx,0x2060(%eax)
  100a8c:	89 9e 5c 20 00 00    	mov    %ebx,0x205c(%esi)
  100a92:	89 d8                	mov    %ebx,%eax
  100a94:	c1 e0 07             	shl    $0x7,%eax
  100a97:	01 d8                	add    %ebx,%eax
  100a99:	01 c0                	add    %eax,%eax
  100a9b:	01 d8                	add    %ebx,%eax
  100a9d:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100aa0:	c7 04 c5 cc 5c 10 00 	movl   $0x1,0x105ccc(,%eax,8)
  100aa7:	01 00 00 00 
  100aab:	85 db                	test   %ebx,%ebx
  100aad:	75 0a                	jne    100ab9 <put_into_runnable+0x95>
  100aaf:	c7 05 b8 5c 10 00 50 	movl   $0x100850,0x105cb8
  100ab6:	08 10 00 
  100ab9:	83 ec 0c             	sub    $0xc,%esp
  100abc:	68 08 18 10 00       	push   $0x101808
  100ac1:	e8 02 0b 00 00       	call   1015c8 <printk>
  100ac6:	58                   	pop    %eax
  100ac7:	5a                   	pop    %edx
  100ac8:	53                   	push   %ebx
  100ac9:	ff 35 c4 32 10 00    	pushl  0x1032c4
  100acf:	68 a4 19 10 00       	push   $0x1019a4
  100ad4:	6a 7d                	push   $0x7d
  100ad6:	68 e6 18 10 00       	push   $0x1018e6
  100adb:	68 48 19 10 00       	push   $0x101948
  100ae0:	e8 e3 0a 00 00       	call   1015c8 <printk>
  100ae5:	83 c4 14             	add    $0x14,%esp
  100ae8:	68 37 18 10 00       	push   $0x101837
  100aed:	e8 d6 0a 00 00       	call   1015c8 <printk>
  100af2:	89 d8                	mov    %ebx,%eax
  100af4:	c1 e0 07             	shl    $0x7,%eax
  100af7:	01 d8                	add    %ebx,%eax
  100af9:	01 c0                	add    %eax,%eax
  100afb:	01 d8                	add    %ebx,%eax
  100afd:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b00:	8d 04 c5 80 3c 10 00 	lea    0x103c80(,%eax,8),%eax
  100b07:	8b 15 68 3c 10 00    	mov    0x103c68,%edx
  100b0d:	89 90 50 20 00 00    	mov    %edx,0x2050(%eax)
  100b13:	8b 55 0c             	mov    0xc(%ebp),%edx
  100b16:	89 90 64 20 00 00    	mov    %edx,0x2064(%eax)
  100b1c:	b8 01 00 00 00       	mov    $0x1,%eax
  100b21:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100b24:	5b                   	pop    %ebx
  100b25:	5e                   	pop    %esi
  100b26:	5d                   	pop    %ebp
  100b27:	c3                   	ret    
  100b28:	89 1d c4 32 10 00    	mov    %ebx,0x1032c4
  100b2e:	89 d8                	mov    %ebx,%eax
  100b30:	c1 e0 07             	shl    $0x7,%eax
  100b33:	01 d8                	add    %ebx,%eax
  100b35:	01 c0                	add    %eax,%eax
  100b37:	01 d8                	add    %ebx,%eax
  100b39:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b3c:	8d 04 c5 80 3c 10 00 	lea    0x103c80(,%eax,8),%eax
  100b43:	89 98 5c 20 00 00    	mov    %ebx,0x205c(%eax)
  100b49:	89 98 60 20 00 00    	mov    %ebx,0x2060(%eax)
  100b4f:	e9 3e ff ff ff       	jmp    100a92 <put_into_runnable+0x6e>

00100b54 <put_into_block>:
  100b54:	55                   	push   %ebp
  100b55:	89 e5                	mov    %esp,%ebp
  100b57:	57                   	push   %edi
  100b58:	56                   	push   %esi
  100b59:	53                   	push   %ebx
  100b5a:	8b 45 08             	mov    0x8(%ebp),%eax
  100b5d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100b60:	8b 0d c0 32 10 00    	mov    0x1032c0,%ecx
  100b66:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100b69:	0f 84 99 00 00 00    	je     100c08 <put_into_block+0xb4>
  100b6f:	89 ca                	mov    %ecx,%edx
  100b71:	c1 e2 07             	shl    $0x7,%edx
  100b74:	01 ca                	add    %ecx,%edx
  100b76:	01 d2                	add    %edx,%edx
  100b78:	01 ca                	add    %ecx,%edx
  100b7a:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100b7d:	8d 3c d5 80 3c 10 00 	lea    0x103c80(,%edx,8),%edi
  100b84:	8b b7 5c 20 00 00    	mov    0x205c(%edi),%esi
  100b8a:	89 f2                	mov    %esi,%edx
  100b8c:	c1 e2 07             	shl    $0x7,%edx
  100b8f:	01 f2                	add    %esi,%edx
  100b91:	01 d2                	add    %edx,%edx
  100b93:	01 f2                	add    %esi,%edx
  100b95:	8d 14 96             	lea    (%esi,%edx,4),%edx
  100b98:	89 04 d5 e0 5c 10 00 	mov    %eax,0x105ce0(,%edx,8)
  100b9f:	89 c2                	mov    %eax,%edx
  100ba1:	c1 e2 07             	shl    $0x7,%edx
  100ba4:	01 c2                	add    %eax,%edx
  100ba6:	01 d2                	add    %edx,%edx
  100ba8:	01 c2                	add    %eax,%edx
  100baa:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100bad:	8d 14 d5 80 3c 10 00 	lea    0x103c80(,%edx,8),%edx
  100bb4:	89 b2 5c 20 00 00    	mov    %esi,0x205c(%edx)
  100bba:	89 8a 60 20 00 00    	mov    %ecx,0x2060(%edx)
  100bc0:	89 87 5c 20 00 00    	mov    %eax,0x205c(%edi)
  100bc6:	89 c2                	mov    %eax,%edx
  100bc8:	c1 e2 07             	shl    $0x7,%edx
  100bcb:	01 c2                	add    %eax,%edx
  100bcd:	01 d2                	add    %edx,%edx
  100bcf:	01 c2                	add    %eax,%edx
  100bd1:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100bd4:	c1 e2 03             	shl    $0x3,%edx
  100bd7:	8d 82 80 5c 10 00    	lea    0x105c80(%edx),%eax
  100bdd:	b9 13 00 00 00       	mov    $0x13,%ecx
  100be2:	89 c7                	mov    %eax,%edi
  100be4:	89 de                	mov    %ebx,%esi
  100be6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100be8:	8b 43 20             	mov    0x20(%ebx),%eax
  100beb:	89 82 d4 5c 10 00    	mov    %eax,0x105cd4(%edx)
  100bf1:	c7 82 cc 5c 10 00 00 	movl   $0x0,0x105ccc(%edx)
  100bf8:	00 00 00 
  100bfb:	b8 01 00 00 00       	mov    $0x1,%eax
  100c00:	5b                   	pop    %ebx
  100c01:	5e                   	pop    %esi
  100c02:	5f                   	pop    %edi
  100c03:	5d                   	pop    %ebp
  100c04:	c3                   	ret    
  100c05:	8d 76 00             	lea    0x0(%esi),%esi
  100c08:	a3 c0 32 10 00       	mov    %eax,0x1032c0
  100c0d:	89 c2                	mov    %eax,%edx
  100c0f:	c1 e2 07             	shl    $0x7,%edx
  100c12:	01 c2                	add    %eax,%edx
  100c14:	01 d2                	add    %edx,%edx
  100c16:	01 c2                	add    %eax,%edx
  100c18:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c1b:	8d 14 d5 80 3c 10 00 	lea    0x103c80(,%edx,8),%edx
  100c22:	89 82 60 20 00 00    	mov    %eax,0x2060(%edx)
  100c28:	89 82 5c 20 00 00    	mov    %eax,0x205c(%edx)
  100c2e:	eb 96                	jmp    100bc6 <put_into_block+0x72>

00100c30 <get_from>:
  100c30:	55                   	push   %ebp
  100c31:	89 e5                	mov    %esp,%ebp
  100c33:	56                   	push   %esi
  100c34:	53                   	push   %ebx
  100c35:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100c38:	8b 45 0c             	mov    0xc(%ebp),%eax
  100c3b:	85 db                	test   %ebx,%ebx
  100c3d:	0f 8e 01 01 00 00    	jle    100d44 <get_from+0x114>
  100c43:	39 c3                	cmp    %eax,%ebx
  100c45:	74 42                	je     100c89 <get_from+0x59>
  100c47:	89 da                	mov    %ebx,%edx
  100c49:	c1 e2 07             	shl    $0x7,%edx
  100c4c:	01 da                	add    %ebx,%edx
  100c4e:	01 d2                	add    %edx,%edx
  100c50:	01 da                	add    %ebx,%edx
  100c52:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100c55:	8b 0c d5 e0 5c 10 00 	mov    0x105ce0(,%edx,8),%ecx
  100c5c:	39 cb                	cmp    %ecx,%ebx
  100c5e:	75 25                	jne    100c85 <get_from+0x55>
  100c60:	e9 df 00 00 00       	jmp    100d44 <get_from+0x114>
  100c65:	8d 76 00             	lea    0x0(%esi),%esi
  100c68:	89 ca                	mov    %ecx,%edx
  100c6a:	c1 e2 07             	shl    $0x7,%edx
  100c6d:	01 ca                	add    %ecx,%edx
  100c6f:	01 d2                	add    %edx,%edx
  100c71:	01 ca                	add    %ecx,%edx
  100c73:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100c76:	8b 0c d5 e0 5c 10 00 	mov    0x105ce0(,%edx,8),%ecx
  100c7d:	39 cb                	cmp    %ecx,%ebx
  100c7f:	0f 84 bf 00 00 00    	je     100d44 <get_from+0x114>
  100c85:	39 c1                	cmp    %eax,%ecx
  100c87:	75 df                	jne    100c68 <get_from+0x38>
  100c89:	89 c2                	mov    %eax,%edx
  100c8b:	c1 e2 07             	shl    $0x7,%edx
  100c8e:	01 c2                	add    %eax,%edx
  100c90:	01 d2                	add    %edx,%edx
  100c92:	01 c2                	add    %eax,%edx
  100c94:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100c97:	8b 04 c5 cc 5c 10 00 	mov    0x105ccc(,%eax,8),%eax
  100c9e:	85 c0                	test   %eax,%eax
  100ca0:	0f 84 c2 00 00 00    	je     100d68 <get_from+0x138>
  100ca6:	48                   	dec    %eax
  100ca7:	75 7f                	jne    100d28 <get_from+0xf8>
  100ca9:	be c4 32 10 00       	mov    $0x1032c4,%esi
  100cae:	3b 1e                	cmp    (%esi),%ebx
  100cb0:	74 15                	je     100cc7 <get_from+0x97>
  100cb2:	83 ec 08             	sub    $0x8,%esp
  100cb5:	68 bf 00 00 00       	push   $0xbf
  100cba:	68 e6 18 10 00       	push   $0x1018e6
  100cbf:	e8 78 0a 00 00       	call   10173c <abort>
  100cc4:	83 c4 10             	add    $0x10,%esp
  100cc7:	89 d8                	mov    %ebx,%eax
  100cc9:	c1 e0 07             	shl    $0x7,%eax
  100ccc:	01 d8                	add    %ebx,%eax
  100cce:	01 c0                	add    %eax,%eax
  100cd0:	01 d8                	add    %ebx,%eax
  100cd2:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100cd5:	8d 04 c5 80 3c 10 00 	lea    0x103c80(,%eax,8),%eax
  100cdc:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100ce2:	39 da                	cmp    %ebx,%edx
  100ce4:	0f 84 8a 00 00 00    	je     100d74 <get_from+0x144>
  100cea:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100cf0:	89 c8                	mov    %ecx,%eax
  100cf2:	c1 e0 07             	shl    $0x7,%eax
  100cf5:	01 c8                	add    %ecx,%eax
  100cf7:	01 c0                	add    %eax,%eax
  100cf9:	01 c8                	add    %ecx,%eax
  100cfb:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100cfe:	89 14 c5 e0 5c 10 00 	mov    %edx,0x105ce0(,%eax,8)
  100d05:	89 d0                	mov    %edx,%eax
  100d07:	c1 e0 07             	shl    $0x7,%eax
  100d0a:	01 d0                	add    %edx,%eax
  100d0c:	01 c0                	add    %eax,%eax
  100d0e:	01 d0                	add    %edx,%eax
  100d10:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100d13:	89 0c c5 dc 5c 10 00 	mov    %ecx,0x105cdc(,%eax,8)
  100d1a:	89 16                	mov    %edx,(%esi)
  100d1c:	89 d8                	mov    %ebx,%eax
  100d1e:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d21:	5b                   	pop    %ebx
  100d22:	5e                   	pop    %esi
  100d23:	5d                   	pop    %ebp
  100d24:	c3                   	ret    
  100d25:	8d 76 00             	lea    0x0(%esi),%esi
  100d28:	83 ec 08             	sub    $0x8,%esp
  100d2b:	68 bb 00 00 00       	push   $0xbb
  100d30:	68 e6 18 10 00       	push   $0x1018e6
  100d35:	e8 02 0a 00 00       	call   10173c <abort>
  100d3a:	a1 00 00 00 00       	mov    0x0,%eax
  100d3f:	0f 0b                	ud2    
  100d41:	8d 76 00             	lea    0x0(%esi),%esi
  100d44:	83 ec 08             	sub    $0x8,%esp
  100d47:	68 ac 00 00 00       	push   $0xac
  100d4c:	68 e6 18 10 00       	push   $0x1018e6
  100d51:	e8 e6 09 00 00       	call   10173c <abort>
  100d56:	83 c4 10             	add    $0x10,%esp
  100d59:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100d5e:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d61:	5b                   	pop    %ebx
  100d62:	5e                   	pop    %esi
  100d63:	5d                   	pop    %ebp
  100d64:	c3                   	ret    
  100d65:	8d 76 00             	lea    0x0(%esi),%esi
  100d68:	be c0 32 10 00       	mov    $0x1032c0,%esi
  100d6d:	e9 3c ff ff ff       	jmp    100cae <get_from+0x7e>
  100d72:	66 90                	xchg   %ax,%ax
  100d74:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100d7a:	89 d8                	mov    %ebx,%eax
  100d7c:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d7f:	5b                   	pop    %ebx
  100d80:	5e                   	pop    %esi
  100d81:	5d                   	pop    %ebp
  100d82:	c3                   	ret    
  100d83:	90                   	nop

00100d84 <get_from_block>:
  100d84:	55                   	push   %ebp
  100d85:	89 e5                	mov    %esp,%ebp
  100d87:	83 ec 10             	sub    $0x10,%esp
  100d8a:	ff 75 08             	pushl  0x8(%ebp)
  100d8d:	ff 35 c0 32 10 00    	pushl  0x1032c0
  100d93:	e8 98 fe ff ff       	call   100c30 <get_from>
  100d98:	83 c4 10             	add    $0x10,%esp
  100d9b:	40                   	inc    %eax
  100d9c:	74 0a                	je     100da8 <get_from_block+0x24>
  100d9e:	b8 01 00 00 00       	mov    $0x1,%eax
  100da3:	c9                   	leave  
  100da4:	c3                   	ret    
  100da5:	8d 76 00             	lea    0x0(%esi),%esi
  100da8:	83 ec 08             	sub    $0x8,%esp
  100dab:	68 f6 00 00 00       	push   $0xf6
  100db0:	68 e6 18 10 00       	push   $0x1018e6
  100db5:	e8 82 09 00 00       	call   10173c <abort>
  100dba:	83 c4 10             	add    $0x10,%esp
  100dbd:	b8 01 00 00 00       	mov    $0x1,%eax
  100dc2:	c9                   	leave  
  100dc3:	c3                   	ret    

00100dc4 <check_block>:
  100dc4:	55                   	push   %ebp
  100dc5:	89 e5                	mov    %esp,%ebp
  100dc7:	57                   	push   %edi
  100dc8:	56                   	push   %esi
  100dc9:	53                   	push   %ebx
  100dca:	83 ec 0c             	sub    $0xc,%esp
  100dcd:	a1 c0 32 10 00       	mov    0x1032c0,%eax
  100dd2:	89 c6                	mov    %eax,%esi
  100dd4:	83 f8 ff             	cmp    $0xffffffff,%eax
  100dd7:	74 58                	je     100e31 <check_block+0x6d>
  100dd9:	89 c2                	mov    %eax,%edx
  100ddb:	c1 e2 07             	shl    $0x7,%edx
  100dde:	01 c2                	add    %eax,%edx
  100de0:	01 d2                	add    %edx,%edx
  100de2:	01 c2                	add    %eax,%edx
  100de4:	8d 3c 90             	lea    (%eax,%edx,4),%edi
  100de7:	eb 0c                	jmp    100df5 <check_block+0x31>
  100de9:	8d 76 00             	lea    0x0(%esi),%esi
  100dec:	39 c6                	cmp    %eax,%esi
  100dee:	74 3c                	je     100e2c <check_block+0x68>
  100df0:	83 f8 ff             	cmp    $0xffffffff,%eax
  100df3:	74 37                	je     100e2c <check_block+0x68>
  100df5:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
  100dfc:	8b 8b d4 5c 10 00    	mov    0x105cd4(%ebx),%ecx
  100e02:	85 c9                	test   %ecx,%ecx
  100e04:	7f e6                	jg     100dec <check_block+0x28>
  100e06:	83 ec 0c             	sub    $0xc,%esp
  100e09:	56                   	push   %esi
  100e0a:	e8 75 ff ff ff       	call   100d84 <get_from_block>
  100e0f:	58                   	pop    %eax
  100e10:	5a                   	pop    %edx
  100e11:	81 c3 80 5c 10 00    	add    $0x105c80,%ebx
  100e17:	53                   	push   %ebx
  100e18:	56                   	push   %esi
  100e19:	e8 06 fc ff ff       	call   100a24 <put_into_runnable>
  100e1e:	83 c4 10             	add    $0x10,%esp
  100e21:	a1 c0 32 10 00       	mov    0x1032c0,%eax
  100e26:	39 c6                	cmp    %eax,%esi
  100e28:	75 c6                	jne    100df0 <check_block+0x2c>
  100e2a:	66 90                	xchg   %ax,%ax
  100e2c:	be 01 00 00 00       	mov    $0x1,%esi
  100e31:	89 f0                	mov    %esi,%eax
  100e33:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100e36:	5b                   	pop    %ebx
  100e37:	5e                   	pop    %esi
  100e38:	5f                   	pop    %edi
  100e39:	5d                   	pop    %ebp
  100e3a:	c3                   	ret    
  100e3b:	90                   	nop

00100e3c <checkTimeCount>:
  100e3c:	a1 64 3c 10 00       	mov    0x103c64,%eax
  100e41:	85 c0                	test   %eax,%eax
  100e43:	0f 84 cb 00 00 00    	je     100f14 <checkTimeCount+0xd8>
  100e49:	55                   	push   %ebp
  100e4a:	89 e5                	mov    %esp,%ebp
  100e4c:	57                   	push   %edi
  100e4d:	56                   	push   %esi
  100e4e:	83 ec 0c             	sub    $0xc,%esp
  100e51:	68 08 18 10 00       	push   $0x101808
  100e56:	e8 6d 07 00 00       	call   1015c8 <printk>
  100e5b:	8b 15 60 3c 10 00    	mov    0x103c60,%edx
  100e61:	58                   	pop    %eax
  100e62:	59                   	pop    %ecx
  100e63:	89 d0                	mov    %edx,%eax
  100e65:	c1 e0 07             	shl    $0x7,%eax
  100e68:	01 d0                	add    %edx,%eax
  100e6a:	01 c0                	add    %eax,%eax
  100e6c:	01 d0                	add    %edx,%eax
  100e6e:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100e71:	ff 34 c5 d0 5c 10 00 	pushl  0x105cd0(,%eax,8)
  100e78:	52                   	push   %edx
  100e79:	68 cc 19 10 00       	push   $0x1019cc
  100e7e:	6a 1f                	push   $0x1f
  100e80:	68 e6 18 10 00       	push   $0x1018e6
  100e85:	68 78 19 10 00       	push   $0x101978
  100e8a:	e8 39 07 00 00       	call   1015c8 <printk>
  100e8f:	83 c4 14             	add    $0x14,%esp
  100e92:	68 37 18 10 00       	push   $0x101837
  100e97:	e8 2c 07 00 00       	call   1015c8 <printk>
  100e9c:	e8 23 ff ff ff       	call   100dc4 <check_block>
  100ea1:	8b 15 60 3c 10 00    	mov    0x103c60,%edx
  100ea7:	89 d0                	mov    %edx,%eax
  100ea9:	c1 e0 07             	shl    $0x7,%eax
  100eac:	01 d0                	add    %edx,%eax
  100eae:	01 c0                	add    %eax,%eax
  100eb0:	01 d0                	add    %edx,%eax
  100eb2:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100eb5:	c1 e0 03             	shl    $0x3,%eax
  100eb8:	83 c4 10             	add    $0x10,%esp
  100ebb:	8b b0 d0 5c 10 00    	mov    0x105cd0(%eax),%esi
  100ec1:	85 f6                	test   %esi,%esi
  100ec3:	7e 0f                	jle    100ed4 <checkTimeCount+0x98>
  100ec5:	b8 01 00 00 00       	mov    $0x1,%eax
  100eca:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100ecd:	5e                   	pop    %esi
  100ece:	5f                   	pop    %edi
  100ecf:	5d                   	pop    %ebp
  100ed0:	c3                   	ret    
  100ed1:	8d 76 00             	lea    0x0(%esi),%esi
  100ed4:	05 80 5c 10 00       	add    $0x105c80,%eax
  100ed9:	b9 13 00 00 00       	mov    $0x13,%ecx
  100ede:	89 c7                	mov    %eax,%edi
  100ee0:	8b 75 08             	mov    0x8(%ebp),%esi
  100ee3:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100ee5:	83 ec 08             	sub    $0x8,%esp
  100ee8:	ff 75 08             	pushl  0x8(%ebp)
  100eeb:	52                   	push   %edx
  100eec:	e8 33 fb ff ff       	call   100a24 <put_into_runnable>
  100ef1:	e8 6e fa ff ff       	call   100964 <get_from_runnable>
  100ef6:	83 c4 10             	add    $0x10,%esp
  100ef9:	3b 05 60 3c 10 00    	cmp    0x103c60,%eax
  100eff:	74 c4                	je     100ec5 <checkTimeCount+0x89>
  100f01:	e8 52 f9 ff ff       	call   100858 <put_into_running.part.0>
  100f06:	b8 01 00 00 00       	mov    $0x1,%eax
  100f0b:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100f0e:	5e                   	pop    %esi
  100f0f:	5f                   	pop    %edi
  100f10:	5d                   	pop    %ebp
  100f11:	c3                   	ret    
  100f12:	66 90                	xchg   %ax,%ax
  100f14:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100f19:	c3                   	ret    
  100f1a:	66 90                	xchg   %ax,%ax

00100f1c <check_is_in>:
  100f1c:	55                   	push   %ebp
  100f1d:	89 e5                	mov    %esp,%ebp
  100f1f:	53                   	push   %ebx
  100f20:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100f23:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100f26:	85 c9                	test   %ecx,%ecx
  100f28:	7e 4a                	jle    100f74 <check_is_in+0x58>
  100f2a:	39 d9                	cmp    %ebx,%ecx
  100f2c:	74 3b                	je     100f69 <check_is_in+0x4d>
  100f2e:	89 c8                	mov    %ecx,%eax
  100f30:	c1 e0 07             	shl    $0x7,%eax
  100f33:	01 c8                	add    %ecx,%eax
  100f35:	01 c0                	add    %eax,%eax
  100f37:	01 c8                	add    %ecx,%eax
  100f39:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100f3c:	8b 14 c5 e0 5c 10 00 	mov    0x105ce0(,%eax,8),%edx
  100f43:	39 d1                	cmp    %edx,%ecx
  100f45:	75 1e                	jne    100f65 <check_is_in+0x49>
  100f47:	eb 2b                	jmp    100f74 <check_is_in+0x58>
  100f49:	8d 76 00             	lea    0x0(%esi),%esi
  100f4c:	89 d0                	mov    %edx,%eax
  100f4e:	c1 e0 07             	shl    $0x7,%eax
  100f51:	01 d0                	add    %edx,%eax
  100f53:	01 c0                	add    %eax,%eax
  100f55:	01 d0                	add    %edx,%eax
  100f57:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100f5a:	8b 14 c5 e0 5c 10 00 	mov    0x105ce0(,%eax,8),%edx
  100f61:	39 d1                	cmp    %edx,%ecx
  100f63:	74 0f                	je     100f74 <check_is_in+0x58>
  100f65:	39 d3                	cmp    %edx,%ebx
  100f67:	75 e3                	jne    100f4c <check_is_in+0x30>
  100f69:	b8 01 00 00 00       	mov    $0x1,%eax
  100f6e:	5b                   	pop    %ebx
  100f6f:	5d                   	pop    %ebp
  100f70:	c3                   	ret    
  100f71:	8d 76 00             	lea    0x0(%esi),%esi
  100f74:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100f79:	5b                   	pop    %ebx
  100f7a:	5d                   	pop    %ebp
  100f7b:	c3                   	ret    

00100f7c <block_decrease>:
  100f7c:	55                   	push   %ebp
  100f7d:	89 e5                	mov    %esp,%ebp
  100f7f:	8b 0d c0 32 10 00    	mov    0x1032c0,%ecx
  100f85:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100f88:	74 2e                	je     100fb8 <block_decrease+0x3c>
  100f8a:	89 ca                	mov    %ecx,%edx
  100f8c:	89 d0                	mov    %edx,%eax
  100f8e:	c1 e0 07             	shl    $0x7,%eax
  100f91:	01 d0                	add    %edx,%eax
  100f93:	01 c0                	add    %eax,%eax
  100f95:	01 d0                	add    %edx,%eax
  100f97:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100f9a:	8d 04 c5 80 3c 10 00 	lea    0x103c80(,%eax,8),%eax
  100fa1:	ff 88 54 20 00 00    	decl   0x2054(%eax)
  100fa7:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100fad:	39 d1                	cmp    %edx,%ecx
  100faf:	75 db                	jne    100f8c <block_decrease+0x10>
  100fb1:	b8 01 00 00 00       	mov    $0x1,%eax
  100fb6:	5d                   	pop    %ebp
  100fb7:	c3                   	ret    
  100fb8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100fbd:	5d                   	pop    %ebp
  100fbe:	c3                   	ret    
  100fbf:	90                   	nop

00100fc0 <init_pcb>:
  100fc0:	55                   	push   %ebp
  100fc1:	89 e5                	mov    %esp,%ebp
  100fc3:	c7 05 68 3c 10 00 05 	movl   $0x5,0x103c68
  100fca:	00 00 00 
  100fcd:	ba d8 5c 10 00       	mov    $0x105cd8,%edx
  100fd2:	31 c0                	xor    %eax,%eax
  100fd4:	89 02                	mov    %eax,(%edx)
  100fd6:	8d 48 ff             	lea    -0x1(%eax),%ecx
  100fd9:	89 4a 04             	mov    %ecx,0x4(%edx)
  100fdc:	40                   	inc    %eax
  100fdd:	89 42 08             	mov    %eax,0x8(%edx)
  100fe0:	81 c2 68 20 00 00    	add    $0x2068,%edx
  100fe6:	3d 00 08 00 00       	cmp    $0x800,%eax
  100feb:	75 e7                	jne    100fd4 <init_pcb+0x14>
  100fed:	c7 05 dc 5c 10 00 ff 	movl   $0x7ff,0x105cdc
  100ff4:	07 00 00 
  100ff7:	c7 05 78 7c 13 01 00 	movl   $0x0,0x1137c78
  100ffe:	00 00 00 
  101001:	5d                   	pop    %ebp
  101002:	c3                   	ret    
  101003:	90                   	nop

00101004 <init_kernel_pcb>:
  101004:	55                   	push   %ebp
  101005:	89 e5                	mov    %esp,%ebp
  101007:	c7 05 c8 5c 10 00 10 	movl   $0x10,0x105cc8
  10100e:	00 00 00 
  101011:	c7 05 bc 5c 10 00 08 	movl   $0x8,0x105cbc
  101018:	00 00 00 
  10101b:	c7 05 8c 5c 10 00 10 	movl   $0x10,0x105c8c
  101022:	00 00 00 
  101025:	c7 05 88 5c 10 00 10 	movl   $0x10,0x105c88
  10102c:	00 00 00 
  10102f:	c7 05 b8 5c 10 00 50 	movl   $0x100850,0x105cb8
  101036:	08 10 00 
  101039:	c7 05 c4 5c 10 00 00 	movl   $0x400000,0x105cc4
  101040:	00 40 00 
  101043:	c7 05 cc 5c 10 00 01 	movl   $0x1,0x105ccc
  10104a:	00 00 00 
  10104d:	c7 05 d0 5c 10 00 04 	movl   $0x4,0x105cd0
  101054:	00 00 00 
  101057:	b8 01 00 00 00       	mov    $0x1,%eax
  10105c:	5d                   	pop    %ebp
  10105d:	c3                   	ret    
  10105e:	66 90                	xchg   %ax,%ax

00101060 <transfer_pid_state>:
  101060:	55                   	push   %ebp
  101061:	89 e5                	mov    %esp,%ebp
  101063:	b8 01 00 00 00       	mov    $0x1,%eax
  101068:	5d                   	pop    %ebp
  101069:	c3                   	ret    
  10106a:	66 90                	xchg   %ax,%ax

0010106c <make_pcb>:
  10106c:	55                   	push   %ebp
  10106d:	89 e5                	mov    %esp,%ebp
  10106f:	57                   	push   %edi
  101070:	56                   	push   %esi
  101071:	8b 55 08             	mov    0x8(%ebp),%edx
  101074:	89 d0                	mov    %edx,%eax
  101076:	c1 e0 07             	shl    $0x7,%eax
  101079:	01 d0                	add    %edx,%eax
  10107b:	01 c0                	add    %eax,%eax
  10107d:	01 d0                	add    %edx,%eax
  10107f:	8d 14 82             	lea    (%edx,%eax,4),%edx
  101082:	c1 e2 03             	shl    $0x3,%edx
  101085:	8d 82 80 5c 10 00    	lea    0x105c80(%edx),%eax
  10108b:	b9 13 00 00 00       	mov    $0x13,%ecx
  101090:	89 c7                	mov    %eax,%edi
  101092:	8b 75 0c             	mov    0xc(%ebp),%esi
  101095:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101097:	8b 45 10             	mov    0x10(%ebp),%eax
  10109a:	89 82 cc 5c 10 00    	mov    %eax,0x105ccc(%edx)
  1010a0:	8b 45 14             	mov    0x14(%ebp),%eax
  1010a3:	89 82 d0 5c 10 00    	mov    %eax,0x105cd0(%edx)
  1010a9:	8b 45 18             	mov    0x18(%ebp),%eax
  1010ac:	89 82 d4 5c 10 00    	mov    %eax,0x105cd4(%edx)
  1010b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1010b5:	89 82 e4 5c 10 00    	mov    %eax,0x105ce4(%edx)
  1010bb:	b8 01 00 00 00       	mov    $0x1,%eax
  1010c0:	5e                   	pop    %esi
  1010c1:	5f                   	pop    %edi
  1010c2:	5d                   	pop    %ebp
  1010c3:	c3                   	ret    

001010c4 <initIdt>:
  1010c4:	55                   	push   %ebp
  1010c5:	89 e5                	mov    %esp,%ebp
  1010c7:	53                   	push   %ebx
  1010c8:	ba d3 17 10 00       	mov    $0x1017d3,%edx
  1010cd:	89 d3                	mov    %edx,%ebx
  1010cf:	c1 ea 10             	shr    $0x10,%edx
  1010d2:	b9 40 85 13 01       	mov    $0x1138540,%ecx
  1010d7:	b8 40 7d 13 01       	mov    $0x1137d40,%eax
  1010dc:	66 89 18             	mov    %bx,(%eax)
  1010df:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  1010e5:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  1010e9:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  1010ed:	66 89 50 06          	mov    %dx,0x6(%eax)
  1010f1:	83 c0 08             	add    $0x8,%eax
  1010f4:	39 c1                	cmp    %eax,%ecx
  1010f6:	75 e4                	jne    1010dc <initIdt+0x18>
  1010f8:	b8 d9 17 10 00       	mov    $0x1017d9,%eax
  1010fd:	66 a3 a8 7d 13 01    	mov    %ax,0x1137da8
  101103:	66 c7 05 aa 7d 13 01 	movw   $0x8,0x1137daa
  10110a:	08 00 
  10110c:	c6 05 ac 7d 13 01 00 	movb   $0x0,0x1137dac
  101113:	c6 05 ad 7d 13 01 8f 	movb   $0x8f,0x1137dad
  10111a:	c1 e8 10             	shr    $0x10,%eax
  10111d:	66 a3 ae 7d 13 01    	mov    %ax,0x1137dae
  101123:	b8 dd 17 10 00       	mov    $0x1017dd,%eax
  101128:	66 a3 40 81 13 01    	mov    %ax,0x1138140
  10112e:	66 c7 05 42 81 13 01 	movw   $0x8,0x1138142
  101135:	08 00 
  101137:	c6 05 44 81 13 01 00 	movb   $0x0,0x1138144
  10113e:	c6 05 45 81 13 01 ee 	movb   $0xee,0x1138145
  101145:	c1 e8 10             	shr    $0x10,%eax
  101148:	66 a3 46 81 13 01    	mov    %ax,0x1138146
  10114e:	b8 e6 17 10 00       	mov    $0x1017e6,%eax
  101153:	66 a3 40 7e 13 01    	mov    %ax,0x1137e40
  101159:	66 c7 05 42 7e 13 01 	movw   $0x8,0x1137e42
  101160:	08 00 
  101162:	c6 05 44 7e 13 01 00 	movb   $0x0,0x1137e44
  101169:	c6 05 45 7e 13 01 8e 	movb   $0x8e,0x1137e45
  101170:	c1 e8 10             	shr    $0x10,%eax
  101173:	66 a3 46 7e 13 01    	mov    %ax,0x1137e46
  101179:	66 c7 05 f0 33 10 00 	movw   $0x7ff,0x1033f0
  101180:	ff 07 
  101182:	b8 40 7d 13 01       	mov    $0x1137d40,%eax
  101187:	66 a3 f2 33 10 00    	mov    %ax,0x1033f2
  10118d:	c1 e8 10             	shr    $0x10,%eax
  101190:	66 a3 f4 33 10 00    	mov    %ax,0x1033f4
  101196:	b8 f0 33 10 00       	mov    $0x1033f0,%eax
  10119b:	0f 01 18             	lidtl  (%eax)
  10119e:	5b                   	pop    %ebx
  10119f:	5d                   	pop    %ebp
  1011a0:	c3                   	ret    
  1011a1:	66 90                	xchg   %ax,%ax
  1011a3:	90                   	nop

001011a4 <syscallHandle>:
  1011a4:	55                   	push   %ebp
  1011a5:	89 e5                	mov    %esp,%ebp
  1011a7:	53                   	push   %ebx
  1011a8:	50                   	push   %eax
  1011a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1011ac:	8b 43 2c             	mov    0x2c(%ebx),%eax
  1011af:	83 f8 02             	cmp    $0x2,%eax
  1011b2:	74 28                	je     1011dc <syscallHandle+0x38>
  1011b4:	76 3a                	jbe    1011f0 <syscallHandle+0x4c>
  1011b6:	83 f8 04             	cmp    $0x4,%eax
  1011b9:	74 15                	je     1011d0 <syscallHandle+0x2c>
  1011bb:	3d e6 00 00 00       	cmp    $0xe6,%eax
  1011c0:	75 29                	jne    1011eb <syscallHandle+0x47>
  1011c2:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1011c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1011c8:	c9                   	leave  
  1011c9:	e9 ae f3 ff ff       	jmp    10057c <sys_sleep>
  1011ce:	66 90                	xchg   %ax,%ax
  1011d0:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1011d3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1011d6:	c9                   	leave  
  1011d7:	e9 c0 f5 ff ff       	jmp    10079c <sys_write>
  1011dc:	83 ec 0c             	sub    $0xc,%esp
  1011df:	53                   	push   %ebx
  1011e0:	e8 1b f4 ff ff       	call   100600 <sys_fork>
  1011e5:	89 43 2c             	mov    %eax,0x2c(%ebx)
  1011e8:	83 c4 10             	add    $0x10,%esp
  1011eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1011ee:	c9                   	leave  
  1011ef:	c3                   	ret    
  1011f0:	48                   	dec    %eax
  1011f1:	75 f8                	jne    1011eb <syscallHandle+0x47>
  1011f3:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1011f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1011f9:	c9                   	leave  
  1011fa:	e9 55 f3 ff ff       	jmp    100554 <sys_exit>
  1011ff:	90                   	nop

00101200 <GProtectFaultHandle>:
  101200:	55                   	push   %ebp
  101201:	89 e5                	mov    %esp,%ebp
  101203:	83 ec 14             	sub    $0x14,%esp
  101206:	68 08 18 10 00       	push   $0x101808
  10120b:	e8 b8 03 00 00       	call   1015c8 <printk>
  101210:	58                   	pop    %eax
  101211:	8b 45 08             	mov    0x8(%ebp),%eax
  101214:	ff 70 30             	pushl  0x30(%eax)
  101217:	68 60 1a 10 00       	push   $0x101a60
  10121c:	6a 6d                	push   $0x6d
  10121e:	68 ed 19 10 00       	push   $0x1019ed
  101223:	68 00 1a 10 00       	push   $0x101a00
  101228:	e8 9b 03 00 00       	call   1015c8 <printk>
  10122d:	83 c4 14             	add    $0x14,%esp
  101230:	68 37 18 10 00       	push   $0x101837
  101235:	e8 8e 03 00 00       	call   1015c8 <printk>
  10123a:	5a                   	pop    %edx
  10123b:	59                   	pop    %ecx
  10123c:	6a 6e                	push   $0x6e
  10123e:	68 ed 19 10 00       	push   $0x1019ed
  101243:	e8 f4 04 00 00       	call   10173c <abort>
  101248:	83 c4 10             	add    $0x10,%esp
  10124b:	c9                   	leave  
  10124c:	c3                   	ret    
  10124d:	8d 76 00             	lea    0x0(%esi),%esi

00101250 <timeHandle>:
  101250:	55                   	push   %ebp
  101251:	89 e5                	mov    %esp,%ebp
  101253:	53                   	push   %ebx
  101254:	83 ec 10             	sub    $0x10,%esp
  101257:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10125a:	6a 41                	push   $0x41
  10125c:	e8 d3 f5 ff ff       	call   100834 <putChar>
  101261:	e8 ce f6 ff ff       	call   100934 <getpid>
  101266:	89 c2                	mov    %eax,%edx
  101268:	c1 e2 07             	shl    $0x7,%edx
  10126b:	01 c2                	add    %eax,%edx
  10126d:	01 d2                	add    %edx,%edx
  10126f:	01 c2                	add    %eax,%edx
  101271:	8d 04 90             	lea    (%eax,%edx,4),%eax
  101274:	ff 0c c5 d0 5c 10 00 	decl   0x105cd0(,%eax,8)
  10127b:	e8 fc fc ff ff       	call   100f7c <block_decrease>
  101280:	89 1c 24             	mov    %ebx,(%esp)
  101283:	e8 b4 fb ff ff       	call   100e3c <checkTimeCount>
  101288:	83 c4 10             	add    $0x10,%esp
  10128b:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  101292:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101295:	c9                   	leave  
  101296:	e9 99 f5 ff ff       	jmp    100834 <putChar>
  10129b:	90                   	nop

0010129c <irqHandle>:
  10129c:	55                   	push   %ebp
  10129d:	89 e5                	mov    %esp,%ebp
  10129f:	57                   	push   %edi
  1012a0:	56                   	push   %esi
  1012a1:	53                   	push   %ebx
  1012a2:	83 ec 0c             	sub    $0xc,%esp
  1012a5:	8b 7d 08             	mov    0x8(%ebp),%edi
  1012a8:	b8 10 00 00 00       	mov    $0x10,%eax
  1012ad:	89 c0                	mov    %eax,%eax
  1012af:	8e d8                	mov    %eax,%ds
  1012b1:	8e e0                	mov    %eax,%fs
  1012b3:	8e c0                	mov    %eax,%es
  1012b5:	8e d0                	mov    %eax,%ss
  1012b7:	b8 30 00 00 00       	mov    $0x30,%eax
  1012bc:	89 c0                	mov    %eax,%eax
  1012be:	8e e8                	mov    %eax,%gs
  1012c0:	89 ee                	mov    %ebp,%esi
  1012c2:	3b 7e 08             	cmp    0x8(%esi),%edi
  1012c5:	74 12                	je     1012d9 <irqHandle+0x3d>
  1012c7:	83 ec 08             	sub    $0x8,%esp
  1012ca:	6a 21                	push   $0x21
  1012cc:	68 ed 19 10 00       	push   $0x1019ed
  1012d1:	e8 66 04 00 00       	call   10173c <abort>
  1012d6:	83 c4 10             	add    $0x10,%esp
  1012d9:	8b 1d 60 3c 10 00    	mov    0x103c60,%ebx
  1012df:	fa                   	cli    
  1012e0:	8b 47 30             	mov    0x30(%edi),%eax
  1012e3:	83 f8 0d             	cmp    $0xd,%eax
  1012e6:	0f 84 48 01 00 00    	je     101434 <irqHandle+0x198>
  1012ec:	0f 8e ea 00 00 00    	jle    1013dc <irqHandle+0x140>
  1012f2:	83 f8 20             	cmp    $0x20,%eax
  1012f5:	74 2d                	je     101324 <irqHandle+0x88>
  1012f7:	83 c0 80             	add    $0xffffff80,%eax
  1012fa:	0f 85 e3 00 00 00    	jne    1013e3 <irqHandle+0x147>
  101300:	83 ec 0c             	sub    $0xc,%esp
  101303:	57                   	push   %edi
  101304:	e8 9b fe ff ff       	call   1011a4 <syscallHandle>
  101309:	8b 47 30             	mov    0x30(%edi),%eax
  10130c:	83 c4 10             	add    $0x10,%esp
  10130f:	3d 80 00 00 00       	cmp    $0x80,%eax
  101314:	74 26                	je     10133c <irqHandle+0xa0>
  101316:	83 f8 20             	cmp    $0x20,%eax
  101319:	74 21                	je     10133c <irqHandle+0xa0>
  10131b:	fb                   	sti    
  10131c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10131f:	5b                   	pop    %ebx
  101320:	5e                   	pop    %esi
  101321:	5f                   	pop    %edi
  101322:	5d                   	pop    %ebp
  101323:	c3                   	ret    
  101324:	83 ec 0c             	sub    $0xc,%esp
  101327:	57                   	push   %edi
  101328:	e8 23 ff ff ff       	call   101250 <timeHandle>
  10132d:	8b 47 30             	mov    0x30(%edi),%eax
  101330:	83 c4 10             	add    $0x10,%esp
  101333:	3d 80 00 00 00       	cmp    $0x80,%eax
  101338:	75 dc                	jne    101316 <irqHandle+0x7a>
  10133a:	66 90                	xchg   %ax,%ax
  10133c:	8b 15 60 3c 10 00    	mov    0x103c60,%edx
  101342:	39 d3                	cmp    %edx,%ebx
  101344:	74 d5                	je     10131b <irqHandle+0x7f>
  101346:	89 d0                	mov    %edx,%eax
  101348:	c1 e0 07             	shl    $0x7,%eax
  10134b:	01 d0                	add    %edx,%eax
  10134d:	01 c0                	add    %eax,%eax
  10134f:	01 d0                	add    %edx,%eax
  101351:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101354:	8d 04 c5 30 5c 10 00 	lea    0x105c30(,%eax,8),%eax
  10135b:	89 46 08             	mov    %eax,0x8(%esi)
  10135e:	8b 15 60 3c 10 00    	mov    0x103c60,%edx
  101364:	89 d1                	mov    %edx,%ecx
  101366:	c1 e1 07             	shl    $0x7,%ecx
  101369:	01 d1                	add    %edx,%ecx
  10136b:	01 c9                	add    %ecx,%ecx
  10136d:	01 d1                	add    %edx,%ecx
  10136f:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  101372:	8d 34 cd 80 5c 10 00 	lea    0x105c80(,%ecx,8),%esi
  101379:	b9 13 00 00 00       	mov    $0x13,%ecx
  10137e:	89 c7                	mov    %eax,%edi
  101380:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101382:	85 d2                	test   %edx,%edx
  101384:	74 95                	je     10131b <irqHandle+0x7f>
  101386:	83 ec 0c             	sub    $0xc,%esp
  101389:	68 08 18 10 00       	push   $0x101808
  10138e:	e8 35 02 00 00       	call   1015c8 <printk>
  101393:	58                   	pop    %eax
  101394:	5a                   	pop    %edx
  101395:	ff 35 60 3c 10 00    	pushl  0x103c60
  10139b:	53                   	push   %ebx
  10139c:	68 74 1a 10 00       	push   $0x101a74
  1013a1:	6a 47                	push   $0x47
  1013a3:	68 ed 19 10 00       	push   $0x1019ed
  1013a8:	68 40 1a 10 00       	push   $0x101a40
  1013ad:	e8 16 02 00 00       	call   1015c8 <printk>
  1013b2:	83 c4 14             	add    $0x14,%esp
  1013b5:	68 37 18 10 00       	push   $0x101837
  1013ba:	e8 09 02 00 00       	call   1015c8 <printk>
  1013bf:	59                   	pop    %ecx
  1013c0:	5b                   	pop    %ebx
  1013c1:	a1 60 3c 10 00       	mov    0x103c60,%eax
  1013c6:	c1 e0 10             	shl    $0x10,%eax
  1013c9:	50                   	push   %eax
  1013ca:	6a 23                	push   $0x23
  1013cc:	e8 63 ec ff ff       	call   100034 <change_gdt>
  1013d1:	83 c4 10             	add    $0x10,%esp
  1013d4:	e9 42 ff ff ff       	jmp    10131b <irqHandle+0x7f>
  1013d9:	8d 76 00             	lea    0x0(%esi),%esi
  1013dc:	40                   	inc    %eax
  1013dd:	0f 84 38 ff ff ff    	je     10131b <irqHandle+0x7f>
  1013e3:	83 ec 0c             	sub    $0xc,%esp
  1013e6:	68 08 18 10 00       	push   $0x101808
  1013eb:	e8 d8 01 00 00       	call   1015c8 <printk>
  1013f0:	58                   	pop    %eax
  1013f1:	5a                   	pop    %edx
  1013f2:	ff 77 38             	pushl  0x38(%edi)
  1013f5:	ff 77 30             	pushl  0x30(%edi)
  1013f8:	68 74 1a 10 00       	push   $0x101a74
  1013fd:	6a 37                	push   $0x37
  1013ff:	68 ed 19 10 00       	push   $0x1019ed
  101404:	68 18 1a 10 00       	push   $0x101a18
  101409:	e8 ba 01 00 00       	call   1015c8 <printk>
  10140e:	83 c4 14             	add    $0x14,%esp
  101411:	68 37 18 10 00       	push   $0x101837
  101416:	e8 ad 01 00 00       	call   1015c8 <printk>
  10141b:	59                   	pop    %ecx
  10141c:	58                   	pop    %eax
  10141d:	6a 38                	push   $0x38
  10141f:	68 ed 19 10 00       	push   $0x1019ed
  101424:	e8 13 03 00 00       	call   10173c <abort>
  101429:	8b 47 30             	mov    0x30(%edi),%eax
  10142c:	83 c4 10             	add    $0x10,%esp
  10142f:	e9 db fe ff ff       	jmp    10130f <irqHandle+0x73>
  101434:	83 ec 0c             	sub    $0xc,%esp
  101437:	57                   	push   %edi
  101438:	e8 c3 fd ff ff       	call   101200 <GProtectFaultHandle>
  10143d:	8b 47 30             	mov    0x30(%edi),%eax
  101440:	83 c4 10             	add    $0x10,%esp
  101443:	e9 c7 fe ff ff       	jmp    10130f <irqHandle+0x73>

00101448 <initIntr>:
  101448:	55                   	push   %ebp
  101449:	89 e5                	mov    %esp,%ebp
  10144b:	ba 21 00 00 00       	mov    $0x21,%edx
  101450:	b0 ff                	mov    $0xff,%al
  101452:	ee                   	out    %al,(%dx)
  101453:	ba a1 00 00 00       	mov    $0xa1,%edx
  101458:	ee                   	out    %al,(%dx)
  101459:	ba 20 00 00 00       	mov    $0x20,%edx
  10145e:	b0 11                	mov    $0x11,%al
  101460:	ee                   	out    %al,(%dx)
  101461:	ba 21 00 00 00       	mov    $0x21,%edx
  101466:	b0 20                	mov    $0x20,%al
  101468:	ee                   	out    %al,(%dx)
  101469:	b0 04                	mov    $0x4,%al
  10146b:	ee                   	out    %al,(%dx)
  10146c:	b0 03                	mov    $0x3,%al
  10146e:	ee                   	out    %al,(%dx)
  10146f:	ba a0 00 00 00       	mov    $0xa0,%edx
  101474:	b0 11                	mov    $0x11,%al
  101476:	ee                   	out    %al,(%dx)
  101477:	ba a1 00 00 00       	mov    $0xa1,%edx
  10147c:	b0 28                	mov    $0x28,%al
  10147e:	ee                   	out    %al,(%dx)
  10147f:	b0 02                	mov    $0x2,%al
  101481:	ee                   	out    %al,(%dx)
  101482:	b0 03                	mov    $0x3,%al
  101484:	ee                   	out    %al,(%dx)
  101485:	ba 20 00 00 00       	mov    $0x20,%edx
  10148a:	b0 68                	mov    $0x68,%al
  10148c:	ee                   	out    %al,(%dx)
  10148d:	b0 0a                	mov    $0xa,%al
  10148f:	ee                   	out    %al,(%dx)
  101490:	ba a0 00 00 00       	mov    $0xa0,%edx
  101495:	b0 68                	mov    $0x68,%al
  101497:	ee                   	out    %al,(%dx)
  101498:	b0 0a                	mov    $0xa,%al
  10149a:	ee                   	out    %al,(%dx)
  10149b:	5d                   	pop    %ebp
  10149c:	c3                   	ret    
  10149d:	8d 76 00             	lea    0x0(%esi),%esi

001014a0 <initTimer>:
  1014a0:	55                   	push   %ebp
  1014a1:	89 e5                	mov    %esp,%ebp
  1014a3:	ba 43 00 00 00       	mov    $0x43,%edx
  1014a8:	b0 34                	mov    $0x34,%al
  1014aa:	ee                   	out    %al,(%dx)
  1014ab:	ba 40 00 00 00       	mov    $0x40,%edx
  1014b0:	b0 9b                	mov    $0x9b,%al
  1014b2:	ee                   	out    %al,(%dx)
  1014b3:	b0 2e                	mov    $0x2e,%al
  1014b5:	ee                   	out    %al,(%dx)
  1014b6:	5d                   	pop    %ebp
  1014b7:	c3                   	ret    

001014b8 <i2A>:
  1014b8:	55                   	push   %ebp
  1014b9:	89 e5                	mov    %esp,%ebp
  1014bb:	57                   	push   %edi
  1014bc:	56                   	push   %esi
  1014bd:	53                   	push   %ebx
  1014be:	51                   	push   %ecx
  1014bf:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1014c2:	85 c9                	test   %ecx,%ecx
  1014c4:	78 6e                	js     101534 <i2A+0x7c>
  1014c6:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  1014ca:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  1014ce:	bb 3e 34 10 00       	mov    $0x10343e,%ebx
  1014d3:	31 ff                	xor    %edi,%edi
  1014d5:	eb 03                	jmp    1014da <i2A+0x22>
  1014d7:	90                   	nop
  1014d8:	89 f7                	mov    %esi,%edi
  1014da:	4b                   	dec    %ebx
  1014db:	89 c8                	mov    %ecx,%eax
  1014dd:	be 0a 00 00 00       	mov    $0xa,%esi
  1014e2:	99                   	cltd   
  1014e3:	f7 fe                	idiv   %esi
  1014e5:	83 c2 30             	add    $0x30,%edx
  1014e8:	88 13                	mov    %dl,(%ebx)
  1014ea:	8d 77 01             	lea    0x1(%edi),%esi
  1014ed:	b8 67 66 66 66       	mov    $0x66666667,%eax
  1014f2:	f7 e9                	imul   %ecx
  1014f4:	89 d0                	mov    %edx,%eax
  1014f6:	c1 f8 02             	sar    $0x2,%eax
  1014f9:	c1 f9 1f             	sar    $0x1f,%ecx
  1014fc:	29 c8                	sub    %ecx,%eax
  1014fe:	89 c1                	mov    %eax,%ecx
  101500:	75 d6                	jne    1014d8 <i2A+0x20>
  101502:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  101506:	74 20                	je     101528 <i2A+0x70>
  101508:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  10150c:	75 06                	jne    101514 <i2A+0x5c>
  10150e:	fe 05 3d 34 10 00    	incb   0x10343d
  101514:	c6 05 3e 34 10 00 00 	movb   $0x0,0x10343e
  10151b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10151e:	89 18                	mov    %ebx,(%eax)
  101520:	89 f0                	mov    %esi,%eax
  101522:	5a                   	pop    %edx
  101523:	5b                   	pop    %ebx
  101524:	5e                   	pop    %esi
  101525:	5f                   	pop    %edi
  101526:	5d                   	pop    %ebp
  101527:	c3                   	ret    
  101528:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  10152c:	8d 77 02             	lea    0x2(%edi),%esi
  10152f:	4b                   	dec    %ebx
  101530:	eb d6                	jmp    101508 <i2A+0x50>
  101532:	66 90                	xchg   %ax,%ax
  101534:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  10153a:	74 0c                	je     101548 <i2A+0x90>
  10153c:	f7 d9                	neg    %ecx
  10153e:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  101542:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  101546:	eb 86                	jmp    1014ce <i2A+0x16>
  101548:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  10154d:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101551:	eb ef                	jmp    101542 <i2A+0x8a>
  101553:	90                   	nop

00101554 <i2X>:
  101554:	55                   	push   %ebp
  101555:	89 e5                	mov    %esp,%ebp
  101557:	57                   	push   %edi
  101558:	56                   	push   %esi
  101559:	53                   	push   %ebx
  10155a:	8b 55 08             	mov    0x8(%ebp),%edx
  10155d:	b9 1d 34 10 00       	mov    $0x10341d,%ecx
  101562:	31 c0                	xor    %eax,%eax
  101564:	40                   	inc    %eax
  101565:	89 d6                	mov    %edx,%esi
  101567:	83 e6 0f             	and    $0xf,%esi
  10156a:	8d 5e f6             	lea    -0xa(%esi),%ebx
  10156d:	89 cf                	mov    %ecx,%edi
  10156f:	83 fb 05             	cmp    $0x5,%ebx
  101572:	77 4c                	ja     1015c0 <i2X+0x6c>
  101574:	ff 24 9d 80 1a 10 00 	jmp    *0x101a80(,%ebx,4)
  10157b:	90                   	nop
  10157c:	c6 01 65             	movb   $0x65,(%ecx)
  10157f:	90                   	nop
  101580:	49                   	dec    %ecx
  101581:	c1 ea 04             	shr    $0x4,%edx
  101584:	75 de                	jne    101564 <i2X+0x10>
  101586:	c6 05 1e 34 10 00 00 	movb   $0x0,0x10341e
  10158d:	8b 55 0c             	mov    0xc(%ebp),%edx
  101590:	89 3a                	mov    %edi,(%edx)
  101592:	5b                   	pop    %ebx
  101593:	5e                   	pop    %esi
  101594:	5f                   	pop    %edi
  101595:	5d                   	pop    %ebp
  101596:	c3                   	ret    
  101597:	90                   	nop
  101598:	c6 01 64             	movb   $0x64,(%ecx)
  10159b:	eb e3                	jmp    101580 <i2X+0x2c>
  10159d:	8d 76 00             	lea    0x0(%esi),%esi
  1015a0:	c6 01 63             	movb   $0x63,(%ecx)
  1015a3:	eb db                	jmp    101580 <i2X+0x2c>
  1015a5:	8d 76 00             	lea    0x0(%esi),%esi
  1015a8:	c6 01 62             	movb   $0x62,(%ecx)
  1015ab:	eb d3                	jmp    101580 <i2X+0x2c>
  1015ad:	8d 76 00             	lea    0x0(%esi),%esi
  1015b0:	c6 01 61             	movb   $0x61,(%ecx)
  1015b3:	eb cb                	jmp    101580 <i2X+0x2c>
  1015b5:	8d 76 00             	lea    0x0(%esi),%esi
  1015b8:	c6 01 66             	movb   $0x66,(%ecx)
  1015bb:	eb c3                	jmp    101580 <i2X+0x2c>
  1015bd:	8d 76 00             	lea    0x0(%esi),%esi
  1015c0:	8d 5e 30             	lea    0x30(%esi),%ebx
  1015c3:	88 19                	mov    %bl,(%ecx)
  1015c5:	eb b9                	jmp    101580 <i2X+0x2c>
  1015c7:	90                   	nop

001015c8 <printk>:
  1015c8:	55                   	push   %ebp
  1015c9:	89 e5                	mov    %esp,%ebp
  1015cb:	57                   	push   %edi
  1015cc:	56                   	push   %esi
  1015cd:	53                   	push   %ebx
  1015ce:	83 ec 2c             	sub    $0x2c,%esp
  1015d1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1015d4:	8a 11                	mov    (%ecx),%dl
  1015d6:	84 d2                	test   %dl,%dl
  1015d8:	0f 84 54 01 00 00    	je     101732 <printk+0x16a>
  1015de:	8d 45 0c             	lea    0xc(%ebp),%eax
  1015e1:	31 ff                	xor    %edi,%edi
  1015e3:	eb 18                	jmp    1015fd <printk+0x35>
  1015e5:	8d 76 00             	lea    0x0(%esi),%esi
  1015e8:	8a 11                	mov    (%ecx),%dl
  1015ea:	89 cb                	mov    %ecx,%ebx
  1015ec:	88 97 40 34 10 00    	mov    %dl,0x103440(%edi)
  1015f2:	47                   	inc    %edi
  1015f3:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1015f6:	8a 53 01             	mov    0x1(%ebx),%dl
  1015f9:	84 d2                	test   %dl,%dl
  1015fb:	74 72                	je     10166f <printk+0xa7>
  1015fd:	80 fa 25             	cmp    $0x25,%dl
  101600:	75 e6                	jne    1015e8 <printk+0x20>
  101602:	8d 59 01             	lea    0x1(%ecx),%ebx
  101605:	8a 51 01             	mov    0x1(%ecx),%dl
  101608:	80 fa 64             	cmp    $0x64,%dl
  10160b:	0f 84 bf 00 00 00    	je     1016d0 <printk+0x108>
  101611:	0f 8e 01 01 00 00    	jle    101718 <printk+0x150>
  101617:	80 fa 73             	cmp    $0x73,%dl
  10161a:	0f 84 84 00 00 00    	je     1016a4 <printk+0xdc>
  101620:	80 fa 78             	cmp    $0x78,%dl
  101623:	75 c7                	jne    1015ec <printk+0x24>
  101625:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10162c:	8d 70 04             	lea    0x4(%eax),%esi
  10162f:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101632:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101635:	56                   	push   %esi
  101636:	ff 30                	pushl  (%eax)
  101638:	e8 17 ff ff ff       	call   101554 <i2X>
  10163d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  101640:	8d b7 40 34 10 00    	lea    0x103440(%edi),%esi
  101646:	8a 11                	mov    (%ecx),%dl
  101648:	83 c4 08             	add    $0x8,%esp
  10164b:	31 c0                	xor    %eax,%eax
  10164d:	84 d2                	test   %dl,%dl
  10164f:	74 0f                	je     101660 <printk+0x98>
  101651:	8d 76 00             	lea    0x0(%esi),%esi
  101654:	40                   	inc    %eax
  101655:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101659:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  10165c:	84 d2                	test   %dl,%dl
  10165e:	75 f4                	jne    101654 <printk+0x8c>
  101660:	01 c7                	add    %eax,%edi
  101662:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101665:	8d 4b 01             	lea    0x1(%ebx),%ecx
  101668:	8a 53 01             	mov    0x1(%ebx),%dl
  10166b:	84 d2                	test   %dl,%dl
  10166d:	75 8e                	jne    1015fd <printk+0x35>
  10166f:	c6 87 40 34 10 00 00 	movb   $0x0,0x103440(%edi)
  101676:	0f be 05 40 34 10 00 	movsbl 0x103440,%eax
  10167d:	bb 40 34 10 00       	mov    $0x103440,%ebx
  101682:	84 c0                	test   %al,%al
  101684:	74 16                	je     10169c <printk+0xd4>
  101686:	66 90                	xchg   %ax,%ax
  101688:	83 ec 0c             	sub    $0xc,%esp
  10168b:	50                   	push   %eax
  10168c:	e8 a3 f1 ff ff       	call   100834 <putChar>
  101691:	43                   	inc    %ebx
  101692:	0f be 03             	movsbl (%ebx),%eax
  101695:	83 c4 10             	add    $0x10,%esp
  101698:	84 c0                	test   %al,%al
  10169a:	75 ec                	jne    101688 <printk+0xc0>
  10169c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10169f:	5b                   	pop    %ebx
  1016a0:	5e                   	pop    %esi
  1016a1:	5f                   	pop    %edi
  1016a2:	5d                   	pop    %ebp
  1016a3:	c3                   	ret    
  1016a4:	8d 70 04             	lea    0x4(%eax),%esi
  1016a7:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1016aa:	8b 08                	mov    (%eax),%ecx
  1016ac:	8d b7 40 34 10 00    	lea    0x103440(%edi),%esi
  1016b2:	8a 11                	mov    (%ecx),%dl
  1016b4:	31 c0                	xor    %eax,%eax
  1016b6:	84 d2                	test   %dl,%dl
  1016b8:	74 a6                	je     101660 <printk+0x98>
  1016ba:	66 90                	xchg   %ax,%ax
  1016bc:	40                   	inc    %eax
  1016bd:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1016c1:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  1016c4:	84 d2                	test   %dl,%dl
  1016c6:	75 f4                	jne    1016bc <printk+0xf4>
  1016c8:	01 c7                	add    %eax,%edi
  1016ca:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1016cd:	eb 96                	jmp    101665 <printk+0x9d>
  1016cf:	90                   	nop
  1016d0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1016d7:	8d 70 04             	lea    0x4(%eax),%esi
  1016da:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1016dd:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  1016e0:	56                   	push   %esi
  1016e1:	ff 30                	pushl  (%eax)
  1016e3:	e8 d0 fd ff ff       	call   1014b8 <i2A>
  1016e8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1016eb:	8d b7 40 34 10 00    	lea    0x103440(%edi),%esi
  1016f1:	8a 11                	mov    (%ecx),%dl
  1016f3:	83 c4 08             	add    $0x8,%esp
  1016f6:	31 c0                	xor    %eax,%eax
  1016f8:	84 d2                	test   %dl,%dl
  1016fa:	0f 84 60 ff ff ff    	je     101660 <printk+0x98>
  101700:	40                   	inc    %eax
  101701:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101705:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  101708:	84 d2                	test   %dl,%dl
  10170a:	75 f4                	jne    101700 <printk+0x138>
  10170c:	01 c7                	add    %eax,%edi
  10170e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101711:	e9 4f ff ff ff       	jmp    101665 <printk+0x9d>
  101716:	66 90                	xchg   %ax,%ax
  101718:	80 fa 63             	cmp    $0x63,%dl
  10171b:	0f 85 cb fe ff ff    	jne    1015ec <printk+0x24>
  101721:	8b 10                	mov    (%eax),%edx
  101723:	88 97 40 34 10 00    	mov    %dl,0x103440(%edi)
  101729:	83 c0 04             	add    $0x4,%eax
  10172c:	47                   	inc    %edi
  10172d:	e9 c1 fe ff ff       	jmp    1015f3 <printk+0x2b>
  101732:	31 ff                	xor    %edi,%edi
  101734:	e9 36 ff ff ff       	jmp    10166f <printk+0xa7>
  101739:	66 90                	xchg   %ax,%ax
  10173b:	90                   	nop

0010173c <abort>:
  10173c:	55                   	push   %ebp
  10173d:	89 e5                	mov    %esp,%ebp
  10173f:	57                   	push   %edi
  101740:	56                   	push   %esi
  101741:	53                   	push   %ebx
  101742:	83 ec 1c             	sub    $0x1c,%esp
  101745:	8b 55 08             	mov    0x8(%ebp),%edx
  101748:	fa                   	cli    
  101749:	8a 02                	mov    (%edx),%al
  10174b:	b9 f2 32 10 00       	mov    $0x1032f2,%ecx
  101750:	84 c0                	test   %al,%al
  101752:	74 0b                	je     10175f <abort+0x23>
  101754:	41                   	inc    %ecx
  101755:	42                   	inc    %edx
  101756:	88 41 ff             	mov    %al,-0x1(%ecx)
  101759:	8a 02                	mov    (%edx),%al
  10175b:	84 c0                	test   %al,%al
  10175d:	75 f5                	jne    101754 <abort+0x18>
  10175f:	c6 01 3a             	movb   $0x3a,(%ecx)
  101762:	bb 5d 3c 10 00       	mov    $0x103c5d,%ebx
  101767:	be 0a 00 00 00       	mov    $0xa,%esi
  10176c:	bf 67 66 66 66       	mov    $0x66666667,%edi
  101771:	4b                   	dec    %ebx
  101772:	8b 45 0c             	mov    0xc(%ebp),%eax
  101775:	99                   	cltd   
  101776:	f7 fe                	idiv   %esi
  101778:	8d 42 30             	lea    0x30(%edx),%eax
  10177b:	88 45 e7             	mov    %al,-0x19(%ebp)
  10177e:	88 03                	mov    %al,(%ebx)
  101780:	89 f8                	mov    %edi,%eax
  101782:	f7 6d 0c             	imull  0xc(%ebp)
  101785:	c1 fa 02             	sar    $0x2,%edx
  101788:	8b 45 0c             	mov    0xc(%ebp),%eax
  10178b:	c1 f8 1f             	sar    $0x1f,%eax
  10178e:	29 c2                	sub    %eax,%edx
  101790:	89 55 0c             	mov    %edx,0xc(%ebp)
  101793:	75 dc                	jne    101771 <abort+0x35>
  101795:	41                   	inc    %ecx
  101796:	41                   	inc    %ecx
  101797:	43                   	inc    %ebx
  101798:	8a 45 e7             	mov    -0x19(%ebp),%al
  10179b:	88 41 ff             	mov    %al,-0x1(%ecx)
  10179e:	8a 03                	mov    (%ebx),%al
  1017a0:	88 45 e7             	mov    %al,-0x19(%ebp)
  1017a3:	84 c0                	test   %al,%al
  1017a5:	75 ef                	jne    101796 <abort+0x5a>
  1017a7:	c6 01 0a             	movb   $0xa,(%ecx)
  1017aa:	0f be 05 e0 32 10 00 	movsbl 0x1032e0,%eax
  1017b1:	84 c0                	test   %al,%al
  1017b3:	74 1b                	je     1017d0 <abort+0x94>
  1017b5:	bb e0 32 10 00       	mov    $0x1032e0,%ebx
  1017ba:	83 ec 0c             	sub    $0xc,%esp
  1017bd:	50                   	push   %eax
  1017be:	e8 71 f0 ff ff       	call   100834 <putChar>
  1017c3:	43                   	inc    %ebx
  1017c4:	0f be 03             	movsbl (%ebx),%eax
  1017c7:	83 c4 10             	add    $0x10,%esp
  1017ca:	84 c0                	test   %al,%al
  1017cc:	75 ec                	jne    1017ba <abort+0x7e>
  1017ce:	66 90                	xchg   %ax,%ax
  1017d0:	f4                   	hlt    
  1017d1:	eb fd                	jmp    1017d0 <abort+0x94>

001017d3 <irqEmpty>:
  1017d3:	6a 00                	push   $0x0
  1017d5:	6a ff                	push   $0xffffffff
  1017d7:	eb 13                	jmp    1017ec <asmDoIrq>

001017d9 <irqGProtectFault>:
  1017d9:	6a 0d                	push   $0xd
  1017db:	eb 0f                	jmp    1017ec <asmDoIrq>

001017dd <irqSyscall>:
  1017dd:	6a 00                	push   $0x0
  1017df:	68 80 00 00 00       	push   $0x80
  1017e4:	eb 06                	jmp    1017ec <asmDoIrq>

001017e6 <irqTime>:
  1017e6:	6a 00                	push   $0x0
  1017e8:	6a 20                	push   $0x20
  1017ea:	eb 00                	jmp    1017ec <asmDoIrq>

001017ec <asmDoIrq>:
  1017ec:	60                   	pusha  
  1017ed:	1e                   	push   %ds
  1017ee:	06                   	push   %es
  1017ef:	0f a0                	push   %fs
  1017f1:	0f a8                	push   %gs
  1017f3:	54                   	push   %esp
  1017f4:	e8 a3 fa ff ff       	call   10129c <irqHandle>
  1017f9:	5c                   	pop    %esp
  1017fa:	0f a9                	pop    %gs
  1017fc:	0f a1                	pop    %fs
  1017fe:	07                   	pop    %es
  1017ff:	1f                   	pop    %ds
  101800:	61                   	popa   
  101801:	83 c4 04             	add    $0x4,%esp
  101804:	83 c4 04             	add    $0x4,%esp
  101807:	cf                   	iret   
