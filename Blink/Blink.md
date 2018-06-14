## 新建工程
打开Quartus -> File -> New Project Wizard -> Next:

![1](/Blink/Assets/1.png)  

Next -> Empty project, Next -> Next:  

![2](/Blink/Assets/2.png)  

Next:  

![3](/Blink/Assets/3.png)  

Next -> Finish.  

## 点亮一颗LED  
打开开发板原理图, 找到LED对应的引脚:  


LED | FPGA引脚
---------|----------
 LED0 | E10 
 LED1 | F9 
 LED2 | C9 
 LED3 | D9

 1点亮, 0熄灭.  

 File -> New... -> Design Files, Verilog HDL File, OK, 输入以下代码: 

 ```Verilog
module blink(led);

output led;

assign led = 1'b1;

endmodule
 ``` 

 保存为blink.v. 电机 开始编译 按钮(Ctrl+L)编译, 编译完后, 打开Assignments(分配) -> Pin Planner(或者Ctrl+Shift+N, 或者点Pin Planner按钮), 双击E10引脚, Node name填入led, 回车, I/O Standard选择3.3-V LVTTL.   

![4](/Blink/Assets/4.png)

点击Programmer按钮, Start按钮, 把程序放到FPGA中: 

![5](/Blink/Assets/5.png)

可以看到LED点亮, 试着修改 assign led = 1'b0; 编译, 下载, 发现灯灭了.  

## 加入延时
牵涉到时间, 时钟就少不了了. 