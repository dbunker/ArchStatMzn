
/* 
 * ezThreeFourths - multiplies by 3/4 rounding toward 0, 
 *   Should exactly duplicate effect of C expression (x*3/4), 
 *   including overflow behavior. 
 *   Examples: ezThreeFourths(11) = 8 
 *             ezThreeFourths(-9) = -6 
 *             ezThreeFourths(1073741824) = -268435456 (overflow) 
 *   Legal ops: ! ~ & ^ | + << >> 
 *   Max ops: 12 
 *   Rating: 3 
 */  
int ezThreeFourths(int x) {  

	int z, sign_z;

	z = x+x+x;  
	sign_z = z>>31;
	
	return ((z>>2)&(~sign_z)) + (((z>>2)+1)&sign_z);
}

