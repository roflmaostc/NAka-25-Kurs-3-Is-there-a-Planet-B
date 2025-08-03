# Installation von Julia 1.11
Hier ein kleines Video zur Installation:

https://github.com/roflmaostc/NAka-25-Kurs-3-Is-there-a-Planet-B/blob/main/installation.mp4



# Installation von Julia 1.11 - voller Guide


Besuche folgende Website: https://julialang.org/install/

Installiere dann `juliaup`, welches dann `julia` für dich installiert. Wir benutzen Julia 1.11.6


## Speichern der Dateien
Erstelle nun einen *NAka_25* Ordner auf deinem Computer.
Lade nun die Datei `julia_basics.jl` herunter (Rechtsklick -> Speichern als...) und speichere die Datei in diesem Folder.
Das gleiche machst du mit den `Project.toml` und `Manifest.toml` Dateien.


## Starten von Julia
Suche nun über deinen program launcher `julia`



https://github.com/user-attachments/assets/a37ba044-b114-4d9e-bce7-d88625ad6a44


Ein kleines schwarzes Fenster sollte erscheinen. Navigiere mit `cd` (das ist im Prinzip ein file browser der den Ort ändert) dann zu deinem `NAka_25` Ordner.

```julia-repl
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.11.6 (2025-07-09)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |


julia> cd("/tmp/NAka_25/")

julia> readdir()
3-element Vector{String}:
 "Manifest.toml"
 "Project.toml"
 "julia_basics.jl"

# nur wenn die files erfolgreich angezeigt werden, führst du die nächste Zeile aus
julia> using Pkg; Pkg.activate("."); Pkg.instantiate(); using Pluto; Pluto.run()
```


## Starten von Pluto
Danach sollte eine Webbrowser mit Pluto sich öffnen. Versuche nun die Datei `julia_basics.jl` über den Filebrowser innerhalb Plutos zu öffnen.
