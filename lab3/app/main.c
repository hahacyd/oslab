#include "lib.h"
#include "types.h"

int data = 0;
int uEntry(void)
{
	int ret = fork();
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
	}
	return 0;
}
