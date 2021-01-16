###################
## Game of life ###
###################
include("checkForLife.jl")
include("extract_shapes.jl")
using Plots
pyplot()
# define grid size
n = 40

m = fld(n,2)
#print(n_mid)
A = zeros(Int64,n,n)
idxs =[(m+1,m),(m,m),(m-1,m),(m,m-1),(m+1,m+1)]
for  idx in idxs
    i,j = idx
    A[i,j] = 1
end
include_graphics = true
x = 0
while x < 5 # Desired amount of iterations
    # ToDo fix graphics such that the plots are created i a single frame and
    # continously cleared for every iteration
    if include_graphics 
        PyPlot.clf()
        xpl,ypl = extract_shapes(A,n)
        Plots.display(plot(xpl, ypl, seriestype=:shape,leg=false,
         xlims = (0,n), ylims =(0,n)))

        sleep(0.1) 
    end
    A = checkForLife(A,n)
    x+=1
end

print("done")
