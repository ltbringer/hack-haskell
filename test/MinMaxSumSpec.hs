module MinMaxSumSpec where

import Test.Hspec ( describe, it, shouldBe, Spec )
import MinMaxSum (minMaxSumArr)

spec :: Spec
spec = do
    let cases = [([52, 18, 80, 31, 46], (147, 209))
                , ([15, 72, 50, 72, 57], (194, 251))
                , ([34, 52, 56, 22,  4], (112, 164))]
    let results = map (minMaxSumArr . fst) cases
    let expected = map snd cases
    describe "produces the smallest and largest sum from an integer array." $ do
        it "matches expected min max values" $ do
            results `shouldBe` expected
