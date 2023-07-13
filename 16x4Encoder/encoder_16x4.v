//Design:
`include "encoder_4x2.v"
module encoder_16x4(v,in,out);
input [15:0]in;
output [3:0]out;
output v;
wire v1,v2,v3,v4;
wire w1,w2,w3,w4,w5,w6,w7,w8;
encoder_4x2 e1(v1,in[3],in[2],in[1],in[0],w2,w1);
encoder_4x2 e2(v2,in[7],in[6],in[5],in[4],w4,w3);
encoder_4x2 e3(v3,in[11],in[10],in[9],in[8],w6,w5);
encoder_4x2 e4(v4,in[15],in[14],in[13],in[12],w8,w7);
encoder_4x2 e5(v,v4,v3,v2,v1,out[3],out[2]);
assign out[0]=(w1|w3|w5|w7);
assign out[1]=(w2|w4|w6|w8);
endmodule

//Test Bench:

module encoder_16x4_tb();
reg [15:0]in;
wire [3:0]out;
wire v;
encoder_16x4 en1(v,in,out);
initial
begin
	$monitor($time," V=%b i15=%b i14=%b i13=%b i12=%b i11=%b i10=%b i9=%b i8=%b i7=%b i6=%b i5=%b i4=%b i3=%b i2=%b i1=%b i0=%b out0=%b out1=%b out2=%b out3=%b ",v,in[15],in[14],in[13],in[12],in[11],in[10],in[9],in[8],in[7],in[6],in[5],in[4],in[3],in[2],in[1],in[0],out[3],out[2],out[1],out[0]);
end
initial
begin
in[15]=1'b1;in[14]=1'b0;in[13]=1'b0;in[12]=1'b0;in[11]=1'b0;in[10]=1'b0;in[9]=1'b0;in[8]=1'b0;in[7]=1'b0;in[6]=1'b0;in[5]=1'b0;in[4]=1'b0;in[3]=1'b0;in[2]=1'b0;in[1]=1'b0;in[0]=1'b0;
#5;
in[15]=1'b0;in[14]=1'b1;in[13]=1'b0;in[12]=1'b0;in[11]=1'b0;in[10]=1'b0;in[9]=1'b0;in[8]=1'b0;in[7]=1'b0;in[6]=1'b0;in[5]=1'b0;in[4]=1'b0;in[3]=1'b0;in[2]=1'b0;in[1]=1'b0;in[0]=1'b0;
#5;
in[15]=1'b0;in[14]=1'b0;in[13]=1'b1;in[12]=1'b0;in[11]=1'b0;in[10]=1'b0;in[9]=1'b0;in[8]=1'b0;in[7]=1'b0;in[6]=1'b0;in[5]=1'b0;in[4]=1'b0;in[3]=1'b0;in[2]=1'b0;in[1]=1'b0;in[0]=1'b0;
#5;
in[15]=1'b0;in[14]=1'b0;in[13]=1'b0;in[12]=1'b1;in[11]=1'b0;in[10]=1'b0;in[9]=1'b0;in[8]=1'b0;in[7]=1'b0;in[6]=1'b0;in[5]=1'b0;in[4]=1'b0;in[3]=1'b0;in[2]=1'b0;in[1]=1'b0;in[0]=1'b0;
#5;
in[15]=1'b0;in[14]=1'b0;in[13]=1'b0;in[12]=1'b0;in[11]=1'b1;in[10]=1'b0;in[9]=1'b0;in[8]=1'b0;in[7]=1'b0;in[6]=1'b0;in[5]=1'b0;in[4]=1'b0;in[3]=1'b0;in[2]=1'b0;in[1]=1'b0;in[0]=1'b0;
#5;
in[15]=1'b0;in[14]=1'b0;in[13]=1'b0;in[12]=1'b0;in[11]=1'b0;in[10]=1'b1;in[9]=1'b0;in[8]=1'b0;in[7]=1'b0;in[6]=1'b0;in[5]=1'b0;in[4]=1'b0;in[3]=1'b0;in[2]=1'b0;in[1]=1'b0;in[0]=1'b0;
#5;
in[15]=1'b0;in[14]=1'b0;in[13]=1'b0;in[12]=1'b0;in[11]=1'b0;in[10]=1'b0;in[9]=1'b1;in[8]=1'b0;in[7]=1'b0;in[6]=1'b0;in[5]=1'b0;in[4]=1'b0;in[3]=1'b0;in[2]=1'b0;in[1]=1'b0;in[0]=1'b0;
#5;
in[15]=1'b0;in[14]=1'b0;in[13]=1'b0;in[12]=1'b0;in[11]=1'b0;in[10]=1'b0;in[9]=1'b0;in[8]=1'b1;in[7]=1'b0;in[6]=1'b0;in[5]=1'b0;in[4]=1'b0;in[3]=1'b0;in[2]=1'b0;in[1]=1'b0;in[0]=1'b0;
#5;
in[15]=1'b0;in[14]=1'b0;in[13]=1'b0;in[12]=1'b0;in[11]=1'b0;in[10]=1'b0;in[9]=1'b0;in[8]=1'b0;in[7]=1'b1;in[6]=1'b0;in[5]=1'b0;in[4]=1'b0;in[3]=1'b0;in[2]=1'b0;in[1]=1'b0;in[0]=1'b0;
#5;
in[15]=1'b0;in[14]=1'b0;in[13]=1'b0;in[12]=1'b0;in[11]=1'b0;in[10]=1'b0;in[9]=1'b0;in[8]=1'b0;in[7]=1'b0;in[6]=1'b1;in[5]=1'b0;in[4]=1'b0;in[3]=1'b0;in[2]=1'b0;in[1]=1'b0;in[0]=1'b0;
#5;
in[15]=1'b0;in[14]=1'b0;in[13]=1'b0;in[12]=1'b0;in[11]=1'b0;in[10]=1'b0;in[9]=1'b0;in[8]=1'b0;in[7]=1'b0;in[6]=1'b0;in[5]=1'b1;in[4]=1'b0;in[3]=1'b0;in[2]=1'b0;in[1]=1'b0;in[0]=1'b0;
#5;
in[15]=1'b0;in[14]=1'b0;in[13]=1'b0;in[12]=1'b0;in[11]=1'b0;in[10]=1'b0;in[9]=1'b0;in[8]=1'b0;in[7]=1'b0;in[6]=1'b0;in[5]=1'b0;in[4]=1'b1;in[3]=1'b0;in[2]=1'b0;in[1]=1'b0;in[0]=1'b0;
#5;
in[15]=1'b0;in[14]=1'b0;in[13]=1'b0;in[12]=1'b0;in[11]=1'b0;in[10]=1'b0;in[9]=1'b0;in[8]=1'b0;in[7]=1'b0;in[6]=1'b0;in[5]=1'b0;in[4]=1'b0;in[3]=1'b1;in[2]=1'b0;in[1]=1'b0;in[0]=1'b0;
#5;
in[15]=1'b0;in[14]=1'b0;in[13]=1'b0;in[12]=1'b0;in[11]=1'b0;in[10]=1'b0;in[9]=1'b0;in[8]=1'b0;in[7]=1'b0;in[6]=1'b0;in[5]=1'b0;in[4]=1'b0;in[3]=1'b0;in[2]=1'b1;in[1]=1'b0;in[0]=1'b0;
#5;
in[15]=1'b0;in[14]=1'b0;in[13]=1'b0;in[12]=1'b0;in[11]=1'b0;in[10]=1'b0;in[9]=1'b0;in[8]=1'b0;in[7]=1'b0;in[6]=1'b0;in[5]=1'b0;in[4]=1'b0;in[3]=1'b0;in[2]=1'b0;in[1]=1'b1;in[0]=1'b0;
#5;
in[15]=1'b0;in[14]=1'b0;in[13]=1'b0;in[12]=1'b0;in[11]=1'b0;in[10]=1'b0;in[9]=1'b0;in[8]=1'b0;in[7]=1'b0;in[6]=1'b0;in[5]=1'b0;in[4]=1'b0;in[3]=1'b0;in[2]=1'b0;in[1]=1'b0;in[0]=1'b1;
#5;
	
end
initial
begin
$dumpfile("encoder_16x4.dump");
$dumpvars(0,encoder_16x4_tb);
end
endmodule


