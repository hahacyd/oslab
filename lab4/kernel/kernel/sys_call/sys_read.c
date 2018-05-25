#include "x86.h"
#include "device.h"
//每个按键的释放 是扫描码 + 0x80;

char scancode[256] = {
    /* 0x0 ~ 0xf */
    "\n\n123456"
    "7890-=\b\t"
    /* 0x10 ~ 0x1f */
    "qwertyui"
    "op[]\n\nas"
    /* 0x20 ~ 0x2f */
    "dfghjkl;"
    "'`\n\\zxcv"
    /* 0x30 ~ 0x3f */
    "bnm,./\0*"
    "        "
    /* 0x40 ~ 0x4f */
    "        "
    //"++++++++"
}; //'7', '8', '9', '0', '-', '=', 0xe, 0xf};
unsigned char getScancode()
{
    while (!(inByte(0x64) & 1))
        ;
    return inByte(0x60);
}
int capsLock = 0;
int shiftPress = 0;
char shiftFunct[22] = "~!@#$%^&*()_+";
uint32_t sys_read(TrapFrame *tf)
{
    uint32_t x = 0;
    char c;
    char *userBuffer = (void *)CHANGE_2_USER_ADDR(tf->ecx);
    int length = tf->edx;
    int stepCounter = 0;

    while(stepCounter < length && c != '\n')
    {
        x = getScancode();
        if(0x3a == x){  //检查caps Lock
            capsLock = (capsLock == 1)?0:1;
            continue;
        }
        if (0x2a == x || 0x36 == x)
        {
            shiftPress = 1;
            continue;
        }
        else if(0xaa == x || 0xb6 == x){
            shiftPress = 0;
            continue;
        }
        if (x >= 0x80)
        {
            continue;
        }

        c = scancode[x];
        //char t;
        if (1 == shiftPress)
        {
            if(x >= 0 && x <= 0xd){
                c = shiftFunct[x - 1];
            }
            else if(c >= 97 && c <= 122 && 0 == capsLock){
                c -= 32;
            }
            else if(c >= 44 && c <= 47){
                c += 16;
            }
            else{
                char t;
                switch (x)
                {
                case 0x27:
                    t = ':';
                    break;
                case 0x28:
                    t = '"';
                    break;
                case 0x29:
                    t = '~';
                    break;
                default:
                    LOG("%d\n", x);
                    assert(0);
                    }
                    c = t;
            }
            //shiftPress = 0;
        }
        if(1 == capsLock  && c >= 97 && c <= 122){
            if(0 == shiftPress){
                c -= 32;
            }
        }
        LOG("%c", c);
        userBuffer[stepCounter] = c;
        stepCounter += 1;

        printkernel(&c, 1);
    }
    userBuffer[stepCounter - 1] = '\0';

    return CHANGE_2_USER_ADDR(tf->ecx);
}
