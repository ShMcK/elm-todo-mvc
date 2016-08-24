module Update exposing (..)

import Model exposing (..)

type Msg
  = UpdateText String
  | AddItem
  | RemoveItem String

update msg model =
  case msg of
    UpdateText todo ->
      { model |
        todo = todo }
    AddItem ->
      { model |
        todos = model.todo :: model.todos }
    RemoveItem todo ->
      { model |
        todos = List.filter (\t -> t /= todo) model.todos }
