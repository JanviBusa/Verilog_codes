//Design:

module decoder_3x8(out,in);
input [2:0]in;
output reg [7:0]out;
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


assign a[0]=(~in[2])&(~in[1])&(~in[0]);
assign a[1]=(~in[2])&(~in[1])&(in[0]);
assign a[2]=(~in[2])&(in[1])&(~in[0]);
assign a[3]=(~in[2])&(in[1])&(in[0]);
assign a[4]=(in[2])&(~in[1])&(~in[0]);
assign a[5]=(in[2])&(~in[1])&(in[0]);
assign a[6]=(in[2])&(in[1])&(~in[0]);
assign a[7]=(in[2])&(in[1])&(in[0]);
*/
always @ (in)
case (in)
    3'b000: out = 8'b00000001;
    3'b001: out = 8'b00000010;
    3'b010: out = 8'b00000100;
    3'b011: out = 8'b00001000;
    3'b100: out = 8'b00010000;
    3'b101: out = 8'b00100000;
    3'b110: out = 8'b01000000;
    3'b111: out = 8'b10000000;
    default: out = 8'b00000000;
endcase 
endmodule

//Test Bench:

module decoder_3x8_tb();
reg [2:0]in;
wire [7:0]out;
decoder_3x8 de1(.out(out[7:0]),.in(in[2:0]));
integer i;
initial
begin
$monitor($time," A0=%b A1=%b A2=%b D0=%b D1=%b D2=%b D3=%b D4=%b D5=%b D6=%b  D7=%b",in[0],in[1],in[2],out[0],out[1],out[2],out[3],out[4],out[5],out[6],out[7]);

/*initial
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
end*/

for (i = 0; i < 8; i = i + 1) begin
   {in} = i;
   #10;
end
$finish;
end
initial
begin
$dumpfile("decoder_3x8.dump");
$dumpvars(0,decoder_3x8_tb);
end
endmodule

