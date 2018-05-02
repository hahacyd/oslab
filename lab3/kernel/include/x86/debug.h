#ifndef __DEBUG_H__
#define __DEBUG_H__

#define concat(x,y) x##y

void printk(const char *format, ...);

#define LOG(format,...) \
    printk("\033[34m");\
    printk("[%s,line:%d,%s]:\n"format, __FILE__,__LINE__,__FUNCTION__, ##__VA_ARGS__);\
    printk("\033[0m\n");

//#define DVR_PRT(format,...)  printk("[File:%s, Line:%d,function:%s] > \n"format, __FILE__,__LINE__,__FUNCTION__, ##__VA_ARGS__)


#endif
