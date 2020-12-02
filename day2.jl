using DataFrames
using Query
using CSV

input_day2 = CSV.read("input_day2.csv", DataFrame)  



function day2_part1(input_df)
    matches = zeros(0)
    l = nrow(input_df)
    for i in 1:l
        up = input_df[i, "up"]
        down = input_df[i, "down"]
        letter = input_df[i, "letter"]
        password = input_df[i, "password"]
        
        pwd_matches = length(collect(eachmatch(Regex(letter), password)))
        if down <= pwd_matches <= up
            append!(matches, 1)
        end
    end
    return sum(matches)
end

function day2_part2(input_df)
    matches = zeros(0)
    l = nrow(input_df)
    for i in 1:l
        up = input_df[i, "up"]
        down = input_df[i, "down"]
        letter = input_df[i, "letter"]
        password = input_df[i, "password"]
        up_match = false
        down_match = false

        if string(password[up]) == letter
            up_match = true
        end

        if string(password[down]) == letter
            down_match = true
        end

        if !((up_match + down_match) == 2)
            if up_match
                append!(matches, 1)
            end
            if down_match
                append!(matches, 1)
            end
        end
    end
    return sum(matches)
end

print(day2_part1(input_day2))
print("\n")
print(day2_part2(input_day2))