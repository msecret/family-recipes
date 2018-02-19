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
    10


{-| Set maximum grid width. If more space is available, the grid stays centered with
padding on either side. Width must be a valid CSS dimension.
-}
maxWidth : String -> Style
maxWidth w =
    property "max-width" w


gridStyle : Style
gridStyle =
    Css.batch
        [ boxSizing borderBox
        , displayFlex
        , flexFlow2 row wrap
        , margin4 (px 0) auto (px 0) auto
        , padding (px 0)
        , position relative
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
        , width (calc (pct (amount / columns)) minus (px gutter))
        ]


offset : Float -> Style
offset amount =
    marginRight (calc (pct (amount / columns)) minus (px gutter))



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
