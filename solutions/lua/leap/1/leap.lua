local leap_year = function(number)
    local div_by_4 = number % 4 == 0
    local div_by_100 = number % 100 == 0
    local div_by_400 = number % 400 == 0

    return div_by_400 or div_by_4 and not div_by_100
end

return leap_year
