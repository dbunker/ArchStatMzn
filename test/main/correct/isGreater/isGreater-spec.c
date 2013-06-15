
/* 
 * isGreater - if x > y  then return 1, else return 0 
 *   Example: isGreater(4,5) = 0, isGreater(5,4) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 3
 */
int isGreater(int x, int y) {

	/* we will only encounter problems with subtraction if x and y have opposite 
	   signs, we will end up summing 2 positives or 2 negatives to get y-x, but 
	   if the signs are opposite the positive number is bigger, otherwise 
	   we can use the sign of y + (-x) */

	int xisNeg, yisNeg, areOpposite, xLargeOp, negX, sum, sumisNeg, xLargeSum, i;

	xisNeg = (x >> 31) & 1;
	yisNeg = (y >> 31) & 1;
	areOpposite = xisNeg ^ yisNeg;
	xLargeOp = yisNeg;
	
	/* return 1 if x is+, y is-
	   return 0 if x is-, y is+
	   yisNeg fits these requirements */

	negX = ~x + 1;
	sum = y + negX;
	sumisNeg = (sum >> 31) & 1;
	xLargeSum = sumisNeg;
	
	/* return 1 is sum is- (this indicates the strong 
	   negative of the x overwhelmed the y */
	   
	/* this runs the conditional: output = areOpposite ? xLargeOp : xLargeSum */
	i = (areOpposite&xLargeOp) + ((!areOpposite)&xLargeSum);
	return i;
}
