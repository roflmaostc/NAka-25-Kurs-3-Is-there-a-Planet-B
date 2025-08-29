### A Pluto.jl notebook ###
# v0.20.13

using Markdown
using InteractiveUtils

# ╔═╡ dffefc36-ad06-4bb2-b892-05c9f62f9314
begin
	using Pkg
	Pkg.activate(".")
end

# ╔═╡ d2c56190-fde5-11ef-01aa-e9d57cbfb029
using LinearAlgebra, PlutoUI

# ╔═╡ aa4c56f1-23da-4111-91e3-a3243c0346e7
import Plots

# ╔═╡ fee805e5-df4b-4dc7-8c84-8499356ddf7a
TableOfContents()

# ╔═╡ 2f0d4d40-722a-421b-aaf2-ce6eab2c484c
struct Planet{T}
	name::String
	mass::T	
	position::Vector{T}
	velocity::Vector{T}
end

# ╔═╡ 5dee43c8-1d7e-4653-8923-15af9e264a63
md""" # Bahnmechanik

In diesem Notebook sehen wir uns die Mechanik von Planeten und Satelliten an.
Die Grundkonzepte wie Zeitintegration, Energiererhaltung und Gravitationskraft kennen wir bereits. Jetzt müssen wir nur alles zusammenpacken und dann die Differentiagleichungen lösen.

Die Kraft die zwischen zwei Körper wirkt, ist durch die Gravitationskraft bestimmt:

$$F_G = G \cdot m_1 \cdot m_2 \frac{\vec r_2 - \vec r_1}{|\vec r_2 - \vec r_1|^3}$$


Dabei sind $m_1$ und $m_2$ die Massen der beiden Körper und $\vec r_1$ und $\vec r_2$ die Positionen im Raum. $G$ ist die Gravitationskonstante 
"""

# ╔═╡ bff633b2-93de-4e6d-9790-58e680d9f83d


# ╔═╡ 6c21ad50-5de0-4dfb-ac91-519f8fbd5959
pos1 = [0, 0]

# ╔═╡ a2002626-2d84-4d02-9099-2f7239e05e9d
pos2 = [-2.321, 1.123]

# ╔═╡ 87584544-8965-414b-94c0-2a5668260289
diff = pos2 - pos1

# ╔═╡ 80004e50-8fe9-4cc0-ba18-070eacffc0ec
begin
	Plots.scatter([pos1[1]], [pos1[2]])
	Plots.scatter!([pos2[1]], [pos2[2]])
end

# ╔═╡ 845cae74-a9b3-4303-bb63-8df38a0c2958


# ╔═╡ 41677dfd-1c37-4032-b127-49f1f017b657
norm([1,1] - [1,1]) 

# ╔═╡ 6222f92e-ce8f-43c7-a46a-47d9934674e7
md""" # 1. Aufgabe
Rechne die Gravitationskraft zwischen Mond - Erde, Erde - Sonne, ISS - Erde, ISS - Mond aus.

Schlage die Positionen online nach.
"""

# ╔═╡ bc0ab340-beb4-4c10-88da-248dc9642fef
x_earth = [0.0, 0.0, 0.0]

# ╔═╡ 97dc84d3-619b-451e-9e80-cdc6f7731ea7
x_iss = [408_000, 0, 0.0]

# ╔═╡ cc5a1b1b-570b-4fcb-948b-c3ceb1456f0d
m_iss = 400_000 # in kg

# ╔═╡ cea0f7da-54b5-4a47-943c-27511c22d004
m_earth = 5.94e24 #in kg

# ╔═╡ c388060c-3a0d-43a7-9718-88aeee6358b9
function Fg(r1, r2, m1, m2)
	G = 6.674e-11

	# |x|^3 = norm(x)^3
	F = G * m1 * m2 * (r2 - r1) / (norm(r2 - r1)^3)
	return F
end

# ╔═╡ b96205f6-8746-45d1-bc6a-6ca69febce3c
Fg(pos1, pos2, 100, 1)

# ╔═╡ e8d81682-4d84-4021-893b-c491b981fcf1
Fg(x_earth, x_iss, m_earth, m_iss)

# ╔═╡ 23c1cd8c-73bd-45b3-b2ba-95f4e56b1f46


# ╔═╡ 5dabe615-5cf1-4879-b66a-3ca9f5b54776
md"""# 2. Aufgabe
Simuliere die Bahn zwischen einem Satelliten und der Erde. Benutze dabei wieder das Euler Verfahren.

Teste aber auch die Leapfrog integration und vergleiche die Ergebnisse.
Plotte dazu die Trajektorien von dem Satellit. Wieso bewegt sich die Erde kaum?

"""

# ╔═╡ 7a81065b-139c-4f4b-aec1-9903f00aa656
function simuliere_satellite_erde(o1, o2, ts)

	Δt = ts[2] - ts[1]
	
	# initiale geschwindigkeit
	# erde arrays
    xs_1 = [o1.position]
    vs_1 = [o1.velocity]

	function Fg(r1, r2, m1, m2)
		G = 6.674e-11
	
		# |x|^3 = norm(x)^3
		F = G * m1 * m2 * (r2 - r1) / (norm(r2 - r1)^3)
		return F
	end

	# initiale geschwindigkeit
	# satelliten arrays
	xs_2 = [o2.position]
    vs_2 = [o2.velocity]

	N = length(ts)
    # Iteriere über die Zeitschritte
    for i in 1:(N-1)
		# retrieve old velocities and positions from list
		x1_old = xs_1[end]
		x2_old = xs_2[end]
		v1_old = vs_1[end]
		v2_old = vs_2[end]
		
		# calculate the forces and the corresponding acceleration
		F12 = Fg(x1_old, x2_old, o1.mass, o2.mass)
		F21 = Fg(x2_old, x1_old, o2.mass, o1.mass)
		a1 = F12 / o1.mass
		a2 = F21 / o2.mass

		# euler verfahren
		v1_new = v1_old + Δt * a1
		v2_new = v2_old + Δt * a2
		x1_new = x1_old + Δt * v1_old
		x2_new = x2_old + Δt * v2_old

		# speichere die positionen in der Liste
		push!(xs_1, x1_new)
		push!(vs_1, v1_new)
		push!(xs_2, x2_new)
		push!(vs_2, v2_new)
    end
    return ts, xs_1, vs_1, xs_2, vs_2

end

# ╔═╡ 597ca9da-12b2-49f5-ab99-af5921fd2ff0
times_1 = range(0, 60 * 60 * 24, 10_000)

# ╔═╡ e3fd3a5e-7987-4fef-9980-163f9db702c7
satellite = Planet("felix", 100.0, [0.0, 9e6, 0.0], [5e3, 0.0, 0.0])

# ╔═╡ d6add17a-2971-41e1-9b70-d15afca03ddb


# ╔═╡ 2c187396-fe4b-4ea7-8d92-f79d1cc6eaaa


# ╔═╡ bfe10bcf-bd25-4bb7-867d-36a14eacd644
md"""# 3. Aufgabe
Simuliere die Bahn zwischen einem Mond und der Erde. Benutze dabei wieder das Euler Verfahren.

Teste aber auch die Leapfrog integration und vergleiche die Ergebnisse.
Plotte dazu die Trajektorien von dem Mond und Erde. Wieso bewegt sich die Erde kaum?

"""

# ╔═╡ b66ea55b-50f5-409e-9e01-0db760bdac9b


# ╔═╡ c9167139-d27e-41cd-a6a5-f9be54b1e9f3
function simuliere_satellite_erde2(o1, o2, ts)

	Δt = ts[2] - ts[1]
	
	# initiale geschwindigkeit
    xs_1 = [o1.position]
    vs_1 = [o1.velocity]

	# initiale geschwindigkeit
    xs_2 = [o2.position]
    vs_2 = [o2.velocity]

	N = length(ts)
    # Iteriere über die Zeitschritte
    for i in 1:(N-1)
		# alte Geschwindigkeiten
        x_alt_1 = xs_1[end]
        v_alt_1 = vs_1[end]
        x_alt_2 = xs_2[end]
        v_alt_2 = vs_2[end]
		
        # 1. Berechne die "alte" Beschleunigung
		F_alt = Fg(x_alt_1, x_alt_2, o1.mass, o2.mass)
        a_alt_1 = F_alt / o1.mass
        a_alt_2 = -F_alt / o2.mass

        # 2. Update Ort
        x_neu_1 = x_alt_1 + v_alt_1 * Δt + 0.5 * a_alt_1 * Δt^2
        x_neu_2 = x_alt_2 + v_alt_2 * Δt + 0.5 * a_alt_2 * Δt^2

        # 3. Berechne die "neue" Beschleunigung
		F_neu = Fg(x_neu_1, x_neu_2, o1.mass, o2.mass)
		a_neu_1 = F_neu / o1.mass
        a_neu_2 = -F_neu / o2.mass

        # 4. Update Geschwindigkeit
        v_neu_1 = v_alt_1 + 0.5 * (a_alt_1 + a_neu_1) * Δt
        v_neu_2 = v_alt_2 + 0.5 * (a_alt_2 + a_neu_2) * Δt
        
		push!(vs_1, v_neu_1)
        push!(xs_1, x_neu_1)
        push!(vs_2, v_neu_2)
		push!(xs_2, x_neu_2)
    end
    return ts, xs_1, vs_1, xs_2, vs_2

end

# ╔═╡ abb230dc-7cad-4649-a8a8-f82add02e4a4
# Fluchtgeschwindigkeit

# Gravitationsenergy: Eg = G * m1 * m2 / r


Eg = 6.67e-11 * 5.94e24 * 100 / 6000_000

# ╔═╡ a80a312f-10d1-4d9a-a5f8-6402d8f7ed64
Ekin = 1/2 * 100 * v^2

# ╔═╡ 1cdf8678-a297-4655-813a-1aaeb84c1b9a
md"

$Eg = G \cdot m m_{erde} / r$

$v = \sqrt{2 \cdot E_{kin} / m}$

$v = \sqrt{2 \cdot Eg / m}=\sqrt{2 \cdot G \cdot m_{erde} / r_{erde}}$

"

# ╔═╡ 189f1831-08e1-4bae-8e59-87bc2834f416
sqrt(2 * 6.67e-11 * 5.94e24 / 6500_000)

# ╔═╡ ec394dd8-0bd8-4d42-8af9-a94ef12ddc6b
times_2 = range(0, 60 * 60 * 24 * 1, 10_000)

# ╔═╡ 69847e71-ff86-4fe3-bd50-40908bb69968
satellite3 = Planet("felix", 100.0, 
					[0.0, 7_000_000, 0.0], # ort 
					[9.5e3, 0.0, 0.0]) # v

# ╔═╡ 8d26321c-6c9c-4c0c-95bd-75acb52b6b00


# ╔═╡ f1f0010f-fedd-441c-9d87-80dbc07af6a4


# ╔═╡ ef09e2a5-cf55-4489-9b6c-d7d1af1b2bb9
md"""# 4. Aufgabe
Simuliere die Bahnen zwischen der Erde, Sonne und Mond Erde.

Plotte dazu die Trajektorien von dem Sonne, Mond und Erde.
"""

# ╔═╡ 7515f919-9247-431f-bc66-3d5154b6e868


# ╔═╡ 13e26b24-fbd3-4e0d-bb91-370f71ab3e3c


# ╔═╡ 3a3bffb9-badf-49cf-84fe-ae3a2f4f947d


# ╔═╡ 73029e7b-d4ff-42b6-878a-8c3e8a84e929


# ╔═╡ 4a3b9e02-2baf-48b5-b182-1660cf9bd21e


# ╔═╡ cb44a619-4a43-4e60-81f4-021b8b135a43
md"""# 5. Aufgabe

Hier benutzen wir das Euler Verfahren.
Kannst du die fehlenden Stellen richtig auffüllen?
Der Code simuliert die Bahnen zwischen N Körpern und nicht nur die Spezialfälle von oben.
"""

# ╔═╡ e8b770cb-a7f2-4482-a867-e60d3996000f
# ╠═╡ disabled = true
#=╠═╡
using GLMakie, Makie, WGLMakie
  ╠═╡ =#

# ╔═╡ 8c975dc2-c66c-4fd0-8b20-9b7947d98bb4
begin
	earth_r = Planet("earth", 5.9722e24, [0.0, 152.10e9, 0.0], [29.29e3, 0.0, 0.0])
	sun_r = Planet("sun", 1.9885e30, [0.0, 0.0, 0.0], [0.0, 0.0, 0.0])
	mars_r = Planet("mars", 6.4171e23, [0.0, 206.650e9 * cosd(1.850), 206.650e9 * sind(1.850)], 
	              [26.50e3 * cosd(1.850), 0.0, 26.50e3 * sind(1.850)])
	
	jupiter_r = Planet("jupiter", 1.8982e27, [0.0, 816.62e9 * cosd(1.303), 816.62e9 * sind(1.303)], 
	                 [13.72e3 * cosd(1.303), 0.0, 13.72e3 * sind(1.303)])
	
	venus_r = Planet("venus", 4.8675e24, [0.0, 108.94e9 * cosd(3.394), 108.94e9 * sind(3.394)], 
	               [35.02e3 * cosd(3.394), 0.0, 35.02e3 * sind(3.394)])
	
	mercury_r = Planet("mercury", 3.3011e23, [0.0, 69.816e9 * cosd(7.004), 69.816e9 * sind(7.004)], 
	                 [38.86e3 * cosd(7.004), 0.0, 38.86e3 * sind(7.004)])
	
	saturn_r = Planet("saturn", 5.6834e26, [0.0, 1_514.50e9 * cosd(2.485), 1_514.50e9 * sind(2.485)], 
	                [10.18e3 * cosd(2.485), 0.0, 10.18e3 * sind(2.485)])
	
end

# ╔═╡ 8f7d9716-401f-4e6e-80d2-43e4e13a8b34
function simulate(planets::Vector{Planet{T}}, times) where T
	# initialize logs
	logs = Dict{String, Vector{Planet{T}}}()
	for p in planets
		logs[p.name] = [p]
	end


	Δt = times[2] - times[1]
	for t in times
		for p1name in [p.name for p in planets]
			p1 = logs[p1name][end]
			F = [0.0, 0.0, 0.0]
			for p2name in [p.name for p in planets]
				if p1name != p2name
					p2 = 
					F .+=
				end
			end
			v =  
			r = 
			push!(logs[p1.name], Planet(p1.name, p1.mass, r, v))
		end

	end
	
	return logs
end

# ╔═╡ c30c82c3-dc3d-4b67-aa18-ad0857e6652f
times = range(0, 86_400 * 10_000, 10_000)

# ╔═╡ a46a7d23-5e0d-4d6e-a3c9-607e6003f444
@time logs = simulate([earth_r, sun_r, mars_r, mercury_r, venus_r, saturn_r, jupiter_r], times)

# ╔═╡ aa768373-e687-4aec-808a-b7d716f2bcc8
plot([l.position[1] for l in logs["earth"]], [l.position[2] for l in logs["earth"]])

# ╔═╡ aadafd7e-d148-488d-a22c-cbca61111a3b
#=╠═╡
# Define a function to create planet observables and plots
function plot_planet_trajectory(logs, planet_names, times_ints)
    # Initialize the plot
    fig = Figure()
    ax = Axis3(fig[1, 1], limits=((-1000e9, 1000e9) ./ 1, (-1000e9, 1000e9) ./ 1, (-200e9, 200e9)))
    sg = GLMakie.SliderGrid(fig[2, 1], (label="t", range=times_ints, startvalue=10))

    # Initialize observables and data for each planet
    planets = Dict()
    for planet_name in planet_names
        m_log = [Point3f(logs[planet_name][i].position...) for i in times_ints]
        planets[planet_name] = Dict(
            :m_log => m_log,
            :observable => Observable(m_log[1]),
            :track => Observable([m_log[1]])
        )
    end

    # Plot the initial positions and tracks for each planet
    #colors = Dict("earth" => :blue, "sun" => :yellow, "mars" => :red, "moon" => :gray)
    for (planet_name, data) in planets
        GLMakie.scatter!(ax, data[:observable])
        GLMakie.lines!(ax, data[:track])
    end

    # Update function when slider is moved
    on(sg.sliders[1].value) do t
        for (planet_name, data) in planets
            data[:observable][] = data[:m_log][t]
            data[:track][] = @view data[:m_log][begin:t]
        end
    end

    return fig
end
  ╠═╡ =#

# ╔═╡ 35a54dcb-4204-49f6-abc2-9145ceadebe4
#=╠═╡
@time plot_planet_trajectory(logs, ["earth", "sun", "mars", "jupiter", "venus", "saturn"], 1:length(times))
  ╠═╡ =#

# ╔═╡ 105c49c5-acd5-4a39-961e-b081d2a65311
earth2.name

# ╔═╡ d8e6a448-f374-4912-b52e-b7c214216da0
earth2.velocity

# ╔═╡ b7b9fd8a-c34f-47af-9fdf-2b70dd8dfc81
earth2.position

# ╔═╡ 9e4c78d2-5a7c-43f6-828e-11b1db5f83d3
ts, xs_earth, vs_earth, xs_sat, vs_sat = simuliere_satellite_erde(earth2, satellite, times_1)

# ╔═╡ bc5ada60-be2b-40e3-879f-f158eb8747ed
begin
	s = Plots.scatter([x[1] for x in xs_earth], [x[2] for x in xs_earth], label="Erde")
	Plots.plot!([x[1] for x in xs_sat], [x[2] for x in xs_sat], label="satellite")
end

# ╔═╡ 8cf668c3-3ba7-4ada-bfee-109b5f06ebfa
ts2, xs_earth2, vs_earth2, xs_sat2, vs_sat2 = simuliere_satellite_erde2(earth2, satellite, times_2)

# ╔═╡ 8f16073f-10e3-4cb3-b030-629518b43660
ts4, xs_earth4, vs_earth4, xs_sat4, vs_sat4 = simuliere_satellite_erde2(earth2, satellite3, times_2)

# ╔═╡ 159742fb-cf87-438e-903d-046e3e8206f7
begin
	s2 = Plots.scatter([x[1] for x in xs_earth2], [x[2] for x in xs_earth2], label="Erde", aspect=:equal)
	Plots.plot!([x[1] for x in xs_sat2], [x[2] for x in xs_sat2], label="satellite")
	Plots.plot!([x[1] for x in xs_sat4], [x[2] for x in xs_sat4], label="satellite")

end

# ╔═╡ 766bf13d-ce59-4104-9659-5b59a54f9f80
earth2 = Planet("earth", 5.9722e24, [0.0, 0, 0], [0, 0.0, 0.0])

# ╔═╡ 934326ee-90af-437e-9bae-16c5e783b505
# ╠═╡ disabled = true
#=╠═╡
earth2 = Planet("earth", 5.9722e24, [0.0, 0, 0.0], [0, 0.0, 0.0])
  ╠═╡ =#

# ╔═╡ Cell order:
# ╠═dffefc36-ad06-4bb2-b892-05c9f62f9314
# ╠═d2c56190-fde5-11ef-01aa-e9d57cbfb029
# ╠═aa4c56f1-23da-4111-91e3-a3243c0346e7
# ╠═fee805e5-df4b-4dc7-8c84-8499356ddf7a
# ╠═2f0d4d40-722a-421b-aaf2-ce6eab2c484c
# ╟─5dee43c8-1d7e-4653-8923-15af9e264a63
# ╠═bff633b2-93de-4e6d-9790-58e680d9f83d
# ╠═6c21ad50-5de0-4dfb-ac91-519f8fbd5959
# ╠═a2002626-2d84-4d02-9099-2f7239e05e9d
# ╠═87584544-8965-414b-94c0-2a5668260289
# ╠═80004e50-8fe9-4cc0-ba18-070eacffc0ec
# ╠═b96205f6-8746-45d1-bc6a-6ca69febce3c
# ╠═845cae74-a9b3-4303-bb63-8df38a0c2958
# ╠═41677dfd-1c37-4032-b127-49f1f017b657
# ╟─6222f92e-ce8f-43c7-a46a-47d9934674e7
# ╠═bc0ab340-beb4-4c10-88da-248dc9642fef
# ╠═97dc84d3-619b-451e-9e80-cdc6f7731ea7
# ╠═cc5a1b1b-570b-4fcb-948b-c3ceb1456f0d
# ╠═cea0f7da-54b5-4a47-943c-27511c22d004
# ╠═e8d81682-4d84-4021-893b-c491b981fcf1
# ╠═c388060c-3a0d-43a7-9718-88aeee6358b9
# ╠═23c1cd8c-73bd-45b3-b2ba-95f4e56b1f46
# ╟─5dabe615-5cf1-4879-b66a-3ca9f5b54776
# ╠═766bf13d-ce59-4104-9659-5b59a54f9f80
# ╠═105c49c5-acd5-4a39-961e-b081d2a65311
# ╠═d8e6a448-f374-4912-b52e-b7c214216da0
# ╠═b7b9fd8a-c34f-47af-9fdf-2b70dd8dfc81
# ╠═7a81065b-139c-4f4b-aec1-9903f00aa656
# ╠═597ca9da-12b2-49f5-ab99-af5921fd2ff0
# ╠═9e4c78d2-5a7c-43f6-828e-11b1db5f83d3
# ╠═e3fd3a5e-7987-4fef-9980-163f9db702c7
# ╠═bc5ada60-be2b-40e3-879f-f158eb8747ed
# ╠═d6add17a-2971-41e1-9b70-d15afca03ddb
# ╠═2c187396-fe4b-4ea7-8d92-f79d1cc6eaaa
# ╟─bfe10bcf-bd25-4bb7-867d-36a14eacd644
# ╠═b66ea55b-50f5-409e-9e01-0db760bdac9b
# ╠═c9167139-d27e-41cd-a6a5-f9be54b1e9f3
# ╠═8cf668c3-3ba7-4ada-bfee-109b5f06ebfa
# ╠═abb230dc-7cad-4649-a8a8-f82add02e4a4
# ╠═a80a312f-10d1-4d9a-a5f8-6402d8f7ed64
# ╠═1cdf8678-a297-4655-813a-1aaeb84c1b9a
# ╠═189f1831-08e1-4bae-8e59-87bc2834f416
# ╠═8f16073f-10e3-4cb3-b030-629518b43660
# ╠═ec394dd8-0bd8-4d42-8af9-a94ef12ddc6b
# ╠═69847e71-ff86-4fe3-bd50-40908bb69968
# ╠═159742fb-cf87-438e-903d-046e3e8206f7
# ╠═8d26321c-6c9c-4c0c-95bd-75acb52b6b00
# ╠═f1f0010f-fedd-441c-9d87-80dbc07af6a4
# ╟─ef09e2a5-cf55-4489-9b6c-d7d1af1b2bb9
# ╠═7515f919-9247-431f-bc66-3d5154b6e868
# ╠═13e26b24-fbd3-4e0d-bb91-370f71ab3e3c
# ╠═3a3bffb9-badf-49cf-84fe-ae3a2f4f947d
# ╠═73029e7b-d4ff-42b6-878a-8c3e8a84e929
# ╠═4a3b9e02-2baf-48b5-b182-1660cf9bd21e
# ╟─cb44a619-4a43-4e60-81f4-021b8b135a43
# ╠═e8b770cb-a7f2-4482-a867-e60d3996000f
# ╠═8c975dc2-c66c-4fd0-8b20-9b7947d98bb4
# ╠═8f7d9716-401f-4e6e-80d2-43e4e13a8b34
# ╠═c30c82c3-dc3d-4b67-aa18-ad0857e6652f
# ╠═a46a7d23-5e0d-4d6e-a3c9-607e6003f444
# ╠═aa768373-e687-4aec-808a-b7d716f2bcc8
# ╠═aadafd7e-d148-488d-a22c-cbca61111a3b
# ╠═35a54dcb-4204-49f6-abc2-9145ceadebe4
# ╠═934326ee-90af-437e-9bae-16c5e783b505
