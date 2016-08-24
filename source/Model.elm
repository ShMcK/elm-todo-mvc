module Model exposing (..)

import Ui.App

type alias Model =
  { todo: String
  , todos: List String
  }

model =
  { todo = ""
  , todos = []
  }


init : Model
init =
  { todo = ""
  , todos = [ "First Item", "Second Item" ]
  }
