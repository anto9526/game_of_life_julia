function checkForLife(A,n)
    # This function checks which cells that
    # will live in the next iteration
    #######################
    # Assuming we have a square sized grid
    B = zeros(Int64,n,n)
    for i = 1:n
        for j = 1:n
            n_neighb = 0
            # check if it is a boundary index
            if i == 1
                idx = Int8[i,i+1]
            elseif i == n
                idx = Int8[i-1,i]
            else
                idx = Int8[i-1,i,i+1]
            end
            if j == 1
                jdx = Int8[j,j+1]
            elseif j == n
                jdx = Int8[j-1,j]
            else
                jdx = Int8[j-1,j,j+1]
            end
            n_neighb = sum(A[idx,jdx])
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
    return B
end
