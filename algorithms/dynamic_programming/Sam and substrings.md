## Sam and substrings

#### Example and notes
Given N = "1234" you can have the possible combinations - 1, 2, 3, 4, 12, 23, 34, 123, 234 and 1234. If we scan digits from left to right, f(n) is the function where n is the digit position;

```
f(1) = [1]
```
First digit position, only one possible value/ combination here.

```
f(2) = f(1) + [2, 12]
i.e. = [1] + [2, 12]
```
Second digit allows for all of f(1) plus 2 and 12. Sum of these two values is 14 but this can be refactored. 2 + (10 + 2) - we'll come back to this later.

```
f(3) = f(2) + [3, 23, 123]
```
Third digit allows for all of f(2) plus 3, 23 and 123. Sum of the 3 values excluding f(2) is 3 + 23 + 123 = 149

```
f(4) = f(3) + [4, 34, 234, 1234]
```
Same as f(3), sum of these 4 values is 4 + 34 + 234 + 1234 = 1506.

### Refactoring the numbers
We know f(1) = 1 for N = "1234", for n > 1 we can rewrite the sums as:
```
f(2) = 2 + (10 + 2)
f(3) = 3 + (20 + 3) + (120 + 3)
f(4) = 4 + (30 + 4) + (230 + 4) + (1230 + 4)
```
We can see a recurring pattern here, the digit of f(2) occurs twice, digit of f(3) occurs 3 times and digit of f(4) occurs 4 times and so. Therefore
```
f(n) = ... + n * n_occurences
```
This leaves us with another pattern
```
f(1) = 1
f(2) = 10 + (2 * 2)
f(3) = 140 + (3 * 3)
f(4) = 1490 + (4 * 4)
...
```
Seems like the remaining value can be calculated by
```
f(2) = (f(1) * 10) + (2 * 2)
f(3) = (f(2) * 10) + (3 * 3)
f(4) = (f(3) * 10) + (4 * 4)
```
Which can be summed up as 
```
f(n) = f(n - 1) + (n * n_occurences) where n > 1
```


