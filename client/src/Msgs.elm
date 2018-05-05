module Msgs exposing (Msg(..))

import Navigation exposing (Location)
import Route exposing (Route)


type Msg
    = OnLocationChange Location
    | LinkTo Route
