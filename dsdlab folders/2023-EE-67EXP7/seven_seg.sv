`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 09:50:14 PM
// Design Name: 
// Module Name: seven_seg
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

module seven_seg(
    input  logic        write,
    input  logic [2:0]  select,
    input  logic [3:0]  num,
    input  logic        clock,
    input  logic        reset,
    output logic [7:0]  anode,
    output logic [6:0]  cathode
);
    logic [3:0] display_data [0:7];
    logic [2:0] current_display;
    logic [16:0] counter;
    logic [2:0]  display_num;
    
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            counter <= 0;
            display_num <= 0;
        end
        else begin
            counter <= counter + 1;
            if (&counter) begin
                counter <= 0;
                display_num <= display_num + 1;
            end
        end
    end
    
    always_ff @(posedge clock) begin
        if (reset) begin
            for (int i=0; i<8; i++)
                display_data[i] <= 4'h0;
        end
        else if (write) begin
            display_data[select] <= num;
        end
    end

    assign current_display = write ? select : display_num;

    always_comb begin
        anode = 8'b11111111;
        anode[current_display] = 1'b0;
    end
    
    always_comb begin
        case(display_data[current_display])
            4'h0: cathode = 7'b0111111;
            4'h1: cathode = 7'b0000110;
            4'h2: cathode = 7'b1011011;
            4'h3: cathode = 7'b1001111;
            4'h4: cathode = 7'b1100110;
            4'h5: cathode = 7'b1101101;
            4'h6: cathode = 7'b1111101;
            4'h7: cathode = 7'b0000111;
            4'h8: cathode = 7'b1111111;
            4'h9: cathode = 7'b1101111;
            4'hA: cathode = 7'b1110111;
            4'hB: cathode = 7'b1111100;
            4'hC: cathode = 7'b0111001;
            4'hD: cathode = 7'b1011110;
            4'hE: cathode = 7'b1111001;
            4'hF: cathode = 7'b1110001;
            default: cathode = 7'b1000000;
        endcase
    end
endmodule
