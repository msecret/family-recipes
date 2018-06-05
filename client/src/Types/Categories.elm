module Types.Categories exposing (..)

import GraphQL.Request.Builder exposing (..)
import String exposing (toLower)


type Category
    = Antipasti
    | Zuppe
    | Primi
    | Secondi
    | Contorni
    | Dolci


type alias CategoryModel =
    { id : Int
    , name : String
    , displayName : String
    , order : Int
    , iconName : String
    }


categoryQuery =
    object CategoryModel
        |> with (field "id" [] int)
        |> with (field "name" [] string)
        |> with (field "displayName" [] string)
        |> with (field "order" [] int)
        |> with (field "iconName" [] string)


categoryToString : Maybe Category -> String
categoryToString category =
    case category of
        Nothing ->
            ""

        Just Antipasti ->
            "antipasti"

        Just Zuppe ->
            "zuppe"

        Just Primi ->
            "primi"

        Just Secondi ->
            "secondi"

        Just Contorni ->
            "contorni"

        Just Dolci ->
            "dolci"


categoryFromString : String -> Maybe Category
categoryFromString category =
    case category of
        "antipasti" ->
            Just Antipasti

        "zuppe" ->
            Just Zuppe

        "primi" ->
            Just Primi

        "secondi" ->
            Just Secondi

        "contorni" ->
            Just Contorni

        "dolci" ->
            Just Dolci

        _ ->
            Nothing


type alias CategoryList =
    List Category


categories : CategoryList
categories =
    [ Antipasti, Zuppe, Primi, Secondi, Contorni, Dolci ]
