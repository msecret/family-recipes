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
    let
        _ =
            Debug.log "out otpasdf" 1
    in
    custom "COOKID" (Ok << CookId)


recipeIdToString : RecipeId -> String
recipeIdToString (RecipeId id) =
    id


recipeIdParser : Parser (RecipeId -> a) a
recipeIdParser =
    custom "RECIPEID" (Ok << RecipeId)


categoryNameToString : Maybe CategoryName -> String
categoryNameToString name =
    case name of
        Nothing ->
            ""

        Just (CategoryName name) ->
            name




optionalCategoryParam : QueryParser (Maybe CategoryName -> b) b
optionalCategoryParam =
    let
        _ =
            Debug.log "in otpasdf" 1
    in
        customParam "category" (fromQueryValue)


fromQueryValue : Maybe String -> Maybe CategoryName
fromQueryValue data =
    let
        _ =
            Debug.log "FFFFFFF" data
    in
        case data of
            Just data ->
                case data of
                  "antipasti" ->
                    Just (CategoryName (Maybe.withDefault "" (Just data)))

                  "primi" ->
                    Just (CategoryName (Maybe.withDefault "" (Just data)))

                  _ ->
                    Nothing

            Nothing ->
                Nothing



type Route
    = HomeRoute
    | CookRoute CookId
    | RecipesRoute (Maybe CategoryName)
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
    "/"


matcher : Parser (Route -> a) a
matcher =
    let
        _ =
            Debug.log "in matcher" 1
    in
    oneOf
        [ map HomeRoute top
        , map CookRoute (s "cook" </> cookIdParser)
        , map RecipesRoute (s "recipes" <?> optionalCategoryParam)
        , map RecipeRoute (s "recipe" </> recipeIdParser)
        , map AboutRoute (s "about")
        ]


parseLocation : Location -> Route
parseLocation location =
    let
        _ =
            Debug.log "in parseLocation" 1
    in
    case (parsePath matcher location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
