module Types.Recipe exposing (..)

import Types.Cook exposing (Cook, cookQuery)
import Types.Image exposing (Image, imageQuery)
import Types.Categories exposing (CategoryModel, categoryQuery)


type alias Recipe =
    { id : Int
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


recipeQuery : Document Query Recipe { vars | recipeId : String }
recipeQuery =
    let
        recipeIdVar =
            Var.required "recipeId" .recipeId Var.id

        recipe =
            object Recipe
                |> with (field "id" [] int)
                |> with (field "title" [] string)
                |> with (field "description" [] string)
                |> with (field "memorandums" [] string)
                |> with (field "difficulty" [] int)
                |> with (field "story" [] string)
                |> with (field "ingredients" [] string)
                |> with (field "image" [] imageQuery)
                |> with (field "category" [] categoryQuery)
                |> with (field "cooks" [] cookQuery)

        queryRoot =
            extract
                (field "recipe"
                    [ ( "id", Arg.variable recipeIdVar ) ]
                    recipe
                )
    in
        queryDocument queryRoot
