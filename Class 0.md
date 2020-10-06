# Installation and starting stuff

So hi,

## Recorded Video

[Class 0 video](class0_compressed.mp4)
Intro class without sound. **Follow** and play. See [tips](index#tips) for increasing video speed.

## Installing julia

### Windows users

Go to [julialang.org](https://julialang.org/downloads/)

Download the v1.5.2 one.

I've already downloaded, so I wont care.

Once the file is downloaded, run it. Don't change any settings, unless you know what you are doing. It'll install Julia

### Linux users

I'm on Windows, So I'll show you with WSL. Same deal if you have Linux too.

Run the following -

`sudo apt update`

`sudo apt upgrade`

You could do it using `sudo apt install julia`, but it installs v1.4.1. Hence prefer installing the binaries from julialang website as above.

**Download the v1.5.2 one.**

## Why Julia?

I mean, read the website, they do a pretty good job. But for us, speed while still being simple to write is a big plus. Further, because it is optionally typed, its easier to learn as a first language. Sure we've all done IDC 101, but that sucked, largely.

If you want to look at the way Julia _itself_ is written, look at the GitHub repo. Its pretty cool to see a language itself be written.
[https://github.com/JuliaLang/julia](https://github.com/JuliaLang/julia)

But don't worry if you don't get stuff there.

So the Linux thing installed

## Running Julia

Windows and linux should have a start menu entry.

I'll use my terminal.

```julia
PS ProgrammingInJulia$ jl
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.5.2 (2020-09-23)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia> "I've written a shortcut to start julia from my terminal"
"I've written a shortcut to start julia from my terminal"

julia> # Let's test

julia> 3+3
6

julia> 3/3
1.0

julia> 3/4
0.75

julia> # notice that it doesn't do fuckall integer division

julia> 3//4 # define a "Rational". Python is differnt here. Python does int div when using //
3//4

julia> 3//4 * 3
9//4

julia> # Allows for arbitrary accuracy division

julia> #Complex numbers are supported in-house

julia> 2+4im
2 + 4im

julia> 2+4im + 5+7im
7 + 11im

julia> # You can use typeof() for the type of a variable

julia> typeof(7+8im)
Complex{Int64}

julia> # Julia has a very nice type system, where types are subtypes of another

julia> #for eg

julia> Number >: Integer
true

julia> Number >: Real
true

julia> Number >: Rational
true

julia> Real >: Integer
true

julia> Real >: Complex
false

julia> Complex >: Real
false

julia> # Nice!

julia> # Arrays are supported by same syntax as python

julia> x = [1, 2, 3, 4, 52] # note we have assigned the list to x
5-element Array{Int64,1}:
  1
  2
  3
  4
 52

julia> # See how it is a column matrix? Let's make a row matrix

julia> y = [1 2 3 4 5] # note I used space instead of comma
1×5 Array{Int64,2}:
 1  2  3  4  5

julia> x * y # what do you expect?
5×5 Array{Int64,2}:
  1    2    3    4    5
  2    4    6    8   10
  3    6    9   12   15
  4    8   12   16   20
 52  104  156  208  260

julia> # Weird?

julia> # Not really. It works exactly like math

julia> y * x # what do you expect
1-element Array{Int64,1}:
 290

julia> # Nice!

julia> # Note it is still an array

julia> # So unlike python, row and column _vectors_ are different

julia> # and multiplication is like math

julia> # what if i want a 2d matrix?

julia> twoD = [1 2 3 4 5;
               2 3 4 5 6;
               10 10 10 10 10;
               1 1 1 1 1;]
4×5 Array{Int64,2}:
  1   2   3   4   5
  2   3   4   5   6
 10  10  10  10  10
  1   1   1   1   1

julia> # easy!

julia> # is it actually 2d though? Or just a list of lists?

julia> twoD * x
4-element Array{Int64,1}:
 290
 352
 620
  62

julia> # a 4x5 * 5x1 multiplcation!

julia> twoD * y
ERROR: DimensionMismatch("matrix A has dimensions (4,5), matrix B has dimensions (1,5)")
Stacktrace:
 [1] _generic_matmatmul!(::Array{Int64,2}, ::Char, ::Char, ::Array{Int64,2}, ::Array{Int64,2}, ::LinearAlgebra.MulAddMul{true,true,Bool,Bool}) at D:\buildbot\worker\package_win64\build\usr\share\julia\stdlib\v1.5\LinearAlgebra\src\matmul.jl:740
 [2] generic_matmatmul!(::Array{Int64,2}, ::Char, ::Char, ::Array{Int64,2}, ::Array{Int64,2}, ::LinearAlgebra.MulAddMul{true,true,Bool,Bool}) at D:\buildbot\worker\package_win64\build\usr\share\julia\stdlib\v1.5\LinearAlgebra\src\matmul.jl:728
 [3] mul! at D:\buildbot\worker\package_win64\build\usr\share\julia\stdlib\v1.5\LinearAlgebra\src\matmul.jl:235 [inlined]
 [4] mul! at D:\buildbot\worker\package_win64\build\usr\share\julia\stdlib\v1.5\LinearAlgebra\src\matmul.jl:208 [inlined]
 [5] *(::Array{Int64,2}, ::Array{Int64,2}) at D:\buildbot\worker\package_win64\build\usr\share\julia\stdlib\v1.5\LinearAlgebra\src\matmul.jl:153
 [6] top-level scope at REPL[43]:1

julia> # Obviously

julia> y = [1 2 3 4]
1×4 Array{Int64,2}:
 1  2  3  4

julia> y * twoD
1×5 Array{Int64,2}:
 39  42  45  48  51

julia> # Nice!

julia> # indexing.

julia> # in python, its from 0, here it is from 1

julia> x
5-element Array{Int64,1}:
  1
  2
  3
  4
 52

julia> x[1]
1

julia> x[2]
2

julia> x[5]
52

julia> x[0]
ERROR: BoundsError: attempt to access 5-element Array{Int64,1} at index [0]
Stacktrace:
 [1] getindex(::Array{Int64,1}, ::Int64) at .\array.jl:809
 [2] top-level scope at REPL[56]:1

julia> # accessing at 0 is a problem!

julia> x[-1]
ERROR: BoundsError: attempt to access 5-element Array{Int64,1} at index [-1]
Stacktrace:
 [1] getindex(::Array{Int64,1}, ::Int64) at .\array.jl:809
 [2] top-level scope at REPL[58]:1

julia> # doesn't work like in python

julia> # you have to do

julia> x[end]
52

julia> x[end-1]
4

julia> # Ranges -

julia> 1:9
1:9

julia> collect(1:9)
9-element Array{Int64,1}:
 1
 2
 3
 4
 5
 6
 7
 8
 9

julia> collect(1:10)
10-element Array{Int64,1}:
  1
  2
  3
  4
  5
  6
  7
  8
  9
 10

julia> collect(1:0.01:10)
901-element Array{Float64,1}:
  1.0
  1.01
  1.02
  1.03
  1.04
  1.05
  1.06
  1.07
  1.08
  1.09
  1.1
  1.11
  1.12
  ⋮
  9.89
  9.9
  9.91
  9.92
  9.93
  9.94
  9.95
  9.96
  9.97
  9.98
  9.99
 10.0

julia> # So we can create ranges using start:step:stop

julia> # So looping through a list looks like this

julia> x
5-element Array{Int64,1}:
  1
  2
  3
  4
 52

julia> for i in 1:length(x) # Note, it's not len, its length
           print(i)     # Sorry for that :sweat. Also note, its not `for ... :` There's no `:`
       end # IMPORTANT! end a for loop using `end`. INdentation is not necessary.
12345
julia> for i in 1:length(x) # Note, it's not len, its length
           println(i)     #  print prints EXACTLY what you tell it to. println prints each thing in a line.
       end # IMPORTANT! end a for loop using `end`. INdentation is not necessary.
1
2
3
4
5

julia> # Nice!

julia> for i in 1:length(x) # Note, it's not len, its length
           println(x[i])     # let's access elements of x
       end
1
2
3
4
52

julia> # Note we started from 1, not 0

julia> # And we went till, and including, length(x)

julia> # Conditionals

julia> # Straightforward

julia> if 3>4
           print(4)
       end

julia> # not the if ... end syntax again. No `:`.

julia> if 3>4
           print(5)
       else
           print("Yay")
       end
Yay
julia> if 3>4
           print(5)
       elseif 4>5
           print("Yay")
       else
           print("Nay")
       end
Nay
julia> # Not that the WHOLE if elseif else end is ONE block

julia> Cool
ERROR: UndefVarError: Cool not defined

julia> # Let's copy everything over.
```

Obviously, that was just a sneak peak. There's still a LOT of cool things

## Packages

Like python has matplotlib for plotting, Julia also has a TON load of packages.
Let's install a PLotting package.

Type `]` to start the `pkg>` prompt.

I activated a environment, but you don't need to do it. Environments are standalone _environments_ which can have different packages from the main installation. DW about it rn.

Run `pkg> add PackageName` to install it.
It'll take some time the first time. You need to be connected to the internet

### Searching for packages

you can simply search for it in google or whatvr. 

Most packages will have it like 

```julia
import Pkg
Pkg.add("Plots")
```

But don't bother with that. Just do
```julia
julia> ]
pkg> add Plots
```

I already have it, so. Output will look like below


---

Import using

`using PackageName`

First `using` takes some time to precompile

**First plot ALWAYS takes a lot of time**
There's a lot of discussion on Plots package repo to make it better, but the way that the package is written, it's hard. `Makie.jl` is better like that, but its still alpha and my god its hell to use right now.

```julia 
PS ProgrammingInJulia$ jl
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.5.2 (2020-09-23)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia> # NEW!

julia> # type ]

(@v1.5) pkg> activate .
 Activating new environment at `C:\Users\dhruv\Programs\Julia\ProgrammingInJulia\Project.toml`

(ProgrammingInJulia) pkg> add Plots
   Updating registry at `C:\Users\dhruv\.julia\registries\General`
   Updating git-repo `https://github.com/JuliaRegistries/General.git`
  Resolving package versions...
Updating `C:\Users\dhruv\Programs\Julia\ProgrammingInJulia\Project.toml`
  [91a5bcdd] + Plots v1.6.9
Updating `C:\Users\dhruv\Programs\Julia\ProgrammingInJulia\Manifest.toml`
  [79e6a3ab] + Adapt v2.3.0
  [6e34b625] + Bzip2_jll v1.0.6+4
  [35d6a980] + ColorSchemes v3.10.1
  [3da002f7] + ColorTypes v0.10.9
  [5ae59095] + Colors v0.12.4
  [34da2185] + Compat v3.18.0
  [d38c429a] + Contour v0.5.5
  [9a962f9c] + DataAPI v1.3.0
  [864edb3b] + DataStructures v0.18.7
  [e2d170a0] + DataValueInterfaces v1.0.0
  [5ae413db] + EarCut_jll v2.1.5+0
  [c87230d0] + FFMPEG v0.4.0
  [b22a6f82] + FFMPEG_jll v4.3.1+2
  [53c48c17] + FixedPointNumbers v0.8.4
  [59287772] + Formatting v0.4.1
  [d7e528f0] + FreeType2_jll v2.10.1+4
  [559328eb] + FriBidi_jll v1.0.5+5
  [28b8d3ca] + GR v0.52.0
  [5c1252a2] + GeometryBasics v0.3.2
  [4d00f742] + GeometryTypes v0.8.3
  [42e2da0e] + Grisu v1.0.0
  [cd3eb016] + HTTP v0.8.19
  [83e8ac13] + IniFile v0.5.0
  [c8e1da08] + IterTools v1.3.0
  [82899510] + IteratorInterfaceExtensions v1.0.0
  [682c06a0] + JSON v0.21.1
  [c1c5ebd0] + LAME_jll v3.100.0+2
  [b964fa9f] + LaTeXStrings v1.2.0
  [23fbe1c1] + Latexify v0.14.0
  [dd192d2f] + LibVPX_jll v1.9.0+0
  [1914dd2f] + MacroTools v0.5.5
  [739be429] + MbedTLS v1.0.2
  [c8ffd9c3] + MbedTLS_jll v2.16.8+0
  [442fdcdd] + Measures v0.3.1
  [e1d29d7a] + Missings v0.4.4
  [77ba4419] + NaNMath v0.3.4
  [e7412a2a] + Ogg_jll v1.3.4+1
  [458c3c95] + OpenSSL_jll v1.1.1+5
  [91d4177d] + Opus_jll v1.3.1+2
  [bac558e1] + OrderedCollections v1.3.1
  [69de0a69] + Parsers v1.0.10
  [ccf2f8ad] + PlotThemes v2.0.0
  [995b91a9] + PlotUtils v1.0.7
  [91a5bcdd] + Plots v1.6.9
  [3cdcf5f2] + RecipesBase v1.1.0
  [01d81517] + RecipesPipeline v0.1.13
  [189a3867] + Reexport v0.2.0
  [ae029012] + Requires v1.1.0
  [992d4aef] + Showoff v0.3.2
  [a2af1166] + SortingAlgorithms v0.3.1
  [90137ffa] + StaticArrays v0.12.4
  [2913bbd2] + StatsBase v0.33.1
  [09ab397b] + StructArrays v0.4.4
  [3783bdb8] + TableTraits v1.0.0
  [bd369af6] + Tables v1.1.0
  [83775a58] + Zlib_jll v1.2.11+16
  [0ac62f75] + libass_jll v0.14.0+3
  [f638f0a6] + libfdk_aac_jll v0.1.6+3
  [f27f6e37] + libvorbis_jll v1.3.6+5
  [1270edf5] + x264_jll v2020.7.14+1
  [dfaa095f] + x265_jll v3.0.0+2
  [2a0f44e3] + Base64
  [ade2ca70] + Dates
  [8bb1440f] + DelimitedFiles
  [8ba89e20] + Distributed
  [b77e0a4c] + InteractiveUtils
  [76f85450] + LibGit2
  [8f399da3] + Libdl
  [37e2e46d] + LinearAlgebra
  [56ddb016] + Logging
  [d6f4376e] + Markdown
  [a63ad114] + Mmap
  [44cfe95a] + Pkg
  [de0858da] + Printf
  [3fa0cd96] + REPL
  [9a3f8284] + Random
  [ea8e919c] + SHA
  [9e88b42a] + Serialization
  [1a1011a3] + SharedArrays
  [6462fe0b] + Sockets
  [2f01184e] + SparseArrays
  [10745b16] + Statistics
  [8dfed614] + Test
  [cf7118a7] + UUIDs
  [4ec0a83e] + Unicode

julia> using Plots # Like import in Python, but better

julia> # lets plot!

julia> x = [1,2,3,5, 6,7]
6-element Array{Int64,1}:
 1
 2
 3
 5
 6
 7

julia> y = 2*x
6-element Array{Int64,1}:
  2
  4
  6
 10
 12
 14

julia> # See how simple that was? no need for a numpy package, or loops!

julia> z = x^2
ERROR: MethodError: no method matching ^(::Array{Int64,1}, ::Int64)
Closest candidates are:
  ^(::Float16, ::Integer) at math.jl:915
  ^(::Float64, ::Integer) at math.jl:899
  ^(::BigFloat, ::Integer) at mpfr.jl:599
  ...
Stacktrace:
 [1] macro expansion at .\none:0 [inlined]
 [2] literal_pow(::typeof(^), ::Array{Int64,1}, ::Val{2}) at .\none:0
 [3] top-level scope at REPL[12]:1

julia> # Now that didnt work. Because it doesn't make sense to square a row vector

julia> # we want to APPLY TO EACH element

julia> # We use a `.`

julia> z = x .^ 2
6-element Array{Int64,1}:
  1
  4
  9
 25
 36
 49

julia> # using a dot tells julia to do it FOR each

julia> # consider abs

julia> abs(2)
2

julia> abs(-2)
2

julia> abs(x)
ERROR: MethodError: no method matching abs(::Array{Int64,1})
Closest candidates are:
  abs(::Float16) at float.jl:526
  abs(::Float64) at float.jl:528
  abs(::Pkg.Resolve.VersionWeight) at D:\buildbot\worker\package_win64\build\usr\share\julia\stdlib\v1.5\Pkg\src\Resolve\versionweights.jl:36
  ...
Stacktrace:
 [1] top-level scope at REPL[21]:1

julia> # didn't work, coz the abs of a vector doesn't make sense. As a side, sure a homeomorphism exists, but let's not

julia> abs.(x) # dot to the rescue!!
6-element Array{Int64,1}:
 1
 2
 3
 5
 6
 7

julia> plot(x, y)

julia> plot(x, z)

julia> # What if I want both on the SAME plot?

julia> # I use plot!()

julia> # So,

julia> p = plot(x,y)

julia> # nice. we want to UPDATE p

julia> plot!(p, x, z) # functionname!() implies the function updates the elements sent to it. This is a convention, not a rule

julia> p

julia> # Nice! p got updated

julia> # What if I want to plot a _function_?

julia> # in python, youd have to make the xvalues, then the yvalues and then plot it. EW

julia> plot!(p, x->x^2, 0:0.01:5)

julia> # green line was the function x^2 from 0 to 5

julia> # x - > x^2 is a syntax to make a simple function

julia> # note it is 2 chars, it looks like one

julia> # Julia is also cool like this -

julia> π # I did \pi[tab]
π = 3.1415926535897...

julia> plot(x->cos(x), -pi:0.01:pi)

julia> plot(x->cos(x), -pi:0.01:pi)

julia> plot(x->cos(x), 0:0.01:2pi)

julia> # we can omit x->cos(x) and make it simply cos, if we are using a single function

julia> plot(sin, 0:0.01:2pi)

julia> plot(sin, 0:0.01:5pi)
```

## Pluto!

**Pluto is a notebook package like Jupyter.**
Install `Pluto` and `PlutoUI`

```julia
(ProgrammingInJulia) pkg> add Pluto
  Resolving package versions...
Updating `C:\Users\dhruv\Programs\Julia\ProgrammingInJulia\Project.toml`
  [c3e4b0f8] + Pluto v0.11.14
Updating `C:\Users\dhruv\Programs\Julia\ProgrammingInJulia\Manifest.toml`
  [99f44e22] + MsgPack v1.1.0
  [c3e4b0f8] + Pluto v0.11.14

(ProgrammingInJulia) pkg> add PlutoUI
  Resolving package versions...
Updating `C:\Users\dhruv\Programs\Julia\ProgrammingInJulia\Project.toml`
  [7f904dfe] + PlutoUI v0.6.6
Updating `C:\Users\dhruv\Programs\Julia\ProgrammingInJulia\Manifest.toml`
  [7f904dfe] + PlutoUI v0.6.6
  [fd094767] + Suppressor v0.2.0

julia> using Pluto

julia> Pluto.run()
Opening http://localhost:1234/ in your default browser... ~ have fun!

Press Ctrl+C in this terminal to stop Pluto
```

Open notebooks continue running.

Now look at the Pluto Notebook.

You can download my notebook [nb0.jl](./nb0.jl) (I've renamed it) and open it in Pluto, OR directly put the url of the notebook in the file path bar in Pluto.

I used an example nb from an MIT course. All rights belong to them. Cool course it is. https://computationalthinking.mit.edu/Fall20/

## With that we are done

We meet on _FILL THE DATE_ for an intro to Julia and computational thinking and try to simulate a n-body gravitational system!

I'll send the link to y'all on Discord :smile:

BYE!
