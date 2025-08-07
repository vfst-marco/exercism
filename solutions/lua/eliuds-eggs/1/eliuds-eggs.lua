local EliudsEggs = {}

function EliudsEggs.egg_count(number)
    local num = number
    local count = 0
    while num > 0 do
      if(num % 2 == 1) then
        count = count + 1
      end
      num = num // 2
    end
  return count
end

return EliudsEggs
