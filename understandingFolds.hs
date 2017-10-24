module UnderstandingFolds where

--1 c since * associative
--2 1 * 1, 1 * 2, 2 * 3 = 6
--3 a
--4 c
--5 a
fiveA = foldr (++) "" ["woot", "WOOT", "woot"]
fiveB = foldr max [] ["fear is the little death"]
fiveC = foldr (\x y -> and [x, y]) True [False, True]
fiveD = foldr (||) False [False, True]
fiveE = foldl (flip ((++) . show)) "" [1..5]
fiveF = foldr (flip const) 'a' [1..5]
fiveG = foldr (flip const) 0 "tacos"
fiveH = foldl const 0 "burritos"
fiveI = foldl const 'z' [1..5]
