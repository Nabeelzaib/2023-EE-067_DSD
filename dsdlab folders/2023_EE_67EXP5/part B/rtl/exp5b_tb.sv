`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 11:17:56 AM
// Design Name: 
// Module Name: exp5b_tb
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


module exp5b_tb;
    logic [3:0] num;
    logic [2:0] sel;
    logic [6:0] segments;
    logic [7:0] anode;

     exp5b uut(
        .num(num),
        .sel(sel),
        .segments(segments),
        .anode(anode)
     );

    task driver(input logic [3:0] NUM = $random % 16, input logic [2:0] SEL = $random % 8);
        begin
            num = NUM;
            sel = SEL;
            #10;
        end
    endtask

    task direct_test(input logic [3:0] NUM, input logic [2:0] SEL);
        begin
            driver(NUM, SEL);
            monitor();
        end
    endtask

    task random_test(input int n);
        begin
            for (int i = 0; i < n; i++) begin
                driver();
                monitor();
            end
        end
    endtask  
  function [6:0] expected_segments(input [3:0] NUM);
        case (NUM)
            4'h0: expected_segments = 7'b0000001;
            4'h1: expected_segments = 7'b1001111;
            4'h2: expected_segments = 7'b0010010;
            4'h3: expected_segments = 7'b0000110;
            4'h4: expected_segments = 7'b1001100;
            4'h5: expected_segments = 7'b0100100;
            4'h6: expected_segments = 7'b0100000;
            4'h7: expected_segments = 7'b0001111;
            4'h8: expected_segments = 7'b0000000;
            4'h9: expected_segments = 7'b0000100;
            4'hA: expected_segments = 7'b0001000;
            4'hB: expected_segments = 7'b1100000;
            4'hC: expected_segments = 7'b0110001;
            4'hD: expected_segments = 7'b1000010;
            4'hE: expected_segments = 7'b0110000;
            4'hF: expected_segments = 7'b0111000;
            default: expected_segments = 7'b1111111;
        endcase
    endfunction

    function [7:0] expected_anode(input [2:0] SEL);
        case (SEL)
            3'b000: expected_anode = 8'b11111110;
            3'b001: expected_anode = 8'b11111101;
            3'b010: expected_anode = 8'b11111011;
            3'b011: expected_anode = 8'b11110111;
            3'b100: expected_anode = 8'b11101111;
            3'b101: expected_anode = 8'b11011111;
            3'b110: expected_anode = 8'b10111111;
            3'b111: expected_anode = 8'b01111111;
            default: expected_anode = 8'b11111111;
        endcase
    endfunction
 task monitor();
        logic [6:0] expected_seg;
        logic [7:0] expected_anode_val;

        begin
            expected_seg = expected_segments(num);
            expected_anode_val = expected_anode(sel);

            assert (segments === expected_seg) 
                else $error("Mismatch! num=%h sel=%b | Expected Segments=%b, Got=%b", num, sel, expected_seg, segments);
            
            assert (anode === expected_anode_val) 
                else $error("Mismatch! sel=%b | Expected Anode=%b, Got=%b", sel, expected_anode_val, anode);
            
            $display("PASS: num=%h sel=%b | Segments=%b Anode=%b", num, sel, segments, anode);
        end    
    endtask

    initial begin
        $display("Starting Seven-Segment Display Testbench...\n");

        direct_test(4'h0, 3'b000);
        direct_test(4'hF, 3'b111);
        direct_test(4'h5, 3'b010);
        direct_test(4'hA, 3'b101);

        random_test(10);

        $display("\nAll tests completed successfully!");
        $finish;    
    end
   
endmodule