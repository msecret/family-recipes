module View.Recipes exposing (view)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (alt, class, css, href, property, src)
import Json.Encode exposing (string)
import Style.Components exposing (hR, list, primaryButton, secondaryButton)
import Style.Layout as L
import Style.Theme exposing (..)
import Style.Typography as Typo
import Style.Util as U
import Types.Cook exposing (cooksToText)
import Types.Image exposing (Image)
import Types.Ingredient exposing (Ingredient, toText)
import Types.Recipe exposing (Recipe, recipeUrl)
import View.Grid exposing (..)


categoryByline : String -> String
categoryByline categoryName =
    case categoryName of
        "antipasti" ->
            "The appetizer before the meal"

        "primi" ->
            "The first main part of the meal, usually pasta"

        "secondi" ->
            "The main course of the meal, usually meat"

        "contorni" ->
            "Side dishes to the meal, vegtables and other assortments"

        "dolci" ->
            "The sweets and desserts for after the meal"

        _ ->
            ""


inlineAuthorsView : List String -> Html msg
inlineAuthorsView strings =
    span []
        (List.map authorView strings)


authorView : String -> Html msg
authorView s =
    span [] [ text s ]


difficultyImage : Int -> Int -> String
difficultyImage i difficulty =
    let
        which =
            if i > difficulty then
                "none"

            else
                "point"
    in
    "https://s3-us-west-1.amazonaws.com/family-recipes/difficulty-" ++ which ++ ".svg"


difficultyView : Int -> Html msg
difficultyView difficulty =
    div [ css [ marginTop (px 2) ] ]
        (List.map
            (\i ->
                img
                    [ src (difficultyImage i difficulty)
                    , css [ marginRight (px 4) ]
                    ]
                    []
            )
            (List.range 1 5)
        )


compactRecipe : Recipe -> Html msg
compactRecipe recipe =
    div [ css [ gcol 6, marginTop (px 30) ] ]
        [ div [ css [ grid ] ]
            [ div [ css [ gcol 6 ] ]
                [ a [ href (recipeUrl recipe.id) ]
                    [ img
                        [ src recipe.image.url
                        , alt recipe.image.alt
                        , css [ width (pct 100), height (px 138) ]
                        ]
                        []
                    ]
                ]
            , div [ css [ gcol 6 ] ]
                [ a [ css [ Typo.link ], href (recipeUrl recipe.id) ]
                    [ h3 [ css [ Typo.bodyTitle ] ] [ text recipe.title ]
                    ]
                , p [ css [ Typo.displaySm, margin (px 0) ] ]
                    [ text "by "
                    , inlineAuthorsView (cooksToText recipe.cooks)
                    ]
                , h4 [ css [ Typo.displayMd ] ] [ text "Difficulty" ]
                , difficultyView recipe.difficulty
                , h4 [ css [ Typo.displayMd ] ] [ text "Cooking time " ]
                , span [ css [ Typo.displaySm, color colors.primary ] ]
                    [ text "45 min"
                    ]
                ]
            ]
        ]


view : String -> List Recipe -> Html msg
view category recipes =
    div [ css [ marginTop (toEm 40) ] ]
        [ div []
            [ h1 [ css [ Typo.categoryTitle, display inlineBlock, marginRight (px 20) ] ]
                [ text category ]
            , span [ css [ Typo.body, color colors.primary ] ]
                [ text (categoryByline category) ]
            ]
        , div
            [ css
                [ L.fullWidth
                , marginBottom (px 20)
                , height (px 64)
                , backgroundImage (url "https://s3-us-west-1.amazonaws.com/family-recipes/bg-3stripe.svg")
                ]
            ]
            [ div
                [ css
                    [ L.container
                    , backgroundImage (url ("https://s3-us-west-1.amazonaws.com/family-recipes/bg-" ++ category ++ ".svg"))
                    , backgroundRepeat repeatX
                    , backgroundSize (pct 15)
                    , top (pct 32)
                    , position relative
                    , height (px 30)
                    ]
                ]
                []
            ]
        , div [ css [ grid ] ]
            (List.map compactRecipe recipes)
        ]
