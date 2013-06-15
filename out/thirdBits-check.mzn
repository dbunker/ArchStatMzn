% solver for function thirdBits

include "globals.mzn";
include "commands.mzn";
int: k = 32;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spec assignments

array[0..k-1] of var bool: spec_x;

array[0..k-1] of var bool: spec_x_temp_1;

array[0..k-1] of var bool: spec_x_temp_2;

constraint spec_x_temp_2[0] = true /\ spec_x_temp_2[1] = false /\ spec_x_temp_2[2] = false /\ spec_x_temp_2[3] = true /\ spec_x_temp_2[4] = false /\ spec_x_temp_2[5] = false /\ spec_x_temp_2[6] = true /\ spec_x_temp_2[7] = false /\ spec_x_temp_2[8] = false /\ spec_x_temp_2[9] = false /\ spec_x_temp_2[10] = false /\ spec_x_temp_2[11] = false /\ spec_x_temp_2[12] = false /\ spec_x_temp_2[13] = false /\ spec_x_temp_2[14] = false /\ spec_x_temp_2[15] = false /\ spec_x_temp_2[16] = false /\ spec_x_temp_2[17] = false /\ spec_x_temp_2[18] = false /\ spec_x_temp_2[19] = false /\ spec_x_temp_2[20] = false /\ spec_x_temp_2[21] = false /\ spec_x_temp_2[22] = false /\ spec_x_temp_2[23] = false /\ spec_x_temp_2[24] = false /\ spec_x_temp_2[25] = false /\ spec_x_temp_2[26] = false /\ spec_x_temp_2[27] = false /\ spec_x_temp_2[28] = false /\ spec_x_temp_2[29] = false /\ spec_x_temp_2[30] = false /\ spec_x_temp_2[31] = false;

array[0..k-1] of var bool: spec_x_temp_3;

constraint spec_x_temp_3[0] = true /\ spec_x_temp_3[1] = false /\ spec_x_temp_3[2] = false /\ spec_x_temp_3[3] = true /\ spec_x_temp_3[4] = false /\ spec_x_temp_3[5] = false /\ spec_x_temp_3[6] = false /\ spec_x_temp_3[7] = false /\ spec_x_temp_3[8] = false /\ spec_x_temp_3[9] = false /\ spec_x_temp_3[10] = false /\ spec_x_temp_3[11] = false /\ spec_x_temp_3[12] = false /\ spec_x_temp_3[13] = false /\ spec_x_temp_3[14] = false /\ spec_x_temp_3[15] = false /\ spec_x_temp_3[16] = false /\ spec_x_temp_3[17] = false /\ spec_x_temp_3[18] = false /\ spec_x_temp_3[19] = false /\ spec_x_temp_3[20] = false /\ spec_x_temp_3[21] = false /\ spec_x_temp_3[22] = false /\ spec_x_temp_3[23] = false /\ spec_x_temp_3[24] = false /\ spec_x_temp_3[25] = false /\ spec_x_temp_3[26] = false /\ spec_x_temp_3[27] = false /\ spec_x_temp_3[28] = false /\ spec_x_temp_3[29] = false /\ spec_x_temp_3[30] = false /\ spec_x_temp_3[31] = false;

% ( spec_x_temp_1 = spec_x_temp_2 << spec_x_temp_3 )
constraint shift_left(spec_x_temp_2, spec_x_temp_3, spec_x_temp_1);

array[0..k-1] of var bool: spec_x_temp_4;

constraint spec_x_temp_4[0] = true /\ spec_x_temp_4[1] = false /\ spec_x_temp_4[2] = false /\ spec_x_temp_4[3] = true /\ spec_x_temp_4[4] = false /\ spec_x_temp_4[5] = false /\ spec_x_temp_4[6] = true /\ spec_x_temp_4[7] = false /\ spec_x_temp_4[8] = false /\ spec_x_temp_4[9] = false /\ spec_x_temp_4[10] = false /\ spec_x_temp_4[11] = false /\ spec_x_temp_4[12] = false /\ spec_x_temp_4[13] = false /\ spec_x_temp_4[14] = false /\ spec_x_temp_4[15] = false /\ spec_x_temp_4[16] = false /\ spec_x_temp_4[17] = false /\ spec_x_temp_4[18] = false /\ spec_x_temp_4[19] = false /\ spec_x_temp_4[20] = false /\ spec_x_temp_4[21] = false /\ spec_x_temp_4[22] = false /\ spec_x_temp_4[23] = false /\ spec_x_temp_4[24] = false /\ spec_x_temp_4[25] = false /\ spec_x_temp_4[26] = false /\ spec_x_temp_4[27] = false /\ spec_x_temp_4[28] = false /\ spec_x_temp_4[29] = false /\ spec_x_temp_4[30] = false /\ spec_x_temp_4[31] = false;

% ( spec_x = spec_x_temp_1 + spec_x_temp_4 )
constraint binary_add(spec_x_temp_1, spec_x_temp_4, false, spec_x);

array[0..k-1] of var bool: spec_oldX;

constraint forall(i in 0..k-1)( spec_oldX[i] = spec_x[i] );

array[0..k-1] of var bool: spec_x_dup_1;

array[0..k-1] of var bool: spec_x_dup_1_temp_1;

array[0..k-1] of var bool: spec_x_dup_1_temp_2;

constraint spec_x_dup_1_temp_2[0] = false /\ spec_x_dup_1_temp_2[1] = true /\ spec_x_dup_1_temp_2[2] = false /\ spec_x_dup_1_temp_2[3] = false /\ spec_x_dup_1_temp_2[4] = true /\ spec_x_dup_1_temp_2[5] = false /\ spec_x_dup_1_temp_2[6] = false /\ spec_x_dup_1_temp_2[7] = false /\ spec_x_dup_1_temp_2[8] = false /\ spec_x_dup_1_temp_2[9] = false /\ spec_x_dup_1_temp_2[10] = false /\ spec_x_dup_1_temp_2[11] = false /\ spec_x_dup_1_temp_2[12] = false /\ spec_x_dup_1_temp_2[13] = false /\ spec_x_dup_1_temp_2[14] = false /\ spec_x_dup_1_temp_2[15] = false /\ spec_x_dup_1_temp_2[16] = false /\ spec_x_dup_1_temp_2[17] = false /\ spec_x_dup_1_temp_2[18] = false /\ spec_x_dup_1_temp_2[19] = false /\ spec_x_dup_1_temp_2[20] = false /\ spec_x_dup_1_temp_2[21] = false /\ spec_x_dup_1_temp_2[22] = false /\ spec_x_dup_1_temp_2[23] = false /\ spec_x_dup_1_temp_2[24] = false /\ spec_x_dup_1_temp_2[25] = false /\ spec_x_dup_1_temp_2[26] = false /\ spec_x_dup_1_temp_2[27] = false /\ spec_x_dup_1_temp_2[28] = false /\ spec_x_dup_1_temp_2[29] = false /\ spec_x_dup_1_temp_2[30] = false /\ spec_x_dup_1_temp_2[31] = false;

% ( spec_x_dup_1_temp_1 = spec_x << spec_x_dup_1_temp_2 )
constraint shift_left(spec_x, spec_x_dup_1_temp_2, spec_x_dup_1_temp_1);

% ( spec_x_dup_1 = spec_x_dup_1_temp_1 + spec_oldX )
constraint binary_add(spec_x_dup_1_temp_1, spec_oldX, false, spec_x_dup_1);

array[0..k-1] of var bool: specReturn;

constraint forall(i in 0..k-1)( specReturn[i] = spec_x_dup_1[i] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% other assignments

array[0..k-1] of var bool: other_x;

constraint other_x[0] = false /\ other_x[1] = false /\ other_x[2] = true /\ other_x[3] = false /\ other_x[4] = false /\ other_x[5] = true /\ other_x[6] = false /\ other_x[7] = false /\ other_x[8] = false /\ other_x[9] = false /\ other_x[10] = false /\ other_x[11] = false /\ other_x[12] = false /\ other_x[13] = false /\ other_x[14] = false /\ other_x[15] = false /\ other_x[16] = false /\ other_x[17] = false /\ other_x[18] = false /\ other_x[19] = false /\ other_x[20] = false /\ other_x[21] = false /\ other_x[22] = false /\ other_x[23] = false /\ other_x[24] = false /\ other_x[25] = false /\ other_x[26] = false /\ other_x[27] = false /\ other_x[28] = false /\ other_x[29] = false /\ other_x[30] = false /\ other_x[31] = false;

array[0..k-1] of var bool: other_x_dup_1;

array[0..k-1] of var bool: other_x_dup_1_temp_1;

array[0..k-1] of var bool: other_x_dup_1_temp_2;

constraint other_x_dup_1_temp_2[0] = false /\ other_x_dup_1_temp_2[1] = true /\ other_x_dup_1_temp_2[2] = true /\ other_x_dup_1_temp_2[3] = false /\ other_x_dup_1_temp_2[4] = false /\ other_x_dup_1_temp_2[5] = false /\ other_x_dup_1_temp_2[6] = false /\ other_x_dup_1_temp_2[7] = false /\ other_x_dup_1_temp_2[8] = false /\ other_x_dup_1_temp_2[9] = false /\ other_x_dup_1_temp_2[10] = false /\ other_x_dup_1_temp_2[11] = false /\ other_x_dup_1_temp_2[12] = false /\ other_x_dup_1_temp_2[13] = false /\ other_x_dup_1_temp_2[14] = false /\ other_x_dup_1_temp_2[15] = false /\ other_x_dup_1_temp_2[16] = false /\ other_x_dup_1_temp_2[17] = false /\ other_x_dup_1_temp_2[18] = false /\ other_x_dup_1_temp_2[19] = false /\ other_x_dup_1_temp_2[20] = false /\ other_x_dup_1_temp_2[21] = false /\ other_x_dup_1_temp_2[22] = false /\ other_x_dup_1_temp_2[23] = false /\ other_x_dup_1_temp_2[24] = false /\ other_x_dup_1_temp_2[25] = false /\ other_x_dup_1_temp_2[26] = false /\ other_x_dup_1_temp_2[27] = false /\ other_x_dup_1_temp_2[28] = false /\ other_x_dup_1_temp_2[29] = false /\ other_x_dup_1_temp_2[30] = false /\ other_x_dup_1_temp_2[31] = false;

% ( other_x_dup_1_temp_1 = other_x << other_x_dup_1_temp_2 )
constraint shift_left(other_x, other_x_dup_1_temp_2, other_x_dup_1_temp_1);

% ( other_x_dup_1 = other_x + other_x_dup_1_temp_1 )
constraint binary_add(other_x, other_x_dup_1_temp_1, false, other_x_dup_1);

array[0..k-1] of var bool: other_x_dup_2;

array[0..k-1] of var bool: other_x_dup_2_temp_1;

array[0..k-1] of var bool: other_x_dup_2_temp_2;

constraint other_x_dup_2_temp_2[0] = false /\ other_x_dup_2_temp_2[1] = false /\ other_x_dup_2_temp_2[2] = true /\ other_x_dup_2_temp_2[3] = true /\ other_x_dup_2_temp_2[4] = false /\ other_x_dup_2_temp_2[5] = false /\ other_x_dup_2_temp_2[6] = false /\ other_x_dup_2_temp_2[7] = false /\ other_x_dup_2_temp_2[8] = false /\ other_x_dup_2_temp_2[9] = false /\ other_x_dup_2_temp_2[10] = false /\ other_x_dup_2_temp_2[11] = false /\ other_x_dup_2_temp_2[12] = false /\ other_x_dup_2_temp_2[13] = false /\ other_x_dup_2_temp_2[14] = false /\ other_x_dup_2_temp_2[15] = false /\ other_x_dup_2_temp_2[16] = false /\ other_x_dup_2_temp_2[17] = false /\ other_x_dup_2_temp_2[18] = false /\ other_x_dup_2_temp_2[19] = false /\ other_x_dup_2_temp_2[20] = false /\ other_x_dup_2_temp_2[21] = false /\ other_x_dup_2_temp_2[22] = false /\ other_x_dup_2_temp_2[23] = false /\ other_x_dup_2_temp_2[24] = false /\ other_x_dup_2_temp_2[25] = false /\ other_x_dup_2_temp_2[26] = false /\ other_x_dup_2_temp_2[27] = false /\ other_x_dup_2_temp_2[28] = false /\ other_x_dup_2_temp_2[29] = false /\ other_x_dup_2_temp_2[30] = false /\ other_x_dup_2_temp_2[31] = false;

% ( other_x_dup_2_temp_1 = other_x_dup_1 << other_x_dup_2_temp_2 )
constraint shift_left(other_x_dup_1, other_x_dup_2_temp_2, other_x_dup_2_temp_1);

% ( other_x_dup_2 = other_x_dup_1 + other_x_dup_2_temp_1 )
constraint binary_add(other_x_dup_1, other_x_dup_2_temp_1, false, other_x_dup_2);

array[0..k-1] of var bool: other_x_dup_3;

array[0..k-1] of var bool: other_x_dup_3_temp_1;

array[0..k-1] of var bool: other_x_dup_3_temp_2;

constraint other_x_dup_3_temp_2[0] = false /\ other_x_dup_3_temp_2[1] = false /\ other_x_dup_3_temp_2[2] = false /\ other_x_dup_3_temp_2[3] = true /\ other_x_dup_3_temp_2[4] = true /\ other_x_dup_3_temp_2[5] = false /\ other_x_dup_3_temp_2[6] = false /\ other_x_dup_3_temp_2[7] = false /\ other_x_dup_3_temp_2[8] = false /\ other_x_dup_3_temp_2[9] = false /\ other_x_dup_3_temp_2[10] = false /\ other_x_dup_3_temp_2[11] = false /\ other_x_dup_3_temp_2[12] = false /\ other_x_dup_3_temp_2[13] = false /\ other_x_dup_3_temp_2[14] = false /\ other_x_dup_3_temp_2[15] = false /\ other_x_dup_3_temp_2[16] = false /\ other_x_dup_3_temp_2[17] = false /\ other_x_dup_3_temp_2[18] = false /\ other_x_dup_3_temp_2[19] = false /\ other_x_dup_3_temp_2[20] = false /\ other_x_dup_3_temp_2[21] = false /\ other_x_dup_3_temp_2[22] = false /\ other_x_dup_3_temp_2[23] = false /\ other_x_dup_3_temp_2[24] = false /\ other_x_dup_3_temp_2[25] = false /\ other_x_dup_3_temp_2[26] = false /\ other_x_dup_3_temp_2[27] = false /\ other_x_dup_3_temp_2[28] = false /\ other_x_dup_3_temp_2[29] = false /\ other_x_dup_3_temp_2[30] = false /\ other_x_dup_3_temp_2[31] = false;

% ( other_x_dup_3_temp_1 = other_x_dup_2 << other_x_dup_3_temp_2 )
constraint shift_left(other_x_dup_2, other_x_dup_3_temp_2, other_x_dup_3_temp_1);

% ( other_x_dup_3 = other_x_dup_2 + other_x_dup_3_temp_1 )
constraint binary_add(other_x_dup_2, other_x_dup_3_temp_1, false, other_x_dup_3);

array[0..k-1] of var bool: otherReturn;

array[0..k-1] of var bool: otherReturn_temp_1;

array[0..k-1] of var bool: otherReturn_temp_2;

constraint otherReturn_temp_2[0] = true /\ otherReturn_temp_2[1] = false /\ otherReturn_temp_2[2] = false /\ otherReturn_temp_2[3] = false /\ otherReturn_temp_2[4] = false /\ otherReturn_temp_2[5] = false /\ otherReturn_temp_2[6] = false /\ otherReturn_temp_2[7] = false /\ otherReturn_temp_2[8] = false /\ otherReturn_temp_2[9] = false /\ otherReturn_temp_2[10] = false /\ otherReturn_temp_2[11] = false /\ otherReturn_temp_2[12] = false /\ otherReturn_temp_2[13] = false /\ otherReturn_temp_2[14] = false /\ otherReturn_temp_2[15] = false /\ otherReturn_temp_2[16] = false /\ otherReturn_temp_2[17] = false /\ otherReturn_temp_2[18] = false /\ otherReturn_temp_2[19] = false /\ otherReturn_temp_2[20] = false /\ otherReturn_temp_2[21] = false /\ otherReturn_temp_2[22] = false /\ otherReturn_temp_2[23] = false /\ otherReturn_temp_2[24] = false /\ otherReturn_temp_2[25] = false /\ otherReturn_temp_2[26] = false /\ otherReturn_temp_2[27] = false /\ otherReturn_temp_2[28] = false /\ otherReturn_temp_2[29] = false /\ otherReturn_temp_2[30] = false /\ otherReturn_temp_2[31] = false;

% ( otherReturn_temp_1 = other_x_dup_3 << otherReturn_temp_2 )
constraint shift_left(other_x_dup_3, otherReturn_temp_2, otherReturn_temp_1);

array[0..k-1] of var bool: otherReturn_temp_3;

constraint otherReturn_temp_3[0] = true /\ otherReturn_temp_3[1] = false /\ otherReturn_temp_3[2] = false /\ otherReturn_temp_3[3] = false /\ otherReturn_temp_3[4] = false /\ otherReturn_temp_3[5] = false /\ otherReturn_temp_3[6] = false /\ otherReturn_temp_3[7] = false /\ otherReturn_temp_3[8] = false /\ otherReturn_temp_3[9] = false /\ otherReturn_temp_3[10] = false /\ otherReturn_temp_3[11] = false /\ otherReturn_temp_3[12] = false /\ otherReturn_temp_3[13] = false /\ otherReturn_temp_3[14] = false /\ otherReturn_temp_3[15] = false /\ otherReturn_temp_3[16] = false /\ otherReturn_temp_3[17] = false /\ otherReturn_temp_3[18] = false /\ otherReturn_temp_3[19] = false /\ otherReturn_temp_3[20] = false /\ otherReturn_temp_3[21] = false /\ otherReturn_temp_3[22] = false /\ otherReturn_temp_3[23] = false /\ otherReturn_temp_3[24] = false /\ otherReturn_temp_3[25] = false /\ otherReturn_temp_3[26] = false /\ otherReturn_temp_3[27] = false /\ otherReturn_temp_3[28] = false /\ otherReturn_temp_3[29] = false /\ otherReturn_temp_3[30] = false /\ otherReturn_temp_3[31] = false;

% ( otherReturn = otherReturn_temp_1 + otherReturn_temp_3 )
constraint binary_add(otherReturn_temp_1, otherReturn_temp_3, false, otherReturn);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spec and other have identical input parameters

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% check if there is ever an inequality in output

array[0..k-1] of var bool: anyIneq;

constraint forall(i in 0..k-1)( anyIneq[i] = (specReturn[i] xor otherReturn[i]) );

constraint exists(anyIneq);

solve satisfy;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% if conflict found, display parameters and return values

var -pow(2,k-1)..pow(2,k-1)-1: expected;
constraint expected = sum(j in 0..k-2)( bool2int(specReturn[j]) * pow(2,j) )
	- bool2int(specReturn[k-1]) * pow(2,k-1);

var -pow(2,k-1)..pow(2,k-1)-1: got;
constraint got = sum(j in 0..k-2)( bool2int(otherReturn[j]) * pow(2,j) )
	- bool2int(otherReturn[k-1]) * pow(2,k-1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% show

output [
"expected=", show(expected), "\n",
"got=", show(got),
];
