//Design:

module demux_1x8(in,s2,s1,s0,y7,y6,y5,y4,y3,y2,y1,y0);
input in,s2,s1,s0;
output y7,y6,y5,y4,y3,y2,y1,y0;
wire w1,w2,w3,w4,w5,w6;
demux_1x2 de1(w1,w2,in,s2);
demux_1x2 de2(w3,w4,w1,s1);
demux_1x2 de3(w5,w6,w2,s1);
demux_1x2 de4(y0,y1,w3,s0);
demux_1x2 de5(y2,y3,w4,s0);
demux_1x2 de6(y4,y5,w5,s0);
demux_1x2 de7(y6,y7,w6,s0);
endmodule

//Test Bench:

module demux_1x8_tb();
reg in,s2,s1,s0;
wire y7,y6,y5,y4,y3,y2,y1,y0;
demux_1x8 de1(in,s2,s1,s0,y7,y6,y5,y4,y3,y2,y1,y0);
initial
begin
$monitor($time," in=%b S2=%b S1=%b S0=%b Y7=%b Y6=%b Y5=%b Y4=%b Y3=%b Y2=%b Y1=%b Y0=%b",in,s2,s1,s0,y7,y6,y5,y4,y3,y2,y1,y0);
end
initial
begin
	in=1'b1; s2=1'b0; s1=1'b0; s0=1'b0;
	#5;
	in=1'b1; s2=1'b0; s1=1'b0; s0=1'b1;
	#5;
	in=1'b1; s2=1'b0; s1=1'b1; s0=1'b0;
	#5;
	in=1'b1; s2=1'b0; s1=1'b1; s0=1'b1;
	#5;
	in=1'b1; s2=1'b1; s1=1'b0; s0=1'b0;
	#5;
	in=1'b1; s2=1'b1; s1=1'b0; s0=1'b1;
	#5;
	in=1'b1; s2=1'b1; s1=1'b1; s0=1'b0;
	#5;
	in=1'b1; s2=1'b1; s1=1'b1; s0=1'b1;
	#5;
end
initial
begin
$dumpfile("demux_1x8.dump");
$dumpvars(0,demux_1x8_tb);
end
endmodule
