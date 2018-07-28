module Main where

import System.Environment
import Network.Wreq
import Control.Lens
import System.IO (writeFile)
import Data.ByteString.Lazy.Char8 (unpack)


gitignoreSample :: String
gitignoreSample = "https://raw.githubusercontent.com/github/gitignore/master/Haskell.gitignore"


githubContentURL :: String
githubContentURL = "https://api.github.com/repos/github/gitignore/contents"


usageMessage :: String
usageMessage = "Usage: ggi [list|<template name>]"


writeGitignoreFile :: String -> IO ()
writeGitignoreFile url = do
  r <- get url
  writeFile "./sample.gitignore" (unpack $ r ^. responseBody)


getTemplateFor :: String -> IO()
getTemplateFor name = do
  writeGitignoreFile gitignoreSample
  putStrLn "Writing file \"sample.gitignore\" downloaded from the github templates repo"
  putStrLn ("TODO: download template for \"" ++ name ++ "\"")


processAction :: String -> IO ()
processAction action = do
  r <- get githubContentURL
  putStr "Getting JSON content, length: "
  print $ length $ unpack (r ^. responseBody)
  putStrLn "-------------------------------"
  if action == "list" then
     putStrLn "TODO: get templates list"
  else
    getTemplateFor action


takeArgs :: [String] -> IO()
takeArgs []       = putStrLn usageMessage
takeArgs [action] = processAction action
takeArgs (x:xs)   = putStrLn usageMessage 


main :: IO ()
main = do
  args <- getArgs
  takeArgs args
