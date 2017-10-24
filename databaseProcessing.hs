module DatabaseProcessing where

import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime
            (fromGregorian 1911 5 1)
            (secondsToDiffTime 34123))
  , DbNumber 9001
  , DbString "Hello, world!"
  , DbDate (UTCTime
          (fromGregorian 1921 5 1)
          (secondsToDiffTime 34123))
  ]

filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate dbis = foldr dateFilter [] dbis where
  dateFilter (DbDate time) accum = time : accum
  dateFilter _ accum = accum

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber dbis = foldr numberFilter [] dbis where
  numberFilter (DbNumber i) accum = i : accum
  numberFilter _ accum = accum

mostRecent :: [DatabaseItem] -> Maybe UTCTime
mostRecent dbis = foldr recentDateFilter Nothing dbis where
  recentDateFilter (DbDate time) (Just currentMostRecent) = Just (max time currentMostRecent)
  recentDateFilter (DbDate time) Nothing = Just time
  recentDateFilter _ currentMostRecent = currentMostRecent

sumDb :: [DatabaseItem] -> Integer
sumDb dbis = foldr sumFilter 0 dbis where
  sumFilter (DbNumber i) accum = i + accum
  sumFilter _ accum = accum

avgDb :: [DatabaseItem] -> Double
avgDb dbis = (fromIntegral $ sumDb dbis) / (fromIntegral $ countNumDb dbis) where
  countNumDb databaseItems = foldr countFilter 0 databaseItems where
    countFilter (DbNumber i) accum = accum + 1
    countFilter _ accum = accum
