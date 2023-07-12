
module multiplier_4by4(input[3:0] dataa, datab, output reg[7:0] product );



always@(*) 

begin 


   product = dataa * datab;


end



endmodule 


module TB();


reg[3:0] a,b;

wire[7:0] r;



initial begin 


a=0;
b=0;


#10


a=2;
b=8;


#10

a=10;
b=5;


#10


a=15;
b=15;




end


multiplier_4by4 mult(.dataa(a),.datab(b),.product(r));


endmodule 