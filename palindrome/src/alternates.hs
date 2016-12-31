import Data.Char
-- these were alternate ways of writing different functions
-- and demonstrations of different syntax (guards, case expressions, function composition)


pal xs = xs == reverse xs

pal2 :: String -> String
pal2 xs = map toLower $ (concat . words) xs

pal2' :: String -> String
pal2' xs = (map toLower . concat . words) xs

altPal2 xs = concat . words . map toLower $ xs

pal3 xs = if (elem ' ' xs) then pal2 xs else xs

pal4 xs = if (any isUpper xs) then map toLower xs else xs

pal5 xs
    | (elem ' ' xs) && (any isUpper xs) = pal2 xs
    | elem ' ' xs                       = (concat . words) xs
    | any isUpper xs                    = map toLower xs
    | otherwise                         = xs

pal6 = do
  line1 <- getLine
  case (elem ' ' line1) of
   True -> do
        let line2 = pal2 line1
            revLine2 = reverse line2
        checkPal line2 revLine2
   False -> do
        let line2 = reverse line1
        checkPal line1 line2

checkPal l l' =
  if (l /= l') then do
    putStrLn "Nope!"
  else putStrLn "It's a palindrome!"

-- data Maybe a = Nothing | Just a

checkString xs =
	case xs == " " of
		True  -> Nothing
		False -> Just xs


pal6 = do
    line1 <- getLine
    case checkString line1 of
        Nothing    -> putStrLn "please give me a word"
        Just line2 -> do
            checkPal (pal5 line2) (reverse (pal5 line2))

-- pal6 = do
--     line1 <- getLine
--     case checkString line1 of
--         Nothing    -> putStrLn "gib word u must"
--         Just line1 -> do
--             let line2 = fromJust (Just line1)
--             checkPal (pal5 line2) (reverse (pal5 line2))
-- were able to eliminate one line from this when we realized that
-- pattern matching on the Just constructor already unpacks its contents
-- for us so the fromJust (Just line1) was unnecessary
