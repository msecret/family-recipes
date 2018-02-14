module RouteTest exposing (..)

import Expect
import Test exposing (..)
import Route


suite : Test
suite =
    describe "Route test"
        [ describe "getUrlStart"
            [ test "always returns a #" <|
                \() ->
                    Route.getUrlStart
                        |> Expect.equal "#"
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
                    in
                        Route.getUrl
                            (Route.RecipesRoute (Route.CategoryName categoryName))
                            |> Expect.equal
                                (Route.getUrlStart ++ "recipes?name=" ++ categoryName)
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
