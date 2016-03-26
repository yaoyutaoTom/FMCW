//=================================================
//
//    This Rom is for storing window constants
//
//=================================================


// Quartus II Verilog Template
// Dual Port ROM

module memory
#(parameter DATA_WIDTH=8, parameter ADDR_WIDTH=11)
(
	input [(ADDR_WIDTH-1):0] addr_a, addr_b,
	input clk, 
	output reg [(DATA_WIDTH-1):0] q_a, q_b
);

	// Declare the ROM variable
	reg [DATA_WIDTH-1:0] rom[2**ADDR_WIDTH-1:0];

	// Initialize the ROM with $readmemb.  Put the memory contents
	// in the file dual_port_rom_init.txt.  Without this file,
	// this design will not compile.
	// See Verilog LRM 1364-2001 Section 17.2.8 for details on the
	// format of this file.

	initial
	begin
		$readmemb("Window_Constants.txt", rom);
	end

	always @ (posedge clk)
	begin
		q_a <= rom[addr_a];
		q_b <= rom[addr_b];
	end

endmodule