module View.Header exposing (view, renderMenuLink)

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
import Types.Page as Page
import View.Grid exposing (..)
import View.Logo as Logo
import Style.Typography as Typography


view : Html Msg
view =
    header [ css [ grid ] ]
        [ div [ css [ (gcol 2) ] ]
            [ Logo.view
            ]
        , div [ css [ (offset 2) ] ] []
        , div [ css [ (gcol 8) ] ]
            [ renderMenu categories
            ]
        ]


renderMenu : CategoryList -> Html Msg
renderMenu categories =
    ul
        [ css
            [ alignItems center
            , displayFlex
            , flexFlow2 row wrap
            , height (pct 100)
            , justifyContent spaceBetween
            , listStyle none
            , margin (px 0)
            , padding (px 0)
            ]
        ]
        (List.map renderMenuLink categories)


renderMenuLink : Category -> Html msg
renderMenuLink category =
    let
        link =
            (getUrl (RecipesRoute (Just (category))))
    in
        li
            [ css
                [ display inlineBlock
                ]
            ]
            [ a [ href link, css [ Typography.nav ] ]
                [ text (capitalCase (categoryToString (Just category))) ]
            ]


capitalCase : String -> String
capitalCase str =
    case (uncons str) of
        Just ( f, rest ) ->
            cons (toUpper f) rest

        Nothing ->
            ""
