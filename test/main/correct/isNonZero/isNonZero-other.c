
/*  
 * isNonZero - Check whether x is nonzero using 
 *              the legal operators except ! 
 *   Examples: isNonZero(3) = 1, isNonZero(0) = 0 
 *   Legal ops: ~ & ^ | + << >> 
 *   Max ops: 10 
 *   Rating: 4  
 */  
int isNonZero(int x) {  

	/* 0 is special since negating it returns same number (and thus both have 0 sign bit).
	   Shift sign bits, OR them, and mask against 1 to see if either had a 1 sing bit */

	int n;
	
	n = ~x + 1;
	return ((n >> 31) | (x >> 31)) & 1;
}
