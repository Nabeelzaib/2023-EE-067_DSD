`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 10:46:48 AM
// Design Name: 
// Module Name: exp5
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


module exp5(
    input  logic [3:0] num,            // 4-bit input number (0-F)
    input  logic [2:0] sel,            // 3-bit selector for choosing display
    output logic [6:0] segments,       // 7-segment output (A-G, active-low)
    output logic [7:0] anode           // Anode control for 8 displays (active-low)
);

    // Seven-Segment Decoder Logic
    always_comb begin
        case (num)
            4'h0: segments = 7'b0000001;
            4'h1: segments = 7'b1001111;
            4'h2: segments = 7'b0010010;
            4'h3: segments = 7'b0000110;
            4'h4: segments = 7'b1001100;
            4'h5: segments = 7'b0100100;
            4'h6: segments = 7'b0100000;
            4'h7: segments = 7'b0001111;
            4'h8: segments = 7'b0000000;
            4'h9: segments = 7'b0000100;
            4'hA: segments = 7'b0001000;
            4'hB: segments = 7'b1100000;
            4'hC: segments = 7'b0110001;
            4'hD: segments = 7'b1000010;
            4'hE: segments = 7'b0110000;
            4'hF: segments = 7'b0111000;
            default: segments = 7'b1111111; // Turn off all segments if invalid input
        endcase
    end
    
    // Anode Control Logic (Active-Low)
    always_comb begin
        case (sel)
            3'b000: anode = 8'b11111110; 
            3'b001: anode = 8'b11111101;
            3'b010: anode = 8'b11111011; 
            3'b011: anode = 8'b11110111; 
            3'b100: anode = 8'b11101111;
            3'b101: anode = 8'b11011111; 
            3'b110: anode = 8'b10111111; 
            3'b111: anode = 8'b01111111; 
            default: anode = 8'b11111111; // Turn off all displays
        endcase
    end

endmodule
