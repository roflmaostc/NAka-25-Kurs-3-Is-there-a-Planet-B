### A Pluto.jl notebook ###
# v0.20.16

using Markdown
using InteractiveUtils

# ╔═╡ 3936dec2-7de0-11f0-1679-61134728f7e1
using Unitful, UnitfulAstro

# ╔═╡ e72b1778-e026-4f72-bcbd-5884af5e3f5f
md"# 1
Wie hoch kann die Beschleunigung sein und wie lange dauert es?

- Maximal 9g dauerhaft und kurzfristig 25g.
"

# ╔═╡ d7480769-26d0-4cf8-8c94-4a34a5bb0dea
a_max = 100u"m/s^2"

# ╔═╡ 9e82326f-60e9-4a3c-86f6-30ddae9a47e5
v_c = 30_000u"km/s"

# ╔═╡ 9171eee5-2919-4386-94bc-ab43ae89c8ef


# ╔═╡ 56dbb231-d62e-4d1d-9743-844a7d7153d4
time_in_seconds = uconvert(u"s", v_c / a_max)

# ╔═╡ d67a2d25-e1e1-4730-9b64-6075b14651f5
time_in_days = time_in_seconds / 86_400u"s"

# ╔═╡ 0c82324e-7ee1-49d8-9f88-b0cf4acafd09
md"# 2 Wie viele Atombomben braucht man?
"

# ╔═╡ 66d9ba79-de49-4585-bf79-fc217d2c4eac
energy_hiroshima = 1u"PJ"

# ╔═╡ da5c811a-521d-4a08-9814-73105421d914
m_rakete = 100_000u"kg"

# ╔═╡ 213b18b7-c1c6-4a7c-a978-b3a5109ba0d5
E_kin = 1/2 * m_rakete * v_c^2

# ╔═╡ 1a9b9202-9ccb-45a4-a99d-6e9623a19c83
upreferred(E_kin / energy_hiroshima)

# ╔═╡ 162050c7-0788-4f04-8404-0d244c105d0c


# ╔═╡ 1ed82ca2-f35f-4303-9a6c-d73501a56bfa
md"# Wie lange muss man zu Proxima Centauri reisen?

Wenn wir mit 1/10 von c reisen, dann müssten 42 Jahre zu Proxima Centauri reisen?

"

# ╔═╡ cf0dec12-8086-4c66-b9cd-380a231dad2e
distance_lj = 4.2u"ly"

# ╔═╡ 1fbfdc30-d1f9-4134-a325-156cd2a49084
upreferred(distance_lj / v_c)

# ╔═╡ 936ed62f-d7fc-4c97-9fc0-d6580af26520


# ╔═╡ 0c58694f-4ebc-49eb-b0df-bc8bb654ca08


# ╔═╡ ce41e004-fcff-4f2b-82b9-19b62eef4d09
md"# Wie viel Energie steckt 1kg Antimaterie?
"

# ╔═╡ 371e8938-a8c7-4bab-b90e-6c54de842682
# E = m * c^2
E = uconvert(u"PJ", 1u"kg" * (3e8u"m/s")^2)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Unitful = "1986cc42-f94f-5a68-af5c-568840ba703d"
UnitfulAstro = "6112ee07-acf9-5e0f-b108-d242c714bf9f"

[compat]
Unitful = "~1.24.0"
UnitfulAstro = "~1.2.2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.6"
manifest_format = "2.0"
project_hash = "093585735175c3583d81bb4bb8658bccdf766359"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"
version = "1.11.0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.11.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.27+1"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"
version = "1.11.0"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
version = "1.11.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
version = "1.11.0"

[[deps.Unitful]]
deps = ["Dates", "LinearAlgebra", "Random"]
git-tree-sha1 = "6258d453843c466d84c17a58732dda5deeb8d3af"
uuid = "1986cc42-f94f-5a68-af5c-568840ba703d"
version = "1.24.0"

    [deps.Unitful.extensions]
    ConstructionBaseUnitfulExt = "ConstructionBase"
    ForwardDiffExt = "ForwardDiff"
    InverseFunctionsUnitfulExt = "InverseFunctions"
    PrintfExt = "Printf"

    [deps.Unitful.weakdeps]
    ConstructionBase = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
    ForwardDiff = "f6369f11-7733-5829-9624-2563aa707210"
    InverseFunctions = "3587e190-3f89-42d0-90ee-14403ec27112"
    Printf = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.UnitfulAngles]]
deps = ["Dates", "Unitful"]
git-tree-sha1 = "79875b1f2e4bf918f0702a5980816955066d9ae2"
uuid = "6fb2a4bd-7999-5318-a3b2-8ad61056cd98"
version = "0.7.2"

[[deps.UnitfulAstro]]
deps = ["Unitful", "UnitfulAngles"]
git-tree-sha1 = "fbe44a0ade62ae5ed0240ad314dfdd5482b90b40"
uuid = "6112ee07-acf9-5e0f-b108-d242c714bf9f"
version = "1.2.2"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.11.0+0"
"""

# ╔═╡ Cell order:
# ╠═3936dec2-7de0-11f0-1679-61134728f7e1
# ╟─e72b1778-e026-4f72-bcbd-5884af5e3f5f
# ╠═d7480769-26d0-4cf8-8c94-4a34a5bb0dea
# ╠═9e82326f-60e9-4a3c-86f6-30ddae9a47e5
# ╠═9171eee5-2919-4386-94bc-ab43ae89c8ef
# ╠═56dbb231-d62e-4d1d-9743-844a7d7153d4
# ╠═d67a2d25-e1e1-4730-9b64-6075b14651f5
# ╟─0c82324e-7ee1-49d8-9f88-b0cf4acafd09
# ╠═66d9ba79-de49-4585-bf79-fc217d2c4eac
# ╠═da5c811a-521d-4a08-9814-73105421d914
# ╠═213b18b7-c1c6-4a7c-a978-b3a5109ba0d5
# ╠═1a9b9202-9ccb-45a4-a99d-6e9623a19c83
# ╠═162050c7-0788-4f04-8404-0d244c105d0c
# ╟─1ed82ca2-f35f-4303-9a6c-d73501a56bfa
# ╠═cf0dec12-8086-4c66-b9cd-380a231dad2e
# ╠═1fbfdc30-d1f9-4134-a325-156cd2a49084
# ╠═936ed62f-d7fc-4c97-9fc0-d6580af26520
# ╠═0c58694f-4ebc-49eb-b0df-bc8bb654ca08
# ╟─ce41e004-fcff-4f2b-82b9-19b62eef4d09
# ╠═371e8938-a8c7-4bab-b90e-6c54de842682
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
