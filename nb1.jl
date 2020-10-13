### A Pluto.jl notebook ###
# v0.12.3

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 6d3ddec0-0a1e-11eb-203a-fd8a1f4b537a
begin
	using Plots
	using PlutoUI
end

# ╔═╡ e7464c60-0a1f-11eb-234d-39b231461fb1
norm(v::Array{Float64}) = √(sum(v .^ 2))

# ╔═╡ a1fd70d0-0a1e-11eb-3dbd-5555b4888499
mutable struct Planet 
	mass :: Float64
	position::Array{Float64}
	velocity::Array{Float64}
end

# ╔═╡ 3bf889e0-0a1f-11eb-0fc8-4da86646d9b3
earth = Planet(0.1, [1.0, 3.1], [2.0, 4.1])

# ╔═╡ c0b603b0-0a1f-11eb-18df-ad23882cff33
 md"$G \frac{m1*m2}{|r1-r2|^3}(r1-r2)$"

# ╔═╡ 706fabd2-0a20-11eb-115e-4f5e7bdc7ee9
function update_planet!(p1::Planet, force::Array{Float64}, dt::Float64)
	δv = force/p1.mass * dt
	p1.velocity = p1.velocity + δv
	δp = p1.velocity * dt
	p1.position = p1.position + δp
end

# ╔═╡ d8a62350-0a20-11eb-23b5-099879f7be11
G = 6.67408e-11

# ╔═╡ 62395300-0a1f-11eb-1573-8f448ec7f896
function gravitational_interaction(p1::Planet, p2::Planet) :: Array{Float64}
	return (
		G * p1.mass * p2.mass / norm(p1.position - p2.position)^3 * 
		(p2.position-p1.position)
		)
end

# ╔═╡ c9a89800-0a21-11eb-3fc6-8b018587f45e
function simulate(planets::Array{Planet}, end_time::Float64, dt::Float64)
	current_time = 0
	trajectory = [[planet.position for planet in planets]]
	while current_time < end_time
		forces = []
		for planet in planets
			force = [0, 0]
			for otherplanet in planets
				if otherplanet == planet
					continue
				else
					force += gravitational_interaction(planet, otherplanet)
				end
			end
			push!(forces, force)
		end
		for i in 1:length(planets)
			update_planet!(planets[i], forces[i], dt)
		end
		positions_t = [planet.position for planet in planets]
		push!(trajectory, positions_t)
		current_time = current_time + dt
	end
	return trajectory, current_time
end

# ╔═╡ 6352ae0e-0a26-11eb-1875-cd1d9210e68e
begin
	endT = 86400*365.2*12
	dt = 86400.
	planets = [
		Planet(1.99e30, [0.,0.],        [0, 0]), # Sun
		Planet(5.97e24, [-149.6e9, 0.], [0, -29.8e3]), # earth
		Planet(4.87e24, [108.2e9, 0],   [0, 35.0e3]), # venus
		Planet(1898e24, [778.6e9, 0.],  [0, 13.1e3]), # jupiter
	]
	traj,t′ = simulate(planets, endT, dt)
end

# ╔═╡ 1e8691b0-0a27-11eb-2e28-85b893ae7079
@bind t Slider(1:10:length(traj), show_value=true)

# ╔═╡ eff0d3d0-0a24-11eb-27a6-e3fb6d1486ac
function plot_at_t(trajectory, t, title="")
	xs = []
	ys = []
	planet_positions = trajectory[t]
	for position in planet_positions
		push!(xs, position[1])
		push!(ys, position[2])
	end
	k = 1e12
	scatter(xs, ys, label=nothing, xlims=(-k, k), ylims=(-k, k), title=title)
end

# ╔═╡ b5654500-0a26-11eb-25dc-a3d643293914
plot_at_t(traj, t)

# ╔═╡ 0f1d3ca0-0d93-11eb-1271-67cf7c7bf7be
2π*149.6e9/(86400*365)

# ╔═╡ c62bc620-0a49-11eb-2c53-3bdc78993480
html"<br><br><br><br>"

# ╔═╡ adad089e-0a28-11eb-2a74-69b6fa179cce
begin
	anim = Animation()
	for t in 1:10:length(traj)
		frame(anim, plot_at_t(traj, t, "Sun - Venus - Earth - Jupyter"))
	end
	gif(anim, "sol_system.gif", fps=30)
end

# ╔═╡ Cell order:
# ╠═6d3ddec0-0a1e-11eb-203a-fd8a1f4b537a
# ╠═e7464c60-0a1f-11eb-234d-39b231461fb1
# ╠═a1fd70d0-0a1e-11eb-3dbd-5555b4888499
# ╠═3bf889e0-0a1f-11eb-0fc8-4da86646d9b3
# ╟─c0b603b0-0a1f-11eb-18df-ad23882cff33
# ╠═62395300-0a1f-11eb-1573-8f448ec7f896
# ╠═706fabd2-0a20-11eb-115e-4f5e7bdc7ee9
# ╠═c9a89800-0a21-11eb-3fc6-8b018587f45e
# ╠═d8a62350-0a20-11eb-23b5-099879f7be11
# ╠═6352ae0e-0a26-11eb-1875-cd1d9210e68e
# ╠═1e8691b0-0a27-11eb-2e28-85b893ae7079
# ╠═b5654500-0a26-11eb-25dc-a3d643293914
# ╠═eff0d3d0-0a24-11eb-27a6-e3fb6d1486ac
# ╠═0f1d3ca0-0d93-11eb-1271-67cf7c7bf7be
# ╟─c62bc620-0a49-11eb-2c53-3bdc78993480
# ╠═adad089e-0a28-11eb-2a74-69b6fa179cce
