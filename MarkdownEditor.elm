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


init : (Model, Cmd Msg)
init =
  (Model "", Cmd.none)


view : Model -> Html Msg
view model =
  div [ class "view" ]
    [ h1 [] [ text "Markdown Editor" ]
    , div
        [ class "pane" ]
        [ div
          [ class "edit"]
          [ textarea
            [ value model.input
            , onInput Input
            , class "inputarea"
            ]
            []
          ]
        ]
      , div [ class "display"]
          [ Markdown.toHtml [] model.input ]
    ]


main =
  program
  { init = init
  , update = update
  , view = view
  , subscriptions = subscriptions
  }
