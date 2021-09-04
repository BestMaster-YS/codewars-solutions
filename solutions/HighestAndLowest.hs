module HighestAndLowest where

import Data.List

highAndLow :: String -> String
highAndLow input = show imax ++ " " ++ show imin
  where
    arr :: [Int]
    arr = map read (filter (/= " ") (groupBy (\a b -> a /= ' ' && b /= ' ') input))
    imax = foldr1 max arr
    imin = foldr1 min arr


