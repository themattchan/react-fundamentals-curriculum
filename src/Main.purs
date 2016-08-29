module Main where

import Prelude
import React.DOM as D
import React.DOM.Props as P
import Container                     (container)
import Control.Monad.Eff             (Eff)
import Control.Monad.Eff.Console     (log)
import DOM                           (DOM())
import DOM.HTML                      (window)
import DOM.HTML.Types                (htmlDocumentToDocument)
import DOM.HTML.Window               (document)
import DOM.Node.NonElementParentNode (getElementById)
import DOM.Node.Types                (Element, ElementId(..),
                                      documentToNonElementParentNode)
import Data.Int                      (decimal, toStringAs)
import Data.Maybe                    (fromJust)
import Data.Nullable                 (toMaybe)
import Partial.Unsafe                (unsafePartial)
import React                         (ReactElement, ReactClass,
                                      createElement, createFactory, createClass,
                                      createClassStateless,
                                      writeState, readState, spec, getProps)
import ReactDOM                      (render)

hello :: forall props. ReactClass { name :: String | props }
hello = createClass $ spec unit \ctx -> do
  props <- getProps ctx
  pure $ D.h1 [ P.className "Hello"
              , P.style { background: "lightgray" }
              ]
              [ D.text "Hello, "
              , D.text props.name
              , createElement (createClassStateless \props' ->
                                D.div' [ D.text $ "Stateless" <> props'.test ])
                                { test: " test" } []
              ]
