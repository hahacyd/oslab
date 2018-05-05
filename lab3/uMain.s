
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	53                   	push   %ebx
  200004:	50                   	push   %eax
  200005:	e8 76 00 00 00       	call   200080 <fork>
  20000a:	89 c3                	mov    %eax,%ebx
  20000c:	85 c0                	test   %eax,%eax
  20000e:	75 3a                	jne    20004a <uEntry+0x4a>
  200010:	83 ec 0c             	sub    $0xc,%esp
  200013:	68 08 05 20 00       	push   $0x200508
  200018:	e8 53 03 00 00       	call   200370 <printf>
  20001d:	83 c4 10             	add    $0x10,%esp
  200020:	83 ec 08             	sub    $0x8,%esp
  200023:	53                   	push   %ebx
  200024:	68 21 05 20 00       	push   $0x200521
  200029:	e8 42 03 00 00       	call   200370 <printf>
  20002e:	e8 e5 00 00 00       	call   200118 <exit>
  200033:	83 c4 10             	add    $0x10,%esp
  200036:	66 90                	xchg   %ax,%ax
  200038:	83 ec 0c             	sub    $0xc,%esp
  20003b:	68 2b 05 20 00       	push   $0x20052b
  200040:	e8 2b 03 00 00       	call   200370 <printf>
  200045:	83 c4 10             	add    $0x10,%esp
  200048:	eb ee                	jmp    200038 <uEntry+0x38>
  20004a:	83 ec 0c             	sub    $0xc,%esp
  20004d:	68 14 05 20 00       	push   $0x200514
  200052:	e8 19 03 00 00       	call   200370 <printf>
  200057:	83 c4 10             	add    $0x10,%esp
  20005a:	eb c4                	jmp    200020 <uEntry+0x20>

0020005c <syscall>:
  20005c:	55                   	push   %ebp
  20005d:	89 e5                	mov    %esp,%ebp
  20005f:	83 ec 10             	sub    $0x10,%esp
  200062:	8b 45 08             	mov    0x8(%ebp),%eax
  200065:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  200068:	8b 4d 10             	mov    0x10(%ebp),%ecx
  20006b:	8b 55 14             	mov    0x14(%ebp),%edx
  20006e:	8b 7d 18             	mov    0x18(%ebp),%edi
  200071:	8b 75 1c             	mov    0x1c(%ebp),%esi
  200074:	cd 80                	int    $0x80
  200076:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200079:	8b 45 fc             	mov    -0x4(%ebp),%eax
  20007c:	c9                   	leave  
  20007d:	c3                   	ret    
  20007e:	66 90                	xchg   %ax,%ax

00200080 <fork>:
  200080:	55                   	push   %ebp
  200081:	89 e5                	mov    %esp,%ebp
  200083:	83 ec 20             	sub    $0x20,%esp
  200086:	c7 45 e4 02 00 00 00 	movl   $0x2,-0x1c(%ebp)
  20008d:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  200094:	c7 45 ec 3a 05 20 00 	movl   $0x20053a,-0x14(%ebp)
  20009b:	c7 45 f0 0d 00 00 00 	movl   $0xd,-0x10(%ebp)
  2000a2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2000a9:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2000b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2000b3:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2000b6:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2000b9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2000bc:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2000bf:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2000c2:	cd 80                	int    $0x80
  2000c4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2000c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2000ca:	c9                   	leave  
  2000cb:	c3                   	ret    

002000cc <sleep>:
  2000cc:	55                   	push   %ebp
  2000cd:	89 e5                	mov    %esp,%ebp
  2000cf:	83 ec 20             	sub    $0x20,%esp
  2000d2:	c7 45 e4 e6 00 00 00 	movl   $0xe6,-0x1c(%ebp)
  2000d9:	8b 45 08             	mov    0x8(%ebp),%eax
  2000dc:	89 45 e8             	mov    %eax,-0x18(%ebp)
  2000df:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  2000e6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2000ed:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2000f4:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2000fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2000fe:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  200101:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200104:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200107:	8b 7d f4             	mov    -0xc(%ebp),%edi
  20010a:	8b 75 f8             	mov    -0x8(%ebp),%esi
  20010d:	cd 80                	int    $0x80
  20010f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200112:	31 c0                	xor    %eax,%eax
  200114:	c9                   	leave  
  200115:	c3                   	ret    
  200116:	66 90                	xchg   %ax,%ax

00200118 <exit>:
  200118:	55                   	push   %ebp
  200119:	89 e5                	mov    %esp,%ebp
  20011b:	83 ec 20             	sub    $0x20,%esp
  20011e:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  200125:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  20012c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  200133:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  20013a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200141:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200148:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  20014b:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  20014e:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200151:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200154:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200157:	8b 75 f8             	mov    -0x8(%ebp),%esi
  20015a:	cd 80                	int    $0x80
  20015c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20015f:	31 c0                	xor    %eax,%eax
  200161:	c9                   	leave  
  200162:	c3                   	ret    
  200163:	90                   	nop

00200164 <fs_write>:
  200164:	55                   	push   %ebp
  200165:	89 e5                	mov    %esp,%ebp
  200167:	83 ec 20             	sub    $0x20,%esp
  20016a:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  200171:	8b 45 08             	mov    0x8(%ebp),%eax
  200174:	89 45 e8             	mov    %eax,-0x18(%ebp)
  200177:	8b 45 0c             	mov    0xc(%ebp),%eax
  20017a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  20017d:	8b 45 10             	mov    0x10(%ebp),%eax
  200180:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200183:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20018a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200191:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  200194:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  200197:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  20019a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  20019d:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2001a0:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2001a3:	cd 80                	int    $0x80
  2001a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2001a8:	c9                   	leave  
  2001a9:	c3                   	ret    
  2001aa:	66 90                	xchg   %ax,%ax

002001ac <putchar_user>:
  2001ac:	55                   	push   %ebp
  2001ad:	89 e5                	mov    %esp,%ebp
  2001af:	83 ec 24             	sub    $0x24,%esp
  2001b2:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  2001b9:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  2001c0:	8d 45 dc             	lea    -0x24(%ebp),%eax
  2001c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2001c6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  2001cd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2001d4:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2001db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2001de:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2001e1:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2001e4:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2001e7:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2001ea:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2001ed:	cd 80                	int    $0x80
  2001ef:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2001f2:	c9                   	leave  
  2001f3:	c3                   	ret    

002001f4 <i2A>:
  2001f4:	55                   	push   %ebp
  2001f5:	89 e5                	mov    %esp,%ebp
  2001f7:	57                   	push   %edi
  2001f8:	56                   	push   %esi
  2001f9:	53                   	push   %ebx
  2001fa:	51                   	push   %ecx
  2001fb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2001fe:	85 c9                	test   %ecx,%ecx
  200200:	78 6e                	js     200270 <i2A+0x7c>
  200202:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  200206:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  20020a:	bb 82 1f 20 00       	mov    $0x201f82,%ebx
  20020f:	31 ff                	xor    %edi,%edi
  200211:	eb 03                	jmp    200216 <i2A+0x22>
  200213:	90                   	nop
  200214:	89 f7                	mov    %esi,%edi
  200216:	4b                   	dec    %ebx
  200217:	89 c8                	mov    %ecx,%eax
  200219:	be 0a 00 00 00       	mov    $0xa,%esi
  20021e:	99                   	cltd   
  20021f:	f7 fe                	idiv   %esi
  200221:	83 c2 30             	add    $0x30,%edx
  200224:	88 13                	mov    %dl,(%ebx)
  200226:	8d 77 01             	lea    0x1(%edi),%esi
  200229:	b8 67 66 66 66       	mov    $0x66666667,%eax
  20022e:	f7 e9                	imul   %ecx
  200230:	89 d0                	mov    %edx,%eax
  200232:	c1 f8 02             	sar    $0x2,%eax
  200235:	c1 f9 1f             	sar    $0x1f,%ecx
  200238:	29 c8                	sub    %ecx,%eax
  20023a:	89 c1                	mov    %eax,%ecx
  20023c:	75 d6                	jne    200214 <i2A+0x20>
  20023e:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  200242:	74 20                	je     200264 <i2A+0x70>
  200244:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  200248:	75 06                	jne    200250 <i2A+0x5c>
  20024a:	fe 05 81 1f 20 00    	incb   0x201f81
  200250:	c6 05 82 1f 20 00 00 	movb   $0x0,0x201f82
  200257:	8b 45 0c             	mov    0xc(%ebp),%eax
  20025a:	89 18                	mov    %ebx,(%eax)
  20025c:	89 f0                	mov    %esi,%eax
  20025e:	5a                   	pop    %edx
  20025f:	5b                   	pop    %ebx
  200260:	5e                   	pop    %esi
  200261:	5f                   	pop    %edi
  200262:	5d                   	pop    %ebp
  200263:	c3                   	ret    
  200264:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  200268:	8d 77 02             	lea    0x2(%edi),%esi
  20026b:	4b                   	dec    %ebx
  20026c:	eb d6                	jmp    200244 <i2A+0x50>
  20026e:	66 90                	xchg   %ax,%ax
  200270:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  200276:	74 0c                	je     200284 <i2A+0x90>
  200278:	f7 d9                	neg    %ecx
  20027a:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  20027e:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  200282:	eb 86                	jmp    20020a <i2A+0x16>
  200284:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  200289:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  20028d:	eb ef                	jmp    20027e <i2A+0x8a>
  20028f:	90                   	nop

00200290 <i2X>:
  200290:	55                   	push   %ebp
  200291:	89 e5                	mov    %esp,%ebp
  200293:	57                   	push   %edi
  200294:	56                   	push   %esi
  200295:	53                   	push   %ebx
  200296:	8b 55 08             	mov    0x8(%ebp),%edx
  200299:	b9 61 1f 20 00       	mov    $0x201f61,%ecx
  20029e:	31 c0                	xor    %eax,%eax
  2002a0:	40                   	inc    %eax
  2002a1:	89 d6                	mov    %edx,%esi
  2002a3:	83 e6 0f             	and    $0xf,%esi
  2002a6:	8d 5e f6             	lea    -0xa(%esi),%ebx
  2002a9:	89 cf                	mov    %ecx,%edi
  2002ab:	83 fb 05             	cmp    $0x5,%ebx
  2002ae:	77 4c                	ja     2002fc <i2X+0x6c>
  2002b0:	ff 24 9d 44 05 20 00 	jmp    *0x200544(,%ebx,4)
  2002b7:	90                   	nop
  2002b8:	c6 01 65             	movb   $0x65,(%ecx)
  2002bb:	90                   	nop
  2002bc:	49                   	dec    %ecx
  2002bd:	c1 ea 04             	shr    $0x4,%edx
  2002c0:	75 de                	jne    2002a0 <i2X+0x10>
  2002c2:	c6 05 62 1f 20 00 00 	movb   $0x0,0x201f62
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

00200354 <length_str>:
  200354:	55                   	push   %ebp
  200355:	89 e5                	mov    %esp,%ebp
  200357:	8b 55 08             	mov    0x8(%ebp),%edx
  20035a:	31 c0                	xor    %eax,%eax
  20035c:	80 3a 00             	cmpb   $0x0,(%edx)
  20035f:	74 0a                	je     20036b <length_str+0x17>
  200361:	8d 76 00             	lea    0x0(%esi),%esi
  200364:	40                   	inc    %eax
  200365:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  200369:	75 f9                	jne    200364 <length_str+0x10>
  20036b:	5d                   	pop    %ebp
  20036c:	c3                   	ret    
  20036d:	8d 76 00             	lea    0x0(%esi),%esi

00200370 <printf>:
  200370:	55                   	push   %ebp
  200371:	89 e5                	mov    %esp,%ebp
  200373:	57                   	push   %edi
  200374:	56                   	push   %esi
  200375:	53                   	push   %ebx
  200376:	83 ec 24             	sub    $0x24,%esp
  200379:	8b 4d 08             	mov    0x8(%ebp),%ecx
  20037c:	8a 11                	mov    (%ecx),%dl
  20037e:	84 d2                	test   %dl,%dl
  200380:	0f 84 74 01 00 00    	je     2004fa <printf+0x18a>
  200386:	8d 45 0c             	lea    0xc(%ebp),%eax
  200389:	31 ff                	xor    %edi,%edi
  20038b:	eb 18                	jmp    2003a5 <printf+0x35>
  20038d:	8d 76 00             	lea    0x0(%esi),%esi
  200390:	8a 11                	mov    (%ecx),%dl
  200392:	89 cb                	mov    %ecx,%ebx
  200394:	88 97 40 17 20 00    	mov    %dl,0x201740(%edi)
  20039a:	47                   	inc    %edi
  20039b:	8d 4b 01             	lea    0x1(%ebx),%ecx
  20039e:	8a 53 01             	mov    0x1(%ebx),%dl
  2003a1:	84 d2                	test   %dl,%dl
  2003a3:	74 72                	je     200417 <printf+0xa7>
  2003a5:	80 fa 25             	cmp    $0x25,%dl
  2003a8:	75 e6                	jne    200390 <printf+0x20>
  2003aa:	8d 59 01             	lea    0x1(%ecx),%ebx
  2003ad:	8a 51 01             	mov    0x1(%ecx),%dl
  2003b0:	80 fa 64             	cmp    $0x64,%dl
  2003b3:	0f 84 df 00 00 00    	je     200498 <printf+0x128>
  2003b9:	0f 8e 21 01 00 00    	jle    2004e0 <printf+0x170>
  2003bf:	80 fa 73             	cmp    $0x73,%dl
  2003c2:	0f 84 a0 00 00 00    	je     200468 <printf+0xf8>
  2003c8:	80 fa 78             	cmp    $0x78,%dl
  2003cb:	75 c7                	jne    200394 <printf+0x24>
  2003cd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2003d4:	8d 70 04             	lea    0x4(%eax),%esi
  2003d7:	89 75 d0             	mov    %esi,-0x30(%ebp)
  2003da:	8d 75 f0             	lea    -0x10(%ebp),%esi
  2003dd:	56                   	push   %esi
  2003de:	ff 30                	pushl  (%eax)
  2003e0:	e8 ab fe ff ff       	call   200290 <i2X>
  2003e5:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2003e8:	8d b7 40 17 20 00    	lea    0x201740(%edi),%esi
  2003ee:	8a 11                	mov    (%ecx),%dl
  2003f0:	83 c4 08             	add    $0x8,%esp
  2003f3:	31 c0                	xor    %eax,%eax
  2003f5:	84 d2                	test   %dl,%dl
  2003f7:	74 0f                	je     200408 <printf+0x98>
  2003f9:	8d 76 00             	lea    0x0(%esi),%esi
  2003fc:	40                   	inc    %eax
  2003fd:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  200401:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  200404:	84 d2                	test   %dl,%dl
  200406:	75 f4                	jne    2003fc <printf+0x8c>
  200408:	01 c7                	add    %eax,%edi
  20040a:	8b 45 d0             	mov    -0x30(%ebp),%eax
  20040d:	8d 4b 01             	lea    0x1(%ebx),%ecx
  200410:	8a 53 01             	mov    0x1(%ebx),%dl
  200413:	84 d2                	test   %dl,%dl
  200415:	75 8e                	jne    2003a5 <printf+0x35>
  200417:	8d 47 01             	lea    0x1(%edi),%eax
  20041a:	c6 87 40 17 20 00 00 	movb   $0x0,0x201740(%edi)
  200421:	c7 45 ec 04 00 00 00 	movl   $0x4,-0x14(%ebp)
  200428:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  20042f:	c7 45 e4 40 17 20 00 	movl   $0x201740,-0x1c(%ebp)
  200436:	89 45 e0             	mov    %eax,-0x20(%ebp)
  200439:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  200440:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  200447:	8b 45 ec             	mov    -0x14(%ebp),%eax
  20044a:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  20044d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  200450:	8b 55 e0             	mov    -0x20(%ebp),%edx
  200453:	8b 7d dc             	mov    -0x24(%ebp),%edi
  200456:	8b 75 d8             	mov    -0x28(%ebp),%esi
  200459:	cd 80                	int    $0x80
  20045b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  20045e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  200461:	5b                   	pop    %ebx
  200462:	5e                   	pop    %esi
  200463:	5f                   	pop    %edi
  200464:	5d                   	pop    %ebp
  200465:	c3                   	ret    
  200466:	66 90                	xchg   %ax,%ax
  200468:	8d 70 04             	lea    0x4(%eax),%esi
  20046b:	89 75 d0             	mov    %esi,-0x30(%ebp)
  20046e:	8b 08                	mov    (%eax),%ecx
  200470:	8d b7 40 17 20 00    	lea    0x201740(%edi),%esi
  200476:	8a 11                	mov    (%ecx),%dl
  200478:	31 c0                	xor    %eax,%eax
  20047a:	84 d2                	test   %dl,%dl
  20047c:	74 8a                	je     200408 <printf+0x98>
  20047e:	66 90                	xchg   %ax,%ax
  200480:	40                   	inc    %eax
  200481:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  200485:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  200488:	84 d2                	test   %dl,%dl
  20048a:	75 f4                	jne    200480 <printf+0x110>
  20048c:	01 c7                	add    %eax,%edi
  20048e:	8b 45 d0             	mov    -0x30(%ebp),%eax
  200491:	e9 77 ff ff ff       	jmp    20040d <printf+0x9d>
  200496:	66 90                	xchg   %ax,%ax
  200498:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  20049f:	8d 70 04             	lea    0x4(%eax),%esi
  2004a2:	89 75 d0             	mov    %esi,-0x30(%ebp)
  2004a5:	8d 75 f0             	lea    -0x10(%ebp),%esi
  2004a8:	56                   	push   %esi
  2004a9:	ff 30                	pushl  (%eax)
  2004ab:	e8 44 fd ff ff       	call   2001f4 <i2A>
  2004b0:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2004b3:	8d b7 40 17 20 00    	lea    0x201740(%edi),%esi
  2004b9:	8a 11                	mov    (%ecx),%dl
  2004bb:	83 c4 08             	add    $0x8,%esp
  2004be:	31 c0                	xor    %eax,%eax
  2004c0:	84 d2                	test   %dl,%dl
  2004c2:	0f 84 40 ff ff ff    	je     200408 <printf+0x98>
  2004c8:	40                   	inc    %eax
  2004c9:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  2004cd:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  2004d0:	84 d2                	test   %dl,%dl
  2004d2:	75 f4                	jne    2004c8 <printf+0x158>
  2004d4:	01 c7                	add    %eax,%edi
  2004d6:	8b 45 d0             	mov    -0x30(%ebp),%eax
  2004d9:	e9 2f ff ff ff       	jmp    20040d <printf+0x9d>
  2004de:	66 90                	xchg   %ax,%ax
  2004e0:	80 fa 63             	cmp    $0x63,%dl
  2004e3:	0f 85 ab fe ff ff    	jne    200394 <printf+0x24>
  2004e9:	8b 10                	mov    (%eax),%edx
  2004eb:	88 97 40 17 20 00    	mov    %dl,0x201740(%edi)
  2004f1:	83 c0 04             	add    $0x4,%eax
  2004f4:	47                   	inc    %edi
  2004f5:	e9 a1 fe ff ff       	jmp    20039b <printf+0x2b>
  2004fa:	b8 01 00 00 00       	mov    $0x1,%eax
  2004ff:	31 ff                	xor    %edi,%edi
  200501:	e9 14 ff ff ff       	jmp    20041a <printf+0xaa>
