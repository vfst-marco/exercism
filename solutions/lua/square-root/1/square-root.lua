local SquareRoot = {}

function SquareRoot.square_root(radicand)
    -- return radicand ^ 0.5
    function internal(xn)
      xn1 = 0.5 * (xn + radicand / xn)
      if (math.abs(xn - xn1) < 0.0000001) then
        return math.floor(xn1 + 0.5)
      else
        return internal(xn1)
      end
    end
    return internal(radicand)
end

return SquareRoot
