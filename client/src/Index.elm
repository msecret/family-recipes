module Recipes exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Navigation exposing (..)
import Route
import View.Footer as Footer


main =
    Navigation.program Route.urlParser
        { init = init
        , view = view
        , update = update
        , urlUpdate = Route.urlUpdate
        , subscriptions = subscriptions
        }



type alias Model =
    { currentPage : Route.Route
    }

initialModel : Route.Route ->  Model
initialModel route =
  { route = route }


init : Route.Route -> ( Model, Cmd Msg )
init route =
  ( initialModel route, Cmd.none)

type Msg
    = GoTo Route.Route
    | LinkTo String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GoTo page ->
            ( { model | currentPage = page }, Cmd.none )

        LinkTo path ->
            ( model, newUrl path )


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ h1 [] [ text "SPA application" ]
            , render_menu model
            , render_page model
            ]
        , Footer.view
        ]


render_menu : Model -> Html Msg
render_menu model =
    div []
        [ button [ onClick (LinkTo "#home") ] [ text "Home" ]
        , button [ onClick (LinkTo "#recipes") ] [ text "Recipes" ]
        , button [ onClick (LinkTo "#about") ] [ text "About" ]
        ]


render_page : Model -> Html Msg
render_page model =
    let
        page_content =
            case model.currentPage of
                Home ->
                    text "Home"

                Recipes ->
                    text "Recipes"

                About ->
                    text "About"
    in
        div [] [ page_content ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
