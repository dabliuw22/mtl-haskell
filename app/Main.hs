module Main where

import qualified Monad.Reader as R
import qualified Monad.Writer as W
import qualified Mtl.MaybeT as MT
import qualified Mtl.WriterT as WT
import qualified Mtl.ReaderT as RT

main :: IO ()
main = do
  MT.run
  WT.run
  RT.run
