
include "globals.mzn"; 

% neg = !toNeg
predicate negate(	array[int] of var bool: toNeg,
					array[int] of var bool: neg) =
	
	let { 	int:k = length(toNeg) 	} in
	
	forall(i in 1..k-1)( neg[i] = false ) /\
	
	neg[0] = not exists(toNeg);

% shifted = toShift >> shifted
predicate shift_right(	array[int] of var bool: toShift,
						array[int] of var bool: len,
						array[int] of var bool: shifted) =
	
	% convert to int
	let { 	var 0..k-1: lenInt = sum(j in 0..ceil(log2(int2float(k))))( bool2int(len[j]) * pow(2,j) ),
			int:k = length(toShift) 	} in
	
	% will be left shift in our representation
	% right shift takes leftmost bit and continues it right
	% (left most bit continued left)
	
	forall(i in 0..k-1) (
		shifted[i] = (
			((i+lenInt <= k-1) /\ toShift[i+lenInt]) \/
			((i+lenInt >  k-1) /\ toShift[k-1] )
		)
	);

% shifted = toShift << shifted
predicate shift_left(	array[int] of var bool: toShift,
						array[int] of var bool: len,
						array[int] of var bool: shifted) =
	
	% convert to int
	let { 	var 0..k-1: lenInt = sum(j in 0..ceil(log2(int2float(k))))( bool2int(len[j]) * pow(2,j) ),
			int:k = length(toShift) 	} in
	
	% will be right shift in our representation
	% left shift turns left bits 0
	% (right most bits turn 0)
	
	forall(i in 0..k-1) (
		shifted[i] = (
			((i-lenInt >= 0) /\ toShift[i-lenInt])
		)
	);

% add two binary numbers x, and y and carry in bit ci to get binary s
predicate binary_add(	array[int] of var bool: x,
						array[int] of var bool: y,
						var bool: ci,
						array[int] of var bool: s) =
						
	let { 	int:l = length(x),
			int:n = length(s), } in
			
	assert(l == length(y),
		"length of binary_add input args must be same",
		
	assert(n == l \/ n == l+1, "length of binary_add output " ++
		"must be equal or one more than inputs",
	
	let { array[0..l] of var bool: c } in
	full_adder(x[0], y[0], ci, s[0], c[0]) /\
	forall(i in 1..l)(full_adder(x[i], y[i], c[i-1], s[i], c[i])) /\
	if n > l then s[n] = c[l] else c[l] == false endif ));

predicate full_adder(	var bool: x, var bool: y, var bool: ci,
						var bool: s, var bool: co) =
						
	let { var bool: xy = x xor y } in
	s = (xy xor ci) /\ co = ((x /\ y) \/ (ci /\ xy));
	