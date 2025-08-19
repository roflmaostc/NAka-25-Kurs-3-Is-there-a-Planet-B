### A Pluto.jl notebook ###
# v0.20.13

using Markdown
using InteractiveUtils

# ╔═╡ f313042a-0adc-4177-ab3b-5c3b46a7415d
begin
    using Pkg
    Pkg.activate(".")
end

# ╔═╡ fd488799-e6ca-47cd-b347-78ae608e5d63
using PlutoUI

# ╔═╡ 94becb44-f9fd-4b57-882e-3cec34f8a557
using Plots

# ╔═╡ 47d3c50b-535d-4d6f-8f86-fb0618f8f4e4
TableOfContents()

# ╔═╡ 983b711c-6627-4c24-b592-ac5295b1603a
md"""
# Übungsblatt 2: Arrays, Broadcasting und Plotting 📈

Willkommen zum zweiten Teil unserer Julia-Einführung! Aufbauend auf den Grundlagen werden wir uns heute zwei mächtige Konzepte ansehen: eine kurze Wiederholung zu **Arrays** und die Einführung von **Broadcasting**.

Danach warten viele Übungsaufgaben auf dich, um deine Fähigkeiten zu festigen und auszubauen.

## 1. Kurze Wiederholung: Arrays (Vektoren)

Wie du bereits weißt, sind Arrays geordnete Listen von Elementen. Sie sind das A und O für fast alles im wissenschaftlichen Rechnen.

- **Erstellen:** `mein_array = [10, 20, 30]`
- **Zugreifen:** `mein_array[1]` (liefert `10`, da Julia bei 1 zu zählen beginnt!)
- **Länge:** `length(mein_array)` (liefert `3`)
- **Hinzufügen:** `push!(mein_array, 40)` (verändert das Array!)

"""

# ╔═╡ 5e107e31-eb29-47a0-9aea-8ffc03e48270
md"""
## 2. Die Superkraft: Broadcasting (der Punkt-Operator `.`)

Stell dir vor, du hast ein Array von Zahlen und möchtest jede einzelne Zahl verdoppeln.

Der "langsame" Weg wäre eine `for`-Schleife:
"""

# ╔═╡ ca7315ae-b5e6-46b7-a882-ab11b75eee4e
begin
    zahlen = [1, 2, 3, 4, 5]
    verdoppelte_zahlen = Int[] # Leeres Array für die Ergebnisse

    for z in zahlen
        push!(verdoppelte_zahlen, z * 2)
    end
    verdoppelte_zahlen
end

# ╔═╡ 259164dc-1fca-4076-ab37-4353fa5146bf
md"""
Das funktioniert, ist aber umständlich. Julia bietet hierfür eine viel elegantere und schnellere Lösung: **Broadcasting**.

Mit einem Punkt (`.`) direkt nach einem Funktionsnamen oder vor einem Operator sagst du Julia: "Wende diese Operation auf **jedes einzelne Element** des Arrays an!"

Schau dir das an:
"""

# ╔═╡ c2c107de-121c-4529-9f7a-f4dc5feaf8f6
# Eine Operation auf jedes Element anwenden:
zahlen .+ 10  # Addiere 10 zu jedem Element

# ╔═╡ db6f495d-278b-4684-8fea-565ed4e4fbdd
# Unser Verdopplungs-Beispiel mit Broadcasting:
zahlen .* 2

# ╔═╡ 080f5bb2-47d8-4c2a-8351-c0d448282bf0
md"""
Das funktioniert auch mit jeder Funktion! Das ist extrem nützlich, zum Beispiel beim Plotten von mathematischen Funktionen:
"""

# ╔═╡ 13a82287-4da2-41c6-afe5-447e6b99c661
# Wir erstellen einen Bereich von Zahlen von 0 bis π
x_werte = [0, π/2, π, 3π/2, 2π]

# ╔═╡ df40b825-7594-4c36-92f9-28f788447760
# Wende die sin()-Funktion auf JEDEN Wert im Array an:
y_werte = sin.(x_werte)

# ╔═╡ b460c6ad-32c9-4ad9-9a92-1e88a1218683
md"""
Man kann auch zwei Arrays gleicher Länge elementweise miteinander verrechnen:
"""

# ╔═╡ d3de4b4b-44b3-4383-aae4-ef6ab8dcb215
begin
	a = [1, 2, 3]
	b = [10, 20, 30]
	a .* b # Multipliziert das 1. mit dem 1., das 2. mit dem 2., usw.
end

# ╔═╡ 7357455b-b61c-4d09-a05d-45bc409aa746
md"""
**Merke:** Immer wenn du eine Operation auf alle Elemente eines Arrays anwenden willst, denke an den Punkt `.`!

---

# Übungsaufgaben 🏋️‍♀️

Jetzt bist du an der Reihe! Löse die folgenden Aufgaben.
"""

# ╔═╡ 199ce991-adfa-4637-9fcb-6eabb7b3855b
md"""
### Aufgabe 1: Finde den Größten und Kleinsten

**Aufgabe:** Gegeben ist ein Array von Zahlen. Finde den kleinsten und den größten Wert im Array und gib beide aus.

**Tipp:** Julia hat eingebaute Funktionen `minimum()` und `maximum()`, die dir die Arbeit abnehmen!
"""

# ╔═╡ 0639ff02-dc5d-4c08-b8d9-02dab0397623
begin
    # Dein Code für Aufgabe 1 hier:
    messwerte = [12.5, 14.1, 11.9, 15.2, 13.8, 10.4, 14.5]

    # Finde den kleinsten Wert
    min_wert = 0 # Ersetze die 0

    # Finde den größten Wert
    max_wert = 0 # Ersetze die 0

    println("Der kleinste Messwert ist: ", min_wert)
    println("Der größte Messwert ist: ", max_wert)
end

# ╔═╡ 2e68aa55-396c-48fe-8681-620ada4492f2
md"""
### Aufgabe 2: Filter die geraden Zahlen

**Aufgabe:** Gegeben ist ein Array von Zahlen. Erstelle ein **neues** Array, das nur die geraden Zahlen aus dem ursprünglichen Array enthält.

**Tipp:**
1. Erstelle ein leeres Array für die Ergebnisse (`ergebnis = Int[]`).
2. Gehe mit einer `for`-Schleife durch das `zahlen_mix` Array.
3. Prüfe für jede Zahl mit einer `if`-Bedingung und dem Modulo-Operator (`%`), ob sie gerade ist (`zahl % 2 == 0`).
4. Wenn ja, füge sie mit `push!` zum `ergebnis`-Array hinzu.
"""

# ╔═╡ 58020493-8949-4864-9bb4-b722b9f1ad7c
begin
    # Dein Code für Aufgabe 2 hier:
    zahlen_mix = [1, 4, 7, 8, 10, 13, 18, 21, 22]
    gerade_zahlen = Int[] # Hier kommen die Ergebnisse rein

    # Deine for-Schleife hier:


    println("Ursprüngliches Array: ", zahlen_mix)
    println("Nur die geraden Zahlen: ", gerade_zahlen)
end

# ╔═╡ 4c12ffdd-cd1e-4652-ba6d-dce088d3df60
md"""
### Aufgabe 3: Geschwindigkeitsumrechnung mit Broadcasting

**Aufgabe:** Du hast ein Array mit Geschwindigkeiten in km/h. Rechne alle Geschwindigkeiten in m/s um, indem du jeden Wert durch 3.6 teilst. Benutze **Broadcasting**!
"""

# ╔═╡ 4ca0c113-32b5-433b-bf24-6701b1030955
begin
    # Dein Code für Aufgabe 3 hier:
    geschwindigkeiten_kmh = [30, 50, 80, 100, 120]

    # Rechne mit Broadcasting um
    geschwindigkeiten_ms = 0 # Ersetze die 0 durch deine Berechnung

    println("Geschwindigkeiten in km/h: ", geschwindigkeiten_kmh)
    println("Geschwindigkeiten in m/s:  ", geschwindigkeiten_ms)
end

# ╔═╡ ef4cb646-b580-4603-bc69-8077a194d3af
md"""
### Aufgabe 4: Zeichne eine Sinus-Funktion

**Aufgabe:** Erstelle einen einfachen Plot einer Sinus-Funktion von 0 bis 4π.

**Schritte:**
1. Erstelle ein Array `x` mit Werten von 0 bis 4π. Ein guter Weg dafür ist `0:0.1:4*π`. Das erzeugt eine Sequenz von 0 bis 4π in 0.1er-Schritten.
2. Erstelle ein Array `y`, indem du die `sin`-Funktion per **Broadcasting** auf `x` anwendest.
3. Benutze `plot(x, y)` um den Graphen zu zeichnen.
4. **Bonus:** Gib dem Plot mit `title!`, `xlabel!` und `ylabel!` Beschriftungen.
"""

# ╔═╡ 1cb9b3e8-c515-41c1-b6ba-314d7d29a0d4
begin
	# Dein Code für Aufgabe 4 hier:
	# Schritt 1: x-Werte erstellen
	x = 0
	
	# Schritt 2: y-Werte mit Broadcasting berechnen
	y = 0
	
	# Schritt 3 & 4: Plotten und beschriften
	# plot(...)
end

# ╔═╡ e8cb2bfb-52ca-4b4d-9126-72216a5c22c8
md"""
### Aufgabe 5: Sinus und Cosinus in einem Plot

**Aufgabe:** Erweitere den Plot aus Aufgabe 4. Zeichne zusätzlich die Cosinus-Funktion in denselben Graphen.

**Tipp:**
1. Nachdem du `plot(x, y_sin)` aufgerufen hast, kannst du mit `plot!(x, y_cos)` eine weitere Kurve hinzufügen. Das `!` bedeutet, dass der bestehende Plot modifiziert wird.
2. Füge mit dem `label`-Argument eine Legende hinzu: `plot(x, y_sin, label="Sinus")` und `plot!(x, y_cos, label="Cosinus")`.
"""

# ╔═╡ 9c9dc0e1-5192-452b-9e9e-7a65397c54cb
begin
	# Dein Code für Aufgabe 5 hier:
	x_sin_cos = 0:0.1:4*π
	
	y_sin = sin.(x_sin_cos)
	y_cos = cos.(x_sin_cos)
	
	# Plotten mit Legende
	# plot(...)
	# plot!(...)
end

# ╔═╡ 8afc4353-aeb0-4c77-a2b3-f6756bebbe0e
md"""
### Aufgabe 6: Funktion zum Umkehren eines Arrays

**Aufgabe:** Schreibe eine Funktion `kehre_um(arr)`, die ein Array als Eingabe nimmt und ein **neues** Array mit den Elementen in umgekehrter Reihenfolge zurückgibt. Du darfst die eingebaute Funktion `reverse()` **nicht** verwenden!

**Tipp:**
1. Erstelle in deiner Funktion ein leeres Ergebnis-Array.
2. Gehe mit einer `for`-Schleife rückwärts durch das Eingabe-Array. Ein Rückwärts-Bereich geht so: `length(arr):-1:1`.
3. Füge jedes Element zum Ergebnis-Array hinzu.
"""

# ╔═╡ 318c0478-e259-421a-b208-1fce6f6b79e3
begin
	# Dein Code für Aufgabe 6 hier:
	function kehre_um(eingabe_arr)
	    # Dein Code hier
	    return [] # Gib das neue, umgekehrte Array zurück
	end
	
	# Teste deine Funktion
	test_array = ["A", "B", "C", "D", "E"]
	umgekehrtes_array = kehre_um(test_array)
	println("Original: ", test_array)
	println("Umgekehrt: ", umgekehrtes_array) # Sollte ["E", "D", "C", "B", "A"] sein
end

# ╔═╡ 732bed8a-daa6-4406-b8c1-3da450f04d8a
md"""
### Aufgabe 7: Überlagerung von Wellen (Interferenz)

**Aufgabe:** In der Physik überlagern sich Wellen. Simuliere und plotte dieses Phänomen!

**Schritte:**
1. Erstelle wie zuvor ein `x`-Array (z.B. von 0 bis 4π).
2. Erstelle eine Welle `y1` (z.B. `sin.(x)`).
3. Erstelle eine zweite Welle `y2` mit anderer Frequenz und Amplitude (z.B. `0.7 * sin.(2 .* x)`).
4. Erstelle die überlagerte Welle `y_superposition`, indem du `y1` und `y2` elementweise addierst (perfekt für **Broadcasting**!).
5. Plotte alle drei Wellen (`y1`, `y2` und `y_superposition`) in einem Graphen, um den Effekt zu sehen. Gib ihnen unterschiedliche Labels.
"""

# ╔═╡ 53f57db1-33b3-4d69-80cc-837fb5285de5
begin
	# Dein Code für Aufgabe 7 hier:
	x_wellen = 0:0.1:4*π
	
	# Wellen erstellen
	y1 = 0
	y2 = 0
	y_superposition = 0
	
	# Plotten
	# plot(...)
	# plot!(...)
	# plot!(...)
end

# ╔═╡ fb01cc41-3ee9-4615-81e0-91c92bbfd6c2
md"""
### Aufgabe 8 (Herausforderung): Finde die Primzahlen

**Aufgabe:** Schreibe ein Programm, das alle Primzahlen bis zu einer Obergrenze `N` findet und in einem Array sammelt.

**Tipp:** Dies ist eine schwierigere Aufgabe, die Logik kombiniert.
1. Schreibe zuerst eine Hilfsfunktion `ist_prim(zahl)`. Diese Funktion soll `true` zurückgeben, wenn `zahl` eine Primzahl ist, und sonst `false`.
    - Eine Zahl ist prim, wenn sie größer als 1 ist und nur durch 1 und sich selbst teilbar ist.
    - Du kannst das prüfen, indem du in einer Schleife von 2 bis `zahl - 1` testest, ob `zahl` durch einen dieser Teiler teilbar ist (`zahl % teiler == 0`). Wenn ja, ist sie keine Primzahl.
2. Erstelle dann eine `for`-Schleife, die von 2 bis `N` läuft.
3. Rufe in der Schleife deine `ist_prim`-Funktion für jede Zahl auf.
4. Wenn die Funktion `true` zurückgibt, füge die Zahl zu deinem Ergebnis-Array hinzu.
"""

# ╔═╡ b74a20ed-3c79-4c5b-aecf-9b46bd6a635c
begin
    # Dein Code für Aufgabe 8 hier:

    # Hilfsfunktion, um zu prüfen, ob eine Zahl prim ist
    function ist_prim(n)
        if n <= 1
            return false
        end
        # Gehe von 2 bis zur Wurzel von n (Optimierung)
        for i in 2:floor(Int, sqrt(n))
            if n % i == 0
                return false # Gefunden, kein Primzahl
            end
        end
        return true # Kein Teiler gefunden, ist eine Primzahl
    end

    # Hauptteil
    N = 100
    primzahlen = Int[]

    # Deine for-Schleife, die ist_prim() aufruft
    for zahl in 2:N
        # ...
    end

    println("Primzahlen bis ", N, ":")
    println(primzahlen)
end

# ╔═╡ Cell order:
# ╠═f313042a-0adc-4177-ab3b-5c3b46a7415d
# ╠═fd488799-e6ca-47cd-b347-78ae608e5d63
# ╠═94becb44-f9fd-4b57-882e-3cec34f8a557
# ╠═47d3c50b-535d-4d6f-8f86-fb0618f8f4e4
# ╟─983b711c-6627-4c24-b592-ac5295b1603a
# ╟─5e107e31-eb29-47a0-9aea-8ffc03e48270
# ╟─ca7315ae-b5e6-46b7-a882-ab11b75eee4e
# ╟─259164dc-1fca-4076-ab37-4353fa5146bf
# ╠═c2c107de-121c-4529-9f7a-f4dc5feaf8f6
# ╠═db6f495d-278b-4684-8fea-565ed4e4fbdd
# ╟─080f5bb2-47d8-4c2a-8351-c0d448282bf0
# ╠═13a82287-4da2-41c6-afe5-447e6b99c661
# ╠═df40b825-7594-4c36-92f9-28f788447760
# ╟─b460c6ad-32c9-4ad9-9a92-1e88a1218683
# ╠═d3de4b4b-44b3-4383-aae4-ef6ab8dcb215
# ╟─7357455b-b61c-4d09-a05d-45bc409aa746
# ╟─199ce991-adfa-4637-9fcb-6eabb7b3855b
# ╠═0639ff02-dc5d-4c08-b8d9-02dab0397623
# ╟─2e68aa55-396c-48fe-8681-620ada4492f2
# ╠═58020493-8949-4864-9bb4-b722b9f1ad7c
# ╟─4c12ffdd-cd1e-4652-ba6d-dce088d3df60
# ╠═4ca0c113-32b5-433b-bf24-6701b1030955
# ╟─ef4cb646-b580-4603-bc69-8077a194d3af
# ╠═1cb9b3e8-c515-41c1-b6ba-314d7d29a0d4
# ╟─e8cb2bfb-52ca-4b4d-9126-72216a5c22c8
# ╠═9c9dc0e1-5192-452b-9e9e-7a65397c54cb
# ╟─8afc4353-aeb0-4c77-a2b3-f6756bebbe0e
# ╠═318c0478-e259-421a-b208-1fce6f6b79e3
# ╟─732bed8a-daa6-4406-b8c1-3da450f04d8a
# ╠═53f57db1-33b3-4d69-80cc-837fb5285de5
# ╠═fb01cc41-3ee9-4615-81e0-91c92bbfd6c2
# ╟─b74a20ed-3c79-4c5b-aecf-9b46bd6a635c
