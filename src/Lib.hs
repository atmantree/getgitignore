{-# LANGUAGE OverloadedStrings #-}

module Lib where

import Network.Wreq
import Control.Lens
import Data.ByteString.Lazy.Lens

writeGitIgnoreFile url = do
                    r <- get url
                    writeFile "gitignore" (r ^. responseBody. unpackedChars)


showMsg :: IO ()
showMsg = do
            writeGitIgnoreFile "https://raw.githubusercontent.com/github/gitignore/master/Haskell.gitignore"
            putStrLn "File \"gitignore\" created"
