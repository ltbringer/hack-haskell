module BinaryTreeSpec where

import Test.Hspec
import qualified BinaryTree as BT


sampleTree :: BT.BinaryTree Int
sampleTree = BT.makeNode l 1 r
  where
    l = BT.makeNode ll 2 rl
    r = BT.makeNode lr 3 rr
    ll = BT.makeNode lll 4 rll
    rl = BT.makeNode lrl 5 rrl
    lr = BT.makeNode llr 6 rlr
    rr = BT.makeNode lrr 7 rrr
    lll = BT.makeLeaf 8
    rll = BT.makeLeaf 9
    lrl = BT.makeLeaf 10
    rrl = BT.makeLeaf 11
    llr = BT.makeLeaf 12
    rlr = BT.makeLeaf 13
    lrr = BT.makeLeaf 14
    rrr = BT.makeLeaf 15  

spec :: Spec
spec = do
  describe "depth first traversal" $ do
    it "should return [8,4,9,2,10,5,11,1,12,6,13,3,14,7,15]." $ do
      BT.dfTraversal sampleTree `shouldBe` [8,4,9,2,10,5,11,1,12,6,13,3,14,7,15]
