
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	53                   	push   %ebx
  200004:	53                   	push   %ebx
  200005:	e8 c6 00 00 00       	call   2000d0 <fork>
  20000a:	85 c0                	test   %eax,%eax
  20000c:	75 3e                	jne    20004c <uEntry+0x4c>
  20000e:	c7 05 9c 15 20 00 02 	movl   $0x2,0x20159c
  200015:	00 00 00 
  200018:	b8 02 00 00 00       	mov    $0x2,%eax
  20001d:	bb 08 00 00 00       	mov    $0x8,%ebx
  200022:	66 90                	xchg   %ax,%ax
  200024:	4b                   	dec    %ebx
  200025:	51                   	push   %ecx
  200026:	53                   	push   %ebx
  200027:	50                   	push   %eax
  200028:	68 96 03 20 00       	push   $0x200396
  20002d:	e8 76 02 00 00       	call   2002a8 <printf>
  200032:	c7 04 24 80 00 00 00 	movl   $0x80,(%esp)
  200039:	e8 aa 00 00 00       	call   2000e8 <sleep>
  20003e:	83 c4 10             	add    $0x10,%esp
  200041:	85 db                	test   %ebx,%ebx
  200043:	74 4b                	je     200090 <uEntry+0x90>
  200045:	a1 9c 15 20 00       	mov    0x20159c,%eax
  20004a:	eb d8                	jmp    200024 <uEntry+0x24>
  20004c:	40                   	inc    %eax
  20004d:	74 46                	je     200095 <uEntry+0x95>
  20004f:	c7 05 9c 15 20 00 01 	movl   $0x1,0x20159c
  200056:	00 00 00 
  200059:	b8 01 00 00 00       	mov    $0x1,%eax
  20005e:	bb 08 00 00 00       	mov    $0x8,%ebx
  200063:	eb 08                	jmp    20006d <uEntry+0x6d>
  200065:	8d 76 00             	lea    0x0(%esi),%esi
  200068:	a1 9c 15 20 00       	mov    0x20159c,%eax
  20006d:	4b                   	dec    %ebx
  20006e:	52                   	push   %edx
  20006f:	53                   	push   %ebx
  200070:	50                   	push   %eax
  200071:	68 b2 03 20 00       	push   $0x2003b2
  200076:	e8 2d 02 00 00       	call   2002a8 <printf>
  20007b:	c7 04 24 80 00 00 00 	movl   $0x80,(%esp)
  200082:	e8 61 00 00 00       	call   2000e8 <sleep>
  200087:	83 c4 10             	add    $0x10,%esp
  20008a:	85 db                	test   %ebx,%ebx
  20008c:	75 da                	jne    200068 <uEntry+0x68>
  20008e:	66 90                	xchg   %ax,%ax
  200090:	e8 87 00 00 00       	call   20011c <exit>
  200095:	83 ec 0c             	sub    $0xc,%esp
  200098:	68 cf 03 20 00       	push   $0x2003cf
  20009d:	e8 06 02 00 00       	call   2002a8 <printf>
  2000a2:	83 c4 10             	add    $0x10,%esp
  2000a5:	83 ec 0c             	sub    $0xc,%esp
  2000a8:	68 cf 03 20 00       	push   $0x2003cf
  2000ad:	e8 f6 01 00 00       	call   2002a8 <printf>
  2000b2:	83 c4 10             	add    $0x10,%esp
  2000b5:	eb de                	jmp    200095 <uEntry+0x95>
  2000b7:	90                   	nop

002000b8 <syscall>:
  2000b8:	55                   	push   %ebp
  2000b9:	89 e5                	mov    %esp,%ebp
  2000bb:	53                   	push   %ebx
  2000bc:	8b 55 14             	mov    0x14(%ebp),%edx
  2000bf:	8b 4d 10             	mov    0x10(%ebp),%ecx
  2000c2:	8b 45 08             	mov    0x8(%ebp),%eax
  2000c5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  2000c8:	cd 80                	int    $0x80
  2000ca:	5b                   	pop    %ebx
  2000cb:	5d                   	pop    %ebp
  2000cc:	c3                   	ret    
  2000cd:	8d 76 00             	lea    0x0(%esi),%esi

002000d0 <fork>:
  2000d0:	55                   	push   %ebp
  2000d1:	89 e5                	mov    %esp,%ebp
  2000d3:	53                   	push   %ebx
  2000d4:	b9 01 00 00 00       	mov    $0x1,%ecx
  2000d9:	b8 02 00 00 00       	mov    $0x2,%eax
  2000de:	89 cb                	mov    %ecx,%ebx
  2000e0:	89 ca                	mov    %ecx,%edx
  2000e2:	cd 80                	int    $0x80
  2000e4:	5b                   	pop    %ebx
  2000e5:	5d                   	pop    %ebp
  2000e6:	c3                   	ret    
  2000e7:	90                   	nop

002000e8 <sleep>:
  2000e8:	55                   	push   %ebp
  2000e9:	89 e5                	mov    %esp,%ebp
  2000eb:	53                   	push   %ebx
  2000ec:	b9 01 00 00 00       	mov    $0x1,%ecx
  2000f1:	b8 e6 00 00 00       	mov    $0xe6,%eax
  2000f6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  2000f9:	89 ca                	mov    %ecx,%edx
  2000fb:	cd 80                	int    $0x80
  2000fd:	31 c0                	xor    %eax,%eax
  2000ff:	5b                   	pop    %ebx
  200100:	5d                   	pop    %ebp
  200101:	c3                   	ret    
  200102:	66 90                	xchg   %ax,%ax

00200104 <getpid>:
  200104:	55                   	push   %ebp
  200105:	89 e5                	mov    %esp,%ebp
  200107:	53                   	push   %ebx
  200108:	b9 01 00 00 00       	mov    $0x1,%ecx
  20010d:	b8 07 00 00 00       	mov    $0x7,%eax
  200112:	89 cb                	mov    %ecx,%ebx
  200114:	89 ca                	mov    %ecx,%edx
  200116:	cd 80                	int    $0x80
  200118:	5b                   	pop    %ebx
  200119:	5d                   	pop    %ebp
  20011a:	c3                   	ret    
  20011b:	90                   	nop

0020011c <exit>:
  20011c:	55                   	push   %ebp
  20011d:	89 e5                	mov    %esp,%ebp
  20011f:	53                   	push   %ebx
  200120:	31 d2                	xor    %edx,%edx
  200122:	b8 01 00 00 00       	mov    $0x1,%eax
  200127:	89 d3                	mov    %edx,%ebx
  200129:	89 d1                	mov    %edx,%ecx
  20012b:	cd 80                	int    $0x80
  20012d:	31 c0                	xor    %eax,%eax
  20012f:	5b                   	pop    %ebx
  200130:	5d                   	pop    %ebp
  200131:	c3                   	ret    
  200132:	66 90                	xchg   %ax,%ax

00200134 <printd>:
  200134:	55                   	push   %ebp
  200135:	89 e5                	mov    %esp,%ebp
  200137:	57                   	push   %edi
  200138:	56                   	push   %esi
  200139:	53                   	push   %ebx
  20013a:	83 ec 74             	sub    $0x74,%esp
  20013d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  200140:	85 db                	test   %ebx,%ebx
  200142:	78 7c                	js     2001c0 <printd+0x8c>
  200144:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
  200148:	c6 45 83 00          	movb   $0x0,-0x7d(%ebp)
  20014c:	8d 4d f3             	lea    -0xd(%ebp),%ecx
  20014f:	be 0a 00 00 00       	mov    $0xa,%esi
  200154:	bf 67 66 66 66       	mov    $0x66666667,%edi
  200159:	8d 76 00             	lea    0x0(%esi),%esi
  20015c:	49                   	dec    %ecx
  20015d:	89 d8                	mov    %ebx,%eax
  20015f:	99                   	cltd   
  200160:	f7 fe                	idiv   %esi
  200162:	83 c2 30             	add    $0x30,%edx
  200165:	88 11                	mov    %dl,(%ecx)
  200167:	89 d8                	mov    %ebx,%eax
  200169:	f7 ef                	imul   %edi
  20016b:	89 d0                	mov    %edx,%eax
  20016d:	c1 f8 02             	sar    $0x2,%eax
  200170:	c1 fb 1f             	sar    $0x1f,%ebx
  200173:	29 d8                	sub    %ebx,%eax
  200175:	89 c3                	mov    %eax,%ebx
  200177:	75 e3                	jne    20015c <printd+0x28>
  200179:	80 7d 83 01          	cmpb   $0x1,-0x7d(%ebp)
  20017d:	74 31                	je     2001b0 <printd+0x7c>
  20017f:	80 7d 82 01          	cmpb   $0x1,-0x7e(%ebp)
  200183:	74 36                	je     2001bb <printd+0x87>
  200185:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  200189:	80 39 00             	cmpb   $0x0,(%ecx)
  20018c:	74 54                	je     2001e2 <printd+0xae>
  20018e:	31 c0                	xor    %eax,%eax
  200190:	40                   	inc    %eax
  200191:	89 c2                	mov    %eax,%edx
  200193:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  200197:	75 f7                	jne    200190 <printd+0x5c>
  200199:	bb 01 00 00 00       	mov    $0x1,%ebx
  20019e:	b8 04 00 00 00       	mov    $0x4,%eax
  2001a3:	cd 80                	int    $0x80
  2001a5:	83 c4 74             	add    $0x74,%esp
  2001a8:	5b                   	pop    %ebx
  2001a9:	5e                   	pop    %esi
  2001aa:	5f                   	pop    %edi
  2001ab:	5d                   	pop    %ebp
  2001ac:	c3                   	ret    
  2001ad:	8d 76 00             	lea    0x0(%esi),%esi
  2001b0:	c6 41 ff 2d          	movb   $0x2d,-0x1(%ecx)
  2001b4:	49                   	dec    %ecx
  2001b5:	80 7d 82 01          	cmpb   $0x1,-0x7e(%ebp)
  2001b9:	75 ca                	jne    200185 <printd+0x51>
  2001bb:	fe 45 ac             	incb   -0x54(%ebp)
  2001be:	eb c5                	jmp    200185 <printd+0x51>
  2001c0:	81 fb 00 00 00 80    	cmp    $0x80000000,%ebx
  2001c6:	74 0f                	je     2001d7 <printd+0xa3>
  2001c8:	f7 db                	neg    %ebx
  2001ca:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
  2001ce:	c6 45 83 01          	movb   $0x1,-0x7d(%ebp)
  2001d2:	e9 75 ff ff ff       	jmp    20014c <printd+0x18>
  2001d7:	bb ff ff ff 7f       	mov    $0x7fffffff,%ebx
  2001dc:	c6 45 82 01          	movb   $0x1,-0x7e(%ebp)
  2001e0:	eb ec                	jmp    2001ce <printd+0x9a>
  2001e2:	31 d2                	xor    %edx,%edx
  2001e4:	eb b3                	jmp    200199 <printd+0x65>
  2001e6:	66 90                	xchg   %ax,%ax

002001e8 <printx>:
  2001e8:	55                   	push   %ebp
  2001e9:	89 e5                	mov    %esp,%ebp
  2001eb:	53                   	push   %ebx
  2001ec:	83 ec 20             	sub    $0x20,%esp
  2001ef:	8b 45 08             	mov    0x8(%ebp),%eax
  2001f2:	8d 5d fa             	lea    -0x6(%ebp),%ebx
  2001f5:	eb 12                	jmp    200209 <printx+0x21>
  2001f7:	90                   	nop
  2001f8:	83 c2 57             	add    $0x57,%edx
  2001fb:	88 13                	mov    %dl,(%ebx)
  2001fd:	85 c0                	test   %eax,%eax
  2001ff:	78 22                	js     200223 <printx+0x3b>
  200201:	c1 f8 04             	sar    $0x4,%eax
  200204:	4b                   	dec    %ebx
  200205:	85 c0                	test   %eax,%eax
  200207:	74 25                	je     20022e <printx+0x46>
  200209:	89 c2                	mov    %eax,%edx
  20020b:	81 e2 0f 00 00 80    	and    $0x8000000f,%edx
  200211:	78 41                	js     200254 <printx+0x6c>
  200213:	89 d9                	mov    %ebx,%ecx
  200215:	83 fa 09             	cmp    $0x9,%edx
  200218:	7f de                	jg     2001f8 <printx+0x10>
  20021a:	83 c2 30             	add    $0x30,%edx
  20021d:	88 13                	mov    %dl,(%ebx)
  20021f:	85 c0                	test   %eax,%eax
  200221:	79 de                	jns    200201 <printx+0x19>
  200223:	83 c0 0f             	add    $0xf,%eax
  200226:	c1 f8 04             	sar    $0x4,%eax
  200229:	4b                   	dec    %ebx
  20022a:	85 c0                	test   %eax,%eax
  20022c:	75 db                	jne    200209 <printx+0x21>
  20022e:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
  200232:	80 39 00             	cmpb   $0x0,(%ecx)
  200235:	74 24                	je     20025b <printx+0x73>
  200237:	90                   	nop
  200238:	40                   	inc    %eax
  200239:	89 c2                	mov    %eax,%edx
  20023b:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  20023f:	75 f7                	jne    200238 <printx+0x50>
  200241:	bb 01 00 00 00       	mov    $0x1,%ebx
  200246:	b8 04 00 00 00       	mov    $0x4,%eax
  20024b:	cd 80                	int    $0x80
  20024d:	83 c4 20             	add    $0x20,%esp
  200250:	5b                   	pop    %ebx
  200251:	5d                   	pop    %ebp
  200252:	c3                   	ret    
  200253:	90                   	nop
  200254:	4a                   	dec    %edx
  200255:	83 ca f0             	or     $0xfffffff0,%edx
  200258:	42                   	inc    %edx
  200259:	eb b8                	jmp    200213 <printx+0x2b>
  20025b:	31 d2                	xor    %edx,%edx
  20025d:	eb e2                	jmp    200241 <printx+0x59>
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
  200286:	74 1c                	je     2002a4 <prints+0x28>
  200288:	31 c0                	xor    %eax,%eax
  20028a:	66 90                	xchg   %ax,%ax
  20028c:	40                   	inc    %eax
  20028d:	89 c2                	mov    %eax,%edx
  20028f:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  200293:	75 f7                	jne    20028c <prints+0x10>
  200295:	bb 01 00 00 00       	mov    $0x1,%ebx
  20029a:	b8 04 00 00 00       	mov    $0x4,%eax
  20029f:	cd 80                	int    $0x80
  2002a1:	5b                   	pop    %ebx
  2002a2:	5d                   	pop    %ebp
  2002a3:	c3                   	ret    
  2002a4:	31 d2                	xor    %edx,%edx
  2002a6:	eb ed                	jmp    200295 <prints+0x19>

002002a8 <printf>:
  2002a8:	55                   	push   %ebp
  2002a9:	89 e5                	mov    %esp,%ebp
  2002ab:	57                   	push   %edi
  2002ac:	56                   	push   %esi
  2002ad:	53                   	push   %ebx
  2002ae:	83 ec 14             	sub    $0x14,%esp
  2002b1:	8b 7d 08             	mov    0x8(%ebp),%edi
  2002b4:	8a 07                	mov    (%edi),%al
  2002b6:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  2002b9:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  2002bc:	84 c0                	test   %al,%al
  2002be:	75 24                	jne    2002e4 <printf+0x3c>
  2002c0:	eb 59                	jmp    20031b <printf+0x73>
  2002c2:	66 90                	xchg   %ax,%ax
  2002c4:	88 45 f3             	mov    %al,-0xd(%ebp)
  2002c7:	ba 01 00 00 00       	mov    $0x1,%edx
  2002cc:	b8 04 00 00 00       	mov    $0x4,%eax
  2002d1:	89 d3                	mov    %edx,%ebx
  2002d3:	8d 4d f3             	lea    -0xd(%ebp),%ecx
  2002d6:	cd 80                	int    $0x80
  2002d8:	89 fe                	mov    %edi,%esi
  2002da:	8d 7e 01             	lea    0x1(%esi),%edi
  2002dd:	8a 46 01             	mov    0x1(%esi),%al
  2002e0:	84 c0                	test   %al,%al
  2002e2:	74 37                	je     20031b <printf+0x73>
  2002e4:	3c 25                	cmp    $0x25,%al
  2002e6:	75 dc                	jne    2002c4 <printf+0x1c>
  2002e8:	8d 77 01             	lea    0x1(%edi),%esi
  2002eb:	8a 47 01             	mov    0x1(%edi),%al
  2002ee:	3c 64                	cmp    $0x64,%al
  2002f0:	0f 84 86 00 00 00    	je     20037c <printf+0xd4>
  2002f6:	7e 2c                	jle    200324 <printf+0x7c>
  2002f8:	3c 73                	cmp    $0x73,%al
  2002fa:	74 50                	je     20034c <printf+0xa4>
  2002fc:	3c 78                	cmp    $0x78,%al
  2002fe:	75 da                	jne    2002da <printf+0x32>
  200300:	8b 45 e0             	mov    -0x20(%ebp),%eax
  200303:	8d 58 04             	lea    0x4(%eax),%ebx
  200306:	ff 30                	pushl  (%eax)
  200308:	e8 db fe ff ff       	call   2001e8 <printx>
  20030d:	58                   	pop    %eax
  20030e:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  200311:	8d 7e 01             	lea    0x1(%esi),%edi
  200314:	8a 46 01             	mov    0x1(%esi),%al
  200317:	84 c0                	test   %al,%al
  200319:	75 c9                	jne    2002e4 <printf+0x3c>
  20031b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  20031e:	5b                   	pop    %ebx
  20031f:	5e                   	pop    %esi
  200320:	5f                   	pop    %edi
  200321:	5d                   	pop    %ebp
  200322:	c3                   	ret    
  200323:	90                   	nop
  200324:	3c 63                	cmp    $0x63,%al
  200326:	75 b2                	jne    2002da <printf+0x32>
  200328:	8b 45 e0             	mov    -0x20(%ebp),%eax
  20032b:	8d 78 04             	lea    0x4(%eax),%edi
  20032e:	8b 00                	mov    (%eax),%eax
  200330:	88 45 f2             	mov    %al,-0xe(%ebp)
  200333:	ba 01 00 00 00       	mov    $0x1,%edx
  200338:	b8 04 00 00 00       	mov    $0x4,%eax
  20033d:	89 d3                	mov    %edx,%ebx
  20033f:	8d 4d f2             	lea    -0xe(%ebp),%ecx
  200342:	cd 80                	int    $0x80
  200344:	89 7d e0             	mov    %edi,-0x20(%ebp)
  200347:	eb 91                	jmp    2002da <printf+0x32>
  200349:	8d 76 00             	lea    0x0(%esi),%esi
  20034c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  20034f:	8d 78 04             	lea    0x4(%eax),%edi
  200352:	8b 08                	mov    (%eax),%ecx
  200354:	80 39 00             	cmpb   $0x0,(%ecx)
  200357:	74 39                	je     200392 <printf+0xea>
  200359:	31 c0                	xor    %eax,%eax
  20035b:	90                   	nop
  20035c:	40                   	inc    %eax
  20035d:	89 c2                	mov    %eax,%edx
  20035f:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
  200363:	75 f7                	jne    20035c <printf+0xb4>
  200365:	bb 01 00 00 00       	mov    $0x1,%ebx
  20036a:	b8 04 00 00 00       	mov    $0x4,%eax
  20036f:	cd 80                	int    $0x80
  200371:	89 7d e0             	mov    %edi,-0x20(%ebp)
  200374:	e9 61 ff ff ff       	jmp    2002da <printf+0x32>
  200379:	8d 76 00             	lea    0x0(%esi),%esi
  20037c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  20037f:	8d 58 04             	lea    0x4(%eax),%ebx
  200382:	ff 30                	pushl  (%eax)
  200384:	e8 ab fd ff ff       	call   200134 <printd>
  200389:	5a                   	pop    %edx
  20038a:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  20038d:	e9 48 ff ff ff       	jmp    2002da <printf+0x32>
  200392:	31 d2                	xor    %edx,%edx
  200394:	eb cf                	jmp    200365 <printf+0xbd>
