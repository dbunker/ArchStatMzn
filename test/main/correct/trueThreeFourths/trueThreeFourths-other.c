
/* 
 * trueThreeFourths - multiplies by 3/4 rounding toward 0, 
 *   avoiding errors due to overflow 
 *   Examples: trueThreeFourths(11) = 8 
 *             trueThreeFourths(-9) = -6 
 *             trueThreeFourths(1073741824) = 805306368 (no overflow) 
 *   Legal ops: ! ~ & ^ | + << >> 
 *   Max ops: 20 
 *   Rating: 4 
 */  
int trueThreeFourths(int x) {
	
	int a, b;
	int a_z, a_sign_z, a_res, b_z, b_sign_z, b_res;
	
	a = x >> 16;
	
	a_z = a+a+a;  
	a_sign_z = a_z>>31;
	a_res = ((a_z>>2)&(~a_sign_z)) + (((a_z>>2)+1)&a_sign_z);
	
	a_res = a_res << 16;
	
	b = x & 0xFFFF;

	b_z = b+b+b;  
	b_sign_z = b_z>>31;
	b_res = ((b_z>>2)&(~b_sign_z)) + (((b_z>>2)+1)&b_sign_z);

	return a_res + b_res;	
}

