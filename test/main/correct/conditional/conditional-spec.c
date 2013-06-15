
/* 
 * conditional - same as x ? y : z 
 *   Example: conditional(2,4,5) = 4
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 16
 *   Rating: 3
 */
int conditional(int x, int y, int z) {
  
	/* n is 1 if the condition is true, 0 if it is false, i then negate this
	   -1 is all 1s, -0 is all 0s, by bit anding y to all, y will only 
	   be returned if all = -1 z is returned otherwise */

	int i, n, all;
  
	n = !(!x);
	all = ~n + 1;
	/* turn 1 to all 1s, and a 0 to all 0s */

	i = (all&y) + ((~all)&z);
	return i;
}
