module mult_control #(
                      parameter idle=3'b000,
							 parameter lsb=3'b001,
							 parameter mid=3'b010,
							 parameter msb=3'b011,
							 parameter calc_done=3'b100,
							 parameter err =3'b101
							 )
 

                   (
						  input clk,start,reset_a,
                    input[1:0] count,
                    output  clk_ena,done,sclr_n,
                    output [1:0] input_sel,shift_sel,
                    output reg[2:0] state_out );
						  
						  
						  

	
   	
		
  reg[2:0] curr_state,next_state;
  
  reg curr_clk_ena,next_clk_ena,
      curr_done,next_done,
		curr_sclr_n,next_sclr_n;
		
		
  reg[1:0] curr_input_sel,next_input_sel,
           curr_shift_sel,next_shift_sel;
			  
  
  
  assign clk_ena = curr_clk_ena;
  assign done = curr_done;
  assign sclr_n = curr_sclr_n;
  assign input_sel = curr_input_sel; 
  assign shift_sel = curr_shift_sel ;

  
  always@(posedge clk,posedge reset_a) begin 
  
  
    if(reset_a)begin 
	    
		 curr_state=idle;
	    curr_done<=0;
		 curr_sclr_n<=1;
		 curr_input_sel<=2'bxx;
		 curr_shift_sel<=2'bxx;
	    curr_clk_ena<=0;
	 end
	 
	 
	 else begin 
	 
		 curr_state<=next_state;
	    curr_done<=next_done;
		 curr_sclr_n<=next_sclr_n;
		 curr_input_sel<=next_input_sel;
		 curr_shift_sel<=next_shift_sel;
	    curr_clk_ena<=next_clk_ena;	 
	 
	 end
	   
  
  
  end
  
  
  
  
  
  
  
  
  always@(start,count,curr_state) begin 
  
  		 next_state=curr_state;
	    next_done=curr_done;
		 next_sclr_n=curr_sclr_n;
		 next_input_sel=curr_input_sel;
		 next_shift_sel=curr_shift_sel;
	    next_clk_ena=curr_clk_ena;	 

     case(curr_state) 
	  
	  
	     idle: begin 
		        
				  if(!start)begin
				  
  		               next_state=idle;
	                  next_done=0;
		               next_sclr_n=1;
		               next_input_sel=2'bxx;
		               next_shift_sel=2'bxx;
	                  next_clk_ena=0;	 
				    

				  end
				  
				  else if(start) begin 
				  
  		               next_state=lsb;
	                  next_done=0;
		               next_sclr_n=0;
		               next_input_sel=2'bxx;
		               next_shift_sel=2'bxx;
	                  next_clk_ena=1;	 
		
                   

              end		
		  
		  
		  
		  end
	  




	     lsb: begin 
		        
				  if(start==0 && count==2'b00)begin
				  
  		               next_state=mid;
	                  next_done=0;
		               next_sclr_n=1;
		               next_input_sel=2'b00;
		               next_shift_sel=2'b00;
	                  next_clk_ena=1;	 
				    

				  end
				  
				  else  begin 
				  
  		               next_state=err;
	                  next_done=0;
		               next_sclr_n=1;
		               next_input_sel=2'bxx;
		               next_shift_sel=2'bxx;
	                  next_clk_ena=0;	 
		
                   

              end		
		  
		  
		  
		  end
	



	     mid: begin 
		        
				  if(!start && count==1)begin
				  
  		               next_state=mid;
	                  next_done=0;
		               next_sclr_n=1;
		               next_input_sel=2'b01;
		               next_shift_sel=2'b01;
	                  next_clk_ena=1;	 
				    

				  end
				  
				  else if(!start && count==2) begin 
				  
  		               next_state=msb;
	                  next_done=0;
		               next_sclr_n=1;
		               next_input_sel=2'b10;
		               next_shift_sel=2'b01;
	                  next_clk_ena=1;	 
		
                   

              end		
				  
				  
				  else  begin 
				  
  		               next_state=err;
	                  next_done=0;
		               next_sclr_n=1;
		               next_input_sel=2'bXX;
		               next_shift_sel=2'bXX;
	                  next_clk_ena=0;	 
		
                   

              end		
		  
		  
		  
		  end
		 
		
	
	     msb: begin 
		        
				  if(!start && count==3)begin
				  
  		               next_state=calc_done;
	                  next_done=0;
		               next_sclr_n=1;
		               next_input_sel=2'b11;
		               next_shift_sel=2'b10;
	                  next_clk_ena=1;	 
				    

				  end
				  
				  else  begin 
				  
  		               next_state=err;
	                  next_done=0;
		               next_sclr_n=1;
		               next_input_sel=2'bxx;
		               next_shift_sel=2'bxx;
	                  next_clk_ena=0;	 
		
                   

              end		
		  
		  
		  
		  end	

	


	     calc_done: begin 
		        
				  if(!start)begin
				  
  		               next_state=idle;
	                  next_done=1;
		               next_sclr_n=1;
		               next_input_sel=2'bxx;
		               next_shift_sel=2'bxx;
	                  next_clk_ena=0;	 
				    

				  end
				  
				  else  begin 
				  
  		               next_state=err;
	                  next_done=0;
		               next_sclr_n=1;
		               next_input_sel=2'bxx;
		               next_shift_sel=2'bxx;
	                  next_clk_ena=0;	 
		
                   

              end		
		  
		  
		  
		  end		



	     err: begin 
		        
				  if(start)begin
				  
  		               next_state=lsb;
	                  next_done=0;
		               next_sclr_n=0;
		               next_input_sel=2'bxx;
		               next_shift_sel=2'bxx;
	                  next_clk_ena=1;	 
				    

				  end
				  
				  else  begin 
				  
  		               next_state=err;
	                  next_done=0;
		               next_sclr_n=1;
		               next_input_sel=2'bxx;
		               next_shift_sel=2'bxx;
	                  next_clk_ena=0;	 
		
                   

              end		
		  
		  
		  
		  end		

		  
	  
	  endcase
  
  
  
  
  end
  
  
  
  always@(curr_state) begin 
  
     
	  state_out=curr_state;
  
  
  end
  
  
  
  
  
  
  
  
  endmodule 
  
  
  
  
  /*module TB();
  
  
   reg clk,start,reset_a;
   reg[1:0] count;
   wire clk_ena,done,sclr_n;
   wire[1:0] input_sel,shift_sel;
   wire[2:0] state_out;
  
  
  
  initial begin 
  
  
  
  clk=0;
  
  #10
  
  reset_a=1;
  
  #10
  
  clk=1;
  
  #10
  
  reset_a=0;
  clk=0;

  #10
  
  start=1;
  
  #10
  
   clk=1;
  
  #10
  
  clk=0;
  
  #10
  

  start=1;
  count=2;
  
  
  #10
  
  clk=1;
  
  #10
  
  clk=0;
  
  #10
  

   
  start=1;
  count=0;
  
  #10
  
  clk=1;
  
  #10
  
  clk=0;
  
  #10


  
  start=0;
  count=0;
  
  #10
  
  clk=1;
  
  #10
  
  clk=0;
  
  #10

  

  
  
  #10

  start=0;
  count=1;
  
  #10
  
  clk=1;
  
  #10
  
  clk=0;
  
  #10

  
  
  #10
   

  start=0;
  count=2;
  
  #10
  
  clk=1;
  
  #10
  
  clk=0;
  
  #10

  
  
  #10
  
  
  
  start=0;
  count=3;
  
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
  
  
  mult_control mult_control_test(.clk(clk),
                                 .start(start),
											.reset_a(reset_a),
											.count(count),
											.clk_ena(clk_ena),
											.done(done),
											.sclr_n(sclr_n),
											.input_sel(input_sel),
											.shift_sel(shift_sel),
											.state_out(state_out));
  
  
  
  endmodule */