{-# LANGUAGE OverloadedStrings #-}
module Main where

import System.Environment
import Network.Wreq
import Control.Lens
import Data.Map as Map
import Data.Aeson (decode, Value)
import System.IO (writeFile)
import Data.ByteString.Lazy.Char8 (unpack)


gitignoreSample :: String
gitignoreSample = "https://raw.githubusercontent.com/github/gitignore/master/Haskell.gitignore"


githubContentURL :: String
githubContentURL = "https://api.github.com/repos/github/gitignore/contents"


usageMessage :: String
usageMessage = "Usage: ggi [update|templates|<template name>]"


writeGitignoreFile :: String -> IO ()
writeGitignoreFile url = do
  r <- get url
  writeFile "./sample.gitignore" (unpack $ r ^. responseBody)


getTemplateFor :: String -> IO()
getTemplateFor name = do
  writeGitignoreFile gitignoreSample
  putStrLn "Writing file \"sample.gitignore\" downloaded from the github templates repo"
  putStrLn ("TODO: download template for \"" ++ name ++ "\"")

updateData :: IO ()
updateData = do
  r <- get githubContentURL
  let content = r ^. responseBody
  print content

processAction :: String -> IO ()
processAction "-h"        = putStrLn usageMessage
processAction "--help"    = putStrLn usageMessage
processAction "templates" = putStrLn "TODO: get templates list"
processAction "update"    = updateData
processAction template    = getTemplateFor template


takeArgs :: [String] -> IO()
takeArgs []       = putStrLn usageMessage
takeArgs [action] = processAction action
takeArgs (x:xs)   = putStrLn usageMessage 


main :: IO ()
main = do
  args <- getArgs
  takeArgs args
