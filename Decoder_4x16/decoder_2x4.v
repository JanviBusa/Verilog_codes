//Design:

module decoder_2x4(a,b,e,y0,y1,y2,y3);
input a,b,e;
output y0,y1,y2,y3;
assign y0=((~a)&(~b)), y1=((~a)&b), y2=(a&(~b)), y3=(a&b);
endmodule
/*
//Test Bench:

module decoder_2x4_tb();
reg a,b,e;
wire y0,y1,y2,y3;
decoder_2x4 d1(a,b,e,y0,y1,y2,y3);
initial
begin
$monitor($time," a=%b b=%b Y0=%b Y1=%b Y2=%b Y3=%b",a,b,y0,y1,y2,y3);
end
initial
begin
	a=1'b0; b=1'b0; 
	#5;
	a=1'b0; b=1'b1; 
	#5;
	a=1'b1; b=1'b0; 
	#5;
	a=1'b1; b=1'b1; 
	#5;
end
initial
begin
$dumpfile("decoder_2x4.dump");
$dumpvars(0,decoder_2x4_tb);
end
endmodule
*/
