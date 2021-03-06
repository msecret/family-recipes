module RouteTest exposing (..)

import Expect
import Navigation
import Test exposing (..)
import Route
import Types.Categories as Categories


suite : Test
suite =
    describe "Route test"
        [ describe "getUrlStart"
            [ test "always returns a /" <|
                \() ->
                    Route.getUrlStart
                        |> Expect.equal "/"
            ]
        , describe "parseLocation"
            [ test "It should return home for root" <|
                \() ->
                    Route.parseLocation rootLocation
                        |> Expect.equal Route.HomeRoute
            , test "It should return about route for about location" <|
                \() ->
                    Route.parseLocation aboutLocation
                        |> Expect.equal Route.AboutRoute
            , test "It should return cook route when cook location with id" <|
                \() ->
                    Route.parseLocation (cookLocation "3")
                        |> Expect.equal (Route.CookRoute (Route.CookId "3"))
            , test "It should return recipe route when recipe location with id" <|
                \() ->
                    Route.parseLocation (recipeLocation "3")
                        |> Expect.equal (Route.RecipeRoute (Route.RecipeId "3"))
            , test "It should return recipes route when recipe with category" <|
                \() ->
                    Route.parseLocation (recipesLocation "primi")
                        |> Expect.equal
                            (Route.RecipesRoute (Just (Categories.Primi)))
            ]
        , describe "getUrl"
            [ test "should return blank for the home route" <|
                \() ->
                    Route.getUrl Route.HomeRoute
                        |> Expect.equal Route.getUrlStart
            , test "should return about for the about route" <|
                \() ->
                    Route.getUrl Route.AboutRoute
                        |> Expect.equal (Route.getUrlStart ++ "about")
            , test "should return recipes route with name param set to category" <|
                \() ->
                    let
                        categoryName =
                            "antipasti"

                        category =
                            Categories.Antipasti
                    in
                        Route.getUrl
                            (Route.RecipesRoute (Just category))
                            |> Expect.equal
                                (Route.getUrlStart ++ "recipes?category=" ++ categoryName)
            , test "should return cook route with id after /" <|
                \() ->
                    let
                        cookId =
                            "3"
                    in
                        Route.getUrl (Route.CookRoute (Route.CookId cookId))
                            |> Expect.equal (Route.getUrlStart ++ "cook/" ++ cookId)
            , test "should return recipe route with id after /" <|
                \() ->
                    let
                        recipeId =
                            "6"
                    in
                        Route.getUrl (Route.RecipeRoute (Route.RecipeId recipeId))
                            |> Expect.equal
                                (Route.getUrlStart ++ "recipe/" ++ recipeId)
            ]
        ]



-- Mocking


dontCare : String
dontCare =
    "Don't Care"


mockLocation : Navigation.Location
mockLocation =
    { href = dontCare
    , host = dontCare
    , hostname = dontCare
    , protocol = dontCare
    , origin = dontCare
    , port_ = dontCare
    , pathname = dontCare
    , search = dontCare
    , hash = dontCare
    , username = dontCare
    , password = dontCare
    }


rootLocation : Navigation.Location
rootLocation =
    { mockLocation | pathname = "/" }


aboutLocation : Navigation.Location
aboutLocation =
    { mockLocation | pathname = "/about" }


cookLocation : String -> Navigation.Location
cookLocation id =
    { mockLocation | pathname = "/cook/" ++ id }


recipeLocation : String -> Navigation.Location
recipeLocation id =
    { mockLocation | pathname = "/recipe/" ++ id }


recipesLocation : String -> Navigation.Location
recipesLocation name =
    { mockLocation | pathname = "/recipes", search = "?category=" ++ name }
