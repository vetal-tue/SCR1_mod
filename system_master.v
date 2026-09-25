module system_master (
		input  wire        clk,
		input  wire        reset,
		output wire [31:0] master_address,
		input  wire [31:0] master_readdata,
		output wire        master_read,
		output wire        master_write,
		output wire [31:0] master_writedata,
		output wire [3:0]  master_byteenable,
		//
		output wire [31:0] RISCV_rdata,
		input wire [31:0]  RISCV_wrdata,
		input wire [3:0]   RISCV_byteenable,
		input wire [19:0]  RISCV_addr,
		input wire         RISCV_wr,
		input wire         RISCV_rd
	);
endmodule