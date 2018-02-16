module HeaderTest exposing (..)

import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector exposing (text)
import View.Header as Header
import Types.Categories as Categories


suite : Test
suite =
    describe "App Tests"
        [ test "Correctly Renders Model Content" <|
            \() ->
                Header.renderMenuLink Categories.Antipasti
                    |> Query.fromHtml
                    |> Query.has [ text "Hello, Semaphore!" ]
        ]
