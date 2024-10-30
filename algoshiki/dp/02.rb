# https://algo-method.com/tasks/337

n, m = gets.chomp.split(' ').map(&:to_i)
weights = gets.chomp.split(' ').map(&:to_i)

dp = Array.new(n + 1) {Array.new(m + 1, false)}
dp[0][0] = true

for i in 1..n do
  for j in 0..m do
    if j >= weights[i - 1]
      dp[i][j] = dp[i - 1][j] || dp[i - 1][j - weights[i - 1]]
    else
      dp[i][j] = dp[i - 1][j]
    end
  end
end


if dp[n][m] == true
  puts 'Yes'
else
  puts 'No'
end
