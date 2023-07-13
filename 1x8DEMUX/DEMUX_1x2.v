//Design:

module demux_1x2(y1,y2,in,s);
input in,s;
output y1,y2;
assign y1=((~s)&in);
assign y2=(s&in);
endmodule
/*
//Test Bench:

module demux_1x2_tb();
reg in,s;
wire y1,y2;
demux_1x2 d1(y1,y2,in,s);
initial
begin
$monitor($time," in=%b s=%b Y1=%b Y2=%b",in,s,y1,y2);
end
initial
begin
	in=1'b0; s=1'b0; 
	#5;
	in=1'b0; s=1'b1; 
	#5;
	in=1'b1; s=1'b0; 
	#5;
	in=1'b1; s=1'b1; 
	#5;
end
initial
begin
$dumpfile("dmux_1x2.dump");
$dumpvars(0,demux_1x2_tb);
end
endmodule
*/
