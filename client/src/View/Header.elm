module View.Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (href)
import Html.Events exposing (onClick)
import Char exposing (toUpper)
import String exposing (uncons, cons)
import Msgs exposing (Msg)
import Route exposing (..)
import Types.Categories exposing (..)
import Types.Page as Page
import View.Logo as Logo


view : Html Msg
view =
    header []
        [ div []
            [ Logo.view
            , renderMenu categories
            ]
        ]


renderMenu : CategoryList -> Html Msg
renderMenu categories =
    ul [] (List.map renderMenuLink categories)


renderMenuLink : Category -> Html msg
renderMenuLink category =
    let
        link =
            (getUrl (RecipesRoute (Just (category))))
    in
        li []
            [ a [ href link ]
                [ text (capitalCase (categoryToString (Just category))) ]
            ]


capitalCase : String -> String
capitalCase str =
    case (uncons str) of
        Just ( f, rest ) ->
            cons (toUpper f) rest

        Nothing ->
            ""
