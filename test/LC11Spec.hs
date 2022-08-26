module LC11Spec where

import Test.Hspec
import Lib11
import Data.Vector.Primitive as V

spec :: Spec
spec = do
	describe "Maximum area stored between two pillars." $ do
		it "should return the maximum volume = 49" $ do
			maxArea (V.fromList [1,8,6,2,5,4,8,3,7]) `shouldBe` 49

		it "should return the maximum volume = 1" $ do
			maxArea (V.fromList [1,1]) `shouldBe` 1

		it "should return the max area = 17" $ do
			maxArea (V.fromList [5,18,17]) `shouldBe` 17

		it "should return the max area = 17" $ do
			maxArea (V.fromList [5,18,17]) `shouldBe` 17

		it "should return the max area = 17" $ do
			maxArea (V.fromList [2,3,4,5,18,17,6]) `shouldBe` 17
