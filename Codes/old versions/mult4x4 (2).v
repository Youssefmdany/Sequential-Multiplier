module mult4x4(
    input  [3:0] dataa, datab,
    output  [7:0] product
    );
   
    assign product = dataa * datab;
     
endmodule