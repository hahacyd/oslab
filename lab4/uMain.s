
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	81 ec 18 08 00 00    	sub    $0x818,%esp
  200009:	83 ec 0c             	sub    $0xc,%esp
  20000c:	8d 85 ec f7 ff ff    	lea    -0x814(%ebp),%eax
  200012:	50                   	push   %eax
  200013:	e8 db 04 00 00       	call   2004f3 <gets>
  200018:	83 c4 10             	add    $0x10,%esp
  20001b:	83 ec 08             	sub    $0x8,%esp
  20001e:	8d 85 ec f7 ff ff    	lea    -0x814(%ebp),%eax
  200024:	50                   	push   %eax
  200025:	68 0c 05 20 00       	push   $0x20050c
  20002a:	e8 d8 03 00 00       	call   200407 <printf>
  20002f:	83 c4 10             	add    $0x10,%esp
  200032:	e8 d2 01 00 00       	call   200209 <exit>
  200037:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
  20003e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200045:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
  20004c:	c7 85 e8 f7 ff ff 58 	movl   $0x58,-0x818(%ebp)
  200053:	00 00 00 
  200056:	83 ec 0c             	sub    $0xc,%esp
  200059:	68 10 05 20 00       	push   $0x200510
  20005e:	e8 a4 03 00 00       	call   200407 <printf>
  200063:	83 c4 10             	add    $0x10,%esp
  200066:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200069:	83 ec 08             	sub    $0x8,%esp
  20006c:	50                   	push   %eax
  20006d:	8d 85 e8 f7 ff ff    	lea    -0x818(%ebp),%eax
  200073:	50                   	push   %eax
  200074:	e8 aa 01 00 00       	call   200223 <sem_init>
  200079:	83 c4 10             	add    $0x10,%esp
  20007c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20007f:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  200083:	75 15                	jne    20009a <uEntry+0x9a>
  200085:	83 ec 0c             	sub    $0xc,%esp
  200088:	68 3c 05 20 00       	push   $0x20053c
  20008d:	e8 75 03 00 00       	call   200407 <printf>
  200092:	83 c4 10             	add    $0x10,%esp
  200095:	e8 6f 01 00 00       	call   200209 <exit>
  20009a:	e8 18 01 00 00       	call   2001b7 <fork>
  20009f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  2000a2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  2000a6:	75 66                	jne    20010e <uEntry+0x10e>
  2000a8:	eb 35                	jmp    2000df <uEntry+0xdf>
  2000aa:	ff 4d f4             	decl   -0xc(%ebp)
  2000ad:	83 ec 0c             	sub    $0xc,%esp
  2000b0:	68 6c 05 20 00       	push   $0x20056c
  2000b5:	e8 4d 03 00 00       	call   200407 <printf>
  2000ba:	83 c4 10             	add    $0x10,%esp
  2000bd:	83 ec 0c             	sub    $0xc,%esp
  2000c0:	8d 85 e8 f7 ff ff    	lea    -0x818(%ebp),%eax
  2000c6:	50                   	push   %eax
  2000c7:	e8 8f 01 00 00       	call   20025b <sem_wait>
  2000cc:	83 c4 10             	add    $0x10,%esp
  2000cf:	83 ec 0c             	sub    $0xc,%esp
  2000d2:	68 90 05 20 00       	push   $0x200590
  2000d7:	e8 2b 03 00 00       	call   200407 <printf>
  2000dc:	83 c4 10             	add    $0x10,%esp
  2000df:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  2000e3:	75 c5                	jne    2000aa <uEntry+0xaa>
  2000e5:	83 ec 0c             	sub    $0xc,%esp
  2000e8:	68 b4 05 20 00       	push   $0x2005b4
  2000ed:	e8 15 03 00 00       	call   200407 <printf>
  2000f2:	83 c4 10             	add    $0x10,%esp
  2000f5:	83 ec 0c             	sub    $0xc,%esp
  2000f8:	8d 85 e8 f7 ff ff    	lea    -0x818(%ebp),%eax
  2000fe:	50                   	push   %eax
  2000ff:	e8 6c 01 00 00       	call   200270 <sem_destroy>
  200104:	83 c4 10             	add    $0x10,%esp
  200107:	e8 fd 00 00 00       	call   200209 <exit>
  20010c:	eb 7a                	jmp    200188 <uEntry+0x188>
  20010e:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  200112:	74 74                	je     200188 <uEntry+0x188>
  200114:	eb 45                	jmp    20015b <uEntry+0x15b>
  200116:	ff 4d f4             	decl   -0xc(%ebp)
  200119:	83 ec 0c             	sub    $0xc,%esp
  20011c:	68 da 05 20 00       	push   $0x2005da
  200121:	e8 e1 02 00 00       	call   200407 <printf>
  200126:	83 c4 10             	add    $0x10,%esp
  200129:	83 ec 0c             	sub    $0xc,%esp
  20012c:	68 80 00 00 00       	push   $0x80
  200131:	e8 9f 00 00 00       	call   2001d5 <sleep>
  200136:	83 c4 10             	add    $0x10,%esp
  200139:	83 ec 0c             	sub    $0xc,%esp
  20013c:	68 f8 05 20 00       	push   $0x2005f8
  200141:	e8 c1 02 00 00       	call   200407 <printf>
  200146:	83 c4 10             	add    $0x10,%esp
  200149:	83 ec 0c             	sub    $0xc,%esp
  20014c:	8d 85 e8 f7 ff ff    	lea    -0x818(%ebp),%eax
  200152:	50                   	push   %eax
  200153:	e8 ec 00 00 00       	call   200244 <sem_post>
  200158:	83 c4 10             	add    $0x10,%esp
  20015b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  20015f:	75 b5                	jne    200116 <uEntry+0x116>
  200161:	83 ec 0c             	sub    $0xc,%esp
  200164:	68 1c 06 20 00       	push   $0x20061c
  200169:	e8 99 02 00 00       	call   200407 <printf>
  20016e:	83 c4 10             	add    $0x10,%esp
  200171:	83 ec 0c             	sub    $0xc,%esp
  200174:	8d 85 e8 f7 ff ff    	lea    -0x818(%ebp),%eax
  20017a:	50                   	push   %eax
  20017b:	e8 f0 00 00 00       	call   200270 <sem_destroy>
  200180:	83 c4 10             	add    $0x10,%esp
  200183:	e8 81 00 00 00       	call   200209 <exit>
  200188:	b8 00 00 00 00       	mov    $0x0,%eax
  20018d:	c9                   	leave  
  20018e:	c3                   	ret    

0020018f <syscall>:
  20018f:	55                   	push   %ebp
  200190:	89 e5                	mov    %esp,%ebp
  200192:	53                   	push   %ebx
  200193:	83 ec 10             	sub    $0x10,%esp
  200196:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  20019d:	8b 45 08             	mov    0x8(%ebp),%eax
  2001a0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  2001a3:	8b 4d 10             	mov    0x10(%ebp),%ecx
  2001a6:	8b 55 14             	mov    0x14(%ebp),%edx
  2001a9:	cd 80                	int    $0x80
  2001ab:	89 45 f8             	mov    %eax,-0x8(%ebp)
  2001ae:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2001b1:	83 c4 10             	add    $0x10,%esp
  2001b4:	5b                   	pop    %ebx
  2001b5:	5d                   	pop    %ebp
  2001b6:	c3                   	ret    

002001b7 <fork>:
  2001b7:	55                   	push   %ebp
  2001b8:	89 e5                	mov    %esp,%ebp
  2001ba:	83 ec 10             	sub    $0x10,%esp
  2001bd:	6a 01                	push   $0x1
  2001bf:	6a 01                	push   $0x1
  2001c1:	6a 01                	push   $0x1
  2001c3:	6a 02                	push   $0x2
  2001c5:	e8 c5 ff ff ff       	call   20018f <syscall>
  2001ca:	83 c4 10             	add    $0x10,%esp
  2001cd:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2001d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2001d3:	c9                   	leave  
  2001d4:	c3                   	ret    

002001d5 <sleep>:
  2001d5:	55                   	push   %ebp
  2001d6:	89 e5                	mov    %esp,%ebp
  2001d8:	8b 45 08             	mov    0x8(%ebp),%eax
  2001db:	6a 01                	push   $0x1
  2001dd:	6a 01                	push   $0x1
  2001df:	50                   	push   %eax
  2001e0:	68 e6 00 00 00       	push   $0xe6
  2001e5:	e8 a5 ff ff ff       	call   20018f <syscall>
  2001ea:	83 c4 10             	add    $0x10,%esp
  2001ed:	b8 00 00 00 00       	mov    $0x0,%eax
  2001f2:	c9                   	leave  
  2001f3:	c3                   	ret    

002001f4 <getpid>:
  2001f4:	55                   	push   %ebp
  2001f5:	89 e5                	mov    %esp,%ebp
  2001f7:	6a 01                	push   $0x1
  2001f9:	6a 01                	push   $0x1
  2001fb:	6a 01                	push   $0x1
  2001fd:	6a 07                	push   $0x7
  2001ff:	e8 8b ff ff ff       	call   20018f <syscall>
  200204:	83 c4 10             	add    $0x10,%esp
  200207:	c9                   	leave  
  200208:	c3                   	ret    

00200209 <exit>:
  200209:	55                   	push   %ebp
  20020a:	89 e5                	mov    %esp,%ebp
  20020c:	6a 00                	push   $0x0
  20020e:	6a 00                	push   $0x0
  200210:	6a 00                	push   $0x0
  200212:	6a 01                	push   $0x1
  200214:	e8 76 ff ff ff       	call   20018f <syscall>
  200219:	83 c4 10             	add    $0x10,%esp
  20021c:	b8 00 00 00 00       	mov    $0x0,%eax
  200221:	c9                   	leave  
  200222:	c3                   	ret    

00200223 <sem_init>:
  200223:	55                   	push   %ebp
  200224:	89 e5                	mov    %esp,%ebp
  200226:	83 ec 10             	sub    $0x10,%esp
  200229:	8b 45 08             	mov    0x8(%ebp),%eax
  20022c:	6a 01                	push   $0x1
  20022e:	ff 75 0c             	pushl  0xc(%ebp)
  200231:	50                   	push   %eax
  200232:	6a 15                	push   $0x15
  200234:	e8 56 ff ff ff       	call   20018f <syscall>
  200239:	83 c4 10             	add    $0x10,%esp
  20023c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20023f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200242:	c9                   	leave  
  200243:	c3                   	ret    

00200244 <sem_post>:
  200244:	55                   	push   %ebp
  200245:	89 e5                	mov    %esp,%ebp
  200247:	8b 45 08             	mov    0x8(%ebp),%eax
  20024a:	6a 01                	push   $0x1
  20024c:	6a 01                	push   $0x1
  20024e:	50                   	push   %eax
  20024f:	6a 17                	push   $0x17
  200251:	e8 39 ff ff ff       	call   20018f <syscall>
  200256:	83 c4 10             	add    $0x10,%esp
  200259:	c9                   	leave  
  20025a:	c3                   	ret    

0020025b <sem_wait>:
  20025b:	55                   	push   %ebp
  20025c:	89 e5                	mov    %esp,%ebp
  20025e:	6a 01                	push   $0x1
  200260:	6a 01                	push   $0x1
  200262:	6a 01                	push   $0x1
  200264:	6a 16                	push   $0x16
  200266:	e8 24 ff ff ff       	call   20018f <syscall>
  20026b:	83 c4 10             	add    $0x10,%esp
  20026e:	c9                   	leave  
  20026f:	c3                   	ret    

00200270 <sem_destroy>:
  200270:	55                   	push   %ebp
  200271:	89 e5                	mov    %esp,%ebp
  200273:	8b 45 08             	mov    0x8(%ebp),%eax
  200276:	6a 01                	push   $0x1
  200278:	6a 01                	push   $0x1
  20027a:	50                   	push   %eax
  20027b:	6a 18                	push   $0x18
  20027d:	e8 0d ff ff ff       	call   20018f <syscall>
  200282:	83 c4 10             	add    $0x10,%esp
  200285:	c9                   	leave  
  200286:	c3                   	ret    

00200287 <printd>:
  200287:	55                   	push   %ebp
  200288:	89 e5                	mov    %esp,%ebp
  20028a:	83 ec 78             	sub    $0x78,%esp
  20028d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200294:	8d 45 89             	lea    -0x77(%ebp),%eax
  200297:	83 c0 64             	add    $0x64,%eax
  20029a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20029d:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
  2002a1:	c6 45 ee 00          	movb   $0x0,-0x12(%ebp)
  2002a5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  2002a9:	79 17                	jns    2002c2 <printd+0x3b>
  2002ab:	81 7d 08 00 00 00 80 	cmpl   $0x80000000,0x8(%ebp)
  2002b2:	75 07                	jne    2002bb <printd+0x34>
  2002b4:	ff 45 08             	incl   0x8(%ebp)
  2002b7:	c6 45 ee 01          	movb   $0x1,-0x12(%ebp)
  2002bb:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
  2002bf:	f7 5d 08             	negl   0x8(%ebp)
  2002c2:	ff 4d f0             	decl   -0x10(%ebp)
  2002c5:	8b 45 08             	mov    0x8(%ebp),%eax
  2002c8:	b9 0a 00 00 00       	mov    $0xa,%ecx
  2002cd:	99                   	cltd   
  2002ce:	f7 f9                	idiv   %ecx
  2002d0:	89 d0                	mov    %edx,%eax
  2002d2:	83 c0 30             	add    $0x30,%eax
  2002d5:	88 c2                	mov    %al,%dl
  2002d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2002da:	88 10                	mov    %dl,(%eax)
  2002dc:	ff 45 f4             	incl   -0xc(%ebp)
  2002df:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2002e2:	b8 67 66 66 66       	mov    $0x66666667,%eax
  2002e7:	f7 e9                	imul   %ecx
  2002e9:	c1 fa 02             	sar    $0x2,%edx
  2002ec:	89 c8                	mov    %ecx,%eax
  2002ee:	c1 f8 1f             	sar    $0x1f,%eax
  2002f1:	29 c2                	sub    %eax,%edx
  2002f3:	89 d0                	mov    %edx,%eax
  2002f5:	89 45 08             	mov    %eax,0x8(%ebp)
  2002f8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  2002fc:	75 c4                	jne    2002c2 <printd+0x3b>
  2002fe:	80 7d ef 01          	cmpb   $0x1,-0x11(%ebp)
  200302:	75 0c                	jne    200310 <printd+0x89>
  200304:	ff 4d f0             	decl   -0x10(%ebp)
  200307:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20030a:	c6 00 2d             	movb   $0x2d,(%eax)
  20030d:	ff 45 f4             	incl   -0xc(%ebp)
  200310:	80 7d ee 01          	cmpb   $0x1,-0x12(%ebp)
  200314:	75 07                	jne    20031d <printd+0x96>
  200316:	8a 45 a6             	mov    -0x5a(%ebp),%al
  200319:	40                   	inc    %eax
  20031a:	88 45 a6             	mov    %al,-0x5a(%ebp)
  20031d:	c6 45 ed 00          	movb   $0x0,-0x13(%ebp)
  200321:	83 ec 0c             	sub    $0xc,%esp
  200324:	ff 75 f0             	pushl  -0x10(%ebp)
  200327:	e8 a4 00 00 00       	call   2003d0 <prints>
  20032c:	83 c4 10             	add    $0x10,%esp
  20032f:	90                   	nop
  200330:	c9                   	leave  
  200331:	c3                   	ret    

00200332 <printx>:
  200332:	55                   	push   %ebp
  200333:	89 e5                	mov    %esp,%ebp
  200335:	83 ec 38             	sub    $0x38,%esp
  200338:	8d 45 d1             	lea    -0x2f(%ebp),%eax
  20033b:	83 c0 1e             	add    $0x1e,%eax
  20033e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  200341:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200348:	8b 45 08             	mov    0x8(%ebp),%eax
  20034b:	25 0f 00 00 80       	and    $0x8000000f,%eax
  200350:	85 c0                	test   %eax,%eax
  200352:	79 05                	jns    200359 <printx+0x27>
  200354:	48                   	dec    %eax
  200355:	83 c8 f0             	or     $0xfffffff0,%eax
  200358:	40                   	inc    %eax
  200359:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20035c:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
  200360:	7e 12                	jle    200374 <printx+0x42>
  200362:	ff 4d f4             	decl   -0xc(%ebp)
  200365:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200368:	83 c0 57             	add    $0x57,%eax
  20036b:	88 c2                	mov    %al,%dl
  20036d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200370:	88 10                	mov    %dl,(%eax)
  200372:	eb 10                	jmp    200384 <printx+0x52>
  200374:	ff 4d f4             	decl   -0xc(%ebp)
  200377:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20037a:	83 c0 30             	add    $0x30,%eax
  20037d:	88 c2                	mov    %al,%dl
  20037f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200382:	88 10                	mov    %dl,(%eax)
  200384:	8b 45 08             	mov    0x8(%ebp),%eax
  200387:	85 c0                	test   %eax,%eax
  200389:	79 03                	jns    20038e <printx+0x5c>
  20038b:	83 c0 0f             	add    $0xf,%eax
  20038e:	c1 f8 04             	sar    $0x4,%eax
  200391:	89 45 08             	mov    %eax,0x8(%ebp)
  200394:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  200398:	75 ae                	jne    200348 <printx+0x16>
  20039a:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
  20039e:	83 ec 0c             	sub    $0xc,%esp
  2003a1:	ff 75 f4             	pushl  -0xc(%ebp)
  2003a4:	e8 27 00 00 00       	call   2003d0 <prints>
  2003a9:	83 c4 10             	add    $0x10,%esp
  2003ac:	90                   	nop
  2003ad:	c9                   	leave  
  2003ae:	c3                   	ret    

002003af <printc>:
  2003af:	55                   	push   %ebp
  2003b0:	89 e5                	mov    %esp,%ebp
  2003b2:	83 ec 04             	sub    $0x4,%esp
  2003b5:	8b 45 08             	mov    0x8(%ebp),%eax
  2003b8:	88 45 fc             	mov    %al,-0x4(%ebp)
  2003bb:	8d 45 fc             	lea    -0x4(%ebp),%eax
  2003be:	6a 01                	push   $0x1
  2003c0:	50                   	push   %eax
  2003c1:	6a 01                	push   $0x1
  2003c3:	6a 04                	push   $0x4
  2003c5:	e8 c5 fd ff ff       	call   20018f <syscall>
  2003ca:	83 c4 10             	add    $0x10,%esp
  2003cd:	90                   	nop
  2003ce:	c9                   	leave  
  2003cf:	c3                   	ret    

002003d0 <prints>:
  2003d0:	55                   	push   %ebp
  2003d1:	89 e5                	mov    %esp,%ebp
  2003d3:	83 ec 10             	sub    $0x10,%esp
  2003d6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2003dd:	eb 03                	jmp    2003e2 <prints+0x12>
  2003df:	ff 45 fc             	incl   -0x4(%ebp)
  2003e2:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2003e5:	8b 45 08             	mov    0x8(%ebp),%eax
  2003e8:	01 d0                	add    %edx,%eax
  2003ea:	8a 00                	mov    (%eax),%al
  2003ec:	84 c0                	test   %al,%al
  2003ee:	75 ef                	jne    2003df <prints+0xf>
  2003f0:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2003f3:	8b 45 08             	mov    0x8(%ebp),%eax
  2003f6:	52                   	push   %edx
  2003f7:	50                   	push   %eax
  2003f8:	6a 01                	push   $0x1
  2003fa:	6a 04                	push   $0x4
  2003fc:	e8 8e fd ff ff       	call   20018f <syscall>
  200401:	83 c4 10             	add    $0x10,%esp
  200404:	90                   	nop
  200405:	c9                   	leave  
  200406:	c3                   	ret    

00200407 <printf>:
  200407:	55                   	push   %ebp
  200408:	89 e5                	mov    %esp,%ebp
  20040a:	83 ec 18             	sub    $0x18,%esp
  20040d:	8d 45 0c             	lea    0xc(%ebp),%eax
  200410:	89 45 f4             	mov    %eax,-0xc(%ebp)
  200413:	8b 45 08             	mov    0x8(%ebp),%eax
  200416:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200419:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  200420:	e9 be 00 00 00       	jmp    2004e3 <printf+0xdc>
  200425:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200428:	8a 00                	mov    (%eax),%al
  20042a:	3c 25                	cmp    $0x25,%al
  20042c:	0f 85 9a 00 00 00    	jne    2004cc <printf+0xc5>
  200432:	ff 45 f0             	incl   -0x10(%ebp)
  200435:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200438:	8a 00                	mov    (%eax),%al
  20043a:	0f be c0             	movsbl %al,%eax
  20043d:	83 f8 64             	cmp    $0x64,%eax
  200440:	74 1e                	je     200460 <printf+0x59>
  200442:	83 f8 64             	cmp    $0x64,%eax
  200445:	7f 0a                	jg     200451 <printf+0x4a>
  200447:	83 f8 63             	cmp    $0x63,%eax
  20044a:	74 64                	je     2004b0 <printf+0xa9>
  20044c:	e9 8f 00 00 00       	jmp    2004e0 <printf+0xd9>
  200451:	83 f8 73             	cmp    $0x73,%eax
  200454:	74 41                	je     200497 <printf+0x90>
  200456:	83 f8 78             	cmp    $0x78,%eax
  200459:	74 23                	je     20047e <printf+0x77>
  20045b:	e9 80 00 00 00       	jmp    2004e0 <printf+0xd9>
  200460:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200463:	8d 50 04             	lea    0x4(%eax),%edx
  200466:	89 55 f4             	mov    %edx,-0xc(%ebp)
  200469:	8b 00                	mov    (%eax),%eax
  20046b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  20046e:	83 ec 0c             	sub    $0xc,%esp
  200471:	ff 75 ec             	pushl  -0x14(%ebp)
  200474:	e8 0e fe ff ff       	call   200287 <printd>
  200479:	83 c4 10             	add    $0x10,%esp
  20047c:	eb 62                	jmp    2004e0 <printf+0xd9>
  20047e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200481:	8d 50 04             	lea    0x4(%eax),%edx
  200484:	89 55 f4             	mov    %edx,-0xc(%ebp)
  200487:	8b 00                	mov    (%eax),%eax
  200489:	83 ec 0c             	sub    $0xc,%esp
  20048c:	50                   	push   %eax
  20048d:	e8 a0 fe ff ff       	call   200332 <printx>
  200492:	83 c4 10             	add    $0x10,%esp
  200495:	eb 49                	jmp    2004e0 <printf+0xd9>
  200497:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20049a:	8d 50 04             	lea    0x4(%eax),%edx
  20049d:	89 55 f4             	mov    %edx,-0xc(%ebp)
  2004a0:	8b 00                	mov    (%eax),%eax
  2004a2:	83 ec 0c             	sub    $0xc,%esp
  2004a5:	50                   	push   %eax
  2004a6:	e8 25 ff ff ff       	call   2003d0 <prints>
  2004ab:	83 c4 10             	add    $0x10,%esp
  2004ae:	eb 30                	jmp    2004e0 <printf+0xd9>
  2004b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2004b3:	8d 50 04             	lea    0x4(%eax),%edx
  2004b6:	89 55 f4             	mov    %edx,-0xc(%ebp)
  2004b9:	8b 00                	mov    (%eax),%eax
  2004bb:	0f be c0             	movsbl %al,%eax
  2004be:	83 ec 0c             	sub    $0xc,%esp
  2004c1:	50                   	push   %eax
  2004c2:	e8 e8 fe ff ff       	call   2003af <printc>
  2004c7:	83 c4 10             	add    $0x10,%esp
  2004ca:	eb 14                	jmp    2004e0 <printf+0xd9>
  2004cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2004cf:	8a 00                	mov    (%eax),%al
  2004d1:	0f be c0             	movsbl %al,%eax
  2004d4:	83 ec 0c             	sub    $0xc,%esp
  2004d7:	50                   	push   %eax
  2004d8:	e8 d2 fe ff ff       	call   2003af <printc>
  2004dd:	83 c4 10             	add    $0x10,%esp
  2004e0:	ff 45 f0             	incl   -0x10(%ebp)
  2004e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2004e6:	8a 00                	mov    (%eax),%al
  2004e8:	84 c0                	test   %al,%al
  2004ea:	0f 85 35 ff ff ff    	jne    200425 <printf+0x1e>
  2004f0:	90                   	nop
  2004f1:	c9                   	leave  
  2004f2:	c3                   	ret    

002004f3 <gets>:
  2004f3:	55                   	push   %ebp
  2004f4:	89 e5                	mov    %esp,%ebp
  2004f6:	8b 45 08             	mov    0x8(%ebp),%eax
  2004f9:	6a 01                	push   $0x1
  2004fb:	50                   	push   %eax
  2004fc:	6a 00                	push   $0x0
  2004fe:	6a 03                	push   $0x3
  200500:	e8 8a fc ff ff       	call   20018f <syscall>
  200505:	83 c4 10             	add    $0x10,%esp
  200508:	c9                   	leave  
  200509:	c3                   	ret    
