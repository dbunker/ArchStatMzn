% solver for function sign

include "globals.mzn";
include "commands.mzn";
int: k = 32;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spec assignments

array[0..k-1] of var bool: spec_x;

array[0..k-1] of var bool: spec_neg;

array[0..k-1] of var bool: spec_neg_temp_1;

array[0..k-1] of var bool: spec_neg_temp_2;

constraint spec_neg_temp_2[0] = true /\ spec_neg_temp_2[1] = true /\ spec_neg_temp_2[2] = true /\ spec_neg_temp_2[3] = true /\ spec_neg_temp_2[4] = true /\ spec_neg_temp_2[5] = false /\ spec_neg_temp_2[6] = false /\ spec_neg_temp_2[7] = false /\ spec_neg_temp_2[8] = false /\ spec_neg_temp_2[9] = false /\ spec_neg_temp_2[10] = false /\ spec_neg_temp_2[11] = false /\ spec_neg_temp_2[12] = false /\ spec_neg_temp_2[13] = false /\ spec_neg_temp_2[14] = false /\ spec_neg_temp_2[15] = false /\ spec_neg_temp_2[16] = false /\ spec_neg_temp_2[17] = false /\ spec_neg_temp_2[18] = false /\ spec_neg_temp_2[19] = false /\ spec_neg_temp_2[20] = false /\ spec_neg_temp_2[21] = false /\ spec_neg_temp_2[22] = false /\ spec_neg_temp_2[23] = false /\ spec_neg_temp_2[24] = false /\ spec_neg_temp_2[25] = false /\ spec_neg_temp_2[26] = false /\ spec_neg_temp_2[27] = false /\ spec_neg_temp_2[28] = false /\ spec_neg_temp_2[29] = false /\ spec_neg_temp_2[30] = false /\ spec_neg_temp_2[31] = false;

% ( spec_neg_temp_1 = spec_x >> spec_neg_temp_2 )
constraint shift_right(spec_x, spec_neg_temp_2, spec_neg_temp_1);

array[0..k-1] of var bool: spec_neg_temp_3;

constraint spec_neg_temp_3[0] = true /\ spec_neg_temp_3[1] = false /\ spec_neg_temp_3[2] = false /\ spec_neg_temp_3[3] = false /\ spec_neg_temp_3[4] = false /\ spec_neg_temp_3[5] = false /\ spec_neg_temp_3[6] = false /\ spec_neg_temp_3[7] = false /\ spec_neg_temp_3[8] = false /\ spec_neg_temp_3[9] = false /\ spec_neg_temp_3[10] = false /\ spec_neg_temp_3[11] = false /\ spec_neg_temp_3[12] = false /\ spec_neg_temp_3[13] = false /\ spec_neg_temp_3[14] = false /\ spec_neg_temp_3[15] = false /\ spec_neg_temp_3[16] = false /\ spec_neg_temp_3[17] = false /\ spec_neg_temp_3[18] = false /\ spec_neg_temp_3[19] = false /\ spec_neg_temp_3[20] = false /\ spec_neg_temp_3[21] = false /\ spec_neg_temp_3[22] = false /\ spec_neg_temp_3[23] = false /\ spec_neg_temp_3[24] = false /\ spec_neg_temp_3[25] = false /\ spec_neg_temp_3[26] = false /\ spec_neg_temp_3[27] = false /\ spec_neg_temp_3[28] = false /\ spec_neg_temp_3[29] = false /\ spec_neg_temp_3[30] = false /\ spec_neg_temp_3[31] = false;

% ( spec_neg = spec_neg_temp_1 & spec_neg_temp_3 )
constraint forall(i in 0..k-1)( spec_neg[i] = (spec_neg_temp_1[i] /\ spec_neg_temp_3[i]) );

array[0..k-1] of var bool: spec_addNeg;

array[0..k-1] of var bool: spec_addNeg_temp_1;

% ( spec_addNeg_temp_1 = ~ spec_neg )
constraint forall(i in 0..k-1)( spec_addNeg_temp_1[i] = ( not spec_neg[i] ) );

array[0..k-1] of var bool: spec_addNeg_temp_2;

constraint spec_addNeg_temp_2[0] = true /\ spec_addNeg_temp_2[1] = false /\ spec_addNeg_temp_2[2] = false /\ spec_addNeg_temp_2[3] = false /\ spec_addNeg_temp_2[4] = false /\ spec_addNeg_temp_2[5] = false /\ spec_addNeg_temp_2[6] = false /\ spec_addNeg_temp_2[7] = false /\ spec_addNeg_temp_2[8] = false /\ spec_addNeg_temp_2[9] = false /\ spec_addNeg_temp_2[10] = false /\ spec_addNeg_temp_2[11] = false /\ spec_addNeg_temp_2[12] = false /\ spec_addNeg_temp_2[13] = false /\ spec_addNeg_temp_2[14] = false /\ spec_addNeg_temp_2[15] = false /\ spec_addNeg_temp_2[16] = false /\ spec_addNeg_temp_2[17] = false /\ spec_addNeg_temp_2[18] = false /\ spec_addNeg_temp_2[19] = false /\ spec_addNeg_temp_2[20] = false /\ spec_addNeg_temp_2[21] = false /\ spec_addNeg_temp_2[22] = false /\ spec_addNeg_temp_2[23] = false /\ spec_addNeg_temp_2[24] = false /\ spec_addNeg_temp_2[25] = false /\ spec_addNeg_temp_2[26] = false /\ spec_addNeg_temp_2[27] = false /\ spec_addNeg_temp_2[28] = false /\ spec_addNeg_temp_2[29] = false /\ spec_addNeg_temp_2[30] = false /\ spec_addNeg_temp_2[31] = false;

% ( spec_addNeg = spec_addNeg_temp_1 + spec_addNeg_temp_2 )
constraint binary_add(spec_addNeg_temp_1, spec_addNeg_temp_2, false, spec_addNeg);

array[0..k-1] of var bool: spec_addPos;

array[0..k-1] of var bool: spec_addPos_temp_1;

% ( spec_addPos_temp_1 = ! spec_neg )
constraint negate(spec_neg, spec_addPos_temp_1);

array[0..k-1] of var bool: spec_addPos_temp_2;

array[0..k-1] of var bool: spec_addPos_temp_3;

% ( spec_addPos_temp_3 = ! spec_x )
constraint negate(spec_x, spec_addPos_temp_3);

% ( spec_addPos_temp_2 = ! spec_addPos_temp_3 )
constraint negate(spec_addPos_temp_3, spec_addPos_temp_2);

% ( spec_addPos = spec_addPos_temp_1 & spec_addPos_temp_2 )
constraint forall(i in 0..k-1)( spec_addPos[i] = (spec_addPos_temp_1[i] /\ spec_addPos_temp_2[i]) );

array[0..k-1] of var bool: spec_sum;

% ( spec_sum = spec_addNeg + spec_addPos )
constraint binary_add(spec_addNeg, spec_addPos, false, spec_sum);

array[0..k-1] of var bool: specReturn;

constraint forall(i in 0..k-1)( specReturn[i] = spec_sum[i] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% other assignments

array[0..k-1] of var bool: other_x;

array[0..k-1] of var bool: otherReturn;

array[0..k-1] of var bool: otherReturn_temp_1;

array[0..k-1] of var bool: otherReturn_temp_2;

constraint otherReturn_temp_2[0] = true /\ otherReturn_temp_2[1] = true /\ otherReturn_temp_2[2] = true /\ otherReturn_temp_2[3] = true /\ otherReturn_temp_2[4] = true /\ otherReturn_temp_2[5] = false /\ otherReturn_temp_2[6] = false /\ otherReturn_temp_2[7] = false /\ otherReturn_temp_2[8] = false /\ otherReturn_temp_2[9] = false /\ otherReturn_temp_2[10] = false /\ otherReturn_temp_2[11] = false /\ otherReturn_temp_2[12] = false /\ otherReturn_temp_2[13] = false /\ otherReturn_temp_2[14] = false /\ otherReturn_temp_2[15] = false /\ otherReturn_temp_2[16] = false /\ otherReturn_temp_2[17] = false /\ otherReturn_temp_2[18] = false /\ otherReturn_temp_2[19] = false /\ otherReturn_temp_2[20] = false /\ otherReturn_temp_2[21] = false /\ otherReturn_temp_2[22] = false /\ otherReturn_temp_2[23] = false /\ otherReturn_temp_2[24] = false /\ otherReturn_temp_2[25] = false /\ otherReturn_temp_2[26] = false /\ otherReturn_temp_2[27] = false /\ otherReturn_temp_2[28] = false /\ otherReturn_temp_2[29] = false /\ otherReturn_temp_2[30] = false /\ otherReturn_temp_2[31] = false;

% ( otherReturn_temp_1 = other_x >> otherReturn_temp_2 )
constraint shift_right(other_x, otherReturn_temp_2, otherReturn_temp_1);

array[0..k-1] of var bool: otherReturn_temp_3;

array[0..k-1] of var bool: otherReturn_temp_4;

% ( otherReturn_temp_4 = ! other_x )
constraint negate(other_x, otherReturn_temp_4);

% ( otherReturn_temp_3 = ! otherReturn_temp_4 )
constraint negate(otherReturn_temp_4, otherReturn_temp_3);

% ( otherReturn = otherReturn_temp_1 | otherReturn_temp_3 )
constraint forall(i in 0..k-1)( otherReturn[i] = (otherReturn_temp_1[i] \/ otherReturn_temp_3[i]) );

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
