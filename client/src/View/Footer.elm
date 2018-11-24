module View.Footer exposing (Model, view)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Msgs exposing (Msg)
import Route exposing (..)
import Style.Components exposing (hR)
import Style.Theme exposing (..)
import Style.Typography as Typography
import Style.Util exposing (capitalCase)
import Types.Categories exposing (..)
import View.Grid exposing (..)
import View.Logo as Logo
import View.Wrap as Wrap


type alias Model =
    {}


renderMenu : CategoryList -> Html msg
renderMenu categories =
    ul
        [ css
            [ alignItems center
            , displayFlex
            , flexFlow2 row wrap
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
            , padding2 (px 0) (px 9)
            ]
        ]
        [ a [ href link, css [ Typography.nav, color colors.white ] ]
            [ text (capitalCase (categoryToString (Just category))) ]
        ]


view : Html msg
view =
    footer
        [ css
            [ marginTop (px 50) ]
        ]
        [ div [ css [ hR, marginBottom (px 2) ] ] []
        , div
            [ css
                [ backgroundColor colors.tertiary
                , maxHeight (Css.em 6)
                , padding2 (Css.em 2) (Css.em 0)
                ]
            ]
            [ div
                [ css [ grid ]
                ]
                [ div [ css [ gcol 2 ] ] []
                , div [ css [ gcol 8, offset 2 ] ]
                    [ renderMenu categories
                    ]
                ]
            , p
                [ css
                    [ textAlign center
                    , marginTop (px 50)
                    , fontSize (toEm 12)
                    , color colors.white
                    ]
                ]
                [ text "© Marco Segreto" ]
            ]
        ]
