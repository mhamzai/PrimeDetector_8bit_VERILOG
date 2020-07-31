# PrimeDetector8bit_VERILOG
This is an implementation of 8 bit prime number detector in VERILOG-HDL for Xilinx Spartan 6 FPGA. This a state machine algorithm to determine prime number within &lt;=8 cpu cycles which is a pretty fast implementation using the concept of prime numbers that a number is prime if it is not divisible by any prime number less than square root of that prime. So we check for division by primes under 15 (&lt; sq.rt of 255) using their state machines.
This Algorithm does not use any divider to check the divisibilty rather It uses Deterministic Finite Automata state machine to check the remainder of that number if it is divided by (2,3,5,7,11,13) by checking the bit patterns. 
It uses a D Flip Flop for the implementation of the state machines.
