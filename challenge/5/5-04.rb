# 以下は不完全な回答
# retry-2-5-5.4参照

n, target, k = gets.chomp.split(' ').map(&:to_i)
numbers = gets.chomp.split(' ').map(&:to_i)

dp = Array.new(n + 1) { Array.new(target + 1, Float::INFINITY) }

dp[0][0] = 0

for i in 1..n do
  for j in 0..target do
    if j < numbers[i - 1]
      dp[i][j] = dp[i - 1][j]
    else
      dp[i][j] = [dp[i - 1][j], dp[i - 1][j - numbers[i - 1]] + 1].min
    end
  end
end

puts dp[n][target] <= k ? 'Yes' : 'No'
