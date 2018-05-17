module Main exposing (..)

import GraphQL.Request.Builder exposing (..)
import GraphQL.Client.Http as GraphQLClient
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Navigation exposing (..)
import Types.Categories exposing (..)
import Types.Cook exposing (Cook, cookQueryRequest)
import Route exposing (..)
import Msgs exposing (Msg)
import View.Header as Header
import View.Footer as Footer
import View.Wrap as Wrap
import Task exposing (Task)


main =
    Navigation.program Msgs.OnLocationChange
        { init = init
        , view = view >> toUnstyled
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { route : Route
    }


sendQueryRequest : Request Query a -> Task GraphQLClient.Error a
sendQueryRequest request =
    GraphQLClient.sendQuery "http://localhost:4000/graphql" request


sendCookQuery : Cmd Msg
sendCookQuery =
    sendQueryRequest cookQueryRequest
        |> Task.attempt Msgs.ReceiveQueryResponse


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
        ( initialModel currentRoute, sendCookQuery )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, sendCookQuery )

        Msgs.LinkTo newRoute ->
            ( { model | route = newRoute }, Cmd.none )

        Msgs.ReceiveQueryResponse res ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ Header.view
        , Wrap.view (renderWrap model)
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
        main_ [] [ pageContent ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
