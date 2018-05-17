module Types.Image exposing (..)

import GraphQL.Request.Builder exposing (..)


type alias Image =
    { id : Int
    , name : String
    , url : String
    , widthOrig : Float
    , heightOrig : Float
    , width : Float
    , height : Float
    , alt : String
    , updatedAt : Int
    , createdAt : Int
    }


imageQuery =
    object Image
        |> with (field "id" [] int)
        |> with (field "name" [] string)
        |> with (field "url" [] string)
        |> with (field "widthOrig" [] float)
        |> with (field "heightOrig" [] float)
        |> with (field "width" [] float)
        |> with (field "height" [] float)
        |> with (field "alt" [] string)
        |> with (field "updatedAt" [] int)
        |> with (field "createdAt" [] int)
