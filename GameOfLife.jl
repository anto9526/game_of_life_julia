###################
## Game of life ###
###################
include("checkForLife.jl")
include("extract_shapes.jl")
using Plots
pyplot()
# define grid size
n = 5

A = ones(Int64,n,n)
include_graphics = true
x = 0
while x < 10  # Desired amount of iterations
    # update the value 
    A = checkForLife(A)
    if include_graphics 
        xpl,ypl = extract_shapes(A)
        plot(xpl, ypl, seriestype=:shape)
        #sleep(1) 
    end
    x+=1
end


print("done")
