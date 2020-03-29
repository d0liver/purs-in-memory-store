module InMemoryStore (
  Key,
  reserve, release, get, set, (:=)
) where

import Prelude

import Control.Monad.Except (runExcept)
import Data.Either (Either)
import Data.List.NonEmpty (NonEmptyList)
import Data.Maybe (Maybe)
import Data.Traversable (traverse)
import Effect (Effect)
import Foreign (Foreign, ForeignError, readNullOrUndefined)
import Foreign.Generic.Class (class Decode, class Encode, decode, encode)

type Key = String

foreign import _get :: Key -> Effect Foreign
foreign import _set :: ∀ a. Key -> a -> Effect Unit
-- The Boolean indicates success or failure (whether this key has already been
-- taken).
foreign import _reserve :: Key -> Effect Boolean
foreign import release :: Key -> Effect Unit

get :: ∀ a. Decode a => Key -> Effect (Either (NonEmptyList ForeignError) (Maybe a))
get k = do
  _a <- _get k
  pure (runExcept (readNullOrUndefined _a >>= traverse decode))

set :: ∀ a. Encode a => Key -> a -> Effect Unit
set k a = do
  _set k (encode a)

reserve :: Key -> Effect Boolean
reserve key = _reserve key

infixl 6 set as :=
