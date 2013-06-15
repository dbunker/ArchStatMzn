
/*  
 * conditional - same as x ? y : z  
 *   Example: conditional(2,4,5) = 4 
 *   Legal ops: ! ~ & ^ | + << >> 
 *   Max ops: 16 
 *   Rating: 3 
 */  
int conditional(int x, int y, int z) {  

	return (((!x)+0x80000000)&y) + ((~((!x)+0x80000000))&z);  
}
