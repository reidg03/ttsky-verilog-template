<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

# How it works

This project creates a 4-bit carry-propagate array multiplier. I designed my multiplier based on this diagram of multiplication by hand. Binary multiplication works exactly like decimal multiplication, except all the digits are 1 or 0. This method first multiplies all of i by j0, shifts left 1 bit, multiplies i by j1, shifts left 1 bit, multiplies i by j2, and adds all the terms together.

                        i2    i1    i0
                    x   j2    j1    j0
                   -------------------
                      i0j2  i0j1  i0j0
                i1j2  i1j1  i1j0
       +  i2j2  i2j1  i2j0
      --------------------------------
      k5  k4    k3    k2    k1    k0  

Notice how the shape of this diagram is similar to the array multiplier in the table below. In this multiplier, each segment multiplies two bits, adds them to the result from the segment on the right and the result from the segment above, and passes this sum and carry to the segments below and left respectively.


### 1-Bit Multiply Adder
![diagram](muladder.png)

This is a modified full adder. Since binary multiplication is just an AND gate (0*0=0,0*1=0,1*1=1), then the two bits being multiplied are first fed through an AND gate and then added. X and Y are being passed through each segment to the nearby segments that also need to use these bits.

### 4-Bit Carry-Propagate Array Multiplier
![diagram](cpamult.png)

By connecting many 1-bit multiply adders in an array, we can multiply two binary numbers with any amount of bits.

# How to test

Inputs:
- A[3:0]: store in ui_in[7:4]
- B[3:0]: store in ui_in[3:0]
Outputs:
- P[7:0]: output from uo_out[7:0]

The multiplier takes in two 4-bit values and outputs one 8-bit value. The inputs and outputs are unsigned binary numbers, and do not handle negatives. This design is purely combinational logic, meaning that the output will be ready in a single clock cycle. 

The testbench tests random multiplications as well as corner cases, including multiplying by zero and multiplying the largest numbers possible. 