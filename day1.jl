
input = open("input_day1.txt","r") do datafile
    [parse.(Float64, split(line)) for line in eachline(datafile)]
end

function day1_part1(day1_input)
    for i in 1:length(day1_input), j in 1:length(day1_input)
        if i != j
            sum_ij = day1_input[i][1] + day1_input[j][1]
            if sum_ij == 2020
                return((day1_input[i][1] * day1_input[j][1]))
            end
        end
    end
end


function day1_part2(day1_input)
    l = length(day1_input)
    for i in 1:l, j in 1:l
        for k in 1:l
            if i != k
                sum_ijk = day1_input[i][1] + day1_input[j][1] + day1_input[k][1]
                if sum_ijk == 2020
                    return(convert(BigInt, (day1_input[i][1] * day1_input[j][1] * day1_input[k][1])))
                end
            end
        end
    end
end

print(day1_part1(input))
print("\n")
print(day1_part2(input))