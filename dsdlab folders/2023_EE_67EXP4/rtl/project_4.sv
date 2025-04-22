`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2025 08:55:49 PM
// Design Name: 
// Module Name: project_4
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



`timescale 1ns / 1ps

`timescale 1ns / 1ps

module project_4(
    input wire [1:0] a, b, 
    output wire R, G, B    
);

    assign R = (~b[1] & ~b[0]) | (a[1] & a[0]) | (a[1] & ~b[1]) | (a[0] & ~b[1] & b[0]);
    assign G = (~a[1] & b[1]) | (~a[1] & ~b[1] & b[0]) | (~a[0] & ~a[1]) | (a[1] & ~a[0] & b[1]);
    assign B = (a[1] ^ b[1]) | (a[0] ^ b[0]);

endmodule
