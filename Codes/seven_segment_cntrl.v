module seven_segment_cntrl
(
  input [2:0] in,
  output reg seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g

                              );
reg [6:0] seg;
always @(*)
begin
seg={seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g};
  case(in)
           3'b000: seg=7'b1111110;
           3'b001: seg=7'b0110000;
           3'b010: seg=7'b1101101;
           3'b011: seg=7'b1111001;
          default: seg=7'b1001111; 
  endcase
{seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g}=seg;

end
endmodule