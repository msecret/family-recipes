module Style.Layout exposing (container, fullWidth)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, src)
import Style.Theme exposing (..)


fullWidth : Style
fullWidth =
    Css.batch
        [ height (toEm 619)
        , left (pct 50)
        , marginLeft (vw -50)
        , marginRight (vw -50)
        , position relative
        , right (pct 50)
        , width (vw 100)
        ]


container : Style
container =
    Css.batch
        [ marginLeft auto
        , marginRight auto
        , maxWidth (px wrapWidth)
        , width (pct 100)
        ]
