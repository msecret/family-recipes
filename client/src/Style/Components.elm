module Style.Components exposing (..)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, src)
import Style.Theme exposing (..)
import Style.Typography as Typo

hR =
  Css.batch [
      backgroundImage (url "https://s3-us-west-1.amazonaws.com/family-recipes/hr-green.svg"),
      borderWidth (toEm 0),
      height (toEm 8),
      marginBottom (toEm 30),
      width (pct 100)
    ]

list =
  Css.batch [
      marginRight (toEm 0)
    , marginLeft (toEm 0)
    , paddingLeft (toEm 16)
  ]

rButton =
  Css.batch [
      Typo.displaySm
    , backgroundColor colors.secondary
    , border3 (px 2) solid colors.secondary
    , color colors.white
    , borderRadius4 (px 0) (px 7) (px 7) (px 7)
    , fontWeight (int 500)
    , padding2 (toEm 8) (toEm 24)
    , position relative
    , textTransform uppercase
    , after [
        property "content" "''"
      , border3 (px 2) solid colors.secondary
      , borderRadius4 (px 0) (px 7) (px 7) (px 7)
      , display block
      , position absolute
    ]
  ]
