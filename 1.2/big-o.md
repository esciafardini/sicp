# Time Complexity
runtime of an algorithm as the size of inputs increase

## Sum all numbers leading up to n (2 solutions)

```
function f1(n) {
  let total = 0;
  for (let i = 1; i <= n; i++) {
    total += i;
    }
    return total;
  }
```

```
function f2(n) {
  return n * (n + 1) / 2;
  }
```

## Which is better?
What does better mean?

Since time is an unreliable metric across machines (and even within the same machine):
we must use something else.


## Big O Notation
Counts the number of operations the computer has to perform

Concerned with `roughly in proportion with`

This is the `worst case scenario` or `Upper Bound`

2n + 43 == n

The relationship btw an input size to time algorithm takes

## f1 Analysis
Within a for loop, there are n operations

Therefore, as n grows, there are more are n many more operations

This is referred to as `Linear`

O(n)

## f2 Analysis
There are three operations (* + /)

This is the case regardless of the size of n

This is referred to as `Constant`

O(1)

## Counting with Big O
5n + 2 => n

O(2n) => O(n)

O(344) => O(1)

O(13n^2) => O(n^2)

Arithmetic operations are constant

Variable assignment is constant

Accessing elements in an array with an index is constant (javascript)

Loop == Length of loop * complexity inside loop

# Space Complexity
how much additional memory do we need to allocate?

we are talking about auxiliary space complexity here (what happens inside algorithm)

## Inputs
Most primitives are constant space

Reference Types and Strings are O(n) space

## Logarithms

Always log base 2 in Big O

log n is really good for larger inputs

