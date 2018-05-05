
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	53                   	push   %ebx
  200004:	83 ec 0c             	sub    $0xc,%esp
  200007:	6a 0c                	push   $0xc
  200009:	68 ae 03 20 00       	push   $0x2003ae
  20000e:	e8 91 02 00 00       	call   2002a4 <printf>
  200013:	e8 c8 00 00 00       	call   2000e0 <exit>
  200018:	e8 6b 00 00 00       	call   200088 <fork>
  20001d:	89 c3                	mov    %eax,%ebx
  20001f:	83 c4 10             	add    $0x10,%esp
  200022:	85 c0                	test   %eax,%eax
  200024:	75 38                	jne    20005e <uEntry+0x5e>
  200026:	83 ec 0c             	sub    $0xc,%esp
  200029:	68 b1 03 20 00       	push   $0x2003b1
  20002e:	e8 71 02 00 00       	call   2002a4 <printf>
  200033:	83 c4 10             	add    $0x10,%esp
  200036:	83 ec 08             	sub    $0x8,%esp
  200039:	53                   	push   %ebx
  20003a:	68 ca 03 20 00       	push   $0x2003ca
  20003f:	e8 60 02 00 00       	call   2002a4 <printf>
  200044:	e8 97 00 00 00       	call   2000e0 <exit>
  200049:	83 c4 10             	add    $0x10,%esp
  20004c:	83 ec 0c             	sub    $0xc,%esp
  20004f:	68 d4 03 20 00       	push   $0x2003d4
  200054:	e8 4b 02 00 00       	call   2002a4 <printf>
  200059:	83 c4 10             	add    $0x10,%esp
  20005c:	eb ee                	jmp    20004c <uEntry+0x4c>
  20005e:	83 ec 0c             	sub    $0xc,%esp
  200061:	68 bd 03 20 00       	push   $0x2003bd
  200066:	e8 39 02 00 00       	call   2002a4 <printf>
  20006b:	83 c4 10             	add    $0x10,%esp
  20006e:	eb c6                	jmp    200036 <uEntry+0x36>

00200070 <syscall>:
  200070:	55                   	push   %ebp
  200071:	89 e5                	mov    %esp,%ebp
  200073:	53                   	push   %ebx
  200074:	8b 55 14             	mov    0x14(%ebp),%edx
  200077:	8b 4d 10             	mov    0x10(%ebp),%ecx
  20007a:	8b 45 08             	mov    0x8(%ebp),%eax
  20007d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  200080:	cd 80                	int    $0x80
  200082:	5b                   	pop    %ebx
  200083:	5d                   	pop    %ebp
  200084:	c3                   	ret    
  200085:	8d 76 00             	lea    0x0(%esi),%esi

00200088 <fork>:
  200088:	55                   	push   %ebp
  200089:	89 e5                	mov    %esp,%ebp
  20008b:	53                   	push   %ebx
  20008c:	ba 0d 00 00 00       	mov    $0xd,%edx
  200091:	b9 e3 03 20 00       	mov    $0x2003e3,%ecx
  200096:	bb 01 00 00 00       	mov    $0x1,%ebx
  20009b:	b8 02 00 00 00       	mov    $0x2,%eax
  2000a0:	cd 80                	int    $0x80
  2000a2:	5b                   	pop    %ebx
  2000a3:	5d                   	pop    %ebp
  2000a4:	c3                   	ret    
  2000a5:	8d 76 00             	lea    0x0(%esi),%esi

002000a8 <sleep>:
  2000a8:	55                   	push   %ebp
  2000a9:	89 e5                	mov    %esp,%ebp
  2000ab:	53                   	push   %ebx
  2000ac:	31 c9                	xor    %ecx,%ecx
  2000ae:	b8 e6 00 00 00       	mov    $0xe6,%eax
  2000b3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  2000b6:	89 ca                	mov    %ecx,%edx
  2000b8:	cd 80                	int    $0x80
  2000ba:	31 c0                	xor    %eax,%eax
  2000bc:	5b                   	pop    %ebx
  2000bd:	5d                   	pop    %ebp
  2000be:	c3                   	ret    
  2000bf:	90                   	nop

002000c0 <getpid>:
  2000c0:	55                   	push   %ebp
  2000c1:	89 e5                	mov    %esp,%ebp
  2000c3:	53                   	push   %ebx
  2000c4:	ba 0d 00 00 00       	mov    $0xd,%edx
  2000c9:	b9 e3 03 20 00       	mov    $0x2003e3,%ecx
  2000ce:	bb 01 00 00 00       	mov    $0x1,%ebx
  2000d3:	b8 07 00 00 00       	mov    $0x7,%eax
  2000d8:	cd 80                	int    $0x80
  2000da:	5b                   	pop    %ebx
  2000db:	5d                   	pop    %ebp
  2000dc:	c3                   	ret    
  2000dd:	8d 76 00             	lea    0x0(%esi),%esi

002000e0 <exit>:
  2000e0:	55                   	push   %ebp
  2000e1:	89 e5                	mov    %esp,%ebp
  2000e3:	53                   	push   %ebx
  2000e4:	31 d2                	xor    %edx,%edx
  2000e6:	b8 01 00 00 00       	mov    $0x1,%eax
  2000eb:	89 d3                	mov    %edx,%ebx
  2000ed:	89 d1                	mov    %edx,%ecx
  2000ef:	cd 80                	int    $0x80
  2000f1:	31 c0                	xor    %eax,%eax
  2000f3:	5b                   	pop    %ebx
  2000f4:	5d                   	pop    %ebp
  2000f5:	c3                   	ret    
  2000f6:	66 90                	xchg   %ax,%ax

002000f8 <putchar_user>:
  2000f8:	55                   	push   %ebp
  2000f9:	89 e5                	mov    %esp,%ebp
  2000fb:	53                   	push   %ebx
  2000fc:	83 ec 10             	sub    $0x10,%esp
  2000ff:	bb 01 00 00 00       	mov    $0x1,%ebx
  200104:	8d 4d fb             	lea    -0x5(%ebp),%ecx
  200107:	b8 04 00 00 00       	mov    $0x4,%eax
  20010c:	89 da                	mov    %ebx,%edx
  20010e:	cd 80                	int    $0x80
  200110:	83 c4 10             	add    $0x10,%esp
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
  20011e:	83 ec 24             	sub    $0x24,%esp
  200121:	8b 5d 08             	mov    0x8(%ebp),%ebx
  200124:	85 db                	test   %ebx,%ebx
  200126:	0f 88 80 00 00 00    	js     2001ac <printd+0x94>
  20012c:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
  200130:	c6 45 d3 00          	movb   $0x0,-0x2d(%ebp)
  200134:	8d 4d f3             	lea    -0xd(%ebp),%ecx
  200137:	be 0a 00 00 00       	mov    $0xa,%esi
  20013c:	bf 67 66 66 66       	mov    $0x66666667,%edi
  200141:	8d 76 00             	lea    0x0(%esi),%esi
  200144:	49                   	dec    %ecx
  200145:	89 d8                	mov    %ebx,%eax
  200147:	99                   	cltd   
  200148:	f7 fe                	idiv   %esi
  20014a:	83 c2 30             	add    $0x30,%edx
  20014d:	88 11                	mov    %dl,(%ecx)
  20014f:	89 d8                	mov    %ebx,%eax
  200151:	f7 ef                	imul   %edi
  200153:	89 d0                	mov    %edx,%eax
  200155:	c1 f8 02             	sar    $0x2,%eax
  200158:	c1 fb 1f             	sar    $0x1f,%ebx
  20015b:	29 d8                	sub    %ebx,%eax
  20015d:	89 c3                	mov    %eax,%ebx
  20015f:	75 e3                	jne    200144 <printd+0x2c>
  200161:	80 7d d3 01          	cmpb   $0x1,-0x2d(%ebp)
  200165:	74 35                	je     20019c <printd+0x84>
  200167:	80 7d d2 01          	cmpb   $0x1,-0x2e(%ebp)
  20016b:	74 3a                	je     2001a7 <printd+0x8f>
  20016d:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  200171:	80 39 00             	cmpb   $0x0,(%ecx)
  200174:	74 58                	je     2001ce <printd+0xb6>
  200176:	31 c0                	xor    %eax,%eax
  200178:	40                   	inc    %eax
  200179:	89 c2                	mov    %eax,%edx
  20017b:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  20017f:	75 f7                	jne    200178 <printd+0x60>
  200181:	81 e9 00 00 01 00    	sub    $0x10000,%ecx
  200187:	bb 01 00 00 00       	mov    $0x1,%ebx
  20018c:	b8 04 00 00 00       	mov    $0x4,%eax
  200191:	cd 80                	int    $0x80
  200193:	83 c4 24             	add    $0x24,%esp
  200196:	5b                   	pop    %ebx
  200197:	5e                   	pop    %esi
  200198:	5f                   	pop    %edi
  200199:	5d                   	pop    %ebp
  20019a:	c3                   	ret    
  20019b:	90                   	nop
  20019c:	c6 41 ff 2d          	movb   $0x2d,-0x1(%ecx)
  2001a0:	49                   	dec    %ecx
  2001a1:	80 7d d2 01          	cmpb   $0x1,-0x2e(%ebp)
  2001a5:	75 c6                	jne    20016d <printd+0x55>
  2001a7:	fe 45 f2             	incb   -0xe(%ebp)
  2001aa:	eb c1                	jmp    20016d <printd+0x55>
  2001ac:	81 fb 00 00 00 80    	cmp    $0x80000000,%ebx
  2001b2:	74 0f                	je     2001c3 <printd+0xab>
  2001b4:	f7 db                	neg    %ebx
  2001b6:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
  2001ba:	c6 45 d3 01          	movb   $0x1,-0x2d(%ebp)
  2001be:	e9 71 ff ff ff       	jmp    200134 <printd+0x1c>
  2001c3:	bb ff ff ff 7f       	mov    $0x7fffffff,%ebx
  2001c8:	c6 45 d2 01          	movb   $0x1,-0x2e(%ebp)
  2001cc:	eb ec                	jmp    2001ba <printd+0xa2>
  2001ce:	31 d2                	xor    %edx,%edx
  2001d0:	eb af                	jmp    200181 <printd+0x69>
  2001d2:	66 90                	xchg   %ax,%ax

002001d4 <printx>:
  2001d4:	55                   	push   %ebp
  2001d5:	89 e5                	mov    %esp,%ebp
  2001d7:	53                   	push   %ebx
  2001d8:	83 ec 20             	sub    $0x20,%esp
  2001db:	8b 45 08             	mov    0x8(%ebp),%eax
  2001de:	8d 5d fa             	lea    -0x6(%ebp),%ebx
  2001e1:	eb 12                	jmp    2001f5 <printx+0x21>
  2001e3:	90                   	nop
  2001e4:	83 c2 57             	add    $0x57,%edx
  2001e7:	88 13                	mov    %dl,(%ebx)
  2001e9:	85 c0                	test   %eax,%eax
  2001eb:	78 22                	js     20020f <printx+0x3b>
  2001ed:	c1 f8 04             	sar    $0x4,%eax
  2001f0:	4b                   	dec    %ebx
  2001f1:	85 c0                	test   %eax,%eax
  2001f3:	74 25                	je     20021a <printx+0x46>
  2001f5:	89 c2                	mov    %eax,%edx
  2001f7:	81 e2 0f 00 00 80    	and    $0x8000000f,%edx
  2001fd:	78 49                	js     200248 <printx+0x74>
  2001ff:	89 d9                	mov    %ebx,%ecx
  200201:	83 fa 09             	cmp    $0x9,%edx
  200204:	7f de                	jg     2001e4 <printx+0x10>
  200206:	83 c2 30             	add    $0x30,%edx
  200209:	88 13                	mov    %dl,(%ebx)
  20020b:	85 c0                	test   %eax,%eax
  20020d:	79 de                	jns    2001ed <printx+0x19>
  20020f:	83 c0 0f             	add    $0xf,%eax
  200212:	c1 f8 04             	sar    $0x4,%eax
  200215:	4b                   	dec    %ebx
  200216:	85 c0                	test   %eax,%eax
  200218:	75 db                	jne    2001f5 <printx+0x21>
  20021a:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
  20021e:	80 39 00             	cmpb   $0x0,(%ecx)
  200221:	74 2c                	je     20024f <printx+0x7b>
  200223:	90                   	nop
  200224:	40                   	inc    %eax
  200225:	89 c2                	mov    %eax,%edx
  200227:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  20022b:	75 f7                	jne    200224 <printx+0x50>
  20022d:	81 e9 00 00 01 00    	sub    $0x10000,%ecx
  200233:	bb 01 00 00 00       	mov    $0x1,%ebx
  200238:	b8 04 00 00 00       	mov    $0x4,%eax
  20023d:	cd 80                	int    $0x80
  20023f:	83 c4 20             	add    $0x20,%esp
  200242:	5b                   	pop    %ebx
  200243:	5d                   	pop    %ebp
  200244:	c3                   	ret    
  200245:	8d 76 00             	lea    0x0(%esi),%esi
  200248:	4a                   	dec    %edx
  200249:	83 ca f0             	or     $0xfffffff0,%edx
  20024c:	42                   	inc    %edx
  20024d:	eb b0                	jmp    2001ff <printx+0x2b>
  20024f:	31 d2                	xor    %edx,%edx
  200251:	eb da                	jmp    20022d <printx+0x59>
  200253:	90                   	nop

00200254 <printc>:
  200254:	55                   	push   %ebp
  200255:	89 e5                	mov    %esp,%ebp
  200257:	53                   	push   %ebx
  200258:	50                   	push   %eax
  200259:	bb 01 00 00 00       	mov    $0x1,%ebx
  20025e:	8d 4d f8             	lea    -0x8(%ebp),%ecx
  200261:	b8 04 00 00 00       	mov    $0x4,%eax
  200266:	89 da                	mov    %ebx,%edx
  200268:	cd 80                	int    $0x80
  20026a:	5a                   	pop    %edx
  20026b:	5b                   	pop    %ebx
  20026c:	5d                   	pop    %ebp
  20026d:	c3                   	ret    
  20026e:	66 90                	xchg   %ax,%ax

00200270 <prints>:
  200270:	55                   	push   %ebp
  200271:	89 e5                	mov    %esp,%ebp
  200273:	53                   	push   %ebx
  200274:	8b 4d 08             	mov    0x8(%ebp),%ecx
  200277:	80 39 00             	cmpb   $0x0,(%ecx)
  20027a:	74 22                	je     20029e <prints+0x2e>
  20027c:	31 c0                	xor    %eax,%eax
  20027e:	66 90                	xchg   %ax,%ax
  200280:	40                   	inc    %eax
  200281:	89 c2                	mov    %eax,%edx
  200283:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  200287:	75 f7                	jne    200280 <prints+0x10>
  200289:	81 e9 00 00 01 00    	sub    $0x10000,%ecx
  20028f:	bb 01 00 00 00       	mov    $0x1,%ebx
  200294:	b8 04 00 00 00       	mov    $0x4,%eax
  200299:	cd 80                	int    $0x80
  20029b:	5b                   	pop    %ebx
  20029c:	5d                   	pop    %ebp
  20029d:	c3                   	ret    
  20029e:	31 d2                	xor    %edx,%edx
  2002a0:	eb e7                	jmp    200289 <prints+0x19>
  2002a2:	66 90                	xchg   %ax,%ax

002002a4 <printf>:
  2002a4:	55                   	push   %ebp
  2002a5:	89 e5                	mov    %esp,%ebp
  2002a7:	57                   	push   %edi
  2002a8:	56                   	push   %esi
  2002a9:	53                   	push   %ebx
  2002aa:	83 ec 14             	sub    $0x14,%esp
  2002ad:	ba 0d 00 00 00       	mov    $0xd,%edx
  2002b2:	b9 e3 03 20 00       	mov    $0x2003e3,%ecx
  2002b7:	bb 01 00 00 00       	mov    $0x1,%ebx
  2002bc:	b8 07 00 00 00       	mov    $0x7,%eax
  2002c1:	cd 80                	int    $0x80
  2002c3:	c1 e2 10             	shl    $0x10,%edx
  2002c6:	8d 44 15 0c          	lea    0xc(%ebp,%edx,1),%eax
  2002ca:	89 45 e0             	mov    %eax,-0x20(%ebp)
  2002cd:	8b 7d 08             	mov    0x8(%ebp),%edi
  2002d0:	8a 07                	mov    (%edi),%al
  2002d2:	84 c0                	test   %al,%al
  2002d4:	75 22                	jne    2002f8 <printf+0x54>
  2002d6:	eb 57                	jmp    20032f <printf+0x8b>
  2002d8:	88 45 f3             	mov    %al,-0xd(%ebp)
  2002db:	ba 01 00 00 00       	mov    $0x1,%edx
  2002e0:	b8 04 00 00 00       	mov    $0x4,%eax
  2002e5:	89 d3                	mov    %edx,%ebx
  2002e7:	8d 4d f3             	lea    -0xd(%ebp),%ecx
  2002ea:	cd 80                	int    $0x80
  2002ec:	89 fe                	mov    %edi,%esi
  2002ee:	8d 7e 01             	lea    0x1(%esi),%edi
  2002f1:	8a 46 01             	mov    0x1(%esi),%al
  2002f4:	84 c0                	test   %al,%al
  2002f6:	74 37                	je     20032f <printf+0x8b>
  2002f8:	3c 25                	cmp    $0x25,%al
  2002fa:	75 dc                	jne    2002d8 <printf+0x34>
  2002fc:	8d 77 01             	lea    0x1(%edi),%esi
  2002ff:	8a 47 01             	mov    0x1(%edi),%al
  200302:	3c 64                	cmp    $0x64,%al
  200304:	0f 84 8a 00 00 00    	je     200394 <printf+0xf0>
  20030a:	7e 2c                	jle    200338 <printf+0x94>
  20030c:	3c 73                	cmp    $0x73,%al
  20030e:	74 50                	je     200360 <printf+0xbc>
  200310:	3c 78                	cmp    $0x78,%al
  200312:	75 da                	jne    2002ee <printf+0x4a>
  200314:	8b 45 e0             	mov    -0x20(%ebp),%eax
  200317:	8d 58 04             	lea    0x4(%eax),%ebx
  20031a:	ff 30                	pushl  (%eax)
  20031c:	e8 b3 fe ff ff       	call   2001d4 <printx>
  200321:	58                   	pop    %eax
  200322:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  200325:	8d 7e 01             	lea    0x1(%esi),%edi
  200328:	8a 46 01             	mov    0x1(%esi),%al
  20032b:	84 c0                	test   %al,%al
  20032d:	75 c9                	jne    2002f8 <printf+0x54>
  20032f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  200332:	5b                   	pop    %ebx
  200333:	5e                   	pop    %esi
  200334:	5f                   	pop    %edi
  200335:	5d                   	pop    %ebp
  200336:	c3                   	ret    
  200337:	90                   	nop
  200338:	3c 63                	cmp    $0x63,%al
  20033a:	75 b2                	jne    2002ee <printf+0x4a>
  20033c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  20033f:	8d 78 04             	lea    0x4(%eax),%edi
  200342:	8b 00                	mov    (%eax),%eax
  200344:	88 45 f2             	mov    %al,-0xe(%ebp)
  200347:	ba 01 00 00 00       	mov    $0x1,%edx
  20034c:	b8 04 00 00 00       	mov    $0x4,%eax
  200351:	89 d3                	mov    %edx,%ebx
  200353:	8d 4d f2             	lea    -0xe(%ebp),%ecx
  200356:	cd 80                	int    $0x80
  200358:	89 7d e0             	mov    %edi,-0x20(%ebp)
  20035b:	eb 91                	jmp    2002ee <printf+0x4a>
  20035d:	8d 76 00             	lea    0x0(%esi),%esi
  200360:	8b 45 e0             	mov    -0x20(%ebp),%eax
  200363:	8d 78 04             	lea    0x4(%eax),%edi
  200366:	8b 08                	mov    (%eax),%ecx
  200368:	80 39 00             	cmpb   $0x0,(%ecx)
  20036b:	74 3d                	je     2003aa <printf+0x106>
  20036d:	31 c0                	xor    %eax,%eax
  20036f:	90                   	nop
  200370:	40                   	inc    %eax
  200371:	89 c2                	mov    %eax,%edx
  200373:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
  200377:	75 f7                	jne    200370 <printf+0xcc>
  200379:	81 e9 00 00 01 00    	sub    $0x10000,%ecx
  20037f:	bb 01 00 00 00       	mov    $0x1,%ebx
  200384:	b8 04 00 00 00       	mov    $0x4,%eax
  200389:	cd 80                	int    $0x80
  20038b:	89 7d e0             	mov    %edi,-0x20(%ebp)
  20038e:	e9 5b ff ff ff       	jmp    2002ee <printf+0x4a>
  200393:	90                   	nop
  200394:	8b 45 e0             	mov    -0x20(%ebp),%eax
  200397:	8d 58 04             	lea    0x4(%eax),%ebx
  20039a:	ff 30                	pushl  (%eax)
  20039c:	e8 77 fd ff ff       	call   200118 <printd>
  2003a1:	5a                   	pop    %edx
  2003a2:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  2003a5:	e9 44 ff ff ff       	jmp    2002ee <printf+0x4a>
  2003aa:	31 d2                	xor    %edx,%edx
  2003ac:	eb cb                	jmp    200379 <printf+0xd5>
