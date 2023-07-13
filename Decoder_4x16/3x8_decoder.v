//Design:

module decoder_3x8(a,in,e);
input [2:0]in;
input e;
output [7:0]a;
wire w1,w2,w3;
/*
not n1(w1,in[0]);
not n2(w2,in[1]);
not n3(w3,in[2]);
and na0(a[0],w1,w2,w3);
and na1(a[1],w3,w2,in[0]);
and na2(a[2],w3,in[1],w1);
and na3(a[3],w3,in[1],in[0]);
and na4(a[4],in[2],w2,w1);
and na5(a[5],in[2],w2,in[0]);
and na6(a[6],in[2],in[1],w1);
and na7(a[7],in[2],in[1],in[0]);

*/
assign a[0]=(~in[2])&(~in[1])&(~in[0]);
assign a[1]=(~in[2])&(~in[1])&(in[0]);
assign a[2]=(~in[2])&(in[1])&(~in[0]);
assign a[3]=(~in[2])&(in[1])&(in[0]);
assign a[4]=(in[2])&(~in[1])&(~in[0]);
assign a[5]=(in[2])&(~in[1])&(in[0]);
assign a[6]=(in[2])&(in[1])&(~in[0]);
assign a[7]=(in[2])&(in[1])&(in[0]);

endmodule
/*
//Test Bench:

module decoder_3x8_tb();
reg [2:0]in;
wire [7:0]a;
decoder_3x8 de1(.a(a[7:0]),.in(in[2:0]));
initial
begin
$monitor($time," A0=%b A1=%b A2=%b D0=%b D1=%b D2=%b D3=%b D4=%b D5=%b D6=%b  D7=%b",in[0],in[1],in[2],a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7]);
end
initial
begin
	in[2]=1'b0; in[1]=1'b0; in[0]=1'b0;
	#5;
	in[2]=1'b0; in[1]=1'b0; in[0]=1'b1;
	#5;
	in[2]=1'b0; in[1]=1'b1; in[0]=1'b0;
	#5;
	in[2]=1'b0; in[1]=1'b1; in[0]=1'b1;
	#5;
	in[2]=1'b1; in[1]=1'b0; in[0]=1'b0;
	#5;
	in[2]=1'b1; in[1]=1'b0; in[0]=1'b1;
	#5;
	in[2]=1'b1; in[1]=1'b1; in[0]=1'b0;
	#5;
	in[2]=1'b1; in[1]=1'b1; in[0]=1'b1;
	#5;
end
initial
begin
$dumpfile("decoder_3x8.dump");
$dumpvars(0,decoder_3x8_tb);
end
endmodule
*/
