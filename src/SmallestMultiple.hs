module SmallestMultiple (recursionMethod, tailRecursionMethod, moduleMethod, infinityListMethod) where

findGcd :: Int -> Int -> Int
findGcd a b
  | b == 0 = a
  | a `mod` b == 0 = b
  | otherwise = findGcd b (a `mod` b)

findLcm :: Int -> Int -> Int
findLcm a b = div (a * b) (findGcd a b)

recursionMethod :: Int -> Int -> Int
recursionMethod from to =
  let recursionMethodHelper :: [Int] -> Int
      recursionMethodHelper [] = 1
      recursionMethodHelper [x] = x
      recursionMethodHelper (x : xs) = findLcm x (recursionMethodHelper xs)
   in recursionMethodHelper [from .. to]

tailRecursionMethod :: Int -> Int -> Int
tailRecursionMethod from to =
  let tailRecursionHelper :: [Int] -> Int -> Int
      tailRecursionHelper [] acc = acc
      tailRecursionHelper (x : xs) acc = tailRecursionHelper xs (findLcm x acc)
   in tailRecursionHelper [from .. to] 1

generateList :: Int -> Int -> [Int]
generateList from to = [from .. to]

moduleMethod :: Int -> Int -> Int
moduleMethod from to = do
  let list = generateList from to
  foldl findLcm 1 list

infinityListMethod :: Int -> Int -> Int
infinityListMethod from to =
  let infinityListHelper :: [Int] -> Int -> Int -> Int
      infinityListHelper [] _ _ = 1
      infinityListHelper (x : xs) acc count
        | count == to = acc
        | otherwise = infinityListHelper xs (findLcm x acc) (count + 1)
   in infinityListHelper [from ..] 1 1
