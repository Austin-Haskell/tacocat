-- this is one version I had written originally
-- is not what we did in meetup!
module Main where 

import Control.Monad (forever)
import System.Exit (exitSuccess)
import Data.Char (toLower)

pal' = concat . words . map toLower

-- add a filter function to get punctuation out
-- filter (not elem x ".,'!?:;-_") something like that
-- want it to apply whether there are spaces or not?
-- before or after pal'?

checkPal l l' =
  if (l /= l') then do
    putStrLn "Nope!"
    exitSuccess
  else putStrLn "It's a palindrome!"

-- `forever` allows `main` to keep running
-- until some exit condition (defined in checkPal)
-- is met 

main :: IO ()
main = forever $ do
  line1 <- getLine
  case (elem ' ' line1) of
   True -> do
        let line2 = pal' line1
            revLine2 = reverse line2
        checkPal line2 revLine2
   False -> do
        let line2 = reverse line1
        checkPal line1 line2

