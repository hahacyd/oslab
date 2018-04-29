#include "lib.h"
#include "types.h"

int data = 0;
int uEntry(void)
{
	//syscall(4,1,1,2,0,0);
	int ret = fork();
	//if(ret);
	printf("ret = %d\n",ret);
	//syscall(__NR_write, 1, (int)(char*)&"ni hao a?", 12, 0, 0);
	//printf("Child Process: Pong %d,%d;\n", data, 1);
	//int ret = fork();
	//if(ret);
		//LOG("cyd");

	/*int ret = fork();
	int i = 8;
	if(0 == ret){
		data = 2;
		while (i != 0)
		{
			i--;
			printf("Child Process: Pong %d,%d;\n", data, i);
			sleep(128);
		}
		exit();
	}
	else if(-1 != ret){
		data = 1;
		while(i != 0){
			i--;
			printf("Father Process: Ping %d,%d;\n", data, i);
			sleep(128);
		}
		exit();
	}*/
	while(1);
	return 0;
}
