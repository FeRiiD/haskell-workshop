-- Haskell Script to learn some basic operations
main :: IO ()
main = do
    let nouns = ["hobo","frog","pope"]
    let adjectives = ["lazy","grouchy","scheming"]
    let result = [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]
    putStrLn(result)
