// Verilog for ECE337 Lab 1
// The Following code is used to compare 2 16-bit quantites, a and b. The code 
// determines whether or not:
// a is greater than b, gt = 1, lt = 0, eq = 0
// a is less than b, gt = 0, lt = 1, eq = 0
// a is equal to b, gt = 0, lt = 0, eq = 1

// Use a tab size of 2 spaces for best viewing results


module comparator
(
	input wire [15:0] a,
	input wire [15:0] b,
	output reg gt,
	output reg lt,
	output reg eq
);

	reg gte;
	reg lte;

	always @ (a,b) begin
		{gte,lte} = 2'b0;
		if (!(a<b)) begin 
			// a >= b
			gte = 1;
		end
		if (!(a>b)) begin
			// a <= b
			lte = 1;
		end
		else begin 
			{gte,lte} = 2'b0;
		end
		if (lte != 1) begin
			// a > b
			{gt,lt,eq} = 3'b100;
		end
		else if (gte != 1) begin
			// a < b
			{gt,lt,eq} = 3'b010;
		end
		else begin
			{gt,lt,eq} = 3'b001;
		end
	end

endmodule