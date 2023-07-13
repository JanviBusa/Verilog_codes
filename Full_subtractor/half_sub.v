//Design:
 module half_sub(diff,borrow,a,b);
 input a,b;
 wire w1;
 output diff,borrow;
 xor x1(diff,a,b);
 not n1(w1,a);
 and a1(borrow,w1,b);
 endmodule

 
