module Types.Image exposing (..)


type alias Image =
    { id : Number
    , name : String
    , url : String
    , widthOrig : Number
    , heightOrig : Number
    , width : Number
    , height : Number
    , alt : String
    , updatedAt : Number
    , createdAt : Number
    }
