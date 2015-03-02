module mergesort( registers_in, mergelist_out);

//------inputs-----------//
input registers_in;

//------outputs---------//
output mergelist_out;

//------internal variables//
reg [7:0] memory [0:31]; //Gives us a memory with 32 8 bit words
integer i;
reg [7:0] lefthalf [0:15];//Left half of memory to sort.
reg [7:0] righthalf [0:15];//Right half of memory to sort.

//------main functionality here//
initial begin		 //Load data values into memory
	$readmemh("list0.dat", memory);
	end

//------setup registers for sorting//
always@(*)
begin
for(i=0;i<16;i=i+1)
begin
lefthalf[i] <= memory[i];
righthalf[i] <= memory[i+16];
end
end


initial begin		//Display memory - just a test
	for(i=0; i<16;i=i+1)
	$display("%d:%h",i,lefthalf[i]);
	end

endmodule
