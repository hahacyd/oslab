
kernel/kMain.elf:     file format elf32-i386


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
  100107:	eb 70                	jmp    100179 <printkernel+0x85>
  100109:	8d 76 00             	lea    0x0(%esi),%esi
  10010c:	89 15 20 11 10 00    	mov    %edx,0x101120
  100112:	43                   	inc    %ebx
  100113:	0f be 03             	movsbl (%ebx),%eax
  100116:	84 c0                	test   %al,%al
  100118:	74 5f                	je     100179 <printkernel+0x85>
  10011a:	83 ec 0c             	sub    $0xc,%esp
  10011d:	50                   	push   %eax
  10011e:	e8 b5 ff ff ff       	call   1000d8 <putChar>
  100123:	8a 03                	mov    (%ebx),%al
  100125:	83 c4 10             	add    $0x10,%esp
  100128:	3c 0a                	cmp    $0xa,%al
  10012a:	74 5c                	je     100188 <printkernel+0x94>
  10012c:	8b 15 20 11 10 00    	mov    0x101120,%edx
  100132:	8b 0d 24 11 10 00    	mov    0x101124,%ecx
  100138:	ff 05 28 11 10 00    	incl   0x101128
  10013e:	8d 34 89             	lea    (%ecx,%ecx,4),%esi
  100141:	c1 e6 04             	shl    $0x4,%esi
  100144:	01 d6                	add    %edx,%esi
  100146:	01 f6                	add    %esi,%esi
  100148:	89 f7                	mov    %esi,%edi
  10014a:	0f be f0             	movsbl %al,%esi
  10014d:	81 ce 00 0c 00 00    	or     $0xc00,%esi
  100153:	66 89 f0             	mov    %si,%ax
  100156:	65 66 89 07          	mov    %ax,%gs:(%edi)
  10015a:	42                   	inc    %edx
  10015b:	83 fa 50             	cmp    $0x50,%edx
  10015e:	75 ac                	jne    10010c <printkernel+0x18>
  100160:	c7 05 20 11 10 00 00 	movl   $0x0,0x101120
  100167:	00 00 00 
  10016a:	41                   	inc    %ecx
  10016b:	89 0d 24 11 10 00    	mov    %ecx,0x101124
  100171:	43                   	inc    %ebx
  100172:	0f be 03             	movsbl (%ebx),%eax
  100175:	84 c0                	test   %al,%al
  100177:	75 a1                	jne    10011a <printkernel+0x26>
  100179:	b8 01 00 00 00       	mov    $0x1,%eax
  10017e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100181:	5b                   	pop    %ebx
  100182:	5e                   	pop    %esi
  100183:	5f                   	pop    %edi
  100184:	5d                   	pop    %ebp
  100185:	c3                   	ret    
  100186:	66 90                	xchg   %ax,%ax
  100188:	c7 05 20 11 10 00 00 	movl   $0x0,0x101120
  10018f:	00 00 00 
  100192:	ff 05 24 11 10 00    	incl   0x101124
  100198:	e9 75 ff ff ff       	jmp    100112 <printkernel+0x1e>
  10019d:	8d 76 00             	lea    0x0(%esi),%esi

001001a0 <sys_write>:
  1001a0:	55                   	push   %ebp
  1001a1:	89 e5                	mov    %esp,%ebp
  1001a3:	57                   	push   %edi
  1001a4:	56                   	push   %esi
  1001a5:	53                   	push   %ebx
  1001a6:	83 ec 0c             	sub    $0xc,%esp
  1001a9:	89 c3                	mov    %eax,%ebx
  1001ab:	8b 70 14             	mov    0x14(%eax),%esi
  1001ae:	8b 78 18             	mov    0x18(%eax),%edi
  1001b1:	83 78 10 01          	cmpl   $0x1,0x10(%eax)
  1001b5:	74 12                	je     1001c9 <sys_write+0x29>
  1001b7:	83 ec 08             	sub    $0x8,%esp
  1001ba:	6a 38                	push   $0x38
  1001bc:	68 8a 06 10 00       	push   $0x10068a
  1001c1:	e8 3a fe ff ff       	call   100000 <abort>
  1001c6:	83 c4 10             	add    $0x10,%esp
  1001c9:	83 ec 08             	sub    $0x8,%esp
  1001cc:	56                   	push   %esi
  1001cd:	57                   	push   %edi
  1001ce:	e8 21 ff ff ff       	call   1000f4 <printkernel>
  1001d3:	89 73 1c             	mov    %esi,0x1c(%ebx)
  1001d6:	83 c4 10             	add    $0x10,%esp
  1001d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1001dc:	5b                   	pop    %ebx
  1001dd:	5e                   	pop    %esi
  1001de:	5f                   	pop    %edi
  1001df:	5d                   	pop    %ebp
  1001e0:	c3                   	ret    
  1001e1:	8d 76 00             	lea    0x0(%esi),%esi

001001e4 <irqHandle>:
  1001e4:	55                   	push   %ebp
  1001e5:	89 e5                	mov    %esp,%ebp
  1001e7:	83 ec 08             	sub    $0x8,%esp
  1001ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1001ed:	8b 50 20             	mov    0x20(%eax),%edx
  1001f0:	83 fa 0d             	cmp    $0xd,%edx
  1001f3:	74 2b                	je     100220 <irqHandle+0x3c>
  1001f5:	81 fa 80 00 00 00    	cmp    $0x80,%edx
  1001fb:	74 17                	je     100214 <irqHandle+0x30>
  1001fd:	42                   	inc    %edx
  1001fe:	74 12                	je     100212 <irqHandle+0x2e>
  100200:	83 ec 08             	sub    $0x8,%esp
  100203:	6a 1c                	push   $0x1c
  100205:	68 8a 06 10 00       	push   $0x10068a
  10020a:	e8 f1 fd ff ff       	call   100000 <abort>
  10020f:	83 c4 10             	add    $0x10,%esp
  100212:	c9                   	leave  
  100213:	c3                   	ret    
  100214:	83 78 1c 04          	cmpl   $0x4,0x1c(%eax)
  100218:	75 f8                	jne    100212 <irqHandle+0x2e>
  10021a:	c9                   	leave  
  10021b:	eb 83                	jmp    1001a0 <sys_write>
  10021d:	8d 76 00             	lea    0x0(%esi),%esi
  100220:	83 ec 08             	sub    $0x8,%esp
  100223:	6a 56                	push   $0x56
  100225:	68 8a 06 10 00       	push   $0x10068a
  10022a:	e8 d1 fd ff ff       	call   100000 <abort>
  10022f:	83 c4 10             	add    $0x10,%esp
  100232:	c9                   	leave  
  100233:	c3                   	ret    

00100234 <fs_write>:
  100234:	55                   	push   %ebp
  100235:	89 e5                	mov    %esp,%ebp
  100237:	53                   	push   %ebx
  100238:	50                   	push   %eax
  100239:	8b 5d 10             	mov    0x10(%ebp),%ebx
  10023c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  100240:	74 12                	je     100254 <fs_write+0x20>
  100242:	83 ec 08             	sub    $0x8,%esp
  100245:	6a 38                	push   $0x38
  100247:	68 8a 06 10 00       	push   $0x10068a
  10024c:	e8 af fd ff ff       	call   100000 <abort>
  100251:	83 c4 10             	add    $0x10,%esp
  100254:	83 ec 08             	sub    $0x8,%esp
  100257:	53                   	push   %ebx
  100258:	ff 75 0c             	pushl  0xc(%ebp)
  10025b:	e8 94 fe ff ff       	call   1000f4 <printkernel>
  100260:	89 d8                	mov    %ebx,%eax
  100262:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100265:	c9                   	leave  
  100266:	c3                   	ret    
  100267:	90                   	nop

00100268 <syscallHandle>:
  100268:	55                   	push   %ebp
  100269:	89 e5                	mov    %esp,%ebp
  10026b:	8b 45 08             	mov    0x8(%ebp),%eax
  10026e:	83 78 1c 04          	cmpl   $0x4,0x1c(%eax)
  100272:	74 04                	je     100278 <syscallHandle+0x10>
  100274:	5d                   	pop    %ebp
  100275:	c3                   	ret    
  100276:	66 90                	xchg   %ax,%ax
  100278:	5d                   	pop    %ebp
  100279:	e9 22 ff ff ff       	jmp    1001a0 <sys_write>
  10027e:	66 90                	xchg   %ax,%ax

00100280 <GProtectFaultHandle>:
  100280:	55                   	push   %ebp
  100281:	89 e5                	mov    %esp,%ebp
  100283:	83 ec 10             	sub    $0x10,%esp
  100286:	6a 56                	push   $0x56
  100288:	68 8a 06 10 00       	push   $0x10068a
  10028d:	e8 6e fd ff ff       	call   100000 <abort>
  100292:	83 c4 10             	add    $0x10,%esp
  100295:	c9                   	leave  
  100296:	c3                   	ret    
  100297:	90                   	nop

00100298 <initIntr>:
  100298:	55                   	push   %ebp
  100299:	89 e5                	mov    %esp,%ebp
  10029b:	ba 21 00 00 00       	mov    $0x21,%edx
  1002a0:	b0 ff                	mov    $0xff,%al
  1002a2:	ee                   	out    %al,(%dx)
  1002a3:	ba a1 00 00 00       	mov    $0xa1,%edx
  1002a8:	ee                   	out    %al,(%dx)
  1002a9:	ba 20 00 00 00       	mov    $0x20,%edx
  1002ae:	b0 11                	mov    $0x11,%al
  1002b0:	ee                   	out    %al,(%dx)
  1002b1:	ba 21 00 00 00       	mov    $0x21,%edx
  1002b6:	b0 20                	mov    $0x20,%al
  1002b8:	ee                   	out    %al,(%dx)
  1002b9:	b0 04                	mov    $0x4,%al
  1002bb:	ee                   	out    %al,(%dx)
  1002bc:	b0 03                	mov    $0x3,%al
  1002be:	ee                   	out    %al,(%dx)
  1002bf:	ba a0 00 00 00       	mov    $0xa0,%edx
  1002c4:	b0 11                	mov    $0x11,%al
  1002c6:	ee                   	out    %al,(%dx)
  1002c7:	ba a1 00 00 00       	mov    $0xa1,%edx
  1002cc:	b0 28                	mov    $0x28,%al
  1002ce:	ee                   	out    %al,(%dx)
  1002cf:	b0 02                	mov    $0x2,%al
  1002d1:	ee                   	out    %al,(%dx)
  1002d2:	b0 03                	mov    $0x3,%al
  1002d4:	ee                   	out    %al,(%dx)
  1002d5:	ba 20 00 00 00       	mov    $0x20,%edx
  1002da:	b0 68                	mov    $0x68,%al
  1002dc:	ee                   	out    %al,(%dx)
  1002dd:	b0 0a                	mov    $0xa,%al
  1002df:	ee                   	out    %al,(%dx)
  1002e0:	ba a0 00 00 00       	mov    $0xa0,%edx
  1002e5:	b0 68                	mov    $0x68,%al
  1002e7:	ee                   	out    %al,(%dx)
  1002e8:	b0 0a                	mov    $0xa,%al
  1002ea:	ee                   	out    %al,(%dx)
  1002eb:	5d                   	pop    %ebp
  1002ec:	c3                   	ret    
  1002ed:	66 90                	xchg   %ax,%ax
  1002ef:	90                   	nop

001002f0 <waitDisk>:
  1002f0:	55                   	push   %ebp
  1002f1:	89 e5                	mov    %esp,%ebp
  1002f3:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1002f8:	ec                   	in     (%dx),%al
  1002f9:	83 e0 c0             	and    $0xffffffc0,%eax
  1002fc:	3c 40                	cmp    $0x40,%al
  1002fe:	75 f8                	jne    1002f8 <waitDisk+0x8>
  100300:	5d                   	pop    %ebp
  100301:	c3                   	ret    
  100302:	66 90                	xchg   %ax,%ax

00100304 <readSect>:
  100304:	55                   	push   %ebp
  100305:	89 e5                	mov    %esp,%ebp
  100307:	53                   	push   %ebx
  100308:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10030b:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100310:	ec                   	in     (%dx),%al
  100311:	83 e0 c0             	and    $0xffffffc0,%eax
  100314:	3c 40                	cmp    $0x40,%al
  100316:	75 f8                	jne    100310 <readSect+0xc>
  100318:	ba f2 01 00 00       	mov    $0x1f2,%edx
  10031d:	b0 01                	mov    $0x1,%al
  10031f:	ee                   	out    %al,(%dx)
  100320:	ba f3 01 00 00       	mov    $0x1f3,%edx
  100325:	88 c8                	mov    %cl,%al
  100327:	ee                   	out    %al,(%dx)
  100328:	89 c8                	mov    %ecx,%eax
  10032a:	c1 f8 08             	sar    $0x8,%eax
  10032d:	ba f4 01 00 00       	mov    $0x1f4,%edx
  100332:	ee                   	out    %al,(%dx)
  100333:	89 c8                	mov    %ecx,%eax
  100335:	c1 f8 10             	sar    $0x10,%eax
  100338:	ba f5 01 00 00       	mov    $0x1f5,%edx
  10033d:	ee                   	out    %al,(%dx)
  10033e:	89 c8                	mov    %ecx,%eax
  100340:	c1 f8 18             	sar    $0x18,%eax
  100343:	83 c8 e0             	or     $0xffffffe0,%eax
  100346:	ba f6 01 00 00       	mov    $0x1f6,%edx
  10034b:	ee                   	out    %al,(%dx)
  10034c:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100351:	b0 20                	mov    $0x20,%al
  100353:	ee                   	out    %al,(%dx)
  100354:	ec                   	in     (%dx),%al
  100355:	83 e0 c0             	and    $0xffffffc0,%eax
  100358:	3c 40                	cmp    $0x40,%al
  10035a:	75 f8                	jne    100354 <readSect+0x50>
  10035c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10035f:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  100365:	ba f0 01 00 00       	mov    $0x1f0,%edx
  10036a:	66 90                	xchg   %ax,%ax
  10036c:	ed                   	in     (%dx),%eax
  10036d:	89 01                	mov    %eax,(%ecx)
  10036f:	83 c1 04             	add    $0x4,%ecx
  100372:	39 d9                	cmp    %ebx,%ecx
  100374:	75 f6                	jne    10036c <readSect+0x68>
  100376:	5b                   	pop    %ebx
  100377:	5d                   	pop    %ebp
  100378:	c3                   	ret    
  100379:	8d 76 00             	lea    0x0(%esi),%esi

0010037c <initSeg>:
  10037c:	55                   	push   %ebp
  10037d:	89 e5                	mov    %esp,%ebp
  10037f:	ba 40 11 10 00       	mov    $0x101140,%edx
  100384:	66 c7 05 48 11 10 00 	movw   $0xffff,0x101148
  10038b:	ff ff 
  10038d:	66 c7 05 4a 11 10 00 	movw   $0x0,0x10114a
  100394:	00 00 
  100396:	c6 05 4c 11 10 00 00 	movb   $0x0,0x10114c
  10039d:	c6 05 4d 11 10 00 9a 	movb   $0x9a,0x10114d
  1003a4:	c6 05 4e 11 10 00 cf 	movb   $0xcf,0x10114e
  1003ab:	c6 05 4f 11 10 00 00 	movb   $0x0,0x10114f
  1003b2:	66 c7 05 50 11 10 00 	movw   $0xffff,0x101150
  1003b9:	ff ff 
  1003bb:	66 c7 05 52 11 10 00 	movw   $0x0,0x101152
  1003c2:	00 00 
  1003c4:	c6 05 54 11 10 00 00 	movb   $0x0,0x101154
  1003cb:	c6 05 55 11 10 00 92 	movb   $0x92,0x101155
  1003d2:	c6 05 56 11 10 00 cf 	movb   $0xcf,0x101156
  1003d9:	c6 05 57 11 10 00 00 	movb   $0x0,0x101157
  1003e0:	66 c7 05 58 11 10 00 	movw   $0xffff,0x101158
  1003e7:	ff ff 
  1003e9:	66 c7 05 5a 11 10 00 	movw   $0x0,0x10115a
  1003f0:	00 00 
  1003f2:	c6 05 5c 11 10 00 00 	movb   $0x0,0x10115c
  1003f9:	c6 05 5d 11 10 00 fa 	movb   $0xfa,0x10115d
  100400:	c6 05 5e 11 10 00 cf 	movb   $0xcf,0x10115e
  100407:	c6 05 5f 11 10 00 00 	movb   $0x0,0x10115f
  10040e:	66 c7 05 60 11 10 00 	movw   $0xffff,0x101160
  100415:	ff ff 
  100417:	66 c7 05 62 11 10 00 	movw   $0x0,0x101162
  10041e:	00 00 
  100420:	c6 05 64 11 10 00 00 	movb   $0x0,0x101164
  100427:	c6 05 65 11 10 00 f2 	movb   $0xf2,0x101165
  10042e:	c6 05 66 11 10 00 cf 	movb   $0xcf,0x101166
  100435:	c6 05 67 11 10 00 00 	movb   $0x0,0x101167
  10043c:	66 c7 05 68 11 10 00 	movw   $0x63,0x101168
  100443:	63 00 
  100445:	b8 80 11 10 00       	mov    $0x101180,%eax
  10044a:	66 a3 6a 11 10 00    	mov    %ax,0x10116a
  100450:	89 c1                	mov    %eax,%ecx
  100452:	c1 e9 10             	shr    $0x10,%ecx
  100455:	88 0d 6c 11 10 00    	mov    %cl,0x10116c
  10045b:	c6 05 6d 11 10 00 89 	movb   $0x89,0x10116d
  100462:	c6 05 6e 11 10 00 40 	movb   $0x40,0x10116e
  100469:	c1 e8 18             	shr    $0x18,%eax
  10046c:	a2 6f 11 10 00       	mov    %al,0x10116f
  100471:	66 c7 05 70 11 10 00 	movw   $0xffff,0x101170
  100478:	ff ff 
  10047a:	66 c7 05 72 11 10 00 	movw   $0xb,0x101172
  100481:	0b 00 
  100483:	c6 05 74 11 10 00 00 	movb   $0x0,0x101174
  10048a:	c6 05 75 11 10 00 9a 	movb   $0x9a,0x101175
  100491:	c6 05 76 11 10 00 cf 	movb   $0xcf,0x101176
  100498:	c6 05 77 11 10 00 00 	movb   $0x0,0x101177
  10049f:	66 c7 05 2c 11 10 00 	movw   $0x37,0x10112c
  1004a6:	37 00 
  1004a8:	66 89 15 2e 11 10 00 	mov    %dx,0x10112e
  1004af:	c1 ea 10             	shr    $0x10,%edx
  1004b2:	66 89 15 30 11 10 00 	mov    %dx,0x101130
  1004b9:	b8 2c 11 10 00       	mov    $0x10112c,%eax
  1004be:	0f 01 10             	lgdtl  (%eax)
  1004c1:	c7 05 b8 11 10 00 00 	movl   $0x8000000,0x1011b8
  1004c8:	00 00 08 
  1004cb:	b8 28 00 00 00       	mov    $0x28,%eax
  1004d0:	0f 00 d8             	ltr    %ax
  1004d3:	31 c0                	xor    %eax,%eax
  1004d5:	0f 00 d0             	lldt   %ax
  1004d8:	5d                   	pop    %ebp
  1004d9:	c3                   	ret    
  1004da:	66 90                	xchg   %ax,%ax

001004dc <enterUserSpace>:
  1004dc:	55                   	push   %ebp
  1004dd:	89 e5                	mov    %esp,%ebp
  1004df:	cf                   	iret   
  1004e0:	5d                   	pop    %ebp
  1004e1:	c3                   	ret    
  1004e2:	66 90                	xchg   %ax,%ax

001004e4 <loadUMain>:
  1004e4:	55                   	push   %ebp
  1004e5:	89 e5                	mov    %esp,%ebp
  1004e7:	57                   	push   %edi
  1004e8:	56                   	push   %esi
  1004e9:	53                   	push   %ebx
  1004ea:	83 ec 0c             	sub    $0xc,%esp
  1004ed:	bb c9 00 00 00       	mov    $0xc9,%ebx
  1004f2:	be 00 00 00 03       	mov    $0x3000000,%esi
  1004f7:	90                   	nop
  1004f8:	53                   	push   %ebx
  1004f9:	56                   	push   %esi
  1004fa:	e8 05 fe ff ff       	call   100304 <readSect>
  1004ff:	81 c6 00 02 00 00    	add    $0x200,%esi
  100505:	43                   	inc    %ebx
  100506:	58                   	pop    %eax
  100507:	5a                   	pop    %edx
  100508:	81 fb 91 01 00 00    	cmp    $0x191,%ebx
  10050e:	75 e8                	jne    1004f8 <loadUMain+0x14>
  100510:	a1 1c 00 00 03       	mov    0x300001c,%eax
  100515:	8d 90 00 00 00 03    	lea    0x3000000(%eax),%edx
  10051b:	0f b7 35 2c 00 00 03 	movzwl 0x300002c,%esi
  100522:	c1 e6 05             	shl    $0x5,%esi
  100525:	01 d6                	add    %edx,%esi
  100527:	39 f2                	cmp    %esi,%edx
  100529:	72 0c                	jb     100537 <loadUMain+0x53>
  10052b:	eb 53                	jmp    100580 <loadUMain+0x9c>
  10052d:	8d 76 00             	lea    0x0(%esi),%esi
  100530:	83 c2 20             	add    $0x20,%edx
  100533:	39 d6                	cmp    %edx,%esi
  100535:	76 49                	jbe    100580 <loadUMain+0x9c>
  100537:	83 3a 01             	cmpl   $0x1,(%edx)
  10053a:	75 f4                	jne    100530 <loadUMain+0x4c>
  10053c:	8b 42 08             	mov    0x8(%edx),%eax
  10053f:	8b 7a 10             	mov    0x10(%edx),%edi
  100542:	8b 5a 04             	mov    0x4(%edx),%ebx
  100545:	29 c3                	sub    %eax,%ebx
  100547:	31 c9                	xor    %ecx,%ecx
  100549:	85 ff                	test   %edi,%edi
  10054b:	74 16                	je     100563 <loadUMain+0x7f>
  10054d:	8d 76 00             	lea    0x0(%esi),%esi
  100550:	8a 8c 03 00 00 00 03 	mov    0x3000000(%ebx,%eax,1),%cl
  100557:	88 08                	mov    %cl,(%eax)
  100559:	40                   	inc    %eax
  10055a:	89 c1                	mov    %eax,%ecx
  10055c:	2b 4a 08             	sub    0x8(%edx),%ecx
  10055f:	39 cf                	cmp    %ecx,%edi
  100561:	77 ed                	ja     100550 <loadUMain+0x6c>
  100563:	8b 5a 14             	mov    0x14(%edx),%ebx
  100566:	39 cb                	cmp    %ecx,%ebx
  100568:	76 c6                	jbe    100530 <loadUMain+0x4c>
  10056a:	66 90                	xchg   %ax,%ax
  10056c:	c6 00 00             	movb   $0x0,(%eax)
  10056f:	40                   	inc    %eax
  100570:	89 c1                	mov    %eax,%ecx
  100572:	2b 4a 08             	sub    0x8(%edx),%ecx
  100575:	39 cb                	cmp    %ecx,%ebx
  100577:	77 f3                	ja     10056c <loadUMain+0x88>
  100579:	83 c2 20             	add    $0x20,%edx
  10057c:	39 d6                	cmp    %edx,%esi
  10057e:	77 b7                	ja     100537 <loadUMain+0x53>
  100580:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100583:	5b                   	pop    %ebx
  100584:	5e                   	pop    %esi
  100585:	5f                   	pop    %edi
  100586:	5d                   	pop    %ebp
  100587:	ff 25 18 00 00 03    	jmp    *0x3000018
  10058d:	66 90                	xchg   %ax,%ax
  10058f:	90                   	nop

00100590 <initIdt>:
  100590:	55                   	push   %ebp
  100591:	89 e5                	mov    %esp,%ebp
  100593:	53                   	push   %ebx
  100594:	ba 65 06 10 00       	mov    $0x100665,%edx
  100599:	89 d3                	mov    %edx,%ebx
  10059b:	c1 ea 10             	shr    $0x10,%edx
  10059e:	b9 00 1a 10 00       	mov    $0x101a00,%ecx
  1005a3:	b8 00 12 10 00       	mov    $0x101200,%eax
  1005a8:	66 89 18             	mov    %bx,(%eax)
  1005ab:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  1005b1:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  1005b5:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  1005b9:	66 89 50 06          	mov    %dx,0x6(%eax)
  1005bd:	83 c0 08             	add    $0x8,%eax
  1005c0:	39 c1                	cmp    %eax,%ecx
  1005c2:	75 e4                	jne    1005a8 <initIdt+0x18>
  1005c4:	b8 6b 06 10 00       	mov    $0x10066b,%eax
  1005c9:	66 a3 68 12 10 00    	mov    %ax,0x101268
  1005cf:	66 c7 05 6a 12 10 00 	movw   $0x8,0x10126a
  1005d6:	08 00 
  1005d8:	c6 05 6c 12 10 00 00 	movb   $0x0,0x10126c
  1005df:	c6 05 6d 12 10 00 8f 	movb   $0x8f,0x10126d
  1005e6:	c1 e8 10             	shr    $0x10,%eax
  1005e9:	66 a3 6e 12 10 00    	mov    %ax,0x10126e
  1005ef:	b8 6f 06 10 00       	mov    $0x10066f,%eax
  1005f4:	66 a3 00 16 10 00    	mov    %ax,0x101600
  1005fa:	66 c7 05 02 16 10 00 	movw   $0x8,0x101602
  100601:	08 00 
  100603:	c6 05 04 16 10 00 00 	movb   $0x0,0x101604
  10060a:	c6 05 05 16 10 00 ee 	movb   $0xee,0x101605
  100611:	c1 e8 10             	shr    $0x10,%eax
  100614:	66 a3 06 16 10 00    	mov    %ax,0x101606
  10061a:	66 c7 05 34 11 10 00 	movw   $0x7ff,0x101134
  100621:	ff 07 
  100623:	b8 00 12 10 00       	mov    $0x101200,%eax
  100628:	66 a3 36 11 10 00    	mov    %ax,0x101136
  10062e:	c1 e8 10             	shr    $0x10,%eax
  100631:	66 a3 38 11 10 00    	mov    %ax,0x101138
  100637:	b8 34 11 10 00       	mov    $0x101134,%eax
  10063c:	0f 01 18             	lidtl  (%eax)
  10063f:	5b                   	pop    %ebx
  100640:	5d                   	pop    %ebp
  100641:	c3                   	ret    
  100642:	66 90                	xchg   %ax,%ax

00100644 <kEntry>:
  100644:	55                   	push   %ebp
  100645:	89 e5                	mov    %esp,%ebp
  100647:	83 ec 08             	sub    $0x8,%esp
  10064a:	e8 49 fa ff ff       	call   100098 <initSerial>
  10064f:	e8 3c ff ff ff       	call   100590 <initIdt>
  100654:	e8 3f fc ff ff       	call   100298 <initIntr>
  100659:	e8 1e fd ff ff       	call   10037c <initSeg>
  10065e:	e8 81 fe ff ff       	call   1004e4 <loadUMain>
  100663:	eb fe                	jmp    100663 <kEntry+0x1f>

00100665 <irqEmpty>:
  100665:	6a 00                	push   $0x0
  100667:	6a ff                	push   $0xffffffff
  100669:	eb 0d                	jmp    100678 <asmDoIrq>

0010066b <irqGProtectFault>:
  10066b:	6a 0d                	push   $0xd
  10066d:	eb 09                	jmp    100678 <asmDoIrq>

0010066f <irqSyscall>:
  10066f:	6a 00                	push   $0x0
  100671:	68 80 00 00 00       	push   $0x80
  100676:	eb 00                	jmp    100678 <asmDoIrq>

00100678 <asmDoIrq>:
  100678:	60                   	pusha  
  100679:	54                   	push   %esp
  10067a:	e8 65 fb ff ff       	call   1001e4 <irqHandle>
  10067f:	83 c4 04             	add    $0x4,%esp
  100682:	61                   	popa   
  100683:	83 c4 04             	add    $0x4,%esp
  100686:	83 c4 04             	add    $0x4,%esp
  100689:	cf                   	iret   
