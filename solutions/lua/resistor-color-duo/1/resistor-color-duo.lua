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
function color_code(color)
    for i, col in ipairs(colors) do
        if col == color then return i - 1 end
    end
end

return {
  value = function(colors)
    return color_code(colors[1]) * 10 + color_code(colors[2])
  end
}
