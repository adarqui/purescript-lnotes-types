module LN.T.Count where



import Control.Monad.Except.Trans       (runExceptT)
import Data.Argonaut.Core               (jsonEmptyObject, stringify)
import Data.Argonaut.Decode             (class DecodeJson, decodeJson)
import Data.Argonaut.Decode.Combinators ((.?))
import Data.Argonaut.Encode             (class EncodeJson, encodeJson)
import Data.Argonaut.Encode.Combinators ((~>), (:=))
import Data.Date.Helpers                (Date)
import Data.Either                      (Either(..), either)
import Data.Foreign                     (ForeignError(..), fail, unsafeFromForeign, toForeign)
import Data.Foreign.NullOrUndefined     (unNullOrUndefined)
import Data.Foreign.Class               (class Decode, decode)
import Data.Foreign.Helpers
import Data.Maybe                       (Maybe(..))
import Data.Tuple                       (Tuple(..))
import Purescript.Api.Helpers           (class QueryParam, qp)
import Network.HTTP.Affjax.Request      (class Requestable, toRequest)
import Network.HTTP.Affjax.Response     (class Respondable, ResponseType(..))
import Optic.Core                       ((^.), (..))
import Optic.Types                      (Lens, Lens')
import Prelude                          (class Show, show, class Eq, eq, pure, bind, const, ($), (<>), (<$>), (<*>), (==), (&&), (<<<))
import Data.Default

import Purescript.Api.Helpers

newtype CountResponse = CountResponse {
  id :: Int,
  n :: Int
}


type CountResponseR = {
  id :: Int,
  n :: Int
}


_CountResponse :: Lens' CountResponse {
  id :: Int,
  n :: Int
}
_CountResponse f (CountResponse o) = CountResponse <$> f o


mkCountResponse :: Int -> Int -> CountResponse
mkCountResponse id n =
  CountResponse{id, n}


unwrapCountResponse :: CountResponse -> {
  id :: Int,
  n :: Int
}
unwrapCountResponse (CountResponse r) = r

instance countResponseEncodeJson :: EncodeJson CountResponse where
  encodeJson (CountResponse o) =
       "tag" := "CountResponse"
    ~> "id" := o.id
    ~> "n" := o.n
    ~> jsonEmptyObject


instance countResponseDecodeJson :: DecodeJson CountResponse where
  decodeJson o = do
    obj <- decodeJson o
    id <- obj .? "id"
    n <- obj .? "n"
    pure $ CountResponse {
      id,
      n
    }


instance countResponseRequestable :: Requestable CountResponse where
  toRequest s =
    let str = stringify (encodeJson s) :: String
    in toRequest str


instance countResponseRespondable :: Respondable CountResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse = fromResponseDecodeJson


newtype CountResponses = CountResponses {
  countResponses :: (Array CountResponse)
}


type CountResponsesR = {
  countResponses :: (Array CountResponse)
}


_CountResponses :: Lens' CountResponses {
  countResponses :: (Array CountResponse)
}
_CountResponses f (CountResponses o) = CountResponses <$> f o


mkCountResponses :: (Array CountResponse) -> CountResponses
mkCountResponses countResponses =
  CountResponses{countResponses}


unwrapCountResponses :: CountResponses -> {
  countResponses :: (Array CountResponse)
}
unwrapCountResponses (CountResponses r) = r

instance countResponsesEncodeJson :: EncodeJson CountResponses where
  encodeJson (CountResponses o) =
       "tag" := "CountResponses"
    ~> "count_responses" := o.countResponses
    ~> jsonEmptyObject


instance countResponsesDecodeJson :: DecodeJson CountResponses where
  decodeJson o = do
    obj <- decodeJson o
    countResponses <- obj .? "count_responses"
    pure $ CountResponses {
      countResponses
    }


instance countResponsesRequestable :: Requestable CountResponses where
  toRequest s =
    let str = stringify (encodeJson s) :: String
    in toRequest str


instance countResponsesRespondable :: Respondable CountResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse = fromResponseDecodeJson

-- footer