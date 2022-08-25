module Lib11 
    ( maxArea
    ) where

import Data.Vector.Primitive as V

type Width = Int
type Pillar = Int
type Area = Int
type Pillars = V.Vector Pillar
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
maxArea hs = maxAreaUtils hs w maxAreaSoFar left right l r valid
  where
    w = V.length hs - 1
    l = 0
    r = V.length hs - 1
    left = hs V.! l
    right = hs V.! r
    valid = l < r
    maxAreaSoFar = 0


maxAreaUtils :: Pillars -> Width -> Area -> Pillar -> Pillar -> Int -> Int -> Bool -> Area
maxAreaUtils hs width maxAreaSoFar left right l r valid = case (left < right, valid) of
    (_, False) -> maxAreaSoFar
    (True, True) -> maxAreaUtils hs w area (hs V.! (l + 1)) right (l + 1) r (l + 1 < r)
    (False, True) -> maxAreaUtils hs w area left (hs V.! (r - 1)) l (r - 1) (l < r - 1) 
  where
    currentArea = (width * min left right)
    area = max maxAreaSoFar currentArea
    w = width - 1
