#include "lib.h"
#include "types.h"
//#include <stdarg.h>
/*
 * io lib here
 * 库函数写在这
 */
int length_str(char *str);
int32_t syscall(uint32_t eax, uint32_t ebx, uint32_t ecx,
				uint32_t edx)
{
	int32_t ret = 0;
	asm volatile("int $0x80"
				 : "=r"(ret)
				 : "a"(eax), "b"(ebx), "c"(ecx), "d"(edx));

	return ret;
}

int fork()
{
	int32_t res = syscall(__NR_fork, 1, 1, 1);
	return res;
}
int sleep(int32_t time)
{
	syscall(__NR_clock_nanosleep, time, 1, 1);
	return 0;
}
int getpid()
{
	return syscall(__NR_getpid, 1, 1, 1);
}
int exit()
{
	syscall(__NR_exit, 0, 0, 0);
	return 0;
}
int sem_init(sem_t *sem, uint32_t value)
{
	int x = syscall(__NR_sem_init, (uint32_t)sem, value, 1);
	return x;
}
int sem_post(sem_t *sem)
{
	return syscall(__NR_sem_post, (uint32_t)sem, 1, 1);
}

int sem_wait(sem_t *sem)
{
	return syscall(__NR_sem_wait, 1, 1, 1);
}
int sem_destroy(sem_t *sem)
{
	return syscall(__NR_sem_destroy, (uint32_t)sem, 1, 1);
}
void printd(int a)
{
	char buf[101];
	int count = 0;
	char *p = buf + sizeof(buf) - 1;
	uint8_t negetiveFlag = 0, flag_8 = 0;
	if (a < 0)
	{
		if (0x80000000 == a)
		{
			a++;
			flag_8 = 1;
		}
		negetiveFlag = 1; //if a < 0;flag = 1;
		a = -a;
	}
	do
	{
		*--p = '0' + a % 10;
		count++;
	} while (a /= 10);
	if (1 == negetiveFlag)
	{
		*--p = '-';
		count++;
	}
	if (1 == flag_8)
	{
		buf[29] += 1;
	}
	buf[100] = '\0';
	prints(p);
}
void printx(int n)
{
	int negetiveFlag = 0;
	if (n < 0)
	{
		negetiveFlag = 1;
		n = -n;
	}
	char buf[31];
	char *p = buf + sizeof(buf) - 1;
	int i = 0;
	do
	{
		i = n % 16;
		if (i >= 10)
			*(--p) = 'a' + i - 10;
		else
			*(--p) = '0' + i;
	} while (n /= 16);
	if (1 == negetiveFlag)
	{
		*(--p) = '-';
	}
	buf[30] = '\0';
	prints(p);
}

void printc(char c)
{
	syscall(__NR_write, 1, (uint32_t)&c, 1);
}
void prints(const char *s)
{
	int len = 0;
	while (s[len] != '\0')
	{
		len++;
	}
	//int t = getpid();
	syscall(__NR_write, 1, (uint32_t)s, len);
}

void printf(const char *format, ...)
{
	uint32_t *ap = (uint32_t *)(void *)&format + 1;
	char *c = (void *)format;
	int32_t d = 0;
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
				printc((char)*ap++);
				break;
			default:
				break;
			}
		}
		else
			printc(*c);
	}
}
int gets(char *buffer)
{
	return syscall(__NR_read, stdin, (uint32_t)buffer, 2048);
}
char getchar()
{
	char bufferTemp[5];
	syscall(__NR_read, stdin, (uint32_t)bufferTemp, 1);
	return bufferTemp[0];
}
int scanfd(char *buf, int *res)
{
	int result = 0;
	int negetiveFlag = 0;
	int stepCounter = 0;
	if ('-' == *buf)
	{
		negetiveFlag = 1;
		buf += 1;
		stepCounter++;
	}
	while (' ' != *buf && '\0' != *buf)
	{
		result *= 10;
		result += *buf - '0';
		buf += 1;
		stepCounter++;
	}
	*res = (1 == negetiveFlag) ? (0 - result) : result;
	return stepCounter;
}
int scanfx(char *buf, int *res)
{
	int result = 0;
	int negetiveFlag = 0;
	int stepCounter = 0;
	if ('-' == *buf)
	{
		negetiveFlag = 1;
		buf += 1;
		stepCounter++;
	}
	while (' ' != *buf && '\0' != *buf)
	{
		result *= 16;

		if (*buf <= 'f' && *buf >= 'a')
		{
			result += *buf - 'a' + 10;
		}
		else if (*buf <= '9' && *buf >= '0')
		{
			result += *buf - '0';
		}
		buf += 1;
		stepCounter++;
	}
	if (1 == negetiveFlag)
	{
		result = 0 - result;
	}
	*res = result;
	return stepCounter;
}
int scanfs(char *buf, char *dst)
{
	int count = 0;
	while (*buf != ' ' && *buf != '\0')
	{
		*(dst++) = *(buf++);
		count++;
	}
	return count;
}
int scanfc(char *buf,char *c)
{
	*c = *buf;
	return 1;
}
int scanf(const char *format, ...)
{
	char buffer[2048];
	gets(buffer); //获得了一个输入字符串；

	uint32_t *ap = (uint32_t *)(void *)&format + 1;

	char *c = (void *)format;
	int stepCounter = 0;

	//int32_t t = 0;
	int bufLen = 0;
	for (; c[stepCounter] != '\0'; stepCounter++)
	{
		if ('%' == c[stepCounter])
		{
			switch (c[++stepCounter])
			{
			case 'd':
				bufLen += scanfd(buffer + bufLen, (void*)(*(ap++)));
				break;
			case 'x':
				bufLen += scanfx(buffer + bufLen, (void*)(*(ap++)));
				break;
			case 's':
				bufLen += scanfs(buffer + bufLen, (void *)(*(ap++)));
				break;
			case 'c':
				bufLen += scanfc(buffer + bufLen, (void *)(*(ap++)));
				//printc((char)*ap++);
				break;
			default:
				break;
			}
		}
		else if(c[stepCounter] != buffer[bufLen]){
			return -1;
		}
		else{
			bufLen++;
		}
	}

	return 1;
}