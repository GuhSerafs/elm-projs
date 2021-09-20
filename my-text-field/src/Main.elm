module Main exposing (..)

import Browser
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


-- MAIN -- 
main : Program () Model Msg
main = 
    Browser.sandbox {init = init, update = update, view = view}


-- MODEL --
type alias Model = 
    { content: String
    , information: String
    }

init : Model
init = 
    {content = ""
    ,information = "No Content!"}

-- UPDATE --

type Msg
    = Change String
update: Msg -> Model -> Model
update msg model = 
    case msg of 
        Change newContent -> 
            {model | content = newContent
            , information = informationContent newContent
            }

-- VIEW --

informationContent: String -> String
informationContent info = 
    if String.length info == 0 then
        "No content!"
    else 
        "Length: " ++ String.fromInt (String.length info)


view: Model -> Html Msg
view model = 
    div[]
        [ input [placeholder "Text to Reverse", value model.content, onInput Change] []
        , div [] [ text (String.reverse model.content)]
        , div [] [ text model.information]
        ]