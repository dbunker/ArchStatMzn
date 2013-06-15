
/*
 * isTmin - returns 1 if x is the minimum, two's complement number,
 *     and 0 otherwise 
 *   Legal ops: ! ~ & ^ | +
 *   Max ops: 8
 *   Rating: 1
 */
int isTmin(int x) {
  
	/* 0x80000000 and 0 are the only numbers when + 0xfffffff equal 
	   their bit nagation (~x)^sum is 0 if the bit negation equals the sum, 
	   eq stays 0 if x isnt 0 if it has stayed 0, it is 0x80000000 */

	int allOne, sum, eq, truth;
	allOne = ~0;
	sum = allOne + x;

	eq = (~x) ^ sum;
	eq = eq + !(0 ^ x);
	truth = !eq;

	return truth;
}
