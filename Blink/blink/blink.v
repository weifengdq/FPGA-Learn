/***************** Blink *******************/
/*
module blink(led);

output led;

assign led = 1'b0;

endmodule
*/


//`timescale 1ns/1ps
//
//module blink(clk, rst_n, led);
//
//input clk;
//input rst_n;
//output [3:0]led;
//
//reg led_0;
//reg [31:0]count;
//reg [3:0]led;
//
//always @(posedge clk or negedge rst_n) begin
//	if(~rst_n) begin
//		count <= 0;
//	end else if(count == 32'd49_999_999) begin
//		led <= 4'b0001;
//	end else if(count == 32'd99_999_999) begin
//		led <= 4'b0000;
//	end else if(count == 32'd149_999_999) begin 
//		count <= 0;
//	end else begin
//		count <= count + 1'b1;
//	end
//end
//
//endmodule

////////////////////////////////////////////////

`timescale 1ns/1ps

module blink(clk, rst_n, led);

input clk;
input rst_n;
output [3:0]led;

reg led_0;
reg [31:0]count;
reg [3:0]led;

always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		count <= 0;
	end else if(count == 32'd99_999_999) begin
		count <= 0;
	end else begin
		count <= count + 1'b1;
	end
end

always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		led <= 4'b0000;
	end else if(count == 32'd49_999_999) begin
		//led <= 4'b0001;
		led[0] <= 1'b1;
	end else if(count == 32'd99_999_999) begin
		//led <= 4'b0000;
		led[0] <= 1'b0;
	end
	
end
//assign led[0] = led_0;

endmodule
///////////////////////////////////////////////

/**************** delay ********************/
//`timescale 1ns/1ps
//
//module blink(clk, rst_n, led);
//
//input clk;
//input rst_n;
//output [3:0]led;
//
//reg led_0;
//reg [31:0]count;
//reg [3:0]led;
//
//always @(posedge clk or negedge rst_n) begin
//	if(~rst_n) begin
//		count <= 0;
//	end else if(count == 32'd99_999_999) begin
//		count <= 0;
//	end else begin
//		count <= count + 1'b1;
//	end
//end
//
//always @(posedge clk or negedge rst_n) begin
//	if(~rst_n) begin
//		led <= 4'b0000;
//	end else if(count == 32'd49_999_999) begin
//		led <= 4'b0001;
//	end else if(count == 32'd99_999_999) begin
//		led <= 4'b0000;
//	end
//	
//end
////assign led[0] = led_0;
//
//endmodule


//`timescale 1ns / 1ps
//
//module blink (
//                  clk,           // 开发板上输入时钟: 50Mhz
//                  rst_n,         // 开发板上输入复位按键
//                  led            // 输出LED灯,用于控制开发板上四个LED(LED0~LED3)
//             );
//             
////=====================================================
//// PORT declarations
////======================================================
//input clk;
//input rst_n;
//output [3:0] led;
//
////寄存器定义
//reg [31:0] timer;                  
//reg [3:0] led;
//
//
////========================================================
//// 计数器计数:循环计数0~4秒
////===================================================
//  always @(posedge clk or negedge rst_n)    //检测时钟的上升沿和复位的下降沿
//    begin
//      if (~rst_n)                           //复位信号低有效
//          timer <= 0;                       //计数器清零
//      else if (timer == 32'd199_999_999)    //开发板使用的晶振为50MHz，4秒计数(50M*4-1=199_999_999)
//          timer <= 0;                       //计数器计到4秒，计数器清零
//      else
//		    timer <= timer + 1'b1;            //计数器加1
//    end
//
////=====================================================
//// LED灯控制
////=====================================================
//  always @(posedge clk or negedge rst_n)   //检测时钟的上升沿和复位的下降沿
//    begin
//      if (~rst_n)                           //复位信号低有效
//          led <= 4'b0000;                  //LED灯输出全为低，四个LED灯灭           
//      else if (timer == 32'd49_999_999)      //计数器计到1秒，
//          led <= 4'b0001;                  //LED1点亮
//      else if (timer == 32'd99_999_999)      //计数器计到2秒，
//          led <= 4'b0010;                  //LED2点亮
//      else if (timer == 32'd149_999_999)     //计数器计到3秒，
//          led <= 4'b0100;                  //LED3点亮                           
//      else if (timer == 32'd199_999_999)     //计数器计到4秒，
//          led <= 4'b1000;                  //LED4点亮        
//    end
//    
//endmodule
