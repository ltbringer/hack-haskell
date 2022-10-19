module Basic.Monads () where

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
  putStrLn "Enter id:\n"
  cId <- readInt
  putStrLn "Enter code grade:\n"
  codeGrade <- readGrade
  putStrLn "Enter culture fit grade:\n"
  cultureFitGrade <- readGrade
  putStrLn "Enter education:\n"
  edu <- readDegree
  return (Candidate {
    candidateId = cId
    , codeReview = codeGrade
    , cultureFit = cultureFitGrade
    , education = edu
  })
