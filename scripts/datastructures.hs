-- run this program with: stack runghc -- datastructures.hs

main :: IO ()

-- function to retrieve factors
factors n = [x | x <- [1..n], mod n x == 0]

isPrime n = factors n == [1,n]

-- p is the first thing in the list
-- ps is the rest
sieve (p:ps) = p : sieve [x | x <- ps, mod x p /= 0]

primes = sieve [2..]

isTwinPrimes (x,y) = y == x+2

main = do
    print "Declare Array quickly..."
    let quickArray = [1..20]
    print quickArray

    -- Sum of Array
    print (sum quickArray)

    -- Mapping function
    print (map (^2) quickArray)

    -- Filter Function
    print (filter even quickArray)

    -- Combination of all
    print (sum (map (^2) (filter even quickArray)))

    --Now to the infinite lists
    -- the first twenty from the infinite list
    let infiniteList = take 20 [1..]
    print infiniteList
    -- haskell is lazy and evaluates only on demand

    print (factors 7)
    print (factors 15)
    print (isPrime 9)
    print (isPrime 13)

    -- Ancient Greek Algorithm to calculate prime numbers
    let first100primes = take 100 (sieve ([2..])) -- does not work with 1
    print first100primes

    -- Calculate Twin Primes
    let twins = take 100 (filter isTwinPrimes (zip primes (tail primes)))
    print twins
    -- always take a finite amount, or you run 4ever



