// Code your testbench here
// or browse Examples

// module tb;
  
  
//  initial begin
   
//    for(int i=0;i<3;i++) 
//      fork
    
//        $display(i);
     
       
//      join_none
   
   
//  end
  
// endmodule





// module tb1;
  
//   initial begin
    
//     $display("time = %0t,display outside the fork",$time); //print first at 0
    
//     fork 
//       $display("display 1",$time);    //print second at 0 
      
// //       #10;
      
//         begin:fj1
          
//           #30   $display("time = %0t,display 2",$time); //at 40 it'll print
//           #10   $display("time = %0t,display3",$time);  //at 20 it'll print
//         end
      
//         begin:fj2
          
//           #10  $display("time = %0t,display 4",$time);  //at 20 it'll print
//           #40  $display("time = %0t,display 5",$time);  //at 50 it'll print
//         end
      
//       $display("time = %0t,display 6 ",$time);  // at 10 it'll print
          
      
//     join_any
    
//     $display("time = %t,display 7 ",$time); // at 50 it'll print
    
//     wait fork;
    
//   end
  
// endmodule

// module tb2;
  
//   initial begin
//     fork
//       begin
//         #5 $display("Thread A finished at %0t",$time);
//       end
//       begin
//         #10 $display("Thread B finished at %0t",$time);
//       end
//     join_any
//     $display("outer one display at %0t",$time);
//   end
// endmodule
      
      
      
// module tb3; 
  
//    initial  begin
      
     
//       #1 $display("the displayA at %0t",$time); // at 0 a
     
//        fork: top1
         
//          $display("the displayB at %0t",$time);  // at 0  B
         
//          begin
//            #5  $display("the displayC at %0t",$time);  // at  5  C
//            #15 $display("the displayD at %0t",$time);  // at 20 D
//          end
           
//          begin
//            #19 $display("the displayE at %0t",$time);  // at 19 E
//            #18 $display("the displayF at %0t",$time);  //AT 37 F
//          end
         
            
//          begin
//            #20 $display("the displayG at %0t",$time);  // at 20 g
//            #21 $display("the displayH at %0t",$time);  // at 41 H
//          end
         
         
//        join
//      //  wait fork;
         
//       $display(" the displayI at %0t",$time); //at 100 display I
     
   
     
     
     
//      fork:top2
       
//        for(int i=0;i<8/2;i++) begin
//          $display(i);
//        end
       
//      join
     
//       end
  
    
//       disable fork;     
  
// endmodule 
        

        
// disable fork and wait fork and  disable  block_name and disable task 
        
module tb;
  
  initial begin
    
    
    fork: TEST
  
  
      $display("1");  //2
      
   
      
  begin
    
    $display("3");
    fork: TEST1
       
      $display("print A at time = %0t",$time);  //4
      disable TEST1;
      $display("print B");                   //5
      
    join_none
  // disable TEST;
    
      
  end
      
      $display("print C"); // 3
   
    join_none
    
     //     disable TEST1;

    
      $display("print D");   //1  //d will be printed when disable fork
    
    
      
  end
  
endmodule
