module View.Recipe exposing (view)

import Css exposing (..)
import Json.Encode exposing (string)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (alt, class, css, href, src, property)
import Style.Components exposing (hR, list, rButton)
import Style.Layout as L
import Style.Typography as Typo
import Style.Util as U
import Style.Theme exposing (..)
import Types.Recipe exposing (Recipe)
import Types.Cook exposing (cooksToText)
import Types.Image exposing (Image)
import Types.Ingredient exposing (Ingredient, toText)
import View.Grid exposing (..)


toHtmlList : List String -> Html msg
toHtmlList strings =
    ul [] (List.map toLi strings)


toLi : String -> Html msg
toLi s =
    li [ css [ Typo.byLine ] ] [ text s ]


heroImage : String -> Style
heroImage imgUrl =
    Css.batch
        [ backgroundImage (url imgUrl)
        , backgroundPosition center
        , backgroundSize cover
        , marginLeft auto
        , marginRight auto
        , maxWidth (px 1280)
        , height (pct 100)
        , width (pct 100)
        ]

heroBackground =
  Css.batch
  [
    backgroundImage
      (url "https://s3-us-west-1.amazonaws.com/family-recipes/towel_whole.svg")
  ]


heroImageContainer : Image -> Html msg
heroImageContainer image =
    div [ css [ heroBackground, L.fullWidth, marginBottom (toEm spacing.section) ] ]
        [ div [ css [ (heroImage image.url) ] ]
            [ img [ css [ U.visuallyHide ], src image.url, alt image.alt ] []
            ]
        ]


ingredientList : List Ingredient -> Html msg
ingredientList ingredients =
    ul [ css [ list ]] (List.map ingredientItem ingredients)


ingredientItem : Ingredient -> Html msg
ingredientItem ingredient =
    li [ css [ Typo.displayMd, marginBottom (toEm 22), fontWeight bolder ] ]
        [ text (toText ingredient) ]

difficultyText : Int -> String
difficultyText amount =
  case amount of
    1 ->
      "Very easy"
    2 ->
      "Easy"
    3 ->
      "Medium"
    4 ->
      "Hard"
    5 ->
      "Very hard"
    _ ->
      "Unknown"


view : Recipe -> Html msg
view recipe =
    div []
        [ h1 [ css [ Typo.title ] ]
            [ text recipe.title ]
        , div
            []
            [ toHtmlList (cooksToText recipe.cooks) ]
        , heroImageContainer recipe.image
        , div [ css [ grid, marginBottom (toEm spacing.section) ] ]
            [ div [ css [ (gcol 3), textAlign center ] ]
                [ h5 [ css [ Typo.h5, marginTop (toEm 20) ] ]
                    [ text "Difficulty" ]
                , p [ css [ Typo.displaySm ] ]
                    [ text (difficultyText recipe.difficulty) ]
                ]
            , div [ css [ (gcol 6) ] ]
                [ p [ css [ Typo.body, fontSize (toEm 16) ] ]
                    [ text recipe.story ]
                ]
            , div [ css [ (gcol 3), textAlign center ] ]
                [ h5 [ css [ Typo.h5, marginTop (toEm 20) ] ]
                    [ text "Cooking time" ]
                , p [ css [ Typo.displaySm ] ]
                    [ text (toString recipe.id ++ " minutes") ]
                , button [ css [ rButton ] ] [ text "Print" ]
                ] ]
        , hr [css [ hR ] ] []
        , div [ css [ grid, marginBottom (toEm spacing.section) ] ]
            [ div [ css [ (gcol 8), paddingRight (toEm 36) ] ]
                [ h2 [ css [ Typo.h2 ] ]
                    [ text "Instructions"
                    ]
                , p
                    [ css [ Typo.body ]
                    , Html.Styled.Attributes.property "innerHTML" <| string recipe.description
                    ]
                    []
                ]
            , div [ css [ (gcol 4), paddingLeft (toEm 32), paddingTop (toEm 12) ] ]
                [ h3 [ css [ Typo.h3 ] ]
                    [ text "Ingredients"
                    ]
                , p [ css [ Typo.display ] ]
                    [ ingredientList recipe.ingredients ]
                ]
            ]
        ]
