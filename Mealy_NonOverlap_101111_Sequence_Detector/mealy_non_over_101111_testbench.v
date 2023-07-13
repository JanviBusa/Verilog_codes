//Testbench

module TB;
  reg clk, rst, x;
  wire z;
  
  mealy_non_overlapping_101111 dut (clk, rst, x, z);
  initial clk = 0;   
  always #2 clk = ~clk;
    
  initial begin
    $monitor("%t: x = %b, z = %b",  $time, x, z);
    x = 0;
    #1 rst = 1;
    #2 rst = 0;
    
    #3 x = 1;
    #4 x = 1;
    #4 x = 0;
    #4 x = 1;
    #4 x = 1;
    #4 x = 1;
    #4 x = 1;
    #4 x = 0;
    #4 x = 0;
    #4 x = 1;
    #4 x = 0;
    #4 x = 1;
    #4 x = 1;
    #4 x = 1;
    #4 x = 1;
    #4 x = 0;
    #4 x = 1;
    #4 x = 1;
    #4 x = 1;
    #4 x = 1;
    #10;
    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
endmodule
