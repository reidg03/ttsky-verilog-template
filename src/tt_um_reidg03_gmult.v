/*
 * Copyright (c) 2026 Reid Graham
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_reidg03_gmult (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);

wire [3:0] A;
wire [3:0] B;
wire [7:0] P;

// split the inputs
assign A = ui_in[3:0];
assign B = ui_in[7:4];

// instantiate your multiplier
CarryPropArrMul mul (
    .A(A),
    .B(B),
    .P(P)
);

// connect to outputs
assign uo_out = P;

// unused bidirectional IO
assign uio_out = 8'b0;
assign uio_oe  = 8'b0;

// prevent unused warnings
wire _unused = &{uio_in, ena, clk, rst_n, 1'b0};


endmodule

