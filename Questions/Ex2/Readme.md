#Exercice

The Fibonacci word sequence of bit strings is defined as:F(0) = "0"F(1) = "1"F(n) = F(n − 1) + F(n − 2) if n >= 2Where + is the string concatenation operation.The first few elements are:
n         | p|
------------------|-----------------------|
0|0|
1|1|
2|10
3|101
4|10110
5|10110101
6|1011010110110
**Given a number n and a bit pattern p, return the number of occurrences of the bit pattern p in F(n).**##ExampleFor n = 6 and p = "10", the output should be fibonacciWord(n, p) = 5.The Fibonacci word for n = 6 is "1011010110110", and the string "10" occurs 5 times in the string "1011010110110".
* Input/Output
	* [time limit] 4000ms (py)	* [input] integer n* Guaranteed constraints:	* 0 ≤ n ≤ 40.* [input] string p	* The bit pattern you are looking for.* Guaranteed constraints:	* 0 < p.length ≤ 105.* [output] integerThe number of occurrences of the bit pattern p in F(n). It is guaranteed that the answer fits in a 32-bit integer.