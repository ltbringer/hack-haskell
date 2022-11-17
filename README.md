# hack-haskell
[![Haskell CI](https://github.com/ltbringer/leetcode-haskell/actions/workflows/haskell.yml/badge.svg?branch=main)](https://github.com/ltbringer/leetcode-haskell/actions/workflows/haskell.yml)

## Introduction

Testing my proficiency in Haskell using problems from ~~leetcode.com~~ [hackerrank.com](https://www.hackerrank.com/). The plan is to deliberately practice

- Immutable data structures
- Recursion, tail whenever possible
- Thinking about solutions apart from the usual imperative approach

# Problems

The first 3 problems were from leetcode.com, but since then I have moved on to hackerrank for Haskell.

| # | Problem                           | Solution                              | Tests                             |
|---|-----------------------------------|---------------------------------------|-----------------------------------|
| 1 | [Contains Duplicate][1]           | [:green_book:](./src/Lib217.hs)       | [Test](./test/LC217Spec.hs)       |
| 2 | [Valid Anagrams][2]               | [:green_book:](./src/Lib242.hs)       | [Test](./test/LC242Spec.hs)       |
| 3 | [Container With Most Water][3]    | [:orange_book:](./src/Lib11.hs)       | [Test](./test/LC11Spec.hs)        |
| 4 | [Min Max Sum][4]                  | [:green_book:](./src/MinMaxSum.hs)    | [Test](./test/MinMaxSumSpec.hs)   |
| 5 | [Compare the triplets][5]         | [:green_book:](./src/TripletComp.hs)  | [Test](./test/TripletCompSpec.hs)   |

[1]: https://leetcode.com/problems/contains-duplicate/
[2]: https://leetcode.com/problems/valid-anagram/
[3]: https://leetcode.com/problems/container-with-most-water/
[4]: https://www.hackerrank.com/challenges/mini-max-sum/problem
[5]: https://www.hackerrank.com/challenges/compare-the-triplets