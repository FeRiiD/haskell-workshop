-- increment if even
ifEvenInc0 n = if even n
               then n + 1
               else n

ifEvenDouble0 n = if even n
                  then n * 2
                  else n
                  
-- now use a function as an argument
ifEven func n = if even n
                then func n
                else n
                
-- this can now be used to pass the icrement function
inc n = n + 1
ifEvenInc1 n = ifEven inc n

-- or even passing an anonymous function
ifEvenDouble1 n = ifEven (\n -> n * 2) n
