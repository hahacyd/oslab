
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
  10000d:	e8 ef 27 00 00       	call   102801 <initTimer>
  100012:	e8 81 1c 00 00       	call   101c98 <init_pcb>
  100017:	e8 42 1d 00 00       	call   101d5e <init_kernel_pcb>
  10001c:	e8 3f 14 00 00       	call   101460 <initSerial>
  100021:	e8 80 1f 00 00       	call   101fa6 <initIdt>
  100026:	e8 13 27 00 00       	call   10273e <initIntr>
  10002b:	e8 12 05 00 00       	call   100542 <initSeg>
  100030:	e8 cb ff ff ff       	call   100000 <enableInterrupt>
  100035:	e8 d1 0a 00 00       	call   100b0b <loadUMain>
  10003a:	eb fe                	jmp    10003a <kEntry+0x33>

0010003c <setGdt>:
  10003c:	55                   	push   %ebp
  10003d:	89 e5                	mov    %esp,%ebp
  10003f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100042:	48                   	dec    %eax
  100043:	66 a3 20 4d 10 00    	mov    %ax,0x104d20
  100049:	8b 45 08             	mov    0x8(%ebp),%eax
  10004c:	66 a3 22 4d 10 00    	mov    %ax,0x104d22
  100052:	8b 45 08             	mov    0x8(%ebp),%eax
  100055:	c1 e8 10             	shr    $0x10,%eax
  100058:	66 a3 24 4d 10 00    	mov    %ax,0x104d24
  10005e:	b8 20 4d 10 00       	mov    $0x104d20,%eax
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
  100124:	66 c7 05 e8 d5 13 01 	movw   $0xffff,0x113d5e8
  10012b:	ff ff 
  10012d:	66 a3 ea d5 13 01    	mov    %ax,0x113d5ea
  100133:	88 0d ec d5 13 01    	mov    %cl,0x113d5ec
  100139:	a0 ed d5 13 01       	mov    0x113d5ed,%al
  10013e:	83 e0 f0             	and    $0xfffffff0,%eax
  100141:	83 c8 0a             	or     $0xa,%eax
  100144:	a2 ed d5 13 01       	mov    %al,0x113d5ed
  100149:	a0 ed d5 13 01       	mov    0x113d5ed,%al
  10014e:	83 c8 10             	or     $0x10,%eax
  100151:	a2 ed d5 13 01       	mov    %al,0x113d5ed
  100156:	a0 ed d5 13 01       	mov    0x113d5ed,%al
  10015b:	83 e0 9f             	and    $0xffffff9f,%eax
  10015e:	a2 ed d5 13 01       	mov    %al,0x113d5ed
  100163:	a0 ed d5 13 01       	mov    0x113d5ed,%al
  100168:	83 c8 80             	or     $0xffffff80,%eax
  10016b:	a2 ed d5 13 01       	mov    %al,0x113d5ed
  100170:	a0 ee d5 13 01       	mov    0x113d5ee,%al
  100175:	83 c8 0f             	or     $0xf,%eax
  100178:	a2 ee d5 13 01       	mov    %al,0x113d5ee
  10017d:	a0 ee d5 13 01       	mov    0x113d5ee,%al
  100182:	83 e0 ef             	and    $0xffffffef,%eax
  100185:	a2 ee d5 13 01       	mov    %al,0x113d5ee
  10018a:	a0 ee d5 13 01       	mov    0x113d5ee,%al
  10018f:	83 e0 df             	and    $0xffffffdf,%eax
  100192:	a2 ee d5 13 01       	mov    %al,0x113d5ee
  100197:	a0 ee d5 13 01       	mov    0x113d5ee,%al
  10019c:	83 c8 40             	or     $0x40,%eax
  10019f:	a2 ee d5 13 01       	mov    %al,0x113d5ee
  1001a4:	a0 ee d5 13 01       	mov    0x113d5ee,%al
  1001a9:	83 c8 80             	or     $0xffffff80,%eax
  1001ac:	a2 ee d5 13 01       	mov    %al,0x113d5ee
  1001b1:	88 15 ef d5 13 01    	mov    %dl,0x113d5ef
  1001b7:	e9 49 02 00 00       	jmp    100405 <change_gdt+0x333>
  1001bc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1001bf:	8b 55 0c             	mov    0xc(%ebp),%edx
  1001c2:	c1 ea 10             	shr    $0x10,%edx
  1001c5:	88 d1                	mov    %dl,%cl
  1001c7:	8b 55 0c             	mov    0xc(%ebp),%edx
  1001ca:	c1 ea 18             	shr    $0x18,%edx
  1001cd:	66 c7 05 f0 d5 13 01 	movw   $0xffff,0x113d5f0
  1001d4:	ff ff 
  1001d6:	66 a3 f2 d5 13 01    	mov    %ax,0x113d5f2
  1001dc:	88 0d f4 d5 13 01    	mov    %cl,0x113d5f4
  1001e2:	a0 f5 d5 13 01       	mov    0x113d5f5,%al
  1001e7:	83 e0 f0             	and    $0xfffffff0,%eax
  1001ea:	83 c8 02             	or     $0x2,%eax
  1001ed:	a2 f5 d5 13 01       	mov    %al,0x113d5f5
  1001f2:	a0 f5 d5 13 01       	mov    0x113d5f5,%al
  1001f7:	83 c8 10             	or     $0x10,%eax
  1001fa:	a2 f5 d5 13 01       	mov    %al,0x113d5f5
  1001ff:	a0 f5 d5 13 01       	mov    0x113d5f5,%al
  100204:	83 e0 9f             	and    $0xffffff9f,%eax
  100207:	a2 f5 d5 13 01       	mov    %al,0x113d5f5
  10020c:	a0 f5 d5 13 01       	mov    0x113d5f5,%al
  100211:	83 c8 80             	or     $0xffffff80,%eax
  100214:	a2 f5 d5 13 01       	mov    %al,0x113d5f5
  100219:	a0 f6 d5 13 01       	mov    0x113d5f6,%al
  10021e:	83 c8 0f             	or     $0xf,%eax
  100221:	a2 f6 d5 13 01       	mov    %al,0x113d5f6
  100226:	a0 f6 d5 13 01       	mov    0x113d5f6,%al
  10022b:	83 e0 ef             	and    $0xffffffef,%eax
  10022e:	a2 f6 d5 13 01       	mov    %al,0x113d5f6
  100233:	a0 f6 d5 13 01       	mov    0x113d5f6,%al
  100238:	83 e0 df             	and    $0xffffffdf,%eax
  10023b:	a2 f6 d5 13 01       	mov    %al,0x113d5f6
  100240:	a0 f6 d5 13 01       	mov    0x113d5f6,%al
  100245:	83 c8 40             	or     $0x40,%eax
  100248:	a2 f6 d5 13 01       	mov    %al,0x113d5f6
  10024d:	a0 f6 d5 13 01       	mov    0x113d5f6,%al
  100252:	83 c8 80             	or     $0xffffff80,%eax
  100255:	a2 f6 d5 13 01       	mov    %al,0x113d5f6
  10025a:	88 15 f7 d5 13 01    	mov    %dl,0x113d5f7
  100260:	e9 a0 01 00 00       	jmp    100405 <change_gdt+0x333>
  100265:	8b 45 0c             	mov    0xc(%ebp),%eax
  100268:	8b 55 0c             	mov    0xc(%ebp),%edx
  10026b:	c1 ea 10             	shr    $0x10,%edx
  10026e:	88 d1                	mov    %dl,%cl
  100270:	8b 55 0c             	mov    0xc(%ebp),%edx
  100273:	c1 ea 18             	shr    $0x18,%edx
  100276:	66 c7 05 f8 d5 13 01 	movw   $0xffff,0x113d5f8
  10027d:	ff ff 
  10027f:	66 a3 fa d5 13 01    	mov    %ax,0x113d5fa
  100285:	88 0d fc d5 13 01    	mov    %cl,0x113d5fc
  10028b:	a0 fd d5 13 01       	mov    0x113d5fd,%al
  100290:	83 e0 f0             	and    $0xfffffff0,%eax
  100293:	83 c8 0a             	or     $0xa,%eax
  100296:	a2 fd d5 13 01       	mov    %al,0x113d5fd
  10029b:	a0 fd d5 13 01       	mov    0x113d5fd,%al
  1002a0:	83 c8 10             	or     $0x10,%eax
  1002a3:	a2 fd d5 13 01       	mov    %al,0x113d5fd
  1002a8:	a0 fd d5 13 01       	mov    0x113d5fd,%al
  1002ad:	83 c8 60             	or     $0x60,%eax
  1002b0:	a2 fd d5 13 01       	mov    %al,0x113d5fd
  1002b5:	a0 fd d5 13 01       	mov    0x113d5fd,%al
  1002ba:	83 c8 80             	or     $0xffffff80,%eax
  1002bd:	a2 fd d5 13 01       	mov    %al,0x113d5fd
  1002c2:	a0 fe d5 13 01       	mov    0x113d5fe,%al
  1002c7:	83 c8 0f             	or     $0xf,%eax
  1002ca:	a2 fe d5 13 01       	mov    %al,0x113d5fe
  1002cf:	a0 fe d5 13 01       	mov    0x113d5fe,%al
  1002d4:	83 e0 ef             	and    $0xffffffef,%eax
  1002d7:	a2 fe d5 13 01       	mov    %al,0x113d5fe
  1002dc:	a0 fe d5 13 01       	mov    0x113d5fe,%al
  1002e1:	83 e0 df             	and    $0xffffffdf,%eax
  1002e4:	a2 fe d5 13 01       	mov    %al,0x113d5fe
  1002e9:	a0 fe d5 13 01       	mov    0x113d5fe,%al
  1002ee:	83 c8 40             	or     $0x40,%eax
  1002f1:	a2 fe d5 13 01       	mov    %al,0x113d5fe
  1002f6:	a0 fe d5 13 01       	mov    0x113d5fe,%al
  1002fb:	83 c8 80             	or     $0xffffff80,%eax
  1002fe:	a2 fe d5 13 01       	mov    %al,0x113d5fe
  100303:	88 15 ff d5 13 01    	mov    %dl,0x113d5ff
  100309:	e9 f7 00 00 00       	jmp    100405 <change_gdt+0x333>
  10030e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100311:	8b 55 0c             	mov    0xc(%ebp),%edx
  100314:	c1 ea 10             	shr    $0x10,%edx
  100317:	88 d1                	mov    %dl,%cl
  100319:	8b 55 0c             	mov    0xc(%ebp),%edx
  10031c:	c1 ea 18             	shr    $0x18,%edx
  10031f:	66 c7 05 00 d6 13 01 	movw   $0xffff,0x113d600
  100326:	ff ff 
  100328:	66 a3 02 d6 13 01    	mov    %ax,0x113d602
  10032e:	88 0d 04 d6 13 01    	mov    %cl,0x113d604
  100334:	a0 05 d6 13 01       	mov    0x113d605,%al
  100339:	83 e0 f0             	and    $0xfffffff0,%eax
  10033c:	83 c8 02             	or     $0x2,%eax
  10033f:	a2 05 d6 13 01       	mov    %al,0x113d605
  100344:	a0 05 d6 13 01       	mov    0x113d605,%al
  100349:	83 c8 10             	or     $0x10,%eax
  10034c:	a2 05 d6 13 01       	mov    %al,0x113d605
  100351:	a0 05 d6 13 01       	mov    0x113d605,%al
  100356:	83 c8 60             	or     $0x60,%eax
  100359:	a2 05 d6 13 01       	mov    %al,0x113d605
  10035e:	a0 05 d6 13 01       	mov    0x113d605,%al
  100363:	83 c8 80             	or     $0xffffff80,%eax
  100366:	a2 05 d6 13 01       	mov    %al,0x113d605
  10036b:	a0 06 d6 13 01       	mov    0x113d606,%al
  100370:	83 c8 0f             	or     $0xf,%eax
  100373:	a2 06 d6 13 01       	mov    %al,0x113d606
  100378:	a0 06 d6 13 01       	mov    0x113d606,%al
  10037d:	83 e0 ef             	and    $0xffffffef,%eax
  100380:	a2 06 d6 13 01       	mov    %al,0x113d606
  100385:	a0 06 d6 13 01       	mov    0x113d606,%al
  10038a:	83 e0 df             	and    $0xffffffdf,%eax
  10038d:	a2 06 d6 13 01       	mov    %al,0x113d606
  100392:	a0 06 d6 13 01       	mov    0x113d606,%al
  100397:	83 c8 40             	or     $0x40,%eax
  10039a:	a2 06 d6 13 01       	mov    %al,0x113d606
  10039f:	a0 06 d6 13 01       	mov    0x113d606,%al
  1003a4:	83 c8 80             	or     $0xffffff80,%eax
  1003a7:	a2 06 d6 13 01       	mov    %al,0x113d606
  1003ac:	88 15 07 d6 13 01    	mov    %dl,0x113d607
  1003b2:	eb 51                	jmp    100405 <change_gdt+0x333>
  1003b4:	83 ec 0c             	sub    $0xc,%esp
  1003b7:	68 84 2d 10 00       	push   $0x102d84
  1003bc:	e8 af 26 00 00       	call   102a70 <printk>
  1003c1:	83 c4 10             	add    $0x10,%esp
  1003c4:	83 ec 0c             	sub    $0xc,%esp
  1003c7:	ff 75 f4             	pushl  -0xc(%ebp)
  1003ca:	68 c4 2d 10 00       	push   $0x102dc4
  1003cf:	6a 17                	push   $0x17
  1003d1:	68 8a 2d 10 00       	push   $0x102d8a
  1003d6:	68 97 2d 10 00       	push   $0x102d97
  1003db:	e8 90 26 00 00       	call   102a70 <printk>
  1003e0:	83 c4 20             	add    $0x20,%esp
  1003e3:	83 ec 0c             	sub    $0xc,%esp
  1003e6:	68 b3 2d 10 00       	push   $0x102db3
  1003eb:	e8 80 26 00 00       	call   102a70 <printk>
  1003f0:	83 c4 10             	add    $0x10,%esp
  1003f3:	83 ec 08             	sub    $0x8,%esp
  1003f6:	6a 18                	push   $0x18
  1003f8:	68 8a 2d 10 00       	push   $0x102d8a
  1003fd:	e8 2a 29 00 00       	call   102d2c <abort>
  100402:	83 c4 10             	add    $0x10,%esp
  100405:	83 ec 08             	sub    $0x8,%esp
  100408:	6a 50                	push   $0x50
  10040a:	68 e0 d5 13 01       	push   $0x113d5e0
  10040f:	e8 28 fc ff ff       	call   10003c <setGdt>
  100414:	83 c4 10             	add    $0x10,%esp
  100417:	b8 01 00 00 00       	mov    $0x1,%eax
  10041c:	c9                   	leave  
  10041d:	c3                   	ret    

0010041e <change_tss>:
  10041e:	55                   	push   %ebp
  10041f:	89 e5                	mov    %esp,%ebp
  100421:	8b 45 08             	mov    0x8(%ebp),%eax
  100424:	a3 48 d6 13 01       	mov    %eax,0x113d648
  100429:	8b 45 0c             	mov    0xc(%ebp),%eax
  10042c:	a3 44 d6 13 01       	mov    %eax,0x113d644
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
  100443:	bb 40 d6 13 01       	mov    $0x113d640,%ebx
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
  100545:	66 c7 05 e8 d5 13 01 	movw   $0xffff,0x113d5e8
  10054c:	ff ff 
  10054e:	66 c7 05 ea d5 13 01 	movw   $0x0,0x113d5ea
  100555:	00 00 
  100557:	c6 05 ec d5 13 01 00 	movb   $0x0,0x113d5ec
  10055e:	a0 ed d5 13 01       	mov    0x113d5ed,%al
  100563:	83 e0 f0             	and    $0xfffffff0,%eax
  100566:	83 c8 0a             	or     $0xa,%eax
  100569:	a2 ed d5 13 01       	mov    %al,0x113d5ed
  10056e:	a0 ed d5 13 01       	mov    0x113d5ed,%al
  100573:	83 c8 10             	or     $0x10,%eax
  100576:	a2 ed d5 13 01       	mov    %al,0x113d5ed
  10057b:	a0 ed d5 13 01       	mov    0x113d5ed,%al
  100580:	83 e0 9f             	and    $0xffffff9f,%eax
  100583:	a2 ed d5 13 01       	mov    %al,0x113d5ed
  100588:	a0 ed d5 13 01       	mov    0x113d5ed,%al
  10058d:	83 c8 80             	or     $0xffffff80,%eax
  100590:	a2 ed d5 13 01       	mov    %al,0x113d5ed
  100595:	a0 ee d5 13 01       	mov    0x113d5ee,%al
  10059a:	83 c8 0f             	or     $0xf,%eax
  10059d:	a2 ee d5 13 01       	mov    %al,0x113d5ee
  1005a2:	a0 ee d5 13 01       	mov    0x113d5ee,%al
  1005a7:	83 e0 ef             	and    $0xffffffef,%eax
  1005aa:	a2 ee d5 13 01       	mov    %al,0x113d5ee
  1005af:	a0 ee d5 13 01       	mov    0x113d5ee,%al
  1005b4:	83 e0 df             	and    $0xffffffdf,%eax
  1005b7:	a2 ee d5 13 01       	mov    %al,0x113d5ee
  1005bc:	a0 ee d5 13 01       	mov    0x113d5ee,%al
  1005c1:	83 c8 40             	or     $0x40,%eax
  1005c4:	a2 ee d5 13 01       	mov    %al,0x113d5ee
  1005c9:	a0 ee d5 13 01       	mov    0x113d5ee,%al
  1005ce:	83 c8 80             	or     $0xffffff80,%eax
  1005d1:	a2 ee d5 13 01       	mov    %al,0x113d5ee
  1005d6:	c6 05 ef d5 13 01 00 	movb   $0x0,0x113d5ef
  1005dd:	66 c7 05 f0 d5 13 01 	movw   $0xffff,0x113d5f0
  1005e4:	ff ff 
  1005e6:	66 c7 05 f2 d5 13 01 	movw   $0x0,0x113d5f2
  1005ed:	00 00 
  1005ef:	c6 05 f4 d5 13 01 00 	movb   $0x0,0x113d5f4
  1005f6:	a0 f5 d5 13 01       	mov    0x113d5f5,%al
  1005fb:	83 e0 f0             	and    $0xfffffff0,%eax
  1005fe:	83 c8 02             	or     $0x2,%eax
  100601:	a2 f5 d5 13 01       	mov    %al,0x113d5f5
  100606:	a0 f5 d5 13 01       	mov    0x113d5f5,%al
  10060b:	83 c8 10             	or     $0x10,%eax
  10060e:	a2 f5 d5 13 01       	mov    %al,0x113d5f5
  100613:	a0 f5 d5 13 01       	mov    0x113d5f5,%al
  100618:	83 e0 9f             	and    $0xffffff9f,%eax
  10061b:	a2 f5 d5 13 01       	mov    %al,0x113d5f5
  100620:	a0 f5 d5 13 01       	mov    0x113d5f5,%al
  100625:	83 c8 80             	or     $0xffffff80,%eax
  100628:	a2 f5 d5 13 01       	mov    %al,0x113d5f5
  10062d:	a0 f6 d5 13 01       	mov    0x113d5f6,%al
  100632:	83 c8 0f             	or     $0xf,%eax
  100635:	a2 f6 d5 13 01       	mov    %al,0x113d5f6
  10063a:	a0 f6 d5 13 01       	mov    0x113d5f6,%al
  10063f:	83 e0 ef             	and    $0xffffffef,%eax
  100642:	a2 f6 d5 13 01       	mov    %al,0x113d5f6
  100647:	a0 f6 d5 13 01       	mov    0x113d5f6,%al
  10064c:	83 e0 df             	and    $0xffffffdf,%eax
  10064f:	a2 f6 d5 13 01       	mov    %al,0x113d5f6
  100654:	a0 f6 d5 13 01       	mov    0x113d5f6,%al
  100659:	83 c8 40             	or     $0x40,%eax
  10065c:	a2 f6 d5 13 01       	mov    %al,0x113d5f6
  100661:	a0 f6 d5 13 01       	mov    0x113d5f6,%al
  100666:	83 c8 80             	or     $0xffffff80,%eax
  100669:	a2 f6 d5 13 01       	mov    %al,0x113d5f6
  10066e:	c6 05 f7 d5 13 01 00 	movb   $0x0,0x113d5f7
  100675:	66 c7 05 f8 d5 13 01 	movw   $0xffff,0x113d5f8
  10067c:	ff ff 
  10067e:	66 c7 05 fa d5 13 01 	movw   $0x0,0x113d5fa
  100685:	00 00 
  100687:	c6 05 fc d5 13 01 00 	movb   $0x0,0x113d5fc
  10068e:	a0 fd d5 13 01       	mov    0x113d5fd,%al
  100693:	83 e0 f0             	and    $0xfffffff0,%eax
  100696:	83 c8 0a             	or     $0xa,%eax
  100699:	a2 fd d5 13 01       	mov    %al,0x113d5fd
  10069e:	a0 fd d5 13 01       	mov    0x113d5fd,%al
  1006a3:	83 c8 10             	or     $0x10,%eax
  1006a6:	a2 fd d5 13 01       	mov    %al,0x113d5fd
  1006ab:	a0 fd d5 13 01       	mov    0x113d5fd,%al
  1006b0:	83 c8 60             	or     $0x60,%eax
  1006b3:	a2 fd d5 13 01       	mov    %al,0x113d5fd
  1006b8:	a0 fd d5 13 01       	mov    0x113d5fd,%al
  1006bd:	83 c8 80             	or     $0xffffff80,%eax
  1006c0:	a2 fd d5 13 01       	mov    %al,0x113d5fd
  1006c5:	a0 fe d5 13 01       	mov    0x113d5fe,%al
  1006ca:	83 c8 0f             	or     $0xf,%eax
  1006cd:	a2 fe d5 13 01       	mov    %al,0x113d5fe
  1006d2:	a0 fe d5 13 01       	mov    0x113d5fe,%al
  1006d7:	83 e0 ef             	and    $0xffffffef,%eax
  1006da:	a2 fe d5 13 01       	mov    %al,0x113d5fe
  1006df:	a0 fe d5 13 01       	mov    0x113d5fe,%al
  1006e4:	83 e0 df             	and    $0xffffffdf,%eax
  1006e7:	a2 fe d5 13 01       	mov    %al,0x113d5fe
  1006ec:	a0 fe d5 13 01       	mov    0x113d5fe,%al
  1006f1:	83 c8 40             	or     $0x40,%eax
  1006f4:	a2 fe d5 13 01       	mov    %al,0x113d5fe
  1006f9:	a0 fe d5 13 01       	mov    0x113d5fe,%al
  1006fe:	83 c8 80             	or     $0xffffff80,%eax
  100701:	a2 fe d5 13 01       	mov    %al,0x113d5fe
  100706:	c6 05 ff d5 13 01 00 	movb   $0x0,0x113d5ff
  10070d:	66 c7 05 00 d6 13 01 	movw   $0xffff,0x113d600
  100714:	ff ff 
  100716:	66 c7 05 02 d6 13 01 	movw   $0x0,0x113d602
  10071d:	00 00 
  10071f:	c6 05 04 d6 13 01 00 	movb   $0x0,0x113d604
  100726:	a0 05 d6 13 01       	mov    0x113d605,%al
  10072b:	83 e0 f0             	and    $0xfffffff0,%eax
  10072e:	83 c8 02             	or     $0x2,%eax
  100731:	a2 05 d6 13 01       	mov    %al,0x113d605
  100736:	a0 05 d6 13 01       	mov    0x113d605,%al
  10073b:	83 c8 10             	or     $0x10,%eax
  10073e:	a2 05 d6 13 01       	mov    %al,0x113d605
  100743:	a0 05 d6 13 01       	mov    0x113d605,%al
  100748:	83 c8 60             	or     $0x60,%eax
  10074b:	a2 05 d6 13 01       	mov    %al,0x113d605
  100750:	a0 05 d6 13 01       	mov    0x113d605,%al
  100755:	83 c8 80             	or     $0xffffff80,%eax
  100758:	a2 05 d6 13 01       	mov    %al,0x113d605
  10075d:	a0 06 d6 13 01       	mov    0x113d606,%al
  100762:	83 c8 0f             	or     $0xf,%eax
  100765:	a2 06 d6 13 01       	mov    %al,0x113d606
  10076a:	a0 06 d6 13 01       	mov    0x113d606,%al
  10076f:	83 e0 ef             	and    $0xffffffef,%eax
  100772:	a2 06 d6 13 01       	mov    %al,0x113d606
  100777:	a0 06 d6 13 01       	mov    0x113d606,%al
  10077c:	83 e0 df             	and    $0xffffffdf,%eax
  10077f:	a2 06 d6 13 01       	mov    %al,0x113d606
  100784:	a0 06 d6 13 01       	mov    0x113d606,%al
  100789:	83 c8 40             	or     $0x40,%eax
  10078c:	a2 06 d6 13 01       	mov    %al,0x113d606
  100791:	a0 06 d6 13 01       	mov    0x113d606,%al
  100796:	83 c8 80             	or     $0xffffff80,%eax
  100799:	a2 06 d6 13 01       	mov    %al,0x113d606
  10079e:	c6 05 07 d6 13 01 00 	movb   $0x0,0x113d607
  1007a5:	66 c7 05 08 d6 13 01 	movw   $0x63,0x113d608
  1007ac:	63 00 
  1007ae:	b8 40 d6 13 01       	mov    $0x113d640,%eax
  1007b3:	66 a3 0a d6 13 01    	mov    %ax,0x113d60a
  1007b9:	b8 40 d6 13 01       	mov    $0x113d640,%eax
  1007be:	c1 e8 10             	shr    $0x10,%eax
  1007c1:	a2 0c d6 13 01       	mov    %al,0x113d60c
  1007c6:	a0 0d d6 13 01       	mov    0x113d60d,%al
  1007cb:	83 e0 f0             	and    $0xfffffff0,%eax
  1007ce:	83 c8 09             	or     $0x9,%eax
  1007d1:	a2 0d d6 13 01       	mov    %al,0x113d60d
  1007d6:	a0 0d d6 13 01       	mov    0x113d60d,%al
  1007db:	83 e0 ef             	and    $0xffffffef,%eax
  1007de:	a2 0d d6 13 01       	mov    %al,0x113d60d
  1007e3:	a0 0d d6 13 01       	mov    0x113d60d,%al
  1007e8:	83 e0 9f             	and    $0xffffff9f,%eax
  1007eb:	a2 0d d6 13 01       	mov    %al,0x113d60d
  1007f0:	a0 0d d6 13 01       	mov    0x113d60d,%al
  1007f5:	83 c8 80             	or     $0xffffff80,%eax
  1007f8:	a2 0d d6 13 01       	mov    %al,0x113d60d
  1007fd:	a0 0e d6 13 01       	mov    0x113d60e,%al
  100802:	83 e0 f0             	and    $0xfffffff0,%eax
  100805:	a2 0e d6 13 01       	mov    %al,0x113d60e
  10080a:	a0 0e d6 13 01       	mov    0x113d60e,%al
  10080f:	83 e0 ef             	and    $0xffffffef,%eax
  100812:	a2 0e d6 13 01       	mov    %al,0x113d60e
  100817:	a0 0e d6 13 01       	mov    0x113d60e,%al
  10081c:	83 e0 df             	and    $0xffffffdf,%eax
  10081f:	a2 0e d6 13 01       	mov    %al,0x113d60e
  100824:	a0 0e d6 13 01       	mov    0x113d60e,%al
  100829:	83 c8 40             	or     $0x40,%eax
  10082c:	a2 0e d6 13 01       	mov    %al,0x113d60e
  100831:	a0 0e d6 13 01       	mov    0x113d60e,%al
  100836:	83 e0 7f             	and    $0x7f,%eax
  100839:	a2 0e d6 13 01       	mov    %al,0x113d60e
  10083e:	b8 40 d6 13 01       	mov    $0x113d640,%eax
  100843:	c1 e8 18             	shr    $0x18,%eax
  100846:	a2 0f d6 13 01       	mov    %al,0x113d60f
  10084b:	a0 0d d6 13 01       	mov    0x113d60d,%al
  100850:	83 e0 ef             	and    $0xffffffef,%eax
  100853:	a2 0d d6 13 01       	mov    %al,0x113d60d
  100858:	a1 bc 2d 10 00       	mov    0x102dbc,%eax
  10085d:	8b 15 c0 2d 10 00    	mov    0x102dc0,%edx
  100863:	a3 10 d6 13 01       	mov    %eax,0x113d610
  100868:	89 15 14 d6 13 01    	mov    %edx,0x113d614
  10086e:	66 c7 05 20 d6 13 01 	movw   $0xffff,0x113d620
  100875:	ff ff 
  100877:	66 c7 05 22 d6 13 01 	movw   $0x0,0x113d622
  10087e:	00 00 
  100880:	c6 05 24 d6 13 01 00 	movb   $0x0,0x113d624
  100887:	a0 25 d6 13 01       	mov    0x113d625,%al
  10088c:	83 e0 f0             	and    $0xfffffff0,%eax
  10088f:	83 c8 02             	or     $0x2,%eax
  100892:	a2 25 d6 13 01       	mov    %al,0x113d625
  100897:	a0 25 d6 13 01       	mov    0x113d625,%al
  10089c:	83 c8 10             	or     $0x10,%eax
  10089f:	a2 25 d6 13 01       	mov    %al,0x113d625
  1008a4:	a0 25 d6 13 01       	mov    0x113d625,%al
  1008a9:	83 c8 60             	or     $0x60,%eax
  1008ac:	a2 25 d6 13 01       	mov    %al,0x113d625
  1008b1:	a0 25 d6 13 01       	mov    0x113d625,%al
  1008b6:	83 c8 80             	or     $0xffffff80,%eax
  1008b9:	a2 25 d6 13 01       	mov    %al,0x113d625
  1008be:	a0 26 d6 13 01       	mov    0x113d626,%al
  1008c3:	83 c8 0f             	or     $0xf,%eax
  1008c6:	a2 26 d6 13 01       	mov    %al,0x113d626
  1008cb:	a0 26 d6 13 01       	mov    0x113d626,%al
  1008d0:	83 e0 ef             	and    $0xffffffef,%eax
  1008d3:	a2 26 d6 13 01       	mov    %al,0x113d626
  1008d8:	a0 26 d6 13 01       	mov    0x113d626,%al
  1008dd:	83 e0 df             	and    $0xffffffdf,%eax
  1008e0:	a2 26 d6 13 01       	mov    %al,0x113d626
  1008e5:	a0 26 d6 13 01       	mov    0x113d626,%al
  1008ea:	83 c8 40             	or     $0x40,%eax
  1008ed:	a2 26 d6 13 01       	mov    %al,0x113d626
  1008f2:	a0 26 d6 13 01       	mov    0x113d626,%al
  1008f7:	83 c8 80             	or     $0xffffff80,%eax
  1008fa:	a2 26 d6 13 01       	mov    %al,0x113d626
  1008ff:	c6 05 27 d6 13 01 00 	movb   $0x0,0x113d627
  100906:	6a 50                	push   $0x50
  100908:	68 e0 d5 13 01       	push   $0x113d5e0
  10090d:	e8 2a f7 ff ff       	call   10003c <setGdt>
  100912:	83 c4 08             	add    $0x8,%esp
  100915:	b8 dc 75 10 00       	mov    $0x1075dc,%eax
  10091a:	89 c2                	mov    %eax,%edx
  10091c:	a1 28 76 10 00       	mov    0x107628,%eax
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
  100973:	05 e0 55 10 00       	add    $0x1055e0,%eax
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
  1009bb:	c7 05 c4 55 10 00 01 	movl   $0x1,0x1055c4
  1009c2:	00 00 00 
  1009c5:	e8 b9 0b 00 00       	call   101583 <apply_new_pid>
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
  1009e2:	05 28 76 10 00       	add    $0x107628,%eax
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
  100a02:	05 1c 76 10 00       	add    $0x10761c,%eax
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
  100a22:	05 ec 75 10 00       	add    $0x1075ec,%eax
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
  100a42:	05 e8 75 10 00       	add    $0x1075e8,%eax
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
  100a62:	05 e4 75 10 00       	add    $0x1075e4,%eax
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
  100a82:	05 24 76 10 00       	add    $0x107624,%eax
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
  100aa2:	8d 90 18 76 10 00    	lea    0x107618(%eax),%edx
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
  100ac2:	05 30 76 10 00       	add    $0x107630,%eax
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
  100ae7:	05 e0 55 10 00       	add    $0x1055e0,%eax
  100aec:	83 ec 08             	sub    $0x8,%esp
  100aef:	50                   	push   %eax
  100af0:	ff 75 f4             	pushl  -0xc(%ebp)
  100af3:	e8 07 0b 00 00       	call   1015ff <put_into_runnable>
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
  100c5c:	e8 60 09 00 00       	call   1015c1 <getpid>
  100c61:	83 ec 0c             	sub    $0xc,%esp
  100c64:	50                   	push   %eax
  100c65:	e8 3f 09 00 00       	call   1015a9 <put_into_empty>
  100c6a:	83 c4 10             	add    $0x10,%esp
  100c6d:	e8 6d 09 00 00       	call   1015df <get_from_runnable>
  100c72:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c75:	83 ec 08             	sub    $0x8,%esp
  100c78:	ff 75 08             	pushl  0x8(%ebp)
  100c7b:	ff 75 f4             	pushl  -0xc(%ebp)
  100c7e:	e8 a9 08 00 00       	call   10152c <put_into_running>
  100c83:	83 c4 10             	add    $0x10,%esp
  100c86:	b8 01 00 00 00       	mov    $0x1,%eax
  100c8b:	c9                   	leave  
  100c8c:	c3                   	ret    

00100c8d <sys_getpid>:
  100c8d:	55                   	push   %ebp
  100c8e:	89 e5                	mov    %esp,%ebp
  100c90:	83 ec 08             	sub    $0x8,%esp
  100c93:	e8 29 09 00 00       	call   1015c1 <getpid>
  100c98:	c9                   	leave  
  100c99:	c3                   	ret    

00100c9a <sys_sleep>:
  100c9a:	55                   	push   %ebp
  100c9b:	89 e5                	mov    %esp,%ebp
  100c9d:	83 ec 18             	sub    $0x18,%esp
  100ca0:	e8 1c 09 00 00       	call   1015c1 <getpid>
  100ca5:	83 ec 08             	sub    $0x8,%esp
  100ca8:	ff 75 08             	pushl  0x8(%ebp)
  100cab:	50                   	push   %eax
  100cac:	e8 7c 0c 00 00       	call   10192d <put_into_block>
  100cb1:	83 c4 10             	add    $0x10,%esp
  100cb4:	e8 26 09 00 00       	call   1015df <get_from_runnable>
  100cb9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100cbc:	83 ec 08             	sub    $0x8,%esp
  100cbf:	ff 75 08             	pushl  0x8(%ebp)
  100cc2:	ff 75 f4             	pushl  -0xc(%ebp)
  100cc5:	e8 62 08 00 00       	call   10152c <put_into_running>
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
  100cdd:	e8 a1 08 00 00       	call   101583 <apply_new_pid>
  100ce2:	89 45 d8             	mov    %eax,-0x28(%ebp)
  100ce5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100cec:	eb 6d                	jmp    100d5b <sys_fork+0x87>
  100cee:	e8 ce 08 00 00       	call   1015c1 <getpid>
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
  100d1e:	8b 0c 85 e0 55 10 00 	mov    0x1055e0(,%eax,4),%ecx
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
  100d51:	89 0c 85 e0 55 10 00 	mov    %ecx,0x1055e0(,%eax,4)
  100d58:	ff 45 e4             	incl   -0x1c(%ebp)
  100d5b:	81 7d e4 ff 07 00 00 	cmpl   $0x7ff,-0x1c(%ebp)
  100d62:	7e 8a                	jle    100cee <sys_fork+0x1a>
  100d64:	e8 58 08 00 00       	call   1015c1 <getpid>
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
  100dc2:	8d 90 e0 75 10 00    	lea    0x1075e0(%eax),%edx
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
  100def:	05 0c 76 10 00       	add    $0x10760c,%eax
  100df4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  100dfa:	e8 c2 07 00 00       	call   1015c1 <getpid>
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
  100e59:	05 e0 55 10 00       	add    $0x1055e0,%eax
  100e5e:	83 ec 08             	sub    $0x8,%esp
  100e61:	50                   	push   %eax
  100e62:	ff 75 d8             	pushl  -0x28(%ebp)
  100e65:	e8 95 07 00 00       	call   1015ff <put_into_runnable>
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
  100eb5:	a1 2c 4d 10 00       	mov    0x104d2c,%eax
  100eba:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100ebd:	eb 19                	jmp    100ed8 <printkernel+0x43>
  100ebf:	a1 28 4d 10 00       	mov    0x104d28,%eax
  100ec4:	83 ec 04             	sub    $0x4,%esp
  100ec7:	6a 20                	push   $0x20
  100ec9:	ff 75 f0             	pushl  -0x10(%ebp)
  100ecc:	50                   	push   %eax
  100ecd:	e8 84 02 00 00       	call   101156 <print_char>
  100ed2:	83 c4 10             	add    $0x10,%esp
  100ed5:	ff 45 f0             	incl   -0x10(%ebp)
  100ed8:	83 7d f0 50          	cmpl   $0x50,-0x10(%ebp)
  100edc:	7e e1                	jle    100ebf <printkernel+0x2a>
  100ede:	c7 05 2c 4d 10 00 00 	movl   $0x0,0x104d2c
  100ee5:	00 00 00 
  100ee8:	a1 28 4d 10 00       	mov    0x104d28,%eax
  100eed:	40                   	inc    %eax
  100eee:	a3 28 4d 10 00       	mov    %eax,0x104d28
  100ef3:	8b 15 2c 4d 10 00    	mov    0x104d2c,%edx
  100ef9:	a1 28 4d 10 00       	mov    0x104d28,%eax
  100efe:	83 ec 08             	sub    $0x8,%esp
  100f01:	52                   	push   %edx
  100f02:	50                   	push   %eax
  100f03:	e8 be 00 00 00       	call   100fc6 <update_cursor>
  100f08:	83 c4 10             	add    $0x10,%esp
  100f0b:	eb 40                	jmp    100f4d <printkernel+0xb8>
  100f0d:	0f be 4d ef          	movsbl -0x11(%ebp),%ecx
  100f11:	8b 15 2c 4d 10 00    	mov    0x104d2c,%edx
  100f17:	a1 28 4d 10 00       	mov    0x104d28,%eax
  100f1c:	83 ec 04             	sub    $0x4,%esp
  100f1f:	51                   	push   %ecx
  100f20:	52                   	push   %edx
  100f21:	50                   	push   %eax
  100f22:	e8 2f 02 00 00       	call   101156 <print_char>
  100f27:	83 c4 10             	add    $0x10,%esp
  100f2a:	a1 2c 4d 10 00       	mov    0x104d2c,%eax
  100f2f:	40                   	inc    %eax
  100f30:	a3 2c 4d 10 00       	mov    %eax,0x104d2c
  100f35:	8b 15 2c 4d 10 00    	mov    0x104d2c,%edx
  100f3b:	a1 28 4d 10 00       	mov    0x104d28,%eax
  100f40:	83 ec 08             	sub    $0x8,%esp
  100f43:	52                   	push   %edx
  100f44:	50                   	push   %eax
  100f45:	e8 7c 00 00 00       	call   100fc6 <update_cursor>
  100f4a:	83 c4 10             	add    $0x10,%esp
  100f4d:	a1 2c 4d 10 00       	mov    0x104d2c,%eax
  100f52:	83 f8 50             	cmp    $0x50,%eax
  100f55:	75 15                	jne    100f6c <printkernel+0xd7>
  100f57:	c7 05 2c 4d 10 00 00 	movl   $0x0,0x104d2c
  100f5e:	00 00 00 
  100f61:	a1 28 4d 10 00       	mov    0x104d28,%eax
  100f66:	40                   	inc    %eax
  100f67:	a3 28 4d 10 00       	mov    %eax,0x104d28
  100f6c:	8b 15 28 4d 10 00    	mov    0x104d28,%edx
  100f72:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  100f77:	39 c2                	cmp    %eax,%edx
  100f79:	7e 29                	jle    100fa4 <printkernel+0x10f>
  100f7b:	a1 28 4d 10 00       	mov    0x104d28,%eax
  100f80:	83 ec 0c             	sub    $0xc,%esp
  100f83:	50                   	push   %eax
  100f84:	e8 ac 00 00 00       	call   101035 <scrollScreen>
  100f89:	83 c4 10             	add    $0x10,%esp
  100f8c:	8b 15 2c 4d 10 00    	mov    0x104d2c,%edx
  100f92:	a1 28 4d 10 00       	mov    0x104d28,%eax
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
  10103c:	a1 28 4d 10 00       	mov    0x104d28,%eax
  101041:	85 c0                	test   %eax,%eax
  101043:	7f 12                	jg     101057 <scrollScreen+0x22>
  101045:	83 ec 08             	sub    $0x8,%esp
  101048:	6a 38                	push   $0x38
  10104a:	68 cf 2d 10 00       	push   $0x102dcf
  10104f:	e8 d8 1c 00 00       	call   102d2c <abort>
  101054:	83 c4 10             	add    $0x10,%esp
  101057:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  10105e:	eb 76                	jmp    1010d6 <scrollScreen+0xa1>
  101060:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  101067:	eb 61                	jmp    1010ca <scrollScreen+0x95>
  101069:	a1 28 4d 10 00       	mov    0x104d28,%eax
  10106e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  101071:	75 0a                	jne    10107d <scrollScreen+0x48>
  101073:	a1 2c 4d 10 00       	mov    0x104d2c,%eax
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
  1010d6:	a1 28 4d 10 00       	mov    0x104d28,%eax
  1010db:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  1010de:	7e 80                	jle    101060 <scrollScreen+0x2b>
  1010e0:	a1 28 4d 10 00       	mov    0x104d28,%eax
  1010e5:	48                   	dec    %eax
  1010e6:	a3 28 4d 10 00       	mov    %eax,0x104d28
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
  10111c:	68 cf 2d 10 00       	push   $0x102dcf
  101121:	e8 06 1c 00 00       	call   102d2c <abort>
  101126:	83 c4 10             	add    $0x10,%esp
  101129:	8b 45 08             	mov    0x8(%ebp),%eax
  10112c:	8b 40 24             	mov    0x24(%eax),%eax
  10112f:	89 c3                	mov    %eax,%ebx
  101131:	e8 8b 04 00 00       	call   1015c1 <getpid>
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
  1011d6:	83 ec 24             	sub    $0x24,%esp
  1011d9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  1011e0:	8b 45 08             	mov    0x8(%ebp),%eax
  1011e3:	8b 58 28             	mov    0x28(%eax),%ebx
  1011e6:	e8 d6 03 00 00       	call   1015c1 <getpid>
  1011eb:	c1 e0 10             	shl    $0x10,%eax
  1011ee:	01 d8                	add    %ebx,%eax
  1011f0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1011f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1011f6:	8b 40 24             	mov    0x24(%eax),%eax
  1011f9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1011fc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101203:	e9 ea 01 00 00       	jmp    1013f2 <sys_read+0x220>
  101208:	e8 a1 ff ff ff       	call   1011ae <getScancode>
  10120d:	0f b6 c0             	movzbl %al,%eax
  101210:	89 45 ec             	mov    %eax,-0x14(%ebp)
  101213:	83 7d ec 3a          	cmpl   $0x3a,-0x14(%ebp)
  101217:	75 18                	jne    101231 <sys_read+0x5f>
  101219:	a1 30 4d 10 00       	mov    0x104d30,%eax
  10121e:	83 f8 01             	cmp    $0x1,%eax
  101221:	0f 95 c0             	setne  %al
  101224:	0f b6 c0             	movzbl %al,%eax
  101227:	a3 30 4d 10 00       	mov    %eax,0x104d30
  10122c:	e9 c1 01 00 00       	jmp    1013f2 <sys_read+0x220>
  101231:	83 7d ec 2a          	cmpl   $0x2a,-0x14(%ebp)
  101235:	74 06                	je     10123d <sys_read+0x6b>
  101237:	83 7d ec 36          	cmpl   $0x36,-0x14(%ebp)
  10123b:	75 0f                	jne    10124c <sys_read+0x7a>
  10123d:	c7 05 34 4d 10 00 01 	movl   $0x1,0x104d34
  101244:	00 00 00 
  101247:	e9 a6 01 00 00       	jmp    1013f2 <sys_read+0x220>
  10124c:	81 7d ec aa 00 00 00 	cmpl   $0xaa,-0x14(%ebp)
  101253:	74 09                	je     10125e <sys_read+0x8c>
  101255:	81 7d ec b6 00 00 00 	cmpl   $0xb6,-0x14(%ebp)
  10125c:	75 0f                	jne    10126d <sys_read+0x9b>
  10125e:	c7 05 34 4d 10 00 00 	movl   $0x0,0x104d34
  101265:	00 00 00 
  101268:	e9 85 01 00 00       	jmp    1013f2 <sys_read+0x220>
  10126d:	83 7d ec 7f          	cmpl   $0x7f,-0x14(%ebp)
  101271:	76 05                	jbe    101278 <sys_read+0xa6>
  101273:	e9 7a 01 00 00       	jmp    1013f2 <sys_read+0x220>
  101278:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10127b:	05 00 4b 10 00       	add    $0x104b00,%eax
  101280:	8a 00                	mov    (%eax),%al
  101282:	88 45 e3             	mov    %al,-0x1d(%ebp)
  101285:	a1 34 4d 10 00       	mov    0x104d34,%eax
  10128a:	83 f8 01             	cmp    $0x1,%eax
  10128d:	0f 85 d1 00 00 00    	jne    101364 <sys_read+0x192>
  101293:	83 7d ec 0d          	cmpl   $0xd,-0x14(%ebp)
  101297:	77 12                	ja     1012ab <sys_read+0xd9>
  101299:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10129c:	48                   	dec    %eax
  10129d:	8a 80 00 4c 10 00    	mov    0x104c00(%eax),%al
  1012a3:	88 45 e3             	mov    %al,-0x1d(%ebp)
  1012a6:	e9 b9 00 00 00       	jmp    101364 <sys_read+0x192>
  1012ab:	8a 45 e3             	mov    -0x1d(%ebp),%al
  1012ae:	3c 60                	cmp    $0x60,%al
  1012b0:	7e 1e                	jle    1012d0 <sys_read+0xfe>
  1012b2:	8a 45 e3             	mov    -0x1d(%ebp),%al
  1012b5:	3c 7a                	cmp    $0x7a,%al
  1012b7:	7f 17                	jg     1012d0 <sys_read+0xfe>
  1012b9:	a1 30 4d 10 00       	mov    0x104d30,%eax
  1012be:	85 c0                	test   %eax,%eax
  1012c0:	75 0e                	jne    1012d0 <sys_read+0xfe>
  1012c2:	8a 45 e3             	mov    -0x1d(%ebp),%al
  1012c5:	83 e8 20             	sub    $0x20,%eax
  1012c8:	88 45 e3             	mov    %al,-0x1d(%ebp)
  1012cb:	e9 94 00 00 00       	jmp    101364 <sys_read+0x192>
  1012d0:	8a 45 e3             	mov    -0x1d(%ebp),%al
  1012d3:	3c 2b                	cmp    $0x2b,%al
  1012d5:	7e 12                	jle    1012e9 <sys_read+0x117>
  1012d7:	8a 45 e3             	mov    -0x1d(%ebp),%al
  1012da:	3c 2f                	cmp    $0x2f,%al
  1012dc:	7f 0b                	jg     1012e9 <sys_read+0x117>
  1012de:	8a 45 e3             	mov    -0x1d(%ebp),%al
  1012e1:	83 c0 10             	add    $0x10,%eax
  1012e4:	88 45 e3             	mov    %al,-0x1d(%ebp)
  1012e7:	eb 7b                	jmp    101364 <sys_read+0x192>
  1012e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1012ec:	83 f8 28             	cmp    $0x28,%eax
  1012ef:	74 10                	je     101301 <sys_read+0x12f>
  1012f1:	83 f8 29             	cmp    $0x29,%eax
  1012f4:	74 11                	je     101307 <sys_read+0x135>
  1012f6:	83 f8 27             	cmp    $0x27,%eax
  1012f9:	75 12                	jne    10130d <sys_read+0x13b>
  1012fb:	c6 45 f3 3a          	movb   $0x3a,-0xd(%ebp)
  1012ff:	eb 5d                	jmp    10135e <sys_read+0x18c>
  101301:	c6 45 f3 22          	movb   $0x22,-0xd(%ebp)
  101305:	eb 57                	jmp    10135e <sys_read+0x18c>
  101307:	c6 45 f3 7e          	movb   $0x7e,-0xd(%ebp)
  10130b:	eb 51                	jmp    10135e <sys_read+0x18c>
  10130d:	83 ec 0c             	sub    $0xc,%esp
  101310:	68 ec 2d 10 00       	push   $0x102dec
  101315:	e8 56 17 00 00       	call   102a70 <printk>
  10131a:	83 c4 10             	add    $0x10,%esp
  10131d:	83 ec 0c             	sub    $0xc,%esp
  101320:	ff 75 ec             	pushl  -0x14(%ebp)
  101323:	68 3c 2e 10 00       	push   $0x102e3c
  101328:	6a 57                	push   $0x57
  10132a:	68 f2 2d 10 00       	push   $0x102df2
  10132f:	68 0d 2e 10 00       	push   $0x102e0d
  101334:	e8 37 17 00 00       	call   102a70 <printk>
  101339:	83 c4 20             	add    $0x20,%esp
  10133c:	83 ec 0c             	sub    $0xc,%esp
  10133f:	68 22 2e 10 00       	push   $0x102e22
  101344:	e8 27 17 00 00       	call   102a70 <printk>
  101349:	83 c4 10             	add    $0x10,%esp
  10134c:	83 ec 08             	sub    $0x8,%esp
  10134f:	6a 58                	push   $0x58
  101351:	68 f2 2d 10 00       	push   $0x102df2
  101356:	e8 d1 19 00 00       	call   102d2c <abort>
  10135b:	83 c4 10             	add    $0x10,%esp
  10135e:	8a 45 f3             	mov    -0xd(%ebp),%al
  101361:	88 45 e3             	mov    %al,-0x1d(%ebp)
  101364:	a1 30 4d 10 00       	mov    0x104d30,%eax
  101369:	83 f8 01             	cmp    $0x1,%eax
  10136c:	75 20                	jne    10138e <sys_read+0x1bc>
  10136e:	8a 45 e3             	mov    -0x1d(%ebp),%al
  101371:	3c 60                	cmp    $0x60,%al
  101373:	7e 19                	jle    10138e <sys_read+0x1bc>
  101375:	8a 45 e3             	mov    -0x1d(%ebp),%al
  101378:	3c 7a                	cmp    $0x7a,%al
  10137a:	7f 12                	jg     10138e <sys_read+0x1bc>
  10137c:	a1 34 4d 10 00       	mov    0x104d34,%eax
  101381:	85 c0                	test   %eax,%eax
  101383:	75 09                	jne    10138e <sys_read+0x1bc>
  101385:	8a 45 e3             	mov    -0x1d(%ebp),%al
  101388:	83 e8 20             	sub    $0x20,%eax
  10138b:	88 45 e3             	mov    %al,-0x1d(%ebp)
  10138e:	83 ec 0c             	sub    $0xc,%esp
  101391:	68 ec 2d 10 00       	push   $0x102dec
  101396:	e8 d5 16 00 00       	call   102a70 <printk>
  10139b:	83 c4 10             	add    $0x10,%esp
  10139e:	8a 45 e3             	mov    -0x1d(%ebp),%al
  1013a1:	0f be c0             	movsbl %al,%eax
  1013a4:	83 ec 0c             	sub    $0xc,%esp
  1013a7:	50                   	push   %eax
  1013a8:	68 3c 2e 10 00       	push   $0x102e3c
  1013ad:	6a 63                	push   $0x63
  1013af:	68 f2 2d 10 00       	push   $0x102df2
  1013b4:	68 28 2e 10 00       	push   $0x102e28
  1013b9:	e8 b2 16 00 00       	call   102a70 <printk>
  1013be:	83 c4 20             	add    $0x20,%esp
  1013c1:	83 ec 0c             	sub    $0xc,%esp
  1013c4:	68 22 2e 10 00       	push   $0x102e22
  1013c9:	e8 a2 16 00 00       	call   102a70 <printk>
  1013ce:	83 c4 10             	add    $0x10,%esp
  1013d1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1013d4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1013d7:	01 c2                	add    %eax,%edx
  1013d9:	8a 45 e3             	mov    -0x1d(%ebp),%al
  1013dc:	88 02                	mov    %al,(%edx)
  1013de:	ff 45 f4             	incl   -0xc(%ebp)
  1013e1:	83 ec 08             	sub    $0x8,%esp
  1013e4:	6a 01                	push   $0x1
  1013e6:	8d 45 e3             	lea    -0x1d(%ebp),%eax
  1013e9:	50                   	push   %eax
  1013ea:	e8 a6 fa ff ff       	call   100e95 <printkernel>
  1013ef:	83 c4 10             	add    $0x10,%esp
  1013f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1013f5:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
  1013f8:	7d 0b                	jge    101405 <sys_read+0x233>
  1013fa:	8a 45 e3             	mov    -0x1d(%ebp),%al
  1013fd:	3c 0a                	cmp    $0xa,%al
  1013ff:	0f 85 03 fe ff ff    	jne    101208 <sys_read+0x36>
  101405:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101408:	8d 50 ff             	lea    -0x1(%eax),%edx
  10140b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10140e:	01 d0                	add    %edx,%eax
  101410:	c6 00 00             	movb   $0x0,(%eax)
  101413:	8b 45 08             	mov    0x8(%ebp),%eax
  101416:	8b 58 28             	mov    0x28(%eax),%ebx
  101419:	e8 a3 01 00 00       	call   1015c1 <getpid>
  10141e:	c1 e0 10             	shl    $0x10,%eax
  101421:	01 d8                	add    %ebx,%eax
  101423:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101426:	c9                   	leave  
  101427:	c3                   	ret    

00101428 <inByte>:
  101428:	55                   	push   %ebp
  101429:	89 e5                	mov    %esp,%ebp
  10142b:	83 ec 14             	sub    $0x14,%esp
  10142e:	8b 45 08             	mov    0x8(%ebp),%eax
  101431:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  101435:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101438:	89 c2                	mov    %eax,%edx
  10143a:	ec                   	in     (%dx),%al
  10143b:	88 45 ff             	mov    %al,-0x1(%ebp)
  10143e:	8a 45 ff             	mov    -0x1(%ebp),%al
  101441:	c9                   	leave  
  101442:	c3                   	ret    

00101443 <outByte>:
  101443:	55                   	push   %ebp
  101444:	89 e5                	mov    %esp,%ebp
  101446:	83 ec 08             	sub    $0x8,%esp
  101449:	8b 45 08             	mov    0x8(%ebp),%eax
  10144c:	8b 55 0c             	mov    0xc(%ebp),%edx
  10144f:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  101453:	88 55 f8             	mov    %dl,-0x8(%ebp)
  101456:	8a 45 f8             	mov    -0x8(%ebp),%al
  101459:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10145c:	ee                   	out    %al,(%dx)
  10145d:	90                   	nop
  10145e:	c9                   	leave  
  10145f:	c3                   	ret    

00101460 <initSerial>:
  101460:	55                   	push   %ebp
  101461:	89 e5                	mov    %esp,%ebp
  101463:	6a 00                	push   $0x0
  101465:	68 f9 03 00 00       	push   $0x3f9
  10146a:	e8 d4 ff ff ff       	call   101443 <outByte>
  10146f:	83 c4 08             	add    $0x8,%esp
  101472:	6a 80                	push   $0xffffff80
  101474:	68 fb 03 00 00       	push   $0x3fb
  101479:	e8 c5 ff ff ff       	call   101443 <outByte>
  10147e:	83 c4 08             	add    $0x8,%esp
  101481:	6a 01                	push   $0x1
  101483:	68 f8 03 00 00       	push   $0x3f8
  101488:	e8 b6 ff ff ff       	call   101443 <outByte>
  10148d:	83 c4 08             	add    $0x8,%esp
  101490:	6a 00                	push   $0x0
  101492:	68 f9 03 00 00       	push   $0x3f9
  101497:	e8 a7 ff ff ff       	call   101443 <outByte>
  10149c:	83 c4 08             	add    $0x8,%esp
  10149f:	6a 03                	push   $0x3
  1014a1:	68 fb 03 00 00       	push   $0x3fb
  1014a6:	e8 98 ff ff ff       	call   101443 <outByte>
  1014ab:	83 c4 08             	add    $0x8,%esp
  1014ae:	6a c7                	push   $0xffffffc7
  1014b0:	68 fa 03 00 00       	push   $0x3fa
  1014b5:	e8 89 ff ff ff       	call   101443 <outByte>
  1014ba:	83 c4 08             	add    $0x8,%esp
  1014bd:	6a 0b                	push   $0xb
  1014bf:	68 fc 03 00 00       	push   $0x3fc
  1014c4:	e8 7a ff ff ff       	call   101443 <outByte>
  1014c9:	83 c4 08             	add    $0x8,%esp
  1014cc:	90                   	nop
  1014cd:	c9                   	leave  
  1014ce:	c3                   	ret    

001014cf <serialIdle>:
  1014cf:	55                   	push   %ebp
  1014d0:	89 e5                	mov    %esp,%ebp
  1014d2:	68 fd 03 00 00       	push   $0x3fd
  1014d7:	e8 4c ff ff ff       	call   101428 <inByte>
  1014dc:	83 c4 04             	add    $0x4,%esp
  1014df:	0f b6 c0             	movzbl %al,%eax
  1014e2:	83 e0 20             	and    $0x20,%eax
  1014e5:	85 c0                	test   %eax,%eax
  1014e7:	0f 95 c0             	setne  %al
  1014ea:	0f b6 c0             	movzbl %al,%eax
  1014ed:	c9                   	leave  
  1014ee:	c3                   	ret    

001014ef <putChar>:
  1014ef:	55                   	push   %ebp
  1014f0:	89 e5                	mov    %esp,%ebp
  1014f2:	83 ec 04             	sub    $0x4,%esp
  1014f5:	8b 45 08             	mov    0x8(%ebp),%eax
  1014f8:	88 45 fc             	mov    %al,-0x4(%ebp)
  1014fb:	90                   	nop
  1014fc:	e8 ce ff ff ff       	call   1014cf <serialIdle>
  101501:	83 f8 01             	cmp    $0x1,%eax
  101504:	75 f6                	jne    1014fc <putChar+0xd>
  101506:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
  10150a:	50                   	push   %eax
  10150b:	68 f8 03 00 00       	push   $0x3f8
  101510:	e8 2e ff ff ff       	call   101443 <outByte>
  101515:	83 c4 08             	add    $0x8,%esp
  101518:	90                   	nop
  101519:	c9                   	leave  
  10151a:	c3                   	ret    

0010151b <waitForInterrupt>:
  10151b:	55                   	push   %ebp
  10151c:	89 e5                	mov    %esp,%ebp
  10151e:	f4                   	hlt    
  10151f:	90                   	nop
  101520:	5d                   	pop    %ebp
  101521:	c3                   	ret    

00101522 <IDLE>:
  101522:	55                   	push   %ebp
  101523:	89 e5                	mov    %esp,%ebp
  101525:	e8 f1 ff ff ff       	call   10151b <waitForInterrupt>
  10152a:	eb f9                	jmp    101525 <IDLE+0x3>

0010152c <put_into_running>:
  10152c:	55                   	push   %ebp
  10152d:	89 e5                	mov    %esp,%ebp
  10152f:	83 ec 08             	sub    $0x8,%esp
  101532:	a1 c0 55 10 00       	mov    0x1055c0,%eax
  101537:	39 45 08             	cmp    %eax,0x8(%ebp)
  10153a:	75 07                	jne    101543 <put_into_running+0x17>
  10153c:	b8 01 00 00 00       	mov    $0x1,%eax
  101541:	eb 3e                	jmp    101581 <put_into_running+0x55>
  101543:	8b 45 08             	mov    0x8(%ebp),%eax
  101546:	a3 c0 55 10 00       	mov    %eax,0x1055c0
  10154b:	e8 71 00 00 00       	call   1015c1 <getpid>
  101550:	89 c2                	mov    %eax,%edx
  101552:	89 d0                	mov    %edx,%eax
  101554:	c1 e0 07             	shl    $0x7,%eax
  101557:	01 d0                	add    %edx,%eax
  101559:	01 c0                	add    %eax,%eax
  10155b:	01 d0                	add    %edx,%eax
  10155d:	01 c0                	add    %eax,%eax
  10155f:	01 d0                	add    %edx,%eax
  101561:	c1 e0 04             	shl    $0x4,%eax
  101564:	05 fc 1f 00 00       	add    $0x1ffc,%eax
  101569:	05 e0 55 10 00       	add    $0x1055e0,%eax
  10156e:	83 ec 08             	sub    $0x8,%esp
  101571:	50                   	push   %eax
  101572:	6a 10                	push   $0x10
  101574:	e8 a5 ee ff ff       	call   10041e <change_tss>
  101579:	83 c4 10             	add    $0x10,%esp
  10157c:	b8 01 00 00 00       	mov    $0x1,%eax
  101581:	c9                   	leave  
  101582:	c3                   	ret    

00101583 <apply_new_pid>:
  101583:	55                   	push   %ebp
  101584:	89 e5                	mov    %esp,%ebp
  101586:	83 ec 18             	sub    $0x18,%esp
  101589:	8b 15 38 4d 10 00    	mov    0x104d38,%edx
  10158f:	a1 38 4d 10 00       	mov    0x104d38,%eax
  101594:	83 ec 08             	sub    $0x8,%esp
  101597:	52                   	push   %edx
  101598:	50                   	push   %eax
  101599:	e8 21 04 00 00       	call   1019bf <get_from>
  10159e:	83 c4 10             	add    $0x10,%esp
  1015a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1015a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1015a7:	c9                   	leave  
  1015a8:	c3                   	ret    

001015a9 <put_into_empty>:
  1015a9:	55                   	push   %ebp
  1015aa:	89 e5                	mov    %esp,%ebp
  1015ac:	83 ec 08             	sub    $0x8,%esp
  1015af:	83 ec 08             	sub    $0x8,%esp
  1015b2:	ff 75 08             	pushl  0x8(%ebp)
  1015b5:	6a 03                	push   $0x3
  1015b7:	e8 fa 01 00 00       	call   1017b6 <put_into>
  1015bc:	83 c4 10             	add    $0x10,%esp
  1015bf:	c9                   	leave  
  1015c0:	c3                   	ret    

001015c1 <getpid>:
  1015c1:	55                   	push   %ebp
  1015c2:	89 e5                	mov    %esp,%ebp
  1015c4:	a1 c0 55 10 00       	mov    0x1055c0,%eax
  1015c9:	5d                   	pop    %ebp
  1015ca:	c3                   	ret    

001015cb <getrunnable>:
  1015cb:	55                   	push   %ebp
  1015cc:	89 e5                	mov    %esp,%ebp
  1015ce:	a1 18 4c 10 00       	mov    0x104c18,%eax
  1015d3:	5d                   	pop    %ebp
  1015d4:	c3                   	ret    

001015d5 <getblocked>:
  1015d5:	55                   	push   %ebp
  1015d6:	89 e5                	mov    %esp,%ebp
  1015d8:	a1 1c 4c 10 00       	mov    0x104c1c,%eax
  1015dd:	5d                   	pop    %ebp
  1015de:	c3                   	ret    

001015df <get_from_runnable>:
  1015df:	55                   	push   %ebp
  1015e0:	89 e5                	mov    %esp,%ebp
  1015e2:	83 ec 08             	sub    $0x8,%esp
  1015e5:	8b 15 18 4c 10 00    	mov    0x104c18,%edx
  1015eb:	a1 18 4c 10 00       	mov    0x104c18,%eax
  1015f0:	83 ec 08             	sub    $0x8,%esp
  1015f3:	52                   	push   %edx
  1015f4:	50                   	push   %eax
  1015f5:	e8 c5 03 00 00       	call   1019bf <get_from>
  1015fa:	83 c4 10             	add    $0x10,%esp
  1015fd:	c9                   	leave  
  1015fe:	c3                   	ret    

001015ff <put_into_runnable>:
  1015ff:	55                   	push   %ebp
  101600:	89 e5                	mov    %esp,%ebp
  101602:	57                   	push   %edi
  101603:	56                   	push   %esi
  101604:	53                   	push   %ebx
  101605:	83 ec 0c             	sub    $0xc,%esp
  101608:	8b 55 08             	mov    0x8(%ebp),%edx
  10160b:	89 d0                	mov    %edx,%eax
  10160d:	c1 e0 07             	shl    $0x7,%eax
  101610:	01 d0                	add    %edx,%eax
  101612:	01 c0                	add    %eax,%eax
  101614:	01 d0                	add    %edx,%eax
  101616:	01 c0                	add    %eax,%eax
  101618:	01 d0                	add    %edx,%eax
  10161a:	c1 e0 04             	shl    $0x4,%eax
  10161d:	8d 90 e0 75 10 00    	lea    0x1075e0(%eax),%edx
  101623:	8b 45 0c             	mov    0xc(%ebp),%eax
  101626:	89 c3                	mov    %eax,%ebx
  101628:	b8 13 00 00 00       	mov    $0x13,%eax
  10162d:	89 d7                	mov    %edx,%edi
  10162f:	89 de                	mov    %ebx,%esi
  101631:	89 c1                	mov    %eax,%ecx
  101633:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101635:	8b 0d c8 55 10 00    	mov    0x1055c8,%ecx
  10163b:	8b 55 08             	mov    0x8(%ebp),%edx
  10163e:	89 d0                	mov    %edx,%eax
  101640:	c1 e0 07             	shl    $0x7,%eax
  101643:	01 d0                	add    %edx,%eax
  101645:	01 c0                	add    %eax,%eax
  101647:	01 d0                	add    %edx,%eax
  101649:	01 c0                	add    %eax,%eax
  10164b:	01 d0                	add    %edx,%eax
  10164d:	c1 e0 04             	shl    $0x4,%eax
  101650:	05 30 76 10 00       	add    $0x107630,%eax
  101655:	89 08                	mov    %ecx,(%eax)
  101657:	8b 55 08             	mov    0x8(%ebp),%edx
  10165a:	89 d0                	mov    %edx,%eax
  10165c:	c1 e0 07             	shl    $0x7,%eax
  10165f:	01 d0                	add    %edx,%eax
  101661:	01 c0                	add    %eax,%eax
  101663:	01 d0                	add    %edx,%eax
  101665:	01 c0                	add    %eax,%eax
  101667:	01 d0                	add    %edx,%eax
  101669:	c1 e0 04             	shl    $0x4,%eax
  10166c:	05 2c 76 10 00       	add    $0x10762c,%eax
  101671:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  101677:	83 ec 08             	sub    $0x8,%esp
  10167a:	ff 75 08             	pushl  0x8(%ebp)
  10167d:	6a 01                	push   $0x1
  10167f:	e8 32 01 00 00       	call   1017b6 <put_into>
  101684:	83 c4 10             	add    $0x10,%esp
  101687:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10168a:	5b                   	pop    %ebx
  10168b:	5e                   	pop    %esi
  10168c:	5f                   	pop    %edi
  10168d:	5d                   	pop    %ebp
  10168e:	c3                   	ret    

0010168f <check_block>:
  10168f:	55                   	push   %ebp
  101690:	89 e5                	mov    %esp,%ebp
  101692:	83 ec 18             	sub    $0x18,%esp
  101695:	a1 1c 4c 10 00       	mov    0x104c1c,%eax
  10169a:	83 f8 ff             	cmp    $0xffffffff,%eax
  10169d:	75 0a                	jne    1016a9 <check_block+0x1a>
  10169f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1016a4:	e9 0b 01 00 00       	jmp    1017b4 <check_block+0x125>
  1016a9:	a1 1c 4c 10 00       	mov    0x104c1c,%eax
  1016ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1016b1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  1016b8:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1016bb:	89 d0                	mov    %edx,%eax
  1016bd:	c1 e0 07             	shl    $0x7,%eax
  1016c0:	01 d0                	add    %edx,%eax
  1016c2:	01 c0                	add    %eax,%eax
  1016c4:	01 d0                	add    %edx,%eax
  1016c6:	01 c0                	add    %eax,%eax
  1016c8:	01 d0                	add    %edx,%eax
  1016ca:	c1 e0 04             	shl    $0x4,%eax
  1016cd:	05 2c 76 10 00       	add    $0x10762c,%eax
  1016d2:	8b 00                	mov    (%eax),%eax
  1016d4:	85 c0                	test   %eax,%eax
  1016d6:	0f 85 9c 00 00 00    	jne    101778 <check_block+0xe9>
  1016dc:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1016df:	89 d0                	mov    %edx,%eax
  1016e1:	c1 e0 07             	shl    $0x7,%eax
  1016e4:	01 d0                	add    %edx,%eax
  1016e6:	01 c0                	add    %eax,%eax
  1016e8:	01 d0                	add    %edx,%eax
  1016ea:	01 c0                	add    %eax,%eax
  1016ec:	01 d0                	add    %edx,%eax
  1016ee:	c1 e0 04             	shl    $0x4,%eax
  1016f1:	05 34 76 10 00       	add    $0x107634,%eax
  1016f6:	8b 00                	mov    (%eax),%eax
  1016f8:	85 c0                	test   %eax,%eax
  1016fa:	7f 7c                	jg     101778 <check_block+0xe9>
  1016fc:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1016ff:	89 d0                	mov    %edx,%eax
  101701:	c1 e0 07             	shl    $0x7,%eax
  101704:	01 d0                	add    %edx,%eax
  101706:	01 c0                	add    %eax,%eax
  101708:	01 d0                	add    %edx,%eax
  10170a:	01 c0                	add    %eax,%eax
  10170c:	01 d0                	add    %edx,%eax
  10170e:	c1 e0 04             	shl    $0x4,%eax
  101711:	05 40 76 10 00       	add    $0x107640,%eax
  101716:	8b 00                	mov    (%eax),%eax
  101718:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10171b:	83 ec 0c             	sub    $0xc,%esp
  10171e:	ff 75 f4             	pushl  -0xc(%ebp)
  101721:	e8 68 04 00 00       	call   101b8e <get_from_block>
  101726:	83 c4 10             	add    $0x10,%esp
  101729:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10172c:	89 d0                	mov    %edx,%eax
  10172e:	c1 e0 07             	shl    $0x7,%eax
  101731:	01 d0                	add    %edx,%eax
  101733:	01 c0                	add    %eax,%eax
  101735:	01 d0                	add    %edx,%eax
  101737:	01 c0                	add    %eax,%eax
  101739:	01 d0                	add    %edx,%eax
  10173b:	c1 e0 04             	shl    $0x4,%eax
  10173e:	05 00 20 00 00       	add    $0x2000,%eax
  101743:	05 e0 55 10 00       	add    $0x1055e0,%eax
  101748:	83 ec 08             	sub    $0x8,%esp
  10174b:	50                   	push   %eax
  10174c:	ff 75 f4             	pushl  -0xc(%ebp)
  10174f:	e8 ab fe ff ff       	call   1015ff <put_into_runnable>
  101754:	83 c4 10             	add    $0x10,%esp
  101757:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10175a:	89 d0                	mov    %edx,%eax
  10175c:	c1 e0 07             	shl    $0x7,%eax
  10175f:	01 d0                	add    %edx,%eax
  101761:	01 c0                	add    %eax,%eax
  101763:	01 d0                	add    %edx,%eax
  101765:	01 c0                	add    %eax,%eax
  101767:	01 d0                	add    %edx,%eax
  101769:	c1 e0 04             	shl    $0x4,%eax
  10176c:	05 40 76 10 00       	add    $0x107640,%eax
  101771:	8b 00                	mov    (%eax),%eax
  101773:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101776:	eb 1f                	jmp    101797 <check_block+0x108>
  101778:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10177b:	89 d0                	mov    %edx,%eax
  10177d:	c1 e0 07             	shl    $0x7,%eax
  101780:	01 d0                	add    %edx,%eax
  101782:	01 c0                	add    %eax,%eax
  101784:	01 d0                	add    %edx,%eax
  101786:	01 c0                	add    %eax,%eax
  101788:	01 d0                	add    %edx,%eax
  10178a:	c1 e0 04             	shl    $0x4,%eax
  10178d:	05 40 76 10 00       	add    $0x107640,%eax
  101792:	8b 00                	mov    (%eax),%eax
  101794:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101797:	a1 1c 4c 10 00       	mov    0x104c1c,%eax
  10179c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  10179f:	74 0e                	je     1017af <check_block+0x120>
  1017a1:	a1 1c 4c 10 00       	mov    0x104c1c,%eax
  1017a6:	83 f8 ff             	cmp    $0xffffffff,%eax
  1017a9:	0f 85 09 ff ff ff    	jne    1016b8 <check_block+0x29>
  1017af:	b8 01 00 00 00       	mov    $0x1,%eax
  1017b4:	c9                   	leave  
  1017b5:	c3                   	ret    

001017b6 <put_into>:
  1017b6:	55                   	push   %ebp
  1017b7:	89 e5                	mov    %esp,%ebp
  1017b9:	83 ec 18             	sub    $0x18,%esp
  1017bc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1017c3:	8b 45 08             	mov    0x8(%ebp),%eax
  1017c6:	83 f8 01             	cmp    $0x1,%eax
  1017c9:	74 14                	je     1017df <put_into+0x29>
  1017cb:	83 f8 03             	cmp    $0x3,%eax
  1017ce:	74 06                	je     1017d6 <put_into+0x20>
  1017d0:	85 c0                	test   %eax,%eax
  1017d2:	74 14                	je     1017e8 <put_into+0x32>
  1017d4:	eb 1b                	jmp    1017f1 <put_into+0x3b>
  1017d6:	c7 45 f4 38 4d 10 00 	movl   $0x104d38,-0xc(%ebp)
  1017dd:	eb 2e                	jmp    10180d <put_into+0x57>
  1017df:	c7 45 f4 18 4c 10 00 	movl   $0x104c18,-0xc(%ebp)
  1017e6:	eb 25                	jmp    10180d <put_into+0x57>
  1017e8:	c7 45 f4 1c 4c 10 00 	movl   $0x104c1c,-0xc(%ebp)
  1017ef:	eb 1c                	jmp    10180d <put_into+0x57>
  1017f1:	83 ec 08             	sub    $0x8,%esp
  1017f4:	6a 5f                	push   $0x5f
  1017f6:	68 48 2e 10 00       	push   $0x102e48
  1017fb:	e8 2c 15 00 00       	call   102d2c <abort>
  101800:	83 c4 10             	add    $0x10,%esp
  101803:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101808:	e9 1e 01 00 00       	jmp    10192b <put_into+0x175>
  10180d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101810:	8b 00                	mov    (%eax),%eax
  101812:	83 f8 ff             	cmp    $0xffffffff,%eax
  101815:	75 57                	jne    10186e <put_into+0xb8>
  101817:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10181a:	8b 55 0c             	mov    0xc(%ebp),%edx
  10181d:	89 10                	mov    %edx,(%eax)
  10181f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101822:	8b 10                	mov    (%eax),%edx
  101824:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101827:	8b 00                	mov    (%eax),%eax
  101829:	89 c1                	mov    %eax,%ecx
  10182b:	89 d0                	mov    %edx,%eax
  10182d:	c1 e0 07             	shl    $0x7,%eax
  101830:	01 d0                	add    %edx,%eax
  101832:	01 c0                	add    %eax,%eax
  101834:	01 d0                	add    %edx,%eax
  101836:	01 c0                	add    %eax,%eax
  101838:	01 d0                	add    %edx,%eax
  10183a:	c1 e0 04             	shl    $0x4,%eax
  10183d:	05 40 76 10 00       	add    $0x107640,%eax
  101842:	89 08                	mov    %ecx,(%eax)
  101844:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101847:	8b 10                	mov    (%eax),%edx
  101849:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10184c:	8b 00                	mov    (%eax),%eax
  10184e:	89 c1                	mov    %eax,%ecx
  101850:	89 d0                	mov    %edx,%eax
  101852:	c1 e0 07             	shl    $0x7,%eax
  101855:	01 d0                	add    %edx,%eax
  101857:	01 c0                	add    %eax,%eax
  101859:	01 d0                	add    %edx,%eax
  10185b:	01 c0                	add    %eax,%eax
  10185d:	01 d0                	add    %edx,%eax
  10185f:	c1 e0 04             	shl    $0x4,%eax
  101862:	05 3c 76 10 00       	add    $0x10763c,%eax
  101867:	89 08                	mov    %ecx,(%eax)
  101869:	e9 b8 00 00 00       	jmp    101926 <put_into+0x170>
  10186e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101871:	8b 10                	mov    (%eax),%edx
  101873:	89 d0                	mov    %edx,%eax
  101875:	c1 e0 07             	shl    $0x7,%eax
  101878:	01 d0                	add    %edx,%eax
  10187a:	01 c0                	add    %eax,%eax
  10187c:	01 d0                	add    %edx,%eax
  10187e:	01 c0                	add    %eax,%eax
  101880:	01 d0                	add    %edx,%eax
  101882:	c1 e0 04             	shl    $0x4,%eax
  101885:	05 3c 76 10 00       	add    $0x10763c,%eax
  10188a:	8b 10                	mov    (%eax),%edx
  10188c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10188f:	89 d0                	mov    %edx,%eax
  101891:	c1 e0 07             	shl    $0x7,%eax
  101894:	01 d0                	add    %edx,%eax
  101896:	01 c0                	add    %eax,%eax
  101898:	01 d0                	add    %edx,%eax
  10189a:	01 c0                	add    %eax,%eax
  10189c:	01 d0                	add    %edx,%eax
  10189e:	c1 e0 04             	shl    $0x4,%eax
  1018a1:	05 40 76 10 00       	add    $0x107640,%eax
  1018a6:	89 08                	mov    %ecx,(%eax)
  1018a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018ab:	8b 10                	mov    (%eax),%edx
  1018ad:	89 d0                	mov    %edx,%eax
  1018af:	c1 e0 07             	shl    $0x7,%eax
  1018b2:	01 d0                	add    %edx,%eax
  1018b4:	01 c0                	add    %eax,%eax
  1018b6:	01 d0                	add    %edx,%eax
  1018b8:	01 c0                	add    %eax,%eax
  1018ba:	01 d0                	add    %edx,%eax
  1018bc:	c1 e0 04             	shl    $0x4,%eax
  1018bf:	05 3c 76 10 00       	add    $0x10763c,%eax
  1018c4:	8b 08                	mov    (%eax),%ecx
  1018c6:	8b 55 0c             	mov    0xc(%ebp),%edx
  1018c9:	89 d0                	mov    %edx,%eax
  1018cb:	c1 e0 07             	shl    $0x7,%eax
  1018ce:	01 d0                	add    %edx,%eax
  1018d0:	01 c0                	add    %eax,%eax
  1018d2:	01 d0                	add    %edx,%eax
  1018d4:	01 c0                	add    %eax,%eax
  1018d6:	01 d0                	add    %edx,%eax
  1018d8:	c1 e0 04             	shl    $0x4,%eax
  1018db:	05 3c 76 10 00       	add    $0x10763c,%eax
  1018e0:	89 08                	mov    %ecx,(%eax)
  1018e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018e5:	8b 00                	mov    (%eax),%eax
  1018e7:	89 c1                	mov    %eax,%ecx
  1018e9:	8b 55 0c             	mov    0xc(%ebp),%edx
  1018ec:	89 d0                	mov    %edx,%eax
  1018ee:	c1 e0 07             	shl    $0x7,%eax
  1018f1:	01 d0                	add    %edx,%eax
  1018f3:	01 c0                	add    %eax,%eax
  1018f5:	01 d0                	add    %edx,%eax
  1018f7:	01 c0                	add    %eax,%eax
  1018f9:	01 d0                	add    %edx,%eax
  1018fb:	c1 e0 04             	shl    $0x4,%eax
  1018fe:	05 40 76 10 00       	add    $0x107640,%eax
  101903:	89 08                	mov    %ecx,(%eax)
  101905:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101908:	8b 10                	mov    (%eax),%edx
  10190a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10190d:	89 d0                	mov    %edx,%eax
  10190f:	c1 e0 07             	shl    $0x7,%eax
  101912:	01 d0                	add    %edx,%eax
  101914:	01 c0                	add    %eax,%eax
  101916:	01 d0                	add    %edx,%eax
  101918:	01 c0                	add    %eax,%eax
  10191a:	01 d0                	add    %edx,%eax
  10191c:	c1 e0 04             	shl    $0x4,%eax
  10191f:	05 3c 76 10 00       	add    $0x10763c,%eax
  101924:	89 08                	mov    %ecx,(%eax)
  101926:	b8 01 00 00 00       	mov    $0x1,%eax
  10192b:	c9                   	leave  
  10192c:	c3                   	ret    

0010192d <put_into_block>:
  10192d:	55                   	push   %ebp
  10192e:	89 e5                	mov    %esp,%ebp
  101930:	57                   	push   %edi
  101931:	56                   	push   %esi
  101932:	53                   	push   %ebx
  101933:	83 ec 0c             	sub    $0xc,%esp
  101936:	8b 55 08             	mov    0x8(%ebp),%edx
  101939:	89 d0                	mov    %edx,%eax
  10193b:	c1 e0 07             	shl    $0x7,%eax
  10193e:	01 d0                	add    %edx,%eax
  101940:	01 c0                	add    %eax,%eax
  101942:	01 d0                	add    %edx,%eax
  101944:	01 c0                	add    %eax,%eax
  101946:	01 d0                	add    %edx,%eax
  101948:	c1 e0 04             	shl    $0x4,%eax
  10194b:	8d 90 e0 75 10 00    	lea    0x1075e0(%eax),%edx
  101951:	8b 45 0c             	mov    0xc(%ebp),%eax
  101954:	89 c3                	mov    %eax,%ebx
  101956:	b8 13 00 00 00       	mov    $0x13,%eax
  10195b:	89 d7                	mov    %edx,%edi
  10195d:	89 de                	mov    %ebx,%esi
  10195f:	89 c1                	mov    %eax,%ecx
  101961:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101963:	8b 45 0c             	mov    0xc(%ebp),%eax
  101966:	8b 40 20             	mov    0x20(%eax),%eax
  101969:	89 c1                	mov    %eax,%ecx
  10196b:	8b 55 08             	mov    0x8(%ebp),%edx
  10196e:	89 d0                	mov    %edx,%eax
  101970:	c1 e0 07             	shl    $0x7,%eax
  101973:	01 d0                	add    %edx,%eax
  101975:	01 c0                	add    %eax,%eax
  101977:	01 d0                	add    %edx,%eax
  101979:	01 c0                	add    %eax,%eax
  10197b:	01 d0                	add    %edx,%eax
  10197d:	c1 e0 04             	shl    $0x4,%eax
  101980:	05 34 76 10 00       	add    $0x107634,%eax
  101985:	89 08                	mov    %ecx,(%eax)
  101987:	8b 55 08             	mov    0x8(%ebp),%edx
  10198a:	89 d0                	mov    %edx,%eax
  10198c:	c1 e0 07             	shl    $0x7,%eax
  10198f:	01 d0                	add    %edx,%eax
  101991:	01 c0                	add    %eax,%eax
  101993:	01 d0                	add    %edx,%eax
  101995:	01 c0                	add    %eax,%eax
  101997:	01 d0                	add    %edx,%eax
  101999:	c1 e0 04             	shl    $0x4,%eax
  10199c:	05 2c 76 10 00       	add    $0x10762c,%eax
  1019a1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  1019a7:	83 ec 08             	sub    $0x8,%esp
  1019aa:	ff 75 08             	pushl  0x8(%ebp)
  1019ad:	6a 00                	push   $0x0
  1019af:	e8 02 fe ff ff       	call   1017b6 <put_into>
  1019b4:	83 c4 10             	add    $0x10,%esp
  1019b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1019ba:	5b                   	pop    %ebx
  1019bb:	5e                   	pop    %esi
  1019bc:	5f                   	pop    %edi
  1019bd:	5d                   	pop    %ebp
  1019be:	c3                   	ret    

001019bf <get_from>:
  1019bf:	55                   	push   %ebp
  1019c0:	89 e5                	mov    %esp,%ebp
  1019c2:	83 ec 18             	sub    $0x18,%esp
  1019c5:	83 ec 08             	sub    $0x8,%esp
  1019c8:	ff 75 0c             	pushl  0xc(%ebp)
  1019cb:	ff 75 08             	pushl  0x8(%ebp)
  1019ce:	e8 f6 01 00 00       	call   101bc9 <check_is_in>
  1019d3:	83 c4 10             	add    $0x10,%esp
  1019d6:	83 f8 01             	cmp    $0x1,%eax
  1019d9:	74 61                	je     101a3c <get_from+0x7d>
  1019db:	83 ec 0c             	sub    $0xc,%esp
  1019de:	68 56 2e 10 00       	push   $0x102e56
  1019e3:	e8 88 10 00 00       	call   102a70 <printk>
  1019e8:	83 c4 10             	add    $0x10,%esp
  1019eb:	83 ec 08             	sub    $0x8,%esp
  1019ee:	ff 75 0c             	pushl  0xc(%ebp)
  1019f1:	ff 75 08             	pushl  0x8(%ebp)
  1019f4:	68 88 2e 10 00       	push   $0x102e88
  1019f9:	6a 7f                	push   $0x7f
  1019fb:	68 48 2e 10 00       	push   $0x102e48
  101a00:	68 5c 2e 10 00       	push   $0x102e5c
  101a05:	e8 66 10 00 00       	call   102a70 <printk>
  101a0a:	83 c4 20             	add    $0x20,%esp
  101a0d:	83 ec 0c             	sub    $0xc,%esp
  101a10:	68 80 2e 10 00       	push   $0x102e80
  101a15:	e8 56 10 00 00       	call   102a70 <printk>
  101a1a:	83 c4 10             	add    $0x10,%esp
  101a1d:	83 ec 08             	sub    $0x8,%esp
  101a20:	68 80 00 00 00       	push   $0x80
  101a25:	68 48 2e 10 00       	push   $0x102e48
  101a2a:	e8 fd 12 00 00       	call   102d2c <abort>
  101a2f:	83 c4 10             	add    $0x10,%esp
  101a32:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101a37:	e9 50 01 00 00       	jmp    101b8c <get_from+0x1cd>
  101a3c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101a43:	8b 55 0c             	mov    0xc(%ebp),%edx
  101a46:	89 d0                	mov    %edx,%eax
  101a48:	c1 e0 07             	shl    $0x7,%eax
  101a4b:	01 d0                	add    %edx,%eax
  101a4d:	01 c0                	add    %eax,%eax
  101a4f:	01 d0                	add    %edx,%eax
  101a51:	01 c0                	add    %eax,%eax
  101a53:	01 d0                	add    %edx,%eax
  101a55:	c1 e0 04             	shl    $0x4,%eax
  101a58:	05 2c 76 10 00       	add    $0x10762c,%eax
  101a5d:	8b 00                	mov    (%eax),%eax
  101a5f:	83 f8 01             	cmp    $0x1,%eax
  101a62:	74 14                	je     101a78 <get_from+0xb9>
  101a64:	83 f8 03             	cmp    $0x3,%eax
  101a67:	74 06                	je     101a6f <get_from+0xb0>
  101a69:	85 c0                	test   %eax,%eax
  101a6b:	74 14                	je     101a81 <get_from+0xc2>
  101a6d:	eb 1b                	jmp    101a8a <get_from+0xcb>
  101a6f:	c7 45 f4 38 4d 10 00 	movl   $0x104d38,-0xc(%ebp)
  101a76:	eb 27                	jmp    101a9f <get_from+0xe0>
  101a78:	c7 45 f4 18 4c 10 00 	movl   $0x104c18,-0xc(%ebp)
  101a7f:	eb 1e                	jmp    101a9f <get_from+0xe0>
  101a81:	c7 45 f4 1c 4c 10 00 	movl   $0x104c1c,-0xc(%ebp)
  101a88:	eb 15                	jmp    101a9f <get_from+0xe0>
  101a8a:	83 ec 08             	sub    $0x8,%esp
  101a8d:	68 92 00 00 00       	push   $0x92
  101a92:	68 48 2e 10 00       	push   $0x102e48
  101a97:	e8 90 12 00 00       	call   102d2c <abort>
  101a9c:	83 c4 10             	add    $0x10,%esp
  101a9f:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101aa5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101aa8:	8b 00                	mov    (%eax),%eax
  101aaa:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  101aad:	74 15                	je     101ac4 <get_from+0x105>
  101aaf:	83 ec 08             	sub    $0x8,%esp
  101ab2:	68 97 00 00 00       	push   $0x97
  101ab7:	68 48 2e 10 00       	push   $0x102e48
  101abc:	e8 6b 12 00 00       	call   102d2c <abort>
  101ac1:	83 c4 10             	add    $0x10,%esp
  101ac4:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  101ac8:	75 0a                	jne    101ad4 <get_from+0x115>
  101aca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101acf:	e9 b8 00 00 00       	jmp    101b8c <get_from+0x1cd>
  101ad4:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101ad7:	89 d0                	mov    %edx,%eax
  101ad9:	c1 e0 07             	shl    $0x7,%eax
  101adc:	01 d0                	add    %edx,%eax
  101ade:	01 c0                	add    %eax,%eax
  101ae0:	01 d0                	add    %edx,%eax
  101ae2:	01 c0                	add    %eax,%eax
  101ae4:	01 d0                	add    %edx,%eax
  101ae6:	c1 e0 04             	shl    $0x4,%eax
  101ae9:	05 40 76 10 00       	add    $0x107640,%eax
  101aee:	8b 10                	mov    (%eax),%edx
  101af0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101af3:	39 c2                	cmp    %eax,%edx
  101af5:	75 0e                	jne    101b05 <get_from+0x146>
  101af7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101afa:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
  101b00:	e9 84 00 00 00       	jmp    101b89 <get_from+0x1ca>
  101b05:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101b08:	89 d0                	mov    %edx,%eax
  101b0a:	c1 e0 07             	shl    $0x7,%eax
  101b0d:	01 d0                	add    %edx,%eax
  101b0f:	01 c0                	add    %eax,%eax
  101b11:	01 d0                	add    %edx,%eax
  101b13:	01 c0                	add    %eax,%eax
  101b15:	01 d0                	add    %edx,%eax
  101b17:	c1 e0 04             	shl    $0x4,%eax
  101b1a:	05 3c 76 10 00       	add    $0x10763c,%eax
  101b1f:	8b 00                	mov    (%eax),%eax
  101b21:	89 45 ec             	mov    %eax,-0x14(%ebp)
  101b24:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101b27:	89 d0                	mov    %edx,%eax
  101b29:	c1 e0 07             	shl    $0x7,%eax
  101b2c:	01 d0                	add    %edx,%eax
  101b2e:	01 c0                	add    %eax,%eax
  101b30:	01 d0                	add    %edx,%eax
  101b32:	01 c0                	add    %eax,%eax
  101b34:	01 d0                	add    %edx,%eax
  101b36:	c1 e0 04             	shl    $0x4,%eax
  101b39:	05 40 76 10 00       	add    $0x107640,%eax
  101b3e:	8b 00                	mov    (%eax),%eax
  101b40:	89 45 e8             	mov    %eax,-0x18(%ebp)
  101b43:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  101b46:	8b 55 ec             	mov    -0x14(%ebp),%edx
  101b49:	89 d0                	mov    %edx,%eax
  101b4b:	c1 e0 07             	shl    $0x7,%eax
  101b4e:	01 d0                	add    %edx,%eax
  101b50:	01 c0                	add    %eax,%eax
  101b52:	01 d0                	add    %edx,%eax
  101b54:	01 c0                	add    %eax,%eax
  101b56:	01 d0                	add    %edx,%eax
  101b58:	c1 e0 04             	shl    $0x4,%eax
  101b5b:	05 40 76 10 00       	add    $0x107640,%eax
  101b60:	89 08                	mov    %ecx,(%eax)
  101b62:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  101b65:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101b68:	89 d0                	mov    %edx,%eax
  101b6a:	c1 e0 07             	shl    $0x7,%eax
  101b6d:	01 d0                	add    %edx,%eax
  101b6f:	01 c0                	add    %eax,%eax
  101b71:	01 d0                	add    %edx,%eax
  101b73:	01 c0                	add    %eax,%eax
  101b75:	01 d0                	add    %edx,%eax
  101b77:	c1 e0 04             	shl    $0x4,%eax
  101b7a:	05 3c 76 10 00       	add    $0x10763c,%eax
  101b7f:	89 08                	mov    %ecx,(%eax)
  101b81:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b84:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101b87:	89 10                	mov    %edx,(%eax)
  101b89:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101b8c:	c9                   	leave  
  101b8d:	c3                   	ret    

00101b8e <get_from_block>:
  101b8e:	55                   	push   %ebp
  101b8f:	89 e5                	mov    %esp,%ebp
  101b91:	83 ec 08             	sub    $0x8,%esp
  101b94:	a1 1c 4c 10 00       	mov    0x104c1c,%eax
  101b99:	83 ec 08             	sub    $0x8,%esp
  101b9c:	ff 75 08             	pushl  0x8(%ebp)
  101b9f:	50                   	push   %eax
  101ba0:	e8 1a fe ff ff       	call   1019bf <get_from>
  101ba5:	83 c4 10             	add    $0x10,%esp
  101ba8:	83 f8 ff             	cmp    $0xffffffff,%eax
  101bab:	75 15                	jne    101bc2 <get_from_block+0x34>
  101bad:	83 ec 08             	sub    $0x8,%esp
  101bb0:	68 ae 00 00 00       	push   $0xae
  101bb5:	68 48 2e 10 00       	push   $0x102e48
  101bba:	e8 6d 11 00 00       	call   102d2c <abort>
  101bbf:	83 c4 10             	add    $0x10,%esp
  101bc2:	b8 01 00 00 00       	mov    $0x1,%eax
  101bc7:	c9                   	leave  
  101bc8:	c3                   	ret    

00101bc9 <check_is_in>:
  101bc9:	55                   	push   %ebp
  101bca:	89 e5                	mov    %esp,%ebp
  101bcc:	83 ec 10             	sub    $0x10,%esp
  101bcf:	8b 45 08             	mov    0x8(%ebp),%eax
  101bd2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101bd5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101bd8:	3b 45 0c             	cmp    0xc(%ebp),%eax
  101bdb:	75 07                	jne    101be4 <check_is_in+0x1b>
  101bdd:	b8 01 00 00 00       	mov    $0x1,%eax
  101be2:	eb 2c                	jmp    101c10 <check_is_in+0x47>
  101be4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101be7:	89 d0                	mov    %edx,%eax
  101be9:	c1 e0 07             	shl    $0x7,%eax
  101bec:	01 d0                	add    %edx,%eax
  101bee:	01 c0                	add    %eax,%eax
  101bf0:	01 d0                	add    %edx,%eax
  101bf2:	01 c0                	add    %eax,%eax
  101bf4:	01 d0                	add    %edx,%eax
  101bf6:	c1 e0 04             	shl    $0x4,%eax
  101bf9:	05 40 76 10 00       	add    $0x107640,%eax
  101bfe:	8b 00                	mov    (%eax),%eax
  101c00:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101c03:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101c06:	3b 45 08             	cmp    0x8(%ebp),%eax
  101c09:	75 ca                	jne    101bd5 <check_is_in+0xc>
  101c0b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101c10:	c9                   	leave  
  101c11:	c3                   	ret    

00101c12 <block_decrease>:
  101c12:	55                   	push   %ebp
  101c13:	89 e5                	mov    %esp,%ebp
  101c15:	83 ec 10             	sub    $0x10,%esp
  101c18:	a1 1c 4c 10 00       	mov    0x104c1c,%eax
  101c1d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101c20:	83 7d fc ff          	cmpl   $0xffffffff,-0x4(%ebp)
  101c24:	75 07                	jne    101c2d <block_decrease+0x1b>
  101c26:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101c2b:	eb 69                	jmp    101c96 <block_decrease+0x84>
  101c2d:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101c30:	89 d0                	mov    %edx,%eax
  101c32:	c1 e0 07             	shl    $0x7,%eax
  101c35:	01 d0                	add    %edx,%eax
  101c37:	01 c0                	add    %eax,%eax
  101c39:	01 d0                	add    %edx,%eax
  101c3b:	01 c0                	add    %eax,%eax
  101c3d:	01 d0                	add    %edx,%eax
  101c3f:	c1 e0 04             	shl    $0x4,%eax
  101c42:	05 34 76 10 00       	add    $0x107634,%eax
  101c47:	8b 00                	mov    (%eax),%eax
  101c49:	8d 48 ff             	lea    -0x1(%eax),%ecx
  101c4c:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101c4f:	89 d0                	mov    %edx,%eax
  101c51:	c1 e0 07             	shl    $0x7,%eax
  101c54:	01 d0                	add    %edx,%eax
  101c56:	01 c0                	add    %eax,%eax
  101c58:	01 d0                	add    %edx,%eax
  101c5a:	01 c0                	add    %eax,%eax
  101c5c:	01 d0                	add    %edx,%eax
  101c5e:	c1 e0 04             	shl    $0x4,%eax
  101c61:	05 34 76 10 00       	add    $0x107634,%eax
  101c66:	89 08                	mov    %ecx,(%eax)
  101c68:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101c6b:	89 d0                	mov    %edx,%eax
  101c6d:	c1 e0 07             	shl    $0x7,%eax
  101c70:	01 d0                	add    %edx,%eax
  101c72:	01 c0                	add    %eax,%eax
  101c74:	01 d0                	add    %edx,%eax
  101c76:	01 c0                	add    %eax,%eax
  101c78:	01 d0                	add    %edx,%eax
  101c7a:	c1 e0 04             	shl    $0x4,%eax
  101c7d:	05 40 76 10 00       	add    $0x107640,%eax
  101c82:	8b 00                	mov    (%eax),%eax
  101c84:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101c87:	a1 1c 4c 10 00       	mov    0x104c1c,%eax
  101c8c:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  101c8f:	75 9c                	jne    101c2d <block_decrease+0x1b>
  101c91:	b8 01 00 00 00       	mov    $0x1,%eax
  101c96:	c9                   	leave  
  101c97:	c3                   	ret    

00101c98 <init_pcb>:
  101c98:	55                   	push   %ebp
  101c99:	89 e5                	mov    %esp,%ebp
  101c9b:	83 ec 10             	sub    $0x10,%esp
  101c9e:	c7 05 c8 55 10 00 05 	movl   $0x5,0x1055c8
  101ca5:	00 00 00 
  101ca8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101caf:	e9 86 00 00 00       	jmp    101d3a <init_pcb+0xa2>
  101cb4:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  101cb7:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101cba:	89 d0                	mov    %edx,%eax
  101cbc:	c1 e0 07             	shl    $0x7,%eax
  101cbf:	01 d0                	add    %edx,%eax
  101cc1:	01 c0                	add    %eax,%eax
  101cc3:	01 d0                	add    %edx,%eax
  101cc5:	01 c0                	add    %eax,%eax
  101cc7:	01 d0                	add    %edx,%eax
  101cc9:	c1 e0 04             	shl    $0x4,%eax
  101ccc:	05 38 76 10 00       	add    $0x107638,%eax
  101cd1:	89 08                	mov    %ecx,(%eax)
  101cd3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101cd6:	48                   	dec    %eax
  101cd7:	89 c1                	mov    %eax,%ecx
  101cd9:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101cdc:	89 d0                	mov    %edx,%eax
  101cde:	c1 e0 07             	shl    $0x7,%eax
  101ce1:	01 d0                	add    %edx,%eax
  101ce3:	01 c0                	add    %eax,%eax
  101ce5:	01 d0                	add    %edx,%eax
  101ce7:	01 c0                	add    %eax,%eax
  101ce9:	01 d0                	add    %edx,%eax
  101ceb:	c1 e0 04             	shl    $0x4,%eax
  101cee:	05 3c 76 10 00       	add    $0x10763c,%eax
  101cf3:	89 08                	mov    %ecx,(%eax)
  101cf5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101cf8:	40                   	inc    %eax
  101cf9:	89 c1                	mov    %eax,%ecx
  101cfb:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101cfe:	89 d0                	mov    %edx,%eax
  101d00:	c1 e0 07             	shl    $0x7,%eax
  101d03:	01 d0                	add    %edx,%eax
  101d05:	01 c0                	add    %eax,%eax
  101d07:	01 d0                	add    %edx,%eax
  101d09:	01 c0                	add    %eax,%eax
  101d0b:	01 d0                	add    %edx,%eax
  101d0d:	c1 e0 04             	shl    $0x4,%eax
  101d10:	05 40 76 10 00       	add    $0x107640,%eax
  101d15:	89 08                	mov    %ecx,(%eax)
  101d17:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101d1a:	89 d0                	mov    %edx,%eax
  101d1c:	c1 e0 07             	shl    $0x7,%eax
  101d1f:	01 d0                	add    %edx,%eax
  101d21:	01 c0                	add    %eax,%eax
  101d23:	01 d0                	add    %edx,%eax
  101d25:	01 c0                	add    %eax,%eax
  101d27:	01 d0                	add    %edx,%eax
  101d29:	c1 e0 04             	shl    $0x4,%eax
  101d2c:	05 2c 76 10 00       	add    $0x10762c,%eax
  101d31:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  101d37:	ff 45 fc             	incl   -0x4(%ebp)
  101d3a:	81 7d fc ff 07 00 00 	cmpl   $0x7ff,-0x4(%ebp)
  101d41:	0f 8e 6d ff ff ff    	jle    101cb4 <init_pcb+0x1c>
  101d47:	c7 05 3c 76 10 00 ff 	movl   $0x7ff,0x10763c
  101d4e:	07 00 00 
  101d51:	c7 05 d0 d5 13 01 00 	movl   $0x0,0x113d5d0
  101d58:	00 00 00 
  101d5b:	90                   	nop
  101d5c:	c9                   	leave  
  101d5d:	c3                   	ret    

00101d5e <init_kernel_pcb>:
  101d5e:	55                   	push   %ebp
  101d5f:	89 e5                	mov    %esp,%ebp
  101d61:	83 ec 08             	sub    $0x8,%esp
  101d64:	e8 1a f8 ff ff       	call   101583 <apply_new_pid>
  101d69:	85 c0                	test   %eax,%eax
  101d6b:	74 15                	je     101d82 <init_kernel_pcb+0x24>
  101d6d:	83 ec 08             	sub    $0x8,%esp
  101d70:	68 e1 00 00 00       	push   $0xe1
  101d75:	68 48 2e 10 00       	push   $0x102e48
  101d7a:	e8 ad 0f 00 00       	call   102d2c <abort>
  101d7f:	83 c4 10             	add    $0x10,%esp
  101d82:	c7 05 28 76 10 00 10 	movl   $0x10,0x107628
  101d89:	00 00 00 
  101d8c:	c7 05 1c 76 10 00 08 	movl   $0x8,0x10761c
  101d93:	00 00 00 
  101d96:	c7 05 ec 75 10 00 10 	movl   $0x10,0x1075ec
  101d9d:	00 00 00 
  101da0:	c7 05 e8 75 10 00 10 	movl   $0x10,0x1075e8
  101da7:	00 00 00 
  101daa:	b8 22 15 10 00       	mov    $0x101522,%eax
  101daf:	a3 18 76 10 00       	mov    %eax,0x107618
  101db4:	c7 05 24 76 10 00 00 	movl   $0x400000,0x107624
  101dbb:	00 40 00 
  101dbe:	c7 05 2c 76 10 00 01 	movl   $0x1,0x10762c
  101dc5:	00 00 00 
  101dc8:	c7 05 30 76 10 00 04 	movl   $0x4,0x107630
  101dcf:	00 00 00 
  101dd2:	b8 01 00 00 00       	mov    $0x1,%eax
  101dd7:	c9                   	leave  
  101dd8:	c3                   	ret    

00101dd9 <make_pcb>:
  101dd9:	55                   	push   %ebp
  101dda:	89 e5                	mov    %esp,%ebp
  101ddc:	57                   	push   %edi
  101ddd:	56                   	push   %esi
  101dde:	53                   	push   %ebx
  101ddf:	8b 55 08             	mov    0x8(%ebp),%edx
  101de2:	89 d0                	mov    %edx,%eax
  101de4:	c1 e0 07             	shl    $0x7,%eax
  101de7:	01 d0                	add    %edx,%eax
  101de9:	01 c0                	add    %eax,%eax
  101deb:	01 d0                	add    %edx,%eax
  101ded:	01 c0                	add    %eax,%eax
  101def:	01 d0                	add    %edx,%eax
  101df1:	c1 e0 04             	shl    $0x4,%eax
  101df4:	8d 90 e0 75 10 00    	lea    0x1075e0(%eax),%edx
  101dfa:	8b 45 0c             	mov    0xc(%ebp),%eax
  101dfd:	89 c3                	mov    %eax,%ebx
  101dff:	b8 13 00 00 00       	mov    $0x13,%eax
  101e04:	89 d7                	mov    %edx,%edi
  101e06:	89 de                	mov    %ebx,%esi
  101e08:	89 c1                	mov    %eax,%ecx
  101e0a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101e0c:	8b 4d 10             	mov    0x10(%ebp),%ecx
  101e0f:	8b 55 08             	mov    0x8(%ebp),%edx
  101e12:	89 d0                	mov    %edx,%eax
  101e14:	c1 e0 07             	shl    $0x7,%eax
  101e17:	01 d0                	add    %edx,%eax
  101e19:	01 c0                	add    %eax,%eax
  101e1b:	01 d0                	add    %edx,%eax
  101e1d:	01 c0                	add    %eax,%eax
  101e1f:	01 d0                	add    %edx,%eax
  101e21:	c1 e0 04             	shl    $0x4,%eax
  101e24:	05 2c 76 10 00       	add    $0x10762c,%eax
  101e29:	89 08                	mov    %ecx,(%eax)
  101e2b:	8b 4d 14             	mov    0x14(%ebp),%ecx
  101e2e:	8b 55 08             	mov    0x8(%ebp),%edx
  101e31:	89 d0                	mov    %edx,%eax
  101e33:	c1 e0 07             	shl    $0x7,%eax
  101e36:	01 d0                	add    %edx,%eax
  101e38:	01 c0                	add    %eax,%eax
  101e3a:	01 d0                	add    %edx,%eax
  101e3c:	01 c0                	add    %eax,%eax
  101e3e:	01 d0                	add    %edx,%eax
  101e40:	c1 e0 04             	shl    $0x4,%eax
  101e43:	05 30 76 10 00       	add    $0x107630,%eax
  101e48:	89 08                	mov    %ecx,(%eax)
  101e4a:	8b 4d 18             	mov    0x18(%ebp),%ecx
  101e4d:	8b 55 08             	mov    0x8(%ebp),%edx
  101e50:	89 d0                	mov    %edx,%eax
  101e52:	c1 e0 07             	shl    $0x7,%eax
  101e55:	01 d0                	add    %edx,%eax
  101e57:	01 c0                	add    %eax,%eax
  101e59:	01 d0                	add    %edx,%eax
  101e5b:	01 c0                	add    %eax,%eax
  101e5d:	01 d0                	add    %edx,%eax
  101e5f:	c1 e0 04             	shl    $0x4,%eax
  101e62:	05 34 76 10 00       	add    $0x107634,%eax
  101e67:	89 08                	mov    %ecx,(%eax)
  101e69:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  101e6c:	8b 55 08             	mov    0x8(%ebp),%edx
  101e6f:	89 d0                	mov    %edx,%eax
  101e71:	c1 e0 07             	shl    $0x7,%eax
  101e74:	01 d0                	add    %edx,%eax
  101e76:	01 c0                	add    %eax,%eax
  101e78:	01 d0                	add    %edx,%eax
  101e7a:	01 c0                	add    %eax,%eax
  101e7c:	01 d0                	add    %edx,%eax
  101e7e:	c1 e0 04             	shl    $0x4,%eax
  101e81:	05 4c 76 10 00       	add    $0x10764c,%eax
  101e86:	89 08                	mov    %ecx,(%eax)
  101e88:	b8 01 00 00 00       	mov    $0x1,%eax
  101e8d:	5b                   	pop    %ebx
  101e8e:	5e                   	pop    %esi
  101e8f:	5f                   	pop    %edi
  101e90:	5d                   	pop    %ebp
  101e91:	c3                   	ret    

00101e92 <saveIdt>:
  101e92:	55                   	push   %ebp
  101e93:	89 e5                	mov    %esp,%ebp
  101e95:	8b 45 0c             	mov    0xc(%ebp),%eax
  101e98:	48                   	dec    %eax
  101e99:	66 a3 3c 4d 10 00    	mov    %ax,0x104d3c
  101e9f:	8b 45 08             	mov    0x8(%ebp),%eax
  101ea2:	66 a3 3e 4d 10 00    	mov    %ax,0x104d3e
  101ea8:	8b 45 08             	mov    0x8(%ebp),%eax
  101eab:	c1 e8 10             	shr    $0x10,%eax
  101eae:	66 a3 40 4d 10 00    	mov    %ax,0x104d40
  101eb4:	b8 3c 4d 10 00       	mov    $0x104d3c,%eax
  101eb9:	0f 01 18             	lidtl  (%eax)
  101ebc:	90                   	nop
  101ebd:	5d                   	pop    %ebp
  101ebe:	c3                   	ret    

00101ebf <setIntr>:
  101ebf:	55                   	push   %ebp
  101ec0:	89 e5                	mov    %esp,%ebp
  101ec2:	8b 45 10             	mov    0x10(%ebp),%eax
  101ec5:	8b 55 08             	mov    0x8(%ebp),%edx
  101ec8:	66 89 02             	mov    %ax,(%edx)
  101ecb:	8b 45 0c             	mov    0xc(%ebp),%eax
  101ece:	c1 e0 03             	shl    $0x3,%eax
  101ed1:	8b 55 08             	mov    0x8(%ebp),%edx
  101ed4:	66 89 42 02          	mov    %ax,0x2(%edx)
  101ed8:	8b 45 08             	mov    0x8(%ebp),%eax
  101edb:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  101edf:	8b 45 08             	mov    0x8(%ebp),%eax
  101ee2:	8a 50 05             	mov    0x5(%eax),%dl
  101ee5:	83 e2 f0             	and    $0xfffffff0,%edx
  101ee8:	83 ca 0e             	or     $0xe,%edx
  101eeb:	88 50 05             	mov    %dl,0x5(%eax)
  101eee:	8b 45 08             	mov    0x8(%ebp),%eax
  101ef1:	8a 50 05             	mov    0x5(%eax),%dl
  101ef4:	83 e2 ef             	and    $0xffffffef,%edx
  101ef7:	88 50 05             	mov    %dl,0x5(%eax)
  101efa:	8b 45 14             	mov    0x14(%ebp),%eax
  101efd:	83 e0 03             	and    $0x3,%eax
  101f00:	88 c2                	mov    %al,%dl
  101f02:	8b 45 08             	mov    0x8(%ebp),%eax
  101f05:	83 e2 03             	and    $0x3,%edx
  101f08:	88 d1                	mov    %dl,%cl
  101f0a:	c1 e1 05             	shl    $0x5,%ecx
  101f0d:	8a 50 05             	mov    0x5(%eax),%dl
  101f10:	83 e2 9f             	and    $0xffffff9f,%edx
  101f13:	09 ca                	or     %ecx,%edx
  101f15:	88 50 05             	mov    %dl,0x5(%eax)
  101f18:	8b 45 08             	mov    0x8(%ebp),%eax
  101f1b:	8a 50 05             	mov    0x5(%eax),%dl
  101f1e:	83 ca 80             	or     $0xffffff80,%edx
  101f21:	88 50 05             	mov    %dl,0x5(%eax)
  101f24:	8b 45 10             	mov    0x10(%ebp),%eax
  101f27:	c1 e8 10             	shr    $0x10,%eax
  101f2a:	8b 55 08             	mov    0x8(%ebp),%edx
  101f2d:	66 89 42 06          	mov    %ax,0x6(%edx)
  101f31:	90                   	nop
  101f32:	5d                   	pop    %ebp
  101f33:	c3                   	ret    

00101f34 <setTrap>:
  101f34:	55                   	push   %ebp
  101f35:	89 e5                	mov    %esp,%ebp
  101f37:	8b 45 10             	mov    0x10(%ebp),%eax
  101f3a:	8b 55 08             	mov    0x8(%ebp),%edx
  101f3d:	66 89 02             	mov    %ax,(%edx)
  101f40:	8b 45 0c             	mov    0xc(%ebp),%eax
  101f43:	c1 e0 03             	shl    $0x3,%eax
  101f46:	8b 55 08             	mov    0x8(%ebp),%edx
  101f49:	66 89 42 02          	mov    %ax,0x2(%edx)
  101f4d:	8b 45 08             	mov    0x8(%ebp),%eax
  101f50:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  101f54:	8b 45 08             	mov    0x8(%ebp),%eax
  101f57:	8a 50 05             	mov    0x5(%eax),%dl
  101f5a:	83 ca 0f             	or     $0xf,%edx
  101f5d:	88 50 05             	mov    %dl,0x5(%eax)
  101f60:	8b 45 08             	mov    0x8(%ebp),%eax
  101f63:	8a 50 05             	mov    0x5(%eax),%dl
  101f66:	83 e2 ef             	and    $0xffffffef,%edx
  101f69:	88 50 05             	mov    %dl,0x5(%eax)
  101f6c:	8b 45 14             	mov    0x14(%ebp),%eax
  101f6f:	83 e0 03             	and    $0x3,%eax
  101f72:	88 c2                	mov    %al,%dl
  101f74:	8b 45 08             	mov    0x8(%ebp),%eax
  101f77:	83 e2 03             	and    $0x3,%edx
  101f7a:	88 d1                	mov    %dl,%cl
  101f7c:	c1 e1 05             	shl    $0x5,%ecx
  101f7f:	8a 50 05             	mov    0x5(%eax),%dl
  101f82:	83 e2 9f             	and    $0xffffff9f,%edx
  101f85:	09 ca                	or     %ecx,%edx
  101f87:	88 50 05             	mov    %dl,0x5(%eax)
  101f8a:	8b 45 08             	mov    0x8(%ebp),%eax
  101f8d:	8a 50 05             	mov    0x5(%eax),%dl
  101f90:	83 ca 80             	or     $0xffffff80,%edx
  101f93:	88 50 05             	mov    %dl,0x5(%eax)
  101f96:	8b 45 10             	mov    0x10(%ebp),%eax
  101f99:	c1 e8 10             	shr    $0x10,%eax
  101f9c:	8b 55 08             	mov    0x8(%ebp),%edx
  101f9f:	66 89 42 06          	mov    %ax,0x6(%edx)
  101fa3:	90                   	nop
  101fa4:	5d                   	pop    %ebp
  101fa5:	c3                   	ret    

00101fa6 <initIdt>:
  101fa6:	55                   	push   %ebp
  101fa7:	89 e5                	mov    %esp,%ebp
  101fa9:	83 ec 10             	sub    $0x10,%esp
  101fac:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101fb3:	eb 21                	jmp    101fd6 <initIdt+0x30>
  101fb5:	ba 4f 2d 10 00       	mov    $0x102d4f,%edx
  101fba:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101fbd:	c1 e0 03             	shl    $0x3,%eax
  101fc0:	05 c0 d6 13 01       	add    $0x113d6c0,%eax
  101fc5:	6a 00                	push   $0x0
  101fc7:	52                   	push   %edx
  101fc8:	6a 01                	push   $0x1
  101fca:	50                   	push   %eax
  101fcb:	e8 64 ff ff ff       	call   101f34 <setTrap>
  101fd0:	83 c4 10             	add    $0x10,%esp
  101fd3:	ff 45 fc             	incl   -0x4(%ebp)
  101fd6:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  101fdd:	7e d6                	jle    101fb5 <initIdt+0xf>
  101fdf:	ba 55 2d 10 00       	mov    $0x102d55,%edx
  101fe4:	b8 28 d7 13 01       	mov    $0x113d728,%eax
  101fe9:	6a 00                	push   $0x0
  101feb:	52                   	push   %edx
  101fec:	6a 01                	push   $0x1
  101fee:	50                   	push   %eax
  101fef:	e8 40 ff ff ff       	call   101f34 <setTrap>
  101ff4:	83 c4 10             	add    $0x10,%esp
  101ff7:	ba 59 2d 10 00       	mov    $0x102d59,%edx
  101ffc:	b8 c0 da 13 01       	mov    $0x113dac0,%eax
  102001:	6a 03                	push   $0x3
  102003:	52                   	push   %edx
  102004:	6a 01                	push   $0x1
  102006:	50                   	push   %eax
  102007:	e8 b3 fe ff ff       	call   101ebf <setIntr>
  10200c:	83 c4 10             	add    $0x10,%esp
  10200f:	ba 62 2d 10 00       	mov    $0x102d62,%edx
  102014:	b8 c0 d7 13 01       	mov    $0x113d7c0,%eax
  102019:	6a 00                	push   $0x0
  10201b:	52                   	push   %edx
  10201c:	6a 01                	push   $0x1
  10201e:	50                   	push   %eax
  10201f:	e8 9b fe ff ff       	call   101ebf <setIntr>
  102024:	83 c4 10             	add    $0x10,%esp
  102027:	68 00 08 00 00       	push   $0x800
  10202c:	68 c0 d6 13 01       	push   $0x113d6c0
  102031:	e8 5c fe ff ff       	call   101e92 <saveIdt>
  102036:	83 c4 08             	add    $0x8,%esp
  102039:	90                   	nop
  10203a:	c9                   	leave  
  10203b:	c3                   	ret    

0010203c <enableInterrupt>:
  10203c:	55                   	push   %ebp
  10203d:	89 e5                	mov    %esp,%ebp
  10203f:	fb                   	sti    
  102040:	90                   	nop
  102041:	5d                   	pop    %ebp
  102042:	c3                   	ret    

00102043 <disableInterrupt>:
  102043:	55                   	push   %ebp
  102044:	89 e5                	mov    %esp,%ebp
  102046:	fa                   	cli    
  102047:	90                   	nop
  102048:	5d                   	pop    %ebp
  102049:	c3                   	ret    

0010204a <irqHandle>:
  10204a:	55                   	push   %ebp
  10204b:	89 e5                	mov    %esp,%ebp
  10204d:	57                   	push   %edi
  10204e:	56                   	push   %esi
  10204f:	53                   	push   %ebx
  102050:	83 ec 1c             	sub    $0x1c,%esp
  102053:	b8 10 00 00 00       	mov    $0x10,%eax
  102058:	89 c0                	mov    %eax,%eax
  10205a:	8e d8                	mov    %eax,%ds
  10205c:	8e e0                	mov    %eax,%fs
  10205e:	8e c0                	mov    %eax,%es
  102060:	b8 30 00 00 00       	mov    $0x30,%eax
  102065:	89 c0                	mov    %eax,%eax
  102067:	8e e8                	mov    %eax,%gs
  102069:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  102070:	89 e8                	mov    %ebp,%eax
  102072:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102075:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102078:	83 c0 08             	add    $0x8,%eax
  10207b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10207e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102081:	8b 10                	mov    (%eax),%edx
  102083:	8b 45 08             	mov    0x8(%ebp),%eax
  102086:	39 c2                	cmp    %eax,%edx
  102088:	74 12                	je     10209c <irqHandle+0x52>
  10208a:	83 ec 08             	sub    $0x8,%esp
  10208d:	6a 1e                	push   $0x1e
  10208f:	68 94 2e 10 00       	push   $0x102e94
  102094:	e8 93 0c 00 00       	call   102d2c <abort>
  102099:	83 c4 10             	add    $0x10,%esp
  10209c:	a1 c0 55 10 00       	mov    0x1055c0,%eax
  1020a1:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1020a4:	e8 9a ff ff ff       	call   102043 <disableInterrupt>
  1020a9:	8b 45 08             	mov    0x8(%ebp),%eax
  1020ac:	8b 40 30             	mov    0x30(%eax),%eax
  1020af:	83 f8 0d             	cmp    $0xd,%eax
  1020b2:	74 1e                	je     1020d2 <irqHandle+0x88>
  1020b4:	83 f8 0d             	cmp    $0xd,%eax
  1020b7:	7f 0b                	jg     1020c4 <irqHandle+0x7a>
  1020b9:	83 f8 ff             	cmp    $0xffffffff,%eax
  1020bc:	0f 84 9e 00 00 00    	je     102160 <irqHandle+0x116>
  1020c2:	eb 3e                	jmp    102102 <irqHandle+0xb8>
  1020c4:	83 f8 20             	cmp    $0x20,%eax
  1020c7:	74 29                	je     1020f2 <irqHandle+0xa8>
  1020c9:	3d 80 00 00 00       	cmp    $0x80,%eax
  1020ce:	74 12                	je     1020e2 <irqHandle+0x98>
  1020d0:	eb 30                	jmp    102102 <irqHandle+0xb8>
  1020d2:	83 ec 0c             	sub    $0xc,%esp
  1020d5:	ff 75 08             	pushl  0x8(%ebp)
  1020d8:	e8 b0 02 00 00       	call   10238d <GProtectFaultHandle>
  1020dd:	83 c4 10             	add    $0x10,%esp
  1020e0:	eb 7f                	jmp    102161 <irqHandle+0x117>
  1020e2:	83 ec 0c             	sub    $0xc,%esp
  1020e5:	ff 75 08             	pushl  0x8(%ebp)
  1020e8:	e8 3b 01 00 00       	call   102228 <syscallHandle>
  1020ed:	83 c4 10             	add    $0x10,%esp
  1020f0:	eb 6f                	jmp    102161 <irqHandle+0x117>
  1020f2:	83 ec 0c             	sub    $0xc,%esp
  1020f5:	ff 75 08             	pushl  0x8(%ebp)
  1020f8:	e8 ee 02 00 00       	call   1023eb <timeHandle>
  1020fd:	83 c4 10             	add    $0x10,%esp
  102100:	eb 5f                	jmp    102161 <irqHandle+0x117>
  102102:	83 ec 0c             	sub    $0xc,%esp
  102105:	68 a7 2e 10 00       	push   $0x102ea7
  10210a:	e8 61 09 00 00       	call   102a70 <printk>
  10210f:	83 c4 10             	add    $0x10,%esp
  102112:	8b 45 08             	mov    0x8(%ebp),%eax
  102115:	8b 50 38             	mov    0x38(%eax),%edx
  102118:	8b 45 08             	mov    0x8(%ebp),%eax
  10211b:	8b 40 30             	mov    0x30(%eax),%eax
  10211e:	83 ec 08             	sub    $0x8,%esp
  102121:	52                   	push   %edx
  102122:	50                   	push   %eax
  102123:	68 f8 2e 10 00       	push   $0x102ef8
  102128:	6a 35                	push   $0x35
  10212a:	68 94 2e 10 00       	push   $0x102e94
  10212f:	68 b0 2e 10 00       	push   $0x102eb0
  102134:	e8 37 09 00 00       	call   102a70 <printk>
  102139:	83 c4 20             	add    $0x20,%esp
  10213c:	83 ec 0c             	sub    $0xc,%esp
  10213f:	68 d5 2e 10 00       	push   $0x102ed5
  102144:	e8 27 09 00 00       	call   102a70 <printk>
  102149:	83 c4 10             	add    $0x10,%esp
  10214c:	83 ec 08             	sub    $0x8,%esp
  10214f:	6a 36                	push   $0x36
  102151:	68 94 2e 10 00       	push   $0x102e94
  102156:	e8 d1 0b 00 00       	call   102d2c <abort>
  10215b:	83 c4 10             	add    $0x10,%esp
  10215e:	eb 01                	jmp    102161 <irqHandle+0x117>
  102160:	90                   	nop
  102161:	8b 45 08             	mov    0x8(%ebp),%eax
  102164:	8b 40 30             	mov    0x30(%eax),%eax
  102167:	3d 80 00 00 00       	cmp    $0x80,%eax
  10216c:	74 0f                	je     10217d <irqHandle+0x133>
  10216e:	8b 45 08             	mov    0x8(%ebp),%eax
  102171:	8b 40 30             	mov    0x30(%eax),%eax
  102174:	83 f8 20             	cmp    $0x20,%eax
  102177:	0f 85 9d 00 00 00    	jne    10221a <irqHandle+0x1d0>
  10217d:	a1 c0 55 10 00       	mov    0x1055c0,%eax
  102182:	3b 45 dc             	cmp    -0x24(%ebp),%eax
  102185:	0f 84 8f 00 00 00    	je     10221a <irqHandle+0x1d0>
  10218b:	8b 15 c0 55 10 00    	mov    0x1055c0,%edx
  102191:	89 d0                	mov    %edx,%eax
  102193:	c1 e0 07             	shl    $0x7,%eax
  102196:	01 d0                	add    %edx,%eax
  102198:	01 c0                	add    %eax,%eax
  10219a:	01 d0                	add    %edx,%eax
  10219c:	01 c0                	add    %eax,%eax
  10219e:	01 d0                	add    %edx,%eax
  1021a0:	c1 e0 04             	shl    $0x4,%eax
  1021a3:	05 e0 55 10 00       	add    $0x1055e0,%eax
  1021a8:	05 fc 1f 00 00       	add    $0x1ffc,%eax
  1021ad:	8d 50 b4             	lea    -0x4c(%eax),%edx
  1021b0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1021b3:	89 10                	mov    %edx,(%eax)
  1021b5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1021b8:	8b 00                	mov    (%eax),%eax
  1021ba:	89 45 d8             	mov    %eax,-0x28(%ebp)
  1021bd:	8b 15 c0 55 10 00    	mov    0x1055c0,%edx
  1021c3:	8b 4d d8             	mov    -0x28(%ebp),%ecx
  1021c6:	89 d0                	mov    %edx,%eax
  1021c8:	c1 e0 07             	shl    $0x7,%eax
  1021cb:	01 d0                	add    %edx,%eax
  1021cd:	01 c0                	add    %eax,%eax
  1021cf:	01 d0                	add    %edx,%eax
  1021d1:	01 c0                	add    %eax,%eax
  1021d3:	01 d0                	add    %edx,%eax
  1021d5:	c1 e0 04             	shl    $0x4,%eax
  1021d8:	05 e0 75 10 00       	add    $0x1075e0,%eax
  1021dd:	89 ca                	mov    %ecx,%edx
  1021df:	89 c3                	mov    %eax,%ebx
  1021e1:	b8 13 00 00 00       	mov    $0x13,%eax
  1021e6:	89 d7                	mov    %edx,%edi
  1021e8:	89 de                	mov    %ebx,%esi
  1021ea:	89 c1                	mov    %eax,%ecx
  1021ec:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1021ee:	a1 c0 55 10 00       	mov    0x1055c0,%eax
  1021f3:	c1 e0 10             	shl    $0x10,%eax
  1021f6:	83 ec 08             	sub    $0x8,%esp
  1021f9:	50                   	push   %eax
  1021fa:	6a 23                	push   $0x23
  1021fc:	e8 d1 de ff ff       	call   1000d2 <change_gdt>
  102201:	83 c4 10             	add    $0x10,%esp
  102204:	a1 c0 55 10 00       	mov    0x1055c0,%eax
  102209:	c1 e0 10             	shl    $0x10,%eax
  10220c:	83 ec 08             	sub    $0x8,%esp
  10220f:	50                   	push   %eax
  102210:	6a 1b                	push   $0x1b
  102212:	e8 bb de ff ff       	call   1000d2 <change_gdt>
  102217:	83 c4 10             	add    $0x10,%esp
  10221a:	e8 1d fe ff ff       	call   10203c <enableInterrupt>
  10221f:	90                   	nop
  102220:	8d 65 f4             	lea    -0xc(%ebp),%esp
  102223:	5b                   	pop    %ebx
  102224:	5e                   	pop    %esi
  102225:	5f                   	pop    %edi
  102226:	5d                   	pop    %ebp
  102227:	c3                   	ret    

00102228 <syscallHandle>:
  102228:	55                   	push   %ebp
  102229:	89 e5                	mov    %esp,%ebp
  10222b:	83 ec 08             	sub    $0x8,%esp
  10222e:	8b 45 08             	mov    0x8(%ebp),%eax
  102231:	8b 40 2c             	mov    0x2c(%eax),%eax
  102234:	83 f8 07             	cmp    $0x7,%eax
  102237:	0f 84 be 00 00 00    	je     1022fb <syscallHandle+0xd3>
  10223d:	83 f8 07             	cmp    $0x7,%eax
  102240:	77 2b                	ja     10226d <syscallHandle+0x45>
  102242:	83 f8 02             	cmp    $0x2,%eax
  102245:	0f 84 95 00 00 00    	je     1022e0 <syscallHandle+0xb8>
  10224b:	83 f8 02             	cmp    $0x2,%eax
  10224e:	77 0a                	ja     10225a <syscallHandle+0x32>
  102250:	83 f8 01             	cmp    $0x1,%eax
  102253:	74 78                	je     1022cd <syscallHandle+0xa5>
  102255:	e9 31 01 00 00       	jmp    10238b <syscallHandle+0x163>
  10225a:	83 f8 03             	cmp    $0x3,%eax
  10225d:	0f 84 10 01 00 00    	je     102373 <syscallHandle+0x14b>
  102263:	83 f8 04             	cmp    $0x4,%eax
  102266:	74 3f                	je     1022a7 <syscallHandle+0x7f>
  102268:	e9 1e 01 00 00       	jmp    10238b <syscallHandle+0x163>
  10226d:	83 f8 17             	cmp    $0x17,%eax
  102270:	0f 84 b5 00 00 00    	je     10232b <syscallHandle+0x103>
  102276:	83 f8 17             	cmp    $0x17,%eax
  102279:	77 17                	ja     102292 <syscallHandle+0x6a>
  10227b:	83 f8 15             	cmp    $0x15,%eax
  10227e:	0f 84 8f 00 00 00    	je     102313 <syscallHandle+0xeb>
  102284:	83 f8 16             	cmp    $0x16,%eax
  102287:	0f 84 b6 00 00 00    	je     102343 <syscallHandle+0x11b>
  10228d:	e9 f9 00 00 00       	jmp    10238b <syscallHandle+0x163>
  102292:	83 f8 18             	cmp    $0x18,%eax
  102295:	0f 84 c0 00 00 00    	je     10235b <syscallHandle+0x133>
  10229b:	3d e6 00 00 00       	cmp    $0xe6,%eax
  1022a0:	74 18                	je     1022ba <syscallHandle+0x92>
  1022a2:	e9 e4 00 00 00       	jmp    10238b <syscallHandle+0x163>
  1022a7:	83 ec 0c             	sub    $0xc,%esp
  1022aa:	ff 75 08             	pushl  0x8(%ebp)
  1022ad:	e8 3f ee ff ff       	call   1010f1 <sys_write>
  1022b2:	83 c4 10             	add    $0x10,%esp
  1022b5:	e9 d0 00 00 00       	jmp    10238a <syscallHandle+0x162>
  1022ba:	83 ec 0c             	sub    $0xc,%esp
  1022bd:	ff 75 08             	pushl  0x8(%ebp)
  1022c0:	e8 d5 e9 ff ff       	call   100c9a <sys_sleep>
  1022c5:	83 c4 10             	add    $0x10,%esp
  1022c8:	e9 bd 00 00 00       	jmp    10238a <syscallHandle+0x162>
  1022cd:	83 ec 0c             	sub    $0xc,%esp
  1022d0:	ff 75 08             	pushl  0x8(%ebp)
  1022d3:	e8 7e e9 ff ff       	call   100c56 <sys_exit>
  1022d8:	83 c4 10             	add    $0x10,%esp
  1022db:	e9 aa 00 00 00       	jmp    10238a <syscallHandle+0x162>
  1022e0:	83 ec 0c             	sub    $0xc,%esp
  1022e3:	ff 75 08             	pushl  0x8(%ebp)
  1022e6:	e8 e9 e9 ff ff       	call   100cd4 <sys_fork>
  1022eb:	83 c4 10             	add    $0x10,%esp
  1022ee:	89 c2                	mov    %eax,%edx
  1022f0:	8b 45 08             	mov    0x8(%ebp),%eax
  1022f3:	89 50 2c             	mov    %edx,0x2c(%eax)
  1022f6:	e9 8f 00 00 00       	jmp    10238a <syscallHandle+0x162>
  1022fb:	83 ec 0c             	sub    $0xc,%esp
  1022fe:	ff 75 08             	pushl  0x8(%ebp)
  102301:	e8 87 e9 ff ff       	call   100c8d <sys_getpid>
  102306:	83 c4 10             	add    $0x10,%esp
  102309:	89 c2                	mov    %eax,%edx
  10230b:	8b 45 08             	mov    0x8(%ebp),%eax
  10230e:	89 50 2c             	mov    %edx,0x2c(%eax)
  102311:	eb 77                	jmp    10238a <syscallHandle+0x162>
  102313:	83 ec 0c             	sub    $0xc,%esp
  102316:	ff 75 08             	pushl  0x8(%ebp)
  102319:	e8 f8 02 00 00       	call   102616 <sys_sem_init>
  10231e:	83 c4 10             	add    $0x10,%esp
  102321:	89 c2                	mov    %eax,%edx
  102323:	8b 45 08             	mov    0x8(%ebp),%eax
  102326:	89 50 2c             	mov    %edx,0x2c(%eax)
  102329:	eb 5f                	jmp    10238a <syscallHandle+0x162>
  10232b:	83 ec 0c             	sub    $0xc,%esp
  10232e:	ff 75 08             	pushl  0x8(%ebp)
  102331:	e8 4c 03 00 00       	call   102682 <sys_sem_post>
  102336:	83 c4 10             	add    $0x10,%esp
  102339:	89 c2                	mov    %eax,%edx
  10233b:	8b 45 08             	mov    0x8(%ebp),%eax
  10233e:	89 50 2c             	mov    %edx,0x2c(%eax)
  102341:	eb 47                	jmp    10238a <syscallHandle+0x162>
  102343:	83 ec 0c             	sub    $0xc,%esp
  102346:	ff 75 08             	pushl  0x8(%ebp)
  102349:	e8 71 03 00 00       	call   1026bf <sys_sem_wait>
  10234e:	83 c4 10             	add    $0x10,%esp
  102351:	89 c2                	mov    %eax,%edx
  102353:	8b 45 08             	mov    0x8(%ebp),%eax
  102356:	89 50 2c             	mov    %edx,0x2c(%eax)
  102359:	eb 2f                	jmp    10238a <syscallHandle+0x162>
  10235b:	83 ec 0c             	sub    $0xc,%esp
  10235e:	ff 75 08             	pushl  0x8(%ebp)
  102361:	e8 96 03 00 00       	call   1026fc <sys_sem_destroy>
  102366:	83 c4 10             	add    $0x10,%esp
  102369:	89 c2                	mov    %eax,%edx
  10236b:	8b 45 08             	mov    0x8(%ebp),%eax
  10236e:	89 50 2c             	mov    %edx,0x2c(%eax)
  102371:	eb 17                	jmp    10238a <syscallHandle+0x162>
  102373:	83 ec 0c             	sub    $0xc,%esp
  102376:	ff 75 08             	pushl  0x8(%ebp)
  102379:	e8 54 ee ff ff       	call   1011d2 <sys_read>
  10237e:	83 c4 10             	add    $0x10,%esp
  102381:	89 c2                	mov    %eax,%edx
  102383:	8b 45 08             	mov    0x8(%ebp),%eax
  102386:	89 50 2c             	mov    %edx,0x2c(%eax)
  102389:	90                   	nop
  10238a:	90                   	nop
  10238b:	c9                   	leave  
  10238c:	c3                   	ret    

0010238d <GProtectFaultHandle>:
  10238d:	55                   	push   %ebp
  10238e:	89 e5                	mov    %esp,%ebp
  102390:	83 ec 08             	sub    $0x8,%esp
  102393:	83 ec 0c             	sub    $0xc,%esp
  102396:	68 a7 2e 10 00       	push   $0x102ea7
  10239b:	e8 d0 06 00 00       	call   102a70 <printk>
  1023a0:	83 c4 10             	add    $0x10,%esp
  1023a3:	8b 45 08             	mov    0x8(%ebp),%eax
  1023a6:	8b 40 30             	mov    0x30(%eax),%eax
  1023a9:	83 ec 0c             	sub    $0xc,%esp
  1023ac:	50                   	push   %eax
  1023ad:	68 04 2f 10 00       	push   $0x102f04
  1023b2:	6a 77                	push   $0x77
  1023b4:	68 94 2e 10 00       	push   $0x102e94
  1023b9:	68 db 2e 10 00       	push   $0x102edb
  1023be:	e8 ad 06 00 00       	call   102a70 <printk>
  1023c3:	83 c4 20             	add    $0x20,%esp
  1023c6:	83 ec 0c             	sub    $0xc,%esp
  1023c9:	68 d5 2e 10 00       	push   $0x102ed5
  1023ce:	e8 9d 06 00 00       	call   102a70 <printk>
  1023d3:	83 c4 10             	add    $0x10,%esp
  1023d6:	83 ec 08             	sub    $0x8,%esp
  1023d9:	6a 78                	push   $0x78
  1023db:	68 94 2e 10 00       	push   $0x102e94
  1023e0:	e8 47 09 00 00       	call   102d2c <abort>
  1023e5:	83 c4 10             	add    $0x10,%esp
  1023e8:	90                   	nop
  1023e9:	c9                   	leave  
  1023ea:	c3                   	ret    

001023eb <timeHandle>:
  1023eb:	55                   	push   %ebp
  1023ec:	89 e5                	mov    %esp,%ebp
  1023ee:	83 ec 18             	sub    $0x18,%esp
  1023f1:	8b 15 c0 55 10 00    	mov    0x1055c0,%edx
  1023f7:	8b 0d c0 55 10 00    	mov    0x1055c0,%ecx
  1023fd:	89 c8                	mov    %ecx,%eax
  1023ff:	c1 e0 07             	shl    $0x7,%eax
  102402:	01 c8                	add    %ecx,%eax
  102404:	01 c0                	add    %eax,%eax
  102406:	01 c8                	add    %ecx,%eax
  102408:	01 c0                	add    %eax,%eax
  10240a:	01 c8                	add    %ecx,%eax
  10240c:	c1 e0 04             	shl    $0x4,%eax
  10240f:	05 30 76 10 00       	add    $0x107630,%eax
  102414:	8b 00                	mov    (%eax),%eax
  102416:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102419:	89 d0                	mov    %edx,%eax
  10241b:	c1 e0 07             	shl    $0x7,%eax
  10241e:	01 d0                	add    %edx,%eax
  102420:	01 c0                	add    %eax,%eax
  102422:	01 d0                	add    %edx,%eax
  102424:	01 c0                	add    %eax,%eax
  102426:	01 d0                	add    %edx,%eax
  102428:	c1 e0 04             	shl    $0x4,%eax
  10242b:	05 30 76 10 00       	add    $0x107630,%eax
  102430:	89 08                	mov    %ecx,(%eax)
  102432:	e8 db f7 ff ff       	call   101c12 <block_decrease>
  102437:	e8 53 f2 ff ff       	call   10168f <check_block>
  10243c:	8b 15 c0 55 10 00    	mov    0x1055c0,%edx
  102442:	89 d0                	mov    %edx,%eax
  102444:	c1 e0 07             	shl    $0x7,%eax
  102447:	01 d0                	add    %edx,%eax
  102449:	01 c0                	add    %eax,%eax
  10244b:	01 d0                	add    %edx,%eax
  10244d:	01 c0                	add    %eax,%eax
  10244f:	01 d0                	add    %edx,%eax
  102451:	c1 e0 04             	shl    $0x4,%eax
  102454:	05 30 76 10 00       	add    $0x107630,%eax
  102459:	8b 00                	mov    (%eax),%eax
  10245b:	85 c0                	test   %eax,%eax
  10245d:	7f 2d                	jg     10248c <timeHandle+0xa1>
  10245f:	a1 c0 55 10 00       	mov    0x1055c0,%eax
  102464:	83 ec 08             	sub    $0x8,%esp
  102467:	ff 75 08             	pushl  0x8(%ebp)
  10246a:	50                   	push   %eax
  10246b:	e8 8f f1 ff ff       	call   1015ff <put_into_runnable>
  102470:	83 c4 10             	add    $0x10,%esp
  102473:	e8 67 f1 ff ff       	call   1015df <get_from_runnable>
  102478:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10247b:	83 ec 08             	sub    $0x8,%esp
  10247e:	ff 75 08             	pushl  0x8(%ebp)
  102481:	ff 75 f4             	pushl  -0xc(%ebp)
  102484:	e8 a3 f0 ff ff       	call   10152c <put_into_running>
  102489:	83 c4 10             	add    $0x10,%esp
  10248c:	e8 30 f1 ff ff       	call   1015c1 <getpid>
  102491:	85 c0                	test   %eax,%eax
  102493:	75 12                	jne    1024a7 <timeHandle+0xbc>
  102495:	83 ec 0c             	sub    $0xc,%esp
  102498:	68 f1 2e 10 00       	push   $0x102ef1
  10249d:	e8 ce 05 00 00       	call   102a70 <printk>
  1024a2:	83 c4 10             	add    $0x10,%esp
  1024a5:	eb 16                	jmp    1024bd <timeHandle+0xd2>
  1024a7:	e8 15 f1 ff ff       	call   1015c1 <getpid>
  1024ac:	83 ec 08             	sub    $0x8,%esp
  1024af:	50                   	push   %eax
  1024b0:	68 f3 2e 10 00       	push   $0x102ef3
  1024b5:	e8 b6 05 00 00       	call   102a70 <printk>
  1024ba:	83 c4 10             	add    $0x10,%esp
  1024bd:	90                   	nop
  1024be:	c9                   	leave  
  1024bf:	c3                   	ret    

001024c0 <W>:
  1024c0:	55                   	push   %ebp
  1024c1:	89 e5                	mov    %esp,%ebp
  1024c3:	83 ec 18             	sub    $0x18,%esp
  1024c6:	e8 f6 f0 ff ff       	call   1015c1 <getpid>
  1024cb:	89 c2                	mov    %eax,%edx
  1024cd:	8b 45 08             	mov    0x8(%ebp),%eax
  1024d0:	8b 48 04             	mov    0x4(%eax),%ecx
  1024d3:	89 d0                	mov    %edx,%eax
  1024d5:	c1 e0 07             	shl    $0x7,%eax
  1024d8:	01 d0                	add    %edx,%eax
  1024da:	01 c0                	add    %eax,%eax
  1024dc:	01 d0                	add    %edx,%eax
  1024de:	01 c0                	add    %eax,%eax
  1024e0:	01 d0                	add    %edx,%eax
  1024e2:	c1 e0 04             	shl    $0x4,%eax
  1024e5:	05 48 76 10 00       	add    $0x107648,%eax
  1024ea:	89 08                	mov    %ecx,(%eax)
  1024ec:	e8 d0 f0 ff ff       	call   1015c1 <getpid>
  1024f1:	89 c2                	mov    %eax,%edx
  1024f3:	89 d0                	mov    %edx,%eax
  1024f5:	c1 e0 07             	shl    $0x7,%eax
  1024f8:	01 d0                	add    %edx,%eax
  1024fa:	01 c0                	add    %eax,%eax
  1024fc:	01 d0                	add    %edx,%eax
  1024fe:	01 c0                	add    %eax,%eax
  102500:	01 d0                	add    %edx,%eax
  102502:	c1 e0 04             	shl    $0x4,%eax
  102505:	8d 90 e0 55 10 00    	lea    0x1055e0(%eax),%edx
  10250b:	8b 45 08             	mov    0x8(%ebp),%eax
  10250e:	89 50 04             	mov    %edx,0x4(%eax)
  102511:	e8 c9 f0 ff ff       	call   1015df <get_from_runnable>
  102516:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102519:	e8 a3 f0 ff ff       	call   1015c1 <getpid>
  10251e:	83 f8 02             	cmp    $0x2,%eax
  102521:	74 12                	je     102535 <W+0x75>
  102523:	83 ec 08             	sub    $0x8,%esp
  102526:	6a 0e                	push   $0xe
  102528:	68 18 2f 10 00       	push   $0x102f18
  10252d:	e8 fa 07 00 00       	call   102d2c <abort>
  102532:	83 c4 10             	add    $0x10,%esp
  102535:	83 ec 08             	sub    $0x8,%esp
  102538:	6a 00                	push   $0x0
  10253a:	ff 75 f4             	pushl  -0xc(%ebp)
  10253d:	e8 ea ef ff ff       	call   10152c <put_into_running>
  102542:	83 c4 10             	add    $0x10,%esp
  102545:	90                   	nop
  102546:	c9                   	leave  
  102547:	c3                   	ret    

00102548 <R>:
  102548:	55                   	push   %ebp
  102549:	89 e5                	mov    %esp,%ebp
  10254b:	83 ec 18             	sub    $0x18,%esp
  10254e:	8b 45 08             	mov    0x8(%ebp),%eax
  102551:	8b 40 04             	mov    0x4(%eax),%eax
  102554:	8b 80 58 20 00 00    	mov    0x2058(%eax),%eax
  10255a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10255d:	8b 45 08             	mov    0x8(%ebp),%eax
  102560:	8b 40 04             	mov    0x4(%eax),%eax
  102563:	8b 90 68 20 00 00    	mov    0x2068(%eax),%edx
  102569:	8b 45 08             	mov    0x8(%ebp),%eax
  10256c:	89 50 04             	mov    %edx,0x4(%eax)
  10256f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102572:	89 d0                	mov    %edx,%eax
  102574:	c1 e0 07             	shl    $0x7,%eax
  102577:	01 d0                	add    %edx,%eax
  102579:	01 c0                	add    %eax,%eax
  10257b:	01 d0                	add    %edx,%eax
  10257d:	01 c0                	add    %eax,%eax
  10257f:	01 d0                	add    %edx,%eax
  102581:	c1 e0 04             	shl    $0x4,%eax
  102584:	05 00 20 00 00       	add    $0x2000,%eax
  102589:	05 e0 55 10 00       	add    $0x1055e0,%eax
  10258e:	83 ec 08             	sub    $0x8,%esp
  102591:	50                   	push   %eax
  102592:	ff 75 f4             	pushl  -0xc(%ebp)
  102595:	e8 65 f0 ff ff       	call   1015ff <put_into_runnable>
  10259a:	83 c4 10             	add    $0x10,%esp
  10259d:	e8 1f f0 ff ff       	call   1015c1 <getpid>
  1025a2:	83 f8 01             	cmp    $0x1,%eax
  1025a5:	74 12                	je     1025b9 <R+0x71>
  1025a7:	83 ec 08             	sub    $0x8,%esp
  1025aa:	6a 18                	push   $0x18
  1025ac:	68 18 2f 10 00       	push   $0x102f18
  1025b1:	e8 76 07 00 00       	call   102d2c <abort>
  1025b6:	83 c4 10             	add    $0x10,%esp
  1025b9:	90                   	nop
  1025ba:	c9                   	leave  
  1025bb:	c3                   	ret    

001025bc <P>:
  1025bc:	55                   	push   %ebp
  1025bd:	89 e5                	mov    %esp,%ebp
  1025bf:	83 ec 08             	sub    $0x8,%esp
  1025c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1025c5:	8b 00                	mov    (%eax),%eax
  1025c7:	8d 50 ff             	lea    -0x1(%eax),%edx
  1025ca:	8b 45 08             	mov    0x8(%ebp),%eax
  1025cd:	89 10                	mov    %edx,(%eax)
  1025cf:	8b 45 08             	mov    0x8(%ebp),%eax
  1025d2:	8b 00                	mov    (%eax),%eax
  1025d4:	85 c0                	test   %eax,%eax
  1025d6:	79 0e                	jns    1025e6 <P+0x2a>
  1025d8:	83 ec 0c             	sub    $0xc,%esp
  1025db:	ff 75 08             	pushl  0x8(%ebp)
  1025de:	e8 dd fe ff ff       	call   1024c0 <W>
  1025e3:	83 c4 10             	add    $0x10,%esp
  1025e6:	90                   	nop
  1025e7:	c9                   	leave  
  1025e8:	c3                   	ret    

001025e9 <V>:
  1025e9:	55                   	push   %ebp
  1025ea:	89 e5                	mov    %esp,%ebp
  1025ec:	83 ec 08             	sub    $0x8,%esp
  1025ef:	8b 45 08             	mov    0x8(%ebp),%eax
  1025f2:	8b 00                	mov    (%eax),%eax
  1025f4:	8d 50 01             	lea    0x1(%eax),%edx
  1025f7:	8b 45 08             	mov    0x8(%ebp),%eax
  1025fa:	89 10                	mov    %edx,(%eax)
  1025fc:	8b 45 08             	mov    0x8(%ebp),%eax
  1025ff:	8b 00                	mov    (%eax),%eax
  102601:	85 c0                	test   %eax,%eax
  102603:	7f 0e                	jg     102613 <V+0x2a>
  102605:	83 ec 0c             	sub    $0xc,%esp
  102608:	ff 75 08             	pushl  0x8(%ebp)
  10260b:	e8 38 ff ff ff       	call   102548 <R>
  102610:	83 c4 10             	add    $0x10,%esp
  102613:	90                   	nop
  102614:	c9                   	leave  
  102615:	c3                   	ret    

00102616 <sys_sem_init>:
  102616:	55                   	push   %ebp
  102617:	89 e5                	mov    %esp,%ebp
  102619:	53                   	push   %ebx
  10261a:	83 ec 14             	sub    $0x14,%esp
  10261d:	8b 45 08             	mov    0x8(%ebp),%eax
  102620:	8b 58 20             	mov    0x20(%eax),%ebx
  102623:	e8 99 ef ff ff       	call   1015c1 <getpid>
  102628:	c1 e0 10             	shl    $0x10,%eax
  10262b:	01 d8                	add    %ebx,%eax
  10262d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102630:	a1 44 4d 10 00       	mov    0x104d44,%eax
  102635:	25 1f 00 00 80       	and    $0x8000001f,%eax
  10263a:	85 c0                	test   %eax,%eax
  10263c:	79 05                	jns    102643 <sys_sem_init+0x2d>
  10263e:	48                   	dec    %eax
  10263f:	83 c8 e0             	or     $0xffffffe0,%eax
  102642:	40                   	inc    %eax
  102643:	89 c2                	mov    %eax,%edx
  102645:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102648:	89 10                	mov    %edx,(%eax)
  10264a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10264d:	8b 00                	mov    (%eax),%eax
  10264f:	8b 55 08             	mov    0x8(%ebp),%edx
  102652:	8b 52 28             	mov    0x28(%edx),%edx
  102655:	89 14 c5 c0 de 13 01 	mov    %edx,0x113dec0(,%eax,8)
  10265c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10265f:	8b 00                	mov    (%eax),%eax
  102661:	c7 04 c5 c4 de 13 01 	movl   $0x0,0x113dec4(,%eax,8)
  102668:	00 00 00 00 
  10266c:	a1 44 4d 10 00       	mov    0x104d44,%eax
  102671:	40                   	inc    %eax
  102672:	a3 44 4d 10 00       	mov    %eax,0x104d44
  102677:	b8 01 00 00 00       	mov    $0x1,%eax
  10267c:	83 c4 14             	add    $0x14,%esp
  10267f:	5b                   	pop    %ebx
  102680:	5d                   	pop    %ebp
  102681:	c3                   	ret    

00102682 <sys_sem_post>:
  102682:	55                   	push   %ebp
  102683:	89 e5                	mov    %esp,%ebp
  102685:	53                   	push   %ebx
  102686:	83 ec 14             	sub    $0x14,%esp
  102689:	8b 45 08             	mov    0x8(%ebp),%eax
  10268c:	8b 58 20             	mov    0x20(%eax),%ebx
  10268f:	e8 2d ef ff ff       	call   1015c1 <getpid>
  102694:	c1 e0 10             	shl    $0x10,%eax
  102697:	01 d8                	add    %ebx,%eax
  102699:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10269c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10269f:	8b 00                	mov    (%eax),%eax
  1026a1:	c1 e0 03             	shl    $0x3,%eax
  1026a4:	05 c0 de 13 01       	add    $0x113dec0,%eax
  1026a9:	83 ec 0c             	sub    $0xc,%esp
  1026ac:	50                   	push   %eax
  1026ad:	e8 37 ff ff ff       	call   1025e9 <V>
  1026b2:	83 c4 10             	add    $0x10,%esp
  1026b5:	b8 01 00 00 00       	mov    $0x1,%eax
  1026ba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1026bd:	c9                   	leave  
  1026be:	c3                   	ret    

001026bf <sys_sem_wait>:
  1026bf:	55                   	push   %ebp
  1026c0:	89 e5                	mov    %esp,%ebp
  1026c2:	53                   	push   %ebx
  1026c3:	83 ec 14             	sub    $0x14,%esp
  1026c6:	8b 45 08             	mov    0x8(%ebp),%eax
  1026c9:	8b 58 20             	mov    0x20(%eax),%ebx
  1026cc:	e8 f0 ee ff ff       	call   1015c1 <getpid>
  1026d1:	c1 e0 10             	shl    $0x10,%eax
  1026d4:	01 d8                	add    %ebx,%eax
  1026d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1026d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1026dc:	8b 00                	mov    (%eax),%eax
  1026de:	c1 e0 03             	shl    $0x3,%eax
  1026e1:	05 c0 de 13 01       	add    $0x113dec0,%eax
  1026e6:	83 ec 0c             	sub    $0xc,%esp
  1026e9:	50                   	push   %eax
  1026ea:	e8 cd fe ff ff       	call   1025bc <P>
  1026ef:	83 c4 10             	add    $0x10,%esp
  1026f2:	b8 01 00 00 00       	mov    $0x1,%eax
  1026f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1026fa:	c9                   	leave  
  1026fb:	c3                   	ret    

001026fc <sys_sem_destroy>:
  1026fc:	55                   	push   %ebp
  1026fd:	89 e5                	mov    %esp,%ebp
  1026ff:	b8 01 00 00 00       	mov    $0x1,%eax
  102704:	5d                   	pop    %ebp
  102705:	c3                   	ret    

00102706 <inByte>:
  102706:	55                   	push   %ebp
  102707:	89 e5                	mov    %esp,%ebp
  102709:	83 ec 14             	sub    $0x14,%esp
  10270c:	8b 45 08             	mov    0x8(%ebp),%eax
  10270f:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  102713:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102716:	89 c2                	mov    %eax,%edx
  102718:	ec                   	in     (%dx),%al
  102719:	88 45 ff             	mov    %al,-0x1(%ebp)
  10271c:	8a 45 ff             	mov    -0x1(%ebp),%al
  10271f:	c9                   	leave  
  102720:	c3                   	ret    

00102721 <outByte>:
  102721:	55                   	push   %ebp
  102722:	89 e5                	mov    %esp,%ebp
  102724:	83 ec 08             	sub    $0x8,%esp
  102727:	8b 45 08             	mov    0x8(%ebp),%eax
  10272a:	8b 55 0c             	mov    0xc(%ebp),%edx
  10272d:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  102731:	88 55 f8             	mov    %dl,-0x8(%ebp)
  102734:	8a 45 f8             	mov    -0x8(%ebp),%al
  102737:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10273a:	ee                   	out    %al,(%dx)
  10273b:	90                   	nop
  10273c:	c9                   	leave  
  10273d:	c3                   	ret    

0010273e <initIntr>:
  10273e:	55                   	push   %ebp
  10273f:	89 e5                	mov    %esp,%ebp
  102741:	6a ff                	push   $0xffffffff
  102743:	6a 21                	push   $0x21
  102745:	e8 d7 ff ff ff       	call   102721 <outByte>
  10274a:	83 c4 08             	add    $0x8,%esp
  10274d:	6a ff                	push   $0xffffffff
  10274f:	68 a1 00 00 00       	push   $0xa1
  102754:	e8 c8 ff ff ff       	call   102721 <outByte>
  102759:	83 c4 08             	add    $0x8,%esp
  10275c:	6a 11                	push   $0x11
  10275e:	6a 20                	push   $0x20
  102760:	e8 bc ff ff ff       	call   102721 <outByte>
  102765:	83 c4 08             	add    $0x8,%esp
  102768:	6a 20                	push   $0x20
  10276a:	6a 21                	push   $0x21
  10276c:	e8 b0 ff ff ff       	call   102721 <outByte>
  102771:	83 c4 08             	add    $0x8,%esp
  102774:	6a 04                	push   $0x4
  102776:	6a 21                	push   $0x21
  102778:	e8 a4 ff ff ff       	call   102721 <outByte>
  10277d:	83 c4 08             	add    $0x8,%esp
  102780:	6a 03                	push   $0x3
  102782:	6a 21                	push   $0x21
  102784:	e8 98 ff ff ff       	call   102721 <outByte>
  102789:	83 c4 08             	add    $0x8,%esp
  10278c:	6a 11                	push   $0x11
  10278e:	68 a0 00 00 00       	push   $0xa0
  102793:	e8 89 ff ff ff       	call   102721 <outByte>
  102798:	83 c4 08             	add    $0x8,%esp
  10279b:	6a 28                	push   $0x28
  10279d:	68 a1 00 00 00       	push   $0xa1
  1027a2:	e8 7a ff ff ff       	call   102721 <outByte>
  1027a7:	83 c4 08             	add    $0x8,%esp
  1027aa:	6a 02                	push   $0x2
  1027ac:	68 a1 00 00 00       	push   $0xa1
  1027b1:	e8 6b ff ff ff       	call   102721 <outByte>
  1027b6:	83 c4 08             	add    $0x8,%esp
  1027b9:	6a 03                	push   $0x3
  1027bb:	68 a1 00 00 00       	push   $0xa1
  1027c0:	e8 5c ff ff ff       	call   102721 <outByte>
  1027c5:	83 c4 08             	add    $0x8,%esp
  1027c8:	6a 68                	push   $0x68
  1027ca:	6a 20                	push   $0x20
  1027cc:	e8 50 ff ff ff       	call   102721 <outByte>
  1027d1:	83 c4 08             	add    $0x8,%esp
  1027d4:	6a 0a                	push   $0xa
  1027d6:	6a 20                	push   $0x20
  1027d8:	e8 44 ff ff ff       	call   102721 <outByte>
  1027dd:	83 c4 08             	add    $0x8,%esp
  1027e0:	6a 68                	push   $0x68
  1027e2:	68 a0 00 00 00       	push   $0xa0
  1027e7:	e8 35 ff ff ff       	call   102721 <outByte>
  1027ec:	83 c4 08             	add    $0x8,%esp
  1027ef:	6a 0a                	push   $0xa
  1027f1:	68 a0 00 00 00       	push   $0xa0
  1027f6:	e8 26 ff ff ff       	call   102721 <outByte>
  1027fb:	83 c4 08             	add    $0x8,%esp
  1027fe:	90                   	nop
  1027ff:	c9                   	leave  
  102800:	c3                   	ret    

00102801 <initTimer>:
  102801:	55                   	push   %ebp
  102802:	89 e5                	mov    %esp,%ebp
  102804:	83 ec 10             	sub    $0x10,%esp
  102807:	c7 45 fc 9b 2e 00 00 	movl   $0x2e9b,-0x4(%ebp)
  10280e:	6a 34                	push   $0x34
  102810:	6a 43                	push   $0x43
  102812:	e8 0a ff ff ff       	call   102721 <outByte>
  102817:	83 c4 08             	add    $0x8,%esp
  10281a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10281d:	25 ff 00 00 80       	and    $0x800000ff,%eax
  102822:	85 c0                	test   %eax,%eax
  102824:	79 07                	jns    10282d <initTimer+0x2c>
  102826:	48                   	dec    %eax
  102827:	0d 00 ff ff ff       	or     $0xffffff00,%eax
  10282c:	40                   	inc    %eax
  10282d:	0f be c0             	movsbl %al,%eax
  102830:	50                   	push   %eax
  102831:	6a 40                	push   $0x40
  102833:	e8 e9 fe ff ff       	call   102721 <outByte>
  102838:	83 c4 08             	add    $0x8,%esp
  10283b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10283e:	85 c0                	test   %eax,%eax
  102840:	79 05                	jns    102847 <initTimer+0x46>
  102842:	05 ff 00 00 00       	add    $0xff,%eax
  102847:	c1 f8 08             	sar    $0x8,%eax
  10284a:	0f be c0             	movsbl %al,%eax
  10284d:	50                   	push   %eax
  10284e:	6a 40                	push   $0x40
  102850:	e8 cc fe ff ff       	call   102721 <outByte>
  102855:	83 c4 08             	add    $0x8,%esp
  102858:	90                   	nop
  102859:	c9                   	leave  
  10285a:	c3                   	ret    

0010285b <getKeyCode>:
  10285b:	55                   	push   %ebp
  10285c:	89 e5                	mov    %esp,%ebp
  10285e:	83 ec 10             	sub    $0x10,%esp
  102861:	6a 60                	push   $0x60
  102863:	e8 9e fe ff ff       	call   102706 <inByte>
  102868:	83 c4 04             	add    $0x4,%esp
  10286b:	0f b6 c0             	movzbl %al,%eax
  10286e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  102871:	6a 61                	push   $0x61
  102873:	e8 8e fe ff ff       	call   102706 <inByte>
  102878:	83 c4 04             	add    $0x4,%esp
  10287b:	0f b6 c0             	movzbl %al,%eax
  10287e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  102881:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102884:	83 c8 80             	or     $0xffffff80,%eax
  102887:	0f be c0             	movsbl %al,%eax
  10288a:	50                   	push   %eax
  10288b:	6a 61                	push   $0x61
  10288d:	e8 8f fe ff ff       	call   102721 <outByte>
  102892:	83 c4 08             	add    $0x8,%esp
  102895:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102898:	0f be c0             	movsbl %al,%eax
  10289b:	50                   	push   %eax
  10289c:	6a 61                	push   $0x61
  10289e:	e8 7e fe ff ff       	call   102721 <outByte>
  1028a3:	83 c4 08             	add    $0x8,%esp
  1028a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1028a9:	c9                   	leave  
  1028aa:	c3                   	ret    

001028ab <i2A>:
  1028ab:	55                   	push   %ebp
  1028ac:	89 e5                	mov    %esp,%ebp
  1028ae:	83 ec 10             	sub    $0x10,%esp
  1028b1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1028b8:	c7 45 f8 7e 55 10 00 	movl   $0x10557e,-0x8(%ebp)
  1028bf:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
  1028c3:	c6 45 f6 00          	movb   $0x0,-0xa(%ebp)
  1028c7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1028cb:	79 17                	jns    1028e4 <i2A+0x39>
  1028cd:	81 7d 08 00 00 00 80 	cmpl   $0x80000000,0x8(%ebp)
  1028d4:	75 07                	jne    1028dd <i2A+0x32>
  1028d6:	ff 45 08             	incl   0x8(%ebp)
  1028d9:	c6 45 f6 01          	movb   $0x1,-0xa(%ebp)
  1028dd:	c6 45 f7 01          	movb   $0x1,-0x9(%ebp)
  1028e1:	f7 5d 08             	negl   0x8(%ebp)
  1028e4:	ff 4d f8             	decl   -0x8(%ebp)
  1028e7:	8b 45 08             	mov    0x8(%ebp),%eax
  1028ea:	b9 0a 00 00 00       	mov    $0xa,%ecx
  1028ef:	99                   	cltd   
  1028f0:	f7 f9                	idiv   %ecx
  1028f2:	89 d0                	mov    %edx,%eax
  1028f4:	83 c0 30             	add    $0x30,%eax
  1028f7:	88 c2                	mov    %al,%dl
  1028f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1028fc:	88 10                	mov    %dl,(%eax)
  1028fe:	ff 45 fc             	incl   -0x4(%ebp)
  102901:	8b 4d 08             	mov    0x8(%ebp),%ecx
  102904:	b8 67 66 66 66       	mov    $0x66666667,%eax
  102909:	f7 e9                	imul   %ecx
  10290b:	c1 fa 02             	sar    $0x2,%edx
  10290e:	89 c8                	mov    %ecx,%eax
  102910:	c1 f8 1f             	sar    $0x1f,%eax
  102913:	29 c2                	sub    %eax,%edx
  102915:	89 d0                	mov    %edx,%eax
  102917:	89 45 08             	mov    %eax,0x8(%ebp)
  10291a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  10291e:	75 c4                	jne    1028e4 <i2A+0x39>
  102920:	80 7d f7 01          	cmpb   $0x1,-0x9(%ebp)
  102924:	75 0c                	jne    102932 <i2A+0x87>
  102926:	ff 4d f8             	decl   -0x8(%ebp)
  102929:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10292c:	c6 00 2d             	movb   $0x2d,(%eax)
  10292f:	ff 45 fc             	incl   -0x4(%ebp)
  102932:	80 7d f6 01          	cmpb   $0x1,-0xa(%ebp)
  102936:	75 0b                	jne    102943 <i2A+0x98>
  102938:	a0 7d 55 10 00       	mov    0x10557d,%al
  10293d:	40                   	inc    %eax
  10293e:	a2 7d 55 10 00       	mov    %al,0x10557d
  102943:	c6 05 7e 55 10 00 00 	movb   $0x0,0x10557e
  10294a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10294d:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102950:	89 10                	mov    %edx,(%eax)
  102952:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102955:	c9                   	leave  
  102956:	c3                   	ret    

00102957 <append>:
  102957:	55                   	push   %ebp
  102958:	89 e5                	mov    %esp,%ebp
  10295a:	83 ec 10             	sub    $0x10,%esp
  10295d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  102964:	eb 19                	jmp    10297f <append+0x28>
  102966:	ff 45 fc             	incl   -0x4(%ebp)
  102969:	8b 45 08             	mov    0x8(%ebp),%eax
  10296c:	8d 50 01             	lea    0x1(%eax),%edx
  10296f:	89 55 08             	mov    %edx,0x8(%ebp)
  102972:	8b 55 0c             	mov    0xc(%ebp),%edx
  102975:	8d 4a 01             	lea    0x1(%edx),%ecx
  102978:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  10297b:	8a 12                	mov    (%edx),%dl
  10297d:	88 10                	mov    %dl,(%eax)
  10297f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102982:	8a 00                	mov    (%eax),%al
  102984:	84 c0                	test   %al,%al
  102986:	75 de                	jne    102966 <append+0xf>
  102988:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10298b:	c9                   	leave  
  10298c:	c3                   	ret    

0010298d <i2X>:
  10298d:	55                   	push   %ebp
  10298e:	89 e5                	mov    %esp,%ebp
  102990:	83 ec 10             	sub    $0x10,%esp
  102993:	c7 45 fc 9e 55 10 00 	movl   $0x10559e,-0x4(%ebp)
  10299a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  1029a1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1029a8:	ff 45 f8             	incl   -0x8(%ebp)
  1029ab:	8b 45 08             	mov    0x8(%ebp),%eax
  1029ae:	83 e0 0f             	and    $0xf,%eax
  1029b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1029b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1029b7:	83 e8 0a             	sub    $0xa,%eax
  1029ba:	83 f8 05             	cmp    $0x5,%eax
  1029bd:	77 4b                	ja     102a0a <i2X+0x7d>
  1029bf:	8b 04 85 2c 2f 10 00 	mov    0x102f2c(,%eax,4),%eax
  1029c6:	ff e0                	jmp    *%eax
  1029c8:	ff 4d fc             	decl   -0x4(%ebp)
  1029cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1029ce:	c6 00 61             	movb   $0x61,(%eax)
  1029d1:	eb 47                	jmp    102a1a <i2X+0x8d>
  1029d3:	ff 4d fc             	decl   -0x4(%ebp)
  1029d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1029d9:	c6 00 62             	movb   $0x62,(%eax)
  1029dc:	eb 3c                	jmp    102a1a <i2X+0x8d>
  1029de:	ff 4d fc             	decl   -0x4(%ebp)
  1029e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1029e4:	c6 00 63             	movb   $0x63,(%eax)
  1029e7:	eb 31                	jmp    102a1a <i2X+0x8d>
  1029e9:	ff 4d fc             	decl   -0x4(%ebp)
  1029ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1029ef:	c6 00 64             	movb   $0x64,(%eax)
  1029f2:	eb 26                	jmp    102a1a <i2X+0x8d>
  1029f4:	ff 4d fc             	decl   -0x4(%ebp)
  1029f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1029fa:	c6 00 65             	movb   $0x65,(%eax)
  1029fd:	eb 1b                	jmp    102a1a <i2X+0x8d>
  1029ff:	ff 4d fc             	decl   -0x4(%ebp)
  102a02:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102a05:	c6 00 66             	movb   $0x66,(%eax)
  102a08:	eb 10                	jmp    102a1a <i2X+0x8d>
  102a0a:	ff 4d fc             	decl   -0x4(%ebp)
  102a0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a10:	83 c0 30             	add    $0x30,%eax
  102a13:	88 c2                	mov    %al,%dl
  102a15:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102a18:	88 10                	mov    %dl,(%eax)
  102a1a:	8b 45 08             	mov    0x8(%ebp),%eax
  102a1d:	c1 e8 04             	shr    $0x4,%eax
  102a20:	89 45 08             	mov    %eax,0x8(%ebp)
  102a23:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102a27:	0f 85 7b ff ff ff    	jne    1029a8 <i2X+0x1b>
  102a2d:	c6 05 9e 55 10 00 00 	movb   $0x0,0x10559e
  102a34:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a37:	8b 55 fc             	mov    -0x4(%ebp),%edx
  102a3a:	89 10                	mov    %edx,(%eax)
  102a3c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102a3f:	c9                   	leave  
  102a40:	c3                   	ret    

00102a41 <printk_char>:
  102a41:	55                   	push   %ebp
  102a42:	89 e5                	mov    %esp,%ebp
  102a44:	83 ec 08             	sub    $0x8,%esp
  102a47:	eb 17                	jmp    102a60 <printk_char+0x1f>
  102a49:	8b 45 08             	mov    0x8(%ebp),%eax
  102a4c:	8a 00                	mov    (%eax),%al
  102a4e:	0f be c0             	movsbl %al,%eax
  102a51:	83 ec 0c             	sub    $0xc,%esp
  102a54:	50                   	push   %eax
  102a55:	e8 95 ea ff ff       	call   1014ef <putChar>
  102a5a:	83 c4 10             	add    $0x10,%esp
  102a5d:	ff 45 08             	incl   0x8(%ebp)
  102a60:	8b 45 08             	mov    0x8(%ebp),%eax
  102a63:	8a 00                	mov    (%eax),%al
  102a65:	84 c0                	test   %al,%al
  102a67:	75 e0                	jne    102a49 <printk_char+0x8>
  102a69:	b8 01 00 00 00       	mov    $0x1,%eax
  102a6e:	c9                   	leave  
  102a6f:	c3                   	ret    

00102a70 <printk>:
  102a70:	55                   	push   %ebp
  102a71:	89 e5                	mov    %esp,%ebp
  102a73:	83 ec 28             	sub    $0x28,%esp
  102a76:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102a7d:	8d 45 0c             	lea    0xc(%ebp),%eax
  102a80:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102a83:	8b 45 08             	mov    0x8(%ebp),%eax
  102a86:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102a89:	c7 45 e8 58 00 00 00 	movl   $0x58,-0x18(%ebp)
  102a90:	e9 57 01 00 00       	jmp    102bec <printk+0x17c>
  102a95:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102a98:	8a 00                	mov    (%eax),%al
  102a9a:	3c 25                	cmp    $0x25,%al
  102a9c:	75 56                	jne    102af4 <printk+0x84>
  102a9e:	ff 45 ec             	incl   -0x14(%ebp)
  102aa1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102aa4:	8a 00                	mov    (%eax),%al
  102aa6:	0f be c0             	movsbl %al,%eax
  102aa9:	83 f8 64             	cmp    $0x64,%eax
  102aac:	74 18                	je     102ac6 <printk+0x56>
  102aae:	83 f8 64             	cmp    $0x64,%eax
  102ab1:	7f 07                	jg     102aba <printk+0x4a>
  102ab3:	83 f8 63             	cmp    $0x63,%eax
  102ab6:	74 29                	je     102ae1 <printk+0x71>
  102ab8:	eb 30                	jmp    102aea <printk+0x7a>
  102aba:	83 f8 73             	cmp    $0x73,%eax
  102abd:	74 19                	je     102ad8 <printk+0x68>
  102abf:	83 f8 78             	cmp    $0x78,%eax
  102ac2:	74 0b                	je     102acf <printk+0x5f>
  102ac4:	eb 24                	jmp    102aea <printk+0x7a>
  102ac6:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
  102acd:	eb 2c                	jmp    102afb <printk+0x8b>
  102acf:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  102ad6:	eb 23                	jmp    102afb <printk+0x8b>
  102ad8:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  102adf:	eb 1a                	jmp    102afb <printk+0x8b>
  102ae1:	c7 45 e8 03 00 00 00 	movl   $0x3,-0x18(%ebp)
  102ae8:	eb 11                	jmp    102afb <printk+0x8b>
  102aea:	c7 45 e8 58 00 00 00 	movl   $0x58,-0x18(%ebp)
  102af1:	90                   	nop
  102af2:	eb 07                	jmp    102afb <printk+0x8b>
  102af4:	c7 45 e8 58 00 00 00 	movl   $0x58,-0x18(%ebp)
  102afb:	83 7d e8 58          	cmpl   $0x58,-0x18(%ebp)
  102aff:	75 19                	jne    102b1a <printk+0xaa>
  102b01:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b04:	8d 50 01             	lea    0x1(%eax),%edx
  102b07:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102b0a:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102b0d:	8a 12                	mov    (%edx),%dl
  102b0f:	88 90 60 4d 10 00    	mov    %dl,0x104d60(%eax)
  102b15:	e9 cf 00 00 00       	jmp    102be9 <printk+0x179>
  102b1a:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
  102b1e:	75 3f                	jne    102b5f <printk+0xef>
  102b20:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  102b27:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b2a:	8d 50 04             	lea    0x4(%eax),%edx
  102b2d:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102b30:	8b 00                	mov    (%eax),%eax
  102b32:	89 c2                	mov    %eax,%edx
  102b34:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  102b37:	50                   	push   %eax
  102b38:	52                   	push   %edx
  102b39:	e8 6d fd ff ff       	call   1028ab <i2A>
  102b3e:	83 c4 08             	add    $0x8,%esp
  102b41:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102b44:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102b47:	81 c2 60 4d 10 00    	add    $0x104d60,%edx
  102b4d:	50                   	push   %eax
  102b4e:	52                   	push   %edx
  102b4f:	e8 03 fe ff ff       	call   102957 <append>
  102b54:	83 c4 08             	add    $0x8,%esp
  102b57:	01 45 f4             	add    %eax,-0xc(%ebp)
  102b5a:	e9 8a 00 00 00       	jmp    102be9 <printk+0x179>
  102b5f:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
  102b63:	75 3a                	jne    102b9f <printk+0x12f>
  102b65:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  102b6c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b6f:	8d 50 04             	lea    0x4(%eax),%edx
  102b72:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102b75:	8b 00                	mov    (%eax),%eax
  102b77:	8d 55 e0             	lea    -0x20(%ebp),%edx
  102b7a:	52                   	push   %edx
  102b7b:	50                   	push   %eax
  102b7c:	e8 0c fe ff ff       	call   10298d <i2X>
  102b81:	83 c4 08             	add    $0x8,%esp
  102b84:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102b87:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102b8a:	81 c2 60 4d 10 00    	add    $0x104d60,%edx
  102b90:	50                   	push   %eax
  102b91:	52                   	push   %edx
  102b92:	e8 c0 fd ff ff       	call   102957 <append>
  102b97:	83 c4 08             	add    $0x8,%esp
  102b9a:	01 45 f4             	add    %eax,-0xc(%ebp)
  102b9d:	eb 4a                	jmp    102be9 <printk+0x179>
  102b9f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102ba3:	75 24                	jne    102bc9 <printk+0x159>
  102ba5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ba8:	8d 50 04             	lea    0x4(%eax),%edx
  102bab:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102bae:	8b 00                	mov    (%eax),%eax
  102bb0:	89 c2                	mov    %eax,%edx
  102bb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102bb5:	05 60 4d 10 00       	add    $0x104d60,%eax
  102bba:	52                   	push   %edx
  102bbb:	50                   	push   %eax
  102bbc:	e8 96 fd ff ff       	call   102957 <append>
  102bc1:	83 c4 08             	add    $0x8,%esp
  102bc4:	01 45 f4             	add    %eax,-0xc(%ebp)
  102bc7:	eb 20                	jmp    102be9 <printk+0x179>
  102bc9:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  102bcd:	75 1a                	jne    102be9 <printk+0x179>
  102bcf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102bd2:	8d 50 01             	lea    0x1(%eax),%edx
  102bd5:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102bd8:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102bdb:	8d 4a 04             	lea    0x4(%edx),%ecx
  102bde:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  102be1:	8b 12                	mov    (%edx),%edx
  102be3:	88 90 60 4d 10 00    	mov    %dl,0x104d60(%eax)
  102be9:	ff 45 ec             	incl   -0x14(%ebp)
  102bec:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102bef:	8a 00                	mov    (%eax),%al
  102bf1:	84 c0                	test   %al,%al
  102bf3:	0f 85 9c fe ff ff    	jne    102a95 <printk+0x25>
  102bf9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102bfc:	8d 50 01             	lea    0x1(%eax),%edx
  102bff:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102c02:	c6 80 60 4d 10 00 00 	movb   $0x0,0x104d60(%eax)
  102c09:	83 ec 08             	sub    $0x8,%esp
  102c0c:	68 00 04 00 00       	push   $0x400
  102c11:	68 60 4d 10 00       	push   $0x104d60
  102c16:	e8 26 fe ff ff       	call   102a41 <printk_char>
  102c1b:	83 c4 10             	add    $0x10,%esp
  102c1e:	90                   	nop
  102c1f:	c9                   	leave  
  102c20:	c3                   	ret    

00102c21 <waitForInterrupt>:
  102c21:	55                   	push   %ebp
  102c22:	89 e5                	mov    %esp,%ebp
  102c24:	f4                   	hlt    
  102c25:	90                   	nop
  102c26:	5d                   	pop    %ebp
  102c27:	c3                   	ret    

00102c28 <disableInterrupt>:
  102c28:	55                   	push   %ebp
  102c29:	89 e5                	mov    %esp,%ebp
  102c2b:	fa                   	cli    
  102c2c:	90                   	nop
  102c2d:	5d                   	pop    %ebp
  102c2e:	c3                   	ret    

00102c2f <i2A>:
  102c2f:	55                   	push   %ebp
  102c30:	89 e5                	mov    %esp,%ebp
  102c32:	83 ec 10             	sub    $0x10,%esp
  102c35:	c7 45 fc bd 55 10 00 	movl   $0x1055bd,-0x4(%ebp)
  102c3c:	ff 4d fc             	decl   -0x4(%ebp)
  102c3f:	8b 45 08             	mov    0x8(%ebp),%eax
  102c42:	b9 0a 00 00 00       	mov    $0xa,%ecx
  102c47:	99                   	cltd   
  102c48:	f7 f9                	idiv   %ecx
  102c4a:	89 d0                	mov    %edx,%eax
  102c4c:	83 c0 30             	add    $0x30,%eax
  102c4f:	88 c2                	mov    %al,%dl
  102c51:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102c54:	88 10                	mov    %dl,(%eax)
  102c56:	8b 4d 08             	mov    0x8(%ebp),%ecx
  102c59:	b8 67 66 66 66       	mov    $0x66666667,%eax
  102c5e:	f7 e9                	imul   %ecx
  102c60:	c1 fa 02             	sar    $0x2,%edx
  102c63:	89 c8                	mov    %ecx,%eax
  102c65:	c1 f8 1f             	sar    $0x1f,%eax
  102c68:	29 c2                	sub    %eax,%edx
  102c6a:	89 d0                	mov    %edx,%eax
  102c6c:	89 45 08             	mov    %eax,0x8(%ebp)
  102c6f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102c73:	75 c7                	jne    102c3c <i2A+0xd>
  102c75:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102c78:	c9                   	leave  
  102c79:	c3                   	ret    

00102c7a <append>:
  102c7a:	55                   	push   %ebp
  102c7b:	89 e5                	mov    %esp,%ebp
  102c7d:	eb 1a                	jmp    102c99 <append+0x1f>
  102c7f:	8b 45 08             	mov    0x8(%ebp),%eax
  102c82:	8b 00                	mov    (%eax),%eax
  102c84:	8d 48 01             	lea    0x1(%eax),%ecx
  102c87:	8b 55 08             	mov    0x8(%ebp),%edx
  102c8a:	89 0a                	mov    %ecx,(%edx)
  102c8c:	8b 55 0c             	mov    0xc(%ebp),%edx
  102c8f:	8d 4a 01             	lea    0x1(%edx),%ecx
  102c92:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  102c95:	8a 12                	mov    (%edx),%dl
  102c97:	88 10                	mov    %dl,(%eax)
  102c99:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c9c:	8a 00                	mov    (%eax),%al
  102c9e:	84 c0                	test   %al,%al
  102ca0:	75 dd                	jne    102c7f <append+0x5>
  102ca2:	90                   	nop
  102ca3:	5d                   	pop    %ebp
  102ca4:	c3                   	ret    

00102ca5 <displayMessage>:
  102ca5:	55                   	push   %ebp
  102ca6:	89 e5                	mov    %esp,%ebp
  102ca8:	83 ec 18             	sub    $0x18,%esp
  102cab:	b8 32 4c 10 00       	mov    $0x104c32,%eax
  102cb0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102cb3:	ff 75 08             	pushl  0x8(%ebp)
  102cb6:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102cb9:	50                   	push   %eax
  102cba:	e8 bb ff ff ff       	call   102c7a <append>
  102cbf:	83 c4 08             	add    $0x8,%esp
  102cc2:	68 44 2f 10 00       	push   $0x102f44
  102cc7:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102cca:	50                   	push   %eax
  102ccb:	e8 aa ff ff ff       	call   102c7a <append>
  102cd0:	83 c4 08             	add    $0x8,%esp
  102cd3:	ff 75 0c             	pushl  0xc(%ebp)
  102cd6:	e8 54 ff ff ff       	call   102c2f <i2A>
  102cdb:	83 c4 04             	add    $0x4,%esp
  102cde:	50                   	push   %eax
  102cdf:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102ce2:	50                   	push   %eax
  102ce3:	e8 92 ff ff ff       	call   102c7a <append>
  102ce8:	83 c4 08             	add    $0x8,%esp
  102ceb:	68 46 2f 10 00       	push   $0x102f46
  102cf0:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102cf3:	50                   	push   %eax
  102cf4:	e8 81 ff ff ff       	call   102c7a <append>
  102cf9:	83 c4 08             	add    $0x8,%esp
  102cfc:	c7 45 f4 20 4c 10 00 	movl   $0x104c20,-0xc(%ebp)
  102d03:	eb 1b                	jmp    102d20 <displayMessage+0x7b>
  102d05:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d08:	8a 00                	mov    (%eax),%al
  102d0a:	0f be c0             	movsbl %al,%eax
  102d0d:	83 ec 0c             	sub    $0xc,%esp
  102d10:	50                   	push   %eax
  102d11:	e8 d9 e7 ff ff       	call   1014ef <putChar>
  102d16:	83 c4 10             	add    $0x10,%esp
  102d19:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d1c:	40                   	inc    %eax
  102d1d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d20:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d23:	8a 00                	mov    (%eax),%al
  102d25:	84 c0                	test   %al,%al
  102d27:	75 dc                	jne    102d05 <displayMessage+0x60>
  102d29:	90                   	nop
  102d2a:	c9                   	leave  
  102d2b:	c3                   	ret    

00102d2c <abort>:
  102d2c:	55                   	push   %ebp
  102d2d:	89 e5                	mov    %esp,%ebp
  102d2f:	83 ec 08             	sub    $0x8,%esp
  102d32:	e8 f1 fe ff ff       	call   102c28 <disableInterrupt>
  102d37:	83 ec 08             	sub    $0x8,%esp
  102d3a:	ff 75 0c             	pushl  0xc(%ebp)
  102d3d:	ff 75 08             	pushl  0x8(%ebp)
  102d40:	e8 60 ff ff ff       	call   102ca5 <displayMessage>
  102d45:	83 c4 10             	add    $0x10,%esp
  102d48:	e8 d4 fe ff ff       	call   102c21 <waitForInterrupt>
  102d4d:	eb f9                	jmp    102d48 <abort+0x1c>

00102d4f <irqEmpty>:
  102d4f:	6a 00                	push   $0x0
  102d51:	6a ff                	push   $0xffffffff
  102d53:	eb 13                	jmp    102d68 <asmDoIrq>

00102d55 <irqGProtectFault>:
  102d55:	6a 0d                	push   $0xd
  102d57:	eb 0f                	jmp    102d68 <asmDoIrq>

00102d59 <irqSyscall>:
  102d59:	6a 00                	push   $0x0
  102d5b:	68 80 00 00 00       	push   $0x80
  102d60:	eb 06                	jmp    102d68 <asmDoIrq>

00102d62 <irqTime>:
  102d62:	6a 00                	push   $0x0
  102d64:	6a 20                	push   $0x20
  102d66:	eb 00                	jmp    102d68 <asmDoIrq>

00102d68 <asmDoIrq>:
  102d68:	60                   	pusha  
  102d69:	1e                   	push   %ds
  102d6a:	06                   	push   %es
  102d6b:	0f a0                	push   %fs
  102d6d:	0f a8                	push   %gs
  102d6f:	54                   	push   %esp
  102d70:	e8 d5 f2 ff ff       	call   10204a <irqHandle>
  102d75:	5c                   	pop    %esp
  102d76:	0f a9                	pop    %gs
  102d78:	0f a1                	pop    %fs
  102d7a:	07                   	pop    %es
  102d7b:	1f                   	pop    %ds
  102d7c:	61                   	popa   
  102d7d:	83 c4 04             	add    $0x4,%esp
  102d80:	83 c4 04             	add    $0x4,%esp
  102d83:	cf                   	iret   
