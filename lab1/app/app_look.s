
app.o:     file format elf32-i386


Disassembly of section .text:

00000000 <start>:
   0:	bf 20 03 00 00       	mov    $0x320,%edi
   5:	b4 0c                	mov    $0xc,%ah
   7:	b0 48                	mov    $0x48,%al
   9:	65 66 89 07          	mov    %ax,%gs:(%edi)
   d:	bf 22 03 00 00       	mov    $0x322,%edi
  12:	b4 0c                	mov    $0xc,%ah
  14:	b0 65                	mov    $0x65,%al
  16:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1a:	bf 24 03 00 00       	mov    $0x324,%edi
  1f:	b4 0c                	mov    $0xc,%ah
  21:	b0 6c                	mov    $0x6c,%al
  23:	65 66 89 07          	mov    %ax,%gs:(%edi)
  27:	bf 26 03 00 00       	mov    $0x326,%edi
  2c:	b4 0c                	mov    $0xc,%ah
  2e:	b0 6c                	mov    $0x6c,%al
  30:	65 66 89 07          	mov    %ax,%gs:(%edi)
  34:	bf 28 03 00 00       	mov    $0x328,%edi
  39:	b4 0c                	mov    $0xc,%ah
  3b:	b0 6f                	mov    $0x6f,%al
  3d:	65 66 89 07          	mov    %ax,%gs:(%edi)
  41:	bf 2a 03 00 00       	mov    $0x32a,%edi
  46:	b4 0c                	mov    $0xc,%ah
  48:	b0 20                	mov    $0x20,%al
  4a:	65 66 89 07          	mov    %ax,%gs:(%edi)
  4e:	bf 2c 03 00 00       	mov    $0x32c,%edi
  53:	b4 0c                	mov    $0xc,%ah
  55:	b0 57                	mov    $0x57,%al
  57:	65 66 89 07          	mov    %ax,%gs:(%edi)
  5b:	bf 2e 03 00 00       	mov    $0x32e,%edi
  60:	b4 0c                	mov    $0xc,%ah
  62:	b0 6f                	mov    $0x6f,%al
  64:	65 66 89 07          	mov    %ax,%gs:(%edi)
  68:	bf 30 03 00 00       	mov    $0x330,%edi
  6d:	b4 0c                	mov    $0xc,%ah
  6f:	b0 72                	mov    $0x72,%al
  71:	65 66 89 07          	mov    %ax,%gs:(%edi)
  75:	bf 32 03 00 00       	mov    $0x332,%edi
  7a:	b4 0c                	mov    $0xc,%ah
  7c:	b0 6c                	mov    $0x6c,%al
  7e:	65 66 89 07          	mov    %ax,%gs:(%edi)
  82:	bf 34 03 00 00       	mov    $0x334,%edi
  87:	b4 0c                	mov    $0xc,%ah
  89:	b0 64                	mov    $0x64,%al
  8b:	65 66 89 07          	mov    %ax,%gs:(%edi)
  8f:	bf 36 03 00 00       	mov    $0x336,%edi
  94:	b4 0c                	mov    $0xc,%ah
  96:	b0 21                	mov    $0x21,%al
  98:	65 66 89 07          	mov    %ax,%gs:(%edi)

0000009c <loop>:
  9c:	eb fe                	jmp    9c <loop>
