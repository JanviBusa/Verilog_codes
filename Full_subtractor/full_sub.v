//Design:

module full_sub(diff,borrow,a,b,cin);
input a,b,cin;
output diff,borrow;
/*wire w1,w2,w3;

half_sub h1(w1,w2,a,b);
half_sub h2(diff,w3,w1,cin);
or (borrow,w2,w3);
*/
assign diff=(((~a)&(~b)&cin) | ((~a)&b&(~cin)) | (a&(~b)&(~cin)) | (a&b&cin));
assign borrow=(((~a)&cin) | ((~a)&b) | (b&cin));
endmodule

//Test Bench:
module full_sub_tb();
reg a,b,cin;
wire diff,borrow;
full_sub f1(diff,borrow,a,b,cin);
initial
begin
$monitor($time," A=%b B=%b Cin=%b Diff=%b Borrow=%b",a,b,cin,diff,borrow);
end
initial
begin
	a=1'b0; b=1'b0; cin=1'b0;
	#5;
	a=1'b0; b=1'b0; cin=1'b1;
	#5;
	a=1'b0; b=1'b1; cin=1'b0;
	#5;
	a=1'b0; b=1'b1; cin=1'b1;
	#5;
	a=1'b1; b=1'b0; cin=1'b0;
	#5;
	a=1'b1; b=1'b0; cin=1'b1;
	#5;
	a=1'b1; b=1'b1; cin=1'b0;
	#5;
	a=1'b1; b=1'b1; cin=1'b1;
	#5;
end
initial
begin
$dumpfile("full_sub.dump");
$dumpvars(0,full_sub_tb);
end
endmodule
