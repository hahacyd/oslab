
app/uMain.elf:     file format elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	83 ec 14             	sub    $0x14,%esp
  200006:	68 44 05 20 00       	push   $0x200544
  20000b:	e8 34 03 00 00       	call   200344 <printf>
  200010:	c7 04 24 5a 05 20 00 	movl   $0x20055a,(%esp)
  200017:	e8 28 03 00 00       	call   200344 <printf>
  20001c:	c7 04 24 3c 06 20 00 	movl   $0x20063c,(%esp)
  200023:	e8 1c 03 00 00       	call   200344 <printf>
  200028:	c7 04 24 78 06 20 00 	movl   $0x200678,(%esp)
  20002f:	e8 10 03 00 00       	call   200344 <printf>
  200034:	c7 04 24 ac 06 20 00 	movl   $0x2006ac,(%esp)
  20003b:	e8 04 03 00 00       	call   200344 <printf>
  200040:	c7 04 24 28 07 20 00 	movl   $0x200728,(%esp)
  200047:	e8 f8 02 00 00       	call   200344 <printf>
  20004c:	c7 04 24 71 05 20 00 	movl   $0x200571,(%esp)
  200053:	e8 ec 02 00 00       	call   200344 <printf>
  200058:	c7 04 24 4c 07 20 00 	movl   $0x20074c,(%esp)
  20005f:	e8 e0 02 00 00       	call   200344 <printf>
  200064:	c7 04 24 3c 06 20 00 	movl   $0x20063c,(%esp)
  20006b:	e8 d4 02 00 00       	call   200344 <printf>
  200070:	c7 04 24 8f 05 20 00 	movl   $0x20058f,(%esp)
  200077:	e8 c8 02 00 00       	call   200344 <printf>
  20007c:	c7 04 24 cc 07 20 00 	movl   $0x2007cc,(%esp)
  200083:	e8 bc 02 00 00       	call   200344 <printf>
  200088:	58                   	pop    %eax
  200089:	5a                   	pop    %edx
  20008a:	68 c5 05 20 00       	push   $0x2005c5
  20008f:	6a 74                	push   $0x74
  200091:	68 9d 05 20 00       	push   $0x20059d
  200096:	68 3a 06 20 00       	push   $0x20063a
  20009b:	68 a1 05 20 00       	push   $0x2005a1
  2000a0:	68 a8 05 20 00       	push   $0x2005a8
  2000a5:	e8 9a 02 00 00       	call   200344 <printf>
  2000aa:	83 c4 18             	add    $0x18,%esp
  2000ad:	6a 62                	push   $0x62
  2000af:	6a 61                	push   $0x61
  2000b1:	6a 6c                	push   $0x6c
  2000b3:	6a 53                	push   $0x53
  2000b5:	6a 4f                	push   $0x4f
  2000b7:	68 ba 05 20 00       	push   $0x2005ba
  2000bc:	e8 83 02 00 00       	call   200344 <printf>
  2000c1:	83 c4 1c             	add    $0x1c,%esp
  2000c4:	68 00 00 10 00       	push   $0x100000
  2000c9:	68 08 08 20 00       	push   $0x200808
  2000ce:	68 00 00 10 00       	push   $0x100000
  2000d3:	68 40 08 20 00       	push   $0x200840
  2000d8:	68 c7 05 20 00       	push   $0x2005c7
  2000dd:	68 d0 05 20 00       	push   $0x2005d0
  2000e2:	68 70 08 20 00       	push   $0x200870
  2000e7:	e8 58 02 00 00       	call   200344 <printf>
  2000ec:	83 c4 14             	add    $0x14,%esp
  2000ef:	68 28 07 20 00       	push   $0x200728
  2000f4:	e8 4b 02 00 00       	call   200344 <printf>
  2000f9:	c7 04 24 71 05 20 00 	movl   $0x200571,(%esp)
  200100:	e8 3f 02 00 00       	call   200344 <printf>
  200105:	83 c4 0c             	add    $0xc,%esp
  200108:	68 18 db 00 00       	push   $0xdb18
  20010d:	68 c8 01 00 00       	push   $0x1c8
  200112:	6a 7b                	push   $0x7b
  200114:	6a 02                	push   $0x2
  200116:	6a 01                	push   $0x1
  200118:	6a 01                	push   $0x1
  20011a:	68 d5 05 20 00       	push   $0x2005d5
  20011f:	e8 20 02 00 00       	call   200344 <printf>
  200124:	83 c4 1c             	add    $0x1c,%esp
  200127:	68 8e 8e 01 00       	push   $0x18e8e
  20012c:	68 00 80 ff ff       	push   $0xffff8000
  200131:	68 01 df ce ab       	push   $0xabcedf01
  200136:	68 00 00 00 80       	push   $0x80000000
  20013b:	6a ff                	push   $0xffffffff
  20013d:	6a 00                	push   $0x0
  20013f:	68 f1 05 20 00       	push   $0x2005f1
  200144:	e8 fb 01 00 00       	call   200344 <printf>
  200149:	83 c4 1c             	add    $0x1c,%esp
  20014c:	68 8e 8e 01 00       	push   $0x18e8e
  200151:	68 00 80 ff ff       	push   $0xffff8000
  200156:	68 01 df ce ab       	push   $0xabcedf01
  20015b:	68 00 00 00 80       	push   $0x80000000
  200160:	6a ff                	push   $0xffffffff
  200162:	6a 00                	push   $0x0
  200164:	68 09 06 20 00       	push   $0x200609
  200169:	e8 d6 01 00 00       	call   200344 <printf>
  20016e:	83 c4 14             	add    $0x14,%esp
  200171:	68 cc 07 20 00       	push   $0x2007cc
  200176:	e8 c9 01 00 00       	call   200344 <printf>
  20017b:	c7 04 24 21 06 20 00 	movl   $0x200621,(%esp)
  200182:	e8 bd 01 00 00       	call   200344 <printf>
  200187:	83 c4 10             	add    $0x10,%esp
  20018a:	eb fe                	jmp    20018a <uEntry+0x18a>

0020018c <syscall>:
  20018c:	55                   	push   %ebp
  20018d:	89 e5                	mov    %esp,%ebp
  20018f:	8b 45 08             	mov    0x8(%ebp),%eax
  200192:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  200195:	8b 4d 10             	mov    0x10(%ebp),%ecx
  200198:	8b 55 14             	mov    0x14(%ebp),%edx
  20019b:	8b 7d 18             	mov    0x18(%ebp),%edi
  20019e:	8b 75 1c             	mov    0x1c(%ebp),%esi
  2001a1:	cd 80                	int    $0x80
  2001a3:	31 c0                	xor    %eax,%eax
  2001a5:	5d                   	pop    %ebp
  2001a6:	c3                   	ret    
  2001a7:	90                   	nop

002001a8 <fs_write>:
  2001a8:	55                   	push   %ebp
  2001a9:	89 e5                	mov    %esp,%ebp
  2001ab:	83 ec 20             	sub    $0x20,%esp
  2001ae:	c7 45 e8 04 00 00 00 	movl   $0x4,-0x18(%ebp)
  2001b5:	8b 45 08             	mov    0x8(%ebp),%eax
  2001b8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2001bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  2001be:	89 45 f0             	mov    %eax,-0x10(%ebp)
  2001c1:	8b 45 10             	mov    0x10(%ebp),%eax
  2001c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  2001c7:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2001ce:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2001d5:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2001d8:	8b 5d ec             	mov    -0x14(%ebp),%ebx
  2001db:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2001de:	8b 55 f4             	mov    -0xc(%ebp),%edx
  2001e1:	8b 7d f8             	mov    -0x8(%ebp),%edi
  2001e4:	8b 75 fc             	mov    -0x4(%ebp),%esi
  2001e7:	cd 80                	int    $0x80
  2001e9:	c9                   	leave  
  2001ea:	c3                   	ret    
  2001eb:	90                   	nop

002001ec <putchar_user>:
  2001ec:	55                   	push   %ebp
  2001ed:	89 e5                	mov    %esp,%ebp
  2001ef:	83 ec 24             	sub    $0x24,%esp
  2001f2:	c7 45 e8 04 00 00 00 	movl   $0x4,-0x18(%ebp)
  2001f9:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  200200:	8d 45 dc             	lea    -0x24(%ebp),%eax
  200203:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200206:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  20020d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200214:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  20021b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  20021e:	8b 5d ec             	mov    -0x14(%ebp),%ebx
  200221:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200224:	8b 55 f4             	mov    -0xc(%ebp),%edx
  200227:	8b 7d f8             	mov    -0x8(%ebp),%edi
  20022a:	8b 75 fc             	mov    -0x4(%ebp),%esi
  20022d:	cd 80                	int    $0x80
  20022f:	c9                   	leave  
  200230:	c3                   	ret    
  200231:	8d 76 00             	lea    0x0(%esi),%esi

00200234 <i2A>:
  200234:	55                   	push   %ebp
  200235:	89 e5                	mov    %esp,%ebp
  200237:	57                   	push   %edi
  200238:	56                   	push   %esi
  200239:	53                   	push   %ebx
  20023a:	51                   	push   %ecx
  20023b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  20023e:	85 c9                	test   %ecx,%ecx
  200240:	78 6e                	js     2002b0 <i2A+0x7c>
  200242:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  200246:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  20024a:	bb 3e 10 20 00       	mov    $0x20103e,%ebx
  20024f:	31 ff                	xor    %edi,%edi
  200251:	eb 03                	jmp    200256 <i2A+0x22>
  200253:	90                   	nop
  200254:	89 f7                	mov    %esi,%edi
  200256:	4b                   	dec    %ebx
  200257:	89 c8                	mov    %ecx,%eax
  200259:	be 0a 00 00 00       	mov    $0xa,%esi
  20025e:	99                   	cltd   
  20025f:	f7 fe                	idiv   %esi
  200261:	83 c2 30             	add    $0x30,%edx
  200264:	88 13                	mov    %dl,(%ebx)
  200266:	8d 77 01             	lea    0x1(%edi),%esi
  200269:	b8 67 66 66 66       	mov    $0x66666667,%eax
  20026e:	f7 e9                	imul   %ecx
  200270:	89 d0                	mov    %edx,%eax
  200272:	c1 f8 02             	sar    $0x2,%eax
  200275:	c1 f9 1f             	sar    $0x1f,%ecx
  200278:	29 c8                	sub    %ecx,%eax
  20027a:	89 c1                	mov    %eax,%ecx
  20027c:	75 d6                	jne    200254 <i2A+0x20>
  20027e:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  200282:	74 20                	je     2002a4 <i2A+0x70>
  200284:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  200288:	75 06                	jne    200290 <i2A+0x5c>
  20028a:	fe 05 3d 10 20 00    	incb   0x20103d
  200290:	c6 05 3e 10 20 00 00 	movb   $0x0,0x20103e
  200297:	8b 45 0c             	mov    0xc(%ebp),%eax
  20029a:	89 18                	mov    %ebx,(%eax)
  20029c:	89 f0                	mov    %esi,%eax
  20029e:	5a                   	pop    %edx
  20029f:	5b                   	pop    %ebx
  2002a0:	5e                   	pop    %esi
  2002a1:	5f                   	pop    %edi
  2002a2:	5d                   	pop    %ebp
  2002a3:	c3                   	ret    
  2002a4:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  2002a8:	8d 77 02             	lea    0x2(%edi),%esi
  2002ab:	4b                   	dec    %ebx
  2002ac:	eb d6                	jmp    200284 <i2A+0x50>
  2002ae:	66 90                	xchg   %ax,%ax
  2002b0:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  2002b6:	74 0c                	je     2002c4 <i2A+0x90>
  2002b8:	f7 d9                	neg    %ecx
  2002ba:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  2002be:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  2002c2:	eb 86                	jmp    20024a <i2A+0x16>
  2002c4:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  2002c9:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  2002cd:	eb ef                	jmp    2002be <i2A+0x8a>
  2002cf:	90                   	nop

002002d0 <i2X>:
  2002d0:	55                   	push   %ebp
  2002d1:	89 e5                	mov    %esp,%ebp
  2002d3:	57                   	push   %edi
  2002d4:	56                   	push   %esi
  2002d5:	53                   	push   %ebx
  2002d6:	8b 55 08             	mov    0x8(%ebp),%edx
  2002d9:	b9 1d 10 20 00       	mov    $0x20101d,%ecx
  2002de:	31 c0                	xor    %eax,%eax
  2002e0:	40                   	inc    %eax
  2002e1:	89 d6                	mov    %edx,%esi
  2002e3:	83 e6 0f             	and    $0xf,%esi
  2002e6:	8d 5e f6             	lea    -0xa(%esi),%ebx
  2002e9:	89 cf                	mov    %ecx,%edi
  2002eb:	83 fb 05             	cmp    $0x5,%ebx
  2002ee:	77 4c                	ja     20033c <i2X+0x6c>
  2002f0:	ff 24 9d 98 08 20 00 	jmp    *0x200898(,%ebx,4)
  2002f7:	90                   	nop
  2002f8:	c6 01 65             	movb   $0x65,(%ecx)
  2002fb:	90                   	nop
  2002fc:	49                   	dec    %ecx
  2002fd:	c1 ea 04             	shr    $0x4,%edx
  200300:	75 de                	jne    2002e0 <i2X+0x10>
  200302:	c6 05 1e 10 20 00 00 	movb   $0x0,0x20101e
  200309:	8b 55 0c             	mov    0xc(%ebp),%edx
  20030c:	89 3a                	mov    %edi,(%edx)
  20030e:	5b                   	pop    %ebx
  20030f:	5e                   	pop    %esi
  200310:	5f                   	pop    %edi
  200311:	5d                   	pop    %ebp
  200312:	c3                   	ret    
  200313:	90                   	nop
  200314:	c6 01 64             	movb   $0x64,(%ecx)
  200317:	eb e3                	jmp    2002fc <i2X+0x2c>
  200319:	8d 76 00             	lea    0x0(%esi),%esi
  20031c:	c6 01 63             	movb   $0x63,(%ecx)
  20031f:	eb db                	jmp    2002fc <i2X+0x2c>
  200321:	8d 76 00             	lea    0x0(%esi),%esi
  200324:	c6 01 62             	movb   $0x62,(%ecx)
  200327:	eb d3                	jmp    2002fc <i2X+0x2c>
  200329:	8d 76 00             	lea    0x0(%esi),%esi
  20032c:	c6 01 61             	movb   $0x61,(%ecx)
  20032f:	eb cb                	jmp    2002fc <i2X+0x2c>
  200331:	8d 76 00             	lea    0x0(%esi),%esi
  200334:	c6 01 66             	movb   $0x66,(%ecx)
  200337:	eb c3                	jmp    2002fc <i2X+0x2c>
  200339:	8d 76 00             	lea    0x0(%esi),%esi
  20033c:	8d 5e 30             	lea    0x30(%esi),%ebx
  20033f:	88 19                	mov    %bl,(%ecx)
  200341:	eb b9                	jmp    2002fc <i2X+0x2c>
  200343:	90                   	nop

00200344 <printf>:
  200344:	55                   	push   %ebp
  200345:	89 e5                	mov    %esp,%ebp
  200347:	57                   	push   %edi
  200348:	56                   	push   %esi
  200349:	53                   	push   %ebx
  20034a:	83 ec 24             	sub    $0x24,%esp
  20034d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  200350:	8a 11                	mov    (%ecx),%dl
  200352:	84 d2                	test   %dl,%dl
  200354:	0f 84 70 01 00 00    	je     2004ca <printf+0x186>
  20035a:	8d 45 0c             	lea    0xc(%ebp),%eax
  20035d:	31 ff                	xor    %edi,%edi
  20035f:	eb 18                	jmp    200379 <printf+0x35>
  200361:	8d 76 00             	lea    0x0(%esi),%esi
  200364:	8a 11                	mov    (%ecx),%dl
  200366:	89 cb                	mov    %ecx,%ebx
  200368:	88 97 40 10 20 00    	mov    %dl,0x201040(%edi)
  20036e:	47                   	inc    %edi
  20036f:	8d 4b 01             	lea    0x1(%ebx),%ecx
  200372:	8a 53 01             	mov    0x1(%ebx),%dl
  200375:	84 d2                	test   %dl,%dl
  200377:	74 72                	je     2003eb <printf+0xa7>
  200379:	80 fa 25             	cmp    $0x25,%dl
  20037c:	75 e6                	jne    200364 <printf+0x20>
  20037e:	8d 59 01             	lea    0x1(%ecx),%ebx
  200381:	8a 51 01             	mov    0x1(%ecx),%dl
  200384:	80 fa 64             	cmp    $0x64,%dl
  200387:	0f 84 db 00 00 00    	je     200468 <printf+0x124>
  20038d:	0f 8e 1d 01 00 00    	jle    2004b0 <printf+0x16c>
  200393:	80 fa 73             	cmp    $0x73,%dl
  200396:	0f 84 9c 00 00 00    	je     200438 <printf+0xf4>
  20039c:	80 fa 78             	cmp    $0x78,%dl
  20039f:	75 c7                	jne    200368 <printf+0x24>
  2003a1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2003a8:	8d 70 04             	lea    0x4(%eax),%esi
  2003ab:	89 75 d0             	mov    %esi,-0x30(%ebp)
  2003ae:	8d 75 f0             	lea    -0x10(%ebp),%esi
  2003b1:	56                   	push   %esi
  2003b2:	ff 30                	pushl  (%eax)
  2003b4:	e8 17 ff ff ff       	call   2002d0 <i2X>
  2003b9:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2003bc:	8d b7 40 10 20 00    	lea    0x201040(%edi),%esi
  2003c2:	8a 11                	mov    (%ecx),%dl
  2003c4:	83 c4 08             	add    $0x8,%esp
  2003c7:	31 c0                	xor    %eax,%eax
  2003c9:	84 d2                	test   %dl,%dl
  2003cb:	74 0f                	je     2003dc <printf+0x98>
  2003cd:	8d 76 00             	lea    0x0(%esi),%esi
  2003d0:	40                   	inc    %eax
  2003d1:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  2003d5:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  2003d8:	84 d2                	test   %dl,%dl
  2003da:	75 f4                	jne    2003d0 <printf+0x8c>
  2003dc:	01 c7                	add    %eax,%edi
  2003de:	8b 45 d0             	mov    -0x30(%ebp),%eax
  2003e1:	8d 4b 01             	lea    0x1(%ebx),%ecx
  2003e4:	8a 53 01             	mov    0x1(%ebx),%dl
  2003e7:	84 d2                	test   %dl,%dl
  2003e9:	75 8e                	jne    200379 <printf+0x35>
  2003eb:	8d 47 01             	lea    0x1(%edi),%eax
  2003ee:	c6 87 40 10 20 00 00 	movb   $0x0,0x201040(%edi)
  2003f5:	c7 45 f0 04 00 00 00 	movl   $0x4,-0x10(%ebp)
  2003fc:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  200403:	c7 45 e8 40 10 20 00 	movl   $0x201040,-0x18(%ebp)
  20040a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  20040d:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  200414:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  20041b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  20041e:	8b 5d ec             	mov    -0x14(%ebp),%ebx
  200421:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  200424:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  200427:	8b 7d e0             	mov    -0x20(%ebp),%edi
  20042a:	8b 75 dc             	mov    -0x24(%ebp),%esi
  20042d:	cd 80                	int    $0x80
  20042f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  200432:	5b                   	pop    %ebx
  200433:	5e                   	pop    %esi
  200434:	5f                   	pop    %edi
  200435:	5d                   	pop    %ebp
  200436:	c3                   	ret    
  200437:	90                   	nop
  200438:	8d 70 04             	lea    0x4(%eax),%esi
  20043b:	89 75 d0             	mov    %esi,-0x30(%ebp)
  20043e:	8b 08                	mov    (%eax),%ecx
  200440:	8d b7 40 10 20 00    	lea    0x201040(%edi),%esi
  200446:	8a 11                	mov    (%ecx),%dl
  200448:	31 c0                	xor    %eax,%eax
  20044a:	84 d2                	test   %dl,%dl
  20044c:	74 8e                	je     2003dc <printf+0x98>
  20044e:	66 90                	xchg   %ax,%ax
  200450:	40                   	inc    %eax
  200451:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  200455:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  200458:	84 d2                	test   %dl,%dl
  20045a:	75 f4                	jne    200450 <printf+0x10c>
  20045c:	01 c7                	add    %eax,%edi
  20045e:	8b 45 d0             	mov    -0x30(%ebp),%eax
  200461:	e9 7b ff ff ff       	jmp    2003e1 <printf+0x9d>
  200466:	66 90                	xchg   %ax,%ax
  200468:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  20046f:	8d 70 04             	lea    0x4(%eax),%esi
  200472:	89 75 d0             	mov    %esi,-0x30(%ebp)
  200475:	8d 75 f0             	lea    -0x10(%ebp),%esi
  200478:	56                   	push   %esi
  200479:	ff 30                	pushl  (%eax)
  20047b:	e8 b4 fd ff ff       	call   200234 <i2A>
  200480:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200483:	8d b7 40 10 20 00    	lea    0x201040(%edi),%esi
  200489:	8a 11                	mov    (%ecx),%dl
  20048b:	83 c4 08             	add    $0x8,%esp
  20048e:	31 c0                	xor    %eax,%eax
  200490:	84 d2                	test   %dl,%dl
  200492:	0f 84 44 ff ff ff    	je     2003dc <printf+0x98>
  200498:	40                   	inc    %eax
  200499:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  20049d:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  2004a0:	84 d2                	test   %dl,%dl
  2004a2:	75 f4                	jne    200498 <printf+0x154>
  2004a4:	01 c7                	add    %eax,%edi
  2004a6:	8b 45 d0             	mov    -0x30(%ebp),%eax
  2004a9:	e9 33 ff ff ff       	jmp    2003e1 <printf+0x9d>
  2004ae:	66 90                	xchg   %ax,%ax
  2004b0:	80 fa 63             	cmp    $0x63,%dl
  2004b3:	0f 85 af fe ff ff    	jne    200368 <printf+0x24>
  2004b9:	8b 10                	mov    (%eax),%edx
  2004bb:	88 97 40 10 20 00    	mov    %dl,0x201040(%edi)
  2004c1:	83 c0 04             	add    $0x4,%eax
  2004c4:	47                   	inc    %edi
  2004c5:	e9 a5 fe ff ff       	jmp    20036f <printf+0x2b>
  2004ca:	b8 01 00 00 00       	mov    $0x1,%eax
  2004cf:	31 ff                	xor    %edi,%edi
  2004d1:	e9 18 ff ff ff       	jmp    2003ee <printf+0xaa>
  2004d6:	66 90                	xchg   %ax,%ax

002004d8 <memcpy>:
  2004d8:	55                   	push   %ebp
  2004d9:	89 e5                	mov    %esp,%ebp
  2004db:	57                   	push   %edi
  2004dc:	56                   	push   %esi
  2004dd:	53                   	push   %ebx
  2004de:	8b 55 08             	mov    0x8(%ebp),%edx
  2004e1:	8b 7d 0c             	mov    0xc(%ebp),%edi
  2004e4:	8b 45 10             	mov    0x10(%ebp),%eax
  2004e7:	85 c0                	test   %eax,%eax
  2004e9:	7e 35                	jle    200520 <memcpy+0x48>
  2004eb:	8a 1f                	mov    (%edi),%bl
  2004ed:	84 db                	test   %bl,%bl
  2004ef:	74 2f                	je     200520 <memcpy+0x48>
  2004f1:	8d 34 02             	lea    (%edx,%eax,1),%esi
  2004f4:	31 c9                	xor    %ecx,%ecx
  2004f6:	eb 07                	jmp    2004ff <memcpy+0x27>
  2004f8:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  2004fb:	84 db                	test   %bl,%bl
  2004fd:	74 15                	je     200514 <memcpy+0x3c>
  2004ff:	42                   	inc    %edx
  200500:	88 5a ff             	mov    %bl,-0x1(%edx)
  200503:	41                   	inc    %ecx
  200504:	39 f2                	cmp    %esi,%edx
  200506:	75 f0                	jne    2004f8 <memcpy+0x20>
  200508:	c6 06 00             	movb   $0x0,(%esi)
  20050b:	29 c8                	sub    %ecx,%eax
  20050d:	5b                   	pop    %ebx
  20050e:	5e                   	pop    %esi
  20050f:	5f                   	pop    %edi
  200510:	5d                   	pop    %ebp
  200511:	c3                   	ret    
  200512:	66 90                	xchg   %ax,%ax
  200514:	89 d6                	mov    %edx,%esi
  200516:	c6 06 00             	movb   $0x0,(%esi)
  200519:	29 c8                	sub    %ecx,%eax
  20051b:	5b                   	pop    %ebx
  20051c:	5e                   	pop    %esi
  20051d:	5f                   	pop    %edi
  20051e:	5d                   	pop    %ebp
  20051f:	c3                   	ret    
  200520:	89 d6                	mov    %edx,%esi
  200522:	31 c9                	xor    %ecx,%ecx
  200524:	eb e2                	jmp    200508 <memcpy+0x30>
  200526:	66 90                	xchg   %ax,%ax

00200528 <length_str>:
  200528:	55                   	push   %ebp
  200529:	89 e5                	mov    %esp,%ebp
  20052b:	8b 55 08             	mov    0x8(%ebp),%edx
  20052e:	31 c0                	xor    %eax,%eax
  200530:	80 3a 00             	cmpb   $0x0,(%edx)
  200533:	74 0a                	je     20053f <length_str+0x17>
  200535:	8d 76 00             	lea    0x0(%esi),%esi
  200538:	40                   	inc    %eax
  200539:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  20053d:	75 f9                	jne    200538 <length_str+0x10>
  20053f:	5d                   	pop    %ebp
  200540:	c3                   	ret    
