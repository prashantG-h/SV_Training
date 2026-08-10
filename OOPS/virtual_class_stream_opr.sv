// Code your testbench here
// or browse Examples

//date:21-07-2026
// class base;
  
//   int a;
  
//   virtual task display();
//     $display("Printing from the base class");
//   endtask
  
// endclass


// class derived extends base;
  
//   int b;
  
//   task display();
//     $display("Printing from the derived class");
    
//   endtask
//      task display1();
//        $display("Printing from the derived class from another method");
    
//   endtask  
// endclass


// base bc;
// derived dc,dc1;


// module tb;
  
// initial begin

// //bc = new();
//  dc = new();

// 	bc =  dc; // for the downcasting its must to upcast first
//   if($cast(dc , bc)) begin
//     $display("casting successfull");
//      dc.display();
 
//   	dc.display1();
//     dc.b = 18;
//     $display("b = %d",dc.b);
//   end
//   else begin
//     $display("casting unsuccessfull");
//  end
   
  
  
// end

// endmodule
    


// //////////////////////////////////// Virtual Class examples////////////////////////////////


// virtual class basea;
  
//   pure virtual task drive();
    
// endclass
    
// class axi_driver extends  basea;
  
//   task drive();
//     $display("printing from the axi_driver");
//   endtask
  
// endclass
    

// class ahb_driver extends basea;
  
//   task drive();
//     $display("printing from the ahb_driver");
//   endtask

// endclass
    
// class apb_driver extends basea;
  
//   task drive();
//     $display("printing from the apb_driver");
//   endtask

// endclass    
  
//   module tba;
    
    
//     axi_driver ax;
//     ahb_driver ah;
//     apb_driver ap;
    
//     initial begin
    
//     axi_driver ax =  new();
//        ahb_driver ah = new();
//       apb_driver ap =  new();
    
//     ax.drive();
     
   
    
//     ah.drive();
    
    
    
//     ap.drive();
  
//     end 
    
    
//   endmodule
    
    
    
///////////////////////////////////////////STream Operators///////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
    
    
    
module tbc;
  
  int data = 32'h12345678;
  int b;
  
  bit [7:0] bytes[4];
  bit [31:0] word = 32'h12345678;
  
  
  initial begin
    b = {>>8{data}};
    $display("data = %h",b);
    b = {<<8{data}};
    $display("data = %h",b);
    $display("");
    
    b = {>>4{data}};
    $display("data = %h",b);
    b = {<<4{data}};
    $display("data = %h",b);
    $display("");
    
    b = {>>16{data}};
    $display("data = %h",b);
    b = {<<16{data}};
    $display("data = %h",b);
    $display("");
    
    
    
    bytes[0]=8'h12;
	bytes[1]=8'h34;
	bytes[2]=8'h56;
	bytes[3]=8'h78;
    
    word = {>>{bytes}};
    $display("word = %h",word);
    
    word = {<<{bytes}};
    $display("word = %h",word);
    
    $display("bytes = %p",bytes);
    
    
    
  end
endmodule
    
    
    
    
  

