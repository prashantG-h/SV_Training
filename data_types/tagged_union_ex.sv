// Code your testbench here
// or browse Examples


module test;
  
  typedef union packed{bit [9:0] a;bit [9:0] b;} un_p;
  typedef union {bit [10:0] c;bit [9:0] d;} un_u;
  

typedef union packed {
    logic [31:0] word;
    logic [3:0][7:0] bytes;
} data_u;

data_u d;


   un_p u;
    un_u p;
  
  
  initial begin
  
  u.a = 30;
  u.b = 35;
  
  p.c = 340;
  p.d = 345;
  
    $display(" a= %d",u.a);
    $display(" b= %d",u.b);
    $display("u = %p",u);
    
    
    $display(" c= %d",p.c);
     $display(" d= %d",p.d);
     $display("u = %p",p);


d.word = 32'h12345678;
    $display("%h", d.bytes[0]);  // in packed union we can do bit slicing thats the main advantage
    
    
//  //tagged unions 
    
  
  end
  
endmodule

// module tb;

// typedef union tagged {
//     int  num;
//     byte ch;
//   logic [3:0] y;
// } my_union_t;

// my_union_t u;

// initial begin

//     // Store an integer
//     u = tagged num 100;

//     // Read it
//     if (u matches tagged num .x)
//         $display("Integer = %0d", x);

//     // Store a character
//     u = tagged ch "A";

//     // Read it
//     if (u matches tagged ch .c)
//         $display("Character = %c", c);
  
//     u = tagged y 6;
//   if(u matches tagged y .e)
//     $display("y = %d", e);
  
      

// end

// endmodule
