### A Pluto.jl notebook ###
# v0.20.13

using Markdown
using InteractiveUtils

# ╔═╡ 58efddbe-caf1-499f-ad0b-524ba078d180
begin
	using Pkg
	Pkg.activate(".")
end

# ╔═╡ f0e20c4b-3f9d-46c6-b0e8-a2facebd795a
using PlutoUI

# ╔═╡ 032fa5b6-f32f-4be6-a237-947363acf28e
using Plots, ImageShow, FileIO, ImageIO, Images, FourierTools, DifferentialEquations, Makie, GLMakie,FFTW, ABCDMatrixOptics, Unitful

# ╔═╡ 561a09dd-667c-44e1-a8f8-08c9ac877e6b
# hier installieren wir automatisch einige Pakete, das kann etwa 15 Minuten dauern

# ╔═╡ 4d90a5e2-8a74-403d-bd90-9bc5bcd8201b
TableOfContents()

# ╔═╡ 56329202-c5bb-49fb-a82b-abf261f35f27


# ╔═╡ 042f8796-4ea0-11f0-0b91-4d6bdcdda00a
md"""
# Willkommen zu Julia! Eine interaktive Einführung 🚀

Hallo! In diesem Notebook lernst du die Grundlagen der Programmiersprache **Julia**. Julia ist eine moderne, schnelle und dynamische Sprache, die sich besonders gut für wissenschaftliches Rechnen, Datenanalyse und vieles mehr eignet.

Mit Pluto-Notebooks wie diesem kannst du Code direkt ausführen und die Ergebnisse sofort sehen. Probier's aus!

## Dein erstes Julia-Programm: Hallo Welt!

Traditionell startet man beim Lernen einer neuen Sprache mit einem "Hallo Welt!"-Programm. In Julia geht das so:
"""


# ╔═╡ 84655e4c-d98d-46ed-bf81-3a23aa55bc5d
# Dies ist eine Code-Zelle. Klicke auf den "Play"-Button (oder Shift+Enter), um sie auszuführen.
println("Hallo Welt! Julia ist hier!")

# ╔═╡ 1df138b8-6779-4f32-a09c-12e0a692d49c
md"""
Super! `println()` ist eine **Funktion**, die den Text (einen sogenannten **String**) in den Anführungszeichen auf dem Bildschirm ausgibt.

## Variablen und Datentypen

Variablen sind wie Container, in denen wir Daten speichern können. Du kannst einer Variablen mit dem `=` Zeichen einen Wert zuweisen.

Schauen wir uns ein paar Beispiele an:
"""


# ╔═╡ 66e54d39-29e3-498b-8f7c-7767869b1d31
# Wir erstellen eine Variable namens 'alter' und weisen ihr die Zahl 17 zu.
alter = 17

# ╔═╡ d0bcd705-f46f-46d3-bc27-34b3e23b12f4
# Wir erstellen eine Variable namens 'name' und weisen ihr den Text "Alex" zu.
name = "Alex"

# ╔═╡ e6529119-a064-42d9-beea-c88f6318012d
# Wir können auch Kommazahlen speichern (sogenannte 'Floats')
groesse_in_metern = 1.75

# ╔═╡ 29434f4b-3738-4cdf-98cd-e663a1daeef5
# Und Wahrheitswerte ('Booleans')
ist_schueler = true # kann 'true' oder 'false' sein

# ╔═╡ f1fee53a-17c9-4027-b961-b8365fece30e
# Jetzt geben wir die Werte dieser Variablen aus:
println("Name:", name)

# ╔═╡ 4bedef1b-fdcc-4e92-b8e5-1c50bfbff3bf
println("Alter:", alter)

# ╔═╡ f895a451-848e-4afb-a8e2-67b99524e41b
println("Größe (m):", groesse_in_metern)

# ╔═╡ f810e1d4-81dc-4f4f-82d2-40aa463ab675
println("Ist Schüler:", ist_schueler)

# ╔═╡ d722f9e7-a786-4b3a-8d50-ff4e3e3b79b6
md"""
Julia erkennt automatisch, welcher **Datentyp** eine Variable hat (z.B. Zahl, Text, Wahrheitswert). Du musst es nicht explizit angeben.

## Einfache Berechnungen

Mit Zahlen können wir natürlich auch rechnen:
"""


# ╔═╡ b5e0569b-19cf-4cae-a37a-b2a4d37f3cbd
zahl1 = 10

# ╔═╡ a8843a3e-2bd1-4f5d-a567-20b4f0a48159
zahl2 = 5

# ╔═╡ 257b4aa6-0140-4680-a519-d35fedfcdedb
summe = zahl1 + zahl2

# ╔═╡ fb255854-0c7f-4a81-adb9-e90fc122e605
differenz = zahl1 - zahl2

# ╔═╡ c7257df1-e6bb-4749-8a4f-b576a6e49a91
produkt = zahl1 * zahl2

# ╔═╡ e3f8a862-e3c0-48b4-b214-363676cbc8ad
quotient = zahl1 / zahl2 # Beachte: Division ergibt immer eine Kommazahl (Float)

# ╔═╡ b9ac1496-cb15-4eb0-90d9-9da02be99e88
println("Summe:", summe)

# ╔═╡ d00e3325-9fa9-4d65-9578-6f7b8e698fae
println("Differenz:", differenz)

# ╔═╡ 2d9019c9-bf04-4205-a34e-a587cac1c89d
println("Produkt:", produkt)

# ╔═╡ 76bc594c-aa7f-4c3c-9162-150c1205b4d0
println("Quotient:", quotient)

# ╔═╡ f1f0059f-16ad-4832-98d8-6ac733613f0d
# Potenzieren geht mit dem ^ Operator
potenz = zahl1^2 # 10 hoch 2

# ╔═╡ 5f8b0933-89e6-43e9-a5da-cd6020819670
println("10 hoch 2:", potenz)

# ╔═╡ 40e8edc4-2a27-4826-9893-b395421446e0


# ╔═╡ 25f71e0c-2bda-4558-80c6-109f6ce59ced


# ╔═╡ 129b280e-d9d7-4fce-8604-ac42a108dc8c
md"""
## Funktionen: Wiederverwendbare Codeblöcke

Funktionen sind super nützlich, um Code zu organisieren und wiederverwendbar zu machen. Stell dir vor, du hast eine Aufgabe, die du öfter erledigen musst. Anstatt den Code jedes Mal neu zu schreiben, definierst du einmal eine Funktion und rufst sie dann bei Bedarf auf.

Eine Funktion in Julia wird mit dem Schlüsselwort `function` definiert, gefolgt vom Funktionsnamen, den Argumenten (Eingabewerten) in Klammern und dem Codeblock, der mit `end` abgeschlossen wird.
"""


# ╔═╡ 9c9ec8e2-9e7d-4132-bfbe-d9009246c83e
# Eine einfache Funktion, die zwei Zahlen addiert und das Ergebnis zurückgibt
function addiere(a, b)
  ergebnis = a + b
  return ergebnis # 'return' gibt den Wert zurück
end

# Wir rufen die Funktion auf:

# ╔═╡ f9ad063e-423c-46e7-b4de-286e0c819527
summe1 = addiere(5, 3)

# ╔═╡ d0fda889-73cd-4131-b851-0ffbdeeee788
summe2 = addiere(100, 250)

# ╔═╡ ffa75020-cc69-45b7-9af0-8614236587dd
println("5 + 3 =", summe1)

# ╔═╡ 5407d25b-bec5-46e2-9882-83cd321fa2b9
println("100 + 250 =", summe2)

# ╔═╡ d631c915-e7b5-4268-944d-33886e840d57
# Funktionen können auch ohne 'return' etwas tun, z.B. etwas ausgeben:
function begruesse(name)
  println("Hallo, ", name, "!")
end

# ╔═╡ 31a76063-6716-46a8-ac2f-0ddd18b51f88
begruesse("Julia-Lerner")

# ╔═╡ ef9a2c39-adb6-4685-9dc6-41cedf0fdec2
begruesse("Pluto")

# ╔═╡ 62208b95-b8b3-43e3-ba83-bc99d1ada609
md"""
Es gibt auch eine kompaktere Schreibweise für einfache Funktionen:
`funktionsname(argumente) = ausdruck`
"""

# ╔═╡ d153dd69-dc16-41a7-a741-a1ac1432230e
# Die Additionsfunktion in kompakter Form:
addiere_kompakt(a, b) = a + b

# ╔═╡ bb0c744c-698d-44a2-a47a-d65cdad47f63
summe3 = addiere_kompakt(7, 8)

# ╔═╡ e9aa91bb-d116-42b7-86b6-2e2033936068
println("7 + 8 (kompakt) =", summe3)

# ╔═╡ d43313ce-9737-4d79-81d0-62cc13867f0e
# Beispiel: Überprüfen, ob eine Zahl positiv, negativ oder Null ist
zahl = -5

# ╔═╡ 4fccf02c-a3fb-435e-b53e-c3a3257a41a7
if zahl > 0
  println(zahl, " ist positiv.")
elseif zahl < 0
  println(zahl, " ist negativ.")
else
  println(zahl, " ist Null.")
end

# Noch ein Beispiel: Altersüberprüfung

# ╔═╡ 784345f7-b2fb-4cb3-845f-d0848657b6aa
alter_person = 17

# ╔═╡ ba26fa5c-5b8f-4512-9d48-250ba3716346
if alter_person >= 18
  println("Die Person ist volljährig.")
else
  println("Die Person ist minderjährig.")
end

# ╔═╡ 2a645d56-54cc-4460-aec8-8bc61dad2717
md"""
## Schleifen: Code wiederholt ausführen

Schleifen erlauben es uns, einen Codeblock mehrmals auszuführen.

### Die `for`-Schleife

Eine `for`-Schleife wird verwendet, wenn wir wissen, wie oft wir etwas wiederholen wollen, oder wenn wir über eine Sammlung von Elementen (z.B. Zahlen in einem Bereich) iterieren möchten.
"""


# ╔═╡ 7553667e-1bc5-4d58-b3ea-f9ea2b4b708c
# Gib die Zahlen von 1 bis 5 aus:
println("Zahlen von 1 bis 5:")

# ╔═╡ df4b855e-4c57-4338-ac6e-20723f5cdc29
for i in 1:5 # '1:5' erstellt einen Bereich von Zahlen
  println(i)
end

# ╔═╡ 6457c9d9-98cf-4e3f-bbbc-dba946a15020
# ╠═╡ disabled = true
#=╠═╡

  ╠═╡ =#

# ╔═╡ 7c979ddd-aac9-4a6e-88de-6a3f4565bb63
begin
	summe_bis_10 = 0
	# Summiere die Zahlen von 1 bis 10:
	for j in 1:10
	  summe_bis_10 = summe_bis_10 + j
	  # Kurzschreibweise: summe_bis_10 += j
	end
	
	println("Die Summe der Zahlen von 1 bis 10 ist: ", summe_bis_10)
end

# ╔═╡ 95c4412b-73b1-4f0b-b2d5-a3647a6d48f1
# Iteriere über die Buchstaben eines Wortes (Strings sind Sammlungen von Zeichen)
wort = "Julia"

# ╔═╡ b4ecd75c-87b0-4837-b7ea-21169b991f66
println("Buchstaben im Wort '", wort, "':")

# ╔═╡ a29f31b9-615e-43e7-950c-75dec7776c34
for buchstabe in wort
  println(buchstabe)
end

# ╔═╡ 1d12959e-d7e5-47ec-8c84-68e47fe0395d
md"""
### Die `while`-Schleife

Eine `while`-Schleife führt einen Codeblock so lange aus, wie eine bestimmte Bedingung wahr (`true`) ist. Sie ist nützlich, wenn wir nicht genau wissen, wie oft die Schleife laufen muss, sondern nur, wann sie aufhören soll.
"""


# ╔═╡ fd536b7b-73ea-4a79-95df-19add3b164e5
begin
	# Beispiel: Countdown von 5 bis 1
	println("Countdown:")
	counter = 5
	while counter > 0
	  println(counter)
	  counter = counter - 1 # Wichtig: Die Bedingung muss sich ändern, sonst Endlosschleife!
	  # Kurzschreibweise: counter -= 1
	end
	println("Start!")
	
	# Beispiel: Finde die erste Potenz von 2, die größer als 100 ist
	potenz_von_2 = 1
	exponent = 0
	while potenz_von_2 <= 100
	  potenz_von_2 = 2^exponent
	  println("2 hoch ", exponent, " = ", potenz_von_2)
	  exponent += 1
	end
	println("Die erste Potenz von 2 größer als 100 ist ", potenz_von_2, " (2 hoch ", exponent-1, ")")
	
end

# ╔═╡ aa2feec1-1adb-4e0f-b766-859f95bf4793
md"""
Das waren die Grundlagen zu Funktionen und Kontrollstrukturen! Mit diesen Bausteinen kannst du schon deutlich komplexere Programme schreiben.

Experimentiere ruhig mit den Beispielen und versuche, eigene kleine Aufgaben zu lösen!
"""


# ╔═╡ bd8dcb2b-7640-4f97-8389-ec619e2e006d


# ╔═╡ 750888cb-4f04-480c-b4fd-bdb0d445c687


# ╔═╡ 4c5c99f2-c279-46f0-9eb3-7c58df28dd6f
md"""
## Arrays (Listen/Vektoren): Sammlungen von Werten

Bisher haben wir mit einzelnen Werten in Variablen gearbeitet. Oftmals möchten wir aber eine Sammlung von zusammengehörigen Werten speichern und bearbeiten. Dafür gibt es **Arrays**.

Ein Array ist eine geordnete Liste von Elementen. Diese Elemente können Zahlen, Strings oder sogar andere Arrays sein. In Julia sind Arrays sehr flexibel.

### Arrays erstellen

Es gibt mehrere Wege, Arrays zu erstellen:
"""


# ╔═╡ f5e38db1-649e-438a-ac96-bf31995b4377
# Ein Array mit Zahlen erstellen
zahlen_array = [10, 20, 30, 40, 50]

# ╔═╡ a8b14ccc-e2ce-4055-8b8a-d53dd003574b
println("Zahlen-Array:", zahlen_array)

# Ein Array mit Strings (Texten)

# ╔═╡ f376df2d-2bf8-4c68-bb13-8369593476b9
namen_array = ["Anna", "Ben", "Clara", "David"]

# ╔═╡ ef578903-f118-43bf-b473-e116774d46bb
println("Namen-Array:", namen_array)

# ╔═╡ 6fc3a967-ac08-4f9a-9768-b761cc7b103e
# Ein Array mit gemischten Datentypen (möglich, aber oft ist ein Typ pro Array besser)
gemischt_array = [1, "Hallo", 3.14, true]

# ╔═╡ 599990f2-685c-4897-88ec-8c84673a0fbc
println("Gemischtes Array:", gemischt_array)

# ╔═╡ 676dacca-6030-474b-a271-144d1ac4549b
# Ein leeres Array erstellen, dem wir später Elemente hinzufügen können
# Hier geben wir den Typ der Elemente an, die das Array enthalten soll (hier Integer)
leeres_zahlen_array = Int[] # Oder Vector{Int}()

# ╔═╡ 02cf8f58-48e9-421d-9c9e-efea9f43b218
println("Leeres Zahlen-Array:", leeres_zahlen_array)

# ╔═╡ 39ddce72-811f-4f7e-9be0-cf7373d031a2
leeres_string_array = String[] # Oder Vector{String}()

# ╔═╡ b7d75a50-f705-4242-b7b7-43e0e1d34c78
println("Leeres String-Array:", leeres_string_array)

# ╔═╡ c6881807-7c12-4784-9e75-a0ed2d21acfb
md"""
### Auf Elemente zugreifen (Indizierung)

Du kannst auf einzelne Elemente in einem Array über ihren **Index** zugreifen.
**Wichtig:** In Julia beginnt die Zählung der Indizes bei **1** (nicht bei 0 wie in vielen anderen Sprachen).

Das erste Element hat den Index `1`, das zweite den Index `2`, und so weiter.
"""


# ╔═╡ 4c36ab27-0bb3-4360-984c-5bb1f0ff7c79
meine_zahlen = [5, 10, 15, 20, 25]

# ╔═╡ f8ac6e92-987e-439b-b5c0-52710eb3e0b2
erstes_element = meine_zahlen[1] # Greift auf das Element an Position 1 zu

# ╔═╡ fa1d4666-52dd-4127-a6f7-73b1daeb9b54
drittes_element = meine_zahlen[3]

# ╔═╡ 8dcf10c7-2c5a-47ad-b46f-991f6791064b
println("Das erste Element ist: ", erstes_element)

# ╔═╡ 50b10442-9e93-481d-8ef2-ca5498516a63
println("Das dritte Element ist: ", drittes_element)

# Du kannst auch den Index 'end' verwenden, um auf das letzte Element zuzugreifen

# ╔═╡ f5685218-0892-4a6b-abd2-c46b5c8d1932
letztes_element = meine_zahlen[end]

# ╔═╡ 9f056721-27da-47d5-9a5e-5563b28e6e62
println("Das letzte Element ist: ", letztes_element)

# ╔═╡ 004c9ae0-138f-4076-816e-1eafa5e1bc3b
vorletztes_element = meine_zahlen[end-1]

# ╔═╡ 6196c98a-4feb-4a2f-821f-4d261bfd9dd2
println("Das vorletzte Element ist: ", vorletztes_element)

# ╔═╡ 82577b69-837a-43ee-bb91-e64b2042df71
md"""
### Elemente verändern

Du kannst die Werte von Elementen in einem Array ändern, indem du ihnen über ihren Index einen neuen Wert zuweist.
"""


# ╔═╡ 4ce39d71-fab9-4825-819e-a44c9ce35def
md"""
### Nützliche Funktionen für Arrays

Es gibt viele eingebaute Funktionen, die mit Arrays arbeiten.

*   `length(array)`: Gibt die Anzahl der Elemente im Array zurück.
*   `push!(array, element)`: Fügt ein Element am Ende des Arrays hinzu. Das `!` am Ende des Funktionsnamens deutet an, dass die Funktion das Array selbst verändert (mutiert).
*   `pop!(array)`: Entfernt das letzte Element aus dem Array und gibt es zurück.
*   `append!(array1, array2)`: Hängt alle Elemente von `array2` an `array1` an.
*   `sort(array)`: Gibt eine neue, sortierte Version des Arrays zurück (verändert das Original nicht).
*   `sort!(array)`: Sortiert das Array direkt (mutiert das Original).
"""

# ╔═╡ 271684b8-0ed5-42c3-b150-61ab99aab73d
meine_liste = [30, 10, 40, 20]

# ╔═╡ 20db471d-6a46-43a0-890b-a45d9619b149
println("Originalliste: ", meine_liste)

# ╔═╡ 22f063d8-78c2-450f-af7c-bf1624126246
# Länge des Arrays
println("Länge der Liste: ", length(meine_liste))

# ╔═╡ 7601a9a6-b2f6-40b5-a1a6-4285e84759a1
# Element hinzufügen
push!(meine_liste, 50)

# ╔═╡ 341282c7-c084-4404-900c-d5d4243efed2
println("Nach push!(..., 50): ", meine_liste)

# ╔═╡ 7f166c90-982e-4731-b2b4-226a499e0fa4
# Letztes Element entfernen
entferntes_element = pop!(meine_liste)

# ╔═╡ b28ebb04-c541-4fa6-8d08-f5fb763fd834
println("Entferntes Element: ", entferntes_element)

# ╔═╡ 408b0492-2c71-4fdc-bbb1-8e167a4482bf
println("Nach pop!(): ", meine_liste)

# ╔═╡ d3d00edf-1405-486b-bd8e-b0d438df02d2
# Anderes Array anhängen
weitere_zahlen = [60, 70]

# ╔═╡ 61a86cf3-c5ee-4710-a959-384bdbfe22ca
append!(meine_liste, weitere_zahlen)

# ╔═╡ dec68ec4-fb33-4f9f-8d9c-00ff76881532
println("Nach append!(..., [60, 70]): ", meine_liste)

# ╔═╡ a9569c07-846a-44b7-86a7-5468157c41b0
# Sortieren (nicht-mutierend)
sortierte_liste_neu = sort(meine_liste)

# ╔═╡ 6be6cff6-a3b3-40c8-b273-7cc17acf3989
println("Neue sortierte Liste: ", sortierte_liste_neu)

# ╔═╡ b1999ba6-eeeb-4c66-acef-b822ef177073
println("Originalliste (unverändert): ", meine_liste)

# ╔═╡ 2961912a-762a-43f0-875a-06444ba0cb42
# Sortieren (mutierend)
sort!(meine_liste)

# ╔═╡ dd8bc096-799d-496d-9a45-c057b4b7f662
println("Nach sort!(): ", meine_liste)

# ╔═╡ 6ae0b555-9ce6-423d-81b4-cd547e3b1dc7
md"""
### Mit `for`-Schleifen über Arrays iterieren

`for`-Schleifen eignen sich hervorragend, um jedes Element eines Arrays nacheinander zu bearbeiten.
"""


# ╔═╡ e7a8983e-7def-4c70-b10f-fe7ad9afa51a
begin
		
		# Beispiel: Quadriere jede Zahl in einem Array und speichere sie in einem neuen Array
		original_zahlen = [1, 2, 3, 4, 5]
		quadrierte_zahlen = Int[] # Leeres Array für die Ergebnisse
		
		for zahl in original_zahlen
		  quadrat = zahl^2
		  push!(quadrierte_zahlen, quadrat)
		end
		
end

# ╔═╡ 23ae7b56-51ab-47a1-ac06-db986ffc3691
begin
	fruechte = ["Apfel", "Banane", "Kirsche", "Dattel"]
	
	println("Meine Lieblingsfrüchte:")
	for frucht in fruechte
	  println("- ", frucht)
	end

	println("Originalzahlen: ", original_zahlen)
	println("Quadrierte Zahlen: ", quadrierte_zahlen)

	
end

# ╔═╡ 38da68df-25e1-481a-ac17-fa466b921d00
begin
		# Es gibt auch elegantere Wege für solche Operationen (z.B. "comprehensions"),
		# aber die Schleife ist gut zum Verständnis:
		quadrierte_zahlen_comprehension = [zahl^2 for zahl in original_zahlen]
		println("Quadrierte Zahlen (Comprehension): ", quadrierte_zahlen_comprehension)
end

# ╔═╡ af15ffd5-9a80-42ec-80d4-91ce59778a91


# ╔═╡ dccde060-4267-48c7-a189-cadc824ca674


# ╔═╡ bd800753-dfc6-41b9-b3cc-a11fb1a43ce4
md"""
# Übungsaufgaben 🏋️‍♀️

Jetzt bist du dran! Versuche, die folgenden Aufgaben zu lösen.

## Aufgabe 1: Rechteck-Berechnungen

**Aufgabe:**
Definiere zwei Variablen, `laenge` und `breite`, für ein Rechteck.
Berechne dann den **Flächeninhalt** und den **Umfang** des Rechtecks und gib beides mit einer beschreibenden Nachricht aus.

**Beispielwerte:** `laenge = 10`, `breite = 5`
**Erwartete Ausgabe (ungefähr):**
"""

# ╔═╡ 482ab407-0191-45ea-be6a-ce10327f678f
# Dein Code für Aufgabe 1 hier:
laenge = 0 # Setze hier deine Werte ein

# ╔═╡ 1dd06781-2071-4b2d-b8c6-4a0caa275d6e
breite = 0 # Setze hier deine Werte ein

# ╔═╡ e57633a5-1ea9-4995-90bd-6dad3e4b3472
# Berechne Flächeninhalt
# Berechne Umfang

# Gib die Ergebnisse aus



# ╔═╡ 8bf92d2d-c153-470c-bd4b-6a3b60269858


# ╔═╡ cff1595f-80c1-4239-8d34-05e7116e4c65


# ╔═╡ 6b061aab-690a-4085-a939-c16e9732c365
md"""
## Aufgabe 2: Gerade oder Ungerade?

**Aufgabe:**
Schreibe ein kurzes Skript, das überprüft, ob eine gegebene Zahl `meine_zahl` gerade oder ungerade ist.
Gib eine entsprechende Nachricht aus.

**Hinweis:** Der Modulo-Operator `%` gibt den Rest einer Division zurück. (z.B. `5 % 2` ist `1`, `4 % 2` ist `0`).

**Beispielwerte:** `meine_zahl = 7` oder `meine_zahl = 12`
**Erwartete Ausgabe (Beispiel):**
"""

# ╔═╡ 910eeb7f-8d1b-4f8d-9153-614042c74764
# Dein Code für Aufgabe 2 hier:
meine_zahl = 0 # Setze hier deine Zahl ein

# Überprüfe, ob die Zahl gerade oder ungerade ist und gib das Ergebnis aus


# ╔═╡ a265d00f-1d35-45dd-817b-8360a9e6775f


# ╔═╡ 6ef2dc36-3d6c-4e2c-b58e-9b77d473decb


# ╔═╡ 33e02e68-3c26-43a2-a490-978a01c97f96
md"""
## Aufgabe 3: Temperaturumrechner (Funktion)

**Aufgabe:**
Schreibe eine Funktion namens `celsius_zu_fahrenheit`, die eine Temperatur in Grad Celsius als Argument nimmt und die entsprechende Temperatur in Grad Fahrenheit zurückgibt.

**Formel:** Fahrenheit = (Celsius * 9/5) + 32

Teste deine Funktion mit ein paar Werten, z.B. 0°C, 25°C und 100°C.

**Erwartete Ergebnisse:**
*   `celsius_zu_fahrenheit(0)` sollte `32.0` zurückgeben.
*   `celsius_zu_fahrenheit(25)` sollte `77.0` zurückgeben.
*   `celsius_zu_fahrenheit(100)` sollte `212.0` zurückgeben.
"""

# ╔═╡ 6bd4c44a-94a7-4d0f-abc2-0f43415545fd
# Dein Code für Aufgabe 3 hier:

# Definiere die Funktion celsius_zu_fahrenheit

# Teste die Funktion:
# temp_c1 = 0
# temp_f1 = celsius_zu_fahrenheit(temp_c1)
# println(temp_c1, "°C sind ", temp_f1, "°F")

# temp_c2 = 25
# temp_f2 = celsius_zu_fahrenheit(temp_c2)
# println(temp_c2, "°C sind ", temp_f2, "°F")

# temp_c3 = 100
# temp_f3 = celsius_zu_fahrenheit(temp_c3)
# println(temp_c3, "°C sind ", temp_f3, "°F")


# ╔═╡ 7255754e-b55f-440b-b007-b13caf1bff1d


# ╔═╡ e3c36291-8ad5-45c6-a57d-11c915724efc


# ╔═╡ 7e5586a4-6852-4d1a-9115-59741cef0d01


# ╔═╡ fe452138-9526-4f5a-b8f2-b1da927b79e9
md"""
## Aufgabe 4: FizzBuzz (Schleife und Bedingungen)

**Aufgabe:**
Schreibe ein Programm, das die Zahlen von 1 bis 30 (einschließlich) durchläuft.
Für jede Zahl gilt:
*   Wenn die Zahl durch 3 teilbar ist, gib "Fizz" aus.
*   Wenn die Zahl durch 5 teilbar ist, gib "Buzz" aus.
*   Wenn die Zahl sowohl durch 3 als auch durch 5 teilbar ist, gib "FizzBuzz" aus.
*   Andernfalls gib die Zahl selbst aus.

**Hinweis:** Denke an die Reihenfolge deiner `if/elseif/else` Bedingungen!


"""

# ╔═╡ 4b39c1c1-b0bb-4e81-b42d-c63537351fc2


# ╔═╡ e06fe40b-7a98-4233-9ae8-eb0d84cf47c6


# ╔═╡ a32feb03-a716-4a45-ad67-30f68f7dfbb7
md"""
## Aufgabe 5: Summe mit `while`-Schleife

**Aufgabe:**
Schreibe eine `while`-Schleife, die so lange Zahlen zu einer `gesamtsumme` addiert (beginnend mit `zahl = 1`, dann `zahl = 2`, usw.), bis die `gesamtsumme` einen Wert von mindestens K erreicht hat.
Gib am Ende die `gesamtsumme` und die letzte `zahl` aus, die addiert wurde, um die Bedingung zu erfüllen.

**Erwartete Ausgabe (ungefähr) für K=55:**
(Die genauen Werte können leicht variieren, je nachdem, wie du die Schleife und die Addition implementierst.)

*Die Gesamtsumme ist 55, erreicht mit der Zahl 10.*
"""

# ╔═╡ bf069137-33b1-4bd6-b914-b38673b05c4e
begin
	# Dein Code für Aufgabe 5 hier:
	gesamtsumme = 0
	zahl3 = 0
	K = 100
	
	# Schreibe hier deine while-Schleife

end

# ╔═╡ Cell order:
# ╠═58efddbe-caf1-499f-ad0b-524ba078d180
# ╠═f0e20c4b-3f9d-46c6-b0e8-a2facebd795a
# ╠═561a09dd-667c-44e1-a8f8-08c9ac877e6b
# ╠═032fa5b6-f32f-4be6-a237-947363acf28e
# ╠═4d90a5e2-8a74-403d-bd90-9bc5bcd8201b
# ╠═56329202-c5bb-49fb-a82b-abf261f35f27
# ╟─042f8796-4ea0-11f0-0b91-4d6bdcdda00a
# ╠═84655e4c-d98d-46ed-bf81-3a23aa55bc5d
# ╟─1df138b8-6779-4f32-a09c-12e0a692d49c
# ╠═66e54d39-29e3-498b-8f7c-7767869b1d31
# ╠═d0bcd705-f46f-46d3-bc27-34b3e23b12f4
# ╠═e6529119-a064-42d9-beea-c88f6318012d
# ╠═29434f4b-3738-4cdf-98cd-e663a1daeef5
# ╠═f1fee53a-17c9-4027-b961-b8365fece30e
# ╠═4bedef1b-fdcc-4e92-b8e5-1c50bfbff3bf
# ╠═f895a451-848e-4afb-a8e2-67b99524e41b
# ╠═f810e1d4-81dc-4f4f-82d2-40aa463ab675
# ╟─d722f9e7-a786-4b3a-8d50-ff4e3e3b79b6
# ╠═b5e0569b-19cf-4cae-a37a-b2a4d37f3cbd
# ╠═a8843a3e-2bd1-4f5d-a567-20b4f0a48159
# ╠═257b4aa6-0140-4680-a519-d35fedfcdedb
# ╠═fb255854-0c7f-4a81-adb9-e90fc122e605
# ╠═c7257df1-e6bb-4749-8a4f-b576a6e49a91
# ╠═e3f8a862-e3c0-48b4-b214-363676cbc8ad
# ╠═b9ac1496-cb15-4eb0-90d9-9da02be99e88
# ╠═d00e3325-9fa9-4d65-9578-6f7b8e698fae
# ╠═2d9019c9-bf04-4205-a34e-a587cac1c89d
# ╠═76bc594c-aa7f-4c3c-9162-150c1205b4d0
# ╠═f1f0059f-16ad-4832-98d8-6ac733613f0d
# ╠═5f8b0933-89e6-43e9-a5da-cd6020819670
# ╠═40e8edc4-2a27-4826-9893-b395421446e0
# ╠═25f71e0c-2bda-4558-80c6-109f6ce59ced
# ╟─129b280e-d9d7-4fce-8604-ac42a108dc8c
# ╠═9c9ec8e2-9e7d-4132-bfbe-d9009246c83e
# ╠═f9ad063e-423c-46e7-b4de-286e0c819527
# ╠═d0fda889-73cd-4131-b851-0ffbdeeee788
# ╠═ffa75020-cc69-45b7-9af0-8614236587dd
# ╠═5407d25b-bec5-46e2-9882-83cd321fa2b9
# ╠═d631c915-e7b5-4268-944d-33886e840d57
# ╠═31a76063-6716-46a8-ac2f-0ddd18b51f88
# ╠═ef9a2c39-adb6-4685-9dc6-41cedf0fdec2
# ╟─62208b95-b8b3-43e3-ba83-bc99d1ada609
# ╠═d153dd69-dc16-41a7-a741-a1ac1432230e
# ╠═bb0c744c-698d-44a2-a47a-d65cdad47f63
# ╠═e9aa91bb-d116-42b7-86b6-2e2033936068
# ╠═d43313ce-9737-4d79-81d0-62cc13867f0e
# ╠═4fccf02c-a3fb-435e-b53e-c3a3257a41a7
# ╠═784345f7-b2fb-4cb3-845f-d0848657b6aa
# ╠═ba26fa5c-5b8f-4512-9d48-250ba3716346
# ╟─2a645d56-54cc-4460-aec8-8bc61dad2717
# ╠═7553667e-1bc5-4d58-b3ea-f9ea2b4b708c
# ╠═df4b855e-4c57-4338-ac6e-20723f5cdc29
# ╠═6457c9d9-98cf-4e3f-bbbc-dba946a15020
# ╠═7c979ddd-aac9-4a6e-88de-6a3f4565bb63
# ╠═95c4412b-73b1-4f0b-b2d5-a3647a6d48f1
# ╠═b4ecd75c-87b0-4837-b7ea-21169b991f66
# ╠═a29f31b9-615e-43e7-950c-75dec7776c34
# ╠═1d12959e-d7e5-47ec-8c84-68e47fe0395d
# ╠═fd536b7b-73ea-4a79-95df-19add3b164e5
# ╟─aa2feec1-1adb-4e0f-b766-859f95bf4793
# ╠═bd8dcb2b-7640-4f97-8389-ec619e2e006d
# ╠═750888cb-4f04-480c-b4fd-bdb0d445c687
# ╠═4c5c99f2-c279-46f0-9eb3-7c58df28dd6f
# ╠═f5e38db1-649e-438a-ac96-bf31995b4377
# ╠═a8b14ccc-e2ce-4055-8b8a-d53dd003574b
# ╠═f376df2d-2bf8-4c68-bb13-8369593476b9
# ╠═ef578903-f118-43bf-b473-e116774d46bb
# ╠═6fc3a967-ac08-4f9a-9768-b761cc7b103e
# ╠═599990f2-685c-4897-88ec-8c84673a0fbc
# ╠═676dacca-6030-474b-a271-144d1ac4549b
# ╠═02cf8f58-48e9-421d-9c9e-efea9f43b218
# ╠═39ddce72-811f-4f7e-9be0-cf7373d031a2
# ╠═b7d75a50-f705-4242-b7b7-43e0e1d34c78
# ╠═c6881807-7c12-4784-9e75-a0ed2d21acfb
# ╠═4c36ab27-0bb3-4360-984c-5bb1f0ff7c79
# ╠═f8ac6e92-987e-439b-b5c0-52710eb3e0b2
# ╠═fa1d4666-52dd-4127-a6f7-73b1daeb9b54
# ╠═8dcf10c7-2c5a-47ad-b46f-991f6791064b
# ╠═50b10442-9e93-481d-8ef2-ca5498516a63
# ╠═f5685218-0892-4a6b-abd2-c46b5c8d1932
# ╠═9f056721-27da-47d5-9a5e-5563b28e6e62
# ╠═004c9ae0-138f-4076-816e-1eafa5e1bc3b
# ╠═6196c98a-4feb-4a2f-821f-4d261bfd9dd2
# ╠═82577b69-837a-43ee-bb91-e64b2042df71
# ╟─4ce39d71-fab9-4825-819e-a44c9ce35def
# ╠═271684b8-0ed5-42c3-b150-61ab99aab73d
# ╠═20db471d-6a46-43a0-890b-a45d9619b149
# ╠═22f063d8-78c2-450f-af7c-bf1624126246
# ╠═7601a9a6-b2f6-40b5-a1a6-4285e84759a1
# ╠═341282c7-c084-4404-900c-d5d4243efed2
# ╠═7f166c90-982e-4731-b2b4-226a499e0fa4
# ╠═b28ebb04-c541-4fa6-8d08-f5fb763fd834
# ╠═408b0492-2c71-4fdc-bbb1-8e167a4482bf
# ╠═d3d00edf-1405-486b-bd8e-b0d438df02d2
# ╠═61a86cf3-c5ee-4710-a959-384bdbfe22ca
# ╠═dec68ec4-fb33-4f9f-8d9c-00ff76881532
# ╠═a9569c07-846a-44b7-86a7-5468157c41b0
# ╠═6be6cff6-a3b3-40c8-b273-7cc17acf3989
# ╠═b1999ba6-eeeb-4c66-acef-b822ef177073
# ╠═2961912a-762a-43f0-875a-06444ba0cb42
# ╠═dd8bc096-799d-496d-9a45-c057b4b7f662
# ╟─6ae0b555-9ce6-423d-81b4-cd547e3b1dc7
# ╠═23ae7b56-51ab-47a1-ac06-db986ffc3691
# ╠═e7a8983e-7def-4c70-b10f-fe7ad9afa51a
# ╠═38da68df-25e1-481a-ac17-fa466b921d00
# ╠═af15ffd5-9a80-42ec-80d4-91ce59778a91
# ╠═dccde060-4267-48c7-a189-cadc824ca674
# ╟─bd800753-dfc6-41b9-b3cc-a11fb1a43ce4
# ╠═482ab407-0191-45ea-be6a-ce10327f678f
# ╠═1dd06781-2071-4b2d-b8c6-4a0caa275d6e
# ╠═e57633a5-1ea9-4995-90bd-6dad3e4b3472
# ╟─8bf92d2d-c153-470c-bd4b-6a3b60269858
# ╟─cff1595f-80c1-4239-8d34-05e7116e4c65
# ╟─6b061aab-690a-4085-a939-c16e9732c365
# ╠═910eeb7f-8d1b-4f8d-9153-614042c74764
# ╠═a265d00f-1d35-45dd-817b-8360a9e6775f
# ╠═6ef2dc36-3d6c-4e2c-b58e-9b77d473decb
# ╟─33e02e68-3c26-43a2-a490-978a01c97f96
# ╠═6bd4c44a-94a7-4d0f-abc2-0f43415545fd
# ╠═7255754e-b55f-440b-b007-b13caf1bff1d
# ╠═e3c36291-8ad5-45c6-a57d-11c915724efc
# ╠═7e5586a4-6852-4d1a-9115-59741cef0d01
# ╟─fe452138-9526-4f5a-b8f2-b1da927b79e9
# ╠═4b39c1c1-b0bb-4e81-b42d-c63537351fc2
# ╠═e06fe40b-7a98-4233-9ae8-eb0d84cf47c6
# ╟─a32feb03-a716-4a45-ad67-30f68f7dfbb7
# ╠═bf069137-33b1-4bd6-b914-b38673b05c4e
