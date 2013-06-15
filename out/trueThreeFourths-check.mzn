% solver for function trueThreeFourths

include "globals.mzn";
include "commands.mzn";
int: k = 32;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spec assignments

array[0..k-1] of var bool: spec_x;

array[0..k-1] of var bool: spec_isNeg;

array[0..k-1] of var bool: spec_isNeg_temp_1;

array[0..k-1] of var bool: spec_isNeg_temp_2;

constraint spec_isNeg_temp_2[0] = true /\ spec_isNeg_temp_2[1] = true /\ spec_isNeg_temp_2[2] = true /\ spec_isNeg_temp_2[3] = true /\ spec_isNeg_temp_2[4] = true /\ spec_isNeg_temp_2[5] = false /\ spec_isNeg_temp_2[6] = false /\ spec_isNeg_temp_2[7] = false /\ spec_isNeg_temp_2[8] = false /\ spec_isNeg_temp_2[9] = false /\ spec_isNeg_temp_2[10] = false /\ spec_isNeg_temp_2[11] = false /\ spec_isNeg_temp_2[12] = false /\ spec_isNeg_temp_2[13] = false /\ spec_isNeg_temp_2[14] = false /\ spec_isNeg_temp_2[15] = false /\ spec_isNeg_temp_2[16] = false /\ spec_isNeg_temp_2[17] = false /\ spec_isNeg_temp_2[18] = false /\ spec_isNeg_temp_2[19] = false /\ spec_isNeg_temp_2[20] = false /\ spec_isNeg_temp_2[21] = false /\ spec_isNeg_temp_2[22] = false /\ spec_isNeg_temp_2[23] = false /\ spec_isNeg_temp_2[24] = false /\ spec_isNeg_temp_2[25] = false /\ spec_isNeg_temp_2[26] = false /\ spec_isNeg_temp_2[27] = false /\ spec_isNeg_temp_2[28] = false /\ spec_isNeg_temp_2[29] = false /\ spec_isNeg_temp_2[30] = false /\ spec_isNeg_temp_2[31] = false;

% ( spec_isNeg_temp_1 = spec_x >> spec_isNeg_temp_2 )
constraint shift_right(spec_x, spec_isNeg_temp_2, spec_isNeg_temp_1);

array[0..k-1] of var bool: spec_isNeg_temp_3;

constraint spec_isNeg_temp_3[0] = true /\ spec_isNeg_temp_3[1] = false /\ spec_isNeg_temp_3[2] = false /\ spec_isNeg_temp_3[3] = false /\ spec_isNeg_temp_3[4] = false /\ spec_isNeg_temp_3[5] = false /\ spec_isNeg_temp_3[6] = false /\ spec_isNeg_temp_3[7] = false /\ spec_isNeg_temp_3[8] = false /\ spec_isNeg_temp_3[9] = false /\ spec_isNeg_temp_3[10] = false /\ spec_isNeg_temp_3[11] = false /\ spec_isNeg_temp_3[12] = false /\ spec_isNeg_temp_3[13] = false /\ spec_isNeg_temp_3[14] = false /\ spec_isNeg_temp_3[15] = false /\ spec_isNeg_temp_3[16] = false /\ spec_isNeg_temp_3[17] = false /\ spec_isNeg_temp_3[18] = false /\ spec_isNeg_temp_3[19] = false /\ spec_isNeg_temp_3[20] = false /\ spec_isNeg_temp_3[21] = false /\ spec_isNeg_temp_3[22] = false /\ spec_isNeg_temp_3[23] = false /\ spec_isNeg_temp_3[24] = false /\ spec_isNeg_temp_3[25] = false /\ spec_isNeg_temp_3[26] = false /\ spec_isNeg_temp_3[27] = false /\ spec_isNeg_temp_3[28] = false /\ spec_isNeg_temp_3[29] = false /\ spec_isNeg_temp_3[30] = false /\ spec_isNeg_temp_3[31] = false;

% ( spec_isNeg = spec_isNeg_temp_1 & spec_isNeg_temp_3 )
constraint forall(i in 0..k-1)( spec_isNeg[i] = (spec_isNeg_temp_1[i] /\ spec_isNeg_temp_3[i]) );

array[0..k-1] of var bool: spec_all;

array[0..k-1] of var bool: spec_all_temp_1;

% ( spec_all_temp_1 = ~ spec_isNeg )
constraint forall(i in 0..k-1)( spec_all_temp_1[i] = ( not spec_isNeg[i] ) );

array[0..k-1] of var bool: spec_all_temp_2;

constraint spec_all_temp_2[0] = true /\ spec_all_temp_2[1] = false /\ spec_all_temp_2[2] = false /\ spec_all_temp_2[3] = false /\ spec_all_temp_2[4] = false /\ spec_all_temp_2[5] = false /\ spec_all_temp_2[6] = false /\ spec_all_temp_2[7] = false /\ spec_all_temp_2[8] = false /\ spec_all_temp_2[9] = false /\ spec_all_temp_2[10] = false /\ spec_all_temp_2[11] = false /\ spec_all_temp_2[12] = false /\ spec_all_temp_2[13] = false /\ spec_all_temp_2[14] = false /\ spec_all_temp_2[15] = false /\ spec_all_temp_2[16] = false /\ spec_all_temp_2[17] = false /\ spec_all_temp_2[18] = false /\ spec_all_temp_2[19] = false /\ spec_all_temp_2[20] = false /\ spec_all_temp_2[21] = false /\ spec_all_temp_2[22] = false /\ spec_all_temp_2[23] = false /\ spec_all_temp_2[24] = false /\ spec_all_temp_2[25] = false /\ spec_all_temp_2[26] = false /\ spec_all_temp_2[27] = false /\ spec_all_temp_2[28] = false /\ spec_all_temp_2[29] = false /\ spec_all_temp_2[30] = false /\ spec_all_temp_2[31] = false;

% ( spec_all = spec_all_temp_1 + spec_all_temp_2 )
constraint binary_add(spec_all_temp_1, spec_all_temp_2, false, spec_all);

array[0..k-1] of var bool: spec_absX;

array[0..k-1] of var bool: spec_absX_temp_1;

% ( spec_absX_temp_1 = spec_x ^ spec_all )
constraint forall(i in 0..k-1)( spec_absX_temp_1[i] = (spec_x[i] xor spec_all[i]) );

% ( spec_absX = spec_absX_temp_1 + spec_isNeg )
constraint binary_add(spec_absX_temp_1, spec_isNeg, false, spec_absX);

array[0..k-1] of var bool: spec_check;

array[0..k-1] of var bool: spec_check_temp_1;

array[0..k-1] of var bool: spec_check_temp_2;

constraint spec_check_temp_2[0] = true /\ spec_check_temp_2[1] = true /\ spec_check_temp_2[2] = false /\ spec_check_temp_2[3] = false /\ spec_check_temp_2[4] = false /\ spec_check_temp_2[5] = false /\ spec_check_temp_2[6] = false /\ spec_check_temp_2[7] = false /\ spec_check_temp_2[8] = false /\ spec_check_temp_2[9] = false /\ spec_check_temp_2[10] = false /\ spec_check_temp_2[11] = false /\ spec_check_temp_2[12] = false /\ spec_check_temp_2[13] = false /\ spec_check_temp_2[14] = false /\ spec_check_temp_2[15] = false /\ spec_check_temp_2[16] = false /\ spec_check_temp_2[17] = false /\ spec_check_temp_2[18] = false /\ spec_check_temp_2[19] = false /\ spec_check_temp_2[20] = false /\ spec_check_temp_2[21] = false /\ spec_check_temp_2[22] = false /\ spec_check_temp_2[23] = false /\ spec_check_temp_2[24] = false /\ spec_check_temp_2[25] = false /\ spec_check_temp_2[26] = false /\ spec_check_temp_2[27] = false /\ spec_check_temp_2[28] = false /\ spec_check_temp_2[29] = false /\ spec_check_temp_2[30] = false /\ spec_check_temp_2[31] = false;

array[0..k-1] of var bool: spec_check_temp_3;

constraint spec_check_temp_3[0] = false /\ spec_check_temp_3[1] = true /\ spec_check_temp_3[2] = true /\ spec_check_temp_3[3] = true /\ spec_check_temp_3[4] = true /\ spec_check_temp_3[5] = false /\ spec_check_temp_3[6] = false /\ spec_check_temp_3[7] = false /\ spec_check_temp_3[8] = false /\ spec_check_temp_3[9] = false /\ spec_check_temp_3[10] = false /\ spec_check_temp_3[11] = false /\ spec_check_temp_3[12] = false /\ spec_check_temp_3[13] = false /\ spec_check_temp_3[14] = false /\ spec_check_temp_3[15] = false /\ spec_check_temp_3[16] = false /\ spec_check_temp_3[17] = false /\ spec_check_temp_3[18] = false /\ spec_check_temp_3[19] = false /\ spec_check_temp_3[20] = false /\ spec_check_temp_3[21] = false /\ spec_check_temp_3[22] = false /\ spec_check_temp_3[23] = false /\ spec_check_temp_3[24] = false /\ spec_check_temp_3[25] = false /\ spec_check_temp_3[26] = false /\ spec_check_temp_3[27] = false /\ spec_check_temp_3[28] = false /\ spec_check_temp_3[29] = false /\ spec_check_temp_3[30] = false /\ spec_check_temp_3[31] = false;

% ( spec_check_temp_1 = spec_check_temp_2 << spec_check_temp_3 )
constraint shift_left(spec_check_temp_2, spec_check_temp_3, spec_check_temp_1);

% ( spec_check = ~ spec_check_temp_1 )
constraint forall(i in 0..k-1)( spec_check[i] = ( not spec_check_temp_1[i] ) );

array[0..k-1] of var bool: spec_div;

array[0..k-1] of var bool: spec_div_temp_1;

array[0..k-1] of var bool: spec_div_temp_2;

constraint spec_div_temp_2[0] = false /\ spec_div_temp_2[1] = true /\ spec_div_temp_2[2] = false /\ spec_div_temp_2[3] = false /\ spec_div_temp_2[4] = false /\ spec_div_temp_2[5] = false /\ spec_div_temp_2[6] = false /\ spec_div_temp_2[7] = false /\ spec_div_temp_2[8] = false /\ spec_div_temp_2[9] = false /\ spec_div_temp_2[10] = false /\ spec_div_temp_2[11] = false /\ spec_div_temp_2[12] = false /\ spec_div_temp_2[13] = false /\ spec_div_temp_2[14] = false /\ spec_div_temp_2[15] = false /\ spec_div_temp_2[16] = false /\ spec_div_temp_2[17] = false /\ spec_div_temp_2[18] = false /\ spec_div_temp_2[19] = false /\ spec_div_temp_2[20] = false /\ spec_div_temp_2[21] = false /\ spec_div_temp_2[22] = false /\ spec_div_temp_2[23] = false /\ spec_div_temp_2[24] = false /\ spec_div_temp_2[25] = false /\ spec_div_temp_2[26] = false /\ spec_div_temp_2[27] = false /\ spec_div_temp_2[28] = false /\ spec_div_temp_2[29] = false /\ spec_div_temp_2[30] = false /\ spec_div_temp_2[31] = false;

% ( spec_div_temp_1 = spec_absX >> spec_div_temp_2 )
constraint shift_right(spec_absX, spec_div_temp_2, spec_div_temp_1);

% ( spec_div = spec_div_temp_1 & spec_check )
constraint forall(i in 0..k-1)( spec_div[i] = (spec_div_temp_1[i] /\ spec_check[i]) );

array[0..k-1] of var bool: spec_first;

array[0..k-1] of var bool: spec_first_temp_1;

% ( spec_first_temp_1 = spec_div + spec_div )
constraint binary_add(spec_div, spec_div, false, spec_first_temp_1);

% ( spec_first = spec_first_temp_1 + spec_div )
constraint binary_add(spec_first_temp_1, spec_div, false, spec_first);

array[0..k-1] of var bool: spec_lost;

array[0..k-1] of var bool: spec_lost_temp_1;

constraint spec_lost_temp_1[0] = true /\ spec_lost_temp_1[1] = true /\ spec_lost_temp_1[2] = false /\ spec_lost_temp_1[3] = false /\ spec_lost_temp_1[4] = false /\ spec_lost_temp_1[5] = false /\ spec_lost_temp_1[6] = false /\ spec_lost_temp_1[7] = false /\ spec_lost_temp_1[8] = false /\ spec_lost_temp_1[9] = false /\ spec_lost_temp_1[10] = false /\ spec_lost_temp_1[11] = false /\ spec_lost_temp_1[12] = false /\ spec_lost_temp_1[13] = false /\ spec_lost_temp_1[14] = false /\ spec_lost_temp_1[15] = false /\ spec_lost_temp_1[16] = false /\ spec_lost_temp_1[17] = false /\ spec_lost_temp_1[18] = false /\ spec_lost_temp_1[19] = false /\ spec_lost_temp_1[20] = false /\ spec_lost_temp_1[21] = false /\ spec_lost_temp_1[22] = false /\ spec_lost_temp_1[23] = false /\ spec_lost_temp_1[24] = false /\ spec_lost_temp_1[25] = false /\ spec_lost_temp_1[26] = false /\ spec_lost_temp_1[27] = false /\ spec_lost_temp_1[28] = false /\ spec_lost_temp_1[29] = false /\ spec_lost_temp_1[30] = false /\ spec_lost_temp_1[31] = false;

% ( spec_lost = spec_absX & spec_lost_temp_1 )
constraint forall(i in 0..k-1)( spec_lost[i] = (spec_absX[i] /\ spec_lost_temp_1[i]) );

array[0..k-1] of var bool: spec_timesLost;

array[0..k-1] of var bool: spec_timesLost_temp_1;

% ( spec_timesLost_temp_1 = spec_lost + spec_lost )
constraint binary_add(spec_lost, spec_lost, false, spec_timesLost_temp_1);

% ( spec_timesLost = spec_timesLost_temp_1 + spec_lost )
constraint binary_add(spec_timesLost_temp_1, spec_lost, false, spec_timesLost);

array[0..k-1] of var bool: spec_second;

array[0..k-1] of var bool: spec_second_temp_1;

array[0..k-1] of var bool: spec_second_temp_2;

constraint spec_second_temp_2[0] = false /\ spec_second_temp_2[1] = true /\ spec_second_temp_2[2] = false /\ spec_second_temp_2[3] = false /\ spec_second_temp_2[4] = false /\ spec_second_temp_2[5] = false /\ spec_second_temp_2[6] = false /\ spec_second_temp_2[7] = false /\ spec_second_temp_2[8] = false /\ spec_second_temp_2[9] = false /\ spec_second_temp_2[10] = false /\ spec_second_temp_2[11] = false /\ spec_second_temp_2[12] = false /\ spec_second_temp_2[13] = false /\ spec_second_temp_2[14] = false /\ spec_second_temp_2[15] = false /\ spec_second_temp_2[16] = false /\ spec_second_temp_2[17] = false /\ spec_second_temp_2[18] = false /\ spec_second_temp_2[19] = false /\ spec_second_temp_2[20] = false /\ spec_second_temp_2[21] = false /\ spec_second_temp_2[22] = false /\ spec_second_temp_2[23] = false /\ spec_second_temp_2[24] = false /\ spec_second_temp_2[25] = false /\ spec_second_temp_2[26] = false /\ spec_second_temp_2[27] = false /\ spec_second_temp_2[28] = false /\ spec_second_temp_2[29] = false /\ spec_second_temp_2[30] = false /\ spec_second_temp_2[31] = false;

% ( spec_second_temp_1 = spec_timesLost >> spec_second_temp_2 )
constraint shift_right(spec_timesLost, spec_second_temp_2, spec_second_temp_1);

% ( spec_second = spec_second_temp_1 & spec_check )
constraint forall(i in 0..k-1)( spec_second[i] = (spec_second_temp_1[i] /\ spec_check[i]) );

array[0..k-1] of var bool: spec_fin;

% ( spec_fin = spec_first + spec_second )
constraint binary_add(spec_first, spec_second, false, spec_fin);

array[0..k-1] of var bool: spec_mayNeg;

array[0..k-1] of var bool: spec_mayNeg_temp_1;

% ( spec_mayNeg_temp_1 = spec_fin ^ spec_all )
constraint forall(i in 0..k-1)( spec_mayNeg_temp_1[i] = (spec_fin[i] xor spec_all[i]) );

% ( spec_mayNeg = spec_mayNeg_temp_1 + spec_isNeg )
constraint binary_add(spec_mayNeg_temp_1, spec_isNeg, false, spec_mayNeg);

array[0..k-1] of var bool: specReturn;

constraint forall(i in 0..k-1)( specReturn[i] = spec_mayNeg[i] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% other assignments

array[0..k-1] of var bool: other_x;

array[0..k-1] of var bool: other_a;

array[0..k-1] of var bool: other_a_temp_1;

constraint other_a_temp_1[0] = false /\ other_a_temp_1[1] = false /\ other_a_temp_1[2] = false /\ other_a_temp_1[3] = false /\ other_a_temp_1[4] = true /\ other_a_temp_1[5] = false /\ other_a_temp_1[6] = false /\ other_a_temp_1[7] = false /\ other_a_temp_1[8] = false /\ other_a_temp_1[9] = false /\ other_a_temp_1[10] = false /\ other_a_temp_1[11] = false /\ other_a_temp_1[12] = false /\ other_a_temp_1[13] = false /\ other_a_temp_1[14] = false /\ other_a_temp_1[15] = false /\ other_a_temp_1[16] = false /\ other_a_temp_1[17] = false /\ other_a_temp_1[18] = false /\ other_a_temp_1[19] = false /\ other_a_temp_1[20] = false /\ other_a_temp_1[21] = false /\ other_a_temp_1[22] = false /\ other_a_temp_1[23] = false /\ other_a_temp_1[24] = false /\ other_a_temp_1[25] = false /\ other_a_temp_1[26] = false /\ other_a_temp_1[27] = false /\ other_a_temp_1[28] = false /\ other_a_temp_1[29] = false /\ other_a_temp_1[30] = false /\ other_a_temp_1[31] = false;

% ( other_a = other_x >> other_a_temp_1 )
constraint shift_right(other_x, other_a_temp_1, other_a);

array[0..k-1] of var bool: other_a_z;

array[0..k-1] of var bool: other_a_z_temp_1;

% ( other_a_z_temp_1 = other_a + other_a )
constraint binary_add(other_a, other_a, false, other_a_z_temp_1);

% ( other_a_z = other_a_z_temp_1 + other_a )
constraint binary_add(other_a_z_temp_1, other_a, false, other_a_z);

array[0..k-1] of var bool: other_a_sign_z;

array[0..k-1] of var bool: other_a_sign_z_temp_1;

constraint other_a_sign_z_temp_1[0] = true /\ other_a_sign_z_temp_1[1] = true /\ other_a_sign_z_temp_1[2] = true /\ other_a_sign_z_temp_1[3] = true /\ other_a_sign_z_temp_1[4] = true /\ other_a_sign_z_temp_1[5] = false /\ other_a_sign_z_temp_1[6] = false /\ other_a_sign_z_temp_1[7] = false /\ other_a_sign_z_temp_1[8] = false /\ other_a_sign_z_temp_1[9] = false /\ other_a_sign_z_temp_1[10] = false /\ other_a_sign_z_temp_1[11] = false /\ other_a_sign_z_temp_1[12] = false /\ other_a_sign_z_temp_1[13] = false /\ other_a_sign_z_temp_1[14] = false /\ other_a_sign_z_temp_1[15] = false /\ other_a_sign_z_temp_1[16] = false /\ other_a_sign_z_temp_1[17] = false /\ other_a_sign_z_temp_1[18] = false /\ other_a_sign_z_temp_1[19] = false /\ other_a_sign_z_temp_1[20] = false /\ other_a_sign_z_temp_1[21] = false /\ other_a_sign_z_temp_1[22] = false /\ other_a_sign_z_temp_1[23] = false /\ other_a_sign_z_temp_1[24] = false /\ other_a_sign_z_temp_1[25] = false /\ other_a_sign_z_temp_1[26] = false /\ other_a_sign_z_temp_1[27] = false /\ other_a_sign_z_temp_1[28] = false /\ other_a_sign_z_temp_1[29] = false /\ other_a_sign_z_temp_1[30] = false /\ other_a_sign_z_temp_1[31] = false;

% ( other_a_sign_z = other_a_z >> other_a_sign_z_temp_1 )
constraint shift_right(other_a_z, other_a_sign_z_temp_1, other_a_sign_z);

array[0..k-1] of var bool: other_a_res;

array[0..k-1] of var bool: other_a_res_temp_1;

array[0..k-1] of var bool: other_a_res_temp_2;

array[0..k-1] of var bool: other_a_res_temp_3;

constraint other_a_res_temp_3[0] = false /\ other_a_res_temp_3[1] = true /\ other_a_res_temp_3[2] = false /\ other_a_res_temp_3[3] = false /\ other_a_res_temp_3[4] = false /\ other_a_res_temp_3[5] = false /\ other_a_res_temp_3[6] = false /\ other_a_res_temp_3[7] = false /\ other_a_res_temp_3[8] = false /\ other_a_res_temp_3[9] = false /\ other_a_res_temp_3[10] = false /\ other_a_res_temp_3[11] = false /\ other_a_res_temp_3[12] = false /\ other_a_res_temp_3[13] = false /\ other_a_res_temp_3[14] = false /\ other_a_res_temp_3[15] = false /\ other_a_res_temp_3[16] = false /\ other_a_res_temp_3[17] = false /\ other_a_res_temp_3[18] = false /\ other_a_res_temp_3[19] = false /\ other_a_res_temp_3[20] = false /\ other_a_res_temp_3[21] = false /\ other_a_res_temp_3[22] = false /\ other_a_res_temp_3[23] = false /\ other_a_res_temp_3[24] = false /\ other_a_res_temp_3[25] = false /\ other_a_res_temp_3[26] = false /\ other_a_res_temp_3[27] = false /\ other_a_res_temp_3[28] = false /\ other_a_res_temp_3[29] = false /\ other_a_res_temp_3[30] = false /\ other_a_res_temp_3[31] = false;

% ( other_a_res_temp_2 = other_a_z >> other_a_res_temp_3 )
constraint shift_right(other_a_z, other_a_res_temp_3, other_a_res_temp_2);

array[0..k-1] of var bool: other_a_res_temp_4;

% ( other_a_res_temp_4 = ~ other_a_sign_z )
constraint forall(i in 0..k-1)( other_a_res_temp_4[i] = ( not other_a_sign_z[i] ) );

% ( other_a_res_temp_1 = other_a_res_temp_2 & other_a_res_temp_4 )
constraint forall(i in 0..k-1)( other_a_res_temp_1[i] = (other_a_res_temp_2[i] /\ other_a_res_temp_4[i]) );

array[0..k-1] of var bool: other_a_res_temp_5;

array[0..k-1] of var bool: other_a_res_temp_6;

array[0..k-1] of var bool: other_a_res_temp_7;

array[0..k-1] of var bool: other_a_res_temp_8;

constraint other_a_res_temp_8[0] = false /\ other_a_res_temp_8[1] = true /\ other_a_res_temp_8[2] = false /\ other_a_res_temp_8[3] = false /\ other_a_res_temp_8[4] = false /\ other_a_res_temp_8[5] = false /\ other_a_res_temp_8[6] = false /\ other_a_res_temp_8[7] = false /\ other_a_res_temp_8[8] = false /\ other_a_res_temp_8[9] = false /\ other_a_res_temp_8[10] = false /\ other_a_res_temp_8[11] = false /\ other_a_res_temp_8[12] = false /\ other_a_res_temp_8[13] = false /\ other_a_res_temp_8[14] = false /\ other_a_res_temp_8[15] = false /\ other_a_res_temp_8[16] = false /\ other_a_res_temp_8[17] = false /\ other_a_res_temp_8[18] = false /\ other_a_res_temp_8[19] = false /\ other_a_res_temp_8[20] = false /\ other_a_res_temp_8[21] = false /\ other_a_res_temp_8[22] = false /\ other_a_res_temp_8[23] = false /\ other_a_res_temp_8[24] = false /\ other_a_res_temp_8[25] = false /\ other_a_res_temp_8[26] = false /\ other_a_res_temp_8[27] = false /\ other_a_res_temp_8[28] = false /\ other_a_res_temp_8[29] = false /\ other_a_res_temp_8[30] = false /\ other_a_res_temp_8[31] = false;

% ( other_a_res_temp_7 = other_a_z >> other_a_res_temp_8 )
constraint shift_right(other_a_z, other_a_res_temp_8, other_a_res_temp_7);

array[0..k-1] of var bool: other_a_res_temp_9;

constraint other_a_res_temp_9[0] = true /\ other_a_res_temp_9[1] = false /\ other_a_res_temp_9[2] = false /\ other_a_res_temp_9[3] = false /\ other_a_res_temp_9[4] = false /\ other_a_res_temp_9[5] = false /\ other_a_res_temp_9[6] = false /\ other_a_res_temp_9[7] = false /\ other_a_res_temp_9[8] = false /\ other_a_res_temp_9[9] = false /\ other_a_res_temp_9[10] = false /\ other_a_res_temp_9[11] = false /\ other_a_res_temp_9[12] = false /\ other_a_res_temp_9[13] = false /\ other_a_res_temp_9[14] = false /\ other_a_res_temp_9[15] = false /\ other_a_res_temp_9[16] = false /\ other_a_res_temp_9[17] = false /\ other_a_res_temp_9[18] = false /\ other_a_res_temp_9[19] = false /\ other_a_res_temp_9[20] = false /\ other_a_res_temp_9[21] = false /\ other_a_res_temp_9[22] = false /\ other_a_res_temp_9[23] = false /\ other_a_res_temp_9[24] = false /\ other_a_res_temp_9[25] = false /\ other_a_res_temp_9[26] = false /\ other_a_res_temp_9[27] = false /\ other_a_res_temp_9[28] = false /\ other_a_res_temp_9[29] = false /\ other_a_res_temp_9[30] = false /\ other_a_res_temp_9[31] = false;

% ( other_a_res_temp_6 = other_a_res_temp_7 + other_a_res_temp_9 )
constraint binary_add(other_a_res_temp_7, other_a_res_temp_9, false, other_a_res_temp_6);

% ( other_a_res_temp_5 = other_a_res_temp_6 & other_a_sign_z )
constraint forall(i in 0..k-1)( other_a_res_temp_5[i] = (other_a_res_temp_6[i] /\ other_a_sign_z[i]) );

% ( other_a_res = other_a_res_temp_1 + other_a_res_temp_5 )
constraint binary_add(other_a_res_temp_1, other_a_res_temp_5, false, other_a_res);

array[0..k-1] of var bool: other_a_res_dup_1;

array[0..k-1] of var bool: other_a_res_dup_1_temp_1;

constraint other_a_res_dup_1_temp_1[0] = false /\ other_a_res_dup_1_temp_1[1] = false /\ other_a_res_dup_1_temp_1[2] = false /\ other_a_res_dup_1_temp_1[3] = false /\ other_a_res_dup_1_temp_1[4] = true /\ other_a_res_dup_1_temp_1[5] = false /\ other_a_res_dup_1_temp_1[6] = false /\ other_a_res_dup_1_temp_1[7] = false /\ other_a_res_dup_1_temp_1[8] = false /\ other_a_res_dup_1_temp_1[9] = false /\ other_a_res_dup_1_temp_1[10] = false /\ other_a_res_dup_1_temp_1[11] = false /\ other_a_res_dup_1_temp_1[12] = false /\ other_a_res_dup_1_temp_1[13] = false /\ other_a_res_dup_1_temp_1[14] = false /\ other_a_res_dup_1_temp_1[15] = false /\ other_a_res_dup_1_temp_1[16] = false /\ other_a_res_dup_1_temp_1[17] = false /\ other_a_res_dup_1_temp_1[18] = false /\ other_a_res_dup_1_temp_1[19] = false /\ other_a_res_dup_1_temp_1[20] = false /\ other_a_res_dup_1_temp_1[21] = false /\ other_a_res_dup_1_temp_1[22] = false /\ other_a_res_dup_1_temp_1[23] = false /\ other_a_res_dup_1_temp_1[24] = false /\ other_a_res_dup_1_temp_1[25] = false /\ other_a_res_dup_1_temp_1[26] = false /\ other_a_res_dup_1_temp_1[27] = false /\ other_a_res_dup_1_temp_1[28] = false /\ other_a_res_dup_1_temp_1[29] = false /\ other_a_res_dup_1_temp_1[30] = false /\ other_a_res_dup_1_temp_1[31] = false;

% ( other_a_res_dup_1 = other_a_res << other_a_res_dup_1_temp_1 )
constraint shift_left(other_a_res, other_a_res_dup_1_temp_1, other_a_res_dup_1);

array[0..k-1] of var bool: other_b;

array[0..k-1] of var bool: other_b_temp_1;

constraint other_b_temp_1[0] = true /\ other_b_temp_1[1] = true /\ other_b_temp_1[2] = true /\ other_b_temp_1[3] = true /\ other_b_temp_1[4] = true /\ other_b_temp_1[5] = true /\ other_b_temp_1[6] = true /\ other_b_temp_1[7] = true /\ other_b_temp_1[8] = true /\ other_b_temp_1[9] = true /\ other_b_temp_1[10] = true /\ other_b_temp_1[11] = true /\ other_b_temp_1[12] = true /\ other_b_temp_1[13] = true /\ other_b_temp_1[14] = true /\ other_b_temp_1[15] = true /\ other_b_temp_1[16] = false /\ other_b_temp_1[17] = false /\ other_b_temp_1[18] = false /\ other_b_temp_1[19] = false /\ other_b_temp_1[20] = false /\ other_b_temp_1[21] = false /\ other_b_temp_1[22] = false /\ other_b_temp_1[23] = false /\ other_b_temp_1[24] = false /\ other_b_temp_1[25] = false /\ other_b_temp_1[26] = false /\ other_b_temp_1[27] = false /\ other_b_temp_1[28] = false /\ other_b_temp_1[29] = false /\ other_b_temp_1[30] = false /\ other_b_temp_1[31] = false;

% ( other_b = other_x & other_b_temp_1 )
constraint forall(i in 0..k-1)( other_b[i] = (other_x[i] /\ other_b_temp_1[i]) );

array[0..k-1] of var bool: other_b_z;

array[0..k-1] of var bool: other_b_z_temp_1;

% ( other_b_z_temp_1 = other_b + other_b )
constraint binary_add(other_b, other_b, false, other_b_z_temp_1);

% ( other_b_z = other_b_z_temp_1 + other_b )
constraint binary_add(other_b_z_temp_1, other_b, false, other_b_z);

array[0..k-1] of var bool: other_b_sign_z;

array[0..k-1] of var bool: other_b_sign_z_temp_1;

constraint other_b_sign_z_temp_1[0] = true /\ other_b_sign_z_temp_1[1] = true /\ other_b_sign_z_temp_1[2] = true /\ other_b_sign_z_temp_1[3] = true /\ other_b_sign_z_temp_1[4] = true /\ other_b_sign_z_temp_1[5] = false /\ other_b_sign_z_temp_1[6] = false /\ other_b_sign_z_temp_1[7] = false /\ other_b_sign_z_temp_1[8] = false /\ other_b_sign_z_temp_1[9] = false /\ other_b_sign_z_temp_1[10] = false /\ other_b_sign_z_temp_1[11] = false /\ other_b_sign_z_temp_1[12] = false /\ other_b_sign_z_temp_1[13] = false /\ other_b_sign_z_temp_1[14] = false /\ other_b_sign_z_temp_1[15] = false /\ other_b_sign_z_temp_1[16] = false /\ other_b_sign_z_temp_1[17] = false /\ other_b_sign_z_temp_1[18] = false /\ other_b_sign_z_temp_1[19] = false /\ other_b_sign_z_temp_1[20] = false /\ other_b_sign_z_temp_1[21] = false /\ other_b_sign_z_temp_1[22] = false /\ other_b_sign_z_temp_1[23] = false /\ other_b_sign_z_temp_1[24] = false /\ other_b_sign_z_temp_1[25] = false /\ other_b_sign_z_temp_1[26] = false /\ other_b_sign_z_temp_1[27] = false /\ other_b_sign_z_temp_1[28] = false /\ other_b_sign_z_temp_1[29] = false /\ other_b_sign_z_temp_1[30] = false /\ other_b_sign_z_temp_1[31] = false;

% ( other_b_sign_z = other_b_z >> other_b_sign_z_temp_1 )
constraint shift_right(other_b_z, other_b_sign_z_temp_1, other_b_sign_z);

array[0..k-1] of var bool: other_b_res;

array[0..k-1] of var bool: other_b_res_temp_1;

array[0..k-1] of var bool: other_b_res_temp_2;

array[0..k-1] of var bool: other_b_res_temp_3;

constraint other_b_res_temp_3[0] = false /\ other_b_res_temp_3[1] = true /\ other_b_res_temp_3[2] = false /\ other_b_res_temp_3[3] = false /\ other_b_res_temp_3[4] = false /\ other_b_res_temp_3[5] = false /\ other_b_res_temp_3[6] = false /\ other_b_res_temp_3[7] = false /\ other_b_res_temp_3[8] = false /\ other_b_res_temp_3[9] = false /\ other_b_res_temp_3[10] = false /\ other_b_res_temp_3[11] = false /\ other_b_res_temp_3[12] = false /\ other_b_res_temp_3[13] = false /\ other_b_res_temp_3[14] = false /\ other_b_res_temp_3[15] = false /\ other_b_res_temp_3[16] = false /\ other_b_res_temp_3[17] = false /\ other_b_res_temp_3[18] = false /\ other_b_res_temp_3[19] = false /\ other_b_res_temp_3[20] = false /\ other_b_res_temp_3[21] = false /\ other_b_res_temp_3[22] = false /\ other_b_res_temp_3[23] = false /\ other_b_res_temp_3[24] = false /\ other_b_res_temp_3[25] = false /\ other_b_res_temp_3[26] = false /\ other_b_res_temp_3[27] = false /\ other_b_res_temp_3[28] = false /\ other_b_res_temp_3[29] = false /\ other_b_res_temp_3[30] = false /\ other_b_res_temp_3[31] = false;

% ( other_b_res_temp_2 = other_b_z >> other_b_res_temp_3 )
constraint shift_right(other_b_z, other_b_res_temp_3, other_b_res_temp_2);

array[0..k-1] of var bool: other_b_res_temp_4;

% ( other_b_res_temp_4 = ~ other_b_sign_z )
constraint forall(i in 0..k-1)( other_b_res_temp_4[i] = ( not other_b_sign_z[i] ) );

% ( other_b_res_temp_1 = other_b_res_temp_2 & other_b_res_temp_4 )
constraint forall(i in 0..k-1)( other_b_res_temp_1[i] = (other_b_res_temp_2[i] /\ other_b_res_temp_4[i]) );

array[0..k-1] of var bool: other_b_res_temp_5;

array[0..k-1] of var bool: other_b_res_temp_6;

array[0..k-1] of var bool: other_b_res_temp_7;

array[0..k-1] of var bool: other_b_res_temp_8;

constraint other_b_res_temp_8[0] = false /\ other_b_res_temp_8[1] = true /\ other_b_res_temp_8[2] = false /\ other_b_res_temp_8[3] = false /\ other_b_res_temp_8[4] = false /\ other_b_res_temp_8[5] = false /\ other_b_res_temp_8[6] = false /\ other_b_res_temp_8[7] = false /\ other_b_res_temp_8[8] = false /\ other_b_res_temp_8[9] = false /\ other_b_res_temp_8[10] = false /\ other_b_res_temp_8[11] = false /\ other_b_res_temp_8[12] = false /\ other_b_res_temp_8[13] = false /\ other_b_res_temp_8[14] = false /\ other_b_res_temp_8[15] = false /\ other_b_res_temp_8[16] = false /\ other_b_res_temp_8[17] = false /\ other_b_res_temp_8[18] = false /\ other_b_res_temp_8[19] = false /\ other_b_res_temp_8[20] = false /\ other_b_res_temp_8[21] = false /\ other_b_res_temp_8[22] = false /\ other_b_res_temp_8[23] = false /\ other_b_res_temp_8[24] = false /\ other_b_res_temp_8[25] = false /\ other_b_res_temp_8[26] = false /\ other_b_res_temp_8[27] = false /\ other_b_res_temp_8[28] = false /\ other_b_res_temp_8[29] = false /\ other_b_res_temp_8[30] = false /\ other_b_res_temp_8[31] = false;

% ( other_b_res_temp_7 = other_b_z >> other_b_res_temp_8 )
constraint shift_right(other_b_z, other_b_res_temp_8, other_b_res_temp_7);

array[0..k-1] of var bool: other_b_res_temp_9;

constraint other_b_res_temp_9[0] = true /\ other_b_res_temp_9[1] = false /\ other_b_res_temp_9[2] = false /\ other_b_res_temp_9[3] = false /\ other_b_res_temp_9[4] = false /\ other_b_res_temp_9[5] = false /\ other_b_res_temp_9[6] = false /\ other_b_res_temp_9[7] = false /\ other_b_res_temp_9[8] = false /\ other_b_res_temp_9[9] = false /\ other_b_res_temp_9[10] = false /\ other_b_res_temp_9[11] = false /\ other_b_res_temp_9[12] = false /\ other_b_res_temp_9[13] = false /\ other_b_res_temp_9[14] = false /\ other_b_res_temp_9[15] = false /\ other_b_res_temp_9[16] = false /\ other_b_res_temp_9[17] = false /\ other_b_res_temp_9[18] = false /\ other_b_res_temp_9[19] = false /\ other_b_res_temp_9[20] = false /\ other_b_res_temp_9[21] = false /\ other_b_res_temp_9[22] = false /\ other_b_res_temp_9[23] = false /\ other_b_res_temp_9[24] = false /\ other_b_res_temp_9[25] = false /\ other_b_res_temp_9[26] = false /\ other_b_res_temp_9[27] = false /\ other_b_res_temp_9[28] = false /\ other_b_res_temp_9[29] = false /\ other_b_res_temp_9[30] = false /\ other_b_res_temp_9[31] = false;

% ( other_b_res_temp_6 = other_b_res_temp_7 + other_b_res_temp_9 )
constraint binary_add(other_b_res_temp_7, other_b_res_temp_9, false, other_b_res_temp_6);

% ( other_b_res_temp_5 = other_b_res_temp_6 & other_b_sign_z )
constraint forall(i in 0..k-1)( other_b_res_temp_5[i] = (other_b_res_temp_6[i] /\ other_b_sign_z[i]) );

% ( other_b_res = other_b_res_temp_1 + other_b_res_temp_5 )
constraint binary_add(other_b_res_temp_1, other_b_res_temp_5, false, other_b_res);

array[0..k-1] of var bool: otherReturn;

% ( otherReturn = other_a_res_dup_1 + other_b_res )
constraint binary_add(other_a_res_dup_1, other_b_res, false, otherReturn);

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
