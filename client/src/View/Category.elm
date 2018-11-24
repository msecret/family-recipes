module View.Category exposing (categoryBgView)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (alt, class, css, href, property, src)
import Style.Layout as L
import Style.Theme exposing (..)


categoryBgView : String -> Style
categoryBgView category =
    Css.batch
        [ L.container
        , backgroundImage (url ("https://s3-us-west-1.amazonaws.com/family-recipes/bg-" ++ category ++ ".svg"))
        , backgroundRepeat repeatX
        , backgroundSize (pct 15)
        , top (pct 32)
        , position relative
        , height (px 30)
        ]
