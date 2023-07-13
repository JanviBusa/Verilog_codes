`include "3x8_decoder.v"
//Design:

module decoder_4x16(in,e,a);
input [2:0]in;
input e;
output [15:0]a;
decoder_3x8 de1(a[7:0],in[2:0],e);
decoder_3x8 de2(a[15:8],in[2:0],(~e));
endmodule

//Test Bench:

module decoder_4x16_tb();
reg [2:0]in;
reg e;
wire [15:0]a;
decoder_4x16 d1(in,e,a);
integer i;
initial
begin
$monitor($time," E=%b A0=%b A1=%b A2=%b D0=%b D1=%b D2=%b D3=%b D4=%b D5=%b D6=%b D7=%b D8=%b D9=%b D10=%b D11=%b D12=%b D13=%b D14=%b D15=%b",e,in[0],in[1],in[2],a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12],a[13],a[14],a[15]);
for (i =0; i<16; i = i + 1) begin
  e =1'b0;
  {in} = i;
  #10;
  end
  $finish;
end
/*initial
begin
	e=1'b0; in[2]=1'b0; in[1]=1'b0; in[0]=1'b0; 
	#5;
	e=1'b0;in[2]=1'b0; in[1]=1'b0; in[0]=1'b1;
	#5;
	e=1'b0; in[2]=1'b0; in[1]=1'b1; in[0]=1'b0; 
	#5;
	e=1'b0; in[2]=1'b0; in[1]=1'b1; in[0]=1'b1; 
	#5;
	e=1'b0; in[2]=1'b1; in[1]=1'b0; in[0]=1'b0; 
	#5;
	e=1'b0; in[2]=1'b1; in[1]=1'b0; in[0]=1'b1; 
	#5;
	e=1'b0; in[2]=1'b1; in[1]=1'b1; in[0]=1'b0; 
	#5;
	e=1'b0; in[2]=1'b1; in[1]=1'b1; in[0]=1'b1; 
	#5;
	e=1'b1; in[2]=1'b0; in[1]=1'b0; in[0]=1'b0; 
	#5;
	e=1'b1; in[2]=1'b0; in[1]=1'b0; in[0]=1'b1; 
	#5;
	e=1'b1; in[2]=1'b0; in[1]=1'b1; in[0]=1'b0; 
	#5;
	e=1'b1; in[2]=1'b0; in[1]=1'b1; in[0]=1'b1; 
	#5;
	e=1'b1; in[2]=1'b1; in[1]=1'b0; in[0]=1'b0;
	#5;
	e=1'b1; in[2]=1'b1; in[1]=1'b0; in[0]=1'b1; 
	#5;
	e=1'b1; in[2]=1'b1; in[1]=1'b1; in[0]=1'b0; 
	#5;
	e=1'b1; in[2]=1'b1; in[1]=1'b1; in[0]=1'b1; 
	#5;
end*/
initial
begin
$dumpfile("decoder_4x16.dump");
$dumpvars(0,decoder_4x16_tb);
end
endmodule
