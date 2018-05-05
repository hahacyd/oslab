
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	53                   	push   %ebx
  200004:	83 ec 10             	sub    $0x10,%esp
  200007:	68 a1 c1 85 00       	push   $0x85c1a1
  20000c:	e8 eb 03 00 00       	call   2003fc <printd>
  200011:	58                   	pop    %eax
  200012:	5a                   	pop    %edx
  200013:	6a 0c                	push   $0xc
  200015:	68 68 06 20 00       	push   $0x200668
  20001a:	e8 25 05 00 00       	call   200544 <printf>
  20001f:	e8 20 01 00 00       	call   200144 <exit>
  200024:	e8 83 00 00 00       	call   2000ac <fork>
  200029:	89 c3                	mov    %eax,%ebx
  20002b:	83 c4 10             	add    $0x10,%esp
  20002e:	85 c0                	test   %eax,%eax
  200030:	75 38                	jne    20006a <uEntry+0x6a>
  200032:	83 ec 0c             	sub    $0xc,%esp
  200035:	68 6b 06 20 00       	push   $0x20066b
  20003a:	e8 05 05 00 00       	call   200544 <printf>
  20003f:	83 c4 10             	add    $0x10,%esp
  200042:	83 ec 08             	sub    $0x8,%esp
  200045:	53                   	push   %ebx
  200046:	68 84 06 20 00       	push   $0x200684
  20004b:	e8 f4 04 00 00       	call   200544 <printf>
  200050:	e8 ef 00 00 00       	call   200144 <exit>
  200055:	83 c4 10             	add    $0x10,%esp
  200058:	83 ec 0c             	sub    $0xc,%esp
  20005b:	68 8e 06 20 00       	push   $0x20068e
  200060:	e8 df 04 00 00       	call   200544 <printf>
  200065:	83 c4 10             	add    $0x10,%esp
  200068:	eb ee                	jmp    200058 <uEntry+0x58>
  20006a:	83 ec 0c             	sub    $0xc,%esp
  20006d:	6a 25                	push   $0x25
  20006f:	e8 84 00 00 00       	call   2000f8 <sleep>
  200074:	c7 04 24 77 06 20 00 	movl   $0x200677,(%esp)
  20007b:	e8 c4 04 00 00       	call   200544 <printf>
  200080:	83 c4 10             	add    $0x10,%esp
  200083:	eb bd                	jmp    200042 <uEntry+0x42>
  200085:	66 90                	xchg   %ax,%ax
  200087:	90                   	nop

00200088 <syscall>:
  200088:	55                   	push   %ebp
  200089:	89 e5                	mov    %esp,%ebp
  20008b:	83 ec 10             	sub    $0x10,%esp
  20008e:	8b 45 08             	mov    0x8(%ebp),%eax
  200091:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  200094:	8b 4d 10             	mov    0x10(%ebp),%ecx
  200097:	8b 55 14             	mov    0x14(%ebp),%edx
  20009a:	8b 7d 18             	mov    0x18(%ebp),%edi
  20009d:	8b 75 1c             	mov    0x1c(%ebp),%esi
  2000a0:	cd 80                	int    $0x80
  2000a2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2000a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2000a8:	c9                   	leave  
  2000a9:	c3                   	ret    
  2000aa:	66 90                	xchg   %ax,%ax

002000ac <fork>:
  2000ac:	55                   	push   %ebp
  2000ad:	89 e5                	mov    %esp,%ebp
  2000af:	83 ec 20             	sub    $0x20,%esp
  2000b2:	c7 45 e4 02 00 00 00 	movl   $0x2,-0x1c(%ebp)
  2000b9:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  2000c0:	c7 45 ec 9d 06 20 00 	movl   $0x20069d,-0x14(%ebp)
  2000c7:	c7 45 f0 0d 00 00 00 	movl   $0xd,-0x10(%ebp)
  2000ce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2000d5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2000dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2000df:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2000e2:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2000e5:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2000e8:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2000eb:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2000ee:	cd 80                	int    $0x80
  2000f0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2000f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2000f6:	c9                   	leave  
  2000f7:	c3                   	ret    

002000f8 <sleep>:
  2000f8:	55                   	push   %ebp
  2000f9:	89 e5                	mov    %esp,%ebp
  2000fb:	83 ec 20             	sub    $0x20,%esp
  2000fe:	c7 45 e4 e6 00 00 00 	movl   $0xe6,-0x1c(%ebp)
  200105:	8b 45 08             	mov    0x8(%ebp),%eax
  200108:	89 45 e8             	mov    %eax,-0x18(%ebp)
  20010b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  200112:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200119:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200120:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200127:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  20012a:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  20012d:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200130:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200133:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200136:	8b 75 f8             	mov    -0x8(%ebp),%esi
  200139:	cd 80                	int    $0x80
  20013b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20013e:	31 c0                	xor    %eax,%eax
  200140:	c9                   	leave  
  200141:	c3                   	ret    
  200142:	66 90                	xchg   %ax,%ax

00200144 <exit>:
  200144:	55                   	push   %ebp
  200145:	89 e5                	mov    %esp,%ebp
  200147:	83 ec 20             	sub    $0x20,%esp
  20014a:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  200151:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  200158:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  20015f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200166:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20016d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200174:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  200177:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  20017a:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  20017d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200180:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200183:	8b 75 f8             	mov    -0x8(%ebp),%esi
  200186:	cd 80                	int    $0x80
  200188:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20018b:	31 c0                	xor    %eax,%eax
  20018d:	c9                   	leave  
  20018e:	c3                   	ret    
  20018f:	90                   	nop

00200190 <fs_write>:
  200190:	55                   	push   %ebp
  200191:	89 e5                	mov    %esp,%ebp
  200193:	83 ec 20             	sub    $0x20,%esp
  200196:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  20019d:	8b 45 08             	mov    0x8(%ebp),%eax
  2001a0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  2001a3:	8b 45 0c             	mov    0xc(%ebp),%eax
  2001a6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2001a9:	8b 45 10             	mov    0x10(%ebp),%eax
  2001ac:	89 45 f0             	mov    %eax,-0x10(%ebp)
  2001af:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2001b6:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2001bd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2001c0:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2001c3:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2001c6:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2001c9:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2001cc:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2001cf:	cd 80                	int    $0x80
  2001d1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2001d4:	c9                   	leave  
  2001d5:	c3                   	ret    
  2001d6:	66 90                	xchg   %ax,%ax

002001d8 <putchar_user>:
  2001d8:	55                   	push   %ebp
  2001d9:	89 e5                	mov    %esp,%ebp
  2001db:	83 ec 24             	sub    $0x24,%esp
  2001de:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  2001e5:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  2001ec:	8d 45 dc             	lea    -0x24(%ebp),%eax
  2001ef:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2001f2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  2001f9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200200:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200207:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  20020a:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  20020d:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200210:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200213:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200216:	8b 75 f8             	mov    -0x8(%ebp),%esi
  200219:	cd 80                	int    $0x80
  20021b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20021e:	c9                   	leave  
  20021f:	c3                   	ret    

00200220 <i2A>:
  200220:	55                   	push   %ebp
  200221:	89 e5                	mov    %esp,%ebp
  200223:	57                   	push   %edi
  200224:	56                   	push   %esi
  200225:	53                   	push   %ebx
  200226:	83 ec 24             	sub    $0x24,%esp
  200229:	8b 4d 08             	mov    0x8(%ebp),%ecx
  20022c:	85 c9                	test   %ecx,%ecx
  20022e:	78 48                	js     200278 <i2A+0x58>
  200230:	c6 45 d3 00          	movb   $0x0,-0x2d(%ebp)
  200234:	31 f6                	xor    %esi,%esi
  200236:	eb 02                	jmp    20023a <i2A+0x1a>
  200238:	89 fe                	mov    %edi,%esi
  20023a:	bb 1d 00 00 00       	mov    $0x1d,%ebx
  20023f:	29 f3                	sub    %esi,%ebx
  200241:	8d 45 d5             	lea    -0x2b(%ebp),%eax
  200244:	01 c3                	add    %eax,%ebx
  200246:	8d 7e 01             	lea    0x1(%esi),%edi
  200249:	b8 67 66 66 66       	mov    $0x66666667,%eax
  20024e:	f7 e9                	imul   %ecx
  200250:	89 d0                	mov    %edx,%eax
  200252:	c1 f8 02             	sar    $0x2,%eax
  200255:	c1 f9 1f             	sar    $0x1f,%ecx
  200258:	29 c8                	sub    %ecx,%eax
  20025a:	89 c1                	mov    %eax,%ecx
  20025c:	75 da                	jne    200238 <i2A+0x18>
  20025e:	80 7d d3 01          	cmpb   $0x1,-0x2d(%ebp)
  200262:	75 04                	jne    200268 <i2A+0x48>
  200264:	4b                   	dec    %ebx
  200265:	8d 7e 02             	lea    0x2(%esi),%edi
  200268:	8b 45 0c             	mov    0xc(%ebp),%eax
  20026b:	89 18                	mov    %ebx,(%eax)
  20026d:	89 f8                	mov    %edi,%eax
  20026f:	83 c4 24             	add    $0x24,%esp
  200272:	5b                   	pop    %ebx
  200273:	5e                   	pop    %esi
  200274:	5f                   	pop    %edi
  200275:	5d                   	pop    %ebp
  200276:	c3                   	ret    
  200277:	90                   	nop
  200278:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  20027e:	74 08                	je     200288 <i2A+0x68>
  200280:	f7 d9                	neg    %ecx
  200282:	c6 45 d3 01          	movb   $0x1,-0x2d(%ebp)
  200286:	eb ac                	jmp    200234 <i2A+0x14>
  200288:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  20028d:	eb f3                	jmp    200282 <i2A+0x62>
  20028f:	90                   	nop

00200290 <i2X>:
  200290:	55                   	push   %ebp
  200291:	89 e5                	mov    %esp,%ebp
  200293:	57                   	push   %edi
  200294:	56                   	push   %esi
  200295:	53                   	push   %ebx
  200296:	8b 55 08             	mov    0x8(%ebp),%edx
  200299:	b9 75 19 20 00       	mov    $0x201975,%ecx
  20029e:	31 c0                	xor    %eax,%eax
  2002a0:	40                   	inc    %eax
  2002a1:	89 d6                	mov    %edx,%esi
  2002a3:	83 e6 0f             	and    $0xf,%esi
  2002a6:	8d 5e f6             	lea    -0xa(%esi),%ebx
  2002a9:	89 cf                	mov    %ecx,%edi
  2002ab:	83 fb 05             	cmp    $0x5,%ebx
  2002ae:	77 4c                	ja     2002fc <i2X+0x6c>
  2002b0:	ff 24 9d a8 06 20 00 	jmp    *0x2006a8(,%ebx,4)
  2002b7:	90                   	nop
  2002b8:	c6 01 65             	movb   $0x65,(%ecx)
  2002bb:	90                   	nop
  2002bc:	49                   	dec    %ecx
  2002bd:	c1 ea 04             	shr    $0x4,%edx
  2002c0:	75 de                	jne    2002a0 <i2X+0x10>
  2002c2:	c6 05 76 19 20 00 00 	movb   $0x0,0x201976
  2002c9:	8b 55 0c             	mov    0xc(%ebp),%edx
  2002cc:	89 3a                	mov    %edi,(%edx)
  2002ce:	5b                   	pop    %ebx
  2002cf:	5e                   	pop    %esi
  2002d0:	5f                   	pop    %edi
  2002d1:	5d                   	pop    %ebp
  2002d2:	c3                   	ret    
  2002d3:	90                   	nop
  2002d4:	c6 01 64             	movb   $0x64,(%ecx)
  2002d7:	eb e3                	jmp    2002bc <i2X+0x2c>
  2002d9:	8d 76 00             	lea    0x0(%esi),%esi
  2002dc:	c6 01 63             	movb   $0x63,(%ecx)
  2002df:	eb db                	jmp    2002bc <i2X+0x2c>
  2002e1:	8d 76 00             	lea    0x0(%esi),%esi
  2002e4:	c6 01 62             	movb   $0x62,(%ecx)
  2002e7:	eb d3                	jmp    2002bc <i2X+0x2c>
  2002e9:	8d 76 00             	lea    0x0(%esi),%esi
  2002ec:	c6 01 61             	movb   $0x61,(%ecx)
  2002ef:	eb cb                	jmp    2002bc <i2X+0x2c>
  2002f1:	8d 76 00             	lea    0x0(%esi),%esi
  2002f4:	c6 01 66             	movb   $0x66,(%ecx)
  2002f7:	eb c3                	jmp    2002bc <i2X+0x2c>
  2002f9:	8d 76 00             	lea    0x0(%esi),%esi
  2002fc:	8d 5e 30             	lea    0x30(%esi),%ebx
  2002ff:	88 19                	mov    %bl,(%ecx)
  200301:	eb b9                	jmp    2002bc <i2X+0x2c>
  200303:	90                   	nop

00200304 <memcpy>:
  200304:	55                   	push   %ebp
  200305:	89 e5                	mov    %esp,%ebp
  200307:	57                   	push   %edi
  200308:	56                   	push   %esi
  200309:	53                   	push   %ebx
  20030a:	8b 55 08             	mov    0x8(%ebp),%edx
  20030d:	8b 7d 0c             	mov    0xc(%ebp),%edi
  200310:	8b 45 10             	mov    0x10(%ebp),%eax
  200313:	85 c0                	test   %eax,%eax
  200315:	7e 35                	jle    20034c <memcpy+0x48>
  200317:	8a 1f                	mov    (%edi),%bl
  200319:	84 db                	test   %bl,%bl
  20031b:	74 2f                	je     20034c <memcpy+0x48>
  20031d:	8d 34 02             	lea    (%edx,%eax,1),%esi
  200320:	31 c9                	xor    %ecx,%ecx
  200322:	eb 07                	jmp    20032b <memcpy+0x27>
  200324:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  200327:	84 db                	test   %bl,%bl
  200329:	74 15                	je     200340 <memcpy+0x3c>
  20032b:	42                   	inc    %edx
  20032c:	88 5a ff             	mov    %bl,-0x1(%edx)
  20032f:	41                   	inc    %ecx
  200330:	39 f2                	cmp    %esi,%edx
  200332:	75 f0                	jne    200324 <memcpy+0x20>
  200334:	c6 06 00             	movb   $0x0,(%esi)
  200337:	29 c8                	sub    %ecx,%eax
  200339:	5b                   	pop    %ebx
  20033a:	5e                   	pop    %esi
  20033b:	5f                   	pop    %edi
  20033c:	5d                   	pop    %ebp
  20033d:	c3                   	ret    
  20033e:	66 90                	xchg   %ax,%ax
  200340:	89 d6                	mov    %edx,%esi
  200342:	c6 06 00             	movb   $0x0,(%esi)
  200345:	29 c8                	sub    %ecx,%eax
  200347:	5b                   	pop    %ebx
  200348:	5e                   	pop    %esi
  200349:	5f                   	pop    %edi
  20034a:	5d                   	pop    %ebp
  20034b:	c3                   	ret    
  20034c:	89 d6                	mov    %edx,%esi
  20034e:	31 c9                	xor    %ecx,%ecx
  200350:	eb e2                	jmp    200334 <memcpy+0x30>
  200352:	66 90                	xchg   %ax,%ax

00200354 <printc>:
  200354:	55                   	push   %ebp
  200355:	89 e5                	mov    %esp,%ebp
  200357:	83 ec 24             	sub    $0x24,%esp
  20035a:	c7 45 f8 04 00 00 00 	movl   $0x4,-0x8(%ebp)
  200361:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  200368:	8d 45 dc             	lea    -0x24(%ebp),%eax
  20036b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20036e:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  200375:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  20037c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  200383:	8b 45 f8             	mov    -0x8(%ebp),%eax
  200386:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  200389:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  20038c:	8b 55 ec             	mov    -0x14(%ebp),%edx
  20038f:	8b 7d e8             	mov    -0x18(%ebp),%edi
  200392:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  200395:	cd 80                	int    $0x80
  200397:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20039a:	c9                   	leave  
  20039b:	c3                   	ret    

0020039c <prints>:
  20039c:	55                   	push   %ebp
  20039d:	89 e5                	mov    %esp,%ebp
  20039f:	83 ec 20             	sub    $0x20,%esp
  2003a2:	8b 55 08             	mov    0x8(%ebp),%edx
  2003a5:	80 3a 00             	cmpb   $0x0,(%edx)
  2003a8:	74 4c                	je     2003f6 <prints+0x5a>
  2003aa:	31 c0                	xor    %eax,%eax
  2003ac:	40                   	inc    %eax
  2003ad:	89 c1                	mov    %eax,%ecx
  2003af:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  2003b3:	75 f7                	jne    2003ac <prints+0x10>
  2003b5:	c7 45 f8 04 00 00 00 	movl   $0x4,-0x8(%ebp)
  2003bc:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  2003c3:	81 ea 00 00 01 00    	sub    $0x10000,%edx
  2003c9:	89 55 f0             	mov    %edx,-0x10(%ebp)
  2003cc:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  2003cf:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  2003d6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  2003dd:	8b 45 f8             	mov    -0x8(%ebp),%eax
  2003e0:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  2003e3:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2003e6:	8b 55 ec             	mov    -0x14(%ebp),%edx
  2003e9:	8b 7d e8             	mov    -0x18(%ebp),%edi
  2003ec:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  2003ef:	cd 80                	int    $0x80
  2003f1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2003f4:	c9                   	leave  
  2003f5:	c3                   	ret    
  2003f6:	31 c9                	xor    %ecx,%ecx
  2003f8:	eb bb                	jmp    2003b5 <prints+0x19>
  2003fa:	66 90                	xchg   %ax,%ax

002003fc <printd>:
  2003fc:	55                   	push   %ebp
  2003fd:	89 e5                	mov    %esp,%ebp
  2003ff:	57                   	push   %edi
  200400:	56                   	push   %esi
  200401:	53                   	push   %ebx
  200402:	83 ec 24             	sub    $0x24,%esp
  200405:	8b 4d 08             	mov    0x8(%ebp),%ecx
  200408:	85 c9                	test   %ecx,%ecx
  20040a:	78 60                	js     20046c <printd+0x70>
  20040c:	c6 45 d3 00          	movb   $0x0,-0x2d(%ebp)
  200410:	31 ff                	xor    %edi,%edi
  200412:	8d 5d f3             	lea    -0xd(%ebp),%ebx
  200415:	be 67 66 66 66       	mov    $0x66666667,%esi
  20041a:	66 90                	xchg   %ax,%ax
  20041c:	4b                   	dec    %ebx
  20041d:	89 c8                	mov    %ecx,%eax
  20041f:	f7 ee                	imul   %esi
  200421:	89 d0                	mov    %edx,%eax
  200423:	c1 f8 02             	sar    $0x2,%eax
  200426:	89 ca                	mov    %ecx,%edx
  200428:	c1 fa 1f             	sar    $0x1f,%edx
  20042b:	29 d0                	sub    %edx,%eax
  20042d:	8d 14 80             	lea    (%eax,%eax,4),%edx
  200430:	01 d2                	add    %edx,%edx
  200432:	29 d1                	sub    %edx,%ecx
  200434:	83 c1 30             	add    $0x30,%ecx
  200437:	88 0b                	mov    %cl,(%ebx)
  200439:	89 c1                	mov    %eax,%ecx
  20043b:	85 c0                	test   %eax,%eax
  20043d:	75 dd                	jne    20041c <printd+0x20>
  20043f:	89 f8                	mov    %edi,%eax
  200441:	fe c8                	dec    %al
  200443:	74 1f                	je     200464 <printd+0x68>
  200445:	80 7d d3 01          	cmpb   $0x1,-0x2d(%ebp)
  200449:	75 03                	jne    20044e <printd+0x52>
  20044b:	fe 45 f2             	incb   -0xe(%ebp)
  20044e:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  200452:	53                   	push   %ebx
  200453:	e8 44 ff ff ff       	call   20039c <prints>
  200458:	58                   	pop    %eax
  200459:	8d 65 f4             	lea    -0xc(%ebp),%esp
  20045c:	5b                   	pop    %ebx
  20045d:	5e                   	pop    %esi
  20045e:	5f                   	pop    %edi
  20045f:	5d                   	pop    %ebp
  200460:	c3                   	ret    
  200461:	8d 76 00             	lea    0x0(%esi),%esi
  200464:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  200468:	4b                   	dec    %ebx
  200469:	eb da                	jmp    200445 <printd+0x49>
  20046b:	90                   	nop
  20046c:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  200472:	74 0d                	je     200481 <printd+0x85>
  200474:	f7 d9                	neg    %ecx
  200476:	c6 45 d3 00          	movb   $0x0,-0x2d(%ebp)
  20047a:	bf 01 00 00 00       	mov    $0x1,%edi
  20047f:	eb 91                	jmp    200412 <printd+0x16>
  200481:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  200486:	c6 45 d3 01          	movb   $0x1,-0x2d(%ebp)
  20048a:	eb ee                	jmp    20047a <printd+0x7e>

0020048c <printx>:
  20048c:	55                   	push   %ebp
  20048d:	89 e5                	mov    %esp,%ebp
  20048f:	53                   	push   %ebx
  200490:	83 ec 20             	sub    $0x20,%esp
  200493:	8b 45 08             	mov    0x8(%ebp),%eax
  200496:	8d 55 fa             	lea    -0x6(%ebp),%edx
  200499:	8d 76 00             	lea    0x0(%esi),%esi
  20049c:	89 c1                	mov    %eax,%ecx
  20049e:	81 e1 0f 00 00 80    	and    $0x8000000f,%ecx
  2004a4:	78 6a                	js     200510 <printx+0x84>
  2004a6:	8d 59 f6             	lea    -0xa(%ecx),%ebx
  2004a9:	83 fb 05             	cmp    $0x5,%ebx
  2004ac:	77 6f                	ja     20051d <printx+0x91>
  2004ae:	ff 24 9d c0 06 20 00 	jmp    *0x2006c0(,%ebx,4)
  2004b5:	8d 76 00             	lea    0x0(%esi),%esi
  2004b8:	89 d3                	mov    %edx,%ebx
  2004ba:	c6 02 65             	movb   $0x65,(%edx)
  2004bd:	8d 76 00             	lea    0x0(%esi),%esi
  2004c0:	85 c0                	test   %eax,%eax
  2004c2:	78 24                	js     2004e8 <printx+0x5c>
  2004c4:	c1 f8 04             	sar    $0x4,%eax
  2004c7:	4a                   	dec    %edx
  2004c8:	85 c0                	test   %eax,%eax
  2004ca:	75 d0                	jne    20049c <printx+0x10>
  2004cc:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
  2004d0:	53                   	push   %ebx
  2004d1:	e8 c6 fe ff ff       	call   20039c <prints>
  2004d6:	58                   	pop    %eax
  2004d7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  2004da:	c9                   	leave  
  2004db:	c3                   	ret    
  2004dc:	89 d3                	mov    %edx,%ebx
  2004de:	c6 02 64             	movb   $0x64,(%edx)
  2004e1:	85 c0                	test   %eax,%eax
  2004e3:	79 df                	jns    2004c4 <printx+0x38>
  2004e5:	8d 76 00             	lea    0x0(%esi),%esi
  2004e8:	83 c0 0f             	add    $0xf,%eax
  2004eb:	eb d7                	jmp    2004c4 <printx+0x38>
  2004ed:	8d 76 00             	lea    0x0(%esi),%esi
  2004f0:	89 d3                	mov    %edx,%ebx
  2004f2:	c6 02 63             	movb   $0x63,(%edx)
  2004f5:	eb c9                	jmp    2004c0 <printx+0x34>
  2004f7:	90                   	nop
  2004f8:	89 d3                	mov    %edx,%ebx
  2004fa:	c6 02 62             	movb   $0x62,(%edx)
  2004fd:	eb c1                	jmp    2004c0 <printx+0x34>
  2004ff:	90                   	nop
  200500:	89 d3                	mov    %edx,%ebx
  200502:	c6 02 61             	movb   $0x61,(%edx)
  200505:	eb b9                	jmp    2004c0 <printx+0x34>
  200507:	90                   	nop
  200508:	89 d3                	mov    %edx,%ebx
  20050a:	c6 02 66             	movb   $0x66,(%edx)
  20050d:	eb b1                	jmp    2004c0 <printx+0x34>
  20050f:	90                   	nop
  200510:	49                   	dec    %ecx
  200511:	83 c9 f0             	or     $0xfffffff0,%ecx
  200514:	41                   	inc    %ecx
  200515:	8d 59 f6             	lea    -0xa(%ecx),%ebx
  200518:	83 fb 05             	cmp    $0x5,%ebx
  20051b:	76 91                	jbe    2004ae <printx+0x22>
  20051d:	89 d3                	mov    %edx,%ebx
  20051f:	83 c1 30             	add    $0x30,%ecx
  200522:	88 0a                	mov    %cl,(%edx)
  200524:	eb 9a                	jmp    2004c0 <printx+0x34>
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
  200541:	8d 76 00             	lea    0x0(%esi),%esi

00200544 <printf>:
  200544:	55                   	push   %ebp
  200545:	89 e5                	mov    %esp,%ebp
  200547:	57                   	push   %edi
  200548:	56                   	push   %esi
  200549:	53                   	push   %ebx
  20054a:	83 ec 40             	sub    $0x40,%esp
  20054d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  200550:	8a 01                	mov    (%ecx),%al
  200552:	84 c0                	test   %al,%al
  200554:	0f 84 89 00 00 00    	je     2005e3 <printf+0x9f>
  20055a:	8d 55 0c             	lea    0xc(%ebp),%edx
  20055d:	8d 5d bf             	lea    -0x41(%ebp),%ebx
  200560:	eb 4e                	jmp    2005b0 <printf+0x6c>
  200562:	66 90                	xchg   %ax,%ax
  200564:	88 45 bf             	mov    %al,-0x41(%ebp)
  200567:	c7 45 ec 04 00 00 00 	movl   $0x4,-0x14(%ebp)
  20056e:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  200575:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  200578:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
  20057f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  200586:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  20058d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  200590:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  200593:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  200596:	8b 55 e0             	mov    -0x20(%ebp),%edx
  200599:	8b 7d dc             	mov    -0x24(%ebp),%edi
  20059c:	8b 75 d8             	mov    -0x28(%ebp),%esi
  20059f:	cd 80                	int    $0x80
  2005a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  2005a4:	89 cf                	mov    %ecx,%edi
  2005a6:	8d 4f 01             	lea    0x1(%edi),%ecx
  2005a9:	8a 47 01             	mov    0x1(%edi),%al
  2005ac:	84 c0                	test   %al,%al
  2005ae:	74 33                	je     2005e3 <printf+0x9f>
  2005b0:	3c 25                	cmp    $0x25,%al
  2005b2:	75 b0                	jne    200564 <printf+0x20>
  2005b4:	8d 79 01             	lea    0x1(%ecx),%edi
  2005b7:	8a 41 01             	mov    0x1(%ecx),%al
  2005ba:	3c 64                	cmp    $0x64,%al
  2005bc:	0f 84 92 00 00 00    	je     200654 <printf+0x110>
  2005c2:	7e 28                	jle    2005ec <printf+0xa8>
  2005c4:	3c 73                	cmp    $0x73,%al
  2005c6:	74 78                	je     200640 <printf+0xfc>
  2005c8:	3c 78                	cmp    $0x78,%al
  2005ca:	75 da                	jne    2005a6 <printf+0x62>
  2005cc:	8d 72 04             	lea    0x4(%edx),%esi
  2005cf:	ff 32                	pushl  (%edx)
  2005d1:	e8 b6 fe ff ff       	call   20048c <printx>
  2005d6:	5a                   	pop    %edx
  2005d7:	89 f2                	mov    %esi,%edx
  2005d9:	8d 4f 01             	lea    0x1(%edi),%ecx
  2005dc:	8a 47 01             	mov    0x1(%edi),%al
  2005df:	84 c0                	test   %al,%al
  2005e1:	75 cd                	jne    2005b0 <printf+0x6c>
  2005e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  2005e6:	5b                   	pop    %ebx
  2005e7:	5e                   	pop    %esi
  2005e8:	5f                   	pop    %edi
  2005e9:	5d                   	pop    %ebp
  2005ea:	c3                   	ret    
  2005eb:	90                   	nop
  2005ec:	3c 63                	cmp    $0x63,%al
  2005ee:	75 b6                	jne    2005a6 <printf+0x62>
  2005f0:	8d 42 04             	lea    0x4(%edx),%eax
  2005f3:	8b 12                	mov    (%edx),%edx
  2005f5:	88 55 be             	mov    %dl,-0x42(%ebp)
  2005f8:	c7 45 d4 04 00 00 00 	movl   $0x4,-0x2c(%ebp)
  2005ff:	c7 45 d0 01 00 00 00 	movl   $0x1,-0x30(%ebp)
  200606:	8d 75 be             	lea    -0x42(%ebp),%esi
  200609:	89 75 cc             	mov    %esi,-0x34(%ebp)
  20060c:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
  200613:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
  20061a:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
  200621:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  200624:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  200627:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  20062a:	8b 55 c8             	mov    -0x38(%ebp),%edx
  20062d:	8b 7d c4             	mov    -0x3c(%ebp),%edi
  200630:	8b 75 c0             	mov    -0x40(%ebp),%esi
  200633:	cd 80                	int    $0x80
  200635:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200638:	89 c2                	mov    %eax,%edx
  20063a:	e9 67 ff ff ff       	jmp    2005a6 <printf+0x62>
  20063f:	90                   	nop
  200640:	8d 72 04             	lea    0x4(%edx),%esi
  200643:	ff 32                	pushl  (%edx)
  200645:	e8 52 fd ff ff       	call   20039c <prints>
  20064a:	58                   	pop    %eax
  20064b:	89 f2                	mov    %esi,%edx
  20064d:	e9 54 ff ff ff       	jmp    2005a6 <printf+0x62>
  200652:	66 90                	xchg   %ax,%ax
  200654:	8d 72 04             	lea    0x4(%edx),%esi
  200657:	ff 32                	pushl  (%edx)
  200659:	e8 9e fd ff ff       	call   2003fc <printd>
  20065e:	59                   	pop    %ecx
  20065f:	89 f2                	mov    %esi,%edx
  200661:	e9 40 ff ff ff       	jmp    2005a6 <printf+0x62>
