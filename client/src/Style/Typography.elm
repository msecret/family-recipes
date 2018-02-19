module Style.Typography exposing (..)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, src)


-- Move to vars section


baseline =
    16.0


toEm val =
    Css.em (val / baseline)


sansFamily =
    [ (qt "Montserrat"), .value sansSerif ]


nav : Style
nav =
    Css.batch
        [ fontFamilies sansFamily
        , fontSize (toEm 15)
        , textDecoration none
        ]
