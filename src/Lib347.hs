-- Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.
-- Example 1:
-- Input: nums = [1,1,1,2,2,3], k = 2
-- Output: [1,2]
module Lib347 
    ( topK
    ) where

import qualified Data.Map as Map
import qualified Data.Heap as Heap


frequency :: [Int] -> Map.Map Int Int
frequency xs = Map.fromListWith (+) [(x, 1) | x <- xs] 

maxHeap :: Map.Map Int Int -> Heap.MaxPrioHeap Int Int
maxHeap mp = Heap.fromList $ [(v, k) | (k, v) <- Map.toList mp]

topK :: [Int] -> Int -> [Int]
topK xs k = map snd $ Heap.take k $ maxHeap $ frequency xs
