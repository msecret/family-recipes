module Types.Categories exposing (..)

import String exposing (toLower)


type Category
    = Antipasti
    | Zuppe
    | Primi
    | Secondi
    | Contorni
    | Dolci


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
