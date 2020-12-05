###################
## Game of life ###
###################
include("checkForLife.jl")
include("plotGrid.jl")
# define grid size
n = 5

A = zeros(Int8,n,n)
include_graphics = false

for i =1:3
    A[i,1] = 1
end 

x = 0
while x < 5 # Desired amount of iterations
    println(A)
    # update the value 
    A = checkForLife(A)
    
    if include_graphics
        plotGrid(A)
    end

    x+=1
end



