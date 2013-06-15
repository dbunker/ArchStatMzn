
/* 
 * leftBitCount - returns count of number of consective 1's in 
 *     left-hand (most significant) end of word. 
 *   Examples: leftBitCount(-1) = 32, leftBitCount(0xFFF0F0F0) = 12 
 *   Legal ops: ! ~ & ^ | + << >> 
 *   Max ops: 50 
 *   Rating: 4 
 */
int leftBitCount(int x) {

	int v, r, shift, full;
	
	/* this algorithm divides and conquers, but specifically for */
	v = x;
	
	/* store our result in r */
	
	/* we must add one if we have 0xffffffff */
	full = !(~x);

	/* Check the top 16 bits and add them to our result if they exist */
	r = !(~(v>>16)) << 4;
	v = v << r;
	
	/* check the remaining 8 bits */
	shift = !(~(v >> 24)) << 3;
	v = v << shift;
	r = r | shift;
	
	/* remaining 4 bits */
	shift = !(~(v>>28)) << 2;
	v = v << shift;
	r = r | shift;
	
	/* remaining 2 bits */
	shift = !(~(v >> 30)) << 1;
	v = v << shift;
	r = r | shift;
	
	/* remaining 1 bits */
	r = r ^ 1&((v>>31));

	/* rememer to add one if we have 32 on bits */
	return r + full;
}
