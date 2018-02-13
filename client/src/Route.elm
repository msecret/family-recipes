module Route exposing (..)

import Debug
import Navigation exposing (Location)
import UrlParser exposing (..)
import Types.Categories exposing (CategoryName)


type alias CookId =
    Int


type alias RecipeId =
    Int


type Route
    = HomeRoute
    | CookRoute CookId
    | RecipesRoute CategoryName
    | RecipeRoute RecipeId
    | AboutRoute
    | NotFoundRoute


matcher : Parser (Route -> a) a
matcher =
    oneOf
        [ map HomeRoute top
        , map CookRoute (s "cook" </> int)
        , map RecipesRoute (s "recipes" </> string)
        , map RecipeRoute (s "recipe" </> int)
        , map AboutRoute (s "about")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matcher location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
