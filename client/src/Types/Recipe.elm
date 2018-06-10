module Types.Recipe exposing (..)

import GraphQL.Client.Http as GraphQLClient
import GraphQL.Request.Builder exposing (..)
import GraphQL.Request.Builder.Arg as Arg
import GraphQL.Request.Builder.Variable as Var
import Route exposing (RecipeId, recipeIdToString)
import Types.Cook exposing (Cook, cooksQl)
import Types.Image exposing (Image, imageQuery)
import Types.Categories exposing (CategoryModel, categoryQuery)


type alias Recipe =
    { id : String
    , title : String
    , description : String
    , memorandums : String
    , difficulty : Int
    , story : String
    , ingredients : String
    , image : Image
    , category : CategoryModel
    , cooks : List Cook
    }


type alias RecipeResponse =
    Result GraphQLClient.Error Recipe


recipeQuery : Document Query Recipe { vars | recipeId : String }
recipeQuery =
    let
        recipeIdVar =
            Var.required "recipeId" .recipeId Var.id

        recipe =
            object Recipe
                |> with (field "id" [] string)
                |> with (field "title" [] string)
                |> with (field "description" [] string)
                |> with (field "memorandums" [] string)
                |> with (field "difficulty" [] int)
                |> with (field "story" [] string)
                |> with (field "ingredients" [] string)
                |> with (field "image" [] imageQuery)
                |> with (field "category" [] categoryQuery)
                |> with (field "cooks" [] cooksQl)

        queryRoot =
            extract
                (field "recipe"
                    [ ( "id", Arg.variable recipeIdVar ) ]
                    recipe
                )
    in
        queryDocument queryRoot


recipeQueryRequest : RecipeId -> Request Query Recipe
recipeQueryRequest id =
    recipeQuery
        |> request { recipeId = (recipeIdToString id) }
