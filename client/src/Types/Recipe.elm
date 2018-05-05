module Types.Recipe exposing (..)

import Types.Cook exposing (Cook)
import Types.Image exposing (Image)
import Types.Categories exposing (CategoryModel)


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
