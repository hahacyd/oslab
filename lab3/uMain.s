
app/uMain.elf:     file format elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	83 ec 08             	sub    $0x8,%esp
  200006:	e8 39 00 00 00       	call   200044 <fork>
  20000b:	83 ec 08             	sub    $0x8,%esp
  20000e:	50                   	push   %eax
  20000f:	68 cc 04 20 00       	push   $0x2004cc
  200014:	e8 1b 03 00 00       	call   200334 <printf>
  200019:	83 c4 10             	add    $0x10,%esp
  20001c:	eb fe                	jmp    20001c <uEntry+0x1c>
  20001e:	66 90                	xchg   %ax,%ax

00200020 <syscall>:
  200020:	55                   	push   %ebp
  200021:	89 e5                	mov    %esp,%ebp
  200023:	83 ec 10             	sub    $0x10,%esp
  200026:	8b 45 08             	mov    0x8(%ebp),%eax
  200029:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  20002c:	8b 4d 10             	mov    0x10(%ebp),%ecx
  20002f:	8b 55 14             	mov    0x14(%ebp),%edx
  200032:	8b 7d 18             	mov    0x18(%ebp),%edi
  200035:	8b 75 1c             	mov    0x1c(%ebp),%esi
  200038:	cd 80                	int    $0x80
  20003a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20003d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200040:	c9                   	leave  
  200041:	c3                   	ret    
  200042:	66 90                	xchg   %ax,%ax

00200044 <fork>:
  200044:	55                   	push   %ebp
  200045:	89 e5                	mov    %esp,%ebp
  200047:	83 ec 20             	sub    $0x20,%esp
  20004a:	c7 45 e4 02 00 00 00 	movl   $0x2,-0x1c(%ebp)
  200051:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  200058:	c7 45 ec d6 04 20 00 	movl   $0x2004d6,-0x14(%ebp)
  20005f:	c7 45 f0 0d 00 00 00 	movl   $0xd,-0x10(%ebp)
  200066:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20006d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200074:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  200077:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  20007a:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  20007d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200080:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200083:	8b 75 f8             	mov    -0x8(%ebp),%esi
  200086:	cd 80                	int    $0x80
  200088:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20008b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  20008e:	c9                   	leave  
  20008f:	c3                   	ret    

00200090 <sleep>:
  200090:	55                   	push   %ebp
  200091:	89 e5                	mov    %esp,%ebp
  200093:	83 ec 20             	sub    $0x20,%esp
  200096:	c7 45 e4 e6 00 00 00 	movl   $0xe6,-0x1c(%ebp)
  20009d:	8b 45 08             	mov    0x8(%ebp),%eax
  2000a0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  2000a3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  2000aa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2000b1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2000b8:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2000bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2000c2:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2000c5:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2000c8:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2000cb:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2000ce:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2000d1:	cd 80                	int    $0x80
  2000d3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2000d6:	31 c0                	xor    %eax,%eax
  2000d8:	c9                   	leave  
  2000d9:	c3                   	ret    
  2000da:	66 90                	xchg   %ax,%ax

002000dc <exit>:
  2000dc:	55                   	push   %ebp
  2000dd:	89 e5                	mov    %esp,%ebp
  2000df:	83 ec 20             	sub    $0x20,%esp
  2000e2:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  2000e9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  2000f0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  2000f7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2000fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200105:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  20010c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  20010f:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  200112:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200115:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200118:	8b 7d f4             	mov    -0xc(%ebp),%edi
  20011b:	8b 75 f8             	mov    -0x8(%ebp),%esi
  20011e:	cd 80                	int    $0x80
  200120:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200123:	31 c0                	xor    %eax,%eax
  200125:	c9                   	leave  
  200126:	c3                   	ret    
  200127:	90                   	nop

00200128 <fs_write>:
  200128:	55                   	push   %ebp
  200129:	89 e5                	mov    %esp,%ebp
  20012b:	83 ec 20             	sub    $0x20,%esp
  20012e:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  200135:	8b 45 08             	mov    0x8(%ebp),%eax
  200138:	89 45 e8             	mov    %eax,-0x18(%ebp)
  20013b:	8b 45 0c             	mov    0xc(%ebp),%eax
  20013e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200141:	8b 45 10             	mov    0x10(%ebp),%eax
  200144:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200147:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20014e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200155:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  200158:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  20015b:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  20015e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200161:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200164:	8b 75 f8             	mov    -0x8(%ebp),%esi
  200167:	cd 80                	int    $0x80
  200169:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20016c:	c9                   	leave  
  20016d:	c3                   	ret    
  20016e:	66 90                	xchg   %ax,%ax

00200170 <putchar_user>:
  200170:	55                   	push   %ebp
  200171:	89 e5                	mov    %esp,%ebp
  200173:	83 ec 24             	sub    $0x24,%esp
  200176:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  20017d:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  200184:	8d 45 dc             	lea    -0x24(%ebp),%eax
  200187:	89 45 ec             	mov    %eax,-0x14(%ebp)
  20018a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  200191:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200198:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  20019f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2001a2:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2001a5:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2001a8:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2001ab:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2001ae:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2001b1:	cd 80                	int    $0x80
  2001b3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2001b6:	c9                   	leave  
  2001b7:	c3                   	ret    

002001b8 <i2A>:
  2001b8:	55                   	push   %ebp
  2001b9:	89 e5                	mov    %esp,%ebp
  2001bb:	57                   	push   %edi
  2001bc:	56                   	push   %esi
  2001bd:	53                   	push   %ebx
  2001be:	51                   	push   %ecx
  2001bf:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2001c2:	85 c9                	test   %ecx,%ecx
  2001c4:	78 6e                	js     200234 <i2A+0x7c>
  2001c6:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  2001ca:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  2001ce:	bb 22 17 20 00       	mov    $0x201722,%ebx
  2001d3:	31 ff                	xor    %edi,%edi
  2001d5:	eb 03                	jmp    2001da <i2A+0x22>
  2001d7:	90                   	nop
  2001d8:	89 f7                	mov    %esi,%edi
  2001da:	4b                   	dec    %ebx
  2001db:	89 c8                	mov    %ecx,%eax
  2001dd:	be 0a 00 00 00       	mov    $0xa,%esi
  2001e2:	99                   	cltd   
  2001e3:	f7 fe                	idiv   %esi
  2001e5:	83 c2 30             	add    $0x30,%edx
  2001e8:	88 13                	mov    %dl,(%ebx)
  2001ea:	8d 77 01             	lea    0x1(%edi),%esi
  2001ed:	b8 67 66 66 66       	mov    $0x66666667,%eax
  2001f2:	f7 e9                	imul   %ecx
  2001f4:	89 d0                	mov    %edx,%eax
  2001f6:	c1 f8 02             	sar    $0x2,%eax
  2001f9:	c1 f9 1f             	sar    $0x1f,%ecx
  2001fc:	29 c8                	sub    %ecx,%eax
  2001fe:	89 c1                	mov    %eax,%ecx
  200200:	75 d6                	jne    2001d8 <i2A+0x20>
  200202:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  200206:	74 20                	je     200228 <i2A+0x70>
  200208:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  20020c:	75 06                	jne    200214 <i2A+0x5c>
  20020e:	fe 05 21 17 20 00    	incb   0x201721
  200214:	c6 05 22 17 20 00 00 	movb   $0x0,0x201722
  20021b:	8b 45 0c             	mov    0xc(%ebp),%eax
  20021e:	89 18                	mov    %ebx,(%eax)
  200220:	89 f0                	mov    %esi,%eax
  200222:	5a                   	pop    %edx
  200223:	5b                   	pop    %ebx
  200224:	5e                   	pop    %esi
  200225:	5f                   	pop    %edi
  200226:	5d                   	pop    %ebp
  200227:	c3                   	ret    
  200228:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  20022c:	8d 77 02             	lea    0x2(%edi),%esi
  20022f:	4b                   	dec    %ebx
  200230:	eb d6                	jmp    200208 <i2A+0x50>
  200232:	66 90                	xchg   %ax,%ax
  200234:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  20023a:	74 0c                	je     200248 <i2A+0x90>
  20023c:	f7 d9                	neg    %ecx
  20023e:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  200242:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  200246:	eb 86                	jmp    2001ce <i2A+0x16>
  200248:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  20024d:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  200251:	eb ef                	jmp    200242 <i2A+0x8a>
  200253:	90                   	nop

00200254 <i2X>:
  200254:	55                   	push   %ebp
  200255:	89 e5                	mov    %esp,%ebp
  200257:	57                   	push   %edi
  200258:	56                   	push   %esi
  200259:	53                   	push   %ebx
  20025a:	8b 55 08             	mov    0x8(%ebp),%edx
  20025d:	b9 01 17 20 00       	mov    $0x201701,%ecx
  200262:	31 c0                	xor    %eax,%eax
  200264:	40                   	inc    %eax
  200265:	89 d6                	mov    %edx,%esi
  200267:	83 e6 0f             	and    $0xf,%esi
  20026a:	8d 5e f6             	lea    -0xa(%esi),%ebx
  20026d:	89 cf                	mov    %ecx,%edi
  20026f:	83 fb 05             	cmp    $0x5,%ebx
  200272:	77 4c                	ja     2002c0 <i2X+0x6c>
  200274:	ff 24 9d e0 04 20 00 	jmp    *0x2004e0(,%ebx,4)
  20027b:	90                   	nop
  20027c:	c6 01 65             	movb   $0x65,(%ecx)
  20027f:	90                   	nop
  200280:	49                   	dec    %ecx
  200281:	c1 ea 04             	shr    $0x4,%edx
  200284:	75 de                	jne    200264 <i2X+0x10>
  200286:	c6 05 02 17 20 00 00 	movb   $0x0,0x201702
  20028d:	8b 55 0c             	mov    0xc(%ebp),%edx
  200290:	89 3a                	mov    %edi,(%edx)
  200292:	5b                   	pop    %ebx
  200293:	5e                   	pop    %esi
  200294:	5f                   	pop    %edi
  200295:	5d                   	pop    %ebp
  200296:	c3                   	ret    
  200297:	90                   	nop
  200298:	c6 01 64             	movb   $0x64,(%ecx)
  20029b:	eb e3                	jmp    200280 <i2X+0x2c>
  20029d:	8d 76 00             	lea    0x0(%esi),%esi
  2002a0:	c6 01 63             	movb   $0x63,(%ecx)
  2002a3:	eb db                	jmp    200280 <i2X+0x2c>
  2002a5:	8d 76 00             	lea    0x0(%esi),%esi
  2002a8:	c6 01 62             	movb   $0x62,(%ecx)
  2002ab:	eb d3                	jmp    200280 <i2X+0x2c>
  2002ad:	8d 76 00             	lea    0x0(%esi),%esi
  2002b0:	c6 01 61             	movb   $0x61,(%ecx)
  2002b3:	eb cb                	jmp    200280 <i2X+0x2c>
  2002b5:	8d 76 00             	lea    0x0(%esi),%esi
  2002b8:	c6 01 66             	movb   $0x66,(%ecx)
  2002bb:	eb c3                	jmp    200280 <i2X+0x2c>
  2002bd:	8d 76 00             	lea    0x0(%esi),%esi
  2002c0:	8d 5e 30             	lea    0x30(%esi),%ebx
  2002c3:	88 19                	mov    %bl,(%ecx)
  2002c5:	eb b9                	jmp    200280 <i2X+0x2c>
  2002c7:	90                   	nop

002002c8 <memcpy>:
  2002c8:	55                   	push   %ebp
  2002c9:	89 e5                	mov    %esp,%ebp
  2002cb:	57                   	push   %edi
  2002cc:	56                   	push   %esi
  2002cd:	53                   	push   %ebx
  2002ce:	8b 55 08             	mov    0x8(%ebp),%edx
  2002d1:	8b 7d 0c             	mov    0xc(%ebp),%edi
  2002d4:	8b 45 10             	mov    0x10(%ebp),%eax
  2002d7:	85 c0                	test   %eax,%eax
  2002d9:	7e 35                	jle    200310 <memcpy+0x48>
  2002db:	8a 1f                	mov    (%edi),%bl
  2002dd:	84 db                	test   %bl,%bl
  2002df:	74 2f                	je     200310 <memcpy+0x48>
  2002e1:	8d 34 02             	lea    (%edx,%eax,1),%esi
  2002e4:	31 c9                	xor    %ecx,%ecx
  2002e6:	eb 07                	jmp    2002ef <memcpy+0x27>
  2002e8:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  2002eb:	84 db                	test   %bl,%bl
  2002ed:	74 15                	je     200304 <memcpy+0x3c>
  2002ef:	42                   	inc    %edx
  2002f0:	88 5a ff             	mov    %bl,-0x1(%edx)
  2002f3:	41                   	inc    %ecx
  2002f4:	39 f2                	cmp    %esi,%edx
  2002f6:	75 f0                	jne    2002e8 <memcpy+0x20>
  2002f8:	c6 06 00             	movb   $0x0,(%esi)
  2002fb:	29 c8                	sub    %ecx,%eax
  2002fd:	5b                   	pop    %ebx
  2002fe:	5e                   	pop    %esi
  2002ff:	5f                   	pop    %edi
  200300:	5d                   	pop    %ebp
  200301:	c3                   	ret    
  200302:	66 90                	xchg   %ax,%ax
  200304:	89 d6                	mov    %edx,%esi
  200306:	c6 06 00             	movb   $0x0,(%esi)
  200309:	29 c8                	sub    %ecx,%eax
  20030b:	5b                   	pop    %ebx
  20030c:	5e                   	pop    %esi
  20030d:	5f                   	pop    %edi
  20030e:	5d                   	pop    %ebp
  20030f:	c3                   	ret    
  200310:	89 d6                	mov    %edx,%esi
  200312:	31 c9                	xor    %ecx,%ecx
  200314:	eb e2                	jmp    2002f8 <memcpy+0x30>
  200316:	66 90                	xchg   %ax,%ax

00200318 <length_str>:
  200318:	55                   	push   %ebp
  200319:	89 e5                	mov    %esp,%ebp
  20031b:	8b 55 08             	mov    0x8(%ebp),%edx
  20031e:	31 c0                	xor    %eax,%eax
  200320:	80 3a 00             	cmpb   $0x0,(%edx)
  200323:	74 0a                	je     20032f <length_str+0x17>
  200325:	8d 76 00             	lea    0x0(%esi),%esi
  200328:	40                   	inc    %eax
  200329:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  20032d:	75 f9                	jne    200328 <length_str+0x10>
  20032f:	5d                   	pop    %ebp
  200330:	c3                   	ret    
  200331:	8d 76 00             	lea    0x0(%esi),%esi

00200334 <printf>:
  200334:	55                   	push   %ebp
  200335:	89 e5                	mov    %esp,%ebp
  200337:	57                   	push   %edi
  200338:	56                   	push   %esi
  200339:	53                   	push   %ebx
  20033a:	83 ec 24             	sub    $0x24,%esp
  20033d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  200340:	8a 11                	mov    (%ecx),%dl
  200342:	84 d2                	test   %dl,%dl
  200344:	0f 84 74 01 00 00    	je     2004be <printf+0x18a>
  20034a:	8d 45 0c             	lea    0xc(%ebp),%eax
  20034d:	31 ff                	xor    %edi,%edi
  20034f:	eb 18                	jmp    200369 <printf+0x35>
  200351:	8d 76 00             	lea    0x0(%esi),%esi
  200354:	8a 11                	mov    (%ecx),%dl
  200356:	89 cb                	mov    %ecx,%ebx
  200358:	88 97 40 17 20 00    	mov    %dl,0x201740(%edi)
  20035e:	47                   	inc    %edi
  20035f:	8d 4b 01             	lea    0x1(%ebx),%ecx
  200362:	8a 53 01             	mov    0x1(%ebx),%dl
  200365:	84 d2                	test   %dl,%dl
  200367:	74 72                	je     2003db <printf+0xa7>
  200369:	80 fa 25             	cmp    $0x25,%dl
  20036c:	75 e6                	jne    200354 <printf+0x20>
  20036e:	8d 59 01             	lea    0x1(%ecx),%ebx
  200371:	8a 51 01             	mov    0x1(%ecx),%dl
  200374:	80 fa 64             	cmp    $0x64,%dl
  200377:	0f 84 df 00 00 00    	je     20045c <printf+0x128>
  20037d:	0f 8e 21 01 00 00    	jle    2004a4 <printf+0x170>
  200383:	80 fa 73             	cmp    $0x73,%dl
  200386:	0f 84 a0 00 00 00    	je     20042c <printf+0xf8>
  20038c:	80 fa 78             	cmp    $0x78,%dl
  20038f:	75 c7                	jne    200358 <printf+0x24>
  200391:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200398:	8d 70 04             	lea    0x4(%eax),%esi
  20039b:	89 75 d0             	mov    %esi,-0x30(%ebp)
  20039e:	8d 75 f0             	lea    -0x10(%ebp),%esi
  2003a1:	56                   	push   %esi
  2003a2:	ff 30                	pushl  (%eax)
  2003a4:	e8 ab fe ff ff       	call   200254 <i2X>
  2003a9:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2003ac:	8d b7 40 17 20 00    	lea    0x201740(%edi),%esi
  2003b2:	8a 11                	mov    (%ecx),%dl
  2003b4:	83 c4 08             	add    $0x8,%esp
  2003b7:	31 c0                	xor    %eax,%eax
  2003b9:	84 d2                	test   %dl,%dl
  2003bb:	74 0f                	je     2003cc <printf+0x98>
  2003bd:	8d 76 00             	lea    0x0(%esi),%esi
  2003c0:	40                   	inc    %eax
  2003c1:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  2003c5:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  2003c8:	84 d2                	test   %dl,%dl
  2003ca:	75 f4                	jne    2003c0 <printf+0x8c>
  2003cc:	01 c7                	add    %eax,%edi
  2003ce:	8b 45 d0             	mov    -0x30(%ebp),%eax
  2003d1:	8d 4b 01             	lea    0x1(%ebx),%ecx
  2003d4:	8a 53 01             	mov    0x1(%ebx),%dl
  2003d7:	84 d2                	test   %dl,%dl
  2003d9:	75 8e                	jne    200369 <printf+0x35>
  2003db:	8d 47 01             	lea    0x1(%edi),%eax
  2003de:	c6 87 40 17 20 00 00 	movb   $0x0,0x201740(%edi)
  2003e5:	c7 45 ec 04 00 00 00 	movl   $0x4,-0x14(%ebp)
  2003ec:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  2003f3:	c7 45 e4 40 17 20 00 	movl   $0x201740,-0x1c(%ebp)
  2003fa:	89 45 e0             	mov    %eax,-0x20(%ebp)
  2003fd:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  200404:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  20040b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  20040e:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  200411:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  200414:	8b 55 e0             	mov    -0x20(%ebp),%edx
  200417:	8b 7d dc             	mov    -0x24(%ebp),%edi
  20041a:	8b 75 d8             	mov    -0x28(%ebp),%esi
  20041d:	cd 80                	int    $0x80
  20041f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200422:	8d 65 f4             	lea    -0xc(%ebp),%esp
  200425:	5b                   	pop    %ebx
  200426:	5e                   	pop    %esi
  200427:	5f                   	pop    %edi
  200428:	5d                   	pop    %ebp
  200429:	c3                   	ret    
  20042a:	66 90                	xchg   %ax,%ax
  20042c:	8d 70 04             	lea    0x4(%eax),%esi
  20042f:	89 75 d0             	mov    %esi,-0x30(%ebp)
  200432:	8b 08                	mov    (%eax),%ecx
  200434:	8d b7 40 17 20 00    	lea    0x201740(%edi),%esi
  20043a:	8a 11                	mov    (%ecx),%dl
  20043c:	31 c0                	xor    %eax,%eax
  20043e:	84 d2                	test   %dl,%dl
  200440:	74 8a                	je     2003cc <printf+0x98>
  200442:	66 90                	xchg   %ax,%ax
  200444:	40                   	inc    %eax
  200445:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  200449:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  20044c:	84 d2                	test   %dl,%dl
  20044e:	75 f4                	jne    200444 <printf+0x110>
  200450:	01 c7                	add    %eax,%edi
  200452:	8b 45 d0             	mov    -0x30(%ebp),%eax
  200455:	e9 77 ff ff ff       	jmp    2003d1 <printf+0x9d>
  20045a:	66 90                	xchg   %ax,%ax
  20045c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200463:	8d 70 04             	lea    0x4(%eax),%esi
  200466:	89 75 d0             	mov    %esi,-0x30(%ebp)
  200469:	8d 75 f0             	lea    -0x10(%ebp),%esi
  20046c:	56                   	push   %esi
  20046d:	ff 30                	pushl  (%eax)
  20046f:	e8 44 fd ff ff       	call   2001b8 <i2A>
  200474:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200477:	8d b7 40 17 20 00    	lea    0x201740(%edi),%esi
  20047d:	8a 11                	mov    (%ecx),%dl
  20047f:	83 c4 08             	add    $0x8,%esp
  200482:	31 c0                	xor    %eax,%eax
  200484:	84 d2                	test   %dl,%dl
  200486:	0f 84 40 ff ff ff    	je     2003cc <printf+0x98>
  20048c:	40                   	inc    %eax
  20048d:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  200491:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  200494:	84 d2                	test   %dl,%dl
  200496:	75 f4                	jne    20048c <printf+0x158>
  200498:	01 c7                	add    %eax,%edi
  20049a:	8b 45 d0             	mov    -0x30(%ebp),%eax
  20049d:	e9 2f ff ff ff       	jmp    2003d1 <printf+0x9d>
  2004a2:	66 90                	xchg   %ax,%ax
  2004a4:	80 fa 63             	cmp    $0x63,%dl
  2004a7:	0f 85 ab fe ff ff    	jne    200358 <printf+0x24>
  2004ad:	8b 10                	mov    (%eax),%edx
  2004af:	88 97 40 17 20 00    	mov    %dl,0x201740(%edi)
  2004b5:	83 c0 04             	add    $0x4,%eax
  2004b8:	47                   	inc    %edi
  2004b9:	e9 a1 fe ff ff       	jmp    20035f <printf+0x2b>
  2004be:	b8 01 00 00 00       	mov    $0x1,%eax
  2004c3:	31 ff                	xor    %edi,%edi
  2004c5:	e9 14 ff ff ff       	jmp    2003de <printf+0xaa>
