module Types.Categories exposing (..)

import String exposing (toLower)



type alias Category =
    { name : CategoryName
    , displayName : String
    }


type alias CategoryList =
    List Category


type CategoryNames
    = Antipasti
    | Zuppe
    | Primi
    | Secondi
    | Contorni
    | Dolci


categoryNames : List String
categoryNames =
    [ "Antipasti", "Zuppe", "Primi", "Secondi", "Contorni", "Dolci" ]


categories : CategoryList
categories =
    List.map (\name -> { displayName = name, name = (toLower name) }) categoryNames
