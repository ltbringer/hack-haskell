import Test.Tasty
import Test.Tasty.HUnit

import Lib217

main :: IO ()
main = do
  defaultMain (testGroup "Our Library Tests" [duplicates])

duplicates :: TestTree
duplicates = testCase "Testing combat" $ do
  let xs = [1..1000000]
  let ys = take 1000000 $ cycle [1..20]
  (assertEqual "Doesn't contain duplicates" (containsDuplicates xs) False)
  (assertEqual "Contains duplicate at position 3 and 4" (containsDuplicates ys) True)
