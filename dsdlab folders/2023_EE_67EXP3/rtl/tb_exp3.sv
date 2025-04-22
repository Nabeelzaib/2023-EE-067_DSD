`timescale 1 ns / 10 ps
module exp3_tb();
  logic A;
  logic B;
  logic C;
  logic X;
  logic Y;

exp3 UUT(
    .a(A),
    .b(B),
    .c(C),
    .x(X),
    .y(Y)
);

initial
begin
	A = 0; B = 0; C = 0;
	#10;
	A = 0; B = 0; C = 1;
	#10;
	A = 0; B = 1; C = 0;
	#10;
	A = 0; B = 1; C = 1;
	#10;
	A = 1; B = 0; C = 0;
	#10;
	A = 1; B = 0; C = 1;
	#10;
	A = 1; B = 1; C = 0;
	#10;
	A = 1; B = 1; C = 1;
	#10;
	$stop;
end

initial 
begin
	$monitor("x=%b, y=%b, a=%b, b=%b, c=%b", X, Y, A, B, C);	
end
endmodule
