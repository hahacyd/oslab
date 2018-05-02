
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 dd 0c 00 00       	call   100ce8 <initTimer>
  10000b:	e8 cc 09 00 00       	call   1009dc <init_pcb>
  100010:	e8 f3 05 00 00       	call   100608 <initSerial>
  100015:	e8 32 0a 00 00       	call   100a4c <initIdt>
  10001a:	e8 71 0c 00 00       	call   100c90 <initIntr>
  10001f:	e8 94 00 00 00       	call   1000b8 <initSeg>
  100024:	fb                   	sti    
  100025:	e8 a6 02 00 00       	call   1002d0 <loadUMain>
  10002a:	eb fe                	jmp    10002a <kEntry+0x2a>

0010002c <waitDisk>:
  10002c:	55                   	push   %ebp
  10002d:	89 e5                	mov    %esp,%ebp
  10002f:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100034:	ec                   	in     (%dx),%al
  100035:	83 e0 c0             	and    $0xffffffc0,%eax
  100038:	3c 40                	cmp    $0x40,%al
  10003a:	75 f8                	jne    100034 <waitDisk+0x8>
  10003c:	5d                   	pop    %ebp
  10003d:	c3                   	ret    
  10003e:	66 90                	xchg   %ax,%ax

00100040 <readSect>:
  100040:	55                   	push   %ebp
  100041:	89 e5                	mov    %esp,%ebp
  100043:	53                   	push   %ebx
  100044:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100047:	ba f7 01 00 00       	mov    $0x1f7,%edx
  10004c:	ec                   	in     (%dx),%al
  10004d:	83 e0 c0             	and    $0xffffffc0,%eax
  100050:	3c 40                	cmp    $0x40,%al
  100052:	75 f8                	jne    10004c <readSect+0xc>
  100054:	ba f2 01 00 00       	mov    $0x1f2,%edx
  100059:	b0 01                	mov    $0x1,%al
  10005b:	ee                   	out    %al,(%dx)
  10005c:	ba f3 01 00 00       	mov    $0x1f3,%edx
  100061:	88 c8                	mov    %cl,%al
  100063:	ee                   	out    %al,(%dx)
  100064:	89 c8                	mov    %ecx,%eax
  100066:	c1 f8 08             	sar    $0x8,%eax
  100069:	ba f4 01 00 00       	mov    $0x1f4,%edx
  10006e:	ee                   	out    %al,(%dx)
  10006f:	89 c8                	mov    %ecx,%eax
  100071:	c1 f8 10             	sar    $0x10,%eax
  100074:	ba f5 01 00 00       	mov    $0x1f5,%edx
  100079:	ee                   	out    %al,(%dx)
  10007a:	89 c8                	mov    %ecx,%eax
  10007c:	c1 f8 18             	sar    $0x18,%eax
  10007f:	83 c8 e0             	or     $0xffffffe0,%eax
  100082:	ba f6 01 00 00       	mov    $0x1f6,%edx
  100087:	ee                   	out    %al,(%dx)
  100088:	ba f7 01 00 00       	mov    $0x1f7,%edx
  10008d:	b0 20                	mov    $0x20,%al
  10008f:	ee                   	out    %al,(%dx)
  100090:	ec                   	in     (%dx),%al
  100091:	83 e0 c0             	and    $0xffffffc0,%eax
  100094:	3c 40                	cmp    $0x40,%al
  100096:	75 f8                	jne    100090 <readSect+0x50>
  100098:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10009b:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  1000a1:	ba f0 01 00 00       	mov    $0x1f0,%edx
  1000a6:	66 90                	xchg   %ax,%ax
  1000a8:	ed                   	in     (%dx),%eax
  1000a9:	89 01                	mov    %eax,(%ecx)
  1000ab:	83 c1 04             	add    $0x4,%ecx
  1000ae:	39 d9                	cmp    %ebx,%ecx
  1000b0:	75 f6                	jne    1000a8 <readSect+0x68>
  1000b2:	5b                   	pop    %ebx
  1000b3:	5d                   	pop    %ebp
  1000b4:	c3                   	ret    
  1000b5:	8d 76 00             	lea    0x0(%esi),%esi

001000b8 <initSeg>:
  1000b8:	55                   	push   %ebp
  1000b9:	89 e5                	mov    %esp,%ebp
  1000bb:	83 ec 10             	sub    $0x10,%esp
  1000be:	b9 a0 d1 12 01       	mov    $0x112d1a0,%ecx
  1000c3:	66 c7 05 a8 d1 12 01 	movw   $0xffff,0x112d1a8
  1000ca:	ff ff 
  1000cc:	66 c7 05 aa d1 12 01 	movw   $0x0,0x112d1aa
  1000d3:	00 00 
  1000d5:	c6 05 ac d1 12 01 00 	movb   $0x0,0x112d1ac
  1000dc:	c6 05 ad d1 12 01 9a 	movb   $0x9a,0x112d1ad
  1000e3:	c6 05 ae d1 12 01 cf 	movb   $0xcf,0x112d1ae
  1000ea:	c6 05 af d1 12 01 00 	movb   $0x0,0x112d1af
  1000f1:	66 c7 05 b0 d1 12 01 	movw   $0xffff,0x112d1b0
  1000f8:	ff ff 
  1000fa:	66 c7 05 b2 d1 12 01 	movw   $0x0,0x112d1b2
  100101:	00 00 
  100103:	c6 05 b4 d1 12 01 00 	movb   $0x0,0x112d1b4
  10010a:	c6 05 b5 d1 12 01 92 	movb   $0x92,0x112d1b5
  100111:	c6 05 b6 d1 12 01 cf 	movb   $0xcf,0x112d1b6
  100118:	c6 05 b7 d1 12 01 00 	movb   $0x0,0x112d1b7
  10011f:	66 c7 05 b8 d1 12 01 	movw   $0xffff,0x112d1b8
  100126:	ff ff 
  100128:	66 c7 05 ba d1 12 01 	movw   $0x0,0x112d1ba
  10012f:	00 00 
  100131:	c6 05 bc d1 12 01 00 	movb   $0x0,0x112d1bc
  100138:	c6 05 bd d1 12 01 fa 	movb   $0xfa,0x112d1bd
  10013f:	c6 05 be d1 12 01 cf 	movb   $0xcf,0x112d1be
  100146:	c6 05 bf d1 12 01 00 	movb   $0x0,0x112d1bf
  10014d:	66 c7 05 c0 d1 12 01 	movw   $0xffff,0x112d1c0
  100154:	ff ff 
  100156:	66 c7 05 c2 d1 12 01 	movw   $0x0,0x112d1c2
  10015d:	00 00 
  10015f:	c6 05 c4 d1 12 01 00 	movb   $0x0,0x112d1c4
  100166:	c6 05 c5 d1 12 01 f2 	movb   $0xf2,0x112d1c5
  10016d:	c6 05 c6 d1 12 01 cf 	movb   $0xcf,0x112d1c6
  100174:	c6 05 c7 d1 12 01 00 	movb   $0x0,0x112d1c7
  10017b:	66 c7 05 c8 d1 12 01 	movw   $0x63,0x112d1c8
  100182:	63 00 
  100184:	b8 e0 d1 12 01       	mov    $0x112d1e0,%eax
  100189:	66 a3 ca d1 12 01    	mov    %ax,0x112d1ca
  10018f:	89 c2                	mov    %eax,%edx
  100191:	c1 ea 10             	shr    $0x10,%edx
  100194:	88 15 cc d1 12 01    	mov    %dl,0x112d1cc
  10019a:	c6 05 cd d1 12 01 89 	movb   $0x89,0x112d1cd
  1001a1:	c6 05 ce d1 12 01 40 	movb   $0x40,0x112d1ce
  1001a8:	c1 e8 18             	shr    $0x18,%eax
  1001ab:	a2 cf d1 12 01       	mov    %al,0x112d1cf
  1001b0:	a1 48 10 10 00       	mov    0x101048,%eax
  1001b5:	8b 15 4c 10 10 00    	mov    0x10104c,%edx
  1001bb:	a3 d0 d1 12 01       	mov    %eax,0x112d1d0
  1001c0:	89 15 d4 d1 12 01    	mov    %edx,0x112d1d4
  1001c6:	66 c7 05 00 29 10 00 	movw   $0x37,0x102900
  1001cd:	37 00 
  1001cf:	66 89 0d 02 29 10 00 	mov    %cx,0x102902
  1001d6:	c1 e9 10             	shr    $0x10,%ecx
  1001d9:	66 89 0d 04 29 10 00 	mov    %cx,0x102904
  1001e0:	b8 00 29 10 00       	mov    $0x102900,%eax
  1001e5:	0f 01 10             	lgdtl  (%eax)
  1001e8:	68 00 00 50 00       	push   $0x500000
  1001ed:	6a 10                	push   $0x10
  1001ef:	e8 24 08 00 00       	call   100a18 <init_kernel_pcb>
  1001f4:	a1 d4 51 10 00       	mov    0x1051d4,%eax
  1001f9:	a3 e4 d1 12 01       	mov    %eax,0x112d1e4
  1001fe:	a1 d8 51 10 00       	mov    0x1051d8,%eax
  100203:	a3 e8 d1 12 01       	mov    %eax,0x112d1e8
  100208:	b8 28 00 00 00       	mov    $0x28,%eax
  10020d:	0f 00 d8             	ltr    %ax
  100210:	b8 10 00 00 00       	mov    $0x10,%eax
  100215:	89 c0                	mov    %eax,%eax
  100217:	8e d8                	mov    %eax,%ds
  100219:	8e e0                	mov    %eax,%fs
  10021b:	8e c0                	mov    %eax,%es
  10021d:	8e d0                	mov    %eax,%ss
  10021f:	b8 30 00 00 00       	mov    $0x30,%eax
  100224:	89 c0                	mov    %eax,%eax
  100226:	8e e8                	mov    %eax,%gs
  100228:	31 c0                	xor    %eax,%eax
  10022a:	0f 00 d0             	lldt   %ax
  10022d:	83 c4 10             	add    $0x10,%esp
  100230:	c9                   	leave  
  100231:	c3                   	ret    
  100232:	66 90                	xchg   %ax,%ax

00100234 <enterUserSpace_pcb>:
  100234:	55                   	push   %ebp
  100235:	89 e5                	mov    %esp,%ebp
  100237:	8b 45 08             	mov    0x8(%ebp),%eax
  10023a:	89 c2                	mov    %eax,%edx
  10023c:	c1 e2 07             	shl    $0x7,%edx
  10023f:	01 c2                	add    %eax,%edx
  100241:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100244:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100247:	8d 04 85 a0 31 10 00 	lea    0x1031a0(,%eax,4),%eax
  10024e:	8b 90 38 20 00 00    	mov    0x2038(%eax),%edx
  100254:	52                   	push   %edx
  100255:	8b 90 34 20 00 00    	mov    0x2034(%eax),%edx
  10025b:	52                   	push   %edx
  10025c:	9c                   	pushf  
  10025d:	8b 90 2c 20 00 00    	mov    0x202c(%eax),%edx
  100263:	52                   	push   %edx
  100264:	8b 80 28 20 00 00    	mov    0x2028(%eax),%eax
  10026a:	50                   	push   %eax
  10026b:	cf                   	iret   
  10026c:	5d                   	pop    %ebp
  10026d:	c3                   	ret    
  10026e:	66 90                	xchg   %ax,%ax

00100270 <enterUserSpace>:
  100270:	55                   	push   %ebp
  100271:	89 e5                	mov    %esp,%ebp
  100273:	8b 45 08             	mov    0x8(%ebp),%eax
  100276:	c7 05 84 31 10 00 01 	movl   $0x1,0x103184
  10027d:	00 00 00 
  100280:	c7 05 2c 72 10 00 23 	movl   $0x23,0x10722c
  100287:	00 00 00 
  10028a:	c7 05 28 72 10 00 00 	movl   $0x8000000,0x107228
  100291:	00 00 08 
  100294:	c7 05 20 72 10 00 1b 	movl   $0x1b,0x107220
  10029b:	00 00 00 
  10029e:	a3 1c 72 10 00       	mov    %eax,0x10721c
  1002a3:	c7 05 34 72 10 00 04 	movl   $0x4,0x107234
  1002aa:	00 00 00 
  1002ad:	c7 05 30 72 10 00 02 	movl   $0x2,0x107230
  1002b4:	00 00 00 
  1002b7:	ba 23 00 00 00       	mov    $0x23,%edx
  1002bc:	52                   	push   %edx
  1002bd:	ba 00 00 00 08       	mov    $0x8000000,%edx
  1002c2:	52                   	push   %edx
  1002c3:	9c                   	pushf  
  1002c4:	ba 1b 00 00 00       	mov    $0x1b,%edx
  1002c9:	52                   	push   %edx
  1002ca:	50                   	push   %eax
  1002cb:	cf                   	iret   
  1002cc:	5d                   	pop    %ebp
  1002cd:	c3                   	ret    
  1002ce:	66 90                	xchg   %ax,%ax

001002d0 <loadUMain>:
  1002d0:	55                   	push   %ebp
  1002d1:	89 e5                	mov    %esp,%ebp
  1002d3:	57                   	push   %edi
  1002d4:	56                   	push   %esi
  1002d5:	53                   	push   %ebx
  1002d6:	bb c9 00 00 00       	mov    $0xc9,%ebx
  1002db:	be 00 00 00 03       	mov    $0x3000000,%esi
  1002e0:	53                   	push   %ebx
  1002e1:	56                   	push   %esi
  1002e2:	e8 59 fd ff ff       	call   100040 <readSect>
  1002e7:	81 c6 00 02 00 00    	add    $0x200,%esi
  1002ed:	43                   	inc    %ebx
  1002ee:	58                   	pop    %eax
  1002ef:	5a                   	pop    %edx
  1002f0:	81 fb 91 01 00 00    	cmp    $0x191,%ebx
  1002f6:	75 e8                	jne    1002e0 <loadUMain+0x10>
  1002f8:	a1 1c 00 00 03       	mov    0x300001c,%eax
  1002fd:	8d 90 00 00 00 03    	lea    0x3000000(%eax),%edx
  100303:	0f b7 35 2c 00 00 03 	movzwl 0x300002c,%esi
  10030a:	c1 e6 05             	shl    $0x5,%esi
  10030d:	01 d6                	add    %edx,%esi
  10030f:	39 f2                	cmp    %esi,%edx
  100311:	72 0c                	jb     10031f <loadUMain+0x4f>
  100313:	eb 53                	jmp    100368 <loadUMain+0x98>
  100315:	8d 76 00             	lea    0x0(%esi),%esi
  100318:	83 c2 20             	add    $0x20,%edx
  10031b:	39 d6                	cmp    %edx,%esi
  10031d:	76 49                	jbe    100368 <loadUMain+0x98>
  10031f:	83 3a 01             	cmpl   $0x1,(%edx)
  100322:	75 f4                	jne    100318 <loadUMain+0x48>
  100324:	8b 42 08             	mov    0x8(%edx),%eax
  100327:	8b 7a 10             	mov    0x10(%edx),%edi
  10032a:	8b 5a 04             	mov    0x4(%edx),%ebx
  10032d:	29 c3                	sub    %eax,%ebx
  10032f:	31 c9                	xor    %ecx,%ecx
  100331:	85 ff                	test   %edi,%edi
  100333:	74 16                	je     10034b <loadUMain+0x7b>
  100335:	8d 76 00             	lea    0x0(%esi),%esi
  100338:	8a 8c 03 00 00 00 03 	mov    0x3000000(%ebx,%eax,1),%cl
  10033f:	88 08                	mov    %cl,(%eax)
  100341:	40                   	inc    %eax
  100342:	89 c1                	mov    %eax,%ecx
  100344:	2b 4a 08             	sub    0x8(%edx),%ecx
  100347:	39 cf                	cmp    %ecx,%edi
  100349:	77 ed                	ja     100338 <loadUMain+0x68>
  10034b:	8b 5a 14             	mov    0x14(%edx),%ebx
  10034e:	39 cb                	cmp    %ecx,%ebx
  100350:	76 c6                	jbe    100318 <loadUMain+0x48>
  100352:	66 90                	xchg   %ax,%ax
  100354:	c6 00 00             	movb   $0x0,(%eax)
  100357:	40                   	inc    %eax
  100358:	89 c1                	mov    %eax,%ecx
  10035a:	2b 4a 08             	sub    0x8(%edx),%ecx
  10035d:	39 cb                	cmp    %ecx,%ebx
  10035f:	77 f3                	ja     100354 <loadUMain+0x84>
  100361:	83 c2 20             	add    $0x20,%edx
  100364:	39 d6                	cmp    %edx,%esi
  100366:	77 b7                	ja     10031f <loadUMain+0x4f>
  100368:	a1 18 00 00 03       	mov    0x3000018,%eax
  10036d:	c7 05 84 31 10 00 01 	movl   $0x1,0x103184
  100374:	00 00 00 
  100377:	c7 05 2c 72 10 00 23 	movl   $0x23,0x10722c
  10037e:	00 00 00 
  100381:	c7 05 28 72 10 00 00 	movl   $0x8000000,0x107228
  100388:	00 00 08 
  10038b:	c7 05 20 72 10 00 1b 	movl   $0x1b,0x107220
  100392:	00 00 00 
  100395:	a3 1c 72 10 00       	mov    %eax,0x10721c
  10039a:	c7 05 34 72 10 00 04 	movl   $0x4,0x107234
  1003a1:	00 00 00 
  1003a4:	c7 05 30 72 10 00 02 	movl   $0x2,0x107230
  1003ab:	00 00 00 
  1003ae:	ba 23 00 00 00       	mov    $0x23,%edx
  1003b3:	52                   	push   %edx
  1003b4:	ba 00 00 00 08       	mov    $0x8000000,%edx
  1003b9:	52                   	push   %edx
  1003ba:	9c                   	pushf  
  1003bb:	ba 1b 00 00 00       	mov    $0x1b,%edx
  1003c0:	52                   	push   %edx
  1003c1:	50                   	push   %eax
  1003c2:	cf                   	iret   
  1003c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1003c6:	5b                   	pop    %ebx
  1003c7:	5e                   	pop    %esi
  1003c8:	5f                   	pop    %edi
  1003c9:	5d                   	pop    %ebp
  1003ca:	c3                   	ret    
  1003cb:	90                   	nop

001003cc <sys_exit>:
  1003cc:	55                   	push   %ebp
  1003cd:	89 e5                	mov    %esp,%ebp
  1003cf:	b8 01 00 00 00       	mov    $0x1,%eax
  1003d4:	5d                   	pop    %ebp
  1003d5:	c3                   	ret    
  1003d6:	66 90                	xchg   %ax,%ax

001003d8 <sys_sleep>:
  1003d8:	55                   	push   %ebp
  1003d9:	89 e5                	mov    %esp,%ebp
  1003db:	83 ec 08             	sub    $0x8,%esp
  1003de:	e8 e1 03 00 00       	call   1007c4 <getpid>
  1003e3:	89 c2                	mov    %eax,%edx
  1003e5:	c1 e2 07             	shl    $0x7,%edx
  1003e8:	01 c2                	add    %eax,%edx
  1003ea:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1003ed:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1003f0:	8b 55 08             	mov    0x8(%ebp),%edx
  1003f3:	8b 52 1c             	mov    0x1c(%edx),%edx
  1003f6:	89 14 85 e4 51 10 00 	mov    %edx,0x1051e4(,%eax,4)
  1003fd:	b8 01 00 00 00       	mov    $0x1,%eax
  100402:	c9                   	leave  
  100403:	c3                   	ret    

00100404 <sys_fork>:
  100404:	55                   	push   %ebp
  100405:	89 e5                	mov    %esp,%ebp
  100407:	57                   	push   %edi
  100408:	56                   	push   %esi
  100409:	8b 75 08             	mov    0x8(%ebp),%esi
  10040c:	83 ec 0c             	sub    $0xc,%esp
  10040f:	68 50 10 10 00       	push   $0x101050
  100414:	e8 f7 09 00 00       	call   100e10 <printk>
  100419:	b8 48 92 10 00       	mov    $0x109248,%eax
  10041e:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100423:	89 c7                	mov    %eax,%edi
  100425:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100427:	c7 05 64 92 10 00 00 	movl   $0x0,0x109264
  10042e:	00 00 00 
  100431:	c7 05 7c 92 10 00 00 	movl   $0x7e00000,0x10927c
  100438:	00 e0 07 
  10043b:	c7 04 24 6c 10 10 00 	movl   $0x10106c,(%esp)
  100442:	e8 c9 09 00 00       	call   100e10 <printk>
  100447:	58                   	pop    %eax
  100448:	ff 35 70 92 10 00    	pushl  0x109270
  10044e:	68 e0 10 10 00       	push   $0x1010e0
  100453:	6a 10                	push   $0x10
  100455:	68 72 10 10 00       	push   $0x101072
  10045a:	68 94 10 10 00       	push   $0x101094
  10045f:	e8 ac 09 00 00       	call   100e10 <printk>
  100464:	83 c4 14             	add    $0x14,%esp
  100467:	68 8d 10 10 00       	push   $0x10108d
  10046c:	e8 9f 09 00 00       	call   100e10 <printk>
  100471:	c7 04 24 6c 10 10 00 	movl   $0x10106c,(%esp)
  100478:	e8 93 09 00 00       	call   100e10 <printk>
  10047d:	5a                   	pop    %edx
  10047e:	ff 35 74 92 10 00    	pushl  0x109274
  100484:	68 e0 10 10 00       	push   $0x1010e0
  100489:	6a 11                	push   $0x11
  10048b:	68 72 10 10 00       	push   $0x101072
  100490:	68 bc 10 10 00       	push   $0x1010bc
  100495:	e8 76 09 00 00       	call   100e10 <printk>
  10049a:	83 c4 14             	add    $0x14,%esp
  10049d:	68 8d 10 10 00       	push   $0x10108d
  1004a2:	e8 69 09 00 00       	call   100e10 <printk>
  1004a7:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1004ae:	e8 a1 03 00 00       	call   100854 <put_into_runnable>
  1004b3:	b8 02 00 00 00       	mov    $0x2,%eax
  1004b8:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1004bb:	5e                   	pop    %esi
  1004bc:	5f                   	pop    %edi
  1004bd:	5d                   	pop    %ebp
  1004be:	c3                   	ret    
  1004bf:	90                   	nop

001004c0 <display>:
  1004c0:	55                   	push   %ebp
  1004c1:	89 e5                	mov    %esp,%ebp
  1004c3:	57                   	push   %edi
  1004c4:	53                   	push   %ebx
  1004c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1004c8:	80 fb 0a             	cmp    $0xa,%bl
  1004cb:	74 5b                	je     100528 <display+0x68>
  1004cd:	8b 15 08 29 10 00    	mov    0x102908,%edx
  1004d3:	8b 0d 0c 29 10 00    	mov    0x10290c,%ecx
  1004d9:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  1004dc:	c1 e0 04             	shl    $0x4,%eax
  1004df:	01 d0                	add    %edx,%eax
  1004e1:	01 c0                	add    %eax,%eax
  1004e3:	89 c7                	mov    %eax,%edi
  1004e5:	0f be db             	movsbl %bl,%ebx
  1004e8:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
  1004ee:	66 89 d8             	mov    %bx,%ax
  1004f1:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1004f5:	42                   	inc    %edx
  1004f6:	83 fa 50             	cmp    $0x50,%edx
  1004f9:	75 1d                	jne    100518 <display+0x58>
  1004fb:	c7 05 08 29 10 00 00 	movl   $0x0,0x102908
  100502:	00 00 00 
  100505:	41                   	inc    %ecx
  100506:	89 0d 0c 29 10 00    	mov    %ecx,0x10290c
  10050c:	b8 01 00 00 00       	mov    $0x1,%eax
  100511:	5b                   	pop    %ebx
  100512:	5f                   	pop    %edi
  100513:	5d                   	pop    %ebp
  100514:	c3                   	ret    
  100515:	8d 76 00             	lea    0x0(%esi),%esi
  100518:	89 15 08 29 10 00    	mov    %edx,0x102908
  10051e:	b8 01 00 00 00       	mov    $0x1,%eax
  100523:	5b                   	pop    %ebx
  100524:	5f                   	pop    %edi
  100525:	5d                   	pop    %ebp
  100526:	c3                   	ret    
  100527:	90                   	nop
  100528:	c7 05 08 29 10 00 00 	movl   $0x0,0x102908
  10052f:	00 00 00 
  100532:	ff 05 0c 29 10 00    	incl   0x10290c
  100538:	b8 01 00 00 00       	mov    $0x1,%eax
  10053d:	5b                   	pop    %ebx
  10053e:	5f                   	pop    %edi
  10053f:	5d                   	pop    %ebp
  100540:	c3                   	ret    
  100541:	8d 76 00             	lea    0x0(%esi),%esi

00100544 <printkernel>:
  100544:	55                   	push   %ebp
  100545:	89 e5                	mov    %esp,%ebp
  100547:	53                   	push   %ebx
  100548:	50                   	push   %eax
  100549:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10054c:	0f be 03             	movsbl (%ebx),%eax
  10054f:	84 c0                	test   %al,%al
  100551:	74 20                	je     100573 <printkernel+0x2f>
  100553:	90                   	nop
  100554:	83 ec 0c             	sub    $0xc,%esp
  100557:	50                   	push   %eax
  100558:	e8 eb 00 00 00       	call   100648 <putChar>
  10055d:	0f be 03             	movsbl (%ebx),%eax
  100560:	89 04 24             	mov    %eax,(%esp)
  100563:	e8 58 ff ff ff       	call   1004c0 <display>
  100568:	43                   	inc    %ebx
  100569:	0f be 03             	movsbl (%ebx),%eax
  10056c:	83 c4 10             	add    $0x10,%esp
  10056f:	84 c0                	test   %al,%al
  100571:	75 e1                	jne    100554 <printkernel+0x10>
  100573:	b8 01 00 00 00       	mov    $0x1,%eax
  100578:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10057b:	c9                   	leave  
  10057c:	c3                   	ret    
  10057d:	8d 76 00             	lea    0x0(%esi),%esi

00100580 <fs_write>:
  100580:	55                   	push   %ebp
  100581:	89 e5                	mov    %esp,%ebp
  100583:	53                   	push   %ebx
  100584:	50                   	push   %eax
  100585:	8b 5d 10             	mov    0x10(%ebp),%ebx
  100588:	ba 30 00 00 00       	mov    $0x30,%edx
  10058d:	89 d0                	mov    %edx,%eax
  10058f:	8e e8                	mov    %eax,%gs
  100591:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  100595:	74 12                	je     1005a9 <fs_write+0x29>
  100597:	83 ec 08             	sub    $0x8,%esp
  10059a:	6a 27                	push   $0x27
  10059c:	68 e9 10 10 00       	push   $0x1010e9
  1005a1:	e8 de 09 00 00       	call   100f84 <abort>
  1005a6:	83 c4 10             	add    $0x10,%esp
  1005a9:	83 ec 08             	sub    $0x8,%esp
  1005ac:	53                   	push   %ebx
  1005ad:	ff 75 0c             	pushl  0xc(%ebp)
  1005b0:	e8 8f ff ff ff       	call   100544 <printkernel>
  1005b5:	89 d8                	mov    %ebx,%eax
  1005b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005ba:	c9                   	leave  
  1005bb:	c3                   	ret    

001005bc <sys_write>:
  1005bc:	55                   	push   %ebp
  1005bd:	89 e5                	mov    %esp,%ebp
  1005bf:	53                   	push   %ebx
  1005c0:	83 ec 08             	sub    $0x8,%esp
  1005c3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1005c6:	ff 73 14             	pushl  0x14(%ebx)
  1005c9:	ff 73 18             	pushl  0x18(%ebx)
  1005cc:	ff 73 10             	pushl  0x10(%ebx)
  1005cf:	e8 ac ff ff ff       	call   100580 <fs_write>
  1005d4:	89 43 1c             	mov    %eax,0x1c(%ebx)
  1005d7:	83 c4 10             	add    $0x10,%esp
  1005da:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005dd:	c9                   	leave  
  1005de:	c3                   	ret    
  1005df:	90                   	nop

001005e0 <print_char>:
  1005e0:	55                   	push   %ebp
  1005e1:	89 e5                	mov    %esp,%ebp
  1005e3:	57                   	push   %edi
  1005e4:	8b 45 08             	mov    0x8(%ebp),%eax
  1005e7:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1005ea:	c1 e0 04             	shl    $0x4,%eax
  1005ed:	03 45 0c             	add    0xc(%ebp),%eax
  1005f0:	01 c0                	add    %eax,%eax
  1005f2:	89 c7                	mov    %eax,%edi
  1005f4:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  1005f8:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  1005fe:	66 89 d0             	mov    %dx,%ax
  100601:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100605:	5f                   	pop    %edi
  100606:	5d                   	pop    %ebp
  100607:	c3                   	ret    

00100608 <initSerial>:
  100608:	55                   	push   %ebp
  100609:	89 e5                	mov    %esp,%ebp
  10060b:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100610:	31 c0                	xor    %eax,%eax
  100612:	ee                   	out    %al,(%dx)
  100613:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100618:	b0 80                	mov    $0x80,%al
  10061a:	ee                   	out    %al,(%dx)
  10061b:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100620:	b0 01                	mov    $0x1,%al
  100622:	ee                   	out    %al,(%dx)
  100623:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100628:	31 c0                	xor    %eax,%eax
  10062a:	ee                   	out    %al,(%dx)
  10062b:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100630:	b0 03                	mov    $0x3,%al
  100632:	ee                   	out    %al,(%dx)
  100633:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100638:	b0 c7                	mov    $0xc7,%al
  10063a:	ee                   	out    %al,(%dx)
  10063b:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100640:	b0 0b                	mov    $0xb,%al
  100642:	ee                   	out    %al,(%dx)
  100643:	5d                   	pop    %ebp
  100644:	c3                   	ret    
  100645:	8d 76 00             	lea    0x0(%esi),%esi

00100648 <putChar>:
  100648:	55                   	push   %ebp
  100649:	89 e5                	mov    %esp,%ebp
  10064b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10064e:	ba fd 03 00 00       	mov    $0x3fd,%edx
  100653:	90                   	nop
  100654:	ec                   	in     (%dx),%al
  100655:	a8 20                	test   $0x20,%al
  100657:	74 fb                	je     100654 <putChar+0xc>
  100659:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10065e:	88 c8                	mov    %cl,%al
  100660:	ee                   	out    %al,(%dx)
  100661:	5d                   	pop    %ebp
  100662:	c3                   	ret    
  100663:	90                   	nop

00100664 <IDLE>:
  100664:	55                   	push   %ebp
  100665:	89 e5                	mov    %esp,%ebp
  100667:	90                   	nop
  100668:	f4                   	hlt    
  100669:	eb fd                	jmp    100668 <IDLE+0x4>
  10066b:	90                   	nop

0010066c <put_into_running>:
  10066c:	55                   	push   %ebp
  10066d:	89 e5                	mov    %esp,%ebp
  10066f:	57                   	push   %edi
  100670:	56                   	push   %esi
  100671:	8b 45 08             	mov    0x8(%ebp),%eax
  100674:	39 05 80 31 10 00    	cmp    %eax,0x103180
  10067a:	74 23                	je     10069f <put_into_running+0x33>
  10067c:	a3 80 31 10 00       	mov    %eax,0x103180
  100681:	89 c2                	mov    %eax,%edx
  100683:	c1 e2 07             	shl    $0x7,%edx
  100686:	01 c2                	add    %eax,%edx
  100688:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10068b:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10068e:	8d 34 85 a0 51 10 00 	lea    0x1051a0(,%eax,4),%esi
  100695:	b9 0f 00 00 00       	mov    $0xf,%ecx
  10069a:	8b 7d 0c             	mov    0xc(%ebp),%edi
  10069d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10069f:	b8 01 00 00 00       	mov    $0x1,%eax
  1006a4:	5e                   	pop    %esi
  1006a5:	5f                   	pop    %edi
  1006a6:	5d                   	pop    %ebp
  1006a7:	c3                   	ret    

001006a8 <update_block>:
  1006a8:	55                   	push   %ebp
  1006a9:	89 e5                	mov    %esp,%ebp
  1006ab:	b8 01 00 00 00       	mov    $0x1,%eax
  1006b0:	5d                   	pop    %ebp
  1006b1:	c3                   	ret    
  1006b2:	66 90                	xchg   %ax,%ax

001006b4 <checkTimeCount>:
  1006b4:	8b 0d 84 31 10 00    	mov    0x103184,%ecx
  1006ba:	85 c9                	test   %ecx,%ecx
  1006bc:	0f 84 e2 00 00 00    	je     1007a4 <checkTimeCount+0xf0>
  1006c2:	55                   	push   %ebp
  1006c3:	89 e5                	mov    %esp,%ebp
  1006c5:	83 ec 08             	sub    $0x8,%esp
  1006c8:	83 3d 80 92 10 00 23 	cmpl   $0x23,0x109280
  1006cf:	74 12                	je     1006e3 <checkTimeCount+0x2f>
  1006d1:	83 ec 08             	sub    $0x8,%esp
  1006d4:	6a 1e                	push   $0x1e
  1006d6:	68 05 11 10 00       	push   $0x101105
  1006db:	e8 a4 08 00 00       	call   100f84 <abort>
  1006e0:	83 c4 10             	add    $0x10,%esp
  1006e3:	83 3d 74 92 10 00 1b 	cmpl   $0x1b,0x109274
  1006ea:	74 12                	je     1006fe <checkTimeCount+0x4a>
  1006ec:	83 ec 08             	sub    $0x8,%esp
  1006ef:	6a 20                	push   $0x20
  1006f1:	68 05 11 10 00       	push   $0x101105
  1006f6:	e8 89 08 00 00       	call   100f84 <abort>
  1006fb:	83 c4 10             	add    $0x10,%esp
  1006fe:	83 ec 0c             	sub    $0xc,%esp
  100701:	68 6c 10 10 00       	push   $0x10106c
  100706:	e8 05 07 00 00       	call   100e10 <printk>
  10070b:	58                   	pop    %eax
  10070c:	ff 35 80 31 10 00    	pushl  0x103180
  100712:	68 50 11 10 00       	push   $0x101150
  100717:	6a 27                	push   $0x27
  100719:	68 05 11 10 00       	push   $0x101105
  10071e:	68 13 11 10 00       	push   $0x101113
  100723:	e8 e8 06 00 00       	call   100e10 <printk>
  100728:	83 c4 14             	add    $0x14,%esp
  10072b:	68 8d 10 10 00       	push   $0x10108d
  100730:	e8 db 06 00 00       	call   100e10 <printk>
  100735:	c7 04 24 6c 10 10 00 	movl   $0x10106c,(%esp)
  10073c:	e8 cf 06 00 00       	call   100e10 <printk>
  100741:	5a                   	pop    %edx
  100742:	a1 80 31 10 00       	mov    0x103180,%eax
  100747:	89 c2                	mov    %eax,%edx
  100749:	c1 e2 07             	shl    $0x7,%edx
  10074c:	01 c2                	add    %eax,%edx
  10074e:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100751:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100754:	ff 34 85 e0 51 10 00 	pushl  0x1051e0(,%eax,4)
  10075b:	68 50 11 10 00       	push   $0x101150
  100760:	6a 28                	push   $0x28
  100762:	68 05 11 10 00       	push   $0x101105
  100767:	68 30 11 10 00       	push   $0x101130
  10076c:	e8 9f 06 00 00       	call   100e10 <printk>
  100771:	83 c4 14             	add    $0x14,%esp
  100774:	68 8d 10 10 00       	push   $0x10108d
  100779:	e8 92 06 00 00       	call   100e10 <printk>
  10077e:	a1 80 31 10 00       	mov    0x103180,%eax
  100783:	89 c2                	mov    %eax,%edx
  100785:	c1 e2 07             	shl    $0x7,%edx
  100788:	01 c2                	add    %eax,%edx
  10078a:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10078d:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100790:	ff 0c 85 e0 51 10 00 	decl   0x1051e0(,%eax,4)
  100797:	83 c4 10             	add    $0x10,%esp
  10079a:	b8 01 00 00 00       	mov    $0x1,%eax
  10079f:	c9                   	leave  
  1007a0:	c3                   	ret    
  1007a1:	8d 76 00             	lea    0x0(%esi),%esi
  1007a4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007a9:	c3                   	ret    
  1007aa:	66 90                	xchg   %ax,%ax

001007ac <transfer_pid_state>:
  1007ac:	55                   	push   %ebp
  1007ad:	89 e5                	mov    %esp,%ebp
  1007af:	b8 01 00 00 00       	mov    $0x1,%eax
  1007b4:	5d                   	pop    %ebp
  1007b5:	c3                   	ret    
  1007b6:	66 90                	xchg   %ax,%ax

001007b8 <apply_new_pid>:
  1007b8:	55                   	push   %ebp
  1007b9:	89 e5                	mov    %esp,%ebp
  1007bb:	b8 02 00 00 00       	mov    $0x2,%eax
  1007c0:	5d                   	pop    %ebp
  1007c1:	c3                   	ret    
  1007c2:	66 90                	xchg   %ax,%ax

001007c4 <getpid>:
  1007c4:	55                   	push   %ebp
  1007c5:	89 e5                	mov    %esp,%ebp
  1007c7:	a1 80 31 10 00       	mov    0x103180,%eax
  1007cc:	5d                   	pop    %ebp
  1007cd:	c3                   	ret    
  1007ce:	66 90                	xchg   %ax,%ax

001007d0 <transfer_pid_mode>:
  1007d0:	55                   	push   %ebp
  1007d1:	89 e5                	mov    %esp,%ebp
  1007d3:	b8 01 00 00 00       	mov    $0x1,%eax
  1007d8:	5d                   	pop    %ebp
  1007d9:	c3                   	ret    
  1007da:	66 90                	xchg   %ax,%ax

001007dc <get_from_runnable>:
  1007dc:	a1 e4 27 10 00       	mov    0x1027e4,%eax
  1007e1:	83 f8 ff             	cmp    $0xffffffff,%eax
  1007e4:	74 66                	je     10084c <get_from_runnable+0x70>
  1007e6:	89 c2                	mov    %eax,%edx
  1007e8:	c1 e2 07             	shl    $0x7,%edx
  1007eb:	01 c2                	add    %eax,%edx
  1007ed:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1007f0:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1007f3:	8d 0c 95 a0 31 10 00 	lea    0x1031a0(,%edx,4),%ecx
  1007fa:	8b 91 50 20 00 00    	mov    0x2050(%ecx),%edx
  100800:	39 d0                	cmp    %edx,%eax
  100802:	74 3c                	je     100840 <get_from_runnable+0x64>
  100804:	55                   	push   %ebp
  100805:	89 e5                	mov    %esp,%ebp
  100807:	53                   	push   %ebx
  100808:	8b 89 4c 20 00 00    	mov    0x204c(%ecx),%ecx
  10080e:	89 cb                	mov    %ecx,%ebx
  100810:	c1 e3 07             	shl    $0x7,%ebx
  100813:	01 cb                	add    %ecx,%ebx
  100815:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx
  100818:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx
  10081b:	89 14 9d f0 51 10 00 	mov    %edx,0x1051f0(,%ebx,4)
  100822:	89 d3                	mov    %edx,%ebx
  100824:	c1 e3 07             	shl    $0x7,%ebx
  100827:	01 d3                	add    %edx,%ebx
  100829:	8d 1c 9a             	lea    (%edx,%ebx,4),%ebx
  10082c:	8d 1c 9a             	lea    (%edx,%ebx,4),%ebx
  10082f:	89 0c 9d ec 51 10 00 	mov    %ecx,0x1051ec(,%ebx,4)
  100836:	89 15 e4 27 10 00    	mov    %edx,0x1027e4
  10083c:	5b                   	pop    %ebx
  10083d:	5d                   	pop    %ebp
  10083e:	c3                   	ret    
  10083f:	90                   	nop
  100840:	c7 05 e4 27 10 00 ff 	movl   $0xffffffff,0x1027e4
  100847:	ff ff ff 
  10084a:	c3                   	ret    
  10084b:	90                   	nop
  10084c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100851:	c3                   	ret    
  100852:	66 90                	xchg   %ax,%ax

00100854 <put_into_runnable>:
  100854:	55                   	push   %ebp
  100855:	89 e5                	mov    %esp,%ebp
  100857:	56                   	push   %esi
  100858:	53                   	push   %ebx
  100859:	8b 45 08             	mov    0x8(%ebp),%eax
  10085c:	8b 15 e4 27 10 00    	mov    0x1027e4,%edx
  100862:	83 fa ff             	cmp    $0xffffffff,%edx
  100865:	0f 84 85 00 00 00    	je     1008f0 <put_into_runnable+0x9c>
  10086b:	89 d1                	mov    %edx,%ecx
  10086d:	c1 e1 07             	shl    $0x7,%ecx
  100870:	01 d1                	add    %edx,%ecx
  100872:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100875:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100878:	8d 34 8d a0 31 10 00 	lea    0x1031a0(,%ecx,4),%esi
  10087f:	8b 8e 4c 20 00 00    	mov    0x204c(%esi),%ecx
  100885:	89 cb                	mov    %ecx,%ebx
  100887:	c1 e3 07             	shl    $0x7,%ebx
  10088a:	01 cb                	add    %ecx,%ebx
  10088c:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx
  10088f:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx
  100892:	89 04 9d f0 51 10 00 	mov    %eax,0x1051f0(,%ebx,4)
  100899:	89 c3                	mov    %eax,%ebx
  10089b:	c1 e3 07             	shl    $0x7,%ebx
  10089e:	01 c3                	add    %eax,%ebx
  1008a0:	8d 1c 98             	lea    (%eax,%ebx,4),%ebx
  1008a3:	8d 1c 98             	lea    (%eax,%ebx,4),%ebx
  1008a6:	8d 1c 9d a0 31 10 00 	lea    0x1031a0(,%ebx,4),%ebx
  1008ad:	89 8b 4c 20 00 00    	mov    %ecx,0x204c(%ebx)
  1008b3:	89 93 50 20 00 00    	mov    %edx,0x2050(%ebx)
  1008b9:	89 86 4c 20 00 00    	mov    %eax,0x204c(%esi)
  1008bf:	89 c2                	mov    %eax,%edx
  1008c1:	c1 e2 07             	shl    $0x7,%edx
  1008c4:	01 c2                	add    %eax,%edx
  1008c6:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1008c9:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1008cc:	8d 04 85 a0 31 10 00 	lea    0x1031a0(,%eax,4),%eax
  1008d3:	c7 80 3c 20 00 00 01 	movl   $0x1,0x203c(%eax)
  1008da:	00 00 00 
  1008dd:	c7 80 40 20 00 00 0a 	movl   $0xa,0x2040(%eax)
  1008e4:	00 00 00 
  1008e7:	b8 01 00 00 00       	mov    $0x1,%eax
  1008ec:	5b                   	pop    %ebx
  1008ed:	5e                   	pop    %esi
  1008ee:	5d                   	pop    %ebp
  1008ef:	c3                   	ret    
  1008f0:	a3 e4 27 10 00       	mov    %eax,0x1027e4
  1008f5:	89 c2                	mov    %eax,%edx
  1008f7:	c1 e2 07             	shl    $0x7,%edx
  1008fa:	01 c2                	add    %eax,%edx
  1008fc:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1008ff:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100902:	8d 14 95 a0 31 10 00 	lea    0x1031a0(,%edx,4),%edx
  100909:	89 82 4c 20 00 00    	mov    %eax,0x204c(%edx)
  10090f:	89 82 50 20 00 00    	mov    %eax,0x2050(%edx)
  100915:	eb a8                	jmp    1008bf <put_into_runnable+0x6b>
  100917:	90                   	nop

00100918 <put_into_block>:
  100918:	55                   	push   %ebp
  100919:	89 e5                	mov    %esp,%ebp
  10091b:	56                   	push   %esi
  10091c:	53                   	push   %ebx
  10091d:	8b 45 08             	mov    0x8(%ebp),%eax
  100920:	8b 15 e0 27 10 00    	mov    0x1027e0,%edx
  100926:	83 fa ff             	cmp    $0xffffffff,%edx
  100929:	0f 84 85 00 00 00    	je     1009b4 <put_into_block+0x9c>
  10092f:	89 d1                	mov    %edx,%ecx
  100931:	c1 e1 07             	shl    $0x7,%ecx
  100934:	01 d1                	add    %edx,%ecx
  100936:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100939:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  10093c:	8d 34 8d a0 31 10 00 	lea    0x1031a0(,%ecx,4),%esi
  100943:	8b 8e 4c 20 00 00    	mov    0x204c(%esi),%ecx
  100949:	89 cb                	mov    %ecx,%ebx
  10094b:	c1 e3 07             	shl    $0x7,%ebx
  10094e:	01 cb                	add    %ecx,%ebx
  100950:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx
  100953:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx
  100956:	89 04 9d f0 51 10 00 	mov    %eax,0x1051f0(,%ebx,4)
  10095d:	89 c3                	mov    %eax,%ebx
  10095f:	c1 e3 07             	shl    $0x7,%ebx
  100962:	01 c3                	add    %eax,%ebx
  100964:	8d 1c 98             	lea    (%eax,%ebx,4),%ebx
  100967:	8d 1c 98             	lea    (%eax,%ebx,4),%ebx
  10096a:	8d 1c 9d a0 31 10 00 	lea    0x1031a0(,%ebx,4),%ebx
  100971:	89 8b 4c 20 00 00    	mov    %ecx,0x204c(%ebx)
  100977:	89 93 50 20 00 00    	mov    %edx,0x2050(%ebx)
  10097d:	89 86 4c 20 00 00    	mov    %eax,0x204c(%esi)
  100983:	89 c2                	mov    %eax,%edx
  100985:	c1 e2 07             	shl    $0x7,%edx
  100988:	01 c2                	add    %eax,%edx
  10098a:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10098d:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100990:	8d 04 85 a0 31 10 00 	lea    0x1031a0(,%eax,4),%eax
  100997:	8b 55 0c             	mov    0xc(%ebp),%edx
  10099a:	89 90 44 20 00 00    	mov    %edx,0x2044(%eax)
  1009a0:	c7 80 3c 20 00 00 00 	movl   $0x0,0x203c(%eax)
  1009a7:	00 00 00 
  1009aa:	b8 01 00 00 00       	mov    $0x1,%eax
  1009af:	5b                   	pop    %ebx
  1009b0:	5e                   	pop    %esi
  1009b1:	5d                   	pop    %ebp
  1009b2:	c3                   	ret    
  1009b3:	90                   	nop
  1009b4:	a3 e0 27 10 00       	mov    %eax,0x1027e0
  1009b9:	89 c2                	mov    %eax,%edx
  1009bb:	c1 e2 07             	shl    $0x7,%edx
  1009be:	01 c2                	add    %eax,%edx
  1009c0:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1009c3:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1009c6:	8d 14 95 a0 31 10 00 	lea    0x1031a0(,%edx,4),%edx
  1009cd:	89 82 50 20 00 00    	mov    %eax,0x2050(%edx)
  1009d3:	89 82 4c 20 00 00    	mov    %eax,0x204c(%edx)
  1009d9:	eb a8                	jmp    100983 <put_into_block+0x6b>
  1009db:	90                   	nop

001009dc <init_pcb>:
  1009dc:	55                   	push   %ebp
  1009dd:	89 e5                	mov    %esp,%ebp
  1009df:	ba e8 51 10 00       	mov    $0x1051e8,%edx
  1009e4:	31 c0                	xor    %eax,%eax
  1009e6:	66 90                	xchg   %ax,%ax
  1009e8:	89 02                	mov    %eax,(%edx)
  1009ea:	8d 48 ff             	lea    -0x1(%eax),%ecx
  1009ed:	89 4a 04             	mov    %ecx,0x4(%edx)
  1009f0:	40                   	inc    %eax
  1009f1:	89 42 08             	mov    %eax,0x8(%edx)
  1009f4:	81 c2 54 20 00 00    	add    $0x2054,%edx
  1009fa:	3d 00 08 00 00       	cmp    $0x800,%eax
  1009ff:	75 e7                	jne    1009e8 <init_pcb+0xc>
  100a01:	c7 05 ec 51 10 00 ff 	movl   $0x7ff,0x1051ec
  100a08:	07 00 00 
  100a0b:	c7 05 9c d1 12 01 00 	movl   $0x0,0x112d19c
  100a12:	00 00 00 
  100a15:	5d                   	pop    %ebp
  100a16:	c3                   	ret    
  100a17:	90                   	nop

00100a18 <init_kernel_pcb>:
  100a18:	55                   	push   %ebp
  100a19:	89 e5                	mov    %esp,%ebp
  100a1b:	c7 05 d8 51 10 00 10 	movl   $0x10,0x1051d8
  100a22:	00 00 00 
  100a25:	c7 05 d4 51 10 00 00 	movl   $0x7f00000,0x1051d4
  100a2c:	00 f0 07 
  100a2f:	c7 05 dc 51 10 00 01 	movl   $0x1,0x1051dc
  100a36:	00 00 00 
  100a39:	c7 05 c8 51 10 00 64 	movl   $0x100664,0x1051c8
  100a40:	06 10 00 
  100a43:	b8 01 00 00 00       	mov    $0x1,%eax
  100a48:	5d                   	pop    %ebp
  100a49:	c3                   	ret    
  100a4a:	66 90                	xchg   %ax,%ax

00100a4c <initIdt>:
  100a4c:	55                   	push   %ebp
  100a4d:	89 e5                	mov    %esp,%ebp
  100a4f:	53                   	push   %ebx
  100a50:	ba 1b 10 10 00       	mov    $0x10101b,%edx
  100a55:	89 d3                	mov    %edx,%ebx
  100a57:	c1 ea 10             	shr    $0x10,%edx
  100a5a:	b9 60 da 12 01       	mov    $0x112da60,%ecx
  100a5f:	b8 60 d2 12 01       	mov    $0x112d260,%eax
  100a64:	66 89 18             	mov    %bx,(%eax)
  100a67:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100a6d:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100a71:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100a75:	66 89 50 06          	mov    %dx,0x6(%eax)
  100a79:	83 c0 08             	add    $0x8,%eax
  100a7c:	39 c1                	cmp    %eax,%ecx
  100a7e:	75 e4                	jne    100a64 <initIdt+0x18>
  100a80:	b8 21 10 10 00       	mov    $0x101021,%eax
  100a85:	66 a3 c8 d2 12 01    	mov    %ax,0x112d2c8
  100a8b:	66 c7 05 ca d2 12 01 	movw   $0x8,0x112d2ca
  100a92:	08 00 
  100a94:	c6 05 cc d2 12 01 00 	movb   $0x0,0x112d2cc
  100a9b:	c6 05 cd d2 12 01 8f 	movb   $0x8f,0x112d2cd
  100aa2:	c1 e8 10             	shr    $0x10,%eax
  100aa5:	66 a3 ce d2 12 01    	mov    %ax,0x112d2ce
  100aab:	b8 25 10 10 00       	mov    $0x101025,%eax
  100ab0:	66 a3 60 d6 12 01    	mov    %ax,0x112d660
  100ab6:	66 c7 05 62 d6 12 01 	movw   $0x8,0x112d662
  100abd:	08 00 
  100abf:	c6 05 64 d6 12 01 00 	movb   $0x0,0x112d664
  100ac6:	c6 05 65 d6 12 01 ee 	movb   $0xee,0x112d665
  100acd:	c1 e8 10             	shr    $0x10,%eax
  100ad0:	66 a3 66 d6 12 01    	mov    %ax,0x112d666
  100ad6:	b8 2e 10 10 00       	mov    $0x10102e,%eax
  100adb:	66 a3 60 d3 12 01    	mov    %ax,0x112d360
  100ae1:	66 c7 05 62 d3 12 01 	movw   $0x8,0x112d362
  100ae8:	08 00 
  100aea:	c6 05 64 d3 12 01 00 	movb   $0x0,0x112d364
  100af1:	c6 05 65 d3 12 01 8e 	movb   $0x8e,0x112d365
  100af8:	c1 e8 10             	shr    $0x10,%eax
  100afb:	66 a3 66 d3 12 01    	mov    %ax,0x112d366
  100b01:	66 c7 05 10 29 10 00 	movw   $0x7ff,0x102910
  100b08:	ff 07 
  100b0a:	b8 60 d2 12 01       	mov    $0x112d260,%eax
  100b0f:	66 a3 12 29 10 00    	mov    %ax,0x102912
  100b15:	c1 e8 10             	shr    $0x10,%eax
  100b18:	66 a3 14 29 10 00    	mov    %ax,0x102914
  100b1e:	b8 10 29 10 00       	mov    $0x102910,%eax
  100b23:	0f 01 18             	lidtl  (%eax)
  100b26:	5b                   	pop    %ebx
  100b27:	5d                   	pop    %ebp
  100b28:	c3                   	ret    
  100b29:	66 90                	xchg   %ax,%ax
  100b2b:	90                   	nop

00100b2c <syscallHandle>:
  100b2c:	55                   	push   %ebp
  100b2d:	89 e5                	mov    %esp,%ebp
  100b2f:	53                   	push   %ebx
  100b30:	83 ec 10             	sub    $0x10,%esp
  100b33:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100b36:	68 6c 10 10 00       	push   $0x10106c
  100b3b:	e8 d0 02 00 00       	call   100e10 <printk>
  100b40:	58                   	pop    %eax
  100b41:	ff 73 20             	pushl  0x20(%ebx)
  100b44:	68 bc 11 10 00       	push   $0x1011bc
  100b49:	6a 31                	push   $0x31
  100b4b:	68 5f 11 10 00       	push   $0x10115f
  100b50:	68 72 11 10 00       	push   $0x101172
  100b55:	e8 b6 02 00 00       	call   100e10 <printk>
  100b5a:	83 c4 14             	add    $0x14,%esp
  100b5d:	68 8d 10 10 00       	push   $0x10108d
  100b62:	e8 a9 02 00 00       	call   100e10 <printk>
  100b67:	83 c4 10             	add    $0x10,%esp
  100b6a:	8b 43 1c             	mov    0x1c(%ebx),%eax
  100b6d:	83 f8 02             	cmp    $0x2,%eax
  100b70:	74 12                	je     100b84 <syscallHandle+0x58>
  100b72:	83 f8 04             	cmp    $0x4,%eax
  100b75:	75 1c                	jne    100b93 <syscallHandle+0x67>
  100b77:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100b7a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100b7d:	c9                   	leave  
  100b7e:	e9 39 fa ff ff       	jmp    1005bc <sys_write>
  100b83:	90                   	nop
  100b84:	83 ec 0c             	sub    $0xc,%esp
  100b87:	53                   	push   %ebx
  100b88:	e8 77 f8 ff ff       	call   100404 <sys_fork>
  100b8d:	89 43 1c             	mov    %eax,0x1c(%ebx)
  100b90:	83 c4 10             	add    $0x10,%esp
  100b93:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100b96:	c9                   	leave  
  100b97:	c3                   	ret    

00100b98 <GProtectFaultHandle>:
  100b98:	55                   	push   %ebp
  100b99:	89 e5                	mov    %esp,%ebp
  100b9b:	83 ec 14             	sub    $0x14,%esp
  100b9e:	68 6c 10 10 00       	push   $0x10106c
  100ba3:	e8 68 02 00 00       	call   100e10 <printk>
  100ba8:	58                   	pop    %eax
  100ba9:	8b 45 08             	mov    0x8(%ebp),%eax
  100bac:	ff 70 20             	pushl  0x20(%eax)
  100baf:	68 a8 11 10 00       	push   $0x1011a8
  100bb4:	6a 49                	push   $0x49
  100bb6:	68 5f 11 10 00       	push   $0x10115f
  100bbb:	68 8f 11 10 00       	push   $0x10118f
  100bc0:	e8 4b 02 00 00       	call   100e10 <printk>
  100bc5:	83 c4 14             	add    $0x14,%esp
  100bc8:	68 8d 10 10 00       	push   $0x10108d
  100bcd:	e8 3e 02 00 00       	call   100e10 <printk>
  100bd2:	5a                   	pop    %edx
  100bd3:	59                   	pop    %ecx
  100bd4:	6a 4a                	push   $0x4a
  100bd6:	68 5f 11 10 00       	push   $0x10115f
  100bdb:	e8 a4 03 00 00       	call   100f84 <abort>
  100be0:	83 c4 10             	add    $0x10,%esp
  100be3:	c9                   	leave  
  100be4:	c3                   	ret    
  100be5:	8d 76 00             	lea    0x0(%esi),%esi

00100be8 <timeHandle>:
  100be8:	55                   	push   %ebp
  100be9:	89 e5                	mov    %esp,%ebp
  100beb:	53                   	push   %ebx
  100bec:	50                   	push   %eax
  100bed:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100bf0:	83 3d 80 31 10 00 01 	cmpl   $0x1,0x103180
  100bf7:	74 12                	je     100c0b <timeHandle+0x23>
  100bf9:	83 ec 08             	sub    $0x8,%esp
  100bfc:	6a 60                	push   $0x60
  100bfe:	68 5f 11 10 00       	push   $0x10115f
  100c03:	e8 7c 03 00 00       	call   100f84 <abort>
  100c08:	83 c4 10             	add    $0x10,%esp
  100c0b:	83 ec 0c             	sub    $0xc,%esp
  100c0e:	53                   	push   %ebx
  100c0f:	e8 a0 fa ff ff       	call   1006b4 <checkTimeCount>
  100c14:	83 c4 10             	add    $0x10,%esp
  100c17:	c7 45 08 41 00 00 00 	movl   $0x41,0x8(%ebp)
  100c1e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100c21:	c9                   	leave  
  100c22:	e9 21 fa ff ff       	jmp    100648 <putChar>
  100c27:	90                   	nop

00100c28 <irqHandle>:
  100c28:	55                   	push   %ebp
  100c29:	89 e5                	mov    %esp,%ebp
  100c2b:	83 ec 08             	sub    $0x8,%esp
  100c2e:	8b 55 08             	mov    0x8(%ebp),%edx
  100c31:	fa                   	cli    
  100c32:	8b 42 20             	mov    0x20(%edx),%eax
  100c35:	83 f8 0d             	cmp    $0xd,%eax
  100c38:	74 46                	je     100c80 <irqHandle+0x58>
  100c3a:	7e 2c                	jle    100c68 <irqHandle+0x40>
  100c3c:	83 f8 20             	cmp    $0x20,%eax
  100c3f:	74 17                	je     100c58 <irqHandle+0x30>
  100c41:	83 c0 80             	add    $0xffffff80,%eax
  100c44:	75 25                	jne    100c6b <irqHandle+0x43>
  100c46:	83 ec 0c             	sub    $0xc,%esp
  100c49:	52                   	push   %edx
  100c4a:	e8 dd fe ff ff       	call   100b2c <syscallHandle>
  100c4f:	83 c4 10             	add    $0x10,%esp
  100c52:	fb                   	sti    
  100c53:	c9                   	leave  
  100c54:	c3                   	ret    
  100c55:	8d 76 00             	lea    0x0(%esi),%esi
  100c58:	83 ec 0c             	sub    $0xc,%esp
  100c5b:	52                   	push   %edx
  100c5c:	e8 87 ff ff ff       	call   100be8 <timeHandle>
  100c61:	83 c4 10             	add    $0x10,%esp
  100c64:	eb ec                	jmp    100c52 <irqHandle+0x2a>
  100c66:	66 90                	xchg   %ax,%ax
  100c68:	40                   	inc    %eax
  100c69:	74 e7                	je     100c52 <irqHandle+0x2a>
  100c6b:	83 ec 08             	sub    $0x8,%esp
  100c6e:	6a 24                	push   $0x24
  100c70:	68 5f 11 10 00       	push   $0x10115f
  100c75:	e8 0a 03 00 00       	call   100f84 <abort>
  100c7a:	83 c4 10             	add    $0x10,%esp
  100c7d:	eb d3                	jmp    100c52 <irqHandle+0x2a>
  100c7f:	90                   	nop
  100c80:	83 ec 0c             	sub    $0xc,%esp
  100c83:	52                   	push   %edx
  100c84:	e8 0f ff ff ff       	call   100b98 <GProtectFaultHandle>
  100c89:	83 c4 10             	add    $0x10,%esp
  100c8c:	eb c4                	jmp    100c52 <irqHandle+0x2a>
  100c8e:	66 90                	xchg   %ax,%ax

00100c90 <initIntr>:
  100c90:	55                   	push   %ebp
  100c91:	89 e5                	mov    %esp,%ebp
  100c93:	ba 21 00 00 00       	mov    $0x21,%edx
  100c98:	b0 ff                	mov    $0xff,%al
  100c9a:	ee                   	out    %al,(%dx)
  100c9b:	ba a1 00 00 00       	mov    $0xa1,%edx
  100ca0:	ee                   	out    %al,(%dx)
  100ca1:	ba 20 00 00 00       	mov    $0x20,%edx
  100ca6:	b0 11                	mov    $0x11,%al
  100ca8:	ee                   	out    %al,(%dx)
  100ca9:	ba 21 00 00 00       	mov    $0x21,%edx
  100cae:	b0 20                	mov    $0x20,%al
  100cb0:	ee                   	out    %al,(%dx)
  100cb1:	b0 04                	mov    $0x4,%al
  100cb3:	ee                   	out    %al,(%dx)
  100cb4:	b0 03                	mov    $0x3,%al
  100cb6:	ee                   	out    %al,(%dx)
  100cb7:	ba a0 00 00 00       	mov    $0xa0,%edx
  100cbc:	b0 11                	mov    $0x11,%al
  100cbe:	ee                   	out    %al,(%dx)
  100cbf:	ba a1 00 00 00       	mov    $0xa1,%edx
  100cc4:	b0 28                	mov    $0x28,%al
  100cc6:	ee                   	out    %al,(%dx)
  100cc7:	b0 02                	mov    $0x2,%al
  100cc9:	ee                   	out    %al,(%dx)
  100cca:	b0 03                	mov    $0x3,%al
  100ccc:	ee                   	out    %al,(%dx)
  100ccd:	ba 20 00 00 00       	mov    $0x20,%edx
  100cd2:	b0 68                	mov    $0x68,%al
  100cd4:	ee                   	out    %al,(%dx)
  100cd5:	b0 0a                	mov    $0xa,%al
  100cd7:	ee                   	out    %al,(%dx)
  100cd8:	ba a0 00 00 00       	mov    $0xa0,%edx
  100cdd:	b0 68                	mov    $0x68,%al
  100cdf:	ee                   	out    %al,(%dx)
  100ce0:	b0 0a                	mov    $0xa,%al
  100ce2:	ee                   	out    %al,(%dx)
  100ce3:	5d                   	pop    %ebp
  100ce4:	c3                   	ret    
  100ce5:	8d 76 00             	lea    0x0(%esi),%esi

00100ce8 <initTimer>:
  100ce8:	55                   	push   %ebp
  100ce9:	89 e5                	mov    %esp,%ebp
  100ceb:	ba 43 00 00 00       	mov    $0x43,%edx
  100cf0:	b0 34                	mov    $0x34,%al
  100cf2:	ee                   	out    %al,(%dx)
  100cf3:	ba 40 00 00 00       	mov    $0x40,%edx
  100cf8:	b0 9b                	mov    $0x9b,%al
  100cfa:	ee                   	out    %al,(%dx)
  100cfb:	b0 2e                	mov    $0x2e,%al
  100cfd:	ee                   	out    %al,(%dx)
  100cfe:	5d                   	pop    %ebp
  100cff:	c3                   	ret    

00100d00 <i2A>:
  100d00:	55                   	push   %ebp
  100d01:	89 e5                	mov    %esp,%ebp
  100d03:	57                   	push   %edi
  100d04:	56                   	push   %esi
  100d05:	53                   	push   %ebx
  100d06:	51                   	push   %ecx
  100d07:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100d0a:	85 c9                	test   %ecx,%ecx
  100d0c:	78 6e                	js     100d7c <i2A+0x7c>
  100d0e:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  100d12:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  100d16:	bb 5e 29 10 00       	mov    $0x10295e,%ebx
  100d1b:	31 ff                	xor    %edi,%edi
  100d1d:	eb 03                	jmp    100d22 <i2A+0x22>
  100d1f:	90                   	nop
  100d20:	89 f7                	mov    %esi,%edi
  100d22:	4b                   	dec    %ebx
  100d23:	89 c8                	mov    %ecx,%eax
  100d25:	be 0a 00 00 00       	mov    $0xa,%esi
  100d2a:	99                   	cltd   
  100d2b:	f7 fe                	idiv   %esi
  100d2d:	83 c2 30             	add    $0x30,%edx
  100d30:	88 13                	mov    %dl,(%ebx)
  100d32:	8d 77 01             	lea    0x1(%edi),%esi
  100d35:	b8 67 66 66 66       	mov    $0x66666667,%eax
  100d3a:	f7 e9                	imul   %ecx
  100d3c:	89 d0                	mov    %edx,%eax
  100d3e:	c1 f8 02             	sar    $0x2,%eax
  100d41:	c1 f9 1f             	sar    $0x1f,%ecx
  100d44:	29 c8                	sub    %ecx,%eax
  100d46:	89 c1                	mov    %eax,%ecx
  100d48:	75 d6                	jne    100d20 <i2A+0x20>
  100d4a:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  100d4e:	74 20                	je     100d70 <i2A+0x70>
  100d50:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  100d54:	75 06                	jne    100d5c <i2A+0x5c>
  100d56:	fe 05 5d 29 10 00    	incb   0x10295d
  100d5c:	c6 05 5e 29 10 00 00 	movb   $0x0,0x10295e
  100d63:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d66:	89 18                	mov    %ebx,(%eax)
  100d68:	89 f0                	mov    %esi,%eax
  100d6a:	5a                   	pop    %edx
  100d6b:	5b                   	pop    %ebx
  100d6c:	5e                   	pop    %esi
  100d6d:	5f                   	pop    %edi
  100d6e:	5d                   	pop    %ebp
  100d6f:	c3                   	ret    
  100d70:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  100d74:	8d 77 02             	lea    0x2(%edi),%esi
  100d77:	4b                   	dec    %ebx
  100d78:	eb d6                	jmp    100d50 <i2A+0x50>
  100d7a:	66 90                	xchg   %ax,%ax
  100d7c:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  100d82:	74 0c                	je     100d90 <i2A+0x90>
  100d84:	f7 d9                	neg    %ecx
  100d86:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  100d8a:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  100d8e:	eb 86                	jmp    100d16 <i2A+0x16>
  100d90:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  100d95:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  100d99:	eb ef                	jmp    100d8a <i2A+0x8a>
  100d9b:	90                   	nop

00100d9c <i2X>:
  100d9c:	55                   	push   %ebp
  100d9d:	89 e5                	mov    %esp,%ebp
  100d9f:	57                   	push   %edi
  100da0:	56                   	push   %esi
  100da1:	53                   	push   %ebx
  100da2:	8b 55 08             	mov    0x8(%ebp),%edx
  100da5:	b9 3d 29 10 00       	mov    $0x10293d,%ecx
  100daa:	31 c0                	xor    %eax,%eax
  100dac:	40                   	inc    %eax
  100dad:	89 d6                	mov    %edx,%esi
  100daf:	83 e6 0f             	and    $0xf,%esi
  100db2:	8d 5e f6             	lea    -0xa(%esi),%ebx
  100db5:	89 cf                	mov    %ecx,%edi
  100db7:	83 fb 05             	cmp    $0x5,%ebx
  100dba:	77 4c                	ja     100e08 <i2X+0x6c>
  100dbc:	ff 24 9d cc 11 10 00 	jmp    *0x1011cc(,%ebx,4)
  100dc3:	90                   	nop
  100dc4:	c6 01 65             	movb   $0x65,(%ecx)
  100dc7:	90                   	nop
  100dc8:	49                   	dec    %ecx
  100dc9:	c1 ea 04             	shr    $0x4,%edx
  100dcc:	75 de                	jne    100dac <i2X+0x10>
  100dce:	c6 05 3e 29 10 00 00 	movb   $0x0,0x10293e
  100dd5:	8b 55 0c             	mov    0xc(%ebp),%edx
  100dd8:	89 3a                	mov    %edi,(%edx)
  100dda:	5b                   	pop    %ebx
  100ddb:	5e                   	pop    %esi
  100ddc:	5f                   	pop    %edi
  100ddd:	5d                   	pop    %ebp
  100dde:	c3                   	ret    
  100ddf:	90                   	nop
  100de0:	c6 01 64             	movb   $0x64,(%ecx)
  100de3:	eb e3                	jmp    100dc8 <i2X+0x2c>
  100de5:	8d 76 00             	lea    0x0(%esi),%esi
  100de8:	c6 01 63             	movb   $0x63,(%ecx)
  100deb:	eb db                	jmp    100dc8 <i2X+0x2c>
  100ded:	8d 76 00             	lea    0x0(%esi),%esi
  100df0:	c6 01 62             	movb   $0x62,(%ecx)
  100df3:	eb d3                	jmp    100dc8 <i2X+0x2c>
  100df5:	8d 76 00             	lea    0x0(%esi),%esi
  100df8:	c6 01 61             	movb   $0x61,(%ecx)
  100dfb:	eb cb                	jmp    100dc8 <i2X+0x2c>
  100dfd:	8d 76 00             	lea    0x0(%esi),%esi
  100e00:	c6 01 66             	movb   $0x66,(%ecx)
  100e03:	eb c3                	jmp    100dc8 <i2X+0x2c>
  100e05:	8d 76 00             	lea    0x0(%esi),%esi
  100e08:	8d 5e 30             	lea    0x30(%esi),%ebx
  100e0b:	88 19                	mov    %bl,(%ecx)
  100e0d:	eb b9                	jmp    100dc8 <i2X+0x2c>
  100e0f:	90                   	nop

00100e10 <printk>:
  100e10:	55                   	push   %ebp
  100e11:	89 e5                	mov    %esp,%ebp
  100e13:	57                   	push   %edi
  100e14:	56                   	push   %esi
  100e15:	53                   	push   %ebx
  100e16:	83 ec 2c             	sub    $0x2c,%esp
  100e19:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100e1c:	8a 11                	mov    (%ecx),%dl
  100e1e:	84 d2                	test   %dl,%dl
  100e20:	0f 84 54 01 00 00    	je     100f7a <printk+0x16a>
  100e26:	8d 45 0c             	lea    0xc(%ebp),%eax
  100e29:	31 ff                	xor    %edi,%edi
  100e2b:	eb 18                	jmp    100e45 <printk+0x35>
  100e2d:	8d 76 00             	lea    0x0(%esi),%esi
  100e30:	8a 11                	mov    (%ecx),%dl
  100e32:	89 cb                	mov    %ecx,%ebx
  100e34:	88 97 60 29 10 00    	mov    %dl,0x102960(%edi)
  100e3a:	47                   	inc    %edi
  100e3b:	8d 4b 01             	lea    0x1(%ebx),%ecx
  100e3e:	8a 53 01             	mov    0x1(%ebx),%dl
  100e41:	84 d2                	test   %dl,%dl
  100e43:	74 72                	je     100eb7 <printk+0xa7>
  100e45:	80 fa 25             	cmp    $0x25,%dl
  100e48:	75 e6                	jne    100e30 <printk+0x20>
  100e4a:	8d 59 01             	lea    0x1(%ecx),%ebx
  100e4d:	8a 51 01             	mov    0x1(%ecx),%dl
  100e50:	80 fa 64             	cmp    $0x64,%dl
  100e53:	0f 84 bf 00 00 00    	je     100f18 <printk+0x108>
  100e59:	0f 8e 01 01 00 00    	jle    100f60 <printk+0x150>
  100e5f:	80 fa 73             	cmp    $0x73,%dl
  100e62:	0f 84 84 00 00 00    	je     100eec <printk+0xdc>
  100e68:	80 fa 78             	cmp    $0x78,%dl
  100e6b:	75 c7                	jne    100e34 <printk+0x24>
  100e6d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100e74:	8d 70 04             	lea    0x4(%eax),%esi
  100e77:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  100e7a:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  100e7d:	56                   	push   %esi
  100e7e:	ff 30                	pushl  (%eax)
  100e80:	e8 17 ff ff ff       	call   100d9c <i2X>
  100e85:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  100e88:	8d b7 60 29 10 00    	lea    0x102960(%edi),%esi
  100e8e:	8a 11                	mov    (%ecx),%dl
  100e90:	83 c4 08             	add    $0x8,%esp
  100e93:	31 c0                	xor    %eax,%eax
  100e95:	84 d2                	test   %dl,%dl
  100e97:	74 0f                	je     100ea8 <printk+0x98>
  100e99:	8d 76 00             	lea    0x0(%esi),%esi
  100e9c:	40                   	inc    %eax
  100e9d:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  100ea1:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  100ea4:	84 d2                	test   %dl,%dl
  100ea6:	75 f4                	jne    100e9c <printk+0x8c>
  100ea8:	01 c7                	add    %eax,%edi
  100eaa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100ead:	8d 4b 01             	lea    0x1(%ebx),%ecx
  100eb0:	8a 53 01             	mov    0x1(%ebx),%dl
  100eb3:	84 d2                	test   %dl,%dl
  100eb5:	75 8e                	jne    100e45 <printk+0x35>
  100eb7:	c6 87 60 29 10 00 00 	movb   $0x0,0x102960(%edi)
  100ebe:	0f be 05 60 29 10 00 	movsbl 0x102960,%eax
  100ec5:	bb 60 29 10 00       	mov    $0x102960,%ebx
  100eca:	84 c0                	test   %al,%al
  100ecc:	74 16                	je     100ee4 <printk+0xd4>
  100ece:	66 90                	xchg   %ax,%ax
  100ed0:	83 ec 0c             	sub    $0xc,%esp
  100ed3:	50                   	push   %eax
  100ed4:	e8 6f f7 ff ff       	call   100648 <putChar>
  100ed9:	43                   	inc    %ebx
  100eda:	0f be 03             	movsbl (%ebx),%eax
  100edd:	83 c4 10             	add    $0x10,%esp
  100ee0:	84 c0                	test   %al,%al
  100ee2:	75 ec                	jne    100ed0 <printk+0xc0>
  100ee4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100ee7:	5b                   	pop    %ebx
  100ee8:	5e                   	pop    %esi
  100ee9:	5f                   	pop    %edi
  100eea:	5d                   	pop    %ebp
  100eeb:	c3                   	ret    
  100eec:	8d 70 04             	lea    0x4(%eax),%esi
  100eef:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  100ef2:	8b 08                	mov    (%eax),%ecx
  100ef4:	8d b7 60 29 10 00    	lea    0x102960(%edi),%esi
  100efa:	8a 11                	mov    (%ecx),%dl
  100efc:	31 c0                	xor    %eax,%eax
  100efe:	84 d2                	test   %dl,%dl
  100f00:	74 a6                	je     100ea8 <printk+0x98>
  100f02:	66 90                	xchg   %ax,%ax
  100f04:	40                   	inc    %eax
  100f05:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  100f09:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  100f0c:	84 d2                	test   %dl,%dl
  100f0e:	75 f4                	jne    100f04 <printk+0xf4>
  100f10:	01 c7                	add    %eax,%edi
  100f12:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100f15:	eb 96                	jmp    100ead <printk+0x9d>
  100f17:	90                   	nop
  100f18:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100f1f:	8d 70 04             	lea    0x4(%eax),%esi
  100f22:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  100f25:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  100f28:	56                   	push   %esi
  100f29:	ff 30                	pushl  (%eax)
  100f2b:	e8 d0 fd ff ff       	call   100d00 <i2A>
  100f30:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  100f33:	8d b7 60 29 10 00    	lea    0x102960(%edi),%esi
  100f39:	8a 11                	mov    (%ecx),%dl
  100f3b:	83 c4 08             	add    $0x8,%esp
  100f3e:	31 c0                	xor    %eax,%eax
  100f40:	84 d2                	test   %dl,%dl
  100f42:	0f 84 60 ff ff ff    	je     100ea8 <printk+0x98>
  100f48:	40                   	inc    %eax
  100f49:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  100f4d:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  100f50:	84 d2                	test   %dl,%dl
  100f52:	75 f4                	jne    100f48 <printk+0x138>
  100f54:	01 c7                	add    %eax,%edi
  100f56:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100f59:	e9 4f ff ff ff       	jmp    100ead <printk+0x9d>
  100f5e:	66 90                	xchg   %ax,%ax
  100f60:	80 fa 63             	cmp    $0x63,%dl
  100f63:	0f 85 cb fe ff ff    	jne    100e34 <printk+0x24>
  100f69:	8b 10                	mov    (%eax),%edx
  100f6b:	88 97 60 29 10 00    	mov    %dl,0x102960(%edi)
  100f71:	83 c0 04             	add    $0x4,%eax
  100f74:	47                   	inc    %edi
  100f75:	e9 c1 fe ff ff       	jmp    100e3b <printk+0x2b>
  100f7a:	31 ff                	xor    %edi,%edi
  100f7c:	e9 36 ff ff ff       	jmp    100eb7 <printk+0xa7>
  100f81:	66 90                	xchg   %ax,%ax
  100f83:	90                   	nop

00100f84 <abort>:
  100f84:	55                   	push   %ebp
  100f85:	89 e5                	mov    %esp,%ebp
  100f87:	57                   	push   %edi
  100f88:	56                   	push   %esi
  100f89:	53                   	push   %ebx
  100f8a:	83 ec 1c             	sub    $0x1c,%esp
  100f8d:	8b 55 08             	mov    0x8(%ebp),%edx
  100f90:	fa                   	cli    
  100f91:	8a 02                	mov    (%edx),%al
  100f93:	b9 12 28 10 00       	mov    $0x102812,%ecx
  100f98:	84 c0                	test   %al,%al
  100f9a:	74 0b                	je     100fa7 <abort+0x23>
  100f9c:	41                   	inc    %ecx
  100f9d:	42                   	inc    %edx
  100f9e:	88 41 ff             	mov    %al,-0x1(%ecx)
  100fa1:	8a 02                	mov    (%edx),%al
  100fa3:	84 c0                	test   %al,%al
  100fa5:	75 f5                	jne    100f9c <abort+0x18>
  100fa7:	c6 01 3a             	movb   $0x3a,(%ecx)
  100faa:	bb 7d 31 10 00       	mov    $0x10317d,%ebx
  100faf:	be 0a 00 00 00       	mov    $0xa,%esi
  100fb4:	bf 67 66 66 66       	mov    $0x66666667,%edi
  100fb9:	4b                   	dec    %ebx
  100fba:	8b 45 0c             	mov    0xc(%ebp),%eax
  100fbd:	99                   	cltd   
  100fbe:	f7 fe                	idiv   %esi
  100fc0:	8d 42 30             	lea    0x30(%edx),%eax
  100fc3:	88 45 e7             	mov    %al,-0x19(%ebp)
  100fc6:	88 03                	mov    %al,(%ebx)
  100fc8:	89 f8                	mov    %edi,%eax
  100fca:	f7 6d 0c             	imull  0xc(%ebp)
  100fcd:	c1 fa 02             	sar    $0x2,%edx
  100fd0:	8b 45 0c             	mov    0xc(%ebp),%eax
  100fd3:	c1 f8 1f             	sar    $0x1f,%eax
  100fd6:	29 c2                	sub    %eax,%edx
  100fd8:	89 55 0c             	mov    %edx,0xc(%ebp)
  100fdb:	75 dc                	jne    100fb9 <abort+0x35>
  100fdd:	41                   	inc    %ecx
  100fde:	41                   	inc    %ecx
  100fdf:	43                   	inc    %ebx
  100fe0:	8a 45 e7             	mov    -0x19(%ebp),%al
  100fe3:	88 41 ff             	mov    %al,-0x1(%ecx)
  100fe6:	8a 03                	mov    (%ebx),%al
  100fe8:	88 45 e7             	mov    %al,-0x19(%ebp)
  100feb:	84 c0                	test   %al,%al
  100fed:	75 ef                	jne    100fde <abort+0x5a>
  100fef:	c6 01 0a             	movb   $0xa,(%ecx)
  100ff2:	0f be 05 00 28 10 00 	movsbl 0x102800,%eax
  100ff9:	84 c0                	test   %al,%al
  100ffb:	74 1b                	je     101018 <abort+0x94>
  100ffd:	bb 00 28 10 00       	mov    $0x102800,%ebx
  101002:	83 ec 0c             	sub    $0xc,%esp
  101005:	50                   	push   %eax
  101006:	e8 3d f6 ff ff       	call   100648 <putChar>
  10100b:	43                   	inc    %ebx
  10100c:	0f be 03             	movsbl (%ebx),%eax
  10100f:	83 c4 10             	add    $0x10,%esp
  101012:	84 c0                	test   %al,%al
  101014:	75 ec                	jne    101002 <abort+0x7e>
  101016:	66 90                	xchg   %ax,%ax
  101018:	f4                   	hlt    
  101019:	eb fd                	jmp    101018 <abort+0x94>

0010101b <irqEmpty>:
  10101b:	6a 00                	push   $0x0
  10101d:	6a ff                	push   $0xffffffff
  10101f:	eb 13                	jmp    101034 <asmDoIrq>

00101021 <irqGProtectFault>:
  101021:	6a 0d                	push   $0xd
  101023:	eb 0f                	jmp    101034 <asmDoIrq>

00101025 <irqSyscall>:
  101025:	6a 00                	push   $0x0
  101027:	68 80 00 00 00       	push   $0x80
  10102c:	eb 06                	jmp    101034 <asmDoIrq>

0010102e <irqTime>:
  10102e:	6a 00                	push   $0x0
  101030:	6a 20                	push   $0x20
  101032:	eb 00                	jmp    101034 <asmDoIrq>

00101034 <asmDoIrq>:
  101034:	60                   	pusha  
  101035:	54                   	push   %esp
  101036:	e8 ed fb ff ff       	call   100c28 <irqHandle>
  10103b:	83 c4 04             	add    $0x4,%esp
  10103e:	61                   	popa   
  10103f:	83 c4 04             	add    $0x4,%esp
  101042:	83 c4 04             	add    $0x4,%esp
  101045:	cf                   	iret   
