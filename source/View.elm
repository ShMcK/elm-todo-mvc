module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)

import Model exposing (..)
import Update exposing (..)

todoItem todo =
  li []
    [ text todo
    , button [ onClick (RemoveItem todo) ] [ text "X" ]
    ]

todoList todos =
  let
    children = List.map todoItem todos
  in
    ul [] children

view : Model -> Html.Html Msg
view model =
  div []
    [
    h1 [] [ text "Todo List" ]
    , input [ type' "text"
            , onInput UpdateText
            , value model.todo
            ] []
    , button [ onClick AddItem ] [ text "Add"]
    , todoList model.todos
    ]
