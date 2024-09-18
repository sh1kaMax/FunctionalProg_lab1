module SmallestMultipleTests (tests) where

import SmallestMultiple
import Test.Tasty
import Test.Tasty.HUnit

tests :: TestTree
tests =
  testGroup
    "5th Problem"
    [ testCase "Recursion Method Test" $
        recursionMethod 1 20 @?= 232792560,
      testCase "Tail Recursion Method Test" $
        tailRecursionMethod 1 20 @?= 232792560,
      testCase "Module Method Test" $
        moduleMethod 1 20 @?= 232792560,
      testCase "Infinity Massive Method Test" $
        infinityListMethod 1 20 @?= 232792560
    ]
