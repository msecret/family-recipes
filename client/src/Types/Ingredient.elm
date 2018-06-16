module Types.Ingredient exposing (..)

import GraphQL.Request.Builder exposing (..)
import GraphQL.Request.Builder.Arg as Arg
import GraphQL.Request.Builder.Variable as Var
import String.Interpolate exposing (interpolate)


type alias Ingredient =
    { id : String
    , amount : String
    , unit : String
    , name : String
    , extra : Maybe String
    , updatedAt : Int
    , createdAt : Int
    }


ingredientsQl =
    list ingredientQl


ingredientQl =
    object Ingredient
        |> with (field "id" [] string)
        |> with (field "amount" [] string)
        |> with (field "unit" [] string)
        |> with (field "name" [] string)
        |> with (field "extra" [] (nullable string))
        |> with (field "updatedAt" [] int)
        |> with (field "createdAt" [] int)


toText : Ingredient -> String
toText { amount, unit, name, extra } =
    case extra of
        Just extra ->
            interpolate "{0} {1} {2} - {3}  " [ amount, unit, name, extra ]

        Nothing ->
            interpolate "{0} {1} {2} " [ amount, unit, name ]
