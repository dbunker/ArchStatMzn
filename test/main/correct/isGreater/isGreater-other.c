
/*  
 * isGreater - if x > y  then return 1, else return 0  
 *   Example: isGreater(4,5) = 0, isGreater(5,4) = 1 
 *   Legal ops: ! ~ & ^ | + << >> 
 *   Max ops: 24 
 *   Rating: 3 
 */  
int isGreater(int x, int y) {  

	int case_1, case_2, sign_x, sign_y, y_minus_x;  

	sign_x = x>>31;
	sign_y = y>>31;

	case_1 = !(sign_x^(sign_y+1));  
	y_minus_x = y+((~x)+1);  
	case_2 = !!((~(sign_x^sign_y)) & (y_minus_x)>>31);  

	return case_1 | case_2;  
}
