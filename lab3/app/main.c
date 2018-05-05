#include "lib.h"
#include "types.h"

int data = 0;
int uEntry(void)
{
	//char x[100] = "xinyun";
	//printf("who are you?\n");
	//char x[100] = "nihaoma ?wohenhao!\n";
	//syscall(__NR_write, 1, (uint32_t)x, 45, 0, 0);
	//printd(2333333);
	//prints("haha");
	//printx(432412);
	//printf("fjdksafjas");
	//int a = 12;
	//prints("fjdkslaf");
	//printx(43242);
	printd(getpid());
	//printf("%d", 12);
	//printf("M%d", 78);
	//printf("i am from xinjiang %s",x);
	exit();
	//syscall(__NR_write, 1, (uint32_t) "welcome to my zone!\n", 22, 0, 0);
	//syscall(__NR_write, 1, (uint32_t)"you youyou\n", 22, 0, 0);

	/*printf("cyd\n");
	sleep(58);
	printf("haha\n");
	exit();*/
	int ret = fork();
	if(0 == ret){
		//syscall(__NR_write, 1, (uint32_t) "yep ,you are child!\n", 22, 0, 0);
		printf("i am child\n");
	}
	else{
		sleep(37);
		//syscall(__NR_write, 1, (uint32_t) "yep ,you are father!\n", 22, 0, 0);
		printf("i am parent\n");
	}
	printf("ret = %d\n",ret);/**/
	exit();
	/*
	*/
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
	while(1){
		printf("i am curious!\n");
	}
		return 0;
}
