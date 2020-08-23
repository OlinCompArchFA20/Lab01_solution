// Half Adder
module half_adder(
  input  A, B, // Input Operands
  output S,    // Sum
  output Co);  // Carry Out

  parameter DLY = 5; // Gate Delay

  xor #DLY ha_xor(S,A,B); //Compute Sum
  and #DLY ha_and(Co,A,B);//Compute Carry Out
endmodule

// Full Adder
module full_adder(
  input  A,B, // Input Operands
  input  Ci,  // Carry In
  output S,   // Sum
  output Co); // Carry Out
  
  parameter DLY = 5;    // Gate Delay
  wire xor1,nand1,nand2;// Intermediary nodes

  // Compute Sum
  xor  #DLY G1(xor1,A,B);
  xor  #DLY G2(S,xor1,Ci);
  // Compute Carry Out
  nand #DLY G3(nand1,xor1,Ci);
  nand #DLY G4(nand2,A,B);
  nand #DLY G5(Co,nand1,nand2);
endmodule

// W-bit Ripple Carry Adder
module ripple_carry_adder(
  input  [W-1:0] A,B, // W-bit Input Operands
  input          Ci,  // Carry In
  output [W-1:0] S,   // W-bit Sum
  output         Co); // Carry Out

  parameter W = 4; //Operand Width

  wire[W:0] carry; // Intermediary Nodes, note array size is W, not W-1

  // Hook up W full adders to implement ripple carry
  generate genvar i;
    for (i=0; i < W; i=i+1) begin
      full_adder fa_inst(A[i],B[i],carry[i],S[i],carry[i+1]);
    end
  endgenerate

  // Handle fencepost problem by hooking up Carry In and Out
  assign carry[0] = Ci; //Ci is an input
  assign Co = carry[W]; //Co is an output
endmodule
