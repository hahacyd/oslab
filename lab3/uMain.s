
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	53                   	push   %ebx
  200004:	50                   	push   %eax
  200005:	e8 72 00 00 00       	call   20007c <fork>
  20000a:	89 c3                	mov    %eax,%ebx
  20000c:	85 c0                	test   %eax,%eax
  20000e:	75 28                	jne    200038 <uEntry+0x38>
  200010:	83 ec 0c             	sub    $0xc,%esp
  200013:	68 04 05 20 00       	push   $0x200504
  200018:	e8 4f 03 00 00       	call   20036c <printf>
  20001d:	83 c4 10             	add    $0x10,%esp
  200020:	83 ec 08             	sub    $0x8,%esp
  200023:	53                   	push   %ebx
  200024:	68 1d 05 20 00       	push   $0x20051d
  200029:	e8 3e 03 00 00       	call   20036c <printf>
  20002e:	e8 e1 00 00 00       	call   200114 <exit>
  200033:	83 c4 10             	add    $0x10,%esp
  200036:	eb fe                	jmp    200036 <uEntry+0x36>
  200038:	83 ec 0c             	sub    $0xc,%esp
  20003b:	68 80 00 00 00       	push   $0x80
  200040:	e8 83 00 00 00       	call   2000c8 <sleep>
  200045:	c7 04 24 10 05 20 00 	movl   $0x200510,(%esp)
  20004c:	e8 1b 03 00 00       	call   20036c <printf>
  200051:	83 c4 10             	add    $0x10,%esp
  200054:	eb ca                	jmp    200020 <uEntry+0x20>
  200056:	66 90                	xchg   %ax,%ax

00200058 <syscall>:
  200058:	55                   	push   %ebp
  200059:	89 e5                	mov    %esp,%ebp
  20005b:	83 ec 10             	sub    $0x10,%esp
  20005e:	8b 45 08             	mov    0x8(%ebp),%eax
  200061:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  200064:	8b 4d 10             	mov    0x10(%ebp),%ecx
  200067:	8b 55 14             	mov    0x14(%ebp),%edx
  20006a:	8b 7d 18             	mov    0x18(%ebp),%edi
  20006d:	8b 75 1c             	mov    0x1c(%ebp),%esi
  200070:	cd 80                	int    $0x80
  200072:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200075:	8b 45 fc             	mov    -0x4(%ebp),%eax
  200078:	c9                   	leave  
  200079:	c3                   	ret    
  20007a:	66 90                	xchg   %ax,%ax

0020007c <fork>:
  20007c:	55                   	push   %ebp
  20007d:	89 e5                	mov    %esp,%ebp
  20007f:	83 ec 20             	sub    $0x20,%esp
  200082:	c7 45 e4 02 00 00 00 	movl   $0x2,-0x1c(%ebp)
  200089:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  200090:	c7 45 ec 27 05 20 00 	movl   $0x200527,-0x14(%ebp)
  200097:	c7 45 f0 0d 00 00 00 	movl   $0xd,-0x10(%ebp)
  20009e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2000a5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2000ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2000af:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2000b2:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2000b5:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2000b8:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2000bb:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2000be:	cd 80                	int    $0x80
  2000c0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2000c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2000c6:	c9                   	leave  
  2000c7:	c3                   	ret    

002000c8 <sleep>:
  2000c8:	55                   	push   %ebp
  2000c9:	89 e5                	mov    %esp,%ebp
  2000cb:	83 ec 20             	sub    $0x20,%esp
  2000ce:	c7 45 e4 e6 00 00 00 	movl   $0xe6,-0x1c(%ebp)
  2000d5:	8b 45 08             	mov    0x8(%ebp),%eax
  2000d8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  2000db:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  2000e2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2000e9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2000f0:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2000f7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2000fa:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2000fd:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200100:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200103:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200106:	8b 75 f8             	mov    -0x8(%ebp),%esi
  200109:	cd 80                	int    $0x80
  20010b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20010e:	31 c0                	xor    %eax,%eax
  200110:	c9                   	leave  
  200111:	c3                   	ret    
  200112:	66 90                	xchg   %ax,%ax

00200114 <exit>:
  200114:	55                   	push   %ebp
  200115:	89 e5                	mov    %esp,%ebp
  200117:	83 ec 20             	sub    $0x20,%esp
  20011a:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  200121:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  200128:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  20012f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200136:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20013d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200144:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  200147:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  20014a:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  20014d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200150:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200153:	8b 75 f8             	mov    -0x8(%ebp),%esi
  200156:	cd 80                	int    $0x80
  200158:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20015b:	31 c0                	xor    %eax,%eax
  20015d:	c9                   	leave  
  20015e:	c3                   	ret    
  20015f:	90                   	nop

00200160 <fs_write>:
  200160:	55                   	push   %ebp
  200161:	89 e5                	mov    %esp,%ebp
  200163:	83 ec 20             	sub    $0x20,%esp
  200166:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  20016d:	8b 45 08             	mov    0x8(%ebp),%eax
  200170:	89 45 e8             	mov    %eax,-0x18(%ebp)
  200173:	8b 45 0c             	mov    0xc(%ebp),%eax
  200176:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200179:	8b 45 10             	mov    0x10(%ebp),%eax
  20017c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20017f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200186:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  20018d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  200190:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  200193:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200196:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200199:	8b 7d f4             	mov    -0xc(%ebp),%edi
  20019c:	8b 75 f8             	mov    -0x8(%ebp),%esi
  20019f:	cd 80                	int    $0x80
  2001a1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2001a4:	c9                   	leave  
  2001a5:	c3                   	ret    
  2001a6:	66 90                	xchg   %ax,%ax

002001a8 <putchar_user>:
  2001a8:	55                   	push   %ebp
  2001a9:	89 e5                	mov    %esp,%ebp
  2001ab:	83 ec 24             	sub    $0x24,%esp
  2001ae:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  2001b5:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  2001bc:	8d 45 dc             	lea    -0x24(%ebp),%eax
  2001bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2001c2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  2001c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2001d0:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2001d7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2001da:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2001dd:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2001e0:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2001e3:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2001e6:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2001e9:	cd 80                	int    $0x80
  2001eb:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2001ee:	c9                   	leave  
  2001ef:	c3                   	ret    

002001f0 <i2A>:
  2001f0:	55                   	push   %ebp
  2001f1:	89 e5                	mov    %esp,%ebp
  2001f3:	57                   	push   %edi
  2001f4:	56                   	push   %esi
  2001f5:	53                   	push   %ebx
  2001f6:	51                   	push   %ecx
  2001f7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2001fa:	85 c9                	test   %ecx,%ecx
  2001fc:	78 6e                	js     20026c <i2A+0x7c>
  2001fe:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  200202:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  200206:	bb 82 17 20 00       	mov    $0x201782,%ebx
  20020b:	31 ff                	xor    %edi,%edi
  20020d:	eb 03                	jmp    200212 <i2A+0x22>
  20020f:	90                   	nop
  200210:	89 f7                	mov    %esi,%edi
  200212:	4b                   	dec    %ebx
  200213:	89 c8                	mov    %ecx,%eax
  200215:	be 0a 00 00 00       	mov    $0xa,%esi
  20021a:	99                   	cltd   
  20021b:	f7 fe                	idiv   %esi
  20021d:	83 c2 30             	add    $0x30,%edx
  200220:	88 13                	mov    %dl,(%ebx)
  200222:	8d 77 01             	lea    0x1(%edi),%esi
  200225:	b8 67 66 66 66       	mov    $0x66666667,%eax
  20022a:	f7 e9                	imul   %ecx
  20022c:	89 d0                	mov    %edx,%eax
  20022e:	c1 f8 02             	sar    $0x2,%eax
  200231:	c1 f9 1f             	sar    $0x1f,%ecx
  200234:	29 c8                	sub    %ecx,%eax
  200236:	89 c1                	mov    %eax,%ecx
  200238:	75 d6                	jne    200210 <i2A+0x20>
  20023a:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  20023e:	74 20                	je     200260 <i2A+0x70>
  200240:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  200244:	75 06                	jne    20024c <i2A+0x5c>
  200246:	fe 05 81 17 20 00    	incb   0x201781
  20024c:	c6 05 82 17 20 00 00 	movb   $0x0,0x201782
  200253:	8b 45 0c             	mov    0xc(%ebp),%eax
  200256:	89 18                	mov    %ebx,(%eax)
  200258:	89 f0                	mov    %esi,%eax
  20025a:	5a                   	pop    %edx
  20025b:	5b                   	pop    %ebx
  20025c:	5e                   	pop    %esi
  20025d:	5f                   	pop    %edi
  20025e:	5d                   	pop    %ebp
  20025f:	c3                   	ret    
  200260:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  200264:	8d 77 02             	lea    0x2(%edi),%esi
  200267:	4b                   	dec    %ebx
  200268:	eb d6                	jmp    200240 <i2A+0x50>
  20026a:	66 90                	xchg   %ax,%ax
  20026c:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  200272:	74 0c                	je     200280 <i2A+0x90>
  200274:	f7 d9                	neg    %ecx
  200276:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  20027a:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  20027e:	eb 86                	jmp    200206 <i2A+0x16>
  200280:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  200285:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  200289:	eb ef                	jmp    20027a <i2A+0x8a>
  20028b:	90                   	nop

0020028c <i2X>:
  20028c:	55                   	push   %ebp
  20028d:	89 e5                	mov    %esp,%ebp
  20028f:	57                   	push   %edi
  200290:	56                   	push   %esi
  200291:	53                   	push   %ebx
  200292:	8b 55 08             	mov    0x8(%ebp),%edx
  200295:	b9 61 17 20 00       	mov    $0x201761,%ecx
  20029a:	31 c0                	xor    %eax,%eax
  20029c:	40                   	inc    %eax
  20029d:	89 d6                	mov    %edx,%esi
  20029f:	83 e6 0f             	and    $0xf,%esi
  2002a2:	8d 5e f6             	lea    -0xa(%esi),%ebx
  2002a5:	89 cf                	mov    %ecx,%edi
  2002a7:	83 fb 05             	cmp    $0x5,%ebx
  2002aa:	77 4c                	ja     2002f8 <i2X+0x6c>
  2002ac:	ff 24 9d 30 05 20 00 	jmp    *0x200530(,%ebx,4)
  2002b3:	90                   	nop
  2002b4:	c6 01 65             	movb   $0x65,(%ecx)
  2002b7:	90                   	nop
  2002b8:	49                   	dec    %ecx
  2002b9:	c1 ea 04             	shr    $0x4,%edx
  2002bc:	75 de                	jne    20029c <i2X+0x10>
  2002be:	c6 05 62 17 20 00 00 	movb   $0x0,0x201762
  2002c5:	8b 55 0c             	mov    0xc(%ebp),%edx
  2002c8:	89 3a                	mov    %edi,(%edx)
  2002ca:	5b                   	pop    %ebx
  2002cb:	5e                   	pop    %esi
  2002cc:	5f                   	pop    %edi
  2002cd:	5d                   	pop    %ebp
  2002ce:	c3                   	ret    
  2002cf:	90                   	nop
  2002d0:	c6 01 64             	movb   $0x64,(%ecx)
  2002d3:	eb e3                	jmp    2002b8 <i2X+0x2c>
  2002d5:	8d 76 00             	lea    0x0(%esi),%esi
  2002d8:	c6 01 63             	movb   $0x63,(%ecx)
  2002db:	eb db                	jmp    2002b8 <i2X+0x2c>
  2002dd:	8d 76 00             	lea    0x0(%esi),%esi
  2002e0:	c6 01 62             	movb   $0x62,(%ecx)
  2002e3:	eb d3                	jmp    2002b8 <i2X+0x2c>
  2002e5:	8d 76 00             	lea    0x0(%esi),%esi
  2002e8:	c6 01 61             	movb   $0x61,(%ecx)
  2002eb:	eb cb                	jmp    2002b8 <i2X+0x2c>
  2002ed:	8d 76 00             	lea    0x0(%esi),%esi
  2002f0:	c6 01 66             	movb   $0x66,(%ecx)
  2002f3:	eb c3                	jmp    2002b8 <i2X+0x2c>
  2002f5:	8d 76 00             	lea    0x0(%esi),%esi
  2002f8:	8d 5e 30             	lea    0x30(%esi),%ebx
  2002fb:	88 19                	mov    %bl,(%ecx)
  2002fd:	eb b9                	jmp    2002b8 <i2X+0x2c>
  2002ff:	90                   	nop

00200300 <memcpy>:
  200300:	55                   	push   %ebp
  200301:	89 e5                	mov    %esp,%ebp
  200303:	57                   	push   %edi
  200304:	56                   	push   %esi
  200305:	53                   	push   %ebx
  200306:	8b 55 08             	mov    0x8(%ebp),%edx
  200309:	8b 7d 0c             	mov    0xc(%ebp),%edi
  20030c:	8b 45 10             	mov    0x10(%ebp),%eax
  20030f:	85 c0                	test   %eax,%eax
  200311:	7e 35                	jle    200348 <memcpy+0x48>
  200313:	8a 1f                	mov    (%edi),%bl
  200315:	84 db                	test   %bl,%bl
  200317:	74 2f                	je     200348 <memcpy+0x48>
  200319:	8d 34 02             	lea    (%edx,%eax,1),%esi
  20031c:	31 c9                	xor    %ecx,%ecx
  20031e:	eb 07                	jmp    200327 <memcpy+0x27>
  200320:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  200323:	84 db                	test   %bl,%bl
  200325:	74 15                	je     20033c <memcpy+0x3c>
  200327:	42                   	inc    %edx
  200328:	88 5a ff             	mov    %bl,-0x1(%edx)
  20032b:	41                   	inc    %ecx
  20032c:	39 f2                	cmp    %esi,%edx
  20032e:	75 f0                	jne    200320 <memcpy+0x20>
  200330:	c6 06 00             	movb   $0x0,(%esi)
  200333:	29 c8                	sub    %ecx,%eax
  200335:	5b                   	pop    %ebx
  200336:	5e                   	pop    %esi
  200337:	5f                   	pop    %edi
  200338:	5d                   	pop    %ebp
  200339:	c3                   	ret    
  20033a:	66 90                	xchg   %ax,%ax
  20033c:	89 d6                	mov    %edx,%esi
  20033e:	c6 06 00             	movb   $0x0,(%esi)
  200341:	29 c8                	sub    %ecx,%eax
  200343:	5b                   	pop    %ebx
  200344:	5e                   	pop    %esi
  200345:	5f                   	pop    %edi
  200346:	5d                   	pop    %ebp
  200347:	c3                   	ret    
  200348:	89 d6                	mov    %edx,%esi
  20034a:	31 c9                	xor    %ecx,%ecx
  20034c:	eb e2                	jmp    200330 <memcpy+0x30>
  20034e:	66 90                	xchg   %ax,%ax

00200350 <length_str>:
  200350:	55                   	push   %ebp
  200351:	89 e5                	mov    %esp,%ebp
  200353:	8b 55 08             	mov    0x8(%ebp),%edx
  200356:	31 c0                	xor    %eax,%eax
  200358:	80 3a 00             	cmpb   $0x0,(%edx)
  20035b:	74 0a                	je     200367 <length_str+0x17>
  20035d:	8d 76 00             	lea    0x0(%esi),%esi
  200360:	40                   	inc    %eax
  200361:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  200365:	75 f9                	jne    200360 <length_str+0x10>
  200367:	5d                   	pop    %ebp
  200368:	c3                   	ret    
  200369:	8d 76 00             	lea    0x0(%esi),%esi

0020036c <printf>:
  20036c:	55                   	push   %ebp
  20036d:	89 e5                	mov    %esp,%ebp
  20036f:	57                   	push   %edi
  200370:	56                   	push   %esi
  200371:	53                   	push   %ebx
  200372:	83 ec 24             	sub    $0x24,%esp
  200375:	8b 4d 08             	mov    0x8(%ebp),%ecx
  200378:	8a 11                	mov    (%ecx),%dl
  20037a:	84 d2                	test   %dl,%dl
  20037c:	0f 84 74 01 00 00    	je     2004f6 <printf+0x18a>
  200382:	8d 45 0c             	lea    0xc(%ebp),%eax
  200385:	31 ff                	xor    %edi,%edi
  200387:	eb 18                	jmp    2003a1 <printf+0x35>
  200389:	8d 76 00             	lea    0x0(%esi),%esi
  20038c:	8a 11                	mov    (%ecx),%dl
  20038e:	89 cb                	mov    %ecx,%ebx
  200390:	88 97 a0 17 20 00    	mov    %dl,0x2017a0(%edi)
  200396:	47                   	inc    %edi
  200397:	8d 4b 01             	lea    0x1(%ebx),%ecx
  20039a:	8a 53 01             	mov    0x1(%ebx),%dl
  20039d:	84 d2                	test   %dl,%dl
  20039f:	74 72                	je     200413 <printf+0xa7>
  2003a1:	80 fa 25             	cmp    $0x25,%dl
  2003a4:	75 e6                	jne    20038c <printf+0x20>
  2003a6:	8d 59 01             	lea    0x1(%ecx),%ebx
  2003a9:	8a 51 01             	mov    0x1(%ecx),%dl
  2003ac:	80 fa 64             	cmp    $0x64,%dl
  2003af:	0f 84 df 00 00 00    	je     200494 <printf+0x128>
  2003b5:	0f 8e 21 01 00 00    	jle    2004dc <printf+0x170>
  2003bb:	80 fa 73             	cmp    $0x73,%dl
  2003be:	0f 84 a0 00 00 00    	je     200464 <printf+0xf8>
  2003c4:	80 fa 78             	cmp    $0x78,%dl
  2003c7:	75 c7                	jne    200390 <printf+0x24>
  2003c9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2003d0:	8d 70 04             	lea    0x4(%eax),%esi
  2003d3:	89 75 d0             	mov    %esi,-0x30(%ebp)
  2003d6:	8d 75 f0             	lea    -0x10(%ebp),%esi
  2003d9:	56                   	push   %esi
  2003da:	ff 30                	pushl  (%eax)
  2003dc:	e8 ab fe ff ff       	call   20028c <i2X>
  2003e1:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2003e4:	8d b7 a0 17 20 00    	lea    0x2017a0(%edi),%esi
  2003ea:	8a 11                	mov    (%ecx),%dl
  2003ec:	83 c4 08             	add    $0x8,%esp
  2003ef:	31 c0                	xor    %eax,%eax
  2003f1:	84 d2                	test   %dl,%dl
  2003f3:	74 0f                	je     200404 <printf+0x98>
  2003f5:	8d 76 00             	lea    0x0(%esi),%esi
  2003f8:	40                   	inc    %eax
  2003f9:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  2003fd:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  200400:	84 d2                	test   %dl,%dl
  200402:	75 f4                	jne    2003f8 <printf+0x8c>
  200404:	01 c7                	add    %eax,%edi
  200406:	8b 45 d0             	mov    -0x30(%ebp),%eax
  200409:	8d 4b 01             	lea    0x1(%ebx),%ecx
  20040c:	8a 53 01             	mov    0x1(%ebx),%dl
  20040f:	84 d2                	test   %dl,%dl
  200411:	75 8e                	jne    2003a1 <printf+0x35>
  200413:	8d 47 01             	lea    0x1(%edi),%eax
  200416:	c6 87 a0 17 20 00 00 	movb   $0x0,0x2017a0(%edi)
  20041d:	c7 45 ec 04 00 00 00 	movl   $0x4,-0x14(%ebp)
  200424:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  20042b:	c7 45 e4 a0 17 20 00 	movl   $0x2017a0,-0x1c(%ebp)
  200432:	89 45 e0             	mov    %eax,-0x20(%ebp)
  200435:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  20043c:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  200443:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200446:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  200449:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  20044c:	8b 55 e0             	mov    -0x20(%ebp),%edx
  20044f:	8b 7d dc             	mov    -0x24(%ebp),%edi
  200452:	8b 75 d8             	mov    -0x28(%ebp),%esi
  200455:	cd 80                	int    $0x80
  200457:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20045a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  20045d:	5b                   	pop    %ebx
  20045e:	5e                   	pop    %esi
  20045f:	5f                   	pop    %edi
  200460:	5d                   	pop    %ebp
  200461:	c3                   	ret    
  200462:	66 90                	xchg   %ax,%ax
  200464:	8d 70 04             	lea    0x4(%eax),%esi
  200467:	89 75 d0             	mov    %esi,-0x30(%ebp)
  20046a:	8b 08                	mov    (%eax),%ecx
  20046c:	8d b7 a0 17 20 00    	lea    0x2017a0(%edi),%esi
  200472:	8a 11                	mov    (%ecx),%dl
  200474:	31 c0                	xor    %eax,%eax
  200476:	84 d2                	test   %dl,%dl
  200478:	74 8a                	je     200404 <printf+0x98>
  20047a:	66 90                	xchg   %ax,%ax
  20047c:	40                   	inc    %eax
  20047d:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  200481:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  200484:	84 d2                	test   %dl,%dl
  200486:	75 f4                	jne    20047c <printf+0x110>
  200488:	01 c7                	add    %eax,%edi
  20048a:	8b 45 d0             	mov    -0x30(%ebp),%eax
  20048d:	e9 77 ff ff ff       	jmp    200409 <printf+0x9d>
  200492:	66 90                	xchg   %ax,%ax
  200494:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  20049b:	8d 70 04             	lea    0x4(%eax),%esi
  20049e:	89 75 d0             	mov    %esi,-0x30(%ebp)
  2004a1:	8d 75 f0             	lea    -0x10(%ebp),%esi
  2004a4:	56                   	push   %esi
  2004a5:	ff 30                	pushl  (%eax)
  2004a7:	e8 44 fd ff ff       	call   2001f0 <i2A>
  2004ac:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2004af:	8d b7 a0 17 20 00    	lea    0x2017a0(%edi),%esi
  2004b5:	8a 11                	mov    (%ecx),%dl
  2004b7:	83 c4 08             	add    $0x8,%esp
  2004ba:	31 c0                	xor    %eax,%eax
  2004bc:	84 d2                	test   %dl,%dl
  2004be:	0f 84 40 ff ff ff    	je     200404 <printf+0x98>
  2004c4:	40                   	inc    %eax
  2004c5:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  2004c9:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  2004cc:	84 d2                	test   %dl,%dl
  2004ce:	75 f4                	jne    2004c4 <printf+0x158>
  2004d0:	01 c7                	add    %eax,%edi
  2004d2:	8b 45 d0             	mov    -0x30(%ebp),%eax
  2004d5:	e9 2f ff ff ff       	jmp    200409 <printf+0x9d>
  2004da:	66 90                	xchg   %ax,%ax
  2004dc:	80 fa 63             	cmp    $0x63,%dl
  2004df:	0f 85 ab fe ff ff    	jne    200390 <printf+0x24>
  2004e5:	8b 10                	mov    (%eax),%edx
  2004e7:	88 97 a0 17 20 00    	mov    %dl,0x2017a0(%edi)
  2004ed:	83 c0 04             	add    $0x4,%eax
  2004f0:	47                   	inc    %edi
  2004f1:	e9 a1 fe ff ff       	jmp    200397 <printf+0x2b>
  2004f6:	b8 01 00 00 00       	mov    $0x1,%eax
  2004fb:	31 ff                	xor    %edi,%edi
  2004fd:	e9 14 ff ff ff       	jmp    200416 <printf+0xaa>
