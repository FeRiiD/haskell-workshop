{-
Here you can find some simple examples on:
FILTER, MAP, ZIP and FOLD
-}

hundredIntegers = [1..100]

-- Filter Example
productsOfFive = filter (\ x -> x `mod` 5 == 0) hundredIntegers -- [5,10,15,20,25...]

-- Map Example
increasedInts = map (\ x -> x + 100) hundredIntegers -- [101,102,103,104,105,106...]

-- Zip Example
tuples = zip hundredIntegers [1..1000] -- [(1,1),(2,2),(3,3),(4,4)...]

-- Zipwith Example
noTuplesAnymore = zipWith (+) hundredIntegers [1..1000]  -- [2,4,6,8,10,12,14...]

-- Fold Example (You have to start left or right)
reducedToOne = foldl1 (+) hundredIntegers -- 5050

