module ScanExercises where

fibs = 1 : scanl (+) 1 fibs
fibsN x = fibs !! x

--1
fibs20 = take 20 (1 : scanl (+) 1 fibs20)

--2
fibsLT100 = takeWhile (\x -> x < 100) (1 : scanl (+) 1 fibsLT100)

--3
#???
#factorial = 1 : scanl (*) (length factorial) factorial
