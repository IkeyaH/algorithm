# 問題 5:　最小個数部分和問題

n, m = gets.chomp.split(' ').map(&:to_i)
arr = gets.chomp.split(' ').map(&:to_i)

dp = Array.new(n + 1) { Array.new(m + 1, Float::INFINITY) }

dp[0][0] = 0

for i in 1..n do
  target = arr[i - 1]
  for j in 0..m do
    if j >= target
      dp[i][j] = [
        dp[i - 1][j - target] + 1,
        dp[i - 1][j]
      ].min
    else
      dp[i][j] = dp[i - 1][j]
    end
  end
end

pp dp
