module Style.Typography exposing (body, bodyTitle, byByLine, byLine, categoryText, categoryTitle, display, displayMd, displaySm, footerNav, h2, h3, h4, h5, link, nav, offColor, title)

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
        , fontFamilies serifFamily
        , fontSize (toEm 64)
        , fontWeight normal
        , marginBottom (toEm 0)
        , textAlign center
        ]


byLine : Style
byLine =
    Css.batch
        [ fontFamilies sansFamily
        , fontSize (toEm 16)
        , listStyle none
        , marginTop (toEm 10)
        , marginLeft (px 0)
        , paddingLeft (px 0)
        , textAlign center
        ]


byByLine : Style
byByLine =
    Css.batch
        [ fontFamilies sansFamily
        , fontSize (toEm 12)
        , marginBottom (px 0)
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


categoryTitle : Style
categoryTitle =
    Css.batch
        [ h3
        , color colors.primary
        , textTransform uppercase
        , letterSpacing (px 3)
        ]


h4 : Style
h4 =
    Css.batch
        [ color colors.black
        , fontFamilies sansFamily
        , fontSize (toEm 16)
        , fontWeight bolder
        , margin (px 0)
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
        , lineHeight (toEm 28)
        , marginBottom (px 0)
        , marginTop (px 0)
        ]


bodyTitle : Style
bodyTitle =
    Css.batch
        [ body
        , fontSize (toEm 22)
        , fontWeight normal
        , letterSpacing (px 1)
        , lineHeight (toEm 20)
        ]


display : Style
display =
    Css.batch
        [ fontFamilies sansFamily
        , fontSize (toEm 16)
        ]


displayMd : Style
displayMd =
    Css.batch
        [ fontFamilies sansFamily
        , fontSize (toEm 14)
        , fontWeight normal
        , margin (px 0)
        , marginTop (px 8)
        ]


displaySm : Style
displaySm =
    Css.batch
        [ fontFamilies sansFamily
        , fontSize (toEm 12)
        , listStyle none
        , margin (px 0)
        ]


categoryText : Style
categoryText =
    Css.batch
        [ color colors.primary
        , fontFamilies sansFamily
        , fontWeight bold
        , fontSize (toEm 13)
        , letterSpacing (toEm 4)
        , textTransform uppercase
        ]


link : Style
link =
    Css.batch
        [ color inherit
        , textDecoration none
        , hover
            [ color colors.primary
            , textDecoration underline
            ]
        ]
