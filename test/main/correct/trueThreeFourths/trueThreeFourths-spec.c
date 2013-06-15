
/*
 * trueThreeFourths - multiplies by 3/4 rounding toward 0,
 *   avoiding errors due to overflow
 *   Examples: trueThreeFourths(11) = 8
 *             trueThreeFourths(-9) = -6
 *             trueThreeFourths(1073741824) = 805306368 (no overflow)
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 4
 */
int trueThreeFourths(int x)
{
	/* this works by first taking the absolute value of x, it then divides this by 4 by 
	   shifting 2 bits, this is then added together 3 times (first). This would be 3/4, 
	   except for the 2 bits we lost when we divided by 4, so we take these lost 
	   bits, sum them 3 times, divide them by 4 (second). 
	   we sum first and second and negate this (if it was originally negative) 
	   to get our result
	*/

	int isNeg, all, absX, div, mayNeg;
	int lost, check, first, timesLost, second, fin;

	isNeg = ((x >> 31) & 1);
	all = (~isNeg) + 1;
	absX = (x^all) + isNeg;
	/* absolute value */

	check = ~(3 << 30);
	div = (absX >> 2) & check;

	first = div+div+div;

	lost = absX & 3;
	timesLost = lost+lost+lost;
	second = (timesLost >> 2) & check;

	fin = first + second;
	mayNeg = (fin^all) + isNeg;
	/* undo absolute value if necessary */

	return mayNeg;       
}
