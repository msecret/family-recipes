module Main exposing (..)

import GraphQL.Request.Builder exposing (..)
import GraphQL.Client.Http as GraphQLClient
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Navigation exposing (..)
import Types.Categories exposing (..)
import Types.Recipe exposing (Recipe, recipeQueryRequest, RecipeResponse)
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
    , recipe : Maybe RecipeResponse
    }


sendQueryRequest : Request Query a -> Task GraphQLClient.Error a
sendQueryRequest request =
    GraphQLClient.sendQuery "http://localhost:4000/graphql" request


sendRecipeQuery : RecipeId -> Cmd Msg
sendRecipeQuery id =
    sendQueryRequest (recipeQueryRequest id)
        |> Task.attempt Msgs.ReceiveRecipeResponse


initialModel : Route -> Model
initialModel route =
    { route = route
    , recipe = Nothing
    }


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            parseLocation location
    in
        case currentRoute of
            HomeRoute ->
                ( initialModel currentRoute, Cmd.none )

            CookRoute id ->
                ( initialModel currentRoute, Cmd.none )

            RecipesRoute category ->
                ( initialModel currentRoute, Cmd.none )

            RecipeRoute id ->
                ( initialModel currentRoute, sendRecipeQuery id )

            AboutRoute ->
                ( initialModel currentRoute, Cmd.none )

            NotFoundRoute ->
                ( initialModel currentRoute, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                case newRoute of
                    HomeRoute ->
                        ( { model | route = newRoute }, Cmd.none )

                    CookRoute id ->
                        ( { model | route = newRoute }, Cmd.none )

                    RecipesRoute category ->
                        ( { model | route = newRoute }, Cmd.none )

                    RecipeRoute id ->
                        ( { model | route = newRoute }, sendRecipeQuery id )

                    AboutRoute ->
                        ( { model | route = newRoute }, Cmd.none )

                    NotFoundRoute ->
                        ( { model | route = newRoute }, Cmd.none )

        Msgs.LinkTo newRoute ->
            ( { model | route = newRoute }, Cmd.none )

        Msgs.ReceiveRecipeResponse res ->
            let
                log =
                    Debug.log "fuckfuckfuckfuck"
            in
                ( { model | recipe = Just res }, Cmd.none )


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
