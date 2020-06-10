module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes as HA exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Keyed as Keyed
import Markdown.Option exposing (..)
import Markdown.Render
import Random
import Strings
import Style exposing (..)


main : Program Flags Model Msg
main =
    Browser.element
        { view = view
        , update = update
        , init = init
        , subscriptions = subscriptions
        }


type alias Model =
    { sourceText : String
    , counter : Int
    , seed : Int
    }


type Msg
    = Clear
    | GetContent String
    | GenerateSeed
    | NewSeed Int
    | RestoreText
    | MarkdownMsg Markdown.Render.MarkdownMsg


type alias Flags =
    {}


init : Flags -> ( Model, Cmd Msg )
init flags =
    let
        model =
            { sourceText = Strings.initialText
            , counter = 0
            , seed = 0
            }
    in
    ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetContent str ->
            ( { model
                | sourceText = str
                , counter = model.counter + 1
              }
            , Cmd.none
            )

        GenerateSeed ->
            ( model, Random.generate NewSeed (Random.int 1 10000) )

        NewSeed newSeed ->
            ( { model | seed = newSeed }, Cmd.none )

        Clear ->
            ( { model
                | sourceText = ""
                , counter = model.counter + 1
              }
            , Cmd.none
            )

        RestoreText ->
            ( { model
                | counter = model.counter + 1
                , sourceText = Strings.initialText
              }
            , Cmd.none
            )

        MarkdownMsg _ ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div outerStyle
        [ display model
        ]


display : Model -> Html Msg
display model =
    div []
        [ editor model
        , renderedSource model
        , p [ style "clear" "left", style "margin-top" "-20px" ] [ clearButton 60, restoreTextButton 80 ]
        ]


label text_ =
    p labelStyle [ text text_ ]


editor : Model -> Html Msg
editor model =
    textarea (editorTextStyle ++ [ onInput GetContent, value model.sourceText ]) []


renderedSource : Model -> Html Msg
renderedSource model =
    Keyed.node "div"
        renderedSourceStyle
        [ ( String.fromInt model.counter, Markdown.Render.toHtml ExtendedMath model.sourceText |> Html.map MarkdownMsg ) ]



-- BUTTONS


clearButton width =
    button ([ onClick Clear ] ++ buttonStyle colorBlue width) [ text "Clear" ]


restoreTextButton width =
    button ([ onClick RestoreText ] ++ buttonStyle colorBlue width) [ text "Restore" ]
