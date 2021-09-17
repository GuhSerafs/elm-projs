module Main exposing (..)

import Html exposing (..)


type alias Model =
    { message : String }


type Msg
    = Message String

model : Model
model =
    Model ""


update : Msg -> Model -> Model
update msg targetModel =
    case msg of
        Message newMessage ->
            { targetModel | message = newMessage }

view : Model -> Html Msg
view htmlView = 
    div [] []

main : Html Msg
main =
    text "Hello World"
