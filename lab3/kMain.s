
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 c9 14 00 00       	call   1014d4 <initTimer>
  10000b:	e8 e4 0f 00 00       	call   100ff4 <init_pcb>
  100010:	e8 23 10 00 00       	call   101038 <init_kernel_pcb>
  100015:	e8 0e 08 00 00       	call   100828 <initSerial>
  10001a:	e8 d9 10 00 00       	call   1010f8 <initIdt>
  10001f:	e8 58 14 00 00       	call   10147c <initIntr>
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
  10005f:	66 c7 05 c0 7c 13 01 	movw   $0xffff,0x1137cc0
  100066:	ff ff 
  100068:	66 a3 c2 7c 13 01    	mov    %ax,0x1137cc2
  10006e:	89 c2                	mov    %eax,%edx
  100070:	c1 ea 10             	shr    $0x10,%edx
  100073:	88 15 c4 7c 13 01    	mov    %dl,0x1137cc4
  100079:	c6 05 c5 7c 13 01 f2 	movb   $0xf2,0x1137cc5
  100080:	c6 05 c6 7c 13 01 cf 	movb   $0xcf,0x1137cc6
  100087:	c1 e8 18             	shr    $0x18,%eax
  10008a:	a2 c7 7c 13 01       	mov    %al,0x1137cc7
  10008f:	66 c7 05 00 34 10 00 	movw   $0x4f,0x103400
  100096:	4f 00 
  100098:	b8 a0 7c 13 01       	mov    $0x1137ca0,%eax
  10009d:	66 a3 02 34 10 00    	mov    %ax,0x103402
  1000a3:	c1 e8 10             	shr    $0x10,%eax
  1000a6:	66 a3 04 34 10 00    	mov    %ax,0x103404
  1000ac:	b8 00 34 10 00       	mov    $0x103400,%eax
  1000b1:	0f 01 10             	lgdtl  (%eax)
  1000b4:	b8 01 00 00 00       	mov    $0x1,%eax
  1000b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000bc:	c9                   	leave  
  1000bd:	c3                   	ret    
  1000be:	66 90                	xchg   %ax,%ax
  1000c0:	66 c7 05 b8 7c 13 01 	movw   $0xffff,0x1137cb8
  1000c7:	ff ff 
  1000c9:	66 a3 ba 7c 13 01    	mov    %ax,0x1137cba
  1000cf:	89 c2                	mov    %eax,%edx
  1000d1:	c1 ea 10             	shr    $0x10,%edx
  1000d4:	88 15 bc 7c 13 01    	mov    %dl,0x1137cbc
  1000da:	c6 05 bd 7c 13 01 fa 	movb   $0xfa,0x1137cbd
  1000e1:	c6 05 be 7c 13 01 cf 	movb   $0xcf,0x1137cbe
  1000e8:	c1 e8 18             	shr    $0x18,%eax
  1000eb:	a2 bf 7c 13 01       	mov    %al,0x1137cbf
  1000f0:	eb 9d                	jmp    10008f <change_gdt+0x5b>
  1000f2:	66 90                	xchg   %ax,%ax
  1000f4:	83 fb 01             	cmp    $0x1,%ebx
  1000f7:	75 37                	jne    100130 <change_gdt+0xfc>
  1000f9:	66 c7 05 a8 7c 13 01 	movw   $0xffff,0x1137ca8
  100100:	ff ff 
  100102:	66 a3 aa 7c 13 01    	mov    %ax,0x1137caa
  100108:	89 c2                	mov    %eax,%edx
  10010a:	c1 ea 10             	shr    $0x10,%edx
  10010d:	88 15 ac 7c 13 01    	mov    %dl,0x1137cac
  100113:	c6 05 ad 7c 13 01 9a 	movb   $0x9a,0x1137cad
  10011a:	c6 05 ae 7c 13 01 cf 	movb   $0xcf,0x1137cae
  100121:	c1 e8 18             	shr    $0x18,%eax
  100124:	a2 af 7c 13 01       	mov    %al,0x1137caf
  100129:	e9 61 ff ff ff       	jmp    10008f <change_gdt+0x5b>
  10012e:	66 90                	xchg   %ax,%ax
  100130:	83 ec 0c             	sub    $0xc,%esp
  100133:	68 3c 18 10 00       	push   $0x10183c
  100138:	e8 bf 14 00 00       	call   1015fc <printk>
  10013d:	89 1c 24             	mov    %ebx,(%esp)
  100140:	68 7c 18 10 00       	push   $0x10187c
  100145:	6a 18                	push   $0x18
  100147:	68 42 18 10 00       	push   $0x101842
  10014c:	68 4f 18 10 00       	push   $0x10184f
  100151:	e8 a6 14 00 00       	call   1015fc <printk>
  100156:	83 c4 14             	add    $0x14,%esp
  100159:	68 6b 18 10 00       	push   $0x10186b
  10015e:	e8 99 14 00 00       	call   1015fc <printk>
  100163:	58                   	pop    %eax
  100164:	5a                   	pop    %edx
  100165:	6a 19                	push   $0x19
  100167:	68 42 18 10 00       	push   $0x101842
  10016c:	e8 ff 15 00 00       	call   101770 <abort>
  100171:	83 c4 10             	add    $0x10,%esp
  100174:	e9 16 ff ff ff       	jmp    10008f <change_gdt+0x5b>
  100179:	8d 76 00             	lea    0x0(%esi),%esi
  10017c:	66 c7 05 b0 7c 13 01 	movw   $0xffff,0x1137cb0
  100183:	ff ff 
  100185:	66 a3 b2 7c 13 01    	mov    %ax,0x1137cb2
  10018b:	89 c2                	mov    %eax,%edx
  10018d:	c1 ea 10             	shr    $0x10,%edx
  100190:	88 15 b4 7c 13 01    	mov    %dl,0x1137cb4
  100196:	c6 05 b5 7c 13 01 92 	movb   $0x92,0x1137cb5
  10019d:	c6 05 b6 7c 13 01 cf 	movb   $0xcf,0x1137cb6
  1001a4:	c1 e8 18             	shr    $0x18,%eax
  1001a7:	a2 b7 7c 13 01       	mov    %al,0x1137cb7
  1001ac:	e9 de fe ff ff       	jmp    10008f <change_gdt+0x5b>
  1001b1:	8d 76 00             	lea    0x0(%esi),%esi

001001b4 <change_tss>:
  1001b4:	55                   	push   %ebp
  1001b5:	89 e5                	mov    %esp,%ebp
  1001b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1001ba:	a3 08 7d 13 01       	mov    %eax,0x1137d08
  1001bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1001c2:	a3 04 7d 13 01       	mov    %eax,0x1137d04
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
  1001d8:	be 00 7d 13 01       	mov    $0x1137d00,%esi
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
  10027b:	b9 a0 7c 13 01       	mov    $0x1137ca0,%ecx
  100280:	66 c7 05 a8 7c 13 01 	movw   $0xffff,0x1137ca8
  100287:	ff ff 
  100289:	66 c7 05 aa 7c 13 01 	movw   $0x0,0x1137caa
  100290:	00 00 
  100292:	c6 05 ac 7c 13 01 00 	movb   $0x0,0x1137cac
  100299:	c6 05 ad 7c 13 01 9a 	movb   $0x9a,0x1137cad
  1002a0:	c6 05 ae 7c 13 01 cf 	movb   $0xcf,0x1137cae
  1002a7:	c6 05 af 7c 13 01 00 	movb   $0x0,0x1137caf
  1002ae:	66 c7 05 b0 7c 13 01 	movw   $0xffff,0x1137cb0
  1002b5:	ff ff 
  1002b7:	66 c7 05 b2 7c 13 01 	movw   $0x0,0x1137cb2
  1002be:	00 00 
  1002c0:	c6 05 b4 7c 13 01 00 	movb   $0x0,0x1137cb4
  1002c7:	c6 05 b5 7c 13 01 92 	movb   $0x92,0x1137cb5
  1002ce:	c6 05 b6 7c 13 01 cf 	movb   $0xcf,0x1137cb6
  1002d5:	c6 05 b7 7c 13 01 00 	movb   $0x0,0x1137cb7
  1002dc:	66 c7 05 b8 7c 13 01 	movw   $0xffff,0x1137cb8
  1002e3:	ff ff 
  1002e5:	66 c7 05 ba 7c 13 01 	movw   $0x0,0x1137cba
  1002ec:	00 00 
  1002ee:	c6 05 bc 7c 13 01 00 	movb   $0x0,0x1137cbc
  1002f5:	c6 05 bd 7c 13 01 fa 	movb   $0xfa,0x1137cbd
  1002fc:	c6 05 be 7c 13 01 cf 	movb   $0xcf,0x1137cbe
  100303:	c6 05 bf 7c 13 01 00 	movb   $0x0,0x1137cbf
  10030a:	66 c7 05 c0 7c 13 01 	movw   $0xffff,0x1137cc0
  100311:	ff ff 
  100313:	66 c7 05 c2 7c 13 01 	movw   $0x0,0x1137cc2
  10031a:	00 00 
  10031c:	c6 05 c4 7c 13 01 00 	movb   $0x0,0x1137cc4
  100323:	c6 05 c5 7c 13 01 f2 	movb   $0xf2,0x1137cc5
  10032a:	c6 05 c6 7c 13 01 cf 	movb   $0xcf,0x1137cc6
  100331:	c6 05 c7 7c 13 01 00 	movb   $0x0,0x1137cc7
  100338:	66 c7 05 c8 7c 13 01 	movw   $0x63,0x1137cc8
  10033f:	63 00 
  100341:	b8 00 7d 13 01       	mov    $0x1137d00,%eax
  100346:	66 a3 ca 7c 13 01    	mov    %ax,0x1137cca
  10034c:	89 c2                	mov    %eax,%edx
  10034e:	c1 ea 10             	shr    $0x10,%edx
  100351:	88 15 cc 7c 13 01    	mov    %dl,0x1137ccc
  100357:	c6 05 cd 7c 13 01 89 	movb   $0x89,0x1137ccd
  10035e:	c6 05 ce 7c 13 01 40 	movb   $0x40,0x1137cce
  100365:	c1 e8 18             	shr    $0x18,%eax
  100368:	a2 cf 7c 13 01       	mov    %al,0x1137ccf
  10036d:	a1 74 18 10 00       	mov    0x101874,%eax
  100372:	8b 15 78 18 10 00    	mov    0x101878,%edx
  100378:	a3 d0 7c 13 01       	mov    %eax,0x1137cd0
  10037d:	89 15 d4 7c 13 01    	mov    %edx,0x1137cd4
  100383:	66 c7 05 e0 7c 13 01 	movw   $0xffff,0x1137ce0
  10038a:	ff ff 
  10038c:	66 c7 05 e2 7c 13 01 	movw   $0x0,0x1137ce2
  100393:	00 00 
  100395:	c6 05 e4 7c 13 01 00 	movb   $0x0,0x1137ce4
  10039c:	c6 05 e5 7c 13 01 f2 	movb   $0xf2,0x1137ce5
  1003a3:	c6 05 e6 7c 13 01 cf 	movb   $0xcf,0x1137ce6
  1003aa:	c6 05 e7 7c 13 01 00 	movb   $0x0,0x1137ce7
  1003b1:	66 c7 05 00 34 10 00 	movw   $0x4f,0x103400
  1003b8:	4f 00 
  1003ba:	66 89 0d 02 34 10 00 	mov    %cx,0x103402
  1003c1:	c1 e9 10             	shr    $0x10,%ecx
  1003c4:	66 89 0d 04 34 10 00 	mov    %cx,0x103404
  1003cb:	b8 00 34 10 00       	mov    $0x103400,%eax
  1003d0:	0f 01 10             	lgdtl  (%eax)
  1003d3:	a1 e8 5c 10 00       	mov    0x105ce8,%eax
  1003d8:	a3 08 7d 13 01       	mov    %eax,0x1137d08
  1003dd:	c7 05 04 7d 13 01 9c 	movl   $0x105c9c,0x1137d04
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
  100431:	8d 04 c5 a0 3c 10 00 	lea    0x103ca0(,%eax,8),%eax
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
  10045e:	c7 05 84 3c 10 00 01 	movl   $0x1,0x103c84
  100465:	00 00 00 
  100468:	c7 05 50 7d 10 00 23 	movl   $0x23,0x107d50
  10046f:	00 00 00 
  100472:	c7 05 44 7d 10 00 1b 	movl   $0x1b,0x107d44
  100479:	00 00 00 
  10047c:	c7 05 14 7d 10 00 43 	movl   $0x43,0x107d14
  100483:	00 00 00 
  100486:	c7 05 10 7d 10 00 23 	movl   $0x23,0x107d10
  10048d:	00 00 00 
  100490:	c7 05 0c 7d 10 00 23 	movl   $0x23,0x107d0c
  100497:	00 00 00 
  10049a:	c7 05 4c 7d 10 00 00 	movl   $0x400000,0x107d4c
  1004a1:	00 40 00 
  1004a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1004a7:	a3 40 7d 10 00       	mov    %eax,0x107d40
  1004ac:	c7 05 58 7d 10 00 0a 	movl   $0xa,0x107d58
  1004b3:	00 00 00 
  1004b6:	6a 00                	push   $0x0
  1004b8:	6a 01                	push   $0x1
  1004ba:	e8 99 05 00 00       	call   100a58 <put_into_runnable>
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
  10058a:	68 87 18 10 00       	push   $0x101887
  10058f:	e8 68 10 00 00       	call   1015fc <printk>
  100594:	e8 ff 03 00 00       	call   100998 <get_from_runnable>
  100599:	5a                   	pop    %edx
  10059a:	59                   	pop    %ecx
  10059b:	ff 75 08             	pushl  0x8(%ebp)
  10059e:	50                   	push   %eax
  10059f:	e8 8c 03 00 00       	call   100930 <put_into_running>
  1005a4:	b8 01 00 00 00       	mov    $0x1,%eax
  1005a9:	c9                   	leave  
  1005aa:	c3                   	ret    
  1005ab:	90                   	nop

001005ac <sys_sleep>:
  1005ac:	55                   	push   %ebp
  1005ad:	89 e5                	mov    %esp,%ebp
  1005af:	56                   	push   %esi
  1005b0:	53                   	push   %ebx
  1005b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1005b4:	e8 af 03 00 00       	call   100968 <getpid>
  1005b9:	83 ec 08             	sub    $0x8,%esp
  1005bc:	53                   	push   %ebx
  1005bd:	50                   	push   %eax
  1005be:	e8 c5 05 00 00       	call   100b88 <put_into_block>
  1005c3:	c7 04 24 3c 18 10 00 	movl   $0x10183c,(%esp)
  1005ca:	e8 2d 10 00 00       	call   1015fc <printk>
  1005cf:	e8 94 03 00 00       	call   100968 <getpid>
  1005d4:	89 c2                	mov    %eax,%edx
  1005d6:	c1 e2 07             	shl    $0x7,%edx
  1005d9:	01 c2                	add    %eax,%edx
  1005db:	01 d2                	add    %edx,%edx
  1005dd:	01 c2                	add    %eax,%edx
  1005df:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1005e2:	8b 34 c5 f4 5c 10 00 	mov    0x105cf4(,%eax,8),%esi
  1005e9:	e8 7a 03 00 00       	call   100968 <getpid>
  1005ee:	5a                   	pop    %edx
  1005ef:	59                   	pop    %ecx
  1005f0:	56                   	push   %esi
  1005f1:	50                   	push   %eax
  1005f2:	68 d8 18 10 00       	push   $0x1018d8
  1005f7:	6a 09                	push   $0x9
  1005f9:	68 95 18 10 00       	push   $0x101895
  1005fe:	68 b4 18 10 00       	push   $0x1018b4
  100603:	e8 f4 0f 00 00       	call   1015fc <printk>
  100608:	83 c4 14             	add    $0x14,%esp
  10060b:	68 6b 18 10 00       	push   $0x10186b
  100610:	e8 e7 0f 00 00       	call   1015fc <printk>
  100615:	e8 7e 03 00 00       	call   100998 <get_from_runnable>
  10061a:	5e                   	pop    %esi
  10061b:	5a                   	pop    %edx
  10061c:	53                   	push   %ebx
  10061d:	50                   	push   %eax
  10061e:	e8 0d 03 00 00       	call   100930 <put_into_running>
  100623:	b8 01 00 00 00       	mov    $0x1,%eax
  100628:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10062b:	5b                   	pop    %ebx
  10062c:	5e                   	pop    %esi
  10062d:	5d                   	pop    %ebp
  10062e:	c3                   	ret    
  10062f:	90                   	nop

00100630 <sys_fork>:
  100630:	55                   	push   %ebp
  100631:	89 e5                	mov    %esp,%ebp
  100633:	57                   	push   %edi
  100634:	56                   	push   %esi
  100635:	53                   	push   %ebx
  100636:	83 ec 18             	sub    $0x18,%esp
  100639:	8b 75 08             	mov    0x8(%ebp),%esi
  10063c:	68 e2 18 10 00       	push   $0x1018e2
  100641:	e8 b6 0f 00 00       	call   1015fc <printk>
  100646:	83 c4 10             	add    $0x10,%esp
  100649:	31 db                	xor    %ebx,%ebx
  10064b:	90                   	nop
  10064c:	e8 17 03 00 00       	call   100968 <getpid>
  100651:	89 c2                	mov    %eax,%edx
  100653:	c1 e2 07             	shl    $0x7,%edx
  100656:	01 c2                	add    %eax,%edx
  100658:	01 d2                	add    %edx,%edx
  10065a:	01 c2                	add    %eax,%edx
  10065c:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10065f:	01 c0                	add    %eax,%eax
  100661:	01 d8                	add    %ebx,%eax
  100663:	8b 04 85 a0 3c 10 00 	mov    0x103ca0(,%eax,4),%eax
  10066a:	89 04 9d 70 7d 10 00 	mov    %eax,0x107d70(,%ebx,4)
  100671:	43                   	inc    %ebx
  100672:	81 fb 00 08 00 00    	cmp    $0x800,%ebx
  100678:	75 d2                	jne    10064c <sys_fork+0x1c>
  10067a:	e8 e9 02 00 00       	call   100968 <getpid>
  10067f:	8d 50 40             	lea    0x40(%eax),%edx
  100682:	c1 e2 10             	shl    $0x10,%edx
  100685:	b8 00 00 01 00       	mov    $0x10000,%eax
  10068a:	66 90                	xchg   %ax,%ax
  10068c:	8a 8c 10 00 00 ff ff 	mov    -0x10000(%eax,%edx,1),%cl
  100693:	88 88 00 00 41 00    	mov    %cl,0x410000(%eax)
  100699:	48                   	dec    %eax
  10069a:	75 f0                	jne    10068c <sys_fork+0x5c>
  10069c:	b8 70 9d 10 00       	mov    $0x109d70,%eax
  1006a1:	b9 13 00 00 00       	mov    $0x13,%ecx
  1006a6:	89 c7                	mov    %eax,%edi
  1006a8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1006aa:	c7 05 9c 9d 10 00 00 	movl   $0x0,0x109d9c
  1006b1:	00 00 00 
  1006b4:	83 ec 08             	sub    $0x8,%esp
  1006b7:	50                   	push   %eax
  1006b8:	6a 02                	push   $0x2
  1006ba:	e8 99 03 00 00       	call   100a58 <put_into_runnable>
  1006bf:	b8 02 00 00 00       	mov    $0x2,%eax
  1006c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1006c7:	5b                   	pop    %ebx
  1006c8:	5e                   	pop    %esi
  1006c9:	5f                   	pop    %edi
  1006ca:	5d                   	pop    %ebp
  1006cb:	c3                   	ret    

001006cc <display>:
  1006cc:	55                   	push   %ebp
  1006cd:	89 e5                	mov    %esp,%ebp
  1006cf:	57                   	push   %edi
  1006d0:	53                   	push   %ebx
  1006d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1006d4:	80 fb 0a             	cmp    $0xa,%bl
  1006d7:	74 5b                	je     100734 <display+0x68>
  1006d9:	8b 15 08 34 10 00    	mov    0x103408,%edx
  1006df:	8b 0d 0c 34 10 00    	mov    0x10340c,%ecx
  1006e5:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  1006e8:	c1 e0 04             	shl    $0x4,%eax
  1006eb:	01 d0                	add    %edx,%eax
  1006ed:	01 c0                	add    %eax,%eax
  1006ef:	89 c7                	mov    %eax,%edi
  1006f1:	0f be db             	movsbl %bl,%ebx
  1006f4:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
  1006fa:	66 89 d8             	mov    %bx,%ax
  1006fd:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100701:	42                   	inc    %edx
  100702:	83 fa 50             	cmp    $0x50,%edx
  100705:	75 1d                	jne    100724 <display+0x58>
  100707:	c7 05 08 34 10 00 00 	movl   $0x0,0x103408
  10070e:	00 00 00 
  100711:	41                   	inc    %ecx
  100712:	89 0d 0c 34 10 00    	mov    %ecx,0x10340c
  100718:	b8 01 00 00 00       	mov    $0x1,%eax
  10071d:	5b                   	pop    %ebx
  10071e:	5f                   	pop    %edi
  10071f:	5d                   	pop    %ebp
  100720:	c3                   	ret    
  100721:	8d 76 00             	lea    0x0(%esi),%esi
  100724:	89 15 08 34 10 00    	mov    %edx,0x103408
  10072a:	b8 01 00 00 00       	mov    $0x1,%eax
  10072f:	5b                   	pop    %ebx
  100730:	5f                   	pop    %edi
  100731:	5d                   	pop    %ebp
  100732:	c3                   	ret    
  100733:	90                   	nop
  100734:	c7 05 08 34 10 00 00 	movl   $0x0,0x103408
  10073b:	00 00 00 
  10073e:	ff 05 0c 34 10 00    	incl   0x10340c
  100744:	b8 01 00 00 00       	mov    $0x1,%eax
  100749:	5b                   	pop    %ebx
  10074a:	5f                   	pop    %edi
  10074b:	5d                   	pop    %ebp
  10074c:	c3                   	ret    
  10074d:	8d 76 00             	lea    0x0(%esi),%esi

00100750 <printkernel>:
  100750:	55                   	push   %ebp
  100751:	89 e5                	mov    %esp,%ebp
  100753:	56                   	push   %esi
  100754:	53                   	push   %ebx
  100755:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100758:	8b 75 0c             	mov    0xc(%ebp),%esi
  10075b:	85 f6                	test   %esi,%esi
  10075d:	7e 30                	jle    10078f <printkernel+0x3f>
  10075f:	0f be 03             	movsbl (%ebx),%eax
  100762:	84 c0                	test   %al,%al
  100764:	74 29                	je     10078f <printkernel+0x3f>
  100766:	01 de                	add    %ebx,%esi
  100768:	eb 09                	jmp    100773 <printkernel+0x23>
  10076a:	66 90                	xchg   %ax,%ax
  10076c:	0f be 03             	movsbl (%ebx),%eax
  10076f:	84 c0                	test   %al,%al
  100771:	74 1c                	je     10078f <printkernel+0x3f>
  100773:	83 ec 0c             	sub    $0xc,%esp
  100776:	50                   	push   %eax
  100777:	e8 ec 00 00 00       	call   100868 <putChar>
  10077c:	0f be 03             	movsbl (%ebx),%eax
  10077f:	89 04 24             	mov    %eax,(%esp)
  100782:	e8 45 ff ff ff       	call   1006cc <display>
  100787:	43                   	inc    %ebx
  100788:	83 c4 10             	add    $0x10,%esp
  10078b:	39 de                	cmp    %ebx,%esi
  10078d:	75 dd                	jne    10076c <printkernel+0x1c>
  10078f:	b8 01 00 00 00       	mov    $0x1,%eax
  100794:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100797:	5b                   	pop    %ebx
  100798:	5e                   	pop    %esi
  100799:	5d                   	pop    %ebp
  10079a:	c3                   	ret    
  10079b:	90                   	nop

0010079c <fs_write>:
  10079c:	55                   	push   %ebp
  10079d:	89 e5                	mov    %esp,%ebp
  10079f:	53                   	push   %ebx
  1007a0:	50                   	push   %eax
  1007a1:	8b 5d 10             	mov    0x10(%ebp),%ebx
  1007a4:	ba 30 00 00 00       	mov    $0x30,%edx
  1007a9:	89 d0                	mov    %edx,%eax
  1007ab:	8e e8                	mov    %eax,%gs
  1007ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1007b0:	48                   	dec    %eax
  1007b1:	83 f8 01             	cmp    $0x1,%eax
  1007b4:	76 12                	jbe    1007c8 <fs_write+0x2c>
  1007b6:	83 ec 08             	sub    $0x8,%esp
  1007b9:	6a 28                	push   $0x28
  1007bb:	68 fe 18 10 00       	push   $0x1018fe
  1007c0:	e8 ab 0f 00 00       	call   101770 <abort>
  1007c5:	83 c4 10             	add    $0x10,%esp
  1007c8:	83 ec 08             	sub    $0x8,%esp
  1007cb:	53                   	push   %ebx
  1007cc:	ff 75 0c             	pushl  0xc(%ebp)
  1007cf:	e8 7c ff ff ff       	call   100750 <printkernel>
  1007d4:	89 d8                	mov    %ebx,%eax
  1007d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1007d9:	c9                   	leave  
  1007da:	c3                   	ret    
  1007db:	90                   	nop

001007dc <sys_write>:
  1007dc:	55                   	push   %ebp
  1007dd:	89 e5                	mov    %esp,%ebp
  1007df:	53                   	push   %ebx
  1007e0:	83 ec 08             	sub    $0x8,%esp
  1007e3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1007e6:	ff 73 24             	pushl  0x24(%ebx)
  1007e9:	ff 73 28             	pushl  0x28(%ebx)
  1007ec:	ff 73 20             	pushl  0x20(%ebx)
  1007ef:	e8 a8 ff ff ff       	call   10079c <fs_write>
  1007f4:	89 43 2c             	mov    %eax,0x2c(%ebx)
  1007f7:	83 c4 10             	add    $0x10,%esp
  1007fa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1007fd:	c9                   	leave  
  1007fe:	c3                   	ret    
  1007ff:	90                   	nop

00100800 <print_char>:
  100800:	55                   	push   %ebp
  100801:	89 e5                	mov    %esp,%ebp
  100803:	57                   	push   %edi
  100804:	8b 45 08             	mov    0x8(%ebp),%eax
  100807:	8d 04 80             	lea    (%eax,%eax,4),%eax
  10080a:	c1 e0 04             	shl    $0x4,%eax
  10080d:	03 45 0c             	add    0xc(%ebp),%eax
  100810:	01 c0                	add    %eax,%eax
  100812:	89 c7                	mov    %eax,%edi
  100814:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  100818:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  10081e:	66 89 d0             	mov    %dx,%ax
  100821:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100825:	5f                   	pop    %edi
  100826:	5d                   	pop    %ebp
  100827:	c3                   	ret    

00100828 <initSerial>:
  100828:	55                   	push   %ebp
  100829:	89 e5                	mov    %esp,%ebp
  10082b:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100830:	31 c0                	xor    %eax,%eax
  100832:	ee                   	out    %al,(%dx)
  100833:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100838:	b0 80                	mov    $0x80,%al
  10083a:	ee                   	out    %al,(%dx)
  10083b:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100840:	b0 01                	mov    $0x1,%al
  100842:	ee                   	out    %al,(%dx)
  100843:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100848:	31 c0                	xor    %eax,%eax
  10084a:	ee                   	out    %al,(%dx)
  10084b:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100850:	b0 03                	mov    $0x3,%al
  100852:	ee                   	out    %al,(%dx)
  100853:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100858:	b0 c7                	mov    $0xc7,%al
  10085a:	ee                   	out    %al,(%dx)
  10085b:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100860:	b0 0b                	mov    $0xb,%al
  100862:	ee                   	out    %al,(%dx)
  100863:	5d                   	pop    %ebp
  100864:	c3                   	ret    
  100865:	8d 76 00             	lea    0x0(%esi),%esi

00100868 <putChar>:
  100868:	55                   	push   %ebp
  100869:	89 e5                	mov    %esp,%ebp
  10086b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10086e:	ba fd 03 00 00       	mov    $0x3fd,%edx
  100873:	90                   	nop
  100874:	ec                   	in     (%dx),%al
  100875:	a8 20                	test   $0x20,%al
  100877:	74 fb                	je     100874 <putChar+0xc>
  100879:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10087e:	88 c8                	mov    %cl,%al
  100880:	ee                   	out    %al,(%dx)
  100881:	5d                   	pop    %ebp
  100882:	c3                   	ret    
  100883:	90                   	nop

00100884 <IDLE>:
  100884:	55                   	push   %ebp
  100885:	89 e5                	mov    %esp,%ebp
  100887:	90                   	nop
  100888:	f4                   	hlt    
  100889:	eb fd                	jmp    100888 <IDLE+0x4>
  10088b:	90                   	nop

0010088c <put_into_running.part.0>:
  10088c:	55                   	push   %ebp
  10088d:	89 e5                	mov    %esp,%ebp
  10088f:	53                   	push   %ebx
  100890:	83 ec 7c             	sub    $0x7c,%esp
  100893:	89 c3                	mov    %eax,%ebx
  100895:	a3 80 3c 10 00       	mov    %eax,0x103c80
  10089a:	c1 e0 07             	shl    $0x7,%eax
  10089d:	01 d8                	add    %ebx,%eax
  10089f:	01 c0                	add    %eax,%eax
  1008a1:	01 d8                	add    %ebx,%eax
  1008a3:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1008a6:	8d 04 c5 9c 5c 10 00 	lea    0x105c9c(,%eax,8),%eax
  1008ad:	50                   	push   %eax
  1008ae:	6a 10                	push   $0x10
  1008b0:	e8 ff f8 ff ff       	call   1001b4 <change_tss>
  1008b5:	8d 45 94             	lea    -0x6c(%ebp),%eax
  1008b8:	89 04 24             	mov    %eax,(%esp)
  1008bb:	e8 10 f9 ff ff       	call   1001d0 <get_tss>
  1008c0:	8b 15 80 3c 10 00    	mov    0x103c80,%edx
  1008c6:	89 d0                	mov    %edx,%eax
  1008c8:	c1 e0 07             	shl    $0x7,%eax
  1008cb:	01 d0                	add    %edx,%eax
  1008cd:	01 c0                	add    %eax,%eax
  1008cf:	01 d0                	add    %edx,%eax
  1008d1:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1008d4:	8d 04 c5 9c 5c 10 00 	lea    0x105c9c(,%eax,8),%eax
  1008db:	83 c4 0c             	add    $0xc,%esp
  1008de:	39 45 98             	cmp    %eax,-0x68(%ebp)
  1008e1:	74 12                	je     1008f5 <put_into_running.part.0+0x69>
  1008e3:	83 ec 08             	sub    $0x8,%esp
  1008e6:	6a 10                	push   $0x10
  1008e8:	68 1a 19 10 00       	push   $0x10191a
  1008ed:	e8 7e 0e 00 00       	call   101770 <abort>
  1008f2:	83 c4 10             	add    $0x10,%esp
  1008f5:	83 ec 0c             	sub    $0xc,%esp
  1008f8:	68 3c 18 10 00       	push   $0x10183c
  1008fd:	e8 fa 0c 00 00       	call   1015fc <printk>
  100902:	89 1c 24             	mov    %ebx,(%esp)
  100905:	68 10 1a 10 00       	push   $0x101a10
  10090a:	6a 12                	push   $0x12
  10090c:	68 1a 19 10 00       	push   $0x10191a
  100911:	68 28 19 10 00       	push   $0x101928
  100916:	e8 e1 0c 00 00       	call   1015fc <printk>
  10091b:	83 c4 14             	add    $0x14,%esp
  10091e:	68 6b 18 10 00       	push   $0x10186b
  100923:	e8 d4 0c 00 00       	call   1015fc <printk>
  100928:	83 c4 10             	add    $0x10,%esp
  10092b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10092e:	c9                   	leave  
  10092f:	c3                   	ret    

00100930 <put_into_running>:
  100930:	55                   	push   %ebp
  100931:	89 e5                	mov    %esp,%ebp
  100933:	83 ec 08             	sub    $0x8,%esp
  100936:	8b 45 08             	mov    0x8(%ebp),%eax
  100939:	39 05 80 3c 10 00    	cmp    %eax,0x103c80
  10093f:	74 05                	je     100946 <put_into_running+0x16>
  100941:	e8 46 ff ff ff       	call   10088c <put_into_running.part.0>
  100946:	b8 01 00 00 00       	mov    $0x1,%eax
  10094b:	c9                   	leave  
  10094c:	c3                   	ret    
  10094d:	8d 76 00             	lea    0x0(%esi),%esi

00100950 <update_block>:
  100950:	55                   	push   %ebp
  100951:	89 e5                	mov    %esp,%ebp
  100953:	b8 01 00 00 00       	mov    $0x1,%eax
  100958:	5d                   	pop    %ebp
  100959:	c3                   	ret    
  10095a:	66 90                	xchg   %ax,%ax

0010095c <apply_new_pid>:
  10095c:	55                   	push   %ebp
  10095d:	89 e5                	mov    %esp,%ebp
  10095f:	b8 02 00 00 00       	mov    $0x2,%eax
  100964:	5d                   	pop    %ebp
  100965:	c3                   	ret    
  100966:	66 90                	xchg   %ax,%ax

00100968 <getpid>:
  100968:	55                   	push   %ebp
  100969:	89 e5                	mov    %esp,%ebp
  10096b:	a1 80 3c 10 00       	mov    0x103c80,%eax
  100970:	5d                   	pop    %ebp
  100971:	c3                   	ret    
  100972:	66 90                	xchg   %ax,%ax

00100974 <getrunnable>:
  100974:	55                   	push   %ebp
  100975:	89 e5                	mov    %esp,%ebp
  100977:	a1 e4 32 10 00       	mov    0x1032e4,%eax
  10097c:	5d                   	pop    %ebp
  10097d:	c3                   	ret    
  10097e:	66 90                	xchg   %ax,%ax

00100980 <getblocked>:
  100980:	55                   	push   %ebp
  100981:	89 e5                	mov    %esp,%ebp
  100983:	a1 e0 32 10 00       	mov    0x1032e0,%eax
  100988:	5d                   	pop    %ebp
  100989:	c3                   	ret    
  10098a:	66 90                	xchg   %ax,%ax

0010098c <transfer_pid_mode>:
  10098c:	55                   	push   %ebp
  10098d:	89 e5                	mov    %esp,%ebp
  10098f:	b8 01 00 00 00       	mov    $0x1,%eax
  100994:	5d                   	pop    %ebp
  100995:	c3                   	ret    
  100996:	66 90                	xchg   %ax,%ax

00100998 <get_from_runnable>:
  100998:	55                   	push   %ebp
  100999:	89 e5                	mov    %esp,%ebp
  10099b:	53                   	push   %ebx
  10099c:	51                   	push   %ecx
  10099d:	8b 1d e4 32 10 00    	mov    0x1032e4,%ebx
  1009a3:	83 fb ff             	cmp    $0xffffffff,%ebx
  1009a6:	0f 84 a4 00 00 00    	je     100a50 <get_from_runnable+0xb8>
  1009ac:	89 d8                	mov    %ebx,%eax
  1009ae:	c1 e0 07             	shl    $0x7,%eax
  1009b1:	01 d8                	add    %ebx,%eax
  1009b3:	01 c0                	add    %eax,%eax
  1009b5:	01 d8                	add    %ebx,%eax
  1009b7:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1009ba:	8d 04 c5 a0 3c 10 00 	lea    0x103ca0(,%eax,8),%eax
  1009c1:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  1009c7:	39 da                	cmp    %ebx,%edx
  1009c9:	74 79                	je     100a44 <get_from_runnable+0xac>
  1009cb:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  1009d1:	89 c8                	mov    %ecx,%eax
  1009d3:	c1 e0 07             	shl    $0x7,%eax
  1009d6:	01 c8                	add    %ecx,%eax
  1009d8:	01 c0                	add    %eax,%eax
  1009da:	01 c8                	add    %ecx,%eax
  1009dc:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  1009df:	89 14 c5 00 5d 10 00 	mov    %edx,0x105d00(,%eax,8)
  1009e6:	89 d0                	mov    %edx,%eax
  1009e8:	c1 e0 07             	shl    $0x7,%eax
  1009eb:	01 d0                	add    %edx,%eax
  1009ed:	01 c0                	add    %eax,%eax
  1009ef:	01 d0                	add    %edx,%eax
  1009f1:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1009f4:	89 0c c5 fc 5c 10 00 	mov    %ecx,0x105cfc(,%eax,8)
  1009fb:	89 15 e4 32 10 00    	mov    %edx,0x1032e4
  100a01:	83 ec 0c             	sub    $0xc,%esp
  100a04:	68 3c 18 10 00       	push   $0x10183c
  100a09:	e8 ee 0b 00 00       	call   1015fc <printk>
  100a0e:	58                   	pop    %eax
  100a0f:	5a                   	pop    %edx
  100a10:	ff 35 e4 32 10 00    	pushl  0x1032e4
  100a16:	53                   	push   %ebx
  100a17:	68 ec 19 10 00       	push   $0x1019ec
  100a1c:	6a 61                	push   $0x61
  100a1e:	68 1a 19 10 00       	push   $0x10191a
  100a23:	68 48 19 10 00       	push   $0x101948
  100a28:	e8 cf 0b 00 00       	call   1015fc <printk>
  100a2d:	83 c4 14             	add    $0x14,%esp
  100a30:	68 6b 18 10 00       	push   $0x10186b
  100a35:	e8 c2 0b 00 00       	call   1015fc <printk>
  100a3a:	83 c4 10             	add    $0x10,%esp
  100a3d:	89 d8                	mov    %ebx,%eax
  100a3f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100a42:	c9                   	leave  
  100a43:	c3                   	ret    
  100a44:	c7 05 e4 32 10 00 ff 	movl   $0xffffffff,0x1032e4
  100a4b:	ff ff ff 
  100a4e:	eb b1                	jmp    100a01 <get_from_runnable+0x69>
  100a50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100a55:	eb e8                	jmp    100a3f <get_from_runnable+0xa7>
  100a57:	90                   	nop

00100a58 <put_into_runnable>:
  100a58:	55                   	push   %ebp
  100a59:	89 e5                	mov    %esp,%ebp
  100a5b:	56                   	push   %esi
  100a5c:	53                   	push   %ebx
  100a5d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100a60:	8b 15 e4 32 10 00    	mov    0x1032e4,%edx
  100a66:	83 fa ff             	cmp    $0xffffffff,%edx
  100a69:	0f 84 ed 00 00 00    	je     100b5c <put_into_runnable+0x104>
  100a6f:	89 d0                	mov    %edx,%eax
  100a71:	c1 e0 07             	shl    $0x7,%eax
  100a74:	01 d0                	add    %edx,%eax
  100a76:	01 c0                	add    %eax,%eax
  100a78:	01 d0                	add    %edx,%eax
  100a7a:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100a7d:	8d 34 c5 a0 3c 10 00 	lea    0x103ca0(,%eax,8),%esi
  100a84:	8b 8e 5c 20 00 00    	mov    0x205c(%esi),%ecx
  100a8a:	89 c8                	mov    %ecx,%eax
  100a8c:	c1 e0 07             	shl    $0x7,%eax
  100a8f:	01 c8                	add    %ecx,%eax
  100a91:	01 c0                	add    %eax,%eax
  100a93:	01 c8                	add    %ecx,%eax
  100a95:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100a98:	89 1c c5 00 5d 10 00 	mov    %ebx,0x105d00(,%eax,8)
  100a9f:	89 d8                	mov    %ebx,%eax
  100aa1:	c1 e0 07             	shl    $0x7,%eax
  100aa4:	01 d8                	add    %ebx,%eax
  100aa6:	01 c0                	add    %eax,%eax
  100aa8:	01 d8                	add    %ebx,%eax
  100aaa:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100aad:	8d 04 c5 a0 3c 10 00 	lea    0x103ca0(,%eax,8),%eax
  100ab4:	89 88 5c 20 00 00    	mov    %ecx,0x205c(%eax)
  100aba:	89 90 60 20 00 00    	mov    %edx,0x2060(%eax)
  100ac0:	89 9e 5c 20 00 00    	mov    %ebx,0x205c(%esi)
  100ac6:	89 d8                	mov    %ebx,%eax
  100ac8:	c1 e0 07             	shl    $0x7,%eax
  100acb:	01 d8                	add    %ebx,%eax
  100acd:	01 c0                	add    %eax,%eax
  100acf:	01 d8                	add    %ebx,%eax
  100ad1:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100ad4:	c7 04 c5 ec 5c 10 00 	movl   $0x1,0x105cec(,%eax,8)
  100adb:	01 00 00 00 
  100adf:	85 db                	test   %ebx,%ebx
  100ae1:	75 0a                	jne    100aed <put_into_runnable+0x95>
  100ae3:	c7 05 d8 5c 10 00 84 	movl   $0x100884,0x105cd8
  100aea:	08 10 00 
  100aed:	83 ec 0c             	sub    $0xc,%esp
  100af0:	68 3c 18 10 00       	push   $0x10183c
  100af5:	e8 02 0b 00 00       	call   1015fc <printk>
  100afa:	58                   	pop    %eax
  100afb:	5a                   	pop    %edx
  100afc:	53                   	push   %ebx
  100afd:	ff 35 e4 32 10 00    	pushl  0x1032e4
  100b03:	68 d8 19 10 00       	push   $0x1019d8
  100b08:	6a 7d                	push   $0x7d
  100b0a:	68 1a 19 10 00       	push   $0x10191a
  100b0f:	68 7c 19 10 00       	push   $0x10197c
  100b14:	e8 e3 0a 00 00       	call   1015fc <printk>
  100b19:	83 c4 14             	add    $0x14,%esp
  100b1c:	68 6b 18 10 00       	push   $0x10186b
  100b21:	e8 d6 0a 00 00       	call   1015fc <printk>
  100b26:	89 d8                	mov    %ebx,%eax
  100b28:	c1 e0 07             	shl    $0x7,%eax
  100b2b:	01 d8                	add    %ebx,%eax
  100b2d:	01 c0                	add    %eax,%eax
  100b2f:	01 d8                	add    %ebx,%eax
  100b31:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b34:	8d 04 c5 a0 3c 10 00 	lea    0x103ca0(,%eax,8),%eax
  100b3b:	8b 15 88 3c 10 00    	mov    0x103c88,%edx
  100b41:	89 90 50 20 00 00    	mov    %edx,0x2050(%eax)
  100b47:	8b 55 0c             	mov    0xc(%ebp),%edx
  100b4a:	89 90 64 20 00 00    	mov    %edx,0x2064(%eax)
  100b50:	b8 01 00 00 00       	mov    $0x1,%eax
  100b55:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100b58:	5b                   	pop    %ebx
  100b59:	5e                   	pop    %esi
  100b5a:	5d                   	pop    %ebp
  100b5b:	c3                   	ret    
  100b5c:	89 1d e4 32 10 00    	mov    %ebx,0x1032e4
  100b62:	89 d8                	mov    %ebx,%eax
  100b64:	c1 e0 07             	shl    $0x7,%eax
  100b67:	01 d8                	add    %ebx,%eax
  100b69:	01 c0                	add    %eax,%eax
  100b6b:	01 d8                	add    %ebx,%eax
  100b6d:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b70:	8d 04 c5 a0 3c 10 00 	lea    0x103ca0(,%eax,8),%eax
  100b77:	89 98 5c 20 00 00    	mov    %ebx,0x205c(%eax)
  100b7d:	89 98 60 20 00 00    	mov    %ebx,0x2060(%eax)
  100b83:	e9 3e ff ff ff       	jmp    100ac6 <put_into_runnable+0x6e>

00100b88 <put_into_block>:
  100b88:	55                   	push   %ebp
  100b89:	89 e5                	mov    %esp,%ebp
  100b8b:	57                   	push   %edi
  100b8c:	56                   	push   %esi
  100b8d:	53                   	push   %ebx
  100b8e:	8b 45 08             	mov    0x8(%ebp),%eax
  100b91:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100b94:	8b 0d e0 32 10 00    	mov    0x1032e0,%ecx
  100b9a:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100b9d:	0f 84 99 00 00 00    	je     100c3c <put_into_block+0xb4>
  100ba3:	89 ca                	mov    %ecx,%edx
  100ba5:	c1 e2 07             	shl    $0x7,%edx
  100ba8:	01 ca                	add    %ecx,%edx
  100baa:	01 d2                	add    %edx,%edx
  100bac:	01 ca                	add    %ecx,%edx
  100bae:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100bb1:	8d 3c d5 a0 3c 10 00 	lea    0x103ca0(,%edx,8),%edi
  100bb8:	8b b7 5c 20 00 00    	mov    0x205c(%edi),%esi
  100bbe:	89 f2                	mov    %esi,%edx
  100bc0:	c1 e2 07             	shl    $0x7,%edx
  100bc3:	01 f2                	add    %esi,%edx
  100bc5:	01 d2                	add    %edx,%edx
  100bc7:	01 f2                	add    %esi,%edx
  100bc9:	8d 14 96             	lea    (%esi,%edx,4),%edx
  100bcc:	89 04 d5 00 5d 10 00 	mov    %eax,0x105d00(,%edx,8)
  100bd3:	89 c2                	mov    %eax,%edx
  100bd5:	c1 e2 07             	shl    $0x7,%edx
  100bd8:	01 c2                	add    %eax,%edx
  100bda:	01 d2                	add    %edx,%edx
  100bdc:	01 c2                	add    %eax,%edx
  100bde:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100be1:	8d 14 d5 a0 3c 10 00 	lea    0x103ca0(,%edx,8),%edx
  100be8:	89 b2 5c 20 00 00    	mov    %esi,0x205c(%edx)
  100bee:	89 8a 60 20 00 00    	mov    %ecx,0x2060(%edx)
  100bf4:	89 87 5c 20 00 00    	mov    %eax,0x205c(%edi)
  100bfa:	89 c2                	mov    %eax,%edx
  100bfc:	c1 e2 07             	shl    $0x7,%edx
  100bff:	01 c2                	add    %eax,%edx
  100c01:	01 d2                	add    %edx,%edx
  100c03:	01 c2                	add    %eax,%edx
  100c05:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c08:	c1 e2 03             	shl    $0x3,%edx
  100c0b:	8d 82 a0 5c 10 00    	lea    0x105ca0(%edx),%eax
  100c11:	b9 13 00 00 00       	mov    $0x13,%ecx
  100c16:	89 c7                	mov    %eax,%edi
  100c18:	89 de                	mov    %ebx,%esi
  100c1a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100c1c:	8b 43 20             	mov    0x20(%ebx),%eax
  100c1f:	89 82 f4 5c 10 00    	mov    %eax,0x105cf4(%edx)
  100c25:	c7 82 ec 5c 10 00 00 	movl   $0x0,0x105cec(%edx)
  100c2c:	00 00 00 
  100c2f:	b8 01 00 00 00       	mov    $0x1,%eax
  100c34:	5b                   	pop    %ebx
  100c35:	5e                   	pop    %esi
  100c36:	5f                   	pop    %edi
  100c37:	5d                   	pop    %ebp
  100c38:	c3                   	ret    
  100c39:	8d 76 00             	lea    0x0(%esi),%esi
  100c3c:	a3 e0 32 10 00       	mov    %eax,0x1032e0
  100c41:	89 c2                	mov    %eax,%edx
  100c43:	c1 e2 07             	shl    $0x7,%edx
  100c46:	01 c2                	add    %eax,%edx
  100c48:	01 d2                	add    %edx,%edx
  100c4a:	01 c2                	add    %eax,%edx
  100c4c:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c4f:	8d 14 d5 a0 3c 10 00 	lea    0x103ca0(,%edx,8),%edx
  100c56:	89 82 60 20 00 00    	mov    %eax,0x2060(%edx)
  100c5c:	89 82 5c 20 00 00    	mov    %eax,0x205c(%edx)
  100c62:	eb 96                	jmp    100bfa <put_into_block+0x72>

00100c64 <get_from>:
  100c64:	55                   	push   %ebp
  100c65:	89 e5                	mov    %esp,%ebp
  100c67:	56                   	push   %esi
  100c68:	53                   	push   %ebx
  100c69:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100c6c:	8b 45 0c             	mov    0xc(%ebp),%eax
  100c6f:	85 db                	test   %ebx,%ebx
  100c71:	0f 8e 01 01 00 00    	jle    100d78 <get_from+0x114>
  100c77:	39 c3                	cmp    %eax,%ebx
  100c79:	74 42                	je     100cbd <get_from+0x59>
  100c7b:	89 da                	mov    %ebx,%edx
  100c7d:	c1 e2 07             	shl    $0x7,%edx
  100c80:	01 da                	add    %ebx,%edx
  100c82:	01 d2                	add    %edx,%edx
  100c84:	01 da                	add    %ebx,%edx
  100c86:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100c89:	8b 0c d5 00 5d 10 00 	mov    0x105d00(,%edx,8),%ecx
  100c90:	39 cb                	cmp    %ecx,%ebx
  100c92:	75 25                	jne    100cb9 <get_from+0x55>
  100c94:	e9 df 00 00 00       	jmp    100d78 <get_from+0x114>
  100c99:	8d 76 00             	lea    0x0(%esi),%esi
  100c9c:	89 ca                	mov    %ecx,%edx
  100c9e:	c1 e2 07             	shl    $0x7,%edx
  100ca1:	01 ca                	add    %ecx,%edx
  100ca3:	01 d2                	add    %edx,%edx
  100ca5:	01 ca                	add    %ecx,%edx
  100ca7:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100caa:	8b 0c d5 00 5d 10 00 	mov    0x105d00(,%edx,8),%ecx
  100cb1:	39 cb                	cmp    %ecx,%ebx
  100cb3:	0f 84 bf 00 00 00    	je     100d78 <get_from+0x114>
  100cb9:	39 c1                	cmp    %eax,%ecx
  100cbb:	75 df                	jne    100c9c <get_from+0x38>
  100cbd:	89 c2                	mov    %eax,%edx
  100cbf:	c1 e2 07             	shl    $0x7,%edx
  100cc2:	01 c2                	add    %eax,%edx
  100cc4:	01 d2                	add    %edx,%edx
  100cc6:	01 c2                	add    %eax,%edx
  100cc8:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100ccb:	8b 04 c5 ec 5c 10 00 	mov    0x105cec(,%eax,8),%eax
  100cd2:	85 c0                	test   %eax,%eax
  100cd4:	0f 84 c2 00 00 00    	je     100d9c <get_from+0x138>
  100cda:	48                   	dec    %eax
  100cdb:	75 7f                	jne    100d5c <get_from+0xf8>
  100cdd:	be e4 32 10 00       	mov    $0x1032e4,%esi
  100ce2:	3b 1e                	cmp    (%esi),%ebx
  100ce4:	74 15                	je     100cfb <get_from+0x97>
  100ce6:	83 ec 08             	sub    $0x8,%esp
  100ce9:	68 bf 00 00 00       	push   $0xbf
  100cee:	68 1a 19 10 00       	push   $0x10191a
  100cf3:	e8 78 0a 00 00       	call   101770 <abort>
  100cf8:	83 c4 10             	add    $0x10,%esp
  100cfb:	89 d8                	mov    %ebx,%eax
  100cfd:	c1 e0 07             	shl    $0x7,%eax
  100d00:	01 d8                	add    %ebx,%eax
  100d02:	01 c0                	add    %eax,%eax
  100d04:	01 d8                	add    %ebx,%eax
  100d06:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100d09:	8d 04 c5 a0 3c 10 00 	lea    0x103ca0(,%eax,8),%eax
  100d10:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100d16:	39 da                	cmp    %ebx,%edx
  100d18:	0f 84 8a 00 00 00    	je     100da8 <get_from+0x144>
  100d1e:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100d24:	89 c8                	mov    %ecx,%eax
  100d26:	c1 e0 07             	shl    $0x7,%eax
  100d29:	01 c8                	add    %ecx,%eax
  100d2b:	01 c0                	add    %eax,%eax
  100d2d:	01 c8                	add    %ecx,%eax
  100d2f:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100d32:	89 14 c5 00 5d 10 00 	mov    %edx,0x105d00(,%eax,8)
  100d39:	89 d0                	mov    %edx,%eax
  100d3b:	c1 e0 07             	shl    $0x7,%eax
  100d3e:	01 d0                	add    %edx,%eax
  100d40:	01 c0                	add    %eax,%eax
  100d42:	01 d0                	add    %edx,%eax
  100d44:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100d47:	89 0c c5 fc 5c 10 00 	mov    %ecx,0x105cfc(,%eax,8)
  100d4e:	89 16                	mov    %edx,(%esi)
  100d50:	89 d8                	mov    %ebx,%eax
  100d52:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d55:	5b                   	pop    %ebx
  100d56:	5e                   	pop    %esi
  100d57:	5d                   	pop    %ebp
  100d58:	c3                   	ret    
  100d59:	8d 76 00             	lea    0x0(%esi),%esi
  100d5c:	83 ec 08             	sub    $0x8,%esp
  100d5f:	68 bb 00 00 00       	push   $0xbb
  100d64:	68 1a 19 10 00       	push   $0x10191a
  100d69:	e8 02 0a 00 00       	call   101770 <abort>
  100d6e:	a1 00 00 00 00       	mov    0x0,%eax
  100d73:	0f 0b                	ud2    
  100d75:	8d 76 00             	lea    0x0(%esi),%esi
  100d78:	83 ec 08             	sub    $0x8,%esp
  100d7b:	68 ac 00 00 00       	push   $0xac
  100d80:	68 1a 19 10 00       	push   $0x10191a
  100d85:	e8 e6 09 00 00       	call   101770 <abort>
  100d8a:	83 c4 10             	add    $0x10,%esp
  100d8d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100d92:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d95:	5b                   	pop    %ebx
  100d96:	5e                   	pop    %esi
  100d97:	5d                   	pop    %ebp
  100d98:	c3                   	ret    
  100d99:	8d 76 00             	lea    0x0(%esi),%esi
  100d9c:	be e0 32 10 00       	mov    $0x1032e0,%esi
  100da1:	e9 3c ff ff ff       	jmp    100ce2 <get_from+0x7e>
  100da6:	66 90                	xchg   %ax,%ax
  100da8:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100dae:	89 d8                	mov    %ebx,%eax
  100db0:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100db3:	5b                   	pop    %ebx
  100db4:	5e                   	pop    %esi
  100db5:	5d                   	pop    %ebp
  100db6:	c3                   	ret    
  100db7:	90                   	nop

00100db8 <get_from_block>:
  100db8:	55                   	push   %ebp
  100db9:	89 e5                	mov    %esp,%ebp
  100dbb:	83 ec 10             	sub    $0x10,%esp
  100dbe:	ff 75 08             	pushl  0x8(%ebp)
  100dc1:	ff 35 e0 32 10 00    	pushl  0x1032e0
  100dc7:	e8 98 fe ff ff       	call   100c64 <get_from>
  100dcc:	83 c4 10             	add    $0x10,%esp
  100dcf:	40                   	inc    %eax
  100dd0:	74 0a                	je     100ddc <get_from_block+0x24>
  100dd2:	b8 01 00 00 00       	mov    $0x1,%eax
  100dd7:	c9                   	leave  
  100dd8:	c3                   	ret    
  100dd9:	8d 76 00             	lea    0x0(%esi),%esi
  100ddc:	83 ec 08             	sub    $0x8,%esp
  100ddf:	68 f6 00 00 00       	push   $0xf6
  100de4:	68 1a 19 10 00       	push   $0x10191a
  100de9:	e8 82 09 00 00       	call   101770 <abort>
  100dee:	83 c4 10             	add    $0x10,%esp
  100df1:	b8 01 00 00 00       	mov    $0x1,%eax
  100df6:	c9                   	leave  
  100df7:	c3                   	ret    

00100df8 <check_block>:
  100df8:	55                   	push   %ebp
  100df9:	89 e5                	mov    %esp,%ebp
  100dfb:	57                   	push   %edi
  100dfc:	56                   	push   %esi
  100dfd:	53                   	push   %ebx
  100dfe:	83 ec 0c             	sub    $0xc,%esp
  100e01:	a1 e0 32 10 00       	mov    0x1032e0,%eax
  100e06:	89 c6                	mov    %eax,%esi
  100e08:	83 f8 ff             	cmp    $0xffffffff,%eax
  100e0b:	74 58                	je     100e65 <check_block+0x6d>
  100e0d:	89 c2                	mov    %eax,%edx
  100e0f:	c1 e2 07             	shl    $0x7,%edx
  100e12:	01 c2                	add    %eax,%edx
  100e14:	01 d2                	add    %edx,%edx
  100e16:	01 c2                	add    %eax,%edx
  100e18:	8d 3c 90             	lea    (%eax,%edx,4),%edi
  100e1b:	eb 0c                	jmp    100e29 <check_block+0x31>
  100e1d:	8d 76 00             	lea    0x0(%esi),%esi
  100e20:	39 c6                	cmp    %eax,%esi
  100e22:	74 3c                	je     100e60 <check_block+0x68>
  100e24:	83 f8 ff             	cmp    $0xffffffff,%eax
  100e27:	74 37                	je     100e60 <check_block+0x68>
  100e29:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
  100e30:	8b 8b f4 5c 10 00    	mov    0x105cf4(%ebx),%ecx
  100e36:	85 c9                	test   %ecx,%ecx
  100e38:	7f e6                	jg     100e20 <check_block+0x28>
  100e3a:	83 ec 0c             	sub    $0xc,%esp
  100e3d:	56                   	push   %esi
  100e3e:	e8 75 ff ff ff       	call   100db8 <get_from_block>
  100e43:	58                   	pop    %eax
  100e44:	5a                   	pop    %edx
  100e45:	81 c3 a0 5c 10 00    	add    $0x105ca0,%ebx
  100e4b:	53                   	push   %ebx
  100e4c:	56                   	push   %esi
  100e4d:	e8 06 fc ff ff       	call   100a58 <put_into_runnable>
  100e52:	83 c4 10             	add    $0x10,%esp
  100e55:	a1 e0 32 10 00       	mov    0x1032e0,%eax
  100e5a:	39 c6                	cmp    %eax,%esi
  100e5c:	75 c6                	jne    100e24 <check_block+0x2c>
  100e5e:	66 90                	xchg   %ax,%ax
  100e60:	be 01 00 00 00       	mov    $0x1,%esi
  100e65:	89 f0                	mov    %esi,%eax
  100e67:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100e6a:	5b                   	pop    %ebx
  100e6b:	5e                   	pop    %esi
  100e6c:	5f                   	pop    %edi
  100e6d:	5d                   	pop    %ebp
  100e6e:	c3                   	ret    
  100e6f:	90                   	nop

00100e70 <checkTimeCount>:
  100e70:	a1 84 3c 10 00       	mov    0x103c84,%eax
  100e75:	85 c0                	test   %eax,%eax
  100e77:	0f 84 cb 00 00 00    	je     100f48 <checkTimeCount+0xd8>
  100e7d:	55                   	push   %ebp
  100e7e:	89 e5                	mov    %esp,%ebp
  100e80:	57                   	push   %edi
  100e81:	56                   	push   %esi
  100e82:	83 ec 0c             	sub    $0xc,%esp
  100e85:	68 3c 18 10 00       	push   $0x10183c
  100e8a:	e8 6d 07 00 00       	call   1015fc <printk>
  100e8f:	8b 15 80 3c 10 00    	mov    0x103c80,%edx
  100e95:	58                   	pop    %eax
  100e96:	59                   	pop    %ecx
  100e97:	89 d0                	mov    %edx,%eax
  100e99:	c1 e0 07             	shl    $0x7,%eax
  100e9c:	01 d0                	add    %edx,%eax
  100e9e:	01 c0                	add    %eax,%eax
  100ea0:	01 d0                	add    %edx,%eax
  100ea2:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100ea5:	ff 34 c5 f0 5c 10 00 	pushl  0x105cf0(,%eax,8)
  100eac:	52                   	push   %edx
  100ead:	68 00 1a 10 00       	push   $0x101a00
  100eb2:	6a 1f                	push   $0x1f
  100eb4:	68 1a 19 10 00       	push   $0x10191a
  100eb9:	68 ac 19 10 00       	push   $0x1019ac
  100ebe:	e8 39 07 00 00       	call   1015fc <printk>
  100ec3:	83 c4 14             	add    $0x14,%esp
  100ec6:	68 6b 18 10 00       	push   $0x10186b
  100ecb:	e8 2c 07 00 00       	call   1015fc <printk>
  100ed0:	e8 23 ff ff ff       	call   100df8 <check_block>
  100ed5:	8b 15 80 3c 10 00    	mov    0x103c80,%edx
  100edb:	89 d0                	mov    %edx,%eax
  100edd:	c1 e0 07             	shl    $0x7,%eax
  100ee0:	01 d0                	add    %edx,%eax
  100ee2:	01 c0                	add    %eax,%eax
  100ee4:	01 d0                	add    %edx,%eax
  100ee6:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100ee9:	c1 e0 03             	shl    $0x3,%eax
  100eec:	83 c4 10             	add    $0x10,%esp
  100eef:	8b b0 f0 5c 10 00    	mov    0x105cf0(%eax),%esi
  100ef5:	85 f6                	test   %esi,%esi
  100ef7:	7e 0f                	jle    100f08 <checkTimeCount+0x98>
  100ef9:	b8 01 00 00 00       	mov    $0x1,%eax
  100efe:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100f01:	5e                   	pop    %esi
  100f02:	5f                   	pop    %edi
  100f03:	5d                   	pop    %ebp
  100f04:	c3                   	ret    
  100f05:	8d 76 00             	lea    0x0(%esi),%esi
  100f08:	05 a0 5c 10 00       	add    $0x105ca0,%eax
  100f0d:	b9 13 00 00 00       	mov    $0x13,%ecx
  100f12:	89 c7                	mov    %eax,%edi
  100f14:	8b 75 08             	mov    0x8(%ebp),%esi
  100f17:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100f19:	83 ec 08             	sub    $0x8,%esp
  100f1c:	ff 75 08             	pushl  0x8(%ebp)
  100f1f:	52                   	push   %edx
  100f20:	e8 33 fb ff ff       	call   100a58 <put_into_runnable>
  100f25:	e8 6e fa ff ff       	call   100998 <get_from_runnable>
  100f2a:	83 c4 10             	add    $0x10,%esp
  100f2d:	3b 05 80 3c 10 00    	cmp    0x103c80,%eax
  100f33:	74 c4                	je     100ef9 <checkTimeCount+0x89>
  100f35:	e8 52 f9 ff ff       	call   10088c <put_into_running.part.0>
  100f3a:	b8 01 00 00 00       	mov    $0x1,%eax
  100f3f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100f42:	5e                   	pop    %esi
  100f43:	5f                   	pop    %edi
  100f44:	5d                   	pop    %ebp
  100f45:	c3                   	ret    
  100f46:	66 90                	xchg   %ax,%ax
  100f48:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100f4d:	c3                   	ret    
  100f4e:	66 90                	xchg   %ax,%ax

00100f50 <check_is_in>:
  100f50:	55                   	push   %ebp
  100f51:	89 e5                	mov    %esp,%ebp
  100f53:	53                   	push   %ebx
  100f54:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100f57:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100f5a:	85 c9                	test   %ecx,%ecx
  100f5c:	7e 4a                	jle    100fa8 <check_is_in+0x58>
  100f5e:	39 d9                	cmp    %ebx,%ecx
  100f60:	74 3b                	je     100f9d <check_is_in+0x4d>
  100f62:	89 c8                	mov    %ecx,%eax
  100f64:	c1 e0 07             	shl    $0x7,%eax
  100f67:	01 c8                	add    %ecx,%eax
  100f69:	01 c0                	add    %eax,%eax
  100f6b:	01 c8                	add    %ecx,%eax
  100f6d:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100f70:	8b 14 c5 00 5d 10 00 	mov    0x105d00(,%eax,8),%edx
  100f77:	39 d1                	cmp    %edx,%ecx
  100f79:	75 1e                	jne    100f99 <check_is_in+0x49>
  100f7b:	eb 2b                	jmp    100fa8 <check_is_in+0x58>
  100f7d:	8d 76 00             	lea    0x0(%esi),%esi
  100f80:	89 d0                	mov    %edx,%eax
  100f82:	c1 e0 07             	shl    $0x7,%eax
  100f85:	01 d0                	add    %edx,%eax
  100f87:	01 c0                	add    %eax,%eax
  100f89:	01 d0                	add    %edx,%eax
  100f8b:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100f8e:	8b 14 c5 00 5d 10 00 	mov    0x105d00(,%eax,8),%edx
  100f95:	39 d1                	cmp    %edx,%ecx
  100f97:	74 0f                	je     100fa8 <check_is_in+0x58>
  100f99:	39 d3                	cmp    %edx,%ebx
  100f9b:	75 e3                	jne    100f80 <check_is_in+0x30>
  100f9d:	b8 01 00 00 00       	mov    $0x1,%eax
  100fa2:	5b                   	pop    %ebx
  100fa3:	5d                   	pop    %ebp
  100fa4:	c3                   	ret    
  100fa5:	8d 76 00             	lea    0x0(%esi),%esi
  100fa8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100fad:	5b                   	pop    %ebx
  100fae:	5d                   	pop    %ebp
  100faf:	c3                   	ret    

00100fb0 <block_decrease>:
  100fb0:	55                   	push   %ebp
  100fb1:	89 e5                	mov    %esp,%ebp
  100fb3:	8b 0d e0 32 10 00    	mov    0x1032e0,%ecx
  100fb9:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100fbc:	74 2e                	je     100fec <block_decrease+0x3c>
  100fbe:	89 ca                	mov    %ecx,%edx
  100fc0:	89 d0                	mov    %edx,%eax
  100fc2:	c1 e0 07             	shl    $0x7,%eax
  100fc5:	01 d0                	add    %edx,%eax
  100fc7:	01 c0                	add    %eax,%eax
  100fc9:	01 d0                	add    %edx,%eax
  100fcb:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100fce:	8d 04 c5 a0 3c 10 00 	lea    0x103ca0(,%eax,8),%eax
  100fd5:	ff 88 54 20 00 00    	decl   0x2054(%eax)
  100fdb:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100fe1:	39 d1                	cmp    %edx,%ecx
  100fe3:	75 db                	jne    100fc0 <block_decrease+0x10>
  100fe5:	b8 01 00 00 00       	mov    $0x1,%eax
  100fea:	5d                   	pop    %ebp
  100feb:	c3                   	ret    
  100fec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100ff1:	5d                   	pop    %ebp
  100ff2:	c3                   	ret    
  100ff3:	90                   	nop

00100ff4 <init_pcb>:
  100ff4:	55                   	push   %ebp
  100ff5:	89 e5                	mov    %esp,%ebp
  100ff7:	c7 05 88 3c 10 00 05 	movl   $0x5,0x103c88
  100ffe:	00 00 00 
  101001:	ba f8 5c 10 00       	mov    $0x105cf8,%edx
  101006:	31 c0                	xor    %eax,%eax
  101008:	89 02                	mov    %eax,(%edx)
  10100a:	8d 48 ff             	lea    -0x1(%eax),%ecx
  10100d:	89 4a 04             	mov    %ecx,0x4(%edx)
  101010:	40                   	inc    %eax
  101011:	89 42 08             	mov    %eax,0x8(%edx)
  101014:	81 c2 68 20 00 00    	add    $0x2068,%edx
  10101a:	3d 00 08 00 00       	cmp    $0x800,%eax
  10101f:	75 e7                	jne    101008 <init_pcb+0x14>
  101021:	c7 05 fc 5c 10 00 ff 	movl   $0x7ff,0x105cfc
  101028:	07 00 00 
  10102b:	c7 05 98 7c 13 01 00 	movl   $0x0,0x1137c98
  101032:	00 00 00 
  101035:	5d                   	pop    %ebp
  101036:	c3                   	ret    
  101037:	90                   	nop

00101038 <init_kernel_pcb>:
  101038:	55                   	push   %ebp
  101039:	89 e5                	mov    %esp,%ebp
  10103b:	c7 05 e8 5c 10 00 10 	movl   $0x10,0x105ce8
  101042:	00 00 00 
  101045:	c7 05 dc 5c 10 00 08 	movl   $0x8,0x105cdc
  10104c:	00 00 00 
  10104f:	c7 05 ac 5c 10 00 10 	movl   $0x10,0x105cac
  101056:	00 00 00 
  101059:	c7 05 a8 5c 10 00 10 	movl   $0x10,0x105ca8
  101060:	00 00 00 
  101063:	c7 05 d8 5c 10 00 84 	movl   $0x100884,0x105cd8
  10106a:	08 10 00 
  10106d:	c7 05 e4 5c 10 00 00 	movl   $0x400000,0x105ce4
  101074:	00 40 00 
  101077:	c7 05 ec 5c 10 00 01 	movl   $0x1,0x105cec
  10107e:	00 00 00 
  101081:	c7 05 f0 5c 10 00 04 	movl   $0x4,0x105cf0
  101088:	00 00 00 
  10108b:	b8 01 00 00 00       	mov    $0x1,%eax
  101090:	5d                   	pop    %ebp
  101091:	c3                   	ret    
  101092:	66 90                	xchg   %ax,%ax

00101094 <transfer_pid_state>:
  101094:	55                   	push   %ebp
  101095:	89 e5                	mov    %esp,%ebp
  101097:	b8 01 00 00 00       	mov    $0x1,%eax
  10109c:	5d                   	pop    %ebp
  10109d:	c3                   	ret    
  10109e:	66 90                	xchg   %ax,%ax

001010a0 <make_pcb>:
  1010a0:	55                   	push   %ebp
  1010a1:	89 e5                	mov    %esp,%ebp
  1010a3:	57                   	push   %edi
  1010a4:	56                   	push   %esi
  1010a5:	8b 55 08             	mov    0x8(%ebp),%edx
  1010a8:	89 d0                	mov    %edx,%eax
  1010aa:	c1 e0 07             	shl    $0x7,%eax
  1010ad:	01 d0                	add    %edx,%eax
  1010af:	01 c0                	add    %eax,%eax
  1010b1:	01 d0                	add    %edx,%eax
  1010b3:	8d 14 82             	lea    (%edx,%eax,4),%edx
  1010b6:	c1 e2 03             	shl    $0x3,%edx
  1010b9:	8d 82 a0 5c 10 00    	lea    0x105ca0(%edx),%eax
  1010bf:	b9 13 00 00 00       	mov    $0x13,%ecx
  1010c4:	89 c7                	mov    %eax,%edi
  1010c6:	8b 75 0c             	mov    0xc(%ebp),%esi
  1010c9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1010cb:	8b 45 10             	mov    0x10(%ebp),%eax
  1010ce:	89 82 ec 5c 10 00    	mov    %eax,0x105cec(%edx)
  1010d4:	8b 45 14             	mov    0x14(%ebp),%eax
  1010d7:	89 82 f0 5c 10 00    	mov    %eax,0x105cf0(%edx)
  1010dd:	8b 45 18             	mov    0x18(%ebp),%eax
  1010e0:	89 82 f4 5c 10 00    	mov    %eax,0x105cf4(%edx)
  1010e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1010e9:	89 82 04 5d 10 00    	mov    %eax,0x105d04(%edx)
  1010ef:	b8 01 00 00 00       	mov    $0x1,%eax
  1010f4:	5e                   	pop    %esi
  1010f5:	5f                   	pop    %edi
  1010f6:	5d                   	pop    %ebp
  1010f7:	c3                   	ret    

001010f8 <initIdt>:
  1010f8:	55                   	push   %ebp
  1010f9:	89 e5                	mov    %esp,%ebp
  1010fb:	53                   	push   %ebx
  1010fc:	ba 07 18 10 00       	mov    $0x101807,%edx
  101101:	89 d3                	mov    %edx,%ebx
  101103:	c1 ea 10             	shr    $0x10,%edx
  101106:	b9 80 85 13 01       	mov    $0x1138580,%ecx
  10110b:	b8 80 7d 13 01       	mov    $0x1137d80,%eax
  101110:	66 89 18             	mov    %bx,(%eax)
  101113:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  101119:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  10111d:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  101121:	66 89 50 06          	mov    %dx,0x6(%eax)
  101125:	83 c0 08             	add    $0x8,%eax
  101128:	39 c1                	cmp    %eax,%ecx
  10112a:	75 e4                	jne    101110 <initIdt+0x18>
  10112c:	b8 0d 18 10 00       	mov    $0x10180d,%eax
  101131:	66 a3 e8 7d 13 01    	mov    %ax,0x1137de8
  101137:	66 c7 05 ea 7d 13 01 	movw   $0x8,0x1137dea
  10113e:	08 00 
  101140:	c6 05 ec 7d 13 01 00 	movb   $0x0,0x1137dec
  101147:	c6 05 ed 7d 13 01 8f 	movb   $0x8f,0x1137ded
  10114e:	c1 e8 10             	shr    $0x10,%eax
  101151:	66 a3 ee 7d 13 01    	mov    %ax,0x1137dee
  101157:	b8 11 18 10 00       	mov    $0x101811,%eax
  10115c:	66 a3 80 81 13 01    	mov    %ax,0x1138180
  101162:	66 c7 05 82 81 13 01 	movw   $0x8,0x1138182
  101169:	08 00 
  10116b:	c6 05 84 81 13 01 00 	movb   $0x0,0x1138184
  101172:	c6 05 85 81 13 01 ee 	movb   $0xee,0x1138185
  101179:	c1 e8 10             	shr    $0x10,%eax
  10117c:	66 a3 86 81 13 01    	mov    %ax,0x1138186
  101182:	b8 1a 18 10 00       	mov    $0x10181a,%eax
  101187:	66 a3 80 7e 13 01    	mov    %ax,0x1137e80
  10118d:	66 c7 05 82 7e 13 01 	movw   $0x8,0x1137e82
  101194:	08 00 
  101196:	c6 05 84 7e 13 01 00 	movb   $0x0,0x1137e84
  10119d:	c6 05 85 7e 13 01 8e 	movb   $0x8e,0x1137e85
  1011a4:	c1 e8 10             	shr    $0x10,%eax
  1011a7:	66 a3 86 7e 13 01    	mov    %ax,0x1137e86
  1011ad:	66 c7 05 10 34 10 00 	movw   $0x7ff,0x103410
  1011b4:	ff 07 
  1011b6:	b8 80 7d 13 01       	mov    $0x1137d80,%eax
  1011bb:	66 a3 12 34 10 00    	mov    %ax,0x103412
  1011c1:	c1 e8 10             	shr    $0x10,%eax
  1011c4:	66 a3 14 34 10 00    	mov    %ax,0x103414
  1011ca:	b8 10 34 10 00       	mov    $0x103410,%eax
  1011cf:	0f 01 18             	lidtl  (%eax)
  1011d2:	5b                   	pop    %ebx
  1011d3:	5d                   	pop    %ebp
  1011d4:	c3                   	ret    
  1011d5:	66 90                	xchg   %ax,%ax
  1011d7:	90                   	nop

001011d8 <syscallHandle>:
  1011d8:	55                   	push   %ebp
  1011d9:	89 e5                	mov    %esp,%ebp
  1011db:	53                   	push   %ebx
  1011dc:	50                   	push   %eax
  1011dd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1011e0:	8b 43 2c             	mov    0x2c(%ebx),%eax
  1011e3:	83 f8 02             	cmp    $0x2,%eax
  1011e6:	74 28                	je     101210 <syscallHandle+0x38>
  1011e8:	76 3a                	jbe    101224 <syscallHandle+0x4c>
  1011ea:	83 f8 04             	cmp    $0x4,%eax
  1011ed:	74 15                	je     101204 <syscallHandle+0x2c>
  1011ef:	3d e6 00 00 00       	cmp    $0xe6,%eax
  1011f4:	75 29                	jne    10121f <syscallHandle+0x47>
  1011f6:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1011f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1011fc:	c9                   	leave  
  1011fd:	e9 aa f3 ff ff       	jmp    1005ac <sys_sleep>
  101202:	66 90                	xchg   %ax,%ax
  101204:	89 5d 08             	mov    %ebx,0x8(%ebp)
  101207:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10120a:	c9                   	leave  
  10120b:	e9 cc f5 ff ff       	jmp    1007dc <sys_write>
  101210:	83 ec 0c             	sub    $0xc,%esp
  101213:	53                   	push   %ebx
  101214:	e8 17 f4 ff ff       	call   100630 <sys_fork>
  101219:	89 43 2c             	mov    %eax,0x2c(%ebx)
  10121c:	83 c4 10             	add    $0x10,%esp
  10121f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101222:	c9                   	leave  
  101223:	c3                   	ret    
  101224:	48                   	dec    %eax
  101225:	75 f8                	jne    10121f <syscallHandle+0x47>
  101227:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10122a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10122d:	c9                   	leave  
  10122e:	e9 51 f3 ff ff       	jmp    100584 <sys_exit>
  101233:	90                   	nop

00101234 <GProtectFaultHandle>:
  101234:	55                   	push   %ebp
  101235:	89 e5                	mov    %esp,%ebp
  101237:	83 ec 14             	sub    $0x14,%esp
  10123a:	68 3c 18 10 00       	push   $0x10183c
  10123f:	e8 b8 03 00 00       	call   1015fc <printk>
  101244:	58                   	pop    %eax
  101245:	8b 45 08             	mov    0x8(%ebp),%eax
  101248:	ff 70 30             	pushl  0x30(%eax)
  10124b:	68 94 1a 10 00       	push   $0x101a94
  101250:	6a 6a                	push   $0x6a
  101252:	68 21 1a 10 00       	push   $0x101a21
  101257:	68 34 1a 10 00       	push   $0x101a34
  10125c:	e8 9b 03 00 00       	call   1015fc <printk>
  101261:	83 c4 14             	add    $0x14,%esp
  101264:	68 6b 18 10 00       	push   $0x10186b
  101269:	e8 8e 03 00 00       	call   1015fc <printk>
  10126e:	5a                   	pop    %edx
  10126f:	59                   	pop    %ecx
  101270:	6a 6b                	push   $0x6b
  101272:	68 21 1a 10 00       	push   $0x101a21
  101277:	e8 f4 04 00 00       	call   101770 <abort>
  10127c:	83 c4 10             	add    $0x10,%esp
  10127f:	c9                   	leave  
  101280:	c3                   	ret    
  101281:	8d 76 00             	lea    0x0(%esi),%esi

00101284 <timeHandle>:
  101284:	55                   	push   %ebp
  101285:	89 e5                	mov    %esp,%ebp
  101287:	53                   	push   %ebx
  101288:	83 ec 10             	sub    $0x10,%esp
  10128b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10128e:	6a 41                	push   $0x41
  101290:	e8 d3 f5 ff ff       	call   100868 <putChar>
  101295:	e8 ce f6 ff ff       	call   100968 <getpid>
  10129a:	89 c2                	mov    %eax,%edx
  10129c:	c1 e2 07             	shl    $0x7,%edx
  10129f:	01 c2                	add    %eax,%edx
  1012a1:	01 d2                	add    %edx,%edx
  1012a3:	01 c2                	add    %eax,%edx
  1012a5:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1012a8:	ff 0c c5 f0 5c 10 00 	decl   0x105cf0(,%eax,8)
  1012af:	e8 fc fc ff ff       	call   100fb0 <block_decrease>
  1012b4:	89 1c 24             	mov    %ebx,(%esp)
  1012b7:	e8 b4 fb ff ff       	call   100e70 <checkTimeCount>
  1012bc:	83 c4 10             	add    $0x10,%esp
  1012bf:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  1012c6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012c9:	c9                   	leave  
  1012ca:	e9 99 f5 ff ff       	jmp    100868 <putChar>
  1012cf:	90                   	nop

001012d0 <irqHandle>:
  1012d0:	55                   	push   %ebp
  1012d1:	89 e5                	mov    %esp,%ebp
  1012d3:	57                   	push   %edi
  1012d4:	56                   	push   %esi
  1012d5:	53                   	push   %ebx
  1012d6:	83 ec 0c             	sub    $0xc,%esp
  1012d9:	8b 7d 08             	mov    0x8(%ebp),%edi
  1012dc:	b8 10 00 00 00       	mov    $0x10,%eax
  1012e1:	89 c0                	mov    %eax,%eax
  1012e3:	8e d8                	mov    %eax,%ds
  1012e5:	8e e0                	mov    %eax,%fs
  1012e7:	8e c0                	mov    %eax,%es
  1012e9:	8e d0                	mov    %eax,%ss
  1012eb:	b8 30 00 00 00       	mov    $0x30,%eax
  1012f0:	89 c0                	mov    %eax,%eax
  1012f2:	8e e8                	mov    %eax,%gs
  1012f4:	89 ee                	mov    %ebp,%esi
  1012f6:	3b 7e 08             	cmp    0x8(%esi),%edi
  1012f9:	74 12                	je     10130d <irqHandle+0x3d>
  1012fb:	83 ec 08             	sub    $0x8,%esp
  1012fe:	6a 21                	push   $0x21
  101300:	68 21 1a 10 00       	push   $0x101a21
  101305:	e8 66 04 00 00       	call   101770 <abort>
  10130a:	83 c4 10             	add    $0x10,%esp
  10130d:	8b 1d 80 3c 10 00    	mov    0x103c80,%ebx
  101313:	fa                   	cli    
  101314:	8b 47 30             	mov    0x30(%edi),%eax
  101317:	83 f8 0d             	cmp    $0xd,%eax
  10131a:	0f 84 48 01 00 00    	je     101468 <irqHandle+0x198>
  101320:	0f 8e ea 00 00 00    	jle    101410 <irqHandle+0x140>
  101326:	83 f8 20             	cmp    $0x20,%eax
  101329:	74 2d                	je     101358 <irqHandle+0x88>
  10132b:	83 c0 80             	add    $0xffffff80,%eax
  10132e:	0f 85 e3 00 00 00    	jne    101417 <irqHandle+0x147>
  101334:	83 ec 0c             	sub    $0xc,%esp
  101337:	57                   	push   %edi
  101338:	e8 9b fe ff ff       	call   1011d8 <syscallHandle>
  10133d:	8b 47 30             	mov    0x30(%edi),%eax
  101340:	83 c4 10             	add    $0x10,%esp
  101343:	3d 80 00 00 00       	cmp    $0x80,%eax
  101348:	74 26                	je     101370 <irqHandle+0xa0>
  10134a:	83 f8 20             	cmp    $0x20,%eax
  10134d:	74 21                	je     101370 <irqHandle+0xa0>
  10134f:	fb                   	sti    
  101350:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101353:	5b                   	pop    %ebx
  101354:	5e                   	pop    %esi
  101355:	5f                   	pop    %edi
  101356:	5d                   	pop    %ebp
  101357:	c3                   	ret    
  101358:	83 ec 0c             	sub    $0xc,%esp
  10135b:	57                   	push   %edi
  10135c:	e8 23 ff ff ff       	call   101284 <timeHandle>
  101361:	8b 47 30             	mov    0x30(%edi),%eax
  101364:	83 c4 10             	add    $0x10,%esp
  101367:	3d 80 00 00 00       	cmp    $0x80,%eax
  10136c:	75 dc                	jne    10134a <irqHandle+0x7a>
  10136e:	66 90                	xchg   %ax,%ax
  101370:	8b 15 80 3c 10 00    	mov    0x103c80,%edx
  101376:	39 d3                	cmp    %edx,%ebx
  101378:	74 d5                	je     10134f <irqHandle+0x7f>
  10137a:	89 d0                	mov    %edx,%eax
  10137c:	c1 e0 07             	shl    $0x7,%eax
  10137f:	01 d0                	add    %edx,%eax
  101381:	01 c0                	add    %eax,%eax
  101383:	01 d0                	add    %edx,%eax
  101385:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101388:	8d 04 c5 50 5c 10 00 	lea    0x105c50(,%eax,8),%eax
  10138f:	89 46 08             	mov    %eax,0x8(%esi)
  101392:	8b 15 80 3c 10 00    	mov    0x103c80,%edx
  101398:	89 d1                	mov    %edx,%ecx
  10139a:	c1 e1 07             	shl    $0x7,%ecx
  10139d:	01 d1                	add    %edx,%ecx
  10139f:	01 c9                	add    %ecx,%ecx
  1013a1:	01 d1                	add    %edx,%ecx
  1013a3:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  1013a6:	8d 34 cd a0 5c 10 00 	lea    0x105ca0(,%ecx,8),%esi
  1013ad:	b9 13 00 00 00       	mov    $0x13,%ecx
  1013b2:	89 c7                	mov    %eax,%edi
  1013b4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1013b6:	85 d2                	test   %edx,%edx
  1013b8:	74 95                	je     10134f <irqHandle+0x7f>
  1013ba:	83 ec 0c             	sub    $0xc,%esp
  1013bd:	68 3c 18 10 00       	push   $0x10183c
  1013c2:	e8 35 02 00 00       	call   1015fc <printk>
  1013c7:	58                   	pop    %eax
  1013c8:	5a                   	pop    %edx
  1013c9:	ff 35 80 3c 10 00    	pushl  0x103c80
  1013cf:	53                   	push   %ebx
  1013d0:	68 a8 1a 10 00       	push   $0x101aa8
  1013d5:	6a 43                	push   $0x43
  1013d7:	68 21 1a 10 00       	push   $0x101a21
  1013dc:	68 74 1a 10 00       	push   $0x101a74
  1013e1:	e8 16 02 00 00       	call   1015fc <printk>
  1013e6:	83 c4 14             	add    $0x14,%esp
  1013e9:	68 6b 18 10 00       	push   $0x10186b
  1013ee:	e8 09 02 00 00       	call   1015fc <printk>
  1013f3:	59                   	pop    %ecx
  1013f4:	5b                   	pop    %ebx
  1013f5:	a1 80 3c 10 00       	mov    0x103c80,%eax
  1013fa:	c1 e0 10             	shl    $0x10,%eax
  1013fd:	50                   	push   %eax
  1013fe:	6a 23                	push   $0x23
  101400:	e8 2f ec ff ff       	call   100034 <change_gdt>
  101405:	83 c4 10             	add    $0x10,%esp
  101408:	e9 42 ff ff ff       	jmp    10134f <irqHandle+0x7f>
  10140d:	8d 76 00             	lea    0x0(%esi),%esi
  101410:	40                   	inc    %eax
  101411:	0f 84 38 ff ff ff    	je     10134f <irqHandle+0x7f>
  101417:	83 ec 0c             	sub    $0xc,%esp
  10141a:	68 3c 18 10 00       	push   $0x10183c
  10141f:	e8 d8 01 00 00       	call   1015fc <printk>
  101424:	58                   	pop    %eax
  101425:	5a                   	pop    %edx
  101426:	ff 77 38             	pushl  0x38(%edi)
  101429:	ff 77 30             	pushl  0x30(%edi)
  10142c:	68 a8 1a 10 00       	push   $0x101aa8
  101431:	6a 37                	push   $0x37
  101433:	68 21 1a 10 00       	push   $0x101a21
  101438:	68 4c 1a 10 00       	push   $0x101a4c
  10143d:	e8 ba 01 00 00       	call   1015fc <printk>
  101442:	83 c4 14             	add    $0x14,%esp
  101445:	68 6b 18 10 00       	push   $0x10186b
  10144a:	e8 ad 01 00 00       	call   1015fc <printk>
  10144f:	59                   	pop    %ecx
  101450:	58                   	pop    %eax
  101451:	6a 38                	push   $0x38
  101453:	68 21 1a 10 00       	push   $0x101a21
  101458:	e8 13 03 00 00       	call   101770 <abort>
  10145d:	8b 47 30             	mov    0x30(%edi),%eax
  101460:	83 c4 10             	add    $0x10,%esp
  101463:	e9 db fe ff ff       	jmp    101343 <irqHandle+0x73>
  101468:	83 ec 0c             	sub    $0xc,%esp
  10146b:	57                   	push   %edi
  10146c:	e8 c3 fd ff ff       	call   101234 <GProtectFaultHandle>
  101471:	8b 47 30             	mov    0x30(%edi),%eax
  101474:	83 c4 10             	add    $0x10,%esp
  101477:	e9 c7 fe ff ff       	jmp    101343 <irqHandle+0x73>

0010147c <initIntr>:
  10147c:	55                   	push   %ebp
  10147d:	89 e5                	mov    %esp,%ebp
  10147f:	ba 21 00 00 00       	mov    $0x21,%edx
  101484:	b0 ff                	mov    $0xff,%al
  101486:	ee                   	out    %al,(%dx)
  101487:	ba a1 00 00 00       	mov    $0xa1,%edx
  10148c:	ee                   	out    %al,(%dx)
  10148d:	ba 20 00 00 00       	mov    $0x20,%edx
  101492:	b0 11                	mov    $0x11,%al
  101494:	ee                   	out    %al,(%dx)
  101495:	ba 21 00 00 00       	mov    $0x21,%edx
  10149a:	b0 20                	mov    $0x20,%al
  10149c:	ee                   	out    %al,(%dx)
  10149d:	b0 04                	mov    $0x4,%al
  10149f:	ee                   	out    %al,(%dx)
  1014a0:	b0 03                	mov    $0x3,%al
  1014a2:	ee                   	out    %al,(%dx)
  1014a3:	ba a0 00 00 00       	mov    $0xa0,%edx
  1014a8:	b0 11                	mov    $0x11,%al
  1014aa:	ee                   	out    %al,(%dx)
  1014ab:	ba a1 00 00 00       	mov    $0xa1,%edx
  1014b0:	b0 28                	mov    $0x28,%al
  1014b2:	ee                   	out    %al,(%dx)
  1014b3:	b0 02                	mov    $0x2,%al
  1014b5:	ee                   	out    %al,(%dx)
  1014b6:	b0 03                	mov    $0x3,%al
  1014b8:	ee                   	out    %al,(%dx)
  1014b9:	ba 20 00 00 00       	mov    $0x20,%edx
  1014be:	b0 68                	mov    $0x68,%al
  1014c0:	ee                   	out    %al,(%dx)
  1014c1:	b0 0a                	mov    $0xa,%al
  1014c3:	ee                   	out    %al,(%dx)
  1014c4:	ba a0 00 00 00       	mov    $0xa0,%edx
  1014c9:	b0 68                	mov    $0x68,%al
  1014cb:	ee                   	out    %al,(%dx)
  1014cc:	b0 0a                	mov    $0xa,%al
  1014ce:	ee                   	out    %al,(%dx)
  1014cf:	5d                   	pop    %ebp
  1014d0:	c3                   	ret    
  1014d1:	8d 76 00             	lea    0x0(%esi),%esi

001014d4 <initTimer>:
  1014d4:	55                   	push   %ebp
  1014d5:	89 e5                	mov    %esp,%ebp
  1014d7:	ba 43 00 00 00       	mov    $0x43,%edx
  1014dc:	b0 34                	mov    $0x34,%al
  1014de:	ee                   	out    %al,(%dx)
  1014df:	ba 40 00 00 00       	mov    $0x40,%edx
  1014e4:	b0 9b                	mov    $0x9b,%al
  1014e6:	ee                   	out    %al,(%dx)
  1014e7:	b0 2e                	mov    $0x2e,%al
  1014e9:	ee                   	out    %al,(%dx)
  1014ea:	5d                   	pop    %ebp
  1014eb:	c3                   	ret    

001014ec <i2A>:
  1014ec:	55                   	push   %ebp
  1014ed:	89 e5                	mov    %esp,%ebp
  1014ef:	57                   	push   %edi
  1014f0:	56                   	push   %esi
  1014f1:	53                   	push   %ebx
  1014f2:	51                   	push   %ecx
  1014f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1014f6:	85 c9                	test   %ecx,%ecx
  1014f8:	78 6e                	js     101568 <i2A+0x7c>
  1014fa:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  1014fe:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  101502:	bb 5e 34 10 00       	mov    $0x10345e,%ebx
  101507:	31 ff                	xor    %edi,%edi
  101509:	eb 03                	jmp    10150e <i2A+0x22>
  10150b:	90                   	nop
  10150c:	89 f7                	mov    %esi,%edi
  10150e:	4b                   	dec    %ebx
  10150f:	89 c8                	mov    %ecx,%eax
  101511:	be 0a 00 00 00       	mov    $0xa,%esi
  101516:	99                   	cltd   
  101517:	f7 fe                	idiv   %esi
  101519:	83 c2 30             	add    $0x30,%edx
  10151c:	88 13                	mov    %dl,(%ebx)
  10151e:	8d 77 01             	lea    0x1(%edi),%esi
  101521:	b8 67 66 66 66       	mov    $0x66666667,%eax
  101526:	f7 e9                	imul   %ecx
  101528:	89 d0                	mov    %edx,%eax
  10152a:	c1 f8 02             	sar    $0x2,%eax
  10152d:	c1 f9 1f             	sar    $0x1f,%ecx
  101530:	29 c8                	sub    %ecx,%eax
  101532:	89 c1                	mov    %eax,%ecx
  101534:	75 d6                	jne    10150c <i2A+0x20>
  101536:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  10153a:	74 20                	je     10155c <i2A+0x70>
  10153c:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  101540:	75 06                	jne    101548 <i2A+0x5c>
  101542:	fe 05 5d 34 10 00    	incb   0x10345d
  101548:	c6 05 5e 34 10 00 00 	movb   $0x0,0x10345e
  10154f:	8b 45 0c             	mov    0xc(%ebp),%eax
  101552:	89 18                	mov    %ebx,(%eax)
  101554:	89 f0                	mov    %esi,%eax
  101556:	5a                   	pop    %edx
  101557:	5b                   	pop    %ebx
  101558:	5e                   	pop    %esi
  101559:	5f                   	pop    %edi
  10155a:	5d                   	pop    %ebp
  10155b:	c3                   	ret    
  10155c:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  101560:	8d 77 02             	lea    0x2(%edi),%esi
  101563:	4b                   	dec    %ebx
  101564:	eb d6                	jmp    10153c <i2A+0x50>
  101566:	66 90                	xchg   %ax,%ax
  101568:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  10156e:	74 0c                	je     10157c <i2A+0x90>
  101570:	f7 d9                	neg    %ecx
  101572:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  101576:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  10157a:	eb 86                	jmp    101502 <i2A+0x16>
  10157c:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  101581:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101585:	eb ef                	jmp    101576 <i2A+0x8a>
  101587:	90                   	nop

00101588 <i2X>:
  101588:	55                   	push   %ebp
  101589:	89 e5                	mov    %esp,%ebp
  10158b:	57                   	push   %edi
  10158c:	56                   	push   %esi
  10158d:	53                   	push   %ebx
  10158e:	8b 55 08             	mov    0x8(%ebp),%edx
  101591:	b9 3d 34 10 00       	mov    $0x10343d,%ecx
  101596:	31 c0                	xor    %eax,%eax
  101598:	40                   	inc    %eax
  101599:	89 d6                	mov    %edx,%esi
  10159b:	83 e6 0f             	and    $0xf,%esi
  10159e:	8d 5e f6             	lea    -0xa(%esi),%ebx
  1015a1:	89 cf                	mov    %ecx,%edi
  1015a3:	83 fb 05             	cmp    $0x5,%ebx
  1015a6:	77 4c                	ja     1015f4 <i2X+0x6c>
  1015a8:	ff 24 9d b4 1a 10 00 	jmp    *0x101ab4(,%ebx,4)
  1015af:	90                   	nop
  1015b0:	c6 01 65             	movb   $0x65,(%ecx)
  1015b3:	90                   	nop
  1015b4:	49                   	dec    %ecx
  1015b5:	c1 ea 04             	shr    $0x4,%edx
  1015b8:	75 de                	jne    101598 <i2X+0x10>
  1015ba:	c6 05 3e 34 10 00 00 	movb   $0x0,0x10343e
  1015c1:	8b 55 0c             	mov    0xc(%ebp),%edx
  1015c4:	89 3a                	mov    %edi,(%edx)
  1015c6:	5b                   	pop    %ebx
  1015c7:	5e                   	pop    %esi
  1015c8:	5f                   	pop    %edi
  1015c9:	5d                   	pop    %ebp
  1015ca:	c3                   	ret    
  1015cb:	90                   	nop
  1015cc:	c6 01 64             	movb   $0x64,(%ecx)
  1015cf:	eb e3                	jmp    1015b4 <i2X+0x2c>
  1015d1:	8d 76 00             	lea    0x0(%esi),%esi
  1015d4:	c6 01 63             	movb   $0x63,(%ecx)
  1015d7:	eb db                	jmp    1015b4 <i2X+0x2c>
  1015d9:	8d 76 00             	lea    0x0(%esi),%esi
  1015dc:	c6 01 62             	movb   $0x62,(%ecx)
  1015df:	eb d3                	jmp    1015b4 <i2X+0x2c>
  1015e1:	8d 76 00             	lea    0x0(%esi),%esi
  1015e4:	c6 01 61             	movb   $0x61,(%ecx)
  1015e7:	eb cb                	jmp    1015b4 <i2X+0x2c>
  1015e9:	8d 76 00             	lea    0x0(%esi),%esi
  1015ec:	c6 01 66             	movb   $0x66,(%ecx)
  1015ef:	eb c3                	jmp    1015b4 <i2X+0x2c>
  1015f1:	8d 76 00             	lea    0x0(%esi),%esi
  1015f4:	8d 5e 30             	lea    0x30(%esi),%ebx
  1015f7:	88 19                	mov    %bl,(%ecx)
  1015f9:	eb b9                	jmp    1015b4 <i2X+0x2c>
  1015fb:	90                   	nop

001015fc <printk>:
  1015fc:	55                   	push   %ebp
  1015fd:	89 e5                	mov    %esp,%ebp
  1015ff:	57                   	push   %edi
  101600:	56                   	push   %esi
  101601:	53                   	push   %ebx
  101602:	83 ec 2c             	sub    $0x2c,%esp
  101605:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101608:	8a 11                	mov    (%ecx),%dl
  10160a:	84 d2                	test   %dl,%dl
  10160c:	0f 84 54 01 00 00    	je     101766 <printk+0x16a>
  101612:	8d 45 0c             	lea    0xc(%ebp),%eax
  101615:	31 ff                	xor    %edi,%edi
  101617:	eb 18                	jmp    101631 <printk+0x35>
  101619:	8d 76 00             	lea    0x0(%esi),%esi
  10161c:	8a 11                	mov    (%ecx),%dl
  10161e:	89 cb                	mov    %ecx,%ebx
  101620:	88 97 60 34 10 00    	mov    %dl,0x103460(%edi)
  101626:	47                   	inc    %edi
  101627:	8d 4b 01             	lea    0x1(%ebx),%ecx
  10162a:	8a 53 01             	mov    0x1(%ebx),%dl
  10162d:	84 d2                	test   %dl,%dl
  10162f:	74 72                	je     1016a3 <printk+0xa7>
  101631:	80 fa 25             	cmp    $0x25,%dl
  101634:	75 e6                	jne    10161c <printk+0x20>
  101636:	8d 59 01             	lea    0x1(%ecx),%ebx
  101639:	8a 51 01             	mov    0x1(%ecx),%dl
  10163c:	80 fa 64             	cmp    $0x64,%dl
  10163f:	0f 84 bf 00 00 00    	je     101704 <printk+0x108>
  101645:	0f 8e 01 01 00 00    	jle    10174c <printk+0x150>
  10164b:	80 fa 73             	cmp    $0x73,%dl
  10164e:	0f 84 84 00 00 00    	je     1016d8 <printk+0xdc>
  101654:	80 fa 78             	cmp    $0x78,%dl
  101657:	75 c7                	jne    101620 <printk+0x24>
  101659:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  101660:	8d 70 04             	lea    0x4(%eax),%esi
  101663:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101666:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101669:	56                   	push   %esi
  10166a:	ff 30                	pushl  (%eax)
  10166c:	e8 17 ff ff ff       	call   101588 <i2X>
  101671:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  101674:	8d b7 60 34 10 00    	lea    0x103460(%edi),%esi
  10167a:	8a 11                	mov    (%ecx),%dl
  10167c:	83 c4 08             	add    $0x8,%esp
  10167f:	31 c0                	xor    %eax,%eax
  101681:	84 d2                	test   %dl,%dl
  101683:	74 0f                	je     101694 <printk+0x98>
  101685:	8d 76 00             	lea    0x0(%esi),%esi
  101688:	40                   	inc    %eax
  101689:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  10168d:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  101690:	84 d2                	test   %dl,%dl
  101692:	75 f4                	jne    101688 <printk+0x8c>
  101694:	01 c7                	add    %eax,%edi
  101696:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101699:	8d 4b 01             	lea    0x1(%ebx),%ecx
  10169c:	8a 53 01             	mov    0x1(%ebx),%dl
  10169f:	84 d2                	test   %dl,%dl
  1016a1:	75 8e                	jne    101631 <printk+0x35>
  1016a3:	c6 87 60 34 10 00 00 	movb   $0x0,0x103460(%edi)
  1016aa:	0f be 05 60 34 10 00 	movsbl 0x103460,%eax
  1016b1:	bb 60 34 10 00       	mov    $0x103460,%ebx
  1016b6:	84 c0                	test   %al,%al
  1016b8:	74 16                	je     1016d0 <printk+0xd4>
  1016ba:	66 90                	xchg   %ax,%ax
  1016bc:	83 ec 0c             	sub    $0xc,%esp
  1016bf:	50                   	push   %eax
  1016c0:	e8 a3 f1 ff ff       	call   100868 <putChar>
  1016c5:	43                   	inc    %ebx
  1016c6:	0f be 03             	movsbl (%ebx),%eax
  1016c9:	83 c4 10             	add    $0x10,%esp
  1016cc:	84 c0                	test   %al,%al
  1016ce:	75 ec                	jne    1016bc <printk+0xc0>
  1016d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1016d3:	5b                   	pop    %ebx
  1016d4:	5e                   	pop    %esi
  1016d5:	5f                   	pop    %edi
  1016d6:	5d                   	pop    %ebp
  1016d7:	c3                   	ret    
  1016d8:	8d 70 04             	lea    0x4(%eax),%esi
  1016db:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1016de:	8b 08                	mov    (%eax),%ecx
  1016e0:	8d b7 60 34 10 00    	lea    0x103460(%edi),%esi
  1016e6:	8a 11                	mov    (%ecx),%dl
  1016e8:	31 c0                	xor    %eax,%eax
  1016ea:	84 d2                	test   %dl,%dl
  1016ec:	74 a6                	je     101694 <printk+0x98>
  1016ee:	66 90                	xchg   %ax,%ax
  1016f0:	40                   	inc    %eax
  1016f1:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1016f5:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  1016f8:	84 d2                	test   %dl,%dl
  1016fa:	75 f4                	jne    1016f0 <printk+0xf4>
  1016fc:	01 c7                	add    %eax,%edi
  1016fe:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101701:	eb 96                	jmp    101699 <printk+0x9d>
  101703:	90                   	nop
  101704:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10170b:	8d 70 04             	lea    0x4(%eax),%esi
  10170e:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101711:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101714:	56                   	push   %esi
  101715:	ff 30                	pushl  (%eax)
  101717:	e8 d0 fd ff ff       	call   1014ec <i2A>
  10171c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  10171f:	8d b7 60 34 10 00    	lea    0x103460(%edi),%esi
  101725:	8a 11                	mov    (%ecx),%dl
  101727:	83 c4 08             	add    $0x8,%esp
  10172a:	31 c0                	xor    %eax,%eax
  10172c:	84 d2                	test   %dl,%dl
  10172e:	0f 84 60 ff ff ff    	je     101694 <printk+0x98>
  101734:	40                   	inc    %eax
  101735:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101739:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  10173c:	84 d2                	test   %dl,%dl
  10173e:	75 f4                	jne    101734 <printk+0x138>
  101740:	01 c7                	add    %eax,%edi
  101742:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101745:	e9 4f ff ff ff       	jmp    101699 <printk+0x9d>
  10174a:	66 90                	xchg   %ax,%ax
  10174c:	80 fa 63             	cmp    $0x63,%dl
  10174f:	0f 85 cb fe ff ff    	jne    101620 <printk+0x24>
  101755:	8b 10                	mov    (%eax),%edx
  101757:	88 97 60 34 10 00    	mov    %dl,0x103460(%edi)
  10175d:	83 c0 04             	add    $0x4,%eax
  101760:	47                   	inc    %edi
  101761:	e9 c1 fe ff ff       	jmp    101627 <printk+0x2b>
  101766:	31 ff                	xor    %edi,%edi
  101768:	e9 36 ff ff ff       	jmp    1016a3 <printk+0xa7>
  10176d:	66 90                	xchg   %ax,%ax
  10176f:	90                   	nop

00101770 <abort>:
  101770:	55                   	push   %ebp
  101771:	89 e5                	mov    %esp,%ebp
  101773:	57                   	push   %edi
  101774:	56                   	push   %esi
  101775:	53                   	push   %ebx
  101776:	83 ec 1c             	sub    $0x1c,%esp
  101779:	8b 55 08             	mov    0x8(%ebp),%edx
  10177c:	fa                   	cli    
  10177d:	8a 02                	mov    (%edx),%al
  10177f:	b9 12 33 10 00       	mov    $0x103312,%ecx
  101784:	84 c0                	test   %al,%al
  101786:	74 0b                	je     101793 <abort+0x23>
  101788:	41                   	inc    %ecx
  101789:	42                   	inc    %edx
  10178a:	88 41 ff             	mov    %al,-0x1(%ecx)
  10178d:	8a 02                	mov    (%edx),%al
  10178f:	84 c0                	test   %al,%al
  101791:	75 f5                	jne    101788 <abort+0x18>
  101793:	c6 01 3a             	movb   $0x3a,(%ecx)
  101796:	bb 7d 3c 10 00       	mov    $0x103c7d,%ebx
  10179b:	be 0a 00 00 00       	mov    $0xa,%esi
  1017a0:	bf 67 66 66 66       	mov    $0x66666667,%edi
  1017a5:	4b                   	dec    %ebx
  1017a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1017a9:	99                   	cltd   
  1017aa:	f7 fe                	idiv   %esi
  1017ac:	8d 42 30             	lea    0x30(%edx),%eax
  1017af:	88 45 e7             	mov    %al,-0x19(%ebp)
  1017b2:	88 03                	mov    %al,(%ebx)
  1017b4:	89 f8                	mov    %edi,%eax
  1017b6:	f7 6d 0c             	imull  0xc(%ebp)
  1017b9:	c1 fa 02             	sar    $0x2,%edx
  1017bc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1017bf:	c1 f8 1f             	sar    $0x1f,%eax
  1017c2:	29 c2                	sub    %eax,%edx
  1017c4:	89 55 0c             	mov    %edx,0xc(%ebp)
  1017c7:	75 dc                	jne    1017a5 <abort+0x35>
  1017c9:	41                   	inc    %ecx
  1017ca:	41                   	inc    %ecx
  1017cb:	43                   	inc    %ebx
  1017cc:	8a 45 e7             	mov    -0x19(%ebp),%al
  1017cf:	88 41 ff             	mov    %al,-0x1(%ecx)
  1017d2:	8a 03                	mov    (%ebx),%al
  1017d4:	88 45 e7             	mov    %al,-0x19(%ebp)
  1017d7:	84 c0                	test   %al,%al
  1017d9:	75 ef                	jne    1017ca <abort+0x5a>
  1017db:	c6 01 0a             	movb   $0xa,(%ecx)
  1017de:	0f be 05 00 33 10 00 	movsbl 0x103300,%eax
  1017e5:	84 c0                	test   %al,%al
  1017e7:	74 1b                	je     101804 <abort+0x94>
  1017e9:	bb 00 33 10 00       	mov    $0x103300,%ebx
  1017ee:	83 ec 0c             	sub    $0xc,%esp
  1017f1:	50                   	push   %eax
  1017f2:	e8 71 f0 ff ff       	call   100868 <putChar>
  1017f7:	43                   	inc    %ebx
  1017f8:	0f be 03             	movsbl (%ebx),%eax
  1017fb:	83 c4 10             	add    $0x10,%esp
  1017fe:	84 c0                	test   %al,%al
  101800:	75 ec                	jne    1017ee <abort+0x7e>
  101802:	66 90                	xchg   %ax,%ax
  101804:	f4                   	hlt    
  101805:	eb fd                	jmp    101804 <abort+0x94>

00101807 <irqEmpty>:
  101807:	6a 00                	push   $0x0
  101809:	6a ff                	push   $0xffffffff
  10180b:	eb 13                	jmp    101820 <asmDoIrq>

0010180d <irqGProtectFault>:
  10180d:	6a 0d                	push   $0xd
  10180f:	eb 0f                	jmp    101820 <asmDoIrq>

00101811 <irqSyscall>:
  101811:	6a 00                	push   $0x0
  101813:	68 80 00 00 00       	push   $0x80
  101818:	eb 06                	jmp    101820 <asmDoIrq>

0010181a <irqTime>:
  10181a:	6a 00                	push   $0x0
  10181c:	6a 20                	push   $0x20
  10181e:	eb 00                	jmp    101820 <asmDoIrq>

00101820 <asmDoIrq>:
  101820:	60                   	pusha  
  101821:	1e                   	push   %ds
  101822:	06                   	push   %es
  101823:	0f a0                	push   %fs
  101825:	0f a8                	push   %gs
  101827:	54                   	push   %esp
  101828:	e8 a3 fa ff ff       	call   1012d0 <irqHandle>
  10182d:	5c                   	pop    %esp
  10182e:	0f a9                	pop    %gs
  101830:	0f a1                	pop    %fs
  101832:	07                   	pop    %es
  101833:	1f                   	pop    %ds
  101834:	61                   	popa   
  101835:	83 c4 04             	add    $0x4,%esp
  101838:	83 c4 04             	add    $0x4,%esp
  10183b:	cf                   	iret   
