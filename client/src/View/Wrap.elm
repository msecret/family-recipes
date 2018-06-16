module View.Wrap exposing (view)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src, class)
import Msgs exposing (Msg)
import Style.Theme exposing (..)


view : Html msg -> Html msg
view content =
    div
        [ class "main"
        , css
            [ margin2 (Css.em 1) (auto)
            , maxWidth (px wrapWidth)
            , width (pct 100)
            ]
        ]
        [ content
        ]
