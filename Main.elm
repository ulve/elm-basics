module Main exposing (..)

import ExerciseRunner exposing (..)
import Html exposing (Html)
import Html.Attributes
import String


--
-- Strings
--


sayHello : String -> String
sayHello friendsName =
    "TODO: implementera mig"


formatPhoneNumber : String -> String -> String -> String
formatPhoneNumber country area local =
    -- TIPS: kolla på http://package.elm-lang.org/packages/elm-lang/core/latest/String för några trick
    -- desired format: +46 920-41152
    "TODO: implementera mig"


initials : String -> String -> String
initials firstName lastName =
    -- TIPS: kolla på http://package.elm-lang.org/packages/elm-lang/core/latest/String för några trick
    "TODO: implementera mig"



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
-- 🎉 Grattis 🎉  Du är klar!
--
--
--
--
-- Här nere bor drakar 🐲
--


examples : List ( String, List Example )
examples =
    [ ( "Strings"
      , [ functionExample1 "sayHello"
            sayHello
            [ ( "Olov", "Hello, Olov" )
            , ( "Torkel", "Hello, Torkel" )
            ]
        , functionExample3 "formatPhoneNumber"
            formatPhoneNumber
            [ ( ( "46", "0920", "41152" ), "+46 920-41152" )
            , ( ( "46", "070", "2252822" ), "+46 70-2252822" )
            ]
        , functionExample2 "initials"
            initials
            [ ( ( "Olov", "Johansson" ), "OJ" )
            , ( ( "Torkel", "Svensson" ), "TS" )
            , ( ( "Per", "Bluffmakare" ), "PB" )
            ]
        ]
      )
    , ( "If Statements"
      , [ functionExample1 "isGreaterThanTen"
            isGreaterThanTen
            [ ( 13, True )
            , ( 3, False )
            , ( 10, False )
            ]
        , functionExample1 "howHotIsThePepper"
            howHotIsThePepper
            [ ( 2, "not hot" )
            , ( 100, "mild" )
            , ( 3000, "medium" )
            , ( 50000, "hot" )
            ]
        ]
      )
    , ( "Lists"
      , [ functionExample1 "reverseTheList"
            reverseTheList
            [ ( [ 7, 0, 1, 4, 9 ], [ 9, 4, 1, 0, 7 ] )
            , ( [ 99, -1 ], [ -1, 99 ] )
            ]
        , functionExample1 "addOne"
            addOne
            [ ( [ 7, 0, 1, 4, 9 ], [ 8, 1, 2, 5, 10 ] )
            , ( [ 99, -1 ], [ 100, 0 ] )
            ]
        , functionExample1 "removeOs"
            removeOs
            [ ( [ "Jessie", "Anibus", "Osirus" ], [ "Jessie", "Anibus" ] )
            , ( [ "Apple", "Banana" ], [ "Apple", "Banana" ] )
            , ( [ "Octothorpe", "Octohash" ], [] )
            ]
        ]
      )
    , ( "Records"
      , [ functionExample1 "newborn"
            newborn
            [ ( "Jenny", { name = "Jenny", age = 0 } )
            , ( "Abey", { name = "Abey", age = 0 } )
            ]
        , functionExample2 "ageDifference"
            ageDifference
            [ ( ( { name = "Nicole", age = 40 }, { name = "Angel", age = 30 } ), 10 )
            , ( ( { name = "Igor", age = 18 }, { name = "Alexei", age = 23 } ), 5 )
            ]
        , functionExample2 "nameChange"
            nameChange
            [ ( ( "Mr. T", { name = "Laurence", age = 34 } ), { name = "Mr. T", age = 34 } )
            , ( ( "Demi", { name = "Demetria", age = 17 } ), { name = "Demi", age = 17 } )
            , ( ( "Ƭ̵̬̊", { name = "Prince", age = 35 } ), { name = "Ƭ̵̬̊", age = 35 } )
            ]
        , functionExample1 "getOlder"
            getOlder
            [ ( { name = "Jenny", age = 0 }, { name = "Jenny", age = 1 } )
            , ( { name = "Igor", age = 18 }, { name = "Igor", age = 19 } )
            ]
        , functionExample1 "combinedYears"
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

    -- , ( "HTML", [] )
    ]


bonusExamples : List ( String, List Example )
bonusExamples =
    [ ( "Tuples"
      , [ functionExample1 "signAndMagnitude"
            signAndMagnitude
            [ ( -7, ( "-", 7 ) )
            , ( 3, ( "+", 3 ) )
            , ( 10, ( "+", 10 ) )
            , ( -44, ( "-", 44 ) )
            ]
        ]
      )

    -- , ( "Union types", [] )
    -- , ( "Case statements", [] )
    -- , ( "Maybes", [] )
    -- , ( "Complex case statements", [] )
    -- , ( "Dictionaries", [] )
    ]


main : Html Never
main =
    Html.div
        [ Html.Attributes.style [ ( "padding", "20px" ) ] ]
        [ fontStyles
        , examples
            |> List.map (\( title, x ) -> viewExampleSection title x)
            |> Html.div []
        , Html.h1 [] [ Html.text "Bonus Sections" ]
        , bonusExamples
            |> List.map (\( title, x ) -> viewExampleSection title x)
            |> Html.div []
        ]
