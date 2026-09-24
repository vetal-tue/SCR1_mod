/// Copyright by Syntacore LLC © 2016-2021. See LICENSE for details
/// @file       <scr1_riscv_isa_decoding.svh>
/// @brief      RISC-V ISA definitions file
///

`ifndef SCR1_RISCV_ISA_DECODING_SVH
`define SCR1_RISCV_ISA_DECODING_SVH

`include "scr1_arch_description.svh"
`include "scr1_arch_types.svh"

//-------------------------------------------------------------------------------
// Instruction types
//-------------------------------------------------------------------------------
typedef logic [1:0] type_scr1_instr_type_e;
localparam type_scr1_instr_type_e SCR1_INSTR_RVC0 = 2'b00;
localparam type_scr1_instr_type_e SCR1_INSTR_RVC1 = 2'b01;
localparam type_scr1_instr_type_e SCR1_INSTR_RVC2 = 2'b10;
localparam type_scr1_instr_type_e SCR1_INSTR_RVI = 2'b11;

//-------------------------------------------------------------------------------
// RV32I opcodes (bits 6:2)
//-------------------------------------------------------------------------------
typedef logic [6:2] type_scr1_rvi_opcode_e;
localparam type_scr1_rvi_opcode_e SCR1_OPCODE_LOAD = 5'b00000;
localparam type_scr1_rvi_opcode_e SCR1_OPCODE_MISC_MEM = 5'b00011;
localparam type_scr1_rvi_opcode_e SCR1_OPCODE_OP_IMM = 5'b00100;
localparam type_scr1_rvi_opcode_e SCR1_OPCODE_AUIPC = 5'b00101;
localparam type_scr1_rvi_opcode_e SCR1_OPCODE_STORE = 5'b01000;
localparam type_scr1_rvi_opcode_e SCR1_OPCODE_OP = 5'b01100;
localparam type_scr1_rvi_opcode_e SCR1_OPCODE_LUI = 5'b01101;
localparam type_scr1_rvi_opcode_e SCR1_OPCODE_BRANCH = 5'b11000;
localparam type_scr1_rvi_opcode_e SCR1_OPCODE_JALR = 5'b11001;
localparam type_scr1_rvi_opcode_e SCR1_OPCODE_JAL = 5'b11011;
localparam type_scr1_rvi_opcode_e SCR1_OPCODE_SYSTEM = 5'b11100;

//-------------------------------------------------------------------------------
// IALU main operands
//-------------------------------------------------------------------------------
localparam SCR1_IALU_OP_ALL_NUM_E = 2;
localparam SCR1_IALU_OP_WIDTH_E = $clog2(SCR1_IALU_OP_ALL_NUM_E);
typedef logic [SCR1_IALU_OP_WIDTH_E-1:0] type_scr1_ialu_op_sel_e;
localparam type_scr1_ialu_op_sel_e SCR1_IALU_OP_REG_IMM = 1'b0;
localparam type_scr1_ialu_op_sel_e SCR1_IALU_OP_REG_REG = 1'b1;

//-------------------------------------------------------------------------------
// IALU main commands
//-------------------------------------------------------------------------------
`ifdef SCR1_RVM_EXT
localparam SCR1_IALU_CMD_ALL_NUM_E = 23;
`else  // ~SCR1_RVM_EXT
localparam SCR1_IALU_CMD_ALL_NUM_E = 15;
`endif  // ~SCR1_RVM_EXT
localparam SCR1_IALU_CMD_WIDTH_E = $clog2(SCR1_IALU_CMD_ALL_NUM_E);

typedef logic [SCR1_IALU_CMD_WIDTH_E-1:0] type_scr1_ialu_cmd_sel_e;
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_NONE = '0;  // 0
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_AND = 1;
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_OR = 2;
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_XOR = 3;
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_ADD = 4;
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_SUB = 5;
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_SUB_LT = 6;
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_SUB_LTU = 7;
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_SUB_EQ = 8;
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_SUB_NE = 9;
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_SUB_GE = 10;
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_SUB_GEU = 11;
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_SLL = 12;
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_SRL = 13;
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_SRA = 14;
`ifdef SCR1_RVM_EXT
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_MUL = 15;
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_MULHU = 16;
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_MULHSU = 17;
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_MULH = 18;
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_DIV = 19;
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_DIVU = 20;
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_REM = 21;
localparam type_scr1_ialu_cmd_sel_e SCR1_IALU_CMD_REMU = 22;
`endif  // SCR1_RVM_EXT

//-------------------------------------------------------------------------------
// IALU SUM2 operands
//-------------------------------------------------------------------------------
localparam SCR1_SUM2_OP_ALL_NUM_E = 2;
localparam SCR1_SUM2_OP_WIDTH_E = $clog2(SCR1_SUM2_OP_ALL_NUM_E);
typedef logic [SCR1_SUM2_OP_WIDTH_E-1:0] type_scr1_ialu_sum2_op_sel_e;
localparam type_scr1_ialu_sum2_op_sel_e SCR1_SUM2_OP_PC_IMM = 1'b0;
localparam type_scr1_ialu_sum2_op_sel_e SCR1_SUM2_OP_REG_IMM = 1'b1;
`ifdef SCR1_XPROP_EN
localparam type_scr1_ialu_sum2_op_sel_e SCR1_SUM2_OP_ERROR = 'x;
`endif  // SCR1_XPROP_EN

//-------------------------------------------------------------------------------
// LSU commands
//-------------------------------------------------------------------------------
localparam SCR1_LSU_CMD_ALL_NUM_E = 9;
localparam SCR1_LSU_CMD_WIDTH_E = $clog2(SCR1_LSU_CMD_ALL_NUM_E);
typedef logic [SCR1_LSU_CMD_WIDTH_E-1:0] type_scr1_lsu_cmd_sel_e;
localparam type_scr1_lsu_cmd_sel_e SCR1_LSU_CMD_NONE = '0;
localparam type_scr1_lsu_cmd_sel_e SCR1_LSU_CMD_LB = 1;
localparam type_scr1_lsu_cmd_sel_e SCR1_LSU_CMD_LH = 2;
localparam type_scr1_lsu_cmd_sel_e SCR1_LSU_CMD_LW = 3;
localparam type_scr1_lsu_cmd_sel_e SCR1_LSU_CMD_LBU = 4;
localparam type_scr1_lsu_cmd_sel_e SCR1_LSU_CMD_LHU = 5;
localparam type_scr1_lsu_cmd_sel_e SCR1_LSU_CMD_SB = 6;
localparam type_scr1_lsu_cmd_sel_e SCR1_LSU_CMD_SH = 7;
localparam type_scr1_lsu_cmd_sel_e SCR1_LSU_CMD_SW = 8;

//-------------------------------------------------------------------------------
// CSR operands
//-------------------------------------------------------------------------------
localparam SCR1_CSR_OP_ALL_NUM_E = 2;
localparam SCR1_CSR_OP_WIDTH_E = $clog2(SCR1_CSR_OP_ALL_NUM_E);
typedef logic [SCR1_CSR_OP_WIDTH_E-1:0] type_scr1_csr_op_sel_e;
localparam type_scr1_csr_op_sel_e SCR1_CSR_OP_IMM = 1'b0;
localparam type_scr1_csr_op_sel_e SCR1_CSR_OP_REG = 1'b1;

//-------------------------------------------------------------------------------
// CSR commands
//-------------------------------------------------------------------------------
localparam SCR1_CSR_CMD_ALL_NUM_E = 4;
localparam SCR1_CSR_CMD_WIDTH_E = $clog2(SCR1_CSR_CMD_ALL_NUM_E);
typedef logic [SCR1_CSR_CMD_WIDTH_E-1:0] type_scr1_csr_cmd_sel_e;
localparam type_scr1_csr_cmd_sel_e SCR1_CSR_CMD_NONE = '0;
localparam type_scr1_csr_cmd_sel_e SCR1_CSR_CMD_WRITE = 1;
localparam type_scr1_csr_cmd_sel_e SCR1_CSR_CMD_SET = 2;
localparam type_scr1_csr_cmd_sel_e SCR1_CSR_CMD_CLEAR = 3;

//-------------------------------------------------------------------------------
// MPRF rd writeback source
//-------------------------------------------------------------------------------
localparam SCR1_RD_WB_ALL_NUM_E = 7;
localparam SCR1_RD_WB_WIDTH_E = $clog2(SCR1_RD_WB_ALL_NUM_E);
typedef logic [SCR1_RD_WB_WIDTH_E-1:0] type_scr1_rd_wb_sel_e;
localparam type_scr1_rd_wb_sel_e SCR1_RD_WB_NONE = '0;
localparam type_scr1_rd_wb_sel_e SCR1_RD_WB_IALU = 1;
localparam type_scr1_rd_wb_sel_e SCR1_RD_WB_SUM2 = 2;
localparam type_scr1_rd_wb_sel_e SCR1_RD_WB_IMM = 3;
localparam type_scr1_rd_wb_sel_e SCR1_RD_WB_INC_PC = 4;
localparam type_scr1_rd_wb_sel_e SCR1_RD_WB_LSU = 5;
localparam type_scr1_rd_wb_sel_e SCR1_RD_WB_CSR = 6;

//-------------------------------------------------------------------------------
// IDU to EXU full command structure
//-------------------------------------------------------------------------------
localparam SCR1_GPR_FIELD_WIDTH = 5;

typedef struct packed {
  logic                            instr_rvc;
  type_scr1_ialu_op_sel_e          ialu_op;
  type_scr1_ialu_cmd_sel_e         ialu_cmd;
  type_scr1_ialu_sum2_op_sel_e     sum2_op;
  type_scr1_lsu_cmd_sel_e          lsu_cmd;
  type_scr1_csr_op_sel_e           csr_op;
  type_scr1_csr_cmd_sel_e          csr_cmd;
  type_scr1_rd_wb_sel_e            rd_wb_sel;
  logic                            jump_req;
  logic                            branch_req;
  logic                            mret_req;
  logic                            fencei_req;
  logic                            wfi_req;
  logic [SCR1_GPR_FIELD_WIDTH-1:0] rs1_addr;
  logic [SCR1_GPR_FIELD_WIDTH-1:0] rs2_addr;
  logic [SCR1_GPR_FIELD_WIDTH-1:0] rd_addr;
  logic [`SCR1_XLEN-1:0]           imm;
  logic                            exc_req;
  type_scr1_exc_code_e             exc_code;
} type_scr1_exu_cmd_s;

`endif  // SCR1_RISCV_ISA_DECODING_SVH
