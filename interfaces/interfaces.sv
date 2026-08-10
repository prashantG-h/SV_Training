interface simple_interface (input logic clk);
  
  logic req,gnt;
  
 
  modport target(input clk,req,output gnt);
  
  modport initiator (input clk,gnt,output req);
  
endinterface


module  ahb(simple_interface.target a);
  
  always@(posedge a.clk)
    begin
      
      if(a.req)
        begin
          	a.gnt<=1;
          $display("time = %0t,GRANT AHB REceieved",$time);
        end
      else
        
        begin
        a.gnt<=0;
          $display("time = %0t,GRANT AHB not REceieved",$time);
      
        end
    end
 
endmodule



module apb( simple_interface.initiator b);

  initial begin
    
    b.req = 0;
    
    #20;
    
    b.req = 1;
    
    $display("$time = %0t,Request sent",$time);
    
    #30;
    
    b.req = 0;
    
  end
  
  always @(posedge b.clk)
begin

    if(b.gnt)
      $display("$time = %0t,APB : Grant Received",$time);

end

  
  
endmodule


module top();
  
  
 logic clk = 0;
  
  simple_interface si1(clk);
  
  always #5 clk = ~clk;
    
  ahb a1(.a(si1));
  apb a2(.b(si1));
  
  
  initial  begin
    
    #100;
    
    $finish;
    
  end
  


endmodule



