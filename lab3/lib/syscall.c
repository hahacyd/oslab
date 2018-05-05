#include "lib.h"
#include "types.h"
#include <stdarg.h>
/*
 * io lib here
 * 库函数写在这
 */
#define MAX_BUFFER_SIZE 2048
int i2A(int a, char **result);
int i2X(uint32_t n, char **result);
//static int append(char *p, const char *str);
int memcpy(char *dst, char *src, int len);
int length_str(char *str);
int32_t syscall(uint32_t eax , uint32_t ebx, uint32_t ecx,
				uint32_t edx)
{
	int32_t ret = 0;
	asm volatile("int $0x80":"=r"(ret):"a"(eax),"b"(ebx),"c"(ecx),"d"(edx));

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
int fork()
{
	int32_t res = syscall(__NR_fork, 1, (uint32_t)(char *)&"ni hao a", 13);
	return res;
}
int sleep(int32_t time)
{
	syscall(__NR_clock_nanosleep, time, 0, 0);
	return 0;
}
int exit()
{
	syscall(__NR_exit, 0, 0, 0);
	return 0;
}

void fs_write(int fd, const char *address, int length)
{
	syscall(__NR_write, fd, (uint32_t)address, length);
}
void putchar_user(char ch)
{
	syscall(4, 1, (int)&ch, 1);
}
/*static void sys_write(struct TrapFrame *tf){

	tf->eax = fs_write(tf->ebx,tf->ecx,tf->edx);
}*/
void printd(int a)
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
	prints(p);
	//fs_write(1, p - 0x10000, count);// - 0x10000
}
void printx(int n)
{

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
	prints(p);
	//fs_write(1, p - 0x10000, count);
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
/*static int append(char *p, const char *str)
{
	int count = 0;
	while (*str)
	{
		count++;
		*(p++) = *str++;
	}
	return count;
}*/
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
int memcpy(char *dst, char *src, int len)
{
	int i = 0;
	for (; i < len && *src; i++)
	{
		*(dst++) = *(src++);
	}
	*(dst) = '\0';
	return len - i;
}
void printc(char c)
{
	fs_write(1, &c, 1);
}
void prints(char *s)
{
	int len = 0;
	while (s[len] != '\0')
	{
		len++;
	}
	//syscall()
	//fs_write(1, s - 0x10000, len);
	
}
int length_str(char *str)
{
	int count = 0;
	while (*(str++))
	{
		count++;
	}
	return count;
}
/*void printf(const char *str, ...) {
    char token;
    va_list ap;
    va_start(ap, str);
    if (str == 0)
        return;
    while(*str != '\0') {
    	if(*str == '%') {
    	    token = *++str;
    	    switch (token) {
                case 'd': printd(va_arg(ap, int));   break;
                case 's': prints(va_arg(ap, char*)); break;
                case 'c': printc(va_arg(ap, int));   break;
                case 'x': printx(va_arg(ap, int));   break;
    	    }
    	}
    	else {
            printc(*str);
        }
    	str++;
    }
    va_end(ap);
}*/

void printf(const char *format, ...)
{
	uint32_t *ap = (uint32_t *)(void *)&format + 1;
	char *c = (void *)format;
	int32_t d = 0;
	if(d)
		;
	for (; *c != '\0'; c++)
	{
		if ('%' == *c)
		{
			switch (*(++c))
			{
			case 'd':
				d = *(ap++);
				printd(d);
				break;
			case 'x':
				printx(*ap++);
				break;
			case 's':
				prints((char *)(*ap++));
				break;
			case 'c':
				printc((char )*ap++);
				break;
			default:
				break;
			}
		}
		else
		{
			printc(*c);
		}
	}
}
