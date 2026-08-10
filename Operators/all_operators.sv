// Code your testbench here
// or browse Examples

module tb;
 
  integer a,b;
  bit [31:0] result;
  bit sel;
  int y;
  logic [4:0] e;
  logic [4:0] f;
  
  initial begin
    
    
    // binary assignment operator
    a =6; 
    $display("a=%d",a);
    

     // Binary arithmetic assignment operator
    b = 7;   
    a += b;   //     += means a = a+b;
    $display("a = %d,b = %d",a,b);
    
    a= 8 ; b =3;
    
    a -= b;  //     += means a = a-b;
    $display("a = %d,b = %d",a,b);
    
     a= 8; b =2;
    
     a /= b; //  /= means a = a/b
    $display("a = %d,b = %d",a,b);
    
    a *= b;  // *= means a = a*b
    $display("a = %d,b = %d",a,b);
    
    
     a= 8; b =3;
    a %= b; // %= means a = a%b;
    $display("a = %d,b = %d",a,b);
    
    
    // Binary bitwise assignment operators
     a = 8'b10101010;
     b = 8'b10001010;
    
     a &= b; // &= means a= a&b; bitwise and
    $display("a = %d,b = %d",a,b);
    $display("a = %b,b = %b",a,b);
    
    a |= b; // |= MEANS a = a|b bitwise OR
    $display("a = %d,b = %d",a,b);
    $display("a = %b,b = %b",a,b);
    
    a = 8'b10101010;   // output -->                  01010010
    b = 8'b11111000;
    a ^=b; // ^= means  a= a^b bitwise xor
    $display("a = %d,b = %d",a,b);
    $display("a = %b,b = %b",a,b);
    
    
    
    
     /////Binary logical shift assignment operators
    
    a = 8'b01010101;
    b = 8'b00000010;
    
    a>>=b;    // >>= means  a = a>>b binary logical right shift assignemt operators
    $display("a = %d,b = %d",a,b);
    $display("a = %b,b = %b",a,b);   // output 
    
    a = 8'b01010101;
    b = 8'b00000010;
    a<<=b;
    $display("a = %d,b = %d",a,b); // / <<= means  a = a>>b binary logical right shift assignemt
    $display("a = %b,b = %b",a,b);  
    
    a = 8'b00011011;
    b = 8'b10001000;
    a >>>= b; // >>>= means a = a>>>b binaryarithmetic right shift operator
    
    $display("a = %d,b = %d",a,b);
     $display("a = %b,b = %b",a,b); 
    
    a = 8'b00011011;
    b = 8'b00000010;
    a <<<= b; // >>>= means a = a>>>b binaryarithmetic right shift operator
    
    $display("a = %d,b = %d ",a,b);
     $display("a = %b,b = %b",a,b); 
    
    
    //Conditional operator 
    
      sel = 0;
     y = sel ? a:b;
    $display("y = %d",y);
    
    sel = 1;
    y = sel ? a:b;
    
     $display("y = %d",y);
    
    //  +,-
    
    a = 10; b = 11;
    result = a+b;
    $display("result = %d",result);
    result = b-a;
    $display("result = %d",result);
    
    
    // unary bitwise neagtion operator
    a = 4'b1110;
    result = ~a;
    a = 1'b0;

    $display("result = %b",result);
    
     // unary logical neagtion operator
    a = 1'b1; 
    b = !a;
    $display("!b = %b", b);
    b = !a;
    $display("b = %b", b);
    
    
    //unary reduction operator
     a = 4'b1111;
    // &a;
    $display("red a = %b",^a);
    
     a = 4'b1010;
     //~&a;
    $display("red nand a = %b",~&a);
    
    
    //Binary relational operators
    
    a= 5;
    b = 3;
    
    if(a>b)
      $display(" a  greater than b ");
     
    if(a<b)
      $display(" a  less than b ");  
    
     a = 5;
     b = 5;
    
    
    if(a>=b)
      $display(" a  equals b ");
    
     a= 3; b =9; 
    if(a<=b)
      $display(" a  less than b ");
    else
      $display("a is not less than b");
    
    
    // Binary case equality operators
    
      a = 4'b1001;
        b = 4'b1001;
    if(a===b)
      $display(" the case equality works here and its equal");
    else
      $display("Not equal");
    
    
    a = 4'b10z1;
    b = 4'b1001;
    if(a !== b)
      $display("not equal here a =%d and b =%d",a,b);
    else
      $display(" equal here");
    
    
     // Unary increment,decrement 
     
    a = 3;
    a++;
    $display(" a= %d",a);
    
    a = 5;
    a--;
     $display(" a= %d",a);
    
    // Concatenation,	Replication operators
    
    e= 4'b1010;
    f = 4'b0001;
    
    result = {e,f};
    $display(" result =  %b",result);
    
    
    
    result = {8{1'b1}};// replication
    $display("result =  %b",result);
    
    result =  {4-1{1'b0}};
    
     $display("result =  %b",result);
    
    
    //bit stream operators 
    a = 32'hDEADBEEF;
    $display("a= %h",a);
    result = {<<4{a}};
    $display(" result = %h",result);
    
    a = 32'hFEEBDEAD;
    $display("a= %h",a);
    result = {<<8{a}};
    
    $display(" result = %h",result);
    
    // Nested bit stream 
    
     
    a = 32'hFEEBDEAD;
    $display("a= %h",a);
    result = {<<8{ {<<8{a}}}};
    $display(" result1 = %h",result);
    
    
    
    
    
    
    
    
    
 
    
    
    
    
    
    
    
    
    
    
    
  end
  
  
endmodule
