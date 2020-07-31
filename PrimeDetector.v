module PrimeDetector(P,NP,in,clk,reset);

input[7:0] in;
input clk,reset;
output P,NP;

wire eq1,eq2,eq3,eq5,eq7,eq11,eq13;
wire div3,div5,div7,div11,div13;

Check_Equality EQ1(eq1,in,1);
Check_Equality EQ2(eq2,in,2);
Check_Equality EQ3(eq3,in,3);
Check_Equality EQ5(eq5,in,5);
Check_Equality EQ7(eq7,in,7);
Check_Equality EQ11(eq11,in,11);
Check_Equality EQ13(eq13,in,13);

//CheckDivisibility DIV (div3,div5,div7,div11,div13,in,clk,reset);
CheckDivisibility DIV (div3,div7,in,clk,reset);

// CheckDivisibilty Combined output
wire CDO;
or(CDO, (div3 & ~eq3) , (div7 & ~eq7));


or(NP, (~in[0]&~eq2) ,eq1 ,CDO);

nor(P,CDO, ~(in[0]||eq2));

endmodule


//out is output 
//in is input
//num is the number with which equality of input is to be checked
module Check_Equality(out,in,num);

input[7:0] in;
input[7:0] num;
output out;

wire[7:0]temp;

xnor(temp[0],in[0],num[0]);
xnor(temp[1],in[1],num[1]);
xnor(temp[2],in[2],num[2]);
xnor(temp[3],in[3],num[3]);
xnor(temp[4],in[4],num[4]);
xnor(temp[5],in[5],num[5]);
xnor(temp[6],in[6],num[6]);
xnor(temp[7],in[7],num[7]);

and(out,temp[0],temp[1],temp[2],temp[3],temp[4],temp[5],temp[6],temp[7]);

endmodule  
////////////////////////////////////////////////////////