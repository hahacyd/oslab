
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 d5 14 00 00       	call   1014e0 <initTimer>
  10000b:	e8 f0 0f 00 00       	call   101000 <init_pcb>
  100010:	e8 2f 10 00 00       	call   101044 <init_kernel_pcb>
  100015:	e8 1a 08 00 00       	call   100834 <initSerial>
  10001a:	e8 e5 10 00 00       	call   101104 <initIdt>
  10001f:	e8 64 14 00 00       	call   101488 <initIntr>
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
  10005f:	66 c7 05 e0 7c 13 01 	movw   $0xffff,0x1137ce0
  100066:	ff ff 
  100068:	66 a3 e2 7c 13 01    	mov    %ax,0x1137ce2
  10006e:	89 c2                	mov    %eax,%edx
  100070:	c1 ea 10             	shr    $0x10,%edx
  100073:	88 15 e4 7c 13 01    	mov    %dl,0x1137ce4
  100079:	c6 05 e5 7c 13 01 f2 	movb   $0xf2,0x1137ce5
  100080:	c6 05 e6 7c 13 01 cf 	movb   $0xcf,0x1137ce6
  100087:	c1 e8 18             	shr    $0x18,%eax
  10008a:	a2 e7 7c 13 01       	mov    %al,0x1137ce7
  10008f:	66 c7 05 20 34 10 00 	movw   $0x4f,0x103420
  100096:	4f 00 
  100098:	b8 c0 7c 13 01       	mov    $0x1137cc0,%eax
  10009d:	66 a3 22 34 10 00    	mov    %ax,0x103422
  1000a3:	c1 e8 10             	shr    $0x10,%eax
  1000a6:	66 a3 24 34 10 00    	mov    %ax,0x103424
  1000ac:	b8 20 34 10 00       	mov    $0x103420,%eax
  1000b1:	0f 01 10             	lgdtl  (%eax)
  1000b4:	b8 01 00 00 00       	mov    $0x1,%eax
  1000b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000bc:	c9                   	leave  
  1000bd:	c3                   	ret    
  1000be:	66 90                	xchg   %ax,%ax
  1000c0:	66 c7 05 d8 7c 13 01 	movw   $0xffff,0x1137cd8
  1000c7:	ff ff 
  1000c9:	66 a3 da 7c 13 01    	mov    %ax,0x1137cda
  1000cf:	89 c2                	mov    %eax,%edx
  1000d1:	c1 ea 10             	shr    $0x10,%edx
  1000d4:	88 15 dc 7c 13 01    	mov    %dl,0x1137cdc
  1000da:	c6 05 dd 7c 13 01 fa 	movb   $0xfa,0x1137cdd
  1000e1:	c6 05 de 7c 13 01 cf 	movb   $0xcf,0x1137cde
  1000e8:	c1 e8 18             	shr    $0x18,%eax
  1000eb:	a2 df 7c 13 01       	mov    %al,0x1137cdf
  1000f0:	eb 9d                	jmp    10008f <change_gdt+0x5b>
  1000f2:	66 90                	xchg   %ax,%ax
  1000f4:	83 fb 01             	cmp    $0x1,%ebx
  1000f7:	75 37                	jne    100130 <change_gdt+0xfc>
  1000f9:	66 c7 05 c8 7c 13 01 	movw   $0xffff,0x1137cc8
  100100:	ff ff 
  100102:	66 a3 ca 7c 13 01    	mov    %ax,0x1137cca
  100108:	89 c2                	mov    %eax,%edx
  10010a:	c1 ea 10             	shr    $0x10,%edx
  10010d:	88 15 cc 7c 13 01    	mov    %dl,0x1137ccc
  100113:	c6 05 cd 7c 13 01 9a 	movb   $0x9a,0x1137ccd
  10011a:	c6 05 ce 7c 13 01 cf 	movb   $0xcf,0x1137cce
  100121:	c1 e8 18             	shr    $0x18,%eax
  100124:	a2 cf 7c 13 01       	mov    %al,0x1137ccf
  100129:	e9 61 ff ff ff       	jmp    10008f <change_gdt+0x5b>
  10012e:	66 90                	xchg   %ax,%ax
  100130:	83 ec 0c             	sub    $0xc,%esp
  100133:	68 48 18 10 00       	push   $0x101848
  100138:	e8 cb 14 00 00       	call   101608 <printk>
  10013d:	89 1c 24             	mov    %ebx,(%esp)
  100140:	68 88 18 10 00       	push   $0x101888
  100145:	6a 18                	push   $0x18
  100147:	68 4e 18 10 00       	push   $0x10184e
  10014c:	68 5b 18 10 00       	push   $0x10185b
  100151:	e8 b2 14 00 00       	call   101608 <printk>
  100156:	83 c4 14             	add    $0x14,%esp
  100159:	68 77 18 10 00       	push   $0x101877
  10015e:	e8 a5 14 00 00       	call   101608 <printk>
  100163:	58                   	pop    %eax
  100164:	5a                   	pop    %edx
  100165:	6a 19                	push   $0x19
  100167:	68 4e 18 10 00       	push   $0x10184e
  10016c:	e8 0b 16 00 00       	call   10177c <abort>
  100171:	83 c4 10             	add    $0x10,%esp
  100174:	e9 16 ff ff ff       	jmp    10008f <change_gdt+0x5b>
  100179:	8d 76 00             	lea    0x0(%esi),%esi
  10017c:	66 c7 05 d0 7c 13 01 	movw   $0xffff,0x1137cd0
  100183:	ff ff 
  100185:	66 a3 d2 7c 13 01    	mov    %ax,0x1137cd2
  10018b:	89 c2                	mov    %eax,%edx
  10018d:	c1 ea 10             	shr    $0x10,%edx
  100190:	88 15 d4 7c 13 01    	mov    %dl,0x1137cd4
  100196:	c6 05 d5 7c 13 01 92 	movb   $0x92,0x1137cd5
  10019d:	c6 05 d6 7c 13 01 cf 	movb   $0xcf,0x1137cd6
  1001a4:	c1 e8 18             	shr    $0x18,%eax
  1001a7:	a2 d7 7c 13 01       	mov    %al,0x1137cd7
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
  10027b:	b9 c0 7c 13 01       	mov    $0x1137cc0,%ecx
  100280:	66 c7 05 c8 7c 13 01 	movw   $0xffff,0x1137cc8
  100287:	ff ff 
  100289:	66 c7 05 ca 7c 13 01 	movw   $0x0,0x1137cca
  100290:	00 00 
  100292:	c6 05 cc 7c 13 01 00 	movb   $0x0,0x1137ccc
  100299:	c6 05 cd 7c 13 01 9a 	movb   $0x9a,0x1137ccd
  1002a0:	c6 05 ce 7c 13 01 cf 	movb   $0xcf,0x1137cce
  1002a7:	c6 05 cf 7c 13 01 00 	movb   $0x0,0x1137ccf
  1002ae:	66 c7 05 d0 7c 13 01 	movw   $0xffff,0x1137cd0
  1002b5:	ff ff 
  1002b7:	66 c7 05 d2 7c 13 01 	movw   $0x0,0x1137cd2
  1002be:	00 00 
  1002c0:	c6 05 d4 7c 13 01 00 	movb   $0x0,0x1137cd4
  1002c7:	c6 05 d5 7c 13 01 92 	movb   $0x92,0x1137cd5
  1002ce:	c6 05 d6 7c 13 01 cf 	movb   $0xcf,0x1137cd6
  1002d5:	c6 05 d7 7c 13 01 00 	movb   $0x0,0x1137cd7
  1002dc:	66 c7 05 d8 7c 13 01 	movw   $0xffff,0x1137cd8
  1002e3:	ff ff 
  1002e5:	66 c7 05 da 7c 13 01 	movw   $0x0,0x1137cda
  1002ec:	00 00 
  1002ee:	c6 05 dc 7c 13 01 00 	movb   $0x0,0x1137cdc
  1002f5:	c6 05 dd 7c 13 01 fa 	movb   $0xfa,0x1137cdd
  1002fc:	c6 05 de 7c 13 01 cf 	movb   $0xcf,0x1137cde
  100303:	c6 05 df 7c 13 01 00 	movb   $0x0,0x1137cdf
  10030a:	66 c7 05 e0 7c 13 01 	movw   $0xffff,0x1137ce0
  100311:	ff ff 
  100313:	66 c7 05 e2 7c 13 01 	movw   $0x0,0x1137ce2
  10031a:	00 00 
  10031c:	c6 05 e4 7c 13 01 00 	movb   $0x0,0x1137ce4
  100323:	c6 05 e5 7c 13 01 f2 	movb   $0xf2,0x1137ce5
  10032a:	c6 05 e6 7c 13 01 cf 	movb   $0xcf,0x1137ce6
  100331:	c6 05 e7 7c 13 01 00 	movb   $0x0,0x1137ce7
  100338:	66 c7 05 e8 7c 13 01 	movw   $0x63,0x1137ce8
  10033f:	63 00 
  100341:	b8 20 7d 13 01       	mov    $0x1137d20,%eax
  100346:	66 a3 ea 7c 13 01    	mov    %ax,0x1137cea
  10034c:	89 c2                	mov    %eax,%edx
  10034e:	c1 ea 10             	shr    $0x10,%edx
  100351:	88 15 ec 7c 13 01    	mov    %dl,0x1137cec
  100357:	c6 05 ed 7c 13 01 89 	movb   $0x89,0x1137ced
  10035e:	c6 05 ee 7c 13 01 40 	movb   $0x40,0x1137cee
  100365:	c1 e8 18             	shr    $0x18,%eax
  100368:	a2 ef 7c 13 01       	mov    %al,0x1137cef
  10036d:	a1 80 18 10 00       	mov    0x101880,%eax
  100372:	8b 15 84 18 10 00    	mov    0x101884,%edx
  100378:	a3 f0 7c 13 01       	mov    %eax,0x1137cf0
  10037d:	89 15 f4 7c 13 01    	mov    %edx,0x1137cf4
  100383:	66 c7 05 00 7d 13 01 	movw   $0xffff,0x1137d00
  10038a:	ff ff 
  10038c:	66 c7 05 02 7d 13 01 	movw   $0x0,0x1137d02
  100393:	00 00 
  100395:	c6 05 04 7d 13 01 00 	movb   $0x0,0x1137d04
  10039c:	c6 05 05 7d 13 01 f2 	movb   $0xf2,0x1137d05
  1003a3:	c6 05 06 7d 13 01 cf 	movb   $0xcf,0x1137d06
  1003aa:	c6 05 07 7d 13 01 00 	movb   $0x0,0x1137d07
  1003b1:	66 c7 05 20 34 10 00 	movw   $0x4f,0x103420
  1003b8:	4f 00 
  1003ba:	66 89 0d 22 34 10 00 	mov    %cx,0x103422
  1003c1:	c1 e9 10             	shr    $0x10,%ecx
  1003c4:	66 89 0d 24 34 10 00 	mov    %cx,0x103424
  1003cb:	b8 20 34 10 00       	mov    $0x103420,%eax
  1003d0:	0f 01 10             	lgdtl  (%eax)
  1003d3:	a1 08 5d 10 00       	mov    0x105d08,%eax
  1003d8:	a3 28 7d 13 01       	mov    %eax,0x1137d28
  1003dd:	c7 05 24 7d 13 01 bc 	movl   $0x105cbc,0x1137d24
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
  100431:	8d 04 c5 c0 3c 10 00 	lea    0x103cc0(,%eax,8),%eax
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
  10045e:	c7 05 a4 3c 10 00 01 	movl   $0x1,0x103ca4
  100465:	00 00 00 
  100468:	c7 05 70 7d 10 00 23 	movl   $0x23,0x107d70
  10046f:	00 00 00 
  100472:	c7 05 64 7d 10 00 1b 	movl   $0x1b,0x107d64
  100479:	00 00 00 
  10047c:	c7 05 34 7d 10 00 43 	movl   $0x43,0x107d34
  100483:	00 00 00 
  100486:	c7 05 30 7d 10 00 43 	movl   $0x43,0x107d30
  10048d:	00 00 00 
  100490:	c7 05 2c 7d 10 00 43 	movl   $0x43,0x107d2c
  100497:	00 00 00 
  10049a:	c7 05 6c 7d 10 00 00 	movl   $0x400000,0x107d6c
  1004a1:	00 40 00 
  1004a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1004a7:	a3 60 7d 10 00       	mov    %eax,0x107d60
  1004ac:	c7 05 78 7d 10 00 0a 	movl   $0xa,0x107d78
  1004b3:	00 00 00 
  1004b6:	6a 00                	push   $0x0
  1004b8:	6a 01                	push   $0x1
  1004ba:	e8 a5 05 00 00       	call   100a64 <put_into_runnable>
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
  10058a:	68 93 18 10 00       	push   $0x101893
  10058f:	e8 74 10 00 00       	call   101608 <printk>
  100594:	e8 0b 04 00 00       	call   1009a4 <get_from_runnable>
  100599:	5a                   	pop    %edx
  10059a:	59                   	pop    %ecx
  10059b:	ff 75 08             	pushl  0x8(%ebp)
  10059e:	50                   	push   %eax
  10059f:	e8 98 03 00 00       	call   10093c <put_into_running>
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
  1005b4:	e8 bb 03 00 00       	call   100974 <getpid>
  1005b9:	83 ec 08             	sub    $0x8,%esp
  1005bc:	53                   	push   %ebx
  1005bd:	50                   	push   %eax
  1005be:	e8 d1 05 00 00       	call   100b94 <put_into_block>
  1005c3:	c7 04 24 48 18 10 00 	movl   $0x101848,(%esp)
  1005ca:	e8 39 10 00 00       	call   101608 <printk>
  1005cf:	e8 a0 03 00 00       	call   100974 <getpid>
  1005d4:	89 c2                	mov    %eax,%edx
  1005d6:	c1 e2 07             	shl    $0x7,%edx
  1005d9:	01 c2                	add    %eax,%edx
  1005db:	01 d2                	add    %edx,%edx
  1005dd:	01 c2                	add    %eax,%edx
  1005df:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1005e2:	8b 34 c5 14 5d 10 00 	mov    0x105d14(,%eax,8),%esi
  1005e9:	e8 86 03 00 00       	call   100974 <getpid>
  1005ee:	5a                   	pop    %edx
  1005ef:	59                   	pop    %ecx
  1005f0:	56                   	push   %esi
  1005f1:	50                   	push   %eax
  1005f2:	68 e4 18 10 00       	push   $0x1018e4
  1005f7:	6a 09                	push   $0x9
  1005f9:	68 a1 18 10 00       	push   $0x1018a1
  1005fe:	68 c0 18 10 00       	push   $0x1018c0
  100603:	e8 00 10 00 00       	call   101608 <printk>
  100608:	83 c4 14             	add    $0x14,%esp
  10060b:	68 77 18 10 00       	push   $0x101877
  100610:	e8 f3 0f 00 00       	call   101608 <printk>
  100615:	e8 8a 03 00 00       	call   1009a4 <get_from_runnable>
  10061a:	5e                   	pop    %esi
  10061b:	5a                   	pop    %edx
  10061c:	53                   	push   %ebx
  10061d:	50                   	push   %eax
  10061e:	e8 19 03 00 00       	call   10093c <put_into_running>
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
  10063c:	68 ee 18 10 00       	push   $0x1018ee
  100641:	e8 c2 0f 00 00       	call   101608 <printk>
  100646:	83 c4 10             	add    $0x10,%esp
  100649:	31 db                	xor    %ebx,%ebx
  10064b:	90                   	nop
  10064c:	e8 23 03 00 00       	call   100974 <getpid>
  100651:	89 c2                	mov    %eax,%edx
  100653:	c1 e2 07             	shl    $0x7,%edx
  100656:	01 c2                	add    %eax,%edx
  100658:	01 d2                	add    %edx,%edx
  10065a:	01 c2                	add    %eax,%edx
  10065c:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10065f:	01 c0                	add    %eax,%eax
  100661:	01 d8                	add    %ebx,%eax
  100663:	8b 04 85 c0 3c 10 00 	mov    0x103cc0(,%eax,4),%eax
  10066a:	89 04 9d 90 7d 10 00 	mov    %eax,0x107d90(,%ebx,4)
  100671:	43                   	inc    %ebx
  100672:	81 fb 00 08 00 00    	cmp    $0x800,%ebx
  100678:	75 d2                	jne    10064c <sys_fork+0x1c>
  10067a:	e8 f5 02 00 00       	call   100974 <getpid>
  10067f:	8d 50 40             	lea    0x40(%eax),%edx
  100682:	c1 e2 10             	shl    $0x10,%edx
  100685:	b8 00 00 01 00       	mov    $0x10000,%eax
  10068a:	66 90                	xchg   %ax,%ax
  10068c:	8a 8c 10 00 00 ff ff 	mov    -0x10000(%eax,%edx,1),%cl
  100693:	88 88 00 00 41 00    	mov    %cl,0x410000(%eax)
  100699:	48                   	dec    %eax
  10069a:	75 f0                	jne    10068c <sys_fork+0x5c>
  10069c:	b8 90 9d 10 00       	mov    $0x109d90,%eax
  1006a1:	b9 13 00 00 00       	mov    $0x13,%ecx
  1006a6:	89 c7                	mov    %eax,%edi
  1006a8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1006aa:	c7 05 bc 9d 10 00 00 	movl   $0x0,0x109dbc
  1006b1:	00 00 00 
  1006b4:	83 ec 08             	sub    $0x8,%esp
  1006b7:	50                   	push   %eax
  1006b8:	6a 02                	push   $0x2
  1006ba:	e8 a5 03 00 00       	call   100a64 <put_into_runnable>
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
  1006d9:	8b 15 28 34 10 00    	mov    0x103428,%edx
  1006df:	8b 0d 2c 34 10 00    	mov    0x10342c,%ecx
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
  100707:	c7 05 28 34 10 00 00 	movl   $0x0,0x103428
  10070e:	00 00 00 
  100711:	41                   	inc    %ecx
  100712:	89 0d 2c 34 10 00    	mov    %ecx,0x10342c
  100718:	b8 01 00 00 00       	mov    $0x1,%eax
  10071d:	5b                   	pop    %ebx
  10071e:	5f                   	pop    %edi
  10071f:	5d                   	pop    %ebp
  100720:	c3                   	ret    
  100721:	8d 76 00             	lea    0x0(%esi),%esi
  100724:	89 15 28 34 10 00    	mov    %edx,0x103428
  10072a:	b8 01 00 00 00       	mov    $0x1,%eax
  10072f:	5b                   	pop    %ebx
  100730:	5f                   	pop    %edi
  100731:	5d                   	pop    %ebp
  100732:	c3                   	ret    
  100733:	90                   	nop
  100734:	c7 05 28 34 10 00 00 	movl   $0x0,0x103428
  10073b:	00 00 00 
  10073e:	ff 05 2c 34 10 00    	incl   0x10342c
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
  100777:	e8 f8 00 00 00       	call   100874 <putChar>
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
  1007bb:	68 0a 19 10 00       	push   $0x10190a
  1007c0:	e8 b7 0f 00 00       	call   10177c <abort>
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
  1007df:	56                   	push   %esi
  1007e0:	53                   	push   %ebx
  1007e1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1007e4:	8b 73 24             	mov    0x24(%ebx),%esi
  1007e7:	e8 88 01 00 00       	call   100974 <getpid>
  1007ec:	52                   	push   %edx
  1007ed:	56                   	push   %esi
  1007ee:	c1 e0 10             	shl    $0x10,%eax
  1007f1:	03 43 28             	add    0x28(%ebx),%eax
  1007f4:	50                   	push   %eax
  1007f5:	ff 73 20             	pushl  0x20(%ebx)
  1007f8:	e8 9f ff ff ff       	call   10079c <fs_write>
  1007fd:	89 43 2c             	mov    %eax,0x2c(%ebx)
  100800:	83 c4 10             	add    $0x10,%esp
  100803:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100806:	5b                   	pop    %ebx
  100807:	5e                   	pop    %esi
  100808:	5d                   	pop    %ebp
  100809:	c3                   	ret    
  10080a:	66 90                	xchg   %ax,%ax

0010080c <print_char>:
  10080c:	55                   	push   %ebp
  10080d:	89 e5                	mov    %esp,%ebp
  10080f:	57                   	push   %edi
  100810:	8b 45 08             	mov    0x8(%ebp),%eax
  100813:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100816:	c1 e0 04             	shl    $0x4,%eax
  100819:	03 45 0c             	add    0xc(%ebp),%eax
  10081c:	01 c0                	add    %eax,%eax
  10081e:	89 c7                	mov    %eax,%edi
  100820:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  100824:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  10082a:	66 89 d0             	mov    %dx,%ax
  10082d:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100831:	5f                   	pop    %edi
  100832:	5d                   	pop    %ebp
  100833:	c3                   	ret    

00100834 <initSerial>:
  100834:	55                   	push   %ebp
  100835:	89 e5                	mov    %esp,%ebp
  100837:	ba f9 03 00 00       	mov    $0x3f9,%edx
  10083c:	31 c0                	xor    %eax,%eax
  10083e:	ee                   	out    %al,(%dx)
  10083f:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100844:	b0 80                	mov    $0x80,%al
  100846:	ee                   	out    %al,(%dx)
  100847:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10084c:	b0 01                	mov    $0x1,%al
  10084e:	ee                   	out    %al,(%dx)
  10084f:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100854:	31 c0                	xor    %eax,%eax
  100856:	ee                   	out    %al,(%dx)
  100857:	ba fb 03 00 00       	mov    $0x3fb,%edx
  10085c:	b0 03                	mov    $0x3,%al
  10085e:	ee                   	out    %al,(%dx)
  10085f:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100864:	b0 c7                	mov    $0xc7,%al
  100866:	ee                   	out    %al,(%dx)
  100867:	ba fc 03 00 00       	mov    $0x3fc,%edx
  10086c:	b0 0b                	mov    $0xb,%al
  10086e:	ee                   	out    %al,(%dx)
  10086f:	5d                   	pop    %ebp
  100870:	c3                   	ret    
  100871:	8d 76 00             	lea    0x0(%esi),%esi

00100874 <putChar>:
  100874:	55                   	push   %ebp
  100875:	89 e5                	mov    %esp,%ebp
  100877:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10087a:	ba fd 03 00 00       	mov    $0x3fd,%edx
  10087f:	90                   	nop
  100880:	ec                   	in     (%dx),%al
  100881:	a8 20                	test   $0x20,%al
  100883:	74 fb                	je     100880 <putChar+0xc>
  100885:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10088a:	88 c8                	mov    %cl,%al
  10088c:	ee                   	out    %al,(%dx)
  10088d:	5d                   	pop    %ebp
  10088e:	c3                   	ret    
  10088f:	90                   	nop

00100890 <IDLE>:
  100890:	55                   	push   %ebp
  100891:	89 e5                	mov    %esp,%ebp
  100893:	90                   	nop
  100894:	f4                   	hlt    
  100895:	eb fd                	jmp    100894 <IDLE+0x4>
  100897:	90                   	nop

00100898 <put_into_running.part.0>:
  100898:	55                   	push   %ebp
  100899:	89 e5                	mov    %esp,%ebp
  10089b:	53                   	push   %ebx
  10089c:	83 ec 7c             	sub    $0x7c,%esp
  10089f:	89 c3                	mov    %eax,%ebx
  1008a1:	a3 a0 3c 10 00       	mov    %eax,0x103ca0
  1008a6:	c1 e0 07             	shl    $0x7,%eax
  1008a9:	01 d8                	add    %ebx,%eax
  1008ab:	01 c0                	add    %eax,%eax
  1008ad:	01 d8                	add    %ebx,%eax
  1008af:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1008b2:	8d 04 c5 bc 5c 10 00 	lea    0x105cbc(,%eax,8),%eax
  1008b9:	50                   	push   %eax
  1008ba:	6a 10                	push   $0x10
  1008bc:	e8 f3 f8 ff ff       	call   1001b4 <change_tss>
  1008c1:	8d 45 94             	lea    -0x6c(%ebp),%eax
  1008c4:	89 04 24             	mov    %eax,(%esp)
  1008c7:	e8 04 f9 ff ff       	call   1001d0 <get_tss>
  1008cc:	8b 15 a0 3c 10 00    	mov    0x103ca0,%edx
  1008d2:	89 d0                	mov    %edx,%eax
  1008d4:	c1 e0 07             	shl    $0x7,%eax
  1008d7:	01 d0                	add    %edx,%eax
  1008d9:	01 c0                	add    %eax,%eax
  1008db:	01 d0                	add    %edx,%eax
  1008dd:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1008e0:	8d 04 c5 bc 5c 10 00 	lea    0x105cbc(,%eax,8),%eax
  1008e7:	83 c4 0c             	add    $0xc,%esp
  1008ea:	39 45 98             	cmp    %eax,-0x68(%ebp)
  1008ed:	74 12                	je     100901 <put_into_running.part.0+0x69>
  1008ef:	83 ec 08             	sub    $0x8,%esp
  1008f2:	6a 10                	push   $0x10
  1008f4:	68 26 19 10 00       	push   $0x101926
  1008f9:	e8 7e 0e 00 00       	call   10177c <abort>
  1008fe:	83 c4 10             	add    $0x10,%esp
  100901:	83 ec 0c             	sub    $0xc,%esp
  100904:	68 48 18 10 00       	push   $0x101848
  100909:	e8 fa 0c 00 00       	call   101608 <printk>
  10090e:	89 1c 24             	mov    %ebx,(%esp)
  100911:	68 1c 1a 10 00       	push   $0x101a1c
  100916:	6a 12                	push   $0x12
  100918:	68 26 19 10 00       	push   $0x101926
  10091d:	68 34 19 10 00       	push   $0x101934
  100922:	e8 e1 0c 00 00       	call   101608 <printk>
  100927:	83 c4 14             	add    $0x14,%esp
  10092a:	68 77 18 10 00       	push   $0x101877
  10092f:	e8 d4 0c 00 00       	call   101608 <printk>
  100934:	83 c4 10             	add    $0x10,%esp
  100937:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10093a:	c9                   	leave  
  10093b:	c3                   	ret    

0010093c <put_into_running>:
  10093c:	55                   	push   %ebp
  10093d:	89 e5                	mov    %esp,%ebp
  10093f:	83 ec 08             	sub    $0x8,%esp
  100942:	8b 45 08             	mov    0x8(%ebp),%eax
  100945:	39 05 a0 3c 10 00    	cmp    %eax,0x103ca0
  10094b:	74 05                	je     100952 <put_into_running+0x16>
  10094d:	e8 46 ff ff ff       	call   100898 <put_into_running.part.0>
  100952:	b8 01 00 00 00       	mov    $0x1,%eax
  100957:	c9                   	leave  
  100958:	c3                   	ret    
  100959:	8d 76 00             	lea    0x0(%esi),%esi

0010095c <update_block>:
  10095c:	55                   	push   %ebp
  10095d:	89 e5                	mov    %esp,%ebp
  10095f:	b8 01 00 00 00       	mov    $0x1,%eax
  100964:	5d                   	pop    %ebp
  100965:	c3                   	ret    
  100966:	66 90                	xchg   %ax,%ax

00100968 <apply_new_pid>:
  100968:	55                   	push   %ebp
  100969:	89 e5                	mov    %esp,%ebp
  10096b:	b8 02 00 00 00       	mov    $0x2,%eax
  100970:	5d                   	pop    %ebp
  100971:	c3                   	ret    
  100972:	66 90                	xchg   %ax,%ax

00100974 <getpid>:
  100974:	55                   	push   %ebp
  100975:	89 e5                	mov    %esp,%ebp
  100977:	a1 a0 3c 10 00       	mov    0x103ca0,%eax
  10097c:	5d                   	pop    %ebp
  10097d:	c3                   	ret    
  10097e:	66 90                	xchg   %ax,%ax

00100980 <getrunnable>:
  100980:	55                   	push   %ebp
  100981:	89 e5                	mov    %esp,%ebp
  100983:	a1 04 33 10 00       	mov    0x103304,%eax
  100988:	5d                   	pop    %ebp
  100989:	c3                   	ret    
  10098a:	66 90                	xchg   %ax,%ax

0010098c <getblocked>:
  10098c:	55                   	push   %ebp
  10098d:	89 e5                	mov    %esp,%ebp
  10098f:	a1 00 33 10 00       	mov    0x103300,%eax
  100994:	5d                   	pop    %ebp
  100995:	c3                   	ret    
  100996:	66 90                	xchg   %ax,%ax

00100998 <transfer_pid_mode>:
  100998:	55                   	push   %ebp
  100999:	89 e5                	mov    %esp,%ebp
  10099b:	b8 01 00 00 00       	mov    $0x1,%eax
  1009a0:	5d                   	pop    %ebp
  1009a1:	c3                   	ret    
  1009a2:	66 90                	xchg   %ax,%ax

001009a4 <get_from_runnable>:
  1009a4:	55                   	push   %ebp
  1009a5:	89 e5                	mov    %esp,%ebp
  1009a7:	53                   	push   %ebx
  1009a8:	51                   	push   %ecx
  1009a9:	8b 1d 04 33 10 00    	mov    0x103304,%ebx
  1009af:	83 fb ff             	cmp    $0xffffffff,%ebx
  1009b2:	0f 84 a4 00 00 00    	je     100a5c <get_from_runnable+0xb8>
  1009b8:	89 d8                	mov    %ebx,%eax
  1009ba:	c1 e0 07             	shl    $0x7,%eax
  1009bd:	01 d8                	add    %ebx,%eax
  1009bf:	01 c0                	add    %eax,%eax
  1009c1:	01 d8                	add    %ebx,%eax
  1009c3:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1009c6:	8d 04 c5 c0 3c 10 00 	lea    0x103cc0(,%eax,8),%eax
  1009cd:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  1009d3:	39 da                	cmp    %ebx,%edx
  1009d5:	74 79                	je     100a50 <get_from_runnable+0xac>
  1009d7:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  1009dd:	89 c8                	mov    %ecx,%eax
  1009df:	c1 e0 07             	shl    $0x7,%eax
  1009e2:	01 c8                	add    %ecx,%eax
  1009e4:	01 c0                	add    %eax,%eax
  1009e6:	01 c8                	add    %ecx,%eax
  1009e8:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  1009eb:	89 14 c5 20 5d 10 00 	mov    %edx,0x105d20(,%eax,8)
  1009f2:	89 d0                	mov    %edx,%eax
  1009f4:	c1 e0 07             	shl    $0x7,%eax
  1009f7:	01 d0                	add    %edx,%eax
  1009f9:	01 c0                	add    %eax,%eax
  1009fb:	01 d0                	add    %edx,%eax
  1009fd:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100a00:	89 0c c5 1c 5d 10 00 	mov    %ecx,0x105d1c(,%eax,8)
  100a07:	89 15 04 33 10 00    	mov    %edx,0x103304
  100a0d:	83 ec 0c             	sub    $0xc,%esp
  100a10:	68 48 18 10 00       	push   $0x101848
  100a15:	e8 ee 0b 00 00       	call   101608 <printk>
  100a1a:	58                   	pop    %eax
  100a1b:	5a                   	pop    %edx
  100a1c:	ff 35 04 33 10 00    	pushl  0x103304
  100a22:	53                   	push   %ebx
  100a23:	68 f8 19 10 00       	push   $0x1019f8
  100a28:	6a 61                	push   $0x61
  100a2a:	68 26 19 10 00       	push   $0x101926
  100a2f:	68 54 19 10 00       	push   $0x101954
  100a34:	e8 cf 0b 00 00       	call   101608 <printk>
  100a39:	83 c4 14             	add    $0x14,%esp
  100a3c:	68 77 18 10 00       	push   $0x101877
  100a41:	e8 c2 0b 00 00       	call   101608 <printk>
  100a46:	83 c4 10             	add    $0x10,%esp
  100a49:	89 d8                	mov    %ebx,%eax
  100a4b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100a4e:	c9                   	leave  
  100a4f:	c3                   	ret    
  100a50:	c7 05 04 33 10 00 ff 	movl   $0xffffffff,0x103304
  100a57:	ff ff ff 
  100a5a:	eb b1                	jmp    100a0d <get_from_runnable+0x69>
  100a5c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100a61:	eb e8                	jmp    100a4b <get_from_runnable+0xa7>
  100a63:	90                   	nop

00100a64 <put_into_runnable>:
  100a64:	55                   	push   %ebp
  100a65:	89 e5                	mov    %esp,%ebp
  100a67:	56                   	push   %esi
  100a68:	53                   	push   %ebx
  100a69:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100a6c:	8b 15 04 33 10 00    	mov    0x103304,%edx
  100a72:	83 fa ff             	cmp    $0xffffffff,%edx
  100a75:	0f 84 ed 00 00 00    	je     100b68 <put_into_runnable+0x104>
  100a7b:	89 d0                	mov    %edx,%eax
  100a7d:	c1 e0 07             	shl    $0x7,%eax
  100a80:	01 d0                	add    %edx,%eax
  100a82:	01 c0                	add    %eax,%eax
  100a84:	01 d0                	add    %edx,%eax
  100a86:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100a89:	8d 34 c5 c0 3c 10 00 	lea    0x103cc0(,%eax,8),%esi
  100a90:	8b 8e 5c 20 00 00    	mov    0x205c(%esi),%ecx
  100a96:	89 c8                	mov    %ecx,%eax
  100a98:	c1 e0 07             	shl    $0x7,%eax
  100a9b:	01 c8                	add    %ecx,%eax
  100a9d:	01 c0                	add    %eax,%eax
  100a9f:	01 c8                	add    %ecx,%eax
  100aa1:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100aa4:	89 1c c5 20 5d 10 00 	mov    %ebx,0x105d20(,%eax,8)
  100aab:	89 d8                	mov    %ebx,%eax
  100aad:	c1 e0 07             	shl    $0x7,%eax
  100ab0:	01 d8                	add    %ebx,%eax
  100ab2:	01 c0                	add    %eax,%eax
  100ab4:	01 d8                	add    %ebx,%eax
  100ab6:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100ab9:	8d 04 c5 c0 3c 10 00 	lea    0x103cc0(,%eax,8),%eax
  100ac0:	89 88 5c 20 00 00    	mov    %ecx,0x205c(%eax)
  100ac6:	89 90 60 20 00 00    	mov    %edx,0x2060(%eax)
  100acc:	89 9e 5c 20 00 00    	mov    %ebx,0x205c(%esi)
  100ad2:	89 d8                	mov    %ebx,%eax
  100ad4:	c1 e0 07             	shl    $0x7,%eax
  100ad7:	01 d8                	add    %ebx,%eax
  100ad9:	01 c0                	add    %eax,%eax
  100adb:	01 d8                	add    %ebx,%eax
  100add:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100ae0:	c7 04 c5 0c 5d 10 00 	movl   $0x1,0x105d0c(,%eax,8)
  100ae7:	01 00 00 00 
  100aeb:	85 db                	test   %ebx,%ebx
  100aed:	75 0a                	jne    100af9 <put_into_runnable+0x95>
  100aef:	c7 05 f8 5c 10 00 90 	movl   $0x100890,0x105cf8
  100af6:	08 10 00 
  100af9:	83 ec 0c             	sub    $0xc,%esp
  100afc:	68 48 18 10 00       	push   $0x101848
  100b01:	e8 02 0b 00 00       	call   101608 <printk>
  100b06:	58                   	pop    %eax
  100b07:	5a                   	pop    %edx
  100b08:	53                   	push   %ebx
  100b09:	ff 35 04 33 10 00    	pushl  0x103304
  100b0f:	68 e4 19 10 00       	push   $0x1019e4
  100b14:	6a 7d                	push   $0x7d
  100b16:	68 26 19 10 00       	push   $0x101926
  100b1b:	68 88 19 10 00       	push   $0x101988
  100b20:	e8 e3 0a 00 00       	call   101608 <printk>
  100b25:	83 c4 14             	add    $0x14,%esp
  100b28:	68 77 18 10 00       	push   $0x101877
  100b2d:	e8 d6 0a 00 00       	call   101608 <printk>
  100b32:	89 d8                	mov    %ebx,%eax
  100b34:	c1 e0 07             	shl    $0x7,%eax
  100b37:	01 d8                	add    %ebx,%eax
  100b39:	01 c0                	add    %eax,%eax
  100b3b:	01 d8                	add    %ebx,%eax
  100b3d:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b40:	8d 04 c5 c0 3c 10 00 	lea    0x103cc0(,%eax,8),%eax
  100b47:	8b 15 a8 3c 10 00    	mov    0x103ca8,%edx
  100b4d:	89 90 50 20 00 00    	mov    %edx,0x2050(%eax)
  100b53:	8b 55 0c             	mov    0xc(%ebp),%edx
  100b56:	89 90 64 20 00 00    	mov    %edx,0x2064(%eax)
  100b5c:	b8 01 00 00 00       	mov    $0x1,%eax
  100b61:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100b64:	5b                   	pop    %ebx
  100b65:	5e                   	pop    %esi
  100b66:	5d                   	pop    %ebp
  100b67:	c3                   	ret    
  100b68:	89 1d 04 33 10 00    	mov    %ebx,0x103304
  100b6e:	89 d8                	mov    %ebx,%eax
  100b70:	c1 e0 07             	shl    $0x7,%eax
  100b73:	01 d8                	add    %ebx,%eax
  100b75:	01 c0                	add    %eax,%eax
  100b77:	01 d8                	add    %ebx,%eax
  100b79:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b7c:	8d 04 c5 c0 3c 10 00 	lea    0x103cc0(,%eax,8),%eax
  100b83:	89 98 5c 20 00 00    	mov    %ebx,0x205c(%eax)
  100b89:	89 98 60 20 00 00    	mov    %ebx,0x2060(%eax)
  100b8f:	e9 3e ff ff ff       	jmp    100ad2 <put_into_runnable+0x6e>

00100b94 <put_into_block>:
  100b94:	55                   	push   %ebp
  100b95:	89 e5                	mov    %esp,%ebp
  100b97:	57                   	push   %edi
  100b98:	56                   	push   %esi
  100b99:	53                   	push   %ebx
  100b9a:	8b 45 08             	mov    0x8(%ebp),%eax
  100b9d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100ba0:	8b 0d 00 33 10 00    	mov    0x103300,%ecx
  100ba6:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100ba9:	0f 84 99 00 00 00    	je     100c48 <put_into_block+0xb4>
  100baf:	89 ca                	mov    %ecx,%edx
  100bb1:	c1 e2 07             	shl    $0x7,%edx
  100bb4:	01 ca                	add    %ecx,%edx
  100bb6:	01 d2                	add    %edx,%edx
  100bb8:	01 ca                	add    %ecx,%edx
  100bba:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100bbd:	8d 3c d5 c0 3c 10 00 	lea    0x103cc0(,%edx,8),%edi
  100bc4:	8b b7 5c 20 00 00    	mov    0x205c(%edi),%esi
  100bca:	89 f2                	mov    %esi,%edx
  100bcc:	c1 e2 07             	shl    $0x7,%edx
  100bcf:	01 f2                	add    %esi,%edx
  100bd1:	01 d2                	add    %edx,%edx
  100bd3:	01 f2                	add    %esi,%edx
  100bd5:	8d 14 96             	lea    (%esi,%edx,4),%edx
  100bd8:	89 04 d5 20 5d 10 00 	mov    %eax,0x105d20(,%edx,8)
  100bdf:	89 c2                	mov    %eax,%edx
  100be1:	c1 e2 07             	shl    $0x7,%edx
  100be4:	01 c2                	add    %eax,%edx
  100be6:	01 d2                	add    %edx,%edx
  100be8:	01 c2                	add    %eax,%edx
  100bea:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100bed:	8d 14 d5 c0 3c 10 00 	lea    0x103cc0(,%edx,8),%edx
  100bf4:	89 b2 5c 20 00 00    	mov    %esi,0x205c(%edx)
  100bfa:	89 8a 60 20 00 00    	mov    %ecx,0x2060(%edx)
  100c00:	89 87 5c 20 00 00    	mov    %eax,0x205c(%edi)
  100c06:	89 c2                	mov    %eax,%edx
  100c08:	c1 e2 07             	shl    $0x7,%edx
  100c0b:	01 c2                	add    %eax,%edx
  100c0d:	01 d2                	add    %edx,%edx
  100c0f:	01 c2                	add    %eax,%edx
  100c11:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c14:	c1 e2 03             	shl    $0x3,%edx
  100c17:	8d 82 c0 5c 10 00    	lea    0x105cc0(%edx),%eax
  100c1d:	b9 13 00 00 00       	mov    $0x13,%ecx
  100c22:	89 c7                	mov    %eax,%edi
  100c24:	89 de                	mov    %ebx,%esi
  100c26:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100c28:	8b 43 20             	mov    0x20(%ebx),%eax
  100c2b:	89 82 14 5d 10 00    	mov    %eax,0x105d14(%edx)
  100c31:	c7 82 0c 5d 10 00 00 	movl   $0x0,0x105d0c(%edx)
  100c38:	00 00 00 
  100c3b:	b8 01 00 00 00       	mov    $0x1,%eax
  100c40:	5b                   	pop    %ebx
  100c41:	5e                   	pop    %esi
  100c42:	5f                   	pop    %edi
  100c43:	5d                   	pop    %ebp
  100c44:	c3                   	ret    
  100c45:	8d 76 00             	lea    0x0(%esi),%esi
  100c48:	a3 00 33 10 00       	mov    %eax,0x103300
  100c4d:	89 c2                	mov    %eax,%edx
  100c4f:	c1 e2 07             	shl    $0x7,%edx
  100c52:	01 c2                	add    %eax,%edx
  100c54:	01 d2                	add    %edx,%edx
  100c56:	01 c2                	add    %eax,%edx
  100c58:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c5b:	8d 14 d5 c0 3c 10 00 	lea    0x103cc0(,%edx,8),%edx
  100c62:	89 82 60 20 00 00    	mov    %eax,0x2060(%edx)
  100c68:	89 82 5c 20 00 00    	mov    %eax,0x205c(%edx)
  100c6e:	eb 96                	jmp    100c06 <put_into_block+0x72>

00100c70 <get_from>:
  100c70:	55                   	push   %ebp
  100c71:	89 e5                	mov    %esp,%ebp
  100c73:	56                   	push   %esi
  100c74:	53                   	push   %ebx
  100c75:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100c78:	8b 45 0c             	mov    0xc(%ebp),%eax
  100c7b:	85 db                	test   %ebx,%ebx
  100c7d:	0f 8e 01 01 00 00    	jle    100d84 <get_from+0x114>
  100c83:	39 c3                	cmp    %eax,%ebx
  100c85:	74 42                	je     100cc9 <get_from+0x59>
  100c87:	89 da                	mov    %ebx,%edx
  100c89:	c1 e2 07             	shl    $0x7,%edx
  100c8c:	01 da                	add    %ebx,%edx
  100c8e:	01 d2                	add    %edx,%edx
  100c90:	01 da                	add    %ebx,%edx
  100c92:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100c95:	8b 0c d5 20 5d 10 00 	mov    0x105d20(,%edx,8),%ecx
  100c9c:	39 cb                	cmp    %ecx,%ebx
  100c9e:	75 25                	jne    100cc5 <get_from+0x55>
  100ca0:	e9 df 00 00 00       	jmp    100d84 <get_from+0x114>
  100ca5:	8d 76 00             	lea    0x0(%esi),%esi
  100ca8:	89 ca                	mov    %ecx,%edx
  100caa:	c1 e2 07             	shl    $0x7,%edx
  100cad:	01 ca                	add    %ecx,%edx
  100caf:	01 d2                	add    %edx,%edx
  100cb1:	01 ca                	add    %ecx,%edx
  100cb3:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100cb6:	8b 0c d5 20 5d 10 00 	mov    0x105d20(,%edx,8),%ecx
  100cbd:	39 cb                	cmp    %ecx,%ebx
  100cbf:	0f 84 bf 00 00 00    	je     100d84 <get_from+0x114>
  100cc5:	39 c1                	cmp    %eax,%ecx
  100cc7:	75 df                	jne    100ca8 <get_from+0x38>
  100cc9:	89 c2                	mov    %eax,%edx
  100ccb:	c1 e2 07             	shl    $0x7,%edx
  100cce:	01 c2                	add    %eax,%edx
  100cd0:	01 d2                	add    %edx,%edx
  100cd2:	01 c2                	add    %eax,%edx
  100cd4:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100cd7:	8b 04 c5 0c 5d 10 00 	mov    0x105d0c(,%eax,8),%eax
  100cde:	85 c0                	test   %eax,%eax
  100ce0:	0f 84 c2 00 00 00    	je     100da8 <get_from+0x138>
  100ce6:	48                   	dec    %eax
  100ce7:	75 7f                	jne    100d68 <get_from+0xf8>
  100ce9:	be 04 33 10 00       	mov    $0x103304,%esi
  100cee:	3b 1e                	cmp    (%esi),%ebx
  100cf0:	74 15                	je     100d07 <get_from+0x97>
  100cf2:	83 ec 08             	sub    $0x8,%esp
  100cf5:	68 bf 00 00 00       	push   $0xbf
  100cfa:	68 26 19 10 00       	push   $0x101926
  100cff:	e8 78 0a 00 00       	call   10177c <abort>
  100d04:	83 c4 10             	add    $0x10,%esp
  100d07:	89 d8                	mov    %ebx,%eax
  100d09:	c1 e0 07             	shl    $0x7,%eax
  100d0c:	01 d8                	add    %ebx,%eax
  100d0e:	01 c0                	add    %eax,%eax
  100d10:	01 d8                	add    %ebx,%eax
  100d12:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100d15:	8d 04 c5 c0 3c 10 00 	lea    0x103cc0(,%eax,8),%eax
  100d1c:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100d22:	39 da                	cmp    %ebx,%edx
  100d24:	0f 84 8a 00 00 00    	je     100db4 <get_from+0x144>
  100d2a:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100d30:	89 c8                	mov    %ecx,%eax
  100d32:	c1 e0 07             	shl    $0x7,%eax
  100d35:	01 c8                	add    %ecx,%eax
  100d37:	01 c0                	add    %eax,%eax
  100d39:	01 c8                	add    %ecx,%eax
  100d3b:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100d3e:	89 14 c5 20 5d 10 00 	mov    %edx,0x105d20(,%eax,8)
  100d45:	89 d0                	mov    %edx,%eax
  100d47:	c1 e0 07             	shl    $0x7,%eax
  100d4a:	01 d0                	add    %edx,%eax
  100d4c:	01 c0                	add    %eax,%eax
  100d4e:	01 d0                	add    %edx,%eax
  100d50:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100d53:	89 0c c5 1c 5d 10 00 	mov    %ecx,0x105d1c(,%eax,8)
  100d5a:	89 16                	mov    %edx,(%esi)
  100d5c:	89 d8                	mov    %ebx,%eax
  100d5e:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d61:	5b                   	pop    %ebx
  100d62:	5e                   	pop    %esi
  100d63:	5d                   	pop    %ebp
  100d64:	c3                   	ret    
  100d65:	8d 76 00             	lea    0x0(%esi),%esi
  100d68:	83 ec 08             	sub    $0x8,%esp
  100d6b:	68 bb 00 00 00       	push   $0xbb
  100d70:	68 26 19 10 00       	push   $0x101926
  100d75:	e8 02 0a 00 00       	call   10177c <abort>
  100d7a:	a1 00 00 00 00       	mov    0x0,%eax
  100d7f:	0f 0b                	ud2    
  100d81:	8d 76 00             	lea    0x0(%esi),%esi
  100d84:	83 ec 08             	sub    $0x8,%esp
  100d87:	68 ac 00 00 00       	push   $0xac
  100d8c:	68 26 19 10 00       	push   $0x101926
  100d91:	e8 e6 09 00 00       	call   10177c <abort>
  100d96:	83 c4 10             	add    $0x10,%esp
  100d99:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100d9e:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100da1:	5b                   	pop    %ebx
  100da2:	5e                   	pop    %esi
  100da3:	5d                   	pop    %ebp
  100da4:	c3                   	ret    
  100da5:	8d 76 00             	lea    0x0(%esi),%esi
  100da8:	be 00 33 10 00       	mov    $0x103300,%esi
  100dad:	e9 3c ff ff ff       	jmp    100cee <get_from+0x7e>
  100db2:	66 90                	xchg   %ax,%ax
  100db4:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100dba:	89 d8                	mov    %ebx,%eax
  100dbc:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100dbf:	5b                   	pop    %ebx
  100dc0:	5e                   	pop    %esi
  100dc1:	5d                   	pop    %ebp
  100dc2:	c3                   	ret    
  100dc3:	90                   	nop

00100dc4 <get_from_block>:
  100dc4:	55                   	push   %ebp
  100dc5:	89 e5                	mov    %esp,%ebp
  100dc7:	83 ec 10             	sub    $0x10,%esp
  100dca:	ff 75 08             	pushl  0x8(%ebp)
  100dcd:	ff 35 00 33 10 00    	pushl  0x103300
  100dd3:	e8 98 fe ff ff       	call   100c70 <get_from>
  100dd8:	83 c4 10             	add    $0x10,%esp
  100ddb:	40                   	inc    %eax
  100ddc:	74 0a                	je     100de8 <get_from_block+0x24>
  100dde:	b8 01 00 00 00       	mov    $0x1,%eax
  100de3:	c9                   	leave  
  100de4:	c3                   	ret    
  100de5:	8d 76 00             	lea    0x0(%esi),%esi
  100de8:	83 ec 08             	sub    $0x8,%esp
  100deb:	68 f6 00 00 00       	push   $0xf6
  100df0:	68 26 19 10 00       	push   $0x101926
  100df5:	e8 82 09 00 00       	call   10177c <abort>
  100dfa:	83 c4 10             	add    $0x10,%esp
  100dfd:	b8 01 00 00 00       	mov    $0x1,%eax
  100e02:	c9                   	leave  
  100e03:	c3                   	ret    

00100e04 <check_block>:
  100e04:	55                   	push   %ebp
  100e05:	89 e5                	mov    %esp,%ebp
  100e07:	57                   	push   %edi
  100e08:	56                   	push   %esi
  100e09:	53                   	push   %ebx
  100e0a:	83 ec 0c             	sub    $0xc,%esp
  100e0d:	a1 00 33 10 00       	mov    0x103300,%eax
  100e12:	89 c6                	mov    %eax,%esi
  100e14:	83 f8 ff             	cmp    $0xffffffff,%eax
  100e17:	74 58                	je     100e71 <check_block+0x6d>
  100e19:	89 c2                	mov    %eax,%edx
  100e1b:	c1 e2 07             	shl    $0x7,%edx
  100e1e:	01 c2                	add    %eax,%edx
  100e20:	01 d2                	add    %edx,%edx
  100e22:	01 c2                	add    %eax,%edx
  100e24:	8d 3c 90             	lea    (%eax,%edx,4),%edi
  100e27:	eb 0c                	jmp    100e35 <check_block+0x31>
  100e29:	8d 76 00             	lea    0x0(%esi),%esi
  100e2c:	39 c6                	cmp    %eax,%esi
  100e2e:	74 3c                	je     100e6c <check_block+0x68>
  100e30:	83 f8 ff             	cmp    $0xffffffff,%eax
  100e33:	74 37                	je     100e6c <check_block+0x68>
  100e35:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
  100e3c:	8b 8b 14 5d 10 00    	mov    0x105d14(%ebx),%ecx
  100e42:	85 c9                	test   %ecx,%ecx
  100e44:	7f e6                	jg     100e2c <check_block+0x28>
  100e46:	83 ec 0c             	sub    $0xc,%esp
  100e49:	56                   	push   %esi
  100e4a:	e8 75 ff ff ff       	call   100dc4 <get_from_block>
  100e4f:	58                   	pop    %eax
  100e50:	5a                   	pop    %edx
  100e51:	81 c3 c0 5c 10 00    	add    $0x105cc0,%ebx
  100e57:	53                   	push   %ebx
  100e58:	56                   	push   %esi
  100e59:	e8 06 fc ff ff       	call   100a64 <put_into_runnable>
  100e5e:	83 c4 10             	add    $0x10,%esp
  100e61:	a1 00 33 10 00       	mov    0x103300,%eax
  100e66:	39 c6                	cmp    %eax,%esi
  100e68:	75 c6                	jne    100e30 <check_block+0x2c>
  100e6a:	66 90                	xchg   %ax,%ax
  100e6c:	be 01 00 00 00       	mov    $0x1,%esi
  100e71:	89 f0                	mov    %esi,%eax
  100e73:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100e76:	5b                   	pop    %ebx
  100e77:	5e                   	pop    %esi
  100e78:	5f                   	pop    %edi
  100e79:	5d                   	pop    %ebp
  100e7a:	c3                   	ret    
  100e7b:	90                   	nop

00100e7c <checkTimeCount>:
  100e7c:	a1 a4 3c 10 00       	mov    0x103ca4,%eax
  100e81:	85 c0                	test   %eax,%eax
  100e83:	0f 84 cb 00 00 00    	je     100f54 <checkTimeCount+0xd8>
  100e89:	55                   	push   %ebp
  100e8a:	89 e5                	mov    %esp,%ebp
  100e8c:	57                   	push   %edi
  100e8d:	56                   	push   %esi
  100e8e:	83 ec 0c             	sub    $0xc,%esp
  100e91:	68 48 18 10 00       	push   $0x101848
  100e96:	e8 6d 07 00 00       	call   101608 <printk>
  100e9b:	8b 15 a0 3c 10 00    	mov    0x103ca0,%edx
  100ea1:	58                   	pop    %eax
  100ea2:	59                   	pop    %ecx
  100ea3:	89 d0                	mov    %edx,%eax
  100ea5:	c1 e0 07             	shl    $0x7,%eax
  100ea8:	01 d0                	add    %edx,%eax
  100eaa:	01 c0                	add    %eax,%eax
  100eac:	01 d0                	add    %edx,%eax
  100eae:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100eb1:	ff 34 c5 10 5d 10 00 	pushl  0x105d10(,%eax,8)
  100eb8:	52                   	push   %edx
  100eb9:	68 0c 1a 10 00       	push   $0x101a0c
  100ebe:	6a 1f                	push   $0x1f
  100ec0:	68 26 19 10 00       	push   $0x101926
  100ec5:	68 b8 19 10 00       	push   $0x1019b8
  100eca:	e8 39 07 00 00       	call   101608 <printk>
  100ecf:	83 c4 14             	add    $0x14,%esp
  100ed2:	68 77 18 10 00       	push   $0x101877
  100ed7:	e8 2c 07 00 00       	call   101608 <printk>
  100edc:	e8 23 ff ff ff       	call   100e04 <check_block>
  100ee1:	8b 15 a0 3c 10 00    	mov    0x103ca0,%edx
  100ee7:	89 d0                	mov    %edx,%eax
  100ee9:	c1 e0 07             	shl    $0x7,%eax
  100eec:	01 d0                	add    %edx,%eax
  100eee:	01 c0                	add    %eax,%eax
  100ef0:	01 d0                	add    %edx,%eax
  100ef2:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100ef5:	c1 e0 03             	shl    $0x3,%eax
  100ef8:	83 c4 10             	add    $0x10,%esp
  100efb:	8b b0 10 5d 10 00    	mov    0x105d10(%eax),%esi
  100f01:	85 f6                	test   %esi,%esi
  100f03:	7e 0f                	jle    100f14 <checkTimeCount+0x98>
  100f05:	b8 01 00 00 00       	mov    $0x1,%eax
  100f0a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100f0d:	5e                   	pop    %esi
  100f0e:	5f                   	pop    %edi
  100f0f:	5d                   	pop    %ebp
  100f10:	c3                   	ret    
  100f11:	8d 76 00             	lea    0x0(%esi),%esi
  100f14:	05 c0 5c 10 00       	add    $0x105cc0,%eax
  100f19:	b9 13 00 00 00       	mov    $0x13,%ecx
  100f1e:	89 c7                	mov    %eax,%edi
  100f20:	8b 75 08             	mov    0x8(%ebp),%esi
  100f23:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100f25:	83 ec 08             	sub    $0x8,%esp
  100f28:	ff 75 08             	pushl  0x8(%ebp)
  100f2b:	52                   	push   %edx
  100f2c:	e8 33 fb ff ff       	call   100a64 <put_into_runnable>
  100f31:	e8 6e fa ff ff       	call   1009a4 <get_from_runnable>
  100f36:	83 c4 10             	add    $0x10,%esp
  100f39:	3b 05 a0 3c 10 00    	cmp    0x103ca0,%eax
  100f3f:	74 c4                	je     100f05 <checkTimeCount+0x89>
  100f41:	e8 52 f9 ff ff       	call   100898 <put_into_running.part.0>
  100f46:	b8 01 00 00 00       	mov    $0x1,%eax
  100f4b:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100f4e:	5e                   	pop    %esi
  100f4f:	5f                   	pop    %edi
  100f50:	5d                   	pop    %ebp
  100f51:	c3                   	ret    
  100f52:	66 90                	xchg   %ax,%ax
  100f54:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100f59:	c3                   	ret    
  100f5a:	66 90                	xchg   %ax,%ax

00100f5c <check_is_in>:
  100f5c:	55                   	push   %ebp
  100f5d:	89 e5                	mov    %esp,%ebp
  100f5f:	53                   	push   %ebx
  100f60:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100f63:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100f66:	85 c9                	test   %ecx,%ecx
  100f68:	7e 4a                	jle    100fb4 <check_is_in+0x58>
  100f6a:	39 d9                	cmp    %ebx,%ecx
  100f6c:	74 3b                	je     100fa9 <check_is_in+0x4d>
  100f6e:	89 c8                	mov    %ecx,%eax
  100f70:	c1 e0 07             	shl    $0x7,%eax
  100f73:	01 c8                	add    %ecx,%eax
  100f75:	01 c0                	add    %eax,%eax
  100f77:	01 c8                	add    %ecx,%eax
  100f79:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100f7c:	8b 14 c5 20 5d 10 00 	mov    0x105d20(,%eax,8),%edx
  100f83:	39 d1                	cmp    %edx,%ecx
  100f85:	75 1e                	jne    100fa5 <check_is_in+0x49>
  100f87:	eb 2b                	jmp    100fb4 <check_is_in+0x58>
  100f89:	8d 76 00             	lea    0x0(%esi),%esi
  100f8c:	89 d0                	mov    %edx,%eax
  100f8e:	c1 e0 07             	shl    $0x7,%eax
  100f91:	01 d0                	add    %edx,%eax
  100f93:	01 c0                	add    %eax,%eax
  100f95:	01 d0                	add    %edx,%eax
  100f97:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100f9a:	8b 14 c5 20 5d 10 00 	mov    0x105d20(,%eax,8),%edx
  100fa1:	39 d1                	cmp    %edx,%ecx
  100fa3:	74 0f                	je     100fb4 <check_is_in+0x58>
  100fa5:	39 d3                	cmp    %edx,%ebx
  100fa7:	75 e3                	jne    100f8c <check_is_in+0x30>
  100fa9:	b8 01 00 00 00       	mov    $0x1,%eax
  100fae:	5b                   	pop    %ebx
  100faf:	5d                   	pop    %ebp
  100fb0:	c3                   	ret    
  100fb1:	8d 76 00             	lea    0x0(%esi),%esi
  100fb4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100fb9:	5b                   	pop    %ebx
  100fba:	5d                   	pop    %ebp
  100fbb:	c3                   	ret    

00100fbc <block_decrease>:
  100fbc:	55                   	push   %ebp
  100fbd:	89 e5                	mov    %esp,%ebp
  100fbf:	8b 0d 00 33 10 00    	mov    0x103300,%ecx
  100fc5:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100fc8:	74 2e                	je     100ff8 <block_decrease+0x3c>
  100fca:	89 ca                	mov    %ecx,%edx
  100fcc:	89 d0                	mov    %edx,%eax
  100fce:	c1 e0 07             	shl    $0x7,%eax
  100fd1:	01 d0                	add    %edx,%eax
  100fd3:	01 c0                	add    %eax,%eax
  100fd5:	01 d0                	add    %edx,%eax
  100fd7:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100fda:	8d 04 c5 c0 3c 10 00 	lea    0x103cc0(,%eax,8),%eax
  100fe1:	ff 88 54 20 00 00    	decl   0x2054(%eax)
  100fe7:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100fed:	39 d1                	cmp    %edx,%ecx
  100fef:	75 db                	jne    100fcc <block_decrease+0x10>
  100ff1:	b8 01 00 00 00       	mov    $0x1,%eax
  100ff6:	5d                   	pop    %ebp
  100ff7:	c3                   	ret    
  100ff8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100ffd:	5d                   	pop    %ebp
  100ffe:	c3                   	ret    
  100fff:	90                   	nop

00101000 <init_pcb>:
  101000:	55                   	push   %ebp
  101001:	89 e5                	mov    %esp,%ebp
  101003:	c7 05 a8 3c 10 00 05 	movl   $0x5,0x103ca8
  10100a:	00 00 00 
  10100d:	ba 18 5d 10 00       	mov    $0x105d18,%edx
  101012:	31 c0                	xor    %eax,%eax
  101014:	89 02                	mov    %eax,(%edx)
  101016:	8d 48 ff             	lea    -0x1(%eax),%ecx
  101019:	89 4a 04             	mov    %ecx,0x4(%edx)
  10101c:	40                   	inc    %eax
  10101d:	89 42 08             	mov    %eax,0x8(%edx)
  101020:	81 c2 68 20 00 00    	add    $0x2068,%edx
  101026:	3d 00 08 00 00       	cmp    $0x800,%eax
  10102b:	75 e7                	jne    101014 <init_pcb+0x14>
  10102d:	c7 05 1c 5d 10 00 ff 	movl   $0x7ff,0x105d1c
  101034:	07 00 00 
  101037:	c7 05 b8 7c 13 01 00 	movl   $0x0,0x1137cb8
  10103e:	00 00 00 
  101041:	5d                   	pop    %ebp
  101042:	c3                   	ret    
  101043:	90                   	nop

00101044 <init_kernel_pcb>:
  101044:	55                   	push   %ebp
  101045:	89 e5                	mov    %esp,%ebp
  101047:	c7 05 08 5d 10 00 10 	movl   $0x10,0x105d08
  10104e:	00 00 00 
  101051:	c7 05 fc 5c 10 00 08 	movl   $0x8,0x105cfc
  101058:	00 00 00 
  10105b:	c7 05 cc 5c 10 00 10 	movl   $0x10,0x105ccc
  101062:	00 00 00 
  101065:	c7 05 c8 5c 10 00 10 	movl   $0x10,0x105cc8
  10106c:	00 00 00 
  10106f:	c7 05 f8 5c 10 00 90 	movl   $0x100890,0x105cf8
  101076:	08 10 00 
  101079:	c7 05 04 5d 10 00 00 	movl   $0x400000,0x105d04
  101080:	00 40 00 
  101083:	c7 05 0c 5d 10 00 01 	movl   $0x1,0x105d0c
  10108a:	00 00 00 
  10108d:	c7 05 10 5d 10 00 04 	movl   $0x4,0x105d10
  101094:	00 00 00 
  101097:	b8 01 00 00 00       	mov    $0x1,%eax
  10109c:	5d                   	pop    %ebp
  10109d:	c3                   	ret    
  10109e:	66 90                	xchg   %ax,%ax

001010a0 <transfer_pid_state>:
  1010a0:	55                   	push   %ebp
  1010a1:	89 e5                	mov    %esp,%ebp
  1010a3:	b8 01 00 00 00       	mov    $0x1,%eax
  1010a8:	5d                   	pop    %ebp
  1010a9:	c3                   	ret    
  1010aa:	66 90                	xchg   %ax,%ax

001010ac <make_pcb>:
  1010ac:	55                   	push   %ebp
  1010ad:	89 e5                	mov    %esp,%ebp
  1010af:	57                   	push   %edi
  1010b0:	56                   	push   %esi
  1010b1:	8b 55 08             	mov    0x8(%ebp),%edx
  1010b4:	89 d0                	mov    %edx,%eax
  1010b6:	c1 e0 07             	shl    $0x7,%eax
  1010b9:	01 d0                	add    %edx,%eax
  1010bb:	01 c0                	add    %eax,%eax
  1010bd:	01 d0                	add    %edx,%eax
  1010bf:	8d 14 82             	lea    (%edx,%eax,4),%edx
  1010c2:	c1 e2 03             	shl    $0x3,%edx
  1010c5:	8d 82 c0 5c 10 00    	lea    0x105cc0(%edx),%eax
  1010cb:	b9 13 00 00 00       	mov    $0x13,%ecx
  1010d0:	89 c7                	mov    %eax,%edi
  1010d2:	8b 75 0c             	mov    0xc(%ebp),%esi
  1010d5:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1010d7:	8b 45 10             	mov    0x10(%ebp),%eax
  1010da:	89 82 0c 5d 10 00    	mov    %eax,0x105d0c(%edx)
  1010e0:	8b 45 14             	mov    0x14(%ebp),%eax
  1010e3:	89 82 10 5d 10 00    	mov    %eax,0x105d10(%edx)
  1010e9:	8b 45 18             	mov    0x18(%ebp),%eax
  1010ec:	89 82 14 5d 10 00    	mov    %eax,0x105d14(%edx)
  1010f2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1010f5:	89 82 24 5d 10 00    	mov    %eax,0x105d24(%edx)
  1010fb:	b8 01 00 00 00       	mov    $0x1,%eax
  101100:	5e                   	pop    %esi
  101101:	5f                   	pop    %edi
  101102:	5d                   	pop    %ebp
  101103:	c3                   	ret    

00101104 <initIdt>:
  101104:	55                   	push   %ebp
  101105:	89 e5                	mov    %esp,%ebp
  101107:	53                   	push   %ebx
  101108:	ba 13 18 10 00       	mov    $0x101813,%edx
  10110d:	89 d3                	mov    %edx,%ebx
  10110f:	c1 ea 10             	shr    $0x10,%edx
  101112:	b9 a0 85 13 01       	mov    $0x11385a0,%ecx
  101117:	b8 a0 7d 13 01       	mov    $0x1137da0,%eax
  10111c:	66 89 18             	mov    %bx,(%eax)
  10111f:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  101125:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  101129:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  10112d:	66 89 50 06          	mov    %dx,0x6(%eax)
  101131:	83 c0 08             	add    $0x8,%eax
  101134:	39 c1                	cmp    %eax,%ecx
  101136:	75 e4                	jne    10111c <initIdt+0x18>
  101138:	b8 19 18 10 00       	mov    $0x101819,%eax
  10113d:	66 a3 08 7e 13 01    	mov    %ax,0x1137e08
  101143:	66 c7 05 0a 7e 13 01 	movw   $0x8,0x1137e0a
  10114a:	08 00 
  10114c:	c6 05 0c 7e 13 01 00 	movb   $0x0,0x1137e0c
  101153:	c6 05 0d 7e 13 01 8f 	movb   $0x8f,0x1137e0d
  10115a:	c1 e8 10             	shr    $0x10,%eax
  10115d:	66 a3 0e 7e 13 01    	mov    %ax,0x1137e0e
  101163:	b8 1d 18 10 00       	mov    $0x10181d,%eax
  101168:	66 a3 a0 81 13 01    	mov    %ax,0x11381a0
  10116e:	66 c7 05 a2 81 13 01 	movw   $0x8,0x11381a2
  101175:	08 00 
  101177:	c6 05 a4 81 13 01 00 	movb   $0x0,0x11381a4
  10117e:	c6 05 a5 81 13 01 ee 	movb   $0xee,0x11381a5
  101185:	c1 e8 10             	shr    $0x10,%eax
  101188:	66 a3 a6 81 13 01    	mov    %ax,0x11381a6
  10118e:	b8 26 18 10 00       	mov    $0x101826,%eax
  101193:	66 a3 a0 7e 13 01    	mov    %ax,0x1137ea0
  101199:	66 c7 05 a2 7e 13 01 	movw   $0x8,0x1137ea2
  1011a0:	08 00 
  1011a2:	c6 05 a4 7e 13 01 00 	movb   $0x0,0x1137ea4
  1011a9:	c6 05 a5 7e 13 01 8e 	movb   $0x8e,0x1137ea5
  1011b0:	c1 e8 10             	shr    $0x10,%eax
  1011b3:	66 a3 a6 7e 13 01    	mov    %ax,0x1137ea6
  1011b9:	66 c7 05 30 34 10 00 	movw   $0x7ff,0x103430
  1011c0:	ff 07 
  1011c2:	b8 a0 7d 13 01       	mov    $0x1137da0,%eax
  1011c7:	66 a3 32 34 10 00    	mov    %ax,0x103432
  1011cd:	c1 e8 10             	shr    $0x10,%eax
  1011d0:	66 a3 34 34 10 00    	mov    %ax,0x103434
  1011d6:	b8 30 34 10 00       	mov    $0x103430,%eax
  1011db:	0f 01 18             	lidtl  (%eax)
  1011de:	5b                   	pop    %ebx
  1011df:	5d                   	pop    %ebp
  1011e0:	c3                   	ret    
  1011e1:	66 90                	xchg   %ax,%ax
  1011e3:	90                   	nop

001011e4 <syscallHandle>:
  1011e4:	55                   	push   %ebp
  1011e5:	89 e5                	mov    %esp,%ebp
  1011e7:	53                   	push   %ebx
  1011e8:	50                   	push   %eax
  1011e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1011ec:	8b 43 2c             	mov    0x2c(%ebx),%eax
  1011ef:	83 f8 02             	cmp    $0x2,%eax
  1011f2:	74 28                	je     10121c <syscallHandle+0x38>
  1011f4:	76 3a                	jbe    101230 <syscallHandle+0x4c>
  1011f6:	83 f8 04             	cmp    $0x4,%eax
  1011f9:	74 15                	je     101210 <syscallHandle+0x2c>
  1011fb:	3d e6 00 00 00       	cmp    $0xe6,%eax
  101200:	75 29                	jne    10122b <syscallHandle+0x47>
  101202:	89 5d 08             	mov    %ebx,0x8(%ebp)
  101205:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101208:	c9                   	leave  
  101209:	e9 9e f3 ff ff       	jmp    1005ac <sys_sleep>
  10120e:	66 90                	xchg   %ax,%ax
  101210:	89 5d 08             	mov    %ebx,0x8(%ebp)
  101213:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101216:	c9                   	leave  
  101217:	e9 c0 f5 ff ff       	jmp    1007dc <sys_write>
  10121c:	83 ec 0c             	sub    $0xc,%esp
  10121f:	53                   	push   %ebx
  101220:	e8 0b f4 ff ff       	call   100630 <sys_fork>
  101225:	89 43 2c             	mov    %eax,0x2c(%ebx)
  101228:	83 c4 10             	add    $0x10,%esp
  10122b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10122e:	c9                   	leave  
  10122f:	c3                   	ret    
  101230:	48                   	dec    %eax
  101231:	75 f8                	jne    10122b <syscallHandle+0x47>
  101233:	89 5d 08             	mov    %ebx,0x8(%ebp)
  101236:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101239:	c9                   	leave  
  10123a:	e9 45 f3 ff ff       	jmp    100584 <sys_exit>
  10123f:	90                   	nop

00101240 <GProtectFaultHandle>:
  101240:	55                   	push   %ebp
  101241:	89 e5                	mov    %esp,%ebp
  101243:	83 ec 14             	sub    $0x14,%esp
  101246:	68 48 18 10 00       	push   $0x101848
  10124b:	e8 b8 03 00 00       	call   101608 <printk>
  101250:	58                   	pop    %eax
  101251:	8b 45 08             	mov    0x8(%ebp),%eax
  101254:	ff 70 30             	pushl  0x30(%eax)
  101257:	68 a0 1a 10 00       	push   $0x101aa0
  10125c:	6a 6a                	push   $0x6a
  10125e:	68 2d 1a 10 00       	push   $0x101a2d
  101263:	68 40 1a 10 00       	push   $0x101a40
  101268:	e8 9b 03 00 00       	call   101608 <printk>
  10126d:	83 c4 14             	add    $0x14,%esp
  101270:	68 77 18 10 00       	push   $0x101877
  101275:	e8 8e 03 00 00       	call   101608 <printk>
  10127a:	5a                   	pop    %edx
  10127b:	59                   	pop    %ecx
  10127c:	6a 6b                	push   $0x6b
  10127e:	68 2d 1a 10 00       	push   $0x101a2d
  101283:	e8 f4 04 00 00       	call   10177c <abort>
  101288:	83 c4 10             	add    $0x10,%esp
  10128b:	c9                   	leave  
  10128c:	c3                   	ret    
  10128d:	8d 76 00             	lea    0x0(%esi),%esi

00101290 <timeHandle>:
  101290:	55                   	push   %ebp
  101291:	89 e5                	mov    %esp,%ebp
  101293:	53                   	push   %ebx
  101294:	83 ec 10             	sub    $0x10,%esp
  101297:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10129a:	6a 41                	push   $0x41
  10129c:	e8 d3 f5 ff ff       	call   100874 <putChar>
  1012a1:	e8 ce f6 ff ff       	call   100974 <getpid>
  1012a6:	89 c2                	mov    %eax,%edx
  1012a8:	c1 e2 07             	shl    $0x7,%edx
  1012ab:	01 c2                	add    %eax,%edx
  1012ad:	01 d2                	add    %edx,%edx
  1012af:	01 c2                	add    %eax,%edx
  1012b1:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1012b4:	ff 0c c5 10 5d 10 00 	decl   0x105d10(,%eax,8)
  1012bb:	e8 fc fc ff ff       	call   100fbc <block_decrease>
  1012c0:	89 1c 24             	mov    %ebx,(%esp)
  1012c3:	e8 b4 fb ff ff       	call   100e7c <checkTimeCount>
  1012c8:	83 c4 10             	add    $0x10,%esp
  1012cb:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  1012d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012d5:	c9                   	leave  
  1012d6:	e9 99 f5 ff ff       	jmp    100874 <putChar>
  1012db:	90                   	nop

001012dc <irqHandle>:
  1012dc:	55                   	push   %ebp
  1012dd:	89 e5                	mov    %esp,%ebp
  1012df:	57                   	push   %edi
  1012e0:	56                   	push   %esi
  1012e1:	53                   	push   %ebx
  1012e2:	83 ec 0c             	sub    $0xc,%esp
  1012e5:	8b 7d 08             	mov    0x8(%ebp),%edi
  1012e8:	b8 10 00 00 00       	mov    $0x10,%eax
  1012ed:	89 c0                	mov    %eax,%eax
  1012ef:	8e d8                	mov    %eax,%ds
  1012f1:	8e e0                	mov    %eax,%fs
  1012f3:	8e c0                	mov    %eax,%es
  1012f5:	8e d0                	mov    %eax,%ss
  1012f7:	b8 30 00 00 00       	mov    $0x30,%eax
  1012fc:	89 c0                	mov    %eax,%eax
  1012fe:	8e e8                	mov    %eax,%gs
  101300:	89 ee                	mov    %ebp,%esi
  101302:	3b 7e 08             	cmp    0x8(%esi),%edi
  101305:	74 12                	je     101319 <irqHandle+0x3d>
  101307:	83 ec 08             	sub    $0x8,%esp
  10130a:	6a 21                	push   $0x21
  10130c:	68 2d 1a 10 00       	push   $0x101a2d
  101311:	e8 66 04 00 00       	call   10177c <abort>
  101316:	83 c4 10             	add    $0x10,%esp
  101319:	8b 1d a0 3c 10 00    	mov    0x103ca0,%ebx
  10131f:	fa                   	cli    
  101320:	8b 47 30             	mov    0x30(%edi),%eax
  101323:	83 f8 0d             	cmp    $0xd,%eax
  101326:	0f 84 48 01 00 00    	je     101474 <irqHandle+0x198>
  10132c:	0f 8e ea 00 00 00    	jle    10141c <irqHandle+0x140>
  101332:	83 f8 20             	cmp    $0x20,%eax
  101335:	74 2d                	je     101364 <irqHandle+0x88>
  101337:	83 c0 80             	add    $0xffffff80,%eax
  10133a:	0f 85 e3 00 00 00    	jne    101423 <irqHandle+0x147>
  101340:	83 ec 0c             	sub    $0xc,%esp
  101343:	57                   	push   %edi
  101344:	e8 9b fe ff ff       	call   1011e4 <syscallHandle>
  101349:	8b 47 30             	mov    0x30(%edi),%eax
  10134c:	83 c4 10             	add    $0x10,%esp
  10134f:	3d 80 00 00 00       	cmp    $0x80,%eax
  101354:	74 26                	je     10137c <irqHandle+0xa0>
  101356:	83 f8 20             	cmp    $0x20,%eax
  101359:	74 21                	je     10137c <irqHandle+0xa0>
  10135b:	fb                   	sti    
  10135c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10135f:	5b                   	pop    %ebx
  101360:	5e                   	pop    %esi
  101361:	5f                   	pop    %edi
  101362:	5d                   	pop    %ebp
  101363:	c3                   	ret    
  101364:	83 ec 0c             	sub    $0xc,%esp
  101367:	57                   	push   %edi
  101368:	e8 23 ff ff ff       	call   101290 <timeHandle>
  10136d:	8b 47 30             	mov    0x30(%edi),%eax
  101370:	83 c4 10             	add    $0x10,%esp
  101373:	3d 80 00 00 00       	cmp    $0x80,%eax
  101378:	75 dc                	jne    101356 <irqHandle+0x7a>
  10137a:	66 90                	xchg   %ax,%ax
  10137c:	8b 15 a0 3c 10 00    	mov    0x103ca0,%edx
  101382:	39 d3                	cmp    %edx,%ebx
  101384:	74 d5                	je     10135b <irqHandle+0x7f>
  101386:	89 d0                	mov    %edx,%eax
  101388:	c1 e0 07             	shl    $0x7,%eax
  10138b:	01 d0                	add    %edx,%eax
  10138d:	01 c0                	add    %eax,%eax
  10138f:	01 d0                	add    %edx,%eax
  101391:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101394:	8d 04 c5 70 5c 10 00 	lea    0x105c70(,%eax,8),%eax
  10139b:	89 46 08             	mov    %eax,0x8(%esi)
  10139e:	8b 15 a0 3c 10 00    	mov    0x103ca0,%edx
  1013a4:	89 d1                	mov    %edx,%ecx
  1013a6:	c1 e1 07             	shl    $0x7,%ecx
  1013a9:	01 d1                	add    %edx,%ecx
  1013ab:	01 c9                	add    %ecx,%ecx
  1013ad:	01 d1                	add    %edx,%ecx
  1013af:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  1013b2:	8d 34 cd c0 5c 10 00 	lea    0x105cc0(,%ecx,8),%esi
  1013b9:	b9 13 00 00 00       	mov    $0x13,%ecx
  1013be:	89 c7                	mov    %eax,%edi
  1013c0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1013c2:	85 d2                	test   %edx,%edx
  1013c4:	74 95                	je     10135b <irqHandle+0x7f>
  1013c6:	83 ec 0c             	sub    $0xc,%esp
  1013c9:	68 48 18 10 00       	push   $0x101848
  1013ce:	e8 35 02 00 00       	call   101608 <printk>
  1013d3:	58                   	pop    %eax
  1013d4:	5a                   	pop    %edx
  1013d5:	ff 35 a0 3c 10 00    	pushl  0x103ca0
  1013db:	53                   	push   %ebx
  1013dc:	68 b4 1a 10 00       	push   $0x101ab4
  1013e1:	6a 43                	push   $0x43
  1013e3:	68 2d 1a 10 00       	push   $0x101a2d
  1013e8:	68 80 1a 10 00       	push   $0x101a80
  1013ed:	e8 16 02 00 00       	call   101608 <printk>
  1013f2:	83 c4 14             	add    $0x14,%esp
  1013f5:	68 77 18 10 00       	push   $0x101877
  1013fa:	e8 09 02 00 00       	call   101608 <printk>
  1013ff:	59                   	pop    %ecx
  101400:	5b                   	pop    %ebx
  101401:	a1 a0 3c 10 00       	mov    0x103ca0,%eax
  101406:	c1 e0 10             	shl    $0x10,%eax
  101409:	50                   	push   %eax
  10140a:	6a 23                	push   $0x23
  10140c:	e8 23 ec ff ff       	call   100034 <change_gdt>
  101411:	83 c4 10             	add    $0x10,%esp
  101414:	e9 42 ff ff ff       	jmp    10135b <irqHandle+0x7f>
  101419:	8d 76 00             	lea    0x0(%esi),%esi
  10141c:	40                   	inc    %eax
  10141d:	0f 84 38 ff ff ff    	je     10135b <irqHandle+0x7f>
  101423:	83 ec 0c             	sub    $0xc,%esp
  101426:	68 48 18 10 00       	push   $0x101848
  10142b:	e8 d8 01 00 00       	call   101608 <printk>
  101430:	58                   	pop    %eax
  101431:	5a                   	pop    %edx
  101432:	ff 77 38             	pushl  0x38(%edi)
  101435:	ff 77 30             	pushl  0x30(%edi)
  101438:	68 b4 1a 10 00       	push   $0x101ab4
  10143d:	6a 37                	push   $0x37
  10143f:	68 2d 1a 10 00       	push   $0x101a2d
  101444:	68 58 1a 10 00       	push   $0x101a58
  101449:	e8 ba 01 00 00       	call   101608 <printk>
  10144e:	83 c4 14             	add    $0x14,%esp
  101451:	68 77 18 10 00       	push   $0x101877
  101456:	e8 ad 01 00 00       	call   101608 <printk>
  10145b:	59                   	pop    %ecx
  10145c:	58                   	pop    %eax
  10145d:	6a 38                	push   $0x38
  10145f:	68 2d 1a 10 00       	push   $0x101a2d
  101464:	e8 13 03 00 00       	call   10177c <abort>
  101469:	8b 47 30             	mov    0x30(%edi),%eax
  10146c:	83 c4 10             	add    $0x10,%esp
  10146f:	e9 db fe ff ff       	jmp    10134f <irqHandle+0x73>
  101474:	83 ec 0c             	sub    $0xc,%esp
  101477:	57                   	push   %edi
  101478:	e8 c3 fd ff ff       	call   101240 <GProtectFaultHandle>
  10147d:	8b 47 30             	mov    0x30(%edi),%eax
  101480:	83 c4 10             	add    $0x10,%esp
  101483:	e9 c7 fe ff ff       	jmp    10134f <irqHandle+0x73>

00101488 <initIntr>:
  101488:	55                   	push   %ebp
  101489:	89 e5                	mov    %esp,%ebp
  10148b:	ba 21 00 00 00       	mov    $0x21,%edx
  101490:	b0 ff                	mov    $0xff,%al
  101492:	ee                   	out    %al,(%dx)
  101493:	ba a1 00 00 00       	mov    $0xa1,%edx
  101498:	ee                   	out    %al,(%dx)
  101499:	ba 20 00 00 00       	mov    $0x20,%edx
  10149e:	b0 11                	mov    $0x11,%al
  1014a0:	ee                   	out    %al,(%dx)
  1014a1:	ba 21 00 00 00       	mov    $0x21,%edx
  1014a6:	b0 20                	mov    $0x20,%al
  1014a8:	ee                   	out    %al,(%dx)
  1014a9:	b0 04                	mov    $0x4,%al
  1014ab:	ee                   	out    %al,(%dx)
  1014ac:	b0 03                	mov    $0x3,%al
  1014ae:	ee                   	out    %al,(%dx)
  1014af:	ba a0 00 00 00       	mov    $0xa0,%edx
  1014b4:	b0 11                	mov    $0x11,%al
  1014b6:	ee                   	out    %al,(%dx)
  1014b7:	ba a1 00 00 00       	mov    $0xa1,%edx
  1014bc:	b0 28                	mov    $0x28,%al
  1014be:	ee                   	out    %al,(%dx)
  1014bf:	b0 02                	mov    $0x2,%al
  1014c1:	ee                   	out    %al,(%dx)
  1014c2:	b0 03                	mov    $0x3,%al
  1014c4:	ee                   	out    %al,(%dx)
  1014c5:	ba 20 00 00 00       	mov    $0x20,%edx
  1014ca:	b0 68                	mov    $0x68,%al
  1014cc:	ee                   	out    %al,(%dx)
  1014cd:	b0 0a                	mov    $0xa,%al
  1014cf:	ee                   	out    %al,(%dx)
  1014d0:	ba a0 00 00 00       	mov    $0xa0,%edx
  1014d5:	b0 68                	mov    $0x68,%al
  1014d7:	ee                   	out    %al,(%dx)
  1014d8:	b0 0a                	mov    $0xa,%al
  1014da:	ee                   	out    %al,(%dx)
  1014db:	5d                   	pop    %ebp
  1014dc:	c3                   	ret    
  1014dd:	8d 76 00             	lea    0x0(%esi),%esi

001014e0 <initTimer>:
  1014e0:	55                   	push   %ebp
  1014e1:	89 e5                	mov    %esp,%ebp
  1014e3:	ba 43 00 00 00       	mov    $0x43,%edx
  1014e8:	b0 34                	mov    $0x34,%al
  1014ea:	ee                   	out    %al,(%dx)
  1014eb:	ba 40 00 00 00       	mov    $0x40,%edx
  1014f0:	b0 9b                	mov    $0x9b,%al
  1014f2:	ee                   	out    %al,(%dx)
  1014f3:	b0 2e                	mov    $0x2e,%al
  1014f5:	ee                   	out    %al,(%dx)
  1014f6:	5d                   	pop    %ebp
  1014f7:	c3                   	ret    

001014f8 <i2A>:
  1014f8:	55                   	push   %ebp
  1014f9:	89 e5                	mov    %esp,%ebp
  1014fb:	57                   	push   %edi
  1014fc:	56                   	push   %esi
  1014fd:	53                   	push   %ebx
  1014fe:	51                   	push   %ecx
  1014ff:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101502:	85 c9                	test   %ecx,%ecx
  101504:	78 6e                	js     101574 <i2A+0x7c>
  101506:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  10150a:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  10150e:	bb 7e 34 10 00       	mov    $0x10347e,%ebx
  101513:	31 ff                	xor    %edi,%edi
  101515:	eb 03                	jmp    10151a <i2A+0x22>
  101517:	90                   	nop
  101518:	89 f7                	mov    %esi,%edi
  10151a:	4b                   	dec    %ebx
  10151b:	89 c8                	mov    %ecx,%eax
  10151d:	be 0a 00 00 00       	mov    $0xa,%esi
  101522:	99                   	cltd   
  101523:	f7 fe                	idiv   %esi
  101525:	83 c2 30             	add    $0x30,%edx
  101528:	88 13                	mov    %dl,(%ebx)
  10152a:	8d 77 01             	lea    0x1(%edi),%esi
  10152d:	b8 67 66 66 66       	mov    $0x66666667,%eax
  101532:	f7 e9                	imul   %ecx
  101534:	89 d0                	mov    %edx,%eax
  101536:	c1 f8 02             	sar    $0x2,%eax
  101539:	c1 f9 1f             	sar    $0x1f,%ecx
  10153c:	29 c8                	sub    %ecx,%eax
  10153e:	89 c1                	mov    %eax,%ecx
  101540:	75 d6                	jne    101518 <i2A+0x20>
  101542:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  101546:	74 20                	je     101568 <i2A+0x70>
  101548:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  10154c:	75 06                	jne    101554 <i2A+0x5c>
  10154e:	fe 05 7d 34 10 00    	incb   0x10347d
  101554:	c6 05 7e 34 10 00 00 	movb   $0x0,0x10347e
  10155b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10155e:	89 18                	mov    %ebx,(%eax)
  101560:	89 f0                	mov    %esi,%eax
  101562:	5a                   	pop    %edx
  101563:	5b                   	pop    %ebx
  101564:	5e                   	pop    %esi
  101565:	5f                   	pop    %edi
  101566:	5d                   	pop    %ebp
  101567:	c3                   	ret    
  101568:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  10156c:	8d 77 02             	lea    0x2(%edi),%esi
  10156f:	4b                   	dec    %ebx
  101570:	eb d6                	jmp    101548 <i2A+0x50>
  101572:	66 90                	xchg   %ax,%ax
  101574:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  10157a:	74 0c                	je     101588 <i2A+0x90>
  10157c:	f7 d9                	neg    %ecx
  10157e:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  101582:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  101586:	eb 86                	jmp    10150e <i2A+0x16>
  101588:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  10158d:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101591:	eb ef                	jmp    101582 <i2A+0x8a>
  101593:	90                   	nop

00101594 <i2X>:
  101594:	55                   	push   %ebp
  101595:	89 e5                	mov    %esp,%ebp
  101597:	57                   	push   %edi
  101598:	56                   	push   %esi
  101599:	53                   	push   %ebx
  10159a:	8b 55 08             	mov    0x8(%ebp),%edx
  10159d:	b9 5d 34 10 00       	mov    $0x10345d,%ecx
  1015a2:	31 c0                	xor    %eax,%eax
  1015a4:	40                   	inc    %eax
  1015a5:	89 d6                	mov    %edx,%esi
  1015a7:	83 e6 0f             	and    $0xf,%esi
  1015aa:	8d 5e f6             	lea    -0xa(%esi),%ebx
  1015ad:	89 cf                	mov    %ecx,%edi
  1015af:	83 fb 05             	cmp    $0x5,%ebx
  1015b2:	77 4c                	ja     101600 <i2X+0x6c>
  1015b4:	ff 24 9d c0 1a 10 00 	jmp    *0x101ac0(,%ebx,4)
  1015bb:	90                   	nop
  1015bc:	c6 01 65             	movb   $0x65,(%ecx)
  1015bf:	90                   	nop
  1015c0:	49                   	dec    %ecx
  1015c1:	c1 ea 04             	shr    $0x4,%edx
  1015c4:	75 de                	jne    1015a4 <i2X+0x10>
  1015c6:	c6 05 5e 34 10 00 00 	movb   $0x0,0x10345e
  1015cd:	8b 55 0c             	mov    0xc(%ebp),%edx
  1015d0:	89 3a                	mov    %edi,(%edx)
  1015d2:	5b                   	pop    %ebx
  1015d3:	5e                   	pop    %esi
  1015d4:	5f                   	pop    %edi
  1015d5:	5d                   	pop    %ebp
  1015d6:	c3                   	ret    
  1015d7:	90                   	nop
  1015d8:	c6 01 64             	movb   $0x64,(%ecx)
  1015db:	eb e3                	jmp    1015c0 <i2X+0x2c>
  1015dd:	8d 76 00             	lea    0x0(%esi),%esi
  1015e0:	c6 01 63             	movb   $0x63,(%ecx)
  1015e3:	eb db                	jmp    1015c0 <i2X+0x2c>
  1015e5:	8d 76 00             	lea    0x0(%esi),%esi
  1015e8:	c6 01 62             	movb   $0x62,(%ecx)
  1015eb:	eb d3                	jmp    1015c0 <i2X+0x2c>
  1015ed:	8d 76 00             	lea    0x0(%esi),%esi
  1015f0:	c6 01 61             	movb   $0x61,(%ecx)
  1015f3:	eb cb                	jmp    1015c0 <i2X+0x2c>
  1015f5:	8d 76 00             	lea    0x0(%esi),%esi
  1015f8:	c6 01 66             	movb   $0x66,(%ecx)
  1015fb:	eb c3                	jmp    1015c0 <i2X+0x2c>
  1015fd:	8d 76 00             	lea    0x0(%esi),%esi
  101600:	8d 5e 30             	lea    0x30(%esi),%ebx
  101603:	88 19                	mov    %bl,(%ecx)
  101605:	eb b9                	jmp    1015c0 <i2X+0x2c>
  101607:	90                   	nop

00101608 <printk>:
  101608:	55                   	push   %ebp
  101609:	89 e5                	mov    %esp,%ebp
  10160b:	57                   	push   %edi
  10160c:	56                   	push   %esi
  10160d:	53                   	push   %ebx
  10160e:	83 ec 2c             	sub    $0x2c,%esp
  101611:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101614:	8a 11                	mov    (%ecx),%dl
  101616:	84 d2                	test   %dl,%dl
  101618:	0f 84 54 01 00 00    	je     101772 <printk+0x16a>
  10161e:	8d 45 0c             	lea    0xc(%ebp),%eax
  101621:	31 ff                	xor    %edi,%edi
  101623:	eb 18                	jmp    10163d <printk+0x35>
  101625:	8d 76 00             	lea    0x0(%esi),%esi
  101628:	8a 11                	mov    (%ecx),%dl
  10162a:	89 cb                	mov    %ecx,%ebx
  10162c:	88 97 80 34 10 00    	mov    %dl,0x103480(%edi)
  101632:	47                   	inc    %edi
  101633:	8d 4b 01             	lea    0x1(%ebx),%ecx
  101636:	8a 53 01             	mov    0x1(%ebx),%dl
  101639:	84 d2                	test   %dl,%dl
  10163b:	74 72                	je     1016af <printk+0xa7>
  10163d:	80 fa 25             	cmp    $0x25,%dl
  101640:	75 e6                	jne    101628 <printk+0x20>
  101642:	8d 59 01             	lea    0x1(%ecx),%ebx
  101645:	8a 51 01             	mov    0x1(%ecx),%dl
  101648:	80 fa 64             	cmp    $0x64,%dl
  10164b:	0f 84 bf 00 00 00    	je     101710 <printk+0x108>
  101651:	0f 8e 01 01 00 00    	jle    101758 <printk+0x150>
  101657:	80 fa 73             	cmp    $0x73,%dl
  10165a:	0f 84 84 00 00 00    	je     1016e4 <printk+0xdc>
  101660:	80 fa 78             	cmp    $0x78,%dl
  101663:	75 c7                	jne    10162c <printk+0x24>
  101665:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10166c:	8d 70 04             	lea    0x4(%eax),%esi
  10166f:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101672:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101675:	56                   	push   %esi
  101676:	ff 30                	pushl  (%eax)
  101678:	e8 17 ff ff ff       	call   101594 <i2X>
  10167d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  101680:	8d b7 80 34 10 00    	lea    0x103480(%edi),%esi
  101686:	8a 11                	mov    (%ecx),%dl
  101688:	83 c4 08             	add    $0x8,%esp
  10168b:	31 c0                	xor    %eax,%eax
  10168d:	84 d2                	test   %dl,%dl
  10168f:	74 0f                	je     1016a0 <printk+0x98>
  101691:	8d 76 00             	lea    0x0(%esi),%esi
  101694:	40                   	inc    %eax
  101695:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101699:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  10169c:	84 d2                	test   %dl,%dl
  10169e:	75 f4                	jne    101694 <printk+0x8c>
  1016a0:	01 c7                	add    %eax,%edi
  1016a2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1016a5:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1016a8:	8a 53 01             	mov    0x1(%ebx),%dl
  1016ab:	84 d2                	test   %dl,%dl
  1016ad:	75 8e                	jne    10163d <printk+0x35>
  1016af:	c6 87 80 34 10 00 00 	movb   $0x0,0x103480(%edi)
  1016b6:	0f be 05 80 34 10 00 	movsbl 0x103480,%eax
  1016bd:	bb 80 34 10 00       	mov    $0x103480,%ebx
  1016c2:	84 c0                	test   %al,%al
  1016c4:	74 16                	je     1016dc <printk+0xd4>
  1016c6:	66 90                	xchg   %ax,%ax
  1016c8:	83 ec 0c             	sub    $0xc,%esp
  1016cb:	50                   	push   %eax
  1016cc:	e8 a3 f1 ff ff       	call   100874 <putChar>
  1016d1:	43                   	inc    %ebx
  1016d2:	0f be 03             	movsbl (%ebx),%eax
  1016d5:	83 c4 10             	add    $0x10,%esp
  1016d8:	84 c0                	test   %al,%al
  1016da:	75 ec                	jne    1016c8 <printk+0xc0>
  1016dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1016df:	5b                   	pop    %ebx
  1016e0:	5e                   	pop    %esi
  1016e1:	5f                   	pop    %edi
  1016e2:	5d                   	pop    %ebp
  1016e3:	c3                   	ret    
  1016e4:	8d 70 04             	lea    0x4(%eax),%esi
  1016e7:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1016ea:	8b 08                	mov    (%eax),%ecx
  1016ec:	8d b7 80 34 10 00    	lea    0x103480(%edi),%esi
  1016f2:	8a 11                	mov    (%ecx),%dl
  1016f4:	31 c0                	xor    %eax,%eax
  1016f6:	84 d2                	test   %dl,%dl
  1016f8:	74 a6                	je     1016a0 <printk+0x98>
  1016fa:	66 90                	xchg   %ax,%ax
  1016fc:	40                   	inc    %eax
  1016fd:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101701:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  101704:	84 d2                	test   %dl,%dl
  101706:	75 f4                	jne    1016fc <printk+0xf4>
  101708:	01 c7                	add    %eax,%edi
  10170a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10170d:	eb 96                	jmp    1016a5 <printk+0x9d>
  10170f:	90                   	nop
  101710:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  101717:	8d 70 04             	lea    0x4(%eax),%esi
  10171a:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10171d:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101720:	56                   	push   %esi
  101721:	ff 30                	pushl  (%eax)
  101723:	e8 d0 fd ff ff       	call   1014f8 <i2A>
  101728:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  10172b:	8d b7 80 34 10 00    	lea    0x103480(%edi),%esi
  101731:	8a 11                	mov    (%ecx),%dl
  101733:	83 c4 08             	add    $0x8,%esp
  101736:	31 c0                	xor    %eax,%eax
  101738:	84 d2                	test   %dl,%dl
  10173a:	0f 84 60 ff ff ff    	je     1016a0 <printk+0x98>
  101740:	40                   	inc    %eax
  101741:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101745:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  101748:	84 d2                	test   %dl,%dl
  10174a:	75 f4                	jne    101740 <printk+0x138>
  10174c:	01 c7                	add    %eax,%edi
  10174e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101751:	e9 4f ff ff ff       	jmp    1016a5 <printk+0x9d>
  101756:	66 90                	xchg   %ax,%ax
  101758:	80 fa 63             	cmp    $0x63,%dl
  10175b:	0f 85 cb fe ff ff    	jne    10162c <printk+0x24>
  101761:	8b 10                	mov    (%eax),%edx
  101763:	88 97 80 34 10 00    	mov    %dl,0x103480(%edi)
  101769:	83 c0 04             	add    $0x4,%eax
  10176c:	47                   	inc    %edi
  10176d:	e9 c1 fe ff ff       	jmp    101633 <printk+0x2b>
  101772:	31 ff                	xor    %edi,%edi
  101774:	e9 36 ff ff ff       	jmp    1016af <printk+0xa7>
  101779:	66 90                	xchg   %ax,%ax
  10177b:	90                   	nop

0010177c <abort>:
  10177c:	55                   	push   %ebp
  10177d:	89 e5                	mov    %esp,%ebp
  10177f:	57                   	push   %edi
  101780:	56                   	push   %esi
  101781:	53                   	push   %ebx
  101782:	83 ec 1c             	sub    $0x1c,%esp
  101785:	8b 55 08             	mov    0x8(%ebp),%edx
  101788:	fa                   	cli    
  101789:	8a 02                	mov    (%edx),%al
  10178b:	b9 32 33 10 00       	mov    $0x103332,%ecx
  101790:	84 c0                	test   %al,%al
  101792:	74 0b                	je     10179f <abort+0x23>
  101794:	41                   	inc    %ecx
  101795:	42                   	inc    %edx
  101796:	88 41 ff             	mov    %al,-0x1(%ecx)
  101799:	8a 02                	mov    (%edx),%al
  10179b:	84 c0                	test   %al,%al
  10179d:	75 f5                	jne    101794 <abort+0x18>
  10179f:	c6 01 3a             	movb   $0x3a,(%ecx)
  1017a2:	bb 9d 3c 10 00       	mov    $0x103c9d,%ebx
  1017a7:	be 0a 00 00 00       	mov    $0xa,%esi
  1017ac:	bf 67 66 66 66       	mov    $0x66666667,%edi
  1017b1:	4b                   	dec    %ebx
  1017b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1017b5:	99                   	cltd   
  1017b6:	f7 fe                	idiv   %esi
  1017b8:	8d 42 30             	lea    0x30(%edx),%eax
  1017bb:	88 45 e7             	mov    %al,-0x19(%ebp)
  1017be:	88 03                	mov    %al,(%ebx)
  1017c0:	89 f8                	mov    %edi,%eax
  1017c2:	f7 6d 0c             	imull  0xc(%ebp)
  1017c5:	c1 fa 02             	sar    $0x2,%edx
  1017c8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1017cb:	c1 f8 1f             	sar    $0x1f,%eax
  1017ce:	29 c2                	sub    %eax,%edx
  1017d0:	89 55 0c             	mov    %edx,0xc(%ebp)
  1017d3:	75 dc                	jne    1017b1 <abort+0x35>
  1017d5:	41                   	inc    %ecx
  1017d6:	41                   	inc    %ecx
  1017d7:	43                   	inc    %ebx
  1017d8:	8a 45 e7             	mov    -0x19(%ebp),%al
  1017db:	88 41 ff             	mov    %al,-0x1(%ecx)
  1017de:	8a 03                	mov    (%ebx),%al
  1017e0:	88 45 e7             	mov    %al,-0x19(%ebp)
  1017e3:	84 c0                	test   %al,%al
  1017e5:	75 ef                	jne    1017d6 <abort+0x5a>
  1017e7:	c6 01 0a             	movb   $0xa,(%ecx)
  1017ea:	0f be 05 20 33 10 00 	movsbl 0x103320,%eax
  1017f1:	84 c0                	test   %al,%al
  1017f3:	74 1b                	je     101810 <abort+0x94>
  1017f5:	bb 20 33 10 00       	mov    $0x103320,%ebx
  1017fa:	83 ec 0c             	sub    $0xc,%esp
  1017fd:	50                   	push   %eax
  1017fe:	e8 71 f0 ff ff       	call   100874 <putChar>
  101803:	43                   	inc    %ebx
  101804:	0f be 03             	movsbl (%ebx),%eax
  101807:	83 c4 10             	add    $0x10,%esp
  10180a:	84 c0                	test   %al,%al
  10180c:	75 ec                	jne    1017fa <abort+0x7e>
  10180e:	66 90                	xchg   %ax,%ax
  101810:	f4                   	hlt    
  101811:	eb fd                	jmp    101810 <abort+0x94>

00101813 <irqEmpty>:
  101813:	6a 00                	push   $0x0
  101815:	6a ff                	push   $0xffffffff
  101817:	eb 13                	jmp    10182c <asmDoIrq>

00101819 <irqGProtectFault>:
  101819:	6a 0d                	push   $0xd
  10181b:	eb 0f                	jmp    10182c <asmDoIrq>

0010181d <irqSyscall>:
  10181d:	6a 00                	push   $0x0
  10181f:	68 80 00 00 00       	push   $0x80
  101824:	eb 06                	jmp    10182c <asmDoIrq>

00101826 <irqTime>:
  101826:	6a 00                	push   $0x0
  101828:	6a 20                	push   $0x20
  10182a:	eb 00                	jmp    10182c <asmDoIrq>

0010182c <asmDoIrq>:
  10182c:	60                   	pusha  
  10182d:	1e                   	push   %ds
  10182e:	06                   	push   %es
  10182f:	0f a0                	push   %fs
  101831:	0f a8                	push   %gs
  101833:	54                   	push   %esp
  101834:	e8 a3 fa ff ff       	call   1012dc <irqHandle>
  101839:	5c                   	pop    %esp
  10183a:	0f a9                	pop    %gs
  10183c:	0f a1                	pop    %fs
  10183e:	07                   	pop    %es
  10183f:	1f                   	pop    %ds
  101840:	61                   	popa   
  101841:	83 c4 04             	add    $0x4,%esp
  101844:	83 c4 04             	add    $0x4,%esp
  101847:	cf                   	iret   
