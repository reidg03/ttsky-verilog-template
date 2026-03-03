# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, 10, unit="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    dut._log.info("Test project behavior")

    # Test 1: 3 * 2
    dut.ui_in.value = (3 << 4) | 2
    await ClockCycles(dut.clk, 1)
    assert dut.uo_out.value == 6

    # Test 2: 4 * 5
    dut.ui_in.value = (4 << 4) | 5
    await ClockCycles(dut.clk, 1)
    assert dut.uo_out.value == 20

    # Test 3: 12 * 15
    dut.ui_in.value = (12 << 4) | 15
    await ClockCycles(dut.clk, 1)
    assert dut.uo_out.value == 180

    # Test 4: 13 * 7
    dut.ui_in.value = (13 << 4) | 7
    await ClockCycles(dut.clk, 1)
    assert dut.uo_out.value == 91

    # Test 5: 15 * 15
    dut.ui_in.value = (15 << 4) | 15
    await ClockCycles(dut.clk, 1)
    assert dut.uo_out.value == 225

    # Test 6: 14 * 0
    dut.ui_in.value = (14 << 4) | 0
    await ClockCycles(dut.clk, 1)
    assert dut.uo_out.value == 0