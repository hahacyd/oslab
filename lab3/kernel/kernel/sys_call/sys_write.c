#include "x86.h"
#include "device.h"
static int system_row = 0,
    system_col = 0;
int printkernel(char *buf, int len)
{
    int i = 0;
    for (;i < len && *buf != '\0'; i++,buf++)
    {
        //putChar(*buf);
        display(*buf);
    }
    return 1;
}
int display(char x)
{
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
    assert(fd == 1 || fd == 2);

    printkernel(buf, len);
    return len;
}
void sys_write(TrapFrame *tf)
{
    tf->eax = fs_write(tf->ebx, (void *)tf->ecx  + getpid() * PROC_MEMSZ, tf->edx);  // + getpid() * PROC_MEMSZ
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