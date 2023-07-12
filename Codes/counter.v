module counter(input clk, aclr_n,output reg[1:0] count_out );



always@(posedge clk) 

begin 


    if(!aclr_n)
	     
		  count_out=0;
		  
	 else 
	 
		  count_out = count_out+1;
	 
	    

   

end



endmodule 


/*module TB();


reg clk,reset;


wire[1:0] count_out;



initial begin 

clk=0;

reset=0;

#10

clk=1;

#5

reset=1;

#10

clk=0;

#10

clk=1;

#10

clk=0;

#10

clk=1;

#10

clk=0;

#10

clk=1;


#10

clk=0;

#10

clk=1;





end


counter counter_test(.clk(clk),.aclr_n(reset),.count_out(count_out));


endmodule */