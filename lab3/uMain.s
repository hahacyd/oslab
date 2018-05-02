
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	53                   	push   %ebx
  200004:	50                   	push   %eax
  200005:	e8 6e 00 00 00       	call   200078 <fork>
  20000a:	89 c3                	mov    %eax,%ebx
  20000c:	85 c0                	test   %eax,%eax
  20000e:	75 28                	jne    200038 <uEntry+0x38>
  200010:	83 ec 0c             	sub    $0xc,%esp
  200013:	68 00 05 20 00       	push   $0x200500
  200018:	e8 4b 03 00 00       	call   200368 <printf>
  20001d:	83 c4 10             	add    $0x10,%esp
  200020:	83 ec 08             	sub    $0x8,%esp
  200023:	53                   	push   %ebx
  200024:	68 19 05 20 00       	push   $0x200519
  200029:	e8 3a 03 00 00       	call   200368 <printf>
  20002e:	e8 dd 00 00 00       	call   200110 <exit>
  200033:	83 c4 10             	add    $0x10,%esp
  200036:	eb fe                	jmp    200036 <uEntry+0x36>
  200038:	83 ec 0c             	sub    $0xc,%esp
  20003b:	6a 0c                	push   $0xc
  20003d:	e8 82 00 00 00       	call   2000c4 <sleep>
  200042:	c7 04 24 0c 05 20 00 	movl   $0x20050c,(%esp)
  200049:	e8 1a 03 00 00       	call   200368 <printf>
  20004e:	83 c4 10             	add    $0x10,%esp
  200051:	eb cd                	jmp    200020 <uEntry+0x20>
  200053:	90                   	nop

00200054 <syscall>:
  200054:	55                   	push   %ebp
  200055:	89 e5                	mov    %esp,%ebp
  200057:	83 ec 10             	sub    $0x10,%esp
  20005a:	8b 45 08             	mov    0x8(%ebp),%eax
  20005d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  200060:	8b 4d 10             	mov    0x10(%ebp),%ecx
  200063:	8b 55 14             	mov    0x14(%ebp),%edx
  200066:	8b 7d 18             	mov    0x18(%ebp),%edi
  200069:	8b 75 1c             	mov    0x1c(%ebp),%esi
  20006c:	cd 80                	int    $0x80
  20006e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200071:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200074:	c9                   	leave  
  200075:	c3                   	ret    
  200076:	66 90                	xchg   %ax,%ax

00200078 <fork>:
  200078:	55                   	push   %ebp
  200079:	89 e5                	mov    %esp,%ebp
  20007b:	83 ec 20             	sub    $0x20,%esp
  20007e:	c7 45 e4 02 00 00 00 	movl   $0x2,-0x1c(%ebp)
  200085:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  20008c:	c7 45 ec 23 05 20 00 	movl   $0x200523,-0x14(%ebp)
  200093:	c7 45 f0 0d 00 00 00 	movl   $0xd,-0x10(%ebp)
  20009a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2000a1:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2000a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2000ab:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2000ae:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2000b1:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2000b4:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2000b7:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2000ba:	cd 80                	int    $0x80
  2000bc:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2000bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2000c2:	c9                   	leave  
  2000c3:	c3                   	ret    

002000c4 <sleep>:
  2000c4:	55                   	push   %ebp
  2000c5:	89 e5                	mov    %esp,%ebp
  2000c7:	83 ec 20             	sub    $0x20,%esp
  2000ca:	c7 45 e4 e6 00 00 00 	movl   $0xe6,-0x1c(%ebp)
  2000d1:	8b 45 08             	mov    0x8(%ebp),%eax
  2000d4:	89 45 e8             	mov    %eax,-0x18(%ebp)
  2000d7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  2000de:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2000e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2000ec:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2000f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2000f6:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2000f9:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2000fc:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2000ff:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200102:	8b 75 f8             	mov    -0x8(%ebp),%esi
  200105:	cd 80                	int    $0x80
  200107:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20010a:	31 c0                	xor    %eax,%eax
  20010c:	c9                   	leave  
  20010d:	c3                   	ret    
  20010e:	66 90                	xchg   %ax,%ax

00200110 <exit>:
  200110:	55                   	push   %ebp
  200111:	89 e5                	mov    %esp,%ebp
  200113:	83 ec 20             	sub    $0x20,%esp
  200116:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  20011d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  200124:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  20012b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200132:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200139:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200140:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  200143:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  200146:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200149:	8b 55 f0             	mov    -0x10(%ebp),%edx
  20014c:	8b 7d f4             	mov    -0xc(%ebp),%edi
  20014f:	8b 75 f8             	mov    -0x8(%ebp),%esi
  200152:	cd 80                	int    $0x80
  200154:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200157:	31 c0                	xor    %eax,%eax
  200159:	c9                   	leave  
  20015a:	c3                   	ret    
  20015b:	90                   	nop

0020015c <fs_write>:
  20015c:	55                   	push   %ebp
  20015d:	89 e5                	mov    %esp,%ebp
  20015f:	83 ec 20             	sub    $0x20,%esp
  200162:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  200169:	8b 45 08             	mov    0x8(%ebp),%eax
  20016c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  20016f:	8b 45 0c             	mov    0xc(%ebp),%eax
  200172:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200175:	8b 45 10             	mov    0x10(%ebp),%eax
  200178:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20017b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200182:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200189:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  20018c:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  20018f:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200192:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200195:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200198:	8b 75 f8             	mov    -0x8(%ebp),%esi
  20019b:	cd 80                	int    $0x80
  20019d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2001a0:	c9                   	leave  
  2001a1:	c3                   	ret    
  2001a2:	66 90                	xchg   %ax,%ax

002001a4 <putchar_user>:
  2001a4:	55                   	push   %ebp
  2001a5:	89 e5                	mov    %esp,%ebp
  2001a7:	83 ec 24             	sub    $0x24,%esp
  2001aa:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  2001b1:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  2001b8:	8d 45 dc             	lea    -0x24(%ebp),%eax
  2001bb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2001be:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  2001c5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2001cc:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2001d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2001d6:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2001d9:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2001dc:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2001df:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2001e2:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2001e5:	cd 80                	int    $0x80
  2001e7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2001ea:	c9                   	leave  
  2001eb:	c3                   	ret    

002001ec <i2A>:
  2001ec:	55                   	push   %ebp
  2001ed:	89 e5                	mov    %esp,%ebp
  2001ef:	57                   	push   %edi
  2001f0:	56                   	push   %esi
  2001f1:	53                   	push   %ebx
  2001f2:	51                   	push   %ecx
  2001f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2001f6:	85 c9                	test   %ecx,%ecx
  2001f8:	78 6e                	js     200268 <i2A+0x7c>
  2001fa:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  2001fe:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  200202:	bb 82 17 20 00       	mov    $0x201782,%ebx
  200207:	31 ff                	xor    %edi,%edi
  200209:	eb 03                	jmp    20020e <i2A+0x22>
  20020b:	90                   	nop
  20020c:	89 f7                	mov    %esi,%edi
  20020e:	4b                   	dec    %ebx
  20020f:	89 c8                	mov    %ecx,%eax
  200211:	be 0a 00 00 00       	mov    $0xa,%esi
  200216:	99                   	cltd   
  200217:	f7 fe                	idiv   %esi
  200219:	83 c2 30             	add    $0x30,%edx
  20021c:	88 13                	mov    %dl,(%ebx)
  20021e:	8d 77 01             	lea    0x1(%edi),%esi
  200221:	b8 67 66 66 66       	mov    $0x66666667,%eax
  200226:	f7 e9                	imul   %ecx
  200228:	89 d0                	mov    %edx,%eax
  20022a:	c1 f8 02             	sar    $0x2,%eax
  20022d:	c1 f9 1f             	sar    $0x1f,%ecx
  200230:	29 c8                	sub    %ecx,%eax
  200232:	89 c1                	mov    %eax,%ecx
  200234:	75 d6                	jne    20020c <i2A+0x20>
  200236:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  20023a:	74 20                	je     20025c <i2A+0x70>
  20023c:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  200240:	75 06                	jne    200248 <i2A+0x5c>
  200242:	fe 05 81 17 20 00    	incb   0x201781
  200248:	c6 05 82 17 20 00 00 	movb   $0x0,0x201782
  20024f:	8b 45 0c             	mov    0xc(%ebp),%eax
  200252:	89 18                	mov    %ebx,(%eax)
  200254:	89 f0                	mov    %esi,%eax
  200256:	5a                   	pop    %edx
  200257:	5b                   	pop    %ebx
  200258:	5e                   	pop    %esi
  200259:	5f                   	pop    %edi
  20025a:	5d                   	pop    %ebp
  20025b:	c3                   	ret    
  20025c:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  200260:	8d 77 02             	lea    0x2(%edi),%esi
  200263:	4b                   	dec    %ebx
  200264:	eb d6                	jmp    20023c <i2A+0x50>
  200266:	66 90                	xchg   %ax,%ax
  200268:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  20026e:	74 0c                	je     20027c <i2A+0x90>
  200270:	f7 d9                	neg    %ecx
  200272:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  200276:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  20027a:	eb 86                	jmp    200202 <i2A+0x16>
  20027c:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  200281:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  200285:	eb ef                	jmp    200276 <i2A+0x8a>
  200287:	90                   	nop

00200288 <i2X>:
  200288:	55                   	push   %ebp
  200289:	89 e5                	mov    %esp,%ebp
  20028b:	57                   	push   %edi
  20028c:	56                   	push   %esi
  20028d:	53                   	push   %ebx
  20028e:	8b 55 08             	mov    0x8(%ebp),%edx
  200291:	b9 61 17 20 00       	mov    $0x201761,%ecx
  200296:	31 c0                	xor    %eax,%eax
  200298:	40                   	inc    %eax
  200299:	89 d6                	mov    %edx,%esi
  20029b:	83 e6 0f             	and    $0xf,%esi
  20029e:	8d 5e f6             	lea    -0xa(%esi),%ebx
  2002a1:	89 cf                	mov    %ecx,%edi
  2002a3:	83 fb 05             	cmp    $0x5,%ebx
  2002a6:	77 4c                	ja     2002f4 <i2X+0x6c>
  2002a8:	ff 24 9d 2c 05 20 00 	jmp    *0x20052c(,%ebx,4)
  2002af:	90                   	nop
  2002b0:	c6 01 65             	movb   $0x65,(%ecx)
  2002b3:	90                   	nop
  2002b4:	49                   	dec    %ecx
  2002b5:	c1 ea 04             	shr    $0x4,%edx
  2002b8:	75 de                	jne    200298 <i2X+0x10>
  2002ba:	c6 05 62 17 20 00 00 	movb   $0x0,0x201762
  2002c1:	8b 55 0c             	mov    0xc(%ebp),%edx
  2002c4:	89 3a                	mov    %edi,(%edx)
  2002c6:	5b                   	pop    %ebx
  2002c7:	5e                   	pop    %esi
  2002c8:	5f                   	pop    %edi
  2002c9:	5d                   	pop    %ebp
  2002ca:	c3                   	ret    
  2002cb:	90                   	nop
  2002cc:	c6 01 64             	movb   $0x64,(%ecx)
  2002cf:	eb e3                	jmp    2002b4 <i2X+0x2c>
  2002d1:	8d 76 00             	lea    0x0(%esi),%esi
  2002d4:	c6 01 63             	movb   $0x63,(%ecx)
  2002d7:	eb db                	jmp    2002b4 <i2X+0x2c>
  2002d9:	8d 76 00             	lea    0x0(%esi),%esi
  2002dc:	c6 01 62             	movb   $0x62,(%ecx)
  2002df:	eb d3                	jmp    2002b4 <i2X+0x2c>
  2002e1:	8d 76 00             	lea    0x0(%esi),%esi
  2002e4:	c6 01 61             	movb   $0x61,(%ecx)
  2002e7:	eb cb                	jmp    2002b4 <i2X+0x2c>
  2002e9:	8d 76 00             	lea    0x0(%esi),%esi
  2002ec:	c6 01 66             	movb   $0x66,(%ecx)
  2002ef:	eb c3                	jmp    2002b4 <i2X+0x2c>
  2002f1:	8d 76 00             	lea    0x0(%esi),%esi
  2002f4:	8d 5e 30             	lea    0x30(%esi),%ebx
  2002f7:	88 19                	mov    %bl,(%ecx)
  2002f9:	eb b9                	jmp    2002b4 <i2X+0x2c>
  2002fb:	90                   	nop

002002fc <memcpy>:
  2002fc:	55                   	push   %ebp
  2002fd:	89 e5                	mov    %esp,%ebp
  2002ff:	57                   	push   %edi
  200300:	56                   	push   %esi
  200301:	53                   	push   %ebx
  200302:	8b 55 08             	mov    0x8(%ebp),%edx
  200305:	8b 7d 0c             	mov    0xc(%ebp),%edi
  200308:	8b 45 10             	mov    0x10(%ebp),%eax
  20030b:	85 c0                	test   %eax,%eax
  20030d:	7e 35                	jle    200344 <memcpy+0x48>
  20030f:	8a 1f                	mov    (%edi),%bl
  200311:	84 db                	test   %bl,%bl
  200313:	74 2f                	je     200344 <memcpy+0x48>
  200315:	8d 34 02             	lea    (%edx,%eax,1),%esi
  200318:	31 c9                	xor    %ecx,%ecx
  20031a:	eb 07                	jmp    200323 <memcpy+0x27>
  20031c:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  20031f:	84 db                	test   %bl,%bl
  200321:	74 15                	je     200338 <memcpy+0x3c>
  200323:	42                   	inc    %edx
  200324:	88 5a ff             	mov    %bl,-0x1(%edx)
  200327:	41                   	inc    %ecx
  200328:	39 f2                	cmp    %esi,%edx
  20032a:	75 f0                	jne    20031c <memcpy+0x20>
  20032c:	c6 06 00             	movb   $0x0,(%esi)
  20032f:	29 c8                	sub    %ecx,%eax
  200331:	5b                   	pop    %ebx
  200332:	5e                   	pop    %esi
  200333:	5f                   	pop    %edi
  200334:	5d                   	pop    %ebp
  200335:	c3                   	ret    
  200336:	66 90                	xchg   %ax,%ax
  200338:	89 d6                	mov    %edx,%esi
  20033a:	c6 06 00             	movb   $0x0,(%esi)
  20033d:	29 c8                	sub    %ecx,%eax
  20033f:	5b                   	pop    %ebx
  200340:	5e                   	pop    %esi
  200341:	5f                   	pop    %edi
  200342:	5d                   	pop    %ebp
  200343:	c3                   	ret    
  200344:	89 d6                	mov    %edx,%esi
  200346:	31 c9                	xor    %ecx,%ecx
  200348:	eb e2                	jmp    20032c <memcpy+0x30>
  20034a:	66 90                	xchg   %ax,%ax

0020034c <length_str>:
  20034c:	55                   	push   %ebp
  20034d:	89 e5                	mov    %esp,%ebp
  20034f:	8b 55 08             	mov    0x8(%ebp),%edx
  200352:	31 c0                	xor    %eax,%eax
  200354:	80 3a 00             	cmpb   $0x0,(%edx)
  200357:	74 0a                	je     200363 <length_str+0x17>
  200359:	8d 76 00             	lea    0x0(%esi),%esi
  20035c:	40                   	inc    %eax
  20035d:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  200361:	75 f9                	jne    20035c <length_str+0x10>
  200363:	5d                   	pop    %ebp
  200364:	c3                   	ret    
  200365:	8d 76 00             	lea    0x0(%esi),%esi

00200368 <printf>:
  200368:	55                   	push   %ebp
  200369:	89 e5                	mov    %esp,%ebp
  20036b:	57                   	push   %edi
  20036c:	56                   	push   %esi
  20036d:	53                   	push   %ebx
  20036e:	83 ec 24             	sub    $0x24,%esp
  200371:	8b 4d 08             	mov    0x8(%ebp),%ecx
  200374:	8a 11                	mov    (%ecx),%dl
  200376:	84 d2                	test   %dl,%dl
  200378:	0f 84 74 01 00 00    	je     2004f2 <printf+0x18a>
  20037e:	8d 45 0c             	lea    0xc(%ebp),%eax
  200381:	31 ff                	xor    %edi,%edi
  200383:	eb 18                	jmp    20039d <printf+0x35>
  200385:	8d 76 00             	lea    0x0(%esi),%esi
  200388:	8a 11                	mov    (%ecx),%dl
  20038a:	89 cb                	mov    %ecx,%ebx
  20038c:	88 97 a0 17 20 00    	mov    %dl,0x2017a0(%edi)
  200392:	47                   	inc    %edi
  200393:	8d 4b 01             	lea    0x1(%ebx),%ecx
  200396:	8a 53 01             	mov    0x1(%ebx),%dl
  200399:	84 d2                	test   %dl,%dl
  20039b:	74 72                	je     20040f <printf+0xa7>
  20039d:	80 fa 25             	cmp    $0x25,%dl
  2003a0:	75 e6                	jne    200388 <printf+0x20>
  2003a2:	8d 59 01             	lea    0x1(%ecx),%ebx
  2003a5:	8a 51 01             	mov    0x1(%ecx),%dl
  2003a8:	80 fa 64             	cmp    $0x64,%dl
  2003ab:	0f 84 df 00 00 00    	je     200490 <printf+0x128>
  2003b1:	0f 8e 21 01 00 00    	jle    2004d8 <printf+0x170>
  2003b7:	80 fa 73             	cmp    $0x73,%dl
  2003ba:	0f 84 a0 00 00 00    	je     200460 <printf+0xf8>
  2003c0:	80 fa 78             	cmp    $0x78,%dl
  2003c3:	75 c7                	jne    20038c <printf+0x24>
  2003c5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2003cc:	8d 70 04             	lea    0x4(%eax),%esi
  2003cf:	89 75 d0             	mov    %esi,-0x30(%ebp)
  2003d2:	8d 75 f0             	lea    -0x10(%ebp),%esi
  2003d5:	56                   	push   %esi
  2003d6:	ff 30                	pushl  (%eax)
  2003d8:	e8 ab fe ff ff       	call   200288 <i2X>
  2003dd:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2003e0:	8d b7 a0 17 20 00    	lea    0x2017a0(%edi),%esi
  2003e6:	8a 11                	mov    (%ecx),%dl
  2003e8:	83 c4 08             	add    $0x8,%esp
  2003eb:	31 c0                	xor    %eax,%eax
  2003ed:	84 d2                	test   %dl,%dl
  2003ef:	74 0f                	je     200400 <printf+0x98>
  2003f1:	8d 76 00             	lea    0x0(%esi),%esi
  2003f4:	40                   	inc    %eax
  2003f5:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  2003f9:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  2003fc:	84 d2                	test   %dl,%dl
  2003fe:	75 f4                	jne    2003f4 <printf+0x8c>
  200400:	01 c7                	add    %eax,%edi
  200402:	8b 45 d0             	mov    -0x30(%ebp),%eax
  200405:	8d 4b 01             	lea    0x1(%ebx),%ecx
  200408:	8a 53 01             	mov    0x1(%ebx),%dl
  20040b:	84 d2                	test   %dl,%dl
  20040d:	75 8e                	jne    20039d <printf+0x35>
  20040f:	8d 47 01             	lea    0x1(%edi),%eax
  200412:	c6 87 a0 17 20 00 00 	movb   $0x0,0x2017a0(%edi)
  200419:	c7 45 ec 04 00 00 00 	movl   $0x4,-0x14(%ebp)
  200420:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  200427:	c7 45 e4 a0 17 20 00 	movl   $0x2017a0,-0x1c(%ebp)
  20042e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  200431:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  200438:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  20043f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200442:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  200445:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  200448:	8b 55 e0             	mov    -0x20(%ebp),%edx
  20044b:	8b 7d dc             	mov    -0x24(%ebp),%edi
  20044e:	8b 75 d8             	mov    -0x28(%ebp),%esi
  200451:	cd 80                	int    $0x80
  200453:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200456:	8d 65 f4             	lea    -0xc(%ebp),%esp
  200459:	5b                   	pop    %ebx
  20045a:	5e                   	pop    %esi
  20045b:	5f                   	pop    %edi
  20045c:	5d                   	pop    %ebp
  20045d:	c3                   	ret    
  20045e:	66 90                	xchg   %ax,%ax
  200460:	8d 70 04             	lea    0x4(%eax),%esi
  200463:	89 75 d0             	mov    %esi,-0x30(%ebp)
  200466:	8b 08                	mov    (%eax),%ecx
  200468:	8d b7 a0 17 20 00    	lea    0x2017a0(%edi),%esi
  20046e:	8a 11                	mov    (%ecx),%dl
  200470:	31 c0                	xor    %eax,%eax
  200472:	84 d2                	test   %dl,%dl
  200474:	74 8a                	je     200400 <printf+0x98>
  200476:	66 90                	xchg   %ax,%ax
  200478:	40                   	inc    %eax
  200479:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  20047d:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  200480:	84 d2                	test   %dl,%dl
  200482:	75 f4                	jne    200478 <printf+0x110>
  200484:	01 c7                	add    %eax,%edi
  200486:	8b 45 d0             	mov    -0x30(%ebp),%eax
  200489:	e9 77 ff ff ff       	jmp    200405 <printf+0x9d>
  20048e:	66 90                	xchg   %ax,%ax
  200490:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200497:	8d 70 04             	lea    0x4(%eax),%esi
  20049a:	89 75 d0             	mov    %esi,-0x30(%ebp)
  20049d:	8d 75 f0             	lea    -0x10(%ebp),%esi
  2004a0:	56                   	push   %esi
  2004a1:	ff 30                	pushl  (%eax)
  2004a3:	e8 44 fd ff ff       	call   2001ec <i2A>
  2004a8:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2004ab:	8d b7 a0 17 20 00    	lea    0x2017a0(%edi),%esi
  2004b1:	8a 11                	mov    (%ecx),%dl
  2004b3:	83 c4 08             	add    $0x8,%esp
  2004b6:	31 c0                	xor    %eax,%eax
  2004b8:	84 d2                	test   %dl,%dl
  2004ba:	0f 84 40 ff ff ff    	je     200400 <printf+0x98>
  2004c0:	40                   	inc    %eax
  2004c1:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  2004c5:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  2004c8:	84 d2                	test   %dl,%dl
  2004ca:	75 f4                	jne    2004c0 <printf+0x158>
  2004cc:	01 c7                	add    %eax,%edi
  2004ce:	8b 45 d0             	mov    -0x30(%ebp),%eax
  2004d1:	e9 2f ff ff ff       	jmp    200405 <printf+0x9d>
  2004d6:	66 90                	xchg   %ax,%ax
  2004d8:	80 fa 63             	cmp    $0x63,%dl
  2004db:	0f 85 ab fe ff ff    	jne    20038c <printf+0x24>
  2004e1:	8b 10                	mov    (%eax),%edx
  2004e3:	88 97 a0 17 20 00    	mov    %dl,0x2017a0(%edi)
  2004e9:	83 c0 04             	add    $0x4,%eax
  2004ec:	47                   	inc    %edi
  2004ed:	e9 a1 fe ff ff       	jmp    200393 <printf+0x2b>
  2004f2:	b8 01 00 00 00       	mov    $0x1,%eax
  2004f7:	31 ff                	xor    %edi,%edi
  2004f9:	e9 14 ff ff ff       	jmp    200412 <printf+0xaa>
