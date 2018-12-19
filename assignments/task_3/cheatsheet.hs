

   -- defines data type with two constructors
   data Expr = Val Int | Sqrt Expr

   -- define a evaluation function for both Expr types
   eval :: Expr -> Int

   -- if it is a value return it
   eval (Val n) = n

   -- if its a squareroot calculate it
   eval (Sqrt n) = floor . sqrt $ (fromIntegral (eval n) :: Float)

   -- calculate √(√(81))
   testeval = eval (Sqrt (Sqrt (Val 81)))

   -- this is a division ;)
   theanswer = div 210 5
   
   
   
   
