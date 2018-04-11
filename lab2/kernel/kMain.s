
kMain.elf:     file format elf32-i386


Disassembly of section .text:

00100000 <abort>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	57                   	push   %edi
  100004:	56                   	push   %esi
  100005:	53                   	push   %ebx
  100006:	83 ec 1c             	sub    $0x1c,%esp
  100009:	8b 55 08             	mov    0x8(%ebp),%edx
  10000c:	fa                   	cli    
  10000d:	8a 02                	mov    (%edx),%al
  10000f:	b9 12 10 10 00       	mov    $0x101012,%ecx
  100014:	84 c0                	test   %al,%al
  100016:	74 0b                	je     100023 <abort+0x23>
  100018:	41                   	inc    %ecx
  100019:	42                   	inc    %edx
  10001a:	88 41 ff             	mov    %al,-0x1(%ecx)
  10001d:	8a 02                	mov    (%edx),%al
  10001f:	84 c0                	test   %al,%al
  100021:	75 f5                	jne    100018 <abort+0x18>
  100023:	c6 01 3a             	movb   $0x3a,(%ecx)
  100026:	bb 1d 11 10 00       	mov    $0x10111d,%ebx
  10002b:	be 0a 00 00 00       	mov    $0xa,%esi
  100030:	bf 67 66 66 66       	mov    $0x66666667,%edi
  100035:	4b                   	dec    %ebx
  100036:	8b 45 0c             	mov    0xc(%ebp),%eax
  100039:	99                   	cltd   
  10003a:	f7 fe                	idiv   %esi
  10003c:	8d 42 30             	lea    0x30(%edx),%eax
  10003f:	88 45 e7             	mov    %al,-0x19(%ebp)
  100042:	88 03                	mov    %al,(%ebx)
  100044:	89 f8                	mov    %edi,%eax
  100046:	f7 6d 0c             	imull  0xc(%ebp)
  100049:	c1 fa 02             	sar    $0x2,%edx
  10004c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10004f:	c1 f8 1f             	sar    $0x1f,%eax
  100052:	29 c2                	sub    %eax,%edx
  100054:	89 55 0c             	mov    %edx,0xc(%ebp)
  100057:	75 dc                	jne    100035 <abort+0x35>
  100059:	41                   	inc    %ecx
  10005a:	41                   	inc    %ecx
  10005b:	43                   	inc    %ebx
  10005c:	8a 45 e7             	mov    -0x19(%ebp),%al
  10005f:	88 41 ff             	mov    %al,-0x1(%ecx)
  100062:	8a 03                	mov    (%ebx),%al
  100064:	88 45 e7             	mov    %al,-0x19(%ebp)
  100067:	84 c0                	test   %al,%al
  100069:	75 ef                	jne    10005a <abort+0x5a>
  10006b:	c6 01 0a             	movb   $0xa,(%ecx)
  10006e:	0f be 05 00 10 10 00 	movsbl 0x101000,%eax
  100075:	84 c0                	test   %al,%al
  100077:	74 1b                	je     100094 <abort+0x94>
  100079:	bb 00 10 10 00       	mov    $0x101000,%ebx
  10007e:	83 ec 0c             	sub    $0xc,%esp
  100081:	50                   	push   %eax
  100082:	e8 51 00 00 00       	call   1000d8 <putChar>
  100087:	43                   	inc    %ebx
  100088:	0f be 03             	movsbl (%ebx),%eax
  10008b:	83 c4 10             	add    $0x10,%esp
  10008e:	84 c0                	test   %al,%al
  100090:	75 ec                	jne    10007e <abort+0x7e>
  100092:	66 90                	xchg   %ax,%ax
  100094:	f4                   	hlt    
  100095:	eb fd                	jmp    100094 <abort+0x94>
  100097:	90                   	nop

00100098 <initSerial>:
  100098:	55                   	push   %ebp
  100099:	89 e5                	mov    %esp,%ebp
  10009b:	ba f9 03 00 00       	mov    $0x3f9,%edx
  1000a0:	31 c0                	xor    %eax,%eax
  1000a2:	ee                   	out    %al,(%dx)
  1000a3:	ba fb 03 00 00       	mov    $0x3fb,%edx
  1000a8:	b0 80                	mov    $0x80,%al
  1000aa:	ee                   	out    %al,(%dx)
  1000ab:	ba f8 03 00 00       	mov    $0x3f8,%edx
  1000b0:	b0 01                	mov    $0x1,%al
  1000b2:	ee                   	out    %al,(%dx)
  1000b3:	ba f9 03 00 00       	mov    $0x3f9,%edx
  1000b8:	31 c0                	xor    %eax,%eax
  1000ba:	ee                   	out    %al,(%dx)
  1000bb:	ba fb 03 00 00       	mov    $0x3fb,%edx
  1000c0:	b0 03                	mov    $0x3,%al
  1000c2:	ee                   	out    %al,(%dx)
  1000c3:	ba fa 03 00 00       	mov    $0x3fa,%edx
  1000c8:	b0 c7                	mov    $0xc7,%al
  1000ca:	ee                   	out    %al,(%dx)
  1000cb:	ba fc 03 00 00       	mov    $0x3fc,%edx
  1000d0:	b0 0b                	mov    $0xb,%al
  1000d2:	ee                   	out    %al,(%dx)
  1000d3:	5d                   	pop    %ebp
  1000d4:	c3                   	ret    
  1000d5:	8d 76 00             	lea    0x0(%esi),%esi

001000d8 <putChar>:
  1000d8:	55                   	push   %ebp
  1000d9:	89 e5                	mov    %esp,%ebp
  1000db:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1000de:	ba fd 03 00 00       	mov    $0x3fd,%edx
  1000e3:	90                   	nop
  1000e4:	ec                   	in     (%dx),%al
  1000e5:	a8 20                	test   $0x20,%al
  1000e7:	74 fb                	je     1000e4 <putChar+0xc>
  1000e9:	ba f8 03 00 00       	mov    $0x3f8,%edx
  1000ee:	88 c8                	mov    %cl,%al
  1000f0:	ee                   	out    %al,(%dx)
  1000f1:	5d                   	pop    %ebp
  1000f2:	c3                   	ret    
  1000f3:	90                   	nop

001000f4 <printkernel>:
  1000f4:	55                   	push   %ebp
  1000f5:	89 e5                	mov    %esp,%ebp
  1000f7:	57                   	push   %edi
  1000f8:	56                   	push   %esi
  1000f9:	53                   	push   %ebx
  1000fa:	83 ec 0c             	sub    $0xc,%esp
  1000fd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100100:	0f be 03             	movsbl (%ebx),%eax
  100103:	84 c0                	test   %al,%al
  100105:	75 13                	jne    10011a <printkernel+0x26>
  100107:	eb 6b                	jmp    100174 <printkernel+0x80>
  100109:	8d 76 00             	lea    0x0(%esi),%esi
  10010c:	89 15 20 11 10 00    	mov    %edx,0x101120
  100112:	43                   	inc    %ebx
  100113:	0f be 03             	movsbl (%ebx),%eax
  100116:	84 c0                	test   %al,%al
  100118:	74 5a                	je     100174 <printkernel+0x80>
  10011a:	83 ec 0c             	sub    $0xc,%esp
  10011d:	50                   	push   %eax
  10011e:	e8 b5 ff ff ff       	call   1000d8 <putChar>
  100123:	8a 03                	mov    (%ebx),%al
  100125:	83 c4 10             	add    $0x10,%esp
  100128:	3c 0a                	cmp    $0xa,%al
  10012a:	74 58                	je     100184 <printkernel+0x90>
  10012c:	8b 15 20 11 10 00    	mov    0x101120,%edx
  100132:	8b 0d 24 11 10 00    	mov    0x101124,%ecx
  100138:	8d 34 89             	lea    (%ecx,%ecx,4),%esi
  10013b:	c1 e6 04             	shl    $0x4,%esi
  10013e:	01 d6                	add    %edx,%esi
  100140:	01 f6                	add    %esi,%esi
  100142:	89 f7                	mov    %esi,%edi
  100144:	0f be f0             	movsbl %al,%esi
  100147:	81 ce 00 0c 00 00    	or     $0xc00,%esi
  10014d:	66 89 f0             	mov    %si,%ax
  100150:	65 67 66 89 04       	mov    %ax,%gs:(%si)
  100155:	42                   	inc    %edx
  100156:	83 fa 50             	cmp    $0x50,%edx
  100159:	75 b1                	jne    10010c <printkernel+0x18>
  10015b:	c7 05 20 11 10 00 00 	movl   $0x0,0x101120
  100162:	00 00 00 
  100165:	41                   	inc    %ecx
  100166:	89 0d 24 11 10 00    	mov    %ecx,0x101124
  10016c:	43                   	inc    %ebx
  10016d:	0f be 03             	movsbl (%ebx),%eax
  100170:	84 c0                	test   %al,%al
  100172:	75 a6                	jne    10011a <printkernel+0x26>
  100174:	b8 01 00 00 00       	mov    $0x1,%eax
  100179:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10017c:	5b                   	pop    %ebx
  10017d:	5e                   	pop    %esi
  10017e:	5f                   	pop    %edi
  10017f:	5d                   	pop    %ebp
  100180:	c3                   	ret    
  100181:	8d 76 00             	lea    0x0(%esi),%esi
  100184:	c7 05 20 11 10 00 00 	movl   $0x0,0x101120
  10018b:	00 00 00 
  10018e:	ff 05 24 11 10 00    	incl   0x101124
  100194:	e9 79 ff ff ff       	jmp    100112 <printkernel+0x1e>
  100199:	8d 76 00             	lea    0x0(%esi),%esi

0010019c <sys_write>:
  10019c:	55                   	push   %ebp
  10019d:	89 e5                	mov    %esp,%ebp
  10019f:	57                   	push   %edi
  1001a0:	56                   	push   %esi
  1001a1:	53                   	push   %ebx
  1001a2:	83 ec 0c             	sub    $0xc,%esp
  1001a5:	89 c3                	mov    %eax,%ebx
  1001a7:	8b 70 14             	mov    0x14(%eax),%esi
  1001aa:	8b 78 18             	mov    0x18(%eax),%edi
  1001ad:	83 78 10 01          	cmpl   $0x1,0x10(%eax)
  1001b1:	74 12                	je     1001c5 <sys_write+0x29>
  1001b3:	83 ec 08             	sub    $0x8,%esp
  1001b6:	6a 38                	push   $0x38
  1001b8:	68 b4 06 10 00       	push   $0x1006b4
  1001bd:	e8 3e fe ff ff       	call   100000 <abort>
  1001c2:	83 c4 10             	add    $0x10,%esp
  1001c5:	83 ec 08             	sub    $0x8,%esp
  1001c8:	56                   	push   %esi
  1001c9:	57                   	push   %edi
  1001ca:	e8 25 ff ff ff       	call   1000f4 <printkernel>
  1001cf:	89 73 1c             	mov    %esi,0x1c(%ebx)
  1001d2:	83 c4 10             	add    $0x10,%esp
  1001d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1001d8:	5b                   	pop    %ebx
  1001d9:	5e                   	pop    %esi
  1001da:	5f                   	pop    %edi
  1001db:	5d                   	pop    %ebp
  1001dc:	c3                   	ret    
  1001dd:	8d 76 00             	lea    0x0(%esi),%esi

001001e0 <irqHandle>:
  1001e0:	55                   	push   %ebp
  1001e1:	89 e5                	mov    %esp,%ebp
  1001e3:	83 ec 08             	sub    $0x8,%esp
  1001e6:	8b 45 08             	mov    0x8(%ebp),%eax
  1001e9:	8b 50 20             	mov    0x20(%eax),%edx
  1001ec:	83 fa 0d             	cmp    $0xd,%edx
  1001ef:	74 37                	je     100228 <irqHandle+0x48>
  1001f1:	81 fa 80 00 00 00    	cmp    $0x80,%edx
  1001f7:	74 17                	je     100210 <irqHandle+0x30>
  1001f9:	42                   	inc    %edx
  1001fa:	74 12                	je     10020e <irqHandle+0x2e>
  1001fc:	83 ec 08             	sub    $0x8,%esp
  1001ff:	6a 1c                	push   $0x1c
  100201:	68 b4 06 10 00       	push   $0x1006b4
  100206:	e8 f5 fd ff ff       	call   100000 <abort>
  10020b:	83 c4 10             	add    $0x10,%esp
  10020e:	c9                   	leave  
  10020f:	c3                   	ret    
  100210:	83 78 1c 04          	cmpl   $0x4,0x1c(%eax)
  100214:	75 f8                	jne    10020e <irqHandle+0x2e>
  100216:	e8 81 ff ff ff       	call   10019c <sys_write>
  10021b:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
  100222:	c9                   	leave  
  100223:	e9 d8 02 00 00       	jmp    100500 <enterUserSpace>
  100228:	83 ec 08             	sub    $0x8,%esp
  10022b:	6a 56                	push   $0x56
  10022d:	68 b4 06 10 00       	push   $0x1006b4
  100232:	e8 c9 fd ff ff       	call   100000 <abort>
  100237:	83 c4 10             	add    $0x10,%esp
  10023a:	c9                   	leave  
  10023b:	c3                   	ret    

0010023c <fs_write>:
  10023c:	55                   	push   %ebp
  10023d:	89 e5                	mov    %esp,%ebp
  10023f:	53                   	push   %ebx
  100240:	50                   	push   %eax
  100241:	8b 5d 10             	mov    0x10(%ebp),%ebx
  100244:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  100248:	74 12                	je     10025c <fs_write+0x20>
  10024a:	83 ec 08             	sub    $0x8,%esp
  10024d:	6a 38                	push   $0x38
  10024f:	68 b4 06 10 00       	push   $0x1006b4
  100254:	e8 a7 fd ff ff       	call   100000 <abort>
  100259:	83 c4 10             	add    $0x10,%esp
  10025c:	83 ec 08             	sub    $0x8,%esp
  10025f:	53                   	push   %ebx
  100260:	ff 75 0c             	pushl  0xc(%ebp)
  100263:	e8 8c fe ff ff       	call   1000f4 <printkernel>
  100268:	89 d8                	mov    %ebx,%eax
  10026a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10026d:	c9                   	leave  
  10026e:	c3                   	ret    
  10026f:	90                   	nop

00100270 <syscallHandle>:
  100270:	55                   	push   %ebp
  100271:	89 e5                	mov    %esp,%ebp
  100273:	83 ec 08             	sub    $0x8,%esp
  100276:	8b 45 08             	mov    0x8(%ebp),%eax
  100279:	83 78 1c 04          	cmpl   $0x4,0x1c(%eax)
  10027d:	74 05                	je     100284 <syscallHandle+0x14>
  10027f:	c9                   	leave  
  100280:	c3                   	ret    
  100281:	8d 76 00             	lea    0x0(%esi),%esi
  100284:	e8 13 ff ff ff       	call   10019c <sys_write>
  100289:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
  100290:	c9                   	leave  
  100291:	e9 6a 02 00 00       	jmp    100500 <enterUserSpace>
  100296:	66 90                	xchg   %ax,%ax

00100298 <GProtectFaultHandle>:
  100298:	55                   	push   %ebp
  100299:	89 e5                	mov    %esp,%ebp
  10029b:	83 ec 10             	sub    $0x10,%esp
  10029e:	6a 56                	push   $0x56
  1002a0:	68 b4 06 10 00       	push   $0x1006b4
  1002a5:	e8 56 fd ff ff       	call   100000 <abort>
  1002aa:	83 c4 10             	add    $0x10,%esp
  1002ad:	c9                   	leave  
  1002ae:	c3                   	ret    
  1002af:	90                   	nop

001002b0 <initIntr>:
  1002b0:	55                   	push   %ebp
  1002b1:	89 e5                	mov    %esp,%ebp
  1002b3:	ba 21 00 00 00       	mov    $0x21,%edx
  1002b8:	b0 ff                	mov    $0xff,%al
  1002ba:	ee                   	out    %al,(%dx)
  1002bb:	ba a1 00 00 00       	mov    $0xa1,%edx
  1002c0:	ee                   	out    %al,(%dx)
  1002c1:	ba 20 00 00 00       	mov    $0x20,%edx
  1002c6:	b0 11                	mov    $0x11,%al
  1002c8:	ee                   	out    %al,(%dx)
  1002c9:	ba 21 00 00 00       	mov    $0x21,%edx
  1002ce:	b0 20                	mov    $0x20,%al
  1002d0:	ee                   	out    %al,(%dx)
  1002d1:	b0 04                	mov    $0x4,%al
  1002d3:	ee                   	out    %al,(%dx)
  1002d4:	b0 03                	mov    $0x3,%al
  1002d6:	ee                   	out    %al,(%dx)
  1002d7:	ba a0 00 00 00       	mov    $0xa0,%edx
  1002dc:	b0 11                	mov    $0x11,%al
  1002de:	ee                   	out    %al,(%dx)
  1002df:	ba a1 00 00 00       	mov    $0xa1,%edx
  1002e4:	b0 28                	mov    $0x28,%al
  1002e6:	ee                   	out    %al,(%dx)
  1002e7:	b0 02                	mov    $0x2,%al
  1002e9:	ee                   	out    %al,(%dx)
  1002ea:	b0 03                	mov    $0x3,%al
  1002ec:	ee                   	out    %al,(%dx)
  1002ed:	ba 20 00 00 00       	mov    $0x20,%edx
  1002f2:	b0 68                	mov    $0x68,%al
  1002f4:	ee                   	out    %al,(%dx)
  1002f5:	b0 0a                	mov    $0xa,%al
  1002f7:	ee                   	out    %al,(%dx)
  1002f8:	ba a0 00 00 00       	mov    $0xa0,%edx
  1002fd:	b0 68                	mov    $0x68,%al
  1002ff:	ee                   	out    %al,(%dx)
  100300:	b0 0a                	mov    $0xa,%al
  100302:	ee                   	out    %al,(%dx)
  100303:	5d                   	pop    %ebp
  100304:	c3                   	ret    
  100305:	66 90                	xchg   %ax,%ax
  100307:	90                   	nop

00100308 <waitDisk>:
  100308:	55                   	push   %ebp
  100309:	89 e5                	mov    %esp,%ebp
  10030b:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100310:	ec                   	in     (%dx),%al
  100311:	83 e0 c0             	and    $0xffffffc0,%eax
  100314:	3c 40                	cmp    $0x40,%al
  100316:	75 f8                	jne    100310 <waitDisk+0x8>
  100318:	5d                   	pop    %ebp
  100319:	c3                   	ret    
  10031a:	66 90                	xchg   %ax,%ax

0010031c <readSect>:
  10031c:	55                   	push   %ebp
  10031d:	89 e5                	mov    %esp,%ebp
  10031f:	53                   	push   %ebx
  100320:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100323:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100328:	ec                   	in     (%dx),%al
  100329:	83 e0 c0             	and    $0xffffffc0,%eax
  10032c:	3c 40                	cmp    $0x40,%al
  10032e:	75 f8                	jne    100328 <readSect+0xc>
  100330:	ba f2 01 00 00       	mov    $0x1f2,%edx
  100335:	b0 01                	mov    $0x1,%al
  100337:	ee                   	out    %al,(%dx)
  100338:	ba f3 01 00 00       	mov    $0x1f3,%edx
  10033d:	88 c8                	mov    %cl,%al
  10033f:	ee                   	out    %al,(%dx)
  100340:	89 c8                	mov    %ecx,%eax
  100342:	c1 f8 08             	sar    $0x8,%eax
  100345:	ba f4 01 00 00       	mov    $0x1f4,%edx
  10034a:	ee                   	out    %al,(%dx)
  10034b:	89 c8                	mov    %ecx,%eax
  10034d:	c1 f8 10             	sar    $0x10,%eax
  100350:	ba f5 01 00 00       	mov    $0x1f5,%edx
  100355:	ee                   	out    %al,(%dx)
  100356:	89 c8                	mov    %ecx,%eax
  100358:	c1 f8 18             	sar    $0x18,%eax
  10035b:	83 c8 e0             	or     $0xffffffe0,%eax
  10035e:	ba f6 01 00 00       	mov    $0x1f6,%edx
  100363:	ee                   	out    %al,(%dx)
  100364:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100369:	b0 20                	mov    $0x20,%al
  10036b:	ee                   	out    %al,(%dx)
  10036c:	ec                   	in     (%dx),%al
  10036d:	83 e0 c0             	and    $0xffffffc0,%eax
  100370:	3c 40                	cmp    $0x40,%al
  100372:	75 f8                	jne    10036c <readSect+0x50>
  100374:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100377:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  10037d:	ba f0 01 00 00       	mov    $0x1f0,%edx
  100382:	66 90                	xchg   %ax,%ax
  100384:	ed                   	in     (%dx),%eax
  100385:	89 01                	mov    %eax,(%ecx)
  100387:	83 c1 04             	add    $0x4,%ecx
  10038a:	39 d9                	cmp    %ebx,%ecx
  10038c:	75 f6                	jne    100384 <readSect+0x68>
  10038e:	5b                   	pop    %ebx
  10038f:	5d                   	pop    %ebp
  100390:	c3                   	ret    
  100391:	8d 76 00             	lea    0x0(%esi),%esi

00100394 <initSeg>:
  100394:	55                   	push   %ebp
  100395:	89 e5                	mov    %esp,%ebp
  100397:	b9 40 11 10 00       	mov    $0x101140,%ecx
  10039c:	66 c7 05 48 11 10 00 	movw   $0xffff,0x101148
  1003a3:	ff ff 
  1003a5:	66 c7 05 4a 11 10 00 	movw   $0x0,0x10114a
  1003ac:	00 00 
  1003ae:	c6 05 4c 11 10 00 00 	movb   $0x0,0x10114c
  1003b5:	c6 05 4d 11 10 00 9a 	movb   $0x9a,0x10114d
  1003bc:	c6 05 4e 11 10 00 cf 	movb   $0xcf,0x10114e
  1003c3:	c6 05 4f 11 10 00 00 	movb   $0x0,0x10114f
  1003ca:	66 c7 05 50 11 10 00 	movw   $0xffff,0x101150
  1003d1:	ff ff 
  1003d3:	66 c7 05 52 11 10 00 	movw   $0x0,0x101152
  1003da:	00 00 
  1003dc:	c6 05 54 11 10 00 00 	movb   $0x0,0x101154
  1003e3:	c6 05 55 11 10 00 92 	movb   $0x92,0x101155
  1003ea:	c6 05 56 11 10 00 cf 	movb   $0xcf,0x101156
  1003f1:	c6 05 57 11 10 00 00 	movb   $0x0,0x101157
  1003f8:	66 c7 05 58 11 10 00 	movw   $0xffff,0x101158
  1003ff:	ff ff 
  100401:	66 c7 05 5a 11 10 00 	movw   $0x0,0x10115a
  100408:	00 00 
  10040a:	c6 05 5c 11 10 00 00 	movb   $0x0,0x10115c
  100411:	c6 05 5d 11 10 00 fa 	movb   $0xfa,0x10115d
  100418:	c6 05 5e 11 10 00 cf 	movb   $0xcf,0x10115e
  10041f:	c6 05 5f 11 10 00 00 	movb   $0x0,0x10115f
  100426:	66 c7 05 60 11 10 00 	movw   $0xffff,0x101160
  10042d:	ff ff 
  10042f:	66 c7 05 62 11 10 00 	movw   $0x0,0x101162
  100436:	00 00 
  100438:	c6 05 64 11 10 00 00 	movb   $0x0,0x101164
  10043f:	c6 05 65 11 10 00 f2 	movb   $0xf2,0x101165
  100446:	c6 05 66 11 10 00 cf 	movb   $0xcf,0x101166
  10044d:	c6 05 67 11 10 00 00 	movb   $0x0,0x101167
  100454:	66 c7 05 68 11 10 00 	movw   $0x63,0x101168
  10045b:	63 00 
  10045d:	b8 80 11 10 00       	mov    $0x101180,%eax
  100462:	66 a3 6a 11 10 00    	mov    %ax,0x10116a
  100468:	89 c2                	mov    %eax,%edx
  10046a:	c1 ea 10             	shr    $0x10,%edx
  10046d:	88 15 6c 11 10 00    	mov    %dl,0x10116c
  100473:	c6 05 6d 11 10 00 89 	movb   $0x89,0x10116d
  10047a:	c6 05 6e 11 10 00 40 	movb   $0x40,0x10116e
  100481:	c1 e8 18             	shr    $0x18,%eax
  100484:	a2 6f 11 10 00       	mov    %al,0x10116f
  100489:	a1 c8 06 10 00       	mov    0x1006c8,%eax
  10048e:	8b 15 cc 06 10 00    	mov    0x1006cc,%edx
  100494:	a3 70 11 10 00       	mov    %eax,0x101170
  100499:	89 15 74 11 10 00    	mov    %edx,0x101174
  10049f:	66 c7 05 28 11 10 00 	movw   $0x37,0x101128
  1004a6:	37 00 
  1004a8:	66 89 0d 2a 11 10 00 	mov    %cx,0x10112a
  1004af:	c1 e9 10             	shr    $0x10,%ecx
  1004b2:	66 89 0d 2c 11 10 00 	mov    %cx,0x10112c
  1004b9:	b8 28 11 10 00       	mov    $0x101128,%eax
  1004be:	0f 01 10             	lgdtl  (%eax)
  1004c1:	b8 28 00 00 00       	mov    $0x28,%eax
  1004c6:	0f 00 d8             	ltr    %ax
  1004c9:	c7 05 88 11 10 00 10 	movl   $0x10,0x101188
  1004d0:	00 00 00 
  1004d3:	c7 05 84 11 10 00 00 	movl   $0x500000,0x101184
  1004da:	00 50 00 
  1004dd:	b8 10 00 00 00       	mov    $0x10,%eax
  1004e2:	8e d8                	mov    %eax,%ds
  1004e4:	b8 08 00 00 00       	mov    $0x8,%eax
  1004e9:	8e c8                	mov    %eax,%cs
  1004eb:	b8 10 00 00 00       	mov    $0x10,%eax
  1004f0:	8e c0                	mov    %eax,%es
  1004f2:	b8 30 00 00 00       	mov    $0x30,%eax
  1004f7:	8e e8                	mov    %eax,%gs
  1004f9:	31 c0                	xor    %eax,%eax
  1004fb:	0f 00 d0             	lldt   %ax
  1004fe:	5d                   	pop    %ebp
  1004ff:	c3                   	ret    

00100500 <enterUserSpace>:
  100500:	55                   	push   %ebp
  100501:	89 e5                	mov    %esp,%ebp
  100503:	66 8c c8             	mov    %cs,%ax
  100506:	66 8c c8             	mov    %cs,%ax
  100509:	cf                   	iret   
  10050a:	5d                   	pop    %ebp
  10050b:	c3                   	ret    

0010050c <loadUMain>:
  10050c:	55                   	push   %ebp
  10050d:	89 e5                	mov    %esp,%ebp
  10050f:	57                   	push   %edi
  100510:	56                   	push   %esi
  100511:	53                   	push   %ebx
  100512:	83 ec 0c             	sub    $0xc,%esp
  100515:	bb c9 00 00 00       	mov    $0xc9,%ebx
  10051a:	be 00 00 00 03       	mov    $0x3000000,%esi
  10051f:	90                   	nop
  100520:	53                   	push   %ebx
  100521:	56                   	push   %esi
  100522:	e8 f5 fd ff ff       	call   10031c <readSect>
  100527:	81 c6 00 02 00 00    	add    $0x200,%esi
  10052d:	43                   	inc    %ebx
  10052e:	58                   	pop    %eax
  10052f:	5a                   	pop    %edx
  100530:	81 fb 91 01 00 00    	cmp    $0x191,%ebx
  100536:	75 e8                	jne    100520 <loadUMain+0x14>
  100538:	a1 1c 00 00 03       	mov    0x300001c,%eax
  10053d:	8d 90 00 00 00 03    	lea    0x3000000(%eax),%edx
  100543:	0f b7 35 2c 00 00 03 	movzwl 0x300002c,%esi
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
  100578:	8a 8c 03 00 00 00 03 	mov    0x3000000(%ebx,%eax,1),%cl
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
  1005a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1005ab:	5b                   	pop    %ebx
  1005ac:	5e                   	pop    %esi
  1005ad:	5f                   	pop    %edi
  1005ae:	5d                   	pop    %ebp
  1005af:	ff 25 18 00 00 03    	jmp    *0x3000018
  1005b5:	66 90                	xchg   %ax,%ax
  1005b7:	90                   	nop

001005b8 <initIdt>:
  1005b8:	55                   	push   %ebp
  1005b9:	89 e5                	mov    %esp,%ebp
  1005bb:	53                   	push   %ebx
  1005bc:	ba 8d 06 10 00       	mov    $0x10068d,%edx
  1005c1:	89 d3                	mov    %edx,%ebx
  1005c3:	c1 ea 10             	shr    $0x10,%edx
  1005c6:	b9 00 1a 10 00       	mov    $0x101a00,%ecx
  1005cb:	b8 00 12 10 00       	mov    $0x101200,%eax
  1005d0:	66 89 18             	mov    %bx,(%eax)
  1005d3:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  1005d9:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  1005dd:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  1005e1:	66 89 50 06          	mov    %dx,0x6(%eax)
  1005e5:	83 c0 08             	add    $0x8,%eax
  1005e8:	39 c1                	cmp    %eax,%ecx
  1005ea:	75 e4                	jne    1005d0 <initIdt+0x18>
  1005ec:	b8 93 06 10 00       	mov    $0x100693,%eax
  1005f1:	66 a3 68 12 10 00    	mov    %ax,0x101268
  1005f7:	66 c7 05 6a 12 10 00 	movw   $0x8,0x10126a
  1005fe:	08 00 
  100600:	c6 05 6c 12 10 00 00 	movb   $0x0,0x10126c
  100607:	c6 05 6d 12 10 00 8f 	movb   $0x8f,0x10126d
  10060e:	c1 e8 10             	shr    $0x10,%eax
  100611:	66 a3 6e 12 10 00    	mov    %ax,0x10126e
  100617:	b8 97 06 10 00       	mov    $0x100697,%eax
  10061c:	66 a3 00 16 10 00    	mov    %ax,0x101600
  100622:	66 c7 05 02 16 10 00 	movw   $0x8,0x101602
  100629:	08 00 
  10062b:	c6 05 04 16 10 00 00 	movb   $0x0,0x101604
  100632:	c6 05 05 16 10 00 ee 	movb   $0xee,0x101605
  100639:	c1 e8 10             	shr    $0x10,%eax
  10063c:	66 a3 06 16 10 00    	mov    %ax,0x101606
  100642:	66 c7 05 30 11 10 00 	movw   $0x7ff,0x101130
  100649:	ff 07 
  10064b:	b8 00 12 10 00       	mov    $0x101200,%eax
  100650:	66 a3 32 11 10 00    	mov    %ax,0x101132
  100656:	c1 e8 10             	shr    $0x10,%eax
  100659:	66 a3 34 11 10 00    	mov    %ax,0x101134
  10065f:	b8 30 11 10 00       	mov    $0x101130,%eax
  100664:	0f 01 18             	lidtl  (%eax)
  100667:	5b                   	pop    %ebx
  100668:	5d                   	pop    %ebp
  100669:	c3                   	ret    
  10066a:	66 90                	xchg   %ax,%ax

0010066c <kEntry>:
  10066c:	55                   	push   %ebp
  10066d:	89 e5                	mov    %esp,%ebp
  10066f:	83 ec 08             	sub    $0x8,%esp
  100672:	e8 21 fa ff ff       	call   100098 <initSerial>
  100677:	e8 3c ff ff ff       	call   1005b8 <initIdt>
  10067c:	e8 2f fc ff ff       	call   1002b0 <initIntr>
  100681:	e8 0e fd ff ff       	call   100394 <initSeg>
  100686:	e8 81 fe ff ff       	call   10050c <loadUMain>
  10068b:	eb fe                	jmp    10068b <kEntry+0x1f>

0010068d <irqEmpty>:
  10068d:	6a 00                	push   $0x0
  10068f:	6a ff                	push   $0xffffffff
  100691:	eb 0d                	jmp    1006a0 <asmDoIrq>

00100693 <irqGProtectFault>:
  100693:	6a 0d                	push   $0xd
  100695:	eb 09                	jmp    1006a0 <asmDoIrq>

00100697 <irqSyscall>:
  100697:	6a 00                	push   $0x0
  100699:	68 80 00 00 00       	push   $0x80
  10069e:	eb 00                	jmp    1006a0 <asmDoIrq>

001006a0 <asmDoIrq>:
  1006a0:	60                   	pusha  
  1006a1:	54                   	push   %esp
  1006a2:	e8 39 fb ff ff       	call   1001e0 <irqHandle>
  1006a7:	83 c4 04             	add    $0x4,%esp
  1006aa:	61                   	popa   
  1006ab:	83 c4 04             	add    $0x4,%esp
  1006ae:	83 c4 04             	add    $0x4,%esp
  1006b1:	cf                   	iret   
