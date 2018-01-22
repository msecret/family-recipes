module Recipes exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Navigation exposing (..)


main =
    Navigation.program locFor
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type Page
    = Home
    | Recipes
    | About


type alias Model =
    { currentPage : Page
    }


init : Location -> ( Model, Cmd Msg )
init location =
    let
        page =
            case location.hash of
                "#home" ->
                    Home

                "#recipes" ->
                    Recipes

                "#about" ->
                    About

                _ ->
                    Home
    in
        ( Model Home, Cmd.none )


locFor : Location -> Msg
locFor location =
    case location.hash of
        "#home" ->
            GoHome

        "#recipes" ->
            GoRecipes

        "#about" ->
            GoAbout

        _ ->
            GoHome


type Msg
    = GoHome
    | GoRecipes
    | GoAbout
    | LinkTo String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GoHome ->
            ( { model | currentPage = Home }, Cmd.none )

        GoRecipes ->
            ( { model | currentPage = Recipes }, Cmd.none )

        GoAbout ->
            ( { model | currentPage = About }, Cmd.none )

        LinkTo path ->
            ( model, newUrl path )


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "SPA application" ]
        , render_menu model
        , render_page model
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
