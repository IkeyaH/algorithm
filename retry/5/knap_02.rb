n, m = gets.chomp.split(' ').map(&:to_i)

weights = []
values = []

n.times do
  w, v = gets.chomp.split(' ').map(&:to_i)
  weights << w
  values << v
end

dp = Array.new(n + 1) { Array.new(m + 1, 0) }

for i in 1..n do
  for j in 0..m do
    if j < weights[i - 1]
      dp[i][j] = dp[i - 1][j]
    else
      dp[i][j] = [dp[i-1][j], dp[i-1][j - weights[i-1]] + values[i - 1]].max
    end
  end
end

puts dp[n][m]
