module View.Footer exposing (..)

import Html
import Html.Styled exposing (..)
import View.Logo as Logo


type alias Model =
    {}


view : Html msg
view =
    footer []
        [ Logo.view ]
