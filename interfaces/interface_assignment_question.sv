// Code your testbench here
// or browse Examples

// Interface Assignment question


// interface Assignment_Q(input logic clk);
//   logic [3:0] a,b;
//   logic  [3:0] a_1,b_1;
//   logic rst;
  
  
//   modport first_m(input a,b,clk,rst,output a_1,b_1);
  
//   modport second_m(input a_1,b_1,clk,rst,output a,b);
  
// endinterface 
 

// module first_mod(Assignment_Q S1);
  
  
//   always @(posedge S1.clk or negedge S1.rst) begin
       
//     if(!S1.rst) begin
//      S1.a_1 = 0; 
//       S1.b_1 = 0; //You cannot drive the inputs from module instead do it in the TB
//     end
    
//     else begin
//      S1.a_1 = S1.a+S1.b;  
//      S1.b_1 =  S1.a*S1.b;
    
    
//   //$display("input a = %d,b= %d",S1.a,S1.b)
 
//     end
    
//      $display("input a_1 = %d,b_1= %d",S1.a_1,S1.b_1);
    
//   end
  
// endmodule


//   module second_mod(Assignment_Q S2);
  
  
//   always @(posedge S2.clk or negedge S2.rst) begin 
    
//     if(!S2.rst) 
//             begin
//         S2.a = 0;
//         S2.b = 0;
//     end
    
//     else
//          begin
//          S2.a = S2.a_1 + S2.b_1;
//          S2.b = S2.a_1 * S2.b_1;
           
//          end
//             $display("SECOND MODULE");
//         $display("a = %0d",S2.a);
//         $display("b = %0d",S2.b); 
//   end
  
//  endmodule
    



// module top2();
//   logic clk;
  
//   Assignment_Q 	S3(clk);
  
//   first_mod  S4(.S1(S3.first_m));
//   second_mod S5(.S2(S3.second_m));
  
//     initial begin 
//     S3.a = 10;
//     S3.b  = 5;
//   end
  
  
//   initial begin 
//     clk = 1;
//   forever #5 clk = ~clk;
//     S3.rst = 1;
//     #20;
//     S3.rst = 0; 
//     #30;
//     S3.rst = 1;
//   end
    

  
//   initial begin
//     $dumpfile("file.vcd");
//     $dumpvars;
    
//     #100;
//     $finish;
    
//   end
  
// endmodule
  
  

//////////////////////////////////Calling
  
  
  
  
    interface my_if;

  task display_msg();
    $display("Inside Interface Task");
  endtask

endinterface


class my_class;

  virtual my_if vif;

  function new(virtual my_if vif);
    this.vif = vif;
  endfunction

  task run();
    vif.display_msg();
  endtask

endclass


module tb;

  my_if intf();
  my_class obj;

  initial begin
    obj = new(intf);
    obj.run();
  end

endmodule
  
