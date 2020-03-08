#  A question was posed...

What is the best way to find the k closest points to the origin out of a list of n points?

The Obvious Solution
=======
input.sorted()[0..<k]

How fast should it be?
---
O(N Log(N))


How fast is it really?
----
Run the test sort program.
It times the sort and then divides the time by n*Log(n) the result is roughly constant 


The *Right* Solution
====
1) take the first k items.
2) find the highest.
3) check the remaining items against the highest.
4) if it's higher drop the highest, find the new highest, repeat.

How fast should it be?
----
O(N)
Each item gets checked once.  Score!

How Fast is it really?
----
O(NK)


What's the difference?
---
if K is small it's lost in the noise.

What's small?
---
Somewhere in the neighborhood of Log(n)

What happens when K is of the same order as N?
-----
Bad things, or well slow things,  O(N^2) things.
