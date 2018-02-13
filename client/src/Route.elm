module Route exposing (..)

import Debug
import Navigation
import UrlParser exposing (..)
import Types.Categories as Categories


type alias Url =
    String


type CookId
    = Int


type RecipeId
    = Int


type Route
    = HomeRoute
    | CookRoute CookId
    | RecipesRoute Categories.CategoryName
    | RecipeRoute RecipeId
    | AboutRoute
    | NotFoundRoute


type alias Model =
    { currentRoute : Route
    }


homeParser : Parser a a
homeParser =
    oneOf
        [ (s "index.html")
        , (s "")
        ]

cookParser : Parser (Int -> a) a
cookParser =
    s "cook" </> int


recipesParser : Parser (String -> a) a
recipesParser =
    s "recipes" </> string


recipeParser : Parser (Int -> a) a
recipeParser =
    s "recipe" </> int


aboutParser : Parser a a
aboutParser =
    s "about"

routeParser : Parser (Route -> a) a
routeParser =
  oneOf
    [ format HomeRoute homeParser
    , format CookRoute cookParser
    , format RecipesRoute recipesParser
    , format RecipeRoute recipeParser
    , format AboutRoute aboutParser
]


parse : Navigation.Location -> Route
parse { pathname } =
    let
        path =
            if String.startsWith "/" pathname then
                String.dropLeft 1 pathname
            else
                pathname
    in
        case UrlParser.parse identity routeParser path of
            Err err ->
                NotFound

            Ok route ->
                route

urlParser : Navigation.Parser Route
urlParser =
  Navigation.makeParser parse

urlUpdate : Route -> Model -> (Model, Cmd Msg)
urlUpdate route model =
  ({ model | route = route }, Cmd.none)



type Msg
  = GoTo Route
    LinkTo String
