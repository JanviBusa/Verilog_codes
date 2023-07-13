//Design:
module mux_2x1(out,sel,a,b);
input a,b,sel;
output out;
wire w1,w2,w3;
not(w1,sel);
and(w2,a,w1);
and(w3,b,sel);
or(out,w2,w3);
endmodule
//Test Bench:
module mux_2x1_tb();
//variables
reg a,b,sel;
wire out;
//to instantiate
mux_2x1 m1(out,sel,a,b);
initial
begin
$monitor($time," SEL=%b A=%b B=%b OUT=%b",sel,a,b,out);
end
initial
begin
	sel=1'b0; a=1'b0; b=1'b0;
	#5 
	sel=1'b1; a=1'b0; b=1'b1;
	#5
        sel=1'b0; a=1'b1; b=1'b0;
	#5 
	sel=1'b1; a=1'b1; b=1'b1;
end
initial
begin
$dumpfile("mux_2x1.dump");
$dumpvars(0,mux_2x1_tb);
end
endmodule
