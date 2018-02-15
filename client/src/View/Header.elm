module View.Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (href)
import Html.Events exposing (onClick)
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
    div [] (List.map renderMenuLink categories)


renderMenuLink : Category -> Html msg
renderMenuLink category =
    let
        link =
            (getUrl (RecipesRoute (Just (category))))
    in
        li []
            [ a [ href link ] [ text (categoryToString (Just category)) ]
            ]
