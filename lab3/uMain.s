
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	53                   	push   %ebx
  200004:	53                   	push   %ebx
  200005:	e8 aa 00 00 00       	call   2000b4 <fork>
  20000a:	85 c0                	test   %eax,%eax
  20000c:	75 4a                	jne    200058 <uEntry+0x58>
  20000e:	c7 05 7c 15 20 00 02 	movl   $0x2,0x20157c
  200015:	00 00 00 
  200018:	b8 02 00 00 00       	mov    $0x2,%eax
  20001d:	bb 08 00 00 00       	mov    $0x8,%ebx
  200022:	eb 05                	jmp    200029 <uEntry+0x29>
  200024:	a1 7c 15 20 00       	mov    0x20157c,%eax
  200029:	4b                   	dec    %ebx
  20002a:	51                   	push   %ecx
  20002b:	53                   	push   %ebx
  20002c:	50                   	push   %eax
  20002d:	68 7a 03 20 00       	push   $0x20037a
  200032:	e8 55 02 00 00       	call   20028c <printf>
  200037:	c7 04 24 80 00 00 00 	movl   $0x80,(%esp)
  20003e:	e8 89 00 00 00       	call   2000cc <sleep>
  200043:	83 c4 10             	add    $0x10,%esp
  200046:	85 db                	test   %ebx,%ebx
  200048:	75 da                	jne    200024 <uEntry+0x24>
  20004a:	e8 b1 00 00 00       	call   200100 <exit>
  20004f:	31 c0                	xor    %eax,%eax
  200051:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  200054:	c9                   	leave  
  200055:	c3                   	ret    
  200056:	66 90                	xchg   %ax,%ax
  200058:	40                   	inc    %eax
  200059:	74 f4                	je     20004f <uEntry+0x4f>
  20005b:	c7 05 7c 15 20 00 01 	movl   $0x1,0x20157c
  200062:	00 00 00 
  200065:	b8 01 00 00 00       	mov    $0x1,%eax
  20006a:	bb 08 00 00 00       	mov    $0x8,%ebx
  20006f:	eb 08                	jmp    200079 <uEntry+0x79>
  200071:	8d 76 00             	lea    0x0(%esi),%esi
  200074:	a1 7c 15 20 00       	mov    0x20157c,%eax
  200079:	4b                   	dec    %ebx
  20007a:	52                   	push   %edx
  20007b:	53                   	push   %ebx
  20007c:	50                   	push   %eax
  20007d:	68 96 03 20 00       	push   $0x200396
  200082:	e8 05 02 00 00       	call   20028c <printf>
  200087:	c7 04 24 80 00 00 00 	movl   $0x80,(%esp)
  20008e:	e8 39 00 00 00       	call   2000cc <sleep>
  200093:	83 c4 10             	add    $0x10,%esp
  200096:	85 db                	test   %ebx,%ebx
  200098:	75 da                	jne    200074 <uEntry+0x74>
  20009a:	eb ae                	jmp    20004a <uEntry+0x4a>

0020009c <syscall>:
  20009c:	55                   	push   %ebp
  20009d:	89 e5                	mov    %esp,%ebp
  20009f:	53                   	push   %ebx
  2000a0:	8b 55 14             	mov    0x14(%ebp),%edx
  2000a3:	8b 4d 10             	mov    0x10(%ebp),%ecx
  2000a6:	8b 45 08             	mov    0x8(%ebp),%eax
  2000a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  2000ac:	cd 80                	int    $0x80
  2000ae:	5b                   	pop    %ebx
  2000af:	5d                   	pop    %ebp
  2000b0:	c3                   	ret    
  2000b1:	8d 76 00             	lea    0x0(%esi),%esi

002000b4 <fork>:
  2000b4:	55                   	push   %ebp
  2000b5:	89 e5                	mov    %esp,%ebp
  2000b7:	53                   	push   %ebx
  2000b8:	b9 01 00 00 00       	mov    $0x1,%ecx
  2000bd:	b8 02 00 00 00       	mov    $0x2,%eax
  2000c2:	89 cb                	mov    %ecx,%ebx
  2000c4:	89 ca                	mov    %ecx,%edx
  2000c6:	cd 80                	int    $0x80
  2000c8:	5b                   	pop    %ebx
  2000c9:	5d                   	pop    %ebp
  2000ca:	c3                   	ret    
  2000cb:	90                   	nop

002000cc <sleep>:
  2000cc:	55                   	push   %ebp
  2000cd:	89 e5                	mov    %esp,%ebp
  2000cf:	53                   	push   %ebx
  2000d0:	b9 01 00 00 00       	mov    $0x1,%ecx
  2000d5:	b8 e6 00 00 00       	mov    $0xe6,%eax
  2000da:	8b 5d 08             	mov    0x8(%ebp),%ebx
  2000dd:	89 ca                	mov    %ecx,%edx
  2000df:	cd 80                	int    $0x80
  2000e1:	31 c0                	xor    %eax,%eax
  2000e3:	5b                   	pop    %ebx
  2000e4:	5d                   	pop    %ebp
  2000e5:	c3                   	ret    
  2000e6:	66 90                	xchg   %ax,%ax

002000e8 <getpid>:
  2000e8:	55                   	push   %ebp
  2000e9:	89 e5                	mov    %esp,%ebp
  2000eb:	53                   	push   %ebx
  2000ec:	b9 01 00 00 00       	mov    $0x1,%ecx
  2000f1:	b8 07 00 00 00       	mov    $0x7,%eax
  2000f6:	89 cb                	mov    %ecx,%ebx
  2000f8:	89 ca                	mov    %ecx,%edx
  2000fa:	cd 80                	int    $0x80
  2000fc:	5b                   	pop    %ebx
  2000fd:	5d                   	pop    %ebp
  2000fe:	c3                   	ret    
  2000ff:	90                   	nop

00200100 <exit>:
  200100:	55                   	push   %ebp
  200101:	89 e5                	mov    %esp,%ebp
  200103:	53                   	push   %ebx
  200104:	31 d2                	xor    %edx,%edx
  200106:	b8 01 00 00 00       	mov    $0x1,%eax
  20010b:	89 d3                	mov    %edx,%ebx
  20010d:	89 d1                	mov    %edx,%ecx
  20010f:	cd 80                	int    $0x80
  200111:	31 c0                	xor    %eax,%eax
  200113:	5b                   	pop    %ebx
  200114:	5d                   	pop    %ebp
  200115:	c3                   	ret    
  200116:	66 90                	xchg   %ax,%ax

00200118 <printd>:
  200118:	55                   	push   %ebp
  200119:	89 e5                	mov    %esp,%ebp
  20011b:	57                   	push   %edi
  20011c:	56                   	push   %esi
  20011d:	53                   	push   %ebx
  20011e:	83 ec 74             	sub    $0x74,%esp
  200121:	8b 5d 08             	mov    0x8(%ebp),%ebx
  200124:	85 db                	test   %ebx,%ebx
  200126:	78 7c                	js     2001a4 <printd+0x8c>
  200128:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
  20012c:	c6 45 83 00          	movb   $0x0,-0x7d(%ebp)
  200130:	8d 4d f3             	lea    -0xd(%ebp),%ecx
  200133:	be 0a 00 00 00       	mov    $0xa,%esi
  200138:	bf 67 66 66 66       	mov    $0x66666667,%edi
  20013d:	8d 76 00             	lea    0x0(%esi),%esi
  200140:	49                   	dec    %ecx
  200141:	89 d8                	mov    %ebx,%eax
  200143:	99                   	cltd   
  200144:	f7 fe                	idiv   %esi
  200146:	83 c2 30             	add    $0x30,%edx
  200149:	88 11                	mov    %dl,(%ecx)
  20014b:	89 d8                	mov    %ebx,%eax
  20014d:	f7 ef                	imul   %edi
  20014f:	89 d0                	mov    %edx,%eax
  200151:	c1 f8 02             	sar    $0x2,%eax
  200154:	c1 fb 1f             	sar    $0x1f,%ebx
  200157:	29 d8                	sub    %ebx,%eax
  200159:	89 c3                	mov    %eax,%ebx
  20015b:	75 e3                	jne    200140 <printd+0x28>
  20015d:	80 7d 83 01          	cmpb   $0x1,-0x7d(%ebp)
  200161:	74 31                	je     200194 <printd+0x7c>
  200163:	80 7d 82 01          	cmpb   $0x1,-0x7e(%ebp)
  200167:	74 36                	je     20019f <printd+0x87>
  200169:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  20016d:	80 39 00             	cmpb   $0x0,(%ecx)
  200170:	74 54                	je     2001c6 <printd+0xae>
  200172:	31 c0                	xor    %eax,%eax
  200174:	40                   	inc    %eax
  200175:	89 c2                	mov    %eax,%edx
  200177:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  20017b:	75 f7                	jne    200174 <printd+0x5c>
  20017d:	bb 01 00 00 00       	mov    $0x1,%ebx
  200182:	b8 04 00 00 00       	mov    $0x4,%eax
  200187:	cd 80                	int    $0x80
  200189:	83 c4 74             	add    $0x74,%esp
  20018c:	5b                   	pop    %ebx
  20018d:	5e                   	pop    %esi
  20018e:	5f                   	pop    %edi
  20018f:	5d                   	pop    %ebp
  200190:	c3                   	ret    
  200191:	8d 76 00             	lea    0x0(%esi),%esi
  200194:	c6 41 ff 2d          	movb   $0x2d,-0x1(%ecx)
  200198:	49                   	dec    %ecx
  200199:	80 7d 82 01          	cmpb   $0x1,-0x7e(%ebp)
  20019d:	75 ca                	jne    200169 <printd+0x51>
  20019f:	fe 45 ac             	incb   -0x54(%ebp)
  2001a2:	eb c5                	jmp    200169 <printd+0x51>
  2001a4:	81 fb 00 00 00 80    	cmp    $0x80000000,%ebx
  2001aa:	74 0f                	je     2001bb <printd+0xa3>
  2001ac:	f7 db                	neg    %ebx
  2001ae:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
  2001b2:	c6 45 83 01          	movb   $0x1,-0x7d(%ebp)
  2001b6:	e9 75 ff ff ff       	jmp    200130 <printd+0x18>
  2001bb:	bb ff ff ff 7f       	mov    $0x7fffffff,%ebx
  2001c0:	c6 45 82 01          	movb   $0x1,-0x7e(%ebp)
  2001c4:	eb ec                	jmp    2001b2 <printd+0x9a>
  2001c6:	31 d2                	xor    %edx,%edx
  2001c8:	eb b3                	jmp    20017d <printd+0x65>
  2001ca:	66 90                	xchg   %ax,%ax

002001cc <printx>:
  2001cc:	55                   	push   %ebp
  2001cd:	89 e5                	mov    %esp,%ebp
  2001cf:	53                   	push   %ebx
  2001d0:	83 ec 20             	sub    $0x20,%esp
  2001d3:	8b 45 08             	mov    0x8(%ebp),%eax
  2001d6:	8d 5d fa             	lea    -0x6(%ebp),%ebx
  2001d9:	eb 12                	jmp    2001ed <printx+0x21>
  2001db:	90                   	nop
  2001dc:	83 c2 57             	add    $0x57,%edx
  2001df:	88 13                	mov    %dl,(%ebx)
  2001e1:	85 c0                	test   %eax,%eax
  2001e3:	78 22                	js     200207 <printx+0x3b>
  2001e5:	c1 f8 04             	sar    $0x4,%eax
  2001e8:	4b                   	dec    %ebx
  2001e9:	85 c0                	test   %eax,%eax
  2001eb:	74 25                	je     200212 <printx+0x46>
  2001ed:	89 c2                	mov    %eax,%edx
  2001ef:	81 e2 0f 00 00 80    	and    $0x8000000f,%edx
  2001f5:	78 41                	js     200238 <printx+0x6c>
  2001f7:	89 d9                	mov    %ebx,%ecx
  2001f9:	83 fa 09             	cmp    $0x9,%edx
  2001fc:	7f de                	jg     2001dc <printx+0x10>
  2001fe:	83 c2 30             	add    $0x30,%edx
  200201:	88 13                	mov    %dl,(%ebx)
  200203:	85 c0                	test   %eax,%eax
  200205:	79 de                	jns    2001e5 <printx+0x19>
  200207:	83 c0 0f             	add    $0xf,%eax
  20020a:	c1 f8 04             	sar    $0x4,%eax
  20020d:	4b                   	dec    %ebx
  20020e:	85 c0                	test   %eax,%eax
  200210:	75 db                	jne    2001ed <printx+0x21>
  200212:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
  200216:	80 39 00             	cmpb   $0x0,(%ecx)
  200219:	74 24                	je     20023f <printx+0x73>
  20021b:	90                   	nop
  20021c:	40                   	inc    %eax
  20021d:	89 c2                	mov    %eax,%edx
  20021f:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  200223:	75 f7                	jne    20021c <printx+0x50>
  200225:	bb 01 00 00 00       	mov    $0x1,%ebx
  20022a:	b8 04 00 00 00       	mov    $0x4,%eax
  20022f:	cd 80                	int    $0x80
  200231:	83 c4 20             	add    $0x20,%esp
  200234:	5b                   	pop    %ebx
  200235:	5d                   	pop    %ebp
  200236:	c3                   	ret    
  200237:	90                   	nop
  200238:	4a                   	dec    %edx
  200239:	83 ca f0             	or     $0xfffffff0,%edx
  20023c:	42                   	inc    %edx
  20023d:	eb b8                	jmp    2001f7 <printx+0x2b>
  20023f:	31 d2                	xor    %edx,%edx
  200241:	eb e2                	jmp    200225 <printx+0x59>
  200243:	90                   	nop

00200244 <printc>:
  200244:	55                   	push   %ebp
  200245:	89 e5                	mov    %esp,%ebp
  200247:	53                   	push   %ebx
  200248:	50                   	push   %eax
  200249:	bb 01 00 00 00       	mov    $0x1,%ebx
  20024e:	8d 4d f8             	lea    -0x8(%ebp),%ecx
  200251:	b8 04 00 00 00       	mov    $0x4,%eax
  200256:	89 da                	mov    %ebx,%edx
  200258:	cd 80                	int    $0x80
  20025a:	5a                   	pop    %edx
  20025b:	5b                   	pop    %ebx
  20025c:	5d                   	pop    %ebp
  20025d:	c3                   	ret    
  20025e:	66 90                	xchg   %ax,%ax

00200260 <prints>:
  200260:	55                   	push   %ebp
  200261:	89 e5                	mov    %esp,%ebp
  200263:	53                   	push   %ebx
  200264:	8b 4d 08             	mov    0x8(%ebp),%ecx
  200267:	80 39 00             	cmpb   $0x0,(%ecx)
  20026a:	74 1c                	je     200288 <prints+0x28>
  20026c:	31 c0                	xor    %eax,%eax
  20026e:	66 90                	xchg   %ax,%ax
  200270:	40                   	inc    %eax
  200271:	89 c2                	mov    %eax,%edx
  200273:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  200277:	75 f7                	jne    200270 <prints+0x10>
  200279:	bb 01 00 00 00       	mov    $0x1,%ebx
  20027e:	b8 04 00 00 00       	mov    $0x4,%eax
  200283:	cd 80                	int    $0x80
  200285:	5b                   	pop    %ebx
  200286:	5d                   	pop    %ebp
  200287:	c3                   	ret    
  200288:	31 d2                	xor    %edx,%edx
  20028a:	eb ed                	jmp    200279 <prints+0x19>

0020028c <printf>:
  20028c:	55                   	push   %ebp
  20028d:	89 e5                	mov    %esp,%ebp
  20028f:	57                   	push   %edi
  200290:	56                   	push   %esi
  200291:	53                   	push   %ebx
  200292:	83 ec 14             	sub    $0x14,%esp
  200295:	8b 7d 08             	mov    0x8(%ebp),%edi
  200298:	8a 07                	mov    (%edi),%al
  20029a:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  20029d:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  2002a0:	84 c0                	test   %al,%al
  2002a2:	75 24                	jne    2002c8 <printf+0x3c>
  2002a4:	eb 59                	jmp    2002ff <printf+0x73>
  2002a6:	66 90                	xchg   %ax,%ax
  2002a8:	88 45 f3             	mov    %al,-0xd(%ebp)
  2002ab:	ba 01 00 00 00       	mov    $0x1,%edx
  2002b0:	b8 04 00 00 00       	mov    $0x4,%eax
  2002b5:	89 d3                	mov    %edx,%ebx
  2002b7:	8d 4d f3             	lea    -0xd(%ebp),%ecx
  2002ba:	cd 80                	int    $0x80
  2002bc:	89 fe                	mov    %edi,%esi
  2002be:	8d 7e 01             	lea    0x1(%esi),%edi
  2002c1:	8a 46 01             	mov    0x1(%esi),%al
  2002c4:	84 c0                	test   %al,%al
  2002c6:	74 37                	je     2002ff <printf+0x73>
  2002c8:	3c 25                	cmp    $0x25,%al
  2002ca:	75 dc                	jne    2002a8 <printf+0x1c>
  2002cc:	8d 77 01             	lea    0x1(%edi),%esi
  2002cf:	8a 47 01             	mov    0x1(%edi),%al
  2002d2:	3c 64                	cmp    $0x64,%al
  2002d4:	0f 84 86 00 00 00    	je     200360 <printf+0xd4>
  2002da:	7e 2c                	jle    200308 <printf+0x7c>
  2002dc:	3c 73                	cmp    $0x73,%al
  2002de:	74 50                	je     200330 <printf+0xa4>
  2002e0:	3c 78                	cmp    $0x78,%al
  2002e2:	75 da                	jne    2002be <printf+0x32>
  2002e4:	8b 45 e0             	mov    -0x20(%ebp),%eax
  2002e7:	8d 58 04             	lea    0x4(%eax),%ebx
  2002ea:	ff 30                	pushl  (%eax)
  2002ec:	e8 db fe ff ff       	call   2001cc <printx>
  2002f1:	58                   	pop    %eax
  2002f2:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  2002f5:	8d 7e 01             	lea    0x1(%esi),%edi
  2002f8:	8a 46 01             	mov    0x1(%esi),%al
  2002fb:	84 c0                	test   %al,%al
  2002fd:	75 c9                	jne    2002c8 <printf+0x3c>
  2002ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
  200302:	5b                   	pop    %ebx
  200303:	5e                   	pop    %esi
  200304:	5f                   	pop    %edi
  200305:	5d                   	pop    %ebp
  200306:	c3                   	ret    
  200307:	90                   	nop
  200308:	3c 63                	cmp    $0x63,%al
  20030a:	75 b2                	jne    2002be <printf+0x32>
  20030c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  20030f:	8d 78 04             	lea    0x4(%eax),%edi
  200312:	8b 00                	mov    (%eax),%eax
  200314:	88 45 f2             	mov    %al,-0xe(%ebp)
  200317:	ba 01 00 00 00       	mov    $0x1,%edx
  20031c:	b8 04 00 00 00       	mov    $0x4,%eax
  200321:	89 d3                	mov    %edx,%ebx
  200323:	8d 4d f2             	lea    -0xe(%ebp),%ecx
  200326:	cd 80                	int    $0x80
  200328:	89 7d e0             	mov    %edi,-0x20(%ebp)
  20032b:	eb 91                	jmp    2002be <printf+0x32>
  20032d:	8d 76 00             	lea    0x0(%esi),%esi
  200330:	8b 45 e0             	mov    -0x20(%ebp),%eax
  200333:	8d 78 04             	lea    0x4(%eax),%edi
  200336:	8b 08                	mov    (%eax),%ecx
  200338:	80 39 00             	cmpb   $0x0,(%ecx)
  20033b:	74 39                	je     200376 <printf+0xea>
  20033d:	31 c0                	xor    %eax,%eax
  20033f:	90                   	nop
  200340:	40                   	inc    %eax
  200341:	89 c2                	mov    %eax,%edx
  200343:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
  200347:	75 f7                	jne    200340 <printf+0xb4>
  200349:	bb 01 00 00 00       	mov    $0x1,%ebx
  20034e:	b8 04 00 00 00       	mov    $0x4,%eax
  200353:	cd 80                	int    $0x80
  200355:	89 7d e0             	mov    %edi,-0x20(%ebp)
  200358:	e9 61 ff ff ff       	jmp    2002be <printf+0x32>
  20035d:	8d 76 00             	lea    0x0(%esi),%esi
  200360:	8b 45 e0             	mov    -0x20(%ebp),%eax
  200363:	8d 58 04             	lea    0x4(%eax),%ebx
  200366:	ff 30                	pushl  (%eax)
  200368:	e8 ab fd ff ff       	call   200118 <printd>
  20036d:	5a                   	pop    %edx
  20036e:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  200371:	e9 48 ff ff ff       	jmp    2002be <printf+0x32>
  200376:	31 d2                	xor    %edx,%edx
  200378:	eb cf                	jmp    200349 <printf+0xbd>
