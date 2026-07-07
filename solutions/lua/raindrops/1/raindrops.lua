return function(n)
  local a = ""
  if n % 3 == 0 then
    a = "Pling"
  end
  if n % 5 == 0 then 
    a = a .. "Plang"
  end
  if n % 7 == 0 then
    a = a .."Plong"
  end
  if a == "" then
    a = tostring(n)
  end
  return a
end

