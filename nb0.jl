### A Pluto.jl notebook ###
# v0.11.14

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

# ╔═╡ 76665a10-0805-11eb-0b43-97096ad91383
using Plots

# ╔═╡ 0b31b990-080c-11eb-32ef-a36c736b44a6
using PlutoUI

# ╔═╡ 9993b390-0803-11eb-0124-c3a7ee8a1d12
# save it wherever

# ╔═╡ b7a8a8e0-0803-11eb-3368-63e3a333b17e
md"use `shift-enter` to run the cell, use `ctrl-enter` to run and add a cell"

# ╔═╡ ea573540-0803-11eb-262e-ad26bc86e23f
x = 1000

# ╔═╡ f8f80520-0803-11eb-0208-c979cb56c953
y = x^2

# ╔═╡ fb58b170-0803-11eb-3189-9f5274c57adc
md"see how it self updated?"

# ╔═╡ 063fd4b0-0804-11eb-1a51-ad6b9589bf9b
md"cell order is not important! But you should prefer to keep it in order for sanity"

# ╔═╡ 1b243060-0804-11eb-1f4d-21273d19b41a
md"Pluto won't allow for multiple definitons. You can use a let...end block"

# ╔═╡ 3aec7b02-0804-11eb-346e-eb9b72f5faf2
let
	x = [1,2,3,4,5]
	y = x.^2
end;

# ╔═╡ 4cb7fdee-0804-11eb-1a5e-23c7339224d0
md"The Last line is printed. Supress output with ;"

# ╔═╡ 44e948ce-0805-11eb-1bb7-d7349851fca3
x #Uses the global definition, not the one inside the let...end

# ╔═╡ 638ae330-0804-11eb-3a74-cfa083a9e3f0
println("1123")# that didn't do anything! all output goes to the julia instance.

# ╔═╡ 66a57000-080c-11eb-0a7d-e598aaab2336
md"If you REALLY need to print, then use with_terminal"

# ╔═╡ 779ed5e0-080c-11eb-35d6-3fae9834ed13
with_terminal() do 
	print([41,2,21,13,123,123,123,123323,223])
end
# defined in PlutoUI

# ╔═╡ 80291700-0804-11eb-1a5e-df40b09ab130
md"Something I found interesting in Julia"

# ╔═╡ 89427f20-0804-11eb-2f1b-cf27603acf03
"str1"+"str2" #doesn't work

# ╔═╡ 92293e80-0804-11eb-2c45-1d55271da922
"str1"*"str2" # works

# ╔═╡ b0527f20-0804-11eb-0975-c322ae92f64f
md"**why? lets check it out**"


# ╔═╡ bbacfda0-0804-11eb-1088-bb10157b6522
md"From [Julia docs](https://docs.julialang.org/en/v1/manual/strings/#man-concatenation)

While * may seem like a surprising choice to users of languages that provide + for string concatenation, this use of * has precedent in mathematics, particularly in abstract algebra.

In mathematics, + usually denotes a commutative operation, where the order of the operands does not matter. An example of this is matrix addition, where A + B == B + A for any matrices A and B that have the same shape. In contrast, * typically denotes a noncommutative operation, where the order of the operands does matter. An example of this is matrix multiplication, where in general A * B != B * A. As with matrix multiplication, string concatenation is noncommutative: greet * whom != whom * greet. As such, * is a more natural choice for an infix string concatenation operator, consistent with common mathematical use.

More precisely, the set of all finite-length strings S together with the string concatenation operator * forms a free monoid (S, *). The identity element of this set is the empty string, \"\". Whenever a free monoid is not commutative, the operation is typically represented as \cdot, *, or a similar symbol, rather than +, which as stated usually implies commutativity.
"

# ╔═╡ 128f9330-0805-11eb-1746-31f1d3eabf0f
md"Now lets add some interactivity"

# ╔═╡ 5ad2df7e-0805-11eb-117a-37f4a6add2df
@bind xSlider Slider(0:0.1:10pi, show_value = true) # we bind the value of the xSlider variable to the value of Slider()

# ╔═╡ 92fbb440-0805-11eb-1952-63b9a1fd0445
plot(x->sin(x)/x, 0:0.1:xSlider) # plot the function sin(x)/x from 0 to xSlider

# ╔═╡ dbc9181e-0805-11eb-3d51-b1443ae37ec0
# first plot takes some time

# ╔═╡ fcc8d150-0805-11eb-05bf-7d7d262804aa
md"Try that in Python. If you succeed, then do it in C++. If you do both, 
1. WOW 
2. now do it in 4 lines 😊"

# ╔═╡ 29e74360-0806-11eb-1a7f-3d9d69a945a1


# ╔═╡ Cell order:
# ╠═9993b390-0803-11eb-0124-c3a7ee8a1d12
# ╟─b7a8a8e0-0803-11eb-3368-63e3a333b17e
# ╠═76665a10-0805-11eb-0b43-97096ad91383
# ╠═0b31b990-080c-11eb-32ef-a36c736b44a6
# ╠═ea573540-0803-11eb-262e-ad26bc86e23f
# ╠═f8f80520-0803-11eb-0208-c979cb56c953
# ╟─fb58b170-0803-11eb-3189-9f5274c57adc
# ╟─063fd4b0-0804-11eb-1a51-ad6b9589bf9b
# ╟─1b243060-0804-11eb-1f4d-21273d19b41a
# ╠═3aec7b02-0804-11eb-346e-eb9b72f5faf2
# ╟─4cb7fdee-0804-11eb-1a5e-23c7339224d0
# ╠═44e948ce-0805-11eb-1bb7-d7349851fca3
# ╠═638ae330-0804-11eb-3a74-cfa083a9e3f0
# ╟─66a57000-080c-11eb-0a7d-e598aaab2336
# ╠═779ed5e0-080c-11eb-35d6-3fae9834ed13
# ╟─80291700-0804-11eb-1a5e-df40b09ab130
# ╠═89427f20-0804-11eb-2f1b-cf27603acf03
# ╠═92293e80-0804-11eb-2c45-1d55271da922
# ╟─b0527f20-0804-11eb-0975-c322ae92f64f
# ╟─bbacfda0-0804-11eb-1088-bb10157b6522
# ╟─128f9330-0805-11eb-1746-31f1d3eabf0f
# ╠═5ad2df7e-0805-11eb-117a-37f4a6add2df
# ╠═92fbb440-0805-11eb-1952-63b9a1fd0445
# ╠═dbc9181e-0805-11eb-3d51-b1443ae37ec0
# ╟─fcc8d150-0805-11eb-05bf-7d7d262804aa
# ╠═29e74360-0806-11eb-1a7f-3d9d69a945a1
