//Lorenzo Walz and Patrick Paschal
//ECE464 - Spring 2015
//Mergesort Final Project - Testbench

module mergesort_test;

reg reset, clock;
wire [255:0] mergelist_out;

integer i;

always #5 clock = ~clock;

initial
begin
	clock = 0;
	#100;
for(i=0;i<16;i=i+1)
begin
	$display("%h",mergelist_out);
end
	#100 $finish;
end

mergesort u1(clock, reset, registers_in, mergelist_out);

endmodule
