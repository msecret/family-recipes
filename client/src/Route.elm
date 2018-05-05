module Route
    exposing
        ( cookIdToString
        , getUrl
        , getUrlStart
        , recipeIdToString
        , parseLocation
        , CookId(..)
        , RecipeId(..)
        , Route(..)
        )

import Debug
import Navigation exposing (Location)
import UrlParser exposing (..)
import Types.Categories exposing (..)


type RecipeId
    = RecipeId String


type CookId
    = CookId String


cookIdToString : CookId -> String
cookIdToString (CookId id) =
    id


cookIdParser : Parser (CookId -> a) a
cookIdParser =
    custom "COOKID" (Ok << CookId)


recipeIdToString : RecipeId -> String
recipeIdToString (RecipeId id) =
    id


recipeIdParser : Parser (RecipeId -> a) a
recipeIdParser =
    custom "RECIPEID" (Ok << RecipeId)


optionalCategoryParam : QueryParser (Maybe Category -> b) b
optionalCategoryParam =
    customParam "category" (fromQueryValue)


fromQueryValue : Maybe String -> Maybe Category
fromQueryValue data =
    case data of
        Just data ->
            categoryFromString data

        Nothing ->
            Nothing


type Route
    = HomeRoute
    | CookRoute CookId
    | RecipesRoute (Maybe Category)
    | RecipeRoute RecipeId
    | AboutRoute
    | NotFoundRoute


getUrl : Route -> String
getUrl route =
    let
        pieces =
            case route of
                HomeRoute ->
                    []

                AboutRoute ->
                    [ "about" ]

                CookRoute id ->
                    [ "cook", cookIdToString id ]

                RecipesRoute category ->
                    [ "recipes?category=" ++ categoryToString category ]

                RecipeRoute id ->
                    [ "recipe", recipeIdToString id ]

                NotFoundRoute ->
                    [ "404" ]
    in
        getUrlStart ++ String.join "/" pieces


getUrlStart : String
getUrlStart =
    "/"


matcher : Parser (Route -> a) a
matcher =
    oneOf
        [ map HomeRoute top
        , map CookRoute (s "cook" </> cookIdParser)
        , map RecipesRoute (s "recipes" <?> optionalCategoryParam)
        , map RecipeRoute (s "recipe" </> recipeIdParser)
        , map AboutRoute (s "about")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parsePath matcher location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
