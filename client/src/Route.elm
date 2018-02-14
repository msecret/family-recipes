module Route exposing (..)

import Debug
import Navigation exposing (Location)
import UrlParser exposing (..)
import Types.Categories exposing (CategoryName)


type RecipeId
    = RecipeId String


type CookId
    = CookId String


type CategoryName
    = CategoryName String


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


categoryNameToString : CategoryName -> String
categoryNameToString (CategoryName name) =
    name


categoryNameParser : Parser (CategoryName -> a) a
categoryNameParser =
    custom "CATEGORYNAME" (Ok << CategoryName)


type Route
    = HomeRoute
    | CookRoute CookId
    | RecipesRoute CategoryName
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
                    [ "recipes?name=" ++ categoryNameToString category ]

                RecipeRoute id ->
                    [ "recipe", recipeIdToString id ]

                NotFoundRoute ->
                    [ "404" ]
    in
        getUrlStart ++ String.join "/" pieces


getUrlStart : String
getUrlStart =
    "#"


matcher : Parser (Route -> a) a
matcher =
    oneOf
        [ map HomeRoute top
        , map CookRoute (s "cook" </> cookIdParser)
        , map RecipesRoute (s "recipes" </> categoryNameParser)
        , map RecipeRoute (s "recipe" </> recipeIdParser)
        , map AboutRoute (s "about")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matcher location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
