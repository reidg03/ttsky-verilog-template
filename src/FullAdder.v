module FullAdder(
    input A,
    input B,
    input Cin,
    output S,
    output Cout
    );
    
    assign S = (~A & ((~B & Cin) | (B & ~Cin))) | (A & ((~B & ~Cin) | (B & Cin)));
    assign Cout = A & (B | Cin) | (~A & B & Cin);
    
endmodule