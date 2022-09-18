module BinaryTree (
    BinaryTree,
    makeNode,
    makeLeaf,
    dfTraversal,
    bfTraversal,
) where

data BinaryTree a = Leaf | BinaryTree {
    left:: BinaryTree a,
    value:: a,
    right:: BinaryTree a
} deriving (Show)

-- | Create a leaf node for a binary tree
makeLeaf :: a -> BinaryTree a
makeLeaf x = BinaryTree {
    left = Leaf,
    value = x,
    right = Leaf
}

-- | Create a binary tree node
makeNode :: BinaryTree a -> a -> BinaryTree a -> BinaryTree a
makeNode l v r = BinaryTree {
    left = l,
    value = v,
    right = r
}

-- | Depth first traversal of tree
dfTraversal :: BinaryTree a -> [a]
dfTraversal Leaf = []
dfTraversal (BinaryTree l v r) = dfTraversal l ++ [v] ++ dfTraversal r

-- | Breadth first traversal of tree
bfTraversal :: BinaryTree a -> [a]
bfTraversal Leaf = []
bfTraversal tree = bfTraversal' [tree] [] []
    where
        bfTraversal' [] [] acc = reverse acc
        bfTraversal' [] q acc = bfTraversal' q [] acc
        bfTraversal' (Leaf:ts) q acc = bfTraversal' ts q acc
        bfTraversal' (t:ts) q acc = bfTraversal' ts (right t : left t : q) (value t : acc)
