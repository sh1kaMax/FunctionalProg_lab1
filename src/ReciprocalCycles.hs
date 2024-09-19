module ReciprocalCycles (recursionMethod, tailRecursionMethod, moduleMethod, mapMethod) where

import Data.List (elemIndex, maximumBy)
import Data.Maybe (fromMaybe)
import Data.Ord (comparing)

findCycle :: Int -> Int
findCycle inNumber =
  let findCycleHelper :: [Int] -> Int -> Int -> Int
      findCycleHelper massive number divider
        | remainder == 0 = 0
        | remainder `elem` massive = length massive - fromMaybe (-1) foundIndex
        | otherwise = findCycleHelper (massive ++ [remainder]) nextNumber divider
        where
          remainder = number `mod` divider
          foundIndex = elemIndex remainder massive
          nextNumber = remainder * 10
   in findCycleHelper [] 1 inNumber

recursionMethod :: Int
recursionMethod =
  let recursionMethodHelper :: Int -> (Int, Int)
      recursionMethodHelper 1000 = (findCycle 1000, 1000)
      recursionMethodHelper number =
        let nowRes = (findCycle number, number)
            nextRes = recursionMethodHelper (number + 1)
         in if fst nowRes > fst nextRes then nowRes else nextRes
   in snd (recursionMethodHelper 2)

tailRecursionMethod :: Int
tailRecursionMethod =
  let tailRecursionMethodHelper :: Int -> (Int, Int) -> Int
      tailRecursionMethodHelper number (maxLen, maxNumber)
        | maxLen > number = maxNumber
        | findCycle number > maxLen = tailRecursionMethodHelper (number - 1) (findCycle number, number)
        | otherwise = tailRecursionMethodHelper (number - 1) (maxLen, maxNumber)
   in tailRecursionMethodHelper 1000 (0, 0)

generateList :: Int -> Int -> [Int]
generateList from to = [from .. to]

filterMaxCycle :: [Int] -> Int
filterMaxCycle =
  snd
    . foldl
      ( \(maxLen, maxNumber) number ->
          let findLen = findCycle number
           in if findLen > maxLen then (findLen, number) else (maxLen, maxNumber)
      )
      (0, 0)

moduleMethod :: Int -> Int -> Int
moduleMethod from to = filterMaxCycle (generateList from to)

findCycleReturnPair :: Int -> (Int, Int)
findCycleReturnPair number = (findCycle number, number)

myMap :: (Int -> (Int, Int)) -> [Int] -> [(Int, Int)]
myMap _ [] = []
myMap f (x : xs) = f x : myMap f xs

mapMethod :: Int
mapMethod = snd (maximumBy (comparing fst) (myMap findCycleReturnPair (generateList 1 1000)))
