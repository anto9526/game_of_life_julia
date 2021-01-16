function checkForLife(A,n)
    # This function checks which cells that
    # will be alive in the next iteration
    #######################
    # Assuming we have a square sized grid
    B = zeros(Int64,n,n)
    for i = 1:n
        for j = 1:n
            n_neighb = sum(A[within_bounds([i-1,i,i+1],n),within_bounds([j-1,j,j+1],n)])
            n_neighb -= A[i,j] # we dont want to include its own index
            # if cell lives and has two neighbors it survives
            if (A[i,j] == 1 && n_neighb == 2) 
            # if cell lives and has two neighbors it survives
                B[i,j] = 1
            elseif n_neighb == 3
            # if 3 neighbours cell stays alive or is born
                B[i,j] = 1
            end
            # else cell dies or remians dead
        end
    end
    living = (A != B) # break if terminal state is reached
    return B,living
end

function within_bounds(indexes, upper_bound)
    # returns indexes which are within bounds, lower bound is 1 
    return [temp for temp in indexes if  (1 <= temp <=upper_bound )]
end