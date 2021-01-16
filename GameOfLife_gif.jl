###################
## Game of life ###
###################
include("checkForLife.jl")
include("extract_shapes.jl")
using Plots
gr()
# define grid size
n = 30
m = fld(n,2)
#print(n_mid)
A = zeros(Int64,n,n)
idxs =[(m+1,m),(m,m),(m-1,m),(m,m-1),(m+1,m+1)]
for  idx in idxs
    i,j = idx
    A[i,j] = 1
end

living = true
anim = @animate for x in 1:200 # Desired amount of iterations
    xpl,ypl = extract_shapes(A,n)
    plot(xpl, ypl, seriestype=:shape,leg=false,
     xlims = (0,n), ylims =(0,n),
     title = "Game of life iteration : $x" )
    A, living = checkForLife(A,n)
    if !living
        break
    end
end
#gif(anim, "game_of_life_5fps.gif", fps = 5)
gif(anim,fps = 5)

