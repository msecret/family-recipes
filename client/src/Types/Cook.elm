module Types.Cook exposing (..)

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

        cook =
            object Cook
                |> with (field "id" [] int)
                |> with (field "email" [] string)
                |> with (field "location" [] string)
                |> with (field "image" [] imageQuery)
                |> with (field "firstName" [] string)
                |> with (field "lastName" [] string)
                |> with (field "fullName" [] string)
                |> with (field "dateOfBirth" [] string)
                |> with (field "updatedAt" [] int)
                |> with (field "createdAt" [] int)

        queryRoot =
            extract
                (field "cook"
                    [ ( "id", Arg.variable cookIdVar ) ]
                    cook
                )
    in
        queryDocument queryRoot


cookQueryRequest : Request Query Cook
cookQueryRequest =
    cookQuery
        |> request { cookId = "1" }
