// SystemVerilog Logic Data Type Example

// Code your testbench here
// or browse Examples

// module tb;

//   logic [7:0] a;
//   bit [4:0] b;

//   initial

//     begin

//     //  a = 8'bz;
//      // b = 4'd12;
//    //   b = 4'bx;

//    //   b=a;
//     //  a= b;
//       // YoU'LL GET ZERO VALUE AT THE  END u see

//       a= 1'b1;
//       a=b;

//       $display("a = %d and b = %d",a,b);

//     end
// endmodule


// module tb1;

//   real [4:0] a;


//   initial
//     begin


//       a = 46;
//           $display("a = %b",a);
//     //  a [30] = 1;

//       a[3:0] = 4'b1111;
//        $display("a = %b",a);


//     end

//   endmodule

// module tb2;

//   logic [7:0]a;
//   bit [7:0]b;


//   initial
//     begin
// b = 'x;
// a = b;

//       $display(" a = %d,b = %d",a,b);
//     end
// endmodule

// module tb3;

//   logic a;
//   logic b;

//      assign b=1;
//        assign b=0;

//   initial
//     begin

//       if (a)
//         a= a+1;

//        $display(" a = %d",a);

//     //assigning continuous assignments two times and unitialized variable




//       $display("b = %d",b);

//     end


// endmodule


// module tb4;

//   bit [7:0] value;
//   byte data_value;

//   initial

//     begin

//       data_value = 200;

//       value = data_value;
//       $display("data_value = %d",data_value);

//     end

// endmodule




// module tb5;
//   logic [3:0] a;

//   initial begin


//       $deposit(a, 5);
//      $display("time = %0t, a = %0d", $time, a);

//     a = 10;

//      $display("time = %0t, a = %0d", $time, a);

//   end
// endmodule


// module tb6;

//   logic [1:0] a;
// logic b;

// assign a = b;

// initial begin
//     b = 0;
//     #5 force a = 1;
//   $display(" time = %0t,a = %d,b = %d",$time,a,b);
//     #10 release a;
//       #0;

//   $display(" time = %0t,a = %d,b = %d",$time,a,b);
// end

// endmodule



module tb7;

  bit [7:0][3:0] a[3:0][2:0];

  initial begin

    foreach (a[i,j]) begin
      a[i][j] = i*4 + 7;
      $display("a[%0d][%0d] = %d", i, j, a[i][j]);
    end

  end

endmodule


//july -07


module tb8;

  typedef struct {byte age;  //first srtruct
          logic [7:0] marks;
          bit pass;
         } student_t;

  student_t t1,t3;

  typedef struct {logic [7:0] addr;  //second struct
                  bit valid;
                  int data;} packet_t;
  packet_t t2;

  typedef struct {byte a;          //3rd struct
                  bit b;
                  logic d;} ran;
  ran r1;


  typedef struct {bit [3:0]ram;
                  byte rom;
                  logic size;} racket;   //4th struct
  racket r[3];


  typedef struct packed { logic [3:0] addr; //5th struct
                          logic [7:0] data;
                        } strc;
  strc c1;

  typedef struct packed { logic [3:0] addr; //6th struct
                          logic [7:0] data;
                        } strc1;
  strc1 c2;

  typedef struct packed signed{ bit a;
                                logic[3:0] b;    //7th struct
                                byte  c;
                              } strc2;

  strc2 c3;





  initial
    begin

  t1.age = 20;
  t1.marks = 518;
  t1.pass = 1;     //s1

  r1.a = 32; //s3

  t3 = t1;   //s2

      r[0] = '{7,28,30}; //4th struct
      r[1] = '{8,29,31};
      r[2] = '{9,230,32};

      foreach (r[i])
        $display("r[%0d] = %p",i,r[i]); //4th struct






      $display("t1 = %p",t1); //1s display
      $display("age = %d",t1.age);// f1s diff display
      $display("marks = %d",t1.marks);
      $display("data = %d",t1.pass);






      c1.addr = 15; // 2nd strct
      c1.data =54;

       c2 = 12'b101010101010;

      c3 = 8'hFF;



      $display(" t3 = %p",t3); //copy struct from t1 to t3





      $display("t2 = %p",t2); //2s


      $display(" r1 =%p",r1); //3s

      $display("strc = %b",c1);

      $display("c2 =%b",c2); //6s

      $display("c3 = %d",c3); // 7s





    end

endmodule



module tb9;

  typedef union packed{bit [31:0] a;
                       int  b;
                	   logic [31:0] c;} union_a;

  union_a a1;


  initial

    begin
         a1.a = 32'd123;
      a1.b = 32'd321;

      $display("a = %d",a1.a);
      $display("b = %d",a1.b);



    end
endmodule


module tbf;

  typedef struct {
    int a;
    bit [4:0] b;
    byte c;
  } stct;

  stct s1;

  typedef struct {
    int d;
    bit [4:0] e;
    stct s3;
  } stct1;

  stct1 s2;

  initial begin
    s1.a = 10;
    s1.b = 15;   // fits in 4 bits
    s1.c = 20;
    $display("s1 = %p", s1);

    s2.d = 4;
    s2.e = 3;
    s2.s3.a = 0;
    s2.s3.b = 15; // safe value for 4 bits
    s2.s3.c = 15;
    $display("s2 = %p", s2);
  end

endmodule




module tbe;

typedef struct packed {
    logic [3:0] day;
    logic [3:0] month;
    logic [7:0] year;
} date_t;

typedef struct packed {
    logic [7:0] id;
    date_t doj;
} employee_t;

employee_t emp;

initial begin

    emp.id = 8'hAA;

    emp.doj.day   = 4'd7;
    emp.doj.month = 4'd6;
    emp.doj.year  = 8'd24;

    $display("ID    = %h", emp.id);
    $display("Day   = %0d", emp.doj.day);
    $display("Month = %0d", emp.doj.month);
    $display("Year  = %0d", emp.doj.year);

end

endmodule

module tbg;

  typedef struct packed {int tv;
                         bit [3:0] jio_home;
                         logic [31:0] wifi; } remote;

  typedef struct {int mobile;
                  bit[5:0] ipad;
                  remote rma;} remote_a;

  remote_a rmb;

  initial

       begin

         rmb.rma.tv= 10;
         rmb.rma.jio_home = 6;
         rmb.rma.wifi = 205;

         rmb.mobile = 35;
         rmb.ipad = 55;


         $display("rmb = %p",rmb);

       end
endmodule


// module tbh;

// typedef struct {int tv;
//                 bit [3:0] jio_home;
//                 logic [31:0] wifi; } remote;

//   typedef struct packed {int mobile;
//                   bit[5:0] ipad;
//                   remote rma;} remote_a;

//   remote_a rmb;

//   initial

//        begin

//          rmb.rma.tv= 10;
//          rmb.rma.jio_home = 6;
//          rmb.rma.wifi = 205;

//          rmb.mobile = 35;
//          rmb.ipad = 55;


//          $display("rmb = %p",rmb);
//           Packed struct → all members must be packed types or other packed structs/unions.

// Unpacked struct → can contain anything, including other unpacked structs.
// So yes, putting an unpacked struct into a packed struct is not valid.
//        end
// endmodule


module tbh;

  typedef union packed {int tv;
                        bit [31:0] jio_home;
                 logic [31:0] wifi; } remote;

  typedef union packed {int mobile;
                        bit[31:0] ipad;
                		remote rma;} remote_a;
  remote_a rmb;
  initial

     begin



         rmb.rma.tv= 10;
         rmb.rma.jio_home = 6;
         rmb.rma.wifi = 205;

         rmb.mobile = 35;
         rmb.ipad = 55;


       $display("rmb222 = %p",rmb);

     end


       endmodule


module tbi;

typedef union packed {int tv;
                        bit [31:0] jio_home;
                 logic [31:0] wifi; } remote;

  typedef struct packed {int mobile;
                        bit[31:0] ipad;
                		remote rma;} remote_a;
  remote_a rmb;


  initial

     begin



         rmb.rma.tv= 10;
         rmb.rma.jio_home = 6;
         rmb.rma.wifi = 205;

         rmb.mobile = 35;
         rmb.ipad = 55;


       $display("rmb333 = %p",rmb);

     end


       endmodule


module tbj;


typedef struct packed {int tv;
                       bit [4:0] jio_home;
                 		logic  wifi; } remote;

  typedef union packed { remote rma;} remote_a;
  remote_a rmb;


  initial

     begin



         rmb.rma.tv= 10;
         rmb.rma.jio_home = 6;
         rmb.rma.wifi = 1;

//          rmb.mobile = 4;
//          rmb.ipad = 6;


       $display("rmb444 = %d",rmb.rma.tv);
       $display("jio_home = %d",rmb.rma.jio_home);
       $display("wifi  = %d",rmb.rma.wifi);

     end


       endmodule


// module tbk;
//   typedef  union packed {
//     int g;
//     logic k;
//     bit y;
//     struct  {
//         int d;
//         logic e;
//         byte f;
//         struct packed{int z; logic y; byte x;} i;
//     } s;
// } h;


//   h ha;

//   initial begin
//     // Access int
//     ha.g = 42;
//     $display("ha.g = %0d", ha.g);

//     // Access logic
//     ha.k = 1'b1;
//     $display("ha.k = %b", ha.k);

//     // Access bit
//     ha.y = 1'b0;
//     $display("ha.y = %b", ha.y);

//     // Access nested struct
//     ha.s.d = 100;
//     ha.s.e = 1'b1;
//     ha.s.f = 8'hAA;
//     ha.s.i.z = 77;
//     ha.s.i.y = 1'b0;
//     ha.s.i.x = 8'h55;

//     $display("ha.s.d = %0d", ha.s.d);
//     $display("ha.s.e = %b", ha.s.e);
//     $display("ha.s.f = %0h", ha.s.f);
//     $display("ha.s.i.z = %0d", ha.s.i.z);
//     $display("ha.s.i.y = %b", ha.s.i.y);
//     $display("ha.s.i.x = %0h", ha.s.i.x);
//   end
// endmodule




module tbk;

  int total = 0;
  int i;


  initial
     begin

       for(i=1;i<100;i++) begin
    total = i+total;
    end

  $display("total = %d",total);

     end

endmodule

module tbl;

  initial  begin

    for(int i=0;i<=100;i++)
      begin

        if(i%7==0)
          $display("i = %d",i);

      end

  end
endmodule





