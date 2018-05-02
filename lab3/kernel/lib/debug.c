#include "common.h"
#include "x86.h"
#include "device.h"


typedef enum {
	str = 0,
	dec = 1,
	oct = 2,
	word = 3,
	null = 88
} Types;
static char sys_buffer_debug[2048];
int i2A(int a, char **result)
{
	static char buf[31];
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
static int printk_char(char* buf,uint32_t len){
    for (; *buf != '\0'; buf++)
    {
        putChar(*buf);
        //display(*buf);
    }
    return 1;
}
void printk(const char *format, ...)
{
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
            sys_buffer_debug[buf_ptr++] = *c;
        }
        else if (oct == state)
        {
            //int len = 0;
            char *t = (void *)0;
            i2A((int)*ap++, &t);
            buf_ptr += append(sys_buffer_debug + buf_ptr, t);
        }
        else if (dec == state)
        {
            char *t = (void *)0;
            i2X((int)*ap++, &t);
            buf_ptr += append(sys_buffer_debug + buf_ptr, t);
        }
        else if (str == state)
        {
            buf_ptr += append(sys_buffer_debug + buf_ptr, (char *)(*ap++));
        } 
        else if (word == state)
        {
            //buf_ptr += append(sys_buffer + buf_ptr, (char *)(*ap++));
            sys_buffer_debug[buf_ptr++] = *ap++;
        }
    }
    sys_buffer_debug[buf_ptr++] = '\0';
    printk_char(sys_buffer_debug,1024);
}
/*
#define LOG(str) 
    printk(#__FILE__); \
    printk(" "); \
    printk(#__LINE__);\
    printk(#str);
*/
