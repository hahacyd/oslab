
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	83 ec 18             	sub    $0x18,%esp
  200006:	83 ec 0c             	sub    $0xc,%esp
  200009:	68 f8 07 20 00       	push   $0x2007f8
  20000e:	e8 e4 03 00 00       	call   2003f7 <printf>
  200013:	83 c4 10             	add    $0x10,%esp
  200016:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
  20001d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200024:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
  20002b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  200032:	83 ec 0c             	sub    $0xc,%esp
  200035:	68 0c 08 20 00       	push   $0x20080c
  20003a:	e8 b8 03 00 00       	call   2003f7 <printf>
  20003f:	83 c4 10             	add    $0x10,%esp
  200042:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200045:	83 ec 08             	sub    $0x8,%esp
  200048:	50                   	push   %eax
  200049:	8d 45 e8             	lea    -0x18(%ebp),%eax
  20004c:	50                   	push   %eax
  20004d:	e8 9b 01 00 00       	call   2001ed <sem_init>
  200052:	83 c4 10             	add    $0x10,%esp
  200055:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200058:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  20005c:	75 15                	jne    200073 <uEntry+0x73>
  20005e:	83 ec 0c             	sub    $0xc,%esp
  200061:	68 38 08 20 00       	push   $0x200838
  200066:	e8 8c 03 00 00       	call   2003f7 <printf>
  20006b:	83 c4 10             	add    $0x10,%esp
  20006e:	e8 60 01 00 00       	call   2001d3 <exit>
  200073:	e8 0c 01 00 00       	call   200184 <fork>
  200078:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20007b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  20007f:	75 60                	jne    2000e1 <uEntry+0xe1>
  200081:	eb 32                	jmp    2000b5 <uEntry+0xb5>
  200083:	ff 4d f4             	decl   -0xc(%ebp)
  200086:	83 ec 0c             	sub    $0xc,%esp
  200089:	68 68 08 20 00       	push   $0x200868
  20008e:	e8 64 03 00 00       	call   2003f7 <printf>
  200093:	83 c4 10             	add    $0x10,%esp
  200096:	83 ec 0c             	sub    $0xc,%esp
  200099:	8d 45 e8             	lea    -0x18(%ebp),%eax
  20009c:	50                   	push   %eax
  20009d:	e8 83 01 00 00       	call   200225 <sem_wait>
  2000a2:	83 c4 10             	add    $0x10,%esp
  2000a5:	83 ec 0c             	sub    $0xc,%esp
  2000a8:	68 8c 08 20 00       	push   $0x20088c
  2000ad:	e8 45 03 00 00       	call   2003f7 <printf>
  2000b2:	83 c4 10             	add    $0x10,%esp
  2000b5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  2000b9:	75 c8                	jne    200083 <uEntry+0x83>
  2000bb:	83 ec 0c             	sub    $0xc,%esp
  2000be:	68 b0 08 20 00       	push   $0x2008b0
  2000c3:	e8 2f 03 00 00       	call   2003f7 <printf>
  2000c8:	83 c4 10             	add    $0x10,%esp
  2000cb:	83 ec 0c             	sub    $0xc,%esp
  2000ce:	8d 45 e8             	lea    -0x18(%ebp),%eax
  2000d1:	50                   	push   %eax
  2000d2:	e8 63 01 00 00       	call   20023a <sem_destroy>
  2000d7:	83 c4 10             	add    $0x10,%esp
  2000da:	e8 f4 00 00 00       	call   2001d3 <exit>
  2000df:	eb 74                	jmp    200155 <uEntry+0x155>
  2000e1:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  2000e5:	74 6e                	je     200155 <uEntry+0x155>
  2000e7:	eb 42                	jmp    20012b <uEntry+0x12b>
  2000e9:	ff 4d f4             	decl   -0xc(%ebp)
  2000ec:	83 ec 0c             	sub    $0xc,%esp
  2000ef:	68 d6 08 20 00       	push   $0x2008d6
  2000f4:	e8 fe 02 00 00       	call   2003f7 <printf>
  2000f9:	83 c4 10             	add    $0x10,%esp
  2000fc:	83 ec 0c             	sub    $0xc,%esp
  2000ff:	68 80 00 00 00       	push   $0x80
  200104:	e8 99 00 00 00       	call   2001a2 <sleep>
  200109:	83 c4 10             	add    $0x10,%esp
  20010c:	83 ec 0c             	sub    $0xc,%esp
  20010f:	68 f4 08 20 00       	push   $0x2008f4
  200114:	e8 de 02 00 00       	call   2003f7 <printf>
  200119:	83 c4 10             	add    $0x10,%esp
  20011c:	83 ec 0c             	sub    $0xc,%esp
  20011f:	8d 45 e8             	lea    -0x18(%ebp),%eax
  200122:	50                   	push   %eax
  200123:	e8 e6 00 00 00       	call   20020e <sem_post>
  200128:	83 c4 10             	add    $0x10,%esp
  20012b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  20012f:	75 b8                	jne    2000e9 <uEntry+0xe9>
  200131:	83 ec 0c             	sub    $0xc,%esp
  200134:	68 18 09 20 00       	push   $0x200918
  200139:	e8 b9 02 00 00       	call   2003f7 <printf>
  20013e:	83 c4 10             	add    $0x10,%esp
  200141:	83 ec 0c             	sub    $0xc,%esp
  200144:	8d 45 e8             	lea    -0x18(%ebp),%eax
  200147:	50                   	push   %eax
  200148:	e8 ed 00 00 00       	call   20023a <sem_destroy>
  20014d:	83 c4 10             	add    $0x10,%esp
  200150:	e8 7e 00 00 00       	call   2001d3 <exit>
  200155:	b8 00 00 00 00       	mov    $0x0,%eax
  20015a:	c9                   	leave  
  20015b:	c3                   	ret    

0020015c <syscall>:
  20015c:	55                   	push   %ebp
  20015d:	89 e5                	mov    %esp,%ebp
  20015f:	53                   	push   %ebx
  200160:	83 ec 10             	sub    $0x10,%esp
  200163:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  20016a:	8b 45 08             	mov    0x8(%ebp),%eax
  20016d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  200170:	8b 4d 10             	mov    0x10(%ebp),%ecx
  200173:	8b 55 14             	mov    0x14(%ebp),%edx
  200176:	cd 80                	int    $0x80
  200178:	89 45 f8             	mov    %eax,-0x8(%ebp)
  20017b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  20017e:	83 c4 10             	add    $0x10,%esp
  200181:	5b                   	pop    %ebx
  200182:	5d                   	pop    %ebp
  200183:	c3                   	ret    

00200184 <fork>:
  200184:	55                   	push   %ebp
  200185:	89 e5                	mov    %esp,%ebp
  200187:	83 ec 10             	sub    $0x10,%esp
  20018a:	6a 01                	push   $0x1
  20018c:	6a 01                	push   $0x1
  20018e:	6a 01                	push   $0x1
  200190:	6a 02                	push   $0x2
  200192:	e8 c5 ff ff ff       	call   20015c <syscall>
  200197:	83 c4 10             	add    $0x10,%esp
  20019a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20019d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2001a0:	c9                   	leave  
  2001a1:	c3                   	ret    

002001a2 <sleep>:
  2001a2:	55                   	push   %ebp
  2001a3:	89 e5                	mov    %esp,%ebp
  2001a5:	8b 45 08             	mov    0x8(%ebp),%eax
  2001a8:	6a 01                	push   $0x1
  2001aa:	6a 01                	push   $0x1
  2001ac:	50                   	push   %eax
  2001ad:	6a 08                	push   $0x8
  2001af:	e8 a8 ff ff ff       	call   20015c <syscall>
  2001b4:	83 c4 10             	add    $0x10,%esp
  2001b7:	b8 00 00 00 00       	mov    $0x0,%eax
  2001bc:	c9                   	leave  
  2001bd:	c3                   	ret    

002001be <getpid>:
  2001be:	55                   	push   %ebp
  2001bf:	89 e5                	mov    %esp,%ebp
  2001c1:	6a 01                	push   $0x1
  2001c3:	6a 01                	push   $0x1
  2001c5:	6a 01                	push   $0x1
  2001c7:	6a 07                	push   $0x7
  2001c9:	e8 8e ff ff ff       	call   20015c <syscall>
  2001ce:	83 c4 10             	add    $0x10,%esp
  2001d1:	c9                   	leave  
  2001d2:	c3                   	ret    

002001d3 <exit>:
  2001d3:	55                   	push   %ebp
  2001d4:	89 e5                	mov    %esp,%ebp
  2001d6:	6a 00                	push   $0x0
  2001d8:	6a 00                	push   $0x0
  2001da:	6a 00                	push   $0x0
  2001dc:	6a 01                	push   $0x1
  2001de:	e8 79 ff ff ff       	call   20015c <syscall>
  2001e3:	83 c4 10             	add    $0x10,%esp
  2001e6:	b8 00 00 00 00       	mov    $0x0,%eax
  2001eb:	c9                   	leave  
  2001ec:	c3                   	ret    

002001ed <sem_init>:
  2001ed:	55                   	push   %ebp
  2001ee:	89 e5                	mov    %esp,%ebp
  2001f0:	83 ec 10             	sub    $0x10,%esp
  2001f3:	8b 45 08             	mov    0x8(%ebp),%eax
  2001f6:	6a 01                	push   $0x1
  2001f8:	ff 75 0c             	pushl  0xc(%ebp)
  2001fb:	50                   	push   %eax
  2001fc:	6a 15                	push   $0x15
  2001fe:	e8 59 ff ff ff       	call   20015c <syscall>
  200203:	83 c4 10             	add    $0x10,%esp
  200206:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200209:	8b 45 fc             	mov    -0x4(%ebp),%eax
  20020c:	c9                   	leave  
  20020d:	c3                   	ret    

0020020e <sem_post>:
  20020e:	55                   	push   %ebp
  20020f:	89 e5                	mov    %esp,%ebp
  200211:	8b 45 08             	mov    0x8(%ebp),%eax
  200214:	6a 01                	push   $0x1
  200216:	6a 01                	push   $0x1
  200218:	50                   	push   %eax
  200219:	6a 17                	push   $0x17
  20021b:	e8 3c ff ff ff       	call   20015c <syscall>
  200220:	83 c4 10             	add    $0x10,%esp
  200223:	c9                   	leave  
  200224:	c3                   	ret    

00200225 <sem_wait>:
  200225:	55                   	push   %ebp
  200226:	89 e5                	mov    %esp,%ebp
  200228:	6a 01                	push   $0x1
  20022a:	6a 01                	push   $0x1
  20022c:	6a 01                	push   $0x1
  20022e:	6a 16                	push   $0x16
  200230:	e8 27 ff ff ff       	call   20015c <syscall>
  200235:	83 c4 10             	add    $0x10,%esp
  200238:	c9                   	leave  
  200239:	c3                   	ret    

0020023a <sem_destroy>:
  20023a:	55                   	push   %ebp
  20023b:	89 e5                	mov    %esp,%ebp
  20023d:	8b 45 08             	mov    0x8(%ebp),%eax
  200240:	6a 01                	push   $0x1
  200242:	6a 01                	push   $0x1
  200244:	50                   	push   %eax
  200245:	6a 18                	push   $0x18
  200247:	e8 10 ff ff ff       	call   20015c <syscall>
  20024c:	83 c4 10             	add    $0x10,%esp
  20024f:	c9                   	leave  
  200250:	c3                   	ret    

00200251 <printd>:
  200251:	55                   	push   %ebp
  200252:	89 e5                	mov    %esp,%ebp
  200254:	83 ec 78             	sub    $0x78,%esp
  200257:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20025e:	8d 45 89             	lea    -0x77(%ebp),%eax
  200261:	83 c0 64             	add    $0x64,%eax
  200264:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200267:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
  20026b:	c6 45 ee 00          	movb   $0x0,-0x12(%ebp)
  20026f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  200273:	79 17                	jns    20028c <printd+0x3b>
  200275:	81 7d 08 00 00 00 80 	cmpl   $0x80000000,0x8(%ebp)
  20027c:	75 07                	jne    200285 <printd+0x34>
  20027e:	ff 45 08             	incl   0x8(%ebp)
  200281:	c6 45 ee 01          	movb   $0x1,-0x12(%ebp)
  200285:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
  200289:	f7 5d 08             	negl   0x8(%ebp)
  20028c:	ff 4d f0             	decl   -0x10(%ebp)
  20028f:	8b 45 08             	mov    0x8(%ebp),%eax
  200292:	b9 0a 00 00 00       	mov    $0xa,%ecx
  200297:	99                   	cltd   
  200298:	f7 f9                	idiv   %ecx
  20029a:	89 d0                	mov    %edx,%eax
  20029c:	83 c0 30             	add    $0x30,%eax
  20029f:	88 c2                	mov    %al,%dl
  2002a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2002a4:	88 10                	mov    %dl,(%eax)
  2002a6:	ff 45 f4             	incl   -0xc(%ebp)
  2002a9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2002ac:	b8 67 66 66 66       	mov    $0x66666667,%eax
  2002b1:	f7 e9                	imul   %ecx
  2002b3:	c1 fa 02             	sar    $0x2,%edx
  2002b6:	89 c8                	mov    %ecx,%eax
  2002b8:	c1 f8 1f             	sar    $0x1f,%eax
  2002bb:	29 c2                	sub    %eax,%edx
  2002bd:	89 d0                	mov    %edx,%eax
  2002bf:	89 45 08             	mov    %eax,0x8(%ebp)
  2002c2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  2002c6:	75 c4                	jne    20028c <printd+0x3b>
  2002c8:	80 7d ef 01          	cmpb   $0x1,-0x11(%ebp)
  2002cc:	75 0c                	jne    2002da <printd+0x89>
  2002ce:	ff 4d f0             	decl   -0x10(%ebp)
  2002d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2002d4:	c6 00 2d             	movb   $0x2d,(%eax)
  2002d7:	ff 45 f4             	incl   -0xc(%ebp)
  2002da:	80 7d ee 01          	cmpb   $0x1,-0x12(%ebp)
  2002de:	75 07                	jne    2002e7 <printd+0x96>
  2002e0:	8a 45 a6             	mov    -0x5a(%ebp),%al
  2002e3:	40                   	inc    %eax
  2002e4:	88 45 a6             	mov    %al,-0x5a(%ebp)
  2002e7:	c6 45 ed 00          	movb   $0x0,-0x13(%ebp)
  2002eb:	83 ec 0c             	sub    $0xc,%esp
  2002ee:	ff 75 f0             	pushl  -0x10(%ebp)
  2002f1:	e8 ca 00 00 00       	call   2003c0 <prints>
  2002f6:	83 c4 10             	add    $0x10,%esp
  2002f9:	90                   	nop
  2002fa:	c9                   	leave  
  2002fb:	c3                   	ret    

002002fc <printx>:
  2002fc:	55                   	push   %ebp
  2002fd:	89 e5                	mov    %esp,%ebp
  2002ff:	83 ec 38             	sub    $0x38,%esp
  200302:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200309:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  20030d:	79 0a                	jns    200319 <printx+0x1d>
  20030f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  200316:	f7 5d 08             	negl   0x8(%ebp)
  200319:	8d 45 cd             	lea    -0x33(%ebp),%eax
  20031c:	83 c0 1e             	add    $0x1e,%eax
  20031f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200322:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  200329:	8b 45 08             	mov    0x8(%ebp),%eax
  20032c:	25 0f 00 00 80       	and    $0x8000000f,%eax
  200331:	85 c0                	test   %eax,%eax
  200333:	79 05                	jns    20033a <printx+0x3e>
  200335:	48                   	dec    %eax
  200336:	83 c8 f0             	or     $0xfffffff0,%eax
  200339:	40                   	inc    %eax
  20033a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  20033d:	83 7d ec 09          	cmpl   $0x9,-0x14(%ebp)
  200341:	7e 12                	jle    200355 <printx+0x59>
  200343:	ff 4d f0             	decl   -0x10(%ebp)
  200346:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200349:	83 c0 57             	add    $0x57,%eax
  20034c:	88 c2                	mov    %al,%dl
  20034e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200351:	88 10                	mov    %dl,(%eax)
  200353:	eb 10                	jmp    200365 <printx+0x69>
  200355:	ff 4d f0             	decl   -0x10(%ebp)
  200358:	8b 45 ec             	mov    -0x14(%ebp),%eax
  20035b:	83 c0 30             	add    $0x30,%eax
  20035e:	88 c2                	mov    %al,%dl
  200360:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200363:	88 10                	mov    %dl,(%eax)
  200365:	8b 45 08             	mov    0x8(%ebp),%eax
  200368:	85 c0                	test   %eax,%eax
  20036a:	79 03                	jns    20036f <printx+0x73>
  20036c:	83 c0 0f             	add    $0xf,%eax
  20036f:	c1 f8 04             	sar    $0x4,%eax
  200372:	89 45 08             	mov    %eax,0x8(%ebp)
  200375:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  200379:	75 ae                	jne    200329 <printx+0x2d>
  20037b:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
  20037f:	75 09                	jne    20038a <printx+0x8e>
  200381:	ff 4d f0             	decl   -0x10(%ebp)
  200384:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200387:	c6 00 2d             	movb   $0x2d,(%eax)
  20038a:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
  20038e:	83 ec 0c             	sub    $0xc,%esp
  200391:	ff 75 f0             	pushl  -0x10(%ebp)
  200394:	e8 27 00 00 00       	call   2003c0 <prints>
  200399:	83 c4 10             	add    $0x10,%esp
  20039c:	90                   	nop
  20039d:	c9                   	leave  
  20039e:	c3                   	ret    

0020039f <printc>:
  20039f:	55                   	push   %ebp
  2003a0:	89 e5                	mov    %esp,%ebp
  2003a2:	83 ec 04             	sub    $0x4,%esp
  2003a5:	8b 45 08             	mov    0x8(%ebp),%eax
  2003a8:	88 45 fc             	mov    %al,-0x4(%ebp)
  2003ab:	8d 45 fc             	lea    -0x4(%ebp),%eax
  2003ae:	6a 01                	push   $0x1
  2003b0:	50                   	push   %eax
  2003b1:	6a 01                	push   $0x1
  2003b3:	6a 04                	push   $0x4
  2003b5:	e8 a2 fd ff ff       	call   20015c <syscall>
  2003ba:	83 c4 10             	add    $0x10,%esp
  2003bd:	90                   	nop
  2003be:	c9                   	leave  
  2003bf:	c3                   	ret    

002003c0 <prints>:
  2003c0:	55                   	push   %ebp
  2003c1:	89 e5                	mov    %esp,%ebp
  2003c3:	83 ec 10             	sub    $0x10,%esp
  2003c6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2003cd:	eb 03                	jmp    2003d2 <prints+0x12>
  2003cf:	ff 45 fc             	incl   -0x4(%ebp)
  2003d2:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2003d5:	8b 45 08             	mov    0x8(%ebp),%eax
  2003d8:	01 d0                	add    %edx,%eax
  2003da:	8a 00                	mov    (%eax),%al
  2003dc:	84 c0                	test   %al,%al
  2003de:	75 ef                	jne    2003cf <prints+0xf>
  2003e0:	8b 55 fc             	mov    -0x4(%ebp),%edx
  2003e3:	8b 45 08             	mov    0x8(%ebp),%eax
  2003e6:	52                   	push   %edx
  2003e7:	50                   	push   %eax
  2003e8:	6a 01                	push   $0x1
  2003ea:	6a 04                	push   $0x4
  2003ec:	e8 6b fd ff ff       	call   20015c <syscall>
  2003f1:	83 c4 10             	add    $0x10,%esp
  2003f4:	90                   	nop
  2003f5:	c9                   	leave  
  2003f6:	c3                   	ret    

002003f7 <printf>:
  2003f7:	55                   	push   %ebp
  2003f8:	89 e5                	mov    %esp,%ebp
  2003fa:	83 ec 18             	sub    $0x18,%esp
  2003fd:	8d 45 0c             	lea    0xc(%ebp),%eax
  200400:	89 45 f4             	mov    %eax,-0xc(%ebp)
  200403:	8b 45 08             	mov    0x8(%ebp),%eax
  200406:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200409:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  200410:	e9 be 00 00 00       	jmp    2004d3 <printf+0xdc>
  200415:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200418:	8a 00                	mov    (%eax),%al
  20041a:	3c 25                	cmp    $0x25,%al
  20041c:	0f 85 9a 00 00 00    	jne    2004bc <printf+0xc5>
  200422:	ff 45 f0             	incl   -0x10(%ebp)
  200425:	8b 45 f0             	mov    -0x10(%ebp),%eax
  200428:	8a 00                	mov    (%eax),%al
  20042a:	0f be c0             	movsbl %al,%eax
  20042d:	83 f8 64             	cmp    $0x64,%eax
  200430:	74 1e                	je     200450 <printf+0x59>
  200432:	83 f8 64             	cmp    $0x64,%eax
  200435:	7f 0a                	jg     200441 <printf+0x4a>
  200437:	83 f8 63             	cmp    $0x63,%eax
  20043a:	74 64                	je     2004a0 <printf+0xa9>
  20043c:	e9 8f 00 00 00       	jmp    2004d0 <printf+0xd9>
  200441:	83 f8 73             	cmp    $0x73,%eax
  200444:	74 41                	je     200487 <printf+0x90>
  200446:	83 f8 78             	cmp    $0x78,%eax
  200449:	74 23                	je     20046e <printf+0x77>
  20044b:	e9 80 00 00 00       	jmp    2004d0 <printf+0xd9>
  200450:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200453:	8d 50 04             	lea    0x4(%eax),%edx
  200456:	89 55 f4             	mov    %edx,-0xc(%ebp)
  200459:	8b 00                	mov    (%eax),%eax
  20045b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  20045e:	83 ec 0c             	sub    $0xc,%esp
  200461:	ff 75 ec             	pushl  -0x14(%ebp)
  200464:	e8 e8 fd ff ff       	call   200251 <printd>
  200469:	83 c4 10             	add    $0x10,%esp
  20046c:	eb 62                	jmp    2004d0 <printf+0xd9>
  20046e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200471:	8d 50 04             	lea    0x4(%eax),%edx
  200474:	89 55 f4             	mov    %edx,-0xc(%ebp)
  200477:	8b 00                	mov    (%eax),%eax
  200479:	83 ec 0c             	sub    $0xc,%esp
  20047c:	50                   	push   %eax
  20047d:	e8 7a fe ff ff       	call   2002fc <printx>
  200482:	83 c4 10             	add    $0x10,%esp
  200485:	eb 49                	jmp    2004d0 <printf+0xd9>
  200487:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20048a:	8d 50 04             	lea    0x4(%eax),%edx
  20048d:	89 55 f4             	mov    %edx,-0xc(%ebp)
  200490:	8b 00                	mov    (%eax),%eax
  200492:	83 ec 0c             	sub    $0xc,%esp
  200495:	50                   	push   %eax
  200496:	e8 25 ff ff ff       	call   2003c0 <prints>
  20049b:	83 c4 10             	add    $0x10,%esp
  20049e:	eb 30                	jmp    2004d0 <printf+0xd9>
  2004a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2004a3:	8d 50 04             	lea    0x4(%eax),%edx
  2004a6:	89 55 f4             	mov    %edx,-0xc(%ebp)
  2004a9:	8b 00                	mov    (%eax),%eax
  2004ab:	0f be c0             	movsbl %al,%eax
  2004ae:	83 ec 0c             	sub    $0xc,%esp
  2004b1:	50                   	push   %eax
  2004b2:	e8 e8 fe ff ff       	call   20039f <printc>
  2004b7:	83 c4 10             	add    $0x10,%esp
  2004ba:	eb 14                	jmp    2004d0 <printf+0xd9>
  2004bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2004bf:	8a 00                	mov    (%eax),%al
  2004c1:	0f be c0             	movsbl %al,%eax
  2004c4:	83 ec 0c             	sub    $0xc,%esp
  2004c7:	50                   	push   %eax
  2004c8:	e8 d2 fe ff ff       	call   20039f <printc>
  2004cd:	83 c4 10             	add    $0x10,%esp
  2004d0:	ff 45 f0             	incl   -0x10(%ebp)
  2004d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2004d6:	8a 00                	mov    (%eax),%al
  2004d8:	84 c0                	test   %al,%al
  2004da:	0f 85 35 ff ff ff    	jne    200415 <printf+0x1e>
  2004e0:	90                   	nop
  2004e1:	c9                   	leave  
  2004e2:	c3                   	ret    

002004e3 <gets>:
  2004e3:	55                   	push   %ebp
  2004e4:	89 e5                	mov    %esp,%ebp
  2004e6:	8b 45 08             	mov    0x8(%ebp),%eax
  2004e9:	68 00 08 00 00       	push   $0x800
  2004ee:	50                   	push   %eax
  2004ef:	6a 00                	push   $0x0
  2004f1:	6a 03                	push   $0x3
  2004f3:	e8 64 fc ff ff       	call   20015c <syscall>
  2004f8:	83 c4 10             	add    $0x10,%esp
  2004fb:	c9                   	leave  
  2004fc:	c3                   	ret    

002004fd <getchar>:
  2004fd:	55                   	push   %ebp
  2004fe:	89 e5                	mov    %esp,%ebp
  200500:	83 ec 10             	sub    $0x10,%esp
  200503:	8d 45 fb             	lea    -0x5(%ebp),%eax
  200506:	6a 01                	push   $0x1
  200508:	50                   	push   %eax
  200509:	6a 00                	push   $0x0
  20050b:	6a 03                	push   $0x3
  20050d:	e8 4a fc ff ff       	call   20015c <syscall>
  200512:	83 c4 10             	add    $0x10,%esp
  200515:	8a 45 fb             	mov    -0x5(%ebp),%al
  200518:	c9                   	leave  
  200519:	c3                   	ret    

0020051a <scanfd>:
  20051a:	55                   	push   %ebp
  20051b:	89 e5                	mov    %esp,%ebp
  20051d:	83 ec 10             	sub    $0x10,%esp
  200520:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200527:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  20052e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200535:	8b 45 08             	mov    0x8(%ebp),%eax
  200538:	8a 00                	mov    (%eax),%al
  20053a:	3c 2d                	cmp    $0x2d,%al
  20053c:	75 32                	jne    200570 <scanfd+0x56>
  20053e:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%ebp)
  200545:	ff 45 08             	incl   0x8(%ebp)
  200548:	ff 45 f4             	incl   -0xc(%ebp)
  20054b:	eb 23                	jmp    200570 <scanfd+0x56>
  20054d:	8b 55 fc             	mov    -0x4(%ebp),%edx
  200550:	89 d0                	mov    %edx,%eax
  200552:	c1 e0 02             	shl    $0x2,%eax
  200555:	01 d0                	add    %edx,%eax
  200557:	01 c0                	add    %eax,%eax
  200559:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20055c:	8b 45 08             	mov    0x8(%ebp),%eax
  20055f:	8a 00                	mov    (%eax),%al
  200561:	0f be c0             	movsbl %al,%eax
  200564:	83 e8 30             	sub    $0x30,%eax
  200567:	01 45 fc             	add    %eax,-0x4(%ebp)
  20056a:	ff 45 08             	incl   0x8(%ebp)
  20056d:	ff 45 f4             	incl   -0xc(%ebp)
  200570:	8b 45 08             	mov    0x8(%ebp),%eax
  200573:	8a 00                	mov    (%eax),%al
  200575:	3c 20                	cmp    $0x20,%al
  200577:	74 09                	je     200582 <scanfd+0x68>
  200579:	8b 45 08             	mov    0x8(%ebp),%eax
  20057c:	8a 00                	mov    (%eax),%al
  20057e:	84 c0                	test   %al,%al
  200580:	75 cb                	jne    20054d <scanfd+0x33>
  200582:	83 7d f8 01          	cmpl   $0x1,-0x8(%ebp)
  200586:	75 07                	jne    20058f <scanfd+0x75>
  200588:	8b 45 fc             	mov    -0x4(%ebp),%eax
  20058b:	f7 d8                	neg    %eax
  20058d:	eb 03                	jmp    200592 <scanfd+0x78>
  20058f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200592:	8b 55 0c             	mov    0xc(%ebp),%edx
  200595:	89 02                	mov    %eax,(%edx)
  200597:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20059a:	c9                   	leave  
  20059b:	c3                   	ret    

0020059c <scanfx>:
  20059c:	55                   	push   %ebp
  20059d:	89 e5                	mov    %esp,%ebp
  20059f:	83 ec 10             	sub    $0x10,%esp
  2005a2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2005a9:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2005b0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2005b7:	8b 45 08             	mov    0x8(%ebp),%eax
  2005ba:	8a 00                	mov    (%eax),%al
  2005bc:	3c 2d                	cmp    $0x2d,%al
  2005be:	75 5b                	jne    20061b <scanfx+0x7f>
  2005c0:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%ebp)
  2005c7:	ff 45 08             	incl   0x8(%ebp)
  2005ca:	ff 45 f4             	incl   -0xc(%ebp)
  2005cd:	eb 4c                	jmp    20061b <scanfx+0x7f>
  2005cf:	c1 65 fc 04          	shll   $0x4,-0x4(%ebp)
  2005d3:	8b 45 08             	mov    0x8(%ebp),%eax
  2005d6:	8a 00                	mov    (%eax),%al
  2005d8:	3c 66                	cmp    $0x66,%al
  2005da:	7f 19                	jg     2005f5 <scanfx+0x59>
  2005dc:	8b 45 08             	mov    0x8(%ebp),%eax
  2005df:	8a 00                	mov    (%eax),%al
  2005e1:	3c 60                	cmp    $0x60,%al
  2005e3:	7e 10                	jle    2005f5 <scanfx+0x59>
  2005e5:	8b 45 08             	mov    0x8(%ebp),%eax
  2005e8:	8a 00                	mov    (%eax),%al
  2005ea:	0f be c0             	movsbl %al,%eax
  2005ed:	83 e8 57             	sub    $0x57,%eax
  2005f0:	01 45 fc             	add    %eax,-0x4(%ebp)
  2005f3:	eb 20                	jmp    200615 <scanfx+0x79>
  2005f5:	8b 45 08             	mov    0x8(%ebp),%eax
  2005f8:	8a 00                	mov    (%eax),%al
  2005fa:	3c 39                	cmp    $0x39,%al
  2005fc:	7f 17                	jg     200615 <scanfx+0x79>
  2005fe:	8b 45 08             	mov    0x8(%ebp),%eax
  200601:	8a 00                	mov    (%eax),%al
  200603:	3c 2f                	cmp    $0x2f,%al
  200605:	7e 0e                	jle    200615 <scanfx+0x79>
  200607:	8b 45 08             	mov    0x8(%ebp),%eax
  20060a:	8a 00                	mov    (%eax),%al
  20060c:	0f be c0             	movsbl %al,%eax
  20060f:	83 e8 30             	sub    $0x30,%eax
  200612:	01 45 fc             	add    %eax,-0x4(%ebp)
  200615:	ff 45 08             	incl   0x8(%ebp)
  200618:	ff 45 f4             	incl   -0xc(%ebp)
  20061b:	8b 45 08             	mov    0x8(%ebp),%eax
  20061e:	8a 00                	mov    (%eax),%al
  200620:	3c 20                	cmp    $0x20,%al
  200622:	74 09                	je     20062d <scanfx+0x91>
  200624:	8b 45 08             	mov    0x8(%ebp),%eax
  200627:	8a 00                	mov    (%eax),%al
  200629:	84 c0                	test   %al,%al
  20062b:	75 a2                	jne    2005cf <scanfx+0x33>
  20062d:	83 7d f8 01          	cmpl   $0x1,-0x8(%ebp)
  200631:	75 03                	jne    200636 <scanfx+0x9a>
  200633:	f7 5d fc             	negl   -0x4(%ebp)
  200636:	8b 45 0c             	mov    0xc(%ebp),%eax
  200639:	8b 55 fc             	mov    -0x4(%ebp),%edx
  20063c:	89 10                	mov    %edx,(%eax)
  20063e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200641:	c9                   	leave  
  200642:	c3                   	ret    

00200643 <scanfs>:
  200643:	55                   	push   %ebp
  200644:	89 e5                	mov    %esp,%ebp
  200646:	83 ec 10             	sub    $0x10,%esp
  200649:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200650:	eb 19                	jmp    20066b <scanfs+0x28>
  200652:	8b 45 0c             	mov    0xc(%ebp),%eax
  200655:	8d 50 01             	lea    0x1(%eax),%edx
  200658:	89 55 0c             	mov    %edx,0xc(%ebp)
  20065b:	8b 55 08             	mov    0x8(%ebp),%edx
  20065e:	8d 4a 01             	lea    0x1(%edx),%ecx
  200661:	89 4d 08             	mov    %ecx,0x8(%ebp)
  200664:	8a 12                	mov    (%edx),%dl
  200666:	88 10                	mov    %dl,(%eax)
  200668:	ff 45 fc             	incl   -0x4(%ebp)
  20066b:	8b 45 08             	mov    0x8(%ebp),%eax
  20066e:	8a 00                	mov    (%eax),%al
  200670:	3c 20                	cmp    $0x20,%al
  200672:	74 09                	je     20067d <scanfs+0x3a>
  200674:	8b 45 08             	mov    0x8(%ebp),%eax
  200677:	8a 00                	mov    (%eax),%al
  200679:	84 c0                	test   %al,%al
  20067b:	75 d5                	jne    200652 <scanfs+0xf>
  20067d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200680:	c9                   	leave  
  200681:	c3                   	ret    

00200682 <scanfc>:
  200682:	55                   	push   %ebp
  200683:	89 e5                	mov    %esp,%ebp
  200685:	8b 45 08             	mov    0x8(%ebp),%eax
  200688:	8a 10                	mov    (%eax),%dl
  20068a:	8b 45 0c             	mov    0xc(%ebp),%eax
  20068d:	88 10                	mov    %dl,(%eax)
  20068f:	b8 01 00 00 00       	mov    $0x1,%eax
  200694:	5d                   	pop    %ebp
  200695:	c3                   	ret    

00200696 <scanf>:
  200696:	55                   	push   %ebp
  200697:	89 e5                	mov    %esp,%ebp
  200699:	81 ec 10 08 00 00    	sub    $0x810,%esp
  20069f:	8d 85 f0 f7 ff ff    	lea    -0x810(%ebp),%eax
  2006a5:	50                   	push   %eax
  2006a6:	e8 38 fe ff ff       	call   2004e3 <gets>
  2006ab:	83 c4 04             	add    $0x4,%esp
  2006ae:	8d 45 0c             	lea    0xc(%ebp),%eax
  2006b1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2006b4:	8b 45 08             	mov    0x8(%ebp),%eax
  2006b7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  2006ba:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2006c1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2006c8:	e9 10 01 00 00       	jmp    2007dd <scanf+0x147>
  2006cd:	8b 55 f8             	mov    -0x8(%ebp),%edx
  2006d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2006d3:	01 d0                	add    %edx,%eax
  2006d5:	8a 00                	mov    (%eax),%al
  2006d7:	3c 25                	cmp    $0x25,%al
  2006d9:	0f 85 d6 00 00 00    	jne    2007b5 <scanf+0x11f>
  2006df:	ff 45 f8             	incl   -0x8(%ebp)
  2006e2:	8b 55 f8             	mov    -0x8(%ebp),%edx
  2006e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2006e8:	01 d0                	add    %edx,%eax
  2006ea:	8a 00                	mov    (%eax),%al
  2006ec:	0f be c0             	movsbl %al,%eax
  2006ef:	83 f8 64             	cmp    $0x64,%eax
  2006f2:	74 22                	je     200716 <scanf+0x80>
  2006f4:	83 f8 64             	cmp    $0x64,%eax
  2006f7:	7f 0e                	jg     200707 <scanf+0x71>
  2006f9:	83 f8 63             	cmp    $0x63,%eax
  2006fc:	0f 84 8c 00 00 00    	je     20078e <scanf+0xf8>
  200702:	e9 d3 00 00 00       	jmp    2007da <scanf+0x144>
  200707:	83 f8 73             	cmp    $0x73,%eax
  20070a:	74 5b                	je     200767 <scanf+0xd1>
  20070c:	83 f8 78             	cmp    $0x78,%eax
  20070f:	74 2f                	je     200740 <scanf+0xaa>
  200711:	e9 c4 00 00 00       	jmp    2007da <scanf+0x144>
  200716:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200719:	8d 50 04             	lea    0x4(%eax),%edx
  20071c:	89 55 fc             	mov    %edx,-0x4(%ebp)
  20071f:	8b 00                	mov    (%eax),%eax
  200721:	89 c2                	mov    %eax,%edx
  200723:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200726:	8d 8d f0 f7 ff ff    	lea    -0x810(%ebp),%ecx
  20072c:	01 c8                	add    %ecx,%eax
  20072e:	52                   	push   %edx
  20072f:	50                   	push   %eax
  200730:	e8 e5 fd ff ff       	call   20051a <scanfd>
  200735:	83 c4 08             	add    $0x8,%esp
  200738:	01 45 f4             	add    %eax,-0xc(%ebp)
  20073b:	e9 9a 00 00 00       	jmp    2007da <scanf+0x144>
  200740:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200743:	8d 50 04             	lea    0x4(%eax),%edx
  200746:	89 55 fc             	mov    %edx,-0x4(%ebp)
  200749:	8b 00                	mov    (%eax),%eax
  20074b:	89 c2                	mov    %eax,%edx
  20074d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200750:	8d 8d f0 f7 ff ff    	lea    -0x810(%ebp),%ecx
  200756:	01 c8                	add    %ecx,%eax
  200758:	52                   	push   %edx
  200759:	50                   	push   %eax
  20075a:	e8 3d fe ff ff       	call   20059c <scanfx>
  20075f:	83 c4 08             	add    $0x8,%esp
  200762:	01 45 f4             	add    %eax,-0xc(%ebp)
  200765:	eb 73                	jmp    2007da <scanf+0x144>
  200767:	8b 45 fc             	mov    -0x4(%ebp),%eax
  20076a:	8d 50 04             	lea    0x4(%eax),%edx
  20076d:	89 55 fc             	mov    %edx,-0x4(%ebp)
  200770:	8b 00                	mov    (%eax),%eax
  200772:	89 c2                	mov    %eax,%edx
  200774:	8b 45 f4             	mov    -0xc(%ebp),%eax
  200777:	8d 8d f0 f7 ff ff    	lea    -0x810(%ebp),%ecx
  20077d:	01 c8                	add    %ecx,%eax
  20077f:	52                   	push   %edx
  200780:	50                   	push   %eax
  200781:	e8 bd fe ff ff       	call   200643 <scanfs>
  200786:	83 c4 08             	add    $0x8,%esp
  200789:	01 45 f4             	add    %eax,-0xc(%ebp)
  20078c:	eb 4c                	jmp    2007da <scanf+0x144>
  20078e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200791:	8d 50 04             	lea    0x4(%eax),%edx
  200794:	89 55 fc             	mov    %edx,-0x4(%ebp)
  200797:	8b 00                	mov    (%eax),%eax
  200799:	89 c2                	mov    %eax,%edx
  20079b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20079e:	8d 8d f0 f7 ff ff    	lea    -0x810(%ebp),%ecx
  2007a4:	01 c8                	add    %ecx,%eax
  2007a6:	52                   	push   %edx
  2007a7:	50                   	push   %eax
  2007a8:	e8 d5 fe ff ff       	call   200682 <scanfc>
  2007ad:	83 c4 08             	add    $0x8,%esp
  2007b0:	01 45 f4             	add    %eax,-0xc(%ebp)
  2007b3:	eb 25                	jmp    2007da <scanf+0x144>
  2007b5:	8b 55 f8             	mov    -0x8(%ebp),%edx
  2007b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2007bb:	01 d0                	add    %edx,%eax
  2007bd:	8a 10                	mov    (%eax),%dl
  2007bf:	8d 8d f0 f7 ff ff    	lea    -0x810(%ebp),%ecx
  2007c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2007c8:	01 c8                	add    %ecx,%eax
  2007ca:	8a 00                	mov    (%eax),%al
  2007cc:	38 c2                	cmp    %al,%dl
  2007ce:	74 07                	je     2007d7 <scanf+0x141>
  2007d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  2007d5:	eb 1d                	jmp    2007f4 <scanf+0x15e>
  2007d7:	ff 45 f4             	incl   -0xc(%ebp)
  2007da:	ff 45 f8             	incl   -0x8(%ebp)
  2007dd:	8b 55 f8             	mov    -0x8(%ebp),%edx
  2007e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2007e3:	01 d0                	add    %edx,%eax
  2007e5:	8a 00                	mov    (%eax),%al
  2007e7:	84 c0                	test   %al,%al
  2007e9:	0f 85 de fe ff ff    	jne    2006cd <scanf+0x37>
  2007ef:	b8 01 00 00 00       	mov    $0x1,%eax
  2007f4:	c9                   	leave  
  2007f5:	c3                   	ret    
