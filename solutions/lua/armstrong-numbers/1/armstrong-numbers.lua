local ArmstrongNumbers = {}

function ArmstrongNumbers.is_armstrong_number(number)
    local power = #tostring(number)
    local sum = 0
    local num = number
    while num > 0 do
      sum = sum + ((num % 10) ^ power)
      num = num // 10
    end
    return sum == number
end

return ArmstrongNumbers
