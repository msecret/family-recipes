module Types.Recipe exposing (..)

import Types.Cook exposing (Cook)
import Types.Image exposing (Image)
import Types.Categories exposing (CategoryModel)


type alias Recipe =
    { id : Number
    , title : String
    , description : String
    , memorandums : String
    , difficulty : Number
    , story : String
    , ingredients : String
    , image : Image
    , category : CategoryModel
    , cooks : List Cook
    }
