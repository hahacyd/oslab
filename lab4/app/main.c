#include "lib.h"
#include "types.h"

int uEntry(void) {
    //while(1){
    char buffer[2048];
    //int x = 0;
    while(-1 != scanf(" %s ", buffer)){
        //printd(x);
        printf("%c\n", buffer[0]);
    }
    printf("failed\n");
    //printd(x);
    //gets(buffer);
    //scanf
    //printf("%x\n", -0x1fab);
    //printf("result = %x\n", scanfx(buffer));
    //printf("%s\n", buffer);
    exit();

    int i = 4;
    int ret = 0;
    int value = 2;

    sem_t sem = 88;  //充当信号量的地址
    printf("Father Process: Semaphore Initializing.\n");
    ret = sem_init(&sem, value);

    //printf("sem = %d\n", sem);
    if (ret == -1)
    {
        printf("Father Process: Semaphore Initializing Failed.\n");
        exit();
    }

    ret = fork();
    if (ret == 0) {    //child process
        while( i != 0) {
            i --;
            printf("Child Process: Semaphore Waiting.\n");
            sem_wait(&sem);
            printf("Child Process: In Critical Area.\n");
        }
        printf("Child Process: Semaphore Destroying.\n");
        sem_destroy(&sem);
        exit();
    }
    else if (ret != -1) {   //father process
        while( i != 0) {
            i --;
            printf("Father Process: Sleeping.\n");
            sleep(128);
            printf("Father Process: Semaphore Posting.\n");
            sem_post(&sem);
        }
        printf("Father Process: Semaphore Destroying.\n");
        sem_destroy(&sem);
        exit();
    }

    return 0;
}