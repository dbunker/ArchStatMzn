% solver for function isGreater

include "globals.mzn";
include "commands.mzn";
int: k = 32;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spec assignments

array[0..k-1] of var bool: spec_x;

array[0..k-1] of var bool: spec_y;

array[0..k-1] of var bool: spec_xisNeg;

array[0..k-1] of var bool: spec_xisNeg_temp_1;

array[0..k-1] of var bool: spec_xisNeg_temp_2;

constraint spec_xisNeg_temp_2[0] = true /\ spec_xisNeg_temp_2[1] = true /\ spec_xisNeg_temp_2[2] = true /\ spec_xisNeg_temp_2[3] = true /\ spec_xisNeg_temp_2[4] = true /\ spec_xisNeg_temp_2[5] = false /\ spec_xisNeg_temp_2[6] = false /\ spec_xisNeg_temp_2[7] = false /\ spec_xisNeg_temp_2[8] = false /\ spec_xisNeg_temp_2[9] = false /\ spec_xisNeg_temp_2[10] = false /\ spec_xisNeg_temp_2[11] = false /\ spec_xisNeg_temp_2[12] = false /\ spec_xisNeg_temp_2[13] = false /\ spec_xisNeg_temp_2[14] = false /\ spec_xisNeg_temp_2[15] = false /\ spec_xisNeg_temp_2[16] = false /\ spec_xisNeg_temp_2[17] = false /\ spec_xisNeg_temp_2[18] = false /\ spec_xisNeg_temp_2[19] = false /\ spec_xisNeg_temp_2[20] = false /\ spec_xisNeg_temp_2[21] = false /\ spec_xisNeg_temp_2[22] = false /\ spec_xisNeg_temp_2[23] = false /\ spec_xisNeg_temp_2[24] = false /\ spec_xisNeg_temp_2[25] = false /\ spec_xisNeg_temp_2[26] = false /\ spec_xisNeg_temp_2[27] = false /\ spec_xisNeg_temp_2[28] = false /\ spec_xisNeg_temp_2[29] = false /\ spec_xisNeg_temp_2[30] = false /\ spec_xisNeg_temp_2[31] = false;

% ( spec_xisNeg_temp_1 = spec_x >> spec_xisNeg_temp_2 )
constraint shift_right(spec_x, spec_xisNeg_temp_2, spec_xisNeg_temp_1);

array[0..k-1] of var bool: spec_xisNeg_temp_3;

constraint spec_xisNeg_temp_3[0] = true /\ spec_xisNeg_temp_3[1] = false /\ spec_xisNeg_temp_3[2] = false /\ spec_xisNeg_temp_3[3] = false /\ spec_xisNeg_temp_3[4] = false /\ spec_xisNeg_temp_3[5] = false /\ spec_xisNeg_temp_3[6] = false /\ spec_xisNeg_temp_3[7] = false /\ spec_xisNeg_temp_3[8] = false /\ spec_xisNeg_temp_3[9] = false /\ spec_xisNeg_temp_3[10] = false /\ spec_xisNeg_temp_3[11] = false /\ spec_xisNeg_temp_3[12] = false /\ spec_xisNeg_temp_3[13] = false /\ spec_xisNeg_temp_3[14] = false /\ spec_xisNeg_temp_3[15] = false /\ spec_xisNeg_temp_3[16] = false /\ spec_xisNeg_temp_3[17] = false /\ spec_xisNeg_temp_3[18] = false /\ spec_xisNeg_temp_3[19] = false /\ spec_xisNeg_temp_3[20] = false /\ spec_xisNeg_temp_3[21] = false /\ spec_xisNeg_temp_3[22] = false /\ spec_xisNeg_temp_3[23] = false /\ spec_xisNeg_temp_3[24] = false /\ spec_xisNeg_temp_3[25] = false /\ spec_xisNeg_temp_3[26] = false /\ spec_xisNeg_temp_3[27] = false /\ spec_xisNeg_temp_3[28] = false /\ spec_xisNeg_temp_3[29] = false /\ spec_xisNeg_temp_3[30] = false /\ spec_xisNeg_temp_3[31] = false;

% ( spec_xisNeg = spec_xisNeg_temp_1 & spec_xisNeg_temp_3 )
constraint forall(i in 0..k-1)( spec_xisNeg[i] = (spec_xisNeg_temp_1[i] /\ spec_xisNeg_temp_3[i]) );

array[0..k-1] of var bool: spec_yisNeg;

array[0..k-1] of var bool: spec_yisNeg_temp_1;

array[0..k-1] of var bool: spec_yisNeg_temp_2;

constraint spec_yisNeg_temp_2[0] = true /\ spec_yisNeg_temp_2[1] = true /\ spec_yisNeg_temp_2[2] = true /\ spec_yisNeg_temp_2[3] = true /\ spec_yisNeg_temp_2[4] = true /\ spec_yisNeg_temp_2[5] = false /\ spec_yisNeg_temp_2[6] = false /\ spec_yisNeg_temp_2[7] = false /\ spec_yisNeg_temp_2[8] = false /\ spec_yisNeg_temp_2[9] = false /\ spec_yisNeg_temp_2[10] = false /\ spec_yisNeg_temp_2[11] = false /\ spec_yisNeg_temp_2[12] = false /\ spec_yisNeg_temp_2[13] = false /\ spec_yisNeg_temp_2[14] = false /\ spec_yisNeg_temp_2[15] = false /\ spec_yisNeg_temp_2[16] = false /\ spec_yisNeg_temp_2[17] = false /\ spec_yisNeg_temp_2[18] = false /\ spec_yisNeg_temp_2[19] = false /\ spec_yisNeg_temp_2[20] = false /\ spec_yisNeg_temp_2[21] = false /\ spec_yisNeg_temp_2[22] = false /\ spec_yisNeg_temp_2[23] = false /\ spec_yisNeg_temp_2[24] = false /\ spec_yisNeg_temp_2[25] = false /\ spec_yisNeg_temp_2[26] = false /\ spec_yisNeg_temp_2[27] = false /\ spec_yisNeg_temp_2[28] = false /\ spec_yisNeg_temp_2[29] = false /\ spec_yisNeg_temp_2[30] = false /\ spec_yisNeg_temp_2[31] = false;

% ( spec_yisNeg_temp_1 = spec_y >> spec_yisNeg_temp_2 )
constraint shift_right(spec_y, spec_yisNeg_temp_2, spec_yisNeg_temp_1);

array[0..k-1] of var bool: spec_yisNeg_temp_3;

constraint spec_yisNeg_temp_3[0] = true /\ spec_yisNeg_temp_3[1] = false /\ spec_yisNeg_temp_3[2] = false /\ spec_yisNeg_temp_3[3] = false /\ spec_yisNeg_temp_3[4] = false /\ spec_yisNeg_temp_3[5] = false /\ spec_yisNeg_temp_3[6] = false /\ spec_yisNeg_temp_3[7] = false /\ spec_yisNeg_temp_3[8] = false /\ spec_yisNeg_temp_3[9] = false /\ spec_yisNeg_temp_3[10] = false /\ spec_yisNeg_temp_3[11] = false /\ spec_yisNeg_temp_3[12] = false /\ spec_yisNeg_temp_3[13] = false /\ spec_yisNeg_temp_3[14] = false /\ spec_yisNeg_temp_3[15] = false /\ spec_yisNeg_temp_3[16] = false /\ spec_yisNeg_temp_3[17] = false /\ spec_yisNeg_temp_3[18] = false /\ spec_yisNeg_temp_3[19] = false /\ spec_yisNeg_temp_3[20] = false /\ spec_yisNeg_temp_3[21] = false /\ spec_yisNeg_temp_3[22] = false /\ spec_yisNeg_temp_3[23] = false /\ spec_yisNeg_temp_3[24] = false /\ spec_yisNeg_temp_3[25] = false /\ spec_yisNeg_temp_3[26] = false /\ spec_yisNeg_temp_3[27] = false /\ spec_yisNeg_temp_3[28] = false /\ spec_yisNeg_temp_3[29] = false /\ spec_yisNeg_temp_3[30] = false /\ spec_yisNeg_temp_3[31] = false;

% ( spec_yisNeg = spec_yisNeg_temp_1 & spec_yisNeg_temp_3 )
constraint forall(i in 0..k-1)( spec_yisNeg[i] = (spec_yisNeg_temp_1[i] /\ spec_yisNeg_temp_3[i]) );

array[0..k-1] of var bool: spec_areOpposite;

% ( spec_areOpposite = spec_xisNeg ^ spec_yisNeg )
constraint forall(i in 0..k-1)( spec_areOpposite[i] = (spec_xisNeg[i] xor spec_yisNeg[i]) );

array[0..k-1] of var bool: spec_xLargeOp;

constraint forall(i in 0..k-1)( spec_xLargeOp[i] = spec_yisNeg[i] );

array[0..k-1] of var bool: spec_negX;

array[0..k-1] of var bool: spec_negX_temp_1;

% ( spec_negX_temp_1 = ~ spec_x )
constraint forall(i in 0..k-1)( spec_negX_temp_1[i] = ( not spec_x[i] ) );

array[0..k-1] of var bool: spec_negX_temp_2;

constraint spec_negX_temp_2[0] = true /\ spec_negX_temp_2[1] = false /\ spec_negX_temp_2[2] = false /\ spec_negX_temp_2[3] = false /\ spec_negX_temp_2[4] = false /\ spec_negX_temp_2[5] = false /\ spec_negX_temp_2[6] = false /\ spec_negX_temp_2[7] = false /\ spec_negX_temp_2[8] = false /\ spec_negX_temp_2[9] = false /\ spec_negX_temp_2[10] = false /\ spec_negX_temp_2[11] = false /\ spec_negX_temp_2[12] = false /\ spec_negX_temp_2[13] = false /\ spec_negX_temp_2[14] = false /\ spec_negX_temp_2[15] = false /\ spec_negX_temp_2[16] = false /\ spec_negX_temp_2[17] = false /\ spec_negX_temp_2[18] = false /\ spec_negX_temp_2[19] = false /\ spec_negX_temp_2[20] = false /\ spec_negX_temp_2[21] = false /\ spec_negX_temp_2[22] = false /\ spec_negX_temp_2[23] = false /\ spec_negX_temp_2[24] = false /\ spec_negX_temp_2[25] = false /\ spec_negX_temp_2[26] = false /\ spec_negX_temp_2[27] = false /\ spec_negX_temp_2[28] = false /\ spec_negX_temp_2[29] = false /\ spec_negX_temp_2[30] = false /\ spec_negX_temp_2[31] = false;

% ( spec_negX = spec_negX_temp_1 + spec_negX_temp_2 )
constraint binary_add(spec_negX_temp_1, spec_negX_temp_2, false, spec_negX);

array[0..k-1] of var bool: spec_sum;

% ( spec_sum = spec_y + spec_negX )
constraint binary_add(spec_y, spec_negX, false, spec_sum);

array[0..k-1] of var bool: spec_sumisNeg;

array[0..k-1] of var bool: spec_sumisNeg_temp_1;

array[0..k-1] of var bool: spec_sumisNeg_temp_2;

constraint spec_sumisNeg_temp_2[0] = true /\ spec_sumisNeg_temp_2[1] = true /\ spec_sumisNeg_temp_2[2] = true /\ spec_sumisNeg_temp_2[3] = true /\ spec_sumisNeg_temp_2[4] = true /\ spec_sumisNeg_temp_2[5] = false /\ spec_sumisNeg_temp_2[6] = false /\ spec_sumisNeg_temp_2[7] = false /\ spec_sumisNeg_temp_2[8] = false /\ spec_sumisNeg_temp_2[9] = false /\ spec_sumisNeg_temp_2[10] = false /\ spec_sumisNeg_temp_2[11] = false /\ spec_sumisNeg_temp_2[12] = false /\ spec_sumisNeg_temp_2[13] = false /\ spec_sumisNeg_temp_2[14] = false /\ spec_sumisNeg_temp_2[15] = false /\ spec_sumisNeg_temp_2[16] = false /\ spec_sumisNeg_temp_2[17] = false /\ spec_sumisNeg_temp_2[18] = false /\ spec_sumisNeg_temp_2[19] = false /\ spec_sumisNeg_temp_2[20] = false /\ spec_sumisNeg_temp_2[21] = false /\ spec_sumisNeg_temp_2[22] = false /\ spec_sumisNeg_temp_2[23] = false /\ spec_sumisNeg_temp_2[24] = false /\ spec_sumisNeg_temp_2[25] = false /\ spec_sumisNeg_temp_2[26] = false /\ spec_sumisNeg_temp_2[27] = false /\ spec_sumisNeg_temp_2[28] = false /\ spec_sumisNeg_temp_2[29] = false /\ spec_sumisNeg_temp_2[30] = false /\ spec_sumisNeg_temp_2[31] = false;

% ( spec_sumisNeg_temp_1 = spec_sum >> spec_sumisNeg_temp_2 )
constraint shift_right(spec_sum, spec_sumisNeg_temp_2, spec_sumisNeg_temp_1);

array[0..k-1] of var bool: spec_sumisNeg_temp_3;

constraint spec_sumisNeg_temp_3[0] = true /\ spec_sumisNeg_temp_3[1] = false /\ spec_sumisNeg_temp_3[2] = false /\ spec_sumisNeg_temp_3[3] = false /\ spec_sumisNeg_temp_3[4] = false /\ spec_sumisNeg_temp_3[5] = false /\ spec_sumisNeg_temp_3[6] = false /\ spec_sumisNeg_temp_3[7] = false /\ spec_sumisNeg_temp_3[8] = false /\ spec_sumisNeg_temp_3[9] = false /\ spec_sumisNeg_temp_3[10] = false /\ spec_sumisNeg_temp_3[11] = false /\ spec_sumisNeg_temp_3[12] = false /\ spec_sumisNeg_temp_3[13] = false /\ spec_sumisNeg_temp_3[14] = false /\ spec_sumisNeg_temp_3[15] = false /\ spec_sumisNeg_temp_3[16] = false /\ spec_sumisNeg_temp_3[17] = false /\ spec_sumisNeg_temp_3[18] = false /\ spec_sumisNeg_temp_3[19] = false /\ spec_sumisNeg_temp_3[20] = false /\ spec_sumisNeg_temp_3[21] = false /\ spec_sumisNeg_temp_3[22] = false /\ spec_sumisNeg_temp_3[23] = false /\ spec_sumisNeg_temp_3[24] = false /\ spec_sumisNeg_temp_3[25] = false /\ spec_sumisNeg_temp_3[26] = false /\ spec_sumisNeg_temp_3[27] = false /\ spec_sumisNeg_temp_3[28] = false /\ spec_sumisNeg_temp_3[29] = false /\ spec_sumisNeg_temp_3[30] = false /\ spec_sumisNeg_temp_3[31] = false;

% ( spec_sumisNeg = spec_sumisNeg_temp_1 & spec_sumisNeg_temp_3 )
constraint forall(i in 0..k-1)( spec_sumisNeg[i] = (spec_sumisNeg_temp_1[i] /\ spec_sumisNeg_temp_3[i]) );

array[0..k-1] of var bool: spec_xLargeSum;

constraint forall(i in 0..k-1)( spec_xLargeSum[i] = spec_sumisNeg[i] );

array[0..k-1] of var bool: spec_i;

array[0..k-1] of var bool: spec_i_temp_1;

% ( spec_i_temp_1 = spec_areOpposite & spec_xLargeOp )
constraint forall(i in 0..k-1)( spec_i_temp_1[i] = (spec_areOpposite[i] /\ spec_xLargeOp[i]) );

array[0..k-1] of var bool: spec_i_temp_2;

array[0..k-1] of var bool: spec_i_temp_3;

% ( spec_i_temp_3 = ! spec_areOpposite )
constraint negate(spec_areOpposite, spec_i_temp_3);

% ( spec_i_temp_2 = spec_i_temp_3 & spec_xLargeSum )
constraint forall(i in 0..k-1)( spec_i_temp_2[i] = (spec_i_temp_3[i] /\ spec_xLargeSum[i]) );

% ( spec_i = spec_i_temp_1 + spec_i_temp_2 )
constraint binary_add(spec_i_temp_1, spec_i_temp_2, false, spec_i);

array[0..k-1] of var bool: specReturn;

constraint forall(i in 0..k-1)( specReturn[i] = spec_i[i] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% other assignments

array[0..k-1] of var bool: other_x;

array[0..k-1] of var bool: other_y;

array[0..k-1] of var bool: other_sign_x;

array[0..k-1] of var bool: other_sign_x_temp_1;

constraint other_sign_x_temp_1[0] = true /\ other_sign_x_temp_1[1] = true /\ other_sign_x_temp_1[2] = true /\ other_sign_x_temp_1[3] = true /\ other_sign_x_temp_1[4] = true /\ other_sign_x_temp_1[5] = false /\ other_sign_x_temp_1[6] = false /\ other_sign_x_temp_1[7] = false /\ other_sign_x_temp_1[8] = false /\ other_sign_x_temp_1[9] = false /\ other_sign_x_temp_1[10] = false /\ other_sign_x_temp_1[11] = false /\ other_sign_x_temp_1[12] = false /\ other_sign_x_temp_1[13] = false /\ other_sign_x_temp_1[14] = false /\ other_sign_x_temp_1[15] = false /\ other_sign_x_temp_1[16] = false /\ other_sign_x_temp_1[17] = false /\ other_sign_x_temp_1[18] = false /\ other_sign_x_temp_1[19] = false /\ other_sign_x_temp_1[20] = false /\ other_sign_x_temp_1[21] = false /\ other_sign_x_temp_1[22] = false /\ other_sign_x_temp_1[23] = false /\ other_sign_x_temp_1[24] = false /\ other_sign_x_temp_1[25] = false /\ other_sign_x_temp_1[26] = false /\ other_sign_x_temp_1[27] = false /\ other_sign_x_temp_1[28] = false /\ other_sign_x_temp_1[29] = false /\ other_sign_x_temp_1[30] = false /\ other_sign_x_temp_1[31] = false;

% ( other_sign_x = other_x >> other_sign_x_temp_1 )
constraint shift_right(other_x, other_sign_x_temp_1, other_sign_x);

array[0..k-1] of var bool: other_sign_y;

array[0..k-1] of var bool: other_sign_y_temp_1;

constraint other_sign_y_temp_1[0] = true /\ other_sign_y_temp_1[1] = true /\ other_sign_y_temp_1[2] = true /\ other_sign_y_temp_1[3] = true /\ other_sign_y_temp_1[4] = true /\ other_sign_y_temp_1[5] = false /\ other_sign_y_temp_1[6] = false /\ other_sign_y_temp_1[7] = false /\ other_sign_y_temp_1[8] = false /\ other_sign_y_temp_1[9] = false /\ other_sign_y_temp_1[10] = false /\ other_sign_y_temp_1[11] = false /\ other_sign_y_temp_1[12] = false /\ other_sign_y_temp_1[13] = false /\ other_sign_y_temp_1[14] = false /\ other_sign_y_temp_1[15] = false /\ other_sign_y_temp_1[16] = false /\ other_sign_y_temp_1[17] = false /\ other_sign_y_temp_1[18] = false /\ other_sign_y_temp_1[19] = false /\ other_sign_y_temp_1[20] = false /\ other_sign_y_temp_1[21] = false /\ other_sign_y_temp_1[22] = false /\ other_sign_y_temp_1[23] = false /\ other_sign_y_temp_1[24] = false /\ other_sign_y_temp_1[25] = false /\ other_sign_y_temp_1[26] = false /\ other_sign_y_temp_1[27] = false /\ other_sign_y_temp_1[28] = false /\ other_sign_y_temp_1[29] = false /\ other_sign_y_temp_1[30] = false /\ other_sign_y_temp_1[31] = false;

% ( other_sign_y = other_y >> other_sign_y_temp_1 )
constraint shift_right(other_y, other_sign_y_temp_1, other_sign_y);

array[0..k-1] of var bool: other_case_1;

array[0..k-1] of var bool: other_case_1_temp_1;

array[0..k-1] of var bool: other_case_1_temp_2;

array[0..k-1] of var bool: other_case_1_temp_3;

constraint other_case_1_temp_3[0] = true /\ other_case_1_temp_3[1] = false /\ other_case_1_temp_3[2] = false /\ other_case_1_temp_3[3] = false /\ other_case_1_temp_3[4] = false /\ other_case_1_temp_3[5] = false /\ other_case_1_temp_3[6] = false /\ other_case_1_temp_3[7] = false /\ other_case_1_temp_3[8] = false /\ other_case_1_temp_3[9] = false /\ other_case_1_temp_3[10] = false /\ other_case_1_temp_3[11] = false /\ other_case_1_temp_3[12] = false /\ other_case_1_temp_3[13] = false /\ other_case_1_temp_3[14] = false /\ other_case_1_temp_3[15] = false /\ other_case_1_temp_3[16] = false /\ other_case_1_temp_3[17] = false /\ other_case_1_temp_3[18] = false /\ other_case_1_temp_3[19] = false /\ other_case_1_temp_3[20] = false /\ other_case_1_temp_3[21] = false /\ other_case_1_temp_3[22] = false /\ other_case_1_temp_3[23] = false /\ other_case_1_temp_3[24] = false /\ other_case_1_temp_3[25] = false /\ other_case_1_temp_3[26] = false /\ other_case_1_temp_3[27] = false /\ other_case_1_temp_3[28] = false /\ other_case_1_temp_3[29] = false /\ other_case_1_temp_3[30] = false /\ other_case_1_temp_3[31] = false;

% ( other_case_1_temp_2 = other_sign_y + other_case_1_temp_3 )
constraint binary_add(other_sign_y, other_case_1_temp_3, false, other_case_1_temp_2);

% ( other_case_1_temp_1 = other_sign_x ^ other_case_1_temp_2 )
constraint forall(i in 0..k-1)( other_case_1_temp_1[i] = (other_sign_x[i] xor other_case_1_temp_2[i]) );

% ( other_case_1 = ! other_case_1_temp_1 )
constraint negate(other_case_1_temp_1, other_case_1);

array[0..k-1] of var bool: other_y_minus_x;

array[0..k-1] of var bool: other_y_minus_x_temp_1;

array[0..k-1] of var bool: other_y_minus_x_temp_2;

% ( other_y_minus_x_temp_2 = ~ other_x )
constraint forall(i in 0..k-1)( other_y_minus_x_temp_2[i] = ( not other_x[i] ) );

array[0..k-1] of var bool: other_y_minus_x_temp_3;

constraint other_y_minus_x_temp_3[0] = true /\ other_y_minus_x_temp_3[1] = false /\ other_y_minus_x_temp_3[2] = false /\ other_y_minus_x_temp_3[3] = false /\ other_y_minus_x_temp_3[4] = false /\ other_y_minus_x_temp_3[5] = false /\ other_y_minus_x_temp_3[6] = false /\ other_y_minus_x_temp_3[7] = false /\ other_y_minus_x_temp_3[8] = false /\ other_y_minus_x_temp_3[9] = false /\ other_y_minus_x_temp_3[10] = false /\ other_y_minus_x_temp_3[11] = false /\ other_y_minus_x_temp_3[12] = false /\ other_y_minus_x_temp_3[13] = false /\ other_y_minus_x_temp_3[14] = false /\ other_y_minus_x_temp_3[15] = false /\ other_y_minus_x_temp_3[16] = false /\ other_y_minus_x_temp_3[17] = false /\ other_y_minus_x_temp_3[18] = false /\ other_y_minus_x_temp_3[19] = false /\ other_y_minus_x_temp_3[20] = false /\ other_y_minus_x_temp_3[21] = false /\ other_y_minus_x_temp_3[22] = false /\ other_y_minus_x_temp_3[23] = false /\ other_y_minus_x_temp_3[24] = false /\ other_y_minus_x_temp_3[25] = false /\ other_y_minus_x_temp_3[26] = false /\ other_y_minus_x_temp_3[27] = false /\ other_y_minus_x_temp_3[28] = false /\ other_y_minus_x_temp_3[29] = false /\ other_y_minus_x_temp_3[30] = false /\ other_y_minus_x_temp_3[31] = false;

% ( other_y_minus_x_temp_1 = other_y_minus_x_temp_2 + other_y_minus_x_temp_3 )
constraint binary_add(other_y_minus_x_temp_2, other_y_minus_x_temp_3, false, other_y_minus_x_temp_1);

% ( other_y_minus_x = other_y + other_y_minus_x_temp_1 )
constraint binary_add(other_y, other_y_minus_x_temp_1, false, other_y_minus_x);

array[0..k-1] of var bool: other_case_2;

array[0..k-1] of var bool: other_case_2_temp_1;

array[0..k-1] of var bool: other_case_2_temp_2;

array[0..k-1] of var bool: other_case_2_temp_3;

array[0..k-1] of var bool: other_case_2_temp_4;

% ( other_case_2_temp_4 = other_sign_x ^ other_sign_y )
constraint forall(i in 0..k-1)( other_case_2_temp_4[i] = (other_sign_x[i] xor other_sign_y[i]) );

% ( other_case_2_temp_3 = ~ other_case_2_temp_4 )
constraint forall(i in 0..k-1)( other_case_2_temp_3[i] = ( not other_case_2_temp_4[i] ) );

array[0..k-1] of var bool: other_case_2_temp_5;

array[0..k-1] of var bool: other_case_2_temp_6;

constraint other_case_2_temp_6[0] = true /\ other_case_2_temp_6[1] = true /\ other_case_2_temp_6[2] = true /\ other_case_2_temp_6[3] = true /\ other_case_2_temp_6[4] = true /\ other_case_2_temp_6[5] = false /\ other_case_2_temp_6[6] = false /\ other_case_2_temp_6[7] = false /\ other_case_2_temp_6[8] = false /\ other_case_2_temp_6[9] = false /\ other_case_2_temp_6[10] = false /\ other_case_2_temp_6[11] = false /\ other_case_2_temp_6[12] = false /\ other_case_2_temp_6[13] = false /\ other_case_2_temp_6[14] = false /\ other_case_2_temp_6[15] = false /\ other_case_2_temp_6[16] = false /\ other_case_2_temp_6[17] = false /\ other_case_2_temp_6[18] = false /\ other_case_2_temp_6[19] = false /\ other_case_2_temp_6[20] = false /\ other_case_2_temp_6[21] = false /\ other_case_2_temp_6[22] = false /\ other_case_2_temp_6[23] = false /\ other_case_2_temp_6[24] = false /\ other_case_2_temp_6[25] = false /\ other_case_2_temp_6[26] = false /\ other_case_2_temp_6[27] = false /\ other_case_2_temp_6[28] = false /\ other_case_2_temp_6[29] = false /\ other_case_2_temp_6[30] = false /\ other_case_2_temp_6[31] = false;

% ( other_case_2_temp_5 = other_y_minus_x >> other_case_2_temp_6 )
constraint shift_right(other_y_minus_x, other_case_2_temp_6, other_case_2_temp_5);

% ( other_case_2_temp_2 = other_case_2_temp_3 & other_case_2_temp_5 )
constraint forall(i in 0..k-1)( other_case_2_temp_2[i] = (other_case_2_temp_3[i] /\ other_case_2_temp_5[i]) );

% ( other_case_2_temp_1 = ! other_case_2_temp_2 )
constraint negate(other_case_2_temp_2, other_case_2_temp_1);

% ( other_case_2 = ! other_case_2_temp_1 )
constraint negate(other_case_2_temp_1, other_case_2);

array[0..k-1] of var bool: otherReturn;

% ( otherReturn = other_case_1 | other_case_2 )
constraint forall(i in 0..k-1)( otherReturn[i] = (other_case_1[i] \/ other_case_2[i]) );

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
