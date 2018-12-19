-- defines data type with two constructors
data Expr = Val Int | Div Expr Expr

-- defines a function that turns an expression into an integer
eval :: Expr -> Int


-- write a evaluation function for both Expr types
-- TODO eval (Val n) =

-- TODO eval (Div x y) =



-- now calculate 6 / 3 with the created function
-- TODO testeval =



-- no side effects you say... but what about this: 42 / 0 ???
-- TODO killme =
