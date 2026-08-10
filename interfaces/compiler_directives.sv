
`define DEBUG

module test;
  
  
  initial begin
  `ifdef DEBUG
  $display("yes printing from `ifdef");
  
  `else
  $display("yes printing from else");
    
   `endif
  end
  
endmodule


 ///////////////////////////////////////////////////////////////////////////////////     
      
 

module test1;
  
  
  initial begin
  `ifndef DEBUG
  $display("yes printing from `ifdef");
  
  `else
  $display("yes printing from else");
    
   `endif
  end
  
endmodule

/////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module test2;
  
  logic set;
  parameter p =8.58;
  
  initial  begin
    
    #p set =1;
    $display(" time = %0d,set =%d",$time,set);
    $display(" realtime = %0d,set =%d",$realtime,set);
    $display(" timeS = %0t,set =%d",$stime,set);
    
    #p set = 0;
    $display(" time = %0d,set =%d",$time,set);
    
  end
  
  
endmodule
    

/////////////////////////////////////////////////////////////////////////////////////////

`timescale 10ns/1ps
module test3;
  
  logic [5:0] flag;
  
  parameter p =18.6;
  
  initial begin
    
    flag = 20;
    #p $display(" from test3 time = %0t,f = %d",$realtime,flag);
    
    flag = 30;
    #p $display("from test3 time = %0t,f = %d",$realtime,flag);
  end
endmodule


///////////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ps
`define ADD(a,b,x) ((a)+(b)+(x))
module test4;
  
  int a = 30;
  int b= 40;
  int x= 30;
  int result;
  
  initial 
       begin
         
         result = `ADD(a,b,x);
         
         $display(" a= %d,b = %d,x= %d, result = %0d",a,b,x,result);
         
       end
  
endmodule

///////////////////////////////////////////////////////////////////////////////////////

`define SUB(x,y) ((x)-(y))
module test5;
  
  int x=  30;
  int y= 20;
  
  int sub;
  
  initial begin
 
    sub = `SUB(x,y);
    
    $display("x= %d,y= %d,sub = %d",x,y,sub);
    
    
  end
  
  
endmodule
  

///////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////one module acts as a MUX and decoder//////////////
`define MUX
//`define DECODER

module tb;

    logic       a;
    logic       b;
    logic [1:0] sel;
    logic [3:0] data;

    logic [3:0] y;
    logic       mux_out;

    // Instantiate DUT
    mux dut (
        .a(a),
        .b(b),
        .sel(sel),
        .data(data),
        .y(y),
        .mux_out(mux_out)
    );

`ifdef DECODER

    initial begin

        $display("--------------------");
        $display("    DECODER TEST");
        $display("--------------------");
        $display("sel       y");

        sel = 2'b00;
        #10;
        $display("%b      %b", sel, y);

        sel = 2'b01;
        #10;
        $display("%b      %b", sel, y);

        sel = 2'b10;
        #10;
        $display("%b      %b", sel, y);

        sel = 2'b11;
        #10;
        $display("%b      %b", sel, y);

        $finish;

    end

`elsif MUX

    initial begin

        $display("------------------------");
        $display("       MUX TEST");
        $display("------------------------");

        // Four MUX data inputs
        data = 4'b1010;

        $display("data = %b", data);
        $display("a  b     mux_out");

        // Select data[0]
        a = 1'b0;
        b = 1'b0;
        #10;
        $display("%b  %b        %b", a, b, mux_out);

        // Select data[1]
        a = 1'b0;
        b = 1'b1;
        #10;
        $display("%b  %b        %b", a, b, mux_out);

        // Select data[2]
        a = 1'b1;
        b = 1'b0;
        #10;
        $display("%b  %b        %b", a, b, mux_out);

        // Select data[3]
        a = 1'b1;
        b = 1'b1;
        #10;
        $display("%b  %b        %b", a, b, mux_out);

        $finish;

    end

`endif

endmodule




////////////////////////////////////Design Part///////////////////

module mux(
  input logic a,b,
  input logic [1:0] sel,
  output logic [3:0]y,
  input logic [3:0] data,
  output logic mux_out);




  `ifdef DECODER

  always_comb  begin
    case(sel)
    2'b00: y = 4'b0001;
    2'b01: y = 4'b0010;
    2'b10: y = 4'b0100;
    2'b11: y = 4'b1000;

     default y = 4'b0000;

    endcase
  end

  `else
    always_comb
      begin
        case({a,b})

          2'b00:mux_out = y[0];
          2'b01:mux_out = y[1];
          2'b10:mux_out = y[2];
          2'b11:mux_out = y[3];

          default: mux_out = y[0];

        endcase
      end
  `endif

endmodule


