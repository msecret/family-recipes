module Style.Sheets exposing (stylesheets, view)

import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Msgs exposing (Msg)


fonts =
    node "link"
        [ rel "stylesheet"
        , type_ "text/css"
        , href "https://fonts.googleapis.com/css?family=Dancing+Script:700|Montserrat:300,700,800|Rufina"
        ]
        []


stylesheets =
    [ fonts ]


view : Html Msg
view =
    div []
        (List.map (\stylesheet -> div [] [ stylesheet ]) stylesheets)
