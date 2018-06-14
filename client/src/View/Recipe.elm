module View.Recipe exposing (view)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (alt, class, css, href, src)
import Types.Recipe exposing (Recipe)
import Types.Cook exposing (cooksToText)


toHtmlList : List String -> Html msg
toHtmlList strings =
    ul [] (List.map toLi strings)


toLi : String -> Html msg
toLi s =
    li [] [ text s ]


view : Recipe -> Html msg
view recipe =
    div []
        [ h1 []
            [ text recipe.title ]
        , div
            []
            [ toHtmlList (cooksToText recipe.cooks) ]
        , img [ src recipe.image.url, alt recipe.image.alt ] []
        , p [] [ text recipe.description ]
        ]
