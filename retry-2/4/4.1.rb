
def tribo(n, memo=[])
  # 初期値
  return memo[n] = 0 if n == 0
  return memo[n] = 0 if n == 1
  return memo[n] = 1 if n == 2

  return memo[n] if memo[n]

  return memo[n] = tribo(n - 1, memo) + tribo(n - 2, memo) + tribo(n - 3, memo)
end

puts tribo(100)
