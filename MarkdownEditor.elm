module MarkdownEditor exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App exposing (..)
import Html.Events exposing (..)
import Markdown

type alias Model =
  { input : String }

type Msg =
  Input String


update : Msg -> Model -> (Model, Cmd Msg)
update msg {input} =
  case msg of
    Input newStr ->
      (Model newStr, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


defaultText : String
defaultText = """# Markdown example

Put *text* here.

```elm
main =
  Html.text "Syntax highlighting!"
```
"""

init : (Model, Cmd Msg)
init =
  (Model defaultText, Cmd.none)


view : Model -> Html Msg
view model =
  div [ class "view" ]
    [ h1 [ align "center" ] [ text "Elm Markdown Editor" ]
    , div
        [ class "pane" ]
        [ div [ class "edit"]
          [ textarea
            [ value model.input
            , onInput Input
            , class "inputarea"
            ]
            []
          ]
        ]
      , div [ class "display", align "left" ]
          [ Markdown.toHtml [] model.input ]
    ]


main =
  program
  { init = init
  , update = update
  , view = view
  , subscriptions = subscriptions
  }
