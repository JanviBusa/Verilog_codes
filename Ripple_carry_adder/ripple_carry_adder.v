//Design

module ripple_adder(X,Y,S,Co);
 input [3:0] X, Y;
 output [3:0] S;
 output Co;
 wire w1, w2, w3;
 full_adder u1(X[0], Y[0],1'b0, S[0], w1);
 full_adder u2(X[1], Y[1], w1, S[1], w2);
 full_adder u3(X[2], Y[2], w2, S[2], w3);
 full_adder u4(X[3], Y[3], w3, S[3], Co);
endmodule

//Test Bench

module ripple_adder_tb();
reg [3:0]X, Y;
wire [3:0]S;
wire Co;
ripple_adder r1(X,Y,S,Co);
initial
begin
$monitor($time," X0=%b X1=%b X2=%b X3=%b Y4=%b Y3=%b Y2=%b Y1=%b S4=%b S3=%b S2=%b S1=%b Carry=%b",X[0],X[1],X[2],X[3],Y[3],Y[2],Y[1],Y[0],S[3],S[2],S[1],S[0],Co);
end
initial
begin
	X[0]=1'b0; X[1]=1'b0; X[2]=1'b0; X[3]=1'b0; Y[3]=1'b0; Y[2]=1'b0; Y[1]=1'b0; Y[0]=1'b0;
	#5;
	X[0]=1'b0; X[1]=1'b1; X[2]=1'b0; X[3]=1'b0; Y[3]=1'b0; Y[2]=1'b1; Y[1]=1'b0; Y[0]=1'b0;
	#5;
	X[0]=1'b1; X[1]=1'b0; X[2]=1'b0; X[3]=1'b0; Y[3]=1'b1; Y[2]=1'b0; Y[1]=1'b0; Y[0]=1'b0;
	#5;
	X[0]=1'b1; X[1]=1'b0; X[2]=1'b1; X[3]=1'b0; Y[3]=1'b1; Y[2]=1'b0; Y[1]=1'b1; Y[0]=1'b0;
	#5;
	X[0]=1'b1; X[1]=1'b1; X[2]=1'b0; X[3]=1'b0; Y[3]=1'b1; Y[2]=1'b1; Y[1]=1'b0; Y[0]=1'b0;
	#5;
	X[0]=1'b1; X[1]=1'b1; X[2]=1'b1; X[3]=1'b0; Y[3]=1'b1; Y[2]=1'b1; Y[1]=1'b1; Y[0]=1'b0;
	#5;
	X[0]=1'b1; X[1]=1'b1; X[2]=1'b1; X[3]=1'b1; Y[3]=1'b1; Y[2]=1'b1; Y[1]=1'b1; Y[0]=1'b1;
	#5;
end
initial
begin
$dumpfile("ripple_adder.dump");
$dumpvars(0,ripple_adder_tb);
end
endmodule
