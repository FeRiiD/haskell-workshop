module Main where
{-|
  THIS AN IMPLEMENATION OF CONWAY'S GAME OF LIFE
-}

main :: IO ()
main = do
  buildStandardMap [(2,0),(2,1),(2,2),(1,2),(0,1)]

{-|
  Builds map and starts game. Requires a list of coordinates to be executed.
  The coordinates will be the position of the living cells in a 20*20 map.
-}
buildStandardMap = startGame "." (20*20)

{-|
  The 'createField' transforms a number (in this case the index of our fieldList)
  into a character. It needs the coordinates, to decide, if it is a
  dead cell "." or a living cell "o". It also cares about adding borders, if the
  cell is at the edges of the field.
  'number' is the fieldIndex
  'character' is what is printed out as a dead cell
  'rowLength' is the rowLength of the field
  'coordinates' are the positions of living cells in a 2D map
-}
createField :: Int -> String -> Int -> [(Int, Int)] -> String
createField number character rowLength coordinates
  | number `mod` rowLength == 0 && number >= rowLength^2   = cellChar ++ " │\n"
  | number `mod` rowLength == 0                            = cellChar ++ " │\n│"
  | otherwise                                              = cellChar
  where cellChar = getCharacter coordinates number rowLength character
  -- variables declared in 'where' are visible in the whole function
  
getCharacter :: [(Int, Int)] -> Int -> Int -> [Char] -> [Char]
getCharacter coordinates number rowLength character = 
  if(isInCoordinates coordinates number rowLength) then "o" else character

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

{-|
  Function to check, whether 'number' occurs in coordinates.
  You can transform a coordinate (tuple) into a single number using the index function above! 
-}
isInCoordinates :: [(Int, Int)] -> Int -> Int -> Bool
isInCoordinates coordinates number rowSize = --TODO Implement method

nextGeneration :: [(Int,Int)] -> [(Int,Int)]
nextGeneration oldgeneration = babies ++ survivors
  where survivors = map (\ cell -> nextCell cell oldgeneration ) oldgeneration;
		babies = getNewBornsOf oldgeneration

getNewBornsOf :: [(Int,Int)] -> [(Int,Int)]
getNewBornsOf oldgeneration = 
  filter (\cand -> getNumberOfNeighbours cand oldgeneration == 3) babyCanditates
  where babyCanditates = distinct (concat (map (\ oldCell -> getNeighbourPositions oldCell) oldgeneration))

distinct l              = distinct' l []
  where
    distinct' [] _      = []
    distinct' (x:xs) ls                              
        | x `elem` ls   = distinct' xs ls
        | otherwise     = x : distinct' xs (x:ls)

nextCell :: (Int,Int) -> [(Int,Int)] -> (Int,Int)
nextCell cell previousCells
  | neighbourCells > 3  = (-1,-1) --dead
  | neighbourCells < 2  = (-1,-1) --dead
  | otherwise           = cell
  where neighbourCells = getNumberOfNeighbours cell previousCells
  

getNeighbourPositions :: (Int,Int) -> [(Int,Int)]
getNeighbourPositions cell =
  let y = fst cell; x = snd cell
  in [(y-1,x),(y-1,x+1),(y-1,x-1),(y+1,x),(y+1,x-1),(y+1,x+1),(y,x+1),(y,x-1)]

getNumberOfNeighbours :: (Int,Int) -> [(Int,Int)] -> Int
getNumberOfNeighbours cell cellGeneration = length actualNeigbours
  where neighbourPositions = getNeighbourPositions cell;
        actualNeigbours = filter (\x -> elem x cellGeneration) neighbourPositions

parseFieldList :: [Int] -> Int -> String -> [(Int,Int)] -> [String]
parseFieldList fieldsList rowSize character coordinates = 
  map(\x -> createField x character rowSize coordinates) fieldsList

nextRound :: [Int] -> Int -> String -> [(Int, Int)] -> IO ()
nextRound fieldsList rowSize character coordinates = do
  let parsed = parseFieldList fieldsList rowSize character coordinates
  let final = upperBorder rowSize ++ "│ " ++ unwords parsed ++ lowerBorder rowSize
  putStrLn(final)
  let nextGen = nextGeneration coordinates
  line1 <- getLine
  case line1 of 
    "x" -> putStrLn "Terminated";
    _   -> nextRound fieldsList rowSize character nextGen;

startGame :: String -> Int -> [(Int, Int)] -> IO ()
startGame character fieldSize coordinates = do
  let fields = [1..fieldSize]
  let rowSize = integerSqrtFrom fieldSize
  -- Play the game (recursively)!
  nextRound fields rowSize character coordinates