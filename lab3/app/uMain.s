
uMain.elf:     file format elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	83 ec 08             	sub    $0x8,%esp
  200006:	e8 21 00 00 00       	call   20002c <fork>
  20000b:	31 c0                	xor    %eax,%eax
  20000d:	c9                   	leave  
  20000e:	c3                   	ret    
  20000f:	90                   	nop

00200010 <syscall>:
  200010:	55                   	push   %ebp
  200011:	89 e5                	mov    %esp,%ebp
  200013:	8b 45 08             	mov    0x8(%ebp),%eax
  200016:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  200019:	8b 4d 10             	mov    0x10(%ebp),%ecx
  20001c:	8b 55 14             	mov    0x14(%ebp),%edx
  20001f:	8b 7d 18             	mov    0x18(%ebp),%edi
  200022:	8b 75 1c             	mov    0x1c(%ebp),%esi
  200025:	cd 80                	int    $0x80
  200027:	31 c0                	xor    %eax,%eax
  200029:	5d                   	pop    %ebp
  20002a:	c3                   	ret    
  20002b:	90                   	nop

0020002c <fork>:
  20002c:	55                   	push   %ebp
  20002d:	89 e5                	mov    %esp,%ebp
  20002f:	83 ec 20             	sub    $0x20,%esp
  200032:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
  200039:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  200040:	c7 45 f0 a0 04 20 00 	movl   $0x2004a0,-0x10(%ebp)
  200047:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20004e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200055:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  20005c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  20005f:	8b 5d ec             	mov    -0x14(%ebp),%ebx
  200062:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200065:	8b 55 f4             	mov    -0xc(%ebp),%edx
  200068:	8b 7d f8             	mov    -0x8(%ebp),%edi
  20006b:	8b 75 fc             	mov    -0x4(%ebp),%esi
  20006e:	cd 80                	int    $0x80
  200070:	31 c0                	xor    %eax,%eax
  200072:	c9                   	leave  
  200073:	c3                   	ret    

00200074 <sleep>:
  200074:	55                   	push   %ebp
  200075:	89 e5                	mov    %esp,%ebp
  200077:	83 ec 20             	sub    $0x20,%esp
  20007a:	c7 45 e8 e6 00 00 00 	movl   $0xe6,-0x18(%ebp)
  200081:	8b 45 08             	mov    0x8(%ebp),%eax
  200084:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200087:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  20008e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200095:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  20009c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2000a3:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2000a6:	8b 5d ec             	mov    -0x14(%ebp),%ebx
  2000a9:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2000ac:	8b 55 f4             	mov    -0xc(%ebp),%edx
  2000af:	8b 7d f8             	mov    -0x8(%ebp),%edi
  2000b2:	8b 75 fc             	mov    -0x4(%ebp),%esi
  2000b5:	cd 80                	int    $0x80
  2000b7:	31 c0                	xor    %eax,%eax
  2000b9:	c9                   	leave  
  2000ba:	c3                   	ret    
  2000bb:	90                   	nop

002000bc <exit>:
  2000bc:	55                   	push   %ebp
  2000bd:	89 e5                	mov    %esp,%ebp
  2000bf:	83 ec 20             	sub    $0x20,%esp
  2000c2:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  2000c9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  2000d0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2000d7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2000de:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2000e5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2000ec:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2000ef:	8b 5d ec             	mov    -0x14(%ebp),%ebx
  2000f2:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2000f5:	8b 55 f4             	mov    -0xc(%ebp),%edx
  2000f8:	8b 7d f8             	mov    -0x8(%ebp),%edi
  2000fb:	8b 75 fc             	mov    -0x4(%ebp),%esi
  2000fe:	cd 80                	int    $0x80
  200100:	31 c0                	xor    %eax,%eax
  200102:	c9                   	leave  
  200103:	c3                   	ret    

00200104 <fs_write>:
  200104:	55                   	push   %ebp
  200105:	89 e5                	mov    %esp,%ebp
  200107:	83 ec 20             	sub    $0x20,%esp
  20010a:	c7 45 e8 04 00 00 00 	movl   $0x4,-0x18(%ebp)
  200111:	8b 45 08             	mov    0x8(%ebp),%eax
  200114:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200117:	8b 45 0c             	mov    0xc(%ebp),%eax
  20011a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20011d:	8b 45 10             	mov    0x10(%ebp),%eax
  200120:	89 45 f4             	mov    %eax,-0xc(%ebp)
  200123:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  20012a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200131:	8b 45 e8             	mov    -0x18(%ebp),%eax
  200134:	8b 5d ec             	mov    -0x14(%ebp),%ebx
  200137:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  20013a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  20013d:	8b 7d f8             	mov    -0x8(%ebp),%edi
  200140:	8b 75 fc             	mov    -0x4(%ebp),%esi
  200143:	cd 80                	int    $0x80
  200145:	c9                   	leave  
  200146:	c3                   	ret    
  200147:	90                   	nop

00200148 <putchar_user>:
  200148:	55                   	push   %ebp
  200149:	89 e5                	mov    %esp,%ebp
  20014b:	83 ec 24             	sub    $0x24,%esp
  20014e:	c7 45 e8 04 00 00 00 	movl   $0x4,-0x18(%ebp)
  200155:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  20015c:	8d 45 dc             	lea    -0x24(%ebp),%eax
  20015f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200162:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  200169:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200170:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200177:	8b 45 e8             	mov    -0x18(%ebp),%eax
  20017a:	8b 5d ec             	mov    -0x14(%ebp),%ebx
  20017d:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200180:	8b 55 f4             	mov    -0xc(%ebp),%edx
  200183:	8b 7d f8             	mov    -0x8(%ebp),%edi
  200186:	8b 75 fc             	mov    -0x4(%ebp),%esi
  200189:	cd 80                	int    $0x80
  20018b:	c9                   	leave  
  20018c:	c3                   	ret    
  20018d:	8d 76 00             	lea    0x0(%esi),%esi

00200190 <i2A>:
  200190:	55                   	push   %ebp
  200191:	89 e5                	mov    %esp,%ebp
  200193:	57                   	push   %edi
  200194:	56                   	push   %esi
  200195:	53                   	push   %ebx
  200196:	51                   	push   %ecx
  200197:	8b 4d 08             	mov    0x8(%ebp),%ecx
  20019a:	85 c9                	test   %ecx,%ecx
  20019c:	78 6e                	js     20020c <i2A+0x7c>
  20019e:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  2001a2:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  2001a6:	bb 02 17 20 00       	mov    $0x201702,%ebx
  2001ab:	31 ff                	xor    %edi,%edi
  2001ad:	eb 03                	jmp    2001b2 <i2A+0x22>
  2001af:	90                   	nop
  2001b0:	89 f7                	mov    %esi,%edi
  2001b2:	4b                   	dec    %ebx
  2001b3:	89 c8                	mov    %ecx,%eax
  2001b5:	be 0a 00 00 00       	mov    $0xa,%esi
  2001ba:	99                   	cltd   
  2001bb:	f7 fe                	idiv   %esi
  2001bd:	83 c2 30             	add    $0x30,%edx
  2001c0:	88 13                	mov    %dl,(%ebx)
  2001c2:	8d 77 01             	lea    0x1(%edi),%esi
  2001c5:	b8 67 66 66 66       	mov    $0x66666667,%eax
  2001ca:	f7 e9                	imul   %ecx
  2001cc:	89 d0                	mov    %edx,%eax
  2001ce:	c1 f8 02             	sar    $0x2,%eax
  2001d1:	c1 f9 1f             	sar    $0x1f,%ecx
  2001d4:	29 c8                	sub    %ecx,%eax
  2001d6:	89 c1                	mov    %eax,%ecx
  2001d8:	75 d6                	jne    2001b0 <i2A+0x20>
  2001da:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  2001de:	74 20                	je     200200 <i2A+0x70>
  2001e0:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  2001e4:	75 06                	jne    2001ec <i2A+0x5c>
  2001e6:	fe 05 01 17 20 00    	incb   0x201701
  2001ec:	c6 05 02 17 20 00 00 	movb   $0x0,0x201702
  2001f3:	8b 45 0c             	mov    0xc(%ebp),%eax
  2001f6:	89 18                	mov    %ebx,(%eax)
  2001f8:	89 f0                	mov    %esi,%eax
  2001fa:	5a                   	pop    %edx
  2001fb:	5b                   	pop    %ebx
  2001fc:	5e                   	pop    %esi
  2001fd:	5f                   	pop    %edi
  2001fe:	5d                   	pop    %ebp
  2001ff:	c3                   	ret    
  200200:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  200204:	8d 77 02             	lea    0x2(%edi),%esi
  200207:	4b                   	dec    %ebx
  200208:	eb d6                	jmp    2001e0 <i2A+0x50>
  20020a:	66 90                	xchg   %ax,%ax
  20020c:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  200212:	74 0c                	je     200220 <i2A+0x90>
  200214:	f7 d9                	neg    %ecx
  200216:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  20021a:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  20021e:	eb 86                	jmp    2001a6 <i2A+0x16>
  200220:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  200225:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  200229:	eb ef                	jmp    20021a <i2A+0x8a>
  20022b:	90                   	nop

0020022c <i2X>:
  20022c:	55                   	push   %ebp
  20022d:	89 e5                	mov    %esp,%ebp
  20022f:	57                   	push   %edi
  200230:	56                   	push   %esi
  200231:	53                   	push   %ebx
  200232:	8b 55 08             	mov    0x8(%ebp),%edx
  200235:	b9 e1 16 20 00       	mov    $0x2016e1,%ecx
  20023a:	31 c0                	xor    %eax,%eax
  20023c:	40                   	inc    %eax
  20023d:	89 d6                	mov    %edx,%esi
  20023f:	83 e6 0f             	and    $0xf,%esi
  200242:	8d 5e f6             	lea    -0xa(%esi),%ebx
  200245:	89 cf                	mov    %ecx,%edi
  200247:	83 fb 05             	cmp    $0x5,%ebx
  20024a:	77 4c                	ja     200298 <i2X+0x6c>
  20024c:	ff 24 9d ac 04 20 00 	jmp    *0x2004ac(,%ebx,4)
  200253:	90                   	nop
  200254:	c6 01 65             	movb   $0x65,(%ecx)
  200257:	90                   	nop
  200258:	49                   	dec    %ecx
  200259:	c1 ea 04             	shr    $0x4,%edx
  20025c:	75 de                	jne    20023c <i2X+0x10>
  20025e:	c6 05 e2 16 20 00 00 	movb   $0x0,0x2016e2
  200265:	8b 55 0c             	mov    0xc(%ebp),%edx
  200268:	89 3a                	mov    %edi,(%edx)
  20026a:	5b                   	pop    %ebx
  20026b:	5e                   	pop    %esi
  20026c:	5f                   	pop    %edi
  20026d:	5d                   	pop    %ebp
  20026e:	c3                   	ret    
  20026f:	90                   	nop
  200270:	c6 01 64             	movb   $0x64,(%ecx)
  200273:	eb e3                	jmp    200258 <i2X+0x2c>
  200275:	8d 76 00             	lea    0x0(%esi),%esi
  200278:	c6 01 63             	movb   $0x63,(%ecx)
  20027b:	eb db                	jmp    200258 <i2X+0x2c>
  20027d:	8d 76 00             	lea    0x0(%esi),%esi
  200280:	c6 01 62             	movb   $0x62,(%ecx)
  200283:	eb d3                	jmp    200258 <i2X+0x2c>
  200285:	8d 76 00             	lea    0x0(%esi),%esi
  200288:	c6 01 61             	movb   $0x61,(%ecx)
  20028b:	eb cb                	jmp    200258 <i2X+0x2c>
  20028d:	8d 76 00             	lea    0x0(%esi),%esi
  200290:	c6 01 66             	movb   $0x66,(%ecx)
  200293:	eb c3                	jmp    200258 <i2X+0x2c>
  200295:	8d 76 00             	lea    0x0(%esi),%esi
  200298:	8d 5e 30             	lea    0x30(%esi),%ebx
  20029b:	88 19                	mov    %bl,(%ecx)
  20029d:	eb b9                	jmp    200258 <i2X+0x2c>
  20029f:	90                   	nop

002002a0 <memcpy>:
  2002a0:	55                   	push   %ebp
  2002a1:	89 e5                	mov    %esp,%ebp
  2002a3:	57                   	push   %edi
  2002a4:	56                   	push   %esi
  2002a5:	53                   	push   %ebx
  2002a6:	8b 55 08             	mov    0x8(%ebp),%edx
  2002a9:	8b 7d 0c             	mov    0xc(%ebp),%edi
  2002ac:	8b 45 10             	mov    0x10(%ebp),%eax
  2002af:	85 c0                	test   %eax,%eax
  2002b1:	7e 35                	jle    2002e8 <memcpy+0x48>
  2002b3:	8a 1f                	mov    (%edi),%bl
  2002b5:	84 db                	test   %bl,%bl
  2002b7:	74 2f                	je     2002e8 <memcpy+0x48>
  2002b9:	8d 34 02             	lea    (%edx,%eax,1),%esi
  2002bc:	31 c9                	xor    %ecx,%ecx
  2002be:	eb 07                	jmp    2002c7 <memcpy+0x27>
  2002c0:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  2002c3:	84 db                	test   %bl,%bl
  2002c5:	74 15                	je     2002dc <memcpy+0x3c>
  2002c7:	42                   	inc    %edx
  2002c8:	88 5a ff             	mov    %bl,-0x1(%edx)
  2002cb:	41                   	inc    %ecx
  2002cc:	39 f2                	cmp    %esi,%edx
  2002ce:	75 f0                	jne    2002c0 <memcpy+0x20>
  2002d0:	c6 06 00             	movb   $0x0,(%esi)
  2002d3:	29 c8                	sub    %ecx,%eax
  2002d5:	5b                   	pop    %ebx
  2002d6:	5e                   	pop    %esi
  2002d7:	5f                   	pop    %edi
  2002d8:	5d                   	pop    %ebp
  2002d9:	c3                   	ret    
  2002da:	66 90                	xchg   %ax,%ax
  2002dc:	89 d6                	mov    %edx,%esi
  2002de:	c6 06 00             	movb   $0x0,(%esi)
  2002e1:	29 c8                	sub    %ecx,%eax
  2002e3:	5b                   	pop    %ebx
  2002e4:	5e                   	pop    %esi
  2002e5:	5f                   	pop    %edi
  2002e6:	5d                   	pop    %ebp
  2002e7:	c3                   	ret    
  2002e8:	89 d6                	mov    %edx,%esi
  2002ea:	31 c9                	xor    %ecx,%ecx
  2002ec:	eb e2                	jmp    2002d0 <memcpy+0x30>
  2002ee:	66 90                	xchg   %ax,%ax

002002f0 <length_str>:
  2002f0:	55                   	push   %ebp
  2002f1:	89 e5                	mov    %esp,%ebp
  2002f3:	8b 55 08             	mov    0x8(%ebp),%edx
  2002f6:	31 c0                	xor    %eax,%eax
  2002f8:	80 3a 00             	cmpb   $0x0,(%edx)
  2002fb:	74 0a                	je     200307 <length_str+0x17>
  2002fd:	8d 76 00             	lea    0x0(%esi),%esi
  200300:	40                   	inc    %eax
  200301:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  200305:	75 f9                	jne    200300 <length_str+0x10>
  200307:	5d                   	pop    %ebp
  200308:	c3                   	ret    
  200309:	8d 76 00             	lea    0x0(%esi),%esi

0020030c <printf>:
  20030c:	55                   	push   %ebp
  20030d:	89 e5                	mov    %esp,%ebp
  20030f:	57                   	push   %edi
  200310:	56                   	push   %esi
  200311:	53                   	push   %ebx
  200312:	83 ec 24             	sub    $0x24,%esp
  200315:	8b 4d 08             	mov    0x8(%ebp),%ecx
  200318:	8a 11                	mov    (%ecx),%dl
  20031a:	84 d2                	test   %dl,%dl
  20031c:	0f 84 70 01 00 00    	je     200492 <printf+0x186>
  200322:	8d 45 0c             	lea    0xc(%ebp),%eax
  200325:	31 ff                	xor    %edi,%edi
  200327:	eb 18                	jmp    200341 <printf+0x35>
  200329:	8d 76 00             	lea    0x0(%esi),%esi
  20032c:	8a 11                	mov    (%ecx),%dl
  20032e:	89 cb                	mov    %ecx,%ebx
  200330:	88 97 20 17 20 00    	mov    %dl,0x201720(%edi)
  200336:	47                   	inc    %edi
  200337:	8d 4b 01             	lea    0x1(%ebx),%ecx
  20033a:	8a 53 01             	mov    0x1(%ebx),%dl
  20033d:	84 d2                	test   %dl,%dl
  20033f:	74 72                	je     2003b3 <printf+0xa7>
  200341:	80 fa 25             	cmp    $0x25,%dl
  200344:	75 e6                	jne    20032c <printf+0x20>
  200346:	8d 59 01             	lea    0x1(%ecx),%ebx
  200349:	8a 51 01             	mov    0x1(%ecx),%dl
  20034c:	80 fa 64             	cmp    $0x64,%dl
  20034f:	0f 84 db 00 00 00    	je     200430 <printf+0x124>
  200355:	0f 8e 1d 01 00 00    	jle    200478 <printf+0x16c>
  20035b:	80 fa 73             	cmp    $0x73,%dl
  20035e:	0f 84 9c 00 00 00    	je     200400 <printf+0xf4>
  200364:	80 fa 78             	cmp    $0x78,%dl
  200367:	75 c7                	jne    200330 <printf+0x24>
  200369:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200370:	8d 70 04             	lea    0x4(%eax),%esi
  200373:	89 75 d0             	mov    %esi,-0x30(%ebp)
  200376:	8d 75 f0             	lea    -0x10(%ebp),%esi
  200379:	56                   	push   %esi
  20037a:	ff 30                	pushl  (%eax)
  20037c:	e8 ab fe ff ff       	call   20022c <i2X>
  200381:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200384:	8d b7 20 17 20 00    	lea    0x201720(%edi),%esi
  20038a:	8a 11                	mov    (%ecx),%dl
  20038c:	83 c4 08             	add    $0x8,%esp
  20038f:	31 c0                	xor    %eax,%eax
  200391:	84 d2                	test   %dl,%dl
  200393:	74 0f                	je     2003a4 <printf+0x98>
  200395:	8d 76 00             	lea    0x0(%esi),%esi
  200398:	40                   	inc    %eax
  200399:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  20039d:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  2003a0:	84 d2                	test   %dl,%dl
  2003a2:	75 f4                	jne    200398 <printf+0x8c>
  2003a4:	01 c7                	add    %eax,%edi
  2003a6:	8b 45 d0             	mov    -0x30(%ebp),%eax
  2003a9:	8d 4b 01             	lea    0x1(%ebx),%ecx
  2003ac:	8a 53 01             	mov    0x1(%ebx),%dl
  2003af:	84 d2                	test   %dl,%dl
  2003b1:	75 8e                	jne    200341 <printf+0x35>
  2003b3:	8d 47 01             	lea    0x1(%edi),%eax
  2003b6:	c6 87 20 17 20 00 00 	movb   $0x0,0x201720(%edi)
  2003bd:	c7 45 f0 04 00 00 00 	movl   $0x4,-0x10(%ebp)
  2003c4:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  2003cb:	c7 45 e8 20 17 20 00 	movl   $0x201720,-0x18(%ebp)
  2003d2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  2003d5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  2003dc:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  2003e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2003e6:	8b 5d ec             	mov    -0x14(%ebp),%ebx
  2003e9:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  2003ec:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  2003ef:	8b 7d e0             	mov    -0x20(%ebp),%edi
  2003f2:	8b 75 dc             	mov    -0x24(%ebp),%esi
  2003f5:	cd 80                	int    $0x80
  2003f7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  2003fa:	5b                   	pop    %ebx
  2003fb:	5e                   	pop    %esi
  2003fc:	5f                   	pop    %edi
  2003fd:	5d                   	pop    %ebp
  2003fe:	c3                   	ret    
  2003ff:	90                   	nop
  200400:	8d 70 04             	lea    0x4(%eax),%esi
  200403:	89 75 d0             	mov    %esi,-0x30(%ebp)
  200406:	8b 08                	mov    (%eax),%ecx
  200408:	8d b7 20 17 20 00    	lea    0x201720(%edi),%esi
  20040e:	8a 11                	mov    (%ecx),%dl
  200410:	31 c0                	xor    %eax,%eax
  200412:	84 d2                	test   %dl,%dl
  200414:	74 8e                	je     2003a4 <printf+0x98>
  200416:	66 90                	xchg   %ax,%ax
  200418:	40                   	inc    %eax
  200419:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  20041d:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  200420:	84 d2                	test   %dl,%dl
  200422:	75 f4                	jne    200418 <printf+0x10c>
  200424:	01 c7                	add    %eax,%edi
  200426:	8b 45 d0             	mov    -0x30(%ebp),%eax
  200429:	e9 7b ff ff ff       	jmp    2003a9 <printf+0x9d>
  20042e:	66 90                	xchg   %ax,%ax
  200430:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200437:	8d 70 04             	lea    0x4(%eax),%esi
  20043a:	89 75 d0             	mov    %esi,-0x30(%ebp)
  20043d:	8d 75 f0             	lea    -0x10(%ebp),%esi
  200440:	56                   	push   %esi
  200441:	ff 30                	pushl  (%eax)
  200443:	e8 48 fd ff ff       	call   200190 <i2A>
  200448:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  20044b:	8d b7 20 17 20 00    	lea    0x201720(%edi),%esi
  200451:	8a 11                	mov    (%ecx),%dl
  200453:	83 c4 08             	add    $0x8,%esp
  200456:	31 c0                	xor    %eax,%eax
  200458:	84 d2                	test   %dl,%dl
  20045a:	0f 84 44 ff ff ff    	je     2003a4 <printf+0x98>
  200460:	40                   	inc    %eax
  200461:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  200465:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  200468:	84 d2                	test   %dl,%dl
  20046a:	75 f4                	jne    200460 <printf+0x154>
  20046c:	01 c7                	add    %eax,%edi
  20046e:	8b 45 d0             	mov    -0x30(%ebp),%eax
  200471:	e9 33 ff ff ff       	jmp    2003a9 <printf+0x9d>
  200476:	66 90                	xchg   %ax,%ax
  200478:	80 fa 63             	cmp    $0x63,%dl
  20047b:	0f 85 af fe ff ff    	jne    200330 <printf+0x24>
  200481:	8b 10                	mov    (%eax),%edx
  200483:	88 97 20 17 20 00    	mov    %dl,0x201720(%edi)
  200489:	83 c0 04             	add    $0x4,%eax
  20048c:	47                   	inc    %edi
  20048d:	e9 a5 fe ff ff       	jmp    200337 <printf+0x2b>
  200492:	b8 01 00 00 00       	mov    $0x1,%eax
  200497:	31 ff                	xor    %edi,%edi
  200499:	e9 18 ff ff ff       	jmp    2003b6 <printf+0xaa>
