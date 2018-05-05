
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	53                   	push   %ebx
  200004:	83 ec 10             	sub    $0x10,%esp
  200007:	68 a1 c1 85 00       	push   $0x85c1a1
  20000c:	e8 ff 00 00 00       	call   200110 <printd>
  200011:	58                   	pop    %eax
  200012:	5a                   	pop    %edx
  200013:	6a 0c                	push   $0xc
  200015:	68 e0 03 20 00       	push   $0x2003e0
  20001a:	e8 cd 02 00 00       	call   2002ec <printf>
  20001f:	e8 b4 00 00 00       	call   2000d8 <exit>
  200024:	e8 77 00 00 00       	call   2000a0 <fork>
  200029:	89 c3                	mov    %eax,%ebx
  20002b:	83 c4 10             	add    $0x10,%esp
  20002e:	85 c0                	test   %eax,%eax
  200030:	75 38                	jne    20006a <uEntry+0x6a>
  200032:	83 ec 0c             	sub    $0xc,%esp
  200035:	68 e3 03 20 00       	push   $0x2003e3
  20003a:	e8 ad 02 00 00       	call   2002ec <printf>
  20003f:	83 c4 10             	add    $0x10,%esp
  200042:	83 ec 08             	sub    $0x8,%esp
  200045:	53                   	push   %ebx
  200046:	68 fc 03 20 00       	push   $0x2003fc
  20004b:	e8 9c 02 00 00       	call   2002ec <printf>
  200050:	e8 83 00 00 00       	call   2000d8 <exit>
  200055:	83 c4 10             	add    $0x10,%esp
  200058:	83 ec 0c             	sub    $0xc,%esp
  20005b:	68 06 04 20 00       	push   $0x200406
  200060:	e8 87 02 00 00       	call   2002ec <printf>
  200065:	83 c4 10             	add    $0x10,%esp
  200068:	eb ee                	jmp    200058 <uEntry+0x58>
  20006a:	83 ec 0c             	sub    $0xc,%esp
  20006d:	6a 25                	push   $0x25
  20006f:	e8 4c 00 00 00       	call   2000c0 <sleep>
  200074:	c7 04 24 ef 03 20 00 	movl   $0x2003ef,(%esp)
  20007b:	e8 6c 02 00 00       	call   2002ec <printf>
  200080:	83 c4 10             	add    $0x10,%esp
  200083:	eb bd                	jmp    200042 <uEntry+0x42>
  200085:	66 90                	xchg   %ax,%ax
  200087:	90                   	nop

00200088 <syscall>:
  200088:	55                   	push   %ebp
  200089:	89 e5                	mov    %esp,%ebp
  20008b:	53                   	push   %ebx
  20008c:	8b 55 14             	mov    0x14(%ebp),%edx
  20008f:	8b 4d 10             	mov    0x10(%ebp),%ecx
  200092:	8b 45 08             	mov    0x8(%ebp),%eax
  200095:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  200098:	cd 80                	int    $0x80
  20009a:	5b                   	pop    %ebx
  20009b:	5d                   	pop    %ebp
  20009c:	c3                   	ret    
  20009d:	8d 76 00             	lea    0x0(%esi),%esi

002000a0 <fork>:
  2000a0:	55                   	push   %ebp
  2000a1:	89 e5                	mov    %esp,%ebp
  2000a3:	53                   	push   %ebx
  2000a4:	ba 0d 00 00 00       	mov    $0xd,%edx
  2000a9:	b9 15 04 20 00       	mov    $0x200415,%ecx
  2000ae:	bb 01 00 00 00       	mov    $0x1,%ebx
  2000b3:	b8 02 00 00 00       	mov    $0x2,%eax
  2000b8:	cd 80                	int    $0x80
  2000ba:	5b                   	pop    %ebx
  2000bb:	5d                   	pop    %ebp
  2000bc:	c3                   	ret    
  2000bd:	8d 76 00             	lea    0x0(%esi),%esi

002000c0 <sleep>:
  2000c0:	55                   	push   %ebp
  2000c1:	89 e5                	mov    %esp,%ebp
  2000c3:	53                   	push   %ebx
  2000c4:	31 c9                	xor    %ecx,%ecx
  2000c6:	b8 e6 00 00 00       	mov    $0xe6,%eax
  2000cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  2000ce:	89 ca                	mov    %ecx,%edx
  2000d0:	cd 80                	int    $0x80
  2000d2:	31 c0                	xor    %eax,%eax
  2000d4:	5b                   	pop    %ebx
  2000d5:	5d                   	pop    %ebp
  2000d6:	c3                   	ret    
  2000d7:	90                   	nop

002000d8 <exit>:
  2000d8:	55                   	push   %ebp
  2000d9:	89 e5                	mov    %esp,%ebp
  2000db:	53                   	push   %ebx
  2000dc:	31 d2                	xor    %edx,%edx
  2000de:	b8 01 00 00 00       	mov    $0x1,%eax
  2000e3:	89 d3                	mov    %edx,%ebx
  2000e5:	89 d1                	mov    %edx,%ecx
  2000e7:	cd 80                	int    $0x80
  2000e9:	31 c0                	xor    %eax,%eax
  2000eb:	5b                   	pop    %ebx
  2000ec:	5d                   	pop    %ebp
  2000ed:	c3                   	ret    
  2000ee:	66 90                	xchg   %ax,%ax

002000f0 <putchar_user>:
  2000f0:	55                   	push   %ebp
  2000f1:	89 e5                	mov    %esp,%ebp
  2000f3:	53                   	push   %ebx
  2000f4:	83 ec 10             	sub    $0x10,%esp
  2000f7:	bb 01 00 00 00       	mov    $0x1,%ebx
  2000fc:	8d 4d fb             	lea    -0x5(%ebp),%ecx
  2000ff:	b8 04 00 00 00       	mov    $0x4,%eax
  200104:	89 da                	mov    %ebx,%edx
  200106:	cd 80                	int    $0x80
  200108:	83 c4 10             	add    $0x10,%esp
  20010b:	5b                   	pop    %ebx
  20010c:	5d                   	pop    %ebp
  20010d:	c3                   	ret    
  20010e:	66 90                	xchg   %ax,%ax

00200110 <printd>:
  200110:	55                   	push   %ebp
  200111:	89 e5                	mov    %esp,%ebp
  200113:	57                   	push   %edi
  200114:	56                   	push   %esi
  200115:	53                   	push   %ebx
  200116:	83 ec 24             	sub    $0x24,%esp
  200119:	8b 5d 08             	mov    0x8(%ebp),%ebx
  20011c:	85 db                	test   %ebx,%ebx
  20011e:	0f 88 80 00 00 00    	js     2001a4 <printd+0x94>
  200124:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
  200128:	c6 45 d3 00          	movb   $0x0,-0x2d(%ebp)
  20012c:	8d 4d f3             	lea    -0xd(%ebp),%ecx
  20012f:	be 0a 00 00 00       	mov    $0xa,%esi
  200134:	bf 67 66 66 66       	mov    $0x66666667,%edi
  200139:	8d 76 00             	lea    0x0(%esi),%esi
  20013c:	49                   	dec    %ecx
  20013d:	89 d8                	mov    %ebx,%eax
  20013f:	99                   	cltd   
  200140:	f7 fe                	idiv   %esi
  200142:	83 c2 30             	add    $0x30,%edx
  200145:	88 11                	mov    %dl,(%ecx)
  200147:	89 d8                	mov    %ebx,%eax
  200149:	f7 ef                	imul   %edi
  20014b:	89 d0                	mov    %edx,%eax
  20014d:	c1 f8 02             	sar    $0x2,%eax
  200150:	c1 fb 1f             	sar    $0x1f,%ebx
  200153:	29 d8                	sub    %ebx,%eax
  200155:	89 c3                	mov    %eax,%ebx
  200157:	75 e3                	jne    20013c <printd+0x2c>
  200159:	80 7d d3 01          	cmpb   $0x1,-0x2d(%ebp)
  20015d:	74 35                	je     200194 <printd+0x84>
  20015f:	80 7d d2 01          	cmpb   $0x1,-0x2e(%ebp)
  200163:	74 3a                	je     20019f <printd+0x8f>
  200165:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  200169:	80 39 00             	cmpb   $0x0,(%ecx)
  20016c:	74 58                	je     2001c6 <printd+0xb6>
  20016e:	31 c0                	xor    %eax,%eax
  200170:	40                   	inc    %eax
  200171:	89 c2                	mov    %eax,%edx
  200173:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  200177:	75 f7                	jne    200170 <printd+0x60>
  200179:	81 e9 00 00 01 00    	sub    $0x10000,%ecx
  20017f:	bb 01 00 00 00       	mov    $0x1,%ebx
  200184:	b8 04 00 00 00       	mov    $0x4,%eax
  200189:	cd 80                	int    $0x80
  20018b:	83 c4 24             	add    $0x24,%esp
  20018e:	5b                   	pop    %ebx
  20018f:	5e                   	pop    %esi
  200190:	5f                   	pop    %edi
  200191:	5d                   	pop    %ebp
  200192:	c3                   	ret    
  200193:	90                   	nop
  200194:	c6 41 ff 2d          	movb   $0x2d,-0x1(%ecx)
  200198:	49                   	dec    %ecx
  200199:	80 7d d2 01          	cmpb   $0x1,-0x2e(%ebp)
  20019d:	75 c6                	jne    200165 <printd+0x55>
  20019f:	fe 45 f2             	incb   -0xe(%ebp)
  2001a2:	eb c1                	jmp    200165 <printd+0x55>
  2001a4:	81 fb 00 00 00 80    	cmp    $0x80000000,%ebx
  2001aa:	74 0f                	je     2001bb <printd+0xab>
  2001ac:	f7 db                	neg    %ebx
  2001ae:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
  2001b2:	c6 45 d3 01          	movb   $0x1,-0x2d(%ebp)
  2001b6:	e9 71 ff ff ff       	jmp    20012c <printd+0x1c>
  2001bb:	bb ff ff ff 7f       	mov    $0x7fffffff,%ebx
  2001c0:	c6 45 d2 01          	movb   $0x1,-0x2e(%ebp)
  2001c4:	eb ec                	jmp    2001b2 <printd+0xa2>
  2001c6:	31 d2                	xor    %edx,%edx
  2001c8:	eb af                	jmp    200179 <printd+0x69>
  2001ca:	66 90                	xchg   %ax,%ax

002001cc <printx>:
  2001cc:	55                   	push   %ebp
  2001cd:	89 e5                	mov    %esp,%ebp
  2001cf:	53                   	push   %ebx
  2001d0:	83 ec 20             	sub    $0x20,%esp
  2001d3:	8b 45 08             	mov    0x8(%ebp),%eax
  2001d6:	8d 55 fa             	lea    -0x6(%ebp),%edx
  2001d9:	8d 76 00             	lea    0x0(%esi),%esi
  2001dc:	89 c3                	mov    %eax,%ebx
  2001de:	81 e3 0f 00 00 80    	and    $0x8000000f,%ebx
  2001e4:	0f 88 8e 00 00 00    	js     200278 <printx+0xac>
  2001ea:	8d 4b f6             	lea    -0xa(%ebx),%ecx
  2001ed:	83 f9 05             	cmp    $0x5,%ecx
  2001f0:	0f 87 93 00 00 00    	ja     200289 <printx+0xbd>
  2001f6:	ff 24 8d 20 04 20 00 	jmp    *0x200420(,%ecx,4)
  2001fd:	8d 76 00             	lea    0x0(%esi),%esi
  200200:	89 d1                	mov    %edx,%ecx
  200202:	c6 02 65             	movb   $0x65,(%edx)
  200205:	8d 76 00             	lea    0x0(%esi),%esi
  200208:	85 c0                	test   %eax,%eax
  20020a:	78 44                	js     200250 <printx+0x84>
  20020c:	c1 f8 04             	sar    $0x4,%eax
  20020f:	4a                   	dec    %edx
  200210:	85 c0                	test   %eax,%eax
  200212:	75 c8                	jne    2001dc <printx+0x10>
  200214:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
  200218:	80 39 00             	cmpb   $0x0,(%ecx)
  20021b:	74 78                	je     200295 <printx+0xc9>
  20021d:	8d 76 00             	lea    0x0(%esi),%esi
  200220:	40                   	inc    %eax
  200221:	89 c2                	mov    %eax,%edx
  200223:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  200227:	75 f7                	jne    200220 <printx+0x54>
  200229:	81 e9 00 00 01 00    	sub    $0x10000,%ecx
  20022f:	bb 01 00 00 00       	mov    $0x1,%ebx
  200234:	b8 04 00 00 00       	mov    $0x4,%eax
  200239:	cd 80                	int    $0x80
  20023b:	83 c4 20             	add    $0x20,%esp
  20023e:	5b                   	pop    %ebx
  20023f:	5d                   	pop    %ebp
  200240:	c3                   	ret    
  200241:	8d 76 00             	lea    0x0(%esi),%esi
  200244:	89 d1                	mov    %edx,%ecx
  200246:	c6 02 64             	movb   $0x64,(%edx)
  200249:	85 c0                	test   %eax,%eax
  20024b:	79 bf                	jns    20020c <printx+0x40>
  20024d:	8d 76 00             	lea    0x0(%esi),%esi
  200250:	83 c0 0f             	add    $0xf,%eax
  200253:	eb b7                	jmp    20020c <printx+0x40>
  200255:	8d 76 00             	lea    0x0(%esi),%esi
  200258:	89 d1                	mov    %edx,%ecx
  20025a:	c6 02 63             	movb   $0x63,(%edx)
  20025d:	eb a9                	jmp    200208 <printx+0x3c>
  20025f:	90                   	nop
  200260:	89 d1                	mov    %edx,%ecx
  200262:	c6 02 62             	movb   $0x62,(%edx)
  200265:	eb a1                	jmp    200208 <printx+0x3c>
  200267:	90                   	nop
  200268:	89 d1                	mov    %edx,%ecx
  20026a:	c6 02 61             	movb   $0x61,(%edx)
  20026d:	eb 99                	jmp    200208 <printx+0x3c>
  20026f:	90                   	nop
  200270:	89 d1                	mov    %edx,%ecx
  200272:	c6 02 66             	movb   $0x66,(%edx)
  200275:	eb 91                	jmp    200208 <printx+0x3c>
  200277:	90                   	nop
  200278:	4b                   	dec    %ebx
  200279:	83 cb f0             	or     $0xfffffff0,%ebx
  20027c:	43                   	inc    %ebx
  20027d:	8d 4b f6             	lea    -0xa(%ebx),%ecx
  200280:	83 f9 05             	cmp    $0x5,%ecx
  200283:	0f 86 6d ff ff ff    	jbe    2001f6 <printx+0x2a>
  200289:	89 d1                	mov    %edx,%ecx
  20028b:	83 c3 30             	add    $0x30,%ebx
  20028e:	88 1a                	mov    %bl,(%edx)
  200290:	e9 73 ff ff ff       	jmp    200208 <printx+0x3c>
  200295:	31 d2                	xor    %edx,%edx
  200297:	eb 90                	jmp    200229 <printx+0x5d>
  200299:	8d 76 00             	lea    0x0(%esi),%esi

0020029c <printc>:
  20029c:	55                   	push   %ebp
  20029d:	89 e5                	mov    %esp,%ebp
  20029f:	53                   	push   %ebx
  2002a0:	50                   	push   %eax
  2002a1:	bb 01 00 00 00       	mov    $0x1,%ebx
  2002a6:	8d 4d f8             	lea    -0x8(%ebp),%ecx
  2002a9:	b8 04 00 00 00       	mov    $0x4,%eax
  2002ae:	89 da                	mov    %ebx,%edx
  2002b0:	cd 80                	int    $0x80
  2002b2:	5a                   	pop    %edx
  2002b3:	5b                   	pop    %ebx
  2002b4:	5d                   	pop    %ebp
  2002b5:	c3                   	ret    
  2002b6:	66 90                	xchg   %ax,%ax

002002b8 <prints>:
  2002b8:	55                   	push   %ebp
  2002b9:	89 e5                	mov    %esp,%ebp
  2002bb:	53                   	push   %ebx
  2002bc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2002bf:	80 39 00             	cmpb   $0x0,(%ecx)
  2002c2:	74 22                	je     2002e6 <prints+0x2e>
  2002c4:	31 c0                	xor    %eax,%eax
  2002c6:	66 90                	xchg   %ax,%ax
  2002c8:	40                   	inc    %eax
  2002c9:	89 c2                	mov    %eax,%edx
  2002cb:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  2002cf:	75 f7                	jne    2002c8 <prints+0x10>
  2002d1:	81 e9 00 00 01 00    	sub    $0x10000,%ecx
  2002d7:	bb 01 00 00 00       	mov    $0x1,%ebx
  2002dc:	b8 04 00 00 00       	mov    $0x4,%eax
  2002e1:	cd 80                	int    $0x80
  2002e3:	5b                   	pop    %ebx
  2002e4:	5d                   	pop    %ebp
  2002e5:	c3                   	ret    
  2002e6:	31 d2                	xor    %edx,%edx
  2002e8:	eb e7                	jmp    2002d1 <prints+0x19>
  2002ea:	66 90                	xchg   %ax,%ax

002002ec <printf>:
  2002ec:	55                   	push   %ebp
  2002ed:	89 e5                	mov    %esp,%ebp
  2002ef:	57                   	push   %edi
  2002f0:	56                   	push   %esi
  2002f1:	53                   	push   %ebx
  2002f2:	83 ec 14             	sub    $0x14,%esp
  2002f5:	8b 7d 08             	mov    0x8(%ebp),%edi
  2002f8:	8a 07                	mov    (%edi),%al
  2002fa:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  2002fd:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  200300:	84 c0                	test   %al,%al
  200302:	75 24                	jne    200328 <printf+0x3c>
  200304:	eb 59                	jmp    20035f <printf+0x73>
  200306:	66 90                	xchg   %ax,%ax
  200308:	88 45 f3             	mov    %al,-0xd(%ebp)
  20030b:	ba 01 00 00 00       	mov    $0x1,%edx
  200310:	b8 04 00 00 00       	mov    $0x4,%eax
  200315:	89 d3                	mov    %edx,%ebx
  200317:	8d 4d f3             	lea    -0xd(%ebp),%ecx
  20031a:	cd 80                	int    $0x80
  20031c:	89 fe                	mov    %edi,%esi
  20031e:	8d 7e 01             	lea    0x1(%esi),%edi
  200321:	8a 46 01             	mov    0x1(%esi),%al
  200324:	84 c0                	test   %al,%al
  200326:	74 37                	je     20035f <printf+0x73>
  200328:	3c 25                	cmp    $0x25,%al
  20032a:	75 dc                	jne    200308 <printf+0x1c>
  20032c:	8d 77 01             	lea    0x1(%edi),%esi
  20032f:	8a 47 01             	mov    0x1(%edi),%al
  200332:	3c 64                	cmp    $0x64,%al
  200334:	0f 84 8a 00 00 00    	je     2003c4 <printf+0xd8>
  20033a:	7e 2c                	jle    200368 <printf+0x7c>
  20033c:	3c 73                	cmp    $0x73,%al
  20033e:	74 50                	je     200390 <printf+0xa4>
  200340:	3c 78                	cmp    $0x78,%al
  200342:	75 da                	jne    20031e <printf+0x32>
  200344:	8b 45 e0             	mov    -0x20(%ebp),%eax
  200347:	8d 58 04             	lea    0x4(%eax),%ebx
  20034a:	ff 30                	pushl  (%eax)
  20034c:	e8 7b fe ff ff       	call   2001cc <printx>
  200351:	58                   	pop    %eax
  200352:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  200355:	8d 7e 01             	lea    0x1(%esi),%edi
  200358:	8a 46 01             	mov    0x1(%esi),%al
  20035b:	84 c0                	test   %al,%al
  20035d:	75 c9                	jne    200328 <printf+0x3c>
  20035f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  200362:	5b                   	pop    %ebx
  200363:	5e                   	pop    %esi
  200364:	5f                   	pop    %edi
  200365:	5d                   	pop    %ebp
  200366:	c3                   	ret    
  200367:	90                   	nop
  200368:	3c 63                	cmp    $0x63,%al
  20036a:	75 b2                	jne    20031e <printf+0x32>
  20036c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  20036f:	8d 78 04             	lea    0x4(%eax),%edi
  200372:	8b 00                	mov    (%eax),%eax
  200374:	88 45 f2             	mov    %al,-0xe(%ebp)
  200377:	ba 01 00 00 00       	mov    $0x1,%edx
  20037c:	b8 04 00 00 00       	mov    $0x4,%eax
  200381:	89 d3                	mov    %edx,%ebx
  200383:	8d 4d f2             	lea    -0xe(%ebp),%ecx
  200386:	cd 80                	int    $0x80
  200388:	89 7d e0             	mov    %edi,-0x20(%ebp)
  20038b:	eb 91                	jmp    20031e <printf+0x32>
  20038d:	8d 76 00             	lea    0x0(%esi),%esi
  200390:	8b 45 e0             	mov    -0x20(%ebp),%eax
  200393:	8d 78 04             	lea    0x4(%eax),%edi
  200396:	8b 08                	mov    (%eax),%ecx
  200398:	80 39 00             	cmpb   $0x0,(%ecx)
  20039b:	74 3d                	je     2003da <printf+0xee>
  20039d:	31 c0                	xor    %eax,%eax
  20039f:	90                   	nop
  2003a0:	40                   	inc    %eax
  2003a1:	89 c2                	mov    %eax,%edx
  2003a3:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
  2003a7:	75 f7                	jne    2003a0 <printf+0xb4>
  2003a9:	81 e9 00 00 01 00    	sub    $0x10000,%ecx
  2003af:	bb 01 00 00 00       	mov    $0x1,%ebx
  2003b4:	b8 04 00 00 00       	mov    $0x4,%eax
  2003b9:	cd 80                	int    $0x80
  2003bb:	89 7d e0             	mov    %edi,-0x20(%ebp)
  2003be:	e9 5b ff ff ff       	jmp    20031e <printf+0x32>
  2003c3:	90                   	nop
  2003c4:	8b 45 e0             	mov    -0x20(%ebp),%eax
  2003c7:	8d 58 04             	lea    0x4(%eax),%ebx
  2003ca:	ff 30                	pushl  (%eax)
  2003cc:	e8 3f fd ff ff       	call   200110 <printd>
  2003d1:	5a                   	pop    %edx
  2003d2:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  2003d5:	e9 44 ff ff ff       	jmp    20031e <printf+0x32>
  2003da:	31 d2                	xor    %edx,%edx
  2003dc:	eb cb                	jmp    2003a9 <printf+0xbd>
