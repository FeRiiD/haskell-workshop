module Main where

main :: IO ()
main = do
  buildMap "." (20*20) [(2,0),(2,1),(2,2),(1,2),(0,1)]

createField :: Int -> String -> Int -> [(Int, Int)] -> String
createField number character rowLength coordinates
  | number `mod` rowLength == 0 && number >= rowLength^2   = if(isInCoordinates coordinates number rowLength) then "o" ++ " │\n" else character ++ " │\n"
  | number `mod` rowLength == 0                            = if(isInCoordinates coordinates number rowLength) then "o" ++ " │\n│" else character ++ " │\n│"
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

nextGeneration :: [(Int,Int)] -> [(Int,Int)]
nextGeneration oldgeneration = do
  let survivors = map (\ cell -> nextCell cell oldgeneration ) oldgeneration
  let babies = getNewBornsOf oldgeneration
  babies ++ survivors

getNewBornsOf oldgeneration = do
  let babyCanditates = nub (concat (map (\ oldCell -> getNeighbourPositions oldCell) oldgeneration))
  filter (\cand -> getNumberOfNeighbours cand oldgeneration == 3) babyCanditates

nub l                   = nub' l []
  where
    nub' [] _           = []
    nub' (x:xs) ls                              
        | x `elem` ls   = nub' xs ls
        | otherwise     = x : nub' xs (x:ls)

nextCell :: (Int,Int) -> [(Int,Int)] -> (Int,Int)
nextCell cell previousCells
  | getNumberOfNeighbours cell previousCells > 3  = (-1,-1) --dead
  | getNumberOfNeighbours cell previousCells < 2  = (-1,-1) --dead
  | otherwise                                     = cell

getNeighbourPositions :: (Int,Int) -> [(Int,Int)]
getNeighbourPositions cell = do
  let y = fst cell
  let x = snd cell
  [(y-1,x),(y-1,x+1),(y-1,x-1),(y+1,x),(y+1,x-1),(y+1,x+1),(y,x+1),(y,x-1)]

getNumberOfNeighbours :: (Int,Int) -> [(Int,Int)] -> Int
getNumberOfNeighbours cell cellGeneration = do
  let neighbourPositions = getNeighbourPositions cell
  let actualNeigbours = filter (\x -> elem x cellGeneration) neighbourPositions
  length actualNeigbours

parseFieldList :: [Int] -> Int -> String -> [(Int,Int)] -> [String]
parseFieldList fieldsList rowSize character coordinates = map(\x -> createField x character rowSize coordinates) fieldsList

playTheGame fieldsList rowSize character coordinates = do
  let parsed = parseFieldList fieldsList rowSize character coordinates
  let final = upperBorder rowSize ++ "│ " ++ unwords parsed ++ lowerBorder rowSize
  putStrLn(final)
  let nextGen = nextGeneration coordinates
  line1 <- getLine
  if (line1 == "x") then putStrLn "Terminated" else playTheGame fieldsList rowSize character nextGen


buildMap character fieldSize coordinates = do
  let fields = [1..fieldSize]
  let rowSize = integerSqrtFrom fieldSize
  -- Play the game!
  playTheGame fields rowSize character coordinates