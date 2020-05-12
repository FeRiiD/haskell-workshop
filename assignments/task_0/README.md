# Playing around and hello world

## Open hello.hs

Do what is described there.

## Open hello_compile.hs

Do what is described there.

## Some play around stuff

Just copy each line separately into your ghci compiler window.

```haskell
-- calculator
1 + 2 * 3

3 / 5 * (7 + 1)

2 ^ 16

1 + 1 == 3

2 + 2 /= 5

21 * 22 <= 20 * 23

1 < 2 && 2 < 3

0 > 0 || 10 >= 10
```

```haskell
-- calling functions

div 7 3  -- integral division (7 divide by 3)

max 3 5

min 6 (10 * 2)  -- not the same as 'min 6 10 * 2'
```

Note how functions are called in haskell vs other languages

```haskell
max 1 2         -- Haskell
```

```c++
std::max(1, 2)  // C++
```

```java
Math.max(1, 2)  // Java
```

Think about argument grouping

```haskell
ghci> div 7 3 + 1
3
ghci> div 7 (3 + 1)
1
ghci> div 7 + 1 3
*** Compilation error!
ghci> div (7 + 1) 3
2
```

Infix and Prefix call syntax:

* Both — operators and functions — can be called in prefix and infix
* Wrap operator in () to call in prefix
* Wrap function in `` (bacticks, ~ on keyboard) to call in infix

```haskell
3 + 4

(+) 3 4

mod 7 3    -- 7 modulo 3

7 `mod` 3
```

Assigning variables

```haskell
-- Before GHC 8.0.1
ghci> let x = 3 + 5
ghci> x + 1
9

-- After GHC 8.0.1
ghci> x = 7 + 8
ghci> x * 2
30
```

String type

```haskell
ghci> greeting = "Hello"
ghci> greeting ++ " world!"  -- use ++ instead of + to concatenate strings
"Hello world!"
ghci> "DONE: say \"" ++ greeting ++ " world!\"" 
"DONE: say "Hello world!""
```

Types are important! Use `:t` command to see type in GHCi

```haskell
ghci> :t 'x'
'x' :: Char
ghci> :t False
False :: Bool
ghci> :t not
not :: Bool -> Bool
ghci> :t (&&)
(&&) :: Bool -> Bool -> Bool
ghci> :t 42
42 :: Num t => t  -- numeric constants are polymorphic;
                  -- we will get to that later
```
