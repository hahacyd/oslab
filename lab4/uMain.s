
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	56                   	push   %esi
  200004:	53                   	push   %ebx
  200005:	83 ec 1c             	sub    $0x1c,%esp
  200008:	68 f8 03 20 00       	push   $0x2003f8
  20000d:	e8 f6 02 00 00       	call   200308 <printf>
  200012:	58                   	pop    %eax
  200013:	5a                   	pop    %edx
  200014:	6a 02                	push   $0x2
  200016:	8d 5d f4             	lea    -0xc(%ebp),%ebx
  200019:	53                   	push   %ebx
  20001a:	e8 45 01 00 00       	call   200164 <sem_init>
  20001f:	83 c4 10             	add    $0x10,%esp
  200022:	40                   	inc    %eax
  200023:	0f 84 a3 00 00 00    	je     2000cc <uEntry+0xcc>
  200029:	e8 d2 00 00 00       	call   200100 <fork>
  20002e:	85 c0                	test   %eax,%eax
  200030:	75 52                	jne    200084 <uEntry+0x84>
  200032:	be 04 00 00 00       	mov    $0x4,%esi
  200037:	83 ec 0c             	sub    $0xc,%esp
  20003a:	68 54 04 20 00       	push   $0x200454
  20003f:	e8 c4 02 00 00       	call   200308 <printf>
  200044:	89 1c 24             	mov    %ebx,(%esp)
  200047:	e8 30 01 00 00       	call   20017c <sem_wait>
  20004c:	c7 04 24 78 04 20 00 	movl   $0x200478,(%esp)
  200053:	e8 b0 02 00 00       	call   200308 <printf>
  200058:	83 c4 10             	add    $0x10,%esp
  20005b:	4e                   	dec    %esi
  20005c:	75 d9                	jne    200037 <uEntry+0x37>
  20005e:	83 ec 0c             	sub    $0xc,%esp
  200061:	68 9c 04 20 00       	push   $0x20049c
  200066:	e8 9d 02 00 00       	call   200308 <printf>
  20006b:	89 1c 24             	mov    %ebx,(%esp)
  20006e:	e8 15 01 00 00       	call   200188 <sem_destroy>
  200073:	e8 d4 00 00 00       	call   20014c <exit>
  200078:	83 c4 10             	add    $0x10,%esp
  20007b:	31 c0                	xor    %eax,%eax
  20007d:	8d 65 f8             	lea    -0x8(%ebp),%esp
  200080:	5b                   	pop    %ebx
  200081:	5e                   	pop    %esi
  200082:	5d                   	pop    %ebp
  200083:	c3                   	ret    
  200084:	40                   	inc    %eax
  200085:	74 f4                	je     20007b <uEntry+0x7b>
  200087:	be 04 00 00 00       	mov    $0x4,%esi
  20008c:	83 ec 0c             	sub    $0xc,%esp
  20008f:	68 10 05 20 00       	push   $0x200510
  200094:	e8 6f 02 00 00       	call   200308 <printf>
  200099:	c7 04 24 80 00 00 00 	movl   $0x80,(%esp)
  2000a0:	e8 73 00 00 00       	call   200118 <sleep>
  2000a5:	c7 04 24 c4 04 20 00 	movl   $0x2004c4,(%esp)
  2000ac:	e8 57 02 00 00       	call   200308 <printf>
  2000b1:	89 1c 24             	mov    %ebx,(%esp)
  2000b4:	e8 b7 00 00 00       	call   200170 <sem_post>
  2000b9:	83 c4 10             	add    $0x10,%esp
  2000bc:	4e                   	dec    %esi
  2000bd:	75 cd                	jne    20008c <uEntry+0x8c>
  2000bf:	83 ec 0c             	sub    $0xc,%esp
  2000c2:	68 e8 04 20 00       	push   $0x2004e8
  2000c7:	eb 9d                	jmp    200066 <uEntry+0x66>
  2000c9:	8d 76 00             	lea    0x0(%esi),%esi
  2000cc:	83 ec 0c             	sub    $0xc,%esp
  2000cf:	68 24 04 20 00       	push   $0x200424
  2000d4:	e8 2f 02 00 00       	call   200308 <printf>
  2000d9:	e8 6e 00 00 00       	call   20014c <exit>
  2000de:	83 c4 10             	add    $0x10,%esp
  2000e1:	e9 43 ff ff ff       	jmp    200029 <uEntry+0x29>
  2000e6:	66 90                	xchg   %ax,%ax

002000e8 <syscall>:
  2000e8:	55                   	push   %ebp
  2000e9:	89 e5                	mov    %esp,%ebp
  2000eb:	53                   	push   %ebx
  2000ec:	8b 55 14             	mov    0x14(%ebp),%edx
  2000ef:	8b 4d 10             	mov    0x10(%ebp),%ecx
  2000f2:	8b 45 08             	mov    0x8(%ebp),%eax
  2000f5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  2000f8:	cd 80                	int    $0x80
  2000fa:	5b                   	pop    %ebx
  2000fb:	5d                   	pop    %ebp
  2000fc:	c3                   	ret    
  2000fd:	8d 76 00             	lea    0x0(%esi),%esi

00200100 <fork>:
  200100:	55                   	push   %ebp
  200101:	89 e5                	mov    %esp,%ebp
  200103:	53                   	push   %ebx
  200104:	b9 01 00 00 00       	mov    $0x1,%ecx
  200109:	b8 02 00 00 00       	mov    $0x2,%eax
  20010e:	89 cb                	mov    %ecx,%ebx
  200110:	89 ca                	mov    %ecx,%edx
  200112:	cd 80                	int    $0x80
  200114:	5b                   	pop    %ebx
  200115:	5d                   	pop    %ebp
  200116:	c3                   	ret    
  200117:	90                   	nop

00200118 <sleep>:
  200118:	55                   	push   %ebp
  200119:	89 e5                	mov    %esp,%ebp
  20011b:	53                   	push   %ebx
  20011c:	b9 01 00 00 00       	mov    $0x1,%ecx
  200121:	b8 e6 00 00 00       	mov    $0xe6,%eax
  200126:	8b 5d 08             	mov    0x8(%ebp),%ebx
  200129:	89 ca                	mov    %ecx,%edx
  20012b:	cd 80                	int    $0x80
  20012d:	31 c0                	xor    %eax,%eax
  20012f:	5b                   	pop    %ebx
  200130:	5d                   	pop    %ebp
  200131:	c3                   	ret    
  200132:	66 90                	xchg   %ax,%ax

00200134 <getpid>:
  200134:	55                   	push   %ebp
  200135:	89 e5                	mov    %esp,%ebp
  200137:	53                   	push   %ebx
  200138:	b9 01 00 00 00       	mov    $0x1,%ecx
  20013d:	b8 07 00 00 00       	mov    $0x7,%eax
  200142:	89 cb                	mov    %ecx,%ebx
  200144:	89 ca                	mov    %ecx,%edx
  200146:	cd 80                	int    $0x80
  200148:	5b                   	pop    %ebx
  200149:	5d                   	pop    %ebp
  20014a:	c3                   	ret    
  20014b:	90                   	nop

0020014c <exit>:
  20014c:	55                   	push   %ebp
  20014d:	89 e5                	mov    %esp,%ebp
  20014f:	53                   	push   %ebx
  200150:	31 d2                	xor    %edx,%edx
  200152:	b8 01 00 00 00       	mov    $0x1,%eax
  200157:	89 d3                	mov    %edx,%ebx
  200159:	89 d1                	mov    %edx,%ecx
  20015b:	cd 80                	int    $0x80
  20015d:	31 c0                	xor    %eax,%eax
  20015f:	5b                   	pop    %ebx
  200160:	5d                   	pop    %ebp
  200161:	c3                   	ret    
  200162:	66 90                	xchg   %ax,%ax

00200164 <sem_init>:
  200164:	55                   	push   %ebp
  200165:	89 e5                	mov    %esp,%ebp
  200167:	b8 01 00 00 00       	mov    $0x1,%eax
  20016c:	5d                   	pop    %ebp
  20016d:	c3                   	ret    
  20016e:	66 90                	xchg   %ax,%ax

00200170 <sem_post>:
  200170:	55                   	push   %ebp
  200171:	89 e5                	mov    %esp,%ebp
  200173:	b8 01 00 00 00       	mov    $0x1,%eax
  200178:	5d                   	pop    %ebp
  200179:	c3                   	ret    
  20017a:	66 90                	xchg   %ax,%ax

0020017c <sem_wait>:
  20017c:	55                   	push   %ebp
  20017d:	89 e5                	mov    %esp,%ebp
  20017f:	b8 01 00 00 00       	mov    $0x1,%eax
  200184:	5d                   	pop    %ebp
  200185:	c3                   	ret    
  200186:	66 90                	xchg   %ax,%ax

00200188 <sem_destroy>:
  200188:	55                   	push   %ebp
  200189:	89 e5                	mov    %esp,%ebp
  20018b:	b8 01 00 00 00       	mov    $0x1,%eax
  200190:	5d                   	pop    %ebp
  200191:	c3                   	ret    
  200192:	66 90                	xchg   %ax,%ax

00200194 <printd>:
  200194:	55                   	push   %ebp
  200195:	89 e5                	mov    %esp,%ebp
  200197:	57                   	push   %edi
  200198:	56                   	push   %esi
  200199:	53                   	push   %ebx
  20019a:	83 ec 74             	sub    $0x74,%esp
  20019d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  2001a0:	85 db                	test   %ebx,%ebx
  2001a2:	78 7c                	js     200220 <printd+0x8c>
  2001a4:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
  2001a8:	c6 45 83 00          	movb   $0x0,-0x7d(%ebp)
  2001ac:	8d 4d f3             	lea    -0xd(%ebp),%ecx
  2001af:	be 0a 00 00 00       	mov    $0xa,%esi
  2001b4:	bf 67 66 66 66       	mov    $0x66666667,%edi
  2001b9:	8d 76 00             	lea    0x0(%esi),%esi
  2001bc:	49                   	dec    %ecx
  2001bd:	89 d8                	mov    %ebx,%eax
  2001bf:	99                   	cltd   
  2001c0:	f7 fe                	idiv   %esi
  2001c2:	83 c2 30             	add    $0x30,%edx
  2001c5:	88 11                	mov    %dl,(%ecx)
  2001c7:	89 d8                	mov    %ebx,%eax
  2001c9:	f7 ef                	imul   %edi
  2001cb:	89 d0                	mov    %edx,%eax
  2001cd:	c1 f8 02             	sar    $0x2,%eax
  2001d0:	c1 fb 1f             	sar    $0x1f,%ebx
  2001d3:	29 d8                	sub    %ebx,%eax
  2001d5:	89 c3                	mov    %eax,%ebx
  2001d7:	75 e3                	jne    2001bc <printd+0x28>
  2001d9:	80 7d 83 01          	cmpb   $0x1,-0x7d(%ebp)
  2001dd:	74 31                	je     200210 <printd+0x7c>
  2001df:	80 7d 82 01          	cmpb   $0x1,-0x7e(%ebp)
  2001e3:	74 36                	je     20021b <printd+0x87>
  2001e5:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  2001e9:	80 39 00             	cmpb   $0x0,(%ecx)
  2001ec:	74 54                	je     200242 <printd+0xae>
  2001ee:	31 c0                	xor    %eax,%eax
  2001f0:	40                   	inc    %eax
  2001f1:	89 c2                	mov    %eax,%edx
  2001f3:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  2001f7:	75 f7                	jne    2001f0 <printd+0x5c>
  2001f9:	bb 01 00 00 00       	mov    $0x1,%ebx
  2001fe:	b8 04 00 00 00       	mov    $0x4,%eax
  200203:	cd 80                	int    $0x80
  200205:	83 c4 74             	add    $0x74,%esp
  200208:	5b                   	pop    %ebx
  200209:	5e                   	pop    %esi
  20020a:	5f                   	pop    %edi
  20020b:	5d                   	pop    %ebp
  20020c:	c3                   	ret    
  20020d:	8d 76 00             	lea    0x0(%esi),%esi
  200210:	c6 41 ff 2d          	movb   $0x2d,-0x1(%ecx)
  200214:	49                   	dec    %ecx
  200215:	80 7d 82 01          	cmpb   $0x1,-0x7e(%ebp)
  200219:	75 ca                	jne    2001e5 <printd+0x51>
  20021b:	fe 45 ac             	incb   -0x54(%ebp)
  20021e:	eb c5                	jmp    2001e5 <printd+0x51>
  200220:	81 fb 00 00 00 80    	cmp    $0x80000000,%ebx
  200226:	74 0f                	je     200237 <printd+0xa3>
  200228:	f7 db                	neg    %ebx
  20022a:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
  20022e:	c6 45 83 01          	movb   $0x1,-0x7d(%ebp)
  200232:	e9 75 ff ff ff       	jmp    2001ac <printd+0x18>
  200237:	bb ff ff ff 7f       	mov    $0x7fffffff,%ebx
  20023c:	c6 45 82 01          	movb   $0x1,-0x7e(%ebp)
  200240:	eb ec                	jmp    20022e <printd+0x9a>
  200242:	31 d2                	xor    %edx,%edx
  200244:	eb b3                	jmp    2001f9 <printd+0x65>
  200246:	66 90                	xchg   %ax,%ax

00200248 <printx>:
  200248:	55                   	push   %ebp
  200249:	89 e5                	mov    %esp,%ebp
  20024b:	53                   	push   %ebx
  20024c:	83 ec 20             	sub    $0x20,%esp
  20024f:	8b 45 08             	mov    0x8(%ebp),%eax
  200252:	8d 5d fa             	lea    -0x6(%ebp),%ebx
  200255:	eb 12                	jmp    200269 <printx+0x21>
  200257:	90                   	nop
  200258:	83 c2 57             	add    $0x57,%edx
  20025b:	88 13                	mov    %dl,(%ebx)
  20025d:	85 c0                	test   %eax,%eax
  20025f:	78 22                	js     200283 <printx+0x3b>
  200261:	c1 f8 04             	sar    $0x4,%eax
  200264:	4b                   	dec    %ebx
  200265:	85 c0                	test   %eax,%eax
  200267:	74 25                	je     20028e <printx+0x46>
  200269:	89 c2                	mov    %eax,%edx
  20026b:	81 e2 0f 00 00 80    	and    $0x8000000f,%edx
  200271:	78 41                	js     2002b4 <printx+0x6c>
  200273:	89 d9                	mov    %ebx,%ecx
  200275:	83 fa 09             	cmp    $0x9,%edx
  200278:	7f de                	jg     200258 <printx+0x10>
  20027a:	83 c2 30             	add    $0x30,%edx
  20027d:	88 13                	mov    %dl,(%ebx)
  20027f:	85 c0                	test   %eax,%eax
  200281:	79 de                	jns    200261 <printx+0x19>
  200283:	83 c0 0f             	add    $0xf,%eax
  200286:	c1 f8 04             	sar    $0x4,%eax
  200289:	4b                   	dec    %ebx
  20028a:	85 c0                	test   %eax,%eax
  20028c:	75 db                	jne    200269 <printx+0x21>
  20028e:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
  200292:	80 39 00             	cmpb   $0x0,(%ecx)
  200295:	74 24                	je     2002bb <printx+0x73>
  200297:	90                   	nop
  200298:	40                   	inc    %eax
  200299:	89 c2                	mov    %eax,%edx
  20029b:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  20029f:	75 f7                	jne    200298 <printx+0x50>
  2002a1:	bb 01 00 00 00       	mov    $0x1,%ebx
  2002a6:	b8 04 00 00 00       	mov    $0x4,%eax
  2002ab:	cd 80                	int    $0x80
  2002ad:	83 c4 20             	add    $0x20,%esp
  2002b0:	5b                   	pop    %ebx
  2002b1:	5d                   	pop    %ebp
  2002b2:	c3                   	ret    
  2002b3:	90                   	nop
  2002b4:	4a                   	dec    %edx
  2002b5:	83 ca f0             	or     $0xfffffff0,%edx
  2002b8:	42                   	inc    %edx
  2002b9:	eb b8                	jmp    200273 <printx+0x2b>
  2002bb:	31 d2                	xor    %edx,%edx
  2002bd:	eb e2                	jmp    2002a1 <printx+0x59>
  2002bf:	90                   	nop

002002c0 <printc>:
  2002c0:	55                   	push   %ebp
  2002c1:	89 e5                	mov    %esp,%ebp
  2002c3:	53                   	push   %ebx
  2002c4:	50                   	push   %eax
  2002c5:	bb 01 00 00 00       	mov    $0x1,%ebx
  2002ca:	8d 4d f8             	lea    -0x8(%ebp),%ecx
  2002cd:	b8 04 00 00 00       	mov    $0x4,%eax
  2002d2:	89 da                	mov    %ebx,%edx
  2002d4:	cd 80                	int    $0x80
  2002d6:	5a                   	pop    %edx
  2002d7:	5b                   	pop    %ebx
  2002d8:	5d                   	pop    %ebp
  2002d9:	c3                   	ret    
  2002da:	66 90                	xchg   %ax,%ax

002002dc <prints>:
  2002dc:	55                   	push   %ebp
  2002dd:	89 e5                	mov    %esp,%ebp
  2002df:	53                   	push   %ebx
  2002e0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2002e3:	80 39 00             	cmpb   $0x0,(%ecx)
  2002e6:	74 1c                	je     200304 <prints+0x28>
  2002e8:	31 c0                	xor    %eax,%eax
  2002ea:	66 90                	xchg   %ax,%ax
  2002ec:	40                   	inc    %eax
  2002ed:	89 c2                	mov    %eax,%edx
  2002ef:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  2002f3:	75 f7                	jne    2002ec <prints+0x10>
  2002f5:	bb 01 00 00 00       	mov    $0x1,%ebx
  2002fa:	b8 04 00 00 00       	mov    $0x4,%eax
  2002ff:	cd 80                	int    $0x80
  200301:	5b                   	pop    %ebx
  200302:	5d                   	pop    %ebp
  200303:	c3                   	ret    
  200304:	31 d2                	xor    %edx,%edx
  200306:	eb ed                	jmp    2002f5 <prints+0x19>

00200308 <printf>:
  200308:	55                   	push   %ebp
  200309:	89 e5                	mov    %esp,%ebp
  20030b:	57                   	push   %edi
  20030c:	56                   	push   %esi
  20030d:	53                   	push   %ebx
  20030e:	83 ec 14             	sub    $0x14,%esp
  200311:	8b 7d 08             	mov    0x8(%ebp),%edi
  200314:	8a 07                	mov    (%edi),%al
  200316:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  200319:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  20031c:	84 c0                	test   %al,%al
  20031e:	75 24                	jne    200344 <printf+0x3c>
  200320:	eb 59                	jmp    20037b <printf+0x73>
  200322:	66 90                	xchg   %ax,%ax
  200324:	88 45 f3             	mov    %al,-0xd(%ebp)
  200327:	ba 01 00 00 00       	mov    $0x1,%edx
  20032c:	b8 04 00 00 00       	mov    $0x4,%eax
  200331:	89 d3                	mov    %edx,%ebx
  200333:	8d 4d f3             	lea    -0xd(%ebp),%ecx
  200336:	cd 80                	int    $0x80
  200338:	89 fe                	mov    %edi,%esi
  20033a:	8d 7e 01             	lea    0x1(%esi),%edi
  20033d:	8a 46 01             	mov    0x1(%esi),%al
  200340:	84 c0                	test   %al,%al
  200342:	74 37                	je     20037b <printf+0x73>
  200344:	3c 25                	cmp    $0x25,%al
  200346:	75 dc                	jne    200324 <printf+0x1c>
  200348:	8d 77 01             	lea    0x1(%edi),%esi
  20034b:	8a 47 01             	mov    0x1(%edi),%al
  20034e:	3c 64                	cmp    $0x64,%al
  200350:	0f 84 86 00 00 00    	je     2003dc <printf+0xd4>
  200356:	7e 2c                	jle    200384 <printf+0x7c>
  200358:	3c 73                	cmp    $0x73,%al
  20035a:	74 50                	je     2003ac <printf+0xa4>
  20035c:	3c 78                	cmp    $0x78,%al
  20035e:	75 da                	jne    20033a <printf+0x32>
  200360:	8b 45 e0             	mov    -0x20(%ebp),%eax
  200363:	8d 58 04             	lea    0x4(%eax),%ebx
  200366:	ff 30                	pushl  (%eax)
  200368:	e8 db fe ff ff       	call   200248 <printx>
  20036d:	58                   	pop    %eax
  20036e:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  200371:	8d 7e 01             	lea    0x1(%esi),%edi
  200374:	8a 46 01             	mov    0x1(%esi),%al
  200377:	84 c0                	test   %al,%al
  200379:	75 c9                	jne    200344 <printf+0x3c>
  20037b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  20037e:	5b                   	pop    %ebx
  20037f:	5e                   	pop    %esi
  200380:	5f                   	pop    %edi
  200381:	5d                   	pop    %ebp
  200382:	c3                   	ret    
  200383:	90                   	nop
  200384:	3c 63                	cmp    $0x63,%al
  200386:	75 b2                	jne    20033a <printf+0x32>
  200388:	8b 45 e0             	mov    -0x20(%ebp),%eax
  20038b:	8d 78 04             	lea    0x4(%eax),%edi
  20038e:	8b 00                	mov    (%eax),%eax
  200390:	88 45 f2             	mov    %al,-0xe(%ebp)
  200393:	ba 01 00 00 00       	mov    $0x1,%edx
  200398:	b8 04 00 00 00       	mov    $0x4,%eax
  20039d:	89 d3                	mov    %edx,%ebx
  20039f:	8d 4d f2             	lea    -0xe(%ebp),%ecx
  2003a2:	cd 80                	int    $0x80
  2003a4:	89 7d e0             	mov    %edi,-0x20(%ebp)
  2003a7:	eb 91                	jmp    20033a <printf+0x32>
  2003a9:	8d 76 00             	lea    0x0(%esi),%esi
  2003ac:	8b 45 e0             	mov    -0x20(%ebp),%eax
  2003af:	8d 78 04             	lea    0x4(%eax),%edi
  2003b2:	8b 08                	mov    (%eax),%ecx
  2003b4:	80 39 00             	cmpb   $0x0,(%ecx)
  2003b7:	74 39                	je     2003f2 <printf+0xea>
  2003b9:	31 c0                	xor    %eax,%eax
  2003bb:	90                   	nop
  2003bc:	40                   	inc    %eax
  2003bd:	89 c2                	mov    %eax,%edx
  2003bf:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
  2003c3:	75 f7                	jne    2003bc <printf+0xb4>
  2003c5:	bb 01 00 00 00       	mov    $0x1,%ebx
  2003ca:	b8 04 00 00 00       	mov    $0x4,%eax
  2003cf:	cd 80                	int    $0x80
  2003d1:	89 7d e0             	mov    %edi,-0x20(%ebp)
  2003d4:	e9 61 ff ff ff       	jmp    20033a <printf+0x32>
  2003d9:	8d 76 00             	lea    0x0(%esi),%esi
  2003dc:	8b 45 e0             	mov    -0x20(%ebp),%eax
  2003df:	8d 58 04             	lea    0x4(%eax),%ebx
  2003e2:	ff 30                	pushl  (%eax)
  2003e4:	e8 ab fd ff ff       	call   200194 <printd>
  2003e9:	5a                   	pop    %edx
  2003ea:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  2003ed:	e9 48 ff ff ff       	jmp    20033a <printf+0x32>
  2003f2:	31 d2                	xor    %edx,%edx
  2003f4:	eb cf                	jmp    2003c5 <printf+0xbd>
