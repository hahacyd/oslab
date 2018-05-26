
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
  10000d:	83 ec 08             	sub    $0x8,%esp
  100010:	6a 00                	push   $0x0
  100012:	6a 00                	push   $0x0
  100014:	e8 45 10 00 00       	call   10105e <update_cursor>
  100019:	83 c4 10             	add    $0x10,%esp
  10001c:	e8 28 24 00 00       	call   102449 <initSyscallHander>
  100021:	e8 2e 28 00 00       	call   102854 <initTimer>
  100026:	e8 f3 1c 00 00       	call   101d1e <init_pcb>
  10002b:	e8 b4 1d 00 00       	call   101de4 <init_kernel_pcb>
  100030:	e8 ae 14 00 00       	call   1014e3 <initSerial>
  100035:	e8 f2 1f 00 00       	call   10202c <initIdt>
  10003a:	e8 52 27 00 00       	call   102791 <initIntr>
  10003f:	e8 12 05 00 00       	call   100556 <initSeg>
  100044:	e8 b7 ff ff ff       	call   100000 <enableInterrupt>
  100049:	e8 d1 0a 00 00       	call   100b1f <loadUMain>
  10004e:	eb fe                	jmp    10004e <kEntry+0x47>

00100050 <setGdt>:
  100050:	55                   	push   %ebp
  100051:	89 e5                	mov    %esp,%ebp
  100053:	8b 45 0c             	mov    0xc(%ebp),%eax
  100056:	48                   	dec    %eax
  100057:	66 a3 40 42 10 00    	mov    %ax,0x104240
  10005d:	8b 45 08             	mov    0x8(%ebp),%eax
  100060:	66 a3 42 42 10 00    	mov    %ax,0x104242
  100066:	8b 45 08             	mov    0x8(%ebp),%eax
  100069:	c1 e8 10             	shr    $0x10,%eax
  10006c:	66 a3 44 42 10 00    	mov    %ax,0x104244
  100072:	b8 40 42 10 00       	mov    $0x104240,%eax
  100077:	0f 01 10             	lgdtl  (%eax)
  10007a:	90                   	nop
  10007b:	5d                   	pop    %ebp
  10007c:	c3                   	ret    

0010007d <lLdt>:
  10007d:	55                   	push   %ebp
  10007e:	89 e5                	mov    %esp,%ebp
  100080:	83 ec 04             	sub    $0x4,%esp
  100083:	8b 45 08             	mov    0x8(%ebp),%eax
  100086:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  10008a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10008d:	0f 00 d0             	lldt   %ax
  100090:	90                   	nop
  100091:	c9                   	leave  
  100092:	c3                   	ret    

00100093 <inLong>:
  100093:	55                   	push   %ebp
  100094:	89 e5                	mov    %esp,%ebp
  100096:	83 ec 14             	sub    $0x14,%esp
  100099:	8b 45 08             	mov    0x8(%ebp),%eax
  10009c:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  1000a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1000a3:	89 c2                	mov    %eax,%edx
  1000a5:	ed                   	in     (%dx),%eax
  1000a6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1000a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1000ac:	c9                   	leave  
  1000ad:	c3                   	ret    

001000ae <inByte>:
  1000ae:	55                   	push   %ebp
  1000af:	89 e5                	mov    %esp,%ebp
  1000b1:	83 ec 14             	sub    $0x14,%esp
  1000b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1000b7:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  1000bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1000be:	89 c2                	mov    %eax,%edx
  1000c0:	ec                   	in     (%dx),%al
  1000c1:	88 45 ff             	mov    %al,-0x1(%ebp)
  1000c4:	8a 45 ff             	mov    -0x1(%ebp),%al
  1000c7:	c9                   	leave  
  1000c8:	c3                   	ret    

001000c9 <outByte>:
  1000c9:	55                   	push   %ebp
  1000ca:	89 e5                	mov    %esp,%ebp
  1000cc:	83 ec 08             	sub    $0x8,%esp
  1000cf:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d2:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000d5:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  1000d9:	88 55 f8             	mov    %dl,-0x8(%ebp)
  1000dc:	8a 45 f8             	mov    -0x8(%ebp),%al
  1000df:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1000e2:	ee                   	out    %al,(%dx)
  1000e3:	90                   	nop
  1000e4:	c9                   	leave  
  1000e5:	c3                   	ret    

001000e6 <change_gdt>:
  1000e6:	55                   	push   %ebp
  1000e7:	89 e5                	mov    %esp,%ebp
  1000e9:	83 ec 18             	sub    $0x18,%esp
  1000ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1000ef:	c1 e8 03             	shr    $0x3,%eax
  1000f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1000f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1000f8:	83 f8 02             	cmp    $0x2,%eax
  1000fb:	0f 84 cf 00 00 00    	je     1001d0 <change_gdt+0xea>
  100101:	83 f8 02             	cmp    $0x2,%eax
  100104:	77 0a                	ja     100110 <change_gdt+0x2a>
  100106:	83 f8 01             	cmp    $0x1,%eax
  100109:	74 1c                	je     100127 <change_gdt+0x41>
  10010b:	e9 b8 02 00 00       	jmp    1003c8 <change_gdt+0x2e2>
  100110:	83 f8 03             	cmp    $0x3,%eax
  100113:	0f 84 60 01 00 00    	je     100279 <change_gdt+0x193>
  100119:	83 f8 04             	cmp    $0x4,%eax
  10011c:	0f 84 00 02 00 00    	je     100322 <change_gdt+0x23c>
  100122:	e9 a1 02 00 00       	jmp    1003c8 <change_gdt+0x2e2>
  100127:	8b 45 0c             	mov    0xc(%ebp),%eax
  10012a:	8b 55 0c             	mov    0xc(%ebp),%edx
  10012d:	c1 ea 10             	shr    $0x10,%edx
  100130:	88 d1                	mov    %dl,%cl
  100132:	8b 55 0c             	mov    0xc(%ebp),%edx
  100135:	c1 ea 18             	shr    $0x18,%edx
  100138:	66 c7 05 08 cb 13 01 	movw   $0xffff,0x113cb08
  10013f:	ff ff 
  100141:	66 a3 0a cb 13 01    	mov    %ax,0x113cb0a
  100147:	88 0d 0c cb 13 01    	mov    %cl,0x113cb0c
  10014d:	a0 0d cb 13 01       	mov    0x113cb0d,%al
  100152:	83 e0 f0             	and    $0xfffffff0,%eax
  100155:	83 c8 0a             	or     $0xa,%eax
  100158:	a2 0d cb 13 01       	mov    %al,0x113cb0d
  10015d:	a0 0d cb 13 01       	mov    0x113cb0d,%al
  100162:	83 c8 10             	or     $0x10,%eax
  100165:	a2 0d cb 13 01       	mov    %al,0x113cb0d
  10016a:	a0 0d cb 13 01       	mov    0x113cb0d,%al
  10016f:	83 e0 9f             	and    $0xffffff9f,%eax
  100172:	a2 0d cb 13 01       	mov    %al,0x113cb0d
  100177:	a0 0d cb 13 01       	mov    0x113cb0d,%al
  10017c:	83 c8 80             	or     $0xffffff80,%eax
  10017f:	a2 0d cb 13 01       	mov    %al,0x113cb0d
  100184:	a0 0e cb 13 01       	mov    0x113cb0e,%al
  100189:	83 c8 0f             	or     $0xf,%eax
  10018c:	a2 0e cb 13 01       	mov    %al,0x113cb0e
  100191:	a0 0e cb 13 01       	mov    0x113cb0e,%al
  100196:	83 e0 ef             	and    $0xffffffef,%eax
  100199:	a2 0e cb 13 01       	mov    %al,0x113cb0e
  10019e:	a0 0e cb 13 01       	mov    0x113cb0e,%al
  1001a3:	83 e0 df             	and    $0xffffffdf,%eax
  1001a6:	a2 0e cb 13 01       	mov    %al,0x113cb0e
  1001ab:	a0 0e cb 13 01       	mov    0x113cb0e,%al
  1001b0:	83 c8 40             	or     $0x40,%eax
  1001b3:	a2 0e cb 13 01       	mov    %al,0x113cb0e
  1001b8:	a0 0e cb 13 01       	mov    0x113cb0e,%al
  1001bd:	83 c8 80             	or     $0xffffff80,%eax
  1001c0:	a2 0e cb 13 01       	mov    %al,0x113cb0e
  1001c5:	88 15 0f cb 13 01    	mov    %dl,0x113cb0f
  1001cb:	e9 49 02 00 00       	jmp    100419 <change_gdt+0x333>
  1001d0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1001d3:	8b 55 0c             	mov    0xc(%ebp),%edx
  1001d6:	c1 ea 10             	shr    $0x10,%edx
  1001d9:	88 d1                	mov    %dl,%cl
  1001db:	8b 55 0c             	mov    0xc(%ebp),%edx
  1001de:	c1 ea 18             	shr    $0x18,%edx
  1001e1:	66 c7 05 10 cb 13 01 	movw   $0xffff,0x113cb10
  1001e8:	ff ff 
  1001ea:	66 a3 12 cb 13 01    	mov    %ax,0x113cb12
  1001f0:	88 0d 14 cb 13 01    	mov    %cl,0x113cb14
  1001f6:	a0 15 cb 13 01       	mov    0x113cb15,%al
  1001fb:	83 e0 f0             	and    $0xfffffff0,%eax
  1001fe:	83 c8 02             	or     $0x2,%eax
  100201:	a2 15 cb 13 01       	mov    %al,0x113cb15
  100206:	a0 15 cb 13 01       	mov    0x113cb15,%al
  10020b:	83 c8 10             	or     $0x10,%eax
  10020e:	a2 15 cb 13 01       	mov    %al,0x113cb15
  100213:	a0 15 cb 13 01       	mov    0x113cb15,%al
  100218:	83 e0 9f             	and    $0xffffff9f,%eax
  10021b:	a2 15 cb 13 01       	mov    %al,0x113cb15
  100220:	a0 15 cb 13 01       	mov    0x113cb15,%al
  100225:	83 c8 80             	or     $0xffffff80,%eax
  100228:	a2 15 cb 13 01       	mov    %al,0x113cb15
  10022d:	a0 16 cb 13 01       	mov    0x113cb16,%al
  100232:	83 c8 0f             	or     $0xf,%eax
  100235:	a2 16 cb 13 01       	mov    %al,0x113cb16
  10023a:	a0 16 cb 13 01       	mov    0x113cb16,%al
  10023f:	83 e0 ef             	and    $0xffffffef,%eax
  100242:	a2 16 cb 13 01       	mov    %al,0x113cb16
  100247:	a0 16 cb 13 01       	mov    0x113cb16,%al
  10024c:	83 e0 df             	and    $0xffffffdf,%eax
  10024f:	a2 16 cb 13 01       	mov    %al,0x113cb16
  100254:	a0 16 cb 13 01       	mov    0x113cb16,%al
  100259:	83 c8 40             	or     $0x40,%eax
  10025c:	a2 16 cb 13 01       	mov    %al,0x113cb16
  100261:	a0 16 cb 13 01       	mov    0x113cb16,%al
  100266:	83 c8 80             	or     $0xffffff80,%eax
  100269:	a2 16 cb 13 01       	mov    %al,0x113cb16
  10026e:	88 15 17 cb 13 01    	mov    %dl,0x113cb17
  100274:	e9 a0 01 00 00       	jmp    100419 <change_gdt+0x333>
  100279:	8b 45 0c             	mov    0xc(%ebp),%eax
  10027c:	8b 55 0c             	mov    0xc(%ebp),%edx
  10027f:	c1 ea 10             	shr    $0x10,%edx
  100282:	88 d1                	mov    %dl,%cl
  100284:	8b 55 0c             	mov    0xc(%ebp),%edx
  100287:	c1 ea 18             	shr    $0x18,%edx
  10028a:	66 c7 05 18 cb 13 01 	movw   $0xffff,0x113cb18
  100291:	ff ff 
  100293:	66 a3 1a cb 13 01    	mov    %ax,0x113cb1a
  100299:	88 0d 1c cb 13 01    	mov    %cl,0x113cb1c
  10029f:	a0 1d cb 13 01       	mov    0x113cb1d,%al
  1002a4:	83 e0 f0             	and    $0xfffffff0,%eax
  1002a7:	83 c8 0a             	or     $0xa,%eax
  1002aa:	a2 1d cb 13 01       	mov    %al,0x113cb1d
  1002af:	a0 1d cb 13 01       	mov    0x113cb1d,%al
  1002b4:	83 c8 10             	or     $0x10,%eax
  1002b7:	a2 1d cb 13 01       	mov    %al,0x113cb1d
  1002bc:	a0 1d cb 13 01       	mov    0x113cb1d,%al
  1002c1:	83 c8 60             	or     $0x60,%eax
  1002c4:	a2 1d cb 13 01       	mov    %al,0x113cb1d
  1002c9:	a0 1d cb 13 01       	mov    0x113cb1d,%al
  1002ce:	83 c8 80             	or     $0xffffff80,%eax
  1002d1:	a2 1d cb 13 01       	mov    %al,0x113cb1d
  1002d6:	a0 1e cb 13 01       	mov    0x113cb1e,%al
  1002db:	83 c8 0f             	or     $0xf,%eax
  1002de:	a2 1e cb 13 01       	mov    %al,0x113cb1e
  1002e3:	a0 1e cb 13 01       	mov    0x113cb1e,%al
  1002e8:	83 e0 ef             	and    $0xffffffef,%eax
  1002eb:	a2 1e cb 13 01       	mov    %al,0x113cb1e
  1002f0:	a0 1e cb 13 01       	mov    0x113cb1e,%al
  1002f5:	83 e0 df             	and    $0xffffffdf,%eax
  1002f8:	a2 1e cb 13 01       	mov    %al,0x113cb1e
  1002fd:	a0 1e cb 13 01       	mov    0x113cb1e,%al
  100302:	83 c8 40             	or     $0x40,%eax
  100305:	a2 1e cb 13 01       	mov    %al,0x113cb1e
  10030a:	a0 1e cb 13 01       	mov    0x113cb1e,%al
  10030f:	83 c8 80             	or     $0xffffff80,%eax
  100312:	a2 1e cb 13 01       	mov    %al,0x113cb1e
  100317:	88 15 1f cb 13 01    	mov    %dl,0x113cb1f
  10031d:	e9 f7 00 00 00       	jmp    100419 <change_gdt+0x333>
  100322:	8b 45 0c             	mov    0xc(%ebp),%eax
  100325:	8b 55 0c             	mov    0xc(%ebp),%edx
  100328:	c1 ea 10             	shr    $0x10,%edx
  10032b:	88 d1                	mov    %dl,%cl
  10032d:	8b 55 0c             	mov    0xc(%ebp),%edx
  100330:	c1 ea 18             	shr    $0x18,%edx
  100333:	66 c7 05 20 cb 13 01 	movw   $0xffff,0x113cb20
  10033a:	ff ff 
  10033c:	66 a3 22 cb 13 01    	mov    %ax,0x113cb22
  100342:	88 0d 24 cb 13 01    	mov    %cl,0x113cb24
  100348:	a0 25 cb 13 01       	mov    0x113cb25,%al
  10034d:	83 e0 f0             	and    $0xfffffff0,%eax
  100350:	83 c8 02             	or     $0x2,%eax
  100353:	a2 25 cb 13 01       	mov    %al,0x113cb25
  100358:	a0 25 cb 13 01       	mov    0x113cb25,%al
  10035d:	83 c8 10             	or     $0x10,%eax
  100360:	a2 25 cb 13 01       	mov    %al,0x113cb25
  100365:	a0 25 cb 13 01       	mov    0x113cb25,%al
  10036a:	83 c8 60             	or     $0x60,%eax
  10036d:	a2 25 cb 13 01       	mov    %al,0x113cb25
  100372:	a0 25 cb 13 01       	mov    0x113cb25,%al
  100377:	83 c8 80             	or     $0xffffff80,%eax
  10037a:	a2 25 cb 13 01       	mov    %al,0x113cb25
  10037f:	a0 26 cb 13 01       	mov    0x113cb26,%al
  100384:	83 c8 0f             	or     $0xf,%eax
  100387:	a2 26 cb 13 01       	mov    %al,0x113cb26
  10038c:	a0 26 cb 13 01       	mov    0x113cb26,%al
  100391:	83 e0 ef             	and    $0xffffffef,%eax
  100394:	a2 26 cb 13 01       	mov    %al,0x113cb26
  100399:	a0 26 cb 13 01       	mov    0x113cb26,%al
  10039e:	83 e0 df             	and    $0xffffffdf,%eax
  1003a1:	a2 26 cb 13 01       	mov    %al,0x113cb26
  1003a6:	a0 26 cb 13 01       	mov    0x113cb26,%al
  1003ab:	83 c8 40             	or     $0x40,%eax
  1003ae:	a2 26 cb 13 01       	mov    %al,0x113cb26
  1003b3:	a0 26 cb 13 01       	mov    0x113cb26,%al
  1003b8:	83 c8 80             	or     $0xffffff80,%eax
  1003bb:	a2 26 cb 13 01       	mov    %al,0x113cb26
  1003c0:	88 15 27 cb 13 01    	mov    %dl,0x113cb27
  1003c6:	eb 51                	jmp    100419 <change_gdt+0x333>
  1003c8:	83 ec 0c             	sub    $0xc,%esp
  1003cb:	68 d8 2d 10 00       	push   $0x102dd8
  1003d0:	e8 ee 26 00 00       	call   102ac3 <printk>
  1003d5:	83 c4 10             	add    $0x10,%esp
  1003d8:	83 ec 0c             	sub    $0xc,%esp
  1003db:	ff 75 f4             	pushl  -0xc(%ebp)
  1003de:	68 18 2e 10 00       	push   $0x102e18
  1003e3:	6a 17                	push   $0x17
  1003e5:	68 de 2d 10 00       	push   $0x102dde
  1003ea:	68 eb 2d 10 00       	push   $0x102deb
  1003ef:	e8 cf 26 00 00       	call   102ac3 <printk>
  1003f4:	83 c4 20             	add    $0x20,%esp
  1003f7:	83 ec 0c             	sub    $0xc,%esp
  1003fa:	68 07 2e 10 00       	push   $0x102e07
  1003ff:	e8 bf 26 00 00       	call   102ac3 <printk>
  100404:	83 c4 10             	add    $0x10,%esp
  100407:	83 ec 08             	sub    $0x8,%esp
  10040a:	6a 18                	push   $0x18
  10040c:	68 de 2d 10 00       	push   $0x102dde
  100411:	e8 69 29 00 00       	call   102d7f <abort>
  100416:	83 c4 10             	add    $0x10,%esp
  100419:	83 ec 08             	sub    $0x8,%esp
  10041c:	6a 50                	push   $0x50
  10041e:	68 00 cb 13 01       	push   $0x113cb00
  100423:	e8 28 fc ff ff       	call   100050 <setGdt>
  100428:	83 c4 10             	add    $0x10,%esp
  10042b:	b8 01 00 00 00       	mov    $0x1,%eax
  100430:	c9                   	leave  
  100431:	c3                   	ret    

00100432 <change_tss>:
  100432:	55                   	push   %ebp
  100433:	89 e5                	mov    %esp,%ebp
  100435:	8b 45 08             	mov    0x8(%ebp),%eax
  100438:	a3 68 cb 13 01       	mov    %eax,0x113cb68
  10043d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100440:	a3 64 cb 13 01       	mov    %eax,0x113cb64
  100445:	b8 01 00 00 00       	mov    $0x1,%eax
  10044a:	5d                   	pop    %ebp
  10044b:	c3                   	ret    

0010044c <get_tss>:
  10044c:	55                   	push   %ebp
  10044d:	89 e5                	mov    %esp,%ebp
  10044f:	57                   	push   %edi
  100450:	56                   	push   %esi
  100451:	53                   	push   %ebx
  100452:	8b 45 08             	mov    0x8(%ebp),%eax
  100455:	89 c2                	mov    %eax,%edx
  100457:	bb 60 cb 13 01       	mov    $0x113cb60,%ebx
  10045c:	b8 19 00 00 00       	mov    $0x19,%eax
  100461:	89 d7                	mov    %edx,%edi
  100463:	89 de                	mov    %ebx,%esi
  100465:	89 c1                	mov    %eax,%ecx
  100467:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100469:	8b 45 08             	mov    0x8(%ebp),%eax
  10046c:	5b                   	pop    %ebx
  10046d:	5e                   	pop    %esi
  10046e:	5f                   	pop    %edi
  10046f:	5d                   	pop    %ebp
  100470:	c2 04 00             	ret    $0x4

00100473 <waitDisk>:
  100473:	55                   	push   %ebp
  100474:	89 e5                	mov    %esp,%ebp
  100476:	90                   	nop
  100477:	68 f7 01 00 00       	push   $0x1f7
  10047c:	e8 2d fc ff ff       	call   1000ae <inByte>
  100481:	83 c4 04             	add    $0x4,%esp
  100484:	0f b6 c0             	movzbl %al,%eax
  100487:	25 c0 00 00 00       	and    $0xc0,%eax
  10048c:	83 f8 40             	cmp    $0x40,%eax
  10048f:	75 e6                	jne    100477 <waitDisk+0x4>
  100491:	90                   	nop
  100492:	c9                   	leave  
  100493:	c3                   	ret    

00100494 <readSect>:
  100494:	55                   	push   %ebp
  100495:	89 e5                	mov    %esp,%ebp
  100497:	53                   	push   %ebx
  100498:	83 ec 10             	sub    $0x10,%esp
  10049b:	e8 d3 ff ff ff       	call   100473 <waitDisk>
  1004a0:	6a 01                	push   $0x1
  1004a2:	68 f2 01 00 00       	push   $0x1f2
  1004a7:	e8 1d fc ff ff       	call   1000c9 <outByte>
  1004ac:	83 c4 08             	add    $0x8,%esp
  1004af:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004b2:	0f be c0             	movsbl %al,%eax
  1004b5:	50                   	push   %eax
  1004b6:	68 f3 01 00 00       	push   $0x1f3
  1004bb:	e8 09 fc ff ff       	call   1000c9 <outByte>
  1004c0:	83 c4 08             	add    $0x8,%esp
  1004c3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004c6:	c1 f8 08             	sar    $0x8,%eax
  1004c9:	0f be c0             	movsbl %al,%eax
  1004cc:	50                   	push   %eax
  1004cd:	68 f4 01 00 00       	push   $0x1f4
  1004d2:	e8 f2 fb ff ff       	call   1000c9 <outByte>
  1004d7:	83 c4 08             	add    $0x8,%esp
  1004da:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004dd:	c1 f8 10             	sar    $0x10,%eax
  1004e0:	0f be c0             	movsbl %al,%eax
  1004e3:	50                   	push   %eax
  1004e4:	68 f5 01 00 00       	push   $0x1f5
  1004e9:	e8 db fb ff ff       	call   1000c9 <outByte>
  1004ee:	83 c4 08             	add    $0x8,%esp
  1004f1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004f4:	c1 f8 18             	sar    $0x18,%eax
  1004f7:	83 c8 e0             	or     $0xffffffe0,%eax
  1004fa:	0f be c0             	movsbl %al,%eax
  1004fd:	50                   	push   %eax
  1004fe:	68 f6 01 00 00       	push   $0x1f6
  100503:	e8 c1 fb ff ff       	call   1000c9 <outByte>
  100508:	83 c4 08             	add    $0x8,%esp
  10050b:	6a 20                	push   $0x20
  10050d:	68 f7 01 00 00       	push   $0x1f7
  100512:	e8 b2 fb ff ff       	call   1000c9 <outByte>
  100517:	83 c4 08             	add    $0x8,%esp
  10051a:	e8 54 ff ff ff       	call   100473 <waitDisk>
  10051f:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  100526:	eb 22                	jmp    10054a <readSect+0xb6>
  100528:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10052b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100532:	8b 45 08             	mov    0x8(%ebp),%eax
  100535:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
  100538:	68 f0 01 00 00       	push   $0x1f0
  10053d:	e8 51 fb ff ff       	call   100093 <inLong>
  100542:	83 c4 04             	add    $0x4,%esp
  100545:	89 03                	mov    %eax,(%ebx)
  100547:	ff 45 f8             	incl   -0x8(%ebp)
  10054a:	83 7d f8 7f          	cmpl   $0x7f,-0x8(%ebp)
  10054e:	7e d8                	jle    100528 <readSect+0x94>
  100550:	90                   	nop
  100551:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100554:	c9                   	leave  
  100555:	c3                   	ret    

00100556 <initSeg>:
  100556:	55                   	push   %ebp
  100557:	89 e5                	mov    %esp,%ebp
  100559:	66 c7 05 08 cb 13 01 	movw   $0xffff,0x113cb08
  100560:	ff ff 
  100562:	66 c7 05 0a cb 13 01 	movw   $0x0,0x113cb0a
  100569:	00 00 
  10056b:	c6 05 0c cb 13 01 00 	movb   $0x0,0x113cb0c
  100572:	a0 0d cb 13 01       	mov    0x113cb0d,%al
  100577:	83 e0 f0             	and    $0xfffffff0,%eax
  10057a:	83 c8 0a             	or     $0xa,%eax
  10057d:	a2 0d cb 13 01       	mov    %al,0x113cb0d
  100582:	a0 0d cb 13 01       	mov    0x113cb0d,%al
  100587:	83 c8 10             	or     $0x10,%eax
  10058a:	a2 0d cb 13 01       	mov    %al,0x113cb0d
  10058f:	a0 0d cb 13 01       	mov    0x113cb0d,%al
  100594:	83 e0 9f             	and    $0xffffff9f,%eax
  100597:	a2 0d cb 13 01       	mov    %al,0x113cb0d
  10059c:	a0 0d cb 13 01       	mov    0x113cb0d,%al
  1005a1:	83 c8 80             	or     $0xffffff80,%eax
  1005a4:	a2 0d cb 13 01       	mov    %al,0x113cb0d
  1005a9:	a0 0e cb 13 01       	mov    0x113cb0e,%al
  1005ae:	83 c8 0f             	or     $0xf,%eax
  1005b1:	a2 0e cb 13 01       	mov    %al,0x113cb0e
  1005b6:	a0 0e cb 13 01       	mov    0x113cb0e,%al
  1005bb:	83 e0 ef             	and    $0xffffffef,%eax
  1005be:	a2 0e cb 13 01       	mov    %al,0x113cb0e
  1005c3:	a0 0e cb 13 01       	mov    0x113cb0e,%al
  1005c8:	83 e0 df             	and    $0xffffffdf,%eax
  1005cb:	a2 0e cb 13 01       	mov    %al,0x113cb0e
  1005d0:	a0 0e cb 13 01       	mov    0x113cb0e,%al
  1005d5:	83 c8 40             	or     $0x40,%eax
  1005d8:	a2 0e cb 13 01       	mov    %al,0x113cb0e
  1005dd:	a0 0e cb 13 01       	mov    0x113cb0e,%al
  1005e2:	83 c8 80             	or     $0xffffff80,%eax
  1005e5:	a2 0e cb 13 01       	mov    %al,0x113cb0e
  1005ea:	c6 05 0f cb 13 01 00 	movb   $0x0,0x113cb0f
  1005f1:	66 c7 05 10 cb 13 01 	movw   $0xffff,0x113cb10
  1005f8:	ff ff 
  1005fa:	66 c7 05 12 cb 13 01 	movw   $0x0,0x113cb12
  100601:	00 00 
  100603:	c6 05 14 cb 13 01 00 	movb   $0x0,0x113cb14
  10060a:	a0 15 cb 13 01       	mov    0x113cb15,%al
  10060f:	83 e0 f0             	and    $0xfffffff0,%eax
  100612:	83 c8 02             	or     $0x2,%eax
  100615:	a2 15 cb 13 01       	mov    %al,0x113cb15
  10061a:	a0 15 cb 13 01       	mov    0x113cb15,%al
  10061f:	83 c8 10             	or     $0x10,%eax
  100622:	a2 15 cb 13 01       	mov    %al,0x113cb15
  100627:	a0 15 cb 13 01       	mov    0x113cb15,%al
  10062c:	83 e0 9f             	and    $0xffffff9f,%eax
  10062f:	a2 15 cb 13 01       	mov    %al,0x113cb15
  100634:	a0 15 cb 13 01       	mov    0x113cb15,%al
  100639:	83 c8 80             	or     $0xffffff80,%eax
  10063c:	a2 15 cb 13 01       	mov    %al,0x113cb15
  100641:	a0 16 cb 13 01       	mov    0x113cb16,%al
  100646:	83 c8 0f             	or     $0xf,%eax
  100649:	a2 16 cb 13 01       	mov    %al,0x113cb16
  10064e:	a0 16 cb 13 01       	mov    0x113cb16,%al
  100653:	83 e0 ef             	and    $0xffffffef,%eax
  100656:	a2 16 cb 13 01       	mov    %al,0x113cb16
  10065b:	a0 16 cb 13 01       	mov    0x113cb16,%al
  100660:	83 e0 df             	and    $0xffffffdf,%eax
  100663:	a2 16 cb 13 01       	mov    %al,0x113cb16
  100668:	a0 16 cb 13 01       	mov    0x113cb16,%al
  10066d:	83 c8 40             	or     $0x40,%eax
  100670:	a2 16 cb 13 01       	mov    %al,0x113cb16
  100675:	a0 16 cb 13 01       	mov    0x113cb16,%al
  10067a:	83 c8 80             	or     $0xffffff80,%eax
  10067d:	a2 16 cb 13 01       	mov    %al,0x113cb16
  100682:	c6 05 17 cb 13 01 00 	movb   $0x0,0x113cb17
  100689:	66 c7 05 18 cb 13 01 	movw   $0xffff,0x113cb18
  100690:	ff ff 
  100692:	66 c7 05 1a cb 13 01 	movw   $0x0,0x113cb1a
  100699:	00 00 
  10069b:	c6 05 1c cb 13 01 00 	movb   $0x0,0x113cb1c
  1006a2:	a0 1d cb 13 01       	mov    0x113cb1d,%al
  1006a7:	83 e0 f0             	and    $0xfffffff0,%eax
  1006aa:	83 c8 0a             	or     $0xa,%eax
  1006ad:	a2 1d cb 13 01       	mov    %al,0x113cb1d
  1006b2:	a0 1d cb 13 01       	mov    0x113cb1d,%al
  1006b7:	83 c8 10             	or     $0x10,%eax
  1006ba:	a2 1d cb 13 01       	mov    %al,0x113cb1d
  1006bf:	a0 1d cb 13 01       	mov    0x113cb1d,%al
  1006c4:	83 c8 60             	or     $0x60,%eax
  1006c7:	a2 1d cb 13 01       	mov    %al,0x113cb1d
  1006cc:	a0 1d cb 13 01       	mov    0x113cb1d,%al
  1006d1:	83 c8 80             	or     $0xffffff80,%eax
  1006d4:	a2 1d cb 13 01       	mov    %al,0x113cb1d
  1006d9:	a0 1e cb 13 01       	mov    0x113cb1e,%al
  1006de:	83 c8 0f             	or     $0xf,%eax
  1006e1:	a2 1e cb 13 01       	mov    %al,0x113cb1e
  1006e6:	a0 1e cb 13 01       	mov    0x113cb1e,%al
  1006eb:	83 e0 ef             	and    $0xffffffef,%eax
  1006ee:	a2 1e cb 13 01       	mov    %al,0x113cb1e
  1006f3:	a0 1e cb 13 01       	mov    0x113cb1e,%al
  1006f8:	83 e0 df             	and    $0xffffffdf,%eax
  1006fb:	a2 1e cb 13 01       	mov    %al,0x113cb1e
  100700:	a0 1e cb 13 01       	mov    0x113cb1e,%al
  100705:	83 c8 40             	or     $0x40,%eax
  100708:	a2 1e cb 13 01       	mov    %al,0x113cb1e
  10070d:	a0 1e cb 13 01       	mov    0x113cb1e,%al
  100712:	83 c8 80             	or     $0xffffff80,%eax
  100715:	a2 1e cb 13 01       	mov    %al,0x113cb1e
  10071a:	c6 05 1f cb 13 01 00 	movb   $0x0,0x113cb1f
  100721:	66 c7 05 20 cb 13 01 	movw   $0xffff,0x113cb20
  100728:	ff ff 
  10072a:	66 c7 05 22 cb 13 01 	movw   $0x0,0x113cb22
  100731:	00 00 
  100733:	c6 05 24 cb 13 01 00 	movb   $0x0,0x113cb24
  10073a:	a0 25 cb 13 01       	mov    0x113cb25,%al
  10073f:	83 e0 f0             	and    $0xfffffff0,%eax
  100742:	83 c8 02             	or     $0x2,%eax
  100745:	a2 25 cb 13 01       	mov    %al,0x113cb25
  10074a:	a0 25 cb 13 01       	mov    0x113cb25,%al
  10074f:	83 c8 10             	or     $0x10,%eax
  100752:	a2 25 cb 13 01       	mov    %al,0x113cb25
  100757:	a0 25 cb 13 01       	mov    0x113cb25,%al
  10075c:	83 c8 60             	or     $0x60,%eax
  10075f:	a2 25 cb 13 01       	mov    %al,0x113cb25
  100764:	a0 25 cb 13 01       	mov    0x113cb25,%al
  100769:	83 c8 80             	or     $0xffffff80,%eax
  10076c:	a2 25 cb 13 01       	mov    %al,0x113cb25
  100771:	a0 26 cb 13 01       	mov    0x113cb26,%al
  100776:	83 c8 0f             	or     $0xf,%eax
  100779:	a2 26 cb 13 01       	mov    %al,0x113cb26
  10077e:	a0 26 cb 13 01       	mov    0x113cb26,%al
  100783:	83 e0 ef             	and    $0xffffffef,%eax
  100786:	a2 26 cb 13 01       	mov    %al,0x113cb26
  10078b:	a0 26 cb 13 01       	mov    0x113cb26,%al
  100790:	83 e0 df             	and    $0xffffffdf,%eax
  100793:	a2 26 cb 13 01       	mov    %al,0x113cb26
  100798:	a0 26 cb 13 01       	mov    0x113cb26,%al
  10079d:	83 c8 40             	or     $0x40,%eax
  1007a0:	a2 26 cb 13 01       	mov    %al,0x113cb26
  1007a5:	a0 26 cb 13 01       	mov    0x113cb26,%al
  1007aa:	83 c8 80             	or     $0xffffff80,%eax
  1007ad:	a2 26 cb 13 01       	mov    %al,0x113cb26
  1007b2:	c6 05 27 cb 13 01 00 	movb   $0x0,0x113cb27
  1007b9:	66 c7 05 28 cb 13 01 	movw   $0x63,0x113cb28
  1007c0:	63 00 
  1007c2:	b8 60 cb 13 01       	mov    $0x113cb60,%eax
  1007c7:	66 a3 2a cb 13 01    	mov    %ax,0x113cb2a
  1007cd:	b8 60 cb 13 01       	mov    $0x113cb60,%eax
  1007d2:	c1 e8 10             	shr    $0x10,%eax
  1007d5:	a2 2c cb 13 01       	mov    %al,0x113cb2c
  1007da:	a0 2d cb 13 01       	mov    0x113cb2d,%al
  1007df:	83 e0 f0             	and    $0xfffffff0,%eax
  1007e2:	83 c8 09             	or     $0x9,%eax
  1007e5:	a2 2d cb 13 01       	mov    %al,0x113cb2d
  1007ea:	a0 2d cb 13 01       	mov    0x113cb2d,%al
  1007ef:	83 e0 ef             	and    $0xffffffef,%eax
  1007f2:	a2 2d cb 13 01       	mov    %al,0x113cb2d
  1007f7:	a0 2d cb 13 01       	mov    0x113cb2d,%al
  1007fc:	83 e0 9f             	and    $0xffffff9f,%eax
  1007ff:	a2 2d cb 13 01       	mov    %al,0x113cb2d
  100804:	a0 2d cb 13 01       	mov    0x113cb2d,%al
  100809:	83 c8 80             	or     $0xffffff80,%eax
  10080c:	a2 2d cb 13 01       	mov    %al,0x113cb2d
  100811:	a0 2e cb 13 01       	mov    0x113cb2e,%al
  100816:	83 e0 f0             	and    $0xfffffff0,%eax
  100819:	a2 2e cb 13 01       	mov    %al,0x113cb2e
  10081e:	a0 2e cb 13 01       	mov    0x113cb2e,%al
  100823:	83 e0 ef             	and    $0xffffffef,%eax
  100826:	a2 2e cb 13 01       	mov    %al,0x113cb2e
  10082b:	a0 2e cb 13 01       	mov    0x113cb2e,%al
  100830:	83 e0 df             	and    $0xffffffdf,%eax
  100833:	a2 2e cb 13 01       	mov    %al,0x113cb2e
  100838:	a0 2e cb 13 01       	mov    0x113cb2e,%al
  10083d:	83 c8 40             	or     $0x40,%eax
  100840:	a2 2e cb 13 01       	mov    %al,0x113cb2e
  100845:	a0 2e cb 13 01       	mov    0x113cb2e,%al
  10084a:	83 e0 7f             	and    $0x7f,%eax
  10084d:	a2 2e cb 13 01       	mov    %al,0x113cb2e
  100852:	b8 60 cb 13 01       	mov    $0x113cb60,%eax
  100857:	c1 e8 18             	shr    $0x18,%eax
  10085a:	a2 2f cb 13 01       	mov    %al,0x113cb2f
  10085f:	a0 2d cb 13 01       	mov    0x113cb2d,%al
  100864:	83 e0 ef             	and    $0xffffffef,%eax
  100867:	a2 2d cb 13 01       	mov    %al,0x113cb2d
  10086c:	a1 10 2e 10 00       	mov    0x102e10,%eax
  100871:	8b 15 14 2e 10 00    	mov    0x102e14,%edx
  100877:	a3 30 cb 13 01       	mov    %eax,0x113cb30
  10087c:	89 15 34 cb 13 01    	mov    %edx,0x113cb34
  100882:	66 c7 05 40 cb 13 01 	movw   $0xffff,0x113cb40
  100889:	ff ff 
  10088b:	66 c7 05 42 cb 13 01 	movw   $0x0,0x113cb42
  100892:	00 00 
  100894:	c6 05 44 cb 13 01 00 	movb   $0x0,0x113cb44
  10089b:	a0 45 cb 13 01       	mov    0x113cb45,%al
  1008a0:	83 e0 f0             	and    $0xfffffff0,%eax
  1008a3:	83 c8 02             	or     $0x2,%eax
  1008a6:	a2 45 cb 13 01       	mov    %al,0x113cb45
  1008ab:	a0 45 cb 13 01       	mov    0x113cb45,%al
  1008b0:	83 c8 10             	or     $0x10,%eax
  1008b3:	a2 45 cb 13 01       	mov    %al,0x113cb45
  1008b8:	a0 45 cb 13 01       	mov    0x113cb45,%al
  1008bd:	83 c8 60             	or     $0x60,%eax
  1008c0:	a2 45 cb 13 01       	mov    %al,0x113cb45
  1008c5:	a0 45 cb 13 01       	mov    0x113cb45,%al
  1008ca:	83 c8 80             	or     $0xffffff80,%eax
  1008cd:	a2 45 cb 13 01       	mov    %al,0x113cb45
  1008d2:	a0 46 cb 13 01       	mov    0x113cb46,%al
  1008d7:	83 c8 0f             	or     $0xf,%eax
  1008da:	a2 46 cb 13 01       	mov    %al,0x113cb46
  1008df:	a0 46 cb 13 01       	mov    0x113cb46,%al
  1008e4:	83 e0 ef             	and    $0xffffffef,%eax
  1008e7:	a2 46 cb 13 01       	mov    %al,0x113cb46
  1008ec:	a0 46 cb 13 01       	mov    0x113cb46,%al
  1008f1:	83 e0 df             	and    $0xffffffdf,%eax
  1008f4:	a2 46 cb 13 01       	mov    %al,0x113cb46
  1008f9:	a0 46 cb 13 01       	mov    0x113cb46,%al
  1008fe:	83 c8 40             	or     $0x40,%eax
  100901:	a2 46 cb 13 01       	mov    %al,0x113cb46
  100906:	a0 46 cb 13 01       	mov    0x113cb46,%al
  10090b:	83 c8 80             	or     $0xffffff80,%eax
  10090e:	a2 46 cb 13 01       	mov    %al,0x113cb46
  100913:	c6 05 47 cb 13 01 00 	movb   $0x0,0x113cb47
  10091a:	6a 50                	push   $0x50
  10091c:	68 00 cb 13 01       	push   $0x113cb00
  100921:	e8 2a f7 ff ff       	call   100050 <setGdt>
  100926:	83 c4 08             	add    $0x8,%esp
  100929:	b8 fc 6a 10 00       	mov    $0x106afc,%eax
  10092e:	89 c2                	mov    %eax,%edx
  100930:	a1 48 6b 10 00       	mov    0x106b48,%eax
  100935:	52                   	push   %edx
  100936:	50                   	push   %eax
  100937:	e8 f6 fa ff ff       	call   100432 <change_tss>
  10093c:	83 c4 08             	add    $0x8,%esp
  10093f:	b8 28 00 00 00       	mov    $0x28,%eax
  100944:	0f 00 d8             	ltr    %ax
  100947:	b8 10 00 00 00       	mov    $0x10,%eax
  10094c:	89 c0                	mov    %eax,%eax
  10094e:	8e d8                	mov    %eax,%ds
  100950:	8e e0                	mov    %eax,%fs
  100952:	8e c0                	mov    %eax,%es
  100954:	8e d0                	mov    %eax,%ss
  100956:	b8 30 00 00 00       	mov    $0x30,%eax
  10095b:	89 c0                	mov    %eax,%eax
  10095d:	8e e8                	mov    %eax,%gs
  10095f:	6a 00                	push   $0x0
  100961:	e8 17 f7 ff ff       	call   10007d <lLdt>
  100966:	83 c4 04             	add    $0x4,%esp
  100969:	90                   	nop
  10096a:	c9                   	leave  
  10096b:	c3                   	ret    

0010096c <enterUserSpace_pcb>:
  10096c:	55                   	push   %ebp
  10096d:	89 e5                	mov    %esp,%ebp
  10096f:	83 ec 10             	sub    $0x10,%esp
  100972:	8b 55 08             	mov    0x8(%ebp),%edx
  100975:	89 d0                	mov    %edx,%eax
  100977:	c1 e0 07             	shl    $0x7,%eax
  10097a:	01 d0                	add    %edx,%eax
  10097c:	01 c0                	add    %eax,%eax
  10097e:	01 d0                	add    %edx,%eax
  100980:	01 c0                	add    %eax,%eax
  100982:	01 d0                	add    %edx,%eax
  100984:	c1 e0 04             	shl    $0x4,%eax
  100987:	05 00 4b 10 00       	add    $0x104b00,%eax
  10098c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10098f:	b8 10 00 00 00       	mov    $0x10,%eax
  100994:	89 c0                	mov    %eax,%eax
  100996:	8e d8                	mov    %eax,%ds
  100998:	8e e0                	mov    %eax,%fs
  10099a:	8e c0                	mov    %eax,%es
  10099c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10099f:	8b 80 48 20 00 00    	mov    0x2048(%eax),%eax
  1009a5:	50                   	push   %eax
  1009a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1009a9:	8b 80 44 20 00 00    	mov    0x2044(%eax),%eax
  1009af:	50                   	push   %eax
  1009b0:	9c                   	pushf  
  1009b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1009b4:	8b 80 3c 20 00 00    	mov    0x203c(%eax),%eax
  1009ba:	50                   	push   %eax
  1009bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1009be:	8b 80 38 20 00 00    	mov    0x2038(%eax),%eax
  1009c4:	50                   	push   %eax
  1009c5:	cf                   	iret   
  1009c6:	90                   	nop
  1009c7:	c9                   	leave  
  1009c8:	c3                   	ret    

001009c9 <enterUserSpace>:
  1009c9:	55                   	push   %ebp
  1009ca:	89 e5                	mov    %esp,%ebp
  1009cc:	83 ec 18             	sub    $0x18,%esp
  1009cf:	c7 05 e4 4a 10 00 01 	movl   $0x1,0x104ae4
  1009d6:	00 00 00 
  1009d9:	e8 28 0c 00 00       	call   101606 <apply_new_pid>
  1009de:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1009e1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009e4:	89 d0                	mov    %edx,%eax
  1009e6:	c1 e0 07             	shl    $0x7,%eax
  1009e9:	01 d0                	add    %edx,%eax
  1009eb:	01 c0                	add    %eax,%eax
  1009ed:	01 d0                	add    %edx,%eax
  1009ef:	01 c0                	add    %eax,%eax
  1009f1:	01 d0                	add    %edx,%eax
  1009f3:	c1 e0 04             	shl    $0x4,%eax
  1009f6:	05 48 6b 10 00       	add    $0x106b48,%eax
  1009fb:	c7 00 23 00 00 00    	movl   $0x23,(%eax)
  100a01:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100a04:	89 d0                	mov    %edx,%eax
  100a06:	c1 e0 07             	shl    $0x7,%eax
  100a09:	01 d0                	add    %edx,%eax
  100a0b:	01 c0                	add    %eax,%eax
  100a0d:	01 d0                	add    %edx,%eax
  100a0f:	01 c0                	add    %eax,%eax
  100a11:	01 d0                	add    %edx,%eax
  100a13:	c1 e0 04             	shl    $0x4,%eax
  100a16:	05 3c 6b 10 00       	add    $0x106b3c,%eax
  100a1b:	c7 00 1b 00 00 00    	movl   $0x1b,(%eax)
  100a21:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100a24:	89 d0                	mov    %edx,%eax
  100a26:	c1 e0 07             	shl    $0x7,%eax
  100a29:	01 d0                	add    %edx,%eax
  100a2b:	01 c0                	add    %eax,%eax
  100a2d:	01 d0                	add    %edx,%eax
  100a2f:	01 c0                	add    %eax,%eax
  100a31:	01 d0                	add    %edx,%eax
  100a33:	c1 e0 04             	shl    $0x4,%eax
  100a36:	05 0c 6b 10 00       	add    $0x106b0c,%eax
  100a3b:	c7 00 23 00 00 00    	movl   $0x23,(%eax)
  100a41:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100a44:	89 d0                	mov    %edx,%eax
  100a46:	c1 e0 07             	shl    $0x7,%eax
  100a49:	01 d0                	add    %edx,%eax
  100a4b:	01 c0                	add    %eax,%eax
  100a4d:	01 d0                	add    %edx,%eax
  100a4f:	01 c0                	add    %eax,%eax
  100a51:	01 d0                	add    %edx,%eax
  100a53:	c1 e0 04             	shl    $0x4,%eax
  100a56:	05 08 6b 10 00       	add    $0x106b08,%eax
  100a5b:	c7 00 23 00 00 00    	movl   $0x23,(%eax)
  100a61:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100a64:	89 d0                	mov    %edx,%eax
  100a66:	c1 e0 07             	shl    $0x7,%eax
  100a69:	01 d0                	add    %edx,%eax
  100a6b:	01 c0                	add    %eax,%eax
  100a6d:	01 d0                	add    %edx,%eax
  100a6f:	01 c0                	add    %eax,%eax
  100a71:	01 d0                	add    %edx,%eax
  100a73:	c1 e0 04             	shl    $0x4,%eax
  100a76:	05 04 6b 10 00       	add    $0x106b04,%eax
  100a7b:	c7 00 23 00 00 00    	movl   $0x23,(%eax)
  100a81:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100a84:	89 d0                	mov    %edx,%eax
  100a86:	c1 e0 07             	shl    $0x7,%eax
  100a89:	01 d0                	add    %edx,%eax
  100a8b:	01 c0                	add    %eax,%eax
  100a8d:	01 d0                	add    %edx,%eax
  100a8f:	01 c0                	add    %eax,%eax
  100a91:	01 d0                	add    %edx,%eax
  100a93:	c1 e0 04             	shl    $0x4,%eax
  100a96:	05 44 6b 10 00       	add    $0x106b44,%eax
  100a9b:	c7 00 00 00 40 00    	movl   $0x400000,(%eax)
  100aa1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100aa4:	89 d0                	mov    %edx,%eax
  100aa6:	c1 e0 07             	shl    $0x7,%eax
  100aa9:	01 d0                	add    %edx,%eax
  100aab:	01 c0                	add    %eax,%eax
  100aad:	01 d0                	add    %edx,%eax
  100aaf:	01 c0                	add    %eax,%eax
  100ab1:	01 d0                	add    %edx,%eax
  100ab3:	c1 e0 04             	shl    $0x4,%eax
  100ab6:	8d 90 38 6b 10 00    	lea    0x106b38(%eax),%edx
  100abc:	8b 45 08             	mov    0x8(%ebp),%eax
  100abf:	89 02                	mov    %eax,(%edx)
  100ac1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100ac4:	89 d0                	mov    %edx,%eax
  100ac6:	c1 e0 07             	shl    $0x7,%eax
  100ac9:	01 d0                	add    %edx,%eax
  100acb:	01 c0                	add    %eax,%eax
  100acd:	01 d0                	add    %edx,%eax
  100acf:	01 c0                	add    %eax,%eax
  100ad1:	01 d0                	add    %edx,%eax
  100ad3:	c1 e0 04             	shl    $0x4,%eax
  100ad6:	05 50 6b 10 00       	add    $0x106b50,%eax
  100adb:	c7 00 0a 00 00 00    	movl   $0xa,(%eax)
  100ae1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100ae4:	89 d0                	mov    %edx,%eax
  100ae6:	c1 e0 07             	shl    $0x7,%eax
  100ae9:	01 d0                	add    %edx,%eax
  100aeb:	01 c0                	add    %eax,%eax
  100aed:	01 d0                	add    %edx,%eax
  100aef:	01 c0                	add    %eax,%eax
  100af1:	01 d0                	add    %edx,%eax
  100af3:	c1 e0 04             	shl    $0x4,%eax
  100af6:	05 00 20 00 00       	add    $0x2000,%eax
  100afb:	05 00 4b 10 00       	add    $0x104b00,%eax
  100b00:	83 ec 08             	sub    $0x8,%esp
  100b03:	50                   	push   %eax
  100b04:	ff 75 f4             	pushl  -0xc(%ebp)
  100b07:	e8 76 0b 00 00       	call   101682 <put_into_runnable>
  100b0c:	83 c4 10             	add    $0x10,%esp
  100b0f:	83 ec 0c             	sub    $0xc,%esp
  100b12:	6a 00                	push   $0x0
  100b14:	e8 53 fe ff ff       	call   10096c <enterUserSpace_pcb>
  100b19:	83 c4 10             	add    $0x10,%esp
  100b1c:	90                   	nop
  100b1d:	c9                   	leave  
  100b1e:	c3                   	ret    

00100b1f <loadUMain>:
  100b1f:	55                   	push   %ebp
  100b20:	89 e5                	mov    %esp,%ebp
  100b22:	83 ec 38             	sub    $0x38,%esp
  100b25:	c7 45 e0 00 00 03 00 	movl   $0x30000,-0x20(%ebp)
  100b2c:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  100b33:	eb 24                	jmp    100b59 <loadUMain+0x3a>
  100b35:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b38:	8d 90 c8 00 00 00    	lea    0xc8(%eax),%edx
  100b3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b41:	48                   	dec    %eax
  100b42:	c1 e0 09             	shl    $0x9,%eax
  100b45:	89 c1                	mov    %eax,%ecx
  100b47:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100b4a:	01 c8                	add    %ecx,%eax
  100b4c:	52                   	push   %edx
  100b4d:	50                   	push   %eax
  100b4e:	e8 41 f9 ff ff       	call   100494 <readSect>
  100b53:	83 c4 08             	add    $0x8,%esp
  100b56:	ff 45 f4             	incl   -0xc(%ebp)
  100b59:	81 7d f4 c8 00 00 00 	cmpl   $0xc8,-0xc(%ebp)
  100b60:	7e d3                	jle    100b35 <loadUMain+0x16>
  100b62:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100b65:	89 45 dc             	mov    %eax,-0x24(%ebp)
  100b68:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100b6b:	8b 50 1c             	mov    0x1c(%eax),%edx
  100b6e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100b71:	01 d0                	add    %edx,%eax
  100b73:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100b76:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100b79:	8b 40 2c             	mov    0x2c(%eax),%eax
  100b7c:	0f b7 c0             	movzwl %ax,%eax
  100b7f:	c1 e0 05             	shl    $0x5,%eax
  100b82:	89 c2                	mov    %eax,%edx
  100b84:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b87:	01 d0                	add    %edx,%eax
  100b89:	89 45 d8             	mov    %eax,-0x28(%ebp)
  100b8c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100b93:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100b9a:	eb 78                	jmp    100c14 <loadUMain+0xf5>
  100b9c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b9f:	8b 00                	mov    (%eax),%eax
  100ba1:	83 f8 01             	cmp    $0x1,%eax
  100ba4:	75 6a                	jne    100c10 <loadUMain+0xf1>
  100ba6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ba9:	8b 40 08             	mov    0x8(%eax),%eax
  100bac:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100baf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100bb2:	8b 50 04             	mov    0x4(%eax),%edx
  100bb5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100bb8:	01 d0                	add    %edx,%eax
  100bba:	89 45 e8             	mov    %eax,-0x18(%ebp)
  100bbd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100bc0:	8b 40 10             	mov    0x10(%eax),%eax
  100bc3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100bc6:	eb 10                	jmp    100bd8 <loadUMain+0xb9>
  100bc8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100bcb:	8b 55 e8             	mov    -0x18(%ebp),%edx
  100bce:	8a 12                	mov    (%edx),%dl
  100bd0:	88 10                	mov    %dl,(%eax)
  100bd2:	ff 45 ec             	incl   -0x14(%ebp)
  100bd5:	ff 45 e8             	incl   -0x18(%ebp)
  100bd8:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100bdb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100bde:	8b 40 08             	mov    0x8(%eax),%eax
  100be1:	29 c2                	sub    %eax,%edx
  100be3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100be6:	39 c2                	cmp    %eax,%edx
  100be8:	72 de                	jb     100bc8 <loadUMain+0xa9>
  100bea:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100bed:	8b 40 14             	mov    0x14(%eax),%eax
  100bf0:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100bf3:	eb 09                	jmp    100bfe <loadUMain+0xdf>
  100bf5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100bf8:	c6 00 00             	movb   $0x0,(%eax)
  100bfb:	ff 45 ec             	incl   -0x14(%ebp)
  100bfe:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100c01:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100c04:	8b 40 08             	mov    0x8(%eax),%eax
  100c07:	29 c2                	sub    %eax,%edx
  100c09:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100c0c:	39 c2                	cmp    %eax,%edx
  100c0e:	72 e5                	jb     100bf5 <loadUMain+0xd6>
  100c10:	83 45 f0 20          	addl   $0x20,-0x10(%ebp)
  100c14:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100c17:	3b 45 d8             	cmp    -0x28(%ebp),%eax
  100c1a:	72 80                	jb     100b9c <loadUMain+0x7d>
  100c1c:	c7 45 e8 00 00 20 00 	movl   $0x200000,-0x18(%ebp)
  100c23:	c7 45 ec 00 00 21 00 	movl   $0x210000,-0x14(%ebp)
  100c2a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100c31:	eb 19                	jmp    100c4c <loadUMain+0x12d>
  100c33:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100c36:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c39:	01 d0                	add    %edx,%eax
  100c3b:	89 c2                	mov    %eax,%edx
  100c3d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  100c40:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100c43:	01 c8                	add    %ecx,%eax
  100c45:	8a 00                	mov    (%eax),%al
  100c47:	88 02                	mov    %al,(%edx)
  100c49:	ff 45 e4             	incl   -0x1c(%ebp)
  100c4c:	81 7d e4 ff ff 00 00 	cmpl   $0xffff,-0x1c(%ebp)
  100c53:	7e de                	jle    100c33 <loadUMain+0x114>
  100c55:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100c58:	8b 40 18             	mov    0x18(%eax),%eax
  100c5b:	83 ec 0c             	sub    $0xc,%esp
  100c5e:	50                   	push   %eax
  100c5f:	e8 65 fd ff ff       	call   1009c9 <enterUserSpace>
  100c64:	83 c4 10             	add    $0x10,%esp
  100c67:	90                   	nop
  100c68:	c9                   	leave  
  100c69:	c3                   	ret    

00100c6a <sys_exit>:
  100c6a:	55                   	push   %ebp
  100c6b:	89 e5                	mov    %esp,%ebp
  100c6d:	83 ec 18             	sub    $0x18,%esp
  100c70:	e8 cf 09 00 00       	call   101644 <getpid>
  100c75:	83 ec 0c             	sub    $0xc,%esp
  100c78:	50                   	push   %eax
  100c79:	e8 ae 09 00 00       	call   10162c <put_into_empty>
  100c7e:	83 c4 10             	add    $0x10,%esp
  100c81:	e8 dc 09 00 00       	call   101662 <get_from_runnable>
  100c86:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c89:	83 ec 08             	sub    $0x8,%esp
  100c8c:	ff 75 08             	pushl  0x8(%ebp)
  100c8f:	ff 75 f4             	pushl  -0xc(%ebp)
  100c92:	e8 18 09 00 00       	call   1015af <put_into_running>
  100c97:	83 c4 10             	add    $0x10,%esp
  100c9a:	b8 01 00 00 00       	mov    $0x1,%eax
  100c9f:	c9                   	leave  
  100ca0:	c3                   	ret    

00100ca1 <sys_getpid>:
  100ca1:	55                   	push   %ebp
  100ca2:	89 e5                	mov    %esp,%ebp
  100ca4:	83 ec 08             	sub    $0x8,%esp
  100ca7:	e8 98 09 00 00       	call   101644 <getpid>
  100cac:	c9                   	leave  
  100cad:	c3                   	ret    

00100cae <sys_sleep>:
  100cae:	55                   	push   %ebp
  100caf:	89 e5                	mov    %esp,%ebp
  100cb1:	83 ec 18             	sub    $0x18,%esp
  100cb4:	e8 8b 09 00 00       	call   101644 <getpid>
  100cb9:	83 ec 08             	sub    $0x8,%esp
  100cbc:	ff 75 08             	pushl  0x8(%ebp)
  100cbf:	50                   	push   %eax
  100cc0:	e8 eb 0c 00 00       	call   1019b0 <put_into_block>
  100cc5:	83 c4 10             	add    $0x10,%esp
  100cc8:	e8 95 09 00 00       	call   101662 <get_from_runnable>
  100ccd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100cd0:	83 ec 08             	sub    $0x8,%esp
  100cd3:	ff 75 08             	pushl  0x8(%ebp)
  100cd6:	ff 75 f4             	pushl  -0xc(%ebp)
  100cd9:	e8 d1 08 00 00       	call   1015af <put_into_running>
  100cde:	83 c4 10             	add    $0x10,%esp
  100ce1:	b8 01 00 00 00       	mov    $0x1,%eax
  100ce6:	c9                   	leave  
  100ce7:	c3                   	ret    

00100ce8 <sys_fork>:
  100ce8:	55                   	push   %ebp
  100ce9:	89 e5                	mov    %esp,%ebp
  100ceb:	57                   	push   %edi
  100cec:	56                   	push   %esi
  100ced:	53                   	push   %ebx
  100cee:	83 ec 2c             	sub    $0x2c,%esp
  100cf1:	e8 10 09 00 00       	call   101606 <apply_new_pid>
  100cf6:	89 45 d8             	mov    %eax,-0x28(%ebp)
  100cf9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100d00:	eb 6d                	jmp    100d6f <sys_fork+0x87>
  100d02:	e8 3d 09 00 00       	call   101644 <getpid>
  100d07:	89 c2                	mov    %eax,%edx
  100d09:	89 d0                	mov    %edx,%eax
  100d0b:	c1 e0 02             	shl    $0x2,%eax
  100d0e:	01 d0                	add    %edx,%eax
  100d10:	c1 e0 03             	shl    $0x3,%eax
  100d13:	01 d0                	add    %edx,%eax
  100d15:	01 c0                	add    %eax,%eax
  100d17:	01 d0                	add    %edx,%eax
  100d19:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
  100d20:	01 c8                	add    %ecx,%eax
  100d22:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
  100d29:	01 c8                	add    %ecx,%eax
  100d2b:	01 c2                	add    %eax,%edx
  100d2d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100d30:	01 d0                	add    %edx,%eax
  100d32:	8b 0c 85 00 4b 10 00 	mov    0x104b00(,%eax,4),%ecx
  100d39:	8b 55 d8             	mov    -0x28(%ebp),%edx
  100d3c:	89 d0                	mov    %edx,%eax
  100d3e:	c1 e0 02             	shl    $0x2,%eax
  100d41:	01 d0                	add    %edx,%eax
  100d43:	c1 e0 03             	shl    $0x3,%eax
  100d46:	01 d0                	add    %edx,%eax
  100d48:	01 c0                	add    %eax,%eax
  100d4a:	01 d0                	add    %edx,%eax
  100d4c:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
  100d53:	01 d8                	add    %ebx,%eax
  100d55:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
  100d5c:	01 d8                	add    %ebx,%eax
  100d5e:	01 c2                	add    %eax,%edx
  100d60:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100d63:	01 d0                	add    %edx,%eax
  100d65:	89 0c 85 00 4b 10 00 	mov    %ecx,0x104b00(,%eax,4)
  100d6c:	ff 45 e4             	incl   -0x1c(%ebp)
  100d6f:	81 7d e4 ff 07 00 00 	cmpl   $0x7ff,-0x1c(%ebp)
  100d76:	7e 8a                	jle    100d02 <sys_fork+0x1a>
  100d78:	e8 c7 08 00 00       	call   101644 <getpid>
  100d7d:	83 c0 40             	add    $0x40,%eax
  100d80:	c1 e0 10             	shl    $0x10,%eax
  100d83:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100d86:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100d89:	83 c0 40             	add    $0x40,%eax
  100d8c:	c1 e0 10             	shl    $0x10,%eax
  100d8f:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100d92:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  100d99:	eb 1d                	jmp    100db8 <sys_fork+0xd0>
  100d9b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100d9e:	8b 55 d0             	mov    -0x30(%ebp),%edx
  100da1:	29 c2                	sub    %eax,%edx
  100da3:	89 d0                	mov    %edx,%eax
  100da5:	89 c2                	mov    %eax,%edx
  100da7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100daa:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  100dad:	29 c1                	sub    %eax,%ecx
  100daf:	89 c8                	mov    %ecx,%eax
  100db1:	8a 00                	mov    (%eax),%al
  100db3:	88 02                	mov    %al,(%edx)
  100db5:	ff 45 e0             	incl   -0x20(%ebp)
  100db8:	81 7d e0 ff ff 00 00 	cmpl   $0xffff,-0x20(%ebp)
  100dbf:	7e da                	jle    100d9b <sys_fork+0xb3>
  100dc1:	8b 55 d8             	mov    -0x28(%ebp),%edx
  100dc4:	89 d0                	mov    %edx,%eax
  100dc6:	c1 e0 07             	shl    $0x7,%eax
  100dc9:	01 d0                	add    %edx,%eax
  100dcb:	01 c0                	add    %eax,%eax
  100dcd:	01 d0                	add    %edx,%eax
  100dcf:	01 c0                	add    %eax,%eax
  100dd1:	01 d0                	add    %edx,%eax
  100dd3:	c1 e0 04             	shl    $0x4,%eax
  100dd6:	8d 90 00 6b 10 00    	lea    0x106b00(%eax),%edx
  100ddc:	8b 45 08             	mov    0x8(%ebp),%eax
  100ddf:	89 c3                	mov    %eax,%ebx
  100de1:	b8 13 00 00 00       	mov    $0x13,%eax
  100de6:	89 d7                	mov    %edx,%edi
  100de8:	89 de                	mov    %ebx,%esi
  100dea:	89 c1                	mov    %eax,%ecx
  100dec:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100dee:	8b 55 d8             	mov    -0x28(%ebp),%edx
  100df1:	89 d0                	mov    %edx,%eax
  100df3:	c1 e0 07             	shl    $0x7,%eax
  100df6:	01 d0                	add    %edx,%eax
  100df8:	01 c0                	add    %eax,%eax
  100dfa:	01 d0                	add    %edx,%eax
  100dfc:	01 c0                	add    %eax,%eax
  100dfe:	01 d0                	add    %edx,%eax
  100e00:	c1 e0 04             	shl    $0x4,%eax
  100e03:	05 2c 6b 10 00       	add    $0x106b2c,%eax
  100e08:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  100e0e:	e8 31 08 00 00       	call   101644 <getpid>
  100e13:	83 c0 20             	add    $0x20,%eax
  100e16:	c1 e0 10             	shl    $0x10,%eax
  100e19:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100e1c:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100e1f:	83 c0 20             	add    $0x20,%eax
  100e22:	c1 e0 10             	shl    $0x10,%eax
  100e25:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100e28:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  100e2f:	eb 19                	jmp    100e4a <sys_fork+0x162>
  100e31:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100e34:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100e37:	01 d0                	add    %edx,%eax
  100e39:	89 c2                	mov    %eax,%edx
  100e3b:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  100e3e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100e41:	01 c8                	add    %ecx,%eax
  100e43:	8a 00                	mov    (%eax),%al
  100e45:	88 02                	mov    %al,(%edx)
  100e47:	ff 45 dc             	incl   -0x24(%ebp)
  100e4a:	81 7d dc ff ff 00 00 	cmpl   $0xffff,-0x24(%ebp)
  100e51:	7e de                	jle    100e31 <sys_fork+0x149>
  100e53:	8b 55 d8             	mov    -0x28(%ebp),%edx
  100e56:	89 d0                	mov    %edx,%eax
  100e58:	c1 e0 07             	shl    $0x7,%eax
  100e5b:	01 d0                	add    %edx,%eax
  100e5d:	01 c0                	add    %eax,%eax
  100e5f:	01 d0                	add    %edx,%eax
  100e61:	01 c0                	add    %eax,%eax
  100e63:	01 d0                	add    %edx,%eax
  100e65:	c1 e0 04             	shl    $0x4,%eax
  100e68:	05 00 20 00 00       	add    $0x2000,%eax
  100e6d:	05 00 4b 10 00       	add    $0x104b00,%eax
  100e72:	83 ec 08             	sub    $0x8,%esp
  100e75:	50                   	push   %eax
  100e76:	ff 75 d8             	pushl  -0x28(%ebp)
  100e79:	e8 04 08 00 00       	call   101682 <put_into_runnable>
  100e7e:	83 c4 10             	add    $0x10,%esp
  100e81:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100e84:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100e87:	5b                   	pop    %ebx
  100e88:	5e                   	pop    %esi
  100e89:	5f                   	pop    %edi
  100e8a:	5d                   	pop    %ebp
  100e8b:	c3                   	ret    

00100e8c <outByte>:
  100e8c:	55                   	push   %ebp
  100e8d:	89 e5                	mov    %esp,%ebp
  100e8f:	83 ec 08             	sub    $0x8,%esp
  100e92:	8b 45 08             	mov    0x8(%ebp),%eax
  100e95:	8b 55 0c             	mov    0xc(%ebp),%edx
  100e98:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  100e9c:	88 55 f8             	mov    %dl,-0x8(%ebp)
  100e9f:	8a 45 f8             	mov    -0x8(%ebp),%al
  100ea2:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100ea5:	ee                   	out    %al,(%dx)
  100ea6:	90                   	nop
  100ea7:	c9                   	leave  
  100ea8:	c3                   	ret    

00100ea9 <backSpace>:
  100ea9:	55                   	push   %ebp
  100eaa:	89 e5                	mov    %esp,%ebp
  100eac:	83 ec 08             	sub    $0x8,%esp
  100eaf:	a1 4c 42 10 00       	mov    0x10424c,%eax
  100eb4:	85 c0                	test   %eax,%eax
  100eb6:	75 31                	jne    100ee9 <backSpace+0x40>
  100eb8:	a1 48 42 10 00       	mov    0x104248,%eax
  100ebd:	48                   	dec    %eax
  100ebe:	a3 48 42 10 00       	mov    %eax,0x104248
  100ec3:	c7 05 4c 42 10 00 50 	movl   $0x50,0x10424c
  100eca:	00 00 00 
  100ecd:	8b 15 4c 42 10 00    	mov    0x10424c,%edx
  100ed3:	a1 48 42 10 00       	mov    0x104248,%eax
  100ed8:	83 ec 04             	sub    $0x4,%esp
  100edb:	6a 20                	push   $0x20
  100edd:	52                   	push   %edx
  100ede:	50                   	push   %eax
  100edf:	e8 0e 03 00 00       	call   1011f2 <print_char>
  100ee4:	83 c4 10             	add    $0x10,%esp
  100ee7:	eb 25                	jmp    100f0e <backSpace+0x65>
  100ee9:	a1 4c 42 10 00       	mov    0x10424c,%eax
  100eee:	48                   	dec    %eax
  100eef:	a3 4c 42 10 00       	mov    %eax,0x10424c
  100ef4:	8b 15 4c 42 10 00    	mov    0x10424c,%edx
  100efa:	a1 48 42 10 00       	mov    0x104248,%eax
  100eff:	83 ec 04             	sub    $0x4,%esp
  100f02:	6a 20                	push   $0x20
  100f04:	52                   	push   %edx
  100f05:	50                   	push   %eax
  100f06:	e8 e7 02 00 00       	call   1011f2 <print_char>
  100f0b:	83 c4 10             	add    $0x10,%esp
  100f0e:	8b 15 4c 42 10 00    	mov    0x10424c,%edx
  100f14:	a1 48 42 10 00       	mov    0x104248,%eax
  100f19:	83 ec 08             	sub    $0x8,%esp
  100f1c:	52                   	push   %edx
  100f1d:	50                   	push   %eax
  100f1e:	e8 3b 01 00 00       	call   10105e <update_cursor>
  100f23:	83 c4 10             	add    $0x10,%esp
  100f26:	b8 01 00 00 00       	mov    $0x1,%eax
  100f2b:	c9                   	leave  
  100f2c:	c3                   	ret    

00100f2d <printkernel>:
  100f2d:	55                   	push   %ebp
  100f2e:	89 e5                	mov    %esp,%ebp
  100f30:	83 ec 18             	sub    $0x18,%esp
  100f33:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100f3a:	e9 03 01 00 00       	jmp    101042 <printkernel+0x115>
  100f3f:	8b 45 08             	mov    0x8(%ebp),%eax
  100f42:	8a 00                	mov    (%eax),%al
  100f44:	88 45 ef             	mov    %al,-0x11(%ebp)
  100f47:	80 7d ef 0a          	cmpb   $0xa,-0x11(%ebp)
  100f4b:	75 58                	jne    100fa5 <printkernel+0x78>
  100f4d:	a1 4c 42 10 00       	mov    0x10424c,%eax
  100f52:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100f55:	eb 19                	jmp    100f70 <printkernel+0x43>
  100f57:	a1 48 42 10 00       	mov    0x104248,%eax
  100f5c:	83 ec 04             	sub    $0x4,%esp
  100f5f:	6a 20                	push   $0x20
  100f61:	ff 75 f0             	pushl  -0x10(%ebp)
  100f64:	50                   	push   %eax
  100f65:	e8 88 02 00 00       	call   1011f2 <print_char>
  100f6a:	83 c4 10             	add    $0x10,%esp
  100f6d:	ff 45 f0             	incl   -0x10(%ebp)
  100f70:	83 7d f0 50          	cmpl   $0x50,-0x10(%ebp)
  100f74:	7e e1                	jle    100f57 <printkernel+0x2a>
  100f76:	c7 05 4c 42 10 00 00 	movl   $0x0,0x10424c
  100f7d:	00 00 00 
  100f80:	a1 48 42 10 00       	mov    0x104248,%eax
  100f85:	40                   	inc    %eax
  100f86:	a3 48 42 10 00       	mov    %eax,0x104248
  100f8b:	8b 15 4c 42 10 00    	mov    0x10424c,%edx
  100f91:	a1 48 42 10 00       	mov    0x104248,%eax
  100f96:	83 ec 08             	sub    $0x8,%esp
  100f99:	52                   	push   %edx
  100f9a:	50                   	push   %eax
  100f9b:	e8 be 00 00 00       	call   10105e <update_cursor>
  100fa0:	83 c4 10             	add    $0x10,%esp
  100fa3:	eb 40                	jmp    100fe5 <printkernel+0xb8>
  100fa5:	0f be 4d ef          	movsbl -0x11(%ebp),%ecx
  100fa9:	8b 15 4c 42 10 00    	mov    0x10424c,%edx
  100faf:	a1 48 42 10 00       	mov    0x104248,%eax
  100fb4:	83 ec 04             	sub    $0x4,%esp
  100fb7:	51                   	push   %ecx
  100fb8:	52                   	push   %edx
  100fb9:	50                   	push   %eax
  100fba:	e8 33 02 00 00       	call   1011f2 <print_char>
  100fbf:	83 c4 10             	add    $0x10,%esp
  100fc2:	a1 4c 42 10 00       	mov    0x10424c,%eax
  100fc7:	40                   	inc    %eax
  100fc8:	a3 4c 42 10 00       	mov    %eax,0x10424c
  100fcd:	8b 15 4c 42 10 00    	mov    0x10424c,%edx
  100fd3:	a1 48 42 10 00       	mov    0x104248,%eax
  100fd8:	83 ec 08             	sub    $0x8,%esp
  100fdb:	52                   	push   %edx
  100fdc:	50                   	push   %eax
  100fdd:	e8 7c 00 00 00       	call   10105e <update_cursor>
  100fe2:	83 c4 10             	add    $0x10,%esp
  100fe5:	a1 4c 42 10 00       	mov    0x10424c,%eax
  100fea:	83 f8 50             	cmp    $0x50,%eax
  100fed:	75 15                	jne    101004 <printkernel+0xd7>
  100fef:	c7 05 4c 42 10 00 00 	movl   $0x0,0x10424c
  100ff6:	00 00 00 
  100ff9:	a1 48 42 10 00       	mov    0x104248,%eax
  100ffe:	40                   	inc    %eax
  100fff:	a3 48 42 10 00       	mov    %eax,0x104248
  101004:	8b 15 48 42 10 00    	mov    0x104248,%edx
  10100a:	a1 00 40 10 00       	mov    0x104000,%eax
  10100f:	39 c2                	cmp    %eax,%edx
  101011:	7e 29                	jle    10103c <printkernel+0x10f>
  101013:	a1 48 42 10 00       	mov    0x104248,%eax
  101018:	83 ec 0c             	sub    $0xc,%esp
  10101b:	50                   	push   %eax
  10101c:	e8 ac 00 00 00       	call   1010cd <scrollScreen>
  101021:	83 c4 10             	add    $0x10,%esp
  101024:	8b 15 4c 42 10 00    	mov    0x10424c,%edx
  10102a:	a1 48 42 10 00       	mov    0x104248,%eax
  10102f:	83 ec 08             	sub    $0x8,%esp
  101032:	52                   	push   %edx
  101033:	50                   	push   %eax
  101034:	e8 25 00 00 00       	call   10105e <update_cursor>
  101039:	83 c4 10             	add    $0x10,%esp
  10103c:	ff 45 f4             	incl   -0xc(%ebp)
  10103f:	ff 45 08             	incl   0x8(%ebp)
  101042:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101045:	3b 45 0c             	cmp    0xc(%ebp),%eax
  101048:	7d 0d                	jge    101057 <printkernel+0x12a>
  10104a:	8b 45 08             	mov    0x8(%ebp),%eax
  10104d:	8a 00                	mov    (%eax),%al
  10104f:	84 c0                	test   %al,%al
  101051:	0f 85 e8 fe ff ff    	jne    100f3f <printkernel+0x12>
  101057:	b8 01 00 00 00       	mov    $0x1,%eax
  10105c:	c9                   	leave  
  10105d:	c3                   	ret    

0010105e <update_cursor>:
  10105e:	55                   	push   %ebp
  10105f:	89 e5                	mov    %esp,%ebp
  101061:	83 ec 10             	sub    $0x10,%esp
  101064:	8b 45 08             	mov    0x8(%ebp),%eax
  101067:	89 c2                	mov    %eax,%edx
  101069:	89 d0                	mov    %edx,%eax
  10106b:	c1 e0 02             	shl    $0x2,%eax
  10106e:	01 d0                	add    %edx,%eax
  101070:	c1 e0 04             	shl    $0x4,%eax
  101073:	89 c2                	mov    %eax,%edx
  101075:	8b 45 0c             	mov    0xc(%ebp),%eax
  101078:	01 d0                	add    %edx,%eax
  10107a:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  10107e:	6a 0f                	push   $0xf
  101080:	68 d4 03 00 00       	push   $0x3d4
  101085:	e8 02 fe ff ff       	call   100e8c <outByte>
  10108a:	83 c4 08             	add    $0x8,%esp
  10108d:	66 8b 45 fe          	mov    -0x2(%ebp),%ax
  101091:	0f be c0             	movsbl %al,%eax
  101094:	50                   	push   %eax
  101095:	68 d5 03 00 00       	push   $0x3d5
  10109a:	e8 ed fd ff ff       	call   100e8c <outByte>
  10109f:	83 c4 08             	add    $0x8,%esp
  1010a2:	6a 0e                	push   $0xe
  1010a4:	68 d4 03 00 00       	push   $0x3d4
  1010a9:	e8 de fd ff ff       	call   100e8c <outByte>
  1010ae:	83 c4 08             	add    $0x8,%esp
  1010b1:	66 8b 45 fe          	mov    -0x2(%ebp),%ax
  1010b5:	66 c1 e8 08          	shr    $0x8,%ax
  1010b9:	0f be c0             	movsbl %al,%eax
  1010bc:	50                   	push   %eax
  1010bd:	68 d5 03 00 00       	push   $0x3d5
  1010c2:	e8 c5 fd ff ff       	call   100e8c <outByte>
  1010c7:	83 c4 08             	add    $0x8,%esp
  1010ca:	90                   	nop
  1010cb:	c9                   	leave  
  1010cc:	c3                   	ret    

001010cd <scrollScreen>:
  1010cd:	55                   	push   %ebp
  1010ce:	89 e5                	mov    %esp,%ebp
  1010d0:	57                   	push   %edi
  1010d1:	83 ec 14             	sub    $0x14,%esp
  1010d4:	a1 48 42 10 00       	mov    0x104248,%eax
  1010d9:	85 c0                	test   %eax,%eax
  1010db:	7f 12                	jg     1010ef <scrollScreen+0x22>
  1010dd:	83 ec 08             	sub    $0x8,%esp
  1010e0:	6a 48                	push   $0x48
  1010e2:	68 23 2e 10 00       	push   $0x102e23
  1010e7:	e8 93 1c 00 00       	call   102d7f <abort>
  1010ec:	83 c4 10             	add    $0x10,%esp
  1010ef:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  1010f6:	eb 76                	jmp    10116e <scrollScreen+0xa1>
  1010f8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  1010ff:	eb 61                	jmp    101162 <scrollScreen+0x95>
  101101:	a1 48 42 10 00       	mov    0x104248,%eax
  101106:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  101109:	75 0a                	jne    101115 <scrollScreen+0x48>
  10110b:	a1 4c 42 10 00       	mov    0x10424c,%eax
  101110:	39 45 f0             	cmp    %eax,-0x10(%ebp)
  101113:	7d 55                	jge    10116a <scrollScreen+0x9d>
  101115:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101118:	89 d0                	mov    %edx,%eax
  10111a:	c1 e0 02             	shl    $0x2,%eax
  10111d:	01 d0                	add    %edx,%eax
  10111f:	c1 e0 04             	shl    $0x4,%eax
  101122:	89 c2                	mov    %eax,%edx
  101124:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101127:	01 d0                	add    %edx,%eax
  101129:	01 c0                	add    %eax,%eax
  10112b:	89 c7                	mov    %eax,%edi
  10112d:	65 8a 07             	mov    %gs:(%edi),%al
  101130:	88 45 ef             	mov    %al,-0x11(%ebp)
  101133:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101136:	8d 50 ff             	lea    -0x1(%eax),%edx
  101139:	89 d0                	mov    %edx,%eax
  10113b:	c1 e0 02             	shl    $0x2,%eax
  10113e:	01 d0                	add    %edx,%eax
  101140:	c1 e0 04             	shl    $0x4,%eax
  101143:	89 c2                	mov    %eax,%edx
  101145:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101148:	01 d0                	add    %edx,%eax
  10114a:	01 c0                	add    %eax,%eax
  10114c:	89 c7                	mov    %eax,%edi
  10114e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  101152:	8d 90 00 0c 00 00    	lea    0xc00(%eax),%edx
  101158:	66 89 d0             	mov    %dx,%ax
  10115b:	65 66 89 07          	mov    %ax,%gs:(%edi)
  10115f:	ff 45 f0             	incl   -0x10(%ebp)
  101162:	83 7d f0 50          	cmpl   $0x50,-0x10(%ebp)
  101166:	7e 99                	jle    101101 <scrollScreen+0x34>
  101168:	eb 01                	jmp    10116b <scrollScreen+0x9e>
  10116a:	90                   	nop
  10116b:	ff 45 f4             	incl   -0xc(%ebp)
  10116e:	a1 48 42 10 00       	mov    0x104248,%eax
  101173:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  101176:	7e 80                	jle    1010f8 <scrollScreen+0x2b>
  101178:	a1 48 42 10 00       	mov    0x104248,%eax
  10117d:	48                   	dec    %eax
  10117e:	a3 48 42 10 00       	mov    %eax,0x104248
  101183:	90                   	nop
  101184:	8b 7d fc             	mov    -0x4(%ebp),%edi
  101187:	c9                   	leave  
  101188:	c3                   	ret    

00101189 <sys_write>:
  101189:	55                   	push   %ebp
  10118a:	89 e5                	mov    %esp,%ebp
  10118c:	53                   	push   %ebx
  10118d:	83 ec 04             	sub    $0x4,%esp
  101190:	ba 30 00 00 00       	mov    $0x30,%edx
  101195:	89 d0                	mov    %edx,%eax
  101197:	8e e8                	mov    %eax,%gs
  101199:	8b 45 08             	mov    0x8(%ebp),%eax
  10119c:	8b 40 20             	mov    0x20(%eax),%eax
  10119f:	83 f8 01             	cmp    $0x1,%eax
  1011a2:	74 1d                	je     1011c1 <sys_write+0x38>
  1011a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1011a7:	8b 40 20             	mov    0x20(%eax),%eax
  1011aa:	83 f8 02             	cmp    $0x2,%eax
  1011ad:	74 12                	je     1011c1 <sys_write+0x38>
  1011af:	83 ec 08             	sub    $0x8,%esp
  1011b2:	6a 6d                	push   $0x6d
  1011b4:	68 23 2e 10 00       	push   $0x102e23
  1011b9:	e8 c1 1b 00 00       	call   102d7f <abort>
  1011be:	83 c4 10             	add    $0x10,%esp
  1011c1:	8b 45 08             	mov    0x8(%ebp),%eax
  1011c4:	8b 40 24             	mov    0x24(%eax),%eax
  1011c7:	89 c3                	mov    %eax,%ebx
  1011c9:	e8 76 04 00 00       	call   101644 <getpid>
  1011ce:	c1 e0 10             	shl    $0x10,%eax
  1011d1:	89 c2                	mov    %eax,%edx
  1011d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1011d6:	8b 40 28             	mov    0x28(%eax),%eax
  1011d9:	01 d0                	add    %edx,%eax
  1011db:	83 ec 08             	sub    $0x8,%esp
  1011de:	53                   	push   %ebx
  1011df:	50                   	push   %eax
  1011e0:	e8 48 fd ff ff       	call   100f2d <printkernel>
  1011e5:	83 c4 10             	add    $0x10,%esp
  1011e8:	b8 01 00 00 00       	mov    $0x1,%eax
  1011ed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1011f0:	c9                   	leave  
  1011f1:	c3                   	ret    

001011f2 <print_char>:
  1011f2:	55                   	push   %ebp
  1011f3:	89 e5                	mov    %esp,%ebp
  1011f5:	57                   	push   %edi
  1011f6:	83 ec 04             	sub    $0x4,%esp
  1011f9:	8b 45 10             	mov    0x10(%ebp),%eax
  1011fc:	88 45 f8             	mov    %al,-0x8(%ebp)
  1011ff:	8b 55 08             	mov    0x8(%ebp),%edx
  101202:	89 d0                	mov    %edx,%eax
  101204:	c1 e0 02             	shl    $0x2,%eax
  101207:	01 d0                	add    %edx,%eax
  101209:	c1 e0 04             	shl    $0x4,%eax
  10120c:	89 c2                	mov    %eax,%edx
  10120e:	8b 45 0c             	mov    0xc(%ebp),%eax
  101211:	01 d0                	add    %edx,%eax
  101213:	01 c0                	add    %eax,%eax
  101215:	89 c7                	mov    %eax,%edi
  101217:	0f be 45 f8          	movsbl -0x8(%ebp),%eax
  10121b:	8d 90 00 0c 00 00    	lea    0xc00(%eax),%edx
  101221:	66 89 d0             	mov    %dx,%ax
  101224:	65 66 89 07          	mov    %ax,%gs:(%edi)
  101228:	90                   	nop
  101229:	83 c4 04             	add    $0x4,%esp
  10122c:	5f                   	pop    %edi
  10122d:	5d                   	pop    %ebp
  10122e:	c3                   	ret    

0010122f <inByte>:
  10122f:	55                   	push   %ebp
  101230:	89 e5                	mov    %esp,%ebp
  101232:	83 ec 14             	sub    $0x14,%esp
  101235:	8b 45 08             	mov    0x8(%ebp),%eax
  101238:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  10123c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10123f:	89 c2                	mov    %eax,%edx
  101241:	ec                   	in     (%dx),%al
  101242:	88 45 ff             	mov    %al,-0x1(%ebp)
  101245:	8a 45 ff             	mov    -0x1(%ebp),%al
  101248:	c9                   	leave  
  101249:	c3                   	ret    

0010124a <getScancode>:
  10124a:	55                   	push   %ebp
  10124b:	89 e5                	mov    %esp,%ebp
  10124d:	90                   	nop
  10124e:	6a 64                	push   $0x64
  101250:	e8 da ff ff ff       	call   10122f <inByte>
  101255:	83 c4 04             	add    $0x4,%esp
  101258:	0f b6 c0             	movzbl %al,%eax
  10125b:	83 e0 01             	and    $0x1,%eax
  10125e:	85 c0                	test   %eax,%eax
  101260:	74 ec                	je     10124e <getScancode+0x4>
  101262:	6a 60                	push   $0x60
  101264:	e8 c6 ff ff ff       	call   10122f <inByte>
  101269:	83 c4 04             	add    $0x4,%esp
  10126c:	c9                   	leave  
  10126d:	c3                   	ret    

0010126e <sys_read>:
  10126e:	55                   	push   %ebp
  10126f:	89 e5                	mov    %esp,%ebp
  101271:	53                   	push   %ebx
  101272:	83 ec 24             	sub    $0x24,%esp
  101275:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  10127c:	8b 45 08             	mov    0x8(%ebp),%eax
  10127f:	8b 58 28             	mov    0x28(%eax),%ebx
  101282:	e8 bd 03 00 00       	call   101644 <getpid>
  101287:	c1 e0 10             	shl    $0x10,%eax
  10128a:	01 d8                	add    %ebx,%eax
  10128c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10128f:	8b 45 08             	mov    0x8(%ebp),%eax
  101292:	8b 40 24             	mov    0x24(%eax),%eax
  101295:	89 45 e0             	mov    %eax,-0x20(%ebp)
  101298:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10129f:	e9 b9 01 00 00       	jmp    10145d <sys_read+0x1ef>
  1012a4:	e8 a1 ff ff ff       	call   10124a <getScancode>
  1012a9:	0f b6 c0             	movzbl %al,%eax
  1012ac:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1012af:	83 7d e8 3a          	cmpl   $0x3a,-0x18(%ebp)
  1012b3:	75 18                	jne    1012cd <sys_read+0x5f>
  1012b5:	a1 50 42 10 00       	mov    0x104250,%eax
  1012ba:	83 f8 01             	cmp    $0x1,%eax
  1012bd:	0f 95 c0             	setne  %al
  1012c0:	0f b6 c0             	movzbl %al,%eax
  1012c3:	a3 50 42 10 00       	mov    %eax,0x104250
  1012c8:	e9 90 01 00 00       	jmp    10145d <sys_read+0x1ef>
  1012cd:	83 7d e8 2a          	cmpl   $0x2a,-0x18(%ebp)
  1012d1:	74 06                	je     1012d9 <sys_read+0x6b>
  1012d3:	83 7d e8 36          	cmpl   $0x36,-0x18(%ebp)
  1012d7:	75 0f                	jne    1012e8 <sys_read+0x7a>
  1012d9:	c7 05 54 42 10 00 01 	movl   $0x1,0x104254
  1012e0:	00 00 00 
  1012e3:	e9 75 01 00 00       	jmp    10145d <sys_read+0x1ef>
  1012e8:	81 7d e8 aa 00 00 00 	cmpl   $0xaa,-0x18(%ebp)
  1012ef:	74 09                	je     1012fa <sys_read+0x8c>
  1012f1:	81 7d e8 b6 00 00 00 	cmpl   $0xb6,-0x18(%ebp)
  1012f8:	75 0f                	jne    101309 <sys_read+0x9b>
  1012fa:	c7 05 54 42 10 00 00 	movl   $0x0,0x104254
  101301:	00 00 00 
  101304:	e9 54 01 00 00       	jmp    10145d <sys_read+0x1ef>
  101309:	83 7d e8 7f          	cmpl   $0x7f,-0x18(%ebp)
  10130d:	76 05                	jbe    101314 <sys_read+0xa6>
  10130f:	e9 49 01 00 00       	jmp    10145d <sys_read+0x1ef>
  101314:	8b 45 e8             	mov    -0x18(%ebp),%eax
  101317:	05 20 40 10 00       	add    $0x104020,%eax
  10131c:	8a 00                	mov    (%eax),%al
  10131e:	88 45 df             	mov    %al,-0x21(%ebp)
  101321:	8a 45 df             	mov    -0x21(%ebp),%al
  101324:	3c 08                	cmp    $0x8,%al
  101326:	75 0a                	jne    101332 <sys_read+0xc4>
  101328:	e8 7c fb ff ff       	call   100ea9 <backSpace>
  10132d:	e9 2b 01 00 00       	jmp    10145d <sys_read+0x1ef>
  101332:	a1 54 42 10 00       	mov    0x104254,%eax
  101337:	83 f8 01             	cmp    $0x1,%eax
  10133a:	0f 85 d1 00 00 00    	jne    101411 <sys_read+0x1a3>
  101340:	83 7d e8 0d          	cmpl   $0xd,-0x18(%ebp)
  101344:	77 12                	ja     101358 <sys_read+0xea>
  101346:	8b 45 e8             	mov    -0x18(%ebp),%eax
  101349:	48                   	dec    %eax
  10134a:	8a 80 20 41 10 00    	mov    0x104120(%eax),%al
  101350:	88 45 df             	mov    %al,-0x21(%ebp)
  101353:	e9 b9 00 00 00       	jmp    101411 <sys_read+0x1a3>
  101358:	8a 45 df             	mov    -0x21(%ebp),%al
  10135b:	3c 60                	cmp    $0x60,%al
  10135d:	7e 1e                	jle    10137d <sys_read+0x10f>
  10135f:	8a 45 df             	mov    -0x21(%ebp),%al
  101362:	3c 7a                	cmp    $0x7a,%al
  101364:	7f 17                	jg     10137d <sys_read+0x10f>
  101366:	a1 50 42 10 00       	mov    0x104250,%eax
  10136b:	85 c0                	test   %eax,%eax
  10136d:	75 0e                	jne    10137d <sys_read+0x10f>
  10136f:	8a 45 df             	mov    -0x21(%ebp),%al
  101372:	83 e8 20             	sub    $0x20,%eax
  101375:	88 45 df             	mov    %al,-0x21(%ebp)
  101378:	e9 94 00 00 00       	jmp    101411 <sys_read+0x1a3>
  10137d:	8a 45 df             	mov    -0x21(%ebp),%al
  101380:	3c 2b                	cmp    $0x2b,%al
  101382:	7e 12                	jle    101396 <sys_read+0x128>
  101384:	8a 45 df             	mov    -0x21(%ebp),%al
  101387:	3c 2f                	cmp    $0x2f,%al
  101389:	7f 0b                	jg     101396 <sys_read+0x128>
  10138b:	8a 45 df             	mov    -0x21(%ebp),%al
  10138e:	83 c0 10             	add    $0x10,%eax
  101391:	88 45 df             	mov    %al,-0x21(%ebp)
  101394:	eb 7b                	jmp    101411 <sys_read+0x1a3>
  101396:	8b 45 e8             	mov    -0x18(%ebp),%eax
  101399:	83 f8 28             	cmp    $0x28,%eax
  10139c:	74 10                	je     1013ae <sys_read+0x140>
  10139e:	83 f8 29             	cmp    $0x29,%eax
  1013a1:	74 11                	je     1013b4 <sys_read+0x146>
  1013a3:	83 f8 27             	cmp    $0x27,%eax
  1013a6:	75 12                	jne    1013ba <sys_read+0x14c>
  1013a8:	c6 45 f3 3a          	movb   $0x3a,-0xd(%ebp)
  1013ac:	eb 5d                	jmp    10140b <sys_read+0x19d>
  1013ae:	c6 45 f3 22          	movb   $0x22,-0xd(%ebp)
  1013b2:	eb 57                	jmp    10140b <sys_read+0x19d>
  1013b4:	c6 45 f3 7e          	movb   $0x7e,-0xd(%ebp)
  1013b8:	eb 51                	jmp    10140b <sys_read+0x19d>
  1013ba:	83 ec 0c             	sub    $0xc,%esp
  1013bd:	68 40 2e 10 00       	push   $0x102e40
  1013c2:	e8 fc 16 00 00       	call   102ac3 <printk>
  1013c7:	83 c4 10             	add    $0x10,%esp
  1013ca:	83 ec 0c             	sub    $0xc,%esp
  1013cd:	ff 75 e8             	pushl  -0x18(%ebp)
  1013d0:	68 7c 2e 10 00       	push   $0x102e7c
  1013d5:	6a 5a                	push   $0x5a
  1013d7:	68 46 2e 10 00       	push   $0x102e46
  1013dc:	68 61 2e 10 00       	push   $0x102e61
  1013e1:	e8 dd 16 00 00       	call   102ac3 <printk>
  1013e6:	83 c4 20             	add    $0x20,%esp
  1013e9:	83 ec 0c             	sub    $0xc,%esp
  1013ec:	68 76 2e 10 00       	push   $0x102e76
  1013f1:	e8 cd 16 00 00       	call   102ac3 <printk>
  1013f6:	83 c4 10             	add    $0x10,%esp
  1013f9:	83 ec 08             	sub    $0x8,%esp
  1013fc:	6a 5b                	push   $0x5b
  1013fe:	68 46 2e 10 00       	push   $0x102e46
  101403:	e8 77 19 00 00       	call   102d7f <abort>
  101408:	83 c4 10             	add    $0x10,%esp
  10140b:	8a 45 f3             	mov    -0xd(%ebp),%al
  10140e:	88 45 df             	mov    %al,-0x21(%ebp)
  101411:	a1 50 42 10 00       	mov    0x104250,%eax
  101416:	83 f8 01             	cmp    $0x1,%eax
  101419:	75 20                	jne    10143b <sys_read+0x1cd>
  10141b:	8a 45 df             	mov    -0x21(%ebp),%al
  10141e:	3c 60                	cmp    $0x60,%al
  101420:	7e 19                	jle    10143b <sys_read+0x1cd>
  101422:	8a 45 df             	mov    -0x21(%ebp),%al
  101425:	3c 7a                	cmp    $0x7a,%al
  101427:	7f 12                	jg     10143b <sys_read+0x1cd>
  101429:	a1 54 42 10 00       	mov    0x104254,%eax
  10142e:	85 c0                	test   %eax,%eax
  101430:	75 09                	jne    10143b <sys_read+0x1cd>
  101432:	8a 45 df             	mov    -0x21(%ebp),%al
  101435:	83 e8 20             	sub    $0x20,%eax
  101438:	88 45 df             	mov    %al,-0x21(%ebp)
  10143b:	8a 45 df             	mov    -0x21(%ebp),%al
  10143e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101441:	81 c2 e0 cb 13 01    	add    $0x113cbe0,%edx
  101447:	88 02                	mov    %al,(%edx)
  101449:	ff 45 f4             	incl   -0xc(%ebp)
  10144c:	83 ec 08             	sub    $0x8,%esp
  10144f:	6a 01                	push   $0x1
  101451:	8d 45 df             	lea    -0x21(%ebp),%eax
  101454:	50                   	push   %eax
  101455:	e8 d3 fa ff ff       	call   100f2d <printkernel>
  10145a:	83 c4 10             	add    $0x10,%esp
  10145d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101460:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  101463:	7d 0b                	jge    101470 <sys_read+0x202>
  101465:	8a 45 df             	mov    -0x21(%ebp),%al
  101468:	3c 0a                	cmp    $0xa,%al
  10146a:	0f 85 34 fe ff ff    	jne    1012a4 <sys_read+0x36>
  101470:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101473:	48                   	dec    %eax
  101474:	c6 80 e0 cb 13 01 00 	movb   $0x0,0x113cbe0(%eax)
  10147b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  101482:	eb 17                	jmp    10149b <sys_read+0x22d>
  101484:	8b 55 ec             	mov    -0x14(%ebp),%edx
  101487:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10148a:	01 c2                	add    %eax,%edx
  10148c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10148f:	05 e0 cb 13 01       	add    $0x113cbe0,%eax
  101494:	8a 00                	mov    (%eax),%al
  101496:	88 02                	mov    %al,(%edx)
  101498:	ff 45 ec             	incl   -0x14(%ebp)
  10149b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10149e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  1014a1:	7c e1                	jl     101484 <sys_read+0x216>
  1014a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1014a6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1014a9:	c9                   	leave  
  1014aa:	c3                   	ret    

001014ab <inByte>:
  1014ab:	55                   	push   %ebp
  1014ac:	89 e5                	mov    %esp,%ebp
  1014ae:	83 ec 14             	sub    $0x14,%esp
  1014b1:	8b 45 08             	mov    0x8(%ebp),%eax
  1014b4:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  1014b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1014bb:	89 c2                	mov    %eax,%edx
  1014bd:	ec                   	in     (%dx),%al
  1014be:	88 45 ff             	mov    %al,-0x1(%ebp)
  1014c1:	8a 45 ff             	mov    -0x1(%ebp),%al
  1014c4:	c9                   	leave  
  1014c5:	c3                   	ret    

001014c6 <outByte>:
  1014c6:	55                   	push   %ebp
  1014c7:	89 e5                	mov    %esp,%ebp
  1014c9:	83 ec 08             	sub    $0x8,%esp
  1014cc:	8b 45 08             	mov    0x8(%ebp),%eax
  1014cf:	8b 55 0c             	mov    0xc(%ebp),%edx
  1014d2:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  1014d6:	88 55 f8             	mov    %dl,-0x8(%ebp)
  1014d9:	8a 45 f8             	mov    -0x8(%ebp),%al
  1014dc:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1014df:	ee                   	out    %al,(%dx)
  1014e0:	90                   	nop
  1014e1:	c9                   	leave  
  1014e2:	c3                   	ret    

001014e3 <initSerial>:
  1014e3:	55                   	push   %ebp
  1014e4:	89 e5                	mov    %esp,%ebp
  1014e6:	6a 00                	push   $0x0
  1014e8:	68 f9 03 00 00       	push   $0x3f9
  1014ed:	e8 d4 ff ff ff       	call   1014c6 <outByte>
  1014f2:	83 c4 08             	add    $0x8,%esp
  1014f5:	6a 80                	push   $0xffffff80
  1014f7:	68 fb 03 00 00       	push   $0x3fb
  1014fc:	e8 c5 ff ff ff       	call   1014c6 <outByte>
  101501:	83 c4 08             	add    $0x8,%esp
  101504:	6a 01                	push   $0x1
  101506:	68 f8 03 00 00       	push   $0x3f8
  10150b:	e8 b6 ff ff ff       	call   1014c6 <outByte>
  101510:	83 c4 08             	add    $0x8,%esp
  101513:	6a 00                	push   $0x0
  101515:	68 f9 03 00 00       	push   $0x3f9
  10151a:	e8 a7 ff ff ff       	call   1014c6 <outByte>
  10151f:	83 c4 08             	add    $0x8,%esp
  101522:	6a 03                	push   $0x3
  101524:	68 fb 03 00 00       	push   $0x3fb
  101529:	e8 98 ff ff ff       	call   1014c6 <outByte>
  10152e:	83 c4 08             	add    $0x8,%esp
  101531:	6a c7                	push   $0xffffffc7
  101533:	68 fa 03 00 00       	push   $0x3fa
  101538:	e8 89 ff ff ff       	call   1014c6 <outByte>
  10153d:	83 c4 08             	add    $0x8,%esp
  101540:	6a 0b                	push   $0xb
  101542:	68 fc 03 00 00       	push   $0x3fc
  101547:	e8 7a ff ff ff       	call   1014c6 <outByte>
  10154c:	83 c4 08             	add    $0x8,%esp
  10154f:	90                   	nop
  101550:	c9                   	leave  
  101551:	c3                   	ret    

00101552 <serialIdle>:
  101552:	55                   	push   %ebp
  101553:	89 e5                	mov    %esp,%ebp
  101555:	68 fd 03 00 00       	push   $0x3fd
  10155a:	e8 4c ff ff ff       	call   1014ab <inByte>
  10155f:	83 c4 04             	add    $0x4,%esp
  101562:	0f b6 c0             	movzbl %al,%eax
  101565:	83 e0 20             	and    $0x20,%eax
  101568:	85 c0                	test   %eax,%eax
  10156a:	0f 95 c0             	setne  %al
  10156d:	0f b6 c0             	movzbl %al,%eax
  101570:	c9                   	leave  
  101571:	c3                   	ret    

00101572 <putChar>:
  101572:	55                   	push   %ebp
  101573:	89 e5                	mov    %esp,%ebp
  101575:	83 ec 04             	sub    $0x4,%esp
  101578:	8b 45 08             	mov    0x8(%ebp),%eax
  10157b:	88 45 fc             	mov    %al,-0x4(%ebp)
  10157e:	90                   	nop
  10157f:	e8 ce ff ff ff       	call   101552 <serialIdle>
  101584:	83 f8 01             	cmp    $0x1,%eax
  101587:	75 f6                	jne    10157f <putChar+0xd>
  101589:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
  10158d:	50                   	push   %eax
  10158e:	68 f8 03 00 00       	push   $0x3f8
  101593:	e8 2e ff ff ff       	call   1014c6 <outByte>
  101598:	83 c4 08             	add    $0x8,%esp
  10159b:	90                   	nop
  10159c:	c9                   	leave  
  10159d:	c3                   	ret    

0010159e <waitForInterrupt>:
  10159e:	55                   	push   %ebp
  10159f:	89 e5                	mov    %esp,%ebp
  1015a1:	f4                   	hlt    
  1015a2:	90                   	nop
  1015a3:	5d                   	pop    %ebp
  1015a4:	c3                   	ret    

001015a5 <IDLE>:
  1015a5:	55                   	push   %ebp
  1015a6:	89 e5                	mov    %esp,%ebp
  1015a8:	e8 f1 ff ff ff       	call   10159e <waitForInterrupt>
  1015ad:	eb f9                	jmp    1015a8 <IDLE+0x3>

001015af <put_into_running>:
  1015af:	55                   	push   %ebp
  1015b0:	89 e5                	mov    %esp,%ebp
  1015b2:	83 ec 08             	sub    $0x8,%esp
  1015b5:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  1015ba:	39 45 08             	cmp    %eax,0x8(%ebp)
  1015bd:	75 07                	jne    1015c6 <put_into_running+0x17>
  1015bf:	b8 01 00 00 00       	mov    $0x1,%eax
  1015c4:	eb 3e                	jmp    101604 <put_into_running+0x55>
  1015c6:	8b 45 08             	mov    0x8(%ebp),%eax
  1015c9:	a3 e0 4a 10 00       	mov    %eax,0x104ae0
  1015ce:	e8 71 00 00 00       	call   101644 <getpid>
  1015d3:	89 c2                	mov    %eax,%edx
  1015d5:	89 d0                	mov    %edx,%eax
  1015d7:	c1 e0 07             	shl    $0x7,%eax
  1015da:	01 d0                	add    %edx,%eax
  1015dc:	01 c0                	add    %eax,%eax
  1015de:	01 d0                	add    %edx,%eax
  1015e0:	01 c0                	add    %eax,%eax
  1015e2:	01 d0                	add    %edx,%eax
  1015e4:	c1 e0 04             	shl    $0x4,%eax
  1015e7:	05 fc 1f 00 00       	add    $0x1ffc,%eax
  1015ec:	05 00 4b 10 00       	add    $0x104b00,%eax
  1015f1:	83 ec 08             	sub    $0x8,%esp
  1015f4:	50                   	push   %eax
  1015f5:	6a 10                	push   $0x10
  1015f7:	e8 36 ee ff ff       	call   100432 <change_tss>
  1015fc:	83 c4 10             	add    $0x10,%esp
  1015ff:	b8 01 00 00 00       	mov    $0x1,%eax
  101604:	c9                   	leave  
  101605:	c3                   	ret    

00101606 <apply_new_pid>:
  101606:	55                   	push   %ebp
  101607:	89 e5                	mov    %esp,%ebp
  101609:	83 ec 18             	sub    $0x18,%esp
  10160c:	8b 15 58 42 10 00    	mov    0x104258,%edx
  101612:	a1 58 42 10 00       	mov    0x104258,%eax
  101617:	83 ec 08             	sub    $0x8,%esp
  10161a:	52                   	push   %edx
  10161b:	50                   	push   %eax
  10161c:	e8 21 04 00 00       	call   101a42 <get_from>
  101621:	83 c4 10             	add    $0x10,%esp
  101624:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101627:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10162a:	c9                   	leave  
  10162b:	c3                   	ret    

0010162c <put_into_empty>:
  10162c:	55                   	push   %ebp
  10162d:	89 e5                	mov    %esp,%ebp
  10162f:	83 ec 08             	sub    $0x8,%esp
  101632:	83 ec 08             	sub    $0x8,%esp
  101635:	ff 75 08             	pushl  0x8(%ebp)
  101638:	6a 03                	push   $0x3
  10163a:	e8 fa 01 00 00       	call   101839 <put_into>
  10163f:	83 c4 10             	add    $0x10,%esp
  101642:	c9                   	leave  
  101643:	c3                   	ret    

00101644 <getpid>:
  101644:	55                   	push   %ebp
  101645:	89 e5                	mov    %esp,%ebp
  101647:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  10164c:	5d                   	pop    %ebp
  10164d:	c3                   	ret    

0010164e <getrunnable>:
  10164e:	55                   	push   %ebp
  10164f:	89 e5                	mov    %esp,%ebp
  101651:	a1 38 41 10 00       	mov    0x104138,%eax
  101656:	5d                   	pop    %ebp
  101657:	c3                   	ret    

00101658 <getblocked>:
  101658:	55                   	push   %ebp
  101659:	89 e5                	mov    %esp,%ebp
  10165b:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101660:	5d                   	pop    %ebp
  101661:	c3                   	ret    

00101662 <get_from_runnable>:
  101662:	55                   	push   %ebp
  101663:	89 e5                	mov    %esp,%ebp
  101665:	83 ec 08             	sub    $0x8,%esp
  101668:	8b 15 38 41 10 00    	mov    0x104138,%edx
  10166e:	a1 38 41 10 00       	mov    0x104138,%eax
  101673:	83 ec 08             	sub    $0x8,%esp
  101676:	52                   	push   %edx
  101677:	50                   	push   %eax
  101678:	e8 c5 03 00 00       	call   101a42 <get_from>
  10167d:	83 c4 10             	add    $0x10,%esp
  101680:	c9                   	leave  
  101681:	c3                   	ret    

00101682 <put_into_runnable>:
  101682:	55                   	push   %ebp
  101683:	89 e5                	mov    %esp,%ebp
  101685:	57                   	push   %edi
  101686:	56                   	push   %esi
  101687:	53                   	push   %ebx
  101688:	83 ec 0c             	sub    $0xc,%esp
  10168b:	8b 55 08             	mov    0x8(%ebp),%edx
  10168e:	89 d0                	mov    %edx,%eax
  101690:	c1 e0 07             	shl    $0x7,%eax
  101693:	01 d0                	add    %edx,%eax
  101695:	01 c0                	add    %eax,%eax
  101697:	01 d0                	add    %edx,%eax
  101699:	01 c0                	add    %eax,%eax
  10169b:	01 d0                	add    %edx,%eax
  10169d:	c1 e0 04             	shl    $0x4,%eax
  1016a0:	8d 90 00 6b 10 00    	lea    0x106b00(%eax),%edx
  1016a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1016a9:	89 c3                	mov    %eax,%ebx
  1016ab:	b8 13 00 00 00       	mov    $0x13,%eax
  1016b0:	89 d7                	mov    %edx,%edi
  1016b2:	89 de                	mov    %ebx,%esi
  1016b4:	89 c1                	mov    %eax,%ecx
  1016b6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1016b8:	8b 0d e8 4a 10 00    	mov    0x104ae8,%ecx
  1016be:	8b 55 08             	mov    0x8(%ebp),%edx
  1016c1:	89 d0                	mov    %edx,%eax
  1016c3:	c1 e0 07             	shl    $0x7,%eax
  1016c6:	01 d0                	add    %edx,%eax
  1016c8:	01 c0                	add    %eax,%eax
  1016ca:	01 d0                	add    %edx,%eax
  1016cc:	01 c0                	add    %eax,%eax
  1016ce:	01 d0                	add    %edx,%eax
  1016d0:	c1 e0 04             	shl    $0x4,%eax
  1016d3:	05 50 6b 10 00       	add    $0x106b50,%eax
  1016d8:	89 08                	mov    %ecx,(%eax)
  1016da:	8b 55 08             	mov    0x8(%ebp),%edx
  1016dd:	89 d0                	mov    %edx,%eax
  1016df:	c1 e0 07             	shl    $0x7,%eax
  1016e2:	01 d0                	add    %edx,%eax
  1016e4:	01 c0                	add    %eax,%eax
  1016e6:	01 d0                	add    %edx,%eax
  1016e8:	01 c0                	add    %eax,%eax
  1016ea:	01 d0                	add    %edx,%eax
  1016ec:	c1 e0 04             	shl    $0x4,%eax
  1016ef:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  1016f4:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  1016fa:	83 ec 08             	sub    $0x8,%esp
  1016fd:	ff 75 08             	pushl  0x8(%ebp)
  101700:	6a 01                	push   $0x1
  101702:	e8 32 01 00 00       	call   101839 <put_into>
  101707:	83 c4 10             	add    $0x10,%esp
  10170a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10170d:	5b                   	pop    %ebx
  10170e:	5e                   	pop    %esi
  10170f:	5f                   	pop    %edi
  101710:	5d                   	pop    %ebp
  101711:	c3                   	ret    

00101712 <check_block>:
  101712:	55                   	push   %ebp
  101713:	89 e5                	mov    %esp,%ebp
  101715:	83 ec 18             	sub    $0x18,%esp
  101718:	a1 3c 41 10 00       	mov    0x10413c,%eax
  10171d:	83 f8 ff             	cmp    $0xffffffff,%eax
  101720:	75 0a                	jne    10172c <check_block+0x1a>
  101722:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101727:	e9 0b 01 00 00       	jmp    101837 <check_block+0x125>
  10172c:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101731:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101734:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  10173b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10173e:	89 d0                	mov    %edx,%eax
  101740:	c1 e0 07             	shl    $0x7,%eax
  101743:	01 d0                	add    %edx,%eax
  101745:	01 c0                	add    %eax,%eax
  101747:	01 d0                	add    %edx,%eax
  101749:	01 c0                	add    %eax,%eax
  10174b:	01 d0                	add    %edx,%eax
  10174d:	c1 e0 04             	shl    $0x4,%eax
  101750:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  101755:	8b 00                	mov    (%eax),%eax
  101757:	85 c0                	test   %eax,%eax
  101759:	0f 85 9c 00 00 00    	jne    1017fb <check_block+0xe9>
  10175f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101762:	89 d0                	mov    %edx,%eax
  101764:	c1 e0 07             	shl    $0x7,%eax
  101767:	01 d0                	add    %edx,%eax
  101769:	01 c0                	add    %eax,%eax
  10176b:	01 d0                	add    %edx,%eax
  10176d:	01 c0                	add    %eax,%eax
  10176f:	01 d0                	add    %edx,%eax
  101771:	c1 e0 04             	shl    $0x4,%eax
  101774:	05 54 6b 10 00       	add    $0x106b54,%eax
  101779:	8b 00                	mov    (%eax),%eax
  10177b:	85 c0                	test   %eax,%eax
  10177d:	7f 7c                	jg     1017fb <check_block+0xe9>
  10177f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101782:	89 d0                	mov    %edx,%eax
  101784:	c1 e0 07             	shl    $0x7,%eax
  101787:	01 d0                	add    %edx,%eax
  101789:	01 c0                	add    %eax,%eax
  10178b:	01 d0                	add    %edx,%eax
  10178d:	01 c0                	add    %eax,%eax
  10178f:	01 d0                	add    %edx,%eax
  101791:	c1 e0 04             	shl    $0x4,%eax
  101794:	05 60 6b 10 00       	add    $0x106b60,%eax
  101799:	8b 00                	mov    (%eax),%eax
  10179b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10179e:	83 ec 0c             	sub    $0xc,%esp
  1017a1:	ff 75 f4             	pushl  -0xc(%ebp)
  1017a4:	e8 6b 04 00 00       	call   101c14 <get_from_block>
  1017a9:	83 c4 10             	add    $0x10,%esp
  1017ac:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1017af:	89 d0                	mov    %edx,%eax
  1017b1:	c1 e0 07             	shl    $0x7,%eax
  1017b4:	01 d0                	add    %edx,%eax
  1017b6:	01 c0                	add    %eax,%eax
  1017b8:	01 d0                	add    %edx,%eax
  1017ba:	01 c0                	add    %eax,%eax
  1017bc:	01 d0                	add    %edx,%eax
  1017be:	c1 e0 04             	shl    $0x4,%eax
  1017c1:	05 00 20 00 00       	add    $0x2000,%eax
  1017c6:	05 00 4b 10 00       	add    $0x104b00,%eax
  1017cb:	83 ec 08             	sub    $0x8,%esp
  1017ce:	50                   	push   %eax
  1017cf:	ff 75 f4             	pushl  -0xc(%ebp)
  1017d2:	e8 ab fe ff ff       	call   101682 <put_into_runnable>
  1017d7:	83 c4 10             	add    $0x10,%esp
  1017da:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1017dd:	89 d0                	mov    %edx,%eax
  1017df:	c1 e0 07             	shl    $0x7,%eax
  1017e2:	01 d0                	add    %edx,%eax
  1017e4:	01 c0                	add    %eax,%eax
  1017e6:	01 d0                	add    %edx,%eax
  1017e8:	01 c0                	add    %eax,%eax
  1017ea:	01 d0                	add    %edx,%eax
  1017ec:	c1 e0 04             	shl    $0x4,%eax
  1017ef:	05 60 6b 10 00       	add    $0x106b60,%eax
  1017f4:	8b 00                	mov    (%eax),%eax
  1017f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1017f9:	eb 1f                	jmp    10181a <check_block+0x108>
  1017fb:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1017fe:	89 d0                	mov    %edx,%eax
  101800:	c1 e0 07             	shl    $0x7,%eax
  101803:	01 d0                	add    %edx,%eax
  101805:	01 c0                	add    %eax,%eax
  101807:	01 d0                	add    %edx,%eax
  101809:	01 c0                	add    %eax,%eax
  10180b:	01 d0                	add    %edx,%eax
  10180d:	c1 e0 04             	shl    $0x4,%eax
  101810:	05 60 6b 10 00       	add    $0x106b60,%eax
  101815:	8b 00                	mov    (%eax),%eax
  101817:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10181a:	a1 3c 41 10 00       	mov    0x10413c,%eax
  10181f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  101822:	74 0e                	je     101832 <check_block+0x120>
  101824:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101829:	83 f8 ff             	cmp    $0xffffffff,%eax
  10182c:	0f 85 09 ff ff ff    	jne    10173b <check_block+0x29>
  101832:	b8 01 00 00 00       	mov    $0x1,%eax
  101837:	c9                   	leave  
  101838:	c3                   	ret    

00101839 <put_into>:
  101839:	55                   	push   %ebp
  10183a:	89 e5                	mov    %esp,%ebp
  10183c:	83 ec 18             	sub    $0x18,%esp
  10183f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101846:	8b 45 08             	mov    0x8(%ebp),%eax
  101849:	83 f8 01             	cmp    $0x1,%eax
  10184c:	74 14                	je     101862 <put_into+0x29>
  10184e:	83 f8 03             	cmp    $0x3,%eax
  101851:	74 06                	je     101859 <put_into+0x20>
  101853:	85 c0                	test   %eax,%eax
  101855:	74 14                	je     10186b <put_into+0x32>
  101857:	eb 1b                	jmp    101874 <put_into+0x3b>
  101859:	c7 45 f4 58 42 10 00 	movl   $0x104258,-0xc(%ebp)
  101860:	eb 2e                	jmp    101890 <put_into+0x57>
  101862:	c7 45 f4 38 41 10 00 	movl   $0x104138,-0xc(%ebp)
  101869:	eb 25                	jmp    101890 <put_into+0x57>
  10186b:	c7 45 f4 3c 41 10 00 	movl   $0x10413c,-0xc(%ebp)
  101872:	eb 1c                	jmp    101890 <put_into+0x57>
  101874:	83 ec 08             	sub    $0x8,%esp
  101877:	6a 62                	push   $0x62
  101879:	68 88 2e 10 00       	push   $0x102e88
  10187e:	e8 fc 14 00 00       	call   102d7f <abort>
  101883:	83 c4 10             	add    $0x10,%esp
  101886:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10188b:	e9 1e 01 00 00       	jmp    1019ae <put_into+0x175>
  101890:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101893:	8b 00                	mov    (%eax),%eax
  101895:	83 f8 ff             	cmp    $0xffffffff,%eax
  101898:	75 57                	jne    1018f1 <put_into+0xb8>
  10189a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10189d:	8b 55 0c             	mov    0xc(%ebp),%edx
  1018a0:	89 10                	mov    %edx,(%eax)
  1018a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018a5:	8b 10                	mov    (%eax),%edx
  1018a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018aa:	8b 00                	mov    (%eax),%eax
  1018ac:	89 c1                	mov    %eax,%ecx
  1018ae:	89 d0                	mov    %edx,%eax
  1018b0:	c1 e0 07             	shl    $0x7,%eax
  1018b3:	01 d0                	add    %edx,%eax
  1018b5:	01 c0                	add    %eax,%eax
  1018b7:	01 d0                	add    %edx,%eax
  1018b9:	01 c0                	add    %eax,%eax
  1018bb:	01 d0                	add    %edx,%eax
  1018bd:	c1 e0 04             	shl    $0x4,%eax
  1018c0:	05 60 6b 10 00       	add    $0x106b60,%eax
  1018c5:	89 08                	mov    %ecx,(%eax)
  1018c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018ca:	8b 10                	mov    (%eax),%edx
  1018cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018cf:	8b 00                	mov    (%eax),%eax
  1018d1:	89 c1                	mov    %eax,%ecx
  1018d3:	89 d0                	mov    %edx,%eax
  1018d5:	c1 e0 07             	shl    $0x7,%eax
  1018d8:	01 d0                	add    %edx,%eax
  1018da:	01 c0                	add    %eax,%eax
  1018dc:	01 d0                	add    %edx,%eax
  1018de:	01 c0                	add    %eax,%eax
  1018e0:	01 d0                	add    %edx,%eax
  1018e2:	c1 e0 04             	shl    $0x4,%eax
  1018e5:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  1018ea:	89 08                	mov    %ecx,(%eax)
  1018ec:	e9 b8 00 00 00       	jmp    1019a9 <put_into+0x170>
  1018f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018f4:	8b 10                	mov    (%eax),%edx
  1018f6:	89 d0                	mov    %edx,%eax
  1018f8:	c1 e0 07             	shl    $0x7,%eax
  1018fb:	01 d0                	add    %edx,%eax
  1018fd:	01 c0                	add    %eax,%eax
  1018ff:	01 d0                	add    %edx,%eax
  101901:	01 c0                	add    %eax,%eax
  101903:	01 d0                	add    %edx,%eax
  101905:	c1 e0 04             	shl    $0x4,%eax
  101908:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  10190d:	8b 10                	mov    (%eax),%edx
  10190f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  101912:	89 d0                	mov    %edx,%eax
  101914:	c1 e0 07             	shl    $0x7,%eax
  101917:	01 d0                	add    %edx,%eax
  101919:	01 c0                	add    %eax,%eax
  10191b:	01 d0                	add    %edx,%eax
  10191d:	01 c0                	add    %eax,%eax
  10191f:	01 d0                	add    %edx,%eax
  101921:	c1 e0 04             	shl    $0x4,%eax
  101924:	05 60 6b 10 00       	add    $0x106b60,%eax
  101929:	89 08                	mov    %ecx,(%eax)
  10192b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10192e:	8b 10                	mov    (%eax),%edx
  101930:	89 d0                	mov    %edx,%eax
  101932:	c1 e0 07             	shl    $0x7,%eax
  101935:	01 d0                	add    %edx,%eax
  101937:	01 c0                	add    %eax,%eax
  101939:	01 d0                	add    %edx,%eax
  10193b:	01 c0                	add    %eax,%eax
  10193d:	01 d0                	add    %edx,%eax
  10193f:	c1 e0 04             	shl    $0x4,%eax
  101942:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  101947:	8b 08                	mov    (%eax),%ecx
  101949:	8b 55 0c             	mov    0xc(%ebp),%edx
  10194c:	89 d0                	mov    %edx,%eax
  10194e:	c1 e0 07             	shl    $0x7,%eax
  101951:	01 d0                	add    %edx,%eax
  101953:	01 c0                	add    %eax,%eax
  101955:	01 d0                	add    %edx,%eax
  101957:	01 c0                	add    %eax,%eax
  101959:	01 d0                	add    %edx,%eax
  10195b:	c1 e0 04             	shl    $0x4,%eax
  10195e:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  101963:	89 08                	mov    %ecx,(%eax)
  101965:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101968:	8b 00                	mov    (%eax),%eax
  10196a:	89 c1                	mov    %eax,%ecx
  10196c:	8b 55 0c             	mov    0xc(%ebp),%edx
  10196f:	89 d0                	mov    %edx,%eax
  101971:	c1 e0 07             	shl    $0x7,%eax
  101974:	01 d0                	add    %edx,%eax
  101976:	01 c0                	add    %eax,%eax
  101978:	01 d0                	add    %edx,%eax
  10197a:	01 c0                	add    %eax,%eax
  10197c:	01 d0                	add    %edx,%eax
  10197e:	c1 e0 04             	shl    $0x4,%eax
  101981:	05 60 6b 10 00       	add    $0x106b60,%eax
  101986:	89 08                	mov    %ecx,(%eax)
  101988:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10198b:	8b 10                	mov    (%eax),%edx
  10198d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  101990:	89 d0                	mov    %edx,%eax
  101992:	c1 e0 07             	shl    $0x7,%eax
  101995:	01 d0                	add    %edx,%eax
  101997:	01 c0                	add    %eax,%eax
  101999:	01 d0                	add    %edx,%eax
  10199b:	01 c0                	add    %eax,%eax
  10199d:	01 d0                	add    %edx,%eax
  10199f:	c1 e0 04             	shl    $0x4,%eax
  1019a2:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  1019a7:	89 08                	mov    %ecx,(%eax)
  1019a9:	b8 01 00 00 00       	mov    $0x1,%eax
  1019ae:	c9                   	leave  
  1019af:	c3                   	ret    

001019b0 <put_into_block>:
  1019b0:	55                   	push   %ebp
  1019b1:	89 e5                	mov    %esp,%ebp
  1019b3:	57                   	push   %edi
  1019b4:	56                   	push   %esi
  1019b5:	53                   	push   %ebx
  1019b6:	83 ec 0c             	sub    $0xc,%esp
  1019b9:	8b 55 08             	mov    0x8(%ebp),%edx
  1019bc:	89 d0                	mov    %edx,%eax
  1019be:	c1 e0 07             	shl    $0x7,%eax
  1019c1:	01 d0                	add    %edx,%eax
  1019c3:	01 c0                	add    %eax,%eax
  1019c5:	01 d0                	add    %edx,%eax
  1019c7:	01 c0                	add    %eax,%eax
  1019c9:	01 d0                	add    %edx,%eax
  1019cb:	c1 e0 04             	shl    $0x4,%eax
  1019ce:	8d 90 00 6b 10 00    	lea    0x106b00(%eax),%edx
  1019d4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1019d7:	89 c3                	mov    %eax,%ebx
  1019d9:	b8 13 00 00 00       	mov    $0x13,%eax
  1019de:	89 d7                	mov    %edx,%edi
  1019e0:	89 de                	mov    %ebx,%esi
  1019e2:	89 c1                	mov    %eax,%ecx
  1019e4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1019e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1019e9:	8b 40 20             	mov    0x20(%eax),%eax
  1019ec:	89 c1                	mov    %eax,%ecx
  1019ee:	8b 55 08             	mov    0x8(%ebp),%edx
  1019f1:	89 d0                	mov    %edx,%eax
  1019f3:	c1 e0 07             	shl    $0x7,%eax
  1019f6:	01 d0                	add    %edx,%eax
  1019f8:	01 c0                	add    %eax,%eax
  1019fa:	01 d0                	add    %edx,%eax
  1019fc:	01 c0                	add    %eax,%eax
  1019fe:	01 d0                	add    %edx,%eax
  101a00:	c1 e0 04             	shl    $0x4,%eax
  101a03:	05 54 6b 10 00       	add    $0x106b54,%eax
  101a08:	89 08                	mov    %ecx,(%eax)
  101a0a:	8b 55 08             	mov    0x8(%ebp),%edx
  101a0d:	89 d0                	mov    %edx,%eax
  101a0f:	c1 e0 07             	shl    $0x7,%eax
  101a12:	01 d0                	add    %edx,%eax
  101a14:	01 c0                	add    %eax,%eax
  101a16:	01 d0                	add    %edx,%eax
  101a18:	01 c0                	add    %eax,%eax
  101a1a:	01 d0                	add    %edx,%eax
  101a1c:	c1 e0 04             	shl    $0x4,%eax
  101a1f:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  101a24:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  101a2a:	83 ec 08             	sub    $0x8,%esp
  101a2d:	ff 75 08             	pushl  0x8(%ebp)
  101a30:	6a 00                	push   $0x0
  101a32:	e8 02 fe ff ff       	call   101839 <put_into>
  101a37:	83 c4 10             	add    $0x10,%esp
  101a3a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101a3d:	5b                   	pop    %ebx
  101a3e:	5e                   	pop    %esi
  101a3f:	5f                   	pop    %edi
  101a40:	5d                   	pop    %ebp
  101a41:	c3                   	ret    

00101a42 <get_from>:
  101a42:	55                   	push   %ebp
  101a43:	89 e5                	mov    %esp,%ebp
  101a45:	83 ec 18             	sub    $0x18,%esp
  101a48:	83 ec 08             	sub    $0x8,%esp
  101a4b:	ff 75 0c             	pushl  0xc(%ebp)
  101a4e:	ff 75 08             	pushl  0x8(%ebp)
  101a51:	e8 f9 01 00 00       	call   101c4f <check_is_in>
  101a56:	83 c4 10             	add    $0x10,%esp
  101a59:	83 f8 01             	cmp    $0x1,%eax
  101a5c:	74 64                	je     101ac2 <get_from+0x80>
  101a5e:	83 ec 0c             	sub    $0xc,%esp
  101a61:	68 96 2e 10 00       	push   $0x102e96
  101a66:	e8 58 10 00 00       	call   102ac3 <printk>
  101a6b:	83 c4 10             	add    $0x10,%esp
  101a6e:	83 ec 08             	sub    $0x8,%esp
  101a71:	ff 75 0c             	pushl  0xc(%ebp)
  101a74:	ff 75 08             	pushl  0x8(%ebp)
  101a77:	68 c8 2e 10 00       	push   $0x102ec8
  101a7c:	68 82 00 00 00       	push   $0x82
  101a81:	68 88 2e 10 00       	push   $0x102e88
  101a86:	68 9c 2e 10 00       	push   $0x102e9c
  101a8b:	e8 33 10 00 00       	call   102ac3 <printk>
  101a90:	83 c4 20             	add    $0x20,%esp
  101a93:	83 ec 0c             	sub    $0xc,%esp
  101a96:	68 c0 2e 10 00       	push   $0x102ec0
  101a9b:	e8 23 10 00 00       	call   102ac3 <printk>
  101aa0:	83 c4 10             	add    $0x10,%esp
  101aa3:	83 ec 08             	sub    $0x8,%esp
  101aa6:	68 83 00 00 00       	push   $0x83
  101aab:	68 88 2e 10 00       	push   $0x102e88
  101ab0:	e8 ca 12 00 00       	call   102d7f <abort>
  101ab5:	83 c4 10             	add    $0x10,%esp
  101ab8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101abd:	e9 50 01 00 00       	jmp    101c12 <get_from+0x1d0>
  101ac2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101ac9:	8b 55 0c             	mov    0xc(%ebp),%edx
  101acc:	89 d0                	mov    %edx,%eax
  101ace:	c1 e0 07             	shl    $0x7,%eax
  101ad1:	01 d0                	add    %edx,%eax
  101ad3:	01 c0                	add    %eax,%eax
  101ad5:	01 d0                	add    %edx,%eax
  101ad7:	01 c0                	add    %eax,%eax
  101ad9:	01 d0                	add    %edx,%eax
  101adb:	c1 e0 04             	shl    $0x4,%eax
  101ade:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  101ae3:	8b 00                	mov    (%eax),%eax
  101ae5:	83 f8 01             	cmp    $0x1,%eax
  101ae8:	74 14                	je     101afe <get_from+0xbc>
  101aea:	83 f8 03             	cmp    $0x3,%eax
  101aed:	74 06                	je     101af5 <get_from+0xb3>
  101aef:	85 c0                	test   %eax,%eax
  101af1:	74 14                	je     101b07 <get_from+0xc5>
  101af3:	eb 1b                	jmp    101b10 <get_from+0xce>
  101af5:	c7 45 f4 58 42 10 00 	movl   $0x104258,-0xc(%ebp)
  101afc:	eb 27                	jmp    101b25 <get_from+0xe3>
  101afe:	c7 45 f4 38 41 10 00 	movl   $0x104138,-0xc(%ebp)
  101b05:	eb 1e                	jmp    101b25 <get_from+0xe3>
  101b07:	c7 45 f4 3c 41 10 00 	movl   $0x10413c,-0xc(%ebp)
  101b0e:	eb 15                	jmp    101b25 <get_from+0xe3>
  101b10:	83 ec 08             	sub    $0x8,%esp
  101b13:	68 95 00 00 00       	push   $0x95
  101b18:	68 88 2e 10 00       	push   $0x102e88
  101b1d:	e8 5d 12 00 00       	call   102d7f <abort>
  101b22:	83 c4 10             	add    $0x10,%esp
  101b25:	8b 45 08             	mov    0x8(%ebp),%eax
  101b28:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101b2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b2e:	8b 00                	mov    (%eax),%eax
  101b30:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  101b33:	74 15                	je     101b4a <get_from+0x108>
  101b35:	83 ec 08             	sub    $0x8,%esp
  101b38:	68 9a 00 00 00       	push   $0x9a
  101b3d:	68 88 2e 10 00       	push   $0x102e88
  101b42:	e8 38 12 00 00       	call   102d7f <abort>
  101b47:	83 c4 10             	add    $0x10,%esp
  101b4a:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  101b4e:	75 0a                	jne    101b5a <get_from+0x118>
  101b50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101b55:	e9 b8 00 00 00       	jmp    101c12 <get_from+0x1d0>
  101b5a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101b5d:	89 d0                	mov    %edx,%eax
  101b5f:	c1 e0 07             	shl    $0x7,%eax
  101b62:	01 d0                	add    %edx,%eax
  101b64:	01 c0                	add    %eax,%eax
  101b66:	01 d0                	add    %edx,%eax
  101b68:	01 c0                	add    %eax,%eax
  101b6a:	01 d0                	add    %edx,%eax
  101b6c:	c1 e0 04             	shl    $0x4,%eax
  101b6f:	05 60 6b 10 00       	add    $0x106b60,%eax
  101b74:	8b 10                	mov    (%eax),%edx
  101b76:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101b79:	39 c2                	cmp    %eax,%edx
  101b7b:	75 0e                	jne    101b8b <get_from+0x149>
  101b7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b80:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
  101b86:	e9 84 00 00 00       	jmp    101c0f <get_from+0x1cd>
  101b8b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101b8e:	89 d0                	mov    %edx,%eax
  101b90:	c1 e0 07             	shl    $0x7,%eax
  101b93:	01 d0                	add    %edx,%eax
  101b95:	01 c0                	add    %eax,%eax
  101b97:	01 d0                	add    %edx,%eax
  101b99:	01 c0                	add    %eax,%eax
  101b9b:	01 d0                	add    %edx,%eax
  101b9d:	c1 e0 04             	shl    $0x4,%eax
  101ba0:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  101ba5:	8b 00                	mov    (%eax),%eax
  101ba7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  101baa:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101bad:	89 d0                	mov    %edx,%eax
  101baf:	c1 e0 07             	shl    $0x7,%eax
  101bb2:	01 d0                	add    %edx,%eax
  101bb4:	01 c0                	add    %eax,%eax
  101bb6:	01 d0                	add    %edx,%eax
  101bb8:	01 c0                	add    %eax,%eax
  101bba:	01 d0                	add    %edx,%eax
  101bbc:	c1 e0 04             	shl    $0x4,%eax
  101bbf:	05 60 6b 10 00       	add    $0x106b60,%eax
  101bc4:	8b 00                	mov    (%eax),%eax
  101bc6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  101bc9:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  101bcc:	8b 55 ec             	mov    -0x14(%ebp),%edx
  101bcf:	89 d0                	mov    %edx,%eax
  101bd1:	c1 e0 07             	shl    $0x7,%eax
  101bd4:	01 d0                	add    %edx,%eax
  101bd6:	01 c0                	add    %eax,%eax
  101bd8:	01 d0                	add    %edx,%eax
  101bda:	01 c0                	add    %eax,%eax
  101bdc:	01 d0                	add    %edx,%eax
  101bde:	c1 e0 04             	shl    $0x4,%eax
  101be1:	05 60 6b 10 00       	add    $0x106b60,%eax
  101be6:	89 08                	mov    %ecx,(%eax)
  101be8:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  101beb:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101bee:	89 d0                	mov    %edx,%eax
  101bf0:	c1 e0 07             	shl    $0x7,%eax
  101bf3:	01 d0                	add    %edx,%eax
  101bf5:	01 c0                	add    %eax,%eax
  101bf7:	01 d0                	add    %edx,%eax
  101bf9:	01 c0                	add    %eax,%eax
  101bfb:	01 d0                	add    %edx,%eax
  101bfd:	c1 e0 04             	shl    $0x4,%eax
  101c00:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  101c05:	89 08                	mov    %ecx,(%eax)
  101c07:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c0a:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101c0d:	89 10                	mov    %edx,(%eax)
  101c0f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101c12:	c9                   	leave  
  101c13:	c3                   	ret    

00101c14 <get_from_block>:
  101c14:	55                   	push   %ebp
  101c15:	89 e5                	mov    %esp,%ebp
  101c17:	83 ec 08             	sub    $0x8,%esp
  101c1a:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101c1f:	83 ec 08             	sub    $0x8,%esp
  101c22:	ff 75 08             	pushl  0x8(%ebp)
  101c25:	50                   	push   %eax
  101c26:	e8 17 fe ff ff       	call   101a42 <get_from>
  101c2b:	83 c4 10             	add    $0x10,%esp
  101c2e:	83 f8 ff             	cmp    $0xffffffff,%eax
  101c31:	75 15                	jne    101c48 <get_from_block+0x34>
  101c33:	83 ec 08             	sub    $0x8,%esp
  101c36:	68 b1 00 00 00       	push   $0xb1
  101c3b:	68 88 2e 10 00       	push   $0x102e88
  101c40:	e8 3a 11 00 00       	call   102d7f <abort>
  101c45:	83 c4 10             	add    $0x10,%esp
  101c48:	b8 01 00 00 00       	mov    $0x1,%eax
  101c4d:	c9                   	leave  
  101c4e:	c3                   	ret    

00101c4f <check_is_in>:
  101c4f:	55                   	push   %ebp
  101c50:	89 e5                	mov    %esp,%ebp
  101c52:	83 ec 10             	sub    $0x10,%esp
  101c55:	8b 45 08             	mov    0x8(%ebp),%eax
  101c58:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101c5b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101c5e:	3b 45 0c             	cmp    0xc(%ebp),%eax
  101c61:	75 07                	jne    101c6a <check_is_in+0x1b>
  101c63:	b8 01 00 00 00       	mov    $0x1,%eax
  101c68:	eb 2c                	jmp    101c96 <check_is_in+0x47>
  101c6a:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101c6d:	89 d0                	mov    %edx,%eax
  101c6f:	c1 e0 07             	shl    $0x7,%eax
  101c72:	01 d0                	add    %edx,%eax
  101c74:	01 c0                	add    %eax,%eax
  101c76:	01 d0                	add    %edx,%eax
  101c78:	01 c0                	add    %eax,%eax
  101c7a:	01 d0                	add    %edx,%eax
  101c7c:	c1 e0 04             	shl    $0x4,%eax
  101c7f:	05 60 6b 10 00       	add    $0x106b60,%eax
  101c84:	8b 00                	mov    (%eax),%eax
  101c86:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101c89:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101c8c:	3b 45 08             	cmp    0x8(%ebp),%eax
  101c8f:	75 ca                	jne    101c5b <check_is_in+0xc>
  101c91:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101c96:	c9                   	leave  
  101c97:	c3                   	ret    

00101c98 <block_decrease>:
  101c98:	55                   	push   %ebp
  101c99:	89 e5                	mov    %esp,%ebp
  101c9b:	83 ec 10             	sub    $0x10,%esp
  101c9e:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101ca3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101ca6:	83 7d fc ff          	cmpl   $0xffffffff,-0x4(%ebp)
  101caa:	75 07                	jne    101cb3 <block_decrease+0x1b>
  101cac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101cb1:	eb 69                	jmp    101d1c <block_decrease+0x84>
  101cb3:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101cb6:	89 d0                	mov    %edx,%eax
  101cb8:	c1 e0 07             	shl    $0x7,%eax
  101cbb:	01 d0                	add    %edx,%eax
  101cbd:	01 c0                	add    %eax,%eax
  101cbf:	01 d0                	add    %edx,%eax
  101cc1:	01 c0                	add    %eax,%eax
  101cc3:	01 d0                	add    %edx,%eax
  101cc5:	c1 e0 04             	shl    $0x4,%eax
  101cc8:	05 54 6b 10 00       	add    $0x106b54,%eax
  101ccd:	8b 00                	mov    (%eax),%eax
  101ccf:	8d 48 ff             	lea    -0x1(%eax),%ecx
  101cd2:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101cd5:	89 d0                	mov    %edx,%eax
  101cd7:	c1 e0 07             	shl    $0x7,%eax
  101cda:	01 d0                	add    %edx,%eax
  101cdc:	01 c0                	add    %eax,%eax
  101cde:	01 d0                	add    %edx,%eax
  101ce0:	01 c0                	add    %eax,%eax
  101ce2:	01 d0                	add    %edx,%eax
  101ce4:	c1 e0 04             	shl    $0x4,%eax
  101ce7:	05 54 6b 10 00       	add    $0x106b54,%eax
  101cec:	89 08                	mov    %ecx,(%eax)
  101cee:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101cf1:	89 d0                	mov    %edx,%eax
  101cf3:	c1 e0 07             	shl    $0x7,%eax
  101cf6:	01 d0                	add    %edx,%eax
  101cf8:	01 c0                	add    %eax,%eax
  101cfa:	01 d0                	add    %edx,%eax
  101cfc:	01 c0                	add    %eax,%eax
  101cfe:	01 d0                	add    %edx,%eax
  101d00:	c1 e0 04             	shl    $0x4,%eax
  101d03:	05 60 6b 10 00       	add    $0x106b60,%eax
  101d08:	8b 00                	mov    (%eax),%eax
  101d0a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101d0d:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101d12:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  101d15:	75 9c                	jne    101cb3 <block_decrease+0x1b>
  101d17:	b8 01 00 00 00       	mov    $0x1,%eax
  101d1c:	c9                   	leave  
  101d1d:	c3                   	ret    

00101d1e <init_pcb>:
  101d1e:	55                   	push   %ebp
  101d1f:	89 e5                	mov    %esp,%ebp
  101d21:	83 ec 10             	sub    $0x10,%esp
  101d24:	c7 05 e8 4a 10 00 05 	movl   $0x5,0x104ae8
  101d2b:	00 00 00 
  101d2e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101d35:	e9 86 00 00 00       	jmp    101dc0 <init_pcb+0xa2>
  101d3a:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  101d3d:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101d40:	89 d0                	mov    %edx,%eax
  101d42:	c1 e0 07             	shl    $0x7,%eax
  101d45:	01 d0                	add    %edx,%eax
  101d47:	01 c0                	add    %eax,%eax
  101d49:	01 d0                	add    %edx,%eax
  101d4b:	01 c0                	add    %eax,%eax
  101d4d:	01 d0                	add    %edx,%eax
  101d4f:	c1 e0 04             	shl    $0x4,%eax
  101d52:	05 58 6b 10 00       	add    $0x106b58,%eax
  101d57:	89 08                	mov    %ecx,(%eax)
  101d59:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101d5c:	48                   	dec    %eax
  101d5d:	89 c1                	mov    %eax,%ecx
  101d5f:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101d62:	89 d0                	mov    %edx,%eax
  101d64:	c1 e0 07             	shl    $0x7,%eax
  101d67:	01 d0                	add    %edx,%eax
  101d69:	01 c0                	add    %eax,%eax
  101d6b:	01 d0                	add    %edx,%eax
  101d6d:	01 c0                	add    %eax,%eax
  101d6f:	01 d0                	add    %edx,%eax
  101d71:	c1 e0 04             	shl    $0x4,%eax
  101d74:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  101d79:	89 08                	mov    %ecx,(%eax)
  101d7b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101d7e:	40                   	inc    %eax
  101d7f:	89 c1                	mov    %eax,%ecx
  101d81:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101d84:	89 d0                	mov    %edx,%eax
  101d86:	c1 e0 07             	shl    $0x7,%eax
  101d89:	01 d0                	add    %edx,%eax
  101d8b:	01 c0                	add    %eax,%eax
  101d8d:	01 d0                	add    %edx,%eax
  101d8f:	01 c0                	add    %eax,%eax
  101d91:	01 d0                	add    %edx,%eax
  101d93:	c1 e0 04             	shl    $0x4,%eax
  101d96:	05 60 6b 10 00       	add    $0x106b60,%eax
  101d9b:	89 08                	mov    %ecx,(%eax)
  101d9d:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101da0:	89 d0                	mov    %edx,%eax
  101da2:	c1 e0 07             	shl    $0x7,%eax
  101da5:	01 d0                	add    %edx,%eax
  101da7:	01 c0                	add    %eax,%eax
  101da9:	01 d0                	add    %edx,%eax
  101dab:	01 c0                	add    %eax,%eax
  101dad:	01 d0                	add    %edx,%eax
  101daf:	c1 e0 04             	shl    $0x4,%eax
  101db2:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  101db7:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  101dbd:	ff 45 fc             	incl   -0x4(%ebp)
  101dc0:	81 7d fc ff 07 00 00 	cmpl   $0x7ff,-0x4(%ebp)
  101dc7:	0f 8e 6d ff ff ff    	jle    101d3a <init_pcb+0x1c>
  101dcd:	c7 05 5c 6b 10 00 ff 	movl   $0x7ff,0x106b5c
  101dd4:	07 00 00 
  101dd7:	c7 05 f0 ca 13 01 00 	movl   $0x0,0x113caf0
  101dde:	00 00 00 
  101de1:	90                   	nop
  101de2:	c9                   	leave  
  101de3:	c3                   	ret    

00101de4 <init_kernel_pcb>:
  101de4:	55                   	push   %ebp
  101de5:	89 e5                	mov    %esp,%ebp
  101de7:	83 ec 08             	sub    $0x8,%esp
  101dea:	e8 17 f8 ff ff       	call   101606 <apply_new_pid>
  101def:	85 c0                	test   %eax,%eax
  101df1:	74 15                	je     101e08 <init_kernel_pcb+0x24>
  101df3:	83 ec 08             	sub    $0x8,%esp
  101df6:	68 e4 00 00 00       	push   $0xe4
  101dfb:	68 88 2e 10 00       	push   $0x102e88
  101e00:	e8 7a 0f 00 00       	call   102d7f <abort>
  101e05:	83 c4 10             	add    $0x10,%esp
  101e08:	c7 05 48 6b 10 00 10 	movl   $0x10,0x106b48
  101e0f:	00 00 00 
  101e12:	c7 05 3c 6b 10 00 08 	movl   $0x8,0x106b3c
  101e19:	00 00 00 
  101e1c:	c7 05 0c 6b 10 00 10 	movl   $0x10,0x106b0c
  101e23:	00 00 00 
  101e26:	c7 05 08 6b 10 00 10 	movl   $0x10,0x106b08
  101e2d:	00 00 00 
  101e30:	b8 a5 15 10 00       	mov    $0x1015a5,%eax
  101e35:	a3 38 6b 10 00       	mov    %eax,0x106b38
  101e3a:	c7 05 44 6b 10 00 00 	movl   $0x400000,0x106b44
  101e41:	00 40 00 
  101e44:	c7 05 4c 6b 10 00 01 	movl   $0x1,0x106b4c
  101e4b:	00 00 00 
  101e4e:	c7 05 50 6b 10 00 04 	movl   $0x4,0x106b50
  101e55:	00 00 00 
  101e58:	b8 01 00 00 00       	mov    $0x1,%eax
  101e5d:	c9                   	leave  
  101e5e:	c3                   	ret    

00101e5f <make_pcb>:
  101e5f:	55                   	push   %ebp
  101e60:	89 e5                	mov    %esp,%ebp
  101e62:	57                   	push   %edi
  101e63:	56                   	push   %esi
  101e64:	53                   	push   %ebx
  101e65:	8b 55 08             	mov    0x8(%ebp),%edx
  101e68:	89 d0                	mov    %edx,%eax
  101e6a:	c1 e0 07             	shl    $0x7,%eax
  101e6d:	01 d0                	add    %edx,%eax
  101e6f:	01 c0                	add    %eax,%eax
  101e71:	01 d0                	add    %edx,%eax
  101e73:	01 c0                	add    %eax,%eax
  101e75:	01 d0                	add    %edx,%eax
  101e77:	c1 e0 04             	shl    $0x4,%eax
  101e7a:	8d 90 00 6b 10 00    	lea    0x106b00(%eax),%edx
  101e80:	8b 45 0c             	mov    0xc(%ebp),%eax
  101e83:	89 c3                	mov    %eax,%ebx
  101e85:	b8 13 00 00 00       	mov    $0x13,%eax
  101e8a:	89 d7                	mov    %edx,%edi
  101e8c:	89 de                	mov    %ebx,%esi
  101e8e:	89 c1                	mov    %eax,%ecx
  101e90:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101e92:	8b 4d 10             	mov    0x10(%ebp),%ecx
  101e95:	8b 55 08             	mov    0x8(%ebp),%edx
  101e98:	89 d0                	mov    %edx,%eax
  101e9a:	c1 e0 07             	shl    $0x7,%eax
  101e9d:	01 d0                	add    %edx,%eax
  101e9f:	01 c0                	add    %eax,%eax
  101ea1:	01 d0                	add    %edx,%eax
  101ea3:	01 c0                	add    %eax,%eax
  101ea5:	01 d0                	add    %edx,%eax
  101ea7:	c1 e0 04             	shl    $0x4,%eax
  101eaa:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  101eaf:	89 08                	mov    %ecx,(%eax)
  101eb1:	8b 4d 14             	mov    0x14(%ebp),%ecx
  101eb4:	8b 55 08             	mov    0x8(%ebp),%edx
  101eb7:	89 d0                	mov    %edx,%eax
  101eb9:	c1 e0 07             	shl    $0x7,%eax
  101ebc:	01 d0                	add    %edx,%eax
  101ebe:	01 c0                	add    %eax,%eax
  101ec0:	01 d0                	add    %edx,%eax
  101ec2:	01 c0                	add    %eax,%eax
  101ec4:	01 d0                	add    %edx,%eax
  101ec6:	c1 e0 04             	shl    $0x4,%eax
  101ec9:	05 50 6b 10 00       	add    $0x106b50,%eax
  101ece:	89 08                	mov    %ecx,(%eax)
  101ed0:	8b 4d 18             	mov    0x18(%ebp),%ecx
  101ed3:	8b 55 08             	mov    0x8(%ebp),%edx
  101ed6:	89 d0                	mov    %edx,%eax
  101ed8:	c1 e0 07             	shl    $0x7,%eax
  101edb:	01 d0                	add    %edx,%eax
  101edd:	01 c0                	add    %eax,%eax
  101edf:	01 d0                	add    %edx,%eax
  101ee1:	01 c0                	add    %eax,%eax
  101ee3:	01 d0                	add    %edx,%eax
  101ee5:	c1 e0 04             	shl    $0x4,%eax
  101ee8:	05 54 6b 10 00       	add    $0x106b54,%eax
  101eed:	89 08                	mov    %ecx,(%eax)
  101eef:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  101ef2:	8b 55 08             	mov    0x8(%ebp),%edx
  101ef5:	89 d0                	mov    %edx,%eax
  101ef7:	c1 e0 07             	shl    $0x7,%eax
  101efa:	01 d0                	add    %edx,%eax
  101efc:	01 c0                	add    %eax,%eax
  101efe:	01 d0                	add    %edx,%eax
  101f00:	01 c0                	add    %eax,%eax
  101f02:	01 d0                	add    %edx,%eax
  101f04:	c1 e0 04             	shl    $0x4,%eax
  101f07:	05 6c 6b 10 00       	add    $0x106b6c,%eax
  101f0c:	89 08                	mov    %ecx,(%eax)
  101f0e:	b8 01 00 00 00       	mov    $0x1,%eax
  101f13:	5b                   	pop    %ebx
  101f14:	5e                   	pop    %esi
  101f15:	5f                   	pop    %edi
  101f16:	5d                   	pop    %ebp
  101f17:	c3                   	ret    

00101f18 <saveIdt>:
  101f18:	55                   	push   %ebp
  101f19:	89 e5                	mov    %esp,%ebp
  101f1b:	8b 45 0c             	mov    0xc(%ebp),%eax
  101f1e:	48                   	dec    %eax
  101f1f:	66 a3 5c 42 10 00    	mov    %ax,0x10425c
  101f25:	8b 45 08             	mov    0x8(%ebp),%eax
  101f28:	66 a3 5e 42 10 00    	mov    %ax,0x10425e
  101f2e:	8b 45 08             	mov    0x8(%ebp),%eax
  101f31:	c1 e8 10             	shr    $0x10,%eax
  101f34:	66 a3 60 42 10 00    	mov    %ax,0x104260
  101f3a:	b8 5c 42 10 00       	mov    $0x10425c,%eax
  101f3f:	0f 01 18             	lidtl  (%eax)
  101f42:	90                   	nop
  101f43:	5d                   	pop    %ebp
  101f44:	c3                   	ret    

00101f45 <setIntr>:
  101f45:	55                   	push   %ebp
  101f46:	89 e5                	mov    %esp,%ebp
  101f48:	8b 45 10             	mov    0x10(%ebp),%eax
  101f4b:	8b 55 08             	mov    0x8(%ebp),%edx
  101f4e:	66 89 02             	mov    %ax,(%edx)
  101f51:	8b 45 0c             	mov    0xc(%ebp),%eax
  101f54:	c1 e0 03             	shl    $0x3,%eax
  101f57:	8b 55 08             	mov    0x8(%ebp),%edx
  101f5a:	66 89 42 02          	mov    %ax,0x2(%edx)
  101f5e:	8b 45 08             	mov    0x8(%ebp),%eax
  101f61:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  101f65:	8b 45 08             	mov    0x8(%ebp),%eax
  101f68:	8a 50 05             	mov    0x5(%eax),%dl
  101f6b:	83 e2 f0             	and    $0xfffffff0,%edx
  101f6e:	83 ca 0e             	or     $0xe,%edx
  101f71:	88 50 05             	mov    %dl,0x5(%eax)
  101f74:	8b 45 08             	mov    0x8(%ebp),%eax
  101f77:	8a 50 05             	mov    0x5(%eax),%dl
  101f7a:	83 e2 ef             	and    $0xffffffef,%edx
  101f7d:	88 50 05             	mov    %dl,0x5(%eax)
  101f80:	8b 45 14             	mov    0x14(%ebp),%eax
  101f83:	83 e0 03             	and    $0x3,%eax
  101f86:	88 c2                	mov    %al,%dl
  101f88:	8b 45 08             	mov    0x8(%ebp),%eax
  101f8b:	83 e2 03             	and    $0x3,%edx
  101f8e:	88 d1                	mov    %dl,%cl
  101f90:	c1 e1 05             	shl    $0x5,%ecx
  101f93:	8a 50 05             	mov    0x5(%eax),%dl
  101f96:	83 e2 9f             	and    $0xffffff9f,%edx
  101f99:	09 ca                	or     %ecx,%edx
  101f9b:	88 50 05             	mov    %dl,0x5(%eax)
  101f9e:	8b 45 08             	mov    0x8(%ebp),%eax
  101fa1:	8a 50 05             	mov    0x5(%eax),%dl
  101fa4:	83 ca 80             	or     $0xffffff80,%edx
  101fa7:	88 50 05             	mov    %dl,0x5(%eax)
  101faa:	8b 45 10             	mov    0x10(%ebp),%eax
  101fad:	c1 e8 10             	shr    $0x10,%eax
  101fb0:	8b 55 08             	mov    0x8(%ebp),%edx
  101fb3:	66 89 42 06          	mov    %ax,0x6(%edx)
  101fb7:	90                   	nop
  101fb8:	5d                   	pop    %ebp
  101fb9:	c3                   	ret    

00101fba <setTrap>:
  101fba:	55                   	push   %ebp
  101fbb:	89 e5                	mov    %esp,%ebp
  101fbd:	8b 45 10             	mov    0x10(%ebp),%eax
  101fc0:	8b 55 08             	mov    0x8(%ebp),%edx
  101fc3:	66 89 02             	mov    %ax,(%edx)
  101fc6:	8b 45 0c             	mov    0xc(%ebp),%eax
  101fc9:	c1 e0 03             	shl    $0x3,%eax
  101fcc:	8b 55 08             	mov    0x8(%ebp),%edx
  101fcf:	66 89 42 02          	mov    %ax,0x2(%edx)
  101fd3:	8b 45 08             	mov    0x8(%ebp),%eax
  101fd6:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  101fda:	8b 45 08             	mov    0x8(%ebp),%eax
  101fdd:	8a 50 05             	mov    0x5(%eax),%dl
  101fe0:	83 ca 0f             	or     $0xf,%edx
  101fe3:	88 50 05             	mov    %dl,0x5(%eax)
  101fe6:	8b 45 08             	mov    0x8(%ebp),%eax
  101fe9:	8a 50 05             	mov    0x5(%eax),%dl
  101fec:	83 e2 ef             	and    $0xffffffef,%edx
  101fef:	88 50 05             	mov    %dl,0x5(%eax)
  101ff2:	8b 45 14             	mov    0x14(%ebp),%eax
  101ff5:	83 e0 03             	and    $0x3,%eax
  101ff8:	88 c2                	mov    %al,%dl
  101ffa:	8b 45 08             	mov    0x8(%ebp),%eax
  101ffd:	83 e2 03             	and    $0x3,%edx
  102000:	88 d1                	mov    %dl,%cl
  102002:	c1 e1 05             	shl    $0x5,%ecx
  102005:	8a 50 05             	mov    0x5(%eax),%dl
  102008:	83 e2 9f             	and    $0xffffff9f,%edx
  10200b:	09 ca                	or     %ecx,%edx
  10200d:	88 50 05             	mov    %dl,0x5(%eax)
  102010:	8b 45 08             	mov    0x8(%ebp),%eax
  102013:	8a 50 05             	mov    0x5(%eax),%dl
  102016:	83 ca 80             	or     $0xffffff80,%edx
  102019:	88 50 05             	mov    %dl,0x5(%eax)
  10201c:	8b 45 10             	mov    0x10(%ebp),%eax
  10201f:	c1 e8 10             	shr    $0x10,%eax
  102022:	8b 55 08             	mov    0x8(%ebp),%edx
  102025:	66 89 42 06          	mov    %ax,0x6(%edx)
  102029:	90                   	nop
  10202a:	5d                   	pop    %ebp
  10202b:	c3                   	ret    

0010202c <initIdt>:
  10202c:	55                   	push   %ebp
  10202d:	89 e5                	mov    %esp,%ebp
  10202f:	83 ec 10             	sub    $0x10,%esp
  102032:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  102039:	eb 21                	jmp    10205c <initIdt+0x30>
  10203b:	ba a2 2d 10 00       	mov    $0x102da2,%edx
  102040:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102043:	c1 e0 03             	shl    $0x3,%eax
  102046:	05 e0 d3 13 01       	add    $0x113d3e0,%eax
  10204b:	6a 00                	push   $0x0
  10204d:	52                   	push   %edx
  10204e:	6a 01                	push   $0x1
  102050:	50                   	push   %eax
  102051:	e8 64 ff ff ff       	call   101fba <setTrap>
  102056:	83 c4 10             	add    $0x10,%esp
  102059:	ff 45 fc             	incl   -0x4(%ebp)
  10205c:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  102063:	7e d6                	jle    10203b <initIdt+0xf>
  102065:	ba a8 2d 10 00       	mov    $0x102da8,%edx
  10206a:	b8 48 d4 13 01       	mov    $0x113d448,%eax
  10206f:	6a 00                	push   $0x0
  102071:	52                   	push   %edx
  102072:	6a 01                	push   $0x1
  102074:	50                   	push   %eax
  102075:	e8 40 ff ff ff       	call   101fba <setTrap>
  10207a:	83 c4 10             	add    $0x10,%esp
  10207d:	ba ac 2d 10 00       	mov    $0x102dac,%edx
  102082:	b8 e0 d7 13 01       	mov    $0x113d7e0,%eax
  102087:	6a 03                	push   $0x3
  102089:	52                   	push   %edx
  10208a:	6a 01                	push   $0x1
  10208c:	50                   	push   %eax
  10208d:	e8 b3 fe ff ff       	call   101f45 <setIntr>
  102092:	83 c4 10             	add    $0x10,%esp
  102095:	ba b5 2d 10 00       	mov    $0x102db5,%edx
  10209a:	b8 e0 d4 13 01       	mov    $0x113d4e0,%eax
  10209f:	6a 00                	push   $0x0
  1020a1:	52                   	push   %edx
  1020a2:	6a 01                	push   $0x1
  1020a4:	50                   	push   %eax
  1020a5:	e8 9b fe ff ff       	call   101f45 <setIntr>
  1020aa:	83 c4 10             	add    $0x10,%esp
  1020ad:	68 00 08 00 00       	push   $0x800
  1020b2:	68 e0 d3 13 01       	push   $0x113d3e0
  1020b7:	e8 5c fe ff ff       	call   101f18 <saveIdt>
  1020bc:	83 c4 08             	add    $0x8,%esp
  1020bf:	90                   	nop
  1020c0:	c9                   	leave  
  1020c1:	c3                   	ret    

001020c2 <enableInterrupt>:
  1020c2:	55                   	push   %ebp
  1020c3:	89 e5                	mov    %esp,%ebp
  1020c5:	fb                   	sti    
  1020c6:	90                   	nop
  1020c7:	5d                   	pop    %ebp
  1020c8:	c3                   	ret    

001020c9 <disableInterrupt>:
  1020c9:	55                   	push   %ebp
  1020ca:	89 e5                	mov    %esp,%ebp
  1020cc:	fa                   	cli    
  1020cd:	90                   	nop
  1020ce:	5d                   	pop    %ebp
  1020cf:	c3                   	ret    

001020d0 <add_sys_handler>:
  1020d0:	55                   	push   %ebp
  1020d1:	89 e5                	mov    %esp,%ebp
  1020d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1020d6:	8b 55 0c             	mov    0xc(%ebp),%edx
  1020d9:	89 14 85 e0 db 13 01 	mov    %edx,0x113dbe0(,%eax,4)
  1020e0:	b8 01 00 00 00       	mov    $0x1,%eax
  1020e5:	5d                   	pop    %ebp
  1020e6:	c3                   	ret    

001020e7 <irqHandle>:
  1020e7:	55                   	push   %ebp
  1020e8:	89 e5                	mov    %esp,%ebp
  1020ea:	57                   	push   %edi
  1020eb:	56                   	push   %esi
  1020ec:	53                   	push   %ebx
  1020ed:	83 ec 1c             	sub    $0x1c,%esp
  1020f0:	b8 10 00 00 00       	mov    $0x10,%eax
  1020f5:	89 c0                	mov    %eax,%eax
  1020f7:	8e d8                	mov    %eax,%ds
  1020f9:	8e e0                	mov    %eax,%fs
  1020fb:	8e c0                	mov    %eax,%es
  1020fd:	b8 30 00 00 00       	mov    $0x30,%eax
  102102:	89 c0                	mov    %eax,%eax
  102104:	8e e8                	mov    %eax,%gs
  102106:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10210d:	89 e8                	mov    %ebp,%eax
  10210f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102112:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102115:	83 c0 08             	add    $0x8,%eax
  102118:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10211b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10211e:	8b 10                	mov    (%eax),%edx
  102120:	8b 45 08             	mov    0x8(%ebp),%eax
  102123:	39 c2                	cmp    %eax,%edx
  102125:	74 12                	je     102139 <irqHandle+0x52>
  102127:	83 ec 08             	sub    $0x8,%esp
  10212a:	6a 29                	push   $0x29
  10212c:	68 d4 2e 10 00       	push   $0x102ed4
  102131:	e8 49 0c 00 00       	call   102d7f <abort>
  102136:	83 c4 10             	add    $0x10,%esp
  102139:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  10213e:	89 45 dc             	mov    %eax,-0x24(%ebp)
  102141:	e8 83 ff ff ff       	call   1020c9 <disableInterrupt>
  102146:	8b 45 08             	mov    0x8(%ebp),%eax
  102149:	8b 40 30             	mov    0x30(%eax),%eax
  10214c:	83 f8 0d             	cmp    $0xd,%eax
  10214f:	74 1e                	je     10216f <irqHandle+0x88>
  102151:	83 f8 0d             	cmp    $0xd,%eax
  102154:	7f 0b                	jg     102161 <irqHandle+0x7a>
  102156:	83 f8 ff             	cmp    $0xffffffff,%eax
  102159:	0f 84 9e 00 00 00    	je     1021fd <irqHandle+0x116>
  10215f:	eb 3e                	jmp    10219f <irqHandle+0xb8>
  102161:	83 f8 20             	cmp    $0x20,%eax
  102164:	74 29                	je     10218f <irqHandle+0xa8>
  102166:	3d 80 00 00 00       	cmp    $0x80,%eax
  10216b:	74 12                	je     10217f <irqHandle+0x98>
  10216d:	eb 30                	jmp    10219f <irqHandle+0xb8>
  10216f:	83 ec 0c             	sub    $0xc,%esp
  102172:	ff 75 08             	pushl  0x8(%ebp)
  102175:	e8 9c 01 00 00       	call   102316 <GProtectFaultHandle>
  10217a:	83 c4 10             	add    $0x10,%esp
  10217d:	eb 7f                	jmp    1021fe <irqHandle+0x117>
  10217f:	83 ec 0c             	sub    $0xc,%esp
  102182:	ff 75 08             	pushl  0x8(%ebp)
  102185:	e8 63 01 00 00       	call   1022ed <syscallHandle>
  10218a:	83 c4 10             	add    $0x10,%esp
  10218d:	eb 6f                	jmp    1021fe <irqHandle+0x117>
  10218f:	83 ec 0c             	sub    $0xc,%esp
  102192:	ff 75 08             	pushl  0x8(%ebp)
  102195:	e8 da 01 00 00       	call   102374 <timeHandle>
  10219a:	83 c4 10             	add    $0x10,%esp
  10219d:	eb 5f                	jmp    1021fe <irqHandle+0x117>
  10219f:	83 ec 0c             	sub    $0xc,%esp
  1021a2:	68 e7 2e 10 00       	push   $0x102ee7
  1021a7:	e8 17 09 00 00       	call   102ac3 <printk>
  1021ac:	83 c4 10             	add    $0x10,%esp
  1021af:	8b 45 08             	mov    0x8(%ebp),%eax
  1021b2:	8b 50 38             	mov    0x38(%eax),%edx
  1021b5:	8b 45 08             	mov    0x8(%ebp),%eax
  1021b8:	8b 40 30             	mov    0x30(%eax),%eax
  1021bb:	83 ec 08             	sub    $0x8,%esp
  1021be:	52                   	push   %edx
  1021bf:	50                   	push   %eax
  1021c0:	68 38 2f 10 00       	push   $0x102f38
  1021c5:	6a 40                	push   $0x40
  1021c7:	68 d4 2e 10 00       	push   $0x102ed4
  1021cc:	68 f0 2e 10 00       	push   $0x102ef0
  1021d1:	e8 ed 08 00 00       	call   102ac3 <printk>
  1021d6:	83 c4 20             	add    $0x20,%esp
  1021d9:	83 ec 0c             	sub    $0xc,%esp
  1021dc:	68 15 2f 10 00       	push   $0x102f15
  1021e1:	e8 dd 08 00 00       	call   102ac3 <printk>
  1021e6:	83 c4 10             	add    $0x10,%esp
  1021e9:	83 ec 08             	sub    $0x8,%esp
  1021ec:	6a 41                	push   $0x41
  1021ee:	68 d4 2e 10 00       	push   $0x102ed4
  1021f3:	e8 87 0b 00 00       	call   102d7f <abort>
  1021f8:	83 c4 10             	add    $0x10,%esp
  1021fb:	eb 01                	jmp    1021fe <irqHandle+0x117>
  1021fd:	90                   	nop
  1021fe:	8b 45 08             	mov    0x8(%ebp),%eax
  102201:	8b 40 30             	mov    0x30(%eax),%eax
  102204:	3d 80 00 00 00       	cmp    $0x80,%eax
  102209:	74 0f                	je     10221a <irqHandle+0x133>
  10220b:	8b 45 08             	mov    0x8(%ebp),%eax
  10220e:	8b 40 30             	mov    0x30(%eax),%eax
  102211:	83 f8 20             	cmp    $0x20,%eax
  102214:	0f 85 c5 00 00 00    	jne    1022df <irqHandle+0x1f8>
  10221a:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  10221f:	3b 45 dc             	cmp    -0x24(%ebp),%eax
  102222:	0f 84 b7 00 00 00    	je     1022df <irqHandle+0x1f8>
  102228:	8b 15 e0 4a 10 00    	mov    0x104ae0,%edx
  10222e:	89 d0                	mov    %edx,%eax
  102230:	c1 e0 07             	shl    $0x7,%eax
  102233:	01 d0                	add    %edx,%eax
  102235:	01 c0                	add    %eax,%eax
  102237:	01 d0                	add    %edx,%eax
  102239:	01 c0                	add    %eax,%eax
  10223b:	01 d0                	add    %edx,%eax
  10223d:	c1 e0 04             	shl    $0x4,%eax
  102240:	05 00 4b 10 00       	add    $0x104b00,%eax
  102245:	05 fc 1f 00 00       	add    $0x1ffc,%eax
  10224a:	8d 50 b4             	lea    -0x4c(%eax),%edx
  10224d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102250:	89 10                	mov    %edx,(%eax)
  102252:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102255:	8b 00                	mov    (%eax),%eax
  102257:	89 45 d8             	mov    %eax,-0x28(%ebp)
  10225a:	8b 15 e0 4a 10 00    	mov    0x104ae0,%edx
  102260:	8b 4d d8             	mov    -0x28(%ebp),%ecx
  102263:	89 d0                	mov    %edx,%eax
  102265:	c1 e0 07             	shl    $0x7,%eax
  102268:	01 d0                	add    %edx,%eax
  10226a:	01 c0                	add    %eax,%eax
  10226c:	01 d0                	add    %edx,%eax
  10226e:	01 c0                	add    %eax,%eax
  102270:	01 d0                	add    %edx,%eax
  102272:	c1 e0 04             	shl    $0x4,%eax
  102275:	05 00 6b 10 00       	add    $0x106b00,%eax
  10227a:	89 ca                	mov    %ecx,%edx
  10227c:	89 c3                	mov    %eax,%ebx
  10227e:	b8 13 00 00 00       	mov    $0x13,%eax
  102283:	89 d7                	mov    %edx,%edi
  102285:	89 de                	mov    %ebx,%esi
  102287:	89 c1                	mov    %eax,%ecx
  102289:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10228b:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  102290:	c1 e0 10             	shl    $0x10,%eax
  102293:	83 ec 08             	sub    $0x8,%esp
  102296:	50                   	push   %eax
  102297:	6a 23                	push   $0x23
  102299:	e8 48 de ff ff       	call   1000e6 <change_gdt>
  10229e:	83 c4 10             	add    $0x10,%esp
  1022a1:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  1022a6:	c1 e0 10             	shl    $0x10,%eax
  1022a9:	83 ec 08             	sub    $0x8,%esp
  1022ac:	50                   	push   %eax
  1022ad:	6a 1b                	push   $0x1b
  1022af:	e8 32 de ff ff       	call   1000e6 <change_gdt>
  1022b4:	83 c4 10             	add    $0x10,%esp
  1022b7:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  1022bc:	85 c0                	test   %eax,%eax
  1022be:	7e 1f                	jle    1022df <irqHandle+0x1f8>
  1022c0:	8b 45 08             	mov    0x8(%ebp),%eax
  1022c3:	8b 40 38             	mov    0x38(%eax),%eax
  1022c6:	3d ff ff 1f 00       	cmp    $0x1fffff,%eax
  1022cb:	77 12                	ja     1022df <irqHandle+0x1f8>
  1022cd:	83 ec 08             	sub    $0x8,%esp
  1022d0:	6a 52                	push   $0x52
  1022d2:	68 d4 2e 10 00       	push   $0x102ed4
  1022d7:	e8 a3 0a 00 00       	call   102d7f <abort>
  1022dc:	83 c4 10             	add    $0x10,%esp
  1022df:	e8 de fd ff ff       	call   1020c2 <enableInterrupt>
  1022e4:	90                   	nop
  1022e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1022e8:	5b                   	pop    %ebx
  1022e9:	5e                   	pop    %esi
  1022ea:	5f                   	pop    %edi
  1022eb:	5d                   	pop    %ebp
  1022ec:	c3                   	ret    

001022ed <syscallHandle>:
  1022ed:	55                   	push   %ebp
  1022ee:	89 e5                	mov    %esp,%ebp
  1022f0:	83 ec 08             	sub    $0x8,%esp
  1022f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1022f6:	8b 40 2c             	mov    0x2c(%eax),%eax
  1022f9:	8b 04 85 e0 db 13 01 	mov    0x113dbe0(,%eax,4),%eax
  102300:	83 ec 0c             	sub    $0xc,%esp
  102303:	ff 75 08             	pushl  0x8(%ebp)
  102306:	ff d0                	call   *%eax
  102308:	83 c4 10             	add    $0x10,%esp
  10230b:	89 c2                	mov    %eax,%edx
  10230d:	8b 45 08             	mov    0x8(%ebp),%eax
  102310:	89 50 2c             	mov    %edx,0x2c(%eax)
  102313:	90                   	nop
  102314:	c9                   	leave  
  102315:	c3                   	ret    

00102316 <GProtectFaultHandle>:
  102316:	55                   	push   %ebp
  102317:	89 e5                	mov    %esp,%ebp
  102319:	83 ec 08             	sub    $0x8,%esp
  10231c:	83 ec 0c             	sub    $0xc,%esp
  10231f:	68 e7 2e 10 00       	push   $0x102ee7
  102324:	e8 9a 07 00 00       	call   102ac3 <printk>
  102329:	83 c4 10             	add    $0x10,%esp
  10232c:	8b 45 08             	mov    0x8(%ebp),%eax
  10232f:	8b 40 30             	mov    0x30(%eax),%eax
  102332:	83 ec 0c             	sub    $0xc,%esp
  102335:	50                   	push   %eax
  102336:	68 44 2f 10 00       	push   $0x102f44
  10233b:	6a 66                	push   $0x66
  10233d:	68 d4 2e 10 00       	push   $0x102ed4
  102342:	68 1b 2f 10 00       	push   $0x102f1b
  102347:	e8 77 07 00 00       	call   102ac3 <printk>
  10234c:	83 c4 20             	add    $0x20,%esp
  10234f:	83 ec 0c             	sub    $0xc,%esp
  102352:	68 15 2f 10 00       	push   $0x102f15
  102357:	e8 67 07 00 00       	call   102ac3 <printk>
  10235c:	83 c4 10             	add    $0x10,%esp
  10235f:	83 ec 08             	sub    $0x8,%esp
  102362:	6a 67                	push   $0x67
  102364:	68 d4 2e 10 00       	push   $0x102ed4
  102369:	e8 11 0a 00 00       	call   102d7f <abort>
  10236e:	83 c4 10             	add    $0x10,%esp
  102371:	90                   	nop
  102372:	c9                   	leave  
  102373:	c3                   	ret    

00102374 <timeHandle>:
  102374:	55                   	push   %ebp
  102375:	89 e5                	mov    %esp,%ebp
  102377:	83 ec 18             	sub    $0x18,%esp
  10237a:	8b 15 e0 4a 10 00    	mov    0x104ae0,%edx
  102380:	8b 0d e0 4a 10 00    	mov    0x104ae0,%ecx
  102386:	89 c8                	mov    %ecx,%eax
  102388:	c1 e0 07             	shl    $0x7,%eax
  10238b:	01 c8                	add    %ecx,%eax
  10238d:	01 c0                	add    %eax,%eax
  10238f:	01 c8                	add    %ecx,%eax
  102391:	01 c0                	add    %eax,%eax
  102393:	01 c8                	add    %ecx,%eax
  102395:	c1 e0 04             	shl    $0x4,%eax
  102398:	05 50 6b 10 00       	add    $0x106b50,%eax
  10239d:	8b 00                	mov    (%eax),%eax
  10239f:	8d 48 ff             	lea    -0x1(%eax),%ecx
  1023a2:	89 d0                	mov    %edx,%eax
  1023a4:	c1 e0 07             	shl    $0x7,%eax
  1023a7:	01 d0                	add    %edx,%eax
  1023a9:	01 c0                	add    %eax,%eax
  1023ab:	01 d0                	add    %edx,%eax
  1023ad:	01 c0                	add    %eax,%eax
  1023af:	01 d0                	add    %edx,%eax
  1023b1:	c1 e0 04             	shl    $0x4,%eax
  1023b4:	05 50 6b 10 00       	add    $0x106b50,%eax
  1023b9:	89 08                	mov    %ecx,(%eax)
  1023bb:	e8 d8 f8 ff ff       	call   101c98 <block_decrease>
  1023c0:	e8 4d f3 ff ff       	call   101712 <check_block>
  1023c5:	8b 15 e0 4a 10 00    	mov    0x104ae0,%edx
  1023cb:	89 d0                	mov    %edx,%eax
  1023cd:	c1 e0 07             	shl    $0x7,%eax
  1023d0:	01 d0                	add    %edx,%eax
  1023d2:	01 c0                	add    %eax,%eax
  1023d4:	01 d0                	add    %edx,%eax
  1023d6:	01 c0                	add    %eax,%eax
  1023d8:	01 d0                	add    %edx,%eax
  1023da:	c1 e0 04             	shl    $0x4,%eax
  1023dd:	05 50 6b 10 00       	add    $0x106b50,%eax
  1023e2:	8b 00                	mov    (%eax),%eax
  1023e4:	85 c0                	test   %eax,%eax
  1023e6:	7f 2d                	jg     102415 <timeHandle+0xa1>
  1023e8:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  1023ed:	83 ec 08             	sub    $0x8,%esp
  1023f0:	ff 75 08             	pushl  0x8(%ebp)
  1023f3:	50                   	push   %eax
  1023f4:	e8 89 f2 ff ff       	call   101682 <put_into_runnable>
  1023f9:	83 c4 10             	add    $0x10,%esp
  1023fc:	e8 61 f2 ff ff       	call   101662 <get_from_runnable>
  102401:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102404:	83 ec 08             	sub    $0x8,%esp
  102407:	ff 75 08             	pushl  0x8(%ebp)
  10240a:	ff 75 f4             	pushl  -0xc(%ebp)
  10240d:	e8 9d f1 ff ff       	call   1015af <put_into_running>
  102412:	83 c4 10             	add    $0x10,%esp
  102415:	e8 2a f2 ff ff       	call   101644 <getpid>
  10241a:	85 c0                	test   %eax,%eax
  10241c:	75 12                	jne    102430 <timeHandle+0xbc>
  10241e:	83 ec 0c             	sub    $0xc,%esp
  102421:	68 31 2f 10 00       	push   $0x102f31
  102426:	e8 98 06 00 00       	call   102ac3 <printk>
  10242b:	83 c4 10             	add    $0x10,%esp
  10242e:	eb 16                	jmp    102446 <timeHandle+0xd2>
  102430:	e8 0f f2 ff ff       	call   101644 <getpid>
  102435:	83 ec 08             	sub    $0x8,%esp
  102438:	50                   	push   %eax
  102439:	68 33 2f 10 00       	push   $0x102f33
  10243e:	e8 80 06 00 00       	call   102ac3 <printk>
  102443:	83 c4 10             	add    $0x10,%esp
  102446:	90                   	nop
  102447:	c9                   	leave  
  102448:	c3                   	ret    

00102449 <initSyscallHander>:
  102449:	55                   	push   %ebp
  10244a:	89 e5                	mov    %esp,%ebp
  10244c:	68 6a 0c 10 00       	push   $0x100c6a
  102451:	6a 01                	push   $0x1
  102453:	e8 78 fc ff ff       	call   1020d0 <add_sys_handler>
  102458:	83 c4 08             	add    $0x8,%esp
  10245b:	68 e8 0c 10 00       	push   $0x100ce8
  102460:	6a 02                	push   $0x2
  102462:	e8 69 fc ff ff       	call   1020d0 <add_sys_handler>
  102467:	83 c4 08             	add    $0x8,%esp
  10246a:	68 6e 12 10 00       	push   $0x10126e
  10246f:	6a 03                	push   $0x3
  102471:	e8 5a fc ff ff       	call   1020d0 <add_sys_handler>
  102476:	83 c4 08             	add    $0x8,%esp
  102479:	68 89 11 10 00       	push   $0x101189
  10247e:	6a 04                	push   $0x4
  102480:	e8 4b fc ff ff       	call   1020d0 <add_sys_handler>
  102485:	83 c4 08             	add    $0x8,%esp
  102488:	68 a1 0c 10 00       	push   $0x100ca1
  10248d:	6a 07                	push   $0x7
  10248f:	e8 3c fc ff ff       	call   1020d0 <add_sys_handler>
  102494:	83 c4 08             	add    $0x8,%esp
  102497:	68 ae 0c 10 00       	push   $0x100cae
  10249c:	6a 08                	push   $0x8
  10249e:	e8 2d fc ff ff       	call   1020d0 <add_sys_handler>
  1024a3:	83 c4 08             	add    $0x8,%esp
  1024a6:	68 3b 26 10 00       	push   $0x10263b
  1024ab:	6a 15                	push   $0x15
  1024ad:	e8 1e fc ff ff       	call   1020d0 <add_sys_handler>
  1024b2:	83 c4 08             	add    $0x8,%esp
  1024b5:	68 e4 26 10 00       	push   $0x1026e4
  1024ba:	6a 16                	push   $0x16
  1024bc:	e8 0f fc ff ff       	call   1020d0 <add_sys_handler>
  1024c1:	83 c4 08             	add    $0x8,%esp
  1024c4:	68 a7 26 10 00       	push   $0x1026a7
  1024c9:	6a 17                	push   $0x17
  1024cb:	e8 00 fc ff ff       	call   1020d0 <add_sys_handler>
  1024d0:	83 c4 08             	add    $0x8,%esp
  1024d3:	68 21 27 10 00       	push   $0x102721
  1024d8:	6a 18                	push   $0x18
  1024da:	e8 f1 fb ff ff       	call   1020d0 <add_sys_handler>
  1024df:	83 c4 08             	add    $0x8,%esp
  1024e2:	90                   	nop
  1024e3:	c9                   	leave  
  1024e4:	c3                   	ret    

001024e5 <W>:
  1024e5:	55                   	push   %ebp
  1024e6:	89 e5                	mov    %esp,%ebp
  1024e8:	83 ec 18             	sub    $0x18,%esp
  1024eb:	e8 54 f1 ff ff       	call   101644 <getpid>
  1024f0:	89 c2                	mov    %eax,%edx
  1024f2:	8b 45 08             	mov    0x8(%ebp),%eax
  1024f5:	8b 48 04             	mov    0x4(%eax),%ecx
  1024f8:	89 d0                	mov    %edx,%eax
  1024fa:	c1 e0 07             	shl    $0x7,%eax
  1024fd:	01 d0                	add    %edx,%eax
  1024ff:	01 c0                	add    %eax,%eax
  102501:	01 d0                	add    %edx,%eax
  102503:	01 c0                	add    %eax,%eax
  102505:	01 d0                	add    %edx,%eax
  102507:	c1 e0 04             	shl    $0x4,%eax
  10250a:	05 68 6b 10 00       	add    $0x106b68,%eax
  10250f:	89 08                	mov    %ecx,(%eax)
  102511:	e8 2e f1 ff ff       	call   101644 <getpid>
  102516:	89 c2                	mov    %eax,%edx
  102518:	89 d0                	mov    %edx,%eax
  10251a:	c1 e0 07             	shl    $0x7,%eax
  10251d:	01 d0                	add    %edx,%eax
  10251f:	01 c0                	add    %eax,%eax
  102521:	01 d0                	add    %edx,%eax
  102523:	01 c0                	add    %eax,%eax
  102525:	01 d0                	add    %edx,%eax
  102527:	c1 e0 04             	shl    $0x4,%eax
  10252a:	8d 90 00 4b 10 00    	lea    0x104b00(%eax),%edx
  102530:	8b 45 08             	mov    0x8(%ebp),%eax
  102533:	89 50 04             	mov    %edx,0x4(%eax)
  102536:	e8 27 f1 ff ff       	call   101662 <get_from_runnable>
  10253b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10253e:	e8 01 f1 ff ff       	call   101644 <getpid>
  102543:	83 f8 02             	cmp    $0x2,%eax
  102546:	74 12                	je     10255a <W+0x75>
  102548:	83 ec 08             	sub    $0x8,%esp
  10254b:	6a 0f                	push   $0xf
  10254d:	68 58 2f 10 00       	push   $0x102f58
  102552:	e8 28 08 00 00       	call   102d7f <abort>
  102557:	83 c4 10             	add    $0x10,%esp
  10255a:	83 ec 08             	sub    $0x8,%esp
  10255d:	6a 00                	push   $0x0
  10255f:	ff 75 f4             	pushl  -0xc(%ebp)
  102562:	e8 48 f0 ff ff       	call   1015af <put_into_running>
  102567:	83 c4 10             	add    $0x10,%esp
  10256a:	90                   	nop
  10256b:	c9                   	leave  
  10256c:	c3                   	ret    

0010256d <R>:
  10256d:	55                   	push   %ebp
  10256e:	89 e5                	mov    %esp,%ebp
  102570:	83 ec 18             	sub    $0x18,%esp
  102573:	8b 45 08             	mov    0x8(%ebp),%eax
  102576:	8b 40 04             	mov    0x4(%eax),%eax
  102579:	8b 80 58 20 00 00    	mov    0x2058(%eax),%eax
  10257f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102582:	8b 45 08             	mov    0x8(%ebp),%eax
  102585:	8b 40 04             	mov    0x4(%eax),%eax
  102588:	8b 90 68 20 00 00    	mov    0x2068(%eax),%edx
  10258e:	8b 45 08             	mov    0x8(%ebp),%eax
  102591:	89 50 04             	mov    %edx,0x4(%eax)
  102594:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102597:	89 d0                	mov    %edx,%eax
  102599:	c1 e0 07             	shl    $0x7,%eax
  10259c:	01 d0                	add    %edx,%eax
  10259e:	01 c0                	add    %eax,%eax
  1025a0:	01 d0                	add    %edx,%eax
  1025a2:	01 c0                	add    %eax,%eax
  1025a4:	01 d0                	add    %edx,%eax
  1025a6:	c1 e0 04             	shl    $0x4,%eax
  1025a9:	05 00 20 00 00       	add    $0x2000,%eax
  1025ae:	05 00 4b 10 00       	add    $0x104b00,%eax
  1025b3:	83 ec 08             	sub    $0x8,%esp
  1025b6:	50                   	push   %eax
  1025b7:	ff 75 f4             	pushl  -0xc(%ebp)
  1025ba:	e8 c3 f0 ff ff       	call   101682 <put_into_runnable>
  1025bf:	83 c4 10             	add    $0x10,%esp
  1025c2:	e8 7d f0 ff ff       	call   101644 <getpid>
  1025c7:	83 f8 01             	cmp    $0x1,%eax
  1025ca:	74 12                	je     1025de <R+0x71>
  1025cc:	83 ec 08             	sub    $0x8,%esp
  1025cf:	6a 19                	push   $0x19
  1025d1:	68 58 2f 10 00       	push   $0x102f58
  1025d6:	e8 a4 07 00 00       	call   102d7f <abort>
  1025db:	83 c4 10             	add    $0x10,%esp
  1025de:	90                   	nop
  1025df:	c9                   	leave  
  1025e0:	c3                   	ret    

001025e1 <P>:
  1025e1:	55                   	push   %ebp
  1025e2:	89 e5                	mov    %esp,%ebp
  1025e4:	83 ec 08             	sub    $0x8,%esp
  1025e7:	8b 45 08             	mov    0x8(%ebp),%eax
  1025ea:	8b 00                	mov    (%eax),%eax
  1025ec:	8d 50 ff             	lea    -0x1(%eax),%edx
  1025ef:	8b 45 08             	mov    0x8(%ebp),%eax
  1025f2:	89 10                	mov    %edx,(%eax)
  1025f4:	8b 45 08             	mov    0x8(%ebp),%eax
  1025f7:	8b 00                	mov    (%eax),%eax
  1025f9:	85 c0                	test   %eax,%eax
  1025fb:	79 0e                	jns    10260b <P+0x2a>
  1025fd:	83 ec 0c             	sub    $0xc,%esp
  102600:	ff 75 08             	pushl  0x8(%ebp)
  102603:	e8 dd fe ff ff       	call   1024e5 <W>
  102608:	83 c4 10             	add    $0x10,%esp
  10260b:	90                   	nop
  10260c:	c9                   	leave  
  10260d:	c3                   	ret    

0010260e <V>:
  10260e:	55                   	push   %ebp
  10260f:	89 e5                	mov    %esp,%ebp
  102611:	83 ec 08             	sub    $0x8,%esp
  102614:	8b 45 08             	mov    0x8(%ebp),%eax
  102617:	8b 00                	mov    (%eax),%eax
  102619:	8d 50 01             	lea    0x1(%eax),%edx
  10261c:	8b 45 08             	mov    0x8(%ebp),%eax
  10261f:	89 10                	mov    %edx,(%eax)
  102621:	8b 45 08             	mov    0x8(%ebp),%eax
  102624:	8b 00                	mov    (%eax),%eax
  102626:	85 c0                	test   %eax,%eax
  102628:	7f 0e                	jg     102638 <V+0x2a>
  10262a:	83 ec 0c             	sub    $0xc,%esp
  10262d:	ff 75 08             	pushl  0x8(%ebp)
  102630:	e8 38 ff ff ff       	call   10256d <R>
  102635:	83 c4 10             	add    $0x10,%esp
  102638:	90                   	nop
  102639:	c9                   	leave  
  10263a:	c3                   	ret    

0010263b <sys_sem_init>:
  10263b:	55                   	push   %ebp
  10263c:	89 e5                	mov    %esp,%ebp
  10263e:	53                   	push   %ebx
  10263f:	83 ec 14             	sub    $0x14,%esp
  102642:	8b 45 08             	mov    0x8(%ebp),%eax
  102645:	8b 58 20             	mov    0x20(%eax),%ebx
  102648:	e8 f7 ef ff ff       	call   101644 <getpid>
  10264d:	c1 e0 10             	shl    $0x10,%eax
  102650:	01 d8                	add    %ebx,%eax
  102652:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102655:	a1 64 42 10 00       	mov    0x104264,%eax
  10265a:	25 1f 00 00 80       	and    $0x8000001f,%eax
  10265f:	85 c0                	test   %eax,%eax
  102661:	79 05                	jns    102668 <sys_sem_init+0x2d>
  102663:	48                   	dec    %eax
  102664:	83 c8 e0             	or     $0xffffffe0,%eax
  102667:	40                   	inc    %eax
  102668:	89 c2                	mov    %eax,%edx
  10266a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10266d:	89 10                	mov    %edx,(%eax)
  10266f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102672:	8b 00                	mov    (%eax),%eax
  102674:	8b 55 08             	mov    0x8(%ebp),%edx
  102677:	8b 52 28             	mov    0x28(%edx),%edx
  10267a:	89 14 c5 40 de 13 01 	mov    %edx,0x113de40(,%eax,8)
  102681:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102684:	8b 00                	mov    (%eax),%eax
  102686:	c7 04 c5 44 de 13 01 	movl   $0x0,0x113de44(,%eax,8)
  10268d:	00 00 00 00 
  102691:	a1 64 42 10 00       	mov    0x104264,%eax
  102696:	40                   	inc    %eax
  102697:	a3 64 42 10 00       	mov    %eax,0x104264
  10269c:	b8 01 00 00 00       	mov    $0x1,%eax
  1026a1:	83 c4 14             	add    $0x14,%esp
  1026a4:	5b                   	pop    %ebx
  1026a5:	5d                   	pop    %ebp
  1026a6:	c3                   	ret    

001026a7 <sys_sem_post>:
  1026a7:	55                   	push   %ebp
  1026a8:	89 e5                	mov    %esp,%ebp
  1026aa:	53                   	push   %ebx
  1026ab:	83 ec 14             	sub    $0x14,%esp
  1026ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1026b1:	8b 58 20             	mov    0x20(%eax),%ebx
  1026b4:	e8 8b ef ff ff       	call   101644 <getpid>
  1026b9:	c1 e0 10             	shl    $0x10,%eax
  1026bc:	01 d8                	add    %ebx,%eax
  1026be:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1026c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1026c4:	8b 00                	mov    (%eax),%eax
  1026c6:	c1 e0 03             	shl    $0x3,%eax
  1026c9:	05 40 de 13 01       	add    $0x113de40,%eax
  1026ce:	83 ec 0c             	sub    $0xc,%esp
  1026d1:	50                   	push   %eax
  1026d2:	e8 37 ff ff ff       	call   10260e <V>
  1026d7:	83 c4 10             	add    $0x10,%esp
  1026da:	b8 01 00 00 00       	mov    $0x1,%eax
  1026df:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1026e2:	c9                   	leave  
  1026e3:	c3                   	ret    

001026e4 <sys_sem_wait>:
  1026e4:	55                   	push   %ebp
  1026e5:	89 e5                	mov    %esp,%ebp
  1026e7:	53                   	push   %ebx
  1026e8:	83 ec 14             	sub    $0x14,%esp
  1026eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1026ee:	8b 58 20             	mov    0x20(%eax),%ebx
  1026f1:	e8 4e ef ff ff       	call   101644 <getpid>
  1026f6:	c1 e0 10             	shl    $0x10,%eax
  1026f9:	01 d8                	add    %ebx,%eax
  1026fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1026fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102701:	8b 00                	mov    (%eax),%eax
  102703:	c1 e0 03             	shl    $0x3,%eax
  102706:	05 40 de 13 01       	add    $0x113de40,%eax
  10270b:	83 ec 0c             	sub    $0xc,%esp
  10270e:	50                   	push   %eax
  10270f:	e8 cd fe ff ff       	call   1025e1 <P>
  102714:	83 c4 10             	add    $0x10,%esp
  102717:	b8 01 00 00 00       	mov    $0x1,%eax
  10271c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10271f:	c9                   	leave  
  102720:	c3                   	ret    

00102721 <sys_sem_destroy>:
  102721:	55                   	push   %ebp
  102722:	89 e5                	mov    %esp,%ebp
  102724:	53                   	push   %ebx
  102725:	83 ec 14             	sub    $0x14,%esp
  102728:	8b 45 08             	mov    0x8(%ebp),%eax
  10272b:	8b 58 20             	mov    0x20(%eax),%ebx
  10272e:	e8 11 ef ff ff       	call   101644 <getpid>
  102733:	c1 e0 10             	shl    $0x10,%eax
  102736:	01 d8                	add    %ebx,%eax
  102738:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10273b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10273e:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
  102744:	c7 05 40 de 13 01 ff 	movl   $0xffffffff,0x113de40
  10274b:	ff ff ff 
  10274e:	b8 01 00 00 00       	mov    $0x1,%eax
  102753:	83 c4 14             	add    $0x14,%esp
  102756:	5b                   	pop    %ebx
  102757:	5d                   	pop    %ebp
  102758:	c3                   	ret    

00102759 <inByte>:
  102759:	55                   	push   %ebp
  10275a:	89 e5                	mov    %esp,%ebp
  10275c:	83 ec 14             	sub    $0x14,%esp
  10275f:	8b 45 08             	mov    0x8(%ebp),%eax
  102762:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  102766:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102769:	89 c2                	mov    %eax,%edx
  10276b:	ec                   	in     (%dx),%al
  10276c:	88 45 ff             	mov    %al,-0x1(%ebp)
  10276f:	8a 45 ff             	mov    -0x1(%ebp),%al
  102772:	c9                   	leave  
  102773:	c3                   	ret    

00102774 <outByte>:
  102774:	55                   	push   %ebp
  102775:	89 e5                	mov    %esp,%ebp
  102777:	83 ec 08             	sub    $0x8,%esp
  10277a:	8b 45 08             	mov    0x8(%ebp),%eax
  10277d:	8b 55 0c             	mov    0xc(%ebp),%edx
  102780:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  102784:	88 55 f8             	mov    %dl,-0x8(%ebp)
  102787:	8a 45 f8             	mov    -0x8(%ebp),%al
  10278a:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10278d:	ee                   	out    %al,(%dx)
  10278e:	90                   	nop
  10278f:	c9                   	leave  
  102790:	c3                   	ret    

00102791 <initIntr>:
  102791:	55                   	push   %ebp
  102792:	89 e5                	mov    %esp,%ebp
  102794:	6a ff                	push   $0xffffffff
  102796:	6a 21                	push   $0x21
  102798:	e8 d7 ff ff ff       	call   102774 <outByte>
  10279d:	83 c4 08             	add    $0x8,%esp
  1027a0:	6a ff                	push   $0xffffffff
  1027a2:	68 a1 00 00 00       	push   $0xa1
  1027a7:	e8 c8 ff ff ff       	call   102774 <outByte>
  1027ac:	83 c4 08             	add    $0x8,%esp
  1027af:	6a 11                	push   $0x11
  1027b1:	6a 20                	push   $0x20
  1027b3:	e8 bc ff ff ff       	call   102774 <outByte>
  1027b8:	83 c4 08             	add    $0x8,%esp
  1027bb:	6a 20                	push   $0x20
  1027bd:	6a 21                	push   $0x21
  1027bf:	e8 b0 ff ff ff       	call   102774 <outByte>
  1027c4:	83 c4 08             	add    $0x8,%esp
  1027c7:	6a 04                	push   $0x4
  1027c9:	6a 21                	push   $0x21
  1027cb:	e8 a4 ff ff ff       	call   102774 <outByte>
  1027d0:	83 c4 08             	add    $0x8,%esp
  1027d3:	6a 03                	push   $0x3
  1027d5:	6a 21                	push   $0x21
  1027d7:	e8 98 ff ff ff       	call   102774 <outByte>
  1027dc:	83 c4 08             	add    $0x8,%esp
  1027df:	6a 11                	push   $0x11
  1027e1:	68 a0 00 00 00       	push   $0xa0
  1027e6:	e8 89 ff ff ff       	call   102774 <outByte>
  1027eb:	83 c4 08             	add    $0x8,%esp
  1027ee:	6a 28                	push   $0x28
  1027f0:	68 a1 00 00 00       	push   $0xa1
  1027f5:	e8 7a ff ff ff       	call   102774 <outByte>
  1027fa:	83 c4 08             	add    $0x8,%esp
  1027fd:	6a 02                	push   $0x2
  1027ff:	68 a1 00 00 00       	push   $0xa1
  102804:	e8 6b ff ff ff       	call   102774 <outByte>
  102809:	83 c4 08             	add    $0x8,%esp
  10280c:	6a 03                	push   $0x3
  10280e:	68 a1 00 00 00       	push   $0xa1
  102813:	e8 5c ff ff ff       	call   102774 <outByte>
  102818:	83 c4 08             	add    $0x8,%esp
  10281b:	6a 68                	push   $0x68
  10281d:	6a 20                	push   $0x20
  10281f:	e8 50 ff ff ff       	call   102774 <outByte>
  102824:	83 c4 08             	add    $0x8,%esp
  102827:	6a 0a                	push   $0xa
  102829:	6a 20                	push   $0x20
  10282b:	e8 44 ff ff ff       	call   102774 <outByte>
  102830:	83 c4 08             	add    $0x8,%esp
  102833:	6a 68                	push   $0x68
  102835:	68 a0 00 00 00       	push   $0xa0
  10283a:	e8 35 ff ff ff       	call   102774 <outByte>
  10283f:	83 c4 08             	add    $0x8,%esp
  102842:	6a 0a                	push   $0xa
  102844:	68 a0 00 00 00       	push   $0xa0
  102849:	e8 26 ff ff ff       	call   102774 <outByte>
  10284e:	83 c4 08             	add    $0x8,%esp
  102851:	90                   	nop
  102852:	c9                   	leave  
  102853:	c3                   	ret    

00102854 <initTimer>:
  102854:	55                   	push   %ebp
  102855:	89 e5                	mov    %esp,%ebp
  102857:	83 ec 10             	sub    $0x10,%esp
  10285a:	c7 45 fc 9b 2e 00 00 	movl   $0x2e9b,-0x4(%ebp)
  102861:	6a 34                	push   $0x34
  102863:	6a 43                	push   $0x43
  102865:	e8 0a ff ff ff       	call   102774 <outByte>
  10286a:	83 c4 08             	add    $0x8,%esp
  10286d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102870:	25 ff 00 00 80       	and    $0x800000ff,%eax
  102875:	85 c0                	test   %eax,%eax
  102877:	79 07                	jns    102880 <initTimer+0x2c>
  102879:	48                   	dec    %eax
  10287a:	0d 00 ff ff ff       	or     $0xffffff00,%eax
  10287f:	40                   	inc    %eax
  102880:	0f be c0             	movsbl %al,%eax
  102883:	50                   	push   %eax
  102884:	6a 40                	push   $0x40
  102886:	e8 e9 fe ff ff       	call   102774 <outByte>
  10288b:	83 c4 08             	add    $0x8,%esp
  10288e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102891:	85 c0                	test   %eax,%eax
  102893:	79 05                	jns    10289a <initTimer+0x46>
  102895:	05 ff 00 00 00       	add    $0xff,%eax
  10289a:	c1 f8 08             	sar    $0x8,%eax
  10289d:	0f be c0             	movsbl %al,%eax
  1028a0:	50                   	push   %eax
  1028a1:	6a 40                	push   $0x40
  1028a3:	e8 cc fe ff ff       	call   102774 <outByte>
  1028a8:	83 c4 08             	add    $0x8,%esp
  1028ab:	90                   	nop
  1028ac:	c9                   	leave  
  1028ad:	c3                   	ret    

001028ae <getKeyCode>:
  1028ae:	55                   	push   %ebp
  1028af:	89 e5                	mov    %esp,%ebp
  1028b1:	83 ec 10             	sub    $0x10,%esp
  1028b4:	6a 60                	push   $0x60
  1028b6:	e8 9e fe ff ff       	call   102759 <inByte>
  1028bb:	83 c4 04             	add    $0x4,%esp
  1028be:	0f b6 c0             	movzbl %al,%eax
  1028c1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1028c4:	6a 61                	push   $0x61
  1028c6:	e8 8e fe ff ff       	call   102759 <inByte>
  1028cb:	83 c4 04             	add    $0x4,%esp
  1028ce:	0f b6 c0             	movzbl %al,%eax
  1028d1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1028d4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1028d7:	83 c8 80             	or     $0xffffff80,%eax
  1028da:	0f be c0             	movsbl %al,%eax
  1028dd:	50                   	push   %eax
  1028de:	6a 61                	push   $0x61
  1028e0:	e8 8f fe ff ff       	call   102774 <outByte>
  1028e5:	83 c4 08             	add    $0x8,%esp
  1028e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1028eb:	0f be c0             	movsbl %al,%eax
  1028ee:	50                   	push   %eax
  1028ef:	6a 61                	push   $0x61
  1028f1:	e8 7e fe ff ff       	call   102774 <outByte>
  1028f6:	83 c4 08             	add    $0x8,%esp
  1028f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1028fc:	c9                   	leave  
  1028fd:	c3                   	ret    

001028fe <i2A>:
  1028fe:	55                   	push   %ebp
  1028ff:	89 e5                	mov    %esp,%ebp
  102901:	83 ec 10             	sub    $0x10,%esp
  102904:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10290b:	c7 45 f8 9e 4a 10 00 	movl   $0x104a9e,-0x8(%ebp)
  102912:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
  102916:	c6 45 f6 00          	movb   $0x0,-0xa(%ebp)
  10291a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  10291e:	79 17                	jns    102937 <i2A+0x39>
  102920:	81 7d 08 00 00 00 80 	cmpl   $0x80000000,0x8(%ebp)
  102927:	75 07                	jne    102930 <i2A+0x32>
  102929:	ff 45 08             	incl   0x8(%ebp)
  10292c:	c6 45 f6 01          	movb   $0x1,-0xa(%ebp)
  102930:	c6 45 f7 01          	movb   $0x1,-0x9(%ebp)
  102934:	f7 5d 08             	negl   0x8(%ebp)
  102937:	ff 4d f8             	decl   -0x8(%ebp)
  10293a:	8b 45 08             	mov    0x8(%ebp),%eax
  10293d:	b9 0a 00 00 00       	mov    $0xa,%ecx
  102942:	99                   	cltd   
  102943:	f7 f9                	idiv   %ecx
  102945:	89 d0                	mov    %edx,%eax
  102947:	83 c0 30             	add    $0x30,%eax
  10294a:	88 c2                	mov    %al,%dl
  10294c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10294f:	88 10                	mov    %dl,(%eax)
  102951:	ff 45 fc             	incl   -0x4(%ebp)
  102954:	8b 4d 08             	mov    0x8(%ebp),%ecx
  102957:	b8 67 66 66 66       	mov    $0x66666667,%eax
  10295c:	f7 e9                	imul   %ecx
  10295e:	c1 fa 02             	sar    $0x2,%edx
  102961:	89 c8                	mov    %ecx,%eax
  102963:	c1 f8 1f             	sar    $0x1f,%eax
  102966:	29 c2                	sub    %eax,%edx
  102968:	89 d0                	mov    %edx,%eax
  10296a:	89 45 08             	mov    %eax,0x8(%ebp)
  10296d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102971:	75 c4                	jne    102937 <i2A+0x39>
  102973:	80 7d f7 01          	cmpb   $0x1,-0x9(%ebp)
  102977:	75 0c                	jne    102985 <i2A+0x87>
  102979:	ff 4d f8             	decl   -0x8(%ebp)
  10297c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10297f:	c6 00 2d             	movb   $0x2d,(%eax)
  102982:	ff 45 fc             	incl   -0x4(%ebp)
  102985:	80 7d f6 01          	cmpb   $0x1,-0xa(%ebp)
  102989:	75 0b                	jne    102996 <i2A+0x98>
  10298b:	a0 9d 4a 10 00       	mov    0x104a9d,%al
  102990:	40                   	inc    %eax
  102991:	a2 9d 4a 10 00       	mov    %al,0x104a9d
  102996:	c6 05 9e 4a 10 00 00 	movb   $0x0,0x104a9e
  10299d:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029a0:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1029a3:	89 10                	mov    %edx,(%eax)
  1029a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1029a8:	c9                   	leave  
  1029a9:	c3                   	ret    

001029aa <append>:
  1029aa:	55                   	push   %ebp
  1029ab:	89 e5                	mov    %esp,%ebp
  1029ad:	83 ec 10             	sub    $0x10,%esp
  1029b0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1029b7:	eb 19                	jmp    1029d2 <append+0x28>
  1029b9:	ff 45 fc             	incl   -0x4(%ebp)
  1029bc:	8b 45 08             	mov    0x8(%ebp),%eax
  1029bf:	8d 50 01             	lea    0x1(%eax),%edx
  1029c2:	89 55 08             	mov    %edx,0x8(%ebp)
  1029c5:	8b 55 0c             	mov    0xc(%ebp),%edx
  1029c8:	8d 4a 01             	lea    0x1(%edx),%ecx
  1029cb:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  1029ce:	8a 12                	mov    (%edx),%dl
  1029d0:	88 10                	mov    %dl,(%eax)
  1029d2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029d5:	8a 00                	mov    (%eax),%al
  1029d7:	84 c0                	test   %al,%al
  1029d9:	75 de                	jne    1029b9 <append+0xf>
  1029db:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1029de:	c9                   	leave  
  1029df:	c3                   	ret    

001029e0 <i2X>:
  1029e0:	55                   	push   %ebp
  1029e1:	89 e5                	mov    %esp,%ebp
  1029e3:	83 ec 10             	sub    $0x10,%esp
  1029e6:	c7 45 fc be 4a 10 00 	movl   $0x104abe,-0x4(%ebp)
  1029ed:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  1029f4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1029fb:	ff 45 f8             	incl   -0x8(%ebp)
  1029fe:	8b 45 08             	mov    0x8(%ebp),%eax
  102a01:	83 e0 0f             	and    $0xf,%eax
  102a04:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102a07:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a0a:	83 e8 0a             	sub    $0xa,%eax
  102a0d:	83 f8 05             	cmp    $0x5,%eax
  102a10:	77 4b                	ja     102a5d <i2X+0x7d>
  102a12:	8b 04 85 6c 2f 10 00 	mov    0x102f6c(,%eax,4),%eax
  102a19:	ff e0                	jmp    *%eax
  102a1b:	ff 4d fc             	decl   -0x4(%ebp)
  102a1e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102a21:	c6 00 61             	movb   $0x61,(%eax)
  102a24:	eb 47                	jmp    102a6d <i2X+0x8d>
  102a26:	ff 4d fc             	decl   -0x4(%ebp)
  102a29:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102a2c:	c6 00 62             	movb   $0x62,(%eax)
  102a2f:	eb 3c                	jmp    102a6d <i2X+0x8d>
  102a31:	ff 4d fc             	decl   -0x4(%ebp)
  102a34:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102a37:	c6 00 63             	movb   $0x63,(%eax)
  102a3a:	eb 31                	jmp    102a6d <i2X+0x8d>
  102a3c:	ff 4d fc             	decl   -0x4(%ebp)
  102a3f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102a42:	c6 00 64             	movb   $0x64,(%eax)
  102a45:	eb 26                	jmp    102a6d <i2X+0x8d>
  102a47:	ff 4d fc             	decl   -0x4(%ebp)
  102a4a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102a4d:	c6 00 65             	movb   $0x65,(%eax)
  102a50:	eb 1b                	jmp    102a6d <i2X+0x8d>
  102a52:	ff 4d fc             	decl   -0x4(%ebp)
  102a55:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102a58:	c6 00 66             	movb   $0x66,(%eax)
  102a5b:	eb 10                	jmp    102a6d <i2X+0x8d>
  102a5d:	ff 4d fc             	decl   -0x4(%ebp)
  102a60:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a63:	83 c0 30             	add    $0x30,%eax
  102a66:	88 c2                	mov    %al,%dl
  102a68:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102a6b:	88 10                	mov    %dl,(%eax)
  102a6d:	8b 45 08             	mov    0x8(%ebp),%eax
  102a70:	c1 e8 04             	shr    $0x4,%eax
  102a73:	89 45 08             	mov    %eax,0x8(%ebp)
  102a76:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102a7a:	0f 85 7b ff ff ff    	jne    1029fb <i2X+0x1b>
  102a80:	c6 05 be 4a 10 00 00 	movb   $0x0,0x104abe
  102a87:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a8a:	8b 55 fc             	mov    -0x4(%ebp),%edx
  102a8d:	89 10                	mov    %edx,(%eax)
  102a8f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102a92:	c9                   	leave  
  102a93:	c3                   	ret    

00102a94 <printk_char>:
  102a94:	55                   	push   %ebp
  102a95:	89 e5                	mov    %esp,%ebp
  102a97:	83 ec 08             	sub    $0x8,%esp
  102a9a:	eb 17                	jmp    102ab3 <printk_char+0x1f>
  102a9c:	8b 45 08             	mov    0x8(%ebp),%eax
  102a9f:	8a 00                	mov    (%eax),%al
  102aa1:	0f be c0             	movsbl %al,%eax
  102aa4:	83 ec 0c             	sub    $0xc,%esp
  102aa7:	50                   	push   %eax
  102aa8:	e8 c5 ea ff ff       	call   101572 <putChar>
  102aad:	83 c4 10             	add    $0x10,%esp
  102ab0:	ff 45 08             	incl   0x8(%ebp)
  102ab3:	8b 45 08             	mov    0x8(%ebp),%eax
  102ab6:	8a 00                	mov    (%eax),%al
  102ab8:	84 c0                	test   %al,%al
  102aba:	75 e0                	jne    102a9c <printk_char+0x8>
  102abc:	b8 01 00 00 00       	mov    $0x1,%eax
  102ac1:	c9                   	leave  
  102ac2:	c3                   	ret    

00102ac3 <printk>:
  102ac3:	55                   	push   %ebp
  102ac4:	89 e5                	mov    %esp,%ebp
  102ac6:	83 ec 28             	sub    $0x28,%esp
  102ac9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102ad0:	8d 45 0c             	lea    0xc(%ebp),%eax
  102ad3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ad6:	8b 45 08             	mov    0x8(%ebp),%eax
  102ad9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102adc:	c7 45 e8 58 00 00 00 	movl   $0x58,-0x18(%ebp)
  102ae3:	e9 57 01 00 00       	jmp    102c3f <printk+0x17c>
  102ae8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102aeb:	8a 00                	mov    (%eax),%al
  102aed:	3c 25                	cmp    $0x25,%al
  102aef:	75 56                	jne    102b47 <printk+0x84>
  102af1:	ff 45 ec             	incl   -0x14(%ebp)
  102af4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102af7:	8a 00                	mov    (%eax),%al
  102af9:	0f be c0             	movsbl %al,%eax
  102afc:	83 f8 64             	cmp    $0x64,%eax
  102aff:	74 18                	je     102b19 <printk+0x56>
  102b01:	83 f8 64             	cmp    $0x64,%eax
  102b04:	7f 07                	jg     102b0d <printk+0x4a>
  102b06:	83 f8 63             	cmp    $0x63,%eax
  102b09:	74 29                	je     102b34 <printk+0x71>
  102b0b:	eb 30                	jmp    102b3d <printk+0x7a>
  102b0d:	83 f8 73             	cmp    $0x73,%eax
  102b10:	74 19                	je     102b2b <printk+0x68>
  102b12:	83 f8 78             	cmp    $0x78,%eax
  102b15:	74 0b                	je     102b22 <printk+0x5f>
  102b17:	eb 24                	jmp    102b3d <printk+0x7a>
  102b19:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
  102b20:	eb 2c                	jmp    102b4e <printk+0x8b>
  102b22:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  102b29:	eb 23                	jmp    102b4e <printk+0x8b>
  102b2b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  102b32:	eb 1a                	jmp    102b4e <printk+0x8b>
  102b34:	c7 45 e8 03 00 00 00 	movl   $0x3,-0x18(%ebp)
  102b3b:	eb 11                	jmp    102b4e <printk+0x8b>
  102b3d:	c7 45 e8 58 00 00 00 	movl   $0x58,-0x18(%ebp)
  102b44:	90                   	nop
  102b45:	eb 07                	jmp    102b4e <printk+0x8b>
  102b47:	c7 45 e8 58 00 00 00 	movl   $0x58,-0x18(%ebp)
  102b4e:	83 7d e8 58          	cmpl   $0x58,-0x18(%ebp)
  102b52:	75 19                	jne    102b6d <printk+0xaa>
  102b54:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b57:	8d 50 01             	lea    0x1(%eax),%edx
  102b5a:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102b5d:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102b60:	8a 12                	mov    (%edx),%dl
  102b62:	88 90 80 42 10 00    	mov    %dl,0x104280(%eax)
  102b68:	e9 cf 00 00 00       	jmp    102c3c <printk+0x179>
  102b6d:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
  102b71:	75 3f                	jne    102bb2 <printk+0xef>
  102b73:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  102b7a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b7d:	8d 50 04             	lea    0x4(%eax),%edx
  102b80:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102b83:	8b 00                	mov    (%eax),%eax
  102b85:	89 c2                	mov    %eax,%edx
  102b87:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  102b8a:	50                   	push   %eax
  102b8b:	52                   	push   %edx
  102b8c:	e8 6d fd ff ff       	call   1028fe <i2A>
  102b91:	83 c4 08             	add    $0x8,%esp
  102b94:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102b97:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102b9a:	81 c2 80 42 10 00    	add    $0x104280,%edx
  102ba0:	50                   	push   %eax
  102ba1:	52                   	push   %edx
  102ba2:	e8 03 fe ff ff       	call   1029aa <append>
  102ba7:	83 c4 08             	add    $0x8,%esp
  102baa:	01 45 f4             	add    %eax,-0xc(%ebp)
  102bad:	e9 8a 00 00 00       	jmp    102c3c <printk+0x179>
  102bb2:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
  102bb6:	75 3a                	jne    102bf2 <printk+0x12f>
  102bb8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  102bbf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bc2:	8d 50 04             	lea    0x4(%eax),%edx
  102bc5:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102bc8:	8b 00                	mov    (%eax),%eax
  102bca:	8d 55 e0             	lea    -0x20(%ebp),%edx
  102bcd:	52                   	push   %edx
  102bce:	50                   	push   %eax
  102bcf:	e8 0c fe ff ff       	call   1029e0 <i2X>
  102bd4:	83 c4 08             	add    $0x8,%esp
  102bd7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102bda:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102bdd:	81 c2 80 42 10 00    	add    $0x104280,%edx
  102be3:	50                   	push   %eax
  102be4:	52                   	push   %edx
  102be5:	e8 c0 fd ff ff       	call   1029aa <append>
  102bea:	83 c4 08             	add    $0x8,%esp
  102bed:	01 45 f4             	add    %eax,-0xc(%ebp)
  102bf0:	eb 4a                	jmp    102c3c <printk+0x179>
  102bf2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102bf6:	75 24                	jne    102c1c <printk+0x159>
  102bf8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bfb:	8d 50 04             	lea    0x4(%eax),%edx
  102bfe:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102c01:	8b 00                	mov    (%eax),%eax
  102c03:	89 c2                	mov    %eax,%edx
  102c05:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c08:	05 80 42 10 00       	add    $0x104280,%eax
  102c0d:	52                   	push   %edx
  102c0e:	50                   	push   %eax
  102c0f:	e8 96 fd ff ff       	call   1029aa <append>
  102c14:	83 c4 08             	add    $0x8,%esp
  102c17:	01 45 f4             	add    %eax,-0xc(%ebp)
  102c1a:	eb 20                	jmp    102c3c <printk+0x179>
  102c1c:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  102c20:	75 1a                	jne    102c3c <printk+0x179>
  102c22:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c25:	8d 50 01             	lea    0x1(%eax),%edx
  102c28:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102c2b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102c2e:	8d 4a 04             	lea    0x4(%edx),%ecx
  102c31:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  102c34:	8b 12                	mov    (%edx),%edx
  102c36:	88 90 80 42 10 00    	mov    %dl,0x104280(%eax)
  102c3c:	ff 45 ec             	incl   -0x14(%ebp)
  102c3f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102c42:	8a 00                	mov    (%eax),%al
  102c44:	84 c0                	test   %al,%al
  102c46:	0f 85 9c fe ff ff    	jne    102ae8 <printk+0x25>
  102c4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c4f:	8d 50 01             	lea    0x1(%eax),%edx
  102c52:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102c55:	c6 80 80 42 10 00 00 	movb   $0x0,0x104280(%eax)
  102c5c:	83 ec 08             	sub    $0x8,%esp
  102c5f:	68 00 04 00 00       	push   $0x400
  102c64:	68 80 42 10 00       	push   $0x104280
  102c69:	e8 26 fe ff ff       	call   102a94 <printk_char>
  102c6e:	83 c4 10             	add    $0x10,%esp
  102c71:	90                   	nop
  102c72:	c9                   	leave  
  102c73:	c3                   	ret    

00102c74 <waitForInterrupt>:
  102c74:	55                   	push   %ebp
  102c75:	89 e5                	mov    %esp,%ebp
  102c77:	f4                   	hlt    
  102c78:	90                   	nop
  102c79:	5d                   	pop    %ebp
  102c7a:	c3                   	ret    

00102c7b <disableInterrupt>:
  102c7b:	55                   	push   %ebp
  102c7c:	89 e5                	mov    %esp,%ebp
  102c7e:	fa                   	cli    
  102c7f:	90                   	nop
  102c80:	5d                   	pop    %ebp
  102c81:	c3                   	ret    

00102c82 <i2A>:
  102c82:	55                   	push   %ebp
  102c83:	89 e5                	mov    %esp,%ebp
  102c85:	83 ec 10             	sub    $0x10,%esp
  102c88:	c7 45 fc dd 4a 10 00 	movl   $0x104add,-0x4(%ebp)
  102c8f:	ff 4d fc             	decl   -0x4(%ebp)
  102c92:	8b 45 08             	mov    0x8(%ebp),%eax
  102c95:	b9 0a 00 00 00       	mov    $0xa,%ecx
  102c9a:	99                   	cltd   
  102c9b:	f7 f9                	idiv   %ecx
  102c9d:	89 d0                	mov    %edx,%eax
  102c9f:	83 c0 30             	add    $0x30,%eax
  102ca2:	88 c2                	mov    %al,%dl
  102ca4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ca7:	88 10                	mov    %dl,(%eax)
  102ca9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  102cac:	b8 67 66 66 66       	mov    $0x66666667,%eax
  102cb1:	f7 e9                	imul   %ecx
  102cb3:	c1 fa 02             	sar    $0x2,%edx
  102cb6:	89 c8                	mov    %ecx,%eax
  102cb8:	c1 f8 1f             	sar    $0x1f,%eax
  102cbb:	29 c2                	sub    %eax,%edx
  102cbd:	89 d0                	mov    %edx,%eax
  102cbf:	89 45 08             	mov    %eax,0x8(%ebp)
  102cc2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102cc6:	75 c7                	jne    102c8f <i2A+0xd>
  102cc8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ccb:	c9                   	leave  
  102ccc:	c3                   	ret    

00102ccd <append>:
  102ccd:	55                   	push   %ebp
  102cce:	89 e5                	mov    %esp,%ebp
  102cd0:	eb 1a                	jmp    102cec <append+0x1f>
  102cd2:	8b 45 08             	mov    0x8(%ebp),%eax
  102cd5:	8b 00                	mov    (%eax),%eax
  102cd7:	8d 48 01             	lea    0x1(%eax),%ecx
  102cda:	8b 55 08             	mov    0x8(%ebp),%edx
  102cdd:	89 0a                	mov    %ecx,(%edx)
  102cdf:	8b 55 0c             	mov    0xc(%ebp),%edx
  102ce2:	8d 4a 01             	lea    0x1(%edx),%ecx
  102ce5:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  102ce8:	8a 12                	mov    (%edx),%dl
  102cea:	88 10                	mov    %dl,(%eax)
  102cec:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cef:	8a 00                	mov    (%eax),%al
  102cf1:	84 c0                	test   %al,%al
  102cf3:	75 dd                	jne    102cd2 <append+0x5>
  102cf5:	90                   	nop
  102cf6:	5d                   	pop    %ebp
  102cf7:	c3                   	ret    

00102cf8 <displayMessage>:
  102cf8:	55                   	push   %ebp
  102cf9:	89 e5                	mov    %esp,%ebp
  102cfb:	83 ec 18             	sub    $0x18,%esp
  102cfe:	b8 52 41 10 00       	mov    $0x104152,%eax
  102d03:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d06:	ff 75 08             	pushl  0x8(%ebp)
  102d09:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102d0c:	50                   	push   %eax
  102d0d:	e8 bb ff ff ff       	call   102ccd <append>
  102d12:	83 c4 08             	add    $0x8,%esp
  102d15:	68 84 2f 10 00       	push   $0x102f84
  102d1a:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102d1d:	50                   	push   %eax
  102d1e:	e8 aa ff ff ff       	call   102ccd <append>
  102d23:	83 c4 08             	add    $0x8,%esp
  102d26:	ff 75 0c             	pushl  0xc(%ebp)
  102d29:	e8 54 ff ff ff       	call   102c82 <i2A>
  102d2e:	83 c4 04             	add    $0x4,%esp
  102d31:	50                   	push   %eax
  102d32:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102d35:	50                   	push   %eax
  102d36:	e8 92 ff ff ff       	call   102ccd <append>
  102d3b:	83 c4 08             	add    $0x8,%esp
  102d3e:	68 86 2f 10 00       	push   $0x102f86
  102d43:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102d46:	50                   	push   %eax
  102d47:	e8 81 ff ff ff       	call   102ccd <append>
  102d4c:	83 c4 08             	add    $0x8,%esp
  102d4f:	c7 45 f4 40 41 10 00 	movl   $0x104140,-0xc(%ebp)
  102d56:	eb 1b                	jmp    102d73 <displayMessage+0x7b>
  102d58:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d5b:	8a 00                	mov    (%eax),%al
  102d5d:	0f be c0             	movsbl %al,%eax
  102d60:	83 ec 0c             	sub    $0xc,%esp
  102d63:	50                   	push   %eax
  102d64:	e8 09 e8 ff ff       	call   101572 <putChar>
  102d69:	83 c4 10             	add    $0x10,%esp
  102d6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d6f:	40                   	inc    %eax
  102d70:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d73:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d76:	8a 00                	mov    (%eax),%al
  102d78:	84 c0                	test   %al,%al
  102d7a:	75 dc                	jne    102d58 <displayMessage+0x60>
  102d7c:	90                   	nop
  102d7d:	c9                   	leave  
  102d7e:	c3                   	ret    

00102d7f <abort>:
  102d7f:	55                   	push   %ebp
  102d80:	89 e5                	mov    %esp,%ebp
  102d82:	83 ec 08             	sub    $0x8,%esp
  102d85:	e8 f1 fe ff ff       	call   102c7b <disableInterrupt>
  102d8a:	83 ec 08             	sub    $0x8,%esp
  102d8d:	ff 75 0c             	pushl  0xc(%ebp)
  102d90:	ff 75 08             	pushl  0x8(%ebp)
  102d93:	e8 60 ff ff ff       	call   102cf8 <displayMessage>
  102d98:	83 c4 10             	add    $0x10,%esp
  102d9b:	e8 d4 fe ff ff       	call   102c74 <waitForInterrupt>
  102da0:	eb f9                	jmp    102d9b <abort+0x1c>

00102da2 <irqEmpty>:
  102da2:	6a 00                	push   $0x0
  102da4:	6a ff                	push   $0xffffffff
  102da6:	eb 13                	jmp    102dbb <asmDoIrq>

00102da8 <irqGProtectFault>:
  102da8:	6a 0d                	push   $0xd
  102daa:	eb 0f                	jmp    102dbb <asmDoIrq>

00102dac <irqSyscall>:
  102dac:	6a 00                	push   $0x0
  102dae:	68 80 00 00 00       	push   $0x80
  102db3:	eb 06                	jmp    102dbb <asmDoIrq>

00102db5 <irqTime>:
  102db5:	6a 00                	push   $0x0
  102db7:	6a 20                	push   $0x20
  102db9:	eb 00                	jmp    102dbb <asmDoIrq>

00102dbb <asmDoIrq>:
  102dbb:	60                   	pusha  
  102dbc:	1e                   	push   %ds
  102dbd:	06                   	push   %es
  102dbe:	0f a0                	push   %fs
  102dc0:	0f a8                	push   %gs
  102dc2:	54                   	push   %esp
  102dc3:	e8 1f f3 ff ff       	call   1020e7 <irqHandle>
  102dc8:	5c                   	pop    %esp
  102dc9:	0f a9                	pop    %gs
  102dcb:	0f a1                	pop    %fs
  102dcd:	07                   	pop    %es
  102dce:	1f                   	pop    %ds
  102dcf:	61                   	popa   
  102dd0:	83 c4 04             	add    $0x4,%esp
  102dd3:	83 c4 04             	add    $0x4,%esp
  102dd6:	cf                   	iret   
