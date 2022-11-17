module MinMaxSum (minMaxSumArr) where

import Data.List (sort)

-- ============================================================================================
-- https://www.hackerrank.com/challenges/mini-max-sum/problem
-- --------------------------------------------------------------------------------------------
-- Given five positive integers, find the minimum and maximum values that can be calculated
-- by summing exactly four of the five integers. Then print the respective minimum and maximum 
-- values as a single line of two space-separated long integers.
-- 
-- Example
-- [1, 3, 5, 7, 9]
-- The minimum sum is 1 + 3 + 5 + 7 = 16 and the maximum sum is 3 + 5 + 7 + 9 = 24 .
-- The function prints:
-- "16 24"

-- **The following code is required to pass the test cases.**

-- miniMaxSum :: (Show a, Num a, Ord a) => [a] -> IO ()
-- miniMaxSum arr = do
--     putStrLn $ show minSum ++ " " ++ show maxSum
--     where
--         (minSum, maxSum) = minMaxSumArr arr
-- ============================================================================================
minMaxSumArr :: (Num a, Ord a) => [a] -> (a, a)
minMaxSumArr arr = 
    (baseArrSum + head sortedArr, baseArrSum + last sortedArr)
    where
        baseArrSum = sum baseArr
        baseArr = drop 1 . take (size - 1) $ sortedArr
        sortedArr = sort arr
        size = length arr
