module LC242Spec where

import Test.Hspec
import Lib242


spec :: Spec
spec = do
  describe "Testing if 2 strings are anagrams" $ do
    it "returns True since apple, lappe are anagrams" $ do
      (isAnagram "apple" "lappe") `shouldBe` True

    it "returns False since apple, appe are not anagrams" $
      (isAnagram "apple" "appe") `shouldBe` False

    it "returns True since anagram, nagaram are anagrams" $
      (isAnagram "anagram" "nagaram") `shouldBe` True
