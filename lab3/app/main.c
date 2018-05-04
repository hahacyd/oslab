#include "lib.h"
#include "types.h"

int data = 0;
int uEntry(void)
{
	/*printf("cyd\n");
	sleep(58);
	printf("haha\n");
	exit();*/
	int ret = fork();

	if(0 == ret){
		printf("i am child\n");
	}
	else{
		//sleep(128);
		printf("i am parent\n");
	}
	printf("ret = %d\n",ret);

	exit();/**/
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
