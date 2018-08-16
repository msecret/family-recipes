module Style.Layout exposing (..)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, src)
import Style.Theme exposing (..)


fullWidth : Style
fullWidth =
    Css.batch
        [ backgroundImage (url "https://s3-us-west-1.amazonaws.com/family-recipes/cloth_main.svg")
        , height (toEm 600)
        , left (pct 50)
        , marginLeft (vw -50)
        , marginRight (vw -50)
        , position relative
        , right (pct 50)
        , width (vw 100)
        ]
