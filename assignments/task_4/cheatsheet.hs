

   -- the constructors stay the same
   data Expr = Val Int | Sqrt Expr

   
   -- define a safe sqrt function
   safesqrt :: Int -> Maybe Int
   safesqrt x = if x < 0 then
                            Nothing
                         else 
                            Just (floor . sqrt $ (fromIntegral x :: Float))
   
   -- the evaluation function maybe returns an integer now
   eval :: Expr -> Maybe Int

   -- if it is a value just return it
   eval (Val n) = Just n

   -- if its a squareroot evaluate first
   eval (Sqrt n) = case eval n of
                      Nothing -> Nothing
                      Just n -> safesqrt n

   -- calculate √(√(81))
   testeval = eval (Sqrt (Sqrt (Val 81)))
   
   -- this is safe now
   killme = eval (Sqrt (Sqrt (Val (-81)))) 
   
   
   
   
