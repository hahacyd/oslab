
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	53                   	push   %ebx
  200004:	83 ec 10             	sub    $0x10,%esp
  200007:	68 1c 99 06 00       	push   $0x6991c
  20000c:	e8 c3 02 00 00       	call   2002d4 <printx>
  200011:	e8 22 01 00 00       	call   200138 <exit>
  200016:	e8 85 00 00 00       	call   2000a0 <fork>
  20001b:	89 c3                	mov    %eax,%ebx
  20001d:	83 c4 10             	add    $0x10,%esp
  200020:	85 c0                	test   %eax,%eax
  200022:	75 3a                	jne    20005e <uEntry+0x5e>
  200024:	83 ec 0c             	sub    $0xc,%esp
  200027:	68 c0 06 20 00       	push   $0x2006c0
  20002c:	e8 83 05 00 00       	call   2005b4 <printf>
  200031:	83 c4 10             	add    $0x10,%esp
  200034:	83 ec 08             	sub    $0x8,%esp
  200037:	53                   	push   %ebx
  200038:	68 d9 06 20 00       	push   $0x2006d9
  20003d:	e8 72 05 00 00       	call   2005b4 <printf>
  200042:	e8 f1 00 00 00       	call   200138 <exit>
  200047:	83 c4 10             	add    $0x10,%esp
  20004a:	66 90                	xchg   %ax,%ax
  20004c:	83 ec 0c             	sub    $0xc,%esp
  20004f:	68 e3 06 20 00       	push   $0x2006e3
  200054:	e8 5b 05 00 00       	call   2005b4 <printf>
  200059:	83 c4 10             	add    $0x10,%esp
  20005c:	eb ee                	jmp    20004c <uEntry+0x4c>
  20005e:	83 ec 0c             	sub    $0xc,%esp
  200061:	6a 25                	push   $0x25
  200063:	e8 84 00 00 00       	call   2000ec <sleep>
  200068:	c7 04 24 cc 06 20 00 	movl   $0x2006cc,(%esp)
  20006f:	e8 40 05 00 00       	call   2005b4 <printf>
  200074:	83 c4 10             	add    $0x10,%esp
  200077:	eb bb                	jmp    200034 <uEntry+0x34>
  200079:	66 90                	xchg   %ax,%ax
  20007b:	90                   	nop

0020007c <syscall>:
  20007c:	55                   	push   %ebp
  20007d:	89 e5                	mov    %esp,%ebp
  20007f:	83 ec 10             	sub    $0x10,%esp
  200082:	8b 45 08             	mov    0x8(%ebp),%eax
  200085:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  200088:	8b 4d 10             	mov    0x10(%ebp),%ecx
  20008b:	8b 55 14             	mov    0x14(%ebp),%edx
  20008e:	8b 7d 18             	mov    0x18(%ebp),%edi
  200091:	8b 75 1c             	mov    0x1c(%ebp),%esi
  200094:	cd 80                	int    $0x80
  200096:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200099:	8b 45 fc             	mov    -0x4(%ebp),%eax
  20009c:	c9                   	leave  
  20009d:	c3                   	ret    
  20009e:	66 90                	xchg   %ax,%ax

002000a0 <fork>:
  2000a0:	55                   	push   %ebp
  2000a1:	89 e5                	mov    %esp,%ebp
  2000a3:	83 ec 20             	sub    $0x20,%esp
  2000a6:	c7 45 e4 02 00 00 00 	movl   $0x2,-0x1c(%ebp)
  2000ad:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  2000b4:	c7 45 ec f2 06 20 00 	movl   $0x2006f2,-0x14(%ebp)
  2000bb:	c7 45 f0 0d 00 00 00 	movl   $0xd,-0x10(%ebp)
  2000c2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2000c9:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2000d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2000d3:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2000d6:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2000d9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2000dc:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2000df:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2000e2:	cd 80                	int    $0x80
  2000e4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2000e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2000ea:	c9                   	leave  
  2000eb:	c3                   	ret    

002000ec <sleep>:
  2000ec:	55                   	push   %ebp
  2000ed:	89 e5                	mov    %esp,%ebp
  2000ef:	83 ec 20             	sub    $0x20,%esp
  2000f2:	c7 45 e4 e6 00 00 00 	movl   $0xe6,-0x1c(%ebp)
  2000f9:	8b 45 08             	mov    0x8(%ebp),%eax
  2000fc:	89 45 e8             	mov    %eax,-0x18(%ebp)
  2000ff:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  200106:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  20010d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200114:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  20011b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  20011e:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  200121:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200124:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200127:	8b 7d f4             	mov    -0xc(%ebp),%edi
  20012a:	8b 75 f8             	mov    -0x8(%ebp),%esi
  20012d:	cd 80                	int    $0x80
  20012f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200132:	31 c0                	xor    %eax,%eax
  200134:	c9                   	leave  
  200135:	c3                   	ret    
  200136:	66 90                	xchg   %ax,%ax

00200138 <exit>:
  200138:	55                   	push   %ebp
  200139:	89 e5                	mov    %esp,%ebp
  20013b:	83 ec 20             	sub    $0x20,%esp
  20013e:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  200145:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  20014c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  200153:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  20015a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200161:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200168:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  20016b:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  20016e:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200171:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200174:	8b 7d f4             	mov    -0xc(%ebp),%edi
  200177:	8b 75 f8             	mov    -0x8(%ebp),%esi
  20017a:	cd 80                	int    $0x80
  20017c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  20017f:	31 c0                	xor    %eax,%eax
  200181:	c9                   	leave  
  200182:	c3                   	ret    
  200183:	90                   	nop

00200184 <fs_write>:
  200184:	55                   	push   %ebp
  200185:	89 e5                	mov    %esp,%ebp
  200187:	83 ec 20             	sub    $0x20,%esp
  20018a:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  200191:	8b 45 08             	mov    0x8(%ebp),%eax
  200194:	89 45 e8             	mov    %eax,-0x18(%ebp)
  200197:	8b 45 0c             	mov    0xc(%ebp),%eax
  20019a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  20019d:	8b 45 10             	mov    0x10(%ebp),%eax
  2001a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  2001a3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2001aa:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2001b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2001b4:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2001b7:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2001ba:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2001bd:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2001c0:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2001c3:	cd 80                	int    $0x80
  2001c5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2001c8:	c9                   	leave  
  2001c9:	c3                   	ret    
  2001ca:	66 90                	xchg   %ax,%ax

002001cc <putchar_user>:
  2001cc:	55                   	push   %ebp
  2001cd:	89 e5                	mov    %esp,%ebp
  2001cf:	83 ec 24             	sub    $0x24,%esp
  2001d2:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  2001d9:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  2001e0:	8d 45 dc             	lea    -0x24(%ebp),%eax
  2001e3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  2001e6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  2001ed:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2001f4:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2001fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2001fe:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  200201:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200204:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200207:	8b 7d f4             	mov    -0xc(%ebp),%edi
  20020a:	8b 75 f8             	mov    -0x8(%ebp),%esi
  20020d:	cd 80                	int    $0x80
  20020f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200212:	c9                   	leave  
  200213:	c3                   	ret    

00200214 <printd>:
  200214:	55                   	push   %ebp
  200215:	89 e5                	mov    %esp,%ebp
  200217:	57                   	push   %edi
  200218:	56                   	push   %esi
  200219:	53                   	push   %ebx
  20021a:	83 ec 44             	sub    $0x44,%esp
  20021d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  200220:	85 c9                	test   %ecx,%ecx
  200222:	0f 88 90 00 00 00    	js     2002b8 <printd+0xa4>
  200228:	c6 45 b3 00          	movb   $0x0,-0x4d(%ebp)
  20022c:	8d 5d f3             	lea    -0xd(%ebp),%ebx
  20022f:	31 ff                	xor    %edi,%edi
  200231:	eb 03                	jmp    200236 <printd+0x22>
  200233:	90                   	nop
  200234:	89 f7                	mov    %esi,%edi
  200236:	4b                   	dec    %ebx
  200237:	89 c8                	mov    %ecx,%eax
  200239:	be 0a 00 00 00       	mov    $0xa,%esi
  20023e:	99                   	cltd   
  20023f:	f7 fe                	idiv   %esi
  200241:	83 c2 30             	add    $0x30,%edx
  200244:	88 13                	mov    %dl,(%ebx)
  200246:	8d 77 01             	lea    0x1(%edi),%esi
  200249:	b8 67 66 66 66       	mov    $0x66666667,%eax
  20024e:	f7 e9                	imul   %ecx
  200250:	89 d0                	mov    %edx,%eax
  200252:	c1 f8 02             	sar    $0x2,%eax
  200255:	c1 f9 1f             	sar    $0x1f,%ecx
  200258:	29 c8                	sub    %ecx,%eax
  20025a:	89 c1                	mov    %eax,%ecx
  20025c:	75 d6                	jne    200234 <printd+0x20>
  20025e:	80 7d b3 01          	cmpb   $0x1,-0x4d(%ebp)
  200262:	74 48                	je     2002ac <printd+0x98>
  200264:	c7 45 cc 04 00 00 00 	movl   $0x4,-0x34(%ebp)
  20026b:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
  200272:	81 eb 00 00 01 00    	sub    $0x10000,%ebx
  200278:	89 5d c4             	mov    %ebx,-0x3c(%ebp)
  20027b:	89 75 c0             	mov    %esi,-0x40(%ebp)
  20027e:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
  200285:	c7 45 b8 00 00 00 00 	movl   $0x0,-0x48(%ebp)
  20028c:	8b 45 cc             	mov    -0x34(%ebp),%eax
  20028f:	8b 5d c8             	mov    -0x38(%ebp),%ebx
  200292:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
  200295:	8b 55 c0             	mov    -0x40(%ebp),%edx
  200298:	8b 7d bc             	mov    -0x44(%ebp),%edi
  20029b:	8b 75 b8             	mov    -0x48(%ebp),%esi
  20029e:	cd 80                	int    $0x80
  2002a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
  2002a3:	83 c4 44             	add    $0x44,%esp
  2002a6:	5b                   	pop    %ebx
  2002a7:	5e                   	pop    %esi
  2002a8:	5f                   	pop    %edi
  2002a9:	5d                   	pop    %ebp
  2002aa:	c3                   	ret    
  2002ab:	90                   	nop
  2002ac:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  2002b0:	8d 77 02             	lea    0x2(%edi),%esi
  2002b3:	4b                   	dec    %ebx
  2002b4:	eb ae                	jmp    200264 <printd+0x50>
  2002b6:	66 90                	xchg   %ax,%ax
  2002b8:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  2002be:	74 0b                	je     2002cb <printd+0xb7>
  2002c0:	f7 d9                	neg    %ecx
  2002c2:	c6 45 b3 01          	movb   $0x1,-0x4d(%ebp)
  2002c6:	e9 61 ff ff ff       	jmp    20022c <printd+0x18>
  2002cb:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  2002d0:	eb f0                	jmp    2002c2 <printd+0xae>
  2002d2:	66 90                	xchg   %ax,%ax

002002d4 <printx>:
  2002d4:	55                   	push   %ebp
  2002d5:	89 e5                	mov    %esp,%ebp
  2002d7:	57                   	push   %edi
  2002d8:	56                   	push   %esi
  2002d9:	53                   	push   %ebx
  2002da:	83 ec 40             	sub    $0x40,%esp
  2002dd:	8b 45 08             	mov    0x8(%ebp),%eax
  2002e0:	8d 55 f2             	lea    -0xe(%ebp),%edx
  2002e3:	31 c9                	xor    %ecx,%ecx
  2002e5:	8d 76 00             	lea    0x0(%esi),%esi
  2002e8:	41                   	inc    %ecx
  2002e9:	89 c6                	mov    %eax,%esi
  2002eb:	81 e6 0f 00 00 80    	and    $0x8000000f,%esi
  2002f1:	0f 88 9d 00 00 00    	js     200394 <printx+0xc0>
  2002f7:	8d 5e f6             	lea    -0xa(%esi),%ebx
  2002fa:	89 d7                	mov    %edx,%edi
  2002fc:	83 fb 05             	cmp    $0x5,%ebx
  2002ff:	0f 87 a2 00 00 00    	ja     2003a7 <printx+0xd3>
  200305:	ff 24 9d fc 06 20 00 	jmp    *0x2006fc(,%ebx,4)
  20030c:	c6 02 65             	movb   $0x65,(%edx)
  20030f:	90                   	nop
  200310:	85 c0                	test   %eax,%eax
  200312:	78 58                	js     20036c <printx+0x98>
  200314:	c1 f8 04             	sar    $0x4,%eax
  200317:	4a                   	dec    %edx
  200318:	85 c0                	test   %eax,%eax
  20031a:	75 cc                	jne    2002e8 <printx+0x14>
  20031c:	c7 45 cc 04 00 00 00 	movl   $0x4,-0x34(%ebp)
  200323:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
  20032a:	8d 9f 00 00 ff ff    	lea    -0x10000(%edi),%ebx
  200330:	89 5d c4             	mov    %ebx,-0x3c(%ebp)
  200333:	89 4d c0             	mov    %ecx,-0x40(%ebp)
  200336:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
  20033d:	c7 45 b8 00 00 00 00 	movl   $0x0,-0x48(%ebp)
  200344:	8b 45 cc             	mov    -0x34(%ebp),%eax
  200347:	8b 5d c8             	mov    -0x38(%ebp),%ebx
  20034a:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
  20034d:	8b 55 c0             	mov    -0x40(%ebp),%edx
  200350:	8b 7d bc             	mov    -0x44(%ebp),%edi
  200353:	8b 75 b8             	mov    -0x48(%ebp),%esi
  200356:	cd 80                	int    $0x80
  200358:	89 45 d0             	mov    %eax,-0x30(%ebp)
  20035b:	83 c4 40             	add    $0x40,%esp
  20035e:	5b                   	pop    %ebx
  20035f:	5e                   	pop    %esi
  200360:	5f                   	pop    %edi
  200361:	5d                   	pop    %ebp
  200362:	c3                   	ret    
  200363:	90                   	nop
  200364:	c6 02 64             	movb   $0x64,(%edx)
  200367:	85 c0                	test   %eax,%eax
  200369:	79 a9                	jns    200314 <printx+0x40>
  20036b:	90                   	nop
  20036c:	83 c0 0f             	add    $0xf,%eax
  20036f:	eb a3                	jmp    200314 <printx+0x40>
  200371:	8d 76 00             	lea    0x0(%esi),%esi
  200374:	c6 02 63             	movb   $0x63,(%edx)
  200377:	eb 97                	jmp    200310 <printx+0x3c>
  200379:	8d 76 00             	lea    0x0(%esi),%esi
  20037c:	c6 02 62             	movb   $0x62,(%edx)
  20037f:	eb 8f                	jmp    200310 <printx+0x3c>
  200381:	8d 76 00             	lea    0x0(%esi),%esi
  200384:	c6 02 61             	movb   $0x61,(%edx)
  200387:	eb 87                	jmp    200310 <printx+0x3c>
  200389:	8d 76 00             	lea    0x0(%esi),%esi
  20038c:	c6 02 66             	movb   $0x66,(%edx)
  20038f:	e9 7c ff ff ff       	jmp    200310 <printx+0x3c>
  200394:	4e                   	dec    %esi
  200395:	83 ce f0             	or     $0xfffffff0,%esi
  200398:	46                   	inc    %esi
  200399:	8d 5e f6             	lea    -0xa(%esi),%ebx
  20039c:	89 d7                	mov    %edx,%edi
  20039e:	83 fb 05             	cmp    $0x5,%ebx
  2003a1:	0f 86 5e ff ff ff    	jbe    200305 <printx+0x31>
  2003a7:	83 c6 30             	add    $0x30,%esi
  2003aa:	89 f3                	mov    %esi,%ebx
  2003ac:	88 1a                	mov    %bl,(%edx)
  2003ae:	e9 5d ff ff ff       	jmp    200310 <printx+0x3c>
  2003b3:	90                   	nop

002003b4 <i2A>:
  2003b4:	55                   	push   %ebp
  2003b5:	89 e5                	mov    %esp,%ebp
  2003b7:	57                   	push   %edi
  2003b8:	56                   	push   %esi
  2003b9:	53                   	push   %ebx
  2003ba:	83 ec 24             	sub    $0x24,%esp
  2003bd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2003c0:	85 c9                	test   %ecx,%ecx
  2003c2:	78 48                	js     20040c <i2A+0x58>
  2003c4:	c6 45 d3 00          	movb   $0x0,-0x2d(%ebp)
  2003c8:	31 f6                	xor    %esi,%esi
  2003ca:	eb 02                	jmp    2003ce <i2A+0x1a>
  2003cc:	89 fe                	mov    %edi,%esi
  2003ce:	bb 1d 00 00 00       	mov    $0x1d,%ebx
  2003d3:	29 f3                	sub    %esi,%ebx
  2003d5:	8d 45 d5             	lea    -0x2b(%ebp),%eax
  2003d8:	01 c3                	add    %eax,%ebx
  2003da:	8d 7e 01             	lea    0x1(%esi),%edi
  2003dd:	b8 67 66 66 66       	mov    $0x66666667,%eax
  2003e2:	f7 e9                	imul   %ecx
  2003e4:	89 d0                	mov    %edx,%eax
  2003e6:	c1 f8 02             	sar    $0x2,%eax
  2003e9:	c1 f9 1f             	sar    $0x1f,%ecx
  2003ec:	29 c8                	sub    %ecx,%eax
  2003ee:	89 c1                	mov    %eax,%ecx
  2003f0:	75 da                	jne    2003cc <i2A+0x18>
  2003f2:	80 7d d3 01          	cmpb   $0x1,-0x2d(%ebp)
  2003f6:	75 04                	jne    2003fc <i2A+0x48>
  2003f8:	4b                   	dec    %ebx
  2003f9:	8d 7e 02             	lea    0x2(%esi),%edi
  2003fc:	8b 45 0c             	mov    0xc(%ebp),%eax
  2003ff:	89 18                	mov    %ebx,(%eax)
  200401:	89 f8                	mov    %edi,%eax
  200403:	83 c4 24             	add    $0x24,%esp
  200406:	5b                   	pop    %ebx
  200407:	5e                   	pop    %esi
  200408:	5f                   	pop    %edi
  200409:	5d                   	pop    %ebp
  20040a:	c3                   	ret    
  20040b:	90                   	nop
  20040c:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  200412:	74 08                	je     20041c <i2A+0x68>
  200414:	f7 d9                	neg    %ecx
  200416:	c6 45 d3 01          	movb   $0x1,-0x2d(%ebp)
  20041a:	eb ac                	jmp    2003c8 <i2A+0x14>
  20041c:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  200421:	eb f3                	jmp    200416 <i2A+0x62>
  200423:	90                   	nop

00200424 <i2X>:
  200424:	55                   	push   %ebp
  200425:	89 e5                	mov    %esp,%ebp
  200427:	57                   	push   %edi
  200428:	56                   	push   %esi
  200429:	53                   	push   %ebx
  20042a:	8b 55 08             	mov    0x8(%ebp),%edx
  20042d:	b9 d1 21 20 00       	mov    $0x2021d1,%ecx
  200432:	31 c0                	xor    %eax,%eax
  200434:	40                   	inc    %eax
  200435:	89 d6                	mov    %edx,%esi
  200437:	83 e6 0f             	and    $0xf,%esi
  20043a:	8d 5e f6             	lea    -0xa(%esi),%ebx
  20043d:	89 cf                	mov    %ecx,%edi
  20043f:	83 fb 05             	cmp    $0x5,%ebx
  200442:	77 4c                	ja     200490 <i2X+0x6c>
  200444:	ff 24 9d 14 07 20 00 	jmp    *0x200714(,%ebx,4)
  20044b:	90                   	nop
  20044c:	c6 01 65             	movb   $0x65,(%ecx)
  20044f:	90                   	nop
  200450:	49                   	dec    %ecx
  200451:	c1 ea 04             	shr    $0x4,%edx
  200454:	75 de                	jne    200434 <i2X+0x10>
  200456:	c6 05 d2 21 20 00 00 	movb   $0x0,0x2021d2
  20045d:	8b 55 0c             	mov    0xc(%ebp),%edx
  200460:	89 3a                	mov    %edi,(%edx)
  200462:	5b                   	pop    %ebx
  200463:	5e                   	pop    %esi
  200464:	5f                   	pop    %edi
  200465:	5d                   	pop    %ebp
  200466:	c3                   	ret    
  200467:	90                   	nop
  200468:	c6 01 64             	movb   $0x64,(%ecx)
  20046b:	eb e3                	jmp    200450 <i2X+0x2c>
  20046d:	8d 76 00             	lea    0x0(%esi),%esi
  200470:	c6 01 63             	movb   $0x63,(%ecx)
  200473:	eb db                	jmp    200450 <i2X+0x2c>
  200475:	8d 76 00             	lea    0x0(%esi),%esi
  200478:	c6 01 62             	movb   $0x62,(%ecx)
  20047b:	eb d3                	jmp    200450 <i2X+0x2c>
  20047d:	8d 76 00             	lea    0x0(%esi),%esi
  200480:	c6 01 61             	movb   $0x61,(%ecx)
  200483:	eb cb                	jmp    200450 <i2X+0x2c>
  200485:	8d 76 00             	lea    0x0(%esi),%esi
  200488:	c6 01 66             	movb   $0x66,(%ecx)
  20048b:	eb c3                	jmp    200450 <i2X+0x2c>
  20048d:	8d 76 00             	lea    0x0(%esi),%esi
  200490:	8d 5e 30             	lea    0x30(%esi),%ebx
  200493:	88 19                	mov    %bl,(%ecx)
  200495:	eb b9                	jmp    200450 <i2X+0x2c>
  200497:	90                   	nop

00200498 <memcpy>:
  200498:	55                   	push   %ebp
  200499:	89 e5                	mov    %esp,%ebp
  20049b:	57                   	push   %edi
  20049c:	56                   	push   %esi
  20049d:	53                   	push   %ebx
  20049e:	8b 55 08             	mov    0x8(%ebp),%edx
  2004a1:	8b 7d 0c             	mov    0xc(%ebp),%edi
  2004a4:	8b 45 10             	mov    0x10(%ebp),%eax
  2004a7:	85 c0                	test   %eax,%eax
  2004a9:	7e 35                	jle    2004e0 <memcpy+0x48>
  2004ab:	8a 1f                	mov    (%edi),%bl
  2004ad:	84 db                	test   %bl,%bl
  2004af:	74 2f                	je     2004e0 <memcpy+0x48>
  2004b1:	8d 34 02             	lea    (%edx,%eax,1),%esi
  2004b4:	31 c9                	xor    %ecx,%ecx
  2004b6:	eb 07                	jmp    2004bf <memcpy+0x27>
  2004b8:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  2004bb:	84 db                	test   %bl,%bl
  2004bd:	74 15                	je     2004d4 <memcpy+0x3c>
  2004bf:	42                   	inc    %edx
  2004c0:	88 5a ff             	mov    %bl,-0x1(%edx)
  2004c3:	41                   	inc    %ecx
  2004c4:	39 f2                	cmp    %esi,%edx
  2004c6:	75 f0                	jne    2004b8 <memcpy+0x20>
  2004c8:	c6 06 00             	movb   $0x0,(%esi)
  2004cb:	29 c8                	sub    %ecx,%eax
  2004cd:	5b                   	pop    %ebx
  2004ce:	5e                   	pop    %esi
  2004cf:	5f                   	pop    %edi
  2004d0:	5d                   	pop    %ebp
  2004d1:	c3                   	ret    
  2004d2:	66 90                	xchg   %ax,%ax
  2004d4:	89 d6                	mov    %edx,%esi
  2004d6:	c6 06 00             	movb   $0x0,(%esi)
  2004d9:	29 c8                	sub    %ecx,%eax
  2004db:	5b                   	pop    %ebx
  2004dc:	5e                   	pop    %esi
  2004dd:	5f                   	pop    %edi
  2004de:	5d                   	pop    %ebp
  2004df:	c3                   	ret    
  2004e0:	89 d6                	mov    %edx,%esi
  2004e2:	31 c9                	xor    %ecx,%ecx
  2004e4:	eb e2                	jmp    2004c8 <memcpy+0x30>
  2004e6:	66 90                	xchg   %ax,%ax

002004e8 <printc>:
  2004e8:	55                   	push   %ebp
  2004e9:	89 e5                	mov    %esp,%ebp
  2004eb:	83 ec 20             	sub    $0x20,%esp
  2004ee:	c7 45 f8 04 00 00 00 	movl   $0x4,-0x8(%ebp)
  2004f5:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  2004fc:	8b 45 08             	mov    0x8(%ebp),%eax
  2004ff:	2d 00 00 01 00       	sub    $0x10000,%eax
  200504:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200507:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  20050e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  200515:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  20051c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  20051f:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  200522:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200525:	8b 55 ec             	mov    -0x14(%ebp),%edx
  200528:	8b 7d e8             	mov    -0x18(%ebp),%edi
  20052b:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  20052e:	cd 80                	int    $0x80
  200530:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200533:	c9                   	leave  
  200534:	c3                   	ret    
  200535:	8d 76 00             	lea    0x0(%esi),%esi

00200538 <prints>:
  200538:	55                   	push   %ebp
  200539:	89 e5                	mov    %esp,%ebp
  20053b:	83 ec 20             	sub    $0x20,%esp
  20053e:	8b 55 08             	mov    0x8(%ebp),%edx
  200541:	80 3a 00             	cmpb   $0x0,(%edx)
  200544:	74 4c                	je     200592 <prints+0x5a>
  200546:	31 c0                	xor    %eax,%eax
  200548:	40                   	inc    %eax
  200549:	89 c1                	mov    %eax,%ecx
  20054b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  20054f:	75 f7                	jne    200548 <prints+0x10>
  200551:	c7 45 f8 04 00 00 00 	movl   $0x4,-0x8(%ebp)
  200558:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  20055f:	81 ea 00 00 01 00    	sub    $0x10000,%edx
  200565:	89 55 f0             	mov    %edx,-0x10(%ebp)
  200568:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  20056b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  200572:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  200579:	8b 45 f8             	mov    -0x8(%ebp),%eax
  20057c:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  20057f:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200582:	8b 55 ec             	mov    -0x14(%ebp),%edx
  200585:	8b 7d e8             	mov    -0x18(%ebp),%edi
  200588:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  20058b:	cd 80                	int    $0x80
  20058d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200590:	c9                   	leave  
  200591:	c3                   	ret    
  200592:	31 c9                	xor    %ecx,%ecx
  200594:	eb bb                	jmp    200551 <prints+0x19>
  200596:	66 90                	xchg   %ax,%ax

00200598 <length_str>:
  200598:	55                   	push   %ebp
  200599:	89 e5                	mov    %esp,%ebp
  20059b:	8b 55 08             	mov    0x8(%ebp),%edx
  20059e:	31 c0                	xor    %eax,%eax
  2005a0:	80 3a 00             	cmpb   $0x0,(%edx)
  2005a3:	74 0a                	je     2005af <length_str+0x17>
  2005a5:	8d 76 00             	lea    0x0(%esi),%esi
  2005a8:	40                   	inc    %eax
  2005a9:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  2005ad:	75 f9                	jne    2005a8 <length_str+0x10>
  2005af:	5d                   	pop    %ebp
  2005b0:	c3                   	ret    
  2005b1:	8d 76 00             	lea    0x0(%esi),%esi

002005b4 <printf>:
  2005b4:	55                   	push   %ebp
  2005b5:	89 e5                	mov    %esp,%ebp
  2005b7:	57                   	push   %edi
  2005b8:	56                   	push   %esi
  2005b9:	53                   	push   %ebx
  2005ba:	81 ec 14 08 00 00    	sub    $0x814,%esp
  2005c0:	be 2c 07 20 00       	mov    $0x20072c,%esi
  2005c5:	b8 06 00 00 00       	mov    $0x6,%eax
  2005ca:	8d bd f4 f7 ff ff    	lea    -0x80c(%ebp),%edi
  2005d0:	89 c1                	mov    %eax,%ecx
  2005d2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  2005d4:	89 c8                	mov    %ecx,%eax
  2005d6:	8d bd 0c f8 ff ff    	lea    -0x7f4(%ebp),%edi
  2005dc:	b9 fa 01 00 00       	mov    $0x1fa,%ecx
  2005e1:	f3 ab                	rep stos %eax,%es:(%edi)
  2005e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2005e6:	8a 01                	mov    (%ecx),%al
  2005e8:	84 c0                	test   %al,%al
  2005ea:	0f 84 96 00 00 00    	je     200686 <printf+0xd2>
  2005f0:	8d 55 0c             	lea    0xc(%ebp),%edx
  2005f3:	31 f6                	xor    %esi,%esi
  2005f5:	eb 17                	jmp    20060e <printf+0x5a>
  2005f7:	90                   	nop
  2005f8:	8a 01                	mov    (%ecx),%al
  2005fa:	89 cb                	mov    %ecx,%ebx
  2005fc:	88 84 35 f4 f7 ff ff 	mov    %al,-0x80c(%ebp,%esi,1)
  200603:	46                   	inc    %esi
  200604:	8d 4b 01             	lea    0x1(%ebx),%ecx
  200607:	8a 43 01             	mov    0x1(%ebx),%al
  20060a:	84 c0                	test   %al,%al
  20060c:	74 78                	je     200686 <printf+0xd2>
  20060e:	3c 25                	cmp    $0x25,%al
  200610:	75 e6                	jne    2005f8 <printf+0x44>
  200612:	8d 59 01             	lea    0x1(%ecx),%ebx
  200615:	8a 41 01             	mov    0x1(%ecx),%al
  200618:	3c 64                	cmp    $0x64,%al
  20061a:	74 74                	je     200690 <printf+0xdc>
  20061c:	0f 8e 82 00 00 00    	jle    2006a4 <printf+0xf0>
  200622:	3c 73                	cmp    $0x73,%al
  200624:	74 de                	je     200604 <printf+0x50>
  200626:	3c 78                	cmp    $0x78,%al
  200628:	75 d2                	jne    2005fc <printf+0x48>
  20062a:	c7 85 f0 f7 ff ff 00 	movl   $0x0,-0x810(%ebp)
  200631:	00 00 00 
  200634:	8d 42 04             	lea    0x4(%edx),%eax
  200637:	89 85 e0 f7 ff ff    	mov    %eax,-0x820(%ebp)
  20063d:	8d 85 f0 f7 ff ff    	lea    -0x810(%ebp),%eax
  200643:	50                   	push   %eax
  200644:	ff 32                	pushl  (%edx)
  200646:	e8 d9 fd ff ff       	call   200424 <i2X>
  20064b:	8b 8d f0 f7 ff ff    	mov    -0x810(%ebp),%ecx
  200651:	8d 85 f4 f7 ff ff    	lea    -0x80c(%ebp),%eax
  200657:	8d 3c 30             	lea    (%eax,%esi,1),%edi
  20065a:	8a 11                	mov    (%ecx),%dl
  20065c:	83 c4 08             	add    $0x8,%esp
  20065f:	31 c0                	xor    %eax,%eax
  200661:	84 d2                	test   %dl,%dl
  200663:	74 0f                	je     200674 <printf+0xc0>
  200665:	8d 76 00             	lea    0x0(%esi),%esi
  200668:	40                   	inc    %eax
  200669:	88 54 07 ff          	mov    %dl,-0x1(%edi,%eax,1)
  20066d:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  200670:	84 d2                	test   %dl,%dl
  200672:	75 f4                	jne    200668 <printf+0xb4>
  200674:	01 c6                	add    %eax,%esi
  200676:	8b 95 e0 f7 ff ff    	mov    -0x820(%ebp),%edx
  20067c:	8d 4b 01             	lea    0x1(%ebx),%ecx
  20067f:	8a 43 01             	mov    0x1(%ebx),%al
  200682:	84 c0                	test   %al,%al
  200684:	75 88                	jne    20060e <printf+0x5a>
  200686:	8d 65 f4             	lea    -0xc(%ebp),%esp
  200689:	5b                   	pop    %ebx
  20068a:	5e                   	pop    %esi
  20068b:	5f                   	pop    %edi
  20068c:	5d                   	pop    %ebp
  20068d:	c3                   	ret    
  20068e:	66 90                	xchg   %ax,%ax
  200690:	8d 7a 04             	lea    0x4(%edx),%edi
  200693:	ff 32                	pushl  (%edx)
  200695:	e8 7a fb ff ff       	call   200214 <printd>
  20069a:	58                   	pop    %eax
  20069b:	89 fa                	mov    %edi,%edx
  20069d:	e9 62 ff ff ff       	jmp    200604 <printf+0x50>
  2006a2:	66 90                	xchg   %ax,%ax
  2006a4:	3c 63                	cmp    $0x63,%al
  2006a6:	0f 85 50 ff ff ff    	jne    2005fc <printf+0x48>
  2006ac:	8b 02                	mov    (%edx),%eax
  2006ae:	88 84 35 f4 f7 ff ff 	mov    %al,-0x80c(%ebp,%esi,1)
  2006b5:	83 c2 04             	add    $0x4,%edx
  2006b8:	46                   	inc    %esi
  2006b9:	e9 46 ff ff ff       	jmp    200604 <printf+0x50>
