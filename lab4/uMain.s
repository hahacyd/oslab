
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	81 ec 28 08 00 00    	sub    $0x828,%esp
  200009:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  200010:	eb 31                	jmp    200043 <uEntry+0x43>
  200012:	83 ec 08             	sub    $0x8,%esp
  200015:	8d 85 e8 f7 ff ff    	lea    -0x818(%ebp),%eax
  20001b:	50                   	push   %eax
  20001c:	68 54 08 20 00       	push   $0x200854
  200021:	e8 cd 06 00 00       	call   2006f3 <scanf>
  200026:	83 c4 10             	add    $0x10,%esp
  200029:	89 45 f4             	mov    %eax,-0xc(%ebp)
  20002c:	83 ec 08             	sub    $0x8,%esp
  20002f:	8d 85 e8 f7 ff ff    	lea    -0x818(%ebp),%eax
  200035:	50                   	push   %eax
  200036:	68 57 08 20 00       	push   $0x200857
  20003b:	e8 14 04 00 00       	call   200454 <printf>
  200040:	83 c4 10             	add    $0x10,%esp
  200043:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  200047:	75 c9                	jne    200012 <uEntry+0x12>
  200049:	83 ec 0c             	sub    $0xc,%esp
  20004c:	68 5b 08 20 00       	push   $0x20085b
  200051:	e8 fe 03 00 00       	call   200454 <printf>
  200056:	83 c4 10             	add    $0x10,%esp
  200059:	e8 d2 01 00 00       	call   200230 <exit>
  20005e:	c7 45 f0 04 00 00 00 	movl   $0x4,-0x10(%ebp)
  200065:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  20006c:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
  200073:	c7 85 e4 f7 ff ff 58 	movl   $0x58,-0x81c(%ebp)
  20007a:	00 00 00 
  20007d:	83 ec 0c             	sub    $0xc,%esp
  200080:	68 64 08 20 00       	push   $0x200864
  200085:	e8 ca 03 00 00       	call   200454 <printf>
  20008a:	83 c4 10             	add    $0x10,%esp
  20008d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  200090:	83 ec 08             	sub    $0x8,%esp
  200093:	50                   	push   %eax
  200094:	8d 85 e4 f7 ff ff    	lea    -0x81c(%ebp),%eax
  20009a:	50                   	push   %eax
  20009b:	e8 aa 01 00 00       	call   20024a <sem_init>
  2000a0:	83 c4 10             	add    $0x10,%esp
  2000a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2000a6:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
  2000aa:	75 15                	jne    2000c1 <uEntry+0xc1>
  2000ac:	83 ec 0c             	sub    $0xc,%esp
  2000af:	68 90 08 20 00       	push   $0x200890
  2000b4:	e8 9b 03 00 00       	call   200454 <printf>
  2000b9:	83 c4 10             	add    $0x10,%esp
  2000bc:	e8 6f 01 00 00       	call   200230 <exit>
  2000c1:	e8 18 01 00 00       	call   2001de <fork>
  2000c6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2000c9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  2000cd:	75 66                	jne    200135 <uEntry+0x135>
  2000cf:	eb 35                	jmp    200106 <uEntry+0x106>
  2000d1:	ff 4d f0             	decl   -0x10(%ebp)
  2000d4:	83 ec 0c             	sub    $0xc,%esp
  2000d7:	68 c0 08 20 00       	push   $0x2008c0
  2000dc:	e8 73 03 00 00       	call   200454 <printf>
  2000e1:	83 c4 10             	add    $0x10,%esp
  2000e4:	83 ec 0c             	sub    $0xc,%esp
  2000e7:	8d 85 e4 f7 ff ff    	lea    -0x81c(%ebp),%eax
  2000ed:	50                   	push   %eax
  2000ee:	e8 8f 01 00 00       	call   200282 <sem_wait>
  2000f3:	83 c4 10             	add    $0x10,%esp
  2000f6:	83 ec 0c             	sub    $0xc,%esp
  2000f9:	68 e4 08 20 00       	push   $0x2008e4
  2000fe:	e8 51 03 00 00       	call   200454 <printf>
  200103:	83 c4 10             	add    $0x10,%esp
  200106:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  20010a:	75 c5                	jne    2000d1 <uEntry+0xd1>
  20010c:	83 ec 0c             	sub    $0xc,%esp
  20010f:	68 08 09 20 00       	push   $0x200908
  200114:	e8 3b 03 00 00       	call   200454 <printf>
  200119:	83 c4 10             	add    $0x10,%esp
  20011c:	83 ec 0c             	sub    $0xc,%esp
  20011f:	8d 85 e4 f7 ff ff    	lea    -0x81c(%ebp),%eax
  200125:	50                   	push   %eax
  200126:	e8 6c 01 00 00       	call   200297 <sem_destroy>
  20012b:	83 c4 10             	add    $0x10,%esp
  20012e:	e8 fd 00 00 00       	call   200230 <exit>
  200133:	eb 7a                	jmp    2001af <uEntry+0x1af>
  200135:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
  200139:	74 74                	je     2001af <uEntry+0x1af>
  20013b:	eb 45                	jmp    200182 <uEntry+0x182>
  20013d:	ff 4d f0             	decl   -0x10(%ebp)
  200140:	83 ec 0c             	sub    $0xc,%esp
  200143:	68 2e 09 20 00       	push   $0x20092e
  200148:	e8 07 03 00 00       	call   200454 <printf>
  20014d:	83 c4 10             	add    $0x10,%esp
  200150:	83 ec 0c             	sub    $0xc,%esp
  200153:	68 80 00 00 00       	push   $0x80
  200158:	e8 9f 00 00 00       	call   2001fc <sleep>
  20015d:	83 c4 10             	add    $0x10,%esp
  200160:	83 ec 0c             	sub    $0xc,%esp
  200163:	68 4c 09 20 00       	push   $0x20094c
  200168:	e8 e7 02 00 00       	call   200454 <printf>
  20016d:	83 c4 10             	add    $0x10,%esp
  200170:	83 ec 0c             	sub    $0xc,%esp
  200173:	8d 85 e4 f7 ff ff    	lea    -0x81c(%ebp),%eax
  200179:	50                   	push   %eax
  20017a:	e8 ec 00 00 00       	call   20026b <sem_post>
  20017f:	83 c4 10             	add    $0x10,%esp
  200182:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  200186:	75 b5                	jne    20013d <uEntry+0x13d>
  200188:	83 ec 0c             	sub    $0xc,%esp
  20018b:	68 70 09 20 00       	push   $0x200970
  200190:	e8 bf 02 00 00       	call   200454 <printf>
  200195:	83 c4 10             	add    $0x10,%esp
  200198:	83 ec 0c             	sub    $0xc,%esp
  20019b:	8d 85 e4 f7 ff ff    	lea    -0x81c(%ebp),%eax
  2001a1:	50                   	push   %eax
  2001a2:	e8 f0 00 00 00       	call   200297 <sem_destroy>
  2001a7:	83 c4 10             	add    $0x10,%esp
  2001aa:	e8 81 00 00 00       	call   200230 <exit>
  2001af:	b8 00 00 00 00       	mov    $0x0,%eax
  2001b4:	c9                   	leave  
  2001b5:	c3                   	ret    

002001b6 <syscall>:
  2001b6:	55                   	push   %ebp
  2001b7:	89 e5                	mov    %esp,%ebp
  2001b9:	53                   	push   %ebx
  2001ba:	83 ec 10             	sub    $0x10,%esp
  2001bd:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2001c4:	8b 45 08             	mov    0x8(%ebp),%eax
  2001c7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  2001ca:	8b 4d 10             	mov    0x10(%ebp),%ecx
  2001cd:	8b 55 14             	mov    0x14(%ebp),%edx
  2001d0:	cd 80                	int    $0x80
  2001d2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  2001d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2001d8:	83 c4 10             	add    $0x10,%esp
  2001db:	5b                   	pop    %ebx
  2001dc:	5d                   	pop    %ebp
  2001dd:	c3                   	ret    

002001de <fork>:
  2001de:	55                   	push   %ebp
  2001df:	89 e5                	mov    %esp,%ebp
  2001e1:	83 ec 10             	sub    $0x10,%esp
  2001e4:	6a 01                	push   $0x1
  2001e6:	6a 01                	push   $0x1
  2001e8:	6a 01                	push   $0x1
  2001ea:	6a 02                	push   $0x2
  2001ec:	e8 c5 ff ff ff       	call   2001b6 <syscall>
  2001f1:	83 c4 10             	add    $0x10,%esp
  2001f4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2001f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2001fa:	c9                   	leave  
  2001fb:	c3                   	ret    

002001fc <sleep>:
  2001fc:	55                   	push   %ebp
  2001fd:	89 e5                	mov    %esp,%ebp
  2001ff:	8b 45 08             	mov    0x8(%ebp),%eax
  200202:	6a 01                	push   $0x1
  200204:	6a 01                	push   $0x1
  200206:	50                   	push   %eax
  200207:	68 e6 00 00 00       	push   $0xe6
  20020c:	e8 a5 ff ff ff       	call   2001b6 <syscall>
  200211:	83 c4 10             	add    $0x10,%esp
  200214:	b8 00 00 00 00       	mov    $0x0,%eax
  200219:	c9                   	leave  
  20021a:	c3                   	ret    

0020021b <getpid>:
  20021b:	55                   	push   %ebp
  20021c:	89 e5                	mov    %esp,%ebp
  20021e:	6a 01                	push   $0x1
  200220:	6a 01                	push   $0x1
  200222:	6a 01                	push   $0x1
  200224:	6a 07                	push   $0x7
  200226:	e8 8b ff ff ff       	call   2001b6 <syscall>
  20022b:	83 c4 10             	add    $0x10,%esp
  20022e:	c9                   	leave  
  20022f:	c3                   	ret    

00200230 <exit>:
  200230:	55                   	push   %ebp
  200231:	89 e5                	mov    %esp,%ebp
  200233:	6a 00                	push   $0x0
  200235:	6a 00                	push   $0x0
  200237:	6a 00                	push   $0x0
  200239:	6a 01                	push   $0x1
  20023b:	e8 76 ff ff ff       	call   2001b6 <syscall>
  200240:	83 c4 10             	add    $0x10,%esp
  200243:	b8 00 00 00 00       	mov    $0x0,%eax
  200248:	c9                   	leave  
  200249:	c3                   	ret    

0020024a <sem_init>:
  20024a:	55                   	push   %ebp
  20024b:	89 e5                	mov    %esp,%ebp
  20024d:	83 ec 10             	sub    $0x10,%esp
  200250:	8b 45 08             	mov    0x8(%ebp),%eax
  200253:	6a 01                	push   $0x1
  200255:	ff 75 0c             	pushl  0xc(%ebp)
  200258:	50                   	push   %eax
  200259:	6a 15                	push   $0x15
  20025b:	e8 56 ff ff ff       	call   2001b6 <syscall>
  200260:	83 c4 10             	add    $0x10,%esp
  200263:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200266:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200269:	c9                   	leave  
  20026a:	c3                   	ret    

0020026b <sem_post>:
  20026b:	55                   	push   %ebp
  20026c:	89 e5                	mov    %esp,%ebp
  20026e:	8b 45 08             	mov    0x8(%ebp),%eax
  200271:	6a 01                	push   $0x1
  200273:	6a 01                	push   $0x1
  200275:	50                   	push   %eax
  200276:	6a 17                	push   $0x17
  200278:	e8 39 ff ff ff       	call   2001b6 <syscall>
  20027d:	83 c4 10             	add    $0x10,%esp
  200280:	c9                   	leave  
  200281:	c3                   	ret    

00200282 <sem_wait>:
  200282:	55                   	push   %ebp
  200283:	89 e5                	mov    %esp,%ebp
  200285:	6a 01                	push   $0x1
  200287:	6a 01                	push   $0x1
  200289:	6a 01                	push   $0x1
  20028b:	6a 16                	push   $0x16
  20028d:	e8 24 ff ff ff       	call   2001b6 <syscall>
  200292:	83 c4 10             	add    $0x10,%esp
  200295:	c9                   	leave  
  200296:	c3                   	ret    

00200297 <sem_destroy>:
  200297:	55                   	push   %ebp
  200298:	89 e5                	mov    %esp,%ebp
  20029a:	8b 45 08             	mov    0x8(%ebp),%eax
  20029d:	6a 01                	push   $0x1
  20029f:	6a 01                	push   $0x1
  2002a1:	50                   	push   %eax
  2002a2:	6a 18                	push   $0x18
  2002a4:	e8 0d ff ff ff       	call   2001b6 <syscall>
  2002a9:	83 c4 10             	add    $0x10,%esp
  2002ac:	c9                   	leave  
  2002ad:	c3                   	ret    

002002ae <printd>:
  2002ae:	55                   	push   %ebp
  2002af:	89 e5                	mov    %esp,%ebp
  2002b1:	83 ec 78             	sub    $0x78,%esp
  2002b4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2002bb:	8d 45 89             	lea    -0x77(%ebp),%eax
  2002be:	83 c0 64             	add    $0x64,%eax
  2002c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  2002c4:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
  2002c8:	c6 45 ee 00          	movb   $0x0,-0x12(%ebp)
  2002cc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  2002d0:	79 17                	jns    2002e9 <printd+0x3b>
  2002d2:	81 7d 08 00 00 00 80 	cmpl   $0x80000000,0x8(%ebp)
  2002d9:	75 07                	jne    2002e2 <printd+0x34>
  2002db:	ff 45 08             	incl   0x8(%ebp)
  2002de:	c6 45 ee 01          	movb   $0x1,-0x12(%ebp)
  2002e2:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
  2002e6:	f7 5d 08             	negl   0x8(%ebp)
  2002e9:	ff 4d f0             	decl   -0x10(%ebp)
  2002ec:	8b 45 08             	mov    0x8(%ebp),%eax
  2002ef:	b9 0a 00 00 00       	mov    $0xa,%ecx
  2002f4:	99                   	cltd   
  2002f5:	f7 f9                	idiv   %ecx
  2002f7:	89 d0                	mov    %edx,%eax
  2002f9:	83 c0 30             	add    $0x30,%eax
  2002fc:	88 c2                	mov    %al,%dl
  2002fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200301:	88 10                	mov    %dl,(%eax)
  200303:	ff 45 f4             	incl   -0xc(%ebp)
  200306:	8b 4d 08             	mov    0x8(%ebp),%ecx
  200309:	b8 67 66 66 66       	mov    $0x66666667,%eax
  20030e:	f7 e9                	imul   %ecx
  200310:	c1 fa 02             	sar    $0x2,%edx
  200313:	89 c8                	mov    %ecx,%eax
  200315:	c1 f8 1f             	sar    $0x1f,%eax
  200318:	29 c2                	sub    %eax,%edx
  20031a:	89 d0                	mov    %edx,%eax
  20031c:	89 45 08             	mov    %eax,0x8(%ebp)
  20031f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  200323:	75 c4                	jne    2002e9 <printd+0x3b>
  200325:	80 7d ef 01          	cmpb   $0x1,-0x11(%ebp)
  200329:	75 0c                	jne    200337 <printd+0x89>
  20032b:	ff 4d f0             	decl   -0x10(%ebp)
  20032e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200331:	c6 00 2d             	movb   $0x2d,(%eax)
  200334:	ff 45 f4             	incl   -0xc(%ebp)
  200337:	80 7d ee 01          	cmpb   $0x1,-0x12(%ebp)
  20033b:	75 07                	jne    200344 <printd+0x96>
  20033d:	8a 45 a6             	mov    -0x5a(%ebp),%al
  200340:	40                   	inc    %eax
  200341:	88 45 a6             	mov    %al,-0x5a(%ebp)
  200344:	c6 45 ed 00          	movb   $0x0,-0x13(%ebp)
  200348:	83 ec 0c             	sub    $0xc,%esp
  20034b:	ff 75 f0             	pushl  -0x10(%ebp)
  20034e:	e8 ca 00 00 00       	call   20041d <prints>
  200353:	83 c4 10             	add    $0x10,%esp
  200356:	90                   	nop
  200357:	c9                   	leave  
  200358:	c3                   	ret    

00200359 <printx>:
  200359:	55                   	push   %ebp
  20035a:	89 e5                	mov    %esp,%ebp
  20035c:	83 ec 38             	sub    $0x38,%esp
  20035f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200366:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  20036a:	79 0a                	jns    200376 <printx+0x1d>
  20036c:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  200373:	f7 5d 08             	negl   0x8(%ebp)
  200376:	8d 45 cd             	lea    -0x33(%ebp),%eax
  200379:	83 c0 1e             	add    $0x1e,%eax
  20037c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20037f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  200386:	8b 45 08             	mov    0x8(%ebp),%eax
  200389:	25 0f 00 00 80       	and    $0x8000000f,%eax
  20038e:	85 c0                	test   %eax,%eax
  200390:	79 05                	jns    200397 <printx+0x3e>
  200392:	48                   	dec    %eax
  200393:	83 c8 f0             	or     $0xfffffff0,%eax
  200396:	40                   	inc    %eax
  200397:	89 45 ec             	mov    %eax,-0x14(%ebp)
  20039a:	83 7d ec 09          	cmpl   $0x9,-0x14(%ebp)
  20039e:	7e 12                	jle    2003b2 <printx+0x59>
  2003a0:	ff 4d f0             	decl   -0x10(%ebp)
  2003a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2003a6:	83 c0 57             	add    $0x57,%eax
  2003a9:	88 c2                	mov    %al,%dl
  2003ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2003ae:	88 10                	mov    %dl,(%eax)
  2003b0:	eb 10                	jmp    2003c2 <printx+0x69>
  2003b2:	ff 4d f0             	decl   -0x10(%ebp)
  2003b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2003b8:	83 c0 30             	add    $0x30,%eax
  2003bb:	88 c2                	mov    %al,%dl
  2003bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2003c0:	88 10                	mov    %dl,(%eax)
  2003c2:	8b 45 08             	mov    0x8(%ebp),%eax
  2003c5:	85 c0                	test   %eax,%eax
  2003c7:	79 03                	jns    2003cc <printx+0x73>
  2003c9:	83 c0 0f             	add    $0xf,%eax
  2003cc:	c1 f8 04             	sar    $0x4,%eax
  2003cf:	89 45 08             	mov    %eax,0x8(%ebp)
  2003d2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  2003d6:	75 ae                	jne    200386 <printx+0x2d>
  2003d8:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
  2003dc:	75 09                	jne    2003e7 <printx+0x8e>
  2003de:	ff 4d f0             	decl   -0x10(%ebp)
  2003e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2003e4:	c6 00 2d             	movb   $0x2d,(%eax)
  2003e7:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
  2003eb:	83 ec 0c             	sub    $0xc,%esp
  2003ee:	ff 75 f0             	pushl  -0x10(%ebp)
  2003f1:	e8 27 00 00 00       	call   20041d <prints>
  2003f6:	83 c4 10             	add    $0x10,%esp
  2003f9:	90                   	nop
  2003fa:	c9                   	leave  
  2003fb:	c3                   	ret    

002003fc <printc>:
  2003fc:	55                   	push   %ebp
  2003fd:	89 e5                	mov    %esp,%ebp
  2003ff:	83 ec 04             	sub    $0x4,%esp
  200402:	8b 45 08             	mov    0x8(%ebp),%eax
  200405:	88 45 fc             	mov    %al,-0x4(%ebp)
  200408:	8d 45 fc             	lea    -0x4(%ebp),%eax
  20040b:	6a 01                	push   $0x1
  20040d:	50                   	push   %eax
  20040e:	6a 01                	push   $0x1
  200410:	6a 04                	push   $0x4
  200412:	e8 9f fd ff ff       	call   2001b6 <syscall>
  200417:	83 c4 10             	add    $0x10,%esp
  20041a:	90                   	nop
  20041b:	c9                   	leave  
  20041c:	c3                   	ret    

0020041d <prints>:
  20041d:	55                   	push   %ebp
  20041e:	89 e5                	mov    %esp,%ebp
  200420:	83 ec 10             	sub    $0x10,%esp
  200423:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  20042a:	eb 03                	jmp    20042f <prints+0x12>
  20042c:	ff 45 fc             	incl   -0x4(%ebp)
  20042f:	8b 55 fc             	mov    -0x4(%ebp),%edx
  200432:	8b 45 08             	mov    0x8(%ebp),%eax
  200435:	01 d0                	add    %edx,%eax
  200437:	8a 00                	mov    (%eax),%al
  200439:	84 c0                	test   %al,%al
  20043b:	75 ef                	jne    20042c <prints+0xf>
  20043d:	8b 55 fc             	mov    -0x4(%ebp),%edx
  200440:	8b 45 08             	mov    0x8(%ebp),%eax
  200443:	52                   	push   %edx
  200444:	50                   	push   %eax
  200445:	6a 01                	push   $0x1
  200447:	6a 04                	push   $0x4
  200449:	e8 68 fd ff ff       	call   2001b6 <syscall>
  20044e:	83 c4 10             	add    $0x10,%esp
  200451:	90                   	nop
  200452:	c9                   	leave  
  200453:	c3                   	ret    

00200454 <printf>:
  200454:	55                   	push   %ebp
  200455:	89 e5                	mov    %esp,%ebp
  200457:	83 ec 18             	sub    $0x18,%esp
  20045a:	8d 45 0c             	lea    0xc(%ebp),%eax
  20045d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  200460:	8b 45 08             	mov    0x8(%ebp),%eax
  200463:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200466:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  20046d:	e9 be 00 00 00       	jmp    200530 <printf+0xdc>
  200472:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200475:	8a 00                	mov    (%eax),%al
  200477:	3c 25                	cmp    $0x25,%al
  200479:	0f 85 9a 00 00 00    	jne    200519 <printf+0xc5>
  20047f:	ff 45 f0             	incl   -0x10(%ebp)
  200482:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200485:	8a 00                	mov    (%eax),%al
  200487:	0f be c0             	movsbl %al,%eax
  20048a:	83 f8 64             	cmp    $0x64,%eax
  20048d:	74 1e                	je     2004ad <printf+0x59>
  20048f:	83 f8 64             	cmp    $0x64,%eax
  200492:	7f 0a                	jg     20049e <printf+0x4a>
  200494:	83 f8 63             	cmp    $0x63,%eax
  200497:	74 64                	je     2004fd <printf+0xa9>
  200499:	e9 8f 00 00 00       	jmp    20052d <printf+0xd9>
  20049e:	83 f8 73             	cmp    $0x73,%eax
  2004a1:	74 41                	je     2004e4 <printf+0x90>
  2004a3:	83 f8 78             	cmp    $0x78,%eax
  2004a6:	74 23                	je     2004cb <printf+0x77>
  2004a8:	e9 80 00 00 00       	jmp    20052d <printf+0xd9>
  2004ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2004b0:	8d 50 04             	lea    0x4(%eax),%edx
  2004b3:	89 55 f4             	mov    %edx,-0xc(%ebp)
  2004b6:	8b 00                	mov    (%eax),%eax
  2004b8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2004bb:	83 ec 0c             	sub    $0xc,%esp
  2004be:	ff 75 ec             	pushl  -0x14(%ebp)
  2004c1:	e8 e8 fd ff ff       	call   2002ae <printd>
  2004c6:	83 c4 10             	add    $0x10,%esp
  2004c9:	eb 62                	jmp    20052d <printf+0xd9>
  2004cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2004ce:	8d 50 04             	lea    0x4(%eax),%edx
  2004d1:	89 55 f4             	mov    %edx,-0xc(%ebp)
  2004d4:	8b 00                	mov    (%eax),%eax
  2004d6:	83 ec 0c             	sub    $0xc,%esp
  2004d9:	50                   	push   %eax
  2004da:	e8 7a fe ff ff       	call   200359 <printx>
  2004df:	83 c4 10             	add    $0x10,%esp
  2004e2:	eb 49                	jmp    20052d <printf+0xd9>
  2004e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2004e7:	8d 50 04             	lea    0x4(%eax),%edx
  2004ea:	89 55 f4             	mov    %edx,-0xc(%ebp)
  2004ed:	8b 00                	mov    (%eax),%eax
  2004ef:	83 ec 0c             	sub    $0xc,%esp
  2004f2:	50                   	push   %eax
  2004f3:	e8 25 ff ff ff       	call   20041d <prints>
  2004f8:	83 c4 10             	add    $0x10,%esp
  2004fb:	eb 30                	jmp    20052d <printf+0xd9>
  2004fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200500:	8d 50 04             	lea    0x4(%eax),%edx
  200503:	89 55 f4             	mov    %edx,-0xc(%ebp)
  200506:	8b 00                	mov    (%eax),%eax
  200508:	0f be c0             	movsbl %al,%eax
  20050b:	83 ec 0c             	sub    $0xc,%esp
  20050e:	50                   	push   %eax
  20050f:	e8 e8 fe ff ff       	call   2003fc <printc>
  200514:	83 c4 10             	add    $0x10,%esp
  200517:	eb 14                	jmp    20052d <printf+0xd9>
  200519:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20051c:	8a 00                	mov    (%eax),%al
  20051e:	0f be c0             	movsbl %al,%eax
  200521:	83 ec 0c             	sub    $0xc,%esp
  200524:	50                   	push   %eax
  200525:	e8 d2 fe ff ff       	call   2003fc <printc>
  20052a:	83 c4 10             	add    $0x10,%esp
  20052d:	ff 45 f0             	incl   -0x10(%ebp)
  200530:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200533:	8a 00                	mov    (%eax),%al
  200535:	84 c0                	test   %al,%al
  200537:	0f 85 35 ff ff ff    	jne    200472 <printf+0x1e>
  20053d:	90                   	nop
  20053e:	c9                   	leave  
  20053f:	c3                   	ret    

00200540 <gets>:
  200540:	55                   	push   %ebp
  200541:	89 e5                	mov    %esp,%ebp
  200543:	8b 45 08             	mov    0x8(%ebp),%eax
  200546:	68 00 08 00 00       	push   $0x800
  20054b:	50                   	push   %eax
  20054c:	6a 00                	push   $0x0
  20054e:	6a 03                	push   $0x3
  200550:	e8 61 fc ff ff       	call   2001b6 <syscall>
  200555:	83 c4 10             	add    $0x10,%esp
  200558:	c9                   	leave  
  200559:	c3                   	ret    

0020055a <getchar>:
  20055a:	55                   	push   %ebp
  20055b:	89 e5                	mov    %esp,%ebp
  20055d:	83 ec 10             	sub    $0x10,%esp
  200560:	8d 45 fb             	lea    -0x5(%ebp),%eax
  200563:	6a 01                	push   $0x1
  200565:	50                   	push   %eax
  200566:	6a 00                	push   $0x0
  200568:	6a 03                	push   $0x3
  20056a:	e8 47 fc ff ff       	call   2001b6 <syscall>
  20056f:	83 c4 10             	add    $0x10,%esp
  200572:	8a 45 fb             	mov    -0x5(%ebp),%al
  200575:	c9                   	leave  
  200576:	c3                   	ret    

00200577 <scanfd>:
  200577:	55                   	push   %ebp
  200578:	89 e5                	mov    %esp,%ebp
  20057a:	83 ec 10             	sub    $0x10,%esp
  20057d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200584:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  20058b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200592:	8b 45 08             	mov    0x8(%ebp),%eax
  200595:	8a 00                	mov    (%eax),%al
  200597:	3c 2d                	cmp    $0x2d,%al
  200599:	75 32                	jne    2005cd <scanfd+0x56>
  20059b:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%ebp)
  2005a2:	ff 45 08             	incl   0x8(%ebp)
  2005a5:	ff 45 f4             	incl   -0xc(%ebp)
  2005a8:	eb 23                	jmp    2005cd <scanfd+0x56>
  2005aa:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2005ad:	89 d0                	mov    %edx,%eax
  2005af:	c1 e0 02             	shl    $0x2,%eax
  2005b2:	01 d0                	add    %edx,%eax
  2005b4:	01 c0                	add    %eax,%eax
  2005b6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2005b9:	8b 45 08             	mov    0x8(%ebp),%eax
  2005bc:	8a 00                	mov    (%eax),%al
  2005be:	0f be c0             	movsbl %al,%eax
  2005c1:	83 e8 30             	sub    $0x30,%eax
  2005c4:	01 45 fc             	add    %eax,-0x4(%ebp)
  2005c7:	ff 45 08             	incl   0x8(%ebp)
  2005ca:	ff 45 f4             	incl   -0xc(%ebp)
  2005cd:	8b 45 08             	mov    0x8(%ebp),%eax
  2005d0:	8a 00                	mov    (%eax),%al
  2005d2:	3c 20                	cmp    $0x20,%al
  2005d4:	74 09                	je     2005df <scanfd+0x68>
  2005d6:	8b 45 08             	mov    0x8(%ebp),%eax
  2005d9:	8a 00                	mov    (%eax),%al
  2005db:	84 c0                	test   %al,%al
  2005dd:	75 cb                	jne    2005aa <scanfd+0x33>
  2005df:	83 7d f8 01          	cmpl   $0x1,-0x8(%ebp)
  2005e3:	75 07                	jne    2005ec <scanfd+0x75>
  2005e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2005e8:	f7 d8                	neg    %eax
  2005ea:	eb 03                	jmp    2005ef <scanfd+0x78>
  2005ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2005ef:	8b 55 0c             	mov    0xc(%ebp),%edx
  2005f2:	89 02                	mov    %eax,(%edx)
  2005f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2005f7:	c9                   	leave  
  2005f8:	c3                   	ret    

002005f9 <scanfx>:
  2005f9:	55                   	push   %ebp
  2005fa:	89 e5                	mov    %esp,%ebp
  2005fc:	83 ec 10             	sub    $0x10,%esp
  2005ff:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200606:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  20060d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200614:	8b 45 08             	mov    0x8(%ebp),%eax
  200617:	8a 00                	mov    (%eax),%al
  200619:	3c 2d                	cmp    $0x2d,%al
  20061b:	75 5b                	jne    200678 <scanfx+0x7f>
  20061d:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%ebp)
  200624:	ff 45 08             	incl   0x8(%ebp)
  200627:	ff 45 f4             	incl   -0xc(%ebp)
  20062a:	eb 4c                	jmp    200678 <scanfx+0x7f>
  20062c:	c1 65 fc 04          	shll   $0x4,-0x4(%ebp)
  200630:	8b 45 08             	mov    0x8(%ebp),%eax
  200633:	8a 00                	mov    (%eax),%al
  200635:	3c 66                	cmp    $0x66,%al
  200637:	7f 19                	jg     200652 <scanfx+0x59>
  200639:	8b 45 08             	mov    0x8(%ebp),%eax
  20063c:	8a 00                	mov    (%eax),%al
  20063e:	3c 60                	cmp    $0x60,%al
  200640:	7e 10                	jle    200652 <scanfx+0x59>
  200642:	8b 45 08             	mov    0x8(%ebp),%eax
  200645:	8a 00                	mov    (%eax),%al
  200647:	0f be c0             	movsbl %al,%eax
  20064a:	83 e8 57             	sub    $0x57,%eax
  20064d:	01 45 fc             	add    %eax,-0x4(%ebp)
  200650:	eb 20                	jmp    200672 <scanfx+0x79>
  200652:	8b 45 08             	mov    0x8(%ebp),%eax
  200655:	8a 00                	mov    (%eax),%al
  200657:	3c 39                	cmp    $0x39,%al
  200659:	7f 17                	jg     200672 <scanfx+0x79>
  20065b:	8b 45 08             	mov    0x8(%ebp),%eax
  20065e:	8a 00                	mov    (%eax),%al
  200660:	3c 2f                	cmp    $0x2f,%al
  200662:	7e 0e                	jle    200672 <scanfx+0x79>
  200664:	8b 45 08             	mov    0x8(%ebp),%eax
  200667:	8a 00                	mov    (%eax),%al
  200669:	0f be c0             	movsbl %al,%eax
  20066c:	83 e8 30             	sub    $0x30,%eax
  20066f:	01 45 fc             	add    %eax,-0x4(%ebp)
  200672:	ff 45 08             	incl   0x8(%ebp)
  200675:	ff 45 f4             	incl   -0xc(%ebp)
  200678:	8b 45 08             	mov    0x8(%ebp),%eax
  20067b:	8a 00                	mov    (%eax),%al
  20067d:	3c 20                	cmp    $0x20,%al
  20067f:	74 09                	je     20068a <scanfx+0x91>
  200681:	8b 45 08             	mov    0x8(%ebp),%eax
  200684:	8a 00                	mov    (%eax),%al
  200686:	84 c0                	test   %al,%al
  200688:	75 a2                	jne    20062c <scanfx+0x33>
  20068a:	83 7d f8 01          	cmpl   $0x1,-0x8(%ebp)
  20068e:	75 03                	jne    200693 <scanfx+0x9a>
  200690:	f7 5d fc             	negl   -0x4(%ebp)
  200693:	8b 45 0c             	mov    0xc(%ebp),%eax
  200696:	8b 55 fc             	mov    -0x4(%ebp),%edx
  200699:	89 10                	mov    %edx,(%eax)
  20069b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20069e:	c9                   	leave  
  20069f:	c3                   	ret    

002006a0 <scanfs>:
  2006a0:	55                   	push   %ebp
  2006a1:	89 e5                	mov    %esp,%ebp
  2006a3:	83 ec 10             	sub    $0x10,%esp
  2006a6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2006ad:	eb 19                	jmp    2006c8 <scanfs+0x28>
  2006af:	8b 45 0c             	mov    0xc(%ebp),%eax
  2006b2:	8d 50 01             	lea    0x1(%eax),%edx
  2006b5:	89 55 0c             	mov    %edx,0xc(%ebp)
  2006b8:	8b 55 08             	mov    0x8(%ebp),%edx
  2006bb:	8d 4a 01             	lea    0x1(%edx),%ecx
  2006be:	89 4d 08             	mov    %ecx,0x8(%ebp)
  2006c1:	8a 12                	mov    (%edx),%dl
  2006c3:	88 10                	mov    %dl,(%eax)
  2006c5:	ff 45 fc             	incl   -0x4(%ebp)
  2006c8:	8b 45 08             	mov    0x8(%ebp),%eax
  2006cb:	8a 00                	mov    (%eax),%al
  2006cd:	3c 20                	cmp    $0x20,%al
  2006cf:	74 09                	je     2006da <scanfs+0x3a>
  2006d1:	8b 45 08             	mov    0x8(%ebp),%eax
  2006d4:	8a 00                	mov    (%eax),%al
  2006d6:	84 c0                	test   %al,%al
  2006d8:	75 d5                	jne    2006af <scanfs+0xf>
  2006da:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2006dd:	c9                   	leave  
  2006de:	c3                   	ret    

002006df <scanfc>:
  2006df:	55                   	push   %ebp
  2006e0:	89 e5                	mov    %esp,%ebp
  2006e2:	8b 45 08             	mov    0x8(%ebp),%eax
  2006e5:	8a 10                	mov    (%eax),%dl
  2006e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  2006ea:	88 10                	mov    %dl,(%eax)
  2006ec:	b8 01 00 00 00       	mov    $0x1,%eax
  2006f1:	5d                   	pop    %ebp
  2006f2:	c3                   	ret    

002006f3 <scanf>:
  2006f3:	55                   	push   %ebp
  2006f4:	89 e5                	mov    %esp,%ebp
  2006f6:	81 ec 10 08 00 00    	sub    $0x810,%esp
  2006fc:	8d 85 f0 f7 ff ff    	lea    -0x810(%ebp),%eax
  200702:	50                   	push   %eax
  200703:	e8 38 fe ff ff       	call   200540 <gets>
  200708:	83 c4 04             	add    $0x4,%esp
  20070b:	8d 45 0c             	lea    0xc(%ebp),%eax
  20070e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200711:	8b 45 08             	mov    0x8(%ebp),%eax
  200714:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200717:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  20071e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200725:	e9 10 01 00 00       	jmp    20083a <scanf+0x147>
  20072a:	8b 55 f8             	mov    -0x8(%ebp),%edx
  20072d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200730:	01 d0                	add    %edx,%eax
  200732:	8a 00                	mov    (%eax),%al
  200734:	3c 25                	cmp    $0x25,%al
  200736:	0f 85 d6 00 00 00    	jne    200812 <scanf+0x11f>
  20073c:	ff 45 f8             	incl   -0x8(%ebp)
  20073f:	8b 55 f8             	mov    -0x8(%ebp),%edx
  200742:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200745:	01 d0                	add    %edx,%eax
  200747:	8a 00                	mov    (%eax),%al
  200749:	0f be c0             	movsbl %al,%eax
  20074c:	83 f8 64             	cmp    $0x64,%eax
  20074f:	74 22                	je     200773 <scanf+0x80>
  200751:	83 f8 64             	cmp    $0x64,%eax
  200754:	7f 0e                	jg     200764 <scanf+0x71>
  200756:	83 f8 63             	cmp    $0x63,%eax
  200759:	0f 84 8c 00 00 00    	je     2007eb <scanf+0xf8>
  20075f:	e9 d3 00 00 00       	jmp    200837 <scanf+0x144>
  200764:	83 f8 73             	cmp    $0x73,%eax
  200767:	74 5b                	je     2007c4 <scanf+0xd1>
  200769:	83 f8 78             	cmp    $0x78,%eax
  20076c:	74 2f                	je     20079d <scanf+0xaa>
  20076e:	e9 c4 00 00 00       	jmp    200837 <scanf+0x144>
  200773:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200776:	8d 50 04             	lea    0x4(%eax),%edx
  200779:	89 55 fc             	mov    %edx,-0x4(%ebp)
  20077c:	8b 00                	mov    (%eax),%eax
  20077e:	89 c2                	mov    %eax,%edx
  200780:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200783:	8d 8d f0 f7 ff ff    	lea    -0x810(%ebp),%ecx
  200789:	01 c8                	add    %ecx,%eax
  20078b:	52                   	push   %edx
  20078c:	50                   	push   %eax
  20078d:	e8 e5 fd ff ff       	call   200577 <scanfd>
  200792:	83 c4 08             	add    $0x8,%esp
  200795:	01 45 f4             	add    %eax,-0xc(%ebp)
  200798:	e9 9a 00 00 00       	jmp    200837 <scanf+0x144>
  20079d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2007a0:	8d 50 04             	lea    0x4(%eax),%edx
  2007a3:	89 55 fc             	mov    %edx,-0x4(%ebp)
  2007a6:	8b 00                	mov    (%eax),%eax
  2007a8:	89 c2                	mov    %eax,%edx
  2007aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2007ad:	8d 8d f0 f7 ff ff    	lea    -0x810(%ebp),%ecx
  2007b3:	01 c8                	add    %ecx,%eax
  2007b5:	52                   	push   %edx
  2007b6:	50                   	push   %eax
  2007b7:	e8 3d fe ff ff       	call   2005f9 <scanfx>
  2007bc:	83 c4 08             	add    $0x8,%esp
  2007bf:	01 45 f4             	add    %eax,-0xc(%ebp)
  2007c2:	eb 73                	jmp    200837 <scanf+0x144>
  2007c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2007c7:	8d 50 04             	lea    0x4(%eax),%edx
  2007ca:	89 55 fc             	mov    %edx,-0x4(%ebp)
  2007cd:	8b 00                	mov    (%eax),%eax
  2007cf:	89 c2                	mov    %eax,%edx
  2007d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2007d4:	8d 8d f0 f7 ff ff    	lea    -0x810(%ebp),%ecx
  2007da:	01 c8                	add    %ecx,%eax
  2007dc:	52                   	push   %edx
  2007dd:	50                   	push   %eax
  2007de:	e8 bd fe ff ff       	call   2006a0 <scanfs>
  2007e3:	83 c4 08             	add    $0x8,%esp
  2007e6:	01 45 f4             	add    %eax,-0xc(%ebp)
  2007e9:	eb 4c                	jmp    200837 <scanf+0x144>
  2007eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2007ee:	8d 50 04             	lea    0x4(%eax),%edx
  2007f1:	89 55 fc             	mov    %edx,-0x4(%ebp)
  2007f4:	8b 00                	mov    (%eax),%eax
  2007f6:	89 c2                	mov    %eax,%edx
  2007f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2007fb:	8d 8d f0 f7 ff ff    	lea    -0x810(%ebp),%ecx
  200801:	01 c8                	add    %ecx,%eax
  200803:	52                   	push   %edx
  200804:	50                   	push   %eax
  200805:	e8 d5 fe ff ff       	call   2006df <scanfc>
  20080a:	83 c4 08             	add    $0x8,%esp
  20080d:	01 45 f4             	add    %eax,-0xc(%ebp)
  200810:	eb 25                	jmp    200837 <scanf+0x144>
  200812:	8b 55 f8             	mov    -0x8(%ebp),%edx
  200815:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200818:	01 d0                	add    %edx,%eax
  20081a:	8a 10                	mov    (%eax),%dl
  20081c:	8d 8d f0 f7 ff ff    	lea    -0x810(%ebp),%ecx
  200822:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200825:	01 c8                	add    %ecx,%eax
  200827:	8a 00                	mov    (%eax),%al
  200829:	38 c2                	cmp    %al,%dl
  20082b:	74 07                	je     200834 <scanf+0x141>
  20082d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  200832:	eb 1d                	jmp    200851 <scanf+0x15e>
  200834:	ff 45 f4             	incl   -0xc(%ebp)
  200837:	ff 45 f8             	incl   -0x8(%ebp)
  20083a:	8b 55 f8             	mov    -0x8(%ebp),%edx
  20083d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200840:	01 d0                	add    %edx,%eax
  200842:	8a 00                	mov    (%eax),%al
  200844:	84 c0                	test   %al,%al
  200846:	0f 85 de fe ff ff    	jne    20072a <scanf+0x37>
  20084c:	b8 01 00 00 00       	mov    $0x1,%eax
  200851:	c9                   	leave  
  200852:	c3                   	ret    
