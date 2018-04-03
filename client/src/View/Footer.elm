module View.Footer exposing (..)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Route exposing (..)
import View.Grid exposing (..)
import View.Logo as Logo
import View.Wrap as Wrap
import Style.Theme exposing (..)
import Style.Typography as Typography


type alias Model =
    {}


view : Html msg
view =
    footer
        [ css
            [ backgroundColor colors.secondary
            , maxHeight (Css.em 6)
            , padding2 (Css.em 2) (Css.em 0)
            ]
        ]
        [ div
            [ css [ grid ]
            ]
            [ div [ css [ (gcol 2), (offset 1) ] ]
                [ Logo.viewInverse
                ]
            , div [ css [ (gcol 2), (offset 1) ] ]
                [ h4 [ css [ Typography.h4, Typography.offColor ] ]
                    [ text "About the site"
                    ]
                , a [ href (getUrl AboutRoute), css [ Typography.footerNav ] ]
                    [ text "The Story" ]
                ]
            , div [ css [ (gcol 3), (offset 1) ] ]
                [ h4 [ css [ Typography.h4, Typography.offColor ] ]
                    [ text "Recipes by Type"
                    ]
                ]
            , div [ css [ (gcol 2) ] ]
                [ h4 [ css [ Typography.h4, Typography.offColor ] ]
                    [ text "Share"
                    ]
                ]
            ]
        ]
