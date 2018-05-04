
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	53                   	push   %ebx
  200004:	53                   	push   %ebx
  200005:	e8 b2 00 00 00       	call   2000bc <fork>
  20000a:	85 c0                	test   %eax,%eax
  20000c:	75 3e                	jne    20004c <uEntry+0x4c>
  20000e:	c7 05 80 17 20 00 02 	movl   $0x2,0x201780
  200015:	00 00 00 
  200018:	b8 02 00 00 00       	mov    $0x2,%eax
  20001d:	bb 08 00 00 00       	mov    $0x8,%ebx
  200022:	66 90                	xchg   %ax,%ax
  200024:	4b                   	dec    %ebx
  200025:	51                   	push   %ecx
  200026:	53                   	push   %ebx
  200027:	50                   	push   %eax
  200028:	68 44 05 20 00       	push   $0x200544
  20002d:	e8 7a 03 00 00       	call   2003ac <printf>
  200032:	c7 04 24 80 00 00 00 	movl   $0x80,(%esp)
  200039:	e8 ca 00 00 00       	call   200108 <sleep>
  20003e:	83 c4 10             	add    $0x10,%esp
  200041:	85 db                	test   %ebx,%ebx
  200043:	74 4b                	je     200090 <uEntry+0x90>
  200045:	a1 80 17 20 00       	mov    0x201780,%eax
  20004a:	eb d8                	jmp    200024 <uEntry+0x24>
  20004c:	40                   	inc    %eax
  20004d:	74 46                	je     200095 <uEntry+0x95>
  20004f:	c7 05 80 17 20 00 01 	movl   $0x1,0x201780
  200056:	00 00 00 
  200059:	b8 01 00 00 00       	mov    $0x1,%eax
  20005e:	bb 08 00 00 00       	mov    $0x8,%ebx
  200063:	eb 08                	jmp    20006d <uEntry+0x6d>
  200065:	8d 76 00             	lea    0x0(%esi),%esi
  200068:	a1 80 17 20 00       	mov    0x201780,%eax
  20006d:	4b                   	dec    %ebx
  20006e:	52                   	push   %edx
  20006f:	53                   	push   %ebx
  200070:	50                   	push   %eax
  200071:	68 60 05 20 00       	push   $0x200560
  200076:	e8 31 03 00 00       	call   2003ac <printf>
  20007b:	c7 04 24 80 00 00 00 	movl   $0x80,(%esp)
  200082:	e8 81 00 00 00       	call   200108 <sleep>
  200087:	83 c4 10             	add    $0x10,%esp
  20008a:	85 db                	test   %ebx,%ebx
  20008c:	75 da                	jne    200068 <uEntry+0x68>
  20008e:	66 90                	xchg   %ax,%ax
  200090:	e8 bf 00 00 00       	call   200154 <exit>
  200095:	eb fe                	jmp    200095 <uEntry+0x95>
  200097:	90                   	nop

00200098 <syscall>:
  200098:	55                   	push   %ebp
  200099:	89 e5                	mov    %esp,%ebp
  20009b:	83 ec 10             	sub    $0x10,%esp
  20009e:	8b 45 08             	mov    0x8(%ebp),%eax
  2000a1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  2000a4:	8b 4d 10             	mov    0x10(%ebp),%ecx
  2000a7:	8b 55 14             	mov    0x14(%ebp),%edx
  2000aa:	8b 7d 18             	mov    0x18(%ebp),%edi
  2000ad:	8b 75 1c             	mov    0x1c(%ebp),%esi
  2000b0:	cd 80                	int    $0x80
  2000b2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2000b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2000b8:	c9                   	leave  
  2000b9:	c3                   	ret    
  2000ba:	66 90                	xchg   %ax,%ax

002000bc <fork>:
  2000bc:	55                   	push   %ebp
  2000bd:	89 e5                	mov    %esp,%ebp
  2000bf:	83 ec 20             	sub    $0x20,%esp
  2000c2:	c7 45 e4 02 00 00 00 	movl   $0x2,-0x1c(%ebp)
  2000c9:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  2000d0:	c7 45 ec 7d 05 20 00 	movl   $0x20057d,-0x14(%ebp)
  2000d7:	c7 45 f0 0d 00 00 00 	movl   $0xd,-0x10(%ebp)
  2000de:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2000e5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2000ec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2000ef:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2000f2:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2000f5:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2000f8:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2000fb:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2000fe:	cd 80                	int    $0x80
  200100:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200103:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200106:	c9                   	leave  
  200107:	c3                   	ret    

00200108 <sleep>:
  200108:	55                   	push   %ebp
  200109:	89 e5                	mov    %esp,%ebp
  20010b:	83 ec 20             	sub    $0x20,%esp
  20010e:	c7 45 e4 e6 00 00 00 	movl   $0xe6,-0x1c(%ebp)
  200115:	8b 45 08             	mov    0x8(%ebp),%eax
  200118:	89 45 e8             	mov    %eax,-0x18(%ebp)
  20011b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  200122:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200129:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200130:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200137:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  20013a:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  20013d:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200140:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200143:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200146:	8b 75 f8             	mov    -0x8(%ebp),%esi
  200149:	cd 80                	int    $0x80
  20014b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20014e:	31 c0                	xor    %eax,%eax
  200150:	c9                   	leave  
  200151:	c3                   	ret    
  200152:	66 90                	xchg   %ax,%ax

00200154 <exit>:
  200154:	55                   	push   %ebp
  200155:	89 e5                	mov    %esp,%ebp
  200157:	83 ec 20             	sub    $0x20,%esp
  20015a:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  200161:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  200168:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  20016f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200176:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20017d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200184:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  200187:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  20018a:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  20018d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200190:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200193:	8b 75 f8             	mov    -0x8(%ebp),%esi
  200196:	cd 80                	int    $0x80
  200198:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20019b:	31 c0                	xor    %eax,%eax
  20019d:	c9                   	leave  
  20019e:	c3                   	ret    
  20019f:	90                   	nop

002001a0 <fs_write>:
  2001a0:	55                   	push   %ebp
  2001a1:	89 e5                	mov    %esp,%ebp
  2001a3:	83 ec 20             	sub    $0x20,%esp
  2001a6:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  2001ad:	8b 45 08             	mov    0x8(%ebp),%eax
  2001b0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  2001b3:	8b 45 0c             	mov    0xc(%ebp),%eax
  2001b6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2001b9:	8b 45 10             	mov    0x10(%ebp),%eax
  2001bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  2001bf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2001c6:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2001cd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2001d0:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2001d3:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2001d6:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2001d9:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2001dc:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2001df:	cd 80                	int    $0x80
  2001e1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2001e4:	c9                   	leave  
  2001e5:	c3                   	ret    
  2001e6:	66 90                	xchg   %ax,%ax

002001e8 <putchar_user>:
  2001e8:	55                   	push   %ebp
  2001e9:	89 e5                	mov    %esp,%ebp
  2001eb:	83 ec 24             	sub    $0x24,%esp
  2001ee:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  2001f5:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  2001fc:	8d 45 dc             	lea    -0x24(%ebp),%eax
  2001ff:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200202:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  200209:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200210:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200217:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  20021a:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  20021d:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200220:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200223:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200226:	8b 75 f8             	mov    -0x8(%ebp),%esi
  200229:	cd 80                	int    $0x80
  20022b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20022e:	c9                   	leave  
  20022f:	c3                   	ret    

00200230 <i2A>:
  200230:	55                   	push   %ebp
  200231:	89 e5                	mov    %esp,%ebp
  200233:	57                   	push   %edi
  200234:	56                   	push   %esi
  200235:	53                   	push   %ebx
  200236:	51                   	push   %ecx
  200237:	8b 4d 08             	mov    0x8(%ebp),%ecx
  20023a:	85 c9                	test   %ecx,%ecx
  20023c:	78 6e                	js     2002ac <i2A+0x7c>
  20023e:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  200242:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  200246:	bb c2 17 20 00       	mov    $0x2017c2,%ebx
  20024b:	31 ff                	xor    %edi,%edi
  20024d:	eb 03                	jmp    200252 <i2A+0x22>
  20024f:	90                   	nop
  200250:	89 f7                	mov    %esi,%edi
  200252:	4b                   	dec    %ebx
  200253:	89 c8                	mov    %ecx,%eax
  200255:	be 0a 00 00 00       	mov    $0xa,%esi
  20025a:	99                   	cltd   
  20025b:	f7 fe                	idiv   %esi
  20025d:	83 c2 30             	add    $0x30,%edx
  200260:	88 13                	mov    %dl,(%ebx)
  200262:	8d 77 01             	lea    0x1(%edi),%esi
  200265:	b8 67 66 66 66       	mov    $0x66666667,%eax
  20026a:	f7 e9                	imul   %ecx
  20026c:	89 d0                	mov    %edx,%eax
  20026e:	c1 f8 02             	sar    $0x2,%eax
  200271:	c1 f9 1f             	sar    $0x1f,%ecx
  200274:	29 c8                	sub    %ecx,%eax
  200276:	89 c1                	mov    %eax,%ecx
  200278:	75 d6                	jne    200250 <i2A+0x20>
  20027a:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  20027e:	74 20                	je     2002a0 <i2A+0x70>
  200280:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  200284:	75 06                	jne    20028c <i2A+0x5c>
  200286:	fe 05 c1 17 20 00    	incb   0x2017c1
  20028c:	c6 05 c2 17 20 00 00 	movb   $0x0,0x2017c2
  200293:	8b 45 0c             	mov    0xc(%ebp),%eax
  200296:	89 18                	mov    %ebx,(%eax)
  200298:	89 f0                	mov    %esi,%eax
  20029a:	5a                   	pop    %edx
  20029b:	5b                   	pop    %ebx
  20029c:	5e                   	pop    %esi
  20029d:	5f                   	pop    %edi
  20029e:	5d                   	pop    %ebp
  20029f:	c3                   	ret    
  2002a0:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  2002a4:	8d 77 02             	lea    0x2(%edi),%esi
  2002a7:	4b                   	dec    %ebx
  2002a8:	eb d6                	jmp    200280 <i2A+0x50>
  2002aa:	66 90                	xchg   %ax,%ax
  2002ac:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  2002b2:	74 0c                	je     2002c0 <i2A+0x90>
  2002b4:	f7 d9                	neg    %ecx
  2002b6:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  2002ba:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  2002be:	eb 86                	jmp    200246 <i2A+0x16>
  2002c0:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  2002c5:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  2002c9:	eb ef                	jmp    2002ba <i2A+0x8a>
  2002cb:	90                   	nop

002002cc <i2X>:
  2002cc:	55                   	push   %ebp
  2002cd:	89 e5                	mov    %esp,%ebp
  2002cf:	57                   	push   %edi
  2002d0:	56                   	push   %esi
  2002d1:	53                   	push   %ebx
  2002d2:	8b 55 08             	mov    0x8(%ebp),%edx
  2002d5:	b9 a1 17 20 00       	mov    $0x2017a1,%ecx
  2002da:	31 c0                	xor    %eax,%eax
  2002dc:	40                   	inc    %eax
  2002dd:	89 d6                	mov    %edx,%esi
  2002df:	83 e6 0f             	and    $0xf,%esi
  2002e2:	8d 5e f6             	lea    -0xa(%esi),%ebx
  2002e5:	89 cf                	mov    %ecx,%edi
  2002e7:	83 fb 05             	cmp    $0x5,%ebx
  2002ea:	77 4c                	ja     200338 <i2X+0x6c>
  2002ec:	ff 24 9d 88 05 20 00 	jmp    *0x200588(,%ebx,4)
  2002f3:	90                   	nop
  2002f4:	c6 01 65             	movb   $0x65,(%ecx)
  2002f7:	90                   	nop
  2002f8:	49                   	dec    %ecx
  2002f9:	c1 ea 04             	shr    $0x4,%edx
  2002fc:	75 de                	jne    2002dc <i2X+0x10>
  2002fe:	c6 05 a2 17 20 00 00 	movb   $0x0,0x2017a2
  200305:	8b 55 0c             	mov    0xc(%ebp),%edx
  200308:	89 3a                	mov    %edi,(%edx)
  20030a:	5b                   	pop    %ebx
  20030b:	5e                   	pop    %esi
  20030c:	5f                   	pop    %edi
  20030d:	5d                   	pop    %ebp
  20030e:	c3                   	ret    
  20030f:	90                   	nop
  200310:	c6 01 64             	movb   $0x64,(%ecx)
  200313:	eb e3                	jmp    2002f8 <i2X+0x2c>
  200315:	8d 76 00             	lea    0x0(%esi),%esi
  200318:	c6 01 63             	movb   $0x63,(%ecx)
  20031b:	eb db                	jmp    2002f8 <i2X+0x2c>
  20031d:	8d 76 00             	lea    0x0(%esi),%esi
  200320:	c6 01 62             	movb   $0x62,(%ecx)
  200323:	eb d3                	jmp    2002f8 <i2X+0x2c>
  200325:	8d 76 00             	lea    0x0(%esi),%esi
  200328:	c6 01 61             	movb   $0x61,(%ecx)
  20032b:	eb cb                	jmp    2002f8 <i2X+0x2c>
  20032d:	8d 76 00             	lea    0x0(%esi),%esi
  200330:	c6 01 66             	movb   $0x66,(%ecx)
  200333:	eb c3                	jmp    2002f8 <i2X+0x2c>
  200335:	8d 76 00             	lea    0x0(%esi),%esi
  200338:	8d 5e 30             	lea    0x30(%esi),%ebx
  20033b:	88 19                	mov    %bl,(%ecx)
  20033d:	eb b9                	jmp    2002f8 <i2X+0x2c>
  20033f:	90                   	nop

00200340 <memcpy>:
  200340:	55                   	push   %ebp
  200341:	89 e5                	mov    %esp,%ebp
  200343:	57                   	push   %edi
  200344:	56                   	push   %esi
  200345:	53                   	push   %ebx
  200346:	8b 55 08             	mov    0x8(%ebp),%edx
  200349:	8b 7d 0c             	mov    0xc(%ebp),%edi
  20034c:	8b 45 10             	mov    0x10(%ebp),%eax
  20034f:	85 c0                	test   %eax,%eax
  200351:	7e 35                	jle    200388 <memcpy+0x48>
  200353:	8a 1f                	mov    (%edi),%bl
  200355:	84 db                	test   %bl,%bl
  200357:	74 2f                	je     200388 <memcpy+0x48>
  200359:	8d 34 02             	lea    (%edx,%eax,1),%esi
  20035c:	31 c9                	xor    %ecx,%ecx
  20035e:	eb 07                	jmp    200367 <memcpy+0x27>
  200360:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  200363:	84 db                	test   %bl,%bl
  200365:	74 15                	je     20037c <memcpy+0x3c>
  200367:	42                   	inc    %edx
  200368:	88 5a ff             	mov    %bl,-0x1(%edx)
  20036b:	41                   	inc    %ecx
  20036c:	39 f2                	cmp    %esi,%edx
  20036e:	75 f0                	jne    200360 <memcpy+0x20>
  200370:	c6 06 00             	movb   $0x0,(%esi)
  200373:	29 c8                	sub    %ecx,%eax
  200375:	5b                   	pop    %ebx
  200376:	5e                   	pop    %esi
  200377:	5f                   	pop    %edi
  200378:	5d                   	pop    %ebp
  200379:	c3                   	ret    
  20037a:	66 90                	xchg   %ax,%ax
  20037c:	89 d6                	mov    %edx,%esi
  20037e:	c6 06 00             	movb   $0x0,(%esi)
  200381:	29 c8                	sub    %ecx,%eax
  200383:	5b                   	pop    %ebx
  200384:	5e                   	pop    %esi
  200385:	5f                   	pop    %edi
  200386:	5d                   	pop    %ebp
  200387:	c3                   	ret    
  200388:	89 d6                	mov    %edx,%esi
  20038a:	31 c9                	xor    %ecx,%ecx
  20038c:	eb e2                	jmp    200370 <memcpy+0x30>
  20038e:	66 90                	xchg   %ax,%ax

00200390 <length_str>:
  200390:	55                   	push   %ebp
  200391:	89 e5                	mov    %esp,%ebp
  200393:	8b 55 08             	mov    0x8(%ebp),%edx
  200396:	31 c0                	xor    %eax,%eax
  200398:	80 3a 00             	cmpb   $0x0,(%edx)
  20039b:	74 0a                	je     2003a7 <length_str+0x17>
  20039d:	8d 76 00             	lea    0x0(%esi),%esi
  2003a0:	40                   	inc    %eax
  2003a1:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  2003a5:	75 f9                	jne    2003a0 <length_str+0x10>
  2003a7:	5d                   	pop    %ebp
  2003a8:	c3                   	ret    
  2003a9:	8d 76 00             	lea    0x0(%esi),%esi

002003ac <printf>:
  2003ac:	55                   	push   %ebp
  2003ad:	89 e5                	mov    %esp,%ebp
  2003af:	57                   	push   %edi
  2003b0:	56                   	push   %esi
  2003b1:	53                   	push   %ebx
  2003b2:	83 ec 24             	sub    $0x24,%esp
  2003b5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2003b8:	8a 11                	mov    (%ecx),%dl
  2003ba:	84 d2                	test   %dl,%dl
  2003bc:	0f 84 74 01 00 00    	je     200536 <printf+0x18a>
  2003c2:	8d 45 0c             	lea    0xc(%ebp),%eax
  2003c5:	31 ff                	xor    %edi,%edi
  2003c7:	eb 18                	jmp    2003e1 <printf+0x35>
  2003c9:	8d 76 00             	lea    0x0(%esi),%esi
  2003cc:	8a 11                	mov    (%ecx),%dl
  2003ce:	89 cb                	mov    %ecx,%ebx
  2003d0:	88 97 e0 17 20 00    	mov    %dl,0x2017e0(%edi)
  2003d6:	47                   	inc    %edi
  2003d7:	8d 4b 01             	lea    0x1(%ebx),%ecx
  2003da:	8a 53 01             	mov    0x1(%ebx),%dl
  2003dd:	84 d2                	test   %dl,%dl
  2003df:	74 72                	je     200453 <printf+0xa7>
  2003e1:	80 fa 25             	cmp    $0x25,%dl
  2003e4:	75 e6                	jne    2003cc <printf+0x20>
  2003e6:	8d 59 01             	lea    0x1(%ecx),%ebx
  2003e9:	8a 51 01             	mov    0x1(%ecx),%dl
  2003ec:	80 fa 64             	cmp    $0x64,%dl
  2003ef:	0f 84 df 00 00 00    	je     2004d4 <printf+0x128>
  2003f5:	0f 8e 21 01 00 00    	jle    20051c <printf+0x170>
  2003fb:	80 fa 73             	cmp    $0x73,%dl
  2003fe:	0f 84 a0 00 00 00    	je     2004a4 <printf+0xf8>
  200404:	80 fa 78             	cmp    $0x78,%dl
  200407:	75 c7                	jne    2003d0 <printf+0x24>
  200409:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200410:	8d 70 04             	lea    0x4(%eax),%esi
  200413:	89 75 d0             	mov    %esi,-0x30(%ebp)
  200416:	8d 75 f0             	lea    -0x10(%ebp),%esi
  200419:	56                   	push   %esi
  20041a:	ff 30                	pushl  (%eax)
  20041c:	e8 ab fe ff ff       	call   2002cc <i2X>
  200421:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200424:	8d b7 e0 17 20 00    	lea    0x2017e0(%edi),%esi
  20042a:	8a 11                	mov    (%ecx),%dl
  20042c:	83 c4 08             	add    $0x8,%esp
  20042f:	31 c0                	xor    %eax,%eax
  200431:	84 d2                	test   %dl,%dl
  200433:	74 0f                	je     200444 <printf+0x98>
  200435:	8d 76 00             	lea    0x0(%esi),%esi
  200438:	40                   	inc    %eax
  200439:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  20043d:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  200440:	84 d2                	test   %dl,%dl
  200442:	75 f4                	jne    200438 <printf+0x8c>
  200444:	01 c7                	add    %eax,%edi
  200446:	8b 45 d0             	mov    -0x30(%ebp),%eax
  200449:	8d 4b 01             	lea    0x1(%ebx),%ecx
  20044c:	8a 53 01             	mov    0x1(%ebx),%dl
  20044f:	84 d2                	test   %dl,%dl
  200451:	75 8e                	jne    2003e1 <printf+0x35>
  200453:	8d 47 01             	lea    0x1(%edi),%eax
  200456:	c6 87 e0 17 20 00 00 	movb   $0x0,0x2017e0(%edi)
  20045d:	c7 45 ec 04 00 00 00 	movl   $0x4,-0x14(%ebp)
  200464:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  20046b:	c7 45 e4 e0 17 20 00 	movl   $0x2017e0,-0x1c(%ebp)
  200472:	89 45 e0             	mov    %eax,-0x20(%ebp)
  200475:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  20047c:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  200483:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200486:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  200489:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  20048c:	8b 55 e0             	mov    -0x20(%ebp),%edx
  20048f:	8b 7d dc             	mov    -0x24(%ebp),%edi
  200492:	8b 75 d8             	mov    -0x28(%ebp),%esi
  200495:	cd 80                	int    $0x80
  200497:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20049a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  20049d:	5b                   	pop    %ebx
  20049e:	5e                   	pop    %esi
  20049f:	5f                   	pop    %edi
  2004a0:	5d                   	pop    %ebp
  2004a1:	c3                   	ret    
  2004a2:	66 90                	xchg   %ax,%ax
  2004a4:	8d 70 04             	lea    0x4(%eax),%esi
  2004a7:	89 75 d0             	mov    %esi,-0x30(%ebp)
  2004aa:	8b 08                	mov    (%eax),%ecx
  2004ac:	8d b7 e0 17 20 00    	lea    0x2017e0(%edi),%esi
  2004b2:	8a 11                	mov    (%ecx),%dl
  2004b4:	31 c0                	xor    %eax,%eax
  2004b6:	84 d2                	test   %dl,%dl
  2004b8:	74 8a                	je     200444 <printf+0x98>
  2004ba:	66 90                	xchg   %ax,%ax
  2004bc:	40                   	inc    %eax
  2004bd:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  2004c1:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  2004c4:	84 d2                	test   %dl,%dl
  2004c6:	75 f4                	jne    2004bc <printf+0x110>
  2004c8:	01 c7                	add    %eax,%edi
  2004ca:	8b 45 d0             	mov    -0x30(%ebp),%eax
  2004cd:	e9 77 ff ff ff       	jmp    200449 <printf+0x9d>
  2004d2:	66 90                	xchg   %ax,%ax
  2004d4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2004db:	8d 70 04             	lea    0x4(%eax),%esi
  2004de:	89 75 d0             	mov    %esi,-0x30(%ebp)
  2004e1:	8d 75 f0             	lea    -0x10(%ebp),%esi
  2004e4:	56                   	push   %esi
  2004e5:	ff 30                	pushl  (%eax)
  2004e7:	e8 44 fd ff ff       	call   200230 <i2A>
  2004ec:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2004ef:	8d b7 e0 17 20 00    	lea    0x2017e0(%edi),%esi
  2004f5:	8a 11                	mov    (%ecx),%dl
  2004f7:	83 c4 08             	add    $0x8,%esp
  2004fa:	31 c0                	xor    %eax,%eax
  2004fc:	84 d2                	test   %dl,%dl
  2004fe:	0f 84 40 ff ff ff    	je     200444 <printf+0x98>
  200504:	40                   	inc    %eax
  200505:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  200509:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  20050c:	84 d2                	test   %dl,%dl
  20050e:	75 f4                	jne    200504 <printf+0x158>
  200510:	01 c7                	add    %eax,%edi
  200512:	8b 45 d0             	mov    -0x30(%ebp),%eax
  200515:	e9 2f ff ff ff       	jmp    200449 <printf+0x9d>
  20051a:	66 90                	xchg   %ax,%ax
  20051c:	80 fa 63             	cmp    $0x63,%dl
  20051f:	0f 85 ab fe ff ff    	jne    2003d0 <printf+0x24>
  200525:	8b 10                	mov    (%eax),%edx
  200527:	88 97 e0 17 20 00    	mov    %dl,0x2017e0(%edi)
  20052d:	83 c0 04             	add    $0x4,%eax
  200530:	47                   	inc    %edi
  200531:	e9 a1 fe ff ff       	jmp    2003d7 <printf+0x2b>
  200536:	b8 01 00 00 00       	mov    $0x1,%eax
  20053b:	31 ff                	xor    %edi,%edi
  20053d:	e9 14 ff ff ff       	jmp    200456 <printf+0xaa>
