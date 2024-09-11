module SmallestMultiple where

findGcd :: Int -> Int -> Int
findGcd a b
  | b == 0 = a
  | a `mod` b == 0 = b
  | otherwise = findGcd b (a `mod` b)

findLcm :: Int -> Int -> Int
findLcm a b = div (a * b) (findGcd a b)

recursionMethod :: [Int] -> Int
recursionMethod [] = 1
recursionMethod [x] = x
recursionMethod (x : xs) = findLcm x (recursionMethod xs)

tailRecursionMethod :: [Int] -> Int
tailRecursionMethod massive =
  let tailRecursionHelper :: [Int] -> Int -> Int
      tailRecursionHelper [] acc = acc
      tailRecursionHelper (x : xs) acc = tailRecursionHelper xs (findLcm x acc)
   in tailRecursionHelper massive 1

generateList :: Int -> Int -> [Int]
generateList from to = [from .. to]

moduleMethod :: Int -> Int -> Int
moduleMethod from to = do
  let list = generateList from to
  foldl findLcm 1 list

infinityListMethod :: Int -> Int
infinityListMethod to =
  let infinityListHelper :: [Int] -> Int -> Int -> Int
      infinityListHelper (x : xs) acc count
        | count == to = acc
        | otherwise = infinityListHelper xs (findLcm x acc) (count + 1)
   in infinityListHelper [1 ..] 1 1
