#include "x86.h"
#include "device.h"
static int system_row = 0,    //目前显存的位置；
           system_col = 0,
           pageuprow = 20;   //当行数大于 pageuprow 时将会 向上滚动一行，
int printkernel(char *buf, int len)
{
    int i = 0;
    for (; i < len && *buf != '\0'; i++, buf++)
    {
        //putChar(*buf);
        char x = *buf;
        if (x == '\n')
        {
            for (int i = system_col; i <= COL_SIZE; i++)
            {
                print_char(system_row, i, ' ');
            }

            system_col = 0;
            system_row += 1;
            update_cursor(system_row, system_col);
        }
        else
        {
            print_char(system_row, system_col, x);
            system_col += 1;
            update_cursor(system_row, system_col);

        }
        if (COL_SIZE == system_col)
        {
            system_col = 0;
            system_row += 1;
        }
        if (system_row > pageuprow)
        {
            scrollScreen(system_row);
            update_cursor(system_row, system_col);

            //assert(0);
        }
    }
    return 1;
}
void update_cursor(int r, int c)
{
    uint16_t pos = r * 80 + c;
    outByte(0x3d4, 0x0f);
    outByte(0x3d5, 0xff & pos);
    outByte(0x3d4, 0x0e);
    outByte(0x3d5, pos >> 8);
}
void scrollScreen()
{
    assert(system_row >= 1);

    int row = 1; //, col = 0;
    unsigned char c;
    for (; row <= system_row; row++)
    {
        for (int i = 0; i <= COL_SIZE; i++)
        {
            //处理最后一行时只复制到光标的纵坐标，
            if(row == system_row && i >= system_col){
                break;
            }
            //读取显存内容
            asm volatile("movl %0, %%edi;" ::"r"(((80 * row + i) * 2))
                         : "%edi");
            asm volatile("mov %%gs:(%%edi),%0;"
                         : "=r"(c)::"%edi");
            //向上一行显存写入内容
            c -= 0x0c00;
            asm volatile("movl %0, %%edi;" ::"r"(((80 * (row - 1) + i) * 2))
                         : "%edi");
            asm volatile("movw %0, %%eax;" ::"r"(c + 0x0c00)
                         : "%eax");
            asm volatile("movw %%ax, %%gs:(%%edi);" ::
                             : "%edi");

            //assert(0);
        }
    }
    system_row -= 1;
}
void sys_write(TrapFrame *tf)
{
    asm volatile("movl %0, %%eax" ::"r"(KSEL(SEG_VIDEO))
                 : "eax");
    asm volatile("movw %ax, %gs");
    assert(tf->ebx == 1 || tf->ebx == 2);

    printkernel((void *)tf->ecx + getpid() * PROC_MEMSZ, tf->edx);
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