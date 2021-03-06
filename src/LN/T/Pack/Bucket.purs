module LN.T.Pack.Bucket where
import LN.T.Bucket
import LN.T.User


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

newtype BucketPackResponse = BucketPackResponse {
  bucket :: BucketResponse,
  bucketId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int
}


type BucketPackResponseR = {
  bucket :: BucketResponse,
  bucketId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int
}


_BucketPackResponse :: Lens' BucketPackResponse {
  bucket :: BucketResponse,
  bucketId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int
}
_BucketPackResponse f (BucketPackResponse o) = BucketPackResponse <$> f o


mkBucketPackResponse :: BucketResponse -> Int -> UserSanitizedResponse -> Int -> BucketPackResponse
mkBucketPackResponse bucket bucketId user userId =
  BucketPackResponse{bucket, bucketId, user, userId}


unwrapBucketPackResponse :: BucketPackResponse -> {
  bucket :: BucketResponse,
  bucketId :: Int,
  user :: UserSanitizedResponse,
  userId :: Int
}
unwrapBucketPackResponse (BucketPackResponse r) = r

instance bucketPackResponseEncodeJson :: EncodeJson BucketPackResponse where
  encodeJson (BucketPackResponse o) =
       "tag" := "BucketPackResponse"
    ~> "bucket" := o.bucket
    ~> "bucket_id" := o.bucketId
    ~> "user" := o.user
    ~> "user_id" := o.userId
    ~> jsonEmptyObject


instance bucketPackResponseDecodeJson :: DecodeJson BucketPackResponse where
  decodeJson o = do
    obj <- decodeJson o
    bucket <- obj .? "bucket"
    bucketId <- obj .? "bucket_id"
    user <- obj .? "user"
    userId <- obj .? "user_id"
    pure $ BucketPackResponse {
      bucket,
      bucketId,
      user,
      userId
    }


instance bucketPackResponseRequestable :: Requestable BucketPackResponse where
  toRequest s =
    let str = stringify (encodeJson s) :: String
    in toRequest str


instance bucketPackResponseRespondable :: Respondable BucketPackResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse = fromResponseDecodeJson


newtype BucketPackResponses = BucketPackResponses {
  bucketPackResponses :: (Array BucketPackResponse)
}


type BucketPackResponsesR = {
  bucketPackResponses :: (Array BucketPackResponse)
}


_BucketPackResponses :: Lens' BucketPackResponses {
  bucketPackResponses :: (Array BucketPackResponse)
}
_BucketPackResponses f (BucketPackResponses o) = BucketPackResponses <$> f o


mkBucketPackResponses :: (Array BucketPackResponse) -> BucketPackResponses
mkBucketPackResponses bucketPackResponses =
  BucketPackResponses{bucketPackResponses}


unwrapBucketPackResponses :: BucketPackResponses -> {
  bucketPackResponses :: (Array BucketPackResponse)
}
unwrapBucketPackResponses (BucketPackResponses r) = r

instance bucketPackResponsesEncodeJson :: EncodeJson BucketPackResponses where
  encodeJson (BucketPackResponses o) =
       "tag" := "BucketPackResponses"
    ~> "bucket_pack_responses" := o.bucketPackResponses
    ~> jsonEmptyObject


instance bucketPackResponsesDecodeJson :: DecodeJson BucketPackResponses where
  decodeJson o = do
    obj <- decodeJson o
    bucketPackResponses <- obj .? "bucket_pack_responses"
    pure $ BucketPackResponses {
      bucketPackResponses
    }


instance bucketPackResponsesRequestable :: Requestable BucketPackResponses where
  toRequest s =
    let str = stringify (encodeJson s) :: String
    in toRequest str


instance bucketPackResponsesRespondable :: Respondable BucketPackResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse = fromResponseDecodeJson

-- footer