// Code your testbench here
// or browse Examples

// 22-07-2026
module tb;
  
  bit [3:0] a =4'b1010;
  bit [3:0] b = 4'b1000;
  
  bit [7:0] stream;
  
  
  initial begin
  stream = {>>{a,b}};
  $display("stream  = %b",stream);
   
    b = 4'b1100;
    
    $display("%d",{a,b});
  
    stream  = {<<{a,b}}; // 01010011
  $display("stream  = %b",stream);  
    
  
  end
  
endmodule


module tba;

  byte a = 8'h12;
  byte b = 8'h34;

  bit [15:0] stream;

  initial begin

    stream = {<<8{a,b}};

    $display("%h",stream);

  end

endmodule


module tbc;

  byte a=8'hAA;
  byte b=8'hBB;
  byte c=8'hCC;

  bit [23:0] x,y;

  initial begin

    x = {>>8{a,b,c}};
    y = {<<8{a,b,c}};

    $display(">> = %h",x);
    $display("<< = %h",y);

  end

endmodule

module tbd;

  bit [23:0] stream = 24'h112233;

  byte a,b,c;

  initial begin

    {>>8{a,b,c}} = stream;

    $display("a=%h",a);
    $display("b=%h",b);
    $display("c=%h",c);

  end

endmodule

module tbe;

  byte a = 8'hAB;

  bit [15:0] x;

  initial begin

    x = {>>{a}};

    $display("%b",x);

  end

endmodule


