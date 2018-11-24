module Main exposing (Model, init, initialModel, main, renderWrap, sendQueryRequest, sendRecipeQuery, sendRecipesQuery, subscriptions, update, view)

import GraphQL.Client.Http as GraphQLClient
import GraphQL.Request.Builder exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Msgs exposing (Msg)
import Navigation exposing (..)
import Route exposing (..)
import Style.Sheets as Sheets
import Task exposing (Task)
import Types.Categories exposing (..)
import Types.Cook exposing (Cook, cookQueryRequest)
import Types.Recipe exposing (Recipe, RecipeResponse, recipeQueryRequest, recipesByCategoryQueryRequest)
import View.Footer as Footer
import View.Header as Header
import View.Recipe as RecipePage
import View.Recipes as RecipesPage
import View.Wrap as Wrap


main =
    Navigation.program Msgs.OnLocationChange
        { init = init
        , view = view >> toUnstyled
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { route : Route
    , recipe : Maybe Recipe
    , recipes : Maybe (List Recipe)
    }


sendQueryRequest : Request Query a -> Task GraphQLClient.Error a
sendQueryRequest request =
    GraphQLClient.sendQuery "http://localhost:4000/graphql" request


sendRecipeQuery : RecipeId -> Cmd Msg
sendRecipeQuery id =
    sendQueryRequest (recipeQueryRequest id)
        |> Task.attempt Msgs.ReceiveRecipeResponse


sendRecipesQuery : Maybe Category -> Cmd Msg
sendRecipesQuery category =
    sendQueryRequest (recipesByCategoryQueryRequest (categoryToString category))
        |> Task.attempt Msgs.ReceiveRecipesResponse


initialModel : Route -> Model
initialModel route =
    { route = route
    , recipe = Nothing
    , recipes = Nothing
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
            ( initialModel currentRoute, sendRecipesQuery category )

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
            case res of
                Ok result ->
                    ( { model | recipe = Just result }, Cmd.none )

                Err err ->
                    let
                        dd1 =
                            Debug.log "Recipe response error: " err
                    in
                    ( { model | recipe = Nothing }, Cmd.none )

        Msgs.ReceiveRecipesResponse res ->
            case res of
                Ok result ->
                    ( { model | recipes = Just result }, Cmd.none )

                Err err ->
                    let
                        dd1 =
                            Debug.log "Recipes response error: " err
                    in
                    ( { model | recipes = Nothing }, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ Sheets.view
        , Header.view
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
                    case model.recipes of
                        Just recipes ->
                            RecipesPage.view (categoryToString category) recipes

                        Nothing ->
                            text "No recipes found"

                RecipeRoute id ->
                    case model.recipe of
                        Just recipe ->
                            RecipePage.view recipe

                        Nothing ->
                            text ""

                AboutRoute ->
                    text "About"

                NotFoundRoute ->
                    text "Not found"
    in
    main_ [] [ pageContent ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
