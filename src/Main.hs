module Main where

import System.Environment


-- repoContentURL = "https://api.github.com/repos/github/gitignore/contents"
-- gitIgnoreSample = "https://raw.githubusercontent.com/github/gitignore/master/Haskell.gitignore"


getListOfTemplates :: IO ()
getListOfTemplates = putStrLn "TODO: get list of templates"


getGitIgnore :: String -> IO ()
getGitIgnore name = putStrLn ("TODO: write .gitignore template file for \"" 
                              ++ name ++ "\" from github")


main :: IO ()
main = do
  args <- getArgs
  if length args /= 1 then
    putStrLn "Usage: ggi [list|<template_name>]"
  else
    if head args == "list" then
      getListOfTemplates
    else
      getGitIgnore $ head args

