module Main exposing (..)

import Html exposing (Html)
import Html.Attributes
import String
import Color exposing (Color)


--
-- Strings
--


strings : String
strings =
    "En massa text"


sayHello : String -> String
sayHello friendsName =
    "TODO: Implementera mig!"


formatPhoneNumber : String -> String -> String -> String
formatPhoneNumber country area local =
    -- TIPS: kolla på http://package.elm-lang.org/packages/elm-lang/core/latest/String för några trick
    -- det format vi vill ha: +46 (0)920-41152
    "TODO: implementera mig"


contains : String -> Bool
contains str =
    -- TIPS: kolla på http://package.elm-lang.org/packages/elm-lang/core/latest/String för några trick
    -- TODO: implementera mig
    False



--
-- If Statements
--


isGreaterThanTen : Int -> Bool
isGreaterThanTen x =
    -- TODO: implementera mig
    False


howHotIsThePepper : Float -> String
howHotIsThePepper heatUnits =
    "TODO: Implementera mig"



--
-- Case-statements
--


case1 : Int -> Bool
case1 a =
    False



--
-- Lists
--


reverseTheList : List a -> List a
reverseTheList inputList =
    -- TODO: vänd på listan
    -- TIPS: kolla på http://package.elm-lang.org/packages/elm-lang/core/latest/List för några smarta funktioner
    []


addOne : List Int -> List Int
addOne inputList =
    -- TODO: lägg på ett på vart element på listan
    []


removeOs : List String -> List String
removeOs inputList =
    -- TODO: ta bort alla värden som börjer med "0"
    []



--
-- Records
--


type alias Person =
    { name : String, age : Int }


newborn : String -> { name : String, age : Int }
newborn name =
    -- TODO: laga mig
    { name = "", age = -1 }


ageDifference : { name : String, age : Int } -> { name : String, age : Int } -> Int
ageDifference person1 person2 =
    -- TODO: fix me
    0


nameChange : String -> { name : String, age : Int } -> { name : String, age : Int }
nameChange newName person =
    -- TODO: laga mig
    person


getOlder : { name : String, age : Int } -> { name : String, age : Int }
getOlder person =
    -- TODO: laga mig
    person


combinedYears : List { name : String, age : Int } -> Int
combinedYears people =
    -- TODO: laga mig
    0



--
-- Tuples
--


signAndMagnitude : Int -> ( String, Int )
signAndMagnitude x =
    -- TODO: Implementera mig
    ( "TODO", 0 )



--
-- Dictionaries
--


dictionary1 : Int -> Bool
dictionary1 a =
    False



--
-- Union types
--


union1 : Int -> Bool
union1 a =
    False



--
-- Maybe
--


maybe1 : Int -> Bool
maybe1 a =
    False



--
-- 🎉 Grattis 🎉  Du är klar!
--
--
--
--
-- Här nere bor drakar 🐲
-- Nä men det är hela testprogrammet. Fritt fram att kolla
-- Här är själva testen


exercises : List ( String, List Exercise )
exercises =
    [ ( "Stängar"
      , [ functionExercise1 "sayHello"
            "Den här funktionen skall ta ett namn in och svara med en hälsning till det namnet."
            sayHello
            [ ( "Olov", "Hello, Olov" )
            , ( "Torkel", "Hello, Torkel" )
            ]
        , functionExercise3 "formatPhoneNumber"
            "Tar in en landskod. Lägger till plus på den. Stoppar nollan mellan parenteser (ni kan nog anta att den alltid kommer med) och lägger ett bindestreck mellan riktnummer och telefonnummer."
            formatPhoneNumber
            [ ( ( "46", "0920", "41152" ), "+46 (0)920-41152" )
            , ( ( "46", "070", "2252822" ), "+46 (0)70-2252822" )
            ]
        , functionExercise1 "contains"
            "Du får en sträng och innehåller den substrängen \"is\" oavsett stora och små bokstäver så vill ha True"
            contains
            [ ( "Isbrytare", True )
            , ( "Fiskrens", True )
            , ( "Sillsalad", False )
            ]
        ]
      )
    , ( "If-satser"
      , [ functionExercise1 "isGreaterThanTen"
            "Du får ett heltal och du svarar om det är större än tio."
            isGreaterThanTen
            [ ( 13, True )
            , ( 3, False )
            , ( 10, False )
            ]
        , functionExercise1 "howHotIsThePepper"
            "Styrka är ett heltal. En stryka på under 10 är \"svag\" 11 till 500 \"mild\". 501 till 5000 är \"medium\" och allt över 5000 är stark."
            howHotIsThePepper
            [ ( 2, "svag" )
            , ( 100, "mild" )
            , ( 3000, "medium" )
            , ( 50000, "stark" )
            ]
        ]
      )
    , ( "Case-satser"
      , [ functionExercise1 "case1"
            "Lite om casesatser"
            case1
            [ ( 1, True )
            , ( 2, False )
            ]
        ]
      )
    , ( "Listor"
      , [ functionExercise1 "reverseTheList"
            "Du får en lista som du skall vända på."
            reverseTheList
            [ ( [ 7, 0, 1, 4, 9 ], [ 9, 4, 1, 0, 7 ] )
            , ( [ 99, -1 ], [ -1, 99 ] )
            ]
        , functionExercise1 "addOne"
            "Du får en lista som du skall returnera en lista som ser likadan ut men som är ett större på varje post."
            addOne
            [ ( [ 7, 0, 1, 4, 9 ], [ 8, 1, 2, 5, 10 ] )
            , ( [ 99, -1 ], [ 100, 0 ] )
            ]
        , functionExercise1 "removeOs"
            "Du får en lista med strängar. Äckliga ord som börjar på O skall bort."
            removeOs
            [ ( [ "Jessie", "Anibus", "Osirus" ], [ "Jessie", "Anibus" ] )
            , ( [ "Apple", "Banana" ], [ "Apple", "Banana" ] )
            , ( [ "Octothorpe", "Octohash" ], [] )
            ]
        ]
      )
    , ( "Records"
      , [ functionExercise1 "newborn"
            "Gör en funktion som tar namnet på en person och returnerar en record som uppfyller stämmer."
            newborn
            [ ( "Jenny", { name = "Jenny", age = 0 } )
            , ( "Abey", { name = "Abey", age = 0 } )
            ]
        , functionExercise2 "ageDifference"
            "Du får två personer och räknar ut skillnaden i ålder mellan personerna."
            ageDifference
            [ ( ( { name = "Nicole", age = 40 }, { name = "Angel", age = 30 } ), 10 )
            , ( ( { name = "Igor", age = 18 }, { name = "Alexei", age = 23 } ), 5 )
            ]
        , functionExercise2 "nameChange"
            "Skickar in ett namn och en person. Får tillbaks en ny record där namnet är bytt."
            nameChange
            [ ( ( "Mr. T", { name = "Laurence", age = 34 } ), { name = "Mr. T", age = 34 } )
            , ( ( "Demi", { name = "Demetria", age = 17 } ), { name = "Demi", age = 17 } )
            , ( ( "Ƭ̵̬̊", { name = "Prince", age = 35 } ), { name = "Ƭ̵̬̊", age = 35 } )
            ]
        , functionExercise1 "getOlder"
            "Du får två personer och returnerar den äldre av dessa"
            getOlder
            [ ( { name = "Jenny", age = 0 }, { name = "Jenny", age = 1 } )
            , ( { name = "Igor", age = 18 }, { name = "Igor", age = 19 } )
            ]
        , functionExercise1 "combinedYears"
            "Du får en lista med personer och lägger samman personernas ålder."
            combinedYears
            [ ( [ { name = "Ruth Bader Ginsburg", age = 83 }
                , { name = "Gloria Allred", age = 75 }
                , { name = "Caroline Kennedy", age = 58 }
                ]
              , 216
              )
            , ( [ { name = "Amy Poehler", age = 45 }
                , { name = "Chris Pratt", age = 37 }
                , { name = "Rashida Jones", age = 40 }
                , { name = "Aziz Ansari", age = 33 }
                , { name = "Retta", age = 46 }
                ]
              , 201
              )
            ]
        ]
      )
    , ( "Tupler"
      , [ functionExercise1 "signAndMagnitude"
            "Du får ett heltal och retunerar en tupel med tecken och storlek."
            signAndMagnitude
            [ ( -7, ( "-", 7 ) )
            , ( 3, ( "+", 3 ) )
            , ( 10, ( "+", 10 ) )
            , ( -44, ( "-", 44 ) )
            ]
        ]
      )
    , ( "Dictionaries"
      , [ functionExercise1 "dictionary1"
            "Lite om dictionaries"
            dictionary1
            [ ( 1, True )
            , ( 2, False )
            ]
        ]
      )
    , ( "Mer avancerade typer"
      , [ functionExercise1 "union1"
            "Ingen aning än"
            union1
            [ ( 1, True )
            , ( 2, False )
            ]
        ]
      )
    , ( "Maybe"
      , [ functionExercise1 "maybe1"
            "Lite om datatypen maybe"
            maybe1
            [ ( 1, True ), ( 2, False ) ]
        ]
      )

    -- , ( "HTML", [] )
    ]



-- Här är var allt börjar


main : Html Never
main =
    Html.div
        [ Html.Attributes.style [ ( "padding", "20px" ) ] ]
        [ pageStyle
        , exercises
            |> List.map (\( title, x ) -> viewExerciseSection title x)
            |> Html.div []
        ]


outputLabel : String -> Html msg
outputLabel label =
    Html.div
        [ Html.Attributes.style
            [ ( "font-size", "12px" )
            , ( "opacity", "0.4" )
            ]
        ]
        [ Html.text label ]



-- En kliten fuling för att styla sidan så man kan få lite roligare format


pageStyle : Html msg
pageStyle =
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



-- Den här ritar ut resultatet från en övning


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



-- Den här används för att rita ut kodexempel


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



-- gör om En färg till en css-färg


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



-- Det här är typen som beskriver ett övning


type alias Exercise =
    { name : String
    , description : String
    , testCases : List ( String, Bool, String, String )
    }



-- ritar en hel övning


viewExercise : Exercise -> Html Never
viewExercise { name, description, testCases } =
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

        showDescription desc =
            [ Html.div [] [ Html.text desc ] ]
    in
        Html.div [ Html.Attributes.class "exercise" ]
            [ goalHeading name
            , Html.div [] (showDescription description)
            , Html.div [] (showTestCases [] testCases)
            ]



-- Överskrift för målet av en övning


goalHeading : String -> Html msg
goalHeading name =
    Html.h3 []
        [ Html.text "Mål: implementera "
        , inlineCode name
        , Html.text " funktionen så att testen fungerar."
        ]



-- Ritar ut en kategori


viewSection : (a -> Html msg) -> String -> List a -> Html msg
viewSection view title content =
    Html.div []
        [ Html.h2 [] [ Html.text title ]
        , content
            |> List.map view
            |> Html.div []
        ]



-- Kör en funktion


functionExerciseN : (a -> String) -> String -> String -> (a -> value) -> List ( a, value ) -> Exercise
functionExerciseN argsToString name description function testCases =
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



-- Kör en övning med ett argument


functionExercise1 : String -> String -> (a -> value) -> List ( a, value ) -> Exercise
functionExercise1 =
    functionExerciseN toString



-- Kör en övning med två argument


functionExercise2 : String -> String -> (a -> b -> value) -> List ( ( a, b ), value ) -> Exercise
functionExercise2 name description function testCases =
    functionExerciseN
        (\( a, b ) -> toString a ++ " " ++ toString b)
        name
        description
        (\( a, b ) -> function a b)
        testCases



-- Kör en övning med tre argument


functionExercise3 : String -> String -> (a -> b -> c -> value) -> List ( ( a, b, c ), value ) -> Exercise
functionExercise3 name description function testCases =
    functionExerciseN
        (\( a, b, c ) -> toString a ++ " " ++ toString b ++ " " ++ toString c)
        name
        description
        (\( a, b, c ) -> function a b c)
        testCases



-- Ritar ut en sektion med övningar


viewExerciseSection : String -> List Exercise -> Html Never
viewExerciseSection title exercises =
    viewSection viewExercise title exercises


successEmoji =
    "🎉"


successColor =
    Color.green


keepWorkingEmoji =
    "😭"


keepWorkingColor =
    Color.yellow
