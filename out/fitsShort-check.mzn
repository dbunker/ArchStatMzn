% solver for function fitsShort

include "globals.mzn";
include "commands.mzn";
int: k = 32;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spec assignments

array[0..k-1] of var bool: spec_x;

array[0..k-1] of var bool: spec_check;

array[0..k-1] of var bool: spec_check_temp_1;

array[0..k-1] of var bool: spec_check_temp_2;

constraint spec_check_temp_2[0] = false /\ spec_check_temp_2[1] = false /\ spec_check_temp_2[2] = false /\ spec_check_temp_2[3] = false /\ spec_check_temp_2[4] = false /\ spec_check_temp_2[5] = false /\ spec_check_temp_2[6] = false /\ spec_check_temp_2[7] = false /\ spec_check_temp_2[8] = false /\ spec_check_temp_2[9] = false /\ spec_check_temp_2[10] = false /\ spec_check_temp_2[11] = false /\ spec_check_temp_2[12] = false /\ spec_check_temp_2[13] = false /\ spec_check_temp_2[14] = false /\ spec_check_temp_2[15] = false /\ spec_check_temp_2[16] = false /\ spec_check_temp_2[17] = false /\ spec_check_temp_2[18] = false /\ spec_check_temp_2[19] = false /\ spec_check_temp_2[20] = false /\ spec_check_temp_2[21] = false /\ spec_check_temp_2[22] = false /\ spec_check_temp_2[23] = false /\ spec_check_temp_2[24] = false /\ spec_check_temp_2[25] = false /\ spec_check_temp_2[26] = false /\ spec_check_temp_2[27] = false /\ spec_check_temp_2[28] = false /\ spec_check_temp_2[29] = false /\ spec_check_temp_2[30] = false /\ spec_check_temp_2[31] = false;

% ( spec_check_temp_1 = ~ spec_check_temp_2 )
constraint forall(i in 0..k-1)( spec_check_temp_1[i] = ( not spec_check_temp_2[i] ) );

array[0..k-1] of var bool: spec_check_temp_3;

constraint spec_check_temp_3[0] = true /\ spec_check_temp_3[1] = true /\ spec_check_temp_3[2] = true /\ spec_check_temp_3[3] = true /\ spec_check_temp_3[4] = false /\ spec_check_temp_3[5] = false /\ spec_check_temp_3[6] = false /\ spec_check_temp_3[7] = false /\ spec_check_temp_3[8] = false /\ spec_check_temp_3[9] = false /\ spec_check_temp_3[10] = false /\ spec_check_temp_3[11] = false /\ spec_check_temp_3[12] = false /\ spec_check_temp_3[13] = false /\ spec_check_temp_3[14] = false /\ spec_check_temp_3[15] = false /\ spec_check_temp_3[16] = false /\ spec_check_temp_3[17] = false /\ spec_check_temp_3[18] = false /\ spec_check_temp_3[19] = false /\ spec_check_temp_3[20] = false /\ spec_check_temp_3[21] = false /\ spec_check_temp_3[22] = false /\ spec_check_temp_3[23] = false /\ spec_check_temp_3[24] = false /\ spec_check_temp_3[25] = false /\ spec_check_temp_3[26] = false /\ spec_check_temp_3[27] = false /\ spec_check_temp_3[28] = false /\ spec_check_temp_3[29] = false /\ spec_check_temp_3[30] = false /\ spec_check_temp_3[31] = false;

% ( spec_check = spec_check_temp_1 << spec_check_temp_3 )
constraint shift_left(spec_check_temp_1, spec_check_temp_3, spec_check);

array[0..k-1] of var bool: spec_firstHalf;

% ( spec_firstHalf = spec_x & spec_check )
constraint forall(i in 0..k-1)( spec_firstHalf[i] = (spec_x[i] /\ spec_check[i]) );

array[0..k-1] of var bool: spec_ans;

array[0..k-1] of var bool: spec_ans_temp_1;

% ( spec_ans_temp_1 = ! spec_firstHalf )
constraint negate(spec_firstHalf, spec_ans_temp_1);

array[0..k-1] of var bool: spec_ans_temp_2;

array[0..k-1] of var bool: spec_ans_temp_3;

% ( spec_ans_temp_3 = spec_firstHalf ^ spec_check )
constraint forall(i in 0..k-1)( spec_ans_temp_3[i] = (spec_firstHalf[i] xor spec_check[i]) );

% ( spec_ans_temp_2 = ! spec_ans_temp_3 )
constraint negate(spec_ans_temp_3, spec_ans_temp_2);

% ( spec_ans = spec_ans_temp_1 ^ spec_ans_temp_2 )
constraint forall(i in 0..k-1)( spec_ans[i] = (spec_ans_temp_1[i] xor spec_ans_temp_2[i]) );

array[0..k-1] of var bool: specReturn;

constraint forall(i in 0..k-1)( specReturn[i] = spec_ans[i] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% other assignments

array[0..k-1] of var bool: other_x;

array[0..k-1] of var bool: other_y;

array[0..k-1] of var bool: other_y_temp_1;

constraint other_y_temp_1[0] = true /\ other_y_temp_1[1] = true /\ other_y_temp_1[2] = true /\ other_y_temp_1[3] = true /\ other_y_temp_1[4] = false /\ other_y_temp_1[5] = false /\ other_y_temp_1[6] = false /\ other_y_temp_1[7] = false /\ other_y_temp_1[8] = false /\ other_y_temp_1[9] = false /\ other_y_temp_1[10] = false /\ other_y_temp_1[11] = false /\ other_y_temp_1[12] = false /\ other_y_temp_1[13] = false /\ other_y_temp_1[14] = false /\ other_y_temp_1[15] = false /\ other_y_temp_1[16] = false /\ other_y_temp_1[17] = false /\ other_y_temp_1[18] = false /\ other_y_temp_1[19] = false /\ other_y_temp_1[20] = false /\ other_y_temp_1[21] = false /\ other_y_temp_1[22] = false /\ other_y_temp_1[23] = false /\ other_y_temp_1[24] = false /\ other_y_temp_1[25] = false /\ other_y_temp_1[26] = false /\ other_y_temp_1[27] = false /\ other_y_temp_1[28] = false /\ other_y_temp_1[29] = false /\ other_y_temp_1[30] = false /\ other_y_temp_1[31] = false;

% ( other_y = other_x >> other_y_temp_1 )
constraint shift_right(other_x, other_y_temp_1, other_y);

array[0..k-1] of var bool: otherReturn;

array[0..k-1] of var bool: otherReturn_temp_1;

array[0..k-1] of var bool: otherReturn_temp_2;

array[0..k-1] of var bool: otherReturn_temp_3;

constraint otherReturn_temp_3[0] = false /\ otherReturn_temp_3[1] = false /\ otherReturn_temp_3[2] = false /\ otherReturn_temp_3[3] = false /\ otherReturn_temp_3[4] = false /\ otherReturn_temp_3[5] = false /\ otherReturn_temp_3[6] = false /\ otherReturn_temp_3[7] = false /\ otherReturn_temp_3[8] = false /\ otherReturn_temp_3[9] = false /\ otherReturn_temp_3[10] = false /\ otherReturn_temp_3[11] = false /\ otherReturn_temp_3[12] = false /\ otherReturn_temp_3[13] = false /\ otherReturn_temp_3[14] = false /\ otherReturn_temp_3[15] = false /\ otherReturn_temp_3[16] = false /\ otherReturn_temp_3[17] = false /\ otherReturn_temp_3[18] = false /\ otherReturn_temp_3[19] = false /\ otherReturn_temp_3[20] = false /\ otherReturn_temp_3[21] = false /\ otherReturn_temp_3[22] = false /\ otherReturn_temp_3[23] = false /\ otherReturn_temp_3[24] = false /\ otherReturn_temp_3[25] = false /\ otherReturn_temp_3[26] = false /\ otherReturn_temp_3[27] = false /\ otherReturn_temp_3[28] = false /\ otherReturn_temp_3[29] = false /\ otherReturn_temp_3[30] = false /\ otherReturn_temp_3[31] = false;

% ( otherReturn_temp_2 = other_y ^ otherReturn_temp_3 )
constraint forall(i in 0..k-1)( otherReturn_temp_2[i] = (other_y[i] xor otherReturn_temp_3[i]) );

% ( otherReturn_temp_1 = ! otherReturn_temp_2 )
constraint negate(otherReturn_temp_2, otherReturn_temp_1);

array[0..k-1] of var bool: otherReturn_temp_4;

array[0..k-1] of var bool: otherReturn_temp_5;

array[0..k-1] of var bool: otherReturn_temp_6;

array[0..k-1] of var bool: otherReturn_temp_7;

constraint otherReturn_temp_7[0] = false /\ otherReturn_temp_7[1] = false /\ otherReturn_temp_7[2] = false /\ otherReturn_temp_7[3] = false /\ otherReturn_temp_7[4] = false /\ otherReturn_temp_7[5] = false /\ otherReturn_temp_7[6] = false /\ otherReturn_temp_7[7] = false /\ otherReturn_temp_7[8] = false /\ otherReturn_temp_7[9] = false /\ otherReturn_temp_7[10] = false /\ otherReturn_temp_7[11] = false /\ otherReturn_temp_7[12] = false /\ otherReturn_temp_7[13] = false /\ otherReturn_temp_7[14] = false /\ otherReturn_temp_7[15] = false /\ otherReturn_temp_7[16] = false /\ otherReturn_temp_7[17] = false /\ otherReturn_temp_7[18] = false /\ otherReturn_temp_7[19] = false /\ otherReturn_temp_7[20] = false /\ otherReturn_temp_7[21] = false /\ otherReturn_temp_7[22] = false /\ otherReturn_temp_7[23] = false /\ otherReturn_temp_7[24] = false /\ otherReturn_temp_7[25] = false /\ otherReturn_temp_7[26] = false /\ otherReturn_temp_7[27] = false /\ otherReturn_temp_7[28] = false /\ otherReturn_temp_7[29] = false /\ otherReturn_temp_7[30] = false /\ otherReturn_temp_7[31] = false;

% ( otherReturn_temp_6 = ~ otherReturn_temp_7 )
constraint forall(i in 0..k-1)( otherReturn_temp_6[i] = ( not otherReturn_temp_7[i] ) );

% ( otherReturn_temp_5 = other_y ^ otherReturn_temp_6 )
constraint forall(i in 0..k-1)( otherReturn_temp_5[i] = (other_y[i] xor otherReturn_temp_6[i]) );

% ( otherReturn_temp_4 = ! otherReturn_temp_5 )
constraint negate(otherReturn_temp_5, otherReturn_temp_4);

% ( otherReturn = otherReturn_temp_1 + otherReturn_temp_4 )
constraint binary_add(otherReturn_temp_1, otherReturn_temp_4, false, otherReturn);

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
