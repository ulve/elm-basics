---
theme : "Moon"
transition: "fade"
highlightTheme: "dracula"
---

# Funktionell programmering

### En introduktion

<small>Av Olov Johansson / [@ulve](http://twitter.com/ulve)</small>

---

## Varför Elm

* Går inte fuska med 
* Trevlig kompilator 
* "lagom" avancerad 
* Extremt vänlig community 

https://discourse.elm-lang.org/ 

---

<!-- .slide: data-transition="slide" data-background="#833" data-background-transition="fade" -->

## Struktur

* Frekventa korta demon 
* Frekventa egna övningar

---

## Elm REPL

* Vad är en REPL
* Hur startar man den

--

# Demo
### Alt + tab

--

## Skriva in en sträng

Strängar skrivs med "runt"

```elm
> "Hej jag är en sträng"
"Hej jag är en sträng" : String
```

--

## Skriva in en siffra

```elm
> 5
5 : number

> 5.0 
5.0 : Float
```

--

# Demo

---

## Uttryck

Man kan använda REPL för att skriva uttryck med

--

## Lägga ihop Strängar

```elm
> "Katter" ++ " och " ++ " Hundar"
"Katter och Hundar" : String
```

--

# Räkna 

```elm
> 1 + 2
3 : number
``` 
```elm
> 1 / 2
0.5 : Float
```

---

## Variabler

```elm
> x = "katt"
"katt" : String
> y = "hund"
"hund" : String
> x + " " + y
"katt hund" : String
```

---

## Importera moduler

```elm
> import String
```

---

## Anropa funktioner


```js
const test = "katt"
test.toUpper()
//=> "KATT"
```

<!-- .element: class="fragment" -->

```elm
> toUpper "katt"
"KATT" : String
```
<!-- .element: class="fragment" -->

---

# Egna funktioner

Typannoteringar

```elm
addKatt : String -> String
addKatt strängen = strängen ++ "katt"
```

--

## Anropa

```elm
> addKatt "hejsan"
"hejsankatt" : String
```

--

## Fakta om funktioner

* En funktion gör bara en sak
* Returnerar alltid det sista i funktionen

---

# Övningar

 https://ovningar.maybec.at/

---

## Strängar

http://package.elm-lang.org/packages/elm-lang/core/latest/String

Sätt ihop strängar med ++

( parenteser kan användas för att gruppera uttryck)

```elm
> "katt" ++ (String.left 1 "hund") ++ "fisk"` 
"katthfisk" : String
```

--

## 1

Skickar in ett namn och vill ha tillbaks en hälsningsfras

```elm
sayHello : String -> String
```

--

## 2

Ganska lurig den här. 

```elm
formatPhoneNumber : String -> String -> String -> String
```
det format vi vill ha: 

`+46 (0)920-41152`

--

## 3

```elm
contains : String -> Bool
```

---

# If-satser

* If-satser i elm kan aldrig vara utan else
* If-är en tilldelning inte en flödeskontroll

--

```elm
> x = if 100 > 10 then 
  "hund"
else
  "fisk"
"fisk" : String
```

--

```elm
> tal = 60
70 : number
> x = if tal > 100 then
"Stoooort"
else if tal > 60 then
"Mellan"
else
"Litet
"Mellan" : String
```

--

```elm
< 
>
<=
>=
==
/= -- Wierd
```

---

## Listor

Finns både listor

```elm
> lista = [1, 2, 3, 4]
[1, 2, 3, 4] : List number
```

```elm
> lista = ["katt", "hund", "fisk"]
["katt", "hund", "fisk"] : List String
```

--

# Funktioner på listor

Finns en hel massa funktioner i List-modulen

* List.map
* List.filter

--

## lambda-funktioner

```elm
\v -> v + 10
```

---

## Records

Används för att logiskt gruppera data

```elm
type alias Katt =
{ color: String
, sound: String
}
```

--

```elm
setColor : String -> { color: String, sound: String }
setolor color = {color = color, sound = "Mjaoo"} 
```

--

Lite jobbigt kanske, men man kan använda aliaset

```elm
setColor : String -> Katt
setolor color = {color = color, sound = "Mjaoo"} 
```

--

Finns ett annat sätt att skapa en Katt

```elm
setColor : String -> Katt
setolor color = Katt "Red" "Mjaooo" 
```

--

Komma åt saker i en Records

```elm
> katt = Katt "Red" "Mjaooo"
{ color = "Red", sound = "Mjaooo" } : Repl.Katt
> katt.color
"Red" : String
```

--

Sen kan man uppdatera en record

```elm
> {katt | color = "Blue"}
{ color = "Blue", sound = "Mjaooo" } : Repl.Katt
```

---

# Elm arkitekturen

--

## Model

* Varje aplikation har en typ som beskriver state. Den kallas för model.
* Kan inte modifieras
* Sätts till ett käns initialt värde när applikationen startar

--

## Msg

* Det här är en "enum" som beskriver alla olika händelser som kan ske i applikationen
* Ett centralt ställe att ha alla actions på
* Inget förutom dom kan inträffa

--

## Update

```elm
Msg -> Model -> Model
```

* En funktion som tar en state och en action och producerar en ny state
* Här gär man då det som skall göras för varje action

--

## View

```elm
Model -> Html
```

* Den här funktionen tar en state och producerar html från den
* Allt helt deklarativt

--

## Html

* Dom flesta html-element är rätt lika
* Beskrivs av funktioner i elm
* Näst intill alla element i html finns som funktioner och dom är väldigt lika varandra

```elm
div : List Attribute -> List Html -> Html
span : List Attribute -> List Html -> Html
h1 :  List Attribute -> List Html -> Html
text : String -> Html
```

--

## Attribut

* Attribut man kan ha på ett element

```elm
class : String -> Attribute
id : String -> Attribute
```

--

## Generera meddelanden

* Det finns vissa element som kan generera meddelanden

```elm
onClick : Msg -> Attribute
onInput : (String -> Msg) -> Attribute
```
