
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	83 ec 18             	sub    $0x18,%esp
  200006:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
  20000d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200014:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
  20001b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  200022:	83 ec 0c             	sub    $0xc,%esp
  200025:	68 e4 04 20 00       	push   $0x2004e4
  20002a:	e8 c9 03 00 00       	call   2003f8 <printf>
  20002f:	83 c4 10             	add    $0x10,%esp
  200032:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200035:	83 ec 08             	sub    $0x8,%esp
  200038:	50                   	push   %eax
  200039:	8d 45 e8             	lea    -0x18(%ebp),%eax
  20003c:	50                   	push   %eax
  20003d:	e8 a3 01 00 00       	call   2001e5 <sem_init>
  200042:	83 c4 10             	add    $0x10,%esp
  200045:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200048:	e8 7e 01 00 00       	call   2001cb <exit>
  20004d:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  200051:	75 15                	jne    200068 <uEntry+0x68>
  200053:	83 ec 0c             	sub    $0xc,%esp
  200056:	68 10 05 20 00       	push   $0x200510
  20005b:	e8 98 03 00 00       	call   2003f8 <printf>
  200060:	83 c4 10             	add    $0x10,%esp
  200063:	e8 63 01 00 00       	call   2001cb <exit>
  200068:	e8 0c 01 00 00       	call   200179 <fork>
  20006d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200070:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  200074:	75 60                	jne    2000d6 <uEntry+0xd6>
  200076:	eb 32                	jmp    2000aa <uEntry+0xaa>
  200078:	ff 4d f4             	decl   -0xc(%ebp)
  20007b:	83 ec 0c             	sub    $0xc,%esp
  20007e:	68 40 05 20 00       	push   $0x200540
  200083:	e8 70 03 00 00       	call   2003f8 <printf>
  200088:	83 c4 10             	add    $0x10,%esp
  20008b:	83 ec 0c             	sub    $0xc,%esp
  20008e:	8d 45 e8             	lea    -0x18(%ebp),%eax
  200091:	50                   	push   %eax
  200092:	e8 cd 01 00 00       	call   200264 <sem_wait>
  200097:	83 c4 10             	add    $0x10,%esp
  20009a:	83 ec 0c             	sub    $0xc,%esp
  20009d:	68 64 05 20 00       	push   $0x200564
  2000a2:	e8 51 03 00 00       	call   2003f8 <printf>
  2000a7:	83 c4 10             	add    $0x10,%esp
  2000aa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  2000ae:	75 c8                	jne    200078 <uEntry+0x78>
  2000b0:	83 ec 0c             	sub    $0xc,%esp
  2000b3:	68 88 05 20 00       	push   $0x200588
  2000b8:	e8 3b 03 00 00       	call   2003f8 <printf>
  2000bd:	83 c4 10             	add    $0x10,%esp
  2000c0:	83 ec 0c             	sub    $0xc,%esp
  2000c3:	8d 45 e8             	lea    -0x18(%ebp),%eax
  2000c6:	50                   	push   %eax
  2000c7:	e8 a2 01 00 00       	call   20026e <sem_destroy>
  2000cc:	83 c4 10             	add    $0x10,%esp
  2000cf:	e8 f7 00 00 00       	call   2001cb <exit>
  2000d4:	eb 74                	jmp    20014a <uEntry+0x14a>
  2000d6:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  2000da:	74 6e                	je     20014a <uEntry+0x14a>
  2000dc:	eb 42                	jmp    200120 <uEntry+0x120>
  2000de:	ff 4d f4             	decl   -0xc(%ebp)
  2000e1:	83 ec 0c             	sub    $0xc,%esp
  2000e4:	68 ae 05 20 00       	push   $0x2005ae
  2000e9:	e8 0a 03 00 00       	call   2003f8 <printf>
  2000ee:	83 c4 10             	add    $0x10,%esp
  2000f1:	83 ec 0c             	sub    $0xc,%esp
  2000f4:	68 80 00 00 00       	push   $0x80
  2000f9:	e8 99 00 00 00       	call   200197 <sleep>
  2000fe:	83 c4 10             	add    $0x10,%esp
  200101:	83 ec 0c             	sub    $0xc,%esp
  200104:	68 cc 05 20 00       	push   $0x2005cc
  200109:	e8 ea 02 00 00       	call   2003f8 <printf>
  20010e:	83 c4 10             	add    $0x10,%esp
  200111:	83 ec 0c             	sub    $0xc,%esp
  200114:	8d 45 e8             	lea    -0x18(%ebp),%eax
  200117:	50                   	push   %eax
  200118:	e8 3d 01 00 00       	call   20025a <sem_post>
  20011d:	83 c4 10             	add    $0x10,%esp
  200120:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  200124:	75 b8                	jne    2000de <uEntry+0xde>
  200126:	83 ec 0c             	sub    $0xc,%esp
  200129:	68 f0 05 20 00       	push   $0x2005f0
  20012e:	e8 c5 02 00 00       	call   2003f8 <printf>
  200133:	83 c4 10             	add    $0x10,%esp
  200136:	83 ec 0c             	sub    $0xc,%esp
  200139:	8d 45 e8             	lea    -0x18(%ebp),%eax
  20013c:	50                   	push   %eax
  20013d:	e8 2c 01 00 00       	call   20026e <sem_destroy>
  200142:	83 c4 10             	add    $0x10,%esp
  200145:	e8 81 00 00 00       	call   2001cb <exit>
  20014a:	b8 00 00 00 00       	mov    $0x0,%eax
  20014f:	c9                   	leave  
  200150:	c3                   	ret    

00200151 <syscall>:
  200151:	55                   	push   %ebp
  200152:	89 e5                	mov    %esp,%ebp
  200154:	53                   	push   %ebx
  200155:	83 ec 10             	sub    $0x10,%esp
  200158:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  20015f:	8b 45 08             	mov    0x8(%ebp),%eax
  200162:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  200165:	8b 4d 10             	mov    0x10(%ebp),%ecx
  200168:	8b 55 14             	mov    0x14(%ebp),%edx
  20016b:	cd 80                	int    $0x80
  20016d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  200170:	8b 45 f8             	mov    -0x8(%ebp),%eax
  200173:	83 c4 10             	add    $0x10,%esp
  200176:	5b                   	pop    %ebx
  200177:	5d                   	pop    %ebp
  200178:	c3                   	ret    

00200179 <fork>:
  200179:	55                   	push   %ebp
  20017a:	89 e5                	mov    %esp,%ebp
  20017c:	83 ec 10             	sub    $0x10,%esp
  20017f:	6a 01                	push   $0x1
  200181:	6a 01                	push   $0x1
  200183:	6a 01                	push   $0x1
  200185:	6a 02                	push   $0x2
  200187:	e8 c5 ff ff ff       	call   200151 <syscall>
  20018c:	83 c4 10             	add    $0x10,%esp
  20018f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200192:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200195:	c9                   	leave  
  200196:	c3                   	ret    

00200197 <sleep>:
  200197:	55                   	push   %ebp
  200198:	89 e5                	mov    %esp,%ebp
  20019a:	8b 45 08             	mov    0x8(%ebp),%eax
  20019d:	6a 01                	push   $0x1
  20019f:	6a 01                	push   $0x1
  2001a1:	50                   	push   %eax
  2001a2:	68 e6 00 00 00       	push   $0xe6
  2001a7:	e8 a5 ff ff ff       	call   200151 <syscall>
  2001ac:	83 c4 10             	add    $0x10,%esp
  2001af:	b8 00 00 00 00       	mov    $0x0,%eax
  2001b4:	c9                   	leave  
  2001b5:	c3                   	ret    

002001b6 <getpid>:
  2001b6:	55                   	push   %ebp
  2001b7:	89 e5                	mov    %esp,%ebp
  2001b9:	6a 01                	push   $0x1
  2001bb:	6a 01                	push   $0x1
  2001bd:	6a 01                	push   $0x1
  2001bf:	6a 07                	push   $0x7
  2001c1:	e8 8b ff ff ff       	call   200151 <syscall>
  2001c6:	83 c4 10             	add    $0x10,%esp
  2001c9:	c9                   	leave  
  2001ca:	c3                   	ret    

002001cb <exit>:
  2001cb:	55                   	push   %ebp
  2001cc:	89 e5                	mov    %esp,%ebp
  2001ce:	6a 00                	push   $0x0
  2001d0:	6a 00                	push   $0x0
  2001d2:	6a 00                	push   $0x0
  2001d4:	6a 01                	push   $0x1
  2001d6:	e8 76 ff ff ff       	call   200151 <syscall>
  2001db:	83 c4 10             	add    $0x10,%esp
  2001de:	b8 00 00 00 00       	mov    $0x0,%eax
  2001e3:	c9                   	leave  
  2001e4:	c3                   	ret    

002001e5 <sem_init>:
  2001e5:	55                   	push   %ebp
  2001e6:	89 e5                	mov    %esp,%ebp
  2001e8:	83 ec 18             	sub    $0x18,%esp
  2001eb:	8b 45 08             	mov    0x8(%ebp),%eax
  2001ee:	8b 00                	mov    (%eax),%eax
  2001f0:	83 ec 08             	sub    $0x8,%esp
  2001f3:	50                   	push   %eax
  2001f4:	68 17 06 20 00       	push   $0x200617
  2001f9:	e8 fa 01 00 00       	call   2003f8 <printf>
  2001fe:	83 c4 10             	add    $0x10,%esp
  200201:	8b 45 08             	mov    0x8(%ebp),%eax
  200204:	83 ec 08             	sub    $0x8,%esp
  200207:	50                   	push   %eax
  200208:	68 17 06 20 00       	push   $0x200617
  20020d:	e8 e6 01 00 00       	call   2003f8 <printf>
  200212:	83 c4 10             	add    $0x10,%esp
  200215:	8b 45 08             	mov    0x8(%ebp),%eax
  200218:	6a 01                	push   $0x1
  20021a:	ff 75 0c             	pushl  0xc(%ebp)
  20021d:	50                   	push   %eax
  20021e:	6a 15                	push   $0x15
  200220:	e8 2c ff ff ff       	call   200151 <syscall>
  200225:	83 c4 10             	add    $0x10,%esp
  200228:	89 45 f4             	mov    %eax,-0xc(%ebp)
  20022b:	8b 45 08             	mov    0x8(%ebp),%eax
  20022e:	8b 00                	mov    (%eax),%eax
  200230:	83 ec 08             	sub    $0x8,%esp
  200233:	50                   	push   %eax
  200234:	68 17 06 20 00       	push   $0x200617
  200239:	e8 ba 01 00 00       	call   2003f8 <printf>
  20023e:	83 c4 10             	add    $0x10,%esp
  200241:	8b 45 08             	mov    0x8(%ebp),%eax
  200244:	83 ec 08             	sub    $0x8,%esp
  200247:	50                   	push   %eax
  200248:	68 17 06 20 00       	push   $0x200617
  20024d:	e8 a6 01 00 00       	call   2003f8 <printf>
  200252:	83 c4 10             	add    $0x10,%esp
  200255:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200258:	c9                   	leave  
  200259:	c3                   	ret    

0020025a <sem_post>:
  20025a:	55                   	push   %ebp
  20025b:	89 e5                	mov    %esp,%ebp
  20025d:	b8 01 00 00 00       	mov    $0x1,%eax
  200262:	5d                   	pop    %ebp
  200263:	c3                   	ret    

00200264 <sem_wait>:
  200264:	55                   	push   %ebp
  200265:	89 e5                	mov    %esp,%ebp
  200267:	b8 01 00 00 00       	mov    $0x1,%eax
  20026c:	5d                   	pop    %ebp
  20026d:	c3                   	ret    

0020026e <sem_destroy>:
  20026e:	55                   	push   %ebp
  20026f:	89 e5                	mov    %esp,%ebp
  200271:	b8 01 00 00 00       	mov    $0x1,%eax
  200276:	5d                   	pop    %ebp
  200277:	c3                   	ret    

00200278 <printd>:
  200278:	55                   	push   %ebp
  200279:	89 e5                	mov    %esp,%ebp
  20027b:	83 ec 78             	sub    $0x78,%esp
  20027e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200285:	8d 45 89             	lea    -0x77(%ebp),%eax
  200288:	83 c0 64             	add    $0x64,%eax
  20028b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20028e:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
  200292:	c6 45 ee 00          	movb   $0x0,-0x12(%ebp)
  200296:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  20029a:	79 17                	jns    2002b3 <printd+0x3b>
  20029c:	81 7d 08 00 00 00 80 	cmpl   $0x80000000,0x8(%ebp)
  2002a3:	75 07                	jne    2002ac <printd+0x34>
  2002a5:	ff 45 08             	incl   0x8(%ebp)
  2002a8:	c6 45 ee 01          	movb   $0x1,-0x12(%ebp)
  2002ac:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
  2002b0:	f7 5d 08             	negl   0x8(%ebp)
  2002b3:	ff 4d f0             	decl   -0x10(%ebp)
  2002b6:	8b 45 08             	mov    0x8(%ebp),%eax
  2002b9:	b9 0a 00 00 00       	mov    $0xa,%ecx
  2002be:	99                   	cltd   
  2002bf:	f7 f9                	idiv   %ecx
  2002c1:	89 d0                	mov    %edx,%eax
  2002c3:	83 c0 30             	add    $0x30,%eax
  2002c6:	88 c2                	mov    %al,%dl
  2002c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2002cb:	88 10                	mov    %dl,(%eax)
  2002cd:	ff 45 f4             	incl   -0xc(%ebp)
  2002d0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2002d3:	b8 67 66 66 66       	mov    $0x66666667,%eax
  2002d8:	f7 e9                	imul   %ecx
  2002da:	c1 fa 02             	sar    $0x2,%edx
  2002dd:	89 c8                	mov    %ecx,%eax
  2002df:	c1 f8 1f             	sar    $0x1f,%eax
  2002e2:	29 c2                	sub    %eax,%edx
  2002e4:	89 d0                	mov    %edx,%eax
  2002e6:	89 45 08             	mov    %eax,0x8(%ebp)
  2002e9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  2002ed:	75 c4                	jne    2002b3 <printd+0x3b>
  2002ef:	80 7d ef 01          	cmpb   $0x1,-0x11(%ebp)
  2002f3:	75 0c                	jne    200301 <printd+0x89>
  2002f5:	ff 4d f0             	decl   -0x10(%ebp)
  2002f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2002fb:	c6 00 2d             	movb   $0x2d,(%eax)
  2002fe:	ff 45 f4             	incl   -0xc(%ebp)
  200301:	80 7d ee 01          	cmpb   $0x1,-0x12(%ebp)
  200305:	75 07                	jne    20030e <printd+0x96>
  200307:	8a 45 a6             	mov    -0x5a(%ebp),%al
  20030a:	40                   	inc    %eax
  20030b:	88 45 a6             	mov    %al,-0x5a(%ebp)
  20030e:	c6 45 ed 00          	movb   $0x0,-0x13(%ebp)
  200312:	83 ec 0c             	sub    $0xc,%esp
  200315:	ff 75 f0             	pushl  -0x10(%ebp)
  200318:	e8 a4 00 00 00       	call   2003c1 <prints>
  20031d:	83 c4 10             	add    $0x10,%esp
  200320:	90                   	nop
  200321:	c9                   	leave  
  200322:	c3                   	ret    

00200323 <printx>:
  200323:	55                   	push   %ebp
  200324:	89 e5                	mov    %esp,%ebp
  200326:	83 ec 38             	sub    $0x38,%esp
  200329:	8d 45 d1             	lea    -0x2f(%ebp),%eax
  20032c:	83 c0 1e             	add    $0x1e,%eax
  20032f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  200332:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200339:	8b 45 08             	mov    0x8(%ebp),%eax
  20033c:	25 0f 00 00 80       	and    $0x8000000f,%eax
  200341:	85 c0                	test   %eax,%eax
  200343:	79 05                	jns    20034a <printx+0x27>
  200345:	48                   	dec    %eax
  200346:	83 c8 f0             	or     $0xfffffff0,%eax
  200349:	40                   	inc    %eax
  20034a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20034d:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
  200351:	7e 12                	jle    200365 <printx+0x42>
  200353:	ff 4d f4             	decl   -0xc(%ebp)
  200356:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200359:	83 c0 57             	add    $0x57,%eax
  20035c:	88 c2                	mov    %al,%dl
  20035e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200361:	88 10                	mov    %dl,(%eax)
  200363:	eb 10                	jmp    200375 <printx+0x52>
  200365:	ff 4d f4             	decl   -0xc(%ebp)
  200368:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20036b:	83 c0 30             	add    $0x30,%eax
  20036e:	88 c2                	mov    %al,%dl
  200370:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200373:	88 10                	mov    %dl,(%eax)
  200375:	8b 45 08             	mov    0x8(%ebp),%eax
  200378:	85 c0                	test   %eax,%eax
  20037a:	79 03                	jns    20037f <printx+0x5c>
  20037c:	83 c0 0f             	add    $0xf,%eax
  20037f:	c1 f8 04             	sar    $0x4,%eax
  200382:	89 45 08             	mov    %eax,0x8(%ebp)
  200385:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  200389:	75 ae                	jne    200339 <printx+0x16>
  20038b:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
  20038f:	83 ec 0c             	sub    $0xc,%esp
  200392:	ff 75 f4             	pushl  -0xc(%ebp)
  200395:	e8 27 00 00 00       	call   2003c1 <prints>
  20039a:	83 c4 10             	add    $0x10,%esp
  20039d:	90                   	nop
  20039e:	c9                   	leave  
  20039f:	c3                   	ret    

002003a0 <printc>:
  2003a0:	55                   	push   %ebp
  2003a1:	89 e5                	mov    %esp,%ebp
  2003a3:	83 ec 04             	sub    $0x4,%esp
  2003a6:	8b 45 08             	mov    0x8(%ebp),%eax
  2003a9:	88 45 fc             	mov    %al,-0x4(%ebp)
  2003ac:	8d 45 fc             	lea    -0x4(%ebp),%eax
  2003af:	6a 01                	push   $0x1
  2003b1:	50                   	push   %eax
  2003b2:	6a 01                	push   $0x1
  2003b4:	6a 04                	push   $0x4
  2003b6:	e8 96 fd ff ff       	call   200151 <syscall>
  2003bb:	83 c4 10             	add    $0x10,%esp
  2003be:	90                   	nop
  2003bf:	c9                   	leave  
  2003c0:	c3                   	ret    

002003c1 <prints>:
  2003c1:	55                   	push   %ebp
  2003c2:	89 e5                	mov    %esp,%ebp
  2003c4:	83 ec 10             	sub    $0x10,%esp
  2003c7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2003ce:	eb 03                	jmp    2003d3 <prints+0x12>
  2003d0:	ff 45 fc             	incl   -0x4(%ebp)
  2003d3:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2003d6:	8b 45 08             	mov    0x8(%ebp),%eax
  2003d9:	01 d0                	add    %edx,%eax
  2003db:	8a 00                	mov    (%eax),%al
  2003dd:	84 c0                	test   %al,%al
  2003df:	75 ef                	jne    2003d0 <prints+0xf>
  2003e1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2003e4:	8b 45 08             	mov    0x8(%ebp),%eax
  2003e7:	52                   	push   %edx
  2003e8:	50                   	push   %eax
  2003e9:	6a 01                	push   $0x1
  2003eb:	6a 04                	push   $0x4
  2003ed:	e8 5f fd ff ff       	call   200151 <syscall>
  2003f2:	83 c4 10             	add    $0x10,%esp
  2003f5:	90                   	nop
  2003f6:	c9                   	leave  
  2003f7:	c3                   	ret    

002003f8 <printf>:
  2003f8:	55                   	push   %ebp
  2003f9:	89 e5                	mov    %esp,%ebp
  2003fb:	83 ec 18             	sub    $0x18,%esp
  2003fe:	8d 45 0c             	lea    0xc(%ebp),%eax
  200401:	89 45 f4             	mov    %eax,-0xc(%ebp)
  200404:	8b 45 08             	mov    0x8(%ebp),%eax
  200407:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20040a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  200411:	e9 be 00 00 00       	jmp    2004d4 <printf+0xdc>
  200416:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200419:	8a 00                	mov    (%eax),%al
  20041b:	3c 25                	cmp    $0x25,%al
  20041d:	0f 85 9a 00 00 00    	jne    2004bd <printf+0xc5>
  200423:	ff 45 f0             	incl   -0x10(%ebp)
  200426:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200429:	8a 00                	mov    (%eax),%al
  20042b:	0f be c0             	movsbl %al,%eax
  20042e:	83 f8 64             	cmp    $0x64,%eax
  200431:	74 1e                	je     200451 <printf+0x59>
  200433:	83 f8 64             	cmp    $0x64,%eax
  200436:	7f 0a                	jg     200442 <printf+0x4a>
  200438:	83 f8 63             	cmp    $0x63,%eax
  20043b:	74 64                	je     2004a1 <printf+0xa9>
  20043d:	e9 8f 00 00 00       	jmp    2004d1 <printf+0xd9>
  200442:	83 f8 73             	cmp    $0x73,%eax
  200445:	74 41                	je     200488 <printf+0x90>
  200447:	83 f8 78             	cmp    $0x78,%eax
  20044a:	74 23                	je     20046f <printf+0x77>
  20044c:	e9 80 00 00 00       	jmp    2004d1 <printf+0xd9>
  200451:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200454:	8d 50 04             	lea    0x4(%eax),%edx
  200457:	89 55 f4             	mov    %edx,-0xc(%ebp)
  20045a:	8b 00                	mov    (%eax),%eax
  20045c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  20045f:	83 ec 0c             	sub    $0xc,%esp
  200462:	ff 75 ec             	pushl  -0x14(%ebp)
  200465:	e8 0e fe ff ff       	call   200278 <printd>
  20046a:	83 c4 10             	add    $0x10,%esp
  20046d:	eb 62                	jmp    2004d1 <printf+0xd9>
  20046f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200472:	8d 50 04             	lea    0x4(%eax),%edx
  200475:	89 55 f4             	mov    %edx,-0xc(%ebp)
  200478:	8b 00                	mov    (%eax),%eax
  20047a:	83 ec 0c             	sub    $0xc,%esp
  20047d:	50                   	push   %eax
  20047e:	e8 a0 fe ff ff       	call   200323 <printx>
  200483:	83 c4 10             	add    $0x10,%esp
  200486:	eb 49                	jmp    2004d1 <printf+0xd9>
  200488:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20048b:	8d 50 04             	lea    0x4(%eax),%edx
  20048e:	89 55 f4             	mov    %edx,-0xc(%ebp)
  200491:	8b 00                	mov    (%eax),%eax
  200493:	83 ec 0c             	sub    $0xc,%esp
  200496:	50                   	push   %eax
  200497:	e8 25 ff ff ff       	call   2003c1 <prints>
  20049c:	83 c4 10             	add    $0x10,%esp
  20049f:	eb 30                	jmp    2004d1 <printf+0xd9>
  2004a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2004a4:	8d 50 04             	lea    0x4(%eax),%edx
  2004a7:	89 55 f4             	mov    %edx,-0xc(%ebp)
  2004aa:	8b 00                	mov    (%eax),%eax
  2004ac:	0f be c0             	movsbl %al,%eax
  2004af:	83 ec 0c             	sub    $0xc,%esp
  2004b2:	50                   	push   %eax
  2004b3:	e8 e8 fe ff ff       	call   2003a0 <printc>
  2004b8:	83 c4 10             	add    $0x10,%esp
  2004bb:	eb 14                	jmp    2004d1 <printf+0xd9>
  2004bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2004c0:	8a 00                	mov    (%eax),%al
  2004c2:	0f be c0             	movsbl %al,%eax
  2004c5:	83 ec 0c             	sub    $0xc,%esp
  2004c8:	50                   	push   %eax
  2004c9:	e8 d2 fe ff ff       	call   2003a0 <printc>
  2004ce:	83 c4 10             	add    $0x10,%esp
  2004d1:	ff 45 f0             	incl   -0x10(%ebp)
  2004d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2004d7:	8a 00                	mov    (%eax),%al
  2004d9:	84 c0                	test   %al,%al
  2004db:	0f 85 35 ff ff ff    	jne    200416 <printf+0x1e>
  2004e1:	90                   	nop
  2004e2:	c9                   	leave  
  2004e3:	c3                   	ret    
