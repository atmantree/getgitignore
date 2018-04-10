{-# LANGUAGE OverloadedStrings #-}

module Lib where

import Network.Wreq
import Control.Lens

showMsg :: IO ()
showMsg = do
            r <- get "https://raw.githubusercontent.com/github/gitignore/master/Haskell.gitignore"
            print $ r ^. responseBody
