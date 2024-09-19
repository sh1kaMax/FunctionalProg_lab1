module ReciprocalCyclesTests (tests) where

import ReciprocalCycles
import Test.Tasty
import Test.Tasty.HUnit

tests :: TestTree
tests =
  testGroup
    "26th Problem"
    [ testCase "Recursion Method Test" $
        recursionMethod @?= 983,
      testCase "Tail Recursion Method Test" $
        tailRecursionMethod @?= 983,
      testCase "Module Method Test" $
        moduleMethod 1 1000 @?= 983,
      testCase "Custom Map Method Test" $
        mapMethod @?= 983
    ]
