
/*
 * ezThreeFourths - multiplies by 3/4 rounding toward 0,
 *   Should exactly duplicate effect of C expression (x*3/4),
 *   including overflow behavior.
 *   Examples: ezThreeFourths(11) = 8
 *             ezThreeFourths(-9) = -6
 *             ezThreeFourths(1073741824) = -268435456 (overflow)
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 3
 */
int ezThreeFourths(int x) {
  
	/* first the number is summed 3 times, then it is shifted over 2 to achieve
	   a division by 4 (the sign bit duplicates to the right), however, if the number
	   is negative a round down will result instead of a round toward 0, to counteract this
	   if the number is negative and the digits removed aren't 0, add an offset of 1 */

	int timesThree, div, isNeg, fin, problem;

	timesThree = x+x+x;
	div = timesThree >> 2;

	isNeg  = (timesThree >> 31) & 1;

	problem = ((!(!(timesThree & 3))) & isNeg);
	fin = div + problem;

	return fin;
}
