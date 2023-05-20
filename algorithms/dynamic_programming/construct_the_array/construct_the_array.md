## Construct the array
Specifically, we want to construct an array with n elements such that each element between 1 and k, inclusive. We also want the first and last elements of the array to be 1 and x.

#### Example and notes

Given an array of n = 4, k = 3 and x = 2, we can construct these possibilities

0   |1  |2  |3
--- |---|---|---
1   |2  |1  |2
1   |2  |3  |2
1   |3  |1  |2
1   |3  |2  |2

Given a total of 4 possibilities. For `arr[0]` there can only be 1 value and it's always 1. For `arr[3]` it's always going to be x so again one potential value. `arr[1]` appears to have k - 1 values and `arr[2]` with k possible values.
