
/* 
 * logicalShift - shift x to the right by n, using a logical shift
 *   Can assume that 1 <= n <= 31
 *   Examples: logicalShift(0x87654321,4) = 0x08765432
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 16
 *   Rating: 3 
 */
int logicalShift(int x, int n) {

	/* first we get the initial shift, then we create a number consisting 
	   of n ones at the least significant end, we bit and this to the 
	   shift to remove unwanted 1s */

	int badShift, negN, check, i;
	badShift = x >> n;
  
	negN = ~n + 1;

	/* i.e. 00111111111 */
	check = (~0) << (32+negN);
	check = ~check;

	i = badShift & check; 
	return i;
}
