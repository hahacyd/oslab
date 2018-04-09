
uMain.elf:     file format elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	83 ec 14             	sub    $0x14,%esp
  200006:	68 34 02 20 00       	push   $0x200234
  20000b:	e8 98 01 00 00       	call   2001a8 <printf>
  200010:	c7 04 24 4a 02 20 00 	movl   $0x20024a,(%esp)
  200017:	e8 8c 01 00 00       	call   2001a8 <printf>
  20001c:	c7 04 24 2c 03 20 00 	movl   $0x20032c,(%esp)
  200023:	e8 80 01 00 00       	call   2001a8 <printf>
  200028:	c7 04 24 68 03 20 00 	movl   $0x200368,(%esp)
  20002f:	e8 74 01 00 00       	call   2001a8 <printf>
  200034:	c7 04 24 9c 03 20 00 	movl   $0x20039c,(%esp)
  20003b:	e8 68 01 00 00       	call   2001a8 <printf>
  200040:	c7 04 24 18 04 20 00 	movl   $0x200418,(%esp)
  200047:	e8 5c 01 00 00       	call   2001a8 <printf>
  20004c:	c7 04 24 61 02 20 00 	movl   $0x200261,(%esp)
  200053:	e8 50 01 00 00       	call   2001a8 <printf>
  200058:	c7 04 24 3c 04 20 00 	movl   $0x20043c,(%esp)
  20005f:	e8 44 01 00 00       	call   2001a8 <printf>
  200064:	c7 04 24 2c 03 20 00 	movl   $0x20032c,(%esp)
  20006b:	e8 38 01 00 00       	call   2001a8 <printf>
  200070:	c7 04 24 7f 02 20 00 	movl   $0x20027f,(%esp)
  200077:	e8 2c 01 00 00       	call   2001a8 <printf>
  20007c:	c7 04 24 bc 04 20 00 	movl   $0x2004bc,(%esp)
  200083:	e8 20 01 00 00       	call   2001a8 <printf>
  200088:	58                   	pop    %eax
  200089:	5a                   	pop    %edx
  20008a:	68 b5 02 20 00       	push   $0x2002b5
  20008f:	6a 74                	push   $0x74
  200091:	68 8d 02 20 00       	push   $0x20028d
  200096:	68 2a 03 20 00       	push   $0x20032a
  20009b:	68 91 02 20 00       	push   $0x200291
  2000a0:	68 98 02 20 00       	push   $0x200298
  2000a5:	e8 fe 00 00 00       	call   2001a8 <printf>
  2000aa:	83 c4 18             	add    $0x18,%esp
  2000ad:	6a 62                	push   $0x62
  2000af:	6a 61                	push   $0x61
  2000b1:	6a 6c                	push   $0x6c
  2000b3:	6a 53                	push   $0x53
  2000b5:	6a 4f                	push   $0x4f
  2000b7:	68 aa 02 20 00       	push   $0x2002aa
  2000bc:	e8 e7 00 00 00       	call   2001a8 <printf>
  2000c1:	83 c4 1c             	add    $0x1c,%esp
  2000c4:	68 00 00 10 00       	push   $0x100000
  2000c9:	68 f8 04 20 00       	push   $0x2004f8
  2000ce:	68 00 00 10 00       	push   $0x100000
  2000d3:	68 30 05 20 00       	push   $0x200530
  2000d8:	68 b7 02 20 00       	push   $0x2002b7
  2000dd:	68 c0 02 20 00       	push   $0x2002c0
  2000e2:	68 60 05 20 00       	push   $0x200560
  2000e7:	e8 bc 00 00 00       	call   2001a8 <printf>
  2000ec:	83 c4 14             	add    $0x14,%esp
  2000ef:	68 18 04 20 00       	push   $0x200418
  2000f4:	e8 af 00 00 00       	call   2001a8 <printf>
  2000f9:	c7 04 24 61 02 20 00 	movl   $0x200261,(%esp)
  200100:	e8 a3 00 00 00       	call   2001a8 <printf>
  200105:	83 c4 0c             	add    $0xc,%esp
  200108:	68 18 db 00 00       	push   $0xdb18
  20010d:	68 c8 01 00 00       	push   $0x1c8
  200112:	6a 7b                	push   $0x7b
  200114:	6a 02                	push   $0x2
  200116:	6a 01                	push   $0x1
  200118:	6a 01                	push   $0x1
  20011a:	68 c5 02 20 00       	push   $0x2002c5
  20011f:	e8 84 00 00 00       	call   2001a8 <printf>
  200124:	83 c4 1c             	add    $0x1c,%esp
  200127:	68 8e 8e 01 00       	push   $0x18e8e
  20012c:	68 00 80 ff ff       	push   $0xffff8000
  200131:	68 01 df ce ab       	push   $0xabcedf01
  200136:	68 00 00 00 80       	push   $0x80000000
  20013b:	6a ff                	push   $0xffffffff
  20013d:	6a 00                	push   $0x0
  20013f:	68 e1 02 20 00       	push   $0x2002e1
  200144:	e8 5f 00 00 00       	call   2001a8 <printf>
  200149:	83 c4 1c             	add    $0x1c,%esp
  20014c:	68 8e 8e 01 00       	push   $0x18e8e
  200151:	68 00 80 ff ff       	push   $0xffff8000
  200156:	68 01 df ce ab       	push   $0xabcedf01
  20015b:	68 00 00 00 80       	push   $0x80000000
  200160:	6a ff                	push   $0xffffffff
  200162:	6a 00                	push   $0x0
  200164:	68 f9 02 20 00       	push   $0x2002f9
  200169:	e8 3a 00 00 00       	call   2001a8 <printf>
  20016e:	83 c4 14             	add    $0x14,%esp
  200171:	68 bc 04 20 00       	push   $0x2004bc
  200176:	e8 2d 00 00 00       	call   2001a8 <printf>
  20017b:	c7 04 24 11 03 20 00 	movl   $0x200311,(%esp)
  200182:	e8 21 00 00 00       	call   2001a8 <printf>
  200187:	83 c4 10             	add    $0x10,%esp
  20018a:	eb fe                	jmp    20018a <uEntry+0x18a>

0020018c <syscall>:
  20018c:	55                   	push   %ebp
  20018d:	89 e5                	mov    %esp,%ebp
  20018f:	8b 45 08             	mov    0x8(%ebp),%eax
  200192:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  200195:	8b 4d 10             	mov    0x10(%ebp),%ecx
  200198:	8b 55 14             	mov    0x14(%ebp),%edx
  20019b:	8b 7d 18             	mov    0x18(%ebp),%edi
  20019e:	8b 75 1c             	mov    0x1c(%ebp),%esi
  2001a1:	cd 80                	int    $0x80
  2001a3:	31 c0                	xor    %eax,%eax
  2001a5:	5d                   	pop    %ebp
  2001a6:	c3                   	ret    
  2001a7:	90                   	nop

002001a8 <printf>:
  2001a8:	55                   	push   %ebp
  2001a9:	89 e5                	mov    %esp,%ebp
  2001ab:	83 ec 20             	sub    $0x20,%esp
  2001ae:	c7 45 fc 50 00 00 00 	movl   $0x50,-0x4(%ebp)
  2001b5:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%ebp)
  2001bc:	8b 45 08             	mov    0x8(%ebp),%eax
  2001bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  2001c2:	c7 45 f0 14 00 00 00 	movl   $0x14,-0x10(%ebp)
  2001c9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  2001d0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  2001d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2001da:	8b 5d f8             	mov    -0x8(%ebp),%ebx
  2001dd:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  2001e0:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2001e3:	8b 7d ec             	mov    -0x14(%ebp),%edi
  2001e6:	8b 75 e8             	mov    -0x18(%ebp),%esi
  2001e9:	cd 80                	int    $0x80
  2001eb:	c9                   	leave  
  2001ec:	c3                   	ret    
  2001ed:	8d 76 00             	lea    0x0(%esi),%esi

002001f0 <fs_write>:
  2001f0:	55                   	push   %ebp
  2001f1:	89 e5                	mov    %esp,%ebp
  2001f3:	83 ec 20             	sub    $0x20,%esp
  2001f6:	c7 45 e8 50 00 00 00 	movl   $0x50,-0x18(%ebp)
  2001fd:	8b 45 08             	mov    0x8(%ebp),%eax
  200200:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200203:	8b 45 0c             	mov    0xc(%ebp),%eax
  200206:	89 45 f0             	mov    %eax,-0x10(%ebp)
  200209:	8b 45 10             	mov    0x10(%ebp),%eax
  20020c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  20020f:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200216:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  20021d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  200220:	8b 5d ec             	mov    -0x14(%ebp),%ebx
  200223:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  200226:	8b 55 f4             	mov    -0xc(%ebp),%edx
  200229:	8b 7d f8             	mov    -0x8(%ebp),%edi
  20022c:	8b 75 fc             	mov    -0x4(%ebp),%esi
  20022f:	cd 80                	int    $0x80
  200231:	c9                   	leave  
  200232:	c3                   	ret    
