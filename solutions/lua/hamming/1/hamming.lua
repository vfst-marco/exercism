local Hamming = {}

function Hamming.compute(a, b)
    if(string.len(a) ~= string.len(b)) then
        return -1
    end
    local differences = 0
    for i = 1, string.len(a) do
        if string.byte(a, i) ~= string.byte(b, i) then
            differences = differences + 1
        end
    end
    return differences
end

return Hamming
