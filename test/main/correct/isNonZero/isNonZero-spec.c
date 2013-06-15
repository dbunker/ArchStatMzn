
/* 
 * isNonZero - Check whether x is nonzero using
 *              the legal operators except !
 *   Examples: isNonZero(3) = 1, isNonZero(0) = 0
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 10
 *   Rating: 4 
 */
int isNonZero(int x) {

	/* 111...111 + nonZero will evaluate to 0xxx...xxx 
	 unless x has a 1 in the most significant bit (in which case it can't be 0)
	 in either case 1 is returned, 0 is returned otherwise */

	int potOv, tooBig, notZero, final;  
	potOv = (~0) + x;

	tooBig = (x >> 31) & 1;
	notZero = (~ (potOv >> 31)) & 1;
	final = notZero | tooBig;

	return final;
}
