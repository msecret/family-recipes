module View.Logo exposing (..)

import Html exposing (Html, div, h1, text, img)
import Html.Attributes exposing (src)


type alias Model =
    {}


view : Html msg
view =
    div []
        [ h1 [] [ text "Garibaldi Cirelli Family Cookbook" ]
        , img [ src "public/img/logo.png" ] []
        ]
