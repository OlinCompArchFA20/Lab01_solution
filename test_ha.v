module test_HA;
    reg A,B;
    wire S,Co;

    half_adder HA(A,B,S,Co);

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0,test_HA);

        $display("A B | S Co");
        $display("-------------");

        for (int i=0; i < 4; i=i+1) begin
            {A,B} = i;
            #50 $display("%b %b | %b  %b",A,B,S,Co);
        end
    end
endmodule
