
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 65 10 00 00       	call   101070 <initTimer>
  10000b:	e8 44 0d 00 00       	call   100d54 <init_pcb>
  100010:	e8 7b 0d 00 00       	call   100d90 <init_kernel_pcb>
  100015:	e8 e2 05 00 00       	call   1005fc <initSerial>
  10001a:	e8 b9 0d 00 00       	call   100dd8 <initIdt>
  10001f:	e8 f4 0f 00 00       	call   101018 <initIntr>
  100024:	e8 d7 00 00 00       	call   100100 <initSeg>
  100029:	fb                   	sti    
  10002a:	e8 dd 02 00 00       	call   10030c <loadUMain>
  10002f:	eb fe                	jmp    10002f <kEntry+0x2f>
  100031:	66 90                	xchg   %ax,%ax
  100033:	90                   	nop

00100034 <change_tss>:
  100034:	55                   	push   %ebp
  100035:	89 e5                	mov    %esp,%ebp
  100037:	8b 45 08             	mov    0x8(%ebp),%eax
  10003a:	a3 08 ca 12 01       	mov    %eax,0x112ca08
  10003f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100042:	a3 04 ca 12 01       	mov    %eax,0x112ca04
  100047:	b8 01 00 00 00       	mov    $0x1,%eax
  10004c:	5d                   	pop    %ebp
  10004d:	c3                   	ret    
  10004e:	66 90                	xchg   %ax,%ax

00100050 <waitDisk>:
  100050:	55                   	push   %ebp
  100051:	89 e5                	mov    %esp,%ebp
  100053:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100058:	ec                   	in     (%dx),%al
  100059:	83 e0 c0             	and    $0xffffffc0,%eax
  10005c:	3c 40                	cmp    $0x40,%al
  10005e:	75 f8                	jne    100058 <waitDisk+0x8>
  100060:	5d                   	pop    %ebp
  100061:	c3                   	ret    
  100062:	66 90                	xchg   %ax,%ax

00100064 <readSect>:
  100064:	55                   	push   %ebp
  100065:	89 e5                	mov    %esp,%ebp
  100067:	53                   	push   %ebx
  100068:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10006b:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100070:	ec                   	in     (%dx),%al
  100071:	83 e0 c0             	and    $0xffffffc0,%eax
  100074:	3c 40                	cmp    $0x40,%al
  100076:	75 f8                	jne    100070 <readSect+0xc>
  100078:	ba f2 01 00 00       	mov    $0x1f2,%edx
  10007d:	b0 01                	mov    $0x1,%al
  10007f:	ee                   	out    %al,(%dx)
  100080:	ba f3 01 00 00       	mov    $0x1f3,%edx
  100085:	88 c8                	mov    %cl,%al
  100087:	ee                   	out    %al,(%dx)
  100088:	89 c8                	mov    %ecx,%eax
  10008a:	c1 f8 08             	sar    $0x8,%eax
  10008d:	ba f4 01 00 00       	mov    $0x1f4,%edx
  100092:	ee                   	out    %al,(%dx)
  100093:	89 c8                	mov    %ecx,%eax
  100095:	c1 f8 10             	sar    $0x10,%eax
  100098:	ba f5 01 00 00       	mov    $0x1f5,%edx
  10009d:	ee                   	out    %al,(%dx)
  10009e:	89 c8                	mov    %ecx,%eax
  1000a0:	c1 f8 18             	sar    $0x18,%eax
  1000a3:	83 c8 e0             	or     $0xffffffe0,%eax
  1000a6:	ba f6 01 00 00       	mov    $0x1f6,%edx
  1000ab:	ee                   	out    %al,(%dx)
  1000ac:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1000b1:	b0 20                	mov    $0x20,%al
  1000b3:	ee                   	out    %al,(%dx)
  1000b4:	ec                   	in     (%dx),%al
  1000b5:	83 e0 c0             	and    $0xffffffc0,%eax
  1000b8:	3c 40                	cmp    $0x40,%al
  1000ba:	75 f8                	jne    1000b4 <readSect+0x50>
  1000bc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1000bf:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  1000c5:	ba f0 01 00 00       	mov    $0x1f0,%edx
  1000ca:	66 90                	xchg   %ax,%ax
  1000cc:	ed                   	in     (%dx),%eax
  1000cd:	89 01                	mov    %eax,(%ecx)
  1000cf:	83 c1 04             	add    $0x4,%ecx
  1000d2:	39 d9                	cmp    %ebx,%ecx
  1000d4:	75 f6                	jne    1000cc <readSect+0x68>
  1000d6:	5b                   	pop    %ebx
  1000d7:	5d                   	pop    %ebp
  1000d8:	c3                   	ret    
  1000d9:	8d 76 00             	lea    0x0(%esi),%esi

001000dc <change_gdt>:
  1000dc:	55                   	push   %ebp
  1000dd:	89 e5                	mov    %esp,%ebp
  1000df:	8b 45 0c             	mov    0xc(%ebp),%eax
  1000e2:	8b 55 10             	mov    0x10(%ebp),%edx
  1000e5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1000e8:	89 04 cd c0 c9 12 01 	mov    %eax,0x112c9c0(,%ecx,8)
  1000ef:	89 14 cd c4 c9 12 01 	mov    %edx,0x112c9c4(,%ecx,8)
  1000f6:	b8 01 00 00 00       	mov    $0x1,%eax
  1000fb:	5d                   	pop    %ebp
  1000fc:	c3                   	ret    
  1000fd:	8d 76 00             	lea    0x0(%esi),%esi

00100100 <initSeg>:
  100100:	55                   	push   %ebp
  100101:	89 e5                	mov    %esp,%ebp
  100103:	b9 c0 c9 12 01       	mov    $0x112c9c0,%ecx
  100108:	66 c7 05 c8 c9 12 01 	movw   $0xffff,0x112c9c8
  10010f:	ff ff 
  100111:	66 c7 05 ca c9 12 01 	movw   $0x0,0x112c9ca
  100118:	00 00 
  10011a:	c6 05 cc c9 12 01 00 	movb   $0x0,0x112c9cc
  100121:	c6 05 cd c9 12 01 9a 	movb   $0x9a,0x112c9cd
  100128:	c6 05 ce c9 12 01 cf 	movb   $0xcf,0x112c9ce
  10012f:	c6 05 cf c9 12 01 00 	movb   $0x0,0x112c9cf
  100136:	66 c7 05 d0 c9 12 01 	movw   $0xffff,0x112c9d0
  10013d:	ff ff 
  10013f:	66 c7 05 d2 c9 12 01 	movw   $0x0,0x112c9d2
  100146:	00 00 
  100148:	c6 05 d4 c9 12 01 00 	movb   $0x0,0x112c9d4
  10014f:	c6 05 d5 c9 12 01 92 	movb   $0x92,0x112c9d5
  100156:	c6 05 d6 c9 12 01 cf 	movb   $0xcf,0x112c9d6
  10015d:	c6 05 d7 c9 12 01 00 	movb   $0x0,0x112c9d7
  100164:	66 c7 05 d8 c9 12 01 	movw   $0xffff,0x112c9d8
  10016b:	ff ff 
  10016d:	66 c7 05 da c9 12 01 	movw   $0x0,0x112c9da
  100174:	00 00 
  100176:	c6 05 dc c9 12 01 00 	movb   $0x0,0x112c9dc
  10017d:	c6 05 dd c9 12 01 fa 	movb   $0xfa,0x112c9dd
  100184:	c6 05 de c9 12 01 cf 	movb   $0xcf,0x112c9de
  10018b:	c6 05 df c9 12 01 00 	movb   $0x0,0x112c9df
  100192:	66 c7 05 e0 c9 12 01 	movw   $0xffff,0x112c9e0
  100199:	ff ff 
  10019b:	66 c7 05 e2 c9 12 01 	movw   $0x0,0x112c9e2
  1001a2:	00 00 
  1001a4:	c6 05 e4 c9 12 01 00 	movb   $0x0,0x112c9e4
  1001ab:	c6 05 e5 c9 12 01 f2 	movb   $0xf2,0x112c9e5
  1001b2:	c6 05 e6 c9 12 01 cf 	movb   $0xcf,0x112c9e6
  1001b9:	c6 05 e7 c9 12 01 00 	movb   $0x0,0x112c9e7
  1001c0:	66 c7 05 e8 c9 12 01 	movw   $0x63,0x112c9e8
  1001c7:	63 00 
  1001c9:	b8 00 ca 12 01       	mov    $0x112ca00,%eax
  1001ce:	66 a3 ea c9 12 01    	mov    %ax,0x112c9ea
  1001d4:	89 c2                	mov    %eax,%edx
  1001d6:	c1 ea 10             	shr    $0x10,%edx
  1001d9:	88 15 ec c9 12 01    	mov    %dl,0x112c9ec
  1001df:	c6 05 ed c9 12 01 89 	movb   $0x89,0x112c9ed
  1001e6:	c6 05 ee c9 12 01 40 	movb   $0x40,0x112c9ee
  1001ed:	c1 e8 18             	shr    $0x18,%eax
  1001f0:	a2 ef c9 12 01       	mov    %al,0x112c9ef
  1001f5:	a1 d0 13 10 00       	mov    0x1013d0,%eax
  1001fa:	8b 15 d4 13 10 00    	mov    0x1013d4,%edx
  100200:	a3 f0 c9 12 01       	mov    %eax,0x112c9f0
  100205:	89 15 f4 c9 12 01    	mov    %edx,0x112c9f4
  10020b:	66 c7 05 20 21 10 00 	movw   $0x37,0x102120
  100212:	37 00 
  100214:	66 89 0d 22 21 10 00 	mov    %cx,0x102122
  10021b:	c1 e9 10             	shr    $0x10,%ecx
  10021e:	66 89 0d 24 21 10 00 	mov    %cx,0x102124
  100225:	b8 20 21 10 00       	mov    $0x102120,%eax
  10022a:	0f 01 10             	lgdtl  (%eax)
  10022d:	a1 f8 49 10 00       	mov    0x1049f8,%eax
  100232:	a3 08 ca 12 01       	mov    %eax,0x112ca08
  100237:	c7 05 04 ca 12 01 bf 	movl   $0x1031bf,0x112ca04
  10023e:	31 10 00 
  100241:	b8 28 00 00 00       	mov    $0x28,%eax
  100246:	0f 00 d8             	ltr    %ax
  100249:	b8 10 00 00 00       	mov    $0x10,%eax
  10024e:	89 c0                	mov    %eax,%eax
  100250:	8e d8                	mov    %eax,%ds
  100252:	8e e0                	mov    %eax,%fs
  100254:	8e c0                	mov    %eax,%es
  100256:	8e d0                	mov    %eax,%ss
  100258:	b8 30 00 00 00       	mov    $0x30,%eax
  10025d:	89 c0                	mov    %eax,%eax
  10025f:	8e e8                	mov    %eax,%gs
  100261:	31 c0                	xor    %eax,%eax
  100263:	0f 00 d0             	lldt   %ax
  100266:	5d                   	pop    %ebp
  100267:	c3                   	ret    

00100268 <enterUserSpace_pcb>:
  100268:	55                   	push   %ebp
  100269:	89 e5                	mov    %esp,%ebp
  10026b:	8b 45 08             	mov    0x8(%ebp),%eax
  10026e:	89 c2                	mov    %eax,%edx
  100270:	c1 e2 07             	shl    $0x7,%edx
  100273:	01 c2                	add    %eax,%edx
  100275:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100278:	8d 04 90             	lea    (%eax,%edx,4),%eax
  10027b:	8d 04 85 c0 29 10 00 	lea    0x1029c0(,%eax,4),%eax
  100282:	8b 90 38 20 00 00    	mov    0x2038(%eax),%edx
  100288:	52                   	push   %edx
  100289:	8b 90 34 20 00 00    	mov    0x2034(%eax),%edx
  10028f:	52                   	push   %edx
  100290:	8b 90 2c 20 00 00    	mov    0x202c(%eax),%edx
  100296:	52                   	push   %edx
  100297:	8b 80 28 20 00 00    	mov    0x2028(%eax),%eax
  10029d:	50                   	push   %eax
  10029e:	9c                   	pushf  
  10029f:	cf                   	iret   
  1002a0:	5d                   	pop    %ebp
  1002a1:	c3                   	ret    
  1002a2:	66 90                	xchg   %ax,%ax

001002a4 <enterUserSpace>:
  1002a4:	55                   	push   %ebp
  1002a5:	89 e5                	mov    %esp,%ebp
  1002a7:	83 ec 14             	sub    $0x14,%esp
  1002aa:	c7 05 a4 29 10 00 01 	movl   $0x1,0x1029a4
  1002b1:	00 00 00 
  1002b4:	c7 05 4c 6a 10 00 23 	movl   $0x23,0x106a4c
  1002bb:	00 00 00 
  1002be:	c7 05 48 6a 10 00 00 	movl   $0x8000000,0x106a48
  1002c5:	00 00 08 
  1002c8:	c7 05 40 6a 10 00 1b 	movl   $0x1b,0x106a40
  1002cf:	00 00 00 
  1002d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1002d5:	a3 3c 6a 10 00       	mov    %eax,0x106a3c
  1002da:	c7 05 54 6a 10 00 0a 	movl   $0xa,0x106a54
  1002e1:	00 00 00 
  1002e4:	6a 01                	push   $0x1
  1002e6:	e8 0d 05 00 00       	call   1007f8 <put_into_runnable>
  1002eb:	a1 f8 49 10 00       	mov    0x1049f8,%eax
  1002f0:	50                   	push   %eax
  1002f1:	a1 f4 49 10 00       	mov    0x1049f4,%eax
  1002f6:	50                   	push   %eax
  1002f7:	a1 ec 49 10 00       	mov    0x1049ec,%eax
  1002fc:	50                   	push   %eax
  1002fd:	a1 e8 49 10 00       	mov    0x1049e8,%eax
  100302:	50                   	push   %eax
  100303:	9c                   	pushf  
  100304:	cf                   	iret   
  100305:	83 c4 10             	add    $0x10,%esp
  100308:	c9                   	leave  
  100309:	c3                   	ret    
  10030a:	66 90                	xchg   %ax,%ax

0010030c <loadUMain>:
  10030c:	55                   	push   %ebp
  10030d:	89 e5                	mov    %esp,%ebp
  10030f:	57                   	push   %edi
  100310:	56                   	push   %esi
  100311:	53                   	push   %ebx
  100312:	83 ec 0c             	sub    $0xc,%esp
  100315:	bb c9 00 00 00       	mov    $0xc9,%ebx
  10031a:	be 00 00 00 03       	mov    $0x3000000,%esi
  10031f:	90                   	nop
  100320:	53                   	push   %ebx
  100321:	56                   	push   %esi
  100322:	e8 3d fd ff ff       	call   100064 <readSect>
  100327:	81 c6 00 02 00 00    	add    $0x200,%esi
  10032d:	43                   	inc    %ebx
  10032e:	58                   	pop    %eax
  10032f:	5a                   	pop    %edx
  100330:	81 fb 91 01 00 00    	cmp    $0x191,%ebx
  100336:	75 e8                	jne    100320 <loadUMain+0x14>
  100338:	a1 1c 00 00 03       	mov    0x300001c,%eax
  10033d:	8d 90 00 00 00 03    	lea    0x3000000(%eax),%edx
  100343:	0f b7 35 2c 00 00 03 	movzwl 0x300002c,%esi
  10034a:	c1 e6 05             	shl    $0x5,%esi
  10034d:	01 d6                	add    %edx,%esi
  10034f:	39 f2                	cmp    %esi,%edx
  100351:	72 0c                	jb     10035f <loadUMain+0x53>
  100353:	eb 53                	jmp    1003a8 <loadUMain+0x9c>
  100355:	8d 76 00             	lea    0x0(%esi),%esi
  100358:	83 c2 20             	add    $0x20,%edx
  10035b:	39 d6                	cmp    %edx,%esi
  10035d:	76 49                	jbe    1003a8 <loadUMain+0x9c>
  10035f:	83 3a 01             	cmpl   $0x1,(%edx)
  100362:	75 f4                	jne    100358 <loadUMain+0x4c>
  100364:	8b 42 08             	mov    0x8(%edx),%eax
  100367:	8b 7a 10             	mov    0x10(%edx),%edi
  10036a:	8b 5a 04             	mov    0x4(%edx),%ebx
  10036d:	29 c3                	sub    %eax,%ebx
  10036f:	31 c9                	xor    %ecx,%ecx
  100371:	85 ff                	test   %edi,%edi
  100373:	74 16                	je     10038b <loadUMain+0x7f>
  100375:	8d 76 00             	lea    0x0(%esi),%esi
  100378:	8a 8c 03 00 00 00 03 	mov    0x3000000(%ebx,%eax,1),%cl
  10037f:	88 08                	mov    %cl,(%eax)
  100381:	40                   	inc    %eax
  100382:	89 c1                	mov    %eax,%ecx
  100384:	2b 4a 08             	sub    0x8(%edx),%ecx
  100387:	39 cf                	cmp    %ecx,%edi
  100389:	77 ed                	ja     100378 <loadUMain+0x6c>
  10038b:	8b 5a 14             	mov    0x14(%edx),%ebx
  10038e:	39 cb                	cmp    %ecx,%ebx
  100390:	76 c6                	jbe    100358 <loadUMain+0x4c>
  100392:	66 90                	xchg   %ax,%ax
  100394:	c6 00 00             	movb   $0x0,(%eax)
  100397:	40                   	inc    %eax
  100398:	89 c1                	mov    %eax,%ecx
  10039a:	2b 4a 08             	sub    0x8(%edx),%ecx
  10039d:	39 cb                	cmp    %ecx,%ebx
  10039f:	77 f3                	ja     100394 <loadUMain+0x88>
  1003a1:	83 c2 20             	add    $0x20,%edx
  1003a4:	39 d6                	cmp    %edx,%esi
  1003a6:	77 b7                	ja     10035f <loadUMain+0x53>
  1003a8:	83 ec 0c             	sub    $0xc,%esp
  1003ab:	ff 35 18 00 00 03    	pushl  0x3000018
  1003b1:	e8 ee fe ff ff       	call   1002a4 <enterUserSpace>
  1003b6:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1003b9:	5b                   	pop    %ebx
  1003ba:	5e                   	pop    %esi
  1003bb:	5f                   	pop    %edi
  1003bc:	5d                   	pop    %ebp
  1003bd:	c3                   	ret    
  1003be:	66 90                	xchg   %ax,%ax

001003c0 <sys_exit>:
  1003c0:	55                   	push   %ebp
  1003c1:	89 e5                	mov    %esp,%ebp
  1003c3:	83 ec 08             	sub    $0x8,%esp
  1003c6:	e8 51 03 00 00       	call   10071c <get_from_runnable>
  1003cb:	83 ec 08             	sub    $0x8,%esp
  1003ce:	ff 75 08             	pushl  0x8(%ebp)
  1003d1:	50                   	push   %eax
  1003d2:	e8 01 04 00 00       	call   1007d8 <put_into_running>
  1003d7:	b8 01 00 00 00       	mov    $0x1,%eax
  1003dc:	c9                   	leave  
  1003dd:	c3                   	ret    
  1003de:	66 90                	xchg   %ax,%ax

001003e0 <sys_sleep>:
  1003e0:	55                   	push   %ebp
  1003e1:	89 e5                	mov    %esp,%ebp
  1003e3:	56                   	push   %esi
  1003e4:	53                   	push   %ebx
  1003e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1003e8:	e8 ff 02 00 00       	call   1006ec <getpid>
  1003ed:	83 ec 08             	sub    $0x8,%esp
  1003f0:	53                   	push   %ebx
  1003f1:	50                   	push   %eax
  1003f2:	e8 1d 05 00 00       	call   100914 <put_into_block>
  1003f7:	c7 04 24 d8 13 10 00 	movl   $0x1013d8,(%esp)
  1003fe:	e8 95 0d 00 00       	call   101198 <printk>
  100403:	e8 e4 02 00 00       	call   1006ec <getpid>
  100408:	89 c2                	mov    %eax,%edx
  10040a:	c1 e2 07             	shl    $0x7,%edx
  10040d:	01 c2                	add    %eax,%edx
  10040f:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100412:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100415:	8b 34 85 04 4a 10 00 	mov    0x104a04(,%eax,4),%esi
  10041c:	e8 cb 02 00 00       	call   1006ec <getpid>
  100421:	5a                   	pop    %edx
  100422:	59                   	pop    %ecx
  100423:	56                   	push   %esi
  100424:	50                   	push   %eax
  100425:	68 24 14 10 00       	push   $0x101424
  10042a:	6a 09                	push   $0x9
  10042c:	68 de 13 10 00       	push   $0x1013de
  100431:	68 00 14 10 00       	push   $0x101400
  100436:	e8 5d 0d 00 00       	call   101198 <printk>
  10043b:	83 c4 14             	add    $0x14,%esp
  10043e:	68 fa 13 10 00       	push   $0x1013fa
  100443:	e8 50 0d 00 00       	call   101198 <printk>
  100448:	e8 cf 02 00 00       	call   10071c <get_from_runnable>
  10044d:	5e                   	pop    %esi
  10044e:	5a                   	pop    %edx
  10044f:	53                   	push   %ebx
  100450:	50                   	push   %eax
  100451:	e8 82 03 00 00       	call   1007d8 <put_into_running>
  100456:	b8 01 00 00 00       	mov    $0x1,%eax
  10045b:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10045e:	5b                   	pop    %ebx
  10045f:	5e                   	pop    %esi
  100460:	5d                   	pop    %ebp
  100461:	c3                   	ret    
  100462:	66 90                	xchg   %ax,%ax

00100464 <sys_fork>:
  100464:	55                   	push   %ebp
  100465:	89 e5                	mov    %esp,%ebp
  100467:	57                   	push   %edi
  100468:	56                   	push   %esi
  100469:	8b 75 08             	mov    0x8(%ebp),%esi
  10046c:	83 ec 0c             	sub    $0xc,%esp
  10046f:	68 2e 14 10 00       	push   $0x10142e
  100474:	e8 1f 0d 00 00       	call   101198 <printk>
  100479:	b8 68 8a 10 00       	mov    $0x108a68,%eax
  10047e:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100483:	89 c7                	mov    %eax,%edi
  100485:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100487:	c7 05 84 8a 10 00 00 	movl   $0x0,0x108a84
  10048e:	00 00 00 
  100491:	c7 05 9c 8a 10 00 00 	movl   $0x7e00000,0x108a9c
  100498:	00 e0 07 
  10049b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1004a2:	e8 51 03 00 00       	call   1007f8 <put_into_runnable>
  1004a7:	b8 02 00 00 00       	mov    $0x2,%eax
  1004ac:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1004af:	5e                   	pop    %esi
  1004b0:	5f                   	pop    %edi
  1004b1:	5d                   	pop    %ebp
  1004b2:	c3                   	ret    
  1004b3:	90                   	nop

001004b4 <display>:
  1004b4:	55                   	push   %ebp
  1004b5:	89 e5                	mov    %esp,%ebp
  1004b7:	57                   	push   %edi
  1004b8:	53                   	push   %ebx
  1004b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1004bc:	80 fb 0a             	cmp    $0xa,%bl
  1004bf:	74 5b                	je     10051c <display+0x68>
  1004c1:	8b 15 28 21 10 00    	mov    0x102128,%edx
  1004c7:	8b 0d 2c 21 10 00    	mov    0x10212c,%ecx
  1004cd:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  1004d0:	c1 e0 04             	shl    $0x4,%eax
  1004d3:	01 d0                	add    %edx,%eax
  1004d5:	01 c0                	add    %eax,%eax
  1004d7:	89 c7                	mov    %eax,%edi
  1004d9:	0f be db             	movsbl %bl,%ebx
  1004dc:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
  1004e2:	66 89 d8             	mov    %bx,%ax
  1004e5:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1004e9:	42                   	inc    %edx
  1004ea:	83 fa 50             	cmp    $0x50,%edx
  1004ed:	75 1d                	jne    10050c <display+0x58>
  1004ef:	c7 05 28 21 10 00 00 	movl   $0x0,0x102128
  1004f6:	00 00 00 
  1004f9:	41                   	inc    %ecx
  1004fa:	89 0d 2c 21 10 00    	mov    %ecx,0x10212c
  100500:	b8 01 00 00 00       	mov    $0x1,%eax
  100505:	5b                   	pop    %ebx
  100506:	5f                   	pop    %edi
  100507:	5d                   	pop    %ebp
  100508:	c3                   	ret    
  100509:	8d 76 00             	lea    0x0(%esi),%esi
  10050c:	89 15 28 21 10 00    	mov    %edx,0x102128
  100512:	b8 01 00 00 00       	mov    $0x1,%eax
  100517:	5b                   	pop    %ebx
  100518:	5f                   	pop    %edi
  100519:	5d                   	pop    %ebp
  10051a:	c3                   	ret    
  10051b:	90                   	nop
  10051c:	c7 05 28 21 10 00 00 	movl   $0x0,0x102128
  100523:	00 00 00 
  100526:	ff 05 2c 21 10 00    	incl   0x10212c
  10052c:	b8 01 00 00 00       	mov    $0x1,%eax
  100531:	5b                   	pop    %ebx
  100532:	5f                   	pop    %edi
  100533:	5d                   	pop    %ebp
  100534:	c3                   	ret    
  100535:	8d 76 00             	lea    0x0(%esi),%esi

00100538 <printkernel>:
  100538:	55                   	push   %ebp
  100539:	89 e5                	mov    %esp,%ebp
  10053b:	53                   	push   %ebx
  10053c:	50                   	push   %eax
  10053d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100540:	0f be 03             	movsbl (%ebx),%eax
  100543:	84 c0                	test   %al,%al
  100545:	74 20                	je     100567 <printkernel+0x2f>
  100547:	90                   	nop
  100548:	83 ec 0c             	sub    $0xc,%esp
  10054b:	50                   	push   %eax
  10054c:	e8 eb 00 00 00       	call   10063c <putChar>
  100551:	0f be 03             	movsbl (%ebx),%eax
  100554:	89 04 24             	mov    %eax,(%esp)
  100557:	e8 58 ff ff ff       	call   1004b4 <display>
  10055c:	43                   	inc    %ebx
  10055d:	0f be 03             	movsbl (%ebx),%eax
  100560:	83 c4 10             	add    $0x10,%esp
  100563:	84 c0                	test   %al,%al
  100565:	75 e1                	jne    100548 <printkernel+0x10>
  100567:	b8 01 00 00 00       	mov    $0x1,%eax
  10056c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10056f:	c9                   	leave  
  100570:	c3                   	ret    
  100571:	8d 76 00             	lea    0x0(%esi),%esi

00100574 <fs_write>:
  100574:	55                   	push   %ebp
  100575:	89 e5                	mov    %esp,%ebp
  100577:	53                   	push   %ebx
  100578:	50                   	push   %eax
  100579:	8b 5d 10             	mov    0x10(%ebp),%ebx
  10057c:	ba 30 00 00 00       	mov    $0x30,%edx
  100581:	89 d0                	mov    %edx,%eax
  100583:	8e e8                	mov    %eax,%gs
  100585:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  100589:	74 12                	je     10059d <fs_write+0x29>
  10058b:	83 ec 08             	sub    $0x8,%esp
  10058e:	6a 27                	push   $0x27
  100590:	68 4a 14 10 00       	push   $0x10144a
  100595:	e8 72 0d 00 00       	call   10130c <abort>
  10059a:	83 c4 10             	add    $0x10,%esp
  10059d:	83 ec 08             	sub    $0x8,%esp
  1005a0:	53                   	push   %ebx
  1005a1:	ff 75 0c             	pushl  0xc(%ebp)
  1005a4:	e8 8f ff ff ff       	call   100538 <printkernel>
  1005a9:	89 d8                	mov    %ebx,%eax
  1005ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005ae:	c9                   	leave  
  1005af:	c3                   	ret    

001005b0 <sys_write>:
  1005b0:	55                   	push   %ebp
  1005b1:	89 e5                	mov    %esp,%ebp
  1005b3:	53                   	push   %ebx
  1005b4:	83 ec 08             	sub    $0x8,%esp
  1005b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1005ba:	ff 73 14             	pushl  0x14(%ebx)
  1005bd:	ff 73 18             	pushl  0x18(%ebx)
  1005c0:	ff 73 10             	pushl  0x10(%ebx)
  1005c3:	e8 ac ff ff ff       	call   100574 <fs_write>
  1005c8:	89 43 1c             	mov    %eax,0x1c(%ebx)
  1005cb:	83 c4 10             	add    $0x10,%esp
  1005ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005d1:	c9                   	leave  
  1005d2:	c3                   	ret    
  1005d3:	90                   	nop

001005d4 <print_char>:
  1005d4:	55                   	push   %ebp
  1005d5:	89 e5                	mov    %esp,%ebp
  1005d7:	57                   	push   %edi
  1005d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1005db:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1005de:	c1 e0 04             	shl    $0x4,%eax
  1005e1:	03 45 0c             	add    0xc(%ebp),%eax
  1005e4:	01 c0                	add    %eax,%eax
  1005e6:	89 c7                	mov    %eax,%edi
  1005e8:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  1005ec:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  1005f2:	66 89 d0             	mov    %dx,%ax
  1005f5:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1005f9:	5f                   	pop    %edi
  1005fa:	5d                   	pop    %ebp
  1005fb:	c3                   	ret    

001005fc <initSerial>:
  1005fc:	55                   	push   %ebp
  1005fd:	89 e5                	mov    %esp,%ebp
  1005ff:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100604:	31 c0                	xor    %eax,%eax
  100606:	ee                   	out    %al,(%dx)
  100607:	ba fb 03 00 00       	mov    $0x3fb,%edx
  10060c:	b0 80                	mov    $0x80,%al
  10060e:	ee                   	out    %al,(%dx)
  10060f:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100614:	b0 01                	mov    $0x1,%al
  100616:	ee                   	out    %al,(%dx)
  100617:	ba f9 03 00 00       	mov    $0x3f9,%edx
  10061c:	31 c0                	xor    %eax,%eax
  10061e:	ee                   	out    %al,(%dx)
  10061f:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100624:	b0 03                	mov    $0x3,%al
  100626:	ee                   	out    %al,(%dx)
  100627:	ba fa 03 00 00       	mov    $0x3fa,%edx
  10062c:	b0 c7                	mov    $0xc7,%al
  10062e:	ee                   	out    %al,(%dx)
  10062f:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100634:	b0 0b                	mov    $0xb,%al
  100636:	ee                   	out    %al,(%dx)
  100637:	5d                   	pop    %ebp
  100638:	c3                   	ret    
  100639:	8d 76 00             	lea    0x0(%esi),%esi

0010063c <putChar>:
  10063c:	55                   	push   %ebp
  10063d:	89 e5                	mov    %esp,%ebp
  10063f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100642:	ba fd 03 00 00       	mov    $0x3fd,%edx
  100647:	90                   	nop
  100648:	ec                   	in     (%dx),%al
  100649:	a8 20                	test   $0x20,%al
  10064b:	74 fb                	je     100648 <putChar+0xc>
  10064d:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100652:	88 c8                	mov    %cl,%al
  100654:	ee                   	out    %al,(%dx)
  100655:	5d                   	pop    %ebp
  100656:	c3                   	ret    
  100657:	90                   	nop

00100658 <IDLE>:
  100658:	55                   	push   %ebp
  100659:	89 e5                	mov    %esp,%ebp
  10065b:	90                   	nop
  10065c:	f4                   	hlt    
  10065d:	eb fd                	jmp    10065c <IDLE+0x4>
  10065f:	90                   	nop

00100660 <put_into_running.part.0>:
  100660:	55                   	push   %ebp
  100661:	89 e5                	mov    %esp,%ebp
  100663:	57                   	push   %edi
  100664:	56                   	push   %esi
  100665:	53                   	push   %ebx
  100666:	83 ec 28             	sub    $0x28,%esp
  100669:	89 c3                	mov    %eax,%ebx
  10066b:	a3 a0 29 10 00       	mov    %eax,0x1029a0
  100670:	c1 e0 07             	shl    $0x7,%eax
  100673:	01 d8                	add    %ebx,%eax
  100675:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100678:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10067b:	8d 34 85 c0 49 10 00 	lea    0x1049c0(,%eax,4),%esi
  100682:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100687:	89 d7                	mov    %edx,%edi
  100689:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  10068c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10068e:	68 d8 13 10 00       	push   $0x1013d8
  100693:	e8 00 0b 00 00       	call   101198 <printk>
  100698:	83 c4 0c             	add    $0xc,%esp
  10069b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10069e:	ff 72 28             	pushl  0x28(%edx)
  1006a1:	ff 72 34             	pushl  0x34(%edx)
  1006a4:	53                   	push   %ebx
  1006a5:	68 60 15 10 00       	push   $0x101560
  1006aa:	6a 7a                	push   $0x7a
  1006ac:	68 66 14 10 00       	push   $0x101466
  1006b1:	68 74 14 10 00       	push   $0x101474
  1006b6:	e8 dd 0a 00 00       	call   101198 <printk>
  1006bb:	83 c4 14             	add    $0x14,%esp
  1006be:	68 fa 13 10 00       	push   $0x1013fa
  1006c3:	e8 d0 0a 00 00       	call   101198 <printk>
  1006c8:	83 c4 10             	add    $0x10,%esp
  1006cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1006ce:	5b                   	pop    %ebx
  1006cf:	5e                   	pop    %esi
  1006d0:	5f                   	pop    %edi
  1006d1:	5d                   	pop    %ebp
  1006d2:	c3                   	ret    
  1006d3:	90                   	nop

001006d4 <update_block>:
  1006d4:	55                   	push   %ebp
  1006d5:	89 e5                	mov    %esp,%ebp
  1006d7:	b8 01 00 00 00       	mov    $0x1,%eax
  1006dc:	5d                   	pop    %ebp
  1006dd:	c3                   	ret    
  1006de:	66 90                	xchg   %ax,%ax

001006e0 <apply_new_pid>:
  1006e0:	55                   	push   %ebp
  1006e1:	89 e5                	mov    %esp,%ebp
  1006e3:	b8 02 00 00 00       	mov    $0x2,%eax
  1006e8:	5d                   	pop    %ebp
  1006e9:	c3                   	ret    
  1006ea:	66 90                	xchg   %ax,%ax

001006ec <getpid>:
  1006ec:	55                   	push   %ebp
  1006ed:	89 e5                	mov    %esp,%ebp
  1006ef:	a1 a0 29 10 00       	mov    0x1029a0,%eax
  1006f4:	5d                   	pop    %ebp
  1006f5:	c3                   	ret    
  1006f6:	66 90                	xchg   %ax,%ax

001006f8 <getrunnable>:
  1006f8:	55                   	push   %ebp
  1006f9:	89 e5                	mov    %esp,%ebp
  1006fb:	a1 04 20 10 00       	mov    0x102004,%eax
  100700:	5d                   	pop    %ebp
  100701:	c3                   	ret    
  100702:	66 90                	xchg   %ax,%ax

00100704 <getblocked>:
  100704:	55                   	push   %ebp
  100705:	89 e5                	mov    %esp,%ebp
  100707:	a1 00 20 10 00       	mov    0x102000,%eax
  10070c:	5d                   	pop    %ebp
  10070d:	c3                   	ret    
  10070e:	66 90                	xchg   %ax,%ax

00100710 <transfer_pid_mode>:
  100710:	55                   	push   %ebp
  100711:	89 e5                	mov    %esp,%ebp
  100713:	b8 01 00 00 00       	mov    $0x1,%eax
  100718:	5d                   	pop    %ebp
  100719:	c3                   	ret    
  10071a:	66 90                	xchg   %ax,%ax

0010071c <get_from_runnable>:
  10071c:	55                   	push   %ebp
  10071d:	89 e5                	mov    %esp,%ebp
  10071f:	53                   	push   %ebx
  100720:	51                   	push   %ecx
  100721:	8b 1d 04 20 10 00    	mov    0x102004,%ebx
  100727:	83 fb ff             	cmp    $0xffffffff,%ebx
  10072a:	0f 84 a0 00 00 00    	je     1007d0 <get_from_runnable+0xb4>
  100730:	89 d8                	mov    %ebx,%eax
  100732:	c1 e0 07             	shl    $0x7,%eax
  100735:	01 d8                	add    %ebx,%eax
  100737:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10073a:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10073d:	8d 14 85 c0 29 10 00 	lea    0x1029c0(,%eax,4),%edx
  100744:	8b 82 50 20 00 00    	mov    0x2050(%edx),%eax
  10074a:	39 d8                	cmp    %ebx,%eax
  10074c:	74 76                	je     1007c4 <get_from_runnable+0xa8>
  10074e:	8b 92 4c 20 00 00    	mov    0x204c(%edx),%edx
  100754:	89 d1                	mov    %edx,%ecx
  100756:	c1 e1 07             	shl    $0x7,%ecx
  100759:	01 d1                	add    %edx,%ecx
  10075b:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  10075e:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100761:	89 04 8d 10 4a 10 00 	mov    %eax,0x104a10(,%ecx,4)
  100768:	89 c1                	mov    %eax,%ecx
  10076a:	c1 e1 07             	shl    $0x7,%ecx
  10076d:	01 c1                	add    %eax,%ecx
  10076f:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  100772:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  100775:	89 14 8d 0c 4a 10 00 	mov    %edx,0x104a0c(,%ecx,4)
  10077c:	a3 04 20 10 00       	mov    %eax,0x102004
  100781:	83 ec 0c             	sub    $0xc,%esp
  100784:	68 d8 13 10 00       	push   $0x1013d8
  100789:	e8 0a 0a 00 00       	call   101198 <printk>
  10078e:	58                   	pop    %eax
  10078f:	5a                   	pop    %edx
  100790:	ff 35 04 20 10 00    	pushl  0x102004
  100796:	53                   	push   %ebx
  100797:	68 74 15 10 00       	push   $0x101574
  10079c:	6a 64                	push   $0x64
  10079e:	68 66 14 10 00       	push   $0x101466
  1007a3:	68 a8 14 10 00       	push   $0x1014a8
  1007a8:	e8 eb 09 00 00       	call   101198 <printk>
  1007ad:	83 c4 14             	add    $0x14,%esp
  1007b0:	68 fa 13 10 00       	push   $0x1013fa
  1007b5:	e8 de 09 00 00       	call   101198 <printk>
  1007ba:	83 c4 10             	add    $0x10,%esp
  1007bd:	89 d8                	mov    %ebx,%eax
  1007bf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1007c2:	c9                   	leave  
  1007c3:	c3                   	ret    
  1007c4:	c7 05 04 20 10 00 ff 	movl   $0xffffffff,0x102004
  1007cb:	ff ff ff 
  1007ce:	eb b1                	jmp    100781 <get_from_runnable+0x65>
  1007d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007d5:	eb e8                	jmp    1007bf <get_from_runnable+0xa3>
  1007d7:	90                   	nop

001007d8 <put_into_running>:
  1007d8:	55                   	push   %ebp
  1007d9:	89 e5                	mov    %esp,%ebp
  1007db:	83 ec 08             	sub    $0x8,%esp
  1007de:	8b 45 08             	mov    0x8(%ebp),%eax
  1007e1:	39 05 a0 29 10 00    	cmp    %eax,0x1029a0
  1007e7:	74 08                	je     1007f1 <put_into_running+0x19>
  1007e9:	8b 55 0c             	mov    0xc(%ebp),%edx
  1007ec:	e8 6f fe ff ff       	call   100660 <put_into_running.part.0>
  1007f1:	b8 01 00 00 00       	mov    $0x1,%eax
  1007f6:	c9                   	leave  
  1007f7:	c3                   	ret    

001007f8 <put_into_runnable>:
  1007f8:	55                   	push   %ebp
  1007f9:	89 e5                	mov    %esp,%ebp
  1007fb:	56                   	push   %esi
  1007fc:	53                   	push   %ebx
  1007fd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100800:	a1 04 20 10 00       	mov    0x102004,%eax
  100805:	83 f8 ff             	cmp    $0xffffffff,%eax
  100808:	0f 84 da 00 00 00    	je     1008e8 <put_into_runnable+0xf0>
  10080e:	89 c2                	mov    %eax,%edx
  100810:	c1 e2 07             	shl    $0x7,%edx
  100813:	01 c2                	add    %eax,%edx
  100815:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100818:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10081b:	8d 34 95 c0 29 10 00 	lea    0x1029c0(,%edx,4),%esi
  100822:	8b 96 4c 20 00 00    	mov    0x204c(%esi),%edx
  100828:	89 d1                	mov    %edx,%ecx
  10082a:	c1 e1 07             	shl    $0x7,%ecx
  10082d:	01 d1                	add    %edx,%ecx
  10082f:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100832:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100835:	89 1c 8d 10 4a 10 00 	mov    %ebx,0x104a10(,%ecx,4)
  10083c:	89 d9                	mov    %ebx,%ecx
  10083e:	c1 e1 07             	shl    $0x7,%ecx
  100841:	01 d9                	add    %ebx,%ecx
  100843:	8d 0c 8b             	lea    (%ebx,%ecx,4),%ecx
  100846:	8d 0c 8b             	lea    (%ebx,%ecx,4),%ecx
  100849:	8d 0c 8d c0 29 10 00 	lea    0x1029c0(,%ecx,4),%ecx
  100850:	89 91 4c 20 00 00    	mov    %edx,0x204c(%ecx)
  100856:	89 81 50 20 00 00    	mov    %eax,0x2050(%ecx)
  10085c:	89 9e 4c 20 00 00    	mov    %ebx,0x204c(%esi)
  100862:	89 d8                	mov    %ebx,%eax
  100864:	c1 e0 07             	shl    $0x7,%eax
  100867:	01 d8                	add    %ebx,%eax
  100869:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10086c:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10086f:	c7 04 85 fc 49 10 00 	movl   $0x1,0x1049fc(,%eax,4)
  100876:	01 00 00 00 
  10087a:	85 db                	test   %ebx,%ebx
  10087c:	75 0a                	jne    100888 <put_into_runnable+0x90>
  10087e:	c7 05 e8 49 10 00 58 	movl   $0x100658,0x1049e8
  100885:	06 10 00 
  100888:	83 ec 0c             	sub    $0xc,%esp
  10088b:	68 d8 13 10 00       	push   $0x1013d8
  100890:	e8 03 09 00 00       	call   101198 <printk>
  100895:	58                   	pop    %eax
  100896:	5a                   	pop    %edx
  100897:	53                   	push   %ebx
  100898:	ff 35 04 20 10 00    	pushl  0x102004
  10089e:	68 4c 15 10 00       	push   $0x10154c
  1008a3:	68 99 00 00 00       	push   $0x99
  1008a8:	68 66 14 10 00       	push   $0x101466
  1008ad:	68 dc 14 10 00       	push   $0x1014dc
  1008b2:	e8 e1 08 00 00       	call   101198 <printk>
  1008b7:	83 c4 14             	add    $0x14,%esp
  1008ba:	68 fa 13 10 00       	push   $0x1013fa
  1008bf:	e8 d4 08 00 00       	call   101198 <printk>
  1008c4:	89 d8                	mov    %ebx,%eax
  1008c6:	c1 e0 07             	shl    $0x7,%eax
  1008c9:	01 d8                	add    %ebx,%eax
  1008cb:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1008ce:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1008d1:	c7 04 85 00 4a 10 00 	movl   $0xa,0x104a00(,%eax,4)
  1008d8:	0a 00 00 00 
  1008dc:	b8 01 00 00 00       	mov    $0x1,%eax
  1008e1:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1008e4:	5b                   	pop    %ebx
  1008e5:	5e                   	pop    %esi
  1008e6:	5d                   	pop    %ebp
  1008e7:	c3                   	ret    
  1008e8:	89 1d 04 20 10 00    	mov    %ebx,0x102004
  1008ee:	89 d8                	mov    %ebx,%eax
  1008f0:	c1 e0 07             	shl    $0x7,%eax
  1008f3:	01 d8                	add    %ebx,%eax
  1008f5:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1008f8:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1008fb:	8d 04 85 c0 29 10 00 	lea    0x1029c0(,%eax,4),%eax
  100902:	89 98 4c 20 00 00    	mov    %ebx,0x204c(%eax)
  100908:	89 98 50 20 00 00    	mov    %ebx,0x2050(%eax)
  10090e:	e9 4f ff ff ff       	jmp    100862 <put_into_runnable+0x6a>
  100913:	90                   	nop

00100914 <put_into_block>:
  100914:	55                   	push   %ebp
  100915:	89 e5                	mov    %esp,%ebp
  100917:	57                   	push   %edi
  100918:	56                   	push   %esi
  100919:	53                   	push   %ebx
  10091a:	8b 45 08             	mov    0x8(%ebp),%eax
  10091d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100920:	8b 15 00 20 10 00    	mov    0x102000,%edx
  100926:	83 fa ff             	cmp    $0xffffffff,%edx
  100929:	0f 84 95 00 00 00    	je     1009c4 <put_into_block+0xb0>
  10092f:	89 d1                	mov    %edx,%ecx
  100931:	c1 e1 07             	shl    $0x7,%ecx
  100934:	01 d1                	add    %edx,%ecx
  100936:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100939:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  10093c:	8d 3c 8d c0 29 10 00 	lea    0x1029c0(,%ecx,4),%edi
  100943:	8b 8f 4c 20 00 00    	mov    0x204c(%edi),%ecx
  100949:	89 ce                	mov    %ecx,%esi
  10094b:	c1 e6 07             	shl    $0x7,%esi
  10094e:	01 ce                	add    %ecx,%esi
  100950:	8d 34 b1             	lea    (%ecx,%esi,4),%esi
  100953:	8d 34 b1             	lea    (%ecx,%esi,4),%esi
  100956:	89 04 b5 10 4a 10 00 	mov    %eax,0x104a10(,%esi,4)
  10095d:	89 c6                	mov    %eax,%esi
  10095f:	c1 e6 07             	shl    $0x7,%esi
  100962:	01 c6                	add    %eax,%esi
  100964:	8d 34 b0             	lea    (%eax,%esi,4),%esi
  100967:	8d 34 b0             	lea    (%eax,%esi,4),%esi
  10096a:	8d 34 b5 c0 29 10 00 	lea    0x1029c0(,%esi,4),%esi
  100971:	89 8e 4c 20 00 00    	mov    %ecx,0x204c(%esi)
  100977:	89 96 50 20 00 00    	mov    %edx,0x2050(%esi)
  10097d:	89 87 4c 20 00 00    	mov    %eax,0x204c(%edi)
  100983:	89 c2                	mov    %eax,%edx
  100985:	c1 e2 07             	shl    $0x7,%edx
  100988:	01 c2                	add    %eax,%edx
  10098a:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10098d:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100990:	c1 e2 02             	shl    $0x2,%edx
  100993:	8d 82 c0 49 10 00    	lea    0x1049c0(%edx),%eax
  100999:	b9 0f 00 00 00       	mov    $0xf,%ecx
  10099e:	89 c7                	mov    %eax,%edi
  1009a0:	89 de                	mov    %ebx,%esi
  1009a2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1009a4:	8b 43 10             	mov    0x10(%ebx),%eax
  1009a7:	89 82 04 4a 10 00    	mov    %eax,0x104a04(%edx)
  1009ad:	c7 82 fc 49 10 00 00 	movl   $0x0,0x1049fc(%edx)
  1009b4:	00 00 00 
  1009b7:	b8 01 00 00 00       	mov    $0x1,%eax
  1009bc:	5b                   	pop    %ebx
  1009bd:	5e                   	pop    %esi
  1009be:	5f                   	pop    %edi
  1009bf:	5d                   	pop    %ebp
  1009c0:	c3                   	ret    
  1009c1:	8d 76 00             	lea    0x0(%esi),%esi
  1009c4:	a3 00 20 10 00       	mov    %eax,0x102000
  1009c9:	89 c2                	mov    %eax,%edx
  1009cb:	c1 e2 07             	shl    $0x7,%edx
  1009ce:	01 c2                	add    %eax,%edx
  1009d0:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1009d3:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1009d6:	8d 14 95 c0 29 10 00 	lea    0x1029c0(,%edx,4),%edx
  1009dd:	89 82 50 20 00 00    	mov    %eax,0x2050(%edx)
  1009e3:	89 82 4c 20 00 00    	mov    %eax,0x204c(%edx)
  1009e9:	eb 98                	jmp    100983 <put_into_block+0x6f>
  1009eb:	90                   	nop

001009ec <get_from>:
  1009ec:	55                   	push   %ebp
  1009ed:	89 e5                	mov    %esp,%ebp
  1009ef:	56                   	push   %esi
  1009f0:	53                   	push   %ebx
  1009f1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1009f4:	8b 75 0c             	mov    0xc(%ebp),%esi
  1009f7:	85 db                	test   %ebx,%ebx
  1009f9:	0f 8e f5 00 00 00    	jle    100af4 <get_from+0x108>
  1009ff:	39 f3                	cmp    %esi,%ebx
  100a01:	74 3d                	je     100a40 <get_from+0x54>
  100a03:	89 d8                	mov    %ebx,%eax
  100a05:	c1 e0 07             	shl    $0x7,%eax
  100a08:	01 d8                	add    %ebx,%eax
  100a0a:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100a0d:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100a10:	8b 14 85 10 4a 10 00 	mov    0x104a10(,%eax,4),%edx
  100a17:	39 d3                	cmp    %edx,%ebx
  100a19:	75 21                	jne    100a3c <get_from+0x50>
  100a1b:	e9 d4 00 00 00       	jmp    100af4 <get_from+0x108>
  100a20:	89 d1                	mov    %edx,%ecx
  100a22:	c1 e1 07             	shl    $0x7,%ecx
  100a25:	01 d1                	add    %edx,%ecx
  100a27:	8d 04 8a             	lea    (%edx,%ecx,4),%eax
  100a2a:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100a2d:	8b 14 85 10 4a 10 00 	mov    0x104a10(,%eax,4),%edx
  100a34:	39 d3                	cmp    %edx,%ebx
  100a36:	0f 84 b8 00 00 00    	je     100af4 <get_from+0x108>
  100a3c:	39 f2                	cmp    %esi,%edx
  100a3e:	75 e0                	jne    100a20 <get_from+0x34>
  100a40:	89 f0                	mov    %esi,%eax
  100a42:	c1 e0 07             	shl    $0x7,%eax
  100a45:	01 f0                	add    %esi,%eax
  100a47:	8d 04 86             	lea    (%esi,%eax,4),%eax
  100a4a:	8d 04 86             	lea    (%esi,%eax,4),%eax
  100a4d:	8b 04 85 fc 49 10 00 	mov    0x1049fc(,%eax,4),%eax
  100a54:	85 c0                	test   %eax,%eax
  100a56:	0f 84 bc 00 00 00    	je     100b18 <get_from+0x12c>
  100a5c:	48                   	dec    %eax
  100a5d:	75 79                	jne    100ad8 <get_from+0xec>
  100a5f:	be 04 20 10 00       	mov    $0x102004,%esi
  100a64:	3b 1e                	cmp    (%esi),%ebx
  100a66:	74 15                	je     100a7d <get_from+0x91>
  100a68:	83 ec 08             	sub    $0x8,%esp
  100a6b:	68 da 00 00 00       	push   $0xda
  100a70:	68 66 14 10 00       	push   $0x101466
  100a75:	e8 92 08 00 00       	call   10130c <abort>
  100a7a:	83 c4 10             	add    $0x10,%esp
  100a7d:	89 d8                	mov    %ebx,%eax
  100a7f:	c1 e0 07             	shl    $0x7,%eax
  100a82:	01 d8                	add    %ebx,%eax
  100a84:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100a87:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100a8a:	8d 14 85 c0 29 10 00 	lea    0x1029c0(,%eax,4),%edx
  100a91:	8b 82 50 20 00 00    	mov    0x2050(%edx),%eax
  100a97:	39 d8                	cmp    %ebx,%eax
  100a99:	0f 84 85 00 00 00    	je     100b24 <get_from+0x138>
  100a9f:	8b 92 4c 20 00 00    	mov    0x204c(%edx),%edx
  100aa5:	89 d1                	mov    %edx,%ecx
  100aa7:	c1 e1 07             	shl    $0x7,%ecx
  100aaa:	01 d1                	add    %edx,%ecx
  100aac:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100aaf:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100ab2:	89 04 8d 10 4a 10 00 	mov    %eax,0x104a10(,%ecx,4)
  100ab9:	89 c1                	mov    %eax,%ecx
  100abb:	c1 e1 07             	shl    $0x7,%ecx
  100abe:	01 c1                	add    %eax,%ecx
  100ac0:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  100ac3:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  100ac6:	89 14 8d 0c 4a 10 00 	mov    %edx,0x104a0c(,%ecx,4)
  100acd:	89 06                	mov    %eax,(%esi)
  100acf:	89 d8                	mov    %ebx,%eax
  100ad1:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100ad4:	5b                   	pop    %ebx
  100ad5:	5e                   	pop    %esi
  100ad6:	5d                   	pop    %ebp
  100ad7:	c3                   	ret    
  100ad8:	83 ec 08             	sub    $0x8,%esp
  100adb:	68 d6 00 00 00       	push   $0xd6
  100ae0:	68 66 14 10 00       	push   $0x101466
  100ae5:	e8 22 08 00 00       	call   10130c <abort>
  100aea:	a1 00 00 00 00       	mov    0x0,%eax
  100aef:	0f 0b                	ud2    
  100af1:	8d 76 00             	lea    0x0(%esi),%esi
  100af4:	83 ec 08             	sub    $0x8,%esp
  100af7:	68 c7 00 00 00       	push   $0xc7
  100afc:	68 66 14 10 00       	push   $0x101466
  100b01:	e8 06 08 00 00       	call   10130c <abort>
  100b06:	83 c4 10             	add    $0x10,%esp
  100b09:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100b0e:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100b11:	5b                   	pop    %ebx
  100b12:	5e                   	pop    %esi
  100b13:	5d                   	pop    %ebp
  100b14:	c3                   	ret    
  100b15:	8d 76 00             	lea    0x0(%esi),%esi
  100b18:	be 00 20 10 00       	mov    $0x102000,%esi
  100b1d:	e9 42 ff ff ff       	jmp    100a64 <get_from+0x78>
  100b22:	66 90                	xchg   %ax,%ax
  100b24:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100b2a:	89 d8                	mov    %ebx,%eax
  100b2c:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100b2f:	5b                   	pop    %ebx
  100b30:	5e                   	pop    %esi
  100b31:	5d                   	pop    %ebp
  100b32:	c3                   	ret    
  100b33:	90                   	nop

00100b34 <get_from_block>:
  100b34:	55                   	push   %ebp
  100b35:	89 e5                	mov    %esp,%ebp
  100b37:	83 ec 10             	sub    $0x10,%esp
  100b3a:	ff 75 08             	pushl  0x8(%ebp)
  100b3d:	ff 35 00 20 10 00    	pushl  0x102000
  100b43:	e8 a4 fe ff ff       	call   1009ec <get_from>
  100b48:	83 c4 10             	add    $0x10,%esp
  100b4b:	40                   	inc    %eax
  100b4c:	74 0a                	je     100b58 <get_from_block+0x24>
  100b4e:	b8 01 00 00 00       	mov    $0x1,%eax
  100b53:	c9                   	leave  
  100b54:	c3                   	ret    
  100b55:	8d 76 00             	lea    0x0(%esi),%esi
  100b58:	83 ec 08             	sub    $0x8,%esp
  100b5b:	68 11 01 00 00       	push   $0x111
  100b60:	68 66 14 10 00       	push   $0x101466
  100b65:	e8 a2 07 00 00       	call   10130c <abort>
  100b6a:	83 c4 10             	add    $0x10,%esp
  100b6d:	b8 01 00 00 00       	mov    $0x1,%eax
  100b72:	c9                   	leave  
  100b73:	c3                   	ret    

00100b74 <check_block>:
  100b74:	55                   	push   %ebp
  100b75:	89 e5                	mov    %esp,%ebp
  100b77:	56                   	push   %esi
  100b78:	53                   	push   %ebx
  100b79:	a1 00 20 10 00       	mov    0x102000,%eax
  100b7e:	89 c3                	mov    %eax,%ebx
  100b80:	83 f8 ff             	cmp    $0xffffffff,%eax
  100b83:	74 4c                	je     100bd1 <check_block+0x5d>
  100b85:	89 c2                	mov    %eax,%edx
  100b87:	c1 e2 07             	shl    $0x7,%edx
  100b8a:	01 c2                	add    %eax,%edx
  100b8c:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100b8f:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100b92:	8d 34 95 c0 29 10 00 	lea    0x1029c0(,%edx,4),%esi
  100b99:	eb 0a                	jmp    100ba5 <check_block+0x31>
  100b9b:	90                   	nop
  100b9c:	39 c3                	cmp    %eax,%ebx
  100b9e:	74 2c                	je     100bcc <check_block+0x58>
  100ba0:	83 f8 ff             	cmp    $0xffffffff,%eax
  100ba3:	74 27                	je     100bcc <check_block+0x58>
  100ba5:	8b 96 44 20 00 00    	mov    0x2044(%esi),%edx
  100bab:	85 d2                	test   %edx,%edx
  100bad:	7f ed                	jg     100b9c <check_block+0x28>
  100baf:	83 ec 0c             	sub    $0xc,%esp
  100bb2:	53                   	push   %ebx
  100bb3:	e8 7c ff ff ff       	call   100b34 <get_from_block>
  100bb8:	89 1c 24             	mov    %ebx,(%esp)
  100bbb:	e8 38 fc ff ff       	call   1007f8 <put_into_runnable>
  100bc0:	83 c4 10             	add    $0x10,%esp
  100bc3:	a1 00 20 10 00       	mov    0x102000,%eax
  100bc8:	39 c3                	cmp    %eax,%ebx
  100bca:	75 d4                	jne    100ba0 <check_block+0x2c>
  100bcc:	bb 01 00 00 00       	mov    $0x1,%ebx
  100bd1:	89 d8                	mov    %ebx,%eax
  100bd3:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100bd6:	5b                   	pop    %ebx
  100bd7:	5e                   	pop    %esi
  100bd8:	5d                   	pop    %ebp
  100bd9:	c3                   	ret    
  100bda:	66 90                	xchg   %ax,%ax

00100bdc <checkTimeCount>:
  100bdc:	55                   	push   %ebp
  100bdd:	89 e5                	mov    %esp,%ebp
  100bdf:	57                   	push   %edi
  100be0:	56                   	push   %esi
  100be1:	53                   	push   %ebx
  100be2:	83 ec 0c             	sub    $0xc,%esp
  100be5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100be8:	8b 35 a4 29 10 00    	mov    0x1029a4,%esi
  100bee:	85 f6                	test   %esi,%esi
  100bf0:	0f 84 ba 00 00 00    	je     100cb0 <checkTimeCount+0xd4>
  100bf6:	83 ec 0c             	sub    $0xc,%esp
  100bf9:	68 d8 13 10 00       	push   $0x1013d8
  100bfe:	e8 95 05 00 00       	call   101198 <printk>
  100c03:	a1 a0 29 10 00       	mov    0x1029a0,%eax
  100c08:	ff 73 28             	pushl  0x28(%ebx)
  100c0b:	ff 73 34             	pushl  0x34(%ebx)
  100c0e:	89 c2                	mov    %eax,%edx
  100c10:	c1 e2 07             	shl    $0x7,%edx
  100c13:	01 c2                	add    %eax,%edx
  100c15:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c18:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c1b:	ff 34 95 00 4a 10 00 	pushl  0x104a00(,%edx,4)
  100c22:	50                   	push   %eax
  100c23:	68 88 15 10 00       	push   $0x101588
  100c28:	6a 13                	push   $0x13
  100c2a:	68 66 14 10 00       	push   $0x101466
  100c2f:	68 0c 15 10 00       	push   $0x10150c
  100c34:	e8 5f 05 00 00       	call   101198 <printk>
  100c39:	83 c4 24             	add    $0x24,%esp
  100c3c:	68 fa 13 10 00       	push   $0x1013fa
  100c41:	e8 52 05 00 00       	call   101198 <printk>
  100c46:	e8 29 ff ff ff       	call   100b74 <check_block>
  100c4b:	8b 15 a0 29 10 00    	mov    0x1029a0,%edx
  100c51:	89 d0                	mov    %edx,%eax
  100c53:	c1 e0 07             	shl    $0x7,%eax
  100c56:	01 d0                	add    %edx,%eax
  100c58:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100c5b:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100c5e:	c1 e0 02             	shl    $0x2,%eax
  100c61:	83 c4 10             	add    $0x10,%esp
  100c64:	8b 88 00 4a 10 00    	mov    0x104a00(%eax),%ecx
  100c6a:	85 c9                	test   %ecx,%ecx
  100c6c:	7e 0e                	jle    100c7c <checkTimeCount+0xa0>
  100c6e:	b8 01 00 00 00       	mov    $0x1,%eax
  100c73:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100c76:	5b                   	pop    %ebx
  100c77:	5e                   	pop    %esi
  100c78:	5f                   	pop    %edi
  100c79:	5d                   	pop    %ebp
  100c7a:	c3                   	ret    
  100c7b:	90                   	nop
  100c7c:	05 c0 49 10 00       	add    $0x1049c0,%eax
  100c81:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100c86:	89 c7                	mov    %eax,%edi
  100c88:	89 de                	mov    %ebx,%esi
  100c8a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100c8c:	83 ec 0c             	sub    $0xc,%esp
  100c8f:	52                   	push   %edx
  100c90:	e8 63 fb ff ff       	call   1007f8 <put_into_runnable>
  100c95:	e8 82 fa ff ff       	call   10071c <get_from_runnable>
  100c9a:	83 c4 10             	add    $0x10,%esp
  100c9d:	3b 05 a0 29 10 00    	cmp    0x1029a0,%eax
  100ca3:	74 c9                	je     100c6e <checkTimeCount+0x92>
  100ca5:	89 da                	mov    %ebx,%edx
  100ca7:	e8 b4 f9 ff ff       	call   100660 <put_into_running.part.0>
  100cac:	eb c0                	jmp    100c6e <checkTimeCount+0x92>
  100cae:	66 90                	xchg   %ax,%ax
  100cb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100cb5:	eb bc                	jmp    100c73 <checkTimeCount+0x97>
  100cb7:	90                   	nop

00100cb8 <check_is_in>:
  100cb8:	55                   	push   %ebp
  100cb9:	89 e5                	mov    %esp,%ebp
  100cbb:	53                   	push   %ebx
  100cbc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100cbf:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100cc2:	85 c9                	test   %ecx,%ecx
  100cc4:	7e 42                	jle    100d08 <check_is_in+0x50>
  100cc6:	39 d9                	cmp    %ebx,%ecx
  100cc8:	74 36                	je     100d00 <check_is_in+0x48>
  100cca:	89 c8                	mov    %ecx,%eax
  100ccc:	c1 e0 07             	shl    $0x7,%eax
  100ccf:	01 c8                	add    %ecx,%eax
  100cd1:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100cd4:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100cd7:	8b 04 85 10 4a 10 00 	mov    0x104a10(,%eax,4),%eax
  100cde:	39 c1                	cmp    %eax,%ecx
  100ce0:	75 1a                	jne    100cfc <check_is_in+0x44>
  100ce2:	eb 24                	jmp    100d08 <check_is_in+0x50>
  100ce4:	89 c2                	mov    %eax,%edx
  100ce6:	c1 e2 07             	shl    $0x7,%edx
  100ce9:	01 c2                	add    %eax,%edx
  100ceb:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100cee:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100cf1:	8b 04 85 10 4a 10 00 	mov    0x104a10(,%eax,4),%eax
  100cf8:	39 c1                	cmp    %eax,%ecx
  100cfa:	74 0c                	je     100d08 <check_is_in+0x50>
  100cfc:	39 c3                	cmp    %eax,%ebx
  100cfe:	75 e4                	jne    100ce4 <check_is_in+0x2c>
  100d00:	b8 01 00 00 00       	mov    $0x1,%eax
  100d05:	5b                   	pop    %ebx
  100d06:	5d                   	pop    %ebp
  100d07:	c3                   	ret    
  100d08:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100d0d:	5b                   	pop    %ebx
  100d0e:	5d                   	pop    %ebp
  100d0f:	c3                   	ret    

00100d10 <block_decrease>:
  100d10:	55                   	push   %ebp
  100d11:	89 e5                	mov    %esp,%ebp
  100d13:	8b 0d 00 20 10 00    	mov    0x102000,%ecx
  100d19:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100d1c:	74 2d                	je     100d4b <block_decrease+0x3b>
  100d1e:	89 c8                	mov    %ecx,%eax
  100d20:	89 c2                	mov    %eax,%edx
  100d22:	c1 e2 07             	shl    $0x7,%edx
  100d25:	01 c2                	add    %eax,%edx
  100d27:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100d2a:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100d2d:	8d 04 85 c0 29 10 00 	lea    0x1029c0(,%eax,4),%eax
  100d34:	ff 88 44 20 00 00    	decl   0x2044(%eax)
  100d3a:	8b 80 50 20 00 00    	mov    0x2050(%eax),%eax
  100d40:	39 c1                	cmp    %eax,%ecx
  100d42:	75 dc                	jne    100d20 <block_decrease+0x10>
  100d44:	b8 01 00 00 00       	mov    $0x1,%eax
  100d49:	5d                   	pop    %ebp
  100d4a:	c3                   	ret    
  100d4b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100d50:	5d                   	pop    %ebp
  100d51:	c3                   	ret    
  100d52:	66 90                	xchg   %ax,%ax

00100d54 <init_pcb>:
  100d54:	55                   	push   %ebp
  100d55:	89 e5                	mov    %esp,%ebp
  100d57:	ba 08 4a 10 00       	mov    $0x104a08,%edx
  100d5c:	31 c0                	xor    %eax,%eax
  100d5e:	66 90                	xchg   %ax,%ax
  100d60:	89 02                	mov    %eax,(%edx)
  100d62:	8d 48 ff             	lea    -0x1(%eax),%ecx
  100d65:	89 4a 04             	mov    %ecx,0x4(%edx)
  100d68:	40                   	inc    %eax
  100d69:	89 42 08             	mov    %eax,0x8(%edx)
  100d6c:	81 c2 54 20 00 00    	add    $0x2054,%edx
  100d72:	3d 00 08 00 00       	cmp    $0x800,%eax
  100d77:	75 e7                	jne    100d60 <init_pcb+0xc>
  100d79:	c7 05 0c 4a 10 00 ff 	movl   $0x7ff,0x104a0c
  100d80:	07 00 00 
  100d83:	c7 05 bc c9 12 01 00 	movl   $0x0,0x112c9bc
  100d8a:	00 00 00 
  100d8d:	5d                   	pop    %ebp
  100d8e:	c3                   	ret    
  100d8f:	90                   	nop

00100d90 <init_kernel_pcb>:
  100d90:	55                   	push   %ebp
  100d91:	89 e5                	mov    %esp,%ebp
  100d93:	c7 05 f8 49 10 00 10 	movl   $0x10,0x1049f8
  100d9a:	00 00 00 
  100d9d:	c7 05 ec 49 10 00 08 	movl   $0x8,0x1049ec
  100da4:	00 00 00 
  100da7:	c7 05 e8 49 10 00 58 	movl   $0x100658,0x1049e8
  100dae:	06 10 00 
  100db1:	c7 05 fc 49 10 00 01 	movl   $0x1,0x1049fc
  100db8:	00 00 00 
  100dbb:	c7 05 00 4a 10 00 04 	movl   $0x4,0x104a00
  100dc2:	00 00 00 
  100dc5:	b8 01 00 00 00       	mov    $0x1,%eax
  100dca:	5d                   	pop    %ebp
  100dcb:	c3                   	ret    

00100dcc <transfer_pid_state>:
  100dcc:	55                   	push   %ebp
  100dcd:	89 e5                	mov    %esp,%ebp
  100dcf:	b8 01 00 00 00       	mov    $0x1,%eax
  100dd4:	5d                   	pop    %ebp
  100dd5:	c3                   	ret    
  100dd6:	66 90                	xchg   %ax,%ax

00100dd8 <initIdt>:
  100dd8:	55                   	push   %ebp
  100dd9:	89 e5                	mov    %esp,%ebp
  100ddb:	53                   	push   %ebx
  100ddc:	ba a3 13 10 00       	mov    $0x1013a3,%edx
  100de1:	89 d3                	mov    %edx,%ebx
  100de3:	c1 ea 10             	shr    $0x10,%edx
  100de6:	b9 80 d2 12 01       	mov    $0x112d280,%ecx
  100deb:	b8 80 ca 12 01       	mov    $0x112ca80,%eax
  100df0:	66 89 18             	mov    %bx,(%eax)
  100df3:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100df9:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100dfd:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100e01:	66 89 50 06          	mov    %dx,0x6(%eax)
  100e05:	83 c0 08             	add    $0x8,%eax
  100e08:	39 c1                	cmp    %eax,%ecx
  100e0a:	75 e4                	jne    100df0 <initIdt+0x18>
  100e0c:	b8 a9 13 10 00       	mov    $0x1013a9,%eax
  100e11:	66 a3 e8 ca 12 01    	mov    %ax,0x112cae8
  100e17:	66 c7 05 ea ca 12 01 	movw   $0x8,0x112caea
  100e1e:	08 00 
  100e20:	c6 05 ec ca 12 01 00 	movb   $0x0,0x112caec
  100e27:	c6 05 ed ca 12 01 8f 	movb   $0x8f,0x112caed
  100e2e:	c1 e8 10             	shr    $0x10,%eax
  100e31:	66 a3 ee ca 12 01    	mov    %ax,0x112caee
  100e37:	b8 ad 13 10 00       	mov    $0x1013ad,%eax
  100e3c:	66 a3 80 ce 12 01    	mov    %ax,0x112ce80
  100e42:	66 c7 05 82 ce 12 01 	movw   $0x8,0x112ce82
  100e49:	08 00 
  100e4b:	c6 05 84 ce 12 01 00 	movb   $0x0,0x112ce84
  100e52:	c6 05 85 ce 12 01 ee 	movb   $0xee,0x112ce85
  100e59:	c1 e8 10             	shr    $0x10,%eax
  100e5c:	66 a3 86 ce 12 01    	mov    %ax,0x112ce86
  100e62:	b8 b6 13 10 00       	mov    $0x1013b6,%eax
  100e67:	66 a3 80 cb 12 01    	mov    %ax,0x112cb80
  100e6d:	66 c7 05 82 cb 12 01 	movw   $0x8,0x112cb82
  100e74:	08 00 
  100e76:	c6 05 84 cb 12 01 00 	movb   $0x0,0x112cb84
  100e7d:	c6 05 85 cb 12 01 8e 	movb   $0x8e,0x112cb85
  100e84:	c1 e8 10             	shr    $0x10,%eax
  100e87:	66 a3 86 cb 12 01    	mov    %ax,0x112cb86
  100e8d:	66 c7 05 30 21 10 00 	movw   $0x7ff,0x102130
  100e94:	ff 07 
  100e96:	b8 80 ca 12 01       	mov    $0x112ca80,%eax
  100e9b:	66 a3 32 21 10 00    	mov    %ax,0x102132
  100ea1:	c1 e8 10             	shr    $0x10,%eax
  100ea4:	66 a3 34 21 10 00    	mov    %ax,0x102134
  100eaa:	b8 30 21 10 00       	mov    $0x102130,%eax
  100eaf:	0f 01 18             	lidtl  (%eax)
  100eb2:	5b                   	pop    %ebx
  100eb3:	5d                   	pop    %ebp
  100eb4:	c3                   	ret    
  100eb5:	66 90                	xchg   %ax,%ax
  100eb7:	90                   	nop

00100eb8 <syscallHandle>:
  100eb8:	55                   	push   %ebp
  100eb9:	89 e5                	mov    %esp,%ebp
  100ebb:	53                   	push   %ebx
  100ebc:	50                   	push   %eax
  100ebd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100ec0:	8b 43 1c             	mov    0x1c(%ebx),%eax
  100ec3:	83 f8 02             	cmp    $0x2,%eax
  100ec6:	74 28                	je     100ef0 <syscallHandle+0x38>
  100ec8:	76 3a                	jbe    100f04 <syscallHandle+0x4c>
  100eca:	83 f8 04             	cmp    $0x4,%eax
  100ecd:	74 15                	je     100ee4 <syscallHandle+0x2c>
  100ecf:	3d e6 00 00 00       	cmp    $0xe6,%eax
  100ed4:	75 29                	jne    100eff <syscallHandle+0x47>
  100ed6:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100ed9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100edc:	c9                   	leave  
  100edd:	e9 fe f4 ff ff       	jmp    1003e0 <sys_sleep>
  100ee2:	66 90                	xchg   %ax,%ax
  100ee4:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100ee7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100eea:	c9                   	leave  
  100eeb:	e9 c0 f6 ff ff       	jmp    1005b0 <sys_write>
  100ef0:	83 ec 0c             	sub    $0xc,%esp
  100ef3:	53                   	push   %ebx
  100ef4:	e8 6b f5 ff ff       	call   100464 <sys_fork>
  100ef9:	89 43 1c             	mov    %eax,0x1c(%ebx)
  100efc:	83 c4 10             	add    $0x10,%esp
  100eff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100f02:	c9                   	leave  
  100f03:	c3                   	ret    
  100f04:	48                   	dec    %eax
  100f05:	75 f8                	jne    100eff <syscallHandle+0x47>
  100f07:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100f0a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100f0d:	c9                   	leave  
  100f0e:	e9 ad f4 ff ff       	jmp    1003c0 <sys_exit>
  100f13:	90                   	nop

00100f14 <GProtectFaultHandle>:
  100f14:	55                   	push   %ebp
  100f15:	89 e5                	mov    %esp,%ebp
  100f17:	83 ec 14             	sub    $0x14,%esp
  100f1a:	68 d8 13 10 00       	push   $0x1013d8
  100f1f:	e8 74 02 00 00       	call   101198 <printk>
  100f24:	58                   	pop    %eax
  100f25:	8b 45 08             	mov    0x8(%ebp),%eax
  100f28:	ff 70 20             	pushl  0x20(%eax)
  100f2b:	68 c0 15 10 00       	push   $0x1015c0
  100f30:	6a 49                	push   $0x49
  100f32:	68 97 15 10 00       	push   $0x101597
  100f37:	68 aa 15 10 00       	push   $0x1015aa
  100f3c:	e8 57 02 00 00       	call   101198 <printk>
  100f41:	83 c4 14             	add    $0x14,%esp
  100f44:	68 fa 13 10 00       	push   $0x1013fa
  100f49:	e8 4a 02 00 00       	call   101198 <printk>
  100f4e:	5a                   	pop    %edx
  100f4f:	59                   	pop    %ecx
  100f50:	6a 4a                	push   $0x4a
  100f52:	68 97 15 10 00       	push   $0x101597
  100f57:	e8 b0 03 00 00       	call   10130c <abort>
  100f5c:	83 c4 10             	add    $0x10,%esp
  100f5f:	c9                   	leave  
  100f60:	c3                   	ret    
  100f61:	8d 76 00             	lea    0x0(%esi),%esi

00100f64 <timeHandle>:
  100f64:	55                   	push   %ebp
  100f65:	89 e5                	mov    %esp,%ebp
  100f67:	53                   	push   %ebx
  100f68:	83 ec 10             	sub    $0x10,%esp
  100f6b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100f6e:	6a 41                	push   $0x41
  100f70:	e8 c7 f6 ff ff       	call   10063c <putChar>
  100f75:	e8 72 f7 ff ff       	call   1006ec <getpid>
  100f7a:	89 c2                	mov    %eax,%edx
  100f7c:	c1 e2 07             	shl    $0x7,%edx
  100f7f:	01 c2                	add    %eax,%edx
  100f81:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100f84:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100f87:	ff 0c 85 00 4a 10 00 	decl   0x104a00(,%eax,4)
  100f8e:	e8 7d fd ff ff       	call   100d10 <block_decrease>
  100f93:	89 1c 24             	mov    %ebx,(%esp)
  100f96:	e8 41 fc ff ff       	call   100bdc <checkTimeCount>
  100f9b:	83 c4 10             	add    $0x10,%esp
  100f9e:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  100fa5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100fa8:	c9                   	leave  
  100fa9:	e9 8e f6 ff ff       	jmp    10063c <putChar>
  100fae:	66 90                	xchg   %ax,%ax

00100fb0 <irqHandle>:
  100fb0:	55                   	push   %ebp
  100fb1:	89 e5                	mov    %esp,%ebp
  100fb3:	83 ec 08             	sub    $0x8,%esp
  100fb6:	8b 55 08             	mov    0x8(%ebp),%edx
  100fb9:	fa                   	cli    
  100fba:	8b 42 20             	mov    0x20(%edx),%eax
  100fbd:	83 f8 0d             	cmp    $0xd,%eax
  100fc0:	74 46                	je     101008 <irqHandle+0x58>
  100fc2:	7e 2c                	jle    100ff0 <irqHandle+0x40>
  100fc4:	83 f8 20             	cmp    $0x20,%eax
  100fc7:	74 17                	je     100fe0 <irqHandle+0x30>
  100fc9:	83 c0 80             	add    $0xffffff80,%eax
  100fcc:	75 25                	jne    100ff3 <irqHandle+0x43>
  100fce:	83 ec 0c             	sub    $0xc,%esp
  100fd1:	52                   	push   %edx
  100fd2:	e8 e1 fe ff ff       	call   100eb8 <syscallHandle>
  100fd7:	83 c4 10             	add    $0x10,%esp
  100fda:	fb                   	sti    
  100fdb:	c9                   	leave  
  100fdc:	c3                   	ret    
  100fdd:	8d 76 00             	lea    0x0(%esi),%esi
  100fe0:	83 ec 0c             	sub    $0xc,%esp
  100fe3:	52                   	push   %edx
  100fe4:	e8 7b ff ff ff       	call   100f64 <timeHandle>
  100fe9:	83 c4 10             	add    $0x10,%esp
  100fec:	eb ec                	jmp    100fda <irqHandle+0x2a>
  100fee:	66 90                	xchg   %ax,%ax
  100ff0:	40                   	inc    %eax
  100ff1:	74 e7                	je     100fda <irqHandle+0x2a>
  100ff3:	83 ec 08             	sub    $0x8,%esp
  100ff6:	6a 24                	push   $0x24
  100ff8:	68 97 15 10 00       	push   $0x101597
  100ffd:	e8 0a 03 00 00       	call   10130c <abort>
  101002:	83 c4 10             	add    $0x10,%esp
  101005:	eb d3                	jmp    100fda <irqHandle+0x2a>
  101007:	90                   	nop
  101008:	83 ec 0c             	sub    $0xc,%esp
  10100b:	52                   	push   %edx
  10100c:	e8 03 ff ff ff       	call   100f14 <GProtectFaultHandle>
  101011:	83 c4 10             	add    $0x10,%esp
  101014:	eb c4                	jmp    100fda <irqHandle+0x2a>
  101016:	66 90                	xchg   %ax,%ax

00101018 <initIntr>:
  101018:	55                   	push   %ebp
  101019:	89 e5                	mov    %esp,%ebp
  10101b:	ba 21 00 00 00       	mov    $0x21,%edx
  101020:	b0 ff                	mov    $0xff,%al
  101022:	ee                   	out    %al,(%dx)
  101023:	ba a1 00 00 00       	mov    $0xa1,%edx
  101028:	ee                   	out    %al,(%dx)
  101029:	ba 20 00 00 00       	mov    $0x20,%edx
  10102e:	b0 11                	mov    $0x11,%al
  101030:	ee                   	out    %al,(%dx)
  101031:	ba 21 00 00 00       	mov    $0x21,%edx
  101036:	b0 20                	mov    $0x20,%al
  101038:	ee                   	out    %al,(%dx)
  101039:	b0 04                	mov    $0x4,%al
  10103b:	ee                   	out    %al,(%dx)
  10103c:	b0 03                	mov    $0x3,%al
  10103e:	ee                   	out    %al,(%dx)
  10103f:	ba a0 00 00 00       	mov    $0xa0,%edx
  101044:	b0 11                	mov    $0x11,%al
  101046:	ee                   	out    %al,(%dx)
  101047:	ba a1 00 00 00       	mov    $0xa1,%edx
  10104c:	b0 28                	mov    $0x28,%al
  10104e:	ee                   	out    %al,(%dx)
  10104f:	b0 02                	mov    $0x2,%al
  101051:	ee                   	out    %al,(%dx)
  101052:	b0 03                	mov    $0x3,%al
  101054:	ee                   	out    %al,(%dx)
  101055:	ba 20 00 00 00       	mov    $0x20,%edx
  10105a:	b0 68                	mov    $0x68,%al
  10105c:	ee                   	out    %al,(%dx)
  10105d:	b0 0a                	mov    $0xa,%al
  10105f:	ee                   	out    %al,(%dx)
  101060:	ba a0 00 00 00       	mov    $0xa0,%edx
  101065:	b0 68                	mov    $0x68,%al
  101067:	ee                   	out    %al,(%dx)
  101068:	b0 0a                	mov    $0xa,%al
  10106a:	ee                   	out    %al,(%dx)
  10106b:	5d                   	pop    %ebp
  10106c:	c3                   	ret    
  10106d:	8d 76 00             	lea    0x0(%esi),%esi

00101070 <initTimer>:
  101070:	55                   	push   %ebp
  101071:	89 e5                	mov    %esp,%ebp
  101073:	ba 43 00 00 00       	mov    $0x43,%edx
  101078:	b0 34                	mov    $0x34,%al
  10107a:	ee                   	out    %al,(%dx)
  10107b:	ba 40 00 00 00       	mov    $0x40,%edx
  101080:	b0 9b                	mov    $0x9b,%al
  101082:	ee                   	out    %al,(%dx)
  101083:	b0 2e                	mov    $0x2e,%al
  101085:	ee                   	out    %al,(%dx)
  101086:	5d                   	pop    %ebp
  101087:	c3                   	ret    

00101088 <i2A>:
  101088:	55                   	push   %ebp
  101089:	89 e5                	mov    %esp,%ebp
  10108b:	57                   	push   %edi
  10108c:	56                   	push   %esi
  10108d:	53                   	push   %ebx
  10108e:	51                   	push   %ecx
  10108f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101092:	85 c9                	test   %ecx,%ecx
  101094:	78 6e                	js     101104 <i2A+0x7c>
  101096:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  10109a:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  10109e:	bb 7e 21 10 00       	mov    $0x10217e,%ebx
  1010a3:	31 ff                	xor    %edi,%edi
  1010a5:	eb 03                	jmp    1010aa <i2A+0x22>
  1010a7:	90                   	nop
  1010a8:	89 f7                	mov    %esi,%edi
  1010aa:	4b                   	dec    %ebx
  1010ab:	89 c8                	mov    %ecx,%eax
  1010ad:	be 0a 00 00 00       	mov    $0xa,%esi
  1010b2:	99                   	cltd   
  1010b3:	f7 fe                	idiv   %esi
  1010b5:	83 c2 30             	add    $0x30,%edx
  1010b8:	88 13                	mov    %dl,(%ebx)
  1010ba:	8d 77 01             	lea    0x1(%edi),%esi
  1010bd:	b8 67 66 66 66       	mov    $0x66666667,%eax
  1010c2:	f7 e9                	imul   %ecx
  1010c4:	89 d0                	mov    %edx,%eax
  1010c6:	c1 f8 02             	sar    $0x2,%eax
  1010c9:	c1 f9 1f             	sar    $0x1f,%ecx
  1010cc:	29 c8                	sub    %ecx,%eax
  1010ce:	89 c1                	mov    %eax,%ecx
  1010d0:	75 d6                	jne    1010a8 <i2A+0x20>
  1010d2:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  1010d6:	74 20                	je     1010f8 <i2A+0x70>
  1010d8:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  1010dc:	75 06                	jne    1010e4 <i2A+0x5c>
  1010de:	fe 05 7d 21 10 00    	incb   0x10217d
  1010e4:	c6 05 7e 21 10 00 00 	movb   $0x0,0x10217e
  1010eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1010ee:	89 18                	mov    %ebx,(%eax)
  1010f0:	89 f0                	mov    %esi,%eax
  1010f2:	5a                   	pop    %edx
  1010f3:	5b                   	pop    %ebx
  1010f4:	5e                   	pop    %esi
  1010f5:	5f                   	pop    %edi
  1010f6:	5d                   	pop    %ebp
  1010f7:	c3                   	ret    
  1010f8:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  1010fc:	8d 77 02             	lea    0x2(%edi),%esi
  1010ff:	4b                   	dec    %ebx
  101100:	eb d6                	jmp    1010d8 <i2A+0x50>
  101102:	66 90                	xchg   %ax,%ax
  101104:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  10110a:	74 0c                	je     101118 <i2A+0x90>
  10110c:	f7 d9                	neg    %ecx
  10110e:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  101112:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  101116:	eb 86                	jmp    10109e <i2A+0x16>
  101118:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  10111d:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  101121:	eb ef                	jmp    101112 <i2A+0x8a>
  101123:	90                   	nop

00101124 <i2X>:
  101124:	55                   	push   %ebp
  101125:	89 e5                	mov    %esp,%ebp
  101127:	57                   	push   %edi
  101128:	56                   	push   %esi
  101129:	53                   	push   %ebx
  10112a:	8b 55 08             	mov    0x8(%ebp),%edx
  10112d:	b9 5d 21 10 00       	mov    $0x10215d,%ecx
  101132:	31 c0                	xor    %eax,%eax
  101134:	40                   	inc    %eax
  101135:	89 d6                	mov    %edx,%esi
  101137:	83 e6 0f             	and    $0xf,%esi
  10113a:	8d 5e f6             	lea    -0xa(%esi),%ebx
  10113d:	89 cf                	mov    %ecx,%edi
  10113f:	83 fb 05             	cmp    $0x5,%ebx
  101142:	77 4c                	ja     101190 <i2X+0x6c>
  101144:	ff 24 9d d4 15 10 00 	jmp    *0x1015d4(,%ebx,4)
  10114b:	90                   	nop
  10114c:	c6 01 65             	movb   $0x65,(%ecx)
  10114f:	90                   	nop
  101150:	49                   	dec    %ecx
  101151:	c1 ea 04             	shr    $0x4,%edx
  101154:	75 de                	jne    101134 <i2X+0x10>
  101156:	c6 05 5e 21 10 00 00 	movb   $0x0,0x10215e
  10115d:	8b 55 0c             	mov    0xc(%ebp),%edx
  101160:	89 3a                	mov    %edi,(%edx)
  101162:	5b                   	pop    %ebx
  101163:	5e                   	pop    %esi
  101164:	5f                   	pop    %edi
  101165:	5d                   	pop    %ebp
  101166:	c3                   	ret    
  101167:	90                   	nop
  101168:	c6 01 64             	movb   $0x64,(%ecx)
  10116b:	eb e3                	jmp    101150 <i2X+0x2c>
  10116d:	8d 76 00             	lea    0x0(%esi),%esi
  101170:	c6 01 63             	movb   $0x63,(%ecx)
  101173:	eb db                	jmp    101150 <i2X+0x2c>
  101175:	8d 76 00             	lea    0x0(%esi),%esi
  101178:	c6 01 62             	movb   $0x62,(%ecx)
  10117b:	eb d3                	jmp    101150 <i2X+0x2c>
  10117d:	8d 76 00             	lea    0x0(%esi),%esi
  101180:	c6 01 61             	movb   $0x61,(%ecx)
  101183:	eb cb                	jmp    101150 <i2X+0x2c>
  101185:	8d 76 00             	lea    0x0(%esi),%esi
  101188:	c6 01 66             	movb   $0x66,(%ecx)
  10118b:	eb c3                	jmp    101150 <i2X+0x2c>
  10118d:	8d 76 00             	lea    0x0(%esi),%esi
  101190:	8d 5e 30             	lea    0x30(%esi),%ebx
  101193:	88 19                	mov    %bl,(%ecx)
  101195:	eb b9                	jmp    101150 <i2X+0x2c>
  101197:	90                   	nop

00101198 <printk>:
  101198:	55                   	push   %ebp
  101199:	89 e5                	mov    %esp,%ebp
  10119b:	57                   	push   %edi
  10119c:	56                   	push   %esi
  10119d:	53                   	push   %ebx
  10119e:	83 ec 2c             	sub    $0x2c,%esp
  1011a1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1011a4:	8a 11                	mov    (%ecx),%dl
  1011a6:	84 d2                	test   %dl,%dl
  1011a8:	0f 84 54 01 00 00    	je     101302 <printk+0x16a>
  1011ae:	8d 45 0c             	lea    0xc(%ebp),%eax
  1011b1:	31 ff                	xor    %edi,%edi
  1011b3:	eb 18                	jmp    1011cd <printk+0x35>
  1011b5:	8d 76 00             	lea    0x0(%esi),%esi
  1011b8:	8a 11                	mov    (%ecx),%dl
  1011ba:	89 cb                	mov    %ecx,%ebx
  1011bc:	88 97 80 21 10 00    	mov    %dl,0x102180(%edi)
  1011c2:	47                   	inc    %edi
  1011c3:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1011c6:	8a 53 01             	mov    0x1(%ebx),%dl
  1011c9:	84 d2                	test   %dl,%dl
  1011cb:	74 72                	je     10123f <printk+0xa7>
  1011cd:	80 fa 25             	cmp    $0x25,%dl
  1011d0:	75 e6                	jne    1011b8 <printk+0x20>
  1011d2:	8d 59 01             	lea    0x1(%ecx),%ebx
  1011d5:	8a 51 01             	mov    0x1(%ecx),%dl
  1011d8:	80 fa 64             	cmp    $0x64,%dl
  1011db:	0f 84 bf 00 00 00    	je     1012a0 <printk+0x108>
  1011e1:	0f 8e 01 01 00 00    	jle    1012e8 <printk+0x150>
  1011e7:	80 fa 73             	cmp    $0x73,%dl
  1011ea:	0f 84 84 00 00 00    	je     101274 <printk+0xdc>
  1011f0:	80 fa 78             	cmp    $0x78,%dl
  1011f3:	75 c7                	jne    1011bc <printk+0x24>
  1011f5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1011fc:	8d 70 04             	lea    0x4(%eax),%esi
  1011ff:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101202:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101205:	56                   	push   %esi
  101206:	ff 30                	pushl  (%eax)
  101208:	e8 17 ff ff ff       	call   101124 <i2X>
  10120d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  101210:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  101216:	8a 11                	mov    (%ecx),%dl
  101218:	83 c4 08             	add    $0x8,%esp
  10121b:	31 c0                	xor    %eax,%eax
  10121d:	84 d2                	test   %dl,%dl
  10121f:	74 0f                	je     101230 <printk+0x98>
  101221:	8d 76 00             	lea    0x0(%esi),%esi
  101224:	40                   	inc    %eax
  101225:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101229:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  10122c:	84 d2                	test   %dl,%dl
  10122e:	75 f4                	jne    101224 <printk+0x8c>
  101230:	01 c7                	add    %eax,%edi
  101232:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101235:	8d 4b 01             	lea    0x1(%ebx),%ecx
  101238:	8a 53 01             	mov    0x1(%ebx),%dl
  10123b:	84 d2                	test   %dl,%dl
  10123d:	75 8e                	jne    1011cd <printk+0x35>
  10123f:	c6 87 80 21 10 00 00 	movb   $0x0,0x102180(%edi)
  101246:	0f be 05 80 21 10 00 	movsbl 0x102180,%eax
  10124d:	bb 80 21 10 00       	mov    $0x102180,%ebx
  101252:	84 c0                	test   %al,%al
  101254:	74 16                	je     10126c <printk+0xd4>
  101256:	66 90                	xchg   %ax,%ax
  101258:	83 ec 0c             	sub    $0xc,%esp
  10125b:	50                   	push   %eax
  10125c:	e8 db f3 ff ff       	call   10063c <putChar>
  101261:	43                   	inc    %ebx
  101262:	0f be 03             	movsbl (%ebx),%eax
  101265:	83 c4 10             	add    $0x10,%esp
  101268:	84 c0                	test   %al,%al
  10126a:	75 ec                	jne    101258 <printk+0xc0>
  10126c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10126f:	5b                   	pop    %ebx
  101270:	5e                   	pop    %esi
  101271:	5f                   	pop    %edi
  101272:	5d                   	pop    %ebp
  101273:	c3                   	ret    
  101274:	8d 70 04             	lea    0x4(%eax),%esi
  101277:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10127a:	8b 08                	mov    (%eax),%ecx
  10127c:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  101282:	8a 11                	mov    (%ecx),%dl
  101284:	31 c0                	xor    %eax,%eax
  101286:	84 d2                	test   %dl,%dl
  101288:	74 a6                	je     101230 <printk+0x98>
  10128a:	66 90                	xchg   %ax,%ax
  10128c:	40                   	inc    %eax
  10128d:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101291:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  101294:	84 d2                	test   %dl,%dl
  101296:	75 f4                	jne    10128c <printk+0xf4>
  101298:	01 c7                	add    %eax,%edi
  10129a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10129d:	eb 96                	jmp    101235 <printk+0x9d>
  10129f:	90                   	nop
  1012a0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1012a7:	8d 70 04             	lea    0x4(%eax),%esi
  1012aa:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  1012ad:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  1012b0:	56                   	push   %esi
  1012b1:	ff 30                	pushl  (%eax)
  1012b3:	e8 d0 fd ff ff       	call   101088 <i2A>
  1012b8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1012bb:	8d b7 80 21 10 00    	lea    0x102180(%edi),%esi
  1012c1:	8a 11                	mov    (%ecx),%dl
  1012c3:	83 c4 08             	add    $0x8,%esp
  1012c6:	31 c0                	xor    %eax,%eax
  1012c8:	84 d2                	test   %dl,%dl
  1012ca:	0f 84 60 ff ff ff    	je     101230 <printk+0x98>
  1012d0:	40                   	inc    %eax
  1012d1:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1012d5:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  1012d8:	84 d2                	test   %dl,%dl
  1012da:	75 f4                	jne    1012d0 <printk+0x138>
  1012dc:	01 c7                	add    %eax,%edi
  1012de:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1012e1:	e9 4f ff ff ff       	jmp    101235 <printk+0x9d>
  1012e6:	66 90                	xchg   %ax,%ax
  1012e8:	80 fa 63             	cmp    $0x63,%dl
  1012eb:	0f 85 cb fe ff ff    	jne    1011bc <printk+0x24>
  1012f1:	8b 10                	mov    (%eax),%edx
  1012f3:	88 97 80 21 10 00    	mov    %dl,0x102180(%edi)
  1012f9:	83 c0 04             	add    $0x4,%eax
  1012fc:	47                   	inc    %edi
  1012fd:	e9 c1 fe ff ff       	jmp    1011c3 <printk+0x2b>
  101302:	31 ff                	xor    %edi,%edi
  101304:	e9 36 ff ff ff       	jmp    10123f <printk+0xa7>
  101309:	66 90                	xchg   %ax,%ax
  10130b:	90                   	nop

0010130c <abort>:
  10130c:	55                   	push   %ebp
  10130d:	89 e5                	mov    %esp,%ebp
  10130f:	57                   	push   %edi
  101310:	56                   	push   %esi
  101311:	53                   	push   %ebx
  101312:	83 ec 1c             	sub    $0x1c,%esp
  101315:	8b 55 08             	mov    0x8(%ebp),%edx
  101318:	fa                   	cli    
  101319:	8a 02                	mov    (%edx),%al
  10131b:	b9 32 20 10 00       	mov    $0x102032,%ecx
  101320:	84 c0                	test   %al,%al
  101322:	74 0b                	je     10132f <abort+0x23>
  101324:	41                   	inc    %ecx
  101325:	42                   	inc    %edx
  101326:	88 41 ff             	mov    %al,-0x1(%ecx)
  101329:	8a 02                	mov    (%edx),%al
  10132b:	84 c0                	test   %al,%al
  10132d:	75 f5                	jne    101324 <abort+0x18>
  10132f:	c6 01 3a             	movb   $0x3a,(%ecx)
  101332:	bb 9d 29 10 00       	mov    $0x10299d,%ebx
  101337:	be 0a 00 00 00       	mov    $0xa,%esi
  10133c:	bf 67 66 66 66       	mov    $0x66666667,%edi
  101341:	4b                   	dec    %ebx
  101342:	8b 45 0c             	mov    0xc(%ebp),%eax
  101345:	99                   	cltd   
  101346:	f7 fe                	idiv   %esi
  101348:	8d 42 30             	lea    0x30(%edx),%eax
  10134b:	88 45 e7             	mov    %al,-0x19(%ebp)
  10134e:	88 03                	mov    %al,(%ebx)
  101350:	89 f8                	mov    %edi,%eax
  101352:	f7 6d 0c             	imull  0xc(%ebp)
  101355:	c1 fa 02             	sar    $0x2,%edx
  101358:	8b 45 0c             	mov    0xc(%ebp),%eax
  10135b:	c1 f8 1f             	sar    $0x1f,%eax
  10135e:	29 c2                	sub    %eax,%edx
  101360:	89 55 0c             	mov    %edx,0xc(%ebp)
  101363:	75 dc                	jne    101341 <abort+0x35>
  101365:	41                   	inc    %ecx
  101366:	41                   	inc    %ecx
  101367:	43                   	inc    %ebx
  101368:	8a 45 e7             	mov    -0x19(%ebp),%al
  10136b:	88 41 ff             	mov    %al,-0x1(%ecx)
  10136e:	8a 03                	mov    (%ebx),%al
  101370:	88 45 e7             	mov    %al,-0x19(%ebp)
  101373:	84 c0                	test   %al,%al
  101375:	75 ef                	jne    101366 <abort+0x5a>
  101377:	c6 01 0a             	movb   $0xa,(%ecx)
  10137a:	0f be 05 20 20 10 00 	movsbl 0x102020,%eax
  101381:	84 c0                	test   %al,%al
  101383:	74 1b                	je     1013a0 <abort+0x94>
  101385:	bb 20 20 10 00       	mov    $0x102020,%ebx
  10138a:	83 ec 0c             	sub    $0xc,%esp
  10138d:	50                   	push   %eax
  10138e:	e8 a9 f2 ff ff       	call   10063c <putChar>
  101393:	43                   	inc    %ebx
  101394:	0f be 03             	movsbl (%ebx),%eax
  101397:	83 c4 10             	add    $0x10,%esp
  10139a:	84 c0                	test   %al,%al
  10139c:	75 ec                	jne    10138a <abort+0x7e>
  10139e:	66 90                	xchg   %ax,%ax
  1013a0:	f4                   	hlt    
  1013a1:	eb fd                	jmp    1013a0 <abort+0x94>

001013a3 <irqEmpty>:
  1013a3:	6a 00                	push   $0x0
  1013a5:	6a ff                	push   $0xffffffff
  1013a7:	eb 13                	jmp    1013bc <asmDoIrq>

001013a9 <irqGProtectFault>:
  1013a9:	6a 0d                	push   $0xd
  1013ab:	eb 0f                	jmp    1013bc <asmDoIrq>

001013ad <irqSyscall>:
  1013ad:	6a 00                	push   $0x0
  1013af:	68 80 00 00 00       	push   $0x80
  1013b4:	eb 06                	jmp    1013bc <asmDoIrq>

001013b6 <irqTime>:
  1013b6:	6a 00                	push   $0x0
  1013b8:	6a 20                	push   $0x20
  1013ba:	eb 00                	jmp    1013bc <asmDoIrq>

001013bc <asmDoIrq>:
  1013bc:	60                   	pusha  
  1013bd:	54                   	push   %esp
  1013be:	e8 ed fb ff ff       	call   100fb0 <irqHandle>
  1013c3:	83 c4 04             	add    $0x4,%esp
  1013c6:	61                   	popa   
  1013c7:	83 c4 04             	add    $0x4,%esp
  1013ca:	83 c4 04             	add    $0x4,%esp
  1013cd:	cf                   	iret   
