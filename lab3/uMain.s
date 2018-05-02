
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	53                   	push   %ebx
  200004:	50                   	push   %eax
  200005:	e8 62 00 00 00       	call   20006c <fork>
  20000a:	89 c3                	mov    %eax,%ebx
  20000c:	85 c0                	test   %eax,%eax
  20000e:	75 24                	jne    200034 <uEntry+0x34>
  200010:	83 ec 0c             	sub    $0xc,%esp
  200013:	68 f4 04 20 00       	push   $0x2004f4
  200018:	e8 3f 03 00 00       	call   20035c <printf>
  20001d:	83 c4 10             	add    $0x10,%esp
  200020:	83 ec 08             	sub    $0x8,%esp
  200023:	53                   	push   %ebx
  200024:	68 0d 05 20 00       	push   $0x20050d
  200029:	e8 2e 03 00 00       	call   20035c <printf>
  20002e:	83 c4 10             	add    $0x10,%esp
  200031:	eb fe                	jmp    200031 <uEntry+0x31>
  200033:	90                   	nop
  200034:	83 ec 0c             	sub    $0xc,%esp
  200037:	68 00 05 20 00       	push   $0x200500
  20003c:	e8 1b 03 00 00       	call   20035c <printf>
  200041:	83 c4 10             	add    $0x10,%esp
  200044:	eb da                	jmp    200020 <uEntry+0x20>
  200046:	66 90                	xchg   %ax,%ax

00200048 <syscall>:
  200048:	55                   	push   %ebp
  200049:	89 e5                	mov    %esp,%ebp
  20004b:	83 ec 10             	sub    $0x10,%esp
  20004e:	8b 45 08             	mov    0x8(%ebp),%eax
  200051:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  200054:	8b 4d 10             	mov    0x10(%ebp),%ecx
  200057:	8b 55 14             	mov    0x14(%ebp),%edx
  20005a:	8b 7d 18             	mov    0x18(%ebp),%edi
  20005d:	8b 75 1c             	mov    0x1c(%ebp),%esi
  200060:	cd 80                	int    $0x80
  200062:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200065:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200068:	c9                   	leave  
  200069:	c3                   	ret    
  20006a:	66 90                	xchg   %ax,%ax

0020006c <fork>:
  20006c:	55                   	push   %ebp
  20006d:	89 e5                	mov    %esp,%ebp
  20006f:	83 ec 20             	sub    $0x20,%esp
  200072:	c7 45 e4 02 00 00 00 	movl   $0x2,-0x1c(%ebp)
  200079:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  200080:	c7 45 ec 17 05 20 00 	movl   $0x200517,-0x14(%ebp)
  200087:	c7 45 f0 0d 00 00 00 	movl   $0xd,-0x10(%ebp)
  20008e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200095:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  20009c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  20009f:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2000a2:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2000a5:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2000a8:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2000ab:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2000ae:	cd 80                	int    $0x80
  2000b0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2000b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2000b6:	c9                   	leave  
  2000b7:	c3                   	ret    

002000b8 <sleep>:
  2000b8:	55                   	push   %ebp
  2000b9:	89 e5                	mov    %esp,%ebp
  2000bb:	83 ec 20             	sub    $0x20,%esp
  2000be:	c7 45 e4 e6 00 00 00 	movl   $0xe6,-0x1c(%ebp)
  2000c5:	8b 45 08             	mov    0x8(%ebp),%eax
  2000c8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  2000cb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  2000d2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2000d9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2000e0:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2000e7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2000ea:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2000ed:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2000f0:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2000f3:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2000f6:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2000f9:	cd 80                	int    $0x80
  2000fb:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2000fe:	31 c0                	xor    %eax,%eax
  200100:	c9                   	leave  
  200101:	c3                   	ret    
  200102:	66 90                	xchg   %ax,%ax

00200104 <exit>:
  200104:	55                   	push   %ebp
  200105:	89 e5                	mov    %esp,%ebp
  200107:	83 ec 20             	sub    $0x20,%esp
  20010a:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  200111:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  200118:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  20011f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200126:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20012d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200134:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  200137:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  20013a:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  20013d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200140:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200143:	8b 75 f8             	mov    -0x8(%ebp),%esi
  200146:	cd 80                	int    $0x80
  200148:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20014b:	31 c0                	xor    %eax,%eax
  20014d:	c9                   	leave  
  20014e:	c3                   	ret    
  20014f:	90                   	nop

00200150 <fs_write>:
  200150:	55                   	push   %ebp
  200151:	89 e5                	mov    %esp,%ebp
  200153:	83 ec 20             	sub    $0x20,%esp
  200156:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  20015d:	8b 45 08             	mov    0x8(%ebp),%eax
  200160:	89 45 e8             	mov    %eax,-0x18(%ebp)
  200163:	8b 45 0c             	mov    0xc(%ebp),%eax
  200166:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200169:	8b 45 10             	mov    0x10(%ebp),%eax
  20016c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20016f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200176:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  20017d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  200180:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  200183:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200186:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200189:	8b 7d f4             	mov    -0xc(%ebp),%edi
  20018c:	8b 75 f8             	mov    -0x8(%ebp),%esi
  20018f:	cd 80                	int    $0x80
  200191:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200194:	c9                   	leave  
  200195:	c3                   	ret    
  200196:	66 90                	xchg   %ax,%ax

00200198 <putchar_user>:
  200198:	55                   	push   %ebp
  200199:	89 e5                	mov    %esp,%ebp
  20019b:	83 ec 24             	sub    $0x24,%esp
  20019e:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  2001a5:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  2001ac:	8d 45 dc             	lea    -0x24(%ebp),%eax
  2001af:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2001b2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  2001b9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2001c0:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2001c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2001ca:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2001cd:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2001d0:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2001d3:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2001d6:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2001d9:	cd 80                	int    $0x80
  2001db:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2001de:	c9                   	leave  
  2001df:	c3                   	ret    

002001e0 <i2A>:
  2001e0:	55                   	push   %ebp
  2001e1:	89 e5                	mov    %esp,%ebp
  2001e3:	57                   	push   %edi
  2001e4:	56                   	push   %esi
  2001e5:	53                   	push   %ebx
  2001e6:	51                   	push   %ecx
  2001e7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2001ea:	85 c9                	test   %ecx,%ecx
  2001ec:	78 6e                	js     20025c <i2A+0x7c>
  2001ee:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  2001f2:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  2001f6:	bb 62 17 20 00       	mov    $0x201762,%ebx
  2001fb:	31 ff                	xor    %edi,%edi
  2001fd:	eb 03                	jmp    200202 <i2A+0x22>
  2001ff:	90                   	nop
  200200:	89 f7                	mov    %esi,%edi
  200202:	4b                   	dec    %ebx
  200203:	89 c8                	mov    %ecx,%eax
  200205:	be 0a 00 00 00       	mov    $0xa,%esi
  20020a:	99                   	cltd   
  20020b:	f7 fe                	idiv   %esi
  20020d:	83 c2 30             	add    $0x30,%edx
  200210:	88 13                	mov    %dl,(%ebx)
  200212:	8d 77 01             	lea    0x1(%edi),%esi
  200215:	b8 67 66 66 66       	mov    $0x66666667,%eax
  20021a:	f7 e9                	imul   %ecx
  20021c:	89 d0                	mov    %edx,%eax
  20021e:	c1 f8 02             	sar    $0x2,%eax
  200221:	c1 f9 1f             	sar    $0x1f,%ecx
  200224:	29 c8                	sub    %ecx,%eax
  200226:	89 c1                	mov    %eax,%ecx
  200228:	75 d6                	jne    200200 <i2A+0x20>
  20022a:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  20022e:	74 20                	je     200250 <i2A+0x70>
  200230:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  200234:	75 06                	jne    20023c <i2A+0x5c>
  200236:	fe 05 61 17 20 00    	incb   0x201761
  20023c:	c6 05 62 17 20 00 00 	movb   $0x0,0x201762
  200243:	8b 45 0c             	mov    0xc(%ebp),%eax
  200246:	89 18                	mov    %ebx,(%eax)
  200248:	89 f0                	mov    %esi,%eax
  20024a:	5a                   	pop    %edx
  20024b:	5b                   	pop    %ebx
  20024c:	5e                   	pop    %esi
  20024d:	5f                   	pop    %edi
  20024e:	5d                   	pop    %ebp
  20024f:	c3                   	ret    
  200250:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  200254:	8d 77 02             	lea    0x2(%edi),%esi
  200257:	4b                   	dec    %ebx
  200258:	eb d6                	jmp    200230 <i2A+0x50>
  20025a:	66 90                	xchg   %ax,%ax
  20025c:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  200262:	74 0c                	je     200270 <i2A+0x90>
  200264:	f7 d9                	neg    %ecx
  200266:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  20026a:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  20026e:	eb 86                	jmp    2001f6 <i2A+0x16>
  200270:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  200275:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  200279:	eb ef                	jmp    20026a <i2A+0x8a>
  20027b:	90                   	nop

0020027c <i2X>:
  20027c:	55                   	push   %ebp
  20027d:	89 e5                	mov    %esp,%ebp
  20027f:	57                   	push   %edi
  200280:	56                   	push   %esi
  200281:	53                   	push   %ebx
  200282:	8b 55 08             	mov    0x8(%ebp),%edx
  200285:	b9 41 17 20 00       	mov    $0x201741,%ecx
  20028a:	31 c0                	xor    %eax,%eax
  20028c:	40                   	inc    %eax
  20028d:	89 d6                	mov    %edx,%esi
  20028f:	83 e6 0f             	and    $0xf,%esi
  200292:	8d 5e f6             	lea    -0xa(%esi),%ebx
  200295:	89 cf                	mov    %ecx,%edi
  200297:	83 fb 05             	cmp    $0x5,%ebx
  20029a:	77 4c                	ja     2002e8 <i2X+0x6c>
  20029c:	ff 24 9d 20 05 20 00 	jmp    *0x200520(,%ebx,4)
  2002a3:	90                   	nop
  2002a4:	c6 01 65             	movb   $0x65,(%ecx)
  2002a7:	90                   	nop
  2002a8:	49                   	dec    %ecx
  2002a9:	c1 ea 04             	shr    $0x4,%edx
  2002ac:	75 de                	jne    20028c <i2X+0x10>
  2002ae:	c6 05 42 17 20 00 00 	movb   $0x0,0x201742
  2002b5:	8b 55 0c             	mov    0xc(%ebp),%edx
  2002b8:	89 3a                	mov    %edi,(%edx)
  2002ba:	5b                   	pop    %ebx
  2002bb:	5e                   	pop    %esi
  2002bc:	5f                   	pop    %edi
  2002bd:	5d                   	pop    %ebp
  2002be:	c3                   	ret    
  2002bf:	90                   	nop
  2002c0:	c6 01 64             	movb   $0x64,(%ecx)
  2002c3:	eb e3                	jmp    2002a8 <i2X+0x2c>
  2002c5:	8d 76 00             	lea    0x0(%esi),%esi
  2002c8:	c6 01 63             	movb   $0x63,(%ecx)
  2002cb:	eb db                	jmp    2002a8 <i2X+0x2c>
  2002cd:	8d 76 00             	lea    0x0(%esi),%esi
  2002d0:	c6 01 62             	movb   $0x62,(%ecx)
  2002d3:	eb d3                	jmp    2002a8 <i2X+0x2c>
  2002d5:	8d 76 00             	lea    0x0(%esi),%esi
  2002d8:	c6 01 61             	movb   $0x61,(%ecx)
  2002db:	eb cb                	jmp    2002a8 <i2X+0x2c>
  2002dd:	8d 76 00             	lea    0x0(%esi),%esi
  2002e0:	c6 01 66             	movb   $0x66,(%ecx)
  2002e3:	eb c3                	jmp    2002a8 <i2X+0x2c>
  2002e5:	8d 76 00             	lea    0x0(%esi),%esi
  2002e8:	8d 5e 30             	lea    0x30(%esi),%ebx
  2002eb:	88 19                	mov    %bl,(%ecx)
  2002ed:	eb b9                	jmp    2002a8 <i2X+0x2c>
  2002ef:	90                   	nop

002002f0 <memcpy>:
  2002f0:	55                   	push   %ebp
  2002f1:	89 e5                	mov    %esp,%ebp
  2002f3:	57                   	push   %edi
  2002f4:	56                   	push   %esi
  2002f5:	53                   	push   %ebx
  2002f6:	8b 55 08             	mov    0x8(%ebp),%edx
  2002f9:	8b 7d 0c             	mov    0xc(%ebp),%edi
  2002fc:	8b 45 10             	mov    0x10(%ebp),%eax
  2002ff:	85 c0                	test   %eax,%eax
  200301:	7e 35                	jle    200338 <memcpy+0x48>
  200303:	8a 1f                	mov    (%edi),%bl
  200305:	84 db                	test   %bl,%bl
  200307:	74 2f                	je     200338 <memcpy+0x48>
  200309:	8d 34 02             	lea    (%edx,%eax,1),%esi
  20030c:	31 c9                	xor    %ecx,%ecx
  20030e:	eb 07                	jmp    200317 <memcpy+0x27>
  200310:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  200313:	84 db                	test   %bl,%bl
  200315:	74 15                	je     20032c <memcpy+0x3c>
  200317:	42                   	inc    %edx
  200318:	88 5a ff             	mov    %bl,-0x1(%edx)
  20031b:	41                   	inc    %ecx
  20031c:	39 f2                	cmp    %esi,%edx
  20031e:	75 f0                	jne    200310 <memcpy+0x20>
  200320:	c6 06 00             	movb   $0x0,(%esi)
  200323:	29 c8                	sub    %ecx,%eax
  200325:	5b                   	pop    %ebx
  200326:	5e                   	pop    %esi
  200327:	5f                   	pop    %edi
  200328:	5d                   	pop    %ebp
  200329:	c3                   	ret    
  20032a:	66 90                	xchg   %ax,%ax
  20032c:	89 d6                	mov    %edx,%esi
  20032e:	c6 06 00             	movb   $0x0,(%esi)
  200331:	29 c8                	sub    %ecx,%eax
  200333:	5b                   	pop    %ebx
  200334:	5e                   	pop    %esi
  200335:	5f                   	pop    %edi
  200336:	5d                   	pop    %ebp
  200337:	c3                   	ret    
  200338:	89 d6                	mov    %edx,%esi
  20033a:	31 c9                	xor    %ecx,%ecx
  20033c:	eb e2                	jmp    200320 <memcpy+0x30>
  20033e:	66 90                	xchg   %ax,%ax

00200340 <length_str>:
  200340:	55                   	push   %ebp
  200341:	89 e5                	mov    %esp,%ebp
  200343:	8b 55 08             	mov    0x8(%ebp),%edx
  200346:	31 c0                	xor    %eax,%eax
  200348:	80 3a 00             	cmpb   $0x0,(%edx)
  20034b:	74 0a                	je     200357 <length_str+0x17>
  20034d:	8d 76 00             	lea    0x0(%esi),%esi
  200350:	40                   	inc    %eax
  200351:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  200355:	75 f9                	jne    200350 <length_str+0x10>
  200357:	5d                   	pop    %ebp
  200358:	c3                   	ret    
  200359:	8d 76 00             	lea    0x0(%esi),%esi

0020035c <printf>:
  20035c:	55                   	push   %ebp
  20035d:	89 e5                	mov    %esp,%ebp
  20035f:	57                   	push   %edi
  200360:	56                   	push   %esi
  200361:	53                   	push   %ebx
  200362:	83 ec 24             	sub    $0x24,%esp
  200365:	8b 4d 08             	mov    0x8(%ebp),%ecx
  200368:	8a 11                	mov    (%ecx),%dl
  20036a:	84 d2                	test   %dl,%dl
  20036c:	0f 84 74 01 00 00    	je     2004e6 <printf+0x18a>
  200372:	8d 45 0c             	lea    0xc(%ebp),%eax
  200375:	31 ff                	xor    %edi,%edi
  200377:	eb 18                	jmp    200391 <printf+0x35>
  200379:	8d 76 00             	lea    0x0(%esi),%esi
  20037c:	8a 11                	mov    (%ecx),%dl
  20037e:	89 cb                	mov    %ecx,%ebx
  200380:	88 97 80 17 20 00    	mov    %dl,0x201780(%edi)
  200386:	47                   	inc    %edi
  200387:	8d 4b 01             	lea    0x1(%ebx),%ecx
  20038a:	8a 53 01             	mov    0x1(%ebx),%dl
  20038d:	84 d2                	test   %dl,%dl
  20038f:	74 72                	je     200403 <printf+0xa7>
  200391:	80 fa 25             	cmp    $0x25,%dl
  200394:	75 e6                	jne    20037c <printf+0x20>
  200396:	8d 59 01             	lea    0x1(%ecx),%ebx
  200399:	8a 51 01             	mov    0x1(%ecx),%dl
  20039c:	80 fa 64             	cmp    $0x64,%dl
  20039f:	0f 84 df 00 00 00    	je     200484 <printf+0x128>
  2003a5:	0f 8e 21 01 00 00    	jle    2004cc <printf+0x170>
  2003ab:	80 fa 73             	cmp    $0x73,%dl
  2003ae:	0f 84 a0 00 00 00    	je     200454 <printf+0xf8>
  2003b4:	80 fa 78             	cmp    $0x78,%dl
  2003b7:	75 c7                	jne    200380 <printf+0x24>
  2003b9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2003c0:	8d 70 04             	lea    0x4(%eax),%esi
  2003c3:	89 75 d0             	mov    %esi,-0x30(%ebp)
  2003c6:	8d 75 f0             	lea    -0x10(%ebp),%esi
  2003c9:	56                   	push   %esi
  2003ca:	ff 30                	pushl  (%eax)
  2003cc:	e8 ab fe ff ff       	call   20027c <i2X>
  2003d1:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2003d4:	8d b7 80 17 20 00    	lea    0x201780(%edi),%esi
  2003da:	8a 11                	mov    (%ecx),%dl
  2003dc:	83 c4 08             	add    $0x8,%esp
  2003df:	31 c0                	xor    %eax,%eax
  2003e1:	84 d2                	test   %dl,%dl
  2003e3:	74 0f                	je     2003f4 <printf+0x98>
  2003e5:	8d 76 00             	lea    0x0(%esi),%esi
  2003e8:	40                   	inc    %eax
  2003e9:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  2003ed:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  2003f0:	84 d2                	test   %dl,%dl
  2003f2:	75 f4                	jne    2003e8 <printf+0x8c>
  2003f4:	01 c7                	add    %eax,%edi
  2003f6:	8b 45 d0             	mov    -0x30(%ebp),%eax
  2003f9:	8d 4b 01             	lea    0x1(%ebx),%ecx
  2003fc:	8a 53 01             	mov    0x1(%ebx),%dl
  2003ff:	84 d2                	test   %dl,%dl
  200401:	75 8e                	jne    200391 <printf+0x35>
  200403:	8d 47 01             	lea    0x1(%edi),%eax
  200406:	c6 87 80 17 20 00 00 	movb   $0x0,0x201780(%edi)
  20040d:	c7 45 ec 04 00 00 00 	movl   $0x4,-0x14(%ebp)
  200414:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  20041b:	c7 45 e4 80 17 20 00 	movl   $0x201780,-0x1c(%ebp)
  200422:	89 45 e0             	mov    %eax,-0x20(%ebp)
  200425:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  20042c:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  200433:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200436:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  200439:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  20043c:	8b 55 e0             	mov    -0x20(%ebp),%edx
  20043f:	8b 7d dc             	mov    -0x24(%ebp),%edi
  200442:	8b 75 d8             	mov    -0x28(%ebp),%esi
  200445:	cd 80                	int    $0x80
  200447:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20044a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  20044d:	5b                   	pop    %ebx
  20044e:	5e                   	pop    %esi
  20044f:	5f                   	pop    %edi
  200450:	5d                   	pop    %ebp
  200451:	c3                   	ret    
  200452:	66 90                	xchg   %ax,%ax
  200454:	8d 70 04             	lea    0x4(%eax),%esi
  200457:	89 75 d0             	mov    %esi,-0x30(%ebp)
  20045a:	8b 08                	mov    (%eax),%ecx
  20045c:	8d b7 80 17 20 00    	lea    0x201780(%edi),%esi
  200462:	8a 11                	mov    (%ecx),%dl
  200464:	31 c0                	xor    %eax,%eax
  200466:	84 d2                	test   %dl,%dl
  200468:	74 8a                	je     2003f4 <printf+0x98>
  20046a:	66 90                	xchg   %ax,%ax
  20046c:	40                   	inc    %eax
  20046d:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  200471:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  200474:	84 d2                	test   %dl,%dl
  200476:	75 f4                	jne    20046c <printf+0x110>
  200478:	01 c7                	add    %eax,%edi
  20047a:	8b 45 d0             	mov    -0x30(%ebp),%eax
  20047d:	e9 77 ff ff ff       	jmp    2003f9 <printf+0x9d>
  200482:	66 90                	xchg   %ax,%ax
  200484:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  20048b:	8d 70 04             	lea    0x4(%eax),%esi
  20048e:	89 75 d0             	mov    %esi,-0x30(%ebp)
  200491:	8d 75 f0             	lea    -0x10(%ebp),%esi
  200494:	56                   	push   %esi
  200495:	ff 30                	pushl  (%eax)
  200497:	e8 44 fd ff ff       	call   2001e0 <i2A>
  20049c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  20049f:	8d b7 80 17 20 00    	lea    0x201780(%edi),%esi
  2004a5:	8a 11                	mov    (%ecx),%dl
  2004a7:	83 c4 08             	add    $0x8,%esp
  2004aa:	31 c0                	xor    %eax,%eax
  2004ac:	84 d2                	test   %dl,%dl
  2004ae:	0f 84 40 ff ff ff    	je     2003f4 <printf+0x98>
  2004b4:	40                   	inc    %eax
  2004b5:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  2004b9:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  2004bc:	84 d2                	test   %dl,%dl
  2004be:	75 f4                	jne    2004b4 <printf+0x158>
  2004c0:	01 c7                	add    %eax,%edi
  2004c2:	8b 45 d0             	mov    -0x30(%ebp),%eax
  2004c5:	e9 2f ff ff ff       	jmp    2003f9 <printf+0x9d>
  2004ca:	66 90                	xchg   %ax,%ax
  2004cc:	80 fa 63             	cmp    $0x63,%dl
  2004cf:	0f 85 ab fe ff ff    	jne    200380 <printf+0x24>
  2004d5:	8b 10                	mov    (%eax),%edx
  2004d7:	88 97 80 17 20 00    	mov    %dl,0x201780(%edi)
  2004dd:	83 c0 04             	add    $0x4,%eax
  2004e0:	47                   	inc    %edi
  2004e1:	e9 a1 fe ff ff       	jmp    200387 <printf+0x2b>
  2004e6:	b8 01 00 00 00       	mov    $0x1,%eax
  2004eb:	31 ff                	xor    %edi,%edi
  2004ed:	e9 14 ff ff ff       	jmp    200406 <printf+0xaa>
