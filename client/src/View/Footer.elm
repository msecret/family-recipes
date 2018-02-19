module View.Footer exposing (..)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, src)
import View.Logo as Logo
import Style.Theme exposing (..)


type alias Model =
    {}


view : Html msg
view =
    footer [ css [ backgroundColor colors.secondary ] ]
        [ Logo.view ]
