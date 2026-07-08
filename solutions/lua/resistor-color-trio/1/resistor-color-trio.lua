local colors = {
    "black",
    "brown",
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "violet",
    "grey",
    "white",
}
local function color_code(color)
    for i, col in ipairs(colors) do
        if col == color then return i - 1 end
    end
end

local function value(c1, c2)
  return color_code(c1) * 10 + color_code(c2)
end

local function shorten_value(v)
  if v == 0 then
    return v, "ohms"
  elseif v % 1000000000 == 0 then
    return v / 1000000000, "gigaohms"
  elseif v % 1000000 == 0 then
    return v / 1000000, "megaohms"
  elseif v % 1000 == 0 then
    return v / 1000, "kiloohms"
  else
    return v, "ohms"
  end
end

return {
  label = function(c1, c2, c3)
    local exp = color_code(c3)
    local v = value(c1, c2) * 10 ^ exp
    return shorten_value(v)
  end
}
