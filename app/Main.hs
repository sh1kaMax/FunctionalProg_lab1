module Main
  ( main,
  )
where

import SmallestMultiple

main :: IO ()
main = do
  putStrLn "5th Problem"
  putStrLn $ "Recursion Method: " ++ show (tailRecursionMethod 1 20)
  putStrLn $ "Tail Recursion Method: " ++ show (tailRecursionMethod 1 20)
  putStrLn $ "Module Method: " ++ show (moduleMethod 1 20)
  putStrLn $ "Infinity Massive: " ++ show (infinityListMethod 1 20)
