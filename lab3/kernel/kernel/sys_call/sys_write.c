#include "x86.h"
#include "device.h"
static int system_row = 0,
    system_col = 0;
int printkernel(char *buf, int len)
{
    for (; *buf != '\0'; buf++)
    {
        putChar(*buf);
        display(*buf);
    }
    return 1;
}
int display(char x)
{
    //asm volatile("int $0x20");
    if (x == '\n')
    {
        system_col = 0;
        system_row += 1;
    }
    else
    {
        print_char(system_row, system_col, x);
        system_col += 1;
    }
    if (COL_SIZE == system_col)
    {
        system_col = 0;
        system_row += 1;
    }
    return 1;
}
int fs_write(int fd, char *buf, int len)
{
    asm volatile("movl %0, %%eax" ::"r"(KSEL(SEG_VIDEO))
                 : "eax");
    asm volatile("movw %ax, %gs");
    assert(fd == 1);
    printkernel(buf, len);
    //putChar(*buf);
    //printkernel(buf, len);
    //putChar('c');
    //putChar('y');
    //if (1 == fd)
    //{
    /*for(int i = 0;i < len;i++){
			putChar(buf[i]);
		}*/
    //}
    return len;
}
void sys_write(TrapFrame2 *tf)
{
    tf->eax = fs_write(tf->ebx, (void *)tf->ecx, tf->edx);
}
void print_char(int row, int col, char c)
{
    asm("movl %0, %%edi;" ::"r"(((80 * row + col) * 2))
        : "%edi");
    asm("movw %0, %%eax;" ::"r"(0x0c00 + c)
        : "%eax");
    asm("movw %%ax, %%gs:(%%edi);" ::
            : "%edi");
}