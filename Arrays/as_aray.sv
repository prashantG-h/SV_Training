// Code your testbench here
// or browse Examples
module tb;
  
  byte q1[$] ={1,2,3,4,5,7,8}; //queuse of bytes
  string names[$] = {"Bob"};
  
  integer q[$] = {3,2,6,7};
  
  int n;
  
  int k=0;
  
  //bit q2 {$;255};
  
//   typedef my_type element_t;
//   typedef element_t queue_t[$];
  
//   queue_t Q;
  
  initial begin
   
    
  foreach(q1[i])
    q1[i] =  i*2;
   
    
    $display("-------------------------------------------------------------------------");
    $display("the initializing and iteration and getting the size of bounded queue array");
    $display("---------------------------------------------------------------------------");
    $display("the queue arry contains %p",q1);
    $display("The size of array is %d",q1.size);
    
    
    $display("---------the push,pop operations----------");
    
    n = q1.size();
    
    for(int i=0;i<n;i++)begin
      q1.push_back(q1[i]);
      end
       
    //q1.push_back(4);
    $display("the pushed back data is %p",q1);
    
    q1.insert(8,5);
    $display("the pushed back data is %p",q1);
    // insert method 
    k =  q1.pop_front();
    //pop_front method
    $display("the pushed back data is %p",q1);
    $display("The poped data is k =  %d",k);
    
     k= q1.pop_back();
    //pop_back method
    $display("The poped data is k =  %d",k);
    
    q1.push_front(5);
    //push_front meyhod
    $display("The poped data is k =  %p",q1);
     q1.push_back(5);
    //push _back
    $display("The poped data is k =  %p",q1);
    
    
    $display("=======Array locator methods=++++++++++");
    
 end
  
endmodule


module tba;
  
  int q1[$] = {9,8,7,6,5,4,3,2,1};
  int q2[$];
  
  
  
  initial begin
    q2 = q1.find(x) with (x>3);
    $display("the elememnts are %p",q2);
    
    q2 = q1.find_last_index(x) with(x>2);
    $display("the elememnts are %p",q2);
    
    q2 =  q1.find_first(x) with (x>0);
    $display("the elememnts are %p",q2);
    
    q2 =  q1.find_last(x) with (x>0);
     $display("the elememnts are %p",q2);
    
    q2 = q1.find_first_index(x) with (x>8);
     $display("the elememnts are %p",q2);
    
    q2 = q1.min();
    $display("the elememntsPare %p",q2);
    
     q2 = q1.max();
    $display("the elememntsPare %p",q2);
    
    q2 = q1.unique();
    
    $display("the elememntsPare %p",q2);
    
    q2 = q1.unique_index();
    $display("the elememntsPare %p",q2);
   
    
    
    
    
  end
  
  
endmodule

module tbc;
  
  int aa[byte];
  
 // struct aa
  int b;
  
  
  initial begin
    aa[3] = 5;
    aa[6] = 9;
    aa[5] = 9;
    
    if(aa.exists(3))
      $display("the index exist at the array is ");
    else
      
      $display("the index doesnt exist at the array is ");
    
    
    if(aa.last(b));
    $display("the index exist at the array  b is %d",b);
      
  		end
endmodule


module tbd;
  bit [31:0] aa [string];
  
  
  
  initial begin
    
    aa["Prashant"] = 32;
    aa["Akkasali"] = 35;
    aa["23"] = 36;
    aa["35"] = 38;
    aa["36"] = 40;
    
    
    if(a.exists("Prashant"))
      $display("the element is preent ");
    
    
  end
  
endmodule
      
  
    
    
  
  
