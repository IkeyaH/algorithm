
def fivo(n, memo={})
  # ベースケース
  return memo[0] = 0 if n == 0
  return memo[1] = 1 if n == 1

  return memo[n] if memo.key?(n)

  return memo[n] = fivo((n-1), memo) + fivo((n-2), memo)
end

puts fivo(10)
