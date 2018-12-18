{-| SUBJECT: Maybe
Let's see how we can force others to deal with our problems!
"I give it to you. Maybe..."
-}

{-| PREPARATIONS
Rememeber our car list from task 2? 
We gonna work with 'cars' again.
OH SNAP! Someone realized, that you cannot drive bananas!
Now we maybe have no car in the list.
Check 'maybeCars' in your ghci terminal. Now there is either
* Just Car
* Nothing
-}
data Car = Car {brand :: String, year :: Int} deriving (Show)

brands = take 100 (cycle ["Renault", "Mercedes", "Volvo", "Banana", "Robin Hood"])

years = [1950..2050]

maybeCars = map (\ tuple -> 
    if (fst tuple == "Banana") then
        Nothing
    else
        Just Car {brand = fst tuple, year = snd tuple}
    ) (zip brands years)


{-
Alright... Let's try to apply some functions to this!

Try to retrieve the sum of the years of 'maybeCars'
Ok, ok. I'll do it for you...
-}
-- TODO sumOfYears
sumOfYears = foldl (\ acc maybeCar -> 
    case maybeCar of
        Nothing -> acc
        Just car -> year car + acc
    ) 0 maybeCars

{-
Now try to transform make every car in maybeCars a 'Volvo' again
with the map function.
-}
-- TODO map