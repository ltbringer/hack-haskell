module LC217Spec where

import Test.Hspec
import Lib217

spec :: Spec
spec = do
  describe "Testing duplicates in lists." $ do
    let xs = [1..1000000]
    let ys = take 1000000 $ cycle [1..20]
    it "Returns False when the list contains no duplicates" $ do
      (containsDuplicates xs) `shouldBe` False

    it "Returns True when the list contains no duplicates" $
      (containsDuplicates ys) `shouldBe` True
