module Style.Util exposing (capitalCase, unformattedList, visuallyHide)

import Char exposing (toUpper)
import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, src)
import String exposing (cons, uncons)


visuallyHide =
    Css.batch
        [ position absolute
        , height (px 1)
        , left (px -999999)
        , overflow hidden
        , top auto
        , width (px 1)
        ]


unformattedList =
    Css.batch
        [ marginBottom (px 0)
        , marginTop (px 0)
        , marginLeft (px 0)
        , paddingLeft (px 0)
        ]


capitalCase : String -> String
capitalCase str =
    case uncons str of
        Just ( f, rest ) ->
            cons (toUpper f) rest

        Nothing ->
            ""
