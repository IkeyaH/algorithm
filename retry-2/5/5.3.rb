n = gets.to_i
scores = gets.chomp.split(' ').map(&:to_i)
max = scores.sum

dp = Array.new(n + 1) { Array.new(max + 1, false) }
dp[0][0] = true

for i in 1..n do
  for j in 0..max do
    if j >= scores[i - 1]
      dp[i][j] = dp[i - 1][j - scores[i - 1]] || dp[i - 1][j]
    else
      dp[i][j] = dp[i - 1][j]
    end
  end
end

puts dp[n].count(true)
