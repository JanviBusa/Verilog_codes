//Design

module mealy_non_overlapping_101111 (input clk, rst, x, output z);
  parameter s0 = 3'b000;
  parameter s1 = 3'b001;
  parameter s2 = 3'b010;
  parameter s3 = 3'b011;
  parameter s4 = 3'b100; 
  parameter s5 = 3'b101;
  
  reg [3:0] state, next_state;
  
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
           if(x == 0) next_state = s2;
           else       next_state = s1;
         end
      s2: begin
           if(x == 0) next_state = s0;
           else       next_state = s3;
         end
      s3: begin
           if(x == 0) next_state = s2;
           else       next_state = s4;
         end
      s4: begin
           if(x == 0) next_state = s2;
           else       next_state = s5; 
         end
      s5: begin
           if(x == 0) next_state = s0;
           else       next_state = s0;
         end
      default: next_state = s0;
    endcase
  end
  assign z = (state == s5)? 1:0;
endmodule
