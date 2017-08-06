module MarkdownEditor exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
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

This is an online markdown editor written in Elm.

```elm
main =
  Html.txt "Syntax highlighting!"
```
"""


row =
  style
    [ ("-webkit-box-sizing", "border-box")
    , ("-moz-box-sizing", "border-box")
    , ("box-sizing", "border-box")
    , ("padding-right", "3em")
    , ("height", "100%")
    ]


textArea =
  style
    [ ("height", "100%")]


inputArea =
  style
    [ ("-webkit-box-sizing", "border-box")
    , ("-moz-box-sizing", "border-box")
    , ("width", "100%")
    , ("padding-right", "1em")
    , ("height", "100%")
    ]


panes =
  style
    [ ("height", "95%")
    , ("padding", "1em")
    ]


display =
  style
    [ ("padding-left", "2em")
    , ("padding-right", "2em")
    ]


init : (Model, Cmd Msg)
init =
  (Model defaultText, Cmd.none)


view : Model -> Html Msg
view model =
  div [ class "view" ] [
    div
      [ class "row panes"
      , panes
      ]
        [ div [ class "col-xs-1" ] []
          , div
            [ class "col-md-5 edit"
            , textArea
            , row
            ]
              [ textarea
                [ value model.input
                , onInput Input
                , class "inputarea"
                , inputArea
                , row
                ] []
              ]
          , div
              [ class "col-md-5 display"
              , display
              , row
              ] [ Markdown.toHtml [] model.input ]
        ]
    ]


main =
  program
    { init = init
    , update = update
    , view = view
    , subscriptions = subscriptions
    }
