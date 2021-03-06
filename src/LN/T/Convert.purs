module LN.T.Convert where


import Data.Date.Helpers                (Date)
import Data.Maybe                       (Maybe)

import LN.T

apiRequestToApiResponse :: Int -> Int -> String -> (Maybe Date) -> (Maybe Date) -> ApiRequest -> ApiResponse
apiRequestToApiResponse id userId key createdAt modifiedAt (ApiRequest o) =
  ApiResponse {
    id: id,
    userId: userId,
    key: key,
    comment: o.comment,
    guard: o.guard,
    createdAt: createdAt,
    modifiedAt: modifiedAt
  }


apiResponseToApiRequest :: ApiResponse -> ApiRequest
apiResponseToApiRequest  (ApiResponse o) =
  ApiRequest {
    comment: o.comment,
    guard: o.guard
  }


bucketRequestToBucketResponse :: Int -> Int -> String -> TrainingNode -> Boolean -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> BucketRequest -> BucketResponse
bucketRequestToBucketResponse id userId name trainingNode active createdAt modifiedAt activityAt (BucketRequest o) =
  BucketResponse {
    id: id,
    userId: userId,
    name: name,
    displayName: o.displayName,
    description: o.description,
    scoreLo: o.scoreLo,
    scoreHi: o.scoreHi,
    leurons: o.leurons,
    resources: o.resources,
    categories: o.categories,
    filters: o.filters,
    trainingNode: trainingNode,
    active: active,
    guard: o.guard,
    createdAt: createdAt,
    modifiedAt: modifiedAt,
    activityAt: activityAt
  }


bucketResponseToBucketRequest :: BucketResponse -> BucketRequest
bucketResponseToBucketRequest  (BucketResponse o) =
  BucketRequest {
    displayName: o.displayName,
    description: o.description,
    scoreLo: o.scoreLo,
    scoreHi: o.scoreHi,
    leurons: o.leurons,
    resources: o.resources,
    categories: o.categories,
    filters: o.filters,
    guard: o.guard
  }


bucketRoundRequestToBucketRoundResponse :: Int -> Int -> Int -> TrainingNode -> Boolean -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> BucketRoundRequest -> BucketRoundResponse
bucketRoundRequestToBucketRoundResponse id userId bucketId trainingNode active createdAt modifiedAt activityAt (BucketRoundRequest o) =
  BucketRoundResponse {
    id: id,
    userId: userId,
    bucketId: bucketId,
    trainingStyles: o.trainingStyles,
    threshold: o.threshold,
    timeLimit: o.timeLimit,
    trainingNode: trainingNode,
    active: active,
    guard: o.guard,
    createdAt: createdAt,
    modifiedAt: modifiedAt,
    activityAt: activityAt
  }


bucketRoundResponseToBucketRoundRequest :: BucketRoundResponse -> BucketRoundRequest
bucketRoundResponseToBucketRoundRequest  (BucketRoundResponse o) =
  BucketRoundRequest {
    trainingStyles: o.trainingStyles,
    threshold: o.threshold,
    timeLimit: o.timeLimit,
    guard: o.guard
  }


bucketNodeRequestToBucketNodeResponse :: Int -> Int -> Int -> Int -> Int -> Int -> String -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> BucketNodeRequest -> BucketNodeResponse
bucketNodeRequestToBucketNodeResponse id userId bucketId leuronId timeLimit timeLimitExceeded style active guard createdAt modifiedAt (BucketNodeRequest o) =
  BucketNodeResponse {
    id: id,
    userId: userId,
    bucketId: bucketId,
    leuronId: leuronId,
    timeLimit: timeLimit,
    timeLimitExceeded: timeLimitExceeded,
    style: style,
    active: active,
    guard: guard,
    createdAt: createdAt,
    modifiedAt: modifiedAt
  }


bucketNodeResponseToBucketNodeRequest :: Int -> BucketNodeResponse -> BucketNodeRequest
bucketNodeResponseToBucketNodeRequest requestGuard (BucketNodeResponse o) =
  BucketNodeRequest {
    requestGuard: requestGuard
  }


idRequestToIdResponse :: Int -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> IdRequest -> IdResponse
idRequestToIdResponse id userId createdAt modifiedAt activityAt (IdRequest o) =
  IdResponse {
    id: id,
    userId: userId,
    targetId: o.targetId,
    guard: o.guard,
    createdAt: createdAt,
    modifiedAt: modifiedAt,
    activityAt: activityAt
  }


idResponseToIdRequest :: IdResponse -> IdRequest
idResponseToIdRequest  (IdResponse o) =
  IdRequest {
    targetId: o.targetId,
    guard: o.guard
  }


leuronRequestToLeuronResponse :: Int -> Int -> Int -> String -> Boolean -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> LeuronRequest -> LeuronResponse
leuronRequestToLeuronResponse id userId resourceId checksum active createdAt modifiedAt activityAt (LeuronRequest o) =
  LeuronResponse {
    id: id,
    userId: userId,
    resourceId: resourceId,
    dataP: o.dataP,
    title: o.title,
    description: o.description,
    section: o.section,
    page: o.page,
    examples: o.examples,
    strengths: o.strengths,
    categories: o.categories,
    splits: o.splits,
    substitutions: o.substitutions,
    tags: o.tags,
    style: o.style,
    checksum: checksum,
    active: active,
    guard: o.guard,
    createdAt: createdAt,
    modifiedAt: modifiedAt,
    activityAt: activityAt
  }


leuronResponseToLeuronRequest :: LeuronResponse -> LeuronRequest
leuronResponseToLeuronRequest  (LeuronResponse o) =
  LeuronRequest {
    dataP: o.dataP,
    title: o.title,
    description: o.description,
    section: o.section,
    page: o.page,
    examples: o.examples,
    strengths: o.strengths,
    categories: o.categories,
    splits: o.splits,
    substitutions: o.substitutions,
    tags: o.tags,
    style: o.style,
    guard: o.guard
  }


leuronTrainingRequestToLeuronTrainingResponse :: Int -> Int -> Int -> (Maybe Date) -> (Maybe Date) -> LeuronTrainingRequest -> LeuronTrainingResponse
leuronTrainingRequestToLeuronTrainingResponse id userId leuronId createdAt modifiedAt (LeuronTrainingRequest o) =
  LeuronTrainingResponse {
    id: id,
    userId: userId,
    leuronId: leuronId,
    summary: o.summary,
    guard: o.guard,
    createdAt: createdAt,
    modifiedAt: modifiedAt
  }


leuronTrainingResponseToLeuronTrainingRequest :: LeuronTrainingResponse -> LeuronTrainingRequest
leuronTrainingResponseToLeuronTrainingRequest  (LeuronTrainingResponse o) =
  LeuronTrainingRequest {
    summary: o.summary,
    guard: o.guard
  }


leuronNodeRequestToLeuronNodeResponse :: Int -> Int -> Int -> TrainingNode -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> LeuronNodeRequest -> LeuronNodeResponse
leuronNodeRequestToLeuronNodeResponse id userId leuronId trainingNode active guard createdAt modifiedAt (LeuronNodeRequest o) =
  LeuronNodeResponse {
    id: id,
    userId: userId,
    leuronId: leuronId,
    trainingNode: trainingNode,
    active: active,
    guard: guard,
    createdAt: createdAt,
    modifiedAt: modifiedAt
  }


leuronNodeResponseToLeuronNodeRequest :: Int -> LeuronNodeResponse -> LeuronNodeRequest
leuronNodeResponseToLeuronNodeRequest requestGuard (LeuronNodeResponse o) =
  LeuronNodeRequest {
    requestGuard: requestGuard
  }


profileRequestToProfileResponse :: Int -> Ent -> Int -> Int -> Int -> (Maybe Date) -> (Maybe Date) -> ProfileRequest -> ProfileResponse
profileRequestToProfileResponse id ent entId karmaGood karmaBad createdAt modifiedAt (ProfileRequest o) =
  ProfileResponse {
    id: id,
    ent: ent,
    entId: entId,
    gender: o.gender,
    birthdate: o.birthdate,
    website: o.website,
    location: o.location,
    signature: o.signature,
    debug: o.debug,
    karmaGood: karmaGood,
    karmaBad: karmaBad,
    guard: o.guard,
    createdAt: createdAt,
    modifiedAt: modifiedAt
  }


profileResponseToProfileRequest :: (Array String) -> (Maybe String) -> ProfileResponse -> ProfileRequest
profileResponseToProfileRequest websites stateWebsites (ProfileResponse o) =
  ProfileRequest {
    gender: o.gender,
    birthdate: o.birthdate,
    website: o.website,
    websites: websites,
    location: o.location,
    signature: o.signature,
    debug: o.debug,
    guard: o.guard,
    stateWebsites: stateWebsites
  }


resourceRequestToResourceResponse :: Int -> Int -> String -> Boolean -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> ResourceRequest -> ResourceResponse
resourceRequestToResourceResponse id userId name active createdAt modifiedAt activityAt (ResourceRequest o) =
  ResourceResponse {
    id: id,
    userId: userId,
    name: name,
    displayName: o.displayName,
    description: o.description,
    source: o.source,
    author: o.author,
    prerequisites: o.prerequisites,
    categories: o.categories,
    visibility: o.visibility,
    counter: o.counter,
    version: o.version,
    urls: o.urls,
    icon: o.icon,
    tags: o.tags,
    active: active,
    guard: o.guard,
    createdAt: createdAt,
    modifiedAt: modifiedAt,
    activityAt: activityAt
  }


resourceResponseToResourceRequest :: ResourceResponse -> ResourceRequest
resourceResponseToResourceRequest  (ResourceResponse o) =
  ResourceRequest {
    displayName: o.displayName,
    description: o.description,
    source: o.source,
    author: o.author,
    prerequisites: o.prerequisites,
    categories: o.categories,
    visibility: o.visibility,
    counter: o.counter,
    version: o.version,
    urls: o.urls,
    icon: o.icon,
    tags: o.tags,
    guard: o.guard
  }


userRequestToUserResponse :: Int -> String -> String -> (Maybe String) -> (Maybe Date) -> (Maybe String) -> (Maybe Date) -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> (Maybe Date) -> UserRequest -> UserResponse
userRequestToUserResponse id name emailMD5 githubIdent githubCreatedAt googleIdent googleCreatedAt active guard createdAt modifiedAt deactivatedAt activityAt (UserRequest o) =
  UserResponse {
    id: id,
    name: name,
    displayName: o.displayName,
    fullName: o.fullName,
    email: o.email,
    emailMD5: emailMD5,
    plugin: o.plugin,
    githubIdent: githubIdent,
    githubCreatedAt: githubCreatedAt,
    googleIdent: googleIdent,
    googleCreatedAt: googleCreatedAt,
    acceptTOS: o.acceptTOS,
    active: active,
    guard: guard,
    createdAt: createdAt,
    modifiedAt: modifiedAt,
    deactivatedAt: deactivatedAt,
    activityAt: activityAt
  }


userResponseToUserRequest :: UserResponse -> UserRequest
userResponseToUserRequest  (UserResponse o) =
  UserRequest {
    displayName: o.displayName,
    fullName: o.fullName,
    email: o.email,
    plugin: o.plugin,
    acceptTOS: o.acceptTOS
  }


userRequestToUserSanitizedResponse :: Int -> String -> String -> Boolean -> Int -> (Maybe Date) -> (Maybe Date) -> UserRequest -> UserSanitizedResponse
userRequestToUserSanitizedResponse id name emailMD5 active guard createdAt activityAt (UserRequest o) =
  UserSanitizedResponse {
    id: id,
    name: name,
    displayName: o.displayName,
    emailMD5: emailMD5,
    active: active,
    guard: guard,
    createdAt: createdAt,
    activityAt: activityAt
  }


userSanitizedResponseToUserRequest :: String -> String -> String -> (Maybe Date) -> UserSanitizedResponse -> UserRequest
userSanitizedResponseToUserRequest fullName email plugin acceptTOS (UserSanitizedResponse o) =
  UserRequest {
    displayName: o.displayName,
    fullName: fullName,
    email: email,
    plugin: plugin,
    acceptTOS: acceptTOS
  }


simpleStringRequestToSimpleStringResponse :: String -> SimpleStringRequest -> SimpleStringResponse
simpleStringRequestToSimpleStringResponse simpleStringResponse (SimpleStringRequest o) =
  SimpleStringResponse {
    simpleStringResponse: simpleStringResponse
  }


simpleStringsRequestToSimpleStringsResponse :: (Array String) -> SimpleStringsRequest -> SimpleStringsResponse
simpleStringsRequestToSimpleStringsResponse simpleStringsResponse (SimpleStringsRequest o) =
  SimpleStringsResponse {
    simpleStringsResponse: simpleStringsResponse
  }



-- footer