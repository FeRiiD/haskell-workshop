{-| SUBJECT: Higher Order Functions
Fancy term right? The definition is simple though...
Higher Order Functions are functions, which take 
functions as parameter or return functions.

Let us practice  some list operations using lambda calculus.

MAP     - transforms each element in a list
FOLD    - reduce all elements of a list to one value
FILTER  - filter elements from a list, given a boolean condition
ZIP     - combine elements of two lists to tuples in one list
ZIPWITH - like ZIP but you provide a function to combine the elements

These functions take a certain function and certain objects like lists.
Also, there is a cheatsheet with examples!
-}

----------------------------------------------------------------------------------

{-| PREPARATIONS
Don't worry about this! 
Just some code to generate a list of cars into 'cars'.
We will work with 'cars' in the assignments.
You can print it out, if you type 'cars' in your ghci terminal
-}
data Car = Car {brand :: String, year :: Int} deriving (Show)
brands = take 100 (cycle ["Renault", "Mercedes", "Volvo", "Banana", "Robin Hood"])
years = [1950..2050]
cars = map (\ tuple -> Car {brand = fst tuple, year = snd tuple}) (zip brands years)

----------------------------------------------------------------------------------

{-| ASSIGNMENTS
Let's get to know our cars!
To inspect your solution simply write the variable name into the GHCI.

Here are some hints for the assignments:
-}
exampleCar = Car {brand = "example", year = 1234}

exampleBrand = brand exampleCar -- how to get the car brand

----------------------------------------------------------------------------------

{-| Task 1 FILTER
Sweden for the win!
Put all Volvos in a variable 'volvos'!
--
Back to the future!
Put all cars with a year above 2018 into 'futureCars'
--
Get me some real oldtimers!
Put all Mercedes older than 1980 into 'oldMercedes'
-}
-- TODO volvos
volvos = filter (\ car -> brand car == "Volvo") cars
-- TODO futureCars

-- TODO oldMercedes


{-| Task 2 MAP
I am only interested in years.
Transform all cars into their years in 'buildYears'!
--
Bananas are great, right?
Change all cars to have the brand "Banana", put them into 'bananaCars'
-}
-- TODO buildYears

-- TODO bananaCars


{-| Task 3 FOLDL
Wooahh, that's much!
Get the sum of all years of the cars into 'sumYears'
This sounds stupid... , but...
Concatenate all brands together into 'gibberish'
-}
-- TODO sumYears

-- TODO gibberish


{-| Task 4 ZIP
Forget the cars for a moment...
With 'zip' build sentences out of these into 'tuples'!
Check if it worked. Then ask yourself if you are gay.
-}
names = ["Jan", "Marco", "Haskell", "A certain Hedgehog"]
adjectives = ["is the best... obviously",
     "is absolutely gorgeous",
     "is very nice",
     "runs very fast "]
-- TODO tuples


{-| Task 5 ZIPWITH
Now, I'm really flattered... Did you notice, you produced tuples?
Give me some nice sentences!
Use 'zipwith' and merge the strings of both lists with this '(++)' into single strings!
Choose a variable name to control the solution.
-}
-- TODO name


{-| Task 5 COMBINE THEM!
Let's apply what we learned and combine these functions!
Find the year of the oldest Renault.
Compute the sum of the years of the Bananas, 
then add it to the years of the cars in the list and
store the result list in a variable.
-}
-- TODO yearOfOldestRenault

-- TODO cars2