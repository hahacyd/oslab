
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	83 ec 28             	sub    $0x28,%esp
  200006:	e8 dc 04 00 00       	call   2004e7 <getchar>
  20000b:	88 45 f3             	mov    %al,-0xd(%ebp)
  20000e:	0f be 45 f3          	movsbl -0xd(%ebp),%eax
  200012:	83 ec 0c             	sub    $0xc,%esp
  200015:	50                   	push   %eax
  200016:	e8 6e 03 00 00       	call   200389 <printc>
  20001b:	83 c4 10             	add    $0x10,%esp
  20001e:	e8 c0 01 00 00       	call   2001e3 <exit>
  200023:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
  20002a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  200031:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
  200038:	c7 45 e4 58 00 00 00 	movl   $0x58,-0x1c(%ebp)
  20003f:	83 ec 0c             	sub    $0xc,%esp
  200042:	68 04 05 20 00       	push   $0x200504
  200047:	e8 95 03 00 00       	call   2003e1 <printf>
  20004c:	83 c4 10             	add    $0x10,%esp
  20004f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  200052:	83 ec 08             	sub    $0x8,%esp
  200055:	50                   	push   %eax
  200056:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  200059:	50                   	push   %eax
  20005a:	e8 9e 01 00 00       	call   2001fd <sem_init>
  20005f:	83 c4 10             	add    $0x10,%esp
  200062:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200065:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
  200069:	75 15                	jne    200080 <uEntry+0x80>
  20006b:	83 ec 0c             	sub    $0xc,%esp
  20006e:	68 30 05 20 00       	push   $0x200530
  200073:	e8 69 03 00 00       	call   2003e1 <printf>
  200078:	83 c4 10             	add    $0x10,%esp
  20007b:	e8 63 01 00 00       	call   2001e3 <exit>
  200080:	e8 0c 01 00 00       	call   200191 <fork>
  200085:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200088:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  20008c:	75 60                	jne    2000ee <uEntry+0xee>
  20008e:	eb 32                	jmp    2000c2 <uEntry+0xc2>
  200090:	ff 4d f4             	decl   -0xc(%ebp)
  200093:	83 ec 0c             	sub    $0xc,%esp
  200096:	68 60 05 20 00       	push   $0x200560
  20009b:	e8 41 03 00 00       	call   2003e1 <printf>
  2000a0:	83 c4 10             	add    $0x10,%esp
  2000a3:	83 ec 0c             	sub    $0xc,%esp
  2000a6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  2000a9:	50                   	push   %eax
  2000aa:	e8 86 01 00 00       	call   200235 <sem_wait>
  2000af:	83 c4 10             	add    $0x10,%esp
  2000b2:	83 ec 0c             	sub    $0xc,%esp
  2000b5:	68 84 05 20 00       	push   $0x200584
  2000ba:	e8 22 03 00 00       	call   2003e1 <printf>
  2000bf:	83 c4 10             	add    $0x10,%esp
  2000c2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  2000c6:	75 c8                	jne    200090 <uEntry+0x90>
  2000c8:	83 ec 0c             	sub    $0xc,%esp
  2000cb:	68 a8 05 20 00       	push   $0x2005a8
  2000d0:	e8 0c 03 00 00       	call   2003e1 <printf>
  2000d5:	83 c4 10             	add    $0x10,%esp
  2000d8:	83 ec 0c             	sub    $0xc,%esp
  2000db:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  2000de:	50                   	push   %eax
  2000df:	e8 66 01 00 00       	call   20024a <sem_destroy>
  2000e4:	83 c4 10             	add    $0x10,%esp
  2000e7:	e8 f7 00 00 00       	call   2001e3 <exit>
  2000ec:	eb 74                	jmp    200162 <uEntry+0x162>
  2000ee:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
  2000f2:	74 6e                	je     200162 <uEntry+0x162>
  2000f4:	eb 42                	jmp    200138 <uEntry+0x138>
  2000f6:	ff 4d f4             	decl   -0xc(%ebp)
  2000f9:	83 ec 0c             	sub    $0xc,%esp
  2000fc:	68 ce 05 20 00       	push   $0x2005ce
  200101:	e8 db 02 00 00       	call   2003e1 <printf>
  200106:	83 c4 10             	add    $0x10,%esp
  200109:	83 ec 0c             	sub    $0xc,%esp
  20010c:	68 80 00 00 00       	push   $0x80
  200111:	e8 99 00 00 00       	call   2001af <sleep>
  200116:	83 c4 10             	add    $0x10,%esp
  200119:	83 ec 0c             	sub    $0xc,%esp
  20011c:	68 ec 05 20 00       	push   $0x2005ec
  200121:	e8 bb 02 00 00       	call   2003e1 <printf>
  200126:	83 c4 10             	add    $0x10,%esp
  200129:	83 ec 0c             	sub    $0xc,%esp
  20012c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  20012f:	50                   	push   %eax
  200130:	e8 e9 00 00 00       	call   20021e <sem_post>
  200135:	83 c4 10             	add    $0x10,%esp
  200138:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  20013c:	75 b8                	jne    2000f6 <uEntry+0xf6>
  20013e:	83 ec 0c             	sub    $0xc,%esp
  200141:	68 10 06 20 00       	push   $0x200610
  200146:	e8 96 02 00 00       	call   2003e1 <printf>
  20014b:	83 c4 10             	add    $0x10,%esp
  20014e:	83 ec 0c             	sub    $0xc,%esp
  200151:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  200154:	50                   	push   %eax
  200155:	e8 f0 00 00 00       	call   20024a <sem_destroy>
  20015a:	83 c4 10             	add    $0x10,%esp
  20015d:	e8 81 00 00 00       	call   2001e3 <exit>
  200162:	b8 00 00 00 00       	mov    $0x0,%eax
  200167:	c9                   	leave  
  200168:	c3                   	ret    

00200169 <syscall>:
  200169:	55                   	push   %ebp
  20016a:	89 e5                	mov    %esp,%ebp
  20016c:	53                   	push   %ebx
  20016d:	83 ec 10             	sub    $0x10,%esp
  200170:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200177:	8b 45 08             	mov    0x8(%ebp),%eax
  20017a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  20017d:	8b 4d 10             	mov    0x10(%ebp),%ecx
  200180:	8b 55 14             	mov    0x14(%ebp),%edx
  200183:	cd 80                	int    $0x80
  200185:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200188:	8b 45 f8             	mov    -0x8(%ebp),%eax
  20018b:	83 c4 10             	add    $0x10,%esp
  20018e:	5b                   	pop    %ebx
  20018f:	5d                   	pop    %ebp
  200190:	c3                   	ret    

00200191 <fork>:
  200191:	55                   	push   %ebp
  200192:	89 e5                	mov    %esp,%ebp
  200194:	83 ec 10             	sub    $0x10,%esp
  200197:	6a 01                	push   $0x1
  200199:	6a 01                	push   $0x1
  20019b:	6a 01                	push   $0x1
  20019d:	6a 02                	push   $0x2
  20019f:	e8 c5 ff ff ff       	call   200169 <syscall>
  2001a4:	83 c4 10             	add    $0x10,%esp
  2001a7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2001aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2001ad:	c9                   	leave  
  2001ae:	c3                   	ret    

002001af <sleep>:
  2001af:	55                   	push   %ebp
  2001b0:	89 e5                	mov    %esp,%ebp
  2001b2:	8b 45 08             	mov    0x8(%ebp),%eax
  2001b5:	6a 01                	push   $0x1
  2001b7:	6a 01                	push   $0x1
  2001b9:	50                   	push   %eax
  2001ba:	68 e6 00 00 00       	push   $0xe6
  2001bf:	e8 a5 ff ff ff       	call   200169 <syscall>
  2001c4:	83 c4 10             	add    $0x10,%esp
  2001c7:	b8 00 00 00 00       	mov    $0x0,%eax
  2001cc:	c9                   	leave  
  2001cd:	c3                   	ret    

002001ce <getpid>:
  2001ce:	55                   	push   %ebp
  2001cf:	89 e5                	mov    %esp,%ebp
  2001d1:	6a 01                	push   $0x1
  2001d3:	6a 01                	push   $0x1
  2001d5:	6a 01                	push   $0x1
  2001d7:	6a 07                	push   $0x7
  2001d9:	e8 8b ff ff ff       	call   200169 <syscall>
  2001de:	83 c4 10             	add    $0x10,%esp
  2001e1:	c9                   	leave  
  2001e2:	c3                   	ret    

002001e3 <exit>:
  2001e3:	55                   	push   %ebp
  2001e4:	89 e5                	mov    %esp,%ebp
  2001e6:	6a 00                	push   $0x0
  2001e8:	6a 00                	push   $0x0
  2001ea:	6a 00                	push   $0x0
  2001ec:	6a 01                	push   $0x1
  2001ee:	e8 76 ff ff ff       	call   200169 <syscall>
  2001f3:	83 c4 10             	add    $0x10,%esp
  2001f6:	b8 00 00 00 00       	mov    $0x0,%eax
  2001fb:	c9                   	leave  
  2001fc:	c3                   	ret    

002001fd <sem_init>:
  2001fd:	55                   	push   %ebp
  2001fe:	89 e5                	mov    %esp,%ebp
  200200:	83 ec 10             	sub    $0x10,%esp
  200203:	8b 45 08             	mov    0x8(%ebp),%eax
  200206:	6a 01                	push   $0x1
  200208:	ff 75 0c             	pushl  0xc(%ebp)
  20020b:	50                   	push   %eax
  20020c:	6a 15                	push   $0x15
  20020e:	e8 56 ff ff ff       	call   200169 <syscall>
  200213:	83 c4 10             	add    $0x10,%esp
  200216:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200219:	8b 45 fc             	mov    -0x4(%ebp),%eax
  20021c:	c9                   	leave  
  20021d:	c3                   	ret    

0020021e <sem_post>:
  20021e:	55                   	push   %ebp
  20021f:	89 e5                	mov    %esp,%ebp
  200221:	8b 45 08             	mov    0x8(%ebp),%eax
  200224:	6a 01                	push   $0x1
  200226:	6a 01                	push   $0x1
  200228:	50                   	push   %eax
  200229:	6a 17                	push   $0x17
  20022b:	e8 39 ff ff ff       	call   200169 <syscall>
  200230:	83 c4 10             	add    $0x10,%esp
  200233:	c9                   	leave  
  200234:	c3                   	ret    

00200235 <sem_wait>:
  200235:	55                   	push   %ebp
  200236:	89 e5                	mov    %esp,%ebp
  200238:	6a 01                	push   $0x1
  20023a:	6a 01                	push   $0x1
  20023c:	6a 01                	push   $0x1
  20023e:	6a 16                	push   $0x16
  200240:	e8 24 ff ff ff       	call   200169 <syscall>
  200245:	83 c4 10             	add    $0x10,%esp
  200248:	c9                   	leave  
  200249:	c3                   	ret    

0020024a <sem_destroy>:
  20024a:	55                   	push   %ebp
  20024b:	89 e5                	mov    %esp,%ebp
  20024d:	8b 45 08             	mov    0x8(%ebp),%eax
  200250:	6a 01                	push   $0x1
  200252:	6a 01                	push   $0x1
  200254:	50                   	push   %eax
  200255:	6a 18                	push   $0x18
  200257:	e8 0d ff ff ff       	call   200169 <syscall>
  20025c:	83 c4 10             	add    $0x10,%esp
  20025f:	c9                   	leave  
  200260:	c3                   	ret    

00200261 <printd>:
  200261:	55                   	push   %ebp
  200262:	89 e5                	mov    %esp,%ebp
  200264:	83 ec 78             	sub    $0x78,%esp
  200267:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20026e:	8d 45 89             	lea    -0x77(%ebp),%eax
  200271:	83 c0 64             	add    $0x64,%eax
  200274:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200277:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
  20027b:	c6 45 ee 00          	movb   $0x0,-0x12(%ebp)
  20027f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  200283:	79 17                	jns    20029c <printd+0x3b>
  200285:	81 7d 08 00 00 00 80 	cmpl   $0x80000000,0x8(%ebp)
  20028c:	75 07                	jne    200295 <printd+0x34>
  20028e:	ff 45 08             	incl   0x8(%ebp)
  200291:	c6 45 ee 01          	movb   $0x1,-0x12(%ebp)
  200295:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
  200299:	f7 5d 08             	negl   0x8(%ebp)
  20029c:	ff 4d f0             	decl   -0x10(%ebp)
  20029f:	8b 45 08             	mov    0x8(%ebp),%eax
  2002a2:	b9 0a 00 00 00       	mov    $0xa,%ecx
  2002a7:	99                   	cltd   
  2002a8:	f7 f9                	idiv   %ecx
  2002aa:	89 d0                	mov    %edx,%eax
  2002ac:	83 c0 30             	add    $0x30,%eax
  2002af:	88 c2                	mov    %al,%dl
  2002b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2002b4:	88 10                	mov    %dl,(%eax)
  2002b6:	ff 45 f4             	incl   -0xc(%ebp)
  2002b9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2002bc:	b8 67 66 66 66       	mov    $0x66666667,%eax
  2002c1:	f7 e9                	imul   %ecx
  2002c3:	c1 fa 02             	sar    $0x2,%edx
  2002c6:	89 c8                	mov    %ecx,%eax
  2002c8:	c1 f8 1f             	sar    $0x1f,%eax
  2002cb:	29 c2                	sub    %eax,%edx
  2002cd:	89 d0                	mov    %edx,%eax
  2002cf:	89 45 08             	mov    %eax,0x8(%ebp)
  2002d2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  2002d6:	75 c4                	jne    20029c <printd+0x3b>
  2002d8:	80 7d ef 01          	cmpb   $0x1,-0x11(%ebp)
  2002dc:	75 0c                	jne    2002ea <printd+0x89>
  2002de:	ff 4d f0             	decl   -0x10(%ebp)
  2002e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2002e4:	c6 00 2d             	movb   $0x2d,(%eax)
  2002e7:	ff 45 f4             	incl   -0xc(%ebp)
  2002ea:	80 7d ee 01          	cmpb   $0x1,-0x12(%ebp)
  2002ee:	75 07                	jne    2002f7 <printd+0x96>
  2002f0:	8a 45 a6             	mov    -0x5a(%ebp),%al
  2002f3:	40                   	inc    %eax
  2002f4:	88 45 a6             	mov    %al,-0x5a(%ebp)
  2002f7:	c6 45 ed 00          	movb   $0x0,-0x13(%ebp)
  2002fb:	83 ec 0c             	sub    $0xc,%esp
  2002fe:	ff 75 f0             	pushl  -0x10(%ebp)
  200301:	e8 a4 00 00 00       	call   2003aa <prints>
  200306:	83 c4 10             	add    $0x10,%esp
  200309:	90                   	nop
  20030a:	c9                   	leave  
  20030b:	c3                   	ret    

0020030c <printx>:
  20030c:	55                   	push   %ebp
  20030d:	89 e5                	mov    %esp,%ebp
  20030f:	83 ec 38             	sub    $0x38,%esp
  200312:	8d 45 d1             	lea    -0x2f(%ebp),%eax
  200315:	83 c0 1e             	add    $0x1e,%eax
  200318:	89 45 f4             	mov    %eax,-0xc(%ebp)
  20031b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200322:	8b 45 08             	mov    0x8(%ebp),%eax
  200325:	25 0f 00 00 80       	and    $0x8000000f,%eax
  20032a:	85 c0                	test   %eax,%eax
  20032c:	79 05                	jns    200333 <printx+0x27>
  20032e:	48                   	dec    %eax
  20032f:	83 c8 f0             	or     $0xfffffff0,%eax
  200332:	40                   	inc    %eax
  200333:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200336:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
  20033a:	7e 12                	jle    20034e <printx+0x42>
  20033c:	ff 4d f4             	decl   -0xc(%ebp)
  20033f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200342:	83 c0 57             	add    $0x57,%eax
  200345:	88 c2                	mov    %al,%dl
  200347:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20034a:	88 10                	mov    %dl,(%eax)
  20034c:	eb 10                	jmp    20035e <printx+0x52>
  20034e:	ff 4d f4             	decl   -0xc(%ebp)
  200351:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200354:	83 c0 30             	add    $0x30,%eax
  200357:	88 c2                	mov    %al,%dl
  200359:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20035c:	88 10                	mov    %dl,(%eax)
  20035e:	8b 45 08             	mov    0x8(%ebp),%eax
  200361:	85 c0                	test   %eax,%eax
  200363:	79 03                	jns    200368 <printx+0x5c>
  200365:	83 c0 0f             	add    $0xf,%eax
  200368:	c1 f8 04             	sar    $0x4,%eax
  20036b:	89 45 08             	mov    %eax,0x8(%ebp)
  20036e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  200372:	75 ae                	jne    200322 <printx+0x16>
  200374:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
  200378:	83 ec 0c             	sub    $0xc,%esp
  20037b:	ff 75 f4             	pushl  -0xc(%ebp)
  20037e:	e8 27 00 00 00       	call   2003aa <prints>
  200383:	83 c4 10             	add    $0x10,%esp
  200386:	90                   	nop
  200387:	c9                   	leave  
  200388:	c3                   	ret    

00200389 <printc>:
  200389:	55                   	push   %ebp
  20038a:	89 e5                	mov    %esp,%ebp
  20038c:	83 ec 04             	sub    $0x4,%esp
  20038f:	8b 45 08             	mov    0x8(%ebp),%eax
  200392:	88 45 fc             	mov    %al,-0x4(%ebp)
  200395:	8d 45 fc             	lea    -0x4(%ebp),%eax
  200398:	6a 01                	push   $0x1
  20039a:	50                   	push   %eax
  20039b:	6a 01                	push   $0x1
  20039d:	6a 04                	push   $0x4
  20039f:	e8 c5 fd ff ff       	call   200169 <syscall>
  2003a4:	83 c4 10             	add    $0x10,%esp
  2003a7:	90                   	nop
  2003a8:	c9                   	leave  
  2003a9:	c3                   	ret    

002003aa <prints>:
  2003aa:	55                   	push   %ebp
  2003ab:	89 e5                	mov    %esp,%ebp
  2003ad:	83 ec 10             	sub    $0x10,%esp
  2003b0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2003b7:	eb 03                	jmp    2003bc <prints+0x12>
  2003b9:	ff 45 fc             	incl   -0x4(%ebp)
  2003bc:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2003bf:	8b 45 08             	mov    0x8(%ebp),%eax
  2003c2:	01 d0                	add    %edx,%eax
  2003c4:	8a 00                	mov    (%eax),%al
  2003c6:	84 c0                	test   %al,%al
  2003c8:	75 ef                	jne    2003b9 <prints+0xf>
  2003ca:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2003cd:	8b 45 08             	mov    0x8(%ebp),%eax
  2003d0:	52                   	push   %edx
  2003d1:	50                   	push   %eax
  2003d2:	6a 01                	push   $0x1
  2003d4:	6a 04                	push   $0x4
  2003d6:	e8 8e fd ff ff       	call   200169 <syscall>
  2003db:	83 c4 10             	add    $0x10,%esp
  2003de:	90                   	nop
  2003df:	c9                   	leave  
  2003e0:	c3                   	ret    

002003e1 <printf>:
  2003e1:	55                   	push   %ebp
  2003e2:	89 e5                	mov    %esp,%ebp
  2003e4:	83 ec 18             	sub    $0x18,%esp
  2003e7:	8d 45 0c             	lea    0xc(%ebp),%eax
  2003ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
  2003ed:	8b 45 08             	mov    0x8(%ebp),%eax
  2003f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  2003f3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  2003fa:	e9 be 00 00 00       	jmp    2004bd <printf+0xdc>
  2003ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200402:	8a 00                	mov    (%eax),%al
  200404:	3c 25                	cmp    $0x25,%al
  200406:	0f 85 9a 00 00 00    	jne    2004a6 <printf+0xc5>
  20040c:	ff 45 f0             	incl   -0x10(%ebp)
  20040f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200412:	8a 00                	mov    (%eax),%al
  200414:	0f be c0             	movsbl %al,%eax
  200417:	83 f8 64             	cmp    $0x64,%eax
  20041a:	74 1e                	je     20043a <printf+0x59>
  20041c:	83 f8 64             	cmp    $0x64,%eax
  20041f:	7f 0a                	jg     20042b <printf+0x4a>
  200421:	83 f8 63             	cmp    $0x63,%eax
  200424:	74 64                	je     20048a <printf+0xa9>
  200426:	e9 8f 00 00 00       	jmp    2004ba <printf+0xd9>
  20042b:	83 f8 73             	cmp    $0x73,%eax
  20042e:	74 41                	je     200471 <printf+0x90>
  200430:	83 f8 78             	cmp    $0x78,%eax
  200433:	74 23                	je     200458 <printf+0x77>
  200435:	e9 80 00 00 00       	jmp    2004ba <printf+0xd9>
  20043a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20043d:	8d 50 04             	lea    0x4(%eax),%edx
  200440:	89 55 f4             	mov    %edx,-0xc(%ebp)
  200443:	8b 00                	mov    (%eax),%eax
  200445:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200448:	83 ec 0c             	sub    $0xc,%esp
  20044b:	ff 75 ec             	pushl  -0x14(%ebp)
  20044e:	e8 0e fe ff ff       	call   200261 <printd>
  200453:	83 c4 10             	add    $0x10,%esp
  200456:	eb 62                	jmp    2004ba <printf+0xd9>
  200458:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20045b:	8d 50 04             	lea    0x4(%eax),%edx
  20045e:	89 55 f4             	mov    %edx,-0xc(%ebp)
  200461:	8b 00                	mov    (%eax),%eax
  200463:	83 ec 0c             	sub    $0xc,%esp
  200466:	50                   	push   %eax
  200467:	e8 a0 fe ff ff       	call   20030c <printx>
  20046c:	83 c4 10             	add    $0x10,%esp
  20046f:	eb 49                	jmp    2004ba <printf+0xd9>
  200471:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200474:	8d 50 04             	lea    0x4(%eax),%edx
  200477:	89 55 f4             	mov    %edx,-0xc(%ebp)
  20047a:	8b 00                	mov    (%eax),%eax
  20047c:	83 ec 0c             	sub    $0xc,%esp
  20047f:	50                   	push   %eax
  200480:	e8 25 ff ff ff       	call   2003aa <prints>
  200485:	83 c4 10             	add    $0x10,%esp
  200488:	eb 30                	jmp    2004ba <printf+0xd9>
  20048a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20048d:	8d 50 04             	lea    0x4(%eax),%edx
  200490:	89 55 f4             	mov    %edx,-0xc(%ebp)
  200493:	8b 00                	mov    (%eax),%eax
  200495:	0f be c0             	movsbl %al,%eax
  200498:	83 ec 0c             	sub    $0xc,%esp
  20049b:	50                   	push   %eax
  20049c:	e8 e8 fe ff ff       	call   200389 <printc>
  2004a1:	83 c4 10             	add    $0x10,%esp
  2004a4:	eb 14                	jmp    2004ba <printf+0xd9>
  2004a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2004a9:	8a 00                	mov    (%eax),%al
  2004ab:	0f be c0             	movsbl %al,%eax
  2004ae:	83 ec 0c             	sub    $0xc,%esp
  2004b1:	50                   	push   %eax
  2004b2:	e8 d2 fe ff ff       	call   200389 <printc>
  2004b7:	83 c4 10             	add    $0x10,%esp
  2004ba:	ff 45 f0             	incl   -0x10(%ebp)
  2004bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2004c0:	8a 00                	mov    (%eax),%al
  2004c2:	84 c0                	test   %al,%al
  2004c4:	0f 85 35 ff ff ff    	jne    2003ff <printf+0x1e>
  2004ca:	90                   	nop
  2004cb:	c9                   	leave  
  2004cc:	c3                   	ret    

002004cd <gets>:
  2004cd:	55                   	push   %ebp
  2004ce:	89 e5                	mov    %esp,%ebp
  2004d0:	8b 45 08             	mov    0x8(%ebp),%eax
  2004d3:	68 00 08 00 00       	push   $0x800
  2004d8:	50                   	push   %eax
  2004d9:	6a 00                	push   $0x0
  2004db:	6a 03                	push   $0x3
  2004dd:	e8 87 fc ff ff       	call   200169 <syscall>
  2004e2:	83 c4 10             	add    $0x10,%esp
  2004e5:	c9                   	leave  
  2004e6:	c3                   	ret    

002004e7 <getchar>:
  2004e7:	55                   	push   %ebp
  2004e8:	89 e5                	mov    %esp,%ebp
  2004ea:	83 ec 10             	sub    $0x10,%esp
  2004ed:	8d 45 fb             	lea    -0x5(%ebp),%eax
  2004f0:	6a 01                	push   $0x1
  2004f2:	50                   	push   %eax
  2004f3:	6a 00                	push   $0x0
  2004f5:	6a 03                	push   $0x3
  2004f7:	e8 6d fc ff ff       	call   200169 <syscall>
  2004fc:	83 c4 10             	add    $0x10,%esp
  2004ff:	8a 45 fb             	mov    -0x5(%ebp),%al
  200502:	c9                   	leave  
  200503:	c3                   	ret    
