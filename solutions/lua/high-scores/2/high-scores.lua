return function(scores)
    return {
        scores = function ()
            return scores
        end,
        latest = function ()
            return scores[#scores]
        end,
        personal_best = function ()
            return math.max(table.unpack(scores))
        end,
        personal_top_three = function ()
            local result = {table.unpack(scores)}
            table.sort(result, function (a, b)
                return a > b
            end)
            while #result > 3 do
                table.remove(result)
            end
            return result
        end

    }
end
