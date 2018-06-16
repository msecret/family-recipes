module Style.Theme exposing (..)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, src)


toEm val =
    Css.em (val / baseLine)


baseLine =
    16.0


wrapWidth =
    1015


sansFamily =
    [ (qt "Montserrat"), .value sansSerif ]


serifFamily =
    [ (qt "Rufina"), .value sansSerif ]


decorativeFamily =
    [ (qt "Dancing Script"), .value sansSerif ]


colors :
    { black : Color
    , primary : Color
    , secondary : Color
    , tertiary : Color
    , highlight : Color
    , white : Color
    }
colors =
    { primary = hex "CC4021"
    , secondary = hex "029053"
    , tertiary = hex "2A8C87"
    , highlight = hex "D4B200"
    , black = hex "292929"
    , white = hex "ffffff"
    }


spacing =
    { section = 45
    }
