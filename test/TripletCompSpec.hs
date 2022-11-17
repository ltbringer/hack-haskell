module TripletCompSpec where

import Test.Hspec ( describe, it, shouldBe, Spec )
import TripletComp (compareTriplets)


spec :: Spec
spec = do
    let cases = [(([94, 73, 99, 16, 90, 77, 61, 72, 63, 42, 56, 27, 85, 65
                , 46, 45, 58, 70, 84, 75, 94, 38, 20, 92, 13, 56, 39, 40, 28]

                , [67, 57, 83, 11, 30, 10, 66, 78, 78, 16, 58, 93, 72, 44, 3, 5, 66, 79
                , 57, 61, 21, 71, 3, 68, 93, 57, 98, 34, 42])

                , [17, 12])
                -- case 2
                , (([21, 49, 73, 46, 87, 40, 82, 38, 28, 31, 26, 83, 50, 20
                , 61, 24, 69, 15, 15, 79, 25, 69, 80, 89, 48, 68, 90, 67, 55, 41, 93, 58, 27, 86, 18]

                , [20, 77, 2, 7, 74, 32, 93, 8, 78, 77, 94, 96, 99, 31, 32, 2, 71, 64, 62, 14
                , 13, 25, 82, 62, 3, 69, 61, 18, 5, 85, 2, 72, 22, 66, 78])

                , [19, 16])

                -- case 3
                , (([23, 17, 40, 95, 49, 18, 38, 98, 63, 60, 55, 9, 82, 51, 85, 20, 11
                , 27, 99, 14, 82, 15, 88, 70, 17, 49, 53, 52, 11, 38, 92, 54, 53, 10, 43]

                , [60, 6, 17, 91, 61, 18, 87, 98, 75, 16, 68, 59, 62, 94 , 39, 67, 77, 77, 52
                , 73, 30, 73, 5, 54, 47, 40, 3, 86, 23, 19, 22, 55, 87, 9, 56])

                , [15, 18])
                -- case 4
                , (([64, 89, 57, 85, 81, 15, 61, 89, 6, 99, 82, 25, 73, 52, 75, 52, 2, 55]

                , [59, 54, 56, 35, 71, 98, 18, 74, 99, 90, 19, 27, 2, 12, 10, 45, 43, 31])

                , [14, 4])]

    let expected = map snd cases
    let results = map (uncurry compareTriplets . fst) cases

    describe "Given two lists xs and ys, \
    \ if xs[i] > ys[i] then result[0] increases \
    \ but if xs[i] < ys[i] then result[1] increases \
    \ otherwise no change." $ do
        it "matches expected scores for both lists" $ do
            results `shouldBe` expected
