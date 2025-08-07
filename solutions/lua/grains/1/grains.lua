local grains = {}

function grains.square(n)
    return 2 ^ (n - 1)
end

function grains.total()
    sum = 0
    for i=1, 64
    do
      sum = sum + grains.square(i)
    end
  return sum
end

return grains
