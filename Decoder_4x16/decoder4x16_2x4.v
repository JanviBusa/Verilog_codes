//Desgin:

`include "decoder_2x4.v"
module decoder_4x16(d,c,b,a,e,y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15);
input d,c,b,a,e;
output y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15;
wire w0,w1,w2,w3;
decoder_2x4 de1(d,c,e,w0,w1,w2,w3);
decoder_2x4 de2(b,a,w0,y0,y1,y2,y3);
decoder_2x4 de3(b,a,w1,y4,y5,y6,y7);
decoder_2x4 de4(b,a,w2,y8,y9,y10,y11);
decoder_2x4 de5(b,a,w3,y12,y13,y14,y15);
endmodule

//Test Bench:

module decoder_4x16_tb();
reg d,c,b,a,e;
wire y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15;
decoder_4x16 d1(d,c,b,a,e,y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15);
initial
begin
	$monitor($time," A3=%b A2=%b A1=%b A0=%b E=%b Y0=%b Y1=%b Y2=%b Y3=%b Y4=%b Y5=%b Y6=%b Y7=%b Y8=%b Y9=%b Y10=%b Y11=%b Y12=%b Y13=%b Y14=%b Y15=%b",d,c,b,a,e,y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15);
end
initial
begin
	d=1'b0; c=1'b0; b=1'b0; a=1'b0; e=1'b1;
	#5;
	d=1'b0; c=1'b0; b=1'b0; a=1'b1; e=1'b1;
	#5;
	d=1'b0; c=1'b0; b=1'b1; a=1'b0; e=1'b1;
	#5;
	d=1'b0; c=1'b0; b=1'b1; a=1'b1; e=1'b1;
	#5;
	d=1'b0; c=1'b1; b=1'b0; a=1'b0; e=1'b1;
	#5;
	d=1'b0; c=1'b1; b=1'b0; a=1'b1; e=1'b1;
	#5;
	d=1'b0; c=1'b1; b=1'b1; a=1'b0; e=1'b1;
	#5;
	d=1'b0; c=1'b1; b=1'b1; a=1'b1; e=1'b1;
	#5;
	d=1'b1; c=1'b0; b=1'b0; a=1'b0; e=1'b1;
	#5;
	d=1'b1; c=1'b0; b=1'b0; a=1'b1; e=1'b1;
	#5;
	d=1'b1; c=1'b0; b=1'b1; a=1'b0; e=1'b1;
	#5;
	d=1'b1; c=1'b0; b=1'b1; a=1'b1; e=1'b1;
	#5;
	d=1'b1; c=1'b1; b=1'b0; a=1'b0; e=1'b1;
	#5;
	d=1'b1; c=1'b1; b=1'b0; a=1'b1; e=1'b1;
	#5;
	d=1'b1; c=1'b1; b=1'b1; a=1'b0; e=1'b1;
	#5;
	d=1'b1; c=1'b1; b=1'b1; a=1'b1; e=1'b1;
	#5;
end
initial
begin
$dumpfile("decoder_4x16.dump");
$dumpvars(0,decoder_4x16_tb);
end
endmodule
