---
tags: algorithm swift
---

Problem is as specified on [LeetCode - Partition Equal Subset Sum](https://leetcode.com/problems/partition-equal-subset-sum/)

### Requirements

* Array needs to be partitioned into two.
* Both parts should have equal sum.

### Approach

**1. Each partition's sum will be half of total**

Notice that, since we need only two partitions with equal sum, the sum of each part would be half of total sum of array.

So if given array is `A`, and

{% highlight swift %}
sumA = A.reduce(0, +) // sum(A)
{% endhighlight %}

We need two partitions, `P1`, `P2` where

{% highlight swift %}
sumP1 = sumA / 2
sumP2 = sumA / 2
{% endhighlight %}

**2. If total sum of array is odd, no partition is possible**

This derives from pt 1. An odd number can not be divided equally.

**3. The problem now becomes: Is it possible to extract a set of integers from given array whose sum is sumA/2.**

**4. Problem stated in 3. can be solved using DP**

### Code

{% highlight swift %}
class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let totalSum = nums.reduce(0, +)
        if totalSum % 2 == 1 {
            return false
        }
        let sumToFind = totalSum / 2
        var posSums = Set<Int>()
        for i in nums {
            for j in posSums {
                if i+j <= sumToFind {
                    posSums.insert(i+j)    
                }
            }
            if i > sumToFind {
                return false
            }
            posSums.insert(i)
            if posSums.contains(sumToFind) {
                return true
            }
        }
        return false
    }
}
{% endhighlight %}
