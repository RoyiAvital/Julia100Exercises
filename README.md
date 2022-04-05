[![Visitors](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FRoyiAvital%2FStackExchangeCodes&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=Visitors+%28Daily+%2F+Total%29&edge_flat=false)](https://github.com/RoyiAvital/Julia100Exercises)

# Julia 100 Exercises

A set of introductory exercises for Julia. Based on [100 NumPy Exercises](https://github.com/rougier/numpy-100).

In order to generate this file:
1. Clone the repository (Or download).
2. Activate the project.
3. Run:
```Julia
using Literate;
Literate.markdown("Julia100Exercises.jl", name = "README", execute = true, flavor = Literate.CommonMarkFlavor());
```

**Remark**: Tested with Julia `1.7.2`.

**To Do**:
1. Reevaluate the difficulty level of each question.
2. Complete question `73`.

````julia
using Literate;
using LinearAlgebra;
using Statistics;
using Dates;
using DelimitedFiles;
using UnicodePlots;
using Random;
using Tullio;
using StaticKernels;
````

## Question 001
Import the `LinearAlgebra` package under the name `LA`. (★☆☆)

````julia
import LinearAlgebra as LA;
````

## Question 002
Print the version of Julia. (★☆☆)

````julia
println(VERSION);
````

````
1.7.2

````

## Question 003
Create a non initialized vector of size 10 of `Float64`. (★☆☆)

````julia
vA = Vector{Float64}(undef, 10)
````

````
10-element Vector{Float64}:
 1.356757678e-314
 1.3569433833e-314
 1.356946893e-314
 1.3569508457e-314
 1.339023085e-314
 1.3390231085e-314
 1.3390231323e-314
 1.356950561e-314
 1.356950593e-314
 1.3569506244e-314
````

Which is equivalent of

````julia
vA = Array{Float64, 1}(undef, 10)
````

````
10-element Vector{Float64}:
 0.0
 0.0
 0.0
 0.0
 0.0
 0.0
 0.0
 0.0
 0.0
 0.0
````

## Question 004
Find the memory size of any array. (★☆☆)

````julia
sizeof(vA)
````

````
80
````

## Question 005
Show the documentation of the `+` (Add) method. (★☆☆)

````julia
@doc +
````

```
+(x, y...)
```

Addition operator. `x+y+z+...` calls this function with all arguments, i.e. `+(x, y, z, ...)`.

# Examples

```jldoctest
julia> 1 + 20 + 4
25

julia> +(1, 20, 4)
25
```

```
dt::Date + t::Time -> DateTime
```

The addition of a `Date` with a `Time` produces a `DateTime`. The hour, minute, second, and millisecond parts of the `Time` are used along with the year, month, and day of the `Date` to create the new `DateTime`. Non-zero microseconds or nanoseconds in the `Time` type will result in an `InexactError` being thrown.


## Question 006
Create a vector of zeros of size 10 but the fifth value which is 1. (★☆☆)

````julia
vA = zeros(10);
vA[5] = 1.0;
vA
````

````
10-element Vector{Float64}:
 0.0
 0.0
 0.0
 0.0
 1.0
 0.0
 0.0
 0.0
 0.0
 0.0
````

## Question 007
Create a vector with values ranging from 7 to 12. (★☆☆)

````julia
vA = 7:12
````

````
7:12
````

The above is efficient type. In order to explicitly create a vector:

````julia
vA = collect(7:12)
````

````
6-element Vector{Int64}:
  7
  8
  9
 10
 11
 12
````

## Question 008
Reverse a vector (first element becomes last). (★☆☆)

````julia
vA = collect(1:3);
vB = vA[end:-1:1];
vB
````

````
3-element Vector{Int64}:
 3
 2
 1
````

Alternative 001:

````julia
vB = reverse(vA);
````

Alternative 002 (In place):

````julia
reverse!(vA);
vA
````

````
3-element Vector{Int64}:
 3
 2
 1
````

## Question 009
Create a `3x3` matrix with values ranging from 0 to 8. (★☆☆)

````julia
mA = reshape(0:8, 3, 3)
````

````
3×3 reshape(::UnitRange{Int64}, 3, 3) with eltype Int64:
 0  3  6
 1  4  7
 2  5  8
````

Another way would be:

````julia
mA = Matrix{Float64}(undef, 3, 3);
mA[:] = 0:8;
````

## Question 010
Find indices of non zero elements from `[1, 2, 0, 0, 4, 0]`. (★☆☆)

````julia
findall(!iszero, [1, 2, 0, 0, 4, 0])
````

````
3-element Vector{Int64}:
 1
 2
 5
````

## Question 011
Create a 3x3 identity matrix. (★☆☆)

````julia
mA = I(3)
````

````
3×3 Diagonal{Bool, Vector{Bool}}:
 1  ⋅  ⋅
 ⋅  1  ⋅
 ⋅  ⋅  1
````

An alternative method (Explicit matrix) would be:

````julia
mA = Matrix(I, 3, 3) #<! For Float64: Matrix{Float64}(I, 3, 3)
````

````
3×3 Matrix{Bool}:
 1  0  0
 0  1  0
 0  0  1
````

## Question 012
Create a `2x2x2` array with random values. (★☆☆)

````julia
mA = randn(2, 2, 2)
````

````
2×2×2 Array{Float64, 3}:
[:, :, 1] =
  0.627863   0.430135
 -0.206745  -1.44845

[:, :, 2] =
 -0.0692335  -0.283084
 -0.247753   -1.12794
````

## Question 013
Create a `5x5` array with random values and find the minimum and maximum values. (★☆☆)

````julia
mA = rand(5, 5);
minVal = minimum(mA)
````

````
0.031820051768413626
````

````julia
maxVal = maximum(mA)
````

````
0.995853510924757
````

Using `extrema()` one could get both values at once:

````julia
minVal, maxVal = extrema(mA);
````

## Question 014
Create a random vector of size 30 and find the mean value. (★☆☆)

````julia
meanVal = mean(randn(30))
````

````
0.012789646637813578
````

## Question 015
Create a 2d array with 1 on the border and 0 inside. (★☆☆)

````julia
mA = zeros(4, 4);
mA[:, [1, end]] .= 1;
mA[[1, end], :] .= 1;
mA
````

````
4×4 Matrix{Float64}:
 1.0  1.0  1.0  1.0
 1.0  0.0  0.0  1.0
 1.0  0.0  0.0  1.0
 1.0  1.0  1.0  1.0
````

An alternative way:

````julia
mA = ones(4, 5);
mA[2:(end - 1), 2:(end - 1)] .= 0;
````

Using one line code:

````julia
mA = zeros(4, 5);
mA[[LinearIndices(mA)[cartIdx] for cartIdx in CartesianIndices(mA) if (any(cartIdx.I .== 1) || cartIdx.I[1] == size(mA, 1) || cartIdx.I[2] == size(mA, 2))]] .= 1;
````

## Question 016
Add a border of zeros around the array. (★☆☆)

````julia
mB = zeros(size(mA) .+ 2);
mB[2:(end - 1), 2:(end - 1)] = mA;
mB
````

````
6×7 Matrix{Float64}:
 0.0  0.0  0.0  0.0  0.0  0.0  0.0
 0.0  1.0  1.0  1.0  1.0  1.0  0.0
 0.0  1.0  0.0  0.0  0.0  1.0  0.0
 0.0  1.0  0.0  0.0  0.0  1.0  0.0
 0.0  1.0  1.0  1.0  1.0  1.0  0.0
 0.0  0.0  0.0  0.0  0.0  0.0  0.0
````

## Question 017
Evaluate the following expressions. (★☆☆)

````julia
0 * NaN
````

````
NaN
````

````julia
NaN == NaN
````

````
false
````

````julia
Inf > NaN
````

````
false
````

````julia
NaN - NaN
````

````
NaN
````

````julia
NaN in [NaN]
````

````
false
````

````julia
0.3 == 3 * 0.1
````

````
false
````

## Question 018
Create a `5x5` matrix with values `[1, 2, 3, 4]` just below the diagonal. (★☆☆)

````julia
mA = diagm(5, 5, -1 => 1:4)
````

````
5×5 Matrix{Int64}:
 0  0  0  0  0
 1  0  0  0  0
 0  2  0  0  0
 0  0  3  0  0
 0  0  0  4  0
````

## Question 019
Create a `8x8` matrix and fill it with a checkerboard pattern. (★☆☆)

````julia
mA = zeros(8, 8);
mA[2:2:end, 1:2:end] .= 1;
mA[1:2:end, 2:2:end] .= 1;
mA
````

````
8×8 Matrix{Float64}:
 0.0  1.0  0.0  1.0  0.0  1.0  0.0  1.0
 1.0  0.0  1.0  0.0  1.0  0.0  1.0  0.0
 0.0  1.0  0.0  1.0  0.0  1.0  0.0  1.0
 1.0  0.0  1.0  0.0  1.0  0.0  1.0  0.0
 0.0  1.0  0.0  1.0  0.0  1.0  0.0  1.0
 1.0  0.0  1.0  0.0  1.0  0.0  1.0  0.0
 0.0  1.0  0.0  1.0  0.0  1.0  0.0  1.0
 1.0  0.0  1.0  0.0  1.0  0.0  1.0  0.0
````

## Question 020
Convert the linear index 100 to a _Cartesian Index_ of a size `(6,7,8)`. (★☆☆)

````julia
mA = rand(6, 7, 8);
cartIdx = CartesianIndices(mA)[100]; #<! See https://discourse.julialang.org/t/14666
mA[cartIdx] == mA[100]
````

````
true
````

## Question 021
Create a checkerboard `8x8` matrix using the `repeat()` function. (★☆☆)

````julia
mA = repeat([0 1; 1 0], 4, 4)
````

````
8×8 Matrix{Int64}:
 0  1  0  1  0  1  0  1
 1  0  1  0  1  0  1  0
 0  1  0  1  0  1  0  1
 1  0  1  0  1  0  1  0
 0  1  0  1  0  1  0  1
 1  0  1  0  1  0  1  0
 0  1  0  1  0  1  0  1
 1  0  1  0  1  0  1  0
````

## Question 022
Normalize a `4x4` random matrix. (★☆☆)

````julia
mA = rand(4, 4);
mA .= (mA .- mean(mA)) ./ std(mA) #<! Pay attention that `@.` will yield error (`std()` and `mean()`)
````

````
4×4 Matrix{Float64}:
  0.142485  -1.52638   0.136094  -1.44059
  0.849816   0.495326  1.03688   -1.65175
 -1.02623    0.848892  0.500945   1.15589
  0.599321  -0.491315  1.12207   -0.75147
````

## Question 023
Create a custom type that describes a color as four unsigned bytes (`RGBA`). (★☆☆)

````julia
struct sColor
    R::UInt8;
    G::UInt8;
    B::UInt8;
    A::UInt8;
end

sMyColor = sColor(rand(UInt8, 4)...)
````

````
Main.##509.sColor(0x0c, 0x31, 0x56, 0x30)
````

## Question 024
Multiply a `2x4` matrix by a `4x3` matrix. (★☆☆)

````julia
mA = rand(2, 4) * randn(4, 3)
````

````
2×3 Matrix{Float64}:
 0.673149   0.703984  -0.119073
 0.77646   -0.836318   0.0714949
````

## Question 025
Given a 1D array, negate all elements which are between 3 and 8, in place. (★☆☆)

````julia
vA = rand(1:10, 8);
map!(x -> ((x > 3) && (x < 8)) ? -x : x, vA, vA)
````

````
8-element Vector{Int64}:
 -4
  9
 -4
  9
 -7
  9
  3
 -5
````

Using logical indices one could use:

````julia
vA[3 .< vA .< 8] .*= -1;
````

## Question 026
Sum the array `1:4` with initial value of -10. (★☆☆)

````julia
sum(1:4, init = -10)
````

````
0
````

## Question 027
Consider an integer vector `vZ` validate the following expressions. (★☆☆)
```julia
vZ .^ vZ
2 << vZ >> 2
vZ <- vZ
1im * vZ
vZ / 1 / 1
vZ < Z > Z
```

````julia
vZ = rand(1:10, 3);
````

````julia
vZ .^ vZ
````

````
3-element Vector{Int64}:
         4
 387420489
    823543
````

````julia
try
    2 << vZ >> 2
catch e
    println(e)
end
````

````
MethodError(<<, (2, [2, 9, 7]), 0x000000000000860b)

````

````julia
vZ <- vZ
````

````
false
````

````julia
1im * vZ
````

````
3-element Vector{Complex{Int64}}:
 0 + 2im
 0 + 9im
 0 + 7im
````

````julia
vZ / 1 / 1
````

````
3-element Vector{Float64}:
 2.0
 9.0
 7.0
````

````julia
vZ < vZ > vZ
````

````
false
````

## Question 028
Evaluate the following expressions. (★☆☆)

````julia
[0] ./ [0]
````

````
1-element Vector{Float64}:
 NaN
````

````julia
try
    [0] .÷ [0]
catch e
    println(e)
end
````

````
DivideError()

````

````julia
try
    convert(Float, convert(Int, NaN))
catch e
    println(e)
end
````

````
InexactError(:Int64, Int64, NaN)

````

## Question 029
Round away from zero a float array. (★☆☆)

````julia
vA = randn(10);
map(x -> x > 0 ? ceil(x) : floor(x), vA)
````

````
10-element Vector{Float64}:
  1.0
  2.0
 -1.0
 -1.0
 -1.0
 -2.0
  1.0
  2.0
 -2.0
 -1.0
````

## Question 030
Find common values between two arrays. (★☆☆)

````julia
vA = rand(1:10, 6);
vB = rand(1:10, 6);

vA[findall(in(vB), vA)]
````

````
4-element Vector{Int64}:
 10
  1
  5
  6
````

## Question 031
Suppress Julia's warnings. (★☆☆)

One could use [Suppressor.jl](https://github.com/JuliaIO/Suppressor.jl).

## Question 032
Compare `sqrt(-1)` and `sqrt(-1 + 0im)`. (★☆☆)

````julia
try
    sqrt(-1)
catch e
    println(e)
end
````

````
DomainError(-1.0, "sqrt will only return a complex result if called with a complex argument. Try sqrt(Complex(x)).")

````

````julia
sqrt(-1 + 0im)
````

````
0.0 + 1.0im
````

## Question 033
Display yesterday, today and tomorrow's date. (★☆☆)

````julia
println("Yesterday: $(today() - Day(1))");
println("Today: $(today())");
println("Tomorrow: $(today() + Day(1))");
````

````
Yesterday: 2022-04-04
Today: 2022-04-05
Tomorrow: 2022-04-06

````

## Question 034
Display all the dates corresponding to the month of July 2016. (★★☆)

````julia
collect(Date(2016,7,1):Day(1):Date(2016,7,31))
````

````
31-element Vector{Date}:
 2016-07-01
 2016-07-02
 2016-07-03
 2016-07-04
 2016-07-05
 2016-07-06
 2016-07-07
 2016-07-08
 2016-07-09
 2016-07-10
 2016-07-11
 2016-07-12
 2016-07-13
 2016-07-14
 2016-07-15
 2016-07-16
 2016-07-17
 2016-07-18
 2016-07-19
 2016-07-20
 2016-07-21
 2016-07-22
 2016-07-23
 2016-07-24
 2016-07-25
 2016-07-26
 2016-07-27
 2016-07-28
 2016-07-29
 2016-07-30
 2016-07-31
````

## Question 035
Compute `((mA + mB) * (-mA / 2))`` in place. (★★☆)

````julia
mA = rand(2, 2);
mB = rand(2, 2);
mA .= ((mA .+ mB) .* (.-mA ./ 2))
````

````
2×2 Matrix{Float64}:
 -0.178188  -0.200678
 -0.557567  -0.198882
````

Using the dot macro:

````julia
@. mA = ((mA + mB) * (-mA / 2));
````

## Question 036
Extract the integer part of a random array of positive numbers using 4 different methods. (★★☆)

````julia
mA = 5 * rand(3, 3);
````

Option 1:

````julia
floor.(mA)
````

````
3×3 Matrix{Float64}:
 0.0  3.0  4.0
 4.0  4.0  1.0
 1.0  3.0  4.0
````

Option 2:

````julia
round.(mA .- 0.5) #<! Generates -0.0 for numbers smaller than 0.5
````

````
3×3 Matrix{Float64}:
 0.0  3.0  4.0
 4.0  4.0  1.0
 1.0  3.0  4.0
````

Option 3:

````julia
mA .÷ 1
````

````
3×3 Matrix{Float64}:
 0.0  3.0  4.0
 4.0  4.0  1.0
 1.0  3.0  4.0
````

Option 4:

````julia
mA .- rem.(mA, 1)
````

````
3×3 Matrix{Float64}:
 0.0  3.0  4.0
 4.0  4.0  1.0
 1.0  3.0  4.0
````

## Question 037
Create a `5x5` matrix with row values ranging from 0 to 4. (★★☆)

````julia
mA = repeat(reshape(0:4, 1, 5), 5, 1)
````

````
5×5 Matrix{Int64}:
 0  1  2  3  4
 0  1  2  3  4
 0  1  2  3  4
 0  1  2  3  4
 0  1  2  3  4
````

## Question 038
Generate an array using a generator of 10 numbers. (★☆☆)

````julia
vA = collect(x for x in 1:10)
````

````
10-element Vector{Int64}:
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
````

## Question 039
Create a vector of size 10 with values ranging from 0 to 1, both excluded. (★★☆)

````julia
vA = LinRange(0, 1, 12)[2:(end - 1)]
````

````
10-element LinRange{Float64, Int64}:
 0.0909091,0.181818,0.272727,0.363636,…,0.636364,0.727273,0.818182,0.909091
````

## Question 040
Create a random vector of size 10 and sort it. (★★☆)

````julia
vA = rand(1:10, 10);
sort(vA)
````

````
10-element Vector{Int64}:
 1
 1
 1
 3
 4
 4
 5
 5
 7
 9
````

## Question 041
Implement the `sum()` function manually. (★★☆)

````julia
vA = rand(100);
sumVal = vA[1]
# Using `global` for scope in Literate
for ii in 2:length(vA)
    global sumVal += vA[ii];
end
````

## Question 042
Check for equality of 2 arrays. (★★☆)

````julia
vA = rand(10);
vB = rand(10);

all(vA .== vB)
````

````
false
````

## Question 043
Make an array immutable (Read only). (★★☆)

This is a work in progress for Julia at in [Issue 31630](https://github.com/JuliaLang/julia/pull/31630).

## Question 044
Consider a random `10x2` matrix representing cartesian coordinates, convert them to polar coordinates. (★★☆)

````julia
mA = rand(10, 2);

ConvToPolar = vX -> [hypot(vX[1], vX[2]), atan(vX[2], vX[1])]

mB = [ConvToPolar(vX) for vX in eachrow(mA)]
````

````
10-element Vector{Vector{Float64}}:
 [0.7848066998346753, 1.401732215326771]
 [0.8894680750877106, 1.3424991113326632]
 [0.44181014421621556, 0.8455948968747924]
 [0.6879910966503936, 0.37638240729185857]
 [0.5342807671369845, 0.45592304750436796]
 [0.7953949461830353, 1.1462993980509502]
 [0.023374640189394467, 0.8485983036670671]
 [0.19093526428442506, 1.2415033098390929]
 [1.2012282064606692, 0.8987764647411578]
 [0.21822876037083172, 0.027438472836042973]
````

## Question 045
Create random vector of size 10 and replace the maximum value by 0. (★★☆)

````julia
vA = randn(10);
vA[argmax(vA)] = 0;
vA
````

````
10-element Vector{Float64}:
  0.09561003211716501
 -0.12757963850639437
  0.12168588041614947
  0.0
  0.5905454061434491
 -0.21396146379735115
 -1.6858192379186443
  0.4384960575992649
 -0.32093088136967385
  0.46316283794993884
````

## Question 046
Create a a grid of `x` and `y` coordinates covering the `[0, 1] x [0, 1]` area. (★★☆)

````julia
numGridPts = 5;
vX = LinRange(0, 1, numGridPts);
vY = LinRange(0, 1, numGridPts);
MeshGrid = (vX, vY) -> ([x for _ in vY, x in vX], [y for y in vY, _ in vX]);

mX, mY = MeshGrid(vX, vY); #<! See https://discourse.julialang.org/t/48679
@show mX
````

````
5×5 Matrix{Float64}:
 0.0  0.25  0.5  0.75  1.0
 0.0  0.25  0.5  0.75  1.0
 0.0  0.25  0.5  0.75  1.0
 0.0  0.25  0.5  0.75  1.0
 0.0  0.25  0.5  0.75  1.0
````

````julia
@show mY
````

````
5×5 Matrix{Float64}:
 0.0   0.0   0.0   0.0   0.0
 0.25  0.25  0.25  0.25  0.25
 0.5   0.5   0.5   0.5   0.5
 0.75  0.75  0.75  0.75  0.75
 1.0   1.0   1.0   1.0   1.0
````

## Question 047
Given two vectors, `vX`` and `vY``, construct the Cauchy matrix `mC`: `(Cij = 1 / (xi - yj))`. (★★☆)

````julia
vX = rand(5);
vY = rand(5);

mC = 1 ./ (vX .- vY')
````

````
5×5 Matrix{Float64}:
 11.1402    1.83754   1.73893   3.91487  12.7059
 -7.98113   3.03818   2.77773  24.7673   -7.3337
 -1.58831  -5.70907  -6.9301   -2.15551  -1.56089
 -2.78184  10.5301    7.94738  -5.1599   -2.6988
 26.1355    2.02963   1.90999   4.90356  36.7637
````

## Question 048
Print the minimum and maximum representable value for each Julia scalar type. (★★☆)

````julia
vT = [UInt8 UInt16 UInt32 UInt64 Int8 Int16 Int32 Int64 Float16 Float32 Float64]

for juliaType in vT
    println(typemin(juliaType));
    println(typemax(juliaType));
end
````

````
0
255
0
65535
0
4294967295
0
18446744073709551615
-128
127
-32768
32767
-2147483648
2147483647
-9223372036854775808
9223372036854775807
-Inf
Inf
-Inf
Inf
-Inf
Inf

````

## Question 049
Print all the values of an array. (★★☆)

````julia
mA = rand(3, 3);
print(mA);
````

````
[0.668901475901827 0.3378148947441988 0.8822458372664487; 0.3845746477154617 0.13271314405198997 0.039127821520003714; 0.7456568012583231 0.16681173898741808 0.608708650204774]
````

## Question 050
Find the closest value to a given scalar in a vector. (★★☆)

````julia
inputVal = 0.5;
vA = rand(10);

vA[argmin(abs.(vA .- inputVal))]
````

````
0.5313463810283375
````

## Question 051
Create a structured array representing a position `(x, y)` and a color `(r, g, b)`. (★★☆)

````julia
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
````

## Question 052
Consider a random vector with shape `(5, 2)` representing coordinates, find the distances matrix `mD`: $ {D}_{i, j} = {\left\| {x}_{i} - {x}_{j} \right\|}_{2} $. (★★☆)

````julia
mX = rand(5, 2);
vSumSqr = sum(vX -> vX .^ 2, mX, dims = 2);
mD = vSumSqr .+ vSumSqr' - 2 * (mX * mX');
mD
````

````
5×5 Matrix{Float64}:
 0.0        0.325187  0.158219   0.0955127   0.115483
 0.325187   0.0       0.417323   0.262832    0.439506
 0.158219   0.417323  0.0        0.0202135   0.541045
 0.0955127  0.262832  0.0202135  0.0         0.398515
 0.115483   0.439506  0.541045   0.398515   -2.22045e-16
````

## Question 053
Convert a float (32 bits) array into an integer (32 bits) in place. (★★☆)

````julia
vA = 100 .* rand(Float32, 5);
vA .= round.(Int32, vA)
````

````
5-element Vector{Float32}:
 36.0
 30.0
 16.0
 67.0
 72.0
````

## Question 054
Read the following file (`Q0054.txt`). (★★☆)
```
1, 2, 3, 4, 5
6,  ,  , 7, 8
 ,  , 9,10,11
```

````julia
mA = readdlm("Q0054.txt", ',')
````

````
3×5 Matrix{Any}:
 1     2      3       4   5
 6      "  "   "  "   7   8
  " "   "  "  9      10  11
````

## Question 055
Enumerate array in a loop. (★★☆)

````julia
mA = rand(3, 3);

for (elmIdx, elmVal) in enumerate(mA) #<! See https://discourse.julialang.org/t/48877
    println(elmIdx);
    println(elmVal);
end
````

````
1
0.7570929724082388
2
0.03516602563466187
3
0.5405509554155251
4
0.21548378895214326
5
0.797823103719573
6
0.524472217665752
7
0.6934790694228601
8
0.33950209319920066
9
0.6544809993478379

````

## Question 056
Generate a generic 2D Gaussian like array with `μ = 0`, `σ = 1` and indices over `{-5, -4, ..., 0, 1, ..., 5}`. (★★☆)

````julia
vA = -5:5;
μ = 0;
σ = 1;
mG = [(1 / (2 * pi * σ)) * exp(-0.5 * ((([x, y] .- μ)' * ([x, y] .- μ)) / (σ * σ))) for x in vA, y in vA];

heatmap(mG)
````

````
      ┌───────────┐              
   11 │▄▄▄▄▄▄▄▄▄▄▄│  ┌──┐ 0.2    
      │▄▄▄▄▄▄▄▄▄▄▄│  │▄▄│        
      │▄▄▄▄▄▄▄▄▄▄▄│  │▄▄│        
      │▄▄▄▄▄▄▄▄▄▄▄│  │▄▄│        
      │▄▄▄▄▄▄▄▄▄▄▄│  │▄▄│        
    1 │▄▄▄▄▄▄▄▄▄▄▄│  └──┘ 2.0e-12
      └───────────┘              
       1        11               
````

Using the separability of the Gaussian function:

````julia
vG = (1 / (sqrt(2 * pi) * σ)) .* exp.(-0.5 .* (((vA .- μ) .^ 2) / (σ * σ)));
mG = vG * vG';
````

## Question 057
Place `5` elements in a `5x5` array randomly. (★★☆)

````julia
mA = rand(5, 5);
mA[rand(1:25, 5)] = rand(5);
````

Another option which avoids setting into the same indices:

````julia
mA[randperm(25)[1:5]] = rand(5);
````

## Question 058
Subtract the mean of each row of a matrix. (★★☆)

````julia
mA = rand(3, 3);
mA .-= mean(mA, dims = 2);
mean(mA, dims = 1)
````

````
1×3 Matrix{Float64}:
 -0.171732  0.17158  0.000152052
````

## Question 059
Sort an array by a column. (★★☆)

````julia
colIdx = 2;

mA = rand(3, 3);
mA[sortperm(mA[:, colIdx]), :]
````

````
3×3 Matrix{Float64}:
 0.53069   0.123156  0.953289
 0.958157  0.440191  0.793507
 0.334956  0.843847  0.389847
````

Using `sortslices()`:

````julia
sortslices(mA, dims = 1, by = x -> x[colIdx]);
````

## Question 060
Tell if a given 2D array has null (All zeros) columns. (★★☆)

````julia
mA = rand(0:1, 3, 9);
any(all(iszero.(mA), dims = 1))
````

````
false
````

## Question 061
Find the 2nd nearest value from a given value in an array. (★★☆)

````julia
inputVal = 0.5;
vA = rand(10);

vA[sortperm(abs.(vA .- inputVal))[2]]
````

````
0.5524668363948022
````

Alternative way (More efficient)

````julia
closeFirst  = Inf;
closeSecond = Inf;
closeFirstIdx  = 0;
closeSecondIdx = 0;

# Using `global` for scope in Literate
for (elmIdx, elmVal) in enumerate(abs.(vA .- inputVal))
    if (elmVal < closeFirst)
        global closeSecond = closeFirst;
        global closeFirst = elmVal;
        global closeSecondIdx  = closeFirstIdx;
        global closeFirstIdx   = elmIdx;
    elseif (elmVal < closeSecond)
        global closeSecond = elmVal;
        global closeSecondIdx = elmIdx;
    end
end

vA[closeSecondIdx] == vA[sortperm(abs.(vA .- inputVal))[2]]
````

````
true
````

## Question 062
Considering two arrays with shape `(1, 3)` and `(3, 1)`, Compute their sum using an iterator. (★★☆)

````julia
vA = rand(1, 3);
vB = rand(3, 1);

sum([aVal + bVal for aVal in vA, bVal in vB])
````

````
11.745597216787479
````

## Question 063
Create an array class that has a name attribute. (★★☆)

One could use `NamedArrays.jl` or `AxisArrays.jl`.

## Question 064
Given a vector, add `1` to each element indexed by a second vector (Be careful with repeated indices). (★★★)

````julia
vA = rand(1:10, 5);
vB = rand(1:5, 3);

println(vA);

# Julia is very efficient with loops
for bIdx in vB
    vA[bIdx] += 1;
end

println(vA);
````

````
[5, 8, 7, 5, 5]
[7, 8, 7, 5, 6]

````

## Question 065
Accumulate elements of a vector `X` to an array `F` based on an index list `I`. (★★★)

````julia
vX = rand(1:5, 10);
vI = rand(1:15, 10);

numElements = maximum(vI);
vF = zeros(numElements);

for (ii, iIdx) in enumerate(vI)
    vF[iIdx] += vX[ii];
end

println("vX: $vX");
println("vI: $vI");
println("vF: $vF");
````

````
vX: [5, 3, 4, 3, 3, 5, 5, 4, 1, 4]
vI: [13, 9, 2, 2, 3, 3, 12, 8, 15, 11]
vF: [0.0, 7.0, 8.0, 0.0, 0.0, 0.0, 0.0, 4.0, 3.0, 0.0, 4.0, 5.0, 5.0, 0.0, 1.0]

````

One could also use `counts()` from `StatsBase.jl`.

## Question 066
Considering an image of size `w x h x 3` image of type `UInt8`, compute the number of unique colors. (★★☆)

````julia
mI = rand(UInt8, 1000, 1000, 3);

numColors = length(unique([reinterpret(UInt32, [iPx[1], iPx[2], iPx[3], 0x00])[1] for iPx in eachrow(reshape(mI, :, 3))]));
print("Number of Unique Colors: $numColors");
````

````
Number of Unique Colors: 970770
````

Another option:

````julia
numColors = length(unique([UInt32(iPx[1]) + UInt32(iPx[2]) << 8 + UInt32(iPx[3]) << 16 for iPx in eachrow(reshape(mI, :, 3))]));
print("Number of Unique Colors: $numColors");
````

````
Number of Unique Colors: 970770
````

## Question 067
Considering a three dimensions array, get sum over the last two axis at once. (★★★)

````julia
mA = rand(2, 2, 2, 2);
sum(reshape(mA, (2, 2, :)), dims = 3)
````

````
2×2×1 Array{Float64, 3}:
[:, :, 1] =
 2.5599   2.56158
 1.17564  1.29601
````

## Question 068
Considering a one dimensional vector `vA`, how to compute means of subsets of `vA` using a vector `vS` of same size describing subset indices. (★★★)

````julia
# Bascially extending `Q0065` with another vector of number of additions.

vX = rand(1:5, 10);
vI = rand(1:15, 10);

numElements = maximum(vI);
vF = zeros(numElements);
vN = zeros(Int, numElements);

for (ii, iIdx) in enumerate(vI)
    vF[iIdx] += vX[ii];
    vN[iIdx] += 1;
end

# We only divide the mean if the number of elements accumulated is bigger than 1
for ii in 1:numElements
    vF[ii] = ifelse(vN[ii] > 1, vF[ii] / vN[ii], vF[ii]);
end

println("vX: $vX");
println("vI: $vI");
println("vF: $vF");
````

````
vX: [4, 2, 1, 3, 1, 3, 5, 1, 2, 5]
vI: [7, 4, 1, 6, 13, 6, 2, 5, 15, 15]
vF: [1.0, 5.0, 0.0, 2.0, 1.0, 3.0, 4.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 3.5]

````

## Question 069
Get the diagonal of a matrix product. (★★★)

````julia
mA = rand(5, 7);
mB = rand(7, 4);

numDiagElements = min(size(mA, 1), size(mB, 2));
vD = [dot(mA[ii, :], mB[:, ii]) for ii in 1:numDiagElements]
````

````
4-element Vector{Float64}:
 1.9768792026863695
 1.5543838226740108
 2.45700980625332
 1.7404545280882897
````

Alternative way:

````julia
vD = reshape(sum(mA[1:numDiagElements, :]' .* mB[:, 1:numDiagElements], dims = 1), numDiagElements)
````

````
4-element Vector{Float64}:
 1.9768792026863695
 1.5543838226740108
 2.45700980625332
 1.7404545280882897
````

## Question 070
Consider the vector `[1, 2, 3, 4, 5]`, build a new vector with 3 consecutive zeros interleaved between each value. (★★★)

````julia
vA = 1:5;

# Since Julia is fast with loops, it would be the easiest choice

numElements = (4 * length(vA)) - 3;
vB = zeros(Int, numElements);

for (ii, bIdx) in enumerate(1:4:numElements)
    vB[bIdx] = vA[ii];
end
println(vB);

# Alternative (MATLAB style) way:

mB = [reshape(collect(vA), 1, :); zeros(Int, 3, length(vA))];
vB = reshape(mB[1:(end - 3)], :);
println(vB);
````

````
[1, 0, 0, 0, 2, 0, 0, 0, 3, 0, 0, 0, 4, 0, 0, 0, 5]
[1, 0, 0, 0, 2, 0, 0, 0, 3, 0, 0, 0, 4, 0, 0, 0, 5]

````

## Question 071
Consider an array of dimension `5 x 5 x 3`, mulitply it by an array with dimensions `5 x 5` using broadcasting. (★★★)

````julia
mA = rand(5, 5, 3);
mB = rand(5, 5);

mA .* mB #<! Very easy in Julia
````

````
5×5×3 Array{Float64, 3}:
[:, :, 1] =
 0.0258043  0.0939998  0.0765238    0.289596   0.638757
 0.611161   0.341558   0.355472     0.222115   0.216037
 0.0457198  0.311536   0.000162531  0.261552   0.0177221
 0.0900721  0.566278   0.0796454    0.273618   0.221673
 0.196479   0.235455   0.0728505    0.0221629  0.278298

[:, :, 2] =
 0.112343   0.438287   0.447003   0.177677   0.61272
 0.846917   0.184344   0.5388     0.682224   0.291077
 0.0192779  0.317749   0.0988813  0.0475243  0.0496405
 0.322209   0.129188   0.16934    0.0780406  0.278911
 0.167331   0.0686118  0.251992   0.0668104  0.0155037

[:, :, 3] =
 0.0370274  0.347414   0.212807    0.291411    0.412162
 0.771303   0.300433   0.165991    0.00865774  0.295644
 0.0526607  0.455575   0.00958011  0.0265602   0.821597
 0.174038   0.428646   0.187155    0.206276    0.316625
 0.0232053  0.0743596  0.433789    0.0395562   0.228915
````

## Question 072
Swap two rows of a 2D array. (★★★)

````julia
mA = rand(UInt8, 3, 2);
println(mA);
mA[[1, 2], :] .= mA[[2, 1], :];
println(mA);
````

````
UInt8[0x08 0x2b; 0x4d 0x7e; 0x49 0x4a]
UInt8[0x4d 0x7e; 0x08 0x2b; 0x49 0x4a]

````

## Question 073
Consider a set of 10 triplets describing 10 triangles (with shared vertices), find the set of unique line segments composing all the triangles. (★★★)

TODO: Need to understand the question.

## Question 074
Given a sorted array `vC` that corresponds to a bincount, produce an array `vA` such that `bincount(vA) == vC`. (★★★)

````julia
vC = rand(0:7, 5);
numElements = sum(vC);
vA = zeros(Int, numElements);

elmIdx = 1;
# Using `global` for scope in Literate
for (ii, binCount) in enumerate(vC)
    for jj in 1:binCount
        vA[elmIdx] = ii;
        global elmIdx += 1;
    end
end
````

## Question 075
Compute averages using a sliding window over an array. (★★★)

````julia
numElements = 10;
winRadius   = 1;
winReach    = 2 * winRadius;
winLength   = 1 + winReach;

vA = rand(0:3, numElements);
vB = zeros(numElements - (2 * winRadius));

aIdx = 1 + winRadius;
# Using `global` for scope in Literate
for ii in 1:length(vB)
    vB[ii] = mean(vA[(aIdx - winRadius):(aIdx + winRadius)]); #<! Using integral / running sum it would be faster.
    global aIdx += 1;
end
````

Another method using running sum:

````julia
vC = zeros(numElements - winReach);

jj = 1;
sumVal = sum(vA[1:winLength]);
vC[jj] = sumVal / winLength;
jj += 1;

# Using `global` for scope in Literate
for ii in 2:(numElements - winReach)
    global sumVal += vA[ii + winReach] - vA[ii - 1];
    vC[jj] = sumVal / winLength;
    global jj += 1;
end

maximum(abs.(vC - vB)) < 1e-8
````

````
true
````

## Question 076
Consider a one dimensional array `vA`, build a two dimensional array whose first row is `[ vA[0], vA[1], vA[2] ]`  and each subsequent row is shifted by 1. (★★★)

````julia
vA = rand(10);
numCols = 3;

numRows = length(vA) - numCols + 1;
mA = zeros(numRows, numCols);

for ii in 1:numRows
    mA[ii, :] = vA[ii:(ii + numCols - 1)]; #<! One could optimize the `-1` out
end
````

## Question 077
Negate a boolean or to change the sign of a float inplace. (★★★)

````julia
vA = rand(Bool, 10);
vA .= .!vA;

vA = randn(10);
vA .*= -1;
````

## Question 078
Consider 2 sets of points `mP1`, `mP2` describing lines (2d) and a point `vP`, how to compute distance from the point `vP` to each line `i`: `[mP1[i, :], mP2[i, :]`. (★★★)

````julia
# See distance of a point from a line in Wikipedia (https://en.wikipedia.org/wiki/Distance_from_a_point_to_a_line).
# Specifically _Line Defined by Two Points_.

numLines = 10;
mP1 = randn(numLines, 2);
mP2 = randn(numLines, 2);
vP  = randn(2);

vD = [(abs(((vP2[1] - vP1[1]) * (vP1[2] - vP[2])) - ((vP1[1] - vP[1]) * (vP2[2] - vP1[2]))) / hypot((vP2 - vP1)...)) for (vP1, vP2) in zip(eachrow(mP1), eachrow(mP2))];
minDist = minimum(vD);

println("Min Distance: $minDist");
````

````
Min Distance: 0.26640954821003854

````

## Question 079
Consider 2 sets of points `mP1`, `mP2` describing lines (2d) and a set of points `mP`, how to compute distance from the point `vP = mP[j, :]` to each line `i`: `[mP1[i, :], mP2[i, :]`. (★★★)

````julia
numLines = 5;
mP1 = randn(numLines, 2);
mP2 = randn(numLines, 2);
mP  = randn(numLines, 2);

mD = [(abs(((vP2[1] - vP1[1]) * (vP1[2] - vP[2])) - ((vP1[1] - vP[1]) * (vP2[2] - vP1[2]))) / hypot((vP2 - vP1)...)) for (vP1, vP2) in zip(eachrow(mP1), eachrow(mP2)), vP in eachrow(mP)];

for jj in 1:numLines
    minDist = minimum(mD[jj, :]);
    println("The minimum distance from the $jj -th point: $minDist");
end
````

````
┌ Warning: Assignment to `minDist` in soft scope is ambiguous because a global variable by the same name exists: `minDist` will be treated as a new local. Disambiguate by using `local minDist` to suppress this warning or `global minDist` to assign to the existing global variable.
└ @ string:9
The minimum distance from the 1 -th point: 0.7366095013591089
The minimum distance from the 2 -th point: 0.0037654169372260057
The minimum distance from the 3 -th point: 0.6017707912348133
The minimum distance from the 4 -th point: 0.04872023935948099
The minimum distance from the 5 -th point: 0.1500014145453875

````

## Question 080
Consider an arbitrary 2D array, write a function that extract a subpart with a fixed shape and centered on a given element (Handel out of bounds). (★★★)

````julia
# One could use `PaddedViews.jl` to easily solve this.

arrayLength = 10;
winRadius   = 3;
vWinCenter  = [7, 9];

mA = rand(arrayLength, arrayLength);
winLength = (2 * winRadius) + 1;
mB = zeros(winLength, winLength);

verShift = -winRadius;
# Using `global` for scope in Literate
for ii in 1:winLength
    horShift = -winRadius;
    for jj in 1:winLength
        mB[ii, jj] = mA[min(max(vWinCenter[1] + verShift, 1), arrayLength), min(max(vWinCenter[2] + horShift, 1), arrayLength)]; #<! Nearest neighbor extrapolation
        horShift += 1;
    end
    global verShift += 1;
end
````

## Question 081
Consider an array `vA = [1, 2, 3, ..., 13, 14]`, generate an array `vB = [[1, 2, 3, 4], [2, 3, 4, 5], [3, 4, 5, 6], ..., [11, 12, 13, 14]]`. (★★★)

````julia
vA = collect(1:14);

winNumElements  = 4;
winReach        = winNumElements - 1;

vB = [vA[ii:(ii + winReach)] for ii in 1:(length(vA) - winReach)]
````

````
11-element Vector{Vector{Int64}}:
 [1, 2, 3, 4]
 [2, 3, 4, 5]
 [3, 4, 5, 6]
 [4, 5, 6, 7]
 [5, 6, 7, 8]
 [6, 7, 8, 9]
 [7, 8, 9, 10]
 [8, 9, 10, 11]
 [9, 10, 11, 12]
 [10, 11, 12, 13]
 [11, 12, 13, 14]
````

## Question 082
Compute a matrix rank. (★★★)

````julia
numRows = 5;
numCols = 4;
mA = randn(numRows, numCols);
rank(mA)
````

````
4
````

## Question 083
Find the most frequent value in an array. (★★★)

````julia
vA = rand(1:5, 15);
````

MATLAB Style (Manual loop might be faster)

````julia
vB = unique(vA);
# vB[argmax(sum(vA .== vB', dims = 1)[:])] #<! The input to `argmax()` is a `1 x n` vector, hence squeezed so `argmax()` won't return Cartesian Index.
vB[argmax(dropdims(sum(vA .== vB', dims = 1), dims = 1))] #<! The input to `argmax()` is a `1 x n` vector, hence squeezed so `argmax()` won't return Cartesian Index.
````

````
5
````

Comparing bits:

One could convert at the bits level to integers and then use something like `counts()` from `StatsBase.jl`.
Support to 1:4 bytes of data:
```julia
numBytes = sizeof(vA[1]);
if (sizeof(vA[1]) == 1)
    vB = reinterpret(UInt8, vA);
elseif (sizeof(vA[1]) == 2)
    vB = reinterpret(UInt16, vA);
elseif (sizeof(vA[1]) == 4)
    vB = reinterpret(UInt32, vA);
elseif (sizeof(vA[1]) == 8)
    vB = reinterpret(UInt64, vA);
end
```

## Question 084
Extract all the contiguous `3x3` blocks from a random `5x5` matrix. (★★★)

````julia
numRows = 5;
numCols = 5;

mA = rand(1:9, numRows, numCols);

winRadius   = 1;
winReach    = 2 * winRadius;
winLength   = winReach + 1;

mB = [mA[ii:(ii + winReach), jj:(jj + winReach)] for ii in 1:(numRows - winReach), jj in 1:(numCols - winReach)]
````

````
3×3 Matrix{Matrix{Int64}}:
 [5 2 2; 1 1 3; 9 2 3]  [2 2 1; 1 3 9; 2 3 3]  [2 1 9; 3 9 3; 3 3 1]
 [1 1 3; 9 2 3; 4 5 1]  [1 3 9; 2 3 3; 5 1 3]  [3 9 3; 3 3 1; 1 3 2]
 [9 2 3; 4 5 1; 4 9 1]  [2 3 3; 5 1 3; 9 1 2]  [3 3 1; 1 3 2; 1 2 9]
````

## Question 085
Create a 2D array struct such that `mA[i, j] == mA[j, i]` (Symmetric matrix). (★★★)

````julia
struct SymmetricMatrix{T <: Number} <: AbstractArray{T, 2}
    numRows::Int
    data::Matrix{T}

    function SymmetricMatrix(mA::Matrix{T}) where {T <: Number}
        size(mA, 1) == size(mA, 2) || throw(ArgumentError("Input matrix must be square"))
        new{T}(size(mA, 1), Matrix(Symmetric(mA)));
    end

end

function Base.size(mA::SymmetricMatrix)
    (mA.numRows, mA.numRows);
end
function Base.getindex(mA::SymmetricMatrix, ii::Int)
    mA.data[ii];
end
function Base.getindex(mA::SymmetricMatrix, ii::Int, jj::Int)
    mA.data[ii, jj];
end
function Base.setindex!(mA::SymmetricMatrix, v, ii::Int, jj::Int)
    setindex!(mA.data, v, ii, jj);
    setindex!(mA.data, v, jj, ii);
end

mA = SymmetricMatrix(zeros(Int, 2, 2));
mA[1, 2] = 5;
mA
````

````
2×2 Main.##509.SymmetricMatrix{Int64}:
 0  5
 5  0
````

## Question 086
Consider a set of `p` matrices of shape `nxn` and a set of `p` vectors with length `n`. Compute the sum of of the `p` matrix vector products at once (Result is a vector of length `n`). (★★★)

````julia
# One could use `TensorOperations.jl` or `Einsum.jl` for a more elegant solution.

numRows = 5;
numMat  = 3;

tP = [randn(numRows, numRows) for _ in 1:numMat];
mP = [randn(numRows) for _ in 1:numMat];

vA = reduce(+, (mP * vP for (mP, vP) in zip(tP, mP)));
````

````julia
vB = zeros(numRows);
for ii in 1:numMat
    vB .+= tP[ii] * mP[ii];
end

vA == vB
````

````
true
````

## Question 087
Consider a `16x16` array, calculate the block sum (Block size is `4x4`). (★★★)

We solve a more general case for any size of blocks.

````julia
numRows = 16;
numCols = 8;

vBlockSize = [2, 4]; #<! [numRows, numCols] ./ vBlockSize == integer

mA = rand(numRows, numCols);

numBlocksVert   = numRows ÷ vBlockSize[1];
numBlocksHori   = numCols ÷ vBlockSize[2];
numBlocks       = numBlocksVert * numBlocksHori;

mA = reshape(mA, vBlockSize[1], :);
````

We number the blocks column wise and create their block index per column of the reshaped `mA`.

````julia
vBlockIdx = 1:numBlocks;
mBlockIdx = reshape(vBlockIdx, numBlocksVert, numBlocksHori);
mBlockIdx = repeat(mBlockIdx, 1, 1, vBlockSize[2]);
mBlockIdx = permutedims(mBlockIdx, (1, 3, 2));
vBlockIdx = mBlockIdx[:]; #<! Matches the block index per column of the reshaped `mA`.

vA = dropdims(sum(mA, dims = 1), dims = 1);
vB = zeros(numBlocks);

for ii = 1:(numBlocks * vBlockSize[2])
    vB[vBlockIdx[ii]] += vA[ii];
end
vB
````

````
16-element Vector{Float64}:
 4.293942375578189
 5.011959889339508
 3.5065033627614715
 1.7261945541943629
 4.3607783230449115
 4.20141297749792
 4.803316143760721
 4.2033617077661685
 4.817115411291166
 4.332475787897758
 4.188465664519672
 2.5816228190436923
 2.9558541770826747
 4.361950042868518
 4.683768539640318
 4.1478043190713265
````

## Question 088
Implement the simulation _Game of Life_ using arrays. (★★★)

````julia
numRows = 20;
numCols = 20;

gofKernel           = @kernel w -> w[-1, -1] + w[-1, 0] + w[-1, 1] + w[0, -1] + w[0, 1] + w[1, -1] + w[1, 0] + w[1, 1];
gofNumLives         = round(Int, 0.05 * numRows * numCols);
gofNumGenerations   = 50;

vI = randperm(numRows * numCols)[1:gofNumLives];

mG = zeros(UInt8, numRows, numCols);
mG[vI] .= UInt8(1);
mB = similar(mG);

heatmap(mG) #<! Initialization
````

````
      ┌────────────────────┐        
   20 │▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│  ┌──┐ 1
      │▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│  │▄▄│  
      │▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│  │▄▄│  
      │▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│  │▄▄│  
      │▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│  │▄▄│  
      │▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│  │▄▄│  
      │▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│  │▄▄│  
      │▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│  │▄▄│  
      │▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│  │▄▄│  
    1 │▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│  └──┘ 0
      └────────────────────┘        
       1                 20         
````

````julia
for ii in 1:numGridPts
    map!(gofKernel, mB, extend(mG, StaticKernels.ExtensionConstant(0))); #<! One may use `ExtensionCircular`
    for ii in eachindex(mB)
        mG[ii] = UInt8((mB[ii] >= 3) || ((mB[ii] > 0) && (mB[ii] == 2))); #<! Could be done with broadcasting
    end
end

heatmap(mG) #<! Final state
````

````
      ┌────────────────────┐        
   20 │▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│  ┌──┐ 1
      │▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│  │▄▄│  
      │▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│  │▄▄│  
      │▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│  │▄▄│  
      │▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│  │▄▄│  
      │▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│  │▄▄│  
      │▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│  │▄▄│  
      │▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│  │▄▄│  
      │▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│  │▄▄│  
    1 │▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│  └──┘ 0
      └────────────────────┘        
       1                 20         
````

TODO: Use O(1) implementation for Box Blur.

## Question 089
Get the `n` largest values of an array. (★★★)

````julia
vA = rand(10);
numValues = 3;

vA[partialsortperm(vA, 1:numValues, rev = true)]
````

````
3-element Vector{Float64}:
 0.8952977211878245
 0.8270952260280826
 0.7983301292636099
````

## Question 090
Given an arbitrary number of vectors, build the _Cartesian Product_ (Every combinations of every item). (★★★)

````julia
function CartesianProduct(tupleX)
    return collect(Iterators.product(tupleX...))[:];
end

vA = 1:3;
vB = 8:9;
vC = 4:5;

CartesianProduct((vA, vB, vC))
````

````
12-element Vector{Tuple{Int64, Int64, Int64}}:
 (1, 8, 4)
 (2, 8, 4)
 (3, 8, 4)
 (1, 9, 4)
 (2, 9, 4)
 (3, 9, 4)
 (1, 8, 5)
 (2, 8, 5)
 (3, 8, 5)
 (1, 9, 5)
 (2, 9, 5)
 (3, 9, 5)
````

## Question 091
Create an array which can be accessed like a _record array_ in _NumPy_. (★★★)

One could use `StructArrays.jl`.

## Question 092
Consider a large vector `vA`, compute `vA` to the power of 3 using 3 different methods. (★★★)

````julia
vA = rand(1000);
````

Method 001:

````julia
vB = vA .^ 3;
````

Method 002:

````julia
vC = [valA ^ 3 for valA in vA];
````

Method 003:

````julia
vD = zeros(length(vA));
for (ii, valA) in enumerate(vA)
    vD[ii] = valA * valA * valA;
end
````

````julia
vB ≈ vC ≈ vD
````

````
true
````

## Question 093
Consider two arrays `mA` and `mB` of shape `8x3` and `2x2`. Find rows of `mA` that contain elements of each row of `mB` regardless of the order of the elements in `mB`. (★★★)

The way I interpret the question is rows in `mA` which contain at least 1 element from each row of `mB`.

````julia
mA = rand(0:4, 8, 3);
mB = rand(0:4, 2, 2);
mC = [any(vA .== vB') for vB in eachrow(mB), vA in eachrow(mA)]; #<! General solution, will work for any size of `mA` and `mB`
vD = [all(vC) for vC in eachcol(mC)]
````

````
8-element Vector{Bool}:
 0
 1
 1
 1
 1
 0
 1
 1
````

In order to have a solution without the intermediate array `mC`

````julia
function Iterate2(iA; iterState = missing)
    if(ismissing(iterState))
        valA, iterState = iterate(iA);
    else
        valA, iterState = iterate(iA, iterState);
    end
    valB, iterState = iterate(iA, iterState);
    return (valA, valB), iterState
end

tT = (any(vA .== vB') for vB in eachrow(mB), vA in eachrow(mA));

iterState = missing;

vE = zeros(Bool, size(mA, 1));

for ii = 1:length(vD)
    global iterState;
    (valA, valB), iterState = Iterate2(tT; iterState = iterState);
    vE[ii] = valA && valB;
end

vD == vE
````

````
true
````

## Question 094
Considering a `10x3` matrix, extract rows with unequal values. (★★★)

````julia
mA = rand(1:3, 10, 3);
vD = [maximum(vA) != minimum(vA) for vA in eachrow(mA)]
````

````
10-element Vector{Bool}:
 1
 0
 1
 1
 1
 1
 1
 1
 1
 0
````

## Question 095
Convert a vector of ints into a matrix binary representation. (★★★)

````julia
vA = rand(UInt8, 10);
mB = zeros(Bool, length(vA), 8);

# See https://discourse.julialang.org/t/26663
for ii in 1:length(vA)
    vS = bitstring(vA[ii]);
    for jj in 1:size(mB, 2)
        mB[ii, jj] = vS[jj] == '1';
    end
end

mB
````

````
10×8 Matrix{Bool}:
 0  1  0  1  0  0  0  0
 1  0  1  1  0  0  1  1
 0  1  1  1  0  0  0  1
 1  0  1  1  1  0  1  1
 1  1  0  1  1  0  1  1
 1  0  0  0  1  0  1  0
 0  1  1  1  0  1  0  0
 0  1  1  0  1  1  0  1
 0  1  1  1  1  1  0  1
 1  0  1  0  0  0  1  0
````

## Question 096
Given a two dimensional array, extract unique rows. (★★★)

````julia
mA = UInt8.(rand(1:3, 10, 3));

vS = [reduce(*, bitstring(valA) for valA in vA) for vA in eachrow(mA)]; #<! Supports any array!
vU = unique(vS);
vI = [findfirst(valU .== vS) for valU in vU];
````

An alternative way:

````julia
vB = indexin(vU, vS);
vB == vI
````

````
true
````

## Question 097
Considering 2 vectors `vA` and `vB`, write the einsum equivalent (Using `Einsum.jl`) of inner, outer, sum, and mul function. (★★★)

````julia
vA = rand(5);
vB = rand(5);
````

Inner Product

````julia
@tullio tullioVal = vA[ii] * vB[ii];
tullioVal ≈ dot(vA, vB) #<! Inner product
````

````
true
````

Outer  Product

````julia
@tullio mTullio[ii, jj] := vA[ii] * vB[jj]; #<! Outer product
mTullio ≈ vA * vB'
````

````
true
````

Sum

````julia
@tullio tullioVal = vA[ii];
tullioVal ≈ sum(vA) #<! Sum
````

````
true
````

Multiplication

````julia
@tullio vTullio[ii] := vA[ii] * vB[ii];
vTullio ≈ vA .* vB #<! Multiplication
````

````
true
````

## Question 098
Considering a path described by two vectors `vX` and `vY, sample it using equidistant samples. (★★★)

The way I interpreted the question is to create sub segments of the same length.

````julia
numPts      = 100;
numSegments = 1000;

vX = sort(10 * rand(numPts));
vY = sort(10 * rand(numPts));

vR = cumsum(hypot.(diff(vX), diff(vY)));
pushfirst!(vR, 0.0);
vRSegment = LinRange(0.0, vR[end], numSegments);

struct LinearInterpolator1D{T <: Number} <: AbstractArray{T, 1}
    vX::Vector{T};
    vY::Vector{T};

    function LinearInterpolator1D(vX::Vector{T}, vY::Vector{T}) where {T <: Number}
        length(vX) == length(vX) || throw(ArgumentError("Input vectors must have the same length"));
        new{T}(vX, vY);
    end
end

function Base.size(vA::LinearInterpolator1D)
    size(vA.vX);
end
function Base.getindex(vA::LinearInterpolator1D, ii::Number)
    if (ii >= vA.vX[end])
        return vA.vY[end];
    end
    if (ii <= vA.vX[1])
        return vA.vY[1];
    end

    rightIdx = findfirst(vA.vX .>= ii);
    leftIdx = rightIdx - 1;

    tt = (ii - vA.vX[leftIdx]) / (vA.vX[rightIdx] - vA.vX[leftIdx]);

    return ((1 - tt) * vA.vY[leftIdx]) + (tt * vA.vY[rightIdx]);

end
function Base.setindex!(vA::LinearInterpolator1D, valX, valY, ii::Int, jj::Int)
    setindex!(sLinInterp.vX, valX, ii);
    setindex!(sLinInterp.vY, valY, ii);
end

vXInt = LinearInterpolator1D(vR, vX);
vYInt = LinearInterpolator1D(vR, vY);

vXSegment = [vXInt[intIdx] for intIdx in vRSegment];
vYSegment = [vYInt[intIdx] for intIdx in vRSegment];

hP = lineplot(vX, vY, canvas = DotCanvas, name = "Samples");
lineplot!(hP, vXSegment, vYSegment, name = "Interpolated");
hP
````

````
      ┌────────────────────────────────────────┐             
   10 │                                     .:'│ Samples     
      │                                 ...:'  │ Interpolated
      │                               .:'      │             
      │                            :'''        │             
      │                           .:           │             
      │                       ...:'            │             
      │                  ..:'''                │             
      │              ...:'                     │             
      │              :                         │             
      │           .:''                         │             
      │        .:''                            │             
      │      :''                               │             
      │    .:'                                 │             
      │  :'                                    │             
    0 │.:'                                     │             
      └────────────────────────────────────────┘             
       0                                     10              
````

## Question 099
Given an integer `n` and a 2D array `mA`, find the rows which can be interpreted as draws from a multinomial distribution with `n` (Rows which only contain integers and which sum to `n`). (★★★)

````julia
mA = rand([0, 0.5, 1, 2, 3], 15, 3);
sumVal = 4;
vI = [all(vA .== round.(vA)) && sum(vA) == sumVal for vA in eachrow(mA)];
````

## Question 100
Compute bootstrapped `95%` confidence intervals for the mean of a 1D array `vA`. Namely, resample the elements of an array with replacement `N` times, compute the mean of each sample and then compute percentiles over the means. (★★★)

````julia
numTrials   = 1000;
numSamples  = 100;
μ           = 0.5;

vA = μ .+ randn(numSamples);
tM = (mean(vA[rand(1:numSamples, numSamples)]) for _ in 1:numTrials);
quantile(tM, [0.025, 0.975])
````

````
2-element Vector{Float64}:
 0.37899085226017276
 0.776973204275843
````

---

*This page was generated using [Literate.jl](https://github.com/fredrikekre/Literate.jl).*

