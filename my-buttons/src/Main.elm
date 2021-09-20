-- Analisando o funcionamento do programa 'buttons' dos exemplos do livro do elm

module Main exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

-- Main --
main = 
    Browser.sandbox { init = init, update = update, view = view }

-- Model --
type alias Model = Int

init : Model
init = 
    0

-- Update --
type Msg
    = Increment
    | Decrement
    | Reset
    | IncrementFast
    | DecrementFast

update : Msg -> Model -> Model
update msg model = 
    case msg of 
        Increment -> 
            model + 1

        Decrement -> 
            model - 1

        Reset -> 
            0

        IncrementFast -> 
            model + 10
        
        DecrementFast -> 
            model - 10

-- View --
view : Model -> Html Msg
view model = 
    div [] 
    [ div[] 
        [button [ onClick Decrement] [text "Decrease"]
        ,button [ onClick DecrementFast] [text "Faster"]
        ]
    , div[] [ text (String.fromInt model)]
    , div[] 
        [button [onClick Increment] [text "Increase"]
        ,button [onClick IncrementFast] [text "Faster"]
        ]
    , div[] [ text "Don't leave without reset!"]
    , button [onClick Reset] [text "Reset"]
    ]