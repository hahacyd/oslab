
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 f5 13 00 00       	call   101400 <initTimer>
  10000b:	e8 90 0f 00 00       	call   100fa0 <init_pcb>
  100010:	e8 cf 0f 00 00       	call   100fe4 <init_kernel_pcb>
  100015:	e8 5a 07 00 00       	call   100774 <initSerial>
  10001a:	e8 71 10 00 00       	call   101090 <initIdt>
  10001f:	e8 84 13 00 00       	call   1013a8 <initIntr>
  100024:	e8 3f 02 00 00       	call   100268 <initSeg>
  100029:	fb                   	sti    
  10002a:	e8 4d 04 00 00       	call   10047c <loadUMain>
  10002f:	eb fe                	jmp    10002f <kEntry+0x2f>
  100031:	66 90                	xchg   %ax,%ax
  100033:	90                   	nop

00100034 <change_gdt>:
  100034:	55                   	push   %ebp
  100035:	89 e5                	mov    %esp,%ebp
  100037:	53                   	push   %ebx
  100038:	51                   	push   %ecx
  100039:	8b 45 0c             	mov    0xc(%ebp),%eax
  10003c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10003f:	c1 eb 03             	shr    $0x3,%ebx
  100042:	83 fb 02             	cmp    $0x2,%ebx
  100045:	0f 84 1d 01 00 00    	je     100168 <change_gdt+0x134>
  10004b:	0f 86 87 00 00 00    	jbe    1000d8 <change_gdt+0xa4>
  100051:	83 fb 03             	cmp    $0x3,%ebx
  100054:	74 46                	je     10009c <change_gdt+0x68>
  100056:	83 fb 04             	cmp    $0x4,%ebx
  100059:	0f 85 b9 00 00 00    	jne    100118 <change_gdt+0xe4>
  10005f:	66 c7 05 c0 fb 12 01 	movw   $0xffff,0x112fbc0
  100066:	ff ff 
  100068:	66 a3 c2 fb 12 01    	mov    %ax,0x112fbc2
  10006e:	89 c2                	mov    %eax,%edx
  100070:	c1 ea 10             	shr    $0x10,%edx
  100073:	88 15 c4 fb 12 01    	mov    %dl,0x112fbc4
  100079:	c6 05 c5 fb 12 01 f2 	movb   $0xf2,0x112fbc5
  100080:	c6 05 c6 fb 12 01 cf 	movb   $0xcf,0x112fbc6
  100087:	c1 e8 18             	shr    $0x18,%eax
  10008a:	a2 c7 fb 12 01       	mov    %al,0x112fbc7
  10008f:	b8 01 00 00 00       	mov    $0x1,%eax
  100094:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100097:	c9                   	leave  
  100098:	c3                   	ret    
  100099:	8d 76 00             	lea    0x0(%esi),%esi
  10009c:	66 c7 05 b8 fb 12 01 	movw   $0xffff,0x112fbb8
  1000a3:	ff ff 
  1000a5:	66 a3 ba fb 12 01    	mov    %ax,0x112fbba
  1000ab:	89 c2                	mov    %eax,%edx
  1000ad:	c1 ea 10             	shr    $0x10,%edx
  1000b0:	88 15 bc fb 12 01    	mov    %dl,0x112fbbc
  1000b6:	c6 05 bd fb 12 01 fa 	movb   $0xfa,0x112fbbd
  1000bd:	c6 05 be fb 12 01 cf 	movb   $0xcf,0x112fbbe
  1000c4:	c1 e8 18             	shr    $0x18,%eax
  1000c7:	a2 bf fb 12 01       	mov    %al,0x112fbbf
  1000cc:	b8 01 00 00 00       	mov    $0x1,%eax
  1000d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000d4:	c9                   	leave  
  1000d5:	c3                   	ret    
  1000d6:	66 90                	xchg   %ax,%ax
  1000d8:	83 fb 01             	cmp    $0x1,%ebx
  1000db:	75 3b                	jne    100118 <change_gdt+0xe4>
  1000dd:	66 c7 05 a8 fb 12 01 	movw   $0xffff,0x112fba8
  1000e4:	ff ff 
  1000e6:	66 a3 aa fb 12 01    	mov    %ax,0x112fbaa
  1000ec:	89 c2                	mov    %eax,%edx
  1000ee:	c1 ea 10             	shr    $0x10,%edx
  1000f1:	88 15 ac fb 12 01    	mov    %dl,0x112fbac
  1000f7:	c6 05 ad fb 12 01 9a 	movb   $0x9a,0x112fbad
  1000fe:	c6 05 ae fb 12 01 cf 	movb   $0xcf,0x112fbae
  100105:	c1 e8 18             	shr    $0x18,%eax
  100108:	a2 af fb 12 01       	mov    %al,0x112fbaf
  10010d:	b8 01 00 00 00       	mov    $0x1,%eax
  100112:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100115:	c9                   	leave  
  100116:	c3                   	ret    
  100117:	90                   	nop
  100118:	83 ec 0c             	sub    $0xc,%esp
  10011b:	68 5c 17 10 00       	push   $0x10175c
  100120:	e8 03 14 00 00       	call   101528 <printk>
  100125:	89 1c 24             	mov    %ebx,(%esp)
  100128:	68 9c 17 10 00       	push   $0x10179c
  10012d:	6a 18                	push   $0x18
  10012f:	68 62 17 10 00       	push   $0x101762
  100134:	68 6f 17 10 00       	push   $0x10176f
  100139:	e8 ea 13 00 00       	call   101528 <printk>
  10013e:	83 c4 14             	add    $0x14,%esp
  100141:	68 8b 17 10 00       	push   $0x10178b
  100146:	e8 dd 13 00 00       	call   101528 <printk>
  10014b:	58                   	pop    %eax
  10014c:	5a                   	pop    %edx
  10014d:	6a 19                	push   $0x19
  10014f:	68 62 17 10 00       	push   $0x101762
  100154:	e8 43 15 00 00       	call   10169c <abort>
  100159:	83 c4 10             	add    $0x10,%esp
  10015c:	b8 01 00 00 00       	mov    $0x1,%eax
  100161:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100164:	c9                   	leave  
  100165:	c3                   	ret    
  100166:	66 90                	xchg   %ax,%ax
  100168:	66 c7 05 b0 fb 12 01 	movw   $0xffff,0x112fbb0
  10016f:	ff ff 
  100171:	66 a3 b2 fb 12 01    	mov    %ax,0x112fbb2
  100177:	89 c2                	mov    %eax,%edx
  100179:	c1 ea 10             	shr    $0x10,%edx
  10017c:	88 15 b4 fb 12 01    	mov    %dl,0x112fbb4
  100182:	c6 05 b5 fb 12 01 92 	movb   $0x92,0x112fbb5
  100189:	c6 05 b6 fb 12 01 cf 	movb   $0xcf,0x112fbb6
  100190:	c1 e8 18             	shr    $0x18,%eax
  100193:	a2 b7 fb 12 01       	mov    %al,0x112fbb7
  100198:	b8 01 00 00 00       	mov    $0x1,%eax
  10019d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1001a0:	c9                   	leave  
  1001a1:	c3                   	ret    
  1001a2:	66 90                	xchg   %ax,%ax

001001a4 <change_tss>:
  1001a4:	55                   	push   %ebp
  1001a5:	89 e5                	mov    %esp,%ebp
  1001a7:	8b 45 08             	mov    0x8(%ebp),%eax
  1001aa:	a3 e8 fb 12 01       	mov    %eax,0x112fbe8
  1001af:	8b 45 0c             	mov    0xc(%ebp),%eax
  1001b2:	a3 e4 fb 12 01       	mov    %eax,0x112fbe4
  1001b7:	b8 01 00 00 00       	mov    $0x1,%eax
  1001bc:	5d                   	pop    %ebp
  1001bd:	c3                   	ret    
  1001be:	66 90                	xchg   %ax,%ax

001001c0 <get_tss>:
  1001c0:	55                   	push   %ebp
  1001c1:	89 e5                	mov    %esp,%ebp
  1001c3:	57                   	push   %edi
  1001c4:	56                   	push   %esi
  1001c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1001c8:	be e0 fb 12 01       	mov    $0x112fbe0,%esi
  1001cd:	b9 19 00 00 00       	mov    $0x19,%ecx
  1001d2:	89 c7                	mov    %eax,%edi
  1001d4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1001d6:	5e                   	pop    %esi
  1001d7:	5f                   	pop    %edi
  1001d8:	5d                   	pop    %ebp
  1001d9:	c2 04 00             	ret    $0x4

001001dc <waitDisk>:
  1001dc:	55                   	push   %ebp
  1001dd:	89 e5                	mov    %esp,%ebp
  1001df:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1001e4:	ec                   	in     (%dx),%al
  1001e5:	83 e0 c0             	and    $0xffffffc0,%eax
  1001e8:	3c 40                	cmp    $0x40,%al
  1001ea:	75 f8                	jne    1001e4 <waitDisk+0x8>
  1001ec:	5d                   	pop    %ebp
  1001ed:	c3                   	ret    
  1001ee:	66 90                	xchg   %ax,%ax

001001f0 <readSect>:
  1001f0:	55                   	push   %ebp
  1001f1:	89 e5                	mov    %esp,%ebp
  1001f3:	53                   	push   %ebx
  1001f4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1001f7:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1001fc:	ec                   	in     (%dx),%al
  1001fd:	83 e0 c0             	and    $0xffffffc0,%eax
  100200:	3c 40                	cmp    $0x40,%al
  100202:	75 f8                	jne    1001fc <readSect+0xc>
  100204:	ba f2 01 00 00       	mov    $0x1f2,%edx
  100209:	b0 01                	mov    $0x1,%al
  10020b:	ee                   	out    %al,(%dx)
  10020c:	ba f3 01 00 00       	mov    $0x1f3,%edx
  100211:	88 c8                	mov    %cl,%al
  100213:	ee                   	out    %al,(%dx)
  100214:	89 c8                	mov    %ecx,%eax
  100216:	c1 f8 08             	sar    $0x8,%eax
  100219:	ba f4 01 00 00       	mov    $0x1f4,%edx
  10021e:	ee                   	out    %al,(%dx)
  10021f:	89 c8                	mov    %ecx,%eax
  100221:	c1 f8 10             	sar    $0x10,%eax
  100224:	ba f5 01 00 00       	mov    $0x1f5,%edx
  100229:	ee                   	out    %al,(%dx)
  10022a:	89 c8                	mov    %ecx,%eax
  10022c:	c1 f8 18             	sar    $0x18,%eax
  10022f:	83 c8 e0             	or     $0xffffffe0,%eax
  100232:	ba f6 01 00 00       	mov    $0x1f6,%edx
  100237:	ee                   	out    %al,(%dx)
  100238:	ba f7 01 00 00       	mov    $0x1f7,%edx
  10023d:	b0 20                	mov    $0x20,%al
  10023f:	ee                   	out    %al,(%dx)
  100240:	ec                   	in     (%dx),%al
  100241:	83 e0 c0             	and    $0xffffffc0,%eax
  100244:	3c 40                	cmp    $0x40,%al
  100246:	75 f8                	jne    100240 <readSect+0x50>
  100248:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10024b:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  100251:	ba f0 01 00 00       	mov    $0x1f0,%edx
  100256:	66 90                	xchg   %ax,%ax
  100258:	ed                   	in     (%dx),%eax
  100259:	89 01                	mov    %eax,(%ecx)
  10025b:	83 c1 04             	add    $0x4,%ecx
  10025e:	39 d9                	cmp    %ebx,%ecx
  100260:	75 f6                	jne    100258 <readSect+0x68>
  100262:	5b                   	pop    %ebx
  100263:	5d                   	pop    %ebp
  100264:	c3                   	ret    
  100265:	8d 76 00             	lea    0x0(%esi),%esi

00100268 <initSeg>:
  100268:	55                   	push   %ebp
  100269:	89 e5                	mov    %esp,%ebp
  10026b:	b9 a0 fb 12 01       	mov    $0x112fba0,%ecx
  100270:	66 c7 05 a8 fb 12 01 	movw   $0xffff,0x112fba8
  100277:	ff ff 
  100279:	66 c7 05 aa fb 12 01 	movw   $0x0,0x112fbaa
  100280:	00 00 
  100282:	c6 05 ac fb 12 01 00 	movb   $0x0,0x112fbac
  100289:	c6 05 ad fb 12 01 9a 	movb   $0x9a,0x112fbad
  100290:	c6 05 ae fb 12 01 cf 	movb   $0xcf,0x112fbae
  100297:	c6 05 af fb 12 01 00 	movb   $0x0,0x112fbaf
  10029e:	66 c7 05 b0 fb 12 01 	movw   $0xffff,0x112fbb0
  1002a5:	ff ff 
  1002a7:	66 c7 05 b2 fb 12 01 	movw   $0x0,0x112fbb2
  1002ae:	00 00 
  1002b0:	c6 05 b4 fb 12 01 00 	movb   $0x0,0x112fbb4
  1002b7:	c6 05 b5 fb 12 01 92 	movb   $0x92,0x112fbb5
  1002be:	c6 05 b6 fb 12 01 cf 	movb   $0xcf,0x112fbb6
  1002c5:	c6 05 b7 fb 12 01 00 	movb   $0x0,0x112fbb7
  1002cc:	66 c7 05 b8 fb 12 01 	movw   $0xffff,0x112fbb8
  1002d3:	ff ff 
  1002d5:	66 c7 05 ba fb 12 01 	movw   $0x0,0x112fbba
  1002dc:	00 00 
  1002de:	c6 05 bc fb 12 01 00 	movb   $0x0,0x112fbbc
  1002e5:	c6 05 bd fb 12 01 fa 	movb   $0xfa,0x112fbbd
  1002ec:	c6 05 be fb 12 01 cf 	movb   $0xcf,0x112fbbe
  1002f3:	c6 05 bf fb 12 01 00 	movb   $0x0,0x112fbbf
  1002fa:	66 c7 05 c0 fb 12 01 	movw   $0xffff,0x112fbc0
  100301:	ff ff 
  100303:	66 c7 05 c2 fb 12 01 	movw   $0x0,0x112fbc2
  10030a:	00 00 
  10030c:	c6 05 c4 fb 12 01 00 	movb   $0x0,0x112fbc4
  100313:	c6 05 c5 fb 12 01 f2 	movb   $0xf2,0x112fbc5
  10031a:	c6 05 c6 fb 12 01 cf 	movb   $0xcf,0x112fbc6
  100321:	c6 05 c7 fb 12 01 00 	movb   $0x0,0x112fbc7
  100328:	66 c7 05 c8 fb 12 01 	movw   $0x63,0x112fbc8
  10032f:	63 00 
  100331:	b8 e0 fb 12 01       	mov    $0x112fbe0,%eax
  100336:	66 a3 ca fb 12 01    	mov    %ax,0x112fbca
  10033c:	89 c2                	mov    %eax,%edx
  10033e:	c1 ea 10             	shr    $0x10,%edx
  100341:	88 15 cc fb 12 01    	mov    %dl,0x112fbcc
  100347:	c6 05 cd fb 12 01 89 	movb   $0x89,0x112fbcd
  10034e:	c6 05 ce fb 12 01 40 	movb   $0x40,0x112fbce
  100355:	c1 e8 18             	shr    $0x18,%eax
  100358:	a2 cf fb 12 01       	mov    %al,0x112fbcf
  10035d:	a1 94 17 10 00       	mov    0x101794,%eax
  100362:	8b 15 98 17 10 00    	mov    0x101798,%edx
  100368:	a3 d0 fb 12 01       	mov    %eax,0x112fbd0
  10036d:	89 15 d4 fb 12 01    	mov    %edx,0x112fbd4
  100373:	66 c7 05 00 33 10 00 	movw   $0x37,0x103300
  10037a:	37 00 
  10037c:	66 89 0d 02 33 10 00 	mov    %cx,0x103302
  100383:	c1 e9 10             	shr    $0x10,%ecx
  100386:	66 89 0d 04 33 10 00 	mov    %cx,0x103304
  10038d:	b8 00 33 10 00       	mov    $0x103300,%eax
  100392:	0f 01 10             	lgdtl  (%eax)
  100395:	a1 d8 5b 10 00       	mov    0x105bd8,%eax
  10039a:	a3 e8 fb 12 01       	mov    %eax,0x112fbe8
  10039f:	c7 05 e4 fb 12 01 9c 	movl   $0x105b9c,0x112fbe4
  1003a6:	5b 10 00 
  1003a9:	b8 28 00 00 00       	mov    $0x28,%eax
  1003ae:	0f 00 d8             	ltr    %ax
  1003b1:	b8 10 00 00 00       	mov    $0x10,%eax
  1003b6:	89 c0                	mov    %eax,%eax
  1003b8:	8e d8                	mov    %eax,%ds
  1003ba:	8e e0                	mov    %eax,%fs
  1003bc:	8e c0                	mov    %eax,%es
  1003be:	8e d0                	mov    %eax,%ss
  1003c0:	b8 30 00 00 00       	mov    $0x30,%eax
  1003c5:	89 c0                	mov    %eax,%eax
  1003c7:	8e e8                	mov    %eax,%gs
  1003c9:	31 c0                	xor    %eax,%eax
  1003cb:	0f 00 d0             	lldt   %ax
  1003ce:	5d                   	pop    %ebp
  1003cf:	c3                   	ret    

001003d0 <enterUserSpace_pcb>:
  1003d0:	55                   	push   %ebp
  1003d1:	89 e5                	mov    %esp,%ebp
  1003d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1003d6:	89 c2                	mov    %eax,%edx
  1003d8:	c1 e2 07             	shl    $0x7,%edx
  1003db:	01 c2                	add    %eax,%edx
  1003dd:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1003e0:	01 d2                	add    %edx,%edx
  1003e2:	01 d0                	add    %edx,%eax
  1003e4:	8d 04 c5 a0 3b 10 00 	lea    0x103ba0(,%eax,8),%eax
  1003eb:	8b 90 38 20 00 00    	mov    0x2038(%eax),%edx
  1003f1:	52                   	push   %edx
  1003f2:	8b 90 34 20 00 00    	mov    0x2034(%eax),%edx
  1003f8:	52                   	push   %edx
  1003f9:	9c                   	pushf  
  1003fa:	8b 90 2c 20 00 00    	mov    0x202c(%eax),%edx
  100400:	52                   	push   %edx
  100401:	8b 80 28 20 00 00    	mov    0x2028(%eax),%eax
  100407:	50                   	push   %eax
  100408:	cf                   	iret   
  100409:	5d                   	pop    %ebp
  10040a:	c3                   	ret    
  10040b:	90                   	nop

0010040c <enterUserSpace>:
  10040c:	55                   	push   %ebp
  10040d:	89 e5                	mov    %esp,%ebp
  10040f:	83 ec 10             	sub    $0x10,%esp
  100412:	c7 05 84 3b 10 00 01 	movl   $0x1,0x103b84
  100419:	00 00 00 
  10041c:	c7 05 30 7c 10 00 23 	movl   $0x23,0x107c30
  100423:	00 00 00 
  100426:	c7 05 2c 7c 10 00 00 	movl   $0x20000,0x107c2c
  10042d:	00 02 00 
  100430:	c7 05 24 7c 10 00 1b 	movl   $0x1b,0x107c24
  100437:	00 00 00 
  10043a:	8b 45 08             	mov    0x8(%ebp),%eax
  10043d:	a3 20 7c 10 00       	mov    %eax,0x107c20
  100442:	c7 05 38 7c 10 00 0a 	movl   $0xa,0x107c38
  100449:	00 00 00 
  10044c:	6a 00                	push   $0x0
  10044e:	6a 01                	push   $0x1
  100450:	e8 7f 05 00 00       	call   1009d4 <put_into_runnable>
  100455:	bc 00 30 00 00       	mov    $0x3000,%esp
  10045a:	a1 d8 5b 10 00       	mov    0x105bd8,%eax
  10045f:	50                   	push   %eax
  100460:	a1 d4 5b 10 00       	mov    0x105bd4,%eax
  100465:	50                   	push   %eax
  100466:	9c                   	pushf  
  100467:	a1 cc 5b 10 00       	mov    0x105bcc,%eax
  10046c:	50                   	push   %eax
  10046d:	a1 c8 5b 10 00       	mov    0x105bc8,%eax
  100472:	50                   	push   %eax
  100473:	cf                   	iret   
  100474:	83 c4 10             	add    $0x10,%esp
  100477:	c9                   	leave  
  100478:	c3                   	ret    
  100479:	8d 76 00             	lea    0x0(%esi),%esi

0010047c <loadUMain>:
  10047c:	55                   	push   %ebp
  10047d:	89 e5                	mov    %esp,%ebp
  10047f:	57                   	push   %edi
  100480:	56                   	push   %esi
  100481:	53                   	push   %ebx
  100482:	83 ec 0c             	sub    $0xc,%esp
  100485:	bb c9 00 00 00       	mov    $0xc9,%ebx
  10048a:	be 00 00 03 00       	mov    $0x30000,%esi
  10048f:	90                   	nop
  100490:	53                   	push   %ebx
  100491:	56                   	push   %esi
  100492:	e8 59 fd ff ff       	call   1001f0 <readSect>
  100497:	81 c6 00 02 00 00    	add    $0x200,%esi
  10049d:	43                   	inc    %ebx
  10049e:	58                   	pop    %eax
  10049f:	5a                   	pop    %edx
  1004a0:	81 fb 91 01 00 00    	cmp    $0x191,%ebx
  1004a6:	75 e8                	jne    100490 <loadUMain+0x14>
  1004a8:	a1 1c 00 03 00       	mov    0x3001c,%eax
  1004ad:	8d 90 00 00 03 00    	lea    0x30000(%eax),%edx
  1004b3:	0f b7 35 2c 00 03 00 	movzwl 0x3002c,%esi
  1004ba:	c1 e6 05             	shl    $0x5,%esi
  1004bd:	01 d6                	add    %edx,%esi
  1004bf:	39 f2                	cmp    %esi,%edx
  1004c1:	72 0c                	jb     1004cf <loadUMain+0x53>
  1004c3:	eb 53                	jmp    100518 <loadUMain+0x9c>
  1004c5:	8d 76 00             	lea    0x0(%esi),%esi
  1004c8:	83 c2 20             	add    $0x20,%edx
  1004cb:	39 d6                	cmp    %edx,%esi
  1004cd:	76 49                	jbe    100518 <loadUMain+0x9c>
  1004cf:	83 3a 01             	cmpl   $0x1,(%edx)
  1004d2:	75 f4                	jne    1004c8 <loadUMain+0x4c>
  1004d4:	8b 42 08             	mov    0x8(%edx),%eax
  1004d7:	8b 7a 10             	mov    0x10(%edx),%edi
  1004da:	8b 5a 04             	mov    0x4(%edx),%ebx
  1004dd:	29 c3                	sub    %eax,%ebx
  1004df:	31 c9                	xor    %ecx,%ecx
  1004e1:	85 ff                	test   %edi,%edi
  1004e3:	74 16                	je     1004fb <loadUMain+0x7f>
  1004e5:	8d 76 00             	lea    0x0(%esi),%esi
  1004e8:	8a 8c 03 00 00 03 00 	mov    0x30000(%ebx,%eax,1),%cl
  1004ef:	88 08                	mov    %cl,(%eax)
  1004f1:	40                   	inc    %eax
  1004f2:	89 c1                	mov    %eax,%ecx
  1004f4:	2b 4a 08             	sub    0x8(%edx),%ecx
  1004f7:	39 cf                	cmp    %ecx,%edi
  1004f9:	77 ed                	ja     1004e8 <loadUMain+0x6c>
  1004fb:	8b 5a 14             	mov    0x14(%edx),%ebx
  1004fe:	39 cb                	cmp    %ecx,%ebx
  100500:	76 c6                	jbe    1004c8 <loadUMain+0x4c>
  100502:	66 90                	xchg   %ax,%ax
  100504:	c6 00 00             	movb   $0x0,(%eax)
  100507:	40                   	inc    %eax
  100508:	89 c1                	mov    %eax,%ecx
  10050a:	2b 4a 08             	sub    0x8(%edx),%ecx
  10050d:	39 cb                	cmp    %ecx,%ebx
  10050f:	77 f3                	ja     100504 <loadUMain+0x88>
  100511:	83 c2 20             	add    $0x20,%edx
  100514:	39 d6                	cmp    %edx,%esi
  100516:	77 b7                	ja     1004cf <loadUMain+0x53>
  100518:	83 ec 0c             	sub    $0xc,%esp
  10051b:	ff 35 18 00 03 00    	pushl  0x30018
  100521:	e8 e6 fe ff ff       	call   10040c <enterUserSpace>
  100526:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100529:	5b                   	pop    %ebx
  10052a:	5e                   	pop    %esi
  10052b:	5f                   	pop    %edi
  10052c:	5d                   	pop    %ebp
  10052d:	c3                   	ret    
  10052e:	66 90                	xchg   %ax,%ax

00100530 <sys_exit>:
  100530:	55                   	push   %ebp
  100531:	89 e5                	mov    %esp,%ebp
  100533:	83 ec 14             	sub    $0x14,%esp
  100536:	68 a7 17 10 00       	push   $0x1017a7
  10053b:	e8 e8 0f 00 00       	call   101528 <printk>
  100540:	e8 cf 03 00 00       	call   100914 <get_from_runnable>
  100545:	5a                   	pop    %edx
  100546:	59                   	pop    %ecx
  100547:	ff 75 08             	pushl  0x8(%ebp)
  10054a:	50                   	push   %eax
  10054b:	e8 88 02 00 00       	call   1007d8 <put_into_running>
  100550:	b8 01 00 00 00       	mov    $0x1,%eax
  100555:	c9                   	leave  
  100556:	c3                   	ret    
  100557:	90                   	nop

00100558 <sys_sleep>:
  100558:	55                   	push   %ebp
  100559:	89 e5                	mov    %esp,%ebp
  10055b:	56                   	push   %esi
  10055c:	53                   	push   %ebx
  10055d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100560:	e8 7f 03 00 00       	call   1008e4 <getpid>
  100565:	83 ec 08             	sub    $0x8,%esp
  100568:	53                   	push   %ebx
  100569:	50                   	push   %eax
  10056a:	e8 99 05 00 00       	call   100b08 <put_into_block>
  10056f:	c7 04 24 5c 17 10 00 	movl   $0x10175c,(%esp)
  100576:	e8 ad 0f 00 00       	call   101528 <printk>
  10057b:	e8 64 03 00 00       	call   1008e4 <getpid>
  100580:	89 c2                	mov    %eax,%edx
  100582:	c1 e2 07             	shl    $0x7,%edx
  100585:	01 c2                	add    %eax,%edx
  100587:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10058a:	01 d2                	add    %edx,%edx
  10058c:	01 d0                	add    %edx,%eax
  10058e:	8b 34 c5 e4 5b 10 00 	mov    0x105be4(,%eax,8),%esi
  100595:	e8 4a 03 00 00       	call   1008e4 <getpid>
  10059a:	5a                   	pop    %edx
  10059b:	59                   	pop    %ecx
  10059c:	56                   	push   %esi
  10059d:	50                   	push   %eax
  10059e:	68 f8 17 10 00       	push   $0x1017f8
  1005a3:	6a 09                	push   $0x9
  1005a5:	68 b5 17 10 00       	push   $0x1017b5
  1005aa:	68 d4 17 10 00       	push   $0x1017d4
  1005af:	e8 74 0f 00 00       	call   101528 <printk>
  1005b4:	83 c4 14             	add    $0x14,%esp
  1005b7:	68 8b 17 10 00       	push   $0x10178b
  1005bc:	e8 67 0f 00 00       	call   101528 <printk>
  1005c1:	e8 4e 03 00 00       	call   100914 <get_from_runnable>
  1005c6:	5e                   	pop    %esi
  1005c7:	5a                   	pop    %edx
  1005c8:	53                   	push   %ebx
  1005c9:	50                   	push   %eax
  1005ca:	e8 09 02 00 00       	call   1007d8 <put_into_running>
  1005cf:	b8 01 00 00 00       	mov    $0x1,%eax
  1005d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1005d7:	5b                   	pop    %ebx
  1005d8:	5e                   	pop    %esi
  1005d9:	5d                   	pop    %ebp
  1005da:	c3                   	ret    
  1005db:	90                   	nop

001005dc <sys_fork>:
  1005dc:	55                   	push   %ebp
  1005dd:	89 e5                	mov    %esp,%ebp
  1005df:	57                   	push   %edi
  1005e0:	56                   	push   %esi
  1005e1:	8b 75 08             	mov    0x8(%ebp),%esi
  1005e4:	83 ec 0c             	sub    $0xc,%esp
  1005e7:	68 02 18 10 00       	push   $0x101802
  1005ec:	e8 37 0f 00 00       	call   101528 <printk>
  1005f1:	b8 50 9c 10 00       	mov    $0x109c50,%eax
  1005f6:	b9 0f 00 00 00       	mov    $0xf,%ecx
  1005fb:	89 c7                	mov    %eax,%edi
  1005fd:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1005ff:	c7 05 6c 9c 10 00 00 	movl   $0x0,0x109c6c
  100606:	00 00 00 
  100609:	c7 05 84 9c 10 00 00 	movl   $0x7e00000,0x109c84
  100610:	00 e0 07 
  100613:	5a                   	pop    %edx
  100614:	59                   	pop    %ecx
  100615:	50                   	push   %eax
  100616:	6a 02                	push   $0x2
  100618:	e8 b7 03 00 00       	call   1009d4 <put_into_runnable>
  10061d:	b8 02 00 00 00       	mov    $0x2,%eax
  100622:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100625:	5e                   	pop    %esi
  100626:	5f                   	pop    %edi
  100627:	5d                   	pop    %ebp
  100628:	c3                   	ret    
  100629:	66 90                	xchg   %ax,%ax
  10062b:	90                   	nop

0010062c <display>:
  10062c:	55                   	push   %ebp
  10062d:	89 e5                	mov    %esp,%ebp
  10062f:	57                   	push   %edi
  100630:	53                   	push   %ebx
  100631:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100634:	80 fb 0a             	cmp    $0xa,%bl
  100637:	74 5b                	je     100694 <display+0x68>
  100639:	8b 15 08 33 10 00    	mov    0x103308,%edx
  10063f:	8b 0d 0c 33 10 00    	mov    0x10330c,%ecx
  100645:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  100648:	c1 e0 04             	shl    $0x4,%eax
  10064b:	01 d0                	add    %edx,%eax
  10064d:	01 c0                	add    %eax,%eax
  10064f:	89 c7                	mov    %eax,%edi
  100651:	0f be db             	movsbl %bl,%ebx
  100654:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
  10065a:	66 89 d8             	mov    %bx,%ax
  10065d:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100661:	42                   	inc    %edx
  100662:	83 fa 50             	cmp    $0x50,%edx
  100665:	75 1d                	jne    100684 <display+0x58>
  100667:	c7 05 08 33 10 00 00 	movl   $0x0,0x103308
  10066e:	00 00 00 
  100671:	41                   	inc    %ecx
  100672:	89 0d 0c 33 10 00    	mov    %ecx,0x10330c
  100678:	b8 01 00 00 00       	mov    $0x1,%eax
  10067d:	5b                   	pop    %ebx
  10067e:	5f                   	pop    %edi
  10067f:	5d                   	pop    %ebp
  100680:	c3                   	ret    
  100681:	8d 76 00             	lea    0x0(%esi),%esi
  100684:	89 15 08 33 10 00    	mov    %edx,0x103308
  10068a:	b8 01 00 00 00       	mov    $0x1,%eax
  10068f:	5b                   	pop    %ebx
  100690:	5f                   	pop    %edi
  100691:	5d                   	pop    %ebp
  100692:	c3                   	ret    
  100693:	90                   	nop
  100694:	c7 05 08 33 10 00 00 	movl   $0x0,0x103308
  10069b:	00 00 00 
  10069e:	ff 05 0c 33 10 00    	incl   0x10330c
  1006a4:	b8 01 00 00 00       	mov    $0x1,%eax
  1006a9:	5b                   	pop    %ebx
  1006aa:	5f                   	pop    %edi
  1006ab:	5d                   	pop    %ebp
  1006ac:	c3                   	ret    
  1006ad:	8d 76 00             	lea    0x0(%esi),%esi

001006b0 <printkernel>:
  1006b0:	55                   	push   %ebp
  1006b1:	89 e5                	mov    %esp,%ebp
  1006b3:	53                   	push   %ebx
  1006b4:	50                   	push   %eax
  1006b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1006b8:	0f be 03             	movsbl (%ebx),%eax
  1006bb:	84 c0                	test   %al,%al
  1006bd:	74 20                	je     1006df <printkernel+0x2f>
  1006bf:	90                   	nop
  1006c0:	83 ec 0c             	sub    $0xc,%esp
  1006c3:	50                   	push   %eax
  1006c4:	e8 eb 00 00 00       	call   1007b4 <putChar>
  1006c9:	0f be 03             	movsbl (%ebx),%eax
  1006cc:	89 04 24             	mov    %eax,(%esp)
  1006cf:	e8 58 ff ff ff       	call   10062c <display>
  1006d4:	43                   	inc    %ebx
  1006d5:	0f be 03             	movsbl (%ebx),%eax
  1006d8:	83 c4 10             	add    $0x10,%esp
  1006db:	84 c0                	test   %al,%al
  1006dd:	75 e1                	jne    1006c0 <printkernel+0x10>
  1006df:	b8 01 00 00 00       	mov    $0x1,%eax
  1006e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1006e7:	c9                   	leave  
  1006e8:	c3                   	ret    
  1006e9:	8d 76 00             	lea    0x0(%esi),%esi

001006ec <fs_write>:
  1006ec:	55                   	push   %ebp
  1006ed:	89 e5                	mov    %esp,%ebp
  1006ef:	53                   	push   %ebx
  1006f0:	50                   	push   %eax
  1006f1:	8b 5d 10             	mov    0x10(%ebp),%ebx
  1006f4:	ba 30 00 00 00       	mov    $0x30,%edx
  1006f9:	89 d0                	mov    %edx,%eax
  1006fb:	8e e8                	mov    %eax,%gs
  1006fd:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  100701:	74 12                	je     100715 <fs_write+0x29>
  100703:	83 ec 08             	sub    $0x8,%esp
  100706:	6a 27                	push   $0x27
  100708:	68 1e 18 10 00       	push   $0x10181e
  10070d:	e8 8a 0f 00 00       	call   10169c <abort>
  100712:	83 c4 10             	add    $0x10,%esp
  100715:	83 ec 08             	sub    $0x8,%esp
  100718:	53                   	push   %ebx
  100719:	ff 75 0c             	pushl  0xc(%ebp)
  10071c:	e8 8f ff ff ff       	call   1006b0 <printkernel>
  100721:	89 d8                	mov    %ebx,%eax
  100723:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100726:	c9                   	leave  
  100727:	c3                   	ret    

00100728 <sys_write>:
  100728:	55                   	push   %ebp
  100729:	89 e5                	mov    %esp,%ebp
  10072b:	53                   	push   %ebx
  10072c:	83 ec 08             	sub    $0x8,%esp
  10072f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100732:	ff 73 14             	pushl  0x14(%ebx)
  100735:	ff 73 18             	pushl  0x18(%ebx)
  100738:	ff 73 10             	pushl  0x10(%ebx)
  10073b:	e8 ac ff ff ff       	call   1006ec <fs_write>
  100740:	89 43 1c             	mov    %eax,0x1c(%ebx)
  100743:	83 c4 10             	add    $0x10,%esp
  100746:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100749:	c9                   	leave  
  10074a:	c3                   	ret    
  10074b:	90                   	nop

0010074c <print_char>:
  10074c:	55                   	push   %ebp
  10074d:	89 e5                	mov    %esp,%ebp
  10074f:	57                   	push   %edi
  100750:	8b 45 08             	mov    0x8(%ebp),%eax
  100753:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100756:	c1 e0 04             	shl    $0x4,%eax
  100759:	03 45 0c             	add    0xc(%ebp),%eax
  10075c:	01 c0                	add    %eax,%eax
  10075e:	89 c7                	mov    %eax,%edi
  100760:	0f be 55 10          	movsbl 0x10(%ebp),%edx
  100764:	81 c2 00 0c 00 00    	add    $0xc00,%edx
  10076a:	66 89 d0             	mov    %dx,%ax
  10076d:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100771:	5f                   	pop    %edi
  100772:	5d                   	pop    %ebp
  100773:	c3                   	ret    

00100774 <initSerial>:
  100774:	55                   	push   %ebp
  100775:	89 e5                	mov    %esp,%ebp
  100777:	ba f9 03 00 00       	mov    $0x3f9,%edx
  10077c:	31 c0                	xor    %eax,%eax
  10077e:	ee                   	out    %al,(%dx)
  10077f:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100784:	b0 80                	mov    $0x80,%al
  100786:	ee                   	out    %al,(%dx)
  100787:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10078c:	b0 01                	mov    $0x1,%al
  10078e:	ee                   	out    %al,(%dx)
  10078f:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100794:	31 c0                	xor    %eax,%eax
  100796:	ee                   	out    %al,(%dx)
  100797:	ba fb 03 00 00       	mov    $0x3fb,%edx
  10079c:	b0 03                	mov    $0x3,%al
  10079e:	ee                   	out    %al,(%dx)
  10079f:	ba fa 03 00 00       	mov    $0x3fa,%edx
  1007a4:	b0 c7                	mov    $0xc7,%al
  1007a6:	ee                   	out    %al,(%dx)
  1007a7:	ba fc 03 00 00       	mov    $0x3fc,%edx
  1007ac:	b0 0b                	mov    $0xb,%al
  1007ae:	ee                   	out    %al,(%dx)
  1007af:	5d                   	pop    %ebp
  1007b0:	c3                   	ret    
  1007b1:	8d 76 00             	lea    0x0(%esi),%esi

001007b4 <putChar>:
  1007b4:	55                   	push   %ebp
  1007b5:	89 e5                	mov    %esp,%ebp
  1007b7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1007ba:	ba fd 03 00 00       	mov    $0x3fd,%edx
  1007bf:	90                   	nop
  1007c0:	ec                   	in     (%dx),%al
  1007c1:	a8 20                	test   $0x20,%al
  1007c3:	74 fb                	je     1007c0 <putChar+0xc>
  1007c5:	ba f8 03 00 00       	mov    $0x3f8,%edx
  1007ca:	88 c8                	mov    %cl,%al
  1007cc:	ee                   	out    %al,(%dx)
  1007cd:	5d                   	pop    %ebp
  1007ce:	c3                   	ret    
  1007cf:	90                   	nop

001007d0 <IDLE>:
  1007d0:	55                   	push   %ebp
  1007d1:	89 e5                	mov    %esp,%ebp
  1007d3:	90                   	nop
  1007d4:	f4                   	hlt    
  1007d5:	eb fd                	jmp    1007d4 <IDLE+0x4>
  1007d7:	90                   	nop

001007d8 <put_into_running>:
  1007d8:	55                   	push   %ebp
  1007d9:	89 e5                	mov    %esp,%ebp
  1007db:	56                   	push   %esi
  1007dc:	53                   	push   %ebx
  1007dd:	81 ec d0 00 00 00    	sub    $0xd0,%esp
  1007e3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1007e6:	39 1d 80 3b 10 00    	cmp    %ebx,0x103b80
  1007ec:	0f 84 89 00 00 00    	je     10087b <put_into_running+0xa3>
  1007f2:	89 1d 80 3b 10 00    	mov    %ebx,0x103b80
  1007f8:	85 db                	test   %ebx,%ebx
  1007fa:	0f 84 88 00 00 00    	je     100888 <put_into_running+0xb0>
  100800:	89 d8                	mov    %ebx,%eax
  100802:	c1 e0 07             	shl    $0x7,%eax
  100805:	01 d8                	add    %ebx,%eax
  100807:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  10080a:	01 c0                	add    %eax,%eax
  10080c:	01 d8                	add    %ebx,%eax
  10080e:	8d 34 c5 9c 5b 10 00 	lea    0x105b9c(,%eax,8),%esi
  100815:	83 ec 08             	sub    $0x8,%esp
  100818:	56                   	push   %esi
  100819:	6a 10                	push   $0x10
  10081b:	e8 84 f9 ff ff       	call   1001a4 <change_tss>
  100820:	8d 45 94             	lea    -0x6c(%ebp),%eax
  100823:	89 04 24             	mov    %eax,(%esp)
  100826:	e8 95 f9 ff ff       	call   1001c0 <get_tss>
  10082b:	83 c4 0c             	add    $0xc,%esp
  10082e:	3b 75 98             	cmp    -0x68(%ebp),%esi
  100831:	74 12                	je     100845 <put_into_running+0x6d>
  100833:	83 ec 08             	sub    $0x8,%esp
  100836:	6a 21                	push   $0x21
  100838:	68 3a 18 10 00       	push   $0x10183a
  10083d:	e8 5a 0e 00 00       	call   10169c <abort>
  100842:	83 c4 10             	add    $0x10,%esp
  100845:	83 ec 0c             	sub    $0xc,%esp
  100848:	68 5c 17 10 00       	push   $0x10175c
  10084d:	e8 d6 0c 00 00       	call   101528 <printk>
  100852:	89 1c 24             	mov    %ebx,(%esp)
  100855:	68 3c 19 10 00       	push   $0x10193c
  10085a:	6a 24                	push   $0x24
  10085c:	68 3a 18 10 00       	push   $0x10183a
  100861:	68 48 18 10 00       	push   $0x101848
  100866:	e8 bd 0c 00 00       	call   101528 <printk>
  10086b:	83 c4 14             	add    $0x14,%esp
  10086e:	68 8b 17 10 00       	push   $0x10178b
  100873:	e8 b0 0c 00 00       	call   101528 <printk>
  100878:	83 c4 10             	add    $0x10,%esp
  10087b:	b8 01 00 00 00       	mov    $0x1,%eax
  100880:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100883:	5b                   	pop    %ebx
  100884:	5e                   	pop    %esi
  100885:	5d                   	pop    %ebp
  100886:	c3                   	ret    
  100887:	90                   	nop
  100888:	83 ec 08             	sub    $0x8,%esp
  10088b:	68 9c 5b 10 00       	push   $0x105b9c
  100890:	6a 10                	push   $0x10
  100892:	e8 0d f9 ff ff       	call   1001a4 <change_tss>
  100897:	8d 85 30 ff ff ff    	lea    -0xd0(%ebp),%eax
  10089d:	89 04 24             	mov    %eax,(%esp)
  1008a0:	e8 1b f9 ff ff       	call   1001c0 <get_tss>
  1008a5:	83 c4 0c             	add    $0xc,%esp
  1008a8:	81 bd 34 ff ff ff 9c 	cmpl   $0x105b9c,-0xcc(%ebp)
  1008af:	5b 10 00 
  1008b2:	74 91                	je     100845 <put_into_running+0x6d>
  1008b4:	83 ec 08             	sub    $0x8,%esp
  1008b7:	6a 19                	push   $0x19
  1008b9:	68 3a 18 10 00       	push   $0x10183a
  1008be:	e8 d9 0d 00 00       	call   10169c <abort>
  1008c3:	83 c4 10             	add    $0x10,%esp
  1008c6:	e9 7a ff ff ff       	jmp    100845 <put_into_running+0x6d>
  1008cb:	90                   	nop

001008cc <update_block>:
  1008cc:	55                   	push   %ebp
  1008cd:	89 e5                	mov    %esp,%ebp
  1008cf:	b8 01 00 00 00       	mov    $0x1,%eax
  1008d4:	5d                   	pop    %ebp
  1008d5:	c3                   	ret    
  1008d6:	66 90                	xchg   %ax,%ax

001008d8 <apply_new_pid>:
  1008d8:	55                   	push   %ebp
  1008d9:	89 e5                	mov    %esp,%ebp
  1008db:	b8 02 00 00 00       	mov    $0x2,%eax
  1008e0:	5d                   	pop    %ebp
  1008e1:	c3                   	ret    
  1008e2:	66 90                	xchg   %ax,%ax

001008e4 <getpid>:
  1008e4:	55                   	push   %ebp
  1008e5:	89 e5                	mov    %esp,%ebp
  1008e7:	a1 80 3b 10 00       	mov    0x103b80,%eax
  1008ec:	5d                   	pop    %ebp
  1008ed:	c3                   	ret    
  1008ee:	66 90                	xchg   %ax,%ax

001008f0 <getrunnable>:
  1008f0:	55                   	push   %ebp
  1008f1:	89 e5                	mov    %esp,%ebp
  1008f3:	a1 e4 31 10 00       	mov    0x1031e4,%eax
  1008f8:	5d                   	pop    %ebp
  1008f9:	c3                   	ret    
  1008fa:	66 90                	xchg   %ax,%ax

001008fc <getblocked>:
  1008fc:	55                   	push   %ebp
  1008fd:	89 e5                	mov    %esp,%ebp
  1008ff:	a1 e0 31 10 00       	mov    0x1031e0,%eax
  100904:	5d                   	pop    %ebp
  100905:	c3                   	ret    
  100906:	66 90                	xchg   %ax,%ax

00100908 <transfer_pid_mode>:
  100908:	55                   	push   %ebp
  100909:	89 e5                	mov    %esp,%ebp
  10090b:	b8 01 00 00 00       	mov    $0x1,%eax
  100910:	5d                   	pop    %ebp
  100911:	c3                   	ret    
  100912:	66 90                	xchg   %ax,%ax

00100914 <get_from_runnable>:
  100914:	55                   	push   %ebp
  100915:	89 e5                	mov    %esp,%ebp
  100917:	53                   	push   %ebx
  100918:	51                   	push   %ecx
  100919:	8b 1d e4 31 10 00    	mov    0x1031e4,%ebx
  10091f:	83 fb ff             	cmp    $0xffffffff,%ebx
  100922:	0f 84 a4 00 00 00    	je     1009cc <get_from_runnable+0xb8>
  100928:	89 d8                	mov    %ebx,%eax
  10092a:	c1 e0 07             	shl    $0x7,%eax
  10092d:	01 d8                	add    %ebx,%eax
  10092f:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100932:	01 c0                	add    %eax,%eax
  100934:	01 d8                	add    %ebx,%eax
  100936:	8d 14 c5 a0 3b 10 00 	lea    0x103ba0(,%eax,8),%edx
  10093d:	8b 82 50 20 00 00    	mov    0x2050(%edx),%eax
  100943:	39 d8                	cmp    %ebx,%eax
  100945:	74 79                	je     1009c0 <get_from_runnable+0xac>
  100947:	8b 8a 4c 20 00 00    	mov    0x204c(%edx),%ecx
  10094d:	89 ca                	mov    %ecx,%edx
  10094f:	c1 e2 07             	shl    $0x7,%edx
  100952:	01 ca                	add    %ecx,%edx
  100954:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100957:	01 d2                	add    %edx,%edx
  100959:	01 ca                	add    %ecx,%edx
  10095b:	89 04 d5 f0 5b 10 00 	mov    %eax,0x105bf0(,%edx,8)
  100962:	89 c2                	mov    %eax,%edx
  100964:	c1 e2 07             	shl    $0x7,%edx
  100967:	01 c2                	add    %eax,%edx
  100969:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10096c:	01 d2                	add    %edx,%edx
  10096e:	01 c2                	add    %eax,%edx
  100970:	89 0c d5 ec 5b 10 00 	mov    %ecx,0x105bec(,%edx,8)
  100977:	a3 e4 31 10 00       	mov    %eax,0x1031e4
  10097c:	83 ec 0c             	sub    $0xc,%esp
  10097f:	68 5c 17 10 00       	push   $0x10175c
  100984:	e8 9f 0b 00 00       	call   101528 <printk>
  100989:	58                   	pop    %eax
  10098a:	5a                   	pop    %edx
  10098b:	ff 35 e4 31 10 00    	pushl  0x1031e4
  100991:	53                   	push   %ebx
  100992:	68 18 19 10 00       	push   $0x101918
  100997:	6a 74                	push   $0x74
  100999:	68 3a 18 10 00       	push   $0x10183a
  10099e:	68 80 18 10 00       	push   $0x101880
  1009a3:	e8 80 0b 00 00       	call   101528 <printk>
  1009a8:	83 c4 14             	add    $0x14,%esp
  1009ab:	68 8b 17 10 00       	push   $0x10178b
  1009b0:	e8 73 0b 00 00       	call   101528 <printk>
  1009b5:	83 c4 10             	add    $0x10,%esp
  1009b8:	89 d8                	mov    %ebx,%eax
  1009ba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1009bd:	c9                   	leave  
  1009be:	c3                   	ret    
  1009bf:	90                   	nop
  1009c0:	c7 05 e4 31 10 00 ff 	movl   $0xffffffff,0x1031e4
  1009c7:	ff ff ff 
  1009ca:	eb b0                	jmp    10097c <get_from_runnable+0x68>
  1009cc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1009d1:	eb e7                	jmp    1009ba <get_from_runnable+0xa6>
  1009d3:	90                   	nop

001009d4 <put_into_runnable>:
  1009d4:	55                   	push   %ebp
  1009d5:	89 e5                	mov    %esp,%ebp
  1009d7:	56                   	push   %esi
  1009d8:	53                   	push   %ebx
  1009d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1009dc:	a1 e4 31 10 00       	mov    0x1031e4,%eax
  1009e1:	83 f8 ff             	cmp    $0xffffffff,%eax
  1009e4:	0f 84 f2 00 00 00    	je     100adc <put_into_runnable+0x108>
  1009ea:	89 c2                	mov    %eax,%edx
  1009ec:	c1 e2 07             	shl    $0x7,%edx
  1009ef:	01 c2                	add    %eax,%edx
  1009f1:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1009f4:	01 d2                	add    %edx,%edx
  1009f6:	01 c2                	add    %eax,%edx
  1009f8:	8d 34 d5 a0 3b 10 00 	lea    0x103ba0(,%edx,8),%esi
  1009ff:	8b 8e 4c 20 00 00    	mov    0x204c(%esi),%ecx
  100a05:	89 ca                	mov    %ecx,%edx
  100a07:	c1 e2 07             	shl    $0x7,%edx
  100a0a:	01 ca                	add    %ecx,%edx
  100a0c:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100a0f:	01 d2                	add    %edx,%edx
  100a11:	01 ca                	add    %ecx,%edx
  100a13:	89 1c d5 f0 5b 10 00 	mov    %ebx,0x105bf0(,%edx,8)
  100a1a:	89 da                	mov    %ebx,%edx
  100a1c:	c1 e2 07             	shl    $0x7,%edx
  100a1f:	01 da                	add    %ebx,%edx
  100a21:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100a24:	01 d2                	add    %edx,%edx
  100a26:	01 da                	add    %ebx,%edx
  100a28:	8d 14 d5 a0 3b 10 00 	lea    0x103ba0(,%edx,8),%edx
  100a2f:	89 8a 4c 20 00 00    	mov    %ecx,0x204c(%edx)
  100a35:	89 82 50 20 00 00    	mov    %eax,0x2050(%edx)
  100a3b:	89 9e 4c 20 00 00    	mov    %ebx,0x204c(%esi)
  100a41:	89 d8                	mov    %ebx,%eax
  100a43:	c1 e0 07             	shl    $0x7,%eax
  100a46:	01 d8                	add    %ebx,%eax
  100a48:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100a4b:	01 c0                	add    %eax,%eax
  100a4d:	01 d8                	add    %ebx,%eax
  100a4f:	c7 04 c5 dc 5b 10 00 	movl   $0x1,0x105bdc(,%eax,8)
  100a56:	01 00 00 00 
  100a5a:	85 db                	test   %ebx,%ebx
  100a5c:	75 0a                	jne    100a68 <put_into_runnable+0x94>
  100a5e:	c7 05 c8 5b 10 00 d0 	movl   $0x1007d0,0x105bc8
  100a65:	07 10 00 
  100a68:	83 ec 0c             	sub    $0xc,%esp
  100a6b:	68 5c 17 10 00       	push   $0x10175c
  100a70:	e8 b3 0a 00 00       	call   101528 <printk>
  100a75:	58                   	pop    %eax
  100a76:	5a                   	pop    %edx
  100a77:	53                   	push   %ebx
  100a78:	ff 35 e4 31 10 00    	pushl  0x1031e4
  100a7e:	68 04 19 10 00       	push   $0x101904
  100a83:	68 90 00 00 00       	push   $0x90
  100a88:	68 3a 18 10 00       	push   $0x10183a
  100a8d:	68 b4 18 10 00       	push   $0x1018b4
  100a92:	e8 91 0a 00 00       	call   101528 <printk>
  100a97:	83 c4 14             	add    $0x14,%esp
  100a9a:	68 8b 17 10 00       	push   $0x10178b
  100a9f:	e8 84 0a 00 00       	call   101528 <printk>
  100aa4:	89 d8                	mov    %ebx,%eax
  100aa6:	c1 e0 07             	shl    $0x7,%eax
  100aa9:	01 d8                	add    %ebx,%eax
  100aab:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100aae:	01 c0                	add    %eax,%eax
  100ab0:	01 c3                	add    %eax,%ebx
  100ab2:	8d 04 dd a0 3b 10 00 	lea    0x103ba0(,%ebx,8),%eax
  100ab9:	8b 15 88 3b 10 00    	mov    0x103b88,%edx
  100abf:	89 90 40 20 00 00    	mov    %edx,0x2040(%eax)
  100ac5:	8b 55 0c             	mov    0xc(%ebp),%edx
  100ac8:	89 90 54 20 00 00    	mov    %edx,0x2054(%eax)
  100ace:	b8 01 00 00 00       	mov    $0x1,%eax
  100ad3:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100ad6:	5b                   	pop    %ebx
  100ad7:	5e                   	pop    %esi
  100ad8:	5d                   	pop    %ebp
  100ad9:	c3                   	ret    
  100ada:	66 90                	xchg   %ax,%ax
  100adc:	89 1d e4 31 10 00    	mov    %ebx,0x1031e4
  100ae2:	89 d8                	mov    %ebx,%eax
  100ae4:	c1 e0 07             	shl    $0x7,%eax
  100ae7:	01 d8                	add    %ebx,%eax
  100ae9:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100aec:	01 c0                	add    %eax,%eax
  100aee:	01 d8                	add    %ebx,%eax
  100af0:	8d 04 c5 a0 3b 10 00 	lea    0x103ba0(,%eax,8),%eax
  100af7:	89 98 4c 20 00 00    	mov    %ebx,0x204c(%eax)
  100afd:	89 98 50 20 00 00    	mov    %ebx,0x2050(%eax)
  100b03:	e9 39 ff ff ff       	jmp    100a41 <put_into_runnable+0x6d>

00100b08 <put_into_block>:
  100b08:	55                   	push   %ebp
  100b09:	89 e5                	mov    %esp,%ebp
  100b0b:	57                   	push   %edi
  100b0c:	56                   	push   %esi
  100b0d:	53                   	push   %ebx
  100b0e:	8b 45 08             	mov    0x8(%ebp),%eax
  100b11:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100b14:	8b 15 e0 31 10 00    	mov    0x1031e0,%edx
  100b1a:	83 fa ff             	cmp    $0xffffffff,%edx
  100b1d:	0f 84 99 00 00 00    	je     100bbc <put_into_block+0xb4>
  100b23:	89 d1                	mov    %edx,%ecx
  100b25:	c1 e1 07             	shl    $0x7,%ecx
  100b28:	01 d1                	add    %edx,%ecx
  100b2a:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100b2d:	01 c9                	add    %ecx,%ecx
  100b2f:	01 d1                	add    %edx,%ecx
  100b31:	8d 3c cd a0 3b 10 00 	lea    0x103ba0(,%ecx,8),%edi
  100b38:	8b b7 4c 20 00 00    	mov    0x204c(%edi),%esi
  100b3e:	89 f1                	mov    %esi,%ecx
  100b40:	c1 e1 07             	shl    $0x7,%ecx
  100b43:	01 f1                	add    %esi,%ecx
  100b45:	8d 0c 8e             	lea    (%esi,%ecx,4),%ecx
  100b48:	01 c9                	add    %ecx,%ecx
  100b4a:	01 f1                	add    %esi,%ecx
  100b4c:	89 04 cd f0 5b 10 00 	mov    %eax,0x105bf0(,%ecx,8)
  100b53:	89 c1                	mov    %eax,%ecx
  100b55:	c1 e1 07             	shl    $0x7,%ecx
  100b58:	01 c1                	add    %eax,%ecx
  100b5a:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  100b5d:	01 c9                	add    %ecx,%ecx
  100b5f:	01 c1                	add    %eax,%ecx
  100b61:	8d 0c cd a0 3b 10 00 	lea    0x103ba0(,%ecx,8),%ecx
  100b68:	89 b1 4c 20 00 00    	mov    %esi,0x204c(%ecx)
  100b6e:	89 91 50 20 00 00    	mov    %edx,0x2050(%ecx)
  100b74:	89 87 4c 20 00 00    	mov    %eax,0x204c(%edi)
  100b7a:	89 c2                	mov    %eax,%edx
  100b7c:	c1 e2 07             	shl    $0x7,%edx
  100b7f:	01 c2                	add    %eax,%edx
  100b81:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100b84:	01 d2                	add    %edx,%edx
  100b86:	01 c2                	add    %eax,%edx
  100b88:	c1 e2 03             	shl    $0x3,%edx
  100b8b:	8d 82 a0 5b 10 00    	lea    0x105ba0(%edx),%eax
  100b91:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100b96:	89 c7                	mov    %eax,%edi
  100b98:	89 de                	mov    %ebx,%esi
  100b9a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100b9c:	8b 43 10             	mov    0x10(%ebx),%eax
  100b9f:	89 82 e4 5b 10 00    	mov    %eax,0x105be4(%edx)
  100ba5:	c7 82 dc 5b 10 00 00 	movl   $0x0,0x105bdc(%edx)
  100bac:	00 00 00 
  100baf:	b8 01 00 00 00       	mov    $0x1,%eax
  100bb4:	5b                   	pop    %ebx
  100bb5:	5e                   	pop    %esi
  100bb6:	5f                   	pop    %edi
  100bb7:	5d                   	pop    %ebp
  100bb8:	c3                   	ret    
  100bb9:	8d 76 00             	lea    0x0(%esi),%esi
  100bbc:	a3 e0 31 10 00       	mov    %eax,0x1031e0
  100bc1:	89 c2                	mov    %eax,%edx
  100bc3:	c1 e2 07             	shl    $0x7,%edx
  100bc6:	01 c2                	add    %eax,%edx
  100bc8:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100bcb:	01 d2                	add    %edx,%edx
  100bcd:	01 c2                	add    %eax,%edx
  100bcf:	8d 14 d5 a0 3b 10 00 	lea    0x103ba0(,%edx,8),%edx
  100bd6:	89 82 50 20 00 00    	mov    %eax,0x2050(%edx)
  100bdc:	89 82 4c 20 00 00    	mov    %eax,0x204c(%edx)
  100be2:	eb 96                	jmp    100b7a <put_into_block+0x72>

00100be4 <get_from>:
  100be4:	55                   	push   %ebp
  100be5:	89 e5                	mov    %esp,%ebp
  100be7:	56                   	push   %esi
  100be8:	53                   	push   %ebx
  100be9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100bec:	8b 45 0c             	mov    0xc(%ebp),%eax
  100bef:	85 db                	test   %ebx,%ebx
  100bf1:	0f 8e 01 01 00 00    	jle    100cf8 <get_from+0x114>
  100bf7:	39 c3                	cmp    %eax,%ebx
  100bf9:	74 42                	je     100c3d <get_from+0x59>
  100bfb:	89 da                	mov    %ebx,%edx
  100bfd:	c1 e2 07             	shl    $0x7,%edx
  100c00:	01 da                	add    %ebx,%edx
  100c02:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100c05:	01 d2                	add    %edx,%edx
  100c07:	01 da                	add    %ebx,%edx
  100c09:	8b 14 d5 f0 5b 10 00 	mov    0x105bf0(,%edx,8),%edx
  100c10:	39 d3                	cmp    %edx,%ebx
  100c12:	75 25                	jne    100c39 <get_from+0x55>
  100c14:	e9 df 00 00 00       	jmp    100cf8 <get_from+0x114>
  100c19:	8d 76 00             	lea    0x0(%esi),%esi
  100c1c:	89 d1                	mov    %edx,%ecx
  100c1e:	c1 e1 07             	shl    $0x7,%ecx
  100c21:	01 d1                	add    %edx,%ecx
  100c23:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  100c26:	01 c9                	add    %ecx,%ecx
  100c28:	01 ca                	add    %ecx,%edx
  100c2a:	8b 14 d5 f0 5b 10 00 	mov    0x105bf0(,%edx,8),%edx
  100c31:	39 d3                	cmp    %edx,%ebx
  100c33:	0f 84 bf 00 00 00    	je     100cf8 <get_from+0x114>
  100c39:	39 c2                	cmp    %eax,%edx
  100c3b:	75 df                	jne    100c1c <get_from+0x38>
  100c3d:	89 c2                	mov    %eax,%edx
  100c3f:	c1 e2 07             	shl    $0x7,%edx
  100c42:	01 c2                	add    %eax,%edx
  100c44:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100c47:	01 d2                	add    %edx,%edx
  100c49:	01 d0                	add    %edx,%eax
  100c4b:	8b 04 c5 dc 5b 10 00 	mov    0x105bdc(,%eax,8),%eax
  100c52:	85 c0                	test   %eax,%eax
  100c54:	0f 84 c2 00 00 00    	je     100d1c <get_from+0x138>
  100c5a:	48                   	dec    %eax
  100c5b:	75 7f                	jne    100cdc <get_from+0xf8>
  100c5d:	be e4 31 10 00       	mov    $0x1031e4,%esi
  100c62:	3b 1e                	cmp    (%esi),%ebx
  100c64:	74 15                	je     100c7b <get_from+0x97>
  100c66:	83 ec 08             	sub    $0x8,%esp
  100c69:	68 d2 00 00 00       	push   $0xd2
  100c6e:	68 3a 18 10 00       	push   $0x10183a
  100c73:	e8 24 0a 00 00       	call   10169c <abort>
  100c78:	83 c4 10             	add    $0x10,%esp
  100c7b:	89 d8                	mov    %ebx,%eax
  100c7d:	c1 e0 07             	shl    $0x7,%eax
  100c80:	01 d8                	add    %ebx,%eax
  100c82:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100c85:	01 c0                	add    %eax,%eax
  100c87:	01 d8                	add    %ebx,%eax
  100c89:	8d 14 c5 a0 3b 10 00 	lea    0x103ba0(,%eax,8),%edx
  100c90:	8b 82 50 20 00 00    	mov    0x2050(%edx),%eax
  100c96:	39 d8                	cmp    %ebx,%eax
  100c98:	0f 84 8a 00 00 00    	je     100d28 <get_from+0x144>
  100c9e:	8b 8a 4c 20 00 00    	mov    0x204c(%edx),%ecx
  100ca4:	89 ca                	mov    %ecx,%edx
  100ca6:	c1 e2 07             	shl    $0x7,%edx
  100ca9:	01 ca                	add    %ecx,%edx
  100cab:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100cae:	01 d2                	add    %edx,%edx
  100cb0:	01 ca                	add    %ecx,%edx
  100cb2:	89 04 d5 f0 5b 10 00 	mov    %eax,0x105bf0(,%edx,8)
  100cb9:	89 c2                	mov    %eax,%edx
  100cbb:	c1 e2 07             	shl    $0x7,%edx
  100cbe:	01 c2                	add    %eax,%edx
  100cc0:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100cc3:	01 d2                	add    %edx,%edx
  100cc5:	01 c2                	add    %eax,%edx
  100cc7:	89 0c d5 ec 5b 10 00 	mov    %ecx,0x105bec(,%edx,8)
  100cce:	89 06                	mov    %eax,(%esi)
  100cd0:	89 d8                	mov    %ebx,%eax
  100cd2:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100cd5:	5b                   	pop    %ebx
  100cd6:	5e                   	pop    %esi
  100cd7:	5d                   	pop    %ebp
  100cd8:	c3                   	ret    
  100cd9:	8d 76 00             	lea    0x0(%esi),%esi
  100cdc:	83 ec 08             	sub    $0x8,%esp
  100cdf:	68 ce 00 00 00       	push   $0xce
  100ce4:	68 3a 18 10 00       	push   $0x10183a
  100ce9:	e8 ae 09 00 00       	call   10169c <abort>
  100cee:	a1 00 00 00 00       	mov    0x0,%eax
  100cf3:	0f 0b                	ud2    
  100cf5:	8d 76 00             	lea    0x0(%esi),%esi
  100cf8:	83 ec 08             	sub    $0x8,%esp
  100cfb:	68 bf 00 00 00       	push   $0xbf
  100d00:	68 3a 18 10 00       	push   $0x10183a
  100d05:	e8 92 09 00 00       	call   10169c <abort>
  100d0a:	83 c4 10             	add    $0x10,%esp
  100d0d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100d12:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d15:	5b                   	pop    %ebx
  100d16:	5e                   	pop    %esi
  100d17:	5d                   	pop    %ebp
  100d18:	c3                   	ret    
  100d19:	8d 76 00             	lea    0x0(%esi),%esi
  100d1c:	be e0 31 10 00       	mov    $0x1031e0,%esi
  100d21:	e9 3c ff ff ff       	jmp    100c62 <get_from+0x7e>
  100d26:	66 90                	xchg   %ax,%ax
  100d28:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
  100d2e:	89 d8                	mov    %ebx,%eax
  100d30:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d33:	5b                   	pop    %ebx
  100d34:	5e                   	pop    %esi
  100d35:	5d                   	pop    %ebp
  100d36:	c3                   	ret    
  100d37:	90                   	nop

00100d38 <get_from_block>:
  100d38:	55                   	push   %ebp
  100d39:	89 e5                	mov    %esp,%ebp
  100d3b:	83 ec 10             	sub    $0x10,%esp
  100d3e:	ff 75 08             	pushl  0x8(%ebp)
  100d41:	ff 35 e0 31 10 00    	pushl  0x1031e0
  100d47:	e8 98 fe ff ff       	call   100be4 <get_from>
  100d4c:	83 c4 10             	add    $0x10,%esp
  100d4f:	40                   	inc    %eax
  100d50:	74 0a                	je     100d5c <get_from_block+0x24>
  100d52:	b8 01 00 00 00       	mov    $0x1,%eax
  100d57:	c9                   	leave  
  100d58:	c3                   	ret    
  100d59:	8d 76 00             	lea    0x0(%esi),%esi
  100d5c:	83 ec 08             	sub    $0x8,%esp
  100d5f:	68 09 01 00 00       	push   $0x109
  100d64:	68 3a 18 10 00       	push   $0x10183a
  100d69:	e8 2e 09 00 00       	call   10169c <abort>
  100d6e:	83 c4 10             	add    $0x10,%esp
  100d71:	b8 01 00 00 00       	mov    $0x1,%eax
  100d76:	c9                   	leave  
  100d77:	c3                   	ret    

00100d78 <check_block>:
  100d78:	55                   	push   %ebp
  100d79:	89 e5                	mov    %esp,%ebp
  100d7b:	57                   	push   %edi
  100d7c:	56                   	push   %esi
  100d7d:	53                   	push   %ebx
  100d7e:	83 ec 0c             	sub    $0xc,%esp
  100d81:	a1 e0 31 10 00       	mov    0x1031e0,%eax
  100d86:	89 c6                	mov    %eax,%esi
  100d88:	83 f8 ff             	cmp    $0xffffffff,%eax
  100d8b:	74 58                	je     100de5 <check_block+0x6d>
  100d8d:	89 c2                	mov    %eax,%edx
  100d8f:	c1 e2 07             	shl    $0x7,%edx
  100d92:	01 c2                	add    %eax,%edx
  100d94:	8d 3c 90             	lea    (%eax,%edx,4),%edi
  100d97:	01 ff                	add    %edi,%edi
  100d99:	01 c7                	add    %eax,%edi
  100d9b:	eb 0c                	jmp    100da9 <check_block+0x31>
  100d9d:	8d 76 00             	lea    0x0(%esi),%esi
  100da0:	39 c6                	cmp    %eax,%esi
  100da2:	74 3c                	je     100de0 <check_block+0x68>
  100da4:	83 f8 ff             	cmp    $0xffffffff,%eax
  100da7:	74 37                	je     100de0 <check_block+0x68>
  100da9:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
  100db0:	8b 8b e4 5b 10 00    	mov    0x105be4(%ebx),%ecx
  100db6:	85 c9                	test   %ecx,%ecx
  100db8:	7f e6                	jg     100da0 <check_block+0x28>
  100dba:	83 ec 0c             	sub    $0xc,%esp
  100dbd:	56                   	push   %esi
  100dbe:	e8 75 ff ff ff       	call   100d38 <get_from_block>
  100dc3:	58                   	pop    %eax
  100dc4:	5a                   	pop    %edx
  100dc5:	81 c3 a0 5b 10 00    	add    $0x105ba0,%ebx
  100dcb:	53                   	push   %ebx
  100dcc:	56                   	push   %esi
  100dcd:	e8 02 fc ff ff       	call   1009d4 <put_into_runnable>
  100dd2:	83 c4 10             	add    $0x10,%esp
  100dd5:	a1 e0 31 10 00       	mov    0x1031e0,%eax
  100dda:	39 c6                	cmp    %eax,%esi
  100ddc:	75 c6                	jne    100da4 <check_block+0x2c>
  100dde:	66 90                	xchg   %ax,%ax
  100de0:	be 01 00 00 00       	mov    $0x1,%esi
  100de5:	89 f0                	mov    %esi,%eax
  100de7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100dea:	5b                   	pop    %ebx
  100deb:	5e                   	pop    %esi
  100dec:	5f                   	pop    %edi
  100ded:	5d                   	pop    %ebp
  100dee:	c3                   	ret    
  100def:	90                   	nop

00100df0 <checkTimeCount>:
  100df0:	a1 84 3b 10 00       	mov    0x103b84,%eax
  100df5:	85 c0                	test   %eax,%eax
  100df7:	0f 84 f7 00 00 00    	je     100ef4 <checkTimeCount+0x104>
  100dfd:	55                   	push   %ebp
  100dfe:	89 e5                	mov    %esp,%ebp
  100e00:	57                   	push   %edi
  100e01:	56                   	push   %esi
  100e02:	83 ec 0c             	sub    $0xc,%esp
  100e05:	68 5c 17 10 00       	push   $0x10175c
  100e0a:	e8 19 07 00 00       	call   101528 <printk>
  100e0f:	5e                   	pop    %esi
  100e10:	ff 35 80 3b 10 00    	pushl  0x103b80
  100e16:	68 2c 19 10 00       	push   $0x10192c
  100e1b:	6a 31                	push   $0x31
  100e1d:	68 3a 18 10 00       	push   $0x10183a
  100e22:	68 66 18 10 00       	push   $0x101866
  100e27:	e8 fc 06 00 00       	call   101528 <printk>
  100e2c:	83 c4 14             	add    $0x14,%esp
  100e2f:	68 8b 17 10 00       	push   $0x10178b
  100e34:	e8 ef 06 00 00       	call   101528 <printk>
  100e39:	c7 04 24 5c 17 10 00 	movl   $0x10175c,(%esp)
  100e40:	e8 e3 06 00 00       	call   101528 <printk>
  100e45:	5f                   	pop    %edi
  100e46:	a1 80 3b 10 00       	mov    0x103b80,%eax
  100e4b:	89 c2                	mov    %eax,%edx
  100e4d:	c1 e2 07             	shl    $0x7,%edx
  100e50:	01 c2                	add    %eax,%edx
  100e52:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100e55:	01 d2                	add    %edx,%edx
  100e57:	01 d0                	add    %edx,%eax
  100e59:	ff 34 c5 e0 5b 10 00 	pushl  0x105be0(,%eax,8)
  100e60:	68 2c 19 10 00       	push   $0x10192c
  100e65:	6a 32                	push   $0x32
  100e67:	68 3a 18 10 00       	push   $0x10183a
  100e6c:	68 e4 18 10 00       	push   $0x1018e4
  100e71:	e8 b2 06 00 00       	call   101528 <printk>
  100e76:	83 c4 14             	add    $0x14,%esp
  100e79:	68 8b 17 10 00       	push   $0x10178b
  100e7e:	e8 a5 06 00 00       	call   101528 <printk>
  100e83:	e8 f0 fe ff ff       	call   100d78 <check_block>
  100e88:	8b 15 80 3b 10 00    	mov    0x103b80,%edx
  100e8e:	89 d0                	mov    %edx,%eax
  100e90:	c1 e0 07             	shl    $0x7,%eax
  100e93:	01 d0                	add    %edx,%eax
  100e95:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100e98:	01 c0                	add    %eax,%eax
  100e9a:	01 d0                	add    %edx,%eax
  100e9c:	c1 e0 03             	shl    $0x3,%eax
  100e9f:	83 c4 10             	add    $0x10,%esp
  100ea2:	8b 88 e0 5b 10 00    	mov    0x105be0(%eax),%ecx
  100ea8:	85 c9                	test   %ecx,%ecx
  100eaa:	7e 0c                	jle    100eb8 <checkTimeCount+0xc8>
  100eac:	b8 01 00 00 00       	mov    $0x1,%eax
  100eb1:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100eb4:	5e                   	pop    %esi
  100eb5:	5f                   	pop    %edi
  100eb6:	5d                   	pop    %ebp
  100eb7:	c3                   	ret    
  100eb8:	05 a0 5b 10 00       	add    $0x105ba0,%eax
  100ebd:	b9 0f 00 00 00       	mov    $0xf,%ecx
  100ec2:	89 c7                	mov    %eax,%edi
  100ec4:	8b 75 08             	mov    0x8(%ebp),%esi
  100ec7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100ec9:	83 ec 08             	sub    $0x8,%esp
  100ecc:	ff 75 08             	pushl  0x8(%ebp)
  100ecf:	52                   	push   %edx
  100ed0:	e8 ff fa ff ff       	call   1009d4 <put_into_runnable>
  100ed5:	e8 3a fa ff ff       	call   100914 <get_from_runnable>
  100eda:	5a                   	pop    %edx
  100edb:	59                   	pop    %ecx
  100edc:	ff 75 08             	pushl  0x8(%ebp)
  100edf:	50                   	push   %eax
  100ee0:	e8 f3 f8 ff ff       	call   1007d8 <put_into_running>
  100ee5:	83 c4 10             	add    $0x10,%esp
  100ee8:	b8 01 00 00 00       	mov    $0x1,%eax
  100eed:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100ef0:	5e                   	pop    %esi
  100ef1:	5f                   	pop    %edi
  100ef2:	5d                   	pop    %ebp
  100ef3:	c3                   	ret    
  100ef4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100ef9:	c3                   	ret    
  100efa:	66 90                	xchg   %ax,%ax

00100efc <check_is_in>:
  100efc:	55                   	push   %ebp
  100efd:	89 e5                	mov    %esp,%ebp
  100eff:	53                   	push   %ebx
  100f00:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100f03:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  100f06:	85 c9                	test   %ecx,%ecx
  100f08:	7e 4a                	jle    100f54 <check_is_in+0x58>
  100f0a:	39 d9                	cmp    %ebx,%ecx
  100f0c:	74 3b                	je     100f49 <check_is_in+0x4d>
  100f0e:	89 c8                	mov    %ecx,%eax
  100f10:	c1 e0 07             	shl    $0x7,%eax
  100f13:	01 c8                	add    %ecx,%eax
  100f15:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100f18:	01 c0                	add    %eax,%eax
  100f1a:	01 c8                	add    %ecx,%eax
  100f1c:	8b 04 c5 f0 5b 10 00 	mov    0x105bf0(,%eax,8),%eax
  100f23:	39 c1                	cmp    %eax,%ecx
  100f25:	75 1e                	jne    100f45 <check_is_in+0x49>
  100f27:	eb 2b                	jmp    100f54 <check_is_in+0x58>
  100f29:	8d 76 00             	lea    0x0(%esi),%esi
  100f2c:	89 c2                	mov    %eax,%edx
  100f2e:	c1 e2 07             	shl    $0x7,%edx
  100f31:	01 c2                	add    %eax,%edx
  100f33:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100f36:	01 d2                	add    %edx,%edx
  100f38:	01 d0                	add    %edx,%eax
  100f3a:	8b 04 c5 f0 5b 10 00 	mov    0x105bf0(,%eax,8),%eax
  100f41:	39 c1                	cmp    %eax,%ecx
  100f43:	74 0f                	je     100f54 <check_is_in+0x58>
  100f45:	39 c3                	cmp    %eax,%ebx
  100f47:	75 e3                	jne    100f2c <check_is_in+0x30>
  100f49:	b8 01 00 00 00       	mov    $0x1,%eax
  100f4e:	5b                   	pop    %ebx
  100f4f:	5d                   	pop    %ebp
  100f50:	c3                   	ret    
  100f51:	8d 76 00             	lea    0x0(%esi),%esi
  100f54:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100f59:	5b                   	pop    %ebx
  100f5a:	5d                   	pop    %ebp
  100f5b:	c3                   	ret    

00100f5c <block_decrease>:
  100f5c:	55                   	push   %ebp
  100f5d:	89 e5                	mov    %esp,%ebp
  100f5f:	8b 0d e0 31 10 00    	mov    0x1031e0,%ecx
  100f65:	83 f9 ff             	cmp    $0xffffffff,%ecx
  100f68:	74 2e                	je     100f98 <block_decrease+0x3c>
  100f6a:	89 c8                	mov    %ecx,%eax
  100f6c:	89 c2                	mov    %eax,%edx
  100f6e:	c1 e2 07             	shl    $0x7,%edx
  100f71:	01 c2                	add    %eax,%edx
  100f73:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100f76:	01 d2                	add    %edx,%edx
  100f78:	01 d0                	add    %edx,%eax
  100f7a:	8d 04 c5 a0 3b 10 00 	lea    0x103ba0(,%eax,8),%eax
  100f81:	ff 88 44 20 00 00    	decl   0x2044(%eax)
  100f87:	8b 80 50 20 00 00    	mov    0x2050(%eax),%eax
  100f8d:	39 c1                	cmp    %eax,%ecx
  100f8f:	75 db                	jne    100f6c <block_decrease+0x10>
  100f91:	b8 01 00 00 00       	mov    $0x1,%eax
  100f96:	5d                   	pop    %ebp
  100f97:	c3                   	ret    
  100f98:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100f9d:	5d                   	pop    %ebp
  100f9e:	c3                   	ret    
  100f9f:	90                   	nop

00100fa0 <init_pcb>:
  100fa0:	55                   	push   %ebp
  100fa1:	89 e5                	mov    %esp,%ebp
  100fa3:	c7 05 88 3b 10 00 05 	movl   $0x5,0x103b88
  100faa:	00 00 00 
  100fad:	ba e8 5b 10 00       	mov    $0x105be8,%edx
  100fb2:	31 c0                	xor    %eax,%eax
  100fb4:	89 02                	mov    %eax,(%edx)
  100fb6:	8d 48 ff             	lea    -0x1(%eax),%ecx
  100fb9:	89 4a 04             	mov    %ecx,0x4(%edx)
  100fbc:	40                   	inc    %eax
  100fbd:	89 42 08             	mov    %eax,0x8(%edx)
  100fc0:	81 c2 58 20 00 00    	add    $0x2058,%edx
  100fc6:	3d 00 08 00 00       	cmp    $0x800,%eax
  100fcb:	75 e7                	jne    100fb4 <init_pcb+0x14>
  100fcd:	c7 05 ec 5b 10 00 ff 	movl   $0x7ff,0x105bec
  100fd4:	07 00 00 
  100fd7:	c7 05 98 fb 12 01 00 	movl   $0x0,0x112fb98
  100fde:	00 00 00 
  100fe1:	5d                   	pop    %ebp
  100fe2:	c3                   	ret    
  100fe3:	90                   	nop

00100fe4 <init_kernel_pcb>:
  100fe4:	55                   	push   %ebp
  100fe5:	89 e5                	mov    %esp,%ebp
  100fe7:	c7 05 d8 5b 10 00 10 	movl   $0x10,0x105bd8
  100fee:	00 00 00 
  100ff1:	c7 05 cc 5b 10 00 08 	movl   $0x8,0x105bcc
  100ff8:	00 00 00 
  100ffb:	c7 05 c8 5b 10 00 d0 	movl   $0x1007d0,0x105bc8
  101002:	07 10 00 
  101005:	c7 05 d4 5b 10 00 00 	movl   $0x7f00000,0x105bd4
  10100c:	00 f0 07 
  10100f:	c7 05 dc 5b 10 00 01 	movl   $0x1,0x105bdc
  101016:	00 00 00 
  101019:	c7 05 e0 5b 10 00 04 	movl   $0x4,0x105be0
  101020:	00 00 00 
  101023:	b8 01 00 00 00       	mov    $0x1,%eax
  101028:	5d                   	pop    %ebp
  101029:	c3                   	ret    
  10102a:	66 90                	xchg   %ax,%ax

0010102c <transfer_pid_state>:
  10102c:	55                   	push   %ebp
  10102d:	89 e5                	mov    %esp,%ebp
  10102f:	b8 01 00 00 00       	mov    $0x1,%eax
  101034:	5d                   	pop    %ebp
  101035:	c3                   	ret    
  101036:	66 90                	xchg   %ax,%ax

00101038 <make_pcb>:
  101038:	55                   	push   %ebp
  101039:	89 e5                	mov    %esp,%ebp
  10103b:	57                   	push   %edi
  10103c:	56                   	push   %esi
  10103d:	8b 45 08             	mov    0x8(%ebp),%eax
  101040:	89 c2                	mov    %eax,%edx
  101042:	c1 e2 07             	shl    $0x7,%edx
  101045:	01 c2                	add    %eax,%edx
  101047:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10104a:	01 d2                	add    %edx,%edx
  10104c:	01 c2                	add    %eax,%edx
  10104e:	c1 e2 03             	shl    $0x3,%edx
  101051:	8d 82 a0 5b 10 00    	lea    0x105ba0(%edx),%eax
  101057:	b9 0f 00 00 00       	mov    $0xf,%ecx
  10105c:	89 c7                	mov    %eax,%edi
  10105e:	8b 75 0c             	mov    0xc(%ebp),%esi
  101061:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101063:	8b 45 10             	mov    0x10(%ebp),%eax
  101066:	89 82 dc 5b 10 00    	mov    %eax,0x105bdc(%edx)
  10106c:	8b 45 14             	mov    0x14(%ebp),%eax
  10106f:	89 82 e0 5b 10 00    	mov    %eax,0x105be0(%edx)
  101075:	8b 45 18             	mov    0x18(%ebp),%eax
  101078:	89 82 e4 5b 10 00    	mov    %eax,0x105be4(%edx)
  10107e:	8b 45 0c             	mov    0xc(%ebp),%eax
  101081:	89 82 f4 5b 10 00    	mov    %eax,0x105bf4(%edx)
  101087:	b8 01 00 00 00       	mov    $0x1,%eax
  10108c:	5e                   	pop    %esi
  10108d:	5f                   	pop    %edi
  10108e:	5d                   	pop    %ebp
  10108f:	c3                   	ret    

00101090 <initIdt>:
  101090:	55                   	push   %ebp
  101091:	89 e5                	mov    %esp,%ebp
  101093:	53                   	push   %ebx
  101094:	ba 33 17 10 00       	mov    $0x101733,%edx
  101099:	89 d3                	mov    %edx,%ebx
  10109b:	c1 ea 10             	shr    $0x10,%edx
  10109e:	b9 60 04 13 01       	mov    $0x1130460,%ecx
  1010a3:	b8 60 fc 12 01       	mov    $0x112fc60,%eax
  1010a8:	66 89 18             	mov    %bx,(%eax)
  1010ab:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  1010b1:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  1010b5:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  1010b9:	66 89 50 06          	mov    %dx,0x6(%eax)
  1010bd:	83 c0 08             	add    $0x8,%eax
  1010c0:	39 c1                	cmp    %eax,%ecx
  1010c2:	75 e4                	jne    1010a8 <initIdt+0x18>
  1010c4:	b8 39 17 10 00       	mov    $0x101739,%eax
  1010c9:	66 a3 c8 fc 12 01    	mov    %ax,0x112fcc8
  1010cf:	66 c7 05 ca fc 12 01 	movw   $0x8,0x112fcca
  1010d6:	08 00 
  1010d8:	c6 05 cc fc 12 01 00 	movb   $0x0,0x112fccc
  1010df:	c6 05 cd fc 12 01 8f 	movb   $0x8f,0x112fccd
  1010e6:	c1 e8 10             	shr    $0x10,%eax
  1010e9:	66 a3 ce fc 12 01    	mov    %ax,0x112fcce
  1010ef:	b8 3d 17 10 00       	mov    $0x10173d,%eax
  1010f4:	66 a3 60 00 13 01    	mov    %ax,0x1130060
  1010fa:	66 c7 05 62 00 13 01 	movw   $0x8,0x1130062
  101101:	08 00 
  101103:	c6 05 64 00 13 01 00 	movb   $0x0,0x1130064
  10110a:	c6 05 65 00 13 01 ee 	movb   $0xee,0x1130065
  101111:	c1 e8 10             	shr    $0x10,%eax
  101114:	66 a3 66 00 13 01    	mov    %ax,0x1130066
  10111a:	b8 46 17 10 00       	mov    $0x101746,%eax
  10111f:	66 a3 60 fd 12 01    	mov    %ax,0x112fd60
  101125:	66 c7 05 62 fd 12 01 	movw   $0x8,0x112fd62
  10112c:	08 00 
  10112e:	c6 05 64 fd 12 01 00 	movb   $0x0,0x112fd64
  101135:	c6 05 65 fd 12 01 8e 	movb   $0x8e,0x112fd65
  10113c:	c1 e8 10             	shr    $0x10,%eax
  10113f:	66 a3 66 fd 12 01    	mov    %ax,0x112fd66
  101145:	66 c7 05 10 33 10 00 	movw   $0x7ff,0x103310
  10114c:	ff 07 
  10114e:	b8 60 fc 12 01       	mov    $0x112fc60,%eax
  101153:	66 a3 12 33 10 00    	mov    %ax,0x103312
  101159:	c1 e8 10             	shr    $0x10,%eax
  10115c:	66 a3 14 33 10 00    	mov    %ax,0x103314
  101162:	b8 10 33 10 00       	mov    $0x103310,%eax
  101167:	0f 01 18             	lidtl  (%eax)
  10116a:	5b                   	pop    %ebx
  10116b:	5d                   	pop    %ebp
  10116c:	c3                   	ret    
  10116d:	66 90                	xchg   %ax,%ax
  10116f:	90                   	nop

00101170 <syscallHandle>:
  101170:	55                   	push   %ebp
  101171:	89 e5                	mov    %esp,%ebp
  101173:	53                   	push   %ebx
  101174:	50                   	push   %eax
  101175:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101178:	8b 43 1c             	mov    0x1c(%ebx),%eax
  10117b:	83 f8 02             	cmp    $0x2,%eax
  10117e:	74 28                	je     1011a8 <syscallHandle+0x38>
  101180:	76 3a                	jbe    1011bc <syscallHandle+0x4c>
  101182:	83 f8 04             	cmp    $0x4,%eax
  101185:	74 15                	je     10119c <syscallHandle+0x2c>
  101187:	3d e6 00 00 00       	cmp    $0xe6,%eax
  10118c:	75 29                	jne    1011b7 <syscallHandle+0x47>
  10118e:	89 5d 08             	mov    %ebx,0x8(%ebp)
  101191:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101194:	c9                   	leave  
  101195:	e9 be f3 ff ff       	jmp    100558 <sys_sleep>
  10119a:	66 90                	xchg   %ax,%ax
  10119c:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10119f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1011a2:	c9                   	leave  
  1011a3:	e9 80 f5 ff ff       	jmp    100728 <sys_write>
  1011a8:	83 ec 0c             	sub    $0xc,%esp
  1011ab:	53                   	push   %ebx
  1011ac:	e8 2b f4 ff ff       	call   1005dc <sys_fork>
  1011b1:	89 43 1c             	mov    %eax,0x1c(%ebx)
  1011b4:	83 c4 10             	add    $0x10,%esp
  1011b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1011ba:	c9                   	leave  
  1011bb:	c3                   	ret    
  1011bc:	48                   	dec    %eax
  1011bd:	75 f8                	jne    1011b7 <syscallHandle+0x47>
  1011bf:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1011c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1011c5:	c9                   	leave  
  1011c6:	e9 65 f3 ff ff       	jmp    100530 <sys_exit>
  1011cb:	90                   	nop

001011cc <GProtectFaultHandle>:
  1011cc:	55                   	push   %ebp
  1011cd:	89 e5                	mov    %esp,%ebp
  1011cf:	83 ec 14             	sub    $0x14,%esp
  1011d2:	68 5c 17 10 00       	push   $0x10175c
  1011d7:	e8 4c 03 00 00       	call   101528 <printk>
  1011dc:	58                   	pop    %eax
  1011dd:	8b 45 08             	mov    0x8(%ebp),%eax
  1011e0:	ff 70 20             	pushl  0x20(%eax)
  1011e3:	68 90 19 10 00       	push   $0x101990
  1011e8:	6a 66                	push   $0x66
  1011ea:	68 4d 19 10 00       	push   $0x10194d
  1011ef:	68 60 19 10 00       	push   $0x101960
  1011f4:	e8 2f 03 00 00       	call   101528 <printk>
  1011f9:	83 c4 14             	add    $0x14,%esp
  1011fc:	68 8b 17 10 00       	push   $0x10178b
  101201:	e8 22 03 00 00       	call   101528 <printk>
  101206:	5a                   	pop    %edx
  101207:	59                   	pop    %ecx
  101208:	6a 67                	push   $0x67
  10120a:	68 4d 19 10 00       	push   $0x10194d
  10120f:	e8 88 04 00 00       	call   10169c <abort>
  101214:	83 c4 10             	add    $0x10,%esp
  101217:	c9                   	leave  
  101218:	c3                   	ret    
  101219:	8d 76 00             	lea    0x0(%esi),%esi

0010121c <timeHandle>:
  10121c:	55                   	push   %ebp
  10121d:	89 e5                	mov    %esp,%ebp
  10121f:	53                   	push   %ebx
  101220:	83 ec 10             	sub    $0x10,%esp
  101223:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101226:	6a 41                	push   $0x41
  101228:	e8 87 f5 ff ff       	call   1007b4 <putChar>
  10122d:	e8 b2 f6 ff ff       	call   1008e4 <getpid>
  101232:	89 c2                	mov    %eax,%edx
  101234:	c1 e2 07             	shl    $0x7,%edx
  101237:	01 c2                	add    %eax,%edx
  101239:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10123c:	01 d2                	add    %edx,%edx
  10123e:	01 d0                	add    %edx,%eax
  101240:	ff 0c c5 e0 5b 10 00 	decl   0x105be0(,%eax,8)
  101247:	e8 10 fd ff ff       	call   100f5c <block_decrease>
  10124c:	89 1c 24             	mov    %ebx,(%esp)
  10124f:	e8 9c fb ff ff       	call   100df0 <checkTimeCount>
  101254:	83 c4 10             	add    $0x10,%esp
  101257:	c7 45 08 45 00 00 00 	movl   $0x45,0x8(%ebp)
  10125e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101261:	c9                   	leave  
  101262:	e9 4d f5 ff ff       	jmp    1007b4 <putChar>
  101267:	90                   	nop

00101268 <irqHandle>:
  101268:	55                   	push   %ebp
  101269:	89 e5                	mov    %esp,%ebp
  10126b:	57                   	push   %edi
  10126c:	56                   	push   %esi
  10126d:	53                   	push   %ebx
  10126e:	83 ec 1c             	sub    $0x1c,%esp
  101271:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101274:	89 6d e4             	mov    %ebp,-0x1c(%ebp)
  101277:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10127a:	8d 78 08             	lea    0x8(%eax),%edi
  10127d:	3b 58 08             	cmp    0x8(%eax),%ebx
  101280:	74 12                	je     101294 <irqHandle+0x2c>
  101282:	83 ec 08             	sub    $0x8,%esp
  101285:	6a 1c                	push   $0x1c
  101287:	68 4d 19 10 00       	push   $0x10194d
  10128c:	e8 0b 04 00 00       	call   10169c <abort>
  101291:	83 c4 10             	add    $0x10,%esp
  101294:	e8 4b f6 ff ff       	call   1008e4 <getpid>
  101299:	89 c6                	mov    %eax,%esi
  10129b:	fa                   	cli    
  10129c:	8b 43 20             	mov    0x20(%ebx),%eax
  10129f:	83 f8 0d             	cmp    $0xd,%eax
  1012a2:	0f 84 ec 00 00 00    	je     101394 <irqHandle+0x12c>
  1012a8:	0f 8e 96 00 00 00    	jle    101344 <irqHandle+0xdc>
  1012ae:	83 f8 20             	cmp    $0x20,%eax
  1012b1:	74 2d                	je     1012e0 <irqHandle+0x78>
  1012b3:	83 c0 80             	add    $0xffffff80,%eax
  1012b6:	0f 85 8b 00 00 00    	jne    101347 <irqHandle+0xdf>
  1012bc:	83 ec 0c             	sub    $0xc,%esp
  1012bf:	53                   	push   %ebx
  1012c0:	e8 ab fe ff ff       	call   101170 <syscallHandle>
  1012c5:	8b 43 20             	mov    0x20(%ebx),%eax
  1012c8:	83 c4 10             	add    $0x10,%esp
  1012cb:	3d 80 00 00 00       	cmp    $0x80,%eax
  1012d0:	74 26                	je     1012f8 <irqHandle+0x90>
  1012d2:	83 f8 20             	cmp    $0x20,%eax
  1012d5:	74 21                	je     1012f8 <irqHandle+0x90>
  1012d7:	fb                   	sti    
  1012d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1012db:	5b                   	pop    %ebx
  1012dc:	5e                   	pop    %esi
  1012dd:	5f                   	pop    %edi
  1012de:	5d                   	pop    %ebp
  1012df:	c3                   	ret    
  1012e0:	83 ec 0c             	sub    $0xc,%esp
  1012e3:	53                   	push   %ebx
  1012e4:	e8 33 ff ff ff       	call   10121c <timeHandle>
  1012e9:	8b 43 20             	mov    0x20(%ebx),%eax
  1012ec:	83 c4 10             	add    $0x10,%esp
  1012ef:	3d 80 00 00 00       	cmp    $0x80,%eax
  1012f4:	75 dc                	jne    1012d2 <irqHandle+0x6a>
  1012f6:	66 90                	xchg   %ax,%ax
  1012f8:	e8 e7 f5 ff ff       	call   1008e4 <getpid>
  1012fd:	39 c6                	cmp    %eax,%esi
  1012ff:	74 d6                	je     1012d7 <irqHandle+0x6f>
  101301:	e8 de f5 ff ff       	call   1008e4 <getpid>
  101306:	89 c2                	mov    %eax,%edx
  101308:	c1 e2 07             	shl    $0x7,%edx
  10130b:	01 c2                	add    %eax,%edx
  10130d:	8d 14 90             	lea    (%eax,%edx,4),%edx
  101310:	01 d2                	add    %edx,%edx
  101312:	01 d0                	add    %edx,%eax
  101314:	8d 1c c5 60 5b 10 00 	lea    0x105b60(,%eax,8),%ebx
  10131b:	89 1f                	mov    %ebx,(%edi)
  10131d:	e8 c2 f5 ff ff       	call   1008e4 <getpid>
  101322:	89 c2                	mov    %eax,%edx
  101324:	c1 e2 07             	shl    $0x7,%edx
  101327:	01 c2                	add    %eax,%edx
  101329:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10132c:	01 d2                	add    %edx,%edx
  10132e:	01 d0                	add    %edx,%eax
  101330:	8d 34 c5 a0 5b 10 00 	lea    0x105ba0(,%eax,8),%esi
  101337:	b9 0f 00 00 00       	mov    $0xf,%ecx
  10133c:	89 df                	mov    %ebx,%edi
  10133e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101340:	eb 95                	jmp    1012d7 <irqHandle+0x6f>
  101342:	66 90                	xchg   %ax,%ax
  101344:	40                   	inc    %eax
  101345:	74 90                	je     1012d7 <irqHandle+0x6f>
  101347:	83 ec 0c             	sub    $0xc,%esp
  10134a:	68 5c 17 10 00       	push   $0x10175c
  10134f:	e8 d4 01 00 00       	call   101528 <printk>
  101354:	58                   	pop    %eax
  101355:	ff 73 20             	pushl  0x20(%ebx)
  101358:	68 a4 19 10 00       	push   $0x1019a4
  10135d:	6a 33                	push   $0x33
  10135f:	68 4d 19 10 00       	push   $0x10194d
  101364:	68 76 19 10 00       	push   $0x101976
  101369:	e8 ba 01 00 00       	call   101528 <printk>
  10136e:	83 c4 14             	add    $0x14,%esp
  101371:	68 8b 17 10 00       	push   $0x10178b
  101376:	e8 ad 01 00 00       	call   101528 <printk>
  10137b:	5a                   	pop    %edx
  10137c:	59                   	pop    %ecx
  10137d:	6a 34                	push   $0x34
  10137f:	68 4d 19 10 00       	push   $0x10194d
  101384:	e8 13 03 00 00       	call   10169c <abort>
  101389:	8b 43 20             	mov    0x20(%ebx),%eax
  10138c:	83 c4 10             	add    $0x10,%esp
  10138f:	e9 37 ff ff ff       	jmp    1012cb <irqHandle+0x63>
  101394:	83 ec 0c             	sub    $0xc,%esp
  101397:	53                   	push   %ebx
  101398:	e8 2f fe ff ff       	call   1011cc <GProtectFaultHandle>
  10139d:	8b 43 20             	mov    0x20(%ebx),%eax
  1013a0:	83 c4 10             	add    $0x10,%esp
  1013a3:	e9 23 ff ff ff       	jmp    1012cb <irqHandle+0x63>

001013a8 <initIntr>:
  1013a8:	55                   	push   %ebp
  1013a9:	89 e5                	mov    %esp,%ebp
  1013ab:	ba 21 00 00 00       	mov    $0x21,%edx
  1013b0:	b0 ff                	mov    $0xff,%al
  1013b2:	ee                   	out    %al,(%dx)
  1013b3:	ba a1 00 00 00       	mov    $0xa1,%edx
  1013b8:	ee                   	out    %al,(%dx)
  1013b9:	ba 20 00 00 00       	mov    $0x20,%edx
  1013be:	b0 11                	mov    $0x11,%al
  1013c0:	ee                   	out    %al,(%dx)
  1013c1:	ba 21 00 00 00       	mov    $0x21,%edx
  1013c6:	b0 20                	mov    $0x20,%al
  1013c8:	ee                   	out    %al,(%dx)
  1013c9:	b0 04                	mov    $0x4,%al
  1013cb:	ee                   	out    %al,(%dx)
  1013cc:	b0 03                	mov    $0x3,%al
  1013ce:	ee                   	out    %al,(%dx)
  1013cf:	ba a0 00 00 00       	mov    $0xa0,%edx
  1013d4:	b0 11                	mov    $0x11,%al
  1013d6:	ee                   	out    %al,(%dx)
  1013d7:	ba a1 00 00 00       	mov    $0xa1,%edx
  1013dc:	b0 28                	mov    $0x28,%al
  1013de:	ee                   	out    %al,(%dx)
  1013df:	b0 02                	mov    $0x2,%al
  1013e1:	ee                   	out    %al,(%dx)
  1013e2:	b0 03                	mov    $0x3,%al
  1013e4:	ee                   	out    %al,(%dx)
  1013e5:	ba 20 00 00 00       	mov    $0x20,%edx
  1013ea:	b0 68                	mov    $0x68,%al
  1013ec:	ee                   	out    %al,(%dx)
  1013ed:	b0 0a                	mov    $0xa,%al
  1013ef:	ee                   	out    %al,(%dx)
  1013f0:	ba a0 00 00 00       	mov    $0xa0,%edx
  1013f5:	b0 68                	mov    $0x68,%al
  1013f7:	ee                   	out    %al,(%dx)
  1013f8:	b0 0a                	mov    $0xa,%al
  1013fa:	ee                   	out    %al,(%dx)
  1013fb:	5d                   	pop    %ebp
  1013fc:	c3                   	ret    
  1013fd:	8d 76 00             	lea    0x0(%esi),%esi

00101400 <initTimer>:
  101400:	55                   	push   %ebp
  101401:	89 e5                	mov    %esp,%ebp
  101403:	ba 43 00 00 00       	mov    $0x43,%edx
  101408:	b0 34                	mov    $0x34,%al
  10140a:	ee                   	out    %al,(%dx)
  10140b:	ba 40 00 00 00       	mov    $0x40,%edx
  101410:	b0 9b                	mov    $0x9b,%al
  101412:	ee                   	out    %al,(%dx)
  101413:	b0 2e                	mov    $0x2e,%al
  101415:	ee                   	out    %al,(%dx)
  101416:	5d                   	pop    %ebp
  101417:	c3                   	ret    

00101418 <i2A>:
  101418:	55                   	push   %ebp
  101419:	89 e5                	mov    %esp,%ebp
  10141b:	57                   	push   %edi
  10141c:	56                   	push   %esi
  10141d:	53                   	push   %ebx
  10141e:	51                   	push   %ecx
  10141f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101422:	85 c9                	test   %ecx,%ecx
  101424:	78 6e                	js     101494 <i2A+0x7c>
  101426:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  10142a:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  10142e:	bb 5e 33 10 00       	mov    $0x10335e,%ebx
  101433:	31 ff                	xor    %edi,%edi
  101435:	eb 03                	jmp    10143a <i2A+0x22>
  101437:	90                   	nop
  101438:	89 f7                	mov    %esi,%edi
  10143a:	4b                   	dec    %ebx
  10143b:	89 c8                	mov    %ecx,%eax
  10143d:	be 0a 00 00 00       	mov    $0xa,%esi
  101442:	99                   	cltd   
  101443:	f7 fe                	idiv   %esi
  101445:	83 c2 30             	add    $0x30,%edx
  101448:	88 13                	mov    %dl,(%ebx)
  10144a:	8d 77 01             	lea    0x1(%edi),%esi
  10144d:	b8 67 66 66 66       	mov    $0x66666667,%eax
  101452:	f7 e9                	imul   %ecx
  101454:	89 d0                	mov    %edx,%eax
  101456:	c1 f8 02             	sar    $0x2,%eax
  101459:	c1 f9 1f             	sar    $0x1f,%ecx
  10145c:	29 c8                	sub    %ecx,%eax
  10145e:	89 c1                	mov    %eax,%ecx
  101460:	75 d6                	jne    101438 <i2A+0x20>
  101462:	80 7d f3 01          	cmpb   $0x1,-0xd(%ebp)
  101466:	74 20                	je     101488 <i2A+0x70>
  101468:	80 7d f2 01          	cmpb   $0x1,-0xe(%ebp)
  10146c:	75 06                	jne    101474 <i2A+0x5c>
  10146e:	fe 05 5d 33 10 00    	incb   0x10335d
  101474:	c6 05 5e 33 10 00 00 	movb   $0x0,0x10335e
  10147b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10147e:	89 18                	mov    %ebx,(%eax)
  101480:	89 f0                	mov    %esi,%eax
  101482:	5a                   	pop    %edx
  101483:	5b                   	pop    %ebx
  101484:	5e                   	pop    %esi
  101485:	5f                   	pop    %edi
  101486:	5d                   	pop    %ebp
  101487:	c3                   	ret    
  101488:	c6 43 ff 2d          	movb   $0x2d,-0x1(%ebx)
  10148c:	8d 77 02             	lea    0x2(%edi),%esi
  10148f:	4b                   	dec    %ebx
  101490:	eb d6                	jmp    101468 <i2A+0x50>
  101492:	66 90                	xchg   %ax,%ax
  101494:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
  10149a:	74 0c                	je     1014a8 <i2A+0x90>
  10149c:	f7 d9                	neg    %ecx
  10149e:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
  1014a2:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
  1014a6:	eb 86                	jmp    10142e <i2A+0x16>
  1014a8:	b9 ff ff ff 7f       	mov    $0x7fffffff,%ecx
  1014ad:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
  1014b1:	eb ef                	jmp    1014a2 <i2A+0x8a>
  1014b3:	90                   	nop

001014b4 <i2X>:
  1014b4:	55                   	push   %ebp
  1014b5:	89 e5                	mov    %esp,%ebp
  1014b7:	57                   	push   %edi
  1014b8:	56                   	push   %esi
  1014b9:	53                   	push   %ebx
  1014ba:	8b 55 08             	mov    0x8(%ebp),%edx
  1014bd:	b9 3d 33 10 00       	mov    $0x10333d,%ecx
  1014c2:	31 c0                	xor    %eax,%eax
  1014c4:	40                   	inc    %eax
  1014c5:	89 d6                	mov    %edx,%esi
  1014c7:	83 e6 0f             	and    $0xf,%esi
  1014ca:	8d 5e f6             	lea    -0xa(%esi),%ebx
  1014cd:	89 cf                	mov    %ecx,%edi
  1014cf:	83 fb 05             	cmp    $0x5,%ebx
  1014d2:	77 4c                	ja     101520 <i2X+0x6c>
  1014d4:	ff 24 9d b0 19 10 00 	jmp    *0x1019b0(,%ebx,4)
  1014db:	90                   	nop
  1014dc:	c6 01 65             	movb   $0x65,(%ecx)
  1014df:	90                   	nop
  1014e0:	49                   	dec    %ecx
  1014e1:	c1 ea 04             	shr    $0x4,%edx
  1014e4:	75 de                	jne    1014c4 <i2X+0x10>
  1014e6:	c6 05 3e 33 10 00 00 	movb   $0x0,0x10333e
  1014ed:	8b 55 0c             	mov    0xc(%ebp),%edx
  1014f0:	89 3a                	mov    %edi,(%edx)
  1014f2:	5b                   	pop    %ebx
  1014f3:	5e                   	pop    %esi
  1014f4:	5f                   	pop    %edi
  1014f5:	5d                   	pop    %ebp
  1014f6:	c3                   	ret    
  1014f7:	90                   	nop
  1014f8:	c6 01 64             	movb   $0x64,(%ecx)
  1014fb:	eb e3                	jmp    1014e0 <i2X+0x2c>
  1014fd:	8d 76 00             	lea    0x0(%esi),%esi
  101500:	c6 01 63             	movb   $0x63,(%ecx)
  101503:	eb db                	jmp    1014e0 <i2X+0x2c>
  101505:	8d 76 00             	lea    0x0(%esi),%esi
  101508:	c6 01 62             	movb   $0x62,(%ecx)
  10150b:	eb d3                	jmp    1014e0 <i2X+0x2c>
  10150d:	8d 76 00             	lea    0x0(%esi),%esi
  101510:	c6 01 61             	movb   $0x61,(%ecx)
  101513:	eb cb                	jmp    1014e0 <i2X+0x2c>
  101515:	8d 76 00             	lea    0x0(%esi),%esi
  101518:	c6 01 66             	movb   $0x66,(%ecx)
  10151b:	eb c3                	jmp    1014e0 <i2X+0x2c>
  10151d:	8d 76 00             	lea    0x0(%esi),%esi
  101520:	8d 5e 30             	lea    0x30(%esi),%ebx
  101523:	88 19                	mov    %bl,(%ecx)
  101525:	eb b9                	jmp    1014e0 <i2X+0x2c>
  101527:	90                   	nop

00101528 <printk>:
  101528:	55                   	push   %ebp
  101529:	89 e5                	mov    %esp,%ebp
  10152b:	57                   	push   %edi
  10152c:	56                   	push   %esi
  10152d:	53                   	push   %ebx
  10152e:	83 ec 2c             	sub    $0x2c,%esp
  101531:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101534:	8a 11                	mov    (%ecx),%dl
  101536:	84 d2                	test   %dl,%dl
  101538:	0f 84 54 01 00 00    	je     101692 <printk+0x16a>
  10153e:	8d 45 0c             	lea    0xc(%ebp),%eax
  101541:	31 ff                	xor    %edi,%edi
  101543:	eb 18                	jmp    10155d <printk+0x35>
  101545:	8d 76 00             	lea    0x0(%esi),%esi
  101548:	8a 11                	mov    (%ecx),%dl
  10154a:	89 cb                	mov    %ecx,%ebx
  10154c:	88 97 60 33 10 00    	mov    %dl,0x103360(%edi)
  101552:	47                   	inc    %edi
  101553:	8d 4b 01             	lea    0x1(%ebx),%ecx
  101556:	8a 53 01             	mov    0x1(%ebx),%dl
  101559:	84 d2                	test   %dl,%dl
  10155b:	74 72                	je     1015cf <printk+0xa7>
  10155d:	80 fa 25             	cmp    $0x25,%dl
  101560:	75 e6                	jne    101548 <printk+0x20>
  101562:	8d 59 01             	lea    0x1(%ecx),%ebx
  101565:	8a 51 01             	mov    0x1(%ecx),%dl
  101568:	80 fa 64             	cmp    $0x64,%dl
  10156b:	0f 84 bf 00 00 00    	je     101630 <printk+0x108>
  101571:	0f 8e 01 01 00 00    	jle    101678 <printk+0x150>
  101577:	80 fa 73             	cmp    $0x73,%dl
  10157a:	0f 84 84 00 00 00    	je     101604 <printk+0xdc>
  101580:	80 fa 78             	cmp    $0x78,%dl
  101583:	75 c7                	jne    10154c <printk+0x24>
  101585:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10158c:	8d 70 04             	lea    0x4(%eax),%esi
  10158f:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  101592:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101595:	56                   	push   %esi
  101596:	ff 30                	pushl  (%eax)
  101598:	e8 17 ff ff ff       	call   1014b4 <i2X>
  10159d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  1015a0:	8d b7 60 33 10 00    	lea    0x103360(%edi),%esi
  1015a6:	8a 11                	mov    (%ecx),%dl
  1015a8:	83 c4 08             	add    $0x8,%esp
  1015ab:	31 c0                	xor    %eax,%eax
  1015ad:	84 d2                	test   %dl,%dl
  1015af:	74 0f                	je     1015c0 <printk+0x98>
  1015b1:	8d 76 00             	lea    0x0(%esi),%esi
  1015b4:	40                   	inc    %eax
  1015b5:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  1015b9:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  1015bc:	84 d2                	test   %dl,%dl
  1015be:	75 f4                	jne    1015b4 <printk+0x8c>
  1015c0:	01 c7                	add    %eax,%edi
  1015c2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1015c5:	8d 4b 01             	lea    0x1(%ebx),%ecx
  1015c8:	8a 53 01             	mov    0x1(%ebx),%dl
  1015cb:	84 d2                	test   %dl,%dl
  1015cd:	75 8e                	jne    10155d <printk+0x35>
  1015cf:	c6 87 60 33 10 00 00 	movb   $0x0,0x103360(%edi)
  1015d6:	0f be 05 60 33 10 00 	movsbl 0x103360,%eax
  1015dd:	bb 60 33 10 00       	mov    $0x103360,%ebx
  1015e2:	84 c0                	test   %al,%al
  1015e4:	74 16                	je     1015fc <printk+0xd4>
  1015e6:	66 90                	xchg   %ax,%ax
  1015e8:	83 ec 0c             	sub    $0xc,%esp
  1015eb:	50                   	push   %eax
  1015ec:	e8 c3 f1 ff ff       	call   1007b4 <putChar>
  1015f1:	43                   	inc    %ebx
  1015f2:	0f be 03             	movsbl (%ebx),%eax
  1015f5:	83 c4 10             	add    $0x10,%esp
  1015f8:	84 c0                	test   %al,%al
  1015fa:	75 ec                	jne    1015e8 <printk+0xc0>
  1015fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1015ff:	5b                   	pop    %ebx
  101600:	5e                   	pop    %esi
  101601:	5f                   	pop    %edi
  101602:	5d                   	pop    %ebp
  101603:	c3                   	ret    
  101604:	8d 70 04             	lea    0x4(%eax),%esi
  101607:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10160a:	8b 08                	mov    (%eax),%ecx
  10160c:	8d b7 60 33 10 00    	lea    0x103360(%edi),%esi
  101612:	8a 11                	mov    (%ecx),%dl
  101614:	31 c0                	xor    %eax,%eax
  101616:	84 d2                	test   %dl,%dl
  101618:	74 a6                	je     1015c0 <printk+0x98>
  10161a:	66 90                	xchg   %ax,%ax
  10161c:	40                   	inc    %eax
  10161d:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101621:	8a 14 08             	mov    (%eax,%ecx,1),%dl
  101624:	84 d2                	test   %dl,%dl
  101626:	75 f4                	jne    10161c <printk+0xf4>
  101628:	01 c7                	add    %eax,%edi
  10162a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10162d:	eb 96                	jmp    1015c5 <printk+0x9d>
  10162f:	90                   	nop
  101630:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  101637:	8d 70 04             	lea    0x4(%eax),%esi
  10163a:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10163d:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  101640:	56                   	push   %esi
  101641:	ff 30                	pushl  (%eax)
  101643:	e8 d0 fd ff ff       	call   101418 <i2A>
  101648:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  10164b:	8d b7 60 33 10 00    	lea    0x103360(%edi),%esi
  101651:	8a 11                	mov    (%ecx),%dl
  101653:	83 c4 08             	add    $0x8,%esp
  101656:	31 c0                	xor    %eax,%eax
  101658:	84 d2                	test   %dl,%dl
  10165a:	0f 84 60 ff ff ff    	je     1015c0 <printk+0x98>
  101660:	40                   	inc    %eax
  101661:	88 54 06 ff          	mov    %dl,-0x1(%esi,%eax,1)
  101665:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  101668:	84 d2                	test   %dl,%dl
  10166a:	75 f4                	jne    101660 <printk+0x138>
  10166c:	01 c7                	add    %eax,%edi
  10166e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101671:	e9 4f ff ff ff       	jmp    1015c5 <printk+0x9d>
  101676:	66 90                	xchg   %ax,%ax
  101678:	80 fa 63             	cmp    $0x63,%dl
  10167b:	0f 85 cb fe ff ff    	jne    10154c <printk+0x24>
  101681:	8b 10                	mov    (%eax),%edx
  101683:	88 97 60 33 10 00    	mov    %dl,0x103360(%edi)
  101689:	83 c0 04             	add    $0x4,%eax
  10168c:	47                   	inc    %edi
  10168d:	e9 c1 fe ff ff       	jmp    101553 <printk+0x2b>
  101692:	31 ff                	xor    %edi,%edi
  101694:	e9 36 ff ff ff       	jmp    1015cf <printk+0xa7>
  101699:	66 90                	xchg   %ax,%ax
  10169b:	90                   	nop

0010169c <abort>:
  10169c:	55                   	push   %ebp
  10169d:	89 e5                	mov    %esp,%ebp
  10169f:	57                   	push   %edi
  1016a0:	56                   	push   %esi
  1016a1:	53                   	push   %ebx
  1016a2:	83 ec 1c             	sub    $0x1c,%esp
  1016a5:	8b 55 08             	mov    0x8(%ebp),%edx
  1016a8:	fa                   	cli    
  1016a9:	8a 02                	mov    (%edx),%al
  1016ab:	b9 12 32 10 00       	mov    $0x103212,%ecx
  1016b0:	84 c0                	test   %al,%al
  1016b2:	74 0b                	je     1016bf <abort+0x23>
  1016b4:	41                   	inc    %ecx
  1016b5:	42                   	inc    %edx
  1016b6:	88 41 ff             	mov    %al,-0x1(%ecx)
  1016b9:	8a 02                	mov    (%edx),%al
  1016bb:	84 c0                	test   %al,%al
  1016bd:	75 f5                	jne    1016b4 <abort+0x18>
  1016bf:	c6 01 3a             	movb   $0x3a,(%ecx)
  1016c2:	bb 7d 3b 10 00       	mov    $0x103b7d,%ebx
  1016c7:	be 0a 00 00 00       	mov    $0xa,%esi
  1016cc:	bf 67 66 66 66       	mov    $0x66666667,%edi
  1016d1:	4b                   	dec    %ebx
  1016d2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1016d5:	99                   	cltd   
  1016d6:	f7 fe                	idiv   %esi
  1016d8:	8d 42 30             	lea    0x30(%edx),%eax
  1016db:	88 45 e7             	mov    %al,-0x19(%ebp)
  1016de:	88 03                	mov    %al,(%ebx)
  1016e0:	89 f8                	mov    %edi,%eax
  1016e2:	f7 6d 0c             	imull  0xc(%ebp)
  1016e5:	c1 fa 02             	sar    $0x2,%edx
  1016e8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1016eb:	c1 f8 1f             	sar    $0x1f,%eax
  1016ee:	29 c2                	sub    %eax,%edx
  1016f0:	89 55 0c             	mov    %edx,0xc(%ebp)
  1016f3:	75 dc                	jne    1016d1 <abort+0x35>
  1016f5:	41                   	inc    %ecx
  1016f6:	41                   	inc    %ecx
  1016f7:	43                   	inc    %ebx
  1016f8:	8a 45 e7             	mov    -0x19(%ebp),%al
  1016fb:	88 41 ff             	mov    %al,-0x1(%ecx)
  1016fe:	8a 03                	mov    (%ebx),%al
  101700:	88 45 e7             	mov    %al,-0x19(%ebp)
  101703:	84 c0                	test   %al,%al
  101705:	75 ef                	jne    1016f6 <abort+0x5a>
  101707:	c6 01 0a             	movb   $0xa,(%ecx)
  10170a:	0f be 05 00 32 10 00 	movsbl 0x103200,%eax
  101711:	84 c0                	test   %al,%al
  101713:	74 1b                	je     101730 <abort+0x94>
  101715:	bb 00 32 10 00       	mov    $0x103200,%ebx
  10171a:	83 ec 0c             	sub    $0xc,%esp
  10171d:	50                   	push   %eax
  10171e:	e8 91 f0 ff ff       	call   1007b4 <putChar>
  101723:	43                   	inc    %ebx
  101724:	0f be 03             	movsbl (%ebx),%eax
  101727:	83 c4 10             	add    $0x10,%esp
  10172a:	84 c0                	test   %al,%al
  10172c:	75 ec                	jne    10171a <abort+0x7e>
  10172e:	66 90                	xchg   %ax,%ax
  101730:	f4                   	hlt    
  101731:	eb fd                	jmp    101730 <abort+0x94>

00101733 <irqEmpty>:
  101733:	6a 00                	push   $0x0
  101735:	6a ff                	push   $0xffffffff
  101737:	eb 13                	jmp    10174c <asmDoIrq>

00101739 <irqGProtectFault>:
  101739:	6a 0d                	push   $0xd
  10173b:	eb 0f                	jmp    10174c <asmDoIrq>

0010173d <irqSyscall>:
  10173d:	6a 00                	push   $0x0
  10173f:	68 80 00 00 00       	push   $0x80
  101744:	eb 06                	jmp    10174c <asmDoIrq>

00101746 <irqTime>:
  101746:	6a 00                	push   $0x0
  101748:	6a 20                	push   $0x20
  10174a:	eb 00                	jmp    10174c <asmDoIrq>

0010174c <asmDoIrq>:
  10174c:	60                   	pusha  
  10174d:	54                   	push   %esp
  10174e:	e8 15 fb ff ff       	call   101268 <irqHandle>
  101753:	5c                   	pop    %esp
  101754:	61                   	popa   
  101755:	83 c4 04             	add    $0x4,%esp
  101758:	83 c4 04             	add    $0x4,%esp
  10175b:	cf                   	iret   
