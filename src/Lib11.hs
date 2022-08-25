module Lib11 
    ( maxArea
    ) where

import Data.Vector.Primitive as V

data MaxAreaRecord = MaxAreaRecord {
    width :: Int
    , maxSoFar :: Int
    , left :: Int
    , right :: Int
    , l :: Int
    , r :: Int
    , valid :: Bool
} deriving (Show)

---------------------------------------------------------------------------------------
-- 11. Container With Most Water
-- Medium

-- You are given an integer array height of length n. There are n vertical lines
-- drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).
-- Find two lines that together with the x-axis form a container,
-- such that the container contains the most water.
-- Return the maximum amount of water a container can store.
-- Notice that you may not slant the container.

-- Example 1:

-- Input: height = [1,8,6,2,5,4,8,3,7]
-- Output: 49
-- Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7].
-- In this case, the max area of water (blue section) the container can contain is 49.

-- Example 2:

-- Input: height = [1,1]
-- Output: 1

-- Constraints:
-- n == height.length
-- 2 <= n <= 10^5
-- 0 <= height[i] <= 10^4
---------------------------------------------------------------------------------------
maxArea :: V.Vector Int -> Int
maxArea hs = maxAreaUtils hs record
  where
    record = MaxAreaRecord {
        width = V.length hs - 1
        , maxSoFar = 0
        , left = hs V.! 0
        , right = hs V.! (V.length hs - 1)
        , l = 0
        , r = V.length hs - 1
        , valid = True
    }


maxAreaUtils :: V.Vector Int -> MaxAreaRecord -> Int
maxAreaUtils hs record = case (left record < right record, valid record) of
    (_, False) -> maxSoFar record

    (True, True) -> maxAreaUtils hs MaxAreaRecord {
        width = w
        , maxSoFar = area
        , left = hs V.! (l record + 1)
        , right = right record
        , l = l record + 1
        , r = r record
        , valid = l record + 1 < r record
    }

    (False, True) -> maxAreaUtils hs MaxAreaRecord {
        width = w
        , maxSoFar = area
        , left = left record
        , right = hs V.! (r record - 1)
        , l = l record
        , r = r record - 1
        , valid = l record < r record - 1
    } 
  where
    currentArea = (width record * (min (left record) (right record)))
    area = max (maxSoFar record) currentArea
    w = (width record) - 1
