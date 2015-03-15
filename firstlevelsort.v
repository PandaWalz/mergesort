module firstlevelsort(clock, reset, secondlevel);

//------inputs//
input clock, reset;

//------outputs//
output [255:0] secondlevel;

//------internal wires//
wire clock;
//Sort inputs
wire [7:0] mem1_reg0,mem1_reg1, mem1_reg2,mem1_reg3, mem1_reg4, mem1_reg5;
//Sort outputs
wire [7:0] mem2_reg0_wire, mem2_reg1_wire, mem2_reg2_wire, mem2_reg3_wire, mem2_reg4_wire, mem2_reg5_wire;

//------internal registers//
reg [7:0] mem2_reg0, mem2_reg1, mem2_reg2, mem2_reg3, mem2_reg4, mem2_reg5;


//------internal variables//
reg [7:0] memory [0:31]; //Gives us a memory with 32 8 bit words

//------main functionality//

initial begin		 //Load data values into memory
	$readmemh("list0.dat", memory);
	end

//------setup registers for sorting//
always@(posedge clock)
begin	//Compare the first two blocks
	mem2_reg0 <= mem2_reg0_wire;
	mem2_reg1 <= mem2_reg1_wire;
	mem2_reg2 <= mem2_reg2_wire;
	mem2_reg3 <= mem2_reg3_wire;
	mem2_reg4 <= mem2_reg4_wire;
	mem2_reg5 <= mem2_reg5_wire;
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

twobytesort twobytesort3(
	.clock (clock),
	.reset (reset),
	.word1 (mem1_reg4), //inputs
	.word2 (mem1_reg5),
	.left  (mem2_reg4_wire), //outputs
	.right (mem2_reg5_wire));

assign mem1_reg0 = memory[0];
assign mem1_reg1 = memory[1];
assign mem1_reg2 = memory[2];
assign mem1_reg3 = memory[3];
assign mem1_reg4 = memory[4];
assign mem1_reg5 = memory[5];

assign secondlevel = {mem2_reg0, mem2_reg1,mem2_reg2, mem2_reg3, mem2_reg4, mem2_reg5};

endmodule
