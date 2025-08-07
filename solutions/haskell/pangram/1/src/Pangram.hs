
module Pangram (isPangram) where
import Data.List
import Data.Char

isPangram :: String -> Bool
isPangram text = equalLength && (and $ zipWith (==) alphabet sortedSingleLowerChars)
  where
    alphabet = ['a'..'z']
    sortedSingleLowerChars = (filter (\x -> x `elem` alphabet) (map head (group (sort (map toLower text)))))
    equalLength = (length alphabet) == (length sortedSingleLowerChars)
    