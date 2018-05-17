module Msgs exposing (Msg(..))

import GraphQL.Client.Http as GraphQLClient
import Types.Cook exposing (Cook, cookQueryRequest)
import Navigation exposing (Location)
import Route exposing (Route)


type alias CookResponse =
    Result GraphQLClient.Error Cook


type Msg
    = OnLocationChange Location
    | LinkTo Route
    | ReceiveQueryResponse CookResponse
