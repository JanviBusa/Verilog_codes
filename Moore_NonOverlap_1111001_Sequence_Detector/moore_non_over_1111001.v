//Design

module moore_non_overlapping_1111001 (input clk, rst, x, output z);
  parameter s0 = 3'b000;
  parameter s1 = 3'b001;
  parameter s2 = 3'b010;
  parameter s3 = 3'b011;
  parameter s4 = 3'b100; 
  parameter s5 = 3'b101;
  parameter s6 = 3'b110; 
  parameter s7 = 3'b111;
  
  reg [2:0] state, next_state;
  
  always @(posedge clk or posedge rst) begin
    if(rst) begin 
      state <= s0;
    end
    else state <= next_state;
  end
  
  always @(state or x) begin
    case(state)
      s0: begin
           if(x == 0) next_state = s0;
           else       next_state = s1;
         end
      s1: begin
           if(x == 0) next_state = s0;
           else       next_state = s2;
         end
      s2: begin
           if(x == 0) next_state = s0;
           else       next_state = s3;
         end
      s3: begin
           if(x == 0) next_state = s0;
           else       next_state = s4;
         end
      s4: begin
           if(x == 0) next_state = s5;
           else       next_state = s4; 
         end
      s5: begin
           if(x == 0) next_state = s6;
           else       next_state = s1;
         end
      s6: begin
           if(x == 0) next_state = s0;
           else       next_state = s7; 
         end
      s7: begin
           if(x == 0) next_state = s0;
           else       next_state = s1;
         end
      default: next_state = s0;
    endcase
  end
  assign z = (state == s7)? 1:0;
endmodule
