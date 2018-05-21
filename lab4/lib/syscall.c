#include "lib.h"
#include "types.h"
//#include <stdarg.h>
/*
 * io lib here
 * 库函数写在这
 */
int length_str(char *str);
int32_t syscall(uint32_t eax , uint32_t ebx, uint32_t ecx,
				uint32_t edx)
{
	int32_t ret = 0;
	asm volatile("int $0x80":"=r"(ret):"a"(eax),"b"(ebx),"c"(ecx),"d"(edx));

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
int getpid(){
	return syscall(__NR_getpid, 1, 1, 1);
}
int exit()
{
	syscall(__NR_exit, 0, 0, 0);
	return 0;
}
int sem_init(sem_t *sem, uint32_t value){
	//printf("sem_init:sem = %d\n", *sem);

	int x = syscall(__NR_sem_init,(uint32_t)sem, value, 1);
	//printf("sem_init:sem = %d\n", *sem);
	return x;
}
int sem_post(sem_t *sem){
	
	return syscall(__NR_sem_post, (uint32_t)sem, 1, 1);
	//return 1;
}

int sem_wait(sem_t *sem){
	return syscall(__NR_sem_wait, 1, 1, 1);
	//return 1;
}
int sem_destroy(sem_t *sem){
	return syscall(__NR_sem_destroy, (uint32_t)sem, 1, 1);
	//return 1;
}
void printd(int a)
{
	char buf[101];
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
	buf[100] = '\0';
	prints(p);
}
void printx(int n)
{

	char buf[31];
	char *p = buf + sizeof(buf) - 1;
	int i = 0;
	do
	{
		i = n % 16;
		if(i >= 10)
			*(--p) = 'a' + i - 10;
		else
			*(--p) = '0' + i;
	} while (n /= 16);
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

	//ap += ((getpid() * PROC_MEMSZ) >> 2); //gdt表中的基地址偏移，给子函数传递正确的参数；

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
				printc((char )*ap++);
				break;
			default:
				break;
			}
		}
		else 
			printc(*c);
	}
}
