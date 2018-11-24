module View.Recipe exposing (view)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (alt, class, css, href, property, src)
import Json.Encode exposing (string)
import Style.Components exposing (hR, list, primaryButton, tertiaryButton)
import Style.Layout as L
import Style.Theme exposing (..)
import Style.Typography as Typo
import Style.Util as U
import Types.Cook exposing (cooksToText)
import Types.Image exposing (Image)
import Types.Ingredient exposing (Ingredient, toText)
import Types.Recipe exposing (Recipe)
import View.Category exposing (categoryBgView)
import View.Grid exposing (..)


toHtmlList : List String -> Html msg
toHtmlList strings =
    ul [ css [ U.unformattedList ] ] (List.map toLi strings)


toLi : String -> Html msg
toLi s =
    li [ css [ Typo.byLine, marginTop (px 4) ] ] [ text s ]


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
        [ backgroundImage
            (url "https://s3-us-west-1.amazonaws.com/family-recipes/towel_whole.svg")
        ]


heroContainerCategory =
    Css.batch
        [ backgroundSize (pct 7)
        , left zero
        , maxWidth none
        , position absolute
        ]


heroImageContainer : Image -> String -> Html msg
heroImageContainer image categoryName =
    div [ css [ margin2 (toEm spacing.section) (px 0), heroBackground, L.fullWidth ] ]
        [ div
            [ css
                [ categoryBgView categoryName
                , heroContainerCategory
                , top (px 15)
                ]
            ]
            []
        , div [ css [ heroImage image.url, position relative, zIndex (int 3) ] ]
            [ img [ css [ U.visuallyHide ], src image.url, alt image.alt ] []
            ]
        , div
            [ css
                [ categoryBgView categoryName
                , backgroundPosition2 (px 80) zero
                , heroContainerCategory
                , top inherit
                , bottom (px 5)
                ]
            ]
            []
        ]


ingredientList : List Ingredient -> Html msg
ingredientList ingredients =
    ul [ css [ list ] ] (List.map ingredientItem ingredients)


ingredientItem : Ingredient -> Html msg
ingredientItem ingredient =
    li
        [ css
            [ Typo.displayMd
            , marginBottom (toEm 22)
            , fontWeight bolder
            ]
        ]
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


categoryDisplay : String -> Html msg
categoryDisplay name =
    div [ css [ width (px 101), marginRight auto, marginLeft auto, textAlign center ] ]
        [ h5 [ css [ Typo.categoryText, marginBottom (toEm 8) ] ]
            [ text name
            ]
        , div
            [ css
                [ backgroundImage (url ("https://s3-us-west-1.amazonaws.com/family-recipes/plate-empty-" ++ name ++ ".svg"))
                , height (px 28)
                , width (px 101)
                ]
            ]
            []
        ]


view : Recipe -> Html msg
view recipe =
    div [ css [ marginTop (toEm 40) ] ]
        [ div []
            [ categoryDisplay recipe.category.name ]
        , h1 [ css [ Typo.title ] ]
            [ text recipe.title ]
        , div
            []
            [ p [ css [ Typo.byByLine, color colors.primary ] ] [ text "by" ]
            , toHtmlList (cooksToText recipe.cooks)
            ]
        , heroImageContainer recipe.image recipe.category.name
        , div [ css [ grid, marginBottom (toEm spacing.section) ] ]
            [ div [ css [ gcol 3, textAlign center ] ]
                [ h5 [ css [ Typo.h4 ] ]
                    [ text "Difficulty" ]
                , p [ css [ Typo.displayMd, marginTop (px 0) ] ]
                    [ text (difficultyText recipe.difficulty) ]
                , h5 [ css [ Typo.h4, marginTop (toEm 15) ] ]
                    [ text "Serves" ]
                , p [ css [ Typo.displayMd, marginTop (px 0) ] ]
                    [ text (toString recipe.serves) ]
                ]
            , div [ css [ gcol 6 ] ]
                [ p [ css [ Typo.body, fontSize (toEm 16) ] ]
                    [ text recipe.story ]
                ]
            , div [ css [ gcol 3, textAlign center ] ]
                [ h5 [ css [ Typo.h4 ] ]
                    [ text "Cooking time" ]
                , p [ css [ Typo.displayMd, marginTop (px 0) ] ]
                    [ text (toString recipe.cookingTime) ]
                , div [ css [ marginTop (px 15) ] ]
                    [ button
                        [ css [ tertiaryButton ]
                        ]
                        [ text "Print" ]
                    , a
                        [ css [ primaryButton, marginLeft (px 10) ]
                        , href "mailto:?subject=Family recipe site&amp;body=http://www.family-recipes.com."
                        ]
                        [ text "Email" ]
                    ]
                ]
            ]
        , hr [ css [ hR ] ] []
        , div [ css [ grid, marginBottom (toEm spacing.section) ] ]
            [ div [ css [ gcol 8, paddingRight (toEm 36) ] ]
                [ h2 [ css [ Typo.h2 ] ]
                    [ text "Instructions"
                    ]
                , p
                    [ css [ Typo.body ]
                    , Html.Styled.Attributes.property "innerHTML" <| string recipe.description
                    ]
                    []
                ]
            , div [ css [ gcol 4, paddingLeft (toEm 32), paddingTop (toEm 12) ] ]
                [ h3 [ css [ Typo.h3 ] ]
                    [ text "Ingredients"
                    ]
                , p [ css [ Typo.display ] ]
                    [ ingredientList recipe.ingredients ]
                ]
            ]
        ]
