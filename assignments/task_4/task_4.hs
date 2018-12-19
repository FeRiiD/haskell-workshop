-- this time we create a save version of the division evaluator

-- the constructors stay the same
data Expr = Val Int | Div Expr Expr

-- create a save divide function
safediv :: Int -> Int -> Maybe Int
-- TODO savedif x y =



-- the evaluation function now maybe returns an integer 
eval :: Expr -> Maybe Int

-- write new evaluation fucntions
-- TODO eval (Val n) =

-- TODO eval (Div x y) =


                                    
-- now calculate 6 / 3 with the created function
testeval = eval (Div (Val 6) (Val 3))

-- this should be safe now
killme = eval (Div (Val 6) (Val 0))
