module Style.Util exposing (..)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, src)


visuallyHide =
    Css.batch
        [ position absolute
        , height (px 1)
        , left (px -999999)
        , overflow hidden
        , top auto
        , width (px 1)
        ]
