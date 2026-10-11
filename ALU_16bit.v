`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2026 17:10:40
// Design Name: 
// Module Name: ALU_16bit
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


module ALU_16bit(
    input [15:0] A,
    input [15:0] B,
    input [3:0] opcode,

    output reg [15:0] result,
    output reg carry,
    output reg zero,
    output reg sign,
    output reg overflow
);

always @(*) begin

    carry = 0;
    overflow = 0;

    case(opcode)

        4'b0000: begin
            {carry,result} = A + B;
            overflow =
            (~A[15] & ~B[15] & result[15]) |
            (A[15] & B[15] & ~result[15]);
        end

        4'b0001: begin
            {carry,result} = A - B;
            overflow =
            (~A[15] & B[15] & result[15]) |
            (A[15] & ~B[15] & ~result[15]);
        end

        4'b0010: result = A & B;
        4'b0011: result = A | B;
        4'b0100: result = A ^ B;
        4'b0101: result = ~A;
        4'b0110: result = A + 1;
        4'b0111: result = A - 1;
        4'b1000: result = A << 1;
        4'b1001: result = A >> 1;
        default: result = 16'b0;

    endcase

    zero = (result == 16'b0);
    sign = result[15];

end
endmodule
