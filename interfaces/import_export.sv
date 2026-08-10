// Assignment questions 

`endif

endmodule

//////////////////////////////////////////////Interface using imports/////////////////////////////////////////////////////////


// interface normal_interface(input logic clk);
  
//   logic gnt,req,ack;
//   logic [7:0] addr, data;
//   logic [3:0] mode;
//   logic rdy,start;
  
  
  
  
//   task write();
//     addr = 30;
//     $display("addr = %d",addr);
//   endtask
  
//   task read();
//     data = 30;
//     $display("data = %d",data);
//   endtask
  
//    task init();
//      $display("display from the finsiher modport");
//   endtask
//    task fial();
//      $display("display from the finsiher modport");
//   endtask
    
  
  
//   modport starter(input gnt,ack,rdy,clk,output addr,data,start,import write,read);
                  
 
                  
//   modport finisher(input addr,data,start,output gnt,ack,rdy,import init,fial);
                   

//   endinterface
                   
                   
                   
                   
//  module striker_a(normal_interface.starter f1);
  
//   initial begin
    
//     f1.write();
//     f1.read();
   
//   end
  
// endmodule
                   

                 
                  
                   
                   
//  module striker_b(normal_interface.finisher f2);
  
//   initial begin
    
   
//     f2.write();
//     f2.read();
  
//   end
  
// endmodule

                   
//                    module top();
//                      logic clk;
//                      normal_interface NI(clk);
                     
//                      striker_a a1(NI);
//                      striker_b a2(NI);
                     
                     
//                      initial 
//                        begin
                        
//                        clk = 0;
//                        end
                     
                       
//                        always #5 clk = ~clk;
                       
             
                     
                     
// endmodule
                   
                   
                   
                   
                   
interface simple_interface(input logic clk);
  
  logic gnt,req,ack;
  logic [7:0] addr, data;
  logic [3:0] mode;
  logic rdy,start;
  
  
//   task write();
//     $display("display from the write task using import from Interface 2");
//   endtask
  
//   task read();
//     $display("display from the read task using import");
//   endtask
   
  
  
  modport starter (input gnt,ack,rdy,clk,output addr,data,start,import task read(), task write(),task exp_task());
  modport finisher(input addr,data,start,output gnt,ack,rdy,export read, write, init, fial,exp_task);
                   
endinterface
                  
                   
module final1(simple_interface.finisher s1);                     
                   
task s1.init();
     $display(" data =  display from read ");
endtask
                         
 task s1.fial();
    $display(" mode  display from the write");
 endtask
  
  
  
  task s1.exp_task();
    $display("Display from the class ");
    
  endtask
  
    task s1.write();
    $display("display from the write task using import from Interface 2");
  endtask
  
  task s1.read();
    $display("display from the read task using import");
  endtask
  
  
 endmodule
                                     
                                     
module final2 (simple_interface s2);
                                          
initial begin 
                     
  s2.write();
  s2.read();
                      
 end
                    
                  
endmodule

class simple;
  
  virtual  simple_interface.finisher s1; //You made mistake of  virtual interface declartion
  
  
  task run_();
    s1.exp_task();
    $display("inside class");
    
  endtask
endclass
  
  
  
  
                                    
module top1();
  simple s;
logic clk = 0;
simple_interface f(clk);
                                    
  final1 f1(f.finisher);
  final2 f2(f.starter);
                   
  initial begin
     s = new();
	s.s1 = f.finisher;
    s.run_();// Virtual   Interface assignment  to the   class declared assignment
     #100;
  //simple_interface.SI = SI.finisher;
    
  end       

 initial begin
 	forever #5 clk = ~clk;
 end
  
  
  initial begin
    #100;
    $finish;
  end
                                      
endmodule



