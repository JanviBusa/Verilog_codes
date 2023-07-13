//Design:
module MUX_4x1(out,in,sel);
input [3:0]in;
input [1:0]sel;
output out;
wire w1,w2,w3,w4;
/*
wire w1,w2,w3,w4,w5,w6;
not n1(w1,sel[0]);
not n2(w2,sel[1]);
and a1(w3,in[0],w1,w2);
and a2(w4,in[1],w2,sel[0]);
and a3(w5,in[2],sel[1],w1);
and a4(w6,in[3],sel[1],sel[0]);
or (out,w3,w4,w5,w6);
*/
//assign out=sel[1]?(sel[0]?in[3]:in[2]):(sel[0]?in[1]:in[0]);
nand n1(w1,in[3],sel[0],sel[1]);
nand n2(w2,in[2],(~sel[0]),sel[1]);
nand n3(w3,in[1],sel[0],(~sel[1]));
nand n4(w4,in[0],(~sel[0]),(~sel[1]));
nand n5(out,w1,w2,w3,w4);
endmodule

//Test Bench:
module MUX_4x1_tb();

reg [3:0]in;
reg [1:0]sel;
wire out;
MUX_4x1 m1(out,in,sel);

initial
begin
$monitor($time," SEL1=%b SEL0=%b in0=%b in1=%b in2=%b in3=%b OUT=%b",sel[1],sel[0],in[0],in[1],in[2],in[3],out);
end
initial
begin
	sel[1]=1'b0; sel[0]=1'b0; in[0]=1'b1; in[1]=1'b0; in[2]=1'b0; in[3]=1'b0;
	#5
	sel[1]=1'b0; sel[0]=1'b1; in[0]=1'b0; in[1]=1'b1; in[2]=1'b0; in[3]=1'b0;
	#5
	sel[1]=1'b1; sel[0]=1'b0; in[0]=1'b0; in[1]=1'b0; in[2]=1'b1; in[3]=1'b0;
	#5
	sel[1]=1'b1; sel[0]=1'b1; in[0]=1'b0; in[1]=1'b0; in[2]=1'b0; in[3]=1'b1;
end

initial
begin
$dumpfile("mux_4x1.dump");
$dumpvars(0,MUX_4x1_tb);
end
endmodule
/*

module MUX_4x1_tb();
reg a,b,c,d,sel0,sel1;
wire out;
MUX_4x1 m(.in[0](a), .in[1](b), .in[2](c), .in[3](d), .sel[0](sel0), .sel[1](sel1), .out(out));
initial
begin
$monitor($time," SEL1=%b SEL0=%b in0=%b in1=%b in2=%b in3=%b OUT=%b",sel1,sel0,a,b,c,d,out);
end
initial
begin
	sel1=1'b0; sel0=1'b0; a=1'b1; b=1'b0; c=1'b0; d=1'b0;
	#5
	sel1=1'b0; sel0=1'b1; a=1'b0; b=1'b1; c=1'b0; d=1'b0;
	#5
	sel1=1'b1; sel0=1'b0; a=1'b0; b=1'b0; c=1'b1; d=1'b0;
	#5
	sel1=1'b1; sel0=1'b1; a=1'b0; b=1'b0; c=1'b0; d=1'b1;
end
initial
begin
$dumpfile("mux_4x1.dump");
$dumpvars(0,MUX_4x1_tb);
end
endmodule
*/
