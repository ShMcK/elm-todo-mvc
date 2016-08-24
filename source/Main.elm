module Main exposing (..)

import Html.App

import Model exposing (..)
import Update exposing (..)
import View exposing (..)


main =
  Html.App.beginnerProgram
    { model = model
    , view = view
    , update = update

    }
