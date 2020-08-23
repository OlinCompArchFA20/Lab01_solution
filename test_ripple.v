module test_ripple;
    parameter W = 4;

    reg[W-1:0] A,B;
    reg Ci;
    wire[W-1:0] S;
    wire Co;

    defparam DUT.W=W;

    ripple_carry_adder DUT(A,B,Ci,S,Co);

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0,test_ripple);
        
        for (int a=0; a<2**W; a=a+1) begin
            for (int b=0; b<2**W; b=b+1) begin
                A=a; B=b; Ci=0;        
                #100 
                if (a+b != {Co,S})
                    $display("Fail! %d + %d resulted in %d",a,b,S);
            end
        end
        $display("test_complete");
    end
endmodule
