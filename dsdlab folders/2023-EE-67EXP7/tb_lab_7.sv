`timescale 1ns / 1ps

module tb_seven_seg();
    // Test signals
    logic        write;
    logic [2:0]  select;
    logic [3:0]  num;
    logic        clock;
    logic        reset;
    logic [7:0]  anode;
    logic [6:0]  cathode;
    
    // Instantiate design
    seven_seg dut (.*);
    
    // Clock generation (100MHz)
    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end
    
    initial begin
        // Initialize
        write = 0;
        select = 0;
        num = 0;
        reset = 1;
        
        // Release reset
        #100;
        reset = 0;
        #100;
        
        // Test case 1: Write to display 0
        write = 1;
        select = 0;
        num = 4'h5;  // Display '5'
        #20;
        write = 0;
        #100;
        
        // Test case 2: Write to display 3
        write = 1;
        select = 3;
        num = 4'h9;  // Display '9'
        #20;
        write = 0;
        #100;
        
        // Test case 3: Let it cycle automatically
        #500000;
        
        $finish;
    end
    
    // Monitor output
    initial begin
        $display("Time | Write | Select | Num | Anode  | Cathode");
        $display("---------------------------------------------");
        forever begin
            @(posedge clock);
            $display("%4t | %b     | %3d    | %2d  | %8b | %7b", 
                    $time, write, select, num, anode, cathode);
        end
    end
endmodule