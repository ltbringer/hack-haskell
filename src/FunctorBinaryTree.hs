module FunctorBinaryTree () where

data Tree a = Leaf
    | Node (Tree a) a (Tree a)
    deriving (Show, Eq)

node = Node

singleton :: a -> Tree a
singleton x = Node Leaf x Leaf

instance Functor Tree where
    fmap _ Leaf = Leaf
    fmap f (Node l v r) = Node (fmap f l) (f v) (fmap f r)
