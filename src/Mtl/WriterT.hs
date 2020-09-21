module Mtl.WriterT where

import Control.Monad.Trans (liftIO)
import Control.Monad.Writer (WriterT, runWriterT, tell)
  
func1 :: Monad m => WriterT [String] m String
func1 = do 
  let span = ["span-1"]
  tell span
  show <$> func2 -- f <$> Functor ó fmap f Functor

func2 :: Monad m => WriterT [String] m Int
func2 = do
  let span = ["span-2"]
  tell span
  res <- func3
  return $ res + 2

func3 :: Monad m => WriterT [String] m Int
func3 = do
  let span = ["span-3"]
  tell span
  return 3

run :: IO ()
run = do
  res <- runWriterT func1
  print res