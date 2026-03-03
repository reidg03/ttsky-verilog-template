module MulAdder(
    input X,
    input Y,
    input Sin,
    input Cin,
    output Sout,
    output Cout
);

FullAdder fa (
    .A(Sin),
    .B(X & Y),
    .Cin(Cin),
    .S(Sout),
    .Cout(Cout)
);

endmodule