module Main where

main :: IO ()
main = do
  buildMap "." (20*20) [(2,0),(2,1),(2,2),(1,2),(0,1)]

createField :: Int -> String -> Int -> [(Int, Int)] -> String
createField number character rowLength coordinates
  | number `mod` rowLength == 0 && number >= rowLength^2   = if(isInCoordinates coordinates number rowLength) then "o" ++ " │\n" else character ++ " │\n"
  | number `mod` rowLength == 0                            = if(isInCoordinates coordinates number rowLength) then "o" ++ " │\n│" else character ++ " │\n|"
  | otherwise                                              = if(isInCoordinates coordinates number rowLength) then "o" else character

integerSqrtFrom :: Int -> Int
integerSqrtFrom x = floor . sqrt $ (fromIntegral x :: Float)

upperBorder :: Int -> String
upperBorder rowSize = "┌" ++ horizontalLines(rowSize*2+1) ++ "┐\n"

lowerBorder :: Int -> String
lowerBorder rowSize = "└" ++ horizontalLines(rowSize*2+1) ++ "┘\n"

horizontalLines :: Int -> String
horizontalLines amount = [x | x <- (unwords (replicate amount "─")), x /= ' ']

index :: (Int,Int) -> Int -> Int
index pos rowSize = fst(pos)*rowSize + snd(pos) + 1

isInCoordinates :: [(Int, Int)] -> Int -> Int -> Bool
isInCoordinates coordinates number rowSize = elem number (map(\ x -> index x rowSize) coordinates)

-- TODO: create new generation
nextGeneration :: [(Int,Int)] -> [(Int,Int)]
nextGeneration oldgeneration = map (\ cell -> nextCell cell oldgeneration ) oldgeneration

nextCell :: (Int,Int) -> [(Int,Int)] -> (Int,Int)
nextCell cell previousCells
  | overpopulation cell previousCells = (1,1)

overpopulation :: (Int,Int) -> [(Int,Int)] -> bool
overpopulation cell oldgeneration = 
-- END

buildMap character fieldSize coordinates = do
  let fields = [1..fieldSize]
  let rowSize = integerSqrtFrom fieldSize
  let parsed = map(\x -> createField x character rowSize coordinates) fields
  let final = upperBorder rowSize ++ "│ " ++ unwords parsed ++ lowerBorder rowSize
  putStrLn(final)