
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	83 ec 18             	sub    $0x18,%esp
  200006:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
  20000d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200014:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
  20001b:	c7 45 e8 58 00 00 00 	movl   $0x58,-0x18(%ebp)
  200022:	83 ec 0c             	sub    $0xc,%esp
  200025:	68 b0 04 20 00       	push   $0x2004b0
  20002a:	e8 95 03 00 00       	call   2003c4 <printf>
  20002f:	83 c4 10             	add    $0x10,%esp
  200032:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200035:	83 ec 08             	sub    $0x8,%esp
  200038:	50                   	push   %eax
  200039:	8d 45 e8             	lea    -0x18(%ebp),%eax
  20003c:	50                   	push   %eax
  20003d:	e8 9e 01 00 00       	call   2001e0 <sem_init>
  200042:	83 c4 10             	add    $0x10,%esp
  200045:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200048:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  20004c:	75 15                	jne    200063 <uEntry+0x63>
  20004e:	83 ec 0c             	sub    $0xc,%esp
  200051:	68 dc 04 20 00       	push   $0x2004dc
  200056:	e8 69 03 00 00       	call   2003c4 <printf>
  20005b:	83 c4 10             	add    $0x10,%esp
  20005e:	e8 63 01 00 00       	call   2001c6 <exit>
  200063:	e8 0c 01 00 00       	call   200174 <fork>
  200068:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20006b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  20006f:	75 60                	jne    2000d1 <uEntry+0xd1>
  200071:	eb 32                	jmp    2000a5 <uEntry+0xa5>
  200073:	ff 4d f4             	decl   -0xc(%ebp)
  200076:	83 ec 0c             	sub    $0xc,%esp
  200079:	68 0c 05 20 00       	push   $0x20050c
  20007e:	e8 41 03 00 00       	call   2003c4 <printf>
  200083:	83 c4 10             	add    $0x10,%esp
  200086:	83 ec 0c             	sub    $0xc,%esp
  200089:	8d 45 e8             	lea    -0x18(%ebp),%eax
  20008c:	50                   	push   %eax
  20008d:	e8 86 01 00 00       	call   200218 <sem_wait>
  200092:	83 c4 10             	add    $0x10,%esp
  200095:	83 ec 0c             	sub    $0xc,%esp
  200098:	68 30 05 20 00       	push   $0x200530
  20009d:	e8 22 03 00 00       	call   2003c4 <printf>
  2000a2:	83 c4 10             	add    $0x10,%esp
  2000a5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  2000a9:	75 c8                	jne    200073 <uEntry+0x73>
  2000ab:	83 ec 0c             	sub    $0xc,%esp
  2000ae:	68 54 05 20 00       	push   $0x200554
  2000b3:	e8 0c 03 00 00       	call   2003c4 <printf>
  2000b8:	83 c4 10             	add    $0x10,%esp
  2000bb:	83 ec 0c             	sub    $0xc,%esp
  2000be:	8d 45 e8             	lea    -0x18(%ebp),%eax
  2000c1:	50                   	push   %eax
  2000c2:	e8 66 01 00 00       	call   20022d <sem_destroy>
  2000c7:	83 c4 10             	add    $0x10,%esp
  2000ca:	e8 f7 00 00 00       	call   2001c6 <exit>
  2000cf:	eb 74                	jmp    200145 <uEntry+0x145>
  2000d1:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  2000d5:	74 6e                	je     200145 <uEntry+0x145>
  2000d7:	eb 42                	jmp    20011b <uEntry+0x11b>
  2000d9:	ff 4d f4             	decl   -0xc(%ebp)
  2000dc:	83 ec 0c             	sub    $0xc,%esp
  2000df:	68 7a 05 20 00       	push   $0x20057a
  2000e4:	e8 db 02 00 00       	call   2003c4 <printf>
  2000e9:	83 c4 10             	add    $0x10,%esp
  2000ec:	83 ec 0c             	sub    $0xc,%esp
  2000ef:	68 80 00 00 00       	push   $0x80
  2000f4:	e8 99 00 00 00       	call   200192 <sleep>
  2000f9:	83 c4 10             	add    $0x10,%esp
  2000fc:	83 ec 0c             	sub    $0xc,%esp
  2000ff:	68 98 05 20 00       	push   $0x200598
  200104:	e8 bb 02 00 00       	call   2003c4 <printf>
  200109:	83 c4 10             	add    $0x10,%esp
  20010c:	83 ec 0c             	sub    $0xc,%esp
  20010f:	8d 45 e8             	lea    -0x18(%ebp),%eax
  200112:	50                   	push   %eax
  200113:	e8 e9 00 00 00       	call   200201 <sem_post>
  200118:	83 c4 10             	add    $0x10,%esp
  20011b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  20011f:	75 b8                	jne    2000d9 <uEntry+0xd9>
  200121:	83 ec 0c             	sub    $0xc,%esp
  200124:	68 bc 05 20 00       	push   $0x2005bc
  200129:	e8 96 02 00 00       	call   2003c4 <printf>
  20012e:	83 c4 10             	add    $0x10,%esp
  200131:	83 ec 0c             	sub    $0xc,%esp
  200134:	8d 45 e8             	lea    -0x18(%ebp),%eax
  200137:	50                   	push   %eax
  200138:	e8 f0 00 00 00       	call   20022d <sem_destroy>
  20013d:	83 c4 10             	add    $0x10,%esp
  200140:	e8 81 00 00 00       	call   2001c6 <exit>
  200145:	b8 00 00 00 00       	mov    $0x0,%eax
  20014a:	c9                   	leave  
  20014b:	c3                   	ret    

0020014c <syscall>:
  20014c:	55                   	push   %ebp
  20014d:	89 e5                	mov    %esp,%ebp
  20014f:	53                   	push   %ebx
  200150:	83 ec 10             	sub    $0x10,%esp
  200153:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  20015a:	8b 45 08             	mov    0x8(%ebp),%eax
  20015d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  200160:	8b 4d 10             	mov    0x10(%ebp),%ecx
  200163:	8b 55 14             	mov    0x14(%ebp),%edx
  200166:	cd 80                	int    $0x80
  200168:	89 45 f8             	mov    %eax,-0x8(%ebp)
  20016b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  20016e:	83 c4 10             	add    $0x10,%esp
  200171:	5b                   	pop    %ebx
  200172:	5d                   	pop    %ebp
  200173:	c3                   	ret    

00200174 <fork>:
  200174:	55                   	push   %ebp
  200175:	89 e5                	mov    %esp,%ebp
  200177:	83 ec 10             	sub    $0x10,%esp
  20017a:	6a 01                	push   $0x1
  20017c:	6a 01                	push   $0x1
  20017e:	6a 01                	push   $0x1
  200180:	6a 02                	push   $0x2
  200182:	e8 c5 ff ff ff       	call   20014c <syscall>
  200187:	83 c4 10             	add    $0x10,%esp
  20018a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20018d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200190:	c9                   	leave  
  200191:	c3                   	ret    

00200192 <sleep>:
  200192:	55                   	push   %ebp
  200193:	89 e5                	mov    %esp,%ebp
  200195:	8b 45 08             	mov    0x8(%ebp),%eax
  200198:	6a 01                	push   $0x1
  20019a:	6a 01                	push   $0x1
  20019c:	50                   	push   %eax
  20019d:	68 e6 00 00 00       	push   $0xe6
  2001a2:	e8 a5 ff ff ff       	call   20014c <syscall>
  2001a7:	83 c4 10             	add    $0x10,%esp
  2001aa:	b8 00 00 00 00       	mov    $0x0,%eax
  2001af:	c9                   	leave  
  2001b0:	c3                   	ret    

002001b1 <getpid>:
  2001b1:	55                   	push   %ebp
  2001b2:	89 e5                	mov    %esp,%ebp
  2001b4:	6a 01                	push   $0x1
  2001b6:	6a 01                	push   $0x1
  2001b8:	6a 01                	push   $0x1
  2001ba:	6a 07                	push   $0x7
  2001bc:	e8 8b ff ff ff       	call   20014c <syscall>
  2001c1:	83 c4 10             	add    $0x10,%esp
  2001c4:	c9                   	leave  
  2001c5:	c3                   	ret    

002001c6 <exit>:
  2001c6:	55                   	push   %ebp
  2001c7:	89 e5                	mov    %esp,%ebp
  2001c9:	6a 00                	push   $0x0
  2001cb:	6a 00                	push   $0x0
  2001cd:	6a 00                	push   $0x0
  2001cf:	6a 01                	push   $0x1
  2001d1:	e8 76 ff ff ff       	call   20014c <syscall>
  2001d6:	83 c4 10             	add    $0x10,%esp
  2001d9:	b8 00 00 00 00       	mov    $0x0,%eax
  2001de:	c9                   	leave  
  2001df:	c3                   	ret    

002001e0 <sem_init>:
  2001e0:	55                   	push   %ebp
  2001e1:	89 e5                	mov    %esp,%ebp
  2001e3:	83 ec 10             	sub    $0x10,%esp
  2001e6:	8b 45 08             	mov    0x8(%ebp),%eax
  2001e9:	6a 01                	push   $0x1
  2001eb:	ff 75 0c             	pushl  0xc(%ebp)
  2001ee:	50                   	push   %eax
  2001ef:	6a 15                	push   $0x15
  2001f1:	e8 56 ff ff ff       	call   20014c <syscall>
  2001f6:	83 c4 10             	add    $0x10,%esp
  2001f9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2001fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2001ff:	c9                   	leave  
  200200:	c3                   	ret    

00200201 <sem_post>:
  200201:	55                   	push   %ebp
  200202:	89 e5                	mov    %esp,%ebp
  200204:	8b 45 08             	mov    0x8(%ebp),%eax
  200207:	6a 01                	push   $0x1
  200209:	6a 01                	push   $0x1
  20020b:	50                   	push   %eax
  20020c:	6a 17                	push   $0x17
  20020e:	e8 39 ff ff ff       	call   20014c <syscall>
  200213:	83 c4 10             	add    $0x10,%esp
  200216:	c9                   	leave  
  200217:	c3                   	ret    

00200218 <sem_wait>:
  200218:	55                   	push   %ebp
  200219:	89 e5                	mov    %esp,%ebp
  20021b:	6a 01                	push   $0x1
  20021d:	6a 01                	push   $0x1
  20021f:	6a 01                	push   $0x1
  200221:	6a 16                	push   $0x16
  200223:	e8 24 ff ff ff       	call   20014c <syscall>
  200228:	83 c4 10             	add    $0x10,%esp
  20022b:	c9                   	leave  
  20022c:	c3                   	ret    

0020022d <sem_destroy>:
  20022d:	55                   	push   %ebp
  20022e:	89 e5                	mov    %esp,%ebp
  200230:	8b 45 08             	mov    0x8(%ebp),%eax
  200233:	6a 01                	push   $0x1
  200235:	6a 01                	push   $0x1
  200237:	50                   	push   %eax
  200238:	6a 18                	push   $0x18
  20023a:	e8 0d ff ff ff       	call   20014c <syscall>
  20023f:	83 c4 10             	add    $0x10,%esp
  200242:	c9                   	leave  
  200243:	c3                   	ret    

00200244 <printd>:
  200244:	55                   	push   %ebp
  200245:	89 e5                	mov    %esp,%ebp
  200247:	83 ec 78             	sub    $0x78,%esp
  20024a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200251:	8d 45 89             	lea    -0x77(%ebp),%eax
  200254:	83 c0 64             	add    $0x64,%eax
  200257:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20025a:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
  20025e:	c6 45 ee 00          	movb   $0x0,-0x12(%ebp)
  200262:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  200266:	79 17                	jns    20027f <printd+0x3b>
  200268:	81 7d 08 00 00 00 80 	cmpl   $0x80000000,0x8(%ebp)
  20026f:	75 07                	jne    200278 <printd+0x34>
  200271:	ff 45 08             	incl   0x8(%ebp)
  200274:	c6 45 ee 01          	movb   $0x1,-0x12(%ebp)
  200278:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
  20027c:	f7 5d 08             	negl   0x8(%ebp)
  20027f:	ff 4d f0             	decl   -0x10(%ebp)
  200282:	8b 45 08             	mov    0x8(%ebp),%eax
  200285:	b9 0a 00 00 00       	mov    $0xa,%ecx
  20028a:	99                   	cltd   
  20028b:	f7 f9                	idiv   %ecx
  20028d:	89 d0                	mov    %edx,%eax
  20028f:	83 c0 30             	add    $0x30,%eax
  200292:	88 c2                	mov    %al,%dl
  200294:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200297:	88 10                	mov    %dl,(%eax)
  200299:	ff 45 f4             	incl   -0xc(%ebp)
  20029c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  20029f:	b8 67 66 66 66       	mov    $0x66666667,%eax
  2002a4:	f7 e9                	imul   %ecx
  2002a6:	c1 fa 02             	sar    $0x2,%edx
  2002a9:	89 c8                	mov    %ecx,%eax
  2002ab:	c1 f8 1f             	sar    $0x1f,%eax
  2002ae:	29 c2                	sub    %eax,%edx
  2002b0:	89 d0                	mov    %edx,%eax
  2002b2:	89 45 08             	mov    %eax,0x8(%ebp)
  2002b5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  2002b9:	75 c4                	jne    20027f <printd+0x3b>
  2002bb:	80 7d ef 01          	cmpb   $0x1,-0x11(%ebp)
  2002bf:	75 0c                	jne    2002cd <printd+0x89>
  2002c1:	ff 4d f0             	decl   -0x10(%ebp)
  2002c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2002c7:	c6 00 2d             	movb   $0x2d,(%eax)
  2002ca:	ff 45 f4             	incl   -0xc(%ebp)
  2002cd:	80 7d ee 01          	cmpb   $0x1,-0x12(%ebp)
  2002d1:	75 07                	jne    2002da <printd+0x96>
  2002d3:	8a 45 a6             	mov    -0x5a(%ebp),%al
  2002d6:	40                   	inc    %eax
  2002d7:	88 45 a6             	mov    %al,-0x5a(%ebp)
  2002da:	c6 45 ed 00          	movb   $0x0,-0x13(%ebp)
  2002de:	83 ec 0c             	sub    $0xc,%esp
  2002e1:	ff 75 f0             	pushl  -0x10(%ebp)
  2002e4:	e8 a4 00 00 00       	call   20038d <prints>
  2002e9:	83 c4 10             	add    $0x10,%esp
  2002ec:	90                   	nop
  2002ed:	c9                   	leave  
  2002ee:	c3                   	ret    

002002ef <printx>:
  2002ef:	55                   	push   %ebp
  2002f0:	89 e5                	mov    %esp,%ebp
  2002f2:	83 ec 38             	sub    $0x38,%esp
  2002f5:	8d 45 d1             	lea    -0x2f(%ebp),%eax
  2002f8:	83 c0 1e             	add    $0x1e,%eax
  2002fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  2002fe:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200305:	8b 45 08             	mov    0x8(%ebp),%eax
  200308:	25 0f 00 00 80       	and    $0x8000000f,%eax
  20030d:	85 c0                	test   %eax,%eax
  20030f:	79 05                	jns    200316 <printx+0x27>
  200311:	48                   	dec    %eax
  200312:	83 c8 f0             	or     $0xfffffff0,%eax
  200315:	40                   	inc    %eax
  200316:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200319:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
  20031d:	7e 12                	jle    200331 <printx+0x42>
  20031f:	ff 4d f4             	decl   -0xc(%ebp)
  200322:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200325:	83 c0 57             	add    $0x57,%eax
  200328:	88 c2                	mov    %al,%dl
  20032a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20032d:	88 10                	mov    %dl,(%eax)
  20032f:	eb 10                	jmp    200341 <printx+0x52>
  200331:	ff 4d f4             	decl   -0xc(%ebp)
  200334:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200337:	83 c0 30             	add    $0x30,%eax
  20033a:	88 c2                	mov    %al,%dl
  20033c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20033f:	88 10                	mov    %dl,(%eax)
  200341:	8b 45 08             	mov    0x8(%ebp),%eax
  200344:	85 c0                	test   %eax,%eax
  200346:	79 03                	jns    20034b <printx+0x5c>
  200348:	83 c0 0f             	add    $0xf,%eax
  20034b:	c1 f8 04             	sar    $0x4,%eax
  20034e:	89 45 08             	mov    %eax,0x8(%ebp)
  200351:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  200355:	75 ae                	jne    200305 <printx+0x16>
  200357:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
  20035b:	83 ec 0c             	sub    $0xc,%esp
  20035e:	ff 75 f4             	pushl  -0xc(%ebp)
  200361:	e8 27 00 00 00       	call   20038d <prints>
  200366:	83 c4 10             	add    $0x10,%esp
  200369:	90                   	nop
  20036a:	c9                   	leave  
  20036b:	c3                   	ret    

0020036c <printc>:
  20036c:	55                   	push   %ebp
  20036d:	89 e5                	mov    %esp,%ebp
  20036f:	83 ec 04             	sub    $0x4,%esp
  200372:	8b 45 08             	mov    0x8(%ebp),%eax
  200375:	88 45 fc             	mov    %al,-0x4(%ebp)
  200378:	8d 45 fc             	lea    -0x4(%ebp),%eax
  20037b:	6a 01                	push   $0x1
  20037d:	50                   	push   %eax
  20037e:	6a 01                	push   $0x1
  200380:	6a 04                	push   $0x4
  200382:	e8 c5 fd ff ff       	call   20014c <syscall>
  200387:	83 c4 10             	add    $0x10,%esp
  20038a:	90                   	nop
  20038b:	c9                   	leave  
  20038c:	c3                   	ret    

0020038d <prints>:
  20038d:	55                   	push   %ebp
  20038e:	89 e5                	mov    %esp,%ebp
  200390:	83 ec 10             	sub    $0x10,%esp
  200393:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  20039a:	eb 03                	jmp    20039f <prints+0x12>
  20039c:	ff 45 fc             	incl   -0x4(%ebp)
  20039f:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2003a2:	8b 45 08             	mov    0x8(%ebp),%eax
  2003a5:	01 d0                	add    %edx,%eax
  2003a7:	8a 00                	mov    (%eax),%al
  2003a9:	84 c0                	test   %al,%al
  2003ab:	75 ef                	jne    20039c <prints+0xf>
  2003ad:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2003b0:	8b 45 08             	mov    0x8(%ebp),%eax
  2003b3:	52                   	push   %edx
  2003b4:	50                   	push   %eax
  2003b5:	6a 01                	push   $0x1
  2003b7:	6a 04                	push   $0x4
  2003b9:	e8 8e fd ff ff       	call   20014c <syscall>
  2003be:	83 c4 10             	add    $0x10,%esp
  2003c1:	90                   	nop
  2003c2:	c9                   	leave  
  2003c3:	c3                   	ret    

002003c4 <printf>:
  2003c4:	55                   	push   %ebp
  2003c5:	89 e5                	mov    %esp,%ebp
  2003c7:	83 ec 18             	sub    $0x18,%esp
  2003ca:	8d 45 0c             	lea    0xc(%ebp),%eax
  2003cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  2003d0:	8b 45 08             	mov    0x8(%ebp),%eax
  2003d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  2003d6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  2003dd:	e9 be 00 00 00       	jmp    2004a0 <printf+0xdc>
  2003e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2003e5:	8a 00                	mov    (%eax),%al
  2003e7:	3c 25                	cmp    $0x25,%al
  2003e9:	0f 85 9a 00 00 00    	jne    200489 <printf+0xc5>
  2003ef:	ff 45 f0             	incl   -0x10(%ebp)
  2003f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2003f5:	8a 00                	mov    (%eax),%al
  2003f7:	0f be c0             	movsbl %al,%eax
  2003fa:	83 f8 64             	cmp    $0x64,%eax
  2003fd:	74 1e                	je     20041d <printf+0x59>
  2003ff:	83 f8 64             	cmp    $0x64,%eax
  200402:	7f 0a                	jg     20040e <printf+0x4a>
  200404:	83 f8 63             	cmp    $0x63,%eax
  200407:	74 64                	je     20046d <printf+0xa9>
  200409:	e9 8f 00 00 00       	jmp    20049d <printf+0xd9>
  20040e:	83 f8 73             	cmp    $0x73,%eax
  200411:	74 41                	je     200454 <printf+0x90>
  200413:	83 f8 78             	cmp    $0x78,%eax
  200416:	74 23                	je     20043b <printf+0x77>
  200418:	e9 80 00 00 00       	jmp    20049d <printf+0xd9>
  20041d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200420:	8d 50 04             	lea    0x4(%eax),%edx
  200423:	89 55 f4             	mov    %edx,-0xc(%ebp)
  200426:	8b 00                	mov    (%eax),%eax
  200428:	89 45 ec             	mov    %eax,-0x14(%ebp)
  20042b:	83 ec 0c             	sub    $0xc,%esp
  20042e:	ff 75 ec             	pushl  -0x14(%ebp)
  200431:	e8 0e fe ff ff       	call   200244 <printd>
  200436:	83 c4 10             	add    $0x10,%esp
  200439:	eb 62                	jmp    20049d <printf+0xd9>
  20043b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20043e:	8d 50 04             	lea    0x4(%eax),%edx
  200441:	89 55 f4             	mov    %edx,-0xc(%ebp)
  200444:	8b 00                	mov    (%eax),%eax
  200446:	83 ec 0c             	sub    $0xc,%esp
  200449:	50                   	push   %eax
  20044a:	e8 a0 fe ff ff       	call   2002ef <printx>
  20044f:	83 c4 10             	add    $0x10,%esp
  200452:	eb 49                	jmp    20049d <printf+0xd9>
  200454:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200457:	8d 50 04             	lea    0x4(%eax),%edx
  20045a:	89 55 f4             	mov    %edx,-0xc(%ebp)
  20045d:	8b 00                	mov    (%eax),%eax
  20045f:	83 ec 0c             	sub    $0xc,%esp
  200462:	50                   	push   %eax
  200463:	e8 25 ff ff ff       	call   20038d <prints>
  200468:	83 c4 10             	add    $0x10,%esp
  20046b:	eb 30                	jmp    20049d <printf+0xd9>
  20046d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200470:	8d 50 04             	lea    0x4(%eax),%edx
  200473:	89 55 f4             	mov    %edx,-0xc(%ebp)
  200476:	8b 00                	mov    (%eax),%eax
  200478:	0f be c0             	movsbl %al,%eax
  20047b:	83 ec 0c             	sub    $0xc,%esp
  20047e:	50                   	push   %eax
  20047f:	e8 e8 fe ff ff       	call   20036c <printc>
  200484:	83 c4 10             	add    $0x10,%esp
  200487:	eb 14                	jmp    20049d <printf+0xd9>
  200489:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20048c:	8a 00                	mov    (%eax),%al
  20048e:	0f be c0             	movsbl %al,%eax
  200491:	83 ec 0c             	sub    $0xc,%esp
  200494:	50                   	push   %eax
  200495:	e8 d2 fe ff ff       	call   20036c <printc>
  20049a:	83 c4 10             	add    $0x10,%esp
  20049d:	ff 45 f0             	incl   -0x10(%ebp)
  2004a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2004a3:	8a 00                	mov    (%eax),%al
  2004a5:	84 c0                	test   %al,%al
  2004a7:	0f 85 35 ff ff ff    	jne    2003e2 <printf+0x1e>
  2004ad:	90                   	nop
  2004ae:	c9                   	leave  
  2004af:	c3                   	ret    
