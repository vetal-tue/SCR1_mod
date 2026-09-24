/// Copyright by Syntacore LLC ę 2016-2021. See LICENSE for details
/// @file       <scr1_memif.svh>
/// @brief      Memory interface definitions file
///

`ifndef SCR1_MEMIF_SVH
`define SCR1_MEMIF_SVH

`include "scr1_arch_description.svh"

//-------------------------------------------------------------------------------
// Memory command type
//-------------------------------------------------------------------------------
typedef logic type_scr1_mem_cmd_e;
localparam type_scr1_mem_cmd_e SCR1_MEM_CMD_RD = 1'b0;
localparam type_scr1_mem_cmd_e SCR1_MEM_CMD_WR = 1'b1;
`ifdef SCR1_XPROP_EN
localparam type_scr1_mem_cmd_e SCR1_MEM_CMD_ERROR = 1'bx;
`endif  // SCR1_XPROP_EN

//-------------------------------------------------------------------------------
// Memory data width type
//-------------------------------------------------------------------------------
typedef logic [1:0] type_scr1_mem_width_e;
localparam type_scr1_mem_width_e SCR1_MEM_WIDTH_BYTE = 2'b00;
localparam type_scr1_mem_width_e SCR1_MEM_WIDTH_HWORD = 2'b01;
localparam type_scr1_mem_width_e SCR1_MEM_WIDTH_WORD = 2'b10;
`ifdef SCR1_XPROP_EN
localparam type_scr1_mem_width_e SCR1_MEM_WIDTH_ERROR = 2'bxx;
`endif  // SCR1_XPROP_EN

//-------------------------------------------------------------------------------
// Memory response type
//-------------------------------------------------------------------------------
typedef logic [1:0] type_scr1_mem_resp_e;
localparam type_scr1_mem_resp_e SCR1_MEM_RESP_NOTRDY = 2'b00;
localparam type_scr1_mem_resp_e SCR1_MEM_RESP_RDY_OK = 2'b01;
localparam type_scr1_mem_resp_e SCR1_MEM_RESP_RDY_ER = 2'b10;
`ifdef SCR1_XPROP_EN
localparam type_scr1_mem_resp_e SCR1_MEM_RESP_ERROR = 2'bxx;
`endif  // SCR1_XPROP_EN

`endif  // SCR1_MEMIF_SVH
