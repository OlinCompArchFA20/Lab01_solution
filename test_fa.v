module test_FA;
    reg A,B,Ci;
    wire S,Co;

    full_adder FA(A,B,Ci,S,Co);

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0,test_FA);

        $display("A B Ci | S Co");
        $display("-------------");

        for (int i=0; i < 8; i=i+1) begin
            {A,B,Ci} = i;
            #50 $display("%b %b %b  | %b  %b",A,B,Ci,S,Co);
        end
    end
endmodule
