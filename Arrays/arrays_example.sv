
module tb;
  
  int a[];
  int b[];
  
  initial begin
    
      
      a = new[5];
    b= new[7];
     
    for(int i=0;i<a.size();i++)
        a[i] = i*5;
    
    for(int i=0;i<5;i++)
      $display("a[%0d] = %d",i,a[i]);
         
  
  
     
       $display("--- 1D Array Elements ---");
    foreach(b[i])
      b[i] = i**2;
       
       foreach(b[i])
         $display("b[%0d] = %d",i,b[i]);
    
  
  
  end
endmodule


//2]The ChallengeDeclare a 2D dynamic array (a dynamic array of dynamic arrays).


module tba; 

  bit [3:0] [4:0] a[][];


initial begin

  //using foreach loop
a = new[3]; //row allocation
  
  $display("the  size of rwo is %d",a.size());

  foreach(a[i]) begin
  a[i] = new[4]; //column allocation 
    $display("the  size of rwo is %d",a[i].size());
  end


$display("2d ARRay elemensts are as follows");
  foreach(a[i,j]) begin

a[i][j] = i*2+3;
  end

  foreach(a[i,j]) begin
    $display("a[%0d][%0b] = %b",i,j,a[i][j]);
  end
  
  
  $display("the dispaly of all elements using the for loop");
  for(int i=0;i<a.size();i++) //3 rows
    
    for(int j=0;j<a[i].size();j++)
    begin
    a[i][j] = i*i+4;
      $display("a[%0b][%0b] = %b",i,j,a[i][j]);
    
  end
  
  
 

end


endmodule


// The ChallengeDeclare a 3D dynamic array.
// Dynamically allocate it to dimensions of $2 \times 3 \times 2$.
// Populate it using nested for loops with the mathematical formula: val = i * j * k.
// Use a foreach loop to print all elements.


module tbb;
  
  int p[][][]; //3D Array using foreach loop
  
  initial  begin
    p = new[3];
    $display("Th esize of array's row is %d",p.size());
    
    foreach(p[i]) begin
      p[i] = new[4];
    $display("the size of array is column is %d",p[i].size());
    end
    
    foreach(p[i,j]) begin
      p[i][j] = new[3];
    $display("the size of array is column is %d",p[i][j].size());
    end
    
    foreach(p[i,j,k]) begin

      p[i][j][k] = i*2+3+j+k;
      $display("a[%0d][%0d][%0d] = %d",i,j,k,p[i][j][k]);
    end
    
  end
    
endmodule


module tbc;
  
  
  int p[][][];
  
  initial begin
    
    p = new[3]; //Allocate the rows
    $display("the size of row of the array p is %d",p.size());
    
    for(int i=0;i<p.size();i++) begin
      p[i] = new[4]; //Allocate columns
       $display("the size of column of the array p is %d",p[i].size());
    
    end
   
    
    for(int i=0;i<p.size();i++)begin  
    for(int j=0;j<p[i].size();j++) begin
       p[i][j] = new[5];
      
          $display("the size of row of the array p is %d",p[i][j].size());

       end
    end
    
    // Allocating the  values of respective elements
    $display("Th 3D Array using the for loops ");
            for(int i=0;i<p.size();i++) begin
              for(int j=0;j<p[i].size();j++)begin
                for(int k=0;k<p[i][j].size();k++) begin
            
            			p[i][j][k] = i*2+j*3+k+3;
            end
          end
         end
      		
            
            foreach(p[i,j,k])
            $display("p[%0d][%0d][%0d] = %0d",i,j,k,p[i][j][k]);
    
    
    $display("Rows    = %0d", p.size());
$display("Columns = %0d", p[0].size());
$display("Depth   = %0d", p[0][0].size());
    	
    	
    
  end
    
    
    endmodule



// module tbd;
  
//   int a[];
  
//   int temp;
//   int idx;
  
  
//   initial begin
    
//     a = new[100];
    
//     foreach(a[i]) begin
//       a[i] = i;
//     end     
 
//       for (int i = 0; i < 50; i++) 
//        idx = 99 - i;
         
    
//     temp = a[i];
    
//       a[i] = idx;
    
//       idx = temp;
       
    
    
    
//     foreach(a[i])
      
//       $display("a[i] = %p",a[i]);
    
  
//   end
  
// endmodule
