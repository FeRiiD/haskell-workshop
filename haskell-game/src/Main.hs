module Main where

main :: IO ()
main = do
  buildMap "o" (20*20) [(0,0),(1,1),(2,2),(3,3)]

createField :: Int -> String -> Int -> [(Int, Int)] -> String
createField number character rowLength coordinates
  | number `mod` rowLength == 0 && number >= rowLength^2   = if(isInCoordinates coordinates number rowLength) then "x" ++ " │\n" else character ++ " │\n"
  | number `mod` rowLength == 0                            = if(isInCoordinates coordinates number rowLength) then "x" ++ " │\n|" else character ++ " │\n|"
  | otherwise                                              = if(isInCoordinates coordinates number rowLength) then "x" else character

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

-- TODOfillInCoordinates list coordinates = do

buildMap character fieldSize coordinates = do
  let fields = [1..fieldSize]
  let rowSize = integerSqrtFrom fieldSize
  let parsed = map(\x -> createField x character rowSize coordinates) fields
  let final = upperBorder rowSize ++ "│ " ++ unwords parsed ++ lowerBorder rowSize
  putStrLn(final)