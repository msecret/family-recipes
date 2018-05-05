module Types.Image exposing (..)


type alias Image =
    { id : Int
    , name : String
    , url : String
    , widthOrig : Float
    , heightOrig : Float
    , width : Float
    , height : Float
    , alt : String
    , updatedAt : Float
    , createdAt : Float
    }
