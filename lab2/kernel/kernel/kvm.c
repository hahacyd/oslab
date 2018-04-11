#include "x86.h"
#include "device.h"

SegDesc gdt[NR_SEGMENTS];
TSS tss;

#define SECTSIZE 512

void waitDisk(void) {
	while((inByte(0x1F7) & 0xC0) != 0x40); 
}

void readSect(void *dst, int offset) {
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
#define SEG_VEDIO 6
void initSeg() {
	/*

	.word 0xffff, 0             #code sreg descriptor
	.byte 0,0x9a,0xcf,0

	.word 0xffff, 0             #data sreg descriptor
	.byte 0,0x92,0xcf,0

	.word 0xffff, 0x8000        #video sreg descriptor
	.byte 0x0b,0x92,0xcf,0
	*/
	gdt[SEG_KCODE] = SEG(STA_X | STA_R, 0,       0xffffffff, DPL_KERN);
	gdt[SEG_KDATA] = SEG(STA_W,         0,       0xffffffff, DPL_KERN);
	gdt[SEG_UCODE] = SEG(STA_X | STA_R, 0,       0xffffffff, DPL_USER);
	gdt[SEG_UDATA] = SEG(STA_W,         0,       0xffffffff, DPL_USER);
	gdt[SEG_TSS] = SEG16(STS_T32A,      &tss, sizeof(TSS)-1, DPL_KERN);
	gdt[SEG_TSS].s = 0;
	gdt[SEG_VEDIO] = SEG(STA_W, 0x0b8000, 0xffffffff, DPL_KERN);
	setGdt(gdt, sizeof(gdt));

	/*
	 * 初始化TSS
	 */

	asm volatile("ltr %%ax":: "a" (KSEL(SEG_TSS)));

	//tss.ss0 = KSEL(SEG_KDATA);
	//tss.esp0 = 0x500000;

	/*uint16_t old_cs = 0,old_ss = 0;
	uint32_t old_eip = 0, old_esp = 0;
	uint16_t target_cs = IDT[]*/

	/*设置正确的段寄存器*/

	/*asm volatile("mov %0,%%eax;" ::"i"((uint32_t)KSEL(SEG_KDATA)));
	asm volatile("movw %ax,%ds;");

	asm volatile("mov %0,%%eax;" ::"i"(KSEL(SEG_KCODE)));
	asm volatile("movw %ax,%cs;");

	asm volatile("mov %0,%%eax;" ::"i"(KSEL(SEG_KDATA)));
	asm volatile("movw %ax,%es;");

	asm volatile("mov %0,%%eax;" ::"i"(KSEL(SEG_VEDIO)));
	asm volatile("movw %ax,%gs;");
	*/
	lLdt(0);
}
#define SELECTOR(ss) (ss>>3)
void enterUserSpace(uint32_t entry) {
	/*
	 * Before enter user space 
	 * you should set the right segment registers here
	 * and use 'iret' to jump to ring3
	 */
	uint16_t old_cs = 0;
	uint16_t cs = 0;

	asm volatile("movw %%cs,%0;"
				 : "=r"(old_cs));
	/*asm volatile("popl %eip;");
	asm volatile("popw %cs;");
	asm volatile("popl %eflags;");*/

	asm volatile("movw %%cs,%0;": "=r"(cs));

	if(gdt[SELECTOR(old_cs)].dpl < gdt[SELECTOR(cs)].dpl){  //if true,surely have syscall,
		//asm volatile("pop %%esp;");
		//asm volatile("pop %%ss;");
	}/**/
	asm volatile("iret");
}

void loadUMain(void) {

	/*加载用户程序至内存*/
	void(*user)(void);
	unsigned char* buffer = (unsigned char*)0x3000000;
	for(int i = 1;i <= 200;i++){
		readSect((void*)buffer + 512 * (i - 1),i + 200);
	}
	struct ELFHeader* elf = (void*)buffer;	
	user = (void*)elf->entry;

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
	user = (void*)elf->entry;
	user();
}
