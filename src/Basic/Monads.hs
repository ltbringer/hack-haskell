module Basic.Monads () where
import qualified Data.HashMap as Map

data Grade = F | D | C | B | A deriving (Eq, Ord, Enum, Show, Read)
data Degree = HS | BA | MS | PhD deriving (Eq, Ord, Enum, Show, Read)
data Candidate = Candidate {
  candidateId :: Int,
  codeReview :: Grade,
  cultureFit :: Grade,
  education :: Degree
} deriving Show

isCandidateViable :: Candidate -> Bool
isCandidateViable c = all (== True) tests
  where
    passedCoding = codeReview c > C
    passedCultureFit = cultureFit c > B 
    educationMin = education c >= MS
    tests = [passedCoding, passedCultureFit, educationMin]

readInt :: IO Int
readInt = read <$> getLine

readGrade :: IO Grade
readGrade = read <$> getLine

readDegree :: IO Degree
readDegree = read <$> getLine

readCandidate :: IO Candidate
readCandidate = do
  putStrLn "Enter id:"
  cId <- readInt
  putStrLn "Enter code grade:"
  codeGrade <- readGrade
  putStrLn "Enter culture fit grade:"
  cultureFitGrade <- readGrade
  putStrLn "Enter education:"
  edu <- readDegree
  return (Candidate {
    candidateId = cId
    , codeReview = codeGrade
    , cultureFit = cultureFitGrade
    , education = edu
  })

assessCandidate :: IO String
assessCandidate = do
  candidate <- readCandidate
  return (if isCandidateViable candidate then "pass" else "fail")

c1 :: Candidate
c1 = Candidate { candidateId = 1
                , codeReview = A
                , cultureFit = A
                , education = BA }

c2 :: Candidate
c2 = Candidate { candidateId = 2
                , codeReview = B
                , cultureFit = B
                , education = MS }

c3 :: Candidate
c3 = Candidate { candidateId = 3
                , codeReview = A
                , cultureFit = A
                , education = MS }

candidateDB :: Map.Map Int Candidate
candidateDB = Map.fromList [(1, c1), (2, c2), (3, c3)]

assessMaybeCandidate :: Int -> Maybe String
assessMaybeCandidate cid = do
  c <- Map.lookup cid candidateDB
  return (if isCandidateViable c then "pass" else "fail")

assessCandidates :: [Candidate] -> [String]
assessCandidates candidates = do
  c <- candidates
  return (if isCandidateViable c then "pass" else "fail")

monadicAssessCandidates :: Monad m => m Candidate -> m String
monadicAssessCandidates candidates = do
  c <- candidates
  return (if isCandidateViable c then "pass" else "fail")


powersOf2and3 :: Int -> [(Int, Int)]
powersOf2and3 n = do
  i <- [1..n]
  return (i ^ 2, i ^ 3)

data Cake = Cake {
  cakeId :: Int,
  name :: String,
  expiry :: Int,
  createdAt :: Int
} deriving Show
today = 1661020200000

truffle = Cake { cakeId = 1
         , name = "Truffle"
         , expiry = 432000
         , createdAt = 1660933800000 }

cheesecake = Cake { cakeId = 2
            , name = "Cheesecake"
            , expiry = 259200
            , createdAt = 1660847400000 }

vanilla = Cake { cakeId = 3
          , name = "Vanilla"
          , expiry = 259200
          , createdAt = 1660501800000 }

isExpired :: Cake -> Bool
isExpired cake = createdAt cake - today > expiry cake

cakes :: [Cake]
cakes = [truffle, cheesecake, vanilla]

cakeDB :: Map.Map Int Cake
cakeDB = Map.fromList [(1, truffle), (2, cheesecake), (3, vanilla)]

isExpiredCake :: Int -> Maybe String
isExpiredCake cakeId = do
  cake <- Map.lookup cakeId cakeDB
  return (name cake ++ (if isExpired cake then " has expired." else " is fresh."))

areCakesExpired :: [Cake] -> [String]
areCakesExpired cakes = do
  cake <- cakes
  return (name cake ++ (if isExpired cake then " has expired." else " is fresh."))

printCakeExpiry :: Monad m => m Cake -> m String
printCakeExpiry cakes = do
  cake <- cakes
  return (name cake ++ (if isExpired cake then " has expired." else " is fresh."))
