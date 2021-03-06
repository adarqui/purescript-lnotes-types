module LN.T.Training where



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

newtype TrainingNode = TrainingNode {
  numTotal :: Int,
  numKnow :: Int,
  numDontKnow :: Int,
  numDontCare :: Int,
  numProtest :: Int,
  honorKnow :: Int,
  honorDontKnow :: Int,
  honorDontCare :: Int,
  honorProtest :: Int,
  honorKnowAt :: (Maybe Date),
  honorDontKnowAt :: (Maybe Date),
  honorDontCareAt :: (Maybe Date),
  honorProtestAt :: (Maybe Date),
  booleanKnow :: Int,
  booleanDontKnow :: Int,
  booleanDontCare :: Int,
  booleanProtest :: Int,
  booleanKnowAt :: (Maybe Date),
  booleanDontKnowAt :: (Maybe Date),
  booleanDontCareAt :: (Maybe Date),
  booleanProtestAt :: (Maybe Date),
  matchKnow :: Int,
  matchDontKnow :: Int,
  matchDontCare :: Int,
  matchProtest :: Int,
  matchKnowAt :: (Maybe Date),
  matchDontKnowAt :: (Maybe Date),
  matchDontCareAt :: (Maybe Date),
  matchProtestAt :: (Maybe Date),
  subsKnow :: Int,
  subsDontKnow :: Int,
  subsDontCare :: Int,
  subsProtest :: Int,
  subsKnowAt :: (Maybe Date),
  subsDontKnowAt :: (Maybe Date),
  subsDontCareAt :: (Maybe Date),
  subsProtestAt :: (Maybe Date),
  splitsKnow :: Int,
  splitsDontKnow :: Int,
  splitsDontCare :: Int,
  splitsProtest :: Int,
  splitsKnowAt :: (Maybe Date),
  splitsDontKnowAt :: (Maybe Date),
  splitsDontCareAt :: (Maybe Date),
  splitsProtestAt :: (Maybe Date)
}


type TrainingNodeR = {
  numTotal :: Int,
  numKnow :: Int,
  numDontKnow :: Int,
  numDontCare :: Int,
  numProtest :: Int,
  honorKnow :: Int,
  honorDontKnow :: Int,
  honorDontCare :: Int,
  honorProtest :: Int,
  honorKnowAt :: (Maybe Date),
  honorDontKnowAt :: (Maybe Date),
  honorDontCareAt :: (Maybe Date),
  honorProtestAt :: (Maybe Date),
  booleanKnow :: Int,
  booleanDontKnow :: Int,
  booleanDontCare :: Int,
  booleanProtest :: Int,
  booleanKnowAt :: (Maybe Date),
  booleanDontKnowAt :: (Maybe Date),
  booleanDontCareAt :: (Maybe Date),
  booleanProtestAt :: (Maybe Date),
  matchKnow :: Int,
  matchDontKnow :: Int,
  matchDontCare :: Int,
  matchProtest :: Int,
  matchKnowAt :: (Maybe Date),
  matchDontKnowAt :: (Maybe Date),
  matchDontCareAt :: (Maybe Date),
  matchProtestAt :: (Maybe Date),
  subsKnow :: Int,
  subsDontKnow :: Int,
  subsDontCare :: Int,
  subsProtest :: Int,
  subsKnowAt :: (Maybe Date),
  subsDontKnowAt :: (Maybe Date),
  subsDontCareAt :: (Maybe Date),
  subsProtestAt :: (Maybe Date),
  splitsKnow :: Int,
  splitsDontKnow :: Int,
  splitsDontCare :: Int,
  splitsProtest :: Int,
  splitsKnowAt :: (Maybe Date),
  splitsDontKnowAt :: (Maybe Date),
  splitsDontCareAt :: (Maybe Date),
  splitsProtestAt :: (Maybe Date)
}


_TrainingNode :: Lens' TrainingNode {
  numTotal :: Int,
  numKnow :: Int,
  numDontKnow :: Int,
  numDontCare :: Int,
  numProtest :: Int,
  honorKnow :: Int,
  honorDontKnow :: Int,
  honorDontCare :: Int,
  honorProtest :: Int,
  honorKnowAt :: (Maybe Date),
  honorDontKnowAt :: (Maybe Date),
  honorDontCareAt :: (Maybe Date),
  honorProtestAt :: (Maybe Date),
  booleanKnow :: Int,
  booleanDontKnow :: Int,
  booleanDontCare :: Int,
  booleanProtest :: Int,
  booleanKnowAt :: (Maybe Date),
  booleanDontKnowAt :: (Maybe Date),
  booleanDontCareAt :: (Maybe Date),
  booleanProtestAt :: (Maybe Date),
  matchKnow :: Int,
  matchDontKnow :: Int,
  matchDontCare :: Int,
  matchProtest :: Int,
  matchKnowAt :: (Maybe Date),
  matchDontKnowAt :: (Maybe Date),
  matchDontCareAt :: (Maybe Date),
  matchProtestAt :: (Maybe Date),
  subsKnow :: Int,
  subsDontKnow :: Int,
  subsDontCare :: Int,
  subsProtest :: Int,
  subsKnowAt :: (Maybe Date),
  subsDontKnowAt :: (Maybe Date),
  subsDontCareAt :: (Maybe Date),
  subsProtestAt :: (Maybe Date),
  splitsKnow :: Int,
  splitsDontKnow :: Int,
  splitsDontCare :: Int,
  splitsProtest :: Int,
  splitsKnowAt :: (Maybe Date),
  splitsDontKnowAt :: (Maybe Date),
  splitsDontCareAt :: (Maybe Date),
  splitsProtestAt :: (Maybe Date)
}
_TrainingNode f (TrainingNode o) = TrainingNode <$> f o


mkTrainingNode :: Int -> Int -> Int -> Int -> Int -> Int -> Int -> Int -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> Int -> Int -> Int -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> Int -> Int -> Int -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> Int -> Int -> Int -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> Int -> Int -> Int -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> TrainingNode
mkTrainingNode numTotal numKnow numDontKnow numDontCare numProtest honorKnow honorDontKnow honorDontCare honorProtest honorKnowAt honorDontKnowAt honorDontCareAt honorProtestAt booleanKnow booleanDontKnow booleanDontCare booleanProtest booleanKnowAt booleanDontKnowAt booleanDontCareAt booleanProtestAt matchKnow matchDontKnow matchDontCare matchProtest matchKnowAt matchDontKnowAt matchDontCareAt matchProtestAt subsKnow subsDontKnow subsDontCare subsProtest subsKnowAt subsDontKnowAt subsDontCareAt subsProtestAt splitsKnow splitsDontKnow splitsDontCare splitsProtest splitsKnowAt splitsDontKnowAt splitsDontCareAt splitsProtestAt =
  TrainingNode{numTotal, numKnow, numDontKnow, numDontCare, numProtest, honorKnow, honorDontKnow, honorDontCare, honorProtest, honorKnowAt, honorDontKnowAt, honorDontCareAt, honorProtestAt, booleanKnow, booleanDontKnow, booleanDontCare, booleanProtest, booleanKnowAt, booleanDontKnowAt, booleanDontCareAt, booleanProtestAt, matchKnow, matchDontKnow, matchDontCare, matchProtest, matchKnowAt, matchDontKnowAt, matchDontCareAt, matchProtestAt, subsKnow, subsDontKnow, subsDontCare, subsProtest, subsKnowAt, subsDontKnowAt, subsDontCareAt, subsProtestAt, splitsKnow, splitsDontKnow, splitsDontCare, splitsProtest, splitsKnowAt, splitsDontKnowAt, splitsDontCareAt, splitsProtestAt}


unwrapTrainingNode :: TrainingNode -> {
  numTotal :: Int,
  numKnow :: Int,
  numDontKnow :: Int,
  numDontCare :: Int,
  numProtest :: Int,
  honorKnow :: Int,
  honorDontKnow :: Int,
  honorDontCare :: Int,
  honorProtest :: Int,
  honorKnowAt :: (Maybe Date),
  honorDontKnowAt :: (Maybe Date),
  honorDontCareAt :: (Maybe Date),
  honorProtestAt :: (Maybe Date),
  booleanKnow :: Int,
  booleanDontKnow :: Int,
  booleanDontCare :: Int,
  booleanProtest :: Int,
  booleanKnowAt :: (Maybe Date),
  booleanDontKnowAt :: (Maybe Date),
  booleanDontCareAt :: (Maybe Date),
  booleanProtestAt :: (Maybe Date),
  matchKnow :: Int,
  matchDontKnow :: Int,
  matchDontCare :: Int,
  matchProtest :: Int,
  matchKnowAt :: (Maybe Date),
  matchDontKnowAt :: (Maybe Date),
  matchDontCareAt :: (Maybe Date),
  matchProtestAt :: (Maybe Date),
  subsKnow :: Int,
  subsDontKnow :: Int,
  subsDontCare :: Int,
  subsProtest :: Int,
  subsKnowAt :: (Maybe Date),
  subsDontKnowAt :: (Maybe Date),
  subsDontCareAt :: (Maybe Date),
  subsProtestAt :: (Maybe Date),
  splitsKnow :: Int,
  splitsDontKnow :: Int,
  splitsDontCare :: Int,
  splitsProtest :: Int,
  splitsKnowAt :: (Maybe Date),
  splitsDontKnowAt :: (Maybe Date),
  splitsDontCareAt :: (Maybe Date),
  splitsProtestAt :: (Maybe Date)
}
unwrapTrainingNode (TrainingNode r) = r

instance trainingNodeEncodeJson :: EncodeJson TrainingNode where
  encodeJson (TrainingNode o) =
       "tag" := "TrainingNode"
    ~> "num_total" := o.numTotal
    ~> "num_know" := o.numKnow
    ~> "num_dont_know" := o.numDontKnow
    ~> "num_dont_care" := o.numDontCare
    ~> "num_protest" := o.numProtest
    ~> "honor_know" := o.honorKnow
    ~> "honor_dont_know" := o.honorDontKnow
    ~> "honor_dont_care" := o.honorDontCare
    ~> "honor_protest" := o.honorProtest
    ~> "honor_know_at" := o.honorKnowAt
    ~> "honor_dont_know_at" := o.honorDontKnowAt
    ~> "honor_dont_care_at" := o.honorDontCareAt
    ~> "honor_protest_at" := o.honorProtestAt
    ~> "boolean_know" := o.booleanKnow
    ~> "boolean_dont_know" := o.booleanDontKnow
    ~> "boolean_dont_care" := o.booleanDontCare
    ~> "boolean_protest" := o.booleanProtest
    ~> "boolean_know_at" := o.booleanKnowAt
    ~> "boolean_dont_know_at" := o.booleanDontKnowAt
    ~> "boolean_dont_care_at" := o.booleanDontCareAt
    ~> "boolean_protest_at" := o.booleanProtestAt
    ~> "match_know" := o.matchKnow
    ~> "match_dont_know" := o.matchDontKnow
    ~> "match_dont_care" := o.matchDontCare
    ~> "match_protest" := o.matchProtest
    ~> "match_know_at" := o.matchKnowAt
    ~> "match_dont_know_at" := o.matchDontKnowAt
    ~> "match_dont_care_at" := o.matchDontCareAt
    ~> "match_protest_at" := o.matchProtestAt
    ~> "subs_know" := o.subsKnow
    ~> "subs_dont_know" := o.subsDontKnow
    ~> "subs_dont_care" := o.subsDontCare
    ~> "subs_protest" := o.subsProtest
    ~> "subs_know_at" := o.subsKnowAt
    ~> "subs_dont_know_at" := o.subsDontKnowAt
    ~> "subs_dont_care_at" := o.subsDontCareAt
    ~> "subs_protest_at" := o.subsProtestAt
    ~> "splits_know" := o.splitsKnow
    ~> "splits_dont_know" := o.splitsDontKnow
    ~> "splits_dont_care" := o.splitsDontCare
    ~> "splits_protest" := o.splitsProtest
    ~> "splits_know_at" := o.splitsKnowAt
    ~> "splits_dont_know_at" := o.splitsDontKnowAt
    ~> "splits_dont_care_at" := o.splitsDontCareAt
    ~> "splits_protest_at" := o.splitsProtestAt
    ~> jsonEmptyObject


instance trainingNodeDecodeJson :: DecodeJson TrainingNode where
  decodeJson o = do
    obj <- decodeJson o
    numTotal <- obj .? "num_total"
    numKnow <- obj .? "num_know"
    numDontKnow <- obj .? "num_dont_know"
    numDontCare <- obj .? "num_dont_care"
    numProtest <- obj .? "num_protest"
    honorKnow <- obj .? "honor_know"
    honorDontKnow <- obj .? "honor_dont_know"
    honorDontCare <- obj .? "honor_dont_care"
    honorProtest <- obj .? "honor_protest"
    honorKnowAt <- obj .? "honor_know_at"
    honorDontKnowAt <- obj .? "honor_dont_know_at"
    honorDontCareAt <- obj .? "honor_dont_care_at"
    honorProtestAt <- obj .? "honor_protest_at"
    booleanKnow <- obj .? "boolean_know"
    booleanDontKnow <- obj .? "boolean_dont_know"
    booleanDontCare <- obj .? "boolean_dont_care"
    booleanProtest <- obj .? "boolean_protest"
    booleanKnowAt <- obj .? "boolean_know_at"
    booleanDontKnowAt <- obj .? "boolean_dont_know_at"
    booleanDontCareAt <- obj .? "boolean_dont_care_at"
    booleanProtestAt <- obj .? "boolean_protest_at"
    matchKnow <- obj .? "match_know"
    matchDontKnow <- obj .? "match_dont_know"
    matchDontCare <- obj .? "match_dont_care"
    matchProtest <- obj .? "match_protest"
    matchKnowAt <- obj .? "match_know_at"
    matchDontKnowAt <- obj .? "match_dont_know_at"
    matchDontCareAt <- obj .? "match_dont_care_at"
    matchProtestAt <- obj .? "match_protest_at"
    subsKnow <- obj .? "subs_know"
    subsDontKnow <- obj .? "subs_dont_know"
    subsDontCare <- obj .? "subs_dont_care"
    subsProtest <- obj .? "subs_protest"
    subsKnowAt <- obj .? "subs_know_at"
    subsDontKnowAt <- obj .? "subs_dont_know_at"
    subsDontCareAt <- obj .? "subs_dont_care_at"
    subsProtestAt <- obj .? "subs_protest_at"
    splitsKnow <- obj .? "splits_know"
    splitsDontKnow <- obj .? "splits_dont_know"
    splitsDontCare <- obj .? "splits_dont_care"
    splitsProtest <- obj .? "splits_protest"
    splitsKnowAt <- obj .? "splits_know_at"
    splitsDontKnowAt <- obj .? "splits_dont_know_at"
    splitsDontCareAt <- obj .? "splits_dont_care_at"
    splitsProtestAt <- obj .? "splits_protest_at"
    pure $ TrainingNode {
      numTotal,
      numKnow,
      numDontKnow,
      numDontCare,
      numProtest,
      honorKnow,
      honorDontKnow,
      honorDontCare,
      honorProtest,
      honorKnowAt,
      honorDontKnowAt,
      honorDontCareAt,
      honorProtestAt,
      booleanKnow,
      booleanDontKnow,
      booleanDontCare,
      booleanProtest,
      booleanKnowAt,
      booleanDontKnowAt,
      booleanDontCareAt,
      booleanProtestAt,
      matchKnow,
      matchDontKnow,
      matchDontCare,
      matchProtest,
      matchKnowAt,
      matchDontKnowAt,
      matchDontCareAt,
      matchProtestAt,
      subsKnow,
      subsDontKnow,
      subsDontCare,
      subsProtest,
      subsKnowAt,
      subsDontKnowAt,
      subsDontCareAt,
      subsProtestAt,
      splitsKnow,
      splitsDontKnow,
      splitsDontCare,
      splitsProtest,
      splitsKnowAt,
      splitsDontKnowAt,
      splitsDontCareAt,
      splitsProtestAt
    }


instance trainingNodeRequestable :: Requestable TrainingNode where
  toRequest s =
    let str = stringify (encodeJson s) :: String
    in toRequest str


instance trainingNodeRespondable :: Respondable TrainingNode where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse = fromResponseDecodeJson


data TrainingStyle
  = TS_Honor 
  | TS_Boolean 
  | TS_Match 
  | TS_Subs 
  | TS_Splits 



instance trainingStyleEncodeJson :: EncodeJson TrainingStyle where
  encodeJson (TS_Honor ) =
       "tag" := "TS_Honor"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TS_Boolean ) =
       "tag" := "TS_Boolean"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TS_Match ) =
       "tag" := "TS_Match"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TS_Subs ) =
       "tag" := "TS_Subs"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject
  encodeJson (TS_Splits ) =
       "tag" := "TS_Splits"
    ~> "contents" := ([] :: Array String)
    ~> jsonEmptyObject


instance trainingStyleDecodeJson :: DecodeJson TrainingStyle where
  decodeJson json = do
    obj <- decodeJson json
    tag <- obj .? "tag"
    case tag of
      "TS_Honor" -> do
        pure TS_Honor

      "TS_Boolean" -> do
        pure TS_Boolean

      "TS_Match" -> do
        pure TS_Match

      "TS_Subs" -> do
        pure TS_Subs

      "TS_Splits" -> do
        pure TS_Splits

      _ -> Left $ "DecodeJson TypeMismatch for TrainingStyle"



instance trainingStyleRequestable :: Requestable TrainingStyle where
  toRequest s =
    let str = stringify (encodeJson s) :: String
    in toRequest str


instance trainingStyleRespondable :: Respondable TrainingStyle where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    tag <- readPropUnsafe "tag" json
    case tag of
      "TS_Honor" -> do
        pure TS_Honor

      "TS_Boolean" -> do
        pure TS_Boolean

      "TS_Match" -> do
        pure TS_Match

      "TS_Subs" -> do
        pure TS_Subs

      "TS_Splits" -> do
        pure TS_Splits

      _ -> fail $ TypeMismatch "TrainingStyle" "Respondable"



instance trainingStyleEq :: Eq TrainingStyle where
  eq TS_Honor TS_Honor = true
  eq TS_Boolean TS_Boolean = true
  eq TS_Match TS_Match = true
  eq TS_Subs TS_Subs = true
  eq TS_Splits TS_Splits = true
  eq _ _ = false

instance trainingStyleShow :: Show TrainingStyle where
  show TS_Honor = "ts_honor"
  show TS_Boolean = "ts_boolean"
  show TS_Match = "ts_match"
  show TS_Subs = "ts_subs"
  show TS_Splits = "ts_splits"


readTrainingStyle :: String -> Maybe TrainingStyle
readTrainingStyle "ts_honor" = Just TS_Honor
readTrainingStyle "ts_boolean" = Just TS_Boolean
readTrainingStyle "ts_match" = Just TS_Match
readTrainingStyle "ts_subs" = Just TS_Subs
readTrainingStyle "ts_splits" = Just TS_Splits
readTrainingStyle _ = Nothing
-- footer