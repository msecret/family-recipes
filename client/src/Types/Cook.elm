module Types.Caok exposing (..)

import Types.Image exposing (..)


type alias Cook =
    { id : Number
    , email : String
    , location : String
    , image : Image
    , firstName : String
    , lastName : String
    , fullName : String
    , dateOfBirth : String
    , updatedAt : Number
    , createdAt : Number
    }
