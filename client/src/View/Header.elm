module View.Header exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Types.Categories exposing (categories, CategoryList)
import Types.Page as Page
import View.Logo as Logo


type alias Model =
    { categories : CategoryList }


initialModel : Model
initialModel =
    { categories = categories
    }


type Msg
    = GoTo Page
    | LinkTo String


view : Model -> Html msg
view model =
    header []
        [ div []
            [ Logo.view
            ]
        , div []
            [ render_menu model ]
        ]


render_menu : Model -> Html msg
render_menu model =
    ul []
        [ Html.map
            (\category ->
                (a [ onClick (LinkTo category.name) ] [ text category.displayName ])
            )
            model.categories
        ]
