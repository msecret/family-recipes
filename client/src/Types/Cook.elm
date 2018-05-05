module Types.Caok exposing (..)

import GraphQL.Request.Builder exposing (..)
import GraphQL.Request.Builder.Arg as Arg
import GraphQL.Request.Builder.Variable as Var
import Types.Image exposing (..)


type alias Cook =
    { id : Int
    , email : String
    , location : String
    , image : Image
    , firstName : String
    , lastName : String
    , fullName : String
    , dateOfBirth : String
    , updatedAt : Int
    , createdAt : Int
    }


cookQuery : Document Query Cook { vars | cookId : String }
cookQuery =
    let
        cookIdVar =
            Var.required "cookId" .cookId Var.id

        image =
            object Image
                |> with (field "url" [] string)
                |> with (field "alt" [] string)

        cook =
            object Cook
                |> with (field "email" [] string)
                |> with (field "location" [] string)
                |> with (field "firstName" [] string)
                |> with (field "lastName" [] string)
                |> with (field "fullName" [] string)

        queryRoot =
            extract
                (field "cook"
                    [ ( "id", Arg.variable cookIdVar ) ]
                    cook
                )
    in
        queryDocument queryRoot
