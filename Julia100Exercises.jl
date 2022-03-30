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
# Create a 3x3 matrix with values ranging from 0 to 8. (★☆☆)

mA = reshape(0:8, 3, 3)

# Another way would be:

mA = Matrix{Float64}(undef, 3, 3);
mA[:] = 0:8;

# ## Question 010
# Find indices of non-zero elements from `[1, 2, 0, 0, 4, 0]`. (★☆☆)

findall(!iszero, [1, 2, 0, 0, 4, 0])

# ## Question 011
# Create a 3x3 identity matrix. (★☆☆)

mA = I(3)

# An alternative method (Explicit matrix) would be:

mA = Matrix(1.0I, 3, 3)

# ## Question 012
# Create a 2x2x2 array with random values. (★☆☆)

mA = randn(2, 2, 2)

# ## Question 013
# Create a 5x5 array with random values and find the minimum and maximum values. (★☆☆)

mA = rand(5, 5);
minVal = minimum(mA)
maxVal = maximum(mA)

# Using `extrema` one could get both values at once:

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
mA[[LinearIndices(mA)[a] for a in CartesianIndices(mA) if (any(a.I .== 1) || a.I[1] == size(mA, 1) || a.I[2] == size(mA, 2))]] .= 1;

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
# Create a 5x5 matrix with values [1, 2, 3, 4] just below the diagonal. (★☆☆)

mA = diagm(5, 5, -1 => 1:4)

# ## Question 019
# Create a 8x8 matrix and fill it with a checkerboard pattern. (★☆☆)

mA = zeros(8, 8);
mA[2:2:end, 1:2:end] .= 1;
mA[1:2:end, 2:2:end] .= 1;
mA

# ## Question 020
# Convert the linear index 100 to a _Cartesian Index_ of a size (6,7,8). (★☆☆)

mA = rand(6, 7, 8);
cartIdx = CartesianIndices(mA)[100]; #<! See https://discourse.julialang.org/t/14666
mA[cartIdx] == mA[100]

