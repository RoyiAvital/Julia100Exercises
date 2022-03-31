# [![Visitors](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FRoyiAvital%2FStackExchangeCodes&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=Visitors+%28Daily+%2F+Total%29&edge_flat=false)](https://github.com/RoyiAvital/Julia100Exercises)
#
# # Julia 100 Exercises
#
# A set of introductory exercises for Julia. Based on [100 NumPy Exercises](https://github.com/rougier/numpy-100).
#
# In order to generate this file:
# 1. Clone the repository (Or download).
# 2. Activate the project.
# 3. Run:
# ```Julia
# using Literate;
# Literate.markdown("Julia100Exercises.jl", name = "README", execute = true, flavor = Literate.CommonMarkFlavor());
# ```
#
# **Remark**: Tested with Julia `1.7.2`.

using Literate;
using LinearAlgebra;
using Statistics;
using Dates;

# ## Question 001
# Import the `LinearAlgebra` package under the name `LA`. (★☆☆)

import LinearAlgebra as LA;

# ## Question 002
# Print the version of Julia. (★☆☆)

println(VERSION);

# ## Question 003
# Create a non initialized vector of size 10 of `Float64`. (★☆☆)

vA = Vector{Float64}(undef, 10)

# Which is equivalent of

vA = Array{Float64, 1}(undef, 10)

# ## Question 004
# Find the memory size of any array. (★☆☆)

sizeof(vA)

# ## Question 005
# Show the documentation of the `+` (Add) method. (★☆☆)

@doc +

# ## Question 006
# Create a vector of zeros of size 10 but the fifth value which is 1. (★☆☆)

vA = zeros(10);
vA[5] = 1.0;
vA

# ## Question 007
# Create a vector with values ranging from 7 to 12. (★☆☆)

vA = 7:12

# The above is efficient type. In order to explicitly create a vector:

vA = collect(7:12)

# ## Question 008
# Reverse a vector (first element becomes last). (★☆☆)

vA = collect(1:3);
vB = vA[end:-1:1];
vB

# Alternative 001:

vB = reverse(vA);

# Alternative 002 (In place):

reverse!(vA);
vA

# ## Question 009
# Create a `3x3` matrix with values ranging from 0 to 8. (★☆☆)

mA = reshape(0:8, 3, 3)

# Another way would be:

mA = Matrix{Float64}(undef, 3, 3);
mA[:] = 0:8;

# ## Question 010
# Find indices of non zero elements from `[1, 2, 0, 0, 4, 0]`. (★☆☆)

findall(!iszero, [1, 2, 0, 0, 4, 0])

# ## Question 011
# Create a 3x3 identity matrix. (★☆☆)

mA = I(3)

# An alternative method (Explicit matrix) would be:

mA = Matrix(I, 3, 3) #<! For Float64: Matrix{Float64}(I, 3, 3)

# ## Question 012
# Create a `2x2x2` array with random values. (★☆☆)

mA = randn(2, 2, 2)

# ## Question 013
# Create a `5x5` array with random values and find the minimum and maximum values. (★☆☆)

mA = rand(5, 5);
minVal = minimum(mA)
#+
maxVal = maximum(mA)

# Using `extrema()` one could get both values at once:

minVal, maxVal = extrema(mA);

# ## Question 014
# Create a random vector of size 30 and find the mean value. (★☆☆)

meanVal = mean(randn(30))

# ## Question 015
# Create a 2d array with 1 on the border and 0 inside. (★☆☆)

mA = zeros(4, 4);
mA[:, [1, end]] .= 1;
mA[[1, end], :] .= 1;
mA

# An alternative way:

mA = ones(4, 5);
mA[2:(end - 1), 2:(end - 1)] .= 0;

# Using one line code:

mA = zeros(4, 5);
mA[[LinearIndices(mA)[cartIdx] for cartIdx in CartesianIndices(mA) if (any(cartIdx.I .== 1) || cartIdx.I[1] == size(mA, 1) || cartIdx.I[2] == size(mA, 2))]] .= 1;

# ## Question 016
# Add a border of zeros around the array. (★☆☆)

mB = zeros(size(mA) .+ 2);
mB[2:(end - 1), 2:(end - 1)] = mA;
mB

# ## Question 017
# Evaluate the following expressions. (★☆☆)

0 * NaN
#+
NaN == NaN
#+
Inf > NaN
#+
NaN - NaN
#+
NaN in [NaN]
#+
0.3 == 3 * 0.1

# ## Question 018
# Create a `5x5` matrix with values `[1, 2, 3, 4]` just below the diagonal. (★☆☆)

mA = diagm(5, 5, -1 => 1:4)

# ## Question 019
# Create a `8x8` matrix and fill it with a checkerboard pattern. (★☆☆)

mA = zeros(8, 8);
mA[2:2:end, 1:2:end] .= 1;
mA[1:2:end, 2:2:end] .= 1;
mA

# ## Question 020
# Convert the linear index 100 to a _Cartesian Index_ of a size `(6,7,8)`. (★☆☆)

mA = rand(6, 7, 8);
cartIdx = CartesianIndices(mA)[100]; #<! See https://discourse.julialang.org/t/14666
mA[cartIdx] == mA[100]

# ## Question 021
# Create a checkerboard `8x8` matrix using the `repeat()` function. (★☆☆)

mA = repeat([0 1; 1 0], 4, 4)

# ## Question 022
# Normalize a `4x4` random matrix. (★☆☆)

mA = rand(4, 4);
mA .= (mA .- mean(mA)) ./ std(mA) #<! Pay attention that `@.` will yield error (`std()` and `mean()`)

# ## Question 023
# Create a custom type that describes a color as four unsigned bytes (`RGBA`). (★☆☆)

struct sColor
    R::UInt8;
    G::UInt8;
    B::UInt8;
    A::UInt8;
end

sMyColor = sColor(rand(UInt8, 4)...)

# ## Question 024
# Multiply a `2x4` matrix by a `4x3` matrix. (★☆☆)

mA = rand(2, 4) * randn(4, 3)

# ## Question 025
# Given a 1D array, negate all elements which are between 3 and 8, in place. (★☆☆)

vA = rand(1:10, 8);
map!(x -> ((x > 3) && (x < 8)) ? -x : x, vA, vA)

# Using logical indices one could use:

vA[3 .< vA .< 8] .*= -1;

# ## Question 026
# Sum the array `1:4` with initial value of -10. (★☆☆)

sum(1:4, init = -10)

# ## Question 027
# Consider an integer vector `vZ` validate the following expressions. (★☆☆)
# ```julia
# vZ .^ vZ
# 2 << vZ >> 2
# vZ <- vZ
# 1im * vZ
# vZ / 1 / 1
# vZ < Z > Z
# ```

vZ = rand(1:10, 3);
#+
vZ .^ vZ
#+
try
    2 << vZ >> 2
catch e
    println(e)
end
#+
vZ <- vZ
#+
1im * vZ
#+
vZ / 1 / 1
#+
vZ < vZ > vZ

# ## Question 028
# Evaluate the following expressions. (★☆☆)

[0] ./ [0]
#+
try
    [0] .÷ [0]
catch e
    println(e)
end
#+
try
    convert(Float, convert(Int, NaN))
catch e
    println(e)
end

# ## Question 029
# Round away from zero a float array. (★☆☆)

vA = randn(10);
map(x -> x > 0 ? ceil(x) : floor(x), vA)

# ## Question 030
# Find common values between two arrays. (★☆☆)

vA = rand(1:10, 6);
vB = rand(1:10, 6);

vA[findall(in(vB), vA)]

# ## Question 031
# Suppress Julia's warnings. (★☆☆)

# One could use [Suppressor.jl](https://github.com/JuliaIO/Suppressor.jl).

# ## Question 032
# Compare `sqrt(-1)` and `sqrt(-1 + 0im)`. (★☆☆)

try
    sqrt(-1)
catch e
    println(e)
end
#+
sqrt(-1 + 0im)

# ## Question 033
# Display yesterday, today and tomorrow's date. (★☆☆)

println("Yesterday: $(today() - Day(1))");
println("Today: $(today())");
println("Tomorrow: $(today() + Day(1))");

# ## Question 034
# Display all the dates corresponding to the month of July 2016. (★★☆)

collect(Date(2016,7,1):Day(1):Date(2016,7,31))

# ## Question 035
# Compute `((mA + mB) * (-mA / 2))`` in place. (★★☆)

mA = rand(2, 2);
mB = rand(2, 2);
mA .= ((mA .+ mB) .* (.-mA ./ 2))

# Using the dot macro:

@. mA = ((mA + mB) * (-mA / 2));

# ## Question 036
# Extract the integer part of a random array of positive numbers using 4 different methods. (★★☆)

mA = 5 * rand(3, 3);

# Option 1:
floor.(mA)

# Option 2:
round.(mA .- 0.5) #<! Generates -0.0 for numbers smaller than 0.5

# Option 3:
mA .÷ 1

# Option 4:
mA .- rem.(mA, 1)

# ## Question 037
# Create a `5x5` matrix with row values ranging from 0 to 4. (★★☆)

mA = repeat(reshape(0:4, 1, 5), 5, 1)

# ## Question 038
# Generate an array using a generator of 10 numbers. (★☆☆)

vA = collect(x for x in 1:10)

# ## Question 039
# Create a vector of size 10 with values ranging from 0 to 1, both excluded. (★★☆)

vA = LinRange(0, 1, 12)[2:(end - 1)]

# ## Question 040
# Create a random vector of size 10 and sort it. (★★☆)

vA = rand(1:10, 10);
sort(vA)

# ## Question 041
# Implement the `sum()` function manually. (★★☆)

vA = rand(100);
sumVal = vA[1]
for ii in 2:length(vA)
    global sumVal += vA[ii];
end

# ## Question 042
# Check for equality of 2 arrays. (★★☆)

vA = rand(10);
vB = rand(10);

all(vA .== vB)

# ## Question 043
# Make an array immutable (Read only). (★★☆)

# This is a work in progress for Julia at in [Issue 31630](https://github.com/JuliaLang/julia/pull/31630).

# ## Question 044
# Consider a random `10x2` matrix representing cartesian coordinates, convert them to polar coordinates. (★★☆)

mA = rand(10, 2);

ConvToPolar = vX -> [hypot(vX[1], vX[2]), atan(vX[2], vX[1])]

mB = [ConvToPolar(vX) for vX in eachrow(mA)]

# ## Question 045
# Create random vector of size 10 and replace the maximum value by 0. (★★☆)

vA = randn(10);
vA[argmax(vA)] = 0;
vA

# ## Question 046
# Create a a grid of `x` and `y` coordinates covering the `[0, 1] x [0, 1]` area. (★★☆)

numGridPts = 5;
vX = LinRange(0, 1, numGridPts);
vY = LinRange(0, 1, numGridPts);
MeshGrid = (vX, vY) -> ([x for _ in vY, x in vX], [y for y in vY, _ in vX]);

mX, mY = MeshGrid(vX, vY); #<! See https://discourse.julialang.org/t/48679
@show mX
#+
@show mY

# ## Question 047
# Given two vectors, `vX`` and `vY``, construct the Cauchy matrix `mC`: `(Cij = 1 / (xi - yj))`. (★★☆)

vX = rand(5);
vY = rand(5);

mC = 1 ./ (vX .- vY')

# ## Question 048
# Print the minimum and maximum representable value for each Julia scalar type. (★★☆)

vT = [UInt8 UInt16 UInt32 UInt64 Int8 Int16 Int32 Int64 Float16 Float32 Float64]

for juliaType in vT
    println(typemin(juliaType));
    println(typemax(juliaType));
end

# ## Question 049
# Print all the values of an array. (★★☆)

mA = rand(3, 3);
print(mA);

# ## Question 050
# Find the closest value to a given scalar in a vector. (★★☆)

inputVal = 0.5;
vA = rand(10);

vA[argmin(abs.(vA .- inputVal))]

# ## Question 051
# Create a structured array representing a position `(x, y)` and a color `(r, g, b)`. (★★☆)

struct sPosColor
    x::Int
    y::Int
    R::UInt8;
    G::UInt8;
    B::UInt8;
    A::UInt8;
end

numPixels   = 10;
maxVal      = typemax(UInt32);
vMyColor    = [sPosColor(rand(1:maxVal, 2)..., rand(UInt8, 4)...) for _ in 1:numPixels];

# ## Question 052
# Consider a random vector with shape `(5, 2)` representing coordinates, find the distances matrix `mD`: $ {D}_{i, j} = {\left\| {x}_{i} - {x}_{j} \right\|}_{2} $. (★★☆)

mX = rand(5, 2);
vSumSqr = sum(vX -> vX .^ 2, mX, dims = 2);
mD = vSumSqr .+ vSumSqr' - 2 * (mX * mX');
mD

# ## Question 053
# Convert a float (32 bits) array into an integer (32 bits) in place. (★★☆)

vA = 100 .* rand(Float32, 5);
vA .= round.(Int32, vA)