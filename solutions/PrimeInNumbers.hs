module PrimeInNumbers where

import Data.List
import Control.Monad

divisible :: Integer -> Integer -> Bool
divisible a b = mod a b == 0

factors :: Integer -> [Integer] -> [Integer]
factors n divNs | n == 1 = []
                | otherwise =
                    let xs = dropWhile (\a -> not (n `divisible` a)) divNs
                    in case xs of
                        -- n is prime and divNs does't contain the factor of n
                        [] -> [n]
                        (x:xs') ->
                            let factor = div n x
                                max_sqrt = integerSqrt factor
                                -- narrow the factor range
                                ys = takeWhile (<= max_sqrt) (x:xs')
                            in case ys of
                                [] -> [x, factor]
                                (y:ys') -> x:factors factor (y:ys')

integerSqrt :: Integer -> Integer
integerSqrt = round . sqrt . fromInteger

primeFactors :: Integer -> String
primeFactors n = join (map addBrace (group (factors n [2..max_factor])))
  where
    addBrace :: [Integer] -> String
    addBrace [] = "()"
    addBrace [x] = "(" ++ show x ++ ")"
    addBrace (x:xs) = "(" ++ show x ++ "**" ++ show (length xs + 1) ++ ")"
    max_factor = integerSqrt n


