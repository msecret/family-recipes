module View.Nav exposing (renderLinks)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)
import Char exposing (toUpper)
import String exposing (uncons, cons)
import Msgs exposing (Msg)
import Route exposing (..)
import Types.Categories exposing (..)
import View.Grid exposing (..)
import View.Logo as Logo
import Style.Typography as Typography


renderLinks : CategoryList -> Style -> Html Msg
renderLinks categories linkStyle =
    ul
        [ css
            [ displayFlex
            , height (pct 100)
            , listStyle none
            , margin (px 0)
            , padding (px 0)
            ]
        ]
        (List.map renderMenuLink categories)


renderMenuLink : Category -> Style -> Html msg
renderMenuLink category linkStyle =
    let
        link =
            (getUrl (RecipesRoute (Just (category))))
    in
        li
            [ css
                [ display inlineBlock
                ]
            ]
            [ a [ href link, css [ linkStyle ] ]
                [ text (capitalCase (categoryToString (Just category))) ]
            ]


capitalCase : String -> String
capitalCase str =
    case (uncons str) of
        Just ( f, rest ) ->
            cons (toUpper f) rest

        Nothing ->
            ""
