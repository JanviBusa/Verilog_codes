//Design:

module d_latch(e,d,q,p);
input e,d;
output q,p;
wire w1,w2,w3;
and a1(w1,(~d),e);
and a2(w2,e,d);
nor n1(q,w1,p);
nor n2(p,q,w2);
endmodule

//Test Bench:

module d_latch_tb();
reg e,d;
wire q,p;
d_latch d1(e,d,q,p);
initial
begin
	$monitor($time," E=%b D=%b Q=%b Q'=%b",e,d,q,p);
end
initial
begin
	e=1'b0; d=1'b0;
	#5;
	e=1'b0; d=1'b1;
	#5;
	e=1'b1; d=1'b0;
	#5;	
	e=1'b1; d=1'b1;
	#5;	
end
initial
begin
$dumpfile("d_latch.dump");
$dumpvars(0,d_latch_tb);
end
endmodule
