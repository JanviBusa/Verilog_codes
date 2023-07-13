//Design:

module encoder_4x2(v,in3,in2,in1,in0,y1,y0);
input in3,in2,in1,in0;
output y1,y0,v;
assign y0=(in3|in1), y1=(in3|in2);
assign v=(in3|in2|in1|in0);
endmodule
/*
//Test Bench:

module encoder_4x2_tb();
reg in3,in2,in1,in0;
wire y1,y0;
encoder_4x2 e1(in3,in2,in1,in0,y1,y0);
initial
begin
	$monitor($time," A3=%b A2=%b A1=%b A0=%b Y1=%b Y0=%b",in3,in2,in1,in0,y1,y0);
end
initial
begin
	in3=1'b0; in2=1'b0; in1=1'b0; in0=1'b1;
	#5;
	in3=1'b0; in2=1'b0; in1=1'b1; in0=1'b0;
	#5;
	in3=1'b0; in2=1'b1; in1=1'b0; in0=1'b0;
	#5;
	in3=1'b1; in2=1'b0; in1=1'b0; in0=1'b0;
	#5;
end
endmodule
*/
