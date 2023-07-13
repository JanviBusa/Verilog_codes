//Design:
 module half_sub(diff,borrow,a,b);
 input a,b;
 wire w1;
 output diff,borrow;
 xor x1(diff,a,b);
 not n1(w1,a);
 and a1(borrow,w1,b);
 endmodule

 //Test Bench:
 
 module half_sub_tb();
 reg a,b;
 wire diff,borrow;
 half_sub h1(diff,borrow,a,b);
 initial
 begin
 $monitor($time," A=%b B=%b Diff=%b Borrow=%b",a,b,diff,borrow);
 end
 initial
 begin
 	a=1'b0; b=1'b0;
 	#5;
	a=1'b0; b=1'b1;
	#5;
	a=1'b1; b=1'b0;
	#5;
	a=1'b1; b=1'b1;
	#5;
 end
 initial
 begin
 $dumpfile("half_sub.dump");
 $dumpvars(0,half_sub_tb);
 end
 endmodule
