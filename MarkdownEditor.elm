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

## h2

### h3

#### h4

##### h5

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
  div [ class "view" ] [
    div [ class "pure-g panes" ]
      [ div [ class "pure-u-1-2 edit"]
        [ textarea
          [ value model.input
          , onInput Input
          , class "inputarea"
          ]
          []
        ]
        , div [ class "pure-u-1-2 display" ]
          [ Markdown.toHtml [] model.input ]
      ]
    ]


main =
  program
    { init = init
    , update = update
    , view = view
    , subscriptions = subscriptions
    }
