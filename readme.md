# Setup

Det första som kommer att behövas för den här workshopen är att man har en fungerande node-installation. Lättast är väl att gå på nodes hemsisida https://nodejs.org/en/ och ladda ner det. När man har det så kan man i vart fall programmera javascript och det behövs för att komma igång med workshoppen.

Steg två är att installera elm. Det gör man med npm. Kör en `npm install -g elm` så är det på plats. För att kolla att det fungerar kan du i terminalen köra `elm-repl` startar det så har du elm. Wohoo! För att komma ur det så kan du skriva `:exit`. 

Så där ja. Nu är du redo. Jag förutsätter att du har någon form av text editor installerad. Om inte rekomenderar jag Visual Studio Code med elm pluginnet https://marketplace.visualstudio.com/items?itemName=sbrink.elm . Har man det så får man bra syntax coloring och även elm-format installera det med `npm install  -g elm-format` sen måste det konfugureras i VS code. Hur man gör det står på elm-pluginens infosida.

# Varför elm

Varför kör vi elm nu då? Workshopen skall ju handla om funktionell programmering i allmänhet och inte elm. Det går ju bra att göra funktionell programmering i nästan alla språk men jag har valt elm för att det är enkelt att få en stabil och fungerande miljö. Det är viktigt om man försöker komma igång med många personer. Man vill inte sitta och konfigurera miljöer i all evighet. En annan anledning är att det är ett ganska hårt funktionellt språk. Det finns ingen möjlighet att fuska här. Många andra språk tillåter att man löser problemen på icke-funktionella sätt men här finns inga möjligheter till fusk. Inga for-loopar. Ingen möjlighet att göra sidoeffekter som fuskar ingenting. 

Sen är communityn trevlig. Det är lätt att få hjälp och folk är intresserade av att bygga saker istället för att se vem som kan mest kategoriteori. Det är rätt så viktigt.

Det finns förståss nackdelar med elm också. Det är inte lika "kraftfullt" som säg purescript eller haskell. Det finns inga typklasser. Det finns inga dependent types och så vidare. Det här är inget problem. Det är länge tills man bottnar i elm-poolen. Det kommer inte hända här och nu. Det kanske aldrig händer. Det mesta som man vill göra duger elm till och som undervisningsspråk i ämnet så tycker jag det är perfekt

# Nu kör vi 

## Mål

* Lära sig hur man använder elm-repl
* Lära sig strängar och numer
* Lära sig hur man anropar funktioner

## REPL

REPL står för Read Eval Print Loop. Det är en grej som man kör i terminalen för att köra elm-kod. Man skriver komamndon och dom exikveras direkt. Det här är perfekt för att experimentera med saker. Det här är något som är gemensamt för dom allra flesta funktionella språk jag testat. Man sitter och labbar i språkets REPL för att testa fram en funktion. Det fungerar bäst i funktionella språk eftersom en funktion inte kan ha några beroenden utanför funktionen så det blir aldrig några problem med beroende till annat. Det är så klart olika mellan olika språk. Lisp är t.ex. ett språk där det allra mesta sker i REPL och i Scala är det inte alls lika viktigt. I Elm landar vi ngåonstans i mitten. Ett bra verktyg i vart fall.

Man startar REPL genom att skriva `elm-repl` Här kan du nu skriva normal elm-kod och se vad som händer. 

Testa skriva lite olika uttryck:
``` elm
> "Hejsan"
"Hejsan" : String
> 100
100 : number
> 50 / 7
7.142857142857143 : Float
> 4 + 3 * (6 - 2)
16 : number
```

Det verkar ju fungera. Man ser här att när man skriver ett uttryck så får man se resultatet och även vilken datatyp resultatet har. Det är vitkigare med typer i funktionella språk än i andra språk kommer man att märka sen men här kan man se att det är ungefär som typerna i JavaScript. Det är hur som helst inget som man måste specificera. Elm klarar av att lista ut typer i otroligt många fall. Det är skillnad mot C# eller Java där den är betydligt sämre på det.

### Variabler

Variabler skapas helt enkelt genom att man skriver varibalens namn och vad den skall vara

```elm
> x = 5
5 : number
> y = 3
3 : number
> x + y
8 : number
```

Ingen större skillbnad mot att bara skriva uttrycken som ni ser.

### Strängar

Strängar deinieras med `"` och kan konkateneras med `++`

```elm
> "Hej" ++ ", fåntratt"
" Hej, fåntratt" : String
> "Blok"
"Blork" : String
```

### Errormeddelanden

Något som är bra med elm är att errormeddelanden är ett stort fokus med kompilatorn. Man får ytterst mycket och bra information här. Det kan i och för sig ibland vara rätt svårt att tyda den men den är helt i en egen klass jämfört med andra när man vant sig och även för nybörjare är den betydligt bättre än allt annat.

```elm
 10 + "kattmat"
-- TYPE MISMATCH --------------------------------------------- repl-temp-000.elm

The right side of (+) is causing a type mismatch.

3|   10 + "kattmat"
          ^^^^^^^^^
(+) is expecting the right side to be a:

    number

But the right side is:

    String

Hint: To append strings in Elm, you need to use the (++) operator, not (+).
<http://package.elm-lang.org/packages/elm-lang/core/latest/Basics#++>

Hint: With operators like (+) I always check the left side first. If it seems
fine, I assume it is correct and check the right side. So the problem may be in
how the left and right arguments interact.
```

man kan testa lite olika sådana där för att se vad som händer. Rent generellt skall det gå bra att läsa och tyda det där om man inte stöter på superkonstiga typer eller så.

### Anropa funktioner

I "vanliga" språk så anropar man funktioner med parenteser `toString(10000)` men i elm så kan man skippa parenteserna `toString 10000`. Man kan använda parenteser men det är definitivt inget som man gör i onödan Det är mer för att hjälpa till för att göra det tydligare vilken ordning saker resolvas i.

### Importera moduler

Nu finns ju allt inte i det globala namespacet utan man kan måsta importera moduler. Detta görs med funktionen `import`

```elm
import String
> String.toUpper "bananfluga"
"BANANFLUGA" : String
```

Vill man slippa skriva String. före så kan man även importera en enskild funktion. Generellt gillar jag att man inte bara importerar funktioner om man inte använder dom extremt mycket. Svårare att se var dom kommer ifrån om man gör så.

```elm
> import String exposing (toUpper)
toUpper "fiskrens"
"FISKRENS" : String
```

### Definiera egna funktioner

Hur gör man då om man vill göra en egen funktion? Det känns ju rätt viktigt. Jo det fungerar ungefär som variablerna i REPL.

```elm
> helloName name exclamation = "Hello, " ++ name ++ exclamation
<function> : String -> String -> String
```

Okej det var ju rätt rakt på sak. Som ni ser behöver man oftast inte ange vilka typer inparametrarna är. Det listar kompilatorn ut. Det här är t.ex. något som inte Java eller C# kan. Men vad betyder `String -> String -> String` då? Jo i dom flesta hårdare funktionella språk så är funktioner curried som standard. Det betyder att det inte finns funktioner i språket som tar flera inparametrar utan varje funktion har bara en parameter in. Så Det här betyder egentligen att du har en funktion som heter `helloName` som tar `name` och returnerar en ny funktion som tar `exclamation` och returnerar en sträng. Det här fungerar t.ex. i JavaScript också men inte automatiskt. Man ser i bland

```javascript
const helloName = name => exclamation => "Hello, " + name + exclamation
```

Det där är ungefär samma sak bara att man slipper skriva det. Man kan även anropa funktionen med alla parametrar på en gång och det gör man oftast. Mer om att inte göra det sen bara man vet att signaturen betyder att helloName tar två strängar och returnerar en sträng.

## Grundläggande övningar

Nu skall vi se. För att komma igång med språket så gör vi lite övningar. Istället för att sitta i REPL så kan ni klona https://github.com/ulve/elm-basics.git här finns allt ni behöver för att göra övningarna.

Övningarna går till så att vi går igenom ett stycke sen labbar vi lite med det vi pratat om. För att labba har jag gjort en övningsfil som man kan köra. För att köra övningarna startar ni `elm-reactor` i mappen dit ni clonade repot. Då startar en webbserver på http://localhost:8000 surfa dit och klicka på `Main.elm` så ser ni övningarna. Ändra sen i Main.elm och ladda om sidan så ser ni om dom går igenom

## Funktioner

Det är så här. Funktioner i Elm har egentligen bara en rad. Man kan inte utan trick göra flera saker i en funktion. Den gör en sak och returnerar den saker. Det innebär att det sista i varje funktion returneras. Det här är rätt vanligt i funktionella språk. Man returnerar implicit det sista den räknar ut. 

Något annat som kan vara bra att veta är att man kallar anropa en funktion för att applicera funktionen (på indatat). En funktion i elm måste retunera något. Man kan inte göra en funktion som inte returnerar något. Det finns så klart sätt att göra ltie mer i en funktion än en grej men regeln är att man oftast gör hemskt lite i funktionerna.

```elm
testRetur =
    "det här är egnetligen en funktion som returnerar en sträng"

testRestur2 str =
    str ++ " Den här funktionen tar även en inparameter men returnerar något annat"

-- Den här funktionen har en typannotering. Här kan man skriva vilka typerna skall vara. Om man skippar denna så ser man att den inte kommer att hantera heltal utan istället kommer att hantera number som är mer generellt än heltal. Då går den att anropa med både flyttal och heltal. Nu kommer den bara att gå anropa med heltal.
add : Int -> Int -> Int
add x y = x + y
```

## Strängar

För strängar finns en hel massa intressant i strängmodulen. `++` är sättet man lägger ihop strängar och i Strängmodulen finns intressanta saker som t.ex. `left` och `dropLeft`

## if/case-satser

Här börjar det skilja sig lite mot vanliga programspråk. En if-sats är en tilldelning i elm och man kan inte hoppa över else. I Javascript fungerar t.ex.

```javascript
let a = ""
if(katt)
  a = "katt"
```

Det är inget som fungerar i elm. Man kan inte bara ba en if utan else. Man kan däremot tilldela en variabel en if-sats.

```elm
-- Man kan tildlela en variabel en ifsats
a = if katt then
      "katt"
    else
      ""

-- Eller returnera den från en funktion
katt : Bool -> String
katt ärDetEnKatt = 
    if ärDetEnKatt then
        "Det är en katt"
    else
        "Det är inte en katt"

hund : String -> String
hund hurLåterDen = 
    if hurLåterDen == "Voff" then
        "Det är en hund"
    else if hurLåterDen == "Mjau" then
        "Det är en fisk"
    -- Den här kommer att behövas annars kommer if-satsen inte att täcka allt och vi kommer inte att få returvärden på allt
    else 
        "Jag har ingen aning om vad det är, kanske en älg"
```

sen finns även case-satser

```elm
numberOfWords : Int -> String
numberOfWords n =
    case n of
        0 -> "Inga ord"
        1 -> "Ett ord
        _ -> "På tok för många ord att räkna"
```

## Listor

Elm skiljer sig från Javascript med att alla listor måste ha samma typ. Det här är normalt för t.ex. C# och Java men är man inte van det så kan man bli lite konfunderad. Listorna är länkade listor och inte Arrayer som standard. Det är här det funktionella börjar dyka upp. I javascript så gör man 

```javascript
const testList = [1, 2, 3, 4, 5]
testList.map(x => x + 1)
```

här finns alltså funktionen på listprototypen. Eftersom objekt inte är något som finns i funktionella språk så är map en egen funktion som lever ett eget liv. det finns dessutom olika map för olika saker, inte bara listor men det är något som kommer mycket mycket senare.

```elm
testList = [1, 2, 3, 4, 5]
List.map \x -> x + 1 testList
```

Här ser ni även hur man skriver lambdafunktioner i Elm. det hade gått bra att definiera funktionen som vanligt och anropa den

```elm
testList = [1, 2, 3, 4, 5]

addOne : Int -> Int
addOne n = n + 1

List.map addOne testList
```

Det finns inte bara map (select i C#) utan även andra favoriter som filter och fold (reduce i JS aggregate i C#)

```elm

testList = [1, 2, 3, 4, 5]

List.filter (\x -> x % 2 /= 0) testList
-- Här ser ni för övrigt hur modulo ser ut (%) och hur != ser ut /= det är inte som i vanliga javascript 

List.foldl (+) 0 testList
-- Okej nu var det lite trick inblandat. (+) är alltså funktionen + (det är en helt vanlig funktion) som jag använder på alla element i listan 0 är startvärdet
-- varv ett så kommer 0 + 1 att anropas
-- varv två så kommer 1 (resultatet från förra varvet) + 2
-- varv tre så kommer 3 (än en gång förra resultatet) + 3
-- osv. Mycket kraftfullt, fungerar som i alla andra språk men man ser det mindre ofta där.
-- Vill man göra det tydligare så kan man göra en egen add funktion istället för +
add : Int -> Int -> Int
add x y = x + y

List.foldl add 0 testList
-- Ger samma resultat
``` 

## Records

Nu finns det ju inte bara enkla datatyper i Elm. Man kan även göra något som heter records. Liknar struct eller objekt i andra språk. Det här är något som man kommer att behöva tids nog när man programmerar. Det man får tänka på här är att records är immutable. Det finns inget sätt att mutera dom. Man får skapa en ny om man skall ändra på den. Det här skiljer från dom flesta andra vanliga språk.

Så här gör man en record

```elm
katt {name = "Kisse", height = 3}

-- Vill man nu ha in den i en funktion så kan man säga att funktionen skall ha fälten name och height 

isNamedKisse : {name: String} -> Bool
isNamedKisse katt = katt.name == "Kisse"
-- Oooh kolla här ser ni att man kan komma åt fält på ett record med . notationen

-- Vill man skapa ett nytt record från ett existerande så finns hjälpfunktioner för det också
grow : {name : String, height : Int} -> {name : String, height : Int}
grow katt = {katt | height = katt.height + 1}

```

En bra sak med den här typen av typ-signaturer är att vi kan göra så den klarar olika typer så länge dom har dom fälten vi efterfrågar. 

```elm
katt {name = "Kisse", height = 3}
hund {name = "Vovve", width = 10}

isNamedKisse : {name: String} -> Bool
isNamedKisse katt = katt.name == "Kisse"

isNamedKisse hund -- fungerar
isNamedKisse katt -- fungerar också
```

Det som är trist med det här är ju att vi måste skriva en massa va. Man kan däremot göra alias för typer!

```elm
type alias Katt =
{ name : String
, height : Int
, color : String
}

-- Då får vi på köpet även en funktion för att skapa en Katt
Katt "Fisken" 4 "Brunröd"
```

## Let

Jag skrev tidigare att det inte finns något sätt att göra flera saker i en och samma funktion. Det är inte ritkigt sant. Man kan sätta upp information som behövs för det sista som görs i en funktion med ett så kallat `let` kommando. Let sätter ett scope där informationen finns
```elm
enFunktion =
    let
        variabel = "information"
        enAnnanVariabelk = 123
    in
        variabel ++ (toString enAnnanVariabel)
```

## Partiell applikation

den här syntaxen som vi använt för att beskriva funktioners variabler
`Int -> Int -> Int` så säger vi egentligen att vi har en funktion som tar en int och svarar med en funktion som tar en int som i sin tur svarar med en int. Alla funktioner i språket är curried som det kallas. 

```elm
add : Int -> Int -> Int 
add x y = x + y
```
Anger man bara en parameter så får man en ny funktion som svar.

I JavaScript är det tydligare för där är inget curried från start så man ser ofta

```js
const add = x => y => x + y
const addOne = add(1)
// function
addOne(2)
// 3

// Eller om man skall köra direkt
add(1)(2)
// 3
```

det blir betydligt smidigare i språk som har bra stöd för det här

```elm
add x y = x + y
addOne = add 1
addOne 2
-- 3
-- eller o man skall köra direkt
add 1 2 
-- 3
```

När man bara anger några av parametrarna så kallas det för partiell applikation. Där av namnet. Värt att tänka på att i dom flesta språk så kan man inte välja vilken ordning parametrarna appliceras. Man tar från väster först.

## Komposition

Värt att tänka på att när man pratar om funktionell programmering så är funktionerna i fokus. Efter ett tag så går det mesta ut på att sätta ihop olika funktioner. I Elm finns det två hvudsätt att göra det på. Det första sättet är så kallad piping. Det gör man med operatorn
`|>` 
Det tar alltså data från vänster sida och stoppar in det i funktionen på höger sida

```elm
double x = x * 2
plusOne x = x + 1
2 |> plusOne |> double
6 : number
```

Det finns även en variant av den här som går åt andra hållet. `<|` vilken man använder beror på vilket håll man vill att datat skall flöda.

Det är när man börjar använda den här typen av funktioner man ser storheten med partiell applikation

```elm
add x y =  x + y
multiply x y = x * y
1 |> add 2 |> multiply 2
-- 6
```

I det där exemplet kan man alltså skippa alla mellansteg och göra en `addOne` funktion eller så. 

Det andra sättet man kan sätta ihop funktioner är med operatorn `>>` den fungerar som klister mellan två funktioner och ger en ny funktion som svar

`addThenDouble = addOne >> double`

Det är i stort sett samma sak du får en funktion som har inparametrar som den första och utparametrar som den sista som svar. Det kräver att utparametern från addOne passar in som inparameter på double. Som ni ser så nämner vi aldrig parametern. Det kan vara ytters förvrrande när man aldrig sett det förr. Det kallas för Point Free Notation.

`addThenDouble num = (addOne num) >> (double)` skulle man kunna skriva.

