
/* 
 * thirdBits - return word with every third bit (starting from the LSB) set to 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 8
 *   Rating: 1
 */
int thirdBits() {
	/* start with 1001001 then move to right and add 1001001, 
	   then move this to the left again add the number created before */

	int x, oldX;
	x = (73 << 9) + 73;
	oldX = x;
	x = (x << 18) + oldX;
	return x;
}
