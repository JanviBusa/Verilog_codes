//Design:

module fbfull_adder(a,b,Cin,s,Co);
input [3:0]a,b;
input Cin;
output [3:0]s;
output Co;
assign {Co,s}=a+b+Cin;
endmodule

//Test Bench:

module fbfull_adder_tb();
reg [3:0]a,b;
reg Cin;
wire [3:0]s;
wire Co;
fbfull_adder f1(a,b,Cin,s,Co);
initial
begin
	$monitor($time," A=%b B=%b Cin=%b Sum=%b Co=%b",a,b,Cin,s,Co);
end
/*initial
begin
	a[0]=1'b0; 
*/
initial 
begin
a = 0;
b = 0;
Cin = 0;
#5;

a = 2;
b = 3;
Cin = 1;
#5;

a = 2;
b = 2;
Cin = 0;
#5;

end
initial 
begin
$dumpfile("fbfull_adder.dump");
$dumpvars(0,fbfull_adder_tb);
end
endmodule

