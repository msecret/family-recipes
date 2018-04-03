module View.Logo exposing (view, viewInverse)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, src)
import View.Grid exposing (..)


view : Html msg
view =
    div []
        [ img [ src "img/logo.png" ] []
        ]


viewInverse : Html msg
viewInverse =
    div []
        [ img [ src "img/logo-inverse.png" ] []
        ]
