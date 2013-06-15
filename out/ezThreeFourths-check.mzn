% solver for function ezThreeFourths

include "globals.mzn";
include "commands.mzn";
int: k = 32;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spec assignments

array[0..k-1] of var bool: spec_x;

array[0..k-1] of var bool: spec_timesThree;

array[0..k-1] of var bool: spec_timesThree_temp_1;

% ( spec_timesThree_temp_1 = spec_x + spec_x )
constraint binary_add(spec_x, spec_x, false, spec_timesThree_temp_1);

% ( spec_timesThree = spec_timesThree_temp_1 + spec_x )
constraint binary_add(spec_timesThree_temp_1, spec_x, false, spec_timesThree);

array[0..k-1] of var bool: spec_div;

array[0..k-1] of var bool: spec_div_temp_1;

constraint spec_div_temp_1[0] = false /\ spec_div_temp_1[1] = true /\ spec_div_temp_1[2] = false /\ spec_div_temp_1[3] = false /\ spec_div_temp_1[4] = false /\ spec_div_temp_1[5] = false /\ spec_div_temp_1[6] = false /\ spec_div_temp_1[7] = false /\ spec_div_temp_1[8] = false /\ spec_div_temp_1[9] = false /\ spec_div_temp_1[10] = false /\ spec_div_temp_1[11] = false /\ spec_div_temp_1[12] = false /\ spec_div_temp_1[13] = false /\ spec_div_temp_1[14] = false /\ spec_div_temp_1[15] = false /\ spec_div_temp_1[16] = false /\ spec_div_temp_1[17] = false /\ spec_div_temp_1[18] = false /\ spec_div_temp_1[19] = false /\ spec_div_temp_1[20] = false /\ spec_div_temp_1[21] = false /\ spec_div_temp_1[22] = false /\ spec_div_temp_1[23] = false /\ spec_div_temp_1[24] = false /\ spec_div_temp_1[25] = false /\ spec_div_temp_1[26] = false /\ spec_div_temp_1[27] = false /\ spec_div_temp_1[28] = false /\ spec_div_temp_1[29] = false /\ spec_div_temp_1[30] = false /\ spec_div_temp_1[31] = false;

% ( spec_div = spec_timesThree >> spec_div_temp_1 )
constraint shift_right(spec_timesThree, spec_div_temp_1, spec_div);

array[0..k-1] of var bool: spec_isNeg;

array[0..k-1] of var bool: spec_isNeg_temp_1;

array[0..k-1] of var bool: spec_isNeg_temp_2;

constraint spec_isNeg_temp_2[0] = true /\ spec_isNeg_temp_2[1] = true /\ spec_isNeg_temp_2[2] = true /\ spec_isNeg_temp_2[3] = true /\ spec_isNeg_temp_2[4] = true /\ spec_isNeg_temp_2[5] = false /\ spec_isNeg_temp_2[6] = false /\ spec_isNeg_temp_2[7] = false /\ spec_isNeg_temp_2[8] = false /\ spec_isNeg_temp_2[9] = false /\ spec_isNeg_temp_2[10] = false /\ spec_isNeg_temp_2[11] = false /\ spec_isNeg_temp_2[12] = false /\ spec_isNeg_temp_2[13] = false /\ spec_isNeg_temp_2[14] = false /\ spec_isNeg_temp_2[15] = false /\ spec_isNeg_temp_2[16] = false /\ spec_isNeg_temp_2[17] = false /\ spec_isNeg_temp_2[18] = false /\ spec_isNeg_temp_2[19] = false /\ spec_isNeg_temp_2[20] = false /\ spec_isNeg_temp_2[21] = false /\ spec_isNeg_temp_2[22] = false /\ spec_isNeg_temp_2[23] = false /\ spec_isNeg_temp_2[24] = false /\ spec_isNeg_temp_2[25] = false /\ spec_isNeg_temp_2[26] = false /\ spec_isNeg_temp_2[27] = false /\ spec_isNeg_temp_2[28] = false /\ spec_isNeg_temp_2[29] = false /\ spec_isNeg_temp_2[30] = false /\ spec_isNeg_temp_2[31] = false;

% ( spec_isNeg_temp_1 = spec_timesThree >> spec_isNeg_temp_2 )
constraint shift_right(spec_timesThree, spec_isNeg_temp_2, spec_isNeg_temp_1);

array[0..k-1] of var bool: spec_isNeg_temp_3;

constraint spec_isNeg_temp_3[0] = true /\ spec_isNeg_temp_3[1] = false /\ spec_isNeg_temp_3[2] = false /\ spec_isNeg_temp_3[3] = false /\ spec_isNeg_temp_3[4] = false /\ spec_isNeg_temp_3[5] = false /\ spec_isNeg_temp_3[6] = false /\ spec_isNeg_temp_3[7] = false /\ spec_isNeg_temp_3[8] = false /\ spec_isNeg_temp_3[9] = false /\ spec_isNeg_temp_3[10] = false /\ spec_isNeg_temp_3[11] = false /\ spec_isNeg_temp_3[12] = false /\ spec_isNeg_temp_3[13] = false /\ spec_isNeg_temp_3[14] = false /\ spec_isNeg_temp_3[15] = false /\ spec_isNeg_temp_3[16] = false /\ spec_isNeg_temp_3[17] = false /\ spec_isNeg_temp_3[18] = false /\ spec_isNeg_temp_3[19] = false /\ spec_isNeg_temp_3[20] = false /\ spec_isNeg_temp_3[21] = false /\ spec_isNeg_temp_3[22] = false /\ spec_isNeg_temp_3[23] = false /\ spec_isNeg_temp_3[24] = false /\ spec_isNeg_temp_3[25] = false /\ spec_isNeg_temp_3[26] = false /\ spec_isNeg_temp_3[27] = false /\ spec_isNeg_temp_3[28] = false /\ spec_isNeg_temp_3[29] = false /\ spec_isNeg_temp_3[30] = false /\ spec_isNeg_temp_3[31] = false;

% ( spec_isNeg = spec_isNeg_temp_1 & spec_isNeg_temp_3 )
constraint forall(i in 0..k-1)( spec_isNeg[i] = (spec_isNeg_temp_1[i] /\ spec_isNeg_temp_3[i]) );

array[0..k-1] of var bool: spec_problem;

array[0..k-1] of var bool: spec_problem_temp_1;

array[0..k-1] of var bool: spec_problem_temp_2;

array[0..k-1] of var bool: spec_problem_temp_3;

array[0..k-1] of var bool: spec_problem_temp_4;

constraint spec_problem_temp_4[0] = true /\ spec_problem_temp_4[1] = true /\ spec_problem_temp_4[2] = false /\ spec_problem_temp_4[3] = false /\ spec_problem_temp_4[4] = false /\ spec_problem_temp_4[5] = false /\ spec_problem_temp_4[6] = false /\ spec_problem_temp_4[7] = false /\ spec_problem_temp_4[8] = false /\ spec_problem_temp_4[9] = false /\ spec_problem_temp_4[10] = false /\ spec_problem_temp_4[11] = false /\ spec_problem_temp_4[12] = false /\ spec_problem_temp_4[13] = false /\ spec_problem_temp_4[14] = false /\ spec_problem_temp_4[15] = false /\ spec_problem_temp_4[16] = false /\ spec_problem_temp_4[17] = false /\ spec_problem_temp_4[18] = false /\ spec_problem_temp_4[19] = false /\ spec_problem_temp_4[20] = false /\ spec_problem_temp_4[21] = false /\ spec_problem_temp_4[22] = false /\ spec_problem_temp_4[23] = false /\ spec_problem_temp_4[24] = false /\ spec_problem_temp_4[25] = false /\ spec_problem_temp_4[26] = false /\ spec_problem_temp_4[27] = false /\ spec_problem_temp_4[28] = false /\ spec_problem_temp_4[29] = false /\ spec_problem_temp_4[30] = false /\ spec_problem_temp_4[31] = false;

% ( spec_problem_temp_3 = spec_timesThree & spec_problem_temp_4 )
constraint forall(i in 0..k-1)( spec_problem_temp_3[i] = (spec_timesThree[i] /\ spec_problem_temp_4[i]) );

% ( spec_problem_temp_2 = ! spec_problem_temp_3 )
constraint negate(spec_problem_temp_3, spec_problem_temp_2);

% ( spec_problem_temp_1 = ! spec_problem_temp_2 )
constraint negate(spec_problem_temp_2, spec_problem_temp_1);

% ( spec_problem = spec_problem_temp_1 & spec_isNeg )
constraint forall(i in 0..k-1)( spec_problem[i] = (spec_problem_temp_1[i] /\ spec_isNeg[i]) );

array[0..k-1] of var bool: spec_fin;

% ( spec_fin = spec_div + spec_problem )
constraint binary_add(spec_div, spec_problem, false, spec_fin);

array[0..k-1] of var bool: specReturn;

constraint forall(i in 0..k-1)( specReturn[i] = spec_fin[i] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% other assignments

array[0..k-1] of var bool: other_x;

array[0..k-1] of var bool: other_z;

array[0..k-1] of var bool: other_z_temp_1;

% ( other_z_temp_1 = other_x + other_x )
constraint binary_add(other_x, other_x, false, other_z_temp_1);

% ( other_z = other_z_temp_1 + other_x )
constraint binary_add(other_z_temp_1, other_x, false, other_z);

array[0..k-1] of var bool: other_sign_z;

array[0..k-1] of var bool: other_sign_z_temp_1;

constraint other_sign_z_temp_1[0] = true /\ other_sign_z_temp_1[1] = true /\ other_sign_z_temp_1[2] = true /\ other_sign_z_temp_1[3] = true /\ other_sign_z_temp_1[4] = true /\ other_sign_z_temp_1[5] = false /\ other_sign_z_temp_1[6] = false /\ other_sign_z_temp_1[7] = false /\ other_sign_z_temp_1[8] = false /\ other_sign_z_temp_1[9] = false /\ other_sign_z_temp_1[10] = false /\ other_sign_z_temp_1[11] = false /\ other_sign_z_temp_1[12] = false /\ other_sign_z_temp_1[13] = false /\ other_sign_z_temp_1[14] = false /\ other_sign_z_temp_1[15] = false /\ other_sign_z_temp_1[16] = false /\ other_sign_z_temp_1[17] = false /\ other_sign_z_temp_1[18] = false /\ other_sign_z_temp_1[19] = false /\ other_sign_z_temp_1[20] = false /\ other_sign_z_temp_1[21] = false /\ other_sign_z_temp_1[22] = false /\ other_sign_z_temp_1[23] = false /\ other_sign_z_temp_1[24] = false /\ other_sign_z_temp_1[25] = false /\ other_sign_z_temp_1[26] = false /\ other_sign_z_temp_1[27] = false /\ other_sign_z_temp_1[28] = false /\ other_sign_z_temp_1[29] = false /\ other_sign_z_temp_1[30] = false /\ other_sign_z_temp_1[31] = false;

% ( other_sign_z = other_z >> other_sign_z_temp_1 )
constraint shift_right(other_z, other_sign_z_temp_1, other_sign_z);

array[0..k-1] of var bool: otherReturn;

array[0..k-1] of var bool: otherReturn_temp_1;

array[0..k-1] of var bool: otherReturn_temp_2;

array[0..k-1] of var bool: otherReturn_temp_3;

constraint otherReturn_temp_3[0] = false /\ otherReturn_temp_3[1] = true /\ otherReturn_temp_3[2] = false /\ otherReturn_temp_3[3] = false /\ otherReturn_temp_3[4] = false /\ otherReturn_temp_3[5] = false /\ otherReturn_temp_3[6] = false /\ otherReturn_temp_3[7] = false /\ otherReturn_temp_3[8] = false /\ otherReturn_temp_3[9] = false /\ otherReturn_temp_3[10] = false /\ otherReturn_temp_3[11] = false /\ otherReturn_temp_3[12] = false /\ otherReturn_temp_3[13] = false /\ otherReturn_temp_3[14] = false /\ otherReturn_temp_3[15] = false /\ otherReturn_temp_3[16] = false /\ otherReturn_temp_3[17] = false /\ otherReturn_temp_3[18] = false /\ otherReturn_temp_3[19] = false /\ otherReturn_temp_3[20] = false /\ otherReturn_temp_3[21] = false /\ otherReturn_temp_3[22] = false /\ otherReturn_temp_3[23] = false /\ otherReturn_temp_3[24] = false /\ otherReturn_temp_3[25] = false /\ otherReturn_temp_3[26] = false /\ otherReturn_temp_3[27] = false /\ otherReturn_temp_3[28] = false /\ otherReturn_temp_3[29] = false /\ otherReturn_temp_3[30] = false /\ otherReturn_temp_3[31] = false;

% ( otherReturn_temp_2 = other_z >> otherReturn_temp_3 )
constraint shift_right(other_z, otherReturn_temp_3, otherReturn_temp_2);

array[0..k-1] of var bool: otherReturn_temp_4;

% ( otherReturn_temp_4 = ~ other_sign_z )
constraint forall(i in 0..k-1)( otherReturn_temp_4[i] = ( not other_sign_z[i] ) );

% ( otherReturn_temp_1 = otherReturn_temp_2 & otherReturn_temp_4 )
constraint forall(i in 0..k-1)( otherReturn_temp_1[i] = (otherReturn_temp_2[i] /\ otherReturn_temp_4[i]) );

array[0..k-1] of var bool: otherReturn_temp_5;

array[0..k-1] of var bool: otherReturn_temp_6;

array[0..k-1] of var bool: otherReturn_temp_7;

array[0..k-1] of var bool: otherReturn_temp_8;

constraint otherReturn_temp_8[0] = false /\ otherReturn_temp_8[1] = true /\ otherReturn_temp_8[2] = false /\ otherReturn_temp_8[3] = false /\ otherReturn_temp_8[4] = false /\ otherReturn_temp_8[5] = false /\ otherReturn_temp_8[6] = false /\ otherReturn_temp_8[7] = false /\ otherReturn_temp_8[8] = false /\ otherReturn_temp_8[9] = false /\ otherReturn_temp_8[10] = false /\ otherReturn_temp_8[11] = false /\ otherReturn_temp_8[12] = false /\ otherReturn_temp_8[13] = false /\ otherReturn_temp_8[14] = false /\ otherReturn_temp_8[15] = false /\ otherReturn_temp_8[16] = false /\ otherReturn_temp_8[17] = false /\ otherReturn_temp_8[18] = false /\ otherReturn_temp_8[19] = false /\ otherReturn_temp_8[20] = false /\ otherReturn_temp_8[21] = false /\ otherReturn_temp_8[22] = false /\ otherReturn_temp_8[23] = false /\ otherReturn_temp_8[24] = false /\ otherReturn_temp_8[25] = false /\ otherReturn_temp_8[26] = false /\ otherReturn_temp_8[27] = false /\ otherReturn_temp_8[28] = false /\ otherReturn_temp_8[29] = false /\ otherReturn_temp_8[30] = false /\ otherReturn_temp_8[31] = false;

% ( otherReturn_temp_7 = other_z >> otherReturn_temp_8 )
constraint shift_right(other_z, otherReturn_temp_8, otherReturn_temp_7);

array[0..k-1] of var bool: otherReturn_temp_9;

constraint otherReturn_temp_9[0] = true /\ otherReturn_temp_9[1] = false /\ otherReturn_temp_9[2] = false /\ otherReturn_temp_9[3] = false /\ otherReturn_temp_9[4] = false /\ otherReturn_temp_9[5] = false /\ otherReturn_temp_9[6] = false /\ otherReturn_temp_9[7] = false /\ otherReturn_temp_9[8] = false /\ otherReturn_temp_9[9] = false /\ otherReturn_temp_9[10] = false /\ otherReturn_temp_9[11] = false /\ otherReturn_temp_9[12] = false /\ otherReturn_temp_9[13] = false /\ otherReturn_temp_9[14] = false /\ otherReturn_temp_9[15] = false /\ otherReturn_temp_9[16] = false /\ otherReturn_temp_9[17] = false /\ otherReturn_temp_9[18] = false /\ otherReturn_temp_9[19] = false /\ otherReturn_temp_9[20] = false /\ otherReturn_temp_9[21] = false /\ otherReturn_temp_9[22] = false /\ otherReturn_temp_9[23] = false /\ otherReturn_temp_9[24] = false /\ otherReturn_temp_9[25] = false /\ otherReturn_temp_9[26] = false /\ otherReturn_temp_9[27] = false /\ otherReturn_temp_9[28] = false /\ otherReturn_temp_9[29] = false /\ otherReturn_temp_9[30] = false /\ otherReturn_temp_9[31] = false;

% ( otherReturn_temp_6 = otherReturn_temp_7 + otherReturn_temp_9 )
constraint binary_add(otherReturn_temp_7, otherReturn_temp_9, false, otherReturn_temp_6);

% ( otherReturn_temp_5 = otherReturn_temp_6 & other_sign_z )
constraint forall(i in 0..k-1)( otherReturn_temp_5[i] = (otherReturn_temp_6[i] /\ other_sign_z[i]) );

% ( otherReturn = otherReturn_temp_1 + otherReturn_temp_5 )
constraint binary_add(otherReturn_temp_1, otherReturn_temp_5, false, otherReturn);

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
