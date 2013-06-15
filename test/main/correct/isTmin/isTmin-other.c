
/* 
 * isTmin - returns 1 if x is the minimum, two's complement number, 
 *     and 0 otherwise  
 *   Legal ops: ! ~ & ^ | + 
 *   Max ops: 8 
 *   Rating: 1 
 */  
int isTmin(int x) {  

	return !(x^(1<<31));  
}
