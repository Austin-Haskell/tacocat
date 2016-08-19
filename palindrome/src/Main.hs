module Main where

-- this was what we wrote at first August meetup
-- finished with various additions (see alternates.hs) at second meetup

pal :: String -> Bool
pal xs = xs == reverse xs

pal2 :: String -> String
pal2 xs = (concat . words) xs

main :: IO ()
main = do
  string <- getLine
  print $ (pal . pal2) string
