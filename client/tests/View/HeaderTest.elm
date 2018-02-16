module HeaderTest exposing (..)

import Expect
import Html.Attributes as Attr
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector exposing (attribute, tag, text)
import View.Header as Header
import Types.Categories as Categories


suite : Test
suite =
    describe "Header tests"
        [ describe "view"
            [ test "renders the menu links" <|
                \() ->
                    Header.view
                        |> Query.fromHtml
                        |> Query.find [ tag "ul" ]
                        |> Query.findAll [ tag "li" ]
                        |> Query.count (Expect.greaterThan 1)
            ]
        , describe "renderMenuLink"
            [ test "Renders category captial case" <|
                \() ->
                    Header.renderMenuLink Categories.Antipasti
                        |> Query.fromHtml
                        |> Query.has [ text "Antipasti" ]
            , test "Renders href link of category" <|
                \() ->
                    Header.renderMenuLink Categories.Primi
                        |> Query.fromHtml
                        |> Query.has
                            [ attribute <|
                                Attr.href "/recipes?category=primi"
                            ]
            ]
        ]
