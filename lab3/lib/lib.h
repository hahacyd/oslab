#ifndef __lib_h__
#define __lib_h__

void printf(const char *format,...);
void fs_write(int fd,const char* address,int length);
int fork();
int sleep();
int exit();
#endif
