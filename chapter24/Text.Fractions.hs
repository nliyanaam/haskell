module Text.Fractions where

import Control.Applicative
import Data.Ratio ((%))
import Text.Trifecta

-- test inputs
badFraction = "1/0"
alsoBad = "10"
shouldWork = "1/2"
shouldAlsoWork = "2/1"

parseFraction :: Parser Rational
parseFraction = do
    numerator <- decimal
    char '/'
    denominator <- decimal
    return (numerator % denominator)

virtuousFraction :: Parser Rational
virtuousFraction = do

    numerator <- decimal 
    char '/'

    denominator <- decimal
    case denominator of 
        0 -> fail "Denominator cannot be zero"
        _ -> return (numerator % denominator)

testVirtuous :: IO()
testVirtuous = do
    let virtuousFraction' = 
          parseString virtuousFraction mempty

    print $ virtuousFraction' badFraction
    print $ virtuousFraction' alsoBad

    print $ virtuousFraction' shouldWork
    print $ virtuousFraction' shouldAlsoWork

main :: IO ()
main = do

    let parseFraction' = 
          parseString parseFraction mempty

    print $ parseFraction' shouldWork
    print $ parseFraction' shouldAlsoWork

    print $ parseFraction' alsoBad
    print $ parseFraction' badFraction

-- Exercise: Unit of success
yourFuncHere :: Parser Integer 
yourFuncHere = do 
    int1 <- integer
    e <- eof
    return int1

testYourFunc :: IO()
testYourFunc = do
    print $ parseString (yourFuncHere) mempty "123"
    print $ parseString (yourFuncHere) mempty "123abc"