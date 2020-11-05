module Mtl.ReaderT where

import Control.Monad.IO.Class (MonadIO)
import Control.Monad.Reader (ReaderT, ask, runReaderT)
import Control.Monad.Trans (liftIO)

func1 :: MonadIO m => ReaderT String m String
func1 = do
  env <- ask
  _ <- liftIO $ print ("Func1: " <> env)
  res <- func2
  return ("Correlation: " ++ env ++ ", " ++ show res)

func2 :: MonadIO m => ReaderT String m Int
func2 = do
  env <- ask
  _ <- liftIO $ print ("Func2: " <> env)
  let res = func3 env
  return res

func3 :: String -> Int
func3 = length

run :: IO ()
run = do
  let env = "correlation-id"
  res <- runReaderT func1 env
  print res
