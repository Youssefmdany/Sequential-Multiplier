module mux4(input[3:0] mux_in_a,mux_in_b,input mux_sel, output [3:0] mux_out );



assign mux_out = mux_sel ? mux_in_b : mux_in_a;


endmodule 





/*module TB();


reg[3:0] a,b;

reg sel;

wire[3:0] r;





initial begin 


a=5;
b=10;
sel=0;


#10


a=5;
b=10;
sel=1;




end


mux4 mux4_test(.mux_in_a(a),.mux_in_b(b),.mux_sel(sel),.mux_out(r));


endmodule */