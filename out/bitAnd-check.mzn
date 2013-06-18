% solver for function bitAnd

include "globals.mzn";
include "commands.mzn";
int: k = 32;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spec assignments

array[0..k-1] of var bool: spec_x;

array[0..k-1] of var bool: spec_y;

array[0..k-1] of var bool: spec_i;

% ( spec_i = spec_x & spec_y )
constraint forall(i in 0..k-1)( spec_i[i] = (spec_x[i] /\ spec_y[i]) );

array[0..k-1] of var bool: specReturn;

constraint forall(i in 0..k-1)( specReturn[i] = spec_i[i] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% other assignments

array[0..k-1] of var bool: other_x;

array[0..k-1] of var bool: other_y;

array[0..k-1] of var bool: other_i;

array[0..k-1] of var bool: other_i_temp_1;

% ( other_i_temp_1 = ~ other_x )
constraint forall(i in 0..k-1)( other_i_temp_1[i] = ( not other_x[i] ) );

% ( other_i = other_i_temp_1 | other_y )
constraint forall(i in 0..k-1)( other_i[i] = (other_i_temp_1[i] \/ other_y[i]) );

array[0..k-1] of var bool: otherReturn;

constraint forall(i in 0..k-1)( otherReturn[i] = other_i[i] );

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
