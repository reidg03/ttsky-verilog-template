module CarryPropArrMul(
    input  [3:0] A,
    input  [3:0] B,
    output [7:0] P
);

//Sout for each module
wire s00,s01,s02,s03;
wire s10,s11,s12,s13;
wire s20,s21,s22,s23;
wire s30,s31,s32,s33;

//Cout for each module
wire c00,c01,c02,c03;
wire c10,c11,c12,c13;
wire c20,c21,c22,c23;
wire c30,c31,c32,c33;

//row 1
MulAdder m00(.X(A[0]), .Y(B[0]), .Sin(1'b0), .Cin(1'b0), .Sout(s00), .Cout(c00));
MulAdder m00(.X(A[1]), .Y(B[0]), .Sin(1'b0), .Cin(c00), .Sout(s01), .Cout(c01));
MulAdder m00(.X(A[2]), .Y(B[0]), .Sin(1'b0), .Cin(c01), .Sout(s02), .Cout(c02));
MulAdder m00(.X(A[3]), .Y(B[0]), .Sin(1'b0), .Cin(c02), .Sout(s03), .Cout(c03));

//row 2
MulAdder m00(.X(A[0]), .Y(B[1]), .Sin(s01), .Cin(1'b0), .Sout(s10), .Cout(c10));
MulAdder m00(.X(A[1]), .Y(B[1]), .Sin(s02), .Cin(c10), .Sout(s11), .Cout(c11));
MulAdder m00(.X(A[2]), .Y(B[1]), .Sin(s03), .Cin(c11), .Sout(s12), .Cout(c12));
MulAdder m00(.X(A[3]), .Y(B[1]), .Sin(c03), .Cin(c12), .Sout(s13), .Cout(c13));

//row 3
MulAdder m00(.X(A[0]), .Y(B[2]), .Sin(s11), .Cin(1'b0), .Sout(s20), .Cout(c20));
MulAdder m00(.X(A[1]), .Y(B[2]), .Sin(s12), .Cin(c20), .Sout(s21), .Cout(c21));
MulAdder m00(.X(A[2]), .Y(B[2]), .Sin(s13), .Cin(c21), .Sout(s22), .Cout(c22));
MulAdder m00(.X(A[3]), .Y(B[2]), .Sin(c13), .Cin(c22), .Sout(s23), .Cout(c23));

//row 4
MulAdder m00(.X(A[0]), .Y(B[3]), .Sin(s21), .Cin(1'b0), .Sout(s30), .Cout(s30));
MulAdder m00(.X(A[1]), .Y(B[3]), .Sin(s22), .Cin(c30), .Sout(s31), .Cout(c31));
MulAdder m00(.X(A[2]), .Y(B[3]), .Sin(s23), .Cin(c31), .Sout(s32), .Cout(c32));
MulAdder m00(.X(A[3]), .Y(B[3]), .Sin(c23), .Cin(c32), .Sout(s33), .Cout(c33));

// product bits
assign P[0] = s00;
assign P[1] = s10;
assign P[2] = s20;
assign P[3] = s30;
assign P[4] = s31;
assign P[5] = s32;
assign P[6] = s33;
assign P[7] = c33;