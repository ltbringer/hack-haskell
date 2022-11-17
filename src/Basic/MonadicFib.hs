module Basic.MonadicFib () where
import Control.Monad.State
import Data.Map.Strict as M

type FibCache a = Map a a
type FibState s a = State (FibCache s) a

getFib :: Integral a => a -> FibState a (Maybe a)
getFib i = gets (M.lookup i)

putFib :: Integral a => a -> a -> FibState a a
putFib i v = do
    mp <- gets (M.insert i v)
    put mp
    return v

fibOf :: Integral a => a -> FibState a a
fibOf n = do
    fibv <- getFib n
    case fibv of
      Nothing -> fib n
      Just v -> return v


fib :: Integral a => a -> FibState a a
fib i | i == 0 || i == 1 = do 
    putFib i i
fib n = do
    n_1 <- fibOf (n - 1)
    n_2 <- fibOf (n - 2)
    putFib n (n_1 + n_2)
