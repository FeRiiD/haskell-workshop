-- import sorting function
import Data.List


-- example data
names = [("Ian", "Cur"),
         ("Ben", "Sum"),
         ("Pet", "Hoo"),
         ("Ste", "Mor"),
         ("Ann", "Hoo")]
                

-- sort function sorts by first name by default, but still cool ;)
sort0 = sort names

-- compare function to sort by last name
cmpLastNames0 n0 n1 = if l0 > l1
                      then GT
                      else if l0 < l1
                           then LT
                           else EQ
    where l0 = snd n0
          l1 = snd n1
          
sort1 = sortBy cmpLastNames0 names

-- extend compare function to sort by first name 
cmpLastNames1 n0 n1 = if l0 > l1
                      then GT
                      else if l0 < l1
                           then LT
                           else if f0 > f1
                                then GT
                                else if f0 < f1
                                     then LT
                                     else EQ
    where f0 = fst n0
          f1 = fst n1
          l0 = snd n0
          l1 = snd n1
          
sort2 = sortBy cmpLastNames1 names
