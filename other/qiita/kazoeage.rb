# https://qiita.com/drken/items/a5e6fe22863b7992efdb

n, m = gets.chomp.split(' ').map(&:to_i)
arr = gets.chomp.split(' ').map(&:to_i)

dp = Array.new(n + 1) { Array.new(m + 1, 0) }
dp[0][0] = 1


for i in 1..n do
  target = 0
  target = arr[i - 1] if i > 0
  for j in 0..m do
    if j >= target
      dp[i][j] = dp[i - 1][j - target] + dp[i - 1][j]
    else
      dp[i][j] = dp[i - 1][j]
    end
  end
end

# 5 12
# 7 5 3 1 8
# 2

# 4 5
# 4 1 1 1
# 3

pp dp
