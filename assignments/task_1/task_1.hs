{-| SUBJECT: infinite lists
For a little warm up, generate a few lists.
-}

-- Create a list with all even numbers.
-- TODO evens = 


-- Calculate the sum of all the natural numbers from 1 to 100.
-- TODO gauss =


-- Calculate the product of all the natural numbers from 1 to 6 (= 6!).
-- TODO sixf =


-- Create a list of all factorials. [1!, 2!, 3!, ...]
-- TODO factorials =


-- We already discussed this function. It takes a number and creates a list of its factors.
factors n = [x | x <- [1..n], mod n x == 0]


-- Create a function that returns the number of factors a given number has.
-- TODO facnr n = 


-- Create a list of all the prime numbers. The two functions above should help you.
-- TODO prime =
