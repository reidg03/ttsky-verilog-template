module RemainderFixer(
    input A,
    input D,
    input P,
    input Cin,
    output Sout,
    output Cout
);

FullAdder fa (
    .A(A),
    .B(~P & D),
    .Cin(Cin),
    .S(Sout),
    .Cout(Cout)
);

endmodule