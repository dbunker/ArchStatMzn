% solver for function conditional

include "globals.mzn";
include "commands.mzn";
int: k = 32;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spec assignments

array[0..k-1] of var bool: spec_x;

array[0..k-1] of var bool: spec_y;

array[0..k-1] of var bool: spec_z;

array[0..k-1] of var bool: spec_n;

array[0..k-1] of var bool: spec_n_temp_1;

% ( spec_n_temp_1 = ! spec_x )
constraint negate(spec_x, spec_n_temp_1);

% ( spec_n = ! spec_n_temp_1 )
constraint negate(spec_n_temp_1, spec_n);

array[0..k-1] of var bool: spec_all;

array[0..k-1] of var bool: spec_all_temp_1;

% ( spec_all_temp_1 = ~ spec_n )
constraint forall(i in 0..k-1)( spec_all_temp_1[i] = ( not spec_n[i] ) );

array[0..k-1] of var bool: spec_all_temp_2;

constraint spec_all_temp_2[0] = true /\ spec_all_temp_2[1] = false /\ spec_all_temp_2[2] = false /\ spec_all_temp_2[3] = false /\ spec_all_temp_2[4] = false /\ spec_all_temp_2[5] = false /\ spec_all_temp_2[6] = false /\ spec_all_temp_2[7] = false /\ spec_all_temp_2[8] = false /\ spec_all_temp_2[9] = false /\ spec_all_temp_2[10] = false /\ spec_all_temp_2[11] = false /\ spec_all_temp_2[12] = false /\ spec_all_temp_2[13] = false /\ spec_all_temp_2[14] = false /\ spec_all_temp_2[15] = false /\ spec_all_temp_2[16] = false /\ spec_all_temp_2[17] = false /\ spec_all_temp_2[18] = false /\ spec_all_temp_2[19] = false /\ spec_all_temp_2[20] = false /\ spec_all_temp_2[21] = false /\ spec_all_temp_2[22] = false /\ spec_all_temp_2[23] = false /\ spec_all_temp_2[24] = false /\ spec_all_temp_2[25] = false /\ spec_all_temp_2[26] = false /\ spec_all_temp_2[27] = false /\ spec_all_temp_2[28] = false /\ spec_all_temp_2[29] = false /\ spec_all_temp_2[30] = false /\ spec_all_temp_2[31] = false;

% ( spec_all = spec_all_temp_1 + spec_all_temp_2 )
constraint binary_add(spec_all_temp_1, spec_all_temp_2, false, spec_all);

array[0..k-1] of var bool: spec_i;

array[0..k-1] of var bool: spec_i_temp_1;

% ( spec_i_temp_1 = spec_all & spec_y )
constraint forall(i in 0..k-1)( spec_i_temp_1[i] = (spec_all[i] /\ spec_y[i]) );

array[0..k-1] of var bool: spec_i_temp_2;

array[0..k-1] of var bool: spec_i_temp_3;

% ( spec_i_temp_3 = ~ spec_all )
constraint forall(i in 0..k-1)( spec_i_temp_3[i] = ( not spec_all[i] ) );

% ( spec_i_temp_2 = spec_i_temp_3 & spec_z )
constraint forall(i in 0..k-1)( spec_i_temp_2[i] = (spec_i_temp_3[i] /\ spec_z[i]) );

% ( spec_i = spec_i_temp_1 + spec_i_temp_2 )
constraint binary_add(spec_i_temp_1, spec_i_temp_2, false, spec_i);

array[0..k-1] of var bool: specReturn;

constraint forall(i in 0..k-1)( specReturn[i] = spec_i[i] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% other assignments

array[0..k-1] of var bool: other_x;

array[0..k-1] of var bool: other_y;

array[0..k-1] of var bool: other_z;

array[0..k-1] of var bool: otherReturn;

array[0..k-1] of var bool: otherReturn_temp_1;

array[0..k-1] of var bool: otherReturn_temp_2;

array[0..k-1] of var bool: otherReturn_temp_3;

% ( otherReturn_temp_3 = ! other_x )
constraint negate(other_x, otherReturn_temp_3);

array[0..k-1] of var bool: otherReturn_temp_4;

constraint otherReturn_temp_4[0] = false /\ otherReturn_temp_4[1] = false /\ otherReturn_temp_4[2] = false /\ otherReturn_temp_4[3] = false /\ otherReturn_temp_4[4] = false /\ otherReturn_temp_4[5] = false /\ otherReturn_temp_4[6] = false /\ otherReturn_temp_4[7] = false /\ otherReturn_temp_4[8] = false /\ otherReturn_temp_4[9] = false /\ otherReturn_temp_4[10] = false /\ otherReturn_temp_4[11] = false /\ otherReturn_temp_4[12] = false /\ otherReturn_temp_4[13] = false /\ otherReturn_temp_4[14] = false /\ otherReturn_temp_4[15] = false /\ otherReturn_temp_4[16] = false /\ otherReturn_temp_4[17] = false /\ otherReturn_temp_4[18] = false /\ otherReturn_temp_4[19] = false /\ otherReturn_temp_4[20] = false /\ otherReturn_temp_4[21] = false /\ otherReturn_temp_4[22] = false /\ otherReturn_temp_4[23] = false /\ otherReturn_temp_4[24] = false /\ otherReturn_temp_4[25] = false /\ otherReturn_temp_4[26] = false /\ otherReturn_temp_4[27] = false /\ otherReturn_temp_4[28] = false /\ otherReturn_temp_4[29] = false /\ otherReturn_temp_4[30] = false /\ otherReturn_temp_4[31] = true;

% ( otherReturn_temp_2 = otherReturn_temp_3 + otherReturn_temp_4 )
constraint binary_add(otherReturn_temp_3, otherReturn_temp_4, false, otherReturn_temp_2);

% ( otherReturn_temp_1 = otherReturn_temp_2 & other_y )
constraint forall(i in 0..k-1)( otherReturn_temp_1[i] = (otherReturn_temp_2[i] /\ other_y[i]) );

array[0..k-1] of var bool: otherReturn_temp_5;

array[0..k-1] of var bool: otherReturn_temp_6;

array[0..k-1] of var bool: otherReturn_temp_7;

array[0..k-1] of var bool: otherReturn_temp_8;

% ( otherReturn_temp_8 = ! other_x )
constraint negate(other_x, otherReturn_temp_8);

array[0..k-1] of var bool: otherReturn_temp_9;

constraint otherReturn_temp_9[0] = false /\ otherReturn_temp_9[1] = false /\ otherReturn_temp_9[2] = false /\ otherReturn_temp_9[3] = false /\ otherReturn_temp_9[4] = false /\ otherReturn_temp_9[5] = false /\ otherReturn_temp_9[6] = false /\ otherReturn_temp_9[7] = false /\ otherReturn_temp_9[8] = false /\ otherReturn_temp_9[9] = false /\ otherReturn_temp_9[10] = false /\ otherReturn_temp_9[11] = false /\ otherReturn_temp_9[12] = false /\ otherReturn_temp_9[13] = false /\ otherReturn_temp_9[14] = false /\ otherReturn_temp_9[15] = false /\ otherReturn_temp_9[16] = false /\ otherReturn_temp_9[17] = false /\ otherReturn_temp_9[18] = false /\ otherReturn_temp_9[19] = false /\ otherReturn_temp_9[20] = false /\ otherReturn_temp_9[21] = false /\ otherReturn_temp_9[22] = false /\ otherReturn_temp_9[23] = false /\ otherReturn_temp_9[24] = false /\ otherReturn_temp_9[25] = false /\ otherReturn_temp_9[26] = false /\ otherReturn_temp_9[27] = false /\ otherReturn_temp_9[28] = false /\ otherReturn_temp_9[29] = false /\ otherReturn_temp_9[30] = false /\ otherReturn_temp_9[31] = true;

% ( otherReturn_temp_7 = otherReturn_temp_8 + otherReturn_temp_9 )
constraint binary_add(otherReturn_temp_8, otherReturn_temp_9, false, otherReturn_temp_7);

% ( otherReturn_temp_6 = ~ otherReturn_temp_7 )
constraint forall(i in 0..k-1)( otherReturn_temp_6[i] = ( not otherReturn_temp_7[i] ) );

% ( otherReturn_temp_5 = otherReturn_temp_6 & other_z )
constraint forall(i in 0..k-1)( otherReturn_temp_5[i] = (otherReturn_temp_6[i] /\ other_z[i]) );

% ( otherReturn = otherReturn_temp_1 + otherReturn_temp_5 )
constraint binary_add(otherReturn_temp_1, otherReturn_temp_5, false, otherReturn);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spec and other have identical input parameters

other_x = spec_x;

other_y = spec_y;

other_z = spec_z;

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

var -pow(2,k-1)..pow(2,k-1)-1: int_z;
constraint int_z = sum(j in 0..k-2)( bool2int(spec_z[j]) * pow(2,j) )
	- bool2int(spec_z[k-1]) * pow(2,k-1);

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
"z=", show(int_z), "\n",
"expected=", show(expected), "\n",
"got=", show(got),
];
