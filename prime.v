module DFlipFlop(Q , data, clk,reset);

input data, clk;
input reset;
output reg Q;
always @ (posedge clk)
	Q <= data;
always @ (reset == 1)
	Q<=0;

endmodule

module divisibility3(out,data,clk);
input [7:0]data;
input clk;
output out;
reg inp,reset;


CheckThree D3 (out,inp,clk,reset);
initial begin
reset=1;
inp=0;
#50
reset =0;
inp = data[7];
#50
inp=data[6];
#50
inp=data[5];
#50
inp=data[4];
#50
inp=data[3];
#50
inp=data[2];
#50
inp=data[1];
#50
inp=data[0];
end
endmodule

module CheckThree(out, in, clk,reset); 

input in,clk,reset;
output out;

wire A,B;
wire Da,Db;
or (Da,in & A, B & (~in));
or (Db,~in & A, ~A & ~B & in);

DFlipFlop f1(A,Da,clk,reset);
DFlipFlop f2(B,Db,clk,reset);

and(out,~A,~B);
endmodule

module CheckEleven(out, in, clk,reset);
input in,clk,reset;
output out;

wire A,B,C,D;
wire Da,Db,Dc,Dd;

or (Da,A&C,B&~C&~D,B&~C&~in,A&D&in);
or (Db,~A&~B&C,C&D&in,A&~C&~D,A&~C&~in);
or (Dc,D&~in,~A&~B&D,A&~D&in,B&C&~D&in);
or (Dd,A&~in,~A&~B&in,B&C&~in,~A&~C&~D&in);

DFlipFlop f1(A,Da,clk,reset);
DFlipFlop f2(B,Db,clk,reset);
DFlipFlop f3(C,Dc,clk,reset);
DFlipFlop f4(D,Dd,clk,reset);

and(out,~A,~B,~C,~D);
endmodule


