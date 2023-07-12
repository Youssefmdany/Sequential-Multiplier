
module Top(input[7:0] dataa,datab,
           input start, reset_a,clk,
           output wire done_flag,
			  output wire[15:0] product8by8_out,
			  output wire  seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g);


wire clk_ena,sclr_n;
			  
wire[1:0] count,sel,shift;

wire[2:0] state_out;			  

wire[7:0] product;

wire[15:0] shift_out,sum;

wire[3:0] aout,bout;		  
			  
mult_control mult_control_ins(.clk(clk),.reset_a(reset_a),.start(start),.count(count),.input_sel(sel),.shift_sel(shift),.done(done_flag),.state_out(state_out),.clk_ena(clk_ena),.sclr_n(sclr_n));


counter counter_ins(.clk(clk),.aclr_n(!start),.count_out(count));


shifter shifter_ins(.inp(product),.shift_cntrl(shift),.shift_out(shift_out));


adder adder_ins(.dataa(shift_out),.datab(product8by8_out),.sum(sum));


mult4x4 mult4x4_ins(.dataa(aout[3:0]),.datab(bout[3:0]),.product(product));


reg16 reg16_ins(.clk(clk),.sclr_n(sclr_n),.clk_ena(clk_ena),.datain(sum),.reg_out(product8by8_out));


mux4 mux4_ins1(.mux_in_a(dataa[3:0]),.mux_in_b(dataa[7:4]),.mux_sel(sel[1]),.mux_out(aout));


mux4 mux4_ins2(.mux_in_a(datab[3:0]),.mux_in_b(datab[7:4]),.mux_sel(sel[0]),.mux_out(bout));


seven_segment_cntrl seven_segment_cntrl_ins(.in(state_out),
                                            .seg_a(seg_a),
														  .seg_b(seg_b),
														  .seg_c(seg_c),
														  .seg_d(seg_d),
														  .seg_e(seg_e),
														  .seg_f(seg_f),
														  .seg_g(seg_g) );

endmodule 





module TB();



reg[7:0] dataa,datab;

reg start, reset_a,clk;

wire done_flag;

wire[15:0] product8by8_out;

wire seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g;


initial begin 

reset_a=0;

#10

reset_a=1;
dataa=10;
datab=20;

#10

reset_a=0;


#10

clk=0;
start=1;

#10


  
  clk=1;
  
  #10
  
  clk=0;
  
  #10
  



  
  start=0;
  
  #10
  
  clk=1;
  
  #10
  
  clk=0;
  

  
  
  #10

  start=0;
  
  #10
  
  clk=1;
  
  #10
  
  clk=0;
  
  #10

  
  
  #10
   

  start=0;
  
  #10
  
  clk=1;
  
  #10
  
  clk=0;
  
  #10

  
  
  #10
  
  
  
  start=0;
  
  #10
  
  clk=1;
  
  #10
  
  clk=0;
  
  #10

  
  
  #10
  
  
  start=0;
 
  
   #10
  
  clk=1;
  
  #10
  
  clk=0;





end



Top Top_test(.dataa(dataa),
             .datab(datab),
				 .start(start),
				 .reset_a(reset_a),
				 .clk(clk),
				 .done_flag(done_flag),
				 .product8by8_out(product8by8_out),
				 .seg_a(seg_a),
				 .seg_b(seg_b),
				 .seg_c(seg_c),
				 .seg_d(seg_d),
				 .seg_e(seg_e),
				 .seg_f(seg_f),
				 .seg_g(seg_g) );


endmodule 
