local triangle = {}

function triangle.kind(a, b, c)
    assert(a > 0, 'Input Error')
    assert(b > 0, 'Input Error')
    assert(c > 0, 'Input Error')
    assert(a + b > c, 'Input Error')
    assert(a + c > b, 'Input Error')
    assert(b + c > a, 'Input Error')
   
    if a == b and a == c then
      return 'equilateral'
    end
    if a == b or a == c or b == c then
      return 'isosceles'
    end
    return 'scalene'
end

return triangle
