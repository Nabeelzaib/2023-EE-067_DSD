`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 11:08:01 AM
// Design Name: 
// Module Name: exp5b
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


module exp5b(
  input [3:0] num,  
  input [2:0] sel,  
  output logic [6:0] segments,  
  output logic [7:0] anode    
);

  logic a, b, c, d;
  
  assign a = num[3];  
  assign b = num[2];
  assign c = num[1];
  assign d = num[0];

  always_comb begin
    segments[0] = (~a & ~b & ~c & d) | (~a & b & ~c & ~d) | (a & b & ~c & d) | (a & ~b & c & d);
    segments[1] = (b & c & ~d) | (a & c & d) | (a & b & ~d) | (~a & b & ~c & d);
    segments[2] = (a & b & ~d) | (a & b & c) | (~a & ~b & c & ~d);
    segments[3] = (b & c & d) | (~a & ~b & ~c & d) | (~a & b & ~c & ~d) | (a & ~b & c & ~d);
    segments[4] = (~a & d) | (~b & ~c & d) | (~a & b & ~c);
    segments[5] = (~a & ~b & d) | (~a & ~b & c) | (~a & c & d) | (a & b & ~c & d);
    segments[6] = (~a & ~b & ~c) | (~a & b & c & d) | (a & b & ~c & ~d);
  
    anode[0] = sel[2] | sel[1] | sel[0];
    anode[1] = sel[2] | sel[1] | ~sel[0];
    anode[2] = sel[2] | ~sel[1] | sel[0];
    anode[3] = sel[2] | ~sel[1] | ~sel[0];
    anode[4] = ~sel[2] | sel[1] | sel[0];
    anode[5] = ~sel[2] | sel[1] | ~sel[0];
    anode[6] = ~sel[2] | ~sel[1] | sel[0];
    anode[7] = ~sel[2] | ~sel[1] | ~sel[0];
  end
endmodule

