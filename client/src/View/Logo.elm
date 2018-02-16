module View.Logo exposing (view)

import Html exposing (Html, div, h1, text, img)
import Html.Attributes exposing (src)


view : Html msg
view =
    div []
        [ h1 [] [ text "Garibaldi Cirelli Family Cookbook" ]
        , img [ src "public/img/logo.png" ] []
        ]
