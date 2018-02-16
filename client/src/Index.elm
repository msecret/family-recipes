module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Navigation exposing (..)
import Types.Categories exposing (..)
import Route exposing (..)
import Msgs exposing (Msg)
import View.Header as Header
import View.Footer as Footer


main =
    Navigation.program Msgs.OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { route : Route
    }


initialModel : Route -> Model
initialModel route =
    { route = route
    }


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            parseLocation location
    in
        ( initialModel currentRoute, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )

        Msgs.LinkTo newRoute ->
            ( { model | route = newRoute }, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ h1 [] [ text "Family recipes" ]
            , Header.view
            , renderWrap model
            ]
        , Footer.view
        ]


renderWrap : Model -> Html Msg
renderWrap model =
    let
        pageContent =
            case model.route of
                HomeRoute ->
                    text "Home"

                CookRoute id ->
                    text ("Cook " ++ cookIdToString id)

                RecipesRoute category ->
                    let
                        _ =
                            Debug.log "recipes" category
                    in
                        text ("Recipes " ++ (categoryToString category))

                RecipeRoute id ->
                    text ("Recipe " ++ recipeIdToString id)

                AboutRoute ->
                    text "About"

                NotFoundRoute ->
                    text "Not found"
    in
        div [] [ pageContent ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
