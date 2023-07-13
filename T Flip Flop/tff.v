// Design

module t_flip_flop(
  input wire t,
  input wire clk,
  output reg q
);
  
  always @(posedge clk) begin
    if (t)
      q <= ~q;
    else
    	q<=q;
  end	

  initial begin
    q = 1'b0; 
  end
  
endmodule

//Testbench

module tff_tb();

  reg t;
  reg clk;
  wire q;

  t_flip_flop uut(.t(t),.clk(clk),.q(q));

  initial begin
    clk = 0;
    forever #5 clk = ~clk; 
  end

  initial begin
    $monitor($time," clock=%b, T=%b, Q=%b", clk,t, q);
  end
  
  initial begin
    t = 0;
    #10 t = 1;
    #10 t = 0;
    #10 t = 1;
    #10 $finish;
  end
  
  initial begin
  $dumpfile("tff.dump");
  $dumpvars(0,tff_tb);
  end

endmodule

