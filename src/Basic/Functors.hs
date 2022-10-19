module Basic.Functors (squareList, squareMaybe) where

import qualified Data.Map as Map

-- square a number 
square :: Num a => a -> a
square x = x * x

-- square elements in a list
squareList :: Num a => [a] -> [a]
squareList xs = square <$> xs

-- handling missing elements in a list
squareMaybe :: Num a => Maybe a -> Maybe a
squareMaybe xs = square <$> xs


data RobotPart = RobotPart
  { name :: String
  , description :: String
  , cost :: Double
  , count :: Int
  } deriving Show

leftArm :: RobotPart
leftArm = RobotPart
  { name = "left arm"
  , description = "left arm for face punching!"
  , cost = 1000.00
  , count = 3
  }

rightArm :: RobotPart
rightArm = RobotPart
  { name = "right arm"
  , description = "right arm for kind hand gestures"
  , cost = 1025.00
  , count = 5
  }

robotHead :: RobotPart
robotHead = RobotPart
  { name = "robot head"
  , description = "this head looks mad"
  , cost = 5092.25
  , count = 2
  }

type Html = String

renderHtml :: RobotPart -> Html
renderHtml part = mconcat [
    "<h1>", partName, "</h1>",
    "<p><h2>desc</h2>", partDesc, "</p>",
    "<p><h2>cost</h2>", partCost, "</p>",
    "<p><h2>count</h2>", partCount, "</p>"
  ]
  where partName = name part
        partDesc = description part
        partCost = show (cost part)
        partCount = show (count part)

partsDB :: Map.Map Int RobotPart
partsDB = Map.fromList $ zip k v
  where k = [1, 2, 3]
        v = [leftArm, rightArm, robotHead]

partVal :: Maybe RobotPart
partVal = Map.lookup 1 partsDB

partHtml :: Maybe Html
partHtml = renderHtml <$> partVal
