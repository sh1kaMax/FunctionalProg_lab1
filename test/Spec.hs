import qualified SmallestMultipleTests
import Test.Tasty

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests =
  testGroup
    "All tests"
    [ SmallestMultipleTests.tests
    ]
