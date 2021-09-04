module FoldArray where

foldList :: [Int] -> Int -> [Int]
foldList xs 0 = xs
foldList [x] _ = [x]
foldList xs n = foldList (foldList1 xs) (n - 1)

foldList1 :: [Int] -> [Int]
foldList1 [] = []
foldList1 [x] = [x]
foldList1 xs = oddItem ++ take len' folded
  where
    folded = zipWith (+) xs (reverse xs)
    len = length xs
    len' = div len 2
    oddItem = [div (folded !! len') 2 | odd len]

-- 更加简洁
foldLN :: [Int] -> [Int]
foldLN [] = []
foldLN [x] = [x]
foldLN (x:xs) = (x + last xs) : foldLN (init xs)

