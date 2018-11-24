module Style.Components exposing (hR, list, primaryButton, rButton, secondaryButton, tertiaryButton)

import Css exposing (..)
import Css.Foreign exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, src)
import Style.Theme exposing (..)
import Style.Typography as Typo


hR =
    Css.batch
        [ backgroundImage (url "https://s3-us-west-1.amazonaws.com/family-recipes/hr-green.svg")
        , borderWidth (toEm 0)
        , height (toEm 8)
        , marginBottom (toEm 30)
        , width (pct 100)
        ]


list =
    Css.batch
        [ marginRight (toEm 0)
        , marginLeft (toEm 0)
        , paddingLeft (toEm 16)
        ]


rButton =
    Css.batch
        [ Typo.displaySm
        , backgroundColor colors.secondary
        , border3 (px 2) solid colors.secondary
        , color colors.white
        , borderRadius4 (px 0) (px 7) (px 7) (px 7)
        , fontWeight (int 500)
        , padding2 (toEm 6) (toEm 24)
        , position relative
        , textTransform uppercase
        , textDecoration none
        , after
            [ property "content" "''"
            , border3 (px 2) solid colors.secondary
            , borderRadius4 (px 0) (px 7) (px 7) (px 7)
            , display block
            , height (calc (pct 100) plus (px 3))
            , position absolute
            , left (px -2)
            , top (px -2)
            , width (calc (pct 100) plus (px 3))
            ]
        , adjacentSiblings
            [ typeSelector "button"
                [ marginLeft (toEm 20)
                ]
            ]
        ]


primaryButton =
    Css.batch
        [ rButton
        , backgroundColor colors.primary
        , borderColor colors.primary
        , after
            [ borderColor colors.primary
            ]
        ]


secondaryButton =
    Css.batch
        [ rButton
        , backgroundColor colors.secondary
        , borderColor colors.secondary
        , after
            [ borderColor colors.secondary
            ]
        ]


tertiaryButton =
    Css.batch
        [ rButton
        , backgroundColor colors.tertiary
        , borderColor colors.tertiary
        , after
            [ borderColor colors.tertiary
            ]
        ]
