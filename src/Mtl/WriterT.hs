module Mtl.WriterT where

import Control.Monad.Trans (lift, liftIO)
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

initLog :: WriterT [String] IO ()
initLog = lift $ print "Init WriterT"

run :: IO ()
run = do
  res <- runWriterT $ initLog *> func1
  print res
