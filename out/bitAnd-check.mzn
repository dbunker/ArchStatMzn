% solver for function bitAnd

include "globals.mzn";
include "commands.mzn";
int: k = 32;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spec assignments

array[0..k-1] of var bool: spec_x;

array[0..k-1] of var bool: spec_y;

array[0..k-1] of var bool: spec_i;

array[0..k-1] of var bool: spec_i_temp_1;

% ( spec_i_temp_1 = spec_x & spec_y )
constraint forall(i in 0..k-1)( spec_i_temp_1[i] = (spec_x[i] /\ spec_y[i]) );

array[0..k-1] of var bool: spec_i_temp_2;

constraint spec_i_temp_2[0] = true /\ spec_i_temp_2[1] = false /\ spec_i_temp_2[2] = false /\ spec_i_temp_2[3] = false /\ spec_i_temp_2[4] = false /\ spec_i_temp_2[5] = false /\ spec_i_temp_2[6] = false /\ spec_i_temp_2[7] = false /\ spec_i_temp_2[8] = false /\ spec_i_temp_2[9] = false /\ spec_i_temp_2[10] = false /\ spec_i_temp_2[11] = false /\ spec_i_temp_2[12] = false /\ spec_i_temp_2[13] = false /\ spec_i_temp_2[14] = false /\ spec_i_temp_2[15] = false /\ spec_i_temp_2[16] = false /\ spec_i_temp_2[17] = false /\ spec_i_temp_2[18] = false /\ spec_i_temp_2[19] = false /\ spec_i_temp_2[20] = false /\ spec_i_temp_2[21] = false /\ spec_i_temp_2[22] = false /\ spec_i_temp_2[23] = false /\ spec_i_temp_2[24] = false /\ spec_i_temp_2[25] = false /\ spec_i_temp_2[26] = false /\ spec_i_temp_2[27] = false /\ spec_i_temp_2[28] = false /\ spec_i_temp_2[29] = false /\ spec_i_temp_2[30] = false /\ spec_i_temp_2[31] = false;

% ( spec_i = spec_i_temp_1 | spec_i_temp_2 )
constraint forall(i in 0..k-1)( spec_i[i] = (spec_i_temp_1[i] \/ spec_i_temp_2[i]) );

array[0..k-1] of var bool: specReturn;

constraint forall(i in 0..k-1)( specReturn[i] = spec_i[i] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% other assignments

array[0..k-1] of var bool: other_x;

array[0..k-1] of var bool: other_y;

array[0..k-1] of var bool: other_i;

array[0..k-1] of var bool: other_i_temp_1;

array[0..k-1] of var bool: other_i_temp_2;

% ( other_i_temp_2 = ~ other_x )
constraint forall(i in 0..k-1)( other_i_temp_2[i] = ( not other_x[i] ) );

array[0..k-1] of var bool: other_i_temp_3;

% ( other_i_temp_3 = ~ other_y )
constraint forall(i in 0..k-1)( other_i_temp_3[i] = ( not other_y[i] ) );

% ( other_i_temp_1 = other_i_temp_2 | other_i_temp_3 )
constraint forall(i in 0..k-1)( other_i_temp_1[i] = (other_i_temp_2[i] \/ other_i_temp_3[i]) );

% ( other_i = ~ other_i_temp_1 )
constraint forall(i in 0..k-1)( other_i[i] = ( not other_i_temp_1[i] ) );

array[0..k-1] of var bool: otherReturn;

constraint forall(i in 0..k-1)( otherReturn[i] = other_i[i] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spec and other have identical input parameters

other_x = spec_x;

other_y = spec_y;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% check if there is ever an inequality in output

array[0..k-1] of var bool: anyIneq;

constraint forall(i in 0..k-1)( anyIneq[i] = (specReturn[i] xor otherReturn[i]) );

constraint exists(anyIneq);

solve satisfy;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% if conflict found, display parameters and return values

var -pow(2,k-1)..pow(2,k-1)-1: int_x;
constraint int_x = sum(j in 0..k-2)( bool2int(spec_x[j]) * pow(2,j) )
	- bool2int(spec_x[k-1]) * pow(2,k-1);

var -pow(2,k-1)..pow(2,k-1)-1: int_y;
constraint int_y = sum(j in 0..k-2)( bool2int(spec_y[j]) * pow(2,j) )
	- bool2int(spec_y[k-1]) * pow(2,k-1);

var -pow(2,k-1)..pow(2,k-1)-1: expected;
constraint expected = sum(j in 0..k-2)( bool2int(specReturn[j]) * pow(2,j) )
	- bool2int(specReturn[k-1]) * pow(2,k-1);

var -pow(2,k-1)..pow(2,k-1)-1: got;
constraint got = sum(j in 0..k-2)( bool2int(otherReturn[j]) * pow(2,j) )
	- bool2int(otherReturn[k-1]) * pow(2,k-1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% show

output [
"x=", show(int_x), "\n",
"y=", show(int_y), "\n",
"expected=", show(expected), "\n",
"got=", show(got),
];
