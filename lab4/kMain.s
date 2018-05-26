
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
  10001c:	e8 17 29 00 00       	call   102938 <initTimer>
  100021:	e8 38 1d 00 00       	call   101d5e <init_pcb>
  100026:	e8 f9 1d 00 00       	call   101e24 <init_kernel_pcb>
  10002b:	e8 aa 14 00 00       	call   1014da <initSerial>
  100030:	e8 37 20 00 00       	call   10206c <initIdt>
  100035:	e8 3b 28 00 00       	call   102875 <initIntr>
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
  1003c6:	68 bc 2e 10 00       	push   $0x102ebc
  1003cb:	e8 d7 27 00 00       	call   102ba7 <printk>
  1003d0:	83 c4 10             	add    $0x10,%esp
  1003d3:	83 ec 0c             	sub    $0xc,%esp
  1003d6:	ff 75 f4             	pushl  -0xc(%ebp)
  1003d9:	68 fc 2e 10 00       	push   $0x102efc
  1003de:	6a 17                	push   $0x17
  1003e0:	68 c2 2e 10 00       	push   $0x102ec2
  1003e5:	68 cf 2e 10 00       	push   $0x102ecf
  1003ea:	e8 b8 27 00 00       	call   102ba7 <printk>
  1003ef:	83 c4 20             	add    $0x20,%esp
  1003f2:	83 ec 0c             	sub    $0xc,%esp
  1003f5:	68 eb 2e 10 00       	push   $0x102eeb
  1003fa:	e8 a8 27 00 00       	call   102ba7 <printk>
  1003ff:	83 c4 10             	add    $0x10,%esp
  100402:	83 ec 08             	sub    $0x8,%esp
  100405:	6a 18                	push   $0x18
  100407:	68 c2 2e 10 00       	push   $0x102ec2
  10040c:	e8 52 2a 00 00       	call   102e63 <abort>
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
  100867:	a1 f4 2e 10 00       	mov    0x102ef4,%eax
  10086c:	8b 15 f8 2e 10 00    	mov    0x102ef8,%edx
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
  100cbb:	e8 30 0d 00 00       	call   1019f0 <put_into_block>
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
  1010dd:	68 07 2f 10 00       	push   $0x102f07
  1010e2:	e8 7c 1d 00 00       	call   102e63 <abort>
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
  1011af:	68 07 2f 10 00       	push   $0x102f07
  1011b4:	e8 aa 1c 00 00       	call   102e63 <abort>
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
  1013b4:	68 24 2f 10 00       	push   $0x102f24
  1013b9:	e8 e9 17 00 00       	call   102ba7 <printk>
  1013be:	83 c4 10             	add    $0x10,%esp
  1013c1:	83 ec 0c             	sub    $0xc,%esp
  1013c4:	ff 75 e8             	pushl  -0x18(%ebp)
  1013c7:	68 60 2f 10 00       	push   $0x102f60
  1013cc:	6a 5a                	push   $0x5a
  1013ce:	68 2a 2f 10 00       	push   $0x102f2a
  1013d3:	68 45 2f 10 00       	push   $0x102f45
  1013d8:	e8 ca 17 00 00       	call   102ba7 <printk>
  1013dd:	83 c4 20             	add    $0x20,%esp
  1013e0:	83 ec 0c             	sub    $0xc,%esp
  1013e3:	68 5a 2f 10 00       	push   $0x102f5a
  1013e8:	e8 ba 17 00 00       	call   102ba7 <printk>
  1013ed:	83 c4 10             	add    $0x10,%esp
  1013f0:	83 ec 08             	sub    $0x8,%esp
  1013f3:	6a 5b                	push   $0x5b
  1013f5:	68 2a 2f 10 00       	push   $0x102f2a
  1013fa:	e8 64 1a 00 00       	call   102e63 <abort>
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
  101613:	e8 6a 04 00 00       	call   101a82 <get_from>
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
  101631:	e8 43 02 00 00       	call   101879 <put_into>
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
  10166f:	e8 0e 04 00 00       	call   101a82 <get_from>
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
  1016f1:	83 ec 0c             	sub    $0xc,%esp
  1016f4:	68 6c 2f 10 00       	push   $0x102f6c
  1016f9:	e8 a9 14 00 00       	call   102ba7 <printk>
  1016fe:	83 c4 10             	add    $0x10,%esp
  101701:	8b 45 0c             	mov    0xc(%ebp),%eax
  101704:	8b 50 38             	mov    0x38(%eax),%edx
  101707:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  10170c:	83 ec 08             	sub    $0x8,%esp
  10170f:	52                   	push   %edx
  101710:	50                   	push   %eax
  101711:	68 d0 2f 10 00       	push   $0x102fd0
  101716:	6a 34                	push   $0x34
  101718:	68 72 2f 10 00       	push   $0x102f72
  10171d:	68 80 2f 10 00       	push   $0x102f80
  101722:	e8 80 14 00 00       	call   102ba7 <printk>
  101727:	83 c4 20             	add    $0x20,%esp
  10172a:	83 ec 0c             	sub    $0xc,%esp
  10172d:	68 a3 2f 10 00       	push   $0x102fa3
  101732:	e8 70 14 00 00       	call   102ba7 <printk>
  101737:	83 c4 10             	add    $0x10,%esp
  10173a:	83 ec 08             	sub    $0x8,%esp
  10173d:	ff 75 08             	pushl  0x8(%ebp)
  101740:	6a 01                	push   $0x1
  101742:	e8 32 01 00 00       	call   101879 <put_into>
  101747:	83 c4 10             	add    $0x10,%esp
  10174a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10174d:	5b                   	pop    %ebx
  10174e:	5e                   	pop    %esi
  10174f:	5f                   	pop    %edi
  101750:	5d                   	pop    %ebp
  101751:	c3                   	ret    

00101752 <check_block>:
  101752:	55                   	push   %ebp
  101753:	89 e5                	mov    %esp,%ebp
  101755:	83 ec 18             	sub    $0x18,%esp
  101758:	a1 3c 41 10 00       	mov    0x10413c,%eax
  10175d:	83 f8 ff             	cmp    $0xffffffff,%eax
  101760:	75 0a                	jne    10176c <check_block+0x1a>
  101762:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101767:	e9 0b 01 00 00       	jmp    101877 <check_block+0x125>
  10176c:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101771:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101774:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  10177b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10177e:	89 d0                	mov    %edx,%eax
  101780:	c1 e0 07             	shl    $0x7,%eax
  101783:	01 d0                	add    %edx,%eax
  101785:	01 c0                	add    %eax,%eax
  101787:	01 d0                	add    %edx,%eax
  101789:	01 c0                	add    %eax,%eax
  10178b:	01 d0                	add    %edx,%eax
  10178d:	c1 e0 04             	shl    $0x4,%eax
  101790:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  101795:	8b 00                	mov    (%eax),%eax
  101797:	85 c0                	test   %eax,%eax
  101799:	0f 85 9c 00 00 00    	jne    10183b <check_block+0xe9>
  10179f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1017a2:	89 d0                	mov    %edx,%eax
  1017a4:	c1 e0 07             	shl    $0x7,%eax
  1017a7:	01 d0                	add    %edx,%eax
  1017a9:	01 c0                	add    %eax,%eax
  1017ab:	01 d0                	add    %edx,%eax
  1017ad:	01 c0                	add    %eax,%eax
  1017af:	01 d0                	add    %edx,%eax
  1017b1:	c1 e0 04             	shl    $0x4,%eax
  1017b4:	05 54 6b 10 00       	add    $0x106b54,%eax
  1017b9:	8b 00                	mov    (%eax),%eax
  1017bb:	85 c0                	test   %eax,%eax
  1017bd:	7f 7c                	jg     10183b <check_block+0xe9>
  1017bf:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1017c2:	89 d0                	mov    %edx,%eax
  1017c4:	c1 e0 07             	shl    $0x7,%eax
  1017c7:	01 d0                	add    %edx,%eax
  1017c9:	01 c0                	add    %eax,%eax
  1017cb:	01 d0                	add    %edx,%eax
  1017cd:	01 c0                	add    %eax,%eax
  1017cf:	01 d0                	add    %edx,%eax
  1017d1:	c1 e0 04             	shl    $0x4,%eax
  1017d4:	05 60 6b 10 00       	add    $0x106b60,%eax
  1017d9:	8b 00                	mov    (%eax),%eax
  1017db:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1017de:	83 ec 0c             	sub    $0xc,%esp
  1017e1:	ff 75 f4             	pushl  -0xc(%ebp)
  1017e4:	e8 6b 04 00 00       	call   101c54 <get_from_block>
  1017e9:	83 c4 10             	add    $0x10,%esp
  1017ec:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1017ef:	89 d0                	mov    %edx,%eax
  1017f1:	c1 e0 07             	shl    $0x7,%eax
  1017f4:	01 d0                	add    %edx,%eax
  1017f6:	01 c0                	add    %eax,%eax
  1017f8:	01 d0                	add    %edx,%eax
  1017fa:	01 c0                	add    %eax,%eax
  1017fc:	01 d0                	add    %edx,%eax
  1017fe:	c1 e0 04             	shl    $0x4,%eax
  101801:	05 00 20 00 00       	add    $0x2000,%eax
  101806:	05 00 4b 10 00       	add    $0x104b00,%eax
  10180b:	83 ec 08             	sub    $0x8,%esp
  10180e:	50                   	push   %eax
  10180f:	ff 75 f4             	pushl  -0xc(%ebp)
  101812:	e8 62 fe ff ff       	call   101679 <put_into_runnable>
  101817:	83 c4 10             	add    $0x10,%esp
  10181a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10181d:	89 d0                	mov    %edx,%eax
  10181f:	c1 e0 07             	shl    $0x7,%eax
  101822:	01 d0                	add    %edx,%eax
  101824:	01 c0                	add    %eax,%eax
  101826:	01 d0                	add    %edx,%eax
  101828:	01 c0                	add    %eax,%eax
  10182a:	01 d0                	add    %edx,%eax
  10182c:	c1 e0 04             	shl    $0x4,%eax
  10182f:	05 60 6b 10 00       	add    $0x106b60,%eax
  101834:	8b 00                	mov    (%eax),%eax
  101836:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101839:	eb 1f                	jmp    10185a <check_block+0x108>
  10183b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10183e:	89 d0                	mov    %edx,%eax
  101840:	c1 e0 07             	shl    $0x7,%eax
  101843:	01 d0                	add    %edx,%eax
  101845:	01 c0                	add    %eax,%eax
  101847:	01 d0                	add    %edx,%eax
  101849:	01 c0                	add    %eax,%eax
  10184b:	01 d0                	add    %edx,%eax
  10184d:	c1 e0 04             	shl    $0x4,%eax
  101850:	05 60 6b 10 00       	add    $0x106b60,%eax
  101855:	8b 00                	mov    (%eax),%eax
  101857:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10185a:	a1 3c 41 10 00       	mov    0x10413c,%eax
  10185f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  101862:	74 0e                	je     101872 <check_block+0x120>
  101864:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101869:	83 f8 ff             	cmp    $0xffffffff,%eax
  10186c:	0f 85 09 ff ff ff    	jne    10177b <check_block+0x29>
  101872:	b8 01 00 00 00       	mov    $0x1,%eax
  101877:	c9                   	leave  
  101878:	c3                   	ret    

00101879 <put_into>:
  101879:	55                   	push   %ebp
  10187a:	89 e5                	mov    %esp,%ebp
  10187c:	83 ec 18             	sub    $0x18,%esp
  10187f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101886:	8b 45 08             	mov    0x8(%ebp),%eax
  101889:	83 f8 01             	cmp    $0x1,%eax
  10188c:	74 14                	je     1018a2 <put_into+0x29>
  10188e:	83 f8 03             	cmp    $0x3,%eax
  101891:	74 06                	je     101899 <put_into+0x20>
  101893:	85 c0                	test   %eax,%eax
  101895:	74 14                	je     1018ab <put_into+0x32>
  101897:	eb 1b                	jmp    1018b4 <put_into+0x3b>
  101899:	c7 45 f4 58 42 10 00 	movl   $0x104258,-0xc(%ebp)
  1018a0:	eb 2e                	jmp    1018d0 <put_into+0x57>
  1018a2:	c7 45 f4 38 41 10 00 	movl   $0x104138,-0xc(%ebp)
  1018a9:	eb 25                	jmp    1018d0 <put_into+0x57>
  1018ab:	c7 45 f4 3c 41 10 00 	movl   $0x10413c,-0xc(%ebp)
  1018b2:	eb 1c                	jmp    1018d0 <put_into+0x57>
  1018b4:	83 ec 08             	sub    $0x8,%esp
  1018b7:	6a 62                	push   $0x62
  1018b9:	68 72 2f 10 00       	push   $0x102f72
  1018be:	e8 a0 15 00 00       	call   102e63 <abort>
  1018c3:	83 c4 10             	add    $0x10,%esp
  1018c6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1018cb:	e9 1e 01 00 00       	jmp    1019ee <put_into+0x175>
  1018d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018d3:	8b 00                	mov    (%eax),%eax
  1018d5:	83 f8 ff             	cmp    $0xffffffff,%eax
  1018d8:	75 57                	jne    101931 <put_into+0xb8>
  1018da:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018dd:	8b 55 0c             	mov    0xc(%ebp),%edx
  1018e0:	89 10                	mov    %edx,(%eax)
  1018e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018e5:	8b 10                	mov    (%eax),%edx
  1018e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018ea:	8b 00                	mov    (%eax),%eax
  1018ec:	89 c1                	mov    %eax,%ecx
  1018ee:	89 d0                	mov    %edx,%eax
  1018f0:	c1 e0 07             	shl    $0x7,%eax
  1018f3:	01 d0                	add    %edx,%eax
  1018f5:	01 c0                	add    %eax,%eax
  1018f7:	01 d0                	add    %edx,%eax
  1018f9:	01 c0                	add    %eax,%eax
  1018fb:	01 d0                	add    %edx,%eax
  1018fd:	c1 e0 04             	shl    $0x4,%eax
  101900:	05 60 6b 10 00       	add    $0x106b60,%eax
  101905:	89 08                	mov    %ecx,(%eax)
  101907:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10190a:	8b 10                	mov    (%eax),%edx
  10190c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10190f:	8b 00                	mov    (%eax),%eax
  101911:	89 c1                	mov    %eax,%ecx
  101913:	89 d0                	mov    %edx,%eax
  101915:	c1 e0 07             	shl    $0x7,%eax
  101918:	01 d0                	add    %edx,%eax
  10191a:	01 c0                	add    %eax,%eax
  10191c:	01 d0                	add    %edx,%eax
  10191e:	01 c0                	add    %eax,%eax
  101920:	01 d0                	add    %edx,%eax
  101922:	c1 e0 04             	shl    $0x4,%eax
  101925:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  10192a:	89 08                	mov    %ecx,(%eax)
  10192c:	e9 b8 00 00 00       	jmp    1019e9 <put_into+0x170>
  101931:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101934:	8b 10                	mov    (%eax),%edx
  101936:	89 d0                	mov    %edx,%eax
  101938:	c1 e0 07             	shl    $0x7,%eax
  10193b:	01 d0                	add    %edx,%eax
  10193d:	01 c0                	add    %eax,%eax
  10193f:	01 d0                	add    %edx,%eax
  101941:	01 c0                	add    %eax,%eax
  101943:	01 d0                	add    %edx,%eax
  101945:	c1 e0 04             	shl    $0x4,%eax
  101948:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  10194d:	8b 10                	mov    (%eax),%edx
  10194f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  101952:	89 d0                	mov    %edx,%eax
  101954:	c1 e0 07             	shl    $0x7,%eax
  101957:	01 d0                	add    %edx,%eax
  101959:	01 c0                	add    %eax,%eax
  10195b:	01 d0                	add    %edx,%eax
  10195d:	01 c0                	add    %eax,%eax
  10195f:	01 d0                	add    %edx,%eax
  101961:	c1 e0 04             	shl    $0x4,%eax
  101964:	05 60 6b 10 00       	add    $0x106b60,%eax
  101969:	89 08                	mov    %ecx,(%eax)
  10196b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10196e:	8b 10                	mov    (%eax),%edx
  101970:	89 d0                	mov    %edx,%eax
  101972:	c1 e0 07             	shl    $0x7,%eax
  101975:	01 d0                	add    %edx,%eax
  101977:	01 c0                	add    %eax,%eax
  101979:	01 d0                	add    %edx,%eax
  10197b:	01 c0                	add    %eax,%eax
  10197d:	01 d0                	add    %edx,%eax
  10197f:	c1 e0 04             	shl    $0x4,%eax
  101982:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  101987:	8b 08                	mov    (%eax),%ecx
  101989:	8b 55 0c             	mov    0xc(%ebp),%edx
  10198c:	89 d0                	mov    %edx,%eax
  10198e:	c1 e0 07             	shl    $0x7,%eax
  101991:	01 d0                	add    %edx,%eax
  101993:	01 c0                	add    %eax,%eax
  101995:	01 d0                	add    %edx,%eax
  101997:	01 c0                	add    %eax,%eax
  101999:	01 d0                	add    %edx,%eax
  10199b:	c1 e0 04             	shl    $0x4,%eax
  10199e:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  1019a3:	89 08                	mov    %ecx,(%eax)
  1019a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1019a8:	8b 00                	mov    (%eax),%eax
  1019aa:	89 c1                	mov    %eax,%ecx
  1019ac:	8b 55 0c             	mov    0xc(%ebp),%edx
  1019af:	89 d0                	mov    %edx,%eax
  1019b1:	c1 e0 07             	shl    $0x7,%eax
  1019b4:	01 d0                	add    %edx,%eax
  1019b6:	01 c0                	add    %eax,%eax
  1019b8:	01 d0                	add    %edx,%eax
  1019ba:	01 c0                	add    %eax,%eax
  1019bc:	01 d0                	add    %edx,%eax
  1019be:	c1 e0 04             	shl    $0x4,%eax
  1019c1:	05 60 6b 10 00       	add    $0x106b60,%eax
  1019c6:	89 08                	mov    %ecx,(%eax)
  1019c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1019cb:	8b 10                	mov    (%eax),%edx
  1019cd:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1019d0:	89 d0                	mov    %edx,%eax
  1019d2:	c1 e0 07             	shl    $0x7,%eax
  1019d5:	01 d0                	add    %edx,%eax
  1019d7:	01 c0                	add    %eax,%eax
  1019d9:	01 d0                	add    %edx,%eax
  1019db:	01 c0                	add    %eax,%eax
  1019dd:	01 d0                	add    %edx,%eax
  1019df:	c1 e0 04             	shl    $0x4,%eax
  1019e2:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  1019e7:	89 08                	mov    %ecx,(%eax)
  1019e9:	b8 01 00 00 00       	mov    $0x1,%eax
  1019ee:	c9                   	leave  
  1019ef:	c3                   	ret    

001019f0 <put_into_block>:
  1019f0:	55                   	push   %ebp
  1019f1:	89 e5                	mov    %esp,%ebp
  1019f3:	57                   	push   %edi
  1019f4:	56                   	push   %esi
  1019f5:	53                   	push   %ebx
  1019f6:	83 ec 0c             	sub    $0xc,%esp
  1019f9:	8b 55 08             	mov    0x8(%ebp),%edx
  1019fc:	89 d0                	mov    %edx,%eax
  1019fe:	c1 e0 07             	shl    $0x7,%eax
  101a01:	01 d0                	add    %edx,%eax
  101a03:	01 c0                	add    %eax,%eax
  101a05:	01 d0                	add    %edx,%eax
  101a07:	01 c0                	add    %eax,%eax
  101a09:	01 d0                	add    %edx,%eax
  101a0b:	c1 e0 04             	shl    $0x4,%eax
  101a0e:	8d 90 00 6b 10 00    	lea    0x106b00(%eax),%edx
  101a14:	8b 45 0c             	mov    0xc(%ebp),%eax
  101a17:	89 c3                	mov    %eax,%ebx
  101a19:	b8 13 00 00 00       	mov    $0x13,%eax
  101a1e:	89 d7                	mov    %edx,%edi
  101a20:	89 de                	mov    %ebx,%esi
  101a22:	89 c1                	mov    %eax,%ecx
  101a24:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101a26:	8b 45 0c             	mov    0xc(%ebp),%eax
  101a29:	8b 40 20             	mov    0x20(%eax),%eax
  101a2c:	89 c1                	mov    %eax,%ecx
  101a2e:	8b 55 08             	mov    0x8(%ebp),%edx
  101a31:	89 d0                	mov    %edx,%eax
  101a33:	c1 e0 07             	shl    $0x7,%eax
  101a36:	01 d0                	add    %edx,%eax
  101a38:	01 c0                	add    %eax,%eax
  101a3a:	01 d0                	add    %edx,%eax
  101a3c:	01 c0                	add    %eax,%eax
  101a3e:	01 d0                	add    %edx,%eax
  101a40:	c1 e0 04             	shl    $0x4,%eax
  101a43:	05 54 6b 10 00       	add    $0x106b54,%eax
  101a48:	89 08                	mov    %ecx,(%eax)
  101a4a:	8b 55 08             	mov    0x8(%ebp),%edx
  101a4d:	89 d0                	mov    %edx,%eax
  101a4f:	c1 e0 07             	shl    $0x7,%eax
  101a52:	01 d0                	add    %edx,%eax
  101a54:	01 c0                	add    %eax,%eax
  101a56:	01 d0                	add    %edx,%eax
  101a58:	01 c0                	add    %eax,%eax
  101a5a:	01 d0                	add    %edx,%eax
  101a5c:	c1 e0 04             	shl    $0x4,%eax
  101a5f:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  101a64:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  101a6a:	83 ec 08             	sub    $0x8,%esp
  101a6d:	ff 75 08             	pushl  0x8(%ebp)
  101a70:	6a 00                	push   $0x0
  101a72:	e8 02 fe ff ff       	call   101879 <put_into>
  101a77:	83 c4 10             	add    $0x10,%esp
  101a7a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101a7d:	5b                   	pop    %ebx
  101a7e:	5e                   	pop    %esi
  101a7f:	5f                   	pop    %edi
  101a80:	5d                   	pop    %ebp
  101a81:	c3                   	ret    

00101a82 <get_from>:
  101a82:	55                   	push   %ebp
  101a83:	89 e5                	mov    %esp,%ebp
  101a85:	83 ec 18             	sub    $0x18,%esp
  101a88:	83 ec 08             	sub    $0x8,%esp
  101a8b:	ff 75 0c             	pushl  0xc(%ebp)
  101a8e:	ff 75 08             	pushl  0x8(%ebp)
  101a91:	e8 f9 01 00 00       	call   101c8f <check_is_in>
  101a96:	83 c4 10             	add    $0x10,%esp
  101a99:	83 f8 01             	cmp    $0x1,%eax
  101a9c:	74 64                	je     101b02 <get_from+0x80>
  101a9e:	83 ec 0c             	sub    $0xc,%esp
  101aa1:	68 6c 2f 10 00       	push   $0x102f6c
  101aa6:	e8 fc 10 00 00       	call   102ba7 <printk>
  101aab:	83 c4 10             	add    $0x10,%esp
  101aae:	83 ec 08             	sub    $0x8,%esp
  101ab1:	ff 75 0c             	pushl  0xc(%ebp)
  101ab4:	ff 75 08             	pushl  0x8(%ebp)
  101ab7:	68 e4 2f 10 00       	push   $0x102fe4
  101abc:	68 82 00 00 00       	push   $0x82
  101ac1:	68 72 2f 10 00       	push   $0x102f72
  101ac6:	68 ac 2f 10 00       	push   $0x102fac
  101acb:	e8 d7 10 00 00       	call   102ba7 <printk>
  101ad0:	83 c4 20             	add    $0x20,%esp
  101ad3:	83 ec 0c             	sub    $0xc,%esp
  101ad6:	68 a3 2f 10 00       	push   $0x102fa3
  101adb:	e8 c7 10 00 00       	call   102ba7 <printk>
  101ae0:	83 c4 10             	add    $0x10,%esp
  101ae3:	83 ec 08             	sub    $0x8,%esp
  101ae6:	68 83 00 00 00       	push   $0x83
  101aeb:	68 72 2f 10 00       	push   $0x102f72
  101af0:	e8 6e 13 00 00       	call   102e63 <abort>
  101af5:	83 c4 10             	add    $0x10,%esp
  101af8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101afd:	e9 50 01 00 00       	jmp    101c52 <get_from+0x1d0>
  101b02:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101b09:	8b 55 0c             	mov    0xc(%ebp),%edx
  101b0c:	89 d0                	mov    %edx,%eax
  101b0e:	c1 e0 07             	shl    $0x7,%eax
  101b11:	01 d0                	add    %edx,%eax
  101b13:	01 c0                	add    %eax,%eax
  101b15:	01 d0                	add    %edx,%eax
  101b17:	01 c0                	add    %eax,%eax
  101b19:	01 d0                	add    %edx,%eax
  101b1b:	c1 e0 04             	shl    $0x4,%eax
  101b1e:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  101b23:	8b 00                	mov    (%eax),%eax
  101b25:	83 f8 01             	cmp    $0x1,%eax
  101b28:	74 14                	je     101b3e <get_from+0xbc>
  101b2a:	83 f8 03             	cmp    $0x3,%eax
  101b2d:	74 06                	je     101b35 <get_from+0xb3>
  101b2f:	85 c0                	test   %eax,%eax
  101b31:	74 14                	je     101b47 <get_from+0xc5>
  101b33:	eb 1b                	jmp    101b50 <get_from+0xce>
  101b35:	c7 45 f4 58 42 10 00 	movl   $0x104258,-0xc(%ebp)
  101b3c:	eb 27                	jmp    101b65 <get_from+0xe3>
  101b3e:	c7 45 f4 38 41 10 00 	movl   $0x104138,-0xc(%ebp)
  101b45:	eb 1e                	jmp    101b65 <get_from+0xe3>
  101b47:	c7 45 f4 3c 41 10 00 	movl   $0x10413c,-0xc(%ebp)
  101b4e:	eb 15                	jmp    101b65 <get_from+0xe3>
  101b50:	83 ec 08             	sub    $0x8,%esp
  101b53:	68 95 00 00 00       	push   $0x95
  101b58:	68 72 2f 10 00       	push   $0x102f72
  101b5d:	e8 01 13 00 00       	call   102e63 <abort>
  101b62:	83 c4 10             	add    $0x10,%esp
  101b65:	8b 45 08             	mov    0x8(%ebp),%eax
  101b68:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101b6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b6e:	8b 00                	mov    (%eax),%eax
  101b70:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  101b73:	74 15                	je     101b8a <get_from+0x108>
  101b75:	83 ec 08             	sub    $0x8,%esp
  101b78:	68 9a 00 00 00       	push   $0x9a
  101b7d:	68 72 2f 10 00       	push   $0x102f72
  101b82:	e8 dc 12 00 00       	call   102e63 <abort>
  101b87:	83 c4 10             	add    $0x10,%esp
  101b8a:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  101b8e:	75 0a                	jne    101b9a <get_from+0x118>
  101b90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101b95:	e9 b8 00 00 00       	jmp    101c52 <get_from+0x1d0>
  101b9a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101b9d:	89 d0                	mov    %edx,%eax
  101b9f:	c1 e0 07             	shl    $0x7,%eax
  101ba2:	01 d0                	add    %edx,%eax
  101ba4:	01 c0                	add    %eax,%eax
  101ba6:	01 d0                	add    %edx,%eax
  101ba8:	01 c0                	add    %eax,%eax
  101baa:	01 d0                	add    %edx,%eax
  101bac:	c1 e0 04             	shl    $0x4,%eax
  101baf:	05 60 6b 10 00       	add    $0x106b60,%eax
  101bb4:	8b 10                	mov    (%eax),%edx
  101bb6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101bb9:	39 c2                	cmp    %eax,%edx
  101bbb:	75 0e                	jne    101bcb <get_from+0x149>
  101bbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101bc0:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
  101bc6:	e9 84 00 00 00       	jmp    101c4f <get_from+0x1cd>
  101bcb:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101bce:	89 d0                	mov    %edx,%eax
  101bd0:	c1 e0 07             	shl    $0x7,%eax
  101bd3:	01 d0                	add    %edx,%eax
  101bd5:	01 c0                	add    %eax,%eax
  101bd7:	01 d0                	add    %edx,%eax
  101bd9:	01 c0                	add    %eax,%eax
  101bdb:	01 d0                	add    %edx,%eax
  101bdd:	c1 e0 04             	shl    $0x4,%eax
  101be0:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  101be5:	8b 00                	mov    (%eax),%eax
  101be7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  101bea:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101bed:	89 d0                	mov    %edx,%eax
  101bef:	c1 e0 07             	shl    $0x7,%eax
  101bf2:	01 d0                	add    %edx,%eax
  101bf4:	01 c0                	add    %eax,%eax
  101bf6:	01 d0                	add    %edx,%eax
  101bf8:	01 c0                	add    %eax,%eax
  101bfa:	01 d0                	add    %edx,%eax
  101bfc:	c1 e0 04             	shl    $0x4,%eax
  101bff:	05 60 6b 10 00       	add    $0x106b60,%eax
  101c04:	8b 00                	mov    (%eax),%eax
  101c06:	89 45 e8             	mov    %eax,-0x18(%ebp)
  101c09:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  101c0c:	8b 55 ec             	mov    -0x14(%ebp),%edx
  101c0f:	89 d0                	mov    %edx,%eax
  101c11:	c1 e0 07             	shl    $0x7,%eax
  101c14:	01 d0                	add    %edx,%eax
  101c16:	01 c0                	add    %eax,%eax
  101c18:	01 d0                	add    %edx,%eax
  101c1a:	01 c0                	add    %eax,%eax
  101c1c:	01 d0                	add    %edx,%eax
  101c1e:	c1 e0 04             	shl    $0x4,%eax
  101c21:	05 60 6b 10 00       	add    $0x106b60,%eax
  101c26:	89 08                	mov    %ecx,(%eax)
  101c28:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  101c2b:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101c2e:	89 d0                	mov    %edx,%eax
  101c30:	c1 e0 07             	shl    $0x7,%eax
  101c33:	01 d0                	add    %edx,%eax
  101c35:	01 c0                	add    %eax,%eax
  101c37:	01 d0                	add    %edx,%eax
  101c39:	01 c0                	add    %eax,%eax
  101c3b:	01 d0                	add    %edx,%eax
  101c3d:	c1 e0 04             	shl    $0x4,%eax
  101c40:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  101c45:	89 08                	mov    %ecx,(%eax)
  101c47:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c4a:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101c4d:	89 10                	mov    %edx,(%eax)
  101c4f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101c52:	c9                   	leave  
  101c53:	c3                   	ret    

00101c54 <get_from_block>:
  101c54:	55                   	push   %ebp
  101c55:	89 e5                	mov    %esp,%ebp
  101c57:	83 ec 08             	sub    $0x8,%esp
  101c5a:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101c5f:	83 ec 08             	sub    $0x8,%esp
  101c62:	ff 75 08             	pushl  0x8(%ebp)
  101c65:	50                   	push   %eax
  101c66:	e8 17 fe ff ff       	call   101a82 <get_from>
  101c6b:	83 c4 10             	add    $0x10,%esp
  101c6e:	83 f8 ff             	cmp    $0xffffffff,%eax
  101c71:	75 15                	jne    101c88 <get_from_block+0x34>
  101c73:	83 ec 08             	sub    $0x8,%esp
  101c76:	68 b1 00 00 00       	push   $0xb1
  101c7b:	68 72 2f 10 00       	push   $0x102f72
  101c80:	e8 de 11 00 00       	call   102e63 <abort>
  101c85:	83 c4 10             	add    $0x10,%esp
  101c88:	b8 01 00 00 00       	mov    $0x1,%eax
  101c8d:	c9                   	leave  
  101c8e:	c3                   	ret    

00101c8f <check_is_in>:
  101c8f:	55                   	push   %ebp
  101c90:	89 e5                	mov    %esp,%ebp
  101c92:	83 ec 10             	sub    $0x10,%esp
  101c95:	8b 45 08             	mov    0x8(%ebp),%eax
  101c98:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101c9b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101c9e:	3b 45 0c             	cmp    0xc(%ebp),%eax
  101ca1:	75 07                	jne    101caa <check_is_in+0x1b>
  101ca3:	b8 01 00 00 00       	mov    $0x1,%eax
  101ca8:	eb 2c                	jmp    101cd6 <check_is_in+0x47>
  101caa:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101cad:	89 d0                	mov    %edx,%eax
  101caf:	c1 e0 07             	shl    $0x7,%eax
  101cb2:	01 d0                	add    %edx,%eax
  101cb4:	01 c0                	add    %eax,%eax
  101cb6:	01 d0                	add    %edx,%eax
  101cb8:	01 c0                	add    %eax,%eax
  101cba:	01 d0                	add    %edx,%eax
  101cbc:	c1 e0 04             	shl    $0x4,%eax
  101cbf:	05 60 6b 10 00       	add    $0x106b60,%eax
  101cc4:	8b 00                	mov    (%eax),%eax
  101cc6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101cc9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101ccc:	3b 45 08             	cmp    0x8(%ebp),%eax
  101ccf:	75 ca                	jne    101c9b <check_is_in+0xc>
  101cd1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101cd6:	c9                   	leave  
  101cd7:	c3                   	ret    

00101cd8 <block_decrease>:
  101cd8:	55                   	push   %ebp
  101cd9:	89 e5                	mov    %esp,%ebp
  101cdb:	83 ec 10             	sub    $0x10,%esp
  101cde:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101ce3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101ce6:	83 7d fc ff          	cmpl   $0xffffffff,-0x4(%ebp)
  101cea:	75 07                	jne    101cf3 <block_decrease+0x1b>
  101cec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101cf1:	eb 69                	jmp    101d5c <block_decrease+0x84>
  101cf3:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101cf6:	89 d0                	mov    %edx,%eax
  101cf8:	c1 e0 07             	shl    $0x7,%eax
  101cfb:	01 d0                	add    %edx,%eax
  101cfd:	01 c0                	add    %eax,%eax
  101cff:	01 d0                	add    %edx,%eax
  101d01:	01 c0                	add    %eax,%eax
  101d03:	01 d0                	add    %edx,%eax
  101d05:	c1 e0 04             	shl    $0x4,%eax
  101d08:	05 54 6b 10 00       	add    $0x106b54,%eax
  101d0d:	8b 00                	mov    (%eax),%eax
  101d0f:	8d 48 ff             	lea    -0x1(%eax),%ecx
  101d12:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101d15:	89 d0                	mov    %edx,%eax
  101d17:	c1 e0 07             	shl    $0x7,%eax
  101d1a:	01 d0                	add    %edx,%eax
  101d1c:	01 c0                	add    %eax,%eax
  101d1e:	01 d0                	add    %edx,%eax
  101d20:	01 c0                	add    %eax,%eax
  101d22:	01 d0                	add    %edx,%eax
  101d24:	c1 e0 04             	shl    $0x4,%eax
  101d27:	05 54 6b 10 00       	add    $0x106b54,%eax
  101d2c:	89 08                	mov    %ecx,(%eax)
  101d2e:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101d31:	89 d0                	mov    %edx,%eax
  101d33:	c1 e0 07             	shl    $0x7,%eax
  101d36:	01 d0                	add    %edx,%eax
  101d38:	01 c0                	add    %eax,%eax
  101d3a:	01 d0                	add    %edx,%eax
  101d3c:	01 c0                	add    %eax,%eax
  101d3e:	01 d0                	add    %edx,%eax
  101d40:	c1 e0 04             	shl    $0x4,%eax
  101d43:	05 60 6b 10 00       	add    $0x106b60,%eax
  101d48:	8b 00                	mov    (%eax),%eax
  101d4a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101d4d:	a1 3c 41 10 00       	mov    0x10413c,%eax
  101d52:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  101d55:	75 9c                	jne    101cf3 <block_decrease+0x1b>
  101d57:	b8 01 00 00 00       	mov    $0x1,%eax
  101d5c:	c9                   	leave  
  101d5d:	c3                   	ret    

00101d5e <init_pcb>:
  101d5e:	55                   	push   %ebp
  101d5f:	89 e5                	mov    %esp,%ebp
  101d61:	83 ec 10             	sub    $0x10,%esp
  101d64:	c7 05 e8 4a 10 00 05 	movl   $0x5,0x104ae8
  101d6b:	00 00 00 
  101d6e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101d75:	e9 86 00 00 00       	jmp    101e00 <init_pcb+0xa2>
  101d7a:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  101d7d:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101d80:	89 d0                	mov    %edx,%eax
  101d82:	c1 e0 07             	shl    $0x7,%eax
  101d85:	01 d0                	add    %edx,%eax
  101d87:	01 c0                	add    %eax,%eax
  101d89:	01 d0                	add    %edx,%eax
  101d8b:	01 c0                	add    %eax,%eax
  101d8d:	01 d0                	add    %edx,%eax
  101d8f:	c1 e0 04             	shl    $0x4,%eax
  101d92:	05 58 6b 10 00       	add    $0x106b58,%eax
  101d97:	89 08                	mov    %ecx,(%eax)
  101d99:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101d9c:	48                   	dec    %eax
  101d9d:	89 c1                	mov    %eax,%ecx
  101d9f:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101da2:	89 d0                	mov    %edx,%eax
  101da4:	c1 e0 07             	shl    $0x7,%eax
  101da7:	01 d0                	add    %edx,%eax
  101da9:	01 c0                	add    %eax,%eax
  101dab:	01 d0                	add    %edx,%eax
  101dad:	01 c0                	add    %eax,%eax
  101daf:	01 d0                	add    %edx,%eax
  101db1:	c1 e0 04             	shl    $0x4,%eax
  101db4:	05 5c 6b 10 00       	add    $0x106b5c,%eax
  101db9:	89 08                	mov    %ecx,(%eax)
  101dbb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101dbe:	40                   	inc    %eax
  101dbf:	89 c1                	mov    %eax,%ecx
  101dc1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101dc4:	89 d0                	mov    %edx,%eax
  101dc6:	c1 e0 07             	shl    $0x7,%eax
  101dc9:	01 d0                	add    %edx,%eax
  101dcb:	01 c0                	add    %eax,%eax
  101dcd:	01 d0                	add    %edx,%eax
  101dcf:	01 c0                	add    %eax,%eax
  101dd1:	01 d0                	add    %edx,%eax
  101dd3:	c1 e0 04             	shl    $0x4,%eax
  101dd6:	05 60 6b 10 00       	add    $0x106b60,%eax
  101ddb:	89 08                	mov    %ecx,(%eax)
  101ddd:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101de0:	89 d0                	mov    %edx,%eax
  101de2:	c1 e0 07             	shl    $0x7,%eax
  101de5:	01 d0                	add    %edx,%eax
  101de7:	01 c0                	add    %eax,%eax
  101de9:	01 d0                	add    %edx,%eax
  101deb:	01 c0                	add    %eax,%eax
  101ded:	01 d0                	add    %edx,%eax
  101def:	c1 e0 04             	shl    $0x4,%eax
  101df2:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  101df7:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  101dfd:	ff 45 fc             	incl   -0x4(%ebp)
  101e00:	81 7d fc ff 07 00 00 	cmpl   $0x7ff,-0x4(%ebp)
  101e07:	0f 8e 6d ff ff ff    	jle    101d7a <init_pcb+0x1c>
  101e0d:	c7 05 5c 6b 10 00 ff 	movl   $0x7ff,0x106b5c
  101e14:	07 00 00 
  101e17:	c7 05 f0 ca 13 01 00 	movl   $0x0,0x113caf0
  101e1e:	00 00 00 
  101e21:	90                   	nop
  101e22:	c9                   	leave  
  101e23:	c3                   	ret    

00101e24 <init_kernel_pcb>:
  101e24:	55                   	push   %ebp
  101e25:	89 e5                	mov    %esp,%ebp
  101e27:	83 ec 08             	sub    $0x8,%esp
  101e2a:	e8 ce f7 ff ff       	call   1015fd <apply_new_pid>
  101e2f:	85 c0                	test   %eax,%eax
  101e31:	74 15                	je     101e48 <init_kernel_pcb+0x24>
  101e33:	83 ec 08             	sub    $0x8,%esp
  101e36:	68 e4 00 00 00       	push   $0xe4
  101e3b:	68 72 2f 10 00       	push   $0x102f72
  101e40:	e8 1e 10 00 00       	call   102e63 <abort>
  101e45:	83 c4 10             	add    $0x10,%esp
  101e48:	c7 05 48 6b 10 00 10 	movl   $0x10,0x106b48
  101e4f:	00 00 00 
  101e52:	c7 05 3c 6b 10 00 08 	movl   $0x8,0x106b3c
  101e59:	00 00 00 
  101e5c:	c7 05 0c 6b 10 00 10 	movl   $0x10,0x106b0c
  101e63:	00 00 00 
  101e66:	c7 05 08 6b 10 00 10 	movl   $0x10,0x106b08
  101e6d:	00 00 00 
  101e70:	b8 9c 15 10 00       	mov    $0x10159c,%eax
  101e75:	a3 38 6b 10 00       	mov    %eax,0x106b38
  101e7a:	c7 05 44 6b 10 00 00 	movl   $0x400000,0x106b44
  101e81:	00 40 00 
  101e84:	c7 05 4c 6b 10 00 01 	movl   $0x1,0x106b4c
  101e8b:	00 00 00 
  101e8e:	c7 05 50 6b 10 00 04 	movl   $0x4,0x106b50
  101e95:	00 00 00 
  101e98:	b8 01 00 00 00       	mov    $0x1,%eax
  101e9d:	c9                   	leave  
  101e9e:	c3                   	ret    

00101e9f <make_pcb>:
  101e9f:	55                   	push   %ebp
  101ea0:	89 e5                	mov    %esp,%ebp
  101ea2:	57                   	push   %edi
  101ea3:	56                   	push   %esi
  101ea4:	53                   	push   %ebx
  101ea5:	8b 55 08             	mov    0x8(%ebp),%edx
  101ea8:	89 d0                	mov    %edx,%eax
  101eaa:	c1 e0 07             	shl    $0x7,%eax
  101ead:	01 d0                	add    %edx,%eax
  101eaf:	01 c0                	add    %eax,%eax
  101eb1:	01 d0                	add    %edx,%eax
  101eb3:	01 c0                	add    %eax,%eax
  101eb5:	01 d0                	add    %edx,%eax
  101eb7:	c1 e0 04             	shl    $0x4,%eax
  101eba:	8d 90 00 6b 10 00    	lea    0x106b00(%eax),%edx
  101ec0:	8b 45 0c             	mov    0xc(%ebp),%eax
  101ec3:	89 c3                	mov    %eax,%ebx
  101ec5:	b8 13 00 00 00       	mov    $0x13,%eax
  101eca:	89 d7                	mov    %edx,%edi
  101ecc:	89 de                	mov    %ebx,%esi
  101ece:	89 c1                	mov    %eax,%ecx
  101ed0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101ed2:	8b 4d 10             	mov    0x10(%ebp),%ecx
  101ed5:	8b 55 08             	mov    0x8(%ebp),%edx
  101ed8:	89 d0                	mov    %edx,%eax
  101eda:	c1 e0 07             	shl    $0x7,%eax
  101edd:	01 d0                	add    %edx,%eax
  101edf:	01 c0                	add    %eax,%eax
  101ee1:	01 d0                	add    %edx,%eax
  101ee3:	01 c0                	add    %eax,%eax
  101ee5:	01 d0                	add    %edx,%eax
  101ee7:	c1 e0 04             	shl    $0x4,%eax
  101eea:	05 4c 6b 10 00       	add    $0x106b4c,%eax
  101eef:	89 08                	mov    %ecx,(%eax)
  101ef1:	8b 4d 14             	mov    0x14(%ebp),%ecx
  101ef4:	8b 55 08             	mov    0x8(%ebp),%edx
  101ef7:	89 d0                	mov    %edx,%eax
  101ef9:	c1 e0 07             	shl    $0x7,%eax
  101efc:	01 d0                	add    %edx,%eax
  101efe:	01 c0                	add    %eax,%eax
  101f00:	01 d0                	add    %edx,%eax
  101f02:	01 c0                	add    %eax,%eax
  101f04:	01 d0                	add    %edx,%eax
  101f06:	c1 e0 04             	shl    $0x4,%eax
  101f09:	05 50 6b 10 00       	add    $0x106b50,%eax
  101f0e:	89 08                	mov    %ecx,(%eax)
  101f10:	8b 4d 18             	mov    0x18(%ebp),%ecx
  101f13:	8b 55 08             	mov    0x8(%ebp),%edx
  101f16:	89 d0                	mov    %edx,%eax
  101f18:	c1 e0 07             	shl    $0x7,%eax
  101f1b:	01 d0                	add    %edx,%eax
  101f1d:	01 c0                	add    %eax,%eax
  101f1f:	01 d0                	add    %edx,%eax
  101f21:	01 c0                	add    %eax,%eax
  101f23:	01 d0                	add    %edx,%eax
  101f25:	c1 e0 04             	shl    $0x4,%eax
  101f28:	05 54 6b 10 00       	add    $0x106b54,%eax
  101f2d:	89 08                	mov    %ecx,(%eax)
  101f2f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  101f32:	8b 55 08             	mov    0x8(%ebp),%edx
  101f35:	89 d0                	mov    %edx,%eax
  101f37:	c1 e0 07             	shl    $0x7,%eax
  101f3a:	01 d0                	add    %edx,%eax
  101f3c:	01 c0                	add    %eax,%eax
  101f3e:	01 d0                	add    %edx,%eax
  101f40:	01 c0                	add    %eax,%eax
  101f42:	01 d0                	add    %edx,%eax
  101f44:	c1 e0 04             	shl    $0x4,%eax
  101f47:	05 6c 6b 10 00       	add    $0x106b6c,%eax
  101f4c:	89 08                	mov    %ecx,(%eax)
  101f4e:	b8 01 00 00 00       	mov    $0x1,%eax
  101f53:	5b                   	pop    %ebx
  101f54:	5e                   	pop    %esi
  101f55:	5f                   	pop    %edi
  101f56:	5d                   	pop    %ebp
  101f57:	c3                   	ret    

00101f58 <saveIdt>:
  101f58:	55                   	push   %ebp
  101f59:	89 e5                	mov    %esp,%ebp
  101f5b:	8b 45 0c             	mov    0xc(%ebp),%eax
  101f5e:	48                   	dec    %eax
  101f5f:	66 a3 5c 42 10 00    	mov    %ax,0x10425c
  101f65:	8b 45 08             	mov    0x8(%ebp),%eax
  101f68:	66 a3 5e 42 10 00    	mov    %ax,0x10425e
  101f6e:	8b 45 08             	mov    0x8(%ebp),%eax
  101f71:	c1 e8 10             	shr    $0x10,%eax
  101f74:	66 a3 60 42 10 00    	mov    %ax,0x104260
  101f7a:	b8 5c 42 10 00       	mov    $0x10425c,%eax
  101f7f:	0f 01 18             	lidtl  (%eax)
  101f82:	90                   	nop
  101f83:	5d                   	pop    %ebp
  101f84:	c3                   	ret    

00101f85 <setIntr>:
  101f85:	55                   	push   %ebp
  101f86:	89 e5                	mov    %esp,%ebp
  101f88:	8b 45 10             	mov    0x10(%ebp),%eax
  101f8b:	8b 55 08             	mov    0x8(%ebp),%edx
  101f8e:	66 89 02             	mov    %ax,(%edx)
  101f91:	8b 45 0c             	mov    0xc(%ebp),%eax
  101f94:	c1 e0 03             	shl    $0x3,%eax
  101f97:	8b 55 08             	mov    0x8(%ebp),%edx
  101f9a:	66 89 42 02          	mov    %ax,0x2(%edx)
  101f9e:	8b 45 08             	mov    0x8(%ebp),%eax
  101fa1:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  101fa5:	8b 45 08             	mov    0x8(%ebp),%eax
  101fa8:	8a 50 05             	mov    0x5(%eax),%dl
  101fab:	83 e2 f0             	and    $0xfffffff0,%edx
  101fae:	83 ca 0e             	or     $0xe,%edx
  101fb1:	88 50 05             	mov    %dl,0x5(%eax)
  101fb4:	8b 45 08             	mov    0x8(%ebp),%eax
  101fb7:	8a 50 05             	mov    0x5(%eax),%dl
  101fba:	83 e2 ef             	and    $0xffffffef,%edx
  101fbd:	88 50 05             	mov    %dl,0x5(%eax)
  101fc0:	8b 45 14             	mov    0x14(%ebp),%eax
  101fc3:	83 e0 03             	and    $0x3,%eax
  101fc6:	88 c2                	mov    %al,%dl
  101fc8:	8b 45 08             	mov    0x8(%ebp),%eax
  101fcb:	83 e2 03             	and    $0x3,%edx
  101fce:	88 d1                	mov    %dl,%cl
  101fd0:	c1 e1 05             	shl    $0x5,%ecx
  101fd3:	8a 50 05             	mov    0x5(%eax),%dl
  101fd6:	83 e2 9f             	and    $0xffffff9f,%edx
  101fd9:	09 ca                	or     %ecx,%edx
  101fdb:	88 50 05             	mov    %dl,0x5(%eax)
  101fde:	8b 45 08             	mov    0x8(%ebp),%eax
  101fe1:	8a 50 05             	mov    0x5(%eax),%dl
  101fe4:	83 ca 80             	or     $0xffffff80,%edx
  101fe7:	88 50 05             	mov    %dl,0x5(%eax)
  101fea:	8b 45 10             	mov    0x10(%ebp),%eax
  101fed:	c1 e8 10             	shr    $0x10,%eax
  101ff0:	8b 55 08             	mov    0x8(%ebp),%edx
  101ff3:	66 89 42 06          	mov    %ax,0x6(%edx)
  101ff7:	90                   	nop
  101ff8:	5d                   	pop    %ebp
  101ff9:	c3                   	ret    

00101ffa <setTrap>:
  101ffa:	55                   	push   %ebp
  101ffb:	89 e5                	mov    %esp,%ebp
  101ffd:	8b 45 10             	mov    0x10(%ebp),%eax
  102000:	8b 55 08             	mov    0x8(%ebp),%edx
  102003:	66 89 02             	mov    %ax,(%edx)
  102006:	8b 45 0c             	mov    0xc(%ebp),%eax
  102009:	c1 e0 03             	shl    $0x3,%eax
  10200c:	8b 55 08             	mov    0x8(%ebp),%edx
  10200f:	66 89 42 02          	mov    %ax,0x2(%edx)
  102013:	8b 45 08             	mov    0x8(%ebp),%eax
  102016:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  10201a:	8b 45 08             	mov    0x8(%ebp),%eax
  10201d:	8a 50 05             	mov    0x5(%eax),%dl
  102020:	83 ca 0f             	or     $0xf,%edx
  102023:	88 50 05             	mov    %dl,0x5(%eax)
  102026:	8b 45 08             	mov    0x8(%ebp),%eax
  102029:	8a 50 05             	mov    0x5(%eax),%dl
  10202c:	83 e2 ef             	and    $0xffffffef,%edx
  10202f:	88 50 05             	mov    %dl,0x5(%eax)
  102032:	8b 45 14             	mov    0x14(%ebp),%eax
  102035:	83 e0 03             	and    $0x3,%eax
  102038:	88 c2                	mov    %al,%dl
  10203a:	8b 45 08             	mov    0x8(%ebp),%eax
  10203d:	83 e2 03             	and    $0x3,%edx
  102040:	88 d1                	mov    %dl,%cl
  102042:	c1 e1 05             	shl    $0x5,%ecx
  102045:	8a 50 05             	mov    0x5(%eax),%dl
  102048:	83 e2 9f             	and    $0xffffff9f,%edx
  10204b:	09 ca                	or     %ecx,%edx
  10204d:	88 50 05             	mov    %dl,0x5(%eax)
  102050:	8b 45 08             	mov    0x8(%ebp),%eax
  102053:	8a 50 05             	mov    0x5(%eax),%dl
  102056:	83 ca 80             	or     $0xffffff80,%edx
  102059:	88 50 05             	mov    %dl,0x5(%eax)
  10205c:	8b 45 10             	mov    0x10(%ebp),%eax
  10205f:	c1 e8 10             	shr    $0x10,%eax
  102062:	8b 55 08             	mov    0x8(%ebp),%edx
  102065:	66 89 42 06          	mov    %ax,0x6(%edx)
  102069:	90                   	nop
  10206a:	5d                   	pop    %ebp
  10206b:	c3                   	ret    

0010206c <initIdt>:
  10206c:	55                   	push   %ebp
  10206d:	89 e5                	mov    %esp,%ebp
  10206f:	83 ec 10             	sub    $0x10,%esp
  102072:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  102079:	eb 21                	jmp    10209c <initIdt+0x30>
  10207b:	ba 86 2e 10 00       	mov    $0x102e86,%edx
  102080:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102083:	c1 e0 03             	shl    $0x3,%eax
  102086:	05 e0 d3 13 01       	add    $0x113d3e0,%eax
  10208b:	6a 00                	push   $0x0
  10208d:	52                   	push   %edx
  10208e:	6a 01                	push   $0x1
  102090:	50                   	push   %eax
  102091:	e8 64 ff ff ff       	call   101ffa <setTrap>
  102096:	83 c4 10             	add    $0x10,%esp
  102099:	ff 45 fc             	incl   -0x4(%ebp)
  10209c:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  1020a3:	7e d6                	jle    10207b <initIdt+0xf>
  1020a5:	ba 8c 2e 10 00       	mov    $0x102e8c,%edx
  1020aa:	b8 48 d4 13 01       	mov    $0x113d448,%eax
  1020af:	6a 00                	push   $0x0
  1020b1:	52                   	push   %edx
  1020b2:	6a 01                	push   $0x1
  1020b4:	50                   	push   %eax
  1020b5:	e8 40 ff ff ff       	call   101ffa <setTrap>
  1020ba:	83 c4 10             	add    $0x10,%esp
  1020bd:	ba 90 2e 10 00       	mov    $0x102e90,%edx
  1020c2:	b8 e0 d7 13 01       	mov    $0x113d7e0,%eax
  1020c7:	6a 03                	push   $0x3
  1020c9:	52                   	push   %edx
  1020ca:	6a 01                	push   $0x1
  1020cc:	50                   	push   %eax
  1020cd:	e8 b3 fe ff ff       	call   101f85 <setIntr>
  1020d2:	83 c4 10             	add    $0x10,%esp
  1020d5:	ba 99 2e 10 00       	mov    $0x102e99,%edx
  1020da:	b8 e0 d4 13 01       	mov    $0x113d4e0,%eax
  1020df:	6a 00                	push   $0x0
  1020e1:	52                   	push   %edx
  1020e2:	6a 01                	push   $0x1
  1020e4:	50                   	push   %eax
  1020e5:	e8 9b fe ff ff       	call   101f85 <setIntr>
  1020ea:	83 c4 10             	add    $0x10,%esp
  1020ed:	68 00 08 00 00       	push   $0x800
  1020f2:	68 e0 d3 13 01       	push   $0x113d3e0
  1020f7:	e8 5c fe ff ff       	call   101f58 <saveIdt>
  1020fc:	83 c4 08             	add    $0x8,%esp
  1020ff:	90                   	nop
  102100:	c9                   	leave  
  102101:	c3                   	ret    

00102102 <enableInterrupt>:
  102102:	55                   	push   %ebp
  102103:	89 e5                	mov    %esp,%ebp
  102105:	fb                   	sti    
  102106:	90                   	nop
  102107:	5d                   	pop    %ebp
  102108:	c3                   	ret    

00102109 <disableInterrupt>:
  102109:	55                   	push   %ebp
  10210a:	89 e5                	mov    %esp,%ebp
  10210c:	fa                   	cli    
  10210d:	90                   	nop
  10210e:	5d                   	pop    %ebp
  10210f:	c3                   	ret    

00102110 <irqHandle>:
  102110:	55                   	push   %ebp
  102111:	89 e5                	mov    %esp,%ebp
  102113:	57                   	push   %edi
  102114:	56                   	push   %esi
  102115:	53                   	push   %ebx
  102116:	83 ec 1c             	sub    $0x1c,%esp
  102119:	b8 10 00 00 00       	mov    $0x10,%eax
  10211e:	89 c0                	mov    %eax,%eax
  102120:	8e d8                	mov    %eax,%ds
  102122:	8e e0                	mov    %eax,%fs
  102124:	8e c0                	mov    %eax,%es
  102126:	b8 30 00 00 00       	mov    $0x30,%eax
  10212b:	89 c0                	mov    %eax,%eax
  10212d:	8e e8                	mov    %eax,%gs
  10212f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  102136:	89 e8                	mov    %ebp,%eax
  102138:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10213b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10213e:	83 c0 08             	add    $0x8,%eax
  102141:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102144:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102147:	8b 10                	mov    (%eax),%edx
  102149:	8b 45 08             	mov    0x8(%ebp),%eax
  10214c:	39 c2                	cmp    %eax,%edx
  10214e:	74 12                	je     102162 <irqHandle+0x52>
  102150:	83 ec 08             	sub    $0x8,%esp
  102153:	6a 1f                	push   $0x1f
  102155:	68 f0 2f 10 00       	push   $0x102ff0
  10215a:	e8 04 0d 00 00       	call   102e63 <abort>
  10215f:	83 c4 10             	add    $0x10,%esp
  102162:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  102167:	89 45 dc             	mov    %eax,-0x24(%ebp)
  10216a:	e8 9a ff ff ff       	call   102109 <disableInterrupt>
  10216f:	8b 45 08             	mov    0x8(%ebp),%eax
  102172:	8b 40 30             	mov    0x30(%eax),%eax
  102175:	83 f8 0d             	cmp    $0xd,%eax
  102178:	74 1e                	je     102198 <irqHandle+0x88>
  10217a:	83 f8 0d             	cmp    $0xd,%eax
  10217d:	7f 0b                	jg     10218a <irqHandle+0x7a>
  10217f:	83 f8 ff             	cmp    $0xffffffff,%eax
  102182:	0f 84 9e 00 00 00    	je     102226 <irqHandle+0x116>
  102188:	eb 3e                	jmp    1021c8 <irqHandle+0xb8>
  10218a:	83 f8 20             	cmp    $0x20,%eax
  10218d:	74 29                	je     1021b8 <irqHandle+0xa8>
  10218f:	3d 80 00 00 00       	cmp    $0x80,%eax
  102194:	74 12                	je     1021a8 <irqHandle+0x98>
  102196:	eb 30                	jmp    1021c8 <irqHandle+0xb8>
  102198:	83 ec 0c             	sub    $0xc,%esp
  10219b:	ff 75 08             	pushl  0x8(%ebp)
  10219e:	e8 1b 03 00 00       	call   1024be <GProtectFaultHandle>
  1021a3:	83 c4 10             	add    $0x10,%esp
  1021a6:	eb 7f                	jmp    102227 <irqHandle+0x117>
  1021a8:	83 ec 0c             	sub    $0xc,%esp
  1021ab:	ff 75 08             	pushl  0x8(%ebp)
  1021ae:	e8 a6 01 00 00       	call   102359 <syscallHandle>
  1021b3:	83 c4 10             	add    $0x10,%esp
  1021b6:	eb 6f                	jmp    102227 <irqHandle+0x117>
  1021b8:	83 ec 0c             	sub    $0xc,%esp
  1021bb:	ff 75 08             	pushl  0x8(%ebp)
  1021be:	e8 5f 03 00 00       	call   102522 <timeHandle>
  1021c3:	83 c4 10             	add    $0x10,%esp
  1021c6:	eb 5f                	jmp    102227 <irqHandle+0x117>
  1021c8:	83 ec 0c             	sub    $0xc,%esp
  1021cb:	68 03 30 10 00       	push   $0x103003
  1021d0:	e8 d2 09 00 00       	call   102ba7 <printk>
  1021d5:	83 c4 10             	add    $0x10,%esp
  1021d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1021db:	8b 50 38             	mov    0x38(%eax),%edx
  1021de:	8b 45 08             	mov    0x8(%ebp),%eax
  1021e1:	8b 40 30             	mov    0x30(%eax),%eax
  1021e4:	83 ec 08             	sub    $0x8,%esp
  1021e7:	52                   	push   %edx
  1021e8:	50                   	push   %eax
  1021e9:	68 70 30 10 00       	push   $0x103070
  1021ee:	6a 36                	push   $0x36
  1021f0:	68 f0 2f 10 00       	push   $0x102ff0
  1021f5:	68 0c 30 10 00       	push   $0x10300c
  1021fa:	e8 a8 09 00 00       	call   102ba7 <printk>
  1021ff:	83 c4 20             	add    $0x20,%esp
  102202:	83 ec 0c             	sub    $0xc,%esp
  102205:	68 31 30 10 00       	push   $0x103031
  10220a:	e8 98 09 00 00       	call   102ba7 <printk>
  10220f:	83 c4 10             	add    $0x10,%esp
  102212:	83 ec 08             	sub    $0x8,%esp
  102215:	6a 37                	push   $0x37
  102217:	68 f0 2f 10 00       	push   $0x102ff0
  10221c:	e8 42 0c 00 00       	call   102e63 <abort>
  102221:	83 c4 10             	add    $0x10,%esp
  102224:	eb 01                	jmp    102227 <irqHandle+0x117>
  102226:	90                   	nop
  102227:	8b 45 08             	mov    0x8(%ebp),%eax
  10222a:	8b 40 30             	mov    0x30(%eax),%eax
  10222d:	3d 80 00 00 00       	cmp    $0x80,%eax
  102232:	74 0f                	je     102243 <irqHandle+0x133>
  102234:	8b 45 08             	mov    0x8(%ebp),%eax
  102237:	8b 40 30             	mov    0x30(%eax),%eax
  10223a:	83 f8 20             	cmp    $0x20,%eax
  10223d:	0f 85 08 01 00 00    	jne    10234b <irqHandle+0x23b>
  102243:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  102248:	3b 45 dc             	cmp    -0x24(%ebp),%eax
  10224b:	0f 84 fa 00 00 00    	je     10234b <irqHandle+0x23b>
  102251:	8b 15 e0 4a 10 00    	mov    0x104ae0,%edx
  102257:	89 d0                	mov    %edx,%eax
  102259:	c1 e0 07             	shl    $0x7,%eax
  10225c:	01 d0                	add    %edx,%eax
  10225e:	01 c0                	add    %eax,%eax
  102260:	01 d0                	add    %edx,%eax
  102262:	01 c0                	add    %eax,%eax
  102264:	01 d0                	add    %edx,%eax
  102266:	c1 e0 04             	shl    $0x4,%eax
  102269:	05 00 4b 10 00       	add    $0x104b00,%eax
  10226e:	05 fc 1f 00 00       	add    $0x1ffc,%eax
  102273:	8d 50 b4             	lea    -0x4c(%eax),%edx
  102276:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102279:	89 10                	mov    %edx,(%eax)
  10227b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10227e:	8b 00                	mov    (%eax),%eax
  102280:	89 45 d8             	mov    %eax,-0x28(%ebp)
  102283:	8b 15 e0 4a 10 00    	mov    0x104ae0,%edx
  102289:	8b 4d d8             	mov    -0x28(%ebp),%ecx
  10228c:	89 d0                	mov    %edx,%eax
  10228e:	c1 e0 07             	shl    $0x7,%eax
  102291:	01 d0                	add    %edx,%eax
  102293:	01 c0                	add    %eax,%eax
  102295:	01 d0                	add    %edx,%eax
  102297:	01 c0                	add    %eax,%eax
  102299:	01 d0                	add    %edx,%eax
  10229b:	c1 e0 04             	shl    $0x4,%eax
  10229e:	05 00 6b 10 00       	add    $0x106b00,%eax
  1022a3:	89 ca                	mov    %ecx,%edx
  1022a5:	89 c3                	mov    %eax,%ebx
  1022a7:	b8 13 00 00 00       	mov    $0x13,%eax
  1022ac:	89 d7                	mov    %edx,%edi
  1022ae:	89 de                	mov    %ebx,%esi
  1022b0:	89 c1                	mov    %eax,%ecx
  1022b2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1022b4:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  1022b9:	c1 e0 10             	shl    $0x10,%eax
  1022bc:	83 ec 08             	sub    $0x8,%esp
  1022bf:	50                   	push   %eax
  1022c0:	6a 23                	push   $0x23
  1022c2:	e8 1a de ff ff       	call   1000e1 <change_gdt>
  1022c7:	83 c4 10             	add    $0x10,%esp
  1022ca:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  1022cf:	c1 e0 10             	shl    $0x10,%eax
  1022d2:	83 ec 08             	sub    $0x8,%esp
  1022d5:	50                   	push   %eax
  1022d6:	6a 1b                	push   $0x1b
  1022d8:	e8 04 de ff ff       	call   1000e1 <change_gdt>
  1022dd:	83 c4 10             	add    $0x10,%esp
  1022e0:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  1022e5:	83 f8 01             	cmp    $0x1,%eax
  1022e8:	75 61                	jne    10234b <irqHandle+0x23b>
  1022ea:	83 ec 0c             	sub    $0xc,%esp
  1022ed:	68 03 30 10 00       	push   $0x103003
  1022f2:	e8 b0 08 00 00       	call   102ba7 <printk>
  1022f7:	83 c4 10             	add    $0x10,%esp
  1022fa:	a1 a8 8b 10 00       	mov    0x108ba8,%eax
  1022ff:	83 ec 0c             	sub    $0xc,%esp
  102302:	50                   	push   %eax
  102303:	68 70 30 10 00       	push   $0x103070
  102308:	6a 47                	push   $0x47
  10230a:	68 f0 2f 10 00       	push   $0x102ff0
  10230f:	68 37 30 10 00       	push   $0x103037
  102314:	e8 8e 08 00 00       	call   102ba7 <printk>
  102319:	83 c4 20             	add    $0x20,%esp
  10231c:	83 ec 0c             	sub    $0xc,%esp
  10231f:	68 31 30 10 00       	push   $0x103031
  102324:	e8 7e 08 00 00       	call   102ba7 <printk>
  102329:	83 c4 10             	add    $0x10,%esp
  10232c:	8b 45 08             	mov    0x8(%ebp),%eax
  10232f:	8b 40 38             	mov    0x38(%eax),%eax
  102332:	3d ff ff 1f 00       	cmp    $0x1fffff,%eax
  102337:	77 12                	ja     10234b <irqHandle+0x23b>
  102339:	83 ec 08             	sub    $0x8,%esp
  10233c:	6a 48                	push   $0x48
  10233e:	68 f0 2f 10 00       	push   $0x102ff0
  102343:	e8 1b 0b 00 00       	call   102e63 <abort>
  102348:	83 c4 10             	add    $0x10,%esp
  10234b:	e8 b2 fd ff ff       	call   102102 <enableInterrupt>
  102350:	90                   	nop
  102351:	8d 65 f4             	lea    -0xc(%ebp),%esp
  102354:	5b                   	pop    %ebx
  102355:	5e                   	pop    %esi
  102356:	5f                   	pop    %edi
  102357:	5d                   	pop    %ebp
  102358:	c3                   	ret    

00102359 <syscallHandle>:
  102359:	55                   	push   %ebp
  10235a:	89 e5                	mov    %esp,%ebp
  10235c:	83 ec 08             	sub    $0x8,%esp
  10235f:	8b 45 08             	mov    0x8(%ebp),%eax
  102362:	8b 40 2c             	mov    0x2c(%eax),%eax
  102365:	83 f8 07             	cmp    $0x7,%eax
  102368:	0f 84 be 00 00 00    	je     10242c <syscallHandle+0xd3>
  10236e:	83 f8 07             	cmp    $0x7,%eax
  102371:	77 2b                	ja     10239e <syscallHandle+0x45>
  102373:	83 f8 02             	cmp    $0x2,%eax
  102376:	0f 84 95 00 00 00    	je     102411 <syscallHandle+0xb8>
  10237c:	83 f8 02             	cmp    $0x2,%eax
  10237f:	77 0a                	ja     10238b <syscallHandle+0x32>
  102381:	83 f8 01             	cmp    $0x1,%eax
  102384:	74 78                	je     1023fe <syscallHandle+0xa5>
  102386:	e9 31 01 00 00       	jmp    1024bc <syscallHandle+0x163>
  10238b:	83 f8 03             	cmp    $0x3,%eax
  10238e:	0f 84 10 01 00 00    	je     1024a4 <syscallHandle+0x14b>
  102394:	83 f8 04             	cmp    $0x4,%eax
  102397:	74 3f                	je     1023d8 <syscallHandle+0x7f>
  102399:	e9 1e 01 00 00       	jmp    1024bc <syscallHandle+0x163>
  10239e:	83 f8 17             	cmp    $0x17,%eax
  1023a1:	0f 84 b5 00 00 00    	je     10245c <syscallHandle+0x103>
  1023a7:	83 f8 17             	cmp    $0x17,%eax
  1023aa:	77 17                	ja     1023c3 <syscallHandle+0x6a>
  1023ac:	83 f8 15             	cmp    $0x15,%eax
  1023af:	0f 84 8f 00 00 00    	je     102444 <syscallHandle+0xeb>
  1023b5:	83 f8 16             	cmp    $0x16,%eax
  1023b8:	0f 84 b6 00 00 00    	je     102474 <syscallHandle+0x11b>
  1023be:	e9 f9 00 00 00       	jmp    1024bc <syscallHandle+0x163>
  1023c3:	83 f8 18             	cmp    $0x18,%eax
  1023c6:	0f 84 c0 00 00 00    	je     10248c <syscallHandle+0x133>
  1023cc:	3d e6 00 00 00       	cmp    $0xe6,%eax
  1023d1:	74 18                	je     1023eb <syscallHandle+0x92>
  1023d3:	e9 e4 00 00 00       	jmp    1024bc <syscallHandle+0x163>
  1023d8:	83 ec 0c             	sub    $0xc,%esp
  1023db:	ff 75 08             	pushl  0x8(%ebp)
  1023de:	e8 a1 ed ff ff       	call   101184 <sys_write>
  1023e3:	83 c4 10             	add    $0x10,%esp
  1023e6:	e9 d0 00 00 00       	jmp    1024bb <syscallHandle+0x162>
  1023eb:	83 ec 0c             	sub    $0xc,%esp
  1023ee:	ff 75 08             	pushl  0x8(%ebp)
  1023f1:	e8 b3 e8 ff ff       	call   100ca9 <sys_sleep>
  1023f6:	83 c4 10             	add    $0x10,%esp
  1023f9:	e9 bd 00 00 00       	jmp    1024bb <syscallHandle+0x162>
  1023fe:	83 ec 0c             	sub    $0xc,%esp
  102401:	ff 75 08             	pushl  0x8(%ebp)
  102404:	e8 5c e8 ff ff       	call   100c65 <sys_exit>
  102409:	83 c4 10             	add    $0x10,%esp
  10240c:	e9 aa 00 00 00       	jmp    1024bb <syscallHandle+0x162>
  102411:	83 ec 0c             	sub    $0xc,%esp
  102414:	ff 75 08             	pushl  0x8(%ebp)
  102417:	e8 c7 e8 ff ff       	call   100ce3 <sys_fork>
  10241c:	83 c4 10             	add    $0x10,%esp
  10241f:	89 c2                	mov    %eax,%edx
  102421:	8b 45 08             	mov    0x8(%ebp),%eax
  102424:	89 50 2c             	mov    %edx,0x2c(%eax)
  102427:	e9 8f 00 00 00       	jmp    1024bb <syscallHandle+0x162>
  10242c:	83 ec 0c             	sub    $0xc,%esp
  10242f:	ff 75 08             	pushl  0x8(%ebp)
  102432:	e8 65 e8 ff ff       	call   100c9c <sys_getpid>
  102437:	83 c4 10             	add    $0x10,%esp
  10243a:	89 c2                	mov    %eax,%edx
  10243c:	8b 45 08             	mov    0x8(%ebp),%eax
  10243f:	89 50 2c             	mov    %edx,0x2c(%eax)
  102442:	eb 77                	jmp    1024bb <syscallHandle+0x162>
  102444:	83 ec 0c             	sub    $0xc,%esp
  102447:	ff 75 08             	pushl  0x8(%ebp)
  10244a:	e8 fe 02 00 00       	call   10274d <sys_sem_init>
  10244f:	83 c4 10             	add    $0x10,%esp
  102452:	89 c2                	mov    %eax,%edx
  102454:	8b 45 08             	mov    0x8(%ebp),%eax
  102457:	89 50 2c             	mov    %edx,0x2c(%eax)
  10245a:	eb 5f                	jmp    1024bb <syscallHandle+0x162>
  10245c:	83 ec 0c             	sub    $0xc,%esp
  10245f:	ff 75 08             	pushl  0x8(%ebp)
  102462:	e8 52 03 00 00       	call   1027b9 <sys_sem_post>
  102467:	83 c4 10             	add    $0x10,%esp
  10246a:	89 c2                	mov    %eax,%edx
  10246c:	8b 45 08             	mov    0x8(%ebp),%eax
  10246f:	89 50 2c             	mov    %edx,0x2c(%eax)
  102472:	eb 47                	jmp    1024bb <syscallHandle+0x162>
  102474:	83 ec 0c             	sub    $0xc,%esp
  102477:	ff 75 08             	pushl  0x8(%ebp)
  10247a:	e8 77 03 00 00       	call   1027f6 <sys_sem_wait>
  10247f:	83 c4 10             	add    $0x10,%esp
  102482:	89 c2                	mov    %eax,%edx
  102484:	8b 45 08             	mov    0x8(%ebp),%eax
  102487:	89 50 2c             	mov    %edx,0x2c(%eax)
  10248a:	eb 2f                	jmp    1024bb <syscallHandle+0x162>
  10248c:	83 ec 0c             	sub    $0xc,%esp
  10248f:	ff 75 08             	pushl  0x8(%ebp)
  102492:	e8 9c 03 00 00       	call   102833 <sys_sem_destroy>
  102497:	83 c4 10             	add    $0x10,%esp
  10249a:	89 c2                	mov    %eax,%edx
  10249c:	8b 45 08             	mov    0x8(%ebp),%eax
  10249f:	89 50 2c             	mov    %edx,0x2c(%eax)
  1024a2:	eb 17                	jmp    1024bb <syscallHandle+0x162>
  1024a4:	83 ec 0c             	sub    $0xc,%esp
  1024a7:	ff 75 08             	pushl  0x8(%ebp)
  1024aa:	e8 b6 ed ff ff       	call   101265 <sys_read>
  1024af:	83 c4 10             	add    $0x10,%esp
  1024b2:	89 c2                	mov    %eax,%edx
  1024b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1024b7:	89 50 2c             	mov    %edx,0x2c(%eax)
  1024ba:	90                   	nop
  1024bb:	90                   	nop
  1024bc:	c9                   	leave  
  1024bd:	c3                   	ret    

001024be <GProtectFaultHandle>:
  1024be:	55                   	push   %ebp
  1024bf:	89 e5                	mov    %esp,%ebp
  1024c1:	83 ec 08             	sub    $0x8,%esp
  1024c4:	83 ec 0c             	sub    $0xc,%esp
  1024c7:	68 03 30 10 00       	push   $0x103003
  1024cc:	e8 d6 06 00 00       	call   102ba7 <printk>
  1024d1:	83 c4 10             	add    $0x10,%esp
  1024d4:	8b 45 08             	mov    0x8(%ebp),%eax
  1024d7:	8b 40 30             	mov    0x30(%eax),%eax
  1024da:	83 ec 0c             	sub    $0xc,%esp
  1024dd:	50                   	push   %eax
  1024de:	68 7c 30 10 00       	push   $0x10307c
  1024e3:	68 83 00 00 00       	push   $0x83
  1024e8:	68 f0 2f 10 00       	push   $0x102ff0
  1024ed:	68 52 30 10 00       	push   $0x103052
  1024f2:	e8 b0 06 00 00       	call   102ba7 <printk>
  1024f7:	83 c4 20             	add    $0x20,%esp
  1024fa:	83 ec 0c             	sub    $0xc,%esp
  1024fd:	68 31 30 10 00       	push   $0x103031
  102502:	e8 a0 06 00 00       	call   102ba7 <printk>
  102507:	83 c4 10             	add    $0x10,%esp
  10250a:	83 ec 08             	sub    $0x8,%esp
  10250d:	68 84 00 00 00       	push   $0x84
  102512:	68 f0 2f 10 00       	push   $0x102ff0
  102517:	e8 47 09 00 00       	call   102e63 <abort>
  10251c:	83 c4 10             	add    $0x10,%esp
  10251f:	90                   	nop
  102520:	c9                   	leave  
  102521:	c3                   	ret    

00102522 <timeHandle>:
  102522:	55                   	push   %ebp
  102523:	89 e5                	mov    %esp,%ebp
  102525:	83 ec 18             	sub    $0x18,%esp
  102528:	8b 15 e0 4a 10 00    	mov    0x104ae0,%edx
  10252e:	8b 0d e0 4a 10 00    	mov    0x104ae0,%ecx
  102534:	89 c8                	mov    %ecx,%eax
  102536:	c1 e0 07             	shl    $0x7,%eax
  102539:	01 c8                	add    %ecx,%eax
  10253b:	01 c0                	add    %eax,%eax
  10253d:	01 c8                	add    %ecx,%eax
  10253f:	01 c0                	add    %eax,%eax
  102541:	01 c8                	add    %ecx,%eax
  102543:	c1 e0 04             	shl    $0x4,%eax
  102546:	05 50 6b 10 00       	add    $0x106b50,%eax
  10254b:	8b 00                	mov    (%eax),%eax
  10254d:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102550:	89 d0                	mov    %edx,%eax
  102552:	c1 e0 07             	shl    $0x7,%eax
  102555:	01 d0                	add    %edx,%eax
  102557:	01 c0                	add    %eax,%eax
  102559:	01 d0                	add    %edx,%eax
  10255b:	01 c0                	add    %eax,%eax
  10255d:	01 d0                	add    %edx,%eax
  10255f:	c1 e0 04             	shl    $0x4,%eax
  102562:	05 50 6b 10 00       	add    $0x106b50,%eax
  102567:	89 08                	mov    %ecx,(%eax)
  102569:	e8 6a f7 ff ff       	call   101cd8 <block_decrease>
  10256e:	e8 df f1 ff ff       	call   101752 <check_block>
  102573:	8b 15 e0 4a 10 00    	mov    0x104ae0,%edx
  102579:	89 d0                	mov    %edx,%eax
  10257b:	c1 e0 07             	shl    $0x7,%eax
  10257e:	01 d0                	add    %edx,%eax
  102580:	01 c0                	add    %eax,%eax
  102582:	01 d0                	add    %edx,%eax
  102584:	01 c0                	add    %eax,%eax
  102586:	01 d0                	add    %edx,%eax
  102588:	c1 e0 04             	shl    $0x4,%eax
  10258b:	05 50 6b 10 00       	add    $0x106b50,%eax
  102590:	8b 00                	mov    (%eax),%eax
  102592:	85 c0                	test   %eax,%eax
  102594:	7f 2d                	jg     1025c3 <timeHandle+0xa1>
  102596:	a1 e0 4a 10 00       	mov    0x104ae0,%eax
  10259b:	83 ec 08             	sub    $0x8,%esp
  10259e:	ff 75 08             	pushl  0x8(%ebp)
  1025a1:	50                   	push   %eax
  1025a2:	e8 d2 f0 ff ff       	call   101679 <put_into_runnable>
  1025a7:	83 c4 10             	add    $0x10,%esp
  1025aa:	e8 aa f0 ff ff       	call   101659 <get_from_runnable>
  1025af:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1025b2:	83 ec 08             	sub    $0x8,%esp
  1025b5:	ff 75 08             	pushl  0x8(%ebp)
  1025b8:	ff 75 f4             	pushl  -0xc(%ebp)
  1025bb:	e8 e6 ef ff ff       	call   1015a6 <put_into_running>
  1025c0:	83 c4 10             	add    $0x10,%esp
  1025c3:	e8 73 f0 ff ff       	call   10163b <getpid>
  1025c8:	85 c0                	test   %eax,%eax
  1025ca:	75 12                	jne    1025de <timeHandle+0xbc>
  1025cc:	83 ec 0c             	sub    $0xc,%esp
  1025cf:	68 68 30 10 00       	push   $0x103068
  1025d4:	e8 ce 05 00 00       	call   102ba7 <printk>
  1025d9:	83 c4 10             	add    $0x10,%esp
  1025dc:	eb 16                	jmp    1025f4 <timeHandle+0xd2>
  1025de:	e8 58 f0 ff ff       	call   10163b <getpid>
  1025e3:	83 ec 08             	sub    $0x8,%esp
  1025e6:	50                   	push   %eax
  1025e7:	68 6a 30 10 00       	push   $0x10306a
  1025ec:	e8 b6 05 00 00       	call   102ba7 <printk>
  1025f1:	83 c4 10             	add    $0x10,%esp
  1025f4:	90                   	nop
  1025f5:	c9                   	leave  
  1025f6:	c3                   	ret    

001025f7 <W>:
  1025f7:	55                   	push   %ebp
  1025f8:	89 e5                	mov    %esp,%ebp
  1025fa:	83 ec 18             	sub    $0x18,%esp
  1025fd:	e8 39 f0 ff ff       	call   10163b <getpid>
  102602:	89 c2                	mov    %eax,%edx
  102604:	8b 45 08             	mov    0x8(%ebp),%eax
  102607:	8b 48 04             	mov    0x4(%eax),%ecx
  10260a:	89 d0                	mov    %edx,%eax
  10260c:	c1 e0 07             	shl    $0x7,%eax
  10260f:	01 d0                	add    %edx,%eax
  102611:	01 c0                	add    %eax,%eax
  102613:	01 d0                	add    %edx,%eax
  102615:	01 c0                	add    %eax,%eax
  102617:	01 d0                	add    %edx,%eax
  102619:	c1 e0 04             	shl    $0x4,%eax
  10261c:	05 68 6b 10 00       	add    $0x106b68,%eax
  102621:	89 08                	mov    %ecx,(%eax)
  102623:	e8 13 f0 ff ff       	call   10163b <getpid>
  102628:	89 c2                	mov    %eax,%edx
  10262a:	89 d0                	mov    %edx,%eax
  10262c:	c1 e0 07             	shl    $0x7,%eax
  10262f:	01 d0                	add    %edx,%eax
  102631:	01 c0                	add    %eax,%eax
  102633:	01 d0                	add    %edx,%eax
  102635:	01 c0                	add    %eax,%eax
  102637:	01 d0                	add    %edx,%eax
  102639:	c1 e0 04             	shl    $0x4,%eax
  10263c:	8d 90 00 4b 10 00    	lea    0x104b00(%eax),%edx
  102642:	8b 45 08             	mov    0x8(%ebp),%eax
  102645:	89 50 04             	mov    %edx,0x4(%eax)
  102648:	e8 0c f0 ff ff       	call   101659 <get_from_runnable>
  10264d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102650:	e8 e6 ef ff ff       	call   10163b <getpid>
  102655:	83 f8 02             	cmp    $0x2,%eax
  102658:	74 12                	je     10266c <W+0x75>
  10265a:	83 ec 08             	sub    $0x8,%esp
  10265d:	6a 0e                	push   $0xe
  10265f:	68 90 30 10 00       	push   $0x103090
  102664:	e8 fa 07 00 00       	call   102e63 <abort>
  102669:	83 c4 10             	add    $0x10,%esp
  10266c:	83 ec 08             	sub    $0x8,%esp
  10266f:	6a 00                	push   $0x0
  102671:	ff 75 f4             	pushl  -0xc(%ebp)
  102674:	e8 2d ef ff ff       	call   1015a6 <put_into_running>
  102679:	83 c4 10             	add    $0x10,%esp
  10267c:	90                   	nop
  10267d:	c9                   	leave  
  10267e:	c3                   	ret    

0010267f <R>:
  10267f:	55                   	push   %ebp
  102680:	89 e5                	mov    %esp,%ebp
  102682:	83 ec 18             	sub    $0x18,%esp
  102685:	8b 45 08             	mov    0x8(%ebp),%eax
  102688:	8b 40 04             	mov    0x4(%eax),%eax
  10268b:	8b 80 58 20 00 00    	mov    0x2058(%eax),%eax
  102691:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102694:	8b 45 08             	mov    0x8(%ebp),%eax
  102697:	8b 40 04             	mov    0x4(%eax),%eax
  10269a:	8b 90 68 20 00 00    	mov    0x2068(%eax),%edx
  1026a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1026a3:	89 50 04             	mov    %edx,0x4(%eax)
  1026a6:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1026a9:	89 d0                	mov    %edx,%eax
  1026ab:	c1 e0 07             	shl    $0x7,%eax
  1026ae:	01 d0                	add    %edx,%eax
  1026b0:	01 c0                	add    %eax,%eax
  1026b2:	01 d0                	add    %edx,%eax
  1026b4:	01 c0                	add    %eax,%eax
  1026b6:	01 d0                	add    %edx,%eax
  1026b8:	c1 e0 04             	shl    $0x4,%eax
  1026bb:	05 00 20 00 00       	add    $0x2000,%eax
  1026c0:	05 00 4b 10 00       	add    $0x104b00,%eax
  1026c5:	83 ec 08             	sub    $0x8,%esp
  1026c8:	50                   	push   %eax
  1026c9:	ff 75 f4             	pushl  -0xc(%ebp)
  1026cc:	e8 a8 ef ff ff       	call   101679 <put_into_runnable>
  1026d1:	83 c4 10             	add    $0x10,%esp
  1026d4:	e8 62 ef ff ff       	call   10163b <getpid>
  1026d9:	83 f8 01             	cmp    $0x1,%eax
  1026dc:	74 12                	je     1026f0 <R+0x71>
  1026de:	83 ec 08             	sub    $0x8,%esp
  1026e1:	6a 18                	push   $0x18
  1026e3:	68 90 30 10 00       	push   $0x103090
  1026e8:	e8 76 07 00 00       	call   102e63 <abort>
  1026ed:	83 c4 10             	add    $0x10,%esp
  1026f0:	90                   	nop
  1026f1:	c9                   	leave  
  1026f2:	c3                   	ret    

001026f3 <P>:
  1026f3:	55                   	push   %ebp
  1026f4:	89 e5                	mov    %esp,%ebp
  1026f6:	83 ec 08             	sub    $0x8,%esp
  1026f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1026fc:	8b 00                	mov    (%eax),%eax
  1026fe:	8d 50 ff             	lea    -0x1(%eax),%edx
  102701:	8b 45 08             	mov    0x8(%ebp),%eax
  102704:	89 10                	mov    %edx,(%eax)
  102706:	8b 45 08             	mov    0x8(%ebp),%eax
  102709:	8b 00                	mov    (%eax),%eax
  10270b:	85 c0                	test   %eax,%eax
  10270d:	79 0e                	jns    10271d <P+0x2a>
  10270f:	83 ec 0c             	sub    $0xc,%esp
  102712:	ff 75 08             	pushl  0x8(%ebp)
  102715:	e8 dd fe ff ff       	call   1025f7 <W>
  10271a:	83 c4 10             	add    $0x10,%esp
  10271d:	90                   	nop
  10271e:	c9                   	leave  
  10271f:	c3                   	ret    

00102720 <V>:
  102720:	55                   	push   %ebp
  102721:	89 e5                	mov    %esp,%ebp
  102723:	83 ec 08             	sub    $0x8,%esp
  102726:	8b 45 08             	mov    0x8(%ebp),%eax
  102729:	8b 00                	mov    (%eax),%eax
  10272b:	8d 50 01             	lea    0x1(%eax),%edx
  10272e:	8b 45 08             	mov    0x8(%ebp),%eax
  102731:	89 10                	mov    %edx,(%eax)
  102733:	8b 45 08             	mov    0x8(%ebp),%eax
  102736:	8b 00                	mov    (%eax),%eax
  102738:	85 c0                	test   %eax,%eax
  10273a:	7f 0e                	jg     10274a <V+0x2a>
  10273c:	83 ec 0c             	sub    $0xc,%esp
  10273f:	ff 75 08             	pushl  0x8(%ebp)
  102742:	e8 38 ff ff ff       	call   10267f <R>
  102747:	83 c4 10             	add    $0x10,%esp
  10274a:	90                   	nop
  10274b:	c9                   	leave  
  10274c:	c3                   	ret    

0010274d <sys_sem_init>:
  10274d:	55                   	push   %ebp
  10274e:	89 e5                	mov    %esp,%ebp
  102750:	53                   	push   %ebx
  102751:	83 ec 14             	sub    $0x14,%esp
  102754:	8b 45 08             	mov    0x8(%ebp),%eax
  102757:	8b 58 20             	mov    0x20(%eax),%ebx
  10275a:	e8 dc ee ff ff       	call   10163b <getpid>
  10275f:	c1 e0 10             	shl    $0x10,%eax
  102762:	01 d8                	add    %ebx,%eax
  102764:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102767:	a1 64 42 10 00       	mov    0x104264,%eax
  10276c:	25 1f 00 00 80       	and    $0x8000001f,%eax
  102771:	85 c0                	test   %eax,%eax
  102773:	79 05                	jns    10277a <sys_sem_init+0x2d>
  102775:	48                   	dec    %eax
  102776:	83 c8 e0             	or     $0xffffffe0,%eax
  102779:	40                   	inc    %eax
  10277a:	89 c2                	mov    %eax,%edx
  10277c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10277f:	89 10                	mov    %edx,(%eax)
  102781:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102784:	8b 00                	mov    (%eax),%eax
  102786:	8b 55 08             	mov    0x8(%ebp),%edx
  102789:	8b 52 28             	mov    0x28(%edx),%edx
  10278c:	89 14 c5 e0 db 13 01 	mov    %edx,0x113dbe0(,%eax,8)
  102793:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102796:	8b 00                	mov    (%eax),%eax
  102798:	c7 04 c5 e4 db 13 01 	movl   $0x0,0x113dbe4(,%eax,8)
  10279f:	00 00 00 00 
  1027a3:	a1 64 42 10 00       	mov    0x104264,%eax
  1027a8:	40                   	inc    %eax
  1027a9:	a3 64 42 10 00       	mov    %eax,0x104264
  1027ae:	b8 01 00 00 00       	mov    $0x1,%eax
  1027b3:	83 c4 14             	add    $0x14,%esp
  1027b6:	5b                   	pop    %ebx
  1027b7:	5d                   	pop    %ebp
  1027b8:	c3                   	ret    

001027b9 <sys_sem_post>:
  1027b9:	55                   	push   %ebp
  1027ba:	89 e5                	mov    %esp,%ebp
  1027bc:	53                   	push   %ebx
  1027bd:	83 ec 14             	sub    $0x14,%esp
  1027c0:	8b 45 08             	mov    0x8(%ebp),%eax
  1027c3:	8b 58 20             	mov    0x20(%eax),%ebx
  1027c6:	e8 70 ee ff ff       	call   10163b <getpid>
  1027cb:	c1 e0 10             	shl    $0x10,%eax
  1027ce:	01 d8                	add    %ebx,%eax
  1027d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1027d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1027d6:	8b 00                	mov    (%eax),%eax
  1027d8:	c1 e0 03             	shl    $0x3,%eax
  1027db:	05 e0 db 13 01       	add    $0x113dbe0,%eax
  1027e0:	83 ec 0c             	sub    $0xc,%esp
  1027e3:	50                   	push   %eax
  1027e4:	e8 37 ff ff ff       	call   102720 <V>
  1027e9:	83 c4 10             	add    $0x10,%esp
  1027ec:	b8 01 00 00 00       	mov    $0x1,%eax
  1027f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1027f4:	c9                   	leave  
  1027f5:	c3                   	ret    

001027f6 <sys_sem_wait>:
  1027f6:	55                   	push   %ebp
  1027f7:	89 e5                	mov    %esp,%ebp
  1027f9:	53                   	push   %ebx
  1027fa:	83 ec 14             	sub    $0x14,%esp
  1027fd:	8b 45 08             	mov    0x8(%ebp),%eax
  102800:	8b 58 20             	mov    0x20(%eax),%ebx
  102803:	e8 33 ee ff ff       	call   10163b <getpid>
  102808:	c1 e0 10             	shl    $0x10,%eax
  10280b:	01 d8                	add    %ebx,%eax
  10280d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102810:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102813:	8b 00                	mov    (%eax),%eax
  102815:	c1 e0 03             	shl    $0x3,%eax
  102818:	05 e0 db 13 01       	add    $0x113dbe0,%eax
  10281d:	83 ec 0c             	sub    $0xc,%esp
  102820:	50                   	push   %eax
  102821:	e8 cd fe ff ff       	call   1026f3 <P>
  102826:	83 c4 10             	add    $0x10,%esp
  102829:	b8 01 00 00 00       	mov    $0x1,%eax
  10282e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102831:	c9                   	leave  
  102832:	c3                   	ret    

00102833 <sys_sem_destroy>:
  102833:	55                   	push   %ebp
  102834:	89 e5                	mov    %esp,%ebp
  102836:	b8 01 00 00 00       	mov    $0x1,%eax
  10283b:	5d                   	pop    %ebp
  10283c:	c3                   	ret    

0010283d <inByte>:
  10283d:	55                   	push   %ebp
  10283e:	89 e5                	mov    %esp,%ebp
  102840:	83 ec 14             	sub    $0x14,%esp
  102843:	8b 45 08             	mov    0x8(%ebp),%eax
  102846:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  10284a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10284d:	89 c2                	mov    %eax,%edx
  10284f:	ec                   	in     (%dx),%al
  102850:	88 45 ff             	mov    %al,-0x1(%ebp)
  102853:	8a 45 ff             	mov    -0x1(%ebp),%al
  102856:	c9                   	leave  
  102857:	c3                   	ret    

00102858 <outByte>:
  102858:	55                   	push   %ebp
  102859:	89 e5                	mov    %esp,%ebp
  10285b:	83 ec 08             	sub    $0x8,%esp
  10285e:	8b 45 08             	mov    0x8(%ebp),%eax
  102861:	8b 55 0c             	mov    0xc(%ebp),%edx
  102864:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  102868:	88 55 f8             	mov    %dl,-0x8(%ebp)
  10286b:	8a 45 f8             	mov    -0x8(%ebp),%al
  10286e:	8b 55 fc             	mov    -0x4(%ebp),%edx
  102871:	ee                   	out    %al,(%dx)
  102872:	90                   	nop
  102873:	c9                   	leave  
  102874:	c3                   	ret    

00102875 <initIntr>:
  102875:	55                   	push   %ebp
  102876:	89 e5                	mov    %esp,%ebp
  102878:	6a ff                	push   $0xffffffff
  10287a:	6a 21                	push   $0x21
  10287c:	e8 d7 ff ff ff       	call   102858 <outByte>
  102881:	83 c4 08             	add    $0x8,%esp
  102884:	6a ff                	push   $0xffffffff
  102886:	68 a1 00 00 00       	push   $0xa1
  10288b:	e8 c8 ff ff ff       	call   102858 <outByte>
  102890:	83 c4 08             	add    $0x8,%esp
  102893:	6a 11                	push   $0x11
  102895:	6a 20                	push   $0x20
  102897:	e8 bc ff ff ff       	call   102858 <outByte>
  10289c:	83 c4 08             	add    $0x8,%esp
  10289f:	6a 20                	push   $0x20
  1028a1:	6a 21                	push   $0x21
  1028a3:	e8 b0 ff ff ff       	call   102858 <outByte>
  1028a8:	83 c4 08             	add    $0x8,%esp
  1028ab:	6a 04                	push   $0x4
  1028ad:	6a 21                	push   $0x21
  1028af:	e8 a4 ff ff ff       	call   102858 <outByte>
  1028b4:	83 c4 08             	add    $0x8,%esp
  1028b7:	6a 03                	push   $0x3
  1028b9:	6a 21                	push   $0x21
  1028bb:	e8 98 ff ff ff       	call   102858 <outByte>
  1028c0:	83 c4 08             	add    $0x8,%esp
  1028c3:	6a 11                	push   $0x11
  1028c5:	68 a0 00 00 00       	push   $0xa0
  1028ca:	e8 89 ff ff ff       	call   102858 <outByte>
  1028cf:	83 c4 08             	add    $0x8,%esp
  1028d2:	6a 28                	push   $0x28
  1028d4:	68 a1 00 00 00       	push   $0xa1
  1028d9:	e8 7a ff ff ff       	call   102858 <outByte>
  1028de:	83 c4 08             	add    $0x8,%esp
  1028e1:	6a 02                	push   $0x2
  1028e3:	68 a1 00 00 00       	push   $0xa1
  1028e8:	e8 6b ff ff ff       	call   102858 <outByte>
  1028ed:	83 c4 08             	add    $0x8,%esp
  1028f0:	6a 03                	push   $0x3
  1028f2:	68 a1 00 00 00       	push   $0xa1
  1028f7:	e8 5c ff ff ff       	call   102858 <outByte>
  1028fc:	83 c4 08             	add    $0x8,%esp
  1028ff:	6a 68                	push   $0x68
  102901:	6a 20                	push   $0x20
  102903:	e8 50 ff ff ff       	call   102858 <outByte>
  102908:	83 c4 08             	add    $0x8,%esp
  10290b:	6a 0a                	push   $0xa
  10290d:	6a 20                	push   $0x20
  10290f:	e8 44 ff ff ff       	call   102858 <outByte>
  102914:	83 c4 08             	add    $0x8,%esp
  102917:	6a 68                	push   $0x68
  102919:	68 a0 00 00 00       	push   $0xa0
  10291e:	e8 35 ff ff ff       	call   102858 <outByte>
  102923:	83 c4 08             	add    $0x8,%esp
  102926:	6a 0a                	push   $0xa
  102928:	68 a0 00 00 00       	push   $0xa0
  10292d:	e8 26 ff ff ff       	call   102858 <outByte>
  102932:	83 c4 08             	add    $0x8,%esp
  102935:	90                   	nop
  102936:	c9                   	leave  
  102937:	c3                   	ret    

00102938 <initTimer>:
  102938:	55                   	push   %ebp
  102939:	89 e5                	mov    %esp,%ebp
  10293b:	83 ec 10             	sub    $0x10,%esp
  10293e:	c7 45 fc 9b 2e 00 00 	movl   $0x2e9b,-0x4(%ebp)
  102945:	6a 34                	push   $0x34
  102947:	6a 43                	push   $0x43
  102949:	e8 0a ff ff ff       	call   102858 <outByte>
  10294e:	83 c4 08             	add    $0x8,%esp
  102951:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102954:	25 ff 00 00 80       	and    $0x800000ff,%eax
  102959:	85 c0                	test   %eax,%eax
  10295b:	79 07                	jns    102964 <initTimer+0x2c>
  10295d:	48                   	dec    %eax
  10295e:	0d 00 ff ff ff       	or     $0xffffff00,%eax
  102963:	40                   	inc    %eax
  102964:	0f be c0             	movsbl %al,%eax
  102967:	50                   	push   %eax
  102968:	6a 40                	push   $0x40
  10296a:	e8 e9 fe ff ff       	call   102858 <outByte>
  10296f:	83 c4 08             	add    $0x8,%esp
  102972:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102975:	85 c0                	test   %eax,%eax
  102977:	79 05                	jns    10297e <initTimer+0x46>
  102979:	05 ff 00 00 00       	add    $0xff,%eax
  10297e:	c1 f8 08             	sar    $0x8,%eax
  102981:	0f be c0             	movsbl %al,%eax
  102984:	50                   	push   %eax
  102985:	6a 40                	push   $0x40
  102987:	e8 cc fe ff ff       	call   102858 <outByte>
  10298c:	83 c4 08             	add    $0x8,%esp
  10298f:	90                   	nop
  102990:	c9                   	leave  
  102991:	c3                   	ret    

00102992 <getKeyCode>:
  102992:	55                   	push   %ebp
  102993:	89 e5                	mov    %esp,%ebp
  102995:	83 ec 10             	sub    $0x10,%esp
  102998:	6a 60                	push   $0x60
  10299a:	e8 9e fe ff ff       	call   10283d <inByte>
  10299f:	83 c4 04             	add    $0x4,%esp
  1029a2:	0f b6 c0             	movzbl %al,%eax
  1029a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1029a8:	6a 61                	push   $0x61
  1029aa:	e8 8e fe ff ff       	call   10283d <inByte>
  1029af:	83 c4 04             	add    $0x4,%esp
  1029b2:	0f b6 c0             	movzbl %al,%eax
  1029b5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1029b8:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1029bb:	83 c8 80             	or     $0xffffff80,%eax
  1029be:	0f be c0             	movsbl %al,%eax
  1029c1:	50                   	push   %eax
  1029c2:	6a 61                	push   $0x61
  1029c4:	e8 8f fe ff ff       	call   102858 <outByte>
  1029c9:	83 c4 08             	add    $0x8,%esp
  1029cc:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1029cf:	0f be c0             	movsbl %al,%eax
  1029d2:	50                   	push   %eax
  1029d3:	6a 61                	push   $0x61
  1029d5:	e8 7e fe ff ff       	call   102858 <outByte>
  1029da:	83 c4 08             	add    $0x8,%esp
  1029dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1029e0:	c9                   	leave  
  1029e1:	c3                   	ret    

001029e2 <i2A>:
  1029e2:	55                   	push   %ebp
  1029e3:	89 e5                	mov    %esp,%ebp
  1029e5:	83 ec 10             	sub    $0x10,%esp
  1029e8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1029ef:	c7 45 f8 9e 4a 10 00 	movl   $0x104a9e,-0x8(%ebp)
  1029f6:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
  1029fa:	c6 45 f6 00          	movb   $0x0,-0xa(%ebp)
  1029fe:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102a02:	79 17                	jns    102a1b <i2A+0x39>
  102a04:	81 7d 08 00 00 00 80 	cmpl   $0x80000000,0x8(%ebp)
  102a0b:	75 07                	jne    102a14 <i2A+0x32>
  102a0d:	ff 45 08             	incl   0x8(%ebp)
  102a10:	c6 45 f6 01          	movb   $0x1,-0xa(%ebp)
  102a14:	c6 45 f7 01          	movb   $0x1,-0x9(%ebp)
  102a18:	f7 5d 08             	negl   0x8(%ebp)
  102a1b:	ff 4d f8             	decl   -0x8(%ebp)
  102a1e:	8b 45 08             	mov    0x8(%ebp),%eax
  102a21:	b9 0a 00 00 00       	mov    $0xa,%ecx
  102a26:	99                   	cltd   
  102a27:	f7 f9                	idiv   %ecx
  102a29:	89 d0                	mov    %edx,%eax
  102a2b:	83 c0 30             	add    $0x30,%eax
  102a2e:	88 c2                	mov    %al,%dl
  102a30:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102a33:	88 10                	mov    %dl,(%eax)
  102a35:	ff 45 fc             	incl   -0x4(%ebp)
  102a38:	8b 4d 08             	mov    0x8(%ebp),%ecx
  102a3b:	b8 67 66 66 66       	mov    $0x66666667,%eax
  102a40:	f7 e9                	imul   %ecx
  102a42:	c1 fa 02             	sar    $0x2,%edx
  102a45:	89 c8                	mov    %ecx,%eax
  102a47:	c1 f8 1f             	sar    $0x1f,%eax
  102a4a:	29 c2                	sub    %eax,%edx
  102a4c:	89 d0                	mov    %edx,%eax
  102a4e:	89 45 08             	mov    %eax,0x8(%ebp)
  102a51:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102a55:	75 c4                	jne    102a1b <i2A+0x39>
  102a57:	80 7d f7 01          	cmpb   $0x1,-0x9(%ebp)
  102a5b:	75 0c                	jne    102a69 <i2A+0x87>
  102a5d:	ff 4d f8             	decl   -0x8(%ebp)
  102a60:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102a63:	c6 00 2d             	movb   $0x2d,(%eax)
  102a66:	ff 45 fc             	incl   -0x4(%ebp)
  102a69:	80 7d f6 01          	cmpb   $0x1,-0xa(%ebp)
  102a6d:	75 0b                	jne    102a7a <i2A+0x98>
  102a6f:	a0 9d 4a 10 00       	mov    0x104a9d,%al
  102a74:	40                   	inc    %eax
  102a75:	a2 9d 4a 10 00       	mov    %al,0x104a9d
  102a7a:	c6 05 9e 4a 10 00 00 	movb   $0x0,0x104a9e
  102a81:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a84:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102a87:	89 10                	mov    %edx,(%eax)
  102a89:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102a8c:	c9                   	leave  
  102a8d:	c3                   	ret    

00102a8e <append>:
  102a8e:	55                   	push   %ebp
  102a8f:	89 e5                	mov    %esp,%ebp
  102a91:	83 ec 10             	sub    $0x10,%esp
  102a94:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  102a9b:	eb 19                	jmp    102ab6 <append+0x28>
  102a9d:	ff 45 fc             	incl   -0x4(%ebp)
  102aa0:	8b 45 08             	mov    0x8(%ebp),%eax
  102aa3:	8d 50 01             	lea    0x1(%eax),%edx
  102aa6:	89 55 08             	mov    %edx,0x8(%ebp)
  102aa9:	8b 55 0c             	mov    0xc(%ebp),%edx
  102aac:	8d 4a 01             	lea    0x1(%edx),%ecx
  102aaf:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  102ab2:	8a 12                	mov    (%edx),%dl
  102ab4:	88 10                	mov    %dl,(%eax)
  102ab6:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ab9:	8a 00                	mov    (%eax),%al
  102abb:	84 c0                	test   %al,%al
  102abd:	75 de                	jne    102a9d <append+0xf>
  102abf:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ac2:	c9                   	leave  
  102ac3:	c3                   	ret    

00102ac4 <i2X>:
  102ac4:	55                   	push   %ebp
  102ac5:	89 e5                	mov    %esp,%ebp
  102ac7:	83 ec 10             	sub    $0x10,%esp
  102aca:	c7 45 fc be 4a 10 00 	movl   $0x104abe,-0x4(%ebp)
  102ad1:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  102ad8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102adf:	ff 45 f8             	incl   -0x8(%ebp)
  102ae2:	8b 45 08             	mov    0x8(%ebp),%eax
  102ae5:	83 e0 0f             	and    $0xf,%eax
  102ae8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102aeb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102aee:	83 e8 0a             	sub    $0xa,%eax
  102af1:	83 f8 05             	cmp    $0x5,%eax
  102af4:	77 4b                	ja     102b41 <i2X+0x7d>
  102af6:	8b 04 85 a4 30 10 00 	mov    0x1030a4(,%eax,4),%eax
  102afd:	ff e0                	jmp    *%eax
  102aff:	ff 4d fc             	decl   -0x4(%ebp)
  102b02:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b05:	c6 00 61             	movb   $0x61,(%eax)
  102b08:	eb 47                	jmp    102b51 <i2X+0x8d>
  102b0a:	ff 4d fc             	decl   -0x4(%ebp)
  102b0d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b10:	c6 00 62             	movb   $0x62,(%eax)
  102b13:	eb 3c                	jmp    102b51 <i2X+0x8d>
  102b15:	ff 4d fc             	decl   -0x4(%ebp)
  102b18:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b1b:	c6 00 63             	movb   $0x63,(%eax)
  102b1e:	eb 31                	jmp    102b51 <i2X+0x8d>
  102b20:	ff 4d fc             	decl   -0x4(%ebp)
  102b23:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b26:	c6 00 64             	movb   $0x64,(%eax)
  102b29:	eb 26                	jmp    102b51 <i2X+0x8d>
  102b2b:	ff 4d fc             	decl   -0x4(%ebp)
  102b2e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b31:	c6 00 65             	movb   $0x65,(%eax)
  102b34:	eb 1b                	jmp    102b51 <i2X+0x8d>
  102b36:	ff 4d fc             	decl   -0x4(%ebp)
  102b39:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b3c:	c6 00 66             	movb   $0x66,(%eax)
  102b3f:	eb 10                	jmp    102b51 <i2X+0x8d>
  102b41:	ff 4d fc             	decl   -0x4(%ebp)
  102b44:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b47:	83 c0 30             	add    $0x30,%eax
  102b4a:	88 c2                	mov    %al,%dl
  102b4c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b4f:	88 10                	mov    %dl,(%eax)
  102b51:	8b 45 08             	mov    0x8(%ebp),%eax
  102b54:	c1 e8 04             	shr    $0x4,%eax
  102b57:	89 45 08             	mov    %eax,0x8(%ebp)
  102b5a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102b5e:	0f 85 7b ff ff ff    	jne    102adf <i2X+0x1b>
  102b64:	c6 05 be 4a 10 00 00 	movb   $0x0,0x104abe
  102b6b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b6e:	8b 55 fc             	mov    -0x4(%ebp),%edx
  102b71:	89 10                	mov    %edx,(%eax)
  102b73:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102b76:	c9                   	leave  
  102b77:	c3                   	ret    

00102b78 <printk_char>:
  102b78:	55                   	push   %ebp
  102b79:	89 e5                	mov    %esp,%ebp
  102b7b:	83 ec 08             	sub    $0x8,%esp
  102b7e:	eb 17                	jmp    102b97 <printk_char+0x1f>
  102b80:	8b 45 08             	mov    0x8(%ebp),%eax
  102b83:	8a 00                	mov    (%eax),%al
  102b85:	0f be c0             	movsbl %al,%eax
  102b88:	83 ec 0c             	sub    $0xc,%esp
  102b8b:	50                   	push   %eax
  102b8c:	e8 d8 e9 ff ff       	call   101569 <putChar>
  102b91:	83 c4 10             	add    $0x10,%esp
  102b94:	ff 45 08             	incl   0x8(%ebp)
  102b97:	8b 45 08             	mov    0x8(%ebp),%eax
  102b9a:	8a 00                	mov    (%eax),%al
  102b9c:	84 c0                	test   %al,%al
  102b9e:	75 e0                	jne    102b80 <printk_char+0x8>
  102ba0:	b8 01 00 00 00       	mov    $0x1,%eax
  102ba5:	c9                   	leave  
  102ba6:	c3                   	ret    

00102ba7 <printk>:
  102ba7:	55                   	push   %ebp
  102ba8:	89 e5                	mov    %esp,%ebp
  102baa:	83 ec 28             	sub    $0x28,%esp
  102bad:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102bb4:	8d 45 0c             	lea    0xc(%ebp),%eax
  102bb7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102bba:	8b 45 08             	mov    0x8(%ebp),%eax
  102bbd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102bc0:	c7 45 e8 58 00 00 00 	movl   $0x58,-0x18(%ebp)
  102bc7:	e9 57 01 00 00       	jmp    102d23 <printk+0x17c>
  102bcc:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102bcf:	8a 00                	mov    (%eax),%al
  102bd1:	3c 25                	cmp    $0x25,%al
  102bd3:	75 56                	jne    102c2b <printk+0x84>
  102bd5:	ff 45 ec             	incl   -0x14(%ebp)
  102bd8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102bdb:	8a 00                	mov    (%eax),%al
  102bdd:	0f be c0             	movsbl %al,%eax
  102be0:	83 f8 64             	cmp    $0x64,%eax
  102be3:	74 18                	je     102bfd <printk+0x56>
  102be5:	83 f8 64             	cmp    $0x64,%eax
  102be8:	7f 07                	jg     102bf1 <printk+0x4a>
  102bea:	83 f8 63             	cmp    $0x63,%eax
  102bed:	74 29                	je     102c18 <printk+0x71>
  102bef:	eb 30                	jmp    102c21 <printk+0x7a>
  102bf1:	83 f8 73             	cmp    $0x73,%eax
  102bf4:	74 19                	je     102c0f <printk+0x68>
  102bf6:	83 f8 78             	cmp    $0x78,%eax
  102bf9:	74 0b                	je     102c06 <printk+0x5f>
  102bfb:	eb 24                	jmp    102c21 <printk+0x7a>
  102bfd:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
  102c04:	eb 2c                	jmp    102c32 <printk+0x8b>
  102c06:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  102c0d:	eb 23                	jmp    102c32 <printk+0x8b>
  102c0f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  102c16:	eb 1a                	jmp    102c32 <printk+0x8b>
  102c18:	c7 45 e8 03 00 00 00 	movl   $0x3,-0x18(%ebp)
  102c1f:	eb 11                	jmp    102c32 <printk+0x8b>
  102c21:	c7 45 e8 58 00 00 00 	movl   $0x58,-0x18(%ebp)
  102c28:	90                   	nop
  102c29:	eb 07                	jmp    102c32 <printk+0x8b>
  102c2b:	c7 45 e8 58 00 00 00 	movl   $0x58,-0x18(%ebp)
  102c32:	83 7d e8 58          	cmpl   $0x58,-0x18(%ebp)
  102c36:	75 19                	jne    102c51 <printk+0xaa>
  102c38:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c3b:	8d 50 01             	lea    0x1(%eax),%edx
  102c3e:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102c41:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102c44:	8a 12                	mov    (%edx),%dl
  102c46:	88 90 80 42 10 00    	mov    %dl,0x104280(%eax)
  102c4c:	e9 cf 00 00 00       	jmp    102d20 <printk+0x179>
  102c51:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
  102c55:	75 3f                	jne    102c96 <printk+0xef>
  102c57:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  102c5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c61:	8d 50 04             	lea    0x4(%eax),%edx
  102c64:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102c67:	8b 00                	mov    (%eax),%eax
  102c69:	89 c2                	mov    %eax,%edx
  102c6b:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  102c6e:	50                   	push   %eax
  102c6f:	52                   	push   %edx
  102c70:	e8 6d fd ff ff       	call   1029e2 <i2A>
  102c75:	83 c4 08             	add    $0x8,%esp
  102c78:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102c7b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102c7e:	81 c2 80 42 10 00    	add    $0x104280,%edx
  102c84:	50                   	push   %eax
  102c85:	52                   	push   %edx
  102c86:	e8 03 fe ff ff       	call   102a8e <append>
  102c8b:	83 c4 08             	add    $0x8,%esp
  102c8e:	01 45 f4             	add    %eax,-0xc(%ebp)
  102c91:	e9 8a 00 00 00       	jmp    102d20 <printk+0x179>
  102c96:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
  102c9a:	75 3a                	jne    102cd6 <printk+0x12f>
  102c9c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  102ca3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ca6:	8d 50 04             	lea    0x4(%eax),%edx
  102ca9:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102cac:	8b 00                	mov    (%eax),%eax
  102cae:	8d 55 e0             	lea    -0x20(%ebp),%edx
  102cb1:	52                   	push   %edx
  102cb2:	50                   	push   %eax
  102cb3:	e8 0c fe ff ff       	call   102ac4 <i2X>
  102cb8:	83 c4 08             	add    $0x8,%esp
  102cbb:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102cbe:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102cc1:	81 c2 80 42 10 00    	add    $0x104280,%edx
  102cc7:	50                   	push   %eax
  102cc8:	52                   	push   %edx
  102cc9:	e8 c0 fd ff ff       	call   102a8e <append>
  102cce:	83 c4 08             	add    $0x8,%esp
  102cd1:	01 45 f4             	add    %eax,-0xc(%ebp)
  102cd4:	eb 4a                	jmp    102d20 <printk+0x179>
  102cd6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102cda:	75 24                	jne    102d00 <printk+0x159>
  102cdc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102cdf:	8d 50 04             	lea    0x4(%eax),%edx
  102ce2:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102ce5:	8b 00                	mov    (%eax),%eax
  102ce7:	89 c2                	mov    %eax,%edx
  102ce9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102cec:	05 80 42 10 00       	add    $0x104280,%eax
  102cf1:	52                   	push   %edx
  102cf2:	50                   	push   %eax
  102cf3:	e8 96 fd ff ff       	call   102a8e <append>
  102cf8:	83 c4 08             	add    $0x8,%esp
  102cfb:	01 45 f4             	add    %eax,-0xc(%ebp)
  102cfe:	eb 20                	jmp    102d20 <printk+0x179>
  102d00:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  102d04:	75 1a                	jne    102d20 <printk+0x179>
  102d06:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d09:	8d 50 01             	lea    0x1(%eax),%edx
  102d0c:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102d0f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102d12:	8d 4a 04             	lea    0x4(%edx),%ecx
  102d15:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  102d18:	8b 12                	mov    (%edx),%edx
  102d1a:	88 90 80 42 10 00    	mov    %dl,0x104280(%eax)
  102d20:	ff 45 ec             	incl   -0x14(%ebp)
  102d23:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102d26:	8a 00                	mov    (%eax),%al
  102d28:	84 c0                	test   %al,%al
  102d2a:	0f 85 9c fe ff ff    	jne    102bcc <printk+0x25>
  102d30:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d33:	8d 50 01             	lea    0x1(%eax),%edx
  102d36:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102d39:	c6 80 80 42 10 00 00 	movb   $0x0,0x104280(%eax)
  102d40:	83 ec 08             	sub    $0x8,%esp
  102d43:	68 00 04 00 00       	push   $0x400
  102d48:	68 80 42 10 00       	push   $0x104280
  102d4d:	e8 26 fe ff ff       	call   102b78 <printk_char>
  102d52:	83 c4 10             	add    $0x10,%esp
  102d55:	90                   	nop
  102d56:	c9                   	leave  
  102d57:	c3                   	ret    

00102d58 <waitForInterrupt>:
  102d58:	55                   	push   %ebp
  102d59:	89 e5                	mov    %esp,%ebp
  102d5b:	f4                   	hlt    
  102d5c:	90                   	nop
  102d5d:	5d                   	pop    %ebp
  102d5e:	c3                   	ret    

00102d5f <disableInterrupt>:
  102d5f:	55                   	push   %ebp
  102d60:	89 e5                	mov    %esp,%ebp
  102d62:	fa                   	cli    
  102d63:	90                   	nop
  102d64:	5d                   	pop    %ebp
  102d65:	c3                   	ret    

00102d66 <i2A>:
  102d66:	55                   	push   %ebp
  102d67:	89 e5                	mov    %esp,%ebp
  102d69:	83 ec 10             	sub    $0x10,%esp
  102d6c:	c7 45 fc dd 4a 10 00 	movl   $0x104add,-0x4(%ebp)
  102d73:	ff 4d fc             	decl   -0x4(%ebp)
  102d76:	8b 45 08             	mov    0x8(%ebp),%eax
  102d79:	b9 0a 00 00 00       	mov    $0xa,%ecx
  102d7e:	99                   	cltd   
  102d7f:	f7 f9                	idiv   %ecx
  102d81:	89 d0                	mov    %edx,%eax
  102d83:	83 c0 30             	add    $0x30,%eax
  102d86:	88 c2                	mov    %al,%dl
  102d88:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102d8b:	88 10                	mov    %dl,(%eax)
  102d8d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  102d90:	b8 67 66 66 66       	mov    $0x66666667,%eax
  102d95:	f7 e9                	imul   %ecx
  102d97:	c1 fa 02             	sar    $0x2,%edx
  102d9a:	89 c8                	mov    %ecx,%eax
  102d9c:	c1 f8 1f             	sar    $0x1f,%eax
  102d9f:	29 c2                	sub    %eax,%edx
  102da1:	89 d0                	mov    %edx,%eax
  102da3:	89 45 08             	mov    %eax,0x8(%ebp)
  102da6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102daa:	75 c7                	jne    102d73 <i2A+0xd>
  102dac:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102daf:	c9                   	leave  
  102db0:	c3                   	ret    

00102db1 <append>:
  102db1:	55                   	push   %ebp
  102db2:	89 e5                	mov    %esp,%ebp
  102db4:	eb 1a                	jmp    102dd0 <append+0x1f>
  102db6:	8b 45 08             	mov    0x8(%ebp),%eax
  102db9:	8b 00                	mov    (%eax),%eax
  102dbb:	8d 48 01             	lea    0x1(%eax),%ecx
  102dbe:	8b 55 08             	mov    0x8(%ebp),%edx
  102dc1:	89 0a                	mov    %ecx,(%edx)
  102dc3:	8b 55 0c             	mov    0xc(%ebp),%edx
  102dc6:	8d 4a 01             	lea    0x1(%edx),%ecx
  102dc9:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  102dcc:	8a 12                	mov    (%edx),%dl
  102dce:	88 10                	mov    %dl,(%eax)
  102dd0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dd3:	8a 00                	mov    (%eax),%al
  102dd5:	84 c0                	test   %al,%al
  102dd7:	75 dd                	jne    102db6 <append+0x5>
  102dd9:	90                   	nop
  102dda:	5d                   	pop    %ebp
  102ddb:	c3                   	ret    

00102ddc <displayMessage>:
  102ddc:	55                   	push   %ebp
  102ddd:	89 e5                	mov    %esp,%ebp
  102ddf:	83 ec 18             	sub    $0x18,%esp
  102de2:	b8 52 41 10 00       	mov    $0x104152,%eax
  102de7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102dea:	ff 75 08             	pushl  0x8(%ebp)
  102ded:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102df0:	50                   	push   %eax
  102df1:	e8 bb ff ff ff       	call   102db1 <append>
  102df6:	83 c4 08             	add    $0x8,%esp
  102df9:	68 bc 30 10 00       	push   $0x1030bc
  102dfe:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102e01:	50                   	push   %eax
  102e02:	e8 aa ff ff ff       	call   102db1 <append>
  102e07:	83 c4 08             	add    $0x8,%esp
  102e0a:	ff 75 0c             	pushl  0xc(%ebp)
  102e0d:	e8 54 ff ff ff       	call   102d66 <i2A>
  102e12:	83 c4 04             	add    $0x4,%esp
  102e15:	50                   	push   %eax
  102e16:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102e19:	50                   	push   %eax
  102e1a:	e8 92 ff ff ff       	call   102db1 <append>
  102e1f:	83 c4 08             	add    $0x8,%esp
  102e22:	68 be 30 10 00       	push   $0x1030be
  102e27:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102e2a:	50                   	push   %eax
  102e2b:	e8 81 ff ff ff       	call   102db1 <append>
  102e30:	83 c4 08             	add    $0x8,%esp
  102e33:	c7 45 f4 40 41 10 00 	movl   $0x104140,-0xc(%ebp)
  102e3a:	eb 1b                	jmp    102e57 <displayMessage+0x7b>
  102e3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102e3f:	8a 00                	mov    (%eax),%al
  102e41:	0f be c0             	movsbl %al,%eax
  102e44:	83 ec 0c             	sub    $0xc,%esp
  102e47:	50                   	push   %eax
  102e48:	e8 1c e7 ff ff       	call   101569 <putChar>
  102e4d:	83 c4 10             	add    $0x10,%esp
  102e50:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102e53:	40                   	inc    %eax
  102e54:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e57:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102e5a:	8a 00                	mov    (%eax),%al
  102e5c:	84 c0                	test   %al,%al
  102e5e:	75 dc                	jne    102e3c <displayMessage+0x60>
  102e60:	90                   	nop
  102e61:	c9                   	leave  
  102e62:	c3                   	ret    

00102e63 <abort>:
  102e63:	55                   	push   %ebp
  102e64:	89 e5                	mov    %esp,%ebp
  102e66:	83 ec 08             	sub    $0x8,%esp
  102e69:	e8 f1 fe ff ff       	call   102d5f <disableInterrupt>
  102e6e:	83 ec 08             	sub    $0x8,%esp
  102e71:	ff 75 0c             	pushl  0xc(%ebp)
  102e74:	ff 75 08             	pushl  0x8(%ebp)
  102e77:	e8 60 ff ff ff       	call   102ddc <displayMessage>
  102e7c:	83 c4 10             	add    $0x10,%esp
  102e7f:	e8 d4 fe ff ff       	call   102d58 <waitForInterrupt>
  102e84:	eb f9                	jmp    102e7f <abort+0x1c>

00102e86 <irqEmpty>:
  102e86:	6a 00                	push   $0x0
  102e88:	6a ff                	push   $0xffffffff
  102e8a:	eb 13                	jmp    102e9f <asmDoIrq>

00102e8c <irqGProtectFault>:
  102e8c:	6a 0d                	push   $0xd
  102e8e:	eb 0f                	jmp    102e9f <asmDoIrq>

00102e90 <irqSyscall>:
  102e90:	6a 00                	push   $0x0
  102e92:	68 80 00 00 00       	push   $0x80
  102e97:	eb 06                	jmp    102e9f <asmDoIrq>

00102e99 <irqTime>:
  102e99:	6a 00                	push   $0x0
  102e9b:	6a 20                	push   $0x20
  102e9d:	eb 00                	jmp    102e9f <asmDoIrq>

00102e9f <asmDoIrq>:
  102e9f:	60                   	pusha  
  102ea0:	1e                   	push   %ds
  102ea1:	06                   	push   %es
  102ea2:	0f a0                	push   %fs
  102ea4:	0f a8                	push   %gs
  102ea6:	54                   	push   %esp
  102ea7:	e8 64 f2 ff ff       	call   102110 <irqHandle>
  102eac:	5c                   	pop    %esp
  102ead:	0f a9                	pop    %gs
  102eaf:	0f a1                	pop    %fs
  102eb1:	07                   	pop    %es
  102eb2:	1f                   	pop    %ds
  102eb3:	61                   	popa   
  102eb4:	83 c4 04             	add    $0x4,%esp
  102eb7:	83 c4 04             	add    $0x4,%esp
  102eba:	cf                   	iret   
