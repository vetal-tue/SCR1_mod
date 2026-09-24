// scr1_top_avalon.sv
module scr1_top_avalon #(
    parameter int ADDR_WIDTH = 32,
    parameter int DATA_WIDTH = 32
) (
    // Clock & Reset
    input logic clk,
    input logic rtc_clk,
    input logic reset_n,
    input logic pwrup_rst_n,  // Power-Up Reset
    input logic cpu_rst_n,    // CPU Reset (Core Reset)
    input logic test_mode,    // Test mode
    input logic test_rst_n,

    // Core Control & Interrupts (Conduit / Interrupt Sender в Platform Designer)
    // input logic [31:0] hart_id,
    input logic [31:0] fuse_mhartid,
    input logic [31:0] fuse_idcode,
    // input logic        ext_irq,
    // input logic        soft_irq,
    // input logic        timer_irq,
    input logic [15:0] irq_lines,

    // -- JTAG I/F
    input  logic trst_n,
    input  logic tck,
    input  logic tms,
    input  logic tdi,
    output logic tdo,
    output logic tdo_en,

    // --- Avalon-MM Master Instruction Memory (imem) ---
    output logic [    ADDR_WIDTH-1:0] imem_address,
    output logic                      imem_read,
    output logic [(DATA_WIDTH/8)-1:0] imem_byteenable,
    input  logic [    DATA_WIDTH-1:0] imem_readdata,
    input  logic                      imem_readdatavalid,
    input  logic                      imem_waitrequest,

    // --- Avalon-MM Master Data Memory (dmem) ---
    output logic [    ADDR_WIDTH-1:0] dmem_address,
    output logic                      dmem_read,
    output logic                      dmem_write,
    output logic [    DATA_WIDTH-1:0] dmem_writedata,
    output logic [(DATA_WIDTH/8)-1:0] dmem_byteenable,
    input  logic [    DATA_WIDTH-1:0] dmem_readdata,
    input  logic                      dmem_readdatavalid,
    input  logic                      dmem_waitrequest
);

  // --- Внутренние AHB-Lite сигналы imem ---
  logic [ADDR_WIDTH-1:0] imem_haddr;
  logic [           1:0] imem_htrans;
  logic [           2:0] imem_hsize;
  logic [           2:0] imem_hburst;
  logic [           3:0] imem_hprot;
  logic [DATA_WIDTH-1:0] imem_hrdata;
  logic                  imem_hready;
  logic                  imem_hresp;

  // --- Внутренние AHB-Lite сигналы dmem ---
  logic [ADDR_WIDTH-1:0] dmem_haddr;
  logic [           1:0] dmem_htrans;
  logic                  dmem_hwrite;
  logic [           2:0] dmem_hsize;
  logic [           2:0] dmem_hburst;
  logic [           3:0] dmem_hprot;
  logic [DATA_WIDTH-1:0] dmem_hwdata;
  logic [DATA_WIDTH-1:0] dmem_hrdata;
  logic                  dmem_hready;
  logic                  dmem_hresp;

  // --- Инстанцирование ядра SCR1 ---
  scr1_top_ahb i_scr1_core (
      .clk         (clk),
      .rtc_clk     (rtc_clk),
      .rst_n       (reset_n),
      .pwrup_rst_n (pwrup_rst_n),
      .cpu_rst_n   (cpu_rst_n),
      .test_mode   (test_mode),
      .test_rst_n  (test_rst_n),
      .fuse_mhartid(fuse_mhartid),
      .fuse_idcode (fuse_idcode),
      // .ext_irq     (ext_irq),
      // .soft_irq    (soft_irq),
      // .timer_irq   (timer_irq),
      .irq_lines   (irq_lines),
      // JTAG I/F
      .trst_n      (trst_n),
      .tck         (tck),
      .tms         (tms),
      .tdi         (tdi),
      .tdo         (tdo),
      .tdo_en      (tdo_en),
      // IMEM AHB Master
      .imem_haddr  (imem_haddr),
      .imem_htrans (imem_htrans),
      .imem_hsize  (imem_hsize),
      .imem_hburst (imem_hburst),
      .imem_hprot  (imem_hprot),
      .imem_hrdata (imem_hrdata),
      .imem_hready (imem_hready),
//      .imem_hresp  (imem_hresp),
		.imem_hresp  ({1'b0,imem_hresp}),

      // DMEM AHB Master
      .dmem_haddr (dmem_haddr),
      .dmem_htrans(dmem_htrans),
      .dmem_hwrite(dmem_hwrite),
      .dmem_hsize (dmem_hsize),
      .dmem_hburst(dmem_hburst),
      .dmem_hprot (dmem_hprot),
      .dmem_hwdata(dmem_hwdata),
      .dmem_hrdata(dmem_hrdata),
      .dmem_hready(dmem_hready),
//      .dmem_hresp (dmem_hresp)
		.dmem_hresp ({1'b0,dmem_hresp})
  );

  // --- Мост AHB->Avalon для IMEM (только чтение) ---
  ahb_avalon_bridge #(
      .ADDR_WIDTH(ADDR_WIDTH),
      .DATA_WIDTH(DATA_WIDTH)
  ) i_imem_bridge (
      .clk          (clk),
      .reset_n      (reset_n),
      .HADDR        (imem_haddr),
      .HTRANS       (imem_htrans),
      .HWRITE       (1'b0),                // IMEM только читает
      .HSIZE        (imem_hsize),
      // .hburst       (imem_hburst),
      .HPROT        (imem_hprot),
      .HWDATA       ('0),
      .HRDATA       (imem_hrdata),
      .HREADY       (imem_hready),
      .HRESP        (imem_hresp),
      .address      (imem_address),
      .read         (imem_read),
      .write        (),                    // Не используется
      .writedata    (),                    // Не используется
      .byteenable   (imem_byteenable),
      .readdata     (imem_readdata),
      .response     ('0),
      .readdatavalid(imem_readdatavalid),
      .waitrequest  (imem_waitrequest)
  );

  // --- Мост AHB->Avalon для DMEM (чтение и запись) ---
  ahb_avalon_bridge #(
      .ADDR_WIDTH(ADDR_WIDTH),
      .DATA_WIDTH(DATA_WIDTH)
  ) i_dmem_bridge (
      .clk          (clk),
      .reset_n      (reset_n),
      .HADDR        (dmem_haddr),
      .HTRANS       (dmem_htrans),
      .HWRITE       (dmem_hwrite),
      .HSIZE        (dmem_hsize),
      // .hburst       (dmem_hburst),
      .HPROT        (dmem_hprot),
      .HWDATA       (dmem_hwdata),
      .HRDATA       (dmem_hrdata),
      .HREADY       (dmem_hready),
      .HRESP        (dmem_hresp),
      .address      (dmem_address),
      .read         (dmem_read),
      .write        (dmem_write),                    // Не используется
      .writedata    (dmem_writedata),                    // Не используется
      .byteenable   (dmem_byteenable),
      .readdata     (dmem_readdata),
      .response     ('0),
      .readdatavalid(dmem_readdatavalid),
      .waitrequest  (dmem_waitrequest)
  );


  // ahb_avalon_bridge #(
  //     .ADDR_WIDTH(ADDR_WIDTH),
  //     .DATA_WIDTH(DATA_WIDTH)
  // ) i_dmem_bridge (
  //     .clk             (clk),
  //     .rst_n           (reset_n),

  //     .haddr           (dmem_haddr),
  //     .htrans          (dmem_htrans),
  //     .hwrite          (dmem_hwrite),
  //     .hsize           (dmem_hsize),
  //     .hburst          (dmem_hburst),
  //     .hprot           (dmem_hprot),
  //     .hwdata          (dmem_hwdata),
  //     .hrdata          (dmem_hrdata),
  //     .hready          (dmem_hready),
  //     .hresp           (dmem_hresp),

  //     .av_address      (dmem_address),
  //     .av_read         (dmem_read),
  //     .av_write        (dmem_write),
  //     .av_writedata    (dmem_writedata),
  //     .av_byteenable   (dmem_byteenable),
  //     .av_readdata     (dmem_readdata),
  //     .av_readdatavalid(dmem_readdatavalid),
  //     .av_waitrequest  (dmem_waitrequest)
  // );

endmodule
