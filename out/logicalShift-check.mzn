% solver for function logicalShift

include "globals.mzn";
include "commands.mzn";
int: k = 32;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spec assignments

array[0..k-1] of var bool: spec_x;

array[0..k-1] of var bool: spec_n;

array[0..k-1] of var bool: spec_badShift;

% ( spec_badShift = spec_x >> spec_n )
constraint shift_right(spec_x, spec_n, spec_badShift);

array[0..k-1] of var bool: spec_negN;

array[0..k-1] of var bool: spec_negN_temp_1;

% ( spec_negN_temp_1 = ~ spec_n )
constraint forall(i in 0..k-1)( spec_negN_temp_1[i] = ( not spec_n[i] ) );

array[0..k-1] of var bool: spec_negN_temp_2;

constraint spec_negN_temp_2[0] = true /\ spec_negN_temp_2[1] = false /\ spec_negN_temp_2[2] = false /\ spec_negN_temp_2[3] = false /\ spec_negN_temp_2[4] = false /\ spec_negN_temp_2[5] = false /\ spec_negN_temp_2[6] = false /\ spec_negN_temp_2[7] = false /\ spec_negN_temp_2[8] = false /\ spec_negN_temp_2[9] = false /\ spec_negN_temp_2[10] = false /\ spec_negN_temp_2[11] = false /\ spec_negN_temp_2[12] = false /\ spec_negN_temp_2[13] = false /\ spec_negN_temp_2[14] = false /\ spec_negN_temp_2[15] = false /\ spec_negN_temp_2[16] = false /\ spec_negN_temp_2[17] = false /\ spec_negN_temp_2[18] = false /\ spec_negN_temp_2[19] = false /\ spec_negN_temp_2[20] = false /\ spec_negN_temp_2[21] = false /\ spec_negN_temp_2[22] = false /\ spec_negN_temp_2[23] = false /\ spec_negN_temp_2[24] = false /\ spec_negN_temp_2[25] = false /\ spec_negN_temp_2[26] = false /\ spec_negN_temp_2[27] = false /\ spec_negN_temp_2[28] = false /\ spec_negN_temp_2[29] = false /\ spec_negN_temp_2[30] = false /\ spec_negN_temp_2[31] = false;

% ( spec_negN = spec_negN_temp_1 + spec_negN_temp_2 )
constraint binary_add(spec_negN_temp_1, spec_negN_temp_2, false, spec_negN);

array[0..k-1] of var bool: spec_check;

array[0..k-1] of var bool: spec_check_temp_1;

array[0..k-1] of var bool: spec_check_temp_2;

constraint spec_check_temp_2[0] = false /\ spec_check_temp_2[1] = false /\ spec_check_temp_2[2] = false /\ spec_check_temp_2[3] = false /\ spec_check_temp_2[4] = false /\ spec_check_temp_2[5] = false /\ spec_check_temp_2[6] = false /\ spec_check_temp_2[7] = false /\ spec_check_temp_2[8] = false /\ spec_check_temp_2[9] = false /\ spec_check_temp_2[10] = false /\ spec_check_temp_2[11] = false /\ spec_check_temp_2[12] = false /\ spec_check_temp_2[13] = false /\ spec_check_temp_2[14] = false /\ spec_check_temp_2[15] = false /\ spec_check_temp_2[16] = false /\ spec_check_temp_2[17] = false /\ spec_check_temp_2[18] = false /\ spec_check_temp_2[19] = false /\ spec_check_temp_2[20] = false /\ spec_check_temp_2[21] = false /\ spec_check_temp_2[22] = false /\ spec_check_temp_2[23] = false /\ spec_check_temp_2[24] = false /\ spec_check_temp_2[25] = false /\ spec_check_temp_2[26] = false /\ spec_check_temp_2[27] = false /\ spec_check_temp_2[28] = false /\ spec_check_temp_2[29] = false /\ spec_check_temp_2[30] = false /\ spec_check_temp_2[31] = false;

% ( spec_check_temp_1 = ~ spec_check_temp_2 )
constraint forall(i in 0..k-1)( spec_check_temp_1[i] = ( not spec_check_temp_2[i] ) );

array[0..k-1] of var bool: spec_check_temp_3;

array[0..k-1] of var bool: spec_check_temp_4;

constraint spec_check_temp_4[0] = false /\ spec_check_temp_4[1] = false /\ spec_check_temp_4[2] = false /\ spec_check_temp_4[3] = false /\ spec_check_temp_4[4] = false /\ spec_check_temp_4[5] = true /\ spec_check_temp_4[6] = false /\ spec_check_temp_4[7] = false /\ spec_check_temp_4[8] = false /\ spec_check_temp_4[9] = false /\ spec_check_temp_4[10] = false /\ spec_check_temp_4[11] = false /\ spec_check_temp_4[12] = false /\ spec_check_temp_4[13] = false /\ spec_check_temp_4[14] = false /\ spec_check_temp_4[15] = false /\ spec_check_temp_4[16] = false /\ spec_check_temp_4[17] = false /\ spec_check_temp_4[18] = false /\ spec_check_temp_4[19] = false /\ spec_check_temp_4[20] = false /\ spec_check_temp_4[21] = false /\ spec_check_temp_4[22] = false /\ spec_check_temp_4[23] = false /\ spec_check_temp_4[24] = false /\ spec_check_temp_4[25] = false /\ spec_check_temp_4[26] = false /\ spec_check_temp_4[27] = false /\ spec_check_temp_4[28] = false /\ spec_check_temp_4[29] = false /\ spec_check_temp_4[30] = false /\ spec_check_temp_4[31] = false;

% ( spec_check_temp_3 = spec_check_temp_4 + spec_negN )
constraint binary_add(spec_check_temp_4, spec_negN, false, spec_check_temp_3);

% ( spec_check = spec_check_temp_1 << spec_check_temp_3 )
constraint shift_left(spec_check_temp_1, spec_check_temp_3, spec_check);

array[0..k-1] of var bool: spec_check_dup_1;

% ( spec_check_dup_1 = ~ spec_check )
constraint forall(i in 0..k-1)( spec_check_dup_1[i] = ( not spec_check[i] ) );

array[0..k-1] of var bool: spec_i;

% ( spec_i = spec_badShift & spec_check_dup_1 )
constraint forall(i in 0..k-1)( spec_i[i] = (spec_badShift[i] /\ spec_check_dup_1[i]) );

array[0..k-1] of var bool: specReturn;

constraint forall(i in 0..k-1)( specReturn[i] = spec_i[i] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% other assignments

array[0..k-1] of var bool: other_x;

array[0..k-1] of var bool: other_n;

array[0..k-1] of var bool: other_z;

% ( other_z = other_x >> other_n )
constraint shift_right(other_x, other_n, other_z);

array[0..k-1] of var bool: other_y;

array[0..k-1] of var bool: other_y_temp_1;

constraint other_y_temp_1[0] = true /\ other_y_temp_1[1] = false /\ other_y_temp_1[2] = false /\ other_y_temp_1[3] = false /\ other_y_temp_1[4] = false /\ other_y_temp_1[5] = false /\ other_y_temp_1[6] = false /\ other_y_temp_1[7] = false /\ other_y_temp_1[8] = false /\ other_y_temp_1[9] = false /\ other_y_temp_1[10] = false /\ other_y_temp_1[11] = false /\ other_y_temp_1[12] = false /\ other_y_temp_1[13] = false /\ other_y_temp_1[14] = false /\ other_y_temp_1[15] = false /\ other_y_temp_1[16] = false /\ other_y_temp_1[17] = false /\ other_y_temp_1[18] = false /\ other_y_temp_1[19] = false /\ other_y_temp_1[20] = false /\ other_y_temp_1[21] = false /\ other_y_temp_1[22] = false /\ other_y_temp_1[23] = false /\ other_y_temp_1[24] = false /\ other_y_temp_1[25] = false /\ other_y_temp_1[26] = false /\ other_y_temp_1[27] = false /\ other_y_temp_1[28] = false /\ other_y_temp_1[29] = false /\ other_y_temp_1[30] = false /\ other_y_temp_1[31] = false;

array[0..k-1] of var bool: other_y_temp_2;

constraint other_y_temp_2[0] = true /\ other_y_temp_2[1] = true /\ other_y_temp_2[2] = true /\ other_y_temp_2[3] = true /\ other_y_temp_2[4] = true /\ other_y_temp_2[5] = false /\ other_y_temp_2[6] = false /\ other_y_temp_2[7] = false /\ other_y_temp_2[8] = false /\ other_y_temp_2[9] = false /\ other_y_temp_2[10] = false /\ other_y_temp_2[11] = false /\ other_y_temp_2[12] = false /\ other_y_temp_2[13] = false /\ other_y_temp_2[14] = false /\ other_y_temp_2[15] = false /\ other_y_temp_2[16] = false /\ other_y_temp_2[17] = false /\ other_y_temp_2[18] = false /\ other_y_temp_2[19] = false /\ other_y_temp_2[20] = false /\ other_y_temp_2[21] = false /\ other_y_temp_2[22] = false /\ other_y_temp_2[23] = false /\ other_y_temp_2[24] = false /\ other_y_temp_2[25] = false /\ other_y_temp_2[26] = false /\ other_y_temp_2[27] = false /\ other_y_temp_2[28] = false /\ other_y_temp_2[29] = false /\ other_y_temp_2[30] = false /\ other_y_temp_2[31] = false;

% ( other_y = other_y_temp_1 << other_y_temp_2 )
constraint shift_left(other_y_temp_1, other_y_temp_2, other_y);

array[0..k-1] of var bool: other_y_dup_1;

array[0..k-1] of var bool: other_y_dup_1_temp_1;

array[0..k-1] of var bool: other_y_dup_1_temp_2;

constraint other_y_dup_1_temp_2[0] = false /\ other_y_dup_1_temp_2[1] = false /\ other_y_dup_1_temp_2[2] = false /\ other_y_dup_1_temp_2[3] = false /\ other_y_dup_1_temp_2[4] = false /\ other_y_dup_1_temp_2[5] = false /\ other_y_dup_1_temp_2[6] = false /\ other_y_dup_1_temp_2[7] = false /\ other_y_dup_1_temp_2[8] = false /\ other_y_dup_1_temp_2[9] = false /\ other_y_dup_1_temp_2[10] = false /\ other_y_dup_1_temp_2[11] = false /\ other_y_dup_1_temp_2[12] = false /\ other_y_dup_1_temp_2[13] = false /\ other_y_dup_1_temp_2[14] = false /\ other_y_dup_1_temp_2[15] = false /\ other_y_dup_1_temp_2[16] = false /\ other_y_dup_1_temp_2[17] = false /\ other_y_dup_1_temp_2[18] = false /\ other_y_dup_1_temp_2[19] = false /\ other_y_dup_1_temp_2[20] = false /\ other_y_dup_1_temp_2[21] = false /\ other_y_dup_1_temp_2[22] = false /\ other_y_dup_1_temp_2[23] = false /\ other_y_dup_1_temp_2[24] = false /\ other_y_dup_1_temp_2[25] = false /\ other_y_dup_1_temp_2[26] = false /\ other_y_dup_1_temp_2[27] = false /\ other_y_dup_1_temp_2[28] = false /\ other_y_dup_1_temp_2[29] = false /\ other_y_dup_1_temp_2[30] = false /\ other_y_dup_1_temp_2[31] = true;

% ( other_y_dup_1_temp_1 = other_n + other_y_dup_1_temp_2 )
constraint binary_add(other_n, other_y_dup_1_temp_2, false, other_y_dup_1_temp_1);

% ( other_y_dup_1 = other_y >> other_y_dup_1_temp_1 )
constraint shift_right(other_y, other_y_dup_1_temp_1, other_y_dup_1);

array[0..k-1] of var bool: other_y_dup_2;

% ( other_y_dup_2 = ~ other_y_dup_1 )
constraint forall(i in 0..k-1)( other_y_dup_2[i] = ( not other_y_dup_1[i] ) );

array[0..k-1] of var bool: otherReturn;

% ( otherReturn = other_z & other_y_dup_2 )
constraint forall(i in 0..k-1)( otherReturn[i] = (other_z[i] /\ other_y_dup_2[i]) );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spec and other have identical input parameters

other_x = spec_x;

other_n = spec_n;

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

var -pow(2,k-1)..pow(2,k-1)-1: int_n;
constraint int_n = sum(j in 0..k-2)( bool2int(spec_n[j]) * pow(2,j) )
	- bool2int(spec_n[k-1]) * pow(2,k-1);

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
"n=", show(int_n), "\n",
"expected=", show(expected), "\n",
"got=", show(got),
];
