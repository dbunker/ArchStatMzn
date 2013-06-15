% solver for function isTmin

include "globals.mzn";
include "commands.mzn";
int: k = 32;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spec assignments

array[0..k-1] of var bool: spec_x;

array[0..k-1] of var bool: spec_allOne;

array[0..k-1] of var bool: spec_allOne_temp_1;

constraint spec_allOne_temp_1[0] = false /\ spec_allOne_temp_1[1] = false /\ spec_allOne_temp_1[2] = false /\ spec_allOne_temp_1[3] = false /\ spec_allOne_temp_1[4] = false /\ spec_allOne_temp_1[5] = false /\ spec_allOne_temp_1[6] = false /\ spec_allOne_temp_1[7] = false /\ spec_allOne_temp_1[8] = false /\ spec_allOne_temp_1[9] = false /\ spec_allOne_temp_1[10] = false /\ spec_allOne_temp_1[11] = false /\ spec_allOne_temp_1[12] = false /\ spec_allOne_temp_1[13] = false /\ spec_allOne_temp_1[14] = false /\ spec_allOne_temp_1[15] = false /\ spec_allOne_temp_1[16] = false /\ spec_allOne_temp_1[17] = false /\ spec_allOne_temp_1[18] = false /\ spec_allOne_temp_1[19] = false /\ spec_allOne_temp_1[20] = false /\ spec_allOne_temp_1[21] = false /\ spec_allOne_temp_1[22] = false /\ spec_allOne_temp_1[23] = false /\ spec_allOne_temp_1[24] = false /\ spec_allOne_temp_1[25] = false /\ spec_allOne_temp_1[26] = false /\ spec_allOne_temp_1[27] = false /\ spec_allOne_temp_1[28] = false /\ spec_allOne_temp_1[29] = false /\ spec_allOne_temp_1[30] = false /\ spec_allOne_temp_1[31] = false;

% ( spec_allOne = ~ spec_allOne_temp_1 )
constraint forall(i in 0..k-1)( spec_allOne[i] = ( not spec_allOne_temp_1[i] ) );

array[0..k-1] of var bool: spec_sum;

% ( spec_sum = spec_allOne + spec_x )
constraint binary_add(spec_allOne, spec_x, false, spec_sum);

array[0..k-1] of var bool: spec_eq;

array[0..k-1] of var bool: spec_eq_temp_1;

% ( spec_eq_temp_1 = ~ spec_x )
constraint forall(i in 0..k-1)( spec_eq_temp_1[i] = ( not spec_x[i] ) );

% ( spec_eq = spec_eq_temp_1 ^ spec_sum )
constraint forall(i in 0..k-1)( spec_eq[i] = (spec_eq_temp_1[i] xor spec_sum[i]) );

array[0..k-1] of var bool: spec_eq_dup_1;

array[0..k-1] of var bool: spec_eq_dup_1_temp_1;

array[0..k-1] of var bool: spec_eq_dup_1_temp_2;

array[0..k-1] of var bool: spec_eq_dup_1_temp_3;

constraint spec_eq_dup_1_temp_3[0] = false /\ spec_eq_dup_1_temp_3[1] = false /\ spec_eq_dup_1_temp_3[2] = false /\ spec_eq_dup_1_temp_3[3] = false /\ spec_eq_dup_1_temp_3[4] = false /\ spec_eq_dup_1_temp_3[5] = false /\ spec_eq_dup_1_temp_3[6] = false /\ spec_eq_dup_1_temp_3[7] = false /\ spec_eq_dup_1_temp_3[8] = false /\ spec_eq_dup_1_temp_3[9] = false /\ spec_eq_dup_1_temp_3[10] = false /\ spec_eq_dup_1_temp_3[11] = false /\ spec_eq_dup_1_temp_3[12] = false /\ spec_eq_dup_1_temp_3[13] = false /\ spec_eq_dup_1_temp_3[14] = false /\ spec_eq_dup_1_temp_3[15] = false /\ spec_eq_dup_1_temp_3[16] = false /\ spec_eq_dup_1_temp_3[17] = false /\ spec_eq_dup_1_temp_3[18] = false /\ spec_eq_dup_1_temp_3[19] = false /\ spec_eq_dup_1_temp_3[20] = false /\ spec_eq_dup_1_temp_3[21] = false /\ spec_eq_dup_1_temp_3[22] = false /\ spec_eq_dup_1_temp_3[23] = false /\ spec_eq_dup_1_temp_3[24] = false /\ spec_eq_dup_1_temp_3[25] = false /\ spec_eq_dup_1_temp_3[26] = false /\ spec_eq_dup_1_temp_3[27] = false /\ spec_eq_dup_1_temp_3[28] = false /\ spec_eq_dup_1_temp_3[29] = false /\ spec_eq_dup_1_temp_3[30] = false /\ spec_eq_dup_1_temp_3[31] = false;

% ( spec_eq_dup_1_temp_2 = spec_eq_dup_1_temp_3 ^ spec_x )
constraint forall(i in 0..k-1)( spec_eq_dup_1_temp_2[i] = (spec_eq_dup_1_temp_3[i] xor spec_x[i]) );

% ( spec_eq_dup_1_temp_1 = ! spec_eq_dup_1_temp_2 )
constraint negate(spec_eq_dup_1_temp_2, spec_eq_dup_1_temp_1);

% ( spec_eq_dup_1 = spec_eq + spec_eq_dup_1_temp_1 )
constraint binary_add(spec_eq, spec_eq_dup_1_temp_1, false, spec_eq_dup_1);

array[0..k-1] of var bool: spec_truth;

% ( spec_truth = ! spec_eq_dup_1 )
constraint negate(spec_eq_dup_1, spec_truth);

array[0..k-1] of var bool: specReturn;

constraint forall(i in 0..k-1)( specReturn[i] = spec_truth[i] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% other assignments

array[0..k-1] of var bool: other_x;

array[0..k-1] of var bool: otherReturn;

array[0..k-1] of var bool: otherReturn_temp_1;

array[0..k-1] of var bool: otherReturn_temp_2;

array[0..k-1] of var bool: otherReturn_temp_3;

constraint otherReturn_temp_3[0] = true /\ otherReturn_temp_3[1] = false /\ otherReturn_temp_3[2] = false /\ otherReturn_temp_3[3] = false /\ otherReturn_temp_3[4] = false /\ otherReturn_temp_3[5] = false /\ otherReturn_temp_3[6] = false /\ otherReturn_temp_3[7] = false /\ otherReturn_temp_3[8] = false /\ otherReturn_temp_3[9] = false /\ otherReturn_temp_3[10] = false /\ otherReturn_temp_3[11] = false /\ otherReturn_temp_3[12] = false /\ otherReturn_temp_3[13] = false /\ otherReturn_temp_3[14] = false /\ otherReturn_temp_3[15] = false /\ otherReturn_temp_3[16] = false /\ otherReturn_temp_3[17] = false /\ otherReturn_temp_3[18] = false /\ otherReturn_temp_3[19] = false /\ otherReturn_temp_3[20] = false /\ otherReturn_temp_3[21] = false /\ otherReturn_temp_3[22] = false /\ otherReturn_temp_3[23] = false /\ otherReturn_temp_3[24] = false /\ otherReturn_temp_3[25] = false /\ otherReturn_temp_3[26] = false /\ otherReturn_temp_3[27] = false /\ otherReturn_temp_3[28] = false /\ otherReturn_temp_3[29] = false /\ otherReturn_temp_3[30] = false /\ otherReturn_temp_3[31] = false;

array[0..k-1] of var bool: otherReturn_temp_4;

constraint otherReturn_temp_4[0] = true /\ otherReturn_temp_4[1] = true /\ otherReturn_temp_4[2] = true /\ otherReturn_temp_4[3] = true /\ otherReturn_temp_4[4] = true /\ otherReturn_temp_4[5] = false /\ otherReturn_temp_4[6] = false /\ otherReturn_temp_4[7] = false /\ otherReturn_temp_4[8] = false /\ otherReturn_temp_4[9] = false /\ otherReturn_temp_4[10] = false /\ otherReturn_temp_4[11] = false /\ otherReturn_temp_4[12] = false /\ otherReturn_temp_4[13] = false /\ otherReturn_temp_4[14] = false /\ otherReturn_temp_4[15] = false /\ otherReturn_temp_4[16] = false /\ otherReturn_temp_4[17] = false /\ otherReturn_temp_4[18] = false /\ otherReturn_temp_4[19] = false /\ otherReturn_temp_4[20] = false /\ otherReturn_temp_4[21] = false /\ otherReturn_temp_4[22] = false /\ otherReturn_temp_4[23] = false /\ otherReturn_temp_4[24] = false /\ otherReturn_temp_4[25] = false /\ otherReturn_temp_4[26] = false /\ otherReturn_temp_4[27] = false /\ otherReturn_temp_4[28] = false /\ otherReturn_temp_4[29] = false /\ otherReturn_temp_4[30] = false /\ otherReturn_temp_4[31] = false;

% ( otherReturn_temp_2 = otherReturn_temp_3 << otherReturn_temp_4 )
constraint shift_left(otherReturn_temp_3, otherReturn_temp_4, otherReturn_temp_2);

% ( otherReturn_temp_1 = other_x ^ otherReturn_temp_2 )
constraint forall(i in 0..k-1)( otherReturn_temp_1[i] = (other_x[i] xor otherReturn_temp_2[i]) );

% ( otherReturn = ! otherReturn_temp_1 )
constraint negate(otherReturn_temp_1, otherReturn);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spec and other have identical input parameters

other_x = spec_x;

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
"expected=", show(expected), "\n",
"got=", show(got),
];
