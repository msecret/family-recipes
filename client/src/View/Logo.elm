module View.Logo exposing (view)

import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (src)

view : Html msg
view =
    div []
        [ h1 [] [ text "Garibaldi Cirelli Family Cookbook" ]
        , img [ src "public/img/logo.png" ] []
        ]
