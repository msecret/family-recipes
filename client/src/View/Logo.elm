module View.Logo exposing (view)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, src)
import View.Grid exposing (..)

view : Html msg
view =
    div [ ]
      [
        img [ src "img/logo.png" ] []
      ]
