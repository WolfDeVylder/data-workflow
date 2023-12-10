# data-workflow

## data.sh:
Het script begint met #!/bin/bash dit is het begin van elk shell script.
Ik stak de plaats waar het opgeslaan moet worden plus de naam in een variable waar de datum dynamisch ook wordt bij geplaatst.

Dan gebruikte ik curl om data te kunnen trekken van een API link van stad gent over blue bike fietsen.
Door het commando -o stak ik de output in de variable die ik al had gedefinieerd.

## CSVconvert.sh:
Het begint met #!/bin/bash.
Daarna gebruik ik *for* file *in.json;do*, dit betekent dat elke file in de locatie waar ik in zit die eindigt op json, daar wordt het volgende commando op uitgevoerd.

Dat volgende commando is jq -r, de -r staat kort voor --raw , dus geen aanhalingstekens in de uitvoer.

Om de headers van de kolommen te krijgen steek ik voor de data de headers in een array die even lang is als het aantal items dat ik wil verzamelen via jq.
Je moet ervoor ook al eens de json files bekijken met het commando *cat ... .json | jq* zo kan je de structuur zien en hoe je gaat pipen om efficienter te zijn.

.Records[] was het eerste en daarna was elke element dat ik moest hebben(tijd,gebruikte fietsen en ongebruikte fietsen) op het zelfde niveau.
Nu kan ik gewoon de structuur afgaan, omdat de fietsen in gebruik en ongebruikte fietsen nog onder *fields* staan,
moet je nog eens *.fields* voor de andere zetten zodat je piping werkt.

Nadien pipe je weer met *@csv* zodat het omgezet wordt in csv.

Na het commando zie je dat er *$file* staat dus voor elke file gaat zonder problemen in csvdataBB.csv gestoken worden.
Het is een soort loop die je maakt die zich aanpast aan alle json files.

## dubbelsBB.sh:
Shell script begint met #!/bin/bash.
Dan is er een if structuur die controleert of de csvdataBB.csv is aangemaakt of niet.
Zoniet dan gooit die een error die weergeeft dat het bestand nog niet bestaat.
Als het zo zou zijn is er *exit 1* dus dan breekt het script af.

Vervolgens wordt het commando *awk* gebruikt die lijn per lijn controleert of er niets dubbels is.
Als er iets dubbel staat dan wordt die lijn niet in het gefilterde bestand gezet.
Na elke lijn is overlopen overschrijven we het eerste *csvdataBB.csv* met het gefilterde zodat we nu een gefilterde hebben in het csvdataBB.csv bestand.

## graph.py:
Ik steek het lezen van het csv bestand in een variabele zodat het makkelijker is om te schrijven.
Ik gebruik pandas voor het inlezen.

Met df.plot geef ik mee welk soort grafiek ik wil.
Ik zeg kind = 'bar' het wordt dus een barchart.

Ik geef het ook een gepaste titel en een label voor de x en y as.

Doordat de x waarde gedraaid was gebruikte ik *xticks rotation=360* om de getallen juist weer te geven.

Via *plt.show()* toon ik de grafiek.

## pythontoPNG.sh
Het runt gewoon via python3 de python code om een afbeelding van de grafiek maken die je kan opslaan.

## csv-to-md.sh
Ik steek de csv file in een variable voor het gemak en ook de naam van de output, de .md file is afhankelijk van de variable *csv_file* als je dus de variabele csv_file aanpast wordt md_file ook direct aangepast.

Het script leest elke lijn van de file die je in de variabele csv_file steekt.

Voor elke lijn zet hij de *IFS(Internal field seperator)* tot read zodat elke lijn afzonderlijk is.

Het gebruikt *sed* om elke komma te vervangen met het piping symbool ( | ) en met spaties langs de zijkanten.
De pipe symbolen zijn gelijk kolom delimiters.

Het voegt ook ( | ) aan het begin en het einde toe om een soort border te creëeren.

Dan wordt elke lijn in de variabele md_file gestoken.

Als het gedaan is wordt alles terug in de csv_file gestoken en een nieuwe lijn toegevoegd om het goed to formateren en dan terug in de md_file te steken.

## Makefile:
Er is een all command die als je *make all* doet dan voert hij alle scripts uit in volgorde om het csv en md bestand te krijgen.

Je kan ook afzonderlijk *make dubbelsBB* doen om enkel dat script uit te voeren.

De reden dat er bash voor staat is dat het een shell script is en de -o betekent de output erna en dan geef je het een filename dus dan zet je daar gewoon de csvdataBB.csv of .md in.

*make clean* verwijdert de twee bestanden en dan kan je ze opnieuw genereren in een keer door *make all* te doen.

*make all* of elke make commando voer je in commando line uit.
