
/* 
 * fitsShort - return 1 if x can be represented as a 
 *   16-bit, two's complement integer.
 *   Examples: fitsShort(33000) = 0, fitsShort(-32768) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 8
 *   Rating: 1
 */
int fitsShort(int x) {
  
	/* true (1) is returned if the first half has nothing (clearly 16 bit),
	   or it is negative and has been made sufficiently positive (0xffff0000 is -2^16
	   which is representable, as is 0xffffxxxx for any xs
	   so if firstHalf corresponds to 0x00000000 or 0xffff0000 return true */

	int firstHalf, ans, check;

	check = (~0 << 15);
	firstHalf = (x) & check;
	ans = !(firstHalf) ^ !(firstHalf ^ check);

	return ans;
}
