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

return { 
  color_code = 
  function(color)
    for i, col in ipairs(colors) do
        if col == color then return i - 1 end
    end
  end,
  colors =
    function()
      return colors
    end
}
