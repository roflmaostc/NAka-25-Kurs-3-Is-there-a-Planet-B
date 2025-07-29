# Installation von Julia 1.11
Besuche folgende Website: https://julialang.org/install/

Installiere dann `juliaup`, welches dann `julia` für dich installiert.


## Speichern der Dateien
Erstelle nun einen *NAka_25* Ordner auf deinem Computer.
Lade nun die Datei `julia_basics.jl` herunter (Rechtsklick -> Speichern als...) und speichere die Datei in diesem Folder.
Das gleiche machst du mit den `Project.toml` und `Manifest.toml` Dateien.


## Starten von Julia
Suche nun über deinen program launcher `julia`

Ein kleines schwarzes Fenster sollte erscheinen

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

julia> using Pkg; Pkg.activate("."); Pkg.instantiate(); using Pluto; Pluto.run()
```


## Starten von Pluto
Danach sollte eine Webbrowser mit Pluto sich öffnen. Versuche nun die Datei `julia_basics.jl` über den Filebrowser innerhalb Plutos zu öffnen.
