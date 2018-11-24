module View.Header exposing (renderMenuLink, view)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)
import Msgs exposing (Msg)
import Route exposing (..)
import String exposing (cons, uncons)
import Style.Typography as Typography
import Style.Util exposing (capitalCase)
import Types.Categories exposing (..)
import View.Grid exposing (..)
import View.Logo as Logo


view : Html Msg
view =
    header [ css [ grid ] ]
        [ div [ css [ gcol 2 ] ]
            [ Logo.view
            ]
        , div [ css [ offset 2 ] ] []
        , div [ css [ gcol 8 ] ]
            [ renderMenu categories
            ]
        ]



-- TODO move to nav


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
            getUrl (RecipesRoute (Just category))
    in
    li
        [ css
            [ display inlineBlock
            , backgroundImage (url "https://s3-us-west-1.amazonaws.com/family-recipes/nav-bg.svg")
            , backgroundRepeat noRepeat
            , backgroundPosition2 (pct 100) (pct 100)
            , height (px 26)
            , padding2 (px 0) (px 9)
            ]
        ]
        [ a [ href link, css [ Typography.nav ] ]
            [ text (capitalCase (categoryToString (Just category))) ]
        ]
