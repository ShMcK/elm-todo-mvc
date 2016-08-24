module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)

import Model exposing (..)
import Update exposing (..)

todoItem todo =
  li [] [
    div [ class "view" ] [
      input [ class "toggle"
            , type' "checkbox"
      ] []
      , label [] [ text todo ]
      , button [ class "destroy"
               , onClick (RemoveItem todo)
      ] []
    ]
  ]

todoList todos =
  let
    children = List.map todoItem todos
  in
    ul [ class "todo-list"] children

todoInput todo =
  input [ class "new-todo"
          , placeholder "What needs to be done?"
          , type' "text"
          , onInput UpdateText
          , value todo
  ]

todoHeader =
  header [ class "header"] [
    h1 [] [ text "Todos" ]
  ]

todoFooter todos =
  footer [ class "footer"] [
    span [ class "todo-count"] [ text "1 item left"]
    , todoFilters
  ]

todoFilters =
  ul [ class "filters" ]
    [ li [] [
      a [ href "#" ] [ text "All" ]
    ]
    , li [] [
        a [ href "#" ] [ text "Active" ]
      ]
    , li [] [
      a [ href "#" ] [ text "Completed"]
    ]
  ]

view : Model -> Html.Html Msg
view model =
  div [ class "todoapp"] [
    todoHeader
    , div [] [
      todoInput model.todo []
      , button [ onClick AddItem ] [ text "Add"]
      , todoList model.todos
    ]
    , todoFooter model.todos
  ]
