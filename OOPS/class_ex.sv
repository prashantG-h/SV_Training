// Code your testbench here
// or browse Examples


// class sub_class;
//   int obj;
// endclass

// class transaction;
//   int data;
//   sub_class sub_h;

//   function new();
//     sub_h = new();
//   endfunction
// endclass

// module test;

//   transaction trans_h1, trans_h2;

//   initial begin
//     trans_h1 = new();
//     trans_h1.data = 4;
//     trans_h1.sub_h.obj = 5;

//     // Shallow copy
//     trans_h2 = new trans_h1;

//     $display("Before modification");
//     $display("trans_h1.data      = %0d", trans_h1.data);
//     $display("trans_h2.data      = %0d", trans_h2.data);
//     $display("trans_h1.sub_h.obj = %0d", trans_h1.sub_h.obj);
//     $display("trans_h2.sub_h.obj = %0d", trans_h2.sub_h.obj);

//     // Modify through trans_h2
//     trans_h2.data = 20;
//     trans_h2.sub_h.obj = 99;

//     $display("\nAfter modification");
//     $display("trans_h1.data      = %0d", trans_h1.data);
//     $display("trans_h2.data      = %0d", trans_h2.data);
//     $display("trans_h1.sub_h.obj = %0d", trans_h1.sub_h.obj);
//     $display("trans_h2.sub_h.obj = %0d", trans_h2.sub_h.obj);

//   end

// endmodule



//upcasting experiment 1
// class Parent;

//   int data = 10;

//   function void display();
//     $display("Parent data = %0d", data);
//   endfunction

// endclass


// class Child extends Parent;

//   int value = 20;

//   function void show();
//     $display("Child value = %0d", value);
//   endfunction

// endclass


// module tb;

// Parent p;
// Child  c;

// initial begin

//    c = new();

//  p = c;      // Upcasting

//    p.display();

// end

// endmodule



// Experiment 2: Upcasting Cannot Access Child Members

// class Parent;
//     int a=5;
// endclass

// class Child extends Parent;
//     int b=10;
// endclass

// module tba;

// Parent p;
// Child c;

// initial begin

//    c = new();

//    p = c;

//    $display(p.a);

//    //$display(p.b);   // Compile Error

// end

// endmodule



// // Downcasting Using $cast
// class Parent;

//    int a=10;

// endclass


// class Child extends Parent;

//    int b=20;

// endclass


// module tbb;

// Parent p;
// Child c;

// initial begin

//    c = new();

//    p = c;

//    if($cast(c,p))
//      $display("Cast Success A=%0d",c.a);
//    else
//       $display("Cast Failed");

// end

// endmodule


// Successful Multi-Level Downcast

// class A;
// endclass

// class B extends A;

// int b=20;

// endclass

// class C extends B;

// int c=30;

// endclass


// module tbd;

// A h1;
// C h3;

// initial begin

//    h3=new();

//    h1=h3;

//    if($cast(h3,h1))
//       $display(h3.c);

// end

// endmodule


// //Class handle's Array of elements

// class Parent;

//    int id;

//    function new(int i);
//       id = i;
//    endfunction

// endclass


// module tbe;

// Parent p[3];

// initial begin

//    p[0] = new(10);
//    p[1] = new(20);
//    p[2] = new(30);

//    foreach(p[i])
//       $display("id = %0d", p[i].id);

// end

// endmodule

// Case 2: Dynamic Array of Handles

// class Parent;

//    int id;

//    function new(int i);
//       id=i;
//    endfunction

// endclass


// module tbf;

// Parent p[];

// initial begin

//    p = new[4];

//    foreach(p[i])
//       p[i]=new(i+1);

//    foreach(p[i])
//      $display("Darray = %0d",p[i].id);

// end

// endmodule


// Upcasting Inside Array
// class Parent;

// int x=100;

// endclass


// class Child extends Parent;

// int y=200;

// endclass


// module tb;

// Parent p[2];

// initial begin

//    p[0]=new();

//    Child c=new();

//    p[1]=c;

//    foreach(p[i])
//       $display(p[i].x);

// end

// endmodule



// Downcasting From Array
// class Parent;

// int x=10;

// endclass


// class Child extends Parent;

// int y=20;

// endclass


// module tb;

// Parent p[2];
// Child c;

// initial begin

//    p[0]=new();

//    p[1]=new Child();

//    foreach(p[i])

//       if($cast(c,p[i]))
//          $display("Success y=%0d",c.y);
//       else
//          $display("Failed");

// end

// endmodule


// Dynamic Array with Mixed Objects
// class Parent;

// int id;

// function new(int i);

// id=i;

// endfunction

// endclass


// class Child extends Parent;

// int value;

// function new(int i,int v);

// super.new(i);

// value=v;

// endfunction

// endclass


// module tb;

// Parent arr[];

// Child ch;

// initial begin

//    arr=new[3];

//    arr[0]=new(1);

//    arr[1]=new Child(2,100);

//    arr[2]=new Child(3,200);

//    foreach(arr[i])

//       if($cast(ch,arr[i]))
//          $display("Child value=%0d",ch.value);
//       else
//          $display("Parent only");

// end

// endmodule


