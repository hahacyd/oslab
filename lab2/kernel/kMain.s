
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
  100122:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  100126:	74 0c                	je     100134 <fs_write+0x34>
  100128:	89 f8                	mov    %edi,%eax
  10012a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10012d:	5b                   	pop    %ebx
  10012e:	5e                   	pop    %esi
  10012f:	5f                   	pop    %edi
  100130:	5d                   	pop    %ebp
  100131:	c3                   	ret    
  100132:	66 90                	xchg   %ax,%ax
  100134:	85 ff                	test   %edi,%edi
  100136:	7e f0                	jle    100128 <fs_write+0x28>
  100138:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  10013b:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
  10013e:	66 90                	xchg   %ax,%ax
  100140:	83 ec 0c             	sub    $0xc,%esp
  100143:	0f be 03             	movsbl (%ebx),%eax
  100146:	50                   	push   %eax
  100147:	e8 8c ff ff ff       	call   1000d8 <putChar>
  10014c:	43                   	inc    %ebx
  10014d:	83 c4 10             	add    $0x10,%esp
  100150:	39 f3                	cmp    %esi,%ebx
  100152:	75 ec                	jne    100140 <fs_write+0x40>
  100154:	89 f8                	mov    %edi,%eax
  100156:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100159:	5b                   	pop    %ebx
  10015a:	5e                   	pop    %esi
  10015b:	5f                   	pop    %edi
  10015c:	5d                   	pop    %ebp
  10015d:	c3                   	ret    
  10015e:	66 90                	xchg   %ax,%ax

00100160 <irqHandle>:
  100160:	55                   	push   %ebp
  100161:	89 e5                	mov    %esp,%ebp
  100163:	53                   	push   %ebx
  100164:	52                   	push   %edx
  100165:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100168:	8b 43 20             	mov    0x20(%ebx),%eax
  10016b:	83 f8 0d             	cmp    $0xd,%eax
  10016e:	74 44                	je     1001b4 <irqHandle+0x54>
  100170:	3d 80 00 00 00       	cmp    $0x80,%eax
  100175:	74 1d                	je     100194 <irqHandle+0x34>
  100177:	40                   	inc    %eax
  100178:	74 12                	je     10018c <irqHandle+0x2c>
  10017a:	83 ec 08             	sub    $0x8,%esp
  10017d:	6a 17                	push   $0x17
  10017f:	68 c6 05 10 00       	push   $0x1005c6
  100184:	e8 77 fe ff ff       	call   100000 <abort>
  100189:	83 c4 10             	add    $0x10,%esp
  10018c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10018f:	c9                   	leave  
  100190:	c3                   	ret    
  100191:	8d 76 00             	lea    0x0(%esi),%esi
  100194:	83 7b 1c 04          	cmpl   $0x4,0x1c(%ebx)
  100198:	75 f2                	jne    10018c <irqHandle+0x2c>
  10019a:	50                   	push   %eax
  10019b:	ff 73 14             	pushl  0x14(%ebx)
  10019e:	ff 73 18             	pushl  0x18(%ebx)
  1001a1:	ff 73 10             	pushl  0x10(%ebx)
  1001a4:	e8 57 ff ff ff       	call   100100 <fs_write>
  1001a9:	89 43 1c             	mov    %eax,0x1c(%ebx)
  1001ac:	83 c4 10             	add    $0x10,%esp
  1001af:	eb db                	jmp    10018c <irqHandle+0x2c>
  1001b1:	8d 76 00             	lea    0x0(%esi),%esi
  1001b4:	83 ec 08             	sub    $0x8,%esp
  1001b7:	6a 3a                	push   $0x3a
  1001b9:	68 c6 05 10 00       	push   $0x1005c6
  1001be:	e8 3d fe ff ff       	call   100000 <abort>
  1001c3:	83 c4 10             	add    $0x10,%esp
  1001c6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1001c9:	c9                   	leave  
  1001ca:	c3                   	ret    
  1001cb:	90                   	nop

001001cc <syscallHandle>:
  1001cc:	55                   	push   %ebp
  1001cd:	89 e5                	mov    %esp,%ebp
  1001cf:	53                   	push   %ebx
  1001d0:	52                   	push   %edx
  1001d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1001d4:	83 7b 1c 04          	cmpl   $0x4,0x1c(%ebx)
  1001d8:	75 15                	jne    1001ef <syscallHandle+0x23>
  1001da:	50                   	push   %eax
  1001db:	ff 73 14             	pushl  0x14(%ebx)
  1001de:	ff 73 18             	pushl  0x18(%ebx)
  1001e1:	ff 73 10             	pushl  0x10(%ebx)
  1001e4:	e8 17 ff ff ff       	call   100100 <fs_write>
  1001e9:	89 43 1c             	mov    %eax,0x1c(%ebx)
  1001ec:	83 c4 10             	add    $0x10,%esp
  1001ef:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1001f2:	c9                   	leave  
  1001f3:	c3                   	ret    

001001f4 <GProtectFaultHandle>:
  1001f4:	55                   	push   %ebp
  1001f5:	89 e5                	mov    %esp,%ebp
  1001f7:	83 ec 10             	sub    $0x10,%esp
  1001fa:	6a 3a                	push   $0x3a
  1001fc:	68 c6 05 10 00       	push   $0x1005c6
  100201:	e8 fa fd ff ff       	call   100000 <abort>
  100206:	83 c4 10             	add    $0x10,%esp
  100209:	c9                   	leave  
  10020a:	c3                   	ret    
  10020b:	90                   	nop

0010020c <initIntr>:
  10020c:	55                   	push   %ebp
  10020d:	89 e5                	mov    %esp,%ebp
  10020f:	ba 21 00 00 00       	mov    $0x21,%edx
  100214:	b0 ff                	mov    $0xff,%al
  100216:	ee                   	out    %al,(%dx)
  100217:	ba a1 00 00 00       	mov    $0xa1,%edx
  10021c:	ee                   	out    %al,(%dx)
  10021d:	ba 20 00 00 00       	mov    $0x20,%edx
  100222:	b0 11                	mov    $0x11,%al
  100224:	ee                   	out    %al,(%dx)
  100225:	ba 21 00 00 00       	mov    $0x21,%edx
  10022a:	b0 20                	mov    $0x20,%al
  10022c:	ee                   	out    %al,(%dx)
  10022d:	b0 04                	mov    $0x4,%al
  10022f:	ee                   	out    %al,(%dx)
  100230:	b0 03                	mov    $0x3,%al
  100232:	ee                   	out    %al,(%dx)
  100233:	ba a0 00 00 00       	mov    $0xa0,%edx
  100238:	b0 11                	mov    $0x11,%al
  10023a:	ee                   	out    %al,(%dx)
  10023b:	ba a1 00 00 00       	mov    $0xa1,%edx
  100240:	b0 28                	mov    $0x28,%al
  100242:	ee                   	out    %al,(%dx)
  100243:	b0 02                	mov    $0x2,%al
  100245:	ee                   	out    %al,(%dx)
  100246:	b0 03                	mov    $0x3,%al
  100248:	ee                   	out    %al,(%dx)
  100249:	ba 20 00 00 00       	mov    $0x20,%edx
  10024e:	b0 68                	mov    $0x68,%al
  100250:	ee                   	out    %al,(%dx)
  100251:	b0 0a                	mov    $0xa,%al
  100253:	ee                   	out    %al,(%dx)
  100254:	ba a0 00 00 00       	mov    $0xa0,%edx
  100259:	b0 68                	mov    $0x68,%al
  10025b:	ee                   	out    %al,(%dx)
  10025c:	b0 0a                	mov    $0xa,%al
  10025e:	ee                   	out    %al,(%dx)
  10025f:	5d                   	pop    %ebp
  100260:	c3                   	ret    
  100261:	66 90                	xchg   %ax,%ax
  100263:	90                   	nop

00100264 <waitDisk>:
  100264:	55                   	push   %ebp
  100265:	89 e5                	mov    %esp,%ebp
  100267:	ba f7 01 00 00       	mov    $0x1f7,%edx
  10026c:	ec                   	in     (%dx),%al
  10026d:	83 e0 c0             	and    $0xffffffc0,%eax
  100270:	3c 40                	cmp    $0x40,%al
  100272:	75 f8                	jne    10026c <waitDisk+0x8>
  100274:	5d                   	pop    %ebp
  100275:	c3                   	ret    
  100276:	66 90                	xchg   %ax,%ax

00100278 <readSect>:
  100278:	55                   	push   %ebp
  100279:	89 e5                	mov    %esp,%ebp
  10027b:	53                   	push   %ebx
  10027c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10027f:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100284:	ec                   	in     (%dx),%al
  100285:	83 e0 c0             	and    $0xffffffc0,%eax
  100288:	3c 40                	cmp    $0x40,%al
  10028a:	75 f8                	jne    100284 <readSect+0xc>
  10028c:	ba f2 01 00 00       	mov    $0x1f2,%edx
  100291:	b0 01                	mov    $0x1,%al
  100293:	ee                   	out    %al,(%dx)
  100294:	ba f3 01 00 00       	mov    $0x1f3,%edx
  100299:	88 c8                	mov    %cl,%al
  10029b:	ee                   	out    %al,(%dx)
  10029c:	89 c8                	mov    %ecx,%eax
  10029e:	c1 f8 08             	sar    $0x8,%eax
  1002a1:	ba f4 01 00 00       	mov    $0x1f4,%edx
  1002a6:	ee                   	out    %al,(%dx)
  1002a7:	89 c8                	mov    %ecx,%eax
  1002a9:	c1 f8 10             	sar    $0x10,%eax
  1002ac:	ba f5 01 00 00       	mov    $0x1f5,%edx
  1002b1:	ee                   	out    %al,(%dx)
  1002b2:	89 c8                	mov    %ecx,%eax
  1002b4:	c1 f8 18             	sar    $0x18,%eax
  1002b7:	83 c8 e0             	or     $0xffffffe0,%eax
  1002ba:	ba f6 01 00 00       	mov    $0x1f6,%edx
  1002bf:	ee                   	out    %al,(%dx)
  1002c0:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1002c5:	b0 20                	mov    $0x20,%al
  1002c7:	ee                   	out    %al,(%dx)
  1002c8:	ec                   	in     (%dx),%al
  1002c9:	83 e0 c0             	and    $0xffffffc0,%eax
  1002cc:	3c 40                	cmp    $0x40,%al
  1002ce:	75 f8                	jne    1002c8 <readSect+0x50>
  1002d0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1002d3:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  1002d9:	ba f0 01 00 00       	mov    $0x1f0,%edx
  1002de:	66 90                	xchg   %ax,%ax
  1002e0:	ed                   	in     (%dx),%eax
  1002e1:	89 01                	mov    %eax,(%ecx)
  1002e3:	83 c1 04             	add    $0x4,%ecx
  1002e6:	39 d9                	cmp    %ebx,%ecx
  1002e8:	75 f6                	jne    1002e0 <readSect+0x68>
  1002ea:	5b                   	pop    %ebx
  1002eb:	5d                   	pop    %ebp
  1002ec:	c3                   	ret    
  1002ed:	8d 76 00             	lea    0x0(%esi),%esi

001002f0 <initSeg>:
  1002f0:	55                   	push   %ebp
  1002f1:	89 e5                	mov    %esp,%ebp
  1002f3:	ba 40 11 10 00       	mov    $0x101140,%edx
  1002f8:	66 c7 05 48 11 10 00 	movw   $0xffff,0x101148
  1002ff:	ff ff 
  100301:	66 c7 05 4a 11 10 00 	movw   $0x0,0x10114a
  100308:	00 00 
  10030a:	c6 05 4c 11 10 00 00 	movb   $0x0,0x10114c
  100311:	c6 05 4d 11 10 00 9a 	movb   $0x9a,0x10114d
  100318:	c6 05 4e 11 10 00 cf 	movb   $0xcf,0x10114e
  10031f:	c6 05 4f 11 10 00 00 	movb   $0x0,0x10114f
  100326:	66 c7 05 50 11 10 00 	movw   $0xffff,0x101150
  10032d:	ff ff 
  10032f:	66 c7 05 52 11 10 00 	movw   $0x0,0x101152
  100336:	00 00 
  100338:	c6 05 54 11 10 00 00 	movb   $0x0,0x101154
  10033f:	c6 05 55 11 10 00 92 	movb   $0x92,0x101155
  100346:	c6 05 56 11 10 00 cf 	movb   $0xcf,0x101156
  10034d:	c6 05 57 11 10 00 00 	movb   $0x0,0x101157
  100354:	66 c7 05 58 11 10 00 	movw   $0xffff,0x101158
  10035b:	ff ff 
  10035d:	66 c7 05 5a 11 10 00 	movw   $0x0,0x10115a
  100364:	00 00 
  100366:	c6 05 5c 11 10 00 00 	movb   $0x0,0x10115c
  10036d:	c6 05 5d 11 10 00 fa 	movb   $0xfa,0x10115d
  100374:	c6 05 5e 11 10 00 cf 	movb   $0xcf,0x10115e
  10037b:	c6 05 5f 11 10 00 00 	movb   $0x0,0x10115f
  100382:	66 c7 05 60 11 10 00 	movw   $0xffff,0x101160
  100389:	ff ff 
  10038b:	66 c7 05 62 11 10 00 	movw   $0x0,0x101162
  100392:	00 00 
  100394:	c6 05 64 11 10 00 00 	movb   $0x0,0x101164
  10039b:	c6 05 65 11 10 00 f2 	movb   $0xf2,0x101165
  1003a2:	c6 05 66 11 10 00 cf 	movb   $0xcf,0x101166
  1003a9:	c6 05 67 11 10 00 00 	movb   $0x0,0x101167
  1003b0:	66 c7 05 68 11 10 00 	movw   $0x63,0x101168
  1003b7:	63 00 
  1003b9:	b8 80 11 10 00       	mov    $0x101180,%eax
  1003be:	66 a3 6a 11 10 00    	mov    %ax,0x10116a
  1003c4:	89 c1                	mov    %eax,%ecx
  1003c6:	c1 e9 10             	shr    $0x10,%ecx
  1003c9:	88 0d 6c 11 10 00    	mov    %cl,0x10116c
  1003cf:	c6 05 6d 11 10 00 89 	movb   $0x89,0x10116d
  1003d6:	c6 05 6e 11 10 00 40 	movb   $0x40,0x10116e
  1003dd:	c1 e8 18             	shr    $0x18,%eax
  1003e0:	a2 6f 11 10 00       	mov    %al,0x10116f
  1003e5:	66 c7 05 20 11 10 00 	movw   $0x37,0x101120
  1003ec:	37 00 
  1003ee:	66 89 15 22 11 10 00 	mov    %dx,0x101122
  1003f5:	c1 ea 10             	shr    $0x10,%edx
  1003f8:	66 89 15 24 11 10 00 	mov    %dx,0x101124
  1003ff:	b8 20 11 10 00       	mov    $0x101120,%eax
  100404:	0f 01 10             	lgdtl  (%eax)
  100407:	b8 28 00 00 00       	mov    $0x28,%eax
  10040c:	0f 00 d8             	ltr    %ax
  10040f:	31 c0                	xor    %eax,%eax
  100411:	0f 00 d0             	lldt   %ax
  100414:	5d                   	pop    %ebp
  100415:	c3                   	ret    
  100416:	66 90                	xchg   %ax,%ax

00100418 <enterUserSpace>:
  100418:	55                   	push   %ebp
  100419:	89 e5                	mov    %esp,%ebp
  10041b:	cf                   	iret   
  10041c:	5d                   	pop    %ebp
  10041d:	c3                   	ret    
  10041e:	66 90                	xchg   %ax,%ax

00100420 <loadUMain>:
  100420:	55                   	push   %ebp
  100421:	89 e5                	mov    %esp,%ebp
  100423:	57                   	push   %edi
  100424:	56                   	push   %esi
  100425:	53                   	push   %ebx
  100426:	83 ec 0c             	sub    $0xc,%esp
  100429:	bb c9 00 00 00       	mov    $0xc9,%ebx
  10042e:	be 00 00 00 03       	mov    $0x3000000,%esi
  100433:	90                   	nop
  100434:	53                   	push   %ebx
  100435:	56                   	push   %esi
  100436:	e8 3d fe ff ff       	call   100278 <readSect>
  10043b:	81 c6 00 02 00 00    	add    $0x200,%esi
  100441:	43                   	inc    %ebx
  100442:	58                   	pop    %eax
  100443:	5a                   	pop    %edx
  100444:	81 fb 91 01 00 00    	cmp    $0x191,%ebx
  10044a:	75 e8                	jne    100434 <loadUMain+0x14>
  10044c:	a1 1c 00 00 03       	mov    0x300001c,%eax
  100451:	8d 90 00 00 00 03    	lea    0x3000000(%eax),%edx
  100457:	0f b7 35 2c 00 00 03 	movzwl 0x300002c,%esi
  10045e:	c1 e6 05             	shl    $0x5,%esi
  100461:	01 d6                	add    %edx,%esi
  100463:	39 f2                	cmp    %esi,%edx
  100465:	72 0c                	jb     100473 <loadUMain+0x53>
  100467:	eb 53                	jmp    1004bc <loadUMain+0x9c>
  100469:	8d 76 00             	lea    0x0(%esi),%esi
  10046c:	83 c2 20             	add    $0x20,%edx
  10046f:	39 d6                	cmp    %edx,%esi
  100471:	76 49                	jbe    1004bc <loadUMain+0x9c>
  100473:	83 3a 01             	cmpl   $0x1,(%edx)
  100476:	75 f4                	jne    10046c <loadUMain+0x4c>
  100478:	8b 42 08             	mov    0x8(%edx),%eax
  10047b:	8b 7a 10             	mov    0x10(%edx),%edi
  10047e:	8b 5a 04             	mov    0x4(%edx),%ebx
  100481:	29 c3                	sub    %eax,%ebx
  100483:	31 c9                	xor    %ecx,%ecx
  100485:	85 ff                	test   %edi,%edi
  100487:	74 16                	je     10049f <loadUMain+0x7f>
  100489:	8d 76 00             	lea    0x0(%esi),%esi
  10048c:	8a 8c 03 00 00 00 03 	mov    0x3000000(%ebx,%eax,1),%cl
  100493:	88 08                	mov    %cl,(%eax)
  100495:	40                   	inc    %eax
  100496:	89 c1                	mov    %eax,%ecx
  100498:	2b 4a 08             	sub    0x8(%edx),%ecx
  10049b:	39 cf                	cmp    %ecx,%edi
  10049d:	77 ed                	ja     10048c <loadUMain+0x6c>
  10049f:	8b 5a 14             	mov    0x14(%edx),%ebx
  1004a2:	39 cb                	cmp    %ecx,%ebx
  1004a4:	76 c6                	jbe    10046c <loadUMain+0x4c>
  1004a6:	66 90                	xchg   %ax,%ax
  1004a8:	c6 00 00             	movb   $0x0,(%eax)
  1004ab:	40                   	inc    %eax
  1004ac:	89 c1                	mov    %eax,%ecx
  1004ae:	2b 4a 08             	sub    0x8(%edx),%ecx
  1004b1:	39 cb                	cmp    %ecx,%ebx
  1004b3:	77 f3                	ja     1004a8 <loadUMain+0x88>
  1004b5:	83 c2 20             	add    $0x20,%edx
  1004b8:	39 d6                	cmp    %edx,%esi
  1004ba:	77 b7                	ja     100473 <loadUMain+0x53>
  1004bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1004bf:	5b                   	pop    %ebx
  1004c0:	5e                   	pop    %esi
  1004c1:	5f                   	pop    %edi
  1004c2:	5d                   	pop    %ebp
  1004c3:	ff 25 18 00 00 03    	jmp    *0x3000018
  1004c9:	66 90                	xchg   %ax,%ax
  1004cb:	90                   	nop

001004cc <initIdt>:
  1004cc:	55                   	push   %ebp
  1004cd:	89 e5                	mov    %esp,%ebp
  1004cf:	53                   	push   %ebx
  1004d0:	ba a1 05 10 00       	mov    $0x1005a1,%edx
  1004d5:	89 d3                	mov    %edx,%ebx
  1004d7:	c1 ea 10             	shr    $0x10,%edx
  1004da:	b9 00 1a 10 00       	mov    $0x101a00,%ecx
  1004df:	b8 00 12 10 00       	mov    $0x101200,%eax
  1004e4:	66 89 18             	mov    %bx,(%eax)
  1004e7:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  1004ed:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  1004f1:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  1004f5:	66 89 50 06          	mov    %dx,0x6(%eax)
  1004f9:	83 c0 08             	add    $0x8,%eax
  1004fc:	39 c1                	cmp    %eax,%ecx
  1004fe:	75 e4                	jne    1004e4 <initIdt+0x18>
  100500:	b8 a7 05 10 00       	mov    $0x1005a7,%eax
  100505:	66 a3 68 12 10 00    	mov    %ax,0x101268
  10050b:	66 c7 05 6a 12 10 00 	movw   $0x8,0x10126a
  100512:	08 00 
  100514:	c6 05 6c 12 10 00 00 	movb   $0x0,0x10126c
  10051b:	c6 05 6d 12 10 00 8f 	movb   $0x8f,0x10126d
  100522:	c1 e8 10             	shr    $0x10,%eax
  100525:	66 a3 6e 12 10 00    	mov    %ax,0x10126e
  10052b:	b8 ab 05 10 00       	mov    $0x1005ab,%eax
  100530:	66 a3 00 16 10 00    	mov    %ax,0x101600
  100536:	66 c7 05 02 16 10 00 	movw   $0x8,0x101602
  10053d:	08 00 
  10053f:	c6 05 04 16 10 00 00 	movb   $0x0,0x101604
  100546:	c6 05 05 16 10 00 ee 	movb   $0xee,0x101605
  10054d:	c1 e8 10             	shr    $0x10,%eax
  100550:	66 a3 06 16 10 00    	mov    %ax,0x101606
  100556:	66 c7 05 28 11 10 00 	movw   $0x7ff,0x101128
  10055d:	ff 07 
  10055f:	b8 00 12 10 00       	mov    $0x101200,%eax
  100564:	66 a3 2a 11 10 00    	mov    %ax,0x10112a
  10056a:	c1 e8 10             	shr    $0x10,%eax
  10056d:	66 a3 2c 11 10 00    	mov    %ax,0x10112c
  100573:	b8 28 11 10 00       	mov    $0x101128,%eax
  100578:	0f 01 18             	lidtl  (%eax)
  10057b:	5b                   	pop    %ebx
  10057c:	5d                   	pop    %ebp
  10057d:	c3                   	ret    
  10057e:	66 90                	xchg   %ax,%ax

00100580 <kEntry>:
  100580:	55                   	push   %ebp
  100581:	89 e5                	mov    %esp,%ebp
  100583:	83 ec 08             	sub    $0x8,%esp
  100586:	e8 0d fb ff ff       	call   100098 <initSerial>
  10058b:	e8 3c ff ff ff       	call   1004cc <initIdt>
  100590:	e8 77 fc ff ff       	call   10020c <initIntr>
  100595:	e8 56 fd ff ff       	call   1002f0 <initSeg>
  10059a:	e8 81 fe ff ff       	call   100420 <loadUMain>
  10059f:	eb fe                	jmp    10059f <kEntry+0x1f>

001005a1 <irqEmpty>:
  1005a1:	6a 00                	push   $0x0
  1005a3:	6a ff                	push   $0xffffffff
  1005a5:	eb 0d                	jmp    1005b4 <asmDoIrq>

001005a7 <irqGProtectFault>:
  1005a7:	6a 0d                	push   $0xd
  1005a9:	eb 09                	jmp    1005b4 <asmDoIrq>

001005ab <irqSyscall>:
  1005ab:	6a 00                	push   $0x0
  1005ad:	68 80 00 00 00       	push   $0x80
  1005b2:	eb 00                	jmp    1005b4 <asmDoIrq>

001005b4 <asmDoIrq>:
  1005b4:	60                   	pusha  
  1005b5:	54                   	push   %esp
  1005b6:	e8 a5 fb ff ff       	call   100160 <irqHandle>
  1005bb:	83 c4 04             	add    $0x4,%esp
  1005be:	61                   	popa   
  1005bf:	83 c4 04             	add    $0x4,%esp
  1005c2:	83 c4 04             	add    $0x4,%esp
  1005c5:	cf                   	iret   
