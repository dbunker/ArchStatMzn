
/*  
 * logicalShift - shift x to the right by n, using a logical shift 
 *   Can assume that 1 <= n <= 31 
 *   Examples: logicalShift(0x87654321,4) = 0x08765432 
 *   Legal ops: ~ & ^ | + << >> 
 *   Max ops: 16 
 *   Rating: 3  
 */  
int logicalShift(int x, int n) {  

	int z, y;
	
	z = x >> n;  
	y = 1<<31;  
	y = y >> (n+0x80000000);  
	y = ~y;  

	return z&y;
}
