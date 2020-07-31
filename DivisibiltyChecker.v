/////////////////////////////////////////////
//D Flip Flop Module used below
module DFlipFlop(Q , data, clk,reset);

input data, clk;
input reset;
output reg Q;
always @ (posedge clk)
	Q <= data;
always @ (reset == 1)
	Q<=0;

endmodule

//vector "in" is a register acting like shift register 
//every clock cycle shifts one bit to left
//and calls all the Divisibilty Checker (3,5,7,11,13) by sending data serially
//from MSB to LSB.

module CheckDivisibility(div3,div7,data,clk,reset);
input [7:0]data;
input clk,reset;
output div3,div7;
reg [7:0]shiftreg;
reg in;
always@ (negedge reset)
begin	
	shiftreg<=data;
	in<=data[7];
end


CheckThree D3 (div3,in,clk,reset);
//CheckFive D5 mod1(div5,in,clk,reset);
CheckSeven D7 (div7,in,clk,reset);
//CheckEleven D11 mod1(div11,in,clk,reset);
//CheckThirteen D13 mod1(div13,in,clk,reset);


always @ (posedge clk)
begin
	in<=shiftreg[7];
	shiftreg[7]<=shiftreg[6];
	shiftreg[6]<=shiftreg[5];
	shiftreg[5]<=shiftreg[4];
	shiftreg[4]<=shiftreg[3];
	shiftreg[3]<=shiftreg[2];
	shiftreg[2]<=shiftreg[1];
	shiftreg[1]<=shiftreg[0];
	shiftreg[0]<=0;
end



endmodule

module CheckThree(out, in, clk,reset);

input in,clk,reset;
output out;

wire A,B;
wire Da,Db;

or (Da,in & A, B & (~in));
or (Db,~in & A, ~A & ~B & in);

DFlipFlop D3f1(A,Da,clk,reset);
DFlipFlop D3f2(B,Db,clk,reset);

and(out,~A,~B);
endmodule

module CheckSeven(out, in, clk,reset);

input in,clk,reset;
output out;

wire A,B,C;
wire Da,Db,Dc;

or (Da,(B & ~C), (B & ~in) , (A & C & in));
or (Db,(C & ~in), (~A & ~B & C) , (A & ~C & in));
or (Dc, (A & ~in), (~A & ~B & in), (~A & ~C & in));


DFlipFlop D7f1(A,Da,clk,reset);
DFlipFlop D7f2(B,Db,clk,reset);
DFlipFlop D7f3(C,Dc,clk,reset);

and(out,~A,~B,~C);
endmodule


