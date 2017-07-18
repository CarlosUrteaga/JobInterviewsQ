# Interviews Questions

The idea is generate a repo  to show my skills. My goal is to have a solution of each question in my favorite language such as C, Python, JAVA, etc.

The organization of the repo is the next

* The readme will shown the problems.
* The solution will be in each language folder. 

---
# Tiles

You are in a field of tiles, *m*. Each tile may or may not have a sign on it.There are 4 possible types of signs:
* "S" is your starting point;* "F" is the finish;* "R" means that you have to turn 90 degrees clockwise;* "L" means that you have to turn 90 degrees counterclockwise.Empty tiles are represented with the character "-".Your starting direction is d.The steps of the game are:1.	Start from the tile with the sign "S", pointing to the direction d;2.	Move forward until you reach a sign or the edge of the field;3.	If you reach a sign, do what it says depending on the sign;4.	If you reach the edge of the field, the game ends.Your task is to return *true* if you have reached the finish sign at the end of the game, or *false* if you have not.##Example	For	m = ["S-R",      "F-R"]and **d** = "R", the output should be**gameOfSigns(m, d) = true.**## Here's how it works:
![Ejemplo](https://github.com/CarlosUrteaga/JobInterviewsQ/blob/master/imgs/Picture1.png?raw=true)
**Input/Output**
* [time limit] 4000ms (py)* [input] array.string mThere will be only 1 "S" sign and 1 "F" sign in a field.It is guaranteed that there won't be an infinite loop trap.Guaranteed constraints:	0 < m.length ≤ 1000,	0 < m[i].length ≤ 1000,	m[i].length = m[j].length.* [input] string dThe direction in which you move at the start of the game. The options for d are the strings "U"(up), "D"(down), "R"(right), or "L"(left).* [output] booleanReturn true if you end up reaching the finish sign at the end of the game, otherwise return false.---

# Fibonacci Words

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
**Given a number n and a bit pattern p, return the number of occurrences of the bit pattern p in F(n).**## ExampleFor n = 6 and p = "10", the output should be fibonacciWord(n, p) = 5.The Fibonacci word for n = 6 is "1011010110110", and the string "10" occurs 5 times in the string "1011010110110".
* Input/Output
	* [time limit] 4000ms (py)	* [input] integer n* Guaranteed constraints:	* 0 ≤ n ≤ 40.* [input] string p	* The bit pattern you are looking for.* Guaranteed constraints:	* 0 < p.length ≤ 105.* [output] integerThe number of occurrences of the bit pattern p in F(n). It is guaranteed that the answer fits in a 32-bit integer.
