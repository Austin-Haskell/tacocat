import Data.Char
import Data.Maybe

-- these were alternate ways of writing different functions 
-- and demonstrations of different syntax (guards, case expressions, function composition)

pal6 = do
    line1 <- getLine
    case checkString line1 of
        Nothing    -> putStrLn "gib word u must"
        Just line1 -> do
            let line2 = fromJust (Just line1)
            checkPal (pal5 line2) (reverse (pal5 line2))

checkString xs =
    case xs == "" of
        True  -> Nothing
        False -> Just xs

checkPal x x' =
    if (x /= x') then do
        putStrLn "Nope!"
    else putStrLn "It's a palindrome!"

pal2 :: String -> String
pal2 xs = map toLower $ (concat . words) xs

altPal2 xs = concat . words . map toLower $ xs

pal3 xs = if (elem ' ' xs) then pal2 xs else xs

pal4 xs = if (any isUpper xs) then map toLower xs else xs

pal5 xs 
    | (elem ' ' xs) && (any isUpper xs) = pal2 xs
    | elem ' ' xs                       = (concat . words) xs
    | any isUpper xs                    = map toLower xs
    | otherwise                         = xs
