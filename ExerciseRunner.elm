module ExerciseRunner exposing (..)

import Color exposing (Color)
import Html exposing (Html)
import Html.Attributes
import String
import Style exposing (..)


outputLabel : String -> Html msg
outputLabel label =
    Html.div
        [ Html.Attributes.style
            [ ( "font-size", "12px" )
            , ( "opacity", "0.4" )
            ]
        ]
        [ Html.text label ]


fontStyles : Html msg
fontStyles =
    Html.div []
        [ Html.node "link"
            [ Html.Attributes.href "https://fonts.googleapis.com/css?family=Bungee+Shade"
            , Html.Attributes.rel "stylesheet"
            , Html.Attributes.type_ "text/css"
            ]
            []
        , Html.node "link"
            [ Html.Attributes.href "http://fonts.googleapis.com/css?family=Raleway"
            , Html.Attributes.rel "stylesheet"
            , Html.Attributes.type_ "text/css"
            ]
            []
        , Html.node "style" [] [ Html.text """
h1, h2, .title-font { font-family: 'Bungee Shade', Georgia, Times, serif; }
h1 {   text-align: center;font-size: 90px; line-height: 100px; border-bottom: 3px solid black; }
h2 {   text-align: center;font-size: 70px; line-height: 100px; }

body {
    font-family: 'Raleway', Helvetica, Arial, sans-serif;
    font-size: 15px;
    line-height: 25px;
    background: -moz-linear-gradient(-45deg, #fcecfc 0%, #fd89d7 71%, #ff7cd8 100%); 
    background: -webkit-linear-gradient(-45deg, #fcecfc 0%,#fd89d7 71%,#ff7cd8 100%); 
    background: linear-gradient(135deg, #fcecfc 0%,#fd89d7 71%,#ff7cd8 100%); 
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center; 
}

.exercise {
    box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
    padding: 20px;
    margin-bottom: 40px;
    background: -moz-linear-gradient(-45deg, rgba(231,242,208,1) 0%, rgba(164,237,19,1) 100%);
    background: -webkit-linear-gradient(-45deg, color-stop(0%, rgba(231,242,208,1)), color-stop(100%, rgba(164,237,19,1)));
    background: linear-gradient(135deg, rgba(231,242,208,1) 0%, rgba(164,237,19,1) 100%);
}
""" ]
        ]


viewAssertion : Bool -> String -> String -> String -> Html Never
viewAssertion isCorrect call actual expected =
    if isCorrect then
        Html.div
            [ Html.Attributes.style
                [ ( "margin-left", "32px" )
                , ( "background-color", colorToCssString successColor )
                ]
            ]
            [ Html.span
                [ Html.Attributes.style
                    [ ( "padding", "4px" )
                    , ( "margin", "8px" )
                    ]
                ]
                [ Html.text successEmoji ]
            , inlineCode call
            , Html.text " == "
            , Html.text actual
            ]
    else
        Html.div
            [ Html.Attributes.style
                [ ( "margin-left", "32px" )
                ]
            ]
            [ outputLabel "Din implementation:"
            , Html.div
                [ Html.Attributes.style
                    [ ( "background-color", colorToCssString keepWorkingColor )
                    ]
                ]
                [ Html.span
                    [ Html.Attributes.style
                        [ ( "padding", "4px" )
                        , ( "margin", "8px" )
                        ]
                    ]
                    [ Html.text keepWorkingEmoji ]
                , inlineCode call
                , Html.text " == "
                , Html.text actual
                ]
            , outputLabel "Förväntat:"
            , Html.div
                [ Html.Attributes.style
                    [ ( "background-color", colorToCssString Color.gray )
                    ]
                ]
                [ Html.span
                    [ Html.Attributes.style
                        [ ( "padding", "4px" )
                        , ( "margin", "8px" )
                        , ( "opacity", "0" )
                        ]
                    ]
                    [ Html.text keepWorkingEmoji ]
                , inlineCode call
                , Html.text " == "
                , Html.text expected
                ]
            ]


inlineCode : String -> Html msg
inlineCode code =
    Html.div
        [ Html.Attributes.style
            [ ( "display", "inline-block" )
            , ( "background-color", "rgba(238, 238, 238, 0.7)" )
            , ( "padding", "4px" )
            , ( "margin", "0" )
            , ( "font-family", "monospace" )
            , ( "whitespace", "pre" )
            ]
        ]
        [ Html.text code ]


colorToCssString : Color -> String
colorToCssString color =
    let
        components =
            Color.toRgb color
    in
        String.concat
            [ "rgb("
            , toString components.red
            , ","
            , toString components.green
            , ","
            , toString components.blue
            , ")"
            ]


type alias Example =
    { name : String
    , description: String
    , testCases : List ( String, Bool, String, String )
    }


isFinished : Example -> Bool
isFinished example =
    List.all (\( _, isCorrect, _, _ ) -> isCorrect) example.testCases


viewExample : Example -> Html Never
viewExample { name, description, testCases } =
    let
        showTestCase ( code, isCorrect, actual, expected ) =
            Html.div []
                [ viewAssertion isCorrect code actual expected ]

        showTestCases results remainingTestCases =
            case remainingTestCases of
                [] ->
                    List.reverse results

                ( code, isCorrect, actual, expected ) :: rest ->
                    showTestCases (showTestCase ( code, isCorrect, actual, expected ) :: results)
                        (if isCorrect then
                            rest
                         else
                            []
                        )
        showDescription desc = [Html.div [] [Html.text desc]]
    in
        Html.div [Html.Attributes.class "exercise"]
            [ goalHeading name
            , Html.div [] (showDescription description)
            , Html.div [] (showTestCases [] testCases)
            ]


goalHeading : String -> Html msg
goalHeading name =
    Html.h3 []
        [ Html.text "Mål: implementera "
        , inlineCode name
        , Html.text " funktionen så att testen fungerar."
        ]


functionExampleN : (a -> String) -> String -> String -> (a -> value) -> List ( a, value ) -> Example
functionExampleN argsToString name description function testCases =
    { name = name
    , description = description
    , testCases =
        List.map
            (\( arg1, expected ) ->
                ( name ++ " " ++ argsToString arg1
                , function arg1 == expected
                , toString <| function arg1
                , toString expected
                )
            )
            testCases
    }


functionExample1 : String -> String -> (a -> value) -> List ( a, value ) -> Example
functionExample1 =
    functionExampleN toString


functionExample2 : String -> String -> (a -> b -> value) -> List ( ( a, b ), value ) -> Example
functionExample2 name description function testCases =
    functionExampleN
        (\( a, b ) -> toString a ++ " " ++ toString b)
        name
        description
        (\( a, b ) -> function a b)
        testCases


functionExample3 : String -> String -> (a -> b -> c -> value) -> List ( ( a, b, c ), value ) -> Example
functionExample3 name description function testCases =
    functionExampleN
        (\( a, b, c ) -> toString a ++ " " ++ toString b ++ " " ++ toString c)
        name
        description
        (\( a, b, c ) -> function a b c)
        testCases


viewSection : (a -> Html msg) -> String -> List a -> Html msg
viewSection view title content =
    Html.div []
        [ Html.h2 [] [ Html.text title ]
        , content
            |> List.map view
            |> Html.div []
        ]


viewExampleSection : String -> List Example -> Html Never
viewExampleSection title examples =
    if List.all isFinished examples then
        Html.span
            [ Html.Attributes.class "title-font"
            , Html.Attributes.style
                [ ( "background-color", colorToCssString Style.successColor )
                , ( "padding", "4px" )
                , ( "margin", "4px" )
                ]
            ]
            [ Html.text successEmoji
            , Html.text " "
            , Html.text title
            ]
    else
        viewSection viewExample title examples
