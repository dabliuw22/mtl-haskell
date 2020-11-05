module Monad.Writer where

import Control.Monad.Writer (Writer, runWriter, tell, writer)

func1 :: Writer [String] String
-- func1 = func2 >>= (\value -> writer (show value, ["span-1"]))
func1 = do
  let span = ["span-1"]
  tell span
  show <$> func2 -- f <$> Functor ó fmap f Functor

func2 :: Writer [String] Int
func2 = do
  let span = ["span-2"]
  tell span
  res <- func3
  return $ res + 2

func3 :: Writer [String] Int
-- func3 = writer (3, ["span-3"])
func3 = do
  let span = ["span-3"]
  tell span
  return 3

run :: IO ()
run = do
  let res = runWriter func1
  print res
