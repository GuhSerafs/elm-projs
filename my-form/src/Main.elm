module Main exposing (..)
import Browser
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Char exposing (isDigit, isUpper, isLower, isAlphaNum)

-- MAIN
main : Program () Model Msg
main = 
    Browser.sandbox{init = init, update=update, view=view}

-- MODEL
type alias Model = 
    { name: String
    , password: String
    , passwordCheck: String}

-- INIT
init: Model
init = 
    Model "" "" ""

-- UPDATE
type Msg
    = Name String
    | Password String
    | PasswordCheck String

update: Msg -> Model -> Model
update msg model = 
    case msg of 
        Name name -> 
            {model | name = name}
        Password pw -> 
            {model | password = pw}
        PasswordCheck pwc -> 
            {model | passwordCheck = pwc}

-- VIEW
view: Model -> Html Msg
view model = 
    div [] 
        [ viewInput "text" "Nome" model.name Name
        , viewInput "password" "Senha" model.password Password
        , viewInput "password" "Repita a senha" model.passwordCheck PasswordCheck
        , viewValidation model
        , passwordValidation model
        ]

viewInput: String -> String -> String -> (String -> msg) -> Html msg -- Funçao auxiliar 
viewInput t p v toMsg = 
    input [type_ t, placeholder p, value v, onInput toMsg][]

viewValidation: Model -> Html msg
viewValidation model = 
    if String.length model.name == 0 then 
        div [ style "color" "red"][ text "Digite um nome"]
    else if not (model.password == model.passwordCheck) then
        div [ style "color" "red"][ text "As senhas sao diferentes!"]
    else
        div [ style "color" "green"][ text "Ok"] 

passwordValidation : { a | password : String } -> Html msg
passwordValidation model = 
    if not (String.any isDigit model.password) then 
        div [ style "color" "red"][ text "Digite pelo menos um numero."]
    else if not (String.any isUpper model.password) then
        div [ style "color" "red"][ text "Digite pelo menos uma letra maiuscula."]
    else if not (String.any isLower model.password) then
        div [ style "color" "red"][ text "Digite pelo menos uma letra minuscula."]
    else if String.all isAlphaNum model.password then
        div [ style "color" "red"][ text "Digite pelo menos um caractere especial."]
    else 
        div [ style "color" "green"][ text "Ok"]