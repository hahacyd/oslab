
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <enableInterrupt>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	fb                   	sti    
  100004:	90                   	nop
  100005:	5d                   	pop    %ebp
  100006:	c3                   	ret    

00100007 <kEntry>:
  100007:	55                   	push   %ebp
  100008:	89 e5                	mov    %esp,%ebp
  10000a:	83 ec 08             	sub    $0x8,%esp
  10000d:	83 ec 08             	sub    $0x8,%esp
  100010:	6a 00                	push   $0x0
  100012:	6a 00                	push   $0x0
  100014:	e8 40 10 00 00       	call   101059 <update_cursor>
  100019:	83 c4 10             	add    $0x10,%esp
  10001c:	e8 85 28 00 00       	call   1028a6 <initTimer>
  100021:	e8 17 1d 00 00       	call   101d3d <init_pcb>
  100026:	e8 d8 1d 00 00       	call   101e03 <init_kernel_pcb>
  10002b:	e8 d5 14 00 00       	call   101505 <initSerial>
  100030:	e8 16 20 00 00       	call   10204b <initIdt>
  100035:	e8 a9 27 00 00       	call   1027e3 <initIntr>
  10003a:	e8 12 05 00 00       	call   100551 <initSeg>
  10003f:	e8 bc ff ff ff       	call   100000 <enableInterrupt>
  100044:	e8 d1 0a 00 00       	call   100b1a <loadUMain>
  100049:	eb fe                	jmp    100049 <kEntry+0x42>

0010004b <setGdt>:
  10004b:	55                   	push   %ebp
  10004c:	89 e5                	mov    %esp,%ebp
  10004e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100051:	48                   	dec    %eax
  100052:	66 a3 40 42 10 00    	mov    %ax,0x104240
  100058:	8b 45 08             	mov    0x8(%ebp),%eax
  10005b:	66 a3 42 42 10 00    	mov    %ax,0x104242
  100061:	8b 45 08             	mov    0x8(%ebp),%eax
  100064:	c1 e8 10             	shr    $0x10,%eax
  100067:	66 a3 44 42 10 00    	mov    %ax,0x104244
  10006d:	b8 40 42 10 00       	mov    $0x104240,%eax
  100072:	0f 01 10             	lgdtl  (%eax)
  100075:	90                   	nop
  100076:	5d                   	pop    %ebp
  100077:	c3                   	ret    

00100078 <lLdt>:
  100078:	55                   	push   %ebp
  100079:	89 e5                	mov    %esp,%ebp
  10007b:	83 ec 04             	sub    $0x4,%esp
  10007e:	8b 45 08             	mov    0x8(%ebp),%eax
  100081:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  100085:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100088:	0f 00 d0             	lldt   %ax
  10008b:	90                   	nop
  10008c:	c9                   	leave  
  10008d:	c3                   	ret    

0010008e <inLong>:
  10008e:	55                   	push   %ebp
  10008f:	89 e5                	mov    %esp,%ebp
  100091:	83 ec 14             	sub    $0x14,%esp
  100094:	8b 45 08             	mov    0x8(%ebp),%eax
  100097:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  10009b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10009e:	89 c2                	mov    %eax,%edx
  1000a0:	ed                   	in     (%dx),%eax
  1000a1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1000a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1000a7:	c9                   	leave  
  1000a8:	c3                   	ret    

001000a9 <inByte>:
  1000a9:	55                   	push   %ebp
  1000aa:	89 e5                	mov    %esp,%ebp
  1000ac:	83 ec 14             	sub    $0x14,%esp
  1000af:	8b 45 08             	mov    0x8(%ebp),%eax
  1000b2:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  1000b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1000b9:	89 c2                	mov    %eax,%edx
  1000bb:	ec                   	in     (%dx),%al
  1000bc:	88 45 ff             	mov    %al,-0x1(%ebp)
  1000bf:	8a 45 ff             	mov    -0x1(%ebp),%al
  1000c2:	c9                   	leave  
  1000c3:	c3                   	ret    

001000c4 <outByte>:
  1000c4:	55                   	push   %ebp
  1000c5:	89 e5                	mov    %esp,%ebp
  1000c7:	83 ec 08             	sub    $0x8,%esp
  1000ca:	8b 45 08             	mov    0x8(%ebp),%eax
  1000cd:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000d0:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  1000d4:	88 55 f8             	mov    %dl,-0x8(%ebp)
  1000d7:	8a 45 f8             	mov    -0x8(%ebp),%al
  1000da:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1000dd:	ee                   	out    %al,(%dx)
  1000de:	90                   	nop
  1000df:	c9                   	leave  
  1000e0:	c3                   	ret    

001000e1 <change_gdt>:
  1000e1:	55                   	push   %ebp
  1000e2:	89 e5                	mov    %esp,%ebp
  1000e4:	83 ec 18             	sub    $0x18,%esp
  1000e7:	8b 45 08             	mov    0x8(%ebp),%eax
  1000ea:	c1 e8 03             	shr    $0x3,%eax
  1000ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1000f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1000f3:	83 f8 02             	cmp    $0x2,%eax
  1000f6:	0f 84 cf 00 00 00    	je     1001cb <change_gdt+0xea>
  1000fc:	83 f8 02             	cmp    $0x2,%eax
  1000ff:	77 0a                	ja     10010b <change_gdt+0x2a>
  100101:	83 f8 01             	cmp    $0x1,%eax
  100104:	74 1c                	je     100122 <change_gdt+0x41>
  100106:	e9 b8 02 00 00       	jmp    1003c3 <change_gdt+0x2e2>
  10010b:	83 f8 03             	cmp    $0x3,%eax
  10010e:	0f 84 60 01 00 00    	je     100274 <change_gdt+0x193>
  100114:	83 f8 04             	cmp    $0x4,%eax
  100117:	0f 84 00 02 00 00    	je     10031d <change_gdt+0x23c>
  10011d:	e9 a1 02 00 00       	jmp    1003c3 <change_gdt+0x2e2>
  100122:	8b 45 0c             	mov    0xc(%ebp),%eax
  100125:	8b 55 0c             	mov    0xc(%ebp),%edx
  100128:	c1 ea 10             	shr    $0x10,%edx
  10012b:	88 d1                	mov    %dl,%cl
  10012d:	8b 55 0c             	mov    0xc(%ebp),%edx
  100130:	c1 ea 18             	shr    $0x18,%edx
  100133:	66 c7 05 08 cb 13 01 	movw   $0xffff,0x113cb08
  10013a:	ff ff 
  10013c:	66 a3 0a cb 13 01    	mov    %ax,0x113cb0a
  100142:	88 0d 0c cb 13 01    	mov    %cl,0x113cb0c
  100148:	a0 0d cb 13 01       	mov    0x113cb0d,%al
  10014d:	83 e0 f0             	and    $0xfffffff0,%eax
  100150:	83 c8 0a             	or     $0xa,%eax
  100153:	a2 0d cb 13 01       	mov    %al,0x113cb0d
  100158:	a0 0d cb 13 01       	mov    0x113cb0d,%al
  10015d:	83 c8 10             	or     $0x10,%eax
  100160:	a2 0d cb 13 01       	mov    %al,0x113cb0d
  100165:	a0 0d cb 13 01       	mov    0x113cb0d,%al
  10016a:	83 e0 9f             	and    $0xffffff9f,%eax
  10016d:	a2 0d cb 13 01       	mov    %al,0x113cb0d
  100172:	a0 0d cb 13 01       	mov    0x113cb0d,%al
  100177:	83 c8 80             	or     $0xffffff80,%eax
  10017a:	a2 0d cb 13 01       	mov    %al,0x113cb0d
  10017f:	a0 0e cb 13 01       	mov    0x113cb0e,%al
  100184:	83 c8 0f             	or     $0xf,%eax
  100187:	a2 0e cb 13 01       	mov    %al,0x113cb0e
  10018c:	a0 0e cb 13 01       	mov    0x113cb0e,%al
  100191:	83 e0 ef             	and    $0xffffffef,%eax
  100194:	a2 0e cb 13 01       	mov    %al,0x113cb0e
  100199:	a0 0e cb 13 01       	mov    0x113cb0e,%al
  10019e:	83 e0 df             	and    $0xffffffdf,%eax
  1001a1:	a2 0e cb 13 01       	mov    %al,0x113cb0e
  1001a6:	a0 0e cb 13 01       	mov    0x113cb0e,%al
  1001ab:	83 c8 40             	or     $0x40,%eax
  1001ae:	a2 0e cb 13 01       	mov    %al,0x113cb0e
  1001b3:	a0 0e cb 13 01       	mov    0x113cb0e,%al
  1001b8:	83 c8 80             	or     $0xffffff80,%eax
  1001bb:	a2 0e cb 13 01       	mov    %al,0x113cb0e
  1001c0:	88 15 0f cb 13 01    	mov    %dl,0x113cb0f
  1001c6:	e9 49 02 00 00       	jmp    100414 <change_gdt+0x333>
  1001cb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1001ce:	8b 55 0c             	mov    0xc(%ebp),%edx
  1001d1:	c1 ea 10             	shr    $0x10,%edx
  1001d4:	88 d1                	mov    %dl,%cl
  1001d6:	8b 55 0c             	mov    0xc(%ebp),%edx
  1001d9:	c1 ea 18             	shr    $0x18,%edx
  1001dc:	66 c7 05 10 cb 13 01 	movw   $0xffff,0x113cb10
  1001e3:	ff ff 
  1001e5:	66 a3 12 cb 13 01    	mov    %ax,0x113cb12
  1001eb:	88 0d 14 cb 13 01    	mov    %cl,0x113cb14
  1001f1:	a0 15 cb 13 01       	mov    0x113cb15,%al
  1001f6:	83 e0 f0             	and    $0xfffffff0,%eax
  1001f9:	83 c8 02             	or     $0x2,%eax
  1001fc:	a2 15 cb 13 01       	mov    %al,0x113cb15
  100201:	a0 15 cb 13 01       	mov    0x113cb15,%al
  100206:	83 c8 10             	or     $0x10,%eax
  100209:	a2 15 cb 13 01       	mov    %al,0x113cb15
  10020e:	a0 15 cb 13 01       	mov    0x113cb15,%al
  100213:	83 e0 9f             	and    $0xffffff9f,%eax
  100216:	a2 15 cb 13 01       	mov    %al,0x113cb15
  10021b:	a0 15 cb 13 01       	mov    0x113cb15,%al
  100220:	83 c8 80             	or     $0xffffff80,%eax
  100223:	a2 15 cb 13 01       	mov    %al,0x113cb15
  100228:	a0 16 cb 13 01       	mov    0x113cb16,%al
  10022d:	83 c8 0f             	or     $0xf,%eax
  100230:	a2 16 cb 13 01       	mov    %al,0x113cb16
  100235:	a0 16 cb 13 01       	mov    0x113cb16,%al
  10023a:	83 e0 ef             	and    $0xffffffef,%eax
  10023d:	a2 16 cb 13 01       	mov    %al,0x113cb16
  100242:	a0 16 cb 13 01       	mov    0x113cb16,%al
  100247:	83 e0 df             	and    $0xffffffdf,%eax
  10024a:	a2 16 cb 13 01       	mov    %al,0x113cb16
  10024f:	a0 16 cb 13 01       	mov    0x113cb16,%al
  100254:	83 c8 40             	or     $0x40,%eax
  100257:	a2 16 cb 13 01       	mov    %al,0x113cb16
  10025c:	a0 16 cb 13 01       	mov    0x113cb16,%al
  100261:	83 c8 80             	or     $0xffffff80,%eax
  100264:	a2 16 cb 13 01       	mov    %al,0x113cb16
  100269:	88 15 17 cb 13 01    	mov    %dl,0x113cb17
  10026f:	e9 a0 01 00 00       	jmp    100414 <change_gdt+0x333>
  100274:	8b 45 0c             	mov    0xc(%ebp),%eax
  100277:	8b 55 0c             	mov    0xc(%ebp),%edx
  10027a:	c1 ea 10             	shr    $0x10,%edx
  10027d:	88 d1                	mov    %dl,%cl
  10027f:	8b 55 0c             	mov    0xc(%ebp),%edx
  100282:	c1 ea 18             	shr    $0x18,%edx
  100285:	66 c7 05 18 cb 13 01 	movw   $0xffff,0x113cb18
  10028c:	ff ff 
  10028e:	66 a3 1a cb 13 01    	mov    %ax,0x113cb1a
  100294:	88 0d 1c cb 13 01    	mov    %cl,0x113cb1c
  10029a:	a0 1d cb 13 01       	mov    0x113cb1d,%al
  10029f:	83 e0 f0             	and    $0xfffffff0,%eax
  1002a2:	83 c8 0a             	or     $0xa,%eax
  1002a5:	a2 1d cb 13 01       	mov    %al,0x113cb1d
  1002aa:	a0 1d cb 13 01       	mov    0x113cb1d,%al
  1002af:	83 c8 10             	or     $0x10,%eax
  1002b2:	a2 1d cb 13 01       	mov    %al,0x113cb1d
  1002b7:	a0 1d cb 13 01       	mov    0x113cb1d,%al
  1002bc:	83 c8 60             	or     $0x60,%eax
  1002bf:	a2 1d cb 13 01       	mov    %al,0x113cb1d
  1002c4:	a0 1d cb 13 01       	mov    0x113cb1d,%al
  1002c9:	83 c8 80             	or     $0xffffff80,%eax
  1002cc:	a2 1d cb 13 01       	mov    %al,0x113cb1d
  1002d1:	a0 1e cb 13 01       	mov    0x113cb1e,%al
  1002d6:	83 c8 0f             	or     $0xf,%eax
  1002d9:	a2 1e cb 13 01       	mov    %al,0x113cb1e
  1002de:	a0 1e cb 13 01       	mov    0x113cb1e,%al
  1002e3:	83 e0 ef             	and    $0xffffffef,%eax
  1002e6:	a2 1e cb 13 01       	mov    %al,0x113cb1e
  1002eb:	a0 1e cb 13 01       	mov    0x113cb1e,%al
  1002f0:	83 e0 df             	and    $0xffffffdf,%eax
  1002f3:	a2 1e cb 13 01       	mov    %al,0x113cb1e
  1002f8:	a0 1e cb 13 01       	mov    0x113cb1e,%al
  1002fd:	83 c8 40             	or     $0x40,%eax
  100300:	a2 1e cb 13 01       	mov    %al,0x113cb1e
  100305:	a0 1e cb 13 01       	mov    0x113cb1e,%al
  10030a:	83 c8 80             	or     $0xffffff80,%eax
  10030d:	a2 1e cb 13 01       	mov    %al,0x113cb1e
  100312:	88 15 1f cb 13 01    	mov    %dl,0x113cb1f
  100318:	e9 f7 00 00 00       	jmp    100414 <change_gdt+0x333>
  10031d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100320:	8b 55 0c             	mov    0xc(%ebp),%edx
  100323:	c1 ea 10             	shr    $0x10,%edx
  100326:	88 d1                	mov    %dl,%cl
  100328:	8b 55 0c             	mov    0xc(%ebp),%edx
  10032b:	c1 ea 18             	shr    $0x18,%edx
  10032e:	66 c7 05 20 cb 13 01 	movw   $0xffff,0x113cb20
  100335:	ff ff 
  100337:	66 a3 22 cb 13 01    	mov    %ax,0x113cb22
  10033d:	88 0d 24 cb 13 01    	mov    %cl,0x113cb24
  100343:	a0 25 cb 13 01       	mov    0x113cb25,%al
  100348:	83 e0 f0             	and    $0xfffffff0,%eax
  10034b:	83 c8 02             	or     $0x2,%eax
  10034e:	a2 25 cb 13 01       	mov    %al,0x113cb25
  100353:	a0 25 cb 13 01       	mov    0x113cb25,%al
  100358:	83 c8 10             	or     $0x10,%eax
  10035b:	a2 25 cb 13 01       	mov    %al,0x113cb25
  100360:	a0 25 cb 13 01       	mov    0x113cb25,%al
  100365:	83 c8 60             	or     $0x60,%eax
  100368:	a2 25 cb 13 01       	mov    %al,0x113cb25
  10036d:	a0 25 cb 13 01       	mov    0x113cb25,%al
  100372:	83 c8 80             	or     $0xffffff80,%eax
  100375:	a2 25 cb 13 01       	mov    %al,0x113cb25
  10037a:	a0 26 cb 13 01       	mov    0x113cb26,%al
  10037f:	83 c8 0f             	or     $0xf,%eax
  100382:	a2 26 cb 13 01       	mov    %al,0x113cb26
  100387:	a0 26 cb 13 01       	mov    0x113cb26,%al
  10038c:	83 e0 ef             	and    $0xffffffef,%eax
  10038f:	a2 26 cb 13 01       	mov    %al,0x113cb26
  100394:	a0 26 cb 13 01       	mov    0x113cb26,%al
  100399:	83 e0 df             	and    $0xffffffdf,%eax
  10039c:	a2 26 cb 13 01       	mov    %al,0x113cb26
  1003a1:	a0 26 cb 13 01       	mov    0x113cb26,%al
  1003a6:	83 c8 40             	or     $0x40,%eax
  1003a9:	a2 26 cb 13 01       	mov    %al,0x113cb26
  1003ae:	a0 26 cb 13 01       	mov    0x113cb26,%al
  1003b3:	83 c8 80             	or     $0xffffff80,%eax
  1003b6:	a2 26 cb 13 01       	mov    %al,0x113cb26
  1003bb:	88 15 27 cb 13 01    	mov    %dl,0x113cb27
  1003c1:	eb 51                	jmp    100414 <change_gdt+0x333>
  1003c3:	83 ec 0c             	sub    $0xc,%esp
  1003c6:	68 2c 2e 10 00       	push   $0x102e2c
  1003cb:	e8 45 27 00 00       	call   102b15 <printk>
  1003d0:	83 c4 10             	add    $0x10,%esp
  1003d3:	83 ec 0c             	sub    $0xc,%esp
  1003d6:	ff 75 f4             	pushl  -0xc(%ebp)
  1003d9:	68 6c 2e 10 00       	push   $0x102e6c
  1003de:	6a 17                	push   $0x17
  1003e0:	68 32 2e 10 00       	push   $0x102e32
  1003e5:	68 3f 2e 10 00       	push   $0x102e3f
  1003ea:	e8 26 27 00 00       	call   102b15 <printk>
  1003ef:	83 c4 20             	add    $0x20,%esp
  1003f2:	83 ec 0c             	sub    $0xc,%esp
  1003f5:	68 5b 2e 10 00       	push   $0x102e5b
  1003fa:	e8 16 27 00 00       	call   102b15 <printk>
  1003ff:	83 c4 10             	add    $0x10,%esp
  100402:	83 ec 08             	sub    $0x8,%esp
  100405:	6a 18                	push   $0x18
  100407:	68 32 2e 10 00       	push   $0x102e32
  10040c:	e8 c0 29 00 00       	call   102dd1 <abort>
  100411:	83 c4 10             	add    $0x10,%esp
  100414:	83 ec 08             	sub    $0x8,%esp
  100417:	6a 50                	push   $0x50
  100419:	68 00 cb 13 01       	push   $0x113cb00
  10041e:	e8 28 fc ff ff       	call   10004b <setGdt>
  100423:	83 c4 10             	add    $0x10,%esp
  100426:	b8 01 00 00 00       	mov    $0x1,%eax
  10042b:	c9                   	leave  
  10042c:	c3                   	ret    

0010042d <change_tss>:
  10042d:	55                   	push   %ebp
  10042e:	89 e5                	mov    %esp,%ebp
  100430:	8b 45 08             	mov    0x8(%ebp),%eax
  100433:	a3 68 cb 13 01       	mov    %eax,0x113cb68
  100438:	8b 45 0c             	mov    0xc(%ebp),%eax
  10043b:	a3 64 cb 13 01       	mov    %eax,0x113cb64
  100440:	b8 01 00 00 00       	mov    $0x1,%eax
  100445:	5d                   	pop    %ebp
  100446:	c3                   	ret    

00100447 <get_tss>:
  100447:	55                   	push   %ebp
  100448:	89 e5                	mov    %esp,%ebp
  10044a:	57                   	push   %edi
  10044b:	56                   	push   %esi
  10044c:	53                   	push   %ebx
  10044d:	8b 45 08             	mov    0x8(%ebp),%eax
  100450:	89 c2                	mov    %eax,%edx
  100452:	bb 60 cb 13 01       	mov    $0x113cb60,%ebx
  100457:	b8 19 00 00 00       	mov    $0x19,%eax
  10045c:	89 d7                	mov    %edx,%edi
  10045e:	89 de                	mov    %ebx,%esi
  100460:	89 c1                	mov    %eax,%ecx
  100462:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100464:	8b 45 08             	mov    0x8(%ebp),%eax
  100467:	5b                   	pop    %ebx
  100468:	5e                   	pop    %esi
  100469:	5f                   	pop    %edi
  10046a:	5d                   	pop    %ebp
  10046b:	c2 04 00             	ret    $0x4

0010046e <waitDisk>:
  10046e:	55                   	push   %ebp
  10046f:	89 e5                	mov    %esp,%ebp
  100471:	90                   	nop
  100472:	68 f7 01 00 00       	push   $0x1f7
  100477:	e8 2d fc ff ff       	call   1000a9 <inByte>
  10047c:	83 c4 04             	add    $0x4,%esp
  10047f:	0f b6 c0             	movzbl %al,%eax
  100482:	25 c0 00 00 00       	and    $0xc0,%eax
  100487:	83 f8 40             	cmp    $0x40,%eax
  10048a:	75 e6                	jne    100472 <waitDisk+0x4>
  10048c:	90                   	nop
  10048d:	c9                   	leave  
  10048e:	c3                   	ret    

0010048f <readSect>:
  10048f:	55                   	push   %ebp
  100490:	89 e5                	mov    %esp,%ebp
  100492:	53                   	push   %ebx
  100493:	83 ec 10             	sub    $0x10,%esp
  100496:	e8 d3 ff ff ff       	call   10046e <waitDisk>
  10049b:	6a 01                	push   $0x1
  10049d:	68 f2 01 00 00       	push   $0x1f2
  1004a2:	e8 1d fc ff ff       	call   1000c4 <outByte>
  1004a7:	83 c4 08             	add    $0x8,%esp
  1004aa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004ad:	0f be c0             	movsbl %al,%eax
  1004b0:	50                   	push   %eax
  1004b1:	68 f3 01 00 00       	push   $0x1f3
  1004b6:	e8 09 fc ff ff       	call   1000c4 <outByte>
  1004bb:	83 c4 08             	add    $0x8,%esp
  1004be:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004c1:	c1 f8 08             	sar    $0x8,%eax
  1004c4:	0f be c0             	movsbl %al,%eax
  1004c7:	50                   	push   %eax
  1004c8:	68 f4 01 00 00       	push   $0x1f4
  1004cd:	e8 f2 fb ff ff       	call   1000c4 <outByte>
  1004d2:	83 c4 08             	add    $0x8,%esp
  1004d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004d8:	c1 f8 10             	sar    $0x10,%eax
  1004db:	0f be c0             	movsbl %al,%eax
  1004de:	50                   	push   %eax
  1004df:	68 f5 01 00 00       	push   $0x1f5
  1004e4:	e8 db fb ff ff       	call   1000c4 <outByte>
  1004e9:	83 c4 08             	add    $0x8,%esp
  1004ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004ef:	c1 f8 18             	sar    $0x18,%eax
  1004f2:	83 c8 e0             	or     $0xffffffe0,%eax
  1004f5:	0f be c0             	movsbl %al,%eax
  1004f8:	50                   	push   %eax
  1004f9:	68 f6 01 00 00       	push   $0x1f6
  1004fe:	e8 c1 fb ff ff       	call   1000c4 <outByte>
  100503:	83 c4 08             	add    $0x8,%esp
  100506:	6a 20                	push   $0x20
  100508:	68 f7 01 00 00       	push   $0x1f7
  10050d:	e8 b2 fb ff ff       	call   1000c4 <outByte>
  100512:	83 c4 08             	add    $0x8,%esp
  100515:	e8 54 ff ff ff       	call   10046e <waitDisk>
  10051a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  100521:	eb 22                	jmp    100545 <readSect+0xb6>
  100523:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100526:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  10052d:	8b 45 08             	mov    0x8(%ebp),%eax
  100530:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
  100533:	68 f0 01 00 00       	push   $0x1f0
  100538:	e8 51 fb ff ff       	call   10008e <inLong>
  10053d:	83 c4 04             	add    $0x4,%esp
  100540:	89 03                	mov    %eax,(%ebx)
  100542:	ff 45 f8             	incl   -0x8(%ebp)
  100545:	83 7d f8 7f          	cmpl   $0x7f,-0x8(%ebp)
  100549:	7e d8                	jle    100523 <readSect+0x94>
  10054b:	90                   	nop
  10054c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10054f:	c9                   	leave  
  100550:	c3                   	ret    

00100551 <initSeg>:
  100551:	55                   	push   %ebp
  100552:	89 e5                	mov    %esp,%ebp
  100554:	66 c7 05 08 cb 13 01 	movw   $0xffff,0x113cb08
  10055b:	ff ff 
  10055d:	66 c7 05 0a cb 13 01 	movw   $0x0,0x113cb0a
  100564:	00 00 
  100566:	c6 05 0c cb 13 01 00 	movb   $0x0,0x113cb0c
  10056d:	a0 0d cb 13 01       	mov    0x113cb0d,%al
  100572:	83 e0 f0             	and    $0xfffffff0,%eax
  100575:	83 c8 0a             	or     $0xa,%eax
  100578:	a2 0d cb 13 01       	mov    %al,0x113cb0d
  10057d:	a0 0d cb 13 01       	mov    0x113cb0d,%al
  100582:	83 c8 10             	or     $0x10,%eax
  100585:	a2 0d cb 13 01       	mov    %al,0x113cb0d
  10058a:	a0 0d cb 13 01       	mov    0x113cb0d,%al
  10058f:	83 e0 9f             	and    $0xffffff9f,%eax
  100592:	a2 0d cb 13 01       	mov    %al,0x113cb0d
  100597:	a0 0d cb 13 01       	mov    0x113cb0d,%al
  10059c:	83 c8 80             	or     $0xffffff80,%eax
  10059f:	a2 0d cb 13 01       	mov    %al,0x113cb0d
  1005a4:	a0 0e cb 13 01       	mov    0x113cb0e,%al
  1005a9:	83 c8 0f             	or     $0xf,%eax
  1005ac:	a2 0e cb 13 01       	mov    %al,0x113cb0e
  1005b1:	a0 0e cb 13 01       	mov    0x113cb0e,%al
  1005b6:	83 e0 ef             	and    $0xffffffef,%eax
  1005b9:	a2 0e cb 13 01       	mov    %al,0x113cb0e
  1005be:	a0 0e cb 13 01       	mov    0x113cb0e,%al
  1005c3:	83 e0 df             	and    $0xffffffdf,%eax
  1005c6:	a2 0e cb 13 01       	mov    %al,0x113cb0e
  1005cb:	a0 0e cb 13 01       	mov    0x113cb0e,%al
  1005d0:	83 c8 40             	or     $0x40,%eax
  1005d3:	a2 0e cb 13 01       	mov    %al,0x113cb0e
  1005d8:	a0 0e cb 13 01       	mov    0x113cb0e,%al
  1005dd:	83 c8 80             	or     $0xffffff80,%eax
  1005e0:	a2 0e cb 13 01       	mov    %al,0x113cb0e
  1005e5:	c6 05 0f cb 13 01 00 	movb   $0x0,0x113cb0f
  1005ec:	66 c7 05 10 cb 13 01 	movw   $0xffff,0x113cb10
  1005f3:	ff ff 
  1005f5:	66 c7 05 12 cb 13 01 	movw   $0x0,0x113cb12
  1005fc:	00 00 
  1005fe:	c6 05 14 cb 13 01 00 	movb   $0x0,0x113cb14
  100605:	a0 15 cb 13 01       	mov    0x113cb15,%al
  10060a:	83 e0 f0             	and    $0xfffffff0,%eax
  10060d:	83 c8 02             	or     $0x2,%eax
  100610:	a2 15 cb 13 01       	mov    %al,0x113cb15
  100615:	a0 15 cb 13 01       	mov    0x113cb15,%al
  10061a:	83 c8 10             	or     $0x10,%eax
  10061d:	a2 15 cb 13 01       	mov    %al,0x113cb15
  100622:	a0 15 cb 13 01       	mov    0x113cb15,%al
  100627:	83 e0 9f             	and    $0xffffff9f,%eax
  10062a:	a2 15 cb 13 01       	mov    %al,0x113cb15
  10062f:	a0 15 cb 13 01       	mov    0x113cb15,%al
  100634:	83 c8 80             	or     $0xffffff80,%eax
  100637:	a2 15 cb 13 01       	mov    %al,0x113cb15
  10063c:	a0 16 cb 13 01       	mov    0x113cb16,%al
  100641:	83 c8 0f             	or     $0xf,%eax
  100644:	a2 16 cb 13 01       	mov    %al,0x113cb16
  100649:	a0 16 cb 13 01       	mov    0x113cb16,%al
  10064e:	83 e0 ef             	and    $0xffffffef,%eax
  100651:	a2 16 cb 13 01       	mov    %al,0x113cb16
  100656:	a0 16 cb 13 01       	mov    0x113cb16,%al
  10065b:	83 e0 df             	and    $0xffffffdf,%eax
  10065e:	a2 16 cb 13 01       	mov    %al,0x113cb16
  100663:	a0 16 cb 13 01       	mov    0x113cb16,%al
  100668:	83 c8 40             	or     $0x40,%eax
  10066b:	a2 16 cb 13 01       	mov    %al,0x113cb16
  100670:	a0 16 cb 13 01       	mov    0x113cb16,%al
  100675:	83 c8 80             	or     $0xffffff80,%eax
  100678:	a2 16 cb 13 01       	mov    %al,0x113cb16
  10067d:	c6 05 17 cb 13 01 00 	movb   $0x0,0x113cb17
  100684:	66 c7 05 18 cb 13 01 	movw   $0xffff,0x113cb18
  10068b:	ff ff 
  10068d:	66 c7 05 1a cb 13 01 	movw   $0x0,0x113cb1a
  100694:	00 00 
  100696:	c6 05 1c cb 13 01 00 	movb   $0x0,0x113cb1c
  10069d:	a0 1d cb 13 01       	mov    0x113cb1d,%al
  1006a2:	83 e0 f0             	and    $0xfffffff0,%eax
  1006a5:	83 c8 0a             	or     $0xa,%eax
  1006a8:	a2 1d cb 13 01       	mov    %al,0x113cb1d
  1006ad:	a0 1d cb 13 01       	mov    0x113cb1d,%al
  1006b2:	83 c8 10             	or     $0x10,%eax
  1006b5:	a2 1d cb 13 01       	mov    %al,0x113cb1d
  1006ba:	a0 1d cb 13 01       	mov    0x113cb1d,%al
  1006bf:	83 c8 60             	or     $0x60,%eax
  1006c2:	a2 1d cb 13 01       	mov    %al,0x113cb1d
  1006c7:	a0 1d cb 13 01       	mov    0x113cb1d,%al
  1006cc:	83 c8 80             	or     $0xffffff80,%eax
  1006cf:	a2 1d cb 13 01       	mov    %al,0x113cb1d
  1006d4:	a0 1e cb 13 01       	mov    0x113cb1e,%al
  1006d9:	83 c8 0f             	or     $0xf,%eax
  1006dc:	a2 1e cb 13 01       	mov    %al,0x113cb1e
  1006e1:	a0 1e cb 13 01       	mov    0x113cb1e,%al
  1006e6:	83 e0 ef             	and    $0xffffffef,%eax
  1006e9:	a2 1e cb 13 01       	mov    %al,0x113cb1e
  1006ee:	a0 1e cb 13 01       	mov    0x113cb1e,%al
  1006f3:	83 e0 df             	and    $0xffffffdf,%eax
  1006f6:	a2 1e cb 13 01       	mov    %al,0x113cb1e
  1006fb:	a0 1e cb 13 01       	mov    0x113cb1e,%al
  100700:	83 c8 40             	or     $0x40,%eax
  100703:	a2 1e cb 13 01       	mov    %al,0x113cb1e
  100708:	a0 1e cb 13 01       	mov    0x113cb1e,%al
  10070d:	83 c8 80             	or     $0xffffff80,%eax
  100710:	a2 1e cb 13 01       	mov    %al,0x113cb1e
  100715:	c6 05 1f cb 13 01 00 	movb   $0x0,0x113cb1f
  10071c:	66 c7 05 20 cb 13 01 	movw   $0xffff,0x113cb20
  100723:	ff ff 
  100725:	66 c7 05 22 cb 13 01 	movw   $0x0,0x113cb22
  10072c:	00 00 
  10072e:	c6 05 24 cb 13 01 00 	movb   $0x0,0x113cb24
  100735:	a0 25 cb 13 01       	mov    0x113cb25,%al
  10073a:	83 e0 f0             	and    $0xfffffff0,%eax
  10073d:	83 c8 02             	or     $0x2,%eax
  100740:	a2 25 cb 13 01       	mov    %al,0x113cb25
  100745:	a0 25 cb 13 01       	mov    0x113cb25,%al
  10074a:	83 c8 10             	or     $0x10,%eax
  10074d:	a2 25 cb 13 01       	mov    %al,0x113cb25
  100752:	a0 25 cb 13 01       	mov    0x113cb25,%al
  100757:	83 c8 60             	or     $0x60,%eax
  10075a:	a2 25 cb 13 01       	mov    %al,0x113cb25
  10075f:	a0 25 cb 13 01       	mov    0x113cb25,%al
  100764:	83 c8 80             	or     $0xffffff80,%eax
  100767:	a2 25 cb 13 01       	mov    %al,0x113cb25
  10076c:	a0 26 cb 13 01       	mov    0x113cb26,%al
  100771:	83 c8 0f             	or     $0xf,%eax
  100774:	a2 26 cb 13 01       	mov    %al,0x113cb26
  100779:	a0 26 cb 13 01       	mov    0x113cb26,%al
  10077e:	83 e0 ef             	and    $0xffffffef,%eax
  100781:	a2 26 cb 13 01       	mov    %al,0x113cb26
  100786:	a0 26 cb 13 01       	mov    0x113cb26,%al
  10078b:	83 e0 df             	and    $0xffffffdf,%eax
  10078e:	a2 26 cb 13 01       	mov    %al,0x113cb26
  100793:	a0 26 cb 13 01       	mov    0x113cb26,%al
  100798:	83 c8 40             	or     $0x40,%eax
  10079b:	a2 26 cb 13 01       	mov    %al,0x113cb26
  1007a0:	a0 26 cb 13 01       	mov    0x113cb26,%al
  1007a5:	83 c8 80             	or     $0xffffff80,%eax
  1007a8:	a2 26 cb 13 01       	mov    %al,0x113cb26
  1007ad:	c6 05 27 cb 13 01 00 	movb   $0x0,0x113cb27
  1007b4:	66 c7 05 28 cb 13 01 	movw   $0x63,0x113cb28
  1007bb:	63 00 
  1007bd:	b8 60 cb 13 01       	mov    $0x113cb60,%eax
  1007c2:	66 a3 2a cb 13 01    	mov    %ax,0x113cb2a
  1007c8:	b8 60 cb 13 01       	mov    $0x113cb60,%eax
  1007cd:	c1 e8 10             	shr    $0x10,%eax
  1007d0:	a2 2c cb 13 01       	mov    %al,0x113cb2c
  1007d5:	a0 2d cb 13 01       	mov    0x113cb2d,%al
  1007da:	83 e0 f0             	and    $0xfffffff0,%eax
  1007dd:	83 c8 09             	or     $0x9,%eax
  1007e0:	a2 2d cb 13 01       	mov    %al,0x113cb2d
  1007e5:	a0 2d cb 13 01       	mov    0x113cb2d,%al
  1007ea:	83 e0 ef             	and    $0xffffffef,%eax
  1007ed:	a2 2d cb 13 01       	mov    %al,0x113cb2d
  1007f2:	a0 2d cb 13 01       	mov    0x113cb2d,%al
  1007f7:	83 e0 9f             	and    $0xffffff9f,%eax
  1007fa:	a2 2d cb 13 01       	mov    %al,0x113cb2d
  1007ff:	a0 2d cb 13 01       	mov    0x113cb2d,%al
  100804:	83 c8 80             	or     $0xffffff80,%eax
  100807:	a2 2d cb 13 01       	mov    %al,0x113cb2d
  10080c:	a0 2e cb 13 01       	mov    0x113cb2e,%al
  100811:	83 e0 f0             	and    $0xfffffff0,%eax
  100814:	a2 2e cb 13 01       	mov    %al,0x113cb2e
  100819:	a0 2e cb 13 01       	mov    0x113cb2e,%al
  10081e:	83 e0 ef             	and    $0xffffffef,%eax
  100821:	a2 2e cb 13 01       	mov    %al,0x113cb2e
  100826:	a0 2e cb 13 01       	mov    0x113cb2e,%al
  10082b:	83 e0 df             	and    $0xffffffdf,%eax
  10082e:	a2 2e cb 13 01       	mov    %al,0x113cb2e
  100833:	a0 2e cb 13 01       	mov    0x113cb2e,%al
  100838:	83 c8 40             	or     $0x40,%eax
  10083b:	a2 2e cb 13 01       	mov    %al,0x113cb2e
  100840:	a0 2e cb 13 01       	mov    0x113cb2e,%al
  100845:	83 e0 7f             	and    $0x7f,%eax
  100848:	a2 2e cb 13 01       	mov    %al,0x113cb2e
  10084d:	b8 60 cb 13 01       	mov    $0x113cb60,%eax
  100852:	c1 e8 18             	shr    $0x18,%eax
  100855:	a2 2f cb 13 01       	mov    %al,0x113cb2f
  10085a:	a0 2d cb 13 01       	mov    0x113cb2d,%al
  10085f:	83 e0 ef             	and    $0xffffffef,%eax
  100862:	a2 2d cb 13 01       	mov    %al,0x113cb2d
  100867:	a1 64 2e 10 00       	mov    0x102e64,%eax
  10086c:	8b 15 68 2e 10 00    	mov    0x102e68,%edx
  100872:	a3 30 cb 13 01       	mov    %eax,0x113cb30
  100877:	89 15 34 cb 13 01    	mov    %edx,0x113cb34
  10087d:	66 c7 05 40 cb 13 01 	movw   $0xffff,0x113cb40
  100884:	ff ff 
  100886:	66 c7 05 42 cb 13 01 	movw   $0x0,0x113cb42
  10088d:	00 00 
  10088f:	c6 05 44 cb 13 01 00 	movb   $0x0,0x113cb44
  100896:	a0 45 cb 13 01       	mov    0x113cb45,%al
  10089b:	83 e0 f0             	and    $0xfffffff0,%eax
  10089e:	83 c8 02             	or     $0x2,%eax
  1008a1:	a2 45 cb 13 01       	mov    %al,0x113cb45
  1008a6:	a0 45 cb 13 01       	mov    0x113cb45,%al
  1008ab:	83 c8 10             	or     $0x10,%eax
  1008ae:	a2 45 cb 13 01       	mov    %al,0x113cb45
  1008b3:	a0 45 cb 13 01       	mov    0x113cb45,%al
  1008b8:	83 c8 60             	or     $0x60,%eax
  1008bb:	a2 45 cb 13 01       	mov    %al,0x113cb45
  1008c0:	a0 45 cb 13 01       	mov    0x113cb45,%al
  1008c5:	83 c8 80             	or     $0xffffff80,%eax
  1008c8:	a2 45 cb 13 01       	mov    %al,0x113cb45
  1008cd:	a0 46 cb 13 01       	mov    0x113cb46,%al
  1008d2:	83 c8 0f             	or     $0xf,%eax
  1008d5:	a2 46 cb 13 01       	mov    %al,0x113cb46
  1008da:	a0 46 cb 13 01       	mov    0x113cb46,%al
  1008df:	83 e0 ef             	and    $0xffffffef,%eax
  1008e2:	a2 46 cb 13 01       	mov    %al,0x113cb46
  1008e7:	a0 46 cb 13 01       	mov    0x113cb46,%al
  1008ec:	83 e0 df             	and    $0xffffffdf,%eax
  1008ef:	a2 46 cb 13 01       	mov    %al,0x113cb46
  1008f4:	a0 46 cb 13 01       	mov    0x113cb46,%al
  1008f9:	83 c8 40             	or     $0x40,%eax
  1008fc:	a2 46 cb 13 01       	mov    %al,0x113cb46
  100901:	a0 46 cb 13 01       	mov    0x113cb46,%al
  100906:	83 c8 80             	or     $0xffffff80,%eax
  100909:	a2 46 cb 13 01       	mov    %al,0x113cb46
  10090e:	c6 05 47 cb 13 01 00 	movb   $0x0,0x113cb47
  100915:	6a 50                	push   $0x50
  100917:	68 00 cb 13 01       	push   $0x113cb00
  10091c:	e8 2a f7 ff ff       	call   10004b <setGdt>
  100921:	83 c4 08             	add    $0x8,%esp
  100924:	b8 fc 6a 10 00       	mov    $0x106afc,%eax
  100929:	89 c2                	mov    %eax,%edx
  10092b:	a1 48 6b 10 00       	mov    0x106b48,%eax
  100930:	52                   	push   %edx
  100931:	50                   	push   %eax
  100932:	e8 f6 fa ff ff       	call   10042d <change_tss>
  100937:	83 c4 08             	add    $0x8,%esp
  10093a:	b8 28 00 00 00       	mov    $0x28,%eax
  10093f:	0f 00 d8             	ltr    %ax
  100942:	b8 10 00 00 00       	mov    $0x10,%eax
  100947:	89 c0                	mov    %eax,%eax
  100949:	8e d8                	mov    %eax,%ds
  10094b:	8e e0                	mov    %eax,%fs
  10094d:	8e c0                	mov    %eax,%es
  10094f:	8e d0                	mov    %eax,%ss
  100951:	b8 30 00 00 00       	mov    $0x30,%eax
  100956:	89 c0                	mov    %eax,%eax
  100958:	8e e8                	mov    %eax,%gs
  10095a:	6a 00                	push   $0x0
  10095c:	e8 17 f7 ff ff       	call   100078 <lLdt>
  100961:	83 c4 04             	add    $0x4,%esp
  100964:	90                   	nop
  100965:	c9                   	leave  
  100966:	c3                   	ret    

00100967 <enterUserSpace_pcb>:
  100967:	55                   	push   %ebp
  100968:	89 e5                	mov    %esp,%ebp
  10096a:	83 ec 10             	sub    $0x10,%esp
  10096d:	8b 55 08             	mov    0x8(%ebp),%edx
  100970:	89 d0                	mov    %edx,%eax
  100972:	c1 e0 07             	shl    $0x7,%eax
  100975:	01 d0                	add    %edx,%eax
  100977:	01 c0                	add    %eax,%eax
  100979:	01 d0                	add    %edx,%eax
  10097b:	01 c0                	add    %eax,%eax
  10097d:	01 d0                	add    %edx,%eax
  10097f:	c1 e0 04             	shl    $0x4,%eax
  100982:	05 00 4b 10 00       	add    $0x104b00,%eax
  100987:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10098a:	b8 10 00 00 00       	mov    $0x10,%eax
  10098f:	89 c0                	mov    %eax,%eax
  100991:	8e d8                	mov    %eax,%ds
  100993:	8e e0                	mov    %eax,%fs
  100995:	8e c0                	mov    %eax,%es
  100997:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10099a:	8b 80 48 20 00 00    	mov    0x2048(%eax),%eax
  1009a0:	50                   	push   %eax
  1009a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1009a4:	8b 80 44 20 00 00    	mov    0x2044(%eax),%eax
  1009aa:	50                   	push   %eax
  1009ab:	9c                   	pushf  
  1009ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1009af:	8b 80 3c 20 00 00    	mov    0x203c(%eax),%eax
  1009b5:	50                   	push   %eax
  1009b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1009b9:	8b 80 38 20 00 00    	mov    0x2038(%eax),%eax
  1009bf:	50                   	push   %eax
  1009c0:	cf                   	iret   
  1009c1:	90                   	nop
  1009c2:	c9                   	leave  
  1009c3:	c3                   	ret    

001009c4 <enterUserSpace>:
  1009c4:	55                   	push   %ebp
  1009c5:	89 e5                	mov    %esp,%ebp
  1009c7:	83 ec 18             	sub    $0x18,%esp
  1009ca:	c7 05 e4 4a 10 00 01 	movl   $0x1,0x104ae4
  1009d1:	00 00 00 
  1009d4:	e8 4f 0c 00 00       	call   101628 <apply_new_pid>
  1009d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1009dc:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009df:	89 d0                	mov    %edx,%eax
  1009e1:	c1 e0 07             	shl    $0x7,%eax
  1009e4:	01 d0                	add    %edx,%eax
  1009e6:	01 c0                	add    %eax,%eax
  1009e8:	01 d0                	add    %edx,%eax
  1009ea:	01 c0                	add    %eax,%eax
  1009ec:	01 d0                	add    %edx,%eax
  1009ee:	c1 e0 04             	shl    $0x4,%eax
  1009f1:	05 48 6b 10 00       	add    $0x106b48,%eax
  1009f6:	c7 00 23 00 00 00    	movl   $0x23,(%eax)
  1009fc:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009ff:	89 d0                	mov    %edx,%eax
  100a01:	c1 e0 07             	shl    $0x7,%eax
  100a04:	01 d0                	add    %edx,%eax
  100a06:	01 c0                	add    %eax,%eax
  100a08:	01 d0                	add    %edx,%eax
  100a0a:	01 c0                	add    %eax,%eax
  100a0c:	01 d0                	add    %edx,%eax
  100a0e:	c1 e0 04             	shl    $0x4,%eax
  100a11:	05 3c 6b 10 00       	add    $0x106b3c,%eax
  100a16:	c7 00 1b 00 00 00    	movl   $0x1b,(%eax)
  100a1c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100a1f:	89 d0                	mov    %edx,%eax
  100a21:	c1 e0 07             	shl    $0x7,%eax
  100a24:	01 d0                	add    %edx,%eax
  100a26:	01 c0                	add    %eax,%eax
  100a28:	01 d0                	add    %edx,%eax
  100a2a:	01 c0                	add    %eax,%eax
  100a2c:	01 d0                	add    %edx,%eax
  100a2e:	c1 e0 04             	shl    $0x4,%eax
  100a31:	05 0c 6b 10 00       	add    $0x106b0c,%eax
  100a36:	c7 00 23 00 00 00    	movl   $0x23,(%eax)
  100a3c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100a3f:	89 d0                	mov    %edx,%eax
  100a41:	c1 e0 07             	shl    $0x7,%eax
  100a44:	01 d0                	add    %edx,%eax
  100a46:	01 c0                	add    %eax,%eax
  100a48:	01 d0                	add    %edx,%eax
  100a4a:	01 c0                	add    %eax,%eax
  100a4c:	01 d0                	add    %edx,%eax
  100a4e:	c1 e0 04             	shl    $0x4,%eax
  100a51:	05 08 6b 10 00       	add    $0x106b08,%eax
  100a56:	c7 00 23 00 00 00    	movl   $0x23,(%eax)
  100a5c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100a5f:	89 d0                	mov    %edx,%eax
  100a61:	c1 e0 07             	shl    $0x7,%eax
  100a64:	01 d0                	add    %edx,%eax
  100a66:	01 c0                	add    %eax,%eax
  100a68:	01 d0                	add    %edx,%eax
  100a6a:	01 c0                	add    %eax,%eax
  100a6c:	01 d0                	add    %edx,%eax
  100a6e:	c1 e0 04             	shl    $0x4,%eax
  100a71:	05 04 6b 10 00       	add    $0x106b04,%eax
  100a76:	c7 00 23 00 00 00    	movl   $0x23,(%eax)
  100a7c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100a7f:	89 d0                	mov    %edx,%eax
  100a81:	c1 e0 07             	shl    $0x7,%eax
  100a84:	01 d0                	add    %edx,%eax
  100a86:	01 c0                	add    %eax,%eax
  100a88:	01 d0                	add    %edx,%eax
  100a8a:	01 c0                	add    %eax,%eax
  100a8c:	01 d0                	add    %edx,%eax
  100a8e:	c1 e0 04             	shl    $0x4,%eax
  100a91:	05 44 6b 10 00       	add    $0x106b44,%eax
  100a96:	c7 00 00 00 40 00    	movl   $0x400000,(%eax)
  100a9c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100a9f:	89 d0                	mov    %edx,%eax
  100aa1:	c1 e0 07             	shl    $0x7,%eax
  100aa4:	01 d0                	add    %edx,%eax
  100aa6:	01 c0                	add    %eax,%eax
  100aa8:	01 d0                	add    %edx,%eax
  100aaa:	01 c0                	add    %eax,%eax
  100aac:	01 d0                	add    %edx,%eax
  100aae:	c1 e0 04             	shl    $0x4,%eax
  100ab1:	8d 90 38 6b 10 00    	lea    0x106b38(%eax),%edx
  100ab7:	8b 45 08             	mov    0x8(%ebp),%eax
  100aba:	89 02                	mov    %eax,(%edx)
  100abc:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100abf:	89 d0                	mov    %edx,%eax
  100ac1:	c1 e0 07             	shl    $0x7,%eax
  100ac4:	01 d0                	add    %edx,%eax
  100ac6:	01 c0                	add    %eax,%eax
  100ac8:	01 d0                	add    %edx,%eax
  100aca:	01 c0                	add    %eax,%eax
  100acc:	01 d0                	add    %edx,%eax
  100ace:	c1 e0 04             	shl    $0x4,%eax
  100ad1:	05 50 6b 10 00       	add    $0x106b50,%eax
  100ad6:	c7 00 0a 00 00 00    	movl   $0xa,(%eax)
  100adc:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100adf:	89 d0                	mov    %edx,%eax
  100ae1:	c1 e0 07             	shl    $0x7,%eax
  100ae4:	01 d0                	add    %edx,%eax
  100ae6:	01 c0                	add    %eax,%eax
  100ae8:	01 d0                	add    %edx,%eax
  100aea:	01 c0                	add    %eax,%eax
  100aec:	01 d0                	add    %edx,%eax
  100aee:	c1 e0 04             	shl    $0x4,%eax
  100af1:	05 00 20 00 00       	add    $0x2000,%eax
  100af6:	05 00 4b 10 00       	add    $0x104b00,%eax
  100afb:	83 ec 08             	sub    $0x8,%esp
  100afe:	50                   	push   %eax
  100aff:	ff 75 f4             	pushl  -0xc(%ebp)
  100b02:	e8 9d 0b 00 00       	call   1016a4 <put_into_runnable>
  100b07:	83 c4 10             	add    $0x10,%esp
  100b0a:	83 ec 0c             	sub    $0xc,%esp
  100b0d:	6a 00                	push   $0x0
  100b0f:	e8 53 fe ff ff       	call   100967 <enterUserSpace_pcb>
  100b14:	83 c4 10             	add    $0x10,%esp
  100b17:	90                   	nop
  100b18:	c9                   	leave  
  100b19:	c3                   	ret    

00100b1a <loadUMain>:
  100b1a:	55                   	push   %ebp
  100b1b:	89 e5                	mov    %esp,%ebp
  100b1d:	83 ec 38             	sub    $0x38,%esp
  100b20:	c7 45 e0 00 00 03 00 	movl   $0x30000,-0x20(%ebp)
  100b27:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  100b2e:	eb 24                	jmp    100b54 <loadUMain+0x3a>
  100b30:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b33:	8d 90 c8 00 00 00    	lea    0xc8(%eax),%edx
  100b39:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b3c:	48                   	dec    %eax
  100b3d:	c1 e0 09             	shl    $0x9,%eax
  100b40:	89 c1                	mov    %eax,%ecx
  100b42:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100b45:	01 c8                	add    %ecx,%eax
  100b47:	52                   	push   %edx
  100b48:	50                   	push   %eax
  100b49:	e8 41 f9 ff ff       	call   10048f <readSect>
  100b4e:	83 c4 08             	add    $0x8,%esp
  100b51:	ff 45 f4             	incl   -0xc(%ebp)
  100b54:	81 7d f4 c8 00 00 00 	cmpl   $0xc8,-0xc(%ebp)
  100b5b:	7e d3                	jle    100b30 <loadUMain+0x16>
  100b5d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100b60:	89 45 dc             	mov    %eax,-0x24(%ebp)
  100b63:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100b66:	8b 50 1c             	mov    0x1c(%eax),%edx
  100b69:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100b6c:	01 d0                	add    %edx,%eax
  100b6e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100b71:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100b74:	8b 40 2c             	mov    0x2c(%eax),%eax
  100b77:	0f b7 c0             	movzwl %ax,%eax
  100b7a:	c1 e0 05             	shl    $0x5,%eax
  100b7d:	89 c2                	mov    %eax,%edx
  100b7f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b82:	01 d0                	add    %edx,%eax
  100b84:	89 45 d8             	mov    %eax,-0x28(%ebp)
  100b87:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100b8e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100b95:	eb 78                	jmp    100c0f <loadUMain+0xf5>
  100b97:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b9a:	8b 00                	mov    (%eax),%eax
  100b9c:	83 f8 01             	cmp    $0x1,%eax
  100b9f:	75 6a                	jne    100c0b <loadUMain+0xf1>
  100ba1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ba4:	8b 40 08             	mov    0x8(%eax),%eax
  100ba7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100baa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100bad:	8b 50 04             	mov    0x4(%eax),%edx
  100bb0:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100bb3:	01 d0                	add    %edx,%eax
  100bb5:	89 45 e8             	mov    %eax,-0x18(%ebp)
  100bb8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100bbb:	8b 40 10             	mov    0x10(%eax),%eax
  100bbe:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100bc1:	eb 10                	jmp    100bd3 <loadUMain+0xb9>
  100bc3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100bc6:	8b 55 e8             	mov    -0x18(%ebp),%edx
  100bc9:	8a 12                	mov    (%edx),%dl
  100bcb:	88 10                	mov    %dl,(%eax)
  100bcd:	ff 45 ec             	incl   -0x14(%ebp)
  100bd0:	ff 45 e8             	incl   -0x18(%ebp)
  100bd3:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100bd6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100bd9:	8b 40 08             	mov    0x8(%eax),%eax
  100bdc:	29 c2                	sub    %eax,%edx
  100bde:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100be1:	39 c2                	cmp    %eax,%edx
  100be3:	72 de                	jb     100bc3 <loadUMain+0xa9>
  100be5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100be8:	8b 40 14             	mov    0x14(%eax),%eax
  100beb:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100bee:	eb 09                	jmp    100bf9 <loadUMain+0xdf>
  100bf0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100bf3:	c6 00 00             	movb   $0x0,(%eax)
  100bf6:	ff 45 ec             	incl   -0x14(%ebp)
  100bf9:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100bfc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100bff:	8b 40 08             	mov    0x8(%eax),%eax
  100c02:	29 c2                	sub    %eax,%edx
  100c04:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100c07:	39 c2                	cmp    %eax,%edx
  100c09:	72 e5                	jb     100bf0 <loadUMain+0xd6>
  100c0b:	83 45 f0 20          	addl   $0x20,-0x10(%ebp)
  100c0f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100c12:	3b 45 d8             	cmp    -0x28(%ebp),%eax
  100c15:	72 80                	jb     100b97 <loadUMain+0x7d>
  100c17:	c7 45 e8 00 00 20 00 	movl   $0x200000,-0x18(%ebp)
  100c1e:	c7 45 ec 00 00 21 00 	movl   $0x210000,-0x14(%ebp)
  100c25:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100c2c:	eb 19                	jmp    100c47 <loadUMain+0x12d>
  100c2e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100c31:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c34:	01 d0                	add    %edx,%eax
  100c36:	89 c2                	mov    %eax,%edx
  100c38:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  100c3b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100c3e:	01 c8                	add    %ecx,%eax
  100c40:	8a 00                	mov    (%eax),%al
  100c42:	88 02                	mov    %al,(%edx)
  100c44:	ff 45 e4             	incl   -0x1c(%ebp)
  100c47:	81 7d e4 ff ff 00 00 	cmpl   $0xffff,-0x1c(%ebp)
  100c4e:	7e de                	jle    100c2e <loadUMain+0x114>
  100c50:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100c53:	8b 40 18             	mov    0x18(%eax),%eax
  100c56:	83 ec 0c             	sub    $0xc,%esp
  100c59:	50                   	push   %eax
  100c5a:	e8 65 fd ff ff       	call   1009c4 <enterUserSpace>
  100c5f:	83 c4 10             	add    $0x10,%esp
  100c62:	90                   	nop
  100c63:	c9                   	leave  
  100c64:	c3                   	ret    

00100c65 <sys_exit>:
  100c65:	55                   	push   %ebp
  100c66:	89 e5                	mov    %esp,%ebp
  100c68:	83 ec 18             	sub    $0x18,%esp
  100c6b:	e8 f6 09 00 00       	call   101666 <getpid>
  100c70:	83 ec 0c             	sub    $0xc,%esp
  100c73:	50                   	push   %eax
  100c74:	e8 d5 09 00 00       	call   10164e <put_into_empty>
  100c79:	83 c4 10             	add    $0x10,%esp
  100c7c:	e8 03 0a 00 00       	call   101684 <get_from_runnable>
  100c81:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c84:	83 ec 08             	sub    $0x8,%esp
  100c87:	ff 75 08             	pushl  0x8(%ebp)
  100c8a:	ff 75 f4             	pushl  -0xc(%ebp)
  100c8d:	e8 3f 09 00 00       	call   1015d1 <put_into_running>
  100c92:	83 c4 10             	add    $0x10,%esp
  100c95:	b8 01 00 00 00       	mov    $0x1,%eax
  100c9a:	c9                   	leave  
  100c9b:	c3                   	ret    

00100c9c <sys_getpid>:
  100c9c:	55                   	push   %ebp
  100c9d:	89 e5                	mov    %esp,%ebp
  100c9f:	83 ec 08             	sub    $0x8,%esp
  100ca2:	e8 bf 09 00 00       	call   101666 <getpid>
  100ca7:	c9                   	leave  
  100ca8:	c3                   	ret    

00100ca9 <sys_sleep>:
  100ca9:	55                   	push   %ebp
  100caa:	89 e5                	mov    %esp,%ebp
  100cac:	83 ec 18             	sub    $0x18,%esp
  100caf:	e8 b2 09 00 00       	call   101666 <getpid>
  100cb4:	83 ec 08             	sub    $0x8,%esp
  100cb7:	ff 75 08             	pushl  0x8(%ebp)
  100cba:	50                   	push   %eax
  100cbb:	e8 12 0d 00 00       	call   1019d2 <put_into_block>
  100cc0:	83 c4 10             	add    $0x10,%esp
  100cc3:	e8 bc 09 00 00       	call   101684 <get_from_runnable>
  100cc8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100ccb:	83 ec 08             	sub    $0x8,%esp
  100cce:	ff 75 08             	pushl  0x8(%ebp)
  100cd1:	ff 75 f4             	pushl  -0xc(%ebp)
  100cd4:	e8 f8 08 00 00       	call   1015d1 <put_into_running>
  100cd9:	83 c4 10             	add    $0x10,%esp
  100cdc:	b8 01 00 00 00       	mov    $0x1,%eax
  100ce1:	c9                   	leave  
  100ce2:	c3                   	ret    

00100ce3 <sys_fork>:
  100ce3:	55                   	push   %ebp
  100ce4:	89 e5                	mov    %esp,%ebp
  100ce6:	57                   	push   %edi
  100ce7:	56                   	push   %esi
  100ce8:	53                   	push   %ebx
  100ce9:	83 ec 2c             	sub    $0x2c,%esp
  100cec:	e8 37 09 00 00       	call   101628 <apply_new_pid>
  100cf1:	89 45 d8             	mov    %eax,-0x28(%ebp)
  100cf4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100cfb:	eb 6d                	jmp    100d6a <sys_fork+0x87>
  100cfd:	e8 64 09 00 00       	call   101666 <getpid>
  100d02:	89 c2                	mov    %eax,%edx
  100d04:	89 d0                	mov    %edx,%eax
  100d06:	c1 e0 02             	shl    $0x2,%eax
  100d09:	01 d0                	add    %edx,%eax
  100d0b:	c1 e0 03             	shl    $0x3,%eax
  100d0e:	01 d0                	add    %edx,%eax
  100d10:	01 c0                	add    %eax,%eax
  100d12:	01 d0                	add    %edx,%eax
  100d14:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
  100d1b:	01 c8                	add    %ecx,%eax
  100d1d:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
  100d24:	01 c8                	add    %ecx,%eax
  100d26:	01 c2                	add    %eax,%edx
  100d28:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100d2b:	01 d0                	add    %edx,%eax
  100d2d:	8b 0c 85 00 4b 10 00 	mov    0x104b00(,%eax,4),%ecx
  100d34:	8b 55 d8             	mov    -0x28(%ebp),%edx
  100d37:	89 d0                	mov    %edx,%eax
  100d39:	c1 e0 02             	shl    $0x2,%eax
  100d3c:	01 d0                	add    %edx,%eax
  100d3e:	c1 e0 03             	shl    $0x3,%eax
  100d41:	01 d0                	add    %edx,%eax
  100d43:	01 c0                	add    %eax,%eax
  100d45:	01 d0                	add    %edx,%eax
  100d47:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
  100d4e:	01 d8                	add    %ebx,%eax
  100d50:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
  100d57:	01 d8                	add    %ebx,%eax
  100d59:	01 c2                	add    %eax,%edx
  100d5b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100d5e:	01 d0                	add    %edx,%eax
  100d60:	89 0c 85 00 4b 10 00 	mov    %ecx,0x104b00(,%eax,4)
  100d67:	ff 45 e4             	incl   -0x1c(%ebp)
  100d6a:	81 7d e4 ff 07 00 00 	cmpl   $0x7ff,-0x1c(%ebp)
  100d71:	7e 8a                	jle    100cfd <sys_fork+0x1a>
  100d73:	e8 ee 08 00 00       	call   101666 <getpid>
  100d78:	83 c0 40             	add    $0x40,%eax
  100d7b:	c1 e0 10             	shl    $0x10,%eax
  100d7e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100d81:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100d84:	83 c0 40             	add    $0x40,%eax
  100d87:	c1 e0 10             	shl    $0x10,%eax
  100d8a:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100d8d:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  100d94:	eb 1d                	jmp    100db3 <sys_fork+0xd0>
  100d96:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100d99:	8b 55 d0             	mov    -0x30(%ebp),%edx
  100d9c:	29 c2                	sub    %eax,%edx
  100d9e:	89 d0                	mov    %edx,%eax
  100da0:	89 c2                	mov    %eax,%edx
  100da2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100da5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  100da8:	29 c1                	sub    %eax,%ecx
  100daa:	89 c8                	mov    %ecx,%eax
  100dac:	8a 00                	mov    (%eax),%al
  100dae:	88 02                	mov    %al,(%edx)
  100db0:	ff 45 e0             	incl   -0x20(%ebp)
  100db3:	81 7d e0 ff ff 00 00 	cmpl   $0xffff,-0x20(%ebp)
  100dba:	7e da                	jle    100d96 <sys_fork+0xb3>
  100dbc:	8b 55 d8             	mov    -0x28(%ebp),%edx
  100dbf:	89 d0                	mov    %edx,%eax
  100dc1:	c1 e0 07             	shl    $0x7,%eax
  100dc4:	01 d0                	add    %edx,%eax
  100dc6:	01 c0                	add    %eax,%eax
  100dc8:	01 d0                	add    %edx,%eax
  100dca:	01 c0                	add    %eax,%eax
  100dcc:	01 d0                	add    %edx,%eax
  100dce:	c1 e0 04             	shl    $0x4,%eax
  100dd1:	8d 90 00 6b 10 00    	lea    0x106b00(%eax),%edx
  100dd7:	8b 45 08             	mov    0x8(%ebp),%eax
  100dda:	89 c3                	mov    %eax,%ebx
  100ddc:	b8 13 00 00 00       	mov    $0x13,%eax
  100de1:	89 d7                	mov    %edx,%edi
  100de3:	89 de                	mov    %ebx,%esi
  100de5:	89 c1                	mov    %eax,%ecx
  100de7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100de9:	8b 55 d8             	mov    -0x28(%ebp),%edx
  100dec:	89 d0                	mov    %edx,%eax
  100dee:	c1 e0 07             	shl    $0x7,%eax
  100df1:	01 d0                	add    %edx,%eax
  100df3:	01 c0                	add    %eax,%eax
  100df5:	01 d0                	add    %edx,%eax
  100df7:	01 c0                	add    %eax,%eax
  100df9:	01 d0                	add    %edx,%eax
  100dfb:	c1 e0 04             	shl    $0x4,%eax
  100dfe:	05 2c 6b 10 00       	add    $0x106b2c,%eax
  100e03:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  100e09:	e8 58 08 00 00       	call   101666 <getpid>
  100e0e:	83 c0 20             	add    $0x20,%eax
  100e11:	c1 e0 10             	shl    $0x10,%eax
  100e14:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100e17:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100e1a:	83 c0 20             	add    $0x20,%eax
  100e1d:	c1 e0 10             	shl    $0x10,%eax
  100e20:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100e23:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  100e2a:	eb 19                	jmp    100e45 <sys_fork+0x162>
  100e2c:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100e2f:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100e32:	01 d0                	add    %edx,%eax
  100e34:	89 c2                	mov    %eax,%edx
  100e36:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  100e39:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100e3c:	01 c8                	add    %ecx,%eax
  100e3e:	8a 00                	mov    (%eax),%al
  100e40:	88 02                	mov    %al,(%edx)
  100e42:	ff 45 dc             	incl   -0x24(%ebp)
  100e45:	81 7d dc ff ff 00 00 	cmpl   $0xffff,-0x24(%ebp)
  100e4c:	7e de                	jle    100e2c <sys_fork+0x149>
  100e4e:	8b 55 d8             	mov    -0x28(%ebp),%edx
  100e51:	89 d0                	mov    %edx,%eax
  100e53:	c1 e0 07             	shl    $0x7,%eax
  100e56:	01 d0                	add    %edx,%eax
  100e58:	01 c0                	add    %eax,%eax
  100e5a:	01 d0                	add    %edx,%eax
  100e5c:	01 c0                	add    %eax,%eax
  100e5e:	01 d0                	add    %edx,%eax
  100e60:	c1 e0 04             	shl    $0x4,%eax
  100e63:	05 00 20 00 00       	add    $0x2000,%eax
  100e68:	05 00 4b 10 00       	add    $0x104b00,%eax
  100e6d:	83 ec 08             	sub    $0x8,%esp
  100e70:	50                   	push   %eax
  100e71:	ff 75 d8             	pushl  -0x28(%ebp)
  100e74:	e8 2b 08 00 00       	call   1016a4 <put_into_runnable>
  100e79:	83 c4 10             	add    $0x10,%esp
  100e7c:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100e7f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100e82:	5b                   	pop    %ebx
  100e83:	5e                   	pop    %esi
  100e84:	5f                   	pop    %edi
  100e85:	5d                   	pop    %ebp
  100e86:	c3                   	ret    

00100e87 <outByte>:
  100e87:	55                   	push   %ebp
  100e88:	89 e5                	mov    %esp,%ebp
  100e8a:	83 ec 08             	sub    $0x8,%esp
  100e8d:	8b 45 08             	mov    0x8(%ebp),%eax
  100e90:	8b 55 0c             	mov    0xc(%ebp),%edx
  100e93:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  100e97:	88 55 f8             	mov    %dl,-0x8(%ebp)
  100e9a:	8a 45 f8             	mov    -0x8(%ebp),%al
  100e9d:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100ea0:	ee                   	out    %al,(%dx)
  100ea1:	90                   	nop
  100ea2:	c9                   	leave  
  100ea3:	c3                   	ret    

00100ea4 <backSpace>:
  100ea4:	55                   	push   %ebp
  100ea5:	89 e5                	mov    %esp,%ebp
  100ea7:	83 ec 08             	sub    $0x8,%esp
  100eaa:	a1 4c 42 10 00       	mov    0x10424c,%eax
  100eaf:	85 c0                	test   %eax,%eax
  100eb1:	75 31                	jne    100ee4 <backSpace+0x40>
  100eb3:	a1 48 42 10 00       	mov    0x104248,%eax
  100eb8:	48                   	dec    %eax
  100eb9:	a3 48 42 10 00       	mov    %eax,0x104248
  100ebe:	c7 05 4c 42 10 00 50 	movl   $0x50,0x10424c
  100ec5:	00 00 00 
  100ec8:	8b 15 4c 42 10 00    	mov    0x10424c,%edx
  100ece:	a1 48 42 10 00       	mov    0x104248,%eax
  100ed3:	83 ec 04             	sub    $0x4,%esp
  100ed6:	6a 20                	push   $0x20
  100ed8:	52                   	push   %edx
  100ed9:	50                   	push   %eax
  100eda:	e8 0a 03 00 00       	call   1011e9 <print_char>
  100edf:	83 c4 10             	add    $0x10,%esp
  100ee2:	eb 25                	jmp    100f09 <backSpace+0x65>
  100ee4:	a1 4c 42 10 00       	mov    0x10424c,%eax
  100ee9:	48                   	dec    %eax
  100eea:	a3 4c 42 10 00       	mov    %eax,0x10424c
  100eef:	8b 15 4c 42 10 00    	mov    0x10424c,%edx
  100ef5:	a1 48 42 10 00       	mov    0x104248,%eax
  100efa:	83 ec 04             	sub    $0x4,%esp
  100efd:	6a 20                	push   $0x20
  100eff:	52                   	push   %edx
  100f00:	50                   	push   %eax
  100f01:	e8 e3 02 00 00       	call   1011e9 <print_char>
  100f06:	83 c4 10             	add    $0x10,%esp
  100f09:	8b 15 4c 42 10 00    	mov    0x10424c,%edx
  100f0f:	a1 48 42 10 00       	mov    0x104248,%eax
  100f14:	83 ec 08             	sub    $0x8,%esp
  100f17:	52                   	push   %edx
  100f18:	50                   	push   %eax
  100f19:	e8 3b 01 00 00       	call   101059 <update_cursor>
  100f1e:	83 c4 10             	add    $0x10,%esp
  100f21:	b8 01 00 00 00       	mov    $0x1,%eax
  100f26:	c9                   	leave  
  100f27:	c3                   	ret    

00100f28 <printkernel>:
  100f28:	55                   	push   %ebp
  100f29:	89 e5                	mov    %esp,%ebp
  100f2b:	83 ec 18             	sub    $0x18,%esp
  100f2e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100f35:	e9 03 01 00 00       	jmp    10103d <printkernel+0x115>
  100f3a:	8b 45 08             	mov    0x8(%ebp),%eax
  100f3d:	8a 00                	mov    (%eax),%al
  100f3f:	88 45 ef             	mov    %al,-0x11(%ebp)
  100f42:	80 7d ef 0a          	cmpb   $0xa,-0x11(%ebp)
  100f46:	75 58                	jne    100fa0 <printkernel+0x78>
  100f48:	a1 4c 42 10 00       	mov    0x10424c,%eax
  100f4d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100f50:	eb 19                	jmp    100f6b <printkernel+0x43>
  100f52:	a1 48 42 10 00       	mov    0x104248,%eax
  100f57:	83 ec 04             	sub    $0x4,%esp
  100f5a:	6a 20                	push   $0x20
  100f5c:	ff 75 f0             	pushl  -0x10(%ebp)
  100f5f:	50                   	push   %eax
  100f60:	e8 84 02 00 00       	call   1011e9 <print_char>
  100f65:	83 c4 10             	add    $0x10,%esp
  100f68:	ff 45 f0             	incl   -0x10(%ebp)
  100f6b:	83 7d f0 50          	cmpl   $0x50,-0x10(%ebp)
  100f6f:	7e e1                	jle    100f52 <printkernel+0x2a>
  100f71:	c7 05 4c 42 10 00 00 	movl   $0x0,0x10424c
  100f78:	00 00 00 
  100f7b:	a1 48 42 10 00       	mov    0x104248,%eax
  100f80:	40                   	inc    %eax
  100f81:	a3 48 42 10 00       	mov    %eax,0x104248
  100f86:	8b 15 4c 42 10 00    	mov    0x10424c,%edx
  100f8c:	a1 48 42 10 00       	mov    0x104248,%eax
  100f91:	83 ec 08             	sub    $0x8,%esp
  100f94:	52                   	push   %edx
  100f95:	50                   	push   %eax
  100f96:	e8 be 00 00 00       	call   101059 <update_cursor>
  100f9b:	83 c4 10             	add    $0x10,%esp
  100f9e:	eb 40                	jmp    100fe0 <printkernel+0xb8>
  100fa0:	0f be 4d ef          	movsbl -0x11(%ebp),%ecx
  100fa4:	8b 15 4c 42 10 00    	mov    0x10424c,%edx
  100faa:	a1 48 42 10 00       	mov    0x104248,%eax
  100faf:	83 ec 04             	sub    $0x4,%esp
  100fb2:	51                   	push   %ecx
  100fb3:	52                   	push   %edx
  100fb4:	50                   	push   %eax
  100fb5:	e8 2f 02 00 00       	call   1011e9 <print_char>
  100fba:	83 c4 10             	add    $0x10,%esp
  100fbd:	a1 4c 42 10 00       	mov    0x10424c,%eax
  100fc2:	40                   	inc    %eax
  100fc3:	a3 4c 42 10 00       	mov    %eax,0x10424c
  100fc8:	8b 15 4c 42 10 00    	mov    0x10424c,%edx
  100fce:	a1 48 42 10 00       	mov    0x104248,%eax
  100fd3:	83 ec 08             	sub    $0x8,%esp
  100fd6:	52                   	push   %edx
  100fd7:	50                   	push   %eax
  100fd8:	e8 7c 00 00 00       	call   101059 <update_cursor>
  100fdd:	83 c4 10             	add    $0x10,%esp
  100fe0:	a1 4c 42 10 00       	mov    0x10424c,%eax
  100fe5:	83 f8 50             	cmp    $0x50,%eax
  100fe8:	75 15                	jne    100fff <printkernel+0xd7>
  100fea:	c7 05 4c 42 10 00 00 	movl   $0x0,0x10424c
  100ff1:	00 00 00 
  100ff4:	a1 48 42 10 00       	mov    0x104248,%eax
  100ff9:	40                   	inc    %eax
  100ffa:	a3 48 42 10 00       	mov    %eax,0x104248
  100fff:	8b 15 48 42 10 00    	mov    0x104248,%edx
  101005:	a1 00 40 10 00       	mov    0x104000,%eax
  10100a:	39 c2                	cmp    %eax,%edx
  10100c:	7e 29                	jle    101037 <printkernel+0x10f>
  10100e:	a1 48 42 10 00       	mov    0x104248,%eax
  101013:	83 ec 0c             	sub    $0xc,%esp
  101016:	50                   	push   %eax
  101017:	e8 ac 00 00 00       	call   1010c8 <scrollScreen>
  10101c:	83 c4 10             	add    $0x10,%esp
  10101f:	8b 15 4c 42 10 00    	mov    0x10424c,%edx
  101025:	a1 48 42 10 00       	mov    0x104248,%eax
  10102a:	83 ec 08             	sub    $0x8,%esp
  10102d:	52                   	push   %edx
  10102e:	50                   	push   %eax
  10102f:	e8 25 00 00 00       	call   101059 <update_cursor>
  101034:	83 c4 10             	add    $0x10,%esp
  101037:	ff 45 f4             	incl   -0xc(%ebp)
  10103a:	ff 45 08             	incl   0x8(%ebp)
  10103d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101040:	3b 45 0c             	cmp    0xc(%ebp),%eax
  101043:	7d 0d                	jge    101052 <printkernel+0x12a>
  101045:	8b 45 08             	mov    0x8(%ebp),%eax
  101048:	8a 00                	mov    (%eax),%al
  10104a:	84 c0                	test   %al,%al
  10104c:	0f 85 e8 fe ff ff    	jne    100f3a <printkernel+0x12>
  101052:	b8 01 00 00 00       	mov    $0x1,%eax
  101057:	c9                   	leave  
  101058:	c3                   	ret    

00101059 <update_cursor>:
  101059:	55                   	push   %ebp
  10105a:	89 e5                	mov    %esp,%ebp
  10105c:	83 ec 10             	sub    $0x10,%esp
  10105f:	8b 45 08             	mov    0x8(%ebp),%eax
  101062:	89 c2                	mov    %eax,%edx
  101064:	89 d0                	mov    %edx,%eax
  101066:	c1 e0 02             	shl    $0x2,%eax
  101069:	01 d0                	add    %edx,%eax
  10106b:	c1 e0 04             	shl    $0x4,%eax
  10106e:	89 c2                	mov    %eax,%edx
  101070:	8b 45 0c             	mov    0xc(%ebp),%eax
  101073:	01 d0                	add    %edx,%eax
  101075:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  101079:	6a 0f                	push   $0xf
  10107b:	68 d4 03 00 00       	push   $0x3d4
  101080:	e8 02 fe ff ff       	call   100e87 <outByte>
  101085:	83 c4 08             	add    $0x8,%esp
  101088:	66 8b 45 fe          	mov    -0x2(%ebp),%ax
  10108c:	0f be c0             	movsbl %al,%eax
  10108f:	50                   	push   %eax
  101090:	68 d5 03 00 00       	push   $0x3d5
  101095:	e8 ed fd ff ff       	call   100e87 <outByte>
  10109a:	83 c4 08             	add    $0x8,%esp
  10109d:	6a 0e                	push   $0xe
  10109f:	68 d4 03 00 00       	push   $0x3d4
  1010a4:	e8 de fd ff ff       	call   100e87 <outByte>
  1010a9:	83 c4 08             	add    $0x8,%esp
  1010ac:	66 8b 45 fe          	mov    -0x2(%ebp),%ax
  1010b0:	66 c1 e8 08          	shr    $0x8,%ax
  1010b4:	0f be c0             	movsbl %al,%eax
  1010b7:	50                   	push   %eax
  1010b8:	68 d5 03 00 00       	push   $0x3d5
  1010bd:	e8 c5 fd ff ff       	call   100e87 <outByte>
  1010c2:	83 c4 08             	add    $0x8,%esp
  1010c5:	90                   	nop
  1010c6:	c9                   	leave  
  1010c7:	c3                   	ret    

001010c8 <scrollScreen>:
  1010c8:	55                   	push   %ebp
  1010c9:	89 e5                	mov    %esp,%ebp
  1010cb:	57                   	push   %edi
  1010cc:	83 ec 14             	sub    $0x14,%esp
  1010cf:	a1 48 42 10 00       	mov    0x104248,%eax
  1010d4:	85 c0                	test   %eax,%eax
  1010d6:	7f 12                	jg     1010ea <scrollScreen+0x22>
  1010d8:	83 ec 08             	sub    $0x8,%esp
  1010db:	6a 48                	push   $0x48
  1010dd:	68 77 2e 10 00       	push   $0x102e77
  1010e2:	e8 ea 1c 00 00       	call   102dd1 <abort>
  1010e7:	83 c4 10             	add    $0x10,%esp
  1010ea:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  1010f1:	eb 76                	jmp    101169 <scrollScreen+0xa1>
  1010f3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  1010fa:	eb 61                	jmp    10115d <scrollScreen+0x95>
  1010fc:	a1 48 42 10 00       	mov    0x104248,%eax
  101101:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  101104:	75 0a                	jne    101110 <scrollScreen+0x48>
  101106:	a1 4c 42 10 00       	mov    0x10424c,%eax
  10110b:	39 45 f0             	cmp    %eax,-0x10(%ebp)
  10110e:	7d 55                	jge    101165 <scrollScreen+0x9d>
  101110:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101113:	89 d0                	mov    %edx,%eax
  101115:	c1 e0 02             	shl    $0x2,%eax
  101118:	01 d0                	add    %edx,%eax
  10111a:	c1 e0 04             	shl    $0x4,%eax
  10111d:	89 c2                	mov    %eax,%edx
  10111f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101122:	01 d0                	add    %edx,%eax
  101124:	01 c0                	add    %eax,%eax
  101126:	89 c7                	mov    %eax,%edi
  101128:	65 8a 07             	mov    %gs:(%edi),%al
  10112b:	88 45 ef             	mov    %al,-0x11(%ebp)
  10112e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101131:	8d 50 ff             	lea    -0x1(%eax),%edx
  101134:	89 d0                	mov    %edx,%eax
  101136:	c1 e0 02             	shl    $0x2,%eax
  101139:	01 d0                	add    %edx,%eax
  10113b:	c1 e0 04             	shl    $0x4,%eax
  10113e:	89 c2                	mov    %eax,%edx
  101140:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101143:	01 d0                	add    %edx,%eax
  101145:	01 c0                	add    %eax,%eax
  101147:	89 c7                	mov    %eax,%edi
  101149:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  10114d:	8d 90 00 0c 00 00    	lea    0xc00(%eax),%edx
  101153:	66 89 d0             	mov    %dx,%ax
  101156:	65 66 89 07          	mov    %ax,%gs:(%edi)
  10115a:	ff 45 f0             	incl   -0x10(%ebp)
  10115d:	83 7d f0 50          	cmpl   $0x50,-0x10(%ebp)
  101161:	7e 99                	jle    1010fc <scrollScreen+0x34>
  101163:	eb 01                	jmp    101166 <scrollScreen+0x9e>
  101165:	90                   	nop
  101166:	ff 45 f4             	incl   -0xc(%ebp)
  101169:	a1 48 42 10 00       	mov    0x104248,%eax
  10116e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  101171:	7e 80                	jle    1010f3 <scrollScreen+0x2b>
  101173:	a1 48 42 10 00       	mov    0x104248,%eax
  101178:	48                   	dec    %eax
  101179:	a3 48 42 10 00       	mov    %eax,0x104248
  10117e:	90                   	nop
  10117f:	8b 7d fc             	mov    -0x4(%ebp),%edi
  101182:	c9                   	leave  
  101183:	c3                   	ret    

00101184 <sys_write>:
  101184:	55                   	push   %ebp
  101185:	89 e5                	mov    %esp,%ebp
  101187:	53                   	push   %ebx
  101188:	83 ec 04             	sub    $0x4,%esp
  10118b:	ba 30 00 00 00       	mov    $0x30,%edx
  101190:	89 d0                	mov    %edx,%eax
  101192:	8e e8                	mov    %eax,%gs
  101194:	8b 45 08             	mov    0x8(%ebp),%eax
  101197:	8b 40 20             	mov    0x20(%eax),%eax
  10119a:	83 f8 01             	cmp    $0x1,%eax
  10119d:	74 1d                	je     1011bc <sys_write+0x38>
  10119f:	8b 45 08             	mov    0x8(%ebp),%eax
  1011a2:	8b 40 20             	mov    0x20(%eax),%eax
  1011a5:	83 f8 02             	cmp    $0x2,%eax
  1011a8:	74 12                	je     1011bc <sys_write+0x38>
  1011aa:	83 ec 08             	sub    $0x8,%esp
  1011ad:	6a 6d                	push   $0x6d
  1011af:	68 77 2e 10 00       	push   $0x102e77
  1011b4:	e8 18 1c 00 00       	call   102dd1 <abort>
  1011b9:	83 c4 10             	add    $0x10,%esp
  1011bc:	8b 45 08             	mov    0x8(%ebp),%eax
  1011bf:	8b 40 24             	mov    0x24(%eax),%eax
  1011c2:	89 c3                	mov    %eax,%ebx
  1011c4:	e8 9d 04 00 00       	call   101666 <getpid>
  1011c9:	c1 e0 10             	shl    $0x10,%eax
  1011cc:	89 c2                	mov    %eax,%edx
  1011ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1011d1:	8b 40 28             	mov    0x28(%eax),%eax
  1011d4:	01 d0                	add    %edx,%eax
  1011d6:	83 ec 08             	sub    $0x8,%esp
  1011d9:	53                   	push   %ebx
  1011da:	50                   	push   %eax
  1011db:	e8 48 fd ff ff       	call   100f28 <printkernel>
  1011e0:	83 c4 10             	add    $0x10,%esp
  1011e3:	90                   	nop
  1011e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1011e7:	c9                   	leave  
  1011e8:	c3                   	ret    

001011e9 <print_char>:
  1011e9:	55                   	push   %ebp
  1011ea:	89 e5                	mov    %esp,%ebp
  1011ec:	57                   	push   %edi
  1011ed:	83 ec 04             	sub    $0x4,%esp
  1011f0:	8b 45 10             	mov    0x10(%ebp),%eax
  1011f3:	88 45 f8             	mov    %al,-0x8(%ebp)
  1011f6:	8b 55 08             	mov    0x8(%ebp),%edx
  1011f9:	89 d0                	mov    %edx,%eax
  1011fb:	c1 e0 02             	shl    $0x2,%eax
  1011fe:	01 d0                	add    %edx,%eax
  101200:	c1 e0 04             	shl    $0x4,%eax
  101203:	89 c2                	mov    %eax,%edx
  101205:	8b 45 0c             	mov    0xc(%ebp),%eax
  101208:	01 d0                	add    %edx,%eax
  10120a:	01 c0                	add    %eax,%eax
  10120c:	89 c7                	mov    %eax,%edi
  10120e:	0f be 45 f8          	movsbl -0x8(%ebp),%eax
  101212:	8d 90 00 0c 00 00    	lea    0xc00(%eax),%edx
  101218:	66 89 d0             	mov    %dx,%ax
  10121b:	65 66 89 07          	mov    %ax,%gs:(%edi)
  10121f:	90                   	nop
  101220:	83 c4 04             	add    $0x4,%esp
  101223:	5f                   	pop    %edi
  101224:	5d                   	pop    %ebp
  101225:	c3                   	ret    

00101226 <inByte>:
  101226:	55                   	push   %ebp
  101227:	89 e5                	mov    %esp,%ebp
  101229:	83 ec 14             	sub    $0x14,%esp
  10122c:	8b 45 08             	mov    0x8(%ebp),%eax
  10122f:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  101233:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101236:	89 c2                	mov    %eax,%edx
  101238:	ec                   	in     (%dx),%al
  101239:	88 45 ff             	mov    %al,-0x1(%ebp)
  10123c:	8a 45 ff             	mov    -0x1(%ebp),%al
  10123f:	c9                   	leave  
  101240:	c3                   	ret    

00101241 <getScancode>:
  101241:	55                   	push   %ebp
  101242:	89 e5                	mov    %esp,%ebp
  101244:	90                   	nop
  101245:	6a 64                	push   $0x64
  101247:	e8 da ff ff ff       	call   101226 <inByte>
  10124c:	83 c4 04             	add    $0x4,%esp
  10124f:	0f b6 c0             	movzbl %al,%eax
  101252:	83 e0 01             	and    $0x1,%eax
  101255:	85 c0                	test   %eax,%eax
  101257:	74 ec                	je     101245 <getScancode+0x4>
  101259:	6a 60                	push   $0x60
  10125b:	e8 c6 ff ff ff       	call   101226 <inByte>
  101260:	83 c4 04             	add    $0x4,%esp
  101263:	c9                   	leave  
  101264:	c3                   	ret    

00101265 <sys_read>:
  101265:	55                   	push   %ebp
  101266:	89 e5                	mov    %esp,%ebp
  101268:	53                   	push   %ebx
  101269:	83 ec 24             	sub    $0x24,%esp
  10126c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  101273:	8b 45 08             	mov    0x8(%ebp),%eax
  101276:	8b 58 28             	mov    0x28(%eax),%ebx
  101279:	e8 e8 03 00 00       	call   101666 <getpid>
  10127e:	c1 e0 10             	shl    $0x10,%eax
  101281:	01 d8                	add    %ebx,%eax
  101283:	89 45 e8             	mov    %eax,-0x18(%ebp)
  101286:	8b 45 08             	mov    0x8(%ebp),%eax
  101289:	8b 40 24             	mov    0x24(%eax),%eax
  10128c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10128f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101296:	e9 09 02 00 00       	jmp    1014a4 <sys_read+0x23f>
  10129b:	e8 a1 ff ff ff       	call   101241 <getScancode>
  1012a0:	0f b6 c0             	movzbl %al,%eax
  1012a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1012a6:	83 7d ec 3a          	cmpl   $0x3a,-0x14(%ebp)
  1012aa:	75 18                	jne    1012c4 <sys_read+0x5f>
  1012ac:	a1 50 42 10 00       	mov    0x104250,%eax
  1012b1:	83 f8 01             	cmp    $0x1,%eax
  1012b4:	0f 95 c0             	setne  %al
  1012b7:	0f b6 c0             	movzbl %al,%eax
  1012ba:	a3 50 42 10 00       	mov    %eax,0x104250
  1012bf:	e9 e0 01 00 00       	jmp    1014a4 <sys_read+0x23f>
  1012c4:	83 7d ec 2a          	cmpl   $0x2a,-0x14(%ebp)
  1012c8:	74 06                	je     1012d0 <sys_read+0x6b>
  1012ca:	83 7d ec 36          	cmpl   $0x36,-0x14(%ebp)
  1012ce:	75 0f                	jne    1012df <sys_read+0x7a>
  1012d0:	c7 05 54 42 10 00 01 	movl   $0x1,0x104254
  1012d7:	00 00 00 
  1012da:	e9 c5 01 00 00       	jmp    1014a4 <sys_read+0x23f>
  1012df:	81 7d ec aa 00 00 00 	cmpl   $0xaa,-0x14(%ebp)
  1012e6:	74 09                	je     1012f1 <sys_read+0x8c>
  1012e8:	81 7d ec b6 00 00 00 	cmpl   $0xb6,-0x14(%ebp)
  1012ef:	75 0f                	jne    101300 <sys_read+0x9b>
  1012f1:	c7 05 54 42 10 00 00 	movl   $0x0,0x104254
  1012f8:	00 00 00 
  1012fb:	e9 a4 01 00 00       	jmp    1014a4 <sys_read+0x23f>
  101300:	83 7d ec 7f          	cmpl   $0x7f,-0x14(%ebp)
  101304:	76 05                	jbe    10130b <sys_read+0xa6>
  101306:	e9 99 01 00 00       	jmp    1014a4 <sys_read+0x23f>
  10130b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10130e:	05 20 40 10 00       	add    $0x104020,%eax
  101313:	8a 00                	mov    (%eax),%al
  101315:	88 45 e3             	mov    %al,-0x1d(%ebp)
  101318:	8a 45 e3             	mov    -0x1d(%ebp),%al
  10131b:	3c 08                	cmp    $0x8,%al
  10131d:	75 0a                	jne    101329 <sys_read+0xc4>
  10131f:	e8 80 fb ff ff       	call   100ea4 <backSpace>
  101324:	e9 7b 01 00 00       	jmp    1014a4 <sys_read+0x23f>
  101329:	a1 54 42 10 00       	mov    0x104254,%eax
  10132e:	83 f8 01             	cmp    $0x1,%eax
  101331:	0f 85 d1 00 00 00    	jne    101408 <sys_read+0x1a3>
  101337:	83 7d ec 0d          	cmpl   $0xd,-0x14(%ebp)
  10133b:	77 12                	ja     10134f <sys_read+0xea>
  10133d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101340:	48                   	dec    %eax
  101341:	8a 80 20 41 10 00    	mov    0x104120(%eax),%al
  101347:	88 45 e3             	mov    %al,-0x1d(%ebp)
  10134a:	e9 b9 00 00 00       	jmp    101408 <sys_read+0x1a3>
  10134f:	8a 45 e3             	mov    -0x1d(%ebp),%al
  101352:	3c 60                	cmp    $0x60,%al
  101354:	7e 1e                	jle    101374 <sys_read+0x10f>
  101356:	8a 45 e3             	mov    -0x1d(%ebp),%al
  101359:	3c 7a                	cmp    $0x7a,%al
  10135b:	7f 17                	jg     101374 <sys_read+0x10f>
  10135d:	a1 50 42 10 00       	mov    0x104250,%eax
  101362:	85 c0                	test   %eax,%eax
  101364:	75 0e                	jne    101374 <sys_read+0x10f>
  101366:	8a 45 e3             	mov    -0x1d(%ebp),%al
  101369:	83 e8 20             	sub    $0x20,%eax
  10136c:	88 45 e3             	mov    %al,-0x1d(%ebp)
  10136f:	e9 94 00 00 00       	jmp    101408 <sys_read+0x1a3>
  101374:	8a 45 e3             	mov    -0x1d(%ebp),%al
  101377:	3c 2b                	cmp    $0x2b,%al
  101379:	7e 12                	jle    10138d <sys_read+0x128>
  10137b:	8a 45 e3             	mov    -0x1d(%ebp),%al
  10137e:	3c 2f                	cmp    $0x2f,%al
  101380:	7f 0b                	jg     10138d <sys_read+0x128>
  101382:	8a 45 e3             	mov    -0x1d(%ebp),%al
  101385:	83 c0 10             	add    $0x10,%eax
  101388:	88 45 e3             	mov    %al,-0x1d(%ebp)
  10138b:	eb 7b                	jmp    101408 <sys_read+0x1a3>
  10138d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101390:	83 f8 28             	cmp    $0x28,%eax
  101393:	74 10                	je     1013a5 <sys_read+0x140>
  101395:	83 f8 29             	cmp    $0x29,%eax
  101398:	74 11                	je     1013ab <sys_read+0x146>
  10139a:	83 f8 27             	cmp    $0x27,%eax
  10139d:	75 12                	jne    1013b1 <sys_read+0x14c>
  10139f:	c6 45 f3 3a          	movb   $0x3a,-0xd(%ebp)
  1013a3:	eb 5d                	jmp    101402 <sys_read+0x19d>
  1013a5:	c6 45 f3 22          	movb   $0x22,-0xd(%ebp)
  1013a9:	eb 57                	jmp    101402 <sys_read+0x19d>
  1013ab:	c6 45 f3 7e          	movb   $0x7e,-0xd(%ebp)
  1013af:	eb 51                	jmp    101402 <sys_read+0x19d>
  1013b1:	83 ec 0c             	sub    $0xc,%esp
  1013b4:	68 94 2e 10 00       	push   $0x102e94
  1013b9:	e8 57 17 00 00       	call   102b15 <printk>
  1013be:	83 c4 10             	add    $0x10,%esp
  1013c1:	83 ec 0c             	sub    $0xc,%esp
  1013c4:	ff 75 ec             	pushl  -0x14(%ebp)
  1013c7:	68 e4 2e 10 00       	push   $0x102ee4
  1013cc:	6a 5a                	push   $0x5a
  1013ce:	68 9a 2e 10 00       	push   $0x102e9a
  1013d3:	68 b5 2e 10 00       	push   $0x102eb5
  1013d8:	e8 38 17 00 00       	call   102b15 <printk>
  1013dd:	83 c4 20             	add    $0x20,%esp
  1013e0:	83 ec 0c             	sub    $0xc,%esp
  1013e3:	68 ca 2e 10 00       	push   $0x102eca
  1013e8:	e8 28 17 00 00       	call   102b15 <printk>
  1013ed:	83 c4 10             	add    $0x10,%esp
  1013f0:	83 ec 08             	sub    $0x8,%esp
  1013f3:	6a 5b                	push   $0x5b
  1013f5:	68 9a 2e 10 00       	push   $0x102e9a
  1013fa:	e8 d2 19 00 00       	call   102dd1 <abort>
  1013ff:	83 c4 10             	add    $0x10,%esp
  101402:	8a 45 f3             	mov    -0xd(%ebp),%al
  101405:	88 45 e3             	mov    %al,-0x1d(%ebp)
  101408:	a1 50 42 10 00       	mov    0x104250,%eax
  10140d:	83 f8 01             	cmp    $0x1,%eax
  101410:	75 20                	jne    101432 <sys_read+0x1cd>
  101412:	8a 45 e3             	mov    -0x1d(%ebp),%al
  101415:	3c 60                	cmp    $0x60,%al
  101417:	7e 19                	jle    101432 <sys_read+0x1cd>
  101419:	8a 45 e3             	mov    -0x1d(%ebp),%al
  10141c:	3c 7a                	cmp    $0x7a,%al
  10141e:	7f 12                	jg     101432 <sys_read+0x1cd>
  101420:	a1 54 42 10 00       	mov    0x104254,%eax
  101425:	85 c0                	test   %eax,%eax
  101427:	75 09                	jne    101432 <sys_read+0x1cd>
  101429:	8a 45 e3             	mov    -0x1d(%ebp),%al
  10142c:	83 e8 20             	sub    $0x20,%eax
  10142f:	88 45 e3             	mov    %al,-0x1d(%ebp)
  101432:	83 ec 0c             	sub    $0xc,%esp
  101435:	68 94 2e 10 00       	push   $0x102e94
  10143a:	e8 d6 16 00 00       	call   102b15 <printk>
  10143f:	83 c4 10             	add    $0x10,%esp
  101442:	8a 45 e3             	mov    -0x1d(%ebp),%al
  101445:	0f be c0             	movsbl %al,%eax
  101448:	83 ec 0c             	sub    $0xc,%esp
  10144b:	50                   	push   %eax
  10144c:	68 e4 2e 10 00       	push   $0x102ee4
  101451:	6a 66                	push   $0x66
  101453:	68 9a 2e 10 00       	push   $0x102e9a
  101458:	68 d0 2e 10 00       	push   $0x102ed0
  10145d:	e8 b3 16 00 00       	call   102b15 <printk>
  101462:	83 c4 20             	add    $0x20,%esp
  101465:	83 ec 0c             	sub    $0xc,%esp
  101468:	68 ca 2e 10 00       	push   $0x102eca
  10146d:	e8 a3 16 00 00       	call   102b15 <printk>
  101472:	83 c4 10             	add    $0x10,%esp
  101475:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101478:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10147b:	01 c2                	add    %eax,%edx
  10147d:	8a 45 e3             	mov    -0x1d(%ebp),%al
  101480:	88 02                	mov    %al,(%edx)
  101482:	8a 45 e3             	mov    -0x1d(%ebp),%al
  101485:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101488:	81 c2 e0 cb 13 01    	add    $0x113cbe0,%edx
  10148e:	88 02                	mov    %al,(%edx)
  101490:	ff 45 f4             	incl   -0xc(%ebp)
  101493:	83 ec 08             	sub    $0x8,%esp
  101496:	6a 01                	push   $0x1
  101498:	8d 45 e3             	lea    -0x1d(%ebp),%eax
  10149b:	50                   	push   %eax
  10149c:	e8 87 fa ff ff       	call   100f28 <printkernel>
  1014a1:	83 c4 10             	add    $0x10,%esp
  1014a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1014a7:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
  1014aa:	7d 0b                	jge    1014b7 <sys_read+0x252>
  1014ac:	8a 45 e3             	mov    -0x1d(%ebp),%al
  1014af:	3c 0a                	cmp    $0xa,%al
  1014b1:	0f 85 e4 fd ff ff    	jne    10129b <sys_read+0x36>
  1014b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1014ba:	8d 50 ff             	lea    -0x1(%eax),%edx
  1014bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1014c0:	01 d0                	add    %edx,%eax
  1014c2:	c6 00 00             	movb   $0x0,(%eax)
  1014c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1014c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1014cb:	c9                   	leave  
  1014cc:	c3                   	ret    

001014cd <inByte>:
  1014cd:	55                   	push   %ebp
  1014ce:	89 e5                	mov    %esp,%ebp
  1014d0:	83 ec 14             	sub    $0x14,%esp
  1014d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1014d6:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  1014da:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1014dd:	89 c2                	mov    %eax,%edx
  1014df:	ec                   	in     (%dx),%al
  1014e0:	88 45 ff             	mov    %al,-0x1(%ebp)
  1014e3:	8a 45 ff             	mov    -0x1(%ebp),%al
  1014e6:	c9                   	leave  
  1014e7:	c3                   	ret    

001014e8 <outByte>:
  1014e8:	55                   	push   %ebp
  1014e9:	89 e5                	mov    %esp,%ebp
  1014eb:	83 ec 08             	sub    $0x8,%esp
  1014ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1014f1:	8b 55 0c             	mov    0xc(%ebp),%edx
  1014f4:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  1014f8:	88 55 f8             	mov    %dl,-0x8(%ebp)
  1014fb:	8a 45 f8             	mov    -0x8(%ebp),%al
  1014fe:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101501:	ee                   	out    %al,(%dx)
  101502:	90                   	nop
  101503:	c9                   	leave  
  101504:	c3                   	ret    

00101505 <initSerial>:
  101505:	55                   	push   %ebp
  101506:	89 e5                	mov    %esp,%ebp
  101508:	6a 00                	push   $0x0
  10150a:	68 f9 03 00 00       	push   $0x3f9
  10150f:	e8 d4 ff ff ff       	call   1014e8 <outByte>
  101514:	83 c4 08             	add    $0x8,%esp
  101517:	6a 80                	push   $0xffffff80
  101519:	68 fb 03 00 00       	push   $0x3fb
  10151e:	e8 c5 ff ff ff       	call   1014e8 <outByte>
  101523:	83 c4 08             	add    $0x8,%esp
  101526:	6a 01                	push   $0x1
  101528:	68 f8 03 00 00       	push   $0x3f8
  10152d:	e8 b6 ff ff ff       	call   1014e8 <outByte>
  101532:	83 c4 08             	add    $0x8,%esp
  101535:	6a 00                	push   $0x0
  101537:	68 f9 03 00 00       	push   $0x3f9
  10153c:	e8 a7 ff ff ff       	call   1014e8 <outByte>
  101541:	83 c4 08             	add    $0x8,%esp
  101544:	6a 03                	push   $0x3
  101546:	68 fb 03 00 00       	push   $0x3fb
  10154b:	e8 98 ff ff ff       	call   1014e8 <outByte>
  101550:	83 c4 08             	add    $0x8,%esp
  101553:	6a c7                	push   $0xffffffc7
  101555:	68 fa 03 00 00       	push   $0x3fa
  10155a:	e8 89 ff ff ff       	call   1014e8 <outByte>
  10155f:	83 c4 08             	add    $0x8,%esp
  101562:	6a 0b                	push   $0xb
  101564:	68 fc 03 00 00       	push   $0x3fc
  101569:	e8 7a ff ff ff       	call   1014e8 <outByte>
  10156e:	83 c4 08             	add    $0x8,%esp
  101571:	90                   	nop
  101572:	c9                   	leave  
  101573:	c3                   	ret    

00101574 <serialIdle>:
  101574:	55                   	push   %ebp
  101575:	89 e5                	mov    %esp,%ebp
  101577:	68 fd 03 00 00       	push   $0x3fd
  10157c:	e8 4c ff ff ff       	call   1014cd <inByte>
  101581:	83 c4 04             	add    $0x4,%esp
  101584:	0f b6 c0             	movzbl %al,%eax
  101587:	83 e0 20             	and    $0x20,%eax
  10158a:	85 c0                	test   %eax,%eax
  10158c:	0f 95 c0             	setne  %al
  10158f:	0f b6 c0             	movzbl %al,%eax
  101592:	c9                   	leave  
  101593:	c3                   	ret    

00101594 <putChar>:
  101594:	55                   	push   %ebp
  101595:	89 e5                	mov    %esp,%ebp
  101597:	83 ec 04             	sub    $0x4,%esp
  10159a:	8b 45 08             	mov    0x8(%ebp),%eax
  10159d:	88 45 fc             	mov    %al,-0x4(%ebp)
  1015a0:	90                   	nop
  1015a1:	e8 ce ff ff ff       	call   101574 <serialIdle>
  1015a6:	83 f8 01             	cmp    $0x1,%eax
  1015a9:	75 f6                	jne    1015a1 <putChar+0xd>
  1015ab:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
  1015af:	50                   	push   %eax
  1015b0:	68 f8 03 00 00       	push   $0x3f8
  1015b5:	e8 2e ff ff ff       	call   1014e8 <outByte>
  1015ba:	83 c4 08             	add    $0x8,%esp
  1015bd:	90                   	nop
  1015be:	c9                   	leave  
  1015bf:	c3                   	ret    

001015c0 <waitForInterrupt>:
  1015c0:	55                   	push   %ebp
  1015c1:	89 e5                	mov    %esp,%ebp
  1015c3:	f4                   	hlt    
  1015c4:	90                   	nop
  1015c5:	5d                   	pop    %ebp
  1015c6:	c3                   	ret    

001015c7 <IDLE>:
  1015c7:	55                   	push   %ebp
  1015c8:	89 e5                	mov    %esp,%ebp
  1015ca:	e8 f1 ff ff ff       	call   1015c0 <waitForInterrupt>
  1015cf:	eb f9                	jmp    1015ca <IDLE+0x3>

001015d1 <put_into_running>:
  1015d1:	55                   	push   %ebp
  1015d2:	89 e5                	mov    %esp,%ebp
  1015d4:	83 ec 08             	sub    $0x8,%esp
  1015d7:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  1015dc:	39 45 08             	cmp    %eax,0x8(%ebp)
  1015df:	75 07                	jne    1015e8 <put_into_running+0x17>
  1015e1:	b8 01 00 00 00       	mov    $0x1,%eax
  1015e6:	eb 3e                	jmp    101626 <put_into_running+0x55>
  1015e8:	8b 45 08             	mov    0x8(%ebp),%eax
  1015eb:	a3 e0 4a 10 00       	mov    %eax,0x104ae0
  1015f0:	e8 71 00 00 00       	call   101666 <getpid>
  1015f5:	89 c2                	mov    %eax,%edx
  1015f7:	89 d0                	mov    %edx,%eax
  1015f9:	c1 e0 07             	shl    $0x7,%eax
  1015fc:	01 d0                	add    %edx,%eax
  1015fe:	01 c0                	add    %eax,%eax
  101600:	01 d0                	add    %edx,%eax
  101602:	01 c0                	add    %eax,%eax
  101604:	01 d0                	add    %edx,%eax
  101606:	c1 e0 04             	shl    $0x4,%eax
  101609:	05 fc 1f 00 00       	add    $0x1ffc,%eax
  10160e:	05 00 4b 10 00       	add    $0x104b00,%eax
  101613:	83 ec 08             	sub    $0x8,%esp
  101616:	50                   	push   %eax
  101617:	6a 10                	push   $0x10
  101619:	e8 0f ee ff ff       	call   10042d <change_tss>
  10161e:	83 c4 10             	add    $0x10,%esp
  101621:	b8 01 00 00 00       	mov    $0x1,%eax
  101626:	c9                   	leave  
  101627:	c3                   	ret    

00101628 <apply_new_pid>:
  101628:	55                   	push   %ebp
  101629:	89 e5                	mov    %esp,%ebp
  10162b:	83 ec 18             	sub    $0x18,%esp
  10162e:	8b 15 58 42 10 00    	mov    0x104258,%edx
  101634:	a1 58 42 10 00       	mov    0x104258,%eax
  101639:	83 ec 08             	sub    $0x8,%esp
  10163c:	52                   	push   %edx
  10163d:	50                   	push   %eax
  10163e:	e8 21 04 00 00       	call   101a64 <get_from>
  101643:	83 c4 10             	add    $0x10,%esp
  101646:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101649:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10164c:	c9                   	leave  
  10164d:	c3                   	ret    

0010164e <put_into_empty>:
  10164e:	55                   	push   %ebp
  10164f:	89 e5                	mov    %esp,%ebp
  101651:	83 ec 08             	sub    $0x8,%esp
  101654:	83 ec 08             	sub    $0x8,%esp
  101657:	ff 75 08             	pushl  0x8(%ebp)
  10165a:	6a 03                	push   $0x3
  10165c:	e8 fa 01 00 00       	call   10185b <put_into>
  101661:	83 c4 10             	add    $0x10,%esp
  101664:	c9                   	leave  
  101665:	c3                   	ret    

00101666 <getpid>:
  101666:	55                   	push   %ebp
  101667:	89 e5                	mov    %esp,%ebp
  101669:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  10166e:	5d                   	pop    %ebp
  10166f:	c3                   	ret    

00101670 <getrunnable>:
  101670:	55                   	push   %ebp
  101671:	89 e5                	mov    %esp,%ebp
  101673:	a1 38 41 10 00       	mov    0x104138,%eax
  101678:	5d                   	pop    %ebp
  101679:	c3                   	ret    

0010167a <getblocked>:
  10167a:	55                   	push   %ebp
  10167b:	89 e5                	mov    %esp,%ebp
  10167d:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101682:	5d                   	pop    %ebp
  101683:	c3                   	ret    

00101684 <get_from_runnable>:
  101684:	55                   	push   %ebp
  101685:	89 e5                	mov    %esp,%ebp
  101687:	83 ec 08             	sub    $0x8,%esp
  10168a:	8b 15 38 41 10 00    	mov    0x104138,%edx
  101690:	a1 38 41 10 00       	mov    0x104138,%eax
  101695:	83 ec 08             	sub    $0x8,%esp
  101698:	52                   	push   %edx
  101699:	50                   	push   %eax
  10169a:	e8 c5 03 00 00       	call   101a64 <get_from>
  10169f:	83 c4 10             	add    $0x10,%esp
  1016a2:	c9                   	leave  
  1016a3:	c3                   	ret    

001016a4 <put_into_runnable>:
  1016a4:	55                   	push   %ebp
  1016a5:	89 e5                	mov    %esp,%ebp
  1016a7:	57                   	push   %edi
  1016a8:	56                   	push   %esi
  1016a9:	53                   	push   %ebx
  1016aa:	83 ec 0c             	sub    $0xc,%esp
  1016ad:	8b 55 08             	mov    0x8(%ebp),%edx
  1016b0:	89 d0                	mov    %edx,%eax
  1016b2:	c1 e0 07             	shl    $0x7,%eax
  1016b5:	01 d0                	add    %edx,%eax
  1016b7:	01 c0                	add    %eax,%eax
  1016b9:	01 d0                	add    %edx,%eax
  1016bb:	01 c0                	add    %eax,%eax
  1016bd:	01 d0                	add    %edx,%eax
  1016bf:	c1 e0 04             	shl    $0x4,%eax
  1016c2:	8d 90 00 6b 10 00    	lea    0x106b00(%eax),%edx
  1016c8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1016cb:	89 c3                	mov    %eax,%ebx
  1016cd:	b8 13 00 00 00       	mov    $0x13,%eax
  1016d2:	89 d7                	mov    %edx,%edi
  1016d4:	89 de                	mov    %ebx,%esi
  1016d6:	89 c1                	mov    %eax,%ecx
  1016d8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1016da:	8b 0d e8 4a 10 00    	mov    0x104ae8,%ecx
  1016e0:	8b 55 08             	mov    0x8(%ebp),%edx
  1016e3:	89 d0                	mov    %edx,%eax
  1016e5:	c1 e0 07             	shl    $0x7,%eax
  1016e8:	01 d0                	add    %edx,%eax
  1016ea:	01 c0                	add    %eax,%eax
  1016ec:	01 d0                	add    %edx,%eax
  1016ee:	01 c0                	add    %eax,%eax
  1016f0:	01 d0                	add    %edx,%eax
  1016f2:	c1 e0 04             	shl    $0x4,%eax
  1016f5:	05 50 6b 10 00       	add    $0x106b50,%eax
  1016fa:	89 08                	mov    %ecx,(%eax)
  1016fc:	8b 55 08             	mov    0x8(%ebp),%edx
  1016ff:	89 d0                	mov    %edx,%eax
  101701:	c1 e0 07             	shl    $0x7,%eax
  101704:	01 d0                	add    %edx,%eax
  101706:	01 c0                	add    %eax,%eax
  101708:	01 d0                	add    %edx,%eax
  10170a:	01 c0                	add    %eax,%eax
  10170c:	01 d0                	add    %edx,%eax
  10170e:	c1 e0 04             	shl    $0x4,%eax
  101711:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  101716:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  10171c:	83 ec 08             	sub    $0x8,%esp
  10171f:	ff 75 08             	pushl  0x8(%ebp)
  101722:	6a 01                	push   $0x1
  101724:	e8 32 01 00 00       	call   10185b <put_into>
  101729:	83 c4 10             	add    $0x10,%esp
  10172c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10172f:	5b                   	pop    %ebx
  101730:	5e                   	pop    %esi
  101731:	5f                   	pop    %edi
  101732:	5d                   	pop    %ebp
  101733:	c3                   	ret    

00101734 <check_block>:
  101734:	55                   	push   %ebp
  101735:	89 e5                	mov    %esp,%ebp
  101737:	83 ec 18             	sub    $0x18,%esp
  10173a:	a1 3c 41 10 00       	mov    0x10413c,%eax
  10173f:	83 f8 ff             	cmp    $0xffffffff,%eax
  101742:	75 0a                	jne    10174e <check_block+0x1a>
  101744:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101749:	e9 0b 01 00 00       	jmp    101859 <check_block+0x125>
  10174e:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101753:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101756:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  10175d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101760:	89 d0                	mov    %edx,%eax
  101762:	c1 e0 07             	shl    $0x7,%eax
  101765:	01 d0                	add    %edx,%eax
  101767:	01 c0                	add    %eax,%eax
  101769:	01 d0                	add    %edx,%eax
  10176b:	01 c0                	add    %eax,%eax
  10176d:	01 d0                	add    %edx,%eax
  10176f:	c1 e0 04             	shl    $0x4,%eax
  101772:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  101777:	8b 00                	mov    (%eax),%eax
  101779:	85 c0                	test   %eax,%eax
  10177b:	0f 85 9c 00 00 00    	jne    10181d <check_block+0xe9>
  101781:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101784:	89 d0                	mov    %edx,%eax
  101786:	c1 e0 07             	shl    $0x7,%eax
  101789:	01 d0                	add    %edx,%eax
  10178b:	01 c0                	add    %eax,%eax
  10178d:	01 d0                	add    %edx,%eax
  10178f:	01 c0                	add    %eax,%eax
  101791:	01 d0                	add    %edx,%eax
  101793:	c1 e0 04             	shl    $0x4,%eax
  101796:	05 54 6b 10 00       	add    $0x106b54,%eax
  10179b:	8b 00                	mov    (%eax),%eax
  10179d:	85 c0                	test   %eax,%eax
  10179f:	7f 7c                	jg     10181d <check_block+0xe9>
  1017a1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1017a4:	89 d0                	mov    %edx,%eax
  1017a6:	c1 e0 07             	shl    $0x7,%eax
  1017a9:	01 d0                	add    %edx,%eax
  1017ab:	01 c0                	add    %eax,%eax
  1017ad:	01 d0                	add    %edx,%eax
  1017af:	01 c0                	add    %eax,%eax
  1017b1:	01 d0                	add    %edx,%eax
  1017b3:	c1 e0 04             	shl    $0x4,%eax
  1017b6:	05 60 6b 10 00       	add    $0x106b60,%eax
  1017bb:	8b 00                	mov    (%eax),%eax
  1017bd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1017c0:	83 ec 0c             	sub    $0xc,%esp
  1017c3:	ff 75 f4             	pushl  -0xc(%ebp)
  1017c6:	e8 68 04 00 00       	call   101c33 <get_from_block>
  1017cb:	83 c4 10             	add    $0x10,%esp
  1017ce:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1017d1:	89 d0                	mov    %edx,%eax
  1017d3:	c1 e0 07             	shl    $0x7,%eax
  1017d6:	01 d0                	add    %edx,%eax
  1017d8:	01 c0                	add    %eax,%eax
  1017da:	01 d0                	add    %edx,%eax
  1017dc:	01 c0                	add    %eax,%eax
  1017de:	01 d0                	add    %edx,%eax
  1017e0:	c1 e0 04             	shl    $0x4,%eax
  1017e3:	05 00 20 00 00       	add    $0x2000,%eax
  1017e8:	05 00 4b 10 00       	add    $0x104b00,%eax
  1017ed:	83 ec 08             	sub    $0x8,%esp
  1017f0:	50                   	push   %eax
  1017f1:	ff 75 f4             	pushl  -0xc(%ebp)
  1017f4:	e8 ab fe ff ff       	call   1016a4 <put_into_runnable>
  1017f9:	83 c4 10             	add    $0x10,%esp
  1017fc:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1017ff:	89 d0                	mov    %edx,%eax
  101801:	c1 e0 07             	shl    $0x7,%eax
  101804:	01 d0                	add    %edx,%eax
  101806:	01 c0                	add    %eax,%eax
  101808:	01 d0                	add    %edx,%eax
  10180a:	01 c0                	add    %eax,%eax
  10180c:	01 d0                	add    %edx,%eax
  10180e:	c1 e0 04             	shl    $0x4,%eax
  101811:	05 60 6b 10 00       	add    $0x106b60,%eax
  101816:	8b 00                	mov    (%eax),%eax
  101818:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10181b:	eb 1f                	jmp    10183c <check_block+0x108>
  10181d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101820:	89 d0                	mov    %edx,%eax
  101822:	c1 e0 07             	shl    $0x7,%eax
  101825:	01 d0                	add    %edx,%eax
  101827:	01 c0                	add    %eax,%eax
  101829:	01 d0                	add    %edx,%eax
  10182b:	01 c0                	add    %eax,%eax
  10182d:	01 d0                	add    %edx,%eax
  10182f:	c1 e0 04             	shl    $0x4,%eax
  101832:	05 60 6b 10 00       	add    $0x106b60,%eax
  101837:	8b 00                	mov    (%eax),%eax
  101839:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10183c:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101841:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  101844:	74 0e                	je     101854 <check_block+0x120>
  101846:	a1 3c 41 10 00       	mov    0x10413c,%eax
  10184b:	83 f8 ff             	cmp    $0xffffffff,%eax
  10184e:	0f 85 09 ff ff ff    	jne    10175d <check_block+0x29>
  101854:	b8 01 00 00 00       	mov    $0x1,%eax
  101859:	c9                   	leave  
  10185a:	c3                   	ret    

0010185b <put_into>:
  10185b:	55                   	push   %ebp
  10185c:	89 e5                	mov    %esp,%ebp
  10185e:	83 ec 18             	sub    $0x18,%esp
  101861:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101868:	8b 45 08             	mov    0x8(%ebp),%eax
  10186b:	83 f8 01             	cmp    $0x1,%eax
  10186e:	74 14                	je     101884 <put_into+0x29>
  101870:	83 f8 03             	cmp    $0x3,%eax
  101873:	74 06                	je     10187b <put_into+0x20>
  101875:	85 c0                	test   %eax,%eax
  101877:	74 14                	je     10188d <put_into+0x32>
  101879:	eb 1b                	jmp    101896 <put_into+0x3b>
  10187b:	c7 45 f4 58 42 10 00 	movl   $0x104258,-0xc(%ebp)
  101882:	eb 2e                	jmp    1018b2 <put_into+0x57>
  101884:	c7 45 f4 38 41 10 00 	movl   $0x104138,-0xc(%ebp)
  10188b:	eb 25                	jmp    1018b2 <put_into+0x57>
  10188d:	c7 45 f4 3c 41 10 00 	movl   $0x10413c,-0xc(%ebp)
  101894:	eb 1c                	jmp    1018b2 <put_into+0x57>
  101896:	83 ec 08             	sub    $0x8,%esp
  101899:	6a 5f                	push   $0x5f
  10189b:	68 f0 2e 10 00       	push   $0x102ef0
  1018a0:	e8 2c 15 00 00       	call   102dd1 <abort>
  1018a5:	83 c4 10             	add    $0x10,%esp
  1018a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1018ad:	e9 1e 01 00 00       	jmp    1019d0 <put_into+0x175>
  1018b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018b5:	8b 00                	mov    (%eax),%eax
  1018b7:	83 f8 ff             	cmp    $0xffffffff,%eax
  1018ba:	75 57                	jne    101913 <put_into+0xb8>
  1018bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018bf:	8b 55 0c             	mov    0xc(%ebp),%edx
  1018c2:	89 10                	mov    %edx,(%eax)
  1018c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018c7:	8b 10                	mov    (%eax),%edx
  1018c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018cc:	8b 00                	mov    (%eax),%eax
  1018ce:	89 c1                	mov    %eax,%ecx
  1018d0:	89 d0                	mov    %edx,%eax
  1018d2:	c1 e0 07             	shl    $0x7,%eax
  1018d5:	01 d0                	add    %edx,%eax
  1018d7:	01 c0                	add    %eax,%eax
  1018d9:	01 d0                	add    %edx,%eax
  1018db:	01 c0                	add    %eax,%eax
  1018dd:	01 d0                	add    %edx,%eax
  1018df:	c1 e0 04             	shl    $0x4,%eax
  1018e2:	05 60 6b 10 00       	add    $0x106b60,%eax
  1018e7:	89 08                	mov    %ecx,(%eax)
  1018e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018ec:	8b 10                	mov    (%eax),%edx
  1018ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018f1:	8b 00                	mov    (%eax),%eax
  1018f3:	89 c1                	mov    %eax,%ecx
  1018f5:	89 d0                	mov    %edx,%eax
  1018f7:	c1 e0 07             	shl    $0x7,%eax
  1018fa:	01 d0                	add    %edx,%eax
  1018fc:	01 c0                	add    %eax,%eax
  1018fe:	01 d0                	add    %edx,%eax
  101900:	01 c0                	add    %eax,%eax
  101902:	01 d0                	add    %edx,%eax
  101904:	c1 e0 04             	shl    $0x4,%eax
  101907:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  10190c:	89 08                	mov    %ecx,(%eax)
  10190e:	e9 b8 00 00 00       	jmp    1019cb <put_into+0x170>
  101913:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101916:	8b 10                	mov    (%eax),%edx
  101918:	89 d0                	mov    %edx,%eax
  10191a:	c1 e0 07             	shl    $0x7,%eax
  10191d:	01 d0                	add    %edx,%eax
  10191f:	01 c0                	add    %eax,%eax
  101921:	01 d0                	add    %edx,%eax
  101923:	01 c0                	add    %eax,%eax
  101925:	01 d0                	add    %edx,%eax
  101927:	c1 e0 04             	shl    $0x4,%eax
  10192a:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  10192f:	8b 10                	mov    (%eax),%edx
  101931:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  101934:	89 d0                	mov    %edx,%eax
  101936:	c1 e0 07             	shl    $0x7,%eax
  101939:	01 d0                	add    %edx,%eax
  10193b:	01 c0                	add    %eax,%eax
  10193d:	01 d0                	add    %edx,%eax
  10193f:	01 c0                	add    %eax,%eax
  101941:	01 d0                	add    %edx,%eax
  101943:	c1 e0 04             	shl    $0x4,%eax
  101946:	05 60 6b 10 00       	add    $0x106b60,%eax
  10194b:	89 08                	mov    %ecx,(%eax)
  10194d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101950:	8b 10                	mov    (%eax),%edx
  101952:	89 d0                	mov    %edx,%eax
  101954:	c1 e0 07             	shl    $0x7,%eax
  101957:	01 d0                	add    %edx,%eax
  101959:	01 c0                	add    %eax,%eax
  10195b:	01 d0                	add    %edx,%eax
  10195d:	01 c0                	add    %eax,%eax
  10195f:	01 d0                	add    %edx,%eax
  101961:	c1 e0 04             	shl    $0x4,%eax
  101964:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  101969:	8b 08                	mov    (%eax),%ecx
  10196b:	8b 55 0c             	mov    0xc(%ebp),%edx
  10196e:	89 d0                	mov    %edx,%eax
  101970:	c1 e0 07             	shl    $0x7,%eax
  101973:	01 d0                	add    %edx,%eax
  101975:	01 c0                	add    %eax,%eax
  101977:	01 d0                	add    %edx,%eax
  101979:	01 c0                	add    %eax,%eax
  10197b:	01 d0                	add    %edx,%eax
  10197d:	c1 e0 04             	shl    $0x4,%eax
  101980:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  101985:	89 08                	mov    %ecx,(%eax)
  101987:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10198a:	8b 00                	mov    (%eax),%eax
  10198c:	89 c1                	mov    %eax,%ecx
  10198e:	8b 55 0c             	mov    0xc(%ebp),%edx
  101991:	89 d0                	mov    %edx,%eax
  101993:	c1 e0 07             	shl    $0x7,%eax
  101996:	01 d0                	add    %edx,%eax
  101998:	01 c0                	add    %eax,%eax
  10199a:	01 d0                	add    %edx,%eax
  10199c:	01 c0                	add    %eax,%eax
  10199e:	01 d0                	add    %edx,%eax
  1019a0:	c1 e0 04             	shl    $0x4,%eax
  1019a3:	05 60 6b 10 00       	add    $0x106b60,%eax
  1019a8:	89 08                	mov    %ecx,(%eax)
  1019aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1019ad:	8b 10                	mov    (%eax),%edx
  1019af:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1019b2:	89 d0                	mov    %edx,%eax
  1019b4:	c1 e0 07             	shl    $0x7,%eax
  1019b7:	01 d0                	add    %edx,%eax
  1019b9:	01 c0                	add    %eax,%eax
  1019bb:	01 d0                	add    %edx,%eax
  1019bd:	01 c0                	add    %eax,%eax
  1019bf:	01 d0                	add    %edx,%eax
  1019c1:	c1 e0 04             	shl    $0x4,%eax
  1019c4:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  1019c9:	89 08                	mov    %ecx,(%eax)
  1019cb:	b8 01 00 00 00       	mov    $0x1,%eax
  1019d0:	c9                   	leave  
  1019d1:	c3                   	ret    

001019d2 <put_into_block>:
  1019d2:	55                   	push   %ebp
  1019d3:	89 e5                	mov    %esp,%ebp
  1019d5:	57                   	push   %edi
  1019d6:	56                   	push   %esi
  1019d7:	53                   	push   %ebx
  1019d8:	83 ec 0c             	sub    $0xc,%esp
  1019db:	8b 55 08             	mov    0x8(%ebp),%edx
  1019de:	89 d0                	mov    %edx,%eax
  1019e0:	c1 e0 07             	shl    $0x7,%eax
  1019e3:	01 d0                	add    %edx,%eax
  1019e5:	01 c0                	add    %eax,%eax
  1019e7:	01 d0                	add    %edx,%eax
  1019e9:	01 c0                	add    %eax,%eax
  1019eb:	01 d0                	add    %edx,%eax
  1019ed:	c1 e0 04             	shl    $0x4,%eax
  1019f0:	8d 90 00 6b 10 00    	lea    0x106b00(%eax),%edx
  1019f6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1019f9:	89 c3                	mov    %eax,%ebx
  1019fb:	b8 13 00 00 00       	mov    $0x13,%eax
  101a00:	89 d7                	mov    %edx,%edi
  101a02:	89 de                	mov    %ebx,%esi
  101a04:	89 c1                	mov    %eax,%ecx
  101a06:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101a08:	8b 45 0c             	mov    0xc(%ebp),%eax
  101a0b:	8b 40 20             	mov    0x20(%eax),%eax
  101a0e:	89 c1                	mov    %eax,%ecx
  101a10:	8b 55 08             	mov    0x8(%ebp),%edx
  101a13:	89 d0                	mov    %edx,%eax
  101a15:	c1 e0 07             	shl    $0x7,%eax
  101a18:	01 d0                	add    %edx,%eax
  101a1a:	01 c0                	add    %eax,%eax
  101a1c:	01 d0                	add    %edx,%eax
  101a1e:	01 c0                	add    %eax,%eax
  101a20:	01 d0                	add    %edx,%eax
  101a22:	c1 e0 04             	shl    $0x4,%eax
  101a25:	05 54 6b 10 00       	add    $0x106b54,%eax
  101a2a:	89 08                	mov    %ecx,(%eax)
  101a2c:	8b 55 08             	mov    0x8(%ebp),%edx
  101a2f:	89 d0                	mov    %edx,%eax
  101a31:	c1 e0 07             	shl    $0x7,%eax
  101a34:	01 d0                	add    %edx,%eax
  101a36:	01 c0                	add    %eax,%eax
  101a38:	01 d0                	add    %edx,%eax
  101a3a:	01 c0                	add    %eax,%eax
  101a3c:	01 d0                	add    %edx,%eax
  101a3e:	c1 e0 04             	shl    $0x4,%eax
  101a41:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  101a46:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  101a4c:	83 ec 08             	sub    $0x8,%esp
  101a4f:	ff 75 08             	pushl  0x8(%ebp)
  101a52:	6a 00                	push   $0x0
  101a54:	e8 02 fe ff ff       	call   10185b <put_into>
  101a59:	83 c4 10             	add    $0x10,%esp
  101a5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101a5f:	5b                   	pop    %ebx
  101a60:	5e                   	pop    %esi
  101a61:	5f                   	pop    %edi
  101a62:	5d                   	pop    %ebp
  101a63:	c3                   	ret    

00101a64 <get_from>:
  101a64:	55                   	push   %ebp
  101a65:	89 e5                	mov    %esp,%ebp
  101a67:	83 ec 18             	sub    $0x18,%esp
  101a6a:	83 ec 08             	sub    $0x8,%esp
  101a6d:	ff 75 0c             	pushl  0xc(%ebp)
  101a70:	ff 75 08             	pushl  0x8(%ebp)
  101a73:	e8 f6 01 00 00       	call   101c6e <check_is_in>
  101a78:	83 c4 10             	add    $0x10,%esp
  101a7b:	83 f8 01             	cmp    $0x1,%eax
  101a7e:	74 61                	je     101ae1 <get_from+0x7d>
  101a80:	83 ec 0c             	sub    $0xc,%esp
  101a83:	68 fe 2e 10 00       	push   $0x102efe
  101a88:	e8 88 10 00 00       	call   102b15 <printk>
  101a8d:	83 c4 10             	add    $0x10,%esp
  101a90:	83 ec 08             	sub    $0x8,%esp
  101a93:	ff 75 0c             	pushl  0xc(%ebp)
  101a96:	ff 75 08             	pushl  0x8(%ebp)
  101a99:	68 30 2f 10 00       	push   $0x102f30
  101a9e:	6a 7f                	push   $0x7f
  101aa0:	68 f0 2e 10 00       	push   $0x102ef0
  101aa5:	68 04 2f 10 00       	push   $0x102f04
  101aaa:	e8 66 10 00 00       	call   102b15 <printk>
  101aaf:	83 c4 20             	add    $0x20,%esp
  101ab2:	83 ec 0c             	sub    $0xc,%esp
  101ab5:	68 28 2f 10 00       	push   $0x102f28
  101aba:	e8 56 10 00 00       	call   102b15 <printk>
  101abf:	83 c4 10             	add    $0x10,%esp
  101ac2:	83 ec 08             	sub    $0x8,%esp
  101ac5:	68 80 00 00 00       	push   $0x80
  101aca:	68 f0 2e 10 00       	push   $0x102ef0
  101acf:	e8 fd 12 00 00       	call   102dd1 <abort>
  101ad4:	83 c4 10             	add    $0x10,%esp
  101ad7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101adc:	e9 50 01 00 00       	jmp    101c31 <get_from+0x1cd>
  101ae1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101ae8:	8b 55 0c             	mov    0xc(%ebp),%edx
  101aeb:	89 d0                	mov    %edx,%eax
  101aed:	c1 e0 07             	shl    $0x7,%eax
  101af0:	01 d0                	add    %edx,%eax
  101af2:	01 c0                	add    %eax,%eax
  101af4:	01 d0                	add    %edx,%eax
  101af6:	01 c0                	add    %eax,%eax
  101af8:	01 d0                	add    %edx,%eax
  101afa:	c1 e0 04             	shl    $0x4,%eax
  101afd:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  101b02:	8b 00                	mov    (%eax),%eax
  101b04:	83 f8 01             	cmp    $0x1,%eax
  101b07:	74 14                	je     101b1d <get_from+0xb9>
  101b09:	83 f8 03             	cmp    $0x3,%eax
  101b0c:	74 06                	je     101b14 <get_from+0xb0>
  101b0e:	85 c0                	test   %eax,%eax
  101b10:	74 14                	je     101b26 <get_from+0xc2>
  101b12:	eb 1b                	jmp    101b2f <get_from+0xcb>
  101b14:	c7 45 f4 58 42 10 00 	movl   $0x104258,-0xc(%ebp)
  101b1b:	eb 27                	jmp    101b44 <get_from+0xe0>
  101b1d:	c7 45 f4 38 41 10 00 	movl   $0x104138,-0xc(%ebp)
  101b24:	eb 1e                	jmp    101b44 <get_from+0xe0>
  101b26:	c7 45 f4 3c 41 10 00 	movl   $0x10413c,-0xc(%ebp)
  101b2d:	eb 15                	jmp    101b44 <get_from+0xe0>
  101b2f:	83 ec 08             	sub    $0x8,%esp
  101b32:	68 92 00 00 00       	push   $0x92
  101b37:	68 f0 2e 10 00       	push   $0x102ef0
  101b3c:	e8 90 12 00 00       	call   102dd1 <abort>
  101b41:	83 c4 10             	add    $0x10,%esp
  101b44:	8b 45 08             	mov    0x8(%ebp),%eax
  101b47:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101b4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b4d:	8b 00                	mov    (%eax),%eax
  101b4f:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  101b52:	74 15                	je     101b69 <get_from+0x105>
  101b54:	83 ec 08             	sub    $0x8,%esp
  101b57:	68 97 00 00 00       	push   $0x97
  101b5c:	68 f0 2e 10 00       	push   $0x102ef0
  101b61:	e8 6b 12 00 00       	call   102dd1 <abort>
  101b66:	83 c4 10             	add    $0x10,%esp
  101b69:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  101b6d:	75 0a                	jne    101b79 <get_from+0x115>
  101b6f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101b74:	e9 b8 00 00 00       	jmp    101c31 <get_from+0x1cd>
  101b79:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101b7c:	89 d0                	mov    %edx,%eax
  101b7e:	c1 e0 07             	shl    $0x7,%eax
  101b81:	01 d0                	add    %edx,%eax
  101b83:	01 c0                	add    %eax,%eax
  101b85:	01 d0                	add    %edx,%eax
  101b87:	01 c0                	add    %eax,%eax
  101b89:	01 d0                	add    %edx,%eax
  101b8b:	c1 e0 04             	shl    $0x4,%eax
  101b8e:	05 60 6b 10 00       	add    $0x106b60,%eax
  101b93:	8b 10                	mov    (%eax),%edx
  101b95:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101b98:	39 c2                	cmp    %eax,%edx
  101b9a:	75 0e                	jne    101baa <get_from+0x146>
  101b9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b9f:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
  101ba5:	e9 84 00 00 00       	jmp    101c2e <get_from+0x1ca>
  101baa:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101bad:	89 d0                	mov    %edx,%eax
  101baf:	c1 e0 07             	shl    $0x7,%eax
  101bb2:	01 d0                	add    %edx,%eax
  101bb4:	01 c0                	add    %eax,%eax
  101bb6:	01 d0                	add    %edx,%eax
  101bb8:	01 c0                	add    %eax,%eax
  101bba:	01 d0                	add    %edx,%eax
  101bbc:	c1 e0 04             	shl    $0x4,%eax
  101bbf:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  101bc4:	8b 00                	mov    (%eax),%eax
  101bc6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  101bc9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101bcc:	89 d0                	mov    %edx,%eax
  101bce:	c1 e0 07             	shl    $0x7,%eax
  101bd1:	01 d0                	add    %edx,%eax
  101bd3:	01 c0                	add    %eax,%eax
  101bd5:	01 d0                	add    %edx,%eax
  101bd7:	01 c0                	add    %eax,%eax
  101bd9:	01 d0                	add    %edx,%eax
  101bdb:	c1 e0 04             	shl    $0x4,%eax
  101bde:	05 60 6b 10 00       	add    $0x106b60,%eax
  101be3:	8b 00                	mov    (%eax),%eax
  101be5:	89 45 e8             	mov    %eax,-0x18(%ebp)
  101be8:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  101beb:	8b 55 ec             	mov    -0x14(%ebp),%edx
  101bee:	89 d0                	mov    %edx,%eax
  101bf0:	c1 e0 07             	shl    $0x7,%eax
  101bf3:	01 d0                	add    %edx,%eax
  101bf5:	01 c0                	add    %eax,%eax
  101bf7:	01 d0                	add    %edx,%eax
  101bf9:	01 c0                	add    %eax,%eax
  101bfb:	01 d0                	add    %edx,%eax
  101bfd:	c1 e0 04             	shl    $0x4,%eax
  101c00:	05 60 6b 10 00       	add    $0x106b60,%eax
  101c05:	89 08                	mov    %ecx,(%eax)
  101c07:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  101c0a:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101c0d:	89 d0                	mov    %edx,%eax
  101c0f:	c1 e0 07             	shl    $0x7,%eax
  101c12:	01 d0                	add    %edx,%eax
  101c14:	01 c0                	add    %eax,%eax
  101c16:	01 d0                	add    %edx,%eax
  101c18:	01 c0                	add    %eax,%eax
  101c1a:	01 d0                	add    %edx,%eax
  101c1c:	c1 e0 04             	shl    $0x4,%eax
  101c1f:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  101c24:	89 08                	mov    %ecx,(%eax)
  101c26:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c29:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101c2c:	89 10                	mov    %edx,(%eax)
  101c2e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101c31:	c9                   	leave  
  101c32:	c3                   	ret    

00101c33 <get_from_block>:
  101c33:	55                   	push   %ebp
  101c34:	89 e5                	mov    %esp,%ebp
  101c36:	83 ec 08             	sub    $0x8,%esp
  101c39:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101c3e:	83 ec 08             	sub    $0x8,%esp
  101c41:	ff 75 08             	pushl  0x8(%ebp)
  101c44:	50                   	push   %eax
  101c45:	e8 1a fe ff ff       	call   101a64 <get_from>
  101c4a:	83 c4 10             	add    $0x10,%esp
  101c4d:	83 f8 ff             	cmp    $0xffffffff,%eax
  101c50:	75 15                	jne    101c67 <get_from_block+0x34>
  101c52:	83 ec 08             	sub    $0x8,%esp
  101c55:	68 ae 00 00 00       	push   $0xae
  101c5a:	68 f0 2e 10 00       	push   $0x102ef0
  101c5f:	e8 6d 11 00 00       	call   102dd1 <abort>
  101c64:	83 c4 10             	add    $0x10,%esp
  101c67:	b8 01 00 00 00       	mov    $0x1,%eax
  101c6c:	c9                   	leave  
  101c6d:	c3                   	ret    

00101c6e <check_is_in>:
  101c6e:	55                   	push   %ebp
  101c6f:	89 e5                	mov    %esp,%ebp
  101c71:	83 ec 10             	sub    $0x10,%esp
  101c74:	8b 45 08             	mov    0x8(%ebp),%eax
  101c77:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101c7a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101c7d:	3b 45 0c             	cmp    0xc(%ebp),%eax
  101c80:	75 07                	jne    101c89 <check_is_in+0x1b>
  101c82:	b8 01 00 00 00       	mov    $0x1,%eax
  101c87:	eb 2c                	jmp    101cb5 <check_is_in+0x47>
  101c89:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101c8c:	89 d0                	mov    %edx,%eax
  101c8e:	c1 e0 07             	shl    $0x7,%eax
  101c91:	01 d0                	add    %edx,%eax
  101c93:	01 c0                	add    %eax,%eax
  101c95:	01 d0                	add    %edx,%eax
  101c97:	01 c0                	add    %eax,%eax
  101c99:	01 d0                	add    %edx,%eax
  101c9b:	c1 e0 04             	shl    $0x4,%eax
  101c9e:	05 60 6b 10 00       	add    $0x106b60,%eax
  101ca3:	8b 00                	mov    (%eax),%eax
  101ca5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101ca8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101cab:	3b 45 08             	cmp    0x8(%ebp),%eax
  101cae:	75 ca                	jne    101c7a <check_is_in+0xc>
  101cb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101cb5:	c9                   	leave  
  101cb6:	c3                   	ret    

00101cb7 <block_decrease>:
  101cb7:	55                   	push   %ebp
  101cb8:	89 e5                	mov    %esp,%ebp
  101cba:	83 ec 10             	sub    $0x10,%esp
  101cbd:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101cc2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101cc5:	83 7d fc ff          	cmpl   $0xffffffff,-0x4(%ebp)
  101cc9:	75 07                	jne    101cd2 <block_decrease+0x1b>
  101ccb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101cd0:	eb 69                	jmp    101d3b <block_decrease+0x84>
  101cd2:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101cd5:	89 d0                	mov    %edx,%eax
  101cd7:	c1 e0 07             	shl    $0x7,%eax
  101cda:	01 d0                	add    %edx,%eax
  101cdc:	01 c0                	add    %eax,%eax
  101cde:	01 d0                	add    %edx,%eax
  101ce0:	01 c0                	add    %eax,%eax
  101ce2:	01 d0                	add    %edx,%eax
  101ce4:	c1 e0 04             	shl    $0x4,%eax
  101ce7:	05 54 6b 10 00       	add    $0x106b54,%eax
  101cec:	8b 00                	mov    (%eax),%eax
  101cee:	8d 48 ff             	lea    -0x1(%eax),%ecx
  101cf1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101cf4:	89 d0                	mov    %edx,%eax
  101cf6:	c1 e0 07             	shl    $0x7,%eax
  101cf9:	01 d0                	add    %edx,%eax
  101cfb:	01 c0                	add    %eax,%eax
  101cfd:	01 d0                	add    %edx,%eax
  101cff:	01 c0                	add    %eax,%eax
  101d01:	01 d0                	add    %edx,%eax
  101d03:	c1 e0 04             	shl    $0x4,%eax
  101d06:	05 54 6b 10 00       	add    $0x106b54,%eax
  101d0b:	89 08                	mov    %ecx,(%eax)
  101d0d:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101d10:	89 d0                	mov    %edx,%eax
  101d12:	c1 e0 07             	shl    $0x7,%eax
  101d15:	01 d0                	add    %edx,%eax
  101d17:	01 c0                	add    %eax,%eax
  101d19:	01 d0                	add    %edx,%eax
  101d1b:	01 c0                	add    %eax,%eax
  101d1d:	01 d0                	add    %edx,%eax
  101d1f:	c1 e0 04             	shl    $0x4,%eax
  101d22:	05 60 6b 10 00       	add    $0x106b60,%eax
  101d27:	8b 00                	mov    (%eax),%eax
  101d29:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101d2c:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101d31:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  101d34:	75 9c                	jne    101cd2 <block_decrease+0x1b>
  101d36:	b8 01 00 00 00       	mov    $0x1,%eax
  101d3b:	c9                   	leave  
  101d3c:	c3                   	ret    

00101d3d <init_pcb>:
  101d3d:	55                   	push   %ebp
  101d3e:	89 e5                	mov    %esp,%ebp
  101d40:	83 ec 10             	sub    $0x10,%esp
  101d43:	c7 05 e8 4a 10 00 05 	movl   $0x5,0x104ae8
  101d4a:	00 00 00 
  101d4d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101d54:	e9 86 00 00 00       	jmp    101ddf <init_pcb+0xa2>
  101d59:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  101d5c:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101d5f:	89 d0                	mov    %edx,%eax
  101d61:	c1 e0 07             	shl    $0x7,%eax
  101d64:	01 d0                	add    %edx,%eax
  101d66:	01 c0                	add    %eax,%eax
  101d68:	01 d0                	add    %edx,%eax
  101d6a:	01 c0                	add    %eax,%eax
  101d6c:	01 d0                	add    %edx,%eax
  101d6e:	c1 e0 04             	shl    $0x4,%eax
  101d71:	05 58 6b 10 00       	add    $0x106b58,%eax
  101d76:	89 08                	mov    %ecx,(%eax)
  101d78:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101d7b:	48                   	dec    %eax
  101d7c:	89 c1                	mov    %eax,%ecx
  101d7e:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101d81:	89 d0                	mov    %edx,%eax
  101d83:	c1 e0 07             	shl    $0x7,%eax
  101d86:	01 d0                	add    %edx,%eax
  101d88:	01 c0                	add    %eax,%eax
  101d8a:	01 d0                	add    %edx,%eax
  101d8c:	01 c0                	add    %eax,%eax
  101d8e:	01 d0                	add    %edx,%eax
  101d90:	c1 e0 04             	shl    $0x4,%eax
  101d93:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  101d98:	89 08                	mov    %ecx,(%eax)
  101d9a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101d9d:	40                   	inc    %eax
  101d9e:	89 c1                	mov    %eax,%ecx
  101da0:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101da3:	89 d0                	mov    %edx,%eax
  101da5:	c1 e0 07             	shl    $0x7,%eax
  101da8:	01 d0                	add    %edx,%eax
  101daa:	01 c0                	add    %eax,%eax
  101dac:	01 d0                	add    %edx,%eax
  101dae:	01 c0                	add    %eax,%eax
  101db0:	01 d0                	add    %edx,%eax
  101db2:	c1 e0 04             	shl    $0x4,%eax
  101db5:	05 60 6b 10 00       	add    $0x106b60,%eax
  101dba:	89 08                	mov    %ecx,(%eax)
  101dbc:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101dbf:	89 d0                	mov    %edx,%eax
  101dc1:	c1 e0 07             	shl    $0x7,%eax
  101dc4:	01 d0                	add    %edx,%eax
  101dc6:	01 c0                	add    %eax,%eax
  101dc8:	01 d0                	add    %edx,%eax
  101dca:	01 c0                	add    %eax,%eax
  101dcc:	01 d0                	add    %edx,%eax
  101dce:	c1 e0 04             	shl    $0x4,%eax
  101dd1:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  101dd6:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  101ddc:	ff 45 fc             	incl   -0x4(%ebp)
  101ddf:	81 7d fc ff 07 00 00 	cmpl   $0x7ff,-0x4(%ebp)
  101de6:	0f 8e 6d ff ff ff    	jle    101d59 <init_pcb+0x1c>
  101dec:	c7 05 5c 6b 10 00 ff 	movl   $0x7ff,0x106b5c
  101df3:	07 00 00 
  101df6:	c7 05 f0 ca 13 01 00 	movl   $0x0,0x113caf0
  101dfd:	00 00 00 
  101e00:	90                   	nop
  101e01:	c9                   	leave  
  101e02:	c3                   	ret    

00101e03 <init_kernel_pcb>:
  101e03:	55                   	push   %ebp
  101e04:	89 e5                	mov    %esp,%ebp
  101e06:	83 ec 08             	sub    $0x8,%esp
  101e09:	e8 1a f8 ff ff       	call   101628 <apply_new_pid>
  101e0e:	85 c0                	test   %eax,%eax
  101e10:	74 15                	je     101e27 <init_kernel_pcb+0x24>
  101e12:	83 ec 08             	sub    $0x8,%esp
  101e15:	68 e1 00 00 00       	push   $0xe1
  101e1a:	68 f0 2e 10 00       	push   $0x102ef0
  101e1f:	e8 ad 0f 00 00       	call   102dd1 <abort>
  101e24:	83 c4 10             	add    $0x10,%esp
  101e27:	c7 05 48 6b 10 00 10 	movl   $0x10,0x106b48
  101e2e:	00 00 00 
  101e31:	c7 05 3c 6b 10 00 08 	movl   $0x8,0x106b3c
  101e38:	00 00 00 
  101e3b:	c7 05 0c 6b 10 00 10 	movl   $0x10,0x106b0c
  101e42:	00 00 00 
  101e45:	c7 05 08 6b 10 00 10 	movl   $0x10,0x106b08
  101e4c:	00 00 00 
  101e4f:	b8 c7 15 10 00       	mov    $0x1015c7,%eax
  101e54:	a3 38 6b 10 00       	mov    %eax,0x106b38
  101e59:	c7 05 44 6b 10 00 00 	movl   $0x400000,0x106b44
  101e60:	00 40 00 
  101e63:	c7 05 4c 6b 10 00 01 	movl   $0x1,0x106b4c
  101e6a:	00 00 00 
  101e6d:	c7 05 50 6b 10 00 04 	movl   $0x4,0x106b50
  101e74:	00 00 00 
  101e77:	b8 01 00 00 00       	mov    $0x1,%eax
  101e7c:	c9                   	leave  
  101e7d:	c3                   	ret    

00101e7e <make_pcb>:
  101e7e:	55                   	push   %ebp
  101e7f:	89 e5                	mov    %esp,%ebp
  101e81:	57                   	push   %edi
  101e82:	56                   	push   %esi
  101e83:	53                   	push   %ebx
  101e84:	8b 55 08             	mov    0x8(%ebp),%edx
  101e87:	89 d0                	mov    %edx,%eax
  101e89:	c1 e0 07             	shl    $0x7,%eax
  101e8c:	01 d0                	add    %edx,%eax
  101e8e:	01 c0                	add    %eax,%eax
  101e90:	01 d0                	add    %edx,%eax
  101e92:	01 c0                	add    %eax,%eax
  101e94:	01 d0                	add    %edx,%eax
  101e96:	c1 e0 04             	shl    $0x4,%eax
  101e99:	8d 90 00 6b 10 00    	lea    0x106b00(%eax),%edx
  101e9f:	8b 45 0c             	mov    0xc(%ebp),%eax
  101ea2:	89 c3                	mov    %eax,%ebx
  101ea4:	b8 13 00 00 00       	mov    $0x13,%eax
  101ea9:	89 d7                	mov    %edx,%edi
  101eab:	89 de                	mov    %ebx,%esi
  101ead:	89 c1                	mov    %eax,%ecx
  101eaf:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101eb1:	8b 4d 10             	mov    0x10(%ebp),%ecx
  101eb4:	8b 55 08             	mov    0x8(%ebp),%edx
  101eb7:	89 d0                	mov    %edx,%eax
  101eb9:	c1 e0 07             	shl    $0x7,%eax
  101ebc:	01 d0                	add    %edx,%eax
  101ebe:	01 c0                	add    %eax,%eax
  101ec0:	01 d0                	add    %edx,%eax
  101ec2:	01 c0                	add    %eax,%eax
  101ec4:	01 d0                	add    %edx,%eax
  101ec6:	c1 e0 04             	shl    $0x4,%eax
  101ec9:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  101ece:	89 08                	mov    %ecx,(%eax)
  101ed0:	8b 4d 14             	mov    0x14(%ebp),%ecx
  101ed3:	8b 55 08             	mov    0x8(%ebp),%edx
  101ed6:	89 d0                	mov    %edx,%eax
  101ed8:	c1 e0 07             	shl    $0x7,%eax
  101edb:	01 d0                	add    %edx,%eax
  101edd:	01 c0                	add    %eax,%eax
  101edf:	01 d0                	add    %edx,%eax
  101ee1:	01 c0                	add    %eax,%eax
  101ee3:	01 d0                	add    %edx,%eax
  101ee5:	c1 e0 04             	shl    $0x4,%eax
  101ee8:	05 50 6b 10 00       	add    $0x106b50,%eax
  101eed:	89 08                	mov    %ecx,(%eax)
  101eef:	8b 4d 18             	mov    0x18(%ebp),%ecx
  101ef2:	8b 55 08             	mov    0x8(%ebp),%edx
  101ef5:	89 d0                	mov    %edx,%eax
  101ef7:	c1 e0 07             	shl    $0x7,%eax
  101efa:	01 d0                	add    %edx,%eax
  101efc:	01 c0                	add    %eax,%eax
  101efe:	01 d0                	add    %edx,%eax
  101f00:	01 c0                	add    %eax,%eax
  101f02:	01 d0                	add    %edx,%eax
  101f04:	c1 e0 04             	shl    $0x4,%eax
  101f07:	05 54 6b 10 00       	add    $0x106b54,%eax
  101f0c:	89 08                	mov    %ecx,(%eax)
  101f0e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  101f11:	8b 55 08             	mov    0x8(%ebp),%edx
  101f14:	89 d0                	mov    %edx,%eax
  101f16:	c1 e0 07             	shl    $0x7,%eax
  101f19:	01 d0                	add    %edx,%eax
  101f1b:	01 c0                	add    %eax,%eax
  101f1d:	01 d0                	add    %edx,%eax
  101f1f:	01 c0                	add    %eax,%eax
  101f21:	01 d0                	add    %edx,%eax
  101f23:	c1 e0 04             	shl    $0x4,%eax
  101f26:	05 6c 6b 10 00       	add    $0x106b6c,%eax
  101f2b:	89 08                	mov    %ecx,(%eax)
  101f2d:	b8 01 00 00 00       	mov    $0x1,%eax
  101f32:	5b                   	pop    %ebx
  101f33:	5e                   	pop    %esi
  101f34:	5f                   	pop    %edi
  101f35:	5d                   	pop    %ebp
  101f36:	c3                   	ret    

00101f37 <saveIdt>:
  101f37:	55                   	push   %ebp
  101f38:	89 e5                	mov    %esp,%ebp
  101f3a:	8b 45 0c             	mov    0xc(%ebp),%eax
  101f3d:	48                   	dec    %eax
  101f3e:	66 a3 5c 42 10 00    	mov    %ax,0x10425c
  101f44:	8b 45 08             	mov    0x8(%ebp),%eax
  101f47:	66 a3 5e 42 10 00    	mov    %ax,0x10425e
  101f4d:	8b 45 08             	mov    0x8(%ebp),%eax
  101f50:	c1 e8 10             	shr    $0x10,%eax
  101f53:	66 a3 60 42 10 00    	mov    %ax,0x104260
  101f59:	b8 5c 42 10 00       	mov    $0x10425c,%eax
  101f5e:	0f 01 18             	lidtl  (%eax)
  101f61:	90                   	nop
  101f62:	5d                   	pop    %ebp
  101f63:	c3                   	ret    

00101f64 <setIntr>:
  101f64:	55                   	push   %ebp
  101f65:	89 e5                	mov    %esp,%ebp
  101f67:	8b 45 10             	mov    0x10(%ebp),%eax
  101f6a:	8b 55 08             	mov    0x8(%ebp),%edx
  101f6d:	66 89 02             	mov    %ax,(%edx)
  101f70:	8b 45 0c             	mov    0xc(%ebp),%eax
  101f73:	c1 e0 03             	shl    $0x3,%eax
  101f76:	8b 55 08             	mov    0x8(%ebp),%edx
  101f79:	66 89 42 02          	mov    %ax,0x2(%edx)
  101f7d:	8b 45 08             	mov    0x8(%ebp),%eax
  101f80:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  101f84:	8b 45 08             	mov    0x8(%ebp),%eax
  101f87:	8a 50 05             	mov    0x5(%eax),%dl
  101f8a:	83 e2 f0             	and    $0xfffffff0,%edx
  101f8d:	83 ca 0e             	or     $0xe,%edx
  101f90:	88 50 05             	mov    %dl,0x5(%eax)
  101f93:	8b 45 08             	mov    0x8(%ebp),%eax
  101f96:	8a 50 05             	mov    0x5(%eax),%dl
  101f99:	83 e2 ef             	and    $0xffffffef,%edx
  101f9c:	88 50 05             	mov    %dl,0x5(%eax)
  101f9f:	8b 45 14             	mov    0x14(%ebp),%eax
  101fa2:	83 e0 03             	and    $0x3,%eax
  101fa5:	88 c2                	mov    %al,%dl
  101fa7:	8b 45 08             	mov    0x8(%ebp),%eax
  101faa:	83 e2 03             	and    $0x3,%edx
  101fad:	88 d1                	mov    %dl,%cl
  101faf:	c1 e1 05             	shl    $0x5,%ecx
  101fb2:	8a 50 05             	mov    0x5(%eax),%dl
  101fb5:	83 e2 9f             	and    $0xffffff9f,%edx
  101fb8:	09 ca                	or     %ecx,%edx
  101fba:	88 50 05             	mov    %dl,0x5(%eax)
  101fbd:	8b 45 08             	mov    0x8(%ebp),%eax
  101fc0:	8a 50 05             	mov    0x5(%eax),%dl
  101fc3:	83 ca 80             	or     $0xffffff80,%edx
  101fc6:	88 50 05             	mov    %dl,0x5(%eax)
  101fc9:	8b 45 10             	mov    0x10(%ebp),%eax
  101fcc:	c1 e8 10             	shr    $0x10,%eax
  101fcf:	8b 55 08             	mov    0x8(%ebp),%edx
  101fd2:	66 89 42 06          	mov    %ax,0x6(%edx)
  101fd6:	90                   	nop
  101fd7:	5d                   	pop    %ebp
  101fd8:	c3                   	ret    

00101fd9 <setTrap>:
  101fd9:	55                   	push   %ebp
  101fda:	89 e5                	mov    %esp,%ebp
  101fdc:	8b 45 10             	mov    0x10(%ebp),%eax
  101fdf:	8b 55 08             	mov    0x8(%ebp),%edx
  101fe2:	66 89 02             	mov    %ax,(%edx)
  101fe5:	8b 45 0c             	mov    0xc(%ebp),%eax
  101fe8:	c1 e0 03             	shl    $0x3,%eax
  101feb:	8b 55 08             	mov    0x8(%ebp),%edx
  101fee:	66 89 42 02          	mov    %ax,0x2(%edx)
  101ff2:	8b 45 08             	mov    0x8(%ebp),%eax
  101ff5:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  101ff9:	8b 45 08             	mov    0x8(%ebp),%eax
  101ffc:	8a 50 05             	mov    0x5(%eax),%dl
  101fff:	83 ca 0f             	or     $0xf,%edx
  102002:	88 50 05             	mov    %dl,0x5(%eax)
  102005:	8b 45 08             	mov    0x8(%ebp),%eax
  102008:	8a 50 05             	mov    0x5(%eax),%dl
  10200b:	83 e2 ef             	and    $0xffffffef,%edx
  10200e:	88 50 05             	mov    %dl,0x5(%eax)
  102011:	8b 45 14             	mov    0x14(%ebp),%eax
  102014:	83 e0 03             	and    $0x3,%eax
  102017:	88 c2                	mov    %al,%dl
  102019:	8b 45 08             	mov    0x8(%ebp),%eax
  10201c:	83 e2 03             	and    $0x3,%edx
  10201f:	88 d1                	mov    %dl,%cl
  102021:	c1 e1 05             	shl    $0x5,%ecx
  102024:	8a 50 05             	mov    0x5(%eax),%dl
  102027:	83 e2 9f             	and    $0xffffff9f,%edx
  10202a:	09 ca                	or     %ecx,%edx
  10202c:	88 50 05             	mov    %dl,0x5(%eax)
  10202f:	8b 45 08             	mov    0x8(%ebp),%eax
  102032:	8a 50 05             	mov    0x5(%eax),%dl
  102035:	83 ca 80             	or     $0xffffff80,%edx
  102038:	88 50 05             	mov    %dl,0x5(%eax)
  10203b:	8b 45 10             	mov    0x10(%ebp),%eax
  10203e:	c1 e8 10             	shr    $0x10,%eax
  102041:	8b 55 08             	mov    0x8(%ebp),%edx
  102044:	66 89 42 06          	mov    %ax,0x6(%edx)
  102048:	90                   	nop
  102049:	5d                   	pop    %ebp
  10204a:	c3                   	ret    

0010204b <initIdt>:
  10204b:	55                   	push   %ebp
  10204c:	89 e5                	mov    %esp,%ebp
  10204e:	83 ec 10             	sub    $0x10,%esp
  102051:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  102058:	eb 21                	jmp    10207b <initIdt+0x30>
  10205a:	ba f4 2d 10 00       	mov    $0x102df4,%edx
  10205f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102062:	c1 e0 03             	shl    $0x3,%eax
  102065:	05 e0 d3 13 01       	add    $0x113d3e0,%eax
  10206a:	6a 00                	push   $0x0
  10206c:	52                   	push   %edx
  10206d:	6a 01                	push   $0x1
  10206f:	50                   	push   %eax
  102070:	e8 64 ff ff ff       	call   101fd9 <setTrap>
  102075:	83 c4 10             	add    $0x10,%esp
  102078:	ff 45 fc             	incl   -0x4(%ebp)
  10207b:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  102082:	7e d6                	jle    10205a <initIdt+0xf>
  102084:	ba fa 2d 10 00       	mov    $0x102dfa,%edx
  102089:	b8 48 d4 13 01       	mov    $0x113d448,%eax
  10208e:	6a 00                	push   $0x0
  102090:	52                   	push   %edx
  102091:	6a 01                	push   $0x1
  102093:	50                   	push   %eax
  102094:	e8 40 ff ff ff       	call   101fd9 <setTrap>
  102099:	83 c4 10             	add    $0x10,%esp
  10209c:	ba fe 2d 10 00       	mov    $0x102dfe,%edx
  1020a1:	b8 e0 d7 13 01       	mov    $0x113d7e0,%eax
  1020a6:	6a 03                	push   $0x3
  1020a8:	52                   	push   %edx
  1020a9:	6a 01                	push   $0x1
  1020ab:	50                   	push   %eax
  1020ac:	e8 b3 fe ff ff       	call   101f64 <setIntr>
  1020b1:	83 c4 10             	add    $0x10,%esp
  1020b4:	ba 07 2e 10 00       	mov    $0x102e07,%edx
  1020b9:	b8 e0 d4 13 01       	mov    $0x113d4e0,%eax
  1020be:	6a 00                	push   $0x0
  1020c0:	52                   	push   %edx
  1020c1:	6a 01                	push   $0x1
  1020c3:	50                   	push   %eax
  1020c4:	e8 9b fe ff ff       	call   101f64 <setIntr>
  1020c9:	83 c4 10             	add    $0x10,%esp
  1020cc:	68 00 08 00 00       	push   $0x800
  1020d1:	68 e0 d3 13 01       	push   $0x113d3e0
  1020d6:	e8 5c fe ff ff       	call   101f37 <saveIdt>
  1020db:	83 c4 08             	add    $0x8,%esp
  1020de:	90                   	nop
  1020df:	c9                   	leave  
  1020e0:	c3                   	ret    

001020e1 <enableInterrupt>:
  1020e1:	55                   	push   %ebp
  1020e2:	89 e5                	mov    %esp,%ebp
  1020e4:	fb                   	sti    
  1020e5:	90                   	nop
  1020e6:	5d                   	pop    %ebp
  1020e7:	c3                   	ret    

001020e8 <disableInterrupt>:
  1020e8:	55                   	push   %ebp
  1020e9:	89 e5                	mov    %esp,%ebp
  1020eb:	fa                   	cli    
  1020ec:	90                   	nop
  1020ed:	5d                   	pop    %ebp
  1020ee:	c3                   	ret    

001020ef <irqHandle>:
  1020ef:	55                   	push   %ebp
  1020f0:	89 e5                	mov    %esp,%ebp
  1020f2:	57                   	push   %edi
  1020f3:	56                   	push   %esi
  1020f4:	53                   	push   %ebx
  1020f5:	83 ec 1c             	sub    $0x1c,%esp
  1020f8:	b8 10 00 00 00       	mov    $0x10,%eax
  1020fd:	89 c0                	mov    %eax,%eax
  1020ff:	8e d8                	mov    %eax,%ds
  102101:	8e e0                	mov    %eax,%fs
  102103:	8e c0                	mov    %eax,%es
  102105:	b8 30 00 00 00       	mov    $0x30,%eax
  10210a:	89 c0                	mov    %eax,%eax
  10210c:	8e e8                	mov    %eax,%gs
  10210e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  102115:	89 e8                	mov    %ebp,%eax
  102117:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10211a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10211d:	83 c0 08             	add    $0x8,%eax
  102120:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102123:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102126:	8b 10                	mov    (%eax),%edx
  102128:	8b 45 08             	mov    0x8(%ebp),%eax
  10212b:	39 c2                	cmp    %eax,%edx
  10212d:	74 12                	je     102141 <irqHandle+0x52>
  10212f:	83 ec 08             	sub    $0x8,%esp
  102132:	6a 1e                	push   $0x1e
  102134:	68 3c 2f 10 00       	push   $0x102f3c
  102139:	e8 93 0c 00 00       	call   102dd1 <abort>
  10213e:	83 c4 10             	add    $0x10,%esp
  102141:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  102146:	89 45 dc             	mov    %eax,-0x24(%ebp)
  102149:	e8 9a ff ff ff       	call   1020e8 <disableInterrupt>
  10214e:	8b 45 08             	mov    0x8(%ebp),%eax
  102151:	8b 40 30             	mov    0x30(%eax),%eax
  102154:	83 f8 0d             	cmp    $0xd,%eax
  102157:	74 1e                	je     102177 <irqHandle+0x88>
  102159:	83 f8 0d             	cmp    $0xd,%eax
  10215c:	7f 0b                	jg     102169 <irqHandle+0x7a>
  10215e:	83 f8 ff             	cmp    $0xffffffff,%eax
  102161:	0f 84 9e 00 00 00    	je     102205 <irqHandle+0x116>
  102167:	eb 3e                	jmp    1021a7 <irqHandle+0xb8>
  102169:	83 f8 20             	cmp    $0x20,%eax
  10216c:	74 29                	je     102197 <irqHandle+0xa8>
  10216e:	3d 80 00 00 00       	cmp    $0x80,%eax
  102173:	74 12                	je     102187 <irqHandle+0x98>
  102175:	eb 30                	jmp    1021a7 <irqHandle+0xb8>
  102177:	83 ec 0c             	sub    $0xc,%esp
  10217a:	ff 75 08             	pushl  0x8(%ebp)
  10217d:	e8 b0 02 00 00       	call   102432 <GProtectFaultHandle>
  102182:	83 c4 10             	add    $0x10,%esp
  102185:	eb 7f                	jmp    102206 <irqHandle+0x117>
  102187:	83 ec 0c             	sub    $0xc,%esp
  10218a:	ff 75 08             	pushl  0x8(%ebp)
  10218d:	e8 3b 01 00 00       	call   1022cd <syscallHandle>
  102192:	83 c4 10             	add    $0x10,%esp
  102195:	eb 6f                	jmp    102206 <irqHandle+0x117>
  102197:	83 ec 0c             	sub    $0xc,%esp
  10219a:	ff 75 08             	pushl  0x8(%ebp)
  10219d:	e8 ee 02 00 00       	call   102490 <timeHandle>
  1021a2:	83 c4 10             	add    $0x10,%esp
  1021a5:	eb 5f                	jmp    102206 <irqHandle+0x117>
  1021a7:	83 ec 0c             	sub    $0xc,%esp
  1021aa:	68 4f 2f 10 00       	push   $0x102f4f
  1021af:	e8 61 09 00 00       	call   102b15 <printk>
  1021b4:	83 c4 10             	add    $0x10,%esp
  1021b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1021ba:	8b 50 38             	mov    0x38(%eax),%edx
  1021bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1021c0:	8b 40 30             	mov    0x30(%eax),%eax
  1021c3:	83 ec 08             	sub    $0x8,%esp
  1021c6:	52                   	push   %edx
  1021c7:	50                   	push   %eax
  1021c8:	68 a0 2f 10 00       	push   $0x102fa0
  1021cd:	6a 35                	push   $0x35
  1021cf:	68 3c 2f 10 00       	push   $0x102f3c
  1021d4:	68 58 2f 10 00       	push   $0x102f58
  1021d9:	e8 37 09 00 00       	call   102b15 <printk>
  1021de:	83 c4 20             	add    $0x20,%esp
  1021e1:	83 ec 0c             	sub    $0xc,%esp
  1021e4:	68 7d 2f 10 00       	push   $0x102f7d
  1021e9:	e8 27 09 00 00       	call   102b15 <printk>
  1021ee:	83 c4 10             	add    $0x10,%esp
  1021f1:	83 ec 08             	sub    $0x8,%esp
  1021f4:	6a 36                	push   $0x36
  1021f6:	68 3c 2f 10 00       	push   $0x102f3c
  1021fb:	e8 d1 0b 00 00       	call   102dd1 <abort>
  102200:	83 c4 10             	add    $0x10,%esp
  102203:	eb 01                	jmp    102206 <irqHandle+0x117>
  102205:	90                   	nop
  102206:	8b 45 08             	mov    0x8(%ebp),%eax
  102209:	8b 40 30             	mov    0x30(%eax),%eax
  10220c:	3d 80 00 00 00       	cmp    $0x80,%eax
  102211:	74 0f                	je     102222 <irqHandle+0x133>
  102213:	8b 45 08             	mov    0x8(%ebp),%eax
  102216:	8b 40 30             	mov    0x30(%eax),%eax
  102219:	83 f8 20             	cmp    $0x20,%eax
  10221c:	0f 85 9d 00 00 00    	jne    1022bf <irqHandle+0x1d0>
  102222:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  102227:	3b 45 dc             	cmp    -0x24(%ebp),%eax
  10222a:	0f 84 8f 00 00 00    	je     1022bf <irqHandle+0x1d0>
  102230:	8b 15 e0 4a 10 00    	mov    0x104ae0,%edx
  102236:	89 d0                	mov    %edx,%eax
  102238:	c1 e0 07             	shl    $0x7,%eax
  10223b:	01 d0                	add    %edx,%eax
  10223d:	01 c0                	add    %eax,%eax
  10223f:	01 d0                	add    %edx,%eax
  102241:	01 c0                	add    %eax,%eax
  102243:	01 d0                	add    %edx,%eax
  102245:	c1 e0 04             	shl    $0x4,%eax
  102248:	05 00 4b 10 00       	add    $0x104b00,%eax
  10224d:	05 fc 1f 00 00       	add    $0x1ffc,%eax
  102252:	8d 50 b4             	lea    -0x4c(%eax),%edx
  102255:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102258:	89 10                	mov    %edx,(%eax)
  10225a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10225d:	8b 00                	mov    (%eax),%eax
  10225f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  102262:	8b 15 e0 4a 10 00    	mov    0x104ae0,%edx
  102268:	8b 4d d8             	mov    -0x28(%ebp),%ecx
  10226b:	89 d0                	mov    %edx,%eax
  10226d:	c1 e0 07             	shl    $0x7,%eax
  102270:	01 d0                	add    %edx,%eax
  102272:	01 c0                	add    %eax,%eax
  102274:	01 d0                	add    %edx,%eax
  102276:	01 c0                	add    %eax,%eax
  102278:	01 d0                	add    %edx,%eax
  10227a:	c1 e0 04             	shl    $0x4,%eax
  10227d:	05 00 6b 10 00       	add    $0x106b00,%eax
  102282:	89 ca                	mov    %ecx,%edx
  102284:	89 c3                	mov    %eax,%ebx
  102286:	b8 13 00 00 00       	mov    $0x13,%eax
  10228b:	89 d7                	mov    %edx,%edi
  10228d:	89 de                	mov    %ebx,%esi
  10228f:	89 c1                	mov    %eax,%ecx
  102291:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102293:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  102298:	c1 e0 10             	shl    $0x10,%eax
  10229b:	83 ec 08             	sub    $0x8,%esp
  10229e:	50                   	push   %eax
  10229f:	6a 23                	push   $0x23
  1022a1:	e8 3b de ff ff       	call   1000e1 <change_gdt>
  1022a6:	83 c4 10             	add    $0x10,%esp
  1022a9:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  1022ae:	c1 e0 10             	shl    $0x10,%eax
  1022b1:	83 ec 08             	sub    $0x8,%esp
  1022b4:	50                   	push   %eax
  1022b5:	6a 1b                	push   $0x1b
  1022b7:	e8 25 de ff ff       	call   1000e1 <change_gdt>
  1022bc:	83 c4 10             	add    $0x10,%esp
  1022bf:	e8 1d fe ff ff       	call   1020e1 <enableInterrupt>
  1022c4:	90                   	nop
  1022c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1022c8:	5b                   	pop    %ebx
  1022c9:	5e                   	pop    %esi
  1022ca:	5f                   	pop    %edi
  1022cb:	5d                   	pop    %ebp
  1022cc:	c3                   	ret    

001022cd <syscallHandle>:
  1022cd:	55                   	push   %ebp
  1022ce:	89 e5                	mov    %esp,%ebp
  1022d0:	83 ec 08             	sub    $0x8,%esp
  1022d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1022d6:	8b 40 2c             	mov    0x2c(%eax),%eax
  1022d9:	83 f8 07             	cmp    $0x7,%eax
  1022dc:	0f 84 be 00 00 00    	je     1023a0 <syscallHandle+0xd3>
  1022e2:	83 f8 07             	cmp    $0x7,%eax
  1022e5:	77 2b                	ja     102312 <syscallHandle+0x45>
  1022e7:	83 f8 02             	cmp    $0x2,%eax
  1022ea:	0f 84 95 00 00 00    	je     102385 <syscallHandle+0xb8>
  1022f0:	83 f8 02             	cmp    $0x2,%eax
  1022f3:	77 0a                	ja     1022ff <syscallHandle+0x32>
  1022f5:	83 f8 01             	cmp    $0x1,%eax
  1022f8:	74 78                	je     102372 <syscallHandle+0xa5>
  1022fa:	e9 31 01 00 00       	jmp    102430 <syscallHandle+0x163>
  1022ff:	83 f8 03             	cmp    $0x3,%eax
  102302:	0f 84 10 01 00 00    	je     102418 <syscallHandle+0x14b>
  102308:	83 f8 04             	cmp    $0x4,%eax
  10230b:	74 3f                	je     10234c <syscallHandle+0x7f>
  10230d:	e9 1e 01 00 00       	jmp    102430 <syscallHandle+0x163>
  102312:	83 f8 17             	cmp    $0x17,%eax
  102315:	0f 84 b5 00 00 00    	je     1023d0 <syscallHandle+0x103>
  10231b:	83 f8 17             	cmp    $0x17,%eax
  10231e:	77 17                	ja     102337 <syscallHandle+0x6a>
  102320:	83 f8 15             	cmp    $0x15,%eax
  102323:	0f 84 8f 00 00 00    	je     1023b8 <syscallHandle+0xeb>
  102329:	83 f8 16             	cmp    $0x16,%eax
  10232c:	0f 84 b6 00 00 00    	je     1023e8 <syscallHandle+0x11b>
  102332:	e9 f9 00 00 00       	jmp    102430 <syscallHandle+0x163>
  102337:	83 f8 18             	cmp    $0x18,%eax
  10233a:	0f 84 c0 00 00 00    	je     102400 <syscallHandle+0x133>
  102340:	3d e6 00 00 00       	cmp    $0xe6,%eax
  102345:	74 18                	je     10235f <syscallHandle+0x92>
  102347:	e9 e4 00 00 00       	jmp    102430 <syscallHandle+0x163>
  10234c:	83 ec 0c             	sub    $0xc,%esp
  10234f:	ff 75 08             	pushl  0x8(%ebp)
  102352:	e8 2d ee ff ff       	call   101184 <sys_write>
  102357:	83 c4 10             	add    $0x10,%esp
  10235a:	e9 d0 00 00 00       	jmp    10242f <syscallHandle+0x162>
  10235f:	83 ec 0c             	sub    $0xc,%esp
  102362:	ff 75 08             	pushl  0x8(%ebp)
  102365:	e8 3f e9 ff ff       	call   100ca9 <sys_sleep>
  10236a:	83 c4 10             	add    $0x10,%esp
  10236d:	e9 bd 00 00 00       	jmp    10242f <syscallHandle+0x162>
  102372:	83 ec 0c             	sub    $0xc,%esp
  102375:	ff 75 08             	pushl  0x8(%ebp)
  102378:	e8 e8 e8 ff ff       	call   100c65 <sys_exit>
  10237d:	83 c4 10             	add    $0x10,%esp
  102380:	e9 aa 00 00 00       	jmp    10242f <syscallHandle+0x162>
  102385:	83 ec 0c             	sub    $0xc,%esp
  102388:	ff 75 08             	pushl  0x8(%ebp)
  10238b:	e8 53 e9 ff ff       	call   100ce3 <sys_fork>
  102390:	83 c4 10             	add    $0x10,%esp
  102393:	89 c2                	mov    %eax,%edx
  102395:	8b 45 08             	mov    0x8(%ebp),%eax
  102398:	89 50 2c             	mov    %edx,0x2c(%eax)
  10239b:	e9 8f 00 00 00       	jmp    10242f <syscallHandle+0x162>
  1023a0:	83 ec 0c             	sub    $0xc,%esp
  1023a3:	ff 75 08             	pushl  0x8(%ebp)
  1023a6:	e8 f1 e8 ff ff       	call   100c9c <sys_getpid>
  1023ab:	83 c4 10             	add    $0x10,%esp
  1023ae:	89 c2                	mov    %eax,%edx
  1023b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1023b3:	89 50 2c             	mov    %edx,0x2c(%eax)
  1023b6:	eb 77                	jmp    10242f <syscallHandle+0x162>
  1023b8:	83 ec 0c             	sub    $0xc,%esp
  1023bb:	ff 75 08             	pushl  0x8(%ebp)
  1023be:	e8 f8 02 00 00       	call   1026bb <sys_sem_init>
  1023c3:	83 c4 10             	add    $0x10,%esp
  1023c6:	89 c2                	mov    %eax,%edx
  1023c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1023cb:	89 50 2c             	mov    %edx,0x2c(%eax)
  1023ce:	eb 5f                	jmp    10242f <syscallHandle+0x162>
  1023d0:	83 ec 0c             	sub    $0xc,%esp
  1023d3:	ff 75 08             	pushl  0x8(%ebp)
  1023d6:	e8 4c 03 00 00       	call   102727 <sys_sem_post>
  1023db:	83 c4 10             	add    $0x10,%esp
  1023de:	89 c2                	mov    %eax,%edx
  1023e0:	8b 45 08             	mov    0x8(%ebp),%eax
  1023e3:	89 50 2c             	mov    %edx,0x2c(%eax)
  1023e6:	eb 47                	jmp    10242f <syscallHandle+0x162>
  1023e8:	83 ec 0c             	sub    $0xc,%esp
  1023eb:	ff 75 08             	pushl  0x8(%ebp)
  1023ee:	e8 71 03 00 00       	call   102764 <sys_sem_wait>
  1023f3:	83 c4 10             	add    $0x10,%esp
  1023f6:	89 c2                	mov    %eax,%edx
  1023f8:	8b 45 08             	mov    0x8(%ebp),%eax
  1023fb:	89 50 2c             	mov    %edx,0x2c(%eax)
  1023fe:	eb 2f                	jmp    10242f <syscallHandle+0x162>
  102400:	83 ec 0c             	sub    $0xc,%esp
  102403:	ff 75 08             	pushl  0x8(%ebp)
  102406:	e8 96 03 00 00       	call   1027a1 <sys_sem_destroy>
  10240b:	83 c4 10             	add    $0x10,%esp
  10240e:	89 c2                	mov    %eax,%edx
  102410:	8b 45 08             	mov    0x8(%ebp),%eax
  102413:	89 50 2c             	mov    %edx,0x2c(%eax)
  102416:	eb 17                	jmp    10242f <syscallHandle+0x162>
  102418:	83 ec 0c             	sub    $0xc,%esp
  10241b:	ff 75 08             	pushl  0x8(%ebp)
  10241e:	e8 42 ee ff ff       	call   101265 <sys_read>
  102423:	83 c4 10             	add    $0x10,%esp
  102426:	89 c2                	mov    %eax,%edx
  102428:	8b 45 08             	mov    0x8(%ebp),%eax
  10242b:	89 50 2c             	mov    %edx,0x2c(%eax)
  10242e:	90                   	nop
  10242f:	90                   	nop
  102430:	c9                   	leave  
  102431:	c3                   	ret    

00102432 <GProtectFaultHandle>:
  102432:	55                   	push   %ebp
  102433:	89 e5                	mov    %esp,%ebp
  102435:	83 ec 08             	sub    $0x8,%esp
  102438:	83 ec 0c             	sub    $0xc,%esp
  10243b:	68 4f 2f 10 00       	push   $0x102f4f
  102440:	e8 d0 06 00 00       	call   102b15 <printk>
  102445:	83 c4 10             	add    $0x10,%esp
  102448:	8b 45 08             	mov    0x8(%ebp),%eax
  10244b:	8b 40 30             	mov    0x30(%eax),%eax
  10244e:	83 ec 0c             	sub    $0xc,%esp
  102451:	50                   	push   %eax
  102452:	68 ac 2f 10 00       	push   $0x102fac
  102457:	6a 77                	push   $0x77
  102459:	68 3c 2f 10 00       	push   $0x102f3c
  10245e:	68 83 2f 10 00       	push   $0x102f83
  102463:	e8 ad 06 00 00       	call   102b15 <printk>
  102468:	83 c4 20             	add    $0x20,%esp
  10246b:	83 ec 0c             	sub    $0xc,%esp
  10246e:	68 7d 2f 10 00       	push   $0x102f7d
  102473:	e8 9d 06 00 00       	call   102b15 <printk>
  102478:	83 c4 10             	add    $0x10,%esp
  10247b:	83 ec 08             	sub    $0x8,%esp
  10247e:	6a 78                	push   $0x78
  102480:	68 3c 2f 10 00       	push   $0x102f3c
  102485:	e8 47 09 00 00       	call   102dd1 <abort>
  10248a:	83 c4 10             	add    $0x10,%esp
  10248d:	90                   	nop
  10248e:	c9                   	leave  
  10248f:	c3                   	ret    

00102490 <timeHandle>:
  102490:	55                   	push   %ebp
  102491:	89 e5                	mov    %esp,%ebp
  102493:	83 ec 18             	sub    $0x18,%esp
  102496:	8b 15 e0 4a 10 00    	mov    0x104ae0,%edx
  10249c:	8b 0d e0 4a 10 00    	mov    0x104ae0,%ecx
  1024a2:	89 c8                	mov    %ecx,%eax
  1024a4:	c1 e0 07             	shl    $0x7,%eax
  1024a7:	01 c8                	add    %ecx,%eax
  1024a9:	01 c0                	add    %eax,%eax
  1024ab:	01 c8                	add    %ecx,%eax
  1024ad:	01 c0                	add    %eax,%eax
  1024af:	01 c8                	add    %ecx,%eax
  1024b1:	c1 e0 04             	shl    $0x4,%eax
  1024b4:	05 50 6b 10 00       	add    $0x106b50,%eax
  1024b9:	8b 00                	mov    (%eax),%eax
  1024bb:	8d 48 ff             	lea    -0x1(%eax),%ecx
  1024be:	89 d0                	mov    %edx,%eax
  1024c0:	c1 e0 07             	shl    $0x7,%eax
  1024c3:	01 d0                	add    %edx,%eax
  1024c5:	01 c0                	add    %eax,%eax
  1024c7:	01 d0                	add    %edx,%eax
  1024c9:	01 c0                	add    %eax,%eax
  1024cb:	01 d0                	add    %edx,%eax
  1024cd:	c1 e0 04             	shl    $0x4,%eax
  1024d0:	05 50 6b 10 00       	add    $0x106b50,%eax
  1024d5:	89 08                	mov    %ecx,(%eax)
  1024d7:	e8 db f7 ff ff       	call   101cb7 <block_decrease>
  1024dc:	e8 53 f2 ff ff       	call   101734 <check_block>
  1024e1:	8b 15 e0 4a 10 00    	mov    0x104ae0,%edx
  1024e7:	89 d0                	mov    %edx,%eax
  1024e9:	c1 e0 07             	shl    $0x7,%eax
  1024ec:	01 d0                	add    %edx,%eax
  1024ee:	01 c0                	add    %eax,%eax
  1024f0:	01 d0                	add    %edx,%eax
  1024f2:	01 c0                	add    %eax,%eax
  1024f4:	01 d0                	add    %edx,%eax
  1024f6:	c1 e0 04             	shl    $0x4,%eax
  1024f9:	05 50 6b 10 00       	add    $0x106b50,%eax
  1024fe:	8b 00                	mov    (%eax),%eax
  102500:	85 c0                	test   %eax,%eax
  102502:	7f 2d                	jg     102531 <timeHandle+0xa1>
  102504:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  102509:	83 ec 08             	sub    $0x8,%esp
  10250c:	ff 75 08             	pushl  0x8(%ebp)
  10250f:	50                   	push   %eax
  102510:	e8 8f f1 ff ff       	call   1016a4 <put_into_runnable>
  102515:	83 c4 10             	add    $0x10,%esp
  102518:	e8 67 f1 ff ff       	call   101684 <get_from_runnable>
  10251d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102520:	83 ec 08             	sub    $0x8,%esp
  102523:	ff 75 08             	pushl  0x8(%ebp)
  102526:	ff 75 f4             	pushl  -0xc(%ebp)
  102529:	e8 a3 f0 ff ff       	call   1015d1 <put_into_running>
  10252e:	83 c4 10             	add    $0x10,%esp
  102531:	e8 30 f1 ff ff       	call   101666 <getpid>
  102536:	85 c0                	test   %eax,%eax
  102538:	75 12                	jne    10254c <timeHandle+0xbc>
  10253a:	83 ec 0c             	sub    $0xc,%esp
  10253d:	68 99 2f 10 00       	push   $0x102f99
  102542:	e8 ce 05 00 00       	call   102b15 <printk>
  102547:	83 c4 10             	add    $0x10,%esp
  10254a:	eb 16                	jmp    102562 <timeHandle+0xd2>
  10254c:	e8 15 f1 ff ff       	call   101666 <getpid>
  102551:	83 ec 08             	sub    $0x8,%esp
  102554:	50                   	push   %eax
  102555:	68 9b 2f 10 00       	push   $0x102f9b
  10255a:	e8 b6 05 00 00       	call   102b15 <printk>
  10255f:	83 c4 10             	add    $0x10,%esp
  102562:	90                   	nop
  102563:	c9                   	leave  
  102564:	c3                   	ret    

00102565 <W>:
  102565:	55                   	push   %ebp
  102566:	89 e5                	mov    %esp,%ebp
  102568:	83 ec 18             	sub    $0x18,%esp
  10256b:	e8 f6 f0 ff ff       	call   101666 <getpid>
  102570:	89 c2                	mov    %eax,%edx
  102572:	8b 45 08             	mov    0x8(%ebp),%eax
  102575:	8b 48 04             	mov    0x4(%eax),%ecx
  102578:	89 d0                	mov    %edx,%eax
  10257a:	c1 e0 07             	shl    $0x7,%eax
  10257d:	01 d0                	add    %edx,%eax
  10257f:	01 c0                	add    %eax,%eax
  102581:	01 d0                	add    %edx,%eax
  102583:	01 c0                	add    %eax,%eax
  102585:	01 d0                	add    %edx,%eax
  102587:	c1 e0 04             	shl    $0x4,%eax
  10258a:	05 68 6b 10 00       	add    $0x106b68,%eax
  10258f:	89 08                	mov    %ecx,(%eax)
  102591:	e8 d0 f0 ff ff       	call   101666 <getpid>
  102596:	89 c2                	mov    %eax,%edx
  102598:	89 d0                	mov    %edx,%eax
  10259a:	c1 e0 07             	shl    $0x7,%eax
  10259d:	01 d0                	add    %edx,%eax
  10259f:	01 c0                	add    %eax,%eax
  1025a1:	01 d0                	add    %edx,%eax
  1025a3:	01 c0                	add    %eax,%eax
  1025a5:	01 d0                	add    %edx,%eax
  1025a7:	c1 e0 04             	shl    $0x4,%eax
  1025aa:	8d 90 00 4b 10 00    	lea    0x104b00(%eax),%edx
  1025b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1025b3:	89 50 04             	mov    %edx,0x4(%eax)
  1025b6:	e8 c9 f0 ff ff       	call   101684 <get_from_runnable>
  1025bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1025be:	e8 a3 f0 ff ff       	call   101666 <getpid>
  1025c3:	83 f8 02             	cmp    $0x2,%eax
  1025c6:	74 12                	je     1025da <W+0x75>
  1025c8:	83 ec 08             	sub    $0x8,%esp
  1025cb:	6a 0e                	push   $0xe
  1025cd:	68 c0 2f 10 00       	push   $0x102fc0
  1025d2:	e8 fa 07 00 00       	call   102dd1 <abort>
  1025d7:	83 c4 10             	add    $0x10,%esp
  1025da:	83 ec 08             	sub    $0x8,%esp
  1025dd:	6a 00                	push   $0x0
  1025df:	ff 75 f4             	pushl  -0xc(%ebp)
  1025e2:	e8 ea ef ff ff       	call   1015d1 <put_into_running>
  1025e7:	83 c4 10             	add    $0x10,%esp
  1025ea:	90                   	nop
  1025eb:	c9                   	leave  
  1025ec:	c3                   	ret    

001025ed <R>:
  1025ed:	55                   	push   %ebp
  1025ee:	89 e5                	mov    %esp,%ebp
  1025f0:	83 ec 18             	sub    $0x18,%esp
  1025f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1025f6:	8b 40 04             	mov    0x4(%eax),%eax
  1025f9:	8b 80 58 20 00 00    	mov    0x2058(%eax),%eax
  1025ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102602:	8b 45 08             	mov    0x8(%ebp),%eax
  102605:	8b 40 04             	mov    0x4(%eax),%eax
  102608:	8b 90 68 20 00 00    	mov    0x2068(%eax),%edx
  10260e:	8b 45 08             	mov    0x8(%ebp),%eax
  102611:	89 50 04             	mov    %edx,0x4(%eax)
  102614:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102617:	89 d0                	mov    %edx,%eax
  102619:	c1 e0 07             	shl    $0x7,%eax
  10261c:	01 d0                	add    %edx,%eax
  10261e:	01 c0                	add    %eax,%eax
  102620:	01 d0                	add    %edx,%eax
  102622:	01 c0                	add    %eax,%eax
  102624:	01 d0                	add    %edx,%eax
  102626:	c1 e0 04             	shl    $0x4,%eax
  102629:	05 00 20 00 00       	add    $0x2000,%eax
  10262e:	05 00 4b 10 00       	add    $0x104b00,%eax
  102633:	83 ec 08             	sub    $0x8,%esp
  102636:	50                   	push   %eax
  102637:	ff 75 f4             	pushl  -0xc(%ebp)
  10263a:	e8 65 f0 ff ff       	call   1016a4 <put_into_runnable>
  10263f:	83 c4 10             	add    $0x10,%esp
  102642:	e8 1f f0 ff ff       	call   101666 <getpid>
  102647:	83 f8 01             	cmp    $0x1,%eax
  10264a:	74 12                	je     10265e <R+0x71>
  10264c:	83 ec 08             	sub    $0x8,%esp
  10264f:	6a 18                	push   $0x18
  102651:	68 c0 2f 10 00       	push   $0x102fc0
  102656:	e8 76 07 00 00       	call   102dd1 <abort>
  10265b:	83 c4 10             	add    $0x10,%esp
  10265e:	90                   	nop
  10265f:	c9                   	leave  
  102660:	c3                   	ret    

00102661 <P>:
  102661:	55                   	push   %ebp
  102662:	89 e5                	mov    %esp,%ebp
  102664:	83 ec 08             	sub    $0x8,%esp
  102667:	8b 45 08             	mov    0x8(%ebp),%eax
  10266a:	8b 00                	mov    (%eax),%eax
  10266c:	8d 50 ff             	lea    -0x1(%eax),%edx
  10266f:	8b 45 08             	mov    0x8(%ebp),%eax
  102672:	89 10                	mov    %edx,(%eax)
  102674:	8b 45 08             	mov    0x8(%ebp),%eax
  102677:	8b 00                	mov    (%eax),%eax
  102679:	85 c0                	test   %eax,%eax
  10267b:	79 0e                	jns    10268b <P+0x2a>
  10267d:	83 ec 0c             	sub    $0xc,%esp
  102680:	ff 75 08             	pushl  0x8(%ebp)
  102683:	e8 dd fe ff ff       	call   102565 <W>
  102688:	83 c4 10             	add    $0x10,%esp
  10268b:	90                   	nop
  10268c:	c9                   	leave  
  10268d:	c3                   	ret    

0010268e <V>:
  10268e:	55                   	push   %ebp
  10268f:	89 e5                	mov    %esp,%ebp
  102691:	83 ec 08             	sub    $0x8,%esp
  102694:	8b 45 08             	mov    0x8(%ebp),%eax
  102697:	8b 00                	mov    (%eax),%eax
  102699:	8d 50 01             	lea    0x1(%eax),%edx
  10269c:	8b 45 08             	mov    0x8(%ebp),%eax
  10269f:	89 10                	mov    %edx,(%eax)
  1026a1:	8b 45 08             	mov    0x8(%ebp),%eax
  1026a4:	8b 00                	mov    (%eax),%eax
  1026a6:	85 c0                	test   %eax,%eax
  1026a8:	7f 0e                	jg     1026b8 <V+0x2a>
  1026aa:	83 ec 0c             	sub    $0xc,%esp
  1026ad:	ff 75 08             	pushl  0x8(%ebp)
  1026b0:	e8 38 ff ff ff       	call   1025ed <R>
  1026b5:	83 c4 10             	add    $0x10,%esp
  1026b8:	90                   	nop
  1026b9:	c9                   	leave  
  1026ba:	c3                   	ret    

001026bb <sys_sem_init>:
  1026bb:	55                   	push   %ebp
  1026bc:	89 e5                	mov    %esp,%ebp
  1026be:	53                   	push   %ebx
  1026bf:	83 ec 14             	sub    $0x14,%esp
  1026c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1026c5:	8b 58 20             	mov    0x20(%eax),%ebx
  1026c8:	e8 99 ef ff ff       	call   101666 <getpid>
  1026cd:	c1 e0 10             	shl    $0x10,%eax
  1026d0:	01 d8                	add    %ebx,%eax
  1026d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1026d5:	a1 64 42 10 00       	mov    0x104264,%eax
  1026da:	25 1f 00 00 80       	and    $0x8000001f,%eax
  1026df:	85 c0                	test   %eax,%eax
  1026e1:	79 05                	jns    1026e8 <sys_sem_init+0x2d>
  1026e3:	48                   	dec    %eax
  1026e4:	83 c8 e0             	or     $0xffffffe0,%eax
  1026e7:	40                   	inc    %eax
  1026e8:	89 c2                	mov    %eax,%edx
  1026ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1026ed:	89 10                	mov    %edx,(%eax)
  1026ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1026f2:	8b 00                	mov    (%eax),%eax
  1026f4:	8b 55 08             	mov    0x8(%ebp),%edx
  1026f7:	8b 52 28             	mov    0x28(%edx),%edx
  1026fa:	89 14 c5 e0 db 13 01 	mov    %edx,0x113dbe0(,%eax,8)
  102701:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102704:	8b 00                	mov    (%eax),%eax
  102706:	c7 04 c5 e4 db 13 01 	movl   $0x0,0x113dbe4(,%eax,8)
  10270d:	00 00 00 00 
  102711:	a1 64 42 10 00       	mov    0x104264,%eax
  102716:	40                   	inc    %eax
  102717:	a3 64 42 10 00       	mov    %eax,0x104264
  10271c:	b8 01 00 00 00       	mov    $0x1,%eax
  102721:	83 c4 14             	add    $0x14,%esp
  102724:	5b                   	pop    %ebx
  102725:	5d                   	pop    %ebp
  102726:	c3                   	ret    

00102727 <sys_sem_post>:
  102727:	55                   	push   %ebp
  102728:	89 e5                	mov    %esp,%ebp
  10272a:	53                   	push   %ebx
  10272b:	83 ec 14             	sub    $0x14,%esp
  10272e:	8b 45 08             	mov    0x8(%ebp),%eax
  102731:	8b 58 20             	mov    0x20(%eax),%ebx
  102734:	e8 2d ef ff ff       	call   101666 <getpid>
  102739:	c1 e0 10             	shl    $0x10,%eax
  10273c:	01 d8                	add    %ebx,%eax
  10273e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102741:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102744:	8b 00                	mov    (%eax),%eax
  102746:	c1 e0 03             	shl    $0x3,%eax
  102749:	05 e0 db 13 01       	add    $0x113dbe0,%eax
  10274e:	83 ec 0c             	sub    $0xc,%esp
  102751:	50                   	push   %eax
  102752:	e8 37 ff ff ff       	call   10268e <V>
  102757:	83 c4 10             	add    $0x10,%esp
  10275a:	b8 01 00 00 00       	mov    $0x1,%eax
  10275f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102762:	c9                   	leave  
  102763:	c3                   	ret    

00102764 <sys_sem_wait>:
  102764:	55                   	push   %ebp
  102765:	89 e5                	mov    %esp,%ebp
  102767:	53                   	push   %ebx
  102768:	83 ec 14             	sub    $0x14,%esp
  10276b:	8b 45 08             	mov    0x8(%ebp),%eax
  10276e:	8b 58 20             	mov    0x20(%eax),%ebx
  102771:	e8 f0 ee ff ff       	call   101666 <getpid>
  102776:	c1 e0 10             	shl    $0x10,%eax
  102779:	01 d8                	add    %ebx,%eax
  10277b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10277e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102781:	8b 00                	mov    (%eax),%eax
  102783:	c1 e0 03             	shl    $0x3,%eax
  102786:	05 e0 db 13 01       	add    $0x113dbe0,%eax
  10278b:	83 ec 0c             	sub    $0xc,%esp
  10278e:	50                   	push   %eax
  10278f:	e8 cd fe ff ff       	call   102661 <P>
  102794:	83 c4 10             	add    $0x10,%esp
  102797:	b8 01 00 00 00       	mov    $0x1,%eax
  10279c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10279f:	c9                   	leave  
  1027a0:	c3                   	ret    

001027a1 <sys_sem_destroy>:
  1027a1:	55                   	push   %ebp
  1027a2:	89 e5                	mov    %esp,%ebp
  1027a4:	b8 01 00 00 00       	mov    $0x1,%eax
  1027a9:	5d                   	pop    %ebp
  1027aa:	c3                   	ret    

001027ab <inByte>:
  1027ab:	55                   	push   %ebp
  1027ac:	89 e5                	mov    %esp,%ebp
  1027ae:	83 ec 14             	sub    $0x14,%esp
  1027b1:	8b 45 08             	mov    0x8(%ebp),%eax
  1027b4:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  1027b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1027bb:	89 c2                	mov    %eax,%edx
  1027bd:	ec                   	in     (%dx),%al
  1027be:	88 45 ff             	mov    %al,-0x1(%ebp)
  1027c1:	8a 45 ff             	mov    -0x1(%ebp),%al
  1027c4:	c9                   	leave  
  1027c5:	c3                   	ret    

001027c6 <outByte>:
  1027c6:	55                   	push   %ebp
  1027c7:	89 e5                	mov    %esp,%ebp
  1027c9:	83 ec 08             	sub    $0x8,%esp
  1027cc:	8b 45 08             	mov    0x8(%ebp),%eax
  1027cf:	8b 55 0c             	mov    0xc(%ebp),%edx
  1027d2:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  1027d6:	88 55 f8             	mov    %dl,-0x8(%ebp)
  1027d9:	8a 45 f8             	mov    -0x8(%ebp),%al
  1027dc:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1027df:	ee                   	out    %al,(%dx)
  1027e0:	90                   	nop
  1027e1:	c9                   	leave  
  1027e2:	c3                   	ret    

001027e3 <initIntr>:
  1027e3:	55                   	push   %ebp
  1027e4:	89 e5                	mov    %esp,%ebp
  1027e6:	6a ff                	push   $0xffffffff
  1027e8:	6a 21                	push   $0x21
  1027ea:	e8 d7 ff ff ff       	call   1027c6 <outByte>
  1027ef:	83 c4 08             	add    $0x8,%esp
  1027f2:	6a ff                	push   $0xffffffff
  1027f4:	68 a1 00 00 00       	push   $0xa1
  1027f9:	e8 c8 ff ff ff       	call   1027c6 <outByte>
  1027fe:	83 c4 08             	add    $0x8,%esp
  102801:	6a 11                	push   $0x11
  102803:	6a 20                	push   $0x20
  102805:	e8 bc ff ff ff       	call   1027c6 <outByte>
  10280a:	83 c4 08             	add    $0x8,%esp
  10280d:	6a 20                	push   $0x20
  10280f:	6a 21                	push   $0x21
  102811:	e8 b0 ff ff ff       	call   1027c6 <outByte>
  102816:	83 c4 08             	add    $0x8,%esp
  102819:	6a 04                	push   $0x4
  10281b:	6a 21                	push   $0x21
  10281d:	e8 a4 ff ff ff       	call   1027c6 <outByte>
  102822:	83 c4 08             	add    $0x8,%esp
  102825:	6a 03                	push   $0x3
  102827:	6a 21                	push   $0x21
  102829:	e8 98 ff ff ff       	call   1027c6 <outByte>
  10282e:	83 c4 08             	add    $0x8,%esp
  102831:	6a 11                	push   $0x11
  102833:	68 a0 00 00 00       	push   $0xa0
  102838:	e8 89 ff ff ff       	call   1027c6 <outByte>
  10283d:	83 c4 08             	add    $0x8,%esp
  102840:	6a 28                	push   $0x28
  102842:	68 a1 00 00 00       	push   $0xa1
  102847:	e8 7a ff ff ff       	call   1027c6 <outByte>
  10284c:	83 c4 08             	add    $0x8,%esp
  10284f:	6a 02                	push   $0x2
  102851:	68 a1 00 00 00       	push   $0xa1
  102856:	e8 6b ff ff ff       	call   1027c6 <outByte>
  10285b:	83 c4 08             	add    $0x8,%esp
  10285e:	6a 03                	push   $0x3
  102860:	68 a1 00 00 00       	push   $0xa1
  102865:	e8 5c ff ff ff       	call   1027c6 <outByte>
  10286a:	83 c4 08             	add    $0x8,%esp
  10286d:	6a 68                	push   $0x68
  10286f:	6a 20                	push   $0x20
  102871:	e8 50 ff ff ff       	call   1027c6 <outByte>
  102876:	83 c4 08             	add    $0x8,%esp
  102879:	6a 0a                	push   $0xa
  10287b:	6a 20                	push   $0x20
  10287d:	e8 44 ff ff ff       	call   1027c6 <outByte>
  102882:	83 c4 08             	add    $0x8,%esp
  102885:	6a 68                	push   $0x68
  102887:	68 a0 00 00 00       	push   $0xa0
  10288c:	e8 35 ff ff ff       	call   1027c6 <outByte>
  102891:	83 c4 08             	add    $0x8,%esp
  102894:	6a 0a                	push   $0xa
  102896:	68 a0 00 00 00       	push   $0xa0
  10289b:	e8 26 ff ff ff       	call   1027c6 <outByte>
  1028a0:	83 c4 08             	add    $0x8,%esp
  1028a3:	90                   	nop
  1028a4:	c9                   	leave  
  1028a5:	c3                   	ret    

001028a6 <initTimer>:
  1028a6:	55                   	push   %ebp
  1028a7:	89 e5                	mov    %esp,%ebp
  1028a9:	83 ec 10             	sub    $0x10,%esp
  1028ac:	c7 45 fc 9b 2e 00 00 	movl   $0x2e9b,-0x4(%ebp)
  1028b3:	6a 34                	push   $0x34
  1028b5:	6a 43                	push   $0x43
  1028b7:	e8 0a ff ff ff       	call   1027c6 <outByte>
  1028bc:	83 c4 08             	add    $0x8,%esp
  1028bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1028c2:	25 ff 00 00 80       	and    $0x800000ff,%eax
  1028c7:	85 c0                	test   %eax,%eax
  1028c9:	79 07                	jns    1028d2 <initTimer+0x2c>
  1028cb:	48                   	dec    %eax
  1028cc:	0d 00 ff ff ff       	or     $0xffffff00,%eax
  1028d1:	40                   	inc    %eax
  1028d2:	0f be c0             	movsbl %al,%eax
  1028d5:	50                   	push   %eax
  1028d6:	6a 40                	push   $0x40
  1028d8:	e8 e9 fe ff ff       	call   1027c6 <outByte>
  1028dd:	83 c4 08             	add    $0x8,%esp
  1028e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1028e3:	85 c0                	test   %eax,%eax
  1028e5:	79 05                	jns    1028ec <initTimer+0x46>
  1028e7:	05 ff 00 00 00       	add    $0xff,%eax
  1028ec:	c1 f8 08             	sar    $0x8,%eax
  1028ef:	0f be c0             	movsbl %al,%eax
  1028f2:	50                   	push   %eax
  1028f3:	6a 40                	push   $0x40
  1028f5:	e8 cc fe ff ff       	call   1027c6 <outByte>
  1028fa:	83 c4 08             	add    $0x8,%esp
  1028fd:	90                   	nop
  1028fe:	c9                   	leave  
  1028ff:	c3                   	ret    

00102900 <getKeyCode>:
  102900:	55                   	push   %ebp
  102901:	89 e5                	mov    %esp,%ebp
  102903:	83 ec 10             	sub    $0x10,%esp
  102906:	6a 60                	push   $0x60
  102908:	e8 9e fe ff ff       	call   1027ab <inByte>
  10290d:	83 c4 04             	add    $0x4,%esp
  102910:	0f b6 c0             	movzbl %al,%eax
  102913:	89 45 fc             	mov    %eax,-0x4(%ebp)
  102916:	6a 61                	push   $0x61
  102918:	e8 8e fe ff ff       	call   1027ab <inByte>
  10291d:	83 c4 04             	add    $0x4,%esp
  102920:	0f b6 c0             	movzbl %al,%eax
  102923:	89 45 f8             	mov    %eax,-0x8(%ebp)
  102926:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102929:	83 c8 80             	or     $0xffffff80,%eax
  10292c:	0f be c0             	movsbl %al,%eax
  10292f:	50                   	push   %eax
  102930:	6a 61                	push   $0x61
  102932:	e8 8f fe ff ff       	call   1027c6 <outByte>
  102937:	83 c4 08             	add    $0x8,%esp
  10293a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10293d:	0f be c0             	movsbl %al,%eax
  102940:	50                   	push   %eax
  102941:	6a 61                	push   $0x61
  102943:	e8 7e fe ff ff       	call   1027c6 <outByte>
  102948:	83 c4 08             	add    $0x8,%esp
  10294b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10294e:	c9                   	leave  
  10294f:	c3                   	ret    

00102950 <i2A>:
  102950:	55                   	push   %ebp
  102951:	89 e5                	mov    %esp,%ebp
  102953:	83 ec 10             	sub    $0x10,%esp
  102956:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10295d:	c7 45 f8 9e 4a 10 00 	movl   $0x104a9e,-0x8(%ebp)
  102964:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
  102968:	c6 45 f6 00          	movb   $0x0,-0xa(%ebp)
  10296c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102970:	79 17                	jns    102989 <i2A+0x39>
  102972:	81 7d 08 00 00 00 80 	cmpl   $0x80000000,0x8(%ebp)
  102979:	75 07                	jne    102982 <i2A+0x32>
  10297b:	ff 45 08             	incl   0x8(%ebp)
  10297e:	c6 45 f6 01          	movb   $0x1,-0xa(%ebp)
  102982:	c6 45 f7 01          	movb   $0x1,-0x9(%ebp)
  102986:	f7 5d 08             	negl   0x8(%ebp)
  102989:	ff 4d f8             	decl   -0x8(%ebp)
  10298c:	8b 45 08             	mov    0x8(%ebp),%eax
  10298f:	b9 0a 00 00 00       	mov    $0xa,%ecx
  102994:	99                   	cltd   
  102995:	f7 f9                	idiv   %ecx
  102997:	89 d0                	mov    %edx,%eax
  102999:	83 c0 30             	add    $0x30,%eax
  10299c:	88 c2                	mov    %al,%dl
  10299e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1029a1:	88 10                	mov    %dl,(%eax)
  1029a3:	ff 45 fc             	incl   -0x4(%ebp)
  1029a6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1029a9:	b8 67 66 66 66       	mov    $0x66666667,%eax
  1029ae:	f7 e9                	imul   %ecx
  1029b0:	c1 fa 02             	sar    $0x2,%edx
  1029b3:	89 c8                	mov    %ecx,%eax
  1029b5:	c1 f8 1f             	sar    $0x1f,%eax
  1029b8:	29 c2                	sub    %eax,%edx
  1029ba:	89 d0                	mov    %edx,%eax
  1029bc:	89 45 08             	mov    %eax,0x8(%ebp)
  1029bf:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1029c3:	75 c4                	jne    102989 <i2A+0x39>
  1029c5:	80 7d f7 01          	cmpb   $0x1,-0x9(%ebp)
  1029c9:	75 0c                	jne    1029d7 <i2A+0x87>
  1029cb:	ff 4d f8             	decl   -0x8(%ebp)
  1029ce:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1029d1:	c6 00 2d             	movb   $0x2d,(%eax)
  1029d4:	ff 45 fc             	incl   -0x4(%ebp)
  1029d7:	80 7d f6 01          	cmpb   $0x1,-0xa(%ebp)
  1029db:	75 0b                	jne    1029e8 <i2A+0x98>
  1029dd:	a0 9d 4a 10 00       	mov    0x104a9d,%al
  1029e2:	40                   	inc    %eax
  1029e3:	a2 9d 4a 10 00       	mov    %al,0x104a9d
  1029e8:	c6 05 9e 4a 10 00 00 	movb   $0x0,0x104a9e
  1029ef:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029f2:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1029f5:	89 10                	mov    %edx,(%eax)
  1029f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1029fa:	c9                   	leave  
  1029fb:	c3                   	ret    

001029fc <append>:
  1029fc:	55                   	push   %ebp
  1029fd:	89 e5                	mov    %esp,%ebp
  1029ff:	83 ec 10             	sub    $0x10,%esp
  102a02:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  102a09:	eb 19                	jmp    102a24 <append+0x28>
  102a0b:	ff 45 fc             	incl   -0x4(%ebp)
  102a0e:	8b 45 08             	mov    0x8(%ebp),%eax
  102a11:	8d 50 01             	lea    0x1(%eax),%edx
  102a14:	89 55 08             	mov    %edx,0x8(%ebp)
  102a17:	8b 55 0c             	mov    0xc(%ebp),%edx
  102a1a:	8d 4a 01             	lea    0x1(%edx),%ecx
  102a1d:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  102a20:	8a 12                	mov    (%edx),%dl
  102a22:	88 10                	mov    %dl,(%eax)
  102a24:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a27:	8a 00                	mov    (%eax),%al
  102a29:	84 c0                	test   %al,%al
  102a2b:	75 de                	jne    102a0b <append+0xf>
  102a2d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102a30:	c9                   	leave  
  102a31:	c3                   	ret    

00102a32 <i2X>:
  102a32:	55                   	push   %ebp
  102a33:	89 e5                	mov    %esp,%ebp
  102a35:	83 ec 10             	sub    $0x10,%esp
  102a38:	c7 45 fc be 4a 10 00 	movl   $0x104abe,-0x4(%ebp)
  102a3f:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  102a46:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102a4d:	ff 45 f8             	incl   -0x8(%ebp)
  102a50:	8b 45 08             	mov    0x8(%ebp),%eax
  102a53:	83 e0 0f             	and    $0xf,%eax
  102a56:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102a59:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a5c:	83 e8 0a             	sub    $0xa,%eax
  102a5f:	83 f8 05             	cmp    $0x5,%eax
  102a62:	77 4b                	ja     102aaf <i2X+0x7d>
  102a64:	8b 04 85 d4 2f 10 00 	mov    0x102fd4(,%eax,4),%eax
  102a6b:	ff e0                	jmp    *%eax
  102a6d:	ff 4d fc             	decl   -0x4(%ebp)
  102a70:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102a73:	c6 00 61             	movb   $0x61,(%eax)
  102a76:	eb 47                	jmp    102abf <i2X+0x8d>
  102a78:	ff 4d fc             	decl   -0x4(%ebp)
  102a7b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102a7e:	c6 00 62             	movb   $0x62,(%eax)
  102a81:	eb 3c                	jmp    102abf <i2X+0x8d>
  102a83:	ff 4d fc             	decl   -0x4(%ebp)
  102a86:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102a89:	c6 00 63             	movb   $0x63,(%eax)
  102a8c:	eb 31                	jmp    102abf <i2X+0x8d>
  102a8e:	ff 4d fc             	decl   -0x4(%ebp)
  102a91:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102a94:	c6 00 64             	movb   $0x64,(%eax)
  102a97:	eb 26                	jmp    102abf <i2X+0x8d>
  102a99:	ff 4d fc             	decl   -0x4(%ebp)
  102a9c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102a9f:	c6 00 65             	movb   $0x65,(%eax)
  102aa2:	eb 1b                	jmp    102abf <i2X+0x8d>
  102aa4:	ff 4d fc             	decl   -0x4(%ebp)
  102aa7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102aaa:	c6 00 66             	movb   $0x66,(%eax)
  102aad:	eb 10                	jmp    102abf <i2X+0x8d>
  102aaf:	ff 4d fc             	decl   -0x4(%ebp)
  102ab2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ab5:	83 c0 30             	add    $0x30,%eax
  102ab8:	88 c2                	mov    %al,%dl
  102aba:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102abd:	88 10                	mov    %dl,(%eax)
  102abf:	8b 45 08             	mov    0x8(%ebp),%eax
  102ac2:	c1 e8 04             	shr    $0x4,%eax
  102ac5:	89 45 08             	mov    %eax,0x8(%ebp)
  102ac8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102acc:	0f 85 7b ff ff ff    	jne    102a4d <i2X+0x1b>
  102ad2:	c6 05 be 4a 10 00 00 	movb   $0x0,0x104abe
  102ad9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102adc:	8b 55 fc             	mov    -0x4(%ebp),%edx
  102adf:	89 10                	mov    %edx,(%eax)
  102ae1:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102ae4:	c9                   	leave  
  102ae5:	c3                   	ret    

00102ae6 <printk_char>:
  102ae6:	55                   	push   %ebp
  102ae7:	89 e5                	mov    %esp,%ebp
  102ae9:	83 ec 08             	sub    $0x8,%esp
  102aec:	eb 17                	jmp    102b05 <printk_char+0x1f>
  102aee:	8b 45 08             	mov    0x8(%ebp),%eax
  102af1:	8a 00                	mov    (%eax),%al
  102af3:	0f be c0             	movsbl %al,%eax
  102af6:	83 ec 0c             	sub    $0xc,%esp
  102af9:	50                   	push   %eax
  102afa:	e8 95 ea ff ff       	call   101594 <putChar>
  102aff:	83 c4 10             	add    $0x10,%esp
  102b02:	ff 45 08             	incl   0x8(%ebp)
  102b05:	8b 45 08             	mov    0x8(%ebp),%eax
  102b08:	8a 00                	mov    (%eax),%al
  102b0a:	84 c0                	test   %al,%al
  102b0c:	75 e0                	jne    102aee <printk_char+0x8>
  102b0e:	b8 01 00 00 00       	mov    $0x1,%eax
  102b13:	c9                   	leave  
  102b14:	c3                   	ret    

00102b15 <printk>:
  102b15:	55                   	push   %ebp
  102b16:	89 e5                	mov    %esp,%ebp
  102b18:	83 ec 28             	sub    $0x28,%esp
  102b1b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102b22:	8d 45 0c             	lea    0xc(%ebp),%eax
  102b25:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102b28:	8b 45 08             	mov    0x8(%ebp),%eax
  102b2b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102b2e:	c7 45 e8 58 00 00 00 	movl   $0x58,-0x18(%ebp)
  102b35:	e9 57 01 00 00       	jmp    102c91 <printk+0x17c>
  102b3a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102b3d:	8a 00                	mov    (%eax),%al
  102b3f:	3c 25                	cmp    $0x25,%al
  102b41:	75 56                	jne    102b99 <printk+0x84>
  102b43:	ff 45 ec             	incl   -0x14(%ebp)
  102b46:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102b49:	8a 00                	mov    (%eax),%al
  102b4b:	0f be c0             	movsbl %al,%eax
  102b4e:	83 f8 64             	cmp    $0x64,%eax
  102b51:	74 18                	je     102b6b <printk+0x56>
  102b53:	83 f8 64             	cmp    $0x64,%eax
  102b56:	7f 07                	jg     102b5f <printk+0x4a>
  102b58:	83 f8 63             	cmp    $0x63,%eax
  102b5b:	74 29                	je     102b86 <printk+0x71>
  102b5d:	eb 30                	jmp    102b8f <printk+0x7a>
  102b5f:	83 f8 73             	cmp    $0x73,%eax
  102b62:	74 19                	je     102b7d <printk+0x68>
  102b64:	83 f8 78             	cmp    $0x78,%eax
  102b67:	74 0b                	je     102b74 <printk+0x5f>
  102b69:	eb 24                	jmp    102b8f <printk+0x7a>
  102b6b:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
  102b72:	eb 2c                	jmp    102ba0 <printk+0x8b>
  102b74:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  102b7b:	eb 23                	jmp    102ba0 <printk+0x8b>
  102b7d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  102b84:	eb 1a                	jmp    102ba0 <printk+0x8b>
  102b86:	c7 45 e8 03 00 00 00 	movl   $0x3,-0x18(%ebp)
  102b8d:	eb 11                	jmp    102ba0 <printk+0x8b>
  102b8f:	c7 45 e8 58 00 00 00 	movl   $0x58,-0x18(%ebp)
  102b96:	90                   	nop
  102b97:	eb 07                	jmp    102ba0 <printk+0x8b>
  102b99:	c7 45 e8 58 00 00 00 	movl   $0x58,-0x18(%ebp)
  102ba0:	83 7d e8 58          	cmpl   $0x58,-0x18(%ebp)
  102ba4:	75 19                	jne    102bbf <printk+0xaa>
  102ba6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ba9:	8d 50 01             	lea    0x1(%eax),%edx
  102bac:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102baf:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102bb2:	8a 12                	mov    (%edx),%dl
  102bb4:	88 90 80 42 10 00    	mov    %dl,0x104280(%eax)
  102bba:	e9 cf 00 00 00       	jmp    102c8e <printk+0x179>
  102bbf:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
  102bc3:	75 3f                	jne    102c04 <printk+0xef>
  102bc5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  102bcc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bcf:	8d 50 04             	lea    0x4(%eax),%edx
  102bd2:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102bd5:	8b 00                	mov    (%eax),%eax
  102bd7:	89 c2                	mov    %eax,%edx
  102bd9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  102bdc:	50                   	push   %eax
  102bdd:	52                   	push   %edx
  102bde:	e8 6d fd ff ff       	call   102950 <i2A>
  102be3:	83 c4 08             	add    $0x8,%esp
  102be6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102be9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102bec:	81 c2 80 42 10 00    	add    $0x104280,%edx
  102bf2:	50                   	push   %eax
  102bf3:	52                   	push   %edx
  102bf4:	e8 03 fe ff ff       	call   1029fc <append>
  102bf9:	83 c4 08             	add    $0x8,%esp
  102bfc:	01 45 f4             	add    %eax,-0xc(%ebp)
  102bff:	e9 8a 00 00 00       	jmp    102c8e <printk+0x179>
  102c04:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
  102c08:	75 3a                	jne    102c44 <printk+0x12f>
  102c0a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  102c11:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c14:	8d 50 04             	lea    0x4(%eax),%edx
  102c17:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102c1a:	8b 00                	mov    (%eax),%eax
  102c1c:	8d 55 e0             	lea    -0x20(%ebp),%edx
  102c1f:	52                   	push   %edx
  102c20:	50                   	push   %eax
  102c21:	e8 0c fe ff ff       	call   102a32 <i2X>
  102c26:	83 c4 08             	add    $0x8,%esp
  102c29:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102c2c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102c2f:	81 c2 80 42 10 00    	add    $0x104280,%edx
  102c35:	50                   	push   %eax
  102c36:	52                   	push   %edx
  102c37:	e8 c0 fd ff ff       	call   1029fc <append>
  102c3c:	83 c4 08             	add    $0x8,%esp
  102c3f:	01 45 f4             	add    %eax,-0xc(%ebp)
  102c42:	eb 4a                	jmp    102c8e <printk+0x179>
  102c44:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102c48:	75 24                	jne    102c6e <printk+0x159>
  102c4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c4d:	8d 50 04             	lea    0x4(%eax),%edx
  102c50:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102c53:	8b 00                	mov    (%eax),%eax
  102c55:	89 c2                	mov    %eax,%edx
  102c57:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c5a:	05 80 42 10 00       	add    $0x104280,%eax
  102c5f:	52                   	push   %edx
  102c60:	50                   	push   %eax
  102c61:	e8 96 fd ff ff       	call   1029fc <append>
  102c66:	83 c4 08             	add    $0x8,%esp
  102c69:	01 45 f4             	add    %eax,-0xc(%ebp)
  102c6c:	eb 20                	jmp    102c8e <printk+0x179>
  102c6e:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  102c72:	75 1a                	jne    102c8e <printk+0x179>
  102c74:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c77:	8d 50 01             	lea    0x1(%eax),%edx
  102c7a:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102c7d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102c80:	8d 4a 04             	lea    0x4(%edx),%ecx
  102c83:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  102c86:	8b 12                	mov    (%edx),%edx
  102c88:	88 90 80 42 10 00    	mov    %dl,0x104280(%eax)
  102c8e:	ff 45 ec             	incl   -0x14(%ebp)
  102c91:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102c94:	8a 00                	mov    (%eax),%al
  102c96:	84 c0                	test   %al,%al
  102c98:	0f 85 9c fe ff ff    	jne    102b3a <printk+0x25>
  102c9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ca1:	8d 50 01             	lea    0x1(%eax),%edx
  102ca4:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102ca7:	c6 80 80 42 10 00 00 	movb   $0x0,0x104280(%eax)
  102cae:	83 ec 08             	sub    $0x8,%esp
  102cb1:	68 00 04 00 00       	push   $0x400
  102cb6:	68 80 42 10 00       	push   $0x104280
  102cbb:	e8 26 fe ff ff       	call   102ae6 <printk_char>
  102cc0:	83 c4 10             	add    $0x10,%esp
  102cc3:	90                   	nop
  102cc4:	c9                   	leave  
  102cc5:	c3                   	ret    

00102cc6 <waitForInterrupt>:
  102cc6:	55                   	push   %ebp
  102cc7:	89 e5                	mov    %esp,%ebp
  102cc9:	f4                   	hlt    
  102cca:	90                   	nop
  102ccb:	5d                   	pop    %ebp
  102ccc:	c3                   	ret    

00102ccd <disableInterrupt>:
  102ccd:	55                   	push   %ebp
  102cce:	89 e5                	mov    %esp,%ebp
  102cd0:	fa                   	cli    
  102cd1:	90                   	nop
  102cd2:	5d                   	pop    %ebp
  102cd3:	c3                   	ret    

00102cd4 <i2A>:
  102cd4:	55                   	push   %ebp
  102cd5:	89 e5                	mov    %esp,%ebp
  102cd7:	83 ec 10             	sub    $0x10,%esp
  102cda:	c7 45 fc dd 4a 10 00 	movl   $0x104add,-0x4(%ebp)
  102ce1:	ff 4d fc             	decl   -0x4(%ebp)
  102ce4:	8b 45 08             	mov    0x8(%ebp),%eax
  102ce7:	b9 0a 00 00 00       	mov    $0xa,%ecx
  102cec:	99                   	cltd   
  102ced:	f7 f9                	idiv   %ecx
  102cef:	89 d0                	mov    %edx,%eax
  102cf1:	83 c0 30             	add    $0x30,%eax
  102cf4:	88 c2                	mov    %al,%dl
  102cf6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102cf9:	88 10                	mov    %dl,(%eax)
  102cfb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  102cfe:	b8 67 66 66 66       	mov    $0x66666667,%eax
  102d03:	f7 e9                	imul   %ecx
  102d05:	c1 fa 02             	sar    $0x2,%edx
  102d08:	89 c8                	mov    %ecx,%eax
  102d0a:	c1 f8 1f             	sar    $0x1f,%eax
  102d0d:	29 c2                	sub    %eax,%edx
  102d0f:	89 d0                	mov    %edx,%eax
  102d11:	89 45 08             	mov    %eax,0x8(%ebp)
  102d14:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102d18:	75 c7                	jne    102ce1 <i2A+0xd>
  102d1a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102d1d:	c9                   	leave  
  102d1e:	c3                   	ret    

00102d1f <append>:
  102d1f:	55                   	push   %ebp
  102d20:	89 e5                	mov    %esp,%ebp
  102d22:	eb 1a                	jmp    102d3e <append+0x1f>
  102d24:	8b 45 08             	mov    0x8(%ebp),%eax
  102d27:	8b 00                	mov    (%eax),%eax
  102d29:	8d 48 01             	lea    0x1(%eax),%ecx
  102d2c:	8b 55 08             	mov    0x8(%ebp),%edx
  102d2f:	89 0a                	mov    %ecx,(%edx)
  102d31:	8b 55 0c             	mov    0xc(%ebp),%edx
  102d34:	8d 4a 01             	lea    0x1(%edx),%ecx
  102d37:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  102d3a:	8a 12                	mov    (%edx),%dl
  102d3c:	88 10                	mov    %dl,(%eax)
  102d3e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d41:	8a 00                	mov    (%eax),%al
  102d43:	84 c0                	test   %al,%al
  102d45:	75 dd                	jne    102d24 <append+0x5>
  102d47:	90                   	nop
  102d48:	5d                   	pop    %ebp
  102d49:	c3                   	ret    

00102d4a <displayMessage>:
  102d4a:	55                   	push   %ebp
  102d4b:	89 e5                	mov    %esp,%ebp
  102d4d:	83 ec 18             	sub    $0x18,%esp
  102d50:	b8 52 41 10 00       	mov    $0x104152,%eax
  102d55:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d58:	ff 75 08             	pushl  0x8(%ebp)
  102d5b:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102d5e:	50                   	push   %eax
  102d5f:	e8 bb ff ff ff       	call   102d1f <append>
  102d64:	83 c4 08             	add    $0x8,%esp
  102d67:	68 ec 2f 10 00       	push   $0x102fec
  102d6c:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102d6f:	50                   	push   %eax
  102d70:	e8 aa ff ff ff       	call   102d1f <append>
  102d75:	83 c4 08             	add    $0x8,%esp
  102d78:	ff 75 0c             	pushl  0xc(%ebp)
  102d7b:	e8 54 ff ff ff       	call   102cd4 <i2A>
  102d80:	83 c4 04             	add    $0x4,%esp
  102d83:	50                   	push   %eax
  102d84:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102d87:	50                   	push   %eax
  102d88:	e8 92 ff ff ff       	call   102d1f <append>
  102d8d:	83 c4 08             	add    $0x8,%esp
  102d90:	68 ee 2f 10 00       	push   $0x102fee
  102d95:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102d98:	50                   	push   %eax
  102d99:	e8 81 ff ff ff       	call   102d1f <append>
  102d9e:	83 c4 08             	add    $0x8,%esp
  102da1:	c7 45 f4 40 41 10 00 	movl   $0x104140,-0xc(%ebp)
  102da8:	eb 1b                	jmp    102dc5 <displayMessage+0x7b>
  102daa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102dad:	8a 00                	mov    (%eax),%al
  102daf:	0f be c0             	movsbl %al,%eax
  102db2:	83 ec 0c             	sub    $0xc,%esp
  102db5:	50                   	push   %eax
  102db6:	e8 d9 e7 ff ff       	call   101594 <putChar>
  102dbb:	83 c4 10             	add    $0x10,%esp
  102dbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102dc1:	40                   	inc    %eax
  102dc2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102dc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102dc8:	8a 00                	mov    (%eax),%al
  102dca:	84 c0                	test   %al,%al
  102dcc:	75 dc                	jne    102daa <displayMessage+0x60>
  102dce:	90                   	nop
  102dcf:	c9                   	leave  
  102dd0:	c3                   	ret    

00102dd1 <abort>:
  102dd1:	55                   	push   %ebp
  102dd2:	89 e5                	mov    %esp,%ebp
  102dd4:	83 ec 08             	sub    $0x8,%esp
  102dd7:	e8 f1 fe ff ff       	call   102ccd <disableInterrupt>
  102ddc:	83 ec 08             	sub    $0x8,%esp
  102ddf:	ff 75 0c             	pushl  0xc(%ebp)
  102de2:	ff 75 08             	pushl  0x8(%ebp)
  102de5:	e8 60 ff ff ff       	call   102d4a <displayMessage>
  102dea:	83 c4 10             	add    $0x10,%esp
  102ded:	e8 d4 fe ff ff       	call   102cc6 <waitForInterrupt>
  102df2:	eb f9                	jmp    102ded <abort+0x1c>

00102df4 <irqEmpty>:
  102df4:	6a 00                	push   $0x0
  102df6:	6a ff                	push   $0xffffffff
  102df8:	eb 13                	jmp    102e0d <asmDoIrq>

00102dfa <irqGProtectFault>:
  102dfa:	6a 0d                	push   $0xd
  102dfc:	eb 0f                	jmp    102e0d <asmDoIrq>

00102dfe <irqSyscall>:
  102dfe:	6a 00                	push   $0x0
  102e00:	68 80 00 00 00       	push   $0x80
  102e05:	eb 06                	jmp    102e0d <asmDoIrq>

00102e07 <irqTime>:
  102e07:	6a 00                	push   $0x0
  102e09:	6a 20                	push   $0x20
  102e0b:	eb 00                	jmp    102e0d <asmDoIrq>

00102e0d <asmDoIrq>:
  102e0d:	60                   	pusha  
  102e0e:	1e                   	push   %ds
  102e0f:	06                   	push   %es
  102e10:	0f a0                	push   %fs
  102e12:	0f a8                	push   %gs
  102e14:	54                   	push   %esp
  102e15:	e8 d5 f2 ff ff       	call   1020ef <irqHandle>
  102e1a:	5c                   	pop    %esp
  102e1b:	0f a9                	pop    %gs
  102e1d:	0f a1                	pop    %fs
  102e1f:	07                   	pop    %es
  102e20:	1f                   	pop    %ds
  102e21:	61                   	popa   
  102e22:	83 c4 04             	add    $0x4,%esp
  102e25:	83 c4 04             	add    $0x4,%esp
  102e28:	cf                   	iret   
