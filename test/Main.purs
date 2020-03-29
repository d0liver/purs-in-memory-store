module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Class.Console (log)
import Test.Spec
import Test.Spec.Assertions
import Effect.Aff

main :: Effect Unit
main = do
  -- Not including any tests because they'd pretty much just duplicate the
  -- Mocha stuff.
  log "Nothing to see here... Use yarn test instead."
