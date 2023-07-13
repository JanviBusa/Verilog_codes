// Module:

module dffpr(d,clk,reset,preset,q);
input d,clk,reset,preset;
output reg q;
always@(posedge clk or posedge reset or posedge preset)
begin
	if (reset==1)
		q<=1'b0;
	else if (preset==1)
		q<=1'b1;
	else
		q<=d;
end
endmodule

//Test Bench:

module dffpr_tb();
reg d,clk,reset,preset;
wire q;
dffpr dut(.d(d), .clk(clk), .reset(reset), .preset(preset), .q(q));
initial begin
	 $monitor($time,"d=%b clk=%b reset=%b preset=%b q=%b",d,clk,reset,preset,q);
end
initial
begin
	       clk=0;
forever#20 clk=~clk;
end
initial begin
	 reset=0;
	 d=0;
	 #15;
	 reset=0;
	 d=1;
	 #15;
	 reset=1;
	 d=0;
	 #15;
	 reset=1;
	 d=1;
	 #15; 
	 reset=0;
end
initial begin
	#90;
	 preset=0;
d=0;
#15;
preset=0;
d=1;
#15;
preset=1;
d=0;
#15;
preset=1;
d=1;
#15; 
	 preset=0;
	 #30;
	 d=0;
	 #15;d=1;
end
initial begin
	 #250; $finish;
end
initial begin
	 $dumpfile ("dffpr.dump");
	 $dumpvars(0,dffpr_tb);
end
endmodule
