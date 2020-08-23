# Lab 1: Adders

Please submit your answers to the following problems by commiting and pushing
your code and testbench to github.

For the first part of the lab, you'll be working alone. For the second part of
the lab you'll be working in teams of 2-3.

The key concepts we're covering in this lab are digital logic and how to
implement gates in Verilog. You're not looking to be a verilog expert by the end
of the lab--it's just a tool.

## Part 1 - Single-Bit Adders 

### What

Implement a half and a full adder in Verilog and demonstrate functionality by
stepping through all rows of the truth table in your testbench. Complete this by
yourself, and submit a link to Canvas for _your_ git repo for this part.

Make sure that you implement the adders using _structural_ Verilog! You can use
any of the following gates: AND, OR, NAND, NOR, NOT, XOR, XNOR.

You'll find module stubs in ``adders.v``, like this:

    // Half Adder
    module half_adder(
      input  A, B, // Input Operands
      output S,    // Sum
      output Co);  // Carry Out

      // Your Code Here!
    endmodule

    // Full Adder
    module full_adder(
      input  A,B, // Input Operands
      input  Ci,  // Carry In
      output S,   // Sum
      output Co); // Carry Out

      // Your Code Here!
    endmodule

You'll also need to test your code, so you can make use of the ``test_ha.v`` and
``test_fa.v`` testbench stubs that we've provided. To test your half adder, you
can do the following:

    make test_ha.bin
    ./test_ha.bin

This will compile your Verilog. If there are no errors, you can run the
resulting file and look at the output! If you want to have a look at the
waveforms in gtkwave, you can do the following:

    make test_ha.vcd
    gtkwave test_ha.vcd

Note that for gtkwave to work, you have to have a correctly compiling Verilog
codebase.

The most common issues with your code are going to be missing semicolons. Check
for that first. iVerilog has some pretty abysmal feedback on syntax errors (as
do many tools), so this will be a bit of a trial by fire.

### Why

This exercise is primarily to get you to install the tools, run them, and to get
familiar with the basic syntax of Verilog. It's not intended to cause headaches
and late nights--if you're having trouble, seek help from a NINJA ASAP!

## Part 2 - n-Bit Adders

### What

Work in a team or with a partner to build a 4-bit ripple carry adder.
Exhaustively test the adder in a testbench making use of self checking code.
Submit a link to Canvas for your group's git repo for this part.

Fill out the code stub in ``adders.v`` for your 4-bit ripple carry adder, and
test your adder with ``test_ripple.v``.

### Why

You'll be working in teams to complete your labs for the rest of the semester.
This is an opportunity for you to make sure that your tools are set up properly
to collaborate and for you to find peers to work with! 

Again, don't struggle in silence--this exercise is just to get the
infrastructure built, not to eat into your sleep schedule. Seek out NINJAs if
you need help!

## Heavy Lift

### What

Build a 16-bit non-ripple-carry adder of your choice. Some potential options
include Carry Skip, Carry Select, Kogge Stone... the sky's the limit!

### Why

If you feel like you have a good handle on things and you want to look at some
interesting tricks people have come up with to address the vagaries of carry
chains in binary addition. This is purely optional.
