n, m = gets.chomp.split(' ').map(&:to_i)
weights = gets.chomp.split(' ').map(&:to_i)
values = gets.chomp.split(' ').map(&:to_i)

v_max = values.sum

dp = Array.new(n + 1) { Array.new(v_max + 1, Float::INFINITY) }

dp[0][0] = 0

for i in 1..n do
  w = weights[i - 1]
  v = values[i - 1]

  for j in 0..v_max do
    if j >= v && dp[i - 1][j - v] + w <= m
      dp[i][j] = [dp[i - 1][j], dp[i - 1][j - v] + w].min
    else
      dp[i][j] = [dp[i - 1][j], dp[i][j]].min
    end
  end
end

arr = dp[n]

result = v_max.downto(0).find { |v| arr[v] < 10**9 }

puts result
