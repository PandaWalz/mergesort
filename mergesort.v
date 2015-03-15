//Lorenzo Walz and Patrick Paschal
//ECE464 - Spring 2015
//Mergesort Final Project

module mergesort(clock,reset, registers_in, mergelist_out);

//------inputs-----------//
input registers_in;
input clock;
input reset;

//------outputs---------//
output [31:0] mergelist_out;

//------internal wires//
wire clock;
//Sort inputs
wire [7:0] mem1_reg0,mem1_reg1, mem1_reg2,mem1_reg3;
//Sort outputs
wire [7:0] mem2_reg0_wire, mem2_reg1_wire, mem2_reg2_wire, mem2_reg3_wire;

//------internal registers//
reg [7:0] mem2_reg0, mem2_reg1, mem2_reg2, mem2_reg3;

//------internal variables//
reg [7:0] memory [0:31]; //Gives us a memory with 32 8 bit words
integer i;
reg [7:0] lefthalf [0:15];//Left half of memory to sort.
reg [7:0] righthalf [0:15];//Right half of memory to sort.

//------main functionality here//
initial begin		 //Load data values into memory
	$readmemh("list0.dat", memory);
	end

twobytesort twobytesort1(
	.clock (clock),
	.reset (reset),
	.word1 (mem1_reg0), //inputs
	.word2 (mem1_reg1),
	.left  (mem2_reg0_wire), //outputs
	.right (mem2_reg1_wire));

twobytesort twobytesort2(
	.clock (clock),
	.reset (reset),
	.word1 (mem1_reg2), //inputs
	.word2 (mem1_reg3),
	.left  (mem2_reg2_wire), //outputs
	.right (mem2_reg3_wire));

//------setup registers for sorting//
always@(posedge clock)
begin	//Compare the first two blocks
	mem2_reg0 <= mem2_reg0_wire;
	mem2_reg1 <= mem2_reg1_wire;
	mem2_reg2 <= mem2_reg2_wire;
	mem2_reg3 <= mem2_reg3_wire;
end

assign mem1_reg0 = memory[0];
assign mem1_reg1 = memory[1];
assign mem1_reg2 = memory[2];
assign mem1_reg3 = memory[3];

assign mergelist_out = {mem2_reg0, mem2_reg1,mem2_reg2, mem2_reg3};

endmodule

