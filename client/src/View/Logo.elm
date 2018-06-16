module View.Logo exposing (view, viewInverse)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, src)
import View.Grid exposing (..)


view : Html msg
view =
    div []
        [ img [ src "https://s3-us-west-1.amazonaws.com/family-recipes/logo.png" ] []
        ]


viewInverse : Html msg
viewInverse =
    div []
        [ img [ src "img/logo-inverse.png" ] []
        ]
