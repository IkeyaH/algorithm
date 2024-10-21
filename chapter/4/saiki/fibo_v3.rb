
def fibo3(n, memo = {})
  p memo
  return memo[n] = n if n <= 1
  return memo[n] if memo.key?(n)

  return memo[n] = fibo3(n - 1, memo) + fibo3(n - 2, memo)
end

puts fibo3(0, {})
