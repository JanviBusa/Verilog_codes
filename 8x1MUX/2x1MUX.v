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

