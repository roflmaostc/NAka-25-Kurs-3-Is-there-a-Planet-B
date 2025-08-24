### A Pluto.jl notebook ###
# v0.20.13

using Markdown
using InteractiveUtils

# ╔═╡ 711dee08-13ec-4b32-868f-60bb153c086a
begin
	using Pkg
	Pkg.activate(".")
end

# ╔═╡ f10708f2-28e2-11f0-2124-e3da457bc7f0
using Plots, Unitful, PlutoUI

# ╔═╡ 3354d3d9-3b7d-49ff-bb1c-1d867f25c357
TableOfContents()

# ╔═╡ adaa6a97-6a01-456d-813f-b93d275e02d0


# ╔═╡ d7486bb4-520a-4c25-b454-d534423e136c
md"""
# Einführung in die Integration mit Julia

Willkommen! In diesem Notebook lernst du, was Integration ist und wie wir sie mit dem Computer auf verschiedene Weisen berechnen können. Wir starten mit der klassischen, analytischen Methode und gehen dann zu numerischen Verfahren über, die Computer verwenden, um Näherungslösungen zu finden.

## 1. Analytische Integration (Die exakte Methode)

Integration ist ein fundamentales Konzept der Mathematik, das oft als die Berechnung der **Fläche unter einer Kurve** beschrieben wird.

Nehmen wir als Beispiel die Funktion:

$f(x) = x^2 - 2x + 1$

Wenn wir das Integral $\int f(x) \mathrm{d}x$ (die Stammfunktion) bilden, erhalten wir die allgemeine Lösung:

$\int f(x) \mathrm{d}x = \frac{1}{3} x^3 - x^2 + x + C$

wobei $C$ eine beliebige Konstante ist.

Möchten wir die Fläche unter der Kurve zwischen zwei konkreten Punkten (z.B. von $x=0$ bis $x=2$) berechnen, verwenden wir das **bestimmte Integral**:

$\int_0^2 f(x) \mathrm{d}x = \left[ \frac{1}{3} x^3 - x^2 + x \right]_0^2$

Das berechnet sich durch Einsetzen der oberen und unteren Grenze:

$= \left(\frac{1}{3} 2^3 - 2^2 + 2\right) - \left(\frac{1}{3} 0^3 - 0^2 + 0\right) = \left(\frac{8}{3} - 4 + 2\right) - 0 = \frac{2}{3} \approx 0.667$
"""

# ╔═╡ 18927e45-d458-439d-bb34-6214aa97aa4c


# ╔═╡ 5fd1e505-4d71-46d8-b15f-98dee43a2561
md"""## Beispiel
Löst das Integral analytisch. Fragt ChatGPT, Gemini, Wolframalpha etc. zur Korretkur

$$\int_{-1}^{3} x^3 - x + 10 \, \mathrm d x$$

"""

# ╔═╡ 48c4392c-6887-420d-98f0-d1efa3940f5f


# ╔═╡ 9821fbb9-990d-4077-b752-36669dc044d5


# ╔═╡ 34e75f40-8bb0-482a-aaaf-7002d63f70f3


# ╔═╡ d3518036-b745-42b4-b4c0-3f13c76459e0
md"""
## Numerische Integration

Nicht jede Funktion lässt sich so einfach "von Hand" integrieren. Hier kommen Computer ins Spiel! Die Idee der **numerischen Integration** ist, die Fläche unter der Kurve durch viele kleine, einfache geometrische Formen anzunähern.

### Methode 1: Die Rechteckregel

Wir zerlegen die Fläche in viele schmale Rechtecke und summieren deren Flächen auf. Die Breite jedes Rechtecks ist eine kleine Schrittweite (`step_size`), und die Höhe ist der Funktionswert an dieser Stelle.

$A_{total} = \int_{a}^{b} f(x) \, \mathrm d x \approx \sum_{i=1}^{N} f\left(a + \frac{b-a}{N} \cdot i \right) \cdot \frac{b-a}{N}$
"""

# ╔═╡ e70aa416-d331-405b-9410-32dbe7b72400


# ╔═╡ 76c3a099-99ed-4151-8d6c-dff02d25b8b4


# ╔═╡ 762b84e4-c51b-4afa-b1fe-d811a42229c7


# ╔═╡ edd82380-311b-4dbd-a7ac-e70569d8ab2d
md"## Aufgabe
Berechne die Integrale von oben mit der numerischen Rechteckregel.
"

# ╔═╡ 4b79770b-c386-433f-a0e4-41a5928a3632
function integrate_numerically(f, a, b, N)
	# init of summ
	summe = 0.0

	for i in 1:N
		kleiner_schritt = (b-a) / N
		# berechne kleine Rechtecke
		positions_des_rechtecks = a + i * kleiner_schritt

		# wert der funktion
		wert_der_funktion = f(positions_des_rechtecks)

		# flaeche des rechtecks?
		breite_des_rechtecks = (b-a) / N
		
		flaeche = wert_der_funktion * breite_des_rechtecks
		# summiere kleine rechtecke auf
		println(flaeche)
		
		summe += flaeche
	end
	
	# gib die summe zurück
	return summe
end

# ╔═╡ 346ffc87-cb0a-41b7-8eba-46dd522cb0f1
function beispiel(x)
	return x^3 - x + 10
end

# ╔═╡ 46c61415-67e0-4155-9512-88af10ab4cc2
integrate_numerically(beispiel, -1, 3, 200)

# ╔═╡ db0c4a6b-616d-49ab-80c6-03958a50a11f
md""" # Gravitationskraft


Die Kraft die zwischen zwei Körper wirkt, ist durch die Gravitationskraft bestimmt:

$$F_G(r) = G \cdot m_1 \cdot m_2 \frac{1}{r^2}$$


Dabei sind $m_1$ und $m_2$ die Massen der beiden Körper und  die Positionen im Raum. $G$ ist die Gravitationskonstante.

Wir können nun die Exit Velocity einer Rakete berechnen. Dazu integrieren wir die Kraft nach der Distance von Erdradius bis unendlich. Die integrierte Kraft gibt uns die Energie:


$$\int_{R_E}^{\infty} F_G(r)\, \mathrm dr =\int_{R_E}^{\infty}  G \cdot m_E \cdot m \frac{1}{r^2}  \, \mathrm dr$$


Nun können wir das gleich der kinetischen Geschwindigkeit setzen:
$$E_{kin} = \frac12 m v^2$$ 
und dann nach der Geschwindigkeit auflösen


## Aufgaben
## 1. Analytisch

Berechne das Integral analytisch


## 2. Numerisch

Berechne das Integral numerisch mit der Rechteckeregel
"""

# ╔═╡ cedacd66-4991-4e17-aa55-c04ab421d047


# ╔═╡ 1e5ae9cc-5ac0-40ff-bdb5-1b69a5743dd3


# ╔═╡ da780662-24dd-49cf-90fc-258e21d2b1e4


# ╔═╡ b7810354-0756-439c-a313-4a170a82d117


# ╔═╡ a93cadfe-38de-413b-af72-fd7d2020a4ef


# ╔═╡ 4bebf9f5-3d43-4366-a6c1-869e64d61976
md"""
# Simulation physikalischer Systeme mit Differentialgleichungen

In der Physik werden viele Phänomene durch Differentialgleichungen (DGLs) beschrieben. Eine DGL ist eine Gleichung, die eine Funktion mit ihren eigenen Ableitungen in Beziehung setzt. Zum Beispiel beschreibt die zweite Ableitung des Ortes nach der Zeit, $\ddot{x}(t)$, die Beschleunigung.

Oftmals ist es schwierig oder unmöglich, eine analytische ("exakte") Lösung für diese Gleichungen zu finden. In solchen Fällen verwenden wir numerische Methoden, um die Bewegung Schritt für Schritt zu approximieren.

In diesem Notebook werden wir uns zwei grundlegende Probleme ansehen:
1.  **Den freien Fall:** Ein Objekt, das unter konstanter Schwerkraft fällt.
2.  **Das Federpendel:** Eine Masse, die an einer Feder schwingt.

Wir werden einfache numerische Verfahren implementieren, um ihre Bewegung vorherzusagen.
"""

# ╔═╡ 065c29e9-f7eb-4bee-a96d-82f47d3e3989
md"""
## 1. Der freie Fall (Konstante Beschleunigung)

Betrachten wir den Fall eines Balles, der aus einer Höhe von 100 Metern fallen gelassen wird.
Die Bewegungsgleichung ist durch Newtons zweites Gesetz gegeben:

$$F = m \cdot a$$

Beim freien Fall ist die einzige Kraft die Schwerkraft, $F_g = m \cdot g$. Also ist die Beschleunigung konstant:

$$a = \ddot{x}(t) = g \approx 9.81 \, \frac{m}{s^2}$$

**Anfangsbedingungen** zum Zeitpunkt $t=0s$:
- Ort: $x(0) = 100m$
- Geschwindigkeit: $v(0) = \dot{x}(0) = 0 \frac{m}{s}$

Wir wollen die Bewegung simulieren und herausfinden, wie sich Ort und Geschwindigkeit über die Zeit ändern.
"""

# ╔═╡ b7a9744c-c36f-4228-b633-6308cb95d174
g = 9.81u"m/s^2"

# ╔═╡ 8ea63a4d-92f3-42d9-b09f-59fb448b3a5d
md"""
### 1.1 Das Euler-Verfahren

Das einfachste numerische Verfahren ist das **Euler-Verfahren**. Die Idee ist, die Zeit in kleine Schritte der Größe $\Delta t$ zu unterteilen. In jedem Schritt nehmen wir an, dass die Beschleunigung und Geschwindigkeit für dieses kurze Intervall konstant sind.

Die Update-Regeln sind:
1.  Neue Geschwindigkeit: $v_{neu} = v_{alt} + a \cdot \Delta t$
2.  Neuer Ort: $x_{neu} = x_{alt} + v_{alt} \cdot \Delta t$

**Wichtiger Hinweis:** Für die Berechnung des neuen Ortes wird die *alte* Geschwindigkeit verwendet. Dies führt zu einer systematischen Ungenauigkeit, wie wir sehen werden.
"""

# ╔═╡ c1d68f8c-31e1-4acb-85e0-41efa96ea339
function euler_freier_fall(x0, v0, a, T; N=200)
    ts = range(0u"s", T, N)
    delta_t = T / N

	
    xs = [x0]
    vs = [v0]
	

	# t in [0.1, 0.2, 0.3s, ]
	for t in ts
		# nehme das vorherige Elemente der Geschwindigkeit und des Orts
		v_alt = vs[end]
		x_alt = xs[end]
		
		v_neu = v_alt + delta_t * a
		x_neu = x_alt + delta_t * v_alt

		# speichert die neue geschwindigkeit
		# und den neuen in den jeweiligen Listen xs und vs
		push!(xs, x_neu)
		push!(vs, v_neu)
	end
	
	return ts, xs, vs
end

# ╔═╡ ce438890-77ac-4a27-914b-07171af5c053
l = [1,2,3,4,5]

# ╔═╡ 6760acf7-6aff-40cd-aa4e-97d1995315f0
l[end]

# ╔═╡ 9666b3f6-b29d-4641-874e-eb9374c8d6f0
[]

# ╔═╡ 1c25049e-cbd0-42cc-8952-4faa409c3d8f


# ╔═╡ 57c2653d-382a-44c1-a2e9-df85dfa0166f
begin
	# Anfangsbedingungen
	x_start = 100.0u"m"
	v_start = 0.0u"m/s"
	T_sim = 4.5u"s"
	
	# Simulation durchführen
	ts_euler, xs_euler, vs_euler = euler_freier_fall(x_start, v_start, -g, T_sim, N=20)
end

# ╔═╡ 8f306154-e4dd-4dd7-a6a3-43e310df71bc
begin
    plot(ts_euler, xs_euler[1:end-1], xlabel="Zeit in s", ylabel="Ort in m", label="Simulation")
	plot!(ts_euler, 100u"m" .- 0.5 .* g .* ts_euler.^2, label="Analytische Lösung")
end

# ╔═╡ 8e5f01c9-a3fe-4425-899b-843dece54a5a
md"""
Man kann im Plot erkennen, dass die numerische Lösung des Euler-Verfahrens leicht von der exakten analytischen Lösung abweicht. Der Fehler wird mit der Zeit größer. Für viele Anwendungen, insbesondere für oszillierende Systeme, ist dieses Verfahren nicht stabil genug. Deshalb benötigen wir bessere Methoden.
"""

# ╔═╡ e54e3aac-5243-4a74-a4fd-a527a029af4d


# ╔═╡ efe93c29-8fc3-40ef-85ae-184358b27490


# ╔═╡ b1955fb4-106d-4aa2-a4ae-962a0c8d66eb


# ╔═╡ bb54a181-4182-4e32-94bb-e99373022f25
md"""
## 2. Das Federpendel (Variable Beschleunigung)

Nun betrachten wir ein komplexeres System: eine Masse $m$, die an einer Feder mit der Federkonstante $k$ hängt. Die Kraft auf die Masse ist durch das Hookesche Gesetz gegeben:

$$F(x) = -k \cdot x$$

wobei $x$ die Auslenkung aus der Ruhelage ist. Die Beschleunigung ist nun nicht mehr konstant, sondern hängt vom Ort ab:

$$a(x) = \ddot{x}(t) = -\frac{k}{m} x(t)$$

Dies ist die Differentialgleichung für einen harmonischen Oszillator.

**Anfangsbedingungen:**
- Ort (maximale Auslenkung): $x(0) = 1.0m$
- Geschwindigkeit: $v(0) = 0 \frac{m}{s}$
"""

# ╔═╡ 956b3891-377c-4387-ac7a-aa1d2e238727
function euler_federpendel(x0, v0, k, m, T; N=200)
    ts = range(0u"s", T, N)
    delta_t = T / N

	a0 = -k / m * x0
	as = [a0]
    xs = [x0]
    vs = [v0]
	

	# t in [0.1, 0.2, 0.3s, ]
	for t in ts

		a_alt = as[end]
		# nehme das vorherige Elemente der Geschwindigkeit und des Orts
		v_alt = vs[end]
		x_alt = xs[end]

		a_neu = -k / m * x_alt
		v_neu = v_alt + delta_t * a_alt
		x_neu = x_alt + delta_t * v_alt

		# speichert die neue geschwindigkeit
		# und den neuen in den jeweiligen Listen xs und vs
		push!(as, a_neu)
		push!(xs, x_neu)
		push!(vs, v_neu)
	end
	
	return ts, xs, vs
end

# ╔═╡ f16c6b79-13e7-420f-8c0d-61fad3939b39


# ╔═╡ 18750d62-06d4-4a4a-a970-1e1d03fc5968
begin
	# Anfangsbedingungen
	m = 0.5u"kg"
	k = 2.0u"N/m"
	x0_feder = 1.0u"m"
	v0_feder = 0.0u"m/s"
	T_sim_feder = 5u"s"

	ts_euler_feder, xs_euler_feder, vs_euler_feder = euler_federpendel(x0_feder, v0_feder, k, m, T_sim_feder, N=1_000)
end

# ╔═╡ 7b7e7e5c-4a29-4abb-bf7b-f5a9cdd89109
length(xs_euler_feder)

# ╔═╡ a6db6cf9-4cbc-48f9-a294-98796150a6dd
length(ts_euler_feder)

# ╔═╡ 538d8c3d-ec09-451e-bf02-482db9f1ae88
begin
    # Analytische Lösung zum Vergleich
    # x(t) = x₀ * cos(ωt) mit ω = sqrt(k/m)
    
	plot(ts_euler_feder, xs_euler_feder[1:end-1], xlabel="time in s", ylabel="distance in m", label="simulation")
	plot!(ts_euler_feder, 1 .* cos.(√(k/m) .* ts_euler_feder), label="analytical solution")
end

# ╔═╡ fae775bb-092a-4d0c-b162-b1182c61dc39
liste = ["hallo", "wie", "geht", "es", "euch?"]

# ╔═╡ b8389158-d8bd-439c-944b-83ad36d6ff91
liste[1:end-2]

# ╔═╡ 13b9d719-ec1c-4832-8f22-d3525815e3f4
md"""
### 2.2 Das Velocity-Verlet-Verfahren

Für Systeme, bei denen die Energie erhalten bleiben sollte (wie ein ideales Pendel), ist das **Velocity-Verlet-Verfahren** (eine Variante des Leapfrog-Algorithmus) deutlich besser geeignet. Es ist zeitlich reversibel und zeigt eine viel bessere Energieerhaltung über lange Zeiträume.

Die Update-Schritte für eine ortsabhängige Beschleunigung $a(x)$ sind:

1.  **Update Ort:** Berechne den neuen Ort mit der alten Geschwindigkeit und der alten Beschleunigung.
    $x_{neu} = x_{alt} + v_{alt} \cdot \Delta t + \frac{1}{2} a(x_{alt}) \cdot \Delta t^2$

2.  **Update Beschleunigung:** Berechne die neue Beschleunigung am *neuen* Ort.
    $a_{neu} = a(x_{neu})$

3.  **Update Geschwindigkeit:** Berechne die neue Geschwindigkeit mit dem Durchschnitt der alten und neuen Beschleunigung.
    $v_{neu} = v_{alt} + \frac{1}{2} (a_{alt} + a_{neu}) \cdot \Delta t$
"""

# ╔═╡ b5c06a16-cf49-44ba-bee2-c9482b3f7f43
function velocity_verlet_federpendel(x0, v0, k, m, t_span; N=200)

	
	return 0.0, 0.0, 0.0
end

# ╔═╡ f940ad6f-4535-4690-ad3a-abd242464021
begin
	# Simulation durchführen
	ts_feder, xs_feder, vs_feder = velocity_verlet_federpendel(x0_feder, v0_feder, k, m, T_sim_feder, N=500)
end

# ╔═╡ fb265d31-d7ef-4990-8600-f112e85ac8d9
begin


	# plots
end

# ╔═╡ 3ca5263a-3168-4c63-bf75-ba43833badc2
md"""
### 2.2 Phasenraumdiagramm

Ein Phasenraumdiagramm plottet die Geschwindigkeit eines Systems gegen seinen Ort. Für ein ungedämpftes, energieerhaltendes System wie unser ideales Federpendel sollte die Trajektorie im Phasenraum eine geschlossene Kurve (eine Ellipse) sein. Dies zeigt, dass das System nach jeder Periode zum exakt gleichen Zustand zurückkehrt.

Wenn die Kurve nach außen oder innen spiralt, bedeutet das, dass die numerische Methode künstlich Energie hinzufügt oder entfernt.
"""

# ╔═╡ 8c85ee63-2ef9-4c03-a3a3-5772f3d802b8
plot(xs_euler_feder, vs_euler_feder,
    label="Phasenraum-Trajektorie",
    xlabel="Auslenkung (m)",
    ylabel="Geschwindigkeit (m/s)",
    title="Phasenraumdiagramm des Federpendels",
    legend=false)

# ╔═╡ c501bf5f-19cc-4e36-8be5-397e72791706
vs_feder

# ╔═╡ ae49dd3d-6719-4556-ac2f-6ff5d76467f7
plot(xs_feder, vs_feder,
    label="Phasenraum-Trajektorie",
    xlabel="Auslenkung (m)",
    ylabel="Geschwindigkeit (m/s)",
    title="Phasenraumdiagramm des Federpendels",
    legend=false)

# ╔═╡ 8200f734-2e32-49a7-8fd2-8b0be8bc696f
md"""
Wie man sieht, schließt sich die Kurve sehr gut, was die Stabilität des Velocity-Verlet-Verfahrens demonstriert.
"""

# ╔═╡ 3fa1df81-8148-4fae-95d8-c838c28a385e


# ╔═╡ 1debccc2-75de-4b53-bb91-73bb25f62db3
md"""
## 3. Aufgabe: Freier Fall mit Luftreibung

Erweitern wir das Problem des freien Falls um eine **Luftreibungskraft**. Eine einfache Modellierung der Reibungskraft ist, dass sie proportional zur Geschwindigkeit ist und ihr entgegenwirkt:

$$F_{reibung} = -c \cdot v$$

wobei $c$ der Reibungskoeffizient ist. Die Gesamtkraft auf das fallende Objekt ist dann die Summe aus Schwerkraft und Reibungskraft:

$$F_{gesamt} = m \cdot g - c \cdot v$$

Die Beschleunigung ist somit nicht mehr konstant, sondern hängt von der Geschwindigkeit ab:

$$a(v) = g - \frac{c}{m} v$$

**Ihre Aufgabe:**
Modifiziere  den `velocity_verlet_federpendel`-Algorithmus, um dieses Problem zu lösen. Die Beschleunigung hängt jetzt von $v$ statt von $x$ ab. Das Grundprinzip des Algorithmus bleibt jedoch dasselbe.

**Tipp:** Die Beschleunigung $a_{neu}$ im dritten Schritt des Algorithmus hängt von der Geschwindigkeit $v_{neu}$ ab. Aber $v_{neu}$ selbst hängt von $a_{neu}$ ab! Dies ist ein implizites Problem. Für den Velocity-Verlet-Algorithmus ist es jedoch üblich, die neue Beschleunigung mit einer Näherung der neuen Geschwindigkeit zu berechnen. Eine einfache und effektive Methode ist, die Position wie gewohnt zu aktualisieren und dann die Geschwindigkeit mit dem Mittelwert der Beschleunigungen zu berechnen, wobei die neue Beschleunigung von der *alten* Geschwindigkeit abhängt. Eine bessere Methode ist, eine Zwischengeschwindigkeit zu berechnen.

Wir verwenden hier die Standard-Velocity-Verlet-Form, die für kräfte, die nur von Position oder Geschwindigkeit abhängen, gut funktioniert:
1.  $v_{zwischen} = v_{alt} + \frac{1}{2} a(v_{alt}) \cdot \Delta t$
2.  $x_{neu} = x_{alt} + v_{zwischen} \cdot \Delta t$
3.  $a_{neu} = a(v_{zwischen})$
4.  $v_{neu} = v_{zwischen} + \frac{1}{2} a_{neu} \cdot \Delta t$

Implementieren die Funktion `fall_mit_reibung` unten.
"""

# ╔═╡ a9c263b4-f326-492b-88a0-c6eddbbfeb6b
function fall_mit_reibung(x0, v0, g, m, c, T; N=500)


	
    return [0.0],[0.0],[0.0]
end

# ╔═╡ c3e7b75e-ce97-4f54-8048-73900475cae3
begin
	# Parameter
	m_fall = 1.0u"kg"
	c_fall = 0.2u"kg/s"
	x0_fall = 0.0u"m"
	v0_fall = 0.0u"m/s"
	T_sim_fall = 100u"s"
	
	# Simulation mit Reibung
	ts_reibung, xs_reibung, vs_reibung = fall_mit_reibung(x0_fall, v0_fall, g, m_fall, c_fall, T_sim_fall)
	
	# ohne Reibung
	ts_frei, xs_frei, vs_frei = euler_freier_fall(x0_fall, v0_fall, g, T_sim_fall)
end

# ╔═╡ b122e1a3-b57c-4687-a1ba-2b4f33eaa5b7
begin
    plot(ts_reibung, vs_reibung,
        label="Mit Luftreibung",
        xlabel="Zeit (s)",
        ylabel="Geschwindigkeit (m/s)",
        title="Geschwindigkeit beim Fall mit/ohne Luftreibung",
        legend=:bottomright,
        lw=2)
    plot!(ts_frei, vs_frei[1:end-1],
        label="Ohne Luftreibung (freier Fall)",
        linestyle=:dash,
        lw=2)

    # Terminalgeschwindigkeit
    v_terminal = m_fall * g / c_fall
    hline!([v_terminal], label="Terminalgeschwindigkeit", color=:red, linestyle=:dot)
end

# ╔═╡ a747c6ac-6168-40a9-a5ab-b9ad21530d97
md"""
Im Geschwindigkeits-Zeit-Diagramm sehen wir ein wichtiges Phänomen: Mit Luftreibung nähert sich die Geschwindigkeit einem konstanten Wert, der **Terminalgeschwindigkeit**. 

Dies geschieht, wenn die Reibungskraft so groß wird, dass sie die Schwerkraft ausgleicht ($F_{reibung} = F_{Schwerkraft}$). Ab diesem Punkt ist die Nettokraft Null, und die Beschleunigung wird Null. Die Geschwindigkeit ändert sich nicht mehr.

$$c \cdot v_{terminal} = m \cdot g \implies v_{terminal} = \frac{m \cdot g}{c}$$

Unsere Simulation bildet dieses Verhalten korrekt ab.
"""

# ╔═╡ c0c3e56c-324e-41a3-bc6a-8344b9bf31c2
begin
	plot(ts_reibung, xs_reibung,
	    label="Mit Luftreibung",
	    xlabel="Zeit (s)",
	    ylabel="Gefallene Strecke (m)",
	    title="Strecke beim Fall mit/ohne Luftreibung",
	    legend=:bottomright,
	    lw=2)
	plot!(ts_frei, xs_frei,
	    label="Ohne Luftreibung (freier Fall)",
	    linestyle=:dash,
	    lw=2)
end

# ╔═╡ Cell order:
# ╠═711dee08-13ec-4b32-868f-60bb153c086a
# ╠═f10708f2-28e2-11f0-2124-e3da457bc7f0
# ╠═3354d3d9-3b7d-49ff-bb1c-1d867f25c357
# ╠═adaa6a97-6a01-456d-813f-b93d275e02d0
# ╟─d7486bb4-520a-4c25-b454-d534423e136c
# ╠═18927e45-d458-439d-bb34-6214aa97aa4c
# ╟─5fd1e505-4d71-46d8-b15f-98dee43a2561
# ╠═48c4392c-6887-420d-98f0-d1efa3940f5f
# ╟─9821fbb9-990d-4077-b752-36669dc044d5
# ╠═34e75f40-8bb0-482a-aaaf-7002d63f70f3
# ╟─d3518036-b745-42b4-b4c0-3f13c76459e0
# ╠═e70aa416-d331-405b-9410-32dbe7b72400
# ╠═76c3a099-99ed-4151-8d6c-dff02d25b8b4
# ╠═762b84e4-c51b-4afa-b1fe-d811a42229c7
# ╟─edd82380-311b-4dbd-a7ac-e70569d8ab2d
# ╠═4b79770b-c386-433f-a0e4-41a5928a3632
# ╠═346ffc87-cb0a-41b7-8eba-46dd522cb0f1
# ╠═46c61415-67e0-4155-9512-88af10ab4cc2
# ╟─db0c4a6b-616d-49ab-80c6-03958a50a11f
# ╠═cedacd66-4991-4e17-aa55-c04ab421d047
# ╠═1e5ae9cc-5ac0-40ff-bdb5-1b69a5743dd3
# ╠═da780662-24dd-49cf-90fc-258e21d2b1e4
# ╠═b7810354-0756-439c-a313-4a170a82d117
# ╠═a93cadfe-38de-413b-af72-fd7d2020a4ef
# ╟─4bebf9f5-3d43-4366-a6c1-869e64d61976
# ╟─065c29e9-f7eb-4bee-a96d-82f47d3e3989
# ╠═b7a9744c-c36f-4228-b633-6308cb95d174
# ╟─8ea63a4d-92f3-42d9-b09f-59fb448b3a5d
# ╠═c1d68f8c-31e1-4acb-85e0-41efa96ea339
# ╠═ce438890-77ac-4a27-914b-07171af5c053
# ╠═6760acf7-6aff-40cd-aa4e-97d1995315f0
# ╠═9666b3f6-b29d-4641-874e-eb9374c8d6f0
# ╠═1c25049e-cbd0-42cc-8952-4faa409c3d8f
# ╠═57c2653d-382a-44c1-a2e9-df85dfa0166f
# ╠═8f306154-e4dd-4dd7-a6a3-43e310df71bc
# ╟─8e5f01c9-a3fe-4425-899b-843dece54a5a
# ╠═e54e3aac-5243-4a74-a4fd-a527a029af4d
# ╠═efe93c29-8fc3-40ef-85ae-184358b27490
# ╠═b1955fb4-106d-4aa2-a4ae-962a0c8d66eb
# ╟─bb54a181-4182-4e32-94bb-e99373022f25
# ╠═956b3891-377c-4387-ac7a-aa1d2e238727
# ╠═f16c6b79-13e7-420f-8c0d-61fad3939b39
# ╠═18750d62-06d4-4a4a-a970-1e1d03fc5968
# ╠═7b7e7e5c-4a29-4abb-bf7b-f5a9cdd89109
# ╠═a6db6cf9-4cbc-48f9-a294-98796150a6dd
# ╠═538d8c3d-ec09-451e-bf02-482db9f1ae88
# ╠═fae775bb-092a-4d0c-b162-b1182c61dc39
# ╠═b8389158-d8bd-439c-944b-83ad36d6ff91
# ╟─13b9d719-ec1c-4832-8f22-d3525815e3f4
# ╠═b5c06a16-cf49-44ba-bee2-c9482b3f7f43
# ╠═f940ad6f-4535-4690-ad3a-abd242464021
# ╠═fb265d31-d7ef-4990-8600-f112e85ac8d9
# ╟─3ca5263a-3168-4c63-bf75-ba43833badc2
# ╠═8c85ee63-2ef9-4c03-a3a3-5772f3d802b8
# ╠═c501bf5f-19cc-4e36-8be5-397e72791706
# ╠═ae49dd3d-6719-4556-ac2f-6ff5d76467f7
# ╟─8200f734-2e32-49a7-8fd2-8b0be8bc696f
# ╠═3fa1df81-8148-4fae-95d8-c838c28a385e
# ╟─1debccc2-75de-4b53-bb91-73bb25f62db3
# ╠═a9c263b4-f326-492b-88a0-c6eddbbfeb6b
# ╠═c3e7b75e-ce97-4f54-8048-73900475cae3
# ╠═b122e1a3-b57c-4687-a1ba-2b4f33eaa5b7
# ╟─a747c6ac-6168-40a9-a5ab-b9ad21530d97
# ╠═c0c3e56c-324e-41a3-bc6a-8344b9bf31c2
