module LC11Spec where

import Test.Hspec
import Lib11
import Data.Vector.Primitive as V

spec :: Spec
spec = do
	describe "Maximum area stored between two pillars." $ do
		let xs = V.fromList [1,8,6,2,5,4,8,3,7]
		it "should return the maximum volume = 49" $ do
			maxArea xs `shouldBe` 49

		let ys = V.fromList [1,1]
		it "should return the maximum volume = 1" $ do
			maxArea ys `shouldBe` 1
