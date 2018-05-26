
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
  20001c:	68 68 08 20 00       	push   $0x200868
  200021:	e8 e2 06 00 00       	call   200708 <scanf>
  200026:	83 c4 10             	add    $0x10,%esp
  200029:	89 45 f4             	mov    %eax,-0xc(%ebp)
  20002c:	83 ec 08             	sub    $0x8,%esp
  20002f:	8d 85 e8 f7 ff ff    	lea    -0x818(%ebp),%eax
  200035:	50                   	push   %eax
  200036:	68 6b 08 20 00       	push   $0x20086b
  20003b:	e8 29 04 00 00       	call   200469 <printf>
  200040:	83 c4 10             	add    $0x10,%esp
  200043:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  200047:	75 c9                	jne    200012 <uEntry+0x12>
  200049:	83 ec 0c             	sub    $0xc,%esp
  20004c:	68 6f 08 20 00       	push   $0x20086f
  200051:	e8 13 04 00 00       	call   200469 <printf>
  200056:	83 c4 10             	add    $0x10,%esp
  200059:	83 ec 08             	sub    $0x8,%esp
  20005c:	68 55 e0 ff ff       	push   $0xffffe055
  200061:	68 77 08 20 00       	push   $0x200877
  200066:	e8 fe 03 00 00       	call   200469 <printf>
  20006b:	83 c4 10             	add    $0x10,%esp
  20006e:	e8 d2 01 00 00       	call   200245 <exit>
  200073:	c7 45 f0 04 00 00 00 	movl   $0x4,-0x10(%ebp)
  20007a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  200081:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
  200088:	c7 85 e4 f7 ff ff 00 	movl   $0x0,-0x81c(%ebp)
  20008f:	00 00 00 
  200092:	83 ec 0c             	sub    $0xc,%esp
  200095:	68 7c 08 20 00       	push   $0x20087c
  20009a:	e8 ca 03 00 00       	call   200469 <printf>
  20009f:	83 c4 10             	add    $0x10,%esp
  2000a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2000a5:	83 ec 08             	sub    $0x8,%esp
  2000a8:	50                   	push   %eax
  2000a9:	8d 85 e4 f7 ff ff    	lea    -0x81c(%ebp),%eax
  2000af:	50                   	push   %eax
  2000b0:	e8 aa 01 00 00       	call   20025f <sem_init>
  2000b5:	83 c4 10             	add    $0x10,%esp
  2000b8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2000bb:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
  2000bf:	75 15                	jne    2000d6 <uEntry+0xd6>
  2000c1:	83 ec 0c             	sub    $0xc,%esp
  2000c4:	68 a8 08 20 00       	push   $0x2008a8
  2000c9:	e8 9b 03 00 00       	call   200469 <printf>
  2000ce:	83 c4 10             	add    $0x10,%esp
  2000d1:	e8 6f 01 00 00       	call   200245 <exit>
  2000d6:	e8 18 01 00 00       	call   2001f3 <fork>
  2000db:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2000de:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  2000e2:	75 66                	jne    20014a <uEntry+0x14a>
  2000e4:	eb 35                	jmp    20011b <uEntry+0x11b>
  2000e6:	ff 4d f0             	decl   -0x10(%ebp)
  2000e9:	83 ec 0c             	sub    $0xc,%esp
  2000ec:	68 d8 08 20 00       	push   $0x2008d8
  2000f1:	e8 73 03 00 00       	call   200469 <printf>
  2000f6:	83 c4 10             	add    $0x10,%esp
  2000f9:	83 ec 0c             	sub    $0xc,%esp
  2000fc:	8d 85 e4 f7 ff ff    	lea    -0x81c(%ebp),%eax
  200102:	50                   	push   %eax
  200103:	e8 8f 01 00 00       	call   200297 <sem_wait>
  200108:	83 c4 10             	add    $0x10,%esp
  20010b:	83 ec 0c             	sub    $0xc,%esp
  20010e:	68 fc 08 20 00       	push   $0x2008fc
  200113:	e8 51 03 00 00       	call   200469 <printf>
  200118:	83 c4 10             	add    $0x10,%esp
  20011b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  20011f:	75 c5                	jne    2000e6 <uEntry+0xe6>
  200121:	83 ec 0c             	sub    $0xc,%esp
  200124:	68 20 09 20 00       	push   $0x200920
  200129:	e8 3b 03 00 00       	call   200469 <printf>
  20012e:	83 c4 10             	add    $0x10,%esp
  200131:	83 ec 0c             	sub    $0xc,%esp
  200134:	8d 85 e4 f7 ff ff    	lea    -0x81c(%ebp),%eax
  20013a:	50                   	push   %eax
  20013b:	e8 6c 01 00 00       	call   2002ac <sem_destroy>
  200140:	83 c4 10             	add    $0x10,%esp
  200143:	e8 fd 00 00 00       	call   200245 <exit>
  200148:	eb 7a                	jmp    2001c4 <uEntry+0x1c4>
  20014a:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
  20014e:	74 74                	je     2001c4 <uEntry+0x1c4>
  200150:	eb 45                	jmp    200197 <uEntry+0x197>
  200152:	ff 4d f0             	decl   -0x10(%ebp)
  200155:	83 ec 0c             	sub    $0xc,%esp
  200158:	68 46 09 20 00       	push   $0x200946
  20015d:	e8 07 03 00 00       	call   200469 <printf>
  200162:	83 c4 10             	add    $0x10,%esp
  200165:	83 ec 0c             	sub    $0xc,%esp
  200168:	68 80 00 00 00       	push   $0x80
  20016d:	e8 9f 00 00 00       	call   200211 <sleep>
  200172:	83 c4 10             	add    $0x10,%esp
  200175:	83 ec 0c             	sub    $0xc,%esp
  200178:	68 64 09 20 00       	push   $0x200964
  20017d:	e8 e7 02 00 00       	call   200469 <printf>
  200182:	83 c4 10             	add    $0x10,%esp
  200185:	83 ec 0c             	sub    $0xc,%esp
  200188:	8d 85 e4 f7 ff ff    	lea    -0x81c(%ebp),%eax
  20018e:	50                   	push   %eax
  20018f:	e8 ec 00 00 00       	call   200280 <sem_post>
  200194:	83 c4 10             	add    $0x10,%esp
  200197:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  20019b:	75 b5                	jne    200152 <uEntry+0x152>
  20019d:	83 ec 0c             	sub    $0xc,%esp
  2001a0:	68 88 09 20 00       	push   $0x200988
  2001a5:	e8 bf 02 00 00       	call   200469 <printf>
  2001aa:	83 c4 10             	add    $0x10,%esp
  2001ad:	83 ec 0c             	sub    $0xc,%esp
  2001b0:	8d 85 e4 f7 ff ff    	lea    -0x81c(%ebp),%eax
  2001b6:	50                   	push   %eax
  2001b7:	e8 f0 00 00 00       	call   2002ac <sem_destroy>
  2001bc:	83 c4 10             	add    $0x10,%esp
  2001bf:	e8 81 00 00 00       	call   200245 <exit>
  2001c4:	b8 00 00 00 00       	mov    $0x0,%eax
  2001c9:	c9                   	leave  
  2001ca:	c3                   	ret    

002001cb <syscall>:
  2001cb:	55                   	push   %ebp
  2001cc:	89 e5                	mov    %esp,%ebp
  2001ce:	53                   	push   %ebx
  2001cf:	83 ec 10             	sub    $0x10,%esp
  2001d2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2001d9:	8b 45 08             	mov    0x8(%ebp),%eax
  2001dc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  2001df:	8b 4d 10             	mov    0x10(%ebp),%ecx
  2001e2:	8b 55 14             	mov    0x14(%ebp),%edx
  2001e5:	cd 80                	int    $0x80
  2001e7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  2001ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2001ed:	83 c4 10             	add    $0x10,%esp
  2001f0:	5b                   	pop    %ebx
  2001f1:	5d                   	pop    %ebp
  2001f2:	c3                   	ret    

002001f3 <fork>:
  2001f3:	55                   	push   %ebp
  2001f4:	89 e5                	mov    %esp,%ebp
  2001f6:	83 ec 10             	sub    $0x10,%esp
  2001f9:	6a 01                	push   $0x1
  2001fb:	6a 01                	push   $0x1
  2001fd:	6a 01                	push   $0x1
  2001ff:	6a 02                	push   $0x2
  200201:	e8 c5 ff ff ff       	call   2001cb <syscall>
  200206:	83 c4 10             	add    $0x10,%esp
  200209:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20020c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  20020f:	c9                   	leave  
  200210:	c3                   	ret    

00200211 <sleep>:
  200211:	55                   	push   %ebp
  200212:	89 e5                	mov    %esp,%ebp
  200214:	8b 45 08             	mov    0x8(%ebp),%eax
  200217:	6a 01                	push   $0x1
  200219:	6a 01                	push   $0x1
  20021b:	50                   	push   %eax
  20021c:	68 e6 00 00 00       	push   $0xe6
  200221:	e8 a5 ff ff ff       	call   2001cb <syscall>
  200226:	83 c4 10             	add    $0x10,%esp
  200229:	b8 00 00 00 00       	mov    $0x0,%eax
  20022e:	c9                   	leave  
  20022f:	c3                   	ret    

00200230 <getpid>:
  200230:	55                   	push   %ebp
  200231:	89 e5                	mov    %esp,%ebp
  200233:	6a 01                	push   $0x1
  200235:	6a 01                	push   $0x1
  200237:	6a 01                	push   $0x1
  200239:	6a 07                	push   $0x7
  20023b:	e8 8b ff ff ff       	call   2001cb <syscall>
  200240:	83 c4 10             	add    $0x10,%esp
  200243:	c9                   	leave  
  200244:	c3                   	ret    

00200245 <exit>:
  200245:	55                   	push   %ebp
  200246:	89 e5                	mov    %esp,%ebp
  200248:	6a 00                	push   $0x0
  20024a:	6a 00                	push   $0x0
  20024c:	6a 00                	push   $0x0
  20024e:	6a 01                	push   $0x1
  200250:	e8 76 ff ff ff       	call   2001cb <syscall>
  200255:	83 c4 10             	add    $0x10,%esp
  200258:	b8 00 00 00 00       	mov    $0x0,%eax
  20025d:	c9                   	leave  
  20025e:	c3                   	ret    

0020025f <sem_init>:
  20025f:	55                   	push   %ebp
  200260:	89 e5                	mov    %esp,%ebp
  200262:	83 ec 10             	sub    $0x10,%esp
  200265:	8b 45 08             	mov    0x8(%ebp),%eax
  200268:	6a 01                	push   $0x1
  20026a:	ff 75 0c             	pushl  0xc(%ebp)
  20026d:	50                   	push   %eax
  20026e:	6a 15                	push   $0x15
  200270:	e8 56 ff ff ff       	call   2001cb <syscall>
  200275:	83 c4 10             	add    $0x10,%esp
  200278:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20027b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  20027e:	c9                   	leave  
  20027f:	c3                   	ret    

00200280 <sem_post>:
  200280:	55                   	push   %ebp
  200281:	89 e5                	mov    %esp,%ebp
  200283:	8b 45 08             	mov    0x8(%ebp),%eax
  200286:	6a 01                	push   $0x1
  200288:	6a 01                	push   $0x1
  20028a:	50                   	push   %eax
  20028b:	6a 17                	push   $0x17
  20028d:	e8 39 ff ff ff       	call   2001cb <syscall>
  200292:	83 c4 10             	add    $0x10,%esp
  200295:	c9                   	leave  
  200296:	c3                   	ret    

00200297 <sem_wait>:
  200297:	55                   	push   %ebp
  200298:	89 e5                	mov    %esp,%ebp
  20029a:	6a 01                	push   $0x1
  20029c:	6a 01                	push   $0x1
  20029e:	6a 01                	push   $0x1
  2002a0:	6a 16                	push   $0x16
  2002a2:	e8 24 ff ff ff       	call   2001cb <syscall>
  2002a7:	83 c4 10             	add    $0x10,%esp
  2002aa:	c9                   	leave  
  2002ab:	c3                   	ret    

002002ac <sem_destroy>:
  2002ac:	55                   	push   %ebp
  2002ad:	89 e5                	mov    %esp,%ebp
  2002af:	8b 45 08             	mov    0x8(%ebp),%eax
  2002b2:	6a 01                	push   $0x1
  2002b4:	6a 01                	push   $0x1
  2002b6:	50                   	push   %eax
  2002b7:	6a 18                	push   $0x18
  2002b9:	e8 0d ff ff ff       	call   2001cb <syscall>
  2002be:	83 c4 10             	add    $0x10,%esp
  2002c1:	c9                   	leave  
  2002c2:	c3                   	ret    

002002c3 <printd>:
  2002c3:	55                   	push   %ebp
  2002c4:	89 e5                	mov    %esp,%ebp
  2002c6:	83 ec 78             	sub    $0x78,%esp
  2002c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2002d0:	8d 45 89             	lea    -0x77(%ebp),%eax
  2002d3:	83 c0 64             	add    $0x64,%eax
  2002d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  2002d9:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
  2002dd:	c6 45 ee 00          	movb   $0x0,-0x12(%ebp)
  2002e1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  2002e5:	79 17                	jns    2002fe <printd+0x3b>
  2002e7:	81 7d 08 00 00 00 80 	cmpl   $0x80000000,0x8(%ebp)
  2002ee:	75 07                	jne    2002f7 <printd+0x34>
  2002f0:	ff 45 08             	incl   0x8(%ebp)
  2002f3:	c6 45 ee 01          	movb   $0x1,-0x12(%ebp)
  2002f7:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
  2002fb:	f7 5d 08             	negl   0x8(%ebp)
  2002fe:	ff 4d f0             	decl   -0x10(%ebp)
  200301:	8b 45 08             	mov    0x8(%ebp),%eax
  200304:	b9 0a 00 00 00       	mov    $0xa,%ecx
  200309:	99                   	cltd   
  20030a:	f7 f9                	idiv   %ecx
  20030c:	89 d0                	mov    %edx,%eax
  20030e:	83 c0 30             	add    $0x30,%eax
  200311:	88 c2                	mov    %al,%dl
  200313:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200316:	88 10                	mov    %dl,(%eax)
  200318:	ff 45 f4             	incl   -0xc(%ebp)
  20031b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  20031e:	b8 67 66 66 66       	mov    $0x66666667,%eax
  200323:	f7 e9                	imul   %ecx
  200325:	c1 fa 02             	sar    $0x2,%edx
  200328:	89 c8                	mov    %ecx,%eax
  20032a:	c1 f8 1f             	sar    $0x1f,%eax
  20032d:	29 c2                	sub    %eax,%edx
  20032f:	89 d0                	mov    %edx,%eax
  200331:	89 45 08             	mov    %eax,0x8(%ebp)
  200334:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  200338:	75 c4                	jne    2002fe <printd+0x3b>
  20033a:	80 7d ef 01          	cmpb   $0x1,-0x11(%ebp)
  20033e:	75 0c                	jne    20034c <printd+0x89>
  200340:	ff 4d f0             	decl   -0x10(%ebp)
  200343:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200346:	c6 00 2d             	movb   $0x2d,(%eax)
  200349:	ff 45 f4             	incl   -0xc(%ebp)
  20034c:	80 7d ee 01          	cmpb   $0x1,-0x12(%ebp)
  200350:	75 07                	jne    200359 <printd+0x96>
  200352:	8a 45 a6             	mov    -0x5a(%ebp),%al
  200355:	40                   	inc    %eax
  200356:	88 45 a6             	mov    %al,-0x5a(%ebp)
  200359:	c6 45 ed 00          	movb   $0x0,-0x13(%ebp)
  20035d:	83 ec 0c             	sub    $0xc,%esp
  200360:	ff 75 f0             	pushl  -0x10(%ebp)
  200363:	e8 ca 00 00 00       	call   200432 <prints>
  200368:	83 c4 10             	add    $0x10,%esp
  20036b:	90                   	nop
  20036c:	c9                   	leave  
  20036d:	c3                   	ret    

0020036e <printx>:
  20036e:	55                   	push   %ebp
  20036f:	89 e5                	mov    %esp,%ebp
  200371:	83 ec 38             	sub    $0x38,%esp
  200374:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20037b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  20037f:	79 0a                	jns    20038b <printx+0x1d>
  200381:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  200388:	f7 5d 08             	negl   0x8(%ebp)
  20038b:	8d 45 cd             	lea    -0x33(%ebp),%eax
  20038e:	83 c0 1e             	add    $0x1e,%eax
  200391:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200394:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  20039b:	8b 45 08             	mov    0x8(%ebp),%eax
  20039e:	25 0f 00 00 80       	and    $0x8000000f,%eax
  2003a3:	85 c0                	test   %eax,%eax
  2003a5:	79 05                	jns    2003ac <printx+0x3e>
  2003a7:	48                   	dec    %eax
  2003a8:	83 c8 f0             	or     $0xfffffff0,%eax
  2003ab:	40                   	inc    %eax
  2003ac:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2003af:	83 7d ec 09          	cmpl   $0x9,-0x14(%ebp)
  2003b3:	7e 12                	jle    2003c7 <printx+0x59>
  2003b5:	ff 4d f0             	decl   -0x10(%ebp)
  2003b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2003bb:	83 c0 57             	add    $0x57,%eax
  2003be:	88 c2                	mov    %al,%dl
  2003c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2003c3:	88 10                	mov    %dl,(%eax)
  2003c5:	eb 10                	jmp    2003d7 <printx+0x69>
  2003c7:	ff 4d f0             	decl   -0x10(%ebp)
  2003ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
  2003cd:	83 c0 30             	add    $0x30,%eax
  2003d0:	88 c2                	mov    %al,%dl
  2003d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2003d5:	88 10                	mov    %dl,(%eax)
  2003d7:	8b 45 08             	mov    0x8(%ebp),%eax
  2003da:	85 c0                	test   %eax,%eax
  2003dc:	79 03                	jns    2003e1 <printx+0x73>
  2003de:	83 c0 0f             	add    $0xf,%eax
  2003e1:	c1 f8 04             	sar    $0x4,%eax
  2003e4:	89 45 08             	mov    %eax,0x8(%ebp)
  2003e7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  2003eb:	75 ae                	jne    20039b <printx+0x2d>
  2003ed:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
  2003f1:	75 09                	jne    2003fc <printx+0x8e>
  2003f3:	ff 4d f0             	decl   -0x10(%ebp)
  2003f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2003f9:	c6 00 2d             	movb   $0x2d,(%eax)
  2003fc:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
  200400:	83 ec 0c             	sub    $0xc,%esp
  200403:	ff 75 f0             	pushl  -0x10(%ebp)
  200406:	e8 27 00 00 00       	call   200432 <prints>
  20040b:	83 c4 10             	add    $0x10,%esp
  20040e:	90                   	nop
  20040f:	c9                   	leave  
  200410:	c3                   	ret    

00200411 <printc>:
  200411:	55                   	push   %ebp
  200412:	89 e5                	mov    %esp,%ebp
  200414:	83 ec 04             	sub    $0x4,%esp
  200417:	8b 45 08             	mov    0x8(%ebp),%eax
  20041a:	88 45 fc             	mov    %al,-0x4(%ebp)
  20041d:	8d 45 fc             	lea    -0x4(%ebp),%eax
  200420:	6a 01                	push   $0x1
  200422:	50                   	push   %eax
  200423:	6a 01                	push   $0x1
  200425:	6a 04                	push   $0x4
  200427:	e8 9f fd ff ff       	call   2001cb <syscall>
  20042c:	83 c4 10             	add    $0x10,%esp
  20042f:	90                   	nop
  200430:	c9                   	leave  
  200431:	c3                   	ret    

00200432 <prints>:
  200432:	55                   	push   %ebp
  200433:	89 e5                	mov    %esp,%ebp
  200435:	83 ec 10             	sub    $0x10,%esp
  200438:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  20043f:	eb 03                	jmp    200444 <prints+0x12>
  200441:	ff 45 fc             	incl   -0x4(%ebp)
  200444:	8b 55 fc             	mov    -0x4(%ebp),%edx
  200447:	8b 45 08             	mov    0x8(%ebp),%eax
  20044a:	01 d0                	add    %edx,%eax
  20044c:	8a 00                	mov    (%eax),%al
  20044e:	84 c0                	test   %al,%al
  200450:	75 ef                	jne    200441 <prints+0xf>
  200452:	8b 55 fc             	mov    -0x4(%ebp),%edx
  200455:	8b 45 08             	mov    0x8(%ebp),%eax
  200458:	52                   	push   %edx
  200459:	50                   	push   %eax
  20045a:	6a 01                	push   $0x1
  20045c:	6a 04                	push   $0x4
  20045e:	e8 68 fd ff ff       	call   2001cb <syscall>
  200463:	83 c4 10             	add    $0x10,%esp
  200466:	90                   	nop
  200467:	c9                   	leave  
  200468:	c3                   	ret    

00200469 <printf>:
  200469:	55                   	push   %ebp
  20046a:	89 e5                	mov    %esp,%ebp
  20046c:	83 ec 18             	sub    $0x18,%esp
  20046f:	8d 45 0c             	lea    0xc(%ebp),%eax
  200472:	89 45 f4             	mov    %eax,-0xc(%ebp)
  200475:	8b 45 08             	mov    0x8(%ebp),%eax
  200478:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20047b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  200482:	e9 be 00 00 00       	jmp    200545 <printf+0xdc>
  200487:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20048a:	8a 00                	mov    (%eax),%al
  20048c:	3c 25                	cmp    $0x25,%al
  20048e:	0f 85 9a 00 00 00    	jne    20052e <printf+0xc5>
  200494:	ff 45 f0             	incl   -0x10(%ebp)
  200497:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20049a:	8a 00                	mov    (%eax),%al
  20049c:	0f be c0             	movsbl %al,%eax
  20049f:	83 f8 64             	cmp    $0x64,%eax
  2004a2:	74 1e                	je     2004c2 <printf+0x59>
  2004a4:	83 f8 64             	cmp    $0x64,%eax
  2004a7:	7f 0a                	jg     2004b3 <printf+0x4a>
  2004a9:	83 f8 63             	cmp    $0x63,%eax
  2004ac:	74 64                	je     200512 <printf+0xa9>
  2004ae:	e9 8f 00 00 00       	jmp    200542 <printf+0xd9>
  2004b3:	83 f8 73             	cmp    $0x73,%eax
  2004b6:	74 41                	je     2004f9 <printf+0x90>
  2004b8:	83 f8 78             	cmp    $0x78,%eax
  2004bb:	74 23                	je     2004e0 <printf+0x77>
  2004bd:	e9 80 00 00 00       	jmp    200542 <printf+0xd9>
  2004c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2004c5:	8d 50 04             	lea    0x4(%eax),%edx
  2004c8:	89 55 f4             	mov    %edx,-0xc(%ebp)
  2004cb:	8b 00                	mov    (%eax),%eax
  2004cd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2004d0:	83 ec 0c             	sub    $0xc,%esp
  2004d3:	ff 75 ec             	pushl  -0x14(%ebp)
  2004d6:	e8 e8 fd ff ff       	call   2002c3 <printd>
  2004db:	83 c4 10             	add    $0x10,%esp
  2004de:	eb 62                	jmp    200542 <printf+0xd9>
  2004e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2004e3:	8d 50 04             	lea    0x4(%eax),%edx
  2004e6:	89 55 f4             	mov    %edx,-0xc(%ebp)
  2004e9:	8b 00                	mov    (%eax),%eax
  2004eb:	83 ec 0c             	sub    $0xc,%esp
  2004ee:	50                   	push   %eax
  2004ef:	e8 7a fe ff ff       	call   20036e <printx>
  2004f4:	83 c4 10             	add    $0x10,%esp
  2004f7:	eb 49                	jmp    200542 <printf+0xd9>
  2004f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2004fc:	8d 50 04             	lea    0x4(%eax),%edx
  2004ff:	89 55 f4             	mov    %edx,-0xc(%ebp)
  200502:	8b 00                	mov    (%eax),%eax
  200504:	83 ec 0c             	sub    $0xc,%esp
  200507:	50                   	push   %eax
  200508:	e8 25 ff ff ff       	call   200432 <prints>
  20050d:	83 c4 10             	add    $0x10,%esp
  200510:	eb 30                	jmp    200542 <printf+0xd9>
  200512:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200515:	8d 50 04             	lea    0x4(%eax),%edx
  200518:	89 55 f4             	mov    %edx,-0xc(%ebp)
  20051b:	8b 00                	mov    (%eax),%eax
  20051d:	0f be c0             	movsbl %al,%eax
  200520:	83 ec 0c             	sub    $0xc,%esp
  200523:	50                   	push   %eax
  200524:	e8 e8 fe ff ff       	call   200411 <printc>
  200529:	83 c4 10             	add    $0x10,%esp
  20052c:	eb 14                	jmp    200542 <printf+0xd9>
  20052e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200531:	8a 00                	mov    (%eax),%al
  200533:	0f be c0             	movsbl %al,%eax
  200536:	83 ec 0c             	sub    $0xc,%esp
  200539:	50                   	push   %eax
  20053a:	e8 d2 fe ff ff       	call   200411 <printc>
  20053f:	83 c4 10             	add    $0x10,%esp
  200542:	ff 45 f0             	incl   -0x10(%ebp)
  200545:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200548:	8a 00                	mov    (%eax),%al
  20054a:	84 c0                	test   %al,%al
  20054c:	0f 85 35 ff ff ff    	jne    200487 <printf+0x1e>
  200552:	90                   	nop
  200553:	c9                   	leave  
  200554:	c3                   	ret    

00200555 <gets>:
  200555:	55                   	push   %ebp
  200556:	89 e5                	mov    %esp,%ebp
  200558:	8b 45 08             	mov    0x8(%ebp),%eax
  20055b:	68 00 08 00 00       	push   $0x800
  200560:	50                   	push   %eax
  200561:	6a 00                	push   $0x0
  200563:	6a 03                	push   $0x3
  200565:	e8 61 fc ff ff       	call   2001cb <syscall>
  20056a:	83 c4 10             	add    $0x10,%esp
  20056d:	c9                   	leave  
  20056e:	c3                   	ret    

0020056f <getchar>:
  20056f:	55                   	push   %ebp
  200570:	89 e5                	mov    %esp,%ebp
  200572:	83 ec 10             	sub    $0x10,%esp
  200575:	8d 45 fb             	lea    -0x5(%ebp),%eax
  200578:	6a 01                	push   $0x1
  20057a:	50                   	push   %eax
  20057b:	6a 00                	push   $0x0
  20057d:	6a 03                	push   $0x3
  20057f:	e8 47 fc ff ff       	call   2001cb <syscall>
  200584:	83 c4 10             	add    $0x10,%esp
  200587:	8a 45 fb             	mov    -0x5(%ebp),%al
  20058a:	c9                   	leave  
  20058b:	c3                   	ret    

0020058c <scanfd>:
  20058c:	55                   	push   %ebp
  20058d:	89 e5                	mov    %esp,%ebp
  20058f:	83 ec 10             	sub    $0x10,%esp
  200592:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200599:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2005a0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2005a7:	8b 45 08             	mov    0x8(%ebp),%eax
  2005aa:	8a 00                	mov    (%eax),%al
  2005ac:	3c 2d                	cmp    $0x2d,%al
  2005ae:	75 32                	jne    2005e2 <scanfd+0x56>
  2005b0:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%ebp)
  2005b7:	ff 45 08             	incl   0x8(%ebp)
  2005ba:	ff 45 f4             	incl   -0xc(%ebp)
  2005bd:	eb 23                	jmp    2005e2 <scanfd+0x56>
  2005bf:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2005c2:	89 d0                	mov    %edx,%eax
  2005c4:	c1 e0 02             	shl    $0x2,%eax
  2005c7:	01 d0                	add    %edx,%eax
  2005c9:	01 c0                	add    %eax,%eax
  2005cb:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2005ce:	8b 45 08             	mov    0x8(%ebp),%eax
  2005d1:	8a 00                	mov    (%eax),%al
  2005d3:	0f be c0             	movsbl %al,%eax
  2005d6:	83 e8 30             	sub    $0x30,%eax
  2005d9:	01 45 fc             	add    %eax,-0x4(%ebp)
  2005dc:	ff 45 08             	incl   0x8(%ebp)
  2005df:	ff 45 f4             	incl   -0xc(%ebp)
  2005e2:	8b 45 08             	mov    0x8(%ebp),%eax
  2005e5:	8a 00                	mov    (%eax),%al
  2005e7:	3c 20                	cmp    $0x20,%al
  2005e9:	74 09                	je     2005f4 <scanfd+0x68>
  2005eb:	8b 45 08             	mov    0x8(%ebp),%eax
  2005ee:	8a 00                	mov    (%eax),%al
  2005f0:	84 c0                	test   %al,%al
  2005f2:	75 cb                	jne    2005bf <scanfd+0x33>
  2005f4:	83 7d f8 01          	cmpl   $0x1,-0x8(%ebp)
  2005f8:	75 07                	jne    200601 <scanfd+0x75>
  2005fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2005fd:	f7 d8                	neg    %eax
  2005ff:	eb 03                	jmp    200604 <scanfd+0x78>
  200601:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200604:	8b 55 0c             	mov    0xc(%ebp),%edx
  200607:	89 02                	mov    %eax,(%edx)
  200609:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20060c:	c9                   	leave  
  20060d:	c3                   	ret    

0020060e <scanfx>:
  20060e:	55                   	push   %ebp
  20060f:	89 e5                	mov    %esp,%ebp
  200611:	83 ec 10             	sub    $0x10,%esp
  200614:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  20061b:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200622:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200629:	8b 45 08             	mov    0x8(%ebp),%eax
  20062c:	8a 00                	mov    (%eax),%al
  20062e:	3c 2d                	cmp    $0x2d,%al
  200630:	75 5b                	jne    20068d <scanfx+0x7f>
  200632:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%ebp)
  200639:	ff 45 08             	incl   0x8(%ebp)
  20063c:	ff 45 f4             	incl   -0xc(%ebp)
  20063f:	eb 4c                	jmp    20068d <scanfx+0x7f>
  200641:	c1 65 fc 04          	shll   $0x4,-0x4(%ebp)
  200645:	8b 45 08             	mov    0x8(%ebp),%eax
  200648:	8a 00                	mov    (%eax),%al
  20064a:	3c 66                	cmp    $0x66,%al
  20064c:	7f 19                	jg     200667 <scanfx+0x59>
  20064e:	8b 45 08             	mov    0x8(%ebp),%eax
  200651:	8a 00                	mov    (%eax),%al
  200653:	3c 60                	cmp    $0x60,%al
  200655:	7e 10                	jle    200667 <scanfx+0x59>
  200657:	8b 45 08             	mov    0x8(%ebp),%eax
  20065a:	8a 00                	mov    (%eax),%al
  20065c:	0f be c0             	movsbl %al,%eax
  20065f:	83 e8 57             	sub    $0x57,%eax
  200662:	01 45 fc             	add    %eax,-0x4(%ebp)
  200665:	eb 20                	jmp    200687 <scanfx+0x79>
  200667:	8b 45 08             	mov    0x8(%ebp),%eax
  20066a:	8a 00                	mov    (%eax),%al
  20066c:	3c 39                	cmp    $0x39,%al
  20066e:	7f 17                	jg     200687 <scanfx+0x79>
  200670:	8b 45 08             	mov    0x8(%ebp),%eax
  200673:	8a 00                	mov    (%eax),%al
  200675:	3c 2f                	cmp    $0x2f,%al
  200677:	7e 0e                	jle    200687 <scanfx+0x79>
  200679:	8b 45 08             	mov    0x8(%ebp),%eax
  20067c:	8a 00                	mov    (%eax),%al
  20067e:	0f be c0             	movsbl %al,%eax
  200681:	83 e8 30             	sub    $0x30,%eax
  200684:	01 45 fc             	add    %eax,-0x4(%ebp)
  200687:	ff 45 08             	incl   0x8(%ebp)
  20068a:	ff 45 f4             	incl   -0xc(%ebp)
  20068d:	8b 45 08             	mov    0x8(%ebp),%eax
  200690:	8a 00                	mov    (%eax),%al
  200692:	3c 20                	cmp    $0x20,%al
  200694:	74 09                	je     20069f <scanfx+0x91>
  200696:	8b 45 08             	mov    0x8(%ebp),%eax
  200699:	8a 00                	mov    (%eax),%al
  20069b:	84 c0                	test   %al,%al
  20069d:	75 a2                	jne    200641 <scanfx+0x33>
  20069f:	83 7d f8 01          	cmpl   $0x1,-0x8(%ebp)
  2006a3:	75 03                	jne    2006a8 <scanfx+0x9a>
  2006a5:	f7 5d fc             	negl   -0x4(%ebp)
  2006a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  2006ab:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2006ae:	89 10                	mov    %edx,(%eax)
  2006b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2006b3:	c9                   	leave  
  2006b4:	c3                   	ret    

002006b5 <scanfs>:
  2006b5:	55                   	push   %ebp
  2006b6:	89 e5                	mov    %esp,%ebp
  2006b8:	83 ec 10             	sub    $0x10,%esp
  2006bb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2006c2:	eb 19                	jmp    2006dd <scanfs+0x28>
  2006c4:	8b 45 0c             	mov    0xc(%ebp),%eax
  2006c7:	8d 50 01             	lea    0x1(%eax),%edx
  2006ca:	89 55 0c             	mov    %edx,0xc(%ebp)
  2006cd:	8b 55 08             	mov    0x8(%ebp),%edx
  2006d0:	8d 4a 01             	lea    0x1(%edx),%ecx
  2006d3:	89 4d 08             	mov    %ecx,0x8(%ebp)
  2006d6:	8a 12                	mov    (%edx),%dl
  2006d8:	88 10                	mov    %dl,(%eax)
  2006da:	ff 45 fc             	incl   -0x4(%ebp)
  2006dd:	8b 45 08             	mov    0x8(%ebp),%eax
  2006e0:	8a 00                	mov    (%eax),%al
  2006e2:	3c 20                	cmp    $0x20,%al
  2006e4:	74 09                	je     2006ef <scanfs+0x3a>
  2006e6:	8b 45 08             	mov    0x8(%ebp),%eax
  2006e9:	8a 00                	mov    (%eax),%al
  2006eb:	84 c0                	test   %al,%al
  2006ed:	75 d5                	jne    2006c4 <scanfs+0xf>
  2006ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2006f2:	c9                   	leave  
  2006f3:	c3                   	ret    

002006f4 <scanfc>:
  2006f4:	55                   	push   %ebp
  2006f5:	89 e5                	mov    %esp,%ebp
  2006f7:	8b 45 08             	mov    0x8(%ebp),%eax
  2006fa:	8a 10                	mov    (%eax),%dl
  2006fc:	8b 45 0c             	mov    0xc(%ebp),%eax
  2006ff:	88 10                	mov    %dl,(%eax)
  200701:	b8 01 00 00 00       	mov    $0x1,%eax
  200706:	5d                   	pop    %ebp
  200707:	c3                   	ret    

00200708 <scanf>:
  200708:	55                   	push   %ebp
  200709:	89 e5                	mov    %esp,%ebp
  20070b:	81 ec 10 08 00 00    	sub    $0x810,%esp
  200711:	8d 85 f0 f7 ff ff    	lea    -0x810(%ebp),%eax
  200717:	50                   	push   %eax
  200718:	e8 38 fe ff ff       	call   200555 <gets>
  20071d:	83 c4 04             	add    $0x4,%esp
  200720:	8d 45 0c             	lea    0xc(%ebp),%eax
  200723:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200726:	8b 45 08             	mov    0x8(%ebp),%eax
  200729:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20072c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200733:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20073a:	e9 10 01 00 00       	jmp    20084f <scanf+0x147>
  20073f:	8b 55 f8             	mov    -0x8(%ebp),%edx
  200742:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200745:	01 d0                	add    %edx,%eax
  200747:	8a 00                	mov    (%eax),%al
  200749:	3c 25                	cmp    $0x25,%al
  20074b:	0f 85 d6 00 00 00    	jne    200827 <scanf+0x11f>
  200751:	ff 45 f8             	incl   -0x8(%ebp)
  200754:	8b 55 f8             	mov    -0x8(%ebp),%edx
  200757:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20075a:	01 d0                	add    %edx,%eax
  20075c:	8a 00                	mov    (%eax),%al
  20075e:	0f be c0             	movsbl %al,%eax
  200761:	83 f8 64             	cmp    $0x64,%eax
  200764:	74 22                	je     200788 <scanf+0x80>
  200766:	83 f8 64             	cmp    $0x64,%eax
  200769:	7f 0e                	jg     200779 <scanf+0x71>
  20076b:	83 f8 63             	cmp    $0x63,%eax
  20076e:	0f 84 8c 00 00 00    	je     200800 <scanf+0xf8>
  200774:	e9 d3 00 00 00       	jmp    20084c <scanf+0x144>
  200779:	83 f8 73             	cmp    $0x73,%eax
  20077c:	74 5b                	je     2007d9 <scanf+0xd1>
  20077e:	83 f8 78             	cmp    $0x78,%eax
  200781:	74 2f                	je     2007b2 <scanf+0xaa>
  200783:	e9 c4 00 00 00       	jmp    20084c <scanf+0x144>
  200788:	8b 45 fc             	mov    -0x4(%ebp),%eax
  20078b:	8d 50 04             	lea    0x4(%eax),%edx
  20078e:	89 55 fc             	mov    %edx,-0x4(%ebp)
  200791:	8b 00                	mov    (%eax),%eax
  200793:	89 c2                	mov    %eax,%edx
  200795:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200798:	8d 8d f0 f7 ff ff    	lea    -0x810(%ebp),%ecx
  20079e:	01 c8                	add    %ecx,%eax
  2007a0:	52                   	push   %edx
  2007a1:	50                   	push   %eax
  2007a2:	e8 e5 fd ff ff       	call   20058c <scanfd>
  2007a7:	83 c4 08             	add    $0x8,%esp
  2007aa:	01 45 f4             	add    %eax,-0xc(%ebp)
  2007ad:	e9 9a 00 00 00       	jmp    20084c <scanf+0x144>
  2007b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2007b5:	8d 50 04             	lea    0x4(%eax),%edx
  2007b8:	89 55 fc             	mov    %edx,-0x4(%ebp)
  2007bb:	8b 00                	mov    (%eax),%eax
  2007bd:	89 c2                	mov    %eax,%edx
  2007bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2007c2:	8d 8d f0 f7 ff ff    	lea    -0x810(%ebp),%ecx
  2007c8:	01 c8                	add    %ecx,%eax
  2007ca:	52                   	push   %edx
  2007cb:	50                   	push   %eax
  2007cc:	e8 3d fe ff ff       	call   20060e <scanfx>
  2007d1:	83 c4 08             	add    $0x8,%esp
  2007d4:	01 45 f4             	add    %eax,-0xc(%ebp)
  2007d7:	eb 73                	jmp    20084c <scanf+0x144>
  2007d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2007dc:	8d 50 04             	lea    0x4(%eax),%edx
  2007df:	89 55 fc             	mov    %edx,-0x4(%ebp)
  2007e2:	8b 00                	mov    (%eax),%eax
  2007e4:	89 c2                	mov    %eax,%edx
  2007e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2007e9:	8d 8d f0 f7 ff ff    	lea    -0x810(%ebp),%ecx
  2007ef:	01 c8                	add    %ecx,%eax
  2007f1:	52                   	push   %edx
  2007f2:	50                   	push   %eax
  2007f3:	e8 bd fe ff ff       	call   2006b5 <scanfs>
  2007f8:	83 c4 08             	add    $0x8,%esp
  2007fb:	01 45 f4             	add    %eax,-0xc(%ebp)
  2007fe:	eb 4c                	jmp    20084c <scanf+0x144>
  200800:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200803:	8d 50 04             	lea    0x4(%eax),%edx
  200806:	89 55 fc             	mov    %edx,-0x4(%ebp)
  200809:	8b 00                	mov    (%eax),%eax
  20080b:	89 c2                	mov    %eax,%edx
  20080d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200810:	8d 8d f0 f7 ff ff    	lea    -0x810(%ebp),%ecx
  200816:	01 c8                	add    %ecx,%eax
  200818:	52                   	push   %edx
  200819:	50                   	push   %eax
  20081a:	e8 d5 fe ff ff       	call   2006f4 <scanfc>
  20081f:	83 c4 08             	add    $0x8,%esp
  200822:	01 45 f4             	add    %eax,-0xc(%ebp)
  200825:	eb 25                	jmp    20084c <scanf+0x144>
  200827:	8b 55 f8             	mov    -0x8(%ebp),%edx
  20082a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20082d:	01 d0                	add    %edx,%eax
  20082f:	8a 10                	mov    (%eax),%dl
  200831:	8d 8d f0 f7 ff ff    	lea    -0x810(%ebp),%ecx
  200837:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20083a:	01 c8                	add    %ecx,%eax
  20083c:	8a 00                	mov    (%eax),%al
  20083e:	38 c2                	cmp    %al,%dl
  200840:	74 07                	je     200849 <scanf+0x141>
  200842:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  200847:	eb 1d                	jmp    200866 <scanf+0x15e>
  200849:	ff 45 f4             	incl   -0xc(%ebp)
  20084c:	ff 45 f8             	incl   -0x8(%ebp)
  20084f:	8b 55 f8             	mov    -0x8(%ebp),%edx
  200852:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200855:	01 d0                	add    %edx,%eax
  200857:	8a 00                	mov    (%eax),%al
  200859:	84 c0                	test   %al,%al
  20085b:	0f 85 de fe ff ff    	jne    20073f <scanf+0x37>
  200861:	b8 01 00 00 00       	mov    $0x1,%eax
  200866:	c9                   	leave  
  200867:	c3                   	ret    
