//Design:
module DMUX_1x4(out,sel);
input [1:0]sel;
output [3:0]out;
wire w1,w2,w3,w4,w5,w6;
not n1(w1,sel[0]);
not n2(w2,sel[1]);
and a1(out[0],d,w1,w2);
and a2(out[1],d,w2,sel[0]);
and a3(out[2],d,sel[1],w1);
and a4(out[3],d,sel[1],sel[0]);
endmodule

//Test Bench:

module DMUX_1x4_tb();
reg [1:0]sel;
wire [3:0]out;
DMUX_1x4 d1(out,sel);
initial
begin
$monitor($time," S0=%b S1=%b Y0=%b Y1=%b Y2=%b Y3=%b ",sel[0],sel[1],out[0],out[1],out[2],out[3]);
end
initial
begin
	sel[0]=1'b0; sel[1]=1'b0;
	#5;
	sel[0]=1'b1; sel[1]=1'b0;
	#5;
	sel[0]=1'b0; sel[1]=1'b1;
	#5;
	sel[0]=1'b1; sel[1]=1'b1;
	#5;
end
initial
begin
$dumpfile("dmux_1x4.dump");
$dumpvars(0,DMUX_1x4_tb);
end
endmodule
