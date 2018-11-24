module Msgs exposing (Msg(..))

import Types.Recipe exposing (Recipe, RecipeResponse, RecipesResponse)
import GraphQL.Client.Http as GraphQLClient
import Types.Cook exposing (Cook, cookQueryRequest)
import Navigation exposing (Location)
import Route exposing (Route)


type Msg
    = OnLocationChange Location
    | LinkTo Route
    | ReceiveRecipeResponse RecipeResponse
    | ReceiveRecipesResponse RecipesResponse
