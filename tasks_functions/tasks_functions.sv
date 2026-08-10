// Code your testbench here
// or browse Examples

// module test;
  
  
//   function automatic void f1();
    
//     fork 
      
//       #6 $display("print at %0t",$time);
    
//     join_none
//   endfunction
  
//   initial begin
    
//     f1();
    
    
//   end
  
  
// endmodule

// module tb;
  
  
//   function int add(input int a,b );
//     int c;
//      c = a+b;
//     $display("the  sum is %0d",c);
//   endfunction
  
//   function bit mul(bit[5:0] a, b);
//     bit [5:0]result;
//     result = a*b;
//     $display("the multiplication is %d",result);
//     return result;
//   endfunction
  
//   function logic div(input logic[3:0] d,e);
//     logic [3:0] str;
    
//     str = d/e;
//     $display("the division is %d",str);
//     return str;
//   endfunction
  
//   function struct strct(input a,b);
    
  
//   endfunction
  
  
  
  
//   initial begin 
    
//     add(3,4);
//     mul(3,4);
//     div(4,2);
    
//   end
  
  
  
// endmodule


// module  tb2;
  
  
//     function dis();
//      static int i = 0; 
//      i++;
//     $display(i);
//   endfunction
  
  
  
  
//   initial begin
    
//     dis();
//     dis();
//     dis();
    
    
//   end
  
// endmodule


// class fn;
  
//  int j;
  
//   static  function a1();  // wtever var delre in the this fn wil not bcm static
//     int i =0;
//     i++;
//     $display(i);
//   endfunction
  
//   function static a2();                    // wtever var delre in the this fn wil  bcm stati
//     j++;
//     $display(j);  
//   endfunction
  
// endclass

// module tb;
  
//   fn f1 = new();
  
  
//   initial begin
    
    
//     fn::a1();  //use scope resolution operator   to access static function
//     fn::a1();
//     fn::a1();
//     f1.a2();
//     f1.a2();
//     f1.a2();
    
//   end
  
// endmodule



// Code your testbench here
// or browse Examples


// 06-08-26

// // Passing function as an arguments with two other functions
// module tb4;  
  
//   function int add(input int a,b);
    
//     return a+b;
//   endfunction
  
  
//   function int sub(input int  c,d);
    
//     return c-d;
//   endfunction
  
//   function int mix(input int add,sub);
//     $display(" add = %d",add);
//     $display(" sub = %d",sub);  
//   endfunction
  


// initial begin
  
//   mix(add(3,4),sub(7,2));
  
// end

// endmodule


// caling function inside function


// module tb6;
  
//   function int add(input int a,b);
//     return a**b;
//   endfunction
  
//   function int nest(input int c,d);
//     int e;
//     e = add(2,3);
//      c = c**d;
//     $display("add = %d",e);
//     $display("c=%d",c);
//   endfunction
  
//   initial begin
    
//     nest(3,4);
    
//   end
  
// endmodule


// Call static function in the fork-join_none



// class A;
//   int c;
  
//   static function static int a1();
    
//      int c ;
//      c++;
//     $display(c);
//   endfunction
  
//   function static  int a2();
    
//     int d;
    
//     d++;
//     $display(d);
//   endfunction
  
  
// endclass


// module tb30;
  
//   A b = new();
//   initial begin
   
//      fork
//     A::a1();  
//     A::a1();
//     b.a1.c = 10;
//     $display(b.c);
//     A::a1();
//      join
    
    
    
//     b.a2();
//     b.a2();
//     b.a2();
    
    
    
//   end
// endmodule



// factorial of n numbers

// module tb29;
  
  
//   function int fact(int n);
     
//     if(n<=1)
//       return 1;
//     else
//       return n*fact(n-1);
    
//   endfunction
  
  
  
  
//   initial begin
    
    
//     $display("fact = %d",fact(5)); // call directly in the display method
    
//   end
// endmodule
  

// function returning an dynamic array,queue array

// module tb31;

//   typedef int dyn_array_t[];

//   function automatic dyn_array_t get_array();

//     dyn_array_t arr;

//     arr = new[3];

   
//     arr[0] = 10;
//     arr[1] = 20;
//     arr[2] = 30;
   

//     return arr;

//   endfunction

//   dyn_array_t result;

//   initial begin

//     result = get_array();

//     foreach(result[i])
//       $display("result[%0d] = %0d", i, result[i]);

//   end

// endmodule



// module tb32;
  
//   typedef int q1[$];
  
  
//   function   q1 q2();
    
//     q1 q;
    
//     q.push_back(3);
//     q.push_back(4);
//     q.push_back(5);
  
//     return q;
//   endfunction
  
//   q1 q3;
  
//   initial begin
    
//     q3 = q2(); //Assigning function name to the variable or anything  thats the use of the  return keyword
    
    
//     foreach(q3[i])
//       $display("%0d",q3[i]);
    
    
//   end
  
// endmodule


// returning a class type in the function


// class Packet;

//   int addr;
//   int data;

//   function new(int a = 0, int d = 0);
//     addr = a;
//     data = d;
//   endfunction

// endclass


// module tb;

//   // Return type is the class type
//   function automatic Packet create_packet();
//     Packet p;

//     p = new(32'h1000, 32'hABCD);
//     return p;
//   endfunction

//   Packet pkt;

//   initial begin
//     pkt = create_packet();

//     $display("addr=%0h data=%0h", pkt.addr, pkt.data);
//   end

// endmodule


// Code your testbench here
// or browse Examples

// module test;


//   function automatic void f1();

//     fork

//       #6 $display("print at %0t",$time);

//     join_none
//   endfunction

//   initial begin

//     f1();


//   end


// endmodule

// module tb;


//   function int add(input int a,b );
//     int c;
//      c = a+b;
//     $display("the  sum is %0d",c);
//   endfunction

//   function bit mul(bit[5:0] a, b);
//     bit [5:0]result;
//     result = a*b;
//     $display("the multiplication is %d",result);
//     return result;
//   endfunction

//   function logic div(input logic[3:0] d,e);
//     logic [3:0] str;

//     str = d/e;
//     $display("the division is %d",str);
//     return str;
//   endfunction

//   function struct strct(input a,b);


//   endfunction




//   initial begin

//     add(3,4);
//     mul(3,4);
//     div(4,2);

//   end



// endmodule


// module  tb2;


//     function dis();
//      static int i = 0;
//      i++;
//     $display(i);
//   endfunction




//   initial begin

//     dis();
//     dis();
//     dis();


//   end

// endmodule


// class fn;

//  int j;

//   static  function a1();  // wtever var delre in the this fn wil not bcm static
//     int i =0;
//     i++;
//     $display(i);
//   endfunction

//   function static a2();                    // wtever var delre in the this fn wil  bcm stati
//     j++;
//     $display(j);
//   endfunction

// endclass

// module tb;

//   fn f1 = new();


//   initial begin


//     fn::a1();  //use scope resolution operator   to access static function
//     fn::a1();
//     fn::a1();
//     f1.a2();
//     f1.a2();
//     f1.a2();

//   end

// endmodule



// Code your testbench here
// or browse Examples


// 06-08-26

// // Passing function as an arguments with two other functions
// module tb4;

//   function int add(input int a,b);

//     return a+b;
//   endfunction


//   function int sub(input int  c,d);

//     return c-d;
//   endfunction

//   function int mix(input int add,sub);
//     $display(" add = %d",add);
//     $display(" sub = %d",sub);
//   endfunction



// initial begin

//   mix(add(3,4),sub(7,2));

// end

// endmodule


// caling function inside function


// module tb6;

//   function int add(input int a,b);
//     return a**b;
//   endfunction

//   function int nest(input int c,d);
//     int e;
//     e = add(2,3);
//      c = c**d;
//     $display("add = %d",e);
//     $display("c=%d",c);
//   endfunction

//   initial begin

//     nest(3,4);

//   end

// endmodule


// Call static function in the fork-join_none



// class A;
//   int c;

//   static function static int a1();

//      int c ;
//      c++;
//     $display(c);
//   endfunction

//   function static  int a2();

//     int d;

//     d++;
//     $display(d);
//   endfunction


// endclass


// module tb30;

//   A b = new();
//   initial begin

//      fork
//     A::a1();
//     A::a1();
//     b.a1.c = 10;
//     $display(b.c);
//     A::a1();
//      join



//     b.a2();
//     b.a2();
//     b.a2();



//   end
// endmodule



// factorial of n numbers

// module tb29;


//   function int fact(int n);

//     if(n<=1)
//       return 1;
//     else
//       return n*fact(n-1);

//   endfunction




//   initial begin


//     $display("fact = %d",fact(5)); // call directly in the display method

//   end
// endmodule


// function returning an dynamic array,queue array

// module tb31;

//   typedef int dyn_array_t[];

//   function automatic dyn_array_t get_array();

//     dyn_array_t arr;

//     arr = new[3];


//     arr[0] = 10;
//     arr[1] = 20;
//     arr[2] = 30;


//     return arr;

//   endfunction

//   dyn_array_t result;

//   initial begin

//     result = get_array();

//     foreach(result[i])
//       $display("result[%0d] = %0d", i, result[i]);

//   end

// endmodule



// module tb32;

//   typedef int q1[$];


//   function   q1 q2();

//     q1 q;

//     q.push_back(3);
//     q.push_back(4);
//     q.push_back(5);

//     return q;
//   endfunction

//   q1 q3;

//   initial begin

//     q3 = q2(); //Assigning function name to the variable or anything  thats the use of the  return keyword


//     foreach(q3[i])
//       $display("%0d",q3[i]);


//   end

// endmodule


// returning a class type in the function


// class Packet;

//   int addr;
//   int data;

//   function new(int a = 0, int d = 0);
//     addr = a;
//     data = d;
//   endfunction

// endclass


// module tb;

//   // Return type is the class type
//   function automatic Packet create_packet();
//     Packet p;

//     p = new(32'h1000, 32'hABCD);
//     return p;
//   endfunction

//   Packet pkt;

//   initial begin
//     pkt = create_packet();

//     $display("addr=%0h data=%0h", pkt.addr, pkt.data);
//   end

// endmodule


























  
  
  
  
  
    
  
    
    
  
    

  
  
  



    
    



  
    

