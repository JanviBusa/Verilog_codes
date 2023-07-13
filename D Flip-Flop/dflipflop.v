//Module:

module dflipflop(d, clk, rst, q);
input d, clk, rst;
output q;
reg q;
always@(posedge clk)
if (rst)
q<= 1'b0;
else
q<=d;
endmodule

// Test Bench:

module dflipflop_tb ();
reg d, clk, rst;
wire q;
dflipflop d1(.d(d), .clk(clk), .rst(rst), .q(q));
initial begin
	$monitor($time,"d=%b clk=%b rst=%b q=%b",d,clk,rst,q);
end
initial begin
clk=0;
forever #10 clk = ~clk;
end
initial begin
rst = 1;
d <=0;
#10;
rst = 0;
d<=1;
#10;
d<=1;
#10;
d<=1;
#10;
d<=1;
#10;
d<=0;
#10;
d<=1;
#10;
d<=1;
end
initial 
begin
	#100 $finish;
end
initial begin
	 $dumpfile("dflipflop.dump");
	 $dumpvars(0,dflipflop_tb);
end
endmodule
