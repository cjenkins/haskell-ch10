module WarmupAndReview where

stops = "pbtdkg"
vowels = "aeiou"

makeTuples :: [Char] -> [Char] -> [(Char, Char, Char)]
makeTuples stops vowels = [(s1, v, s2) | s1 <- stops, v <- vowels, s2 <- stops]

makeTuplesP :: [Char] -> [Char] -> [(Char, Char, Char)]
makeTuplesP stops vowels = [(s1, v, s2) | s1 <- stops, v <- vowels, s2 <- stops, s1 == 'p']

makeWordTuples :: [String] -> [String] -> [(String, String, String)]
makeWordTuples nouns verbs = [(n1, v, n2) | n1 <- nouns, v <- verbs, n2 <- nouns]

--2
--Average length of words in a string
seekritFunc :: String -> Int
seekritFunc x = div (sum (map length (words x)))
                (length (words x))

seekritFuncPrecise :: String -> Double
seekritFuncPrecise x = (fromIntegral (sum (map length (words x)))) /
                       (fromIntegral (length (words x)))
