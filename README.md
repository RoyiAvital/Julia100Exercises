[![Visitors](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FRoyiAvital%2FStackExchangeCodes&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=Visitors+%28Daily+%2F+Total%29&edge_flat=false)](https://github.com/RoyiAvital/Julia100Exercises)

# 100 Julia Exercises with Solutions

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
 1.335846132e-314
 9.473510105e-315
 9.473550895e-315
 9.47399579e-315
 1.335904171e-314
 1.3359041947e-314
 1.3359042184e-314
 9.473992946e-315
 9.47399326e-315
 9.47399358e-315
````

Which is equivalent of

````julia
vA = Array{Float64, 1}(undef, 10)
````

````
10-element Vector{Float64}:
 1.5e-323
 1.6e-322
 6.95331311286057e-310
 4.94e-322
 4.94e-321
 1.235e-321
 1.0e-322
 1.5e-323
 1.6e-322
 2.0e-323
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
3×3 LinearAlgebra.Diagonal{Bool, Vector{Bool}}:
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
  0.757423  0.90535
 -1.42309   1.20069

[:, :, 2] =
 -0.325565  -0.341087
 -0.169036  -0.13069
````

## Question 013
Create a `5x5` array with random values and find the minimum and maximum values. (★☆☆)

````julia
mA = rand(5, 5);
minVal = minimum(mA)
````

````
0.22387297955883545
````

````julia
maxVal = maximum(mA)
````

````
0.9681837108020949
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
0.10430740159495046
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

By Tomer Arnon (https://github.com/tomerarnon):

````julia
numRows = 4;
numCols = 5;
mA = Int[ii ∈ (1, numRows) || jj ∈ (1, numCols) for ii in 1:numRows, jj in 1:numCols];
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

By Tomer Arnon (https://github.com/tomerarnon):

````julia
mA = Int[isodd(ii + jj) for ii in 1:8, jj in 1:8];
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
  1.20607    -1.13748    0.823965   0.850322
 -0.0389568  -0.163611   0.926198  -0.9654
  0.0334464   0.969688  -1.95059   -0.81439
  0.323745   -1.55141    0.780498   0.707899
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
Main.##300.sColor(0x7f, 0xe0, 0x77, 0x8d)
````

## Question 024
Multiply a `2x4` matrix by a `4x3` matrix. (★☆☆)

````julia
mA = rand(2, 4) * randn(4, 3)
````

````
2×3 Matrix{Float64}:
 -1.69224     0.207454  -0.348213
 -0.0328024  -0.194292  -0.171239
````

## Question 025
Given a 1D array, negate all elements which are between 3 and 8, in place. (★☆☆)

````julia
vA = rand(1:10, 8);
map!(x -> ((x > 3) && (x < 8)) ? -x : x, vA, vA)
````

````
8-element Vector{Int64}:
  8
 -5
  9
  3
 -6
 -5
 10
 -7
````

Julia allows Math like notation as well (See `Q0027`):

````julia
vA = rand(1:10, 8);
map!(x -> 3 < x < 8 ? -x : x, vA, vA)
````

````
8-element Vector{Int64}:
 10
  9
  8
  8
 -4
  1
 10
  8
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
 10000000000
       46656
        3125
````

````julia
try
    2 << vZ >> 2
catch e
    println(e)
end
````

````
MethodError(<<, (2, [10, 6, 5]), 0x0000000000007d24)

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
 0 + 10im
 0 + 6im
 0 + 5im
````

````julia
vZ / 1 / 1
````

````
3-element Vector{Float64}:
 10.0
  6.0
  5.0
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
 -1.0
  1.0
 -2.0
 -1.0
 -1.0
 -1.0
 -3.0
 -3.0
 -2.0
  2.0
````

## Question 030
Find common values between two arrays. (★☆☆)

````julia
vA = rand(1:10, 6);
vB = rand(1:10, 6);

vA[findall(in(vB), vA)]
````

````
6-element Vector{Int64}:
  2
 10
  2
 10
  8
  8
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
Yesterday: 2022-04-08
Today: 2022-04-09
Tomorrow: 2022-04-10

````

## Question 034
Display all the dates corresponding to the month of July 2016. (★★☆)

````julia
collect(Date(2016,7,1):Day(1):Date(2016,7,31))
````

````
31-element Vector{Dates.Date}:
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
Compute `((mA + mB) * (-mA / 2))` in place. (★★☆)

````julia
mA = rand(2, 2);
mB = rand(2, 2);
mA .= ((mA .+ mB) .* (.-mA ./ 2))
````

````
2×2 Matrix{Float64}:
 -0.412244  -0.467578
 -0.180105  -0.272612
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
 2.0  2.0  4.0
 3.0  1.0  1.0
 4.0  2.0  3.0
````

Option 2:

````julia
round.(mA .- 0.5) #<! Generates -0.0 for numbers smaller than 0.5
````

````
3×3 Matrix{Float64}:
 2.0  2.0  4.0
 3.0  1.0  1.0
 4.0  2.0  3.0
````

Option 3:

````julia
mA .÷ 1
````

````
3×3 Matrix{Float64}:
 2.0  2.0  4.0
 3.0  1.0  1.0
 4.0  2.0  3.0
````

Option 4:

````julia
mA .- rem.(mA, 1)
````

````
3×3 Matrix{Float64}:
 2.0  2.0  4.0
 3.0  1.0  1.0
 4.0  2.0  3.0
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

One could also generate _row like_ range using tranpose:

````julia
mA = repeat((0:4)', 5, 1);
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

In Julia the result of collect can be achieved directly using _Array Comprehension_:

````julia
vA = [x for x in 1:10];
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
sort(vA) #<! Use `sort!()` for inplace sorting
````

````
10-element Vector{Int64}:
  3
  3
  5
  7
  7
  7
  8
  9
 10
 10
````

## Question 041
Implement the `sum()` function manually. (★★☆)

````julia
vA = rand(100);

function MySum(vA::Vector{T}) where{T <: Number}
sumVal = vA[1];
for ii in 2:length(vA)
    sumVal += vA[ii];
end

return sumVal;

end

MySum(vA)
````

````
48.537414353199296
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
 [1.2198102844886598, 0.8691819574941603]
 [0.6172554595719763, 0.0866188511436483]
 [1.2598174331024279, 0.8511111052915155]
 [0.41518042921108855, 0.0221993255448236]
 [0.2951530478912789, 0.965721549303624]
 [0.7286702913050966, 0.44049202220018413]
 [1.236749583652066, 0.7202678911408135]
 [0.9202604422817915, 0.48747648762350454]
 [0.46875488383598934, 0.09208196173364079]
 [1.2090934232620685, 0.761937024298385]
````

In order to have the same output size:

````julia
mC = reduce(hcat, mB)';
````

## Question 045
Create random vector of size 10 and replace the maximum value by 0. (★★☆)

````julia
vA = randn(10);
````

In case of a single maximum or all different values:

````julia
vA[argmax(vA)] = 0;
vA
````

````
10-element Vector{Float64}:
 -1.851561592589276
  0.0
 -0.9081462686181941
 -1.1229524974071992
 -1.0371745175120426
  0.5239827523226771
 -0.10376274726301882
 -0.7086576853798374
  0.15431667813077293
  0.36597231741158176
````

General solution:

````julia
maxVal = maximum(vA);
vA .= (valA == maxVal ? 0 : valA for valA in vA); #<! Non allocating generator by using `.=`
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

By Tomer Arnon (https://github.com/tomerarnon):

````julia
mXY = [(ii, jj) for ii in 0:0.25:1, jj in 0:0.25:1]; #<! Also `tuple.(0:0.25:1, (0:0.25:1)')`
````

## Question 047
Given two vectors, `vX` and `vY`, construct the Cauchy matrix `mC`: `(Cij = 1 / (xi - yj))`. (★★☆)

````julia
vX = rand(5);
vY = rand(5);

mC = 1 ./ (vX .- vY')
````

````
5×5 Matrix{Float64}:
   4.34948     1.92686   3.41342  1.34913  1.36163
 -37.7124      3.80878  27.373    2.06275  2.09212
   2.48487     1.44612   2.1483   1.0944   1.10261
  -3.36296  -120.634    -4.26788  4.67403  4.82757
  -2.7321    -12.9953   -3.30066  6.88295  7.22115
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
[0.6826122845982936 0.5192965452164663 0.9860952682441186; 0.978788699489747 0.9102486524515176 0.8120342833140729; 0.9140200702682315 0.8115435431147521 0.055947672943274185]
````

## Question 050
Find the closest value to a given scalar in a vector. (★★☆)

````julia
inputVal = 0.5;
vA = rand(10);

vA[argmin(abs.(vA .- inputVal))]
````

````
0.4164882658950231
````

By Tomer Arnon (https://github.com/tomerarnon):

````julia
function ClosestValue(vA::Vector{T}, inputVal::T) where{T <: Number}
    return argmin(y -> abs(y - inputVal), vA);
end

ClosestValue(vA, inputVal)
````

````
0.4164882658950231
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
mD #<! Apply `sqrt.()` for the actual norm
````

````
5×5 Matrix{Float64}:
 0.0        0.529849  0.533383     0.085191   0.0674761
 0.529849   0.0       0.539715     0.302772   0.219417
 0.533383   0.539715  1.11022e-16  0.212654   0.401994
 0.085191   0.302772  0.212654     0.0        0.0375171
 0.0674761  0.219417  0.401994     0.0375171  0.0
````

## Question 053
Convert a float (32 bits) array into an integer (32 bits) in place. (★★☆)

````julia
vA = 9999 .* rand(Float32, 5);
vB = reinterpret(Int32, vA); #<! Creates a view
@. vB = trunc(Int32, vA) #<! Updates the byes in th view (Inplace for `vA`)
````

````
5-element reinterpret(Int32, ::Vector{Float32}):
  983
 7644
 8121
 5973
 7461
````

The above is equivalent of:
```julia
for ii in eachindex(vB)
    vB[ii] = trunc(Int32, vA[ii]);
end
vB
```

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
0.9213084845535593
2
0.6918722219874133
3
0.8725707935840159
4
0.5958441953220581
5
0.10790298709330681
6
0.9589979316827606
7
0.8263364553480945
8
0.6899584045881396
9
0.2375216575503002

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
 0.22697  0.0207947  -0.247765
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
 0.732867  0.0802497  0.304318
 0.738193  0.711796   0.771238
 0.162079  0.7315     0.426529
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
true
````

## Question 061
Find the 2nd nearest value from a given value in an array. (★★☆)

````julia
inputVal = 0.5;
vA = rand(10);

vA[sortperm(abs.(vA .- inputVal))[2]]
````

````
0.5602543551990966
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

By Tomer Arnon (https://github.com/tomerarnon):

````julia
vA[partialsortperm(abs.(vA .- inputVal), 2)]
````

````
0.5602543551990966
````

## Question 062
Considering two arrays with shape `(1, 3)` and `(3, 1)`, Compute their sum using an iterator. (★★☆)

````julia
vA = rand(1, 3);
vB = rand(3, 1);

sum(aVal + bVal for aVal in vA, bVal in vB)
````

````
11.428935841059424
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
[4, 8, 4, 7, 3]
[4, 8, 5, 8, 4]

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
vX: [5, 4, 5, 5, 1, 1, 3, 2, 4, 4]
vI: [14, 2, 5, 14, 13, 15, 6, 2, 10, 2]
vF: [0.0, 10.0, 0.0, 0.0, 5.0, 3.0, 0.0, 0.0, 0.0, 4.0, 0.0, 0.0, 1.0, 10.0, 1.0]

````

One could also use `counts()` from `StatsBase.jl`.

## Question 066
Considering an image of size `w x h x 3` image of type `UInt8`, compute the number of unique colors. (★★☆)

````julia
mI = rand(UInt8, 1000, 1000, 3);

numColors = length(unique([reinterpret(UInt32, [iPx[1], iPx[2], iPx[3], 0x00])[1] for iPx in eachrow(reshape(mI, :, 3))])); #<! Reshaping as at the moment `eachslice()` doesn't support multiple `dims`.
print("Number of Unique Colors: $numColors");
````

````
Number of Unique Colors: 971022
````

Another option:

````julia
numColors = length(unique([UInt32(iPx[1]) + UInt32(iPx[2]) << 8 + UInt32(iPx[3]) << 16 for iPx in eachrow(reshape(mI, :, 3))]));
print("Number of Unique Colors: $numColors");
````

````
Number of Unique Colors: 971022
````

Simpler way to slice a pixel:

````julia
numColors = length(unique([UInt32(mI[ii, jj, 1]) + UInt32(mI[ii, jj, 2]) << 8 + UInt32(mI[ii, jj, 3]) << 16 for ii in 1:size(mI, 1), jj in 1:size(mI, 2)]));
print("Number of Unique Colors: $numColors");
````

````
Number of Unique Colors: 971022
````

## Question 067
Considering a four dimensions array, get sum over the last two axis at once. (★★★)

````julia
mA = rand(2, 2, 2, 2);
sum(reshape(mA, (2, 2, :)), dims = 3)
````

````
2×2×1 Array{Float64, 3}:
[:, :, 1] =
 1.41862  1.08303
 1.99375  1.80971
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
vX: [4, 3, 3, 4, 5, 2, 3, 5, 4, 4]
vI: [1, 6, 3, 15, 13, 5, 5, 14, 7, 13]
vF: [4.0, 0.0, 3.0, 0.0, 2.5, 3.0, 4.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.5, 5.0, 4.0]

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
 2.3046457089354355
 1.5321878288670419
 2.3611837835729648
 1.6720347573355088
````

Alternative way:

````julia
vD = reshape(sum(mA[1:numDiagElements, :]' .* mB[:, 1:numDiagElements], dims = 1), numDiagElements)
````

````
4-element Vector{Float64}:
 2.3046457089354355
 1.5321878288670419
 2.3611837835729643
 1.6720347573355088
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
 0.0253066  0.0578434  0.245036  0.10566   0.128313
 0.538787   0.027032   0.113935  0.166183  0.049351
 0.490902   0.0289957  0.197145  0.262019  0.170993
 0.791761   0.418461   0.232067  0.205582  0.0501827
 0.61709    0.126556   0.147224  0.544224  0.0811581

[:, :, 2] =
 0.0552786  0.0941616  0.557706   0.0096415  0.440917
 0.66762    0.0529537  0.0127874  0.368139   0.269553
 0.389103   0.0246526  0.551285   0.28712    0.0644469
 0.747566   0.127425   0.0884657  0.130286   0.00610839
 0.512197   0.191283   0.254354   0.528399   0.0966842

[:, :, 3] =
 0.174052   0.0633047   0.0290718  0.0477022  0.461449
 0.43145    0.044583    0.0397083  0.522961   0.291885
 0.479104   0.00164765  0.643211   0.0190869  0.0849537
 0.0142636  0.889647    0.0569704  0.0136173  0.0202209
 0.358161   0.499842    0.526666   0.396949   0.0894064
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
UInt8[0x8a 0x39; 0x08 0x5d; 0xa9 0x3f]
UInt8[0x08 0x5d; 0x8a 0x39; 0xa9 0x3f]

````

## Question 073
Consider a set of 10 triplets describing 10 triangles (with shared vertices), find the set of unique line segments composing all the triangles. (★★★)

````julia
mA = rand(0:100, 10, 3); #<! Each row composes 3 veritces ([1] -> [2], [2] -> [3], [3] -> [1])
mC = [sort!([vC[mod1(ii, end)], vC[mod1(ii + 1, end)]]) for ii in 1:(size(mA, 2) + 1), vC in eachrow(mA)][:] #<! Sorted combinations of vertices
mC = unique(mC)
````

````
30-element Vector{Vector{Int64}}:
 [8, 61]
 [61, 74]
 [8, 74]
 [11, 22]
 [11, 76]
 [22, 76]
 [40, 94]
 [40, 84]
 [84, 94]
 [23, 25]
 [14, 25]
 [14, 23]
 [0, 34]
 [34, 95]
 [0, 95]
 [5, 87]
 [5, 35]
 [35, 87]
 [45, 79]
 [45, 93]
 [79, 93]
 [42, 88]
 [72, 88]
 [42, 72]
 [33, 50]
 [19, 33]
 [19, 50]
 [33, 59]
 [33, 40]
 [40, 59]
````

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
Min Distance: 0.17359580885397907

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
The minimum distance from the 1 -th point: 0.49924754495719714
The minimum distance from the 2 -th point: 0.9121971956924372
The minimum distance from the 3 -th point: 0.45582837870387133
The minimum distance from the 4 -th point: 0.19236584214073
The minimum distance from the 5 -th point: 0.04344746636278687

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
3
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
 [7 3 8; 7 1 2; 7 8 4]  [3 8 2; 1 2 9; 8 4 5]  [8 2 5; 2 9 9; 4 5 3]
 [7 1 2; 7 8 4; 9 2 3]  [1 2 9; 8 4 5; 2 3 4]  [2 9 9; 4 5 3; 3 4 4]
 [7 8 4; 9 2 3; 6 1 7]  [8 4 5; 2 3 4; 1 7 5]  [4 5 3; 3 4 4; 7 5 8]
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
2×2 Main.##300.SymmetricMatrix{Int64}:
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
 3.748234822363809
 3.171870981384324
 3.321254139347196
 3.8413572656931247
 3.9208525141288866
 5.394935729742489
 2.5354535893285357
 5.677131588719307
 4.3908979507404
 3.3855542151777165
 3.167629585929154
 5.099521098536441
 3.8636829563584847
 4.730649745212458
 3.717628033685399
 4.132300388500083
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
 0.9308144744273673
 0.9121778853679466
 0.9030546045293627
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
 1
 1
 0
 1
 1
 1
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
 1
 1
 1
 1
 0
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
 1  1  1  0  0  0  0  0
 1  1  0  0  0  0  1  0
 1  0  0  0  1  1  0  1
 1  1  0  1  0  0  1  1
 1  1  0  0  0  1  0  0
 1  1  0  1  1  1  0  0
 0  1  1  1  1  1  1  1
 0  1  0  0  0  0  0  0
 0  0  1  1  0  0  1  1
 0  1  1  0  0  1  1  0
````

By Tomer Arnon (https://github.com/tomerarnon):

````julia
mB = reverse!(reduce(hcat, digits.(vA, base = 2, pad = 8))', dims = 2);
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
Considering a path described by two vectors `vX` and `vY`, sample it using equidistant samples. (★★★)

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
   10 │                                    ...:│ Samples     
      │                                   .:   │ Interpolated
      │                                ..:'    │             
      │                             ...:       │             
      │                           :''          │             
      │                        ..:'            │             
      │                      .:'               │             
      │                    ..:                 │             
      │                   .:                   │             
      │                ..:'                    │             
      │             .:''                       │             
      │          .:''                          │             
      │        :''                             │             
      │       :'                               │             
    0 │...:''''                                │             
      └────────────────────────────────────────┘             
       0                                     10              
````

**Remark**: In order to be mathematically accurate the resolution of `vRSegment` must be high enough to be an integer factor of each segment.
It can be done if the resolution is `1 / (prod(vR))` which is easily infeasible with `Float64`. So this is a good enough approximation.

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
 0.2629943920259447
 0.6666867801452737
````

---

*This page was generated using [Literate.jl](https://github.com/fredrikekre/Literate.jl).*

