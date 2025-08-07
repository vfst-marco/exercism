local EliudsEggs = {}

function EliudsEggs.egg_count(number)
    local num = number
    local count = 0
    while num > 0 do
      count = count + (num % 2)
      num = num // 2
    end
  return count
end

return EliudsEggs
