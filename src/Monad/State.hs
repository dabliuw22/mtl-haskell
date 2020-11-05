module Monad.State where

import Control.Monad.State
  ( State,
    get,
    modify,
    put,
    runState,
    state,
  )

type Counter = Int

func1 :: State Counter String
-- func1 = func2 >>= (\value -> state (\s -> ("Func1" <> ", " <>  value, s + 1)))
func1 = do
  value <- func2
  counter <- get
  put $ counter + 1
  return $ "Func1" <> ", " <> value

func2 :: State Counter String
-- func3 >>= (\value -> state (\s -> ("Func2" <> ", " <>  value, s + 1)))
func2 = do
  value <- func3
  counter <- get
  put $ counter + 1
  return $ "Func2" <> ", " <> value

func3 :: State Counter String
-- func3 = state (\s -> ("Func3", s + 1))
func3 = do
  counter <- get
  put $ counter + 1
  return "Func3"

run :: IO ()
run = do
  let counter = 0
  let res = runState func1 counter
  print res
