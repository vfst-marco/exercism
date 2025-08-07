return function(n)

    assert(n > 0, 'Only positive numbers are allowed')
    

    function collatz(n)
      if n == 1 then
        return 0
      else
        if n % 2 == 0 then
          return 1 + collatz(n / 2)
        else
          return 1 + collatz(3 * n + 1)
        end
      end
    end
  return collatz(n)
end
