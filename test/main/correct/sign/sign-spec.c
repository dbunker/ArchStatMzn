
/* 
 * sign - return 1 if positive, 0 if zero, and -1 if negative
 *  Examples: sign(130) = 1
 *            sign(-23) = -1
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 10
 *  Rating: 2
 */
int sign(int x) {

	/* addNeg becomes -1 if x is negative (converts most significant 1 to all ones), 
	   addPos becomes 1 if x is not negative and not 0, the result is returned
	*/

	int neg, addNeg, addPos, sum;

	neg = (x >> 31) & 1;
	addNeg = ~neg + 1;

	addPos = (!neg) & !(!x);
	sum = addNeg + addPos;
	return sum;
}
