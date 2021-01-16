
function extract_shapes(A,n)
#plot grid with living cells filled
    #println("make plot function")
    x = Array{Float64}(undef, 0, 1)
    y = Array{Float64}(undef, 0, 1)
    for i in 1:n
        for j in 1:n
            if(A[i,j]==1)
                x = vcat(x,[i-1,i-1,i,i,NaN])
                y = vcat(y,[j-1,j,j,j-1,NaN])
            end
        end
    end

    return x, y

end