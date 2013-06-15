% solver for function leftBitCount

include "globals.mzn";
include "commands.mzn";
int: k = 32;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spec assignments

array[0..k-1] of var bool: spec_x;

array[0..k-1] of var bool: spec_next;

constraint forall(i in 0..k-1)( spec_next[i] = spec_x[i] );

array[0..k-1] of var bool: spec_sum;

constraint spec_sum[0] = false /\ spec_sum[1] = false /\ spec_sum[2] = false /\ spec_sum[3] = false /\ spec_sum[4] = false /\ spec_sum[5] = false /\ spec_sum[6] = false /\ spec_sum[7] = false /\ spec_sum[8] = false /\ spec_sum[9] = false /\ spec_sum[10] = false /\ spec_sum[11] = false /\ spec_sum[12] = false /\ spec_sum[13] = false /\ spec_sum[14] = false /\ spec_sum[15] = false /\ spec_sum[16] = false /\ spec_sum[17] = false /\ spec_sum[18] = false /\ spec_sum[19] = false /\ spec_sum[20] = false /\ spec_sum[21] = false /\ spec_sum[22] = false /\ spec_sum[23] = false /\ spec_sum[24] = false /\ spec_sum[25] = false /\ spec_sum[26] = false /\ spec_sum[27] = false /\ spec_sum[28] = false /\ spec_sum[29] = false /\ spec_sum[30] = false /\ spec_sum[31] = false;

array[0..k-1] of var bool: spec_negZer;

array[0..k-1] of var bool: spec_negZer_temp_1;

constraint spec_negZer_temp_1[0] = false /\ spec_negZer_temp_1[1] = false /\ spec_negZer_temp_1[2] = false /\ spec_negZer_temp_1[3] = false /\ spec_negZer_temp_1[4] = false /\ spec_negZer_temp_1[5] = false /\ spec_negZer_temp_1[6] = false /\ spec_negZer_temp_1[7] = false /\ spec_negZer_temp_1[8] = false /\ spec_negZer_temp_1[9] = false /\ spec_negZer_temp_1[10] = false /\ spec_negZer_temp_1[11] = false /\ spec_negZer_temp_1[12] = false /\ spec_negZer_temp_1[13] = false /\ spec_negZer_temp_1[14] = false /\ spec_negZer_temp_1[15] = false /\ spec_negZer_temp_1[16] = false /\ spec_negZer_temp_1[17] = false /\ spec_negZer_temp_1[18] = false /\ spec_negZer_temp_1[19] = false /\ spec_negZer_temp_1[20] = false /\ spec_negZer_temp_1[21] = false /\ spec_negZer_temp_1[22] = false /\ spec_negZer_temp_1[23] = false /\ spec_negZer_temp_1[24] = false /\ spec_negZer_temp_1[25] = false /\ spec_negZer_temp_1[26] = false /\ spec_negZer_temp_1[27] = false /\ spec_negZer_temp_1[28] = false /\ spec_negZer_temp_1[29] = false /\ spec_negZer_temp_1[30] = false /\ spec_negZer_temp_1[31] = false;

% ( spec_negZer = ~ spec_negZer_temp_1 )
constraint forall(i in 0..k-1)( spec_negZer[i] = ( not spec_negZer_temp_1[i] ) );

array[0..k-1] of var bool: spec_firstHalfOnes;

array[0..k-1] of var bool: spec_firstHalfOnes_temp_1;

array[0..k-1] of var bool: spec_firstHalfOnes_temp_2;

constraint spec_firstHalfOnes_temp_2[0] = false /\ spec_firstHalfOnes_temp_2[1] = false /\ spec_firstHalfOnes_temp_2[2] = false /\ spec_firstHalfOnes_temp_2[3] = false /\ spec_firstHalfOnes_temp_2[4] = true /\ spec_firstHalfOnes_temp_2[5] = false /\ spec_firstHalfOnes_temp_2[6] = false /\ spec_firstHalfOnes_temp_2[7] = false /\ spec_firstHalfOnes_temp_2[8] = false /\ spec_firstHalfOnes_temp_2[9] = false /\ spec_firstHalfOnes_temp_2[10] = false /\ spec_firstHalfOnes_temp_2[11] = false /\ spec_firstHalfOnes_temp_2[12] = false /\ spec_firstHalfOnes_temp_2[13] = false /\ spec_firstHalfOnes_temp_2[14] = false /\ spec_firstHalfOnes_temp_2[15] = false /\ spec_firstHalfOnes_temp_2[16] = false /\ spec_firstHalfOnes_temp_2[17] = false /\ spec_firstHalfOnes_temp_2[18] = false /\ spec_firstHalfOnes_temp_2[19] = false /\ spec_firstHalfOnes_temp_2[20] = false /\ spec_firstHalfOnes_temp_2[21] = false /\ spec_firstHalfOnes_temp_2[22] = false /\ spec_firstHalfOnes_temp_2[23] = false /\ spec_firstHalfOnes_temp_2[24] = false /\ spec_firstHalfOnes_temp_2[25] = false /\ spec_firstHalfOnes_temp_2[26] = false /\ spec_firstHalfOnes_temp_2[27] = false /\ spec_firstHalfOnes_temp_2[28] = false /\ spec_firstHalfOnes_temp_2[29] = false /\ spec_firstHalfOnes_temp_2[30] = false /\ spec_firstHalfOnes_temp_2[31] = false;

% ( spec_firstHalfOnes_temp_1 = spec_negZer << spec_firstHalfOnes_temp_2 )
constraint shift_left(spec_negZer, spec_firstHalfOnes_temp_2, spec_firstHalfOnes_temp_1);

% ( spec_firstHalfOnes = ~ spec_firstHalfOnes_temp_1 )
constraint forall(i in 0..k-1)( spec_firstHalfOnes[i] = ( not spec_firstHalfOnes_temp_1[i] ) );

array[0..k-1] of var bool: spec_firstHalf;

% ( spec_firstHalf = spec_next | spec_firstHalfOnes )
constraint forall(i in 0..k-1)( spec_firstHalf[i] = (spec_next[i] \/ spec_firstHalfOnes[i]) );

array[0..k-1] of var bool: spec_firstHalfIsAllOnes;

array[0..k-1] of var bool: spec_firstHalfIsAllOnes_temp_1;

% ( spec_firstHalfIsAllOnes_temp_1 = ~ spec_firstHalf )
constraint forall(i in 0..k-1)( spec_firstHalfIsAllOnes_temp_1[i] = ( not spec_firstHalf[i] ) );

% ( spec_firstHalfIsAllOnes = ! spec_firstHalfIsAllOnes_temp_1 )
constraint negate(spec_firstHalfIsAllOnes_temp_1, spec_firstHalfIsAllOnes);

array[0..k-1] of var bool: spec_all;

array[0..k-1] of var bool: spec_all_temp_1;

% ( spec_all_temp_1 = ~ spec_firstHalfIsAllOnes )
constraint forall(i in 0..k-1)( spec_all_temp_1[i] = ( not spec_firstHalfIsAllOnes[i] ) );

array[0..k-1] of var bool: spec_all_temp_2;

constraint spec_all_temp_2[0] = true /\ spec_all_temp_2[1] = false /\ spec_all_temp_2[2] = false /\ spec_all_temp_2[3] = false /\ spec_all_temp_2[4] = false /\ spec_all_temp_2[5] = false /\ spec_all_temp_2[6] = false /\ spec_all_temp_2[7] = false /\ spec_all_temp_2[8] = false /\ spec_all_temp_2[9] = false /\ spec_all_temp_2[10] = false /\ spec_all_temp_2[11] = false /\ spec_all_temp_2[12] = false /\ spec_all_temp_2[13] = false /\ spec_all_temp_2[14] = false /\ spec_all_temp_2[15] = false /\ spec_all_temp_2[16] = false /\ spec_all_temp_2[17] = false /\ spec_all_temp_2[18] = false /\ spec_all_temp_2[19] = false /\ spec_all_temp_2[20] = false /\ spec_all_temp_2[21] = false /\ spec_all_temp_2[22] = false /\ spec_all_temp_2[23] = false /\ spec_all_temp_2[24] = false /\ spec_all_temp_2[25] = false /\ spec_all_temp_2[26] = false /\ spec_all_temp_2[27] = false /\ spec_all_temp_2[28] = false /\ spec_all_temp_2[29] = false /\ spec_all_temp_2[30] = false /\ spec_all_temp_2[31] = false;

% ( spec_all = spec_all_temp_1 + spec_all_temp_2 )
constraint binary_add(spec_all_temp_1, spec_all_temp_2, false, spec_all);

array[0..k-1] of var bool: spec_add;

array[0..k-1] of var bool: spec_add_temp_1;

constraint spec_add_temp_1[0] = false /\ spec_add_temp_1[1] = false /\ spec_add_temp_1[2] = false /\ spec_add_temp_1[3] = false /\ spec_add_temp_1[4] = true /\ spec_add_temp_1[5] = false /\ spec_add_temp_1[6] = false /\ spec_add_temp_1[7] = false /\ spec_add_temp_1[8] = false /\ spec_add_temp_1[9] = false /\ spec_add_temp_1[10] = false /\ spec_add_temp_1[11] = false /\ spec_add_temp_1[12] = false /\ spec_add_temp_1[13] = false /\ spec_add_temp_1[14] = false /\ spec_add_temp_1[15] = false /\ spec_add_temp_1[16] = false /\ spec_add_temp_1[17] = false /\ spec_add_temp_1[18] = false /\ spec_add_temp_1[19] = false /\ spec_add_temp_1[20] = false /\ spec_add_temp_1[21] = false /\ spec_add_temp_1[22] = false /\ spec_add_temp_1[23] = false /\ spec_add_temp_1[24] = false /\ spec_add_temp_1[25] = false /\ spec_add_temp_1[26] = false /\ spec_add_temp_1[27] = false /\ spec_add_temp_1[28] = false /\ spec_add_temp_1[29] = false /\ spec_add_temp_1[30] = false /\ spec_add_temp_1[31] = false;

% ( spec_add = spec_all & spec_add_temp_1 )
constraint forall(i in 0..k-1)( spec_add[i] = (spec_all[i] /\ spec_add_temp_1[i]) );

array[0..k-1] of var bool: spec_next_dup_1;

% ( spec_next_dup_1 = spec_next << spec_add )
constraint shift_left(spec_next, spec_add, spec_next_dup_1);

array[0..k-1] of var bool: spec_sum_dup_1;

% ( spec_sum_dup_1 = spec_sum + spec_add )
constraint binary_add(spec_sum, spec_add, false, spec_sum_dup_1);

array[0..k-1] of var bool: spec_firstHalfOnes_dup_1;

array[0..k-1] of var bool: spec_firstHalfOnes_dup_1_temp_1;

array[0..k-1] of var bool: spec_firstHalfOnes_dup_1_temp_2;

constraint spec_firstHalfOnes_dup_1_temp_2[0] = false /\ spec_firstHalfOnes_dup_1_temp_2[1] = false /\ spec_firstHalfOnes_dup_1_temp_2[2] = false /\ spec_firstHalfOnes_dup_1_temp_2[3] = true /\ spec_firstHalfOnes_dup_1_temp_2[4] = true /\ spec_firstHalfOnes_dup_1_temp_2[5] = false /\ spec_firstHalfOnes_dup_1_temp_2[6] = false /\ spec_firstHalfOnes_dup_1_temp_2[7] = false /\ spec_firstHalfOnes_dup_1_temp_2[8] = false /\ spec_firstHalfOnes_dup_1_temp_2[9] = false /\ spec_firstHalfOnes_dup_1_temp_2[10] = false /\ spec_firstHalfOnes_dup_1_temp_2[11] = false /\ spec_firstHalfOnes_dup_1_temp_2[12] = false /\ spec_firstHalfOnes_dup_1_temp_2[13] = false /\ spec_firstHalfOnes_dup_1_temp_2[14] = false /\ spec_firstHalfOnes_dup_1_temp_2[15] = false /\ spec_firstHalfOnes_dup_1_temp_2[16] = false /\ spec_firstHalfOnes_dup_1_temp_2[17] = false /\ spec_firstHalfOnes_dup_1_temp_2[18] = false /\ spec_firstHalfOnes_dup_1_temp_2[19] = false /\ spec_firstHalfOnes_dup_1_temp_2[20] = false /\ spec_firstHalfOnes_dup_1_temp_2[21] = false /\ spec_firstHalfOnes_dup_1_temp_2[22] = false /\ spec_firstHalfOnes_dup_1_temp_2[23] = false /\ spec_firstHalfOnes_dup_1_temp_2[24] = false /\ spec_firstHalfOnes_dup_1_temp_2[25] = false /\ spec_firstHalfOnes_dup_1_temp_2[26] = false /\ spec_firstHalfOnes_dup_1_temp_2[27] = false /\ spec_firstHalfOnes_dup_1_temp_2[28] = false /\ spec_firstHalfOnes_dup_1_temp_2[29] = false /\ spec_firstHalfOnes_dup_1_temp_2[30] = false /\ spec_firstHalfOnes_dup_1_temp_2[31] = false;

% ( spec_firstHalfOnes_dup_1_temp_1 = spec_negZer << spec_firstHalfOnes_dup_1_temp_2 )
constraint shift_left(spec_negZer, spec_firstHalfOnes_dup_1_temp_2, spec_firstHalfOnes_dup_1_temp_1);

% ( spec_firstHalfOnes_dup_1 = ~ spec_firstHalfOnes_dup_1_temp_1 )
constraint forall(i in 0..k-1)( spec_firstHalfOnes_dup_1[i] = ( not spec_firstHalfOnes_dup_1_temp_1[i] ) );

array[0..k-1] of var bool: spec_firstHalf_dup_1;

% ( spec_firstHalf_dup_1 = spec_next_dup_1 | spec_firstHalfOnes_dup_1 )
constraint forall(i in 0..k-1)( spec_firstHalf_dup_1[i] = (spec_next_dup_1[i] \/ spec_firstHalfOnes_dup_1[i]) );

array[0..k-1] of var bool: spec_firstHalfIsAllOnes_dup_1;

array[0..k-1] of var bool: spec_firstHalfIsAllOnes_dup_1_temp_1;

% ( spec_firstHalfIsAllOnes_dup_1_temp_1 = ~ spec_firstHalf_dup_1 )
constraint forall(i in 0..k-1)( spec_firstHalfIsAllOnes_dup_1_temp_1[i] = ( not spec_firstHalf_dup_1[i] ) );

% ( spec_firstHalfIsAllOnes_dup_1 = ! spec_firstHalfIsAllOnes_dup_1_temp_1 )
constraint negate(spec_firstHalfIsAllOnes_dup_1_temp_1, spec_firstHalfIsAllOnes_dup_1);

array[0..k-1] of var bool: spec_all_dup_1;

array[0..k-1] of var bool: spec_all_dup_1_temp_1;

% ( spec_all_dup_1_temp_1 = ~ spec_firstHalfIsAllOnes_dup_1 )
constraint forall(i in 0..k-1)( spec_all_dup_1_temp_1[i] = ( not spec_firstHalfIsAllOnes_dup_1[i] ) );

array[0..k-1] of var bool: spec_all_dup_1_temp_2;

constraint spec_all_dup_1_temp_2[0] = true /\ spec_all_dup_1_temp_2[1] = false /\ spec_all_dup_1_temp_2[2] = false /\ spec_all_dup_1_temp_2[3] = false /\ spec_all_dup_1_temp_2[4] = false /\ spec_all_dup_1_temp_2[5] = false /\ spec_all_dup_1_temp_2[6] = false /\ spec_all_dup_1_temp_2[7] = false /\ spec_all_dup_1_temp_2[8] = false /\ spec_all_dup_1_temp_2[9] = false /\ spec_all_dup_1_temp_2[10] = false /\ spec_all_dup_1_temp_2[11] = false /\ spec_all_dup_1_temp_2[12] = false /\ spec_all_dup_1_temp_2[13] = false /\ spec_all_dup_1_temp_2[14] = false /\ spec_all_dup_1_temp_2[15] = false /\ spec_all_dup_1_temp_2[16] = false /\ spec_all_dup_1_temp_2[17] = false /\ spec_all_dup_1_temp_2[18] = false /\ spec_all_dup_1_temp_2[19] = false /\ spec_all_dup_1_temp_2[20] = false /\ spec_all_dup_1_temp_2[21] = false /\ spec_all_dup_1_temp_2[22] = false /\ spec_all_dup_1_temp_2[23] = false /\ spec_all_dup_1_temp_2[24] = false /\ spec_all_dup_1_temp_2[25] = false /\ spec_all_dup_1_temp_2[26] = false /\ spec_all_dup_1_temp_2[27] = false /\ spec_all_dup_1_temp_2[28] = false /\ spec_all_dup_1_temp_2[29] = false /\ spec_all_dup_1_temp_2[30] = false /\ spec_all_dup_1_temp_2[31] = false;

% ( spec_all_dup_1 = spec_all_dup_1_temp_1 + spec_all_dup_1_temp_2 )
constraint binary_add(spec_all_dup_1_temp_1, spec_all_dup_1_temp_2, false, spec_all_dup_1);

array[0..k-1] of var bool: spec_add_dup_1;

array[0..k-1] of var bool: spec_add_dup_1_temp_1;

constraint spec_add_dup_1_temp_1[0] = false /\ spec_add_dup_1_temp_1[1] = false /\ spec_add_dup_1_temp_1[2] = false /\ spec_add_dup_1_temp_1[3] = true /\ spec_add_dup_1_temp_1[4] = false /\ spec_add_dup_1_temp_1[5] = false /\ spec_add_dup_1_temp_1[6] = false /\ spec_add_dup_1_temp_1[7] = false /\ spec_add_dup_1_temp_1[8] = false /\ spec_add_dup_1_temp_1[9] = false /\ spec_add_dup_1_temp_1[10] = false /\ spec_add_dup_1_temp_1[11] = false /\ spec_add_dup_1_temp_1[12] = false /\ spec_add_dup_1_temp_1[13] = false /\ spec_add_dup_1_temp_1[14] = false /\ spec_add_dup_1_temp_1[15] = false /\ spec_add_dup_1_temp_1[16] = false /\ spec_add_dup_1_temp_1[17] = false /\ spec_add_dup_1_temp_1[18] = false /\ spec_add_dup_1_temp_1[19] = false /\ spec_add_dup_1_temp_1[20] = false /\ spec_add_dup_1_temp_1[21] = false /\ spec_add_dup_1_temp_1[22] = false /\ spec_add_dup_1_temp_1[23] = false /\ spec_add_dup_1_temp_1[24] = false /\ spec_add_dup_1_temp_1[25] = false /\ spec_add_dup_1_temp_1[26] = false /\ spec_add_dup_1_temp_1[27] = false /\ spec_add_dup_1_temp_1[28] = false /\ spec_add_dup_1_temp_1[29] = false /\ spec_add_dup_1_temp_1[30] = false /\ spec_add_dup_1_temp_1[31] = false;

% ( spec_add_dup_1 = spec_all_dup_1 & spec_add_dup_1_temp_1 )
constraint forall(i in 0..k-1)( spec_add_dup_1[i] = (spec_all_dup_1[i] /\ spec_add_dup_1_temp_1[i]) );

array[0..k-1] of var bool: spec_next_dup_2;

% ( spec_next_dup_2 = spec_next_dup_1 << spec_add_dup_1 )
constraint shift_left(spec_next_dup_1, spec_add_dup_1, spec_next_dup_2);

array[0..k-1] of var bool: spec_sum_dup_2;

% ( spec_sum_dup_2 = spec_sum_dup_1 + spec_add_dup_1 )
constraint binary_add(spec_sum_dup_1, spec_add_dup_1, false, spec_sum_dup_2);

array[0..k-1] of var bool: spec_firstHalfOnes_dup_2;

array[0..k-1] of var bool: spec_firstHalfOnes_dup_2_temp_1;

array[0..k-1] of var bool: spec_firstHalfOnes_dup_2_temp_2;

constraint spec_firstHalfOnes_dup_2_temp_2[0] = false /\ spec_firstHalfOnes_dup_2_temp_2[1] = false /\ spec_firstHalfOnes_dup_2_temp_2[2] = true /\ spec_firstHalfOnes_dup_2_temp_2[3] = true /\ spec_firstHalfOnes_dup_2_temp_2[4] = true /\ spec_firstHalfOnes_dup_2_temp_2[5] = false /\ spec_firstHalfOnes_dup_2_temp_2[6] = false /\ spec_firstHalfOnes_dup_2_temp_2[7] = false /\ spec_firstHalfOnes_dup_2_temp_2[8] = false /\ spec_firstHalfOnes_dup_2_temp_2[9] = false /\ spec_firstHalfOnes_dup_2_temp_2[10] = false /\ spec_firstHalfOnes_dup_2_temp_2[11] = false /\ spec_firstHalfOnes_dup_2_temp_2[12] = false /\ spec_firstHalfOnes_dup_2_temp_2[13] = false /\ spec_firstHalfOnes_dup_2_temp_2[14] = false /\ spec_firstHalfOnes_dup_2_temp_2[15] = false /\ spec_firstHalfOnes_dup_2_temp_2[16] = false /\ spec_firstHalfOnes_dup_2_temp_2[17] = false /\ spec_firstHalfOnes_dup_2_temp_2[18] = false /\ spec_firstHalfOnes_dup_2_temp_2[19] = false /\ spec_firstHalfOnes_dup_2_temp_2[20] = false /\ spec_firstHalfOnes_dup_2_temp_2[21] = false /\ spec_firstHalfOnes_dup_2_temp_2[22] = false /\ spec_firstHalfOnes_dup_2_temp_2[23] = false /\ spec_firstHalfOnes_dup_2_temp_2[24] = false /\ spec_firstHalfOnes_dup_2_temp_2[25] = false /\ spec_firstHalfOnes_dup_2_temp_2[26] = false /\ spec_firstHalfOnes_dup_2_temp_2[27] = false /\ spec_firstHalfOnes_dup_2_temp_2[28] = false /\ spec_firstHalfOnes_dup_2_temp_2[29] = false /\ spec_firstHalfOnes_dup_2_temp_2[30] = false /\ spec_firstHalfOnes_dup_2_temp_2[31] = false;

% ( spec_firstHalfOnes_dup_2_temp_1 = spec_negZer << spec_firstHalfOnes_dup_2_temp_2 )
constraint shift_left(spec_negZer, spec_firstHalfOnes_dup_2_temp_2, spec_firstHalfOnes_dup_2_temp_1);

% ( spec_firstHalfOnes_dup_2 = ~ spec_firstHalfOnes_dup_2_temp_1 )
constraint forall(i in 0..k-1)( spec_firstHalfOnes_dup_2[i] = ( not spec_firstHalfOnes_dup_2_temp_1[i] ) );

array[0..k-1] of var bool: spec_firstHalf_dup_2;

% ( spec_firstHalf_dup_2 = spec_next_dup_2 | spec_firstHalfOnes_dup_2 )
constraint forall(i in 0..k-1)( spec_firstHalf_dup_2[i] = (spec_next_dup_2[i] \/ spec_firstHalfOnes_dup_2[i]) );

array[0..k-1] of var bool: spec_firstHalfIsAllOnes_dup_2;

array[0..k-1] of var bool: spec_firstHalfIsAllOnes_dup_2_temp_1;

% ( spec_firstHalfIsAllOnes_dup_2_temp_1 = ~ spec_firstHalf_dup_2 )
constraint forall(i in 0..k-1)( spec_firstHalfIsAllOnes_dup_2_temp_1[i] = ( not spec_firstHalf_dup_2[i] ) );

% ( spec_firstHalfIsAllOnes_dup_2 = ! spec_firstHalfIsAllOnes_dup_2_temp_1 )
constraint negate(spec_firstHalfIsAllOnes_dup_2_temp_1, spec_firstHalfIsAllOnes_dup_2);

array[0..k-1] of var bool: spec_all_dup_2;

array[0..k-1] of var bool: spec_all_dup_2_temp_1;

% ( spec_all_dup_2_temp_1 = ~ spec_firstHalfIsAllOnes_dup_2 )
constraint forall(i in 0..k-1)( spec_all_dup_2_temp_1[i] = ( not spec_firstHalfIsAllOnes_dup_2[i] ) );

array[0..k-1] of var bool: spec_all_dup_2_temp_2;

constraint spec_all_dup_2_temp_2[0] = true /\ spec_all_dup_2_temp_2[1] = false /\ spec_all_dup_2_temp_2[2] = false /\ spec_all_dup_2_temp_2[3] = false /\ spec_all_dup_2_temp_2[4] = false /\ spec_all_dup_2_temp_2[5] = false /\ spec_all_dup_2_temp_2[6] = false /\ spec_all_dup_2_temp_2[7] = false /\ spec_all_dup_2_temp_2[8] = false /\ spec_all_dup_2_temp_2[9] = false /\ spec_all_dup_2_temp_2[10] = false /\ spec_all_dup_2_temp_2[11] = false /\ spec_all_dup_2_temp_2[12] = false /\ spec_all_dup_2_temp_2[13] = false /\ spec_all_dup_2_temp_2[14] = false /\ spec_all_dup_2_temp_2[15] = false /\ spec_all_dup_2_temp_2[16] = false /\ spec_all_dup_2_temp_2[17] = false /\ spec_all_dup_2_temp_2[18] = false /\ spec_all_dup_2_temp_2[19] = false /\ spec_all_dup_2_temp_2[20] = false /\ spec_all_dup_2_temp_2[21] = false /\ spec_all_dup_2_temp_2[22] = false /\ spec_all_dup_2_temp_2[23] = false /\ spec_all_dup_2_temp_2[24] = false /\ spec_all_dup_2_temp_2[25] = false /\ spec_all_dup_2_temp_2[26] = false /\ spec_all_dup_2_temp_2[27] = false /\ spec_all_dup_2_temp_2[28] = false /\ spec_all_dup_2_temp_2[29] = false /\ spec_all_dup_2_temp_2[30] = false /\ spec_all_dup_2_temp_2[31] = false;

% ( spec_all_dup_2 = spec_all_dup_2_temp_1 + spec_all_dup_2_temp_2 )
constraint binary_add(spec_all_dup_2_temp_1, spec_all_dup_2_temp_2, false, spec_all_dup_2);

array[0..k-1] of var bool: spec_add_dup_2;

array[0..k-1] of var bool: spec_add_dup_2_temp_1;

constraint spec_add_dup_2_temp_1[0] = false /\ spec_add_dup_2_temp_1[1] = false /\ spec_add_dup_2_temp_1[2] = true /\ spec_add_dup_2_temp_1[3] = false /\ spec_add_dup_2_temp_1[4] = false /\ spec_add_dup_2_temp_1[5] = false /\ spec_add_dup_2_temp_1[6] = false /\ spec_add_dup_2_temp_1[7] = false /\ spec_add_dup_2_temp_1[8] = false /\ spec_add_dup_2_temp_1[9] = false /\ spec_add_dup_2_temp_1[10] = false /\ spec_add_dup_2_temp_1[11] = false /\ spec_add_dup_2_temp_1[12] = false /\ spec_add_dup_2_temp_1[13] = false /\ spec_add_dup_2_temp_1[14] = false /\ spec_add_dup_2_temp_1[15] = false /\ spec_add_dup_2_temp_1[16] = false /\ spec_add_dup_2_temp_1[17] = false /\ spec_add_dup_2_temp_1[18] = false /\ spec_add_dup_2_temp_1[19] = false /\ spec_add_dup_2_temp_1[20] = false /\ spec_add_dup_2_temp_1[21] = false /\ spec_add_dup_2_temp_1[22] = false /\ spec_add_dup_2_temp_1[23] = false /\ spec_add_dup_2_temp_1[24] = false /\ spec_add_dup_2_temp_1[25] = false /\ spec_add_dup_2_temp_1[26] = false /\ spec_add_dup_2_temp_1[27] = false /\ spec_add_dup_2_temp_1[28] = false /\ spec_add_dup_2_temp_1[29] = false /\ spec_add_dup_2_temp_1[30] = false /\ spec_add_dup_2_temp_1[31] = false;

% ( spec_add_dup_2 = spec_all_dup_2 & spec_add_dup_2_temp_1 )
constraint forall(i in 0..k-1)( spec_add_dup_2[i] = (spec_all_dup_2[i] /\ spec_add_dup_2_temp_1[i]) );

array[0..k-1] of var bool: spec_next_dup_3;

% ( spec_next_dup_3 = spec_next_dup_2 << spec_add_dup_2 )
constraint shift_left(spec_next_dup_2, spec_add_dup_2, spec_next_dup_3);

array[0..k-1] of var bool: spec_sum_dup_3;

% ( spec_sum_dup_3 = spec_sum_dup_2 + spec_add_dup_2 )
constraint binary_add(spec_sum_dup_2, spec_add_dup_2, false, spec_sum_dup_3);

array[0..k-1] of var bool: spec_firstHalfOnes_dup_3;

array[0..k-1] of var bool: spec_firstHalfOnes_dup_3_temp_1;

array[0..k-1] of var bool: spec_firstHalfOnes_dup_3_temp_2;

constraint spec_firstHalfOnes_dup_3_temp_2[0] = false /\ spec_firstHalfOnes_dup_3_temp_2[1] = true /\ spec_firstHalfOnes_dup_3_temp_2[2] = true /\ spec_firstHalfOnes_dup_3_temp_2[3] = true /\ spec_firstHalfOnes_dup_3_temp_2[4] = true /\ spec_firstHalfOnes_dup_3_temp_2[5] = false /\ spec_firstHalfOnes_dup_3_temp_2[6] = false /\ spec_firstHalfOnes_dup_3_temp_2[7] = false /\ spec_firstHalfOnes_dup_3_temp_2[8] = false /\ spec_firstHalfOnes_dup_3_temp_2[9] = false /\ spec_firstHalfOnes_dup_3_temp_2[10] = false /\ spec_firstHalfOnes_dup_3_temp_2[11] = false /\ spec_firstHalfOnes_dup_3_temp_2[12] = false /\ spec_firstHalfOnes_dup_3_temp_2[13] = false /\ spec_firstHalfOnes_dup_3_temp_2[14] = false /\ spec_firstHalfOnes_dup_3_temp_2[15] = false /\ spec_firstHalfOnes_dup_3_temp_2[16] = false /\ spec_firstHalfOnes_dup_3_temp_2[17] = false /\ spec_firstHalfOnes_dup_3_temp_2[18] = false /\ spec_firstHalfOnes_dup_3_temp_2[19] = false /\ spec_firstHalfOnes_dup_3_temp_2[20] = false /\ spec_firstHalfOnes_dup_3_temp_2[21] = false /\ spec_firstHalfOnes_dup_3_temp_2[22] = false /\ spec_firstHalfOnes_dup_3_temp_2[23] = false /\ spec_firstHalfOnes_dup_3_temp_2[24] = false /\ spec_firstHalfOnes_dup_3_temp_2[25] = false /\ spec_firstHalfOnes_dup_3_temp_2[26] = false /\ spec_firstHalfOnes_dup_3_temp_2[27] = false /\ spec_firstHalfOnes_dup_3_temp_2[28] = false /\ spec_firstHalfOnes_dup_3_temp_2[29] = false /\ spec_firstHalfOnes_dup_3_temp_2[30] = false /\ spec_firstHalfOnes_dup_3_temp_2[31] = false;

% ( spec_firstHalfOnes_dup_3_temp_1 = spec_negZer << spec_firstHalfOnes_dup_3_temp_2 )
constraint shift_left(spec_negZer, spec_firstHalfOnes_dup_3_temp_2, spec_firstHalfOnes_dup_3_temp_1);

% ( spec_firstHalfOnes_dup_3 = ~ spec_firstHalfOnes_dup_3_temp_1 )
constraint forall(i in 0..k-1)( spec_firstHalfOnes_dup_3[i] = ( not spec_firstHalfOnes_dup_3_temp_1[i] ) );

array[0..k-1] of var bool: spec_firstHalf_dup_3;

% ( spec_firstHalf_dup_3 = spec_next_dup_3 | spec_firstHalfOnes_dup_3 )
constraint forall(i in 0..k-1)( spec_firstHalf_dup_3[i] = (spec_next_dup_3[i] \/ spec_firstHalfOnes_dup_3[i]) );

array[0..k-1] of var bool: spec_firstHalfIsAllOnes_dup_3;

array[0..k-1] of var bool: spec_firstHalfIsAllOnes_dup_3_temp_1;

% ( spec_firstHalfIsAllOnes_dup_3_temp_1 = ~ spec_firstHalf_dup_3 )
constraint forall(i in 0..k-1)( spec_firstHalfIsAllOnes_dup_3_temp_1[i] = ( not spec_firstHalf_dup_3[i] ) );

% ( spec_firstHalfIsAllOnes_dup_3 = ! spec_firstHalfIsAllOnes_dup_3_temp_1 )
constraint negate(spec_firstHalfIsAllOnes_dup_3_temp_1, spec_firstHalfIsAllOnes_dup_3);

array[0..k-1] of var bool: spec_all_dup_3;

array[0..k-1] of var bool: spec_all_dup_3_temp_1;

% ( spec_all_dup_3_temp_1 = ~ spec_firstHalfIsAllOnes_dup_3 )
constraint forall(i in 0..k-1)( spec_all_dup_3_temp_1[i] = ( not spec_firstHalfIsAllOnes_dup_3[i] ) );

array[0..k-1] of var bool: spec_all_dup_3_temp_2;

constraint spec_all_dup_3_temp_2[0] = true /\ spec_all_dup_3_temp_2[1] = false /\ spec_all_dup_3_temp_2[2] = false /\ spec_all_dup_3_temp_2[3] = false /\ spec_all_dup_3_temp_2[4] = false /\ spec_all_dup_3_temp_2[5] = false /\ spec_all_dup_3_temp_2[6] = false /\ spec_all_dup_3_temp_2[7] = false /\ spec_all_dup_3_temp_2[8] = false /\ spec_all_dup_3_temp_2[9] = false /\ spec_all_dup_3_temp_2[10] = false /\ spec_all_dup_3_temp_2[11] = false /\ spec_all_dup_3_temp_2[12] = false /\ spec_all_dup_3_temp_2[13] = false /\ spec_all_dup_3_temp_2[14] = false /\ spec_all_dup_3_temp_2[15] = false /\ spec_all_dup_3_temp_2[16] = false /\ spec_all_dup_3_temp_2[17] = false /\ spec_all_dup_3_temp_2[18] = false /\ spec_all_dup_3_temp_2[19] = false /\ spec_all_dup_3_temp_2[20] = false /\ spec_all_dup_3_temp_2[21] = false /\ spec_all_dup_3_temp_2[22] = false /\ spec_all_dup_3_temp_2[23] = false /\ spec_all_dup_3_temp_2[24] = false /\ spec_all_dup_3_temp_2[25] = false /\ spec_all_dup_3_temp_2[26] = false /\ spec_all_dup_3_temp_2[27] = false /\ spec_all_dup_3_temp_2[28] = false /\ spec_all_dup_3_temp_2[29] = false /\ spec_all_dup_3_temp_2[30] = false /\ spec_all_dup_3_temp_2[31] = false;

% ( spec_all_dup_3 = spec_all_dup_3_temp_1 + spec_all_dup_3_temp_2 )
constraint binary_add(spec_all_dup_3_temp_1, spec_all_dup_3_temp_2, false, spec_all_dup_3);

array[0..k-1] of var bool: spec_add_dup_3;

array[0..k-1] of var bool: spec_add_dup_3_temp_1;

constraint spec_add_dup_3_temp_1[0] = false /\ spec_add_dup_3_temp_1[1] = true /\ spec_add_dup_3_temp_1[2] = false /\ spec_add_dup_3_temp_1[3] = false /\ spec_add_dup_3_temp_1[4] = false /\ spec_add_dup_3_temp_1[5] = false /\ spec_add_dup_3_temp_1[6] = false /\ spec_add_dup_3_temp_1[7] = false /\ spec_add_dup_3_temp_1[8] = false /\ spec_add_dup_3_temp_1[9] = false /\ spec_add_dup_3_temp_1[10] = false /\ spec_add_dup_3_temp_1[11] = false /\ spec_add_dup_3_temp_1[12] = false /\ spec_add_dup_3_temp_1[13] = false /\ spec_add_dup_3_temp_1[14] = false /\ spec_add_dup_3_temp_1[15] = false /\ spec_add_dup_3_temp_1[16] = false /\ spec_add_dup_3_temp_1[17] = false /\ spec_add_dup_3_temp_1[18] = false /\ spec_add_dup_3_temp_1[19] = false /\ spec_add_dup_3_temp_1[20] = false /\ spec_add_dup_3_temp_1[21] = false /\ spec_add_dup_3_temp_1[22] = false /\ spec_add_dup_3_temp_1[23] = false /\ spec_add_dup_3_temp_1[24] = false /\ spec_add_dup_3_temp_1[25] = false /\ spec_add_dup_3_temp_1[26] = false /\ spec_add_dup_3_temp_1[27] = false /\ spec_add_dup_3_temp_1[28] = false /\ spec_add_dup_3_temp_1[29] = false /\ spec_add_dup_3_temp_1[30] = false /\ spec_add_dup_3_temp_1[31] = false;

% ( spec_add_dup_3 = spec_all_dup_3 & spec_add_dup_3_temp_1 )
constraint forall(i in 0..k-1)( spec_add_dup_3[i] = (spec_all_dup_3[i] /\ spec_add_dup_3_temp_1[i]) );

array[0..k-1] of var bool: spec_next_dup_4;

% ( spec_next_dup_4 = spec_next_dup_3 << spec_add_dup_3 )
constraint shift_left(spec_next_dup_3, spec_add_dup_3, spec_next_dup_4);

array[0..k-1] of var bool: spec_sum_dup_4;

% ( spec_sum_dup_4 = spec_sum_dup_3 + spec_add_dup_3 )
constraint binary_add(spec_sum_dup_3, spec_add_dup_3, false, spec_sum_dup_4);

array[0..k-1] of var bool: spec_check;

array[0..k-1] of var bool: spec_check_temp_1;

array[0..k-1] of var bool: spec_check_temp_2;

constraint spec_check_temp_2[0] = true /\ spec_check_temp_2[1] = true /\ spec_check_temp_2[2] = true /\ spec_check_temp_2[3] = true /\ spec_check_temp_2[4] = true /\ spec_check_temp_2[5] = false /\ spec_check_temp_2[6] = false /\ spec_check_temp_2[7] = false /\ spec_check_temp_2[8] = false /\ spec_check_temp_2[9] = false /\ spec_check_temp_2[10] = false /\ spec_check_temp_2[11] = false /\ spec_check_temp_2[12] = false /\ spec_check_temp_2[13] = false /\ spec_check_temp_2[14] = false /\ spec_check_temp_2[15] = false /\ spec_check_temp_2[16] = false /\ spec_check_temp_2[17] = false /\ spec_check_temp_2[18] = false /\ spec_check_temp_2[19] = false /\ spec_check_temp_2[20] = false /\ spec_check_temp_2[21] = false /\ spec_check_temp_2[22] = false /\ spec_check_temp_2[23] = false /\ spec_check_temp_2[24] = false /\ spec_check_temp_2[25] = false /\ spec_check_temp_2[26] = false /\ spec_check_temp_2[27] = false /\ spec_check_temp_2[28] = false /\ spec_check_temp_2[29] = false /\ spec_check_temp_2[30] = false /\ spec_check_temp_2[31] = false;

% ( spec_check_temp_1 = spec_next_dup_4 >> spec_check_temp_2 )
constraint shift_right(spec_next_dup_4, spec_check_temp_2, spec_check_temp_1);

array[0..k-1] of var bool: spec_check_temp_3;

constraint spec_check_temp_3[0] = true /\ spec_check_temp_3[1] = false /\ spec_check_temp_3[2] = false /\ spec_check_temp_3[3] = false /\ spec_check_temp_3[4] = false /\ spec_check_temp_3[5] = false /\ spec_check_temp_3[6] = false /\ spec_check_temp_3[7] = false /\ spec_check_temp_3[8] = false /\ spec_check_temp_3[9] = false /\ spec_check_temp_3[10] = false /\ spec_check_temp_3[11] = false /\ spec_check_temp_3[12] = false /\ spec_check_temp_3[13] = false /\ spec_check_temp_3[14] = false /\ spec_check_temp_3[15] = false /\ spec_check_temp_3[16] = false /\ spec_check_temp_3[17] = false /\ spec_check_temp_3[18] = false /\ spec_check_temp_3[19] = false /\ spec_check_temp_3[20] = false /\ spec_check_temp_3[21] = false /\ spec_check_temp_3[22] = false /\ spec_check_temp_3[23] = false /\ spec_check_temp_3[24] = false /\ spec_check_temp_3[25] = false /\ spec_check_temp_3[26] = false /\ spec_check_temp_3[27] = false /\ spec_check_temp_3[28] = false /\ spec_check_temp_3[29] = false /\ spec_check_temp_3[30] = false /\ spec_check_temp_3[31] = false;

% ( spec_check = spec_check_temp_1 & spec_check_temp_3 )
constraint forall(i in 0..k-1)( spec_check[i] = (spec_check_temp_1[i] /\ spec_check_temp_3[i]) );

array[0..k-1] of var bool: spec_sum_dup_5;

array[0..k-1] of var bool: spec_sum_dup_5_temp_1;

array[0..k-1] of var bool: spec_sum_dup_5_temp_2;

array[0..k-1] of var bool: spec_sum_dup_5_temp_3;

array[0..k-1] of var bool: spec_sum_dup_5_temp_4;

constraint spec_sum_dup_5_temp_4[0] = false /\ spec_sum_dup_5_temp_4[1] = true /\ spec_sum_dup_5_temp_4[2] = true /\ spec_sum_dup_5_temp_4[3] = true /\ spec_sum_dup_5_temp_4[4] = true /\ spec_sum_dup_5_temp_4[5] = false /\ spec_sum_dup_5_temp_4[6] = false /\ spec_sum_dup_5_temp_4[7] = false /\ spec_sum_dup_5_temp_4[8] = false /\ spec_sum_dup_5_temp_4[9] = false /\ spec_sum_dup_5_temp_4[10] = false /\ spec_sum_dup_5_temp_4[11] = false /\ spec_sum_dup_5_temp_4[12] = false /\ spec_sum_dup_5_temp_4[13] = false /\ spec_sum_dup_5_temp_4[14] = false /\ spec_sum_dup_5_temp_4[15] = false /\ spec_sum_dup_5_temp_4[16] = false /\ spec_sum_dup_5_temp_4[17] = false /\ spec_sum_dup_5_temp_4[18] = false /\ spec_sum_dup_5_temp_4[19] = false /\ spec_sum_dup_5_temp_4[20] = false /\ spec_sum_dup_5_temp_4[21] = false /\ spec_sum_dup_5_temp_4[22] = false /\ spec_sum_dup_5_temp_4[23] = false /\ spec_sum_dup_5_temp_4[24] = false /\ spec_sum_dup_5_temp_4[25] = false /\ spec_sum_dup_5_temp_4[26] = false /\ spec_sum_dup_5_temp_4[27] = false /\ spec_sum_dup_5_temp_4[28] = false /\ spec_sum_dup_5_temp_4[29] = false /\ spec_sum_dup_5_temp_4[30] = false /\ spec_sum_dup_5_temp_4[31] = false;

% ( spec_sum_dup_5_temp_3 = spec_next_dup_4 >> spec_sum_dup_5_temp_4 )
constraint shift_right(spec_next_dup_4, spec_sum_dup_5_temp_4, spec_sum_dup_5_temp_3);

% ( spec_sum_dup_5_temp_2 = spec_sum_dup_5_temp_3 & spec_check )
constraint forall(i in 0..k-1)( spec_sum_dup_5_temp_2[i] = (spec_sum_dup_5_temp_3[i] /\ spec_check[i]) );

% ( spec_sum_dup_5_temp_1 = spec_sum_dup_4 + spec_sum_dup_5_temp_2 )
constraint binary_add(spec_sum_dup_4, spec_sum_dup_5_temp_2, false, spec_sum_dup_5_temp_1);

% ( spec_sum_dup_5 = spec_sum_dup_5_temp_1 + spec_check )
constraint binary_add(spec_sum_dup_5_temp_1, spec_check, false, spec_sum_dup_5);

array[0..k-1] of var bool: specReturn;

constraint forall(i in 0..k-1)( specReturn[i] = spec_sum_dup_5[i] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% other assignments

array[0..k-1] of var bool: other_x;

array[0..k-1] of var bool: other_v;

constraint forall(i in 0..k-1)( other_v[i] = other_x[i] );

array[0..k-1] of var bool: other_full;

array[0..k-1] of var bool: other_full_temp_1;

% ( other_full_temp_1 = ~ other_x )
constraint forall(i in 0..k-1)( other_full_temp_1[i] = ( not other_x[i] ) );

% ( other_full = ! other_full_temp_1 )
constraint negate(other_full_temp_1, other_full);

array[0..k-1] of var bool: other_r;

array[0..k-1] of var bool: other_r_temp_1;

array[0..k-1] of var bool: other_r_temp_2;

array[0..k-1] of var bool: other_r_temp_3;

array[0..k-1] of var bool: other_r_temp_4;

constraint other_r_temp_4[0] = false /\ other_r_temp_4[1] = false /\ other_r_temp_4[2] = false /\ other_r_temp_4[3] = false /\ other_r_temp_4[4] = true /\ other_r_temp_4[5] = false /\ other_r_temp_4[6] = false /\ other_r_temp_4[7] = false /\ other_r_temp_4[8] = false /\ other_r_temp_4[9] = false /\ other_r_temp_4[10] = false /\ other_r_temp_4[11] = false /\ other_r_temp_4[12] = false /\ other_r_temp_4[13] = false /\ other_r_temp_4[14] = false /\ other_r_temp_4[15] = false /\ other_r_temp_4[16] = false /\ other_r_temp_4[17] = false /\ other_r_temp_4[18] = false /\ other_r_temp_4[19] = false /\ other_r_temp_4[20] = false /\ other_r_temp_4[21] = false /\ other_r_temp_4[22] = false /\ other_r_temp_4[23] = false /\ other_r_temp_4[24] = false /\ other_r_temp_4[25] = false /\ other_r_temp_4[26] = false /\ other_r_temp_4[27] = false /\ other_r_temp_4[28] = false /\ other_r_temp_4[29] = false /\ other_r_temp_4[30] = false /\ other_r_temp_4[31] = false;

% ( other_r_temp_3 = other_v >> other_r_temp_4 )
constraint shift_right(other_v, other_r_temp_4, other_r_temp_3);

% ( other_r_temp_2 = ~ other_r_temp_3 )
constraint forall(i in 0..k-1)( other_r_temp_2[i] = ( not other_r_temp_3[i] ) );

% ( other_r_temp_1 = ! other_r_temp_2 )
constraint negate(other_r_temp_2, other_r_temp_1);

array[0..k-1] of var bool: other_r_temp_5;

constraint other_r_temp_5[0] = false /\ other_r_temp_5[1] = false /\ other_r_temp_5[2] = true /\ other_r_temp_5[3] = false /\ other_r_temp_5[4] = false /\ other_r_temp_5[5] = false /\ other_r_temp_5[6] = false /\ other_r_temp_5[7] = false /\ other_r_temp_5[8] = false /\ other_r_temp_5[9] = false /\ other_r_temp_5[10] = false /\ other_r_temp_5[11] = false /\ other_r_temp_5[12] = false /\ other_r_temp_5[13] = false /\ other_r_temp_5[14] = false /\ other_r_temp_5[15] = false /\ other_r_temp_5[16] = false /\ other_r_temp_5[17] = false /\ other_r_temp_5[18] = false /\ other_r_temp_5[19] = false /\ other_r_temp_5[20] = false /\ other_r_temp_5[21] = false /\ other_r_temp_5[22] = false /\ other_r_temp_5[23] = false /\ other_r_temp_5[24] = false /\ other_r_temp_5[25] = false /\ other_r_temp_5[26] = false /\ other_r_temp_5[27] = false /\ other_r_temp_5[28] = false /\ other_r_temp_5[29] = false /\ other_r_temp_5[30] = false /\ other_r_temp_5[31] = false;

% ( other_r = other_r_temp_1 << other_r_temp_5 )
constraint shift_left(other_r_temp_1, other_r_temp_5, other_r);

array[0..k-1] of var bool: other_v_dup_1;

% ( other_v_dup_1 = other_v << other_r )
constraint shift_left(other_v, other_r, other_v_dup_1);

array[0..k-1] of var bool: other_shift;

array[0..k-1] of var bool: other_shift_temp_1;

array[0..k-1] of var bool: other_shift_temp_2;

array[0..k-1] of var bool: other_shift_temp_3;

array[0..k-1] of var bool: other_shift_temp_4;

constraint other_shift_temp_4[0] = false /\ other_shift_temp_4[1] = false /\ other_shift_temp_4[2] = false /\ other_shift_temp_4[3] = true /\ other_shift_temp_4[4] = true /\ other_shift_temp_4[5] = false /\ other_shift_temp_4[6] = false /\ other_shift_temp_4[7] = false /\ other_shift_temp_4[8] = false /\ other_shift_temp_4[9] = false /\ other_shift_temp_4[10] = false /\ other_shift_temp_4[11] = false /\ other_shift_temp_4[12] = false /\ other_shift_temp_4[13] = false /\ other_shift_temp_4[14] = false /\ other_shift_temp_4[15] = false /\ other_shift_temp_4[16] = false /\ other_shift_temp_4[17] = false /\ other_shift_temp_4[18] = false /\ other_shift_temp_4[19] = false /\ other_shift_temp_4[20] = false /\ other_shift_temp_4[21] = false /\ other_shift_temp_4[22] = false /\ other_shift_temp_4[23] = false /\ other_shift_temp_4[24] = false /\ other_shift_temp_4[25] = false /\ other_shift_temp_4[26] = false /\ other_shift_temp_4[27] = false /\ other_shift_temp_4[28] = false /\ other_shift_temp_4[29] = false /\ other_shift_temp_4[30] = false /\ other_shift_temp_4[31] = false;

% ( other_shift_temp_3 = other_v_dup_1 >> other_shift_temp_4 )
constraint shift_right(other_v_dup_1, other_shift_temp_4, other_shift_temp_3);

% ( other_shift_temp_2 = ~ other_shift_temp_3 )
constraint forall(i in 0..k-1)( other_shift_temp_2[i] = ( not other_shift_temp_3[i] ) );

% ( other_shift_temp_1 = ! other_shift_temp_2 )
constraint negate(other_shift_temp_2, other_shift_temp_1);

array[0..k-1] of var bool: other_shift_temp_5;

constraint other_shift_temp_5[0] = true /\ other_shift_temp_5[1] = true /\ other_shift_temp_5[2] = false /\ other_shift_temp_5[3] = false /\ other_shift_temp_5[4] = false /\ other_shift_temp_5[5] = false /\ other_shift_temp_5[6] = false /\ other_shift_temp_5[7] = false /\ other_shift_temp_5[8] = false /\ other_shift_temp_5[9] = false /\ other_shift_temp_5[10] = false /\ other_shift_temp_5[11] = false /\ other_shift_temp_5[12] = false /\ other_shift_temp_5[13] = false /\ other_shift_temp_5[14] = false /\ other_shift_temp_5[15] = false /\ other_shift_temp_5[16] = false /\ other_shift_temp_5[17] = false /\ other_shift_temp_5[18] = false /\ other_shift_temp_5[19] = false /\ other_shift_temp_5[20] = false /\ other_shift_temp_5[21] = false /\ other_shift_temp_5[22] = false /\ other_shift_temp_5[23] = false /\ other_shift_temp_5[24] = false /\ other_shift_temp_5[25] = false /\ other_shift_temp_5[26] = false /\ other_shift_temp_5[27] = false /\ other_shift_temp_5[28] = false /\ other_shift_temp_5[29] = false /\ other_shift_temp_5[30] = false /\ other_shift_temp_5[31] = false;

% ( other_shift = other_shift_temp_1 << other_shift_temp_5 )
constraint shift_left(other_shift_temp_1, other_shift_temp_5, other_shift);

array[0..k-1] of var bool: other_v_dup_2;

% ( other_v_dup_2 = other_v_dup_1 << other_shift )
constraint shift_left(other_v_dup_1, other_shift, other_v_dup_2);

array[0..k-1] of var bool: other_r_dup_1;

% ( other_r_dup_1 = other_r | other_shift )
constraint forall(i in 0..k-1)( other_r_dup_1[i] = (other_r[i] \/ other_shift[i]) );

array[0..k-1] of var bool: other_shift_dup_1;

array[0..k-1] of var bool: other_shift_dup_1_temp_1;

array[0..k-1] of var bool: other_shift_dup_1_temp_2;

array[0..k-1] of var bool: other_shift_dup_1_temp_3;

array[0..k-1] of var bool: other_shift_dup_1_temp_4;

constraint other_shift_dup_1_temp_4[0] = false /\ other_shift_dup_1_temp_4[1] = false /\ other_shift_dup_1_temp_4[2] = true /\ other_shift_dup_1_temp_4[3] = true /\ other_shift_dup_1_temp_4[4] = true /\ other_shift_dup_1_temp_4[5] = false /\ other_shift_dup_1_temp_4[6] = false /\ other_shift_dup_1_temp_4[7] = false /\ other_shift_dup_1_temp_4[8] = false /\ other_shift_dup_1_temp_4[9] = false /\ other_shift_dup_1_temp_4[10] = false /\ other_shift_dup_1_temp_4[11] = false /\ other_shift_dup_1_temp_4[12] = false /\ other_shift_dup_1_temp_4[13] = false /\ other_shift_dup_1_temp_4[14] = false /\ other_shift_dup_1_temp_4[15] = false /\ other_shift_dup_1_temp_4[16] = false /\ other_shift_dup_1_temp_4[17] = false /\ other_shift_dup_1_temp_4[18] = false /\ other_shift_dup_1_temp_4[19] = false /\ other_shift_dup_1_temp_4[20] = false /\ other_shift_dup_1_temp_4[21] = false /\ other_shift_dup_1_temp_4[22] = false /\ other_shift_dup_1_temp_4[23] = false /\ other_shift_dup_1_temp_4[24] = false /\ other_shift_dup_1_temp_4[25] = false /\ other_shift_dup_1_temp_4[26] = false /\ other_shift_dup_1_temp_4[27] = false /\ other_shift_dup_1_temp_4[28] = false /\ other_shift_dup_1_temp_4[29] = false /\ other_shift_dup_1_temp_4[30] = false /\ other_shift_dup_1_temp_4[31] = false;

% ( other_shift_dup_1_temp_3 = other_v_dup_2 >> other_shift_dup_1_temp_4 )
constraint shift_right(other_v_dup_2, other_shift_dup_1_temp_4, other_shift_dup_1_temp_3);

% ( other_shift_dup_1_temp_2 = ~ other_shift_dup_1_temp_3 )
constraint forall(i in 0..k-1)( other_shift_dup_1_temp_2[i] = ( not other_shift_dup_1_temp_3[i] ) );

% ( other_shift_dup_1_temp_1 = ! other_shift_dup_1_temp_2 )
constraint negate(other_shift_dup_1_temp_2, other_shift_dup_1_temp_1);

array[0..k-1] of var bool: other_shift_dup_1_temp_5;

constraint other_shift_dup_1_temp_5[0] = false /\ other_shift_dup_1_temp_5[1] = true /\ other_shift_dup_1_temp_5[2] = false /\ other_shift_dup_1_temp_5[3] = false /\ other_shift_dup_1_temp_5[4] = false /\ other_shift_dup_1_temp_5[5] = false /\ other_shift_dup_1_temp_5[6] = false /\ other_shift_dup_1_temp_5[7] = false /\ other_shift_dup_1_temp_5[8] = false /\ other_shift_dup_1_temp_5[9] = false /\ other_shift_dup_1_temp_5[10] = false /\ other_shift_dup_1_temp_5[11] = false /\ other_shift_dup_1_temp_5[12] = false /\ other_shift_dup_1_temp_5[13] = false /\ other_shift_dup_1_temp_5[14] = false /\ other_shift_dup_1_temp_5[15] = false /\ other_shift_dup_1_temp_5[16] = false /\ other_shift_dup_1_temp_5[17] = false /\ other_shift_dup_1_temp_5[18] = false /\ other_shift_dup_1_temp_5[19] = false /\ other_shift_dup_1_temp_5[20] = false /\ other_shift_dup_1_temp_5[21] = false /\ other_shift_dup_1_temp_5[22] = false /\ other_shift_dup_1_temp_5[23] = false /\ other_shift_dup_1_temp_5[24] = false /\ other_shift_dup_1_temp_5[25] = false /\ other_shift_dup_1_temp_5[26] = false /\ other_shift_dup_1_temp_5[27] = false /\ other_shift_dup_1_temp_5[28] = false /\ other_shift_dup_1_temp_5[29] = false /\ other_shift_dup_1_temp_5[30] = false /\ other_shift_dup_1_temp_5[31] = false;

% ( other_shift_dup_1 = other_shift_dup_1_temp_1 << other_shift_dup_1_temp_5 )
constraint shift_left(other_shift_dup_1_temp_1, other_shift_dup_1_temp_5, other_shift_dup_1);

array[0..k-1] of var bool: other_v_dup_3;

% ( other_v_dup_3 = other_v_dup_2 << other_shift_dup_1 )
constraint shift_left(other_v_dup_2, other_shift_dup_1, other_v_dup_3);

array[0..k-1] of var bool: other_r_dup_2;

% ( other_r_dup_2 = other_r_dup_1 | other_shift_dup_1 )
constraint forall(i in 0..k-1)( other_r_dup_2[i] = (other_r_dup_1[i] \/ other_shift_dup_1[i]) );

array[0..k-1] of var bool: other_shift_dup_2;

array[0..k-1] of var bool: other_shift_dup_2_temp_1;

array[0..k-1] of var bool: other_shift_dup_2_temp_2;

array[0..k-1] of var bool: other_shift_dup_2_temp_3;

array[0..k-1] of var bool: other_shift_dup_2_temp_4;

constraint other_shift_dup_2_temp_4[0] = false /\ other_shift_dup_2_temp_4[1] = true /\ other_shift_dup_2_temp_4[2] = true /\ other_shift_dup_2_temp_4[3] = true /\ other_shift_dup_2_temp_4[4] = true /\ other_shift_dup_2_temp_4[5] = false /\ other_shift_dup_2_temp_4[6] = false /\ other_shift_dup_2_temp_4[7] = false /\ other_shift_dup_2_temp_4[8] = false /\ other_shift_dup_2_temp_4[9] = false /\ other_shift_dup_2_temp_4[10] = false /\ other_shift_dup_2_temp_4[11] = false /\ other_shift_dup_2_temp_4[12] = false /\ other_shift_dup_2_temp_4[13] = false /\ other_shift_dup_2_temp_4[14] = false /\ other_shift_dup_2_temp_4[15] = false /\ other_shift_dup_2_temp_4[16] = false /\ other_shift_dup_2_temp_4[17] = false /\ other_shift_dup_2_temp_4[18] = false /\ other_shift_dup_2_temp_4[19] = false /\ other_shift_dup_2_temp_4[20] = false /\ other_shift_dup_2_temp_4[21] = false /\ other_shift_dup_2_temp_4[22] = false /\ other_shift_dup_2_temp_4[23] = false /\ other_shift_dup_2_temp_4[24] = false /\ other_shift_dup_2_temp_4[25] = false /\ other_shift_dup_2_temp_4[26] = false /\ other_shift_dup_2_temp_4[27] = false /\ other_shift_dup_2_temp_4[28] = false /\ other_shift_dup_2_temp_4[29] = false /\ other_shift_dup_2_temp_4[30] = false /\ other_shift_dup_2_temp_4[31] = false;

% ( other_shift_dup_2_temp_3 = other_v_dup_3 >> other_shift_dup_2_temp_4 )
constraint shift_right(other_v_dup_3, other_shift_dup_2_temp_4, other_shift_dup_2_temp_3);

% ( other_shift_dup_2_temp_2 = ~ other_shift_dup_2_temp_3 )
constraint forall(i in 0..k-1)( other_shift_dup_2_temp_2[i] = ( not other_shift_dup_2_temp_3[i] ) );

% ( other_shift_dup_2_temp_1 = ! other_shift_dup_2_temp_2 )
constraint negate(other_shift_dup_2_temp_2, other_shift_dup_2_temp_1);

array[0..k-1] of var bool: other_shift_dup_2_temp_5;

constraint other_shift_dup_2_temp_5[0] = true /\ other_shift_dup_2_temp_5[1] = false /\ other_shift_dup_2_temp_5[2] = false /\ other_shift_dup_2_temp_5[3] = false /\ other_shift_dup_2_temp_5[4] = false /\ other_shift_dup_2_temp_5[5] = false /\ other_shift_dup_2_temp_5[6] = false /\ other_shift_dup_2_temp_5[7] = false /\ other_shift_dup_2_temp_5[8] = false /\ other_shift_dup_2_temp_5[9] = false /\ other_shift_dup_2_temp_5[10] = false /\ other_shift_dup_2_temp_5[11] = false /\ other_shift_dup_2_temp_5[12] = false /\ other_shift_dup_2_temp_5[13] = false /\ other_shift_dup_2_temp_5[14] = false /\ other_shift_dup_2_temp_5[15] = false /\ other_shift_dup_2_temp_5[16] = false /\ other_shift_dup_2_temp_5[17] = false /\ other_shift_dup_2_temp_5[18] = false /\ other_shift_dup_2_temp_5[19] = false /\ other_shift_dup_2_temp_5[20] = false /\ other_shift_dup_2_temp_5[21] = false /\ other_shift_dup_2_temp_5[22] = false /\ other_shift_dup_2_temp_5[23] = false /\ other_shift_dup_2_temp_5[24] = false /\ other_shift_dup_2_temp_5[25] = false /\ other_shift_dup_2_temp_5[26] = false /\ other_shift_dup_2_temp_5[27] = false /\ other_shift_dup_2_temp_5[28] = false /\ other_shift_dup_2_temp_5[29] = false /\ other_shift_dup_2_temp_5[30] = false /\ other_shift_dup_2_temp_5[31] = false;

% ( other_shift_dup_2 = other_shift_dup_2_temp_1 << other_shift_dup_2_temp_5 )
constraint shift_left(other_shift_dup_2_temp_1, other_shift_dup_2_temp_5, other_shift_dup_2);

array[0..k-1] of var bool: other_v_dup_4;

% ( other_v_dup_4 = other_v_dup_3 << other_shift_dup_2 )
constraint shift_left(other_v_dup_3, other_shift_dup_2, other_v_dup_4);

array[0..k-1] of var bool: other_r_dup_3;

% ( other_r_dup_3 = other_r_dup_2 | other_shift_dup_2 )
constraint forall(i in 0..k-1)( other_r_dup_3[i] = (other_r_dup_2[i] \/ other_shift_dup_2[i]) );

array[0..k-1] of var bool: other_r_dup_4;

array[0..k-1] of var bool: other_r_dup_4_temp_1;

array[0..k-1] of var bool: other_r_dup_4_temp_2;

constraint other_r_dup_4_temp_2[0] = true /\ other_r_dup_4_temp_2[1] = false /\ other_r_dup_4_temp_2[2] = false /\ other_r_dup_4_temp_2[3] = false /\ other_r_dup_4_temp_2[4] = false /\ other_r_dup_4_temp_2[5] = false /\ other_r_dup_4_temp_2[6] = false /\ other_r_dup_4_temp_2[7] = false /\ other_r_dup_4_temp_2[8] = false /\ other_r_dup_4_temp_2[9] = false /\ other_r_dup_4_temp_2[10] = false /\ other_r_dup_4_temp_2[11] = false /\ other_r_dup_4_temp_2[12] = false /\ other_r_dup_4_temp_2[13] = false /\ other_r_dup_4_temp_2[14] = false /\ other_r_dup_4_temp_2[15] = false /\ other_r_dup_4_temp_2[16] = false /\ other_r_dup_4_temp_2[17] = false /\ other_r_dup_4_temp_2[18] = false /\ other_r_dup_4_temp_2[19] = false /\ other_r_dup_4_temp_2[20] = false /\ other_r_dup_4_temp_2[21] = false /\ other_r_dup_4_temp_2[22] = false /\ other_r_dup_4_temp_2[23] = false /\ other_r_dup_4_temp_2[24] = false /\ other_r_dup_4_temp_2[25] = false /\ other_r_dup_4_temp_2[26] = false /\ other_r_dup_4_temp_2[27] = false /\ other_r_dup_4_temp_2[28] = false /\ other_r_dup_4_temp_2[29] = false /\ other_r_dup_4_temp_2[30] = false /\ other_r_dup_4_temp_2[31] = false;

array[0..k-1] of var bool: other_r_dup_4_temp_3;

array[0..k-1] of var bool: other_r_dup_4_temp_4;

constraint other_r_dup_4_temp_4[0] = true /\ other_r_dup_4_temp_4[1] = true /\ other_r_dup_4_temp_4[2] = true /\ other_r_dup_4_temp_4[3] = true /\ other_r_dup_4_temp_4[4] = true /\ other_r_dup_4_temp_4[5] = false /\ other_r_dup_4_temp_4[6] = false /\ other_r_dup_4_temp_4[7] = false /\ other_r_dup_4_temp_4[8] = false /\ other_r_dup_4_temp_4[9] = false /\ other_r_dup_4_temp_4[10] = false /\ other_r_dup_4_temp_4[11] = false /\ other_r_dup_4_temp_4[12] = false /\ other_r_dup_4_temp_4[13] = false /\ other_r_dup_4_temp_4[14] = false /\ other_r_dup_4_temp_4[15] = false /\ other_r_dup_4_temp_4[16] = false /\ other_r_dup_4_temp_4[17] = false /\ other_r_dup_4_temp_4[18] = false /\ other_r_dup_4_temp_4[19] = false /\ other_r_dup_4_temp_4[20] = false /\ other_r_dup_4_temp_4[21] = false /\ other_r_dup_4_temp_4[22] = false /\ other_r_dup_4_temp_4[23] = false /\ other_r_dup_4_temp_4[24] = false /\ other_r_dup_4_temp_4[25] = false /\ other_r_dup_4_temp_4[26] = false /\ other_r_dup_4_temp_4[27] = false /\ other_r_dup_4_temp_4[28] = false /\ other_r_dup_4_temp_4[29] = false /\ other_r_dup_4_temp_4[30] = false /\ other_r_dup_4_temp_4[31] = false;

% ( other_r_dup_4_temp_3 = other_v_dup_4 >> other_r_dup_4_temp_4 )
constraint shift_right(other_v_dup_4, other_r_dup_4_temp_4, other_r_dup_4_temp_3);

% ( other_r_dup_4_temp_1 = other_r_dup_4_temp_2 & other_r_dup_4_temp_3 )
constraint forall(i in 0..k-1)( other_r_dup_4_temp_1[i] = (other_r_dup_4_temp_2[i] /\ other_r_dup_4_temp_3[i]) );

% ( other_r_dup_4 = other_r_dup_3 ^ other_r_dup_4_temp_1 )
constraint forall(i in 0..k-1)( other_r_dup_4[i] = (other_r_dup_3[i] xor other_r_dup_4_temp_1[i]) );

array[0..k-1] of var bool: otherReturn;

% ( otherReturn = other_r_dup_4 + other_full )
constraint binary_add(other_r_dup_4, other_full, false, otherReturn);

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
