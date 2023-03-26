module Main where

import Prelude

import Effect (Effect)
import Halogen (ClassName(..), Component, defaultEval, mkComponent, mkEval)
import Halogen.Aff (awaitBody, runHalogenAff)
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Halogen.VDom.Driver (runUI)

main :: Effect Unit
main = runHalogenAff do
  body <- awaitBody
  runUI component unit body

component :: forall q i o m. Component q i o m
component =
  mkComponent
    { initialState: \_ -> unit
    , render: \_ -> HH.div [ HP.class_ $ ClassName "w-screen h-screen text-5xl flex justify-center items-center" ] [ HH.text "Hello Halogen!" ]
    , eval: mkEval $ defaultEval
    }
