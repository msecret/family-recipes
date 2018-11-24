module Types.Recipe exposing (Recipe, RecipeResponse, RecipesResponse, recipeQuery, recipeQueryObject, recipeQueryRequest, recipeUrl, recipesByCategoryQuery, recipesByCategoryQueryRequest, recipesQueryObject)

import GraphQL.Client.Http as GraphQLClient
import GraphQL.Request.Builder exposing (..)
import GraphQL.Request.Builder.Arg as Arg
import GraphQL.Request.Builder.Variable as Var
import Route exposing (RecipeId, recipeIdToString)
import Types.Categories exposing (CategoryModel, categoryQuery)
import Types.Cook exposing (Cook, cooksQl)
import Types.Image exposing (Image, imageQuery)
import Types.Ingredient exposing (Ingredient, ingredientsQl)


type alias Recipe =
    { id : String
    , title : String
    , description : String
    , memorandums : String
    , difficulty : Int
    , story : String
    , image : Image
    , category : CategoryModel
    , cooks : List Cook
    , ingredients : List Ingredient
    }


type alias RecipeResponse =
    Result GraphQLClient.Error Recipe


type alias RecipesResponse =
    Result GraphQLClient.Error (List Recipe)


recipeQueryObject =
    object Recipe
        |> with (field "id" [] string)
        |> with (field "title" [] string)
        |> with (field "description" [] string)
        |> with (field "memorandums" [] string)
        |> with (field "difficulty" [] int)
        |> with (field "story" [] string)
        |> with (field "image" [] imageQuery)
        |> with (field "category" [] categoryQuery)
        |> with (field "cooks" [] cooksQl)
        |> with (field "ingredients" [] ingredientsQl)


recipesQueryObject =
    list recipeQueryObject


recipeQuery : Document Query Recipe { vars | recipeId : String }
recipeQuery =
    let
        recipeIdVar =
            Var.required "recipeId" .recipeId Var.id

        recipe =
            recipeQueryObject

        queryRoot =
            extract
                (field "recipe"
                    [ ( "id", Arg.variable recipeIdVar ) ]
                    recipe
                )
    in
    queryDocument queryRoot


recipesByCategoryQuery : Document Query (List Recipe) { vars | categoryName : String }
recipesByCategoryQuery =
    let
        categoryNameVar =
            Var.required "categoryName" .categoryName Var.string

        recipes =
            recipesQueryObject

        queryRoot =
            extract
                (field "recipes"
                    [ ( "categoryName", Arg.variable categoryNameVar ) ]
                    recipes
                )
    in
    queryDocument queryRoot


recipeQueryRequest : RecipeId -> Request Query Recipe
recipeQueryRequest id =
    recipeQuery
        |> request { recipeId = recipeIdToString id }


recipesByCategoryQueryRequest : String -> Request Query (List Recipe)
recipesByCategoryQueryRequest categoryName =
    recipesByCategoryQuery
        |> request { categoryName = categoryName }


recipeUrl : String -> String
recipeUrl id =
    "/recipe/" ++ id
