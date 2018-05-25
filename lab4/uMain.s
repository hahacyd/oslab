
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	81 ec 18 08 00 00    	sub    $0x818,%esp
  200009:	eb 1a                	jmp    200025 <uEntry+0x25>
  20000b:	8a 85 ec f7 ff ff    	mov    -0x814(%ebp),%al
  200011:	0f be c0             	movsbl %al,%eax
  200014:	83 ec 08             	sub    $0x8,%esp
  200017:	50                   	push   %eax
  200018:	68 4c 08 20 00       	push   $0x20084c
  20001d:	e8 2a 04 00 00       	call   20044c <printf>
  200022:	83 c4 10             	add    $0x10,%esp
  200025:	83 ec 08             	sub    $0x8,%esp
  200028:	8d 85 ec f7 ff ff    	lea    -0x814(%ebp),%eax
  20002e:	50                   	push   %eax
  20002f:	68 50 08 20 00       	push   $0x200850
  200034:	e8 b2 06 00 00       	call   2006eb <scanf>
  200039:	83 c4 10             	add    $0x10,%esp
  20003c:	83 f8 ff             	cmp    $0xffffffff,%eax
  20003f:	75 ca                	jne    20000b <uEntry+0xb>
  200041:	83 ec 0c             	sub    $0xc,%esp
  200044:	68 55 08 20 00       	push   $0x200855
  200049:	e8 fe 03 00 00       	call   20044c <printf>
  20004e:	83 c4 10             	add    $0x10,%esp
  200051:	e8 d2 01 00 00       	call   200228 <exit>
  200056:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
  20005d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200064:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
  20006b:	c7 85 e8 f7 ff ff 58 	movl   $0x58,-0x818(%ebp)
  200072:	00 00 00 
  200075:	83 ec 0c             	sub    $0xc,%esp
  200078:	68 60 08 20 00       	push   $0x200860
  20007d:	e8 ca 03 00 00       	call   20044c <printf>
  200082:	83 c4 10             	add    $0x10,%esp
  200085:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200088:	83 ec 08             	sub    $0x8,%esp
  20008b:	50                   	push   %eax
  20008c:	8d 85 e8 f7 ff ff    	lea    -0x818(%ebp),%eax
  200092:	50                   	push   %eax
  200093:	e8 aa 01 00 00       	call   200242 <sem_init>
  200098:	83 c4 10             	add    $0x10,%esp
  20009b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20009e:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  2000a2:	75 15                	jne    2000b9 <uEntry+0xb9>
  2000a4:	83 ec 0c             	sub    $0xc,%esp
  2000a7:	68 8c 08 20 00       	push   $0x20088c
  2000ac:	e8 9b 03 00 00       	call   20044c <printf>
  2000b1:	83 c4 10             	add    $0x10,%esp
  2000b4:	e8 6f 01 00 00       	call   200228 <exit>
  2000b9:	e8 18 01 00 00       	call   2001d6 <fork>
  2000be:	89 45 f0             	mov    %eax,-0x10(%ebp)
  2000c1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  2000c5:	75 66                	jne    20012d <uEntry+0x12d>
  2000c7:	eb 35                	jmp    2000fe <uEntry+0xfe>
  2000c9:	ff 4d f4             	decl   -0xc(%ebp)
  2000cc:	83 ec 0c             	sub    $0xc,%esp
  2000cf:	68 bc 08 20 00       	push   $0x2008bc
  2000d4:	e8 73 03 00 00       	call   20044c <printf>
  2000d9:	83 c4 10             	add    $0x10,%esp
  2000dc:	83 ec 0c             	sub    $0xc,%esp
  2000df:	8d 85 e8 f7 ff ff    	lea    -0x818(%ebp),%eax
  2000e5:	50                   	push   %eax
  2000e6:	e8 8f 01 00 00       	call   20027a <sem_wait>
  2000eb:	83 c4 10             	add    $0x10,%esp
  2000ee:	83 ec 0c             	sub    $0xc,%esp
  2000f1:	68 e0 08 20 00       	push   $0x2008e0
  2000f6:	e8 51 03 00 00       	call   20044c <printf>
  2000fb:	83 c4 10             	add    $0x10,%esp
  2000fe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  200102:	75 c5                	jne    2000c9 <uEntry+0xc9>
  200104:	83 ec 0c             	sub    $0xc,%esp
  200107:	68 04 09 20 00       	push   $0x200904
  20010c:	e8 3b 03 00 00       	call   20044c <printf>
  200111:	83 c4 10             	add    $0x10,%esp
  200114:	83 ec 0c             	sub    $0xc,%esp
  200117:	8d 85 e8 f7 ff ff    	lea    -0x818(%ebp),%eax
  20011d:	50                   	push   %eax
  20011e:	e8 6c 01 00 00       	call   20028f <sem_destroy>
  200123:	83 c4 10             	add    $0x10,%esp
  200126:	e8 fd 00 00 00       	call   200228 <exit>
  20012b:	eb 7a                	jmp    2001a7 <uEntry+0x1a7>
  20012d:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  200131:	74 74                	je     2001a7 <uEntry+0x1a7>
  200133:	eb 45                	jmp    20017a <uEntry+0x17a>
  200135:	ff 4d f4             	decl   -0xc(%ebp)
  200138:	83 ec 0c             	sub    $0xc,%esp
  20013b:	68 2a 09 20 00       	push   $0x20092a
  200140:	e8 07 03 00 00       	call   20044c <printf>
  200145:	83 c4 10             	add    $0x10,%esp
  200148:	83 ec 0c             	sub    $0xc,%esp
  20014b:	68 80 00 00 00       	push   $0x80
  200150:	e8 9f 00 00 00       	call   2001f4 <sleep>
  200155:	83 c4 10             	add    $0x10,%esp
  200158:	83 ec 0c             	sub    $0xc,%esp
  20015b:	68 48 09 20 00       	push   $0x200948
  200160:	e8 e7 02 00 00       	call   20044c <printf>
  200165:	83 c4 10             	add    $0x10,%esp
  200168:	83 ec 0c             	sub    $0xc,%esp
  20016b:	8d 85 e8 f7 ff ff    	lea    -0x818(%ebp),%eax
  200171:	50                   	push   %eax
  200172:	e8 ec 00 00 00       	call   200263 <sem_post>
  200177:	83 c4 10             	add    $0x10,%esp
  20017a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  20017e:	75 b5                	jne    200135 <uEntry+0x135>
  200180:	83 ec 0c             	sub    $0xc,%esp
  200183:	68 6c 09 20 00       	push   $0x20096c
  200188:	e8 bf 02 00 00       	call   20044c <printf>
  20018d:	83 c4 10             	add    $0x10,%esp
  200190:	83 ec 0c             	sub    $0xc,%esp
  200193:	8d 85 e8 f7 ff ff    	lea    -0x818(%ebp),%eax
  200199:	50                   	push   %eax
  20019a:	e8 f0 00 00 00       	call   20028f <sem_destroy>
  20019f:	83 c4 10             	add    $0x10,%esp
  2001a2:	e8 81 00 00 00       	call   200228 <exit>
  2001a7:	b8 00 00 00 00       	mov    $0x0,%eax
  2001ac:	c9                   	leave  
  2001ad:	c3                   	ret    

002001ae <syscall>:
  2001ae:	55                   	push   %ebp
  2001af:	89 e5                	mov    %esp,%ebp
  2001b1:	53                   	push   %ebx
  2001b2:	83 ec 10             	sub    $0x10,%esp
  2001b5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2001bc:	8b 45 08             	mov    0x8(%ebp),%eax
  2001bf:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  2001c2:	8b 4d 10             	mov    0x10(%ebp),%ecx
  2001c5:	8b 55 14             	mov    0x14(%ebp),%edx
  2001c8:	cd 80                	int    $0x80
  2001ca:	89 45 f8             	mov    %eax,-0x8(%ebp)
  2001cd:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2001d0:	83 c4 10             	add    $0x10,%esp
  2001d3:	5b                   	pop    %ebx
  2001d4:	5d                   	pop    %ebp
  2001d5:	c3                   	ret    

002001d6 <fork>:
  2001d6:	55                   	push   %ebp
  2001d7:	89 e5                	mov    %esp,%ebp
  2001d9:	83 ec 10             	sub    $0x10,%esp
  2001dc:	6a 01                	push   $0x1
  2001de:	6a 01                	push   $0x1
  2001e0:	6a 01                	push   $0x1
  2001e2:	6a 02                	push   $0x2
  2001e4:	e8 c5 ff ff ff       	call   2001ae <syscall>
  2001e9:	83 c4 10             	add    $0x10,%esp
  2001ec:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2001ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2001f2:	c9                   	leave  
  2001f3:	c3                   	ret    

002001f4 <sleep>:
  2001f4:	55                   	push   %ebp
  2001f5:	89 e5                	mov    %esp,%ebp
  2001f7:	8b 45 08             	mov    0x8(%ebp),%eax
  2001fa:	6a 01                	push   $0x1
  2001fc:	6a 01                	push   $0x1
  2001fe:	50                   	push   %eax
  2001ff:	68 e6 00 00 00       	push   $0xe6
  200204:	e8 a5 ff ff ff       	call   2001ae <syscall>
  200209:	83 c4 10             	add    $0x10,%esp
  20020c:	b8 00 00 00 00       	mov    $0x0,%eax
  200211:	c9                   	leave  
  200212:	c3                   	ret    

00200213 <getpid>:
  200213:	55                   	push   %ebp
  200214:	89 e5                	mov    %esp,%ebp
  200216:	6a 01                	push   $0x1
  200218:	6a 01                	push   $0x1
  20021a:	6a 01                	push   $0x1
  20021c:	6a 07                	push   $0x7
  20021e:	e8 8b ff ff ff       	call   2001ae <syscall>
  200223:	83 c4 10             	add    $0x10,%esp
  200226:	c9                   	leave  
  200227:	c3                   	ret    

00200228 <exit>:
  200228:	55                   	push   %ebp
  200229:	89 e5                	mov    %esp,%ebp
  20022b:	6a 00                	push   $0x0
  20022d:	6a 00                	push   $0x0
  20022f:	6a 00                	push   $0x0
  200231:	6a 01                	push   $0x1
  200233:	e8 76 ff ff ff       	call   2001ae <syscall>
  200238:	83 c4 10             	add    $0x10,%esp
  20023b:	b8 00 00 00 00       	mov    $0x0,%eax
  200240:	c9                   	leave  
  200241:	c3                   	ret    

00200242 <sem_init>:
  200242:	55                   	push   %ebp
  200243:	89 e5                	mov    %esp,%ebp
  200245:	83 ec 10             	sub    $0x10,%esp
  200248:	8b 45 08             	mov    0x8(%ebp),%eax
  20024b:	6a 01                	push   $0x1
  20024d:	ff 75 0c             	pushl  0xc(%ebp)
  200250:	50                   	push   %eax
  200251:	6a 15                	push   $0x15
  200253:	e8 56 ff ff ff       	call   2001ae <syscall>
  200258:	83 c4 10             	add    $0x10,%esp
  20025b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20025e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200261:	c9                   	leave  
  200262:	c3                   	ret    

00200263 <sem_post>:
  200263:	55                   	push   %ebp
  200264:	89 e5                	mov    %esp,%ebp
  200266:	8b 45 08             	mov    0x8(%ebp),%eax
  200269:	6a 01                	push   $0x1
  20026b:	6a 01                	push   $0x1
  20026d:	50                   	push   %eax
  20026e:	6a 17                	push   $0x17
  200270:	e8 39 ff ff ff       	call   2001ae <syscall>
  200275:	83 c4 10             	add    $0x10,%esp
  200278:	c9                   	leave  
  200279:	c3                   	ret    

0020027a <sem_wait>:
  20027a:	55                   	push   %ebp
  20027b:	89 e5                	mov    %esp,%ebp
  20027d:	6a 01                	push   $0x1
  20027f:	6a 01                	push   $0x1
  200281:	6a 01                	push   $0x1
  200283:	6a 16                	push   $0x16
  200285:	e8 24 ff ff ff       	call   2001ae <syscall>
  20028a:	83 c4 10             	add    $0x10,%esp
  20028d:	c9                   	leave  
  20028e:	c3                   	ret    

0020028f <sem_destroy>:
  20028f:	55                   	push   %ebp
  200290:	89 e5                	mov    %esp,%ebp
  200292:	8b 45 08             	mov    0x8(%ebp),%eax
  200295:	6a 01                	push   $0x1
  200297:	6a 01                	push   $0x1
  200299:	50                   	push   %eax
  20029a:	6a 18                	push   $0x18
  20029c:	e8 0d ff ff ff       	call   2001ae <syscall>
  2002a1:	83 c4 10             	add    $0x10,%esp
  2002a4:	c9                   	leave  
  2002a5:	c3                   	ret    

002002a6 <printd>:
  2002a6:	55                   	push   %ebp
  2002a7:	89 e5                	mov    %esp,%ebp
  2002a9:	83 ec 78             	sub    $0x78,%esp
  2002ac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2002b3:	8d 45 89             	lea    -0x77(%ebp),%eax
  2002b6:	83 c0 64             	add    $0x64,%eax
  2002b9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  2002bc:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
  2002c0:	c6 45 ee 00          	movb   $0x0,-0x12(%ebp)
  2002c4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  2002c8:	79 17                	jns    2002e1 <printd+0x3b>
  2002ca:	81 7d 08 00 00 00 80 	cmpl   $0x80000000,0x8(%ebp)
  2002d1:	75 07                	jne    2002da <printd+0x34>
  2002d3:	ff 45 08             	incl   0x8(%ebp)
  2002d6:	c6 45 ee 01          	movb   $0x1,-0x12(%ebp)
  2002da:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
  2002de:	f7 5d 08             	negl   0x8(%ebp)
  2002e1:	ff 4d f0             	decl   -0x10(%ebp)
  2002e4:	8b 45 08             	mov    0x8(%ebp),%eax
  2002e7:	b9 0a 00 00 00       	mov    $0xa,%ecx
  2002ec:	99                   	cltd   
  2002ed:	f7 f9                	idiv   %ecx
  2002ef:	89 d0                	mov    %edx,%eax
  2002f1:	83 c0 30             	add    $0x30,%eax
  2002f4:	88 c2                	mov    %al,%dl
  2002f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2002f9:	88 10                	mov    %dl,(%eax)
  2002fb:	ff 45 f4             	incl   -0xc(%ebp)
  2002fe:	8b 4d 08             	mov    0x8(%ebp),%ecx
  200301:	b8 67 66 66 66       	mov    $0x66666667,%eax
  200306:	f7 e9                	imul   %ecx
  200308:	c1 fa 02             	sar    $0x2,%edx
  20030b:	89 c8                	mov    %ecx,%eax
  20030d:	c1 f8 1f             	sar    $0x1f,%eax
  200310:	29 c2                	sub    %eax,%edx
  200312:	89 d0                	mov    %edx,%eax
  200314:	89 45 08             	mov    %eax,0x8(%ebp)
  200317:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  20031b:	75 c4                	jne    2002e1 <printd+0x3b>
  20031d:	80 7d ef 01          	cmpb   $0x1,-0x11(%ebp)
  200321:	75 0c                	jne    20032f <printd+0x89>
  200323:	ff 4d f0             	decl   -0x10(%ebp)
  200326:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200329:	c6 00 2d             	movb   $0x2d,(%eax)
  20032c:	ff 45 f4             	incl   -0xc(%ebp)
  20032f:	80 7d ee 01          	cmpb   $0x1,-0x12(%ebp)
  200333:	75 07                	jne    20033c <printd+0x96>
  200335:	8a 45 a6             	mov    -0x5a(%ebp),%al
  200338:	40                   	inc    %eax
  200339:	88 45 a6             	mov    %al,-0x5a(%ebp)
  20033c:	c6 45 ed 00          	movb   $0x0,-0x13(%ebp)
  200340:	83 ec 0c             	sub    $0xc,%esp
  200343:	ff 75 f0             	pushl  -0x10(%ebp)
  200346:	e8 ca 00 00 00       	call   200415 <prints>
  20034b:	83 c4 10             	add    $0x10,%esp
  20034e:	90                   	nop
  20034f:	c9                   	leave  
  200350:	c3                   	ret    

00200351 <printx>:
  200351:	55                   	push   %ebp
  200352:	89 e5                	mov    %esp,%ebp
  200354:	83 ec 38             	sub    $0x38,%esp
  200357:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20035e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  200362:	79 0a                	jns    20036e <printx+0x1d>
  200364:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  20036b:	f7 5d 08             	negl   0x8(%ebp)
  20036e:	8d 45 cd             	lea    -0x33(%ebp),%eax
  200371:	83 c0 1e             	add    $0x1e,%eax
  200374:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200377:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  20037e:	8b 45 08             	mov    0x8(%ebp),%eax
  200381:	25 0f 00 00 80       	and    $0x8000000f,%eax
  200386:	85 c0                	test   %eax,%eax
  200388:	79 05                	jns    20038f <printx+0x3e>
  20038a:	48                   	dec    %eax
  20038b:	83 c8 f0             	or     $0xfffffff0,%eax
  20038e:	40                   	inc    %eax
  20038f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200392:	83 7d ec 09          	cmpl   $0x9,-0x14(%ebp)
  200396:	7e 12                	jle    2003aa <printx+0x59>
  200398:	ff 4d f0             	decl   -0x10(%ebp)
  20039b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  20039e:	83 c0 57             	add    $0x57,%eax
  2003a1:	88 c2                	mov    %al,%dl
  2003a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2003a6:	88 10                	mov    %dl,(%eax)
  2003a8:	eb 10                	jmp    2003ba <printx+0x69>
  2003aa:	ff 4d f0             	decl   -0x10(%ebp)
  2003ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2003b0:	83 c0 30             	add    $0x30,%eax
  2003b3:	88 c2                	mov    %al,%dl
  2003b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2003b8:	88 10                	mov    %dl,(%eax)
  2003ba:	8b 45 08             	mov    0x8(%ebp),%eax
  2003bd:	85 c0                	test   %eax,%eax
  2003bf:	79 03                	jns    2003c4 <printx+0x73>
  2003c1:	83 c0 0f             	add    $0xf,%eax
  2003c4:	c1 f8 04             	sar    $0x4,%eax
  2003c7:	89 45 08             	mov    %eax,0x8(%ebp)
  2003ca:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  2003ce:	75 ae                	jne    20037e <printx+0x2d>
  2003d0:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
  2003d4:	75 09                	jne    2003df <printx+0x8e>
  2003d6:	ff 4d f0             	decl   -0x10(%ebp)
  2003d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2003dc:	c6 00 2d             	movb   $0x2d,(%eax)
  2003df:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
  2003e3:	83 ec 0c             	sub    $0xc,%esp
  2003e6:	ff 75 f0             	pushl  -0x10(%ebp)
  2003e9:	e8 27 00 00 00       	call   200415 <prints>
  2003ee:	83 c4 10             	add    $0x10,%esp
  2003f1:	90                   	nop
  2003f2:	c9                   	leave  
  2003f3:	c3                   	ret    

002003f4 <printc>:
  2003f4:	55                   	push   %ebp
  2003f5:	89 e5                	mov    %esp,%ebp
  2003f7:	83 ec 04             	sub    $0x4,%esp
  2003fa:	8b 45 08             	mov    0x8(%ebp),%eax
  2003fd:	88 45 fc             	mov    %al,-0x4(%ebp)
  200400:	8d 45 fc             	lea    -0x4(%ebp),%eax
  200403:	6a 01                	push   $0x1
  200405:	50                   	push   %eax
  200406:	6a 01                	push   $0x1
  200408:	6a 04                	push   $0x4
  20040a:	e8 9f fd ff ff       	call   2001ae <syscall>
  20040f:	83 c4 10             	add    $0x10,%esp
  200412:	90                   	nop
  200413:	c9                   	leave  
  200414:	c3                   	ret    

00200415 <prints>:
  200415:	55                   	push   %ebp
  200416:	89 e5                	mov    %esp,%ebp
  200418:	83 ec 10             	sub    $0x10,%esp
  20041b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200422:	eb 03                	jmp    200427 <prints+0x12>
  200424:	ff 45 fc             	incl   -0x4(%ebp)
  200427:	8b 55 fc             	mov    -0x4(%ebp),%edx
  20042a:	8b 45 08             	mov    0x8(%ebp),%eax
  20042d:	01 d0                	add    %edx,%eax
  20042f:	8a 00                	mov    (%eax),%al
  200431:	84 c0                	test   %al,%al
  200433:	75 ef                	jne    200424 <prints+0xf>
  200435:	8b 55 fc             	mov    -0x4(%ebp),%edx
  200438:	8b 45 08             	mov    0x8(%ebp),%eax
  20043b:	52                   	push   %edx
  20043c:	50                   	push   %eax
  20043d:	6a 01                	push   $0x1
  20043f:	6a 04                	push   $0x4
  200441:	e8 68 fd ff ff       	call   2001ae <syscall>
  200446:	83 c4 10             	add    $0x10,%esp
  200449:	90                   	nop
  20044a:	c9                   	leave  
  20044b:	c3                   	ret    

0020044c <printf>:
  20044c:	55                   	push   %ebp
  20044d:	89 e5                	mov    %esp,%ebp
  20044f:	83 ec 18             	sub    $0x18,%esp
  200452:	8d 45 0c             	lea    0xc(%ebp),%eax
  200455:	89 45 f4             	mov    %eax,-0xc(%ebp)
  200458:	8b 45 08             	mov    0x8(%ebp),%eax
  20045b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20045e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  200465:	e9 be 00 00 00       	jmp    200528 <printf+0xdc>
  20046a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20046d:	8a 00                	mov    (%eax),%al
  20046f:	3c 25                	cmp    $0x25,%al
  200471:	0f 85 9a 00 00 00    	jne    200511 <printf+0xc5>
  200477:	ff 45 f0             	incl   -0x10(%ebp)
  20047a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20047d:	8a 00                	mov    (%eax),%al
  20047f:	0f be c0             	movsbl %al,%eax
  200482:	83 f8 64             	cmp    $0x64,%eax
  200485:	74 1e                	je     2004a5 <printf+0x59>
  200487:	83 f8 64             	cmp    $0x64,%eax
  20048a:	7f 0a                	jg     200496 <printf+0x4a>
  20048c:	83 f8 63             	cmp    $0x63,%eax
  20048f:	74 64                	je     2004f5 <printf+0xa9>
  200491:	e9 8f 00 00 00       	jmp    200525 <printf+0xd9>
  200496:	83 f8 73             	cmp    $0x73,%eax
  200499:	74 41                	je     2004dc <printf+0x90>
  20049b:	83 f8 78             	cmp    $0x78,%eax
  20049e:	74 23                	je     2004c3 <printf+0x77>
  2004a0:	e9 80 00 00 00       	jmp    200525 <printf+0xd9>
  2004a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2004a8:	8d 50 04             	lea    0x4(%eax),%edx
  2004ab:	89 55 f4             	mov    %edx,-0xc(%ebp)
  2004ae:	8b 00                	mov    (%eax),%eax
  2004b0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2004b3:	83 ec 0c             	sub    $0xc,%esp
  2004b6:	ff 75 ec             	pushl  -0x14(%ebp)
  2004b9:	e8 e8 fd ff ff       	call   2002a6 <printd>
  2004be:	83 c4 10             	add    $0x10,%esp
  2004c1:	eb 62                	jmp    200525 <printf+0xd9>
  2004c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2004c6:	8d 50 04             	lea    0x4(%eax),%edx
  2004c9:	89 55 f4             	mov    %edx,-0xc(%ebp)
  2004cc:	8b 00                	mov    (%eax),%eax
  2004ce:	83 ec 0c             	sub    $0xc,%esp
  2004d1:	50                   	push   %eax
  2004d2:	e8 7a fe ff ff       	call   200351 <printx>
  2004d7:	83 c4 10             	add    $0x10,%esp
  2004da:	eb 49                	jmp    200525 <printf+0xd9>
  2004dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2004df:	8d 50 04             	lea    0x4(%eax),%edx
  2004e2:	89 55 f4             	mov    %edx,-0xc(%ebp)
  2004e5:	8b 00                	mov    (%eax),%eax
  2004e7:	83 ec 0c             	sub    $0xc,%esp
  2004ea:	50                   	push   %eax
  2004eb:	e8 25 ff ff ff       	call   200415 <prints>
  2004f0:	83 c4 10             	add    $0x10,%esp
  2004f3:	eb 30                	jmp    200525 <printf+0xd9>
  2004f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2004f8:	8d 50 04             	lea    0x4(%eax),%edx
  2004fb:	89 55 f4             	mov    %edx,-0xc(%ebp)
  2004fe:	8b 00                	mov    (%eax),%eax
  200500:	0f be c0             	movsbl %al,%eax
  200503:	83 ec 0c             	sub    $0xc,%esp
  200506:	50                   	push   %eax
  200507:	e8 e8 fe ff ff       	call   2003f4 <printc>
  20050c:	83 c4 10             	add    $0x10,%esp
  20050f:	eb 14                	jmp    200525 <printf+0xd9>
  200511:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200514:	8a 00                	mov    (%eax),%al
  200516:	0f be c0             	movsbl %al,%eax
  200519:	83 ec 0c             	sub    $0xc,%esp
  20051c:	50                   	push   %eax
  20051d:	e8 d2 fe ff ff       	call   2003f4 <printc>
  200522:	83 c4 10             	add    $0x10,%esp
  200525:	ff 45 f0             	incl   -0x10(%ebp)
  200528:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20052b:	8a 00                	mov    (%eax),%al
  20052d:	84 c0                	test   %al,%al
  20052f:	0f 85 35 ff ff ff    	jne    20046a <printf+0x1e>
  200535:	90                   	nop
  200536:	c9                   	leave  
  200537:	c3                   	ret    

00200538 <gets>:
  200538:	55                   	push   %ebp
  200539:	89 e5                	mov    %esp,%ebp
  20053b:	8b 45 08             	mov    0x8(%ebp),%eax
  20053e:	68 00 08 00 00       	push   $0x800
  200543:	50                   	push   %eax
  200544:	6a 00                	push   $0x0
  200546:	6a 03                	push   $0x3
  200548:	e8 61 fc ff ff       	call   2001ae <syscall>
  20054d:	83 c4 10             	add    $0x10,%esp
  200550:	c9                   	leave  
  200551:	c3                   	ret    

00200552 <getchar>:
  200552:	55                   	push   %ebp
  200553:	89 e5                	mov    %esp,%ebp
  200555:	83 ec 10             	sub    $0x10,%esp
  200558:	8d 45 fb             	lea    -0x5(%ebp),%eax
  20055b:	6a 01                	push   $0x1
  20055d:	50                   	push   %eax
  20055e:	6a 00                	push   $0x0
  200560:	6a 03                	push   $0x3
  200562:	e8 47 fc ff ff       	call   2001ae <syscall>
  200567:	83 c4 10             	add    $0x10,%esp
  20056a:	8a 45 fb             	mov    -0x5(%ebp),%al
  20056d:	c9                   	leave  
  20056e:	c3                   	ret    

0020056f <scanfd>:
  20056f:	55                   	push   %ebp
  200570:	89 e5                	mov    %esp,%ebp
  200572:	83 ec 10             	sub    $0x10,%esp
  200575:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  20057c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200583:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20058a:	8b 45 08             	mov    0x8(%ebp),%eax
  20058d:	8a 00                	mov    (%eax),%al
  20058f:	3c 2d                	cmp    $0x2d,%al
  200591:	75 32                	jne    2005c5 <scanfd+0x56>
  200593:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%ebp)
  20059a:	ff 45 08             	incl   0x8(%ebp)
  20059d:	ff 45 f4             	incl   -0xc(%ebp)
  2005a0:	eb 23                	jmp    2005c5 <scanfd+0x56>
  2005a2:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2005a5:	89 d0                	mov    %edx,%eax
  2005a7:	c1 e0 02             	shl    $0x2,%eax
  2005aa:	01 d0                	add    %edx,%eax
  2005ac:	01 c0                	add    %eax,%eax
  2005ae:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2005b1:	8b 45 08             	mov    0x8(%ebp),%eax
  2005b4:	8a 00                	mov    (%eax),%al
  2005b6:	0f be c0             	movsbl %al,%eax
  2005b9:	83 e8 30             	sub    $0x30,%eax
  2005bc:	01 45 fc             	add    %eax,-0x4(%ebp)
  2005bf:	ff 45 08             	incl   0x8(%ebp)
  2005c2:	ff 45 f4             	incl   -0xc(%ebp)
  2005c5:	8b 45 08             	mov    0x8(%ebp),%eax
  2005c8:	8a 00                	mov    (%eax),%al
  2005ca:	3c 20                	cmp    $0x20,%al
  2005cc:	74 09                	je     2005d7 <scanfd+0x68>
  2005ce:	8b 45 08             	mov    0x8(%ebp),%eax
  2005d1:	8a 00                	mov    (%eax),%al
  2005d3:	84 c0                	test   %al,%al
  2005d5:	75 cb                	jne    2005a2 <scanfd+0x33>
  2005d7:	83 7d f8 01          	cmpl   $0x1,-0x8(%ebp)
  2005db:	75 07                	jne    2005e4 <scanfd+0x75>
  2005dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2005e0:	f7 d8                	neg    %eax
  2005e2:	eb 03                	jmp    2005e7 <scanfd+0x78>
  2005e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2005e7:	8b 55 0c             	mov    0xc(%ebp),%edx
  2005ea:	89 02                	mov    %eax,(%edx)
  2005ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2005ef:	c9                   	leave  
  2005f0:	c3                   	ret    

002005f1 <scanfx>:
  2005f1:	55                   	push   %ebp
  2005f2:	89 e5                	mov    %esp,%ebp
  2005f4:	83 ec 10             	sub    $0x10,%esp
  2005f7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2005fe:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200605:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20060c:	8b 45 08             	mov    0x8(%ebp),%eax
  20060f:	8a 00                	mov    (%eax),%al
  200611:	3c 2d                	cmp    $0x2d,%al
  200613:	75 5b                	jne    200670 <scanfx+0x7f>
  200615:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%ebp)
  20061c:	ff 45 08             	incl   0x8(%ebp)
  20061f:	ff 45 f4             	incl   -0xc(%ebp)
  200622:	eb 4c                	jmp    200670 <scanfx+0x7f>
  200624:	c1 65 fc 04          	shll   $0x4,-0x4(%ebp)
  200628:	8b 45 08             	mov    0x8(%ebp),%eax
  20062b:	8a 00                	mov    (%eax),%al
  20062d:	3c 66                	cmp    $0x66,%al
  20062f:	7f 19                	jg     20064a <scanfx+0x59>
  200631:	8b 45 08             	mov    0x8(%ebp),%eax
  200634:	8a 00                	mov    (%eax),%al
  200636:	3c 60                	cmp    $0x60,%al
  200638:	7e 10                	jle    20064a <scanfx+0x59>
  20063a:	8b 45 08             	mov    0x8(%ebp),%eax
  20063d:	8a 00                	mov    (%eax),%al
  20063f:	0f be c0             	movsbl %al,%eax
  200642:	83 e8 57             	sub    $0x57,%eax
  200645:	01 45 fc             	add    %eax,-0x4(%ebp)
  200648:	eb 20                	jmp    20066a <scanfx+0x79>
  20064a:	8b 45 08             	mov    0x8(%ebp),%eax
  20064d:	8a 00                	mov    (%eax),%al
  20064f:	3c 39                	cmp    $0x39,%al
  200651:	7f 17                	jg     20066a <scanfx+0x79>
  200653:	8b 45 08             	mov    0x8(%ebp),%eax
  200656:	8a 00                	mov    (%eax),%al
  200658:	3c 2f                	cmp    $0x2f,%al
  20065a:	7e 0e                	jle    20066a <scanfx+0x79>
  20065c:	8b 45 08             	mov    0x8(%ebp),%eax
  20065f:	8a 00                	mov    (%eax),%al
  200661:	0f be c0             	movsbl %al,%eax
  200664:	83 e8 30             	sub    $0x30,%eax
  200667:	01 45 fc             	add    %eax,-0x4(%ebp)
  20066a:	ff 45 08             	incl   0x8(%ebp)
  20066d:	ff 45 f4             	incl   -0xc(%ebp)
  200670:	8b 45 08             	mov    0x8(%ebp),%eax
  200673:	8a 00                	mov    (%eax),%al
  200675:	3c 20                	cmp    $0x20,%al
  200677:	74 09                	je     200682 <scanfx+0x91>
  200679:	8b 45 08             	mov    0x8(%ebp),%eax
  20067c:	8a 00                	mov    (%eax),%al
  20067e:	84 c0                	test   %al,%al
  200680:	75 a2                	jne    200624 <scanfx+0x33>
  200682:	83 7d f8 01          	cmpl   $0x1,-0x8(%ebp)
  200686:	75 03                	jne    20068b <scanfx+0x9a>
  200688:	f7 5d fc             	negl   -0x4(%ebp)
  20068b:	8b 45 0c             	mov    0xc(%ebp),%eax
  20068e:	8b 55 fc             	mov    -0x4(%ebp),%edx
  200691:	89 10                	mov    %edx,(%eax)
  200693:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200696:	c9                   	leave  
  200697:	c3                   	ret    

00200698 <scanfs>:
  200698:	55                   	push   %ebp
  200699:	89 e5                	mov    %esp,%ebp
  20069b:	83 ec 10             	sub    $0x10,%esp
  20069e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2006a5:	eb 19                	jmp    2006c0 <scanfs+0x28>
  2006a7:	8b 45 0c             	mov    0xc(%ebp),%eax
  2006aa:	8d 50 01             	lea    0x1(%eax),%edx
  2006ad:	89 55 0c             	mov    %edx,0xc(%ebp)
  2006b0:	8b 55 08             	mov    0x8(%ebp),%edx
  2006b3:	8d 4a 01             	lea    0x1(%edx),%ecx
  2006b6:	89 4d 08             	mov    %ecx,0x8(%ebp)
  2006b9:	8a 12                	mov    (%edx),%dl
  2006bb:	88 10                	mov    %dl,(%eax)
  2006bd:	ff 45 fc             	incl   -0x4(%ebp)
  2006c0:	8b 45 08             	mov    0x8(%ebp),%eax
  2006c3:	8a 00                	mov    (%eax),%al
  2006c5:	3c 20                	cmp    $0x20,%al
  2006c7:	74 09                	je     2006d2 <scanfs+0x3a>
  2006c9:	8b 45 08             	mov    0x8(%ebp),%eax
  2006cc:	8a 00                	mov    (%eax),%al
  2006ce:	84 c0                	test   %al,%al
  2006d0:	75 d5                	jne    2006a7 <scanfs+0xf>
  2006d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2006d5:	c9                   	leave  
  2006d6:	c3                   	ret    

002006d7 <scanfc>:
  2006d7:	55                   	push   %ebp
  2006d8:	89 e5                	mov    %esp,%ebp
  2006da:	8b 45 08             	mov    0x8(%ebp),%eax
  2006dd:	8a 10                	mov    (%eax),%dl
  2006df:	8b 45 0c             	mov    0xc(%ebp),%eax
  2006e2:	88 10                	mov    %dl,(%eax)
  2006e4:	b8 01 00 00 00       	mov    $0x1,%eax
  2006e9:	5d                   	pop    %ebp
  2006ea:	c3                   	ret    

002006eb <scanf>:
  2006eb:	55                   	push   %ebp
  2006ec:	89 e5                	mov    %esp,%ebp
  2006ee:	81 ec 10 08 00 00    	sub    $0x810,%esp
  2006f4:	8d 85 f0 f7 ff ff    	lea    -0x810(%ebp),%eax
  2006fa:	50                   	push   %eax
  2006fb:	e8 38 fe ff ff       	call   200538 <gets>
  200700:	83 c4 04             	add    $0x4,%esp
  200703:	8d 45 0c             	lea    0xc(%ebp),%eax
  200706:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200709:	8b 45 08             	mov    0x8(%ebp),%eax
  20070c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20070f:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200716:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20071d:	e9 10 01 00 00       	jmp    200832 <scanf+0x147>
  200722:	8b 55 f8             	mov    -0x8(%ebp),%edx
  200725:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200728:	01 d0                	add    %edx,%eax
  20072a:	8a 00                	mov    (%eax),%al
  20072c:	3c 25                	cmp    $0x25,%al
  20072e:	0f 85 d6 00 00 00    	jne    20080a <scanf+0x11f>
  200734:	ff 45 f8             	incl   -0x8(%ebp)
  200737:	8b 55 f8             	mov    -0x8(%ebp),%edx
  20073a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20073d:	01 d0                	add    %edx,%eax
  20073f:	8a 00                	mov    (%eax),%al
  200741:	0f be c0             	movsbl %al,%eax
  200744:	83 f8 64             	cmp    $0x64,%eax
  200747:	74 22                	je     20076b <scanf+0x80>
  200749:	83 f8 64             	cmp    $0x64,%eax
  20074c:	7f 0e                	jg     20075c <scanf+0x71>
  20074e:	83 f8 63             	cmp    $0x63,%eax
  200751:	0f 84 8c 00 00 00    	je     2007e3 <scanf+0xf8>
  200757:	e9 d3 00 00 00       	jmp    20082f <scanf+0x144>
  20075c:	83 f8 73             	cmp    $0x73,%eax
  20075f:	74 5b                	je     2007bc <scanf+0xd1>
  200761:	83 f8 78             	cmp    $0x78,%eax
  200764:	74 2f                	je     200795 <scanf+0xaa>
  200766:	e9 c4 00 00 00       	jmp    20082f <scanf+0x144>
  20076b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  20076e:	8d 50 04             	lea    0x4(%eax),%edx
  200771:	89 55 fc             	mov    %edx,-0x4(%ebp)
  200774:	8b 00                	mov    (%eax),%eax
  200776:	89 c2                	mov    %eax,%edx
  200778:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20077b:	8d 8d f0 f7 ff ff    	lea    -0x810(%ebp),%ecx
  200781:	01 c8                	add    %ecx,%eax
  200783:	52                   	push   %edx
  200784:	50                   	push   %eax
  200785:	e8 e5 fd ff ff       	call   20056f <scanfd>
  20078a:	83 c4 08             	add    $0x8,%esp
  20078d:	01 45 f4             	add    %eax,-0xc(%ebp)
  200790:	e9 9a 00 00 00       	jmp    20082f <scanf+0x144>
  200795:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200798:	8d 50 04             	lea    0x4(%eax),%edx
  20079b:	89 55 fc             	mov    %edx,-0x4(%ebp)
  20079e:	8b 00                	mov    (%eax),%eax
  2007a0:	89 c2                	mov    %eax,%edx
  2007a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2007a5:	8d 8d f0 f7 ff ff    	lea    -0x810(%ebp),%ecx
  2007ab:	01 c8                	add    %ecx,%eax
  2007ad:	52                   	push   %edx
  2007ae:	50                   	push   %eax
  2007af:	e8 3d fe ff ff       	call   2005f1 <scanfx>
  2007b4:	83 c4 08             	add    $0x8,%esp
  2007b7:	01 45 f4             	add    %eax,-0xc(%ebp)
  2007ba:	eb 73                	jmp    20082f <scanf+0x144>
  2007bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2007bf:	8d 50 04             	lea    0x4(%eax),%edx
  2007c2:	89 55 fc             	mov    %edx,-0x4(%ebp)
  2007c5:	8b 00                	mov    (%eax),%eax
  2007c7:	89 c2                	mov    %eax,%edx
  2007c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2007cc:	8d 8d f0 f7 ff ff    	lea    -0x810(%ebp),%ecx
  2007d2:	01 c8                	add    %ecx,%eax
  2007d4:	52                   	push   %edx
  2007d5:	50                   	push   %eax
  2007d6:	e8 bd fe ff ff       	call   200698 <scanfs>
  2007db:	83 c4 08             	add    $0x8,%esp
  2007de:	01 45 f4             	add    %eax,-0xc(%ebp)
  2007e1:	eb 4c                	jmp    20082f <scanf+0x144>
  2007e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2007e6:	8d 50 04             	lea    0x4(%eax),%edx
  2007e9:	89 55 fc             	mov    %edx,-0x4(%ebp)
  2007ec:	8b 00                	mov    (%eax),%eax
  2007ee:	89 c2                	mov    %eax,%edx
  2007f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2007f3:	8d 8d f0 f7 ff ff    	lea    -0x810(%ebp),%ecx
  2007f9:	01 c8                	add    %ecx,%eax
  2007fb:	52                   	push   %edx
  2007fc:	50                   	push   %eax
  2007fd:	e8 d5 fe ff ff       	call   2006d7 <scanfc>
  200802:	83 c4 08             	add    $0x8,%esp
  200805:	01 45 f4             	add    %eax,-0xc(%ebp)
  200808:	eb 25                	jmp    20082f <scanf+0x144>
  20080a:	8b 55 f8             	mov    -0x8(%ebp),%edx
  20080d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200810:	01 d0                	add    %edx,%eax
  200812:	8a 10                	mov    (%eax),%dl
  200814:	8d 8d f0 f7 ff ff    	lea    -0x810(%ebp),%ecx
  20081a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20081d:	01 c8                	add    %ecx,%eax
  20081f:	8a 00                	mov    (%eax),%al
  200821:	38 c2                	cmp    %al,%dl
  200823:	74 07                	je     20082c <scanf+0x141>
  200825:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  20082a:	eb 1d                	jmp    200849 <scanf+0x15e>
  20082c:	ff 45 f4             	incl   -0xc(%ebp)
  20082f:	ff 45 f8             	incl   -0x8(%ebp)
  200832:	8b 55 f8             	mov    -0x8(%ebp),%edx
  200835:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200838:	01 d0                	add    %edx,%eax
  20083a:	8a 00                	mov    (%eax),%al
  20083c:	84 c0                	test   %al,%al
  20083e:	0f 85 de fe ff ff    	jne    200722 <scanf+0x37>
  200844:	b8 01 00 00 00       	mov    $0x1,%eax
  200849:	c9                   	leave  
  20084a:	c3                   	ret    
