
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
  10000d:	e8 fb 24 00 00       	call   10250d <initTimer>
  100012:	e8 ec 19 00 00       	call   101a03 <init_pcb>
  100017:	e8 ad 1a 00 00       	call   101ac9 <init_kernel_pcb>
  10001c:	e8 aa 11 00 00       	call   1011cb <initSerial>
  100021:	e8 eb 1c 00 00       	call   101d11 <initIdt>
  100026:	e8 1f 24 00 00       	call   10244a <initIntr>
  10002b:	e8 12 05 00 00       	call   100542 <initSeg>
  100030:	e8 cb ff ff ff       	call   100000 <enableInterrupt>
  100035:	e8 d1 0a 00 00       	call   100b0b <loadUMain>
  10003a:	eb fe                	jmp    10003a <kEntry+0x33>

0010003c <setGdt>:
  10003c:	55                   	push   %ebp
  10003d:	89 e5                	mov    %esp,%ebp
  10003f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100042:	48                   	dec    %eax
  100043:	66 a3 40 48 10 00    	mov    %ax,0x104840
  100049:	8b 45 08             	mov    0x8(%ebp),%eax
  10004c:	66 a3 42 48 10 00    	mov    %ax,0x104842
  100052:	8b 45 08             	mov    0x8(%ebp),%eax
  100055:	c1 e8 10             	shr    $0x10,%eax
  100058:	66 a3 44 48 10 00    	mov    %ax,0x104844
  10005e:	b8 40 48 10 00       	mov    $0x104840,%eax
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
  100124:	66 c7 05 e8 d0 13 01 	movw   $0xffff,0x113d0e8
  10012b:	ff ff 
  10012d:	66 a3 ea d0 13 01    	mov    %ax,0x113d0ea
  100133:	88 0d ec d0 13 01    	mov    %cl,0x113d0ec
  100139:	a0 ed d0 13 01       	mov    0x113d0ed,%al
  10013e:	83 e0 f0             	and    $0xfffffff0,%eax
  100141:	83 c8 0a             	or     $0xa,%eax
  100144:	a2 ed d0 13 01       	mov    %al,0x113d0ed
  100149:	a0 ed d0 13 01       	mov    0x113d0ed,%al
  10014e:	83 c8 10             	or     $0x10,%eax
  100151:	a2 ed d0 13 01       	mov    %al,0x113d0ed
  100156:	a0 ed d0 13 01       	mov    0x113d0ed,%al
  10015b:	83 e0 9f             	and    $0xffffff9f,%eax
  10015e:	a2 ed d0 13 01       	mov    %al,0x113d0ed
  100163:	a0 ed d0 13 01       	mov    0x113d0ed,%al
  100168:	83 c8 80             	or     $0xffffff80,%eax
  10016b:	a2 ed d0 13 01       	mov    %al,0x113d0ed
  100170:	a0 ee d0 13 01       	mov    0x113d0ee,%al
  100175:	83 c8 0f             	or     $0xf,%eax
  100178:	a2 ee d0 13 01       	mov    %al,0x113d0ee
  10017d:	a0 ee d0 13 01       	mov    0x113d0ee,%al
  100182:	83 e0 ef             	and    $0xffffffef,%eax
  100185:	a2 ee d0 13 01       	mov    %al,0x113d0ee
  10018a:	a0 ee d0 13 01       	mov    0x113d0ee,%al
  10018f:	83 e0 df             	and    $0xffffffdf,%eax
  100192:	a2 ee d0 13 01       	mov    %al,0x113d0ee
  100197:	a0 ee d0 13 01       	mov    0x113d0ee,%al
  10019c:	83 c8 40             	or     $0x40,%eax
  10019f:	a2 ee d0 13 01       	mov    %al,0x113d0ee
  1001a4:	a0 ee d0 13 01       	mov    0x113d0ee,%al
  1001a9:	83 c8 80             	or     $0xffffff80,%eax
  1001ac:	a2 ee d0 13 01       	mov    %al,0x113d0ee
  1001b1:	88 15 ef d0 13 01    	mov    %dl,0x113d0ef
  1001b7:	e9 49 02 00 00       	jmp    100405 <change_gdt+0x333>
  1001bc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1001bf:	8b 55 0c             	mov    0xc(%ebp),%edx
  1001c2:	c1 ea 10             	shr    $0x10,%edx
  1001c5:	88 d1                	mov    %dl,%cl
  1001c7:	8b 55 0c             	mov    0xc(%ebp),%edx
  1001ca:	c1 ea 18             	shr    $0x18,%edx
  1001cd:	66 c7 05 f0 d0 13 01 	movw   $0xffff,0x113d0f0
  1001d4:	ff ff 
  1001d6:	66 a3 f2 d0 13 01    	mov    %ax,0x113d0f2
  1001dc:	88 0d f4 d0 13 01    	mov    %cl,0x113d0f4
  1001e2:	a0 f5 d0 13 01       	mov    0x113d0f5,%al
  1001e7:	83 e0 f0             	and    $0xfffffff0,%eax
  1001ea:	83 c8 02             	or     $0x2,%eax
  1001ed:	a2 f5 d0 13 01       	mov    %al,0x113d0f5
  1001f2:	a0 f5 d0 13 01       	mov    0x113d0f5,%al
  1001f7:	83 c8 10             	or     $0x10,%eax
  1001fa:	a2 f5 d0 13 01       	mov    %al,0x113d0f5
  1001ff:	a0 f5 d0 13 01       	mov    0x113d0f5,%al
  100204:	83 e0 9f             	and    $0xffffff9f,%eax
  100207:	a2 f5 d0 13 01       	mov    %al,0x113d0f5
  10020c:	a0 f5 d0 13 01       	mov    0x113d0f5,%al
  100211:	83 c8 80             	or     $0xffffff80,%eax
  100214:	a2 f5 d0 13 01       	mov    %al,0x113d0f5
  100219:	a0 f6 d0 13 01       	mov    0x113d0f6,%al
  10021e:	83 c8 0f             	or     $0xf,%eax
  100221:	a2 f6 d0 13 01       	mov    %al,0x113d0f6
  100226:	a0 f6 d0 13 01       	mov    0x113d0f6,%al
  10022b:	83 e0 ef             	and    $0xffffffef,%eax
  10022e:	a2 f6 d0 13 01       	mov    %al,0x113d0f6
  100233:	a0 f6 d0 13 01       	mov    0x113d0f6,%al
  100238:	83 e0 df             	and    $0xffffffdf,%eax
  10023b:	a2 f6 d0 13 01       	mov    %al,0x113d0f6
  100240:	a0 f6 d0 13 01       	mov    0x113d0f6,%al
  100245:	83 c8 40             	or     $0x40,%eax
  100248:	a2 f6 d0 13 01       	mov    %al,0x113d0f6
  10024d:	a0 f6 d0 13 01       	mov    0x113d0f6,%al
  100252:	83 c8 80             	or     $0xffffff80,%eax
  100255:	a2 f6 d0 13 01       	mov    %al,0x113d0f6
  10025a:	88 15 f7 d0 13 01    	mov    %dl,0x113d0f7
  100260:	e9 a0 01 00 00       	jmp    100405 <change_gdt+0x333>
  100265:	8b 45 0c             	mov    0xc(%ebp),%eax
  100268:	8b 55 0c             	mov    0xc(%ebp),%edx
  10026b:	c1 ea 10             	shr    $0x10,%edx
  10026e:	88 d1                	mov    %dl,%cl
  100270:	8b 55 0c             	mov    0xc(%ebp),%edx
  100273:	c1 ea 18             	shr    $0x18,%edx
  100276:	66 c7 05 f8 d0 13 01 	movw   $0xffff,0x113d0f8
  10027d:	ff ff 
  10027f:	66 a3 fa d0 13 01    	mov    %ax,0x113d0fa
  100285:	88 0d fc d0 13 01    	mov    %cl,0x113d0fc
  10028b:	a0 fd d0 13 01       	mov    0x113d0fd,%al
  100290:	83 e0 f0             	and    $0xfffffff0,%eax
  100293:	83 c8 0a             	or     $0xa,%eax
  100296:	a2 fd d0 13 01       	mov    %al,0x113d0fd
  10029b:	a0 fd d0 13 01       	mov    0x113d0fd,%al
  1002a0:	83 c8 10             	or     $0x10,%eax
  1002a3:	a2 fd d0 13 01       	mov    %al,0x113d0fd
  1002a8:	a0 fd d0 13 01       	mov    0x113d0fd,%al
  1002ad:	83 c8 60             	or     $0x60,%eax
  1002b0:	a2 fd d0 13 01       	mov    %al,0x113d0fd
  1002b5:	a0 fd d0 13 01       	mov    0x113d0fd,%al
  1002ba:	83 c8 80             	or     $0xffffff80,%eax
  1002bd:	a2 fd d0 13 01       	mov    %al,0x113d0fd
  1002c2:	a0 fe d0 13 01       	mov    0x113d0fe,%al
  1002c7:	83 c8 0f             	or     $0xf,%eax
  1002ca:	a2 fe d0 13 01       	mov    %al,0x113d0fe
  1002cf:	a0 fe d0 13 01       	mov    0x113d0fe,%al
  1002d4:	83 e0 ef             	and    $0xffffffef,%eax
  1002d7:	a2 fe d0 13 01       	mov    %al,0x113d0fe
  1002dc:	a0 fe d0 13 01       	mov    0x113d0fe,%al
  1002e1:	83 e0 df             	and    $0xffffffdf,%eax
  1002e4:	a2 fe d0 13 01       	mov    %al,0x113d0fe
  1002e9:	a0 fe d0 13 01       	mov    0x113d0fe,%al
  1002ee:	83 c8 40             	or     $0x40,%eax
  1002f1:	a2 fe d0 13 01       	mov    %al,0x113d0fe
  1002f6:	a0 fe d0 13 01       	mov    0x113d0fe,%al
  1002fb:	83 c8 80             	or     $0xffffff80,%eax
  1002fe:	a2 fe d0 13 01       	mov    %al,0x113d0fe
  100303:	88 15 ff d0 13 01    	mov    %dl,0x113d0ff
  100309:	e9 f7 00 00 00       	jmp    100405 <change_gdt+0x333>
  10030e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100311:	8b 55 0c             	mov    0xc(%ebp),%edx
  100314:	c1 ea 10             	shr    $0x10,%edx
  100317:	88 d1                	mov    %dl,%cl
  100319:	8b 55 0c             	mov    0xc(%ebp),%edx
  10031c:	c1 ea 18             	shr    $0x18,%edx
  10031f:	66 c7 05 00 d1 13 01 	movw   $0xffff,0x113d100
  100326:	ff ff 
  100328:	66 a3 02 d1 13 01    	mov    %ax,0x113d102
  10032e:	88 0d 04 d1 13 01    	mov    %cl,0x113d104
  100334:	a0 05 d1 13 01       	mov    0x113d105,%al
  100339:	83 e0 f0             	and    $0xfffffff0,%eax
  10033c:	83 c8 02             	or     $0x2,%eax
  10033f:	a2 05 d1 13 01       	mov    %al,0x113d105
  100344:	a0 05 d1 13 01       	mov    0x113d105,%al
  100349:	83 c8 10             	or     $0x10,%eax
  10034c:	a2 05 d1 13 01       	mov    %al,0x113d105
  100351:	a0 05 d1 13 01       	mov    0x113d105,%al
  100356:	83 c8 60             	or     $0x60,%eax
  100359:	a2 05 d1 13 01       	mov    %al,0x113d105
  10035e:	a0 05 d1 13 01       	mov    0x113d105,%al
  100363:	83 c8 80             	or     $0xffffff80,%eax
  100366:	a2 05 d1 13 01       	mov    %al,0x113d105
  10036b:	a0 06 d1 13 01       	mov    0x113d106,%al
  100370:	83 c8 0f             	or     $0xf,%eax
  100373:	a2 06 d1 13 01       	mov    %al,0x113d106
  100378:	a0 06 d1 13 01       	mov    0x113d106,%al
  10037d:	83 e0 ef             	and    $0xffffffef,%eax
  100380:	a2 06 d1 13 01       	mov    %al,0x113d106
  100385:	a0 06 d1 13 01       	mov    0x113d106,%al
  10038a:	83 e0 df             	and    $0xffffffdf,%eax
  10038d:	a2 06 d1 13 01       	mov    %al,0x113d106
  100392:	a0 06 d1 13 01       	mov    0x113d106,%al
  100397:	83 c8 40             	or     $0x40,%eax
  10039a:	a2 06 d1 13 01       	mov    %al,0x113d106
  10039f:	a0 06 d1 13 01       	mov    0x113d106,%al
  1003a4:	83 c8 80             	or     $0xffffff80,%eax
  1003a7:	a2 06 d1 13 01       	mov    %al,0x113d106
  1003ac:	88 15 07 d1 13 01    	mov    %dl,0x113d107
  1003b2:	eb 51                	jmp    100405 <change_gdt+0x333>
  1003b4:	83 ec 0c             	sub    $0xc,%esp
  1003b7:	68 90 2a 10 00       	push   $0x102a90
  1003bc:	e8 bb 23 00 00       	call   10277c <printk>
  1003c1:	83 c4 10             	add    $0x10,%esp
  1003c4:	83 ec 0c             	sub    $0xc,%esp
  1003c7:	ff 75 f4             	pushl  -0xc(%ebp)
  1003ca:	68 d0 2a 10 00       	push   $0x102ad0
  1003cf:	6a 17                	push   $0x17
  1003d1:	68 96 2a 10 00       	push   $0x102a96
  1003d6:	68 a3 2a 10 00       	push   $0x102aa3
  1003db:	e8 9c 23 00 00       	call   10277c <printk>
  1003e0:	83 c4 20             	add    $0x20,%esp
  1003e3:	83 ec 0c             	sub    $0xc,%esp
  1003e6:	68 bf 2a 10 00       	push   $0x102abf
  1003eb:	e8 8c 23 00 00       	call   10277c <printk>
  1003f0:	83 c4 10             	add    $0x10,%esp
  1003f3:	83 ec 08             	sub    $0x8,%esp
  1003f6:	6a 18                	push   $0x18
  1003f8:	68 96 2a 10 00       	push   $0x102a96
  1003fd:	e8 36 26 00 00       	call   102a38 <abort>
  100402:	83 c4 10             	add    $0x10,%esp
  100405:	83 ec 08             	sub    $0x8,%esp
  100408:	6a 50                	push   $0x50
  10040a:	68 e0 d0 13 01       	push   $0x113d0e0
  10040f:	e8 28 fc ff ff       	call   10003c <setGdt>
  100414:	83 c4 10             	add    $0x10,%esp
  100417:	b8 01 00 00 00       	mov    $0x1,%eax
  10041c:	c9                   	leave  
  10041d:	c3                   	ret    

0010041e <change_tss>:
  10041e:	55                   	push   %ebp
  10041f:	89 e5                	mov    %esp,%ebp
  100421:	8b 45 08             	mov    0x8(%ebp),%eax
  100424:	a3 48 d1 13 01       	mov    %eax,0x113d148
  100429:	8b 45 0c             	mov    0xc(%ebp),%eax
  10042c:	a3 44 d1 13 01       	mov    %eax,0x113d144
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
  100443:	bb 40 d1 13 01       	mov    $0x113d140,%ebx
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
  100545:	66 c7 05 e8 d0 13 01 	movw   $0xffff,0x113d0e8
  10054c:	ff ff 
  10054e:	66 c7 05 ea d0 13 01 	movw   $0x0,0x113d0ea
  100555:	00 00 
  100557:	c6 05 ec d0 13 01 00 	movb   $0x0,0x113d0ec
  10055e:	a0 ed d0 13 01       	mov    0x113d0ed,%al
  100563:	83 e0 f0             	and    $0xfffffff0,%eax
  100566:	83 c8 0a             	or     $0xa,%eax
  100569:	a2 ed d0 13 01       	mov    %al,0x113d0ed
  10056e:	a0 ed d0 13 01       	mov    0x113d0ed,%al
  100573:	83 c8 10             	or     $0x10,%eax
  100576:	a2 ed d0 13 01       	mov    %al,0x113d0ed
  10057b:	a0 ed d0 13 01       	mov    0x113d0ed,%al
  100580:	83 e0 9f             	and    $0xffffff9f,%eax
  100583:	a2 ed d0 13 01       	mov    %al,0x113d0ed
  100588:	a0 ed d0 13 01       	mov    0x113d0ed,%al
  10058d:	83 c8 80             	or     $0xffffff80,%eax
  100590:	a2 ed d0 13 01       	mov    %al,0x113d0ed
  100595:	a0 ee d0 13 01       	mov    0x113d0ee,%al
  10059a:	83 c8 0f             	or     $0xf,%eax
  10059d:	a2 ee d0 13 01       	mov    %al,0x113d0ee
  1005a2:	a0 ee d0 13 01       	mov    0x113d0ee,%al
  1005a7:	83 e0 ef             	and    $0xffffffef,%eax
  1005aa:	a2 ee d0 13 01       	mov    %al,0x113d0ee
  1005af:	a0 ee d0 13 01       	mov    0x113d0ee,%al
  1005b4:	83 e0 df             	and    $0xffffffdf,%eax
  1005b7:	a2 ee d0 13 01       	mov    %al,0x113d0ee
  1005bc:	a0 ee d0 13 01       	mov    0x113d0ee,%al
  1005c1:	83 c8 40             	or     $0x40,%eax
  1005c4:	a2 ee d0 13 01       	mov    %al,0x113d0ee
  1005c9:	a0 ee d0 13 01       	mov    0x113d0ee,%al
  1005ce:	83 c8 80             	or     $0xffffff80,%eax
  1005d1:	a2 ee d0 13 01       	mov    %al,0x113d0ee
  1005d6:	c6 05 ef d0 13 01 00 	movb   $0x0,0x113d0ef
  1005dd:	66 c7 05 f0 d0 13 01 	movw   $0xffff,0x113d0f0
  1005e4:	ff ff 
  1005e6:	66 c7 05 f2 d0 13 01 	movw   $0x0,0x113d0f2
  1005ed:	00 00 
  1005ef:	c6 05 f4 d0 13 01 00 	movb   $0x0,0x113d0f4
  1005f6:	a0 f5 d0 13 01       	mov    0x113d0f5,%al
  1005fb:	83 e0 f0             	and    $0xfffffff0,%eax
  1005fe:	83 c8 02             	or     $0x2,%eax
  100601:	a2 f5 d0 13 01       	mov    %al,0x113d0f5
  100606:	a0 f5 d0 13 01       	mov    0x113d0f5,%al
  10060b:	83 c8 10             	or     $0x10,%eax
  10060e:	a2 f5 d0 13 01       	mov    %al,0x113d0f5
  100613:	a0 f5 d0 13 01       	mov    0x113d0f5,%al
  100618:	83 e0 9f             	and    $0xffffff9f,%eax
  10061b:	a2 f5 d0 13 01       	mov    %al,0x113d0f5
  100620:	a0 f5 d0 13 01       	mov    0x113d0f5,%al
  100625:	83 c8 80             	or     $0xffffff80,%eax
  100628:	a2 f5 d0 13 01       	mov    %al,0x113d0f5
  10062d:	a0 f6 d0 13 01       	mov    0x113d0f6,%al
  100632:	83 c8 0f             	or     $0xf,%eax
  100635:	a2 f6 d0 13 01       	mov    %al,0x113d0f6
  10063a:	a0 f6 d0 13 01       	mov    0x113d0f6,%al
  10063f:	83 e0 ef             	and    $0xffffffef,%eax
  100642:	a2 f6 d0 13 01       	mov    %al,0x113d0f6
  100647:	a0 f6 d0 13 01       	mov    0x113d0f6,%al
  10064c:	83 e0 df             	and    $0xffffffdf,%eax
  10064f:	a2 f6 d0 13 01       	mov    %al,0x113d0f6
  100654:	a0 f6 d0 13 01       	mov    0x113d0f6,%al
  100659:	83 c8 40             	or     $0x40,%eax
  10065c:	a2 f6 d0 13 01       	mov    %al,0x113d0f6
  100661:	a0 f6 d0 13 01       	mov    0x113d0f6,%al
  100666:	83 c8 80             	or     $0xffffff80,%eax
  100669:	a2 f6 d0 13 01       	mov    %al,0x113d0f6
  10066e:	c6 05 f7 d0 13 01 00 	movb   $0x0,0x113d0f7
  100675:	66 c7 05 f8 d0 13 01 	movw   $0xffff,0x113d0f8
  10067c:	ff ff 
  10067e:	66 c7 05 fa d0 13 01 	movw   $0x0,0x113d0fa
  100685:	00 00 
  100687:	c6 05 fc d0 13 01 00 	movb   $0x0,0x113d0fc
  10068e:	a0 fd d0 13 01       	mov    0x113d0fd,%al
  100693:	83 e0 f0             	and    $0xfffffff0,%eax
  100696:	83 c8 0a             	or     $0xa,%eax
  100699:	a2 fd d0 13 01       	mov    %al,0x113d0fd
  10069e:	a0 fd d0 13 01       	mov    0x113d0fd,%al
  1006a3:	83 c8 10             	or     $0x10,%eax
  1006a6:	a2 fd d0 13 01       	mov    %al,0x113d0fd
  1006ab:	a0 fd d0 13 01       	mov    0x113d0fd,%al
  1006b0:	83 c8 60             	or     $0x60,%eax
  1006b3:	a2 fd d0 13 01       	mov    %al,0x113d0fd
  1006b8:	a0 fd d0 13 01       	mov    0x113d0fd,%al
  1006bd:	83 c8 80             	or     $0xffffff80,%eax
  1006c0:	a2 fd d0 13 01       	mov    %al,0x113d0fd
  1006c5:	a0 fe d0 13 01       	mov    0x113d0fe,%al
  1006ca:	83 c8 0f             	or     $0xf,%eax
  1006cd:	a2 fe d0 13 01       	mov    %al,0x113d0fe
  1006d2:	a0 fe d0 13 01       	mov    0x113d0fe,%al
  1006d7:	83 e0 ef             	and    $0xffffffef,%eax
  1006da:	a2 fe d0 13 01       	mov    %al,0x113d0fe
  1006df:	a0 fe d0 13 01       	mov    0x113d0fe,%al
  1006e4:	83 e0 df             	and    $0xffffffdf,%eax
  1006e7:	a2 fe d0 13 01       	mov    %al,0x113d0fe
  1006ec:	a0 fe d0 13 01       	mov    0x113d0fe,%al
  1006f1:	83 c8 40             	or     $0x40,%eax
  1006f4:	a2 fe d0 13 01       	mov    %al,0x113d0fe
  1006f9:	a0 fe d0 13 01       	mov    0x113d0fe,%al
  1006fe:	83 c8 80             	or     $0xffffff80,%eax
  100701:	a2 fe d0 13 01       	mov    %al,0x113d0fe
  100706:	c6 05 ff d0 13 01 00 	movb   $0x0,0x113d0ff
  10070d:	66 c7 05 00 d1 13 01 	movw   $0xffff,0x113d100
  100714:	ff ff 
  100716:	66 c7 05 02 d1 13 01 	movw   $0x0,0x113d102
  10071d:	00 00 
  10071f:	c6 05 04 d1 13 01 00 	movb   $0x0,0x113d104
  100726:	a0 05 d1 13 01       	mov    0x113d105,%al
  10072b:	83 e0 f0             	and    $0xfffffff0,%eax
  10072e:	83 c8 02             	or     $0x2,%eax
  100731:	a2 05 d1 13 01       	mov    %al,0x113d105
  100736:	a0 05 d1 13 01       	mov    0x113d105,%al
  10073b:	83 c8 10             	or     $0x10,%eax
  10073e:	a2 05 d1 13 01       	mov    %al,0x113d105
  100743:	a0 05 d1 13 01       	mov    0x113d105,%al
  100748:	83 c8 60             	or     $0x60,%eax
  10074b:	a2 05 d1 13 01       	mov    %al,0x113d105
  100750:	a0 05 d1 13 01       	mov    0x113d105,%al
  100755:	83 c8 80             	or     $0xffffff80,%eax
  100758:	a2 05 d1 13 01       	mov    %al,0x113d105
  10075d:	a0 06 d1 13 01       	mov    0x113d106,%al
  100762:	83 c8 0f             	or     $0xf,%eax
  100765:	a2 06 d1 13 01       	mov    %al,0x113d106
  10076a:	a0 06 d1 13 01       	mov    0x113d106,%al
  10076f:	83 e0 ef             	and    $0xffffffef,%eax
  100772:	a2 06 d1 13 01       	mov    %al,0x113d106
  100777:	a0 06 d1 13 01       	mov    0x113d106,%al
  10077c:	83 e0 df             	and    $0xffffffdf,%eax
  10077f:	a2 06 d1 13 01       	mov    %al,0x113d106
  100784:	a0 06 d1 13 01       	mov    0x113d106,%al
  100789:	83 c8 40             	or     $0x40,%eax
  10078c:	a2 06 d1 13 01       	mov    %al,0x113d106
  100791:	a0 06 d1 13 01       	mov    0x113d106,%al
  100796:	83 c8 80             	or     $0xffffff80,%eax
  100799:	a2 06 d1 13 01       	mov    %al,0x113d106
  10079e:	c6 05 07 d1 13 01 00 	movb   $0x0,0x113d107
  1007a5:	66 c7 05 08 d1 13 01 	movw   $0x63,0x113d108
  1007ac:	63 00 
  1007ae:	b8 40 d1 13 01       	mov    $0x113d140,%eax
  1007b3:	66 a3 0a d1 13 01    	mov    %ax,0x113d10a
  1007b9:	b8 40 d1 13 01       	mov    $0x113d140,%eax
  1007be:	c1 e8 10             	shr    $0x10,%eax
  1007c1:	a2 0c d1 13 01       	mov    %al,0x113d10c
  1007c6:	a0 0d d1 13 01       	mov    0x113d10d,%al
  1007cb:	83 e0 f0             	and    $0xfffffff0,%eax
  1007ce:	83 c8 09             	or     $0x9,%eax
  1007d1:	a2 0d d1 13 01       	mov    %al,0x113d10d
  1007d6:	a0 0d d1 13 01       	mov    0x113d10d,%al
  1007db:	83 e0 ef             	and    $0xffffffef,%eax
  1007de:	a2 0d d1 13 01       	mov    %al,0x113d10d
  1007e3:	a0 0d d1 13 01       	mov    0x113d10d,%al
  1007e8:	83 e0 9f             	and    $0xffffff9f,%eax
  1007eb:	a2 0d d1 13 01       	mov    %al,0x113d10d
  1007f0:	a0 0d d1 13 01       	mov    0x113d10d,%al
  1007f5:	83 c8 80             	or     $0xffffff80,%eax
  1007f8:	a2 0d d1 13 01       	mov    %al,0x113d10d
  1007fd:	a0 0e d1 13 01       	mov    0x113d10e,%al
  100802:	83 e0 f0             	and    $0xfffffff0,%eax
  100805:	a2 0e d1 13 01       	mov    %al,0x113d10e
  10080a:	a0 0e d1 13 01       	mov    0x113d10e,%al
  10080f:	83 e0 ef             	and    $0xffffffef,%eax
  100812:	a2 0e d1 13 01       	mov    %al,0x113d10e
  100817:	a0 0e d1 13 01       	mov    0x113d10e,%al
  10081c:	83 e0 df             	and    $0xffffffdf,%eax
  10081f:	a2 0e d1 13 01       	mov    %al,0x113d10e
  100824:	a0 0e d1 13 01       	mov    0x113d10e,%al
  100829:	83 c8 40             	or     $0x40,%eax
  10082c:	a2 0e d1 13 01       	mov    %al,0x113d10e
  100831:	a0 0e d1 13 01       	mov    0x113d10e,%al
  100836:	83 e0 7f             	and    $0x7f,%eax
  100839:	a2 0e d1 13 01       	mov    %al,0x113d10e
  10083e:	b8 40 d1 13 01       	mov    $0x113d140,%eax
  100843:	c1 e8 18             	shr    $0x18,%eax
  100846:	a2 0f d1 13 01       	mov    %al,0x113d10f
  10084b:	a0 0d d1 13 01       	mov    0x113d10d,%al
  100850:	83 e0 ef             	and    $0xffffffef,%eax
  100853:	a2 0d d1 13 01       	mov    %al,0x113d10d
  100858:	a1 c8 2a 10 00       	mov    0x102ac8,%eax
  10085d:	8b 15 cc 2a 10 00    	mov    0x102acc,%edx
  100863:	a3 10 d1 13 01       	mov    %eax,0x113d110
  100868:	89 15 14 d1 13 01    	mov    %edx,0x113d114
  10086e:	66 c7 05 20 d1 13 01 	movw   $0xffff,0x113d120
  100875:	ff ff 
  100877:	66 c7 05 22 d1 13 01 	movw   $0x0,0x113d122
  10087e:	00 00 
  100880:	c6 05 24 d1 13 01 00 	movb   $0x0,0x113d124
  100887:	a0 25 d1 13 01       	mov    0x113d125,%al
  10088c:	83 e0 f0             	and    $0xfffffff0,%eax
  10088f:	83 c8 02             	or     $0x2,%eax
  100892:	a2 25 d1 13 01       	mov    %al,0x113d125
  100897:	a0 25 d1 13 01       	mov    0x113d125,%al
  10089c:	83 c8 10             	or     $0x10,%eax
  10089f:	a2 25 d1 13 01       	mov    %al,0x113d125
  1008a4:	a0 25 d1 13 01       	mov    0x113d125,%al
  1008a9:	83 c8 60             	or     $0x60,%eax
  1008ac:	a2 25 d1 13 01       	mov    %al,0x113d125
  1008b1:	a0 25 d1 13 01       	mov    0x113d125,%al
  1008b6:	83 c8 80             	or     $0xffffff80,%eax
  1008b9:	a2 25 d1 13 01       	mov    %al,0x113d125
  1008be:	a0 26 d1 13 01       	mov    0x113d126,%al
  1008c3:	83 c8 0f             	or     $0xf,%eax
  1008c6:	a2 26 d1 13 01       	mov    %al,0x113d126
  1008cb:	a0 26 d1 13 01       	mov    0x113d126,%al
  1008d0:	83 e0 ef             	and    $0xffffffef,%eax
  1008d3:	a2 26 d1 13 01       	mov    %al,0x113d126
  1008d8:	a0 26 d1 13 01       	mov    0x113d126,%al
  1008dd:	83 e0 df             	and    $0xffffffdf,%eax
  1008e0:	a2 26 d1 13 01       	mov    %al,0x113d126
  1008e5:	a0 26 d1 13 01       	mov    0x113d126,%al
  1008ea:	83 c8 40             	or     $0x40,%eax
  1008ed:	a2 26 d1 13 01       	mov    %al,0x113d126
  1008f2:	a0 26 d1 13 01       	mov    0x113d126,%al
  1008f7:	83 c8 80             	or     $0xffffff80,%eax
  1008fa:	a2 26 d1 13 01       	mov    %al,0x113d126
  1008ff:	c6 05 27 d1 13 01 00 	movb   $0x0,0x113d127
  100906:	6a 50                	push   $0x50
  100908:	68 e0 d0 13 01       	push   $0x113d0e0
  10090d:	e8 2a f7 ff ff       	call   10003c <setGdt>
  100912:	83 c4 08             	add    $0x8,%esp
  100915:	b8 dc 70 10 00       	mov    $0x1070dc,%eax
  10091a:	89 c2                	mov    %eax,%edx
  10091c:	a1 28 71 10 00       	mov    0x107128,%eax
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
  100973:	05 e0 50 10 00       	add    $0x1050e0,%eax
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
  1009bb:	c7 05 c4 50 10 00 01 	movl   $0x1,0x1050c4
  1009c2:	00 00 00 
  1009c5:	e8 24 09 00 00       	call   1012ee <apply_new_pid>
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
  1009e2:	05 28 71 10 00       	add    $0x107128,%eax
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
  100a02:	05 1c 71 10 00       	add    $0x10711c,%eax
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
  100a22:	05 ec 70 10 00       	add    $0x1070ec,%eax
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
  100a42:	05 e8 70 10 00       	add    $0x1070e8,%eax
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
  100a62:	05 e4 70 10 00       	add    $0x1070e4,%eax
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
  100a82:	05 24 71 10 00       	add    $0x107124,%eax
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
  100aa2:	8d 90 18 71 10 00    	lea    0x107118(%eax),%edx
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
  100ac2:	05 30 71 10 00       	add    $0x107130,%eax
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
  100ae7:	05 e0 50 10 00       	add    $0x1050e0,%eax
  100aec:	83 ec 08             	sub    $0x8,%esp
  100aef:	50                   	push   %eax
  100af0:	ff 75 f4             	pushl  -0xc(%ebp)
  100af3:	e8 72 08 00 00       	call   10136a <put_into_runnable>
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
  100c5c:	e8 cb 06 00 00       	call   10132c <getpid>
  100c61:	83 ec 0c             	sub    $0xc,%esp
  100c64:	50                   	push   %eax
  100c65:	e8 aa 06 00 00       	call   101314 <put_into_empty>
  100c6a:	83 c4 10             	add    $0x10,%esp
  100c6d:	e8 d8 06 00 00       	call   10134a <get_from_runnable>
  100c72:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c75:	83 ec 08             	sub    $0x8,%esp
  100c78:	ff 75 08             	pushl  0x8(%ebp)
  100c7b:	ff 75 f4             	pushl  -0xc(%ebp)
  100c7e:	e8 14 06 00 00       	call   101297 <put_into_running>
  100c83:	83 c4 10             	add    $0x10,%esp
  100c86:	b8 01 00 00 00       	mov    $0x1,%eax
  100c8b:	c9                   	leave  
  100c8c:	c3                   	ret    

00100c8d <sys_getpid>:
  100c8d:	55                   	push   %ebp
  100c8e:	89 e5                	mov    %esp,%ebp
  100c90:	83 ec 08             	sub    $0x8,%esp
  100c93:	e8 94 06 00 00       	call   10132c <getpid>
  100c98:	c9                   	leave  
  100c99:	c3                   	ret    

00100c9a <sys_sleep>:
  100c9a:	55                   	push   %ebp
  100c9b:	89 e5                	mov    %esp,%ebp
  100c9d:	83 ec 18             	sub    $0x18,%esp
  100ca0:	e8 87 06 00 00       	call   10132c <getpid>
  100ca5:	83 ec 08             	sub    $0x8,%esp
  100ca8:	ff 75 08             	pushl  0x8(%ebp)
  100cab:	50                   	push   %eax
  100cac:	e8 e7 09 00 00       	call   101698 <put_into_block>
  100cb1:	83 c4 10             	add    $0x10,%esp
  100cb4:	e8 91 06 00 00       	call   10134a <get_from_runnable>
  100cb9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100cbc:	83 ec 08             	sub    $0x8,%esp
  100cbf:	ff 75 08             	pushl  0x8(%ebp)
  100cc2:	ff 75 f4             	pushl  -0xc(%ebp)
  100cc5:	e8 cd 05 00 00       	call   101297 <put_into_running>
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
  100cdd:	e8 0c 06 00 00       	call   1012ee <apply_new_pid>
  100ce2:	89 45 d8             	mov    %eax,-0x28(%ebp)
  100ce5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100cec:	eb 6d                	jmp    100d5b <sys_fork+0x87>
  100cee:	e8 39 06 00 00       	call   10132c <getpid>
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
  100d1e:	8b 0c 85 e0 50 10 00 	mov    0x1050e0(,%eax,4),%ecx
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
  100d51:	89 0c 85 e0 50 10 00 	mov    %ecx,0x1050e0(,%eax,4)
  100d58:	ff 45 e4             	incl   -0x1c(%ebp)
  100d5b:	81 7d e4 ff 07 00 00 	cmpl   $0x7ff,-0x1c(%ebp)
  100d62:	7e 8a                	jle    100cee <sys_fork+0x1a>
  100d64:	e8 c3 05 00 00       	call   10132c <getpid>
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
  100dc2:	8d 90 e0 70 10 00    	lea    0x1070e0(%eax),%edx
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
  100def:	05 0c 71 10 00       	add    $0x10710c,%eax
  100df4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  100dfa:	e8 2d 05 00 00       	call   10132c <getpid>
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
  100e59:	05 e0 50 10 00       	add    $0x1050e0,%eax
  100e5e:	83 ec 08             	sub    $0x8,%esp
  100e61:	50                   	push   %eax
  100e62:	ff 75 d8             	pushl  -0x28(%ebp)
  100e65:	e8 00 05 00 00       	call   10136a <put_into_runnable>
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
  100eb5:	a1 4c 48 10 00       	mov    0x10484c,%eax
  100eba:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100ebd:	eb 19                	jmp    100ed8 <printkernel+0x43>
  100ebf:	a1 48 48 10 00       	mov    0x104848,%eax
  100ec4:	83 ec 04             	sub    $0x4,%esp
  100ec7:	6a 20                	push   $0x20
  100ec9:	ff 75 f0             	pushl  -0x10(%ebp)
  100ecc:	50                   	push   %eax
  100ecd:	e8 84 02 00 00       	call   101156 <print_char>
  100ed2:	83 c4 10             	add    $0x10,%esp
  100ed5:	ff 45 f0             	incl   -0x10(%ebp)
  100ed8:	83 7d f0 50          	cmpl   $0x50,-0x10(%ebp)
  100edc:	7e e1                	jle    100ebf <printkernel+0x2a>
  100ede:	c7 05 4c 48 10 00 00 	movl   $0x0,0x10484c
  100ee5:	00 00 00 
  100ee8:	a1 48 48 10 00       	mov    0x104848,%eax
  100eed:	40                   	inc    %eax
  100eee:	a3 48 48 10 00       	mov    %eax,0x104848
  100ef3:	8b 15 4c 48 10 00    	mov    0x10484c,%edx
  100ef9:	a1 48 48 10 00       	mov    0x104848,%eax
  100efe:	83 ec 08             	sub    $0x8,%esp
  100f01:	52                   	push   %edx
  100f02:	50                   	push   %eax
  100f03:	e8 be 00 00 00       	call   100fc6 <update_cursor>
  100f08:	83 c4 10             	add    $0x10,%esp
  100f0b:	eb 40                	jmp    100f4d <printkernel+0xb8>
  100f0d:	0f be 4d ef          	movsbl -0x11(%ebp),%ecx
  100f11:	8b 15 4c 48 10 00    	mov    0x10484c,%edx
  100f17:	a1 48 48 10 00       	mov    0x104848,%eax
  100f1c:	83 ec 04             	sub    $0x4,%esp
  100f1f:	51                   	push   %ecx
  100f20:	52                   	push   %edx
  100f21:	50                   	push   %eax
  100f22:	e8 2f 02 00 00       	call   101156 <print_char>
  100f27:	83 c4 10             	add    $0x10,%esp
  100f2a:	a1 4c 48 10 00       	mov    0x10484c,%eax
  100f2f:	40                   	inc    %eax
  100f30:	a3 4c 48 10 00       	mov    %eax,0x10484c
  100f35:	8b 15 4c 48 10 00    	mov    0x10484c,%edx
  100f3b:	a1 48 48 10 00       	mov    0x104848,%eax
  100f40:	83 ec 08             	sub    $0x8,%esp
  100f43:	52                   	push   %edx
  100f44:	50                   	push   %eax
  100f45:	e8 7c 00 00 00       	call   100fc6 <update_cursor>
  100f4a:	83 c4 10             	add    $0x10,%esp
  100f4d:	a1 4c 48 10 00       	mov    0x10484c,%eax
  100f52:	83 f8 50             	cmp    $0x50,%eax
  100f55:	75 15                	jne    100f6c <printkernel+0xd7>
  100f57:	c7 05 4c 48 10 00 00 	movl   $0x0,0x10484c
  100f5e:	00 00 00 
  100f61:	a1 48 48 10 00       	mov    0x104848,%eax
  100f66:	40                   	inc    %eax
  100f67:	a3 48 48 10 00       	mov    %eax,0x104848
  100f6c:	8b 15 48 48 10 00    	mov    0x104848,%edx
  100f72:	a1 20 47 10 00       	mov    0x104720,%eax
  100f77:	39 c2                	cmp    %eax,%edx
  100f79:	7e 29                	jle    100fa4 <printkernel+0x10f>
  100f7b:	a1 48 48 10 00       	mov    0x104848,%eax
  100f80:	83 ec 0c             	sub    $0xc,%esp
  100f83:	50                   	push   %eax
  100f84:	e8 ac 00 00 00       	call   101035 <scrollScreen>
  100f89:	83 c4 10             	add    $0x10,%esp
  100f8c:	8b 15 4c 48 10 00    	mov    0x10484c,%edx
  100f92:	a1 48 48 10 00       	mov    0x104848,%eax
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
  10103c:	a1 48 48 10 00       	mov    0x104848,%eax
  101041:	85 c0                	test   %eax,%eax
  101043:	7f 12                	jg     101057 <scrollScreen+0x22>
  101045:	83 ec 08             	sub    $0x8,%esp
  101048:	6a 38                	push   $0x38
  10104a:	68 db 2a 10 00       	push   $0x102adb
  10104f:	e8 e4 19 00 00       	call   102a38 <abort>
  101054:	83 c4 10             	add    $0x10,%esp
  101057:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  10105e:	eb 76                	jmp    1010d6 <scrollScreen+0xa1>
  101060:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  101067:	eb 61                	jmp    1010ca <scrollScreen+0x95>
  101069:	a1 48 48 10 00       	mov    0x104848,%eax
  10106e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  101071:	75 0a                	jne    10107d <scrollScreen+0x48>
  101073:	a1 4c 48 10 00       	mov    0x10484c,%eax
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
  1010d6:	a1 48 48 10 00       	mov    0x104848,%eax
  1010db:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  1010de:	7e 80                	jle    101060 <scrollScreen+0x2b>
  1010e0:	a1 48 48 10 00       	mov    0x104848,%eax
  1010e5:	48                   	dec    %eax
  1010e6:	a3 48 48 10 00       	mov    %eax,0x104848
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
  10111c:	68 db 2a 10 00       	push   $0x102adb
  101121:	e8 12 19 00 00       	call   102a38 <abort>
  101126:	83 c4 10             	add    $0x10,%esp
  101129:	8b 45 08             	mov    0x8(%ebp),%eax
  10112c:	8b 40 24             	mov    0x24(%eax),%eax
  10112f:	89 c3                	mov    %eax,%ebx
  101131:	e8 f6 01 00 00       	call   10132c <getpid>
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

001011ae <outByte>:
  1011ae:	55                   	push   %ebp
  1011af:	89 e5                	mov    %esp,%ebp
  1011b1:	83 ec 08             	sub    $0x8,%esp
  1011b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1011b7:	8b 55 0c             	mov    0xc(%ebp),%edx
  1011ba:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  1011be:	88 55 f8             	mov    %dl,-0x8(%ebp)
  1011c1:	8a 45 f8             	mov    -0x8(%ebp),%al
  1011c4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1011c7:	ee                   	out    %al,(%dx)
  1011c8:	90                   	nop
  1011c9:	c9                   	leave  
  1011ca:	c3                   	ret    

001011cb <initSerial>:
  1011cb:	55                   	push   %ebp
  1011cc:	89 e5                	mov    %esp,%ebp
  1011ce:	6a 00                	push   $0x0
  1011d0:	68 f9 03 00 00       	push   $0x3f9
  1011d5:	e8 d4 ff ff ff       	call   1011ae <outByte>
  1011da:	83 c4 08             	add    $0x8,%esp
  1011dd:	6a 80                	push   $0xffffff80
  1011df:	68 fb 03 00 00       	push   $0x3fb
  1011e4:	e8 c5 ff ff ff       	call   1011ae <outByte>
  1011e9:	83 c4 08             	add    $0x8,%esp
  1011ec:	6a 01                	push   $0x1
  1011ee:	68 f8 03 00 00       	push   $0x3f8
  1011f3:	e8 b6 ff ff ff       	call   1011ae <outByte>
  1011f8:	83 c4 08             	add    $0x8,%esp
  1011fb:	6a 00                	push   $0x0
  1011fd:	68 f9 03 00 00       	push   $0x3f9
  101202:	e8 a7 ff ff ff       	call   1011ae <outByte>
  101207:	83 c4 08             	add    $0x8,%esp
  10120a:	6a 03                	push   $0x3
  10120c:	68 fb 03 00 00       	push   $0x3fb
  101211:	e8 98 ff ff ff       	call   1011ae <outByte>
  101216:	83 c4 08             	add    $0x8,%esp
  101219:	6a c7                	push   $0xffffffc7
  10121b:	68 fa 03 00 00       	push   $0x3fa
  101220:	e8 89 ff ff ff       	call   1011ae <outByte>
  101225:	83 c4 08             	add    $0x8,%esp
  101228:	6a 0b                	push   $0xb
  10122a:	68 fc 03 00 00       	push   $0x3fc
  10122f:	e8 7a ff ff ff       	call   1011ae <outByte>
  101234:	83 c4 08             	add    $0x8,%esp
  101237:	90                   	nop
  101238:	c9                   	leave  
  101239:	c3                   	ret    

0010123a <serialIdle>:
  10123a:	55                   	push   %ebp
  10123b:	89 e5                	mov    %esp,%ebp
  10123d:	68 fd 03 00 00       	push   $0x3fd
  101242:	e8 4c ff ff ff       	call   101193 <inByte>
  101247:	83 c4 04             	add    $0x4,%esp
  10124a:	0f b6 c0             	movzbl %al,%eax
  10124d:	83 e0 20             	and    $0x20,%eax
  101250:	85 c0                	test   %eax,%eax
  101252:	0f 95 c0             	setne  %al
  101255:	0f b6 c0             	movzbl %al,%eax
  101258:	c9                   	leave  
  101259:	c3                   	ret    

0010125a <putChar>:
  10125a:	55                   	push   %ebp
  10125b:	89 e5                	mov    %esp,%ebp
  10125d:	83 ec 04             	sub    $0x4,%esp
  101260:	8b 45 08             	mov    0x8(%ebp),%eax
  101263:	88 45 fc             	mov    %al,-0x4(%ebp)
  101266:	90                   	nop
  101267:	e8 ce ff ff ff       	call   10123a <serialIdle>
  10126c:	83 f8 01             	cmp    $0x1,%eax
  10126f:	75 f6                	jne    101267 <putChar+0xd>
  101271:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
  101275:	50                   	push   %eax
  101276:	68 f8 03 00 00       	push   $0x3f8
  10127b:	e8 2e ff ff ff       	call   1011ae <outByte>
  101280:	83 c4 08             	add    $0x8,%esp
  101283:	90                   	nop
  101284:	c9                   	leave  
  101285:	c3                   	ret    

00101286 <waitForInterrupt>:
  101286:	55                   	push   %ebp
  101287:	89 e5                	mov    %esp,%ebp
  101289:	f4                   	hlt    
  10128a:	90                   	nop
  10128b:	5d                   	pop    %ebp
  10128c:	c3                   	ret    

0010128d <IDLE>:
  10128d:	55                   	push   %ebp
  10128e:	89 e5                	mov    %esp,%ebp
  101290:	e8 f1 ff ff ff       	call   101286 <waitForInterrupt>
  101295:	eb f9                	jmp    101290 <IDLE+0x3>

00101297 <put_into_running>:
  101297:	55                   	push   %ebp
  101298:	89 e5                	mov    %esp,%ebp
  10129a:	83 ec 08             	sub    $0x8,%esp
  10129d:	a1 c0 50 10 00       	mov    0x1050c0,%eax
  1012a2:	39 45 08             	cmp    %eax,0x8(%ebp)
  1012a5:	75 07                	jne    1012ae <put_into_running+0x17>
  1012a7:	b8 01 00 00 00       	mov    $0x1,%eax
  1012ac:	eb 3e                	jmp    1012ec <put_into_running+0x55>
  1012ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1012b1:	a3 c0 50 10 00       	mov    %eax,0x1050c0
  1012b6:	e8 71 00 00 00       	call   10132c <getpid>
  1012bb:	89 c2                	mov    %eax,%edx
  1012bd:	89 d0                	mov    %edx,%eax
  1012bf:	c1 e0 07             	shl    $0x7,%eax
  1012c2:	01 d0                	add    %edx,%eax
  1012c4:	01 c0                	add    %eax,%eax
  1012c6:	01 d0                	add    %edx,%eax
  1012c8:	01 c0                	add    %eax,%eax
  1012ca:	01 d0                	add    %edx,%eax
  1012cc:	c1 e0 04             	shl    $0x4,%eax
  1012cf:	05 fc 1f 00 00       	add    $0x1ffc,%eax
  1012d4:	05 e0 50 10 00       	add    $0x1050e0,%eax
  1012d9:	83 ec 08             	sub    $0x8,%esp
  1012dc:	50                   	push   %eax
  1012dd:	6a 10                	push   $0x10
  1012df:	e8 3a f1 ff ff       	call   10041e <change_tss>
  1012e4:	83 c4 10             	add    $0x10,%esp
  1012e7:	b8 01 00 00 00       	mov    $0x1,%eax
  1012ec:	c9                   	leave  
  1012ed:	c3                   	ret    

001012ee <apply_new_pid>:
  1012ee:	55                   	push   %ebp
  1012ef:	89 e5                	mov    %esp,%ebp
  1012f1:	83 ec 18             	sub    $0x18,%esp
  1012f4:	8b 15 50 48 10 00    	mov    0x104850,%edx
  1012fa:	a1 50 48 10 00       	mov    0x104850,%eax
  1012ff:	83 ec 08             	sub    $0x8,%esp
  101302:	52                   	push   %edx
  101303:	50                   	push   %eax
  101304:	e8 21 04 00 00       	call   10172a <get_from>
  101309:	83 c4 10             	add    $0x10,%esp
  10130c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10130f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101312:	c9                   	leave  
  101313:	c3                   	ret    

00101314 <put_into_empty>:
  101314:	55                   	push   %ebp
  101315:	89 e5                	mov    %esp,%ebp
  101317:	83 ec 08             	sub    $0x8,%esp
  10131a:	83 ec 08             	sub    $0x8,%esp
  10131d:	ff 75 08             	pushl  0x8(%ebp)
  101320:	6a 03                	push   $0x3
  101322:	e8 fa 01 00 00       	call   101521 <put_into>
  101327:	83 c4 10             	add    $0x10,%esp
  10132a:	c9                   	leave  
  10132b:	c3                   	ret    

0010132c <getpid>:
  10132c:	55                   	push   %ebp
  10132d:	89 e5                	mov    %esp,%ebp
  10132f:	a1 c0 50 10 00       	mov    0x1050c0,%eax
  101334:	5d                   	pop    %ebp
  101335:	c3                   	ret    

00101336 <getrunnable>:
  101336:	55                   	push   %ebp
  101337:	89 e5                	mov    %esp,%ebp
  101339:	a1 24 47 10 00       	mov    0x104724,%eax
  10133e:	5d                   	pop    %ebp
  10133f:	c3                   	ret    

00101340 <getblocked>:
  101340:	55                   	push   %ebp
  101341:	89 e5                	mov    %esp,%ebp
  101343:	a1 28 47 10 00       	mov    0x104728,%eax
  101348:	5d                   	pop    %ebp
  101349:	c3                   	ret    

0010134a <get_from_runnable>:
  10134a:	55                   	push   %ebp
  10134b:	89 e5                	mov    %esp,%ebp
  10134d:	83 ec 08             	sub    $0x8,%esp
  101350:	8b 15 24 47 10 00    	mov    0x104724,%edx
  101356:	a1 24 47 10 00       	mov    0x104724,%eax
  10135b:	83 ec 08             	sub    $0x8,%esp
  10135e:	52                   	push   %edx
  10135f:	50                   	push   %eax
  101360:	e8 c5 03 00 00       	call   10172a <get_from>
  101365:	83 c4 10             	add    $0x10,%esp
  101368:	c9                   	leave  
  101369:	c3                   	ret    

0010136a <put_into_runnable>:
  10136a:	55                   	push   %ebp
  10136b:	89 e5                	mov    %esp,%ebp
  10136d:	57                   	push   %edi
  10136e:	56                   	push   %esi
  10136f:	53                   	push   %ebx
  101370:	83 ec 0c             	sub    $0xc,%esp
  101373:	8b 55 08             	mov    0x8(%ebp),%edx
  101376:	89 d0                	mov    %edx,%eax
  101378:	c1 e0 07             	shl    $0x7,%eax
  10137b:	01 d0                	add    %edx,%eax
  10137d:	01 c0                	add    %eax,%eax
  10137f:	01 d0                	add    %edx,%eax
  101381:	01 c0                	add    %eax,%eax
  101383:	01 d0                	add    %edx,%eax
  101385:	c1 e0 04             	shl    $0x4,%eax
  101388:	8d 90 e0 70 10 00    	lea    0x1070e0(%eax),%edx
  10138e:	8b 45 0c             	mov    0xc(%ebp),%eax
  101391:	89 c3                	mov    %eax,%ebx
  101393:	b8 13 00 00 00       	mov    $0x13,%eax
  101398:	89 d7                	mov    %edx,%edi
  10139a:	89 de                	mov    %ebx,%esi
  10139c:	89 c1                	mov    %eax,%ecx
  10139e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1013a0:	8b 0d c8 50 10 00    	mov    0x1050c8,%ecx
  1013a6:	8b 55 08             	mov    0x8(%ebp),%edx
  1013a9:	89 d0                	mov    %edx,%eax
  1013ab:	c1 e0 07             	shl    $0x7,%eax
  1013ae:	01 d0                	add    %edx,%eax
  1013b0:	01 c0                	add    %eax,%eax
  1013b2:	01 d0                	add    %edx,%eax
  1013b4:	01 c0                	add    %eax,%eax
  1013b6:	01 d0                	add    %edx,%eax
  1013b8:	c1 e0 04             	shl    $0x4,%eax
  1013bb:	05 30 71 10 00       	add    $0x107130,%eax
  1013c0:	89 08                	mov    %ecx,(%eax)
  1013c2:	8b 55 08             	mov    0x8(%ebp),%edx
  1013c5:	89 d0                	mov    %edx,%eax
  1013c7:	c1 e0 07             	shl    $0x7,%eax
  1013ca:	01 d0                	add    %edx,%eax
  1013cc:	01 c0                	add    %eax,%eax
  1013ce:	01 d0                	add    %edx,%eax
  1013d0:	01 c0                	add    %eax,%eax
  1013d2:	01 d0                	add    %edx,%eax
  1013d4:	c1 e0 04             	shl    $0x4,%eax
  1013d7:	05 2c 71 10 00       	add    $0x10712c,%eax
  1013dc:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  1013e2:	83 ec 08             	sub    $0x8,%esp
  1013e5:	ff 75 08             	pushl  0x8(%ebp)
  1013e8:	6a 01                	push   $0x1
  1013ea:	e8 32 01 00 00       	call   101521 <put_into>
  1013ef:	83 c4 10             	add    $0x10,%esp
  1013f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1013f5:	5b                   	pop    %ebx
  1013f6:	5e                   	pop    %esi
  1013f7:	5f                   	pop    %edi
  1013f8:	5d                   	pop    %ebp
  1013f9:	c3                   	ret    

001013fa <check_block>:
  1013fa:	55                   	push   %ebp
  1013fb:	89 e5                	mov    %esp,%ebp
  1013fd:	83 ec 18             	sub    $0x18,%esp
  101400:	a1 28 47 10 00       	mov    0x104728,%eax
  101405:	83 f8 ff             	cmp    $0xffffffff,%eax
  101408:	75 0a                	jne    101414 <check_block+0x1a>
  10140a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10140f:	e9 0b 01 00 00       	jmp    10151f <check_block+0x125>
  101414:	a1 28 47 10 00       	mov    0x104728,%eax
  101419:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10141c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  101423:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101426:	89 d0                	mov    %edx,%eax
  101428:	c1 e0 07             	shl    $0x7,%eax
  10142b:	01 d0                	add    %edx,%eax
  10142d:	01 c0                	add    %eax,%eax
  10142f:	01 d0                	add    %edx,%eax
  101431:	01 c0                	add    %eax,%eax
  101433:	01 d0                	add    %edx,%eax
  101435:	c1 e0 04             	shl    $0x4,%eax
  101438:	05 2c 71 10 00       	add    $0x10712c,%eax
  10143d:	8b 00                	mov    (%eax),%eax
  10143f:	85 c0                	test   %eax,%eax
  101441:	0f 85 9c 00 00 00    	jne    1014e3 <check_block+0xe9>
  101447:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10144a:	89 d0                	mov    %edx,%eax
  10144c:	c1 e0 07             	shl    $0x7,%eax
  10144f:	01 d0                	add    %edx,%eax
  101451:	01 c0                	add    %eax,%eax
  101453:	01 d0                	add    %edx,%eax
  101455:	01 c0                	add    %eax,%eax
  101457:	01 d0                	add    %edx,%eax
  101459:	c1 e0 04             	shl    $0x4,%eax
  10145c:	05 34 71 10 00       	add    $0x107134,%eax
  101461:	8b 00                	mov    (%eax),%eax
  101463:	85 c0                	test   %eax,%eax
  101465:	7f 7c                	jg     1014e3 <check_block+0xe9>
  101467:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10146a:	89 d0                	mov    %edx,%eax
  10146c:	c1 e0 07             	shl    $0x7,%eax
  10146f:	01 d0                	add    %edx,%eax
  101471:	01 c0                	add    %eax,%eax
  101473:	01 d0                	add    %edx,%eax
  101475:	01 c0                	add    %eax,%eax
  101477:	01 d0                	add    %edx,%eax
  101479:	c1 e0 04             	shl    $0x4,%eax
  10147c:	05 40 71 10 00       	add    $0x107140,%eax
  101481:	8b 00                	mov    (%eax),%eax
  101483:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101486:	83 ec 0c             	sub    $0xc,%esp
  101489:	ff 75 f4             	pushl  -0xc(%ebp)
  10148c:	e8 68 04 00 00       	call   1018f9 <get_from_block>
  101491:	83 c4 10             	add    $0x10,%esp
  101494:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101497:	89 d0                	mov    %edx,%eax
  101499:	c1 e0 07             	shl    $0x7,%eax
  10149c:	01 d0                	add    %edx,%eax
  10149e:	01 c0                	add    %eax,%eax
  1014a0:	01 d0                	add    %edx,%eax
  1014a2:	01 c0                	add    %eax,%eax
  1014a4:	01 d0                	add    %edx,%eax
  1014a6:	c1 e0 04             	shl    $0x4,%eax
  1014a9:	05 00 20 00 00       	add    $0x2000,%eax
  1014ae:	05 e0 50 10 00       	add    $0x1050e0,%eax
  1014b3:	83 ec 08             	sub    $0x8,%esp
  1014b6:	50                   	push   %eax
  1014b7:	ff 75 f4             	pushl  -0xc(%ebp)
  1014ba:	e8 ab fe ff ff       	call   10136a <put_into_runnable>
  1014bf:	83 c4 10             	add    $0x10,%esp
  1014c2:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1014c5:	89 d0                	mov    %edx,%eax
  1014c7:	c1 e0 07             	shl    $0x7,%eax
  1014ca:	01 d0                	add    %edx,%eax
  1014cc:	01 c0                	add    %eax,%eax
  1014ce:	01 d0                	add    %edx,%eax
  1014d0:	01 c0                	add    %eax,%eax
  1014d2:	01 d0                	add    %edx,%eax
  1014d4:	c1 e0 04             	shl    $0x4,%eax
  1014d7:	05 40 71 10 00       	add    $0x107140,%eax
  1014dc:	8b 00                	mov    (%eax),%eax
  1014de:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1014e1:	eb 1f                	jmp    101502 <check_block+0x108>
  1014e3:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1014e6:	89 d0                	mov    %edx,%eax
  1014e8:	c1 e0 07             	shl    $0x7,%eax
  1014eb:	01 d0                	add    %edx,%eax
  1014ed:	01 c0                	add    %eax,%eax
  1014ef:	01 d0                	add    %edx,%eax
  1014f1:	01 c0                	add    %eax,%eax
  1014f3:	01 d0                	add    %edx,%eax
  1014f5:	c1 e0 04             	shl    $0x4,%eax
  1014f8:	05 40 71 10 00       	add    $0x107140,%eax
  1014fd:	8b 00                	mov    (%eax),%eax
  1014ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101502:	a1 28 47 10 00       	mov    0x104728,%eax
  101507:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  10150a:	74 0e                	je     10151a <check_block+0x120>
  10150c:	a1 28 47 10 00       	mov    0x104728,%eax
  101511:	83 f8 ff             	cmp    $0xffffffff,%eax
  101514:	0f 85 09 ff ff ff    	jne    101423 <check_block+0x29>
  10151a:	b8 01 00 00 00       	mov    $0x1,%eax
  10151f:	c9                   	leave  
  101520:	c3                   	ret    

00101521 <put_into>:
  101521:	55                   	push   %ebp
  101522:	89 e5                	mov    %esp,%ebp
  101524:	83 ec 18             	sub    $0x18,%esp
  101527:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10152e:	8b 45 08             	mov    0x8(%ebp),%eax
  101531:	83 f8 01             	cmp    $0x1,%eax
  101534:	74 14                	je     10154a <put_into+0x29>
  101536:	83 f8 03             	cmp    $0x3,%eax
  101539:	74 06                	je     101541 <put_into+0x20>
  10153b:	85 c0                	test   %eax,%eax
  10153d:	74 14                	je     101553 <put_into+0x32>
  10153f:	eb 1b                	jmp    10155c <put_into+0x3b>
  101541:	c7 45 f4 50 48 10 00 	movl   $0x104850,-0xc(%ebp)
  101548:	eb 2e                	jmp    101578 <put_into+0x57>
  10154a:	c7 45 f4 24 47 10 00 	movl   $0x104724,-0xc(%ebp)
  101551:	eb 25                	jmp    101578 <put_into+0x57>
  101553:	c7 45 f4 28 47 10 00 	movl   $0x104728,-0xc(%ebp)
  10155a:	eb 1c                	jmp    101578 <put_into+0x57>
  10155c:	83 ec 08             	sub    $0x8,%esp
  10155f:	6a 5f                	push   $0x5f
  101561:	68 f8 2a 10 00       	push   $0x102af8
  101566:	e8 cd 14 00 00       	call   102a38 <abort>
  10156b:	83 c4 10             	add    $0x10,%esp
  10156e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101573:	e9 1e 01 00 00       	jmp    101696 <put_into+0x175>
  101578:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10157b:	8b 00                	mov    (%eax),%eax
  10157d:	83 f8 ff             	cmp    $0xffffffff,%eax
  101580:	75 57                	jne    1015d9 <put_into+0xb8>
  101582:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101585:	8b 55 0c             	mov    0xc(%ebp),%edx
  101588:	89 10                	mov    %edx,(%eax)
  10158a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10158d:	8b 10                	mov    (%eax),%edx
  10158f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101592:	8b 00                	mov    (%eax),%eax
  101594:	89 c1                	mov    %eax,%ecx
  101596:	89 d0                	mov    %edx,%eax
  101598:	c1 e0 07             	shl    $0x7,%eax
  10159b:	01 d0                	add    %edx,%eax
  10159d:	01 c0                	add    %eax,%eax
  10159f:	01 d0                	add    %edx,%eax
  1015a1:	01 c0                	add    %eax,%eax
  1015a3:	01 d0                	add    %edx,%eax
  1015a5:	c1 e0 04             	shl    $0x4,%eax
  1015a8:	05 40 71 10 00       	add    $0x107140,%eax
  1015ad:	89 08                	mov    %ecx,(%eax)
  1015af:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1015b2:	8b 10                	mov    (%eax),%edx
  1015b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1015b7:	8b 00                	mov    (%eax),%eax
  1015b9:	89 c1                	mov    %eax,%ecx
  1015bb:	89 d0                	mov    %edx,%eax
  1015bd:	c1 e0 07             	shl    $0x7,%eax
  1015c0:	01 d0                	add    %edx,%eax
  1015c2:	01 c0                	add    %eax,%eax
  1015c4:	01 d0                	add    %edx,%eax
  1015c6:	01 c0                	add    %eax,%eax
  1015c8:	01 d0                	add    %edx,%eax
  1015ca:	c1 e0 04             	shl    $0x4,%eax
  1015cd:	05 3c 71 10 00       	add    $0x10713c,%eax
  1015d2:	89 08                	mov    %ecx,(%eax)
  1015d4:	e9 b8 00 00 00       	jmp    101691 <put_into+0x170>
  1015d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1015dc:	8b 10                	mov    (%eax),%edx
  1015de:	89 d0                	mov    %edx,%eax
  1015e0:	c1 e0 07             	shl    $0x7,%eax
  1015e3:	01 d0                	add    %edx,%eax
  1015e5:	01 c0                	add    %eax,%eax
  1015e7:	01 d0                	add    %edx,%eax
  1015e9:	01 c0                	add    %eax,%eax
  1015eb:	01 d0                	add    %edx,%eax
  1015ed:	c1 e0 04             	shl    $0x4,%eax
  1015f0:	05 3c 71 10 00       	add    $0x10713c,%eax
  1015f5:	8b 10                	mov    (%eax),%edx
  1015f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1015fa:	89 d0                	mov    %edx,%eax
  1015fc:	c1 e0 07             	shl    $0x7,%eax
  1015ff:	01 d0                	add    %edx,%eax
  101601:	01 c0                	add    %eax,%eax
  101603:	01 d0                	add    %edx,%eax
  101605:	01 c0                	add    %eax,%eax
  101607:	01 d0                	add    %edx,%eax
  101609:	c1 e0 04             	shl    $0x4,%eax
  10160c:	05 40 71 10 00       	add    $0x107140,%eax
  101611:	89 08                	mov    %ecx,(%eax)
  101613:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101616:	8b 10                	mov    (%eax),%edx
  101618:	89 d0                	mov    %edx,%eax
  10161a:	c1 e0 07             	shl    $0x7,%eax
  10161d:	01 d0                	add    %edx,%eax
  10161f:	01 c0                	add    %eax,%eax
  101621:	01 d0                	add    %edx,%eax
  101623:	01 c0                	add    %eax,%eax
  101625:	01 d0                	add    %edx,%eax
  101627:	c1 e0 04             	shl    $0x4,%eax
  10162a:	05 3c 71 10 00       	add    $0x10713c,%eax
  10162f:	8b 08                	mov    (%eax),%ecx
  101631:	8b 55 0c             	mov    0xc(%ebp),%edx
  101634:	89 d0                	mov    %edx,%eax
  101636:	c1 e0 07             	shl    $0x7,%eax
  101639:	01 d0                	add    %edx,%eax
  10163b:	01 c0                	add    %eax,%eax
  10163d:	01 d0                	add    %edx,%eax
  10163f:	01 c0                	add    %eax,%eax
  101641:	01 d0                	add    %edx,%eax
  101643:	c1 e0 04             	shl    $0x4,%eax
  101646:	05 3c 71 10 00       	add    $0x10713c,%eax
  10164b:	89 08                	mov    %ecx,(%eax)
  10164d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101650:	8b 00                	mov    (%eax),%eax
  101652:	89 c1                	mov    %eax,%ecx
  101654:	8b 55 0c             	mov    0xc(%ebp),%edx
  101657:	89 d0                	mov    %edx,%eax
  101659:	c1 e0 07             	shl    $0x7,%eax
  10165c:	01 d0                	add    %edx,%eax
  10165e:	01 c0                	add    %eax,%eax
  101660:	01 d0                	add    %edx,%eax
  101662:	01 c0                	add    %eax,%eax
  101664:	01 d0                	add    %edx,%eax
  101666:	c1 e0 04             	shl    $0x4,%eax
  101669:	05 40 71 10 00       	add    $0x107140,%eax
  10166e:	89 08                	mov    %ecx,(%eax)
  101670:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101673:	8b 10                	mov    (%eax),%edx
  101675:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  101678:	89 d0                	mov    %edx,%eax
  10167a:	c1 e0 07             	shl    $0x7,%eax
  10167d:	01 d0                	add    %edx,%eax
  10167f:	01 c0                	add    %eax,%eax
  101681:	01 d0                	add    %edx,%eax
  101683:	01 c0                	add    %eax,%eax
  101685:	01 d0                	add    %edx,%eax
  101687:	c1 e0 04             	shl    $0x4,%eax
  10168a:	05 3c 71 10 00       	add    $0x10713c,%eax
  10168f:	89 08                	mov    %ecx,(%eax)
  101691:	b8 01 00 00 00       	mov    $0x1,%eax
  101696:	c9                   	leave  
  101697:	c3                   	ret    

00101698 <put_into_block>:
  101698:	55                   	push   %ebp
  101699:	89 e5                	mov    %esp,%ebp
  10169b:	57                   	push   %edi
  10169c:	56                   	push   %esi
  10169d:	53                   	push   %ebx
  10169e:	83 ec 0c             	sub    $0xc,%esp
  1016a1:	8b 55 08             	mov    0x8(%ebp),%edx
  1016a4:	89 d0                	mov    %edx,%eax
  1016a6:	c1 e0 07             	shl    $0x7,%eax
  1016a9:	01 d0                	add    %edx,%eax
  1016ab:	01 c0                	add    %eax,%eax
  1016ad:	01 d0                	add    %edx,%eax
  1016af:	01 c0                	add    %eax,%eax
  1016b1:	01 d0                	add    %edx,%eax
  1016b3:	c1 e0 04             	shl    $0x4,%eax
  1016b6:	8d 90 e0 70 10 00    	lea    0x1070e0(%eax),%edx
  1016bc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1016bf:	89 c3                	mov    %eax,%ebx
  1016c1:	b8 13 00 00 00       	mov    $0x13,%eax
  1016c6:	89 d7                	mov    %edx,%edi
  1016c8:	89 de                	mov    %ebx,%esi
  1016ca:	89 c1                	mov    %eax,%ecx
  1016cc:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1016ce:	8b 45 0c             	mov    0xc(%ebp),%eax
  1016d1:	8b 40 20             	mov    0x20(%eax),%eax
  1016d4:	89 c1                	mov    %eax,%ecx
  1016d6:	8b 55 08             	mov    0x8(%ebp),%edx
  1016d9:	89 d0                	mov    %edx,%eax
  1016db:	c1 e0 07             	shl    $0x7,%eax
  1016de:	01 d0                	add    %edx,%eax
  1016e0:	01 c0                	add    %eax,%eax
  1016e2:	01 d0                	add    %edx,%eax
  1016e4:	01 c0                	add    %eax,%eax
  1016e6:	01 d0                	add    %edx,%eax
  1016e8:	c1 e0 04             	shl    $0x4,%eax
  1016eb:	05 34 71 10 00       	add    $0x107134,%eax
  1016f0:	89 08                	mov    %ecx,(%eax)
  1016f2:	8b 55 08             	mov    0x8(%ebp),%edx
  1016f5:	89 d0                	mov    %edx,%eax
  1016f7:	c1 e0 07             	shl    $0x7,%eax
  1016fa:	01 d0                	add    %edx,%eax
  1016fc:	01 c0                	add    %eax,%eax
  1016fe:	01 d0                	add    %edx,%eax
  101700:	01 c0                	add    %eax,%eax
  101702:	01 d0                	add    %edx,%eax
  101704:	c1 e0 04             	shl    $0x4,%eax
  101707:	05 2c 71 10 00       	add    $0x10712c,%eax
  10170c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  101712:	83 ec 08             	sub    $0x8,%esp
  101715:	ff 75 08             	pushl  0x8(%ebp)
  101718:	6a 00                	push   $0x0
  10171a:	e8 02 fe ff ff       	call   101521 <put_into>
  10171f:	83 c4 10             	add    $0x10,%esp
  101722:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101725:	5b                   	pop    %ebx
  101726:	5e                   	pop    %esi
  101727:	5f                   	pop    %edi
  101728:	5d                   	pop    %ebp
  101729:	c3                   	ret    

0010172a <get_from>:
  10172a:	55                   	push   %ebp
  10172b:	89 e5                	mov    %esp,%ebp
  10172d:	83 ec 18             	sub    $0x18,%esp
  101730:	83 ec 08             	sub    $0x8,%esp
  101733:	ff 75 0c             	pushl  0xc(%ebp)
  101736:	ff 75 08             	pushl  0x8(%ebp)
  101739:	e8 f6 01 00 00       	call   101934 <check_is_in>
  10173e:	83 c4 10             	add    $0x10,%esp
  101741:	83 f8 01             	cmp    $0x1,%eax
  101744:	74 61                	je     1017a7 <get_from+0x7d>
  101746:	83 ec 0c             	sub    $0xc,%esp
  101749:	68 06 2b 10 00       	push   $0x102b06
  10174e:	e8 29 10 00 00       	call   10277c <printk>
  101753:	83 c4 10             	add    $0x10,%esp
  101756:	83 ec 08             	sub    $0x8,%esp
  101759:	ff 75 0c             	pushl  0xc(%ebp)
  10175c:	ff 75 08             	pushl  0x8(%ebp)
  10175f:	68 38 2b 10 00       	push   $0x102b38
  101764:	6a 7f                	push   $0x7f
  101766:	68 f8 2a 10 00       	push   $0x102af8
  10176b:	68 0c 2b 10 00       	push   $0x102b0c
  101770:	e8 07 10 00 00       	call   10277c <printk>
  101775:	83 c4 20             	add    $0x20,%esp
  101778:	83 ec 0c             	sub    $0xc,%esp
  10177b:	68 30 2b 10 00       	push   $0x102b30
  101780:	e8 f7 0f 00 00       	call   10277c <printk>
  101785:	83 c4 10             	add    $0x10,%esp
  101788:	83 ec 08             	sub    $0x8,%esp
  10178b:	68 80 00 00 00       	push   $0x80
  101790:	68 f8 2a 10 00       	push   $0x102af8
  101795:	e8 9e 12 00 00       	call   102a38 <abort>
  10179a:	83 c4 10             	add    $0x10,%esp
  10179d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1017a2:	e9 50 01 00 00       	jmp    1018f7 <get_from+0x1cd>
  1017a7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1017ae:	8b 55 0c             	mov    0xc(%ebp),%edx
  1017b1:	89 d0                	mov    %edx,%eax
  1017b3:	c1 e0 07             	shl    $0x7,%eax
  1017b6:	01 d0                	add    %edx,%eax
  1017b8:	01 c0                	add    %eax,%eax
  1017ba:	01 d0                	add    %edx,%eax
  1017bc:	01 c0                	add    %eax,%eax
  1017be:	01 d0                	add    %edx,%eax
  1017c0:	c1 e0 04             	shl    $0x4,%eax
  1017c3:	05 2c 71 10 00       	add    $0x10712c,%eax
  1017c8:	8b 00                	mov    (%eax),%eax
  1017ca:	83 f8 01             	cmp    $0x1,%eax
  1017cd:	74 14                	je     1017e3 <get_from+0xb9>
  1017cf:	83 f8 03             	cmp    $0x3,%eax
  1017d2:	74 06                	je     1017da <get_from+0xb0>
  1017d4:	85 c0                	test   %eax,%eax
  1017d6:	74 14                	je     1017ec <get_from+0xc2>
  1017d8:	eb 1b                	jmp    1017f5 <get_from+0xcb>
  1017da:	c7 45 f4 50 48 10 00 	movl   $0x104850,-0xc(%ebp)
  1017e1:	eb 27                	jmp    10180a <get_from+0xe0>
  1017e3:	c7 45 f4 24 47 10 00 	movl   $0x104724,-0xc(%ebp)
  1017ea:	eb 1e                	jmp    10180a <get_from+0xe0>
  1017ec:	c7 45 f4 28 47 10 00 	movl   $0x104728,-0xc(%ebp)
  1017f3:	eb 15                	jmp    10180a <get_from+0xe0>
  1017f5:	83 ec 08             	sub    $0x8,%esp
  1017f8:	68 92 00 00 00       	push   $0x92
  1017fd:	68 f8 2a 10 00       	push   $0x102af8
  101802:	e8 31 12 00 00       	call   102a38 <abort>
  101807:	83 c4 10             	add    $0x10,%esp
  10180a:	8b 45 08             	mov    0x8(%ebp),%eax
  10180d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101810:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101813:	8b 00                	mov    (%eax),%eax
  101815:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  101818:	74 15                	je     10182f <get_from+0x105>
  10181a:	83 ec 08             	sub    $0x8,%esp
  10181d:	68 97 00 00 00       	push   $0x97
  101822:	68 f8 2a 10 00       	push   $0x102af8
  101827:	e8 0c 12 00 00       	call   102a38 <abort>
  10182c:	83 c4 10             	add    $0x10,%esp
  10182f:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  101833:	75 0a                	jne    10183f <get_from+0x115>
  101835:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10183a:	e9 b8 00 00 00       	jmp    1018f7 <get_from+0x1cd>
  10183f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101842:	89 d0                	mov    %edx,%eax
  101844:	c1 e0 07             	shl    $0x7,%eax
  101847:	01 d0                	add    %edx,%eax
  101849:	01 c0                	add    %eax,%eax
  10184b:	01 d0                	add    %edx,%eax
  10184d:	01 c0                	add    %eax,%eax
  10184f:	01 d0                	add    %edx,%eax
  101851:	c1 e0 04             	shl    $0x4,%eax
  101854:	05 40 71 10 00       	add    $0x107140,%eax
  101859:	8b 10                	mov    (%eax),%edx
  10185b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10185e:	39 c2                	cmp    %eax,%edx
  101860:	75 0e                	jne    101870 <get_from+0x146>
  101862:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101865:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
  10186b:	e9 84 00 00 00       	jmp    1018f4 <get_from+0x1ca>
  101870:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101873:	89 d0                	mov    %edx,%eax
  101875:	c1 e0 07             	shl    $0x7,%eax
  101878:	01 d0                	add    %edx,%eax
  10187a:	01 c0                	add    %eax,%eax
  10187c:	01 d0                	add    %edx,%eax
  10187e:	01 c0                	add    %eax,%eax
  101880:	01 d0                	add    %edx,%eax
  101882:	c1 e0 04             	shl    $0x4,%eax
  101885:	05 3c 71 10 00       	add    $0x10713c,%eax
  10188a:	8b 00                	mov    (%eax),%eax
  10188c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10188f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101892:	89 d0                	mov    %edx,%eax
  101894:	c1 e0 07             	shl    $0x7,%eax
  101897:	01 d0                	add    %edx,%eax
  101899:	01 c0                	add    %eax,%eax
  10189b:	01 d0                	add    %edx,%eax
  10189d:	01 c0                	add    %eax,%eax
  10189f:	01 d0                	add    %edx,%eax
  1018a1:	c1 e0 04             	shl    $0x4,%eax
  1018a4:	05 40 71 10 00       	add    $0x107140,%eax
  1018a9:	8b 00                	mov    (%eax),%eax
  1018ab:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1018ae:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1018b1:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1018b4:	89 d0                	mov    %edx,%eax
  1018b6:	c1 e0 07             	shl    $0x7,%eax
  1018b9:	01 d0                	add    %edx,%eax
  1018bb:	01 c0                	add    %eax,%eax
  1018bd:	01 d0                	add    %edx,%eax
  1018bf:	01 c0                	add    %eax,%eax
  1018c1:	01 d0                	add    %edx,%eax
  1018c3:	c1 e0 04             	shl    $0x4,%eax
  1018c6:	05 40 71 10 00       	add    $0x107140,%eax
  1018cb:	89 08                	mov    %ecx,(%eax)
  1018cd:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  1018d0:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1018d3:	89 d0                	mov    %edx,%eax
  1018d5:	c1 e0 07             	shl    $0x7,%eax
  1018d8:	01 d0                	add    %edx,%eax
  1018da:	01 c0                	add    %eax,%eax
  1018dc:	01 d0                	add    %edx,%eax
  1018de:	01 c0                	add    %eax,%eax
  1018e0:	01 d0                	add    %edx,%eax
  1018e2:	c1 e0 04             	shl    $0x4,%eax
  1018e5:	05 3c 71 10 00       	add    $0x10713c,%eax
  1018ea:	89 08                	mov    %ecx,(%eax)
  1018ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018ef:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1018f2:	89 10                	mov    %edx,(%eax)
  1018f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1018f7:	c9                   	leave  
  1018f8:	c3                   	ret    

001018f9 <get_from_block>:
  1018f9:	55                   	push   %ebp
  1018fa:	89 e5                	mov    %esp,%ebp
  1018fc:	83 ec 08             	sub    $0x8,%esp
  1018ff:	a1 28 47 10 00       	mov    0x104728,%eax
  101904:	83 ec 08             	sub    $0x8,%esp
  101907:	ff 75 08             	pushl  0x8(%ebp)
  10190a:	50                   	push   %eax
  10190b:	e8 1a fe ff ff       	call   10172a <get_from>
  101910:	83 c4 10             	add    $0x10,%esp
  101913:	83 f8 ff             	cmp    $0xffffffff,%eax
  101916:	75 15                	jne    10192d <get_from_block+0x34>
  101918:	83 ec 08             	sub    $0x8,%esp
  10191b:	68 ae 00 00 00       	push   $0xae
  101920:	68 f8 2a 10 00       	push   $0x102af8
  101925:	e8 0e 11 00 00       	call   102a38 <abort>
  10192a:	83 c4 10             	add    $0x10,%esp
  10192d:	b8 01 00 00 00       	mov    $0x1,%eax
  101932:	c9                   	leave  
  101933:	c3                   	ret    

00101934 <check_is_in>:
  101934:	55                   	push   %ebp
  101935:	89 e5                	mov    %esp,%ebp
  101937:	83 ec 10             	sub    $0x10,%esp
  10193a:	8b 45 08             	mov    0x8(%ebp),%eax
  10193d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101940:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101943:	3b 45 0c             	cmp    0xc(%ebp),%eax
  101946:	75 07                	jne    10194f <check_is_in+0x1b>
  101948:	b8 01 00 00 00       	mov    $0x1,%eax
  10194d:	eb 2c                	jmp    10197b <check_is_in+0x47>
  10194f:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101952:	89 d0                	mov    %edx,%eax
  101954:	c1 e0 07             	shl    $0x7,%eax
  101957:	01 d0                	add    %edx,%eax
  101959:	01 c0                	add    %eax,%eax
  10195b:	01 d0                	add    %edx,%eax
  10195d:	01 c0                	add    %eax,%eax
  10195f:	01 d0                	add    %edx,%eax
  101961:	c1 e0 04             	shl    $0x4,%eax
  101964:	05 40 71 10 00       	add    $0x107140,%eax
  101969:	8b 00                	mov    (%eax),%eax
  10196b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10196e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101971:	3b 45 08             	cmp    0x8(%ebp),%eax
  101974:	75 ca                	jne    101940 <check_is_in+0xc>
  101976:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10197b:	c9                   	leave  
  10197c:	c3                   	ret    

0010197d <block_decrease>:
  10197d:	55                   	push   %ebp
  10197e:	89 e5                	mov    %esp,%ebp
  101980:	83 ec 10             	sub    $0x10,%esp
  101983:	a1 28 47 10 00       	mov    0x104728,%eax
  101988:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10198b:	83 7d fc ff          	cmpl   $0xffffffff,-0x4(%ebp)
  10198f:	75 07                	jne    101998 <block_decrease+0x1b>
  101991:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101996:	eb 69                	jmp    101a01 <block_decrease+0x84>
  101998:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10199b:	89 d0                	mov    %edx,%eax
  10199d:	c1 e0 07             	shl    $0x7,%eax
  1019a0:	01 d0                	add    %edx,%eax
  1019a2:	01 c0                	add    %eax,%eax
  1019a4:	01 d0                	add    %edx,%eax
  1019a6:	01 c0                	add    %eax,%eax
  1019a8:	01 d0                	add    %edx,%eax
  1019aa:	c1 e0 04             	shl    $0x4,%eax
  1019ad:	05 34 71 10 00       	add    $0x107134,%eax
  1019b2:	8b 00                	mov    (%eax),%eax
  1019b4:	8d 48 ff             	lea    -0x1(%eax),%ecx
  1019b7:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1019ba:	89 d0                	mov    %edx,%eax
  1019bc:	c1 e0 07             	shl    $0x7,%eax
  1019bf:	01 d0                	add    %edx,%eax
  1019c1:	01 c0                	add    %eax,%eax
  1019c3:	01 d0                	add    %edx,%eax
  1019c5:	01 c0                	add    %eax,%eax
  1019c7:	01 d0                	add    %edx,%eax
  1019c9:	c1 e0 04             	shl    $0x4,%eax
  1019cc:	05 34 71 10 00       	add    $0x107134,%eax
  1019d1:	89 08                	mov    %ecx,(%eax)
  1019d3:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1019d6:	89 d0                	mov    %edx,%eax
  1019d8:	c1 e0 07             	shl    $0x7,%eax
  1019db:	01 d0                	add    %edx,%eax
  1019dd:	01 c0                	add    %eax,%eax
  1019df:	01 d0                	add    %edx,%eax
  1019e1:	01 c0                	add    %eax,%eax
  1019e3:	01 d0                	add    %edx,%eax
  1019e5:	c1 e0 04             	shl    $0x4,%eax
  1019e8:	05 40 71 10 00       	add    $0x107140,%eax
  1019ed:	8b 00                	mov    (%eax),%eax
  1019ef:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1019f2:	a1 28 47 10 00       	mov    0x104728,%eax
  1019f7:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1019fa:	75 9c                	jne    101998 <block_decrease+0x1b>
  1019fc:	b8 01 00 00 00       	mov    $0x1,%eax
  101a01:	c9                   	leave  
  101a02:	c3                   	ret    

00101a03 <init_pcb>:
  101a03:	55                   	push   %ebp
  101a04:	89 e5                	mov    %esp,%ebp
  101a06:	83 ec 10             	sub    $0x10,%esp
  101a09:	c7 05 c8 50 10 00 05 	movl   $0x5,0x1050c8
  101a10:	00 00 00 
  101a13:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101a1a:	e9 86 00 00 00       	jmp    101aa5 <init_pcb+0xa2>
  101a1f:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  101a22:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101a25:	89 d0                	mov    %edx,%eax
  101a27:	c1 e0 07             	shl    $0x7,%eax
  101a2a:	01 d0                	add    %edx,%eax
  101a2c:	01 c0                	add    %eax,%eax
  101a2e:	01 d0                	add    %edx,%eax
  101a30:	01 c0                	add    %eax,%eax
  101a32:	01 d0                	add    %edx,%eax
  101a34:	c1 e0 04             	shl    $0x4,%eax
  101a37:	05 38 71 10 00       	add    $0x107138,%eax
  101a3c:	89 08                	mov    %ecx,(%eax)
  101a3e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101a41:	48                   	dec    %eax
  101a42:	89 c1                	mov    %eax,%ecx
  101a44:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101a47:	89 d0                	mov    %edx,%eax
  101a49:	c1 e0 07             	shl    $0x7,%eax
  101a4c:	01 d0                	add    %edx,%eax
  101a4e:	01 c0                	add    %eax,%eax
  101a50:	01 d0                	add    %edx,%eax
  101a52:	01 c0                	add    %eax,%eax
  101a54:	01 d0                	add    %edx,%eax
  101a56:	c1 e0 04             	shl    $0x4,%eax
  101a59:	05 3c 71 10 00       	add    $0x10713c,%eax
  101a5e:	89 08                	mov    %ecx,(%eax)
  101a60:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101a63:	40                   	inc    %eax
  101a64:	89 c1                	mov    %eax,%ecx
  101a66:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101a69:	89 d0                	mov    %edx,%eax
  101a6b:	c1 e0 07             	shl    $0x7,%eax
  101a6e:	01 d0                	add    %edx,%eax
  101a70:	01 c0                	add    %eax,%eax
  101a72:	01 d0                	add    %edx,%eax
  101a74:	01 c0                	add    %eax,%eax
  101a76:	01 d0                	add    %edx,%eax
  101a78:	c1 e0 04             	shl    $0x4,%eax
  101a7b:	05 40 71 10 00       	add    $0x107140,%eax
  101a80:	89 08                	mov    %ecx,(%eax)
  101a82:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101a85:	89 d0                	mov    %edx,%eax
  101a87:	c1 e0 07             	shl    $0x7,%eax
  101a8a:	01 d0                	add    %edx,%eax
  101a8c:	01 c0                	add    %eax,%eax
  101a8e:	01 d0                	add    %edx,%eax
  101a90:	01 c0                	add    %eax,%eax
  101a92:	01 d0                	add    %edx,%eax
  101a94:	c1 e0 04             	shl    $0x4,%eax
  101a97:	05 2c 71 10 00       	add    $0x10712c,%eax
  101a9c:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  101aa2:	ff 45 fc             	incl   -0x4(%ebp)
  101aa5:	81 7d fc ff 07 00 00 	cmpl   $0x7ff,-0x4(%ebp)
  101aac:	0f 8e 6d ff ff ff    	jle    101a1f <init_pcb+0x1c>
  101ab2:	c7 05 3c 71 10 00 ff 	movl   $0x7ff,0x10713c
  101ab9:	07 00 00 
  101abc:	c7 05 d0 d0 13 01 00 	movl   $0x0,0x113d0d0
  101ac3:	00 00 00 
  101ac6:	90                   	nop
  101ac7:	c9                   	leave  
  101ac8:	c3                   	ret    

00101ac9 <init_kernel_pcb>:
  101ac9:	55                   	push   %ebp
  101aca:	89 e5                	mov    %esp,%ebp
  101acc:	83 ec 08             	sub    $0x8,%esp
  101acf:	e8 1a f8 ff ff       	call   1012ee <apply_new_pid>
  101ad4:	85 c0                	test   %eax,%eax
  101ad6:	74 15                	je     101aed <init_kernel_pcb+0x24>
  101ad8:	83 ec 08             	sub    $0x8,%esp
  101adb:	68 e1 00 00 00       	push   $0xe1
  101ae0:	68 f8 2a 10 00       	push   $0x102af8
  101ae5:	e8 4e 0f 00 00       	call   102a38 <abort>
  101aea:	83 c4 10             	add    $0x10,%esp
  101aed:	c7 05 28 71 10 00 10 	movl   $0x10,0x107128
  101af4:	00 00 00 
  101af7:	c7 05 1c 71 10 00 08 	movl   $0x8,0x10711c
  101afe:	00 00 00 
  101b01:	c7 05 ec 70 10 00 10 	movl   $0x10,0x1070ec
  101b08:	00 00 00 
  101b0b:	c7 05 e8 70 10 00 10 	movl   $0x10,0x1070e8
  101b12:	00 00 00 
  101b15:	b8 8d 12 10 00       	mov    $0x10128d,%eax
  101b1a:	a3 18 71 10 00       	mov    %eax,0x107118
  101b1f:	c7 05 24 71 10 00 00 	movl   $0x400000,0x107124
  101b26:	00 40 00 
  101b29:	c7 05 2c 71 10 00 01 	movl   $0x1,0x10712c
  101b30:	00 00 00 
  101b33:	c7 05 30 71 10 00 04 	movl   $0x4,0x107130
  101b3a:	00 00 00 
  101b3d:	b8 01 00 00 00       	mov    $0x1,%eax
  101b42:	c9                   	leave  
  101b43:	c3                   	ret    

00101b44 <make_pcb>:
  101b44:	55                   	push   %ebp
  101b45:	89 e5                	mov    %esp,%ebp
  101b47:	57                   	push   %edi
  101b48:	56                   	push   %esi
  101b49:	53                   	push   %ebx
  101b4a:	8b 55 08             	mov    0x8(%ebp),%edx
  101b4d:	89 d0                	mov    %edx,%eax
  101b4f:	c1 e0 07             	shl    $0x7,%eax
  101b52:	01 d0                	add    %edx,%eax
  101b54:	01 c0                	add    %eax,%eax
  101b56:	01 d0                	add    %edx,%eax
  101b58:	01 c0                	add    %eax,%eax
  101b5a:	01 d0                	add    %edx,%eax
  101b5c:	c1 e0 04             	shl    $0x4,%eax
  101b5f:	8d 90 e0 70 10 00    	lea    0x1070e0(%eax),%edx
  101b65:	8b 45 0c             	mov    0xc(%ebp),%eax
  101b68:	89 c3                	mov    %eax,%ebx
  101b6a:	b8 13 00 00 00       	mov    $0x13,%eax
  101b6f:	89 d7                	mov    %edx,%edi
  101b71:	89 de                	mov    %ebx,%esi
  101b73:	89 c1                	mov    %eax,%ecx
  101b75:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101b77:	8b 4d 10             	mov    0x10(%ebp),%ecx
  101b7a:	8b 55 08             	mov    0x8(%ebp),%edx
  101b7d:	89 d0                	mov    %edx,%eax
  101b7f:	c1 e0 07             	shl    $0x7,%eax
  101b82:	01 d0                	add    %edx,%eax
  101b84:	01 c0                	add    %eax,%eax
  101b86:	01 d0                	add    %edx,%eax
  101b88:	01 c0                	add    %eax,%eax
  101b8a:	01 d0                	add    %edx,%eax
  101b8c:	c1 e0 04             	shl    $0x4,%eax
  101b8f:	05 2c 71 10 00       	add    $0x10712c,%eax
  101b94:	89 08                	mov    %ecx,(%eax)
  101b96:	8b 4d 14             	mov    0x14(%ebp),%ecx
  101b99:	8b 55 08             	mov    0x8(%ebp),%edx
  101b9c:	89 d0                	mov    %edx,%eax
  101b9e:	c1 e0 07             	shl    $0x7,%eax
  101ba1:	01 d0                	add    %edx,%eax
  101ba3:	01 c0                	add    %eax,%eax
  101ba5:	01 d0                	add    %edx,%eax
  101ba7:	01 c0                	add    %eax,%eax
  101ba9:	01 d0                	add    %edx,%eax
  101bab:	c1 e0 04             	shl    $0x4,%eax
  101bae:	05 30 71 10 00       	add    $0x107130,%eax
  101bb3:	89 08                	mov    %ecx,(%eax)
  101bb5:	8b 4d 18             	mov    0x18(%ebp),%ecx
  101bb8:	8b 55 08             	mov    0x8(%ebp),%edx
  101bbb:	89 d0                	mov    %edx,%eax
  101bbd:	c1 e0 07             	shl    $0x7,%eax
  101bc0:	01 d0                	add    %edx,%eax
  101bc2:	01 c0                	add    %eax,%eax
  101bc4:	01 d0                	add    %edx,%eax
  101bc6:	01 c0                	add    %eax,%eax
  101bc8:	01 d0                	add    %edx,%eax
  101bca:	c1 e0 04             	shl    $0x4,%eax
  101bcd:	05 34 71 10 00       	add    $0x107134,%eax
  101bd2:	89 08                	mov    %ecx,(%eax)
  101bd4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  101bd7:	8b 55 08             	mov    0x8(%ebp),%edx
  101bda:	89 d0                	mov    %edx,%eax
  101bdc:	c1 e0 07             	shl    $0x7,%eax
  101bdf:	01 d0                	add    %edx,%eax
  101be1:	01 c0                	add    %eax,%eax
  101be3:	01 d0                	add    %edx,%eax
  101be5:	01 c0                	add    %eax,%eax
  101be7:	01 d0                	add    %edx,%eax
  101be9:	c1 e0 04             	shl    $0x4,%eax
  101bec:	05 4c 71 10 00       	add    $0x10714c,%eax
  101bf1:	89 08                	mov    %ecx,(%eax)
  101bf3:	b8 01 00 00 00       	mov    $0x1,%eax
  101bf8:	5b                   	pop    %ebx
  101bf9:	5e                   	pop    %esi
  101bfa:	5f                   	pop    %edi
  101bfb:	5d                   	pop    %ebp
  101bfc:	c3                   	ret    

00101bfd <saveIdt>:
  101bfd:	55                   	push   %ebp
  101bfe:	89 e5                	mov    %esp,%ebp
  101c00:	8b 45 0c             	mov    0xc(%ebp),%eax
  101c03:	48                   	dec    %eax
  101c04:	66 a3 54 48 10 00    	mov    %ax,0x104854
  101c0a:	8b 45 08             	mov    0x8(%ebp),%eax
  101c0d:	66 a3 56 48 10 00    	mov    %ax,0x104856
  101c13:	8b 45 08             	mov    0x8(%ebp),%eax
  101c16:	c1 e8 10             	shr    $0x10,%eax
  101c19:	66 a3 58 48 10 00    	mov    %ax,0x104858
  101c1f:	b8 54 48 10 00       	mov    $0x104854,%eax
  101c24:	0f 01 18             	lidtl  (%eax)
  101c27:	90                   	nop
  101c28:	5d                   	pop    %ebp
  101c29:	c3                   	ret    

00101c2a <setIntr>:
  101c2a:	55                   	push   %ebp
  101c2b:	89 e5                	mov    %esp,%ebp
  101c2d:	8b 45 10             	mov    0x10(%ebp),%eax
  101c30:	8b 55 08             	mov    0x8(%ebp),%edx
  101c33:	66 89 02             	mov    %ax,(%edx)
  101c36:	8b 45 0c             	mov    0xc(%ebp),%eax
  101c39:	c1 e0 03             	shl    $0x3,%eax
  101c3c:	8b 55 08             	mov    0x8(%ebp),%edx
  101c3f:	66 89 42 02          	mov    %ax,0x2(%edx)
  101c43:	8b 45 08             	mov    0x8(%ebp),%eax
  101c46:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  101c4a:	8b 45 08             	mov    0x8(%ebp),%eax
  101c4d:	8a 50 05             	mov    0x5(%eax),%dl
  101c50:	83 e2 f0             	and    $0xfffffff0,%edx
  101c53:	83 ca 0e             	or     $0xe,%edx
  101c56:	88 50 05             	mov    %dl,0x5(%eax)
  101c59:	8b 45 08             	mov    0x8(%ebp),%eax
  101c5c:	8a 50 05             	mov    0x5(%eax),%dl
  101c5f:	83 e2 ef             	and    $0xffffffef,%edx
  101c62:	88 50 05             	mov    %dl,0x5(%eax)
  101c65:	8b 45 14             	mov    0x14(%ebp),%eax
  101c68:	83 e0 03             	and    $0x3,%eax
  101c6b:	88 c2                	mov    %al,%dl
  101c6d:	8b 45 08             	mov    0x8(%ebp),%eax
  101c70:	83 e2 03             	and    $0x3,%edx
  101c73:	88 d1                	mov    %dl,%cl
  101c75:	c1 e1 05             	shl    $0x5,%ecx
  101c78:	8a 50 05             	mov    0x5(%eax),%dl
  101c7b:	83 e2 9f             	and    $0xffffff9f,%edx
  101c7e:	09 ca                	or     %ecx,%edx
  101c80:	88 50 05             	mov    %dl,0x5(%eax)
  101c83:	8b 45 08             	mov    0x8(%ebp),%eax
  101c86:	8a 50 05             	mov    0x5(%eax),%dl
  101c89:	83 ca 80             	or     $0xffffff80,%edx
  101c8c:	88 50 05             	mov    %dl,0x5(%eax)
  101c8f:	8b 45 10             	mov    0x10(%ebp),%eax
  101c92:	c1 e8 10             	shr    $0x10,%eax
  101c95:	8b 55 08             	mov    0x8(%ebp),%edx
  101c98:	66 89 42 06          	mov    %ax,0x6(%edx)
  101c9c:	90                   	nop
  101c9d:	5d                   	pop    %ebp
  101c9e:	c3                   	ret    

00101c9f <setTrap>:
  101c9f:	55                   	push   %ebp
  101ca0:	89 e5                	mov    %esp,%ebp
  101ca2:	8b 45 10             	mov    0x10(%ebp),%eax
  101ca5:	8b 55 08             	mov    0x8(%ebp),%edx
  101ca8:	66 89 02             	mov    %ax,(%edx)
  101cab:	8b 45 0c             	mov    0xc(%ebp),%eax
  101cae:	c1 e0 03             	shl    $0x3,%eax
  101cb1:	8b 55 08             	mov    0x8(%ebp),%edx
  101cb4:	66 89 42 02          	mov    %ax,0x2(%edx)
  101cb8:	8b 45 08             	mov    0x8(%ebp),%eax
  101cbb:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  101cbf:	8b 45 08             	mov    0x8(%ebp),%eax
  101cc2:	8a 50 05             	mov    0x5(%eax),%dl
  101cc5:	83 ca 0f             	or     $0xf,%edx
  101cc8:	88 50 05             	mov    %dl,0x5(%eax)
  101ccb:	8b 45 08             	mov    0x8(%ebp),%eax
  101cce:	8a 50 05             	mov    0x5(%eax),%dl
  101cd1:	83 e2 ef             	and    $0xffffffef,%edx
  101cd4:	88 50 05             	mov    %dl,0x5(%eax)
  101cd7:	8b 45 14             	mov    0x14(%ebp),%eax
  101cda:	83 e0 03             	and    $0x3,%eax
  101cdd:	88 c2                	mov    %al,%dl
  101cdf:	8b 45 08             	mov    0x8(%ebp),%eax
  101ce2:	83 e2 03             	and    $0x3,%edx
  101ce5:	88 d1                	mov    %dl,%cl
  101ce7:	c1 e1 05             	shl    $0x5,%ecx
  101cea:	8a 50 05             	mov    0x5(%eax),%dl
  101ced:	83 e2 9f             	and    $0xffffff9f,%edx
  101cf0:	09 ca                	or     %ecx,%edx
  101cf2:	88 50 05             	mov    %dl,0x5(%eax)
  101cf5:	8b 45 08             	mov    0x8(%ebp),%eax
  101cf8:	8a 50 05             	mov    0x5(%eax),%dl
  101cfb:	83 ca 80             	or     $0xffffff80,%edx
  101cfe:	88 50 05             	mov    %dl,0x5(%eax)
  101d01:	8b 45 10             	mov    0x10(%ebp),%eax
  101d04:	c1 e8 10             	shr    $0x10,%eax
  101d07:	8b 55 08             	mov    0x8(%ebp),%edx
  101d0a:	66 89 42 06          	mov    %ax,0x6(%edx)
  101d0e:	90                   	nop
  101d0f:	5d                   	pop    %ebp
  101d10:	c3                   	ret    

00101d11 <initIdt>:
  101d11:	55                   	push   %ebp
  101d12:	89 e5                	mov    %esp,%ebp
  101d14:	83 ec 10             	sub    $0x10,%esp
  101d17:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101d1e:	eb 21                	jmp    101d41 <initIdt+0x30>
  101d20:	ba 5b 2a 10 00       	mov    $0x102a5b,%edx
  101d25:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101d28:	c1 e0 03             	shl    $0x3,%eax
  101d2b:	05 c0 d1 13 01       	add    $0x113d1c0,%eax
  101d30:	6a 00                	push   $0x0
  101d32:	52                   	push   %edx
  101d33:	6a 01                	push   $0x1
  101d35:	50                   	push   %eax
  101d36:	e8 64 ff ff ff       	call   101c9f <setTrap>
  101d3b:	83 c4 10             	add    $0x10,%esp
  101d3e:	ff 45 fc             	incl   -0x4(%ebp)
  101d41:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  101d48:	7e d6                	jle    101d20 <initIdt+0xf>
  101d4a:	ba 61 2a 10 00       	mov    $0x102a61,%edx
  101d4f:	b8 28 d2 13 01       	mov    $0x113d228,%eax
  101d54:	6a 00                	push   $0x0
  101d56:	52                   	push   %edx
  101d57:	6a 01                	push   $0x1
  101d59:	50                   	push   %eax
  101d5a:	e8 40 ff ff ff       	call   101c9f <setTrap>
  101d5f:	83 c4 10             	add    $0x10,%esp
  101d62:	ba 65 2a 10 00       	mov    $0x102a65,%edx
  101d67:	b8 c0 d5 13 01       	mov    $0x113d5c0,%eax
  101d6c:	6a 03                	push   $0x3
  101d6e:	52                   	push   %edx
  101d6f:	6a 01                	push   $0x1
  101d71:	50                   	push   %eax
  101d72:	e8 b3 fe ff ff       	call   101c2a <setIntr>
  101d77:	83 c4 10             	add    $0x10,%esp
  101d7a:	ba 6e 2a 10 00       	mov    $0x102a6e,%edx
  101d7f:	b8 c0 d2 13 01       	mov    $0x113d2c0,%eax
  101d84:	6a 00                	push   $0x0
  101d86:	52                   	push   %edx
  101d87:	6a 01                	push   $0x1
  101d89:	50                   	push   %eax
  101d8a:	e8 9b fe ff ff       	call   101c2a <setIntr>
  101d8f:	83 c4 10             	add    $0x10,%esp
  101d92:	68 00 08 00 00       	push   $0x800
  101d97:	68 c0 d1 13 01       	push   $0x113d1c0
  101d9c:	e8 5c fe ff ff       	call   101bfd <saveIdt>
  101da1:	83 c4 08             	add    $0x8,%esp
  101da4:	90                   	nop
  101da5:	c9                   	leave  
  101da6:	c3                   	ret    

00101da7 <enableInterrupt>:
  101da7:	55                   	push   %ebp
  101da8:	89 e5                	mov    %esp,%ebp
  101daa:	fb                   	sti    
  101dab:	90                   	nop
  101dac:	5d                   	pop    %ebp
  101dad:	c3                   	ret    

00101dae <disableInterrupt>:
  101dae:	55                   	push   %ebp
  101daf:	89 e5                	mov    %esp,%ebp
  101db1:	fa                   	cli    
  101db2:	90                   	nop
  101db3:	5d                   	pop    %ebp
  101db4:	c3                   	ret    

00101db5 <irqHandle>:
  101db5:	55                   	push   %ebp
  101db6:	89 e5                	mov    %esp,%ebp
  101db8:	57                   	push   %edi
  101db9:	56                   	push   %esi
  101dba:	53                   	push   %ebx
  101dbb:	83 ec 1c             	sub    $0x1c,%esp
  101dbe:	b8 10 00 00 00       	mov    $0x10,%eax
  101dc3:	89 c0                	mov    %eax,%eax
  101dc5:	8e d8                	mov    %eax,%ds
  101dc7:	8e e0                	mov    %eax,%fs
  101dc9:	8e c0                	mov    %eax,%es
  101dcb:	b8 30 00 00 00       	mov    $0x30,%eax
  101dd0:	89 c0                	mov    %eax,%eax
  101dd2:	8e e8                	mov    %eax,%gs
  101dd4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  101ddb:	89 e8                	mov    %ebp,%eax
  101ddd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  101de0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  101de3:	83 c0 08             	add    $0x8,%eax
  101de6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  101de9:	8b 45 e0             	mov    -0x20(%ebp),%eax
  101dec:	8b 10                	mov    (%eax),%edx
  101dee:	8b 45 08             	mov    0x8(%ebp),%eax
  101df1:	39 c2                	cmp    %eax,%edx
  101df3:	74 12                	je     101e07 <irqHandle+0x52>
  101df5:	83 ec 08             	sub    $0x8,%esp
  101df8:	6a 1e                	push   $0x1e
  101dfa:	68 44 2b 10 00       	push   $0x102b44
  101dff:	e8 34 0c 00 00       	call   102a38 <abort>
  101e04:	83 c4 10             	add    $0x10,%esp
  101e07:	a1 c0 50 10 00       	mov    0x1050c0,%eax
  101e0c:	89 45 dc             	mov    %eax,-0x24(%ebp)
  101e0f:	e8 9a ff ff ff       	call   101dae <disableInterrupt>
  101e14:	8b 45 08             	mov    0x8(%ebp),%eax
  101e17:	8b 40 30             	mov    0x30(%eax),%eax
  101e1a:	83 f8 0d             	cmp    $0xd,%eax
  101e1d:	74 1e                	je     101e3d <irqHandle+0x88>
  101e1f:	83 f8 0d             	cmp    $0xd,%eax
  101e22:	7f 0b                	jg     101e2f <irqHandle+0x7a>
  101e24:	83 f8 ff             	cmp    $0xffffffff,%eax
  101e27:	0f 84 9e 00 00 00    	je     101ecb <irqHandle+0x116>
  101e2d:	eb 3e                	jmp    101e6d <irqHandle+0xb8>
  101e2f:	83 f8 20             	cmp    $0x20,%eax
  101e32:	74 29                	je     101e5d <irqHandle+0xa8>
  101e34:	3d 80 00 00 00       	cmp    $0x80,%eax
  101e39:	74 12                	je     101e4d <irqHandle+0x98>
  101e3b:	eb 30                	jmp    101e6d <irqHandle+0xb8>
  101e3d:	83 ec 0c             	sub    $0xc,%esp
  101e40:	ff 75 08             	pushl  0x8(%ebp)
  101e43:	e8 7a 02 00 00       	call   1020c2 <GProtectFaultHandle>
  101e48:	83 c4 10             	add    $0x10,%esp
  101e4b:	eb 7f                	jmp    101ecc <irqHandle+0x117>
  101e4d:	83 ec 0c             	sub    $0xc,%esp
  101e50:	ff 75 08             	pushl  0x8(%ebp)
  101e53:	e8 3b 01 00 00       	call   101f93 <syscallHandle>
  101e58:	83 c4 10             	add    $0x10,%esp
  101e5b:	eb 6f                	jmp    101ecc <irqHandle+0x117>
  101e5d:	83 ec 0c             	sub    $0xc,%esp
  101e60:	ff 75 08             	pushl  0x8(%ebp)
  101e63:	e8 b8 02 00 00       	call   102120 <timeHandle>
  101e68:	83 c4 10             	add    $0x10,%esp
  101e6b:	eb 5f                	jmp    101ecc <irqHandle+0x117>
  101e6d:	83 ec 0c             	sub    $0xc,%esp
  101e70:	68 57 2b 10 00       	push   $0x102b57
  101e75:	e8 02 09 00 00       	call   10277c <printk>
  101e7a:	83 c4 10             	add    $0x10,%esp
  101e7d:	8b 45 08             	mov    0x8(%ebp),%eax
  101e80:	8b 50 38             	mov    0x38(%eax),%edx
  101e83:	8b 45 08             	mov    0x8(%ebp),%eax
  101e86:	8b 40 30             	mov    0x30(%eax),%eax
  101e89:	83 ec 08             	sub    $0x8,%esp
  101e8c:	52                   	push   %edx
  101e8d:	50                   	push   %eax
  101e8e:	68 a8 2b 10 00       	push   $0x102ba8
  101e93:	6a 35                	push   $0x35
  101e95:	68 44 2b 10 00       	push   $0x102b44
  101e9a:	68 60 2b 10 00       	push   $0x102b60
  101e9f:	e8 d8 08 00 00       	call   10277c <printk>
  101ea4:	83 c4 20             	add    $0x20,%esp
  101ea7:	83 ec 0c             	sub    $0xc,%esp
  101eaa:	68 85 2b 10 00       	push   $0x102b85
  101eaf:	e8 c8 08 00 00       	call   10277c <printk>
  101eb4:	83 c4 10             	add    $0x10,%esp
  101eb7:	83 ec 08             	sub    $0x8,%esp
  101eba:	6a 36                	push   $0x36
  101ebc:	68 44 2b 10 00       	push   $0x102b44
  101ec1:	e8 72 0b 00 00       	call   102a38 <abort>
  101ec6:	83 c4 10             	add    $0x10,%esp
  101ec9:	eb 01                	jmp    101ecc <irqHandle+0x117>
  101ecb:	90                   	nop
  101ecc:	8b 45 08             	mov    0x8(%ebp),%eax
  101ecf:	8b 40 30             	mov    0x30(%eax),%eax
  101ed2:	3d 80 00 00 00       	cmp    $0x80,%eax
  101ed7:	74 0f                	je     101ee8 <irqHandle+0x133>
  101ed9:	8b 45 08             	mov    0x8(%ebp),%eax
  101edc:	8b 40 30             	mov    0x30(%eax),%eax
  101edf:	83 f8 20             	cmp    $0x20,%eax
  101ee2:	0f 85 9d 00 00 00    	jne    101f85 <irqHandle+0x1d0>
  101ee8:	a1 c0 50 10 00       	mov    0x1050c0,%eax
  101eed:	3b 45 dc             	cmp    -0x24(%ebp),%eax
  101ef0:	0f 84 8f 00 00 00    	je     101f85 <irqHandle+0x1d0>
  101ef6:	8b 15 c0 50 10 00    	mov    0x1050c0,%edx
  101efc:	89 d0                	mov    %edx,%eax
  101efe:	c1 e0 07             	shl    $0x7,%eax
  101f01:	01 d0                	add    %edx,%eax
  101f03:	01 c0                	add    %eax,%eax
  101f05:	01 d0                	add    %edx,%eax
  101f07:	01 c0                	add    %eax,%eax
  101f09:	01 d0                	add    %edx,%eax
  101f0b:	c1 e0 04             	shl    $0x4,%eax
  101f0e:	05 e0 50 10 00       	add    $0x1050e0,%eax
  101f13:	05 fc 1f 00 00       	add    $0x1ffc,%eax
  101f18:	8d 50 b4             	lea    -0x4c(%eax),%edx
  101f1b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  101f1e:	89 10                	mov    %edx,(%eax)
  101f20:	8b 45 e0             	mov    -0x20(%ebp),%eax
  101f23:	8b 00                	mov    (%eax),%eax
  101f25:	89 45 d8             	mov    %eax,-0x28(%ebp)
  101f28:	8b 15 c0 50 10 00    	mov    0x1050c0,%edx
  101f2e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
  101f31:	89 d0                	mov    %edx,%eax
  101f33:	c1 e0 07             	shl    $0x7,%eax
  101f36:	01 d0                	add    %edx,%eax
  101f38:	01 c0                	add    %eax,%eax
  101f3a:	01 d0                	add    %edx,%eax
  101f3c:	01 c0                	add    %eax,%eax
  101f3e:	01 d0                	add    %edx,%eax
  101f40:	c1 e0 04             	shl    $0x4,%eax
  101f43:	05 e0 70 10 00       	add    $0x1070e0,%eax
  101f48:	89 ca                	mov    %ecx,%edx
  101f4a:	89 c3                	mov    %eax,%ebx
  101f4c:	b8 13 00 00 00       	mov    $0x13,%eax
  101f51:	89 d7                	mov    %edx,%edi
  101f53:	89 de                	mov    %ebx,%esi
  101f55:	89 c1                	mov    %eax,%ecx
  101f57:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101f59:	a1 c0 50 10 00       	mov    0x1050c0,%eax
  101f5e:	c1 e0 10             	shl    $0x10,%eax
  101f61:	83 ec 08             	sub    $0x8,%esp
  101f64:	50                   	push   %eax
  101f65:	6a 23                	push   $0x23
  101f67:	e8 66 e1 ff ff       	call   1000d2 <change_gdt>
  101f6c:	83 c4 10             	add    $0x10,%esp
  101f6f:	a1 c0 50 10 00       	mov    0x1050c0,%eax
  101f74:	c1 e0 10             	shl    $0x10,%eax
  101f77:	83 ec 08             	sub    $0x8,%esp
  101f7a:	50                   	push   %eax
  101f7b:	6a 1b                	push   $0x1b
  101f7d:	e8 50 e1 ff ff       	call   1000d2 <change_gdt>
  101f82:	83 c4 10             	add    $0x10,%esp
  101f85:	e8 1d fe ff ff       	call   101da7 <enableInterrupt>
  101f8a:	90                   	nop
  101f8b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101f8e:	5b                   	pop    %ebx
  101f8f:	5e                   	pop    %esi
  101f90:	5f                   	pop    %edi
  101f91:	5d                   	pop    %ebp
  101f92:	c3                   	ret    

00101f93 <syscallHandle>:
  101f93:	55                   	push   %ebp
  101f94:	89 e5                	mov    %esp,%ebp
  101f96:	83 ec 08             	sub    $0x8,%esp
  101f99:	8b 45 08             	mov    0x8(%ebp),%eax
  101f9c:	8b 40 2c             	mov    0x2c(%eax),%eax
  101f9f:	83 f8 15             	cmp    $0x15,%eax
  101fa2:	0f 84 b8 00 00 00    	je     102060 <syscallHandle+0xcd>
  101fa8:	83 f8 15             	cmp    $0x15,%eax
  101fab:	77 23                	ja     101fd0 <syscallHandle+0x3d>
  101fad:	83 f8 02             	cmp    $0x2,%eax
  101fb0:	74 7e                	je     102030 <syscallHandle+0x9d>
  101fb2:	83 f8 02             	cmp    $0x2,%eax
  101fb5:	77 0a                	ja     101fc1 <syscallHandle+0x2e>
  101fb7:	83 f8 01             	cmp    $0x1,%eax
  101fba:	74 61                	je     10201d <syscallHandle+0x8a>
  101fbc:	e9 ff 00 00 00       	jmp    1020c0 <syscallHandle+0x12d>
  101fc1:	83 f8 04             	cmp    $0x4,%eax
  101fc4:	74 31                	je     101ff7 <syscallHandle+0x64>
  101fc6:	83 f8 07             	cmp    $0x7,%eax
  101fc9:	74 7d                	je     102048 <syscallHandle+0xb5>
  101fcb:	e9 f0 00 00 00       	jmp    1020c0 <syscallHandle+0x12d>
  101fd0:	83 f8 17             	cmp    $0x17,%eax
  101fd3:	0f 84 9f 00 00 00    	je     102078 <syscallHandle+0xe5>
  101fd9:	83 f8 17             	cmp    $0x17,%eax
  101fdc:	0f 82 ae 00 00 00    	jb     102090 <syscallHandle+0xfd>
  101fe2:	83 f8 18             	cmp    $0x18,%eax
  101fe5:	0f 84 bd 00 00 00    	je     1020a8 <syscallHandle+0x115>
  101feb:	3d e6 00 00 00       	cmp    $0xe6,%eax
  101ff0:	74 18                	je     10200a <syscallHandle+0x77>
  101ff2:	e9 c9 00 00 00       	jmp    1020c0 <syscallHandle+0x12d>
  101ff7:	83 ec 0c             	sub    $0xc,%esp
  101ffa:	ff 75 08             	pushl  0x8(%ebp)
  101ffd:	e8 ef f0 ff ff       	call   1010f1 <sys_write>
  102002:	83 c4 10             	add    $0x10,%esp
  102005:	e9 b5 00 00 00       	jmp    1020bf <syscallHandle+0x12c>
  10200a:	83 ec 0c             	sub    $0xc,%esp
  10200d:	ff 75 08             	pushl  0x8(%ebp)
  102010:	e8 85 ec ff ff       	call   100c9a <sys_sleep>
  102015:	83 c4 10             	add    $0x10,%esp
  102018:	e9 a2 00 00 00       	jmp    1020bf <syscallHandle+0x12c>
  10201d:	83 ec 0c             	sub    $0xc,%esp
  102020:	ff 75 08             	pushl  0x8(%ebp)
  102023:	e8 2e ec ff ff       	call   100c56 <sys_exit>
  102028:	83 c4 10             	add    $0x10,%esp
  10202b:	e9 8f 00 00 00       	jmp    1020bf <syscallHandle+0x12c>
  102030:	83 ec 0c             	sub    $0xc,%esp
  102033:	ff 75 08             	pushl  0x8(%ebp)
  102036:	e8 99 ec ff ff       	call   100cd4 <sys_fork>
  10203b:	83 c4 10             	add    $0x10,%esp
  10203e:	89 c2                	mov    %eax,%edx
  102040:	8b 45 08             	mov    0x8(%ebp),%eax
  102043:	89 50 2c             	mov    %edx,0x2c(%eax)
  102046:	eb 77                	jmp    1020bf <syscallHandle+0x12c>
  102048:	83 ec 0c             	sub    $0xc,%esp
  10204b:	ff 75 08             	pushl  0x8(%ebp)
  10204e:	e8 3a ec ff ff       	call   100c8d <sys_getpid>
  102053:	83 c4 10             	add    $0x10,%esp
  102056:	89 c2                	mov    %eax,%edx
  102058:	8b 45 08             	mov    0x8(%ebp),%eax
  10205b:	89 50 2c             	mov    %edx,0x2c(%eax)
  10205e:	eb 5f                	jmp    1020bf <syscallHandle+0x12c>
  102060:	83 ec 0c             	sub    $0xc,%esp
  102063:	ff 75 08             	pushl  0x8(%ebp)
  102066:	e8 e0 02 00 00       	call   10234b <sys_sem_init>
  10206b:	83 c4 10             	add    $0x10,%esp
  10206e:	89 c2                	mov    %eax,%edx
  102070:	8b 45 08             	mov    0x8(%ebp),%eax
  102073:	89 50 2c             	mov    %edx,0x2c(%eax)
  102076:	eb 47                	jmp    1020bf <syscallHandle+0x12c>
  102078:	83 ec 0c             	sub    $0xc,%esp
  10207b:	ff 75 08             	pushl  0x8(%ebp)
  10207e:	e8 0b 03 00 00       	call   10238e <sys_sem_post>
  102083:	83 c4 10             	add    $0x10,%esp
  102086:	89 c2                	mov    %eax,%edx
  102088:	8b 45 08             	mov    0x8(%ebp),%eax
  10208b:	89 50 2c             	mov    %edx,0x2c(%eax)
  10208e:	eb 2f                	jmp    1020bf <syscallHandle+0x12c>
  102090:	83 ec 0c             	sub    $0xc,%esp
  102093:	ff 75 08             	pushl  0x8(%ebp)
  102096:	e8 30 03 00 00       	call   1023cb <sys_sem_wait>
  10209b:	83 c4 10             	add    $0x10,%esp
  10209e:	89 c2                	mov    %eax,%edx
  1020a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1020a3:	89 50 2c             	mov    %edx,0x2c(%eax)
  1020a6:	eb 17                	jmp    1020bf <syscallHandle+0x12c>
  1020a8:	83 ec 0c             	sub    $0xc,%esp
  1020ab:	ff 75 08             	pushl  0x8(%ebp)
  1020ae:	e8 55 03 00 00       	call   102408 <sys_sem_destroy>
  1020b3:	83 c4 10             	add    $0x10,%esp
  1020b6:	89 c2                	mov    %eax,%edx
  1020b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1020bb:	89 50 2c             	mov    %edx,0x2c(%eax)
  1020be:	90                   	nop
  1020bf:	90                   	nop
  1020c0:	c9                   	leave  
  1020c1:	c3                   	ret    

001020c2 <GProtectFaultHandle>:
  1020c2:	55                   	push   %ebp
  1020c3:	89 e5                	mov    %esp,%ebp
  1020c5:	83 ec 08             	sub    $0x8,%esp
  1020c8:	83 ec 0c             	sub    $0xc,%esp
  1020cb:	68 57 2b 10 00       	push   $0x102b57
  1020d0:	e8 a7 06 00 00       	call   10277c <printk>
  1020d5:	83 c4 10             	add    $0x10,%esp
  1020d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1020db:	8b 40 30             	mov    0x30(%eax),%eax
  1020de:	83 ec 0c             	sub    $0xc,%esp
  1020e1:	50                   	push   %eax
  1020e2:	68 b4 2b 10 00       	push   $0x102bb4
  1020e7:	6a 75                	push   $0x75
  1020e9:	68 44 2b 10 00       	push   $0x102b44
  1020ee:	68 8b 2b 10 00       	push   $0x102b8b
  1020f3:	e8 84 06 00 00       	call   10277c <printk>
  1020f8:	83 c4 20             	add    $0x20,%esp
  1020fb:	83 ec 0c             	sub    $0xc,%esp
  1020fe:	68 85 2b 10 00       	push   $0x102b85
  102103:	e8 74 06 00 00       	call   10277c <printk>
  102108:	83 c4 10             	add    $0x10,%esp
  10210b:	83 ec 08             	sub    $0x8,%esp
  10210e:	6a 76                	push   $0x76
  102110:	68 44 2b 10 00       	push   $0x102b44
  102115:	e8 1e 09 00 00       	call   102a38 <abort>
  10211a:	83 c4 10             	add    $0x10,%esp
  10211d:	90                   	nop
  10211e:	c9                   	leave  
  10211f:	c3                   	ret    

00102120 <timeHandle>:
  102120:	55                   	push   %ebp
  102121:	89 e5                	mov    %esp,%ebp
  102123:	83 ec 18             	sub    $0x18,%esp
  102126:	8b 15 c0 50 10 00    	mov    0x1050c0,%edx
  10212c:	8b 0d c0 50 10 00    	mov    0x1050c0,%ecx
  102132:	89 c8                	mov    %ecx,%eax
  102134:	c1 e0 07             	shl    $0x7,%eax
  102137:	01 c8                	add    %ecx,%eax
  102139:	01 c0                	add    %eax,%eax
  10213b:	01 c8                	add    %ecx,%eax
  10213d:	01 c0                	add    %eax,%eax
  10213f:	01 c8                	add    %ecx,%eax
  102141:	c1 e0 04             	shl    $0x4,%eax
  102144:	05 30 71 10 00       	add    $0x107130,%eax
  102149:	8b 00                	mov    (%eax),%eax
  10214b:	8d 48 ff             	lea    -0x1(%eax),%ecx
  10214e:	89 d0                	mov    %edx,%eax
  102150:	c1 e0 07             	shl    $0x7,%eax
  102153:	01 d0                	add    %edx,%eax
  102155:	01 c0                	add    %eax,%eax
  102157:	01 d0                	add    %edx,%eax
  102159:	01 c0                	add    %eax,%eax
  10215b:	01 d0                	add    %edx,%eax
  10215d:	c1 e0 04             	shl    $0x4,%eax
  102160:	05 30 71 10 00       	add    $0x107130,%eax
  102165:	89 08                	mov    %ecx,(%eax)
  102167:	e8 11 f8 ff ff       	call   10197d <block_decrease>
  10216c:	e8 89 f2 ff ff       	call   1013fa <check_block>
  102171:	8b 15 c0 50 10 00    	mov    0x1050c0,%edx
  102177:	89 d0                	mov    %edx,%eax
  102179:	c1 e0 07             	shl    $0x7,%eax
  10217c:	01 d0                	add    %edx,%eax
  10217e:	01 c0                	add    %eax,%eax
  102180:	01 d0                	add    %edx,%eax
  102182:	01 c0                	add    %eax,%eax
  102184:	01 d0                	add    %edx,%eax
  102186:	c1 e0 04             	shl    $0x4,%eax
  102189:	05 30 71 10 00       	add    $0x107130,%eax
  10218e:	8b 00                	mov    (%eax),%eax
  102190:	85 c0                	test   %eax,%eax
  102192:	7f 2d                	jg     1021c1 <timeHandle+0xa1>
  102194:	a1 c0 50 10 00       	mov    0x1050c0,%eax
  102199:	83 ec 08             	sub    $0x8,%esp
  10219c:	ff 75 08             	pushl  0x8(%ebp)
  10219f:	50                   	push   %eax
  1021a0:	e8 c5 f1 ff ff       	call   10136a <put_into_runnable>
  1021a5:	83 c4 10             	add    $0x10,%esp
  1021a8:	e8 9d f1 ff ff       	call   10134a <get_from_runnable>
  1021ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1021b0:	83 ec 08             	sub    $0x8,%esp
  1021b3:	ff 75 08             	pushl  0x8(%ebp)
  1021b6:	ff 75 f4             	pushl  -0xc(%ebp)
  1021b9:	e8 d9 f0 ff ff       	call   101297 <put_into_running>
  1021be:	83 c4 10             	add    $0x10,%esp
  1021c1:	e8 66 f1 ff ff       	call   10132c <getpid>
  1021c6:	85 c0                	test   %eax,%eax
  1021c8:	75 12                	jne    1021dc <timeHandle+0xbc>
  1021ca:	83 ec 0c             	sub    $0xc,%esp
  1021cd:	68 a1 2b 10 00       	push   $0x102ba1
  1021d2:	e8 a5 05 00 00       	call   10277c <printk>
  1021d7:	83 c4 10             	add    $0x10,%esp
  1021da:	eb 16                	jmp    1021f2 <timeHandle+0xd2>
  1021dc:	e8 4b f1 ff ff       	call   10132c <getpid>
  1021e1:	83 ec 08             	sub    $0x8,%esp
  1021e4:	50                   	push   %eax
  1021e5:	68 a3 2b 10 00       	push   $0x102ba3
  1021ea:	e8 8d 05 00 00       	call   10277c <printk>
  1021ef:	83 c4 10             	add    $0x10,%esp
  1021f2:	90                   	nop
  1021f3:	c9                   	leave  
  1021f4:	c3                   	ret    

001021f5 <W>:
  1021f5:	55                   	push   %ebp
  1021f6:	89 e5                	mov    %esp,%ebp
  1021f8:	83 ec 18             	sub    $0x18,%esp
  1021fb:	e8 2c f1 ff ff       	call   10132c <getpid>
  102200:	89 c2                	mov    %eax,%edx
  102202:	8b 45 08             	mov    0x8(%ebp),%eax
  102205:	8b 48 04             	mov    0x4(%eax),%ecx
  102208:	89 d0                	mov    %edx,%eax
  10220a:	c1 e0 07             	shl    $0x7,%eax
  10220d:	01 d0                	add    %edx,%eax
  10220f:	01 c0                	add    %eax,%eax
  102211:	01 d0                	add    %edx,%eax
  102213:	01 c0                	add    %eax,%eax
  102215:	01 d0                	add    %edx,%eax
  102217:	c1 e0 04             	shl    $0x4,%eax
  10221a:	05 48 71 10 00       	add    $0x107148,%eax
  10221f:	89 08                	mov    %ecx,(%eax)
  102221:	e8 06 f1 ff ff       	call   10132c <getpid>
  102226:	89 c2                	mov    %eax,%edx
  102228:	89 d0                	mov    %edx,%eax
  10222a:	c1 e0 07             	shl    $0x7,%eax
  10222d:	01 d0                	add    %edx,%eax
  10222f:	01 c0                	add    %eax,%eax
  102231:	01 d0                	add    %edx,%eax
  102233:	01 c0                	add    %eax,%eax
  102235:	01 d0                	add    %edx,%eax
  102237:	c1 e0 04             	shl    $0x4,%eax
  10223a:	8d 90 e0 50 10 00    	lea    0x1050e0(%eax),%edx
  102240:	8b 45 08             	mov    0x8(%ebp),%eax
  102243:	89 50 04             	mov    %edx,0x4(%eax)
  102246:	e8 ff f0 ff ff       	call   10134a <get_from_runnable>
  10224b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10224e:	e8 d9 f0 ff ff       	call   10132c <getpid>
  102253:	83 f8 02             	cmp    $0x2,%eax
  102256:	74 12                	je     10226a <W+0x75>
  102258:	83 ec 08             	sub    $0x8,%esp
  10225b:	6a 0c                	push   $0xc
  10225d:	68 c8 2b 10 00       	push   $0x102bc8
  102262:	e8 d1 07 00 00       	call   102a38 <abort>
  102267:	83 c4 10             	add    $0x10,%esp
  10226a:	83 ec 08             	sub    $0x8,%esp
  10226d:	6a 00                	push   $0x0
  10226f:	ff 75 f4             	pushl  -0xc(%ebp)
  102272:	e8 20 f0 ff ff       	call   101297 <put_into_running>
  102277:	83 c4 10             	add    $0x10,%esp
  10227a:	90                   	nop
  10227b:	c9                   	leave  
  10227c:	c3                   	ret    

0010227d <R>:
  10227d:	55                   	push   %ebp
  10227e:	89 e5                	mov    %esp,%ebp
  102280:	83 ec 18             	sub    $0x18,%esp
  102283:	8b 45 08             	mov    0x8(%ebp),%eax
  102286:	8b 40 04             	mov    0x4(%eax),%eax
  102289:	8b 80 58 20 00 00    	mov    0x2058(%eax),%eax
  10228f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102292:	8b 45 08             	mov    0x8(%ebp),%eax
  102295:	8b 40 04             	mov    0x4(%eax),%eax
  102298:	8b 90 68 20 00 00    	mov    0x2068(%eax),%edx
  10229e:	8b 45 08             	mov    0x8(%ebp),%eax
  1022a1:	89 50 04             	mov    %edx,0x4(%eax)
  1022a4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1022a7:	89 d0                	mov    %edx,%eax
  1022a9:	c1 e0 07             	shl    $0x7,%eax
  1022ac:	01 d0                	add    %edx,%eax
  1022ae:	01 c0                	add    %eax,%eax
  1022b0:	01 d0                	add    %edx,%eax
  1022b2:	01 c0                	add    %eax,%eax
  1022b4:	01 d0                	add    %edx,%eax
  1022b6:	c1 e0 04             	shl    $0x4,%eax
  1022b9:	05 00 20 00 00       	add    $0x2000,%eax
  1022be:	05 e0 50 10 00       	add    $0x1050e0,%eax
  1022c3:	83 ec 08             	sub    $0x8,%esp
  1022c6:	50                   	push   %eax
  1022c7:	ff 75 f4             	pushl  -0xc(%ebp)
  1022ca:	e8 9b f0 ff ff       	call   10136a <put_into_runnable>
  1022cf:	83 c4 10             	add    $0x10,%esp
  1022d2:	e8 55 f0 ff ff       	call   10132c <getpid>
  1022d7:	83 f8 01             	cmp    $0x1,%eax
  1022da:	74 12                	je     1022ee <R+0x71>
  1022dc:	83 ec 08             	sub    $0x8,%esp
  1022df:	6a 16                	push   $0x16
  1022e1:	68 c8 2b 10 00       	push   $0x102bc8
  1022e6:	e8 4d 07 00 00       	call   102a38 <abort>
  1022eb:	83 c4 10             	add    $0x10,%esp
  1022ee:	90                   	nop
  1022ef:	c9                   	leave  
  1022f0:	c3                   	ret    

001022f1 <P>:
  1022f1:	55                   	push   %ebp
  1022f2:	89 e5                	mov    %esp,%ebp
  1022f4:	83 ec 08             	sub    $0x8,%esp
  1022f7:	8b 45 08             	mov    0x8(%ebp),%eax
  1022fa:	8b 00                	mov    (%eax),%eax
  1022fc:	8d 50 ff             	lea    -0x1(%eax),%edx
  1022ff:	8b 45 08             	mov    0x8(%ebp),%eax
  102302:	89 10                	mov    %edx,(%eax)
  102304:	8b 45 08             	mov    0x8(%ebp),%eax
  102307:	8b 00                	mov    (%eax),%eax
  102309:	85 c0                	test   %eax,%eax
  10230b:	79 0e                	jns    10231b <P+0x2a>
  10230d:	83 ec 0c             	sub    $0xc,%esp
  102310:	ff 75 08             	pushl  0x8(%ebp)
  102313:	e8 dd fe ff ff       	call   1021f5 <W>
  102318:	83 c4 10             	add    $0x10,%esp
  10231b:	90                   	nop
  10231c:	c9                   	leave  
  10231d:	c3                   	ret    

0010231e <V>:
  10231e:	55                   	push   %ebp
  10231f:	89 e5                	mov    %esp,%ebp
  102321:	83 ec 08             	sub    $0x8,%esp
  102324:	8b 45 08             	mov    0x8(%ebp),%eax
  102327:	8b 00                	mov    (%eax),%eax
  102329:	8d 50 01             	lea    0x1(%eax),%edx
  10232c:	8b 45 08             	mov    0x8(%ebp),%eax
  10232f:	89 10                	mov    %edx,(%eax)
  102331:	8b 45 08             	mov    0x8(%ebp),%eax
  102334:	8b 00                	mov    (%eax),%eax
  102336:	85 c0                	test   %eax,%eax
  102338:	7f 0e                	jg     102348 <V+0x2a>
  10233a:	83 ec 0c             	sub    $0xc,%esp
  10233d:	ff 75 08             	pushl  0x8(%ebp)
  102340:	e8 38 ff ff ff       	call   10227d <R>
  102345:	83 c4 10             	add    $0x10,%esp
  102348:	90                   	nop
  102349:	c9                   	leave  
  10234a:	c3                   	ret    

0010234b <sys_sem_init>:
  10234b:	55                   	push   %ebp
  10234c:	89 e5                	mov    %esp,%ebp
  10234e:	53                   	push   %ebx
  10234f:	83 ec 14             	sub    $0x14,%esp
  102352:	8b 45 08             	mov    0x8(%ebp),%eax
  102355:	8b 58 20             	mov    0x20(%eax),%ebx
  102358:	e8 cf ef ff ff       	call   10132c <getpid>
  10235d:	c1 e0 10             	shl    $0x10,%eax
  102360:	01 d8                	add    %ebx,%eax
  102362:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102365:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102368:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  10236e:	8b 45 08             	mov    0x8(%ebp),%eax
  102371:	8b 40 28             	mov    0x28(%eax),%eax
  102374:	a3 c0 d9 13 01       	mov    %eax,0x113d9c0
  102379:	c7 05 c4 d9 13 01 00 	movl   $0x0,0x113d9c4
  102380:	00 00 00 
  102383:	b8 00 00 00 00       	mov    $0x0,%eax
  102388:	83 c4 14             	add    $0x14,%esp
  10238b:	5b                   	pop    %ebx
  10238c:	5d                   	pop    %ebp
  10238d:	c3                   	ret    

0010238e <sys_sem_post>:
  10238e:	55                   	push   %ebp
  10238f:	89 e5                	mov    %esp,%ebp
  102391:	53                   	push   %ebx
  102392:	83 ec 14             	sub    $0x14,%esp
  102395:	8b 45 08             	mov    0x8(%ebp),%eax
  102398:	8b 58 20             	mov    0x20(%eax),%ebx
  10239b:	e8 8c ef ff ff       	call   10132c <getpid>
  1023a0:	c1 e0 10             	shl    $0x10,%eax
  1023a3:	01 d8                	add    %ebx,%eax
  1023a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1023a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1023ab:	8b 00                	mov    (%eax),%eax
  1023ad:	c1 e0 03             	shl    $0x3,%eax
  1023b0:	05 c0 d9 13 01       	add    $0x113d9c0,%eax
  1023b5:	83 ec 0c             	sub    $0xc,%esp
  1023b8:	50                   	push   %eax
  1023b9:	e8 60 ff ff ff       	call   10231e <V>
  1023be:	83 c4 10             	add    $0x10,%esp
  1023c1:	b8 01 00 00 00       	mov    $0x1,%eax
  1023c6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1023c9:	c9                   	leave  
  1023ca:	c3                   	ret    

001023cb <sys_sem_wait>:
  1023cb:	55                   	push   %ebp
  1023cc:	89 e5                	mov    %esp,%ebp
  1023ce:	53                   	push   %ebx
  1023cf:	83 ec 14             	sub    $0x14,%esp
  1023d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1023d5:	8b 58 20             	mov    0x20(%eax),%ebx
  1023d8:	e8 4f ef ff ff       	call   10132c <getpid>
  1023dd:	c1 e0 10             	shl    $0x10,%eax
  1023e0:	01 d8                	add    %ebx,%eax
  1023e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1023e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1023e8:	8b 00                	mov    (%eax),%eax
  1023ea:	c1 e0 03             	shl    $0x3,%eax
  1023ed:	05 c0 d9 13 01       	add    $0x113d9c0,%eax
  1023f2:	83 ec 0c             	sub    $0xc,%esp
  1023f5:	50                   	push   %eax
  1023f6:	e8 f6 fe ff ff       	call   1022f1 <P>
  1023fb:	83 c4 10             	add    $0x10,%esp
  1023fe:	b8 01 00 00 00       	mov    $0x1,%eax
  102403:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102406:	c9                   	leave  
  102407:	c3                   	ret    

00102408 <sys_sem_destroy>:
  102408:	55                   	push   %ebp
  102409:	89 e5                	mov    %esp,%ebp
  10240b:	b8 01 00 00 00       	mov    $0x1,%eax
  102410:	5d                   	pop    %ebp
  102411:	c3                   	ret    

00102412 <inByte>:
  102412:	55                   	push   %ebp
  102413:	89 e5                	mov    %esp,%ebp
  102415:	83 ec 14             	sub    $0x14,%esp
  102418:	8b 45 08             	mov    0x8(%ebp),%eax
  10241b:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  10241f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102422:	89 c2                	mov    %eax,%edx
  102424:	ec                   	in     (%dx),%al
  102425:	88 45 ff             	mov    %al,-0x1(%ebp)
  102428:	8a 45 ff             	mov    -0x1(%ebp),%al
  10242b:	c9                   	leave  
  10242c:	c3                   	ret    

0010242d <outByte>:
  10242d:	55                   	push   %ebp
  10242e:	89 e5                	mov    %esp,%ebp
  102430:	83 ec 08             	sub    $0x8,%esp
  102433:	8b 45 08             	mov    0x8(%ebp),%eax
  102436:	8b 55 0c             	mov    0xc(%ebp),%edx
  102439:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  10243d:	88 55 f8             	mov    %dl,-0x8(%ebp)
  102440:	8a 45 f8             	mov    -0x8(%ebp),%al
  102443:	8b 55 fc             	mov    -0x4(%ebp),%edx
  102446:	ee                   	out    %al,(%dx)
  102447:	90                   	nop
  102448:	c9                   	leave  
  102449:	c3                   	ret    

0010244a <initIntr>:
  10244a:	55                   	push   %ebp
  10244b:	89 e5                	mov    %esp,%ebp
  10244d:	6a ff                	push   $0xffffffff
  10244f:	6a 21                	push   $0x21
  102451:	e8 d7 ff ff ff       	call   10242d <outByte>
  102456:	83 c4 08             	add    $0x8,%esp
  102459:	6a ff                	push   $0xffffffff
  10245b:	68 a1 00 00 00       	push   $0xa1
  102460:	e8 c8 ff ff ff       	call   10242d <outByte>
  102465:	83 c4 08             	add    $0x8,%esp
  102468:	6a 11                	push   $0x11
  10246a:	6a 20                	push   $0x20
  10246c:	e8 bc ff ff ff       	call   10242d <outByte>
  102471:	83 c4 08             	add    $0x8,%esp
  102474:	6a 20                	push   $0x20
  102476:	6a 21                	push   $0x21
  102478:	e8 b0 ff ff ff       	call   10242d <outByte>
  10247d:	83 c4 08             	add    $0x8,%esp
  102480:	6a 04                	push   $0x4
  102482:	6a 21                	push   $0x21
  102484:	e8 a4 ff ff ff       	call   10242d <outByte>
  102489:	83 c4 08             	add    $0x8,%esp
  10248c:	6a 03                	push   $0x3
  10248e:	6a 21                	push   $0x21
  102490:	e8 98 ff ff ff       	call   10242d <outByte>
  102495:	83 c4 08             	add    $0x8,%esp
  102498:	6a 11                	push   $0x11
  10249a:	68 a0 00 00 00       	push   $0xa0
  10249f:	e8 89 ff ff ff       	call   10242d <outByte>
  1024a4:	83 c4 08             	add    $0x8,%esp
  1024a7:	6a 28                	push   $0x28
  1024a9:	68 a1 00 00 00       	push   $0xa1
  1024ae:	e8 7a ff ff ff       	call   10242d <outByte>
  1024b3:	83 c4 08             	add    $0x8,%esp
  1024b6:	6a 02                	push   $0x2
  1024b8:	68 a1 00 00 00       	push   $0xa1
  1024bd:	e8 6b ff ff ff       	call   10242d <outByte>
  1024c2:	83 c4 08             	add    $0x8,%esp
  1024c5:	6a 03                	push   $0x3
  1024c7:	68 a1 00 00 00       	push   $0xa1
  1024cc:	e8 5c ff ff ff       	call   10242d <outByte>
  1024d1:	83 c4 08             	add    $0x8,%esp
  1024d4:	6a 68                	push   $0x68
  1024d6:	6a 20                	push   $0x20
  1024d8:	e8 50 ff ff ff       	call   10242d <outByte>
  1024dd:	83 c4 08             	add    $0x8,%esp
  1024e0:	6a 0a                	push   $0xa
  1024e2:	6a 20                	push   $0x20
  1024e4:	e8 44 ff ff ff       	call   10242d <outByte>
  1024e9:	83 c4 08             	add    $0x8,%esp
  1024ec:	6a 68                	push   $0x68
  1024ee:	68 a0 00 00 00       	push   $0xa0
  1024f3:	e8 35 ff ff ff       	call   10242d <outByte>
  1024f8:	83 c4 08             	add    $0x8,%esp
  1024fb:	6a 0a                	push   $0xa
  1024fd:	68 a0 00 00 00       	push   $0xa0
  102502:	e8 26 ff ff ff       	call   10242d <outByte>
  102507:	83 c4 08             	add    $0x8,%esp
  10250a:	90                   	nop
  10250b:	c9                   	leave  
  10250c:	c3                   	ret    

0010250d <initTimer>:
  10250d:	55                   	push   %ebp
  10250e:	89 e5                	mov    %esp,%ebp
  102510:	83 ec 10             	sub    $0x10,%esp
  102513:	c7 45 fc 9b 2e 00 00 	movl   $0x2e9b,-0x4(%ebp)
  10251a:	6a 34                	push   $0x34
  10251c:	6a 43                	push   $0x43
  10251e:	e8 0a ff ff ff       	call   10242d <outByte>
  102523:	83 c4 08             	add    $0x8,%esp
  102526:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102529:	25 ff 00 00 80       	and    $0x800000ff,%eax
  10252e:	85 c0                	test   %eax,%eax
  102530:	79 07                	jns    102539 <initTimer+0x2c>
  102532:	48                   	dec    %eax
  102533:	0d 00 ff ff ff       	or     $0xffffff00,%eax
  102538:	40                   	inc    %eax
  102539:	0f be c0             	movsbl %al,%eax
  10253c:	50                   	push   %eax
  10253d:	6a 40                	push   $0x40
  10253f:	e8 e9 fe ff ff       	call   10242d <outByte>
  102544:	83 c4 08             	add    $0x8,%esp
  102547:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10254a:	85 c0                	test   %eax,%eax
  10254c:	79 05                	jns    102553 <initTimer+0x46>
  10254e:	05 ff 00 00 00       	add    $0xff,%eax
  102553:	c1 f8 08             	sar    $0x8,%eax
  102556:	0f be c0             	movsbl %al,%eax
  102559:	50                   	push   %eax
  10255a:	6a 40                	push   $0x40
  10255c:	e8 cc fe ff ff       	call   10242d <outByte>
  102561:	83 c4 08             	add    $0x8,%esp
  102564:	90                   	nop
  102565:	c9                   	leave  
  102566:	c3                   	ret    

00102567 <getKeyCode>:
  102567:	55                   	push   %ebp
  102568:	89 e5                	mov    %esp,%ebp
  10256a:	83 ec 10             	sub    $0x10,%esp
  10256d:	6a 60                	push   $0x60
  10256f:	e8 9e fe ff ff       	call   102412 <inByte>
  102574:	83 c4 04             	add    $0x4,%esp
  102577:	0f b6 c0             	movzbl %al,%eax
  10257a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10257d:	6a 61                	push   $0x61
  10257f:	e8 8e fe ff ff       	call   102412 <inByte>
  102584:	83 c4 04             	add    $0x4,%esp
  102587:	0f b6 c0             	movzbl %al,%eax
  10258a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10258d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102590:	83 c8 80             	or     $0xffffff80,%eax
  102593:	0f be c0             	movsbl %al,%eax
  102596:	50                   	push   %eax
  102597:	6a 61                	push   $0x61
  102599:	e8 8f fe ff ff       	call   10242d <outByte>
  10259e:	83 c4 08             	add    $0x8,%esp
  1025a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1025a4:	0f be c0             	movsbl %al,%eax
  1025a7:	50                   	push   %eax
  1025a8:	6a 61                	push   $0x61
  1025aa:	e8 7e fe ff ff       	call   10242d <outByte>
  1025af:	83 c4 08             	add    $0x8,%esp
  1025b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1025b5:	c9                   	leave  
  1025b6:	c3                   	ret    

001025b7 <i2A>:
  1025b7:	55                   	push   %ebp
  1025b8:	89 e5                	mov    %esp,%ebp
  1025ba:	83 ec 10             	sub    $0x10,%esp
  1025bd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1025c4:	c7 45 f8 7e 50 10 00 	movl   $0x10507e,-0x8(%ebp)
  1025cb:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
  1025cf:	c6 45 f6 00          	movb   $0x0,-0xa(%ebp)
  1025d3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1025d7:	79 17                	jns    1025f0 <i2A+0x39>
  1025d9:	81 7d 08 00 00 00 80 	cmpl   $0x80000000,0x8(%ebp)
  1025e0:	75 07                	jne    1025e9 <i2A+0x32>
  1025e2:	ff 45 08             	incl   0x8(%ebp)
  1025e5:	c6 45 f6 01          	movb   $0x1,-0xa(%ebp)
  1025e9:	c6 45 f7 01          	movb   $0x1,-0x9(%ebp)
  1025ed:	f7 5d 08             	negl   0x8(%ebp)
  1025f0:	ff 4d f8             	decl   -0x8(%ebp)
  1025f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1025f6:	b9 0a 00 00 00       	mov    $0xa,%ecx
  1025fb:	99                   	cltd   
  1025fc:	f7 f9                	idiv   %ecx
  1025fe:	89 d0                	mov    %edx,%eax
  102600:	83 c0 30             	add    $0x30,%eax
  102603:	88 c2                	mov    %al,%dl
  102605:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102608:	88 10                	mov    %dl,(%eax)
  10260a:	ff 45 fc             	incl   -0x4(%ebp)
  10260d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  102610:	b8 67 66 66 66       	mov    $0x66666667,%eax
  102615:	f7 e9                	imul   %ecx
  102617:	c1 fa 02             	sar    $0x2,%edx
  10261a:	89 c8                	mov    %ecx,%eax
  10261c:	c1 f8 1f             	sar    $0x1f,%eax
  10261f:	29 c2                	sub    %eax,%edx
  102621:	89 d0                	mov    %edx,%eax
  102623:	89 45 08             	mov    %eax,0x8(%ebp)
  102626:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  10262a:	75 c4                	jne    1025f0 <i2A+0x39>
  10262c:	80 7d f7 01          	cmpb   $0x1,-0x9(%ebp)
  102630:	75 0c                	jne    10263e <i2A+0x87>
  102632:	ff 4d f8             	decl   -0x8(%ebp)
  102635:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102638:	c6 00 2d             	movb   $0x2d,(%eax)
  10263b:	ff 45 fc             	incl   -0x4(%ebp)
  10263e:	80 7d f6 01          	cmpb   $0x1,-0xa(%ebp)
  102642:	75 0b                	jne    10264f <i2A+0x98>
  102644:	a0 7d 50 10 00       	mov    0x10507d,%al
  102649:	40                   	inc    %eax
  10264a:	a2 7d 50 10 00       	mov    %al,0x10507d
  10264f:	c6 05 7e 50 10 00 00 	movb   $0x0,0x10507e
  102656:	8b 45 0c             	mov    0xc(%ebp),%eax
  102659:	8b 55 f8             	mov    -0x8(%ebp),%edx
  10265c:	89 10                	mov    %edx,(%eax)
  10265e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102661:	c9                   	leave  
  102662:	c3                   	ret    

00102663 <append>:
  102663:	55                   	push   %ebp
  102664:	89 e5                	mov    %esp,%ebp
  102666:	83 ec 10             	sub    $0x10,%esp
  102669:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  102670:	eb 19                	jmp    10268b <append+0x28>
  102672:	ff 45 fc             	incl   -0x4(%ebp)
  102675:	8b 45 08             	mov    0x8(%ebp),%eax
  102678:	8d 50 01             	lea    0x1(%eax),%edx
  10267b:	89 55 08             	mov    %edx,0x8(%ebp)
  10267e:	8b 55 0c             	mov    0xc(%ebp),%edx
  102681:	8d 4a 01             	lea    0x1(%edx),%ecx
  102684:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  102687:	8a 12                	mov    (%edx),%dl
  102689:	88 10                	mov    %dl,(%eax)
  10268b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10268e:	8a 00                	mov    (%eax),%al
  102690:	84 c0                	test   %al,%al
  102692:	75 de                	jne    102672 <append+0xf>
  102694:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102697:	c9                   	leave  
  102698:	c3                   	ret    

00102699 <i2X>:
  102699:	55                   	push   %ebp
  10269a:	89 e5                	mov    %esp,%ebp
  10269c:	83 ec 10             	sub    $0x10,%esp
  10269f:	c7 45 fc 9e 50 10 00 	movl   $0x10509e,-0x4(%ebp)
  1026a6:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  1026ad:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1026b4:	ff 45 f8             	incl   -0x8(%ebp)
  1026b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1026ba:	83 e0 0f             	and    $0xf,%eax
  1026bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1026c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1026c3:	83 e8 0a             	sub    $0xa,%eax
  1026c6:	83 f8 05             	cmp    $0x5,%eax
  1026c9:	77 4b                	ja     102716 <i2X+0x7d>
  1026cb:	8b 04 85 dc 2b 10 00 	mov    0x102bdc(,%eax,4),%eax
  1026d2:	ff e0                	jmp    *%eax
  1026d4:	ff 4d fc             	decl   -0x4(%ebp)
  1026d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1026da:	c6 00 61             	movb   $0x61,(%eax)
  1026dd:	eb 47                	jmp    102726 <i2X+0x8d>
  1026df:	ff 4d fc             	decl   -0x4(%ebp)
  1026e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1026e5:	c6 00 62             	movb   $0x62,(%eax)
  1026e8:	eb 3c                	jmp    102726 <i2X+0x8d>
  1026ea:	ff 4d fc             	decl   -0x4(%ebp)
  1026ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1026f0:	c6 00 63             	movb   $0x63,(%eax)
  1026f3:	eb 31                	jmp    102726 <i2X+0x8d>
  1026f5:	ff 4d fc             	decl   -0x4(%ebp)
  1026f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1026fb:	c6 00 64             	movb   $0x64,(%eax)
  1026fe:	eb 26                	jmp    102726 <i2X+0x8d>
  102700:	ff 4d fc             	decl   -0x4(%ebp)
  102703:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102706:	c6 00 65             	movb   $0x65,(%eax)
  102709:	eb 1b                	jmp    102726 <i2X+0x8d>
  10270b:	ff 4d fc             	decl   -0x4(%ebp)
  10270e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102711:	c6 00 66             	movb   $0x66,(%eax)
  102714:	eb 10                	jmp    102726 <i2X+0x8d>
  102716:	ff 4d fc             	decl   -0x4(%ebp)
  102719:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10271c:	83 c0 30             	add    $0x30,%eax
  10271f:	88 c2                	mov    %al,%dl
  102721:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102724:	88 10                	mov    %dl,(%eax)
  102726:	8b 45 08             	mov    0x8(%ebp),%eax
  102729:	c1 e8 04             	shr    $0x4,%eax
  10272c:	89 45 08             	mov    %eax,0x8(%ebp)
  10272f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102733:	0f 85 7b ff ff ff    	jne    1026b4 <i2X+0x1b>
  102739:	c6 05 9e 50 10 00 00 	movb   $0x0,0x10509e
  102740:	8b 45 0c             	mov    0xc(%ebp),%eax
  102743:	8b 55 fc             	mov    -0x4(%ebp),%edx
  102746:	89 10                	mov    %edx,(%eax)
  102748:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10274b:	c9                   	leave  
  10274c:	c3                   	ret    

0010274d <printk_char>:
  10274d:	55                   	push   %ebp
  10274e:	89 e5                	mov    %esp,%ebp
  102750:	83 ec 08             	sub    $0x8,%esp
  102753:	eb 17                	jmp    10276c <printk_char+0x1f>
  102755:	8b 45 08             	mov    0x8(%ebp),%eax
  102758:	8a 00                	mov    (%eax),%al
  10275a:	0f be c0             	movsbl %al,%eax
  10275d:	83 ec 0c             	sub    $0xc,%esp
  102760:	50                   	push   %eax
  102761:	e8 f4 ea ff ff       	call   10125a <putChar>
  102766:	83 c4 10             	add    $0x10,%esp
  102769:	ff 45 08             	incl   0x8(%ebp)
  10276c:	8b 45 08             	mov    0x8(%ebp),%eax
  10276f:	8a 00                	mov    (%eax),%al
  102771:	84 c0                	test   %al,%al
  102773:	75 e0                	jne    102755 <printk_char+0x8>
  102775:	b8 01 00 00 00       	mov    $0x1,%eax
  10277a:	c9                   	leave  
  10277b:	c3                   	ret    

0010277c <printk>:
  10277c:	55                   	push   %ebp
  10277d:	89 e5                	mov    %esp,%ebp
  10277f:	83 ec 28             	sub    $0x28,%esp
  102782:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102789:	8d 45 0c             	lea    0xc(%ebp),%eax
  10278c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10278f:	8b 45 08             	mov    0x8(%ebp),%eax
  102792:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102795:	c7 45 e8 58 00 00 00 	movl   $0x58,-0x18(%ebp)
  10279c:	e9 57 01 00 00       	jmp    1028f8 <printk+0x17c>
  1027a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1027a4:	8a 00                	mov    (%eax),%al
  1027a6:	3c 25                	cmp    $0x25,%al
  1027a8:	75 56                	jne    102800 <printk+0x84>
  1027aa:	ff 45 ec             	incl   -0x14(%ebp)
  1027ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1027b0:	8a 00                	mov    (%eax),%al
  1027b2:	0f be c0             	movsbl %al,%eax
  1027b5:	83 f8 64             	cmp    $0x64,%eax
  1027b8:	74 18                	je     1027d2 <printk+0x56>
  1027ba:	83 f8 64             	cmp    $0x64,%eax
  1027bd:	7f 07                	jg     1027c6 <printk+0x4a>
  1027bf:	83 f8 63             	cmp    $0x63,%eax
  1027c2:	74 29                	je     1027ed <printk+0x71>
  1027c4:	eb 30                	jmp    1027f6 <printk+0x7a>
  1027c6:	83 f8 73             	cmp    $0x73,%eax
  1027c9:	74 19                	je     1027e4 <printk+0x68>
  1027cb:	83 f8 78             	cmp    $0x78,%eax
  1027ce:	74 0b                	je     1027db <printk+0x5f>
  1027d0:	eb 24                	jmp    1027f6 <printk+0x7a>
  1027d2:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
  1027d9:	eb 2c                	jmp    102807 <printk+0x8b>
  1027db:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  1027e2:	eb 23                	jmp    102807 <printk+0x8b>
  1027e4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  1027eb:	eb 1a                	jmp    102807 <printk+0x8b>
  1027ed:	c7 45 e8 03 00 00 00 	movl   $0x3,-0x18(%ebp)
  1027f4:	eb 11                	jmp    102807 <printk+0x8b>
  1027f6:	c7 45 e8 58 00 00 00 	movl   $0x58,-0x18(%ebp)
  1027fd:	90                   	nop
  1027fe:	eb 07                	jmp    102807 <printk+0x8b>
  102800:	c7 45 e8 58 00 00 00 	movl   $0x58,-0x18(%ebp)
  102807:	83 7d e8 58          	cmpl   $0x58,-0x18(%ebp)
  10280b:	75 19                	jne    102826 <printk+0xaa>
  10280d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102810:	8d 50 01             	lea    0x1(%eax),%edx
  102813:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102816:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102819:	8a 12                	mov    (%edx),%dl
  10281b:	88 90 60 48 10 00    	mov    %dl,0x104860(%eax)
  102821:	e9 cf 00 00 00       	jmp    1028f5 <printk+0x179>
  102826:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
  10282a:	75 3f                	jne    10286b <printk+0xef>
  10282c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  102833:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102836:	8d 50 04             	lea    0x4(%eax),%edx
  102839:	89 55 f0             	mov    %edx,-0x10(%ebp)
  10283c:	8b 00                	mov    (%eax),%eax
  10283e:	89 c2                	mov    %eax,%edx
  102840:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  102843:	50                   	push   %eax
  102844:	52                   	push   %edx
  102845:	e8 6d fd ff ff       	call   1025b7 <i2A>
  10284a:	83 c4 08             	add    $0x8,%esp
  10284d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102850:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102853:	81 c2 60 48 10 00    	add    $0x104860,%edx
  102859:	50                   	push   %eax
  10285a:	52                   	push   %edx
  10285b:	e8 03 fe ff ff       	call   102663 <append>
  102860:	83 c4 08             	add    $0x8,%esp
  102863:	01 45 f4             	add    %eax,-0xc(%ebp)
  102866:	e9 8a 00 00 00       	jmp    1028f5 <printk+0x179>
  10286b:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
  10286f:	75 3a                	jne    1028ab <printk+0x12f>
  102871:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  102878:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10287b:	8d 50 04             	lea    0x4(%eax),%edx
  10287e:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102881:	8b 00                	mov    (%eax),%eax
  102883:	8d 55 e0             	lea    -0x20(%ebp),%edx
  102886:	52                   	push   %edx
  102887:	50                   	push   %eax
  102888:	e8 0c fe ff ff       	call   102699 <i2X>
  10288d:	83 c4 08             	add    $0x8,%esp
  102890:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102893:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102896:	81 c2 60 48 10 00    	add    $0x104860,%edx
  10289c:	50                   	push   %eax
  10289d:	52                   	push   %edx
  10289e:	e8 c0 fd ff ff       	call   102663 <append>
  1028a3:	83 c4 08             	add    $0x8,%esp
  1028a6:	01 45 f4             	add    %eax,-0xc(%ebp)
  1028a9:	eb 4a                	jmp    1028f5 <printk+0x179>
  1028ab:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1028af:	75 24                	jne    1028d5 <printk+0x159>
  1028b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1028b4:	8d 50 04             	lea    0x4(%eax),%edx
  1028b7:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1028ba:	8b 00                	mov    (%eax),%eax
  1028bc:	89 c2                	mov    %eax,%edx
  1028be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1028c1:	05 60 48 10 00       	add    $0x104860,%eax
  1028c6:	52                   	push   %edx
  1028c7:	50                   	push   %eax
  1028c8:	e8 96 fd ff ff       	call   102663 <append>
  1028cd:	83 c4 08             	add    $0x8,%esp
  1028d0:	01 45 f4             	add    %eax,-0xc(%ebp)
  1028d3:	eb 20                	jmp    1028f5 <printk+0x179>
  1028d5:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  1028d9:	75 1a                	jne    1028f5 <printk+0x179>
  1028db:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1028de:	8d 50 01             	lea    0x1(%eax),%edx
  1028e1:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1028e4:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1028e7:	8d 4a 04             	lea    0x4(%edx),%ecx
  1028ea:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  1028ed:	8b 12                	mov    (%edx),%edx
  1028ef:	88 90 60 48 10 00    	mov    %dl,0x104860(%eax)
  1028f5:	ff 45 ec             	incl   -0x14(%ebp)
  1028f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1028fb:	8a 00                	mov    (%eax),%al
  1028fd:	84 c0                	test   %al,%al
  1028ff:	0f 85 9c fe ff ff    	jne    1027a1 <printk+0x25>
  102905:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102908:	8d 50 01             	lea    0x1(%eax),%edx
  10290b:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10290e:	c6 80 60 48 10 00 00 	movb   $0x0,0x104860(%eax)
  102915:	83 ec 08             	sub    $0x8,%esp
  102918:	68 00 04 00 00       	push   $0x400
  10291d:	68 60 48 10 00       	push   $0x104860
  102922:	e8 26 fe ff ff       	call   10274d <printk_char>
  102927:	83 c4 10             	add    $0x10,%esp
  10292a:	90                   	nop
  10292b:	c9                   	leave  
  10292c:	c3                   	ret    

0010292d <waitForInterrupt>:
  10292d:	55                   	push   %ebp
  10292e:	89 e5                	mov    %esp,%ebp
  102930:	f4                   	hlt    
  102931:	90                   	nop
  102932:	5d                   	pop    %ebp
  102933:	c3                   	ret    

00102934 <disableInterrupt>:
  102934:	55                   	push   %ebp
  102935:	89 e5                	mov    %esp,%ebp
  102937:	fa                   	cli    
  102938:	90                   	nop
  102939:	5d                   	pop    %ebp
  10293a:	c3                   	ret    

0010293b <i2A>:
  10293b:	55                   	push   %ebp
  10293c:	89 e5                	mov    %esp,%ebp
  10293e:	83 ec 10             	sub    $0x10,%esp
  102941:	c7 45 fc bd 50 10 00 	movl   $0x1050bd,-0x4(%ebp)
  102948:	ff 4d fc             	decl   -0x4(%ebp)
  10294b:	8b 45 08             	mov    0x8(%ebp),%eax
  10294e:	b9 0a 00 00 00       	mov    $0xa,%ecx
  102953:	99                   	cltd   
  102954:	f7 f9                	idiv   %ecx
  102956:	89 d0                	mov    %edx,%eax
  102958:	83 c0 30             	add    $0x30,%eax
  10295b:	88 c2                	mov    %al,%dl
  10295d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102960:	88 10                	mov    %dl,(%eax)
  102962:	8b 4d 08             	mov    0x8(%ebp),%ecx
  102965:	b8 67 66 66 66       	mov    $0x66666667,%eax
  10296a:	f7 e9                	imul   %ecx
  10296c:	c1 fa 02             	sar    $0x2,%edx
  10296f:	89 c8                	mov    %ecx,%eax
  102971:	c1 f8 1f             	sar    $0x1f,%eax
  102974:	29 c2                	sub    %eax,%edx
  102976:	89 d0                	mov    %edx,%eax
  102978:	89 45 08             	mov    %eax,0x8(%ebp)
  10297b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  10297f:	75 c7                	jne    102948 <i2A+0xd>
  102981:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102984:	c9                   	leave  
  102985:	c3                   	ret    

00102986 <append>:
  102986:	55                   	push   %ebp
  102987:	89 e5                	mov    %esp,%ebp
  102989:	eb 1a                	jmp    1029a5 <append+0x1f>
  10298b:	8b 45 08             	mov    0x8(%ebp),%eax
  10298e:	8b 00                	mov    (%eax),%eax
  102990:	8d 48 01             	lea    0x1(%eax),%ecx
  102993:	8b 55 08             	mov    0x8(%ebp),%edx
  102996:	89 0a                	mov    %ecx,(%edx)
  102998:	8b 55 0c             	mov    0xc(%ebp),%edx
  10299b:	8d 4a 01             	lea    0x1(%edx),%ecx
  10299e:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  1029a1:	8a 12                	mov    (%edx),%dl
  1029a3:	88 10                	mov    %dl,(%eax)
  1029a5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029a8:	8a 00                	mov    (%eax),%al
  1029aa:	84 c0                	test   %al,%al
  1029ac:	75 dd                	jne    10298b <append+0x5>
  1029ae:	90                   	nop
  1029af:	5d                   	pop    %ebp
  1029b0:	c3                   	ret    

001029b1 <displayMessage>:
  1029b1:	55                   	push   %ebp
  1029b2:	89 e5                	mov    %esp,%ebp
  1029b4:	83 ec 18             	sub    $0x18,%esp
  1029b7:	b8 52 47 10 00       	mov    $0x104752,%eax
  1029bc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1029bf:	ff 75 08             	pushl  0x8(%ebp)
  1029c2:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1029c5:	50                   	push   %eax
  1029c6:	e8 bb ff ff ff       	call   102986 <append>
  1029cb:	83 c4 08             	add    $0x8,%esp
  1029ce:	68 f4 2b 10 00       	push   $0x102bf4
  1029d3:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1029d6:	50                   	push   %eax
  1029d7:	e8 aa ff ff ff       	call   102986 <append>
  1029dc:	83 c4 08             	add    $0x8,%esp
  1029df:	ff 75 0c             	pushl  0xc(%ebp)
  1029e2:	e8 54 ff ff ff       	call   10293b <i2A>
  1029e7:	83 c4 04             	add    $0x4,%esp
  1029ea:	50                   	push   %eax
  1029eb:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1029ee:	50                   	push   %eax
  1029ef:	e8 92 ff ff ff       	call   102986 <append>
  1029f4:	83 c4 08             	add    $0x8,%esp
  1029f7:	68 f6 2b 10 00       	push   $0x102bf6
  1029fc:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1029ff:	50                   	push   %eax
  102a00:	e8 81 ff ff ff       	call   102986 <append>
  102a05:	83 c4 08             	add    $0x8,%esp
  102a08:	c7 45 f4 40 47 10 00 	movl   $0x104740,-0xc(%ebp)
  102a0f:	eb 1b                	jmp    102a2c <displayMessage+0x7b>
  102a11:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a14:	8a 00                	mov    (%eax),%al
  102a16:	0f be c0             	movsbl %al,%eax
  102a19:	83 ec 0c             	sub    $0xc,%esp
  102a1c:	50                   	push   %eax
  102a1d:	e8 38 e8 ff ff       	call   10125a <putChar>
  102a22:	83 c4 10             	add    $0x10,%esp
  102a25:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a28:	40                   	inc    %eax
  102a29:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102a2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a2f:	8a 00                	mov    (%eax),%al
  102a31:	84 c0                	test   %al,%al
  102a33:	75 dc                	jne    102a11 <displayMessage+0x60>
  102a35:	90                   	nop
  102a36:	c9                   	leave  
  102a37:	c3                   	ret    

00102a38 <abort>:
  102a38:	55                   	push   %ebp
  102a39:	89 e5                	mov    %esp,%ebp
  102a3b:	83 ec 08             	sub    $0x8,%esp
  102a3e:	e8 f1 fe ff ff       	call   102934 <disableInterrupt>
  102a43:	83 ec 08             	sub    $0x8,%esp
  102a46:	ff 75 0c             	pushl  0xc(%ebp)
  102a49:	ff 75 08             	pushl  0x8(%ebp)
  102a4c:	e8 60 ff ff ff       	call   1029b1 <displayMessage>
  102a51:	83 c4 10             	add    $0x10,%esp
  102a54:	e8 d4 fe ff ff       	call   10292d <waitForInterrupt>
  102a59:	eb f9                	jmp    102a54 <abort+0x1c>

00102a5b <irqEmpty>:
  102a5b:	6a 00                	push   $0x0
  102a5d:	6a ff                	push   $0xffffffff
  102a5f:	eb 13                	jmp    102a74 <asmDoIrq>

00102a61 <irqGProtectFault>:
  102a61:	6a 0d                	push   $0xd
  102a63:	eb 0f                	jmp    102a74 <asmDoIrq>

00102a65 <irqSyscall>:
  102a65:	6a 00                	push   $0x0
  102a67:	68 80 00 00 00       	push   $0x80
  102a6c:	eb 06                	jmp    102a74 <asmDoIrq>

00102a6e <irqTime>:
  102a6e:	6a 00                	push   $0x0
  102a70:	6a 20                	push   $0x20
  102a72:	eb 00                	jmp    102a74 <asmDoIrq>

00102a74 <asmDoIrq>:
  102a74:	60                   	pusha  
  102a75:	1e                   	push   %ds
  102a76:	06                   	push   %es
  102a77:	0f a0                	push   %fs
  102a79:	0f a8                	push   %gs
  102a7b:	54                   	push   %esp
  102a7c:	e8 34 f3 ff ff       	call   101db5 <irqHandle>
  102a81:	5c                   	pop    %esp
  102a82:	0f a9                	pop    %gs
  102a84:	0f a1                	pop    %fs
  102a86:	07                   	pop    %es
  102a87:	1f                   	pop    %ds
  102a88:	61                   	popa   
  102a89:	83 c4 04             	add    $0x4,%esp
  102a8c:	83 c4 04             	add    $0x4,%esp
  102a8f:	cf                   	iret   
