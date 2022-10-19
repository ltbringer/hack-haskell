module Basic.FunctorsSpec where

import Test.Hspec
import Basic.Functors (squareList, squareMaybe)

spec :: Spec
spec = do
  describe "Using functors over square function." $ do
    it "should square items in a list." $ do
      squareList [1,2,3,4,5] `shouldBe` [1,4,9,16,25]

    it "should square Just 5 -> Just 25." $ do
      squareMaybe (Just 5) `shouldBe` Just 25

    it "should skip Nothing." $ do
      squareMaybe Nothing `shouldBe` Nothing
