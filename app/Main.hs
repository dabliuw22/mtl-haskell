module Main where

import qualified Monad.Reader as R
import qualified Monad.State as S
import qualified Monad.Writer as W
import qualified Mtl.MaybeT as MT
import qualified Mtl.ReaderT as RT
import qualified Mtl.WriterT as WT

main :: IO ()
main = do
  R.run
  S.run
  W.run
  MT.run
  RT.run
  WT.run
