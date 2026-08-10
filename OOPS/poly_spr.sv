// Code your testbench here
// or browse Examples

// class base_A #(type T = int,int WIDTH=4); //size should write in capital  
//   T [31:0] a1;              //T should be capital 
//   logic [WIDTH-1:0] a;
  
  
// endclass

// class base_B #(type T = int,int WIDTH=4) extends base_A #(T,WIDTH); // we need to give directly  and parameters should also be a same
  
//   T [31:0]b1;
//   logic [WIDTH-1:0] b;
  
// endclass


// module tb;
  
//   initial begin
    
//     base_A  #(logic,32) ab;
//     base_B  #(logic,32) bc;
    
//     bc = new();

    
//     //ab = bc; //assigning child handle to parent handle (****Upcasting*****) in order to cast it the both parametrized classes should contain the same data type and same size
    
// //     if($cast(bc , ab))
// //     	$display("Sucess");
// //     else
// //       $display("failed");
    
//     bc.a1 = 35;
//     bc.a = 45;
//     $display("a1=%d,a=%d",bc.a1,bc.a);
    
//     bc.b1 = 48;
//     bc.b = 38;
//     $display("b1=%d,b=%d",bc.b1,bc.b);
    
    
// //      ab.a1 = 35;
// //     ab.a = 45;
// //     $display("a1=%d,a=%d",ab.a1,ab.a);
    
// //     ab.b1 = 48;
// //     ab.b = 38;
// //     $display("b1=%d,b=%d",ab.b1,ab.b);
    
//      end
  
// endmodule



/////////////// Second Experiment//////////////
///////////////////////////////////////////////

// class Animal;

//   string name;

// endclass


// class Dog extends Animal;

//   int age;

// endclass


// module tbb;

//   Animal a;
//   Dog d;
//   Dog d2;

//   initial begin

//     d = new();

//     d.name = "Rocky";
//     d.age  = 5;

//     // Upcasting
//     a = d;

//     // Assume we lost the original child handle
//    // d = null;

//     // Downcasting
//     if ($cast(d2, a)) begin
//       $display("Downcasting Successful");
//       $display("Name d2 = %s", d2.name);
//       $display("Age d2  = %0d", d2.age);
//    end
//     else begin
//      $display("Downcasting Failed");
//     end

//   end

// endmodule



// ////////////////////////////////super,virtual,this ////////////////////
// /////////////////////////////////example///////////////////////////////


// // class base_a;
  
// //   int a,b,c;
// //   bit [3:0] d;
  
// //   function new(int a,b,c);
    
// //     this.a= a;
// //     this.b=b;
// //     this.c=c;
    
// //     c = 8;
// //     d = 6;
// //   endfunction
  
  
    
  
// //   virtual task reset_signal();
// //     $display(" display from the reset_signal");
// //   endtask
    
// //   virtual task main_phase();
// //     $display("display from the main_phaase");
// //   endtask
  
// //   virtual  function void run_task();
// //     $display("dislay from the run_phase");
// //   endfunction
  
// //    virtual function void display();
    
// //      $display("parent: a = %d,b= %d,c=%d",a,b,c);
// //   endfunction
  
  
// // endclass


// // class base_b extends base_a;
  
// //   int a,b,c,e,f;
// //   bit [3:0] g;
  
// //   function new(int a,b,c);
    
// //     super.new(a,b,c); //u need to provide the variables name as well If you written there in super.new
    
// //     e= 100;
// //     f= 200;
// //   endfunction
  
  
  
// //   virtual task reset_signal();
// //    $display(" display from the reset_signal ");
// //   endtask
    
// //   virtual task main_phase();
// //     $display("display from the main_phaase from child class");
// //   endtask
  
// //   virtual function void run_task();
    
// //     $display("dislay from the run_phase from child class");
// //   endfunction
  
  
  
// //   virtual function void display();
    
// //     $display("Child: a = %d,b= %d,c=%d e =%d",a,b,c,e);
// //   endfunction
  
// // endclass


// // module tbc;
  
// //   base_a a_b;
// //   base_b b_c;
  
// //   initial begin
    
// //     a_b = new (1,2,3);
    
// //     b_c = new(4,4,6);
    
// //     a_b = b_c; 
    
    
    
// //     a_b.main_phase();
// //      a_b.run_task();
// //     a_b.run_task;
// //     a_b.display();
    
// //     a_b.a = 10;
// //     a_b.b = 11;
// //     a_b.c = 15;
// //     a_b.d = 9;
// //     a_b.display();
// //     $display("a= %d,b=%d",a,b);
// //   end
  
// // endmodule

class parent_a;
  
  int a; int b;
  
  
  function new();
    //super.new(1,2); //If we write the super.new in base class we'll get error bcz we cant write super in base class untill it have base class
       a = 90;
       b = 90;
    
  endfunction
  
  virtual function void print();
    $display(" a=%d,b=%d",a,b);
   
  endfunction
  
endclass


class child_a extends parent_a;
  
  int a; int b;
  
  function new();
 	 super.new();
   this.a = 40; 
    this.b = 50;
    super.a = 10;
    super.b = 20;
  endfunction
  
   
  virtual function void print();
     super.print();
    $display(" value from child ", this.a, this.b, super.a, super.b);
  endfunction
  
endclass


class grand_child extends child_a;
  
  int e; int f;

     
  function new();
    super.new();
     e = 6; f = 7; // if u want to update the value here only then you can write here as this.a= 4 and if u want to pass the vlaues through the object creation u need to write as this.a=a;
  endfunction
  
  virtual function void print();
    
    $display(" print from the child class e=%d,f=%d",this.e,this.f);
  endfunction
  
endclass


class great_grand_child extends grand_child;

   int e; int f;
  
      
  function new();
    super.new();
   this.e = 8; 
    this.f = 9;
    super.e = 19;
   super.f = 219;
    
  endfunction
  
   virtual function void print();
     super.print();
     $display(" print from great_grand_child e=%d,f=%d,e= %d,f=%d",this.e,this.f,super.e,super.f);
   endfunction
  
  
  
endclass
  

module tbd;
  
  initial begin
    
  parent_a   	    pa;
  child_a           ca;
  grand_child       gc;
  great_grand_child  ggc;
    
   pa = new();
  //   ca = new();
  //  pa = ca;
 //   ca =  new();
    
    ggc = new();
    
       gc = ggc;
    
   gc.print(); 
   // pa.print();
  
  
//   pa = ca;
//   ca = gc;
// //   gc = ggc;
    
 // pa = ggc;
  
  
  
  //pa.print(); // first parent-child call
  
//  ca.print(); //second parent-child call
  
 // pa.print(); //third parent-child call          if we dont write virtual keyword in the base class the vale will going to get from the base class
    
  end
  
endmodule
  
  
class Parent;

  local int secret = 100;

  function void getter();
    $display("Secret = %0d", secret);
  endfunction
  
  
  
  
  function int setter(int data);
  this.secret = data;
  endfunction

endclass

class child extends parent;
  
  protected int secret_1;
  
  $display("secret = %d",secret);
  
endclass
   
   
  

module tbi;

  Parent p = new();

  
  initial begin
    
    child c1 = new();
    
    p.setter(6);
    p.getter();

    // Illegal
    // $display("%0d", p.secret);
  end

endmodule
    


class Parent;

    int pub = 1;
    protected int prot = 2;
    local int priv = 3;

    function void show();
        $display("Parent: %0d %0d %0d", pub, prot, priv);
    endfunction

endclass


class Child extends Parent;

    function void test();

        $display(pub);     // OK

        $display(prot);    // OK

        //$display(priv);   // ERROR

    endfunction

endclass


module tbj;

Parent p = new();
Child c = new();

initial begin

    p.show();

    $display(p.pub);       // OK

    //$display(p.prot);    // ERROR

    //$display(p.priv);    // ERROR

    c.test();

end

endmodule
    
  
