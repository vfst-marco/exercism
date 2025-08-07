local SquareRoot = {}

function SquareRoot.square_root(radicand)
    -- return radicand ^ 0.5
    function internal(xn)
      xn1 = 0.5 * (xn + radicand / xn)
      if xn1 * xn1 == radicand then
        return xn1
      else
        return internal(xn1)
      end
    end
    return internal(radicand)
end

return SquareRoot
