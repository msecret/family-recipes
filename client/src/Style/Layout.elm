module Style.Layout exposing (..)

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
