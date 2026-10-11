`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2026 17:15:22
// Design Name: 
// Module Name: ALU_16bit_tb
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


module testbench;

reg [15:0] A;
reg [15:0] B;
reg [3:0] opcode;

wire [15:0] result;
wire carry;
wire zero;
wire sign;
wire overflow;

ALU_16bit uut(
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .carry(carry),
    .zero(zero),
    .sign(sign),
    .overflow(overflow)
);

initial begin

    $display("TIME\tOPCODE\tA\tB\tRESULT\tCARRY\tZERO\tSIGN\tOVERFLOW");
    $monitor("%0t\t%b\t%d\t%d\t%d\t%b\t%b\t%b\t%b",
             $time, opcode, A, B,
             result, carry, zero, sign, overflow);

    A = 100;
    B = 50;

    opcode = 4'b0000; #10;   // ADD
    opcode = 4'b0001; #10;   // SUB
    opcode = 4'b0010; #10;   // AND
    opcode = 4'b0011; #10;   // OR
    opcode = 4'b0100; #10;   // XOR
    opcode = 4'b0101; #10;   // NOT
    opcode = 4'b0110; #10;   // INC
    opcode = 4'b0111; #10;   // DEC
    opcode = 4'b1000; #10;   // LEFT SHIFT
    opcode = 4'b1001; #10;   // RIGHT SHIFT

    $finish;

end

endmodule
