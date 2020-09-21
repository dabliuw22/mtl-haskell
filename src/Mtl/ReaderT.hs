module Mtl.ReaderT where

import Control.Monad.Trans (liftIO)
import Control.Monad.IO.Class (MonadIO)
import Control.Monad.Reader (ReaderT, runReaderT, ask)

func1 :: MonadIO m => ReaderT String m String
func1 = do
  res <- func2
  return ("Value " ++ show res)

func2 :: MonadIO m => ReaderT String m Int
func2 = do
  env <- ask
  let res = func3 env
  return res

func3 :: String -> Int
func3 = length

run :: IO ()
run = do
  let env = "correlation-id"
  res <- runReaderT func1 env
  print res