#include "lib.h"
#include "types.h"
/*
 * io lib here
 * 库函数写在这
 */
#define MAX_BUFFER_SIZE 2048
char sys_buffer[MAX_BUFFER_SIZE];
int i2A(int a, char **result);
static int append(char *p, const char *str);
int32_t syscall(int num, uint32_t a1,uint32_t a2,
		uint32_t a3, uint32_t a4, uint32_t a5)
{
	int32_t ret = 0;
	int t = 0;
	/* 内嵌汇编 保存 num, a1, a2, a3, a4, a5 至通用寄存器*/
	// interrupt number
	asm volatile("movl %1,%%eax"
				 : "=r"(t)
				 : "m"(num));    
	// file descriptor
	asm volatile("movl %1,%%ebx"
				 : "=r"(t)              
				 : "m"(a1));   
	//the first address of str
	asm volatile("movl %1,%%ecx"
				 : "=r"(t)        
				 : "m"(a2));  
	//the length of str   
	asm volatile("movl %1,%%edx"
				 : "=r"(t)              
				 : "m"(a3));     
	asm volatile("movl %1,%%edi"
				 : "=r"(t)     
				 : "m"(a4));     
	asm volatile("movl %1,%%esi"
				 : "=r"(t)        
				 : "m"(a5)); /**/  
	asm volatile("int $0x80");  
	return ret;
}

/*static int count = 0;
static void video_print(int row, int col, char c) {
	row = count++;
	count++;
	asm ("movl %0, %%edi;"			: :"r"(((80 * row + col) * 2))  :"%edi");
	asm ("movw %0, %%eax;"			: :"r"(0x0c00|c) 				:"%eax");
	asm ("movw %%ax, %%gs:(%%edi);" : : 							:"%edi");
	while(1);
}
*/
void putchar_user(char ch);
typedef enum {
	str = 0,
	dec = 1,
	oct = 2,
	null=88
} Types;
void printf(const char *format, ...)
{
	int buf_ptr = 0;
	uint32_t *ap = (uint32_t*)(void *)&format + 1;
	//fs_write(1,i2A(3431),10);
	char *c = (void*)format;
	Types state = null;
	
	for (;*c != '\0';c++)
	{
		if('%' == *c){
			switch(*(++c)){
				case 'd':
					state = oct;
					break;
				case 'x':
					state = dec;
					break;
				case 's':
					state = str;
					break;
				default:
					state = null;
					break;
					}
		}
		else{
			state = null;
		}
		if (null == state)
		{
			sys_buffer[buf_ptr++] = *c;
		}
		else if(oct == state){
			//int len = 0;
			char *t = (void*)0;
			i2A((int)*ap++, &t);
			buf_ptr += append(sys_buffer + buf_ptr, t);
		}
		else if(dec == state){
			char *t = (void*)0;
			i2A((int)*ap++, &t);
			buf_ptr += append(sys_buffer + buf_ptr, t);
		}
		else if(str==state){
			buf_ptr += append(sys_buffer + buf_ptr, (char *)(*ap++));
		} /**/
	}
	sys_buffer[buf_ptr++] = '\0';
	fs_write(1,sys_buffer,buf_ptr);
}
void fs_write(int fd,const char* address,int length){
	syscall(4,fd,(int)address,length,0,0);
}
void putchar_user(char ch){
	syscall(4, 1, (int)&ch, 1, 0, 0);
}
/*static void sys_write(struct TrapFrame *tf){

	tf->eax = fs_write(tf->ebx,tf->ecx,tf->edx);
}*/
int i2A(int a,char** result) {
	static char buf[31];
	int count = 0;
	char *p = buf + sizeof(buf) - 1;
	uint8_t flag = 0,flag_8 = 0;
	if (a < 0)
	{
		if(0x80000000 == a){
			a++;
			flag_8 = 1;
		}
		flag = 1; //if a < 0;flag = 1;
		a = -a;
	}
	do {
		*--p = '0' + a % 10;
		count++;
	} while (a /= 10);
	if(1 == flag){
		*--p = '-';
		count++;
	}
	if(1 == flag_8){
		buf[29] += 1;
	}/**/
	buf[30] = '\0';
	*result = p;
	return count;
}
static int append(char *p, const char *str) {
	int count = 0;
	while (*str)
	{
		count++;
		*(p++) = *str++;
	}
	return count;
}