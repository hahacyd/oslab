
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 2d 15 00 00       	call   101538 <initTimer>
  10000b:	e8 0c 10 00 00       	call   10101c <init_pcb>
  100010:	e8 53 10 00 00       	call   101068 <init_kernel_pcb>
  100015:	e8 aa 08 00 00       	call   1008c4 <initSerial>
  10001a:	e8 29 11 00 00       	call   101148 <initIdt>
  10001f:	e8 bc 14 00 00       	call   1014e0 <initIntr>
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
  100133:	68 a0 18 10 00       	push   $0x1018a0
  100138:	e8 23 15 00 00       	call   101660 <printk>
  10013d:	89 1c 24             	mov    %ebx,(%esp)
  100140:	68 e0 18 10 00       	push   $0x1018e0
  100145:	6a 18                	push   $0x18
  100147:	68 a6 18 10 00       	push   $0x1018a6
  10014c:	68 b3 18 10 00       	push   $0x1018b3
  100151:	e8 0a 15 00 00       	call   101660 <printk>
  100156:	83 c4 14             	add    $0x14,%esp
  100159:	68 cf 18 10 00       	push   $0x1018cf
  10015e:	e8 fd 14 00 00       	call   101660 <printk>
  100163:	58                   	pop    %eax
  100164:	5a                   	pop    %edx
  100165:	6a 19                	push   $0x19
  100167:	68 a6 18 10 00       	push   $0x1018a6
  10016c:	e8 63 16 00 00       	call   1017d4 <abort>
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
  10036d:	a1 d8 18 10 00       	mov    0x1018d8,%eax
  100372:	8b 15 dc 18 10 00    	mov    0x1018dc,%edx
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
  10045b:	56                   	push   %esi
  10045c:	53                   	push   %ebx
  10045d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100460:	c7 05 a4 3c 10 00 01 	movl   $0x1,0x103ca4
  100467:	00 00 00 
  10046a:	e8 fd 08 00 00       	call   100d6c <apply_new_pid>
  10046f:	89 c6                	mov    %eax,%esi
  100471:	48                   	dec    %eax
  100472:	74 15                	je     100489 <enterUserSpace+0x31>
  100474:	83 ec 08             	sub    $0x8,%esp
  100477:	68 9e 00 00 00       	push   $0x9e
  10047c:	68 a6 18 10 00       	push   $0x1018a6
  100481:	e8 4e 13 00 00       	call   1017d4 <abort>
  100486:	83 c4 10             	add    $0x10,%esp
  100489:	89 f0                	mov    %esi,%eax
  10048b:	c1 e0 07             	shl    $0x7,%eax
  10048e:	01 f0                	add    %esi,%eax
  100490:	01 c0                	add    %eax,%eax
  100492:	01 f0                	add    %esi,%eax
  100494:	8d 04 86             	lea    (%esi,%eax,4),%eax
  100497:	8d 04 c5 c0 3c 10 00 	lea    0x103cc0(,%eax,8),%eax
  10049e:	c7 80 48 20 00 00 23 	movl   $0x23,0x2048(%eax)
  1004a5:	00 00 00 
  1004a8:	c7 80 3c 20 00 00 1b 	movl   $0x1b,0x203c(%eax)
  1004af:	00 00 00 
  1004b2:	c7 80 0c 20 00 00 23 	movl   $0x23,0x200c(%eax)
  1004b9:	00 00 00 
  1004bc:	c7 80 08 20 00 00 23 	movl   $0x23,0x2008(%eax)
  1004c3:	00 00 00 
  1004c6:	c7 80 04 20 00 00 23 	movl   $0x23,0x2004(%eax)
  1004cd:	00 00 00 
  1004d0:	c7 80 44 20 00 00 00 	movl   $0x400000,0x2044(%eax)
  1004d7:	00 40 00 
  1004da:	89 98 38 20 00 00    	mov    %ebx,0x2038(%eax)
  1004e0:	c7 80 50 20 00 00 0a 	movl   $0xa,0x2050(%eax)
  1004e7:	00 00 00 
  1004ea:	83 ec 08             	sub    $0x8,%esp
  1004ed:	6a 00                	push   $0x0
  1004ef:	56                   	push   %esi
  1004f0:	e8 9f 05 00 00       	call   100a94 <put_into_runnable>
  1004f5:	83 c4 10             	add    $0x10,%esp
  1004f8:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  1004ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100502:	5b                   	pop    %ebx
  100503:	5e                   	pop    %esi
  100504:	5d                   	pop    %ebp
  100505:	e9 06 ff ff ff       	jmp    100410 <enterUserSpace_pcb>
  10050a:	66 90                	xchg   %ax,%ax

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
  1005e3:	83 ec 14             	sub    $0x14,%esp
  1005e6:	68 eb 18 10 00       	push   $0x1018eb
  1005eb:	e8 70 10 00 00       	call   101660 <printk>
  1005f0:	e8 8b 07 00 00       	call   100d80 <get_from_runnable>
  1005f5:	5a                   	pop    %edx
  1005f6:	59                   	pop    %ecx
  1005f7:	ff 75 08             	pushl  0x8(%ebp)
  1005fa:	50                   	push   %eax
  1005fb:	e8 28 03 00 00       	call   100928 <put_into_running>
  100600:	b8 01 00 00 00       	mov    $0x1,%eax
  100605:	c9                   	leave  
  100606:	c3                   	ret    
  100607:	90                   	nop

00100608 <sys_getpid>:
  100608:	55                   	push   %ebp
  100609:	89 e5                	mov    %esp,%ebp
  10060b:	5d                   	pop    %ebp
  10060c:	e9 5b 03 00 00       	jmp    10096c <getpid>
  100611:	66 90                	xchg   %ax,%ax
  100613:	90                   	nop

00100614 <sys_sleep>:
  100614:	55                   	push   %ebp
  100615:	89 e5                	mov    %esp,%ebp
  100617:	56                   	push   %esi
  100618:	53                   	push   %ebx
  100619:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10061c:	e8 4b 03 00 00       	call   10096c <getpid>
  100621:	83 ec 08             	sub    $0x8,%esp
  100624:	53                   	push   %ebx
  100625:	50                   	push   %eax
  100626:	e8 05 05 00 00       	call   100b30 <put_into_block>
  10062b:	c7 04 24 a0 18 10 00 	movl   $0x1018a0,(%esp)
  100632:	e8 29 10 00 00       	call   101660 <printk>
  100637:	e8 30 03 00 00       	call   10096c <getpid>
  10063c:	89 c2                	mov    %eax,%edx
  10063e:	c1 e2 07             	shl    $0x7,%edx
  100641:	01 c2                	add    %eax,%edx
  100643:	01 d2                	add    %edx,%edx
  100645:	01 c2                	add    %eax,%edx
  100647:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10064a:	8b 34 c5 14 5d 10 00 	mov    0x105d14(,%eax,8),%esi
  100651:	e8 16 03 00 00       	call   10096c <getpid>
  100656:	5a                   	pop    %edx
  100657:	59                   	pop    %ecx
  100658:	56                   	push   %esi
  100659:	50                   	push   %eax
  10065a:	68 3c 19 10 00       	push   $0x10193c
  10065f:	6a 09                	push   $0x9
  100661:	68 f9 18 10 00       	push   $0x1018f9
  100666:	68 18 19 10 00       	push   $0x101918
  10066b:	e8 f0 0f 00 00       	call   101660 <printk>
  100670:	83 c4 14             	add    $0x14,%esp
  100673:	68 cf 18 10 00       	push   $0x1018cf
  100678:	e8 e3 0f 00 00       	call   101660 <printk>
  10067d:	e8 fe 06 00 00       	call   100d80 <get_from_runnable>
  100682:	5e                   	pop    %esi
  100683:	5a                   	pop    %edx
  100684:	53                   	push   %ebx
  100685:	50                   	push   %eax
  100686:	e8 9d 02 00 00       	call   100928 <put_into_running>
  10068b:	b8 01 00 00 00       	mov    $0x1,%eax
  100690:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100693:	5b                   	pop    %ebx
  100694:	5e                   	pop    %esi
  100695:	5d                   	pop    %ebp
  100696:	c3                   	ret    
  100697:	90                   	nop

00100698 <sys_fork>:
  100698:	55                   	push   %ebp
  100699:	89 e5                	mov    %esp,%ebp
  10069b:	57                   	push   %edi
  10069c:	56                   	push   %esi
  10069d:	53                   	push   %ebx
  10069e:	83 ec 1c             	sub    $0x1c,%esp
  1006a1:	e8 c6 06 00 00       	call   100d6c <apply_new_pid>
  1006a6:	89 c7                	mov    %eax,%edi
  1006a8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1006ab:	c1 e0 07             	shl    $0x7,%eax
  1006ae:	01 f8                	add    %edi,%eax
  1006b0:	01 c0                	add    %eax,%eax
  1006b2:	01 f8                	add    %edi,%eax
  1006b4:	8d 3c 87             	lea    (%edi,%eax,4),%edi
  1006b7:	c1 e7 03             	shl    $0x3,%edi
  1006ba:	31 f6                	xor    %esi,%esi
  1006bc:	e8 ab 02 00 00       	call   10096c <getpid>
  1006c1:	89 c2                	mov    %eax,%edx
  1006c3:	c1 e2 07             	shl    $0x7,%edx
  1006c6:	01 c2                	add    %eax,%edx
  1006c8:	01 d2                	add    %edx,%edx
  1006ca:	01 c2                	add    %eax,%edx
  1006cc:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1006cf:	01 c0                	add    %eax,%eax
  1006d1:	01 f0                	add    %esi,%eax
  1006d3:	8b 04 85 c0 3c 10 00 	mov    0x103cc0(,%eax,4),%eax
  1006da:	89 84 b7 c0 3c 10 00 	mov    %eax,0x103cc0(%edi,%esi,4)
  1006e1:	46                   	inc    %esi
  1006e2:	81 fe 00 08 00 00    	cmp    $0x800,%esi
  1006e8:	75 d2                	jne    1006bc <sys_fork+0x24>
  1006ea:	e8 7d 02 00 00       	call   10096c <getpid>
  1006ef:	8d 50 40             	lea    0x40(%eax),%edx
  1006f2:	c1 e2 10             	shl    $0x10,%edx
  1006f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006f8:	8d 48 40             	lea    0x40(%eax),%ecx
  1006fb:	c1 e1 10             	shl    $0x10,%ecx
  1006fe:	b8 00 00 01 00       	mov    $0x10000,%eax
  100703:	90                   	nop
  100704:	8a 9c 10 00 00 ff ff 	mov    -0x10000(%eax,%edx,1),%bl
  10070b:	88 9c 08 00 00 ff ff 	mov    %bl,-0x10000(%eax,%ecx,1)
  100712:	48                   	dec    %eax
  100713:	75 ef                	jne    100704 <sys_fork+0x6c>
  100715:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
  100718:	89 d8                	mov    %ebx,%eax
  10071a:	c1 e0 07             	shl    $0x7,%eax
  10071d:	01 d8                	add    %ebx,%eax
  10071f:	01 c0                	add    %eax,%eax
  100721:	01 d8                	add    %ebx,%eax
  100723:	8d 14 83             	lea    (%ebx,%eax,4),%edx
  100726:	c1 e2 03             	shl    $0x3,%edx
  100729:	8d 82 c0 5c 10 00    	lea    0x105cc0(%edx),%eax
  10072f:	b9 13 00 00 00       	mov    $0x13,%ecx
  100734:	89 c7                	mov    %eax,%edi
  100736:	8b 75 08             	mov    0x8(%ebp),%esi
  100739:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10073b:	c7 82 ec 5c 10 00 00 	movl   $0x0,0x105cec(%edx)
  100742:	00 00 00 
  100745:	83 ec 08             	sub    $0x8,%esp
  100748:	50                   	push   %eax
  100749:	53                   	push   %ebx
  10074a:	e8 45 03 00 00       	call   100a94 <put_into_runnable>
  10074f:	89 d8                	mov    %ebx,%eax
  100751:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100754:	5b                   	pop    %ebx
  100755:	5e                   	pop    %esi
  100756:	5f                   	pop    %edi
  100757:	5d                   	pop    %ebp
  100758:	c3                   	ret    
  100759:	66 90                	xchg   %ax,%ax
  10075b:	90                   	nop

0010075c <display>:
  10075c:	55                   	push   %ebp
  10075d:	89 e5                	mov    %esp,%ebp
  10075f:	57                   	push   %edi
  100760:	53                   	push   %ebx
  100761:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100764:	80 fb 0a             	cmp    $0xa,%bl
  100767:	74 5b                	je     1007c4 <display+0x68>
  100769:	8b 15 28 34 10 00    	mov    0x103428,%edx
  10076f:	8b 0d 2c 34 10 00    	mov    0x10342c,%ecx
  100775:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  100778:	c1 e0 04             	shl    $0x4,%eax
  10077b:	01 d0                	add    %edx,%eax
  10077d:	01 c0                	add    %eax,%eax
  10077f:	89 c7                	mov    %eax,%edi
  100781:	0f be db             	movsbl %bl,%ebx
  100784:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
  10078a:	66 89 d8             	mov    %bx,%ax
  10078d:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100791:	42                   	inc    %edx
  100792:	83 fa 50             	cmp    $0x50,%edx
  100795:	75 1d                	jne    1007b4 <display+0x58>
  100797:	c7 05 28 34 10 00 00 	movl   $0x0,0x103428
  10079e:	00 00 00 
  1007a1:	41                   	inc    %ecx
  1007a2:	89 0d 2c 34 10 00    	mov    %ecx,0x10342c
  1007a8:	b8 01 00 00 00       	mov    $0x1,%eax
  1007ad:	5b                   	pop    %ebx
  1007ae:	5f                   	pop    %edi
  1007af:	5d                   	pop    %ebp
  1007b0:	c3                   	ret    
  1007b1:	8d 76 00             	lea    0x0(%esi),%esi
  1007b4:	89 15 28 34 10 00    	mov    %edx,0x103428
  1007ba:	b8 01 00 00 00       	mov    $0x1,%eax
  1007bf:	5b                   	pop    %ebx
  1007c0:	5f                   	pop    %edi
  1007c1:	5d                   	pop    %ebp
  1007c2:	c3                   	ret    
  1007c3:	90                   	nop
  1007c4:	c7 05 28 34 10 00 00 	movl   $0x0,0x103428
  1007cb:	00 00 00 
  1007ce:	ff 05 2c 34 10 00    	incl   0x10342c
  1007d4:	b8 01 00 00 00       	mov    $0x1,%eax
  1007d9:	5b                   	pop    %ebx
  1007da:	5f                   	pop    %edi
  1007db:	5d                   	pop    %ebp
  1007dc:	c3                   	ret    
  1007dd:	8d 76 00             	lea    0x0(%esi),%esi

001007e0 <printkernel>:
  1007e0:	55                   	push   %ebp
  1007e1:	89 e5                	mov    %esp,%ebp
  1007e3:	56                   	push   %esi
  1007e4:	53                   	push   %ebx
  1007e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1007e8:	8b 75 0c             	mov    0xc(%ebp),%esi
  1007eb:	85 f6                	test   %esi,%esi
  1007ed:	7e 30                	jle    10081f <printkernel+0x3f>
  1007ef:	0f be 03             	movsbl (%ebx),%eax
  1007f2:	84 c0                	test   %al,%al
  1007f4:	74 29                	je     10081f <printkernel+0x3f>
  1007f6:	01 de                	add    %ebx,%esi
  1007f8:	eb 09                	jmp    100803 <printkernel+0x23>
  1007fa:	66 90                	xchg   %ax,%ax
  1007fc:	0f be 03             	movsbl (%ebx),%eax
  1007ff:	84 c0                	test   %al,%al
  100801:	74 1c                	je     10081f <printkernel+0x3f>
  100803:	83 ec 0c             	sub    $0xc,%esp
  100806:	50                   	push   %eax
  100807:	e8 f8 00 00 00       	call   100904 <putChar>
  10080c:	0f be 03             	movsbl (%ebx),%eax
  10080f:	89 04 24             	mov    %eax,(%esp)
  100812:	e8 45 ff ff ff       	call   10075c <display>
  100817:	43                   	inc    %ebx
  100818:	83 c4 10             	add    $0x10,%esp
  10081b:	39 de                	cmp    %ebx,%esi
  10081d:	75 dd                	jne    1007fc <printkernel+0x1c>
  10081f:	b8 01 00 00 00       	mov    $0x1,%eax
  100824:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100827:	5b                   	pop    %ebx
  100828:	5e                   	pop    %esi
  100829:	5d                   	pop    %ebp
  10082a:	c3                   	ret    
  10082b:	90                   	nop

0010082c <fs_write>:
  10082c:	55                   	push   %ebp
  10082d:	89 e5                	mov    %esp,%ebp
  10082f:	53                   	push   %ebx
  100830:	50                   	push   %eax
  100831:	8b 5d 10             	mov    0x10(%ebp),%ebx
  100834:	ba 30 00 00 00       	mov    $0x30,%edx
  100839:	89 d0                	mov    %edx,%eax
  10083b:	8e e8                	mov    %eax,%gs
  10083d:	8b 45 08             	mov    0x8(%ebp),%eax
  100840:	48                   	dec    %eax
  100841:	83 f8 01             	cmp    $0x1,%eax
  100844:	76 12                	jbe    100858 <fs_write+0x2c>
  100846:	83 ec 08             	sub    $0x8,%esp
  100849:	6a 28                	push   $0x28
  10084b:	68 46 19 10 00       	push   $0x101946
  100850:	e8 7f 0f 00 00       	call   1017d4 <abort>
  100855:	83 c4 10             	add    $0x10,%esp
  100858:	83 ec 08             	sub    $0x8,%esp
  10085b:	53                   	push   %ebx
  10085c:	ff 75 0c             	pushl  0xc(%ebp)
  10085f:	e8 7c ff ff ff       	call   1007e0 <printkernel>
  100864:	89 d8                	mov    %ebx,%eax
  100866:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100869:	c9                   	leave  
  10086a:	c3                   	ret    
  10086b:	90                   	nop

0010086c <sys_write>:
  10086c:	55                   	push   %ebp
  10086d:	89 e5                	mov    %esp,%ebp
  10086f:	56                   	push   %esi
  100870:	53                   	push   %ebx
  100871:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100874:	8b 73 24             	mov    0x24(%ebx),%esi
  100877:	e8 f0 00 00 00       	call   10096c <getpid>
  10087c:	52                   	push   %edx
  10087d:	56                   	push   %esi
  10087e:	c1 e0 10             	shl    $0x10,%eax
  100881:	03 43 28             	add    0x28(%ebx),%eax
  100884:	50                   	push   %eax
  100885:	ff 73 20             	pushl  0x20(%ebx)
  100888:	e8 9f ff ff ff       	call   10082c <fs_write>
  10088d:	89 43 2c             	mov    %eax,0x2c(%ebx)
  100890:	83 c4 10             	add    $0x10,%esp
  100893:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100896:	5b                   	pop    %ebx
  100897:	5e                   	pop    %esi
  100898:	5d                   	pop    %ebp
  100899:	c3                   	ret    
  10089a:	66 90                	xchg   %ax,%ax

0010089c <print_char>:
  10089c:	55                   	push   %ebp
  10089d:	89 e5                	mov    %esp,%ebp
  10089f:	57                   	push   %edi
  1008a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1008a3:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1008a6:	c1 e0 04             	shl    $0x4,%eax
  1008a9:	03 45 0c             	add    0xc(%ebp),%eax
  1008ac:	01 c0                	add    %eax,%eax
  1008ae:	89 c7                	mov    %eax,%edi
  1008b0:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  1008b4:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  1008ba:	66 89 d0             	mov    %dx,%ax
  1008bd:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1008c1:	5f                   	pop    %edi
  1008c2:	5d                   	pop    %ebp
  1008c3:	c3                   	ret    

001008c4 <initSerial>:
  1008c4:	55                   	push   %ebp
  1008c5:	89 e5                	mov    %esp,%ebp
  1008c7:	ba f9 03 00 00       	mov    $0x3f9,%edx
  1008cc:	31 c0                	xor    %eax,%eax
  1008ce:	ee                   	out    %al,(%dx)
  1008cf:	ba fb 03 00 00       	mov    $0x3fb,%edx
  1008d4:	b0 80                	mov    $0x80,%al
  1008d6:	ee                   	out    %al,(%dx)
  1008d7:	ba f8 03 00 00       	mov    $0x3f8,%edx
  1008dc:	b0 01                	mov    $0x1,%al
  1008de:	ee                   	out    %al,(%dx)
  1008df:	ba f9 03 00 00       	mov    $0x3f9,%edx
  1008e4:	31 c0                	xor    %eax,%eax
  1008e6:	ee                   	out    %al,(%dx)
  1008e7:	ba fb 03 00 00       	mov    $0x3fb,%edx
  1008ec:	b0 03                	mov    $0x3,%al
  1008ee:	ee                   	out    %al,(%dx)
  1008ef:	ba fa 03 00 00       	mov    $0x3fa,%edx
  1008f4:	b0 c7                	mov    $0xc7,%al
  1008f6:	ee                   	out    %al,(%dx)
  1008f7:	ba fc 03 00 00       	mov    $0x3fc,%edx
  1008fc:	b0 0b                	mov    $0xb,%al
  1008fe:	ee                   	out    %al,(%dx)
  1008ff:	5d                   	pop    %ebp
  100900:	c3                   	ret    
  100901:	8d 76 00             	lea    0x0(%esi),%esi

00100904 <putChar>:
  100904:	55                   	push   %ebp
  100905:	89 e5                	mov    %esp,%ebp
  100907:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10090a:	ba fd 03 00 00       	mov    $0x3fd,%edx
  10090f:	90                   	nop
  100910:	ec                   	in     (%dx),%al
  100911:	a8 20                	test   $0x20,%al
  100913:	74 fb                	je     100910 <putChar+0xc>
  100915:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10091a:	88 c8                	mov    %cl,%al
  10091c:	ee                   	out    %al,(%dx)
  10091d:	5d                   	pop    %ebp
  10091e:	c3                   	ret    
  10091f:	90                   	nop

00100920 <IDLE>:
  100920:	55                   	push   %ebp
  100921:	89 e5                	mov    %esp,%ebp
  100923:	90                   	nop
  100924:	f4                   	hlt    
  100925:	eb fd                	jmp    100924 <IDLE+0x4>
  100927:	90                   	nop

00100928 <put_into_running>:
  100928:	55                   	push   %ebp
  100929:	89 e5                	mov    %esp,%ebp
  10092b:	83 ec 08             	sub    $0x8,%esp
  10092e:	8b 55 08             	mov    0x8(%ebp),%edx
  100931:	39 15 a0 3c 10 00    	cmp    %edx,0x103ca0
  100937:	74 29                	je     100962 <put_into_running+0x3a>
  100939:	89 15 a0 3c 10 00    	mov    %edx,0x103ca0
  10093f:	83 ec 08             	sub    $0x8,%esp
  100942:	89 d0                	mov    %edx,%eax
  100944:	c1 e0 07             	shl    $0x7,%eax
  100947:	01 d0                	add    %edx,%eax
  100949:	01 c0                	add    %eax,%eax
  10094b:	01 d0                	add    %edx,%eax
  10094d:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100950:	8d 04 c5 bc 5c 10 00 	lea    0x105cbc(,%eax,8),%eax
  100957:	50                   	push   %eax
  100958:	6a 10                	push   $0x10
  10095a:	e8 55 f8 ff ff       	call   1001b4 <change_tss>
  10095f:	83 c4 10             	add    $0x10,%esp
  100962:	b8 01 00 00 00       	mov    $0x1,%eax
  100967:	c9                   	leave  
  100968:	c3                   	ret    
  100969:	8d 76 00             	lea    0x0(%esi),%esi

0010096c <getpid>:
  10096c:	55                   	push   %ebp
  10096d:	89 e5                	mov    %esp,%ebp
  10096f:	a1 a0 3c 10 00       	mov    0x103ca0,%eax
  100974:	5d                   	pop    %ebp
  100975:	c3                   	ret    
  100976:	66 90                	xchg   %ax,%ax

00100978 <getrunnable>:
  100978:	55                   	push   %ebp
  100979:	89 e5                	mov    %esp,%ebp
  10097b:	a1 04 33 10 00       	mov    0x103304,%eax
  100980:	5d                   	pop    %ebp
  100981:	c3                   	ret    
  100982:	66 90                	xchg   %ax,%ax

00100984 <getblocked>:
  100984:	55                   	push   %ebp
  100985:	89 e5                	mov    %esp,%ebp
  100987:	a1 00 33 10 00       	mov    0x103300,%eax
  10098c:	5d                   	pop    %ebp
  10098d:	c3                   	ret    
  10098e:	66 90                	xchg   %ax,%ax

00100990 <put_into>:
  100990:	55                   	push   %ebp
  100991:	89 e5                	mov    %esp,%ebp
  100993:	56                   	push   %esi
  100994:	53                   	push   %ebx
  100995:	8b 55 08             	mov    0x8(%ebp),%edx
  100998:	8b 45 0c             	mov    0xc(%ebp),%eax
  10099b:	83 fa 01             	cmp    $0x1,%edx
  10099e:	0f 84 e0 00 00 00    	je     100a84 <put_into+0xf4>
  1009a4:	83 fa 03             	cmp    $0x3,%edx
  1009a7:	0f 84 97 00 00 00    	je     100a44 <put_into+0xb4>
  1009ad:	85 d2                	test   %edx,%edx
  1009af:	74 1f                	je     1009d0 <put_into+0x40>
  1009b1:	83 ec 08             	sub    $0x8,%esp
  1009b4:	6a 79                	push   $0x79
  1009b6:	68 62 19 10 00       	push   $0x101962
  1009bb:	e8 14 0e 00 00       	call   1017d4 <abort>
  1009c0:	83 c4 10             	add    $0x10,%esp
  1009c3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1009c8:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1009cb:	5b                   	pop    %ebx
  1009cc:	5e                   	pop    %esi
  1009cd:	5d                   	pop    %ebp
  1009ce:	c3                   	ret    
  1009cf:	90                   	nop
  1009d0:	8b 0d 00 33 10 00    	mov    0x103300,%ecx
  1009d6:	ba 00 33 10 00       	mov    $0x103300,%edx
  1009db:	83 f9 ff             	cmp    $0xffffffff,%ecx
  1009de:	74 74                	je     100a54 <put_into+0xc4>
  1009e0:	89 ca                	mov    %ecx,%edx
  1009e2:	c1 e2 07             	shl    $0x7,%edx
  1009e5:	01 ca                	add    %ecx,%edx
  1009e7:	01 d2                	add    %edx,%edx
  1009e9:	01 ca                	add    %ecx,%edx
  1009eb:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  1009ee:	8d 34 d5 c0 3c 10 00 	lea    0x103cc0(,%edx,8),%esi
  1009f5:	8b 9e 5c 20 00 00    	mov    0x205c(%esi),%ebx
  1009fb:	89 da                	mov    %ebx,%edx
  1009fd:	c1 e2 07             	shl    $0x7,%edx
  100a00:	01 da                	add    %ebx,%edx
  100a02:	01 d2                	add    %edx,%edx
  100a04:	01 da                	add    %ebx,%edx
  100a06:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100a09:	89 04 d5 20 5d 10 00 	mov    %eax,0x105d20(,%edx,8)
  100a10:	89 c2                	mov    %eax,%edx
  100a12:	c1 e2 07             	shl    $0x7,%edx
  100a15:	01 c2                	add    %eax,%edx
  100a17:	01 d2                	add    %edx,%edx
  100a19:	01 c2                	add    %eax,%edx
  100a1b:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100a1e:	8d 14 d5 c0 3c 10 00 	lea    0x103cc0(,%edx,8),%edx
  100a25:	89 9a 5c 20 00 00    	mov    %ebx,0x205c(%edx)
  100a2b:	89 8a 60 20 00 00    	mov    %ecx,0x2060(%edx)
  100a31:	89 86 5c 20 00 00    	mov    %eax,0x205c(%esi)
  100a37:	b8 01 00 00 00       	mov    $0x1,%eax
  100a3c:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100a3f:	5b                   	pop    %ebx
  100a40:	5e                   	pop    %esi
  100a41:	5d                   	pop    %ebp
  100a42:	c3                   	ret    
  100a43:	90                   	nop
  100a44:	8b 0d 30 34 10 00    	mov    0x103430,%ecx
  100a4a:	ba 30 34 10 00       	mov    $0x103430,%edx
  100a4f:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100a52:	75 8c                	jne    1009e0 <put_into+0x50>
  100a54:	89 02                	mov    %eax,(%edx)
  100a56:	89 c2                	mov    %eax,%edx
  100a58:	c1 e2 07             	shl    $0x7,%edx
  100a5b:	01 c2                	add    %eax,%edx
  100a5d:	01 d2                	add    %edx,%edx
  100a5f:	01 c2                	add    %eax,%edx
  100a61:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100a64:	8d 14 d5 c0 3c 10 00 	lea    0x103cc0(,%edx,8),%edx
  100a6b:	89 82 60 20 00 00    	mov    %eax,0x2060(%edx)
  100a71:	89 82 5c 20 00 00    	mov    %eax,0x205c(%edx)
  100a77:	b8 01 00 00 00       	mov    $0x1,%eax
  100a7c:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100a7f:	5b                   	pop    %ebx
  100a80:	5e                   	pop    %esi
  100a81:	5d                   	pop    %ebp
  100a82:	c3                   	ret    
  100a83:	90                   	nop
  100a84:	8b 0d 04 33 10 00    	mov    0x103304,%ecx
  100a8a:	ba 04 33 10 00       	mov    $0x103304,%edx
  100a8f:	e9 47 ff ff ff       	jmp    1009db <put_into+0x4b>

00100a94 <put_into_runnable>:
  100a94:	55                   	push   %ebp
  100a95:	89 e5                	mov    %esp,%ebp
  100a97:	56                   	push   %esi
  100a98:	53                   	push   %ebx
  100a99:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100a9c:	8b 75 0c             	mov    0xc(%ebp),%esi
  100a9f:	83 ec 0c             	sub    $0xc,%esp
  100aa2:	68 a0 18 10 00       	push   $0x1018a0
  100aa7:	e8 b4 0b 00 00       	call   101660 <printk>
  100aac:	58                   	pop    %eax
  100aad:	5a                   	pop    %edx
  100aae:	53                   	push   %ebx
  100aaf:	ff 35 04 33 10 00    	pushl  0x103304
  100ab5:	68 24 1a 10 00       	push   $0x101a24
  100aba:	6a 41                	push   $0x41
  100abc:	68 62 19 10 00       	push   $0x101962
  100ac1:	68 70 19 10 00       	push   $0x101970
  100ac6:	e8 95 0b 00 00       	call   101660 <printk>
  100acb:	83 c4 14             	add    $0x14,%esp
  100ace:	68 cf 18 10 00       	push   $0x1018cf
  100ad3:	e8 88 0b 00 00       	call   101660 <printk>
  100ad8:	83 c4 10             	add    $0x10,%esp
  100adb:	85 db                	test   %ebx,%ebx
  100add:	75 0a                	jne    100ae9 <put_into_runnable+0x55>
  100adf:	c7 05 f8 5c 10 00 20 	movl   $0x100920,0x105cf8
  100ae6:	09 10 00 
  100ae9:	89 d8                	mov    %ebx,%eax
  100aeb:	c1 e0 07             	shl    $0x7,%eax
  100aee:	01 d8                	add    %ebx,%eax
  100af0:	01 c0                	add    %eax,%eax
  100af2:	01 d8                	add    %ebx,%eax
  100af4:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100af7:	8d 04 c5 c0 3c 10 00 	lea    0x103cc0(,%eax,8),%eax
  100afe:	8b 15 a8 3c 10 00    	mov    0x103ca8,%edx
  100b04:	89 90 50 20 00 00    	mov    %edx,0x2050(%eax)
  100b0a:	89 b0 64 20 00 00    	mov    %esi,0x2064(%eax)
  100b10:	c7 80 4c 20 00 00 01 	movl   $0x1,0x204c(%eax)
  100b17:	00 00 00 
  100b1a:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  100b1d:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
  100b24:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100b27:	5b                   	pop    %ebx
  100b28:	5e                   	pop    %esi
  100b29:	5d                   	pop    %ebp
  100b2a:	e9 61 fe ff ff       	jmp    100990 <put_into>
  100b2f:	90                   	nop

00100b30 <put_into_block>:
  100b30:	55                   	push   %ebp
  100b31:	89 e5                	mov    %esp,%ebp
  100b33:	57                   	push   %edi
  100b34:	56                   	push   %esi
  100b35:	53                   	push   %ebx
  100b36:	8b 55 08             	mov    0x8(%ebp),%edx
  100b39:	89 d0                	mov    %edx,%eax
  100b3b:	c1 e0 07             	shl    $0x7,%eax
  100b3e:	01 d0                	add    %edx,%eax
  100b40:	01 c0                	add    %eax,%eax
  100b42:	01 d0                	add    %edx,%eax
  100b44:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
  100b47:	c1 e3 03             	shl    $0x3,%ebx
  100b4a:	8d 83 c0 5c 10 00    	lea    0x105cc0(%ebx),%eax
  100b50:	b9 13 00 00 00       	mov    $0x13,%ecx
  100b55:	89 c7                	mov    %eax,%edi
  100b57:	8b 75 0c             	mov    0xc(%ebp),%esi
  100b5a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100b5c:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b5f:	8b 40 20             	mov    0x20(%eax),%eax
  100b62:	89 83 14 5d 10 00    	mov    %eax,0x105d14(%ebx)
  100b68:	c7 83 0c 5d 10 00 00 	movl   $0x0,0x105d0c(%ebx)
  100b6f:	00 00 00 
  100b72:	89 55 0c             	mov    %edx,0xc(%ebp)
  100b75:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
  100b7c:	5b                   	pop    %ebx
  100b7d:	5e                   	pop    %esi
  100b7e:	5f                   	pop    %edi
  100b7f:	5d                   	pop    %ebp
  100b80:	e9 0b fe ff ff       	jmp    100990 <put_into>
  100b85:	8d 76 00             	lea    0x0(%esi),%esi

00100b88 <get_from>:
  100b88:	55                   	push   %ebp
  100b89:	89 e5                	mov    %esp,%ebp
  100b8b:	56                   	push   %esi
  100b8c:	53                   	push   %ebx
  100b8d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100b90:	8b 75 0c             	mov    0xc(%ebp),%esi
  100b93:	39 f3                	cmp    %esi,%ebx
  100b95:	74 42                	je     100bd9 <get_from+0x51>
  100b97:	89 d8                	mov    %ebx,%eax
  100b99:	c1 e0 07             	shl    $0x7,%eax
  100b9c:	01 d8                	add    %ebx,%eax
  100b9e:	01 c0                	add    %eax,%eax
  100ba0:	01 d8                	add    %ebx,%eax
  100ba2:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100ba5:	8b 0c c5 20 5d 10 00 	mov    0x105d20(,%eax,8),%ecx
  100bac:	39 cb                	cmp    %ecx,%ebx
  100bae:	75 25                	jne    100bd5 <get_from+0x4d>
  100bb0:	e9 37 01 00 00       	jmp    100cec <get_from+0x164>
  100bb5:	8d 76 00             	lea    0x0(%esi),%esi
  100bb8:	89 ca                	mov    %ecx,%edx
  100bba:	c1 e2 07             	shl    $0x7,%edx
  100bbd:	01 ca                	add    %ecx,%edx
  100bbf:	01 d2                	add    %edx,%edx
  100bc1:	01 ca                	add    %ecx,%edx
  100bc3:	8d 04 91             	lea    (%ecx,%edx,4),%eax
  100bc6:	8b 0c c5 20 5d 10 00 	mov    0x105d20(,%eax,8),%ecx
  100bcd:	39 cb                	cmp    %ecx,%ebx
  100bcf:	0f 84 17 01 00 00    	je     100cec <get_from+0x164>
  100bd5:	39 ce                	cmp    %ecx,%esi
  100bd7:	75 df                	jne    100bb8 <get_from+0x30>
  100bd9:	89 f0                	mov    %esi,%eax
  100bdb:	c1 e0 07             	shl    $0x7,%eax
  100bde:	01 f0                	add    %esi,%eax
  100be0:	01 c0                	add    %eax,%eax
  100be2:	01 f0                	add    %esi,%eax
  100be4:	8d 04 86             	lea    (%esi,%eax,4),%eax
  100be7:	8b 04 c5 0c 5d 10 00 	mov    0x105d0c(,%eax,8),%eax
  100bee:	83 f8 01             	cmp    $0x1,%eax
  100bf1:	0f 84 59 01 00 00    	je     100d50 <get_from+0x1c8>
  100bf7:	83 f8 03             	cmp    $0x3,%eax
  100bfa:	74 30                	je     100c2c <get_from+0xa4>
  100bfc:	85 c0                	test   %eax,%eax
  100bfe:	0f 84 40 01 00 00    	je     100d44 <get_from+0x1bc>
  100c04:	83 ec 08             	sub    $0x8,%esp
  100c07:	68 ac 00 00 00       	push   $0xac
  100c0c:	68 62 19 10 00       	push   $0x101962
  100c11:	e8 be 0b 00 00       	call   1017d4 <abort>
  100c16:	c7 04 24 a0 18 10 00 	movl   $0x1018a0,(%esp)
  100c1d:	e8 3e 0a 00 00       	call   101660 <printk>
  100c22:	a1 00 00 00 00       	mov    0x0,%eax
  100c27:	0f 0b                	ud2    
  100c29:	8d 76 00             	lea    0x0(%esi),%esi
  100c2c:	be 30 34 10 00       	mov    $0x103430,%esi
  100c31:	83 ec 0c             	sub    $0xc,%esp
  100c34:	68 a0 18 10 00       	push   $0x1018a0
  100c39:	e8 22 0a 00 00       	call   101660 <printk>
  100c3e:	58                   	pop    %eax
  100c3f:	5a                   	pop    %edx
  100c40:	ff 36                	pushl  (%esi)
  100c42:	53                   	push   %ebx
  100c43:	68 18 1a 10 00       	push   $0x101a18
  100c48:	68 b0 00 00 00       	push   $0xb0
  100c4d:	68 62 19 10 00       	push   $0x101962
  100c52:	68 a0 19 10 00       	push   $0x1019a0
  100c57:	e8 04 0a 00 00       	call   101660 <printk>
  100c5c:	83 c4 14             	add    $0x14,%esp
  100c5f:	68 cf 18 10 00       	push   $0x1018cf
  100c64:	e8 f7 09 00 00       	call   101660 <printk>
  100c69:	83 c4 10             	add    $0x10,%esp
  100c6c:	3b 1e                	cmp    (%esi),%ebx
  100c6e:	74 15                	je     100c85 <get_from+0xfd>
  100c70:	83 ec 08             	sub    $0x8,%esp
  100c73:	68 b1 00 00 00       	push   $0xb1
  100c78:	68 62 19 10 00       	push   $0x101962
  100c7d:	e8 52 0b 00 00       	call   1017d4 <abort>
  100c82:	83 c4 10             	add    $0x10,%esp
  100c85:	83 fb ff             	cmp    $0xffffffff,%ebx
  100c88:	0f 84 a9 00 00 00    	je     100d37 <get_from+0x1af>
  100c8e:	89 d8                	mov    %ebx,%eax
  100c90:	c1 e0 07             	shl    $0x7,%eax
  100c93:	01 d8                	add    %ebx,%eax
  100c95:	01 c0                	add    %eax,%eax
  100c97:	01 d8                	add    %ebx,%eax
  100c99:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100c9c:	8d 04 c5 c0 3c 10 00 	lea    0x103cc0(,%eax,8),%eax
  100ca3:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100ca9:	39 da                	cmp    %ebx,%edx
  100cab:	0f 84 ab 00 00 00    	je     100d5c <get_from+0x1d4>
  100cb1:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100cb7:	89 c8                	mov    %ecx,%eax
  100cb9:	c1 e0 07             	shl    $0x7,%eax
  100cbc:	01 c8                	add    %ecx,%eax
  100cbe:	01 c0                	add    %eax,%eax
  100cc0:	01 c8                	add    %ecx,%eax
  100cc2:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100cc5:	89 14 c5 20 5d 10 00 	mov    %edx,0x105d20(,%eax,8)
  100ccc:	89 d0                	mov    %edx,%eax
  100cce:	c1 e0 07             	shl    $0x7,%eax
  100cd1:	01 d0                	add    %edx,%eax
  100cd3:	01 c0                	add    %eax,%eax
  100cd5:	01 d0                	add    %edx,%eax
  100cd7:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100cda:	89 0c c5 1c 5d 10 00 	mov    %ecx,0x105d1c(,%eax,8)
  100ce1:	89 16                	mov    %edx,(%esi)
  100ce3:	89 d8                	mov    %ebx,%eax
  100ce5:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100ce8:	5b                   	pop    %ebx
  100ce9:	5e                   	pop    %esi
  100cea:	5d                   	pop    %ebp
  100ceb:	c3                   	ret    
  100cec:	83 ec 0c             	sub    $0xc,%esp
  100cef:	68 a0 18 10 00       	push   $0x1018a0
  100cf4:	e8 67 09 00 00       	call   101660 <printk>
  100cf9:	58                   	pop    %eax
  100cfa:	5a                   	pop    %edx
  100cfb:	56                   	push   %esi
  100cfc:	53                   	push   %ebx
  100cfd:	68 18 1a 10 00       	push   $0x101a18
  100d02:	68 99 00 00 00       	push   $0x99
  100d07:	68 62 19 10 00       	push   $0x101962
  100d0c:	68 c8 19 10 00       	push   $0x1019c8
  100d11:	e8 4a 09 00 00       	call   101660 <printk>
  100d16:	83 c4 14             	add    $0x14,%esp
  100d19:	68 cf 18 10 00       	push   $0x1018cf
  100d1e:	e8 3d 09 00 00       	call   101660 <printk>
  100d23:	59                   	pop    %ecx
  100d24:	5b                   	pop    %ebx
  100d25:	68 9a 00 00 00       	push   $0x9a
  100d2a:	68 62 19 10 00       	push   $0x101962
  100d2f:	e8 a0 0a 00 00       	call   1017d4 <abort>
  100d34:	83 c4 10             	add    $0x10,%esp
  100d37:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100d3c:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d3f:	5b                   	pop    %ebx
  100d40:	5e                   	pop    %esi
  100d41:	5d                   	pop    %ebp
  100d42:	c3                   	ret    
  100d43:	90                   	nop
  100d44:	be 00 33 10 00       	mov    $0x103300,%esi
  100d49:	e9 e3 fe ff ff       	jmp    100c31 <get_from+0xa9>
  100d4e:	66 90                	xchg   %ax,%ax
  100d50:	be 04 33 10 00       	mov    $0x103304,%esi
  100d55:	e9 d7 fe ff ff       	jmp    100c31 <get_from+0xa9>
  100d5a:	66 90                	xchg   %ax,%ax
  100d5c:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100d62:	89 d8                	mov    %ebx,%eax
  100d64:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d67:	5b                   	pop    %ebx
  100d68:	5e                   	pop    %esi
  100d69:	5d                   	pop    %ebp
  100d6a:	c3                   	ret    
  100d6b:	90                   	nop

00100d6c <apply_new_pid>:
  100d6c:	55                   	push   %ebp
  100d6d:	89 e5                	mov    %esp,%ebp
  100d6f:	83 ec 10             	sub    $0x10,%esp
  100d72:	a1 30 34 10 00       	mov    0x103430,%eax
  100d77:	50                   	push   %eax
  100d78:	50                   	push   %eax
  100d79:	e8 0a fe ff ff       	call   100b88 <get_from>
  100d7e:	c9                   	leave  
  100d7f:	c3                   	ret    

00100d80 <get_from_runnable>:
  100d80:	55                   	push   %ebp
  100d81:	89 e5                	mov    %esp,%ebp
  100d83:	83 ec 10             	sub    $0x10,%esp
  100d86:	a1 04 33 10 00       	mov    0x103304,%eax
  100d8b:	50                   	push   %eax
  100d8c:	50                   	push   %eax
  100d8d:	e8 f6 fd ff ff       	call   100b88 <get_from>
  100d92:	c9                   	leave  
  100d93:	c3                   	ret    

00100d94 <get_from_block>:
  100d94:	55                   	push   %ebp
  100d95:	89 e5                	mov    %esp,%ebp
  100d97:	83 ec 10             	sub    $0x10,%esp
  100d9a:	ff 75 08             	pushl  0x8(%ebp)
  100d9d:	ff 35 00 33 10 00    	pushl  0x103300
  100da3:	e8 e0 fd ff ff       	call   100b88 <get_from>
  100da8:	83 c4 10             	add    $0x10,%esp
  100dab:	40                   	inc    %eax
  100dac:	74 0a                	je     100db8 <get_from_block+0x24>
  100dae:	b8 01 00 00 00       	mov    $0x1,%eax
  100db3:	c9                   	leave  
  100db4:	c3                   	ret    
  100db5:	8d 76 00             	lea    0x0(%esi),%esi
  100db8:	83 ec 08             	sub    $0x8,%esp
  100dbb:	68 c8 00 00 00       	push   $0xc8
  100dc0:	68 62 19 10 00       	push   $0x101962
  100dc5:	e8 0a 0a 00 00       	call   1017d4 <abort>
  100dca:	83 c4 10             	add    $0x10,%esp
  100dcd:	b8 01 00 00 00       	mov    $0x1,%eax
  100dd2:	c9                   	leave  
  100dd3:	c3                   	ret    

00100dd4 <check_block>:
  100dd4:	8b 15 00 33 10 00    	mov    0x103300,%edx
  100dda:	83 fa ff             	cmp    $0xffffffff,%edx
  100ddd:	0f 84 9d 00 00 00    	je     100e80 <check_block+0xac>
  100de3:	55                   	push   %ebp
  100de4:	89 e5                	mov    %esp,%ebp
  100de6:	57                   	push   %edi
  100de7:	56                   	push   %esi
  100de8:	53                   	push   %ebx
  100de9:	83 ec 0c             	sub    $0xc,%esp
  100dec:	89 d3                	mov    %edx,%ebx
  100dee:	eb 1e                	jmp    100e0e <check_block+0x3a>
  100df0:	89 d8                	mov    %ebx,%eax
  100df2:	c1 e0 07             	shl    $0x7,%eax
  100df5:	01 d8                	add    %ebx,%eax
  100df7:	01 c0                	add    %eax,%eax
  100df9:	01 d8                	add    %ebx,%eax
  100dfb:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100dfe:	8b 1c c5 20 5d 10 00 	mov    0x105d20(,%eax,8),%ebx
  100e05:	39 d3                	cmp    %edx,%ebx
  100e07:	74 6a                	je     100e73 <check_block+0x9f>
  100e09:	83 fa ff             	cmp    $0xffffffff,%edx
  100e0c:	74 65                	je     100e73 <check_block+0x9f>
  100e0e:	89 d8                	mov    %ebx,%eax
  100e10:	c1 e0 07             	shl    $0x7,%eax
  100e13:	01 d8                	add    %ebx,%eax
  100e15:	01 c0                	add    %eax,%eax
  100e17:	01 d8                	add    %ebx,%eax
  100e19:	8d 34 83             	lea    (%ebx,%eax,4),%esi
  100e1c:	c1 e6 03             	shl    $0x3,%esi
  100e1f:	8b be 0c 5d 10 00    	mov    0x105d0c(%esi),%edi
  100e25:	85 ff                	test   %edi,%edi
  100e27:	75 c7                	jne    100df0 <check_block+0x1c>
  100e29:	8b 8e 14 5d 10 00    	mov    0x105d14(%esi),%ecx
  100e2f:	85 c9                	test   %ecx,%ecx
  100e31:	7f bd                	jg     100df0 <check_block+0x1c>
  100e33:	8b be 20 5d 10 00    	mov    0x105d20(%esi),%edi
  100e39:	83 ec 0c             	sub    $0xc,%esp
  100e3c:	53                   	push   %ebx
  100e3d:	e8 52 ff ff ff       	call   100d94 <get_from_block>
  100e42:	58                   	pop    %eax
  100e43:	5a                   	pop    %edx
  100e44:	81 c6 c0 5c 10 00    	add    $0x105cc0,%esi
  100e4a:	56                   	push   %esi
  100e4b:	53                   	push   %ebx
  100e4c:	e8 43 fc ff ff       	call   100a94 <put_into_runnable>
  100e51:	89 f8                	mov    %edi,%eax
  100e53:	c1 e0 07             	shl    $0x7,%eax
  100e56:	01 f8                	add    %edi,%eax
  100e58:	01 c0                	add    %eax,%eax
  100e5a:	01 f8                	add    %edi,%eax
  100e5c:	8d 04 87             	lea    (%edi,%eax,4),%eax
  100e5f:	8b 1c c5 20 5d 10 00 	mov    0x105d20(,%eax,8),%ebx
  100e66:	83 c4 10             	add    $0x10,%esp
  100e69:	8b 15 00 33 10 00    	mov    0x103300,%edx
  100e6f:	39 d3                	cmp    %edx,%ebx
  100e71:	75 96                	jne    100e09 <check_block+0x35>
  100e73:	b8 01 00 00 00       	mov    $0x1,%eax
  100e78:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100e7b:	5b                   	pop    %ebx
  100e7c:	5e                   	pop    %esi
  100e7d:	5f                   	pop    %edi
  100e7e:	5d                   	pop    %ebp
  100e7f:	c3                   	ret    
  100e80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e85:	c3                   	ret    
  100e86:	66 90                	xchg   %ax,%ax

00100e88 <checkTimeCount>:
  100e88:	55                   	push   %ebp
  100e89:	89 e5                	mov    %esp,%ebp
  100e8b:	57                   	push   %edi
  100e8c:	56                   	push   %esi
  100e8d:	83 ec 0c             	sub    $0xc,%esp
  100e90:	68 a0 18 10 00       	push   $0x1018a0
  100e95:	e8 c6 07 00 00       	call   101660 <printk>
  100e9a:	8b 15 a0 3c 10 00    	mov    0x103ca0,%edx
  100ea0:	5e                   	pop    %esi
  100ea1:	5f                   	pop    %edi
  100ea2:	89 d0                	mov    %edx,%eax
  100ea4:	c1 e0 07             	shl    $0x7,%eax
  100ea7:	01 d0                	add    %edx,%eax
  100ea9:	01 c0                	add    %eax,%eax
  100eab:	01 d0                	add    %edx,%eax
  100ead:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100eb0:	ff 34 c5 10 5d 10 00 	pushl  0x105d10(,%eax,8)
  100eb7:	52                   	push   %edx
  100eb8:	68 38 1a 10 00       	push   $0x101a38
  100ebd:	6a 17                	push   $0x17
  100ebf:	68 62 19 10 00       	push   $0x101962
  100ec4:	68 ec 19 10 00       	push   $0x1019ec
  100ec9:	e8 92 07 00 00       	call   101660 <printk>
  100ece:	83 c4 14             	add    $0x14,%esp
  100ed1:	68 cf 18 10 00       	push   $0x1018cf
  100ed6:	e8 85 07 00 00       	call   101660 <printk>
  100edb:	e8 f4 fe ff ff       	call   100dd4 <check_block>
  100ee0:	8b 15 a0 3c 10 00    	mov    0x103ca0,%edx
  100ee6:	89 d0                	mov    %edx,%eax
  100ee8:	c1 e0 07             	shl    $0x7,%eax
  100eeb:	01 d0                	add    %edx,%eax
  100eed:	01 c0                	add    %eax,%eax
  100eef:	01 d0                	add    %edx,%eax
  100ef1:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100ef4:	c1 e0 03             	shl    $0x3,%eax
  100ef7:	83 c4 10             	add    $0x10,%esp
  100efa:	8b 88 10 5d 10 00    	mov    0x105d10(%eax),%ecx
  100f00:	85 c9                	test   %ecx,%ecx
  100f02:	7e 0c                	jle    100f10 <checkTimeCount+0x88>
  100f04:	b8 01 00 00 00       	mov    $0x1,%eax
  100f09:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100f0c:	5e                   	pop    %esi
  100f0d:	5f                   	pop    %edi
  100f0e:	5d                   	pop    %ebp
  100f0f:	c3                   	ret    
  100f10:	05 c0 5c 10 00       	add    $0x105cc0,%eax
  100f15:	b9 13 00 00 00       	mov    $0x13,%ecx
  100f1a:	89 c7                	mov    %eax,%edi
  100f1c:	8b 75 08             	mov    0x8(%ebp),%esi
  100f1f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100f21:	83 ec 08             	sub    $0x8,%esp
  100f24:	ff 75 08             	pushl  0x8(%ebp)
  100f27:	52                   	push   %edx
  100f28:	e8 67 fb ff ff       	call   100a94 <put_into_runnable>
  100f2d:	a1 04 33 10 00       	mov    0x103304,%eax
  100f32:	5a                   	pop    %edx
  100f33:	59                   	pop    %ecx
  100f34:	50                   	push   %eax
  100f35:	50                   	push   %eax
  100f36:	e8 4d fc ff ff       	call   100b88 <get_from>
  100f3b:	83 c4 10             	add    $0x10,%esp
  100f3e:	39 05 a0 3c 10 00    	cmp    %eax,0x103ca0
  100f44:	74 be                	je     100f04 <checkTimeCount+0x7c>
  100f46:	a3 a0 3c 10 00       	mov    %eax,0x103ca0
  100f4b:	83 ec 08             	sub    $0x8,%esp
  100f4e:	89 c2                	mov    %eax,%edx
  100f50:	c1 e2 07             	shl    $0x7,%edx
  100f53:	01 c2                	add    %eax,%edx
  100f55:	01 d2                	add    %edx,%edx
  100f57:	01 c2                	add    %eax,%edx
  100f59:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100f5c:	8d 04 c5 bc 5c 10 00 	lea    0x105cbc(,%eax,8),%eax
  100f63:	50                   	push   %eax
  100f64:	6a 10                	push   $0x10
  100f66:	e8 49 f2 ff ff       	call   1001b4 <change_tss>
  100f6b:	83 c4 10             	add    $0x10,%esp
  100f6e:	b8 01 00 00 00       	mov    $0x1,%eax
  100f73:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100f76:	5e                   	pop    %esi
  100f77:	5f                   	pop    %edi
  100f78:	5d                   	pop    %ebp
  100f79:	c3                   	ret    
  100f7a:	66 90                	xchg   %ax,%ax

00100f7c <check_is_in>:
  100f7c:	55                   	push   %ebp
  100f7d:	89 e5                	mov    %esp,%ebp
  100f7f:	53                   	push   %ebx
  100f80:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100f83:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100f86:	39 d9                	cmp    %ebx,%ecx
  100f88:	74 3b                	je     100fc5 <check_is_in+0x49>
  100f8a:	89 c8                	mov    %ecx,%eax
  100f8c:	c1 e0 07             	shl    $0x7,%eax
  100f8f:	01 c8                	add    %ecx,%eax
  100f91:	01 c0                	add    %eax,%eax
  100f93:	01 c8                	add    %ecx,%eax
  100f95:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100f98:	8b 14 c5 20 5d 10 00 	mov    0x105d20(,%eax,8),%edx
  100f9f:	39 d1                	cmp    %edx,%ecx
  100fa1:	75 1e                	jne    100fc1 <check_is_in+0x45>
  100fa3:	eb 2b                	jmp    100fd0 <check_is_in+0x54>
  100fa5:	8d 76 00             	lea    0x0(%esi),%esi
  100fa8:	89 d0                	mov    %edx,%eax
  100faa:	c1 e0 07             	shl    $0x7,%eax
  100fad:	01 d0                	add    %edx,%eax
  100faf:	01 c0                	add    %eax,%eax
  100fb1:	01 d0                	add    %edx,%eax
  100fb3:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100fb6:	8b 14 c5 20 5d 10 00 	mov    0x105d20(,%eax,8),%edx
  100fbd:	39 d1                	cmp    %edx,%ecx
  100fbf:	74 0f                	je     100fd0 <check_is_in+0x54>
  100fc1:	39 d3                	cmp    %edx,%ebx
  100fc3:	75 e3                	jne    100fa8 <check_is_in+0x2c>
  100fc5:	b8 01 00 00 00       	mov    $0x1,%eax
  100fca:	5b                   	pop    %ebx
  100fcb:	5d                   	pop    %ebp
  100fcc:	c3                   	ret    
  100fcd:	8d 76 00             	lea    0x0(%esi),%esi
  100fd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100fd5:	5b                   	pop    %ebx
  100fd6:	5d                   	pop    %ebp
  100fd7:	c3                   	ret    

00100fd8 <block_decrease>:
  100fd8:	55                   	push   %ebp
  100fd9:	89 e5                	mov    %esp,%ebp
  100fdb:	8b 0d 00 33 10 00    	mov    0x103300,%ecx
  100fe1:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100fe4:	74 2e                	je     101014 <block_decrease+0x3c>
  100fe6:	89 ca                	mov    %ecx,%edx
  100fe8:	89 d0                	mov    %edx,%eax
  100fea:	c1 e0 07             	shl    $0x7,%eax
  100fed:	01 d0                	add    %edx,%eax
  100fef:	01 c0                	add    %eax,%eax
  100ff1:	01 d0                	add    %edx,%eax
  100ff3:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100ff6:	8d 04 c5 c0 3c 10 00 	lea    0x103cc0(,%eax,8),%eax
  100ffd:	ff 88 54 20 00 00    	decl   0x2054(%eax)
  101003:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  101009:	39 d1                	cmp    %edx,%ecx
  10100b:	75 db                	jne    100fe8 <block_decrease+0x10>
  10100d:	b8 01 00 00 00       	mov    $0x1,%eax
  101012:	5d                   	pop    %ebp
  101013:	c3                   	ret    
  101014:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101019:	5d                   	pop    %ebp
  10101a:	c3                   	ret    
  10101b:	90                   	nop

0010101c <init_pcb>:
  10101c:	55                   	push   %ebp
  10101d:	89 e5                	mov    %esp,%ebp
  10101f:	c7 05 a8 3c 10 00 05 	movl   $0x5,0x103ca8
  101026:	00 00 00 
  101029:	ba 18 5d 10 00       	mov    $0x105d18,%edx
  10102e:	31 c0                	xor    %eax,%eax
  101030:	89 02                	mov    %eax,(%edx)
  101032:	8d 48 ff             	lea    -0x1(%eax),%ecx
  101035:	89 4a 04             	mov    %ecx,0x4(%edx)
  101038:	40                   	inc    %eax
  101039:	89 42 08             	mov    %eax,0x8(%edx)
  10103c:	c7 42 f4 03 00 00 00 	movl   $0x3,-0xc(%edx)
  101043:	81 c2 68 20 00 00    	add    $0x2068,%edx
  101049:	3d 00 08 00 00       	cmp    $0x800,%eax
  10104e:	75 e0                	jne    101030 <init_pcb+0x14>
  101050:	c7 05 1c 5d 10 00 ff 	movl   $0x7ff,0x105d1c
  101057:	07 00 00 
  10105a:	c7 05 b8 7c 13 01 00 	movl   $0x0,0x1137cb8
  101061:	00 00 00 
  101064:	5d                   	pop    %ebp
  101065:	c3                   	ret    
  101066:	66 90                	xchg   %ax,%ax

00101068 <init_kernel_pcb>:
  101068:	55                   	push   %ebp
  101069:	89 e5                	mov    %esp,%ebp
  10106b:	83 ec 10             	sub    $0x10,%esp
  10106e:	a1 30 34 10 00       	mov    0x103430,%eax
  101073:	50                   	push   %eax
  101074:	50                   	push   %eax
  101075:	e8 0e fb ff ff       	call   100b88 <get_from>
  10107a:	83 c4 10             	add    $0x10,%esp
  10107d:	85 c0                	test   %eax,%eax
  10107f:	74 15                	je     101096 <init_kernel_pcb+0x2e>
  101081:	83 ec 08             	sub    $0x8,%esp
  101084:	68 fc 00 00 00       	push   $0xfc
  101089:	68 62 19 10 00       	push   $0x101962
  10108e:	e8 41 07 00 00       	call   1017d4 <abort>
  101093:	83 c4 10             	add    $0x10,%esp
  101096:	c7 05 08 5d 10 00 10 	movl   $0x10,0x105d08
  10109d:	00 00 00 
  1010a0:	c7 05 fc 5c 10 00 08 	movl   $0x8,0x105cfc
  1010a7:	00 00 00 
  1010aa:	c7 05 cc 5c 10 00 10 	movl   $0x10,0x105ccc
  1010b1:	00 00 00 
  1010b4:	c7 05 c8 5c 10 00 10 	movl   $0x10,0x105cc8
  1010bb:	00 00 00 
  1010be:	c7 05 f8 5c 10 00 20 	movl   $0x100920,0x105cf8
  1010c5:	09 10 00 
  1010c8:	c7 05 04 5d 10 00 00 	movl   $0x400000,0x105d04
  1010cf:	00 40 00 
  1010d2:	c7 05 0c 5d 10 00 01 	movl   $0x1,0x105d0c
  1010d9:	00 00 00 
  1010dc:	c7 05 10 5d 10 00 04 	movl   $0x4,0x105d10
  1010e3:	00 00 00 
  1010e6:	b8 01 00 00 00       	mov    $0x1,%eax
  1010eb:	c9                   	leave  
  1010ec:	c3                   	ret    
  1010ed:	8d 76 00             	lea    0x0(%esi),%esi

001010f0 <make_pcb>:
  1010f0:	55                   	push   %ebp
  1010f1:	89 e5                	mov    %esp,%ebp
  1010f3:	57                   	push   %edi
  1010f4:	56                   	push   %esi
  1010f5:	8b 55 08             	mov    0x8(%ebp),%edx
  1010f8:	89 d0                	mov    %edx,%eax
  1010fa:	c1 e0 07             	shl    $0x7,%eax
  1010fd:	01 d0                	add    %edx,%eax
  1010ff:	01 c0                	add    %eax,%eax
  101101:	01 d0                	add    %edx,%eax
  101103:	8d 14 82             	lea    (%edx,%eax,4),%edx
  101106:	c1 e2 03             	shl    $0x3,%edx
  101109:	8d 82 c0 5c 10 00    	lea    0x105cc0(%edx),%eax
  10110f:	b9 13 00 00 00       	mov    $0x13,%ecx
  101114:	89 c7                	mov    %eax,%edi
  101116:	8b 75 0c             	mov    0xc(%ebp),%esi
  101119:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10111b:	8b 45 10             	mov    0x10(%ebp),%eax
  10111e:	89 82 0c 5d 10 00    	mov    %eax,0x105d0c(%edx)
  101124:	8b 45 14             	mov    0x14(%ebp),%eax
  101127:	89 82 10 5d 10 00    	mov    %eax,0x105d10(%edx)
  10112d:	8b 45 18             	mov    0x18(%ebp),%eax
  101130:	89 82 14 5d 10 00    	mov    %eax,0x105d14(%edx)
  101136:	8b 45 0c             	mov    0xc(%ebp),%eax
  101139:	89 82 24 5d 10 00    	mov    %eax,0x105d24(%edx)
  10113f:	b8 01 00 00 00       	mov    $0x1,%eax
  101144:	5e                   	pop    %esi
  101145:	5f                   	pop    %edi
  101146:	5d                   	pop    %ebp
  101147:	c3                   	ret    

00101148 <initIdt>:
  101148:	55                   	push   %ebp
  101149:	89 e5                	mov    %esp,%ebp
  10114b:	53                   	push   %ebx
  10114c:	ba 6b 18 10 00       	mov    $0x10186b,%edx
  101151:	89 d3                	mov    %edx,%ebx
  101153:	c1 ea 10             	shr    $0x10,%edx
  101156:	b9 a0 85 13 01       	mov    $0x11385a0,%ecx
  10115b:	b8 a0 7d 13 01       	mov    $0x1137da0,%eax
  101160:	66 89 18             	mov    %bx,(%eax)
  101163:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  101169:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  10116d:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  101171:	66 89 50 06          	mov    %dx,0x6(%eax)
  101175:	83 c0 08             	add    $0x8,%eax
  101178:	39 c1                	cmp    %eax,%ecx
  10117a:	75 e4                	jne    101160 <initIdt+0x18>
  10117c:	b8 71 18 10 00       	mov    $0x101871,%eax
  101181:	66 a3 08 7e 13 01    	mov    %ax,0x1137e08
  101187:	66 c7 05 0a 7e 13 01 	movw   $0x8,0x1137e0a
  10118e:	08 00 
  101190:	c6 05 0c 7e 13 01 00 	movb   $0x0,0x1137e0c
  101197:	c6 05 0d 7e 13 01 8f 	movb   $0x8f,0x1137e0d
  10119e:	c1 e8 10             	shr    $0x10,%eax
  1011a1:	66 a3 0e 7e 13 01    	mov    %ax,0x1137e0e
  1011a7:	b8 75 18 10 00       	mov    $0x101875,%eax
  1011ac:	66 a3 a0 81 13 01    	mov    %ax,0x11381a0
  1011b2:	66 c7 05 a2 81 13 01 	movw   $0x8,0x11381a2
  1011b9:	08 00 
  1011bb:	c6 05 a4 81 13 01 00 	movb   $0x0,0x11381a4
  1011c2:	c6 05 a5 81 13 01 ee 	movb   $0xee,0x11381a5
  1011c9:	c1 e8 10             	shr    $0x10,%eax
  1011cc:	66 a3 a6 81 13 01    	mov    %ax,0x11381a6
  1011d2:	b8 7e 18 10 00       	mov    $0x10187e,%eax
  1011d7:	66 a3 a0 7e 13 01    	mov    %ax,0x1137ea0
  1011dd:	66 c7 05 a2 7e 13 01 	movw   $0x8,0x1137ea2
  1011e4:	08 00 
  1011e6:	c6 05 a4 7e 13 01 00 	movb   $0x0,0x1137ea4
  1011ed:	c6 05 a5 7e 13 01 8e 	movb   $0x8e,0x1137ea5
  1011f4:	c1 e8 10             	shr    $0x10,%eax
  1011f7:	66 a3 a6 7e 13 01    	mov    %ax,0x1137ea6
  1011fd:	66 c7 05 34 34 10 00 	movw   $0x7ff,0x103434
  101204:	ff 07 
  101206:	b8 a0 7d 13 01       	mov    $0x1137da0,%eax
  10120b:	66 a3 36 34 10 00    	mov    %ax,0x103436
  101211:	c1 e8 10             	shr    $0x10,%eax
  101214:	66 a3 38 34 10 00    	mov    %ax,0x103438
  10121a:	b8 34 34 10 00       	mov    $0x103434,%eax
  10121f:	0f 01 18             	lidtl  (%eax)
  101222:	5b                   	pop    %ebx
  101223:	5d                   	pop    %ebp
  101224:	c3                   	ret    
  101225:	66 90                	xchg   %ax,%ax
  101227:	90                   	nop

00101228 <syscallHandle>:
  101228:	55                   	push   %ebp
  101229:	89 e5                	mov    %esp,%ebp
  10122b:	53                   	push   %ebx
  10122c:	50                   	push   %eax
  10122d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101230:	8b 43 2c             	mov    0x2c(%ebx),%eax
  101233:	83 f8 04             	cmp    $0x4,%eax
  101236:	74 58                	je     101290 <syscallHandle+0x68>
  101238:	77 1e                	ja     101258 <syscallHandle+0x30>
  10123a:	83 f8 01             	cmp    $0x1,%eax
  10123d:	74 45                	je     101284 <syscallHandle+0x5c>
  10123f:	83 f8 02             	cmp    $0x2,%eax
  101242:	75 0f                	jne    101253 <syscallHandle+0x2b>
  101244:	83 ec 0c             	sub    $0xc,%esp
  101247:	53                   	push   %ebx
  101248:	e8 4b f4 ff ff       	call   100698 <sys_fork>
  10124d:	89 43 2c             	mov    %eax,0x2c(%ebx)
  101250:	83 c4 10             	add    $0x10,%esp
  101253:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101256:	c9                   	leave  
  101257:	c3                   	ret    
  101258:	83 f8 07             	cmp    $0x7,%eax
  10125b:	74 13                	je     101270 <syscallHandle+0x48>
  10125d:	3d e6 00 00 00       	cmp    $0xe6,%eax
  101262:	75 ef                	jne    101253 <syscallHandle+0x2b>
  101264:	89 5d 08             	mov    %ebx,0x8(%ebp)
  101267:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10126a:	c9                   	leave  
  10126b:	e9 a4 f3 ff ff       	jmp    100614 <sys_sleep>
  101270:	83 ec 0c             	sub    $0xc,%esp
  101273:	53                   	push   %ebx
  101274:	e8 8f f3 ff ff       	call   100608 <sys_getpid>
  101279:	89 43 2c             	mov    %eax,0x2c(%ebx)
  10127c:	83 c4 10             	add    $0x10,%esp
  10127f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101282:	c9                   	leave  
  101283:	c3                   	ret    
  101284:	89 5d 08             	mov    %ebx,0x8(%ebp)
  101287:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10128a:	c9                   	leave  
  10128b:	e9 50 f3 ff ff       	jmp    1005e0 <sys_exit>
  101290:	89 5d 08             	mov    %ebx,0x8(%ebp)
  101293:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101296:	c9                   	leave  
  101297:	e9 d0 f5 ff ff       	jmp    10086c <sys_write>

0010129c <GProtectFaultHandle>:
  10129c:	55                   	push   %ebp
  10129d:	89 e5                	mov    %esp,%ebp
  10129f:	83 ec 14             	sub    $0x14,%esp
  1012a2:	68 a0 18 10 00       	push   $0x1018a0
  1012a7:	e8 b4 03 00 00       	call   101660 <printk>
  1012ac:	58                   	pop    %eax
  1012ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1012b0:	ff 70 30             	pushl  0x30(%eax)
  1012b3:	68 b8 1a 10 00       	push   $0x101ab8
  1012b8:	6a 6b                	push   $0x6b
  1012ba:	68 47 1a 10 00       	push   $0x101a47
  1012bf:	68 5a 1a 10 00       	push   $0x101a5a
  1012c4:	e8 97 03 00 00       	call   101660 <printk>
  1012c9:	83 c4 14             	add    $0x14,%esp
  1012cc:	68 cf 18 10 00       	push   $0x1018cf
  1012d1:	e8 8a 03 00 00       	call   101660 <printk>
  1012d6:	5a                   	pop    %edx
  1012d7:	59                   	pop    %ecx
  1012d8:	6a 6c                	push   $0x6c
  1012da:	68 47 1a 10 00       	push   $0x101a47
  1012df:	e8 f0 04 00 00       	call   1017d4 <abort>
  1012e4:	83 c4 10             	add    $0x10,%esp
  1012e7:	c9                   	leave  
  1012e8:	c3                   	ret    
  1012e9:	8d 76 00             	lea    0x0(%esi),%esi

001012ec <timeHandle>:
  1012ec:	55                   	push   %ebp
  1012ed:	89 e5                	mov    %esp,%ebp
  1012ef:	53                   	push   %ebx
  1012f0:	83 ec 10             	sub    $0x10,%esp
  1012f3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1012f6:	6a 41                	push   $0x41
  1012f8:	e8 07 f6 ff ff       	call   100904 <putChar>
  1012fd:	e8 6a f6 ff ff       	call   10096c <getpid>
  101302:	89 c2                	mov    %eax,%edx
  101304:	c1 e2 07             	shl    $0x7,%edx
  101307:	01 c2                	add    %eax,%edx
  101309:	01 d2                	add    %edx,%edx
  10130b:	01 c2                	add    %eax,%edx
  10130d:	8d 04 90             	lea    (%eax,%edx,4),%eax
  101310:	ff 0c c5 10 5d 10 00 	decl   0x105d10(,%eax,8)
  101317:	e8 bc fc ff ff       	call   100fd8 <block_decrease>
  10131c:	89 1c 24             	mov    %ebx,(%esp)
  10131f:	e8 64 fb ff ff       	call   100e88 <checkTimeCount>
  101324:	83 c4 10             	add    $0x10,%esp
  101327:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  10132e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101331:	c9                   	leave  
  101332:	e9 cd f5 ff ff       	jmp    100904 <putChar>
  101337:	90                   	nop

00101338 <irqHandle>:
  101338:	55                   	push   %ebp
  101339:	89 e5                	mov    %esp,%ebp
  10133b:	57                   	push   %edi
  10133c:	56                   	push   %esi
  10133d:	53                   	push   %ebx
  10133e:	83 ec 0c             	sub    $0xc,%esp
  101341:	8b 7d 08             	mov    0x8(%ebp),%edi
  101344:	b8 10 00 00 00       	mov    $0x10,%eax
  101349:	89 c0                	mov    %eax,%eax
  10134b:	8e d8                	mov    %eax,%ds
  10134d:	8e e0                	mov    %eax,%fs
  10134f:	8e c0                	mov    %eax,%es
  101351:	b8 30 00 00 00       	mov    $0x30,%eax
  101356:	89 c0                	mov    %eax,%eax
  101358:	8e e8                	mov    %eax,%gs
  10135a:	89 ee                	mov    %ebp,%esi
  10135c:	3b 7e 08             	cmp    0x8(%esi),%edi
  10135f:	74 12                	je     101373 <irqHandle+0x3b>
  101361:	83 ec 08             	sub    $0x8,%esp
  101364:	6a 20                	push   $0x20
  101366:	68 47 1a 10 00       	push   $0x101a47
  10136b:	e8 64 04 00 00       	call   1017d4 <abort>
  101370:	83 c4 10             	add    $0x10,%esp
  101373:	8b 1d a0 3c 10 00    	mov    0x103ca0,%ebx
  101379:	fa                   	cli    
  10137a:	8b 47 30             	mov    0x30(%edi),%eax
  10137d:	83 f8 0d             	cmp    $0xd,%eax
  101380:	0f 84 46 01 00 00    	je     1014cc <irqHandle+0x194>
  101386:	0f 8e e8 00 00 00    	jle    101474 <irqHandle+0x13c>
  10138c:	83 f8 20             	cmp    $0x20,%eax
  10138f:	74 2f                	je     1013c0 <irqHandle+0x88>
  101391:	83 c0 80             	add    $0xffffff80,%eax
  101394:	0f 85 e1 00 00 00    	jne    10147b <irqHandle+0x143>
  10139a:	83 ec 0c             	sub    $0xc,%esp
  10139d:	57                   	push   %edi
  10139e:	e8 85 fe ff ff       	call   101228 <syscallHandle>
  1013a3:	8b 47 30             	mov    0x30(%edi),%eax
  1013a6:	83 c4 10             	add    $0x10,%esp
  1013a9:	3d 80 00 00 00       	cmp    $0x80,%eax
  1013ae:	74 28                	je     1013d8 <irqHandle+0xa0>
  1013b0:	83 f8 20             	cmp    $0x20,%eax
  1013b3:	74 23                	je     1013d8 <irqHandle+0xa0>
  1013b5:	fb                   	sti    
  1013b6:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1013b9:	5b                   	pop    %ebx
  1013ba:	5e                   	pop    %esi
  1013bb:	5f                   	pop    %edi
  1013bc:	5d                   	pop    %ebp
  1013bd:	c3                   	ret    
  1013be:	66 90                	xchg   %ax,%ax
  1013c0:	83 ec 0c             	sub    $0xc,%esp
  1013c3:	57                   	push   %edi
  1013c4:	e8 23 ff ff ff       	call   1012ec <timeHandle>
  1013c9:	8b 47 30             	mov    0x30(%edi),%eax
  1013cc:	83 c4 10             	add    $0x10,%esp
  1013cf:	3d 80 00 00 00       	cmp    $0x80,%eax
  1013d4:	75 da                	jne    1013b0 <irqHandle+0x78>
  1013d6:	66 90                	xchg   %ax,%ax
  1013d8:	8b 15 a0 3c 10 00    	mov    0x103ca0,%edx
  1013de:	39 d3                	cmp    %edx,%ebx
  1013e0:	74 d3                	je     1013b5 <irqHandle+0x7d>
  1013e2:	89 d0                	mov    %edx,%eax
  1013e4:	c1 e0 07             	shl    $0x7,%eax
  1013e7:	01 d0                	add    %edx,%eax
  1013e9:	01 c0                	add    %eax,%eax
  1013eb:	01 d0                	add    %edx,%eax
  1013ed:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1013f0:	8d 04 c5 70 5c 10 00 	lea    0x105c70(,%eax,8),%eax
  1013f7:	89 46 08             	mov    %eax,0x8(%esi)
  1013fa:	8b 0d a0 3c 10 00    	mov    0x103ca0,%ecx
  101400:	89 ca                	mov    %ecx,%edx
  101402:	c1 e2 07             	shl    $0x7,%edx
  101405:	01 ca                	add    %ecx,%edx
  101407:	01 d2                	add    %edx,%edx
  101409:	01 ca                	add    %ecx,%edx
  10140b:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  10140e:	8d 34 d5 c0 5c 10 00 	lea    0x105cc0(,%edx,8),%esi
  101415:	b9 13 00 00 00       	mov    $0x13,%ecx
  10141a:	89 c7                	mov    %eax,%edi
  10141c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10141e:	83 ec 0c             	sub    $0xc,%esp
  101421:	68 a0 18 10 00       	push   $0x1018a0
  101426:	e8 35 02 00 00       	call   101660 <printk>
  10142b:	58                   	pop    %eax
  10142c:	5a                   	pop    %edx
  10142d:	ff 35 a0 3c 10 00    	pushl  0x103ca0
  101433:	53                   	push   %ebx
  101434:	68 cc 1a 10 00       	push   $0x101acc
  101439:	6a 42                	push   $0x42
  10143b:	68 47 1a 10 00       	push   $0x101a47
  101440:	68 98 1a 10 00       	push   $0x101a98
  101445:	e8 16 02 00 00       	call   101660 <printk>
  10144a:	83 c4 14             	add    $0x14,%esp
  10144d:	68 cf 18 10 00       	push   $0x1018cf
  101452:	e8 09 02 00 00       	call   101660 <printk>
  101457:	59                   	pop    %ecx
  101458:	5b                   	pop    %ebx
  101459:	a1 a0 3c 10 00       	mov    0x103ca0,%eax
  10145e:	c1 e0 10             	shl    $0x10,%eax
  101461:	50                   	push   %eax
  101462:	6a 23                	push   $0x23
  101464:	e8 cb eb ff ff       	call   100034 <change_gdt>
  101469:	83 c4 10             	add    $0x10,%esp
  10146c:	e9 44 ff ff ff       	jmp    1013b5 <irqHandle+0x7d>
  101471:	8d 76 00             	lea    0x0(%esi),%esi
  101474:	40                   	inc    %eax
  101475:	0f 84 3a ff ff ff    	je     1013b5 <irqHandle+0x7d>
  10147b:	83 ec 0c             	sub    $0xc,%esp
  10147e:	68 a0 18 10 00       	push   $0x1018a0
  101483:	e8 d8 01 00 00       	call   101660 <printk>
  101488:	58                   	pop    %eax
  101489:	5a                   	pop    %edx
  10148a:	ff 77 38             	pushl  0x38(%edi)
  10148d:	ff 77 30             	pushl  0x30(%edi)
  101490:	68 cc 1a 10 00       	push   $0x101acc
  101495:	6a 36                	push   $0x36
  101497:	68 47 1a 10 00       	push   $0x101a47
  10149c:	68 70 1a 10 00       	push   $0x101a70
  1014a1:	e8 ba 01 00 00       	call   101660 <printk>
  1014a6:	83 c4 14             	add    $0x14,%esp
  1014a9:	68 cf 18 10 00       	push   $0x1018cf
  1014ae:	e8 ad 01 00 00       	call   101660 <printk>
  1014b3:	59                   	pop    %ecx
  1014b4:	58                   	pop    %eax
  1014b5:	6a 37                	push   $0x37
  1014b7:	68 47 1a 10 00       	push   $0x101a47
  1014bc:	e8 13 03 00 00       	call   1017d4 <abort>
  1014c1:	8b 47 30             	mov    0x30(%edi),%eax
  1014c4:	83 c4 10             	add    $0x10,%esp
  1014c7:	e9 dd fe ff ff       	jmp    1013a9 <irqHandle+0x71>
  1014cc:	83 ec 0c             	sub    $0xc,%esp
  1014cf:	57                   	push   %edi
  1014d0:	e8 c7 fd ff ff       	call   10129c <GProtectFaultHandle>
  1014d5:	8b 47 30             	mov    0x30(%edi),%eax
  1014d8:	83 c4 10             	add    $0x10,%esp
  1014db:	e9 c9 fe ff ff       	jmp    1013a9 <irqHandle+0x71>

001014e0 <initIntr>:
  1014e0:	55                   	push   %ebp
  1014e1:	89 e5                	mov    %esp,%ebp
  1014e3:	ba 21 00 00 00       	mov    $0x21,%edx
  1014e8:	b0 ff                	mov    $0xff,%al
  1014ea:	ee                   	out    %al,(%dx)
  1014eb:	ba a1 00 00 00       	mov    $0xa1,%edx
  1014f0:	ee                   	out    %al,(%dx)
  1014f1:	ba 20 00 00 00       	mov    $0x20,%edx
  1014f6:	b0 11                	mov    $0x11,%al
  1014f8:	ee                   	out    %al,(%dx)
  1014f9:	ba 21 00 00 00       	mov    $0x21,%edx
  1014fe:	b0 20                	mov    $0x20,%al
  101500:	ee                   	out    %al,(%dx)
  101501:	b0 04                	mov    $0x4,%al
  101503:	ee                   	out    %al,(%dx)
  101504:	b0 03                	mov    $0x3,%al
  101506:	ee                   	out    %al,(%dx)
  101507:	ba a0 00 00 00       	mov    $0xa0,%edx
  10150c:	b0 11                	mov    $0x11,%al
  10150e:	ee                   	out    %al,(%dx)
  10150f:	ba a1 00 00 00       	mov    $0xa1,%edx
  101514:	b0 28                	mov    $0x28,%al
  101516:	ee                   	out    %al,(%dx)
  101517:	b0 02                	mov    $0x2,%al
  101519:	ee                   	out    %al,(%dx)
  10151a:	b0 03                	mov    $0x3,%al
  10151c:	ee                   	out    %al,(%dx)
  10151d:	ba 20 00 00 00       	mov    $0x20,%edx
  101522:	b0 68                	mov    $0x68,%al
  101524:	ee                   	out    %al,(%dx)
  101525:	b0 0a                	mov    $0xa,%al
  101527:	ee                   	out    %al,(%dx)
  101528:	ba a0 00 00 00       	mov    $0xa0,%edx
  10152d:	b0 68                	mov    $0x68,%al
  10152f:	ee                   	out    %al,(%dx)
  101530:	b0 0a                	mov    $0xa,%al
  101532:	ee                   	out    %al,(%dx)
  101533:	5d                   	pop    %ebp
  101534:	c3                   	ret    
  101535:	8d 76 00             	lea    0x0(%esi),%esi

00101538 <initTimer>:
  101538:	55                   	push   %ebp
  101539:	89 e5                	mov    %esp,%ebp
  10153b:	ba 43 00 00 00       	mov    $0x43,%edx
  101540:	b0 34                	mov    $0x34,%al
  101542:	ee                   	out    %al,(%dx)
  101543:	ba 40 00 00 00       	mov    $0x40,%edx
  101548:	b0 9b                	mov    $0x9b,%al
  10154a:	ee                   	out    %al,(%dx)
  10154b:	b0 2e                	mov    $0x2e,%al
  10154d:	ee                   	out    %al,(%dx)
  10154e:	5d                   	pop    %ebp
  10154f:	c3                   	ret    

00101550 <i2A>:
  101550:	55                   	push   %ebp
  101551:	89 e5                	mov    %esp,%ebp
  101553:	57                   	push   %edi
  101554:	56                   	push   %esi
  101555:	53                   	push   %ebx
  101556:	51                   	push   %ecx
  101557:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10155a:	85 c9                	test   %ecx,%ecx
  10155c:	78 6e                	js     1015cc <i2A+0x7c>
  10155e:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  101562:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  101566:	bb 7e 34 10 00       	mov    $0x10347e,%ebx
  10156b:	31 ff                	xor    %edi,%edi
  10156d:	eb 03                	jmp    101572 <i2A+0x22>
  10156f:	90                   	nop
  101570:	89 f7                	mov    %esi,%edi
  101572:	4b                   	dec    %ebx
  101573:	89 c8                	mov    %ecx,%eax
  101575:	be 0a 00 00 00       	mov    $0xa,%esi
  10157a:	99                   	cltd   
  10157b:	f7 fe                	idiv   %esi
  10157d:	83 c2 30             	add    $0x30,%edx
  101580:	88 13                	mov    %dl,(%ebx)
  101582:	8d 77 01             	lea    0x1(%edi),%esi
  101585:	b8 67 66 66 66       	mov    $0x66666667,%eax
  10158a:	f7 e9                	imul   %ecx
  10158c:	89 d0                	mov    %edx,%eax
  10158e:	c1 f8 02             	sar    $0x2,%eax
  101591:	c1 f9 1f             	sar    $0x1f,%ecx
  101594:	29 c8                	sub    %ecx,%eax
  101596:	89 c1                	mov    %eax,%ecx
  101598:	75 d6                	jne    101570 <i2A+0x20>
  10159a:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  10159e:	74 20                	je     1015c0 <i2A+0x70>
  1015a0:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  1015a4:	75 06                	jne    1015ac <i2A+0x5c>
  1015a6:	fe 05 7d 34 10 00    	incb   0x10347d
  1015ac:	c6 05 7e 34 10 00 00 	movb   $0x0,0x10347e
  1015b3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1015b6:	89 18                	mov    %ebx,(%eax)
  1015b8:	89 f0                	mov    %esi,%eax
  1015ba:	5a                   	pop    %edx
  1015bb:	5b                   	pop    %ebx
  1015bc:	5e                   	pop    %esi
  1015bd:	5f                   	pop    %edi
  1015be:	5d                   	pop    %ebp
  1015bf:	c3                   	ret    
  1015c0:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  1015c4:	8d 77 02             	lea    0x2(%edi),%esi
  1015c7:	4b                   	dec    %ebx
  1015c8:	eb d6                	jmp    1015a0 <i2A+0x50>
  1015ca:	66 90                	xchg   %ax,%ax
  1015cc:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  1015d2:	74 0c                	je     1015e0 <i2A+0x90>
  1015d4:	f7 d9                	neg    %ecx
  1015d6:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  1015da:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  1015de:	eb 86                	jmp    101566 <i2A+0x16>
  1015e0:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  1015e5:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  1015e9:	eb ef                	jmp    1015da <i2A+0x8a>
  1015eb:	90                   	nop

001015ec <i2X>:
  1015ec:	55                   	push   %ebp
  1015ed:	89 e5                	mov    %esp,%ebp
  1015ef:	57                   	push   %edi
  1015f0:	56                   	push   %esi
  1015f1:	53                   	push   %ebx
  1015f2:	8b 55 08             	mov    0x8(%ebp),%edx
  1015f5:	b9 5d 34 10 00       	mov    $0x10345d,%ecx
  1015fa:	31 c0                	xor    %eax,%eax
  1015fc:	40                   	inc    %eax
  1015fd:	89 d6                	mov    %edx,%esi
  1015ff:	83 e6 0f             	and    $0xf,%esi
  101602:	8d 5e f6             	lea    -0xa(%esi),%ebx
  101605:	89 cf                	mov    %ecx,%edi
  101607:	83 fb 05             	cmp    $0x5,%ebx
  10160a:	77 4c                	ja     101658 <i2X+0x6c>
  10160c:	ff 24 9d d8 1a 10 00 	jmp    *0x101ad8(,%ebx,4)
  101613:	90                   	nop
  101614:	c6 01 65             	movb   $0x65,(%ecx)
  101617:	90                   	nop
  101618:	49                   	dec    %ecx
  101619:	c1 ea 04             	shr    $0x4,%edx
  10161c:	75 de                	jne    1015fc <i2X+0x10>
  10161e:	c6 05 5e 34 10 00 00 	movb   $0x0,0x10345e
  101625:	8b 55 0c             	mov    0xc(%ebp),%edx
  101628:	89 3a                	mov    %edi,(%edx)
  10162a:	5b                   	pop    %ebx
  10162b:	5e                   	pop    %esi
  10162c:	5f                   	pop    %edi
  10162d:	5d                   	pop    %ebp
  10162e:	c3                   	ret    
  10162f:	90                   	nop
  101630:	c6 01 64             	movb   $0x64,(%ecx)
  101633:	eb e3                	jmp    101618 <i2X+0x2c>
  101635:	8d 76 00             	lea    0x0(%esi),%esi
  101638:	c6 01 63             	movb   $0x63,(%ecx)
  10163b:	eb db                	jmp    101618 <i2X+0x2c>
  10163d:	8d 76 00             	lea    0x0(%esi),%esi
  101640:	c6 01 62             	movb   $0x62,(%ecx)
  101643:	eb d3                	jmp    101618 <i2X+0x2c>
  101645:	8d 76 00             	lea    0x0(%esi),%esi
  101648:	c6 01 61             	movb   $0x61,(%ecx)
  10164b:	eb cb                	jmp    101618 <i2X+0x2c>
  10164d:	8d 76 00             	lea    0x0(%esi),%esi
  101650:	c6 01 66             	movb   $0x66,(%ecx)
  101653:	eb c3                	jmp    101618 <i2X+0x2c>
  101655:	8d 76 00             	lea    0x0(%esi),%esi
  101658:	8d 5e 30             	lea    0x30(%esi),%ebx
  10165b:	88 19                	mov    %bl,(%ecx)
  10165d:	eb b9                	jmp    101618 <i2X+0x2c>
  10165f:	90                   	nop

00101660 <printk>:
  101660:	55                   	push   %ebp
  101661:	89 e5                	mov    %esp,%ebp
  101663:	57                   	push   %edi
  101664:	56                   	push   %esi
  101665:	53                   	push   %ebx
  101666:	83 ec 2c             	sub    $0x2c,%esp
  101669:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10166c:	8a 11                	mov    (%ecx),%dl
  10166e:	84 d2                	test   %dl,%dl
  101670:	0f 84 54 01 00 00    	je     1017ca <printk+0x16a>
  101676:	8d 45 0c             	lea    0xc(%ebp),%eax
  101679:	31 ff                	xor    %edi,%edi
  10167b:	eb 18                	jmp    101695 <printk+0x35>
  10167d:	8d 76 00             	lea    0x0(%esi),%esi
  101680:	8a 11                	mov    (%ecx),%dl
  101682:	89 cb                	mov    %ecx,%ebx
  101684:	88 97 80 34 10 00    	mov    %dl,0x103480(%edi)
  10168a:	47                   	inc    %edi
  10168b:	8d 4b 01             	lea    0x1(%ebx),%ecx
  10168e:	8a 53 01             	mov    0x1(%ebx),%dl
  101691:	84 d2                	test   %dl,%dl
  101693:	74 72                	je     101707 <printk+0xa7>
  101695:	80 fa 25             	cmp    $0x25,%dl
  101698:	75 e6                	jne    101680 <printk+0x20>
  10169a:	8d 59 01             	lea    0x1(%ecx),%ebx
  10169d:	8a 51 01             	mov    0x1(%ecx),%dl
  1016a0:	80 fa 64             	cmp    $0x64,%dl
  1016a3:	0f 84 bf 00 00 00    	je     101768 <printk+0x108>
  1016a9:	0f 8e 01 01 00 00    	jle    1017b0 <printk+0x150>
  1016af:	80 fa 73             	cmp    $0x73,%dl
  1016b2:	0f 84 84 00 00 00    	je     10173c <printk+0xdc>
  1016b8:	80 fa 78             	cmp    $0x78,%dl
  1016bb:	75 c7                	jne    101684 <printk+0x24>
  1016bd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1016c4:	8d 70 04             	lea    0x4(%eax),%esi
  1016c7:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1016ca:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  1016cd:	56                   	push   %esi
  1016ce:	ff 30                	pushl  (%eax)
  1016d0:	e8 17 ff ff ff       	call   1015ec <i2X>
  1016d5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1016d8:	8d b7 80 34 10 00    	lea    0x103480(%edi),%esi
  1016de:	8a 11                	mov    (%ecx),%dl
  1016e0:	83 c4 08             	add    $0x8,%esp
  1016e3:	31 c0                	xor    %eax,%eax
  1016e5:	84 d2                	test   %dl,%dl
  1016e7:	74 0f                	je     1016f8 <printk+0x98>
  1016e9:	8d 76 00             	lea    0x0(%esi),%esi
  1016ec:	40                   	inc    %eax
  1016ed:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1016f1:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  1016f4:	84 d2                	test   %dl,%dl
  1016f6:	75 f4                	jne    1016ec <printk+0x8c>
  1016f8:	01 c7                	add    %eax,%edi
  1016fa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1016fd:	8d 4b 01             	lea    0x1(%ebx),%ecx
  101700:	8a 53 01             	mov    0x1(%ebx),%dl
  101703:	84 d2                	test   %dl,%dl
  101705:	75 8e                	jne    101695 <printk+0x35>
  101707:	c6 87 80 34 10 00 00 	movb   $0x0,0x103480(%edi)
  10170e:	0f be 05 80 34 10 00 	movsbl 0x103480,%eax
  101715:	bb 80 34 10 00       	mov    $0x103480,%ebx
  10171a:	84 c0                	test   %al,%al
  10171c:	74 16                	je     101734 <printk+0xd4>
  10171e:	66 90                	xchg   %ax,%ax
  101720:	83 ec 0c             	sub    $0xc,%esp
  101723:	50                   	push   %eax
  101724:	e8 db f1 ff ff       	call   100904 <putChar>
  101729:	43                   	inc    %ebx
  10172a:	0f be 03             	movsbl (%ebx),%eax
  10172d:	83 c4 10             	add    $0x10,%esp
  101730:	84 c0                	test   %al,%al
  101732:	75 ec                	jne    101720 <printk+0xc0>
  101734:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101737:	5b                   	pop    %ebx
  101738:	5e                   	pop    %esi
  101739:	5f                   	pop    %edi
  10173a:	5d                   	pop    %ebp
  10173b:	c3                   	ret    
  10173c:	8d 70 04             	lea    0x4(%eax),%esi
  10173f:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101742:	8b 08                	mov    (%eax),%ecx
  101744:	8d b7 80 34 10 00    	lea    0x103480(%edi),%esi
  10174a:	8a 11                	mov    (%ecx),%dl
  10174c:	31 c0                	xor    %eax,%eax
  10174e:	84 d2                	test   %dl,%dl
  101750:	74 a6                	je     1016f8 <printk+0x98>
  101752:	66 90                	xchg   %ax,%ax
  101754:	40                   	inc    %eax
  101755:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101759:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  10175c:	84 d2                	test   %dl,%dl
  10175e:	75 f4                	jne    101754 <printk+0xf4>
  101760:	01 c7                	add    %eax,%edi
  101762:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101765:	eb 96                	jmp    1016fd <printk+0x9d>
  101767:	90                   	nop
  101768:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10176f:	8d 70 04             	lea    0x4(%eax),%esi
  101772:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101775:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101778:	56                   	push   %esi
  101779:	ff 30                	pushl  (%eax)
  10177b:	e8 d0 fd ff ff       	call   101550 <i2A>
  101780:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  101783:	8d b7 80 34 10 00    	lea    0x103480(%edi),%esi
  101789:	8a 11                	mov    (%ecx),%dl
  10178b:	83 c4 08             	add    $0x8,%esp
  10178e:	31 c0                	xor    %eax,%eax
  101790:	84 d2                	test   %dl,%dl
  101792:	0f 84 60 ff ff ff    	je     1016f8 <printk+0x98>
  101798:	40                   	inc    %eax
  101799:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  10179d:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  1017a0:	84 d2                	test   %dl,%dl
  1017a2:	75 f4                	jne    101798 <printk+0x138>
  1017a4:	01 c7                	add    %eax,%edi
  1017a6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1017a9:	e9 4f ff ff ff       	jmp    1016fd <printk+0x9d>
  1017ae:	66 90                	xchg   %ax,%ax
  1017b0:	80 fa 63             	cmp    $0x63,%dl
  1017b3:	0f 85 cb fe ff ff    	jne    101684 <printk+0x24>
  1017b9:	8b 10                	mov    (%eax),%edx
  1017bb:	88 97 80 34 10 00    	mov    %dl,0x103480(%edi)
  1017c1:	83 c0 04             	add    $0x4,%eax
  1017c4:	47                   	inc    %edi
  1017c5:	e9 c1 fe ff ff       	jmp    10168b <printk+0x2b>
  1017ca:	31 ff                	xor    %edi,%edi
  1017cc:	e9 36 ff ff ff       	jmp    101707 <printk+0xa7>
  1017d1:	66 90                	xchg   %ax,%ax
  1017d3:	90                   	nop

001017d4 <abort>:
  1017d4:	55                   	push   %ebp
  1017d5:	89 e5                	mov    %esp,%ebp
  1017d7:	57                   	push   %edi
  1017d8:	56                   	push   %esi
  1017d9:	53                   	push   %ebx
  1017da:	83 ec 1c             	sub    $0x1c,%esp
  1017dd:	8b 55 08             	mov    0x8(%ebp),%edx
  1017e0:	fa                   	cli    
  1017e1:	8a 02                	mov    (%edx),%al
  1017e3:	b9 32 33 10 00       	mov    $0x103332,%ecx
  1017e8:	84 c0                	test   %al,%al
  1017ea:	74 0b                	je     1017f7 <abort+0x23>
  1017ec:	41                   	inc    %ecx
  1017ed:	42                   	inc    %edx
  1017ee:	88 41 ff             	mov    %al,-0x1(%ecx)
  1017f1:	8a 02                	mov    (%edx),%al
  1017f3:	84 c0                	test   %al,%al
  1017f5:	75 f5                	jne    1017ec <abort+0x18>
  1017f7:	c6 01 3a             	movb   $0x3a,(%ecx)
  1017fa:	bb 9d 3c 10 00       	mov    $0x103c9d,%ebx
  1017ff:	be 0a 00 00 00       	mov    $0xa,%esi
  101804:	bf 67 66 66 66       	mov    $0x66666667,%edi
  101809:	4b                   	dec    %ebx
  10180a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10180d:	99                   	cltd   
  10180e:	f7 fe                	idiv   %esi
  101810:	8d 42 30             	lea    0x30(%edx),%eax
  101813:	88 45 e7             	mov    %al,-0x19(%ebp)
  101816:	88 03                	mov    %al,(%ebx)
  101818:	89 f8                	mov    %edi,%eax
  10181a:	f7 6d 0c             	imull  0xc(%ebp)
  10181d:	c1 fa 02             	sar    $0x2,%edx
  101820:	8b 45 0c             	mov    0xc(%ebp),%eax
  101823:	c1 f8 1f             	sar    $0x1f,%eax
  101826:	29 c2                	sub    %eax,%edx
  101828:	89 55 0c             	mov    %edx,0xc(%ebp)
  10182b:	75 dc                	jne    101809 <abort+0x35>
  10182d:	41                   	inc    %ecx
  10182e:	41                   	inc    %ecx
  10182f:	43                   	inc    %ebx
  101830:	8a 45 e7             	mov    -0x19(%ebp),%al
  101833:	88 41 ff             	mov    %al,-0x1(%ecx)
  101836:	8a 03                	mov    (%ebx),%al
  101838:	88 45 e7             	mov    %al,-0x19(%ebp)
  10183b:	84 c0                	test   %al,%al
  10183d:	75 ef                	jne    10182e <abort+0x5a>
  10183f:	c6 01 0a             	movb   $0xa,(%ecx)
  101842:	0f be 05 20 33 10 00 	movsbl 0x103320,%eax
  101849:	84 c0                	test   %al,%al
  10184b:	74 1b                	je     101868 <abort+0x94>
  10184d:	bb 20 33 10 00       	mov    $0x103320,%ebx
  101852:	83 ec 0c             	sub    $0xc,%esp
  101855:	50                   	push   %eax
  101856:	e8 a9 f0 ff ff       	call   100904 <putChar>
  10185b:	43                   	inc    %ebx
  10185c:	0f be 03             	movsbl (%ebx),%eax
  10185f:	83 c4 10             	add    $0x10,%esp
  101862:	84 c0                	test   %al,%al
  101864:	75 ec                	jne    101852 <abort+0x7e>
  101866:	66 90                	xchg   %ax,%ax
  101868:	f4                   	hlt    
  101869:	eb fd                	jmp    101868 <abort+0x94>

0010186b <irqEmpty>:
  10186b:	6a 00                	push   $0x0
  10186d:	6a ff                	push   $0xffffffff
  10186f:	eb 13                	jmp    101884 <asmDoIrq>

00101871 <irqGProtectFault>:
  101871:	6a 0d                	push   $0xd
  101873:	eb 0f                	jmp    101884 <asmDoIrq>

00101875 <irqSyscall>:
  101875:	6a 00                	push   $0x0
  101877:	68 80 00 00 00       	push   $0x80
  10187c:	eb 06                	jmp    101884 <asmDoIrq>

0010187e <irqTime>:
  10187e:	6a 00                	push   $0x0
  101880:	6a 20                	push   $0x20
  101882:	eb 00                	jmp    101884 <asmDoIrq>

00101884 <asmDoIrq>:
  101884:	60                   	pusha  
  101885:	1e                   	push   %ds
  101886:	06                   	push   %es
  101887:	0f a0                	push   %fs
  101889:	0f a8                	push   %gs
  10188b:	54                   	push   %esp
  10188c:	e8 a7 fa ff ff       	call   101338 <irqHandle>
  101891:	5c                   	pop    %esp
  101892:	0f a9                	pop    %gs
  101894:	0f a1                	pop    %fs
  101896:	07                   	pop    %es
  101897:	1f                   	pop    %ds
  101898:	61                   	popa   
  101899:	83 c4 04             	add    $0x4,%esp
  10189c:	83 c4 04             	add    $0x4,%esp
  10189f:	cf                   	iret   
