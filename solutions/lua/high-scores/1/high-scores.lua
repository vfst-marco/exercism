return function(scores)
    return {
        scores = function ()
            return scores
        end,
        latest = function ()
            return scores[#scores]
        end,
        personal_best = function ()
            local max = 0
            for i = 1, #scores do
                if max < scores[i] then
                    max = scores[i]
                end
            end
            return max
        end,
        personal_top_three = function ()
            local result = {}
            for i = 1, #scores do
               table.insert(result, scores[i]) 
            end
            table.sort(result, function (a, b)
                return b<a
            end)
            while #result > 3 do
                table.remove(result, #result)
            end
            return result
        end

    }
end
