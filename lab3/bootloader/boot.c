#include "boot.h"

#define SECTSIZE 512

void bootMain(void) {
	/* 加载内核至内存，并跳转执行 */
	void(*kernel)(void);
	unsigned char* buffer = (unsigned char*)0x3000000;
	for(int i = 1;i <= 200;i++){
		readSect((void*)buffer + 512 * (i - 1),i);
	}
	struct ELFHeader* elf = (void*)buffer;	
	struct ProgramHeader* ph = (void*)elf + elf->phoff;
	struct ProgramHeader* eph = ph + elf->phnum;
	int dest = 0,src = 0;
	//int phnum = elf->phnum;
	for(;ph < eph;ph++){
		if(ph->type == 1){
			dest = ph->vaddr;
			src = (int)elf + ph->off;
			int filesz = ph->filesz;
			while(dest - ph->vaddr < filesz){
				*(unsigned char*)(dest) = *(unsigned char*)(src);
				dest++;
				src++;
			}
			int memsz = ph->memsz;
			while(dest - ph->vaddr < memsz){
				*(unsigned char*)(dest) = '\0';
				dest++;
			}
		}
	}
	kernel = (void*)elf->entry;
	kernel();
}

void waitDisk(void) { // waiting for disk
	while((inByte(0x1F7) & 0xC0) != 0x40);
}

void readSect(void *dst, int offset) { // reading a sector of disk
	int i;
	waitDisk();
	outByte(0x1F2, 1);
	outByte(0x1F3, offset);
	outByte(0x1F4, offset >> 8);
	outByte(0x1F5, offset >> 16);
	outByte(0x1F6, (offset >> 24) | 0xE0);
	outByte(0x1F7, 0x20);

	waitDisk();
	for (i = 0; i < SECTSIZE / 4; i ++) {
		((int *)dst)[i] = inLong(0x1F0);
	}
}
