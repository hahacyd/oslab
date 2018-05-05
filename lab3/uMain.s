
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	83 ec 10             	sub    $0x10,%esp
  200006:	6a 00                	push   $0x0
  200008:	6a 00                	push   $0x0
  20000a:	6a 16                	push   $0x16
  20000c:	68 c4 05 20 00       	push   $0x2005c4
  200011:	6a 01                	push   $0x1
  200013:	6a 04                	push   $0x4
  200015:	e8 5e 00 00 00       	call   200078 <syscall>
  20001a:	83 c4 20             	add    $0x20,%esp
  20001d:	e8 7a 00 00 00       	call   20009c <fork>
  200022:	85 c0                	test   %eax,%eax
  200024:	75 34                	jne    20005a <uEntry+0x5a>
  200026:	83 ec 08             	sub    $0x8,%esp
  200029:	6a 00                	push   $0x0
  20002b:	6a 00                	push   $0x0
  20002d:	6a 16                	push   $0x16
  20002f:	68 d9 05 20 00       	push   $0x2005d9
  200034:	6a 01                	push   $0x1
  200036:	6a 04                	push   $0x4
  200038:	e8 3b 00 00 00       	call   200078 <syscall>
  20003d:	83 c4 20             	add    $0x20,%esp
  200040:	e8 ef 00 00 00       	call   200134 <exit>
  200045:	8d 76 00             	lea    0x0(%esi),%esi
  200048:	83 ec 0c             	sub    $0xc,%esp
  20004b:	68 04 06 20 00       	push   $0x200604
  200050:	e8 d7 03 00 00       	call   20042c <printf>
  200055:	83 c4 10             	add    $0x10,%esp
  200058:	eb ee                	jmp    200048 <uEntry+0x48>
  20005a:	83 ec 08             	sub    $0x8,%esp
  20005d:	6a 00                	push   $0x0
  20005f:	6a 00                	push   $0x0
  200061:	6a 16                	push   $0x16
  200063:	68 ee 05 20 00       	push   $0x2005ee
  200068:	6a 01                	push   $0x1
  20006a:	6a 04                	push   $0x4
  20006c:	e8 07 00 00 00       	call   200078 <syscall>
  200071:	83 c4 20             	add    $0x20,%esp
  200074:	eb ca                	jmp    200040 <uEntry+0x40>
  200076:	66 90                	xchg   %ax,%ax

00200078 <syscall>:
  200078:	55                   	push   %ebp
  200079:	89 e5                	mov    %esp,%ebp
  20007b:	83 ec 10             	sub    $0x10,%esp
  20007e:	8b 45 08             	mov    0x8(%ebp),%eax
  200081:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  200084:	8b 4d 10             	mov    0x10(%ebp),%ecx
  200087:	8b 55 14             	mov    0x14(%ebp),%edx
  20008a:	8b 7d 18             	mov    0x18(%ebp),%edi
  20008d:	8b 75 1c             	mov    0x1c(%ebp),%esi
  200090:	cd 80                	int    $0x80
  200092:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200095:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200098:	c9                   	leave  
  200099:	c3                   	ret    
  20009a:	66 90                	xchg   %ax,%ax

0020009c <fork>:
  20009c:	55                   	push   %ebp
  20009d:	89 e5                	mov    %esp,%ebp
  20009f:	83 ec 20             	sub    $0x20,%esp
  2000a2:	c7 45 e4 02 00 00 00 	movl   $0x2,-0x1c(%ebp)
  2000a9:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  2000b0:	c7 45 ec 13 06 20 00 	movl   $0x200613,-0x14(%ebp)
  2000b7:	c7 45 f0 0d 00 00 00 	movl   $0xd,-0x10(%ebp)
  2000be:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2000c5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2000cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2000cf:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2000d2:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2000d5:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2000d8:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2000db:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2000de:	cd 80                	int    $0x80
  2000e0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2000e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2000e6:	c9                   	leave  
  2000e7:	c3                   	ret    

002000e8 <sleep>:
  2000e8:	55                   	push   %ebp
  2000e9:	89 e5                	mov    %esp,%ebp
  2000eb:	83 ec 20             	sub    $0x20,%esp
  2000ee:	c7 45 e4 e6 00 00 00 	movl   $0xe6,-0x1c(%ebp)
  2000f5:	8b 45 08             	mov    0x8(%ebp),%eax
  2000f8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  2000fb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  200102:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200109:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200110:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200117:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  20011a:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  20011d:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200120:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200123:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200126:	8b 75 f8             	mov    -0x8(%ebp),%esi
  200129:	cd 80                	int    $0x80
  20012b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20012e:	31 c0                	xor    %eax,%eax
  200130:	c9                   	leave  
  200131:	c3                   	ret    
  200132:	66 90                	xchg   %ax,%ax

00200134 <exit>:
  200134:	55                   	push   %ebp
  200135:	89 e5                	mov    %esp,%ebp
  200137:	83 ec 20             	sub    $0x20,%esp
  20013a:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  200141:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  200148:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  20014f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200156:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20015d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200164:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  200167:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  20016a:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  20016d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200170:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200173:	8b 75 f8             	mov    -0x8(%ebp),%esi
  200176:	cd 80                	int    $0x80
  200178:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20017b:	31 c0                	xor    %eax,%eax
  20017d:	c9                   	leave  
  20017e:	c3                   	ret    
  20017f:	90                   	nop

00200180 <fs_write>:
  200180:	55                   	push   %ebp
  200181:	89 e5                	mov    %esp,%ebp
  200183:	83 ec 20             	sub    $0x20,%esp
  200186:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  20018d:	8b 45 08             	mov    0x8(%ebp),%eax
  200190:	89 45 e8             	mov    %eax,-0x18(%ebp)
  200193:	8b 45 0c             	mov    0xc(%ebp),%eax
  200196:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200199:	8b 45 10             	mov    0x10(%ebp),%eax
  20019c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20019f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2001a6:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2001ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2001b0:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2001b3:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2001b6:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2001b9:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2001bc:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2001bf:	cd 80                	int    $0x80
  2001c1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2001c4:	c9                   	leave  
  2001c5:	c3                   	ret    
  2001c6:	66 90                	xchg   %ax,%ax

002001c8 <putchar_user>:
  2001c8:	55                   	push   %ebp
  2001c9:	89 e5                	mov    %esp,%ebp
  2001cb:	83 ec 24             	sub    $0x24,%esp
  2001ce:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  2001d5:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  2001dc:	8d 45 dc             	lea    -0x24(%ebp),%eax
  2001df:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2001e2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  2001e9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2001f0:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2001f7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2001fa:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2001fd:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200200:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200203:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200206:	8b 75 f8             	mov    -0x8(%ebp),%esi
  200209:	cd 80                	int    $0x80
  20020b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20020e:	c9                   	leave  
  20020f:	c3                   	ret    

00200210 <i2A>:
  200210:	55                   	push   %ebp
  200211:	89 e5                	mov    %esp,%ebp
  200213:	57                   	push   %edi
  200214:	56                   	push   %esi
  200215:	53                   	push   %ebx
  200216:	51                   	push   %ecx
  200217:	8b 4d 08             	mov    0x8(%ebp),%ecx
  20021a:	85 c9                	test   %ecx,%ecx
  20021c:	78 6e                	js     20028c <i2A+0x7c>
  20021e:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  200222:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  200226:	bb 42 18 20 00       	mov    $0x201842,%ebx
  20022b:	31 ff                	xor    %edi,%edi
  20022d:	eb 03                	jmp    200232 <i2A+0x22>
  20022f:	90                   	nop
  200230:	89 f7                	mov    %esi,%edi
  200232:	4b                   	dec    %ebx
  200233:	89 c8                	mov    %ecx,%eax
  200235:	be 0a 00 00 00       	mov    $0xa,%esi
  20023a:	99                   	cltd   
  20023b:	f7 fe                	idiv   %esi
  20023d:	83 c2 30             	add    $0x30,%edx
  200240:	88 13                	mov    %dl,(%ebx)
  200242:	8d 77 01             	lea    0x1(%edi),%esi
  200245:	b8 67 66 66 66       	mov    $0x66666667,%eax
  20024a:	f7 e9                	imul   %ecx
  20024c:	89 d0                	mov    %edx,%eax
  20024e:	c1 f8 02             	sar    $0x2,%eax
  200251:	c1 f9 1f             	sar    $0x1f,%ecx
  200254:	29 c8                	sub    %ecx,%eax
  200256:	89 c1                	mov    %eax,%ecx
  200258:	75 d6                	jne    200230 <i2A+0x20>
  20025a:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  20025e:	74 20                	je     200280 <i2A+0x70>
  200260:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  200264:	75 06                	jne    20026c <i2A+0x5c>
  200266:	fe 05 41 18 20 00    	incb   0x201841
  20026c:	c6 05 42 18 20 00 00 	movb   $0x0,0x201842
  200273:	8b 45 0c             	mov    0xc(%ebp),%eax
  200276:	89 18                	mov    %ebx,(%eax)
  200278:	89 f0                	mov    %esi,%eax
  20027a:	5a                   	pop    %edx
  20027b:	5b                   	pop    %ebx
  20027c:	5e                   	pop    %esi
  20027d:	5f                   	pop    %edi
  20027e:	5d                   	pop    %ebp
  20027f:	c3                   	ret    
  200280:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  200284:	8d 77 02             	lea    0x2(%edi),%esi
  200287:	4b                   	dec    %ebx
  200288:	eb d6                	jmp    200260 <i2A+0x50>
  20028a:	66 90                	xchg   %ax,%ax
  20028c:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  200292:	74 0c                	je     2002a0 <i2A+0x90>
  200294:	f7 d9                	neg    %ecx
  200296:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  20029a:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  20029e:	eb 86                	jmp    200226 <i2A+0x16>
  2002a0:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  2002a5:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  2002a9:	eb ef                	jmp    20029a <i2A+0x8a>
  2002ab:	90                   	nop

002002ac <i2X>:
  2002ac:	55                   	push   %ebp
  2002ad:	89 e5                	mov    %esp,%ebp
  2002af:	57                   	push   %edi
  2002b0:	56                   	push   %esi
  2002b1:	53                   	push   %ebx
  2002b2:	8b 55 08             	mov    0x8(%ebp),%edx
  2002b5:	b9 21 18 20 00       	mov    $0x201821,%ecx
  2002ba:	31 c0                	xor    %eax,%eax
  2002bc:	40                   	inc    %eax
  2002bd:	89 d6                	mov    %edx,%esi
  2002bf:	83 e6 0f             	and    $0xf,%esi
  2002c2:	8d 5e f6             	lea    -0xa(%esi),%ebx
  2002c5:	89 cf                	mov    %ecx,%edi
  2002c7:	83 fb 05             	cmp    $0x5,%ebx
  2002ca:	77 4c                	ja     200318 <i2X+0x6c>
  2002cc:	ff 24 9d 1c 06 20 00 	jmp    *0x20061c(,%ebx,4)
  2002d3:	90                   	nop
  2002d4:	c6 01 65             	movb   $0x65,(%ecx)
  2002d7:	90                   	nop
  2002d8:	49                   	dec    %ecx
  2002d9:	c1 ea 04             	shr    $0x4,%edx
  2002dc:	75 de                	jne    2002bc <i2X+0x10>
  2002de:	c6 05 22 18 20 00 00 	movb   $0x0,0x201822
  2002e5:	8b 55 0c             	mov    0xc(%ebp),%edx
  2002e8:	89 3a                	mov    %edi,(%edx)
  2002ea:	5b                   	pop    %ebx
  2002eb:	5e                   	pop    %esi
  2002ec:	5f                   	pop    %edi
  2002ed:	5d                   	pop    %ebp
  2002ee:	c3                   	ret    
  2002ef:	90                   	nop
  2002f0:	c6 01 64             	movb   $0x64,(%ecx)
  2002f3:	eb e3                	jmp    2002d8 <i2X+0x2c>
  2002f5:	8d 76 00             	lea    0x0(%esi),%esi
  2002f8:	c6 01 63             	movb   $0x63,(%ecx)
  2002fb:	eb db                	jmp    2002d8 <i2X+0x2c>
  2002fd:	8d 76 00             	lea    0x0(%esi),%esi
  200300:	c6 01 62             	movb   $0x62,(%ecx)
  200303:	eb d3                	jmp    2002d8 <i2X+0x2c>
  200305:	8d 76 00             	lea    0x0(%esi),%esi
  200308:	c6 01 61             	movb   $0x61,(%ecx)
  20030b:	eb cb                	jmp    2002d8 <i2X+0x2c>
  20030d:	8d 76 00             	lea    0x0(%esi),%esi
  200310:	c6 01 66             	movb   $0x66,(%ecx)
  200313:	eb c3                	jmp    2002d8 <i2X+0x2c>
  200315:	8d 76 00             	lea    0x0(%esi),%esi
  200318:	8d 5e 30             	lea    0x30(%esi),%ebx
  20031b:	88 19                	mov    %bl,(%ecx)
  20031d:	eb b9                	jmp    2002d8 <i2X+0x2c>
  20031f:	90                   	nop

00200320 <memcpy>:
  200320:	55                   	push   %ebp
  200321:	89 e5                	mov    %esp,%ebp
  200323:	57                   	push   %edi
  200324:	56                   	push   %esi
  200325:	53                   	push   %ebx
  200326:	8b 55 08             	mov    0x8(%ebp),%edx
  200329:	8b 7d 0c             	mov    0xc(%ebp),%edi
  20032c:	8b 45 10             	mov    0x10(%ebp),%eax
  20032f:	85 c0                	test   %eax,%eax
  200331:	7e 35                	jle    200368 <memcpy+0x48>
  200333:	8a 1f                	mov    (%edi),%bl
  200335:	84 db                	test   %bl,%bl
  200337:	74 2f                	je     200368 <memcpy+0x48>
  200339:	8d 34 02             	lea    (%edx,%eax,1),%esi
  20033c:	31 c9                	xor    %ecx,%ecx
  20033e:	eb 07                	jmp    200347 <memcpy+0x27>
  200340:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  200343:	84 db                	test   %bl,%bl
  200345:	74 15                	je     20035c <memcpy+0x3c>
  200347:	42                   	inc    %edx
  200348:	88 5a ff             	mov    %bl,-0x1(%edx)
  20034b:	41                   	inc    %ecx
  20034c:	39 f2                	cmp    %esi,%edx
  20034e:	75 f0                	jne    200340 <memcpy+0x20>
  200350:	c6 06 00             	movb   $0x0,(%esi)
  200353:	29 c8                	sub    %ecx,%eax
  200355:	5b                   	pop    %ebx
  200356:	5e                   	pop    %esi
  200357:	5f                   	pop    %edi
  200358:	5d                   	pop    %ebp
  200359:	c3                   	ret    
  20035a:	66 90                	xchg   %ax,%ax
  20035c:	89 d6                	mov    %edx,%esi
  20035e:	c6 06 00             	movb   $0x0,(%esi)
  200361:	29 c8                	sub    %ecx,%eax
  200363:	5b                   	pop    %ebx
  200364:	5e                   	pop    %esi
  200365:	5f                   	pop    %edi
  200366:	5d                   	pop    %ebp
  200367:	c3                   	ret    
  200368:	89 d6                	mov    %edx,%esi
  20036a:	31 c9                	xor    %ecx,%ecx
  20036c:	eb e2                	jmp    200350 <memcpy+0x30>
  20036e:	66 90                	xchg   %ax,%ax

00200370 <printc>:
  200370:	55                   	push   %ebp
  200371:	89 e5                	mov    %esp,%ebp
  200373:	83 ec 24             	sub    $0x24,%esp
  200376:	c7 45 f8 04 00 00 00 	movl   $0x4,-0x8(%ebp)
  20037d:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  200384:	8d 45 dc             	lea    -0x24(%ebp),%eax
  200387:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20038a:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  200391:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  200398:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  20039f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2003a2:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  2003a5:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2003a8:	8b 55 ec             	mov    -0x14(%ebp),%edx
  2003ab:	8b 7d e8             	mov    -0x18(%ebp),%edi
  2003ae:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  2003b1:	cd 80                	int    $0x80
  2003b3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2003b6:	c9                   	leave  
  2003b7:	c3                   	ret    

002003b8 <prints>:
  2003b8:	55                   	push   %ebp
  2003b9:	89 e5                	mov    %esp,%ebp
  2003bb:	83 ec 20             	sub    $0x20,%esp
  2003be:	8b 55 08             	mov    0x8(%ebp),%edx
  2003c1:	80 3a 00             	cmpb   $0x0,(%edx)
  2003c4:	74 46                	je     20040c <prints+0x54>
  2003c6:	31 c0                	xor    %eax,%eax
  2003c8:	40                   	inc    %eax
  2003c9:	89 c1                	mov    %eax,%ecx
  2003cb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  2003cf:	75 f7                	jne    2003c8 <prints+0x10>
  2003d1:	c7 45 f8 04 00 00 00 	movl   $0x4,-0x8(%ebp)
  2003d8:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  2003df:	89 55 f0             	mov    %edx,-0x10(%ebp)
  2003e2:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  2003e5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  2003ec:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  2003f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2003f6:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  2003f9:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2003fc:	8b 55 ec             	mov    -0x14(%ebp),%edx
  2003ff:	8b 7d e8             	mov    -0x18(%ebp),%edi
  200402:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  200405:	cd 80                	int    $0x80
  200407:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20040a:	c9                   	leave  
  20040b:	c3                   	ret    
  20040c:	31 c9                	xor    %ecx,%ecx
  20040e:	eb c1                	jmp    2003d1 <prints+0x19>

00200410 <length_str>:
  200410:	55                   	push   %ebp
  200411:	89 e5                	mov    %esp,%ebp
  200413:	8b 55 08             	mov    0x8(%ebp),%edx
  200416:	31 c0                	xor    %eax,%eax
  200418:	80 3a 00             	cmpb   $0x0,(%edx)
  20041b:	74 0a                	je     200427 <length_str+0x17>
  20041d:	8d 76 00             	lea    0x0(%esi),%esi
  200420:	40                   	inc    %eax
  200421:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  200425:	75 f9                	jne    200420 <length_str+0x10>
  200427:	5d                   	pop    %ebp
  200428:	c3                   	ret    
  200429:	8d 76 00             	lea    0x0(%esi),%esi

0020042c <printf>:
  20042c:	55                   	push   %ebp
  20042d:	89 e5                	mov    %esp,%ebp
  20042f:	57                   	push   %edi
  200430:	56                   	push   %esi
  200431:	53                   	push   %ebx
  200432:	83 ec 24             	sub    $0x24,%esp
  200435:	8b 4d 08             	mov    0x8(%ebp),%ecx
  200438:	8a 11                	mov    (%ecx),%dl
  20043a:	84 d2                	test   %dl,%dl
  20043c:	0f 84 74 01 00 00    	je     2005b6 <printf+0x18a>
  200442:	8d 45 0c             	lea    0xc(%ebp),%eax
  200445:	31 ff                	xor    %edi,%edi
  200447:	eb 18                	jmp    200461 <printf+0x35>
  200449:	8d 76 00             	lea    0x0(%esi),%esi
  20044c:	8a 11                	mov    (%ecx),%dl
  20044e:	89 cb                	mov    %ecx,%ebx
  200450:	88 97 00 10 20 00    	mov    %dl,0x201000(%edi)
  200456:	47                   	inc    %edi
  200457:	8d 4b 01             	lea    0x1(%ebx),%ecx
  20045a:	8a 53 01             	mov    0x1(%ebx),%dl
  20045d:	84 d2                	test   %dl,%dl
  20045f:	74 72                	je     2004d3 <printf+0xa7>
  200461:	80 fa 25             	cmp    $0x25,%dl
  200464:	75 e6                	jne    20044c <printf+0x20>
  200466:	8d 59 01             	lea    0x1(%ecx),%ebx
  200469:	8a 51 01             	mov    0x1(%ecx),%dl
  20046c:	80 fa 64             	cmp    $0x64,%dl
  20046f:	0f 84 df 00 00 00    	je     200554 <printf+0x128>
  200475:	0f 8e 21 01 00 00    	jle    20059c <printf+0x170>
  20047b:	80 fa 73             	cmp    $0x73,%dl
  20047e:	0f 84 a0 00 00 00    	je     200524 <printf+0xf8>
  200484:	80 fa 78             	cmp    $0x78,%dl
  200487:	75 c7                	jne    200450 <printf+0x24>
  200489:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200490:	8d 70 04             	lea    0x4(%eax),%esi
  200493:	89 75 d0             	mov    %esi,-0x30(%ebp)
  200496:	8d 75 f0             	lea    -0x10(%ebp),%esi
  200499:	56                   	push   %esi
  20049a:	ff 30                	pushl  (%eax)
  20049c:	e8 0b fe ff ff       	call   2002ac <i2X>
  2004a1:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2004a4:	8d b7 00 10 20 00    	lea    0x201000(%edi),%esi
  2004aa:	8a 11                	mov    (%ecx),%dl
  2004ac:	83 c4 08             	add    $0x8,%esp
  2004af:	31 c0                	xor    %eax,%eax
  2004b1:	84 d2                	test   %dl,%dl
  2004b3:	74 0f                	je     2004c4 <printf+0x98>
  2004b5:	8d 76 00             	lea    0x0(%esi),%esi
  2004b8:	40                   	inc    %eax
  2004b9:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  2004bd:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  2004c0:	84 d2                	test   %dl,%dl
  2004c2:	75 f4                	jne    2004b8 <printf+0x8c>
  2004c4:	01 c7                	add    %eax,%edi
  2004c6:	8b 45 d0             	mov    -0x30(%ebp),%eax
  2004c9:	8d 4b 01             	lea    0x1(%ebx),%ecx
  2004cc:	8a 53 01             	mov    0x1(%ebx),%dl
  2004cf:	84 d2                	test   %dl,%dl
  2004d1:	75 8e                	jne    200461 <printf+0x35>
  2004d3:	8d 47 01             	lea    0x1(%edi),%eax
  2004d6:	c6 87 00 10 20 00 00 	movb   $0x0,0x201000(%edi)
  2004dd:	c7 45 ec 04 00 00 00 	movl   $0x4,-0x14(%ebp)
  2004e4:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  2004eb:	c7 45 e4 00 10 20 00 	movl   $0x201000,-0x1c(%ebp)
  2004f2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  2004f5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  2004fc:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  200503:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200506:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  200509:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  20050c:	8b 55 e0             	mov    -0x20(%ebp),%edx
  20050f:	8b 7d dc             	mov    -0x24(%ebp),%edi
  200512:	8b 75 d8             	mov    -0x28(%ebp),%esi
  200515:	cd 80                	int    $0x80
  200517:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20051a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  20051d:	5b                   	pop    %ebx
  20051e:	5e                   	pop    %esi
  20051f:	5f                   	pop    %edi
  200520:	5d                   	pop    %ebp
  200521:	c3                   	ret    
  200522:	66 90                	xchg   %ax,%ax
  200524:	8d 70 04             	lea    0x4(%eax),%esi
  200527:	89 75 d0             	mov    %esi,-0x30(%ebp)
  20052a:	8b 08                	mov    (%eax),%ecx
  20052c:	8d b7 00 10 20 00    	lea    0x201000(%edi),%esi
  200532:	8a 11                	mov    (%ecx),%dl
  200534:	31 c0                	xor    %eax,%eax
  200536:	84 d2                	test   %dl,%dl
  200538:	74 8a                	je     2004c4 <printf+0x98>
  20053a:	66 90                	xchg   %ax,%ax
  20053c:	40                   	inc    %eax
  20053d:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  200541:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  200544:	84 d2                	test   %dl,%dl
  200546:	75 f4                	jne    20053c <printf+0x110>
  200548:	01 c7                	add    %eax,%edi
  20054a:	8b 45 d0             	mov    -0x30(%ebp),%eax
  20054d:	e9 77 ff ff ff       	jmp    2004c9 <printf+0x9d>
  200552:	66 90                	xchg   %ax,%ax
  200554:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  20055b:	8d 70 04             	lea    0x4(%eax),%esi
  20055e:	89 75 d0             	mov    %esi,-0x30(%ebp)
  200561:	8d 75 f0             	lea    -0x10(%ebp),%esi
  200564:	56                   	push   %esi
  200565:	ff 30                	pushl  (%eax)
  200567:	e8 a4 fc ff ff       	call   200210 <i2A>
  20056c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  20056f:	8d b7 00 10 20 00    	lea    0x201000(%edi),%esi
  200575:	8a 11                	mov    (%ecx),%dl
  200577:	83 c4 08             	add    $0x8,%esp
  20057a:	31 c0                	xor    %eax,%eax
  20057c:	84 d2                	test   %dl,%dl
  20057e:	0f 84 40 ff ff ff    	je     2004c4 <printf+0x98>
  200584:	40                   	inc    %eax
  200585:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  200589:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  20058c:	84 d2                	test   %dl,%dl
  20058e:	75 f4                	jne    200584 <printf+0x158>
  200590:	01 c7                	add    %eax,%edi
  200592:	8b 45 d0             	mov    -0x30(%ebp),%eax
  200595:	e9 2f ff ff ff       	jmp    2004c9 <printf+0x9d>
  20059a:	66 90                	xchg   %ax,%ax
  20059c:	80 fa 63             	cmp    $0x63,%dl
  20059f:	0f 85 ab fe ff ff    	jne    200450 <printf+0x24>
  2005a5:	8b 10                	mov    (%eax),%edx
  2005a7:	88 97 00 10 20 00    	mov    %dl,0x201000(%edi)
  2005ad:	83 c0 04             	add    $0x4,%eax
  2005b0:	47                   	inc    %edi
  2005b1:	e9 a1 fe ff ff       	jmp    200457 <printf+0x2b>
  2005b6:	b8 01 00 00 00       	mov    $0x1,%eax
  2005bb:	31 ff                	xor    %edi,%edi
  2005bd:	e9 14 ff ff ff       	jmp    2004d6 <printf+0xaa>
