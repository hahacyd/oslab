
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
  1000f7:	b8 01 00 00 00       	mov    $0x1,%eax
  1000fc:	5d                   	pop    %ebp
  1000fd:	c3                   	ret    
  1000fe:	66 90                	xchg   %ax,%ax

00100100 <fs_write>:
  100100:	55                   	push   %ebp
  100101:	89 e5                	mov    %esp,%ebp
  100103:	57                   	push   %edi
  100104:	56                   	push   %esi
  100105:	53                   	push   %ebx
  100106:	83 ec 18             	sub    $0x18,%esp
  100109:	8b 7d 10             	mov    0x10(%ebp),%edi
  10010c:	6a 63                	push   $0x63
  10010e:	e8 c5 ff ff ff       	call   1000d8 <putChar>
  100113:	c7 04 24 79 00 00 00 	movl   $0x79,(%esp)
  10011a:	e8 b9 ff ff ff       	call   1000d8 <putChar>
  10011f:	83 c4 10             	add    $0x10,%esp
  100122:	85 ff                	test   %edi,%edi
  100124:	7e 1a                	jle    100140 <fs_write+0x40>
  100126:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100129:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
  10012c:	83 ec 0c             	sub    $0xc,%esp
  10012f:	0f be 03             	movsbl (%ebx),%eax
  100132:	50                   	push   %eax
  100133:	e8 a0 ff ff ff       	call   1000d8 <putChar>
  100138:	43                   	inc    %ebx
  100139:	83 c4 10             	add    $0x10,%esp
  10013c:	39 f3                	cmp    %esi,%ebx
  10013e:	75 ec                	jne    10012c <fs_write+0x2c>
  100140:	89 f8                	mov    %edi,%eax
  100142:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100145:	5b                   	pop    %ebx
  100146:	5e                   	pop    %esi
  100147:	5f                   	pop    %edi
  100148:	5d                   	pop    %ebp
  100149:	c3                   	ret    
  10014a:	66 90                	xchg   %ax,%ax

0010014c <irqHandle>:
  10014c:	55                   	push   %ebp
  10014d:	89 e5                	mov    %esp,%ebp
  10014f:	53                   	push   %ebx
  100150:	52                   	push   %edx
  100151:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100154:	8b 43 20             	mov    0x20(%ebx),%eax
  100157:	83 f8 0d             	cmp    $0xd,%eax
  10015a:	74 44                	je     1001a0 <irqHandle+0x54>
  10015c:	3d 80 00 00 00       	cmp    $0x80,%eax
  100161:	74 1d                	je     100180 <irqHandle+0x34>
  100163:	40                   	inc    %eax
  100164:	74 12                	je     100178 <irqHandle+0x2c>
  100166:	83 ec 08             	sub    $0x8,%esp
  100169:	6a 17                	push   $0x17
  10016b:	68 b2 05 10 00       	push   $0x1005b2
  100170:	e8 8b fe ff ff       	call   100000 <abort>
  100175:	83 c4 10             	add    $0x10,%esp
  100178:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10017b:	c9                   	leave  
  10017c:	c3                   	ret    
  10017d:	8d 76 00             	lea    0x0(%esi),%esi
  100180:	83 7b 1c 04          	cmpl   $0x4,0x1c(%ebx)
  100184:	75 f2                	jne    100178 <irqHandle+0x2c>
  100186:	50                   	push   %eax
  100187:	ff 73 14             	pushl  0x14(%ebx)
  10018a:	ff 73 18             	pushl  0x18(%ebx)
  10018d:	ff 73 10             	pushl  0x10(%ebx)
  100190:	e8 6b ff ff ff       	call   100100 <fs_write>
  100195:	89 43 1c             	mov    %eax,0x1c(%ebx)
  100198:	83 c4 10             	add    $0x10,%esp
  10019b:	eb db                	jmp    100178 <irqHandle+0x2c>
  10019d:	8d 76 00             	lea    0x0(%esi),%esi
  1001a0:	83 ec 08             	sub    $0x8,%esp
  1001a3:	6a 3a                	push   $0x3a
  1001a5:	68 b2 05 10 00       	push   $0x1005b2
  1001aa:	e8 51 fe ff ff       	call   100000 <abort>
  1001af:	83 c4 10             	add    $0x10,%esp
  1001b2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1001b5:	c9                   	leave  
  1001b6:	c3                   	ret    
  1001b7:	90                   	nop

001001b8 <syscallHandle>:
  1001b8:	55                   	push   %ebp
  1001b9:	89 e5                	mov    %esp,%ebp
  1001bb:	53                   	push   %ebx
  1001bc:	52                   	push   %edx
  1001bd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1001c0:	83 7b 1c 04          	cmpl   $0x4,0x1c(%ebx)
  1001c4:	75 15                	jne    1001db <syscallHandle+0x23>
  1001c6:	50                   	push   %eax
  1001c7:	ff 73 14             	pushl  0x14(%ebx)
  1001ca:	ff 73 18             	pushl  0x18(%ebx)
  1001cd:	ff 73 10             	pushl  0x10(%ebx)
  1001d0:	e8 2b ff ff ff       	call   100100 <fs_write>
  1001d5:	89 43 1c             	mov    %eax,0x1c(%ebx)
  1001d8:	83 c4 10             	add    $0x10,%esp
  1001db:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1001de:	c9                   	leave  
  1001df:	c3                   	ret    

001001e0 <GProtectFaultHandle>:
  1001e0:	55                   	push   %ebp
  1001e1:	89 e5                	mov    %esp,%ebp
  1001e3:	83 ec 10             	sub    $0x10,%esp
  1001e6:	6a 3a                	push   $0x3a
  1001e8:	68 b2 05 10 00       	push   $0x1005b2
  1001ed:	e8 0e fe ff ff       	call   100000 <abort>
  1001f2:	83 c4 10             	add    $0x10,%esp
  1001f5:	c9                   	leave  
  1001f6:	c3                   	ret    
  1001f7:	90                   	nop

001001f8 <initIntr>:
  1001f8:	55                   	push   %ebp
  1001f9:	89 e5                	mov    %esp,%ebp
  1001fb:	ba 21 00 00 00       	mov    $0x21,%edx
  100200:	b0 ff                	mov    $0xff,%al
  100202:	ee                   	out    %al,(%dx)
  100203:	ba a1 00 00 00       	mov    $0xa1,%edx
  100208:	ee                   	out    %al,(%dx)
  100209:	ba 20 00 00 00       	mov    $0x20,%edx
  10020e:	b0 11                	mov    $0x11,%al
  100210:	ee                   	out    %al,(%dx)
  100211:	ba 21 00 00 00       	mov    $0x21,%edx
  100216:	b0 20                	mov    $0x20,%al
  100218:	ee                   	out    %al,(%dx)
  100219:	b0 04                	mov    $0x4,%al
  10021b:	ee                   	out    %al,(%dx)
  10021c:	b0 03                	mov    $0x3,%al
  10021e:	ee                   	out    %al,(%dx)
  10021f:	ba a0 00 00 00       	mov    $0xa0,%edx
  100224:	b0 11                	mov    $0x11,%al
  100226:	ee                   	out    %al,(%dx)
  100227:	ba a1 00 00 00       	mov    $0xa1,%edx
  10022c:	b0 28                	mov    $0x28,%al
  10022e:	ee                   	out    %al,(%dx)
  10022f:	b0 02                	mov    $0x2,%al
  100231:	ee                   	out    %al,(%dx)
  100232:	b0 03                	mov    $0x3,%al
  100234:	ee                   	out    %al,(%dx)
  100235:	ba 20 00 00 00       	mov    $0x20,%edx
  10023a:	b0 68                	mov    $0x68,%al
  10023c:	ee                   	out    %al,(%dx)
  10023d:	b0 0a                	mov    $0xa,%al
  10023f:	ee                   	out    %al,(%dx)
  100240:	ba a0 00 00 00       	mov    $0xa0,%edx
  100245:	b0 68                	mov    $0x68,%al
  100247:	ee                   	out    %al,(%dx)
  100248:	b0 0a                	mov    $0xa,%al
  10024a:	ee                   	out    %al,(%dx)
  10024b:	5d                   	pop    %ebp
  10024c:	c3                   	ret    
  10024d:	66 90                	xchg   %ax,%ax
  10024f:	90                   	nop

00100250 <waitDisk>:
  100250:	55                   	push   %ebp
  100251:	89 e5                	mov    %esp,%ebp
  100253:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100258:	ec                   	in     (%dx),%al
  100259:	83 e0 c0             	and    $0xffffffc0,%eax
  10025c:	3c 40                	cmp    $0x40,%al
  10025e:	75 f8                	jne    100258 <waitDisk+0x8>
  100260:	5d                   	pop    %ebp
  100261:	c3                   	ret    
  100262:	66 90                	xchg   %ax,%ax

00100264 <readSect>:
  100264:	55                   	push   %ebp
  100265:	89 e5                	mov    %esp,%ebp
  100267:	53                   	push   %ebx
  100268:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10026b:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100270:	ec                   	in     (%dx),%al
  100271:	83 e0 c0             	and    $0xffffffc0,%eax
  100274:	3c 40                	cmp    $0x40,%al
  100276:	75 f8                	jne    100270 <readSect+0xc>
  100278:	ba f2 01 00 00       	mov    $0x1f2,%edx
  10027d:	b0 01                	mov    $0x1,%al
  10027f:	ee                   	out    %al,(%dx)
  100280:	ba f3 01 00 00       	mov    $0x1f3,%edx
  100285:	88 c8                	mov    %cl,%al
  100287:	ee                   	out    %al,(%dx)
  100288:	89 c8                	mov    %ecx,%eax
  10028a:	c1 f8 08             	sar    $0x8,%eax
  10028d:	ba f4 01 00 00       	mov    $0x1f4,%edx
  100292:	ee                   	out    %al,(%dx)
  100293:	89 c8                	mov    %ecx,%eax
  100295:	c1 f8 10             	sar    $0x10,%eax
  100298:	ba f5 01 00 00       	mov    $0x1f5,%edx
  10029d:	ee                   	out    %al,(%dx)
  10029e:	89 c8                	mov    %ecx,%eax
  1002a0:	c1 f8 18             	sar    $0x18,%eax
  1002a3:	83 c8 e0             	or     $0xffffffe0,%eax
  1002a6:	ba f6 01 00 00       	mov    $0x1f6,%edx
  1002ab:	ee                   	out    %al,(%dx)
  1002ac:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1002b1:	b0 20                	mov    $0x20,%al
  1002b3:	ee                   	out    %al,(%dx)
  1002b4:	ec                   	in     (%dx),%al
  1002b5:	83 e0 c0             	and    $0xffffffc0,%eax
  1002b8:	3c 40                	cmp    $0x40,%al
  1002ba:	75 f8                	jne    1002b4 <readSect+0x50>
  1002bc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1002bf:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  1002c5:	ba f0 01 00 00       	mov    $0x1f0,%edx
  1002ca:	66 90                	xchg   %ax,%ax
  1002cc:	ed                   	in     (%dx),%eax
  1002cd:	89 01                	mov    %eax,(%ecx)
  1002cf:	83 c1 04             	add    $0x4,%ecx
  1002d2:	39 d9                	cmp    %ebx,%ecx
  1002d4:	75 f6                	jne    1002cc <readSect+0x68>
  1002d6:	5b                   	pop    %ebx
  1002d7:	5d                   	pop    %ebp
  1002d8:	c3                   	ret    
  1002d9:	8d 76 00             	lea    0x0(%esi),%esi

001002dc <initSeg>:
  1002dc:	55                   	push   %ebp
  1002dd:	89 e5                	mov    %esp,%ebp
  1002df:	ba 40 11 10 00       	mov    $0x101140,%edx
  1002e4:	66 c7 05 48 11 10 00 	movw   $0xffff,0x101148
  1002eb:	ff ff 
  1002ed:	66 c7 05 4a 11 10 00 	movw   $0x0,0x10114a
  1002f4:	00 00 
  1002f6:	c6 05 4c 11 10 00 00 	movb   $0x0,0x10114c
  1002fd:	c6 05 4d 11 10 00 9a 	movb   $0x9a,0x10114d
  100304:	c6 05 4e 11 10 00 cf 	movb   $0xcf,0x10114e
  10030b:	c6 05 4f 11 10 00 00 	movb   $0x0,0x10114f
  100312:	66 c7 05 50 11 10 00 	movw   $0xffff,0x101150
  100319:	ff ff 
  10031b:	66 c7 05 52 11 10 00 	movw   $0x0,0x101152
  100322:	00 00 
  100324:	c6 05 54 11 10 00 00 	movb   $0x0,0x101154
  10032b:	c6 05 55 11 10 00 92 	movb   $0x92,0x101155
  100332:	c6 05 56 11 10 00 cf 	movb   $0xcf,0x101156
  100339:	c6 05 57 11 10 00 00 	movb   $0x0,0x101157
  100340:	66 c7 05 58 11 10 00 	movw   $0xffff,0x101158
  100347:	ff ff 
  100349:	66 c7 05 5a 11 10 00 	movw   $0x0,0x10115a
  100350:	00 00 
  100352:	c6 05 5c 11 10 00 00 	movb   $0x0,0x10115c
  100359:	c6 05 5d 11 10 00 fa 	movb   $0xfa,0x10115d
  100360:	c6 05 5e 11 10 00 cf 	movb   $0xcf,0x10115e
  100367:	c6 05 5f 11 10 00 00 	movb   $0x0,0x10115f
  10036e:	66 c7 05 60 11 10 00 	movw   $0xffff,0x101160
  100375:	ff ff 
  100377:	66 c7 05 62 11 10 00 	movw   $0x0,0x101162
  10037e:	00 00 
  100380:	c6 05 64 11 10 00 00 	movb   $0x0,0x101164
  100387:	c6 05 65 11 10 00 f2 	movb   $0xf2,0x101165
  10038e:	c6 05 66 11 10 00 cf 	movb   $0xcf,0x101166
  100395:	c6 05 67 11 10 00 00 	movb   $0x0,0x101167
  10039c:	66 c7 05 68 11 10 00 	movw   $0x63,0x101168
  1003a3:	63 00 
  1003a5:	b8 80 11 10 00       	mov    $0x101180,%eax
  1003aa:	66 a3 6a 11 10 00    	mov    %ax,0x10116a
  1003b0:	89 c1                	mov    %eax,%ecx
  1003b2:	c1 e9 10             	shr    $0x10,%ecx
  1003b5:	88 0d 6c 11 10 00    	mov    %cl,0x10116c
  1003bb:	c6 05 6d 11 10 00 89 	movb   $0x89,0x10116d
  1003c2:	c6 05 6e 11 10 00 40 	movb   $0x40,0x10116e
  1003c9:	c1 e8 18             	shr    $0x18,%eax
  1003cc:	a2 6f 11 10 00       	mov    %al,0x10116f
  1003d1:	66 c7 05 20 11 10 00 	movw   $0x37,0x101120
  1003d8:	37 00 
  1003da:	66 89 15 22 11 10 00 	mov    %dx,0x101122
  1003e1:	c1 ea 10             	shr    $0x10,%edx
  1003e4:	66 89 15 24 11 10 00 	mov    %dx,0x101124
  1003eb:	b8 20 11 10 00       	mov    $0x101120,%eax
  1003f0:	0f 01 10             	lgdtl  (%eax)
  1003f3:	b8 28 00 00 00       	mov    $0x28,%eax
  1003f8:	0f 00 d8             	ltr    %ax
  1003fb:	31 c0                	xor    %eax,%eax
  1003fd:	0f 00 d0             	lldt   %ax
  100400:	5d                   	pop    %ebp
  100401:	c3                   	ret    
  100402:	66 90                	xchg   %ax,%ax

00100404 <enterUserSpace>:
  100404:	55                   	push   %ebp
  100405:	89 e5                	mov    %esp,%ebp
  100407:	cf                   	iret   
  100408:	5d                   	pop    %ebp
  100409:	c3                   	ret    
  10040a:	66 90                	xchg   %ax,%ax

0010040c <loadUMain>:
  10040c:	55                   	push   %ebp
  10040d:	89 e5                	mov    %esp,%ebp
  10040f:	57                   	push   %edi
  100410:	56                   	push   %esi
  100411:	53                   	push   %ebx
  100412:	83 ec 0c             	sub    $0xc,%esp
  100415:	bb c9 00 00 00       	mov    $0xc9,%ebx
  10041a:	be 00 00 00 03       	mov    $0x3000000,%esi
  10041f:	90                   	nop
  100420:	53                   	push   %ebx
  100421:	56                   	push   %esi
  100422:	e8 3d fe ff ff       	call   100264 <readSect>
  100427:	81 c6 00 02 00 00    	add    $0x200,%esi
  10042d:	43                   	inc    %ebx
  10042e:	58                   	pop    %eax
  10042f:	5a                   	pop    %edx
  100430:	81 fb 91 01 00 00    	cmp    $0x191,%ebx
  100436:	75 e8                	jne    100420 <loadUMain+0x14>
  100438:	a1 1c 00 00 03       	mov    0x300001c,%eax
  10043d:	8d 90 00 00 00 03    	lea    0x3000000(%eax),%edx
  100443:	0f b7 35 2c 00 00 03 	movzwl 0x300002c,%esi
  10044a:	c1 e6 05             	shl    $0x5,%esi
  10044d:	01 d6                	add    %edx,%esi
  10044f:	39 f2                	cmp    %esi,%edx
  100451:	72 0c                	jb     10045f <loadUMain+0x53>
  100453:	eb 53                	jmp    1004a8 <loadUMain+0x9c>
  100455:	8d 76 00             	lea    0x0(%esi),%esi
  100458:	83 c2 20             	add    $0x20,%edx
  10045b:	39 d6                	cmp    %edx,%esi
  10045d:	76 49                	jbe    1004a8 <loadUMain+0x9c>
  10045f:	83 3a 01             	cmpl   $0x1,(%edx)
  100462:	75 f4                	jne    100458 <loadUMain+0x4c>
  100464:	8b 42 08             	mov    0x8(%edx),%eax
  100467:	8b 7a 10             	mov    0x10(%edx),%edi
  10046a:	8b 5a 04             	mov    0x4(%edx),%ebx
  10046d:	29 c3                	sub    %eax,%ebx
  10046f:	31 c9                	xor    %ecx,%ecx
  100471:	85 ff                	test   %edi,%edi
  100473:	74 16                	je     10048b <loadUMain+0x7f>
  100475:	8d 76 00             	lea    0x0(%esi),%esi
  100478:	8a 8c 03 00 00 00 03 	mov    0x3000000(%ebx,%eax,1),%cl
  10047f:	88 08                	mov    %cl,(%eax)
  100481:	40                   	inc    %eax
  100482:	89 c1                	mov    %eax,%ecx
  100484:	2b 4a 08             	sub    0x8(%edx),%ecx
  100487:	39 cf                	cmp    %ecx,%edi
  100489:	77 ed                	ja     100478 <loadUMain+0x6c>
  10048b:	8b 5a 14             	mov    0x14(%edx),%ebx
  10048e:	39 cb                	cmp    %ecx,%ebx
  100490:	76 c6                	jbe    100458 <loadUMain+0x4c>
  100492:	66 90                	xchg   %ax,%ax
  100494:	c6 00 00             	movb   $0x0,(%eax)
  100497:	40                   	inc    %eax
  100498:	89 c1                	mov    %eax,%ecx
  10049a:	2b 4a 08             	sub    0x8(%edx),%ecx
  10049d:	39 cb                	cmp    %ecx,%ebx
  10049f:	77 f3                	ja     100494 <loadUMain+0x88>
  1004a1:	83 c2 20             	add    $0x20,%edx
  1004a4:	39 d6                	cmp    %edx,%esi
  1004a6:	77 b7                	ja     10045f <loadUMain+0x53>
  1004a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1004ab:	5b                   	pop    %ebx
  1004ac:	5e                   	pop    %esi
  1004ad:	5f                   	pop    %edi
  1004ae:	5d                   	pop    %ebp
  1004af:	ff 25 18 00 00 03    	jmp    *0x3000018
  1004b5:	66 90                	xchg   %ax,%ax
  1004b7:	90                   	nop

001004b8 <initIdt>:
  1004b8:	55                   	push   %ebp
  1004b9:	89 e5                	mov    %esp,%ebp
  1004bb:	53                   	push   %ebx
  1004bc:	ba 8d 05 10 00       	mov    $0x10058d,%edx
  1004c1:	89 d3                	mov    %edx,%ebx
  1004c3:	c1 ea 10             	shr    $0x10,%edx
  1004c6:	b9 00 1a 10 00       	mov    $0x101a00,%ecx
  1004cb:	b8 00 12 10 00       	mov    $0x101200,%eax
  1004d0:	66 89 18             	mov    %bx,(%eax)
  1004d3:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  1004d9:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  1004dd:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  1004e1:	66 89 50 06          	mov    %dx,0x6(%eax)
  1004e5:	83 c0 08             	add    $0x8,%eax
  1004e8:	39 c1                	cmp    %eax,%ecx
  1004ea:	75 e4                	jne    1004d0 <initIdt+0x18>
  1004ec:	b8 93 05 10 00       	mov    $0x100593,%eax
  1004f1:	66 a3 68 12 10 00    	mov    %ax,0x101268
  1004f7:	66 c7 05 6a 12 10 00 	movw   $0x8,0x10126a
  1004fe:	08 00 
  100500:	c6 05 6c 12 10 00 00 	movb   $0x0,0x10126c
  100507:	c6 05 6d 12 10 00 8f 	movb   $0x8f,0x10126d
  10050e:	c1 e8 10             	shr    $0x10,%eax
  100511:	66 a3 6e 12 10 00    	mov    %ax,0x10126e
  100517:	b8 97 05 10 00       	mov    $0x100597,%eax
  10051c:	66 a3 00 16 10 00    	mov    %ax,0x101600
  100522:	66 c7 05 02 16 10 00 	movw   $0x8,0x101602
  100529:	08 00 
  10052b:	c6 05 04 16 10 00 00 	movb   $0x0,0x101604
  100532:	c6 05 05 16 10 00 ee 	movb   $0xee,0x101605
  100539:	c1 e8 10             	shr    $0x10,%eax
  10053c:	66 a3 06 16 10 00    	mov    %ax,0x101606
  100542:	66 c7 05 28 11 10 00 	movw   $0x7ff,0x101128
  100549:	ff 07 
  10054b:	b8 00 12 10 00       	mov    $0x101200,%eax
  100550:	66 a3 2a 11 10 00    	mov    %ax,0x10112a
  100556:	c1 e8 10             	shr    $0x10,%eax
  100559:	66 a3 2c 11 10 00    	mov    %ax,0x10112c
  10055f:	b8 28 11 10 00       	mov    $0x101128,%eax
  100564:	0f 01 18             	lidtl  (%eax)
  100567:	5b                   	pop    %ebx
  100568:	5d                   	pop    %ebp
  100569:	c3                   	ret    
  10056a:	66 90                	xchg   %ax,%ax

0010056c <kEntry>:
  10056c:	55                   	push   %ebp
  10056d:	89 e5                	mov    %esp,%ebp
  10056f:	83 ec 08             	sub    $0x8,%esp
  100572:	e8 21 fb ff ff       	call   100098 <initSerial>
  100577:	e8 3c ff ff ff       	call   1004b8 <initIdt>
  10057c:	e8 77 fc ff ff       	call   1001f8 <initIntr>
  100581:	e8 56 fd ff ff       	call   1002dc <initSeg>
  100586:	e8 81 fe ff ff       	call   10040c <loadUMain>
  10058b:	eb fe                	jmp    10058b <kEntry+0x1f>

0010058d <irqEmpty>:
  10058d:	6a 00                	push   $0x0
  10058f:	6a ff                	push   $0xffffffff
  100591:	eb 0d                	jmp    1005a0 <asmDoIrq>

00100593 <irqGProtectFault>:
  100593:	6a 0d                	push   $0xd
  100595:	eb 09                	jmp    1005a0 <asmDoIrq>

00100597 <irqSyscall>:
  100597:	6a 00                	push   $0x0
  100599:	68 80 00 00 00       	push   $0x80
  10059e:	eb 00                	jmp    1005a0 <asmDoIrq>

001005a0 <asmDoIrq>:
  1005a0:	60                   	pusha  
  1005a1:	54                   	push   %esp
  1005a2:	e8 a5 fb ff ff       	call   10014c <irqHandle>
  1005a7:	83 c4 04             	add    $0x4,%esp
  1005aa:	61                   	popa   
  1005ab:	83 c4 04             	add    $0x4,%esp
  1005ae:	83 c4 04             	add    $0x4,%esp
  1005b1:	cf                   	iret   
