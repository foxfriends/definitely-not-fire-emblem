{-# LANGUAGE NamedFieldPuns #-}
module Lib.View.Battlefield (view) where
  import Data.Grid
  import Lib.Model
  import Lib.RC
  import qualified Lib.View.Tile as Tile

  view :: Game -> Battle ->  StateRC ()
  view game Battle { board = Board grid } = do
    let indexedCells = zip (fmap (uncurry Point . positionIn grid) [0..]) (cells grid)
    mapM_ (uncurry (Tile.view game)) indexedCells
    return ()