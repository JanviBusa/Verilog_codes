//Design:
//'include "2x1MUX.v"
module mux_8x1(y,s0,s1,s2,i0,i1,i2,i3,i4,i5,i6,i7);
input s0,s1,s2,i0,i1,i2,i3,i4,i5,i6,i7;
wire w1,w2,w3,w4,w5,w6;
output y;
mux_2x1 m1(w1,s0,i0,i1);
mux_2x1 m2(w2,s0,i2,i3);
mux_2x1 m4(w4,s0,i4,i5);
mux_2x1 m5(w5,s0,i6,i7);
mux_2x1 m3(w3,s1,w1,w2);
mux_2x1 m6(w6,s1,w4,w5);
mux_2x1 m7(y,s2,w3,w6);
endmodule

//TEst Bench:

module mux_8x1_tb();
reg s0,s1,s2,i0,i1,i2,i3,i4,i5,i6,i7;
wire y,w1,w2,w3,w4,w5,w6;
mux_8x1 mu1(y,s0,s1,s2,i0,i1,i2,i3,i4,i5,i6,i7);
initial 
begin
	$monitor($time," S2=%b S1=%b S0=%b I0=%b I1=%b I2=%b I3=%b I4=%b I5=%b I6=%b I7=%b Y=%b",s2,s1,s0,i0,i1,i2,i3,i4,i5,i6,i7,y);
end
initial
begin
	//s0=1'b0; s1=1'b0; s2=1'b0; i0=1'b1; i1=1'b0; i2=1'b0; i3=1'b0; i4=1'b0; i5=1'b0; i6=1'b0; i7=1'b0;
	s2=1'b0; s1=1'b0; s0=1'b0; i0=1'b1; i1=1'b0; i2=1'b0; i3=1'b0; i4=1'b0; i5=1'b0; i6=1'b0; i7=1'b0;
	#5;
	//s0=1'b0; s1=1'b0; s2=1'b1; i0=1'b0; i1=1'b1; i2=1'b0; i3=1'b0; i4=1'b0; i5=1'b0; i6=1'b0; i7=1'b0;
	s2=1'b0; s1=1'b0; s0=1'b1; i0=1'b0; i1=1'b1; i2=1'b0; i3=1'b0; i4=1'b0; i5=1'b0; i6=1'b0; i7=1'b0;
	#5;
	//s0=1'b0; s1=1'b1; s2=1'b0; i0=1'b0; i1=1'b0; i2=1'b1; i3=1'b0; i4=1'b0; i5=1'b0; i6=1'b0; i7=1'b0;
	s2=1'b0; s1=1'b1; s0=1'b0; i0=1'b0; i1=1'b0; i2=1'b1; i3=1'b0; i4=1'b0; i5=1'b0; i6=1'b0; i7=1'b0;
	#5;
	//s0=1'b0; s1=1'b1; s2=1'b1; i0=1'b0; i1=1'b0; i2=1'b0; i3=1'b1; i4=1'b0; i5=1'b0; i6=1'b0; i7=1'b0;
	s2=1'b0; s1=1'b1; s0=1'b1; i0=1'b0; i1=1'b0; i2=1'b0; i3=1'b1; i4=1'b0; i5=1'b0; i6=1'b0; i7=1'b0;
	#5;
	//s0=1'b1; s1=1'b0; s2=1'b0; i0=1'b0; i1=1'b0; i2=1'b0; i3=1'b0; i4=1'b1; i5=1'b0; i6=1'b0; i7=1'b0;
	s2=1'b1; s1=1'b0; s0=1'b0; i0=1'b0; i1=1'b0; i2=1'b0; i3=1'b0; i4=1'b1; i5=1'b0; i6=1'b0; i7=1'b0;
	#5;
	//s0=1'b1; s1=1'b0; s2=1'b1; i0=1'b0; i1=1'b0; i2=1'b0; i3=1'b0; i4=1'b0; i5=1'b1; i6=1'b0; i7=1'b0;
	s2=1'b1; s1=1'b0; s0=1'b1; i0=1'b0; i1=1'b0; i2=1'b0; i3=1'b0; i4=1'b0; i5=1'b1; i6=1'b0; i7=1'b0;
	#5;
	//s0=1'b1; s1=1'b1; s2=1'b0; i0=1'b0; i1=1'b0; i2=1'b0; i3=1'b0; i4=1'b0; i5=1'b0; i6=1'b1; i7=1'b0;
	s2=1'b1; s1=1'b1; s0=1'b0; i0=1'b0; i1=1'b0; i2=1'b0; i3=1'b0; i4=1'b0; i5=1'b0; i6=1'b1; i7=1'b0;
	#5;
	//s0=1'b1; s1=1'b1; s2=1'b1; i0=1'b0; i1=1'b0; i2=1'b0; i3=1'b0; i4=1'b0; i5=1'b0; i6=1'b0; i7=1'b1;
	s2=1'b1; s1=1'b1; s0=1'b1; i0=1'b0; i1=1'b0; i2=1'b0; i3=1'b0; i4=1'b0; i5=1'b0; i6=1'b0; i7=1'b1;
	#5;
end
initial
begin
$dumpfile("mux_8x1.dump");
$dumpvars(0,mux_8x1_tb);
end
endmodule
