
module Ylm exposing (..)

import List
import Maybe
import Html
import Html.App
import Html.Events


type Msg =
  Noop
  | ButtonClicked

type alias Model = 
  { strings : List String }

model0 : Model
model0 = 
  { strings = [ "qwert", "asdf", "zxcv", "puss" ] }

updateStrings : List String -> List String
updateStrings strings =
  case strings of
    hd::tl -> List.append tl [hd]
    [] -> []

update : Msg -> Model -> (Model, Cmd Msg)
update msg model = 
  case msg of
    Noop -> (model, Cmd.none)
    ButtonClicked -> ({ strings = updateStrings model.strings }, Cmd.none)

view : Model -> Html.Html Msg
view model = 
  Html.div [] 
  [  Html.text <| Maybe.withDefault "error" <| List.head model.strings
  ,  Html.br [] []
  ,  Html.button [ Html.Events.onClick ButtonClicked ] [ Html.text "button" ]
  ]

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

main : Program Never
main = Html.App.program
  { init = (model0, Cmd.none)
  , update = update
  , subscriptions = subscriptions
  , view = view
  }

