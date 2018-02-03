module View.Footer exposing (..)

import Html exposing (..)
import View.Logo as Logo


type alias Model =
    {}


view : Html msg
view =
    footer []
        [ Logo.view ]
