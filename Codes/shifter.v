//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2023 01:39:36 AM
// Design Name: 
// Module Name: shifter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module shifter(
    input [7:0] inp,
    input [1:0] shift_cntrl,
    output reg [15:0] shift_out 
    );
    
    always@(inp, shift_cntrl)
     begin
    case(shift_cntrl)
    2'b00: shift_out = inp;        //no shift
    2'b01: shift_out = inp << 4 ; //4 bits shift left 
    2'b10: shift_out = inp << 8 ; //8 bits shift left
    2'b11: shift_out = inp;       //no shift
    default: shift_out = 16'bx;
    endcase
    end
    
endmodule