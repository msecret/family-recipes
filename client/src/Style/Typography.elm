module Style.Typography exposing (..)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, src)
import Style.Theme exposing (..)


toEm val =
    Css.em (val / baseLine)


nav : Style
nav =
    Css.batch
        [ color colors.black
        , fontFamilies sansFamily
        , fontSize (toEm 15)
        , fontWeight bolder
        , textDecoration none
        ]
