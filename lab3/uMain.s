
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	53                   	push   %ebx
  200004:	50                   	push   %eax
  200005:	e8 82 00 00 00       	call   20008c <fork>
  20000a:	89 c3                	mov    %eax,%ebx
  20000c:	85 c0                	test   %eax,%eax
  20000e:	75 3a                	jne    20004a <uEntry+0x4a>
  200010:	83 ec 0c             	sub    $0xc,%esp
  200013:	68 14 05 20 00       	push   $0x200514
  200018:	e8 5f 03 00 00       	call   20037c <printf>
  20001d:	83 c4 10             	add    $0x10,%esp
  200020:	83 ec 08             	sub    $0x8,%esp
  200023:	53                   	push   %ebx
  200024:	68 2d 05 20 00       	push   $0x20052d
  200029:	e8 4e 03 00 00       	call   20037c <printf>
  20002e:	e8 f1 00 00 00       	call   200124 <exit>
  200033:	83 c4 10             	add    $0x10,%esp
  200036:	66 90                	xchg   %ax,%ax
  200038:	83 ec 0c             	sub    $0xc,%esp
  20003b:	68 37 05 20 00       	push   $0x200537
  200040:	e8 37 03 00 00       	call   20037c <printf>
  200045:	83 c4 10             	add    $0x10,%esp
  200048:	eb ee                	jmp    200038 <uEntry+0x38>
  20004a:	83 ec 0c             	sub    $0xc,%esp
  20004d:	6a 07                	push   $0x7
  20004f:	e8 84 00 00 00       	call   2000d8 <sleep>
  200054:	c7 04 24 20 05 20 00 	movl   $0x200520,(%esp)
  20005b:	e8 1c 03 00 00       	call   20037c <printf>
  200060:	83 c4 10             	add    $0x10,%esp
  200063:	eb bb                	jmp    200020 <uEntry+0x20>
  200065:	66 90                	xchg   %ax,%ax
  200067:	90                   	nop

00200068 <syscall>:
  200068:	55                   	push   %ebp
  200069:	89 e5                	mov    %esp,%ebp
  20006b:	83 ec 10             	sub    $0x10,%esp
  20006e:	8b 45 08             	mov    0x8(%ebp),%eax
  200071:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  200074:	8b 4d 10             	mov    0x10(%ebp),%ecx
  200077:	8b 55 14             	mov    0x14(%ebp),%edx
  20007a:	8b 7d 18             	mov    0x18(%ebp),%edi
  20007d:	8b 75 1c             	mov    0x1c(%ebp),%esi
  200080:	cd 80                	int    $0x80
  200082:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200085:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200088:	c9                   	leave  
  200089:	c3                   	ret    
  20008a:	66 90                	xchg   %ax,%ax

0020008c <fork>:
  20008c:	55                   	push   %ebp
  20008d:	89 e5                	mov    %esp,%ebp
  20008f:	83 ec 20             	sub    $0x20,%esp
  200092:	c7 45 e4 02 00 00 00 	movl   $0x2,-0x1c(%ebp)
  200099:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  2000a0:	c7 45 ec 46 05 20 00 	movl   $0x200546,-0x14(%ebp)
  2000a7:	c7 45 f0 0d 00 00 00 	movl   $0xd,-0x10(%ebp)
  2000ae:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2000b5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2000bc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2000bf:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2000c2:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2000c5:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2000c8:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2000cb:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2000ce:	cd 80                	int    $0x80
  2000d0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2000d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2000d6:	c9                   	leave  
  2000d7:	c3                   	ret    

002000d8 <sleep>:
  2000d8:	55                   	push   %ebp
  2000d9:	89 e5                	mov    %esp,%ebp
  2000db:	83 ec 20             	sub    $0x20,%esp
  2000de:	c7 45 e4 e6 00 00 00 	movl   $0xe6,-0x1c(%ebp)
  2000e5:	8b 45 08             	mov    0x8(%ebp),%eax
  2000e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  2000eb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  2000f2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2000f9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200100:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200107:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  20010a:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  20010d:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200110:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200113:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200116:	8b 75 f8             	mov    -0x8(%ebp),%esi
  200119:	cd 80                	int    $0x80
  20011b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20011e:	31 c0                	xor    %eax,%eax
  200120:	c9                   	leave  
  200121:	c3                   	ret    
  200122:	66 90                	xchg   %ax,%ax

00200124 <exit>:
  200124:	55                   	push   %ebp
  200125:	89 e5                	mov    %esp,%ebp
  200127:	83 ec 20             	sub    $0x20,%esp
  20012a:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  200131:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  200138:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  20013f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200146:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20014d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200154:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  200157:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  20015a:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  20015d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200160:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200163:	8b 75 f8             	mov    -0x8(%ebp),%esi
  200166:	cd 80                	int    $0x80
  200168:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20016b:	31 c0                	xor    %eax,%eax
  20016d:	c9                   	leave  
  20016e:	c3                   	ret    
  20016f:	90                   	nop

00200170 <fs_write>:
  200170:	55                   	push   %ebp
  200171:	89 e5                	mov    %esp,%ebp
  200173:	83 ec 20             	sub    $0x20,%esp
  200176:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  20017d:	8b 45 08             	mov    0x8(%ebp),%eax
  200180:	89 45 e8             	mov    %eax,-0x18(%ebp)
  200183:	8b 45 0c             	mov    0xc(%ebp),%eax
  200186:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200189:	8b 45 10             	mov    0x10(%ebp),%eax
  20018c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20018f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200196:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  20019d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2001a0:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2001a3:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2001a6:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2001a9:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2001ac:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2001af:	cd 80                	int    $0x80
  2001b1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2001b4:	c9                   	leave  
  2001b5:	c3                   	ret    
  2001b6:	66 90                	xchg   %ax,%ax

002001b8 <putchar_user>:
  2001b8:	55                   	push   %ebp
  2001b9:	89 e5                	mov    %esp,%ebp
  2001bb:	83 ec 24             	sub    $0x24,%esp
  2001be:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  2001c5:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  2001cc:	8d 45 dc             	lea    -0x24(%ebp),%eax
  2001cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2001d2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  2001d9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2001e0:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2001e7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2001ea:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2001ed:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2001f0:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2001f3:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2001f6:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2001f9:	cd 80                	int    $0x80
  2001fb:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2001fe:	c9                   	leave  
  2001ff:	c3                   	ret    

00200200 <i2A>:
  200200:	55                   	push   %ebp
  200201:	89 e5                	mov    %esp,%ebp
  200203:	57                   	push   %edi
  200204:	56                   	push   %esi
  200205:	53                   	push   %ebx
  200206:	51                   	push   %ecx
  200207:	8b 4d 08             	mov    0x8(%ebp),%ecx
  20020a:	85 c9                	test   %ecx,%ecx
  20020c:	78 6e                	js     20027c <i2A+0x7c>
  20020e:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  200212:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  200216:	bb a2 17 20 00       	mov    $0x2017a2,%ebx
  20021b:	31 ff                	xor    %edi,%edi
  20021d:	eb 03                	jmp    200222 <i2A+0x22>
  20021f:	90                   	nop
  200220:	89 f7                	mov    %esi,%edi
  200222:	4b                   	dec    %ebx
  200223:	89 c8                	mov    %ecx,%eax
  200225:	be 0a 00 00 00       	mov    $0xa,%esi
  20022a:	99                   	cltd   
  20022b:	f7 fe                	idiv   %esi
  20022d:	83 c2 30             	add    $0x30,%edx
  200230:	88 13                	mov    %dl,(%ebx)
  200232:	8d 77 01             	lea    0x1(%edi),%esi
  200235:	b8 67 66 66 66       	mov    $0x66666667,%eax
  20023a:	f7 e9                	imul   %ecx
  20023c:	89 d0                	mov    %edx,%eax
  20023e:	c1 f8 02             	sar    $0x2,%eax
  200241:	c1 f9 1f             	sar    $0x1f,%ecx
  200244:	29 c8                	sub    %ecx,%eax
  200246:	89 c1                	mov    %eax,%ecx
  200248:	75 d6                	jne    200220 <i2A+0x20>
  20024a:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  20024e:	74 20                	je     200270 <i2A+0x70>
  200250:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  200254:	75 06                	jne    20025c <i2A+0x5c>
  200256:	fe 05 a1 17 20 00    	incb   0x2017a1
  20025c:	c6 05 a2 17 20 00 00 	movb   $0x0,0x2017a2
  200263:	8b 45 0c             	mov    0xc(%ebp),%eax
  200266:	89 18                	mov    %ebx,(%eax)
  200268:	89 f0                	mov    %esi,%eax
  20026a:	5a                   	pop    %edx
  20026b:	5b                   	pop    %ebx
  20026c:	5e                   	pop    %esi
  20026d:	5f                   	pop    %edi
  20026e:	5d                   	pop    %ebp
  20026f:	c3                   	ret    
  200270:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  200274:	8d 77 02             	lea    0x2(%edi),%esi
  200277:	4b                   	dec    %ebx
  200278:	eb d6                	jmp    200250 <i2A+0x50>
  20027a:	66 90                	xchg   %ax,%ax
  20027c:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  200282:	74 0c                	je     200290 <i2A+0x90>
  200284:	f7 d9                	neg    %ecx
  200286:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  20028a:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  20028e:	eb 86                	jmp    200216 <i2A+0x16>
  200290:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  200295:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  200299:	eb ef                	jmp    20028a <i2A+0x8a>
  20029b:	90                   	nop

0020029c <i2X>:
  20029c:	55                   	push   %ebp
  20029d:	89 e5                	mov    %esp,%ebp
  20029f:	57                   	push   %edi
  2002a0:	56                   	push   %esi
  2002a1:	53                   	push   %ebx
  2002a2:	8b 55 08             	mov    0x8(%ebp),%edx
  2002a5:	b9 81 17 20 00       	mov    $0x201781,%ecx
  2002aa:	31 c0                	xor    %eax,%eax
  2002ac:	40                   	inc    %eax
  2002ad:	89 d6                	mov    %edx,%esi
  2002af:	83 e6 0f             	and    $0xf,%esi
  2002b2:	8d 5e f6             	lea    -0xa(%esi),%ebx
  2002b5:	89 cf                	mov    %ecx,%edi
  2002b7:	83 fb 05             	cmp    $0x5,%ebx
  2002ba:	77 4c                	ja     200308 <i2X+0x6c>
  2002bc:	ff 24 9d 50 05 20 00 	jmp    *0x200550(,%ebx,4)
  2002c3:	90                   	nop
  2002c4:	c6 01 65             	movb   $0x65,(%ecx)
  2002c7:	90                   	nop
  2002c8:	49                   	dec    %ecx
  2002c9:	c1 ea 04             	shr    $0x4,%edx
  2002cc:	75 de                	jne    2002ac <i2X+0x10>
  2002ce:	c6 05 82 17 20 00 00 	movb   $0x0,0x201782
  2002d5:	8b 55 0c             	mov    0xc(%ebp),%edx
  2002d8:	89 3a                	mov    %edi,(%edx)
  2002da:	5b                   	pop    %ebx
  2002db:	5e                   	pop    %esi
  2002dc:	5f                   	pop    %edi
  2002dd:	5d                   	pop    %ebp
  2002de:	c3                   	ret    
  2002df:	90                   	nop
  2002e0:	c6 01 64             	movb   $0x64,(%ecx)
  2002e3:	eb e3                	jmp    2002c8 <i2X+0x2c>
  2002e5:	8d 76 00             	lea    0x0(%esi),%esi
  2002e8:	c6 01 63             	movb   $0x63,(%ecx)
  2002eb:	eb db                	jmp    2002c8 <i2X+0x2c>
  2002ed:	8d 76 00             	lea    0x0(%esi),%esi
  2002f0:	c6 01 62             	movb   $0x62,(%ecx)
  2002f3:	eb d3                	jmp    2002c8 <i2X+0x2c>
  2002f5:	8d 76 00             	lea    0x0(%esi),%esi
  2002f8:	c6 01 61             	movb   $0x61,(%ecx)
  2002fb:	eb cb                	jmp    2002c8 <i2X+0x2c>
  2002fd:	8d 76 00             	lea    0x0(%esi),%esi
  200300:	c6 01 66             	movb   $0x66,(%ecx)
  200303:	eb c3                	jmp    2002c8 <i2X+0x2c>
  200305:	8d 76 00             	lea    0x0(%esi),%esi
  200308:	8d 5e 30             	lea    0x30(%esi),%ebx
  20030b:	88 19                	mov    %bl,(%ecx)
  20030d:	eb b9                	jmp    2002c8 <i2X+0x2c>
  20030f:	90                   	nop

00200310 <memcpy>:
  200310:	55                   	push   %ebp
  200311:	89 e5                	mov    %esp,%ebp
  200313:	57                   	push   %edi
  200314:	56                   	push   %esi
  200315:	53                   	push   %ebx
  200316:	8b 55 08             	mov    0x8(%ebp),%edx
  200319:	8b 7d 0c             	mov    0xc(%ebp),%edi
  20031c:	8b 45 10             	mov    0x10(%ebp),%eax
  20031f:	85 c0                	test   %eax,%eax
  200321:	7e 35                	jle    200358 <memcpy+0x48>
  200323:	8a 1f                	mov    (%edi),%bl
  200325:	84 db                	test   %bl,%bl
  200327:	74 2f                	je     200358 <memcpy+0x48>
  200329:	8d 34 02             	lea    (%edx,%eax,1),%esi
  20032c:	31 c9                	xor    %ecx,%ecx
  20032e:	eb 07                	jmp    200337 <memcpy+0x27>
  200330:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  200333:	84 db                	test   %bl,%bl
  200335:	74 15                	je     20034c <memcpy+0x3c>
  200337:	42                   	inc    %edx
  200338:	88 5a ff             	mov    %bl,-0x1(%edx)
  20033b:	41                   	inc    %ecx
  20033c:	39 f2                	cmp    %esi,%edx
  20033e:	75 f0                	jne    200330 <memcpy+0x20>
  200340:	c6 06 00             	movb   $0x0,(%esi)
  200343:	29 c8                	sub    %ecx,%eax
  200345:	5b                   	pop    %ebx
  200346:	5e                   	pop    %esi
  200347:	5f                   	pop    %edi
  200348:	5d                   	pop    %ebp
  200349:	c3                   	ret    
  20034a:	66 90                	xchg   %ax,%ax
  20034c:	89 d6                	mov    %edx,%esi
  20034e:	c6 06 00             	movb   $0x0,(%esi)
  200351:	29 c8                	sub    %ecx,%eax
  200353:	5b                   	pop    %ebx
  200354:	5e                   	pop    %esi
  200355:	5f                   	pop    %edi
  200356:	5d                   	pop    %ebp
  200357:	c3                   	ret    
  200358:	89 d6                	mov    %edx,%esi
  20035a:	31 c9                	xor    %ecx,%ecx
  20035c:	eb e2                	jmp    200340 <memcpy+0x30>
  20035e:	66 90                	xchg   %ax,%ax

00200360 <length_str>:
  200360:	55                   	push   %ebp
  200361:	89 e5                	mov    %esp,%ebp
  200363:	8b 55 08             	mov    0x8(%ebp),%edx
  200366:	31 c0                	xor    %eax,%eax
  200368:	80 3a 00             	cmpb   $0x0,(%edx)
  20036b:	74 0a                	je     200377 <length_str+0x17>
  20036d:	8d 76 00             	lea    0x0(%esi),%esi
  200370:	40                   	inc    %eax
  200371:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  200375:	75 f9                	jne    200370 <length_str+0x10>
  200377:	5d                   	pop    %ebp
  200378:	c3                   	ret    
  200379:	8d 76 00             	lea    0x0(%esi),%esi

0020037c <printf>:
  20037c:	55                   	push   %ebp
  20037d:	89 e5                	mov    %esp,%ebp
  20037f:	57                   	push   %edi
  200380:	56                   	push   %esi
  200381:	53                   	push   %ebx
  200382:	83 ec 24             	sub    $0x24,%esp
  200385:	8b 4d 08             	mov    0x8(%ebp),%ecx
  200388:	8a 11                	mov    (%ecx),%dl
  20038a:	84 d2                	test   %dl,%dl
  20038c:	0f 84 74 01 00 00    	je     200506 <printf+0x18a>
  200392:	8d 45 0c             	lea    0xc(%ebp),%eax
  200395:	31 ff                	xor    %edi,%edi
  200397:	eb 18                	jmp    2003b1 <printf+0x35>
  200399:	8d 76 00             	lea    0x0(%esi),%esi
  20039c:	8a 11                	mov    (%ecx),%dl
  20039e:	89 cb                	mov    %ecx,%ebx
  2003a0:	88 97 c0 17 20 00    	mov    %dl,0x2017c0(%edi)
  2003a6:	47                   	inc    %edi
  2003a7:	8d 4b 01             	lea    0x1(%ebx),%ecx
  2003aa:	8a 53 01             	mov    0x1(%ebx),%dl
  2003ad:	84 d2                	test   %dl,%dl
  2003af:	74 72                	je     200423 <printf+0xa7>
  2003b1:	80 fa 25             	cmp    $0x25,%dl
  2003b4:	75 e6                	jne    20039c <printf+0x20>
  2003b6:	8d 59 01             	lea    0x1(%ecx),%ebx
  2003b9:	8a 51 01             	mov    0x1(%ecx),%dl
  2003bc:	80 fa 64             	cmp    $0x64,%dl
  2003bf:	0f 84 df 00 00 00    	je     2004a4 <printf+0x128>
  2003c5:	0f 8e 21 01 00 00    	jle    2004ec <printf+0x170>
  2003cb:	80 fa 73             	cmp    $0x73,%dl
  2003ce:	0f 84 a0 00 00 00    	je     200474 <printf+0xf8>
  2003d4:	80 fa 78             	cmp    $0x78,%dl
  2003d7:	75 c7                	jne    2003a0 <printf+0x24>
  2003d9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2003e0:	8d 70 04             	lea    0x4(%eax),%esi
  2003e3:	89 75 d0             	mov    %esi,-0x30(%ebp)
  2003e6:	8d 75 f0             	lea    -0x10(%ebp),%esi
  2003e9:	56                   	push   %esi
  2003ea:	ff 30                	pushl  (%eax)
  2003ec:	e8 ab fe ff ff       	call   20029c <i2X>
  2003f1:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2003f4:	8d b7 c0 17 20 00    	lea    0x2017c0(%edi),%esi
  2003fa:	8a 11                	mov    (%ecx),%dl
  2003fc:	83 c4 08             	add    $0x8,%esp
  2003ff:	31 c0                	xor    %eax,%eax
  200401:	84 d2                	test   %dl,%dl
  200403:	74 0f                	je     200414 <printf+0x98>
  200405:	8d 76 00             	lea    0x0(%esi),%esi
  200408:	40                   	inc    %eax
  200409:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  20040d:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  200410:	84 d2                	test   %dl,%dl
  200412:	75 f4                	jne    200408 <printf+0x8c>
  200414:	01 c7                	add    %eax,%edi
  200416:	8b 45 d0             	mov    -0x30(%ebp),%eax
  200419:	8d 4b 01             	lea    0x1(%ebx),%ecx
  20041c:	8a 53 01             	mov    0x1(%ebx),%dl
  20041f:	84 d2                	test   %dl,%dl
  200421:	75 8e                	jne    2003b1 <printf+0x35>
  200423:	8d 47 01             	lea    0x1(%edi),%eax
  200426:	c6 87 c0 17 20 00 00 	movb   $0x0,0x2017c0(%edi)
  20042d:	c7 45 ec 04 00 00 00 	movl   $0x4,-0x14(%ebp)
  200434:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  20043b:	c7 45 e4 c0 17 20 00 	movl   $0x2017c0,-0x1c(%ebp)
  200442:	89 45 e0             	mov    %eax,-0x20(%ebp)
  200445:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  20044c:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  200453:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200456:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  200459:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  20045c:	8b 55 e0             	mov    -0x20(%ebp),%edx
  20045f:	8b 7d dc             	mov    -0x24(%ebp),%edi
  200462:	8b 75 d8             	mov    -0x28(%ebp),%esi
  200465:	cd 80                	int    $0x80
  200467:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20046a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  20046d:	5b                   	pop    %ebx
  20046e:	5e                   	pop    %esi
  20046f:	5f                   	pop    %edi
  200470:	5d                   	pop    %ebp
  200471:	c3                   	ret    
  200472:	66 90                	xchg   %ax,%ax
  200474:	8d 70 04             	lea    0x4(%eax),%esi
  200477:	89 75 d0             	mov    %esi,-0x30(%ebp)
  20047a:	8b 08                	mov    (%eax),%ecx
  20047c:	8d b7 c0 17 20 00    	lea    0x2017c0(%edi),%esi
  200482:	8a 11                	mov    (%ecx),%dl
  200484:	31 c0                	xor    %eax,%eax
  200486:	84 d2                	test   %dl,%dl
  200488:	74 8a                	je     200414 <printf+0x98>
  20048a:	66 90                	xchg   %ax,%ax
  20048c:	40                   	inc    %eax
  20048d:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  200491:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  200494:	84 d2                	test   %dl,%dl
  200496:	75 f4                	jne    20048c <printf+0x110>
  200498:	01 c7                	add    %eax,%edi
  20049a:	8b 45 d0             	mov    -0x30(%ebp),%eax
  20049d:	e9 77 ff ff ff       	jmp    200419 <printf+0x9d>
  2004a2:	66 90                	xchg   %ax,%ax
  2004a4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2004ab:	8d 70 04             	lea    0x4(%eax),%esi
  2004ae:	89 75 d0             	mov    %esi,-0x30(%ebp)
  2004b1:	8d 75 f0             	lea    -0x10(%ebp),%esi
  2004b4:	56                   	push   %esi
  2004b5:	ff 30                	pushl  (%eax)
  2004b7:	e8 44 fd ff ff       	call   200200 <i2A>
  2004bc:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2004bf:	8d b7 c0 17 20 00    	lea    0x2017c0(%edi),%esi
  2004c5:	8a 11                	mov    (%ecx),%dl
  2004c7:	83 c4 08             	add    $0x8,%esp
  2004ca:	31 c0                	xor    %eax,%eax
  2004cc:	84 d2                	test   %dl,%dl
  2004ce:	0f 84 40 ff ff ff    	je     200414 <printf+0x98>
  2004d4:	40                   	inc    %eax
  2004d5:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  2004d9:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  2004dc:	84 d2                	test   %dl,%dl
  2004de:	75 f4                	jne    2004d4 <printf+0x158>
  2004e0:	01 c7                	add    %eax,%edi
  2004e2:	8b 45 d0             	mov    -0x30(%ebp),%eax
  2004e5:	e9 2f ff ff ff       	jmp    200419 <printf+0x9d>
  2004ea:	66 90                	xchg   %ax,%ax
  2004ec:	80 fa 63             	cmp    $0x63,%dl
  2004ef:	0f 85 ab fe ff ff    	jne    2003a0 <printf+0x24>
  2004f5:	8b 10                	mov    (%eax),%edx
  2004f7:	88 97 c0 17 20 00    	mov    %dl,0x2017c0(%edi)
  2004fd:	83 c0 04             	add    $0x4,%eax
  200500:	47                   	inc    %edi
  200501:	e9 a1 fe ff ff       	jmp    2003a7 <printf+0x2b>
  200506:	b8 01 00 00 00       	mov    $0x1,%eax
  20050b:	31 ff                	xor    %edi,%edi
  20050d:	e9 14 ff ff ff       	jmp    200426 <printf+0xaa>
