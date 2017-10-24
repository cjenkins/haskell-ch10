module RewritingFunctionsUsingFold where

myOr :: [Bool] -> Bool
myOr = foldr (||) True

myAny :: (a -> Bool) -> [a] -> Bool
myAny f as = foldr (\a b -> (f a) || b) False as

myElemFold :: Eq a => a -> [a] -> Bool
myElemFold a as = foldr (\x y -> x == a || y) False as
myElemAny :: Eq a => a -> [a] -> Bool
myElemAny a as = any (\x -> x == a) as

myReverse :: [a] -> [a]
myReverse = foldl (\b a -> a : b) []

myMap :: (a -> b) -> [a] -> [b]
myMap f as = foldr (\a b -> (f a) : b) [] as

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f as = foldr (\a b -> if (f a) then a : b else b) [] as

squish :: [[a]] -> [a]
squish = foldr (++) []

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f as = foldr (\a b -> (f a) ++ b) [] as

squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy f as = foldl (\b a -> if (f b a) == GT then b else a) (head as) as

myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy f as = foldl (\b a -> if (f b a) == LT then b else a) (head as) as
