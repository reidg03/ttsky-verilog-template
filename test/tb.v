`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a FST file. You can view it with gtkwave or surfer.
  initial begin
    $dumpfile("tb.fst");
    $dumpvars(0, tb);
    #1;
  end

  // Wire up the inputs and outputs:
  reg clk;
  reg rst_n;
  reg ena;
  reg [7:0] ui_in;
  reg [7:0] uio_in;
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;
`ifdef GL_TEST
  wire VPWR = 1'b1;
  wire VGND = 1'b0;
`endif


   //TESTING
  initial begin
    // Start with reset low
    rst_n = 0;
    ena   = 1;
    ui_in = 8'b00000000;
    uio_in = 8'b00000000;

    #5 rst_n = 1;  // release reset

    // Test case 1: 3 * 2
    ui_in = {4'd3, 4'd2};
    #5;
    $display("A=3 B=2 -> P=%d", uo_out);

    // Test case 2: 4 * 5
    ui_in = {4'd4, 4'd5};
    #5;
    $display("A=4 B=5 -> P=%d", uo_out);

    // Finish simulation
    $finish;
  end
   
  // Replace tt_um_example with your module name:
  tt_um_reidg03_gmult user_project (

      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(VPWR),
      .VGND(VGND),
`endif

      .ui_in  (ui_in),    // Dedicated inputs
      .uo_out (uo_out),   // Dedicated outputs
      .uio_in (uio_in),   // IOs: Input path
      .uio_out(uio_out),  // IOs: Output path
      .uio_oe (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
      .ena    (ena),      // enable - goes high when design is selected
      .clk    (clk),      // clock
      .rst_n  (rst_n)     // not reset
  );

endmodule
