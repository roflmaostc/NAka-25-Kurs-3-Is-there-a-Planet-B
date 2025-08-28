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

# ╔═╡ e8b770cb-a7f2-4482-a867-e60d3996000f
# ╠═╡ disabled = true
#=╠═╡
using GLMakie, Makie, WGLMakie
  ╠═╡ =#

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

# ╔═╡ c388060c-3a0d-43a7-9718-88aeee6358b9
function Fg(r1, r2, m1, m2)
	# todo
	return F
end

# ╔═╡ 6222f92e-ce8f-43c7-a46a-47d9934674e7
md""" # 1. Aufgabe
Rechne die Gravitationskraft zwischen Mond - Erde, Erde - Sonne, ISS - Erde, ISS - Mond aus.

Schlage die Positionen online nach.
"""

# ╔═╡ c84662ac-910c-458c-9bdc-ca571acb34b9


# ╔═╡ bc0ab340-beb4-4c10-88da-248dc9642fef


# ╔═╡ 97dc84d3-619b-451e-9e80-cdc6f7731ea7


# ╔═╡ e8d81682-4d84-4021-893b-c491b981fcf1


# ╔═╡ 5dabe615-5cf1-4879-b66a-3ca9f5b54776
md"""# 2. Aufgabe
Simuliere die Bahn zwischen einem Satelliten und der Erde. Benutze dabei wieder das Euler Verfahren.

Teste aber auch die Leapfrog integration und vergleiche die Ergebnisse.
Plotte dazu die Trajektorien von dem Satellit. Wieso bewegt sich die Erde kaum?

"""

# ╔═╡ 766bf13d-ce59-4104-9659-5b59a54f9f80
earth2 = Planet("earth", 5.9722e24, [0.0, 0, 0.0], [0, 0.0, 0.0])

# ╔═╡ 7a81065b-139c-4f4b-aec1-9903f00aa656
function simuliere_satellite_erde(o1, o2, ts)

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



		
    end
    return ts, xs_1, vs_1, xs_2, vs_2

end

# ╔═╡ 597ca9da-12b2-49f5-ab99-af5921fd2ff0
times_1 = range(0, 60 * 60 * 24, 10_000)

# ╔═╡ e3fd3a5e-7987-4fef-9980-163f9db702c7
satellite = Planet("felix", 100.0, [0.0, 9e6, 0.0], [5e3, 0.0, 0.0])

# ╔═╡ 9e4c78d2-5a7c-43f6-828e-11b1db5f83d3
ts, xs_earth, vs_earth, xs_sat, vs_sat = simuliere_satellite_erde(earth2, satellite, times_1)

# ╔═╡ bc5ada60-be2b-40e3-879f-f158eb8747ed
begin
	s = Plots.scatter([x[1] for x in xs_earth], [x[2] for x in xs_earth], label="Erde")
	Plots.plot!([x[1] for x in xs_sat], [x[2] for x in xs_sat], label="satellite")
end

# ╔═╡ d6add17a-2971-41e1-9b70-d15afca03ddb


# ╔═╡ 2c187396-fe4b-4ea7-8d92-f79d1cc6eaaa


# ╔═╡ bfe10bcf-bd25-4bb7-867d-36a14eacd644
md"""# 3. Aufgabe
Simuliere die Bahn zwischen einem Mond und der Erde. Benutze dabei wieder das Euler Verfahren.

Teste aber auch die Leapfrog integration und vergleiche die Ergebnisse.
Plotte dazu die Trajektorien von dem Mond und Erde. Wieso bewegt sich die Erde kaum?

"""

# ╔═╡ b66ea55b-50f5-409e-9e01-0db760bdac9b


# ╔═╡ 62f11b95-aab2-46bc-8e1d-6443679d0d41


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

# ╔═╡ 35a54dcb-4204-49f6-abc2-9145ceadebe4
@time plot_planet_trajectory(logs, ["earth", "sun", "mars", "jupiter", "venus", "saturn"], 1:length(times))

# ╔═╡ Cell order:
# ╠═dffefc36-ad06-4bb2-b892-05c9f62f9314
# ╠═d2c56190-fde5-11ef-01aa-e9d57cbfb029
# ╠═aa4c56f1-23da-4111-91e3-a3243c0346e7
# ╠═fee805e5-df4b-4dc7-8c84-8499356ddf7a
# ╠═2f0d4d40-722a-421b-aaf2-ce6eab2c484c
# ╟─5dee43c8-1d7e-4653-8923-15af9e264a63
# ╠═c388060c-3a0d-43a7-9718-88aeee6358b9
# ╟─6222f92e-ce8f-43c7-a46a-47d9934674e7
# ╠═c84662ac-910c-458c-9bdc-ca571acb34b9
# ╠═bc0ab340-beb4-4c10-88da-248dc9642fef
# ╠═97dc84d3-619b-451e-9e80-cdc6f7731ea7
# ╠═e8d81682-4d84-4021-893b-c491b981fcf1
# ╟─5dabe615-5cf1-4879-b66a-3ca9f5b54776
# ╠═766bf13d-ce59-4104-9659-5b59a54f9f80
# ╠═7a81065b-139c-4f4b-aec1-9903f00aa656
# ╠═597ca9da-12b2-49f5-ab99-af5921fd2ff0
# ╠═9e4c78d2-5a7c-43f6-828e-11b1db5f83d3
# ╠═e3fd3a5e-7987-4fef-9980-163f9db702c7
# ╠═bc5ada60-be2b-40e3-879f-f158eb8747ed
# ╠═d6add17a-2971-41e1-9b70-d15afca03ddb
# ╠═2c187396-fe4b-4ea7-8d92-f79d1cc6eaaa
# ╟─bfe10bcf-bd25-4bb7-867d-36a14eacd644
# ╠═b66ea55b-50f5-409e-9e01-0db760bdac9b
# ╠═62f11b95-aab2-46bc-8e1d-6443679d0d41
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
