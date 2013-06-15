
/*  
 * fitsShort - return 1 if x can be represented as a  
 *   16-bit, two's complement integer. 
 *   Examples: fitsShort(33000) = 0, fitsShort(-32768) = 1 
 *   Legal ops: ! ~ & ^ | + << >> 
 *   Max ops: 8 
 *   Rating: 1 
 */  
int fitsShort(int x) {  
	
	int y;
	
	y = x>>15;  
	return !(y^0) + !(y^(~0));  
}
