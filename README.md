oslab
=====
## 项目内容
这个项目由操作系统课程四个连续的实验组成，从lab1-lab4分别完成的功能如下：
1. 系统引导：在实模式或保护模式下加载一个”hello world”程序。  
2. 系统调用：基于系统中断实现输入输出函数 *scanf* 和 *printf* 。
3. 进程切换：基于时间片轮换完成进程切换。  
4. 进程同步：基于信号量实现生产者/消费者的同步。

## 运行方式
1. 运行代码所需的环境：*qemu*
2. 选择一个lab进入，然后用 ```make``` 构建，```make play``` 执行，以lab3所实现的进程切换为例：进入lab3文件夹后，执行上述两个命令，你会看到如下界面：  
![lab3](https://raw.githubusercontent.com/hahacyd/MarkdownPhotos/master/oslab/lab3.png?token=AFQ6KMFZU6MY24SJRQHT3GS6TPNQM "lab3实验截图")  

