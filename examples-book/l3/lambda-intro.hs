-- v1 - with where
sumSquareOrSquareSumV1 x y = if sumSquare > squareSum
                           then sumSquare
                           else squareSum
    where sumSquare = x ^ 2 + y ^ 2
          squareSum = ( x + y ) ^ 2

-- v2 - extracted function
body sumSquare squareSum = if sumSquare > squareSum
                           then sumSquare
                           else squareSum

sumSquareOrSquareSumV2 x y = body ( x ^ 2 + y ^ 2) (( x + y ) ^ 2 )

-- v3 - use extracted function to create lambda fuction
sumSquareOrSquareSumV3 x y = (\sumSquare squareSum ->
                               if sumSquare > squareSum
                               then sumSquare
                               else squareSum) ( x ^ 2 + y ^ 2) (( x + y ) ^ 2 )
                               
-- Q  - rewrite this fuction using lambdas instead of where:
--      doubleDouble x = dubs * 2
--      where dubs = x * 2
doubleDouble x = (\ dubs -> 2 * dubs ) ( x * 2 )

-- v4 - use let variables
sumSquareOrSquareSumV4 x y = let sumSquare = ( x ^ 2 + y ^ 2)
                                 squareSum = ( x + y ) ^ 2
                             in
                                 if sumSquare > squareSum
                                 then sumSquare
                                 else squareSum
                                 
-- overwrite fuction
overwriteV1 x = let x = 2
                in
                    let x = 3
                    in
                        let x = 4
                        in
                            x
-- the same overwrite function using lambdas
overwriteV2 x = (\x ->
                  (\x ->
                    (\x -> x) 4
                  ) 3
                ) 2
                
                
-- rewritten examples from lection 2 with lambdas


calcCange = (\owed given ->
                         if given - owed > 0
                         then given - owed
                         else 0)

inc = (\n ->
        n + 1)

double = (\n ->
           2 * n)
        
square = (\n ->
           n ^ 2)

func = (\n ->
         if n `mod` 2 == 0
         then n - 2
         else 3 * n + 1)
         

-- Rewrite the following function using a let expression into nested lambdas
counter0 x = let x = x + 1
            in
                let x = x + 1
                    in
                        x
                
counter1 x = (\x -> x + 1)
             ((\x -> x + 1)
              ((\x -> x) x))
