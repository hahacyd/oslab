
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
  10001c:	e8 fc 28 00 00       	call   10291d <initTimer>
  100021:	e8 ef 1c 00 00       	call   101d15 <init_pcb>
  100026:	e8 b0 1d 00 00       	call   101ddb <init_kernel_pcb>
  10002b:	e8 aa 14 00 00       	call   1014da <initSerial>
  100030:	e8 ee 1f 00 00       	call   102023 <initIdt>
  100035:	e8 20 28 00 00       	call   10285a <initIntr>
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
  1003c6:	68 a0 2e 10 00       	push   $0x102ea0
  1003cb:	e8 bc 27 00 00       	call   102b8c <printk>
  1003d0:	83 c4 10             	add    $0x10,%esp
  1003d3:	83 ec 0c             	sub    $0xc,%esp
  1003d6:	ff 75 f4             	pushl  -0xc(%ebp)
  1003d9:	68 e0 2e 10 00       	push   $0x102ee0
  1003de:	6a 17                	push   $0x17
  1003e0:	68 a6 2e 10 00       	push   $0x102ea6
  1003e5:	68 b3 2e 10 00       	push   $0x102eb3
  1003ea:	e8 9d 27 00 00       	call   102b8c <printk>
  1003ef:	83 c4 20             	add    $0x20,%esp
  1003f2:	83 ec 0c             	sub    $0xc,%esp
  1003f5:	68 cf 2e 10 00       	push   $0x102ecf
  1003fa:	e8 8d 27 00 00       	call   102b8c <printk>
  1003ff:	83 c4 10             	add    $0x10,%esp
  100402:	83 ec 08             	sub    $0x8,%esp
  100405:	6a 18                	push   $0x18
  100407:	68 a6 2e 10 00       	push   $0x102ea6
  10040c:	e8 37 2a 00 00       	call   102e48 <abort>
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
  100867:	a1 d8 2e 10 00       	mov    0x102ed8,%eax
  10086c:	8b 15 dc 2e 10 00    	mov    0x102edc,%edx
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
  1009d4:	e8 24 0c 00 00       	call   1015fd <apply_new_pid>
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
  100b02:	e8 72 0b 00 00       	call   101679 <put_into_runnable>
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
  100c6b:	e8 cb 09 00 00       	call   10163b <getpid>
  100c70:	83 ec 0c             	sub    $0xc,%esp
  100c73:	50                   	push   %eax
  100c74:	e8 aa 09 00 00       	call   101623 <put_into_empty>
  100c79:	83 c4 10             	add    $0x10,%esp
  100c7c:	e8 d8 09 00 00       	call   101659 <get_from_runnable>
  100c81:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c84:	83 ec 08             	sub    $0x8,%esp
  100c87:	ff 75 08             	pushl  0x8(%ebp)
  100c8a:	ff 75 f4             	pushl  -0xc(%ebp)
  100c8d:	e8 14 09 00 00       	call   1015a6 <put_into_running>
  100c92:	83 c4 10             	add    $0x10,%esp
  100c95:	b8 01 00 00 00       	mov    $0x1,%eax
  100c9a:	c9                   	leave  
  100c9b:	c3                   	ret    

00100c9c <sys_getpid>:
  100c9c:	55                   	push   %ebp
  100c9d:	89 e5                	mov    %esp,%ebp
  100c9f:	83 ec 08             	sub    $0x8,%esp
  100ca2:	e8 94 09 00 00       	call   10163b <getpid>
  100ca7:	c9                   	leave  
  100ca8:	c3                   	ret    

00100ca9 <sys_sleep>:
  100ca9:	55                   	push   %ebp
  100caa:	89 e5                	mov    %esp,%ebp
  100cac:	83 ec 18             	sub    $0x18,%esp
  100caf:	e8 87 09 00 00       	call   10163b <getpid>
  100cb4:	83 ec 08             	sub    $0x8,%esp
  100cb7:	ff 75 08             	pushl  0x8(%ebp)
  100cba:	50                   	push   %eax
  100cbb:	e8 e7 0c 00 00       	call   1019a7 <put_into_block>
  100cc0:	83 c4 10             	add    $0x10,%esp
  100cc3:	e8 91 09 00 00       	call   101659 <get_from_runnable>
  100cc8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100ccb:	83 ec 08             	sub    $0x8,%esp
  100cce:	ff 75 08             	pushl  0x8(%ebp)
  100cd1:	ff 75 f4             	pushl  -0xc(%ebp)
  100cd4:	e8 cd 08 00 00       	call   1015a6 <put_into_running>
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
  100cec:	e8 0c 09 00 00       	call   1015fd <apply_new_pid>
  100cf1:	89 45 d8             	mov    %eax,-0x28(%ebp)
  100cf4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100cfb:	eb 6d                	jmp    100d6a <sys_fork+0x87>
  100cfd:	e8 39 09 00 00       	call   10163b <getpid>
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
  100d73:	e8 c3 08 00 00       	call   10163b <getpid>
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
  100e09:	e8 2d 08 00 00       	call   10163b <getpid>
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
  100e74:	e8 00 08 00 00       	call   101679 <put_into_runnable>
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
  1010dd:	68 eb 2e 10 00       	push   $0x102eeb
  1010e2:	e8 61 1d 00 00       	call   102e48 <abort>
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
  1011af:	68 eb 2e 10 00       	push   $0x102eeb
  1011b4:	e8 8f 1c 00 00       	call   102e48 <abort>
  1011b9:	83 c4 10             	add    $0x10,%esp
  1011bc:	8b 45 08             	mov    0x8(%ebp),%eax
  1011bf:	8b 40 24             	mov    0x24(%eax),%eax
  1011c2:	89 c3                	mov    %eax,%ebx
  1011c4:	e8 72 04 00 00       	call   10163b <getpid>
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
  10126c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  101273:	8b 45 08             	mov    0x8(%ebp),%eax
  101276:	8b 58 28             	mov    0x28(%eax),%ebx
  101279:	e8 bd 03 00 00       	call   10163b <getpid>
  10127e:	c1 e0 10             	shl    $0x10,%eax
  101281:	01 d8                	add    %ebx,%eax
  101283:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  101286:	8b 45 08             	mov    0x8(%ebp),%eax
  101289:	8b 40 24             	mov    0x24(%eax),%eax
  10128c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10128f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101296:	e9 b9 01 00 00       	jmp    101454 <sys_read+0x1ef>
  10129b:	e8 a1 ff ff ff       	call   101241 <getScancode>
  1012a0:	0f b6 c0             	movzbl %al,%eax
  1012a3:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1012a6:	83 7d e8 3a          	cmpl   $0x3a,-0x18(%ebp)
  1012aa:	75 18                	jne    1012c4 <sys_read+0x5f>
  1012ac:	a1 50 42 10 00       	mov    0x104250,%eax
  1012b1:	83 f8 01             	cmp    $0x1,%eax
  1012b4:	0f 95 c0             	setne  %al
  1012b7:	0f b6 c0             	movzbl %al,%eax
  1012ba:	a3 50 42 10 00       	mov    %eax,0x104250
  1012bf:	e9 90 01 00 00       	jmp    101454 <sys_read+0x1ef>
  1012c4:	83 7d e8 2a          	cmpl   $0x2a,-0x18(%ebp)
  1012c8:	74 06                	je     1012d0 <sys_read+0x6b>
  1012ca:	83 7d e8 36          	cmpl   $0x36,-0x18(%ebp)
  1012ce:	75 0f                	jne    1012df <sys_read+0x7a>
  1012d0:	c7 05 54 42 10 00 01 	movl   $0x1,0x104254
  1012d7:	00 00 00 
  1012da:	e9 75 01 00 00       	jmp    101454 <sys_read+0x1ef>
  1012df:	81 7d e8 aa 00 00 00 	cmpl   $0xaa,-0x18(%ebp)
  1012e6:	74 09                	je     1012f1 <sys_read+0x8c>
  1012e8:	81 7d e8 b6 00 00 00 	cmpl   $0xb6,-0x18(%ebp)
  1012ef:	75 0f                	jne    101300 <sys_read+0x9b>
  1012f1:	c7 05 54 42 10 00 00 	movl   $0x0,0x104254
  1012f8:	00 00 00 
  1012fb:	e9 54 01 00 00       	jmp    101454 <sys_read+0x1ef>
  101300:	83 7d e8 7f          	cmpl   $0x7f,-0x18(%ebp)
  101304:	76 05                	jbe    10130b <sys_read+0xa6>
  101306:	e9 49 01 00 00       	jmp    101454 <sys_read+0x1ef>
  10130b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10130e:	05 20 40 10 00       	add    $0x104020,%eax
  101313:	8a 00                	mov    (%eax),%al
  101315:	88 45 df             	mov    %al,-0x21(%ebp)
  101318:	8a 45 df             	mov    -0x21(%ebp),%al
  10131b:	3c 08                	cmp    $0x8,%al
  10131d:	75 0a                	jne    101329 <sys_read+0xc4>
  10131f:	e8 80 fb ff ff       	call   100ea4 <backSpace>
  101324:	e9 2b 01 00 00       	jmp    101454 <sys_read+0x1ef>
  101329:	a1 54 42 10 00       	mov    0x104254,%eax
  10132e:	83 f8 01             	cmp    $0x1,%eax
  101331:	0f 85 d1 00 00 00    	jne    101408 <sys_read+0x1a3>
  101337:	83 7d e8 0d          	cmpl   $0xd,-0x18(%ebp)
  10133b:	77 12                	ja     10134f <sys_read+0xea>
  10133d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  101340:	48                   	dec    %eax
  101341:	8a 80 20 41 10 00    	mov    0x104120(%eax),%al
  101347:	88 45 df             	mov    %al,-0x21(%ebp)
  10134a:	e9 b9 00 00 00       	jmp    101408 <sys_read+0x1a3>
  10134f:	8a 45 df             	mov    -0x21(%ebp),%al
  101352:	3c 60                	cmp    $0x60,%al
  101354:	7e 1e                	jle    101374 <sys_read+0x10f>
  101356:	8a 45 df             	mov    -0x21(%ebp),%al
  101359:	3c 7a                	cmp    $0x7a,%al
  10135b:	7f 17                	jg     101374 <sys_read+0x10f>
  10135d:	a1 50 42 10 00       	mov    0x104250,%eax
  101362:	85 c0                	test   %eax,%eax
  101364:	75 0e                	jne    101374 <sys_read+0x10f>
  101366:	8a 45 df             	mov    -0x21(%ebp),%al
  101369:	83 e8 20             	sub    $0x20,%eax
  10136c:	88 45 df             	mov    %al,-0x21(%ebp)
  10136f:	e9 94 00 00 00       	jmp    101408 <sys_read+0x1a3>
  101374:	8a 45 df             	mov    -0x21(%ebp),%al
  101377:	3c 2b                	cmp    $0x2b,%al
  101379:	7e 12                	jle    10138d <sys_read+0x128>
  10137b:	8a 45 df             	mov    -0x21(%ebp),%al
  10137e:	3c 2f                	cmp    $0x2f,%al
  101380:	7f 0b                	jg     10138d <sys_read+0x128>
  101382:	8a 45 df             	mov    -0x21(%ebp),%al
  101385:	83 c0 10             	add    $0x10,%eax
  101388:	88 45 df             	mov    %al,-0x21(%ebp)
  10138b:	eb 7b                	jmp    101408 <sys_read+0x1a3>
  10138d:	8b 45 e8             	mov    -0x18(%ebp),%eax
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
  1013b4:	68 08 2f 10 00       	push   $0x102f08
  1013b9:	e8 ce 17 00 00       	call   102b8c <printk>
  1013be:	83 c4 10             	add    $0x10,%esp
  1013c1:	83 ec 0c             	sub    $0xc,%esp
  1013c4:	ff 75 e8             	pushl  -0x18(%ebp)
  1013c7:	68 44 2f 10 00       	push   $0x102f44
  1013cc:	6a 5a                	push   $0x5a
  1013ce:	68 0e 2f 10 00       	push   $0x102f0e
  1013d3:	68 29 2f 10 00       	push   $0x102f29
  1013d8:	e8 af 17 00 00       	call   102b8c <printk>
  1013dd:	83 c4 20             	add    $0x20,%esp
  1013e0:	83 ec 0c             	sub    $0xc,%esp
  1013e3:	68 3e 2f 10 00       	push   $0x102f3e
  1013e8:	e8 9f 17 00 00       	call   102b8c <printk>
  1013ed:	83 c4 10             	add    $0x10,%esp
  1013f0:	83 ec 08             	sub    $0x8,%esp
  1013f3:	6a 5b                	push   $0x5b
  1013f5:	68 0e 2f 10 00       	push   $0x102f0e
  1013fa:	e8 49 1a 00 00       	call   102e48 <abort>
  1013ff:	83 c4 10             	add    $0x10,%esp
  101402:	8a 45 f3             	mov    -0xd(%ebp),%al
  101405:	88 45 df             	mov    %al,-0x21(%ebp)
  101408:	a1 50 42 10 00       	mov    0x104250,%eax
  10140d:	83 f8 01             	cmp    $0x1,%eax
  101410:	75 20                	jne    101432 <sys_read+0x1cd>
  101412:	8a 45 df             	mov    -0x21(%ebp),%al
  101415:	3c 60                	cmp    $0x60,%al
  101417:	7e 19                	jle    101432 <sys_read+0x1cd>
  101419:	8a 45 df             	mov    -0x21(%ebp),%al
  10141c:	3c 7a                	cmp    $0x7a,%al
  10141e:	7f 12                	jg     101432 <sys_read+0x1cd>
  101420:	a1 54 42 10 00       	mov    0x104254,%eax
  101425:	85 c0                	test   %eax,%eax
  101427:	75 09                	jne    101432 <sys_read+0x1cd>
  101429:	8a 45 df             	mov    -0x21(%ebp),%al
  10142c:	83 e8 20             	sub    $0x20,%eax
  10142f:	88 45 df             	mov    %al,-0x21(%ebp)
  101432:	8a 45 df             	mov    -0x21(%ebp),%al
  101435:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101438:	81 c2 e0 cb 13 01    	add    $0x113cbe0,%edx
  10143e:	88 02                	mov    %al,(%edx)
  101440:	ff 45 f4             	incl   -0xc(%ebp)
  101443:	83 ec 08             	sub    $0x8,%esp
  101446:	6a 01                	push   $0x1
  101448:	8d 45 df             	lea    -0x21(%ebp),%eax
  10144b:	50                   	push   %eax
  10144c:	e8 d7 fa ff ff       	call   100f28 <printkernel>
  101451:	83 c4 10             	add    $0x10,%esp
  101454:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101457:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  10145a:	7d 0b                	jge    101467 <sys_read+0x202>
  10145c:	8a 45 df             	mov    -0x21(%ebp),%al
  10145f:	3c 0a                	cmp    $0xa,%al
  101461:	0f 85 34 fe ff ff    	jne    10129b <sys_read+0x36>
  101467:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10146a:	48                   	dec    %eax
  10146b:	c6 80 e0 cb 13 01 00 	movb   $0x0,0x113cbe0(%eax)
  101472:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  101479:	eb 17                	jmp    101492 <sys_read+0x22d>
  10147b:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10147e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  101481:	01 c2                	add    %eax,%edx
  101483:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101486:	05 e0 cb 13 01       	add    $0x113cbe0,%eax
  10148b:	8a 00                	mov    (%eax),%al
  10148d:	88 02                	mov    %al,(%edx)
  10148f:	ff 45 ec             	incl   -0x14(%ebp)
  101492:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101495:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  101498:	7c e1                	jl     10147b <sys_read+0x216>
  10149a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10149d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1014a0:	c9                   	leave  
  1014a1:	c3                   	ret    

001014a2 <inByte>:
  1014a2:	55                   	push   %ebp
  1014a3:	89 e5                	mov    %esp,%ebp
  1014a5:	83 ec 14             	sub    $0x14,%esp
  1014a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1014ab:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  1014af:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1014b2:	89 c2                	mov    %eax,%edx
  1014b4:	ec                   	in     (%dx),%al
  1014b5:	88 45 ff             	mov    %al,-0x1(%ebp)
  1014b8:	8a 45 ff             	mov    -0x1(%ebp),%al
  1014bb:	c9                   	leave  
  1014bc:	c3                   	ret    

001014bd <outByte>:
  1014bd:	55                   	push   %ebp
  1014be:	89 e5                	mov    %esp,%ebp
  1014c0:	83 ec 08             	sub    $0x8,%esp
  1014c3:	8b 45 08             	mov    0x8(%ebp),%eax
  1014c6:	8b 55 0c             	mov    0xc(%ebp),%edx
  1014c9:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  1014cd:	88 55 f8             	mov    %dl,-0x8(%ebp)
  1014d0:	8a 45 f8             	mov    -0x8(%ebp),%al
  1014d3:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1014d6:	ee                   	out    %al,(%dx)
  1014d7:	90                   	nop
  1014d8:	c9                   	leave  
  1014d9:	c3                   	ret    

001014da <initSerial>:
  1014da:	55                   	push   %ebp
  1014db:	89 e5                	mov    %esp,%ebp
  1014dd:	6a 00                	push   $0x0
  1014df:	68 f9 03 00 00       	push   $0x3f9
  1014e4:	e8 d4 ff ff ff       	call   1014bd <outByte>
  1014e9:	83 c4 08             	add    $0x8,%esp
  1014ec:	6a 80                	push   $0xffffff80
  1014ee:	68 fb 03 00 00       	push   $0x3fb
  1014f3:	e8 c5 ff ff ff       	call   1014bd <outByte>
  1014f8:	83 c4 08             	add    $0x8,%esp
  1014fb:	6a 01                	push   $0x1
  1014fd:	68 f8 03 00 00       	push   $0x3f8
  101502:	e8 b6 ff ff ff       	call   1014bd <outByte>
  101507:	83 c4 08             	add    $0x8,%esp
  10150a:	6a 00                	push   $0x0
  10150c:	68 f9 03 00 00       	push   $0x3f9
  101511:	e8 a7 ff ff ff       	call   1014bd <outByte>
  101516:	83 c4 08             	add    $0x8,%esp
  101519:	6a 03                	push   $0x3
  10151b:	68 fb 03 00 00       	push   $0x3fb
  101520:	e8 98 ff ff ff       	call   1014bd <outByte>
  101525:	83 c4 08             	add    $0x8,%esp
  101528:	6a c7                	push   $0xffffffc7
  10152a:	68 fa 03 00 00       	push   $0x3fa
  10152f:	e8 89 ff ff ff       	call   1014bd <outByte>
  101534:	83 c4 08             	add    $0x8,%esp
  101537:	6a 0b                	push   $0xb
  101539:	68 fc 03 00 00       	push   $0x3fc
  10153e:	e8 7a ff ff ff       	call   1014bd <outByte>
  101543:	83 c4 08             	add    $0x8,%esp
  101546:	90                   	nop
  101547:	c9                   	leave  
  101548:	c3                   	ret    

00101549 <serialIdle>:
  101549:	55                   	push   %ebp
  10154a:	89 e5                	mov    %esp,%ebp
  10154c:	68 fd 03 00 00       	push   $0x3fd
  101551:	e8 4c ff ff ff       	call   1014a2 <inByte>
  101556:	83 c4 04             	add    $0x4,%esp
  101559:	0f b6 c0             	movzbl %al,%eax
  10155c:	83 e0 20             	and    $0x20,%eax
  10155f:	85 c0                	test   %eax,%eax
  101561:	0f 95 c0             	setne  %al
  101564:	0f b6 c0             	movzbl %al,%eax
  101567:	c9                   	leave  
  101568:	c3                   	ret    

00101569 <putChar>:
  101569:	55                   	push   %ebp
  10156a:	89 e5                	mov    %esp,%ebp
  10156c:	83 ec 04             	sub    $0x4,%esp
  10156f:	8b 45 08             	mov    0x8(%ebp),%eax
  101572:	88 45 fc             	mov    %al,-0x4(%ebp)
  101575:	90                   	nop
  101576:	e8 ce ff ff ff       	call   101549 <serialIdle>
  10157b:	83 f8 01             	cmp    $0x1,%eax
  10157e:	75 f6                	jne    101576 <putChar+0xd>
  101580:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
  101584:	50                   	push   %eax
  101585:	68 f8 03 00 00       	push   $0x3f8
  10158a:	e8 2e ff ff ff       	call   1014bd <outByte>
  10158f:	83 c4 08             	add    $0x8,%esp
  101592:	90                   	nop
  101593:	c9                   	leave  
  101594:	c3                   	ret    

00101595 <waitForInterrupt>:
  101595:	55                   	push   %ebp
  101596:	89 e5                	mov    %esp,%ebp
  101598:	f4                   	hlt    
  101599:	90                   	nop
  10159a:	5d                   	pop    %ebp
  10159b:	c3                   	ret    

0010159c <IDLE>:
  10159c:	55                   	push   %ebp
  10159d:	89 e5                	mov    %esp,%ebp
  10159f:	e8 f1 ff ff ff       	call   101595 <waitForInterrupt>
  1015a4:	eb f9                	jmp    10159f <IDLE+0x3>

001015a6 <put_into_running>:
  1015a6:	55                   	push   %ebp
  1015a7:	89 e5                	mov    %esp,%ebp
  1015a9:	83 ec 08             	sub    $0x8,%esp
  1015ac:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  1015b1:	39 45 08             	cmp    %eax,0x8(%ebp)
  1015b4:	75 07                	jne    1015bd <put_into_running+0x17>
  1015b6:	b8 01 00 00 00       	mov    $0x1,%eax
  1015bb:	eb 3e                	jmp    1015fb <put_into_running+0x55>
  1015bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1015c0:	a3 e0 4a 10 00       	mov    %eax,0x104ae0
  1015c5:	e8 71 00 00 00       	call   10163b <getpid>
  1015ca:	89 c2                	mov    %eax,%edx
  1015cc:	89 d0                	mov    %edx,%eax
  1015ce:	c1 e0 07             	shl    $0x7,%eax
  1015d1:	01 d0                	add    %edx,%eax
  1015d3:	01 c0                	add    %eax,%eax
  1015d5:	01 d0                	add    %edx,%eax
  1015d7:	01 c0                	add    %eax,%eax
  1015d9:	01 d0                	add    %edx,%eax
  1015db:	c1 e0 04             	shl    $0x4,%eax
  1015de:	05 fc 1f 00 00       	add    $0x1ffc,%eax
  1015e3:	05 00 4b 10 00       	add    $0x104b00,%eax
  1015e8:	83 ec 08             	sub    $0x8,%esp
  1015eb:	50                   	push   %eax
  1015ec:	6a 10                	push   $0x10
  1015ee:	e8 3a ee ff ff       	call   10042d <change_tss>
  1015f3:	83 c4 10             	add    $0x10,%esp
  1015f6:	b8 01 00 00 00       	mov    $0x1,%eax
  1015fb:	c9                   	leave  
  1015fc:	c3                   	ret    

001015fd <apply_new_pid>:
  1015fd:	55                   	push   %ebp
  1015fe:	89 e5                	mov    %esp,%ebp
  101600:	83 ec 18             	sub    $0x18,%esp
  101603:	8b 15 58 42 10 00    	mov    0x104258,%edx
  101609:	a1 58 42 10 00       	mov    0x104258,%eax
  10160e:	83 ec 08             	sub    $0x8,%esp
  101611:	52                   	push   %edx
  101612:	50                   	push   %eax
  101613:	e8 21 04 00 00       	call   101a39 <get_from>
  101618:	83 c4 10             	add    $0x10,%esp
  10161b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10161e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101621:	c9                   	leave  
  101622:	c3                   	ret    

00101623 <put_into_empty>:
  101623:	55                   	push   %ebp
  101624:	89 e5                	mov    %esp,%ebp
  101626:	83 ec 08             	sub    $0x8,%esp
  101629:	83 ec 08             	sub    $0x8,%esp
  10162c:	ff 75 08             	pushl  0x8(%ebp)
  10162f:	6a 03                	push   $0x3
  101631:	e8 fa 01 00 00       	call   101830 <put_into>
  101636:	83 c4 10             	add    $0x10,%esp
  101639:	c9                   	leave  
  10163a:	c3                   	ret    

0010163b <getpid>:
  10163b:	55                   	push   %ebp
  10163c:	89 e5                	mov    %esp,%ebp
  10163e:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  101643:	5d                   	pop    %ebp
  101644:	c3                   	ret    

00101645 <getrunnable>:
  101645:	55                   	push   %ebp
  101646:	89 e5                	mov    %esp,%ebp
  101648:	a1 38 41 10 00       	mov    0x104138,%eax
  10164d:	5d                   	pop    %ebp
  10164e:	c3                   	ret    

0010164f <getblocked>:
  10164f:	55                   	push   %ebp
  101650:	89 e5                	mov    %esp,%ebp
  101652:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101657:	5d                   	pop    %ebp
  101658:	c3                   	ret    

00101659 <get_from_runnable>:
  101659:	55                   	push   %ebp
  10165a:	89 e5                	mov    %esp,%ebp
  10165c:	83 ec 08             	sub    $0x8,%esp
  10165f:	8b 15 38 41 10 00    	mov    0x104138,%edx
  101665:	a1 38 41 10 00       	mov    0x104138,%eax
  10166a:	83 ec 08             	sub    $0x8,%esp
  10166d:	52                   	push   %edx
  10166e:	50                   	push   %eax
  10166f:	e8 c5 03 00 00       	call   101a39 <get_from>
  101674:	83 c4 10             	add    $0x10,%esp
  101677:	c9                   	leave  
  101678:	c3                   	ret    

00101679 <put_into_runnable>:
  101679:	55                   	push   %ebp
  10167a:	89 e5                	mov    %esp,%ebp
  10167c:	57                   	push   %edi
  10167d:	56                   	push   %esi
  10167e:	53                   	push   %ebx
  10167f:	83 ec 0c             	sub    $0xc,%esp
  101682:	8b 55 08             	mov    0x8(%ebp),%edx
  101685:	89 d0                	mov    %edx,%eax
  101687:	c1 e0 07             	shl    $0x7,%eax
  10168a:	01 d0                	add    %edx,%eax
  10168c:	01 c0                	add    %eax,%eax
  10168e:	01 d0                	add    %edx,%eax
  101690:	01 c0                	add    %eax,%eax
  101692:	01 d0                	add    %edx,%eax
  101694:	c1 e0 04             	shl    $0x4,%eax
  101697:	8d 90 00 6b 10 00    	lea    0x106b00(%eax),%edx
  10169d:	8b 45 0c             	mov    0xc(%ebp),%eax
  1016a0:	89 c3                	mov    %eax,%ebx
  1016a2:	b8 13 00 00 00       	mov    $0x13,%eax
  1016a7:	89 d7                	mov    %edx,%edi
  1016a9:	89 de                	mov    %ebx,%esi
  1016ab:	89 c1                	mov    %eax,%ecx
  1016ad:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1016af:	8b 0d e8 4a 10 00    	mov    0x104ae8,%ecx
  1016b5:	8b 55 08             	mov    0x8(%ebp),%edx
  1016b8:	89 d0                	mov    %edx,%eax
  1016ba:	c1 e0 07             	shl    $0x7,%eax
  1016bd:	01 d0                	add    %edx,%eax
  1016bf:	01 c0                	add    %eax,%eax
  1016c1:	01 d0                	add    %edx,%eax
  1016c3:	01 c0                	add    %eax,%eax
  1016c5:	01 d0                	add    %edx,%eax
  1016c7:	c1 e0 04             	shl    $0x4,%eax
  1016ca:	05 50 6b 10 00       	add    $0x106b50,%eax
  1016cf:	89 08                	mov    %ecx,(%eax)
  1016d1:	8b 55 08             	mov    0x8(%ebp),%edx
  1016d4:	89 d0                	mov    %edx,%eax
  1016d6:	c1 e0 07             	shl    $0x7,%eax
  1016d9:	01 d0                	add    %edx,%eax
  1016db:	01 c0                	add    %eax,%eax
  1016dd:	01 d0                	add    %edx,%eax
  1016df:	01 c0                	add    %eax,%eax
  1016e1:	01 d0                	add    %edx,%eax
  1016e3:	c1 e0 04             	shl    $0x4,%eax
  1016e6:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  1016eb:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  1016f1:	83 ec 08             	sub    $0x8,%esp
  1016f4:	ff 75 08             	pushl  0x8(%ebp)
  1016f7:	6a 01                	push   $0x1
  1016f9:	e8 32 01 00 00       	call   101830 <put_into>
  1016fe:	83 c4 10             	add    $0x10,%esp
  101701:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101704:	5b                   	pop    %ebx
  101705:	5e                   	pop    %esi
  101706:	5f                   	pop    %edi
  101707:	5d                   	pop    %ebp
  101708:	c3                   	ret    

00101709 <check_block>:
  101709:	55                   	push   %ebp
  10170a:	89 e5                	mov    %esp,%ebp
  10170c:	83 ec 18             	sub    $0x18,%esp
  10170f:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101714:	83 f8 ff             	cmp    $0xffffffff,%eax
  101717:	75 0a                	jne    101723 <check_block+0x1a>
  101719:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10171e:	e9 0b 01 00 00       	jmp    10182e <check_block+0x125>
  101723:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101728:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10172b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  101732:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101735:	89 d0                	mov    %edx,%eax
  101737:	c1 e0 07             	shl    $0x7,%eax
  10173a:	01 d0                	add    %edx,%eax
  10173c:	01 c0                	add    %eax,%eax
  10173e:	01 d0                	add    %edx,%eax
  101740:	01 c0                	add    %eax,%eax
  101742:	01 d0                	add    %edx,%eax
  101744:	c1 e0 04             	shl    $0x4,%eax
  101747:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  10174c:	8b 00                	mov    (%eax),%eax
  10174e:	85 c0                	test   %eax,%eax
  101750:	0f 85 9c 00 00 00    	jne    1017f2 <check_block+0xe9>
  101756:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101759:	89 d0                	mov    %edx,%eax
  10175b:	c1 e0 07             	shl    $0x7,%eax
  10175e:	01 d0                	add    %edx,%eax
  101760:	01 c0                	add    %eax,%eax
  101762:	01 d0                	add    %edx,%eax
  101764:	01 c0                	add    %eax,%eax
  101766:	01 d0                	add    %edx,%eax
  101768:	c1 e0 04             	shl    $0x4,%eax
  10176b:	05 54 6b 10 00       	add    $0x106b54,%eax
  101770:	8b 00                	mov    (%eax),%eax
  101772:	85 c0                	test   %eax,%eax
  101774:	7f 7c                	jg     1017f2 <check_block+0xe9>
  101776:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101779:	89 d0                	mov    %edx,%eax
  10177b:	c1 e0 07             	shl    $0x7,%eax
  10177e:	01 d0                	add    %edx,%eax
  101780:	01 c0                	add    %eax,%eax
  101782:	01 d0                	add    %edx,%eax
  101784:	01 c0                	add    %eax,%eax
  101786:	01 d0                	add    %edx,%eax
  101788:	c1 e0 04             	shl    $0x4,%eax
  10178b:	05 60 6b 10 00       	add    $0x106b60,%eax
  101790:	8b 00                	mov    (%eax),%eax
  101792:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101795:	83 ec 0c             	sub    $0xc,%esp
  101798:	ff 75 f4             	pushl  -0xc(%ebp)
  10179b:	e8 6b 04 00 00       	call   101c0b <get_from_block>
  1017a0:	83 c4 10             	add    $0x10,%esp
  1017a3:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1017a6:	89 d0                	mov    %edx,%eax
  1017a8:	c1 e0 07             	shl    $0x7,%eax
  1017ab:	01 d0                	add    %edx,%eax
  1017ad:	01 c0                	add    %eax,%eax
  1017af:	01 d0                	add    %edx,%eax
  1017b1:	01 c0                	add    %eax,%eax
  1017b3:	01 d0                	add    %edx,%eax
  1017b5:	c1 e0 04             	shl    $0x4,%eax
  1017b8:	05 00 20 00 00       	add    $0x2000,%eax
  1017bd:	05 00 4b 10 00       	add    $0x104b00,%eax
  1017c2:	83 ec 08             	sub    $0x8,%esp
  1017c5:	50                   	push   %eax
  1017c6:	ff 75 f4             	pushl  -0xc(%ebp)
  1017c9:	e8 ab fe ff ff       	call   101679 <put_into_runnable>
  1017ce:	83 c4 10             	add    $0x10,%esp
  1017d1:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1017d4:	89 d0                	mov    %edx,%eax
  1017d6:	c1 e0 07             	shl    $0x7,%eax
  1017d9:	01 d0                	add    %edx,%eax
  1017db:	01 c0                	add    %eax,%eax
  1017dd:	01 d0                	add    %edx,%eax
  1017df:	01 c0                	add    %eax,%eax
  1017e1:	01 d0                	add    %edx,%eax
  1017e3:	c1 e0 04             	shl    $0x4,%eax
  1017e6:	05 60 6b 10 00       	add    $0x106b60,%eax
  1017eb:	8b 00                	mov    (%eax),%eax
  1017ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1017f0:	eb 1f                	jmp    101811 <check_block+0x108>
  1017f2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1017f5:	89 d0                	mov    %edx,%eax
  1017f7:	c1 e0 07             	shl    $0x7,%eax
  1017fa:	01 d0                	add    %edx,%eax
  1017fc:	01 c0                	add    %eax,%eax
  1017fe:	01 d0                	add    %edx,%eax
  101800:	01 c0                	add    %eax,%eax
  101802:	01 d0                	add    %edx,%eax
  101804:	c1 e0 04             	shl    $0x4,%eax
  101807:	05 60 6b 10 00       	add    $0x106b60,%eax
  10180c:	8b 00                	mov    (%eax),%eax
  10180e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101811:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101816:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  101819:	74 0e                	je     101829 <check_block+0x120>
  10181b:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101820:	83 f8 ff             	cmp    $0xffffffff,%eax
  101823:	0f 85 09 ff ff ff    	jne    101732 <check_block+0x29>
  101829:	b8 01 00 00 00       	mov    $0x1,%eax
  10182e:	c9                   	leave  
  10182f:	c3                   	ret    

00101830 <put_into>:
  101830:	55                   	push   %ebp
  101831:	89 e5                	mov    %esp,%ebp
  101833:	83 ec 18             	sub    $0x18,%esp
  101836:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10183d:	8b 45 08             	mov    0x8(%ebp),%eax
  101840:	83 f8 01             	cmp    $0x1,%eax
  101843:	74 14                	je     101859 <put_into+0x29>
  101845:	83 f8 03             	cmp    $0x3,%eax
  101848:	74 06                	je     101850 <put_into+0x20>
  10184a:	85 c0                	test   %eax,%eax
  10184c:	74 14                	je     101862 <put_into+0x32>
  10184e:	eb 1b                	jmp    10186b <put_into+0x3b>
  101850:	c7 45 f4 58 42 10 00 	movl   $0x104258,-0xc(%ebp)
  101857:	eb 2e                	jmp    101887 <put_into+0x57>
  101859:	c7 45 f4 38 41 10 00 	movl   $0x104138,-0xc(%ebp)
  101860:	eb 25                	jmp    101887 <put_into+0x57>
  101862:	c7 45 f4 3c 41 10 00 	movl   $0x10413c,-0xc(%ebp)
  101869:	eb 1c                	jmp    101887 <put_into+0x57>
  10186b:	83 ec 08             	sub    $0x8,%esp
  10186e:	6a 62                	push   $0x62
  101870:	68 50 2f 10 00       	push   $0x102f50
  101875:	e8 ce 15 00 00       	call   102e48 <abort>
  10187a:	83 c4 10             	add    $0x10,%esp
  10187d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101882:	e9 1e 01 00 00       	jmp    1019a5 <put_into+0x175>
  101887:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10188a:	8b 00                	mov    (%eax),%eax
  10188c:	83 f8 ff             	cmp    $0xffffffff,%eax
  10188f:	75 57                	jne    1018e8 <put_into+0xb8>
  101891:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101894:	8b 55 0c             	mov    0xc(%ebp),%edx
  101897:	89 10                	mov    %edx,(%eax)
  101899:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10189c:	8b 10                	mov    (%eax),%edx
  10189e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018a1:	8b 00                	mov    (%eax),%eax
  1018a3:	89 c1                	mov    %eax,%ecx
  1018a5:	89 d0                	mov    %edx,%eax
  1018a7:	c1 e0 07             	shl    $0x7,%eax
  1018aa:	01 d0                	add    %edx,%eax
  1018ac:	01 c0                	add    %eax,%eax
  1018ae:	01 d0                	add    %edx,%eax
  1018b0:	01 c0                	add    %eax,%eax
  1018b2:	01 d0                	add    %edx,%eax
  1018b4:	c1 e0 04             	shl    $0x4,%eax
  1018b7:	05 60 6b 10 00       	add    $0x106b60,%eax
  1018bc:	89 08                	mov    %ecx,(%eax)
  1018be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018c1:	8b 10                	mov    (%eax),%edx
  1018c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018c6:	8b 00                	mov    (%eax),%eax
  1018c8:	89 c1                	mov    %eax,%ecx
  1018ca:	89 d0                	mov    %edx,%eax
  1018cc:	c1 e0 07             	shl    $0x7,%eax
  1018cf:	01 d0                	add    %edx,%eax
  1018d1:	01 c0                	add    %eax,%eax
  1018d3:	01 d0                	add    %edx,%eax
  1018d5:	01 c0                	add    %eax,%eax
  1018d7:	01 d0                	add    %edx,%eax
  1018d9:	c1 e0 04             	shl    $0x4,%eax
  1018dc:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  1018e1:	89 08                	mov    %ecx,(%eax)
  1018e3:	e9 b8 00 00 00       	jmp    1019a0 <put_into+0x170>
  1018e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018eb:	8b 10                	mov    (%eax),%edx
  1018ed:	89 d0                	mov    %edx,%eax
  1018ef:	c1 e0 07             	shl    $0x7,%eax
  1018f2:	01 d0                	add    %edx,%eax
  1018f4:	01 c0                	add    %eax,%eax
  1018f6:	01 d0                	add    %edx,%eax
  1018f8:	01 c0                	add    %eax,%eax
  1018fa:	01 d0                	add    %edx,%eax
  1018fc:	c1 e0 04             	shl    $0x4,%eax
  1018ff:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  101904:	8b 10                	mov    (%eax),%edx
  101906:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  101909:	89 d0                	mov    %edx,%eax
  10190b:	c1 e0 07             	shl    $0x7,%eax
  10190e:	01 d0                	add    %edx,%eax
  101910:	01 c0                	add    %eax,%eax
  101912:	01 d0                	add    %edx,%eax
  101914:	01 c0                	add    %eax,%eax
  101916:	01 d0                	add    %edx,%eax
  101918:	c1 e0 04             	shl    $0x4,%eax
  10191b:	05 60 6b 10 00       	add    $0x106b60,%eax
  101920:	89 08                	mov    %ecx,(%eax)
  101922:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101925:	8b 10                	mov    (%eax),%edx
  101927:	89 d0                	mov    %edx,%eax
  101929:	c1 e0 07             	shl    $0x7,%eax
  10192c:	01 d0                	add    %edx,%eax
  10192e:	01 c0                	add    %eax,%eax
  101930:	01 d0                	add    %edx,%eax
  101932:	01 c0                	add    %eax,%eax
  101934:	01 d0                	add    %edx,%eax
  101936:	c1 e0 04             	shl    $0x4,%eax
  101939:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  10193e:	8b 08                	mov    (%eax),%ecx
  101940:	8b 55 0c             	mov    0xc(%ebp),%edx
  101943:	89 d0                	mov    %edx,%eax
  101945:	c1 e0 07             	shl    $0x7,%eax
  101948:	01 d0                	add    %edx,%eax
  10194a:	01 c0                	add    %eax,%eax
  10194c:	01 d0                	add    %edx,%eax
  10194e:	01 c0                	add    %eax,%eax
  101950:	01 d0                	add    %edx,%eax
  101952:	c1 e0 04             	shl    $0x4,%eax
  101955:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  10195a:	89 08                	mov    %ecx,(%eax)
  10195c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10195f:	8b 00                	mov    (%eax),%eax
  101961:	89 c1                	mov    %eax,%ecx
  101963:	8b 55 0c             	mov    0xc(%ebp),%edx
  101966:	89 d0                	mov    %edx,%eax
  101968:	c1 e0 07             	shl    $0x7,%eax
  10196b:	01 d0                	add    %edx,%eax
  10196d:	01 c0                	add    %eax,%eax
  10196f:	01 d0                	add    %edx,%eax
  101971:	01 c0                	add    %eax,%eax
  101973:	01 d0                	add    %edx,%eax
  101975:	c1 e0 04             	shl    $0x4,%eax
  101978:	05 60 6b 10 00       	add    $0x106b60,%eax
  10197d:	89 08                	mov    %ecx,(%eax)
  10197f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101982:	8b 10                	mov    (%eax),%edx
  101984:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  101987:	89 d0                	mov    %edx,%eax
  101989:	c1 e0 07             	shl    $0x7,%eax
  10198c:	01 d0                	add    %edx,%eax
  10198e:	01 c0                	add    %eax,%eax
  101990:	01 d0                	add    %edx,%eax
  101992:	01 c0                	add    %eax,%eax
  101994:	01 d0                	add    %edx,%eax
  101996:	c1 e0 04             	shl    $0x4,%eax
  101999:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  10199e:	89 08                	mov    %ecx,(%eax)
  1019a0:	b8 01 00 00 00       	mov    $0x1,%eax
  1019a5:	c9                   	leave  
  1019a6:	c3                   	ret    

001019a7 <put_into_block>:
  1019a7:	55                   	push   %ebp
  1019a8:	89 e5                	mov    %esp,%ebp
  1019aa:	57                   	push   %edi
  1019ab:	56                   	push   %esi
  1019ac:	53                   	push   %ebx
  1019ad:	83 ec 0c             	sub    $0xc,%esp
  1019b0:	8b 55 08             	mov    0x8(%ebp),%edx
  1019b3:	89 d0                	mov    %edx,%eax
  1019b5:	c1 e0 07             	shl    $0x7,%eax
  1019b8:	01 d0                	add    %edx,%eax
  1019ba:	01 c0                	add    %eax,%eax
  1019bc:	01 d0                	add    %edx,%eax
  1019be:	01 c0                	add    %eax,%eax
  1019c0:	01 d0                	add    %edx,%eax
  1019c2:	c1 e0 04             	shl    $0x4,%eax
  1019c5:	8d 90 00 6b 10 00    	lea    0x106b00(%eax),%edx
  1019cb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1019ce:	89 c3                	mov    %eax,%ebx
  1019d0:	b8 13 00 00 00       	mov    $0x13,%eax
  1019d5:	89 d7                	mov    %edx,%edi
  1019d7:	89 de                	mov    %ebx,%esi
  1019d9:	89 c1                	mov    %eax,%ecx
  1019db:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1019dd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1019e0:	8b 40 20             	mov    0x20(%eax),%eax
  1019e3:	89 c1                	mov    %eax,%ecx
  1019e5:	8b 55 08             	mov    0x8(%ebp),%edx
  1019e8:	89 d0                	mov    %edx,%eax
  1019ea:	c1 e0 07             	shl    $0x7,%eax
  1019ed:	01 d0                	add    %edx,%eax
  1019ef:	01 c0                	add    %eax,%eax
  1019f1:	01 d0                	add    %edx,%eax
  1019f3:	01 c0                	add    %eax,%eax
  1019f5:	01 d0                	add    %edx,%eax
  1019f7:	c1 e0 04             	shl    $0x4,%eax
  1019fa:	05 54 6b 10 00       	add    $0x106b54,%eax
  1019ff:	89 08                	mov    %ecx,(%eax)
  101a01:	8b 55 08             	mov    0x8(%ebp),%edx
  101a04:	89 d0                	mov    %edx,%eax
  101a06:	c1 e0 07             	shl    $0x7,%eax
  101a09:	01 d0                	add    %edx,%eax
  101a0b:	01 c0                	add    %eax,%eax
  101a0d:	01 d0                	add    %edx,%eax
  101a0f:	01 c0                	add    %eax,%eax
  101a11:	01 d0                	add    %edx,%eax
  101a13:	c1 e0 04             	shl    $0x4,%eax
  101a16:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  101a1b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  101a21:	83 ec 08             	sub    $0x8,%esp
  101a24:	ff 75 08             	pushl  0x8(%ebp)
  101a27:	6a 00                	push   $0x0
  101a29:	e8 02 fe ff ff       	call   101830 <put_into>
  101a2e:	83 c4 10             	add    $0x10,%esp
  101a31:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101a34:	5b                   	pop    %ebx
  101a35:	5e                   	pop    %esi
  101a36:	5f                   	pop    %edi
  101a37:	5d                   	pop    %ebp
  101a38:	c3                   	ret    

00101a39 <get_from>:
  101a39:	55                   	push   %ebp
  101a3a:	89 e5                	mov    %esp,%ebp
  101a3c:	83 ec 18             	sub    $0x18,%esp
  101a3f:	83 ec 08             	sub    $0x8,%esp
  101a42:	ff 75 0c             	pushl  0xc(%ebp)
  101a45:	ff 75 08             	pushl  0x8(%ebp)
  101a48:	e8 f9 01 00 00       	call   101c46 <check_is_in>
  101a4d:	83 c4 10             	add    $0x10,%esp
  101a50:	83 f8 01             	cmp    $0x1,%eax
  101a53:	74 64                	je     101ab9 <get_from+0x80>
  101a55:	83 ec 0c             	sub    $0xc,%esp
  101a58:	68 5e 2f 10 00       	push   $0x102f5e
  101a5d:	e8 2a 11 00 00       	call   102b8c <printk>
  101a62:	83 c4 10             	add    $0x10,%esp
  101a65:	83 ec 08             	sub    $0x8,%esp
  101a68:	ff 75 0c             	pushl  0xc(%ebp)
  101a6b:	ff 75 08             	pushl  0x8(%ebp)
  101a6e:	68 90 2f 10 00       	push   $0x102f90
  101a73:	68 82 00 00 00       	push   $0x82
  101a78:	68 50 2f 10 00       	push   $0x102f50
  101a7d:	68 64 2f 10 00       	push   $0x102f64
  101a82:	e8 05 11 00 00       	call   102b8c <printk>
  101a87:	83 c4 20             	add    $0x20,%esp
  101a8a:	83 ec 0c             	sub    $0xc,%esp
  101a8d:	68 88 2f 10 00       	push   $0x102f88
  101a92:	e8 f5 10 00 00       	call   102b8c <printk>
  101a97:	83 c4 10             	add    $0x10,%esp
  101a9a:	83 ec 08             	sub    $0x8,%esp
  101a9d:	68 83 00 00 00       	push   $0x83
  101aa2:	68 50 2f 10 00       	push   $0x102f50
  101aa7:	e8 9c 13 00 00       	call   102e48 <abort>
  101aac:	83 c4 10             	add    $0x10,%esp
  101aaf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101ab4:	e9 50 01 00 00       	jmp    101c09 <get_from+0x1d0>
  101ab9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101ac0:	8b 55 0c             	mov    0xc(%ebp),%edx
  101ac3:	89 d0                	mov    %edx,%eax
  101ac5:	c1 e0 07             	shl    $0x7,%eax
  101ac8:	01 d0                	add    %edx,%eax
  101aca:	01 c0                	add    %eax,%eax
  101acc:	01 d0                	add    %edx,%eax
  101ace:	01 c0                	add    %eax,%eax
  101ad0:	01 d0                	add    %edx,%eax
  101ad2:	c1 e0 04             	shl    $0x4,%eax
  101ad5:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  101ada:	8b 00                	mov    (%eax),%eax
  101adc:	83 f8 01             	cmp    $0x1,%eax
  101adf:	74 14                	je     101af5 <get_from+0xbc>
  101ae1:	83 f8 03             	cmp    $0x3,%eax
  101ae4:	74 06                	je     101aec <get_from+0xb3>
  101ae6:	85 c0                	test   %eax,%eax
  101ae8:	74 14                	je     101afe <get_from+0xc5>
  101aea:	eb 1b                	jmp    101b07 <get_from+0xce>
  101aec:	c7 45 f4 58 42 10 00 	movl   $0x104258,-0xc(%ebp)
  101af3:	eb 27                	jmp    101b1c <get_from+0xe3>
  101af5:	c7 45 f4 38 41 10 00 	movl   $0x104138,-0xc(%ebp)
  101afc:	eb 1e                	jmp    101b1c <get_from+0xe3>
  101afe:	c7 45 f4 3c 41 10 00 	movl   $0x10413c,-0xc(%ebp)
  101b05:	eb 15                	jmp    101b1c <get_from+0xe3>
  101b07:	83 ec 08             	sub    $0x8,%esp
  101b0a:	68 95 00 00 00       	push   $0x95
  101b0f:	68 50 2f 10 00       	push   $0x102f50
  101b14:	e8 2f 13 00 00       	call   102e48 <abort>
  101b19:	83 c4 10             	add    $0x10,%esp
  101b1c:	8b 45 08             	mov    0x8(%ebp),%eax
  101b1f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101b22:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b25:	8b 00                	mov    (%eax),%eax
  101b27:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  101b2a:	74 15                	je     101b41 <get_from+0x108>
  101b2c:	83 ec 08             	sub    $0x8,%esp
  101b2f:	68 9a 00 00 00       	push   $0x9a
  101b34:	68 50 2f 10 00       	push   $0x102f50
  101b39:	e8 0a 13 00 00       	call   102e48 <abort>
  101b3e:	83 c4 10             	add    $0x10,%esp
  101b41:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  101b45:	75 0a                	jne    101b51 <get_from+0x118>
  101b47:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101b4c:	e9 b8 00 00 00       	jmp    101c09 <get_from+0x1d0>
  101b51:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101b54:	89 d0                	mov    %edx,%eax
  101b56:	c1 e0 07             	shl    $0x7,%eax
  101b59:	01 d0                	add    %edx,%eax
  101b5b:	01 c0                	add    %eax,%eax
  101b5d:	01 d0                	add    %edx,%eax
  101b5f:	01 c0                	add    %eax,%eax
  101b61:	01 d0                	add    %edx,%eax
  101b63:	c1 e0 04             	shl    $0x4,%eax
  101b66:	05 60 6b 10 00       	add    $0x106b60,%eax
  101b6b:	8b 10                	mov    (%eax),%edx
  101b6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101b70:	39 c2                	cmp    %eax,%edx
  101b72:	75 0e                	jne    101b82 <get_from+0x149>
  101b74:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b77:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
  101b7d:	e9 84 00 00 00       	jmp    101c06 <get_from+0x1cd>
  101b82:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101b85:	89 d0                	mov    %edx,%eax
  101b87:	c1 e0 07             	shl    $0x7,%eax
  101b8a:	01 d0                	add    %edx,%eax
  101b8c:	01 c0                	add    %eax,%eax
  101b8e:	01 d0                	add    %edx,%eax
  101b90:	01 c0                	add    %eax,%eax
  101b92:	01 d0                	add    %edx,%eax
  101b94:	c1 e0 04             	shl    $0x4,%eax
  101b97:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  101b9c:	8b 00                	mov    (%eax),%eax
  101b9e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  101ba1:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101ba4:	89 d0                	mov    %edx,%eax
  101ba6:	c1 e0 07             	shl    $0x7,%eax
  101ba9:	01 d0                	add    %edx,%eax
  101bab:	01 c0                	add    %eax,%eax
  101bad:	01 d0                	add    %edx,%eax
  101baf:	01 c0                	add    %eax,%eax
  101bb1:	01 d0                	add    %edx,%eax
  101bb3:	c1 e0 04             	shl    $0x4,%eax
  101bb6:	05 60 6b 10 00       	add    $0x106b60,%eax
  101bbb:	8b 00                	mov    (%eax),%eax
  101bbd:	89 45 e8             	mov    %eax,-0x18(%ebp)
  101bc0:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  101bc3:	8b 55 ec             	mov    -0x14(%ebp),%edx
  101bc6:	89 d0                	mov    %edx,%eax
  101bc8:	c1 e0 07             	shl    $0x7,%eax
  101bcb:	01 d0                	add    %edx,%eax
  101bcd:	01 c0                	add    %eax,%eax
  101bcf:	01 d0                	add    %edx,%eax
  101bd1:	01 c0                	add    %eax,%eax
  101bd3:	01 d0                	add    %edx,%eax
  101bd5:	c1 e0 04             	shl    $0x4,%eax
  101bd8:	05 60 6b 10 00       	add    $0x106b60,%eax
  101bdd:	89 08                	mov    %ecx,(%eax)
  101bdf:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  101be2:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101be5:	89 d0                	mov    %edx,%eax
  101be7:	c1 e0 07             	shl    $0x7,%eax
  101bea:	01 d0                	add    %edx,%eax
  101bec:	01 c0                	add    %eax,%eax
  101bee:	01 d0                	add    %edx,%eax
  101bf0:	01 c0                	add    %eax,%eax
  101bf2:	01 d0                	add    %edx,%eax
  101bf4:	c1 e0 04             	shl    $0x4,%eax
  101bf7:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  101bfc:	89 08                	mov    %ecx,(%eax)
  101bfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c01:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101c04:	89 10                	mov    %edx,(%eax)
  101c06:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101c09:	c9                   	leave  
  101c0a:	c3                   	ret    

00101c0b <get_from_block>:
  101c0b:	55                   	push   %ebp
  101c0c:	89 e5                	mov    %esp,%ebp
  101c0e:	83 ec 08             	sub    $0x8,%esp
  101c11:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101c16:	83 ec 08             	sub    $0x8,%esp
  101c19:	ff 75 08             	pushl  0x8(%ebp)
  101c1c:	50                   	push   %eax
  101c1d:	e8 17 fe ff ff       	call   101a39 <get_from>
  101c22:	83 c4 10             	add    $0x10,%esp
  101c25:	83 f8 ff             	cmp    $0xffffffff,%eax
  101c28:	75 15                	jne    101c3f <get_from_block+0x34>
  101c2a:	83 ec 08             	sub    $0x8,%esp
  101c2d:	68 b1 00 00 00       	push   $0xb1
  101c32:	68 50 2f 10 00       	push   $0x102f50
  101c37:	e8 0c 12 00 00       	call   102e48 <abort>
  101c3c:	83 c4 10             	add    $0x10,%esp
  101c3f:	b8 01 00 00 00       	mov    $0x1,%eax
  101c44:	c9                   	leave  
  101c45:	c3                   	ret    

00101c46 <check_is_in>:
  101c46:	55                   	push   %ebp
  101c47:	89 e5                	mov    %esp,%ebp
  101c49:	83 ec 10             	sub    $0x10,%esp
  101c4c:	8b 45 08             	mov    0x8(%ebp),%eax
  101c4f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101c52:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101c55:	3b 45 0c             	cmp    0xc(%ebp),%eax
  101c58:	75 07                	jne    101c61 <check_is_in+0x1b>
  101c5a:	b8 01 00 00 00       	mov    $0x1,%eax
  101c5f:	eb 2c                	jmp    101c8d <check_is_in+0x47>
  101c61:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101c64:	89 d0                	mov    %edx,%eax
  101c66:	c1 e0 07             	shl    $0x7,%eax
  101c69:	01 d0                	add    %edx,%eax
  101c6b:	01 c0                	add    %eax,%eax
  101c6d:	01 d0                	add    %edx,%eax
  101c6f:	01 c0                	add    %eax,%eax
  101c71:	01 d0                	add    %edx,%eax
  101c73:	c1 e0 04             	shl    $0x4,%eax
  101c76:	05 60 6b 10 00       	add    $0x106b60,%eax
  101c7b:	8b 00                	mov    (%eax),%eax
  101c7d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101c80:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101c83:	3b 45 08             	cmp    0x8(%ebp),%eax
  101c86:	75 ca                	jne    101c52 <check_is_in+0xc>
  101c88:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101c8d:	c9                   	leave  
  101c8e:	c3                   	ret    

00101c8f <block_decrease>:
  101c8f:	55                   	push   %ebp
  101c90:	89 e5                	mov    %esp,%ebp
  101c92:	83 ec 10             	sub    $0x10,%esp
  101c95:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101c9a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101c9d:	83 7d fc ff          	cmpl   $0xffffffff,-0x4(%ebp)
  101ca1:	75 07                	jne    101caa <block_decrease+0x1b>
  101ca3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101ca8:	eb 69                	jmp    101d13 <block_decrease+0x84>
  101caa:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101cad:	89 d0                	mov    %edx,%eax
  101caf:	c1 e0 07             	shl    $0x7,%eax
  101cb2:	01 d0                	add    %edx,%eax
  101cb4:	01 c0                	add    %eax,%eax
  101cb6:	01 d0                	add    %edx,%eax
  101cb8:	01 c0                	add    %eax,%eax
  101cba:	01 d0                	add    %edx,%eax
  101cbc:	c1 e0 04             	shl    $0x4,%eax
  101cbf:	05 54 6b 10 00       	add    $0x106b54,%eax
  101cc4:	8b 00                	mov    (%eax),%eax
  101cc6:	8d 48 ff             	lea    -0x1(%eax),%ecx
  101cc9:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101ccc:	89 d0                	mov    %edx,%eax
  101cce:	c1 e0 07             	shl    $0x7,%eax
  101cd1:	01 d0                	add    %edx,%eax
  101cd3:	01 c0                	add    %eax,%eax
  101cd5:	01 d0                	add    %edx,%eax
  101cd7:	01 c0                	add    %eax,%eax
  101cd9:	01 d0                	add    %edx,%eax
  101cdb:	c1 e0 04             	shl    $0x4,%eax
  101cde:	05 54 6b 10 00       	add    $0x106b54,%eax
  101ce3:	89 08                	mov    %ecx,(%eax)
  101ce5:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101ce8:	89 d0                	mov    %edx,%eax
  101cea:	c1 e0 07             	shl    $0x7,%eax
  101ced:	01 d0                	add    %edx,%eax
  101cef:	01 c0                	add    %eax,%eax
  101cf1:	01 d0                	add    %edx,%eax
  101cf3:	01 c0                	add    %eax,%eax
  101cf5:	01 d0                	add    %edx,%eax
  101cf7:	c1 e0 04             	shl    $0x4,%eax
  101cfa:	05 60 6b 10 00       	add    $0x106b60,%eax
  101cff:	8b 00                	mov    (%eax),%eax
  101d01:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101d04:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101d09:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  101d0c:	75 9c                	jne    101caa <block_decrease+0x1b>
  101d0e:	b8 01 00 00 00       	mov    $0x1,%eax
  101d13:	c9                   	leave  
  101d14:	c3                   	ret    

00101d15 <init_pcb>:
  101d15:	55                   	push   %ebp
  101d16:	89 e5                	mov    %esp,%ebp
  101d18:	83 ec 10             	sub    $0x10,%esp
  101d1b:	c7 05 e8 4a 10 00 05 	movl   $0x5,0x104ae8
  101d22:	00 00 00 
  101d25:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101d2c:	e9 86 00 00 00       	jmp    101db7 <init_pcb+0xa2>
  101d31:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  101d34:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101d37:	89 d0                	mov    %edx,%eax
  101d39:	c1 e0 07             	shl    $0x7,%eax
  101d3c:	01 d0                	add    %edx,%eax
  101d3e:	01 c0                	add    %eax,%eax
  101d40:	01 d0                	add    %edx,%eax
  101d42:	01 c0                	add    %eax,%eax
  101d44:	01 d0                	add    %edx,%eax
  101d46:	c1 e0 04             	shl    $0x4,%eax
  101d49:	05 58 6b 10 00       	add    $0x106b58,%eax
  101d4e:	89 08                	mov    %ecx,(%eax)
  101d50:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101d53:	48                   	dec    %eax
  101d54:	89 c1                	mov    %eax,%ecx
  101d56:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101d59:	89 d0                	mov    %edx,%eax
  101d5b:	c1 e0 07             	shl    $0x7,%eax
  101d5e:	01 d0                	add    %edx,%eax
  101d60:	01 c0                	add    %eax,%eax
  101d62:	01 d0                	add    %edx,%eax
  101d64:	01 c0                	add    %eax,%eax
  101d66:	01 d0                	add    %edx,%eax
  101d68:	c1 e0 04             	shl    $0x4,%eax
  101d6b:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  101d70:	89 08                	mov    %ecx,(%eax)
  101d72:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101d75:	40                   	inc    %eax
  101d76:	89 c1                	mov    %eax,%ecx
  101d78:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101d7b:	89 d0                	mov    %edx,%eax
  101d7d:	c1 e0 07             	shl    $0x7,%eax
  101d80:	01 d0                	add    %edx,%eax
  101d82:	01 c0                	add    %eax,%eax
  101d84:	01 d0                	add    %edx,%eax
  101d86:	01 c0                	add    %eax,%eax
  101d88:	01 d0                	add    %edx,%eax
  101d8a:	c1 e0 04             	shl    $0x4,%eax
  101d8d:	05 60 6b 10 00       	add    $0x106b60,%eax
  101d92:	89 08                	mov    %ecx,(%eax)
  101d94:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101d97:	89 d0                	mov    %edx,%eax
  101d99:	c1 e0 07             	shl    $0x7,%eax
  101d9c:	01 d0                	add    %edx,%eax
  101d9e:	01 c0                	add    %eax,%eax
  101da0:	01 d0                	add    %edx,%eax
  101da2:	01 c0                	add    %eax,%eax
  101da4:	01 d0                	add    %edx,%eax
  101da6:	c1 e0 04             	shl    $0x4,%eax
  101da9:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  101dae:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  101db4:	ff 45 fc             	incl   -0x4(%ebp)
  101db7:	81 7d fc ff 07 00 00 	cmpl   $0x7ff,-0x4(%ebp)
  101dbe:	0f 8e 6d ff ff ff    	jle    101d31 <init_pcb+0x1c>
  101dc4:	c7 05 5c 6b 10 00 ff 	movl   $0x7ff,0x106b5c
  101dcb:	07 00 00 
  101dce:	c7 05 f0 ca 13 01 00 	movl   $0x0,0x113caf0
  101dd5:	00 00 00 
  101dd8:	90                   	nop
  101dd9:	c9                   	leave  
  101dda:	c3                   	ret    

00101ddb <init_kernel_pcb>:
  101ddb:	55                   	push   %ebp
  101ddc:	89 e5                	mov    %esp,%ebp
  101dde:	83 ec 08             	sub    $0x8,%esp
  101de1:	e8 17 f8 ff ff       	call   1015fd <apply_new_pid>
  101de6:	85 c0                	test   %eax,%eax
  101de8:	74 15                	je     101dff <init_kernel_pcb+0x24>
  101dea:	83 ec 08             	sub    $0x8,%esp
  101ded:	68 e4 00 00 00       	push   $0xe4
  101df2:	68 50 2f 10 00       	push   $0x102f50
  101df7:	e8 4c 10 00 00       	call   102e48 <abort>
  101dfc:	83 c4 10             	add    $0x10,%esp
  101dff:	c7 05 48 6b 10 00 10 	movl   $0x10,0x106b48
  101e06:	00 00 00 
  101e09:	c7 05 3c 6b 10 00 08 	movl   $0x8,0x106b3c
  101e10:	00 00 00 
  101e13:	c7 05 0c 6b 10 00 10 	movl   $0x10,0x106b0c
  101e1a:	00 00 00 
  101e1d:	c7 05 08 6b 10 00 10 	movl   $0x10,0x106b08
  101e24:	00 00 00 
  101e27:	b8 9c 15 10 00       	mov    $0x10159c,%eax
  101e2c:	a3 38 6b 10 00       	mov    %eax,0x106b38
  101e31:	c7 05 44 6b 10 00 00 	movl   $0x400000,0x106b44
  101e38:	00 40 00 
  101e3b:	c7 05 4c 6b 10 00 01 	movl   $0x1,0x106b4c
  101e42:	00 00 00 
  101e45:	c7 05 50 6b 10 00 04 	movl   $0x4,0x106b50
  101e4c:	00 00 00 
  101e4f:	b8 01 00 00 00       	mov    $0x1,%eax
  101e54:	c9                   	leave  
  101e55:	c3                   	ret    

00101e56 <make_pcb>:
  101e56:	55                   	push   %ebp
  101e57:	89 e5                	mov    %esp,%ebp
  101e59:	57                   	push   %edi
  101e5a:	56                   	push   %esi
  101e5b:	53                   	push   %ebx
  101e5c:	8b 55 08             	mov    0x8(%ebp),%edx
  101e5f:	89 d0                	mov    %edx,%eax
  101e61:	c1 e0 07             	shl    $0x7,%eax
  101e64:	01 d0                	add    %edx,%eax
  101e66:	01 c0                	add    %eax,%eax
  101e68:	01 d0                	add    %edx,%eax
  101e6a:	01 c0                	add    %eax,%eax
  101e6c:	01 d0                	add    %edx,%eax
  101e6e:	c1 e0 04             	shl    $0x4,%eax
  101e71:	8d 90 00 6b 10 00    	lea    0x106b00(%eax),%edx
  101e77:	8b 45 0c             	mov    0xc(%ebp),%eax
  101e7a:	89 c3                	mov    %eax,%ebx
  101e7c:	b8 13 00 00 00       	mov    $0x13,%eax
  101e81:	89 d7                	mov    %edx,%edi
  101e83:	89 de                	mov    %ebx,%esi
  101e85:	89 c1                	mov    %eax,%ecx
  101e87:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101e89:	8b 4d 10             	mov    0x10(%ebp),%ecx
  101e8c:	8b 55 08             	mov    0x8(%ebp),%edx
  101e8f:	89 d0                	mov    %edx,%eax
  101e91:	c1 e0 07             	shl    $0x7,%eax
  101e94:	01 d0                	add    %edx,%eax
  101e96:	01 c0                	add    %eax,%eax
  101e98:	01 d0                	add    %edx,%eax
  101e9a:	01 c0                	add    %eax,%eax
  101e9c:	01 d0                	add    %edx,%eax
  101e9e:	c1 e0 04             	shl    $0x4,%eax
  101ea1:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  101ea6:	89 08                	mov    %ecx,(%eax)
  101ea8:	8b 4d 14             	mov    0x14(%ebp),%ecx
  101eab:	8b 55 08             	mov    0x8(%ebp),%edx
  101eae:	89 d0                	mov    %edx,%eax
  101eb0:	c1 e0 07             	shl    $0x7,%eax
  101eb3:	01 d0                	add    %edx,%eax
  101eb5:	01 c0                	add    %eax,%eax
  101eb7:	01 d0                	add    %edx,%eax
  101eb9:	01 c0                	add    %eax,%eax
  101ebb:	01 d0                	add    %edx,%eax
  101ebd:	c1 e0 04             	shl    $0x4,%eax
  101ec0:	05 50 6b 10 00       	add    $0x106b50,%eax
  101ec5:	89 08                	mov    %ecx,(%eax)
  101ec7:	8b 4d 18             	mov    0x18(%ebp),%ecx
  101eca:	8b 55 08             	mov    0x8(%ebp),%edx
  101ecd:	89 d0                	mov    %edx,%eax
  101ecf:	c1 e0 07             	shl    $0x7,%eax
  101ed2:	01 d0                	add    %edx,%eax
  101ed4:	01 c0                	add    %eax,%eax
  101ed6:	01 d0                	add    %edx,%eax
  101ed8:	01 c0                	add    %eax,%eax
  101eda:	01 d0                	add    %edx,%eax
  101edc:	c1 e0 04             	shl    $0x4,%eax
  101edf:	05 54 6b 10 00       	add    $0x106b54,%eax
  101ee4:	89 08                	mov    %ecx,(%eax)
  101ee6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  101ee9:	8b 55 08             	mov    0x8(%ebp),%edx
  101eec:	89 d0                	mov    %edx,%eax
  101eee:	c1 e0 07             	shl    $0x7,%eax
  101ef1:	01 d0                	add    %edx,%eax
  101ef3:	01 c0                	add    %eax,%eax
  101ef5:	01 d0                	add    %edx,%eax
  101ef7:	01 c0                	add    %eax,%eax
  101ef9:	01 d0                	add    %edx,%eax
  101efb:	c1 e0 04             	shl    $0x4,%eax
  101efe:	05 6c 6b 10 00       	add    $0x106b6c,%eax
  101f03:	89 08                	mov    %ecx,(%eax)
  101f05:	b8 01 00 00 00       	mov    $0x1,%eax
  101f0a:	5b                   	pop    %ebx
  101f0b:	5e                   	pop    %esi
  101f0c:	5f                   	pop    %edi
  101f0d:	5d                   	pop    %ebp
  101f0e:	c3                   	ret    

00101f0f <saveIdt>:
  101f0f:	55                   	push   %ebp
  101f10:	89 e5                	mov    %esp,%ebp
  101f12:	8b 45 0c             	mov    0xc(%ebp),%eax
  101f15:	48                   	dec    %eax
  101f16:	66 a3 5c 42 10 00    	mov    %ax,0x10425c
  101f1c:	8b 45 08             	mov    0x8(%ebp),%eax
  101f1f:	66 a3 5e 42 10 00    	mov    %ax,0x10425e
  101f25:	8b 45 08             	mov    0x8(%ebp),%eax
  101f28:	c1 e8 10             	shr    $0x10,%eax
  101f2b:	66 a3 60 42 10 00    	mov    %ax,0x104260
  101f31:	b8 5c 42 10 00       	mov    $0x10425c,%eax
  101f36:	0f 01 18             	lidtl  (%eax)
  101f39:	90                   	nop
  101f3a:	5d                   	pop    %ebp
  101f3b:	c3                   	ret    

00101f3c <setIntr>:
  101f3c:	55                   	push   %ebp
  101f3d:	89 e5                	mov    %esp,%ebp
  101f3f:	8b 45 10             	mov    0x10(%ebp),%eax
  101f42:	8b 55 08             	mov    0x8(%ebp),%edx
  101f45:	66 89 02             	mov    %ax,(%edx)
  101f48:	8b 45 0c             	mov    0xc(%ebp),%eax
  101f4b:	c1 e0 03             	shl    $0x3,%eax
  101f4e:	8b 55 08             	mov    0x8(%ebp),%edx
  101f51:	66 89 42 02          	mov    %ax,0x2(%edx)
  101f55:	8b 45 08             	mov    0x8(%ebp),%eax
  101f58:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  101f5c:	8b 45 08             	mov    0x8(%ebp),%eax
  101f5f:	8a 50 05             	mov    0x5(%eax),%dl
  101f62:	83 e2 f0             	and    $0xfffffff0,%edx
  101f65:	83 ca 0e             	or     $0xe,%edx
  101f68:	88 50 05             	mov    %dl,0x5(%eax)
  101f6b:	8b 45 08             	mov    0x8(%ebp),%eax
  101f6e:	8a 50 05             	mov    0x5(%eax),%dl
  101f71:	83 e2 ef             	and    $0xffffffef,%edx
  101f74:	88 50 05             	mov    %dl,0x5(%eax)
  101f77:	8b 45 14             	mov    0x14(%ebp),%eax
  101f7a:	83 e0 03             	and    $0x3,%eax
  101f7d:	88 c2                	mov    %al,%dl
  101f7f:	8b 45 08             	mov    0x8(%ebp),%eax
  101f82:	83 e2 03             	and    $0x3,%edx
  101f85:	88 d1                	mov    %dl,%cl
  101f87:	c1 e1 05             	shl    $0x5,%ecx
  101f8a:	8a 50 05             	mov    0x5(%eax),%dl
  101f8d:	83 e2 9f             	and    $0xffffff9f,%edx
  101f90:	09 ca                	or     %ecx,%edx
  101f92:	88 50 05             	mov    %dl,0x5(%eax)
  101f95:	8b 45 08             	mov    0x8(%ebp),%eax
  101f98:	8a 50 05             	mov    0x5(%eax),%dl
  101f9b:	83 ca 80             	or     $0xffffff80,%edx
  101f9e:	88 50 05             	mov    %dl,0x5(%eax)
  101fa1:	8b 45 10             	mov    0x10(%ebp),%eax
  101fa4:	c1 e8 10             	shr    $0x10,%eax
  101fa7:	8b 55 08             	mov    0x8(%ebp),%edx
  101faa:	66 89 42 06          	mov    %ax,0x6(%edx)
  101fae:	90                   	nop
  101faf:	5d                   	pop    %ebp
  101fb0:	c3                   	ret    

00101fb1 <setTrap>:
  101fb1:	55                   	push   %ebp
  101fb2:	89 e5                	mov    %esp,%ebp
  101fb4:	8b 45 10             	mov    0x10(%ebp),%eax
  101fb7:	8b 55 08             	mov    0x8(%ebp),%edx
  101fba:	66 89 02             	mov    %ax,(%edx)
  101fbd:	8b 45 0c             	mov    0xc(%ebp),%eax
  101fc0:	c1 e0 03             	shl    $0x3,%eax
  101fc3:	8b 55 08             	mov    0x8(%ebp),%edx
  101fc6:	66 89 42 02          	mov    %ax,0x2(%edx)
  101fca:	8b 45 08             	mov    0x8(%ebp),%eax
  101fcd:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  101fd1:	8b 45 08             	mov    0x8(%ebp),%eax
  101fd4:	8a 50 05             	mov    0x5(%eax),%dl
  101fd7:	83 ca 0f             	or     $0xf,%edx
  101fda:	88 50 05             	mov    %dl,0x5(%eax)
  101fdd:	8b 45 08             	mov    0x8(%ebp),%eax
  101fe0:	8a 50 05             	mov    0x5(%eax),%dl
  101fe3:	83 e2 ef             	and    $0xffffffef,%edx
  101fe6:	88 50 05             	mov    %dl,0x5(%eax)
  101fe9:	8b 45 14             	mov    0x14(%ebp),%eax
  101fec:	83 e0 03             	and    $0x3,%eax
  101fef:	88 c2                	mov    %al,%dl
  101ff1:	8b 45 08             	mov    0x8(%ebp),%eax
  101ff4:	83 e2 03             	and    $0x3,%edx
  101ff7:	88 d1                	mov    %dl,%cl
  101ff9:	c1 e1 05             	shl    $0x5,%ecx
  101ffc:	8a 50 05             	mov    0x5(%eax),%dl
  101fff:	83 e2 9f             	and    $0xffffff9f,%edx
  102002:	09 ca                	or     %ecx,%edx
  102004:	88 50 05             	mov    %dl,0x5(%eax)
  102007:	8b 45 08             	mov    0x8(%ebp),%eax
  10200a:	8a 50 05             	mov    0x5(%eax),%dl
  10200d:	83 ca 80             	or     $0xffffff80,%edx
  102010:	88 50 05             	mov    %dl,0x5(%eax)
  102013:	8b 45 10             	mov    0x10(%ebp),%eax
  102016:	c1 e8 10             	shr    $0x10,%eax
  102019:	8b 55 08             	mov    0x8(%ebp),%edx
  10201c:	66 89 42 06          	mov    %ax,0x6(%edx)
  102020:	90                   	nop
  102021:	5d                   	pop    %ebp
  102022:	c3                   	ret    

00102023 <initIdt>:
  102023:	55                   	push   %ebp
  102024:	89 e5                	mov    %esp,%ebp
  102026:	83 ec 10             	sub    $0x10,%esp
  102029:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  102030:	eb 21                	jmp    102053 <initIdt+0x30>
  102032:	ba 6b 2e 10 00       	mov    $0x102e6b,%edx
  102037:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10203a:	c1 e0 03             	shl    $0x3,%eax
  10203d:	05 e0 d3 13 01       	add    $0x113d3e0,%eax
  102042:	6a 00                	push   $0x0
  102044:	52                   	push   %edx
  102045:	6a 01                	push   $0x1
  102047:	50                   	push   %eax
  102048:	e8 64 ff ff ff       	call   101fb1 <setTrap>
  10204d:	83 c4 10             	add    $0x10,%esp
  102050:	ff 45 fc             	incl   -0x4(%ebp)
  102053:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  10205a:	7e d6                	jle    102032 <initIdt+0xf>
  10205c:	ba 71 2e 10 00       	mov    $0x102e71,%edx
  102061:	b8 48 d4 13 01       	mov    $0x113d448,%eax
  102066:	6a 00                	push   $0x0
  102068:	52                   	push   %edx
  102069:	6a 01                	push   $0x1
  10206b:	50                   	push   %eax
  10206c:	e8 40 ff ff ff       	call   101fb1 <setTrap>
  102071:	83 c4 10             	add    $0x10,%esp
  102074:	ba 75 2e 10 00       	mov    $0x102e75,%edx
  102079:	b8 e0 d7 13 01       	mov    $0x113d7e0,%eax
  10207e:	6a 03                	push   $0x3
  102080:	52                   	push   %edx
  102081:	6a 01                	push   $0x1
  102083:	50                   	push   %eax
  102084:	e8 b3 fe ff ff       	call   101f3c <setIntr>
  102089:	83 c4 10             	add    $0x10,%esp
  10208c:	ba 7e 2e 10 00       	mov    $0x102e7e,%edx
  102091:	b8 e0 d4 13 01       	mov    $0x113d4e0,%eax
  102096:	6a 00                	push   $0x0
  102098:	52                   	push   %edx
  102099:	6a 01                	push   $0x1
  10209b:	50                   	push   %eax
  10209c:	e8 9b fe ff ff       	call   101f3c <setIntr>
  1020a1:	83 c4 10             	add    $0x10,%esp
  1020a4:	68 00 08 00 00       	push   $0x800
  1020a9:	68 e0 d3 13 01       	push   $0x113d3e0
  1020ae:	e8 5c fe ff ff       	call   101f0f <saveIdt>
  1020b3:	83 c4 08             	add    $0x8,%esp
  1020b6:	90                   	nop
  1020b7:	c9                   	leave  
  1020b8:	c3                   	ret    

001020b9 <enableInterrupt>:
  1020b9:	55                   	push   %ebp
  1020ba:	89 e5                	mov    %esp,%ebp
  1020bc:	fb                   	sti    
  1020bd:	90                   	nop
  1020be:	5d                   	pop    %ebp
  1020bf:	c3                   	ret    

001020c0 <disableInterrupt>:
  1020c0:	55                   	push   %ebp
  1020c1:	89 e5                	mov    %esp,%ebp
  1020c3:	fa                   	cli    
  1020c4:	90                   	nop
  1020c5:	5d                   	pop    %ebp
  1020c6:	c3                   	ret    

001020c7 <irqHandle>:
  1020c7:	55                   	push   %ebp
  1020c8:	89 e5                	mov    %esp,%ebp
  1020ca:	57                   	push   %edi
  1020cb:	56                   	push   %esi
  1020cc:	53                   	push   %ebx
  1020cd:	83 ec 1c             	sub    $0x1c,%esp
  1020d0:	b8 10 00 00 00       	mov    $0x10,%eax
  1020d5:	89 c0                	mov    %eax,%eax
  1020d7:	8e d8                	mov    %eax,%ds
  1020d9:	8e e0                	mov    %eax,%fs
  1020db:	8e c0                	mov    %eax,%es
  1020dd:	b8 30 00 00 00       	mov    $0x30,%eax
  1020e2:	89 c0                	mov    %eax,%eax
  1020e4:	8e e8                	mov    %eax,%gs
  1020e6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1020ed:	89 e8                	mov    %ebp,%eax
  1020ef:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1020f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1020f5:	83 c0 08             	add    $0x8,%eax
  1020f8:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1020fb:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1020fe:	8b 10                	mov    (%eax),%edx
  102100:	8b 45 08             	mov    0x8(%ebp),%eax
  102103:	39 c2                	cmp    %eax,%edx
  102105:	74 12                	je     102119 <irqHandle+0x52>
  102107:	83 ec 08             	sub    $0x8,%esp
  10210a:	6a 1f                	push   $0x1f
  10210c:	68 9c 2f 10 00       	push   $0x102f9c
  102111:	e8 32 0d 00 00       	call   102e48 <abort>
  102116:	83 c4 10             	add    $0x10,%esp
  102119:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  10211e:	89 45 dc             	mov    %eax,-0x24(%ebp)
  102121:	e8 9a ff ff ff       	call   1020c0 <disableInterrupt>
  102126:	8b 45 08             	mov    0x8(%ebp),%eax
  102129:	8b 40 30             	mov    0x30(%eax),%eax
  10212c:	83 f8 0d             	cmp    $0xd,%eax
  10212f:	74 1e                	je     10214f <irqHandle+0x88>
  102131:	83 f8 0d             	cmp    $0xd,%eax
  102134:	7f 0b                	jg     102141 <irqHandle+0x7a>
  102136:	83 f8 ff             	cmp    $0xffffffff,%eax
  102139:	0f 84 9e 00 00 00    	je     1021dd <irqHandle+0x116>
  10213f:	eb 3e                	jmp    10217f <irqHandle+0xb8>
  102141:	83 f8 20             	cmp    $0x20,%eax
  102144:	74 29                	je     10216f <irqHandle+0xa8>
  102146:	3d 80 00 00 00       	cmp    $0x80,%eax
  10214b:	74 12                	je     10215f <irqHandle+0x98>
  10214d:	eb 30                	jmp    10217f <irqHandle+0xb8>
  10214f:	83 ec 0c             	sub    $0xc,%esp
  102152:	ff 75 08             	pushl  0x8(%ebp)
  102155:	e8 1b 03 00 00       	call   102475 <GProtectFaultHandle>
  10215a:	83 c4 10             	add    $0x10,%esp
  10215d:	eb 7f                	jmp    1021de <irqHandle+0x117>
  10215f:	83 ec 0c             	sub    $0xc,%esp
  102162:	ff 75 08             	pushl  0x8(%ebp)
  102165:	e8 a6 01 00 00       	call   102310 <syscallHandle>
  10216a:	83 c4 10             	add    $0x10,%esp
  10216d:	eb 6f                	jmp    1021de <irqHandle+0x117>
  10216f:	83 ec 0c             	sub    $0xc,%esp
  102172:	ff 75 08             	pushl  0x8(%ebp)
  102175:	e8 5f 03 00 00       	call   1024d9 <timeHandle>
  10217a:	83 c4 10             	add    $0x10,%esp
  10217d:	eb 5f                	jmp    1021de <irqHandle+0x117>
  10217f:	83 ec 0c             	sub    $0xc,%esp
  102182:	68 af 2f 10 00       	push   $0x102faf
  102187:	e8 00 0a 00 00       	call   102b8c <printk>
  10218c:	83 c4 10             	add    $0x10,%esp
  10218f:	8b 45 08             	mov    0x8(%ebp),%eax
  102192:	8b 50 38             	mov    0x38(%eax),%edx
  102195:	8b 45 08             	mov    0x8(%ebp),%eax
  102198:	8b 40 30             	mov    0x30(%eax),%eax
  10219b:	83 ec 08             	sub    $0x8,%esp
  10219e:	52                   	push   %edx
  10219f:	50                   	push   %eax
  1021a0:	68 1c 30 10 00       	push   $0x10301c
  1021a5:	6a 36                	push   $0x36
  1021a7:	68 9c 2f 10 00       	push   $0x102f9c
  1021ac:	68 b8 2f 10 00       	push   $0x102fb8
  1021b1:	e8 d6 09 00 00       	call   102b8c <printk>
  1021b6:	83 c4 20             	add    $0x20,%esp
  1021b9:	83 ec 0c             	sub    $0xc,%esp
  1021bc:	68 dd 2f 10 00       	push   $0x102fdd
  1021c1:	e8 c6 09 00 00       	call   102b8c <printk>
  1021c6:	83 c4 10             	add    $0x10,%esp
  1021c9:	83 ec 08             	sub    $0x8,%esp
  1021cc:	6a 37                	push   $0x37
  1021ce:	68 9c 2f 10 00       	push   $0x102f9c
  1021d3:	e8 70 0c 00 00       	call   102e48 <abort>
  1021d8:	83 c4 10             	add    $0x10,%esp
  1021db:	eb 01                	jmp    1021de <irqHandle+0x117>
  1021dd:	90                   	nop
  1021de:	8b 45 08             	mov    0x8(%ebp),%eax
  1021e1:	8b 40 30             	mov    0x30(%eax),%eax
  1021e4:	3d 80 00 00 00       	cmp    $0x80,%eax
  1021e9:	74 0f                	je     1021fa <irqHandle+0x133>
  1021eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1021ee:	8b 40 30             	mov    0x30(%eax),%eax
  1021f1:	83 f8 20             	cmp    $0x20,%eax
  1021f4:	0f 85 08 01 00 00    	jne    102302 <irqHandle+0x23b>
  1021fa:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  1021ff:	3b 45 dc             	cmp    -0x24(%ebp),%eax
  102202:	0f 84 fa 00 00 00    	je     102302 <irqHandle+0x23b>
  102208:	8b 15 e0 4a 10 00    	mov    0x104ae0,%edx
  10220e:	89 d0                	mov    %edx,%eax
  102210:	c1 e0 07             	shl    $0x7,%eax
  102213:	01 d0                	add    %edx,%eax
  102215:	01 c0                	add    %eax,%eax
  102217:	01 d0                	add    %edx,%eax
  102219:	01 c0                	add    %eax,%eax
  10221b:	01 d0                	add    %edx,%eax
  10221d:	c1 e0 04             	shl    $0x4,%eax
  102220:	05 00 4b 10 00       	add    $0x104b00,%eax
  102225:	05 fc 1f 00 00       	add    $0x1ffc,%eax
  10222a:	8d 50 b4             	lea    -0x4c(%eax),%edx
  10222d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102230:	89 10                	mov    %edx,(%eax)
  102232:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102235:	8b 00                	mov    (%eax),%eax
  102237:	89 45 d8             	mov    %eax,-0x28(%ebp)
  10223a:	8b 15 e0 4a 10 00    	mov    0x104ae0,%edx
  102240:	8b 4d d8             	mov    -0x28(%ebp),%ecx
  102243:	89 d0                	mov    %edx,%eax
  102245:	c1 e0 07             	shl    $0x7,%eax
  102248:	01 d0                	add    %edx,%eax
  10224a:	01 c0                	add    %eax,%eax
  10224c:	01 d0                	add    %edx,%eax
  10224e:	01 c0                	add    %eax,%eax
  102250:	01 d0                	add    %edx,%eax
  102252:	c1 e0 04             	shl    $0x4,%eax
  102255:	05 00 6b 10 00       	add    $0x106b00,%eax
  10225a:	89 ca                	mov    %ecx,%edx
  10225c:	89 c3                	mov    %eax,%ebx
  10225e:	b8 13 00 00 00       	mov    $0x13,%eax
  102263:	89 d7                	mov    %edx,%edi
  102265:	89 de                	mov    %ebx,%esi
  102267:	89 c1                	mov    %eax,%ecx
  102269:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10226b:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  102270:	c1 e0 10             	shl    $0x10,%eax
  102273:	83 ec 08             	sub    $0x8,%esp
  102276:	50                   	push   %eax
  102277:	6a 23                	push   $0x23
  102279:	e8 63 de ff ff       	call   1000e1 <change_gdt>
  10227e:	83 c4 10             	add    $0x10,%esp
  102281:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  102286:	c1 e0 10             	shl    $0x10,%eax
  102289:	83 ec 08             	sub    $0x8,%esp
  10228c:	50                   	push   %eax
  10228d:	6a 1b                	push   $0x1b
  10228f:	e8 4d de ff ff       	call   1000e1 <change_gdt>
  102294:	83 c4 10             	add    $0x10,%esp
  102297:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  10229c:	83 f8 01             	cmp    $0x1,%eax
  10229f:	75 61                	jne    102302 <irqHandle+0x23b>
  1022a1:	83 ec 0c             	sub    $0xc,%esp
  1022a4:	68 af 2f 10 00       	push   $0x102faf
  1022a9:	e8 de 08 00 00       	call   102b8c <printk>
  1022ae:	83 c4 10             	add    $0x10,%esp
  1022b1:	a1 a8 8b 10 00       	mov    0x108ba8,%eax
  1022b6:	83 ec 0c             	sub    $0xc,%esp
  1022b9:	50                   	push   %eax
  1022ba:	68 1c 30 10 00       	push   $0x10301c
  1022bf:	6a 47                	push   $0x47
  1022c1:	68 9c 2f 10 00       	push   $0x102f9c
  1022c6:	68 e3 2f 10 00       	push   $0x102fe3
  1022cb:	e8 bc 08 00 00       	call   102b8c <printk>
  1022d0:	83 c4 20             	add    $0x20,%esp
  1022d3:	83 ec 0c             	sub    $0xc,%esp
  1022d6:	68 dd 2f 10 00       	push   $0x102fdd
  1022db:	e8 ac 08 00 00       	call   102b8c <printk>
  1022e0:	83 c4 10             	add    $0x10,%esp
  1022e3:	8b 45 08             	mov    0x8(%ebp),%eax
  1022e6:	8b 40 38             	mov    0x38(%eax),%eax
  1022e9:	3d ff ff 1f 00       	cmp    $0x1fffff,%eax
  1022ee:	77 12                	ja     102302 <irqHandle+0x23b>
  1022f0:	83 ec 08             	sub    $0x8,%esp
  1022f3:	6a 48                	push   $0x48
  1022f5:	68 9c 2f 10 00       	push   $0x102f9c
  1022fa:	e8 49 0b 00 00       	call   102e48 <abort>
  1022ff:	83 c4 10             	add    $0x10,%esp
  102302:	e8 b2 fd ff ff       	call   1020b9 <enableInterrupt>
  102307:	90                   	nop
  102308:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10230b:	5b                   	pop    %ebx
  10230c:	5e                   	pop    %esi
  10230d:	5f                   	pop    %edi
  10230e:	5d                   	pop    %ebp
  10230f:	c3                   	ret    

00102310 <syscallHandle>:
  102310:	55                   	push   %ebp
  102311:	89 e5                	mov    %esp,%ebp
  102313:	83 ec 08             	sub    $0x8,%esp
  102316:	8b 45 08             	mov    0x8(%ebp),%eax
  102319:	8b 40 2c             	mov    0x2c(%eax),%eax
  10231c:	83 f8 07             	cmp    $0x7,%eax
  10231f:	0f 84 be 00 00 00    	je     1023e3 <syscallHandle+0xd3>
  102325:	83 f8 07             	cmp    $0x7,%eax
  102328:	77 2b                	ja     102355 <syscallHandle+0x45>
  10232a:	83 f8 02             	cmp    $0x2,%eax
  10232d:	0f 84 95 00 00 00    	je     1023c8 <syscallHandle+0xb8>
  102333:	83 f8 02             	cmp    $0x2,%eax
  102336:	77 0a                	ja     102342 <syscallHandle+0x32>
  102338:	83 f8 01             	cmp    $0x1,%eax
  10233b:	74 78                	je     1023b5 <syscallHandle+0xa5>
  10233d:	e9 31 01 00 00       	jmp    102473 <syscallHandle+0x163>
  102342:	83 f8 03             	cmp    $0x3,%eax
  102345:	0f 84 10 01 00 00    	je     10245b <syscallHandle+0x14b>
  10234b:	83 f8 04             	cmp    $0x4,%eax
  10234e:	74 3f                	je     10238f <syscallHandle+0x7f>
  102350:	e9 1e 01 00 00       	jmp    102473 <syscallHandle+0x163>
  102355:	83 f8 17             	cmp    $0x17,%eax
  102358:	0f 84 b5 00 00 00    	je     102413 <syscallHandle+0x103>
  10235e:	83 f8 17             	cmp    $0x17,%eax
  102361:	77 17                	ja     10237a <syscallHandle+0x6a>
  102363:	83 f8 15             	cmp    $0x15,%eax
  102366:	0f 84 8f 00 00 00    	je     1023fb <syscallHandle+0xeb>
  10236c:	83 f8 16             	cmp    $0x16,%eax
  10236f:	0f 84 b6 00 00 00    	je     10242b <syscallHandle+0x11b>
  102375:	e9 f9 00 00 00       	jmp    102473 <syscallHandle+0x163>
  10237a:	83 f8 18             	cmp    $0x18,%eax
  10237d:	0f 84 c0 00 00 00    	je     102443 <syscallHandle+0x133>
  102383:	3d e6 00 00 00       	cmp    $0xe6,%eax
  102388:	74 18                	je     1023a2 <syscallHandle+0x92>
  10238a:	e9 e4 00 00 00       	jmp    102473 <syscallHandle+0x163>
  10238f:	83 ec 0c             	sub    $0xc,%esp
  102392:	ff 75 08             	pushl  0x8(%ebp)
  102395:	e8 ea ed ff ff       	call   101184 <sys_write>
  10239a:	83 c4 10             	add    $0x10,%esp
  10239d:	e9 d0 00 00 00       	jmp    102472 <syscallHandle+0x162>
  1023a2:	83 ec 0c             	sub    $0xc,%esp
  1023a5:	ff 75 08             	pushl  0x8(%ebp)
  1023a8:	e8 fc e8 ff ff       	call   100ca9 <sys_sleep>
  1023ad:	83 c4 10             	add    $0x10,%esp
  1023b0:	e9 bd 00 00 00       	jmp    102472 <syscallHandle+0x162>
  1023b5:	83 ec 0c             	sub    $0xc,%esp
  1023b8:	ff 75 08             	pushl  0x8(%ebp)
  1023bb:	e8 a5 e8 ff ff       	call   100c65 <sys_exit>
  1023c0:	83 c4 10             	add    $0x10,%esp
  1023c3:	e9 aa 00 00 00       	jmp    102472 <syscallHandle+0x162>
  1023c8:	83 ec 0c             	sub    $0xc,%esp
  1023cb:	ff 75 08             	pushl  0x8(%ebp)
  1023ce:	e8 10 e9 ff ff       	call   100ce3 <sys_fork>
  1023d3:	83 c4 10             	add    $0x10,%esp
  1023d6:	89 c2                	mov    %eax,%edx
  1023d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1023db:	89 50 2c             	mov    %edx,0x2c(%eax)
  1023de:	e9 8f 00 00 00       	jmp    102472 <syscallHandle+0x162>
  1023e3:	83 ec 0c             	sub    $0xc,%esp
  1023e6:	ff 75 08             	pushl  0x8(%ebp)
  1023e9:	e8 ae e8 ff ff       	call   100c9c <sys_getpid>
  1023ee:	83 c4 10             	add    $0x10,%esp
  1023f1:	89 c2                	mov    %eax,%edx
  1023f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1023f6:	89 50 2c             	mov    %edx,0x2c(%eax)
  1023f9:	eb 77                	jmp    102472 <syscallHandle+0x162>
  1023fb:	83 ec 0c             	sub    $0xc,%esp
  1023fe:	ff 75 08             	pushl  0x8(%ebp)
  102401:	e8 fe 02 00 00       	call   102704 <sys_sem_init>
  102406:	83 c4 10             	add    $0x10,%esp
  102409:	89 c2                	mov    %eax,%edx
  10240b:	8b 45 08             	mov    0x8(%ebp),%eax
  10240e:	89 50 2c             	mov    %edx,0x2c(%eax)
  102411:	eb 5f                	jmp    102472 <syscallHandle+0x162>
  102413:	83 ec 0c             	sub    $0xc,%esp
  102416:	ff 75 08             	pushl  0x8(%ebp)
  102419:	e8 52 03 00 00       	call   102770 <sys_sem_post>
  10241e:	83 c4 10             	add    $0x10,%esp
  102421:	89 c2                	mov    %eax,%edx
  102423:	8b 45 08             	mov    0x8(%ebp),%eax
  102426:	89 50 2c             	mov    %edx,0x2c(%eax)
  102429:	eb 47                	jmp    102472 <syscallHandle+0x162>
  10242b:	83 ec 0c             	sub    $0xc,%esp
  10242e:	ff 75 08             	pushl  0x8(%ebp)
  102431:	e8 77 03 00 00       	call   1027ad <sys_sem_wait>
  102436:	83 c4 10             	add    $0x10,%esp
  102439:	89 c2                	mov    %eax,%edx
  10243b:	8b 45 08             	mov    0x8(%ebp),%eax
  10243e:	89 50 2c             	mov    %edx,0x2c(%eax)
  102441:	eb 2f                	jmp    102472 <syscallHandle+0x162>
  102443:	83 ec 0c             	sub    $0xc,%esp
  102446:	ff 75 08             	pushl  0x8(%ebp)
  102449:	e8 9c 03 00 00       	call   1027ea <sys_sem_destroy>
  10244e:	83 c4 10             	add    $0x10,%esp
  102451:	89 c2                	mov    %eax,%edx
  102453:	8b 45 08             	mov    0x8(%ebp),%eax
  102456:	89 50 2c             	mov    %edx,0x2c(%eax)
  102459:	eb 17                	jmp    102472 <syscallHandle+0x162>
  10245b:	83 ec 0c             	sub    $0xc,%esp
  10245e:	ff 75 08             	pushl  0x8(%ebp)
  102461:	e8 ff ed ff ff       	call   101265 <sys_read>
  102466:	83 c4 10             	add    $0x10,%esp
  102469:	89 c2                	mov    %eax,%edx
  10246b:	8b 45 08             	mov    0x8(%ebp),%eax
  10246e:	89 50 2c             	mov    %edx,0x2c(%eax)
  102471:	90                   	nop
  102472:	90                   	nop
  102473:	c9                   	leave  
  102474:	c3                   	ret    

00102475 <GProtectFaultHandle>:
  102475:	55                   	push   %ebp
  102476:	89 e5                	mov    %esp,%ebp
  102478:	83 ec 08             	sub    $0x8,%esp
  10247b:	83 ec 0c             	sub    $0xc,%esp
  10247e:	68 af 2f 10 00       	push   $0x102faf
  102483:	e8 04 07 00 00       	call   102b8c <printk>
  102488:	83 c4 10             	add    $0x10,%esp
  10248b:	8b 45 08             	mov    0x8(%ebp),%eax
  10248e:	8b 40 30             	mov    0x30(%eax),%eax
  102491:	83 ec 0c             	sub    $0xc,%esp
  102494:	50                   	push   %eax
  102495:	68 28 30 10 00       	push   $0x103028
  10249a:	68 83 00 00 00       	push   $0x83
  10249f:	68 9c 2f 10 00       	push   $0x102f9c
  1024a4:	68 fe 2f 10 00       	push   $0x102ffe
  1024a9:	e8 de 06 00 00       	call   102b8c <printk>
  1024ae:	83 c4 20             	add    $0x20,%esp
  1024b1:	83 ec 0c             	sub    $0xc,%esp
  1024b4:	68 dd 2f 10 00       	push   $0x102fdd
  1024b9:	e8 ce 06 00 00       	call   102b8c <printk>
  1024be:	83 c4 10             	add    $0x10,%esp
  1024c1:	83 ec 08             	sub    $0x8,%esp
  1024c4:	68 84 00 00 00       	push   $0x84
  1024c9:	68 9c 2f 10 00       	push   $0x102f9c
  1024ce:	e8 75 09 00 00       	call   102e48 <abort>
  1024d3:	83 c4 10             	add    $0x10,%esp
  1024d6:	90                   	nop
  1024d7:	c9                   	leave  
  1024d8:	c3                   	ret    

001024d9 <timeHandle>:
  1024d9:	55                   	push   %ebp
  1024da:	89 e5                	mov    %esp,%ebp
  1024dc:	83 ec 18             	sub    $0x18,%esp
  1024df:	8b 15 e0 4a 10 00    	mov    0x104ae0,%edx
  1024e5:	8b 0d e0 4a 10 00    	mov    0x104ae0,%ecx
  1024eb:	89 c8                	mov    %ecx,%eax
  1024ed:	c1 e0 07             	shl    $0x7,%eax
  1024f0:	01 c8                	add    %ecx,%eax
  1024f2:	01 c0                	add    %eax,%eax
  1024f4:	01 c8                	add    %ecx,%eax
  1024f6:	01 c0                	add    %eax,%eax
  1024f8:	01 c8                	add    %ecx,%eax
  1024fa:	c1 e0 04             	shl    $0x4,%eax
  1024fd:	05 50 6b 10 00       	add    $0x106b50,%eax
  102502:	8b 00                	mov    (%eax),%eax
  102504:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102507:	89 d0                	mov    %edx,%eax
  102509:	c1 e0 07             	shl    $0x7,%eax
  10250c:	01 d0                	add    %edx,%eax
  10250e:	01 c0                	add    %eax,%eax
  102510:	01 d0                	add    %edx,%eax
  102512:	01 c0                	add    %eax,%eax
  102514:	01 d0                	add    %edx,%eax
  102516:	c1 e0 04             	shl    $0x4,%eax
  102519:	05 50 6b 10 00       	add    $0x106b50,%eax
  10251e:	89 08                	mov    %ecx,(%eax)
  102520:	e8 6a f7 ff ff       	call   101c8f <block_decrease>
  102525:	e8 df f1 ff ff       	call   101709 <check_block>
  10252a:	8b 15 e0 4a 10 00    	mov    0x104ae0,%edx
  102530:	89 d0                	mov    %edx,%eax
  102532:	c1 e0 07             	shl    $0x7,%eax
  102535:	01 d0                	add    %edx,%eax
  102537:	01 c0                	add    %eax,%eax
  102539:	01 d0                	add    %edx,%eax
  10253b:	01 c0                	add    %eax,%eax
  10253d:	01 d0                	add    %edx,%eax
  10253f:	c1 e0 04             	shl    $0x4,%eax
  102542:	05 50 6b 10 00       	add    $0x106b50,%eax
  102547:	8b 00                	mov    (%eax),%eax
  102549:	85 c0                	test   %eax,%eax
  10254b:	7f 2d                	jg     10257a <timeHandle+0xa1>
  10254d:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  102552:	83 ec 08             	sub    $0x8,%esp
  102555:	ff 75 08             	pushl  0x8(%ebp)
  102558:	50                   	push   %eax
  102559:	e8 1b f1 ff ff       	call   101679 <put_into_runnable>
  10255e:	83 c4 10             	add    $0x10,%esp
  102561:	e8 f3 f0 ff ff       	call   101659 <get_from_runnable>
  102566:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102569:	83 ec 08             	sub    $0x8,%esp
  10256c:	ff 75 08             	pushl  0x8(%ebp)
  10256f:	ff 75 f4             	pushl  -0xc(%ebp)
  102572:	e8 2f f0 ff ff       	call   1015a6 <put_into_running>
  102577:	83 c4 10             	add    $0x10,%esp
  10257a:	e8 bc f0 ff ff       	call   10163b <getpid>
  10257f:	85 c0                	test   %eax,%eax
  102581:	75 12                	jne    102595 <timeHandle+0xbc>
  102583:	83 ec 0c             	sub    $0xc,%esp
  102586:	68 14 30 10 00       	push   $0x103014
  10258b:	e8 fc 05 00 00       	call   102b8c <printk>
  102590:	83 c4 10             	add    $0x10,%esp
  102593:	eb 16                	jmp    1025ab <timeHandle+0xd2>
  102595:	e8 a1 f0 ff ff       	call   10163b <getpid>
  10259a:	83 ec 08             	sub    $0x8,%esp
  10259d:	50                   	push   %eax
  10259e:	68 16 30 10 00       	push   $0x103016
  1025a3:	e8 e4 05 00 00       	call   102b8c <printk>
  1025a8:	83 c4 10             	add    $0x10,%esp
  1025ab:	90                   	nop
  1025ac:	c9                   	leave  
  1025ad:	c3                   	ret    

001025ae <W>:
  1025ae:	55                   	push   %ebp
  1025af:	89 e5                	mov    %esp,%ebp
  1025b1:	83 ec 18             	sub    $0x18,%esp
  1025b4:	e8 82 f0 ff ff       	call   10163b <getpid>
  1025b9:	89 c2                	mov    %eax,%edx
  1025bb:	8b 45 08             	mov    0x8(%ebp),%eax
  1025be:	8b 48 04             	mov    0x4(%eax),%ecx
  1025c1:	89 d0                	mov    %edx,%eax
  1025c3:	c1 e0 07             	shl    $0x7,%eax
  1025c6:	01 d0                	add    %edx,%eax
  1025c8:	01 c0                	add    %eax,%eax
  1025ca:	01 d0                	add    %edx,%eax
  1025cc:	01 c0                	add    %eax,%eax
  1025ce:	01 d0                	add    %edx,%eax
  1025d0:	c1 e0 04             	shl    $0x4,%eax
  1025d3:	05 68 6b 10 00       	add    $0x106b68,%eax
  1025d8:	89 08                	mov    %ecx,(%eax)
  1025da:	e8 5c f0 ff ff       	call   10163b <getpid>
  1025df:	89 c2                	mov    %eax,%edx
  1025e1:	89 d0                	mov    %edx,%eax
  1025e3:	c1 e0 07             	shl    $0x7,%eax
  1025e6:	01 d0                	add    %edx,%eax
  1025e8:	01 c0                	add    %eax,%eax
  1025ea:	01 d0                	add    %edx,%eax
  1025ec:	01 c0                	add    %eax,%eax
  1025ee:	01 d0                	add    %edx,%eax
  1025f0:	c1 e0 04             	shl    $0x4,%eax
  1025f3:	8d 90 00 4b 10 00    	lea    0x104b00(%eax),%edx
  1025f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1025fc:	89 50 04             	mov    %edx,0x4(%eax)
  1025ff:	e8 55 f0 ff ff       	call   101659 <get_from_runnable>
  102604:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102607:	e8 2f f0 ff ff       	call   10163b <getpid>
  10260c:	83 f8 02             	cmp    $0x2,%eax
  10260f:	74 12                	je     102623 <W+0x75>
  102611:	83 ec 08             	sub    $0x8,%esp
  102614:	6a 0f                	push   $0xf
  102616:	68 3c 30 10 00       	push   $0x10303c
  10261b:	e8 28 08 00 00       	call   102e48 <abort>
  102620:	83 c4 10             	add    $0x10,%esp
  102623:	83 ec 08             	sub    $0x8,%esp
  102626:	6a 00                	push   $0x0
  102628:	ff 75 f4             	pushl  -0xc(%ebp)
  10262b:	e8 76 ef ff ff       	call   1015a6 <put_into_running>
  102630:	83 c4 10             	add    $0x10,%esp
  102633:	90                   	nop
  102634:	c9                   	leave  
  102635:	c3                   	ret    

00102636 <R>:
  102636:	55                   	push   %ebp
  102637:	89 e5                	mov    %esp,%ebp
  102639:	83 ec 18             	sub    $0x18,%esp
  10263c:	8b 45 08             	mov    0x8(%ebp),%eax
  10263f:	8b 40 04             	mov    0x4(%eax),%eax
  102642:	8b 80 58 20 00 00    	mov    0x2058(%eax),%eax
  102648:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10264b:	8b 45 08             	mov    0x8(%ebp),%eax
  10264e:	8b 40 04             	mov    0x4(%eax),%eax
  102651:	8b 90 68 20 00 00    	mov    0x2068(%eax),%edx
  102657:	8b 45 08             	mov    0x8(%ebp),%eax
  10265a:	89 50 04             	mov    %edx,0x4(%eax)
  10265d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102660:	89 d0                	mov    %edx,%eax
  102662:	c1 e0 07             	shl    $0x7,%eax
  102665:	01 d0                	add    %edx,%eax
  102667:	01 c0                	add    %eax,%eax
  102669:	01 d0                	add    %edx,%eax
  10266b:	01 c0                	add    %eax,%eax
  10266d:	01 d0                	add    %edx,%eax
  10266f:	c1 e0 04             	shl    $0x4,%eax
  102672:	05 00 20 00 00       	add    $0x2000,%eax
  102677:	05 00 4b 10 00       	add    $0x104b00,%eax
  10267c:	83 ec 08             	sub    $0x8,%esp
  10267f:	50                   	push   %eax
  102680:	ff 75 f4             	pushl  -0xc(%ebp)
  102683:	e8 f1 ef ff ff       	call   101679 <put_into_runnable>
  102688:	83 c4 10             	add    $0x10,%esp
  10268b:	e8 ab ef ff ff       	call   10163b <getpid>
  102690:	83 f8 01             	cmp    $0x1,%eax
  102693:	74 12                	je     1026a7 <R+0x71>
  102695:	83 ec 08             	sub    $0x8,%esp
  102698:	6a 19                	push   $0x19
  10269a:	68 3c 30 10 00       	push   $0x10303c
  10269f:	e8 a4 07 00 00       	call   102e48 <abort>
  1026a4:	83 c4 10             	add    $0x10,%esp
  1026a7:	90                   	nop
  1026a8:	c9                   	leave  
  1026a9:	c3                   	ret    

001026aa <P>:
  1026aa:	55                   	push   %ebp
  1026ab:	89 e5                	mov    %esp,%ebp
  1026ad:	83 ec 08             	sub    $0x8,%esp
  1026b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1026b3:	8b 00                	mov    (%eax),%eax
  1026b5:	8d 50 ff             	lea    -0x1(%eax),%edx
  1026b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1026bb:	89 10                	mov    %edx,(%eax)
  1026bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1026c0:	8b 00                	mov    (%eax),%eax
  1026c2:	85 c0                	test   %eax,%eax
  1026c4:	79 0e                	jns    1026d4 <P+0x2a>
  1026c6:	83 ec 0c             	sub    $0xc,%esp
  1026c9:	ff 75 08             	pushl  0x8(%ebp)
  1026cc:	e8 dd fe ff ff       	call   1025ae <W>
  1026d1:	83 c4 10             	add    $0x10,%esp
  1026d4:	90                   	nop
  1026d5:	c9                   	leave  
  1026d6:	c3                   	ret    

001026d7 <V>:
  1026d7:	55                   	push   %ebp
  1026d8:	89 e5                	mov    %esp,%ebp
  1026da:	83 ec 08             	sub    $0x8,%esp
  1026dd:	8b 45 08             	mov    0x8(%ebp),%eax
  1026e0:	8b 00                	mov    (%eax),%eax
  1026e2:	8d 50 01             	lea    0x1(%eax),%edx
  1026e5:	8b 45 08             	mov    0x8(%ebp),%eax
  1026e8:	89 10                	mov    %edx,(%eax)
  1026ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1026ed:	8b 00                	mov    (%eax),%eax
  1026ef:	85 c0                	test   %eax,%eax
  1026f1:	7f 0e                	jg     102701 <V+0x2a>
  1026f3:	83 ec 0c             	sub    $0xc,%esp
  1026f6:	ff 75 08             	pushl  0x8(%ebp)
  1026f9:	e8 38 ff ff ff       	call   102636 <R>
  1026fe:	83 c4 10             	add    $0x10,%esp
  102701:	90                   	nop
  102702:	c9                   	leave  
  102703:	c3                   	ret    

00102704 <sys_sem_init>:
  102704:	55                   	push   %ebp
  102705:	89 e5                	mov    %esp,%ebp
  102707:	53                   	push   %ebx
  102708:	83 ec 14             	sub    $0x14,%esp
  10270b:	8b 45 08             	mov    0x8(%ebp),%eax
  10270e:	8b 58 20             	mov    0x20(%eax),%ebx
  102711:	e8 25 ef ff ff       	call   10163b <getpid>
  102716:	c1 e0 10             	shl    $0x10,%eax
  102719:	01 d8                	add    %ebx,%eax
  10271b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10271e:	a1 64 42 10 00       	mov    0x104264,%eax
  102723:	25 1f 00 00 80       	and    $0x8000001f,%eax
  102728:	85 c0                	test   %eax,%eax
  10272a:	79 05                	jns    102731 <sys_sem_init+0x2d>
  10272c:	48                   	dec    %eax
  10272d:	83 c8 e0             	or     $0xffffffe0,%eax
  102730:	40                   	inc    %eax
  102731:	89 c2                	mov    %eax,%edx
  102733:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102736:	89 10                	mov    %edx,(%eax)
  102738:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10273b:	8b 00                	mov    (%eax),%eax
  10273d:	8b 55 08             	mov    0x8(%ebp),%edx
  102740:	8b 52 28             	mov    0x28(%edx),%edx
  102743:	89 14 c5 e0 db 13 01 	mov    %edx,0x113dbe0(,%eax,8)
  10274a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10274d:	8b 00                	mov    (%eax),%eax
  10274f:	c7 04 c5 e4 db 13 01 	movl   $0x0,0x113dbe4(,%eax,8)
  102756:	00 00 00 00 
  10275a:	a1 64 42 10 00       	mov    0x104264,%eax
  10275f:	40                   	inc    %eax
  102760:	a3 64 42 10 00       	mov    %eax,0x104264
  102765:	b8 01 00 00 00       	mov    $0x1,%eax
  10276a:	83 c4 14             	add    $0x14,%esp
  10276d:	5b                   	pop    %ebx
  10276e:	5d                   	pop    %ebp
  10276f:	c3                   	ret    

00102770 <sys_sem_post>:
  102770:	55                   	push   %ebp
  102771:	89 e5                	mov    %esp,%ebp
  102773:	53                   	push   %ebx
  102774:	83 ec 14             	sub    $0x14,%esp
  102777:	8b 45 08             	mov    0x8(%ebp),%eax
  10277a:	8b 58 20             	mov    0x20(%eax),%ebx
  10277d:	e8 b9 ee ff ff       	call   10163b <getpid>
  102782:	c1 e0 10             	shl    $0x10,%eax
  102785:	01 d8                	add    %ebx,%eax
  102787:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10278a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10278d:	8b 00                	mov    (%eax),%eax
  10278f:	c1 e0 03             	shl    $0x3,%eax
  102792:	05 e0 db 13 01       	add    $0x113dbe0,%eax
  102797:	83 ec 0c             	sub    $0xc,%esp
  10279a:	50                   	push   %eax
  10279b:	e8 37 ff ff ff       	call   1026d7 <V>
  1027a0:	83 c4 10             	add    $0x10,%esp
  1027a3:	b8 01 00 00 00       	mov    $0x1,%eax
  1027a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1027ab:	c9                   	leave  
  1027ac:	c3                   	ret    

001027ad <sys_sem_wait>:
  1027ad:	55                   	push   %ebp
  1027ae:	89 e5                	mov    %esp,%ebp
  1027b0:	53                   	push   %ebx
  1027b1:	83 ec 14             	sub    $0x14,%esp
  1027b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1027b7:	8b 58 20             	mov    0x20(%eax),%ebx
  1027ba:	e8 7c ee ff ff       	call   10163b <getpid>
  1027bf:	c1 e0 10             	shl    $0x10,%eax
  1027c2:	01 d8                	add    %ebx,%eax
  1027c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1027c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1027ca:	8b 00                	mov    (%eax),%eax
  1027cc:	c1 e0 03             	shl    $0x3,%eax
  1027cf:	05 e0 db 13 01       	add    $0x113dbe0,%eax
  1027d4:	83 ec 0c             	sub    $0xc,%esp
  1027d7:	50                   	push   %eax
  1027d8:	e8 cd fe ff ff       	call   1026aa <P>
  1027dd:	83 c4 10             	add    $0x10,%esp
  1027e0:	b8 01 00 00 00       	mov    $0x1,%eax
  1027e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1027e8:	c9                   	leave  
  1027e9:	c3                   	ret    

001027ea <sys_sem_destroy>:
  1027ea:	55                   	push   %ebp
  1027eb:	89 e5                	mov    %esp,%ebp
  1027ed:	53                   	push   %ebx
  1027ee:	83 ec 14             	sub    $0x14,%esp
  1027f1:	8b 45 08             	mov    0x8(%ebp),%eax
  1027f4:	8b 58 20             	mov    0x20(%eax),%ebx
  1027f7:	e8 3f ee ff ff       	call   10163b <getpid>
  1027fc:	c1 e0 10             	shl    $0x10,%eax
  1027ff:	01 d8                	add    %ebx,%eax
  102801:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102804:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102807:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
  10280d:	c7 05 e0 db 13 01 ff 	movl   $0xffffffff,0x113dbe0
  102814:	ff ff ff 
  102817:	b8 01 00 00 00       	mov    $0x1,%eax
  10281c:	83 c4 14             	add    $0x14,%esp
  10281f:	5b                   	pop    %ebx
  102820:	5d                   	pop    %ebp
  102821:	c3                   	ret    

00102822 <inByte>:
  102822:	55                   	push   %ebp
  102823:	89 e5                	mov    %esp,%ebp
  102825:	83 ec 14             	sub    $0x14,%esp
  102828:	8b 45 08             	mov    0x8(%ebp),%eax
  10282b:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  10282f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102832:	89 c2                	mov    %eax,%edx
  102834:	ec                   	in     (%dx),%al
  102835:	88 45 ff             	mov    %al,-0x1(%ebp)
  102838:	8a 45 ff             	mov    -0x1(%ebp),%al
  10283b:	c9                   	leave  
  10283c:	c3                   	ret    

0010283d <outByte>:
  10283d:	55                   	push   %ebp
  10283e:	89 e5                	mov    %esp,%ebp
  102840:	83 ec 08             	sub    $0x8,%esp
  102843:	8b 45 08             	mov    0x8(%ebp),%eax
  102846:	8b 55 0c             	mov    0xc(%ebp),%edx
  102849:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  10284d:	88 55 f8             	mov    %dl,-0x8(%ebp)
  102850:	8a 45 f8             	mov    -0x8(%ebp),%al
  102853:	8b 55 fc             	mov    -0x4(%ebp),%edx
  102856:	ee                   	out    %al,(%dx)
  102857:	90                   	nop
  102858:	c9                   	leave  
  102859:	c3                   	ret    

0010285a <initIntr>:
  10285a:	55                   	push   %ebp
  10285b:	89 e5                	mov    %esp,%ebp
  10285d:	6a ff                	push   $0xffffffff
  10285f:	6a 21                	push   $0x21
  102861:	e8 d7 ff ff ff       	call   10283d <outByte>
  102866:	83 c4 08             	add    $0x8,%esp
  102869:	6a ff                	push   $0xffffffff
  10286b:	68 a1 00 00 00       	push   $0xa1
  102870:	e8 c8 ff ff ff       	call   10283d <outByte>
  102875:	83 c4 08             	add    $0x8,%esp
  102878:	6a 11                	push   $0x11
  10287a:	6a 20                	push   $0x20
  10287c:	e8 bc ff ff ff       	call   10283d <outByte>
  102881:	83 c4 08             	add    $0x8,%esp
  102884:	6a 20                	push   $0x20
  102886:	6a 21                	push   $0x21
  102888:	e8 b0 ff ff ff       	call   10283d <outByte>
  10288d:	83 c4 08             	add    $0x8,%esp
  102890:	6a 04                	push   $0x4
  102892:	6a 21                	push   $0x21
  102894:	e8 a4 ff ff ff       	call   10283d <outByte>
  102899:	83 c4 08             	add    $0x8,%esp
  10289c:	6a 03                	push   $0x3
  10289e:	6a 21                	push   $0x21
  1028a0:	e8 98 ff ff ff       	call   10283d <outByte>
  1028a5:	83 c4 08             	add    $0x8,%esp
  1028a8:	6a 11                	push   $0x11
  1028aa:	68 a0 00 00 00       	push   $0xa0
  1028af:	e8 89 ff ff ff       	call   10283d <outByte>
  1028b4:	83 c4 08             	add    $0x8,%esp
  1028b7:	6a 28                	push   $0x28
  1028b9:	68 a1 00 00 00       	push   $0xa1
  1028be:	e8 7a ff ff ff       	call   10283d <outByte>
  1028c3:	83 c4 08             	add    $0x8,%esp
  1028c6:	6a 02                	push   $0x2
  1028c8:	68 a1 00 00 00       	push   $0xa1
  1028cd:	e8 6b ff ff ff       	call   10283d <outByte>
  1028d2:	83 c4 08             	add    $0x8,%esp
  1028d5:	6a 03                	push   $0x3
  1028d7:	68 a1 00 00 00       	push   $0xa1
  1028dc:	e8 5c ff ff ff       	call   10283d <outByte>
  1028e1:	83 c4 08             	add    $0x8,%esp
  1028e4:	6a 68                	push   $0x68
  1028e6:	6a 20                	push   $0x20
  1028e8:	e8 50 ff ff ff       	call   10283d <outByte>
  1028ed:	83 c4 08             	add    $0x8,%esp
  1028f0:	6a 0a                	push   $0xa
  1028f2:	6a 20                	push   $0x20
  1028f4:	e8 44 ff ff ff       	call   10283d <outByte>
  1028f9:	83 c4 08             	add    $0x8,%esp
  1028fc:	6a 68                	push   $0x68
  1028fe:	68 a0 00 00 00       	push   $0xa0
  102903:	e8 35 ff ff ff       	call   10283d <outByte>
  102908:	83 c4 08             	add    $0x8,%esp
  10290b:	6a 0a                	push   $0xa
  10290d:	68 a0 00 00 00       	push   $0xa0
  102912:	e8 26 ff ff ff       	call   10283d <outByte>
  102917:	83 c4 08             	add    $0x8,%esp
  10291a:	90                   	nop
  10291b:	c9                   	leave  
  10291c:	c3                   	ret    

0010291d <initTimer>:
  10291d:	55                   	push   %ebp
  10291e:	89 e5                	mov    %esp,%ebp
  102920:	83 ec 10             	sub    $0x10,%esp
  102923:	c7 45 fc 9b 2e 00 00 	movl   $0x2e9b,-0x4(%ebp)
  10292a:	6a 34                	push   $0x34
  10292c:	6a 43                	push   $0x43
  10292e:	e8 0a ff ff ff       	call   10283d <outByte>
  102933:	83 c4 08             	add    $0x8,%esp
  102936:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102939:	25 ff 00 00 80       	and    $0x800000ff,%eax
  10293e:	85 c0                	test   %eax,%eax
  102940:	79 07                	jns    102949 <initTimer+0x2c>
  102942:	48                   	dec    %eax
  102943:	0d 00 ff ff ff       	or     $0xffffff00,%eax
  102948:	40                   	inc    %eax
  102949:	0f be c0             	movsbl %al,%eax
  10294c:	50                   	push   %eax
  10294d:	6a 40                	push   $0x40
  10294f:	e8 e9 fe ff ff       	call   10283d <outByte>
  102954:	83 c4 08             	add    $0x8,%esp
  102957:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10295a:	85 c0                	test   %eax,%eax
  10295c:	79 05                	jns    102963 <initTimer+0x46>
  10295e:	05 ff 00 00 00       	add    $0xff,%eax
  102963:	c1 f8 08             	sar    $0x8,%eax
  102966:	0f be c0             	movsbl %al,%eax
  102969:	50                   	push   %eax
  10296a:	6a 40                	push   $0x40
  10296c:	e8 cc fe ff ff       	call   10283d <outByte>
  102971:	83 c4 08             	add    $0x8,%esp
  102974:	90                   	nop
  102975:	c9                   	leave  
  102976:	c3                   	ret    

00102977 <getKeyCode>:
  102977:	55                   	push   %ebp
  102978:	89 e5                	mov    %esp,%ebp
  10297a:	83 ec 10             	sub    $0x10,%esp
  10297d:	6a 60                	push   $0x60
  10297f:	e8 9e fe ff ff       	call   102822 <inByte>
  102984:	83 c4 04             	add    $0x4,%esp
  102987:	0f b6 c0             	movzbl %al,%eax
  10298a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10298d:	6a 61                	push   $0x61
  10298f:	e8 8e fe ff ff       	call   102822 <inByte>
  102994:	83 c4 04             	add    $0x4,%esp
  102997:	0f b6 c0             	movzbl %al,%eax
  10299a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10299d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1029a0:	83 c8 80             	or     $0xffffff80,%eax
  1029a3:	0f be c0             	movsbl %al,%eax
  1029a6:	50                   	push   %eax
  1029a7:	6a 61                	push   $0x61
  1029a9:	e8 8f fe ff ff       	call   10283d <outByte>
  1029ae:	83 c4 08             	add    $0x8,%esp
  1029b1:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1029b4:	0f be c0             	movsbl %al,%eax
  1029b7:	50                   	push   %eax
  1029b8:	6a 61                	push   $0x61
  1029ba:	e8 7e fe ff ff       	call   10283d <outByte>
  1029bf:	83 c4 08             	add    $0x8,%esp
  1029c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1029c5:	c9                   	leave  
  1029c6:	c3                   	ret    

001029c7 <i2A>:
  1029c7:	55                   	push   %ebp
  1029c8:	89 e5                	mov    %esp,%ebp
  1029ca:	83 ec 10             	sub    $0x10,%esp
  1029cd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1029d4:	c7 45 f8 9e 4a 10 00 	movl   $0x104a9e,-0x8(%ebp)
  1029db:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
  1029df:	c6 45 f6 00          	movb   $0x0,-0xa(%ebp)
  1029e3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1029e7:	79 17                	jns    102a00 <i2A+0x39>
  1029e9:	81 7d 08 00 00 00 80 	cmpl   $0x80000000,0x8(%ebp)
  1029f0:	75 07                	jne    1029f9 <i2A+0x32>
  1029f2:	ff 45 08             	incl   0x8(%ebp)
  1029f5:	c6 45 f6 01          	movb   $0x1,-0xa(%ebp)
  1029f9:	c6 45 f7 01          	movb   $0x1,-0x9(%ebp)
  1029fd:	f7 5d 08             	negl   0x8(%ebp)
  102a00:	ff 4d f8             	decl   -0x8(%ebp)
  102a03:	8b 45 08             	mov    0x8(%ebp),%eax
  102a06:	b9 0a 00 00 00       	mov    $0xa,%ecx
  102a0b:	99                   	cltd   
  102a0c:	f7 f9                	idiv   %ecx
  102a0e:	89 d0                	mov    %edx,%eax
  102a10:	83 c0 30             	add    $0x30,%eax
  102a13:	88 c2                	mov    %al,%dl
  102a15:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102a18:	88 10                	mov    %dl,(%eax)
  102a1a:	ff 45 fc             	incl   -0x4(%ebp)
  102a1d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  102a20:	b8 67 66 66 66       	mov    $0x66666667,%eax
  102a25:	f7 e9                	imul   %ecx
  102a27:	c1 fa 02             	sar    $0x2,%edx
  102a2a:	89 c8                	mov    %ecx,%eax
  102a2c:	c1 f8 1f             	sar    $0x1f,%eax
  102a2f:	29 c2                	sub    %eax,%edx
  102a31:	89 d0                	mov    %edx,%eax
  102a33:	89 45 08             	mov    %eax,0x8(%ebp)
  102a36:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102a3a:	75 c4                	jne    102a00 <i2A+0x39>
  102a3c:	80 7d f7 01          	cmpb   $0x1,-0x9(%ebp)
  102a40:	75 0c                	jne    102a4e <i2A+0x87>
  102a42:	ff 4d f8             	decl   -0x8(%ebp)
  102a45:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102a48:	c6 00 2d             	movb   $0x2d,(%eax)
  102a4b:	ff 45 fc             	incl   -0x4(%ebp)
  102a4e:	80 7d f6 01          	cmpb   $0x1,-0xa(%ebp)
  102a52:	75 0b                	jne    102a5f <i2A+0x98>
  102a54:	a0 9d 4a 10 00       	mov    0x104a9d,%al
  102a59:	40                   	inc    %eax
  102a5a:	a2 9d 4a 10 00       	mov    %al,0x104a9d
  102a5f:	c6 05 9e 4a 10 00 00 	movb   $0x0,0x104a9e
  102a66:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a69:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102a6c:	89 10                	mov    %edx,(%eax)
  102a6e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102a71:	c9                   	leave  
  102a72:	c3                   	ret    

00102a73 <append>:
  102a73:	55                   	push   %ebp
  102a74:	89 e5                	mov    %esp,%ebp
  102a76:	83 ec 10             	sub    $0x10,%esp
  102a79:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  102a80:	eb 19                	jmp    102a9b <append+0x28>
  102a82:	ff 45 fc             	incl   -0x4(%ebp)
  102a85:	8b 45 08             	mov    0x8(%ebp),%eax
  102a88:	8d 50 01             	lea    0x1(%eax),%edx
  102a8b:	89 55 08             	mov    %edx,0x8(%ebp)
  102a8e:	8b 55 0c             	mov    0xc(%ebp),%edx
  102a91:	8d 4a 01             	lea    0x1(%edx),%ecx
  102a94:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  102a97:	8a 12                	mov    (%edx),%dl
  102a99:	88 10                	mov    %dl,(%eax)
  102a9b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a9e:	8a 00                	mov    (%eax),%al
  102aa0:	84 c0                	test   %al,%al
  102aa2:	75 de                	jne    102a82 <append+0xf>
  102aa4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102aa7:	c9                   	leave  
  102aa8:	c3                   	ret    

00102aa9 <i2X>:
  102aa9:	55                   	push   %ebp
  102aaa:	89 e5                	mov    %esp,%ebp
  102aac:	83 ec 10             	sub    $0x10,%esp
  102aaf:	c7 45 fc be 4a 10 00 	movl   $0x104abe,-0x4(%ebp)
  102ab6:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  102abd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102ac4:	ff 45 f8             	incl   -0x8(%ebp)
  102ac7:	8b 45 08             	mov    0x8(%ebp),%eax
  102aca:	83 e0 0f             	and    $0xf,%eax
  102acd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102ad0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ad3:	83 e8 0a             	sub    $0xa,%eax
  102ad6:	83 f8 05             	cmp    $0x5,%eax
  102ad9:	77 4b                	ja     102b26 <i2X+0x7d>
  102adb:	8b 04 85 50 30 10 00 	mov    0x103050(,%eax,4),%eax
  102ae2:	ff e0                	jmp    *%eax
  102ae4:	ff 4d fc             	decl   -0x4(%ebp)
  102ae7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102aea:	c6 00 61             	movb   $0x61,(%eax)
  102aed:	eb 47                	jmp    102b36 <i2X+0x8d>
  102aef:	ff 4d fc             	decl   -0x4(%ebp)
  102af2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102af5:	c6 00 62             	movb   $0x62,(%eax)
  102af8:	eb 3c                	jmp    102b36 <i2X+0x8d>
  102afa:	ff 4d fc             	decl   -0x4(%ebp)
  102afd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b00:	c6 00 63             	movb   $0x63,(%eax)
  102b03:	eb 31                	jmp    102b36 <i2X+0x8d>
  102b05:	ff 4d fc             	decl   -0x4(%ebp)
  102b08:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b0b:	c6 00 64             	movb   $0x64,(%eax)
  102b0e:	eb 26                	jmp    102b36 <i2X+0x8d>
  102b10:	ff 4d fc             	decl   -0x4(%ebp)
  102b13:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b16:	c6 00 65             	movb   $0x65,(%eax)
  102b19:	eb 1b                	jmp    102b36 <i2X+0x8d>
  102b1b:	ff 4d fc             	decl   -0x4(%ebp)
  102b1e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b21:	c6 00 66             	movb   $0x66,(%eax)
  102b24:	eb 10                	jmp    102b36 <i2X+0x8d>
  102b26:	ff 4d fc             	decl   -0x4(%ebp)
  102b29:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b2c:	83 c0 30             	add    $0x30,%eax
  102b2f:	88 c2                	mov    %al,%dl
  102b31:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b34:	88 10                	mov    %dl,(%eax)
  102b36:	8b 45 08             	mov    0x8(%ebp),%eax
  102b39:	c1 e8 04             	shr    $0x4,%eax
  102b3c:	89 45 08             	mov    %eax,0x8(%ebp)
  102b3f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102b43:	0f 85 7b ff ff ff    	jne    102ac4 <i2X+0x1b>
  102b49:	c6 05 be 4a 10 00 00 	movb   $0x0,0x104abe
  102b50:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b53:	8b 55 fc             	mov    -0x4(%ebp),%edx
  102b56:	89 10                	mov    %edx,(%eax)
  102b58:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102b5b:	c9                   	leave  
  102b5c:	c3                   	ret    

00102b5d <printk_char>:
  102b5d:	55                   	push   %ebp
  102b5e:	89 e5                	mov    %esp,%ebp
  102b60:	83 ec 08             	sub    $0x8,%esp
  102b63:	eb 17                	jmp    102b7c <printk_char+0x1f>
  102b65:	8b 45 08             	mov    0x8(%ebp),%eax
  102b68:	8a 00                	mov    (%eax),%al
  102b6a:	0f be c0             	movsbl %al,%eax
  102b6d:	83 ec 0c             	sub    $0xc,%esp
  102b70:	50                   	push   %eax
  102b71:	e8 f3 e9 ff ff       	call   101569 <putChar>
  102b76:	83 c4 10             	add    $0x10,%esp
  102b79:	ff 45 08             	incl   0x8(%ebp)
  102b7c:	8b 45 08             	mov    0x8(%ebp),%eax
  102b7f:	8a 00                	mov    (%eax),%al
  102b81:	84 c0                	test   %al,%al
  102b83:	75 e0                	jne    102b65 <printk_char+0x8>
  102b85:	b8 01 00 00 00       	mov    $0x1,%eax
  102b8a:	c9                   	leave  
  102b8b:	c3                   	ret    

00102b8c <printk>:
  102b8c:	55                   	push   %ebp
  102b8d:	89 e5                	mov    %esp,%ebp
  102b8f:	83 ec 28             	sub    $0x28,%esp
  102b92:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102b99:	8d 45 0c             	lea    0xc(%ebp),%eax
  102b9c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102b9f:	8b 45 08             	mov    0x8(%ebp),%eax
  102ba2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102ba5:	c7 45 e8 58 00 00 00 	movl   $0x58,-0x18(%ebp)
  102bac:	e9 57 01 00 00       	jmp    102d08 <printk+0x17c>
  102bb1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102bb4:	8a 00                	mov    (%eax),%al
  102bb6:	3c 25                	cmp    $0x25,%al
  102bb8:	75 56                	jne    102c10 <printk+0x84>
  102bba:	ff 45 ec             	incl   -0x14(%ebp)
  102bbd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102bc0:	8a 00                	mov    (%eax),%al
  102bc2:	0f be c0             	movsbl %al,%eax
  102bc5:	83 f8 64             	cmp    $0x64,%eax
  102bc8:	74 18                	je     102be2 <printk+0x56>
  102bca:	83 f8 64             	cmp    $0x64,%eax
  102bcd:	7f 07                	jg     102bd6 <printk+0x4a>
  102bcf:	83 f8 63             	cmp    $0x63,%eax
  102bd2:	74 29                	je     102bfd <printk+0x71>
  102bd4:	eb 30                	jmp    102c06 <printk+0x7a>
  102bd6:	83 f8 73             	cmp    $0x73,%eax
  102bd9:	74 19                	je     102bf4 <printk+0x68>
  102bdb:	83 f8 78             	cmp    $0x78,%eax
  102bde:	74 0b                	je     102beb <printk+0x5f>
  102be0:	eb 24                	jmp    102c06 <printk+0x7a>
  102be2:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
  102be9:	eb 2c                	jmp    102c17 <printk+0x8b>
  102beb:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  102bf2:	eb 23                	jmp    102c17 <printk+0x8b>
  102bf4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  102bfb:	eb 1a                	jmp    102c17 <printk+0x8b>
  102bfd:	c7 45 e8 03 00 00 00 	movl   $0x3,-0x18(%ebp)
  102c04:	eb 11                	jmp    102c17 <printk+0x8b>
  102c06:	c7 45 e8 58 00 00 00 	movl   $0x58,-0x18(%ebp)
  102c0d:	90                   	nop
  102c0e:	eb 07                	jmp    102c17 <printk+0x8b>
  102c10:	c7 45 e8 58 00 00 00 	movl   $0x58,-0x18(%ebp)
  102c17:	83 7d e8 58          	cmpl   $0x58,-0x18(%ebp)
  102c1b:	75 19                	jne    102c36 <printk+0xaa>
  102c1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c20:	8d 50 01             	lea    0x1(%eax),%edx
  102c23:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102c26:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102c29:	8a 12                	mov    (%edx),%dl
  102c2b:	88 90 80 42 10 00    	mov    %dl,0x104280(%eax)
  102c31:	e9 cf 00 00 00       	jmp    102d05 <printk+0x179>
  102c36:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
  102c3a:	75 3f                	jne    102c7b <printk+0xef>
  102c3c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  102c43:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c46:	8d 50 04             	lea    0x4(%eax),%edx
  102c49:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102c4c:	8b 00                	mov    (%eax),%eax
  102c4e:	89 c2                	mov    %eax,%edx
  102c50:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  102c53:	50                   	push   %eax
  102c54:	52                   	push   %edx
  102c55:	e8 6d fd ff ff       	call   1029c7 <i2A>
  102c5a:	83 c4 08             	add    $0x8,%esp
  102c5d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102c60:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102c63:	81 c2 80 42 10 00    	add    $0x104280,%edx
  102c69:	50                   	push   %eax
  102c6a:	52                   	push   %edx
  102c6b:	e8 03 fe ff ff       	call   102a73 <append>
  102c70:	83 c4 08             	add    $0x8,%esp
  102c73:	01 45 f4             	add    %eax,-0xc(%ebp)
  102c76:	e9 8a 00 00 00       	jmp    102d05 <printk+0x179>
  102c7b:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
  102c7f:	75 3a                	jne    102cbb <printk+0x12f>
  102c81:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  102c88:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c8b:	8d 50 04             	lea    0x4(%eax),%edx
  102c8e:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102c91:	8b 00                	mov    (%eax),%eax
  102c93:	8d 55 e0             	lea    -0x20(%ebp),%edx
  102c96:	52                   	push   %edx
  102c97:	50                   	push   %eax
  102c98:	e8 0c fe ff ff       	call   102aa9 <i2X>
  102c9d:	83 c4 08             	add    $0x8,%esp
  102ca0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102ca3:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102ca6:	81 c2 80 42 10 00    	add    $0x104280,%edx
  102cac:	50                   	push   %eax
  102cad:	52                   	push   %edx
  102cae:	e8 c0 fd ff ff       	call   102a73 <append>
  102cb3:	83 c4 08             	add    $0x8,%esp
  102cb6:	01 45 f4             	add    %eax,-0xc(%ebp)
  102cb9:	eb 4a                	jmp    102d05 <printk+0x179>
  102cbb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102cbf:	75 24                	jne    102ce5 <printk+0x159>
  102cc1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102cc4:	8d 50 04             	lea    0x4(%eax),%edx
  102cc7:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102cca:	8b 00                	mov    (%eax),%eax
  102ccc:	89 c2                	mov    %eax,%edx
  102cce:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102cd1:	05 80 42 10 00       	add    $0x104280,%eax
  102cd6:	52                   	push   %edx
  102cd7:	50                   	push   %eax
  102cd8:	e8 96 fd ff ff       	call   102a73 <append>
  102cdd:	83 c4 08             	add    $0x8,%esp
  102ce0:	01 45 f4             	add    %eax,-0xc(%ebp)
  102ce3:	eb 20                	jmp    102d05 <printk+0x179>
  102ce5:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  102ce9:	75 1a                	jne    102d05 <printk+0x179>
  102ceb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102cee:	8d 50 01             	lea    0x1(%eax),%edx
  102cf1:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102cf4:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102cf7:	8d 4a 04             	lea    0x4(%edx),%ecx
  102cfa:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  102cfd:	8b 12                	mov    (%edx),%edx
  102cff:	88 90 80 42 10 00    	mov    %dl,0x104280(%eax)
  102d05:	ff 45 ec             	incl   -0x14(%ebp)
  102d08:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102d0b:	8a 00                	mov    (%eax),%al
  102d0d:	84 c0                	test   %al,%al
  102d0f:	0f 85 9c fe ff ff    	jne    102bb1 <printk+0x25>
  102d15:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d18:	8d 50 01             	lea    0x1(%eax),%edx
  102d1b:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102d1e:	c6 80 80 42 10 00 00 	movb   $0x0,0x104280(%eax)
  102d25:	83 ec 08             	sub    $0x8,%esp
  102d28:	68 00 04 00 00       	push   $0x400
  102d2d:	68 80 42 10 00       	push   $0x104280
  102d32:	e8 26 fe ff ff       	call   102b5d <printk_char>
  102d37:	83 c4 10             	add    $0x10,%esp
  102d3a:	90                   	nop
  102d3b:	c9                   	leave  
  102d3c:	c3                   	ret    

00102d3d <waitForInterrupt>:
  102d3d:	55                   	push   %ebp
  102d3e:	89 e5                	mov    %esp,%ebp
  102d40:	f4                   	hlt    
  102d41:	90                   	nop
  102d42:	5d                   	pop    %ebp
  102d43:	c3                   	ret    

00102d44 <disableInterrupt>:
  102d44:	55                   	push   %ebp
  102d45:	89 e5                	mov    %esp,%ebp
  102d47:	fa                   	cli    
  102d48:	90                   	nop
  102d49:	5d                   	pop    %ebp
  102d4a:	c3                   	ret    

00102d4b <i2A>:
  102d4b:	55                   	push   %ebp
  102d4c:	89 e5                	mov    %esp,%ebp
  102d4e:	83 ec 10             	sub    $0x10,%esp
  102d51:	c7 45 fc dd 4a 10 00 	movl   $0x104add,-0x4(%ebp)
  102d58:	ff 4d fc             	decl   -0x4(%ebp)
  102d5b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d5e:	b9 0a 00 00 00       	mov    $0xa,%ecx
  102d63:	99                   	cltd   
  102d64:	f7 f9                	idiv   %ecx
  102d66:	89 d0                	mov    %edx,%eax
  102d68:	83 c0 30             	add    $0x30,%eax
  102d6b:	88 c2                	mov    %al,%dl
  102d6d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102d70:	88 10                	mov    %dl,(%eax)
  102d72:	8b 4d 08             	mov    0x8(%ebp),%ecx
  102d75:	b8 67 66 66 66       	mov    $0x66666667,%eax
  102d7a:	f7 e9                	imul   %ecx
  102d7c:	c1 fa 02             	sar    $0x2,%edx
  102d7f:	89 c8                	mov    %ecx,%eax
  102d81:	c1 f8 1f             	sar    $0x1f,%eax
  102d84:	29 c2                	sub    %eax,%edx
  102d86:	89 d0                	mov    %edx,%eax
  102d88:	89 45 08             	mov    %eax,0x8(%ebp)
  102d8b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102d8f:	75 c7                	jne    102d58 <i2A+0xd>
  102d91:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102d94:	c9                   	leave  
  102d95:	c3                   	ret    

00102d96 <append>:
  102d96:	55                   	push   %ebp
  102d97:	89 e5                	mov    %esp,%ebp
  102d99:	eb 1a                	jmp    102db5 <append+0x1f>
  102d9b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d9e:	8b 00                	mov    (%eax),%eax
  102da0:	8d 48 01             	lea    0x1(%eax),%ecx
  102da3:	8b 55 08             	mov    0x8(%ebp),%edx
  102da6:	89 0a                	mov    %ecx,(%edx)
  102da8:	8b 55 0c             	mov    0xc(%ebp),%edx
  102dab:	8d 4a 01             	lea    0x1(%edx),%ecx
  102dae:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  102db1:	8a 12                	mov    (%edx),%dl
  102db3:	88 10                	mov    %dl,(%eax)
  102db5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102db8:	8a 00                	mov    (%eax),%al
  102dba:	84 c0                	test   %al,%al
  102dbc:	75 dd                	jne    102d9b <append+0x5>
  102dbe:	90                   	nop
  102dbf:	5d                   	pop    %ebp
  102dc0:	c3                   	ret    

00102dc1 <displayMessage>:
  102dc1:	55                   	push   %ebp
  102dc2:	89 e5                	mov    %esp,%ebp
  102dc4:	83 ec 18             	sub    $0x18,%esp
  102dc7:	b8 52 41 10 00       	mov    $0x104152,%eax
  102dcc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102dcf:	ff 75 08             	pushl  0x8(%ebp)
  102dd2:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102dd5:	50                   	push   %eax
  102dd6:	e8 bb ff ff ff       	call   102d96 <append>
  102ddb:	83 c4 08             	add    $0x8,%esp
  102dde:	68 68 30 10 00       	push   $0x103068
  102de3:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102de6:	50                   	push   %eax
  102de7:	e8 aa ff ff ff       	call   102d96 <append>
  102dec:	83 c4 08             	add    $0x8,%esp
  102def:	ff 75 0c             	pushl  0xc(%ebp)
  102df2:	e8 54 ff ff ff       	call   102d4b <i2A>
  102df7:	83 c4 04             	add    $0x4,%esp
  102dfa:	50                   	push   %eax
  102dfb:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102dfe:	50                   	push   %eax
  102dff:	e8 92 ff ff ff       	call   102d96 <append>
  102e04:	83 c4 08             	add    $0x8,%esp
  102e07:	68 6a 30 10 00       	push   $0x10306a
  102e0c:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102e0f:	50                   	push   %eax
  102e10:	e8 81 ff ff ff       	call   102d96 <append>
  102e15:	83 c4 08             	add    $0x8,%esp
  102e18:	c7 45 f4 40 41 10 00 	movl   $0x104140,-0xc(%ebp)
  102e1f:	eb 1b                	jmp    102e3c <displayMessage+0x7b>
  102e21:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102e24:	8a 00                	mov    (%eax),%al
  102e26:	0f be c0             	movsbl %al,%eax
  102e29:	83 ec 0c             	sub    $0xc,%esp
  102e2c:	50                   	push   %eax
  102e2d:	e8 37 e7 ff ff       	call   101569 <putChar>
  102e32:	83 c4 10             	add    $0x10,%esp
  102e35:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102e38:	40                   	inc    %eax
  102e39:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102e3f:	8a 00                	mov    (%eax),%al
  102e41:	84 c0                	test   %al,%al
  102e43:	75 dc                	jne    102e21 <displayMessage+0x60>
  102e45:	90                   	nop
  102e46:	c9                   	leave  
  102e47:	c3                   	ret    

00102e48 <abort>:
  102e48:	55                   	push   %ebp
  102e49:	89 e5                	mov    %esp,%ebp
  102e4b:	83 ec 08             	sub    $0x8,%esp
  102e4e:	e8 f1 fe ff ff       	call   102d44 <disableInterrupt>
  102e53:	83 ec 08             	sub    $0x8,%esp
  102e56:	ff 75 0c             	pushl  0xc(%ebp)
  102e59:	ff 75 08             	pushl  0x8(%ebp)
  102e5c:	e8 60 ff ff ff       	call   102dc1 <displayMessage>
  102e61:	83 c4 10             	add    $0x10,%esp
  102e64:	e8 d4 fe ff ff       	call   102d3d <waitForInterrupt>
  102e69:	eb f9                	jmp    102e64 <abort+0x1c>

00102e6b <irqEmpty>:
  102e6b:	6a 00                	push   $0x0
  102e6d:	6a ff                	push   $0xffffffff
  102e6f:	eb 13                	jmp    102e84 <asmDoIrq>

00102e71 <irqGProtectFault>:
  102e71:	6a 0d                	push   $0xd
  102e73:	eb 0f                	jmp    102e84 <asmDoIrq>

00102e75 <irqSyscall>:
  102e75:	6a 00                	push   $0x0
  102e77:	68 80 00 00 00       	push   $0x80
  102e7c:	eb 06                	jmp    102e84 <asmDoIrq>

00102e7e <irqTime>:
  102e7e:	6a 00                	push   $0x0
  102e80:	6a 20                	push   $0x20
  102e82:	eb 00                	jmp    102e84 <asmDoIrq>

00102e84 <asmDoIrq>:
  102e84:	60                   	pusha  
  102e85:	1e                   	push   %ds
  102e86:	06                   	push   %es
  102e87:	0f a0                	push   %fs
  102e89:	0f a8                	push   %gs
  102e8b:	54                   	push   %esp
  102e8c:	e8 36 f2 ff ff       	call   1020c7 <irqHandle>
  102e91:	5c                   	pop    %esp
  102e92:	0f a9                	pop    %gs
  102e94:	0f a1                	pop    %fs
  102e96:	07                   	pop    %es
  102e97:	1f                   	pop    %ds
  102e98:	61                   	popa   
  102e99:	83 c4 04             	add    $0x4,%esp
  102e9c:	83 c4 04             	add    $0x4,%esp
  102e9f:	cf                   	iret   
