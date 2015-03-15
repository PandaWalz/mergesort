//Lorenzo Walz and Patrick Paschal
//ECE464 - Spring 2015
//Mergesort Final Project - Testbench

module twobytesort_test;

reg reset, clock;
reg [7:0] word1,word2;
wire [7:0] left,right;

always #5 clock = ~clock;

initial
begin
	clock = 0;
	word1 = 8'he4;
	word2 = 8'h12;
	#10
	$display("%h%h", left,right);
	#100 $finish;
end

twobytesort u1(clock, reset, word1, word2, left,right);

endmodule
