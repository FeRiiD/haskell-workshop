-- Q2.1
-- An if statement without else makes no sense as this would create side effects.

-- Q2.2
inc n = n + 1
double n = 2 * n
square n = n ^ 2

-- Q2.3
-- write following function in haskell
-- func(n) {
--   if (n % 2 == 0) {
--     return n - 2;
--   } else {
--     return 3 * n + 1;
--   }
-- }
func n = if n `mod` 2 == 0
         then n - 2
         else 3 * n + 1
         

