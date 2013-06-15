
/*
 * thirdBits - return word with every third bit (starting from the LSB) set to 1 
 *   Legal ops: ! ~ & ^ | + << >> 
 *   Max ops: 8 
 *   Rating: 1 
 */
int thirdBits() {

	int x;

	x = 0x24;  
	x = x+(x<<6);  
	x = x+(x<<12);  
	x = x+(x<<24);  
	return (x<<1)+1;  
}
