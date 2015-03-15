//Lorenzo Walz and Patrick Paschal
//ECE464 - Spring 2015
//Mergesort Final Project

module mergesort(clock,reset, registers_in, mergelist_out);

//------inputs-----------//
input registers_in;
input clock;
input reset;

//------outputs---------//
output [255:0] mergelist_out;
wire [255:0] secondlevel_wire;

//------main functionality here//


firstlevelsort firstlevelsort1(
	.clock (clock),
	.reset (reset),
	.secondlevel (secondlevel_wire));

assign mergelist_out = secondlevel_wire;

endmodule

