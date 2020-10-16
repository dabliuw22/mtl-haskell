module Mtl.MaybeT where

import Control.Monad.Trans.Maybe (MaybeT (..), runMaybeT)

func1 :: Monad m => MaybeT m String
func1 = do
  res <- func2
  if res > 0
    then MaybeT $ return (Just "Value")
    else MaybeT $ return Nothing

func2 :: Monad m => MaybeT m Int
func2 = do
  MaybeT $ return (Just 2)

run :: IO ()
run = do
  res <- runMaybeT func1
  print res
