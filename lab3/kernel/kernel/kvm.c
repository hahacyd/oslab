#include "x86.h"
#include "device.h"
//ProcessTable pcb[MAX_PCB_NUM];
SegDesc gdt[NR_SEGMENTS];
TSS tss;

#define SECTSIZE 512
int32_t change_gdt(uint32_t sreg, uint32_t base){
	uint32_t index = sreg >> 3;
	switch(index){
	case SEG_KCODE:
		gdt[SEG_KCODE] = SEG(STA_X | STA_R, base,       0xffffffff, DPL_KERN);
		break;
	case SEG_KDATA:
		gdt[SEG_KDATA] = SEG(STA_W, base, 0xffffffff, DPL_KERN);
		break;
	case SEG_UCODE:
		gdt[SEG_UCODE] = SEG(STA_X | STA_R, base, 0xffffffff, DPL_USER);
		break;
	case SEG_UDATA:
		gdt[SEG_UDATA] = SEG(STA_W, base, 0xffffffff, DPL_USER);
		break;
	default:
		LOG("index = %d", index);
		assert(0);
	}
	setGdt(gdt, sizeof(gdt));

	return 1;
}
int32_t change_tss(uint32_t ss0, uint32_t esp0)
{
	tss.ss0 = ss0;
	tss.esp0 = esp0;
	//asm volatile("ltr %%ax" ::"a"(KSEL(SEG_TSS)));
	//assert(0);

	return 1;
}
TSS get_tss(){
	return tss;
}
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
 //
	waitDisk(); 
	for (i = 0; i < SECTSIZE / 4; i ++) {
		((int *)dst)[i] = inLong(0x1F0);
	}
}

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
	gdt[SEG_VIDEO] = SEG(STA_W, 0x0b8000, 0xffffffff, DPL_KERN);
	setGdt(gdt, sizeof(gdt));

	/*
	 * 初始化TSS
	 */
	//start init idle pcb
	
	//tss.esp0 = (uint32_t)pcb[0].stack;
	//LOG("kernel stack address = %x\n", (uint32_t)pcb[0].stack);
	//LOG("pcb address = %x\n", (uint32_t)pcb);

	//tss.esp0 = 0x500000; // set kernel esp to 0x500,000
	//init_kernel_pcb(KSEL(SEG_KDATA), 0x500000);
	change_tss(pcb[0].tf.ss, (uint32_t)((pcb[0].stack) + MAX_STACK_SIZE - 1));
	//change_tss(pcb[0].tf.ss,(uint32_t)(&pcb[0].tf) + sizeof(TrapFrame2) );

	//tss.esp0 = pcb[0].tf.esp;

	//tss.ss0 = pcb[0].tf.ss;
	
	asm volatile("ltr %%ax":: "a" (KSEL(SEG_TSS)));


	//tss.gs = KSEL(SEG_VEDIO);
	/*uint16_t old_cs = 0,old_ss = 0;
	uint32_t old_eip = 0, old_esp = 0;
	uint16_t target_cs = IDT[]*/

	/*设置正确的段寄存器*/

	asm volatile("mov %0,%%eax;" ::"r"((uint32_t)KSEL(SEG_KDATA)));
	asm volatile("movw %ax,%ds;");

	//cs needn`t set
	//asm volatile("mov %0,%%eax;" ::"i"(KSEL(SEG_KCODE)));
	asm volatile("movw %ax,%fs;");

	//asm volatile("mov %0,%%eax;" ::"i"(KSEL(SEG_KDATA)));
	asm volatile("movw %ax,%es;");
	asm volatile("movw %ax,%ss;");

	asm volatile("mov %0,%%eax;" ::"r"(KSEL(SEG_VIDEO)));
	asm volatile("movw %ax,%gs;");
	/**/
	lLdt(0);
}
#define SELECTOR(ss) (ss>>3)
void enterUserSpace_pcb(int32_t pid){
	ProcessTable *pcbsrc = &GET_PCB(pid);

	asm volatile("pushl %0" ::"r"(pcbsrc->tf.ss));
	asm volatile("pushl %0" ::"r"(pcbsrc->tf.esp));		  // %esp 128MB
	asm volatile("pushfl");							  //push eflags
	asm volatile("pushl %0;" ::"r"(pcbsrc->tf.cs)); //push user cs
	asm volatile("pushl %0;" ::"r"(pcbsrc->tf.eip));			  //push eip
	asm volatile("iret");
}
void enterUserSpace(uint32_t entry)
{
#ifdef DEBUG
	loaded = 1;
#endif
	GET_PCB(1).tf.ss = USEL(SEG_UDATA);
	GET_PCB(1).tf.cs = USEL(SEG_UCODE);
	GET_PCB(1).tf.ds = USEL(SEG_UDATA);
	GET_PCB(1).tf.es = USEL(SEG_UDATA);
	GET_PCB(1).tf.fs = USEL(SEG_UDATA);


	GET_PCB(1).tf.esp = APP_STACK_START;
	GET_PCB(1).tf.eip = entry;
	GET_PCB(1).timeCount = 10;

	
	put_into_runnable(1,NULL);
	asm volatile("movl %0,%%esp" ::"i"(12 << 10));
	enterUserSpace_pcb(0);
	//GET_PCB(1).state = RUNNING;
	//enterUserSpace_pcb(1);
	/*asm volatile("pushl %0":: "r"(USEL(SEG_UDATA)));	// %ss
	asm volatile("pushl %0":: "r"(128 << 20));			// %esp 128MB
	asm volatile("pushfl");    //push eflags
	asm volatile("pushl %0;" ::"r"(USEL(SEG_UCODE)));   //push user cs
	asm volatile("pushl %0;" ::"r"(entry));    //push eip
	asm volatile("iret");*/
}

void loadUMain(void) {

	/*加载用户程序至内存*/
	//void(*user)(void);
	unsigned char* buffer = (unsigned char*)0x30000;
	for(int i = 1;i <= 200;i++){
		readSect((void*)buffer + 512 * (i - 1),i + 200);
	}
	struct ELFHeader* elf = (void*)buffer;	
	//user = (void*)elf->entry;

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
	//user = (void*)elf->entry;
	//user();
	enterUserSpace(elf->entry);
}
