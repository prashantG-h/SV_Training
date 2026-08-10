// Code your testbench here
// or browse Examples

// 17- jULy -2027

// class base_a;
//   logic [3:0] a;
//   function new();
//   	a = 8;
//   endfunction
// endclass

// class base_b;
//   logic [3:0] b;
//   function new();
//   	b = 8;
//   endfunction
 
// endclass

// class base_c;
//   logic [3:0] c;
//   function new();
//   	c = 8;
    
//   endfunction
// endclass

// class base_a1 extends base_a;
//   logic [3:0] a_1;
//   function new();
//     super.new();
//   	a_1 = 5;
    
//   endfunction
 
// endclass

// class base_a2 extends base_b;
//   logic [3:0] a_2;
//  function new();
//    super.new();
//   	a_2 = 5;
  
//   endfunction
 
// endclass

// class base_a3 extends base_c;
//   logic [3:0] a_3;
//   function new();
//   	a_3 = 5;
    
    
//   endfunction
 
// endclass

  
// class base_agent #(type d1 = base_a,type d2 = base_b,type d3 = base_c);
  
  
//   d1 a1;
//   d2 a2;
//   d3 a3;
  
//   function new();
//     a1 = new();
//     a2 = new();
//     a3 = new();
//     a1.a = 2;
//     a2.b = 3;
//     a3.c = 4;
//   endfunction
  
//   function void print();
//     $display("a  =%d ,a_1 = %d,a_2 = %d,a_3 = %d",a1.a,a1.a_1,a2.a_2,a3.a_3);
//   endfunction
  
// endclass


// class my_agent extends base_agent #(base_a1,base_a2,base_a3);
  
  
//   function new();
//     super.new();
//   endfunction
    

// endclass

// module tb;
  
//   my_agent my;
  
//   initial begin
    
//     my = new();
    
//     my.a1.a_1 = 5;
//     my.a2.a_2 = 6;
//     my.a3.a_3 = 7;
//     my.a1.a = 9; 
    
    
//     my.print();
    
//   end
  
// endmodule



// module tba;
  
//   int  data ; // 32 '
  
  
  
//   initial begin
    
//     data = 32'h 12345678;
    
//     $display("data[3] = %d",data[3]);
    
//     $display("data[7] = %b",data[7]);
//     $display("data[11] = %b",data[11]);
//     $display("data[15] = %d",data[15]);
//     $display("data[19] = %d",data[19]);
//     $display("data[23] = %d",data[23]);
//     $display("data[27] = %d",data[27]);
//     $display("data[31] = %d",data[31]);
    
    
    
    
//   end
  
// endmodule
    
    
// module tbb;

// logic [31:0] data;

// initial begin
//     data = 32'h12345678;

//     $display("data[31:24] = %h", data[31:24]);
//     $display("data[23:16] = %h", data[23:16]);
//     $display("data[15:8]  = %h", data[15:8]);
//     $display("data[7:0]   = %h", data[7:0]);
// end

// endmodule
    

module tbc;

logic [31:0] data;

initial begin
    data = 32'h12345678;

  $display("a=%h", data[0 +: 8]);
  $display("b=%h", data[8 +: 8]);
  $display("c=%h", data[16 +: 8]);
  $display("d=%h", data[24 +: 8]);
end

endmodule


module tbd;

logic [31:0] data;

initial begin
    data = 32'h12345678;

  $display("e=%h", data[31 -:8]);
  $display("f=%h", data[23 -:8]);
  $display("g=%h", data[15 -:8]);
  $display("h=%h", data[7  -:8]);
end

endmodule


module tbe;

logic [63:0] data;
int i;

initial begin

    data = 64'h1122334455667788;

    for(i=0;i<8;i++) begin
        $display("Byte %0d = %h",i,data[i*8 +:8]);
    end

end

endmodule
    

module tbf;

logic [63:0] data;
int i;

initial begin

    data = 64'h1122334455667788;

    for(i=7;i>=0;i--) begin
        $display("%h",data[(i*8)+7 -:8]);
    end

end

endmodule


module tbg;

logic [63:0] data;
logic [63:0] rev;
int i;

initial begin

    data = 64'h1122334455667788;
    rev  = '0;

    for(i=0;i<8;i++) begin
        rev[(7-i)*8 +: 8] = data[i*8 +: 8];
    end

    $display("Original = %h", data);
    $display("Reverse  = %h", rev);

end

endmodule
