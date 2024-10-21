# トリボナッチ
# t0 = 0, t1 = 0, t2 = 1, tn = tn - 3 + tn - 2 + tn - 1

def tribonacci(n, memo = {})
  # ベースケース
  return memo[n] = 0 if n == 0 || n == 1
  return memo[n] = 1 if n == 2

  # memoにすでにある場合はそのまま返す
  return memo[n] if memo.key?(n)

  return memo[n] = (
    tribonacci((n - 3), memo) +
    tribonacci((n - 2), memo) +
    tribonacci((n - 1), memo)
  )
end

puts tribonacci(6, {})
