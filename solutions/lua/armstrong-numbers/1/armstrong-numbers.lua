local ArmstrongNumbers = {}

function ArmstrongNumbers.is_armstrong_number(number)
  if number == 0 then
    return 0 == 0 ^ 1
  end

  local s = tostring(number)
  local count = #s

  local digits = {}
  local sum = 0
  for i = 1, count do
    local d = s:byte(i) - string.byte('0')
    sum = sum + (d ^ count)
  end

  return sum == number
end

return ArmstrongNumbers
