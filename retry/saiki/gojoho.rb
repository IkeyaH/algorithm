# n, m の最大公約数を知る
# n >= m

def gojoho(n, m)
  return m if n % m == 0
  return gojoho(m, (n % m))
end

puts gojoho(1677, 1591)
