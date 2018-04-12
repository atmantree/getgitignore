{-#LANGUAGE OverloadedStrings #-}
module Lib where

import Control.Lens
import Network.Wreq
import Data.ByteString.Lazy.Lens (unpackedChars)

repoContentURL = "https://api.github.com/repos/github/gitignore/contents"

gitIgnoreSample = "https://raw.githubusercontent.com/github/gitignore/master/Haskell.gitignore"


writeGitIgnoreFile :: String -> IO ()
writeGitIgnoreFile url = do 
                 r <- get url
                 writeFile "gitignore" (r ^. responseBody. unpackedChars)
                 putStrLn "File \"gitignore\" created"


--------------------------------------------------------------------------------

getListOfTemplates :: IO ()
getListOfTemplates = putStrLn "TODO: get list of templates"

getGitIgnore :: String -> IO ()
getGitIgnore name = putStrLn ("TODO: write .gitignore template file for \"" ++ 
                              name ++ "\" from github")
