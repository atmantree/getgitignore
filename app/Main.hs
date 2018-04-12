module Main where

import System.Environment
import Lib


main :: IO ()
main = do
  args <- getArgs
  if length args /= 1 then
    putStrLn "Usage: getgitignore [list|<template_name>]"
  else
    if head args == "list" then
      getListOfTemplates
    else
      getGitIgnore $ head args

