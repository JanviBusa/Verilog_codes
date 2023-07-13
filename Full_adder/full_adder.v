//Design:

module full_adder(sum,carry_out,a,b,carry_in);
output sum,carry_out;
input a,b,carry_in;
/*
wire w1,w2,w3;
half_adder ha1(w1,w2,a,b);
half_adder ha2(sum,w3,w1,carry_in);
or(carry_out,w2,w3);
*/
assign sum=(((~a)&(~b)&carry_in) | (b&(~a)&(~carry_in)) | (a&(~b)&(~carry_in)) | (a&b&carry_in));
assign carry_out=(((~a)&b&carry_in) | (a&(~b)&carry_in) | (a&b&(~carry_in))| (a&b&carry_in));
endmodule

//Test Bench:

module full_adder_tb();
reg a,b,carry_in;
wire sum,carry_out;
full_adder f1(sum,carry_out,a,b,carry_in);
initial
begin
$monitor($time," A=%b B=%b Cin=%b SUM=%b Carry=%b",a,b,carry_in,sum,carry_out);
end
initial
begin
	a=1'b0; b=1'b0; carry_in=1'b0;
	#5;
	a=1'b0; b=1'b0; carry_in=1'b1;
	#5;
	a=1'b0; b=1'b1; carry_in=1'b0;
	#5;
	a=1'b0; b=1'b1; carry_in=1'b1;
	#5;
	a=1'b1; b=1'b0; carry_in=1'b0;
	#5;
	a=1'b1; b=1'b0; carry_in=1'b1;
	#5;
	a=1'b1; b=1'b1; carry_in=1'b0;
	#5;
	a=1'b1; b=1'b1; carry_in=1'b1;
	#5;
end
initial
begin
$dumpfile("full_adder.dump");
$dumpvars(0,full_adder_tb);
end
endmodule

