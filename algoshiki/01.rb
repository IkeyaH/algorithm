# https://algo-method.com/tasks/336

n, m = gets.chomp.split(' ').map(&:to_i)
r_ranges = gets.chomp.split(' ').map(&:to_i)

dp = Array.new(n) {Array.new(m, false)}

dp[0][0] = true

for i in 1...n do
  for j in 0...m do
    if dp[i - 1][j]
      dp[i][j] = true
    elsif (j > 0) && j - r_ranges[i - 1] >= 0 && dp[i - 1][j - r_ranges[i - 1]] == true
      dp[i][j] = true
    end
  end
end

puts dp[n - 1].count(true)
