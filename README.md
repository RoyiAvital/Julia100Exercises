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

````julia
using Literate;
using LinearAlgebra;
using Statistics;
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
 1.11408467e-315
 1.02038532e-315
 1.111645885e-315
 1.0117010135e-314
 9.942418403e-315
 9.94241864e-315
 9.942418877e-315
 1.112690616e-315
 1.112690933e-315
 1.11269125e-315
````

Which is equivalent of

````julia
vA = Array{Float64, 1}(undef, 10)
````

````
10-element Vector{Float64}:
 1.11408467e-315
 1.02038532e-315
 1.111645885e-315
 1.0117010135e-314
 9.942418403e-315
 9.94241864e-315
 9.942418877e-315
 1.112690616e-315
 1.112690933e-315
 1.11269125e-315
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
 1.16694   1.35242
 0.527739  0.836723

[:, :, 2] =
  0.636307   0.125255
 -0.337548  -1.45923
````

## Question 013
Create a `5x5` array with random values and find the minimum and maximum values. (★☆☆)

````julia
mA = rand(5, 5);
minVal = minimum(mA)
````

````
0.11627165339593515
````

````julia
maxVal = maximum(mA)
````

````
0.9856597266425426
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
-0.31276232069197635
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
  1.90873    0.380382  -0.213327   0.709524
  0.845878  -0.899811   0.126485   1.07044
 -0.539166  -0.948521  -0.659701  -1.68479
 -1.02982   -0.38057   -0.192279   1.50654
````

## Question 023
Create a custom type that describes a color as four unsigned bytes (`RGBA`). (★☆☆)

````julia
mutable struct sColor
    R::UInt8;
    G::UInt8;
    B::UInt8;
    A::UInt8;
end

sMyColor = sColor(rand(UInt8, 4)...)
````

````
Main.##342.sColor(0xbb, 0x77, 0x41, 0xce)
````

## Question 024
Multiply a `2x4` matrix by a `4x3` matrix. (★☆☆)

````julia
mA = rand(2, 4) * randn(4, 3)
````

````
2×3 Matrix{Float64}:
 -0.762299   0.316353  0.782141
  0.493932  -0.198625  0.0322498
````

## Question 025
Given a 1D array, negate all elements which are between 3 and 8, in place. (★☆☆)

````julia
vA = rand(1:10, 8);
map!(x -> ((x > 3) && (x < 8)) ? -x : x, vA, vA)
````

````
8-element Vector{Int64}:
  1
  2
  9
 -7
 -5
 -6
  3
  1
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
         256
          27
````

````julia
try
    2 << vZ >> 2
catch e
    println(e)
end
````

````
MethodError(<<, (2, [10, 4, 3]), 0x0000000000007b71)

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
 0 + 4im
 0 + 3im
````

````julia
vZ / 1 / 1
````

````
3-element Vector{Float64}:
 10.0
  4.0
  3.0
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
 -2.0
  1.0
  2.0
  1.0
  4.0
  3.0
 -1.0
  1.0
 -1.0
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
1-element Vector{Int64}:
 7
````

---

*This page was generated using [Literate.jl](https://github.com/fredrikekre/Literate.jl).*

