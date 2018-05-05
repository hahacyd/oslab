#include "lib.h"
#include "types.h"
/*
 * io lib here
 * 库函数写在这
 */
#define MAX_BUFFER_SIZE 2048
int i2A(int a, char **result);
int i2X(uint32_t n, char **result);
static int append(char *p, const char *str);
int memcpy(char *dst, char *src, int len);
int length_str(char *str);
int32_t syscall(int num, uint32_t a1, uint32_t a2,
				uint32_t a3, uint32_t a4, uint32_t a5)
{
	int32_t ret = 0;
	//int t = 0;
	/* 内嵌汇编 保存 num, a1, a2, a3, a4, a5 至通用寄存器*/
	// interrupt number
	asm volatile("movl %0,%%eax" ::"m"(num));
	
	// file descriptor
	asm volatile("movl %0,%%ebx" ::"m"(a1));

	//the first address of str
	asm volatile("movl %0,%%ecx" ::"m"(a2));

	//the length of str
	asm volatile("movl %0,%%edx" ::"m"(a3));
	asm volatile("movl %0,%%edi" ::"m"(a4));
	asm volatile("movl %0,%%esi" ::"m"(a5)); /**/

	asm volatile("int $0x80");

	asm volatile("movl %%eax,%0" :"=m"(ret));

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
	word = 3,
	null = 88
} Types;
int fork(){
	int32_t res = syscall(__NR_fork, 1, (uint32_t)(char *)&"ni hao a", 13, 0, 0);
	return res;
}
int sleep(int32_t time){
	syscall(__NR_clock_nanosleep, time, 0, 0, 0, 0);
	return 0;
}
int exit(){
	syscall(__NR_exit, 0, 0, 0, 0, 0);
	return 0;
}

void fs_write(int fd, const char *address, int length)
{
	syscall(__NR_write, fd, (uint32_t)address, length, 0, 0);
}
void putchar_user(char ch)
{
	syscall(4, 1, (int)&ch, 1, 0, 0);
}
/*static void sys_write(struct TrapFrame *tf){

	tf->eax = fs_write(tf->ebx,tf->ecx,tf->edx);
}*/
void printd(int a){
	char buf[31];
	int count = 0;
	char *p = buf + sizeof(buf) - 1;
	uint8_t flag = 0, flag_8 = 0;
	if (a < 0)
	{
		if (0x80000000 == a)
		{
			a++;
			flag_8 = 1;
		}
		flag = 1; //if a < 0;flag = 1;
		a = -a;
	}
	do
	{
		*--p = '0' + a % 10;
		count++;
	} while (a /= 10);
	if (1 == flag)
	{
		*--p = '-';
		count++;
	}
	if (1 == flag_8)
	{
		buf[29] += 1;
	} /**/
	buf[30] = '\0';
	fs_write(1, p - 0x10000, count);
}
void printx(int n){

	char buf[31];
	char *p = buf + sizeof(buf) - 1;
	int count = 0;
	int i = 0;
	/*if (0x80000000 == n)
	{
		for (int i = 0; i < 8; i++)
		{
			*(--p) = 'f';
		}
		*(--p) = 'x';
		*(--p) = '0';
		*(--p) = '-';
		p = p - 9;
		memcpy(p, "80000000", 8);
		count = 8;
		buf[30] = '\0';
		*result = p;
		return count;
	}*/
	//uint8_t flag = 0;
	/*if (n < 0)
	{
		flag = 1;
		n = -n;
	}*/
	do
	{
		count++;
		i = n % 16;
		switch (i)
		{
		case 10:
			*(--p) = 'a';
			break;
		case 11:
			*(--p) = 'b';
			break;
		case 12:
			*(--p) = 'c';
			break;
		case 13:
			*(--p) = 'd';
			break;
		case 14:
			*(--p) = 'e';
			break;
		case 15:
			*(--p) = 'f';
			break;
		default:
			*(--p) = '0' + i;
		}
	} while (n /= 16);
	buf[30] = '\0';
	fs_write(1, p - 0x10000, count);
}
int i2A(int a, char **result)
{
	char buf[31];
	int count = 0;
	char *p = buf + sizeof(buf) - 1;
	uint8_t flag = 0, flag_8 = 0;
	if (a < 0)
	{
		if (0x80000000 == a)
		{
			a++;
			flag_8 = 1;
		}
		flag = 1; //if a < 0;flag = 1;
		a = -a;
	}
	do
	{
		*--p = '0' + a % 10;
		count++;
	} while (a /= 10);
	if (1 == flag)
	{
		*--p = '-';
		count++;
	}
	if (1 == flag_8)
	{
		buf[29] += 1;
	} /**/
	buf[30] = '\0';
	*result = p;
	return count;
}
static int append(char *p, const char *str)
{
	int count = 0;
	while (*str)
	{
		count++;
		*(p++) = *str++;
	}
	return count;
}
int i2X(uint32_t n, char **result)
{
	static char buf[31];
	char *p = buf + sizeof(buf) - 1;
	int count = 0;
	int i = 0;
	/*if (0x80000000 == n)
	{
		for (int i = 0; i < 8; i++)
		{
			*(--p) = 'f';
		}
		*(--p) = 'x';
		*(--p) = '0';
		*(--p) = '-';
		p = p - 9;
		memcpy(p, "80000000", 8);
		count = 8;
		buf[30] = '\0';
		*result = p;
		return count;
	}*/
	//uint8_t flag = 0;
	/*if (n < 0)
	{
		flag = 1;
		n = -n;
	}*/
	do
	{
		count++;
		i = n % 16;
		switch (i)
		{
		case 10:
			*(--p) = 'a';
			break;
		case 11:
			*(--p) = 'b';
			break;
		case 12:
			*(--p) = 'c';
			break;
		case 13:
			*(--p) = 'd';
			break;
		case 14:
			*(--p) = 'e';
			break;
		case 15:
			*(--p) = 'f';
			break;
		default:
			*(--p) = '0' + i;
		}
	} while (n /= 16);
	/**(--p) = 'x';
	*(--p) = '0';
	count += 2;*/
	/*if(1 == flag){
		*(--p) = '-';
		count++;
	}*/
	buf[30] = '\0';
	*result = p;
	return count;
}
int memcpy(char* dst,char* src,int len){
	int i = 0;
	for (; i < len && *src; i++)
	{
		*(dst++) = *(src++);

	}
	*(dst) = '\0';
	return len - i;
}
void printc(char* c){
	fs_write(1, c - 0x10000, 1);
}
void prints(char* s){
	int len = 0;
	while (s[len] != '\0'){
		len++;
	}
	fs_write(1, s - 0x10000, len);
}
int length_str(char* str){
	int count = 0;
	while(*(str++)){
		count++;
	}
	return count;
}
void printf(const char *format, ...)
{
	char sys_buffer[MAX_BUFFER_SIZE] = "print wrong answer!!!,\n";

	int buf_ptr = 0;
	uint32_t *ap = (uint32_t *)(void *)&format + 1;
	//fs_write(1,i2A(3431),10);
	char *c = (void *)format;
	Types state = null;

	for (; *c != '\0'; c++)
	{
		if ('%' == *c)
		{
			switch (*(++c))
			{
			case 'd':
				state = oct;
				break;
			case 'x':
				state = dec;
				break;
			case 's':
				state = str;
				break;
			case 'c':
				state = word;
				break;
			default:
				state = null;
				break;
			}
		}
		else
		{
			state = null;
		}
		if (null == state)
		{
			sys_buffer[buf_ptr++] = *c;

			//printc(c);
		}
		else if (oct == state)
		{
			//int len = 0;
			//char *t = (void *)0;
			//i2A((int)*ap++, &t);
			//buf_ptr += append(sys_buffer + buf_ptr, t);
			printd(*ap++);
			//prints(t);
		}
		else if (dec == state)
		{
			char *t = (void *)0;
			i2X((int)*ap++, &t);
			buf_ptr += append(sys_buffer + buf_ptr, t);

			//prints(t);
		}
		else if (str == state)
		{
			//prints((char*)*ap++);
			//buf_ptr += append(sys_buffer + buf_ptr, (char *)(*ap++));
			//uint8_t *src = (uint8_t*)*ap++,
			//		*dst = (uint8_t*)sys_buffer + buf_ptr;

			/*while(*src != '\0'){
				*dst++ = *src;
				buf_ptr += 1;
			}*/
			//prints((char *)(*ap++));
		} /**/
		else if(word == state){

			//buf_ptr += append(sys_buffer + buf_ptr, (char *)(*ap++));
			sys_buffer[buf_ptr++] = *ap++;

			//printc(*ap++);
		}
	}
	sys_buffer[buf_ptr++] = '\0';
	//fs_write(1, sys_buffer, buf_ptr);
}