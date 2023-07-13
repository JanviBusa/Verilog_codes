//Design

/*module encoder_8x3(Y0,Y1,Y2,D0,D1,D2,D3,D4,D5,D6,D7);
input D0,D1,D2,D3,D4,D5,D6,D7;
output Y0,Y1,Y2;
assign Y0=D1|D3|D5|D7;
assign Y1=D2|D3|D6|D7;
assign Y2=D4|D5|D6|D7;
endmodule*/
module encoder_8x3(input [7:0] in,output reg [2:0] out);

  always @ (*) begin
    case(in)
      8'b00000001: out = 3'b000;
      8'b00000010: out = 3'b001;
      8'b00000100: out = 3'b010;
      8'b00001000: out = 3'b011;
      8'b00010000: out = 3'b100;
      8'b00100000: out = 3'b101;
      8'b01000000: out = 3'b110;
      8'b10000000: out = 3'b111;
      default: out = 3'b000; 
    endcase
  end

endmodule

//Test Bench:

/*module encoder_8x3_tb();
reg D0,D1,D2,D3,D4,D5,D6,D7;
wire Y0,Y1,Y2;
encoder_8x3 en1(Y0,Y1,Y2,D0,D1,D2,D3,D4,D5,D6,D7);
initial
begin
$monitor($time," D0=%b D1=%b D2=%b D3=%b D4=%b D5=%b D6=%b D7=%b Y0=%b Y1=%b Y2=%b",D0,D1,D2,D3,D4,D5,D6,D7,Y0,Y1,Y2);
end
initial
begin
	D0=1'b1; D1=1'b0; D2=1'b0; D3=1'b0; D4=1'b0; D5=1'b0; D6=1'b0; D7=1'b0;
	#5;
	D0=1'b0; D1=1'b1; D2=1'b0; D3=1'b0; D4=1'b0; D5=1'b0; D6=1'b0; D7=1'b0;
	#5;
	D0=1'b0; D1=1'b0; D2=1'b1; D3=1'b0; D4=1'b0; D5=1'b0; D6=1'b0; D7=1'b0;
	#5;
	D0=1'b0; D1=1'b0; D2=1'b0; D3=1'b1; D4=1'b0; D5=1'b0; D6=1'b0; D7=1'b0;
	#5;
	D0=1'b0; D1=1'b0; D2=1'b0; D3=1'b0; D4=1'b1; D5=1'b0; D6=1'b0; D7=1'b0;
	#5;
	D0=1'b0; D1=1'b0; D2=1'b0; D3=1'b0; D4=1'b0; D5=1'b1; D6=1'b0; D7=1'b0;
	#5;
	D0=1'b0; D1=1'b0; D2=1'b0; D3=1'b0; D4=1'b0; D5=1'b0; D6=1'b1; D7=1'b0;
	#5;
	D0=1'b0; D1=1'b0; D2=1'b0; D3=1'b0; D4=1'b0; D5=1'b0; D6=1'b0; D7=1'b1;
	#5;
end
initial
begin
$dumpfile("encoder_8x3.dump");
$dumpvars(0,encoder_8x3_tb);
end
endmodule*/
module encoder_8x3_tb();
  reg [7:0] in;
  wire [2:0] out;

encoder_8x3 en1(.in(in),.out(out));

integer i;
initial begin
$monitor($time," D7=%b D6=%b D5=%b D4=%b D3=%b D2=%b D1=%b D0=%b out[2]=%b out[1]=%b out[0]=%b",in[7],in[6],in[5],in[4],in[3],in[2],in[1],in[0],out[2],out[1],out[0]);
end
initial
begin
	in[0]=1'b1; in[1]=1'b0; in[2]=1'b0; in[3]=1'b0; in[4]=1'b0; in[5]=1'b0; in[6]=1'b0; in[7]=1'b0;
	#5;
	in[0]=1'b0; in[1]=1'b1; in[2]=1'b0; in[3]=1'b0; in[4]=1'b0; in[5]=1'b0; in[6]=1'b0; in[7]=1'b0;
	#5;
	in[0]=1'b0; in[1]=1'b0; in[2]=1'b1; in[3]=1'b0; in[4]=1'b0; in[5]=1'b0; in[6]=1'b0; in[7]=1'b0;
	#5;
	in[0]=1'b0; in[1]=1'b0; in[2]=1'b0; in[3]=1'b1; in[4]=1'b0; in[5]=1'b0; in[6]=1'b0; in[7]=1'b0;
	#5;
	in[0]=1'b0; in[1]=1'b0; in[2]=1'b0; in[3]=1'b0; in[4]=1'b1; in[5]=1'b0; in[6]=1'b0; in[7]=1'b0;
	#5;
	in[0]=1'b0; in[1]=1'b0; in[2]=1'b0; in[3]=1'b0; in[4]=1'b0; in[5]=1'b1; in[6]=1'b0; in[7]=1'b0;
	#5;
	in[0]=1'b0; in[1]=1'b0; in[2]=1'b0; in[3]=1'b0; in[4]=1'b0; in[5]=1'b0; in[6]=1'b1; in[7]=1'b0;
	#5;
	in[0]=1'b0; in[1]=1'b0; in[2]=1'b0; in[3]=1'b0; in[4]=1'b0; in[5]=1'b0; in[6]=1'b0; in[7]=1'b1;
	#5;
end
  
initial begin
$dumpfile("encoder_8x3.dump");
$dumpvars(0,encoder_8x3_tb);
end
endmodule
