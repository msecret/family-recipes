module Style.Typography exposing (..)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, src)
import Style.Theme exposing (..)


nav : Style
nav =
    Css.batch
        [ color colors.black
        , fontFamilies sansFamily
        , fontSize (toEm 15)
        , fontWeight bolder
        , textDecoration none
        ]


footerNav : Style
footerNav =
    Css.batch
        [ nav
        , color colors.white
        , fontWeight normal
        ]


offColor =
    color colors.white


title : Style
title =
    Css.batch
        [ color colors.black
        , fontFamilies decorativeFamily
        , fontSize (toEm 64)
        , fontWeight bolder
        , marginBottom (toEm 0)
        , textAlign center
        ]


byLine : Style
byLine =
    Css.batch
        [ fontFamilies sansFamily
        , fontSize (toEm 18)
        , fontWeight lighter
        , listStyle none
        , textAlign center
        ]


h2 : Style
h2 =
    Css.batch
        [ fontFamilies sansFamily
        , fontSize (toEm 26)
        , fontWeight bolder
        ]


h3 : Style
h3 =
    Css.batch
        [ fontFamilies sansFamily
        , fontSize (toEm 20)
        , fontWeight bolder
        ]


h4 : Style
h4 =
    Css.batch
        [ color colors.black
        , fontFamilies sansFamily
        , fontSize (toEm 16)
        , fontWeight bolder
        ]


h5 : Style
h5 =
    Css.batch
        [ fontFamilies sansFamily
        , fontSize (toEm 14)
        , fontWeight bolder
        , marginBottom (px 0)
        , marginTop (px 0)
        ]


body : Style
body =
    Css.batch
        [ fontFamilies serifFamily
        , fontSize (toEm 16)
        , lineHeight (toEm 24)
        , marginBottom (px 0)
        , marginTop (px 0)
        ]


display : Style
display =
    Css.batch
        [ fontFamilies sansFamily
        , fontSize (toEm 16)
        ]


displaySm : Style
displaySm =
    Css.batch
        [ fontFamilies sansFamily
        , fontSize (toEm 12)
        ]
