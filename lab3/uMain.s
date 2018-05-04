
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	83 ec 14             	sub    $0x14,%esp
  200006:	68 e0 04 20 00       	push   $0x2004e0
  20000b:	e8 38 03 00 00       	call   200348 <printf>
  200010:	c7 04 24 3a 00 00 00 	movl   $0x3a,(%esp)
  200017:	e8 88 00 00 00       	call   2000a4 <sleep>
  20001c:	c7 04 24 e5 04 20 00 	movl   $0x2004e5,(%esp)
  200023:	e8 20 03 00 00       	call   200348 <printf>
  200028:	e8 c3 00 00 00       	call   2000f0 <exit>
  20002d:	83 c4 10             	add    $0x10,%esp
  200030:	eb fe                	jmp    200030 <uEntry+0x30>
  200032:	66 90                	xchg   %ax,%ax

00200034 <syscall>:
  200034:	55                   	push   %ebp
  200035:	89 e5                	mov    %esp,%ebp
  200037:	83 ec 10             	sub    $0x10,%esp
  20003a:	8b 45 08             	mov    0x8(%ebp),%eax
  20003d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  200040:	8b 4d 10             	mov    0x10(%ebp),%ecx
  200043:	8b 55 14             	mov    0x14(%ebp),%edx
  200046:	8b 7d 18             	mov    0x18(%ebp),%edi
  200049:	8b 75 1c             	mov    0x1c(%ebp),%esi
  20004c:	cd 80                	int    $0x80
  20004e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200051:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200054:	c9                   	leave  
  200055:	c3                   	ret    
  200056:	66 90                	xchg   %ax,%ax

00200058 <fork>:
  200058:	55                   	push   %ebp
  200059:	89 e5                	mov    %esp,%ebp
  20005b:	83 ec 20             	sub    $0x20,%esp
  20005e:	c7 45 e4 02 00 00 00 	movl   $0x2,-0x1c(%ebp)
  200065:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  20006c:	c7 45 ec eb 04 20 00 	movl   $0x2004eb,-0x14(%ebp)
  200073:	c7 45 f0 0d 00 00 00 	movl   $0xd,-0x10(%ebp)
  20007a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200081:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200088:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  20008b:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  20008e:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200091:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200094:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200097:	8b 75 f8             	mov    -0x8(%ebp),%esi
  20009a:	cd 80                	int    $0x80
  20009c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20009f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2000a2:	c9                   	leave  
  2000a3:	c3                   	ret    

002000a4 <sleep>:
  2000a4:	55                   	push   %ebp
  2000a5:	89 e5                	mov    %esp,%ebp
  2000a7:	83 ec 20             	sub    $0x20,%esp
  2000aa:	c7 45 e4 e6 00 00 00 	movl   $0xe6,-0x1c(%ebp)
  2000b1:	8b 45 08             	mov    0x8(%ebp),%eax
  2000b4:	89 45 e8             	mov    %eax,-0x18(%ebp)
  2000b7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  2000be:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2000c5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2000cc:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2000d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2000d6:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2000d9:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2000dc:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2000df:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2000e2:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2000e5:	cd 80                	int    $0x80
  2000e7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2000ea:	31 c0                	xor    %eax,%eax
  2000ec:	c9                   	leave  
  2000ed:	c3                   	ret    
  2000ee:	66 90                	xchg   %ax,%ax

002000f0 <exit>:
  2000f0:	55                   	push   %ebp
  2000f1:	89 e5                	mov    %esp,%ebp
  2000f3:	83 ec 20             	sub    $0x20,%esp
  2000f6:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  2000fd:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  200104:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  20010b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200112:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200119:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200120:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  200123:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  200126:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200129:	8b 55 f0             	mov    -0x10(%ebp),%edx
  20012c:	8b 7d f4             	mov    -0xc(%ebp),%edi
  20012f:	8b 75 f8             	mov    -0x8(%ebp),%esi
  200132:	cd 80                	int    $0x80
  200134:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200137:	31 c0                	xor    %eax,%eax
  200139:	c9                   	leave  
  20013a:	c3                   	ret    
  20013b:	90                   	nop

0020013c <fs_write>:
  20013c:	55                   	push   %ebp
  20013d:	89 e5                	mov    %esp,%ebp
  20013f:	83 ec 20             	sub    $0x20,%esp
  200142:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  200149:	8b 45 08             	mov    0x8(%ebp),%eax
  20014c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  20014f:	8b 45 0c             	mov    0xc(%ebp),%eax
  200152:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200155:	8b 45 10             	mov    0x10(%ebp),%eax
  200158:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20015b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200162:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200169:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  20016c:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  20016f:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200172:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200175:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200178:	8b 75 f8             	mov    -0x8(%ebp),%esi
  20017b:	cd 80                	int    $0x80
  20017d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200180:	c9                   	leave  
  200181:	c3                   	ret    
  200182:	66 90                	xchg   %ax,%ax

00200184 <putchar_user>:
  200184:	55                   	push   %ebp
  200185:	89 e5                	mov    %esp,%ebp
  200187:	83 ec 24             	sub    $0x24,%esp
  20018a:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  200191:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  200198:	8d 45 dc             	lea    -0x24(%ebp),%eax
  20019b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  20019e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  2001a5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2001ac:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2001b3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2001b6:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2001b9:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2001bc:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2001bf:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2001c2:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2001c5:	cd 80                	int    $0x80
  2001c7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2001ca:	c9                   	leave  
  2001cb:	c3                   	ret    

002001cc <i2A>:
  2001cc:	55                   	push   %ebp
  2001cd:	89 e5                	mov    %esp,%ebp
  2001cf:	57                   	push   %edi
  2001d0:	56                   	push   %esi
  2001d1:	53                   	push   %ebx
  2001d2:	51                   	push   %ecx
  2001d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2001d6:	85 c9                	test   %ecx,%ecx
  2001d8:	78 6e                	js     200248 <i2A+0x7c>
  2001da:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  2001de:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  2001e2:	bb 42 17 20 00       	mov    $0x201742,%ebx
  2001e7:	31 ff                	xor    %edi,%edi
  2001e9:	eb 03                	jmp    2001ee <i2A+0x22>
  2001eb:	90                   	nop
  2001ec:	89 f7                	mov    %esi,%edi
  2001ee:	4b                   	dec    %ebx
  2001ef:	89 c8                	mov    %ecx,%eax
  2001f1:	be 0a 00 00 00       	mov    $0xa,%esi
  2001f6:	99                   	cltd   
  2001f7:	f7 fe                	idiv   %esi
  2001f9:	83 c2 30             	add    $0x30,%edx
  2001fc:	88 13                	mov    %dl,(%ebx)
  2001fe:	8d 77 01             	lea    0x1(%edi),%esi
  200201:	b8 67 66 66 66       	mov    $0x66666667,%eax
  200206:	f7 e9                	imul   %ecx
  200208:	89 d0                	mov    %edx,%eax
  20020a:	c1 f8 02             	sar    $0x2,%eax
  20020d:	c1 f9 1f             	sar    $0x1f,%ecx
  200210:	29 c8                	sub    %ecx,%eax
  200212:	89 c1                	mov    %eax,%ecx
  200214:	75 d6                	jne    2001ec <i2A+0x20>
  200216:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  20021a:	74 20                	je     20023c <i2A+0x70>
  20021c:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  200220:	75 06                	jne    200228 <i2A+0x5c>
  200222:	fe 05 41 17 20 00    	incb   0x201741
  200228:	c6 05 42 17 20 00 00 	movb   $0x0,0x201742
  20022f:	8b 45 0c             	mov    0xc(%ebp),%eax
  200232:	89 18                	mov    %ebx,(%eax)
  200234:	89 f0                	mov    %esi,%eax
  200236:	5a                   	pop    %edx
  200237:	5b                   	pop    %ebx
  200238:	5e                   	pop    %esi
  200239:	5f                   	pop    %edi
  20023a:	5d                   	pop    %ebp
  20023b:	c3                   	ret    
  20023c:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  200240:	8d 77 02             	lea    0x2(%edi),%esi
  200243:	4b                   	dec    %ebx
  200244:	eb d6                	jmp    20021c <i2A+0x50>
  200246:	66 90                	xchg   %ax,%ax
  200248:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  20024e:	74 0c                	je     20025c <i2A+0x90>
  200250:	f7 d9                	neg    %ecx
  200252:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  200256:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  20025a:	eb 86                	jmp    2001e2 <i2A+0x16>
  20025c:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  200261:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  200265:	eb ef                	jmp    200256 <i2A+0x8a>
  200267:	90                   	nop

00200268 <i2X>:
  200268:	55                   	push   %ebp
  200269:	89 e5                	mov    %esp,%ebp
  20026b:	57                   	push   %edi
  20026c:	56                   	push   %esi
  20026d:	53                   	push   %ebx
  20026e:	8b 55 08             	mov    0x8(%ebp),%edx
  200271:	b9 21 17 20 00       	mov    $0x201721,%ecx
  200276:	31 c0                	xor    %eax,%eax
  200278:	40                   	inc    %eax
  200279:	89 d6                	mov    %edx,%esi
  20027b:	83 e6 0f             	and    $0xf,%esi
  20027e:	8d 5e f6             	lea    -0xa(%esi),%ebx
  200281:	89 cf                	mov    %ecx,%edi
  200283:	83 fb 05             	cmp    $0x5,%ebx
  200286:	77 4c                	ja     2002d4 <i2X+0x6c>
  200288:	ff 24 9d f4 04 20 00 	jmp    *0x2004f4(,%ebx,4)
  20028f:	90                   	nop
  200290:	c6 01 65             	movb   $0x65,(%ecx)
  200293:	90                   	nop
  200294:	49                   	dec    %ecx
  200295:	c1 ea 04             	shr    $0x4,%edx
  200298:	75 de                	jne    200278 <i2X+0x10>
  20029a:	c6 05 22 17 20 00 00 	movb   $0x0,0x201722
  2002a1:	8b 55 0c             	mov    0xc(%ebp),%edx
  2002a4:	89 3a                	mov    %edi,(%edx)
  2002a6:	5b                   	pop    %ebx
  2002a7:	5e                   	pop    %esi
  2002a8:	5f                   	pop    %edi
  2002a9:	5d                   	pop    %ebp
  2002aa:	c3                   	ret    
  2002ab:	90                   	nop
  2002ac:	c6 01 64             	movb   $0x64,(%ecx)
  2002af:	eb e3                	jmp    200294 <i2X+0x2c>
  2002b1:	8d 76 00             	lea    0x0(%esi),%esi
  2002b4:	c6 01 63             	movb   $0x63,(%ecx)
  2002b7:	eb db                	jmp    200294 <i2X+0x2c>
  2002b9:	8d 76 00             	lea    0x0(%esi),%esi
  2002bc:	c6 01 62             	movb   $0x62,(%ecx)
  2002bf:	eb d3                	jmp    200294 <i2X+0x2c>
  2002c1:	8d 76 00             	lea    0x0(%esi),%esi
  2002c4:	c6 01 61             	movb   $0x61,(%ecx)
  2002c7:	eb cb                	jmp    200294 <i2X+0x2c>
  2002c9:	8d 76 00             	lea    0x0(%esi),%esi
  2002cc:	c6 01 66             	movb   $0x66,(%ecx)
  2002cf:	eb c3                	jmp    200294 <i2X+0x2c>
  2002d1:	8d 76 00             	lea    0x0(%esi),%esi
  2002d4:	8d 5e 30             	lea    0x30(%esi),%ebx
  2002d7:	88 19                	mov    %bl,(%ecx)
  2002d9:	eb b9                	jmp    200294 <i2X+0x2c>
  2002db:	90                   	nop

002002dc <memcpy>:
  2002dc:	55                   	push   %ebp
  2002dd:	89 e5                	mov    %esp,%ebp
  2002df:	57                   	push   %edi
  2002e0:	56                   	push   %esi
  2002e1:	53                   	push   %ebx
  2002e2:	8b 55 08             	mov    0x8(%ebp),%edx
  2002e5:	8b 7d 0c             	mov    0xc(%ebp),%edi
  2002e8:	8b 45 10             	mov    0x10(%ebp),%eax
  2002eb:	85 c0                	test   %eax,%eax
  2002ed:	7e 35                	jle    200324 <memcpy+0x48>
  2002ef:	8a 1f                	mov    (%edi),%bl
  2002f1:	84 db                	test   %bl,%bl
  2002f3:	74 2f                	je     200324 <memcpy+0x48>
  2002f5:	8d 34 02             	lea    (%edx,%eax,1),%esi
  2002f8:	31 c9                	xor    %ecx,%ecx
  2002fa:	eb 07                	jmp    200303 <memcpy+0x27>
  2002fc:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  2002ff:	84 db                	test   %bl,%bl
  200301:	74 15                	je     200318 <memcpy+0x3c>
  200303:	42                   	inc    %edx
  200304:	88 5a ff             	mov    %bl,-0x1(%edx)
  200307:	41                   	inc    %ecx
  200308:	39 f2                	cmp    %esi,%edx
  20030a:	75 f0                	jne    2002fc <memcpy+0x20>
  20030c:	c6 06 00             	movb   $0x0,(%esi)
  20030f:	29 c8                	sub    %ecx,%eax
  200311:	5b                   	pop    %ebx
  200312:	5e                   	pop    %esi
  200313:	5f                   	pop    %edi
  200314:	5d                   	pop    %ebp
  200315:	c3                   	ret    
  200316:	66 90                	xchg   %ax,%ax
  200318:	89 d6                	mov    %edx,%esi
  20031a:	c6 06 00             	movb   $0x0,(%esi)
  20031d:	29 c8                	sub    %ecx,%eax
  20031f:	5b                   	pop    %ebx
  200320:	5e                   	pop    %esi
  200321:	5f                   	pop    %edi
  200322:	5d                   	pop    %ebp
  200323:	c3                   	ret    
  200324:	89 d6                	mov    %edx,%esi
  200326:	31 c9                	xor    %ecx,%ecx
  200328:	eb e2                	jmp    20030c <memcpy+0x30>
  20032a:	66 90                	xchg   %ax,%ax

0020032c <length_str>:
  20032c:	55                   	push   %ebp
  20032d:	89 e5                	mov    %esp,%ebp
  20032f:	8b 55 08             	mov    0x8(%ebp),%edx
  200332:	31 c0                	xor    %eax,%eax
  200334:	80 3a 00             	cmpb   $0x0,(%edx)
  200337:	74 0a                	je     200343 <length_str+0x17>
  200339:	8d 76 00             	lea    0x0(%esi),%esi
  20033c:	40                   	inc    %eax
  20033d:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  200341:	75 f9                	jne    20033c <length_str+0x10>
  200343:	5d                   	pop    %ebp
  200344:	c3                   	ret    
  200345:	8d 76 00             	lea    0x0(%esi),%esi

00200348 <printf>:
  200348:	55                   	push   %ebp
  200349:	89 e5                	mov    %esp,%ebp
  20034b:	57                   	push   %edi
  20034c:	56                   	push   %esi
  20034d:	53                   	push   %ebx
  20034e:	83 ec 24             	sub    $0x24,%esp
  200351:	8b 4d 08             	mov    0x8(%ebp),%ecx
  200354:	8a 11                	mov    (%ecx),%dl
  200356:	84 d2                	test   %dl,%dl
  200358:	0f 84 74 01 00 00    	je     2004d2 <printf+0x18a>
  20035e:	8d 45 0c             	lea    0xc(%ebp),%eax
  200361:	31 ff                	xor    %edi,%edi
  200363:	eb 18                	jmp    20037d <printf+0x35>
  200365:	8d 76 00             	lea    0x0(%esi),%esi
  200368:	8a 11                	mov    (%ecx),%dl
  20036a:	89 cb                	mov    %ecx,%ebx
  20036c:	88 97 60 17 20 00    	mov    %dl,0x201760(%edi)
  200372:	47                   	inc    %edi
  200373:	8d 4b 01             	lea    0x1(%ebx),%ecx
  200376:	8a 53 01             	mov    0x1(%ebx),%dl
  200379:	84 d2                	test   %dl,%dl
  20037b:	74 72                	je     2003ef <printf+0xa7>
  20037d:	80 fa 25             	cmp    $0x25,%dl
  200380:	75 e6                	jne    200368 <printf+0x20>
  200382:	8d 59 01             	lea    0x1(%ecx),%ebx
  200385:	8a 51 01             	mov    0x1(%ecx),%dl
  200388:	80 fa 64             	cmp    $0x64,%dl
  20038b:	0f 84 df 00 00 00    	je     200470 <printf+0x128>
  200391:	0f 8e 21 01 00 00    	jle    2004b8 <printf+0x170>
  200397:	80 fa 73             	cmp    $0x73,%dl
  20039a:	0f 84 a0 00 00 00    	je     200440 <printf+0xf8>
  2003a0:	80 fa 78             	cmp    $0x78,%dl
  2003a3:	75 c7                	jne    20036c <printf+0x24>
  2003a5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2003ac:	8d 70 04             	lea    0x4(%eax),%esi
  2003af:	89 75 d0             	mov    %esi,-0x30(%ebp)
  2003b2:	8d 75 f0             	lea    -0x10(%ebp),%esi
  2003b5:	56                   	push   %esi
  2003b6:	ff 30                	pushl  (%eax)
  2003b8:	e8 ab fe ff ff       	call   200268 <i2X>
  2003bd:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2003c0:	8d b7 60 17 20 00    	lea    0x201760(%edi),%esi
  2003c6:	8a 11                	mov    (%ecx),%dl
  2003c8:	83 c4 08             	add    $0x8,%esp
  2003cb:	31 c0                	xor    %eax,%eax
  2003cd:	84 d2                	test   %dl,%dl
  2003cf:	74 0f                	je     2003e0 <printf+0x98>
  2003d1:	8d 76 00             	lea    0x0(%esi),%esi
  2003d4:	40                   	inc    %eax
  2003d5:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  2003d9:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  2003dc:	84 d2                	test   %dl,%dl
  2003de:	75 f4                	jne    2003d4 <printf+0x8c>
  2003e0:	01 c7                	add    %eax,%edi
  2003e2:	8b 45 d0             	mov    -0x30(%ebp),%eax
  2003e5:	8d 4b 01             	lea    0x1(%ebx),%ecx
  2003e8:	8a 53 01             	mov    0x1(%ebx),%dl
  2003eb:	84 d2                	test   %dl,%dl
  2003ed:	75 8e                	jne    20037d <printf+0x35>
  2003ef:	8d 47 01             	lea    0x1(%edi),%eax
  2003f2:	c6 87 60 17 20 00 00 	movb   $0x0,0x201760(%edi)
  2003f9:	c7 45 ec 04 00 00 00 	movl   $0x4,-0x14(%ebp)
  200400:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  200407:	c7 45 e4 60 17 20 00 	movl   $0x201760,-0x1c(%ebp)
  20040e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  200411:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  200418:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  20041f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200422:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  200425:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  200428:	8b 55 e0             	mov    -0x20(%ebp),%edx
  20042b:	8b 7d dc             	mov    -0x24(%ebp),%edi
  20042e:	8b 75 d8             	mov    -0x28(%ebp),%esi
  200431:	cd 80                	int    $0x80
  200433:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200436:	8d 65 f4             	lea    -0xc(%ebp),%esp
  200439:	5b                   	pop    %ebx
  20043a:	5e                   	pop    %esi
  20043b:	5f                   	pop    %edi
  20043c:	5d                   	pop    %ebp
  20043d:	c3                   	ret    
  20043e:	66 90                	xchg   %ax,%ax
  200440:	8d 70 04             	lea    0x4(%eax),%esi
  200443:	89 75 d0             	mov    %esi,-0x30(%ebp)
  200446:	8b 08                	mov    (%eax),%ecx
  200448:	8d b7 60 17 20 00    	lea    0x201760(%edi),%esi
  20044e:	8a 11                	mov    (%ecx),%dl
  200450:	31 c0                	xor    %eax,%eax
  200452:	84 d2                	test   %dl,%dl
  200454:	74 8a                	je     2003e0 <printf+0x98>
  200456:	66 90                	xchg   %ax,%ax
  200458:	40                   	inc    %eax
  200459:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  20045d:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  200460:	84 d2                	test   %dl,%dl
  200462:	75 f4                	jne    200458 <printf+0x110>
  200464:	01 c7                	add    %eax,%edi
  200466:	8b 45 d0             	mov    -0x30(%ebp),%eax
  200469:	e9 77 ff ff ff       	jmp    2003e5 <printf+0x9d>
  20046e:	66 90                	xchg   %ax,%ax
  200470:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200477:	8d 70 04             	lea    0x4(%eax),%esi
  20047a:	89 75 d0             	mov    %esi,-0x30(%ebp)
  20047d:	8d 75 f0             	lea    -0x10(%ebp),%esi
  200480:	56                   	push   %esi
  200481:	ff 30                	pushl  (%eax)
  200483:	e8 44 fd ff ff       	call   2001cc <i2A>
  200488:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  20048b:	8d b7 60 17 20 00    	lea    0x201760(%edi),%esi
  200491:	8a 11                	mov    (%ecx),%dl
  200493:	83 c4 08             	add    $0x8,%esp
  200496:	31 c0                	xor    %eax,%eax
  200498:	84 d2                	test   %dl,%dl
  20049a:	0f 84 40 ff ff ff    	je     2003e0 <printf+0x98>
  2004a0:	40                   	inc    %eax
  2004a1:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  2004a5:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  2004a8:	84 d2                	test   %dl,%dl
  2004aa:	75 f4                	jne    2004a0 <printf+0x158>
  2004ac:	01 c7                	add    %eax,%edi
  2004ae:	8b 45 d0             	mov    -0x30(%ebp),%eax
  2004b1:	e9 2f ff ff ff       	jmp    2003e5 <printf+0x9d>
  2004b6:	66 90                	xchg   %ax,%ax
  2004b8:	80 fa 63             	cmp    $0x63,%dl
  2004bb:	0f 85 ab fe ff ff    	jne    20036c <printf+0x24>
  2004c1:	8b 10                	mov    (%eax),%edx
  2004c3:	88 97 60 17 20 00    	mov    %dl,0x201760(%edi)
  2004c9:	83 c0 04             	add    $0x4,%eax
  2004cc:	47                   	inc    %edi
  2004cd:	e9 a1 fe ff ff       	jmp    200373 <printf+0x2b>
  2004d2:	b8 01 00 00 00       	mov    $0x1,%eax
  2004d7:	31 ff                	xor    %edi,%edi
  2004d9:	e9 14 ff ff ff       	jmp    2003f2 <printf+0xaa>
