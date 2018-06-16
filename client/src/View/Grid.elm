module View.Grid
    exposing
        ( grid
        , gcol
        , offset
        )

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, src)


-- import Material.Options as Options exposing (Style, cs, styled)
-- Settings


columnSize =
    76


columns =
    12


gutter =
    15


gridStyle : Style
gridStyle =
    Css.batch
        [ boxSizing borderBox
        , displayFlex
        , flexFlow2 row wrap
        , margin4 (px 0) auto (px 0) auto
        , maxWidth (px 1015)
        , padding (px 0)
        , position relative
        , width (pct 100)
        , alignItems stretch
        , after
            [ boxSizing borderBox
            ]
        , listStyleType none
        ]


grid : Style
grid =
    gridStyle


colStyle : Style
colStyle =
    Css.batch
        [ boxSizing borderBox
        , position relative
        , verticalAlign top
        , width (pct 100)
        ]


gcol : Float -> Style
gcol amount =
    Css.batch
        [ colStyle
        , width (calc (pct (amount / columns * 100)) minus (px gutter))
        ]


offset : Float -> Style
offset amount =
    marginRight (calc (pct (amount / columns * 100)) minus (px gutter))



--, width (calc ((size / columns) * 100) - gutter)


{-| Device specifiers, used with `size` and `offset`. (A `Device` really
encapsulates a screen size.)
-}
type Device
    = All
    | Desktop
    | Tablet
    | Phone


suffix : Device -> String
suffix device =
    case device of
        All ->
            ""

        Desktop ->
            "-desktop"

        Tablet ->
            "-tablet"

        Phone ->
            "-phone"


type Align
    = Top
    | Middle
    | Bottom


clip : comparable -> comparable -> comparable -> comparable
clip lower upper k =
    Basics.max lower (Basics.min k upper)
