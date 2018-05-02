
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	53                   	push   %ebx
  200004:	50                   	push   %eax
  200005:	e8 66 00 00 00       	call   200070 <fork>
  20000a:	89 c3                	mov    %eax,%ebx
  20000c:	85 c0                	test   %eax,%eax
  20000e:	75 28                	jne    200038 <uEntry+0x38>
  200010:	83 ec 0c             	sub    $0xc,%esp
  200013:	68 f8 04 20 00       	push   $0x2004f8
  200018:	e8 43 03 00 00       	call   200360 <printf>
  20001d:	83 c4 10             	add    $0x10,%esp
  200020:	83 ec 08             	sub    $0x8,%esp
  200023:	53                   	push   %ebx
  200024:	68 11 05 20 00       	push   $0x200511
  200029:	e8 32 03 00 00       	call   200360 <printf>
  20002e:	e8 d5 00 00 00       	call   200108 <exit>
  200033:	83 c4 10             	add    $0x10,%esp
  200036:	eb fe                	jmp    200036 <uEntry+0x36>
  200038:	83 ec 0c             	sub    $0xc,%esp
  20003b:	68 04 05 20 00       	push   $0x200504
  200040:	e8 1b 03 00 00       	call   200360 <printf>
  200045:	83 c4 10             	add    $0x10,%esp
  200048:	eb d6                	jmp    200020 <uEntry+0x20>
  20004a:	66 90                	xchg   %ax,%ax

0020004c <syscall>:
  20004c:	55                   	push   %ebp
  20004d:	89 e5                	mov    %esp,%ebp
  20004f:	83 ec 10             	sub    $0x10,%esp
  200052:	8b 45 08             	mov    0x8(%ebp),%eax
  200055:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  200058:	8b 4d 10             	mov    0x10(%ebp),%ecx
  20005b:	8b 55 14             	mov    0x14(%ebp),%edx
  20005e:	8b 7d 18             	mov    0x18(%ebp),%edi
  200061:	8b 75 1c             	mov    0x1c(%ebp),%esi
  200064:	cd 80                	int    $0x80
  200066:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200069:	8b 45 fc             	mov    -0x4(%ebp),%eax
  20006c:	c9                   	leave  
  20006d:	c3                   	ret    
  20006e:	66 90                	xchg   %ax,%ax

00200070 <fork>:
  200070:	55                   	push   %ebp
  200071:	89 e5                	mov    %esp,%ebp
  200073:	83 ec 20             	sub    $0x20,%esp
  200076:	c7 45 e4 02 00 00 00 	movl   $0x2,-0x1c(%ebp)
  20007d:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  200084:	c7 45 ec 1b 05 20 00 	movl   $0x20051b,-0x14(%ebp)
  20008b:	c7 45 f0 0d 00 00 00 	movl   $0xd,-0x10(%ebp)
  200092:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200099:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2000a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2000a3:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2000a6:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2000a9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2000ac:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2000af:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2000b2:	cd 80                	int    $0x80
  2000b4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2000b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2000ba:	c9                   	leave  
  2000bb:	c3                   	ret    

002000bc <sleep>:
  2000bc:	55                   	push   %ebp
  2000bd:	89 e5                	mov    %esp,%ebp
  2000bf:	83 ec 20             	sub    $0x20,%esp
  2000c2:	c7 45 e4 e6 00 00 00 	movl   $0xe6,-0x1c(%ebp)
  2000c9:	8b 45 08             	mov    0x8(%ebp),%eax
  2000cc:	89 45 e8             	mov    %eax,-0x18(%ebp)
  2000cf:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  2000d6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2000dd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2000e4:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2000eb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2000ee:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2000f1:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2000f4:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2000f7:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2000fa:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2000fd:	cd 80                	int    $0x80
  2000ff:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200102:	31 c0                	xor    %eax,%eax
  200104:	c9                   	leave  
  200105:	c3                   	ret    
  200106:	66 90                	xchg   %ax,%ax

00200108 <exit>:
  200108:	55                   	push   %ebp
  200109:	89 e5                	mov    %esp,%ebp
  20010b:	83 ec 20             	sub    $0x20,%esp
  20010e:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  200115:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  20011c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  200123:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  20012a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200131:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200138:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  20013b:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  20013e:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200141:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200144:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200147:	8b 75 f8             	mov    -0x8(%ebp),%esi
  20014a:	cd 80                	int    $0x80
  20014c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20014f:	31 c0                	xor    %eax,%eax
  200151:	c9                   	leave  
  200152:	c3                   	ret    
  200153:	90                   	nop

00200154 <fs_write>:
  200154:	55                   	push   %ebp
  200155:	89 e5                	mov    %esp,%ebp
  200157:	83 ec 20             	sub    $0x20,%esp
  20015a:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  200161:	8b 45 08             	mov    0x8(%ebp),%eax
  200164:	89 45 e8             	mov    %eax,-0x18(%ebp)
  200167:	8b 45 0c             	mov    0xc(%ebp),%eax
  20016a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  20016d:	8b 45 10             	mov    0x10(%ebp),%eax
  200170:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200173:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20017a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200181:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  200184:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  200187:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  20018a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  20018d:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200190:	8b 75 f8             	mov    -0x8(%ebp),%esi
  200193:	cd 80                	int    $0x80
  200195:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200198:	c9                   	leave  
  200199:	c3                   	ret    
  20019a:	66 90                	xchg   %ax,%ax

0020019c <putchar_user>:
  20019c:	55                   	push   %ebp
  20019d:	89 e5                	mov    %esp,%ebp
  20019f:	83 ec 24             	sub    $0x24,%esp
  2001a2:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  2001a9:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  2001b0:	8d 45 dc             	lea    -0x24(%ebp),%eax
  2001b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2001b6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  2001bd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2001c4:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2001cb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2001ce:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2001d1:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2001d4:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2001d7:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2001da:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2001dd:	cd 80                	int    $0x80
  2001df:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2001e2:	c9                   	leave  
  2001e3:	c3                   	ret    

002001e4 <i2A>:
  2001e4:	55                   	push   %ebp
  2001e5:	89 e5                	mov    %esp,%ebp
  2001e7:	57                   	push   %edi
  2001e8:	56                   	push   %esi
  2001e9:	53                   	push   %ebx
  2001ea:	51                   	push   %ecx
  2001eb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2001ee:	85 c9                	test   %ecx,%ecx
  2001f0:	78 6e                	js     200260 <i2A+0x7c>
  2001f2:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  2001f6:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  2001fa:	bb 62 17 20 00       	mov    $0x201762,%ebx
  2001ff:	31 ff                	xor    %edi,%edi
  200201:	eb 03                	jmp    200206 <i2A+0x22>
  200203:	90                   	nop
  200204:	89 f7                	mov    %esi,%edi
  200206:	4b                   	dec    %ebx
  200207:	89 c8                	mov    %ecx,%eax
  200209:	be 0a 00 00 00       	mov    $0xa,%esi
  20020e:	99                   	cltd   
  20020f:	f7 fe                	idiv   %esi
  200211:	83 c2 30             	add    $0x30,%edx
  200214:	88 13                	mov    %dl,(%ebx)
  200216:	8d 77 01             	lea    0x1(%edi),%esi
  200219:	b8 67 66 66 66       	mov    $0x66666667,%eax
  20021e:	f7 e9                	imul   %ecx
  200220:	89 d0                	mov    %edx,%eax
  200222:	c1 f8 02             	sar    $0x2,%eax
  200225:	c1 f9 1f             	sar    $0x1f,%ecx
  200228:	29 c8                	sub    %ecx,%eax
  20022a:	89 c1                	mov    %eax,%ecx
  20022c:	75 d6                	jne    200204 <i2A+0x20>
  20022e:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  200232:	74 20                	je     200254 <i2A+0x70>
  200234:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  200238:	75 06                	jne    200240 <i2A+0x5c>
  20023a:	fe 05 61 17 20 00    	incb   0x201761
  200240:	c6 05 62 17 20 00 00 	movb   $0x0,0x201762
  200247:	8b 45 0c             	mov    0xc(%ebp),%eax
  20024a:	89 18                	mov    %ebx,(%eax)
  20024c:	89 f0                	mov    %esi,%eax
  20024e:	5a                   	pop    %edx
  20024f:	5b                   	pop    %ebx
  200250:	5e                   	pop    %esi
  200251:	5f                   	pop    %edi
  200252:	5d                   	pop    %ebp
  200253:	c3                   	ret    
  200254:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  200258:	8d 77 02             	lea    0x2(%edi),%esi
  20025b:	4b                   	dec    %ebx
  20025c:	eb d6                	jmp    200234 <i2A+0x50>
  20025e:	66 90                	xchg   %ax,%ax
  200260:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  200266:	74 0c                	je     200274 <i2A+0x90>
  200268:	f7 d9                	neg    %ecx
  20026a:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  20026e:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  200272:	eb 86                	jmp    2001fa <i2A+0x16>
  200274:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  200279:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  20027d:	eb ef                	jmp    20026e <i2A+0x8a>
  20027f:	90                   	nop

00200280 <i2X>:
  200280:	55                   	push   %ebp
  200281:	89 e5                	mov    %esp,%ebp
  200283:	57                   	push   %edi
  200284:	56                   	push   %esi
  200285:	53                   	push   %ebx
  200286:	8b 55 08             	mov    0x8(%ebp),%edx
  200289:	b9 41 17 20 00       	mov    $0x201741,%ecx
  20028e:	31 c0                	xor    %eax,%eax
  200290:	40                   	inc    %eax
  200291:	89 d6                	mov    %edx,%esi
  200293:	83 e6 0f             	and    $0xf,%esi
  200296:	8d 5e f6             	lea    -0xa(%esi),%ebx
  200299:	89 cf                	mov    %ecx,%edi
  20029b:	83 fb 05             	cmp    $0x5,%ebx
  20029e:	77 4c                	ja     2002ec <i2X+0x6c>
  2002a0:	ff 24 9d 24 05 20 00 	jmp    *0x200524(,%ebx,4)
  2002a7:	90                   	nop
  2002a8:	c6 01 65             	movb   $0x65,(%ecx)
  2002ab:	90                   	nop
  2002ac:	49                   	dec    %ecx
  2002ad:	c1 ea 04             	shr    $0x4,%edx
  2002b0:	75 de                	jne    200290 <i2X+0x10>
  2002b2:	c6 05 42 17 20 00 00 	movb   $0x0,0x201742
  2002b9:	8b 55 0c             	mov    0xc(%ebp),%edx
  2002bc:	89 3a                	mov    %edi,(%edx)
  2002be:	5b                   	pop    %ebx
  2002bf:	5e                   	pop    %esi
  2002c0:	5f                   	pop    %edi
  2002c1:	5d                   	pop    %ebp
  2002c2:	c3                   	ret    
  2002c3:	90                   	nop
  2002c4:	c6 01 64             	movb   $0x64,(%ecx)
  2002c7:	eb e3                	jmp    2002ac <i2X+0x2c>
  2002c9:	8d 76 00             	lea    0x0(%esi),%esi
  2002cc:	c6 01 63             	movb   $0x63,(%ecx)
  2002cf:	eb db                	jmp    2002ac <i2X+0x2c>
  2002d1:	8d 76 00             	lea    0x0(%esi),%esi
  2002d4:	c6 01 62             	movb   $0x62,(%ecx)
  2002d7:	eb d3                	jmp    2002ac <i2X+0x2c>
  2002d9:	8d 76 00             	lea    0x0(%esi),%esi
  2002dc:	c6 01 61             	movb   $0x61,(%ecx)
  2002df:	eb cb                	jmp    2002ac <i2X+0x2c>
  2002e1:	8d 76 00             	lea    0x0(%esi),%esi
  2002e4:	c6 01 66             	movb   $0x66,(%ecx)
  2002e7:	eb c3                	jmp    2002ac <i2X+0x2c>
  2002e9:	8d 76 00             	lea    0x0(%esi),%esi
  2002ec:	8d 5e 30             	lea    0x30(%esi),%ebx
  2002ef:	88 19                	mov    %bl,(%ecx)
  2002f1:	eb b9                	jmp    2002ac <i2X+0x2c>
  2002f3:	90                   	nop

002002f4 <memcpy>:
  2002f4:	55                   	push   %ebp
  2002f5:	89 e5                	mov    %esp,%ebp
  2002f7:	57                   	push   %edi
  2002f8:	56                   	push   %esi
  2002f9:	53                   	push   %ebx
  2002fa:	8b 55 08             	mov    0x8(%ebp),%edx
  2002fd:	8b 7d 0c             	mov    0xc(%ebp),%edi
  200300:	8b 45 10             	mov    0x10(%ebp),%eax
  200303:	85 c0                	test   %eax,%eax
  200305:	7e 35                	jle    20033c <memcpy+0x48>
  200307:	8a 1f                	mov    (%edi),%bl
  200309:	84 db                	test   %bl,%bl
  20030b:	74 2f                	je     20033c <memcpy+0x48>
  20030d:	8d 34 02             	lea    (%edx,%eax,1),%esi
  200310:	31 c9                	xor    %ecx,%ecx
  200312:	eb 07                	jmp    20031b <memcpy+0x27>
  200314:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  200317:	84 db                	test   %bl,%bl
  200319:	74 15                	je     200330 <memcpy+0x3c>
  20031b:	42                   	inc    %edx
  20031c:	88 5a ff             	mov    %bl,-0x1(%edx)
  20031f:	41                   	inc    %ecx
  200320:	39 f2                	cmp    %esi,%edx
  200322:	75 f0                	jne    200314 <memcpy+0x20>
  200324:	c6 06 00             	movb   $0x0,(%esi)
  200327:	29 c8                	sub    %ecx,%eax
  200329:	5b                   	pop    %ebx
  20032a:	5e                   	pop    %esi
  20032b:	5f                   	pop    %edi
  20032c:	5d                   	pop    %ebp
  20032d:	c3                   	ret    
  20032e:	66 90                	xchg   %ax,%ax
  200330:	89 d6                	mov    %edx,%esi
  200332:	c6 06 00             	movb   $0x0,(%esi)
  200335:	29 c8                	sub    %ecx,%eax
  200337:	5b                   	pop    %ebx
  200338:	5e                   	pop    %esi
  200339:	5f                   	pop    %edi
  20033a:	5d                   	pop    %ebp
  20033b:	c3                   	ret    
  20033c:	89 d6                	mov    %edx,%esi
  20033e:	31 c9                	xor    %ecx,%ecx
  200340:	eb e2                	jmp    200324 <memcpy+0x30>
  200342:	66 90                	xchg   %ax,%ax

00200344 <length_str>:
  200344:	55                   	push   %ebp
  200345:	89 e5                	mov    %esp,%ebp
  200347:	8b 55 08             	mov    0x8(%ebp),%edx
  20034a:	31 c0                	xor    %eax,%eax
  20034c:	80 3a 00             	cmpb   $0x0,(%edx)
  20034f:	74 0a                	je     20035b <length_str+0x17>
  200351:	8d 76 00             	lea    0x0(%esi),%esi
  200354:	40                   	inc    %eax
  200355:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  200359:	75 f9                	jne    200354 <length_str+0x10>
  20035b:	5d                   	pop    %ebp
  20035c:	c3                   	ret    
  20035d:	8d 76 00             	lea    0x0(%esi),%esi

00200360 <printf>:
  200360:	55                   	push   %ebp
  200361:	89 e5                	mov    %esp,%ebp
  200363:	57                   	push   %edi
  200364:	56                   	push   %esi
  200365:	53                   	push   %ebx
  200366:	83 ec 24             	sub    $0x24,%esp
  200369:	8b 4d 08             	mov    0x8(%ebp),%ecx
  20036c:	8a 11                	mov    (%ecx),%dl
  20036e:	84 d2                	test   %dl,%dl
  200370:	0f 84 74 01 00 00    	je     2004ea <printf+0x18a>
  200376:	8d 45 0c             	lea    0xc(%ebp),%eax
  200379:	31 ff                	xor    %edi,%edi
  20037b:	eb 18                	jmp    200395 <printf+0x35>
  20037d:	8d 76 00             	lea    0x0(%esi),%esi
  200380:	8a 11                	mov    (%ecx),%dl
  200382:	89 cb                	mov    %ecx,%ebx
  200384:	88 97 80 17 20 00    	mov    %dl,0x201780(%edi)
  20038a:	47                   	inc    %edi
  20038b:	8d 4b 01             	lea    0x1(%ebx),%ecx
  20038e:	8a 53 01             	mov    0x1(%ebx),%dl
  200391:	84 d2                	test   %dl,%dl
  200393:	74 72                	je     200407 <printf+0xa7>
  200395:	80 fa 25             	cmp    $0x25,%dl
  200398:	75 e6                	jne    200380 <printf+0x20>
  20039a:	8d 59 01             	lea    0x1(%ecx),%ebx
  20039d:	8a 51 01             	mov    0x1(%ecx),%dl
  2003a0:	80 fa 64             	cmp    $0x64,%dl
  2003a3:	0f 84 df 00 00 00    	je     200488 <printf+0x128>
  2003a9:	0f 8e 21 01 00 00    	jle    2004d0 <printf+0x170>
  2003af:	80 fa 73             	cmp    $0x73,%dl
  2003b2:	0f 84 a0 00 00 00    	je     200458 <printf+0xf8>
  2003b8:	80 fa 78             	cmp    $0x78,%dl
  2003bb:	75 c7                	jne    200384 <printf+0x24>
  2003bd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2003c4:	8d 70 04             	lea    0x4(%eax),%esi
  2003c7:	89 75 d0             	mov    %esi,-0x30(%ebp)
  2003ca:	8d 75 f0             	lea    -0x10(%ebp),%esi
  2003cd:	56                   	push   %esi
  2003ce:	ff 30                	pushl  (%eax)
  2003d0:	e8 ab fe ff ff       	call   200280 <i2X>
  2003d5:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2003d8:	8d b7 80 17 20 00    	lea    0x201780(%edi),%esi
  2003de:	8a 11                	mov    (%ecx),%dl
  2003e0:	83 c4 08             	add    $0x8,%esp
  2003e3:	31 c0                	xor    %eax,%eax
  2003e5:	84 d2                	test   %dl,%dl
  2003e7:	74 0f                	je     2003f8 <printf+0x98>
  2003e9:	8d 76 00             	lea    0x0(%esi),%esi
  2003ec:	40                   	inc    %eax
  2003ed:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  2003f1:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  2003f4:	84 d2                	test   %dl,%dl
  2003f6:	75 f4                	jne    2003ec <printf+0x8c>
  2003f8:	01 c7                	add    %eax,%edi
  2003fa:	8b 45 d0             	mov    -0x30(%ebp),%eax
  2003fd:	8d 4b 01             	lea    0x1(%ebx),%ecx
  200400:	8a 53 01             	mov    0x1(%ebx),%dl
  200403:	84 d2                	test   %dl,%dl
  200405:	75 8e                	jne    200395 <printf+0x35>
  200407:	8d 47 01             	lea    0x1(%edi),%eax
  20040a:	c6 87 80 17 20 00 00 	movb   $0x0,0x201780(%edi)
  200411:	c7 45 ec 04 00 00 00 	movl   $0x4,-0x14(%ebp)
  200418:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  20041f:	c7 45 e4 80 17 20 00 	movl   $0x201780,-0x1c(%ebp)
  200426:	89 45 e0             	mov    %eax,-0x20(%ebp)
  200429:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  200430:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  200437:	8b 45 ec             	mov    -0x14(%ebp),%eax
  20043a:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  20043d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  200440:	8b 55 e0             	mov    -0x20(%ebp),%edx
  200443:	8b 7d dc             	mov    -0x24(%ebp),%edi
  200446:	8b 75 d8             	mov    -0x28(%ebp),%esi
  200449:	cd 80                	int    $0x80
  20044b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20044e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  200451:	5b                   	pop    %ebx
  200452:	5e                   	pop    %esi
  200453:	5f                   	pop    %edi
  200454:	5d                   	pop    %ebp
  200455:	c3                   	ret    
  200456:	66 90                	xchg   %ax,%ax
  200458:	8d 70 04             	lea    0x4(%eax),%esi
  20045b:	89 75 d0             	mov    %esi,-0x30(%ebp)
  20045e:	8b 08                	mov    (%eax),%ecx
  200460:	8d b7 80 17 20 00    	lea    0x201780(%edi),%esi
  200466:	8a 11                	mov    (%ecx),%dl
  200468:	31 c0                	xor    %eax,%eax
  20046a:	84 d2                	test   %dl,%dl
  20046c:	74 8a                	je     2003f8 <printf+0x98>
  20046e:	66 90                	xchg   %ax,%ax
  200470:	40                   	inc    %eax
  200471:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  200475:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  200478:	84 d2                	test   %dl,%dl
  20047a:	75 f4                	jne    200470 <printf+0x110>
  20047c:	01 c7                	add    %eax,%edi
  20047e:	8b 45 d0             	mov    -0x30(%ebp),%eax
  200481:	e9 77 ff ff ff       	jmp    2003fd <printf+0x9d>
  200486:	66 90                	xchg   %ax,%ax
  200488:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  20048f:	8d 70 04             	lea    0x4(%eax),%esi
  200492:	89 75 d0             	mov    %esi,-0x30(%ebp)
  200495:	8d 75 f0             	lea    -0x10(%ebp),%esi
  200498:	56                   	push   %esi
  200499:	ff 30                	pushl  (%eax)
  20049b:	e8 44 fd ff ff       	call   2001e4 <i2A>
  2004a0:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2004a3:	8d b7 80 17 20 00    	lea    0x201780(%edi),%esi
  2004a9:	8a 11                	mov    (%ecx),%dl
  2004ab:	83 c4 08             	add    $0x8,%esp
  2004ae:	31 c0                	xor    %eax,%eax
  2004b0:	84 d2                	test   %dl,%dl
  2004b2:	0f 84 40 ff ff ff    	je     2003f8 <printf+0x98>
  2004b8:	40                   	inc    %eax
  2004b9:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  2004bd:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  2004c0:	84 d2                	test   %dl,%dl
  2004c2:	75 f4                	jne    2004b8 <printf+0x158>
  2004c4:	01 c7                	add    %eax,%edi
  2004c6:	8b 45 d0             	mov    -0x30(%ebp),%eax
  2004c9:	e9 2f ff ff ff       	jmp    2003fd <printf+0x9d>
  2004ce:	66 90                	xchg   %ax,%ax
  2004d0:	80 fa 63             	cmp    $0x63,%dl
  2004d3:	0f 85 ab fe ff ff    	jne    200384 <printf+0x24>
  2004d9:	8b 10                	mov    (%eax),%edx
  2004db:	88 97 80 17 20 00    	mov    %dl,0x201780(%edi)
  2004e1:	83 c0 04             	add    $0x4,%eax
  2004e4:	47                   	inc    %edi
  2004e5:	e9 a1 fe ff ff       	jmp    20038b <printf+0x2b>
  2004ea:	b8 01 00 00 00       	mov    $0x1,%eax
  2004ef:	31 ff                	xor    %edi,%edi
  2004f1:	e9 14 ff ff ff       	jmp    20040a <printf+0xaa>
