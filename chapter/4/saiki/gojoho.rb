
def gojoho(a, b)
  return a if b == 0
  return gojoho(b, (a % b))
end

puts gojoho(18, 12)
