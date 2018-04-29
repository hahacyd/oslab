
kernel/kMain.elf:     file format elf32-i386


Disassembly of section .text:

00100000 <i2A>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	57                   	push   %edi
  100004:	56                   	push   %esi
  100005:	53                   	push   %ebx
  100006:	51                   	push   %ecx
  100007:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10000a:	85 c9                	test   %ecx,%ecx
  10000c:	78 6e                	js     10007c <i2A+0x7c>
  10000e:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  100012:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  100016:	bb 5e 2a 10 00       	mov    $0x102a5e,%ebx
  10001b:	31 ff                	xor    %edi,%edi
  10001d:	eb 03                	jmp    100022 <i2A+0x22>
  10001f:	90                   	nop
  100020:	89 f7                	mov    %esi,%edi
  100022:	4b                   	dec    %ebx
  100023:	89 c8                	mov    %ecx,%eax
  100025:	be 0a 00 00 00       	mov    $0xa,%esi
  10002a:	99                   	cltd   
  10002b:	f7 fe                	idiv   %esi
  10002d:	83 c2 30             	add    $0x30,%edx
  100030:	88 13                	mov    %dl,(%ebx)
  100032:	8d 77 01             	lea    0x1(%edi),%esi
  100035:	b8 67 66 66 66       	mov    $0x66666667,%eax
  10003a:	f7 e9                	imul   %ecx
  10003c:	89 d0                	mov    %edx,%eax
  10003e:	c1 f8 02             	sar    $0x2,%eax
  100041:	c1 f9 1f             	sar    $0x1f,%ecx
  100044:	29 c8                	sub    %ecx,%eax
  100046:	89 c1                	mov    %eax,%ecx
  100048:	75 d6                	jne    100020 <i2A+0x20>
  10004a:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  10004e:	74 20                	je     100070 <i2A+0x70>
  100050:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  100054:	75 06                	jne    10005c <i2A+0x5c>
  100056:	fe 05 5d 2a 10 00    	incb   0x102a5d
  10005c:	c6 05 5e 2a 10 00 00 	movb   $0x0,0x102a5e
  100063:	8b 45 0c             	mov    0xc(%ebp),%eax
  100066:	89 18                	mov    %ebx,(%eax)
  100068:	89 f0                	mov    %esi,%eax
  10006a:	5a                   	pop    %edx
  10006b:	5b                   	pop    %ebx
  10006c:	5e                   	pop    %esi
  10006d:	5f                   	pop    %edi
  10006e:	5d                   	pop    %ebp
  10006f:	c3                   	ret    
  100070:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  100074:	8d 77 02             	lea    0x2(%edi),%esi
  100077:	4b                   	dec    %ebx
  100078:	eb d6                	jmp    100050 <i2A+0x50>
  10007a:	66 90                	xchg   %ax,%ax
  10007c:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  100082:	74 0c                	je     100090 <i2A+0x90>
  100084:	f7 d9                	neg    %ecx
  100086:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  10008a:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  10008e:	eb 86                	jmp    100016 <i2A+0x16>
  100090:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  100095:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  100099:	eb ef                	jmp    10008a <i2A+0x8a>
  10009b:	90                   	nop

0010009c <i2X>:
  10009c:	55                   	push   %ebp
  10009d:	89 e5                	mov    %esp,%ebp
  10009f:	57                   	push   %edi
  1000a0:	56                   	push   %esi
  1000a1:	53                   	push   %ebx
  1000a2:	8b 55 08             	mov    0x8(%ebp),%edx
  1000a5:	b9 3d 2a 10 00       	mov    $0x102a3d,%ecx
  1000aa:	31 c0                	xor    %eax,%eax
  1000ac:	40                   	inc    %eax
  1000ad:	89 d6                	mov    %edx,%esi
  1000af:	83 e6 0f             	and    $0xf,%esi
  1000b2:	8d 5e f6             	lea    -0xa(%esi),%ebx
  1000b5:	89 cf                	mov    %ecx,%edi
  1000b7:	83 fb 05             	cmp    $0x5,%ebx
  1000ba:	77 4c                	ja     100108 <i2X+0x6c>
  1000bc:	ff 24 9d 78 11 10 00 	jmp    *0x101178(,%ebx,4)
  1000c3:	90                   	nop
  1000c4:	c6 01 65             	movb   $0x65,(%ecx)
  1000c7:	90                   	nop
  1000c8:	49                   	dec    %ecx
  1000c9:	c1 ea 04             	shr    $0x4,%edx
  1000cc:	75 de                	jne    1000ac <i2X+0x10>
  1000ce:	c6 05 3e 2a 10 00 00 	movb   $0x0,0x102a3e
  1000d5:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000d8:	89 3a                	mov    %edi,(%edx)
  1000da:	5b                   	pop    %ebx
  1000db:	5e                   	pop    %esi
  1000dc:	5f                   	pop    %edi
  1000dd:	5d                   	pop    %ebp
  1000de:	c3                   	ret    
  1000df:	90                   	nop
  1000e0:	c6 01 64             	movb   $0x64,(%ecx)
  1000e3:	eb e3                	jmp    1000c8 <i2X+0x2c>
  1000e5:	8d 76 00             	lea    0x0(%esi),%esi
  1000e8:	c6 01 63             	movb   $0x63,(%ecx)
  1000eb:	eb db                	jmp    1000c8 <i2X+0x2c>
  1000ed:	8d 76 00             	lea    0x0(%esi),%esi
  1000f0:	c6 01 62             	movb   $0x62,(%ecx)
  1000f3:	eb d3                	jmp    1000c8 <i2X+0x2c>
  1000f5:	8d 76 00             	lea    0x0(%esi),%esi
  1000f8:	c6 01 61             	movb   $0x61,(%ecx)
  1000fb:	eb cb                	jmp    1000c8 <i2X+0x2c>
  1000fd:	8d 76 00             	lea    0x0(%esi),%esi
  100100:	c6 01 66             	movb   $0x66,(%ecx)
  100103:	eb c3                	jmp    1000c8 <i2X+0x2c>
  100105:	8d 76 00             	lea    0x0(%esi),%esi
  100108:	8d 5e 30             	lea    0x30(%esi),%ebx
  10010b:	88 19                	mov    %bl,(%ecx)
  10010d:	eb b9                	jmp    1000c8 <i2X+0x2c>
  10010f:	90                   	nop

00100110 <printk>:
  100110:	55                   	push   %ebp
  100111:	89 e5                	mov    %esp,%ebp
  100113:	57                   	push   %edi
  100114:	56                   	push   %esi
  100115:	53                   	push   %ebx
  100116:	83 ec 2c             	sub    $0x2c,%esp
  100119:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10011c:	8a 11                	mov    (%ecx),%dl
  10011e:	84 d2                	test   %dl,%dl
  100120:	0f 84 54 01 00 00    	je     10027a <printk+0x16a>
  100126:	8d 45 0c             	lea    0xc(%ebp),%eax
  100129:	31 ff                	xor    %edi,%edi
  10012b:	eb 18                	jmp    100145 <printk+0x35>
  10012d:	8d 76 00             	lea    0x0(%esi),%esi
  100130:	8a 11                	mov    (%ecx),%dl
  100132:	89 cb                	mov    %ecx,%ebx
  100134:	88 97 60 2a 10 00    	mov    %dl,0x102a60(%edi)
  10013a:	47                   	inc    %edi
  10013b:	8d 4b 01             	lea    0x1(%ebx),%ecx
  10013e:	8a 53 01             	mov    0x1(%ebx),%dl
  100141:	84 d2                	test   %dl,%dl
  100143:	74 72                	je     1001b7 <printk+0xa7>
  100145:	80 fa 25             	cmp    $0x25,%dl
  100148:	75 e6                	jne    100130 <printk+0x20>
  10014a:	8d 59 01             	lea    0x1(%ecx),%ebx
  10014d:	8a 51 01             	mov    0x1(%ecx),%dl
  100150:	80 fa 64             	cmp    $0x64,%dl
  100153:	0f 84 bf 00 00 00    	je     100218 <printk+0x108>
  100159:	0f 8e 01 01 00 00    	jle    100260 <printk+0x150>
  10015f:	80 fa 73             	cmp    $0x73,%dl
  100162:	0f 84 84 00 00 00    	je     1001ec <printk+0xdc>
  100168:	80 fa 78             	cmp    $0x78,%dl
  10016b:	75 c7                	jne    100134 <printk+0x24>
  10016d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100174:	8d 70 04             	lea    0x4(%eax),%esi
  100177:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10017a:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  10017d:	56                   	push   %esi
  10017e:	ff 30                	pushl  (%eax)
  100180:	e8 17 ff ff ff       	call   10009c <i2X>
  100185:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  100188:	8d b7 60 2a 10 00    	lea    0x102a60(%edi),%esi
  10018e:	8a 11                	mov    (%ecx),%dl
  100190:	83 c4 08             	add    $0x8,%esp
  100193:	31 c0                	xor    %eax,%eax
  100195:	84 d2                	test   %dl,%dl
  100197:	74 0f                	je     1001a8 <printk+0x98>
  100199:	8d 76 00             	lea    0x0(%esi),%esi
  10019c:	40                   	inc    %eax
  10019d:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1001a1:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  1001a4:	84 d2                	test   %dl,%dl
  1001a6:	75 f4                	jne    10019c <printk+0x8c>
  1001a8:	01 c7                	add    %eax,%edi
  1001aa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1001ad:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1001b0:	8a 53 01             	mov    0x1(%ebx),%dl
  1001b3:	84 d2                	test   %dl,%dl
  1001b5:	75 8e                	jne    100145 <printk+0x35>
  1001b7:	c6 87 60 2a 10 00 00 	movb   $0x0,0x102a60(%edi)
  1001be:	0f be 05 60 2a 10 00 	movsbl 0x102a60,%eax
  1001c5:	bb 60 2a 10 00       	mov    $0x102a60,%ebx
  1001ca:	84 c0                	test   %al,%al
  1001cc:	74 16                	je     1001e4 <printk+0xd4>
  1001ce:	66 90                	xchg   %ax,%ax
  1001d0:	83 ec 0c             	sub    $0xc,%esp
  1001d3:	50                   	push   %eax
  1001d4:	e8 17 07 00 00       	call   1008f0 <putChar>
  1001d9:	43                   	inc    %ebx
  1001da:	0f be 03             	movsbl (%ebx),%eax
  1001dd:	83 c4 10             	add    $0x10,%esp
  1001e0:	84 c0                	test   %al,%al
  1001e2:	75 ec                	jne    1001d0 <printk+0xc0>
  1001e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1001e7:	5b                   	pop    %ebx
  1001e8:	5e                   	pop    %esi
  1001e9:	5f                   	pop    %edi
  1001ea:	5d                   	pop    %ebp
  1001eb:	c3                   	ret    
  1001ec:	8d 70 04             	lea    0x4(%eax),%esi
  1001ef:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1001f2:	8b 08                	mov    (%eax),%ecx
  1001f4:	8d b7 60 2a 10 00    	lea    0x102a60(%edi),%esi
  1001fa:	8a 11                	mov    (%ecx),%dl
  1001fc:	31 c0                	xor    %eax,%eax
  1001fe:	84 d2                	test   %dl,%dl
  100200:	74 a6                	je     1001a8 <printk+0x98>
  100202:	66 90                	xchg   %ax,%ax
  100204:	40                   	inc    %eax
  100205:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  100209:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  10020c:	84 d2                	test   %dl,%dl
  10020e:	75 f4                	jne    100204 <printk+0xf4>
  100210:	01 c7                	add    %eax,%edi
  100212:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100215:	eb 96                	jmp    1001ad <printk+0x9d>
  100217:	90                   	nop
  100218:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10021f:	8d 70 04             	lea    0x4(%eax),%esi
  100222:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  100225:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  100228:	56                   	push   %esi
  100229:	ff 30                	pushl  (%eax)
  10022b:	e8 d0 fd ff ff       	call   100000 <i2A>
  100230:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  100233:	8d b7 60 2a 10 00    	lea    0x102a60(%edi),%esi
  100239:	8a 11                	mov    (%ecx),%dl
  10023b:	83 c4 08             	add    $0x8,%esp
  10023e:	31 c0                	xor    %eax,%eax
  100240:	84 d2                	test   %dl,%dl
  100242:	0f 84 60 ff ff ff    	je     1001a8 <printk+0x98>
  100248:	40                   	inc    %eax
  100249:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  10024d:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  100250:	84 d2                	test   %dl,%dl
  100252:	75 f4                	jne    100248 <printk+0x138>
  100254:	01 c7                	add    %eax,%edi
  100256:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100259:	e9 4f ff ff ff       	jmp    1001ad <printk+0x9d>
  10025e:	66 90                	xchg   %ax,%ax
  100260:	80 fa 63             	cmp    $0x63,%dl
  100263:	0f 85 cb fe ff ff    	jne    100134 <printk+0x24>
  100269:	8b 10                	mov    (%eax),%edx
  10026b:	88 97 60 2a 10 00    	mov    %dl,0x102a60(%edi)
  100271:	83 c0 04             	add    $0x4,%eax
  100274:	47                   	inc    %edi
  100275:	e9 c1 fe ff ff       	jmp    10013b <printk+0x2b>
  10027a:	31 ff                	xor    %edi,%edi
  10027c:	e9 36 ff ff ff       	jmp    1001b7 <printk+0xa7>
  100281:	66 90                	xchg   %ax,%ax
  100283:	90                   	nop

00100284 <abort>:
  100284:	55                   	push   %ebp
  100285:	89 e5                	mov    %esp,%ebp
  100287:	57                   	push   %edi
  100288:	56                   	push   %esi
  100289:	53                   	push   %ebx
  10028a:	83 ec 1c             	sub    $0x1c,%esp
  10028d:	8b 55 08             	mov    0x8(%ebp),%edx
  100290:	fa                   	cli    
  100291:	8a 02                	mov    (%edx),%al
  100293:	b9 12 29 10 00       	mov    $0x102912,%ecx
  100298:	84 c0                	test   %al,%al
  10029a:	74 0b                	je     1002a7 <abort+0x23>
  10029c:	41                   	inc    %ecx
  10029d:	42                   	inc    %edx
  10029e:	88 41 ff             	mov    %al,-0x1(%ecx)
  1002a1:	8a 02                	mov    (%edx),%al
  1002a3:	84 c0                	test   %al,%al
  1002a5:	75 f5                	jne    10029c <abort+0x18>
  1002a7:	c6 01 3a             	movb   $0x3a,(%ecx)
  1002aa:	bb 7d 32 10 00       	mov    $0x10327d,%ebx
  1002af:	be 0a 00 00 00       	mov    $0xa,%esi
  1002b4:	bf 67 66 66 66       	mov    $0x66666667,%edi
  1002b9:	4b                   	dec    %ebx
  1002ba:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002bd:	99                   	cltd   
  1002be:	f7 fe                	idiv   %esi
  1002c0:	8d 42 30             	lea    0x30(%edx),%eax
  1002c3:	88 45 e7             	mov    %al,-0x19(%ebp)
  1002c6:	88 03                	mov    %al,(%ebx)
  1002c8:	89 f8                	mov    %edi,%eax
  1002ca:	f7 6d 0c             	imull  0xc(%ebp)
  1002cd:	c1 fa 02             	sar    $0x2,%edx
  1002d0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002d3:	c1 f8 1f             	sar    $0x1f,%eax
  1002d6:	29 c2                	sub    %eax,%edx
  1002d8:	89 55 0c             	mov    %edx,0xc(%ebp)
  1002db:	75 dc                	jne    1002b9 <abort+0x35>
  1002dd:	41                   	inc    %ecx
  1002de:	41                   	inc    %ecx
  1002df:	43                   	inc    %ebx
  1002e0:	8a 45 e7             	mov    -0x19(%ebp),%al
  1002e3:	88 41 ff             	mov    %al,-0x1(%ecx)
  1002e6:	8a 03                	mov    (%ebx),%al
  1002e8:	88 45 e7             	mov    %al,-0x19(%ebp)
  1002eb:	84 c0                	test   %al,%al
  1002ed:	75 ef                	jne    1002de <abort+0x5a>
  1002ef:	c6 01 0a             	movb   $0xa,(%ecx)
  1002f2:	0f be 05 00 29 10 00 	movsbl 0x102900,%eax
  1002f9:	84 c0                	test   %al,%al
  1002fb:	74 1b                	je     100318 <abort+0x94>
  1002fd:	bb 00 29 10 00       	mov    $0x102900,%ebx
  100302:	83 ec 0c             	sub    $0xc,%esp
  100305:	50                   	push   %eax
  100306:	e8 e5 05 00 00       	call   1008f0 <putChar>
  10030b:	43                   	inc    %ebx
  10030c:	0f be 03             	movsbl (%ebx),%eax
  10030f:	83 c4 10             	add    $0x10,%esp
  100312:	84 c0                	test   %al,%al
  100314:	75 ec                	jne    100302 <abort+0x7e>
  100316:	66 90                	xchg   %ax,%ax
  100318:	f4                   	hlt    
  100319:	eb fd                	jmp    100318 <abort+0x94>
  10031b:	90                   	nop

0010031c <IDLE>:
  10031c:	55                   	push   %ebp
  10031d:	89 e5                	mov    %esp,%ebp
  10031f:	90                   	nop
  100320:	f4                   	hlt    
  100321:	eb fd                	jmp    100320 <IDLE+0x4>
  100323:	90                   	nop

00100324 <put_into_running>:
  100324:	55                   	push   %ebp
  100325:	89 e5                	mov    %esp,%ebp
  100327:	b8 01 00 00 00       	mov    $0x1,%eax
  10032c:	5d                   	pop    %ebp
  10032d:	c3                   	ret    
  10032e:	66 90                	xchg   %ax,%ax

00100330 <update_block>:
  100330:	55                   	push   %ebp
  100331:	89 e5                	mov    %esp,%ebp
  100333:	b8 01 00 00 00       	mov    $0x1,%eax
  100338:	5d                   	pop    %ebp
  100339:	c3                   	ret    
  10033a:	66 90                	xchg   %ax,%ax

0010033c <checkTimeCount>:
  10033c:	a1 a4 32 10 00       	mov    0x1032a4,%eax
  100341:	85 c0                	test   %eax,%eax
  100343:	0f 84 ff 02 00 00    	je     100648 <checkTimeCount+0x30c>
  100349:	55                   	push   %ebp
  10034a:	89 e5                	mov    %esp,%ebp
  10034c:	57                   	push   %edi
  10034d:	56                   	push   %esi
  10034e:	53                   	push   %ebx
  10034f:	83 ec 18             	sub    $0x18,%esp
  100352:	68 90 11 10 00       	push   $0x101190
  100357:	e8 b4 fd ff ff       	call   100110 <printk>
  10035c:	5b                   	pop    %ebx
  10035d:	ff 35 a0 32 10 00    	pushl  0x1032a0
  100363:	68 44 12 10 00       	push   $0x101244
  100368:	6a 21                	push   $0x21
  10036a:	68 96 11 10 00       	push   $0x101196
  10036f:	68 a4 11 10 00       	push   $0x1011a4
  100374:	e8 97 fd ff ff       	call   100110 <printk>
  100379:	83 c4 14             	add    $0x14,%esp
  10037c:	68 be 11 10 00       	push   $0x1011be
  100381:	e8 8a fd ff ff       	call   100110 <printk>
  100386:	c7 04 24 90 11 10 00 	movl   $0x101190,(%esp)
  10038d:	e8 7e fd ff ff       	call   100110 <printk>
  100392:	5e                   	pop    %esi
  100393:	a1 a0 32 10 00       	mov    0x1032a0,%eax
  100398:	89 c2                	mov    %eax,%edx
  10039a:	c1 e2 07             	shl    $0x7,%edx
  10039d:	01 c2                	add    %eax,%edx
  10039f:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1003a2:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1003a5:	ff 34 85 00 53 10 00 	pushl  0x105300(,%eax,4)
  1003ac:	68 44 12 10 00       	push   $0x101244
  1003b1:	6a 22                	push   $0x22
  1003b3:	68 96 11 10 00       	push   $0x101196
  1003b8:	68 f8 11 10 00       	push   $0x1011f8
  1003bd:	e8 4e fd ff ff       	call   100110 <printk>
  1003c2:	83 c4 14             	add    $0x14,%esp
  1003c5:	68 be 11 10 00       	push   $0x1011be
  1003ca:	e8 41 fd ff ff       	call   100110 <printk>
  1003cf:	8b 15 a0 32 10 00    	mov    0x1032a0,%edx
  1003d5:	89 d0                	mov    %edx,%eax
  1003d7:	c1 e0 07             	shl    $0x7,%eax
  1003da:	01 d0                	add    %edx,%eax
  1003dc:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1003df:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1003e2:	c1 e0 02             	shl    $0x2,%eax
  1003e5:	8d 98 c0 32 10 00    	lea    0x1032c0(%eax),%ebx
  1003eb:	8b 8b 40 20 00 00    	mov    0x2040(%ebx),%ecx
  1003f1:	83 c4 10             	add    $0x10,%esp
  1003f4:	85 c9                	test   %ecx,%ecx
  1003f6:	7e 24                	jle    10041c <checkTimeCount+0xe0>
  1003f8:	89 d0                	mov    %edx,%eax
  1003fa:	c1 e0 07             	shl    $0x7,%eax
  1003fd:	01 d0                	add    %edx,%eax
  1003ff:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100402:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100405:	49                   	dec    %ecx
  100406:	89 0c 85 00 53 10 00 	mov    %ecx,0x105300(,%eax,4)
  10040d:	b8 01 00 00 00       	mov    $0x1,%eax
  100412:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100415:	5b                   	pop    %ebx
  100416:	5e                   	pop    %esi
  100417:	5f                   	pop    %edi
  100418:	5d                   	pop    %ebp
  100419:	c3                   	ret    
  10041a:	66 90                	xchg   %ax,%ax
  10041c:	05 c0 52 10 00       	add    $0x1052c0,%eax
  100421:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100426:	89 c7                	mov    %eax,%edi
  100428:	8b 75 08             	mov    0x8(%ebp),%esi
  10042b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10042d:	a1 04 2a 10 00       	mov    0x102a04,%eax
  100432:	83 f8 ff             	cmp    $0xffffffff,%eax
  100435:	0f 84 f5 01 00 00    	je     100630 <checkTimeCount+0x2f4>
  10043b:	89 c1                	mov    %eax,%ecx
  10043d:	c1 e1 07             	shl    $0x7,%ecx
  100440:	01 c1                	add    %eax,%ecx
  100442:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  100445:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  100448:	8d 0c 8d c0 32 10 00 	lea    0x1032c0(,%ecx,4),%ecx
  10044f:	8b b1 4c 20 00 00    	mov    0x204c(%ecx),%esi
  100455:	89 b3 4c 20 00 00    	mov    %esi,0x204c(%ebx)
  10045b:	89 83 50 20 00 00    	mov    %eax,0x2050(%ebx)
  100461:	89 91 4c 20 00 00    	mov    %edx,0x204c(%ecx)
  100467:	89 d0                	mov    %edx,%eax
  100469:	c1 e0 07             	shl    $0x7,%eax
  10046c:	01 d0                	add    %edx,%eax
  10046e:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100471:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100474:	8d 04 85 c0 32 10 00 	lea    0x1032c0(,%eax,4),%eax
  10047b:	c7 80 3c 20 00 00 01 	movl   $0x1,0x203c(%eax)
  100482:	00 00 00 
  100485:	c7 80 40 20 00 00 0a 	movl   $0xa,0x2040(%eax)
  10048c:	00 00 00 
  10048f:	4a                   	dec    %edx
  100490:	74 12                	je     1004a4 <checkTimeCount+0x168>
  100492:	83 ec 08             	sub    $0x8,%esp
  100495:	6a 2b                	push   $0x2b
  100497:	68 96 11 10 00       	push   $0x101196
  10049c:	e8 e3 fd ff ff       	call   100284 <abort>
  1004a1:	83 c4 10             	add    $0x10,%esp
  1004a4:	83 ec 0c             	sub    $0xc,%esp
  1004a7:	68 90 11 10 00       	push   $0x101190
  1004ac:	e8 5f fc ff ff       	call   100110 <printk>
  1004b1:	5a                   	pop    %edx
  1004b2:	ff 35 a0 32 10 00    	pushl  0x1032a0
  1004b8:	68 44 12 10 00       	push   $0x101244
  1004bd:	6a 2c                	push   $0x2c
  1004bf:	68 96 11 10 00       	push   $0x101196
  1004c4:	68 18 12 10 00       	push   $0x101218
  1004c9:	e8 42 fc ff ff       	call   100110 <printk>
  1004ce:	83 c4 14             	add    $0x14,%esp
  1004d1:	68 be 11 10 00       	push   $0x1011be
  1004d6:	e8 35 fc ff ff       	call   100110 <printk>
  1004db:	c7 04 24 90 11 10 00 	movl   $0x101190,(%esp)
  1004e2:	e8 29 fc ff ff       	call   100110 <printk>
  1004e7:	59                   	pop    %ecx
  1004e8:	a1 a0 32 10 00       	mov    0x1032a0,%eax
  1004ed:	89 c2                	mov    %eax,%edx
  1004ef:	c1 e2 07             	shl    $0x7,%edx
  1004f2:	01 c2                	add    %eax,%edx
  1004f4:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1004f7:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1004fa:	ff 34 85 e8 52 10 00 	pushl  0x1052e8(,%eax,4)
  100501:	68 44 12 10 00       	push   $0x101244
  100506:	6a 2e                	push   $0x2e
  100508:	68 96 11 10 00       	push   $0x101196
  10050d:	68 c4 11 10 00       	push   $0x1011c4
  100512:	e8 f9 fb ff ff       	call   100110 <printk>
  100517:	83 c4 14             	add    $0x14,%esp
  10051a:	68 be 11 10 00       	push   $0x1011be
  10051f:	e8 ec fb ff ff       	call   100110 <printk>
  100524:	a1 04 2a 10 00       	mov    0x102a04,%eax
  100529:	83 c4 10             	add    $0x10,%esp
  10052c:	83 f8 ff             	cmp    $0xffffffff,%eax
  10052f:	0f 84 1b 01 00 00    	je     100650 <checkTimeCount+0x314>
  100535:	89 c2                	mov    %eax,%edx
  100537:	c1 e2 07             	shl    $0x7,%edx
  10053a:	01 c2                	add    %eax,%edx
  10053c:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10053f:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100542:	8d 0c 95 c0 32 10 00 	lea    0x1032c0(,%edx,4),%ecx
  100549:	8b 91 50 20 00 00    	mov    0x2050(%ecx),%edx
  10054f:	39 d0                	cmp    %edx,%eax
  100551:	0f 84 05 01 00 00    	je     10065c <checkTimeCount+0x320>
  100557:	8b 89 4c 20 00 00    	mov    0x204c(%ecx),%ecx
  10055d:	89 cb                	mov    %ecx,%ebx
  10055f:	c1 e3 07             	shl    $0x7,%ebx
  100562:	01 cb                	add    %ecx,%ebx
  100564:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx
  100567:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx
  10056a:	89 14 9d 10 53 10 00 	mov    %edx,0x105310(,%ebx,4)
  100571:	89 d3                	mov    %edx,%ebx
  100573:	c1 e3 07             	shl    $0x7,%ebx
  100576:	01 d3                	add    %edx,%ebx
  100578:	8d 1c 9a             	lea    (%edx,%ebx,4),%ebx
  10057b:	8d 1c 9a             	lea    (%edx,%ebx,4),%ebx
  10057e:	89 0c 9d 0c 53 10 00 	mov    %ecx,0x10530c(,%ebx,4)
  100585:	89 15 04 2a 10 00    	mov    %edx,0x102a04
  10058b:	a3 a0 32 10 00       	mov    %eax,0x1032a0
  100590:	83 ec 0c             	sub    $0xc,%esp
  100593:	68 90 11 10 00       	push   $0x101190
  100598:	e8 73 fb ff ff       	call   100110 <printk>
  10059d:	58                   	pop    %eax
  10059e:	ff 35 a0 32 10 00    	pushl  0x1032a0
  1005a4:	68 44 12 10 00       	push   $0x101244
  1005a9:	6a 30                	push   $0x30
  1005ab:	68 96 11 10 00       	push   $0x101196
  1005b0:	68 de 11 10 00       	push   $0x1011de
  1005b5:	e8 56 fb ff ff       	call   100110 <printk>
  1005ba:	83 c4 14             	add    $0x14,%esp
  1005bd:	68 be 11 10 00       	push   $0x1011be
  1005c2:	e8 49 fb ff ff       	call   100110 <printk>
  1005c7:	a1 a0 32 10 00       	mov    0x1032a0,%eax
  1005cc:	83 c4 10             	add    $0x10,%esp
  1005cf:	83 f8 02             	cmp    $0x2,%eax
  1005d2:	74 17                	je     1005eb <checkTimeCount+0x2af>
  1005d4:	83 ec 08             	sub    $0x8,%esp
  1005d7:	6a 31                	push   $0x31
  1005d9:	68 96 11 10 00       	push   $0x101196
  1005de:	e8 a1 fc ff ff       	call   100284 <abort>
  1005e3:	a1 a0 32 10 00       	mov    0x1032a0,%eax
  1005e8:	83 c4 10             	add    $0x10,%esp
  1005eb:	89 c2                	mov    %eax,%edx
  1005ed:	c1 e2 07             	shl    $0x7,%edx
  1005f0:	01 c2                	add    %eax,%edx
  1005f2:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1005f5:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1005f8:	c7 04 95 e8 52 10 00 	movl   $0x200088,0x1052e8(,%edx,4)
  1005ff:	88 00 20 00 
  100603:	83 ec 0c             	sub    $0xc,%esp
  100606:	50                   	push   %eax
  100607:	e8 c8 06 00 00       	call   100cd4 <enterUserSpace_pcb>
  10060c:	8b 15 a0 32 10 00    	mov    0x1032a0,%edx
  100612:	89 d0                	mov    %edx,%eax
  100614:	c1 e0 07             	shl    $0x7,%eax
  100617:	01 d0                	add    %edx,%eax
  100619:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10061c:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10061f:	8b 0c 85 00 53 10 00 	mov    0x105300(,%eax,4),%ecx
  100626:	83 c4 10             	add    $0x10,%esp
  100629:	e9 ca fd ff ff       	jmp    1003f8 <checkTimeCount+0xbc>
  10062e:	66 90                	xchg   %ax,%ax
  100630:	89 15 04 2a 10 00    	mov    %edx,0x102a04
  100636:	89 93 4c 20 00 00    	mov    %edx,0x204c(%ebx)
  10063c:	89 93 50 20 00 00    	mov    %edx,0x2050(%ebx)
  100642:	e9 20 fe ff ff       	jmp    100467 <checkTimeCount+0x12b>
  100647:	90                   	nop
  100648:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10064d:	c3                   	ret    
  10064e:	66 90                	xchg   %ax,%ax
  100650:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100655:	e9 31 ff ff ff       	jmp    10058b <checkTimeCount+0x24f>
  10065a:	66 90                	xchg   %ax,%ax
  10065c:	c7 05 04 2a 10 00 ff 	movl   $0xffffffff,0x102a04
  100663:	ff ff ff 
  100666:	e9 20 ff ff ff       	jmp    10058b <checkTimeCount+0x24f>
  10066b:	90                   	nop

0010066c <transfer_pid_state>:
  10066c:	55                   	push   %ebp
  10066d:	89 e5                	mov    %esp,%ebp
  10066f:	b8 01 00 00 00       	mov    $0x1,%eax
  100674:	5d                   	pop    %ebp
  100675:	c3                   	ret    
  100676:	66 90                	xchg   %ax,%ax

00100678 <apply_new_pid>:
  100678:	55                   	push   %ebp
  100679:	89 e5                	mov    %esp,%ebp
  10067b:	b8 02 00 00 00       	mov    $0x2,%eax
  100680:	5d                   	pop    %ebp
  100681:	c3                   	ret    
  100682:	66 90                	xchg   %ax,%ax

00100684 <getpid>:
  100684:	55                   	push   %ebp
  100685:	89 e5                	mov    %esp,%ebp
  100687:	a1 a0 32 10 00       	mov    0x1032a0,%eax
  10068c:	5d                   	pop    %ebp
  10068d:	c3                   	ret    
  10068e:	66 90                	xchg   %ax,%ax

00100690 <transfer_pid_mode>:
  100690:	55                   	push   %ebp
  100691:	89 e5                	mov    %esp,%ebp
  100693:	b8 01 00 00 00       	mov    $0x1,%eax
  100698:	5d                   	pop    %ebp
  100699:	c3                   	ret    
  10069a:	66 90                	xchg   %ax,%ax

0010069c <get_from_runnable>:
  10069c:	a1 04 2a 10 00       	mov    0x102a04,%eax
  1006a1:	83 f8 ff             	cmp    $0xffffffff,%eax
  1006a4:	74 66                	je     10070c <get_from_runnable+0x70>
  1006a6:	89 c2                	mov    %eax,%edx
  1006a8:	c1 e2 07             	shl    $0x7,%edx
  1006ab:	01 c2                	add    %eax,%edx
  1006ad:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1006b0:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1006b3:	8d 0c 95 c0 32 10 00 	lea    0x1032c0(,%edx,4),%ecx
  1006ba:	8b 91 50 20 00 00    	mov    0x2050(%ecx),%edx
  1006c0:	39 d0                	cmp    %edx,%eax
  1006c2:	74 3c                	je     100700 <get_from_runnable+0x64>
  1006c4:	55                   	push   %ebp
  1006c5:	89 e5                	mov    %esp,%ebp
  1006c7:	53                   	push   %ebx
  1006c8:	8b 89 4c 20 00 00    	mov    0x204c(%ecx),%ecx
  1006ce:	89 cb                	mov    %ecx,%ebx
  1006d0:	c1 e3 07             	shl    $0x7,%ebx
  1006d3:	01 cb                	add    %ecx,%ebx
  1006d5:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx
  1006d8:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx
  1006db:	89 14 9d 10 53 10 00 	mov    %edx,0x105310(,%ebx,4)
  1006e2:	89 d3                	mov    %edx,%ebx
  1006e4:	c1 e3 07             	shl    $0x7,%ebx
  1006e7:	01 d3                	add    %edx,%ebx
  1006e9:	8d 1c 9a             	lea    (%edx,%ebx,4),%ebx
  1006ec:	8d 1c 9a             	lea    (%edx,%ebx,4),%ebx
  1006ef:	89 0c 9d 0c 53 10 00 	mov    %ecx,0x10530c(,%ebx,4)
  1006f6:	89 15 04 2a 10 00    	mov    %edx,0x102a04
  1006fc:	5b                   	pop    %ebx
  1006fd:	5d                   	pop    %ebp
  1006fe:	c3                   	ret    
  1006ff:	90                   	nop
  100700:	c7 05 04 2a 10 00 ff 	movl   $0xffffffff,0x102a04
  100707:	ff ff ff 
  10070a:	c3                   	ret    
  10070b:	90                   	nop
  10070c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100711:	c3                   	ret    
  100712:	66 90                	xchg   %ax,%ax

00100714 <put_into_runnable>:
  100714:	55                   	push   %ebp
  100715:	89 e5                	mov    %esp,%ebp
  100717:	56                   	push   %esi
  100718:	53                   	push   %ebx
  100719:	8b 45 08             	mov    0x8(%ebp),%eax
  10071c:	8b 15 04 2a 10 00    	mov    0x102a04,%edx
  100722:	83 fa ff             	cmp    $0xffffffff,%edx
  100725:	74 71                	je     100798 <put_into_runnable+0x84>
  100727:	89 d1                	mov    %edx,%ecx
  100729:	c1 e1 07             	shl    $0x7,%ecx
  10072c:	01 d1                	add    %edx,%ecx
  10072e:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100731:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100734:	8d 1c 8d c0 32 10 00 	lea    0x1032c0(,%ecx,4),%ebx
  10073b:	89 c1                	mov    %eax,%ecx
  10073d:	c1 e1 07             	shl    $0x7,%ecx
  100740:	01 c1                	add    %eax,%ecx
  100742:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  100745:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  100748:	8d 0c 8d c0 32 10 00 	lea    0x1032c0(,%ecx,4),%ecx
  10074f:	8b b3 4c 20 00 00    	mov    0x204c(%ebx),%esi
  100755:	89 b1 4c 20 00 00    	mov    %esi,0x204c(%ecx)
  10075b:	89 91 50 20 00 00    	mov    %edx,0x2050(%ecx)
  100761:	89 83 4c 20 00 00    	mov    %eax,0x204c(%ebx)
  100767:	89 c2                	mov    %eax,%edx
  100769:	c1 e2 07             	shl    $0x7,%edx
  10076c:	01 c2                	add    %eax,%edx
  10076e:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100771:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100774:	8d 04 85 c0 32 10 00 	lea    0x1032c0(,%eax,4),%eax
  10077b:	c7 80 3c 20 00 00 01 	movl   $0x1,0x203c(%eax)
  100782:	00 00 00 
  100785:	c7 80 40 20 00 00 0a 	movl   $0xa,0x2040(%eax)
  10078c:	00 00 00 
  10078f:	b8 01 00 00 00       	mov    $0x1,%eax
  100794:	5b                   	pop    %ebx
  100795:	5e                   	pop    %esi
  100796:	5d                   	pop    %ebp
  100797:	c3                   	ret    
  100798:	a3 04 2a 10 00       	mov    %eax,0x102a04
  10079d:	89 c2                	mov    %eax,%edx
  10079f:	c1 e2 07             	shl    $0x7,%edx
  1007a2:	01 c2                	add    %eax,%edx
  1007a4:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1007a7:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1007aa:	8d 14 95 c0 32 10 00 	lea    0x1032c0(,%edx,4),%edx
  1007b1:	89 82 4c 20 00 00    	mov    %eax,0x204c(%edx)
  1007b7:	89 82 50 20 00 00    	mov    %eax,0x2050(%edx)
  1007bd:	eb a8                	jmp    100767 <put_into_runnable+0x53>
  1007bf:	90                   	nop

001007c0 <put_into_block>:
  1007c0:	55                   	push   %ebp
  1007c1:	89 e5                	mov    %esp,%ebp
  1007c3:	56                   	push   %esi
  1007c4:	53                   	push   %ebx
  1007c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1007c8:	8b 15 00 2a 10 00    	mov    0x102a00,%edx
  1007ce:	89 d1                	mov    %edx,%ecx
  1007d0:	c1 e1 07             	shl    $0x7,%ecx
  1007d3:	01 d1                	add    %edx,%ecx
  1007d5:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  1007d8:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  1007db:	8d 1c 8d c0 32 10 00 	lea    0x1032c0(,%ecx,4),%ebx
  1007e2:	89 c1                	mov    %eax,%ecx
  1007e4:	c1 e1 07             	shl    $0x7,%ecx
  1007e7:	01 c1                	add    %eax,%ecx
  1007e9:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  1007ec:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  1007ef:	8d 0c 8d c0 32 10 00 	lea    0x1032c0(,%ecx,4),%ecx
  1007f6:	8b b3 4c 20 00 00    	mov    0x204c(%ebx),%esi
  1007fc:	89 b1 4c 20 00 00    	mov    %esi,0x204c(%ecx)
  100802:	89 91 50 20 00 00    	mov    %edx,0x2050(%ecx)
  100808:	89 83 4c 20 00 00    	mov    %eax,0x204c(%ebx)
  10080e:	c7 81 3c 20 00 00 00 	movl   $0x0,0x203c(%ecx)
  100815:	00 00 00 
  100818:	b8 01 00 00 00       	mov    $0x1,%eax
  10081d:	5b                   	pop    %ebx
  10081e:	5e                   	pop    %esi
  10081f:	5d                   	pop    %ebp
  100820:	c3                   	ret    
  100821:	8d 76 00             	lea    0x0(%esi),%esi

00100824 <init_pcb>:
  100824:	55                   	push   %ebp
  100825:	89 e5                	mov    %esp,%ebp
  100827:	ba 08 53 10 00       	mov    $0x105308,%edx
  10082c:	31 c0                	xor    %eax,%eax
  10082e:	66 90                	xchg   %ax,%ax
  100830:	89 02                	mov    %eax,(%edx)
  100832:	8d 48 ff             	lea    -0x1(%eax),%ecx
  100835:	89 4a 04             	mov    %ecx,0x4(%edx)
  100838:	40                   	inc    %eax
  100839:	89 42 08             	mov    %eax,0x8(%edx)
  10083c:	81 c2 54 20 00 00    	add    $0x2054,%edx
  100842:	3d 00 08 00 00       	cmp    $0x800,%eax
  100847:	75 e7                	jne    100830 <init_pcb+0xc>
  100849:	c7 05 0c 53 10 00 ff 	movl   $0x7ff,0x10530c
  100850:	07 00 00 
  100853:	c7 05 bc d2 12 01 00 	movl   $0x0,0x112d2bc
  10085a:	00 00 00 
  10085d:	c7 05 04 2a 10 00 ff 	movl   $0xffffffff,0x102a04
  100864:	ff ff ff 
  100867:	c7 05 00 2a 10 00 00 	movl   $0x0,0x102a00
  10086e:	00 00 00 
  100871:	c7 05 a0 32 10 00 01 	movl   $0x1,0x1032a0
  100878:	00 00 00 
  10087b:	5d                   	pop    %ebp
  10087c:	c3                   	ret    
  10087d:	8d 76 00             	lea    0x0(%esi),%esi

00100880 <init_kernel_pcb>:
  100880:	55                   	push   %ebp
  100881:	89 e5                	mov    %esp,%ebp
  100883:	8b 45 08             	mov    0x8(%ebp),%eax
  100886:	a3 f8 52 10 00       	mov    %eax,0x1052f8
  10088b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10088e:	a3 f4 52 10 00       	mov    %eax,0x1052f4
  100893:	c7 05 fc 52 10 00 02 	movl   $0x2,0x1052fc
  10089a:	00 00 00 
  10089d:	c7 05 e8 52 10 00 1c 	movl   $0x10031c,0x1052e8
  1008a4:	03 10 00 
  1008a7:	b8 01 00 00 00       	mov    $0x1,%eax
  1008ac:	5d                   	pop    %ebp
  1008ad:	c3                   	ret    
  1008ae:	66 90                	xchg   %ax,%ax

001008b0 <initSerial>:
  1008b0:	55                   	push   %ebp
  1008b1:	89 e5                	mov    %esp,%ebp
  1008b3:	ba f9 03 00 00       	mov    $0x3f9,%edx
  1008b8:	31 c0                	xor    %eax,%eax
  1008ba:	ee                   	out    %al,(%dx)
  1008bb:	ba fb 03 00 00       	mov    $0x3fb,%edx
  1008c0:	b0 80                	mov    $0x80,%al
  1008c2:	ee                   	out    %al,(%dx)
  1008c3:	ba f8 03 00 00       	mov    $0x3f8,%edx
  1008c8:	b0 01                	mov    $0x1,%al
  1008ca:	ee                   	out    %al,(%dx)
  1008cb:	ba f9 03 00 00       	mov    $0x3f9,%edx
  1008d0:	31 c0                	xor    %eax,%eax
  1008d2:	ee                   	out    %al,(%dx)
  1008d3:	ba fb 03 00 00       	mov    $0x3fb,%edx
  1008d8:	b0 03                	mov    $0x3,%al
  1008da:	ee                   	out    %al,(%dx)
  1008db:	ba fa 03 00 00       	mov    $0x3fa,%edx
  1008e0:	b0 c7                	mov    $0xc7,%al
  1008e2:	ee                   	out    %al,(%dx)
  1008e3:	ba fc 03 00 00       	mov    $0x3fc,%edx
  1008e8:	b0 0b                	mov    $0xb,%al
  1008ea:	ee                   	out    %al,(%dx)
  1008eb:	5d                   	pop    %ebp
  1008ec:	c3                   	ret    
  1008ed:	8d 76 00             	lea    0x0(%esi),%esi

001008f0 <putChar>:
  1008f0:	55                   	push   %ebp
  1008f1:	89 e5                	mov    %esp,%ebp
  1008f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1008f6:	ba fd 03 00 00       	mov    $0x3fd,%edx
  1008fb:	90                   	nop
  1008fc:	ec                   	in     (%dx),%al
  1008fd:	a8 20                	test   $0x20,%al
  1008ff:	74 fb                	je     1008fc <putChar+0xc>
  100901:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100906:	88 c8                	mov    %cl,%al
  100908:	ee                   	out    %al,(%dx)
  100909:	5d                   	pop    %ebp
  10090a:	c3                   	ret    
  10090b:	90                   	nop

0010090c <syscallHandle>:
  10090c:	55                   	push   %ebp
  10090d:	89 e5                	mov    %esp,%ebp
  10090f:	53                   	push   %ebx
  100910:	83 ec 10             	sub    $0x10,%esp
  100913:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100916:	68 90 11 10 00       	push   $0x101190
  10091b:	e8 f0 f7 ff ff       	call   100110 <printk>
  100920:	58                   	pop    %eax
  100921:	ff 73 20             	pushl  0x20(%ebx)
  100924:	68 b0 12 10 00       	push   $0x1012b0
  100929:	6a 31                	push   $0x31
  10092b:	68 53 12 10 00       	push   $0x101253
  100930:	68 66 12 10 00       	push   $0x101266
  100935:	e8 d6 f7 ff ff       	call   100110 <printk>
  10093a:	83 c4 14             	add    $0x14,%esp
  10093d:	68 be 11 10 00       	push   $0x1011be
  100942:	e8 c9 f7 ff ff       	call   100110 <printk>
  100947:	83 c4 10             	add    $0x10,%esp
  10094a:	8b 43 1c             	mov    0x1c(%ebx),%eax
  10094d:	83 f8 02             	cmp    $0x2,%eax
  100950:	74 12                	je     100964 <syscallHandle+0x58>
  100952:	83 f8 04             	cmp    $0x4,%eax
  100955:	75 1c                	jne    100973 <syscallHandle+0x67>
  100957:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10095a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10095d:	c9                   	leave  
  10095e:	e9 11 07 00 00       	jmp    101074 <sys_write>
  100963:	90                   	nop
  100964:	83 ec 0c             	sub    $0xc,%esp
  100967:	53                   	push   %ebx
  100968:	e8 5f 07 00 00       	call   1010cc <sys_fork>
  10096d:	89 43 1c             	mov    %eax,0x1c(%ebx)
  100970:	83 c4 10             	add    $0x10,%esp
  100973:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100976:	c9                   	leave  
  100977:	c3                   	ret    

00100978 <GProtectFaultHandle>:
  100978:	55                   	push   %ebp
  100979:	89 e5                	mov    %esp,%ebp
  10097b:	83 ec 14             	sub    $0x14,%esp
  10097e:	68 90 11 10 00       	push   $0x101190
  100983:	e8 88 f7 ff ff       	call   100110 <printk>
  100988:	58                   	pop    %eax
  100989:	8b 45 08             	mov    0x8(%ebp),%eax
  10098c:	ff 70 20             	pushl  0x20(%eax)
  10098f:	68 9c 12 10 00       	push   $0x10129c
  100994:	6a 49                	push   $0x49
  100996:	68 53 12 10 00       	push   $0x101253
  10099b:	68 83 12 10 00       	push   $0x101283
  1009a0:	e8 6b f7 ff ff       	call   100110 <printk>
  1009a5:	83 c4 14             	add    $0x14,%esp
  1009a8:	68 be 11 10 00       	push   $0x1011be
  1009ad:	e8 5e f7 ff ff       	call   100110 <printk>
  1009b2:	5a                   	pop    %edx
  1009b3:	59                   	pop    %ecx
  1009b4:	6a 4a                	push   $0x4a
  1009b6:	68 53 12 10 00       	push   $0x101253
  1009bb:	e8 c4 f8 ff ff       	call   100284 <abort>
  1009c0:	83 c4 10             	add    $0x10,%esp
  1009c3:	c9                   	leave  
  1009c4:	c3                   	ret    
  1009c5:	8d 76 00             	lea    0x0(%esi),%esi

001009c8 <irqHandle>:
  1009c8:	55                   	push   %ebp
  1009c9:	89 e5                	mov    %esp,%ebp
  1009cb:	83 ec 08             	sub    $0x8,%esp
  1009ce:	8b 55 08             	mov    0x8(%ebp),%edx
  1009d1:	fa                   	cli    
  1009d2:	8b 42 20             	mov    0x20(%edx),%eax
  1009d5:	83 f8 0d             	cmp    $0xd,%eax
  1009d8:	74 52                	je     100a2c <irqHandle+0x64>
  1009da:	7e 38                	jle    100a14 <irqHandle+0x4c>
  1009dc:	83 f8 20             	cmp    $0x20,%eax
  1009df:	74 17                	je     1009f8 <irqHandle+0x30>
  1009e1:	83 c0 80             	add    $0xffffff80,%eax
  1009e4:	75 31                	jne    100a17 <irqHandle+0x4f>
  1009e6:	83 ec 0c             	sub    $0xc,%esp
  1009e9:	52                   	push   %edx
  1009ea:	e8 1d ff ff ff       	call   10090c <syscallHandle>
  1009ef:	83 c4 10             	add    $0x10,%esp
  1009f2:	fb                   	sti    
  1009f3:	c9                   	leave  
  1009f4:	c3                   	ret    
  1009f5:	8d 76 00             	lea    0x0(%esi),%esi
  1009f8:	83 ec 0c             	sub    $0xc,%esp
  1009fb:	52                   	push   %edx
  1009fc:	e8 3b f9 ff ff       	call   10033c <checkTimeCount>
  100a01:	c7 04 24 41 00 00 00 	movl   $0x41,(%esp)
  100a08:	e8 e3 fe ff ff       	call   1008f0 <putChar>
  100a0d:	83 c4 10             	add    $0x10,%esp
  100a10:	eb e0                	jmp    1009f2 <irqHandle+0x2a>
  100a12:	66 90                	xchg   %ax,%ax
  100a14:	40                   	inc    %eax
  100a15:	74 db                	je     1009f2 <irqHandle+0x2a>
  100a17:	83 ec 08             	sub    $0x8,%esp
  100a1a:	6a 24                	push   $0x24
  100a1c:	68 53 12 10 00       	push   $0x101253
  100a21:	e8 5e f8 ff ff       	call   100284 <abort>
  100a26:	83 c4 10             	add    $0x10,%esp
  100a29:	eb c7                	jmp    1009f2 <irqHandle+0x2a>
  100a2b:	90                   	nop
  100a2c:	83 ec 0c             	sub    $0xc,%esp
  100a2f:	52                   	push   %edx
  100a30:	e8 43 ff ff ff       	call   100978 <GProtectFaultHandle>
  100a35:	83 c4 10             	add    $0x10,%esp
  100a38:	eb b8                	jmp    1009f2 <irqHandle+0x2a>
  100a3a:	66 90                	xchg   %ax,%ax

00100a3c <timeHandle>:
  100a3c:	55                   	push   %ebp
  100a3d:	89 e5                	mov    %esp,%ebp
  100a3f:	83 ec 14             	sub    $0x14,%esp
  100a42:	ff 75 08             	pushl  0x8(%ebp)
  100a45:	e8 f2 f8 ff ff       	call   10033c <checkTimeCount>
  100a4a:	83 c4 10             	add    $0x10,%esp
  100a4d:	c7 45 08 41 00 00 00 	movl   $0x41,0x8(%ebp)
  100a54:	c9                   	leave  
  100a55:	e9 96 fe ff ff       	jmp    1008f0 <putChar>
  100a5a:	66 90                	xchg   %ax,%ax

00100a5c <initIntr>:
  100a5c:	55                   	push   %ebp
  100a5d:	89 e5                	mov    %esp,%ebp
  100a5f:	ba 21 00 00 00       	mov    $0x21,%edx
  100a64:	b0 ff                	mov    $0xff,%al
  100a66:	ee                   	out    %al,(%dx)
  100a67:	ba a1 00 00 00       	mov    $0xa1,%edx
  100a6c:	ee                   	out    %al,(%dx)
  100a6d:	ba 20 00 00 00       	mov    $0x20,%edx
  100a72:	b0 11                	mov    $0x11,%al
  100a74:	ee                   	out    %al,(%dx)
  100a75:	ba 21 00 00 00       	mov    $0x21,%edx
  100a7a:	b0 20                	mov    $0x20,%al
  100a7c:	ee                   	out    %al,(%dx)
  100a7d:	b0 04                	mov    $0x4,%al
  100a7f:	ee                   	out    %al,(%dx)
  100a80:	b0 03                	mov    $0x3,%al
  100a82:	ee                   	out    %al,(%dx)
  100a83:	ba a0 00 00 00       	mov    $0xa0,%edx
  100a88:	b0 11                	mov    $0x11,%al
  100a8a:	ee                   	out    %al,(%dx)
  100a8b:	ba a1 00 00 00       	mov    $0xa1,%edx
  100a90:	b0 28                	mov    $0x28,%al
  100a92:	ee                   	out    %al,(%dx)
  100a93:	b0 02                	mov    $0x2,%al
  100a95:	ee                   	out    %al,(%dx)
  100a96:	b0 03                	mov    $0x3,%al
  100a98:	ee                   	out    %al,(%dx)
  100a99:	ba 20 00 00 00       	mov    $0x20,%edx
  100a9e:	b0 68                	mov    $0x68,%al
  100aa0:	ee                   	out    %al,(%dx)
  100aa1:	b0 0a                	mov    $0xa,%al
  100aa3:	ee                   	out    %al,(%dx)
  100aa4:	ba a0 00 00 00       	mov    $0xa0,%edx
  100aa9:	b0 68                	mov    $0x68,%al
  100aab:	ee                   	out    %al,(%dx)
  100aac:	b0 0a                	mov    $0xa,%al
  100aae:	ee                   	out    %al,(%dx)
  100aaf:	5d                   	pop    %ebp
  100ab0:	c3                   	ret    
  100ab1:	8d 76 00             	lea    0x0(%esi),%esi

00100ab4 <initTimer>:
  100ab4:	55                   	push   %ebp
  100ab5:	89 e5                	mov    %esp,%ebp
  100ab7:	ba 43 00 00 00       	mov    $0x43,%edx
  100abc:	b0 34                	mov    $0x34,%al
  100abe:	ee                   	out    %al,(%dx)
  100abf:	ba 40 00 00 00       	mov    $0x40,%edx
  100ac4:	b0 9b                	mov    $0x9b,%al
  100ac6:	ee                   	out    %al,(%dx)
  100ac7:	b0 2e                	mov    $0x2e,%al
  100ac9:	ee                   	out    %al,(%dx)
  100aca:	5d                   	pop    %ebp
  100acb:	c3                   	ret    

00100acc <waitDisk>:
  100acc:	55                   	push   %ebp
  100acd:	89 e5                	mov    %esp,%ebp
  100acf:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100ad4:	ec                   	in     (%dx),%al
  100ad5:	83 e0 c0             	and    $0xffffffc0,%eax
  100ad8:	3c 40                	cmp    $0x40,%al
  100ada:	75 f8                	jne    100ad4 <waitDisk+0x8>
  100adc:	5d                   	pop    %ebp
  100add:	c3                   	ret    
  100ade:	66 90                	xchg   %ax,%ax

00100ae0 <readSect>:
  100ae0:	55                   	push   %ebp
  100ae1:	89 e5                	mov    %esp,%ebp
  100ae3:	53                   	push   %ebx
  100ae4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100ae7:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100aec:	ec                   	in     (%dx),%al
  100aed:	83 e0 c0             	and    $0xffffffc0,%eax
  100af0:	3c 40                	cmp    $0x40,%al
  100af2:	75 f8                	jne    100aec <readSect+0xc>
  100af4:	ba f2 01 00 00       	mov    $0x1f2,%edx
  100af9:	b0 01                	mov    $0x1,%al
  100afb:	ee                   	out    %al,(%dx)
  100afc:	ba f3 01 00 00       	mov    $0x1f3,%edx
  100b01:	88 c8                	mov    %cl,%al
  100b03:	ee                   	out    %al,(%dx)
  100b04:	89 c8                	mov    %ecx,%eax
  100b06:	c1 f8 08             	sar    $0x8,%eax
  100b09:	ba f4 01 00 00       	mov    $0x1f4,%edx
  100b0e:	ee                   	out    %al,(%dx)
  100b0f:	89 c8                	mov    %ecx,%eax
  100b11:	c1 f8 10             	sar    $0x10,%eax
  100b14:	ba f5 01 00 00       	mov    $0x1f5,%edx
  100b19:	ee                   	out    %al,(%dx)
  100b1a:	89 c8                	mov    %ecx,%eax
  100b1c:	c1 f8 18             	sar    $0x18,%eax
  100b1f:	83 c8 e0             	or     $0xffffffe0,%eax
  100b22:	ba f6 01 00 00       	mov    $0x1f6,%edx
  100b27:	ee                   	out    %al,(%dx)
  100b28:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100b2d:	b0 20                	mov    $0x20,%al
  100b2f:	ee                   	out    %al,(%dx)
  100b30:	ec                   	in     (%dx),%al
  100b31:	83 e0 c0             	and    $0xffffffc0,%eax
  100b34:	3c 40                	cmp    $0x40,%al
  100b36:	75 f8                	jne    100b30 <readSect+0x50>
  100b38:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100b3b:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  100b41:	ba f0 01 00 00       	mov    $0x1f0,%edx
  100b46:	66 90                	xchg   %ax,%ax
  100b48:	ed                   	in     (%dx),%eax
  100b49:	89 01                	mov    %eax,(%ecx)
  100b4b:	83 c1 04             	add    $0x4,%ecx
  100b4e:	39 d9                	cmp    %ebx,%ecx
  100b50:	75 f6                	jne    100b48 <readSect+0x68>
  100b52:	5b                   	pop    %ebx
  100b53:	5d                   	pop    %ebp
  100b54:	c3                   	ret    
  100b55:	8d 76 00             	lea    0x0(%esi),%esi

00100b58 <initSeg>:
  100b58:	55                   	push   %ebp
  100b59:	89 e5                	mov    %esp,%ebp
  100b5b:	83 ec 10             	sub    $0x10,%esp
  100b5e:	b9 c0 d2 12 01       	mov    $0x112d2c0,%ecx
  100b63:	66 c7 05 c8 d2 12 01 	movw   $0xffff,0x112d2c8
  100b6a:	ff ff 
  100b6c:	66 c7 05 ca d2 12 01 	movw   $0x0,0x112d2ca
  100b73:	00 00 
  100b75:	c6 05 cc d2 12 01 00 	movb   $0x0,0x112d2cc
  100b7c:	c6 05 cd d2 12 01 9a 	movb   $0x9a,0x112d2cd
  100b83:	c6 05 ce d2 12 01 cf 	movb   $0xcf,0x112d2ce
  100b8a:	c6 05 cf d2 12 01 00 	movb   $0x0,0x112d2cf
  100b91:	66 c7 05 d0 d2 12 01 	movw   $0xffff,0x112d2d0
  100b98:	ff ff 
  100b9a:	66 c7 05 d2 d2 12 01 	movw   $0x0,0x112d2d2
  100ba1:	00 00 
  100ba3:	c6 05 d4 d2 12 01 00 	movb   $0x0,0x112d2d4
  100baa:	c6 05 d5 d2 12 01 92 	movb   $0x92,0x112d2d5
  100bb1:	c6 05 d6 d2 12 01 cf 	movb   $0xcf,0x112d2d6
  100bb8:	c6 05 d7 d2 12 01 00 	movb   $0x0,0x112d2d7
  100bbf:	66 c7 05 d8 d2 12 01 	movw   $0xffff,0x112d2d8
  100bc6:	ff ff 
  100bc8:	66 c7 05 da d2 12 01 	movw   $0x0,0x112d2da
  100bcf:	00 00 
  100bd1:	c6 05 dc d2 12 01 00 	movb   $0x0,0x112d2dc
  100bd8:	c6 05 dd d2 12 01 fa 	movb   $0xfa,0x112d2dd
  100bdf:	c6 05 de d2 12 01 cf 	movb   $0xcf,0x112d2de
  100be6:	c6 05 df d2 12 01 00 	movb   $0x0,0x112d2df
  100bed:	66 c7 05 e0 d2 12 01 	movw   $0xffff,0x112d2e0
  100bf4:	ff ff 
  100bf6:	66 c7 05 e2 d2 12 01 	movw   $0x0,0x112d2e2
  100bfd:	00 00 
  100bff:	c6 05 e4 d2 12 01 00 	movb   $0x0,0x112d2e4
  100c06:	c6 05 e5 d2 12 01 f2 	movb   $0xf2,0x112d2e5
  100c0d:	c6 05 e6 d2 12 01 cf 	movb   $0xcf,0x112d2e6
  100c14:	c6 05 e7 d2 12 01 00 	movb   $0x0,0x112d2e7
  100c1b:	66 c7 05 e8 d2 12 01 	movw   $0x63,0x112d2e8
  100c22:	63 00 
  100c24:	b8 00 d3 12 01       	mov    $0x112d300,%eax
  100c29:	66 a3 ea d2 12 01    	mov    %ax,0x112d2ea
  100c2f:	89 c2                	mov    %eax,%edx
  100c31:	c1 ea 10             	shr    $0x10,%edx
  100c34:	88 15 ec d2 12 01    	mov    %dl,0x112d2ec
  100c3a:	c6 05 ed d2 12 01 89 	movb   $0x89,0x112d2ed
  100c41:	c6 05 ee d2 12 01 40 	movb   $0x40,0x112d2ee
  100c48:	c1 e8 18             	shr    $0x18,%eax
  100c4b:	a2 ef d2 12 01       	mov    %al,0x112d2ef
  100c50:	a1 c0 12 10 00       	mov    0x1012c0,%eax
  100c55:	8b 15 c4 12 10 00    	mov    0x1012c4,%edx
  100c5b:	a3 f0 d2 12 01       	mov    %eax,0x112d2f0
  100c60:	89 15 f4 d2 12 01    	mov    %edx,0x112d2f4
  100c66:	66 c7 05 80 32 10 00 	movw   $0x37,0x103280
  100c6d:	37 00 
  100c6f:	66 89 0d 82 32 10 00 	mov    %cx,0x103282
  100c76:	c1 e9 10             	shr    $0x10,%ecx
  100c79:	66 89 0d 84 32 10 00 	mov    %cx,0x103284
  100c80:	b8 80 32 10 00       	mov    $0x103280,%eax
  100c85:	0f 01 10             	lgdtl  (%eax)
  100c88:	68 00 00 50 00       	push   $0x500000
  100c8d:	6a 10                	push   $0x10
  100c8f:	e8 ec fb ff ff       	call   100880 <init_kernel_pcb>
  100c94:	a1 f4 52 10 00       	mov    0x1052f4,%eax
  100c99:	a3 04 d3 12 01       	mov    %eax,0x112d304
  100c9e:	a1 f8 52 10 00       	mov    0x1052f8,%eax
  100ca3:	a3 08 d3 12 01       	mov    %eax,0x112d308
  100ca8:	b8 28 00 00 00       	mov    $0x28,%eax
  100cad:	0f 00 d8             	ltr    %ax
  100cb0:	b8 10 00 00 00       	mov    $0x10,%eax
  100cb5:	89 c0                	mov    %eax,%eax
  100cb7:	8e d8                	mov    %eax,%ds
  100cb9:	8e e0                	mov    %eax,%fs
  100cbb:	8e c0                	mov    %eax,%es
  100cbd:	8e d0                	mov    %eax,%ss
  100cbf:	b8 30 00 00 00       	mov    $0x30,%eax
  100cc4:	89 c0                	mov    %eax,%eax
  100cc6:	8e e8                	mov    %eax,%gs
  100cc8:	31 c0                	xor    %eax,%eax
  100cca:	0f 00 d0             	lldt   %ax
  100ccd:	83 c4 10             	add    $0x10,%esp
  100cd0:	c9                   	leave  
  100cd1:	c3                   	ret    
  100cd2:	66 90                	xchg   %ax,%ax

00100cd4 <enterUserSpace_pcb>:
  100cd4:	55                   	push   %ebp
  100cd5:	89 e5                	mov    %esp,%ebp
  100cd7:	8b 45 08             	mov    0x8(%ebp),%eax
  100cda:	89 c2                	mov    %eax,%edx
  100cdc:	c1 e2 07             	shl    $0x7,%edx
  100cdf:	01 c2                	add    %eax,%edx
  100ce1:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100ce4:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100ce7:	8d 04 85 c0 32 10 00 	lea    0x1032c0(,%eax,4),%eax
  100cee:	8b 90 38 20 00 00    	mov    0x2038(%eax),%edx
  100cf4:	52                   	push   %edx
  100cf5:	8b 90 34 20 00 00    	mov    0x2034(%eax),%edx
  100cfb:	52                   	push   %edx
  100cfc:	9c                   	pushf  
  100cfd:	8b 90 2c 20 00 00    	mov    0x202c(%eax),%edx
  100d03:	52                   	push   %edx
  100d04:	8b 80 28 20 00 00    	mov    0x2028(%eax),%eax
  100d0a:	50                   	push   %eax
  100d0b:	cf                   	iret   
  100d0c:	5d                   	pop    %ebp
  100d0d:	c3                   	ret    
  100d0e:	66 90                	xchg   %ax,%ax

00100d10 <enterUserSpace>:
  100d10:	55                   	push   %ebp
  100d11:	89 e5                	mov    %esp,%ebp
  100d13:	8b 45 08             	mov    0x8(%ebp),%eax
  100d16:	c7 05 a4 32 10 00 01 	movl   $0x1,0x1032a4
  100d1d:	00 00 00 
  100d20:	c7 05 4c 73 10 00 23 	movl   $0x23,0x10734c
  100d27:	00 00 00 
  100d2a:	c7 05 48 73 10 00 00 	movl   $0x8000000,0x107348
  100d31:	00 00 08 
  100d34:	c7 05 40 73 10 00 1b 	movl   $0x1b,0x107340
  100d3b:	00 00 00 
  100d3e:	a3 3c 73 10 00       	mov    %eax,0x10733c
  100d43:	c7 05 54 73 10 00 0a 	movl   $0xa,0x107354
  100d4a:	00 00 00 
  100d4d:	c7 05 50 73 10 00 02 	movl   $0x2,0x107350
  100d54:	00 00 00 
  100d57:	ba 23 00 00 00       	mov    $0x23,%edx
  100d5c:	52                   	push   %edx
  100d5d:	ba 00 00 00 08       	mov    $0x8000000,%edx
  100d62:	52                   	push   %edx
  100d63:	9c                   	pushf  
  100d64:	ba 1b 00 00 00       	mov    $0x1b,%edx
  100d69:	52                   	push   %edx
  100d6a:	50                   	push   %eax
  100d6b:	cf                   	iret   
  100d6c:	5d                   	pop    %ebp
  100d6d:	c3                   	ret    
  100d6e:	66 90                	xchg   %ax,%ax

00100d70 <loadUMain>:
  100d70:	55                   	push   %ebp
  100d71:	89 e5                	mov    %esp,%ebp
  100d73:	57                   	push   %edi
  100d74:	56                   	push   %esi
  100d75:	53                   	push   %ebx
  100d76:	bb c9 00 00 00       	mov    $0xc9,%ebx
  100d7b:	be 00 00 00 03       	mov    $0x3000000,%esi
  100d80:	53                   	push   %ebx
  100d81:	56                   	push   %esi
  100d82:	e8 59 fd ff ff       	call   100ae0 <readSect>
  100d87:	81 c6 00 02 00 00    	add    $0x200,%esi
  100d8d:	43                   	inc    %ebx
  100d8e:	58                   	pop    %eax
  100d8f:	5a                   	pop    %edx
  100d90:	81 fb 91 01 00 00    	cmp    $0x191,%ebx
  100d96:	75 e8                	jne    100d80 <loadUMain+0x10>
  100d98:	a1 1c 00 00 03       	mov    0x300001c,%eax
  100d9d:	8d 90 00 00 00 03    	lea    0x3000000(%eax),%edx
  100da3:	0f b7 35 2c 00 00 03 	movzwl 0x300002c,%esi
  100daa:	c1 e6 05             	shl    $0x5,%esi
  100dad:	01 d6                	add    %edx,%esi
  100daf:	39 f2                	cmp    %esi,%edx
  100db1:	72 0c                	jb     100dbf <loadUMain+0x4f>
  100db3:	eb 53                	jmp    100e08 <loadUMain+0x98>
  100db5:	8d 76 00             	lea    0x0(%esi),%esi
  100db8:	83 c2 20             	add    $0x20,%edx
  100dbb:	39 d6                	cmp    %edx,%esi
  100dbd:	76 49                	jbe    100e08 <loadUMain+0x98>
  100dbf:	83 3a 01             	cmpl   $0x1,(%edx)
  100dc2:	75 f4                	jne    100db8 <loadUMain+0x48>
  100dc4:	8b 42 08             	mov    0x8(%edx),%eax
  100dc7:	8b 7a 10             	mov    0x10(%edx),%edi
  100dca:	8b 5a 04             	mov    0x4(%edx),%ebx
  100dcd:	29 c3                	sub    %eax,%ebx
  100dcf:	31 c9                	xor    %ecx,%ecx
  100dd1:	85 ff                	test   %edi,%edi
  100dd3:	74 16                	je     100deb <loadUMain+0x7b>
  100dd5:	8d 76 00             	lea    0x0(%esi),%esi
  100dd8:	8a 8c 03 00 00 00 03 	mov    0x3000000(%ebx,%eax,1),%cl
  100ddf:	88 08                	mov    %cl,(%eax)
  100de1:	40                   	inc    %eax
  100de2:	89 c1                	mov    %eax,%ecx
  100de4:	2b 4a 08             	sub    0x8(%edx),%ecx
  100de7:	39 cf                	cmp    %ecx,%edi
  100de9:	77 ed                	ja     100dd8 <loadUMain+0x68>
  100deb:	8b 5a 14             	mov    0x14(%edx),%ebx
  100dee:	39 cb                	cmp    %ecx,%ebx
  100df0:	76 c6                	jbe    100db8 <loadUMain+0x48>
  100df2:	66 90                	xchg   %ax,%ax
  100df4:	c6 00 00             	movb   $0x0,(%eax)
  100df7:	40                   	inc    %eax
  100df8:	89 c1                	mov    %eax,%ecx
  100dfa:	2b 4a 08             	sub    0x8(%edx),%ecx
  100dfd:	39 cb                	cmp    %ecx,%ebx
  100dff:	77 f3                	ja     100df4 <loadUMain+0x84>
  100e01:	83 c2 20             	add    $0x20,%edx
  100e04:	39 d6                	cmp    %edx,%esi
  100e06:	77 b7                	ja     100dbf <loadUMain+0x4f>
  100e08:	a1 18 00 00 03       	mov    0x3000018,%eax
  100e0d:	c7 05 a4 32 10 00 01 	movl   $0x1,0x1032a4
  100e14:	00 00 00 
  100e17:	c7 05 4c 73 10 00 23 	movl   $0x23,0x10734c
  100e1e:	00 00 00 
  100e21:	c7 05 48 73 10 00 00 	movl   $0x8000000,0x107348
  100e28:	00 00 08 
  100e2b:	c7 05 40 73 10 00 1b 	movl   $0x1b,0x107340
  100e32:	00 00 00 
  100e35:	a3 3c 73 10 00       	mov    %eax,0x10733c
  100e3a:	c7 05 54 73 10 00 0a 	movl   $0xa,0x107354
  100e41:	00 00 00 
  100e44:	c7 05 50 73 10 00 02 	movl   $0x2,0x107350
  100e4b:	00 00 00 
  100e4e:	ba 23 00 00 00       	mov    $0x23,%edx
  100e53:	52                   	push   %edx
  100e54:	ba 00 00 00 08       	mov    $0x8000000,%edx
  100e59:	52                   	push   %edx
  100e5a:	9c                   	pushf  
  100e5b:	ba 1b 00 00 00       	mov    $0x1b,%edx
  100e60:	52                   	push   %edx
  100e61:	50                   	push   %eax
  100e62:	cf                   	iret   
  100e63:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100e66:	5b                   	pop    %ebx
  100e67:	5e                   	pop    %esi
  100e68:	5f                   	pop    %edi
  100e69:	5d                   	pop    %ebp
  100e6a:	c3                   	ret    
  100e6b:	90                   	nop

00100e6c <initIdt>:
  100e6c:	55                   	push   %ebp
  100e6d:	89 e5                	mov    %esp,%ebp
  100e6f:	53                   	push   %ebx
  100e70:	ba 4c 11 10 00       	mov    $0x10114c,%edx
  100e75:	89 d3                	mov    %edx,%ebx
  100e77:	c1 ea 10             	shr    $0x10,%edx
  100e7a:	b9 80 db 12 01       	mov    $0x112db80,%ecx
  100e7f:	b8 80 d3 12 01       	mov    $0x112d380,%eax
  100e84:	66 89 18             	mov    %bx,(%eax)
  100e87:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100e8d:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100e91:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100e95:	66 89 50 06          	mov    %dx,0x6(%eax)
  100e99:	83 c0 08             	add    $0x8,%eax
  100e9c:	39 c1                	cmp    %eax,%ecx
  100e9e:	75 e4                	jne    100e84 <initIdt+0x18>
  100ea0:	b8 52 11 10 00       	mov    $0x101152,%eax
  100ea5:	66 a3 e8 d3 12 01    	mov    %ax,0x112d3e8
  100eab:	66 c7 05 ea d3 12 01 	movw   $0x8,0x112d3ea
  100eb2:	08 00 
  100eb4:	c6 05 ec d3 12 01 00 	movb   $0x0,0x112d3ec
  100ebb:	c6 05 ed d3 12 01 8f 	movb   $0x8f,0x112d3ed
  100ec2:	c1 e8 10             	shr    $0x10,%eax
  100ec5:	66 a3 ee d3 12 01    	mov    %ax,0x112d3ee
  100ecb:	b8 56 11 10 00       	mov    $0x101156,%eax
  100ed0:	66 a3 80 d7 12 01    	mov    %ax,0x112d780
  100ed6:	66 c7 05 82 d7 12 01 	movw   $0x8,0x112d782
  100edd:	08 00 
  100edf:	c6 05 84 d7 12 01 00 	movb   $0x0,0x112d784
  100ee6:	c6 05 85 d7 12 01 ee 	movb   $0xee,0x112d785
  100eed:	c1 e8 10             	shr    $0x10,%eax
  100ef0:	66 a3 86 d7 12 01    	mov    %ax,0x112d786
  100ef6:	b8 5f 11 10 00       	mov    $0x10115f,%eax
  100efb:	66 a3 80 d4 12 01    	mov    %ax,0x112d480
  100f01:	66 c7 05 82 d4 12 01 	movw   $0x8,0x112d482
  100f08:	08 00 
  100f0a:	c6 05 84 d4 12 01 00 	movb   $0x0,0x112d484
  100f11:	c6 05 85 d4 12 01 8e 	movb   $0x8e,0x112d485
  100f18:	c1 e8 10             	shr    $0x10,%eax
  100f1b:	66 a3 86 d4 12 01    	mov    %ax,0x112d486
  100f21:	66 c7 05 88 32 10 00 	movw   $0x7ff,0x103288
  100f28:	ff 07 
  100f2a:	b8 80 d3 12 01       	mov    $0x112d380,%eax
  100f2f:	66 a3 8a 32 10 00    	mov    %ax,0x10328a
  100f35:	c1 e8 10             	shr    $0x10,%eax
  100f38:	66 a3 8c 32 10 00    	mov    %ax,0x10328c
  100f3e:	b8 88 32 10 00       	mov    $0x103288,%eax
  100f43:	0f 01 18             	lidtl  (%eax)
  100f46:	5b                   	pop    %ebx
  100f47:	5d                   	pop    %ebp
  100f48:	c3                   	ret    
  100f49:	66 90                	xchg   %ax,%ax
  100f4b:	90                   	nop

00100f4c <sys_sleep>:
  100f4c:	55                   	push   %ebp
  100f4d:	89 e5                	mov    %esp,%ebp
  100f4f:	83 ec 08             	sub    $0x8,%esp
  100f52:	e8 2d f7 ff ff       	call   100684 <getpid>
  100f57:	89 c2                	mov    %eax,%edx
  100f59:	c1 e2 07             	shl    $0x7,%edx
  100f5c:	01 c2                	add    %eax,%edx
  100f5e:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100f61:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100f64:	8b 55 08             	mov    0x8(%ebp),%edx
  100f67:	8b 52 1c             	mov    0x1c(%edx),%edx
  100f6a:	89 14 85 04 53 10 00 	mov    %edx,0x105304(,%eax,4)
  100f71:	b8 01 00 00 00       	mov    $0x1,%eax
  100f76:	c9                   	leave  
  100f77:	c3                   	ret    

00100f78 <display>:
  100f78:	55                   	push   %ebp
  100f79:	89 e5                	mov    %esp,%ebp
  100f7b:	57                   	push   %edi
  100f7c:	53                   	push   %ebx
  100f7d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100f80:	80 fb 0a             	cmp    $0xa,%bl
  100f83:	74 5b                	je     100fe0 <display+0x68>
  100f85:	8b 15 90 32 10 00    	mov    0x103290,%edx
  100f8b:	8b 0d 94 32 10 00    	mov    0x103294,%ecx
  100f91:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  100f94:	c1 e0 04             	shl    $0x4,%eax
  100f97:	01 d0                	add    %edx,%eax
  100f99:	01 c0                	add    %eax,%eax
  100f9b:	89 c7                	mov    %eax,%edi
  100f9d:	0f be db             	movsbl %bl,%ebx
  100fa0:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
  100fa6:	66 89 d8             	mov    %bx,%ax
  100fa9:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100fad:	42                   	inc    %edx
  100fae:	83 fa 50             	cmp    $0x50,%edx
  100fb1:	75 1d                	jne    100fd0 <display+0x58>
  100fb3:	c7 05 90 32 10 00 00 	movl   $0x0,0x103290
  100fba:	00 00 00 
  100fbd:	41                   	inc    %ecx
  100fbe:	89 0d 94 32 10 00    	mov    %ecx,0x103294
  100fc4:	b8 01 00 00 00       	mov    $0x1,%eax
  100fc9:	5b                   	pop    %ebx
  100fca:	5f                   	pop    %edi
  100fcb:	5d                   	pop    %ebp
  100fcc:	c3                   	ret    
  100fcd:	8d 76 00             	lea    0x0(%esi),%esi
  100fd0:	89 15 90 32 10 00    	mov    %edx,0x103290
  100fd6:	b8 01 00 00 00       	mov    $0x1,%eax
  100fdb:	5b                   	pop    %ebx
  100fdc:	5f                   	pop    %edi
  100fdd:	5d                   	pop    %ebp
  100fde:	c3                   	ret    
  100fdf:	90                   	nop
  100fe0:	c7 05 90 32 10 00 00 	movl   $0x0,0x103290
  100fe7:	00 00 00 
  100fea:	ff 05 94 32 10 00    	incl   0x103294
  100ff0:	b8 01 00 00 00       	mov    $0x1,%eax
  100ff5:	5b                   	pop    %ebx
  100ff6:	5f                   	pop    %edi
  100ff7:	5d                   	pop    %ebp
  100ff8:	c3                   	ret    
  100ff9:	8d 76 00             	lea    0x0(%esi),%esi

00100ffc <printkernel>:
  100ffc:	55                   	push   %ebp
  100ffd:	89 e5                	mov    %esp,%ebp
  100fff:	53                   	push   %ebx
  101000:	50                   	push   %eax
  101001:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101004:	0f be 03             	movsbl (%ebx),%eax
  101007:	84 c0                	test   %al,%al
  101009:	74 20                	je     10102b <printkernel+0x2f>
  10100b:	90                   	nop
  10100c:	83 ec 0c             	sub    $0xc,%esp
  10100f:	50                   	push   %eax
  101010:	e8 db f8 ff ff       	call   1008f0 <putChar>
  101015:	0f be 03             	movsbl (%ebx),%eax
  101018:	89 04 24             	mov    %eax,(%esp)
  10101b:	e8 58 ff ff ff       	call   100f78 <display>
  101020:	43                   	inc    %ebx
  101021:	0f be 03             	movsbl (%ebx),%eax
  101024:	83 c4 10             	add    $0x10,%esp
  101027:	84 c0                	test   %al,%al
  101029:	75 e1                	jne    10100c <printkernel+0x10>
  10102b:	b8 01 00 00 00       	mov    $0x1,%eax
  101030:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101033:	c9                   	leave  
  101034:	c3                   	ret    
  101035:	8d 76 00             	lea    0x0(%esi),%esi

00101038 <fs_write>:
  101038:	55                   	push   %ebp
  101039:	89 e5                	mov    %esp,%ebp
  10103b:	53                   	push   %ebx
  10103c:	50                   	push   %eax
  10103d:	8b 5d 10             	mov    0x10(%ebp),%ebx
  101040:	ba 30 00 00 00       	mov    $0x30,%edx
  101045:	89 d0                	mov    %edx,%eax
  101047:	8e e8                	mov    %eax,%gs
  101049:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  10104d:	74 12                	je     101061 <fs_write+0x29>
  10104f:	83 ec 08             	sub    $0x8,%esp
  101052:	6a 27                	push   $0x27
  101054:	68 c8 12 10 00       	push   $0x1012c8
  101059:	e8 26 f2 ff ff       	call   100284 <abort>
  10105e:	83 c4 10             	add    $0x10,%esp
  101061:	83 ec 08             	sub    $0x8,%esp
  101064:	53                   	push   %ebx
  101065:	ff 75 0c             	pushl  0xc(%ebp)
  101068:	e8 8f ff ff ff       	call   100ffc <printkernel>
  10106d:	89 d8                	mov    %ebx,%eax
  10106f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101072:	c9                   	leave  
  101073:	c3                   	ret    

00101074 <sys_write>:
  101074:	55                   	push   %ebp
  101075:	89 e5                	mov    %esp,%ebp
  101077:	53                   	push   %ebx
  101078:	83 ec 08             	sub    $0x8,%esp
  10107b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10107e:	ff 73 14             	pushl  0x14(%ebx)
  101081:	ff 73 18             	pushl  0x18(%ebx)
  101084:	ff 73 10             	pushl  0x10(%ebx)
  101087:	e8 ac ff ff ff       	call   101038 <fs_write>
  10108c:	89 43 1c             	mov    %eax,0x1c(%ebx)
  10108f:	83 c4 10             	add    $0x10,%esp
  101092:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101095:	c9                   	leave  
  101096:	c3                   	ret    
  101097:	90                   	nop

00101098 <print_char>:
  101098:	55                   	push   %ebp
  101099:	89 e5                	mov    %esp,%ebp
  10109b:	57                   	push   %edi
  10109c:	8b 45 08             	mov    0x8(%ebp),%eax
  10109f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1010a2:	c1 e0 04             	shl    $0x4,%eax
  1010a5:	03 45 0c             	add    0xc(%ebp),%eax
  1010a8:	01 c0                	add    %eax,%eax
  1010aa:	89 c7                	mov    %eax,%edi
  1010ac:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  1010b0:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  1010b6:	66 89 d0             	mov    %dx,%ax
  1010b9:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1010bd:	5f                   	pop    %edi
  1010be:	5d                   	pop    %ebp
  1010bf:	c3                   	ret    

001010c0 <sys_exit>:
  1010c0:	55                   	push   %ebp
  1010c1:	89 e5                	mov    %esp,%ebp
  1010c3:	b8 01 00 00 00       	mov    $0x1,%eax
  1010c8:	5d                   	pop    %ebp
  1010c9:	c3                   	ret    
  1010ca:	66 90                	xchg   %ax,%ax

001010cc <sys_fork>:
  1010cc:	55                   	push   %ebp
  1010cd:	89 e5                	mov    %esp,%ebp
  1010cf:	57                   	push   %edi
  1010d0:	56                   	push   %esi
  1010d1:	83 ec 0c             	sub    $0xc,%esp
  1010d4:	68 e4 12 10 00       	push   $0x1012e4
  1010d9:	e8 32 f0 ff ff       	call   100110 <printk>
  1010de:	b8 68 93 10 00       	mov    $0x109368,%eax
  1010e3:	be 14 73 10 00       	mov    $0x107314,%esi
  1010e8:	b9 0f 00 00 00       	mov    $0xf,%ecx
  1010ed:	89 c7                	mov    %eax,%edi
  1010ef:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1010f1:	c7 05 84 93 10 00 00 	movl   $0x0,0x109384
  1010f8:	00 00 00 
  1010fb:	c7 05 9c 93 10 00 00 	movl   $0x7f00000,0x10939c
  101102:	00 f0 07 
  101105:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  10110c:	e8 03 f6 ff ff       	call   100714 <put_into_runnable>
  101111:	b8 02 00 00 00       	mov    $0x2,%eax
  101116:	8d 65 f8             	lea    -0x8(%ebp),%esp
  101119:	5e                   	pop    %esi
  10111a:	5f                   	pop    %edi
  10111b:	5d                   	pop    %ebp
  10111c:	c3                   	ret    
  10111d:	66 90                	xchg   %ax,%ax
  10111f:	90                   	nop

00101120 <kEntry>:
  101120:	55                   	push   %ebp
  101121:	89 e5                	mov    %esp,%ebp
  101123:	83 ec 08             	sub    $0x8,%esp
  101126:	e8 89 f9 ff ff       	call   100ab4 <initTimer>
  10112b:	e8 f4 f6 ff ff       	call   100824 <init_pcb>
  101130:	e8 7b f7 ff ff       	call   1008b0 <initSerial>
  101135:	e8 32 fd ff ff       	call   100e6c <initIdt>
  10113a:	e8 1d f9 ff ff       	call   100a5c <initIntr>
  10113f:	e8 14 fa ff ff       	call   100b58 <initSeg>
  101144:	fb                   	sti    
  101145:	e8 26 fc ff ff       	call   100d70 <loadUMain>
  10114a:	eb fe                	jmp    10114a <kEntry+0x2a>

0010114c <irqEmpty>:
  10114c:	6a 00                	push   $0x0
  10114e:	6a ff                	push   $0xffffffff
  101150:	eb 13                	jmp    101165 <asmDoIrq>

00101152 <irqGProtectFault>:
  101152:	6a 0d                	push   $0xd
  101154:	eb 0f                	jmp    101165 <asmDoIrq>

00101156 <irqSyscall>:
  101156:	6a 00                	push   $0x0
  101158:	68 80 00 00 00       	push   $0x80
  10115d:	eb 06                	jmp    101165 <asmDoIrq>

0010115f <irqTime>:
  10115f:	6a 00                	push   $0x0
  101161:	6a 20                	push   $0x20
  101163:	eb 00                	jmp    101165 <asmDoIrq>

00101165 <asmDoIrq>:
  101165:	60                   	pusha  
  101166:	54                   	push   %esp
  101167:	e8 5c f8 ff ff       	call   1009c8 <irqHandle>
  10116c:	83 c4 04             	add    $0x4,%esp
  10116f:	61                   	popa   
  101170:	83 c4 04             	add    $0x4,%esp
  101173:	83 c4 04             	add    $0x4,%esp
  101176:	cf                   	iret   
