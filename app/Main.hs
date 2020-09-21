module Main where

import qualified Monad.Reader as R
import qualified Monad.Writer as W
import qualified Mtl.WriterT as WT
import qualified Mtl.ReaderT as RT

main :: IO ()
main = WT.run
