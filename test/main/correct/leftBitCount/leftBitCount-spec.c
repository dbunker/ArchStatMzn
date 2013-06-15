
/*
 * leftBitCount - returns count of number of consective 1's in
 *     left-hand (most significant) end of word.
 *   Examples: leftBitCount(-1) = 32, leftBitCount(0xFFF0F0F0) = 12
 *   Legal ops: ! ~  ^ | + << >>
 *   Max ops: 50
 *   Rating: 4
 */
int leftBitCount(int x) {
  
	/* this checks to see if the first 16 are 1s, if so it adds it to the sum
	   and moves the number over 16 bits determine how many 1s the second part has
	   if not, then nothing is changed. This is repeated for 8,4,2 the last one
	   is computed linearly  */

	int next, sum, firstHalfOnes, firstHalf, firstHalfIsAllOnes, check;
	int negZer, add, all;

	next = x;
	sum = 0;
	negZer = ~0;

	firstHalfOnes = ~(negZer << 16);
	firstHalf = next | firstHalfOnes;
	firstHalfIsAllOnes = !(~firstHalf);
	all = ~firstHalfIsAllOnes + 1;
	add = all&16;
	next = next << add;
	sum = sum + add;

	firstHalfOnes = ~(negZer << 24);
	firstHalf = next | firstHalfOnes;
	firstHalfIsAllOnes = !(~firstHalf);
	all = ~firstHalfIsAllOnes + 1;
	add = all&8;
	next = next << add;
	sum = sum + add;

	firstHalfOnes = ~(negZer << 28);
	firstHalf = next | firstHalfOnes;
	firstHalfIsAllOnes = !(~firstHalf);
	all = ~firstHalfIsAllOnes + 1;
	add = all&4;
	next = next << add;
	sum = sum + add;

	firstHalfOnes = ~(negZer << 30);
	firstHalf = next | firstHalfOnes;
	firstHalfIsAllOnes = !(~firstHalf);
	all = ~firstHalfIsAllOnes + 1;
	add = all&2;
	next = next << add;
	sum = sum + add;

	check = ((next >> 31) & 1);
	sum = sum + ((next >> 30) & check) + check;

	return sum;
}
