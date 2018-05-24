
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <enableInterrupt>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	fb                   	sti    
  100004:	90                   	nop
  100005:	5d                   	pop    %ebp
  100006:	c3                   	ret    

00100007 <kEntry>:
  100007:	55                   	push   %ebp
  100008:	89 e5                	mov    %esp,%ebp
  10000a:	83 ec 08             	sub    $0x8,%esp
  10000d:	e8 57 27 00 00       	call   102769 <initTimer>
  100012:	e8 e9 1b 00 00       	call   101c00 <init_pcb>
  100017:	e8 aa 1c 00 00       	call   101cc6 <init_kernel_pcb>
  10001c:	e8 a7 13 00 00       	call   1013c8 <initSerial>
  100021:	e8 e8 1e 00 00       	call   101f0e <initIdt>
  100026:	e8 7b 26 00 00       	call   1026a6 <initIntr>
  10002b:	e8 12 05 00 00       	call   100542 <initSeg>
  100030:	e8 cb ff ff ff       	call   100000 <enableInterrupt>
  100035:	e8 d1 0a 00 00       	call   100b0b <loadUMain>
  10003a:	eb fe                	jmp    10003a <kEntry+0x33>

0010003c <setGdt>:
  10003c:	55                   	push   %ebp
  10003d:	89 e5                	mov    %esp,%ebp
  10003f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100042:	48                   	dec    %eax
  100043:	66 a3 60 4c 10 00    	mov    %ax,0x104c60
  100049:	8b 45 08             	mov    0x8(%ebp),%eax
  10004c:	66 a3 62 4c 10 00    	mov    %ax,0x104c62
  100052:	8b 45 08             	mov    0x8(%ebp),%eax
  100055:	c1 e8 10             	shr    $0x10,%eax
  100058:	66 a3 64 4c 10 00    	mov    %ax,0x104c64
  10005e:	b8 60 4c 10 00       	mov    $0x104c60,%eax
  100063:	0f 01 10             	lgdtl  (%eax)
  100066:	90                   	nop
  100067:	5d                   	pop    %ebp
  100068:	c3                   	ret    

00100069 <lLdt>:
  100069:	55                   	push   %ebp
  10006a:	89 e5                	mov    %esp,%ebp
  10006c:	83 ec 04             	sub    $0x4,%esp
  10006f:	8b 45 08             	mov    0x8(%ebp),%eax
  100072:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  100076:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100079:	0f 00 d0             	lldt   %ax
  10007c:	90                   	nop
  10007d:	c9                   	leave  
  10007e:	c3                   	ret    

0010007f <inLong>:
  10007f:	55                   	push   %ebp
  100080:	89 e5                	mov    %esp,%ebp
  100082:	83 ec 14             	sub    $0x14,%esp
  100085:	8b 45 08             	mov    0x8(%ebp),%eax
  100088:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  10008c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10008f:	89 c2                	mov    %eax,%edx
  100091:	ed                   	in     (%dx),%eax
  100092:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100095:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100098:	c9                   	leave  
  100099:	c3                   	ret    

0010009a <inByte>:
  10009a:	55                   	push   %ebp
  10009b:	89 e5                	mov    %esp,%ebp
  10009d:	83 ec 14             	sub    $0x14,%esp
  1000a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1000a3:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  1000a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1000aa:	89 c2                	mov    %eax,%edx
  1000ac:	ec                   	in     (%dx),%al
  1000ad:	88 45 ff             	mov    %al,-0x1(%ebp)
  1000b0:	8a 45 ff             	mov    -0x1(%ebp),%al
  1000b3:	c9                   	leave  
  1000b4:	c3                   	ret    

001000b5 <outByte>:
  1000b5:	55                   	push   %ebp
  1000b6:	89 e5                	mov    %esp,%ebp
  1000b8:	83 ec 08             	sub    $0x8,%esp
  1000bb:	8b 45 08             	mov    0x8(%ebp),%eax
  1000be:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000c1:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  1000c5:	88 55 f8             	mov    %dl,-0x8(%ebp)
  1000c8:	8a 45 f8             	mov    -0x8(%ebp),%al
  1000cb:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1000ce:	ee                   	out    %al,(%dx)
  1000cf:	90                   	nop
  1000d0:	c9                   	leave  
  1000d1:	c3                   	ret    

001000d2 <change_gdt>:
  1000d2:	55                   	push   %ebp
  1000d3:	89 e5                	mov    %esp,%ebp
  1000d5:	83 ec 18             	sub    $0x18,%esp
  1000d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1000db:	c1 e8 03             	shr    $0x3,%eax
  1000de:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1000e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1000e4:	83 f8 02             	cmp    $0x2,%eax
  1000e7:	0f 84 cf 00 00 00    	je     1001bc <change_gdt+0xea>
  1000ed:	83 f8 02             	cmp    $0x2,%eax
  1000f0:	77 0a                	ja     1000fc <change_gdt+0x2a>
  1000f2:	83 f8 01             	cmp    $0x1,%eax
  1000f5:	74 1c                	je     100113 <change_gdt+0x41>
  1000f7:	e9 b8 02 00 00       	jmp    1003b4 <change_gdt+0x2e2>
  1000fc:	83 f8 03             	cmp    $0x3,%eax
  1000ff:	0f 84 60 01 00 00    	je     100265 <change_gdt+0x193>
  100105:	83 f8 04             	cmp    $0x4,%eax
  100108:	0f 84 00 02 00 00    	je     10030e <change_gdt+0x23c>
  10010e:	e9 a1 02 00 00       	jmp    1003b4 <change_gdt+0x2e2>
  100113:	8b 45 0c             	mov    0xc(%ebp),%eax
  100116:	8b 55 0c             	mov    0xc(%ebp),%edx
  100119:	c1 ea 10             	shr    $0x10,%edx
  10011c:	88 d1                	mov    %dl,%cl
  10011e:	8b 55 0c             	mov    0xc(%ebp),%edx
  100121:	c1 ea 18             	shr    $0x18,%edx
  100124:	66 c7 05 28 d5 13 01 	movw   $0xffff,0x113d528
  10012b:	ff ff 
  10012d:	66 a3 2a d5 13 01    	mov    %ax,0x113d52a
  100133:	88 0d 2c d5 13 01    	mov    %cl,0x113d52c
  100139:	a0 2d d5 13 01       	mov    0x113d52d,%al
  10013e:	83 e0 f0             	and    $0xfffffff0,%eax
  100141:	83 c8 0a             	or     $0xa,%eax
  100144:	a2 2d d5 13 01       	mov    %al,0x113d52d
  100149:	a0 2d d5 13 01       	mov    0x113d52d,%al
  10014e:	83 c8 10             	or     $0x10,%eax
  100151:	a2 2d d5 13 01       	mov    %al,0x113d52d
  100156:	a0 2d d5 13 01       	mov    0x113d52d,%al
  10015b:	83 e0 9f             	and    $0xffffff9f,%eax
  10015e:	a2 2d d5 13 01       	mov    %al,0x113d52d
  100163:	a0 2d d5 13 01       	mov    0x113d52d,%al
  100168:	83 c8 80             	or     $0xffffff80,%eax
  10016b:	a2 2d d5 13 01       	mov    %al,0x113d52d
  100170:	a0 2e d5 13 01       	mov    0x113d52e,%al
  100175:	83 c8 0f             	or     $0xf,%eax
  100178:	a2 2e d5 13 01       	mov    %al,0x113d52e
  10017d:	a0 2e d5 13 01       	mov    0x113d52e,%al
  100182:	83 e0 ef             	and    $0xffffffef,%eax
  100185:	a2 2e d5 13 01       	mov    %al,0x113d52e
  10018a:	a0 2e d5 13 01       	mov    0x113d52e,%al
  10018f:	83 e0 df             	and    $0xffffffdf,%eax
  100192:	a2 2e d5 13 01       	mov    %al,0x113d52e
  100197:	a0 2e d5 13 01       	mov    0x113d52e,%al
  10019c:	83 c8 40             	or     $0x40,%eax
  10019f:	a2 2e d5 13 01       	mov    %al,0x113d52e
  1001a4:	a0 2e d5 13 01       	mov    0x113d52e,%al
  1001a9:	83 c8 80             	or     $0xffffff80,%eax
  1001ac:	a2 2e d5 13 01       	mov    %al,0x113d52e
  1001b1:	88 15 2f d5 13 01    	mov    %dl,0x113d52f
  1001b7:	e9 49 02 00 00       	jmp    100405 <change_gdt+0x333>
  1001bc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1001bf:	8b 55 0c             	mov    0xc(%ebp),%edx
  1001c2:	c1 ea 10             	shr    $0x10,%edx
  1001c5:	88 d1                	mov    %dl,%cl
  1001c7:	8b 55 0c             	mov    0xc(%ebp),%edx
  1001ca:	c1 ea 18             	shr    $0x18,%edx
  1001cd:	66 c7 05 30 d5 13 01 	movw   $0xffff,0x113d530
  1001d4:	ff ff 
  1001d6:	66 a3 32 d5 13 01    	mov    %ax,0x113d532
  1001dc:	88 0d 34 d5 13 01    	mov    %cl,0x113d534
  1001e2:	a0 35 d5 13 01       	mov    0x113d535,%al
  1001e7:	83 e0 f0             	and    $0xfffffff0,%eax
  1001ea:	83 c8 02             	or     $0x2,%eax
  1001ed:	a2 35 d5 13 01       	mov    %al,0x113d535
  1001f2:	a0 35 d5 13 01       	mov    0x113d535,%al
  1001f7:	83 c8 10             	or     $0x10,%eax
  1001fa:	a2 35 d5 13 01       	mov    %al,0x113d535
  1001ff:	a0 35 d5 13 01       	mov    0x113d535,%al
  100204:	83 e0 9f             	and    $0xffffff9f,%eax
  100207:	a2 35 d5 13 01       	mov    %al,0x113d535
  10020c:	a0 35 d5 13 01       	mov    0x113d535,%al
  100211:	83 c8 80             	or     $0xffffff80,%eax
  100214:	a2 35 d5 13 01       	mov    %al,0x113d535
  100219:	a0 36 d5 13 01       	mov    0x113d536,%al
  10021e:	83 c8 0f             	or     $0xf,%eax
  100221:	a2 36 d5 13 01       	mov    %al,0x113d536
  100226:	a0 36 d5 13 01       	mov    0x113d536,%al
  10022b:	83 e0 ef             	and    $0xffffffef,%eax
  10022e:	a2 36 d5 13 01       	mov    %al,0x113d536
  100233:	a0 36 d5 13 01       	mov    0x113d536,%al
  100238:	83 e0 df             	and    $0xffffffdf,%eax
  10023b:	a2 36 d5 13 01       	mov    %al,0x113d536
  100240:	a0 36 d5 13 01       	mov    0x113d536,%al
  100245:	83 c8 40             	or     $0x40,%eax
  100248:	a2 36 d5 13 01       	mov    %al,0x113d536
  10024d:	a0 36 d5 13 01       	mov    0x113d536,%al
  100252:	83 c8 80             	or     $0xffffff80,%eax
  100255:	a2 36 d5 13 01       	mov    %al,0x113d536
  10025a:	88 15 37 d5 13 01    	mov    %dl,0x113d537
  100260:	e9 a0 01 00 00       	jmp    100405 <change_gdt+0x333>
  100265:	8b 45 0c             	mov    0xc(%ebp),%eax
  100268:	8b 55 0c             	mov    0xc(%ebp),%edx
  10026b:	c1 ea 10             	shr    $0x10,%edx
  10026e:	88 d1                	mov    %dl,%cl
  100270:	8b 55 0c             	mov    0xc(%ebp),%edx
  100273:	c1 ea 18             	shr    $0x18,%edx
  100276:	66 c7 05 38 d5 13 01 	movw   $0xffff,0x113d538
  10027d:	ff ff 
  10027f:	66 a3 3a d5 13 01    	mov    %ax,0x113d53a
  100285:	88 0d 3c d5 13 01    	mov    %cl,0x113d53c
  10028b:	a0 3d d5 13 01       	mov    0x113d53d,%al
  100290:	83 e0 f0             	and    $0xfffffff0,%eax
  100293:	83 c8 0a             	or     $0xa,%eax
  100296:	a2 3d d5 13 01       	mov    %al,0x113d53d
  10029b:	a0 3d d5 13 01       	mov    0x113d53d,%al
  1002a0:	83 c8 10             	or     $0x10,%eax
  1002a3:	a2 3d d5 13 01       	mov    %al,0x113d53d
  1002a8:	a0 3d d5 13 01       	mov    0x113d53d,%al
  1002ad:	83 c8 60             	or     $0x60,%eax
  1002b0:	a2 3d d5 13 01       	mov    %al,0x113d53d
  1002b5:	a0 3d d5 13 01       	mov    0x113d53d,%al
  1002ba:	83 c8 80             	or     $0xffffff80,%eax
  1002bd:	a2 3d d5 13 01       	mov    %al,0x113d53d
  1002c2:	a0 3e d5 13 01       	mov    0x113d53e,%al
  1002c7:	83 c8 0f             	or     $0xf,%eax
  1002ca:	a2 3e d5 13 01       	mov    %al,0x113d53e
  1002cf:	a0 3e d5 13 01       	mov    0x113d53e,%al
  1002d4:	83 e0 ef             	and    $0xffffffef,%eax
  1002d7:	a2 3e d5 13 01       	mov    %al,0x113d53e
  1002dc:	a0 3e d5 13 01       	mov    0x113d53e,%al
  1002e1:	83 e0 df             	and    $0xffffffdf,%eax
  1002e4:	a2 3e d5 13 01       	mov    %al,0x113d53e
  1002e9:	a0 3e d5 13 01       	mov    0x113d53e,%al
  1002ee:	83 c8 40             	or     $0x40,%eax
  1002f1:	a2 3e d5 13 01       	mov    %al,0x113d53e
  1002f6:	a0 3e d5 13 01       	mov    0x113d53e,%al
  1002fb:	83 c8 80             	or     $0xffffff80,%eax
  1002fe:	a2 3e d5 13 01       	mov    %al,0x113d53e
  100303:	88 15 3f d5 13 01    	mov    %dl,0x113d53f
  100309:	e9 f7 00 00 00       	jmp    100405 <change_gdt+0x333>
  10030e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100311:	8b 55 0c             	mov    0xc(%ebp),%edx
  100314:	c1 ea 10             	shr    $0x10,%edx
  100317:	88 d1                	mov    %dl,%cl
  100319:	8b 55 0c             	mov    0xc(%ebp),%edx
  10031c:	c1 ea 18             	shr    $0x18,%edx
  10031f:	66 c7 05 40 d5 13 01 	movw   $0xffff,0x113d540
  100326:	ff ff 
  100328:	66 a3 42 d5 13 01    	mov    %ax,0x113d542
  10032e:	88 0d 44 d5 13 01    	mov    %cl,0x113d544
  100334:	a0 45 d5 13 01       	mov    0x113d545,%al
  100339:	83 e0 f0             	and    $0xfffffff0,%eax
  10033c:	83 c8 02             	or     $0x2,%eax
  10033f:	a2 45 d5 13 01       	mov    %al,0x113d545
  100344:	a0 45 d5 13 01       	mov    0x113d545,%al
  100349:	83 c8 10             	or     $0x10,%eax
  10034c:	a2 45 d5 13 01       	mov    %al,0x113d545
  100351:	a0 45 d5 13 01       	mov    0x113d545,%al
  100356:	83 c8 60             	or     $0x60,%eax
  100359:	a2 45 d5 13 01       	mov    %al,0x113d545
  10035e:	a0 45 d5 13 01       	mov    0x113d545,%al
  100363:	83 c8 80             	or     $0xffffff80,%eax
  100366:	a2 45 d5 13 01       	mov    %al,0x113d545
  10036b:	a0 46 d5 13 01       	mov    0x113d546,%al
  100370:	83 c8 0f             	or     $0xf,%eax
  100373:	a2 46 d5 13 01       	mov    %al,0x113d546
  100378:	a0 46 d5 13 01       	mov    0x113d546,%al
  10037d:	83 e0 ef             	and    $0xffffffef,%eax
  100380:	a2 46 d5 13 01       	mov    %al,0x113d546
  100385:	a0 46 d5 13 01       	mov    0x113d546,%al
  10038a:	83 e0 df             	and    $0xffffffdf,%eax
  10038d:	a2 46 d5 13 01       	mov    %al,0x113d546
  100392:	a0 46 d5 13 01       	mov    0x113d546,%al
  100397:	83 c8 40             	or     $0x40,%eax
  10039a:	a2 46 d5 13 01       	mov    %al,0x113d546
  10039f:	a0 46 d5 13 01       	mov    0x113d546,%al
  1003a4:	83 c8 80             	or     $0xffffff80,%eax
  1003a7:	a2 46 d5 13 01       	mov    %al,0x113d546
  1003ac:	88 15 47 d5 13 01    	mov    %dl,0x113d547
  1003b2:	eb 51                	jmp    100405 <change_gdt+0x333>
  1003b4:	83 ec 0c             	sub    $0xc,%esp
  1003b7:	68 ec 2c 10 00       	push   $0x102cec
  1003bc:	e8 17 26 00 00       	call   1029d8 <printk>
  1003c1:	83 c4 10             	add    $0x10,%esp
  1003c4:	83 ec 0c             	sub    $0xc,%esp
  1003c7:	ff 75 f4             	pushl  -0xc(%ebp)
  1003ca:	68 2c 2d 10 00       	push   $0x102d2c
  1003cf:	6a 17                	push   $0x17
  1003d1:	68 f2 2c 10 00       	push   $0x102cf2
  1003d6:	68 ff 2c 10 00       	push   $0x102cff
  1003db:	e8 f8 25 00 00       	call   1029d8 <printk>
  1003e0:	83 c4 20             	add    $0x20,%esp
  1003e3:	83 ec 0c             	sub    $0xc,%esp
  1003e6:	68 1b 2d 10 00       	push   $0x102d1b
  1003eb:	e8 e8 25 00 00       	call   1029d8 <printk>
  1003f0:	83 c4 10             	add    $0x10,%esp
  1003f3:	83 ec 08             	sub    $0x8,%esp
  1003f6:	6a 18                	push   $0x18
  1003f8:	68 f2 2c 10 00       	push   $0x102cf2
  1003fd:	e8 92 28 00 00       	call   102c94 <abort>
  100402:	83 c4 10             	add    $0x10,%esp
  100405:	83 ec 08             	sub    $0x8,%esp
  100408:	6a 50                	push   $0x50
  10040a:	68 20 d5 13 01       	push   $0x113d520
  10040f:	e8 28 fc ff ff       	call   10003c <setGdt>
  100414:	83 c4 10             	add    $0x10,%esp
  100417:	b8 01 00 00 00       	mov    $0x1,%eax
  10041c:	c9                   	leave  
  10041d:	c3                   	ret    

0010041e <change_tss>:
  10041e:	55                   	push   %ebp
  10041f:	89 e5                	mov    %esp,%ebp
  100421:	8b 45 08             	mov    0x8(%ebp),%eax
  100424:	a3 88 d5 13 01       	mov    %eax,0x113d588
  100429:	8b 45 0c             	mov    0xc(%ebp),%eax
  10042c:	a3 84 d5 13 01       	mov    %eax,0x113d584
  100431:	b8 01 00 00 00       	mov    $0x1,%eax
  100436:	5d                   	pop    %ebp
  100437:	c3                   	ret    

00100438 <get_tss>:
  100438:	55                   	push   %ebp
  100439:	89 e5                	mov    %esp,%ebp
  10043b:	57                   	push   %edi
  10043c:	56                   	push   %esi
  10043d:	53                   	push   %ebx
  10043e:	8b 45 08             	mov    0x8(%ebp),%eax
  100441:	89 c2                	mov    %eax,%edx
  100443:	bb 80 d5 13 01       	mov    $0x113d580,%ebx
  100448:	b8 19 00 00 00       	mov    $0x19,%eax
  10044d:	89 d7                	mov    %edx,%edi
  10044f:	89 de                	mov    %ebx,%esi
  100451:	89 c1                	mov    %eax,%ecx
  100453:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100455:	8b 45 08             	mov    0x8(%ebp),%eax
  100458:	5b                   	pop    %ebx
  100459:	5e                   	pop    %esi
  10045a:	5f                   	pop    %edi
  10045b:	5d                   	pop    %ebp
  10045c:	c2 04 00             	ret    $0x4

0010045f <waitDisk>:
  10045f:	55                   	push   %ebp
  100460:	89 e5                	mov    %esp,%ebp
  100462:	90                   	nop
  100463:	68 f7 01 00 00       	push   $0x1f7
  100468:	e8 2d fc ff ff       	call   10009a <inByte>
  10046d:	83 c4 04             	add    $0x4,%esp
  100470:	0f b6 c0             	movzbl %al,%eax
  100473:	25 c0 00 00 00       	and    $0xc0,%eax
  100478:	83 f8 40             	cmp    $0x40,%eax
  10047b:	75 e6                	jne    100463 <waitDisk+0x4>
  10047d:	90                   	nop
  10047e:	c9                   	leave  
  10047f:	c3                   	ret    

00100480 <readSect>:
  100480:	55                   	push   %ebp
  100481:	89 e5                	mov    %esp,%ebp
  100483:	53                   	push   %ebx
  100484:	83 ec 10             	sub    $0x10,%esp
  100487:	e8 d3 ff ff ff       	call   10045f <waitDisk>
  10048c:	6a 01                	push   $0x1
  10048e:	68 f2 01 00 00       	push   $0x1f2
  100493:	e8 1d fc ff ff       	call   1000b5 <outByte>
  100498:	83 c4 08             	add    $0x8,%esp
  10049b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10049e:	0f be c0             	movsbl %al,%eax
  1004a1:	50                   	push   %eax
  1004a2:	68 f3 01 00 00       	push   $0x1f3
  1004a7:	e8 09 fc ff ff       	call   1000b5 <outByte>
  1004ac:	83 c4 08             	add    $0x8,%esp
  1004af:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004b2:	c1 f8 08             	sar    $0x8,%eax
  1004b5:	0f be c0             	movsbl %al,%eax
  1004b8:	50                   	push   %eax
  1004b9:	68 f4 01 00 00       	push   $0x1f4
  1004be:	e8 f2 fb ff ff       	call   1000b5 <outByte>
  1004c3:	83 c4 08             	add    $0x8,%esp
  1004c6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004c9:	c1 f8 10             	sar    $0x10,%eax
  1004cc:	0f be c0             	movsbl %al,%eax
  1004cf:	50                   	push   %eax
  1004d0:	68 f5 01 00 00       	push   $0x1f5
  1004d5:	e8 db fb ff ff       	call   1000b5 <outByte>
  1004da:	83 c4 08             	add    $0x8,%esp
  1004dd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004e0:	c1 f8 18             	sar    $0x18,%eax
  1004e3:	83 c8 e0             	or     $0xffffffe0,%eax
  1004e6:	0f be c0             	movsbl %al,%eax
  1004e9:	50                   	push   %eax
  1004ea:	68 f6 01 00 00       	push   $0x1f6
  1004ef:	e8 c1 fb ff ff       	call   1000b5 <outByte>
  1004f4:	83 c4 08             	add    $0x8,%esp
  1004f7:	6a 20                	push   $0x20
  1004f9:	68 f7 01 00 00       	push   $0x1f7
  1004fe:	e8 b2 fb ff ff       	call   1000b5 <outByte>
  100503:	83 c4 08             	add    $0x8,%esp
  100506:	e8 54 ff ff ff       	call   10045f <waitDisk>
  10050b:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  100512:	eb 22                	jmp    100536 <readSect+0xb6>
  100514:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100517:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  10051e:	8b 45 08             	mov    0x8(%ebp),%eax
  100521:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
  100524:	68 f0 01 00 00       	push   $0x1f0
  100529:	e8 51 fb ff ff       	call   10007f <inLong>
  10052e:	83 c4 04             	add    $0x4,%esp
  100531:	89 03                	mov    %eax,(%ebx)
  100533:	ff 45 f8             	incl   -0x8(%ebp)
  100536:	83 7d f8 7f          	cmpl   $0x7f,-0x8(%ebp)
  10053a:	7e d8                	jle    100514 <readSect+0x94>
  10053c:	90                   	nop
  10053d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100540:	c9                   	leave  
  100541:	c3                   	ret    

00100542 <initSeg>:
  100542:	55                   	push   %ebp
  100543:	89 e5                	mov    %esp,%ebp
  100545:	66 c7 05 28 d5 13 01 	movw   $0xffff,0x113d528
  10054c:	ff ff 
  10054e:	66 c7 05 2a d5 13 01 	movw   $0x0,0x113d52a
  100555:	00 00 
  100557:	c6 05 2c d5 13 01 00 	movb   $0x0,0x113d52c
  10055e:	a0 2d d5 13 01       	mov    0x113d52d,%al
  100563:	83 e0 f0             	and    $0xfffffff0,%eax
  100566:	83 c8 0a             	or     $0xa,%eax
  100569:	a2 2d d5 13 01       	mov    %al,0x113d52d
  10056e:	a0 2d d5 13 01       	mov    0x113d52d,%al
  100573:	83 c8 10             	or     $0x10,%eax
  100576:	a2 2d d5 13 01       	mov    %al,0x113d52d
  10057b:	a0 2d d5 13 01       	mov    0x113d52d,%al
  100580:	83 e0 9f             	and    $0xffffff9f,%eax
  100583:	a2 2d d5 13 01       	mov    %al,0x113d52d
  100588:	a0 2d d5 13 01       	mov    0x113d52d,%al
  10058d:	83 c8 80             	or     $0xffffff80,%eax
  100590:	a2 2d d5 13 01       	mov    %al,0x113d52d
  100595:	a0 2e d5 13 01       	mov    0x113d52e,%al
  10059a:	83 c8 0f             	or     $0xf,%eax
  10059d:	a2 2e d5 13 01       	mov    %al,0x113d52e
  1005a2:	a0 2e d5 13 01       	mov    0x113d52e,%al
  1005a7:	83 e0 ef             	and    $0xffffffef,%eax
  1005aa:	a2 2e d5 13 01       	mov    %al,0x113d52e
  1005af:	a0 2e d5 13 01       	mov    0x113d52e,%al
  1005b4:	83 e0 df             	and    $0xffffffdf,%eax
  1005b7:	a2 2e d5 13 01       	mov    %al,0x113d52e
  1005bc:	a0 2e d5 13 01       	mov    0x113d52e,%al
  1005c1:	83 c8 40             	or     $0x40,%eax
  1005c4:	a2 2e d5 13 01       	mov    %al,0x113d52e
  1005c9:	a0 2e d5 13 01       	mov    0x113d52e,%al
  1005ce:	83 c8 80             	or     $0xffffff80,%eax
  1005d1:	a2 2e d5 13 01       	mov    %al,0x113d52e
  1005d6:	c6 05 2f d5 13 01 00 	movb   $0x0,0x113d52f
  1005dd:	66 c7 05 30 d5 13 01 	movw   $0xffff,0x113d530
  1005e4:	ff ff 
  1005e6:	66 c7 05 32 d5 13 01 	movw   $0x0,0x113d532
  1005ed:	00 00 
  1005ef:	c6 05 34 d5 13 01 00 	movb   $0x0,0x113d534
  1005f6:	a0 35 d5 13 01       	mov    0x113d535,%al
  1005fb:	83 e0 f0             	and    $0xfffffff0,%eax
  1005fe:	83 c8 02             	or     $0x2,%eax
  100601:	a2 35 d5 13 01       	mov    %al,0x113d535
  100606:	a0 35 d5 13 01       	mov    0x113d535,%al
  10060b:	83 c8 10             	or     $0x10,%eax
  10060e:	a2 35 d5 13 01       	mov    %al,0x113d535
  100613:	a0 35 d5 13 01       	mov    0x113d535,%al
  100618:	83 e0 9f             	and    $0xffffff9f,%eax
  10061b:	a2 35 d5 13 01       	mov    %al,0x113d535
  100620:	a0 35 d5 13 01       	mov    0x113d535,%al
  100625:	83 c8 80             	or     $0xffffff80,%eax
  100628:	a2 35 d5 13 01       	mov    %al,0x113d535
  10062d:	a0 36 d5 13 01       	mov    0x113d536,%al
  100632:	83 c8 0f             	or     $0xf,%eax
  100635:	a2 36 d5 13 01       	mov    %al,0x113d536
  10063a:	a0 36 d5 13 01       	mov    0x113d536,%al
  10063f:	83 e0 ef             	and    $0xffffffef,%eax
  100642:	a2 36 d5 13 01       	mov    %al,0x113d536
  100647:	a0 36 d5 13 01       	mov    0x113d536,%al
  10064c:	83 e0 df             	and    $0xffffffdf,%eax
  10064f:	a2 36 d5 13 01       	mov    %al,0x113d536
  100654:	a0 36 d5 13 01       	mov    0x113d536,%al
  100659:	83 c8 40             	or     $0x40,%eax
  10065c:	a2 36 d5 13 01       	mov    %al,0x113d536
  100661:	a0 36 d5 13 01       	mov    0x113d536,%al
  100666:	83 c8 80             	or     $0xffffff80,%eax
  100669:	a2 36 d5 13 01       	mov    %al,0x113d536
  10066e:	c6 05 37 d5 13 01 00 	movb   $0x0,0x113d537
  100675:	66 c7 05 38 d5 13 01 	movw   $0xffff,0x113d538
  10067c:	ff ff 
  10067e:	66 c7 05 3a d5 13 01 	movw   $0x0,0x113d53a
  100685:	00 00 
  100687:	c6 05 3c d5 13 01 00 	movb   $0x0,0x113d53c
  10068e:	a0 3d d5 13 01       	mov    0x113d53d,%al
  100693:	83 e0 f0             	and    $0xfffffff0,%eax
  100696:	83 c8 0a             	or     $0xa,%eax
  100699:	a2 3d d5 13 01       	mov    %al,0x113d53d
  10069e:	a0 3d d5 13 01       	mov    0x113d53d,%al
  1006a3:	83 c8 10             	or     $0x10,%eax
  1006a6:	a2 3d d5 13 01       	mov    %al,0x113d53d
  1006ab:	a0 3d d5 13 01       	mov    0x113d53d,%al
  1006b0:	83 c8 60             	or     $0x60,%eax
  1006b3:	a2 3d d5 13 01       	mov    %al,0x113d53d
  1006b8:	a0 3d d5 13 01       	mov    0x113d53d,%al
  1006bd:	83 c8 80             	or     $0xffffff80,%eax
  1006c0:	a2 3d d5 13 01       	mov    %al,0x113d53d
  1006c5:	a0 3e d5 13 01       	mov    0x113d53e,%al
  1006ca:	83 c8 0f             	or     $0xf,%eax
  1006cd:	a2 3e d5 13 01       	mov    %al,0x113d53e
  1006d2:	a0 3e d5 13 01       	mov    0x113d53e,%al
  1006d7:	83 e0 ef             	and    $0xffffffef,%eax
  1006da:	a2 3e d5 13 01       	mov    %al,0x113d53e
  1006df:	a0 3e d5 13 01       	mov    0x113d53e,%al
  1006e4:	83 e0 df             	and    $0xffffffdf,%eax
  1006e7:	a2 3e d5 13 01       	mov    %al,0x113d53e
  1006ec:	a0 3e d5 13 01       	mov    0x113d53e,%al
  1006f1:	83 c8 40             	or     $0x40,%eax
  1006f4:	a2 3e d5 13 01       	mov    %al,0x113d53e
  1006f9:	a0 3e d5 13 01       	mov    0x113d53e,%al
  1006fe:	83 c8 80             	or     $0xffffff80,%eax
  100701:	a2 3e d5 13 01       	mov    %al,0x113d53e
  100706:	c6 05 3f d5 13 01 00 	movb   $0x0,0x113d53f
  10070d:	66 c7 05 40 d5 13 01 	movw   $0xffff,0x113d540
  100714:	ff ff 
  100716:	66 c7 05 42 d5 13 01 	movw   $0x0,0x113d542
  10071d:	00 00 
  10071f:	c6 05 44 d5 13 01 00 	movb   $0x0,0x113d544
  100726:	a0 45 d5 13 01       	mov    0x113d545,%al
  10072b:	83 e0 f0             	and    $0xfffffff0,%eax
  10072e:	83 c8 02             	or     $0x2,%eax
  100731:	a2 45 d5 13 01       	mov    %al,0x113d545
  100736:	a0 45 d5 13 01       	mov    0x113d545,%al
  10073b:	83 c8 10             	or     $0x10,%eax
  10073e:	a2 45 d5 13 01       	mov    %al,0x113d545
  100743:	a0 45 d5 13 01       	mov    0x113d545,%al
  100748:	83 c8 60             	or     $0x60,%eax
  10074b:	a2 45 d5 13 01       	mov    %al,0x113d545
  100750:	a0 45 d5 13 01       	mov    0x113d545,%al
  100755:	83 c8 80             	or     $0xffffff80,%eax
  100758:	a2 45 d5 13 01       	mov    %al,0x113d545
  10075d:	a0 46 d5 13 01       	mov    0x113d546,%al
  100762:	83 c8 0f             	or     $0xf,%eax
  100765:	a2 46 d5 13 01       	mov    %al,0x113d546
  10076a:	a0 46 d5 13 01       	mov    0x113d546,%al
  10076f:	83 e0 ef             	and    $0xffffffef,%eax
  100772:	a2 46 d5 13 01       	mov    %al,0x113d546
  100777:	a0 46 d5 13 01       	mov    0x113d546,%al
  10077c:	83 e0 df             	and    $0xffffffdf,%eax
  10077f:	a2 46 d5 13 01       	mov    %al,0x113d546
  100784:	a0 46 d5 13 01       	mov    0x113d546,%al
  100789:	83 c8 40             	or     $0x40,%eax
  10078c:	a2 46 d5 13 01       	mov    %al,0x113d546
  100791:	a0 46 d5 13 01       	mov    0x113d546,%al
  100796:	83 c8 80             	or     $0xffffff80,%eax
  100799:	a2 46 d5 13 01       	mov    %al,0x113d546
  10079e:	c6 05 47 d5 13 01 00 	movb   $0x0,0x113d547
  1007a5:	66 c7 05 48 d5 13 01 	movw   $0x63,0x113d548
  1007ac:	63 00 
  1007ae:	b8 80 d5 13 01       	mov    $0x113d580,%eax
  1007b3:	66 a3 4a d5 13 01    	mov    %ax,0x113d54a
  1007b9:	b8 80 d5 13 01       	mov    $0x113d580,%eax
  1007be:	c1 e8 10             	shr    $0x10,%eax
  1007c1:	a2 4c d5 13 01       	mov    %al,0x113d54c
  1007c6:	a0 4d d5 13 01       	mov    0x113d54d,%al
  1007cb:	83 e0 f0             	and    $0xfffffff0,%eax
  1007ce:	83 c8 09             	or     $0x9,%eax
  1007d1:	a2 4d d5 13 01       	mov    %al,0x113d54d
  1007d6:	a0 4d d5 13 01       	mov    0x113d54d,%al
  1007db:	83 e0 ef             	and    $0xffffffef,%eax
  1007de:	a2 4d d5 13 01       	mov    %al,0x113d54d
  1007e3:	a0 4d d5 13 01       	mov    0x113d54d,%al
  1007e8:	83 e0 9f             	and    $0xffffff9f,%eax
  1007eb:	a2 4d d5 13 01       	mov    %al,0x113d54d
  1007f0:	a0 4d d5 13 01       	mov    0x113d54d,%al
  1007f5:	83 c8 80             	or     $0xffffff80,%eax
  1007f8:	a2 4d d5 13 01       	mov    %al,0x113d54d
  1007fd:	a0 4e d5 13 01       	mov    0x113d54e,%al
  100802:	83 e0 f0             	and    $0xfffffff0,%eax
  100805:	a2 4e d5 13 01       	mov    %al,0x113d54e
  10080a:	a0 4e d5 13 01       	mov    0x113d54e,%al
  10080f:	83 e0 ef             	and    $0xffffffef,%eax
  100812:	a2 4e d5 13 01       	mov    %al,0x113d54e
  100817:	a0 4e d5 13 01       	mov    0x113d54e,%al
  10081c:	83 e0 df             	and    $0xffffffdf,%eax
  10081f:	a2 4e d5 13 01       	mov    %al,0x113d54e
  100824:	a0 4e d5 13 01       	mov    0x113d54e,%al
  100829:	83 c8 40             	or     $0x40,%eax
  10082c:	a2 4e d5 13 01       	mov    %al,0x113d54e
  100831:	a0 4e d5 13 01       	mov    0x113d54e,%al
  100836:	83 e0 7f             	and    $0x7f,%eax
  100839:	a2 4e d5 13 01       	mov    %al,0x113d54e
  10083e:	b8 80 d5 13 01       	mov    $0x113d580,%eax
  100843:	c1 e8 18             	shr    $0x18,%eax
  100846:	a2 4f d5 13 01       	mov    %al,0x113d54f
  10084b:	a0 4d d5 13 01       	mov    0x113d54d,%al
  100850:	83 e0 ef             	and    $0xffffffef,%eax
  100853:	a2 4d d5 13 01       	mov    %al,0x113d54d
  100858:	a1 24 2d 10 00       	mov    0x102d24,%eax
  10085d:	8b 15 28 2d 10 00    	mov    0x102d28,%edx
  100863:	a3 50 d5 13 01       	mov    %eax,0x113d550
  100868:	89 15 54 d5 13 01    	mov    %edx,0x113d554
  10086e:	66 c7 05 60 d5 13 01 	movw   $0xffff,0x113d560
  100875:	ff ff 
  100877:	66 c7 05 62 d5 13 01 	movw   $0x0,0x113d562
  10087e:	00 00 
  100880:	c6 05 64 d5 13 01 00 	movb   $0x0,0x113d564
  100887:	a0 65 d5 13 01       	mov    0x113d565,%al
  10088c:	83 e0 f0             	and    $0xfffffff0,%eax
  10088f:	83 c8 02             	or     $0x2,%eax
  100892:	a2 65 d5 13 01       	mov    %al,0x113d565
  100897:	a0 65 d5 13 01       	mov    0x113d565,%al
  10089c:	83 c8 10             	or     $0x10,%eax
  10089f:	a2 65 d5 13 01       	mov    %al,0x113d565
  1008a4:	a0 65 d5 13 01       	mov    0x113d565,%al
  1008a9:	83 c8 60             	or     $0x60,%eax
  1008ac:	a2 65 d5 13 01       	mov    %al,0x113d565
  1008b1:	a0 65 d5 13 01       	mov    0x113d565,%al
  1008b6:	83 c8 80             	or     $0xffffff80,%eax
  1008b9:	a2 65 d5 13 01       	mov    %al,0x113d565
  1008be:	a0 66 d5 13 01       	mov    0x113d566,%al
  1008c3:	83 c8 0f             	or     $0xf,%eax
  1008c6:	a2 66 d5 13 01       	mov    %al,0x113d566
  1008cb:	a0 66 d5 13 01       	mov    0x113d566,%al
  1008d0:	83 e0 ef             	and    $0xffffffef,%eax
  1008d3:	a2 66 d5 13 01       	mov    %al,0x113d566
  1008d8:	a0 66 d5 13 01       	mov    0x113d566,%al
  1008dd:	83 e0 df             	and    $0xffffffdf,%eax
  1008e0:	a2 66 d5 13 01       	mov    %al,0x113d566
  1008e5:	a0 66 d5 13 01       	mov    0x113d566,%al
  1008ea:	83 c8 40             	or     $0x40,%eax
  1008ed:	a2 66 d5 13 01       	mov    %al,0x113d566
  1008f2:	a0 66 d5 13 01       	mov    0x113d566,%al
  1008f7:	83 c8 80             	or     $0xffffff80,%eax
  1008fa:	a2 66 d5 13 01       	mov    %al,0x113d566
  1008ff:	c6 05 67 d5 13 01 00 	movb   $0x0,0x113d567
  100906:	6a 50                	push   $0x50
  100908:	68 20 d5 13 01       	push   $0x113d520
  10090d:	e8 2a f7 ff ff       	call   10003c <setGdt>
  100912:	83 c4 08             	add    $0x8,%esp
  100915:	b8 1c 75 10 00       	mov    $0x10751c,%eax
  10091a:	89 c2                	mov    %eax,%edx
  10091c:	a1 68 75 10 00       	mov    0x107568,%eax
  100921:	52                   	push   %edx
  100922:	50                   	push   %eax
  100923:	e8 f6 fa ff ff       	call   10041e <change_tss>
  100928:	83 c4 08             	add    $0x8,%esp
  10092b:	b8 28 00 00 00       	mov    $0x28,%eax
  100930:	0f 00 d8             	ltr    %ax
  100933:	b8 10 00 00 00       	mov    $0x10,%eax
  100938:	89 c0                	mov    %eax,%eax
  10093a:	8e d8                	mov    %eax,%ds
  10093c:	8e e0                	mov    %eax,%fs
  10093e:	8e c0                	mov    %eax,%es
  100940:	8e d0                	mov    %eax,%ss
  100942:	b8 30 00 00 00       	mov    $0x30,%eax
  100947:	89 c0                	mov    %eax,%eax
  100949:	8e e8                	mov    %eax,%gs
  10094b:	6a 00                	push   $0x0
  10094d:	e8 17 f7 ff ff       	call   100069 <lLdt>
  100952:	83 c4 04             	add    $0x4,%esp
  100955:	90                   	nop
  100956:	c9                   	leave  
  100957:	c3                   	ret    

00100958 <enterUserSpace_pcb>:
  100958:	55                   	push   %ebp
  100959:	89 e5                	mov    %esp,%ebp
  10095b:	83 ec 10             	sub    $0x10,%esp
  10095e:	8b 55 08             	mov    0x8(%ebp),%edx
  100961:	89 d0                	mov    %edx,%eax
  100963:	c1 e0 07             	shl    $0x7,%eax
  100966:	01 d0                	add    %edx,%eax
  100968:	01 c0                	add    %eax,%eax
  10096a:	01 d0                	add    %edx,%eax
  10096c:	01 c0                	add    %eax,%eax
  10096e:	01 d0                	add    %edx,%eax
  100970:	c1 e0 04             	shl    $0x4,%eax
  100973:	05 20 55 10 00       	add    $0x105520,%eax
  100978:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10097b:	b8 10 00 00 00       	mov    $0x10,%eax
  100980:	89 c0                	mov    %eax,%eax
  100982:	8e d8                	mov    %eax,%ds
  100984:	8e e0                	mov    %eax,%fs
  100986:	8e c0                	mov    %eax,%es
  100988:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10098b:	8b 80 48 20 00 00    	mov    0x2048(%eax),%eax
  100991:	50                   	push   %eax
  100992:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100995:	8b 80 44 20 00 00    	mov    0x2044(%eax),%eax
  10099b:	50                   	push   %eax
  10099c:	9c                   	pushf  
  10099d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1009a0:	8b 80 3c 20 00 00    	mov    0x203c(%eax),%eax
  1009a6:	50                   	push   %eax
  1009a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1009aa:	8b 80 38 20 00 00    	mov    0x2038(%eax),%eax
  1009b0:	50                   	push   %eax
  1009b1:	cf                   	iret   
  1009b2:	90                   	nop
  1009b3:	c9                   	leave  
  1009b4:	c3                   	ret    

001009b5 <enterUserSpace>:
  1009b5:	55                   	push   %ebp
  1009b6:	89 e5                	mov    %esp,%ebp
  1009b8:	83 ec 18             	sub    $0x18,%esp
  1009bb:	c7 05 04 55 10 00 01 	movl   $0x1,0x105504
  1009c2:	00 00 00 
  1009c5:	e8 21 0b 00 00       	call   1014eb <apply_new_pid>
  1009ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1009cd:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009d0:	89 d0                	mov    %edx,%eax
  1009d2:	c1 e0 07             	shl    $0x7,%eax
  1009d5:	01 d0                	add    %edx,%eax
  1009d7:	01 c0                	add    %eax,%eax
  1009d9:	01 d0                	add    %edx,%eax
  1009db:	01 c0                	add    %eax,%eax
  1009dd:	01 d0                	add    %edx,%eax
  1009df:	c1 e0 04             	shl    $0x4,%eax
  1009e2:	05 68 75 10 00       	add    $0x107568,%eax
  1009e7:	c7 00 23 00 00 00    	movl   $0x23,(%eax)
  1009ed:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009f0:	89 d0                	mov    %edx,%eax
  1009f2:	c1 e0 07             	shl    $0x7,%eax
  1009f5:	01 d0                	add    %edx,%eax
  1009f7:	01 c0                	add    %eax,%eax
  1009f9:	01 d0                	add    %edx,%eax
  1009fb:	01 c0                	add    %eax,%eax
  1009fd:	01 d0                	add    %edx,%eax
  1009ff:	c1 e0 04             	shl    $0x4,%eax
  100a02:	05 5c 75 10 00       	add    $0x10755c,%eax
  100a07:	c7 00 1b 00 00 00    	movl   $0x1b,(%eax)
  100a0d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100a10:	89 d0                	mov    %edx,%eax
  100a12:	c1 e0 07             	shl    $0x7,%eax
  100a15:	01 d0                	add    %edx,%eax
  100a17:	01 c0                	add    %eax,%eax
  100a19:	01 d0                	add    %edx,%eax
  100a1b:	01 c0                	add    %eax,%eax
  100a1d:	01 d0                	add    %edx,%eax
  100a1f:	c1 e0 04             	shl    $0x4,%eax
  100a22:	05 2c 75 10 00       	add    $0x10752c,%eax
  100a27:	c7 00 23 00 00 00    	movl   $0x23,(%eax)
  100a2d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100a30:	89 d0                	mov    %edx,%eax
  100a32:	c1 e0 07             	shl    $0x7,%eax
  100a35:	01 d0                	add    %edx,%eax
  100a37:	01 c0                	add    %eax,%eax
  100a39:	01 d0                	add    %edx,%eax
  100a3b:	01 c0                	add    %eax,%eax
  100a3d:	01 d0                	add    %edx,%eax
  100a3f:	c1 e0 04             	shl    $0x4,%eax
  100a42:	05 28 75 10 00       	add    $0x107528,%eax
  100a47:	c7 00 23 00 00 00    	movl   $0x23,(%eax)
  100a4d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100a50:	89 d0                	mov    %edx,%eax
  100a52:	c1 e0 07             	shl    $0x7,%eax
  100a55:	01 d0                	add    %edx,%eax
  100a57:	01 c0                	add    %eax,%eax
  100a59:	01 d0                	add    %edx,%eax
  100a5b:	01 c0                	add    %eax,%eax
  100a5d:	01 d0                	add    %edx,%eax
  100a5f:	c1 e0 04             	shl    $0x4,%eax
  100a62:	05 24 75 10 00       	add    $0x107524,%eax
  100a67:	c7 00 23 00 00 00    	movl   $0x23,(%eax)
  100a6d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100a70:	89 d0                	mov    %edx,%eax
  100a72:	c1 e0 07             	shl    $0x7,%eax
  100a75:	01 d0                	add    %edx,%eax
  100a77:	01 c0                	add    %eax,%eax
  100a79:	01 d0                	add    %edx,%eax
  100a7b:	01 c0                	add    %eax,%eax
  100a7d:	01 d0                	add    %edx,%eax
  100a7f:	c1 e0 04             	shl    $0x4,%eax
  100a82:	05 64 75 10 00       	add    $0x107564,%eax
  100a87:	c7 00 00 00 40 00    	movl   $0x400000,(%eax)
  100a8d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100a90:	89 d0                	mov    %edx,%eax
  100a92:	c1 e0 07             	shl    $0x7,%eax
  100a95:	01 d0                	add    %edx,%eax
  100a97:	01 c0                	add    %eax,%eax
  100a99:	01 d0                	add    %edx,%eax
  100a9b:	01 c0                	add    %eax,%eax
  100a9d:	01 d0                	add    %edx,%eax
  100a9f:	c1 e0 04             	shl    $0x4,%eax
  100aa2:	8d 90 58 75 10 00    	lea    0x107558(%eax),%edx
  100aa8:	8b 45 08             	mov    0x8(%ebp),%eax
  100aab:	89 02                	mov    %eax,(%edx)
  100aad:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100ab0:	89 d0                	mov    %edx,%eax
  100ab2:	c1 e0 07             	shl    $0x7,%eax
  100ab5:	01 d0                	add    %edx,%eax
  100ab7:	01 c0                	add    %eax,%eax
  100ab9:	01 d0                	add    %edx,%eax
  100abb:	01 c0                	add    %eax,%eax
  100abd:	01 d0                	add    %edx,%eax
  100abf:	c1 e0 04             	shl    $0x4,%eax
  100ac2:	05 70 75 10 00       	add    $0x107570,%eax
  100ac7:	c7 00 0a 00 00 00    	movl   $0xa,(%eax)
  100acd:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100ad0:	89 d0                	mov    %edx,%eax
  100ad2:	c1 e0 07             	shl    $0x7,%eax
  100ad5:	01 d0                	add    %edx,%eax
  100ad7:	01 c0                	add    %eax,%eax
  100ad9:	01 d0                	add    %edx,%eax
  100adb:	01 c0                	add    %eax,%eax
  100add:	01 d0                	add    %edx,%eax
  100adf:	c1 e0 04             	shl    $0x4,%eax
  100ae2:	05 00 20 00 00       	add    $0x2000,%eax
  100ae7:	05 20 55 10 00       	add    $0x105520,%eax
  100aec:	83 ec 08             	sub    $0x8,%esp
  100aef:	50                   	push   %eax
  100af0:	ff 75 f4             	pushl  -0xc(%ebp)
  100af3:	e8 6f 0a 00 00       	call   101567 <put_into_runnable>
  100af8:	83 c4 10             	add    $0x10,%esp
  100afb:	83 ec 0c             	sub    $0xc,%esp
  100afe:	6a 00                	push   $0x0
  100b00:	e8 53 fe ff ff       	call   100958 <enterUserSpace_pcb>
  100b05:	83 c4 10             	add    $0x10,%esp
  100b08:	90                   	nop
  100b09:	c9                   	leave  
  100b0a:	c3                   	ret    

00100b0b <loadUMain>:
  100b0b:	55                   	push   %ebp
  100b0c:	89 e5                	mov    %esp,%ebp
  100b0e:	83 ec 38             	sub    $0x38,%esp
  100b11:	c7 45 e0 00 00 03 00 	movl   $0x30000,-0x20(%ebp)
  100b18:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  100b1f:	eb 24                	jmp    100b45 <loadUMain+0x3a>
  100b21:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b24:	8d 90 c8 00 00 00    	lea    0xc8(%eax),%edx
  100b2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b2d:	48                   	dec    %eax
  100b2e:	c1 e0 09             	shl    $0x9,%eax
  100b31:	89 c1                	mov    %eax,%ecx
  100b33:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100b36:	01 c8                	add    %ecx,%eax
  100b38:	52                   	push   %edx
  100b39:	50                   	push   %eax
  100b3a:	e8 41 f9 ff ff       	call   100480 <readSect>
  100b3f:	83 c4 08             	add    $0x8,%esp
  100b42:	ff 45 f4             	incl   -0xc(%ebp)
  100b45:	81 7d f4 c8 00 00 00 	cmpl   $0xc8,-0xc(%ebp)
  100b4c:	7e d3                	jle    100b21 <loadUMain+0x16>
  100b4e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100b51:	89 45 dc             	mov    %eax,-0x24(%ebp)
  100b54:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100b57:	8b 50 1c             	mov    0x1c(%eax),%edx
  100b5a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100b5d:	01 d0                	add    %edx,%eax
  100b5f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100b62:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100b65:	8b 40 2c             	mov    0x2c(%eax),%eax
  100b68:	0f b7 c0             	movzwl %ax,%eax
  100b6b:	c1 e0 05             	shl    $0x5,%eax
  100b6e:	89 c2                	mov    %eax,%edx
  100b70:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b73:	01 d0                	add    %edx,%eax
  100b75:	89 45 d8             	mov    %eax,-0x28(%ebp)
  100b78:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100b7f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100b86:	eb 78                	jmp    100c00 <loadUMain+0xf5>
  100b88:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b8b:	8b 00                	mov    (%eax),%eax
  100b8d:	83 f8 01             	cmp    $0x1,%eax
  100b90:	75 6a                	jne    100bfc <loadUMain+0xf1>
  100b92:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b95:	8b 40 08             	mov    0x8(%eax),%eax
  100b98:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100b9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b9e:	8b 50 04             	mov    0x4(%eax),%edx
  100ba1:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100ba4:	01 d0                	add    %edx,%eax
  100ba6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  100ba9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100bac:	8b 40 10             	mov    0x10(%eax),%eax
  100baf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100bb2:	eb 10                	jmp    100bc4 <loadUMain+0xb9>
  100bb4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100bb7:	8b 55 e8             	mov    -0x18(%ebp),%edx
  100bba:	8a 12                	mov    (%edx),%dl
  100bbc:	88 10                	mov    %dl,(%eax)
  100bbe:	ff 45 ec             	incl   -0x14(%ebp)
  100bc1:	ff 45 e8             	incl   -0x18(%ebp)
  100bc4:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100bc7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100bca:	8b 40 08             	mov    0x8(%eax),%eax
  100bcd:	29 c2                	sub    %eax,%edx
  100bcf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100bd2:	39 c2                	cmp    %eax,%edx
  100bd4:	72 de                	jb     100bb4 <loadUMain+0xa9>
  100bd6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100bd9:	8b 40 14             	mov    0x14(%eax),%eax
  100bdc:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100bdf:	eb 09                	jmp    100bea <loadUMain+0xdf>
  100be1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100be4:	c6 00 00             	movb   $0x0,(%eax)
  100be7:	ff 45 ec             	incl   -0x14(%ebp)
  100bea:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100bed:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100bf0:	8b 40 08             	mov    0x8(%eax),%eax
  100bf3:	29 c2                	sub    %eax,%edx
  100bf5:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100bf8:	39 c2                	cmp    %eax,%edx
  100bfa:	72 e5                	jb     100be1 <loadUMain+0xd6>
  100bfc:	83 45 f0 20          	addl   $0x20,-0x10(%ebp)
  100c00:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100c03:	3b 45 d8             	cmp    -0x28(%ebp),%eax
  100c06:	72 80                	jb     100b88 <loadUMain+0x7d>
  100c08:	c7 45 e8 00 00 20 00 	movl   $0x200000,-0x18(%ebp)
  100c0f:	c7 45 ec 00 00 21 00 	movl   $0x210000,-0x14(%ebp)
  100c16:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100c1d:	eb 19                	jmp    100c38 <loadUMain+0x12d>
  100c1f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100c22:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c25:	01 d0                	add    %edx,%eax
  100c27:	89 c2                	mov    %eax,%edx
  100c29:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  100c2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100c2f:	01 c8                	add    %ecx,%eax
  100c31:	8a 00                	mov    (%eax),%al
  100c33:	88 02                	mov    %al,(%edx)
  100c35:	ff 45 e4             	incl   -0x1c(%ebp)
  100c38:	81 7d e4 ff ff 00 00 	cmpl   $0xffff,-0x1c(%ebp)
  100c3f:	7e de                	jle    100c1f <loadUMain+0x114>
  100c41:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100c44:	8b 40 18             	mov    0x18(%eax),%eax
  100c47:	83 ec 0c             	sub    $0xc,%esp
  100c4a:	50                   	push   %eax
  100c4b:	e8 65 fd ff ff       	call   1009b5 <enterUserSpace>
  100c50:	83 c4 10             	add    $0x10,%esp
  100c53:	90                   	nop
  100c54:	c9                   	leave  
  100c55:	c3                   	ret    

00100c56 <sys_exit>:
  100c56:	55                   	push   %ebp
  100c57:	89 e5                	mov    %esp,%ebp
  100c59:	83 ec 18             	sub    $0x18,%esp
  100c5c:	e8 c8 08 00 00       	call   101529 <getpid>
  100c61:	83 ec 0c             	sub    $0xc,%esp
  100c64:	50                   	push   %eax
  100c65:	e8 a7 08 00 00       	call   101511 <put_into_empty>
  100c6a:	83 c4 10             	add    $0x10,%esp
  100c6d:	e8 d5 08 00 00       	call   101547 <get_from_runnable>
  100c72:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c75:	83 ec 08             	sub    $0x8,%esp
  100c78:	ff 75 08             	pushl  0x8(%ebp)
  100c7b:	ff 75 f4             	pushl  -0xc(%ebp)
  100c7e:	e8 11 08 00 00       	call   101494 <put_into_running>
  100c83:	83 c4 10             	add    $0x10,%esp
  100c86:	b8 01 00 00 00       	mov    $0x1,%eax
  100c8b:	c9                   	leave  
  100c8c:	c3                   	ret    

00100c8d <sys_getpid>:
  100c8d:	55                   	push   %ebp
  100c8e:	89 e5                	mov    %esp,%ebp
  100c90:	83 ec 08             	sub    $0x8,%esp
  100c93:	e8 91 08 00 00       	call   101529 <getpid>
  100c98:	c9                   	leave  
  100c99:	c3                   	ret    

00100c9a <sys_sleep>:
  100c9a:	55                   	push   %ebp
  100c9b:	89 e5                	mov    %esp,%ebp
  100c9d:	83 ec 18             	sub    $0x18,%esp
  100ca0:	e8 84 08 00 00       	call   101529 <getpid>
  100ca5:	83 ec 08             	sub    $0x8,%esp
  100ca8:	ff 75 08             	pushl  0x8(%ebp)
  100cab:	50                   	push   %eax
  100cac:	e8 e4 0b 00 00       	call   101895 <put_into_block>
  100cb1:	83 c4 10             	add    $0x10,%esp
  100cb4:	e8 8e 08 00 00       	call   101547 <get_from_runnable>
  100cb9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100cbc:	83 ec 08             	sub    $0x8,%esp
  100cbf:	ff 75 08             	pushl  0x8(%ebp)
  100cc2:	ff 75 f4             	pushl  -0xc(%ebp)
  100cc5:	e8 ca 07 00 00       	call   101494 <put_into_running>
  100cca:	83 c4 10             	add    $0x10,%esp
  100ccd:	b8 01 00 00 00       	mov    $0x1,%eax
  100cd2:	c9                   	leave  
  100cd3:	c3                   	ret    

00100cd4 <sys_fork>:
  100cd4:	55                   	push   %ebp
  100cd5:	89 e5                	mov    %esp,%ebp
  100cd7:	57                   	push   %edi
  100cd8:	56                   	push   %esi
  100cd9:	53                   	push   %ebx
  100cda:	83 ec 2c             	sub    $0x2c,%esp
  100cdd:	e8 09 08 00 00       	call   1014eb <apply_new_pid>
  100ce2:	89 45 d8             	mov    %eax,-0x28(%ebp)
  100ce5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100cec:	eb 6d                	jmp    100d5b <sys_fork+0x87>
  100cee:	e8 36 08 00 00       	call   101529 <getpid>
  100cf3:	89 c2                	mov    %eax,%edx
  100cf5:	89 d0                	mov    %edx,%eax
  100cf7:	c1 e0 02             	shl    $0x2,%eax
  100cfa:	01 d0                	add    %edx,%eax
  100cfc:	c1 e0 03             	shl    $0x3,%eax
  100cff:	01 d0                	add    %edx,%eax
  100d01:	01 c0                	add    %eax,%eax
  100d03:	01 d0                	add    %edx,%eax
  100d05:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
  100d0c:	01 c8                	add    %ecx,%eax
  100d0e:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
  100d15:	01 c8                	add    %ecx,%eax
  100d17:	01 c2                	add    %eax,%edx
  100d19:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100d1c:	01 d0                	add    %edx,%eax
  100d1e:	8b 0c 85 20 55 10 00 	mov    0x105520(,%eax,4),%ecx
  100d25:	8b 55 d8             	mov    -0x28(%ebp),%edx
  100d28:	89 d0                	mov    %edx,%eax
  100d2a:	c1 e0 02             	shl    $0x2,%eax
  100d2d:	01 d0                	add    %edx,%eax
  100d2f:	c1 e0 03             	shl    $0x3,%eax
  100d32:	01 d0                	add    %edx,%eax
  100d34:	01 c0                	add    %eax,%eax
  100d36:	01 d0                	add    %edx,%eax
  100d38:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
  100d3f:	01 d8                	add    %ebx,%eax
  100d41:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
  100d48:	01 d8                	add    %ebx,%eax
  100d4a:	01 c2                	add    %eax,%edx
  100d4c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100d4f:	01 d0                	add    %edx,%eax
  100d51:	89 0c 85 20 55 10 00 	mov    %ecx,0x105520(,%eax,4)
  100d58:	ff 45 e4             	incl   -0x1c(%ebp)
  100d5b:	81 7d e4 ff 07 00 00 	cmpl   $0x7ff,-0x1c(%ebp)
  100d62:	7e 8a                	jle    100cee <sys_fork+0x1a>
  100d64:	e8 c0 07 00 00       	call   101529 <getpid>
  100d69:	83 c0 40             	add    $0x40,%eax
  100d6c:	c1 e0 10             	shl    $0x10,%eax
  100d6f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100d72:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100d75:	83 c0 40             	add    $0x40,%eax
  100d78:	c1 e0 10             	shl    $0x10,%eax
  100d7b:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100d7e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  100d85:	eb 1d                	jmp    100da4 <sys_fork+0xd0>
  100d87:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100d8a:	8b 55 d0             	mov    -0x30(%ebp),%edx
  100d8d:	29 c2                	sub    %eax,%edx
  100d8f:	89 d0                	mov    %edx,%eax
  100d91:	89 c2                	mov    %eax,%edx
  100d93:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100d96:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  100d99:	29 c1                	sub    %eax,%ecx
  100d9b:	89 c8                	mov    %ecx,%eax
  100d9d:	8a 00                	mov    (%eax),%al
  100d9f:	88 02                	mov    %al,(%edx)
  100da1:	ff 45 e0             	incl   -0x20(%ebp)
  100da4:	81 7d e0 ff ff 00 00 	cmpl   $0xffff,-0x20(%ebp)
  100dab:	7e da                	jle    100d87 <sys_fork+0xb3>
  100dad:	8b 55 d8             	mov    -0x28(%ebp),%edx
  100db0:	89 d0                	mov    %edx,%eax
  100db2:	c1 e0 07             	shl    $0x7,%eax
  100db5:	01 d0                	add    %edx,%eax
  100db7:	01 c0                	add    %eax,%eax
  100db9:	01 d0                	add    %edx,%eax
  100dbb:	01 c0                	add    %eax,%eax
  100dbd:	01 d0                	add    %edx,%eax
  100dbf:	c1 e0 04             	shl    $0x4,%eax
  100dc2:	8d 90 20 75 10 00    	lea    0x107520(%eax),%edx
  100dc8:	8b 45 08             	mov    0x8(%ebp),%eax
  100dcb:	89 c3                	mov    %eax,%ebx
  100dcd:	b8 13 00 00 00       	mov    $0x13,%eax
  100dd2:	89 d7                	mov    %edx,%edi
  100dd4:	89 de                	mov    %ebx,%esi
  100dd6:	89 c1                	mov    %eax,%ecx
  100dd8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100dda:	8b 55 d8             	mov    -0x28(%ebp),%edx
  100ddd:	89 d0                	mov    %edx,%eax
  100ddf:	c1 e0 07             	shl    $0x7,%eax
  100de2:	01 d0                	add    %edx,%eax
  100de4:	01 c0                	add    %eax,%eax
  100de6:	01 d0                	add    %edx,%eax
  100de8:	01 c0                	add    %eax,%eax
  100dea:	01 d0                	add    %edx,%eax
  100dec:	c1 e0 04             	shl    $0x4,%eax
  100def:	05 4c 75 10 00       	add    $0x10754c,%eax
  100df4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  100dfa:	e8 2a 07 00 00       	call   101529 <getpid>
  100dff:	83 c0 20             	add    $0x20,%eax
  100e02:	c1 e0 10             	shl    $0x10,%eax
  100e05:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100e08:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100e0b:	83 c0 20             	add    $0x20,%eax
  100e0e:	c1 e0 10             	shl    $0x10,%eax
  100e11:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100e14:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  100e1b:	eb 19                	jmp    100e36 <sys_fork+0x162>
  100e1d:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100e20:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100e23:	01 d0                	add    %edx,%eax
  100e25:	89 c2                	mov    %eax,%edx
  100e27:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  100e2a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100e2d:	01 c8                	add    %ecx,%eax
  100e2f:	8a 00                	mov    (%eax),%al
  100e31:	88 02                	mov    %al,(%edx)
  100e33:	ff 45 dc             	incl   -0x24(%ebp)
  100e36:	81 7d dc ff ff 00 00 	cmpl   $0xffff,-0x24(%ebp)
  100e3d:	7e de                	jle    100e1d <sys_fork+0x149>
  100e3f:	8b 55 d8             	mov    -0x28(%ebp),%edx
  100e42:	89 d0                	mov    %edx,%eax
  100e44:	c1 e0 07             	shl    $0x7,%eax
  100e47:	01 d0                	add    %edx,%eax
  100e49:	01 c0                	add    %eax,%eax
  100e4b:	01 d0                	add    %edx,%eax
  100e4d:	01 c0                	add    %eax,%eax
  100e4f:	01 d0                	add    %edx,%eax
  100e51:	c1 e0 04             	shl    $0x4,%eax
  100e54:	05 00 20 00 00       	add    $0x2000,%eax
  100e59:	05 20 55 10 00       	add    $0x105520,%eax
  100e5e:	83 ec 08             	sub    $0x8,%esp
  100e61:	50                   	push   %eax
  100e62:	ff 75 d8             	pushl  -0x28(%ebp)
  100e65:	e8 fd 06 00 00       	call   101567 <put_into_runnable>
  100e6a:	83 c4 10             	add    $0x10,%esp
  100e6d:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100e70:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100e73:	5b                   	pop    %ebx
  100e74:	5e                   	pop    %esi
  100e75:	5f                   	pop    %edi
  100e76:	5d                   	pop    %ebp
  100e77:	c3                   	ret    

00100e78 <outByte>:
  100e78:	55                   	push   %ebp
  100e79:	89 e5                	mov    %esp,%ebp
  100e7b:	83 ec 08             	sub    $0x8,%esp
  100e7e:	8b 45 08             	mov    0x8(%ebp),%eax
  100e81:	8b 55 0c             	mov    0xc(%ebp),%edx
  100e84:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  100e88:	88 55 f8             	mov    %dl,-0x8(%ebp)
  100e8b:	8a 45 f8             	mov    -0x8(%ebp),%al
  100e8e:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100e91:	ee                   	out    %al,(%dx)
  100e92:	90                   	nop
  100e93:	c9                   	leave  
  100e94:	c3                   	ret    

00100e95 <printkernel>:
  100e95:	55                   	push   %ebp
  100e96:	89 e5                	mov    %esp,%ebp
  100e98:	83 ec 18             	sub    $0x18,%esp
  100e9b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100ea2:	e9 03 01 00 00       	jmp    100faa <printkernel+0x115>
  100ea7:	8b 45 08             	mov    0x8(%ebp),%eax
  100eaa:	8a 00                	mov    (%eax),%al
  100eac:	88 45 ef             	mov    %al,-0x11(%ebp)
  100eaf:	80 7d ef 0a          	cmpb   $0xa,-0x11(%ebp)
  100eb3:	75 58                	jne    100f0d <printkernel+0x78>
  100eb5:	a1 6c 4c 10 00       	mov    0x104c6c,%eax
  100eba:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100ebd:	eb 19                	jmp    100ed8 <printkernel+0x43>
  100ebf:	a1 68 4c 10 00       	mov    0x104c68,%eax
  100ec4:	83 ec 04             	sub    $0x4,%esp
  100ec7:	6a 20                	push   $0x20
  100ec9:	ff 75 f0             	pushl  -0x10(%ebp)
  100ecc:	50                   	push   %eax
  100ecd:	e8 84 02 00 00       	call   101156 <print_char>
  100ed2:	83 c4 10             	add    $0x10,%esp
  100ed5:	ff 45 f0             	incl   -0x10(%ebp)
  100ed8:	83 7d f0 50          	cmpl   $0x50,-0x10(%ebp)
  100edc:	7e e1                	jle    100ebf <printkernel+0x2a>
  100ede:	c7 05 6c 4c 10 00 00 	movl   $0x0,0x104c6c
  100ee5:	00 00 00 
  100ee8:	a1 68 4c 10 00       	mov    0x104c68,%eax
  100eed:	40                   	inc    %eax
  100eee:	a3 68 4c 10 00       	mov    %eax,0x104c68
  100ef3:	8b 15 6c 4c 10 00    	mov    0x104c6c,%edx
  100ef9:	a1 68 4c 10 00       	mov    0x104c68,%eax
  100efe:	83 ec 08             	sub    $0x8,%esp
  100f01:	52                   	push   %edx
  100f02:	50                   	push   %eax
  100f03:	e8 be 00 00 00       	call   100fc6 <update_cursor>
  100f08:	83 c4 10             	add    $0x10,%esp
  100f0b:	eb 40                	jmp    100f4d <printkernel+0xb8>
  100f0d:	0f be 4d ef          	movsbl -0x11(%ebp),%ecx
  100f11:	8b 15 6c 4c 10 00    	mov    0x104c6c,%edx
  100f17:	a1 68 4c 10 00       	mov    0x104c68,%eax
  100f1c:	83 ec 04             	sub    $0x4,%esp
  100f1f:	51                   	push   %ecx
  100f20:	52                   	push   %edx
  100f21:	50                   	push   %eax
  100f22:	e8 2f 02 00 00       	call   101156 <print_char>
  100f27:	83 c4 10             	add    $0x10,%esp
  100f2a:	a1 6c 4c 10 00       	mov    0x104c6c,%eax
  100f2f:	40                   	inc    %eax
  100f30:	a3 6c 4c 10 00       	mov    %eax,0x104c6c
  100f35:	8b 15 6c 4c 10 00    	mov    0x104c6c,%edx
  100f3b:	a1 68 4c 10 00       	mov    0x104c68,%eax
  100f40:	83 ec 08             	sub    $0x8,%esp
  100f43:	52                   	push   %edx
  100f44:	50                   	push   %eax
  100f45:	e8 7c 00 00 00       	call   100fc6 <update_cursor>
  100f4a:	83 c4 10             	add    $0x10,%esp
  100f4d:	a1 6c 4c 10 00       	mov    0x104c6c,%eax
  100f52:	83 f8 50             	cmp    $0x50,%eax
  100f55:	75 15                	jne    100f6c <printkernel+0xd7>
  100f57:	c7 05 6c 4c 10 00 00 	movl   $0x0,0x104c6c
  100f5e:	00 00 00 
  100f61:	a1 68 4c 10 00       	mov    0x104c68,%eax
  100f66:	40                   	inc    %eax
  100f67:	a3 68 4c 10 00       	mov    %eax,0x104c68
  100f6c:	8b 15 68 4c 10 00    	mov    0x104c68,%edx
  100f72:	a1 20 4a 10 00       	mov    0x104a20,%eax
  100f77:	39 c2                	cmp    %eax,%edx
  100f79:	7e 29                	jle    100fa4 <printkernel+0x10f>
  100f7b:	a1 68 4c 10 00       	mov    0x104c68,%eax
  100f80:	83 ec 0c             	sub    $0xc,%esp
  100f83:	50                   	push   %eax
  100f84:	e8 ac 00 00 00       	call   101035 <scrollScreen>
  100f89:	83 c4 10             	add    $0x10,%esp
  100f8c:	8b 15 6c 4c 10 00    	mov    0x104c6c,%edx
  100f92:	a1 68 4c 10 00       	mov    0x104c68,%eax
  100f97:	83 ec 08             	sub    $0x8,%esp
  100f9a:	52                   	push   %edx
  100f9b:	50                   	push   %eax
  100f9c:	e8 25 00 00 00       	call   100fc6 <update_cursor>
  100fa1:	83 c4 10             	add    $0x10,%esp
  100fa4:	ff 45 f4             	incl   -0xc(%ebp)
  100fa7:	ff 45 08             	incl   0x8(%ebp)
  100faa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100fad:	3b 45 0c             	cmp    0xc(%ebp),%eax
  100fb0:	7d 0d                	jge    100fbf <printkernel+0x12a>
  100fb2:	8b 45 08             	mov    0x8(%ebp),%eax
  100fb5:	8a 00                	mov    (%eax),%al
  100fb7:	84 c0                	test   %al,%al
  100fb9:	0f 85 e8 fe ff ff    	jne    100ea7 <printkernel+0x12>
  100fbf:	b8 01 00 00 00       	mov    $0x1,%eax
  100fc4:	c9                   	leave  
  100fc5:	c3                   	ret    

00100fc6 <update_cursor>:
  100fc6:	55                   	push   %ebp
  100fc7:	89 e5                	mov    %esp,%ebp
  100fc9:	83 ec 10             	sub    $0x10,%esp
  100fcc:	8b 45 08             	mov    0x8(%ebp),%eax
  100fcf:	89 c2                	mov    %eax,%edx
  100fd1:	89 d0                	mov    %edx,%eax
  100fd3:	c1 e0 02             	shl    $0x2,%eax
  100fd6:	01 d0                	add    %edx,%eax
  100fd8:	c1 e0 04             	shl    $0x4,%eax
  100fdb:	89 c2                	mov    %eax,%edx
  100fdd:	8b 45 0c             	mov    0xc(%ebp),%eax
  100fe0:	01 d0                	add    %edx,%eax
  100fe2:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  100fe6:	6a 0f                	push   $0xf
  100fe8:	68 d4 03 00 00       	push   $0x3d4
  100fed:	e8 86 fe ff ff       	call   100e78 <outByte>
  100ff2:	83 c4 08             	add    $0x8,%esp
  100ff5:	66 8b 45 fe          	mov    -0x2(%ebp),%ax
  100ff9:	0f be c0             	movsbl %al,%eax
  100ffc:	50                   	push   %eax
  100ffd:	68 d5 03 00 00       	push   $0x3d5
  101002:	e8 71 fe ff ff       	call   100e78 <outByte>
  101007:	83 c4 08             	add    $0x8,%esp
  10100a:	6a 0e                	push   $0xe
  10100c:	68 d4 03 00 00       	push   $0x3d4
  101011:	e8 62 fe ff ff       	call   100e78 <outByte>
  101016:	83 c4 08             	add    $0x8,%esp
  101019:	66 8b 45 fe          	mov    -0x2(%ebp),%ax
  10101d:	66 c1 e8 08          	shr    $0x8,%ax
  101021:	0f be c0             	movsbl %al,%eax
  101024:	50                   	push   %eax
  101025:	68 d5 03 00 00       	push   $0x3d5
  10102a:	e8 49 fe ff ff       	call   100e78 <outByte>
  10102f:	83 c4 08             	add    $0x8,%esp
  101032:	90                   	nop
  101033:	c9                   	leave  
  101034:	c3                   	ret    

00101035 <scrollScreen>:
  101035:	55                   	push   %ebp
  101036:	89 e5                	mov    %esp,%ebp
  101038:	57                   	push   %edi
  101039:	83 ec 14             	sub    $0x14,%esp
  10103c:	a1 68 4c 10 00       	mov    0x104c68,%eax
  101041:	85 c0                	test   %eax,%eax
  101043:	7f 12                	jg     101057 <scrollScreen+0x22>
  101045:	83 ec 08             	sub    $0x8,%esp
  101048:	6a 38                	push   $0x38
  10104a:	68 37 2d 10 00       	push   $0x102d37
  10104f:	e8 40 1c 00 00       	call   102c94 <abort>
  101054:	83 c4 10             	add    $0x10,%esp
  101057:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  10105e:	eb 76                	jmp    1010d6 <scrollScreen+0xa1>
  101060:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  101067:	eb 61                	jmp    1010ca <scrollScreen+0x95>
  101069:	a1 68 4c 10 00       	mov    0x104c68,%eax
  10106e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  101071:	75 0a                	jne    10107d <scrollScreen+0x48>
  101073:	a1 6c 4c 10 00       	mov    0x104c6c,%eax
  101078:	39 45 f0             	cmp    %eax,-0x10(%ebp)
  10107b:	7d 55                	jge    1010d2 <scrollScreen+0x9d>
  10107d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101080:	89 d0                	mov    %edx,%eax
  101082:	c1 e0 02             	shl    $0x2,%eax
  101085:	01 d0                	add    %edx,%eax
  101087:	c1 e0 04             	shl    $0x4,%eax
  10108a:	89 c2                	mov    %eax,%edx
  10108c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10108f:	01 d0                	add    %edx,%eax
  101091:	01 c0                	add    %eax,%eax
  101093:	89 c7                	mov    %eax,%edi
  101095:	65 8a 07             	mov    %gs:(%edi),%al
  101098:	88 45 ef             	mov    %al,-0x11(%ebp)
  10109b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10109e:	8d 50 ff             	lea    -0x1(%eax),%edx
  1010a1:	89 d0                	mov    %edx,%eax
  1010a3:	c1 e0 02             	shl    $0x2,%eax
  1010a6:	01 d0                	add    %edx,%eax
  1010a8:	c1 e0 04             	shl    $0x4,%eax
  1010ab:	89 c2                	mov    %eax,%edx
  1010ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1010b0:	01 d0                	add    %edx,%eax
  1010b2:	01 c0                	add    %eax,%eax
  1010b4:	89 c7                	mov    %eax,%edi
  1010b6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  1010ba:	8d 90 00 0c 00 00    	lea    0xc00(%eax),%edx
  1010c0:	66 89 d0             	mov    %dx,%ax
  1010c3:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1010c7:	ff 45 f0             	incl   -0x10(%ebp)
  1010ca:	83 7d f0 50          	cmpl   $0x50,-0x10(%ebp)
  1010ce:	7e 99                	jle    101069 <scrollScreen+0x34>
  1010d0:	eb 01                	jmp    1010d3 <scrollScreen+0x9e>
  1010d2:	90                   	nop
  1010d3:	ff 45 f4             	incl   -0xc(%ebp)
  1010d6:	a1 68 4c 10 00       	mov    0x104c68,%eax
  1010db:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  1010de:	7e 80                	jle    101060 <scrollScreen+0x2b>
  1010e0:	a1 68 4c 10 00       	mov    0x104c68,%eax
  1010e5:	48                   	dec    %eax
  1010e6:	a3 68 4c 10 00       	mov    %eax,0x104c68
  1010eb:	90                   	nop
  1010ec:	8b 7d fc             	mov    -0x4(%ebp),%edi
  1010ef:	c9                   	leave  
  1010f0:	c3                   	ret    

001010f1 <sys_write>:
  1010f1:	55                   	push   %ebp
  1010f2:	89 e5                	mov    %esp,%ebp
  1010f4:	53                   	push   %ebx
  1010f5:	83 ec 04             	sub    $0x4,%esp
  1010f8:	ba 30 00 00 00       	mov    $0x30,%edx
  1010fd:	89 d0                	mov    %edx,%eax
  1010ff:	8e e8                	mov    %eax,%gs
  101101:	8b 45 08             	mov    0x8(%ebp),%eax
  101104:	8b 40 20             	mov    0x20(%eax),%eax
  101107:	83 f8 01             	cmp    $0x1,%eax
  10110a:	74 1d                	je     101129 <sys_write+0x38>
  10110c:	8b 45 08             	mov    0x8(%ebp),%eax
  10110f:	8b 40 20             	mov    0x20(%eax),%eax
  101112:	83 f8 02             	cmp    $0x2,%eax
  101115:	74 12                	je     101129 <sys_write+0x38>
  101117:	83 ec 08             	sub    $0x8,%esp
  10111a:	6a 5c                	push   $0x5c
  10111c:	68 37 2d 10 00       	push   $0x102d37
  101121:	e8 6e 1b 00 00       	call   102c94 <abort>
  101126:	83 c4 10             	add    $0x10,%esp
  101129:	8b 45 08             	mov    0x8(%ebp),%eax
  10112c:	8b 40 24             	mov    0x24(%eax),%eax
  10112f:	89 c3                	mov    %eax,%ebx
  101131:	e8 f3 03 00 00       	call   101529 <getpid>
  101136:	c1 e0 10             	shl    $0x10,%eax
  101139:	89 c2                	mov    %eax,%edx
  10113b:	8b 45 08             	mov    0x8(%ebp),%eax
  10113e:	8b 40 28             	mov    0x28(%eax),%eax
  101141:	01 d0                	add    %edx,%eax
  101143:	83 ec 08             	sub    $0x8,%esp
  101146:	53                   	push   %ebx
  101147:	50                   	push   %eax
  101148:	e8 48 fd ff ff       	call   100e95 <printkernel>
  10114d:	83 c4 10             	add    $0x10,%esp
  101150:	90                   	nop
  101151:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101154:	c9                   	leave  
  101155:	c3                   	ret    

00101156 <print_char>:
  101156:	55                   	push   %ebp
  101157:	89 e5                	mov    %esp,%ebp
  101159:	57                   	push   %edi
  10115a:	83 ec 04             	sub    $0x4,%esp
  10115d:	8b 45 10             	mov    0x10(%ebp),%eax
  101160:	88 45 f8             	mov    %al,-0x8(%ebp)
  101163:	8b 55 08             	mov    0x8(%ebp),%edx
  101166:	89 d0                	mov    %edx,%eax
  101168:	c1 e0 02             	shl    $0x2,%eax
  10116b:	01 d0                	add    %edx,%eax
  10116d:	c1 e0 04             	shl    $0x4,%eax
  101170:	89 c2                	mov    %eax,%edx
  101172:	8b 45 0c             	mov    0xc(%ebp),%eax
  101175:	01 d0                	add    %edx,%eax
  101177:	01 c0                	add    %eax,%eax
  101179:	89 c7                	mov    %eax,%edi
  10117b:	0f be 45 f8          	movsbl -0x8(%ebp),%eax
  10117f:	8d 90 00 0c 00 00    	lea    0xc00(%eax),%edx
  101185:	66 89 d0             	mov    %dx,%ax
  101188:	65 66 89 07          	mov    %ax,%gs:(%edi)
  10118c:	90                   	nop
  10118d:	83 c4 04             	add    $0x4,%esp
  101190:	5f                   	pop    %edi
  101191:	5d                   	pop    %ebp
  101192:	c3                   	ret    

00101193 <inByte>:
  101193:	55                   	push   %ebp
  101194:	89 e5                	mov    %esp,%ebp
  101196:	83 ec 14             	sub    $0x14,%esp
  101199:	8b 45 08             	mov    0x8(%ebp),%eax
  10119c:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  1011a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1011a3:	89 c2                	mov    %eax,%edx
  1011a5:	ec                   	in     (%dx),%al
  1011a6:	88 45 ff             	mov    %al,-0x1(%ebp)
  1011a9:	8a 45 ff             	mov    -0x1(%ebp),%al
  1011ac:	c9                   	leave  
  1011ad:	c3                   	ret    

001011ae <getScancode>:
  1011ae:	55                   	push   %ebp
  1011af:	89 e5                	mov    %esp,%ebp
  1011b1:	90                   	nop
  1011b2:	6a 64                	push   $0x64
  1011b4:	e8 da ff ff ff       	call   101193 <inByte>
  1011b9:	83 c4 04             	add    $0x4,%esp
  1011bc:	0f b6 c0             	movzbl %al,%eax
  1011bf:	83 e0 01             	and    $0x1,%eax
  1011c2:	85 c0                	test   %eax,%eax
  1011c4:	74 ec                	je     1011b2 <getScancode+0x4>
  1011c6:	6a 60                	push   $0x60
  1011c8:	e8 c6 ff ff ff       	call   101193 <inByte>
  1011cd:	83 c4 04             	add    $0x4,%esp
  1011d0:	c9                   	leave  
  1011d1:	c3                   	ret    

001011d2 <sys_read>:
  1011d2:	55                   	push   %ebp
  1011d3:	89 e5                	mov    %esp,%ebp
  1011d5:	53                   	push   %ebx
  1011d6:	83 ec 14             	sub    $0x14,%esp
  1011d9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  1011e0:	8b 45 08             	mov    0x8(%ebp),%eax
  1011e3:	8b 58 28             	mov    0x28(%eax),%ebx
  1011e6:	e8 3e 03 00 00       	call   101529 <getpid>
  1011eb:	c1 e0 10             	shl    $0x10,%eax
  1011ee:	01 d8                	add    %ebx,%eax
  1011f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1011f3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1011fa:	e9 63 01 00 00       	jmp    101362 <sys_read+0x190>
  1011ff:	e8 aa ff ff ff       	call   1011ae <getScancode>
  101204:	0f b6 c0             	movzbl %al,%eax
  101207:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10120a:	83 7d f0 3a          	cmpl   $0x3a,-0x10(%ebp)
  10120e:	75 18                	jne    101228 <sys_read+0x56>
  101210:	a1 70 4c 10 00       	mov    0x104c70,%eax
  101215:	83 f8 01             	cmp    $0x1,%eax
  101218:	0f 95 c0             	setne  %al
  10121b:	0f b6 c0             	movzbl %al,%eax
  10121e:	a3 70 4c 10 00       	mov    %eax,0x104c70
  101223:	e9 3a 01 00 00       	jmp    101362 <sys_read+0x190>
  101228:	83 7d f0 2a          	cmpl   $0x2a,-0x10(%ebp)
  10122c:	74 06                	je     101234 <sys_read+0x62>
  10122e:	83 7d f0 36          	cmpl   $0x36,-0x10(%ebp)
  101232:	75 0f                	jne    101243 <sys_read+0x71>
  101234:	c7 05 74 4c 10 00 01 	movl   $0x1,0x104c74
  10123b:	00 00 00 
  10123e:	e9 1f 01 00 00       	jmp    101362 <sys_read+0x190>
  101243:	81 7d f0 aa 00 00 00 	cmpl   $0xaa,-0x10(%ebp)
  10124a:	74 09                	je     101255 <sys_read+0x83>
  10124c:	81 7d f0 b6 00 00 00 	cmpl   $0xb6,-0x10(%ebp)
  101253:	75 0f                	jne    101264 <sys_read+0x92>
  101255:	c7 05 74 4c 10 00 00 	movl   $0x0,0x104c74
  10125c:	00 00 00 
  10125f:	e9 fe 00 00 00       	jmp    101362 <sys_read+0x190>
  101264:	83 7d f0 7f          	cmpl   $0x7f,-0x10(%ebp)
  101268:	76 05                	jbe    10126f <sys_read+0x9d>
  10126a:	e9 f3 00 00 00       	jmp    101362 <sys_read+0x190>
  10126f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101272:	05 40 4a 10 00       	add    $0x104a40,%eax
  101277:	8a 00                	mov    (%eax),%al
  101279:	88 45 eb             	mov    %al,-0x15(%ebp)
  10127c:	a1 74 4c 10 00       	mov    0x104c74,%eax
  101281:	83 f8 01             	cmp    $0x1,%eax
  101284:	75 4e                	jne    1012d4 <sys_read+0x102>
  101286:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  10128a:	77 0f                	ja     10129b <sys_read+0xc9>
  10128c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10128f:	48                   	dec    %eax
  101290:	8a 80 40 4b 10 00    	mov    0x104b40(%eax),%al
  101296:	88 45 eb             	mov    %al,-0x15(%ebp)
  101299:	eb 39                	jmp    1012d4 <sys_read+0x102>
  10129b:	8a 45 eb             	mov    -0x15(%ebp),%al
  10129e:	3c 60                	cmp    $0x60,%al
  1012a0:	7e 1b                	jle    1012bd <sys_read+0xeb>
  1012a2:	8a 45 eb             	mov    -0x15(%ebp),%al
  1012a5:	3c 7a                	cmp    $0x7a,%al
  1012a7:	7f 14                	jg     1012bd <sys_read+0xeb>
  1012a9:	a1 70 4c 10 00       	mov    0x104c70,%eax
  1012ae:	85 c0                	test   %eax,%eax
  1012b0:	75 0b                	jne    1012bd <sys_read+0xeb>
  1012b2:	8a 45 eb             	mov    -0x15(%ebp),%al
  1012b5:	83 e8 20             	sub    $0x20,%eax
  1012b8:	88 45 eb             	mov    %al,-0x15(%ebp)
  1012bb:	eb 17                	jmp    1012d4 <sys_read+0x102>
  1012bd:	8a 45 eb             	mov    -0x15(%ebp),%al
  1012c0:	3c 2b                	cmp    $0x2b,%al
  1012c2:	7e 10                	jle    1012d4 <sys_read+0x102>
  1012c4:	8a 45 eb             	mov    -0x15(%ebp),%al
  1012c7:	3c 2f                	cmp    $0x2f,%al
  1012c9:	7f 09                	jg     1012d4 <sys_read+0x102>
  1012cb:	8a 45 eb             	mov    -0x15(%ebp),%al
  1012ce:	83 c0 10             	add    $0x10,%eax
  1012d1:	88 45 eb             	mov    %al,-0x15(%ebp)
  1012d4:	a1 70 4c 10 00       	mov    0x104c70,%eax
  1012d9:	83 f8 01             	cmp    $0x1,%eax
  1012dc:	75 20                	jne    1012fe <sys_read+0x12c>
  1012de:	8a 45 eb             	mov    -0x15(%ebp),%al
  1012e1:	3c 60                	cmp    $0x60,%al
  1012e3:	7e 19                	jle    1012fe <sys_read+0x12c>
  1012e5:	8a 45 eb             	mov    -0x15(%ebp),%al
  1012e8:	3c 7a                	cmp    $0x7a,%al
  1012ea:	7f 12                	jg     1012fe <sys_read+0x12c>
  1012ec:	a1 74 4c 10 00       	mov    0x104c74,%eax
  1012f1:	85 c0                	test   %eax,%eax
  1012f3:	75 09                	jne    1012fe <sys_read+0x12c>
  1012f5:	8a 45 eb             	mov    -0x15(%ebp),%al
  1012f8:	83 e8 20             	sub    $0x20,%eax
  1012fb:	88 45 eb             	mov    %al,-0x15(%ebp)
  1012fe:	83 ec 0c             	sub    $0xc,%esp
  101301:	68 54 2d 10 00       	push   $0x102d54
  101306:	e8 cd 16 00 00       	call   1029d8 <printk>
  10130b:	83 c4 10             	add    $0x10,%esp
  10130e:	8a 45 eb             	mov    -0x15(%ebp),%al
  101311:	0f be c0             	movsbl %al,%eax
  101314:	83 ec 0c             	sub    $0xc,%esp
  101317:	50                   	push   %eax
  101318:	68 90 2d 10 00       	push   $0x102d90
  10131d:	6a 51                	push   $0x51
  10131f:	68 5a 2d 10 00       	push   $0x102d5a
  101324:	68 75 2d 10 00       	push   $0x102d75
  101329:	e8 aa 16 00 00       	call   1029d8 <printk>
  10132e:	83 c4 20             	add    $0x20,%esp
  101331:	83 ec 0c             	sub    $0xc,%esp
  101334:	68 89 2d 10 00       	push   $0x102d89
  101339:	e8 9a 16 00 00       	call   1029d8 <printk>
  10133e:	83 c4 10             	add    $0x10,%esp
  101341:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101344:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101347:	01 c2                	add    %eax,%edx
  101349:	8a 45 eb             	mov    -0x15(%ebp),%al
  10134c:	88 02                	mov    %al,(%edx)
  10134e:	ff 45 f4             	incl   -0xc(%ebp)
  101351:	83 ec 08             	sub    $0x8,%esp
  101354:	6a 01                	push   $0x1
  101356:	8d 45 eb             	lea    -0x15(%ebp),%eax
  101359:	50                   	push   %eax
  10135a:	e8 36 fb ff ff       	call   100e95 <printkernel>
  10135f:	83 c4 10             	add    $0x10,%esp
  101362:	8a 45 eb             	mov    -0x15(%ebp),%al
  101365:	3c 0a                	cmp    $0xa,%al
  101367:	0f 85 92 fe ff ff    	jne    1011ff <sys_read+0x2d>
  10136d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101370:	8d 50 ff             	lea    -0x1(%eax),%edx
  101373:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101376:	01 d0                	add    %edx,%eax
  101378:	c6 00 00             	movb   $0x0,(%eax)
  10137b:	8b 45 08             	mov    0x8(%ebp),%eax
  10137e:	8b 58 28             	mov    0x28(%eax),%ebx
  101381:	e8 a3 01 00 00       	call   101529 <getpid>
  101386:	c1 e0 10             	shl    $0x10,%eax
  101389:	01 d8                	add    %ebx,%eax
  10138b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10138e:	c9                   	leave  
  10138f:	c3                   	ret    

00101390 <inByte>:
  101390:	55                   	push   %ebp
  101391:	89 e5                	mov    %esp,%ebp
  101393:	83 ec 14             	sub    $0x14,%esp
  101396:	8b 45 08             	mov    0x8(%ebp),%eax
  101399:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  10139d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1013a0:	89 c2                	mov    %eax,%edx
  1013a2:	ec                   	in     (%dx),%al
  1013a3:	88 45 ff             	mov    %al,-0x1(%ebp)
  1013a6:	8a 45 ff             	mov    -0x1(%ebp),%al
  1013a9:	c9                   	leave  
  1013aa:	c3                   	ret    

001013ab <outByte>:
  1013ab:	55                   	push   %ebp
  1013ac:	89 e5                	mov    %esp,%ebp
  1013ae:	83 ec 08             	sub    $0x8,%esp
  1013b1:	8b 45 08             	mov    0x8(%ebp),%eax
  1013b4:	8b 55 0c             	mov    0xc(%ebp),%edx
  1013b7:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  1013bb:	88 55 f8             	mov    %dl,-0x8(%ebp)
  1013be:	8a 45 f8             	mov    -0x8(%ebp),%al
  1013c1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1013c4:	ee                   	out    %al,(%dx)
  1013c5:	90                   	nop
  1013c6:	c9                   	leave  
  1013c7:	c3                   	ret    

001013c8 <initSerial>:
  1013c8:	55                   	push   %ebp
  1013c9:	89 e5                	mov    %esp,%ebp
  1013cb:	6a 00                	push   $0x0
  1013cd:	68 f9 03 00 00       	push   $0x3f9
  1013d2:	e8 d4 ff ff ff       	call   1013ab <outByte>
  1013d7:	83 c4 08             	add    $0x8,%esp
  1013da:	6a 80                	push   $0xffffff80
  1013dc:	68 fb 03 00 00       	push   $0x3fb
  1013e1:	e8 c5 ff ff ff       	call   1013ab <outByte>
  1013e6:	83 c4 08             	add    $0x8,%esp
  1013e9:	6a 01                	push   $0x1
  1013eb:	68 f8 03 00 00       	push   $0x3f8
  1013f0:	e8 b6 ff ff ff       	call   1013ab <outByte>
  1013f5:	83 c4 08             	add    $0x8,%esp
  1013f8:	6a 00                	push   $0x0
  1013fa:	68 f9 03 00 00       	push   $0x3f9
  1013ff:	e8 a7 ff ff ff       	call   1013ab <outByte>
  101404:	83 c4 08             	add    $0x8,%esp
  101407:	6a 03                	push   $0x3
  101409:	68 fb 03 00 00       	push   $0x3fb
  10140e:	e8 98 ff ff ff       	call   1013ab <outByte>
  101413:	83 c4 08             	add    $0x8,%esp
  101416:	6a c7                	push   $0xffffffc7
  101418:	68 fa 03 00 00       	push   $0x3fa
  10141d:	e8 89 ff ff ff       	call   1013ab <outByte>
  101422:	83 c4 08             	add    $0x8,%esp
  101425:	6a 0b                	push   $0xb
  101427:	68 fc 03 00 00       	push   $0x3fc
  10142c:	e8 7a ff ff ff       	call   1013ab <outByte>
  101431:	83 c4 08             	add    $0x8,%esp
  101434:	90                   	nop
  101435:	c9                   	leave  
  101436:	c3                   	ret    

00101437 <serialIdle>:
  101437:	55                   	push   %ebp
  101438:	89 e5                	mov    %esp,%ebp
  10143a:	68 fd 03 00 00       	push   $0x3fd
  10143f:	e8 4c ff ff ff       	call   101390 <inByte>
  101444:	83 c4 04             	add    $0x4,%esp
  101447:	0f b6 c0             	movzbl %al,%eax
  10144a:	83 e0 20             	and    $0x20,%eax
  10144d:	85 c0                	test   %eax,%eax
  10144f:	0f 95 c0             	setne  %al
  101452:	0f b6 c0             	movzbl %al,%eax
  101455:	c9                   	leave  
  101456:	c3                   	ret    

00101457 <putChar>:
  101457:	55                   	push   %ebp
  101458:	89 e5                	mov    %esp,%ebp
  10145a:	83 ec 04             	sub    $0x4,%esp
  10145d:	8b 45 08             	mov    0x8(%ebp),%eax
  101460:	88 45 fc             	mov    %al,-0x4(%ebp)
  101463:	90                   	nop
  101464:	e8 ce ff ff ff       	call   101437 <serialIdle>
  101469:	83 f8 01             	cmp    $0x1,%eax
  10146c:	75 f6                	jne    101464 <putChar+0xd>
  10146e:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
  101472:	50                   	push   %eax
  101473:	68 f8 03 00 00       	push   $0x3f8
  101478:	e8 2e ff ff ff       	call   1013ab <outByte>
  10147d:	83 c4 08             	add    $0x8,%esp
  101480:	90                   	nop
  101481:	c9                   	leave  
  101482:	c3                   	ret    

00101483 <waitForInterrupt>:
  101483:	55                   	push   %ebp
  101484:	89 e5                	mov    %esp,%ebp
  101486:	f4                   	hlt    
  101487:	90                   	nop
  101488:	5d                   	pop    %ebp
  101489:	c3                   	ret    

0010148a <IDLE>:
  10148a:	55                   	push   %ebp
  10148b:	89 e5                	mov    %esp,%ebp
  10148d:	e8 f1 ff ff ff       	call   101483 <waitForInterrupt>
  101492:	eb f9                	jmp    10148d <IDLE+0x3>

00101494 <put_into_running>:
  101494:	55                   	push   %ebp
  101495:	89 e5                	mov    %esp,%ebp
  101497:	83 ec 08             	sub    $0x8,%esp
  10149a:	a1 00 55 10 00       	mov    0x105500,%eax
  10149f:	39 45 08             	cmp    %eax,0x8(%ebp)
  1014a2:	75 07                	jne    1014ab <put_into_running+0x17>
  1014a4:	b8 01 00 00 00       	mov    $0x1,%eax
  1014a9:	eb 3e                	jmp    1014e9 <put_into_running+0x55>
  1014ab:	8b 45 08             	mov    0x8(%ebp),%eax
  1014ae:	a3 00 55 10 00       	mov    %eax,0x105500
  1014b3:	e8 71 00 00 00       	call   101529 <getpid>
  1014b8:	89 c2                	mov    %eax,%edx
  1014ba:	89 d0                	mov    %edx,%eax
  1014bc:	c1 e0 07             	shl    $0x7,%eax
  1014bf:	01 d0                	add    %edx,%eax
  1014c1:	01 c0                	add    %eax,%eax
  1014c3:	01 d0                	add    %edx,%eax
  1014c5:	01 c0                	add    %eax,%eax
  1014c7:	01 d0                	add    %edx,%eax
  1014c9:	c1 e0 04             	shl    $0x4,%eax
  1014cc:	05 fc 1f 00 00       	add    $0x1ffc,%eax
  1014d1:	05 20 55 10 00       	add    $0x105520,%eax
  1014d6:	83 ec 08             	sub    $0x8,%esp
  1014d9:	50                   	push   %eax
  1014da:	6a 10                	push   $0x10
  1014dc:	e8 3d ef ff ff       	call   10041e <change_tss>
  1014e1:	83 c4 10             	add    $0x10,%esp
  1014e4:	b8 01 00 00 00       	mov    $0x1,%eax
  1014e9:	c9                   	leave  
  1014ea:	c3                   	ret    

001014eb <apply_new_pid>:
  1014eb:	55                   	push   %ebp
  1014ec:	89 e5                	mov    %esp,%ebp
  1014ee:	83 ec 18             	sub    $0x18,%esp
  1014f1:	8b 15 78 4c 10 00    	mov    0x104c78,%edx
  1014f7:	a1 78 4c 10 00       	mov    0x104c78,%eax
  1014fc:	83 ec 08             	sub    $0x8,%esp
  1014ff:	52                   	push   %edx
  101500:	50                   	push   %eax
  101501:	e8 21 04 00 00       	call   101927 <get_from>
  101506:	83 c4 10             	add    $0x10,%esp
  101509:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10150c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10150f:	c9                   	leave  
  101510:	c3                   	ret    

00101511 <put_into_empty>:
  101511:	55                   	push   %ebp
  101512:	89 e5                	mov    %esp,%ebp
  101514:	83 ec 08             	sub    $0x8,%esp
  101517:	83 ec 08             	sub    $0x8,%esp
  10151a:	ff 75 08             	pushl  0x8(%ebp)
  10151d:	6a 03                	push   $0x3
  10151f:	e8 fa 01 00 00       	call   10171e <put_into>
  101524:	83 c4 10             	add    $0x10,%esp
  101527:	c9                   	leave  
  101528:	c3                   	ret    

00101529 <getpid>:
  101529:	55                   	push   %ebp
  10152a:	89 e5                	mov    %esp,%ebp
  10152c:	a1 00 55 10 00       	mov    0x105500,%eax
  101531:	5d                   	pop    %ebp
  101532:	c3                   	ret    

00101533 <getrunnable>:
  101533:	55                   	push   %ebp
  101534:	89 e5                	mov    %esp,%ebp
  101536:	a1 58 4b 10 00       	mov    0x104b58,%eax
  10153b:	5d                   	pop    %ebp
  10153c:	c3                   	ret    

0010153d <getblocked>:
  10153d:	55                   	push   %ebp
  10153e:	89 e5                	mov    %esp,%ebp
  101540:	a1 5c 4b 10 00       	mov    0x104b5c,%eax
  101545:	5d                   	pop    %ebp
  101546:	c3                   	ret    

00101547 <get_from_runnable>:
  101547:	55                   	push   %ebp
  101548:	89 e5                	mov    %esp,%ebp
  10154a:	83 ec 08             	sub    $0x8,%esp
  10154d:	8b 15 58 4b 10 00    	mov    0x104b58,%edx
  101553:	a1 58 4b 10 00       	mov    0x104b58,%eax
  101558:	83 ec 08             	sub    $0x8,%esp
  10155b:	52                   	push   %edx
  10155c:	50                   	push   %eax
  10155d:	e8 c5 03 00 00       	call   101927 <get_from>
  101562:	83 c4 10             	add    $0x10,%esp
  101565:	c9                   	leave  
  101566:	c3                   	ret    

00101567 <put_into_runnable>:
  101567:	55                   	push   %ebp
  101568:	89 e5                	mov    %esp,%ebp
  10156a:	57                   	push   %edi
  10156b:	56                   	push   %esi
  10156c:	53                   	push   %ebx
  10156d:	83 ec 0c             	sub    $0xc,%esp
  101570:	8b 55 08             	mov    0x8(%ebp),%edx
  101573:	89 d0                	mov    %edx,%eax
  101575:	c1 e0 07             	shl    $0x7,%eax
  101578:	01 d0                	add    %edx,%eax
  10157a:	01 c0                	add    %eax,%eax
  10157c:	01 d0                	add    %edx,%eax
  10157e:	01 c0                	add    %eax,%eax
  101580:	01 d0                	add    %edx,%eax
  101582:	c1 e0 04             	shl    $0x4,%eax
  101585:	8d 90 20 75 10 00    	lea    0x107520(%eax),%edx
  10158b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10158e:	89 c3                	mov    %eax,%ebx
  101590:	b8 13 00 00 00       	mov    $0x13,%eax
  101595:	89 d7                	mov    %edx,%edi
  101597:	89 de                	mov    %ebx,%esi
  101599:	89 c1                	mov    %eax,%ecx
  10159b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10159d:	8b 0d 08 55 10 00    	mov    0x105508,%ecx
  1015a3:	8b 55 08             	mov    0x8(%ebp),%edx
  1015a6:	89 d0                	mov    %edx,%eax
  1015a8:	c1 e0 07             	shl    $0x7,%eax
  1015ab:	01 d0                	add    %edx,%eax
  1015ad:	01 c0                	add    %eax,%eax
  1015af:	01 d0                	add    %edx,%eax
  1015b1:	01 c0                	add    %eax,%eax
  1015b3:	01 d0                	add    %edx,%eax
  1015b5:	c1 e0 04             	shl    $0x4,%eax
  1015b8:	05 70 75 10 00       	add    $0x107570,%eax
  1015bd:	89 08                	mov    %ecx,(%eax)
  1015bf:	8b 55 08             	mov    0x8(%ebp),%edx
  1015c2:	89 d0                	mov    %edx,%eax
  1015c4:	c1 e0 07             	shl    $0x7,%eax
  1015c7:	01 d0                	add    %edx,%eax
  1015c9:	01 c0                	add    %eax,%eax
  1015cb:	01 d0                	add    %edx,%eax
  1015cd:	01 c0                	add    %eax,%eax
  1015cf:	01 d0                	add    %edx,%eax
  1015d1:	c1 e0 04             	shl    $0x4,%eax
  1015d4:	05 6c 75 10 00       	add    $0x10756c,%eax
  1015d9:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  1015df:	83 ec 08             	sub    $0x8,%esp
  1015e2:	ff 75 08             	pushl  0x8(%ebp)
  1015e5:	6a 01                	push   $0x1
  1015e7:	e8 32 01 00 00       	call   10171e <put_into>
  1015ec:	83 c4 10             	add    $0x10,%esp
  1015ef:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1015f2:	5b                   	pop    %ebx
  1015f3:	5e                   	pop    %esi
  1015f4:	5f                   	pop    %edi
  1015f5:	5d                   	pop    %ebp
  1015f6:	c3                   	ret    

001015f7 <check_block>:
  1015f7:	55                   	push   %ebp
  1015f8:	89 e5                	mov    %esp,%ebp
  1015fa:	83 ec 18             	sub    $0x18,%esp
  1015fd:	a1 5c 4b 10 00       	mov    0x104b5c,%eax
  101602:	83 f8 ff             	cmp    $0xffffffff,%eax
  101605:	75 0a                	jne    101611 <check_block+0x1a>
  101607:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10160c:	e9 0b 01 00 00       	jmp    10171c <check_block+0x125>
  101611:	a1 5c 4b 10 00       	mov    0x104b5c,%eax
  101616:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101619:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  101620:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101623:	89 d0                	mov    %edx,%eax
  101625:	c1 e0 07             	shl    $0x7,%eax
  101628:	01 d0                	add    %edx,%eax
  10162a:	01 c0                	add    %eax,%eax
  10162c:	01 d0                	add    %edx,%eax
  10162e:	01 c0                	add    %eax,%eax
  101630:	01 d0                	add    %edx,%eax
  101632:	c1 e0 04             	shl    $0x4,%eax
  101635:	05 6c 75 10 00       	add    $0x10756c,%eax
  10163a:	8b 00                	mov    (%eax),%eax
  10163c:	85 c0                	test   %eax,%eax
  10163e:	0f 85 9c 00 00 00    	jne    1016e0 <check_block+0xe9>
  101644:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101647:	89 d0                	mov    %edx,%eax
  101649:	c1 e0 07             	shl    $0x7,%eax
  10164c:	01 d0                	add    %edx,%eax
  10164e:	01 c0                	add    %eax,%eax
  101650:	01 d0                	add    %edx,%eax
  101652:	01 c0                	add    %eax,%eax
  101654:	01 d0                	add    %edx,%eax
  101656:	c1 e0 04             	shl    $0x4,%eax
  101659:	05 74 75 10 00       	add    $0x107574,%eax
  10165e:	8b 00                	mov    (%eax),%eax
  101660:	85 c0                	test   %eax,%eax
  101662:	7f 7c                	jg     1016e0 <check_block+0xe9>
  101664:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101667:	89 d0                	mov    %edx,%eax
  101669:	c1 e0 07             	shl    $0x7,%eax
  10166c:	01 d0                	add    %edx,%eax
  10166e:	01 c0                	add    %eax,%eax
  101670:	01 d0                	add    %edx,%eax
  101672:	01 c0                	add    %eax,%eax
  101674:	01 d0                	add    %edx,%eax
  101676:	c1 e0 04             	shl    $0x4,%eax
  101679:	05 80 75 10 00       	add    $0x107580,%eax
  10167e:	8b 00                	mov    (%eax),%eax
  101680:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101683:	83 ec 0c             	sub    $0xc,%esp
  101686:	ff 75 f4             	pushl  -0xc(%ebp)
  101689:	e8 68 04 00 00       	call   101af6 <get_from_block>
  10168e:	83 c4 10             	add    $0x10,%esp
  101691:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101694:	89 d0                	mov    %edx,%eax
  101696:	c1 e0 07             	shl    $0x7,%eax
  101699:	01 d0                	add    %edx,%eax
  10169b:	01 c0                	add    %eax,%eax
  10169d:	01 d0                	add    %edx,%eax
  10169f:	01 c0                	add    %eax,%eax
  1016a1:	01 d0                	add    %edx,%eax
  1016a3:	c1 e0 04             	shl    $0x4,%eax
  1016a6:	05 00 20 00 00       	add    $0x2000,%eax
  1016ab:	05 20 55 10 00       	add    $0x105520,%eax
  1016b0:	83 ec 08             	sub    $0x8,%esp
  1016b3:	50                   	push   %eax
  1016b4:	ff 75 f4             	pushl  -0xc(%ebp)
  1016b7:	e8 ab fe ff ff       	call   101567 <put_into_runnable>
  1016bc:	83 c4 10             	add    $0x10,%esp
  1016bf:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1016c2:	89 d0                	mov    %edx,%eax
  1016c4:	c1 e0 07             	shl    $0x7,%eax
  1016c7:	01 d0                	add    %edx,%eax
  1016c9:	01 c0                	add    %eax,%eax
  1016cb:	01 d0                	add    %edx,%eax
  1016cd:	01 c0                	add    %eax,%eax
  1016cf:	01 d0                	add    %edx,%eax
  1016d1:	c1 e0 04             	shl    $0x4,%eax
  1016d4:	05 80 75 10 00       	add    $0x107580,%eax
  1016d9:	8b 00                	mov    (%eax),%eax
  1016db:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1016de:	eb 1f                	jmp    1016ff <check_block+0x108>
  1016e0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1016e3:	89 d0                	mov    %edx,%eax
  1016e5:	c1 e0 07             	shl    $0x7,%eax
  1016e8:	01 d0                	add    %edx,%eax
  1016ea:	01 c0                	add    %eax,%eax
  1016ec:	01 d0                	add    %edx,%eax
  1016ee:	01 c0                	add    %eax,%eax
  1016f0:	01 d0                	add    %edx,%eax
  1016f2:	c1 e0 04             	shl    $0x4,%eax
  1016f5:	05 80 75 10 00       	add    $0x107580,%eax
  1016fa:	8b 00                	mov    (%eax),%eax
  1016fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1016ff:	a1 5c 4b 10 00       	mov    0x104b5c,%eax
  101704:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  101707:	74 0e                	je     101717 <check_block+0x120>
  101709:	a1 5c 4b 10 00       	mov    0x104b5c,%eax
  10170e:	83 f8 ff             	cmp    $0xffffffff,%eax
  101711:	0f 85 09 ff ff ff    	jne    101620 <check_block+0x29>
  101717:	b8 01 00 00 00       	mov    $0x1,%eax
  10171c:	c9                   	leave  
  10171d:	c3                   	ret    

0010171e <put_into>:
  10171e:	55                   	push   %ebp
  10171f:	89 e5                	mov    %esp,%ebp
  101721:	83 ec 18             	sub    $0x18,%esp
  101724:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10172b:	8b 45 08             	mov    0x8(%ebp),%eax
  10172e:	83 f8 01             	cmp    $0x1,%eax
  101731:	74 14                	je     101747 <put_into+0x29>
  101733:	83 f8 03             	cmp    $0x3,%eax
  101736:	74 06                	je     10173e <put_into+0x20>
  101738:	85 c0                	test   %eax,%eax
  10173a:	74 14                	je     101750 <put_into+0x32>
  10173c:	eb 1b                	jmp    101759 <put_into+0x3b>
  10173e:	c7 45 f4 78 4c 10 00 	movl   $0x104c78,-0xc(%ebp)
  101745:	eb 2e                	jmp    101775 <put_into+0x57>
  101747:	c7 45 f4 58 4b 10 00 	movl   $0x104b58,-0xc(%ebp)
  10174e:	eb 25                	jmp    101775 <put_into+0x57>
  101750:	c7 45 f4 5c 4b 10 00 	movl   $0x104b5c,-0xc(%ebp)
  101757:	eb 1c                	jmp    101775 <put_into+0x57>
  101759:	83 ec 08             	sub    $0x8,%esp
  10175c:	6a 5f                	push   $0x5f
  10175e:	68 9c 2d 10 00       	push   $0x102d9c
  101763:	e8 2c 15 00 00       	call   102c94 <abort>
  101768:	83 c4 10             	add    $0x10,%esp
  10176b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101770:	e9 1e 01 00 00       	jmp    101893 <put_into+0x175>
  101775:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101778:	8b 00                	mov    (%eax),%eax
  10177a:	83 f8 ff             	cmp    $0xffffffff,%eax
  10177d:	75 57                	jne    1017d6 <put_into+0xb8>
  10177f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101782:	8b 55 0c             	mov    0xc(%ebp),%edx
  101785:	89 10                	mov    %edx,(%eax)
  101787:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10178a:	8b 10                	mov    (%eax),%edx
  10178c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10178f:	8b 00                	mov    (%eax),%eax
  101791:	89 c1                	mov    %eax,%ecx
  101793:	89 d0                	mov    %edx,%eax
  101795:	c1 e0 07             	shl    $0x7,%eax
  101798:	01 d0                	add    %edx,%eax
  10179a:	01 c0                	add    %eax,%eax
  10179c:	01 d0                	add    %edx,%eax
  10179e:	01 c0                	add    %eax,%eax
  1017a0:	01 d0                	add    %edx,%eax
  1017a2:	c1 e0 04             	shl    $0x4,%eax
  1017a5:	05 80 75 10 00       	add    $0x107580,%eax
  1017aa:	89 08                	mov    %ecx,(%eax)
  1017ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1017af:	8b 10                	mov    (%eax),%edx
  1017b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1017b4:	8b 00                	mov    (%eax),%eax
  1017b6:	89 c1                	mov    %eax,%ecx
  1017b8:	89 d0                	mov    %edx,%eax
  1017ba:	c1 e0 07             	shl    $0x7,%eax
  1017bd:	01 d0                	add    %edx,%eax
  1017bf:	01 c0                	add    %eax,%eax
  1017c1:	01 d0                	add    %edx,%eax
  1017c3:	01 c0                	add    %eax,%eax
  1017c5:	01 d0                	add    %edx,%eax
  1017c7:	c1 e0 04             	shl    $0x4,%eax
  1017ca:	05 7c 75 10 00       	add    $0x10757c,%eax
  1017cf:	89 08                	mov    %ecx,(%eax)
  1017d1:	e9 b8 00 00 00       	jmp    10188e <put_into+0x170>
  1017d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1017d9:	8b 10                	mov    (%eax),%edx
  1017db:	89 d0                	mov    %edx,%eax
  1017dd:	c1 e0 07             	shl    $0x7,%eax
  1017e0:	01 d0                	add    %edx,%eax
  1017e2:	01 c0                	add    %eax,%eax
  1017e4:	01 d0                	add    %edx,%eax
  1017e6:	01 c0                	add    %eax,%eax
  1017e8:	01 d0                	add    %edx,%eax
  1017ea:	c1 e0 04             	shl    $0x4,%eax
  1017ed:	05 7c 75 10 00       	add    $0x10757c,%eax
  1017f2:	8b 10                	mov    (%eax),%edx
  1017f4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1017f7:	89 d0                	mov    %edx,%eax
  1017f9:	c1 e0 07             	shl    $0x7,%eax
  1017fc:	01 d0                	add    %edx,%eax
  1017fe:	01 c0                	add    %eax,%eax
  101800:	01 d0                	add    %edx,%eax
  101802:	01 c0                	add    %eax,%eax
  101804:	01 d0                	add    %edx,%eax
  101806:	c1 e0 04             	shl    $0x4,%eax
  101809:	05 80 75 10 00       	add    $0x107580,%eax
  10180e:	89 08                	mov    %ecx,(%eax)
  101810:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101813:	8b 10                	mov    (%eax),%edx
  101815:	89 d0                	mov    %edx,%eax
  101817:	c1 e0 07             	shl    $0x7,%eax
  10181a:	01 d0                	add    %edx,%eax
  10181c:	01 c0                	add    %eax,%eax
  10181e:	01 d0                	add    %edx,%eax
  101820:	01 c0                	add    %eax,%eax
  101822:	01 d0                	add    %edx,%eax
  101824:	c1 e0 04             	shl    $0x4,%eax
  101827:	05 7c 75 10 00       	add    $0x10757c,%eax
  10182c:	8b 08                	mov    (%eax),%ecx
  10182e:	8b 55 0c             	mov    0xc(%ebp),%edx
  101831:	89 d0                	mov    %edx,%eax
  101833:	c1 e0 07             	shl    $0x7,%eax
  101836:	01 d0                	add    %edx,%eax
  101838:	01 c0                	add    %eax,%eax
  10183a:	01 d0                	add    %edx,%eax
  10183c:	01 c0                	add    %eax,%eax
  10183e:	01 d0                	add    %edx,%eax
  101840:	c1 e0 04             	shl    $0x4,%eax
  101843:	05 7c 75 10 00       	add    $0x10757c,%eax
  101848:	89 08                	mov    %ecx,(%eax)
  10184a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10184d:	8b 00                	mov    (%eax),%eax
  10184f:	89 c1                	mov    %eax,%ecx
  101851:	8b 55 0c             	mov    0xc(%ebp),%edx
  101854:	89 d0                	mov    %edx,%eax
  101856:	c1 e0 07             	shl    $0x7,%eax
  101859:	01 d0                	add    %edx,%eax
  10185b:	01 c0                	add    %eax,%eax
  10185d:	01 d0                	add    %edx,%eax
  10185f:	01 c0                	add    %eax,%eax
  101861:	01 d0                	add    %edx,%eax
  101863:	c1 e0 04             	shl    $0x4,%eax
  101866:	05 80 75 10 00       	add    $0x107580,%eax
  10186b:	89 08                	mov    %ecx,(%eax)
  10186d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101870:	8b 10                	mov    (%eax),%edx
  101872:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  101875:	89 d0                	mov    %edx,%eax
  101877:	c1 e0 07             	shl    $0x7,%eax
  10187a:	01 d0                	add    %edx,%eax
  10187c:	01 c0                	add    %eax,%eax
  10187e:	01 d0                	add    %edx,%eax
  101880:	01 c0                	add    %eax,%eax
  101882:	01 d0                	add    %edx,%eax
  101884:	c1 e0 04             	shl    $0x4,%eax
  101887:	05 7c 75 10 00       	add    $0x10757c,%eax
  10188c:	89 08                	mov    %ecx,(%eax)
  10188e:	b8 01 00 00 00       	mov    $0x1,%eax
  101893:	c9                   	leave  
  101894:	c3                   	ret    

00101895 <put_into_block>:
  101895:	55                   	push   %ebp
  101896:	89 e5                	mov    %esp,%ebp
  101898:	57                   	push   %edi
  101899:	56                   	push   %esi
  10189a:	53                   	push   %ebx
  10189b:	83 ec 0c             	sub    $0xc,%esp
  10189e:	8b 55 08             	mov    0x8(%ebp),%edx
  1018a1:	89 d0                	mov    %edx,%eax
  1018a3:	c1 e0 07             	shl    $0x7,%eax
  1018a6:	01 d0                	add    %edx,%eax
  1018a8:	01 c0                	add    %eax,%eax
  1018aa:	01 d0                	add    %edx,%eax
  1018ac:	01 c0                	add    %eax,%eax
  1018ae:	01 d0                	add    %edx,%eax
  1018b0:	c1 e0 04             	shl    $0x4,%eax
  1018b3:	8d 90 20 75 10 00    	lea    0x107520(%eax),%edx
  1018b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1018bc:	89 c3                	mov    %eax,%ebx
  1018be:	b8 13 00 00 00       	mov    $0x13,%eax
  1018c3:	89 d7                	mov    %edx,%edi
  1018c5:	89 de                	mov    %ebx,%esi
  1018c7:	89 c1                	mov    %eax,%ecx
  1018c9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1018cb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1018ce:	8b 40 20             	mov    0x20(%eax),%eax
  1018d1:	89 c1                	mov    %eax,%ecx
  1018d3:	8b 55 08             	mov    0x8(%ebp),%edx
  1018d6:	89 d0                	mov    %edx,%eax
  1018d8:	c1 e0 07             	shl    $0x7,%eax
  1018db:	01 d0                	add    %edx,%eax
  1018dd:	01 c0                	add    %eax,%eax
  1018df:	01 d0                	add    %edx,%eax
  1018e1:	01 c0                	add    %eax,%eax
  1018e3:	01 d0                	add    %edx,%eax
  1018e5:	c1 e0 04             	shl    $0x4,%eax
  1018e8:	05 74 75 10 00       	add    $0x107574,%eax
  1018ed:	89 08                	mov    %ecx,(%eax)
  1018ef:	8b 55 08             	mov    0x8(%ebp),%edx
  1018f2:	89 d0                	mov    %edx,%eax
  1018f4:	c1 e0 07             	shl    $0x7,%eax
  1018f7:	01 d0                	add    %edx,%eax
  1018f9:	01 c0                	add    %eax,%eax
  1018fb:	01 d0                	add    %edx,%eax
  1018fd:	01 c0                	add    %eax,%eax
  1018ff:	01 d0                	add    %edx,%eax
  101901:	c1 e0 04             	shl    $0x4,%eax
  101904:	05 6c 75 10 00       	add    $0x10756c,%eax
  101909:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  10190f:	83 ec 08             	sub    $0x8,%esp
  101912:	ff 75 08             	pushl  0x8(%ebp)
  101915:	6a 00                	push   $0x0
  101917:	e8 02 fe ff ff       	call   10171e <put_into>
  10191c:	83 c4 10             	add    $0x10,%esp
  10191f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101922:	5b                   	pop    %ebx
  101923:	5e                   	pop    %esi
  101924:	5f                   	pop    %edi
  101925:	5d                   	pop    %ebp
  101926:	c3                   	ret    

00101927 <get_from>:
  101927:	55                   	push   %ebp
  101928:	89 e5                	mov    %esp,%ebp
  10192a:	83 ec 18             	sub    $0x18,%esp
  10192d:	83 ec 08             	sub    $0x8,%esp
  101930:	ff 75 0c             	pushl  0xc(%ebp)
  101933:	ff 75 08             	pushl  0x8(%ebp)
  101936:	e8 f6 01 00 00       	call   101b31 <check_is_in>
  10193b:	83 c4 10             	add    $0x10,%esp
  10193e:	83 f8 01             	cmp    $0x1,%eax
  101941:	74 61                	je     1019a4 <get_from+0x7d>
  101943:	83 ec 0c             	sub    $0xc,%esp
  101946:	68 aa 2d 10 00       	push   $0x102daa
  10194b:	e8 88 10 00 00       	call   1029d8 <printk>
  101950:	83 c4 10             	add    $0x10,%esp
  101953:	83 ec 08             	sub    $0x8,%esp
  101956:	ff 75 0c             	pushl  0xc(%ebp)
  101959:	ff 75 08             	pushl  0x8(%ebp)
  10195c:	68 dc 2d 10 00       	push   $0x102ddc
  101961:	6a 7f                	push   $0x7f
  101963:	68 9c 2d 10 00       	push   $0x102d9c
  101968:	68 b0 2d 10 00       	push   $0x102db0
  10196d:	e8 66 10 00 00       	call   1029d8 <printk>
  101972:	83 c4 20             	add    $0x20,%esp
  101975:	83 ec 0c             	sub    $0xc,%esp
  101978:	68 d4 2d 10 00       	push   $0x102dd4
  10197d:	e8 56 10 00 00       	call   1029d8 <printk>
  101982:	83 c4 10             	add    $0x10,%esp
  101985:	83 ec 08             	sub    $0x8,%esp
  101988:	68 80 00 00 00       	push   $0x80
  10198d:	68 9c 2d 10 00       	push   $0x102d9c
  101992:	e8 fd 12 00 00       	call   102c94 <abort>
  101997:	83 c4 10             	add    $0x10,%esp
  10199a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10199f:	e9 50 01 00 00       	jmp    101af4 <get_from+0x1cd>
  1019a4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1019ab:	8b 55 0c             	mov    0xc(%ebp),%edx
  1019ae:	89 d0                	mov    %edx,%eax
  1019b0:	c1 e0 07             	shl    $0x7,%eax
  1019b3:	01 d0                	add    %edx,%eax
  1019b5:	01 c0                	add    %eax,%eax
  1019b7:	01 d0                	add    %edx,%eax
  1019b9:	01 c0                	add    %eax,%eax
  1019bb:	01 d0                	add    %edx,%eax
  1019bd:	c1 e0 04             	shl    $0x4,%eax
  1019c0:	05 6c 75 10 00       	add    $0x10756c,%eax
  1019c5:	8b 00                	mov    (%eax),%eax
  1019c7:	83 f8 01             	cmp    $0x1,%eax
  1019ca:	74 14                	je     1019e0 <get_from+0xb9>
  1019cc:	83 f8 03             	cmp    $0x3,%eax
  1019cf:	74 06                	je     1019d7 <get_from+0xb0>
  1019d1:	85 c0                	test   %eax,%eax
  1019d3:	74 14                	je     1019e9 <get_from+0xc2>
  1019d5:	eb 1b                	jmp    1019f2 <get_from+0xcb>
  1019d7:	c7 45 f4 78 4c 10 00 	movl   $0x104c78,-0xc(%ebp)
  1019de:	eb 27                	jmp    101a07 <get_from+0xe0>
  1019e0:	c7 45 f4 58 4b 10 00 	movl   $0x104b58,-0xc(%ebp)
  1019e7:	eb 1e                	jmp    101a07 <get_from+0xe0>
  1019e9:	c7 45 f4 5c 4b 10 00 	movl   $0x104b5c,-0xc(%ebp)
  1019f0:	eb 15                	jmp    101a07 <get_from+0xe0>
  1019f2:	83 ec 08             	sub    $0x8,%esp
  1019f5:	68 92 00 00 00       	push   $0x92
  1019fa:	68 9c 2d 10 00       	push   $0x102d9c
  1019ff:	e8 90 12 00 00       	call   102c94 <abort>
  101a04:	83 c4 10             	add    $0x10,%esp
  101a07:	8b 45 08             	mov    0x8(%ebp),%eax
  101a0a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101a0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a10:	8b 00                	mov    (%eax),%eax
  101a12:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  101a15:	74 15                	je     101a2c <get_from+0x105>
  101a17:	83 ec 08             	sub    $0x8,%esp
  101a1a:	68 97 00 00 00       	push   $0x97
  101a1f:	68 9c 2d 10 00       	push   $0x102d9c
  101a24:	e8 6b 12 00 00       	call   102c94 <abort>
  101a29:	83 c4 10             	add    $0x10,%esp
  101a2c:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  101a30:	75 0a                	jne    101a3c <get_from+0x115>
  101a32:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101a37:	e9 b8 00 00 00       	jmp    101af4 <get_from+0x1cd>
  101a3c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101a3f:	89 d0                	mov    %edx,%eax
  101a41:	c1 e0 07             	shl    $0x7,%eax
  101a44:	01 d0                	add    %edx,%eax
  101a46:	01 c0                	add    %eax,%eax
  101a48:	01 d0                	add    %edx,%eax
  101a4a:	01 c0                	add    %eax,%eax
  101a4c:	01 d0                	add    %edx,%eax
  101a4e:	c1 e0 04             	shl    $0x4,%eax
  101a51:	05 80 75 10 00       	add    $0x107580,%eax
  101a56:	8b 10                	mov    (%eax),%edx
  101a58:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101a5b:	39 c2                	cmp    %eax,%edx
  101a5d:	75 0e                	jne    101a6d <get_from+0x146>
  101a5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a62:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
  101a68:	e9 84 00 00 00       	jmp    101af1 <get_from+0x1ca>
  101a6d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101a70:	89 d0                	mov    %edx,%eax
  101a72:	c1 e0 07             	shl    $0x7,%eax
  101a75:	01 d0                	add    %edx,%eax
  101a77:	01 c0                	add    %eax,%eax
  101a79:	01 d0                	add    %edx,%eax
  101a7b:	01 c0                	add    %eax,%eax
  101a7d:	01 d0                	add    %edx,%eax
  101a7f:	c1 e0 04             	shl    $0x4,%eax
  101a82:	05 7c 75 10 00       	add    $0x10757c,%eax
  101a87:	8b 00                	mov    (%eax),%eax
  101a89:	89 45 ec             	mov    %eax,-0x14(%ebp)
  101a8c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101a8f:	89 d0                	mov    %edx,%eax
  101a91:	c1 e0 07             	shl    $0x7,%eax
  101a94:	01 d0                	add    %edx,%eax
  101a96:	01 c0                	add    %eax,%eax
  101a98:	01 d0                	add    %edx,%eax
  101a9a:	01 c0                	add    %eax,%eax
  101a9c:	01 d0                	add    %edx,%eax
  101a9e:	c1 e0 04             	shl    $0x4,%eax
  101aa1:	05 80 75 10 00       	add    $0x107580,%eax
  101aa6:	8b 00                	mov    (%eax),%eax
  101aa8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  101aab:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  101aae:	8b 55 ec             	mov    -0x14(%ebp),%edx
  101ab1:	89 d0                	mov    %edx,%eax
  101ab3:	c1 e0 07             	shl    $0x7,%eax
  101ab6:	01 d0                	add    %edx,%eax
  101ab8:	01 c0                	add    %eax,%eax
  101aba:	01 d0                	add    %edx,%eax
  101abc:	01 c0                	add    %eax,%eax
  101abe:	01 d0                	add    %edx,%eax
  101ac0:	c1 e0 04             	shl    $0x4,%eax
  101ac3:	05 80 75 10 00       	add    $0x107580,%eax
  101ac8:	89 08                	mov    %ecx,(%eax)
  101aca:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  101acd:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101ad0:	89 d0                	mov    %edx,%eax
  101ad2:	c1 e0 07             	shl    $0x7,%eax
  101ad5:	01 d0                	add    %edx,%eax
  101ad7:	01 c0                	add    %eax,%eax
  101ad9:	01 d0                	add    %edx,%eax
  101adb:	01 c0                	add    %eax,%eax
  101add:	01 d0                	add    %edx,%eax
  101adf:	c1 e0 04             	shl    $0x4,%eax
  101ae2:	05 7c 75 10 00       	add    $0x10757c,%eax
  101ae7:	89 08                	mov    %ecx,(%eax)
  101ae9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101aec:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101aef:	89 10                	mov    %edx,(%eax)
  101af1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101af4:	c9                   	leave  
  101af5:	c3                   	ret    

00101af6 <get_from_block>:
  101af6:	55                   	push   %ebp
  101af7:	89 e5                	mov    %esp,%ebp
  101af9:	83 ec 08             	sub    $0x8,%esp
  101afc:	a1 5c 4b 10 00       	mov    0x104b5c,%eax
  101b01:	83 ec 08             	sub    $0x8,%esp
  101b04:	ff 75 08             	pushl  0x8(%ebp)
  101b07:	50                   	push   %eax
  101b08:	e8 1a fe ff ff       	call   101927 <get_from>
  101b0d:	83 c4 10             	add    $0x10,%esp
  101b10:	83 f8 ff             	cmp    $0xffffffff,%eax
  101b13:	75 15                	jne    101b2a <get_from_block+0x34>
  101b15:	83 ec 08             	sub    $0x8,%esp
  101b18:	68 ae 00 00 00       	push   $0xae
  101b1d:	68 9c 2d 10 00       	push   $0x102d9c
  101b22:	e8 6d 11 00 00       	call   102c94 <abort>
  101b27:	83 c4 10             	add    $0x10,%esp
  101b2a:	b8 01 00 00 00       	mov    $0x1,%eax
  101b2f:	c9                   	leave  
  101b30:	c3                   	ret    

00101b31 <check_is_in>:
  101b31:	55                   	push   %ebp
  101b32:	89 e5                	mov    %esp,%ebp
  101b34:	83 ec 10             	sub    $0x10,%esp
  101b37:	8b 45 08             	mov    0x8(%ebp),%eax
  101b3a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101b3d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101b40:	3b 45 0c             	cmp    0xc(%ebp),%eax
  101b43:	75 07                	jne    101b4c <check_is_in+0x1b>
  101b45:	b8 01 00 00 00       	mov    $0x1,%eax
  101b4a:	eb 2c                	jmp    101b78 <check_is_in+0x47>
  101b4c:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101b4f:	89 d0                	mov    %edx,%eax
  101b51:	c1 e0 07             	shl    $0x7,%eax
  101b54:	01 d0                	add    %edx,%eax
  101b56:	01 c0                	add    %eax,%eax
  101b58:	01 d0                	add    %edx,%eax
  101b5a:	01 c0                	add    %eax,%eax
  101b5c:	01 d0                	add    %edx,%eax
  101b5e:	c1 e0 04             	shl    $0x4,%eax
  101b61:	05 80 75 10 00       	add    $0x107580,%eax
  101b66:	8b 00                	mov    (%eax),%eax
  101b68:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101b6b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101b6e:	3b 45 08             	cmp    0x8(%ebp),%eax
  101b71:	75 ca                	jne    101b3d <check_is_in+0xc>
  101b73:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101b78:	c9                   	leave  
  101b79:	c3                   	ret    

00101b7a <block_decrease>:
  101b7a:	55                   	push   %ebp
  101b7b:	89 e5                	mov    %esp,%ebp
  101b7d:	83 ec 10             	sub    $0x10,%esp
  101b80:	a1 5c 4b 10 00       	mov    0x104b5c,%eax
  101b85:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101b88:	83 7d fc ff          	cmpl   $0xffffffff,-0x4(%ebp)
  101b8c:	75 07                	jne    101b95 <block_decrease+0x1b>
  101b8e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101b93:	eb 69                	jmp    101bfe <block_decrease+0x84>
  101b95:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101b98:	89 d0                	mov    %edx,%eax
  101b9a:	c1 e0 07             	shl    $0x7,%eax
  101b9d:	01 d0                	add    %edx,%eax
  101b9f:	01 c0                	add    %eax,%eax
  101ba1:	01 d0                	add    %edx,%eax
  101ba3:	01 c0                	add    %eax,%eax
  101ba5:	01 d0                	add    %edx,%eax
  101ba7:	c1 e0 04             	shl    $0x4,%eax
  101baa:	05 74 75 10 00       	add    $0x107574,%eax
  101baf:	8b 00                	mov    (%eax),%eax
  101bb1:	8d 48 ff             	lea    -0x1(%eax),%ecx
  101bb4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101bb7:	89 d0                	mov    %edx,%eax
  101bb9:	c1 e0 07             	shl    $0x7,%eax
  101bbc:	01 d0                	add    %edx,%eax
  101bbe:	01 c0                	add    %eax,%eax
  101bc0:	01 d0                	add    %edx,%eax
  101bc2:	01 c0                	add    %eax,%eax
  101bc4:	01 d0                	add    %edx,%eax
  101bc6:	c1 e0 04             	shl    $0x4,%eax
  101bc9:	05 74 75 10 00       	add    $0x107574,%eax
  101bce:	89 08                	mov    %ecx,(%eax)
  101bd0:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101bd3:	89 d0                	mov    %edx,%eax
  101bd5:	c1 e0 07             	shl    $0x7,%eax
  101bd8:	01 d0                	add    %edx,%eax
  101bda:	01 c0                	add    %eax,%eax
  101bdc:	01 d0                	add    %edx,%eax
  101bde:	01 c0                	add    %eax,%eax
  101be0:	01 d0                	add    %edx,%eax
  101be2:	c1 e0 04             	shl    $0x4,%eax
  101be5:	05 80 75 10 00       	add    $0x107580,%eax
  101bea:	8b 00                	mov    (%eax),%eax
  101bec:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101bef:	a1 5c 4b 10 00       	mov    0x104b5c,%eax
  101bf4:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  101bf7:	75 9c                	jne    101b95 <block_decrease+0x1b>
  101bf9:	b8 01 00 00 00       	mov    $0x1,%eax
  101bfe:	c9                   	leave  
  101bff:	c3                   	ret    

00101c00 <init_pcb>:
  101c00:	55                   	push   %ebp
  101c01:	89 e5                	mov    %esp,%ebp
  101c03:	83 ec 10             	sub    $0x10,%esp
  101c06:	c7 05 08 55 10 00 05 	movl   $0x5,0x105508
  101c0d:	00 00 00 
  101c10:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101c17:	e9 86 00 00 00       	jmp    101ca2 <init_pcb+0xa2>
  101c1c:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  101c1f:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101c22:	89 d0                	mov    %edx,%eax
  101c24:	c1 e0 07             	shl    $0x7,%eax
  101c27:	01 d0                	add    %edx,%eax
  101c29:	01 c0                	add    %eax,%eax
  101c2b:	01 d0                	add    %edx,%eax
  101c2d:	01 c0                	add    %eax,%eax
  101c2f:	01 d0                	add    %edx,%eax
  101c31:	c1 e0 04             	shl    $0x4,%eax
  101c34:	05 78 75 10 00       	add    $0x107578,%eax
  101c39:	89 08                	mov    %ecx,(%eax)
  101c3b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101c3e:	48                   	dec    %eax
  101c3f:	89 c1                	mov    %eax,%ecx
  101c41:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101c44:	89 d0                	mov    %edx,%eax
  101c46:	c1 e0 07             	shl    $0x7,%eax
  101c49:	01 d0                	add    %edx,%eax
  101c4b:	01 c0                	add    %eax,%eax
  101c4d:	01 d0                	add    %edx,%eax
  101c4f:	01 c0                	add    %eax,%eax
  101c51:	01 d0                	add    %edx,%eax
  101c53:	c1 e0 04             	shl    $0x4,%eax
  101c56:	05 7c 75 10 00       	add    $0x10757c,%eax
  101c5b:	89 08                	mov    %ecx,(%eax)
  101c5d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101c60:	40                   	inc    %eax
  101c61:	89 c1                	mov    %eax,%ecx
  101c63:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101c66:	89 d0                	mov    %edx,%eax
  101c68:	c1 e0 07             	shl    $0x7,%eax
  101c6b:	01 d0                	add    %edx,%eax
  101c6d:	01 c0                	add    %eax,%eax
  101c6f:	01 d0                	add    %edx,%eax
  101c71:	01 c0                	add    %eax,%eax
  101c73:	01 d0                	add    %edx,%eax
  101c75:	c1 e0 04             	shl    $0x4,%eax
  101c78:	05 80 75 10 00       	add    $0x107580,%eax
  101c7d:	89 08                	mov    %ecx,(%eax)
  101c7f:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101c82:	89 d0                	mov    %edx,%eax
  101c84:	c1 e0 07             	shl    $0x7,%eax
  101c87:	01 d0                	add    %edx,%eax
  101c89:	01 c0                	add    %eax,%eax
  101c8b:	01 d0                	add    %edx,%eax
  101c8d:	01 c0                	add    %eax,%eax
  101c8f:	01 d0                	add    %edx,%eax
  101c91:	c1 e0 04             	shl    $0x4,%eax
  101c94:	05 6c 75 10 00       	add    $0x10756c,%eax
  101c99:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  101c9f:	ff 45 fc             	incl   -0x4(%ebp)
  101ca2:	81 7d fc ff 07 00 00 	cmpl   $0x7ff,-0x4(%ebp)
  101ca9:	0f 8e 6d ff ff ff    	jle    101c1c <init_pcb+0x1c>
  101caf:	c7 05 7c 75 10 00 ff 	movl   $0x7ff,0x10757c
  101cb6:	07 00 00 
  101cb9:	c7 05 10 d5 13 01 00 	movl   $0x0,0x113d510
  101cc0:	00 00 00 
  101cc3:	90                   	nop
  101cc4:	c9                   	leave  
  101cc5:	c3                   	ret    

00101cc6 <init_kernel_pcb>:
  101cc6:	55                   	push   %ebp
  101cc7:	89 e5                	mov    %esp,%ebp
  101cc9:	83 ec 08             	sub    $0x8,%esp
  101ccc:	e8 1a f8 ff ff       	call   1014eb <apply_new_pid>
  101cd1:	85 c0                	test   %eax,%eax
  101cd3:	74 15                	je     101cea <init_kernel_pcb+0x24>
  101cd5:	83 ec 08             	sub    $0x8,%esp
  101cd8:	68 e1 00 00 00       	push   $0xe1
  101cdd:	68 9c 2d 10 00       	push   $0x102d9c
  101ce2:	e8 ad 0f 00 00       	call   102c94 <abort>
  101ce7:	83 c4 10             	add    $0x10,%esp
  101cea:	c7 05 68 75 10 00 10 	movl   $0x10,0x107568
  101cf1:	00 00 00 
  101cf4:	c7 05 5c 75 10 00 08 	movl   $0x8,0x10755c
  101cfb:	00 00 00 
  101cfe:	c7 05 2c 75 10 00 10 	movl   $0x10,0x10752c
  101d05:	00 00 00 
  101d08:	c7 05 28 75 10 00 10 	movl   $0x10,0x107528
  101d0f:	00 00 00 
  101d12:	b8 8a 14 10 00       	mov    $0x10148a,%eax
  101d17:	a3 58 75 10 00       	mov    %eax,0x107558
  101d1c:	c7 05 64 75 10 00 00 	movl   $0x400000,0x107564
  101d23:	00 40 00 
  101d26:	c7 05 6c 75 10 00 01 	movl   $0x1,0x10756c
  101d2d:	00 00 00 
  101d30:	c7 05 70 75 10 00 04 	movl   $0x4,0x107570
  101d37:	00 00 00 
  101d3a:	b8 01 00 00 00       	mov    $0x1,%eax
  101d3f:	c9                   	leave  
  101d40:	c3                   	ret    

00101d41 <make_pcb>:
  101d41:	55                   	push   %ebp
  101d42:	89 e5                	mov    %esp,%ebp
  101d44:	57                   	push   %edi
  101d45:	56                   	push   %esi
  101d46:	53                   	push   %ebx
  101d47:	8b 55 08             	mov    0x8(%ebp),%edx
  101d4a:	89 d0                	mov    %edx,%eax
  101d4c:	c1 e0 07             	shl    $0x7,%eax
  101d4f:	01 d0                	add    %edx,%eax
  101d51:	01 c0                	add    %eax,%eax
  101d53:	01 d0                	add    %edx,%eax
  101d55:	01 c0                	add    %eax,%eax
  101d57:	01 d0                	add    %edx,%eax
  101d59:	c1 e0 04             	shl    $0x4,%eax
  101d5c:	8d 90 20 75 10 00    	lea    0x107520(%eax),%edx
  101d62:	8b 45 0c             	mov    0xc(%ebp),%eax
  101d65:	89 c3                	mov    %eax,%ebx
  101d67:	b8 13 00 00 00       	mov    $0x13,%eax
  101d6c:	89 d7                	mov    %edx,%edi
  101d6e:	89 de                	mov    %ebx,%esi
  101d70:	89 c1                	mov    %eax,%ecx
  101d72:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101d74:	8b 4d 10             	mov    0x10(%ebp),%ecx
  101d77:	8b 55 08             	mov    0x8(%ebp),%edx
  101d7a:	89 d0                	mov    %edx,%eax
  101d7c:	c1 e0 07             	shl    $0x7,%eax
  101d7f:	01 d0                	add    %edx,%eax
  101d81:	01 c0                	add    %eax,%eax
  101d83:	01 d0                	add    %edx,%eax
  101d85:	01 c0                	add    %eax,%eax
  101d87:	01 d0                	add    %edx,%eax
  101d89:	c1 e0 04             	shl    $0x4,%eax
  101d8c:	05 6c 75 10 00       	add    $0x10756c,%eax
  101d91:	89 08                	mov    %ecx,(%eax)
  101d93:	8b 4d 14             	mov    0x14(%ebp),%ecx
  101d96:	8b 55 08             	mov    0x8(%ebp),%edx
  101d99:	89 d0                	mov    %edx,%eax
  101d9b:	c1 e0 07             	shl    $0x7,%eax
  101d9e:	01 d0                	add    %edx,%eax
  101da0:	01 c0                	add    %eax,%eax
  101da2:	01 d0                	add    %edx,%eax
  101da4:	01 c0                	add    %eax,%eax
  101da6:	01 d0                	add    %edx,%eax
  101da8:	c1 e0 04             	shl    $0x4,%eax
  101dab:	05 70 75 10 00       	add    $0x107570,%eax
  101db0:	89 08                	mov    %ecx,(%eax)
  101db2:	8b 4d 18             	mov    0x18(%ebp),%ecx
  101db5:	8b 55 08             	mov    0x8(%ebp),%edx
  101db8:	89 d0                	mov    %edx,%eax
  101dba:	c1 e0 07             	shl    $0x7,%eax
  101dbd:	01 d0                	add    %edx,%eax
  101dbf:	01 c0                	add    %eax,%eax
  101dc1:	01 d0                	add    %edx,%eax
  101dc3:	01 c0                	add    %eax,%eax
  101dc5:	01 d0                	add    %edx,%eax
  101dc7:	c1 e0 04             	shl    $0x4,%eax
  101dca:	05 74 75 10 00       	add    $0x107574,%eax
  101dcf:	89 08                	mov    %ecx,(%eax)
  101dd1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  101dd4:	8b 55 08             	mov    0x8(%ebp),%edx
  101dd7:	89 d0                	mov    %edx,%eax
  101dd9:	c1 e0 07             	shl    $0x7,%eax
  101ddc:	01 d0                	add    %edx,%eax
  101dde:	01 c0                	add    %eax,%eax
  101de0:	01 d0                	add    %edx,%eax
  101de2:	01 c0                	add    %eax,%eax
  101de4:	01 d0                	add    %edx,%eax
  101de6:	c1 e0 04             	shl    $0x4,%eax
  101de9:	05 8c 75 10 00       	add    $0x10758c,%eax
  101dee:	89 08                	mov    %ecx,(%eax)
  101df0:	b8 01 00 00 00       	mov    $0x1,%eax
  101df5:	5b                   	pop    %ebx
  101df6:	5e                   	pop    %esi
  101df7:	5f                   	pop    %edi
  101df8:	5d                   	pop    %ebp
  101df9:	c3                   	ret    

00101dfa <saveIdt>:
  101dfa:	55                   	push   %ebp
  101dfb:	89 e5                	mov    %esp,%ebp
  101dfd:	8b 45 0c             	mov    0xc(%ebp),%eax
  101e00:	48                   	dec    %eax
  101e01:	66 a3 7c 4c 10 00    	mov    %ax,0x104c7c
  101e07:	8b 45 08             	mov    0x8(%ebp),%eax
  101e0a:	66 a3 7e 4c 10 00    	mov    %ax,0x104c7e
  101e10:	8b 45 08             	mov    0x8(%ebp),%eax
  101e13:	c1 e8 10             	shr    $0x10,%eax
  101e16:	66 a3 80 4c 10 00    	mov    %ax,0x104c80
  101e1c:	b8 7c 4c 10 00       	mov    $0x104c7c,%eax
  101e21:	0f 01 18             	lidtl  (%eax)
  101e24:	90                   	nop
  101e25:	5d                   	pop    %ebp
  101e26:	c3                   	ret    

00101e27 <setIntr>:
  101e27:	55                   	push   %ebp
  101e28:	89 e5                	mov    %esp,%ebp
  101e2a:	8b 45 10             	mov    0x10(%ebp),%eax
  101e2d:	8b 55 08             	mov    0x8(%ebp),%edx
  101e30:	66 89 02             	mov    %ax,(%edx)
  101e33:	8b 45 0c             	mov    0xc(%ebp),%eax
  101e36:	c1 e0 03             	shl    $0x3,%eax
  101e39:	8b 55 08             	mov    0x8(%ebp),%edx
  101e3c:	66 89 42 02          	mov    %ax,0x2(%edx)
  101e40:	8b 45 08             	mov    0x8(%ebp),%eax
  101e43:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  101e47:	8b 45 08             	mov    0x8(%ebp),%eax
  101e4a:	8a 50 05             	mov    0x5(%eax),%dl
  101e4d:	83 e2 f0             	and    $0xfffffff0,%edx
  101e50:	83 ca 0e             	or     $0xe,%edx
  101e53:	88 50 05             	mov    %dl,0x5(%eax)
  101e56:	8b 45 08             	mov    0x8(%ebp),%eax
  101e59:	8a 50 05             	mov    0x5(%eax),%dl
  101e5c:	83 e2 ef             	and    $0xffffffef,%edx
  101e5f:	88 50 05             	mov    %dl,0x5(%eax)
  101e62:	8b 45 14             	mov    0x14(%ebp),%eax
  101e65:	83 e0 03             	and    $0x3,%eax
  101e68:	88 c2                	mov    %al,%dl
  101e6a:	8b 45 08             	mov    0x8(%ebp),%eax
  101e6d:	83 e2 03             	and    $0x3,%edx
  101e70:	88 d1                	mov    %dl,%cl
  101e72:	c1 e1 05             	shl    $0x5,%ecx
  101e75:	8a 50 05             	mov    0x5(%eax),%dl
  101e78:	83 e2 9f             	and    $0xffffff9f,%edx
  101e7b:	09 ca                	or     %ecx,%edx
  101e7d:	88 50 05             	mov    %dl,0x5(%eax)
  101e80:	8b 45 08             	mov    0x8(%ebp),%eax
  101e83:	8a 50 05             	mov    0x5(%eax),%dl
  101e86:	83 ca 80             	or     $0xffffff80,%edx
  101e89:	88 50 05             	mov    %dl,0x5(%eax)
  101e8c:	8b 45 10             	mov    0x10(%ebp),%eax
  101e8f:	c1 e8 10             	shr    $0x10,%eax
  101e92:	8b 55 08             	mov    0x8(%ebp),%edx
  101e95:	66 89 42 06          	mov    %ax,0x6(%edx)
  101e99:	90                   	nop
  101e9a:	5d                   	pop    %ebp
  101e9b:	c3                   	ret    

00101e9c <setTrap>:
  101e9c:	55                   	push   %ebp
  101e9d:	89 e5                	mov    %esp,%ebp
  101e9f:	8b 45 10             	mov    0x10(%ebp),%eax
  101ea2:	8b 55 08             	mov    0x8(%ebp),%edx
  101ea5:	66 89 02             	mov    %ax,(%edx)
  101ea8:	8b 45 0c             	mov    0xc(%ebp),%eax
  101eab:	c1 e0 03             	shl    $0x3,%eax
  101eae:	8b 55 08             	mov    0x8(%ebp),%edx
  101eb1:	66 89 42 02          	mov    %ax,0x2(%edx)
  101eb5:	8b 45 08             	mov    0x8(%ebp),%eax
  101eb8:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  101ebc:	8b 45 08             	mov    0x8(%ebp),%eax
  101ebf:	8a 50 05             	mov    0x5(%eax),%dl
  101ec2:	83 ca 0f             	or     $0xf,%edx
  101ec5:	88 50 05             	mov    %dl,0x5(%eax)
  101ec8:	8b 45 08             	mov    0x8(%ebp),%eax
  101ecb:	8a 50 05             	mov    0x5(%eax),%dl
  101ece:	83 e2 ef             	and    $0xffffffef,%edx
  101ed1:	88 50 05             	mov    %dl,0x5(%eax)
  101ed4:	8b 45 14             	mov    0x14(%ebp),%eax
  101ed7:	83 e0 03             	and    $0x3,%eax
  101eda:	88 c2                	mov    %al,%dl
  101edc:	8b 45 08             	mov    0x8(%ebp),%eax
  101edf:	83 e2 03             	and    $0x3,%edx
  101ee2:	88 d1                	mov    %dl,%cl
  101ee4:	c1 e1 05             	shl    $0x5,%ecx
  101ee7:	8a 50 05             	mov    0x5(%eax),%dl
  101eea:	83 e2 9f             	and    $0xffffff9f,%edx
  101eed:	09 ca                	or     %ecx,%edx
  101eef:	88 50 05             	mov    %dl,0x5(%eax)
  101ef2:	8b 45 08             	mov    0x8(%ebp),%eax
  101ef5:	8a 50 05             	mov    0x5(%eax),%dl
  101ef8:	83 ca 80             	or     $0xffffff80,%edx
  101efb:	88 50 05             	mov    %dl,0x5(%eax)
  101efe:	8b 45 10             	mov    0x10(%ebp),%eax
  101f01:	c1 e8 10             	shr    $0x10,%eax
  101f04:	8b 55 08             	mov    0x8(%ebp),%edx
  101f07:	66 89 42 06          	mov    %ax,0x6(%edx)
  101f0b:	90                   	nop
  101f0c:	5d                   	pop    %ebp
  101f0d:	c3                   	ret    

00101f0e <initIdt>:
  101f0e:	55                   	push   %ebp
  101f0f:	89 e5                	mov    %esp,%ebp
  101f11:	83 ec 10             	sub    $0x10,%esp
  101f14:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101f1b:	eb 21                	jmp    101f3e <initIdt+0x30>
  101f1d:	ba b7 2c 10 00       	mov    $0x102cb7,%edx
  101f22:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101f25:	c1 e0 03             	shl    $0x3,%eax
  101f28:	05 00 d6 13 01       	add    $0x113d600,%eax
  101f2d:	6a 00                	push   $0x0
  101f2f:	52                   	push   %edx
  101f30:	6a 01                	push   $0x1
  101f32:	50                   	push   %eax
  101f33:	e8 64 ff ff ff       	call   101e9c <setTrap>
  101f38:	83 c4 10             	add    $0x10,%esp
  101f3b:	ff 45 fc             	incl   -0x4(%ebp)
  101f3e:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  101f45:	7e d6                	jle    101f1d <initIdt+0xf>
  101f47:	ba bd 2c 10 00       	mov    $0x102cbd,%edx
  101f4c:	b8 68 d6 13 01       	mov    $0x113d668,%eax
  101f51:	6a 00                	push   $0x0
  101f53:	52                   	push   %edx
  101f54:	6a 01                	push   $0x1
  101f56:	50                   	push   %eax
  101f57:	e8 40 ff ff ff       	call   101e9c <setTrap>
  101f5c:	83 c4 10             	add    $0x10,%esp
  101f5f:	ba c1 2c 10 00       	mov    $0x102cc1,%edx
  101f64:	b8 00 da 13 01       	mov    $0x113da00,%eax
  101f69:	6a 03                	push   $0x3
  101f6b:	52                   	push   %edx
  101f6c:	6a 01                	push   $0x1
  101f6e:	50                   	push   %eax
  101f6f:	e8 b3 fe ff ff       	call   101e27 <setIntr>
  101f74:	83 c4 10             	add    $0x10,%esp
  101f77:	ba ca 2c 10 00       	mov    $0x102cca,%edx
  101f7c:	b8 00 d7 13 01       	mov    $0x113d700,%eax
  101f81:	6a 00                	push   $0x0
  101f83:	52                   	push   %edx
  101f84:	6a 01                	push   $0x1
  101f86:	50                   	push   %eax
  101f87:	e8 9b fe ff ff       	call   101e27 <setIntr>
  101f8c:	83 c4 10             	add    $0x10,%esp
  101f8f:	68 00 08 00 00       	push   $0x800
  101f94:	68 00 d6 13 01       	push   $0x113d600
  101f99:	e8 5c fe ff ff       	call   101dfa <saveIdt>
  101f9e:	83 c4 08             	add    $0x8,%esp
  101fa1:	90                   	nop
  101fa2:	c9                   	leave  
  101fa3:	c3                   	ret    

00101fa4 <enableInterrupt>:
  101fa4:	55                   	push   %ebp
  101fa5:	89 e5                	mov    %esp,%ebp
  101fa7:	fb                   	sti    
  101fa8:	90                   	nop
  101fa9:	5d                   	pop    %ebp
  101faa:	c3                   	ret    

00101fab <disableInterrupt>:
  101fab:	55                   	push   %ebp
  101fac:	89 e5                	mov    %esp,%ebp
  101fae:	fa                   	cli    
  101faf:	90                   	nop
  101fb0:	5d                   	pop    %ebp
  101fb1:	c3                   	ret    

00101fb2 <irqHandle>:
  101fb2:	55                   	push   %ebp
  101fb3:	89 e5                	mov    %esp,%ebp
  101fb5:	57                   	push   %edi
  101fb6:	56                   	push   %esi
  101fb7:	53                   	push   %ebx
  101fb8:	83 ec 1c             	sub    $0x1c,%esp
  101fbb:	b8 10 00 00 00       	mov    $0x10,%eax
  101fc0:	89 c0                	mov    %eax,%eax
  101fc2:	8e d8                	mov    %eax,%ds
  101fc4:	8e e0                	mov    %eax,%fs
  101fc6:	8e c0                	mov    %eax,%es
  101fc8:	b8 30 00 00 00       	mov    $0x30,%eax
  101fcd:	89 c0                	mov    %eax,%eax
  101fcf:	8e e8                	mov    %eax,%gs
  101fd1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  101fd8:	89 e8                	mov    %ebp,%eax
  101fda:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  101fdd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  101fe0:	83 c0 08             	add    $0x8,%eax
  101fe3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  101fe6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  101fe9:	8b 10                	mov    (%eax),%edx
  101feb:	8b 45 08             	mov    0x8(%ebp),%eax
  101fee:	39 c2                	cmp    %eax,%edx
  101ff0:	74 12                	je     102004 <irqHandle+0x52>
  101ff2:	83 ec 08             	sub    $0x8,%esp
  101ff5:	6a 1e                	push   $0x1e
  101ff7:	68 e8 2d 10 00       	push   $0x102de8
  101ffc:	e8 93 0c 00 00       	call   102c94 <abort>
  102001:	83 c4 10             	add    $0x10,%esp
  102004:	a1 00 55 10 00       	mov    0x105500,%eax
  102009:	89 45 dc             	mov    %eax,-0x24(%ebp)
  10200c:	e8 9a ff ff ff       	call   101fab <disableInterrupt>
  102011:	8b 45 08             	mov    0x8(%ebp),%eax
  102014:	8b 40 30             	mov    0x30(%eax),%eax
  102017:	83 f8 0d             	cmp    $0xd,%eax
  10201a:	74 1e                	je     10203a <irqHandle+0x88>
  10201c:	83 f8 0d             	cmp    $0xd,%eax
  10201f:	7f 0b                	jg     10202c <irqHandle+0x7a>
  102021:	83 f8 ff             	cmp    $0xffffffff,%eax
  102024:	0f 84 9e 00 00 00    	je     1020c8 <irqHandle+0x116>
  10202a:	eb 3e                	jmp    10206a <irqHandle+0xb8>
  10202c:	83 f8 20             	cmp    $0x20,%eax
  10202f:	74 29                	je     10205a <irqHandle+0xa8>
  102031:	3d 80 00 00 00       	cmp    $0x80,%eax
  102036:	74 12                	je     10204a <irqHandle+0x98>
  102038:	eb 30                	jmp    10206a <irqHandle+0xb8>
  10203a:	83 ec 0c             	sub    $0xc,%esp
  10203d:	ff 75 08             	pushl  0x8(%ebp)
  102040:	e8 b0 02 00 00       	call   1022f5 <GProtectFaultHandle>
  102045:	83 c4 10             	add    $0x10,%esp
  102048:	eb 7f                	jmp    1020c9 <irqHandle+0x117>
  10204a:	83 ec 0c             	sub    $0xc,%esp
  10204d:	ff 75 08             	pushl  0x8(%ebp)
  102050:	e8 3b 01 00 00       	call   102190 <syscallHandle>
  102055:	83 c4 10             	add    $0x10,%esp
  102058:	eb 6f                	jmp    1020c9 <irqHandle+0x117>
  10205a:	83 ec 0c             	sub    $0xc,%esp
  10205d:	ff 75 08             	pushl  0x8(%ebp)
  102060:	e8 ee 02 00 00       	call   102353 <timeHandle>
  102065:	83 c4 10             	add    $0x10,%esp
  102068:	eb 5f                	jmp    1020c9 <irqHandle+0x117>
  10206a:	83 ec 0c             	sub    $0xc,%esp
  10206d:	68 fb 2d 10 00       	push   $0x102dfb
  102072:	e8 61 09 00 00       	call   1029d8 <printk>
  102077:	83 c4 10             	add    $0x10,%esp
  10207a:	8b 45 08             	mov    0x8(%ebp),%eax
  10207d:	8b 50 38             	mov    0x38(%eax),%edx
  102080:	8b 45 08             	mov    0x8(%ebp),%eax
  102083:	8b 40 30             	mov    0x30(%eax),%eax
  102086:	83 ec 08             	sub    $0x8,%esp
  102089:	52                   	push   %edx
  10208a:	50                   	push   %eax
  10208b:	68 4c 2e 10 00       	push   $0x102e4c
  102090:	6a 35                	push   $0x35
  102092:	68 e8 2d 10 00       	push   $0x102de8
  102097:	68 04 2e 10 00       	push   $0x102e04
  10209c:	e8 37 09 00 00       	call   1029d8 <printk>
  1020a1:	83 c4 20             	add    $0x20,%esp
  1020a4:	83 ec 0c             	sub    $0xc,%esp
  1020a7:	68 29 2e 10 00       	push   $0x102e29
  1020ac:	e8 27 09 00 00       	call   1029d8 <printk>
  1020b1:	83 c4 10             	add    $0x10,%esp
  1020b4:	83 ec 08             	sub    $0x8,%esp
  1020b7:	6a 36                	push   $0x36
  1020b9:	68 e8 2d 10 00       	push   $0x102de8
  1020be:	e8 d1 0b 00 00       	call   102c94 <abort>
  1020c3:	83 c4 10             	add    $0x10,%esp
  1020c6:	eb 01                	jmp    1020c9 <irqHandle+0x117>
  1020c8:	90                   	nop
  1020c9:	8b 45 08             	mov    0x8(%ebp),%eax
  1020cc:	8b 40 30             	mov    0x30(%eax),%eax
  1020cf:	3d 80 00 00 00       	cmp    $0x80,%eax
  1020d4:	74 0f                	je     1020e5 <irqHandle+0x133>
  1020d6:	8b 45 08             	mov    0x8(%ebp),%eax
  1020d9:	8b 40 30             	mov    0x30(%eax),%eax
  1020dc:	83 f8 20             	cmp    $0x20,%eax
  1020df:	0f 85 9d 00 00 00    	jne    102182 <irqHandle+0x1d0>
  1020e5:	a1 00 55 10 00       	mov    0x105500,%eax
  1020ea:	3b 45 dc             	cmp    -0x24(%ebp),%eax
  1020ed:	0f 84 8f 00 00 00    	je     102182 <irqHandle+0x1d0>
  1020f3:	8b 15 00 55 10 00    	mov    0x105500,%edx
  1020f9:	89 d0                	mov    %edx,%eax
  1020fb:	c1 e0 07             	shl    $0x7,%eax
  1020fe:	01 d0                	add    %edx,%eax
  102100:	01 c0                	add    %eax,%eax
  102102:	01 d0                	add    %edx,%eax
  102104:	01 c0                	add    %eax,%eax
  102106:	01 d0                	add    %edx,%eax
  102108:	c1 e0 04             	shl    $0x4,%eax
  10210b:	05 20 55 10 00       	add    $0x105520,%eax
  102110:	05 fc 1f 00 00       	add    $0x1ffc,%eax
  102115:	8d 50 b4             	lea    -0x4c(%eax),%edx
  102118:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10211b:	89 10                	mov    %edx,(%eax)
  10211d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102120:	8b 00                	mov    (%eax),%eax
  102122:	89 45 d8             	mov    %eax,-0x28(%ebp)
  102125:	8b 15 00 55 10 00    	mov    0x105500,%edx
  10212b:	8b 4d d8             	mov    -0x28(%ebp),%ecx
  10212e:	89 d0                	mov    %edx,%eax
  102130:	c1 e0 07             	shl    $0x7,%eax
  102133:	01 d0                	add    %edx,%eax
  102135:	01 c0                	add    %eax,%eax
  102137:	01 d0                	add    %edx,%eax
  102139:	01 c0                	add    %eax,%eax
  10213b:	01 d0                	add    %edx,%eax
  10213d:	c1 e0 04             	shl    $0x4,%eax
  102140:	05 20 75 10 00       	add    $0x107520,%eax
  102145:	89 ca                	mov    %ecx,%edx
  102147:	89 c3                	mov    %eax,%ebx
  102149:	b8 13 00 00 00       	mov    $0x13,%eax
  10214e:	89 d7                	mov    %edx,%edi
  102150:	89 de                	mov    %ebx,%esi
  102152:	89 c1                	mov    %eax,%ecx
  102154:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102156:	a1 00 55 10 00       	mov    0x105500,%eax
  10215b:	c1 e0 10             	shl    $0x10,%eax
  10215e:	83 ec 08             	sub    $0x8,%esp
  102161:	50                   	push   %eax
  102162:	6a 23                	push   $0x23
  102164:	e8 69 df ff ff       	call   1000d2 <change_gdt>
  102169:	83 c4 10             	add    $0x10,%esp
  10216c:	a1 00 55 10 00       	mov    0x105500,%eax
  102171:	c1 e0 10             	shl    $0x10,%eax
  102174:	83 ec 08             	sub    $0x8,%esp
  102177:	50                   	push   %eax
  102178:	6a 1b                	push   $0x1b
  10217a:	e8 53 df ff ff       	call   1000d2 <change_gdt>
  10217f:	83 c4 10             	add    $0x10,%esp
  102182:	e8 1d fe ff ff       	call   101fa4 <enableInterrupt>
  102187:	90                   	nop
  102188:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10218b:	5b                   	pop    %ebx
  10218c:	5e                   	pop    %esi
  10218d:	5f                   	pop    %edi
  10218e:	5d                   	pop    %ebp
  10218f:	c3                   	ret    

00102190 <syscallHandle>:
  102190:	55                   	push   %ebp
  102191:	89 e5                	mov    %esp,%ebp
  102193:	83 ec 08             	sub    $0x8,%esp
  102196:	8b 45 08             	mov    0x8(%ebp),%eax
  102199:	8b 40 2c             	mov    0x2c(%eax),%eax
  10219c:	83 f8 07             	cmp    $0x7,%eax
  10219f:	0f 84 be 00 00 00    	je     102263 <syscallHandle+0xd3>
  1021a5:	83 f8 07             	cmp    $0x7,%eax
  1021a8:	77 2b                	ja     1021d5 <syscallHandle+0x45>
  1021aa:	83 f8 02             	cmp    $0x2,%eax
  1021ad:	0f 84 95 00 00 00    	je     102248 <syscallHandle+0xb8>
  1021b3:	83 f8 02             	cmp    $0x2,%eax
  1021b6:	77 0a                	ja     1021c2 <syscallHandle+0x32>
  1021b8:	83 f8 01             	cmp    $0x1,%eax
  1021bb:	74 78                	je     102235 <syscallHandle+0xa5>
  1021bd:	e9 31 01 00 00       	jmp    1022f3 <syscallHandle+0x163>
  1021c2:	83 f8 03             	cmp    $0x3,%eax
  1021c5:	0f 84 10 01 00 00    	je     1022db <syscallHandle+0x14b>
  1021cb:	83 f8 04             	cmp    $0x4,%eax
  1021ce:	74 3f                	je     10220f <syscallHandle+0x7f>
  1021d0:	e9 1e 01 00 00       	jmp    1022f3 <syscallHandle+0x163>
  1021d5:	83 f8 17             	cmp    $0x17,%eax
  1021d8:	0f 84 b5 00 00 00    	je     102293 <syscallHandle+0x103>
  1021de:	83 f8 17             	cmp    $0x17,%eax
  1021e1:	77 17                	ja     1021fa <syscallHandle+0x6a>
  1021e3:	83 f8 15             	cmp    $0x15,%eax
  1021e6:	0f 84 8f 00 00 00    	je     10227b <syscallHandle+0xeb>
  1021ec:	83 f8 16             	cmp    $0x16,%eax
  1021ef:	0f 84 b6 00 00 00    	je     1022ab <syscallHandle+0x11b>
  1021f5:	e9 f9 00 00 00       	jmp    1022f3 <syscallHandle+0x163>
  1021fa:	83 f8 18             	cmp    $0x18,%eax
  1021fd:	0f 84 c0 00 00 00    	je     1022c3 <syscallHandle+0x133>
  102203:	3d e6 00 00 00       	cmp    $0xe6,%eax
  102208:	74 18                	je     102222 <syscallHandle+0x92>
  10220a:	e9 e4 00 00 00       	jmp    1022f3 <syscallHandle+0x163>
  10220f:	83 ec 0c             	sub    $0xc,%esp
  102212:	ff 75 08             	pushl  0x8(%ebp)
  102215:	e8 d7 ee ff ff       	call   1010f1 <sys_write>
  10221a:	83 c4 10             	add    $0x10,%esp
  10221d:	e9 d0 00 00 00       	jmp    1022f2 <syscallHandle+0x162>
  102222:	83 ec 0c             	sub    $0xc,%esp
  102225:	ff 75 08             	pushl  0x8(%ebp)
  102228:	e8 6d ea ff ff       	call   100c9a <sys_sleep>
  10222d:	83 c4 10             	add    $0x10,%esp
  102230:	e9 bd 00 00 00       	jmp    1022f2 <syscallHandle+0x162>
  102235:	83 ec 0c             	sub    $0xc,%esp
  102238:	ff 75 08             	pushl  0x8(%ebp)
  10223b:	e8 16 ea ff ff       	call   100c56 <sys_exit>
  102240:	83 c4 10             	add    $0x10,%esp
  102243:	e9 aa 00 00 00       	jmp    1022f2 <syscallHandle+0x162>
  102248:	83 ec 0c             	sub    $0xc,%esp
  10224b:	ff 75 08             	pushl  0x8(%ebp)
  10224e:	e8 81 ea ff ff       	call   100cd4 <sys_fork>
  102253:	83 c4 10             	add    $0x10,%esp
  102256:	89 c2                	mov    %eax,%edx
  102258:	8b 45 08             	mov    0x8(%ebp),%eax
  10225b:	89 50 2c             	mov    %edx,0x2c(%eax)
  10225e:	e9 8f 00 00 00       	jmp    1022f2 <syscallHandle+0x162>
  102263:	83 ec 0c             	sub    $0xc,%esp
  102266:	ff 75 08             	pushl  0x8(%ebp)
  102269:	e8 1f ea ff ff       	call   100c8d <sys_getpid>
  10226e:	83 c4 10             	add    $0x10,%esp
  102271:	89 c2                	mov    %eax,%edx
  102273:	8b 45 08             	mov    0x8(%ebp),%eax
  102276:	89 50 2c             	mov    %edx,0x2c(%eax)
  102279:	eb 77                	jmp    1022f2 <syscallHandle+0x162>
  10227b:	83 ec 0c             	sub    $0xc,%esp
  10227e:	ff 75 08             	pushl  0x8(%ebp)
  102281:	e8 f8 02 00 00       	call   10257e <sys_sem_init>
  102286:	83 c4 10             	add    $0x10,%esp
  102289:	89 c2                	mov    %eax,%edx
  10228b:	8b 45 08             	mov    0x8(%ebp),%eax
  10228e:	89 50 2c             	mov    %edx,0x2c(%eax)
  102291:	eb 5f                	jmp    1022f2 <syscallHandle+0x162>
  102293:	83 ec 0c             	sub    $0xc,%esp
  102296:	ff 75 08             	pushl  0x8(%ebp)
  102299:	e8 4c 03 00 00       	call   1025ea <sys_sem_post>
  10229e:	83 c4 10             	add    $0x10,%esp
  1022a1:	89 c2                	mov    %eax,%edx
  1022a3:	8b 45 08             	mov    0x8(%ebp),%eax
  1022a6:	89 50 2c             	mov    %edx,0x2c(%eax)
  1022a9:	eb 47                	jmp    1022f2 <syscallHandle+0x162>
  1022ab:	83 ec 0c             	sub    $0xc,%esp
  1022ae:	ff 75 08             	pushl  0x8(%ebp)
  1022b1:	e8 71 03 00 00       	call   102627 <sys_sem_wait>
  1022b6:	83 c4 10             	add    $0x10,%esp
  1022b9:	89 c2                	mov    %eax,%edx
  1022bb:	8b 45 08             	mov    0x8(%ebp),%eax
  1022be:	89 50 2c             	mov    %edx,0x2c(%eax)
  1022c1:	eb 2f                	jmp    1022f2 <syscallHandle+0x162>
  1022c3:	83 ec 0c             	sub    $0xc,%esp
  1022c6:	ff 75 08             	pushl  0x8(%ebp)
  1022c9:	e8 96 03 00 00       	call   102664 <sys_sem_destroy>
  1022ce:	83 c4 10             	add    $0x10,%esp
  1022d1:	89 c2                	mov    %eax,%edx
  1022d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1022d6:	89 50 2c             	mov    %edx,0x2c(%eax)
  1022d9:	eb 17                	jmp    1022f2 <syscallHandle+0x162>
  1022db:	83 ec 0c             	sub    $0xc,%esp
  1022de:	ff 75 08             	pushl  0x8(%ebp)
  1022e1:	e8 ec ee ff ff       	call   1011d2 <sys_read>
  1022e6:	83 c4 10             	add    $0x10,%esp
  1022e9:	89 c2                	mov    %eax,%edx
  1022eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1022ee:	89 50 2c             	mov    %edx,0x2c(%eax)
  1022f1:	90                   	nop
  1022f2:	90                   	nop
  1022f3:	c9                   	leave  
  1022f4:	c3                   	ret    

001022f5 <GProtectFaultHandle>:
  1022f5:	55                   	push   %ebp
  1022f6:	89 e5                	mov    %esp,%ebp
  1022f8:	83 ec 08             	sub    $0x8,%esp
  1022fb:	83 ec 0c             	sub    $0xc,%esp
  1022fe:	68 fb 2d 10 00       	push   $0x102dfb
  102303:	e8 d0 06 00 00       	call   1029d8 <printk>
  102308:	83 c4 10             	add    $0x10,%esp
  10230b:	8b 45 08             	mov    0x8(%ebp),%eax
  10230e:	8b 40 30             	mov    0x30(%eax),%eax
  102311:	83 ec 0c             	sub    $0xc,%esp
  102314:	50                   	push   %eax
  102315:	68 58 2e 10 00       	push   $0x102e58
  10231a:	6a 77                	push   $0x77
  10231c:	68 e8 2d 10 00       	push   $0x102de8
  102321:	68 2f 2e 10 00       	push   $0x102e2f
  102326:	e8 ad 06 00 00       	call   1029d8 <printk>
  10232b:	83 c4 20             	add    $0x20,%esp
  10232e:	83 ec 0c             	sub    $0xc,%esp
  102331:	68 29 2e 10 00       	push   $0x102e29
  102336:	e8 9d 06 00 00       	call   1029d8 <printk>
  10233b:	83 c4 10             	add    $0x10,%esp
  10233e:	83 ec 08             	sub    $0x8,%esp
  102341:	6a 78                	push   $0x78
  102343:	68 e8 2d 10 00       	push   $0x102de8
  102348:	e8 47 09 00 00       	call   102c94 <abort>
  10234d:	83 c4 10             	add    $0x10,%esp
  102350:	90                   	nop
  102351:	c9                   	leave  
  102352:	c3                   	ret    

00102353 <timeHandle>:
  102353:	55                   	push   %ebp
  102354:	89 e5                	mov    %esp,%ebp
  102356:	83 ec 18             	sub    $0x18,%esp
  102359:	8b 15 00 55 10 00    	mov    0x105500,%edx
  10235f:	8b 0d 00 55 10 00    	mov    0x105500,%ecx
  102365:	89 c8                	mov    %ecx,%eax
  102367:	c1 e0 07             	shl    $0x7,%eax
  10236a:	01 c8                	add    %ecx,%eax
  10236c:	01 c0                	add    %eax,%eax
  10236e:	01 c8                	add    %ecx,%eax
  102370:	01 c0                	add    %eax,%eax
  102372:	01 c8                	add    %ecx,%eax
  102374:	c1 e0 04             	shl    $0x4,%eax
  102377:	05 70 75 10 00       	add    $0x107570,%eax
  10237c:	8b 00                	mov    (%eax),%eax
  10237e:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102381:	89 d0                	mov    %edx,%eax
  102383:	c1 e0 07             	shl    $0x7,%eax
  102386:	01 d0                	add    %edx,%eax
  102388:	01 c0                	add    %eax,%eax
  10238a:	01 d0                	add    %edx,%eax
  10238c:	01 c0                	add    %eax,%eax
  10238e:	01 d0                	add    %edx,%eax
  102390:	c1 e0 04             	shl    $0x4,%eax
  102393:	05 70 75 10 00       	add    $0x107570,%eax
  102398:	89 08                	mov    %ecx,(%eax)
  10239a:	e8 db f7 ff ff       	call   101b7a <block_decrease>
  10239f:	e8 53 f2 ff ff       	call   1015f7 <check_block>
  1023a4:	8b 15 00 55 10 00    	mov    0x105500,%edx
  1023aa:	89 d0                	mov    %edx,%eax
  1023ac:	c1 e0 07             	shl    $0x7,%eax
  1023af:	01 d0                	add    %edx,%eax
  1023b1:	01 c0                	add    %eax,%eax
  1023b3:	01 d0                	add    %edx,%eax
  1023b5:	01 c0                	add    %eax,%eax
  1023b7:	01 d0                	add    %edx,%eax
  1023b9:	c1 e0 04             	shl    $0x4,%eax
  1023bc:	05 70 75 10 00       	add    $0x107570,%eax
  1023c1:	8b 00                	mov    (%eax),%eax
  1023c3:	85 c0                	test   %eax,%eax
  1023c5:	7f 2d                	jg     1023f4 <timeHandle+0xa1>
  1023c7:	a1 00 55 10 00       	mov    0x105500,%eax
  1023cc:	83 ec 08             	sub    $0x8,%esp
  1023cf:	ff 75 08             	pushl  0x8(%ebp)
  1023d2:	50                   	push   %eax
  1023d3:	e8 8f f1 ff ff       	call   101567 <put_into_runnable>
  1023d8:	83 c4 10             	add    $0x10,%esp
  1023db:	e8 67 f1 ff ff       	call   101547 <get_from_runnable>
  1023e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1023e3:	83 ec 08             	sub    $0x8,%esp
  1023e6:	ff 75 08             	pushl  0x8(%ebp)
  1023e9:	ff 75 f4             	pushl  -0xc(%ebp)
  1023ec:	e8 a3 f0 ff ff       	call   101494 <put_into_running>
  1023f1:	83 c4 10             	add    $0x10,%esp
  1023f4:	e8 30 f1 ff ff       	call   101529 <getpid>
  1023f9:	85 c0                	test   %eax,%eax
  1023fb:	75 12                	jne    10240f <timeHandle+0xbc>
  1023fd:	83 ec 0c             	sub    $0xc,%esp
  102400:	68 45 2e 10 00       	push   $0x102e45
  102405:	e8 ce 05 00 00       	call   1029d8 <printk>
  10240a:	83 c4 10             	add    $0x10,%esp
  10240d:	eb 16                	jmp    102425 <timeHandle+0xd2>
  10240f:	e8 15 f1 ff ff       	call   101529 <getpid>
  102414:	83 ec 08             	sub    $0x8,%esp
  102417:	50                   	push   %eax
  102418:	68 47 2e 10 00       	push   $0x102e47
  10241d:	e8 b6 05 00 00       	call   1029d8 <printk>
  102422:	83 c4 10             	add    $0x10,%esp
  102425:	90                   	nop
  102426:	c9                   	leave  
  102427:	c3                   	ret    

00102428 <W>:
  102428:	55                   	push   %ebp
  102429:	89 e5                	mov    %esp,%ebp
  10242b:	83 ec 18             	sub    $0x18,%esp
  10242e:	e8 f6 f0 ff ff       	call   101529 <getpid>
  102433:	89 c2                	mov    %eax,%edx
  102435:	8b 45 08             	mov    0x8(%ebp),%eax
  102438:	8b 48 04             	mov    0x4(%eax),%ecx
  10243b:	89 d0                	mov    %edx,%eax
  10243d:	c1 e0 07             	shl    $0x7,%eax
  102440:	01 d0                	add    %edx,%eax
  102442:	01 c0                	add    %eax,%eax
  102444:	01 d0                	add    %edx,%eax
  102446:	01 c0                	add    %eax,%eax
  102448:	01 d0                	add    %edx,%eax
  10244a:	c1 e0 04             	shl    $0x4,%eax
  10244d:	05 88 75 10 00       	add    $0x107588,%eax
  102452:	89 08                	mov    %ecx,(%eax)
  102454:	e8 d0 f0 ff ff       	call   101529 <getpid>
  102459:	89 c2                	mov    %eax,%edx
  10245b:	89 d0                	mov    %edx,%eax
  10245d:	c1 e0 07             	shl    $0x7,%eax
  102460:	01 d0                	add    %edx,%eax
  102462:	01 c0                	add    %eax,%eax
  102464:	01 d0                	add    %edx,%eax
  102466:	01 c0                	add    %eax,%eax
  102468:	01 d0                	add    %edx,%eax
  10246a:	c1 e0 04             	shl    $0x4,%eax
  10246d:	8d 90 20 55 10 00    	lea    0x105520(%eax),%edx
  102473:	8b 45 08             	mov    0x8(%ebp),%eax
  102476:	89 50 04             	mov    %edx,0x4(%eax)
  102479:	e8 c9 f0 ff ff       	call   101547 <get_from_runnable>
  10247e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102481:	e8 a3 f0 ff ff       	call   101529 <getpid>
  102486:	83 f8 02             	cmp    $0x2,%eax
  102489:	74 12                	je     10249d <W+0x75>
  10248b:	83 ec 08             	sub    $0x8,%esp
  10248e:	6a 0e                	push   $0xe
  102490:	68 6c 2e 10 00       	push   $0x102e6c
  102495:	e8 fa 07 00 00       	call   102c94 <abort>
  10249a:	83 c4 10             	add    $0x10,%esp
  10249d:	83 ec 08             	sub    $0x8,%esp
  1024a0:	6a 00                	push   $0x0
  1024a2:	ff 75 f4             	pushl  -0xc(%ebp)
  1024a5:	e8 ea ef ff ff       	call   101494 <put_into_running>
  1024aa:	83 c4 10             	add    $0x10,%esp
  1024ad:	90                   	nop
  1024ae:	c9                   	leave  
  1024af:	c3                   	ret    

001024b0 <R>:
  1024b0:	55                   	push   %ebp
  1024b1:	89 e5                	mov    %esp,%ebp
  1024b3:	83 ec 18             	sub    $0x18,%esp
  1024b6:	8b 45 08             	mov    0x8(%ebp),%eax
  1024b9:	8b 40 04             	mov    0x4(%eax),%eax
  1024bc:	8b 80 58 20 00 00    	mov    0x2058(%eax),%eax
  1024c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1024c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1024c8:	8b 40 04             	mov    0x4(%eax),%eax
  1024cb:	8b 90 68 20 00 00    	mov    0x2068(%eax),%edx
  1024d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1024d4:	89 50 04             	mov    %edx,0x4(%eax)
  1024d7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1024da:	89 d0                	mov    %edx,%eax
  1024dc:	c1 e0 07             	shl    $0x7,%eax
  1024df:	01 d0                	add    %edx,%eax
  1024e1:	01 c0                	add    %eax,%eax
  1024e3:	01 d0                	add    %edx,%eax
  1024e5:	01 c0                	add    %eax,%eax
  1024e7:	01 d0                	add    %edx,%eax
  1024e9:	c1 e0 04             	shl    $0x4,%eax
  1024ec:	05 00 20 00 00       	add    $0x2000,%eax
  1024f1:	05 20 55 10 00       	add    $0x105520,%eax
  1024f6:	83 ec 08             	sub    $0x8,%esp
  1024f9:	50                   	push   %eax
  1024fa:	ff 75 f4             	pushl  -0xc(%ebp)
  1024fd:	e8 65 f0 ff ff       	call   101567 <put_into_runnable>
  102502:	83 c4 10             	add    $0x10,%esp
  102505:	e8 1f f0 ff ff       	call   101529 <getpid>
  10250a:	83 f8 01             	cmp    $0x1,%eax
  10250d:	74 12                	je     102521 <R+0x71>
  10250f:	83 ec 08             	sub    $0x8,%esp
  102512:	6a 18                	push   $0x18
  102514:	68 6c 2e 10 00       	push   $0x102e6c
  102519:	e8 76 07 00 00       	call   102c94 <abort>
  10251e:	83 c4 10             	add    $0x10,%esp
  102521:	90                   	nop
  102522:	c9                   	leave  
  102523:	c3                   	ret    

00102524 <P>:
  102524:	55                   	push   %ebp
  102525:	89 e5                	mov    %esp,%ebp
  102527:	83 ec 08             	sub    $0x8,%esp
  10252a:	8b 45 08             	mov    0x8(%ebp),%eax
  10252d:	8b 00                	mov    (%eax),%eax
  10252f:	8d 50 ff             	lea    -0x1(%eax),%edx
  102532:	8b 45 08             	mov    0x8(%ebp),%eax
  102535:	89 10                	mov    %edx,(%eax)
  102537:	8b 45 08             	mov    0x8(%ebp),%eax
  10253a:	8b 00                	mov    (%eax),%eax
  10253c:	85 c0                	test   %eax,%eax
  10253e:	79 0e                	jns    10254e <P+0x2a>
  102540:	83 ec 0c             	sub    $0xc,%esp
  102543:	ff 75 08             	pushl  0x8(%ebp)
  102546:	e8 dd fe ff ff       	call   102428 <W>
  10254b:	83 c4 10             	add    $0x10,%esp
  10254e:	90                   	nop
  10254f:	c9                   	leave  
  102550:	c3                   	ret    

00102551 <V>:
  102551:	55                   	push   %ebp
  102552:	89 e5                	mov    %esp,%ebp
  102554:	83 ec 08             	sub    $0x8,%esp
  102557:	8b 45 08             	mov    0x8(%ebp),%eax
  10255a:	8b 00                	mov    (%eax),%eax
  10255c:	8d 50 01             	lea    0x1(%eax),%edx
  10255f:	8b 45 08             	mov    0x8(%ebp),%eax
  102562:	89 10                	mov    %edx,(%eax)
  102564:	8b 45 08             	mov    0x8(%ebp),%eax
  102567:	8b 00                	mov    (%eax),%eax
  102569:	85 c0                	test   %eax,%eax
  10256b:	7f 0e                	jg     10257b <V+0x2a>
  10256d:	83 ec 0c             	sub    $0xc,%esp
  102570:	ff 75 08             	pushl  0x8(%ebp)
  102573:	e8 38 ff ff ff       	call   1024b0 <R>
  102578:	83 c4 10             	add    $0x10,%esp
  10257b:	90                   	nop
  10257c:	c9                   	leave  
  10257d:	c3                   	ret    

0010257e <sys_sem_init>:
  10257e:	55                   	push   %ebp
  10257f:	89 e5                	mov    %esp,%ebp
  102581:	53                   	push   %ebx
  102582:	83 ec 14             	sub    $0x14,%esp
  102585:	8b 45 08             	mov    0x8(%ebp),%eax
  102588:	8b 58 20             	mov    0x20(%eax),%ebx
  10258b:	e8 99 ef ff ff       	call   101529 <getpid>
  102590:	c1 e0 10             	shl    $0x10,%eax
  102593:	01 d8                	add    %ebx,%eax
  102595:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102598:	a1 84 4c 10 00       	mov    0x104c84,%eax
  10259d:	25 1f 00 00 80       	and    $0x8000001f,%eax
  1025a2:	85 c0                	test   %eax,%eax
  1025a4:	79 05                	jns    1025ab <sys_sem_init+0x2d>
  1025a6:	48                   	dec    %eax
  1025a7:	83 c8 e0             	or     $0xffffffe0,%eax
  1025aa:	40                   	inc    %eax
  1025ab:	89 c2                	mov    %eax,%edx
  1025ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1025b0:	89 10                	mov    %edx,(%eax)
  1025b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1025b5:	8b 00                	mov    (%eax),%eax
  1025b7:	8b 55 08             	mov    0x8(%ebp),%edx
  1025ba:	8b 52 28             	mov    0x28(%edx),%edx
  1025bd:	89 14 c5 00 de 13 01 	mov    %edx,0x113de00(,%eax,8)
  1025c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1025c7:	8b 00                	mov    (%eax),%eax
  1025c9:	c7 04 c5 04 de 13 01 	movl   $0x0,0x113de04(,%eax,8)
  1025d0:	00 00 00 00 
  1025d4:	a1 84 4c 10 00       	mov    0x104c84,%eax
  1025d9:	40                   	inc    %eax
  1025da:	a3 84 4c 10 00       	mov    %eax,0x104c84
  1025df:	b8 01 00 00 00       	mov    $0x1,%eax
  1025e4:	83 c4 14             	add    $0x14,%esp
  1025e7:	5b                   	pop    %ebx
  1025e8:	5d                   	pop    %ebp
  1025e9:	c3                   	ret    

001025ea <sys_sem_post>:
  1025ea:	55                   	push   %ebp
  1025eb:	89 e5                	mov    %esp,%ebp
  1025ed:	53                   	push   %ebx
  1025ee:	83 ec 14             	sub    $0x14,%esp
  1025f1:	8b 45 08             	mov    0x8(%ebp),%eax
  1025f4:	8b 58 20             	mov    0x20(%eax),%ebx
  1025f7:	e8 2d ef ff ff       	call   101529 <getpid>
  1025fc:	c1 e0 10             	shl    $0x10,%eax
  1025ff:	01 d8                	add    %ebx,%eax
  102601:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102604:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102607:	8b 00                	mov    (%eax),%eax
  102609:	c1 e0 03             	shl    $0x3,%eax
  10260c:	05 00 de 13 01       	add    $0x113de00,%eax
  102611:	83 ec 0c             	sub    $0xc,%esp
  102614:	50                   	push   %eax
  102615:	e8 37 ff ff ff       	call   102551 <V>
  10261a:	83 c4 10             	add    $0x10,%esp
  10261d:	b8 01 00 00 00       	mov    $0x1,%eax
  102622:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102625:	c9                   	leave  
  102626:	c3                   	ret    

00102627 <sys_sem_wait>:
  102627:	55                   	push   %ebp
  102628:	89 e5                	mov    %esp,%ebp
  10262a:	53                   	push   %ebx
  10262b:	83 ec 14             	sub    $0x14,%esp
  10262e:	8b 45 08             	mov    0x8(%ebp),%eax
  102631:	8b 58 20             	mov    0x20(%eax),%ebx
  102634:	e8 f0 ee ff ff       	call   101529 <getpid>
  102639:	c1 e0 10             	shl    $0x10,%eax
  10263c:	01 d8                	add    %ebx,%eax
  10263e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102641:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102644:	8b 00                	mov    (%eax),%eax
  102646:	c1 e0 03             	shl    $0x3,%eax
  102649:	05 00 de 13 01       	add    $0x113de00,%eax
  10264e:	83 ec 0c             	sub    $0xc,%esp
  102651:	50                   	push   %eax
  102652:	e8 cd fe ff ff       	call   102524 <P>
  102657:	83 c4 10             	add    $0x10,%esp
  10265a:	b8 01 00 00 00       	mov    $0x1,%eax
  10265f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102662:	c9                   	leave  
  102663:	c3                   	ret    

00102664 <sys_sem_destroy>:
  102664:	55                   	push   %ebp
  102665:	89 e5                	mov    %esp,%ebp
  102667:	b8 01 00 00 00       	mov    $0x1,%eax
  10266c:	5d                   	pop    %ebp
  10266d:	c3                   	ret    

0010266e <inByte>:
  10266e:	55                   	push   %ebp
  10266f:	89 e5                	mov    %esp,%ebp
  102671:	83 ec 14             	sub    $0x14,%esp
  102674:	8b 45 08             	mov    0x8(%ebp),%eax
  102677:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  10267b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10267e:	89 c2                	mov    %eax,%edx
  102680:	ec                   	in     (%dx),%al
  102681:	88 45 ff             	mov    %al,-0x1(%ebp)
  102684:	8a 45 ff             	mov    -0x1(%ebp),%al
  102687:	c9                   	leave  
  102688:	c3                   	ret    

00102689 <outByte>:
  102689:	55                   	push   %ebp
  10268a:	89 e5                	mov    %esp,%ebp
  10268c:	83 ec 08             	sub    $0x8,%esp
  10268f:	8b 45 08             	mov    0x8(%ebp),%eax
  102692:	8b 55 0c             	mov    0xc(%ebp),%edx
  102695:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  102699:	88 55 f8             	mov    %dl,-0x8(%ebp)
  10269c:	8a 45 f8             	mov    -0x8(%ebp),%al
  10269f:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1026a2:	ee                   	out    %al,(%dx)
  1026a3:	90                   	nop
  1026a4:	c9                   	leave  
  1026a5:	c3                   	ret    

001026a6 <initIntr>:
  1026a6:	55                   	push   %ebp
  1026a7:	89 e5                	mov    %esp,%ebp
  1026a9:	6a ff                	push   $0xffffffff
  1026ab:	6a 21                	push   $0x21
  1026ad:	e8 d7 ff ff ff       	call   102689 <outByte>
  1026b2:	83 c4 08             	add    $0x8,%esp
  1026b5:	6a ff                	push   $0xffffffff
  1026b7:	68 a1 00 00 00       	push   $0xa1
  1026bc:	e8 c8 ff ff ff       	call   102689 <outByte>
  1026c1:	83 c4 08             	add    $0x8,%esp
  1026c4:	6a 11                	push   $0x11
  1026c6:	6a 20                	push   $0x20
  1026c8:	e8 bc ff ff ff       	call   102689 <outByte>
  1026cd:	83 c4 08             	add    $0x8,%esp
  1026d0:	6a 20                	push   $0x20
  1026d2:	6a 21                	push   $0x21
  1026d4:	e8 b0 ff ff ff       	call   102689 <outByte>
  1026d9:	83 c4 08             	add    $0x8,%esp
  1026dc:	6a 04                	push   $0x4
  1026de:	6a 21                	push   $0x21
  1026e0:	e8 a4 ff ff ff       	call   102689 <outByte>
  1026e5:	83 c4 08             	add    $0x8,%esp
  1026e8:	6a 03                	push   $0x3
  1026ea:	6a 21                	push   $0x21
  1026ec:	e8 98 ff ff ff       	call   102689 <outByte>
  1026f1:	83 c4 08             	add    $0x8,%esp
  1026f4:	6a 11                	push   $0x11
  1026f6:	68 a0 00 00 00       	push   $0xa0
  1026fb:	e8 89 ff ff ff       	call   102689 <outByte>
  102700:	83 c4 08             	add    $0x8,%esp
  102703:	6a 28                	push   $0x28
  102705:	68 a1 00 00 00       	push   $0xa1
  10270a:	e8 7a ff ff ff       	call   102689 <outByte>
  10270f:	83 c4 08             	add    $0x8,%esp
  102712:	6a 02                	push   $0x2
  102714:	68 a1 00 00 00       	push   $0xa1
  102719:	e8 6b ff ff ff       	call   102689 <outByte>
  10271e:	83 c4 08             	add    $0x8,%esp
  102721:	6a 03                	push   $0x3
  102723:	68 a1 00 00 00       	push   $0xa1
  102728:	e8 5c ff ff ff       	call   102689 <outByte>
  10272d:	83 c4 08             	add    $0x8,%esp
  102730:	6a 68                	push   $0x68
  102732:	6a 20                	push   $0x20
  102734:	e8 50 ff ff ff       	call   102689 <outByte>
  102739:	83 c4 08             	add    $0x8,%esp
  10273c:	6a 0a                	push   $0xa
  10273e:	6a 20                	push   $0x20
  102740:	e8 44 ff ff ff       	call   102689 <outByte>
  102745:	83 c4 08             	add    $0x8,%esp
  102748:	6a 68                	push   $0x68
  10274a:	68 a0 00 00 00       	push   $0xa0
  10274f:	e8 35 ff ff ff       	call   102689 <outByte>
  102754:	83 c4 08             	add    $0x8,%esp
  102757:	6a 0a                	push   $0xa
  102759:	68 a0 00 00 00       	push   $0xa0
  10275e:	e8 26 ff ff ff       	call   102689 <outByte>
  102763:	83 c4 08             	add    $0x8,%esp
  102766:	90                   	nop
  102767:	c9                   	leave  
  102768:	c3                   	ret    

00102769 <initTimer>:
  102769:	55                   	push   %ebp
  10276a:	89 e5                	mov    %esp,%ebp
  10276c:	83 ec 10             	sub    $0x10,%esp
  10276f:	c7 45 fc 9b 2e 00 00 	movl   $0x2e9b,-0x4(%ebp)
  102776:	6a 34                	push   $0x34
  102778:	6a 43                	push   $0x43
  10277a:	e8 0a ff ff ff       	call   102689 <outByte>
  10277f:	83 c4 08             	add    $0x8,%esp
  102782:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102785:	25 ff 00 00 80       	and    $0x800000ff,%eax
  10278a:	85 c0                	test   %eax,%eax
  10278c:	79 07                	jns    102795 <initTimer+0x2c>
  10278e:	48                   	dec    %eax
  10278f:	0d 00 ff ff ff       	or     $0xffffff00,%eax
  102794:	40                   	inc    %eax
  102795:	0f be c0             	movsbl %al,%eax
  102798:	50                   	push   %eax
  102799:	6a 40                	push   $0x40
  10279b:	e8 e9 fe ff ff       	call   102689 <outByte>
  1027a0:	83 c4 08             	add    $0x8,%esp
  1027a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1027a6:	85 c0                	test   %eax,%eax
  1027a8:	79 05                	jns    1027af <initTimer+0x46>
  1027aa:	05 ff 00 00 00       	add    $0xff,%eax
  1027af:	c1 f8 08             	sar    $0x8,%eax
  1027b2:	0f be c0             	movsbl %al,%eax
  1027b5:	50                   	push   %eax
  1027b6:	6a 40                	push   $0x40
  1027b8:	e8 cc fe ff ff       	call   102689 <outByte>
  1027bd:	83 c4 08             	add    $0x8,%esp
  1027c0:	90                   	nop
  1027c1:	c9                   	leave  
  1027c2:	c3                   	ret    

001027c3 <getKeyCode>:
  1027c3:	55                   	push   %ebp
  1027c4:	89 e5                	mov    %esp,%ebp
  1027c6:	83 ec 10             	sub    $0x10,%esp
  1027c9:	6a 60                	push   $0x60
  1027cb:	e8 9e fe ff ff       	call   10266e <inByte>
  1027d0:	83 c4 04             	add    $0x4,%esp
  1027d3:	0f b6 c0             	movzbl %al,%eax
  1027d6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1027d9:	6a 61                	push   $0x61
  1027db:	e8 8e fe ff ff       	call   10266e <inByte>
  1027e0:	83 c4 04             	add    $0x4,%esp
  1027e3:	0f b6 c0             	movzbl %al,%eax
  1027e6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1027e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1027ec:	83 c8 80             	or     $0xffffff80,%eax
  1027ef:	0f be c0             	movsbl %al,%eax
  1027f2:	50                   	push   %eax
  1027f3:	6a 61                	push   $0x61
  1027f5:	e8 8f fe ff ff       	call   102689 <outByte>
  1027fa:	83 c4 08             	add    $0x8,%esp
  1027fd:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102800:	0f be c0             	movsbl %al,%eax
  102803:	50                   	push   %eax
  102804:	6a 61                	push   $0x61
  102806:	e8 7e fe ff ff       	call   102689 <outByte>
  10280b:	83 c4 08             	add    $0x8,%esp
  10280e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102811:	c9                   	leave  
  102812:	c3                   	ret    

00102813 <i2A>:
  102813:	55                   	push   %ebp
  102814:	89 e5                	mov    %esp,%ebp
  102816:	83 ec 10             	sub    $0x10,%esp
  102819:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  102820:	c7 45 f8 be 54 10 00 	movl   $0x1054be,-0x8(%ebp)
  102827:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
  10282b:	c6 45 f6 00          	movb   $0x0,-0xa(%ebp)
  10282f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102833:	79 17                	jns    10284c <i2A+0x39>
  102835:	81 7d 08 00 00 00 80 	cmpl   $0x80000000,0x8(%ebp)
  10283c:	75 07                	jne    102845 <i2A+0x32>
  10283e:	ff 45 08             	incl   0x8(%ebp)
  102841:	c6 45 f6 01          	movb   $0x1,-0xa(%ebp)
  102845:	c6 45 f7 01          	movb   $0x1,-0x9(%ebp)
  102849:	f7 5d 08             	negl   0x8(%ebp)
  10284c:	ff 4d f8             	decl   -0x8(%ebp)
  10284f:	8b 45 08             	mov    0x8(%ebp),%eax
  102852:	b9 0a 00 00 00       	mov    $0xa,%ecx
  102857:	99                   	cltd   
  102858:	f7 f9                	idiv   %ecx
  10285a:	89 d0                	mov    %edx,%eax
  10285c:	83 c0 30             	add    $0x30,%eax
  10285f:	88 c2                	mov    %al,%dl
  102861:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102864:	88 10                	mov    %dl,(%eax)
  102866:	ff 45 fc             	incl   -0x4(%ebp)
  102869:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10286c:	b8 67 66 66 66       	mov    $0x66666667,%eax
  102871:	f7 e9                	imul   %ecx
  102873:	c1 fa 02             	sar    $0x2,%edx
  102876:	89 c8                	mov    %ecx,%eax
  102878:	c1 f8 1f             	sar    $0x1f,%eax
  10287b:	29 c2                	sub    %eax,%edx
  10287d:	89 d0                	mov    %edx,%eax
  10287f:	89 45 08             	mov    %eax,0x8(%ebp)
  102882:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102886:	75 c4                	jne    10284c <i2A+0x39>
  102888:	80 7d f7 01          	cmpb   $0x1,-0x9(%ebp)
  10288c:	75 0c                	jne    10289a <i2A+0x87>
  10288e:	ff 4d f8             	decl   -0x8(%ebp)
  102891:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102894:	c6 00 2d             	movb   $0x2d,(%eax)
  102897:	ff 45 fc             	incl   -0x4(%ebp)
  10289a:	80 7d f6 01          	cmpb   $0x1,-0xa(%ebp)
  10289e:	75 0b                	jne    1028ab <i2A+0x98>
  1028a0:	a0 bd 54 10 00       	mov    0x1054bd,%al
  1028a5:	40                   	inc    %eax
  1028a6:	a2 bd 54 10 00       	mov    %al,0x1054bd
  1028ab:	c6 05 be 54 10 00 00 	movb   $0x0,0x1054be
  1028b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1028b5:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1028b8:	89 10                	mov    %edx,(%eax)
  1028ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1028bd:	c9                   	leave  
  1028be:	c3                   	ret    

001028bf <append>:
  1028bf:	55                   	push   %ebp
  1028c0:	89 e5                	mov    %esp,%ebp
  1028c2:	83 ec 10             	sub    $0x10,%esp
  1028c5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1028cc:	eb 19                	jmp    1028e7 <append+0x28>
  1028ce:	ff 45 fc             	incl   -0x4(%ebp)
  1028d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1028d4:	8d 50 01             	lea    0x1(%eax),%edx
  1028d7:	89 55 08             	mov    %edx,0x8(%ebp)
  1028da:	8b 55 0c             	mov    0xc(%ebp),%edx
  1028dd:	8d 4a 01             	lea    0x1(%edx),%ecx
  1028e0:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  1028e3:	8a 12                	mov    (%edx),%dl
  1028e5:	88 10                	mov    %dl,(%eax)
  1028e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1028ea:	8a 00                	mov    (%eax),%al
  1028ec:	84 c0                	test   %al,%al
  1028ee:	75 de                	jne    1028ce <append+0xf>
  1028f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1028f3:	c9                   	leave  
  1028f4:	c3                   	ret    

001028f5 <i2X>:
  1028f5:	55                   	push   %ebp
  1028f6:	89 e5                	mov    %esp,%ebp
  1028f8:	83 ec 10             	sub    $0x10,%esp
  1028fb:	c7 45 fc de 54 10 00 	movl   $0x1054de,-0x4(%ebp)
  102902:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  102909:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102910:	ff 45 f8             	incl   -0x8(%ebp)
  102913:	8b 45 08             	mov    0x8(%ebp),%eax
  102916:	83 e0 0f             	and    $0xf,%eax
  102919:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10291c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10291f:	83 e8 0a             	sub    $0xa,%eax
  102922:	83 f8 05             	cmp    $0x5,%eax
  102925:	77 4b                	ja     102972 <i2X+0x7d>
  102927:	8b 04 85 80 2e 10 00 	mov    0x102e80(,%eax,4),%eax
  10292e:	ff e0                	jmp    *%eax
  102930:	ff 4d fc             	decl   -0x4(%ebp)
  102933:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102936:	c6 00 61             	movb   $0x61,(%eax)
  102939:	eb 47                	jmp    102982 <i2X+0x8d>
  10293b:	ff 4d fc             	decl   -0x4(%ebp)
  10293e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102941:	c6 00 62             	movb   $0x62,(%eax)
  102944:	eb 3c                	jmp    102982 <i2X+0x8d>
  102946:	ff 4d fc             	decl   -0x4(%ebp)
  102949:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10294c:	c6 00 63             	movb   $0x63,(%eax)
  10294f:	eb 31                	jmp    102982 <i2X+0x8d>
  102951:	ff 4d fc             	decl   -0x4(%ebp)
  102954:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102957:	c6 00 64             	movb   $0x64,(%eax)
  10295a:	eb 26                	jmp    102982 <i2X+0x8d>
  10295c:	ff 4d fc             	decl   -0x4(%ebp)
  10295f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102962:	c6 00 65             	movb   $0x65,(%eax)
  102965:	eb 1b                	jmp    102982 <i2X+0x8d>
  102967:	ff 4d fc             	decl   -0x4(%ebp)
  10296a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10296d:	c6 00 66             	movb   $0x66,(%eax)
  102970:	eb 10                	jmp    102982 <i2X+0x8d>
  102972:	ff 4d fc             	decl   -0x4(%ebp)
  102975:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102978:	83 c0 30             	add    $0x30,%eax
  10297b:	88 c2                	mov    %al,%dl
  10297d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102980:	88 10                	mov    %dl,(%eax)
  102982:	8b 45 08             	mov    0x8(%ebp),%eax
  102985:	c1 e8 04             	shr    $0x4,%eax
  102988:	89 45 08             	mov    %eax,0x8(%ebp)
  10298b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  10298f:	0f 85 7b ff ff ff    	jne    102910 <i2X+0x1b>
  102995:	c6 05 de 54 10 00 00 	movb   $0x0,0x1054de
  10299c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10299f:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1029a2:	89 10                	mov    %edx,(%eax)
  1029a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1029a7:	c9                   	leave  
  1029a8:	c3                   	ret    

001029a9 <printk_char>:
  1029a9:	55                   	push   %ebp
  1029aa:	89 e5                	mov    %esp,%ebp
  1029ac:	83 ec 08             	sub    $0x8,%esp
  1029af:	eb 17                	jmp    1029c8 <printk_char+0x1f>
  1029b1:	8b 45 08             	mov    0x8(%ebp),%eax
  1029b4:	8a 00                	mov    (%eax),%al
  1029b6:	0f be c0             	movsbl %al,%eax
  1029b9:	83 ec 0c             	sub    $0xc,%esp
  1029bc:	50                   	push   %eax
  1029bd:	e8 95 ea ff ff       	call   101457 <putChar>
  1029c2:	83 c4 10             	add    $0x10,%esp
  1029c5:	ff 45 08             	incl   0x8(%ebp)
  1029c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1029cb:	8a 00                	mov    (%eax),%al
  1029cd:	84 c0                	test   %al,%al
  1029cf:	75 e0                	jne    1029b1 <printk_char+0x8>
  1029d1:	b8 01 00 00 00       	mov    $0x1,%eax
  1029d6:	c9                   	leave  
  1029d7:	c3                   	ret    

001029d8 <printk>:
  1029d8:	55                   	push   %ebp
  1029d9:	89 e5                	mov    %esp,%ebp
  1029db:	83 ec 28             	sub    $0x28,%esp
  1029de:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1029e5:	8d 45 0c             	lea    0xc(%ebp),%eax
  1029e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1029eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1029ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1029f1:	c7 45 e8 58 00 00 00 	movl   $0x58,-0x18(%ebp)
  1029f8:	e9 57 01 00 00       	jmp    102b54 <printk+0x17c>
  1029fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102a00:	8a 00                	mov    (%eax),%al
  102a02:	3c 25                	cmp    $0x25,%al
  102a04:	75 56                	jne    102a5c <printk+0x84>
  102a06:	ff 45 ec             	incl   -0x14(%ebp)
  102a09:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102a0c:	8a 00                	mov    (%eax),%al
  102a0e:	0f be c0             	movsbl %al,%eax
  102a11:	83 f8 64             	cmp    $0x64,%eax
  102a14:	74 18                	je     102a2e <printk+0x56>
  102a16:	83 f8 64             	cmp    $0x64,%eax
  102a19:	7f 07                	jg     102a22 <printk+0x4a>
  102a1b:	83 f8 63             	cmp    $0x63,%eax
  102a1e:	74 29                	je     102a49 <printk+0x71>
  102a20:	eb 30                	jmp    102a52 <printk+0x7a>
  102a22:	83 f8 73             	cmp    $0x73,%eax
  102a25:	74 19                	je     102a40 <printk+0x68>
  102a27:	83 f8 78             	cmp    $0x78,%eax
  102a2a:	74 0b                	je     102a37 <printk+0x5f>
  102a2c:	eb 24                	jmp    102a52 <printk+0x7a>
  102a2e:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
  102a35:	eb 2c                	jmp    102a63 <printk+0x8b>
  102a37:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  102a3e:	eb 23                	jmp    102a63 <printk+0x8b>
  102a40:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  102a47:	eb 1a                	jmp    102a63 <printk+0x8b>
  102a49:	c7 45 e8 03 00 00 00 	movl   $0x3,-0x18(%ebp)
  102a50:	eb 11                	jmp    102a63 <printk+0x8b>
  102a52:	c7 45 e8 58 00 00 00 	movl   $0x58,-0x18(%ebp)
  102a59:	90                   	nop
  102a5a:	eb 07                	jmp    102a63 <printk+0x8b>
  102a5c:	c7 45 e8 58 00 00 00 	movl   $0x58,-0x18(%ebp)
  102a63:	83 7d e8 58          	cmpl   $0x58,-0x18(%ebp)
  102a67:	75 19                	jne    102a82 <printk+0xaa>
  102a69:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a6c:	8d 50 01             	lea    0x1(%eax),%edx
  102a6f:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102a72:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102a75:	8a 12                	mov    (%edx),%dl
  102a77:	88 90 a0 4c 10 00    	mov    %dl,0x104ca0(%eax)
  102a7d:	e9 cf 00 00 00       	jmp    102b51 <printk+0x179>
  102a82:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
  102a86:	75 3f                	jne    102ac7 <printk+0xef>
  102a88:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  102a8f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102a92:	8d 50 04             	lea    0x4(%eax),%edx
  102a95:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102a98:	8b 00                	mov    (%eax),%eax
  102a9a:	89 c2                	mov    %eax,%edx
  102a9c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  102a9f:	50                   	push   %eax
  102aa0:	52                   	push   %edx
  102aa1:	e8 6d fd ff ff       	call   102813 <i2A>
  102aa6:	83 c4 08             	add    $0x8,%esp
  102aa9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102aac:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102aaf:	81 c2 a0 4c 10 00    	add    $0x104ca0,%edx
  102ab5:	50                   	push   %eax
  102ab6:	52                   	push   %edx
  102ab7:	e8 03 fe ff ff       	call   1028bf <append>
  102abc:	83 c4 08             	add    $0x8,%esp
  102abf:	01 45 f4             	add    %eax,-0xc(%ebp)
  102ac2:	e9 8a 00 00 00       	jmp    102b51 <printk+0x179>
  102ac7:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
  102acb:	75 3a                	jne    102b07 <printk+0x12f>
  102acd:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  102ad4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ad7:	8d 50 04             	lea    0x4(%eax),%edx
  102ada:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102add:	8b 00                	mov    (%eax),%eax
  102adf:	8d 55 e0             	lea    -0x20(%ebp),%edx
  102ae2:	52                   	push   %edx
  102ae3:	50                   	push   %eax
  102ae4:	e8 0c fe ff ff       	call   1028f5 <i2X>
  102ae9:	83 c4 08             	add    $0x8,%esp
  102aec:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102aef:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102af2:	81 c2 a0 4c 10 00    	add    $0x104ca0,%edx
  102af8:	50                   	push   %eax
  102af9:	52                   	push   %edx
  102afa:	e8 c0 fd ff ff       	call   1028bf <append>
  102aff:	83 c4 08             	add    $0x8,%esp
  102b02:	01 45 f4             	add    %eax,-0xc(%ebp)
  102b05:	eb 4a                	jmp    102b51 <printk+0x179>
  102b07:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102b0b:	75 24                	jne    102b31 <printk+0x159>
  102b0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b10:	8d 50 04             	lea    0x4(%eax),%edx
  102b13:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102b16:	8b 00                	mov    (%eax),%eax
  102b18:	89 c2                	mov    %eax,%edx
  102b1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b1d:	05 a0 4c 10 00       	add    $0x104ca0,%eax
  102b22:	52                   	push   %edx
  102b23:	50                   	push   %eax
  102b24:	e8 96 fd ff ff       	call   1028bf <append>
  102b29:	83 c4 08             	add    $0x8,%esp
  102b2c:	01 45 f4             	add    %eax,-0xc(%ebp)
  102b2f:	eb 20                	jmp    102b51 <printk+0x179>
  102b31:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  102b35:	75 1a                	jne    102b51 <printk+0x179>
  102b37:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b3a:	8d 50 01             	lea    0x1(%eax),%edx
  102b3d:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102b40:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102b43:	8d 4a 04             	lea    0x4(%edx),%ecx
  102b46:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  102b49:	8b 12                	mov    (%edx),%edx
  102b4b:	88 90 a0 4c 10 00    	mov    %dl,0x104ca0(%eax)
  102b51:	ff 45 ec             	incl   -0x14(%ebp)
  102b54:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102b57:	8a 00                	mov    (%eax),%al
  102b59:	84 c0                	test   %al,%al
  102b5b:	0f 85 9c fe ff ff    	jne    1029fd <printk+0x25>
  102b61:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b64:	8d 50 01             	lea    0x1(%eax),%edx
  102b67:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102b6a:	c6 80 a0 4c 10 00 00 	movb   $0x0,0x104ca0(%eax)
  102b71:	83 ec 08             	sub    $0x8,%esp
  102b74:	68 00 04 00 00       	push   $0x400
  102b79:	68 a0 4c 10 00       	push   $0x104ca0
  102b7e:	e8 26 fe ff ff       	call   1029a9 <printk_char>
  102b83:	83 c4 10             	add    $0x10,%esp
  102b86:	90                   	nop
  102b87:	c9                   	leave  
  102b88:	c3                   	ret    

00102b89 <waitForInterrupt>:
  102b89:	55                   	push   %ebp
  102b8a:	89 e5                	mov    %esp,%ebp
  102b8c:	f4                   	hlt    
  102b8d:	90                   	nop
  102b8e:	5d                   	pop    %ebp
  102b8f:	c3                   	ret    

00102b90 <disableInterrupt>:
  102b90:	55                   	push   %ebp
  102b91:	89 e5                	mov    %esp,%ebp
  102b93:	fa                   	cli    
  102b94:	90                   	nop
  102b95:	5d                   	pop    %ebp
  102b96:	c3                   	ret    

00102b97 <i2A>:
  102b97:	55                   	push   %ebp
  102b98:	89 e5                	mov    %esp,%ebp
  102b9a:	83 ec 10             	sub    $0x10,%esp
  102b9d:	c7 45 fc fd 54 10 00 	movl   $0x1054fd,-0x4(%ebp)
  102ba4:	ff 4d fc             	decl   -0x4(%ebp)
  102ba7:	8b 45 08             	mov    0x8(%ebp),%eax
  102baa:	b9 0a 00 00 00       	mov    $0xa,%ecx
  102baf:	99                   	cltd   
  102bb0:	f7 f9                	idiv   %ecx
  102bb2:	89 d0                	mov    %edx,%eax
  102bb4:	83 c0 30             	add    $0x30,%eax
  102bb7:	88 c2                	mov    %al,%dl
  102bb9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102bbc:	88 10                	mov    %dl,(%eax)
  102bbe:	8b 4d 08             	mov    0x8(%ebp),%ecx
  102bc1:	b8 67 66 66 66       	mov    $0x66666667,%eax
  102bc6:	f7 e9                	imul   %ecx
  102bc8:	c1 fa 02             	sar    $0x2,%edx
  102bcb:	89 c8                	mov    %ecx,%eax
  102bcd:	c1 f8 1f             	sar    $0x1f,%eax
  102bd0:	29 c2                	sub    %eax,%edx
  102bd2:	89 d0                	mov    %edx,%eax
  102bd4:	89 45 08             	mov    %eax,0x8(%ebp)
  102bd7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102bdb:	75 c7                	jne    102ba4 <i2A+0xd>
  102bdd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102be0:	c9                   	leave  
  102be1:	c3                   	ret    

00102be2 <append>:
  102be2:	55                   	push   %ebp
  102be3:	89 e5                	mov    %esp,%ebp
  102be5:	eb 1a                	jmp    102c01 <append+0x1f>
  102be7:	8b 45 08             	mov    0x8(%ebp),%eax
  102bea:	8b 00                	mov    (%eax),%eax
  102bec:	8d 48 01             	lea    0x1(%eax),%ecx
  102bef:	8b 55 08             	mov    0x8(%ebp),%edx
  102bf2:	89 0a                	mov    %ecx,(%edx)
  102bf4:	8b 55 0c             	mov    0xc(%ebp),%edx
  102bf7:	8d 4a 01             	lea    0x1(%edx),%ecx
  102bfa:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  102bfd:	8a 12                	mov    (%edx),%dl
  102bff:	88 10                	mov    %dl,(%eax)
  102c01:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c04:	8a 00                	mov    (%eax),%al
  102c06:	84 c0                	test   %al,%al
  102c08:	75 dd                	jne    102be7 <append+0x5>
  102c0a:	90                   	nop
  102c0b:	5d                   	pop    %ebp
  102c0c:	c3                   	ret    

00102c0d <displayMessage>:
  102c0d:	55                   	push   %ebp
  102c0e:	89 e5                	mov    %esp,%ebp
  102c10:	83 ec 18             	sub    $0x18,%esp
  102c13:	b8 72 4b 10 00       	mov    $0x104b72,%eax
  102c18:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102c1b:	ff 75 08             	pushl  0x8(%ebp)
  102c1e:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102c21:	50                   	push   %eax
  102c22:	e8 bb ff ff ff       	call   102be2 <append>
  102c27:	83 c4 08             	add    $0x8,%esp
  102c2a:	68 98 2e 10 00       	push   $0x102e98
  102c2f:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102c32:	50                   	push   %eax
  102c33:	e8 aa ff ff ff       	call   102be2 <append>
  102c38:	83 c4 08             	add    $0x8,%esp
  102c3b:	ff 75 0c             	pushl  0xc(%ebp)
  102c3e:	e8 54 ff ff ff       	call   102b97 <i2A>
  102c43:	83 c4 04             	add    $0x4,%esp
  102c46:	50                   	push   %eax
  102c47:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102c4a:	50                   	push   %eax
  102c4b:	e8 92 ff ff ff       	call   102be2 <append>
  102c50:	83 c4 08             	add    $0x8,%esp
  102c53:	68 9a 2e 10 00       	push   $0x102e9a
  102c58:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102c5b:	50                   	push   %eax
  102c5c:	e8 81 ff ff ff       	call   102be2 <append>
  102c61:	83 c4 08             	add    $0x8,%esp
  102c64:	c7 45 f4 60 4b 10 00 	movl   $0x104b60,-0xc(%ebp)
  102c6b:	eb 1b                	jmp    102c88 <displayMessage+0x7b>
  102c6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c70:	8a 00                	mov    (%eax),%al
  102c72:	0f be c0             	movsbl %al,%eax
  102c75:	83 ec 0c             	sub    $0xc,%esp
  102c78:	50                   	push   %eax
  102c79:	e8 d9 e7 ff ff       	call   101457 <putChar>
  102c7e:	83 c4 10             	add    $0x10,%esp
  102c81:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c84:	40                   	inc    %eax
  102c85:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102c88:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c8b:	8a 00                	mov    (%eax),%al
  102c8d:	84 c0                	test   %al,%al
  102c8f:	75 dc                	jne    102c6d <displayMessage+0x60>
  102c91:	90                   	nop
  102c92:	c9                   	leave  
  102c93:	c3                   	ret    

00102c94 <abort>:
  102c94:	55                   	push   %ebp
  102c95:	89 e5                	mov    %esp,%ebp
  102c97:	83 ec 08             	sub    $0x8,%esp
  102c9a:	e8 f1 fe ff ff       	call   102b90 <disableInterrupt>
  102c9f:	83 ec 08             	sub    $0x8,%esp
  102ca2:	ff 75 0c             	pushl  0xc(%ebp)
  102ca5:	ff 75 08             	pushl  0x8(%ebp)
  102ca8:	e8 60 ff ff ff       	call   102c0d <displayMessage>
  102cad:	83 c4 10             	add    $0x10,%esp
  102cb0:	e8 d4 fe ff ff       	call   102b89 <waitForInterrupt>
  102cb5:	eb f9                	jmp    102cb0 <abort+0x1c>

00102cb7 <irqEmpty>:
  102cb7:	6a 00                	push   $0x0
  102cb9:	6a ff                	push   $0xffffffff
  102cbb:	eb 13                	jmp    102cd0 <asmDoIrq>

00102cbd <irqGProtectFault>:
  102cbd:	6a 0d                	push   $0xd
  102cbf:	eb 0f                	jmp    102cd0 <asmDoIrq>

00102cc1 <irqSyscall>:
  102cc1:	6a 00                	push   $0x0
  102cc3:	68 80 00 00 00       	push   $0x80
  102cc8:	eb 06                	jmp    102cd0 <asmDoIrq>

00102cca <irqTime>:
  102cca:	6a 00                	push   $0x0
  102ccc:	6a 20                	push   $0x20
  102cce:	eb 00                	jmp    102cd0 <asmDoIrq>

00102cd0 <asmDoIrq>:
  102cd0:	60                   	pusha  
  102cd1:	1e                   	push   %ds
  102cd2:	06                   	push   %es
  102cd3:	0f a0                	push   %fs
  102cd5:	0f a8                	push   %gs
  102cd7:	54                   	push   %esp
  102cd8:	e8 d5 f2 ff ff       	call   101fb2 <irqHandle>
  102cdd:	5c                   	pop    %esp
  102cde:	0f a9                	pop    %gs
  102ce0:	0f a1                	pop    %fs
  102ce2:	07                   	pop    %es
  102ce3:	1f                   	pop    %ds
  102ce4:	61                   	popa   
  102ce5:	83 c4 04             	add    $0x4,%esp
  102ce8:	83 c4 04             	add    $0x4,%esp
  102ceb:	cf                   	iret   
