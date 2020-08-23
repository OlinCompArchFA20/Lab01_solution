module half_adder(A, B, S, Co);
    input A,B;
    output S,Co;

    xor ha_xor(S,A,B);
    and ha_and(Co,A,B);
endmodule

module full_adder(A,B,Ci,S,Co);
    input A,B,Ci;
    output S,Co;

    wire xor1,nand1,nand2;

    xor  #5 G1(xor1,A,B);
    xor  #5 G2(S,xor1,Ci);
    nand #5 G3(nand1,xor1,Ci);
    nand #5 G4(nand2,A,B);
    nand #5 G5(Co,nand1,nand2);
endmodule

module ripple_carry_adder(A,B,Ci,S,Co);
    parameter W = 4;

    input[W-1:0] A,B;
    input Ci;
    output[W-1:0] S;
    output Co;

    wire[W:0] carry;

    generate 
        genvar i;
        for (i=0; i < W; i=i+1) begin
            full_adder fa_inst(A[i],B[i],carry[i],S[i],carry[i+1]);
        end
    endgenerate

    assign carry[0] = Ci;
    assign Co = carry[W];

endmodule
