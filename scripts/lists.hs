-- Haskell Script to learn about lists
main :: IO ()

-- how to if
doubleSmallNumber x = if x > 100  then x  else x*2

main = do
    -- You can compare list, if their elements are comparable
    print ([1..10] < [1..5])

    -- You can concatenate lists
    print ([1..10] ++ [1..5])
    print ("I am " ++ ['G','r','o'] ++ ['o','t'])

    print (doubleSmallNumber 5)
    
    -- Let us merge some lists and their elements
    let nouns = ["hobo","frog","pope"]
    let adjectives = ["lazy","grouchy","scheming"]
    let result = [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]
    print result

    -- Get an element out of a list
    print ("Mary Dempsey" !! 5)
    print (take 5 (drop 5 (reverse ('D':"ick Butt"))))

    -- Is element of list
    print (not(4 `elem` [3,4,5,6]))

    -- Really weird list ops:
        -- guess the outcome
    print ([0.1, 0.5 .. 1])
        -- cycle makes the list infinte
    print (take 999 (cycle "LOL "))
        -- repeat element infinitely as list
    print (take 3 (repeat "penis"))
    print (succ('D'))
        -- to make it stop
    print (replicate 3 "sheep dolly")

    -- Creating list using list comprehension
    print ([x*2 | x <- [1..10]])
    -- bascically: define set, then filter with multiple conditions
    print ([ x | x <- [50..100], x `mod` 7 == 3, x > 59])

    -- The zip function
    print (zip [1 .. 5] ["one", "two", "three", "four", "five"])