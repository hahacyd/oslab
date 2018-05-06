
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 45 16 00 00       	call   101650 <initTimer>
  10000b:	e8 24 11 00 00       	call   101134 <init_pcb>
  100010:	e8 6b 11 00 00       	call   101180 <init_kernel_pcb>
  100015:	e8 e6 08 00 00       	call   100900 <initSerial>
  10001a:	e8 41 12 00 00       	call   101260 <initIdt>
  10001f:	e8 d4 15 00 00       	call   1015f8 <initIntr>
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
  10005f:	66 c7 05 60 7e 13 01 	movw   $0xffff,0x1137e60
  100066:	ff ff 
  100068:	66 a3 62 7e 13 01    	mov    %ax,0x1137e62
  10006e:	89 c2                	mov    %eax,%edx
  100070:	c1 ea 10             	shr    $0x10,%edx
  100073:	88 15 64 7e 13 01    	mov    %dl,0x1137e64
  100079:	c6 05 65 7e 13 01 f2 	movb   $0xf2,0x1137e65
  100080:	c6 05 66 7e 13 01 cf 	movb   $0xcf,0x1137e66
  100087:	c1 e8 18             	shr    $0x18,%eax
  10008a:	a2 67 7e 13 01       	mov    %al,0x1137e67
  10008f:	66 c7 05 a0 35 10 00 	movw   $0x4f,0x1035a0
  100096:	4f 00 
  100098:	b8 40 7e 13 01       	mov    $0x1137e40,%eax
  10009d:	66 a3 a2 35 10 00    	mov    %ax,0x1035a2
  1000a3:	c1 e8 10             	shr    $0x10,%eax
  1000a6:	66 a3 a4 35 10 00    	mov    %ax,0x1035a4
  1000ac:	b8 a0 35 10 00       	mov    $0x1035a0,%eax
  1000b1:	0f 01 10             	lgdtl  (%eax)
  1000b4:	b8 01 00 00 00       	mov    $0x1,%eax
  1000b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000bc:	c9                   	leave  
  1000bd:	c3                   	ret    
  1000be:	66 90                	xchg   %ax,%ax
  1000c0:	66 c7 05 58 7e 13 01 	movw   $0xffff,0x1137e58
  1000c7:	ff ff 
  1000c9:	66 a3 5a 7e 13 01    	mov    %ax,0x1137e5a
  1000cf:	89 c2                	mov    %eax,%edx
  1000d1:	c1 ea 10             	shr    $0x10,%edx
  1000d4:	88 15 5c 7e 13 01    	mov    %dl,0x1137e5c
  1000da:	c6 05 5d 7e 13 01 fa 	movb   $0xfa,0x1137e5d
  1000e1:	c6 05 5e 7e 13 01 cf 	movb   $0xcf,0x1137e5e
  1000e8:	c1 e8 18             	shr    $0x18,%eax
  1000eb:	a2 5f 7e 13 01       	mov    %al,0x1137e5f
  1000f0:	eb 9d                	jmp    10008f <change_gdt+0x5b>
  1000f2:	66 90                	xchg   %ax,%ax
  1000f4:	83 fb 01             	cmp    $0x1,%ebx
  1000f7:	75 37                	jne    100130 <change_gdt+0xfc>
  1000f9:	66 c7 05 48 7e 13 01 	movw   $0xffff,0x1137e48
  100100:	ff ff 
  100102:	66 a3 4a 7e 13 01    	mov    %ax,0x1137e4a
  100108:	89 c2                	mov    %eax,%edx
  10010a:	c1 ea 10             	shr    $0x10,%edx
  10010d:	88 15 4c 7e 13 01    	mov    %dl,0x1137e4c
  100113:	c6 05 4d 7e 13 01 9a 	movb   $0x9a,0x1137e4d
  10011a:	c6 05 4e 7e 13 01 cf 	movb   $0xcf,0x1137e4e
  100121:	c1 e8 18             	shr    $0x18,%eax
  100124:	a2 4f 7e 13 01       	mov    %al,0x1137e4f
  100129:	e9 61 ff ff ff       	jmp    10008f <change_gdt+0x5b>
  10012e:	66 90                	xchg   %ax,%ax
  100130:	83 ec 0c             	sub    $0xc,%esp
  100133:	68 b8 19 10 00       	push   $0x1019b8
  100138:	e8 3b 16 00 00       	call   101778 <printk>
  10013d:	89 1c 24             	mov    %ebx,(%esp)
  100140:	68 f8 19 10 00       	push   $0x1019f8
  100145:	6a 18                	push   $0x18
  100147:	68 be 19 10 00       	push   $0x1019be
  10014c:	68 cb 19 10 00       	push   $0x1019cb
  100151:	e8 22 16 00 00       	call   101778 <printk>
  100156:	83 c4 14             	add    $0x14,%esp
  100159:	68 e7 19 10 00       	push   $0x1019e7
  10015e:	e8 15 16 00 00       	call   101778 <printk>
  100163:	58                   	pop    %eax
  100164:	5a                   	pop    %edx
  100165:	6a 19                	push   $0x19
  100167:	68 be 19 10 00       	push   $0x1019be
  10016c:	e8 7b 17 00 00       	call   1018ec <abort>
  100171:	83 c4 10             	add    $0x10,%esp
  100174:	e9 16 ff ff ff       	jmp    10008f <change_gdt+0x5b>
  100179:	8d 76 00             	lea    0x0(%esi),%esi
  10017c:	66 c7 05 50 7e 13 01 	movw   $0xffff,0x1137e50
  100183:	ff ff 
  100185:	66 a3 52 7e 13 01    	mov    %ax,0x1137e52
  10018b:	89 c2                	mov    %eax,%edx
  10018d:	c1 ea 10             	shr    $0x10,%edx
  100190:	88 15 54 7e 13 01    	mov    %dl,0x1137e54
  100196:	c6 05 55 7e 13 01 92 	movb   $0x92,0x1137e55
  10019d:	c6 05 56 7e 13 01 cf 	movb   $0xcf,0x1137e56
  1001a4:	c1 e8 18             	shr    $0x18,%eax
  1001a7:	a2 57 7e 13 01       	mov    %al,0x1137e57
  1001ac:	e9 de fe ff ff       	jmp    10008f <change_gdt+0x5b>
  1001b1:	8d 76 00             	lea    0x0(%esi),%esi

001001b4 <change_tss>:
  1001b4:	55                   	push   %ebp
  1001b5:	89 e5                	mov    %esp,%ebp
  1001b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1001ba:	a3 a8 7e 13 01       	mov    %eax,0x1137ea8
  1001bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1001c2:	a3 a4 7e 13 01       	mov    %eax,0x1137ea4
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
  1001d8:	be a0 7e 13 01       	mov    $0x1137ea0,%esi
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
  10027b:	b9 40 7e 13 01       	mov    $0x1137e40,%ecx
  100280:	66 c7 05 48 7e 13 01 	movw   $0xffff,0x1137e48
  100287:	ff ff 
  100289:	66 c7 05 4a 7e 13 01 	movw   $0x0,0x1137e4a
  100290:	00 00 
  100292:	c6 05 4c 7e 13 01 00 	movb   $0x0,0x1137e4c
  100299:	c6 05 4d 7e 13 01 9a 	movb   $0x9a,0x1137e4d
  1002a0:	c6 05 4e 7e 13 01 cf 	movb   $0xcf,0x1137e4e
  1002a7:	c6 05 4f 7e 13 01 00 	movb   $0x0,0x1137e4f
  1002ae:	66 c7 05 50 7e 13 01 	movw   $0xffff,0x1137e50
  1002b5:	ff ff 
  1002b7:	66 c7 05 52 7e 13 01 	movw   $0x0,0x1137e52
  1002be:	00 00 
  1002c0:	c6 05 54 7e 13 01 00 	movb   $0x0,0x1137e54
  1002c7:	c6 05 55 7e 13 01 92 	movb   $0x92,0x1137e55
  1002ce:	c6 05 56 7e 13 01 cf 	movb   $0xcf,0x1137e56
  1002d5:	c6 05 57 7e 13 01 00 	movb   $0x0,0x1137e57
  1002dc:	66 c7 05 58 7e 13 01 	movw   $0xffff,0x1137e58
  1002e3:	ff ff 
  1002e5:	66 c7 05 5a 7e 13 01 	movw   $0x0,0x1137e5a
  1002ec:	00 00 
  1002ee:	c6 05 5c 7e 13 01 00 	movb   $0x0,0x1137e5c
  1002f5:	c6 05 5d 7e 13 01 fa 	movb   $0xfa,0x1137e5d
  1002fc:	c6 05 5e 7e 13 01 cf 	movb   $0xcf,0x1137e5e
  100303:	c6 05 5f 7e 13 01 00 	movb   $0x0,0x1137e5f
  10030a:	66 c7 05 60 7e 13 01 	movw   $0xffff,0x1137e60
  100311:	ff ff 
  100313:	66 c7 05 62 7e 13 01 	movw   $0x0,0x1137e62
  10031a:	00 00 
  10031c:	c6 05 64 7e 13 01 00 	movb   $0x0,0x1137e64
  100323:	c6 05 65 7e 13 01 f2 	movb   $0xf2,0x1137e65
  10032a:	c6 05 66 7e 13 01 cf 	movb   $0xcf,0x1137e66
  100331:	c6 05 67 7e 13 01 00 	movb   $0x0,0x1137e67
  100338:	66 c7 05 68 7e 13 01 	movw   $0x63,0x1137e68
  10033f:	63 00 
  100341:	b8 a0 7e 13 01       	mov    $0x1137ea0,%eax
  100346:	66 a3 6a 7e 13 01    	mov    %ax,0x1137e6a
  10034c:	89 c2                	mov    %eax,%edx
  10034e:	c1 ea 10             	shr    $0x10,%edx
  100351:	88 15 6c 7e 13 01    	mov    %dl,0x1137e6c
  100357:	c6 05 6d 7e 13 01 89 	movb   $0x89,0x1137e6d
  10035e:	c6 05 6e 7e 13 01 40 	movb   $0x40,0x1137e6e
  100365:	c1 e8 18             	shr    $0x18,%eax
  100368:	a2 6f 7e 13 01       	mov    %al,0x1137e6f
  10036d:	a1 f0 19 10 00       	mov    0x1019f0,%eax
  100372:	8b 15 f4 19 10 00    	mov    0x1019f4,%edx
  100378:	a3 70 7e 13 01       	mov    %eax,0x1137e70
  10037d:	89 15 74 7e 13 01    	mov    %edx,0x1137e74
  100383:	66 c7 05 80 7e 13 01 	movw   $0xffff,0x1137e80
  10038a:	ff ff 
  10038c:	66 c7 05 82 7e 13 01 	movw   $0x0,0x1137e82
  100393:	00 00 
  100395:	c6 05 84 7e 13 01 00 	movb   $0x0,0x1137e84
  10039c:	c6 05 85 7e 13 01 f2 	movb   $0xf2,0x1137e85
  1003a3:	c6 05 86 7e 13 01 cf 	movb   $0xcf,0x1137e86
  1003aa:	c6 05 87 7e 13 01 00 	movb   $0x0,0x1137e87
  1003b1:	66 c7 05 a0 35 10 00 	movw   $0x4f,0x1035a0
  1003b8:	4f 00 
  1003ba:	66 89 0d a2 35 10 00 	mov    %cx,0x1035a2
  1003c1:	c1 e9 10             	shr    $0x10,%ecx
  1003c4:	66 89 0d a4 35 10 00 	mov    %cx,0x1035a4
  1003cb:	b8 a0 35 10 00       	mov    $0x1035a0,%eax
  1003d0:	0f 01 10             	lgdtl  (%eax)
  1003d3:	a1 88 5e 10 00       	mov    0x105e88,%eax
  1003d8:	a3 a8 7e 13 01       	mov    %eax,0x1137ea8
  1003dd:	c7 05 a4 7e 13 01 3c 	movl   $0x105e3c,0x1137ea4
  1003e4:	5e 10 00 
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
  100431:	8d 04 c5 40 3e 10 00 	lea    0x103e40(,%eax,8),%eax
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
  100460:	c7 05 24 3e 10 00 01 	movl   $0x1,0x103e24
  100467:	00 00 00 
  10046a:	e8 19 0a 00 00       	call   100e88 <apply_new_pid>
  10046f:	89 c6                	mov    %eax,%esi
  100471:	48                   	dec    %eax
  100472:	74 15                	je     100489 <enterUserSpace+0x31>
  100474:	83 ec 08             	sub    $0x8,%esp
  100477:	68 9e 00 00 00       	push   $0x9e
  10047c:	68 be 19 10 00       	push   $0x1019be
  100481:	e8 66 14 00 00       	call   1018ec <abort>
  100486:	83 c4 10             	add    $0x10,%esp
  100489:	89 f0                	mov    %esi,%eax
  10048b:	c1 e0 07             	shl    $0x7,%eax
  10048e:	01 f0                	add    %esi,%eax
  100490:	01 c0                	add    %eax,%eax
  100492:	01 f0                	add    %esi,%eax
  100494:	8d 04 86             	lea    (%esi,%eax,4),%eax
  100497:	8d 04 c5 40 3e 10 00 	lea    0x103e40(,%eax,8),%eax
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
  1004f0:	e8 a3 05 00 00       	call   100a98 <put_into_runnable>
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
  1005e6:	68 03 1a 10 00       	push   $0x101a03
  1005eb:	e8 88 11 00 00       	call   101778 <printk>
  1005f0:	e8 e3 03 00 00       	call   1009d8 <get_from_runnable>
  1005f5:	5a                   	pop    %edx
  1005f6:	59                   	pop    %ecx
  1005f7:	ff 75 08             	pushl  0x8(%ebp)
  1005fa:	50                   	push   %eax
  1005fb:	e8 64 03 00 00       	call   100964 <put_into_running>
  100600:	b8 01 00 00 00       	mov    $0x1,%eax
  100605:	c9                   	leave  
  100606:	c3                   	ret    
  100607:	90                   	nop

00100608 <sys_getpid>:
  100608:	55                   	push   %ebp
  100609:	89 e5                	mov    %esp,%ebp
  10060b:	5d                   	pop    %ebp
  10060c:	e9 97 03 00 00       	jmp    1009a8 <getpid>
  100611:	66 90                	xchg   %ax,%ax
  100613:	90                   	nop

00100614 <sys_sleep>:
  100614:	55                   	push   %ebp
  100615:	89 e5                	mov    %esp,%ebp
  100617:	56                   	push   %esi
  100618:	53                   	push   %ebx
  100619:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10061c:	e8 87 03 00 00       	call   1009a8 <getpid>
  100621:	83 ec 08             	sub    $0x8,%esp
  100624:	53                   	push   %ebx
  100625:	50                   	push   %eax
  100626:	e8 9d 05 00 00       	call   100bc8 <put_into_block>
  10062b:	c7 04 24 b8 19 10 00 	movl   $0x1019b8,(%esp)
  100632:	e8 41 11 00 00       	call   101778 <printk>
  100637:	e8 6c 03 00 00       	call   1009a8 <getpid>
  10063c:	89 c2                	mov    %eax,%edx
  10063e:	c1 e2 07             	shl    $0x7,%edx
  100641:	01 c2                	add    %eax,%edx
  100643:	01 d2                	add    %edx,%edx
  100645:	01 c2                	add    %eax,%edx
  100647:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10064a:	8b 34 c5 94 5e 10 00 	mov    0x105e94(,%eax,8),%esi
  100651:	e8 52 03 00 00       	call   1009a8 <getpid>
  100656:	5a                   	pop    %edx
  100657:	59                   	pop    %ecx
  100658:	56                   	push   %esi
  100659:	50                   	push   %eax
  10065a:	68 54 1a 10 00       	push   $0x101a54
  10065f:	6a 09                	push   $0x9
  100661:	68 11 1a 10 00       	push   $0x101a11
  100666:	68 30 1a 10 00       	push   $0x101a30
  10066b:	e8 08 11 00 00       	call   101778 <printk>
  100670:	83 c4 14             	add    $0x14,%esp
  100673:	68 e7 19 10 00       	push   $0x1019e7
  100678:	e8 fb 10 00 00       	call   101778 <printk>
  10067d:	e8 56 03 00 00       	call   1009d8 <get_from_runnable>
  100682:	5e                   	pop    %esi
  100683:	5a                   	pop    %edx
  100684:	53                   	push   %ebx
  100685:	50                   	push   %eax
  100686:	e8 d9 02 00 00       	call   100964 <put_into_running>
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
  10069e:	83 ec 28             	sub    $0x28,%esp
  1006a1:	68 5e 1a 10 00       	push   $0x101a5e
  1006a6:	e8 cd 10 00 00       	call   101778 <printk>
  1006ab:	e8 d8 07 00 00       	call   100e88 <apply_new_pid>
  1006b0:	89 c1                	mov    %eax,%ecx
  1006b2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1006b5:	c1 e0 07             	shl    $0x7,%eax
  1006b8:	01 c8                	add    %ecx,%eax
  1006ba:	01 c0                	add    %eax,%eax
  1006bc:	01 c8                	add    %ecx,%eax
  1006be:	8d 3c 81             	lea    (%ecx,%eax,4),%edi
  1006c1:	c1 e7 03             	shl    $0x3,%edi
  1006c4:	83 c4 10             	add    $0x10,%esp
  1006c7:	31 f6                	xor    %esi,%esi
  1006c9:	8d 76 00             	lea    0x0(%esi),%esi
  1006cc:	e8 d7 02 00 00       	call   1009a8 <getpid>
  1006d1:	89 c2                	mov    %eax,%edx
  1006d3:	c1 e2 07             	shl    $0x7,%edx
  1006d6:	01 c2                	add    %eax,%edx
  1006d8:	01 d2                	add    %edx,%edx
  1006da:	01 c2                	add    %eax,%edx
  1006dc:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1006df:	01 c0                	add    %eax,%eax
  1006e1:	01 f0                	add    %esi,%eax
  1006e3:	8b 04 85 40 3e 10 00 	mov    0x103e40(,%eax,4),%eax
  1006ea:	89 84 b7 40 3e 10 00 	mov    %eax,0x103e40(%edi,%esi,4)
  1006f1:	46                   	inc    %esi
  1006f2:	81 fe 00 08 00 00    	cmp    $0x800,%esi
  1006f8:	75 d2                	jne    1006cc <sys_fork+0x34>
  1006fa:	e8 a9 02 00 00       	call   1009a8 <getpid>
  1006ff:	8d 50 40             	lea    0x40(%eax),%edx
  100702:	c1 e2 10             	shl    $0x10,%edx
  100705:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100708:	8d 48 40             	lea    0x40(%eax),%ecx
  10070b:	c1 e1 10             	shl    $0x10,%ecx
  10070e:	b8 00 00 01 00       	mov    $0x10000,%eax
  100713:	90                   	nop
  100714:	8a 9c 10 00 00 ff ff 	mov    -0x10000(%eax,%edx,1),%bl
  10071b:	88 9c 08 00 00 ff ff 	mov    %bl,-0x10000(%eax,%ecx,1)
  100722:	48                   	dec    %eax
  100723:	75 ef                	jne    100714 <sys_fork+0x7c>
  100725:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
  100728:	89 d8                	mov    %ebx,%eax
  10072a:	c1 e0 07             	shl    $0x7,%eax
  10072d:	01 d8                	add    %ebx,%eax
  10072f:	01 c0                	add    %eax,%eax
  100731:	01 d8                	add    %ebx,%eax
  100733:	8d 14 83             	lea    (%ebx,%eax,4),%edx
  100736:	c1 e2 03             	shl    $0x3,%edx
  100739:	8d 82 40 5e 10 00    	lea    0x105e40(%edx),%eax
  10073f:	b9 13 00 00 00       	mov    $0x13,%ecx
  100744:	89 c7                	mov    %eax,%edi
  100746:	8b 75 08             	mov    0x8(%ebp),%esi
  100749:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10074b:	c7 82 6c 5e 10 00 00 	movl   $0x0,0x105e6c(%edx)
  100752:	00 00 00 
  100755:	83 fb 02             	cmp    $0x2,%ebx
  100758:	74 12                	je     10076c <sys_fork+0xd4>
  10075a:	83 ec 08             	sub    $0x8,%esp
  10075d:	6a 1d                	push   $0x1d
  10075f:	68 7a 1a 10 00       	push   $0x101a7a
  100764:	e8 83 11 00 00       	call   1018ec <abort>
  100769:	83 c4 10             	add    $0x10,%esp
  10076c:	83 ec 08             	sub    $0x8,%esp
  10076f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  100772:	89 f8                	mov    %edi,%eax
  100774:	c1 e0 07             	shl    $0x7,%eax
  100777:	01 f8                	add    %edi,%eax
  100779:	01 c0                	add    %eax,%eax
  10077b:	01 f8                	add    %edi,%eax
  10077d:	8d 04 87             	lea    (%edi,%eax,4),%eax
  100780:	8d 04 c5 40 5e 10 00 	lea    0x105e40(,%eax,8),%eax
  100787:	50                   	push   %eax
  100788:	57                   	push   %edi
  100789:	e8 0a 03 00 00       	call   100a98 <put_into_runnable>
  10078e:	89 f8                	mov    %edi,%eax
  100790:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100793:	5b                   	pop    %ebx
  100794:	5e                   	pop    %esi
  100795:	5f                   	pop    %edi
  100796:	5d                   	pop    %ebp
  100797:	c3                   	ret    

00100798 <display>:
  100798:	55                   	push   %ebp
  100799:	89 e5                	mov    %esp,%ebp
  10079b:	57                   	push   %edi
  10079c:	53                   	push   %ebx
  10079d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1007a0:	80 fb 0a             	cmp    $0xa,%bl
  1007a3:	74 5b                	je     100800 <display+0x68>
  1007a5:	8b 15 a8 35 10 00    	mov    0x1035a8,%edx
  1007ab:	8b 0d ac 35 10 00    	mov    0x1035ac,%ecx
  1007b1:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  1007b4:	c1 e0 04             	shl    $0x4,%eax
  1007b7:	01 d0                	add    %edx,%eax
  1007b9:	01 c0                	add    %eax,%eax
  1007bb:	89 c7                	mov    %eax,%edi
  1007bd:	0f be db             	movsbl %bl,%ebx
  1007c0:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
  1007c6:	66 89 d8             	mov    %bx,%ax
  1007c9:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1007cd:	42                   	inc    %edx
  1007ce:	83 fa 50             	cmp    $0x50,%edx
  1007d1:	75 1d                	jne    1007f0 <display+0x58>
  1007d3:	c7 05 a8 35 10 00 00 	movl   $0x0,0x1035a8
  1007da:	00 00 00 
  1007dd:	41                   	inc    %ecx
  1007de:	89 0d ac 35 10 00    	mov    %ecx,0x1035ac
  1007e4:	b8 01 00 00 00       	mov    $0x1,%eax
  1007e9:	5b                   	pop    %ebx
  1007ea:	5f                   	pop    %edi
  1007eb:	5d                   	pop    %ebp
  1007ec:	c3                   	ret    
  1007ed:	8d 76 00             	lea    0x0(%esi),%esi
  1007f0:	89 15 a8 35 10 00    	mov    %edx,0x1035a8
  1007f6:	b8 01 00 00 00       	mov    $0x1,%eax
  1007fb:	5b                   	pop    %ebx
  1007fc:	5f                   	pop    %edi
  1007fd:	5d                   	pop    %ebp
  1007fe:	c3                   	ret    
  1007ff:	90                   	nop
  100800:	c7 05 a8 35 10 00 00 	movl   $0x0,0x1035a8
  100807:	00 00 00 
  10080a:	ff 05 ac 35 10 00    	incl   0x1035ac
  100810:	b8 01 00 00 00       	mov    $0x1,%eax
  100815:	5b                   	pop    %ebx
  100816:	5f                   	pop    %edi
  100817:	5d                   	pop    %ebp
  100818:	c3                   	ret    
  100819:	8d 76 00             	lea    0x0(%esi),%esi

0010081c <printkernel>:
  10081c:	55                   	push   %ebp
  10081d:	89 e5                	mov    %esp,%ebp
  10081f:	56                   	push   %esi
  100820:	53                   	push   %ebx
  100821:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100824:	8b 75 0c             	mov    0xc(%ebp),%esi
  100827:	85 f6                	test   %esi,%esi
  100829:	7e 30                	jle    10085b <printkernel+0x3f>
  10082b:	0f be 03             	movsbl (%ebx),%eax
  10082e:	84 c0                	test   %al,%al
  100830:	74 29                	je     10085b <printkernel+0x3f>
  100832:	01 de                	add    %ebx,%esi
  100834:	eb 09                	jmp    10083f <printkernel+0x23>
  100836:	66 90                	xchg   %ax,%ax
  100838:	0f be 03             	movsbl (%ebx),%eax
  10083b:	84 c0                	test   %al,%al
  10083d:	74 1c                	je     10085b <printkernel+0x3f>
  10083f:	83 ec 0c             	sub    $0xc,%esp
  100842:	50                   	push   %eax
  100843:	e8 f8 00 00 00       	call   100940 <putChar>
  100848:	0f be 03             	movsbl (%ebx),%eax
  10084b:	89 04 24             	mov    %eax,(%esp)
  10084e:	e8 45 ff ff ff       	call   100798 <display>
  100853:	43                   	inc    %ebx
  100854:	83 c4 10             	add    $0x10,%esp
  100857:	39 de                	cmp    %ebx,%esi
  100859:	75 dd                	jne    100838 <printkernel+0x1c>
  10085b:	b8 01 00 00 00       	mov    $0x1,%eax
  100860:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100863:	5b                   	pop    %ebx
  100864:	5e                   	pop    %esi
  100865:	5d                   	pop    %ebp
  100866:	c3                   	ret    
  100867:	90                   	nop

00100868 <fs_write>:
  100868:	55                   	push   %ebp
  100869:	89 e5                	mov    %esp,%ebp
  10086b:	53                   	push   %ebx
  10086c:	50                   	push   %eax
  10086d:	8b 5d 10             	mov    0x10(%ebp),%ebx
  100870:	ba 30 00 00 00       	mov    $0x30,%edx
  100875:	89 d0                	mov    %edx,%eax
  100877:	8e e8                	mov    %eax,%gs
  100879:	8b 45 08             	mov    0x8(%ebp),%eax
  10087c:	48                   	dec    %eax
  10087d:	83 f8 01             	cmp    $0x1,%eax
  100880:	76 12                	jbe    100894 <fs_write+0x2c>
  100882:	83 ec 08             	sub    $0x8,%esp
  100885:	6a 28                	push   $0x28
  100887:	68 95 1a 10 00       	push   $0x101a95
  10088c:	e8 5b 10 00 00       	call   1018ec <abort>
  100891:	83 c4 10             	add    $0x10,%esp
  100894:	83 ec 08             	sub    $0x8,%esp
  100897:	53                   	push   %ebx
  100898:	ff 75 0c             	pushl  0xc(%ebp)
  10089b:	e8 7c ff ff ff       	call   10081c <printkernel>
  1008a0:	89 d8                	mov    %ebx,%eax
  1008a2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1008a5:	c9                   	leave  
  1008a6:	c3                   	ret    
  1008a7:	90                   	nop

001008a8 <sys_write>:
  1008a8:	55                   	push   %ebp
  1008a9:	89 e5                	mov    %esp,%ebp
  1008ab:	56                   	push   %esi
  1008ac:	53                   	push   %ebx
  1008ad:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1008b0:	8b 73 24             	mov    0x24(%ebx),%esi
  1008b3:	e8 f0 00 00 00       	call   1009a8 <getpid>
  1008b8:	52                   	push   %edx
  1008b9:	56                   	push   %esi
  1008ba:	c1 e0 10             	shl    $0x10,%eax
  1008bd:	03 43 28             	add    0x28(%ebx),%eax
  1008c0:	50                   	push   %eax
  1008c1:	ff 73 20             	pushl  0x20(%ebx)
  1008c4:	e8 9f ff ff ff       	call   100868 <fs_write>
  1008c9:	89 43 2c             	mov    %eax,0x2c(%ebx)
  1008cc:	83 c4 10             	add    $0x10,%esp
  1008cf:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1008d2:	5b                   	pop    %ebx
  1008d3:	5e                   	pop    %esi
  1008d4:	5d                   	pop    %ebp
  1008d5:	c3                   	ret    
  1008d6:	66 90                	xchg   %ax,%ax

001008d8 <print_char>:
  1008d8:	55                   	push   %ebp
  1008d9:	89 e5                	mov    %esp,%ebp
  1008db:	57                   	push   %edi
  1008dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1008df:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1008e2:	c1 e0 04             	shl    $0x4,%eax
  1008e5:	03 45 0c             	add    0xc(%ebp),%eax
  1008e8:	01 c0                	add    %eax,%eax
  1008ea:	89 c7                	mov    %eax,%edi
  1008ec:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  1008f0:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  1008f6:	66 89 d0             	mov    %dx,%ax
  1008f9:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1008fd:	5f                   	pop    %edi
  1008fe:	5d                   	pop    %ebp
  1008ff:	c3                   	ret    

00100900 <initSerial>:
  100900:	55                   	push   %ebp
  100901:	89 e5                	mov    %esp,%ebp
  100903:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100908:	31 c0                	xor    %eax,%eax
  10090a:	ee                   	out    %al,(%dx)
  10090b:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100910:	b0 80                	mov    $0x80,%al
  100912:	ee                   	out    %al,(%dx)
  100913:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100918:	b0 01                	mov    $0x1,%al
  10091a:	ee                   	out    %al,(%dx)
  10091b:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100920:	31 c0                	xor    %eax,%eax
  100922:	ee                   	out    %al,(%dx)
  100923:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100928:	b0 03                	mov    $0x3,%al
  10092a:	ee                   	out    %al,(%dx)
  10092b:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100930:	b0 c7                	mov    $0xc7,%al
  100932:	ee                   	out    %al,(%dx)
  100933:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100938:	b0 0b                	mov    $0xb,%al
  10093a:	ee                   	out    %al,(%dx)
  10093b:	5d                   	pop    %ebp
  10093c:	c3                   	ret    
  10093d:	8d 76 00             	lea    0x0(%esi),%esi

00100940 <putChar>:
  100940:	55                   	push   %ebp
  100941:	89 e5                	mov    %esp,%ebp
  100943:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100946:	ba fd 03 00 00       	mov    $0x3fd,%edx
  10094b:	90                   	nop
  10094c:	ec                   	in     (%dx),%al
  10094d:	a8 20                	test   $0x20,%al
  10094f:	74 fb                	je     10094c <putChar+0xc>
  100951:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100956:	88 c8                	mov    %cl,%al
  100958:	ee                   	out    %al,(%dx)
  100959:	5d                   	pop    %ebp
  10095a:	c3                   	ret    
  10095b:	90                   	nop

0010095c <IDLE>:
  10095c:	55                   	push   %ebp
  10095d:	89 e5                	mov    %esp,%ebp
  10095f:	90                   	nop
  100960:	f4                   	hlt    
  100961:	eb fd                	jmp    100960 <IDLE+0x4>
  100963:	90                   	nop

00100964 <put_into_running>:
  100964:	55                   	push   %ebp
  100965:	89 e5                	mov    %esp,%ebp
  100967:	83 ec 08             	sub    $0x8,%esp
  10096a:	8b 55 08             	mov    0x8(%ebp),%edx
  10096d:	39 15 20 3e 10 00    	cmp    %edx,0x103e20
  100973:	74 29                	je     10099e <put_into_running+0x3a>
  100975:	89 15 20 3e 10 00    	mov    %edx,0x103e20
  10097b:	83 ec 08             	sub    $0x8,%esp
  10097e:	89 d0                	mov    %edx,%eax
  100980:	c1 e0 07             	shl    $0x7,%eax
  100983:	01 d0                	add    %edx,%eax
  100985:	01 c0                	add    %eax,%eax
  100987:	01 d0                	add    %edx,%eax
  100989:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10098c:	8d 04 c5 3c 5e 10 00 	lea    0x105e3c(,%eax,8),%eax
  100993:	50                   	push   %eax
  100994:	6a 10                	push   $0x10
  100996:	e8 19 f8 ff ff       	call   1001b4 <change_tss>
  10099b:	83 c4 10             	add    $0x10,%esp
  10099e:	b8 01 00 00 00       	mov    $0x1,%eax
  1009a3:	c9                   	leave  
  1009a4:	c3                   	ret    
  1009a5:	8d 76 00             	lea    0x0(%esi),%esi

001009a8 <getpid>:
  1009a8:	55                   	push   %ebp
  1009a9:	89 e5                	mov    %esp,%ebp
  1009ab:	a1 20 3e 10 00       	mov    0x103e20,%eax
  1009b0:	5d                   	pop    %ebp
  1009b1:	c3                   	ret    
  1009b2:	66 90                	xchg   %ax,%ax

001009b4 <getrunnable>:
  1009b4:	55                   	push   %ebp
  1009b5:	89 e5                	mov    %esp,%ebp
  1009b7:	a1 84 34 10 00       	mov    0x103484,%eax
  1009bc:	5d                   	pop    %ebp
  1009bd:	c3                   	ret    
  1009be:	66 90                	xchg   %ax,%ax

001009c0 <getblocked>:
  1009c0:	55                   	push   %ebp
  1009c1:	89 e5                	mov    %esp,%ebp
  1009c3:	a1 80 34 10 00       	mov    0x103480,%eax
  1009c8:	5d                   	pop    %ebp
  1009c9:	c3                   	ret    
  1009ca:	66 90                	xchg   %ax,%ax

001009cc <transfer_pid_mode>:
  1009cc:	55                   	push   %ebp
  1009cd:	89 e5                	mov    %esp,%ebp
  1009cf:	b8 01 00 00 00       	mov    $0x1,%eax
  1009d4:	5d                   	pop    %ebp
  1009d5:	c3                   	ret    
  1009d6:	66 90                	xchg   %ax,%ax

001009d8 <get_from_runnable>:
  1009d8:	55                   	push   %ebp
  1009d9:	89 e5                	mov    %esp,%ebp
  1009db:	53                   	push   %ebx
  1009dc:	51                   	push   %ecx
  1009dd:	8b 1d 84 34 10 00    	mov    0x103484,%ebx
  1009e3:	83 fb ff             	cmp    $0xffffffff,%ebx
  1009e6:	0f 84 a4 00 00 00    	je     100a90 <get_from_runnable+0xb8>
  1009ec:	89 d8                	mov    %ebx,%eax
  1009ee:	c1 e0 07             	shl    $0x7,%eax
  1009f1:	01 d8                	add    %ebx,%eax
  1009f3:	01 c0                	add    %eax,%eax
  1009f5:	01 d8                	add    %ebx,%eax
  1009f7:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1009fa:	8d 04 c5 40 3e 10 00 	lea    0x103e40(,%eax,8),%eax
  100a01:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100a07:	39 da                	cmp    %ebx,%edx
  100a09:	74 79                	je     100a84 <get_from_runnable+0xac>
  100a0b:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100a11:	89 c8                	mov    %ecx,%eax
  100a13:	c1 e0 07             	shl    $0x7,%eax
  100a16:	01 c8                	add    %ecx,%eax
  100a18:	01 c0                	add    %eax,%eax
  100a1a:	01 c8                	add    %ecx,%eax
  100a1c:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100a1f:	89 14 c5 a0 5e 10 00 	mov    %edx,0x105ea0(,%eax,8)
  100a26:	89 d0                	mov    %edx,%eax
  100a28:	c1 e0 07             	shl    $0x7,%eax
  100a2b:	01 d0                	add    %edx,%eax
  100a2d:	01 c0                	add    %eax,%eax
  100a2f:	01 d0                	add    %edx,%eax
  100a31:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100a34:	89 0c c5 9c 5e 10 00 	mov    %ecx,0x105e9c(,%eax,8)
  100a3b:	89 15 84 34 10 00    	mov    %edx,0x103484
  100a41:	83 ec 0c             	sub    $0xc,%esp
  100a44:	68 b8 19 10 00       	push   $0x1019b8
  100a49:	e8 2a 0d 00 00       	call   101778 <printk>
  100a4e:	58                   	pop    %eax
  100a4f:	5a                   	pop    %edx
  100a50:	ff 35 84 34 10 00    	pushl  0x103484
  100a56:	53                   	push   %ebx
  100a57:	68 bc 1b 10 00       	push   $0x101bbc
  100a5c:	6a 59                	push   $0x59
  100a5e:	68 b1 1a 10 00       	push   $0x101ab1
  100a63:	68 c0 1a 10 00       	push   $0x101ac0
  100a68:	e8 0b 0d 00 00       	call   101778 <printk>
  100a6d:	83 c4 14             	add    $0x14,%esp
  100a70:	68 e7 19 10 00       	push   $0x1019e7
  100a75:	e8 fe 0c 00 00       	call   101778 <printk>
  100a7a:	83 c4 10             	add    $0x10,%esp
  100a7d:	89 d8                	mov    %ebx,%eax
  100a7f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100a82:	c9                   	leave  
  100a83:	c3                   	ret    
  100a84:	c7 05 84 34 10 00 ff 	movl   $0xffffffff,0x103484
  100a8b:	ff ff ff 
  100a8e:	eb b1                	jmp    100a41 <get_from_runnable+0x69>
  100a90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100a95:	eb e8                	jmp    100a7f <get_from_runnable+0xa7>
  100a97:	90                   	nop

00100a98 <put_into_runnable>:
  100a98:	55                   	push   %ebp
  100a99:	89 e5                	mov    %esp,%ebp
  100a9b:	56                   	push   %esi
  100a9c:	53                   	push   %ebx
  100a9d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100aa0:	8b 15 84 34 10 00    	mov    0x103484,%edx
  100aa6:	83 fa ff             	cmp    $0xffffffff,%edx
  100aa9:	0f 84 ed 00 00 00    	je     100b9c <put_into_runnable+0x104>
  100aaf:	89 d0                	mov    %edx,%eax
  100ab1:	c1 e0 07             	shl    $0x7,%eax
  100ab4:	01 d0                	add    %edx,%eax
  100ab6:	01 c0                	add    %eax,%eax
  100ab8:	01 d0                	add    %edx,%eax
  100aba:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100abd:	8d 34 c5 40 3e 10 00 	lea    0x103e40(,%eax,8),%esi
  100ac4:	8b 8e 5c 20 00 00    	mov    0x205c(%esi),%ecx
  100aca:	89 c8                	mov    %ecx,%eax
  100acc:	c1 e0 07             	shl    $0x7,%eax
  100acf:	01 c8                	add    %ecx,%eax
  100ad1:	01 c0                	add    %eax,%eax
  100ad3:	01 c8                	add    %ecx,%eax
  100ad5:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100ad8:	89 1c c5 a0 5e 10 00 	mov    %ebx,0x105ea0(,%eax,8)
  100adf:	89 d8                	mov    %ebx,%eax
  100ae1:	c1 e0 07             	shl    $0x7,%eax
  100ae4:	01 d8                	add    %ebx,%eax
  100ae6:	01 c0                	add    %eax,%eax
  100ae8:	01 d8                	add    %ebx,%eax
  100aea:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100aed:	8d 04 c5 40 3e 10 00 	lea    0x103e40(,%eax,8),%eax
  100af4:	89 88 5c 20 00 00    	mov    %ecx,0x205c(%eax)
  100afa:	89 90 60 20 00 00    	mov    %edx,0x2060(%eax)
  100b00:	89 9e 5c 20 00 00    	mov    %ebx,0x205c(%esi)
  100b06:	89 d8                	mov    %ebx,%eax
  100b08:	c1 e0 07             	shl    $0x7,%eax
  100b0b:	01 d8                	add    %ebx,%eax
  100b0d:	01 c0                	add    %eax,%eax
  100b0f:	01 d8                	add    %ebx,%eax
  100b11:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b14:	c7 04 c5 8c 5e 10 00 	movl   $0x1,0x105e8c(,%eax,8)
  100b1b:	01 00 00 00 
  100b1f:	85 db                	test   %ebx,%ebx
  100b21:	75 0a                	jne    100b2d <put_into_runnable+0x95>
  100b23:	c7 05 78 5e 10 00 5c 	movl   $0x10095c,0x105e78
  100b2a:	09 10 00 
  100b2d:	83 ec 0c             	sub    $0xc,%esp
  100b30:	68 b8 19 10 00       	push   $0x1019b8
  100b35:	e8 3e 0c 00 00       	call   101778 <printk>
  100b3a:	58                   	pop    %eax
  100b3b:	5a                   	pop    %edx
  100b3c:	53                   	push   %ebx
  100b3d:	ff 35 84 34 10 00    	pushl  0x103484
  100b43:	68 a8 1b 10 00       	push   $0x101ba8
  100b48:	6a 75                	push   $0x75
  100b4a:	68 b1 1a 10 00       	push   $0x101ab1
  100b4f:	68 f4 1a 10 00       	push   $0x101af4
  100b54:	e8 1f 0c 00 00       	call   101778 <printk>
  100b59:	83 c4 14             	add    $0x14,%esp
  100b5c:	68 e7 19 10 00       	push   $0x1019e7
  100b61:	e8 12 0c 00 00       	call   101778 <printk>
  100b66:	89 d8                	mov    %ebx,%eax
  100b68:	c1 e0 07             	shl    $0x7,%eax
  100b6b:	01 d8                	add    %ebx,%eax
  100b6d:	01 c0                	add    %eax,%eax
  100b6f:	01 d8                	add    %ebx,%eax
  100b71:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100b74:	8d 04 c5 40 3e 10 00 	lea    0x103e40(,%eax,8),%eax
  100b7b:	8b 15 28 3e 10 00    	mov    0x103e28,%edx
  100b81:	89 90 50 20 00 00    	mov    %edx,0x2050(%eax)
  100b87:	8b 55 0c             	mov    0xc(%ebp),%edx
  100b8a:	89 90 64 20 00 00    	mov    %edx,0x2064(%eax)
  100b90:	b8 01 00 00 00       	mov    $0x1,%eax
  100b95:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100b98:	5b                   	pop    %ebx
  100b99:	5e                   	pop    %esi
  100b9a:	5d                   	pop    %ebp
  100b9b:	c3                   	ret    
  100b9c:	89 1d 84 34 10 00    	mov    %ebx,0x103484
  100ba2:	89 d8                	mov    %ebx,%eax
  100ba4:	c1 e0 07             	shl    $0x7,%eax
  100ba7:	01 d8                	add    %ebx,%eax
  100ba9:	01 c0                	add    %eax,%eax
  100bab:	01 d8                	add    %ebx,%eax
  100bad:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100bb0:	8d 04 c5 40 3e 10 00 	lea    0x103e40(,%eax,8),%eax
  100bb7:	89 98 5c 20 00 00    	mov    %ebx,0x205c(%eax)
  100bbd:	89 98 60 20 00 00    	mov    %ebx,0x2060(%eax)
  100bc3:	e9 3e ff ff ff       	jmp    100b06 <put_into_runnable+0x6e>

00100bc8 <put_into_block>:
  100bc8:	55                   	push   %ebp
  100bc9:	89 e5                	mov    %esp,%ebp
  100bcb:	57                   	push   %edi
  100bcc:	56                   	push   %esi
  100bcd:	53                   	push   %ebx
  100bce:	8b 45 08             	mov    0x8(%ebp),%eax
  100bd1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100bd4:	8b 0d 80 34 10 00    	mov    0x103480,%ecx
  100bda:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100bdd:	0f 84 99 00 00 00    	je     100c7c <put_into_block+0xb4>
  100be3:	89 ca                	mov    %ecx,%edx
  100be5:	c1 e2 07             	shl    $0x7,%edx
  100be8:	01 ca                	add    %ecx,%edx
  100bea:	01 d2                	add    %edx,%edx
  100bec:	01 ca                	add    %ecx,%edx
  100bee:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100bf1:	8d 3c d5 40 3e 10 00 	lea    0x103e40(,%edx,8),%edi
  100bf8:	8b b7 5c 20 00 00    	mov    0x205c(%edi),%esi
  100bfe:	89 f2                	mov    %esi,%edx
  100c00:	c1 e2 07             	shl    $0x7,%edx
  100c03:	01 f2                	add    %esi,%edx
  100c05:	01 d2                	add    %edx,%edx
  100c07:	01 f2                	add    %esi,%edx
  100c09:	8d 14 96             	lea    (%esi,%edx,4),%edx
  100c0c:	89 04 d5 a0 5e 10 00 	mov    %eax,0x105ea0(,%edx,8)
  100c13:	89 c2                	mov    %eax,%edx
  100c15:	c1 e2 07             	shl    $0x7,%edx
  100c18:	01 c2                	add    %eax,%edx
  100c1a:	01 d2                	add    %edx,%edx
  100c1c:	01 c2                	add    %eax,%edx
  100c1e:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c21:	8d 14 d5 40 3e 10 00 	lea    0x103e40(,%edx,8),%edx
  100c28:	89 b2 5c 20 00 00    	mov    %esi,0x205c(%edx)
  100c2e:	89 8a 60 20 00 00    	mov    %ecx,0x2060(%edx)
  100c34:	89 87 5c 20 00 00    	mov    %eax,0x205c(%edi)
  100c3a:	89 c2                	mov    %eax,%edx
  100c3c:	c1 e2 07             	shl    $0x7,%edx
  100c3f:	01 c2                	add    %eax,%edx
  100c41:	01 d2                	add    %edx,%edx
  100c43:	01 c2                	add    %eax,%edx
  100c45:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c48:	c1 e2 03             	shl    $0x3,%edx
  100c4b:	8d 82 40 5e 10 00    	lea    0x105e40(%edx),%eax
  100c51:	b9 13 00 00 00       	mov    $0x13,%ecx
  100c56:	89 c7                	mov    %eax,%edi
  100c58:	89 de                	mov    %ebx,%esi
  100c5a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100c5c:	8b 43 20             	mov    0x20(%ebx),%eax
  100c5f:	89 82 94 5e 10 00    	mov    %eax,0x105e94(%edx)
  100c65:	c7 82 8c 5e 10 00 00 	movl   $0x0,0x105e8c(%edx)
  100c6c:	00 00 00 
  100c6f:	b8 01 00 00 00       	mov    $0x1,%eax
  100c74:	5b                   	pop    %ebx
  100c75:	5e                   	pop    %esi
  100c76:	5f                   	pop    %edi
  100c77:	5d                   	pop    %ebp
  100c78:	c3                   	ret    
  100c79:	8d 76 00             	lea    0x0(%esi),%esi
  100c7c:	a3 80 34 10 00       	mov    %eax,0x103480
  100c81:	89 c2                	mov    %eax,%edx
  100c83:	c1 e2 07             	shl    $0x7,%edx
  100c86:	01 c2                	add    %eax,%edx
  100c88:	01 d2                	add    %edx,%edx
  100c8a:	01 c2                	add    %eax,%edx
  100c8c:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c8f:	8d 14 d5 40 3e 10 00 	lea    0x103e40(,%edx,8),%edx
  100c96:	89 82 60 20 00 00    	mov    %eax,0x2060(%edx)
  100c9c:	89 82 5c 20 00 00    	mov    %eax,0x205c(%edx)
  100ca2:	eb 96                	jmp    100c3a <put_into_block+0x72>

00100ca4 <get_from>:
  100ca4:	55                   	push   %ebp
  100ca5:	89 e5                	mov    %esp,%ebp
  100ca7:	56                   	push   %esi
  100ca8:	53                   	push   %ebx
  100ca9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100cac:	8b 75 0c             	mov    0xc(%ebp),%esi
  100caf:	39 f3                	cmp    %esi,%ebx
  100cb1:	74 42                	je     100cf5 <get_from+0x51>
  100cb3:	89 d8                	mov    %ebx,%eax
  100cb5:	c1 e0 07             	shl    $0x7,%eax
  100cb8:	01 d8                	add    %ebx,%eax
  100cba:	01 c0                	add    %eax,%eax
  100cbc:	01 d8                	add    %ebx,%eax
  100cbe:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100cc1:	8b 0c c5 a0 5e 10 00 	mov    0x105ea0(,%eax,8),%ecx
  100cc8:	39 cb                	cmp    %ecx,%ebx
  100cca:	75 25                	jne    100cf1 <get_from+0x4d>
  100ccc:	e9 37 01 00 00       	jmp    100e08 <get_from+0x164>
  100cd1:	8d 76 00             	lea    0x0(%esi),%esi
  100cd4:	89 ca                	mov    %ecx,%edx
  100cd6:	c1 e2 07             	shl    $0x7,%edx
  100cd9:	01 ca                	add    %ecx,%edx
  100cdb:	01 d2                	add    %edx,%edx
  100cdd:	01 ca                	add    %ecx,%edx
  100cdf:	8d 04 91             	lea    (%ecx,%edx,4),%eax
  100ce2:	8b 0c c5 a0 5e 10 00 	mov    0x105ea0(,%eax,8),%ecx
  100ce9:	39 cb                	cmp    %ecx,%ebx
  100ceb:	0f 84 17 01 00 00    	je     100e08 <get_from+0x164>
  100cf1:	39 ce                	cmp    %ecx,%esi
  100cf3:	75 df                	jne    100cd4 <get_from+0x30>
  100cf5:	89 f0                	mov    %esi,%eax
  100cf7:	c1 e0 07             	shl    $0x7,%eax
  100cfa:	01 f0                	add    %esi,%eax
  100cfc:	01 c0                	add    %eax,%eax
  100cfe:	01 f0                	add    %esi,%eax
  100d00:	8d 04 86             	lea    (%esi,%eax,4),%eax
  100d03:	8b 04 c5 8c 5e 10 00 	mov    0x105e8c(,%eax,8),%eax
  100d0a:	83 f8 01             	cmp    $0x1,%eax
  100d0d:	0f 84 59 01 00 00    	je     100e6c <get_from+0x1c8>
  100d13:	83 f8 03             	cmp    $0x3,%eax
  100d16:	74 30                	je     100d48 <get_from+0xa4>
  100d18:	85 c0                	test   %eax,%eax
  100d1a:	0f 84 40 01 00 00    	je     100e60 <get_from+0x1bc>
  100d20:	83 ec 08             	sub    $0x8,%esp
  100d23:	68 c0 00 00 00       	push   $0xc0
  100d28:	68 b1 1a 10 00       	push   $0x101ab1
  100d2d:	e8 ba 0b 00 00       	call   1018ec <abort>
  100d32:	c7 04 24 b8 19 10 00 	movl   $0x1019b8,(%esp)
  100d39:	e8 3a 0a 00 00       	call   101778 <printk>
  100d3e:	a1 00 00 00 00       	mov    0x0,%eax
  100d43:	0f 0b                	ud2    
  100d45:	8d 76 00             	lea    0x0(%esi),%esi
  100d48:	be b0 35 10 00       	mov    $0x1035b0,%esi
  100d4d:	83 ec 0c             	sub    $0xc,%esp
  100d50:	68 b8 19 10 00       	push   $0x1019b8
  100d55:	e8 1e 0a 00 00       	call   101778 <printk>
  100d5a:	58                   	pop    %eax
  100d5b:	5a                   	pop    %edx
  100d5c:	ff 36                	pushl  (%esi)
  100d5e:	53                   	push   %ebx
  100d5f:	68 9c 1b 10 00       	push   $0x101b9c
  100d64:	68 c4 00 00 00       	push   $0xc4
  100d69:	68 b1 1a 10 00       	push   $0x101ab1
  100d6e:	68 24 1b 10 00       	push   $0x101b24
  100d73:	e8 00 0a 00 00       	call   101778 <printk>
  100d78:	83 c4 14             	add    $0x14,%esp
  100d7b:	68 e7 19 10 00       	push   $0x1019e7
  100d80:	e8 f3 09 00 00       	call   101778 <printk>
  100d85:	83 c4 10             	add    $0x10,%esp
  100d88:	3b 1e                	cmp    (%esi),%ebx
  100d8a:	74 15                	je     100da1 <get_from+0xfd>
  100d8c:	83 ec 08             	sub    $0x8,%esp
  100d8f:	68 c5 00 00 00       	push   $0xc5
  100d94:	68 b1 1a 10 00       	push   $0x101ab1
  100d99:	e8 4e 0b 00 00       	call   1018ec <abort>
  100d9e:	83 c4 10             	add    $0x10,%esp
  100da1:	83 fb ff             	cmp    $0xffffffff,%ebx
  100da4:	0f 84 a9 00 00 00    	je     100e53 <get_from+0x1af>
  100daa:	89 d8                	mov    %ebx,%eax
  100dac:	c1 e0 07             	shl    $0x7,%eax
  100daf:	01 d8                	add    %ebx,%eax
  100db1:	01 c0                	add    %eax,%eax
  100db3:	01 d8                	add    %ebx,%eax
  100db5:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100db8:	8d 04 c5 40 3e 10 00 	lea    0x103e40(,%eax,8),%eax
  100dbf:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  100dc5:	39 da                	cmp    %ebx,%edx
  100dc7:	0f 84 ab 00 00 00    	je     100e78 <get_from+0x1d4>
  100dcd:	8b 88 5c 20 00 00    	mov    0x205c(%eax),%ecx
  100dd3:	89 c8                	mov    %ecx,%eax
  100dd5:	c1 e0 07             	shl    $0x7,%eax
  100dd8:	01 c8                	add    %ecx,%eax
  100dda:	01 c0                	add    %eax,%eax
  100ddc:	01 c8                	add    %ecx,%eax
  100dde:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100de1:	89 14 c5 a0 5e 10 00 	mov    %edx,0x105ea0(,%eax,8)
  100de8:	89 d0                	mov    %edx,%eax
  100dea:	c1 e0 07             	shl    $0x7,%eax
  100ded:	01 d0                	add    %edx,%eax
  100def:	01 c0                	add    %eax,%eax
  100df1:	01 d0                	add    %edx,%eax
  100df3:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100df6:	89 0c c5 9c 5e 10 00 	mov    %ecx,0x105e9c(,%eax,8)
  100dfd:	89 16                	mov    %edx,(%esi)
  100dff:	89 d8                	mov    %ebx,%eax
  100e01:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e04:	5b                   	pop    %ebx
  100e05:	5e                   	pop    %esi
  100e06:	5d                   	pop    %ebp
  100e07:	c3                   	ret    
  100e08:	83 ec 0c             	sub    $0xc,%esp
  100e0b:	68 b8 19 10 00       	push   $0x1019b8
  100e10:	e8 63 09 00 00       	call   101778 <printk>
  100e15:	58                   	pop    %eax
  100e16:	5a                   	pop    %edx
  100e17:	56                   	push   %esi
  100e18:	53                   	push   %ebx
  100e19:	68 9c 1b 10 00       	push   $0x101b9c
  100e1e:	68 ad 00 00 00       	push   $0xad
  100e23:	68 b1 1a 10 00       	push   $0x101ab1
  100e28:	68 4c 1b 10 00       	push   $0x101b4c
  100e2d:	e8 46 09 00 00       	call   101778 <printk>
  100e32:	83 c4 14             	add    $0x14,%esp
  100e35:	68 e7 19 10 00       	push   $0x1019e7
  100e3a:	e8 39 09 00 00       	call   101778 <printk>
  100e3f:	59                   	pop    %ecx
  100e40:	5b                   	pop    %ebx
  100e41:	68 ae 00 00 00       	push   $0xae
  100e46:	68 b1 1a 10 00       	push   $0x101ab1
  100e4b:	e8 9c 0a 00 00       	call   1018ec <abort>
  100e50:	83 c4 10             	add    $0x10,%esp
  100e53:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e58:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e5b:	5b                   	pop    %ebx
  100e5c:	5e                   	pop    %esi
  100e5d:	5d                   	pop    %ebp
  100e5e:	c3                   	ret    
  100e5f:	90                   	nop
  100e60:	be 80 34 10 00       	mov    $0x103480,%esi
  100e65:	e9 e3 fe ff ff       	jmp    100d4d <get_from+0xa9>
  100e6a:	66 90                	xchg   %ax,%ax
  100e6c:	be 84 34 10 00       	mov    $0x103484,%esi
  100e71:	e9 d7 fe ff ff       	jmp    100d4d <get_from+0xa9>
  100e76:	66 90                	xchg   %ax,%ax
  100e78:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100e7e:	89 d8                	mov    %ebx,%eax
  100e80:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e83:	5b                   	pop    %ebx
  100e84:	5e                   	pop    %esi
  100e85:	5d                   	pop    %ebp
  100e86:	c3                   	ret    
  100e87:	90                   	nop

00100e88 <apply_new_pid>:
  100e88:	55                   	push   %ebp
  100e89:	89 e5                	mov    %esp,%ebp
  100e8b:	83 ec 10             	sub    $0x10,%esp
  100e8e:	a1 b0 35 10 00       	mov    0x1035b0,%eax
  100e93:	50                   	push   %eax
  100e94:	50                   	push   %eax
  100e95:	e8 0a fe ff ff       	call   100ca4 <get_from>
  100e9a:	c9                   	leave  
  100e9b:	c3                   	ret    

00100e9c <get_from_block>:
  100e9c:	55                   	push   %ebp
  100e9d:	89 e5                	mov    %esp,%ebp
  100e9f:	83 ec 10             	sub    $0x10,%esp
  100ea2:	ff 75 08             	pushl  0x8(%ebp)
  100ea5:	ff 35 80 34 10 00    	pushl  0x103480
  100eab:	e8 f4 fd ff ff       	call   100ca4 <get_from>
  100eb0:	83 c4 10             	add    $0x10,%esp
  100eb3:	40                   	inc    %eax
  100eb4:	74 0a                	je     100ec0 <get_from_block+0x24>
  100eb6:	b8 01 00 00 00       	mov    $0x1,%eax
  100ebb:	c9                   	leave  
  100ebc:	c3                   	ret    
  100ebd:	8d 76 00             	lea    0x0(%esi),%esi
  100ec0:	83 ec 08             	sub    $0x8,%esp
  100ec3:	68 dc 00 00 00       	push   $0xdc
  100ec8:	68 b1 1a 10 00       	push   $0x101ab1
  100ecd:	e8 1a 0a 00 00       	call   1018ec <abort>
  100ed2:	83 c4 10             	add    $0x10,%esp
  100ed5:	b8 01 00 00 00       	mov    $0x1,%eax
  100eda:	c9                   	leave  
  100edb:	c3                   	ret    

00100edc <check_block>:
  100edc:	8b 15 80 34 10 00    	mov    0x103480,%edx
  100ee2:	83 fa ff             	cmp    $0xffffffff,%edx
  100ee5:	0f 84 9d 00 00 00    	je     100f88 <check_block+0xac>
  100eeb:	55                   	push   %ebp
  100eec:	89 e5                	mov    %esp,%ebp
  100eee:	57                   	push   %edi
  100eef:	56                   	push   %esi
  100ef0:	53                   	push   %ebx
  100ef1:	83 ec 0c             	sub    $0xc,%esp
  100ef4:	89 d3                	mov    %edx,%ebx
  100ef6:	eb 1e                	jmp    100f16 <check_block+0x3a>
  100ef8:	89 d8                	mov    %ebx,%eax
  100efa:	c1 e0 07             	shl    $0x7,%eax
  100efd:	01 d8                	add    %ebx,%eax
  100eff:	01 c0                	add    %eax,%eax
  100f01:	01 d8                	add    %ebx,%eax
  100f03:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100f06:	8b 1c c5 a0 5e 10 00 	mov    0x105ea0(,%eax,8),%ebx
  100f0d:	39 d3                	cmp    %edx,%ebx
  100f0f:	74 6a                	je     100f7b <check_block+0x9f>
  100f11:	83 fa ff             	cmp    $0xffffffff,%edx
  100f14:	74 65                	je     100f7b <check_block+0x9f>
  100f16:	89 d8                	mov    %ebx,%eax
  100f18:	c1 e0 07             	shl    $0x7,%eax
  100f1b:	01 d8                	add    %ebx,%eax
  100f1d:	01 c0                	add    %eax,%eax
  100f1f:	01 d8                	add    %ebx,%eax
  100f21:	8d 34 83             	lea    (%ebx,%eax,4),%esi
  100f24:	c1 e6 03             	shl    $0x3,%esi
  100f27:	8b be 8c 5e 10 00    	mov    0x105e8c(%esi),%edi
  100f2d:	85 ff                	test   %edi,%edi
  100f2f:	75 c7                	jne    100ef8 <check_block+0x1c>
  100f31:	8b 8e 94 5e 10 00    	mov    0x105e94(%esi),%ecx
  100f37:	85 c9                	test   %ecx,%ecx
  100f39:	7f bd                	jg     100ef8 <check_block+0x1c>
  100f3b:	8b be a0 5e 10 00    	mov    0x105ea0(%esi),%edi
  100f41:	83 ec 0c             	sub    $0xc,%esp
  100f44:	53                   	push   %ebx
  100f45:	e8 52 ff ff ff       	call   100e9c <get_from_block>
  100f4a:	58                   	pop    %eax
  100f4b:	5a                   	pop    %edx
  100f4c:	81 c6 40 5e 10 00    	add    $0x105e40,%esi
  100f52:	56                   	push   %esi
  100f53:	53                   	push   %ebx
  100f54:	e8 3f fb ff ff       	call   100a98 <put_into_runnable>
  100f59:	89 f8                	mov    %edi,%eax
  100f5b:	c1 e0 07             	shl    $0x7,%eax
  100f5e:	01 f8                	add    %edi,%eax
  100f60:	01 c0                	add    %eax,%eax
  100f62:	01 f8                	add    %edi,%eax
  100f64:	8d 04 87             	lea    (%edi,%eax,4),%eax
  100f67:	8b 1c c5 a0 5e 10 00 	mov    0x105ea0(,%eax,8),%ebx
  100f6e:	83 c4 10             	add    $0x10,%esp
  100f71:	8b 15 80 34 10 00    	mov    0x103480,%edx
  100f77:	39 d3                	cmp    %edx,%ebx
  100f79:	75 96                	jne    100f11 <check_block+0x35>
  100f7b:	b8 01 00 00 00       	mov    $0x1,%eax
  100f80:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100f83:	5b                   	pop    %ebx
  100f84:	5e                   	pop    %esi
  100f85:	5f                   	pop    %edi
  100f86:	5d                   	pop    %ebp
  100f87:	c3                   	ret    
  100f88:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100f8d:	c3                   	ret    
  100f8e:	66 90                	xchg   %ax,%ax

00100f90 <checkTimeCount>:
  100f90:	a1 24 3e 10 00       	mov    0x103e24,%eax
  100f95:	85 c0                	test   %eax,%eax
  100f97:	0f 84 ef 00 00 00    	je     10108c <checkTimeCount+0xfc>
  100f9d:	55                   	push   %ebp
  100f9e:	89 e5                	mov    %esp,%ebp
  100fa0:	57                   	push   %edi
  100fa1:	56                   	push   %esi
  100fa2:	83 ec 0c             	sub    $0xc,%esp
  100fa5:	68 b8 19 10 00       	push   $0x1019b8
  100faa:	e8 c9 07 00 00       	call   101778 <printk>
  100faf:	8b 15 20 3e 10 00    	mov    0x103e20,%edx
  100fb5:	58                   	pop    %eax
  100fb6:	59                   	pop    %ecx
  100fb7:	89 d0                	mov    %edx,%eax
  100fb9:	c1 e0 07             	shl    $0x7,%eax
  100fbc:	01 d0                	add    %edx,%eax
  100fbe:	01 c0                	add    %eax,%eax
  100fc0:	01 d0                	add    %edx,%eax
  100fc2:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100fc5:	ff 34 c5 90 5e 10 00 	pushl  0x105e90(,%eax,8)
  100fcc:	52                   	push   %edx
  100fcd:	68 d0 1b 10 00       	push   $0x101bd0
  100fd2:	6a 19                	push   $0x19
  100fd4:	68 b1 1a 10 00       	push   $0x101ab1
  100fd9:	68 70 1b 10 00       	push   $0x101b70
  100fde:	e8 95 07 00 00       	call   101778 <printk>
  100fe3:	83 c4 14             	add    $0x14,%esp
  100fe6:	68 e7 19 10 00       	push   $0x1019e7
  100feb:	e8 88 07 00 00       	call   101778 <printk>
  100ff0:	e8 e7 fe ff ff       	call   100edc <check_block>
  100ff5:	8b 15 20 3e 10 00    	mov    0x103e20,%edx
  100ffb:	89 d0                	mov    %edx,%eax
  100ffd:	c1 e0 07             	shl    $0x7,%eax
  101000:	01 d0                	add    %edx,%eax
  101002:	01 c0                	add    %eax,%eax
  101004:	01 d0                	add    %edx,%eax
  101006:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101009:	c1 e0 03             	shl    $0x3,%eax
  10100c:	83 c4 10             	add    $0x10,%esp
  10100f:	8b b0 90 5e 10 00    	mov    0x105e90(%eax),%esi
  101015:	85 f6                	test   %esi,%esi
  101017:	7e 0f                	jle    101028 <checkTimeCount+0x98>
  101019:	b8 01 00 00 00       	mov    $0x1,%eax
  10101e:	8d 65 f8             	lea    -0x8(%ebp),%esp
  101021:	5e                   	pop    %esi
  101022:	5f                   	pop    %edi
  101023:	5d                   	pop    %ebp
  101024:	c3                   	ret    
  101025:	8d 76 00             	lea    0x0(%esi),%esi
  101028:	05 40 5e 10 00       	add    $0x105e40,%eax
  10102d:	b9 13 00 00 00       	mov    $0x13,%ecx
  101032:	89 c7                	mov    %eax,%edi
  101034:	8b 75 08             	mov    0x8(%ebp),%esi
  101037:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101039:	83 ec 08             	sub    $0x8,%esp
  10103c:	ff 75 08             	pushl  0x8(%ebp)
  10103f:	52                   	push   %edx
  101040:	e8 53 fa ff ff       	call   100a98 <put_into_runnable>
  101045:	e8 8e f9 ff ff       	call   1009d8 <get_from_runnable>
  10104a:	83 c4 10             	add    $0x10,%esp
  10104d:	3b 05 20 3e 10 00    	cmp    0x103e20,%eax
  101053:	74 c4                	je     101019 <checkTimeCount+0x89>
  101055:	a3 20 3e 10 00       	mov    %eax,0x103e20
  10105a:	83 ec 08             	sub    $0x8,%esp
  10105d:	89 c2                	mov    %eax,%edx
  10105f:	c1 e2 07             	shl    $0x7,%edx
  101062:	01 c2                	add    %eax,%edx
  101064:	01 d2                	add    %edx,%edx
  101066:	01 c2                	add    %eax,%edx
  101068:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10106b:	8d 04 c5 3c 5e 10 00 	lea    0x105e3c(,%eax,8),%eax
  101072:	50                   	push   %eax
  101073:	6a 10                	push   $0x10
  101075:	e8 3a f1 ff ff       	call   1001b4 <change_tss>
  10107a:	83 c4 10             	add    $0x10,%esp
  10107d:	b8 01 00 00 00       	mov    $0x1,%eax
  101082:	8d 65 f8             	lea    -0x8(%ebp),%esp
  101085:	5e                   	pop    %esi
  101086:	5f                   	pop    %edi
  101087:	5d                   	pop    %ebp
  101088:	c3                   	ret    
  101089:	8d 76 00             	lea    0x0(%esi),%esi
  10108c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101091:	c3                   	ret    
  101092:	66 90                	xchg   %ax,%ax

00101094 <check_is_in>:
  101094:	55                   	push   %ebp
  101095:	89 e5                	mov    %esp,%ebp
  101097:	53                   	push   %ebx
  101098:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10109b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  10109e:	39 d9                	cmp    %ebx,%ecx
  1010a0:	74 3b                	je     1010dd <check_is_in+0x49>
  1010a2:	89 c8                	mov    %ecx,%eax
  1010a4:	c1 e0 07             	shl    $0x7,%eax
  1010a7:	01 c8                	add    %ecx,%eax
  1010a9:	01 c0                	add    %eax,%eax
  1010ab:	01 c8                	add    %ecx,%eax
  1010ad:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  1010b0:	8b 14 c5 a0 5e 10 00 	mov    0x105ea0(,%eax,8),%edx
  1010b7:	39 d1                	cmp    %edx,%ecx
  1010b9:	75 1e                	jne    1010d9 <check_is_in+0x45>
  1010bb:	eb 2b                	jmp    1010e8 <check_is_in+0x54>
  1010bd:	8d 76 00             	lea    0x0(%esi),%esi
  1010c0:	89 d0                	mov    %edx,%eax
  1010c2:	c1 e0 07             	shl    $0x7,%eax
  1010c5:	01 d0                	add    %edx,%eax
  1010c7:	01 c0                	add    %eax,%eax
  1010c9:	01 d0                	add    %edx,%eax
  1010cb:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1010ce:	8b 14 c5 a0 5e 10 00 	mov    0x105ea0(,%eax,8),%edx
  1010d5:	39 d1                	cmp    %edx,%ecx
  1010d7:	74 0f                	je     1010e8 <check_is_in+0x54>
  1010d9:	39 d3                	cmp    %edx,%ebx
  1010db:	75 e3                	jne    1010c0 <check_is_in+0x2c>
  1010dd:	b8 01 00 00 00       	mov    $0x1,%eax
  1010e2:	5b                   	pop    %ebx
  1010e3:	5d                   	pop    %ebp
  1010e4:	c3                   	ret    
  1010e5:	8d 76 00             	lea    0x0(%esi),%esi
  1010e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1010ed:	5b                   	pop    %ebx
  1010ee:	5d                   	pop    %ebp
  1010ef:	c3                   	ret    

001010f0 <block_decrease>:
  1010f0:	55                   	push   %ebp
  1010f1:	89 e5                	mov    %esp,%ebp
  1010f3:	8b 0d 80 34 10 00    	mov    0x103480,%ecx
  1010f9:	83 f9 ff             	cmp    $0xffffffff,%ecx
  1010fc:	74 2e                	je     10112c <block_decrease+0x3c>
  1010fe:	89 ca                	mov    %ecx,%edx
  101100:	89 d0                	mov    %edx,%eax
  101102:	c1 e0 07             	shl    $0x7,%eax
  101105:	01 d0                	add    %edx,%eax
  101107:	01 c0                	add    %eax,%eax
  101109:	01 d0                	add    %edx,%eax
  10110b:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10110e:	8d 04 c5 40 3e 10 00 	lea    0x103e40(,%eax,8),%eax
  101115:	ff 88 54 20 00 00    	decl   0x2054(%eax)
  10111b:	8b 90 60 20 00 00    	mov    0x2060(%eax),%edx
  101121:	39 d1                	cmp    %edx,%ecx
  101123:	75 db                	jne    101100 <block_decrease+0x10>
  101125:	b8 01 00 00 00       	mov    $0x1,%eax
  10112a:	5d                   	pop    %ebp
  10112b:	c3                   	ret    
  10112c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101131:	5d                   	pop    %ebp
  101132:	c3                   	ret    
  101133:	90                   	nop

00101134 <init_pcb>:
  101134:	55                   	push   %ebp
  101135:	89 e5                	mov    %esp,%ebp
  101137:	c7 05 28 3e 10 00 05 	movl   $0x5,0x103e28
  10113e:	00 00 00 
  101141:	ba 98 5e 10 00       	mov    $0x105e98,%edx
  101146:	31 c0                	xor    %eax,%eax
  101148:	89 02                	mov    %eax,(%edx)
  10114a:	8d 48 ff             	lea    -0x1(%eax),%ecx
  10114d:	89 4a 04             	mov    %ecx,0x4(%edx)
  101150:	40                   	inc    %eax
  101151:	89 42 08             	mov    %eax,0x8(%edx)
  101154:	c7 42 f4 03 00 00 00 	movl   $0x3,-0xc(%edx)
  10115b:	81 c2 68 20 00 00    	add    $0x2068,%edx
  101161:	3d 00 08 00 00       	cmp    $0x800,%eax
  101166:	75 e0                	jne    101148 <init_pcb+0x14>
  101168:	c7 05 9c 5e 10 00 ff 	movl   $0x7ff,0x105e9c
  10116f:	07 00 00 
  101172:	c7 05 38 7e 13 01 00 	movl   $0x0,0x1137e38
  101179:	00 00 00 
  10117c:	5d                   	pop    %ebp
  10117d:	c3                   	ret    
  10117e:	66 90                	xchg   %ax,%ax

00101180 <init_kernel_pcb>:
  101180:	55                   	push   %ebp
  101181:	89 e5                	mov    %esp,%ebp
  101183:	83 ec 10             	sub    $0x10,%esp
  101186:	a1 b0 35 10 00       	mov    0x1035b0,%eax
  10118b:	50                   	push   %eax
  10118c:	50                   	push   %eax
  10118d:	e8 12 fb ff ff       	call   100ca4 <get_from>
  101192:	83 c4 10             	add    $0x10,%esp
  101195:	85 c0                	test   %eax,%eax
  101197:	74 15                	je     1011ae <init_kernel_pcb+0x2e>
  101199:	83 ec 08             	sub    $0x8,%esp
  10119c:	68 10 01 00 00       	push   $0x110
  1011a1:	68 b1 1a 10 00       	push   $0x101ab1
  1011a6:	e8 41 07 00 00       	call   1018ec <abort>
  1011ab:	83 c4 10             	add    $0x10,%esp
  1011ae:	c7 05 88 5e 10 00 10 	movl   $0x10,0x105e88
  1011b5:	00 00 00 
  1011b8:	c7 05 7c 5e 10 00 08 	movl   $0x8,0x105e7c
  1011bf:	00 00 00 
  1011c2:	c7 05 4c 5e 10 00 10 	movl   $0x10,0x105e4c
  1011c9:	00 00 00 
  1011cc:	c7 05 48 5e 10 00 10 	movl   $0x10,0x105e48
  1011d3:	00 00 00 
  1011d6:	c7 05 78 5e 10 00 5c 	movl   $0x10095c,0x105e78
  1011dd:	09 10 00 
  1011e0:	c7 05 84 5e 10 00 00 	movl   $0x400000,0x105e84
  1011e7:	00 40 00 
  1011ea:	c7 05 8c 5e 10 00 01 	movl   $0x1,0x105e8c
  1011f1:	00 00 00 
  1011f4:	c7 05 90 5e 10 00 04 	movl   $0x4,0x105e90
  1011fb:	00 00 00 
  1011fe:	b8 01 00 00 00       	mov    $0x1,%eax
  101203:	c9                   	leave  
  101204:	c3                   	ret    
  101205:	8d 76 00             	lea    0x0(%esi),%esi

00101208 <make_pcb>:
  101208:	55                   	push   %ebp
  101209:	89 e5                	mov    %esp,%ebp
  10120b:	57                   	push   %edi
  10120c:	56                   	push   %esi
  10120d:	8b 55 08             	mov    0x8(%ebp),%edx
  101210:	89 d0                	mov    %edx,%eax
  101212:	c1 e0 07             	shl    $0x7,%eax
  101215:	01 d0                	add    %edx,%eax
  101217:	01 c0                	add    %eax,%eax
  101219:	01 d0                	add    %edx,%eax
  10121b:	8d 14 82             	lea    (%edx,%eax,4),%edx
  10121e:	c1 e2 03             	shl    $0x3,%edx
  101221:	8d 82 40 5e 10 00    	lea    0x105e40(%edx),%eax
  101227:	b9 13 00 00 00       	mov    $0x13,%ecx
  10122c:	89 c7                	mov    %eax,%edi
  10122e:	8b 75 0c             	mov    0xc(%ebp),%esi
  101231:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101233:	8b 45 10             	mov    0x10(%ebp),%eax
  101236:	89 82 8c 5e 10 00    	mov    %eax,0x105e8c(%edx)
  10123c:	8b 45 14             	mov    0x14(%ebp),%eax
  10123f:	89 82 90 5e 10 00    	mov    %eax,0x105e90(%edx)
  101245:	8b 45 18             	mov    0x18(%ebp),%eax
  101248:	89 82 94 5e 10 00    	mov    %eax,0x105e94(%edx)
  10124e:	8b 45 0c             	mov    0xc(%ebp),%eax
  101251:	89 82 a4 5e 10 00    	mov    %eax,0x105ea4(%edx)
  101257:	b8 01 00 00 00       	mov    $0x1,%eax
  10125c:	5e                   	pop    %esi
  10125d:	5f                   	pop    %edi
  10125e:	5d                   	pop    %ebp
  10125f:	c3                   	ret    

00101260 <initIdt>:
  101260:	55                   	push   %ebp
  101261:	89 e5                	mov    %esp,%ebp
  101263:	53                   	push   %ebx
  101264:	ba 83 19 10 00       	mov    $0x101983,%edx
  101269:	89 d3                	mov    %edx,%ebx
  10126b:	c1 ea 10             	shr    $0x10,%edx
  10126e:	b9 20 87 13 01       	mov    $0x1138720,%ecx
  101273:	b8 20 7f 13 01       	mov    $0x1137f20,%eax
  101278:	66 89 18             	mov    %bx,(%eax)
  10127b:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  101281:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  101285:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  101289:	66 89 50 06          	mov    %dx,0x6(%eax)
  10128d:	83 c0 08             	add    $0x8,%eax
  101290:	39 c1                	cmp    %eax,%ecx
  101292:	75 e4                	jne    101278 <initIdt+0x18>
  101294:	b8 89 19 10 00       	mov    $0x101989,%eax
  101299:	66 a3 88 7f 13 01    	mov    %ax,0x1137f88
  10129f:	66 c7 05 8a 7f 13 01 	movw   $0x8,0x1137f8a
  1012a6:	08 00 
  1012a8:	c6 05 8c 7f 13 01 00 	movb   $0x0,0x1137f8c
  1012af:	c6 05 8d 7f 13 01 8f 	movb   $0x8f,0x1137f8d
  1012b6:	c1 e8 10             	shr    $0x10,%eax
  1012b9:	66 a3 8e 7f 13 01    	mov    %ax,0x1137f8e
  1012bf:	b8 8d 19 10 00       	mov    $0x10198d,%eax
  1012c4:	66 a3 20 83 13 01    	mov    %ax,0x1138320
  1012ca:	66 c7 05 22 83 13 01 	movw   $0x8,0x1138322
  1012d1:	08 00 
  1012d3:	c6 05 24 83 13 01 00 	movb   $0x0,0x1138324
  1012da:	c6 05 25 83 13 01 ee 	movb   $0xee,0x1138325
  1012e1:	c1 e8 10             	shr    $0x10,%eax
  1012e4:	66 a3 26 83 13 01    	mov    %ax,0x1138326
  1012ea:	b8 96 19 10 00       	mov    $0x101996,%eax
  1012ef:	66 a3 20 80 13 01    	mov    %ax,0x1138020
  1012f5:	66 c7 05 22 80 13 01 	movw   $0x8,0x1138022
  1012fc:	08 00 
  1012fe:	c6 05 24 80 13 01 00 	movb   $0x0,0x1138024
  101305:	c6 05 25 80 13 01 8e 	movb   $0x8e,0x1138025
  10130c:	c1 e8 10             	shr    $0x10,%eax
  10130f:	66 a3 26 80 13 01    	mov    %ax,0x1138026
  101315:	66 c7 05 b4 35 10 00 	movw   $0x7ff,0x1035b4
  10131c:	ff 07 
  10131e:	b8 20 7f 13 01       	mov    $0x1137f20,%eax
  101323:	66 a3 b6 35 10 00    	mov    %ax,0x1035b6
  101329:	c1 e8 10             	shr    $0x10,%eax
  10132c:	66 a3 b8 35 10 00    	mov    %ax,0x1035b8
  101332:	b8 b4 35 10 00       	mov    $0x1035b4,%eax
  101337:	0f 01 18             	lidtl  (%eax)
  10133a:	5b                   	pop    %ebx
  10133b:	5d                   	pop    %ebp
  10133c:	c3                   	ret    
  10133d:	66 90                	xchg   %ax,%ax
  10133f:	90                   	nop

00101340 <syscallHandle>:
  101340:	55                   	push   %ebp
  101341:	89 e5                	mov    %esp,%ebp
  101343:	53                   	push   %ebx
  101344:	50                   	push   %eax
  101345:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101348:	8b 43 2c             	mov    0x2c(%ebx),%eax
  10134b:	83 f8 04             	cmp    $0x4,%eax
  10134e:	74 58                	je     1013a8 <syscallHandle+0x68>
  101350:	77 1e                	ja     101370 <syscallHandle+0x30>
  101352:	83 f8 01             	cmp    $0x1,%eax
  101355:	74 45                	je     10139c <syscallHandle+0x5c>
  101357:	83 f8 02             	cmp    $0x2,%eax
  10135a:	75 0f                	jne    10136b <syscallHandle+0x2b>
  10135c:	83 ec 0c             	sub    $0xc,%esp
  10135f:	53                   	push   %ebx
  101360:	e8 33 f3 ff ff       	call   100698 <sys_fork>
  101365:	89 43 2c             	mov    %eax,0x2c(%ebx)
  101368:	83 c4 10             	add    $0x10,%esp
  10136b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10136e:	c9                   	leave  
  10136f:	c3                   	ret    
  101370:	83 f8 07             	cmp    $0x7,%eax
  101373:	74 13                	je     101388 <syscallHandle+0x48>
  101375:	3d e6 00 00 00       	cmp    $0xe6,%eax
  10137a:	75 ef                	jne    10136b <syscallHandle+0x2b>
  10137c:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10137f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101382:	c9                   	leave  
  101383:	e9 8c f2 ff ff       	jmp    100614 <sys_sleep>
  101388:	83 ec 0c             	sub    $0xc,%esp
  10138b:	53                   	push   %ebx
  10138c:	e8 77 f2 ff ff       	call   100608 <sys_getpid>
  101391:	89 43 2c             	mov    %eax,0x2c(%ebx)
  101394:	83 c4 10             	add    $0x10,%esp
  101397:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10139a:	c9                   	leave  
  10139b:	c3                   	ret    
  10139c:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10139f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1013a2:	c9                   	leave  
  1013a3:	e9 38 f2 ff ff       	jmp    1005e0 <sys_exit>
  1013a8:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1013ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1013ae:	c9                   	leave  
  1013af:	e9 f4 f4 ff ff       	jmp    1008a8 <sys_write>

001013b4 <GProtectFaultHandle>:
  1013b4:	55                   	push   %ebp
  1013b5:	89 e5                	mov    %esp,%ebp
  1013b7:	83 ec 14             	sub    $0x14,%esp
  1013ba:	68 b8 19 10 00       	push   $0x1019b8
  1013bf:	e8 b4 03 00 00       	call   101778 <printk>
  1013c4:	58                   	pop    %eax
  1013c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1013c8:	ff 70 30             	pushl  0x30(%eax)
  1013cb:	68 50 1c 10 00       	push   $0x101c50
  1013d0:	6a 6b                	push   $0x6b
  1013d2:	68 df 1b 10 00       	push   $0x101bdf
  1013d7:	68 f2 1b 10 00       	push   $0x101bf2
  1013dc:	e8 97 03 00 00       	call   101778 <printk>
  1013e1:	83 c4 14             	add    $0x14,%esp
  1013e4:	68 e7 19 10 00       	push   $0x1019e7
  1013e9:	e8 8a 03 00 00       	call   101778 <printk>
  1013ee:	5a                   	pop    %edx
  1013ef:	59                   	pop    %ecx
  1013f0:	6a 6c                	push   $0x6c
  1013f2:	68 df 1b 10 00       	push   $0x101bdf
  1013f7:	e8 f0 04 00 00       	call   1018ec <abort>
  1013fc:	83 c4 10             	add    $0x10,%esp
  1013ff:	c9                   	leave  
  101400:	c3                   	ret    
  101401:	8d 76 00             	lea    0x0(%esi),%esi

00101404 <timeHandle>:
  101404:	55                   	push   %ebp
  101405:	89 e5                	mov    %esp,%ebp
  101407:	53                   	push   %ebx
  101408:	83 ec 10             	sub    $0x10,%esp
  10140b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10140e:	6a 41                	push   $0x41
  101410:	e8 2b f5 ff ff       	call   100940 <putChar>
  101415:	e8 8e f5 ff ff       	call   1009a8 <getpid>
  10141a:	89 c2                	mov    %eax,%edx
  10141c:	c1 e2 07             	shl    $0x7,%edx
  10141f:	01 c2                	add    %eax,%edx
  101421:	01 d2                	add    %edx,%edx
  101423:	01 c2                	add    %eax,%edx
  101425:	8d 04 90             	lea    (%eax,%edx,4),%eax
  101428:	ff 0c c5 90 5e 10 00 	decl   0x105e90(,%eax,8)
  10142f:	e8 bc fc ff ff       	call   1010f0 <block_decrease>
  101434:	89 1c 24             	mov    %ebx,(%esp)
  101437:	e8 54 fb ff ff       	call   100f90 <checkTimeCount>
  10143c:	83 c4 10             	add    $0x10,%esp
  10143f:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  101446:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101449:	c9                   	leave  
  10144a:	e9 f1 f4 ff ff       	jmp    100940 <putChar>
  10144f:	90                   	nop

00101450 <irqHandle>:
  101450:	55                   	push   %ebp
  101451:	89 e5                	mov    %esp,%ebp
  101453:	57                   	push   %edi
  101454:	56                   	push   %esi
  101455:	53                   	push   %ebx
  101456:	83 ec 0c             	sub    $0xc,%esp
  101459:	8b 7d 08             	mov    0x8(%ebp),%edi
  10145c:	b8 10 00 00 00       	mov    $0x10,%eax
  101461:	89 c0                	mov    %eax,%eax
  101463:	8e d8                	mov    %eax,%ds
  101465:	8e e0                	mov    %eax,%fs
  101467:	8e c0                	mov    %eax,%es
  101469:	b8 30 00 00 00       	mov    $0x30,%eax
  10146e:	89 c0                	mov    %eax,%eax
  101470:	8e e8                	mov    %eax,%gs
  101472:	89 ee                	mov    %ebp,%esi
  101474:	3b 7e 08             	cmp    0x8(%esi),%edi
  101477:	74 12                	je     10148b <irqHandle+0x3b>
  101479:	83 ec 08             	sub    $0x8,%esp
  10147c:	6a 20                	push   $0x20
  10147e:	68 df 1b 10 00       	push   $0x101bdf
  101483:	e8 64 04 00 00       	call   1018ec <abort>
  101488:	83 c4 10             	add    $0x10,%esp
  10148b:	8b 1d 20 3e 10 00    	mov    0x103e20,%ebx
  101491:	fa                   	cli    
  101492:	8b 47 30             	mov    0x30(%edi),%eax
  101495:	83 f8 0d             	cmp    $0xd,%eax
  101498:	0f 84 46 01 00 00    	je     1015e4 <irqHandle+0x194>
  10149e:	0f 8e e8 00 00 00    	jle    10158c <irqHandle+0x13c>
  1014a4:	83 f8 20             	cmp    $0x20,%eax
  1014a7:	74 2f                	je     1014d8 <irqHandle+0x88>
  1014a9:	83 c0 80             	add    $0xffffff80,%eax
  1014ac:	0f 85 e1 00 00 00    	jne    101593 <irqHandle+0x143>
  1014b2:	83 ec 0c             	sub    $0xc,%esp
  1014b5:	57                   	push   %edi
  1014b6:	e8 85 fe ff ff       	call   101340 <syscallHandle>
  1014bb:	8b 47 30             	mov    0x30(%edi),%eax
  1014be:	83 c4 10             	add    $0x10,%esp
  1014c1:	3d 80 00 00 00       	cmp    $0x80,%eax
  1014c6:	74 28                	je     1014f0 <irqHandle+0xa0>
  1014c8:	83 f8 20             	cmp    $0x20,%eax
  1014cb:	74 23                	je     1014f0 <irqHandle+0xa0>
  1014cd:	fb                   	sti    
  1014ce:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1014d1:	5b                   	pop    %ebx
  1014d2:	5e                   	pop    %esi
  1014d3:	5f                   	pop    %edi
  1014d4:	5d                   	pop    %ebp
  1014d5:	c3                   	ret    
  1014d6:	66 90                	xchg   %ax,%ax
  1014d8:	83 ec 0c             	sub    $0xc,%esp
  1014db:	57                   	push   %edi
  1014dc:	e8 23 ff ff ff       	call   101404 <timeHandle>
  1014e1:	8b 47 30             	mov    0x30(%edi),%eax
  1014e4:	83 c4 10             	add    $0x10,%esp
  1014e7:	3d 80 00 00 00       	cmp    $0x80,%eax
  1014ec:	75 da                	jne    1014c8 <irqHandle+0x78>
  1014ee:	66 90                	xchg   %ax,%ax
  1014f0:	8b 15 20 3e 10 00    	mov    0x103e20,%edx
  1014f6:	39 d3                	cmp    %edx,%ebx
  1014f8:	74 d3                	je     1014cd <irqHandle+0x7d>
  1014fa:	89 d0                	mov    %edx,%eax
  1014fc:	c1 e0 07             	shl    $0x7,%eax
  1014ff:	01 d0                	add    %edx,%eax
  101501:	01 c0                	add    %eax,%eax
  101503:	01 d0                	add    %edx,%eax
  101505:	8d 04 82             	lea    (%edx,%eax,4),%eax
  101508:	8d 04 c5 f0 5d 10 00 	lea    0x105df0(,%eax,8),%eax
  10150f:	89 46 08             	mov    %eax,0x8(%esi)
  101512:	8b 0d 20 3e 10 00    	mov    0x103e20,%ecx
  101518:	89 ca                	mov    %ecx,%edx
  10151a:	c1 e2 07             	shl    $0x7,%edx
  10151d:	01 ca                	add    %ecx,%edx
  10151f:	01 d2                	add    %edx,%edx
  101521:	01 ca                	add    %ecx,%edx
  101523:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  101526:	8d 34 d5 40 5e 10 00 	lea    0x105e40(,%edx,8),%esi
  10152d:	b9 13 00 00 00       	mov    $0x13,%ecx
  101532:	89 c7                	mov    %eax,%edi
  101534:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101536:	83 ec 0c             	sub    $0xc,%esp
  101539:	68 b8 19 10 00       	push   $0x1019b8
  10153e:	e8 35 02 00 00       	call   101778 <printk>
  101543:	58                   	pop    %eax
  101544:	5a                   	pop    %edx
  101545:	ff 35 20 3e 10 00    	pushl  0x103e20
  10154b:	53                   	push   %ebx
  10154c:	68 64 1c 10 00       	push   $0x101c64
  101551:	6a 42                	push   $0x42
  101553:	68 df 1b 10 00       	push   $0x101bdf
  101558:	68 30 1c 10 00       	push   $0x101c30
  10155d:	e8 16 02 00 00       	call   101778 <printk>
  101562:	83 c4 14             	add    $0x14,%esp
  101565:	68 e7 19 10 00       	push   $0x1019e7
  10156a:	e8 09 02 00 00       	call   101778 <printk>
  10156f:	59                   	pop    %ecx
  101570:	5b                   	pop    %ebx
  101571:	a1 20 3e 10 00       	mov    0x103e20,%eax
  101576:	c1 e0 10             	shl    $0x10,%eax
  101579:	50                   	push   %eax
  10157a:	6a 23                	push   $0x23
  10157c:	e8 b3 ea ff ff       	call   100034 <change_gdt>
  101581:	83 c4 10             	add    $0x10,%esp
  101584:	e9 44 ff ff ff       	jmp    1014cd <irqHandle+0x7d>
  101589:	8d 76 00             	lea    0x0(%esi),%esi
  10158c:	40                   	inc    %eax
  10158d:	0f 84 3a ff ff ff    	je     1014cd <irqHandle+0x7d>
  101593:	83 ec 0c             	sub    $0xc,%esp
  101596:	68 b8 19 10 00       	push   $0x1019b8
  10159b:	e8 d8 01 00 00       	call   101778 <printk>
  1015a0:	58                   	pop    %eax
  1015a1:	5a                   	pop    %edx
  1015a2:	ff 77 38             	pushl  0x38(%edi)
  1015a5:	ff 77 30             	pushl  0x30(%edi)
  1015a8:	68 64 1c 10 00       	push   $0x101c64
  1015ad:	6a 36                	push   $0x36
  1015af:	68 df 1b 10 00       	push   $0x101bdf
  1015b4:	68 08 1c 10 00       	push   $0x101c08
  1015b9:	e8 ba 01 00 00       	call   101778 <printk>
  1015be:	83 c4 14             	add    $0x14,%esp
  1015c1:	68 e7 19 10 00       	push   $0x1019e7
  1015c6:	e8 ad 01 00 00       	call   101778 <printk>
  1015cb:	59                   	pop    %ecx
  1015cc:	58                   	pop    %eax
  1015cd:	6a 37                	push   $0x37
  1015cf:	68 df 1b 10 00       	push   $0x101bdf
  1015d4:	e8 13 03 00 00       	call   1018ec <abort>
  1015d9:	8b 47 30             	mov    0x30(%edi),%eax
  1015dc:	83 c4 10             	add    $0x10,%esp
  1015df:	e9 dd fe ff ff       	jmp    1014c1 <irqHandle+0x71>
  1015e4:	83 ec 0c             	sub    $0xc,%esp
  1015e7:	57                   	push   %edi
  1015e8:	e8 c7 fd ff ff       	call   1013b4 <GProtectFaultHandle>
  1015ed:	8b 47 30             	mov    0x30(%edi),%eax
  1015f0:	83 c4 10             	add    $0x10,%esp
  1015f3:	e9 c9 fe ff ff       	jmp    1014c1 <irqHandle+0x71>

001015f8 <initIntr>:
  1015f8:	55                   	push   %ebp
  1015f9:	89 e5                	mov    %esp,%ebp
  1015fb:	ba 21 00 00 00       	mov    $0x21,%edx
  101600:	b0 ff                	mov    $0xff,%al
  101602:	ee                   	out    %al,(%dx)
  101603:	ba a1 00 00 00       	mov    $0xa1,%edx
  101608:	ee                   	out    %al,(%dx)
  101609:	ba 20 00 00 00       	mov    $0x20,%edx
  10160e:	b0 11                	mov    $0x11,%al
  101610:	ee                   	out    %al,(%dx)
  101611:	ba 21 00 00 00       	mov    $0x21,%edx
  101616:	b0 20                	mov    $0x20,%al
  101618:	ee                   	out    %al,(%dx)
  101619:	b0 04                	mov    $0x4,%al
  10161b:	ee                   	out    %al,(%dx)
  10161c:	b0 03                	mov    $0x3,%al
  10161e:	ee                   	out    %al,(%dx)
  10161f:	ba a0 00 00 00       	mov    $0xa0,%edx
  101624:	b0 11                	mov    $0x11,%al
  101626:	ee                   	out    %al,(%dx)
  101627:	ba a1 00 00 00       	mov    $0xa1,%edx
  10162c:	b0 28                	mov    $0x28,%al
  10162e:	ee                   	out    %al,(%dx)
  10162f:	b0 02                	mov    $0x2,%al
  101631:	ee                   	out    %al,(%dx)
  101632:	b0 03                	mov    $0x3,%al
  101634:	ee                   	out    %al,(%dx)
  101635:	ba 20 00 00 00       	mov    $0x20,%edx
  10163a:	b0 68                	mov    $0x68,%al
  10163c:	ee                   	out    %al,(%dx)
  10163d:	b0 0a                	mov    $0xa,%al
  10163f:	ee                   	out    %al,(%dx)
  101640:	ba a0 00 00 00       	mov    $0xa0,%edx
  101645:	b0 68                	mov    $0x68,%al
  101647:	ee                   	out    %al,(%dx)
  101648:	b0 0a                	mov    $0xa,%al
  10164a:	ee                   	out    %al,(%dx)
  10164b:	5d                   	pop    %ebp
  10164c:	c3                   	ret    
  10164d:	8d 76 00             	lea    0x0(%esi),%esi

00101650 <initTimer>:
  101650:	55                   	push   %ebp
  101651:	89 e5                	mov    %esp,%ebp
  101653:	ba 43 00 00 00       	mov    $0x43,%edx
  101658:	b0 34                	mov    $0x34,%al
  10165a:	ee                   	out    %al,(%dx)
  10165b:	ba 40 00 00 00       	mov    $0x40,%edx
  101660:	b0 9b                	mov    $0x9b,%al
  101662:	ee                   	out    %al,(%dx)
  101663:	b0 2e                	mov    $0x2e,%al
  101665:	ee                   	out    %al,(%dx)
  101666:	5d                   	pop    %ebp
  101667:	c3                   	ret    

00101668 <i2A>:
  101668:	55                   	push   %ebp
  101669:	89 e5                	mov    %esp,%ebp
  10166b:	57                   	push   %edi
  10166c:	56                   	push   %esi
  10166d:	53                   	push   %ebx
  10166e:	51                   	push   %ecx
  10166f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101672:	85 c9                	test   %ecx,%ecx
  101674:	78 6e                	js     1016e4 <i2A+0x7c>
  101676:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  10167a:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  10167e:	bb fe 35 10 00       	mov    $0x1035fe,%ebx
  101683:	31 ff                	xor    %edi,%edi
  101685:	eb 03                	jmp    10168a <i2A+0x22>
  101687:	90                   	nop
  101688:	89 f7                	mov    %esi,%edi
  10168a:	4b                   	dec    %ebx
  10168b:	89 c8                	mov    %ecx,%eax
  10168d:	be 0a 00 00 00       	mov    $0xa,%esi
  101692:	99                   	cltd   
  101693:	f7 fe                	idiv   %esi
  101695:	83 c2 30             	add    $0x30,%edx
  101698:	88 13                	mov    %dl,(%ebx)
  10169a:	8d 77 01             	lea    0x1(%edi),%esi
  10169d:	b8 67 66 66 66       	mov    $0x66666667,%eax
  1016a2:	f7 e9                	imul   %ecx
  1016a4:	89 d0                	mov    %edx,%eax
  1016a6:	c1 f8 02             	sar    $0x2,%eax
  1016a9:	c1 f9 1f             	sar    $0x1f,%ecx
  1016ac:	29 c8                	sub    %ecx,%eax
  1016ae:	89 c1                	mov    %eax,%ecx
  1016b0:	75 d6                	jne    101688 <i2A+0x20>
  1016b2:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  1016b6:	74 20                	je     1016d8 <i2A+0x70>
  1016b8:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  1016bc:	75 06                	jne    1016c4 <i2A+0x5c>
  1016be:	fe 05 fd 35 10 00    	incb   0x1035fd
  1016c4:	c6 05 fe 35 10 00 00 	movb   $0x0,0x1035fe
  1016cb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1016ce:	89 18                	mov    %ebx,(%eax)
  1016d0:	89 f0                	mov    %esi,%eax
  1016d2:	5a                   	pop    %edx
  1016d3:	5b                   	pop    %ebx
  1016d4:	5e                   	pop    %esi
  1016d5:	5f                   	pop    %edi
  1016d6:	5d                   	pop    %ebp
  1016d7:	c3                   	ret    
  1016d8:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  1016dc:	8d 77 02             	lea    0x2(%edi),%esi
  1016df:	4b                   	dec    %ebx
  1016e0:	eb d6                	jmp    1016b8 <i2A+0x50>
  1016e2:	66 90                	xchg   %ax,%ax
  1016e4:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  1016ea:	74 0c                	je     1016f8 <i2A+0x90>
  1016ec:	f7 d9                	neg    %ecx
  1016ee:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  1016f2:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  1016f6:	eb 86                	jmp    10167e <i2A+0x16>
  1016f8:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  1016fd:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101701:	eb ef                	jmp    1016f2 <i2A+0x8a>
  101703:	90                   	nop

00101704 <i2X>:
  101704:	55                   	push   %ebp
  101705:	89 e5                	mov    %esp,%ebp
  101707:	57                   	push   %edi
  101708:	56                   	push   %esi
  101709:	53                   	push   %ebx
  10170a:	8b 55 08             	mov    0x8(%ebp),%edx
  10170d:	b9 dd 35 10 00       	mov    $0x1035dd,%ecx
  101712:	31 c0                	xor    %eax,%eax
  101714:	40                   	inc    %eax
  101715:	89 d6                	mov    %edx,%esi
  101717:	83 e6 0f             	and    $0xf,%esi
  10171a:	8d 5e f6             	lea    -0xa(%esi),%ebx
  10171d:	89 cf                	mov    %ecx,%edi
  10171f:	83 fb 05             	cmp    $0x5,%ebx
  101722:	77 4c                	ja     101770 <i2X+0x6c>
  101724:	ff 24 9d 70 1c 10 00 	jmp    *0x101c70(,%ebx,4)
  10172b:	90                   	nop
  10172c:	c6 01 65             	movb   $0x65,(%ecx)
  10172f:	90                   	nop
  101730:	49                   	dec    %ecx
  101731:	c1 ea 04             	shr    $0x4,%edx
  101734:	75 de                	jne    101714 <i2X+0x10>
  101736:	c6 05 de 35 10 00 00 	movb   $0x0,0x1035de
  10173d:	8b 55 0c             	mov    0xc(%ebp),%edx
  101740:	89 3a                	mov    %edi,(%edx)
  101742:	5b                   	pop    %ebx
  101743:	5e                   	pop    %esi
  101744:	5f                   	pop    %edi
  101745:	5d                   	pop    %ebp
  101746:	c3                   	ret    
  101747:	90                   	nop
  101748:	c6 01 64             	movb   $0x64,(%ecx)
  10174b:	eb e3                	jmp    101730 <i2X+0x2c>
  10174d:	8d 76 00             	lea    0x0(%esi),%esi
  101750:	c6 01 63             	movb   $0x63,(%ecx)
  101753:	eb db                	jmp    101730 <i2X+0x2c>
  101755:	8d 76 00             	lea    0x0(%esi),%esi
  101758:	c6 01 62             	movb   $0x62,(%ecx)
  10175b:	eb d3                	jmp    101730 <i2X+0x2c>
  10175d:	8d 76 00             	lea    0x0(%esi),%esi
  101760:	c6 01 61             	movb   $0x61,(%ecx)
  101763:	eb cb                	jmp    101730 <i2X+0x2c>
  101765:	8d 76 00             	lea    0x0(%esi),%esi
  101768:	c6 01 66             	movb   $0x66,(%ecx)
  10176b:	eb c3                	jmp    101730 <i2X+0x2c>
  10176d:	8d 76 00             	lea    0x0(%esi),%esi
  101770:	8d 5e 30             	lea    0x30(%esi),%ebx
  101773:	88 19                	mov    %bl,(%ecx)
  101775:	eb b9                	jmp    101730 <i2X+0x2c>
  101777:	90                   	nop

00101778 <printk>:
  101778:	55                   	push   %ebp
  101779:	89 e5                	mov    %esp,%ebp
  10177b:	57                   	push   %edi
  10177c:	56                   	push   %esi
  10177d:	53                   	push   %ebx
  10177e:	83 ec 2c             	sub    $0x2c,%esp
  101781:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101784:	8a 11                	mov    (%ecx),%dl
  101786:	84 d2                	test   %dl,%dl
  101788:	0f 84 54 01 00 00    	je     1018e2 <printk+0x16a>
  10178e:	8d 45 0c             	lea    0xc(%ebp),%eax
  101791:	31 ff                	xor    %edi,%edi
  101793:	eb 18                	jmp    1017ad <printk+0x35>
  101795:	8d 76 00             	lea    0x0(%esi),%esi
  101798:	8a 11                	mov    (%ecx),%dl
  10179a:	89 cb                	mov    %ecx,%ebx
  10179c:	88 97 00 36 10 00    	mov    %dl,0x103600(%edi)
  1017a2:	47                   	inc    %edi
  1017a3:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1017a6:	8a 53 01             	mov    0x1(%ebx),%dl
  1017a9:	84 d2                	test   %dl,%dl
  1017ab:	74 72                	je     10181f <printk+0xa7>
  1017ad:	80 fa 25             	cmp    $0x25,%dl
  1017b0:	75 e6                	jne    101798 <printk+0x20>
  1017b2:	8d 59 01             	lea    0x1(%ecx),%ebx
  1017b5:	8a 51 01             	mov    0x1(%ecx),%dl
  1017b8:	80 fa 64             	cmp    $0x64,%dl
  1017bb:	0f 84 bf 00 00 00    	je     101880 <printk+0x108>
  1017c1:	0f 8e 01 01 00 00    	jle    1018c8 <printk+0x150>
  1017c7:	80 fa 73             	cmp    $0x73,%dl
  1017ca:	0f 84 84 00 00 00    	je     101854 <printk+0xdc>
  1017d0:	80 fa 78             	cmp    $0x78,%dl
  1017d3:	75 c7                	jne    10179c <printk+0x24>
  1017d5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1017dc:	8d 70 04             	lea    0x4(%eax),%esi
  1017df:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1017e2:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  1017e5:	56                   	push   %esi
  1017e6:	ff 30                	pushl  (%eax)
  1017e8:	e8 17 ff ff ff       	call   101704 <i2X>
  1017ed:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1017f0:	8d b7 00 36 10 00    	lea    0x103600(%edi),%esi
  1017f6:	8a 11                	mov    (%ecx),%dl
  1017f8:	83 c4 08             	add    $0x8,%esp
  1017fb:	31 c0                	xor    %eax,%eax
  1017fd:	84 d2                	test   %dl,%dl
  1017ff:	74 0f                	je     101810 <printk+0x98>
  101801:	8d 76 00             	lea    0x0(%esi),%esi
  101804:	40                   	inc    %eax
  101805:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101809:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  10180c:	84 d2                	test   %dl,%dl
  10180e:	75 f4                	jne    101804 <printk+0x8c>
  101810:	01 c7                	add    %eax,%edi
  101812:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101815:	8d 4b 01             	lea    0x1(%ebx),%ecx
  101818:	8a 53 01             	mov    0x1(%ebx),%dl
  10181b:	84 d2                	test   %dl,%dl
  10181d:	75 8e                	jne    1017ad <printk+0x35>
  10181f:	c6 87 00 36 10 00 00 	movb   $0x0,0x103600(%edi)
  101826:	0f be 05 00 36 10 00 	movsbl 0x103600,%eax
  10182d:	bb 00 36 10 00       	mov    $0x103600,%ebx
  101832:	84 c0                	test   %al,%al
  101834:	74 16                	je     10184c <printk+0xd4>
  101836:	66 90                	xchg   %ax,%ax
  101838:	83 ec 0c             	sub    $0xc,%esp
  10183b:	50                   	push   %eax
  10183c:	e8 ff f0 ff ff       	call   100940 <putChar>
  101841:	43                   	inc    %ebx
  101842:	0f be 03             	movsbl (%ebx),%eax
  101845:	83 c4 10             	add    $0x10,%esp
  101848:	84 c0                	test   %al,%al
  10184a:	75 ec                	jne    101838 <printk+0xc0>
  10184c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10184f:	5b                   	pop    %ebx
  101850:	5e                   	pop    %esi
  101851:	5f                   	pop    %edi
  101852:	5d                   	pop    %ebp
  101853:	c3                   	ret    
  101854:	8d 70 04             	lea    0x4(%eax),%esi
  101857:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10185a:	8b 08                	mov    (%eax),%ecx
  10185c:	8d b7 00 36 10 00    	lea    0x103600(%edi),%esi
  101862:	8a 11                	mov    (%ecx),%dl
  101864:	31 c0                	xor    %eax,%eax
  101866:	84 d2                	test   %dl,%dl
  101868:	74 a6                	je     101810 <printk+0x98>
  10186a:	66 90                	xchg   %ax,%ax
  10186c:	40                   	inc    %eax
  10186d:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101871:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  101874:	84 d2                	test   %dl,%dl
  101876:	75 f4                	jne    10186c <printk+0xf4>
  101878:	01 c7                	add    %eax,%edi
  10187a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10187d:	eb 96                	jmp    101815 <printk+0x9d>
  10187f:	90                   	nop
  101880:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  101887:	8d 70 04             	lea    0x4(%eax),%esi
  10188a:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10188d:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101890:	56                   	push   %esi
  101891:	ff 30                	pushl  (%eax)
  101893:	e8 d0 fd ff ff       	call   101668 <i2A>
  101898:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  10189b:	8d b7 00 36 10 00    	lea    0x103600(%edi),%esi
  1018a1:	8a 11                	mov    (%ecx),%dl
  1018a3:	83 c4 08             	add    $0x8,%esp
  1018a6:	31 c0                	xor    %eax,%eax
  1018a8:	84 d2                	test   %dl,%dl
  1018aa:	0f 84 60 ff ff ff    	je     101810 <printk+0x98>
  1018b0:	40                   	inc    %eax
  1018b1:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1018b5:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  1018b8:	84 d2                	test   %dl,%dl
  1018ba:	75 f4                	jne    1018b0 <printk+0x138>
  1018bc:	01 c7                	add    %eax,%edi
  1018be:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1018c1:	e9 4f ff ff ff       	jmp    101815 <printk+0x9d>
  1018c6:	66 90                	xchg   %ax,%ax
  1018c8:	80 fa 63             	cmp    $0x63,%dl
  1018cb:	0f 85 cb fe ff ff    	jne    10179c <printk+0x24>
  1018d1:	8b 10                	mov    (%eax),%edx
  1018d3:	88 97 00 36 10 00    	mov    %dl,0x103600(%edi)
  1018d9:	83 c0 04             	add    $0x4,%eax
  1018dc:	47                   	inc    %edi
  1018dd:	e9 c1 fe ff ff       	jmp    1017a3 <printk+0x2b>
  1018e2:	31 ff                	xor    %edi,%edi
  1018e4:	e9 36 ff ff ff       	jmp    10181f <printk+0xa7>
  1018e9:	66 90                	xchg   %ax,%ax
  1018eb:	90                   	nop

001018ec <abort>:
  1018ec:	55                   	push   %ebp
  1018ed:	89 e5                	mov    %esp,%ebp
  1018ef:	57                   	push   %edi
  1018f0:	56                   	push   %esi
  1018f1:	53                   	push   %ebx
  1018f2:	83 ec 1c             	sub    $0x1c,%esp
  1018f5:	8b 55 08             	mov    0x8(%ebp),%edx
  1018f8:	fa                   	cli    
  1018f9:	8a 02                	mov    (%edx),%al
  1018fb:	b9 b2 34 10 00       	mov    $0x1034b2,%ecx
  101900:	84 c0                	test   %al,%al
  101902:	74 0b                	je     10190f <abort+0x23>
  101904:	41                   	inc    %ecx
  101905:	42                   	inc    %edx
  101906:	88 41 ff             	mov    %al,-0x1(%ecx)
  101909:	8a 02                	mov    (%edx),%al
  10190b:	84 c0                	test   %al,%al
  10190d:	75 f5                	jne    101904 <abort+0x18>
  10190f:	c6 01 3a             	movb   $0x3a,(%ecx)
  101912:	bb 1d 3e 10 00       	mov    $0x103e1d,%ebx
  101917:	be 0a 00 00 00       	mov    $0xa,%esi
  10191c:	bf 67 66 66 66       	mov    $0x66666667,%edi
  101921:	4b                   	dec    %ebx
  101922:	8b 45 0c             	mov    0xc(%ebp),%eax
  101925:	99                   	cltd   
  101926:	f7 fe                	idiv   %esi
  101928:	8d 42 30             	lea    0x30(%edx),%eax
  10192b:	88 45 e7             	mov    %al,-0x19(%ebp)
  10192e:	88 03                	mov    %al,(%ebx)
  101930:	89 f8                	mov    %edi,%eax
  101932:	f7 6d 0c             	imull  0xc(%ebp)
  101935:	c1 fa 02             	sar    $0x2,%edx
  101938:	8b 45 0c             	mov    0xc(%ebp),%eax
  10193b:	c1 f8 1f             	sar    $0x1f,%eax
  10193e:	29 c2                	sub    %eax,%edx
  101940:	89 55 0c             	mov    %edx,0xc(%ebp)
  101943:	75 dc                	jne    101921 <abort+0x35>
  101945:	41                   	inc    %ecx
  101946:	41                   	inc    %ecx
  101947:	43                   	inc    %ebx
  101948:	8a 45 e7             	mov    -0x19(%ebp),%al
  10194b:	88 41 ff             	mov    %al,-0x1(%ecx)
  10194e:	8a 03                	mov    (%ebx),%al
  101950:	88 45 e7             	mov    %al,-0x19(%ebp)
  101953:	84 c0                	test   %al,%al
  101955:	75 ef                	jne    101946 <abort+0x5a>
  101957:	c6 01 0a             	movb   $0xa,(%ecx)
  10195a:	0f be 05 a0 34 10 00 	movsbl 0x1034a0,%eax
  101961:	84 c0                	test   %al,%al
  101963:	74 1b                	je     101980 <abort+0x94>
  101965:	bb a0 34 10 00       	mov    $0x1034a0,%ebx
  10196a:	83 ec 0c             	sub    $0xc,%esp
  10196d:	50                   	push   %eax
  10196e:	e8 cd ef ff ff       	call   100940 <putChar>
  101973:	43                   	inc    %ebx
  101974:	0f be 03             	movsbl (%ebx),%eax
  101977:	83 c4 10             	add    $0x10,%esp
  10197a:	84 c0                	test   %al,%al
  10197c:	75 ec                	jne    10196a <abort+0x7e>
  10197e:	66 90                	xchg   %ax,%ax
  101980:	f4                   	hlt    
  101981:	eb fd                	jmp    101980 <abort+0x94>

00101983 <irqEmpty>:
  101983:	6a 00                	push   $0x0
  101985:	6a ff                	push   $0xffffffff
  101987:	eb 13                	jmp    10199c <asmDoIrq>

00101989 <irqGProtectFault>:
  101989:	6a 0d                	push   $0xd
  10198b:	eb 0f                	jmp    10199c <asmDoIrq>

0010198d <irqSyscall>:
  10198d:	6a 00                	push   $0x0
  10198f:	68 80 00 00 00       	push   $0x80
  101994:	eb 06                	jmp    10199c <asmDoIrq>

00101996 <irqTime>:
  101996:	6a 00                	push   $0x0
  101998:	6a 20                	push   $0x20
  10199a:	eb 00                	jmp    10199c <asmDoIrq>

0010199c <asmDoIrq>:
  10199c:	60                   	pusha  
  10199d:	1e                   	push   %ds
  10199e:	06                   	push   %es
  10199f:	0f a0                	push   %fs
  1019a1:	0f a8                	push   %gs
  1019a3:	54                   	push   %esp
  1019a4:	e8 a7 fa ff ff       	call   101450 <irqHandle>
  1019a9:	5c                   	pop    %esp
  1019aa:	0f a9                	pop    %gs
  1019ac:	0f a1                	pop    %fs
  1019ae:	07                   	pop    %es
  1019af:	1f                   	pop    %ds
  1019b0:	61                   	popa   
  1019b1:	83 c4 04             	add    $0x4,%esp
  1019b4:	83 c4 04             	add    $0x4,%esp
  1019b7:	cf                   	iret   
