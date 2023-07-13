//Design:

module half_adder(sum,carry,in1,in2);
input in1,in2;
output sum,carry;
xor x1(sum,in1,in2);
and a1(carry,in1,in2);
endmodule

//Test Bench:
/*
module half_adder_tb();
reg in1,in2;
wire sum,carry;
half_adder h1(sum,carry,in1,in2);
initial
begin
$monitor($time," X=%b Y=%b SUM=%b CARRY=%b",in1,in2,sum,carry);
end
initial
begin
	in1=1'b0; in2=1'b0;
	#5;
	in1=1'b0; in2=1'b1;
	#5;
	in1=1'b1; in2=1'b0;
	#5;
	in1=1'b1; in2=1'b1;
	#5;
end
initial
begin
$dumpfile("half_adder.dump");
$dumpvars(0,half_adder_tb);
end
endmodule
*/
