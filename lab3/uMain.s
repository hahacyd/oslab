
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	53                   	push   %ebx
  200004:	50                   	push   %eax
  200005:	e8 c2 00 00 00       	call   2000cc <getpid>
  20000a:	83 ec 0c             	sub    $0xc,%esp
  20000d:	50                   	push   %eax
  20000e:	e8 11 01 00 00       	call   200124 <printd>
  200013:	e8 d4 00 00 00       	call   2000ec <exit>
  200018:	e8 77 00 00 00       	call   200094 <fork>
  20001d:	89 c3                	mov    %eax,%ebx
  20001f:	83 c4 10             	add    $0x10,%esp
  200022:	85 c0                	test   %eax,%eax
  200024:	75 38                	jne    20005e <uEntry+0x5e>
  200026:	83 ec 0c             	sub    $0xc,%esp
  200029:	68 a6 03 20 00       	push   $0x2003a6
  20002e:	e8 7d 02 00 00       	call   2002b0 <printf>
  200033:	83 c4 10             	add    $0x10,%esp
  200036:	83 ec 08             	sub    $0x8,%esp
  200039:	53                   	push   %ebx
  20003a:	68 bf 03 20 00       	push   $0x2003bf
  20003f:	e8 6c 02 00 00       	call   2002b0 <printf>
  200044:	e8 a3 00 00 00       	call   2000ec <exit>
  200049:	83 c4 10             	add    $0x10,%esp
  20004c:	83 ec 0c             	sub    $0xc,%esp
  20004f:	68 c9 03 20 00       	push   $0x2003c9
  200054:	e8 57 02 00 00       	call   2002b0 <printf>
  200059:	83 c4 10             	add    $0x10,%esp
  20005c:	eb ee                	jmp    20004c <uEntry+0x4c>
  20005e:	83 ec 0c             	sub    $0xc,%esp
  200061:	6a 25                	push   $0x25
  200063:	e8 4c 00 00 00       	call   2000b4 <sleep>
  200068:	c7 04 24 b2 03 20 00 	movl   $0x2003b2,(%esp)
  20006f:	e8 3c 02 00 00       	call   2002b0 <printf>
  200074:	83 c4 10             	add    $0x10,%esp
  200077:	eb bd                	jmp    200036 <uEntry+0x36>
  200079:	66 90                	xchg   %ax,%ax
  20007b:	90                   	nop

0020007c <syscall>:
  20007c:	55                   	push   %ebp
  20007d:	89 e5                	mov    %esp,%ebp
  20007f:	53                   	push   %ebx
  200080:	8b 55 14             	mov    0x14(%ebp),%edx
  200083:	8b 4d 10             	mov    0x10(%ebp),%ecx
  200086:	8b 45 08             	mov    0x8(%ebp),%eax
  200089:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  20008c:	cd 80                	int    $0x80
  20008e:	5b                   	pop    %ebx
  20008f:	5d                   	pop    %ebp
  200090:	c3                   	ret    
  200091:	8d 76 00             	lea    0x0(%esi),%esi

00200094 <fork>:
  200094:	55                   	push   %ebp
  200095:	89 e5                	mov    %esp,%ebp
  200097:	53                   	push   %ebx
  200098:	ba 0d 00 00 00       	mov    $0xd,%edx
  20009d:	b9 d8 03 20 00       	mov    $0x2003d8,%ecx
  2000a2:	bb 01 00 00 00       	mov    $0x1,%ebx
  2000a7:	b8 02 00 00 00       	mov    $0x2,%eax
  2000ac:	cd 80                	int    $0x80
  2000ae:	5b                   	pop    %ebx
  2000af:	5d                   	pop    %ebp
  2000b0:	c3                   	ret    
  2000b1:	8d 76 00             	lea    0x0(%esi),%esi

002000b4 <sleep>:
  2000b4:	55                   	push   %ebp
  2000b5:	89 e5                	mov    %esp,%ebp
  2000b7:	53                   	push   %ebx
  2000b8:	31 c9                	xor    %ecx,%ecx
  2000ba:	b8 e6 00 00 00       	mov    $0xe6,%eax
  2000bf:	8b 5d 08             	mov    0x8(%ebp),%ebx
  2000c2:	89 ca                	mov    %ecx,%edx
  2000c4:	cd 80                	int    $0x80
  2000c6:	31 c0                	xor    %eax,%eax
  2000c8:	5b                   	pop    %ebx
  2000c9:	5d                   	pop    %ebp
  2000ca:	c3                   	ret    
  2000cb:	90                   	nop

002000cc <getpid>:
  2000cc:	55                   	push   %ebp
  2000cd:	89 e5                	mov    %esp,%ebp
  2000cf:	53                   	push   %ebx
  2000d0:	ba 0d 00 00 00       	mov    $0xd,%edx
  2000d5:	b9 d8 03 20 00       	mov    $0x2003d8,%ecx
  2000da:	bb 01 00 00 00       	mov    $0x1,%ebx
  2000df:	b8 07 00 00 00       	mov    $0x7,%eax
  2000e4:	cd 80                	int    $0x80
  2000e6:	5b                   	pop    %ebx
  2000e7:	5d                   	pop    %ebp
  2000e8:	c3                   	ret    
  2000e9:	8d 76 00             	lea    0x0(%esi),%esi

002000ec <exit>:
  2000ec:	55                   	push   %ebp
  2000ed:	89 e5                	mov    %esp,%ebp
  2000ef:	53                   	push   %ebx
  2000f0:	31 d2                	xor    %edx,%edx
  2000f2:	b8 01 00 00 00       	mov    $0x1,%eax
  2000f7:	89 d3                	mov    %edx,%ebx
  2000f9:	89 d1                	mov    %edx,%ecx
  2000fb:	cd 80                	int    $0x80
  2000fd:	31 c0                	xor    %eax,%eax
  2000ff:	5b                   	pop    %ebx
  200100:	5d                   	pop    %ebp
  200101:	c3                   	ret    
  200102:	66 90                	xchg   %ax,%ax

00200104 <putchar_user>:
  200104:	55                   	push   %ebp
  200105:	89 e5                	mov    %esp,%ebp
  200107:	53                   	push   %ebx
  200108:	83 ec 10             	sub    $0x10,%esp
  20010b:	bb 01 00 00 00       	mov    $0x1,%ebx
  200110:	8d 4d fb             	lea    -0x5(%ebp),%ecx
  200113:	b8 04 00 00 00       	mov    $0x4,%eax
  200118:	89 da                	mov    %ebx,%edx
  20011a:	cd 80                	int    $0x80
  20011c:	83 c4 10             	add    $0x10,%esp
  20011f:	5b                   	pop    %ebx
  200120:	5d                   	pop    %ebp
  200121:	c3                   	ret    
  200122:	66 90                	xchg   %ax,%ax

00200124 <printd>:
  200124:	55                   	push   %ebp
  200125:	89 e5                	mov    %esp,%ebp
  200127:	57                   	push   %edi
  200128:	56                   	push   %esi
  200129:	53                   	push   %ebx
  20012a:	83 ec 24             	sub    $0x24,%esp
  20012d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  200130:	85 db                	test   %ebx,%ebx
  200132:	0f 88 80 00 00 00    	js     2001b8 <printd+0x94>
  200138:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
  20013c:	c6 45 d3 00          	movb   $0x0,-0x2d(%ebp)
  200140:	8d 4d f3             	lea    -0xd(%ebp),%ecx
  200143:	be 0a 00 00 00       	mov    $0xa,%esi
  200148:	bf 67 66 66 66       	mov    $0x66666667,%edi
  20014d:	8d 76 00             	lea    0x0(%esi),%esi
  200150:	49                   	dec    %ecx
  200151:	89 d8                	mov    %ebx,%eax
  200153:	99                   	cltd   
  200154:	f7 fe                	idiv   %esi
  200156:	83 c2 30             	add    $0x30,%edx
  200159:	88 11                	mov    %dl,(%ecx)
  20015b:	89 d8                	mov    %ebx,%eax
  20015d:	f7 ef                	imul   %edi
  20015f:	89 d0                	mov    %edx,%eax
  200161:	c1 f8 02             	sar    $0x2,%eax
  200164:	c1 fb 1f             	sar    $0x1f,%ebx
  200167:	29 d8                	sub    %ebx,%eax
  200169:	89 c3                	mov    %eax,%ebx
  20016b:	75 e3                	jne    200150 <printd+0x2c>
  20016d:	80 7d d3 01          	cmpb   $0x1,-0x2d(%ebp)
  200171:	74 35                	je     2001a8 <printd+0x84>
  200173:	80 7d d2 01          	cmpb   $0x1,-0x2e(%ebp)
  200177:	74 3a                	je     2001b3 <printd+0x8f>
  200179:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  20017d:	80 39 00             	cmpb   $0x0,(%ecx)
  200180:	74 58                	je     2001da <printd+0xb6>
  200182:	31 c0                	xor    %eax,%eax
  200184:	40                   	inc    %eax
  200185:	89 c2                	mov    %eax,%edx
  200187:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  20018b:	75 f7                	jne    200184 <printd+0x60>
  20018d:	81 e9 00 00 01 00    	sub    $0x10000,%ecx
  200193:	bb 01 00 00 00       	mov    $0x1,%ebx
  200198:	b8 04 00 00 00       	mov    $0x4,%eax
  20019d:	cd 80                	int    $0x80
  20019f:	83 c4 24             	add    $0x24,%esp
  2001a2:	5b                   	pop    %ebx
  2001a3:	5e                   	pop    %esi
  2001a4:	5f                   	pop    %edi
  2001a5:	5d                   	pop    %ebp
  2001a6:	c3                   	ret    
  2001a7:	90                   	nop
  2001a8:	c6 41 ff 2d          	movb   $0x2d,-0x1(%ecx)
  2001ac:	49                   	dec    %ecx
  2001ad:	80 7d d2 01          	cmpb   $0x1,-0x2e(%ebp)
  2001b1:	75 c6                	jne    200179 <printd+0x55>
  2001b3:	fe 45 f2             	incb   -0xe(%ebp)
  2001b6:	eb c1                	jmp    200179 <printd+0x55>
  2001b8:	81 fb 00 00 00 80    	cmp    $0x80000000,%ebx
  2001be:	74 0f                	je     2001cf <printd+0xab>
  2001c0:	f7 db                	neg    %ebx
  2001c2:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
  2001c6:	c6 45 d3 01          	movb   $0x1,-0x2d(%ebp)
  2001ca:	e9 71 ff ff ff       	jmp    200140 <printd+0x1c>
  2001cf:	bb ff ff ff 7f       	mov    $0x7fffffff,%ebx
  2001d4:	c6 45 d2 01          	movb   $0x1,-0x2e(%ebp)
  2001d8:	eb ec                	jmp    2001c6 <printd+0xa2>
  2001da:	31 d2                	xor    %edx,%edx
  2001dc:	eb af                	jmp    20018d <printd+0x69>
  2001de:	66 90                	xchg   %ax,%ax

002001e0 <printx>:
  2001e0:	55                   	push   %ebp
  2001e1:	89 e5                	mov    %esp,%ebp
  2001e3:	53                   	push   %ebx
  2001e4:	83 ec 20             	sub    $0x20,%esp
  2001e7:	8b 45 08             	mov    0x8(%ebp),%eax
  2001ea:	8d 5d fa             	lea    -0x6(%ebp),%ebx
  2001ed:	eb 12                	jmp    200201 <printx+0x21>
  2001ef:	90                   	nop
  2001f0:	83 c2 57             	add    $0x57,%edx
  2001f3:	88 13                	mov    %dl,(%ebx)
  2001f5:	85 c0                	test   %eax,%eax
  2001f7:	78 22                	js     20021b <printx+0x3b>
  2001f9:	c1 f8 04             	sar    $0x4,%eax
  2001fc:	4b                   	dec    %ebx
  2001fd:	85 c0                	test   %eax,%eax
  2001ff:	74 25                	je     200226 <printx+0x46>
  200201:	89 c2                	mov    %eax,%edx
  200203:	81 e2 0f 00 00 80    	and    $0x8000000f,%edx
  200209:	78 49                	js     200254 <printx+0x74>
  20020b:	89 d9                	mov    %ebx,%ecx
  20020d:	83 fa 09             	cmp    $0x9,%edx
  200210:	7f de                	jg     2001f0 <printx+0x10>
  200212:	83 c2 30             	add    $0x30,%edx
  200215:	88 13                	mov    %dl,(%ebx)
  200217:	85 c0                	test   %eax,%eax
  200219:	79 de                	jns    2001f9 <printx+0x19>
  20021b:	83 c0 0f             	add    $0xf,%eax
  20021e:	c1 f8 04             	sar    $0x4,%eax
  200221:	4b                   	dec    %ebx
  200222:	85 c0                	test   %eax,%eax
  200224:	75 db                	jne    200201 <printx+0x21>
  200226:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
  20022a:	80 39 00             	cmpb   $0x0,(%ecx)
  20022d:	74 2c                	je     20025b <printx+0x7b>
  20022f:	90                   	nop
  200230:	40                   	inc    %eax
  200231:	89 c2                	mov    %eax,%edx
  200233:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  200237:	75 f7                	jne    200230 <printx+0x50>
  200239:	81 e9 00 00 01 00    	sub    $0x10000,%ecx
  20023f:	bb 01 00 00 00       	mov    $0x1,%ebx
  200244:	b8 04 00 00 00       	mov    $0x4,%eax
  200249:	cd 80                	int    $0x80
  20024b:	83 c4 20             	add    $0x20,%esp
  20024e:	5b                   	pop    %ebx
  20024f:	5d                   	pop    %ebp
  200250:	c3                   	ret    
  200251:	8d 76 00             	lea    0x0(%esi),%esi
  200254:	4a                   	dec    %edx
  200255:	83 ca f0             	or     $0xfffffff0,%edx
  200258:	42                   	inc    %edx
  200259:	eb b0                	jmp    20020b <printx+0x2b>
  20025b:	31 d2                	xor    %edx,%edx
  20025d:	eb da                	jmp    200239 <printx+0x59>
  20025f:	90                   	nop

00200260 <printc>:
  200260:	55                   	push   %ebp
  200261:	89 e5                	mov    %esp,%ebp
  200263:	53                   	push   %ebx
  200264:	50                   	push   %eax
  200265:	bb 01 00 00 00       	mov    $0x1,%ebx
  20026a:	8d 4d f8             	lea    -0x8(%ebp),%ecx
  20026d:	b8 04 00 00 00       	mov    $0x4,%eax
  200272:	89 da                	mov    %ebx,%edx
  200274:	cd 80                	int    $0x80
  200276:	5a                   	pop    %edx
  200277:	5b                   	pop    %ebx
  200278:	5d                   	pop    %ebp
  200279:	c3                   	ret    
  20027a:	66 90                	xchg   %ax,%ax

0020027c <prints>:
  20027c:	55                   	push   %ebp
  20027d:	89 e5                	mov    %esp,%ebp
  20027f:	53                   	push   %ebx
  200280:	8b 4d 08             	mov    0x8(%ebp),%ecx
  200283:	80 39 00             	cmpb   $0x0,(%ecx)
  200286:	74 22                	je     2002aa <prints+0x2e>
  200288:	31 c0                	xor    %eax,%eax
  20028a:	66 90                	xchg   %ax,%ax
  20028c:	40                   	inc    %eax
  20028d:	89 c2                	mov    %eax,%edx
  20028f:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  200293:	75 f7                	jne    20028c <prints+0x10>
  200295:	81 e9 00 00 01 00    	sub    $0x10000,%ecx
  20029b:	bb 01 00 00 00       	mov    $0x1,%ebx
  2002a0:	b8 04 00 00 00       	mov    $0x4,%eax
  2002a5:	cd 80                	int    $0x80
  2002a7:	5b                   	pop    %ebx
  2002a8:	5d                   	pop    %ebp
  2002a9:	c3                   	ret    
  2002aa:	31 d2                	xor    %edx,%edx
  2002ac:	eb e7                	jmp    200295 <prints+0x19>
  2002ae:	66 90                	xchg   %ax,%ax

002002b0 <printf>:
  2002b0:	55                   	push   %ebp
  2002b1:	89 e5                	mov    %esp,%ebp
  2002b3:	57                   	push   %edi
  2002b4:	56                   	push   %esi
  2002b5:	53                   	push   %ebx
  2002b6:	83 ec 14             	sub    $0x14,%esp
  2002b9:	8b 7d 08             	mov    0x8(%ebp),%edi
  2002bc:	8a 07                	mov    (%edi),%al
  2002be:	8d 9d 0c 00 01 00    	lea    0x1000c(%ebp),%ebx
  2002c4:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  2002c7:	84 c0                	test   %al,%al
  2002c9:	75 25                	jne    2002f0 <printf+0x40>
  2002cb:	eb 5a                	jmp    200327 <printf+0x77>
  2002cd:	8d 76 00             	lea    0x0(%esi),%esi
  2002d0:	88 45 f3             	mov    %al,-0xd(%ebp)
  2002d3:	ba 01 00 00 00       	mov    $0x1,%edx
  2002d8:	b8 04 00 00 00       	mov    $0x4,%eax
  2002dd:	89 d3                	mov    %edx,%ebx
  2002df:	8d 4d f3             	lea    -0xd(%ebp),%ecx
  2002e2:	cd 80                	int    $0x80
  2002e4:	89 fe                	mov    %edi,%esi
  2002e6:	8d 7e 01             	lea    0x1(%esi),%edi
  2002e9:	8a 46 01             	mov    0x1(%esi),%al
  2002ec:	84 c0                	test   %al,%al
  2002ee:	74 37                	je     200327 <printf+0x77>
  2002f0:	3c 25                	cmp    $0x25,%al
  2002f2:	75 dc                	jne    2002d0 <printf+0x20>
  2002f4:	8d 77 01             	lea    0x1(%edi),%esi
  2002f7:	8a 47 01             	mov    0x1(%edi),%al
  2002fa:	3c 64                	cmp    $0x64,%al
  2002fc:	0f 84 8a 00 00 00    	je     20038c <printf+0xdc>
  200302:	7e 2c                	jle    200330 <printf+0x80>
  200304:	3c 73                	cmp    $0x73,%al
  200306:	74 50                	je     200358 <printf+0xa8>
  200308:	3c 78                	cmp    $0x78,%al
  20030a:	75 da                	jne    2002e6 <printf+0x36>
  20030c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  20030f:	8d 58 04             	lea    0x4(%eax),%ebx
  200312:	ff 30                	pushl  (%eax)
  200314:	e8 c7 fe ff ff       	call   2001e0 <printx>
  200319:	58                   	pop    %eax
  20031a:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  20031d:	8d 7e 01             	lea    0x1(%esi),%edi
  200320:	8a 46 01             	mov    0x1(%esi),%al
  200323:	84 c0                	test   %al,%al
  200325:	75 c9                	jne    2002f0 <printf+0x40>
  200327:	8d 65 f4             	lea    -0xc(%ebp),%esp
  20032a:	5b                   	pop    %ebx
  20032b:	5e                   	pop    %esi
  20032c:	5f                   	pop    %edi
  20032d:	5d                   	pop    %ebp
  20032e:	c3                   	ret    
  20032f:	90                   	nop
  200330:	3c 63                	cmp    $0x63,%al
  200332:	75 b2                	jne    2002e6 <printf+0x36>
  200334:	8b 45 e0             	mov    -0x20(%ebp),%eax
  200337:	8d 78 04             	lea    0x4(%eax),%edi
  20033a:	8b 00                	mov    (%eax),%eax
  20033c:	88 45 f2             	mov    %al,-0xe(%ebp)
  20033f:	ba 01 00 00 00       	mov    $0x1,%edx
  200344:	b8 04 00 00 00       	mov    $0x4,%eax
  200349:	89 d3                	mov    %edx,%ebx
  20034b:	8d 4d f2             	lea    -0xe(%ebp),%ecx
  20034e:	cd 80                	int    $0x80
  200350:	89 7d e0             	mov    %edi,-0x20(%ebp)
  200353:	eb 91                	jmp    2002e6 <printf+0x36>
  200355:	8d 76 00             	lea    0x0(%esi),%esi
  200358:	8b 45 e0             	mov    -0x20(%ebp),%eax
  20035b:	8d 78 04             	lea    0x4(%eax),%edi
  20035e:	8b 08                	mov    (%eax),%ecx
  200360:	80 39 00             	cmpb   $0x0,(%ecx)
  200363:	74 3d                	je     2003a2 <printf+0xf2>
  200365:	31 c0                	xor    %eax,%eax
  200367:	90                   	nop
  200368:	40                   	inc    %eax
  200369:	89 c2                	mov    %eax,%edx
  20036b:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
  20036f:	75 f7                	jne    200368 <printf+0xb8>
  200371:	81 e9 00 00 01 00    	sub    $0x10000,%ecx
  200377:	bb 01 00 00 00       	mov    $0x1,%ebx
  20037c:	b8 04 00 00 00       	mov    $0x4,%eax
  200381:	cd 80                	int    $0x80
  200383:	89 7d e0             	mov    %edi,-0x20(%ebp)
  200386:	e9 5b ff ff ff       	jmp    2002e6 <printf+0x36>
  20038b:	90                   	nop
  20038c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  20038f:	8d 58 04             	lea    0x4(%eax),%ebx
  200392:	ff 30                	pushl  (%eax)
  200394:	e8 8b fd ff ff       	call   200124 <printd>
  200399:	5a                   	pop    %edx
  20039a:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  20039d:	e9 44 ff ff ff       	jmp    2002e6 <printf+0x36>
  2003a2:	31 d2                	xor    %edx,%edx
  2003a4:	eb cb                	jmp    200371 <printf+0xc1>
