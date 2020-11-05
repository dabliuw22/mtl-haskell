module Monad.Reader where

import Control.Monad.Reader (Reader, ask, reader, runReader)

func1 :: Reader String String
func1 = do
  env <- ask
  res <- func2
  return ("Correlation: " ++ env ++ ", " ++ show res)

func2 :: Reader String Int
func2 = do
  env <- ask
  let res = func3 env
  return res

func3 :: String -> Int
func3 = length

run :: IO ()
run = do
  let env = "correlation-id"
  let res = runReader func1 env
  print res
